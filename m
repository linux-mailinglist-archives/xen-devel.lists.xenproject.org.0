Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9B76F0DB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 19:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576557.902819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRcRE-0008UO-Nx; Thu, 03 Aug 2023 17:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576557.902819; Thu, 03 Aug 2023 17:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRcRE-0008Rg-KP; Thu, 03 Aug 2023 17:48:40 +0000
Received: by outflank-mailman (input) for mailman id 576557;
 Thu, 03 Aug 2023 17:48:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRcRD-0008Ra-6I
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 17:48:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRcR9-0005Ru-On; Thu, 03 Aug 2023 17:48:35 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.22.21]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRcR9-00073Z-Ha; Thu, 03 Aug 2023 17:48:35 +0000
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
	bh=N/IdIBSW66PnSSQRHQYBquFMdTZrRodDkH43DUfQZPo=; b=TL/HMBFJG7Z1M2lVBn4aVt8DTP
	wVhGgLGjhZFM89oBkoU5X9UMvtBowaekcRCusRlDiKN+2kNkvkfgJXRs3p3ZTnjIm+/KEK2tR+EQS
	BURe1BBC78eGcpv3IvHAeyJwPGDRp+ZyUkAmaa6ipiJJdSS/vU6hI0VfGsH4x4SWVh6g=;
Message-ID: <82914e71-fa96-490c-b584-a90045a71567@xen.org>
Date: Thu, 3 Aug 2023 18:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Content-Language: en-GB
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690990427.git.ehem+xen@m5p.com>
 <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
 <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
 <8074634d-fd76-43fc-8e0f-4c3a70ea5360@xen.org>
 <ZMvnqAJuBQSVbKYc@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZMvnqAJuBQSVbKYc@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2023 18:45, Elliott Mitchell wrote:
> On Thu, Aug 03, 2023 at 05:34:31PM +0100, Julien Grall wrote:
>>
>> On 03/08/2023 17:13, Elliott Mitchell wrote:
>>>
>>> I didn't know which way to go, so with no idea which option to choose the
>>> last one ended up winning out.  Perhaps that was wrong yet I've still no
>>> feedback on the actual patches.
>>
>> Not sure if this is related to the lack of answer. But I didn't receive
>> any of your patches via xen-devel (I received your replies). Skimming
>> through the bounce for the xenproject mail server, I noticed a lot of
>> the following:
>>
>>       host gmail-smtp-in.l.google.com [142.250.123.26]
>>       SMTP error from remote mail server after pipelined end of data:
>>       550-5.7.1 This message is not RFC 5322 compliant. There are
>> multiple Cc headers.
>>       550-5.7.1 To reduce the amount of spam sent to Gmail, this message
>> has been
>>       550-5.7.1 blocked. Please visit
>>       550 5.7.1
>> https://support.google.com/mail/?p=RfcMessageNonCompliant
>> t7-20020a81e447000000b005839e8b595dsi12027284ywl.554 - gsmtp
> 
> That seems to be repotting a bug in `scripts/add_maintainers.pl`.

I am curious to know why you think so?

I have been using scripts/add_maintainers.pl for quite a while and so 
far never seen any of my e-mail blocked.

My usual runes are:

42sh> scripts/add_maintainers.pl -d .
42sh> git-send-email *.patch

What's yours?

Cheers,

-- 
Julien Grall

