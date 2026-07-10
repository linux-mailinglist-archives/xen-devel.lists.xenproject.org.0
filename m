Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMEdINDWUGpy6AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:26:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137E773A399
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 13:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sEQCBRVp;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359160.1612880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9MP-0005iu-TL; Fri, 10 Jul 2026 11:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359160.1612880; Fri, 10 Jul 2026 11:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi9MP-0005gT-QX; Fri, 10 Jul 2026 11:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1359160;
 Fri, 10 Jul 2026 11:25:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi9MO-0005gN-Li
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 11:25:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi9MO-000R9X-2J
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:25:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50d6a9-5cb7-0a2a0a5109dd-0a2a450bc746-26
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:25:36 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a50d6af-b7da-0a2a450b0019-d1558036d1b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 13:25:36 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so2953165e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 04:25:35 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb742d0esm131335925e9.13.2026.07.10.04.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 04:25:35 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783682735; x=1784287535; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWiWu4LZidz72Cc3wAV2k6Xwhx8sLz2nMcp5QPU7/78=;
        b=sEQCBRVpU6lNJTEz+rcFL3U5QHjdUIJCb0o3jLdLnqSnn0jLyie2cEbZoMP77/K5WG
         XUGE/CI/SD52SoDJf3Io67SXMc4PC43Oh7gEnLyHmyeyU6ALOgoqBabYjCeHogVLjl7/
         QMr+g/n7l4GaqSQGslazdJ4wbcqqBiSJXp2QYdOjgLeQ9t6Hw8prs1mKWxq3kNCzyRAO
         D33+93psonQEvMkjxKrzdDZWD4fRwgGGa6CkmrWZsekmgN3E6hSxfRFQt6Dqpv/Bguzc
         8wR9cF8dOsIN5GF/Izpsj6YtUZ4vkhgMyPS92HILmWTSkN029dUYW0nbFcdBfnwQGd81
         d1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682735; x=1784287535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZWiWu4LZidz72Cc3wAV2k6Xwhx8sLz2nMcp5QPU7/78=;
        b=lCXSYrfln4VFcOM9y3CIeqWKCG4Z9fk7ted9njQRpIzAFgJDhUt8O4ckFDDHxhTVgb
         /VdQEbPs9etpa/qJ79ih0bsykRPzVqpcBA1aA551HideBz3WP/e1AdVSshBG4oL+j4Tu
         VwKH6NgOIpMYUT41OwDLwmFaV9ZjepknJVZOoVyRvldanhlu7u0a6/32iKG3O6DgdVjW
         DUngf4CddEGRwcNuYRRi+U1y8WmfnT45WQ5VEiNmwPe3NlZh/7w5LfgjL6lWxbA5AC6G
         sVdxIc7kNis/pMAJYAsrMLaDhZ114DGcY6RM9ULbS/wTF8+dJ+NbM2QucLkYoyGTF29G
         TUJA==
X-Forwarded-Encrypted: i=1; AHgh+RqBLy/ysivwuCfiKpbVut0EMUGodpCYE1AGjl/VSpDzMPg1oXsL8iJuC0oAChFAdHTfU9m8Upl4qC4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHXUHAWfOUMERoteYnbVp5fOeuR2dD5iIqiXx1m9Qu/r9E7iN3
	RFbQ0sCJuqulrFKgXxMEp2wzoowpDOHw/DGbKth+biGfjHnLikTxi/W6
X-Gm-Gg: AfdE7ckeKod8hX+G7cc2tb/EDmt+ttKRy3RaPCmJtm1L9aZGVgYN9YkHV5XMxKX4yKI
	JGPCO4/CPQCOit89mYysqR5XR2eFr3GBt0bqaJvNs554W7Ltj0QZM+M9wZpRdu6UviSKS9oVlEh
	klwIEMqoNBGnbq/fqTKD5N94eSLCZbzipdFGsonXlj5zmQhDjgWfjfnqqAyjEeCoUfa3LSuqweh
	XHNLy/ASfbWbZ83mRp9x3Q3K5TPhVGh4E6L4optIRwUsAXXRrtFgGUTdqL1yCpicQPiUJJyzGtM
	QUbvy7N0Q3oBFb7ZioM/cMkTeMDrr1Rq4lk+JN7FBroMB5f61dg8o5wKYskGx1095HBBzex2Z3L
	VeiHxzVUrMR4YaWXymRMs4XZ926gMlCK2qO6tq88+2tfXzKbBzV0FBP9skgvCm9gn+4wbMb9+6w
	wJqRoQ1lkQNwbMEFdsvRsn06IMXCYaYx8SBqwSL7ZukFkIVA41foKy6fWH6ZhrHn0Fhko=
X-Received: by 2002:a05:600c:e558:10b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-493e68c6e63mr75459725e9.22.1783682735266;
        Fri, 10 Jul 2026 04:25:35 -0700 (PDT)
Message-ID: <9ab043fc-44c8-48db-821c-52be4d08fd17@gmail.com>
Date: Fri, 10 Jul 2026 13:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
 <e120d275-ec94-41cc-9c54-43966cc18dd8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e120d275-ec94-41cc-9c54-43966cc18dd8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783682736-4A3749ED-7BF2D81A/10/73395122804
X-purgate-type: spam
X-purgate-size: 1485
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,changelog.md:url];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 137E773A399



On 7/10/26 12:07 PM, Jan Beulich wrote:
> On 10.07.2026 11:45, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   CHANGELOG.md | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index 356be88351a9..c6f1fcf5aeec 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - On Arm:
>>      - Support for guest suspend and resume to/from RAM via vPSCI.
>>        Applies only to non-hardware domain guests.
>> +   - Armv8-r MPU support.
>> +   - Drop ThumbEE support.
>> +   - FF-A v1.2 Support.
>> +
>> + - On RISC-V:
>> +   - SSTC extension support for Xen (not for guest yet)
>> +   - Add support of CONFIG_DOMAIN_BUILD_HELPERS which allows to load Linux
>> +     kernel, initrd and allocation related things for domain when device-tree
>> +     is used.
> 
> The first item maybe (with - nit - a full stop added). 

I will add it.

> The second item I'm
> having a hard time seeing how it could be relevant to anyone, until guests
> can actually be created / started in at least a minimalist way.

It shows that we are progressing on that way to boot guest. Maybe the 
following rewording of this item would be better:
   Introduce domain build helpers for device tree-based domains, laying 
the groundwork for guest boot support.

~ Oleksii

