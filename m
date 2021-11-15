Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF213450367
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225812.390045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma8D-0004if-Fe; Mon, 15 Nov 2021 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225812.390045; Mon, 15 Nov 2021 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma8D-0004fo-CC; Mon, 15 Nov 2021 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 225812;
 Mon, 15 Nov 2021 11:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mma8C-00043I-9K
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:26:36 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e37f7629-4606-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:26:35 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:46826)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mma8A-000HpV-g1 (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 11:26:34 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 74FDE1FDB0;
 Mon, 15 Nov 2021 11:26:33 +0000 (GMT)
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
X-Inumbo-ID: e37f7629-4606-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Subject: Re: [PATCH 3/3] x86/cpufreq: Drop opencoded CPUID handling from
 powernow
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-4-andrew.cooper3@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Message-ID: <a9480750-6aee-4bb1-5ddf-edf308e7e387@srcf.net>
Date: Mon, 15 Nov 2021 11:26:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112182818.30223-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 12/11/2021 18:28, Andrew Cooper wrote:
> Xen already collects CPUID.0x80000007.edx by default, meaning that we can
> refer to per-cpu data directly.  This also avoids the need IPI the onlining
> CPU to identify whether Core Performance Boost is available.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>
> I don't think the printk() is very helpful.  I could be talked into retaining
> it as a prink_once(), but (irrespective of cpufreq_verbose), it doesn't want
> repeating on each CPU because it will either be all or none of them.

I should note that the printk() is also false.  Nothing AFAICT
synchronises the software turbo setting with hardware, until the next
time set-turbo is called.

~Andrew

