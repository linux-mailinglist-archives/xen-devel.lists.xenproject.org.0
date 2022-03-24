Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9127A4E6409
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 14:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294306.500358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNQl-0001hr-1d; Thu, 24 Mar 2022 13:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294306.500358; Thu, 24 Mar 2022 13:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNQk-0001fR-UD; Thu, 24 Mar 2022 13:23:10 +0000
Received: by outflank-mailman (input) for mailman id 294306;
 Thu, 24 Mar 2022 13:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPEa=UD=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nXNQj-0001fL-Km
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 13:23:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8b2f0184-ab75-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 14:23:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FC2CD6E;
 Thu, 24 Mar 2022 06:23:07 -0700 (PDT)
Received: from [10.57.21.152] (unknown [10.57.21.152])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C7CC3F73D;
 Thu, 24 Mar 2022 06:23:04 -0700 (PDT)
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
X-Inumbo-ID: 8b2f0184-ab75-11ec-a405-831a346695d4
Message-ID: <2f403670-bbe9-f2ef-bb1c-2c38b53d138b@arm.com>
Date: Thu, 24 Mar 2022 14:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <aff044ff-2a46-527d-9237-802487351bbc@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <aff044ff-2a46-527d-9237-802487351bbc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24.03.2022 14:06, Andrew Cooper wrote:
> On 24/03/2022 11:04, Bertrand Marquis wrote:
>> cppcheck can be used to check Xen code quality.
>>
>> To create a report do "make cppcheck" on a built tree adding any options
>> you added during the process you used to build xen (like CROSS_COMPILE
>> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
>>
>> To create a html report do "make cppcheck-html" in the same way and a
>> full report to be seen in a browser will be generated in
>> cppcheck-htmlreport/index.html.
>>
>> For better results it is recommended to build your own cppcheck from the
>> latest sources that you can find at [1].
>> Development and result analysis has been done with cppcheck 2.7.
>>
>> The Makefile rule is searching for all C files which have been compiled
>> (ie which have a generated .o file) and is running cppcheck on all of
>> them using the current configuration of xen so only the code actually
>> compiled is checked.
>>
>> A new tool is introduced to merge all cppcheck reports into one global
>> report including all findings and removing duplicates.
>>
>> Some extra variables can be used to customize the report:
>> - CPPCHECK can be used to give the full path to the cppcheck binary to
>> use (default is to use the one from the standard path).
>> - CPPCHECK_HTMLREPORT can be used to give the full path to
>> cppcheck-htmlreport (default is to use the one from the standard path).
>>
>> This has been tested on several arm configurations (x86 should work but
>> has not been tested).
>>
>> [1] https://cppcheck.sourceforge.io/
>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Does CPPCheck have configurable errors vs warnings?  Should we wire this
> into CI so we can fail builds which introduce errors that we've already
> managed to purge from the codebase?
> 
For cppcheck, every finding is an error as it is placed within <errors> section in XML.
cppcheck differentiates different types of findings by using "severity" element which can be e.g. error, style, warning, etc.
cppcheck-html uses this field to group findings into categories and present it in a nice format to be seen on a web browser.
However there is currently no way to tell cppcheck to find only errors.

Cheers,
Michal

