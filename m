Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26098478ECF
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 16:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248725.429026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEj7-000263-DH; Fri, 17 Dec 2021 15:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248725.429026; Fri, 17 Dec 2021 15:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myEj7-00023F-7q; Fri, 17 Dec 2021 15:00:53 +0000
Received: by outflank-mailman (input) for mailman id 248725;
 Fri, 17 Dec 2021 15:00:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myEj6-000234-9R
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 15:00:52 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e2da664-5f4a-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 16:00:50 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43732)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myEiw-000AuQ-9Y (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 15:00:42 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id AF8921FD00;
 Fri, 17 Dec 2021 15:00:42 +0000 (GMT)
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
X-Inumbo-ID: 1e2da664-5f4a-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <b083029a-6669-d03c-4b8c-c3b1ed28143c@srcf.net>
Date: Fri, 17 Dec 2021 15:00:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <efb282e9-4ddd-22d1-a2e4-36a4d0964ada@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/5] VMX: sync VM-exit perf counters with known VM-exit
 reasons
In-Reply-To: <efb282e9-4ddd-22d1-a2e4-36a4d0964ada@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 12:05, Jan Beulich wrote:
> --- a/xen/include/asm-x86/hvm/vmx/vmx.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmx.h
> @@ -220,6 +220,8 @@ static inline void pi_clear_sn(struct pi
>  #define EXIT_REASON_XSAVES              63
>  #define EXIT_REASON_XRSTORS             64
>  
> +#define EXIT_REASON_LAST                EXIT_REASON_XRSTORS
> +

Given the problems with sentinals like this in the domctl/sysctl
headers, I think this scheme would be less fragile if EXIT_REASON was an
enum.  (Also, we seriously need to reduce the scope of these headers. 
It's only just dawned on me why Intel uses EXIT_* and AMD uses VMEXIT_*)

Alternatively, what about simply this:

 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
+/* Remember to update VMX_PERF_EXIT_REASON_SIZE too. */

?

This avoids having yet another sentinel in the mix, and will be visible
in *every* patch review.  It also gets rid of the ifdefary in the vmexit
handler.

Another good move might be to have perfc_incra() have a printk_once()
for out-of-range indices.  That way, people using perfcounters will have
an easier time noticing if something is wrong.

~Andrew

