Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1486FB0D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 08:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688168.1072044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2yr-0005mh-RW; Mon, 04 Mar 2024 07:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688168.1072044; Mon, 04 Mar 2024 07:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh2yr-0005kD-O7; Mon, 04 Mar 2024 07:43:25 +0000
Received: by outflank-mailman (input) for mailman id 688168;
 Mon, 04 Mar 2024 07:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ri59=KK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rh2yq-0005k7-Rn
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 07:43:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0c8fb30-d9fa-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 08:43:23 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 12CF8349E8;
 Mon,  4 Mar 2024 07:43:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6EA813A58;
 Mon,  4 Mar 2024 07:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bwfZLpp75WVJYAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Mar 2024 07:43:22 +0000
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
X-Inumbo-ID: e0c8fb30-d9fa-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709538203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkiNMnTbTAHGINJWDQ3poLt+ddrjyXf+lv6FOqblIO0=;
	b=GExr2xoMh2Vyg989TZQyWPeOxLdQ5LNCSgD64WtobCJIgWKyxcuE8kHb+lcRFUJ1L6YZq1
	u7wv5ligUTZz/7V3pth03Q2jQ6vzwiVdysdverVB3PwIfzOj/Jreb+LtD2fwbssoiGqYm3
	2PM9U8fAZKcJKfC6yw42o/782MJ6u44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1709538203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkiNMnTbTAHGINJWDQ3poLt+ddrjyXf+lv6FOqblIO0=;
	b=GExr2xoMh2Vyg989TZQyWPeOxLdQ5LNCSgD64WtobCJIgWKyxcuE8kHb+lcRFUJ1L6YZq1
	u7wv5ligUTZz/7V3pth03Q2jQ6vzwiVdysdverVB3PwIfzOj/Jreb+LtD2fwbssoiGqYm3
	2PM9U8fAZKcJKfC6yw42o/782MJ6u44=
Message-ID: <4848c844-60b7-411d-982b-7057803dd296@suse.com>
Date: Mon, 4 Mar 2024 08:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-11-jgross@suse.com>
 <a037facf-c4d9-491f-b39f-56ed4221abf1@suse.com>
 <d54d0774-0b73-4431-9d17-35b544bf91c3@suse.com>
 <a2c8f733-eef6-4af2-87c2-989f1772baea@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a2c8f733-eef6-4af2-87c2-989f1772baea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.30)[74.86%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.67)[subject];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.28

On 04.03.24 08:25, Jan Beulich wrote:
> On 01.03.2024 15:37, Juergen Gross wrote:
>> On 29.02.24 16:32, Jan Beulich wrote:
>>> On 12.12.2023 10:47, Juergen Gross wrote:
>>>> +#define nrspin_lock_irqsave(l, f)                               \
>>>> +    ({                                                          \
>>>> +        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
>>>> +        ((f) = __nrspin_lock_irqsave(l));                       \
>>>
>>> I don't think the outer pair of parentheses is needed here.
>>
>> Turns out it is needed. Otherwise something like:
>>
>>
>> if ( a )
>>       nrspin_lock_irqsave(l, f);
>> else
>>       ...
>>
>> will fail with "else without a previous if".
> 
> That's for "outer" in the whole #define I suppose, when I commented on
> just a specific line inside the construct.

Sorry, I applied your remark to the wrong context.

Yes, one level of parentheses can be removed from this line.


Juergen

