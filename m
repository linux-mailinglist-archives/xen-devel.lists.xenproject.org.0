Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A5C071EC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 18:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150686.1481750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKDY-0004V8-Kx; Fri, 24 Oct 2025 16:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150686.1481750; Fri, 24 Oct 2025 16:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCKDY-0004TE-IG; Fri, 24 Oct 2025 16:00:40 +0000
Received: by outflank-mailman (input) for mailman id 1150686;
 Fri, 24 Oct 2025 16:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvoA=5B=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vCKDX-0004T8-MQ
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 16:00:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944f41f1-b0f2-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 18:00:36 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4711f156326so20709845e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 09:00:36 -0700 (PDT)
Received: from [192.168.1.32] (host-78-149-11-196.as13285.net. [78.149.11.196])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cceebsm9994851f8f.37.2025.10.24.09.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 09:00:35 -0700 (PDT)
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
X-Inumbo-ID: 944f41f1-b0f2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761321636; x=1761926436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K0GqmAGN052aJuSevxt84+tUztQs6XB+96Dqy/eiJTw=;
        b=cM5MICT9gy6Am/M8Lb/30OQ+qLmNFou2gaXZhg3uac2VdR0XyWzxJFlTPn2bdaSqOl
         Ld/VQVajeV5W5GKLfD6O9IUeI6WM+MDfGqf0bLOelGxvWzeWaNrYSROQyPfqKjB0xgS/
         HcqslqznaiqaUHF8s9dBTb7+3wHzSvUoSdJVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321636; x=1761926436;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0GqmAGN052aJuSevxt84+tUztQs6XB+96Dqy/eiJTw=;
        b=HNG7DwgRkFgrHnDXypTsBk91wCkqTvXNGGDqpr+Ykv8F6VaEQyeFfPBn0yOBwE1Fet
         DJ38W4JB2wMx6RdVW6TSTArxHm0RYJa4zPECFBkeEmPqxq+BNGCfVQD+2rtyCSc0yjtN
         eYvNikYByJOhDeXLY7TbgF9Zbb+JEvC4l/EgU2Xg/GvLmqOa3hVAbFXGD5QeUmaPjBQN
         8J3M3yag/5yFATuq7b9eNGu4WILVBB8Zc+6VdDzmOBk7ytJKjbvGCK5t2uDYHVYl12M+
         nJ+DeJXjxhvAau/TgloaH69E43DIGeAEFrkL3rnRzX/IDP5kfD12pLPFjGll2QsLTpQ+
         YFKg==
X-Forwarded-Encrypted: i=1; AJvYcCXICsGGhGtWhK8MjC1ImUnD8CXv4XZptX8IR7M/5qepHo+z9u5rG4EQ7K+9GxzEsz6YQjndiJW4wn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0VVETuzvBw4kY1vCyAE4gcvqCrvpKaHwTwoSadNiXguluslPc
	2m/sJI5XwWosu+ztw2MT6bPPqU5gTeVW0TOCraVdIEgJ+nCjwtS9Rf1uDnAfrMkshCk=
X-Gm-Gg: ASbGncvOn9G6tmcHxoOAVKuHGLGn1PNegr9Ubsz2zzobrt/vhjAFsXaThpjBgVrGa6s
	Ejgb0bcj6sf/Ztkcuc2bP7stUuIeMGvOYRXqfTJNGKZzxtw5cZMasOVYKUaTEbFw0mNejVjGOUD
	sSeDOLotTxXg9I9swhwCqH3JZLOxIBujzes7JHgV7mbn04xr5imEet0t6+njok2dqBsTCI8wtDp
	PY7gL4UYJVd+HXwnsZObmKooRQNkBSxHM9xo1eCTgn5KhAh3ULUX6Wyas2eMBq8PngvZRiHrd0P
	XAwO0eqLdY0I+Jy6El+3jqAEFJOgyoOfWzoQlJsUob2sGxGzjvraa9+koYPa+Z4466pR6+MZ/xs
	gscs18rEcMN/MdxP4UmhvhtGwHOi/IZPdSmFIHGcnzeBMLeh0eSWnO60Jp1h/YaPRjNv9K3CfAF
	sP5lY299kng2JqTJCZvmm0vDzEfbljvK7nRhaNz84iYw==
X-Google-Smtp-Source: AGHT+IHxLXwieKFU7SbuMvhAV5IuXKwh2uJK+nqqalJPbVbgX1whOpzVMwNYutAqY9sad8l/fIMvuw==
X-Received: by 2002:a05:600c:a02:b0:471:3b6:f2d with SMTP id 5b1f17b1804b1-47117931c36mr186999055e9.38.1761321636051;
        Fri, 24 Oct 2025 09:00:36 -0700 (PDT)
Message-ID: <9f202cce-71a8-4f15-967b-b2b109959c2a@citrix.com>
Date: Fri, 24 Oct 2025 17:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pci: prevent infinite loop for faulty SR-IOV cards
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <freddy77@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <CAHt6W4dnM1pLMnDVyywc_2d-6nry7pFCYomSvRjyuH7sRm0J4Q@mail.gmail.com>
 <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <72a2f002-23fd-4d06-8c44-3e535533bec2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2025 4:58 pm, Andrew Cooper wrote:
> On 24/10/2025 4:13 pm, Frediano Ziglio wrote:
>> If a SR-IOV card presents an I/O space inside a BAR the
>> code will continue to loop on the same card.
>> This is due to the missing increment of the cycle variable.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Yes, that's buggy.  Was this from a real card, or just code inspection?

Sorry, sent too early.

This was broken by a1a6d59862f4 ("pci: split code to size BARs from
pci_add_device") when it changed the loop from having an increment, to not.

~Andrew

