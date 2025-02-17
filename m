Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1093A37EEA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:48:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889911.1298949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxjJ-0007t1-QE; Mon, 17 Feb 2025 09:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889911.1298949; Mon, 17 Feb 2025 09:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxjJ-0007pv-MX; Mon, 17 Feb 2025 09:47:57 +0000
Received: by outflank-mailman (input) for mailman id 889911;
 Mon, 17 Feb 2025 09:47:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjxjI-00076I-VX
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:47:56 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4336b94c-ed14-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:47:55 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5dee07e51aaso5490721a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:47:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9a65bea0sm179338766b.46.2025.02.17.01.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:47:54 -0800 (PST)
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
X-Inumbo-ID: 4336b94c-ed14-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739785675; x=1740390475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L2I7yZENYarrfL5A7SkFB8cMuu8nR46ye5W2SUluD/s=;
        b=filxi5ukgsIkJ2eNIFzci3ke5JJuLlhsBmtwvbGRDCjABPGr7zlSRJXuzWGs8Yx1BO
         3wiG6URFMzxulh97faBPZBJ7xAmLX1a6WhQAQyhCrzGdJbyJc1npeyKl311Ht+cEDKid
         j2lV0WxFgEvr8v3ioqf/FElp49ZTBf5w76hE3hMl/8uPqU6fIjSkYzOIK1+SDveVXsNM
         LkSs5ceLfOcDoZZaiuobCVE+mTm9oTITMKmpk2obNacbGioVei7Tb1mER8hMYDMs06ZR
         af+RKbzjV6M8agTk/85OithHTPSqXeodqrB0RkLATvin9rRfRMLiyo/AzHJCOU0qf08E
         3mCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785675; x=1740390475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2I7yZENYarrfL5A7SkFB8cMuu8nR46ye5W2SUluD/s=;
        b=XS195KhNd/Oo/4yxXuISIdibyTBAHzWU++MHlrdTqiJJc5azUHITFPCcU7qs4ZXlva
         CbSMzdReqdnghWVzJREYLVsFNP4LM74S589WfGqfkuvXfeQYudLzYDRSH7zXsO9rIFea
         GK89LY3RTKnA4jw8hQ/nRR801ojurp8TB4G1v3AbsHSRsHkxWIUyfAAVojPQnlZGUTBP
         zzAoboy3xvsXgxzT8T9Tt/4xr+JUIjLN5zPcFgaXyNnQNmMn/LC5albvnQztYRCWYtca
         4ESYFEVpDmY1+ivUm4ZC9HlVKgT/xeE/i+q/OAO9M1v2C3x+Xs0Ow0jg2XBn0Bp6+Svm
         uyJw==
X-Forwarded-Encrypted: i=1; AJvYcCVDiddTq0+uTxgqAQD7I8AMyYnvIg45z2US9joUP8Yn6HTGeVI9CfrFMKYk76F4yyta4rQ3XHrW47A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw188Qjl+u5SHYuPH2JIUt5vhPgk58Tity0w7WyUSECcUWwiDcD
	lSCjao7dMYaDViHp9rQmjWLpdhad14Qlgyq52R/3JiBsC0xGHaR6N22YFJzMSg==
X-Gm-Gg: ASbGncuGLKs4Yg7+8ONEvzEMiKCacNzdg+8p5F3IKEjKStWd7K9ZrYMuA4Jx/bZvL0R
	cZPq4+g0KDzILPXn4dZhoUKvTUFiJoH821oWutJq9JIvpscScRsVjneYjOk7rh5nCTJ5Vi+XhbE
	bmhaMMdriScMWDSrSa+vTM3YaoaVSPOi79kA5HRn1Y8vcG1rMxW9ie8Sij7AjA9jsrDwZO1ArEA
	mCDk3H/aTITWbwuGHD/PKhjkHVIJjoyMGIxXWsm8u1NYpsg++sXtxYDiI+xFyysI3+CjStDx6CU
	68wv64c32tUg1Ba5XnFdKcS5a+og4oPR3eiM1HEa0QDzi56lzjvTsvrPy/5/AkYabGEh99GghW5
	/
X-Google-Smtp-Source: AGHT+IGcXO2lft3P/RL4ymbRoAtYmI3iR/FLVK38SOuKbN7GCmVaTz2EOt2pzPQqCNWdbfnoE8SjsQ==
X-Received: by 2002:a17:907:78b:b0:ab7:c115:68fd with SMTP id a640c23a62f3a-abb70e61a23mr905850266b.53.1739785675102;
        Mon, 17 Feb 2025 01:47:55 -0800 (PST)
Message-ID: <097bbf1f-1315-4bec-8e78-d4027a5df4b1@suse.com>
Date: Mon, 17 Feb 2025 10:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/list: fix comments in include/xen/list.h
To: Juergen Gross <jgross@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-3-jgross@suse.com>
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
In-Reply-To: <20250216102356.18801-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 11:23, Juergen Gross wrote:
> There are several places in list.h where "list_struct" is used instead
> of "struct list_head". Fix that.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



