Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AAC57C2C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161598.1489515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXdZ-0001H0-VD; Thu, 13 Nov 2025 13:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161598.1489515; Thu, 13 Nov 2025 13:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXdZ-0001Ed-SX; Thu, 13 Nov 2025 13:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1161598;
 Thu, 13 Nov 2025 13:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXdY-0001EX-Ps
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:45:20 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe43f5b5-c096-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:45:19 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso1516569a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:45:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81223sm171546466b.4.2025.11.13.05.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:45:18 -0800 (PST)
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
X-Inumbo-ID: fe43f5b5-c096-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763041519; x=1763646319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7IYnH03GwJiwEXYHq7z5djT9LuQQHqZnjMKilL0R9ks=;
        b=Q6m32YcFFZwCwLtjh/f7L3/eHtKu+NyQkCMqMWmGm5lrhRT/dJ2RgpT+sd1iPI0vtS
         ytjhZ2/L/utt4+SsVFKbjKD3XwsZw/FL0kvF2616V9n+kKOpxUo9Ep3bVMeSn9Cx4UGO
         zrgN6C0clX/VoJWg59tb+NDEstjyRML9AynicRuQBoKpL1pbD/+2C3C49Inqwv5BMLGr
         f9+HviI0nH54WoGDVw6L7+fmZNGvMx7AHhLaYlGCd6bIuIIzOPVOeFp8Rmmkg1yNOwHv
         hjnQqaLPZ6gMEm7IEheiits13vAc1M2Uf8ZnyB7DN/8jQDmv64rrDJMcvMSso+vtsXG3
         Gmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041519; x=1763646319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IYnH03GwJiwEXYHq7z5djT9LuQQHqZnjMKilL0R9ks=;
        b=dJvw6Ayn0F4I8hTlBEKy9YGlsKiawaLuSQPZAV6NwP2HfdeeQ+JCIkg4q+jUWLGnBq
         mh/4RQVuGl1sCGtNGCijxdv/WDfHGaWMEmAQAD+1TLi/3j7PmSSbSfQLkuHXUG3fH/x6
         4VfVD7IFcDBGOb9agRxwMzo7/e8SUsnw4WxASZoVoSkxqaw/e2RnjdfoYL4VPo/RddFx
         xRdXJMGa5SiPgPlQWIN2JP4ibYo9WsXqZilogkA2YFwQyt8yXCiv3HA467laS9leMkId
         CgM6jIhQsm9cYaL/FpRPtbStc4Lw+bglmHM2qfbVu/mpzrSJHfWUjKqOh1srRZcyouU2
         V3Sg==
X-Gm-Message-State: AOJu0YwndDeGoRbSFEhRC1janAgFwSKpvkGZ9I+5EBkhDa4812ev5dPi
	wGec9fQFf3UCWBhC88CyeQs2SgIe/vsf3FjZebglPlw3hX2DDcqi8mNM8XtV0+p+Kw==
X-Gm-Gg: ASbGncvo5vnoubgblbeOc4weWs6VdgCt0E9E5RGfqIAewA3tF8zgb/qiIhxzxRnH+0A
	+SNfGFXnM/vIcMYR4gLwPomeE9Rpm7pb2b3ii5vZMPydzY3vWagym5IZowL80ZGtCVRuO+UMpq3
	CQ93LjIkcFh9vN/OSpO993tCQv3XMLYn0KHBdvrUppLqy0/9rIT66lIWDTXupOdxxKOlPBO4tP+
	fCtRfHCvfZN8oVh67qI5ItRKVGIuy/KigTNjmalUytBQoshtWxBOr/K90hAyv0K7Z9JsJn8FzM1
	ZQIPy6/eHZoMjqecnA3iK6QRhdjao4c+i2IEKhL0kt63bGknRP8rF7as5aF/bapeT/PG0n0gHH6
	NRJDcieOBN1u8SlcTcssHSTO+S9ZgBdErkplgv8W7LnFAfJNcHb6e0ssZC+lkmh02zcgyglcZrT
	d3LSkjZO/NbSPRP7zsTHIvFZWH2PChKlbuZzAaJ5bz3z4KHT89ukSYNK+Um5Kasfnx
X-Google-Smtp-Source: AGHT+IFBVVdFAD2d/Mo7MJ7t5Hvo+v8Ucl2jZ2CRltmbBM3Sa0OgK5ABz819D970s+0CAzi5TMzymg==
X-Received: by 2002:a17:906:f591:b0:b70:be84:5186 with SMTP id a640c23a62f3a-b7331aec174mr650743566b.44.1763041518656;
        Thu, 13 Nov 2025 05:45:18 -0800 (PST)
