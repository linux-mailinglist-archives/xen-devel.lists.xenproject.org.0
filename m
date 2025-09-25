Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2C8B9D7E2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 07:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129861.1469575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1epT-0003IA-Dw; Thu, 25 Sep 2025 05:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129861.1469575; Thu, 25 Sep 2025 05:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1epT-0003G1-BF; Thu, 25 Sep 2025 05:47:43 +0000
Received: by outflank-mailman (input) for mailman id 1129861;
 Thu, 25 Sep 2025 05:47:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1epS-0003Fv-74
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 05:47:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2608c577-99d3-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 07:47:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b2bddecc51aso89269166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 22:47:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f395349sm91719566b.34.2025.09.24.22.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 22:47:39 -0700 (PDT)
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
X-Inumbo-ID: 2608c577-99d3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758779260; x=1759384060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NSf2Qme/BPp/C6Fp7xsplOCNMwXgPlzTGiH99lB+pt4=;
        b=RXHdGVeYiaj8H1zqg0mmBXjgR9T08+prCKKG1QyvXzeOCsgrNVcb1lsE9KvyH8tzpp
         Pe8zHR8f1pCh3aWVgv076wrsMbT0TuRiPLRW0F1FTdLjiky0sTQjW6Bxqhr7KwESkPIH
         5aheTqjA0tpKXVvMKSypSgy7KEoV/tCFaRqCrYq+iBIBx+rxZrmoChO4SzuZw9uZJdWO
         9lxMaRkFZPHDnMns/w4zi2ZMqT11nCiGyN0G/WiJGiEUiblhLkfkSaiQVHmFgrcUMcdM
         yW99Stp/T/ijk7W+qJZkBu221UXBeNo7j5TIcURYkl6k6OKjfE6lDgD3viR+lLKWu/VX
         wx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779260; x=1759384060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSf2Qme/BPp/C6Fp7xsplOCNMwXgPlzTGiH99lB+pt4=;
        b=KiE0CE5t/Z05GGEU871x9W6OHGEdyVsBwDr5Zr8Braf6NYAezOeUBf7r3Oove+cg4x
         qzwK5n5jfqQ4BtAspGMOpwCRdjB24Tk6K/RoRrPQogRAqn/OqEB6KHcuj3gVOwP2/n+c
         GS+PGysKpyIIM/QUGmx8EtKlmRG7VZvEXOKxjUZPcWgKr1szcw+7VZWnyWBhN5iW5yQi
         /XEYmsIrYZaN449MTLaVuC5iRgNhTjd0290WKbI7g0eTlpVzmTuotAjDcQThRObAj+I4
         ox2X1IY0Ft8yaijqFfUYKMxcfXYyXIDzSx4SvCTdBEaKjTJTsycS2nWdRXqPrEL+OMNZ
         pKKw==
X-Forwarded-Encrypted: i=1; AJvYcCW7O7ZAFTmG4bcdJWESLEzUaeY7bLFcEOWOIraKidhNYMpXGTNpSIt3NqM3+VJM6n4RCqQQjMGI+no=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyYANI6ke+4kCIt1ZsVdFP1NG4yy2s1hVylKSiBqEqBHi3CWIj
	QTp/bfGuBHX9+8Lk30VO3qfjnD//yzAwXS/jnycptQ2Wlt+yTZqWwzxpBTSydRdPSA==
