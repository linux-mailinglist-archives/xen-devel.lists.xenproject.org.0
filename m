Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D13AB37FC
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981426.1367819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESlc-0005TE-01; Mon, 12 May 2025 13:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981426.1367819; Mon, 12 May 2025 13:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESlb-0005QW-TK; Mon, 12 May 2025 13:00:23 +0000
Received: by outflank-mailman (input) for mailman id 981426;
 Mon, 12 May 2025 13:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uESla-0005QQ-Fr
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:00:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f478981-2f31-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 15:00:20 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso815163866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:00:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd4d3sm612394466b.132.2025.05.12.06.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:00:19 -0700 (PDT)
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
X-Inumbo-ID: 0f478981-2f31-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747054820; x=1747659620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jo9IgKAX9RI6Gt2JpUdnx0f6/WDvpERGqs2A7RSta38=;
        b=Xy9Zekh440WoUNY0fTbkGimXitueHB8azHOoPlmjOgB73AotAmb/g8OXoTzrzzuqLs
         8cd2EhEFOf9c4d68nEAYGHhD7201+cFe+iVj2Vi3lg9ME4gVj8QxGjI33xxRvsrkqXNx
         12G7jrPdrTYXBBgyOlHaz7gMR5CIrnn3mWxv4iV+OYN/2UWdY3mFFNqLagYhT/FP4Pl7
         PG+ZM77uelXeymw07Vgd7WMqmGIPGTVcOZlxfrCv0WyMmIMUT4UqEx4wiQYc8vNSAoyx
         Mi3vrtNGmdY5u3Dy0eNN4Ui9qm8oBUWxF+r8BU5fB8ZHncQhJe9TuSq+Y01gEBDzz1lv
         Q0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747054820; x=1747659620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo9IgKAX9RI6Gt2JpUdnx0f6/WDvpERGqs2A7RSta38=;
        b=M2rZkptOfEGkt48ldIn7jiufzuSGtkI0QZvOrchrfh/8n27iCW3Ho3jlMPe3C2zu9z
         4wCe7bq0w04FhuP3XBUpNpDrtKhvGD5wrPOGt2vMfLVOkfFQpF/bDvs5XTsrVUCfG+BQ
         0t1iBaE3CawpBm4/BrjlUVjEmPtD0ZFtvCyFsUOdI3gxSynsPF2TtkAYFwVB5GoLaG/E
         +AiMoVNH/OAXyxpGfFicrUYlKs8o5PfagMXhVgdYl4HXdBqB9lxokZOjPwcOVKj++x5T
         h5HQPgj8MjnoP9RZAYb4dJlShVv2Yoe964/RyvJkZagKX44bmUGc18smcukeXZRx2cqs
         QAow==
X-Gm-Message-State: AOJu0YzTypgMqflTCSrmrIpeSXHrjBEoEhq1fqukjppkeJS1+xM+efOD
	f7XeRgrl5LUtnGTJUHECYfUBAXdCGShzaQRC76y4zHiDKkUh2sGmavSeHJ18eQ==
X-Gm-Gg: ASbGncuaOtkUHTM9sv4GEfxU8dHIlPgdeJ547MrKcRxmR8pIZDaMNJ5LgUsRvVXstax
	cFQLISdSO/FmornPMKZUydqRU5wXO69wAuwbD5siSWa3evAQ2TC8JGRpgy+6R8cLiOojrRKsjSU
	xyxi4lc+RiTprBRAU+SsbNdDjufZF2B74KLEzWPAM79dvT5RT12EtPd+Rd0B0/2GVWsRhR8DgC0
	x6NV4SDtnMPMClX4z4+1xsgn1b24JvwQNElwJo8w6P22FmNNwOuYMazgtbcomUp9eG05iGVk9oy
	NFr/Uh/VNdRN0Kkd7EGUaW0zVAbraMsEyNgxIfX8koGERm523Py9I4rz/Cy99GaI970cEhUNInK
	GezkxRjPOheleFU4u43/mIttGFtw3pmQw1Ecq
X-Google-Smtp-Source: AGHT+IHU+M4bIUTMYDFmjS/Jo1QWuh2+ZV4wmuVeX0lI22uNsj1iBGXWatJplcZp7A6b4hUuhLh4Lg==
X-Received: by 2002:a17:906:9c8a:b0:ac7:805f:9056 with SMTP id a640c23a62f3a-ad21905690amr1142936466b.32.1747054819968;
        Mon, 12 May 2025 06:00:19 -0700 (PDT)
Message-ID: <35826c2a-4266-49d2-b1b8-1248aac227b5@suse.com>
Date: Mon, 12 May 2025 15:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __auto_type
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250505124646.1569767-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2505051244090.3879245@ubuntu-linux-20-04-desktop>
 <548430a5-fa4a-41d1-b5ba-ba45efa90bbc@suse.com>
 <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
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
In-Reply-To: <7acc83a3-2b15-4557-b293-0832b35e3680@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.05.2025 14:09, Andrew Cooper wrote:
> On 12/05/2025 12:59 pm, Jan Beulich wrote:
>> On 05.05.2025 21:44, Stefano Stabellini wrote:
>>> On Mon, 5 May 2025, Andrew Cooper wrote:
>>>> In macros it is common to declare local variables using typeof(param) in order
>>>> to ensure that side effects are only evaluated once.  A consequence of this is
>>>> double textural expansion of the parameter, which can get out of hand very
>>>> quickly with nested macros.
>>>>
>>>> A GCC extension, __auto_type, is now avaialble in the new toolchain baseline
>>>> and avoids the double textural expansion.
>>> I think this is a good change
>> +1
> 
> That looks like agreement.
> 
> Now for the (new) controversial part.  Since sending this, Linux has
> decided to just #define auto __auto_type for C < 23, in order to start
> writing C23 compatible code from now.  It's more succinct, and has
> better longevity.
> 
> We might want to consider the same, although it will introduce a new
> example of defining a keyword, which we'd have to call out in the
> MISRA/Eclair config.

I'm not outright opposed, as I don't think we use "auto" with its
original semantics, but it feels somewhat odd.

Jan

