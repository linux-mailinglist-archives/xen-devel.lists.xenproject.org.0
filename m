Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A231986C8C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804919.1215890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sti2i-0000Zq-KW; Thu, 26 Sep 2024 06:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804919.1215890; Thu, 26 Sep 2024 06:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sti2i-0000XI-Hf; Thu, 26 Sep 2024 06:32:00 +0000
Received: by outflank-mailman (input) for mailman id 804919;
 Thu, 26 Sep 2024 06:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sti2g-0000XC-Mp
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:31:58 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f0397b-7bd1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:31:56 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so83985466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 23:31:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f8440sm309228866b.182.2024.09.25.23.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 23:31:55 -0700 (PDT)
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
X-Inumbo-ID: 06f0397b-7bd1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727332316; x=1727937116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O2SsTDsKWqtl8rt+GwTOL5Px/asshtE+mvCp7N8Z+Vg=;
        b=AS6Al7VxlIbl+JNe9rha4Kxx687DLVLOcWsw4VFqr2YZDVg4fSfZ3yg5UnoCNE1X8B
         gReC/MQwxOAW2prdJEPnKn0F4cYy6TwRaEkRjB2rk2G/AKySlja8JrauetVsUBeI1GL+
         RkJp1ws/vnhaDDD3voJLk3cPEeluBVOVCrSYWWIhE/dGmcghktQjgajJOMQ2e/IwJE9i
         3Gngi9a8SFfmhdYOuJZZnFBGOAxuibfF1YkHbg5qtpt9QCokFwAYvnRHDmzzdOhLEKZG
         hp5HuLKlZ+ry6PcrBd1XE/SqkpJmGw5GWoAuBbMmJF9aADoKbtO4dSlZO8tWDtA//PLp
         CHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727332316; x=1727937116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2SsTDsKWqtl8rt+GwTOL5Px/asshtE+mvCp7N8Z+Vg=;
        b=ACzvUQ5FkfR/BPKTJWAWhzhY+1Hkh7vMs7ePZdCndKnOY00YFkhHsxXjAu2RAKvEXR
         0GSEQeYEaeH6xNexdeQWHnlymM8XAg34rtsjnhlgKQ+HN03ELC8QlN6ZrIxHZgv4EV2k
         YXRcMt6TJ5ZX8uu8wcPO+99lDxdqH/wxoYNfqW3u4wRTewEUM1WFSK6pejNcXr7qLnnN
         RwzZRj4QMsgMhzPMirA0sd/iukagKjPwj/zTz9jbAMmiHfdV20OFtjjoWqDMZ3Vi+cGx
         MQUMupYA/NV1DSqIv9eS6MttPh/GJ9bhIlcqc42/Az5HJFOStggxG581zdXkzQGA6Wxf
         b0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfG+cmVGATuTHuPJSbUIKBWTcWhUVhSYooug/v+rH7+ewo68IN77tWH9R1OZF63tDK5RZODCvip00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO2qswBex4UpR522T/615rxG+la10keqIy0p50yI1l9bq7tyH3
	6ECFSDnWGR9wKvMvQYzo07Nz0PRA0iDby7kO9cltM6Jugrh1CVAtBNjwyQUHVw==
X-Google-Smtp-Source: AGHT+IGWNj+S0jM8je0BoCwlyz4B0hiGFCc5oXwrxbTRzORNJGs8XGNqOoeJ8VzfMISR5143YY4XBQ==
X-Received: by 2002:a17:906:f59a:b0:a7a:a212:be4e with SMTP id a640c23a62f3a-a93a03431a4mr499255966b.7.1727332316170;
        Wed, 25 Sep 2024 23:31:56 -0700 (PDT)
Message-ID: <dfa6f9b1-b02f-4e43-962b-33014310f08e@suse.com>
Date: Thu, 26 Sep 2024 08:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/alternative: Walk all replacements in debug
 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-3-andrew.cooper3@citrix.com>
 <b1333d62-b738-4a61-9c68-ba7903f2e92d@suse.com>
 <3e439093-a9bb-4213-b28f-25fa09b5eecd@citrix.com>
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
In-Reply-To: <3e439093-a9bb-4213-b28f-25fa09b5eecd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 23:15, Andrew Cooper wrote:
> On 23/04/2024 3:44 pm, Jan Beulich wrote:
>> On 22.04.2024 20:14, Andrew Cooper wrote:
>>> +                if ( res.rel_type == REL_TYPE_d8 )
>>> +                {
>>> +                    int8_t *d8 = res.rel;
>>> +                    void *target = ip + res.len + *d8;
>>> +
>>> +                    if ( target < repl || target > end )
>>> +                    {
>>> +                        printk("Alternative for %ps [%*ph]\n",
>>> +                               ALT_ORIG_PTR(a), a->repl_len, repl);
>>> +                        panic("'JMP/Jcc disp8' at +%u leaves alternative block\n",
>>> +                              (unsigned int)(unsigned long)(ip - repl));
>>> +                    }
>>> +                }
>> Why's Disp8 more important to check than Disp32? A bad CALL in a
>> replacement can't possibly be encoded with Disp8, and both JMP and Jcc
>> are also more likely to be encoded with Disp32 when their target isn't
>> in the same blob (but e.g. in a different section).
> 
> Whatever the likelihood of them existing, Disp8's cannot possibly be
> correct if they cross the boundary of the replacement.  Checking for
> them has the side effect of running decode_lite() over all replacements.
> 
> Disp32's do exist in both external and internal forms (retpoline), and
> the point of this series is to make all external cases usable. 

Okay, fine then.

> Therefore, there are no invalid cases.

There definitely are: Any pointing outside of the present replacement
block, into another replacement block. Which can in principle happen if
a label was used wrongly. Anything pointing outside the block really
needs to be covered by logic adjusting the displacement when the
alternative is being put in place.

Jan

