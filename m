Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D94ACC4BC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004231.1383897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPJ9-0006We-FT; Tue, 03 Jun 2025 10:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004231.1383897; Tue, 03 Jun 2025 10:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPJ9-0006Ud-Bn; Tue, 03 Jun 2025 10:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1004231;
 Tue, 03 Jun 2025 10:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMPJ8-0006UW-0T
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:55:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4748924e-4069-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 12:55:36 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4508287895dso37381355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 03:55:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506be97e5sm85171895ad.103.2025.06.03.03.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 03:55:35 -0700 (PDT)
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
X-Inumbo-ID: 4748924e-4069-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748948135; x=1749552935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1tH0v/HEdC9WlxoFyWazLONSPy2Y2UaEV2FxRI6+Bsk=;
        b=A8aSWHa7JckLJD0MQq0+KLNVMxuD5oV65IlabjxZCnJqT003xVcvjk47BalOWzb2v0
         yPbGLC4L2EKxgLEVEmeyxz8vv0YCmy1sXFPuffKB4d/BmF0L9zy5NxqhTd2tTO1Aj9ze
         nut8abmb4axSeoJgqRdha6m9vDnGS4cfkNqEuL1ViqfQ+Uh0UrrlS5FHssnrPmwSUN74
         rJBEcsRHeux5OCsHxetoj1ZjOgtB74/JplQM+/z7ANJdx1qNsVXZnbxx5jnjXuNKKZLk
         K5CcjjdZsDVS0nDa9xXC18ztXw7lnGkcav96/Hxjlf1BDs7GH8CbNBq/cHqBnyZaqfZM
         N+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948135; x=1749552935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tH0v/HEdC9WlxoFyWazLONSPy2Y2UaEV2FxRI6+Bsk=;
        b=rU2Rib191lng/LWyTrBBCWLG2RQ6p2pXlxfUiTjoGQCpopJdlGMZY95JwwnQdeFfjF
         d71JD/aDtCrt3+aLUOFTYVE4Q9n+5t/a1GmEL+DHBTEbZ0lYj0QT4ECZRohZR9G3j4Gn
         IJYPfeBSbPgQoNSkC4xLkayXhaznbPjRHypDQtSlfIwlpI+ARzqcNfunr6LS7PAQDQCd
         /Kg/4zm9Qdp+EJXgTyKaDh3joPfTzxTIcuqrp6e5Ovs3FnJxHIhEEb/DwNzBiYKxICCe
         //DYDcYNC8TcNgc5fE/cDNKc+fNAv85ENBct9r1ecdBcr8VlI5ILsBM64Sng5Io7oP/z
         3gbg==
X-Forwarded-Encrypted: i=1; AJvYcCVHzL+Kc4XvDybsLINZS/eQ2vpECkxqEMw4JsIDIeFHqS+v5BRB98TO/Rup0E1UZHf+9IYJxmICZwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwM+z+xwQG7+TKlgK3i+iWcRPc80pfa9w9IhRf+KqcdaCWQj5y
	jxKUvUghldCNY+GSTCoqYkAMp/AYdNbg4e6IhT3vK7XX1AqtkT2ILEZLww4OSZu7VA==
X-Gm-Gg: ASbGnctsdp3JRV+bqok9vpM4imEu87yC62PDpWS452ihSz9UyBdfirCweDUqPsKNSUn
	Jb8hdMWzjWn2caPGRUK6tkzcybRukG3wSdhY+F0BcE4KIeHUnTMoLoD4YkkpczTrLUyg43fEBGC
	0meSbuVlZ6Plj4sr9/GRyLx2hhBUpl6faAth1HNwvIEVgNecbc8NjBsLjHNmJyCmH1GBIrajaaV
	JEKzsSsHvg0t04J8amdCeH4I6EtikN4bbbSB2tvL/0MHPMPOKbtBPq9ArlA08P81EEQdc7073oc
	Jtunyz/TxdfOEdBAKwWMZjcIoPdznRkp2fzKTcOZqsTTKDOtbYISjpdOUdhMMy+R8bM1VxpVDzl
	BtHulMMP93B2RgHpXQmGeItGtSERGKr/8LujO
X-Google-Smtp-Source: AGHT+IH4cOq0txEFv0mpCPLHW/uCS3ETLMRUw6O230Gg6ZwBtcIghw0IcqdSAyF9hWWM4nmPEyKCAg==
X-Received: by 2002:a05:6000:3108:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a51417af94mr1649306f8f.8.1748948135568;
        Tue, 03 Jun 2025 03:55:35 -0700 (PDT)
Message-ID: <d99ee841-5e11-4dc4-a9f0-ec2bba02e962@suse.com>
Date: Tue, 3 Jun 2025 12:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] common: Drop unneeded Arm dependency for
 static-evtchn
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250603100329.149851-1-michal.orzel@amd.com>
 <20250603100329.149851-2-michal.orzel@amd.com>
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
In-Reply-To: <20250603100329.149851-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 12:03, Michal Orzel wrote:
> DOM0LESS_BOOT is sufficient (only Arm selects it today). If needed,
> proper arch dependency can be introduced while adding support for it for
> another architecture.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


