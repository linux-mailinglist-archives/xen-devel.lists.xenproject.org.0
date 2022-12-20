Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F8651C90
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466582.725485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YIg-0000MJ-0v; Tue, 20 Dec 2022 08:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466582.725485; Tue, 20 Dec 2022 08:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YIf-0000J7-Tp; Tue, 20 Dec 2022 08:48:37 +0000
Received: by outflank-mailman (input) for mailman id 466582;
 Tue, 20 Dec 2022 08:48:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7YIe-0000J1-8N
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:48:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YIb-0002lH-Ms; Tue, 20 Dec 2022 08:48:33 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.6.189]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7YIb-0006GZ-Gf; Tue, 20 Dec 2022 08:48:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/iHWZExXT7yJ3ujxJIlwbxC6vKUlkup+NGKcMyfIknY=; b=P3S08UieD6oPrn1/RtNHC6Mn6a
	uPhL+1ptUB8MfrruiWyC8YEjgN/IkHoX6mCQbdxjCofnIVHuv1IIvqbU9SzjOp7ZGQKYoPgFbub4m
	G6gFdjUB30QRaCpkVXvwhccfG71rWZ5BF0J2RRgXPGmahEc+FKSmav210WVpEtqkzm7g=;
Message-ID: <f633b729-e422-9fd3-a635-b8617eb6bfb2@xen.org>
Date: Tue, 20 Dec 2022 08:48:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
 <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
 <417c72f4-e9a0-e3cc-1c36-544967d73e34@suse.com>
 <45781a58-61cb-bc8c-c18d-35d054b4b06c@xen.org>
 <a9779d15-2f53-87c1-c4c4-745ac709430a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9779d15-2f53-87c1-c4c4-745ac709430a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 08:45, Jan Beulich wrote:
> On 20.12.2022 09:40, Julien Grall wrote:
>> On 19/12/2022 12:48, Jan Beulich wrote:
>>> On 16.12.2022 13:26, Julien Grall wrote:
>>>> On 19/10/2022 08:41, Jan Beulich wrote:
>>>>> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>>>>>         and alignment) of the runstate area. I don't think it is an option
>>>>>         to require 32-bit code to pass a range such that even the 64-bit
>>>>>         layout wouldn't cross a page boundary (and be suitably aligned). I
>>>>>         also don't see any other good solution, so for now a crude approach
>>>>>         with an extra boolean is used (using has_32bit_shinfo() isn't race
>>>>>         free and could hence lead to overrunning the mapped space).
>>>>
>>>> I think the extra check for 32-bit code to pass the check for 64-bit
>>>> layout would be better.
>>>
>>> I'm afraid I can't derive from your reply what it is you actually want.
>>
>> I think for 32-bit call, we also want to check the address provide will
>> also pass the 64-bit check (i.e. if used as a 64-bit layout, the area
>> would not cross a page boundary and be suitably aligned).
> 
> But that's specifically what I say I don't think is an option. First and
> foremost because of the implication on 32-bit callers: They're need to
> use magic to get hold of the size of the 64-bit variant of the struct.

I understand that. But I am not aware of any other (simple) approach 
where you could have race free code.

So between a non-race free code and exposing the restriction to the 
guest, I would chose the latter.

Cheers,

-- 
Julien Grall

