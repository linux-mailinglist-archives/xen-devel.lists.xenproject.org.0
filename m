Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC79F5A12
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 00:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859928.1272012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNgcE-0006m8-PT; Tue, 17 Dec 2024 23:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859928.1272012; Tue, 17 Dec 2024 23:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNgcE-0006jO-Mt; Tue, 17 Dec 2024 23:04:34 +0000
Received: by outflank-mailman (input) for mailman id 859928;
 Tue, 17 Dec 2024 23:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNgcD-0006jI-Pr
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 23:04:33 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468530db-bccb-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 00:04:32 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso3038486f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 15:04:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8012170sm12355407f8f.14.2024.12.17.15.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 15:04:31 -0800 (PST)
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
X-Inumbo-ID: 468530db-bccb-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734476671; x=1735081471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B9fleBbi7AT+mll+INXas1kteOqEJlUTlJ+YFTUzAZM=;
        b=RO+heLuhw60k1c/UBWV15/qBka4zMrAuJ1Vbae+3rGTwwcjemOgNjxI1Ti0JvWkEmU
         PhUNQKCSpyPXYAFr1Bf4ZWEsjAAUFMndKlGRmoEs+Z4X8KH+jn520meD16O0aa/QCE/p
         iO1YaAkV9dGoQNY9Ak1SV2cdpGHry9KoiU6a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734476671; x=1735081471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9fleBbi7AT+mll+INXas1kteOqEJlUTlJ+YFTUzAZM=;
        b=jrN8FxQDY5OehZLMjDMQb1x/kT4ZiZ9AH1Aiij2B1OnO1ITfqV0jiQXhCIFx1peAf0
         nI6+lEO6Rn61fpF7DdDnNx9CjkZn0c77UwlzCZ0JZXa2TJeLQ8YaTcAdw/4il1kX5A5C
         aCrP5MeKDn2HneqmwjvBvIg7yjePC6ALOve/U6HU9o312oVOuZZEkYxj06sgvONvZvHn
         XZXKHWdsKFOvvD/JamCs5E3TfPNlEaNwQD/DaHK9cqS9u12odNfZmBHsWlHLh5O98Hx7
         NOkAp6Mn8Kzad/8z8wa66gtvDiO429IeAvAqzH8+B0EoNEVk/us8vlW/fWJWT44fMVkK
         tM5A==
X-Forwarded-Encrypted: i=1; AJvYcCUO9RBbuAUbMSXJGlVURFmcfn9pNcd0iixSBVJ6ljbepjBMSkscYBlP+GVPOO9biiwj5Cg4WGCr++E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/wRQP0bYTCmCpwhYbO5Sk2ILp10STgplERDzDuLZmuYjH3WcO
	6DVUErsl35MHtmq/xPCiJkp5xYRTk8n9s8frcwXJcbEUA8Mvl8wEj1LC9Zx5X6Q=
X-Gm-Gg: ASbGncswfS65HHWdq1R/rCQBa3TUK6gCN+tG21wEMymcLEHITKnkz9pbj/Gha9IiN5r
	6keTrr0N6ZavVDVWx45OnqH5c8IBLhNRWr9c8/XkaHRBSO5I37Oe9R4SVKYrUwXCWUw5VEtQ/Lp
	toiKd39ja6uVahCkBPZynk1N42J2iPcFGOTF6C4DyY9p6StKIZ2kL+xkMWJ1Svqru76WhPveD/y
	Rm/tOAyFpjCI0i45DpK0Yy/nYqSKNYTStxktRb+LPGxiNAWHZoVBHvfVLKHj33T7Sdiz8KVoUb7
	j35U9H8rVoZTXfI+Az6B
X-Google-Smtp-Source: AGHT+IEKor1aYNm+uEgdu4KK/wowrIEfMRi85/Gmn2pCdQ01gV2E5gW1Ds+Ije2ACK9HFMMgZTgYew==
X-Received: by 2002:a05:6000:4b1c:b0:385:f4db:e33b with SMTP id ffacd0b85a97d-388e4d42923mr541812f8f.21.1734476671541;
        Tue, 17 Dec 2024 15:04:31 -0800 (PST)
Message-ID: <8e397404-9398-479b-8685-d2a680aced11@citrix.com>
Date: Tue, 17 Dec 2024 23:04:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH Hyperlaunch] xenconsole: Add connected flag
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20241217222424.7632-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241217222424.7632-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/12/2024 10:24 pm, Jason Andryuk wrote:
> This patch is similar to the xenstore late init (though the flag is
> reversed).

xenstore late init is fundamentally broken.  Do not copy it.

c/s fc2b57c9af462d67df871b080c0897156a616b7d broke the the ABI of that
bit by trying to repurpose it for an incompatible use.  Despite the
claims, it is not possible for a 3rd to be involved in any way in the
xenstore page.  This lead to some nasty state corruption issues in the
ring, which were simply papered over by repositioning the middle hunk,
and not fixed.

It causes cxenstored to have an incompatible ABI divergence of an
oxenstored feature.

The only reason I haven't reverted it is because it is my understanding
that Hyperlauch is going to need to revert it anyway.


The very first thing you need is a precise description of the semantics
of this bit, including how it is used by the client and the server.

I'll be dammed if I let a second spectacular breakage of a public
interface occur due to inadequate planning; one is bad enough.

~Andrew

