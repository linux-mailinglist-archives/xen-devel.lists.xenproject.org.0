Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADD186C191
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 08:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686854.1069395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaRs-0005i3-RU; Thu, 29 Feb 2024 07:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686854.1069395; Thu, 29 Feb 2024 07:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfaRs-0005fu-O6; Thu, 29 Feb 2024 07:03:20 +0000
Received: by outflank-mailman (input) for mailman id 686854;
 Thu, 29 Feb 2024 07:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfaRq-0005fm-VG
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 07:03:18 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d45939a-d6d0-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 08:03:17 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so963416a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 23:03:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056402164c00b005667516866dsm321384edx.33.2024.02.28.23.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 23:03:16 -0800 (PST)
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
X-Inumbo-ID: 9d45939a-d6d0-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709190197; x=1709794997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcIUT9y/WAluqHtUy+fvfzc42TETOeVyLkUfy04xi6Q=;
        b=UPzAimFsgzhW1jbhrO2U+9id/yP6u8RSfDPB7t6NtGuZBi+W39KDzXXwMZ3eNTbiD2
         G/7KDV2JEuyQFbbaXSCSj5MnlXiT2CdeJY8J6OzIaMYsDiVg881J4YIQWxMK4+gSLqr3
         BJYasbnz0FAHsyt/2vxXbPqWrp1HHBKHHssIktpRWBGHAK6qGv4nW4C8ejZJOTbZD8nb
         Q7EiZsC+tY4oBok+vKuPjnUlU0b1FVLnjHhEZNY7gFckjC3qAM5uZ2S8I6DjidA5HPLV
         D+nbzvTOugV+WpqEahKyWJBL6JGOS8hvf9H7NqbXWfSJpXoztHp7tssmmtNJ/QaYZwCx
         roKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709190197; x=1709794997;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcIUT9y/WAluqHtUy+fvfzc42TETOeVyLkUfy04xi6Q=;
        b=D+9b3XfN+TIE//ln1RE7YY6zldHGjSUDe8T/DMxtPnmSGS1ufFWJPXuWhKRM0YEUsf
         QhmGETWyVYJ4OZtn2pjdLHZ+9C2OJs9J6jR51TDlkZUWUykvgfR6WiyfSitDBqVZwmZI
         myba9Tl8SFpaLCVWLe+2y75htitqHGXKvuAiFWbzhJo4PQh1cXIk8hYnFgVMnEitBwuC
         oZxEuFtOVgAoss5yWsMeACf8OJo/ckobLkirZuewsOg6j4tugHnOLy8td8y5ysBdmMDl
         UA53+8OH+X9nsj2yVwMWqRrE54ysfhYjevjofnG91QWYiJhVaEDFCBezZimUy0MaaZ4R
         wHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXyt59EKMvnrTUZpCP7Wzn4xTuF6H+e5CEEOyOY1Pu/0psb9w5MyjoeQQhqrwjduzk2ytDiCdhghAKvRjjJ/G9blUdJn+Zzz+ZK8Q2FJw=
X-Gm-Message-State: AOJu0YxK8kINaPIhuiJysFEqmkbop2MpLhd9RasPM9/8AoUzrORigNf7
	ztHP5RcUOY7433+nHBb+h7KcE4m95rJTPCjjHmEkiQowXnI+9Ygt6OgF2ANKyA==
X-Google-Smtp-Source: AGHT+IFsBMNtwxkE5x7L8PMc+f5Fod468HKv26dQEXHBijGuPM8Pm2OTsvBTIglOvJbntJEQrdHiMw==
X-Received: by 2002:a50:cc08:0:b0:566:13f8:bcc with SMTP id m8-20020a50cc08000000b0056613f80bccmr761373edi.0.1709190197024;
        Wed, 28 Feb 2024 23:03:17 -0800 (PST)
Message-ID: <00881c6e-22a5-4283-b071-a9b92fbaf89a@suse.com>
Date: Thu, 29 Feb 2024 08:03:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <1f251f2e-91de-4f81-a93c-dcb95746d2e5@xen.org>
 <5a4e8583-7747-4f24-94f0-d040dabb5b04@suse.com>
 <521a4d3b-8ef1-4449-97bd-1a3d3e0e35ec@xen.org>
 <alpine.DEB.2.22.394.2402281445450.575685@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402281445450.575685@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 23:45, Stefano Stabellini wrote:
> On Wed, 28 Feb 2024, Julien Grall wrote:
>> On 28/02/2024 12:58, Jan Beulich wrote:
>>> On 28.02.2024 12:50, Julien Grall wrote:
>>>> On 27/02/2024 13:19, Jan Beulich wrote:
>>>>> the release is due in two to three weeks. Please point out backports you
>>>>> find
>>>>> missing from the respective staging branch, but which you consider
>>>>> relevant.
>>>>
>>>> For Arm:
>>>>
>>>> e11f576650 ("xen/arm: Fix UBSAN failure in start_xen()")
>>>
>>> Which I assume you or Stefano will take care of?
>>
>> I was expecting Stefano would do it as he did the backports in the past.

Was it deliberate that you did not also put it on the 4.17 branch?

Jan

