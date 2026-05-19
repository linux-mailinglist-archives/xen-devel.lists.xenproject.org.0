Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMU+Af0RDGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:32:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD6257921F
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312463.1582555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEvk-00046O-CH; Tue, 19 May 2026 07:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312463.1582555; Tue, 19 May 2026 07:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEvk-00044Z-9Q; Tue, 19 May 2026 07:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1312463;
 Tue, 19 May 2026 07:31:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPEvj-00044T-JM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPEvi-00CIer-On
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:31:54 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c11e4-bab6-0a2a0a5309dd-0a2a4509c8d8-20
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:31:54 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0c11ea-2497-0a2a45090019-d155d029a915-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:31:54 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-67b32c695efso8723639a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 00:31:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4c31494sm665096166b.20.2026.05.19.00.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 00:31:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779175914; x=1779780714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbzJxX48PuL+8Ew+Ip09xhcY053KY6JIyLgkApHP0X0=;
        b=kKqDq+n+KETROb9PcE0XI2sxbZMtuxosht1bdxrt7zr1XolbJiPWS6LOkKvELQqZeA
         F1dAKc+qSwD5qKNn7xswgIL/1PGSd2B3IIshwyws4XQG852I2YqhOYs2G/xVIMzv/0VS
         JC3wUqYlf/L9jo7CwDPD1o3X3F0jqLRXmgNyyiGi7+hPbOUgudFrAhAUtxLbrbTu9XOx
         NqDkk0pkFB9zN423kbp5zypHZb4fwUtJRs4mg48dBg4BLyQ24wa/2DMs1YbjuYNH6RX6
         rQtFcMD46S0dTW7Ww9kDcCdd1/cHBWxPw12ujUMU+zhLJZ3YrY8NO1l/RNPtr7qpWFrk
         rYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175914; x=1779780714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbzJxX48PuL+8Ew+Ip09xhcY053KY6JIyLgkApHP0X0=;
        b=msrDLtVu7bN8qOkDMNyowpbwJFCyQ0NA16bDnzDU7eJP9sl9/NzBYHXZqfz/TfmHQu
         6oukKA/LdZ6Evt5iFCJ4A7UDUc65b0lL6uf1A0WGmjyVHrD/UwVCB5HcsXYDioBGyN1e
         We2D3wwz8Ews6Fkd9stmvKO4Yu9OK8euD5AIlzwKhO6krRPX8wz237XH5cl4Ul/ZzGdk
         gyR80QpU05M5J8AtVhNaunvSxpz0OyK3tZ2yqKQKlV85Izudn5Baxa4CkOAXXex3vyhR
         Lc3BlZeEkyZEpSya7G7aIsKvRxvVnv3NPjZa29HOnR3kMg2KO4zKpvCZBYXy4YfAJaig
         j56Q==
X-Forwarded-Encrypted: i=1; AFNElJ9RdDGQSbOm+d3Z2sknSksiCr5mteLFiszYFg6Pg3vzh1Nez5bU3aI33j8rpdR/9yBfXiPoxC5KD4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXhUqaivCd0KviOVL5ZAPBZzaSOSr9mudBh0OAzq2l56p3SC4p
	fJUVT271pm6Pf7cp/xtLUJ3ATc3DYr7ntSSUvl7qP/iaQIfx/PqPwLmk
X-Gm-Gg: Acq92OGNZxX5UEFlFoMhLNHxz2UFrmQrlivf8H7J7vY1/IwpGjsIK6w6AJk23b3jKLS
	nRJF4nVnxwU4MrRrBvmQlmkrjFeLyDE0GyHK6zeJs2vzPws/GzqdJ2Bj1jyaSSakUHAhq4MgWJZ
	Xq4yddB/guVfoHc1TQFpqJ2U+XXGX/Cg4T9d5fs3/KCQ6OwK14vvLukUsljBmadWG/livLloLOE
	hl4RhRgj44GRcnDMnO2tokU5EyXHBfeaMnVDw70EdtftlxDxrI4CRkz3FFf+irYMrYla+ZC2HXk
	QxR7UMoqHF+ygWHhLov4TR33KoTHc3BKgnPHtFfn/n9xZpcFni6q3t0zUndJTst1vkaz7kmVhNp
	LfIdcg7E1chz+T1ialDmOuthh6aohDQ7/8brc5RV2cLzcpGOVNAoHpOKXYcaqK1xbTiqPTU+eAg
	ohBfTb93Lhpyb6Ss0iRYr1cYzrQC60bFARAc/bT9d6a4p9tm0/q3G6k5wYr0yZI99Q2GTksjFmb
	qrLsLIuh3qzNw==
