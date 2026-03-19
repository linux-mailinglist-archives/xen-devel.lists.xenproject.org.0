Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GzbLa+su2ngmQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:58:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA22C792F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 08:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256764.1551265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w38GZ-0001jc-No; Thu, 19 Mar 2026 07:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256764.1551265; Thu, 19 Mar 2026 07:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w38GZ-0001iA-Kl; Thu, 19 Mar 2026 07:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1256764;
 Thu, 19 Mar 2026 07:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w38GY-0001i4-G4
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 07:58:02 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58c0f07a-2369-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 08:57:59 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso1894385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 00:57:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b949e1sm85169095e9.9.2026.03.19.00.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 00:57:58 -0700 (PDT)
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
X-Inumbo-ID: 58c0f07a-2369-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773907079; x=1774511879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=652ZLo0i5CyA4ak0MrhJcA+UpfuQMsgf28bdy2WtHsI=;
        b=MksdCy2VtBuouM/BRzBr8WrtUyU1a6ZC1/iEC6g327Zs28vZETprZ+UAPfTiy9ZP8G
         T1YfeP6KW9ZFWpF2U2j3nOhB1dmfzdQCfHdIa8pijLIAuNL1Ma/cJ3/REF6mS2tweDko
         K9AeT+jShSX4Js6APugYvcyXhuh2Zksqs6+ipLV4V/ozMddYCKJ68CmfNEuqNQwhn+63
         d+qKIBEgzhM7wFq8tk6kSC/0Ox6A3CB0naY1wPccIL4GIPglApGuk2I6o3qsj9+71bw3
         G9jXvf+dgPwZIWz/jNeL5xmZSvkWUEWBuS63LitQblD7ywB+uQbP9KSVAdjI6FkLhCaZ
         RA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773907079; x=1774511879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=652ZLo0i5CyA4ak0MrhJcA+UpfuQMsgf28bdy2WtHsI=;
        b=JO7mm0HjNYNJ+8dpHNGs3VLsPQIwUtqboR2H4qzv2xWxTM/mdIby8a94GWUtEURVxz
         KSVDqZHLj9QQjmC3CItTUxZ2zjWW4OMKXLpcd4WDMBfFeXkkAEyM8kc28vld4Wv9gKki
         0jzmkk0kQwf2Cl5EPNhg/ln62hpYj9UYk0YQFpQPpmtf24z/A/5tJSAB1l54Eu+expe6
         Jqbj5y6OiJ4NROQAIYqUz7MLRfxRpeR7QD2yQNDEz69W07d5ghc0f53ltgUPmYV7b3hN
         6SYP1DJIbuEyEXI1knu9AQBBwANNdqMqmlQnqgHarV9nBCtRrt/1fCiuFfLavBTnoHvw
         nOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgUm2Am059y+VZbXQr8Q5rnlSGoNxQ6XL5epV3/pmtKK3G1GiLiZxgpb/TJl2GNZLWsKE3XAEx/1M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvGKvo1YZDGgCxaTVN02Sv0ns58qBogyoXd5ESjbVQhSk/CQjh
	MqdTjk/e80L4YVBwWu+ofbdsIdvBcXj1G55ObbCtyyEm5BrB4MYhwnP7dQQdq6migQ==
X-Gm-Gg: ATEYQzxy77XjkfiUmUOaegfoi7W/102AruPe3DR8cqGPlDayGpyOa5/JraDeTN1VYdA
	19+DJpLuMUI58RsgMgQjczSNhEEY5RD9z1zagrtb6Emou8i3EaB6NtEyN6KuNzZ9wNnx04We/xO
	nQtwfACSiLMss9UNNFHNsdswhYoUcpG9qioCu3iqas9cgr8X/SyumyV0wFdI9av3/qH0+7iFznl
	dQ+P+6x0KVWGLwQkII7KKPT1btcmNKlbAHIGuiFuP9XhNBxVemK6ERjF++x8sDcujeNDUZKx5nL
	IHXxEAC4+sM75MgJ5sQzcOIZtjjCDL9Fk687QNxY1nfMFAc+XkLSIksHlTFxhBDaUYu5W5sJYcL
	iOChQVk8Ol7HHzK+xBBKwdr9or0VjZKiNlrxoujQE5kR9kuxfZ+Ut8tB+7SpX2XNlhfvb9TDM7e
	daSdBkHTiX3ntJRiL+ZQty8tFjxotrtuL9nCdSxjTq4avg4Hyx9EeHhBNva2Qa0wB5CA9H5hNJj
	oe0NmTvyhaxd0A=
X-Received: by 2002:a05:600c:630a:b0:485:5574:8ccc with SMTP id 5b1f17b1804b1-486f445122amr99962215e9.13.1773907078761;
        Thu, 19 Mar 2026 00:57:58 -0700 (PDT)
Message-ID: <1efcb5eb-1b59-4def-a527-254a31efe2b7@suse.com>
Date: Thu, 19 Mar 2026 08:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
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
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
 <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
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
In-Reply-To: <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2BBA22C792F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17.03.2026 13:49, Oleksii Kurochko wrote:
> 
> On 2/13/26 2:11 PM, Jan Beulich wrote:
>>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>>> +
>>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
> 
> (cut)
> 
>> If all you want are 2Gb guests, why would such guests be 64-bit? And with
>> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
>> even a 32-bit hypervisor would suffice?
> 
> Btw, shouldn't we look at VPN width?
> 
> My understanding is that we should take GUEST_RAM0_BASE as sgfn address
> and then map it to mfn's page (allocated by alloc_domheap_pages())? And then
> repeat this process until we won't map GUEST_RAM0_SIZE.
> 
> In this case for RV32 VPN (which is GFN in the current context) is 32-bit
> wide as RV32 supports only Sv32, what is 2^32 - 1, what is almost 4gb.

??? (IOW - I fear I'm confused enough by the question that I don't know how
to respond.)

Jan

