Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5832BA929D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 14:10:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132812.1471071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ci8-0004dN-S3; Mon, 29 Sep 2025 12:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132812.1471071; Mon, 29 Sep 2025 12:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Ci8-0004bv-OB; Mon, 29 Sep 2025 12:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1132812;
 Mon, 29 Sep 2025 12:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bM2=4I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v3Ci6-0004bf-T5
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 12:10:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a88eb07-9d2d-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 14:10:29 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b30ead58e0cso858867666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 05:10:30 -0700 (PDT)
Received: from [192.168.8.247] ([212.222.86.216])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3b0c9c9e8esm444875766b.59.2025.09.29.05.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 05:10:28 -0700 (PDT)
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
X-Inumbo-ID: 4a88eb07-9d2d-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759147829; x=1759752629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=py42YJLn6IdwAubF9PhPBI066HQ1A8czgq+XUGd6Zkg=;
        b=t6KT66CJvI2typCkZjMCrQMwimBJ25mnKfWvQZeiceHMjAs52gy2HUHsgPaKLwxZfH
         kwVYWGC2IlB+07XsqP5NDVLDO4upusamWAv+nNFwTyiHw7ea5arb3tMH5CILuAYx12da
         SvGQZyXOfz9dGff6gfSTiKtRN2K+957JWBPqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759147829; x=1759752629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=py42YJLn6IdwAubF9PhPBI066HQ1A8czgq+XUGd6Zkg=;
        b=OYjznAk2UCt3EcAKSaMaMjbAv4/y0aPuzd+0DtN8WyM/0/r6fqtIwWqlhG5oIHr4lF
         pjAqC0GbVD8f1bql1OZJl0eq9K+2GOtIwv4jm5kBouAbFCegjRl8y3tLPMcFETkrzGea
         eGliRWZjGzjZQRYzprly0wqo1Hw49djDWprIuafG+YkoSBWLF1dfnKdR6T8a+lgJ89CY
         wXmgHZ2y2tXYXa1vjBekaNz7KUWKDAFlh6gQaS0VSu5mOlUDywt7o9BB8BbhoiN2lk0W
         fqPwPhU9AYrNUhtR2HSXriJq9v8iW+s1DSVy9rA1P+LACaFSbd7xrJiH8IW/a1NCv77w
         O5wA==
X-Forwarded-Encrypted: i=1; AJvYcCWyxX9TmTmmpynuLPPt7JK0C/cd9iztipIJ7vO0xypSNaQIGfQ5CMIoG7rPKa1rg2oWaTo9bxW1m7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYJFW0BiW1ntoFCVrBgVywpqOIDkPn0FsaCJjvCaheQbJmNvOm
	zclJIrCfoxEX0H6xVc8tbB/Ak24OewliPhIFl1D0bTnptWldEclmJPAyq/Wm7gEcnfQ=
X-Gm-Gg: ASbGnctMxP/AlaQzNslM3C8kTRQ/u6W/WiysOyFaFleuBAlNqWO3eCVRabfpxehPiIL
	IJCiZcZGmiOmlps7dOQLdC+Vl2jEbg1gShvCWaFqZxWfupe5wiSiNZYWcA2FMF5QGSZezNE2JMt
	PNS4yNYzrmJWsY/Z0ILayc3HFWHWf62ogsX9ek/+ODL+NwNPgjUtVwtH1RRQMt8wimq7IdYlfDp
	N3zQMf2SOuf6yh9TPgT1MKUslYgWDGaggBScqcyuJJUdOYD9urIE16V+TGjZ6v4CAl/42ICplai
	hb92o5Lj8d/SSCd16ke2+SYgXTYlzzycTXDuVPd/KGJVPYOV4RhURu9lRdgmO2OIWnGJVTupZQj
	DxGeZtDmKvS9W3cmV+5hDcUmB48oUgj5BlPgsFYE9Eu51MXJqKjCRBrfegmB6
X-Google-Smtp-Source: AGHT+IGz24cXJNjyg6Z+JiXPmlST6oUqRKGRuN+AIYRWFXVQQYlfzNVcmhDbmHtVu88uzZ4SzU8KTA==
X-Received: by 2002:a17:906:7304:b0:b3a:b22e:dd35 with SMTP id a640c23a62f3a-b3ab22ee9c8mr811125166b.2.1759147829346;
        Mon, 29 Sep 2025 05:10:29 -0700 (PDT)
Message-ID: <1ca535e2-ff36-4076-8fc5-701b582a7df3@citrix.com>
Date: Mon, 29 Sep 2025 14:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/8] tools/configure: Introduce deps on json-c lib
 for libxl
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20250929120756.46075-1-anthony@xenproject.org>
 <20250929120756.46075-2-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250929120756.46075-2-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2025 1:07 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> To replace yajl.
>
> Introduce XEN_JSON_LIBS variable, to be able to remove "-lyajl" later.
>
> As a first step, the variable will have both or only -lyajl. Then
> commit "configure: Use json-c by default, fallback to yajl" will make
> a change to only have one or the other once the code is ready to build
> with only json-c.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

