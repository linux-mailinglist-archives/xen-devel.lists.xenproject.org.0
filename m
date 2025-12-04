Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E09CA44AF
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 16:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177896.1501909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBPA-0005NZ-Dl; Thu, 04 Dec 2025 15:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177896.1501909; Thu, 04 Dec 2025 15:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRBPA-0005L8-AE; Thu, 04 Dec 2025 15:38:04 +0000
Received: by outflank-mailman (input) for mailman id 1177896;
 Thu, 04 Dec 2025 15:38:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vRBP8-0005Kd-Gb
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 15:38:02 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 375ca3b7-d127-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 16:38:01 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso8992265e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 07:38:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4793091c740sm36413385e9.3.2025.12.04.07.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 07:38:00 -0800 (PST)
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
X-Inumbo-ID: 375ca3b7-d127-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764862681; x=1765467481; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ksWhcaJPwl/TvVHUuTh6bAAkegjIrAhx+pmJ3q3FCQ=;
        b=A0YqoONs0pPV9biLWuFY0sq4vOTxb2NGM7VfAt8Fllz3nsRy5flSR4PmkejKco6X2L
         DpgGcSTYmlTb7VGyV7noiOfdr7I4RL4o4dNCJuV4KvndeVPQ5NiV/EUxGV7sBrvTKvw/
         1QnfACzTd9mrr9aHue80J4YM/raSledpBEo3RdMxGY4K/bw+05gPtcEzon7mgCpt8Dl1
         fa6eiCrLbbe8KBugz6UJjLUlRv8QKdZlLIVPNj0PRY/PBpbV02z4cZsDFI2mwi9mWlvU
         TIorJbzn5o05HBIU0GJE+T21LgImGIhzhk6bpEvNZWMkVtLdDv46+o0AlmxJ0yrO1tdz
         i3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764862681; x=1765467481;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ksWhcaJPwl/TvVHUuTh6bAAkegjIrAhx+pmJ3q3FCQ=;
        b=kw9+N7dzePeoF2wXF8ZJIIHQWBRUp0f3RyyBr7dvv7SgEUSiSow6/6GxqUpiiNF85o
         JV0LQ3PUOOBYecwGg3H+eRHytJASFTMtN0yT47ITeDmy9OsHBifYNRVfUeUvQPYzu+Ms
         bB67q7ukIB+1PBdmOG9qFk9z+XHvn72JR9auvQA+RD+JfUtbaybBZJey8iMKLKYUa+2g
         Mi7/TAZO8CxBUzfPQzFrmNT4n9bFdgd8S/1uYDbaIOFML6t+AP25Q360WSV4yd9RKy2Z
         kwAV0+WyTYPA60sPhpO+xnmmexNxMf9NlNh9rwG7Ffy6ZGjVEjJ313aQREKZ9QjLUqEv
         Objw==
X-Gm-Message-State: AOJu0YwyZ+qAjjFOGpwBeSUh+lUT0+irkQtNwrnQXzjs8OKp8wdlCB1/
	Yh5IB11Zd8M57pvr3nbdVOENPQjxyQuSdYGJvo9/ie4LTAYJLYd/HQENAWj01pryxw==
X-Gm-Gg: ASbGncuPT8VasBFpQSIxM0ifgObfT3NnjBn+3ljprAzwBVZ3B0J5bS2KwWGpRUbHR6V
	g6FuuqdxVrtO4E8S1u0B7clM1Oamwq+9Aja1V50eO95FvMSM2UdfKchSXRU0o8sIUWPn2h8ECea
	toY5huN+jLyNDvBO89IOQOvuaRORsDaJpzCl4cRonhMJwZTll+Svl9rdNvD5hjesPnF1fAnFMg8
	zyEs6Xkj8I6rt/mu6vI4/ZRIs+cHdvuUjn+9IaJ0DpyPhLrBaR2dZiRc+pjYPKNknyzeDwQdqmi
	xGpxkbObrURZZFxfa+Aw6z2YDG7Bfiy5r10s/r0F1lEeB8deZl0vl1zB64nQN8zkfToiYJBssCx
	EEOKzDx78I+BAfJ9rZEBCW5ZA1t+MMGdh0dXzxUEzrB9aijKGmzZ4jIqF2MaO4O0YCgzahuicjK
	jiGcFwCHXpIxtjHDah97bLrzcnxn2XbMCWxDM9M64IloKGeFfx6LCbVHGKHCD7wFOk2CTuPkktV
	fE=
X-Google-Smtp-Source: AGHT+IGLEbmtCAeAIL9z+i9sV25ZxF9ixMG/HPD8RI8KCwrOXrPt/DCoDoxUJfSmznC2yJz5wOn8Uw==
X-Received: by 2002:a05:600c:630e:b0:477:a02d:397a with SMTP id 5b1f17b1804b1-4792aee6dd4mr66265945e9.2.1764862680570;
        Thu, 04 Dec 2025 07:38:00 -0800 (PST)
Message-ID: <85b426ae-ad85-4bf3-b2b8-39e1c1ccdd5e@suse.com>
Date: Thu, 4 Dec 2025 16:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.19.4 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.19.4 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.4) or from the XenProject download page
https://xenproject.org/resources/downloads/ (after entering 4.19 in the search
box there).

We recommend all users of the 4.19 stable series to update to this latest
point release.

Regards, Jan

