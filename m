Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367B6B488CB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 11:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114987.1461763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYNt-0001oz-Fr; Mon, 08 Sep 2025 09:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114987.1461763; Mon, 08 Sep 2025 09:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvYNt-0001mn-D5; Mon, 08 Sep 2025 09:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1114987;
 Mon, 08 Sep 2025 09:41:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvYNr-0001mh-Mt
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 09:41:59 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fbbf0d6-8c98-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 11:41:57 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-62221568039so3265952a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 02:41:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-622ac41b1d6sm5447520a12.32.2025.09.08.02.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:41:56 -0700 (PDT)
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
X-Inumbo-ID: 0fbbf0d6-8c98-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757324517; x=1757929317; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YdCnBPWj7Y1Qdy/d2R6kjaN8gf65DHmCfaEnsK0LXzs=;
        b=PTku73G7LIqpIlt28/4SeuWX9H+cxw2KpqoJoTrUaQmK+RyymTdxBmBI8WLjHrQhse
         gS44BVTydPFLAl5VS86BxVEBXUNh8BEQ0Hko4xJGNZMagI9lRezUD7yBRKmn3ohFS+is
         VdYz6MpxbEfrqHEPW2PADASnvBJmPkh/8dLLqmaQSgS6p5cMpt/IeOyJVy1XSld3lYij
         V4frSN3T/kiePKepVJYJJFf4mlFybhe/lNnVp2j/BxULB0G8B2DiBkXgSnxDwDC+9x3A
         zISQJ+iFCda68EixfpHNp9i/wED2FmFx/4HwMYP08vxMbwMSRb2Koq7YIV4Kt5bTkJzw
         6wvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757324517; x=1757929317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdCnBPWj7Y1Qdy/d2R6kjaN8gf65DHmCfaEnsK0LXzs=;
        b=peexjVyVT7iqykcsTIegeTjmAtINaFrzKLgr+k17eAVzgZ87KvuKe4ATxkVLI/Vv6U
         XoUJGbJ2fD7PRjxbSTzsJ3b5Jx8oWOQvP5Xd98hqYVo8nPe417LKBwL71MG4zg3dJKLl
         xuNsEjDPMlMhPuAYTNF/X7QlLOxzT5DPcJxacYPuTvu3el+bENM2jULLRfLn0lVSitUX
         qdWzCsL+E++qJdoTzlm7qGd0Acl9/8uQ/RoqGUP/cClghLn5IgBzwbPFJQ7cKPXemExr
         Wm9jAiD0bIjud+a42S+Xa/+nqE/Pj6+l8D1+/ZPFeRGueoUQ3L1szNjs7g35vzVmAdHJ
         pRoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6wLuw16/wDU5/GGh+k0G5Cmfiu8MX0hCYC6TJyZd84MDm9n1/iruV6Fe8HcPQ3N6Xbx0AbwIurB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzCS58W/+KIXUTa0/oLaBsenbMHRzUKaG3aYKJJjiuzjPjKTwQ
	cryl+M8cGRlo0aGVkjI5JPdZFXybdyZ1rBzvdAye+nh2UAwz0sbsj5+N8mYrEOcxVg==
X-Gm-Gg: ASbGncuHnOwuQ5kJBYdJA/QCVNchSn3E9OtphJeK/mPn3UZD918hIP+d5trLdVSeuZp
	OUthL7j8iD3/8w31NeaSxnymOtGBtuOWqvhyKs13ZrRx9ztMS2MvzXhtWEARR6Ml0empmNZRtIO
	AudprX6dyyXONMw31xTN39wdRHBdVhhYMyl2NokU2hX446gFotqwkIpQr/3dqJH/mbCirf8GyuD
	KmxZWXx6JRke9yd8zeTFYl6ffkrrl7CAAqKcKTJq2XfKXTKqqiBchiCTTCBd0cychFnzFAJTgGA
	+EgZAvmW4u6/IhzPndK5dkpRlXyyvPAGD6jEDh+QTHNDtqKPYa78r19Wb4eBOZQIBjwb5ib3/zj
	pHptpsDDEN3tWahk6SduFGKZP1V8n6v/QW1Q44tYtqc2/BAzqTRL7zr57AO00WGgEyEllbRXs8v
	FNxYguJ+c=
X-Google-Smtp-Source: AGHT+IFt9noQxm44zpfwQ0pHuUqSK720WXSiFzCBmJ8n2/GZQ4EMSgk5rBbK38L11/h10Cmm5Uci7w==
X-Received: by 2002:a05:6402:2553:b0:61e:d3d8:9377 with SMTP id 4fb4d7f45d1cf-62373df688emr6400692a12.9.1757324517112;
        Mon, 08 Sep 2025 02:41:57 -0700 (PDT)
Message-ID: <bf218191-fca6-439d-ad75-04162335b3ca@suse.com>
Date: Mon, 8 Sep 2025 11:41:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] efi: Add a function to check if Secure Boot mode
 is enabled
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <8d66f9ce2c9c352794c0c144f6e00d0a9d465dbe.1757071716.git.gerald.elder-vass@cloud.com>
 <ed2e2406-bfab-4111-a9d0-025c85b51bdb@suse.com>
 <CAOJ+D-UkSveZ4LdYK5GA3VucxxSbQgBv5m9jfZ0H_MyuHP-UZQ@mail.gmail.com>
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
In-Reply-To: <CAOJ+D-UkSveZ4LdYK5GA3VucxxSbQgBv5m9jfZ0H_MyuHP-UZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.2025 11:35, Gerald Elder-Vass wrote:
>>> +          size == 1 && data == 0) )
>>
>> ... any reason it's literal 1 here?
> 
> The size variable is also used as output from GetVariable and we should
> verify that the size of the returned data is as expected, it is simply one
> byte so probably not worth defining any macros to make it clearer

I don't understand this reply. Why would the initializer of the variable
use one thing (sizeof()) and the checking of the variable another (literal
1)? Even consistently using 1 would already be better imo; consistently
using sizeof() is what I think would be best.

Jan

