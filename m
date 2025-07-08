Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69626AFC349
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 08:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036005.1408456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2C8-0007JV-5f; Tue, 08 Jul 2025 06:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036005.1408456; Tue, 08 Jul 2025 06:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2C8-0007Hn-2A; Tue, 08 Jul 2025 06:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1036005;
 Tue, 08 Jul 2025 06:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2C6-0007Hh-PS
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 06:52:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 269d0704-5bc8-11f0-a316-13f23c93f187;
 Tue, 08 Jul 2025 08:52:44 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b45edf2303so3702335f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 23:52:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845c6087sm108298185ad.258.2025.07.07.23.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 23:52:43 -0700 (PDT)
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
X-Inumbo-ID: 269d0704-5bc8-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751957564; x=1752562364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEf8HutLjvV5Hb1wAexHku9NXhF3ZIt0YMGk+B9TtZM=;
        b=C59hUj4flGxEm+Uyp/HILXRfx+s4+J5CZ1r5892pjLnfycjwy7eMe28rpr6x6o4qHk
         bw6LXfKuTrcOfuqTMB8d7qGTbRbhceLnWV9AUekydv1Fpb/kZ1iaf+5YDqAVdlH2Q3zs
         9TmNZbzGc0JJCUxJPyxbVgXZFbz+ywahQGK8eZ3j+jYGUOjJ8O6nYLMrVo3V9HRDN1VR
         W2DJw+qtmQ+c6J/1k7Fq23iWlksP/ewaF4XXSnHG6rV08S/w2p7EaVgt47aDRSvgNPQO
         nn9f16dfVZ+u49tpZ8XBmOKv2yqVXPFL/SFnxT9TUf/7OaceYaenEbfrx11zIdurMMFg
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751957564; x=1752562364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEf8HutLjvV5Hb1wAexHku9NXhF3ZIt0YMGk+B9TtZM=;
        b=sXBYQ7au56PhkFEAWIvHUmOCJzQjRPUnBNZG9EWaeTjfweY2J7O0OzjPdb9DACx33n
         8ups6oRtFd1/RUJdxQDE64T/w5kDCyZbztX/Z3mpP8hZVhyY2fTuPm4ZmqNrkfq2ZAKS
         mtCQCp52K4nBkDtO0Ylb2pLjkoijSHPaD56EIPZzDySPx2xfs1YcIHl+0t1TDfDbSevw
         oCUvwGElEkHSfy4esco2vHIqjSi1afI7qqQlHPef62atqGCsvEoXnpJ8aDAOgj9ipIwu
         g+pzfqRUsVjEL9+Pa8CjjMw1zk7SZVcdbDZ6XtHtEqcigrAqQQj8T3PuKUhHz68zhm9K
         AozA==
X-Forwarded-Encrypted: i=1; AJvYcCWYea9SUrvIt56nO0OKFDoPDeGXsOjLSQ0l/m31Un4zF0ihUWu7M31kJfyLnVhp2unz7biq2bzcYZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmYTcG03oZWYONWsDjfd3GYUyBQCOw16mNyVV12UXSoB5UuVZF
	aFyBRHBgz4ZTZN9ebRWtgCXKeQkO45o+hfVsuF9CM2Dql5fSGUI06UZUUpjz9Rd2ew==
X-Gm-Gg: ASbGncuXuMettMpNcAF0TqzFWZurRX+QEuRCOqVZyGJzTo/otU8Z2e2pji+uhDe4UAD
	6+CY/Jhb5qnwGaPVk5ZZoa0Y+ACViAa50dsxx4BwuN+lWJPHRcR67VaIasIwK/POEvPW3n339xv
	9jwVuR4UEu1orfSZypbGeUqQ52JGIZAP/wNerUTanvoGwrMXuah3nj1j3vGym9ieMjbf3Y6iQ4Y
	x+zBExfqXsbjeNtkelozJ+T3wSDo5F2Igb1y2wSbN6O/Fs51WdEMrJ7ZkSNLMNU5NjWoTsNrGml
	ZcOqKBJR27YCWwkYxmcsn4utXKtltHEVYsaAPRUKLKyueedAEIo4rVZyBXvXT/cGd5kLqWpKYNM
	RCQsP6Yjhm2kQQabE3uFVpdvOT2GbJhAZUX9nnohIWFAzFsA=
X-Google-Smtp-Source: AGHT+IHvlBFwvL9CvHRneqejhdgZHkgEmo1ww4LYiRvyVxTsmQaN0SdyTjHrjfWnkRsMpznOw1RMXw==
X-Received: by 2002:a05:6000:218a:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b5dde59bfemr1038170f8f.1.1751957564313;
        Mon, 07 Jul 2025 23:52:44 -0700 (PDT)
Message-ID: <05229135-00ef-4e8b-bb2d-fe9022a5023b@suse.com>
Date: Tue, 8 Jul 2025 08:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource
 Table definitions
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
 <24c11542-0490-4fdc-bda8-01a5b3770856@suse.com> <aGqqisydEetf5mJ_@MjU3Nj>
 <faaa96f7-918e-4130-bde4-bb17194e1c25@suse.com> <aGwEZfKKXwO4ZYOe@MjU3Nj>
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
In-Reply-To: <aGwEZfKKXwO4ZYOe@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 19:31, Sergii Dmytruk wrote:
> On Mon, Jul 07, 2025 at 10:29:46AM +0200, Jan Beulich wrote:
>>>> ... then isn't used right here, instead requiring a cast somewhere (presumably,
>>>> as code using this isn't visible in this patch).
>>>
>>> As was mentioned earlier: because size of a pointer between Xen and a
>>> bootloader doesn't necessarily match.  What you're proposing can break
>>> under certain conditions.
>>
>> But the header isn't shared with a bootloader's code base. It's private to
>> Xen.
> 
> Yes, but sources of Xen be compiled with different size of a pointer
> which messes up the interpretation of the data.  I tried using
> BUILD_BUG_ON() to enforce the pointer is 64-bit and early code stopped
> compiling.  The structures must not vary like that.

Hmm. Does early code actually need to have this struct exposed to it?

Jan

