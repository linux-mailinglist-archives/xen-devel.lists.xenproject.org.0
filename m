Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B823DAC0DC8
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994076.1377120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6ep-0000vy-Vd; Thu, 22 May 2025 14:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994076.1377120; Thu, 22 May 2025 14:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6ep-0000tV-Sz; Thu, 22 May 2025 14:12:27 +0000
Received: by outflank-mailman (input) for mailman id 994076;
 Thu, 22 May 2025 14:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI6eo-0000MS-Kg
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:12:26 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9babec6-3716-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 16:12:26 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so1570544766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:12:26 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d047749sm1081122966b.8.2025.05.22.07.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 07:12:24 -0700 (PDT)
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
X-Inumbo-ID: c9babec6-3716-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747923146; x=1748527946; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5WT1DkfFx7R81SVI8Q9vhMQ65BedfWeBngMhtjc/b2Q=;
        b=AKX8bV/SoWVdCjAW65127GZjESsKqsoT9FQ1b7mo72rKQLkChr6wZ5lmNpnhcCK1RD
         zdwZcOVZ6G5PPTypZ4i5VL05aboulLN6VMvCJ1vKi5nVeFnIK+xf4SEMBgawMOWNy+PL
         yLeGw/pKXACNNly+ICIXLqcqMv0DZgIDRipig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923146; x=1748527946;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WT1DkfFx7R81SVI8Q9vhMQ65BedfWeBngMhtjc/b2Q=;
        b=b00RYatHwfOK+ff+Wy2BzqqEsn88g2IibxpSxoaUaIBPo5V4C5fpmbV+o5tNgBctQP
         R1CSEvHNr7QiVClQYTI5u9DBqXMqJri01KLPzMuJNY34zGC8XrMLV/IQgfd0aiMEVTfg
         lIkC5iYYP1yJTc5dRq1LR8wmL/eiDRPZ4gRXADRbBUGcANWSXe3ZLMYAcWWX9RBe5HS1
         FrpvITsxuPZOM/HPa/fHIGIe4XCOe3cFcAk25QelFuRtZm1ccjb0iOaw0yJ8akHGynkn
         HaHGusOb4/jvexFpoPBw+/uBJP76SSLxbaO6OIYmtvGStJEngx9fimM8no3E24pjVBWD
         iO9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvdTwhZf6MyMsFMiObRyN4St/1LQzXO0n+5GyPgMthPAs+DveQDwC/rm8AQjLMAgmLpTlYgLL3fOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhY2lbMgmCyqKlRPWEmsTSPWxY8S+s/z/KVoAS7aCu6sLe2Rmz
	o946yVQ577M4/nanyBTtNhk7uIZa5YSvLDdCbaQ/VdtaUdFS9nBFrS7IQwHDdvWe06c=
X-Gm-Gg: ASbGncumLaoNxhN65RsLph3V1ItWwkecTUag3M6Bngu20hw+4cTWVKEgNrm5O3jsmJM
	FIWbX9/1hKu5eL2o10qHgBdjhmej3wJfmgqsu9AoE7xLcfFKnPzY6FBSZCbNfZuz4dknkEF/Ven
	L+zWMzYCRBFZPQrUfav1wMSRge7V2igM1Ho9KXvOaPXCkutq4TCDMEgIFs4VQZ1zbRIt/fJk49E
	SwIMO3Of0V3K/bFlC0d0AJM9Jd2lXteUlNFlPhLbSNhWMmUGiYQ7BWA2+oLyNo/nDU5A+ClZG9I
	oHle5PyuZUTXWcWx3wXFxuKUFGObZqdggysRXY43jyrVEvPBdJeUnJNQaG3//Qw2kZfQvHqna2p
	qyrZF0gnaBmIl9r1ZXxRH1y7alSI=
X-Google-Smtp-Source: AGHT+IFzFozByInXjK711z2SmgVoJDgP+jbq+yfahBG3zec5Y3bpOA/R548xnRLW6gVGtX2NawndsQ==
X-Received: by 2002:a17:907:6096:b0:ac7:e5c4:1187 with SMTP id a640c23a62f3a-ad52d45acebmr2290383066b.11.1747923145720;
        Thu, 22 May 2025 07:12:25 -0700 (PDT)
Message-ID: <4391373f-55d4-4e37-aa97-16b2e82fefc9@citrix.com>
Date: Thu, 22 May 2025 15:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vpci: fix off-by-one
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250522140356.5653-1-roger.pau@citrix.com>
 <20250522140356.5653-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250522140356.5653-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 3:03 pm, Roger Pau Monne wrote:
> rangeset_remove_range() uses inclusive ranges, and hence the end of the
> range should be calculated using PFN_DOWN(), not PFN_UP().
>
> Fixes: 4acab25a9300 ('x86/vpci: fix handling of BAR overlaps with non-hole regions')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

