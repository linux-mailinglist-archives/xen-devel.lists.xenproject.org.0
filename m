Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBrMBCufhWlKEAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:58:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6258AFB301
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222861.1530552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGjO-0003am-Nl; Fri, 06 Feb 2026 07:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222861.1530552; Fri, 06 Feb 2026 07:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGjO-0003Y3-KQ; Fri, 06 Feb 2026 07:58:22 +0000
Received: by outflank-mailman (input) for mailman id 1222861;
 Fri, 06 Feb 2026 07:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1voGjN-0003Xv-8e
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 07:58:21 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a088fae-0331-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 08:58:20 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-432da746749so1158493f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 23:58:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd3fdsm3827201f8f.16.2026.02.05.23.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 23:58:18 -0800 (PST)
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
X-Inumbo-ID: 9a088fae-0331-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770364699; x=1770969499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DZNJQPwntNIQqjFZHgMx4KebADQv48iTVe3De2X/X5A=;
        b=Q2Z2dJCMD9mjuyjNejx1a2pPOG0bdc/omW5quq9iaNUACc/WvTDIWk1c3urZSw5FH5
         MvkQC1KEuOD7YizORlnwD3OCu23R1kIhdHeYfoBHXje7DKoCl4ItQelGxypEBMgS7PE3
         nuNF3C5LMY4ohZbbB4DdsRVrnOyCKgJRAJ0/OcK7xLEGHR2oMgFTyIXWQZBCyKMuLk1g
         3HD0yuj9ZBakptwGYCvFNyMoSmTQ9nZM/CDHgJkpJcWfokYZxzQLvzHpv4eOd+TTGSqH
         syyWz4sU7RJahSSvbtsuJp9XL/AcaOQWUVuQ2Ofl/bRY3CYHd4AdLEBedDxvDL7u1ZJs
         jYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364699; x=1770969499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZNJQPwntNIQqjFZHgMx4KebADQv48iTVe3De2X/X5A=;
        b=sfDvdpdck0aOSShaGOPhR5vZmvDIVtmDMGfw8CW5otIOOHHFiYj9CePeQvfYpZu7hR
         caAgUQHUi6PYjyoQdzAJkhixtiJDXsnFHMzyMzRCDP8UzwFp3hOBsrvsMCBvCY1ZvoF3
         pZ/bP3GWndBDDCiUDFXDwuIpdmPy6sis4CFCkfxHR+Yv4EPpG4J128Sha9GVJMTgfE+f
         OzMWaudwQ25Lm4e2D5vyA3sPqxyAUKV5RFRWefGECKLGmuDefY14Q2xP39SQDeVp0+KS
         0hylgdpEpL5X4UFGSl+Xli8jRC2O/6pt+1C7yJqOWmRTidCoDmhPYBMivjbFg0662/xX
         ATFg==
X-Forwarded-Encrypted: i=1; AJvYcCXks3Bsk827tU/43g+FQVa1WavWVu/fREpPncdMN85fjTFabwLN2icGPEojThARWvkc/5lUZjOFJs4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1h1j8nmFaG4JKaYAHL9CPy1crtOOBUzBFAgOrKHmra64GQKLo
	ilJrc3WH2BQRPcwe3+Wmdx17sFKVs2nZLu4jaVcqRYPBDqKkLpqXN8jFFXSDXowKMw==
