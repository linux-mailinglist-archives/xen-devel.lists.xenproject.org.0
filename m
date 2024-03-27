Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957088E152
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 13:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698511.1090241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSqU-0007W6-8b; Wed, 27 Mar 2024 12:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698511.1090241; Wed, 27 Mar 2024 12:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpSqU-0007T6-5i; Wed, 27 Mar 2024 12:57:34 +0000
Received: by outflank-mailman (input) for mailman id 698511;
 Wed, 27 Mar 2024 12:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9jY=LB=suse.de=dkirjanov@srs-se1.protection.inumbo.net>)
 id 1rpSlg-0007Oj-K3
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 12:52:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1c6cd9d-ec38-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 13:52:34 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04C9B21C16;
 Wed, 27 Mar 2024 12:52:34 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6393713AB3;
 Wed, 27 Mar 2024 12:52:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id vJfwFJEWBGZKOAAAn2gu4w
 (envelope-from <dkirjanov@suse.de>); Wed, 27 Mar 2024 12:52:33 +0000
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
X-Inumbo-ID: e1c6cd9d-ec38-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711543954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uTJ3ZkxHMF5Lg7sxSMlW6kd+Qw7Xng5HTdbxK7Wof4=;
	b=lRo4EXOIZ0PFCRxj97ASMDb/92D87kAW1uMhrsUyPi3Tb/JtWPRWjSK4rv+YvAJydIVWby
	S8TKicLKe3hgL5/cstTHth+vz1FCcvzJlOFLTmj8yj/X8bzEEXhdkfws9o7OQy75msj8Fu
	uIVfPY5JwPnfzfSy/oPCitnCP37uL4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711543954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uTJ3ZkxHMF5Lg7sxSMlW6kd+Qw7Xng5HTdbxK7Wof4=;
	b=BNhwN7gUTUyBZchNrbOCuZwfLkjsvj84qBA8S45AW8T3PMb+SrJI0oyxpwY2VjTPu/5xkr
	q/4tH6HdOHnKJqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711543954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uTJ3ZkxHMF5Lg7sxSMlW6kd+Qw7Xng5HTdbxK7Wof4=;
	b=lRo4EXOIZ0PFCRxj97ASMDb/92D87kAW1uMhrsUyPi3Tb/JtWPRWjSK4rv+YvAJydIVWby
	S8TKicLKe3hgL5/cstTHth+vz1FCcvzJlOFLTmj8yj/X8bzEEXhdkfws9o7OQy75msj8Fu
	uIVfPY5JwPnfzfSy/oPCitnCP37uL4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711543954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uTJ3ZkxHMF5Lg7sxSMlW6kd+Qw7Xng5HTdbxK7Wof4=;
	b=BNhwN7gUTUyBZchNrbOCuZwfLkjsvj84qBA8S45AW8T3PMb+SrJI0oyxpwY2VjTPu/5xkr
	q/4tH6HdOHnKJqAA==
Message-ID: <c4e83bff-18a6-4cbd-9412-b1da83f7358e@suse.de>
Date: Wed, 27 Mar 2024 15:52:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen NIC driver have page_pool memory leaks
To: Jesper Dangaard Brouer <hawk@kernel.org>, paul@xen.org,
 Arthur Borsboom <arthurborsboom@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Netdev <netdev@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 kda@linux-powerpc.org
References: <CALUcmUncphE8v8j1Xme0BcX4JRhqd+gB0UUzS-U=3XXw_3iUiw@mail.gmail.com>
 <1cde0059-d319-4a4f-a68d-3b3ffeb3da20@kernel.org>
 <857282f5-5df6-4ed7-b17e-92aae0cf484a@xen.org>
 <ba4ac0f4-7a95-4fb2-b128-d7b248e4137a@kernel.org>
Content-Language: en-US
From: Denis Kirjanov <dkirjanov@suse.de>
In-Reply-To: <ba4ac0f4-7a95-4fb2-b128-d7b248e4137a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.29
X-Spamd-Result: default: False [-1.29 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 FREEMAIL_TO(0.00)[kernel.org,xen.org,gmail.com,linaro.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Flag: NO



On 3/27/24 14:27, Jesper Dangaard Brouer wrote:
> 
> 
> On 25/03/2024 13.33, Paul Durrant wrote:
>> On 25/03/2024 12:21, Jesper Dangaard Brouer wrote:
>>> Hi Arthur,
>>>
>>> (Answer inlined below, which is custom on this mailing list)
>>>
>>> On 23/03/2024 14.23, Arthur Borsboom wrote:
>>>> Hi Jesper,
>>>>
>>>> After a recent kernel upgrade 6.7.6 > 6.8.1 all my Xen guests on Arch
>>>> Linux are dumping kernel traces.
>>>> It seems to be indirectly caused by the page pool memory leak
>>>> mechanism, which is probably a good thing.
>>>>
>>>> I have created a bug report, but there is no response.
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=218618
>>>>
>>>> I am uncertain where and to whom I need to report this page leak.
>>>> Can you help me get this issue fixed?
>>>
>>> I'm the page_pool maintainer, but as you say yourself in comment 2 then
>>> since dba1b8a7ab68 ("mm/page_pool: catch page_pool memory leaks") this
>>> indicated there is a problem in the xen_netfront driver, which was
>>> previously not visible.
>>>
>>> Cc'ing the "XEN NETWORK BACKEND DRIVER" maintainers, as this is a driver
>>> bug.  What confuses me it that I cannot find any modules named
>>> "xen_netfront" in the upstream tree.
>>>
>>
>> You should have tried '-' rather than '_' :-)
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/xen-netfront.c
>>
> 
> Looking at this driver, I think it is missing a call to skb_mark_for_recycle().
> 
> I'll will submit at patch for this, with details for stable maintainers.

Please do

> 
> As I think it dates back to v5.9 via commit 6c5aa6fc4def ("xen
> networking: add basic XDP support for xen-netfront"). I think this
> commit is missing a call to page_pool_release_page()
> between v5.9 to v5.14, after which is should have used
> skb_mark_for_recycle().

Hmm, looks like I've missed it  
> 
> Since v6.6 the call page_pool_release_page() were removed (in
> 535b9c61bdef ("net: page_pool: hide page_pool_release_page()") and
> remaining callers converted (in commit 6bfef2ec0172 ("Merge branch
> 'net-page_pool-remove-page_pool_release_page'")).
> 
> This leak became visible in v6.8 via commit dba1b8a7ab68 ("mm/page_pool:
> catch page_pool memory leaks").
> 
> --Jesper
> 

