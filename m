Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5041E20C2
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 13:17:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdXaA-0006et-Fe; Tue, 26 May 2020 11:17:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vgeY=7I=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdXa9-0006eo-7Y
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 11:17:17 +0000
X-Inumbo-ID: 74aace80-9f42-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74aace80-9f42-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 11:17:16 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:44426
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdXa5-0002ey-JY (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Tue, 26 May 2020 12:17:13 +0100
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
Date: Tue, 26 May 2020 12:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/05/2020 07:49, Jan Beulich wrote:
> Respective Core Gen10 processor lines are affected, too.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>      case 0x000506e0: /* errata SKL167 / SKW159 */
>      case 0x000806e0: /* erratum KBL??? */
>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */

This is marred in complexity.

The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
no longer exists/works.  This applies to IceLake systems, but possibly
not their initial release configuration (hence, via a later microcode
update).

HLE is also disabled in microcode on all older parts for errata reasons,
so in practice it doesn't exist anywhere now.

I think it is safe to drop this workaround, and this does seem a more
simple option than encoding which microcode turned HLE off (which sadly
isn't covered by the spec updates, as even when turned off, HLE is still
functioning according to its spec of "may speed things up, may do
nothing"), or the interactions with the CPUID hiding capabilities of
MSR_TSX_CTRL.

~Andrew

>          *array_size = (cpuid_eax(0) >= 7 && !cpu_has_hypervisor &&
>                         (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_HLE)));
>          return &hle_bad_page;