Message-ID: <f1c74d0b-9f1b-41cf-885f-9323f4d5ca9a@suse.com>
Date: Thu, 13 Nov 2025 14:45:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] mktarball: Drop double-processing of the archive
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20251113130154.220139-1-andrew.cooper3@citrix.com>
 <ce976661-927c-44e0-a478-893242bacba3@suse.com>
 <b0d1b91a-a9fa-48fc-9546-b481c75ee185@citrix.com>
 <c0ac3598-c070-4b73-9e6a-49385338ea1c@suse.com>
 <1dc03c2e-772e-40ab-b3a1-7c9d463b7250@citrix.com>
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
In-Reply-To: <1dc03c2e-772e-40ab-b3a1-7c9d463b7250@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 14:42, Andrew Cooper wrote:
> On 13/11/2025 1:34 pm, Jan Beulich wrote:
>> On 13.11.2025 14:29, Andrew Cooper wrote:
>>> On 13/11/2025 1:12 pm, Jan Beulich wrote:
>>>> On 13.11.2025 14:01, Andrew Cooper wrote:
>>>>> This is a partial backport of commit 63ebd0e9649e ("releases: use newer
>>>>> compression methods for tarballs"), but keeping gz as the only compression
>>>>> method.
>>>>>
>>>>> In addition to efficiency, this causes the tarball to use root/root ownership,
>>>>> rather than leak whomever produced the tarball.
>>>> I don't understand this part. Isn't the ownership whatever "git archive" reports?
>>> This is fixing the issue you noticed about internal ownership:
>>>
>>> xen.org.cvs/oss-xen/release$ tar tf 4.20.1/xen-4.20.1.tar.gz --verbose | head
>>> drwxrwxr-x andrew/andrew     0 2025-07-10 12:28 xen-4.20.1/
>>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/
>>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/.github/workflows/
>>> -rw-rw-r-- andrew/andrew  1362 2025-07-09 14:57 xen-4.20.1/.github/workflows/coverity.yml
>>> -rw-rw-r-- andrew/andrew    96 2025-07-09 14:57 xen-4.20.1/.gitarchive-info
>>> -rw-rw-r-- andrew/andrew  9668 2025-07-09 14:57 xen-4.20.1/Makefile
>>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/
>>> -rw-rw-r-- andrew/andrew 24220 2025-07-09 14:57 xen-4.20.1/stubdom/Makefile
>>> drwxrwxr-x andrew/andrew     0 2025-07-09 14:57 xen-4.20.1/stubdom/grub/
>>> -rw-rw-r-- andrew/andrew  2252 2025-07-09 14:57 xen-4.20.1/stubdom/grub/Makefile
>>>
>>> xen.org.cvs/oss-xen/release$ tar tf 4.20.2/xen-4.20.2.tar.gz --verbose | head
>>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/
>>> -rw-rw-r-- root/root      4781 2025-11-13 09:51 xen-4.20.2/.cirrus.yml
>>> -rw-rw-r-- root/root        97 2025-11-13 09:51 xen-4.20.2/.gitarchive-info
>>> -rw-rw-r-- root/root        30 2025-11-13 09:51 xen-4.20.2/.gitattributes
>>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/
>>> drwxrwxr-x root/root         0 2025-11-13 09:51 xen-4.20.2/.github/workflows/
>>> -rw-rw-r-- root/root      1362 2025-11-13 09:51 xen-4.20.2/.github/workflows/coverity.yml
>>> -rw-rw-r-- root/root      7035 2025-11-13 09:51 xen-4.20.2/.gitignore
>>> -rw-rw-r-- root/root       798 2025-11-13 09:51 xen-4.20.2/.gitlab-ci.yml
>>> -rw-rw-r-- root/root     15298 2025-11-13 09:51 xen-4.20.2/CHANGELOG.md
>> I guess my reply was ambiguous. I did understand that's the effect, but I
>> wasn't able to tell why such a difference would result. It's all "git
>> archive", before and after the change.
> 
> Ah.  The first git archive does the right thing, but the result gets
> expanded into the regular filesystem and takes local ownership.

Oh, I see - because of --no-same-owner being the default for non-root.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

> Then, nothing is merged, and the result is re-tar'd using:
> 
> GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
> 
> which retains local ownership into the resulting archive.
> 
> For 4.19 and earlier, I propose to add '--owner 0 --group 0' to this tar
> invocation.
> 
> ~Andrew


