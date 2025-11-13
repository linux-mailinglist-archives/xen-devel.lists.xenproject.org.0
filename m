Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4EC57B09
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161561.1489485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXTU-0005yP-Fd; Thu, 13 Nov 2025 13:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161561.1489485; Thu, 13 Nov 2025 13:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXTU-0005w3-CU; Thu, 13 Nov 2025 13:34:56 +0000
Received: by outflank-mailman (input) for mailman id 1161561;
 Thu, 13 Nov 2025 13:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXTT-0005vx-DE
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:34:55 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a2a73d-c095-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:34:54 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso1494749a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:34:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81331sm167526166b.9.2025.11.13.05.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:34:53 -0800 (PST)
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
X-Inumbo-ID: 89a2a73d-c095-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763040893; x=1763645693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uKq4UgVnOOWFLmlZJi2DQlKIVT8AVl2MHP/hhnwcH6c=;
        b=b5DuS+cEHJGs90RO2G93/e5MduaiAeOCeiAr1HbKKON3tn0CE2V5dy/pRYFvO5/o+T
         2qyqi2rM1AklSLkOq0Grl8Jgd1bV4KDvzEe07MnrwOuV6+YzdCsyfJO8sVG4w9h4xQ/0
         1N5jZfch0lZneIQZ0ApPIQdX0+Y/yaQUvzgURwvGEjerq9MZMG4LVxmwMT2G2Fc/VlhF
         zxB6IYwiwYUqH0tpPUefAqSG17qphegBAik317mNgrShICQE2kNNNa8crfmjtVqP1mh+
         265WnVgBbIoq2apfTN7+VtQYf1ksk//3vI67I5jXw1svC/xTR65TDPcAYWejCmk+kcEF
         gynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040893; x=1763645693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKq4UgVnOOWFLmlZJi2DQlKIVT8AVl2MHP/hhnwcH6c=;
        b=pQ794ez4xCkYM/HAg86oThSWPNNoui7bCYpHmg/ScEIi+9Iq6MOuejv83lpmJgkRuG
         Zcs22cxAmTFgxksZDCawRjc3zC34VzVMIjfq7bwWyCazk1af5geUdkAwmn2O+sqAOjbG
         x6mliNtdjzR4mZgMSgEIYHURaZAeBgGkvxpY72BMVy2hzkkP5M1v9JqSZLx2yKeG0Z86
         EtBJJvNA3kUUGJ1rgbH9X0X2GyEiLvBQHv0n2ieeOP+FZjz2Jw2Da9D8uRyNXrIDPZmm
         fVVzsvd2dL/UpgHi2WW5tb5OuNVC45Nqk5xo5T7nUvfNtBX8XJFKf0Mp+Y+27a4h2Kat
         bmqg==
X-Gm-Message-State: AOJu0YxnL7OdH6UUKHG2OGkugTo0R1HxdwNXRqzzoROoG1ZGBDk1QGVw
	iNSA/40CqgVa/pO3rPcdX6Fns9vVqW3gu6Ulh2WD6W+ig/1+vCdXvRlNF746GRCJoz/zpMNnhap
	Yll0=
X-Gm-Gg: ASbGncticsJqJMAhCr9TwebxVkMhj0noEZWiFo8EU9Ljq8GLB33sV7YKQ6SjwJDtm5W
	gFGM1qGkzl4Gu6voxc+t9BJ9XIwUcwKgANe0JMbaQOWUQeibDQkTij/P1DfRTr/NXMLjHIq4dFh
	DtMSCFzMAa+FCvRbLFBAuxVw3OudGWHTGmsgzOnFFAPwBrXrKOllb4GbiNeYuT092Qt1Q8q+q1b
	IbU+F6swSJZrcNXcrNUEm0fipHO84ukr2w6QcbkTYq/ApUsB2sMShWEx7W6iSRt0KF7QYzZ81nf
	8epbLmUzBzAmOUEbCHiTnsAtYawr1JvJbEB61a+w27HeDWRvPD2bE0+bJCQFGEDid7or1U3WvGt
	e1WNWGLRs6FPDJDA/2RlbwSS0NtpvX7A1FgsffdMTCiWZEdRHwQ2Kpkm4EVVCDr8vunI2P1ftF5
	tHhY8Hva1wik2IlNg3a83etb/glS4gmo0UjoJppKyFl8J9ZV3l3RJEjyFzqhrrDV9A
