Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B181945AB7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770782.1181369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoPD-0008D8-UP; Fri, 02 Aug 2024 09:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770782.1181369; Fri, 02 Aug 2024 09:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoPD-0008Az-QW; Fri, 02 Aug 2024 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 770782;
 Fri, 02 Aug 2024 09:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZoPC-0008Ar-Pl
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:16:58 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7aec022-50af-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:16:57 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso8032028e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:16:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839610c77sm857100a12.9.2024.08.02.02.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:16:56 -0700 (PDT)
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
X-Inumbo-ID: f7aec022-50af-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722590217; x=1723195017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ldbi6SSx2WfjmQDZURnzPjhUzF/sNPYST4E6keKp9Lc=;
        b=RQGXAVZ0Htl3UU9WRUdScWcm3qWyvcY0uXLEoVyWdDNDJAa/wdbYkecC9Vwnf0S1Hi
         OIsLurwyuv7SsyTvQVFdRkOhhXBzpNPBhuFhtjfet+hheUTzE2J+1jU2dPPdXBUz+eXi
         DtROQGeeT6D3gTUZRKaywKVwkaEPUdm+Ov9jFwcLpzyG4Ew5SnWqEZgbU6vzqdTVxvYn
         NblXdLscptwI6lrUD8xhR1JzY9g5OmfeuWzzXmOCqEz8sppORijMz4nCp2MvmBkAbL7t
         Mk41L6TOnWJgopaFxiagpA5esCOPkshv7QrRZzPK9vhtsXxAmfS+qOAr8X/CzsJiJ/4A
         EVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722590217; x=1723195017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldbi6SSx2WfjmQDZURnzPjhUzF/sNPYST4E6keKp9Lc=;
        b=btrdiebjeKC2RfWuXT3+ToTwEI01vYKc+7aToD2p+h0kE5wvzh0z06dzj7dUApKOYf
         mGQRl2bjNbVjp5qGRYJB1td0VEqnZeAOKylNXHAzbIsJ8zIMLu6AsiheWnvIQ9hNC9BN
         lLQBNbKxFItYiuRQgxr0T1E++fsOGy8t3ZlecalivfPoGWJAOArgWHhbD7FwuHT6m8LM
         TwigFtCZt9wYsB8RiNT3e2cGQqOFSj2DgausYtGOgx0aK2pxzpyq68hkQpIQPaEy26BK
         AdobKh3t2zAfxOzCoc1e6+4umHvq9q/JFXqivgbxddvd1CECQ39qBQ7NXYegTTd8k5Pt
         MAoQ==
X-Gm-Message-State: AOJu0Yz1CxPHea1vH+j0+JF/WE5JfN7ZXyJUUP/Dz43R5IUUZzgvvdAT
	g1jmSCLefZa+7sZwsdcqmdk+2Z8dkEl0d4PGNHMNvbe2c25wr2ofXAbu4kqK2MrVtRMNah4PTCA
	=
X-Google-Smtp-Source: AGHT+IErRr3g3Mt4PXf7WAiOaZNq6Ic/dbjKvEaLKnvQNyJQF4TpPMR5qBc53J+0UolN8Kbjv7+EIQ==
X-Received: by 2002:a05:6512:104f:b0:52e:9b92:49ad with SMTP id 2adb3069b0e04-530bb354fe8mr1664114e87.0.1722590217060;
        Fri, 02 Aug 2024 02:16:57 -0700 (PDT)
Message-ID: <72931086-36d7-4761-be55-6be45a430cac@suse.com>
Date: Fri, 2 Aug 2024 11:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-4.19-testing test] 187097: regressions - FAIL
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-187097-mainreport@xen.org>
 <73902a85-2750-4684-b6f5-33dd67c72172@suse.com> <ZqyRBbeY8KAzdjXV@l14>
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
In-Reply-To: <ZqyRBbeY8KAzdjXV@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2024 09:55, Anthony PERARD wrote:
> On Fri, Aug 02, 2024 at 08:33:09AM +0200, Jan Beulich wrote:
>> On 01.08.2024 23:38, osstest service owner wrote:
>>> flight 187097 xen-4.19-testing real [real]
>>> flight 187112 xen-4.19-testing real-retest [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/187097/
>>> http://logs.test-lab.xenproject.org/osstest/logs/187112/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop       fail REGR. vs. 187044
>>
>> Hmm, this is now pretty persistent in failing. Yet none of the changes
>> under test should have affected behavior in any way. Ideas, anyone?
> 
> This test passed only a single time, across all branches in the last
> year. And that happen to be on the new stable branch.

Oh, wow - I didn't even think of this as a possibility; I could have
checked myself otherwise.

> http://logs.test-lab.xenproject.org/osstest/results/history/test-amd64-amd64-xl-qemut-ws16-amd64/ALL.html
> 
> The success rate is incredebly low.
> 
> force-push ?

Yes. No idea how force-pushes work these days, though. Nor did I ever
do any myself.

Jan

