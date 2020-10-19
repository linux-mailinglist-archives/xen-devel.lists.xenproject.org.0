Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B677A292A23
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8740.23452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUWth-0006x6-0K; Mon, 19 Oct 2020 15:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8740.23452; Mon, 19 Oct 2020 15:16:28 +0000
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
	id 1kUWtg-0006wh-TS; Mon, 19 Oct 2020 15:16:28 +0000
Received: by outflank-mailman (input) for mailman id 8740;
 Mon, 19 Oct 2020 15:16:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xInf=D2=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
 id 1kUWtf-0006wc-Ra
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:16:28 +0000
Received: from asav22.altibox.net (unknown [109.247.116.9])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 233d84c1-7aaa-406e-8c35-6876ba07cd29;
 Mon, 19 Oct 2020 15:16:25 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no
 (148-252-96.12.3p.ntebredband.no [148.252.96.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: hakon.alstadheim@ntebb.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 487CC201E4;
 Mon, 19 Oct 2020 17:16:23 +0200 (CEST)
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
 by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id EC6AE625EC1A;
 Mon, 19 Oct 2020 17:16:20 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: hakon)
 by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id A0CA92410673;
 Mon, 19 Oct 2020 17:16:20 +0200 (CEST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xInf=D2=alstadheim.priv.no=hakon@srs-us1.protection.inumbo.net>)
	id 1kUWtf-0006wc-Ra
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:16:28 +0000
X-Inumbo-ID: 233d84c1-7aaa-406e-8c35-6876ba07cd29
Received: from asav22.altibox.net (unknown [109.247.116.9])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 233d84c1-7aaa-406e-8c35-6876ba07cd29;
	Mon, 19 Oct 2020 15:16:25 +0000 (UTC)
Received: from postfix-relay.alstadheim.priv.no (148-252-96.12.3p.ntebredband.no [148.252.96.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hakon.alstadheim@ntebb.no)
	by asav22.altibox.net (Postfix) with ESMTPSA id 487CC201E4;
	Mon, 19 Oct 2020 17:16:23 +0200 (CEST)
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
X-Finnesikke-B-A-I-T: finnesikke@alstadheim.priv.no
Received: from smtps.alstadheim.priv.no (localhost [127.0.0.1])
	by postfix-relay.alstadheim.priv.no (Postfix) with ESMTP id EC6AE625EC1A;
	Mon, 19 Oct 2020 17:16:20 +0200 (CEST)
Received: from [192.168.2.201] (unknown [192.168.2.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: hakon)
	by smtps.alstadheim.priv.no (Postfix) with ESMTPSA id A0CA92410673;
	Mon, 19 Oct 2020 17:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alstadheim.priv.no;
	s=smtp; t=1603120580;
	bh=JJ8KE9aax60EZuFhLwHCU8UNqNosfxGFDPEIN4Y4Vkg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=u0BjycYxzVnQQva5xDIv0Sn3sbk0xB/DbBO8IvX0ttJP0M5IjkLTQfjvwI7OJfqZX
	 rt1jF1QjNHes4zQoRIE3cF1NOxpBJZcK14lJ/6rQUroK/EIcwOYKTPFrHt2jqvsM9i
	 STk8eaKArssRqeH4uv+5VnEzuylJ32rMO8ZljsbM=
Subject: Re: [Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
To: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>
Cc: Rich Persaud <persaur@gmail.com>, =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?=
 <pasik@iki.fi>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <646A4BEA-C544-4C62-A7A3-B736D3860912@gmail.com>
 <20200131153332.r4oe3sadhvoly7ho@debian>
 <A325DB30-0282-4512-96D4-06AE661ADB5A@citrix.com>
From: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>
Message-ID: <30109c0a-3aa3-8af7-dadf-66f508071963@alstadheim.priv.no>
Date: Mon, 19 Oct 2020 17:16:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <A325DB30-0282-4512-96D4-06AE661ADB5A@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Du94Bl3+ c=1 sm=1 tr=0
	a=pSdy67GPd25lyaVjMobptA==:117 a=pSdy67GPd25lyaVjMobptA==:17
	a=IkcTkHD0fZMA:10 a=afefHYAZSVUA:10 a=M51BFTxLslgA:10 a=mLnsDVdbAAAA:8
	a=ZD_xPv-c6uJpPFqAP2MA:9 a=QEXdDO2ut3YA:10 a=KNCrymi1MkcA:10
	a=n3xS-gtqsLMA:10 a=L6mzFnP-7RsA:10 a=LJOHJtgqUKgA:10
	a=xnp1pY6zelCj5OLna2To:22

Den 19.10.2020 13:00, skrev George Dunlap:
>
>> On Jan 31, 2020, at 3:33 PM, Wei Liu <wl@xen.org> wrote:
>>
>> On Fri, Jan 17, 2020 at 02:13:04PM -0500, Rich Persaud wrote:
>>> On Aug 26, 2019, at 17:08, Pasi Kärkkäinen <pasik@iki.fi> wrote:
>>>> ﻿Hi,
>>>>
>>>>> On Mon, Oct 08, 2018 at 10:32:45AM -0400, Boris Ostrovsky wrote:
>>>>>> On 10/3/18 11:51 AM, Pasi Kärkkäinen wrote:
>>>>>> On Wed, Sep 19, 2018 at 11:05:26AM +0200, Roger Pau Monné wrote:
>>>>>>> On Tue, Sep 18, 2018 at 02:09:53PM -0400, Boris Ostrovsky wrote:
>>>>>>>> On 9/18/18 5:32 AM, George Dunlap wrote:
>>>>>>>>>> On Sep 18, 2018, at 8:15 AM, Pasi Kärkkäinen <pasik@iki.fi> wrote:
>>>>>>>>>> Hi,
>>>>>>>>>> On Mon, Sep 17, 2018 at 02:06:02PM -0400, Boris Ostrovsky wrote:
>>>>>>>>>>> What about the toolstack changes? Have they been accepted? I vaguely
>>>>>>>>>>> recall there was a discussion about those changes but don't remember how
>>>>>>>>>>> it ended.
>>>>>>>>>> I don't think toolstack/libxl patch has been applied yet either.
>>>>>>>>>> "[PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attribute":
>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>>>>>>> "[PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS attribute":
>>>>>>>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>>>>>>> Will this patch work for *BSD? Roger?
>>>>>>> At least FreeBSD don't support pci-passthrough, so none of this works
>>>>>>> ATM. There's no sysfs on BSD, so much of what's in libxl_pci.c will
>>>>>>> have to be moved to libxl_linux.c when BSD support is added.
>>>>>> Ok. That sounds like it's OK for the initial pci 'reset' implementation in xl/libxl to be linux-only..
>>>>> Are these two patches still needed? ISTR they were  written originally
>>>>> to deal with guest trying to use device that was previously assigned to
>>>>> another guest. But pcistub_put_pci_dev() calls
>>>>> __pci_reset_function_locked() which first tries FLR, and it looks like
>>>>> it was added relatively recently.
>>>> Replying to an old thread.. I only now realized I forgot to reply to this message earlier.
>>>>
>>>> afaik these patches are still needed. Håkon (CC'd) wrote to me in private that
>>>> he gets a (dom0) Linux kernel crash if he doesn't have these patches applied.
>>>>
>>>>
>>>> Here are the links to both the linux kernel and libxl patches:
>>>>
>>>>
>>>> "[Xen-devel] [PATCH V3 0/2] Xen/PCIback: PCI reset using 'reset' SysFS attribute":
>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00659.html
>>>>
>>>> [Note that PATCH V3 1/2 "Drivers/PCI: Export pcie_has_flr() interface" is already applied in upstream linux kernel, so it's not needed anymore]
>>>>
>>>> "[Xen-devel] [PATCH V3 2/2] Xen/PCIback: Implement PCI flr/slot/bus reset with 'reset' SysFS attribute":
>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00661.html
>>>>
>>>>
>>>> "[Xen-devel] [PATCH V1 0/1] Xen/Tools: PCI reset using 'reset' SysFS attribute":
>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00664.html
>>>>
>>>> "[Xen-devel] [PATCH V1 1/1] Xen/libxl: Perform PCI reset using 'reset' SysFS attribute":
>>>> https://lists.xen.org/archives/html/xen-devel/2017-12/msg00663.html
>>> [dropping Linux mailing lists]
>>>
>>> What is required to get the Xen patches merged?  Rebasing against Xen
>>> master?  OpenXT has been carrying a similar patch for many years and
>>> we would like to move to an upstream implementation.  Xen users of PCI
>>> passthrough would benefit from more reliable device reset.
>> Rebase and resend?
>>
>> Skimming that thread I think the major concern was backward
>> compatibility. That seemed to have been addressed.
>>
>> Unfortunately I don't have the time to dig into Linux to see if the
>> claim there is true or not.
>>
>> It would be helpful to write a concise paragraph to say why backward
>> compatibility is not required.
> Just going through my old “make sure something happens with this” mails.  Did anything ever happen with this?  Who has the ball here / who is this stuck on?

We're waiting for "somebody" to testify that fixing this will not 
adversely affect anyone. I'm not qualified, but my strong belief is that 
since "reset" or "do_flr"  in the linux kernel is not currently 
implemented/used in any official distribution, it should be OK.

Patches still work in current staging-4.14 btw.



