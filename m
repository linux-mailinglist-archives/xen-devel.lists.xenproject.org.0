Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDCB2BEEC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 12:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086414.1444605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJaH-0007zZ-8q; Tue, 19 Aug 2025 10:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086414.1444605; Tue, 19 Aug 2025 10:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoJaH-0007y7-5o; Tue, 19 Aug 2025 10:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1086414;
 Tue, 19 Aug 2025 10:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoJaF-0007xz-Na
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 10:28:51 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c078908-7ce7-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 12:28:50 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb78fb04cso731163066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 03:28:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfcb2ddsm984667766b.74.2025.08.19.03.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 03:28:49 -0700 (PDT)
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
X-Inumbo-ID: 4c078908-7ce7-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755599330; x=1756204130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K6SAg7jc8d7k0OXULNtwEIwM4DL3NS/H5qIiGaCFaII=;
        b=GAVkaU5jDctCc50i7FI630tzN47ZI04EQiCH7pzh+jjY72wh0XMQ5NfMCTU18Q1mCV
         GFGcEGQ4mmknrGQQxEf4FSNEmIVudrNBxO4xD51MLv1Q9oEm74DW97G0o8hvxbf6Dl8A
         yxx/CHvfl2wupagdzBwUQbc1s3Bsk4m1kChnLFtVyRHHb2ATpuP+eYTUIWE2JWa8V5v5
         O/ZtaIAAYRfdKSNRJRkw7Wf+VMPeNy51tQTEs3FMkyJGj0nyBgGJdAfwtT4pln6WbGla
         sS58LF5WhVXhbZTSnAUseUxut3aOQp400ye1BGSjHcVR0VLtYACbQOFJlEa00dug/qna
         Oc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599330; x=1756204130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6SAg7jc8d7k0OXULNtwEIwM4DL3NS/H5qIiGaCFaII=;
        b=FyVJ4PfuqlPs7Nf3dKi4higCEcgjg4zMaYLMbOtY8ei3QcUtnTxf5RZShXlwsb01AI
         NhUGz5cJ7Q/8HkrgqGJY40GLS0YWRbQSTP98OWyHmlB5g62a/tdFrN/Yhy7Mwh+tLjte
         5VKtfxV+lNUEhUiXfjt2VYiYMSkz3h/+pjBkmd8sE4sxkvk0CiXdhnMo35G5YUDjUvQ4
         Bxzusrr96yuVY5oJb/t63A66yGmCXNabBwCraupVo0y+v35nBS3gGLRxOzTAApGt7au7
         hu8bQ5mDvWfBQmnHqAZGlh1x2SdNQfHy56KNrm7Mc8dsYp+ZURCwXjlTw1Wz3Iw0n4Xo
         yvRA==
X-Forwarded-Encrypted: i=1; AJvYcCXQqjEWPcENnTLbSMmzEEVqpAl2kcNO01ev65G7xNxKmjCssOOq4QzUGouHZnEUbPnHUVDUmFrlGgY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY9m33txiEp4EwcG4a82+kACMPqs66E9obWxfBs2V3h8plJdiJ
	GCzKAuO7zysHlJJLRzuiTmfoHp9Z/xO6RiSNKw//ter1VjOs4MVBOl180hZeL9+Snw==
X-Gm-Gg: ASbGncvSMiV/OkMRZNBtV0SkKwJTTILUN/D53zwYoSo8yfPp0JnAmXDLB2uIztmE1xc
	dNB5ZjEU6HHLsRYGG7655Sj4FUHzb8Ms53avi2f0anRpUqsOdPy/xt/paF6qCh7J8o5xFrfAXCB
	d3vg20/AW8UznbbpUqD9kaPgDytQAnvEwTy/drPRuwHozOnL63CtDY4Rx7sjVvAAjYjCtKfmtJP
	GkuTfqS7RbTxgElAdgzOk9Y4LxervBhqlj4ZSkR90nNswNkWDmdV6R4oHlUs2vSAbR+xjXNNekT
	+6e8C58gnKSuMZ5AzgWncEoccpmXrU7yH5f4Yj0499wXPRdbI9ew0aNpn0TIktKhLMowTaDOrPu
	cizihS9TO1eQCWOM0PPjurrJE3cKxyd+7NY/WwlCArXGzRQ56oKyix2ryiGz1bYa/jFW02TZwif
	8e45LBalD42qgSoRdMLg==
X-Google-Smtp-Source: AGHT+IEuy6xH5ET2+eYxfPdy6KnCLW5RCzuHINUyijCkKXGYe3EMjl6H3ppFlfkaeg4Y5OTbdN/M0Q==
X-Received: by 2002:a17:907:cd07:b0:af9:c1fa:92af with SMTP id a640c23a62f3a-afddcb60a8amr190695066b.6.1755599329885;
        Tue, 19 Aug 2025 03:28:49 -0700 (PDT)
Message-ID: <2392479e-b6b4-4d27-8425-4f66e677ed3c@suse.com>
Date: Tue, 19 Aug 2025 12:28:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] hvmloader: add new SMBIOS tables (7,8,9,26,27,28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1753869323.git.w1benny@gmail.com>
 <cdd28b4f-34fa-42d4-a4b2-602fab2416b9@suse.com>
 <CAKBKdXg8GyX7JR599ie1DT3tuiBYcuh_H6gn5agYKcB0zDoFtQ@mail.gmail.com>
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
In-Reply-To: <CAKBKdXg8GyX7JR599ie1DT3tuiBYcuh_H6gn5agYKcB0zDoFtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2025 12:26, Petr Beneš wrote:
> On Tue, Aug 19, 2025 at 8:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>> Just to mention, also affecting your MAX_ALTP2M series: It is on you to chase
>> missing acks. It would of course be nice for this work of yours to not go in
>> only at the last minute, or even miss 4.21.
> 
> Thank you, I've been watching the timeline and wondering, what could I
> do to pursue this. Which... I still don't know how to do it.
> 
> How exactly can I chase the missing acks? The Submitting Xen Project
> Patches wiki page mentions that I should re-send the patch with
> [RESEND] in the subject. Should I do just that?

Or, less spammy, simply reply to the respective patches with e.g. a Ping: subject
prefix. Or ping people on Matrix.

Jan

