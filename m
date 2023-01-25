Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357DC67B8D4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 18:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484506.751107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjuI-0006al-L6; Wed, 25 Jan 2023 17:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484506.751107; Wed, 25 Jan 2023 17:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKjuI-0006Y2-Hp; Wed, 25 Jan 2023 17:49:58 +0000
Received: by outflank-mailman (input) for mailman id 484506;
 Wed, 25 Jan 2023 17:49:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ToUz=5W=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pKjuH-0006Xw-Ml
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 17:49:57 +0000
Received: from ppsw-43.srv.uis.cam.ac.uk (ppsw-43.srv.uis.cam.ac.uk
 [131.111.8.143]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac85d094-9cd8-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 18:49:54 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39600)
 by ppsw-43.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pKjuD-000T2l-V4 (Exim 4.96) (return-path <amc96@srcf.net>);
 Wed, 25 Jan 2023 17:49:53 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 713F61FA26;
 Wed, 25 Jan 2023 17:49:53 +0000 (GMT)
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
X-Inumbo-ID: ac85d094-9cd8-11ed-b8d1-410ff93cb8f0
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a4e9272b-6110-e041-13d0-6746f721135e@srcf.net>
Date: Wed, 25 Jan 2023 17:49:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 0/4] x86/spec-ctrl: IPBP improvements
In-Reply-To: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/01/2023 3:24 pm, Jan Beulich wrote:
> Versions of the two final patches were submitted standalone earlier
> on. The series here tries to carry out a suggestion from Andrew,
> which the two of us have been discussing. Then said previously posted
> patches are re-based on top, utilizing the new functionality.
>
> 1: spec-ctrl: add logic to issue IBPB on exit to guest
> 2: spec-ctrl: defer context-switch IBPB until guest entry
> 3: limit issuing of IBPB during context switch
> 4: PV: issue branch prediction barrier when switching 64-bit guest to kernel mode

In the subject, you mean IBPB.  I think all the individual patches are fine.

Do you have an implementation of VMASST_TYPE_mode_switch_no_ibpb for
Linux yet?  The thing I'd like to avoid is that we commit this perf it
to Xen, without lining Linux up to be able to skip it.

~Andrew

