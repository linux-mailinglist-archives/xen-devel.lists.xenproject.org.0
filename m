Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73717293221
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 01:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8867.23858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUeuX-0002XC-MU; Mon, 19 Oct 2020 23:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8867.23858; Mon, 19 Oct 2020 23:49:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUeuX-0002Wn-I6; Mon, 19 Oct 2020 23:49:53 +0000
Received: by outflank-mailman (input) for mailman id 8867;
 Mon, 19 Oct 2020 23:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBDh=D2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kUeuW-0002W4-00
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 23:49:52 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 151c5437-5ed4-4757-93bd-c745c80acde2;
 Mon, 19 Oct 2020 23:49:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JNeWmu008892;
 Mon, 19 Oct 2020 23:49:25 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 347s8mr587-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 19 Oct 2020 23:49:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JNdpgP184956;
 Mon, 19 Oct 2020 23:49:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 348acq34kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 23:49:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09JNnFrC018030;
 Mon, 19 Oct 2020 23:49:15 GMT
Received: from [10.39.233.101] (/10.39.233.101)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Oct 2020 16:49:14 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uBDh=D2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
	id 1kUeuW-0002W4-00
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 23:49:52 +0000
X-Inumbo-ID: 151c5437-5ed4-4757-93bd-c745c80acde2
Received: from userp2120.oracle.com (unknown [156.151.31.85])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 151c5437-5ed4-4757-93bd-c745c80acde2;
	Mon, 19 Oct 2020 23:49:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JNeWmu008892;
	Mon, 19 Oct 2020 23:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=bhZdIZ6uyaAnD5Lu5Uhke8liuugcYbL/KEuYLGPYBCw=;
 b=uOhEmuToYeCEFCRlRVs3zOCo29etlOg6bv8a389akvmhTZ7RlMCAgWL76XFroG40IpCF
 1X7V2UD2l/1zSoY6LB1bdV2K04ox9P8SSUzvIE8KwBU4UpZZCYmDCZ0wA9MicERc0wN7
 mN/VW0GN0i/wk56xsCKVdREgz3I/x32V/KixWQRR3/HJomhjZw4VjIfUHUG3CHc+FQBc
 QszoDPh2C5grHbcpQuXfDnEEFt9BRJhjW8f/0xgTGXnyqPl3evhpKyE+oaW/Ucz5pPCx
 /nTmNoPCn2P3GF92zn5veNuIKSUECCmBJ/NhBQ3AhaKi9hcven1z9jGx45E6T5mm0bB4 RA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 347s8mr587-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2020 23:49:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09JNdpgP184956;
	Mon, 19 Oct 2020 23:49:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 348acq34kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Oct 2020 23:49:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09JNnFrC018030;
	Mon, 19 Oct 2020 23:49:15 GMT
Received: from [10.39.233.101] (/10.39.233.101)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 19 Oct 2020 16:49:14 -0700
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
To: Rich Persaud <persaur@gmail.com>,
        =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
        George Dunlap <George.Dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?=
 <pasik@iki.fi>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, bhelgaas@google.com,
        Roger Pau Monne <roger.pau@citrix.com>,
        =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
        Jason Andryuk <jandryuk@gmail.com>,
        Andrew Cooper <Andrew.Cooper3@citrix.com>,
        Ian Jackson <Ian.Jackson@citrix.com>,
        Paul Durrant <pdurrant@amazon.com>,
        Anthony Perard <anthony.perard@citrix.com>
References: <2d2693c9-f2a9-7914-7362-947a61c28acd@alstadheim.priv.no>
 <6D51F096-C247-486B-B4A2-50F85855EA06@gmail.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <1c0c3e2e-51c0-1c94-d5fc-cfcf17f61236@oracle.com>
Date: Mon, 19 Oct 2020 19:49:11 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <6D51F096-C247-486B-B4A2-50F85855EA06@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9779 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010190160
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9779 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190160