X-Received: by 2002:a17:907:3e90:b0:bd5:eb9:6a53 with SMTP id a640c23a62f3a-bd51534c4acmr848149266b.4.1779175913759;
        Tue, 19 May 2026 00:31:53 -0700 (PDT)
Message-ID: <9892bcb1-4ba2-4bea-a703-5f4d64142799@gmail.com>
Date: Tue, 19 May 2026 09:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] tools/xenstore: fix issue related to XSA-417
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260429120619.1013440-1-jgross@suse.com>
 <7a911029-57ba-421d-9657-03762dfe1109@gmail.com>
 <8b37000c-1b44-4ae8-acf4-5ea3e4f069d9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b37000c-1b44-4ae8-acf4-5ea3e4f069d9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779175914-89174A53-1B3E1879/10/73395122804
X-purgate-type: spam
X-purgate-size: 3577
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5CD6257921F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 6:18 PM, Juergen Gross wrote:
> On 12.05.26 17:48, Oleksii Kurochko wrote:
>>
>>
>> On 4/29/26 2:06 PM, Juergen Gross wrote:
>>> There is one corner case of XSA-417 which wasn't handled completely
>>> with the patches back then.
>>>
>>> The XSA-417 fixes tried to solve the problem, that a new domU would
>>> inherit access permissions to access Xenstore entries with that domid
>>> listed in the access rights. In order not to make it easy for a domU
>>> to query existence of a domid, adding permission for a non-existing
>>> domain is not rejected by Xenstore. The XSA-417 patches solved that
>>> problem by adding a flag to a permission entry referencing a not
>>> existing domain, indicating that the permission should not be
>>> effective for Xenstore.
>>>
>>> One corner case was not handled:
>>>
>>> Consider guest 1 and guest 2 running. Guest 1 adds guest 2 to be able
>>> to access a Xenstore entry. Now guest 2 is removed from the system and
>>> a new guest 3 with the same domid as guest 2 had is being created.
>>>
>>> When guest 3 would try now to access the Xenstore entry, it would fail,
>>> as Xenstore would see that the Xenstore entry is older than guest 3.
>>>
>>> But if guest 1 is modifying the permissions of the Xenstore entry
>>> again, e.g. by adding another domain, the permission entry for guest 2
>>> would lose its "special flag", resulting in guest 3 now really gaining
>>> access to the Xenstore entry.
>>>
>>> This series is fixing this problem by the following means:
>>>
>>> - In order to allow guests to know that a Xenstore entry permission
>>>    might have gone stale, allow unprivileged guests to receive
>>>    @releaseDomain watch events. This doesn't open a security hole, as
>>>    the only knowledge which can by gathered from that change is that a
>>>    domain is gone, not that a domain with a specific domid is existing.
>>>
>>> - When a domain is removed, remove all permissions relating to this
>>>    domain from all Xenstore entries.
>>>
>>> Note that this issue was discussed by the Xen security team and we
>>> decided not to issue an XSA, as there are no known use cases where one
>>> unprivileged guest would grant access to its Xenstore nodes to more
>>> than one other unprivileged guests.
>>>
>>> We decided to delay this patch series until the watch depth feature has
>>> been committed, as with that feature available it is now possible for
>>> a guest to handle the death of a specific domain in a sane way.
>>>
>>> Changes in V2:
>>> - some minor comments addressed
>>>
>>> Denis Mukhin (1):
>>>    xen/public: introduce DOMID_ANY
>>>
>>> Juergen Gross (3):
>>>    tools/xenstored: add support for "all domains" node permission
>>>    tools/xenstored: allow @releaseDomain watch for all domains
>>>    tools/xenstored: remove permissions related to dead domain
>>>
>>>   docs/man/xl.cfg.5.pod.in        |  4 ++
>>>   tools/xenstored/core.c          | 45 ++++++++++++++-----
>>>   tools/xenstored/domain.c        | 78 +++++++++++++++++++++------------
>>>   tools/xenstored/domain.h        |  3 +-
>>>   xen/include/public/io/xs_wire.h |  2 +
>>>   xen/include/public/xen.h        |  7 +++
>>>   6 files changed, 100 insertions(+), 39 deletions(-)
>>>
>>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I believe this series can be committed now, as Stefano has Ack-ed patch 1?

Yes, it can be committed now.

Thanks.

~ Oleksii

