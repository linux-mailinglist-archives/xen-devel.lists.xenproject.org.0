Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A53A5F663
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912214.1318525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsixV-0003bJ-DP; Thu, 13 Mar 2025 13:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912214.1318525; Thu, 13 Mar 2025 13:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsixV-0003Yx-AR; Thu, 13 Mar 2025 13:50:49 +0000
Received: by outflank-mailman (input) for mailman id 912214;
 Thu, 13 Mar 2025 13:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsixT-0003DO-Lq
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:50:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24bc50ee-0012-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:50:37 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so8974945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:50:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b12ddsm21449345e9.8.2025.03.13.06.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:50:36 -0700 (PDT)
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
X-Inumbo-ID: 24bc50ee-0012-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741873837; x=1742478637; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5SSNAzy1KE2sJ7MPhzvTCHZEPpuQWMh2ct9GK6cMrs=;
        b=aDQ7oWod4GR3ol86eXjLtRTM3Tj3p+eQLB0/MK65/rIeorZMgfX1Uz5vz9REQczcrD
         TbKQgAl7EEKqkPNpVPEYHXGhyVgylqAoMefu3DZo3DSGMV6IiddqleU11RlIL81DwU+g
         58zS3eyVm9Hsn2b82jEp9/OrVE0ivoidaAxZzdPRwVNDt6TL3YqtZiDVv4meEQl1D/oL
         l5s/Eyj5JOvR46uocZw6xuZ+GkylfSdY4gTO6yEg/XvXY1eJEZzQQYDRCh/RdAxPzJpg
         QZNqJDi2S+tPriKVDxbpl5tb+sKO+C9WnDgC+kqZtISmJk2uGeyg4sisX9EfVm097lxX
         fyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873837; x=1742478637;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5SSNAzy1KE2sJ7MPhzvTCHZEPpuQWMh2ct9GK6cMrs=;
        b=kTKD54A/nnK+CFiPzgcVm02Qfa72Es5GHePRZ3EszVTnSHgHLCKQl1xFVqhq1Innds
         2Y4X1Su15TvVwX0QegmQONBJjr7/12tKPKrDiRMqtwqvsg0FH9gyZMLdHWxnuQ1a4VJG
         oThyIVIqm35Fxkbi6r5jB9YAY3rNCSeIgE1wu7D+SRJbNG+2iRPszwIAJO9E1yXHgxyv
         Uj50I0qZF8gOLUc8rOtlsLOgeT4/xTMx14lKFg2scR2G9YnCn91oSZvwixvmnx/p7RCF
         daYSWtj8m1KqBVQPxP2d/KRYOsBhdMhIu5nY2VdM6YzwL5EMnFPWOj41N/Qz6ybHLdXv
         bynQ==
X-Gm-Message-State: AOJu0YzQhEZplDuV8SnZwDcJbdRDEGCEWIkzcqBlgYRh9gDj4kheZ5n9
	Ac9bITf0c1q7Z9Y77vVPd2sygenmlfq2zNRrNzcOJY7FqC2eTFLS8YUazXFUj9b2ckiNq7Y8ufw
	=
X-Gm-Gg: ASbGncvtcObEtLNQA2GDJ0lwSqNtAZiaDsjuvTTooLqbg1FVczJM+wbhYJDEc04RgA9
	PDoC7QM0I6fJ++aXEfaEaleOrNfcysVLRDsXckh1XqTgLuwGxZgXWXTbHd7ulhjkflicQ5TLl7E
	DDuWyFITB2Yc6ERoVRsBLH9c8UJqyfrMK5WTkFs64M31afvzGMHek4Ho6jedHi0JCbVS7F+D/Mw
	zB4zxYoQjfNEVKOGeeNjAJyDhOH2HcKPsj650i9U/tGot6fq8ASY4PeXqYtoGyazYY2UOkeyxjt
	fJjwjeCRiwsN0c0xQLnVAoJA71KlGDZAQfWlfQ6uWQz+wXO3gwHtfnJGhmn+Xi/a4AD5PL70tKa
	awiM30ow3tuoYTL1z43qEVj/2W6pXgQ==
X-Google-Smtp-Source: AGHT+IFegTjXNc7tBFIu+ywfm/3a7gVNDTDAu7JEXEbnGG83ZlZVxlpwIuu/PCz0IMHOmeGE/MaBCA==
X-Received: by 2002:a05:600c:3b8a:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43d01bdbde9mr118694545e9.8.1741873836912;
        Thu, 13 Mar 2025 06:50:36 -0700 (PDT)
Message-ID: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
Date: Thu, 13 Mar 2025 14:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/6] symbols: assorted adjustments
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

The main goal was what patch 5 does, but on the way there various other
things became noticeable, and some preparation was necessary, too.

1: add minimal self-test
2: don't over-align generated data
3: sanitize a few variable's types
4: split symbols_num_syms
5: arrange to know where functions end
6: centralize and re-arrange $(all_symbols) calculation

Jan

