Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDB04E7A8B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 20:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294948.501874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXq4K-00089Q-MG; Fri, 25 Mar 2022 19:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294948.501874; Fri, 25 Mar 2022 19:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXq4K-000878-JE; Fri, 25 Mar 2022 19:57:56 +0000
Received: by outflank-mailman (input) for mailman id 294948;
 Fri, 25 Mar 2022 19:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYjy=UE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXq4I-000872-OZ
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 19:57:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1839ca-ac75-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 20:57:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1E2AAB82988;
 Fri, 25 Mar 2022 19:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4ECC004DD;
 Fri, 25 Mar 2022 19:57:50 +0000 (UTC)
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
X-Inumbo-ID: db1839ca-ac75-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648238270;
	bh=DzyrfFglDlc7YQs7fW4uYa9iFutZZkI5nExeswmm41E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ly9y61Pgs9AAfZgZtCtGEGd1YjdulZAZ/HFEvUCNVq7bS/uiJhKdVCabc8TWWgDuw
	 N35KTynzvzlEPp6QQ5rVLRD8SSrq/6SwmLoYj79EqW5N7PWqmj9LYGx/GixXPnCH5v
	 6aZ6/1LWHNm8SBm9+rBu3C6r0ORvNX4PLfGMhfXz0S8CGkkkB4mzyUJAwKCBCT7/NL
	 yeMl9aAAKsNgz/ZUd52hYmKovTdEy0ny3eTESts90FiJjQIBdVS2sd/HfTck5WG0Cp
	 LJZ0oimXj3lxUEACyHqwcDgBRw9ASSSD7iTwaLCdnwanWnugJPOuGe38/6kbJN4Aj1
	 dwMHNbgpF+paw==
Date: Fri, 25 Mar 2022 12:57:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/build: Add cppcheck and cppcheck-html make
 rules
In-Reply-To: <98a6df25-8a95-3e3d-e8a9-11e948da7b5b@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203251257020.2910984@ubuntu-linux-20-04-desktop>
References: <77c79e86050eef2b706ee11e64183d57a0f5bcee.1648119732.git.bertrand.marquis@arm.com> <alpine.DEB.2.22.394.2203241829510.2910984@ubuntu-linux-20-04-desktop> <98a6df25-8a95-3e3d-e8a9-11e948da7b5b@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Mar 2022, Michal Orzel wrote:
> On 25.03.2022 02:32, Stefano Stabellini wrote:
> > On Thu, 24 Mar 2022, Bertrand Marquis wrote:
> >> cppcheck can be used to check Xen code quality.
> >>
> >> To create a report do "make cppcheck" on a built tree adding any options
> >> you added during the process you used to build xen (like CROSS_COMPILE
> >> or XEN_TARGET_ARCH). This will generate an xml report xen-cppcheck.xml.
> >>
> >> To create a html report do "make cppcheck-html" in the same way and a
> >> full report to be seen in a browser will be generated in
> >> cppcheck-htmlreport/index.html.
> >>
> >> For better results it is recommended to build your own cppcheck from the
> >> latest sources that you can find at [1].
> >> Development and result analysis has been done with cppcheck 2.7.
> >>
> >> The Makefile rule is searching for all C files which have been compiled
> >> (ie which have a generated .o file) and is running cppcheck on all of
> >> them using the current configuration of xen so only the code actually
> >> compiled is checked.
> >>
> >> A new tool is introduced to merge all cppcheck reports into one global
> >> report including all findings and removing duplicates.
> >>
> >> Some extra variables can be used to customize the report:
> >> - CPPCHECK can be used to give the full path to the cppcheck binary to
> >> use (default is to use the one from the standard path).
> >> - CPPCHECK_HTMLREPORT can be used to give the full path to
> >> cppcheck-htmlreport (default is to use the one from the standard path).
> >>
> >> This has been tested on several arm configurations (x86 should work but
> >> has not been tested).
> >>
> >> [1] https://cppcheck.sourceforge.io/
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> > 
> > Very cool, I was looking forward to this :-)
> > 
> > 
> >> diff --git a/xen/tools/merge_cppcheck_reports.py b/xen/tools/merge_cppcheck_reports.py
> >> new file mode 100755
> >> index 0000000000..ef055f6925
> >> --- /dev/null
> >> +++ b/xen/tools/merge_cppcheck_reports.py
> >> @@ -0,0 +1,73 @@
> >> +#!/usr/bin/env python
> >> +
> >> +"""
> >> +This script acts as a tool to merge XML files created by cppcheck.
> >> +Usage:
> >> +    merge_cppcheck_reports.py [FILES] [OUTPUT]
> >> +
> >> +    FILES  - list of XML files with extension .cppcheck
> >> +    OUTPUT - file to store results (with .xml extension).
> >> +             If not specified, the script will print results to stdout.
> >> +"""
> >> +
> >> +import sys
> >> +from xml.etree import ElementTree
> >> +
> >> +def elements_equal(el1, el2):
> >> +    if type(el1) != type(el2): return False
> >> +
> >> +    el1_location = str(el1.find('location').attrib)
> >> +    el2_location = str(el2.find('location').attrib)
> >> +
> >> +    if el1_location != el2_location: return False
> >> +
> >> +    return True
> >> +
> >> +def remove_duplicates(xml_root_element):
> >> +    elems_to_remove = []
> >> +    index = 0
> >> +    elems_list = list(xml_root_element.findall("errors")[0])
> >> +    for elem1 in elems_list:
> >> +        index += 1
> >> +        for elem2 in elems_list[index:]:
> >> +            if elements_equal(elem1, elem2) and elem2 not in elems_to_remove:
> >> +                elems_to_remove.append(elem2)
> >> +                continue
> >> +
> >> +    for elem in elems_to_remove:
> >> +        xml_root_element.findall("errors")[0].remove(elem)
> >> +
> >> +def merge(files):
> >> +    result_xml_root = None
> >> +    for xml_file in files:
> >> +        xml_root = ElementTree.parse(xml_file).getroot()
> > 
> > 
> > Traceback (most recent call last):
> >   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 73, in <module>
> >     run()
> >   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 60, in run
> >     result = merge(files)
> >   File "/local/repos/xen-upstream/xen/tools/merge_cppcheck_reports.py", line 43, in merge
> >     xml_root = ElementTree.parse(xml_file).getroot()
> >   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1182, in parse
> >     tree.parse(source, parser)
> >   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 657, in parse
> >     self._root = parser.close()
> >   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1671, in close
> >     self._raiseerror(v)
> >   File "/usr/lib/python2.7/xml/etree/ElementTree.py", line 1523, in _raiseerror
> >     raise err
> > xml.etree.ElementTree.ParseError: no element found: line 11, column 0
> > make: *** [Makefile:576: xen-cppcheck.xml] Error 1
> > 
> > I think we should catch the xml.etree.ElementTree.ParseError exception and continue?
> 
> Well, this is of course something that we might do but this error clearly warns us that
> some XML files is not well formatted and therefore is not parsable. This could mean that
> you are using some old cppcheck version. Is it correct assumption?

I confirm it was an issue with the cppcheck version. I updated to the
latest main branch and it worked fine, thanks!

Then, I suggest we catch the exception and print an informative error
like "please upgrade your cppcheck to version xxx or greater"

