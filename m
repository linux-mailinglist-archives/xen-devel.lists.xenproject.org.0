Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A01DC1FA
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 00:17:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbX1n-0000Wx-Pz; Wed, 20 May 2020 22:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBXs=7C=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbX1m-0000Ws-D0
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 22:17:30 +0000
X-Inumbo-ID: b168c048-9ae7-11ea-b9cf-bc764e2007e4
Received: from ppsw-30.csi.cam.ac.uk (unknown [131.111.8.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b168c048-9ae7-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 22:17:29 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:53322
 helo=[192.168.1.219])
 by ppsw-30.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbX1i-000Ef4-dM (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 20 May 2020 23:17:26 +0100
Subject: Re: [PATCH v5] x86: clear RDRAND CPUID bit on AMD family 15h/16h
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f76749b-54bd-7c39-6c90-279ce25cb57c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2cf9d9e-492d-fa24-0e9c-bf62b6704b34@citrix.com>
Date: Wed, 20 May 2020 23:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4f76749b-54bd-7c39-6c90-279ce25cb57c@suse.com>
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

On 18/05/2020 14:19, Jan Beulich wrote:
> Inspired by Linux commit c49a0a80137c7ca7d6ced4c812c9e07a949f6f24:
>
>     There have been reports of RDRAND issues after resuming from suspend on
>     some AMD family 15h and family 16h systems. This issue stems from a BIOS
>     not performing the proper steps during resume to ensure RDRAND continues
>     to function properly.
>
>     Update the CPU initialization to clear the RDRAND CPUID bit for any family
>     15h and 16h processor that supports RDRAND. If it is known that the family
>     15h or family 16h system does not have an RDRAND resume issue or that the
>     system will not be placed in suspend, the "cpuid=rdrand" kernel parameter
>     can be used to stop the clearing of the RDRAND CPUID bit.
>
>     Note, that clearing the RDRAND CPUID bit does not prevent a processor
>     that normally supports the RDRAND instruction from executing it. So any
>     code that determined the support based on family and model won't #UD.
>
> Warn if no explicit choice was given on affected hardware.
>
> Check RDRAND functions at boot as well as after S3 resume (the retry
> limit chosen is entirely arbitrary).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Still slightly RFC, and still in particular because of the change to
> parse_xen_cpuid(): Alternative approach suggestions are welcome. But now
> also because with many CPUs there may now be a lot of warnings in case
> of issues.

It would still be nice if we could find a better way of determining
whether S3 is supported on the platform, which would at least let us
sort server and client platforms.

A straight string search for _S3 in the DSDT does look to be effective,
on a sample of 5 boxes I've tried.

~Andrew

