Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGctIjMq3mmSoQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:51:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE43F99BB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281681.1564548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcIJ-00030S-5f; Tue, 14 Apr 2026 11:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281681.1564548; Tue, 14 Apr 2026 11:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCcIJ-0002yF-22; Tue, 14 Apr 2026 11:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1281681;
 Tue, 14 Apr 2026 11:51:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wCcIH-0002y9-AC
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCcIG-006dsP-Mw
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:51:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de2a1d-e002-0a2a0a5209dd-0a2a4506e108-34
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:51:00 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69de2a24-0df0-0a2a45060019-d155dd2fe5bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:51:00 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43d43e09de5so3262103f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 04:51:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d73e36e7csm20916876f8f.10.2026.04.14.04.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:50:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776167460; x=1776772260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHMm9J6eMxk5SMR7O1VKUQp9xNw6YbW8N0bTJ96bi9A=;
        b=CHhQwOA6yPBvHnFDiwf6h1C3NB95DzsnZBdvGdYi+aeUb9rZthmMzie7lsT39U/Ol0
         ecgQ+naVyMyL7SopFvdhjT8z5MXHyUDTzb3MmilpNX4bTEx9fPYJWCUTBphwPu/2+pqo
         hVSJRUceFdd9MUfWwMbTtFPaBGlnzkJuly/YdrBeOOz9/uF+N2wRdv0Slnfki9FO6K/e
         3l4s+YkfgUPIR4F3yZj9NRZ16G0pXuu5c85QJr4iYtYdK+nPMlmP28wdCY+JxmdNBgsK
         /JaCrpFol/K1AisXl1h4/J6u+MClkCRLM7CdMjUj8V4SiKgTS5PO2NCnwNmcJ2mEvw88
         /z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167460; x=1776772260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHMm9J6eMxk5SMR7O1VKUQp9xNw6YbW8N0bTJ96bi9A=;
        b=nhN15zsy55SUlUZ2MeJt4GxYY+sFFHlMM+/LJgCQhkWUAiT5VOhgWpvSXmvX5PHf1a
         RpssJPOWPwzvLexQaXSBWqeEuXn6mka8aUOJfJrJjoMMTq1MkKfmWwJ7fL+SofulYZfE
         6EQ2qiz6J9vRoPtkzGaD5IEU8/F1roq0Y2yML9ZYfouLMUgNAo00REJlsLc8NNtdlJ04
         sGbdTp+bKfvASpmfGZRY+g+EjSu0VivuNarEyRNFy8OP9ifp+x+uU2XEtph6nJS7SDkC
         k3UG9rL60XcDzRtitYpmynK9TVzAmyacFt0lgV0TJkKEaVToNnA/B806Pzq8jHc0MGWs
         bdPA==
X-Forwarded-Encrypted: i=1; AFNElJ8EaxnhCsXGFYP0Fj776Z6L7+xsyzS0eTWsXPUdI8ieowlTNKBXrU1RIDpMm2KCWV1V6TA9wAsCMac=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKih4AcljcT/PGMn/BXews24By2nUAnWauga3Q0icIdtzfUW6o
	GnF+JFJAckm4kuA/zyl7naASyw8WyxwefErS9ww992yrhC/vdYvJ20ZY
X-Gm-Gg: AeBDietLkA7Tttat9QLa4Y3wYdzWG9VSHhWkrjjyfr1bw7WE6zKGbA5G/qFH3/jhcwO
	NVUg944LXQK7S9J7qKsKm6EOOJlrRGQg5NuOBeiMdTePAjs80sTMhUVKjj6TWTIkpM//g6iUVR9
	L04BEk5hOrTv/cQWQfaTbTgvathBqxXBgH8SLnPsKEwhgSktk8tElR42qIuQs0EODS35KTLbW07
	S9djEGNRQlkdJUuPTgokpgYLkVGYaHHZ0VpqJ5UCHU8ipW+p6VpZqwjlcqvJPRP7ir+eBW4OhPO
	So6RBqEJVNlpusvrU3higcMfTB/KDgLDWRW56k+OBjkgdfxAij/0O8xJb30NR+qvswF3qDmxKCE
	grulKQ6v1Rns8c5/nlba6vRS2/uo9RnvsyJ5KBL/A5EyEmU8YWirAIL2U/qtOz9jE+kGXVd0JI6
	1ja+R51cagaFUwC3vGrd40hIJalJEhD0qt0d3dj7K3B1HlzUjlW7z5xyVZcIngzWJkVmGk7a//X
	w8S0orE5SWJYQ==
X-Received: by 2002:a05:6000:2211:b0:43c:fd92:f432 with SMTP id ffacd0b85a97d-43d6425968amr26524599f8f.2.1776167459881;
        Tue, 14 Apr 2026 04:50:59 -0700 (PDT)
Message-ID: <e3f6e9f4-1ad1-449e-8a5e-a09579d89c6d@gmail.com>
Date: Tue, 14 Apr 2026 13:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 24/27] xen/riscv: init rcu
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <c55191b5c4ec8f42bc73bfb2d680945b439c6db6.1773157782.git.oleksii.kurochko@gmail.com>
 <81e37c32-56dd-43eb-97a0-ffe405e1ac19@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <81e37c32-56dd-43eb-97a0-ffe405e1ac19@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776167460-5FD3C3D8-9632AE81/10/73395122804
X-purgate-type: spam
X-purgate-size: 298
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 36BE43F99BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/26 5:03 PM, Jan Beulich wrote:
> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Fold patches 23-25 into a single one, with an adjusted title?

I am totally okay with that. I will do that.

Thasnks.

~ Oleksii

