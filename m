Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED9D989EAD
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 11:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807163.1218435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svCxN-0001TV-8d; Mon, 30 Sep 2024 09:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807163.1218435; Mon, 30 Sep 2024 09:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svCxN-0001Qd-5T; Mon, 30 Sep 2024 09:44:41 +0000
Received: by outflank-mailman (input) for mailman id 807163;
 Mon, 30 Sep 2024 09:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svCxL-0001QX-4l
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 09:44:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b04a035-7f10-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 11:44:37 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso642921566b.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 02:44:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2978b0csm514688066b.146.2024.09.30.02.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 02:44:35 -0700 (PDT)
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
X-Inumbo-ID: 9b04a035-7f10-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727689476; x=1728294276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1iVbAJsl2AA2a4KL9ExSW4mkm3OwoQX/Nv5rvQskHIc=;
        b=fiQmO8pfzfKsgTabU3MIDZ3nLh6Q8g3I1fOCCLUYJqozTp6b9I9WRr2Hm2K2QXQFJS
         2SYF1WHt8zN28VAc0wcyDFpg9BQ4jE7QjEd5E09cVwDrueEfekqiMivz+FgbDuUedBtE
         UotX3Zr2verX+rU0sL8Z53PQAMlBNUh/5tP5OKwX/Bo0UTeqfRVnACqcINdRUHWZ+DJE
         pjpUPgRRo9SCFfVNQv/913z6g8XM4SPSqGzE/GPK52GBt+gGS+1dyQqtk38ph3MFgoJ2
         s2GKtSU5WCO7udpHl67flGYSPpgm1giy6wgBdo1W8IpHHbLBsrfAXLC/yLUlrn0m8Hl+
         IZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727689476; x=1728294276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iVbAJsl2AA2a4KL9ExSW4mkm3OwoQX/Nv5rvQskHIc=;
        b=ai9kgSvM2wDlEz7Fw49A85NX0qKj8qoA5b3HA1gsY/icbdExSFScqXq7GXI5kjV3wo
         4jICbvGpAKmxqlECX99nPf0XskS1XYfDA4ADa1HdmXBdDGakbHc+JLV2Ty192PhzVIoS
         wBUHWm8kzmsAWf+CxlkbnUUo4SZPNIRKMkC0jsobNmF8VohYa+uUR2OrHz97/d/kUmjr
         pbijO/aQG1yoWt4u1U3nRcKTvTglkuRAGQ7RQKAgnSbklOwaGqJ1tuScBjwOMfiFqNFr
         5qfi0J+vK5X5Sy3hOvFy8WQFG7CJlAHhg+W/N3mytnLxMKjDr1nzlZAXEilMhjAbTSV7
         cApA==
X-Forwarded-Encrypted: i=1; AJvYcCUC0KSz53A7hnkB0HU9Act9XhG1glgwQzjk3QXlMY70DX5mNk+Dokv3Lb44O8EtW14+J7j46aG9uXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpIKZupSzbH5JRmZz5sW5XPPM6Z56yxhTJnfV4Ssp07qGhKK9j
	7hi9JbfOU5135ch/tSxPVbxIFgza0uCJOS7P9ajel4tTh0Y8kJ/UKcd3R8uTJA==
X-Google-Smtp-Source: AGHT+IGLj4gIo3m/vZtJNE52CajIVAMfygN2zz5/VjmddtdKVQaaLZ9ttY1fK1LpkPME4f0TMenolg==
X-Received: by 2002:a17:907:3e9f:b0:a8d:4e13:55f9 with SMTP id a640c23a62f3a-a93c4919a9dmr1277594166b.19.1727689476340;
        Mon, 30 Sep 2024 02:44:36 -0700 (PDT)
Message-ID: <276e0680-c63e-4e92-8bd4-2bfc7491e881@suse.com>
Date: Mon, 30 Sep 2024 11:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com>
 <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
 <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
 <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com>
 <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop>
 <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
 <CACHz=Zg7_h8Aqpf2=Gwnec5+TnoxoERa=VZNaQ4F=t+1WKjOKg@mail.gmail.com>
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
In-Reply-To: <CACHz=Zg7_h8Aqpf2=Gwnec5+TnoxoERa=VZNaQ4F=t+1WKjOKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.09.2024 11:12, Frediano Ziglio wrote:
> On Mon, Sep 30, 2024 at 9:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.09.2024 03:13, Stefano Stabellini wrote:
>>> Hi Jan, we have gone back and forth on this a few times, but neither
>>> Alessandro nor I fully understand your perspective. To help streamline
>>> the process and save time for everyone, I suggest you provide an example
>>> of the rules written in the style you believe is appropriate. Once you
>>> set the initial direction, Alessandro and I can continue and complete
>>> the rest in that preferred style.
>>
>> Header inclusion guards
>> -----------------------
>>
>> Unless otherwise specified, all header files should include proper
>> guards to prevent multiple inclusions. The following naming conventions
>> apply:
>>
>> - Guard names are derived from directory path underneath xen/ and the
>>   actual file name.  Path components are separated by double underscores.
>>   Alphabetic characters are converted to upper case.  Non-alphanumeric
>>   characters are replaced by single underscores.
> 
> Possibly there should be no cases; but about "Non-alphanumeric
> characters are replaced by single underscores" are we talking about
> sequences or single entities? I would say sequences so
> "Non-alphanumeric character sequences are replaced by single
> underscores".
> For instance "foo--bar.h" -> "FOO_BAR_H" and not "foo--bar.h" -> "FOO__BAR_H".

I think such files shouldn't be created in the first place. No matter
whether you replace by a single underscore or a sequence thereof,
ambiguities will arise.

> Another maybe not supported case is no ASCII characters in name. As
> far as I can see they are not supported. Is it written somewhere?

Yet more absurd names, imo, which even more so shouldn't be allowed in.

Jan

