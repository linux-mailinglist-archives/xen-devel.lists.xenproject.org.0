Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8E14742F6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246721.425486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7Ht-0007L7-C2; Tue, 14 Dec 2021 12:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246721.425486; Tue, 14 Dec 2021 12:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx7Ht-0007Ia-8f; Tue, 14 Dec 2021 12:52:09 +0000
Received: by outflank-mailman (input) for mailman id 246721;
 Tue, 14 Dec 2021 12:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C1I2=Q7=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mx7Hr-0007IT-LF
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:52:07 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a389d707-5cdc-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:52:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:42982)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mx7Ho-000BQw-8R (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 14 Dec 2021 12:52:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 516D020339;
 Tue, 14 Dec 2021 12:52:04 +0000 (GMT)
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
X-Inumbo-ID: a389d707-5cdc-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4210cadd-a717-2a8b-1cba-044f2bede588@srcf.net>
Date: Tue, 14 Dec 2021 12:52:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211213190449.4830-1-andrew.cooper3@citrix.com>
 <76367980-c0ff-13c6-4a86-24be90f28f8d@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] tools/libs: Don't recursively expand MAJOR ?= $(shell
 ...)
In-Reply-To: <76367980-c0ff-13c6-4a86-24be90f28f8d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/12/2021 08:17, Jan Beulich wrote:
> On 13.12.2021 20:04, Andrew Cooper wrote:
>> --- a/tools/libs/libs.mk
>> +++ b/tools/libs/libs.mk
>> @@ -6,7 +6,10 @@
>>  #   MINOR:   minor version of lib (0 if empty)
>>  
>>  LIBNAME := $(notdir $(CURDIR))
>> -MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>> +
>> +ifeq ($(origin MAJOR), undefined)
>> +MAJOR := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
>> +endif
>>  MINOR ?= 0
>>  
>>  SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
> Wouldn't it be better to move the "endif" past the setting of MINOR
> (which then could use := as well)? Libraries with their own versioning
> would imo better specify both rather than relying on getting 0 from
> here (which at present none of them does). Would require an
> adjustment to the comment at the top of libs.mk, though.

I considered that, but decided against it.

Absolutely nothing good can come of having a mix/match of whether MAJOR
and MINOR are set, and the whole point of this logic is to provide a
safe default when things are unspecified.

>
> And further, since you're switching to $(origin ...), wouldn't this
> be an opportunity to avoid stray inheriting of values from the
> environment, by switching to "ifneq ($(origin MAJOR), file)"?

No.  Not because I think setting MAJOR on the command line is sensible,
but because it fails the principle of lease surprise.

Basically all variables are editable on the command line and the
environment.  Prohibiting this one alone is bizarre, unnecessary, and
fragile in the case where if it is encountered, it's probably someone
who knows exactly what they're doing, trying to debug the build system.

~Andrew

