Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4B3C24D51
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 12:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154203.1484298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnbp-0007gk-D2; Fri, 31 Oct 2025 11:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154203.1484298; Fri, 31 Oct 2025 11:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnbp-0007dn-9q; Fri, 31 Oct 2025 11:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1154203;
 Fri, 31 Oct 2025 11:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEnbo-0007dh-3B
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 11:47:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f6dac43-b64f-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 12:47:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so17235975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Oct 2025 04:47:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a96897sm90865675e9.11.2025.10.31.04.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 04:47:53 -0700 (PDT)
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
X-Inumbo-ID: 6f6dac43-b64f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761911273; x=1762516073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsRHN3UXXxYTcMMsTbcLOVn+1rcAHjuOv6n1k5sias4=;
        b=csBTBENIS9ZkhgtIJiiCjBeALggEQOxy7Gl5/XJBhyT7bmYNT5AqIOsR5S+5UyT0ci
         p7RZSNJTD/OpWrW8C1sXhC+qTe4TIGL540PkodbFR5UjgKYALl6VZE5n1MPG5kIX+cis
         d492p7tfre0hJlNf78+0dgFAuxU6lJMqQ/SVlX/Pj3oD6NanNm3nhNWT9bBbJLygsgM4
         fxsPfe/AFfZT+dtjjPvgtpLIpng5nr9KJI0TIBJiNK3xpLbpwhXl3BwxglWZQ51Hwxoe
         hx12iklxsP4VuBwrYmQw/aAduSRTQ+T9MCFEiZDmlFQ1C3+JcwjQe82KzEi9zNUaJQMl
         8Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911273; x=1762516073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsRHN3UXXxYTcMMsTbcLOVn+1rcAHjuOv6n1k5sias4=;
        b=flnFXxm3PxIvPsPMqDTiktiyvsoBN+GgwxxgAgJN403iIcLZ/VjqdvLunxjIgZbS9R
         VoeIpYoKSzOZVsS3EECFjTyPK1/7bJsBIVJf+Zh5HyQGijYBvczqoL962JlNuWLYHMf3
         4ARv7uBLdF+zRFDL3zmgTtVDirkWIsTb5L/F7j8JFZ47iq6TRYVSWalyhi2aXsQnq/x0
         4Q3nV84WwaBn9kQgeXoOJzdt2A5g0PUgP1FdFF+XwcU4tkmyiRkKMFRxWBuzx1DPbDZk
         tSaL+Bj1eiCPLmMjVBEEmTmpRHgIAF+rPKOYU8yUGA/DQw45BM4lvbtWN6ddO6876x+R
         GRlQ==
X-Gm-Message-State: AOJu0Yy4Q2A+uzLfF8laMf0qQn+GJOQsbN9g1+BrFqvyzYY8GDZgvbxM
	ln6K9m0eGSQANz8nJOg4cqTjjx7ZTEZVWd3QhaVbWOkYy1fJ072s4bibmCmX3FlG4Q==
X-Gm-Gg: ASbGncv4BPbL5BFtEz+RY1ULu/3cBVfEv88Ey4imY1pO9ZaGASXomEQi6QcD0MNKr50
	RQIE1rAGU7t9w7RExQT/FYGEML1bpH88PYPH8GnpvpoZD0MYQkKy1v9X1kSA3osAw7uob11MAyu
	3/JuesrR2Xd68O19HomFcDzWppjb8BXGBekjqVncKWRd9DzgYsmb674v1SAd4/IcVbCRJZWpvo3
	/Mt7oDl5WTSx5DNjXc1xBPx4dWYJRL/IOaVGO3n+HLblbXLiQu8LGYTUCuH1xFGLXKTFSgCUThd
	eLIiGrxB/aN1HltWuJrN1Do4JVHlO3Eh5rVknjqhpxBgiqtNRRNJFV/yIqmMenM6/EvIREHSpnY
	juv3HmWsbLG+gpjmCykeN8sdRsm713CrSwTM1mdZHSRqJO7Lh7iN5u/YupLeDgoY49VB+jssevh
	oUgsEzowiMuvQGz/RR2Qof4vDL6r9ee7uZtpO1Vts3eofpspx8TrqS/Q75bnnX5biBcrJJtzA=
X-Google-Smtp-Source: AGHT+IH3MLjxhs32GE+ceKTPuzzCpSYrh3sRzV9P49X4wpWVPK/1obm1EtnnfmlDvyR7SkUBzjsk1g==
X-Received: by 2002:a05:600c:3486:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-477308c01cbmr33142635e9.32.1761911273256;
        Fri, 31 Oct 2025 04:47:53 -0700 (PDT)
Message-ID: <b7293f69-d9f8-4669-a1fd-eaa468445d68@suse.com>
Date: Fri, 31 Oct 2025 12:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 0/2] x86/AMD: deal with RDSEED issues
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <272093dc-c97c-434a-9977-ad1c26e7e229@suse.com>
 <aQSN3MKxAa_cltld@Mac.lan> <68e28e41-e835-4985-80a3-6a99b3d7dc3e@suse.com>
 <aQSVTjh5xiib-u5D@Mac.lan>
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
In-Reply-To: <aQSVTjh5xiib-u5D@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.10.2025 11:54, Roger Pau Monné wrote:
> On Fri, Oct 31, 2025 at 11:29:44AM +0100, Jan Beulich wrote:
>> On 31.10.2025 11:22, Roger Pau Monné wrote:
>>> On Tue, Oct 28, 2025 at 04:32:17PM +0100, Jan Beulich wrote:
>>>> Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
>>>> place.
>>>>
>>>> 1: disable RDSEED on Fam17 model 47 stepping 0
>>>> 2: disable RDSEED on most of Zen5
>>>
>>> For both patches: don't we need to set the feature in the max policy
>>> to allow for incoming migrations of guests that have already seen the
>>> feature?
>>
>> No, such guests should not run on affected hosts (unless overrides are in place),
>> or else they'd face sudden malfunction of RDSEED. If an override was in place on
>> the source host, an override will also need to be put in place on the destination
>> one.
> 
> But they may be malfunctioning before already, if started on a
> vulnerable hosts without this fix and having seen RDSEED?

Yes. But there could also be ones coming from good hosts. Imo ...

> IMO after this fix is applied you should do pool leveling, at which
> point RDSEED shouldn't be advertised anymore.  Having the feature in
> the max policy allows to evacuate running guests while updating the
> pool.  Otherwise those existing guests would be stuck to run on
> non-updated hosts.

... we need to err on the side of caution.

Jan

