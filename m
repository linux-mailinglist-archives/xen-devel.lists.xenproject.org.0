Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA28495B8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 09:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675696.1051066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWumJ-0006Xu-Bw; Mon, 05 Feb 2024 08:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675696.1051066; Mon, 05 Feb 2024 08:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWumJ-0006WL-9F; Mon, 05 Feb 2024 08:56:35 +0000
Received: by outflank-mailman (input) for mailman id 675696;
 Mon, 05 Feb 2024 08:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWumH-0006WF-Qc
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 08:56:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74363fa6-c404-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 09:56:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fcb4ef7bcso21744465e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 00:56:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b0040fc56712e8sm7855258wmq.17.2024.02.05.00.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 00:56:29 -0800 (PST)
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
X-Inumbo-ID: 74363fa6-c404-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707123390; x=1707728190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sszY4sOF2GoYgL/RsyF4xdROBXpl0OIMy6KUXcqqU8k=;
        b=du/nSgCH91ovTj0cClVN5K72MYKTezj9niAxXId9ObnzNFjRFTF2rd6AbdTSB1Hjgq
         sGnqahQ8Iea5h5+y8rko4egXypLN0AguIXmvFV5LtxoKFJsIhpF3kTRVMc4Da4ViRcg1
         fhdhSqTygGgFNgFC72h4Xeh1udsGNJwoUKhyO3B4XqQuZ0B88fEwtcD59fF40OA0iOwk
         jBNYtSh5RSC4Mpif6evvu1v/2zx3QBKqnnP7TDcM3L3/CW1WKD/gr4o68TglH1WMKYsd
         5JLRJXNosBhC0Uh/LFDd+RRvHBvhFDtsBvopbbVpkpPupDBvYEE0eLw5umrwyhPEgBsf
         mlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707123390; x=1707728190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sszY4sOF2GoYgL/RsyF4xdROBXpl0OIMy6KUXcqqU8k=;
        b=c9T6Ep4iyXo/2A0vfHNsjwl1RDa/gjyBQu4vfgM2s6py5MbylTAnB46NP7wjzS5Nkn
         DnSP0NFoo9b8vADgYdfLMkF8GLVmyF27majUifbqUe3jMuj5q5++frje8UvfgpcOEXrR
         AytCXDItdP0Dtsk5sNxk3pyU5HRuUtHJyBrDUKYaVY9wsKI6Yi6VefoEp64K2cjiFWn5
         pjut9FHt8ws0iRELtraBKEWWBbkV1EQwmiv+d3IB9+RwmqJKmS58cfoo0oB27IPP/ROQ
         XPwXELKCDTKeLq8p75d0hjKCOIjWEUdi0EokTUWEndaSuGr8c/VHGtP5WM30DKrx0HME
         XRIw==
X-Gm-Message-State: AOJu0YzeW6w6gWueNKySETRX/7rO+B6+MwJrQQjzM2Hr3AcdbVUtAldt
	joDvJyN5EU7GMeUeNtmJa+xTt9GRcag4jlkWKELiQaUlPTFsrXFpJ8foRjci0A==
X-Google-Smtp-Source: AGHT+IFbGtdMEMaOOnK1rbWeOXEwRYXM2EKm0fzDp3scDp2L3DDp4HYpZl66mCdmvObA2xIDoRzOSA==
X-Received: by 2002:a05:600c:6022:b0:40f:c6ab:6c72 with SMTP id az34-20020a05600c602200b0040fc6ab6c72mr4023625wmb.0.1707123389954;
        Mon, 05 Feb 2024 00:56:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqa20xLYiGunQdYxQRvSpZUOaU2t/FSGmdh1TApGPb81wuva5skTPXmCWaW0i/DjYYnOAHgtHVLBQwXN4jLc51xsmoYQDgS+ScQSEmCFKYI8PyfXS96hWSBULqhw6znwPs3wrqIsSh8+Kceyt9PTjWn66qbtS2C72zcxlvMxGTzSZI
Message-ID: <e55d5125-72d7-4608-b7a2-6af73982a69d@suse.com>
Date: Mon, 5 Feb 2024 09:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitmap: Deduplicate __bitmap_weight() implementations
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240202153816.772594-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240202153816.772594-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 16:38, Andrew Cooper wrote:
> We have two copies of __bitmap_weight() that differ by whether they make
> hweight32() or hweight64() calls, yet we already have hweight_long() which is
> the form that __bitmap_weight() wants.
> 
> Fix hweight_long() to return unsigned int like all the other hweight helpers,
> and fix __bitmap_weight() to used unsigned integers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



