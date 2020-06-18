Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D641FF9B8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 18:51:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlxlO-0008Rr-40; Thu, 18 Jun 2020 16:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlxlM-0008Rl-E0
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 16:51:40 +0000
X-Inumbo-ID: fab7c282-b183-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab7c282-b183-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 16:51:39 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: f1riQasH8QZqtsOlROjpTqsXBW2rrs/N96EWdeBNYx49E9591RdHGoYYVog2fay6LCLS5d9gou
 RbvX4DQrtwUYGD3RXZFeyY0DGdYL77Jb81CVRKjhTRV31eBYO80mb63EKu/EtzygiNhumJSBc6
 U59lIoZkq/s/vUkSp91nfLUTAK5vxE9X4vGHL6K9OcXfd6qhTOe027j4fBYOpHkF8Ynf9pfl3c
 B05GhE0//ypY/2qo6fXAscrcpixmvgRHYkhLthyhn4X5ZqIkUdHn8kheTe6kuY9FNO4Eb7l9wm
 ljE=
X-SBRS: 2.7
X-MesageID: 20394136
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20394136"
Subject: Re: [PATCH] x86/cpuid: Expose number of vCPUs in CPUID.1.EBX
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bc49dfbd-ffc0-3548-1e46-22b808442679@citrix.com>
Date: Thu, 18 Jun 2020 17:51:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/06/2020 17:22, Hubert Jasudowicz wrote:
> When running under KVM (or presumably other hypervisors) we enable
> the CPUID.1.EDX.HTT flag, thus indicating validity of CPUID.1.EBX[23:16]
> - maximum number of logical processors which the guest reads as 0.
>
> Although this method of topology detection is considered legacy,
> Windows falls back to it when CPUID.0BH.EBX is 0.
>
> CPUID.1.EBX[23:16] being equal to 0, triggers memory corruption in
> ntoskrnl.exe as Windows assumes that number of logical processors would
> be at least 1. Memory corruption manifests itself while mapping
> framebuffer for early graphical subsystem, causing BSOD.
>
> This patch fixes running nested Windows (tested on 7 and 10) with KVM as
> L0 hypervisor, by setting the value to maximum number of vCPUs in domain.
>
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>

I'm afraid fixing guest topology is more complicated than just this.  On
its own, I'm not sure if this is safe for VMs migrating in.

While I agree that Xen's logic is definitely broken, I suspect the
conditions for the BSOD are more complicated than this, because Windows
does work fine when there is no KVM in the setup described.

~Andrew

