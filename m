Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id als7FwFnlGlFDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:02:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A416D14C4A6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 14:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234994.1538059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKit-0007iI-7c; Tue, 17 Feb 2026 13:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234994.1538059; Tue, 17 Feb 2026 13:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsKit-0007fm-4r; Tue, 17 Feb 2026 13:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1234994;
 Tue, 17 Feb 2026 13:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsKis-0007fd-24
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 13:02:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee9c9eb5-0c00-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 14:02:36 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48069a48629so39370335e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 05:02:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483709f6935sm157418265e9.0.2026.02.17.05.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 05:02:35 -0800 (PST)
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
X-Inumbo-ID: ee9c9eb5-0c00-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771333356; x=1771938156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/h526UBwW9faw93Hj1eca+q0/GZZ1lDUFEIvKb3Ew6U=;
        b=Mg3MbYymF2Dx8zP9BBF/3wvQ6rMUY9/4EJa85qzjOoJc7fsUoTKKrus7IUNTzIEZiW
         sIf09DrJi1zcL0RebXwp3lJBAwk1nxc0w6hrD93oVtkDBFsDUyYtE6rQ08x00RB4vgkT
         bPNoS/EKtu1oCS1m27xXNtuMYPLQFQxJU85CYR1cxWg52bt6Qw4VNg6pGuo8XTy0xDLi
         n2MDD7yrwWBuOY2aDVsMQ4s402F56caBSkHvAkgCLYvcgPnYEGhcf3HmIaVRHSA2gXHb
         h6z64lPT0WomE59aKgSx6njQ/niA7ivngM0HD1ygeHd0y7JTj4LKVMk3cIGubBO9eiiv
         BqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333356; x=1771938156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h526UBwW9faw93Hj1eca+q0/GZZ1lDUFEIvKb3Ew6U=;
        b=W8NRLuSOhkG6RWc37qDqcbkuICLvmesatugsOUszqW5KzhOI+VjqFGoDEgxDivcCbS
         wBAfFpIuuzXNbsFG1mg4DfeVe51EAefz3z0wMOZHmFa9+gbVa9JkVgWRcWTw0tfVsXFH
         QRe+AhmD6/Lw0AKfg5gWozcP6GFAKw8vRTRwF/LnVaHSV15uVhhp7wka6yK6e/dQZoyj
         PGdxbO44rK3AX5jiHXh0VVANouM2mJ3MTyLhBiX7mRmjR2TNlJsnMgQCuAfUJSOWLyI8
         ejiTri3fcN1vhq80mk0OjpA7jaCHbLV4BZJeLxmIF7xTbD+gmdyvbx9d+mPOtspHifTP
         47WA==
X-Forwarded-Encrypted: i=1; AJvYcCUnyrlUT6x87wj6StIzYO4FBwL20C80W7pQ1qVeGJ5oWaPLayvZBDJYy+HQyS/17UGum+7I0/EOg00=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznFkQoXbGidmIYnND/57qaoUoJEfWkjPHfLjbpc7C0tfmg03cY
	3rqa+mQ0IIwO2mTCjMlD9grchQc0vNHzeiIt5Obd9s6Y7HUt4aBYle2Kd0KW5mgf6A==
X-Gm-Gg: AZuq6aJOb4EKaLRQ/HlifEZNzXZspfcObqSHdljOwys/AaU2vVLn44LWLA6WvuEHzTA
	uQt7/frOPCxq9wlPLDHuPrjQhsgASqZPe+RNHMoJaK5JcszSe7JSQDElLWKre1/BKDN6pEYju29
	KaJTOrsFh1SKUyK633IbG0KlNZfxYG31piLnmV9dcpDsKcL8dZllMBmqiWMfbopLEfNWii5MMlX
	ccff0oNYf70ci12Okl//Wa7ckMS7zcwh3uii9FTkhn53t+DwFsNUwU90WxgMm2uLLqAhsNH7+wP
	LPz4POQaRW45jjNaKRlItUgLD19GaSB3AOZvkuKWfWvlnJmcUTcNm+xqnwcWZa0A8c8u7Ty8uGp
	iaKXGzzwyJQsv771LsDXUvvFbQXjO2vuKuxkrEFD1MxdfVw0RcL9QTa2tHhBm67oql61OTfKA/P
	QKAZ/a1yj9Z5i5qxOIt7cgdMzx2tZ85b7HCS2tXjW4egv+jFj8m5c4DeNoAnaHdv8k6etm66oNS
	2e8i3S+0lI9q7n3oogmejHkRQ==
X-Received: by 2002:a05:600c:1986:b0:483:71f9:37ef with SMTP id 5b1f17b1804b1-483739ff8f5mr254827375e9.8.1771333356220;
        Tue, 17 Feb 2026 05:02:36 -0800 (PST)
Message-ID: <4253dd88-b408-43dc-90d3-f2d1d3c892b0@suse.com>
Date: Tue, 17 Feb 2026 14:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] xen/riscv: add zImage kernel loading support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <308c5bc1de15b23c643d48f975799739f44dde8d.1770821989.git.oleksii.kurochko@gmail.com>
 <0bca8843-9c52-4544-88a6-87ddb110095e@suse.com>
 <f95c9cae-0d57-42bc-b435-3f29c54b67b9@gmail.com>
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
In-Reply-To: <f95c9cae-0d57-42bc-b435-3f29c54b67b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: A416D14C4A6
X-Rspamd-Action: no action

On 17.02.2026 12:58, Oleksii Kurochko wrote:
> On 2/16/26 5:31 PM, Jan Beulich wrote:
>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>> Introduce support for loading a Linux zImage kernel on RISC-V.
>> Before I look here in any detail - where would a zImage come from? I can't
>> spot any support for it in Linux'es arch/riscv/Makefile (whereas
>> arch/arm/Makefile has such).
> 
> Good point.
> 
> It is something that should be renamed as not Arm64 (Arm32 really has such
> target), not RISC-V doesn't really work with zImage. They are using Image plus
> Image.gz as compressed image.
> 
> Maybe it would be better to rename kernel_zimage_probe() to something more
> generic kernel_image_probe().

Well, it's two things. In the description you explicitly say zImage. That's
simply misleading. Renaming the function (if indeed it copes with more than
just zImage) would likely be a good thing too, but needs sorting with its
maintainers.

Jan

