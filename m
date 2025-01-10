Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF8A089AE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 09:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869296.1280757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWABr-0001Sr-U3; Fri, 10 Jan 2025 08:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869296.1280757; Fri, 10 Jan 2025 08:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWABr-0001RQ-RP; Fri, 10 Jan 2025 08:16:23 +0000
Received: by outflank-mailman (input) for mailman id 869296;
 Fri, 10 Jan 2025 08:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r1rC=UC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tWABq-0001RI-2S
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 08:16:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c9a52cf-cf2b-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 09:16:21 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so13013725e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 00:16:21 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d46sm44133015e9.25.2025.01.10.00.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 00:16:19 -0800 (PST)
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
X-Inumbo-ID: 2c9a52cf-cf2b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736496980; x=1737101780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kv7FKYaMN/WUvTocOgd+87qkT+pqaT6mSOki8l9byUQ=;
        b=k9X8VTAoLa5is4/9AjBQuGfMBnVjYSXKs8xvZ2sZiOQv1mXWdsARrqnikVL13tmo3v
         vPYs+xRthLNGex9xSWupLdrPZj3f/hOWdYrpAEop2JBFwHc2u8qrWIvwtAkzF4HPYYVc
         LXSKDtFJve/YVMqAnz2JyHpYceNwFWQUh4bRjXYuuHpm1Hzwoi2Jd0pLipJAElm6csl7
         oOeCP2TVdUnUgACwbxyM3N3NJ/deydtL5Ae2rGb+5hwNtuDVrzKxA1wrsOtNLmnM0Jji
         LRgaDHYR+Wvc7nSXhi8LPyz/FNsYuoUbJE7nBdgCM5pn0dhzKDb0Dz8F1g8ZOw4K0Mde
         z4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496980; x=1737101780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kv7FKYaMN/WUvTocOgd+87qkT+pqaT6mSOki8l9byUQ=;
        b=Y8b+BJE6Vd7YaaRyVCmBPmrf55wYmfpthqlDLeNv/1tGpqaC+EmOocMFUE/BElawW1
         r1YH0JlG9TxolTCARlbqhuGpHexgbYxvLwB9mfmK7E7Uj4bDDZ2V2TuotiYBrL/7Qqpe
         SNtfKmGC4kyEKmq20V1rSP76rHBd18DZYJDOh5xaZQamEiAcfHsgly7qc96cNr+N33Mi
         1vd7w8+CZV/glESRSFUclB9D+wfBZnpAtTmIvrCWLYa7/iW0nTEDyh60lRsyV2fPxMFn
         ifgQb/ghhL0P6kjB86qOAVlmpxjkpD22X10nSd5NsjDN/VmASdUQI2oEcXWLbKhzXY+O
         IySg==
X-Forwarded-Encrypted: i=1; AJvYcCWWEUqfYru/7gzknHDiG0j0oGq90/QeYbZqOmZ8OpwEogRFscM8SFTWA2XLhwkjGxbu8eeH2rKMKGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZBOn2Ntt+yD0MhzNASusnREkWfT8ha952bUcu/hFgCp3TgwlW
	Ab5+oVk7wmljJ8RM8YTLsdSFSZ85t8mrb9r6V5YzdL6dsn74QQfM1fUG9sTKmGg=
X-Gm-Gg: ASbGncufPc3uxIxMIpVKlPxEaQV3TbRNUMixEuoSMUAzKdMLEViukxVVrJomajuznmU
	HlxaapV2qN7TkjyOifjQF6pNxlqDvVrBkz4G9jeu6+St0+khtpjt1euFMYxfOieTSKGGMgbN/HG
	qczb6Wdy3qrEb6BNSN5HrfTDSb82nt0Eewdlhb9JQ+lABNCu0eYykTaEO68ZSbparzt3yehX4xv
	PZkxvfnd4SHSCGpc0bfgEIHT2XnT+bAX4v/PyBXFe+7C53fTYFxZGMvXS0P5Q7ZB59D19YGc//B
	QbvQ8GuRFtCAOMSFfVSJrQNaUSE=
X-Google-Smtp-Source: AGHT+IFVGQx2dSjVmPRIlM+jesEk6scS9hu8M0GdFRKVQxW47gkq6Hxm/JvalF9ICQZy0vXxVeGaqg==
X-Received: by 2002:a05:600c:3149:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-436e2680c4amr79831195e9.1.1736496980317;
        Fri, 10 Jan 2025 00:16:20 -0800 (PST)
Message-ID: <73307130-f03e-413d-98fb-7e6c05383851@linaro.org>
Date: Fri, 10 Jan 2025 09:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen: do not use '%ms' scanf specifier
To: David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony@xenproject.org>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
References: <20250107093140.86180-1-roger.pau@citrix.com>
 <20250107093140.86180-3-roger.pau@citrix.com> <Z3-sJMXpiFUoATHz@l14>
 <974ab6743d168d34babd458fe5e2e7766bb280b4.camel@infradead.org>
 <Z3__eDp4hShe79Pl@macbook.local>
 <17c134258de9517b677f08a865394f8075d67bdf.camel@infradead.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <17c134258de9517b677f08a865394f8075d67bdf.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/25 09:08, David Woodhouse wrote:
> On Thu, 2025-01-09 at 17:55 +0100, Roger Pau Monné wrote:
>> On Thu, Jan 09, 2025 at 11:25:13AM +0000, David Woodhouse wrote:
>>> On Thu, 2025-01-09 at 11:59 +0100, Anthony PERARD wrote:
>>>>
>>>>>        char label[32];
>>>>>        XenDevice *xendev = NULL;
>>>>>        XenConsole *con;
>>>>> @@ -550,7 +551,10 @@ static void xen_console_device_create(XenBackendInstance *backend,
>>>>>            goto fail;
>>>>>        }
>>>>>    
>>>>> -    if (xs_node_scanf(xsh, XBT_NULL, fe, "type", errp, "%ms", &type) != 1) {
>>>>> +    node_path = g_strdup_printf("%s/type", fe);
>>>>> +    type = qemu_xen_xs_read(xsh, XBT_NULL, node_path, NULL);
>>>>> +    g_free(node_path);
>>>>
>>>> I feel like we want "xs_node_read()" which would be similair to
>>>> xs_node_vscanf() but would simply return the result of
>>>> qemu_xen_xs_read(). This would avoid the need format of the node path in
>>>> several place in the code. But it's OK like that as well.
>>>
>>> If you look at the other callers of qemu_xen_xs_read(), it looks like
>>> the majority of them create the path with snprintf and then pass it in.
>>> Or with g_strdup_printf(), pass it in, then free it afterwards.
>>>
>>> So perhaps qemu_xen_xs_read() should be a printf-style function too,
>>> with its last arg(s) being the node name.
>>
>> I just went with Anthony suggestion and introduced xs_node_read(), as
>> I didn't want to play with qemu_xen_xs_read().  Not that I think the
>> suggestion is not valid, just seemed more work than what I wanted to
>> do right now.
> 
> Makes sense. Something like this¹?
> 
> char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
>                     Error **errp, unsigned int *len,

Maybe switch len <-> errp arg order.

>                     const char *node_fmt, ...)
>      G_GNUC_PRINTF(5, 6);
> 
> There's a %ms in hw/xen/xen-block.c too, btw. Did you catch that one?
> 
> 
> ¹ https://git.infradead.org/?p=users/dwmw2/qemu.git;a=commitdiff;h=percentms;hp=bc6afa1c711da5b4f37c9685a812c77b114d84cb


