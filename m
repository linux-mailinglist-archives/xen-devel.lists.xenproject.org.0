Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C438AECCFB
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jun 2025 15:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028643.1402440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVsXj-0000Um-KS; Sun, 29 Jun 2025 13:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028643.1402440; Sun, 29 Jun 2025 13:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVsXj-0000Sg-HR; Sun, 29 Jun 2025 13:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1028643;
 Sun, 29 Jun 2025 13:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uVsXi-0000Sa-Cq
 for xen-devel@lists.xenproject.org; Sun, 29 Jun 2025 13:58:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1192dcfd-54f1-11f0-a311-13f23c93f187;
 Sun, 29 Jun 2025 15:58:01 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso12824345e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 06:58:01 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2ee:1da9:2a84:806b:ad68?
 (p200300cab711f2ee1da92a84806bad68.dip0.t-ipconnect.de.
 [2003:ca:b711:f2ee:1da9:2a84:806b:ad68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390d11sm107564635e9.7.2025.06.29.06.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 06:57:59 -0700 (PDT)
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
X-Inumbo-ID: 1192dcfd-54f1-11f0-a311-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751205480; x=1751810280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/OppVkuopOJMhjQLdxBUIEkfWKUc28pCbHwwQlPhVNg=;
        b=HmPlMZZYrDPvRcuUkTCwJSfBqc+QJqYol7h7ZHIUzhAVk03u9YjWuit3qxsZrc1Q9C
         5i+j98SwKVcGrky4kTKXzCzKHbzjsKvML20gDcqFKlxy3uE5QLTaheHxNLUeX+JZEoWi
         5LXWtnddn2U3MnSAxV3FApGJqGel4GwL20N/VQLOWq611S2k09VJ1Js9k8qM81MzAg8g
         hWL9J75yQSRqzy20kB8ACvN9VUSaibjnHkb/nckA8bzp31FVG/tmBABKQI57z70Hx7WN
         TWKQvGYDBdBNuOa1b0BAYC2vZDipya9LaN6hBUZ8ofH4m+QlwQg4E/lIw7SKJrPuUZ3R
         0Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751205480; x=1751810280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OppVkuopOJMhjQLdxBUIEkfWKUc28pCbHwwQlPhVNg=;
        b=P+MuF7riuJLTqwqICZQ8S/JixEBL+rH2bAguaYiqiyNUFdPnvmfGTnXGGWjExOBSBY
         6eRu7aIO11t2QUpDunpg0ehLKoOJqAyKbp4Nx1xjPlwZ8w5XueD/EDmk68KzTGJjaYjG
         Y9J01AUQAPTZWA17zsegnvGOibEI6Zsoa/m2/madQWZESHY/vSod4tgH24ICqCB5bXl8
         0rMAoXoFwU3cm9bxvhMgIL9uO7YQ9mmQvfXus3GCmAIUaJnyrSRfSRmS8owPS71yz2Ss
         K/hmTxsXt9VxbHW4SmrK/6q3D3hNsPb5sWbFrfgfkpkwvRaaCjqvmYkymmBQ/YxKNfzR
         r8Qw==
X-Forwarded-Encrypted: i=1; AJvYcCW4qHj3KUw/aCHq5Q2ex9Zg3DhuZJRteLYeDcv0rY0QnIIQ0kicGgrKGzQIjTCksOKcHD2oPAr7kTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmQqMKxPGPz4lgbVpA9zqV385HZb9OFG1OMLZ4eQ/ogbTmJglX
	zb0/XKVSNFvf1/h7qcrNWNK9nX/ulB39rQoHyEnE/Wk76IhrlOBGuSnX8maE1w1RsFTrKfi41NS
	k3NM=
X-Gm-Gg: ASbGncsIP+bOA21W5F5TsrfbSekXjqlnyByTwKEhCyLJPPRYXpN10D0c1mKeK+iaWmo
	7aBs+zxUXnfs/KGf2Sox12UNPCu26g1Kc6PSMq20bZGY7lXaQFt4UtCI17E4jDI46UKC8lZcInj
	KV+BgBz2t3OFntIEexe0TFDgZhz65MPIzHT/KmS2E4vA/gM+wauJCDT1z54BD8401CbtcShqVq5
	HVID7NbaDd+IvuhtM1I0Ud9lBD8X876EwGcE2cxEdGe9NFUqg3pSDUaNI1uMn3RsdefcZG89np3
	0ufFMWehQYo53tJvJPZRfNOaH1TYTS7P/e/35Fiz4zKSspYwWC3aCH22BuiPi4lekn8zH5SbGNo
	dVCTSn0MMgTujt3WeVamwXh9cUwV0uRoAkMpzlVMz80G1ne2FljTK1jvI9t6KLawSp5KscV3hyQ
	fprPQQhEzzFGlHqT2nc36a
X-Google-Smtp-Source: AGHT+IH9xqoyaM/eypZYWH78msxTCuC3B7j6W2ZmQAEk/MKEHGkklfeo88gzpxlGT3GntjlpYkpTcg==
X-Received: by 2002:a05:600c:a41:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-4538ee83b1amr82134805e9.20.1751205480224;
        Sun, 29 Jun 2025 06:58:00 -0700 (PDT)
Message-ID: <cf0db061-5cc2-45e2-8461-082c57a15f5d@suse.com>
Date: Sun, 29 Jun 2025 15:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Simplify logic in
 guest_common_default_feature_adjustments()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250627141907.525027-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250627141907.525027-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2025 16:19, Andrew Cooper wrote:
> For features which are unconditionally set in the max policies, making the
> default policy to match the host can be done with a conditional clear.
> 
> This is simpler than the unconditional clear, conditional set currently
> performed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


