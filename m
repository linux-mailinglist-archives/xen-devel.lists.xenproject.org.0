Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B3B50112
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 17:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117179.1463402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw0Ee-0001iP-Rb; Tue, 09 Sep 2025 15:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117179.1463402; Tue, 09 Sep 2025 15:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uw0Ee-0001g7-Ox; Tue, 09 Sep 2025 15:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1117179;
 Tue, 09 Sep 2025 15:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uw0Ed-0001fh-K2
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 15:26:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ca30e45-8d91-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 17:26:04 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6228de280a4so6549839a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 08:26:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0783464fd3sm5750866b.111.2025.09.09.08.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 08:26:03 -0700 (PDT)
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
X-Inumbo-ID: 4ca30e45-8d91-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757431564; x=1758036364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iCVwucZcWCykdqJ/EtT3Q8JD61xpHRvmORwf2z2lEG8=;
        b=NztAgoFHfuKjgGUe3SGdGI8EIFVf8odMEA6pYl9q1tIfq5JsAqo4ZS24f227l5TFUO
         gMcx2wvI279hyRoudU2j610oIVEEKuV49dUu+F1CEsE/5eP9fq+H4RSNycJRbN9zUVY5
         cteCardXK21OoPJnnl/a4LR0t7E5Lv1ECfcXRQVxoKC/z6/9S1EHqNXbprzO7cOy+EUV
         iQTyHC5R6+6GVHG4LjbvkH1Mjwkz9TehrOWWli6iljGNUisWGI2GeN1FM4X3jNRXkvpS
         JHwwOj28HYe5UUv840CQ1dW5ZIM9HfCo3zcTQXT+HpYcrsUPyEtSLaDYeZE5OTpcSgis
         ctlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757431564; x=1758036364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCVwucZcWCykdqJ/EtT3Q8JD61xpHRvmORwf2z2lEG8=;
        b=FVj9+PmQSuXx8joLZWf3WDLKXu+0A/kdOjtrB5BlwlX1kNfkTcLI0l1muLqq7h15HP
         lCdCe7bwT3tAaOx+ybk+8AngTrGG8D8gsKTzifyPriMeKH4MaLoU756DK2pkfJP6sXLF
         dP4uuX/c6j6QFDDMnP1rzuRs/mLKWxW48wZ7WvNOiq36MO0XPrvo0u1cIuRDwIM3eNrE
         0slm3YVyHhQdvLTilSlr5+xty2fPtxYhCWzeW0D7BT/Y/87LvpE8eghnD450grbh+3jR
         InFaklhCwBegMfmZYIEixOfeULErIYSlSuAHmhkn/nu3Ozgl89hariHZ1h/1fHK9yH6o
         zmQw==
X-Gm-Message-State: AOJu0YxShaLtkEQfgCEq0OPPHvTGfy90xGrNecF/eqmb7+2uQwyxeyb/
	Ex3QstQ96agqHju8UsusCOOThKImh5tKUB4vziqsj9vWnPpb9GieyTPqHV5KVntTXw==
X-Gm-Gg: ASbGnct1u18ma13jRzCIoL9gCjSVe/3NCh03zfkoM93J9+PIiBfmc3bN/hpPXyhlRh4
	NA3hpfBCfldcomb9TiTlErsp1eGUkNWc2n+p5JG8rMH1fFHupQheu7NQ6IzBJfhqhrikDcr31R5
	Z4dNYZZjkp3R/g18U3qr6ldbc4dVP64QB9LnUf7MaW+sGcX1kGyLWNV1F2d7yVG97ZPrLEs/dNo
	P7YxIoqrH0vLfXvBuRL1ySM5uYrvETs/wNzdhsRI8B6WN39FefwaOdt1vKsHiNoxgQkOn8nIGwu
	MzCtuHwfnyptR6nA4U1q5R+xBtueKgjYZVQdjbdLObC9oblLKaiWoZEXbojLIotrDPapajuDlA6
	2d2fRYqdoYK+D8tdRUv0CNouawbBK4RMywQAdXEHD31o4njN8eyP9ph5Mp/5Bgq6BudUw06ysK3
	61vVUvMqNr4QsokrcM5Q==
X-Google-Smtp-Source: AGHT+IEnvlF4xx5B447dB7eXXxMrOakzq9BrHnt2r+M1KXLu+jfT3ALU9XuAotFLcI7kWweyrV7few==
X-Received: by 2002:a17:907:c24:b0:afe:cded:bf96 with SMTP id a640c23a62f3a-b04b1459092mr1091092566b.6.1757431563987;
        Tue, 09 Sep 2025 08:26:03 -0700 (PDT)
Message-ID: <fad1519c-4f66-43b4-b2a7-a372ded090c4@suse.com>
Date: Tue, 9 Sep 2025 17:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] efi: Support Shim LoadImage
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757421999.git.gerald.elder-vass@cloud.com>
 <f14b3b9c-5646-4517-b3c5-b1eaffddaa0f@suse.com>
 <CAOJ+D-UPMoX2QfO-QKLzntKn4WWzZDau2e+ZQmA+2viCigykXA@mail.gmail.com>
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
In-Reply-To: <CAOJ+D-UPMoX2QfO-QKLzntKn4WWzZDau2e+ZQmA+2viCigykXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2025 17:12, Gerald Elder-Vass wrote:
> Apologies I did not realise, as there were outstanding comments I assumed
> more changes were required

More changes may be required, just that now they will need doing incrementally.
Imo the committing was done a little too quickly.

Jan