X-Gm-Gg: ASbGnctwKQ9kZAlXrxyIUMNWF0RS/3DoqPuGYmiRawmGjGmtzAfsRw5Wbl3LKCAV2uo
	UGOF+22B6lBTlOdmruDTbJnW6vmAdq0raYFsTecTaxVh2V58bkq7+2ZxuL60HOLPMuxUD7enBh0
	oYYS3S5nYvP3iGO4HjaPlNxy+lgYoK9d6oLVyhFohIFy2Z8vd2RqdvG0YUJIwfy7pvuuAQ/4nrl
	aVuvgXD+b1NC9cE27i/rO4o45VhBnHX39wQIV81voFAp/TlX3I+7fC4et4twr5RS8czC+s1k53c
	sJsAi0rSD7d/5QiW26xIjEczWmRuq6bZz6slbg3L7C9vQamNhmsX0qvg1dItLzJBZUW5tPH3qBD
	nANqyCscS+oVQ6Gg/ez6/N6+75e/GIrLb3e1AHL5Tv7jBJRiyNzay3OR7pD5o3DzoAfMBfGFl2+
	d0klVzQJs=
X-Google-Smtp-Source: AGHT+IFZFBUUxcYTwyNn336hiw+xCadb96hkZXkMh9ua2RWbdSe00luppmIpAFO/PiU+1BmcuIYPpg==
X-Received: by 2002:a17:906:6a08:b0:b2e:34f1:9ddc with SMTP id a640c23a62f3a-b34b80b16f1mr213035566b.15.1758779259956;
        Wed, 24 Sep 2025 22:47:39 -0700 (PDT)
Message-ID: <b833c4f4-2a3b-413f-b49a-e8a4f0ebfa30@suse.com>
Date: Thu, 25 Sep 2025 07:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/26] xen/domctl: wrap
 domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-8-Penny.Zheng@amd.com>
 <99737b48-2f14-4d49-85f8-5acd4a434dde@suse.com>
 <DM4PR12MB8451DCCB718F5764C3910234E11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451DCCB718F5764C3910234E11CA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 09:11, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, September 10, 2025 11:09 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Anthony PERARD <anthony.perard@vates.tech>;
>> Orzel, Michal <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>> Monné <roger.pau@citrix.com>; Stefano Stabellini <sstabellini@kernel.org>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v2 07/26] xen/domctl: wrap
>> domain_pause_by_systemcontroller() with MGMT_HYPERCALLS
>>
>> On 10.09.2025 09:38, Penny Zheng wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1606,10 +1606,12 @@ static int
>> _domain_pause_by_systemcontroller(struct domain *d, bool sync)
>>>      return 0;
>>>  }
>>>
>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>  int domain_pause_by_systemcontroller(struct domain *d)  {
>>>      return _domain_pause_by_systemcontroller(d, true /* sync */);  }
>>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>>
>>>  int domain_pause_by_systemcontroller_nosync(struct domain *d)
>>>  {
>>
>> I would have ack-ed this if there was only this part, but ...
>>
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -390,11 +390,13 @@ long
>> do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>          break;
>>>      }
>>>
>>> +#ifdef CONFIG_MGMT_HYPERCALLS
>>>      case XEN_DOMCTL_pausedomain:
>>>          ret = -EINVAL;
>>>          if ( d != current->domain )
>>>              ret = domain_pause_by_systemcontroller(d);
>>>          break;
>>> +#endif /* CONFIG_MGMT_HYPERCALLS */
>>>
>>>      case XEN_DOMCTL_unpausedomain:
>>>          ret = domain_unpause_by_systemcontroller(d);
>>
>> ... as expressed elsewhere I'm not happy about this one, as it'll need
>> undoing in a later patch of this same series.
>>
> 
> I shall admit that this kind of stub really helps me test MGMT_HYPERCALLS=n for this big serie commit by commit at the very beginning. Otherwise, it could be only disabled (and tested) in the end, and accumulate the mistakes...
> But, as you said, all this transient thing needs to be reversed in the last, and I could accidently missing something and leave dead code...
> As CONFIG_SYSCTL is already a prompt option, then maybe I need to raise a new commit to make it as def_bool again only for this patch serie transiently or just address it in " xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_DOMCTL " ?

Removing the prompt again (whether in a separate patch or in the renaming one I
wouldn't care much) was what I suggested from the very beginning, but which also
is what faced Stefano's opposition.

Jan

