Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36FB972D6E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:24:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795172.1204353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snx68-0003Ev-Bb; Tue, 10 Sep 2024 09:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795172.1204353; Tue, 10 Sep 2024 09:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snx68-0003D8-8r; Tue, 10 Sep 2024 09:23:44 +0000
Received: by outflank-mailman (input) for mailman id 795172;
 Tue, 10 Sep 2024 09:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snx66-0003D2-Ci
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:23:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5db6c0ea-6f56-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:23:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so794955566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:23:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d2583c20bsm452962666b.22.2024.09.10.02.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:23:39 -0700 (PDT)
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
X-Inumbo-ID: 5db6c0ea-6f56-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725960220; x=1726565020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PlwnhXGKGA8cM4W0qZkOPt13TR/OKVI7ykIMFv5jMPg=;
        b=WfCzwHcXu18CVUbM7TScBfELCrcgF99zU+DLJB4Ny/OpQ7RYLM2zu7gSlmVKANEb7S
         rk1NUoZtUiCmLOxfOgjagGvu15js/WOCsNaEt/V3VKmhDHP7ygJJoGw9ZsgPW+Pyt76R
         soMnBGp+diNLKyqMa+6fV+IAAqu906HgYrMM3ifHfl5lD0Q+JZETDKiPbn7+c5cXRFDV
         XBuI83GLKuyRYxVJj6MlVS04fn7urLfnxO/eG95LyiqgNzV2VLCMATpbefNv3/XkznBq
         Fb5GkBmstoYOQaYaQFi98HwiB0LNOjj6d6OOIza9aV9e4im1B3I7RYlT87ZrfZuiVoFL
         RxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960220; x=1726565020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlwnhXGKGA8cM4W0qZkOPt13TR/OKVI7ykIMFv5jMPg=;
        b=HukVHQ2L6mBRdCPCpwpBwI7zZULjDEVOX/2YJneXHVO8BnbprZ4pPKzwE7/m9SNbB0
         tq7MxlH/dLQnZzt5uWHmnboBB0E6jPeFQ1Tt0vLvoC6mAWpRcoy/dyEmcVVSF15Rb7Ta
         4wgM2Fcn9tAwXccvMBhswgmjxRKIso7n2ZrFLX69+wWMH/wKIAedUFz1/8NIISlOVyt6
         h3g8jyGF30U5/nnEbFNnK9jCOBZbxcxV5hZ1JQq+1rz7uFJoDH6qF3+EBgrcmkX3SiU8
         B6X6Z/uYg239xFMW3oa6jlQeZK48+cOlRKrpZzVWO2Xbgmk4osvNxiGL04751rIW9q4H
         823w==
X-Forwarded-Encrypted: i=1; AJvYcCWAqADpNdjo3pVDCXITTHON0J/62nNIlBg2KLVZV9pVYkmRxwrbKGjkoi2v9iBT7UrAPI1AAFixctM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyvwm560z+saEkFyNPmoTA6v/4ckkP6amDPADkO2IkQkJsaYzzl
	3m1BemkYgaZpPaHXn6ciX2wT6zZBXZz9qbPuJp0uGaI7fmekVicDPpNYB6US3A==
X-Google-Smtp-Source: AGHT+IGZLcuaDnD6DZtSsogF92h83w7diIwm+xfzpSW9vbCQf3oWnK38vmh7HhV3kAcU1dT6HxoV0A==
X-Received: by 2002:a17:907:3e0f:b0:a8d:2b86:d76a with SMTP id a640c23a62f3a-a8ffb2ddc4emr4787066b.32.1725960219638;
        Tue, 10 Sep 2024 02:23:39 -0700 (PDT)
Message-ID: <70306f7d-7c0d-454e-96c6-a82770f2af5f@suse.com>
Date: Tue, 10 Sep 2024 11:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] x86/time: introduce probing logic for the
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-3-roger.pau@citrix.com>
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
In-Reply-To: <20240909145455.7517-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.09.2024 16:54, Roger Pau Monne wrote:
> Adding such probing allows to clearly separate init vs runtime code, and to
> place the probing logic into the init section for the CMOS case.  Note both
> the Xen shared_info page wallclock, and the EFI wallclock don't really have any
> probing-specific logic.  The shared_info wallclock will always be there if
> booted as a Xen guest, while the EFI_GET_TIME method probing relies on checking
> if it returns a value different than 0.
> 
> The panic message printed when Xen is unable to find a viable wallclock source
> has been adjusted slightly, I believe the printed guidance still provides the
> same amount of information to the user.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



