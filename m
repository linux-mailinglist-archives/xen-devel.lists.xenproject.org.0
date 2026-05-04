Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOL+KZ2w+GkdzAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:43:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE694BFF1B
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 16:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299999.1574560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuW8-0007x9-2D; Mon, 04 May 2026 14:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299999.1574560; Mon, 04 May 2026 14:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJuW7-0007uB-VX; Mon, 04 May 2026 14:43:27 +0000
Received: by outflank-mailman (input) for mailman id 1299999;
 Mon, 04 May 2026 14:43:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJuW6-0007u5-Gn
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 14:43:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJuW5-002lvK-On
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:43:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b079-bab6-0a2a0a5309dd-0a2a45038074-34
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:43:25 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f8b08d-672d-0a2a45030019-d1558029ac28-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 16:43:25 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso30811585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:43:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba865fsm251681015e9.10.2026.05.04.07.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 07:43:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777905805; x=1778510605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C7w+PpYVk+AtGjOQatFfu+bU13YOIpXKMwIU4apBv50=;
        b=IM+7DC7ZoIHyYMZOddvvCKkCYs8doYLCG0zybe8+p3Y4O9HW7ZZlh6RfLNBpnpn7sz
         b3Kn3CrJ87hlVv0tU6j22YcTuE2l/Con+dY4KpgMrHzirwUiVYaoRZNB8EZ6IMAhD1mM
         4ls2qeBD5E2YPusAeEla7dtIO6CBD7AZ6IbTGiLMU56K7y4wKJYsv/F0lT5ttOEo3UYo
         SAF6kWA9UuE0dSq9qs/L3KiJX1PfnBG0lfVbFYIOm8e7aYwPVGQrq2Bnm2+f+8LZ9/TS
         TQZMmZCMxRJ28b+fhtx2/++mr2Gw23VL7PORV/cILMjgoJwYC85ICyay7vKAyOZdJJxk
         sEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905805; x=1778510605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7w+PpYVk+AtGjOQatFfu+bU13YOIpXKMwIU4apBv50=;
        b=iCmZjOCVsU5uwOU7nxYanK526IWyrp0J60i20brHXRQaY/hBasMqn5JV0xZ3g6B6gP
         GUPLHLn3gvug69ZBc9Ornkrr2MZNYpHexL8yHZpT7DnkAuR00CgHEnLG9gg4i5dF5lVF
         QUF9AYj/jrX0UeYV30loz0jNk6ea+wBBF3790b5iBd1Q54sF6QICcS37MuNaklGxRm12
         iBuQMD79m2TBU3mL15RIB+MNR4yOfKPX4RhbjwgfN3SSjf/uknFP3N4tcpbEnO5yFYMr
         /WJn3bqsM0GX3mskQ5vx+Hn8a6LePJu34ZbaHad+Z0OhiEosj8yalXa2ZZPCynB/PP3y
         vR0A==
X-Forwarded-Encrypted: i=1; AFNElJ9k7xmUz/vkjn4a7REbX1jfujUQjctAEWnScnCv/ibUP/hCe9v1bfBiJujYSDJJxk/KNkWT2tj/kn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE7hvxZHw6gfd4uavS6qWEmZ76gcHhFq2tRWJOzOWSalhaRo0V
	JxcGYa+OGr3fOpJTh+9P+IcWKh5AMVBWoqFYcNJ1PvEbDF7N/OOe1uCgFYq+JyH3og==
X-Gm-Gg: AeBDiev66opgHA3gg2mLX/9gGM/TKiwDQQhHAeJ7r1nWTn1vXmklqiV4PKgogdiPAY0
	IxZW9IZRyxgfpRn5PWxpnbY9P1j6FuOLqwZFHjRUxYhJWS+F0rWoP8xzPQJh6DdJATyh+RprtMT
	Gio7gsx9BUImqqSD36hDAShf5Wbdl6+a5ZKA4xakObnN4fSrCjVcWf7O2ZPEQAUj64FetZ0hbwI
	bysuwER20cwkNMElNUjw03bakCFm2pwOl7PJQRSmrZZY1yXxvxba8hcZDpeC1dwAH7LeTzi9Z0J
	wSppglnrxAkY4+LcAzlrmDYdgxSEsL7ndMbufSMA/gAE/eVDwwCLU6zwW7PcmLI7u77TRrgtIKy
	8tr3ZNaYdeK8aw6Nby70bRlhLUi4tdbgUsA8QmeLBHnxiTQxmCPVTpLIpFSoFaVFj8sPvU+5Vv3
	5tf0HDt3z63slnpvXImc8braU8xdg9LsTicz9JMB1wXgjHnd8cj+JNTSvdHSzqVIrvnebmrtVnp
	s6ox57FpFIJqIa9B9uHBQpqSw==
X-Received: by 2002:a05:600c:4450:b0:489:fec9:a17e with SMTP id 5b1f17b1804b1-48a98874d1emr158495175e9.12.1777905804959;
        Mon, 04 May 2026 07:43:24 -0700 (PDT)
Message-ID: <9f67c3ee-4450-4d4b-b03c-66ac1aa63014@suse.com>
Date: Mon, 4 May 2026 16:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>, xen-devel@lists.xenproject.org
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
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
In-Reply-To: <20260313163455.790692-4-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1777905805-29370938-4D88B0C0/0/0
X-purgate-type: clean
X-purgate-size: 1348
X-Rspamd-Queue-Id: 0DE694BFF1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 13.03.2026 17:35, Thierry Escande wrote:
> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>      crash();
>  }
>  
> +machine_type_t machine_type;
> +
> +void init_pc_machine_type(void)
> +{
> +    uint16_t vendor_id;
> +    uint16_t device_id;
> +
> +    if ( machine_type != MACHINE_TYPE_UNDEFINED )
> +        return;
> +
> +    vendor_id = pci_readw(0, PCI_VENDOR_ID);
> +    device_id = pci_readw(0, PCI_DEVICE_ID);
> +
> +    /* only Intel platforms are emulated currently */

Nit: Comment style.

> +    if ( vendor_id != PCI_VENDOR_ID_INTEL )
> +        goto error;
> +
> +    switch ( device_id )
> +    {
> +    case PCI_DEVICE_ID_INTEL_82441:
> +        machine_type = MACHINE_TYPE_I440;
> +        printf("Detected i440 chipset\n");
> +        break;
> +
> +    case PCI_DEVICE_ID_INTEL_Q35_MCH:
> +        machine_type = MACHINE_TYPE_Q35;
> +        printf("Detected Q35 chipset\n");
> +        break;
> +
> +    default:
> +        goto error;
> +    }
> +
> +    return;
> +
> +error:

Nit: Labels indented by at least one blank please.

> +    printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
> +           vendor_id, device_id);
> +    BUG();

Can't this be moved up into the default case, thus avoiding "goto" and label
altogether?

Jan

