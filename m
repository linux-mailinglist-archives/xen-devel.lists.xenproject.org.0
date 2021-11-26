Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362B45F085
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 16:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233186.404480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd2l-00083s-Fz; Fri, 26 Nov 2021 15:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233186.404480; Fri, 26 Nov 2021 15:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqd2l-000824-Bk; Fri, 26 Nov 2021 15:21:43 +0000
Received: by outflank-mailman (input) for mailman id 233186;
 Fri, 26 Nov 2021 15:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jyU=QN=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mqd2k-00081y-LD
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 15:21:42 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dea8643-4ecc-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 16:21:41 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39360)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mqd2i-000PUc-mi (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 26 Nov 2021 15:21:40 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id E1A5B1FC54;
 Fri, 26 Nov 2021 15:21:39 +0000 (GMT)
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
X-Inumbo-ID: 8dea8643-4ecc-11ec-9787-a32c541c8605
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <e7f8a52a-5761-88dc-97ff-6c2feca2effb@srcf.net>
Date: Fri, 26 Nov 2021 15:21:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-2-andrew.cooper3@citrix.com>
 <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 01/65] x86: Introduce support for CET-IBT
In-Reply-To: <69d1b4a3-a042-c2c4-2f59-ea897886ae1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/11/2021 14:10, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> @@ -124,6 +129,18 @@ config XEN_SHSTK
>>  	  When CET-SS is active, 32bit PV guests cannot be used.  Backwards
>>  	  compatiblity can be provided via the PV Shim mechanism.
>>  
>> +config XEN_IBT
>> +	bool "Supervisor Indirect Branch Tracking"
>> +	depends on HAS_CC_CET_IBT
>> +	default y
>> +	help
>> +	  Control-flow Enforcement Technology (CET) is a set of features in
>> +	  hardware designed to combat Return-oriented Programming (ROP, also
>> +	  call/jump COP/JOP) attacks.  Indirect Branch Tracking is one CET
>> +	  feature designed to provide function pointer protection.
>> +
>> +	  This option arranges for Xen to use CET-IBT for its own protection.
> Shouldn't this depend on BROKEN until it's actually functional?

It compiles fine right from now, and making it BROKEN would inhibit
bisection through the series.

Nothing actually matters until patch 65 turns on MSR_S_CET.ENDBR_EN.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -35,6 +35,11 @@
>>  # error Unknown compilation width
>>  #endif
>>  
>> +#ifndef cf_check
>> +/* Cope with userspace build not knowing about CET-IBT */
>> +#define cf_check
>> +#endif
> Imo this shouldn't go here, but in tools/tests/x86_emulator/x86-emulate.h,
> and then presumably without #ifdef.

I considered that, but the test harness isn't the only userspace
harness.  There is the fuzzing harness too, and I'm not sure we want to
force every userspace harness to provide the same workaround.

~Andrew

