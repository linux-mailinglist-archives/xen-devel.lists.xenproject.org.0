Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF26C8848E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172280.1497367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO97N-00066R-Fu; Wed, 26 Nov 2025 06:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172280.1497367; Wed, 26 Nov 2025 06:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO97N-000641-D9; Wed, 26 Nov 2025 06:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1172280;
 Wed, 26 Nov 2025 06:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO97L-00063v-Ps
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:35:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09979d26-ca92-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 07:35:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso67373645e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:35:02 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cbd764dbesm35093610f8f.27.2025.11.25.22.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:35:01 -0800 (PST)
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
X-Inumbo-ID: 09979d26-ca92-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764138902; x=1764743702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q33buSFPonoTaEDyFqYnlfJXw66rOnir9JneMBVT1/k=;
        b=L/Xgk0kzLxaFfUM9JGTnARMajDdchZq9IHg2cV3EUy1vzlzOSo4IR8yWrwO4BcfbNc
         Dw7YEtpvOUvRi8a52gljbhAMAJOjoEzVd36QkebqW+fTY5g0yIM8mSfiiFe67EJME+ki
         PFWxhDTZ8gdzmscXJ4KqAS8kf0TEPQT+QPTeXd3+LUwg1gdk9ObZWZy13TXYC7uNXOxW
         /d65fLuOG10JUt/dsW0YtK7+8pJK0DmNiBIHlT9QYWDAK4tQGvVYh2+q/41nNLrLNwwC
         bdWQwu87ih4GYpyEbBDvypH5eDzPhuID3pAoBnJ0nqi1OMFct8QRV1GXJNM1tWOurwfN
         ULdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764138902; x=1764743702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q33buSFPonoTaEDyFqYnlfJXw66rOnir9JneMBVT1/k=;
        b=sPRCvbT1djQTnJNGkV9V5drCzaIShGs7Q4mtmSEn5y2A/EpX4HFCaJeL6bzlNqX8yn
         IqlUd7riJ9gJVsemonFBEAueeeP+Vdf/xgIQYkJr77ULl0+miMlyeXcVUlrwu8UzE/fp
         t5+sBnhAbGD9WmoEWe4E617sGwRpZVIb37BoLx0a93m/ZxPRETjEEdpV6PYKXFvc3VwZ
         +M+vwHQSeb9t91OOmuKgJ21C7VbeMVK/u+7UoMVIQWXYYEQ5qU8owiVu8codlkzrDmaI
         stHb4uV2TX/PO0RBXHwT/2FWT3Y0wyTCjHt0KeuCx7gJu7mvM1pjorl0DfW2INmfipyx
         tswQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+YHKnSixgX+4T/PbXrzcfPs5IhN65NNCkXQkd7oWEbSktAZdQXdI1gB6aF3Kevq2uRtVmZBnX1CU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT81xhxVXgzMRcI0YJy6W6+DwlsIAQkrSD/klvqcY4V7x9+zt0
	qCw6cJQrZXE7Z+9kSCXIPZ7NIaSztCVoGYiVO+rrcs0wmWAz6c4WBkL4XD6Hkgt8Aw==
X-Gm-Gg: ASbGnctigXxZOcv+SHOJjTi+JqzwL3+85ri6PbUph8iQvl73GTltghKhvATOH57QPJR
	TvMB47SepyNE/Px8wXgzpQEMxlgHGI1QKUYTtSwITAkEAqqC7GfcSqhRfdeEOP2R+ICPZUeNjxu
	sCOc3/3X4aTmsYL8+V5dxqteoG08npoVATsuHfBEfdNzw+fX6bssShnalxdrky7egz9bwLyvtl8
	g1SsuCJ7g8WJcgoaERolIWKo4TbMrZW6IwDoly3YMTMy4hgBiikHDRFrufkoJfaf8Fs15noY50R
	WaHzZ/+sgaCbfLYYDPq/l4QRy8jEKHxiGIuEg8YcaAbDQBQtbTcC9VnQD6RQfZYvWwqZ2YOn/uM
	gQ67i8NPhg79oVFcb+dYCMZheE0Nr58PDB7tuSbX8m23XGN9Hv/NeBtBNAJNPLxh8l03inapWS1
	4aFe21nMj2F94IlDA3Ao+Vclcinzr7cfQdjjdpagSmv7DoxI0zwTGjDlBdE+pZ25AI/PanGWfTZ
	eUTqP8YuPiUjeBLWb4MivYYR9EuJBsu4nG0z5QRiuh2951w
X-Google-Smtp-Source: AGHT+IF376hT22W8+XbwgRIBEQ6Z8CgP0aZSb+tJbHrBvz2JQ9sP7ojbxKb8EaqPF1JsJiSOzhf/2Q==
X-Received: by 2002:a05:6000:18a8:b0:42b:5521:31ad with SMTP id ffacd0b85a97d-42cc1d51b1fmr17540028f8f.49.1764138901754;
        Tue, 25 Nov 2025 22:35:01 -0800 (PST)
Message-ID: <dd78860b-7829-4eb5-a26b-71e133df5d81@suse.com>
Date: Wed, 26 Nov 2025 07:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/24] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_HYPERCALLS
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>, xen-devel@lists.xenproject.org
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-4-Penny.Zheng@amd.com>
 <5050db49-8581-499b-93bb-98c0f084d071@epam.com>
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
In-Reply-To: <5050db49-8581-499b-93bb-98c0f084d071@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 00:02, Grygorii Strashko wrote:
> Hi
> 
> On 21.11.25 12:57, Penny Zheng wrote:
>> Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
>> single option to manage all unnecessary hypercalls, including
>> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
>> make it easier to support randconfigs.
>> While doing the replacement, we fix some bugs on xsm system:
>> - wrap the whole xsm function to avoid bringing unreachable codes when
>> MGMT_DOMCTL=n
>> - add missing wrapping in include/xsm/dummy.h
>>
>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Stewart Hildebrand <stewart@stew.dk> #ARINC 653
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Cc: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> v2 -> v3:
>> - wrap the whole xsm function
>> - add missing wrapping in include/xsm/dummy.h
>> - refine kconfig description
>> ---
> 
> With below diff..
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 6709c3c95c53..f478adffff9c 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -652,9 +652,8 @@ menu "Supported hypercall interfaces"
>         visible if EXPERT
>  
>  config MGMT_HYPERCALLS
> -       bool "Enable privileged hypercalls for system management"
>         depends on !PV_SHIM_EXCLUSIVE
> -       default y
> +       def_bool y
>         help
>           This option shall only be disabled on some dom0less systems, or
>           PV shim on x86, to reduce Xen footprint via managing unnessary
> 
> It could be very helpful to consider this patch to be applied first.

It doesn't need the change above, does it? It (aiui) deliberately sits
ahead of the patch (supposedly) doing the above. While (once again) it
is not being said anywhere that it's independent of patches 01 and 02,
I expect it really is. In which case all that looks to prevent it from
having gone in already is the lack of an ack for the XSM changes.

> - number of tags indicates that it's the way to move forward
> - with above diff patch 4 can be dropped

Except that imo really wants to be separate. And that could have gone
in already as well, if only it had been done correctly.

Jan

> - it is mechanical change, but it's big and constant source of rebase/merge/cherry-pick conflicts
> - once applied it will allow, actually, parallel development of this feature as MGMT_HYPERCALLS will
>   be defined while build not broken.
> 


