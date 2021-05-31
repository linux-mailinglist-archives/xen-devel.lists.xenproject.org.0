Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8089395596
	for <lists+xen-devel@lfdr.de>; Mon, 31 May 2021 08:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134449.250130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbgY-0001BI-Qp; Mon, 31 May 2021 06:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134449.250130; Mon, 31 May 2021 06:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lnbgY-00018O-NJ; Mon, 31 May 2021 06:46:02 +0000
Received: by outflank-mailman (input) for mailman id 134449;
 Mon, 31 May 2021 06:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lnbgW-00018I-Ka
 for xen-devel@lists.xenproject.org; Mon, 31 May 2021 06:46:00 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c24a3ac-4b8d-46bf-914e-8420d47e461a;
 Mon, 31 May 2021 06:45:58 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAD601FD2F;
 Mon, 31 May 2021 06:45:57 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id AF015118DD;
 Mon, 31 May 2021 06:45:57 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9qCUKSWGtGAUBAAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Mon, 31 May 2021 06:45:57 +0000
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
X-Inumbo-ID: 7c24a3ac-4b8d-46bf-914e-8420d47e461a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622443557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFERr/SKsSWC0NTHViDSjyKZ4DXOlLCMrJuF9hKQ508=;
	b=akBQMsIXsGpFdzPUpFnNPYyiUxJCmu7Hfbi2Cz+dHnB8UIYTytWG2lhKDqyR5rhuOSilBj
	a0iqPGNQbX9uUyqKQ5cFQZTGEt9hYAKAK/OFHldMrNQgg77GHzf3sVpaxdI3V2b7i20eRq
	nBTOhxA6LXsGUOlxHMDAl1b2GSNvR2E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622443557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFERr/SKsSWC0NTHViDSjyKZ4DXOlLCMrJuF9hKQ508=;
	b=akBQMsIXsGpFdzPUpFnNPYyiUxJCmu7Hfbi2Cz+dHnB8UIYTytWG2lhKDqyR5rhuOSilBj
	a0iqPGNQbX9uUyqKQ5cFQZTGEt9hYAKAK/OFHldMrNQgg77GHzf3sVpaxdI3V2b7i20eRq
	nBTOhxA6LXsGUOlxHMDAl1b2GSNvR2E=
Subject: Re: Invalid _Static_assert expanded from HASH_CALLBACKS_CHECK
To: Tim Deegan <tim@xen.org>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <ccb37c2e-a3a6-a2e4-bf15-da81f97c94be@bugseng.com>
 <38898d21-fe76-36dc-f1e6-497b52c5c0b7@suse.com>
 <YLEP73On6EBjv3Ks@deinos.phlegethon.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11b5b29e-0baf-9f50-6d9e-985e791148b2@suse.com>
Date: Mon, 31 May 2021 08:45:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLEP73On6EBjv3Ks@deinos.phlegethon.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Flag: NO

On 28.05.2021 17:44, Tim Deegan wrote:
> Hi,
> 
> At 10:58 +0200 on 25 May (1621940330), Jan Beulich wrote:
>> On 24.05.2021 06:29, Roberto Bagnara wrote:
>>> I stumbled upon parsing errors due to invalid uses of
>>> _Static_assert expanded from HASH_CALLBACKS_CHECK where
>>> the tested expression is not constant, as mandated by
>>> the C standard.
>>>
>>> Judging from the following comment, there is partial awareness
>>> of the fact this is an issue:
>>>
>>> #ifndef __clang__ /* At least some versions dislike some of the uses. */
>>> #define HASH_CALLBACKS_CHECK(mask) \
>>>      BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
>>>
>>> Indeed, this is not a fault of Clang: the point is that some
>>> of the expansions of this macro are not C.  Moreover,
>>> the fact that GCC sometimes accepts them is not
>>> something we can rely upon:
> 
> Well, that is unfortunate - especially since the older ad-hoc
> compile-time assertion macros handled this kind of thing pretty well.
> Why when I were a lad &c &c. :)

So I have to admit I don't understand: The commit introducing
HASH_CALLBACKS_CHECK() (90629587e16e "x86/shadow: replace stale
literal numbers in hash_{vcpu,domain}_foreach()") did not replace
any prior compile-time checking. Hence I wonder what you're
referring to (and hence what alternative ways of dealing with the
situation there might be that I'm presently not seeing).

>>> Finally, I think this can be easily avoided: instead
>>> of initializing a static const with a constant expression
>>> and then static-asserting the static const, just static-assert
>>> the constant initializer.
>>
>> Well, yes, but the whole point of constructs like
>>
>>     HASH_CALLBACKS_CHECK(callback_mask);
>>     hash_domain_foreach(d, callback_mask, callbacks, gmfn);
>>
>> is to make very obvious that the checked mask and the used mask
>> match. Hence if anything I'd see us eliminate the static const
>> callback_mask variables altogether.
> 
> That seems like a good approach.

Okay, I'll make a patch then.

Jan