X-Gm-Gg: AZuq6aIsICOUuUcAwuokS69poie5o1YVm8+oNHlm3EB8vD1PDJyX0NfsaIyPSlyhdj/
	rxSilNzllQTt5Nf42EMPZemvRunVS/Wq9Rwmm4wr7M8gj48o1QEjEb01Gz8IDDEhHa9D06Fk2B/
	9jUq6Pegk90GBO/WU3pBWxilfOkZKSqFI0zrJHVZWFwl1UHGf2IRWWsCq+6POw770+vFm7K0jka
	mSl3tbDsRiQIDL5KvigQY7GnffiNpbQ4uvCDsq9zeuWB1u05sZemV64HM/x8mo132KvGg4bIcd3
	mXNEY25K3380IqoSaWW5rkjtaMmDxW6DimC/coVlwcBaEnOHlMlzDXJUCSKH85E2YjCqYeyyM1w
	CvuI5wUuKhI+OAkdaLr0GIRejpjiGNDLwmtNV29NRhstAjLp0bVTQ1dfg4dHfOIM3v+RPq4gjFy
	hyLqoDvSzxhL0iacuLcFI/Efp+uP1VB7CHb8k43lo/cgTYG82QrHNhMOxy8SpMEiY0BVNY26/SE
	Kw=
X-Received: by 2002:a05:6000:220f:b0:42f:bb08:d1ef with SMTP id ffacd0b85a97d-43629658eb3mr2438342f8f.17.1770364699220;
        Thu, 05 Feb 2026 23:58:19 -0800 (PST)
Message-ID: <37e2fad1-ce06-465e-b56b-190bc0aaa379@suse.com>
Date: Fri, 6 Feb 2026 08:58:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: Use MFLAGS for silent-mode detection
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
 <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
 <2E85263B-38BC-49CB-80CD-3C30F37EFE4F@arm.com>
 <F6E76E4B-1992-484E-8232-85696D3F23F0@arm.com>
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
In-Reply-To: <F6E76E4B-1992-484E-8232-85696D3F23F0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6258AFB301
X-Rspamd-Action: no action

On 06.02.2026 08:53, Bertrand Marquis wrote:
> Hi Jan,
> 
>> On 5 Feb 2026, at 12:59, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Jan,
>>
>>> On 5 Feb 2026, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 05.02.2026 12:33, Bertrand Marquis wrote:
>>>> GNU make 4.4+ exposes variable overrides in MAKEFLAGS after "--" (e.g.
>>>> O=/path, FOO=bar). The silent-mode check searches for "s" and can match
>>>> an override value, forcing silent output even without -s.
>>>>
>>>> Use MFLAGS for short options and filter out any long options before
>>>> searching for "s". This preserves -s detection while avoiding false
>>>> positives from overrides.
>>>>
>>>> Fixes: 4fdb4b71b152 ("xen/build: introduce if_changed and if_changed_rule")
>>>
>>> I don't think this is quite right: make 4.4 post-dates that commit by about
>>> 2.5 years.
>>
>> True, we can remove the fixes tag.
>>
>>>
>>>>
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>
>>> Nit: No blank lines between tags, please.
>>
>> Ack
>>
>>>
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -113,10 +113,11 @@ else
>>>>    Q := @
>>>> endif
>>>>
>>>> -# If the user is running make -s (silent mode), suppress echoing of
>>>> -# commands
>>>> -
>>>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>>>> +# If the user is running make -s (silent mode), suppress echoing of commands.
>>>> +# Use MFLAGS (short options only). MAKEFLAGS may include variable overrides
>>>
>>> Why "short options only"? It looks you mean to describe the macro here, not
>>> what's done in the ifeq(); at the very least it can be read both ways.
>>
>> True should be.
>> Filter short options from MFLAGS.
>>
>>>
>>>> +# after “--” (GNU make greater than 4.4), which can contain an “s” and falsely
>>>
>>> 4.4 and newer really, as 4.4 itself is included in the affected range. I'm
>>> not quite sure anyway whether the comment really needs to go this far. This
>>> kind of detail can be had from the commit message of this change, if needed.
>>>
>>> Happy to make adjustments while committing, yet I'm not sure whether you
>>> agree in all regards.
>>
>> Agree.
>>
>> If you agree and can do that on commit, i would just put:
>>
>> Filter short options from MFLAGS as MAKEFLAGS may include variable overrides.
> 
> Are you ok to give a reviewed-by and do the changes on commit or do you want me to
> push a v2 with those fixes ?

I'm intending to make adjustments while committing. That will now be next week only,
though.

Jan

