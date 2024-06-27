Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299591A0EC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 09:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749769.1158016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMjxf-0001pO-5h; Thu, 27 Jun 2024 07:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749769.1158016; Thu, 27 Jun 2024 07:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMjxf-0001n7-1c; Thu, 27 Jun 2024 07:54:31 +0000
Received: by outflank-mailman (input) for mailman id 749769;
 Thu, 27 Jun 2024 07:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMjxe-0001n1-3z
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 07:54:30 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a7b22e0-345a-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 09:54:27 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so103647471fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 00:54:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706b4a5f092sm697851b3a.216.2024.06.27.00.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 00:54:24 -0700 (PDT)
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
X-Inumbo-ID: 7a7b22e0-345a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719474867; x=1720079667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mVZUtLX7JH3kU2b7tx85MQQKJNWZyidZC6o0PtxL5Vs=;
        b=GKc04gserlWnxWPNFBU5Vj0RtmbWUsWYAWtEWRIHukc0EZsUicFgB/UL1HqTEchIp3
         WFSQ237lSGnYyQuVhnD/qtqMNU6qSWHw0cMAUtESskYzOu4+DtCVKzS0SIupYDBnFouu
         YOdCUa1adqfrovrQ/3vOlFz281SsIZFfV5SvpMMOFo9NwhaHDomqYeiO/27I0PfvC4c6
         SNXpxQQ3dxWdYTQr9adbI09QQ02WIz5Sjb8pLcO/mBZX0g+fL1iNqki90DBUU+g15wbW
         kO4GxbYXlLwSHkvbmq9lqNQIdEAy0PAsT3IlqtMXW0JFGKYG2CQIKEPBN1/N/CVP6ZEV
         Cz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719474867; x=1720079667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVZUtLX7JH3kU2b7tx85MQQKJNWZyidZC6o0PtxL5Vs=;
        b=K887j6LzGQuVS3xgdLQtFBV6/3/MgEvVshoN6LdWM40tqiQkXViDFiaL8t1Vt0SINf
         F11tn/JaXhpSkCy0FmnPtiNm9i5XXgeKtnMiDhTUQZb/Lv+Ph3GADiRwb3sLGjl7kkvr
         mdUc7va5MNju1loONiALY8m++6kYIQYZ9DXFtphe07yLSm4KvecXhthyugXt2OTkHf9i
         Zf0Mi+gv2xAsZKHmW3XxyCy5z40V5pNwnHwzs3rKSwz5Lwk9x9lL5uuIujeVbxPJZuHF
         mwGiSEi5UWVOv9GYQ2Uwiy5ql2JhYLRRGNxNzhq0hiV7VCYiI0uPTHS6YcBXY0iS5AeC
         B9AQ==
X-Gm-Message-State: AOJu0YxVHrvLfGpwwmujnFJKeQGAQU5eG+899C1D7F4pbnDvQ3TI1Af7
	Kmu33bjs2+3g2W6Qg9hm5gb5rptsOxq82IYmQv9SBWlxHaWQq7j+f6AWf3uVdA==
X-Google-Smtp-Source: AGHT+IGMwLc4xLqfDUwuHCeqYG5ZYnWiXofyxKBroq+RD3PN3/dyPnYHVbMWvk/VZ1jmKXDGspdSQQ==
X-Received: by 2002:a2e:b173:0:b0:2ec:5945:62e9 with SMTP id 38308e7fff4ca-2ee4645fff7mr23363531fa.32.1719474865404;
        Thu, 27 Jun 2024 00:54:25 -0700 (PDT)
Message-ID: <bbf362e7-f7ec-4600-9067-0324f048e1f2@suse.com>
Date: Thu, 27 Jun 2024 09:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
 <88127f41-a3e3-4d05-b9f2-3e4117bf1503@suse.com>
 <9814c00d116f14a1ce238b131b9eba19fa130986.camel@gmail.com>
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
In-Reply-To: <9814c00d116f14a1ce238b131b9eba19fa130986.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 19:42, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-06-25 at 08:39 +0200, Jan Beulich wrote:
>> On 25.06.2024 02:47, Stefano Stabellini wrote:
>>> I would like to ask for a release-ack as the patch series makes
>>> very few
>>> changes outside of the static analysis configuration. The few
>>> changes to
>>> the Xen code are very limited, straightforward and makes the code
>>> better, see patch #3 and #5.
>>
>> While continuing to touch automation/ may be okay, I really think
>> time has
>> passed for further Misra changes in 4.19, unless they're fixing
>> actual bugs
>> of course. Just my personal view though ...
> I am not quite sure I understand the concern. From my perspective, the
> patch series addresses several MISRA violations without introducing any
> functional changes. It seems safe to incorporate these MISRA changes
> even at this stage of the release.

It's your call in the end. Seeing we're not even at RC1 yet (which I had
long expected us to be past), perhaps I'm overly concerned.

Jan

