Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC248B1E93
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 11:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711977.1112345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvqa-0005OP-Se; Thu, 25 Apr 2024 09:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711977.1112345; Thu, 25 Apr 2024 09:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvqa-0005MV-Q1; Thu, 25 Apr 2024 09:56:56 +0000
Received: by outflank-mailman (input) for mailman id 711977;
 Thu, 25 Apr 2024 09:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzvqY-0005LN-Or
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 09:56:54 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 251a663e-02ea-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 11:56:54 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2dde561f852so8345011fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 02:56:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm30713845wmq.34.2024.04.25.02.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 02:56:53 -0700 (PDT)
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
X-Inumbo-ID: 251a663e-02ea-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714039013; x=1714643813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YvEExoEZ7WjqPfjzgclTNClMgatEXlrRXHmHN6ajXZ8=;
        b=gLjofVfenVRLph/pB7Wt2NfohrN9xOAaLNw/AJtEq6tB/qpnOxMHxui0JJlQCVeSTk
         4c8OEulhWdRapa6nOCYkr2RFKAIIPE/52N+MYsSDfgFDnGViIfBSzXWs4XtHbQUQBtN3
         ixdCMFkxyzbBed4kxlzbSsG1I8TGeQ8LucXbGxvaecjlFYbNcp9PIxIUkN2T9THxX8fP
         xlEqIOdqloPZ9/TDIUVROoERIYt6vgKuHHa5Q2oFZWzOKHo+WX93H1/rRuoQCRb6D0O7
         HxIE2IfewDHaaKVae5Mfhl9kylIoEgXjUYH8CmQbs8IPF4AP+TUr87fkCjyOQOS04TRi
         w/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714039013; x=1714643813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvEExoEZ7WjqPfjzgclTNClMgatEXlrRXHmHN6ajXZ8=;
        b=pjMKpmSI/9/DUIGPsY61fKtpGLBDuZLA491Fa1AHuwXQaiUJMX8LmGDRm3DCw7FnXO
         ipC9TIho2JeRagofbDJRgMQjteOiIbeQDhXlwE817j2wLyff8WWp3cN6bTtsNztjUJzE
         XuzivExkMuubguwzxulaapnD92yMIapyjgd99BulCfeb65TQ8KjQg9ZZTcWCSbt6mSMc
         icTncSKMzoKmr14PemnizTBGuAIQ7jXq2rOnz0yxRELa5JnLeDs+zNIF6wTI6cpKH/Fi
         CjDLCPXV6Q60oikooLFpUYxYVn4JGGc9nAKYI0IHgNDSnwIoprfCqDPPDJ6mImsuueQt
         SU6A==
X-Forwarded-Encrypted: i=1; AJvYcCXvt8zT8pgLnQexBq2qylrjvwKVAzPE+boxpw1x9jN5uOk4NBruHjfyJnuLCquAA/Zu0AOxcxzOVz+CsYb7S+Rypev1SDXIXGbxQ9ykvkw=
X-Gm-Message-State: AOJu0YwFXQB3bu/TP1UCfZ3bUklhKhALuQTkbhDEDclHOQfuHoKzaQi2
	GZXBxEbJEGjUzGexX0oGh4tMktdJT3h0YtBVgTFg6VHR+HUgoene/UyGSyAuwA==
X-Google-Smtp-Source: AGHT+IF9bifCXu96PatSbcAJSxhEahTtchdtYpOaqMoLiG4NRbNnhfXVw1kkNELS1rHso8b2oMjiPw==
X-Received: by 2002:a05:6512:517:b0:516:9eba:8f2b with SMTP id o23-20020a056512051700b005169eba8f2bmr3763479lfb.12.1714039013616;
        Thu, 25 Apr 2024 02:56:53 -0700 (PDT)
Message-ID: <f4d4ecd4-1410-4446-883a-4a77d4274ad5@suse.com>
Date: Thu, 25 Apr 2024 11:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tools/xl: Add max_altp2m parameter
Content-Language: en-US
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1713990376.git.w1benny@gmail.com>
 <67b5dd52435132d0fb65e7b301970e17e092fa87.1713990376.git.w1benny@gmail.com>
 <9bb611ac-1187-4daa-9649-53afeeb11695@suse.com>
 <CAKBKdXjs2DRD=kQ3dxfaHjSgghbLH-HgvxUkAC++N2_zPArZXA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjs2DRD=kQ3dxfaHjSgghbLH-HgvxUkAC++N2_zPArZXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2024 10:51, Petr Beneš wrote:
> On Thu, Apr 25, 2024 at 8:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.04.2024 22:42, Petr Beneš wrote:
>>> Introduce a new max_altp2m parameter to control the maximum number of altp2m
>>> views a domain can use. By default, if max_altp2m is unspecified and altp2m is
>>> enabled, the value is set to 10, reflecting the legacy behavior.
>>
>> Apart from the public header you don't even touch hypervisor code here. What
>> you say above therefore is limited in scope to the tool stack. I question
>> though that adding a new field without respecting it constitutes an overall
>> consistent change. In particular I'm curious how you mean to deal with this
>> for other than x86, where altp2m as a concept doesn't exist (yet).
>>
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
>>>       */
>>>      uint32_t max_vcpus;
>>>      uint32_t max_evtchn_port;
>>> +    uint32_t max_altp2m;
>>>      int32_t max_grant_frames;
>>>      int32_t max_maptrack_frames;
>>
>> Such a struct layout change needs to be accompanied by an interface version
>> bump (which hasn't happened so far in this release cycle, afaics).
> 
> So I should not include domctl.h changes in this commit and instead
> edit the commit message that it's merely a preparation for the
> following commit.
> Then, move the xen_domctl_createdomain field creation to the commit
> with the hypervisor changes (+ include interface version bump) and
> then create an additional commit that ties xl and xen together.
> 
> Do I understand it correctly?

That's one way of approaching it, yes.

Jan

