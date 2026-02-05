Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO8sIca6hGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:44:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC144F4B57
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:44:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222143.1530178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1WA-0004iq-UW; Thu, 05 Feb 2026 15:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222143.1530178; Thu, 05 Feb 2026 15:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1WA-0004fj-R3; Thu, 05 Feb 2026 15:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1222143;
 Thu, 05 Feb 2026 15:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vo1W9-0004fN-GV
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:43:41 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ec58ae9-02a9-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 16:43:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee2715254so7205485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 07:43:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d835f0sm62008315e9.14.2026.02.05.07.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 07:43:34 -0800 (PST)
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
X-Inumbo-ID: 6ec58ae9-02a9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770306215; x=1770911015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3C/iFSnp5yxLxXwQDUUWuS22jpZjTY9Pa/0JcSquaNU=;
        b=AMNOIzfP9FqN9IkY3t/OkbnwM7yvl4j/45/Dm5MCiI2uliQeEVOsnAM8CwPQqh6BdZ
         VmNSH7fETgIl7gAndIb4hSgt58VFdSqqXWNk4IAj2MA9DO+SHdVSrksvGFAaDcpQXkdi
         3wq7+XhBrtzewbZpi9ZywxfijPTPHBdgHhngKq4DvtjvfpxsF1Sq3FA1xj4ICz6VeUI+
         GVkQuel5inqjq+3a6s99WmLRcwkQr036OXZ5PfmtS98pFTVplcuaynW+PriYG9QoQBLD
         bRI8mzNImFcuBcwH+GpSqTFchVDxUXvlFBTuZaRnPKfbbPe2uWGRCO3Bpq1qfZmoK6Hd
         ihdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770306215; x=1770911015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C/iFSnp5yxLxXwQDUUWuS22jpZjTY9Pa/0JcSquaNU=;
        b=oRmi/SEyHsfAdQX4AqHqjikuyUGdb5nb7zEbC3reY0HR7ib0aBVj2oEg/C7jAWqIz0
         RpEkLod1oZaoD/onbHhO4drojChObcS053qdJV1m1Fkm/JTqePf9umvDLOrHcINtI41C
         Q3Tdr/FY5/WS5PgOtk3OrI1hziMEK37/uvLgQJOP3iZbrMNe+jncOD+KKJI447gbFqZ6
         cWdGMUZ3o0XrK/zGbZjJiRW7kXjWm17ZSxG6W7UfrKITGS/NOd1+BMH69cMfsQmssEoE
         pGjxNJxRmZmhQfNqBgsUgMniP/kX1R4ONIxCYKZQlBvvQ/pW+vI9KR3LDmKfn7oKrIsX
         gkhw==
X-Forwarded-Encrypted: i=1; AJvYcCXVNR1LvfSENS8Pa9BAr97t7nt1izvz+ra41X6kRSclsTWo+e38LzUfIhUWCtt8U33PZrgz36v+BhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz57im1r+Gg62v28y5K918TujHYfjBFMgYRjRiRL6OG3mRjrrQv
	GIW5kPfj036MdahtjDbt2ycXsTdbEIgraDldfNUoa2TUC6muvhxq0X/7g5OHXs7JTA==
X-Gm-Gg: AZuq6aKLbm3egc4Zb7MdOpfPtXJg58uxZzP2mb+4go/jRN0AGecpGBjInpFPpGu403Z
	K7sQRKCQ6x/D6rprWNrHSp7N7mG1QviWi+JyxJpCi+s2f8+27REklX9PR/8d52MCnyi8ZpwxpZA
	eyuoeB4wBE95aE9NlMTlS3K9/J/s7/k70fRUc/Ci1hTAFcVi/wUNyXNWFxePI0tCoOADNG8NrM4
	sZ5T9gZJKPBomuExFEk2fveUFC9AwZ03EwMBK3lf2JxNIID3Ou+Usj5ZLvVhjzA/EZYBa4Uz8h+
	BljHU6ItCBZmnXnG4Hha5sLIfqyWB+xX3MUWq7CASSyU9DgWxGSo2VoAtwCHdCXIZkKvGSxy+RB
	cWUTsGsF7L0Y3wl7clHaqy4HpxAf1CVZ/COzN3lTj8EhlXJtzfrvhOvnuKlT/hytcDcXjwq9gwy
	VjDKmVo+3MggtBc4hH3J0qbAI6Zip9JpDrC5ulge5emiBOMJq3pQm4+BIer1QXlUnx6/jFJc03d
	+c=
X-Received: by 2002:a05:600c:190a:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-4830e9b7a3cmr87473075e9.34.1770306215055;
        Thu, 05 Feb 2026 07:43:35 -0800 (PST)
Message-ID: <a3cfd04a-c32d-412c-b352-b4a1e65cac52@suse.com>
Date: Thu, 5 Feb 2026 16:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
 <2B5080FA-A0F3-491C-954C-A458C6CA2E93@arm.com>
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
In-Reply-To: <2B5080FA-A0F3-491C-954C-A458C6CA2E93@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,darwin.mk:url,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: DC144F4B57
X-Rspamd-Action: no action

On 05.02.2026 16:30, Bertrand Marquis wrote:
>> On 5 Feb 2026, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 05.02.2026 12:33, Bertrand Marquis wrote:
>>> Xen does not currently document how to build the hypervisor on macOS, and
>>> there is no Darwin configuration for selecting a Homebrew-based GNU
>>> toolchain. Native builds are not supported; the hypervisor must be
>>> cross-built with a GNU toolchain and GNU make/sed.
>>>
>>> Add a minimal Darwin.mk which selects the GNU tool definitions used by
>>> the macOS workflow and point to the build guide for required tools and
>>> setup. Document the Homebrew cross toolchain and GNU tools needed to
>>> build the hypervisor on macOS.
>>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> config/Darwin.mk            |  6 ++++
>>> docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
>>> 2 files changed, 72 insertions(+)
>>> create mode 100644 config/Darwin.mk
>>> create mode 100644 docs/misc/build-on-macos.md
>>
>> I'm sorry, I should have paid attention already on the RFC, but: With all
>> other Pandoc files in this directory being named *.pandoc, do we really want
>> to have an outlier named *.md there?
> 
> Right but this might not be needed anymore as the only thing needed after Roger's
> patch is only a toolchain so brew is one solution but there are a lot of others.

Even better.

>>> --- /dev/null
>>> +++ b/config/Darwin.mk
>>> @@ -0,0 +1,6 @@
>>> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU tools.
>>> +# See docs/misc/build-on-macos.md for required tools and setup.
>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>
>> Given Roger's consideration towards possibly using a more MacOS-native
>> build arrangement as an alternative, I'm actually not quite sure this should
>> then be the default mode here. Roger, what are your thoughts?
> 
> Even with Mac OS sed and make working, something is still needed here to 
> compile on Mac OS.
> 
> What would you suggest the default mode should be here ? Mac OS is not GNU
> but everything used correspond to what is defined by StdGNU.mk.
> 
> I am only forcing cross compilation here to prevent using the host toolchain.

That part is okay with me.

> What do you think i should put there instead ?

Using StdGNU.mk may still be okay, as long as the comment properly represents
the overall situation.

Jan

