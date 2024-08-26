Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF1195EE90
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 12:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783400.1192733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siX5q-0005Nb-Tf; Mon, 26 Aug 2024 10:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783400.1192733; Mon, 26 Aug 2024 10:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siX5q-0005L7-Pt; Mon, 26 Aug 2024 10:37:02 +0000
Received: by outflank-mailman (input) for mailman id 783400;
 Mon, 26 Aug 2024 10:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siX5p-0005L1-E1
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 10:37:01 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2047a36a-6397-11ef-a50b-bb4a2ccca743;
 Mon, 26 Aug 2024 12:37:00 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso450503066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 03:37:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f48a5d0sm643268866b.159.2024.08.26.03.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 03:36:59 -0700 (PDT)
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
X-Inumbo-ID: 2047a36a-6397-11ef-a50b-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724668620; x=1725273420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rc61Y+zZcjwuGhZInOar4nHgYSvBeDCt6xQ7CZnHjY=;
        b=Sz+U5kJly638Sj8cveu0yw8zbDK9e/xwD67eFJgTbvInYHtavCUAGKlpgEQh/n1eW2
         rkN0gxguMmVna/zXpKjXKAITiFS59RvA0z6THAYSQw3V09tSCVx2C77b8cWvKPSJZjFd
         gVr2bWnB1k50jxjXAxU4+MV5rnxT2MQLCdEFAWI+nb1Yi+8qq57jVzJa3vMDKUUqvcZG
         tpLOF5Gz7NVVyfs64vgbZtRMWXc1F7hxkj7VOhNJH50VDugFQUVZk6iHTKNL6+qPVN3r
         DXnYJLVXTvmeq16YRlAWZ5Dxb+v6kB39OsiNePR067oAuTPfjQv/kY35k4KYuIdcfzdZ
         kk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724668620; x=1725273420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rc61Y+zZcjwuGhZInOar4nHgYSvBeDCt6xQ7CZnHjY=;
        b=PbOKRlKFovcSfAFbcHlabHhrL2wDj8UnWwmojoYbrf5qZSnnKtqk8U+4FA3Uz6Kae2
         UAjpFTsJC7Rk/GEdoi3MyA/MVkESB2Lj3eMFyI6m6JfDooucznu2F9Kj9H/ZWreJvwrg
         Hn9SkbJRAkKjuqwzEC2B+RmrkomjcOoi/aaT9rMzsabBVSfRxmKkTqrN43kYj20lMtj0
         6l0cTV6rQUo/rSHmgNFlseIDXSnh/uD91Y9xEJk/T9mkCssdMUM0bO3g9lT6Kr0bWQhX
         KZPD2HkOixULpNMgVmDS94TJp1GcTpnFlY8G4QEqOFN4c0ERYkzh8sxU2VUOkMVElU7W
         jDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqGTnShpPjyeu76n0BMX9A7C0xpnp9UD2UVMuWwoG1vcwMRMNmpuLw5GrxCWOLzMEugxcd4xMQwHk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxq0Zi5FOH0rn/c/26j89eH/oIKUEF5XTbDead456qee3743yml
	NtmXisVPKuEYPOlNNDpxmEFdlN2WkGuA4yAJ29K1AjzPyAWnSdo+xFjtsCPlMQ==
X-Google-Smtp-Source: AGHT+IGMDNeeMnoSoV+ujp4DKswXx9i13LNVEq7JcBo2v5uVoORJ0Qz/GtBG0yXX9g9YdnGDrcd7gQ==
X-Received: by 2002:a17:907:e689:b0:a86:88f7:679c with SMTP id a640c23a62f3a-a86a52c602bmr656858466b.41.1724668619923;
        Mon, 26 Aug 2024 03:36:59 -0700 (PDT)
Message-ID: <756c6b06-50a7-4201-9682-ff4a3eaafc30@suse.com>
Date: Mon, 26 Aug 2024 12:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] xen/bitops: Convert 'hweight(x) > 1' to new
 multiple_bits_set()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
> Using hweight() is an especially expensive way of determining simply if
> multiple bits are set in a value.  Worse, 4 of the 10 hweight() calls in Xen
> are of this form.
> 
> Switch to the new multiple_bits_set() helper.  This is far more efficient than
> the longhand hweight() algorithm and, owing to its simplicity, likely more
> efficient than even a dedicated instruction on a superscalar processor.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just to mention it: With the title being sufficiently generic, I half
expected the similar {bitmap,cpumask}_weight() to also be taken care of.
Yet certainly those (and maybe also their ... == 1 forms) can be covered
later.

Jan

