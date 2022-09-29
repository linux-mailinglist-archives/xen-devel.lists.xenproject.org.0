Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93235EFA5F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 18:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413881.657833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odwLw-0005LY-SB; Thu, 29 Sep 2022 16:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413881.657833; Thu, 29 Sep 2022 16:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odwLw-0005Is-PF; Thu, 29 Sep 2022 16:25:36 +0000
Received: by outflank-mailman (input) for mailman id 413881;
 Thu, 29 Sep 2022 16:25:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c8lq=2A=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1odwLv-0005Im-GY
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 16:25:35 +0000
Received: from ppsw-40.srv.uis.cam.ac.uk (ppsw-40.srv.uis.cam.ac.uk
 [131.111.8.140]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56768bee-4013-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 18:25:34 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:55564)
 by ppsw-40.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1odwLq-000ZHL-K8 (Exim 4.96) (return-path <amc96@srcf.net>);
 Thu, 29 Sep 2022 17:25:30 +0100
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E362E1FC8A;
 Thu, 29 Sep 2022 17:25:29 +0100 (BST)
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
X-Inumbo-ID: 56768bee-4013-11ed-9374-c1cf23e5d27e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <200b2ad7-8cf9-4ca5-cb54-6e72ced7d7d9@srcf.net>
Date: Thu, 29 Sep 2022 17:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [xen-unstable-smoke test] 173362: regressions - FAIL
Content-Language: en-GB
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <osstest-173362-mainreport@xen.org>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <osstest-173362-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2022 17:22, osstest service owner wrote:
> flight 173362 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/173362/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-arm64-xsm               6 xen-build                fail REGR. vs. 173347

arch/arm/gic-v3-its.c: In function 'gicv3_its_deny_access':
arch/arm/gic-v3-its.c:905:32: error: passing argument 1 of
'iomem_deny_access' discards 'const' qualifier from pointer target type
[-Werror=discarded-qualifiers]
         rc = iomem_deny_access(d, mfn, mfn + nr);
                                ^
In file included from arch/arm/gic-v3-its.c:24:
./include/xen/iocap.h:32:52: note: expected 'struct domain *' but
argument is of type 'const struct domain *'
 static inline int iomem_deny_access(struct domain *d, unsigned long s,
                                     ~~~~~~~~~~~~~~~^
cc1: all warnings being treated as errors


Bug in 9982fe275ba4ee1a749b6dde5602a5a79e42b543.

~Andrew

