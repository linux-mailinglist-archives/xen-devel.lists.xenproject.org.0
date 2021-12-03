Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99E54676B5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237441.411831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt73Z-0006Ow-7X; Fri, 03 Dec 2021 11:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237441.411831; Fri, 03 Dec 2021 11:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt73Z-0006MP-4a; Fri, 03 Dec 2021 11:48:49 +0000
Received: by outflank-mailman (input) for mailman id 237441;
 Fri, 03 Dec 2021 11:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt73Y-0006MJ-C8
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:48:48 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f91214d1-542e-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:48:47 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50940)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt73W-00014v-h5 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 11:48:46 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2FF751FD7A;
 Fri,  3 Dec 2021 11:48:46 +0000 (GMT)
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
X-Inumbo-ID: f91214d1-542e-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c375875f-0a21-e02b-6a2b-63ab91451373@srcf.net>
Date: Fri, 3 Dec 2021 11:48:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
 <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/HVM: permit CLFLUSH{,OPT} on execute-only code
 segments
In-Reply-To: <53d783d7-aa53-f2de-6aa3-bd266f176dfb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2021 11:21, Jan Beulich wrote:
> The SDM explicitly permits this, and since that's sensible behavior
> don't special case AMD (where the PM doesn't explicitly say so).

APM explicitly says so too.

"The CLFLUSH instruction executes at any privilege level. CLFLUSH
performs all the segmentation and paging checks that a 1-byte read would
perform, except that it also allows references to execute-only segments."

and

"The CLFLUSHOPT instruction executes at any privilege level. CLFLUSHOPT
performs all the segmentation and paging checks that a 1-byte read would
perform, except that it also allows references to execute-only segments."

> Fixes: 52dba7bd0b36 ("x86emul: generalize wbinvd() hook")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With the commit message tweaked, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>.  Far less invasive than I was fearing.

~Andrew

