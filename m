Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935284702A0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 15:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243956.422092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgkw-0007iE-NO; Fri, 10 Dec 2021 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243956.422092; Fri, 10 Dec 2021 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgkw-0007gC-JJ; Fri, 10 Dec 2021 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 243956;
 Fri, 10 Dec 2021 14:20:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a5or=Q3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvgkv-0007g5-HM
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 14:20:13 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 481872d2-59c4-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 15:20:10 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:41522)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvgkr-0007EV-p0 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 10 Dec 2021 14:20:09 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 67F3C1FDB9;
 Fri, 10 Dec 2021 14:20:09 +0000 (GMT)
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
X-Inumbo-ID: 481872d2-59c4-11ec-a831-37629979565c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <44707bed-ceb3-377b-f2b3-9864b7fa4e97@srcf.net>
Date: Fri, 10 Dec 2021 14:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
 <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
 <e7f8a52a-5761-88dc-97ff-6c2feca2effb@srcf.net>
 <566dbf20-2881-80ac-eafd-57ac4b217f0f@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
In-Reply-To: <566dbf20-2881-80ac-eafd-57ac4b217f0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2021 09:21, Jan Beulich wrote:
> On 26.11.2021 16:21, Andrew Cooper wrote:
>> On 26/11/2021 14:10, Jan Beulich wrote:
>>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>>> @@ -124,6 +129,18 @@ config XEN_SHSTK
>>>>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
>>>>  	  compatiblity can be provided via the PV Shim mechanism.
>>>>  
>>>> +config XEN_IBT
>>>> +	bool "Supervisor Indirect Branch Tracking"
>>>> +	depends on HAS_CC_CET_IBT
>>>> +	default y
>>>> +	help
>>>> +	  Control-flow Enforcement Technology (CET) is a set of features in
>>>> +	  hardware designed to combat Return-oriented Programming (ROP, also
>>>> +	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
>>>> +	  feature designed to provide function pointer protection.
>>>> +
>>>> +	  This option arranges for Xen to use CET-IBT for its own protection.
>>> Shouldn't this depend on BROKEN until it's actually functional?
>> It compiles fine right from now, and making it BROKEN would inhibit
>> bisection through the series.
>>
>> Nothing actually matters until patch 65 turns on MSR_S_CET.ENDBR_EN.
> "Nothing" except that until then the promised extra security isn't
> there.

The series is very likely to be committed in one fell swoop, but even
that aside, it really doesn't matter until 4.17-rc1

As it stands, this is ~65 patches of incremental changes to the binary,
and oughtn't to be 65 nops and a massive switch at the end.

~Andrew

