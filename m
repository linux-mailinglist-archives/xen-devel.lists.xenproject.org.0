Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEAA43B35
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 11:20:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895602.1304260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tms2p-0001zx-TF; Tue, 25 Feb 2025 10:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895602.1304260; Tue, 25 Feb 2025 10:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tms2p-0001xp-Po; Tue, 25 Feb 2025 10:20:07 +0000
Received: by outflank-mailman (input) for mailman id 895602;
 Tue, 25 Feb 2025 10:20:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tms2n-0001jr-US
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 10:20:05 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14391c0c-f362-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 11:20:04 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso32070925e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 02:20:04 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f24acsm136567575e9.21.2025.02.25.02.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 02:20:02 -0800 (PST)
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
X-Inumbo-ID: 14391c0c-f362-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740478804; x=1741083604; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pNGT79HbF9FZ22TSVMDdjd6v2KML84tvQ97vk4N7f/k=;
        b=VnqQ/3RVk4FSjmmMXypAH4pEj7jRn9L02oYRDWLujTOrkOKVcfoVEb67tXZtbUD3Ov
         2P5qNCsLh45Ffo980qttgfPdYMoMiRtQ7VfMjrlCpCcaU9TwPdJ5afcvm01HHGMjbdMH
         aX1oFC0vWf9SgOX/www4eFsBWO9dckUAWkwA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478804; x=1741083604;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNGT79HbF9FZ22TSVMDdjd6v2KML84tvQ97vk4N7f/k=;
        b=ArNmOeZRQzmtZYsn1qCo68KiNHvHkAP3dAT+bv/kq88/1IzuuDPf7BD7+i+rGpjkV0
         x9biIXYRI3AInyb5/ewrUwl6umXMVwBFB4XwOIdZb1hNSiabVdz2xdw+I7J2J7n8iadT
         mmk0zYBq+LwgBScRpDen/DluqMXX20DCYL0BeqRrip2g7XoHgwSzbm3gtoIpRUbnqLnq
         CUPf7bmFqoIFIs5OnunCwwQ1h4DCj59M4fSGBvGHV7/IdcKB9rNoHKO4UWcSP8+GBY/j
         ybtmP2brsFynbBvLwcuIz/c9h+ZgxSsvepY/8SvYtCLeJL9U1EylJ/oQy6uAYIXhv/M8
         OUYQ==
X-Gm-Message-State: AOJu0YzG8WUkTk7l6txns3SCsZZlEEsWo+kY4D1/iVh214X6GZXCA4z0
	yc5QoP1M67QjLK06Knp4sS5JZDAJfzhnYlO+8TuHqpGftBanpNEbPv+E007LAz0=
X-Gm-Gg: ASbGncsuHq6JD/BIar8+HSHMZII2n+HoYttYPUaFAJYmke8A7J1o4e5sgPfNS8euwAi
	N/aDLJBzvs5n8Nu2k0IgGD26+wa/xmqSuGDNAl8tMK04iiYIiEjvrEdH3gPR32ks38ORlqP43N1
	uH1p7efhANPG9jN6XtFyh72ZhZ1U34DwMkNH1VmTfI290lubA12vGDkMmxjyOmTJho2zFGQVq3r
	0DgykfNidrneBDak1B10o0TsXCHWJqNUdBUziuGEyHRwSzqjI0dc2MvpM1h4EgetKgpLDCARYHi
	93p/QAqS3WN7riBpo/ZqZDaS7kHpwBhrdtAwxG9MOy0S2HWJMp9J6PSFJ3XsoPKkkQ==
X-Google-Smtp-Source: AGHT+IHmHY4Ib6ZDTEw8VVgGZhTnZOKD32D+DYBcfZQXj7fgs8RtlGnf33FVhJzm/OePIJLfhGtuWQ==
X-Received: by 2002:a05:600c:1c85:b0:439:968b:6669 with SMTP id 5b1f17b1804b1-439ae2d254bmr134398685e9.1.1740478803801;
        Tue, 25 Feb 2025 02:20:03 -0800 (PST)
Message-ID: <25c20366-61b4-4011-ac7d-6ca363024e18@citrix.com>
Date: Tue, 25 Feb 2025 10:20:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CirrusCI: Use shallow clone
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20250224154236.1116264-1-andrew.cooper3@citrix.com>
 <Z718DY0Yt3xBx-mc@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z718DY0Yt3xBx-mc@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2025 8:15 am, Roger Pau Monné wrote:
> On Mon, Feb 24, 2025 at 03:42:36PM +0000, Andrew Cooper wrote:
>> This reduces the Clone step from ~50s to ~3s.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Nice, didn't know that existed.
>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.  I found it by chance while trying to make artefacts work.

When a randconfig build fails, there's no way to figure out why.  And
while I've managed to make artefacts appear on the UI, they're always
empty for reasons I'm still investigating.

~Andrew

