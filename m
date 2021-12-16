Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8247712B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247910.427541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpNS-0005K2-6r; Thu, 16 Dec 2021 11:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247910.427541; Thu, 16 Dec 2021 11:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpNS-0005Hl-3s; Thu, 16 Dec 2021 11:56:50 +0000
Received: by outflank-mailman (input) for mailman id 247910;
 Thu, 16 Dec 2021 11:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxpNQ-0005Hf-Vz
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:56:48 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3df9fb42-5e67-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:56:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43346)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxpNN-000LCm-7d (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:56:45 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 201301FAC8;
 Thu, 16 Dec 2021 11:56:45 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3df9fb42-5e67-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <948d4e68-5c8d-77c7-7ec1-56908248b185@srcf.net>
Date: Thu, 16 Dec 2021 11:56:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] x86/cpuid: Introduce dom0-cpuid command line
 option
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211215222115.6829-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/12/2021 22:21, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index e11f5a3c9a6b..83a80ba6de70 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -116,6 +116,23 @@ static int __init parse_xen_cpuid(const char *s)
>  }
>  custom_param("cpuid", parse_xen_cpuid);
>  
> +static bool __initdata dom0_cpuid_cmdline;
> +static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
> +static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
> +
> +static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
> +{
> +    __set_bit(feat, val ? dom0_enable_feat : dom0_disable_feat);

Based on Jan's observation in v1, I've folded this delta in:

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 83a80ba6de70..39baeae9a6cd 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -122,7 +122,8 @@ static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
 
 static void __init _parse_dom0_cpuid(unsigned int feat, bool val)
 {
-    __set_bit(feat, val ? dom0_enable_feat : dom0_disable_feat);
+    __set_bit  (feat, val ? dom0_enable_feat  : dom0_disable_feat);
+    __clear_bit(feat, val ? dom0_disable_feat : dom0_enable_feat );
 }
 
 static int __init parse_dom0_cpuid(const char *s)

~Andrew

