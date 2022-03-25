Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0634E6EFF
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 08:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294592.500978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXeTv-0000Bc-7U; Fri, 25 Mar 2022 07:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294592.500978; Fri, 25 Mar 2022 07:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXeTv-000083-4J; Fri, 25 Mar 2022 07:35:35 +0000
Received: by outflank-mailman (input) for mailman id 294592;
 Fri, 25 Mar 2022 07:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8PHK=UE=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nXeTt-00007x-W6
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 07:35:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2621808e-ac0e-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 08:35:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B48BE12FC;
 Fri, 25 Mar 2022 00:35:30 -0700 (PDT)
Received: from [10.57.6.19] (unknown [10.57.6.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9278E3F66F;
 Fri, 25 Mar 2022 00:35:28 -0700 (PDT)
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
X-Inumbo-ID: 2621808e-ac0e-11ec-a405-831a346695d4
Message-ID: <98a6df25-8a95-3e3d-e8a9-11e948da7b5b@arm.com>
Date: Fri, 25 Mar 2022 08:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2203241829510.2910984@ubuntu-linux-20-04-desktop>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2203241829510.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25.03.2022 02:32, Stefano Stabellini wrote:
> On Thu, 24 Mar 2022, Bertrand Marquis wrote:
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
> Very cool, I was looking forward to this :-)
> 
> 
>> diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppcheck_reports.py
>> new file mode 100755
>> index 0000000000..ef055f6925
>> --- /dev/null
>> +++ b/xen/tools/merge_cppcheck_reports.py
>> @@ -0,0 +1,73 @@
>> +#!/usr/bin/env python
>> +
>> +"""
>> +This script acts as a tool to merge XML files created by cppcheck.
>> +Usage:
>> +    merge_cppcheck_reports.py [FILES] [OUTPUT]
>> +
>> +    FILES  - list of XML files with extension .cppcheck
>> +    OUTPUT - file to store results (with .xml extension).
>> +             If not specified, the script will print results to stdout.
>> +"""
>> +
>> +import sys
>> +from xml.etree import ElementTree
>> +
>> +def elements_equal(el1, el2):
>> +    if type(el1) != type(el2): return False
>> +
>> +    el1_location = str(el1.find('location').attrib)
>> +    el2_location = str(el2.find('location').attrib)
>> +
>> +    if el1_location != el2_location: return False
>> +
>> +    return True
>> +
>> +def remove_duplicates(xml_root_element):
>> +    elems_to_remove = []
>> +    index = 0
>> +    elems_list = list(xml_root_element.findall("errors")[0])
>> +    for elem1 in elems_list:
>> +        index += 1
>> +        for elem2 in elems_list[index:]:
>> +            if elements_equal(elem1, elem2) and elem2 not in elems_to_remove:
>> +                elems_to_remove.append(elem2)
>> +                continue
>> +
>> +    for elem in elems_to_remove:
>> +        xml_root_element.findall("errors")[0].remove(elem)
>> +
>> +def merge(files):
>> +    result_xml_root = None
>> +    for xml_file in files:
>> +        xml_root = ElementTree.parse(xml_file).getroot()
> 
> 
> Traceback (most recent call last):
>   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 73, in <module>
>     run()
>   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 60, in run
>     result = merge(files)
>   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 43, in merge
>     xml_root = ElementTree.parse(xml_file).getroot()
>   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1182, in parse
>     tree.parse(source, parser)
>   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 657, in parse
>     self._root = parser.close()
>   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1671, in close
>     self._raiseerror(v)
>   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1523, in _raiseerror
>     raise err
> xml.etree.ElementTree.ParseError: no element found: line 11, column 0
> make: *** [Makefile:576: xen-cppcheck.xml] Error 1
> 
> I think we should catch the xml.etree.ElementTree.ParseError exception and continue?

Well, this is of course something that we might do but this error clearly warns us that
some XML files is not well formatted and therefore is not parsable. This could mean that
you are using some old cppcheck version. Is it correct assumption?

Cheers,
Michal