X-Google-Smtp-Source: AGHT+IFiOHb7pc4IERYObDAjfqnAIuGdEGJV5wJZlBZtLqmbl2pYmnyO7hNOR/+1/MtWxCLWtBufCA==
X-Received: by 2002:a17:907:809:b0:b73:5b68:a65a with SMTP id a640c23a62f3a-b735b68ad75mr85251466b.53.1763040893495;
        Thu, 13 Nov 2025 05:34:53 -0800 (PST)
Message-ID: <c0ac3598-c070-4b73-9e6a-49385338ea1c@suse.com>
Date: Thu, 13 Nov 2025 14:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] mktarball: Drop double-processing of the archive
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251113130154.220139-1-andrew.cooper3@citrix.com>
 <ce976661-927c-44e0-a478-893242bacba3@suse.com>
 <b0d1b91a-a9fa-48fc-9546-b481c75ee185@citrix.com>
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
In-Reply-To: <b0d1b91a-a9fa-48fc-9546-b481c75ee185@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 14:29, Andrew Cooper wrote:
> On 13/11/2025 1:12 pm, Jan Beulich wrote:
>> On 13.11.2025 14:01, Andrew Cooper wrote:
>>> This is a partial backport of commit 63ebd0e9649e ("releases: use newer
>>> compression methods for tarballs"), but keeping gz as the only compression
>>> method.
>>>
>>> In addition to efficiency, this causes the tarball to use root/root ownership,
>>> rather than leak whomever produced the tarball.
>> I don't understand this part. Isn't the ownership whatever "git archive" reports?
> 
> This is fixing the issue you noticed about internal ownership:
> 
> xen.org.cvs/oss-xen/release$ tar tf 4.20.1/xen-4.20.1.tar.gz --verbose | head
> drwxrwxr-x andrew/andrew     0 2025-07-10 12:28 xen-4.20.1/
> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/
> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/workflows/
> -rw-rw-r-- andrew/andrew  1362 2025-07-09 14:57 xen-4.20.1/.github/workflows/coverity.yml
> -rw-rw-r-- andrew/andrew    96 2025-07-09 14:57 xen-4.20.1/.gitarchive-info
> -rw-rw-r-- andrew/andrew  9668 2025-07-09 14:57 xen-4.20.1/Makefile
> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/
> -rw-rw-r-- andrew/andrew 24220 2025-07-09 14:57 xen-4.20.1/stubdom/Makefile
> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/grub/
> -rw-rw-r-- andrew/andrew  2252 2025-07-09 14:57 xen-4.20.1/stubdom/grub/Makefile
> 
> xen.org.cvs/oss-xen/release$ tar tf 4.20.2/xen-4.20.2.tar.gz --verbose | head
> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/
> -rw-rw-r-- root/root      4781 2025-11-13 09:51 xen-4.20.2/.cirrus.yml
> -rw-rw-r-- root/root        97 2025-11-13 09:51 xen-4.20.2/.gitarchive-info
> -rw-rw-r-- root/root        30 2025-11-13 09:51 xen-4.20.2/.gitattributes
> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/
> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/workflows/
> -rw-rw-r-- root/root      1362 2025-11-13 09:51 xen-4.20.2/.github/workflows/coverity.yml
> -rw-rw-r-- root/root      7035 2025-11-13 09:51 xen-4.20.2/.gitignore
> -rw-rw-r-- root/root       798 2025-11-13 09:51 xen-4.20.2/.gitlab-ci.yml
> -rw-rw-r-- root/root     15298 2025-11-13 09:51 xen-4.20.2/CHANGELOG.md

I guess my reply was ambiguous. I did understand that's the effect, but I
wasn't able to tell why such a difference would result. It's all "git
archive", before and after the change.

>> I have to admit though ...
>>
>>> --- a/tools/misc/mktarball
>>> +++ b/tools/misc/mktarball
>>> @@ -5,14 +5,6 @@
>>>  # Takes 2 arguments, the path to the dist directory and the version
>>>  set -ex
>>>  
>>> -function git_archive_into {
>>> -    mkdir -p "$2"
>>> -
>>> -    git --git-dir="$1"/.git \
>>> -	archive --format=tar HEAD | \
>>> -	tar Cxf "$2" -
>> ... that I'm unaware of what the C here does. It can't be the same as -C, and the
>> --help output of the GNU tar that I checked doesn't mention anything else at all.
> 
> It is -C.  tar has dreadful cmdline syntax.
> 
> An equivalent would be tar -C "$2" xf -

Oh, wow. I would never have thought of writing that as Cxf.

Jan

