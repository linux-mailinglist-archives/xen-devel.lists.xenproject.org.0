Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA08689D9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685880.1067303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rertR-00078n-U3; Tue, 27 Feb 2024 07:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685880.1067303; Tue, 27 Feb 2024 07:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rertR-00076K-Qw; Tue, 27 Feb 2024 07:28:49 +0000
Received: by outflank-mailman (input) for mailman id 685880;
 Tue, 27 Feb 2024 07:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rertQ-000766-Sy
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:28:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7aad9da-d541-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 08:28:46 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3e550ef31cso437771166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:28:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a170906f34d00b00a3d8fb05c0csm479038ejb.86.2024.02.26.23.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:28:46 -0800 (PST)
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
X-Inumbo-ID: d7aad9da-d541-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709018926; x=1709623726; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yGTMfEzs3kic1uFPt1x3+Vtw5Q24sXPBBHyvwGV154=;
        b=cWiUlF3FtkIBLOvpcd9r3ZIQrJ0mt8zBbPl7X0jGnDpYbU0P6rkKZht8SAvM2bFo6a
         GjNnO9VRX435uPXtadj474Y75AMjVsXn1FRWgctHTb/xZzC6h08SLnRLLZMPJDf01JoC
         c2Ma4VuJllAfdYOhvIq/i+zhd2FYq6IejUXwnXpBpY16a4i/U4zOeqSdvOfPqnsZuSw5
         +BRzQlqf/ErJhEpC4L3JIj+mUk6xN8f++PKfC3Zf/u/AAiCguJaGb6G7NnXcWwQ7IkwU
         1w/VjF2clj1Mp910ypd1x5zbbB606A7ri6/20vpIJ0iaUOBIwiengG1vvDnDtjf670Q5
         u0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709018926; x=1709623726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yGTMfEzs3kic1uFPt1x3+Vtw5Q24sXPBBHyvwGV154=;
        b=bwuhd7vGplQgCPLkUqrKHgUtEUWoocsMWiBHT1ziHgzfO8WvLN0g0DSPoeyjdLLVPl
         JR/x3bw8VNYVYsh9//nKAaNhjCynHb/70NOosXmH7erAZBoWxCvw6d5LRDJat2CxVSK7
         mfpUnirTyE2JwhCEtK2pKW0UE976lkMDY+QPw7c1QD4X3GI9c0VbKelRiQesjVlcxN5U
         xJCyB+Pu5Qlg2phRwqzk+R0yVRh03ZPgHLIkzNlUs0DEGCSNPjM8+cJDtaXEEmKpQUT5
         Zqfo04xRvxE90BN/6Zrpf/NdlqzkSAiSrHigBJbM646bBgR/+IYeBK5mIiheu+CxXUqh
         4wVg==
X-Forwarded-Encrypted: i=1; AJvYcCUwA5RR1uAjclCyCvLosgGKlcCu2iqoTBGuoJ2CZsX3hmITu02g2ERV/f+3iG0sVtYTWXt6Ga9Gcjq67dA+ASrzjH5PejkInExrqz65V2w=
X-Gm-Message-State: AOJu0YzBPEBzZz0UTFWIZirzyG0t7UpOI1YmshZcEFmHO2uS/IxTKsPp
	BsRtBB3WSBT2/NhsUecESjiE/vJSeCFEFB1kHiXt7/c3iY95jWaZ01X6R5aOKg==
X-Google-Smtp-Source: AGHT+IHvQ5mS/YyTT8P9i1C68SFs6y08ylywe3LRbqMvH8oMNTQZndrJ137GDorhL4agtpD2ptZtJw==
X-Received: by 2002:a17:906:150b:b0:a3f:20b9:2b68 with SMTP id b11-20020a170906150b00b00a3f20b92b68mr5726365ejd.10.1709018926631;
        Mon, 26 Feb 2024 23:28:46 -0800 (PST)
Message-ID: <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
Date: Tue, 27 Feb 2024 08:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 01:26, Stefano Stabellini wrote:
> On Mon, 26 Feb 2024, Jan Beulich wrote:
>> On 23.02.2024 10:35, Nicola Vetrini wrote:
>>> Refactor cpu_notifier_call_chain into two functions:
>>> - the variant that is allowed to fail loses the nofail flag
>>> - the variant that shouldn't fail is encapsulated in a call
>>>   to the failing variant, with an additional check.
>>>
>>> This prevents uses of the function that are not supposed to
>>> fail from ignoring the return value, thus violating Rule 17.7:
>>> "The value returned by a function having non-void return type shall
>>> be used".
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> I'm afraid I disagree with this kind of bifurcation. No matter what
>> Misra thinks or says, it is normal for return values of functions to
>> not always be relevant to check.
> 
> Hi Jan, I disagree.
> 
> Regardless of MISRA, I really think return values need to be checked.
> Moreover, we decided as a group to honor MISRA Rule 17.7, which requires
> return values to be checked. This patch is a good step forward.

Yet splitting functions isn't the only way to deal with Misra's
requirements, I suppose. After all there are functions where the
return value is purely courtesy for perhaps just one of its callers.

Splitting simply doesn't scale very well, imo.

>> To deal with the Misra rule imo requires to first have an abstract
>> plan of how to handle such globally in the code base. Imo such a plan
>> can't be to introduce perhaps dozens of new wrapper functions like is
>> done here.
> 
> This patch is following the right pattern, one we already follow with
> the _locked suffix.

Right, and - just to mention it - one which I similarly dislike, albeit
to a lesser degree.

Jan

