Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DB827201
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663571.1033550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr5J-0005Pz-2r; Mon, 08 Jan 2024 14:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663571.1033550; Mon, 08 Jan 2024 14:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr5I-0005Ne-V5; Mon, 08 Jan 2024 14:58:36 +0000
Received: by outflank-mailman (input) for mailman id 663571;
 Mon, 08 Jan 2024 14:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMr5H-0005NV-J1
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:58:35 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6524a8d8-ae36-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 15:58:34 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50e7d6565b5so1917461e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 06:58:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l21-20020a02a895000000b0046e2158e4bfsm783531jam.39.2024.01.08.06.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 06:58:33 -0800 (PST)
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
X-Inumbo-ID: 6524a8d8-ae36-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704725914; x=1705330714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5tP0cVMv2T2Ip1igaHjbcUkC8zfNqqPVKWoCK7GpKM=;
        b=Rq9gULM6/F68MlrNNsNX5/fPdXR0o6CfyzGsvEYixWMePYnCnlORbT2qem2SJZ2rok
         zYyzS6rrbxwizn8HPQ4DaDagx0VELPXws6ppgUzdXeskI/VKAkgqxTD2Qv+Dq0bvXaUy
         Fcf7PrdUslSup+Th4JJqXI02rAXU6Byr1HGAZw/AbxAJ7WhYvCfJXaFNAVOBiUqKMPt0
         uWDNBScqeoDR/k/ZNxCDST8EoOlMrmOnBXXQ1ekdQxmXyAyDd8g9BSITpZ48mVoBRXcm
         ofbVAJQP8q6iiN7a+he+hbUaz6twoZxLUuQRicTHJ41NZlA4aCPRnVFmjNAOkwS8MJVz
         DrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725914; x=1705330714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5tP0cVMv2T2Ip1igaHjbcUkC8zfNqqPVKWoCK7GpKM=;
        b=CU12Hjtbh6DkfldyilsqX4M6cHqhGNAei0bLVYTBY33XAVk2zKBIJ/pzSucYU8S9Al
         vM1fSvWmgH630yN/cSavZ/AsB3hAgeh45B28FPtzoJPu5RtYpxd84oTGOAwrTWr5P7Gr
         vFbYdHLWrowSVTtzTpoCmyYAKl8S5b4JvDGzoGsUPL68A5vliBWmdB5HQpxi09VeuZX/
         mptnxpOa18Z519xX2v2AdWZJEtTxHHYkrxS75o7fgo1RZLdVytM3MYZGsSln6UOLQ+xP
         613ESglGZxzrMbXGh6YyOo3y/xiwSwyMQUhgVEXCI9UaIDEN+7NNpOPfR7mmcXY/SMuP
         h9+Q==
X-Gm-Message-State: AOJu0YzUT3F2DMesEeKoKGrqbpUQZpDDn1KGw6RsCBUvB+8qrOjaACIQ
	aPSyu2VaZyEiPH0Y3MvTJSbAWXYwVDuT
X-Google-Smtp-Source: AGHT+IFqxaFYUFyhQrVL1jSLt1KkqEP5HOqU9AL16ZP+4jiwO3a/EY0BSsXmaFD1sZuW5pwhckh8HA==
X-Received: by 2002:ac2:5f75:0:b0:50e:73af:598e with SMTP id c21-20020ac25f75000000b0050e73af598emr1270396lfc.113.1704725913972;
        Mon, 08 Jan 2024 06:58:33 -0800 (PST)
Message-ID: <cc704b38-0fd7-4155-8de9-308ab1a46740@suse.com>
Date: Mon, 8 Jan 2024 15:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release schedule proposal
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: community.manager@xenproject.org, julien@xen.org, sstabellini@kernel.org,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com, jgross@suse.com,
 Wei.Chen@arm.com, xen-devel@lists.xenproject.org
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
 <87f4c67a-3902-499a-b4e3-c1429a0d9167@suse.com>
 <61bb0457701582f85f60f81cefb02953587deb06.camel@gmail.com>
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
In-Reply-To: <61bb0457701582f85f60f81cefb02953587deb06.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2024 15:37, Oleksii wrote:
> On Thu, 2024-01-04 at 13:52 +0100, Jan Beulich wrote:
>> On 02.01.2024 17:59, Oleksii wrote:
>>> I'd like to propose the release schedule for Xen 4.19.
>>>
>>> Based on the previous release schedules [1] and [2], it seems the
>>> next
>>> release date should be on Wednesday, July 10, 2024:
>>>
>>> ** Proposed option: Wed Jul 10, 2024 **
>>> (+9 months from Xen 4.18 release)
>>
>> Hmm, aren't we intending to be on a 8 month cadence?
> Considering that in July, there will be the Xen Developer Summit, we
> can aim for an 8-month cadence.

July? Iirc I read June in the announcement.

> However, in the Xen release document, there was mention of a discussion
> [1] about cadence:
> "With 18 months of full support and 36 months of security support, the
> number of concurrent supported releases will be the same with either 8
> or 9 months release cycles, so I have chosen an 8-month cycle for now."
> 
> I interpreted this as either an 8 or 9-month cycle, and it's not
> strict. If there's a strict requirement for a specific duration, I'll
> resend the Release Schedule Proposal.

I'm not sure about "strict". Yet ...

> [1] https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

... this very mail worked out how overlap with larger holiday ranges
could be minimized not only for a single release, but for any as long
as the cadence is followed. Iirc this works out better with 8 months
(as kind of to be expected, as then there are only 3 variants, whereas
with 9 months it would be 4 of them).

Just to clarify, personally I'm fine with 9 months or even longer, but
it seemed to me that we had settled on 8.

Jan

