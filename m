Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8812D2946
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 11:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47334.83814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmacq-0007QZ-4V; Tue, 08 Dec 2020 10:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47334.83814; Tue, 08 Dec 2020 10:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmacq-0007QA-0e; Tue, 08 Dec 2020 10:53:44 +0000
Received: by outflank-mailman (input) for mailman id 47334;
 Tue, 08 Dec 2020 10:53:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmaco-0007Pr-SD
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 10:53:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e254554-1d65-4a37-a7aa-8e6df17c2d31;
 Tue, 08 Dec 2020 10:53:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FD19AC9A;
 Tue,  8 Dec 2020 10:53:40 +0000 (UTC)
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
X-Inumbo-ID: 1e254554-1d65-4a37-a7aa-8e6df17c2d31
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607424820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=teVdR5LWjpy28H32W12XwS95Be7kWecWh2vWuKGHkPg=;
	b=iKSRRceQ9Z5BCHv0dMekUMJWwLEJSjpw1hr/9jiDcEtOk1D9UCtTIHw83H8s9dyW0zcrz2
	2uNgzLj2rxNOiW81Q10VcC7wiOSWckjd5F9JpgUHg6oDwdAEM94KHUvBPVDLug58yei0e6
	grMaxdMJVmAf0hiqvyFA0HOYXGhLwf4=
Subject: Re: [RFC] design: design doc for 1:1 direct-map
To: Fam Zheng <fam@euphon.net>
Cc: Julien Grall <julien@xen.org>, Bertrand.Marquis@arm.com,
 Kaly.Xin@arm.com, Wei.Chen@arm.com, nd@arm.com, Paul Durrant <paul@xen.org>,
 Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <20201208052113.1641514-1-penny.zheng@arm.com>
 <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
 <b53b7ea5-51f2-8746-8d0d-17d2b57ecc89@suse.com> <20201208102205.GA118611@dev>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2c7e96e1-9a34-4a9d-2a8f-7479d46f1a92@suse.com>
Date: Tue, 8 Dec 2020 11:53:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208102205.GA118611@dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.12.2020 11:22, Fam Zheng wrote:
> On 2020-12-08 10:12, Jan Beulich wrote:
>> On 08.12.2020 10:07, Julien Grall wrote:
>>> On 08/12/2020 05:21, Penny Zheng wrote:
>>>> --- /dev/null
>>>> +++ b/docs/designs/1_1_direct-map.md
>>>> @@ -0,0 +1,87 @@
>>>> +# Preface
>>>> +
>>>> +The document is an early draft for direct-map memory map
>>>> +(`guest physical == physical`) of domUs. And right now, it constrains to ARM
>>>
>>> s/constrains/limited/
>>>
>>> Aside the interface to the user, you should be able to re-use the same 
>>> code on x86. Note that because the memory layout on x86 is fixed (always 
>>> starting at 0), you would only be able to have only one direct-mapped 
>>> domain.
>>
>> Even one seems challenging, if it's truly meant to have all of the
>> domain's memory direct-mapped: The use of space in the first Mb is
>> different between host and guest.
> 
> Speaking about the case of x86, we can still direct-map the ram regions
> to the single direct-mapped DomU because neither Xen nor dom0 require
> those low mem.
> 
> We don't worry about (i.e. don't direct-map) non-ram regions (or any
> range that is not reported as usable ram from DomU's PoV (dictated by
> e820 table), so those can be MMIO or arbitrary mapping with EPT.

For one, the very first page is considered special in x86 Xen. No
guest should gain access to MFN 0, unless you first audit all
code and address all the issues you find. And then there's also
Xen's low-memory trampoline living there. Plus besides the BDA
(at real-mode address 0040:0000) I suppose the EBDA also shouldn't
be exposed to a guest, nor anything else that the host finds
reserved in E820. IOW it would be the host E820 to dictate some
of the guest E820 in such a case.

Jan

