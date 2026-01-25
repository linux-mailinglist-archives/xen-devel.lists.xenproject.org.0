Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK5YC8VmdmlaQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jan 2026 19:53:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B432781D95
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jan 2026 19:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213178.1523777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vk5E4-0002ON-Uq; Sun, 25 Jan 2026 18:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213178.1523777; Sun, 25 Jan 2026 18:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vk5E4-0002LM-Nt; Sun, 25 Jan 2026 18:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1213178;
 Sun, 25 Jan 2026 18:52:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nafa=76=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1vk5E3-0002LG-AF
 for xen-devel@lists.xenproject.org; Sun, 25 Jan 2026 18:52:43 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04cd0967-fa1f-11f0-9ccf-f158ae23cfc8;
 Sun, 25 Jan 2026 19:52:39 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1769367152629127.78929580959903;
 Sun, 25 Jan 2026 10:52:32 -0800 (PST)
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
X-Inumbo-ID: 04cd0967-fa1f-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1769367155; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cLxw9roBtPZ3ZDFulQP7UF/fixC+00no83BUU51snAMmP9sihWfWNJrPz6Vg6vCq5ZeeqigzwgfbW6qOsJ6ZCiMxgnrMxLQ7K/g8NPK19MLe2HTFlY/rAfXqNdeu5O9osjzTbqri32BKGoMbFSbm1dO4dWAg4qkBKrfFagM6u6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769367155; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fpCDa+YmQ8klc3AsKbg4Y+UkSZywU76DhPfBguIqN5g=; 
	b=RyQMlWyhr1f7JEGrNp84ecLVYQ7LeVmXc4MC8w24SkChCWx5UG76tAhvgUxBlaLX+8KRMhDl3o3BsIR9F8Q6HLvWjgaiY5ZjGrjEHowZAOonMRTU9jqzNAgzMuVba3YsP0USuC9tTKJ9PfL7/R97B3+PFY3v7/eEmmzMSOZPQ68=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769367155;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fpCDa+YmQ8klc3AsKbg4Y+UkSZywU76DhPfBguIqN5g=;
	b=Oeb6yTqT6b1qdd96T3gu/nNr3wrMva6xIGvDvBuSDa9LUDDNZ2T2z5qwhvkoiAJy
	6cgpcaf0dT2KZu2O/P1Vor13in0/q4IH6UmyIwULHTkUJS315qEtruTcmnHsXvgGyD8
	YE5LSzCzTQrJt7K6gjj28Zi0shV2CbmHlF7hN5D8=
Message-ID: <28556db6-1c04-4dcd-8e20-2c41d877d4bd@apertussolutions.com>
Date: Sun, 25 Jan 2026 13:52:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] flask: fix gcov build with gcc14+
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <875df90d-1d3a-416b-a958-3d3a31144f85@suse.com>
 <0e188989-9190-4f3b-9c45-f4e3d460daca@suse.com>
 <DD50FA01-2162-4009-8D60-9F6D0DAD3C35@apertussolutions.com>
 <f9b04a4a-4ed5-40d7-a852-9a30db179c18@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <f9b04a4a-4ed5-40d7-a852-9a30db179c18@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[apertussolutions.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B432781D95
X-Rspamd-Action: no action

On 1/21/26 8:35 AM, Jan Beulich wrote:
> On 21.01.2026 14:14, Daniel P. Smith wrote:
>> Apologies, I've been on travel for the last two weeks and I wasn't comfortable acking this with just a read of the diff. The thing that bothers me that I want to understand better is why only after the else does it worry about null terminated. Additionally, stepping back, a casual reader of the code is going to wonder why only after some reads into the buffer does it need a null while others do not.
> 
> I'm curious to know of an example or two which you refer to here, as ...

The diff does not show the size of buf, and I was not going to assume 
the size. Had the explanation said something to the extent that when an 
array of size N is used as a buffer that is filled with N-1 (or less?) 
bytes under a conditional, gcc15 complains about the trailing bytes 
being uninitialized. Without the context about the buffer size, it was 
not clear to me from your explanation, or the link, as to why only under 
the else cases need setting the value on your last byte and not under 
the initial if.

Now that I have better context, my initial concerns were not valid and 
am more comfortable providing the ack.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>> I think most people would find that as a red flag that an underlying issue is getting papers papered over. I will be back from travel this weekend and I will sit down and review with more context.
>>
>> V/r,
>> DPS
>>
>> On January 19, 2026 8:50:02 AM CST, Jan Beulich <jbeulich@suse.com> wrote:
>>> Daniel,
>>>
>>> On 08.01.2026 10:18, Jan Beulich wrote:
>>>> Gcc's "threading" of conditionals can lead to undue warnings, as reported
>>>> in e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116519 (no matter
>>>> that the overall situation is different there). While my gcc15 complains
>>>> ("buf[2] may be used uninitialized in this function") about only two of
>>>> the three instances (not about the one in type_read()), adjust all three
>>>> to be on the safe side.
> 
> ... I've already extended the change to cover all three similar patterns, no
> matter that only two triggered a warning.
> 
> Jan


