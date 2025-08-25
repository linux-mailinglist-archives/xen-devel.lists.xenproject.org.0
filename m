Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55CEB344FD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093345.1448868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYjZ-0000ZU-Mt; Mon, 25 Aug 2025 15:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093345.1448868; Mon, 25 Aug 2025 15:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYjZ-0000Wg-JB; Mon, 25 Aug 2025 15:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1093345;
 Mon, 25 Aug 2025 15:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYjX-0000H7-Vw
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:03:43 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0680799-81c4-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 17:03:42 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-618aea78f23so6475887a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:03:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3174f806sm5171339a12.52.2025.08.25.08.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:03:41 -0700 (PDT)
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
X-Inumbo-ID: b0680799-81c4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756134222; x=1756739022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qyEoTm5YvpNJtiraHV9LxtKc7H2dI5ZUZHzdTXfgO9Y=;
        b=XVgupvcv60MPt6S+x29+P94i+WAsGIksV8dHbvIXRh3VEUrj6V9UukI8//Ics/pJfO
         oSTwk3Rd8ybohfMTuBrkyYLrhE8IFxQCrzcCVSbfCR9Aq3KIFJCyu2JTmBpKvs4lYGW8
         dH6kqFAecoej0ANVYLgJb3rLDmPpMU/oekuS66bcCYkAdsyOrBClUfdV35HKaemkAg3r
         A07uwZJElnhJUXrRG3+7mR8RQPd/atWSmDZLynUo5BZ6lIqyqtMOsJ5tLTmm5euM85b2
         N+SFd01R9XgNUxp6HZsREEIlszEXuQYBDydSR8ll1SZIE8vlpx4c6vylWKXL1wh1pnsE
         1YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134222; x=1756739022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyEoTm5YvpNJtiraHV9LxtKc7H2dI5ZUZHzdTXfgO9Y=;
        b=oHJ1AqcjltUFMhD7ezo5xlDWJVhHCyqnFmF7v77V6Ji5q5tJkjTK2lhZz0BJdII7xR
         OVphAuSAW1uHLW7F+Mp6AW951/6KS5vNO1VysxxSA8zdP9j/HsTtFUHgVaHJKpUGMZwL
         RsVy6uT+n16cdbGWW2xGWX2Ix85m0FdxrfBo75uv4GKB82y+gAlzXTVylvBSGSLha8Kf
         iskwNeQi7HG0TlYsa8CpLhghwf/1RKKsqksf+cRmGoAij1VRRb678T7AEUVEGrWegV1A
         gFfijfTPzlc8JdIDa2cTF0RWz7c7A4Etcrt9avxntHigW1nMkKGyo04vRMhvQUUoO72y
         tgWQ==
X-Gm-Message-State: AOJu0YwVqtOSvwjBOGZ5M9B4+813dXCN7YLhGI/GVSJYwoOZEDIIfqVP
	mrXlxqr3bmdSWjHcEnGV6oDjWSzd7RmaMW17qss+oX6AP+qimo2bZUpiwp0zeO0ECg==
X-Gm-Gg: ASbGncs/6D+yKVGod8Ay5sWjouyA7qnxXt+yWciMIsI2NQ9l55+wKHZvpFSkztheUXf
	/lN0ZtrZ/Pe5MUZBJcl/4UVWe3NTpQP28gEGgAuKrW1Trk0VQMx/wm7VUc9qFZ1FffJiz1f7l2P
	IkqSa4UsHadwfnBbjCoV1wEtq1EdUdEEAjUC/w3fu2t+SyGEqYYJ2rTVV2e6jXGXOhOfDZBJYjB
	m0mkf0e/ufGbLkXuI3JAmdFIySazEzAtFiClJDj/Os7H1Yj2/2eWPUGFcnEEnLlRyKs3osVcOcm
	bt7KK7cXYYPftngPhMqCgjcqZiuQDZJAzmJmJvIH+g5ZtAJUkU2L4oCxPlnNrktSDj7H6JNIgY5
	gEx34FqPa9ysScUsqN1YRHDrIiYEWl/qIEDJ3El/X2QXHrpAZ/idlpqOEKJI5VTLoSSti3YDPVa
	MgQqDJ+Fc=
X-Google-Smtp-Source: AGHT+IGDiPfszjsNbpUWt3Nwl0VOaYS56tEVU4A324uROnvfGex11Q5R42UGHR8iWJDxgpK9+/fOJg==
X-Received: by 2002:a05:6402:35cd:b0:61c:7090:c7de with SMTP id 4fb4d7f45d1cf-61c7090d6b8mr2357674a12.13.1756134221675;
        Mon, 25 Aug 2025 08:03:41 -0700 (PDT)
Message-ID: <844bb7f7-2e56-41e0-b304-77e9e9650eb1@suse.com>
Date: Mon, 25 Aug 2025 17:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
To: Anthony PERARD <anthony@xenproject.org>, dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com> <aKx4FtlhAbXxtZlB@l14>
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
In-Reply-To: <aKx4FtlhAbXxtZlB@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 16:49, Anthony PERARD wrote:
> On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>> index 5362fb0e9a6f..e1d012274eaf 100644
>> --- a/docs/man/xl.cfg.5.pod.in
>> +++ b/docs/man/xl.cfg.5.pod.in
>> @@ -3032,14 +3032,17 @@ the domain was created.
>>  This requires hardware compatibility with the requested version, either
>>  natively or via hardware backwards compatibility support.
>>  
>> -=item B<vuart="uart">
>> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
> 
> This syntax here would inditace that `vuart` takes a list of items. You
> could write instead:
> 
>     vuart="UART"
> 
> which seems more in line with the rest of the man page. Then you can add
> some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
> possible to also have a sublist, like the `tee` option have.

But shouldn't the syntax already now allow for multiple items? Possibly
even multiple ones of the same kind?

Jan

