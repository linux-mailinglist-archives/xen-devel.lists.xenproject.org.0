Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED009BD3251
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 15:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142348.1476537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ILN-0004vG-Qe; Mon, 13 Oct 2025 13:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142348.1476537; Mon, 13 Oct 2025 13:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8ILN-0004to-Mk; Mon, 13 Oct 2025 13:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1142348;
 Mon, 13 Oct 2025 13:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8ILM-0004ti-ED
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 13:12:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35a1ea2a-a836-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 15:12:03 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso37701415e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 06:12:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb492e6ddsm206326905e9.0.2025.10.13.06.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 06:12:02 -0700 (PDT)
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
X-Inumbo-ID: 35a1ea2a-a836-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760361122; x=1760965922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sxal7fX4bhmJwFz4Nq3sC3uVgNOALK7xg8Vn5uxAsMA=;
        b=GxYnXH8yQXK7z0IcihbEPU51Vz47EDApvRfZ8nTwZyIqMiwAmzVSNpxPXsFFxdLL98
         Wl0pVbWhG7rHp+PNy9S34SZyaPcvrAhJ1mqaNVm4GqlX+jLil5uDL0FYK/GgkBp3OuB/
         Z8kRTTerwBPe2Vuao0ee93dZeDNvcsX9Z000ePMqAVGA3sBqngcPkzwZ4opkBIgctQ2b
         19eRORIbPoJNhKcH6ugaKTZLifD+5rO028ybrJnZnd37Q6KhDzpCSlxoGmyQsm89vFTr
         JzmfEthdLS2BsV3LcQkX2SRqzFIKCE949wo2ZOjhsz+ZFkrxH607pNvUBNHWbuUqoQ6x
         Gatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361122; x=1760965922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxal7fX4bhmJwFz4Nq3sC3uVgNOALK7xg8Vn5uxAsMA=;
        b=jdpTaAEGhdDItfUSx+mYHV1h3INngdpHpBvgXloyl3xAcY1l37O197Auhz2z+ds3tZ
         sf4YuUGUngIyY7DlO3TVYNUbbc5IGF7MmGf1PP+9N2GsjKMZh5tQLfuVKBaX0BmwoJvd
         +Gb7VwmJHOYtE+5kGZn6B1wKRIr8U9UmbVAAHQ5eiiOZHJszjpotMJC5vOdNlL3d9n6M
         uX1mg4hV5F7Nm5MM8cGJ2v79QZAuWcNVlRQmMz1dtpj+X/RI8WWaDwkgTIipFTEdOhJn
         LSUHLr8zm85soiGkqbhrHbbF2LA+4a+0ihRiqUkffpnWXYj3UHNCkxWY9MDFMjOufLFn
         MMHA==
X-Gm-Message-State: AOJu0YxeswhVn0zzmP4ISn71F5RmZBaXAXyDZkeTbk/S1bQcLwYxn3DC
	kujmOUUaq7+nIaosHu05mC/Pb9yHTVYMOGBNnicdc3juLvnvpaQrm39pJ6FLw5VnQQ==
X-Gm-Gg: ASbGncse0sDen8n/y8CprIYM130cc53fM4KuQq+yUU2pWXi1vrPwgZ9n00T5UmoARjZ
	O1An78MSwT0mlFxymwcMBq4sIuOr5ZhmNOZLrShdMroK3OKvQmkMg3Cj5N7w0zdDDVPJrDq7BGW
	sH77eLcmnYKN5xglHAr94rS2LdKtTsyDXE06+WYaku8QLiMTRBQ2kVS0HDsjC1NDENHDJ3TzLas
	HUvQN2d4uA68AmgPGVIQ4qsqF263yXs1ywDU7pv7V/53jkxiDbMlBNDYP8yp0eYqWegdO4XFWwm
	BDPnOFWhMMO4ahL5nNpJKtJjmu/XPC16BUlDZ3s7IOswoCRBzgseF0IJYLL0gF8JGKJf6Vcb2CM
	0r3DECSk9kmtPuyCvEsVl6xBw2R3Q52/ySXyP1avx48Yi8awaPMOpQnMHWI8zGxHywXkEK+I+Rj
	vzvV4ADLRotiexn6Uy7u9+1MlKXQ==
X-Google-Smtp-Source: AGHT+IFZQW1Z0Untu/+PzeEwBrRKtUev7rc5x8SegMmZzoRGiISNF4p+V8v4evkH4KoDN7bJGP6mGA==
X-Received: by 2002:a05:600c:1548:b0:46f:b42e:ed87 with SMTP id 5b1f17b1804b1-46fb42eee16mr87933625e9.40.1760361122485;
        Mon, 13 Oct 2025 06:12:02 -0700 (PDT)
Message-ID: <a7e71598-fefc-4906-a241-08fdaba78614@suse.com>
Date: Mon, 13 Oct 2025 15:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] VT-d: check bus_to_context_maddr()'s return value
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4f449e23-107b-4fa3-b131-a8134763609a@suse.com>
 <f7aa9bef-f83c-4a10-a005-1acb78e16e67@citrix.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <f7aa9bef-f83c-4a10-a005-1acb78e16e67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 14:22, Andrew Cooper wrote:
> On 29/07/2025 7:35 am, Jan Beulich wrote:
>> The function returning zero is an error indication; we shouldn't try to
>> map MFN 0 and then treat that page as a context table.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks (albeit you sent this in reply to the older security@ posting, not
the later public one [1]).

Oleksii, may I ask for a release-ack here please, seeing that the issue
was considered on the edge of another security issue?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-08/msg00387.html

