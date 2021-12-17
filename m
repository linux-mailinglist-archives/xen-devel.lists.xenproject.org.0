Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F89478EDC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 16:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248731.429036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myElA-0002mq-Rg; Fri, 17 Dec 2021 15:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248731.429036; Fri, 17 Dec 2021 15:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myElA-0002kE-Nk; Fri, 17 Dec 2021 15:03:00 +0000
Received: by outflank-mailman (input) for mailman id 248731;
 Fri, 17 Dec 2021 15:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6k1w=RC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1myEl9-0002k6-45
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 15:02:59 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b97f011-5f4a-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 16:02:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43734)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1myEl7-000BxV-97 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 17 Dec 2021 15:02:57 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 92DE41FD00;
 Fri, 17 Dec 2021 15:02:57 +0000 (GMT)
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
X-Inumbo-ID: 6b97f011-5f4a-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <60deae51-6ccd-dd90-869a-db6099e21002@srcf.net>
Date: Fri, 17 Dec 2021 15:02:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <c94bc336-fdee-43af-540e-06e0904d8db7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 4/5] SVM: sync VM-exit perf counters with known VM-exit
 reasons
In-Reply-To: <c94bc336-fdee-43af-540e-06e0904d8db7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 12:06, Jan Beulich wrote:
> This has gone out of sync over time, resulting in NPF and XSETBV exits
> incrementing the same counter. Introduce a simplistic mechanism to
> hopefully keep things in better sync going forward.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Given their large (and growing) number, I wonder whether we shouldn't
> fold "SVMexits" and "vmexits". They can't both be active at the same
> time.

Oh yeah - that's just silly having them split like this, especially as
there's no associated element name.

> --- a/xen/include/asm-x86/perfc_defn.h
> +++ b/xen/include/asm-x86/perfc_defn.h
> @@ -11,8 +11,8 @@ PERFCOUNTER_ARRAY(exceptions,
>  PERFCOUNTER_ARRAY(vmexits,              "vmexits", VMX_PERF_EXIT_REASON_SIZE)
>  PERFCOUNTER_ARRAY(cause_vector,         "cause vector", VMX_PERF_VECTOR_SIZE)
>  
> -#define VMEXIT_NPF_PERFC 141
> -#define SVM_PERF_EXIT_REASON_SIZE (1+141)
> +#define VMEXIT_NPF_PERFC 143
> +#define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)

How does this work in the first place?  perfc_incra() is still passed 1024.

Furthermore, it's already worse than this.

401/402 are AVIC exits, and 403 is an SEV exit.  We've also gained -2 as
"busy" for transient SEV events too.

~Andrew

