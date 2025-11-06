Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869BC3A4EF
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:39:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156763.1485764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxO7-00008S-Fe; Thu, 06 Nov 2025 10:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156763.1485764; Thu, 06 Nov 2025 10:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxO7-00005j-Cn; Thu, 06 Nov 2025 10:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1156763;
 Thu, 06 Nov 2025 10:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGxO5-00005d-Vg
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:38:41 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f8b9cf-bafc-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 11:38:40 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so1153220a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 02:38:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f7139bdsm1513803a12.4.2025.11.06.02.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:38:38 -0800 (PST)
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
X-Inumbo-ID: c1f8b9cf-bafc-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762425519; x=1763030319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3HoG/sawNEL1H9AyIx0SpBvW0Wi4hQFqTXnmf8cI7S0=;
        b=dbHAheLU/iEEhCKrtbBbXBno76jcEuI748OA9wSIMgjZBi1/xiFtGXVExCvdApjNgi
         kLX0nQ2tnLwtWjs+3wNKGrv7BkoVyLy2JuV1aeZe216tX36dDr0Aky9dBjs6MlEbjYvn
         1LjkvYeyuW4/qmtbOpEGX9QX4i+CB8dEwjFnI/BJbDsJiZd7ZmjlF9kyTo1xn1/xGCTW
         X3CXHggHurHGZgQVYlnCcPcvS0sxBN1aNbrtL8i8AlH9TkC4VdIxoUEp5pswcMyPcqlI
         VuOuK/KhB93mFJ0JUGrR+K++/cIYBNMASrDy+fhDEXzao1rdNLcuoTOk8liWPdWrabL+
         mRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425519; x=1763030319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HoG/sawNEL1H9AyIx0SpBvW0Wi4hQFqTXnmf8cI7S0=;
        b=AAoS3rxWSSgamnX4U8HGUIDoFYy7vFU2lV8+wppUZH+SiOCQp3aAhCqF9FRBZ3YKRC
         qvlYXyhYaGiYpjKPH/Z2PhfNf7F7mj74NY75/gHRRQZRm7IjxvCYmk/UjTi080t+Aorz
         V4l1kvCadey4ev9qbx0+UQ439+fQSvyrosJI4sX73UepBQ31RaS7Njkz4R4T+kX/h3BD
         ZPPwUOflW5f+rLSLydvagNiYMLSBWC5q/I7/GlT+CTigQYvaFgUqzlpiJfvAC7BBbxdy
         TtieEh1ajJJ8db75e2VdpirSz/K2YVGTda6gZFssyodga8oGC0Yb5PJ7ij1e+VlwE3v/
         7shg==
X-Forwarded-Encrypted: i=1; AJvYcCXaw8Z9vIluDf0VVF4Fh5R53YYKXTuLfIoPmrVtB6OOZYX2XONnO29SlFZAcwGih4+Ut9Y5u0xvkt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPksePPL5BNNptoGUIQMdFRN68LXVpkXUQzjHjPyN+f74JgvK1
	xjLakkjWtFtlBkABl+KGRctm5kwnJ+9LZGavj1CGFicZMPTkN+8qVay+5+P3AjPCNQ==
X-Gm-Gg: ASbGnctOuoLKkGqqtxekgf8tMPH63cspWqTYechOKIWbJiyxaN9LSB0w2jGuVBaSiRQ
	Ywr4vfvHVuhfXaoBL0G3z7zDlIYQymCS7tqdCzYr7Sm9obU3esfHryFBOoDMlN+42MDpmUeCq0z
	TZaRBSe3Ub/IuQSMphvlPip4+ijffv28vQHYRbj0BdGW6rGSX23by+6VuR0r4j8pgk0yRPe0WRw
	okFF8gOnqGTJgTvpcczpRQNekzjocviWVgONuIOiPvtKLs5dF5qRO9vbApaCvb2DqdWufoqq/Q2
	2UGO9PPBYC11shHJJZngvNvZBDxNuBcLq7zAbvcg/ngbB2+d2g8CeX9YOuxKZbuo5fkEcUczsqD
	4gdmHDyHKTv6L6mt7EDt+mJR72YJggd4z+IexTWXJnjrCR5xMI98ZOW9gVfdqgP7w/TMPS9VMRr
	G+J1ghaUq1d2YoSWjTlHPAMNNqqXeiM/Dll5tsJrC8lqA0417zuqGPGD2ETQ/v
X-Google-Smtp-Source: AGHT+IH7p4VKVc5RuSSUElzT8P8oyJE3YBsHkqy/jjfWST1Z8rt/tlSOlDyATrlcLGaRV6tYKW1k7w==
X-Received: by 2002:a05:6402:1f82:b0:638:74dc:cf78 with SMTP id 4fb4d7f45d1cf-64105b80064mr5966274a12.34.1762425519236;
        Thu, 06 Nov 2025 02:38:39 -0800 (PST)
Message-ID: <bcc9e26b-c654-4577-963a-83ab3aaeb37a@suse.com>
Date: Thu, 6 Nov 2025 11:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <33372689f3097b0dde1d47b81a1bb8176b35d20c.1761998077.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <33372689f3097b0dde1d47b81a1bb8176b35d20c.1761998077.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.11.2025 12:56, Oleksii Moisieiev wrote:
> --- /dev/null
> +++ b/xen/lib/arm/Makefile
> @@ -0,0 +1 @@
> +obj-y += io.o

Yet one more thing: For a library, I think every function wants to live in its
own source file, such that under no conditions any unused code would be linked
in.

Jan