On 10/19/20 6:43 PM, Rich Persaud wrote:
> On Oct 19, 2020, at 11:52, Håkon Alstadheim <hakon@alstadheim.priv.no> wrote:
>> ﻿
>> Den 19.10.2020 17:16, skrev Håkon Alstadheim:
>>> Den 19.10.2020 13:00, skrev George Dunlap:
>>>>> On Jan 31, 2020, at 3:33 PM, Wei Liu <wl@xen.org> wrote:
>>>>>
>>>>> On Fri, Jan 17, 2020 at 02:13:04PM -0500, Rich Persaud wrote:
>>>>>> On Aug 26, 2019, at 17:08, Pasi Kärkkäinen <pasik@iki.fi> wrote:
>>>>>>> ﻿Hi,
>>>>>>>
>>>>>>>> On Mon, Oct 08, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:
>>>>>>>>> On 10/3/18 11:51 AM, Pasi Kärkkäinen wrote:
>>>>>>>>> On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monné wrote:
>>>>>>>>>> On Tue, Sep 18, 2018 at 02:09:53PM -0400, Boris Ostrovsky wrote:
>>>>>>>>>>> On 9/18/18 5:32 AM, George Dunlap wrote:
>>>>>>>>>>>>> On Sep 18, 2018, at 8:15 AM, Pasi Kärkkäinen <pasik@iki.fi> wrote:
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>> On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky wrote:
>>>>>>>>>>>>>>> What about the toolstack changes? Have they been accepted? I vaguely
>>>>>>>>>>>>>>> recall there was a discussion about those changes but don't remember how
>>>>>>>>>>>>>>> it ended.
>>>>>>>>>>>>>> I don't think toolstack/libxl patch has been applied yet either.
>>>>>>>>>>>>>> "[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attribute":
>>>>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html 
>>>>>>>>>>>>>> "[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS attribute":
>>>>>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html 
>>>>>>>>>>>> Will this patch work for *BSD? Roger?
>>>>>>>>>>> At least FreeBSD don't support pci-passthrough, so none of this works
>>>>>>>>>>> ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c will
>>>>>>>>>>> have to be moved to libxl_linux.c when BSD support is added.
>>>>>>>>>> Ok. That sounds like it's OK for the initial pci 'reset' implementation in xl/libxl to be linux-only..
>>>>>>>>> Are these two patches still needed? ISTR they were written originally
>>>>>>>>> to deal with guest trying to use device that was previously assigned to
>>>>>>>>> another guest. But pcistub_put_pci_dev() calls
>>>>>>>>> __pci_reset_function_locked() which first tries FLR, and it looks like
>>>>>>>>> it was added relatively recently.
>>>>>>>> Replying to an old thread.. I only now realized I forgot to reply to this message earlier.
>>>>>>>>
>>>>>>>> afaik these patches are still needed. Håkon (CC'd) wrote to me in private that
>>>>>>>> he gets a (dom0) Linux kernel crash if he doesn't have these patches applied.


If this is still crashing I'd be curious to see the splat.


>>>>>>>>
>>>>>>>>
>>>>>>>> Here are the links to both the linux kernel and libxl patches:
>>>>>>>>
>>>>>>>>
>>>>>>>> "[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset using 'reset' SysFS attribute":
>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00659.html
>>>>>>>>
>>>>>>>> [Note that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() interface" is already applied in upstream linux kernel, so it's not needed anymore]
>>>>>>>>
>>>>>>>> "[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI flr/slot/bus reset with 'reset' SysFS attribute":
>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00661.html
>>>>>>>>
>>>>>>>>
>>>>>>>> "[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attribute":
>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>>>>>
>>>>>>>> "[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS attribute":
>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>>>>>> [dropping Linux mailing lists]
>>>>>>>
>>>>>>> What is required to get the Xen patches merged?  Rebasing against Xen
>>>>>>> master?  OpenXT has been carrying a similar patch for many years and
>>>>>>> we would like to move to an upstream implementation.  Xen users of PCI
>>>>>>> passthrough would benefit from more reliable device reset.
>>>>>> Rebase and resend?


If you are is going to resend then please address Jan's comments from https://lists.xen.org/archives/html/xen-devel/2017-12/msg00695.html (although I am not sure in usefulness of the last one)


>>>>>>
>>>>>> Skimming that thread I think the major concern was backward
>>>>>> compatibility. That seemed to have been addressed.
>>>>>>
>>>>>> Unfortunately I don't have the time to dig into Linux to see if the
>>>>>> claim there is true or not.
>>>>>>
>>>>>> It would be helpful to write a concise paragraph to say why backward
>>>>>> compatibility is not required.
>>>> Just going through my old “make sure something happens with this” mails.  Did anything ever happen with this?  Who has the ball here / who is this stuck on?
>>> We're waiting for "somebody" to testify that fixing this will not adversely affect anyone. I'm not qualified, but my strong belief is that since "reset" or "do_flr"  in the linux kernel is not currently implemented/used in any official distribution, it should be OK.
>>>
>>> Patches still work in current staging-4.14 btw.
>>>
>> Just for the record, attached are the patches I am running on top of linux gentoo-sources-5.9.1  and xen-staging-4.14 respectively. (I am also running with the patch to mark populated reserved memory that contains ACPI tables as "ACPI NVS", not attached here ).
>>
>> <pci_brute_reset-home-hack.patch>
>> <pci_brute_reset-home-hack-doc.patch>
>> <pci-reset-min-egen.patch>
> Is there any reason not to merge the Xen patch, while waiting for the Linux patch to be upstreamed?  Similar versions have been deployed in downstream production systems for years, we can at least de-dupe those Xen patches.
>
> Do (can) we have an in-tree location to queue Xen-relevant Linux patches while they go through an upstreaming process that may last several (5+ here) years?


No (at least as far as I can think of it) but then I can't remember another instance of patches taking that long.


-boris


