Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90160B055E9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 11:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043905.1413946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbfn-00034o-RA; Tue, 15 Jul 2025 09:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043905.1413946; Tue, 15 Jul 2025 09:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubbfn-00031S-OD; Tue, 15 Jul 2025 09:10:03 +0000
Received: by outflank-mailman (input) for mailman id 1043905;
 Tue, 15 Jul 2025 09:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubbfm-0002od-HX
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:10:02 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cc9b4e1-615b-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 11:10:01 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45600581226so31597265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 02:10:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4333c90sm105711565ad.157.2025.07.15.02.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:09:59 -0700 (PDT)
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
X-Inumbo-ID: 7cc9b4e1-615b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752570601; x=1753175401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Clcj3gI0XdtFaR7ohnWmJhVGXwn59ACQr1XbSKnhxVE=;
        b=RAY/7MZR/epgYZyYCeErOKpEeH5r86dEXb+areEvqjaY7W1AYqvjCvmJ5QdCXiNqW0
         NOM1JfT2sx6Ry6keodMsFbgcxiopRaHk9c5XBH9XtcV7qmif3bnAyQy8fbASrnPHpJNJ
         t5nZkC9/KfvvCWCj7IMEbQom8K08yhudf/Bd3u8lfHu+eymbZ6Se8coyafyxzmb5ZHqV
         OEM2Rut8fUHHBFUvRLATdF4zXqv5AfCPFDEZb6tlFo/fVBohG8IRzwBunbVyWlOjGXWM
         1ulEJUxd86lXzSN86dpY/Tn4FgPg4NT9Iwu+i6MQ9NZr2KJ1XWtM2ujZbwhVWLSNt0D2
         /3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570601; x=1753175401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Clcj3gI0XdtFaR7ohnWmJhVGXwn59ACQr1XbSKnhxVE=;
        b=ocVfqL8iXjnns1iNPfZ99s/Bbd/nGM1moq9rz87FAKifd9U51sOlrCZdjamTQNhNOv
         AEa+cSbx9RNSO1PqQnlIpHRYs1SuxLHBnO92F6PoDsA4TNI7guHo2E+TPkfvP/rCc9zi
         BHrotyT1W4uRhvXYZYh7eeF7QiFmhWrzAP2uDpwmj1FS0jGS1gyCo8sYY6U7cvEGnJV/
         iEuW5PFokbx18hP1FbUi4xIL47tFLNvSay/2Qa/RU5Vpu2UNF25Hi4j6PRTXEGchpbtO
         R27mDKezWCFuGq6LeZBB9bJfV2ueBZtxYe5hPfxWtSoySD8ek7XY71gA7g/n3WsMdBFO
         Dpdw==
X-Forwarded-Encrypted: i=1; AJvYcCUwp6RHwLOqMW87cV0gtSUPQgDBqt4e8Ylg2ivtGX9S/TduYCA63dTwPpuAJPerShKKfyrTxo9hgCs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKajODspvKne9J7zLapQLIg2aZWw+aTOVSAGCtu7bgXVozrCkN
	P+ML+WwRqRoZb16rGtV6b8LpU8FRk3+oY7k1FcCICqLzaZmdBrTTjyjMjHUS6QEWHA==
X-Gm-Gg: ASbGnctSKUDo35vFXl15ukRsH8UfxcsH3gWxLzXmCg10vFNvAnLtb8bvUsbItUtu0bJ
	vsTDdKTBcO9ofYmBM779WtemBkHbpJBPt6ui2MaQpxBnd8KvPrH0MjeEp1ip8GmDBO3MQiBR8KI
	sGtW7ubTQAtgrC1VVOEXP+Bky1Way3swkOJS9McnOsim6mYeXS3BN6ye+BDcsgKkPP5uzmjEw1k
	YgMDyDYv+Mp2spYwRRKYaa1qaenqhVvaYQMeRb+4Lx8bKpJhW3itnybvo87Xr3qs+pSt9hKZnxE
	VpUnFCwhCuUsRZ5ajsCZkIr9mRP9ZFWCuhR2FwQac7NESndJCLwA1v87fMPmpuVhKoN2+nDq38g
	VruX7Eksx7ZbRVW6n3ktcZgLjMd+Z9wsmRk12ctpBAxqxB5Jinj49UidVGkat12RkFme29ZEaqQ
	Fxxi9WeqY=
X-Google-Smtp-Source: AGHT+IHVNF1sQ8ZeGwihX/3riICt6ufQLAYOB47roMx+GCHXaNuPcCi9ZjJZC3z0bmJslVZHByE1oQ==
X-Received: by 2002:a5d:63c3:0:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b60a1952b8mr1086597f8f.29.1752570600631;
        Tue, 15 Jul 2025 02:10:00 -0700 (PDT)
Message-ID: <06f88a0b-a0c4-4bbf-954c-d3e294fc498a@suse.com>
Date: Tue, 15 Jul 2025 11:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
To: "Choi, Anderson" <Anderson.Choi@boeing.com>
Cc: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <0686ad8e-749f-45ca-a273-5f4ae718e8b9@suse.com>
 <BN0P110MB214894D609B5B992A854E9D19057A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
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
In-Reply-To: <BN0P110MB214894D609B5B992A854E9D19057A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2025 10:57, Choi, Anderson wrote:
>>> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
>>> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
>>
>> Nit: (Most) tags in chronological order, please.
>>
> 
> Sorry, I'm not fully familiar with the revisioning / upstreaming process yet.
> 
> In this case, what would be the most appropriate action?
> 1. Create a v3 patch?
> 2. Send the v2 patch with the tags reordered?
> 3. Exercise your suggestion from the next turn-in.

No need to re-submit just for this. If a v3 became necessary for other reasons,
then the adjustment would want making there.

Jan

