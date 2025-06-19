Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F47AE0386
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019918.1396346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDUP-0007Yc-0l; Thu, 19 Jun 2025 11:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019918.1396346; Thu, 19 Jun 2025 11:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDUO-0007XA-Ty; Thu, 19 Jun 2025 11:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1019918;
 Thu, 19 Jun 2025 11:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTPR=ZC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uSDUM-0007Wn-Tl
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:31:26 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee0a10da-4d00-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:31:23 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so599513f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 04:31:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b74313sm19471221f8f.96.2025.06.19.04.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 04:31:22 -0700 (PDT)
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
X-Inumbo-ID: ee0a10da-4d00-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750332683; x=1750937483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ehJkgAbyggEQYCYMmY956XgyfrGZO0hGxlzMuYgDhw=;
        b=ZhqGlx4PBduRJVpb8w1S73FGcy3FOAfoqy+udDKe/sx/eJlRFYc/KeIiE/l8q0349p
         kXFvnaK9bqASHbBzr0tqBayKMkxZmSfAqcLjWKHXG1W7HRgX6pcYDpCxD6D/fcm8w/oA
         I/vOZ+QrkpXwrHUPi56kq4HZY//irK7ldGXnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332683; x=1750937483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ehJkgAbyggEQYCYMmY956XgyfrGZO0hGxlzMuYgDhw=;
        b=u9lm8TA13Pqs16FB/prAzGzIvm5XOdON6VQrZKISTqaDwTFK9PyrTR7hbvzqo1fdQ8
         7RDnhB7ZNuMytoU6OLPz5AlsgdJVwm3wVsstBN6ZLOUBoFJUQXMd9LgmE48FP+7g/6ht
         8oiI54HatQSiJyeBiju9Bf7s9JaTvqUvo/4CO267D5R/VO6EQsA7fJbNcCCdG2fI/LnR
         M+DnfGBnR669aY/2f9aOdU9Ghfq2ZCRYkJ/QF0ANjp+aQX8EgF+R40j77b8wDFzR481I
         CnvJhJ2ypkBxq0MeVShan24XV+SyIlgjSedo3YqG88l4BCngAQMb8UkOIHK9ptsesNGu
         eI2A==
X-Gm-Message-State: AOJu0YynXNfc4Sa9pUZRDHlcj74Ru3ctJ94I221m9du1TD9wYOR7w8ho
	HZBqhvusGRkUeHfcordOudR/WRa90Mujw76tjXszHe7POBM2mIRi2bOwB1j14xABBmY=
X-Gm-Gg: ASbGnct0L4SxBtLcp05M5296/M6bKaYLpp3ezNv7kqAgvdSsw+dHevnGJEPcJZ2qfTO
	wZEtrHdiWtkSw7aO68I+DoCM5IYy8GUlllj5GpcXnvILsKpG/hRpDyCVz6jgyI3abyOkCeGVPlQ
	EQpQpPlrlc4gOn4mUNeoIyejS3NNG+eEEjSEu4rRmZeBP+gH1sh587/tpInDMVWWct5BizjEito
	K9z7eXeg6OxCpnYxY7LtJWOT4AwLBt1TKjC5BQJ1gN7I1mpJHqVNFqZAfq9sucnJaNAtAgxcXvz
	840HKv2xg6cAn1IhGfche/Oy+cJmeP1C0tGsfvjc6H3WtGfHvg4IBFpZwWBmhkx3LA0zGUTXW85
	Kj2fp/BbDhHFgD0PVGn1BqHb3i3RZTgvmdpL+vA==
X-Google-Smtp-Source: AGHT+IGxkwun+ifyV59KufsXNv7Ckg+d7lxDOQOaYgTNfK2qaTapjjfUwlMwJunAE7mrRblG2Psqvg==
X-Received: by 2002:a05:6000:144d:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a5723a3aebmr18322608f8f.16.1750332683232;
        Thu, 19 Jun 2025 04:31:23 -0700 (PDT)
Message-ID: <2c24aca9-5e67-4c0f-b890-92a0ad8e1975@citrix.com>
Date: Thu, 19 Jun 2025 12:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen PV dom0 "tried to execute NX-protected page" when running
 nested in KVM - 6.15 regression
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
References: <aFPzXVl1pn1LtwoJ@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aFPzXVl1pn1LtwoJ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2025 12:24 pm, Marek Marczykowski-Górecki wrote:
> Hi,
>
> With Linux 6.15.2 I got a crash like below. It worked fine with Linux
> 6.14.11. Furthermore, the failure seems to be hardware-dependent. It
> happens when running on Intel Core i9-13900H, but does not happen when
> running on Intel Xeon E5-2620v4 (in both cases QEMU uses -cpu host).

Yes, it's a known regression in Linux's ITS / CVE-2024-28956 patches.

https://lore.kernel.org/lkml/20250603111446.2609381-1-rppt@kernel.org/

It's hardware-dependent because so is Indirect Target Selection.

~Andrew

