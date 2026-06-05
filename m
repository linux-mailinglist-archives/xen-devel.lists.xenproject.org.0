Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2wOIOpCBImoBZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:58:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8B64634B
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:58:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UKXlH27o;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329152.1593364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPRI-0005KO-1T; Fri, 05 Jun 2026 07:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329152.1593364; Fri, 05 Jun 2026 07:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPRH-0005Hp-UN; Fri, 05 Jun 2026 07:57:59 +0000
Received: by outflank-mailman (input) for mailman id 1329152;
 Fri, 05 Jun 2026 07:57:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVPRG-0005Hj-LL
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:57:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPRG-0051Sq-20
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:57:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a228183-2eae-0a2a0a5409dd-0a2a4502c354-8
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:57:57 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a228185-af86-0a2a45020019-d155dd2bb1e5-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:57:57 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so815205f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:57:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm25425454f8f.20.2026.06.05.00.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:57:56 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780646277; x=1781251077; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NaCtTAlYf+/WaB56QXbIgCKeygtkBJg2DTm8XmNCI8g=;
        b=UKXlH27ouveNdqV3fK5AlDHbNaq8xb0lcmz5qlaQUTaLxCgCpBGQYoIZHvE4GV7IEm
         +WIu1/z9eClnmG0rWceXICaLJCMzxpfv/jCZIrv3o/kjEVVf/YwAGQ1T+COpQ4KUm3kX
         dbaIFpB3x6sUc6Zx2UTiCRNbNHLccdRetThU4gPOgqJjkgoTnzuo6Ndp2bknsCljqujO
         sUlsdqk/N7Y3NTsmgczQ/M8c5zLPVOwV4NWpZfslUQX6J+InnEdW5pNXd7ybTrHXE+pC
         lduxInjST6UmfNPoDmPsGFCrgHhqBR5iYhfSZtoNwIKj45MWUtPDqx5IHyvfZ79VCYFN
         W/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646277; x=1781251077;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaCtTAlYf+/WaB56QXbIgCKeygtkBJg2DTm8XmNCI8g=;
        b=sxZBgOSUG/gJcZEWTuRNsDVXCL97s9pxt5ncgi5KcqhpG4HOZ/K1h5xjnsJu84CXMb
         DaGloXK6KHr1a3dd3bOxZAlXjuil8OyeHmOXjzZMXJxjPQE3dlMhuoXCihJT5as5eQkD
         Q289vTvVOpBlruKRzCdi6gMZzvHSuBKG0ulNhkweDD+l0ms0H+WM8y+gqqK9F+CW/GwS
         gl27/UXNpbrEqavvzuxe77NuH5Y32ZdU+ORsu0TuyDabQTkijHtlslZK5FO4pwzgNmVV
         RJpfMUY50uBMx2ndsha3ZMmpJt0xz+4VXkPeScxFx5ZlVKHggvYYH2vuDfRGhrB1YM3k
         KTcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9opBZfA2pE5FPqTcoLT+qVm8pOyuYf+Qu/b1p1DvoQ2WESnJbKgg040MwsA4julG98nioVrxEq8tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9MuBpV0w/mQgrxXNCqY+YBDFVDHf34df5jxypbLEhrSHFZoXL
	+9DgFfu1wFATv/zMSBrwU1rWeHbycqbKLkRfSvb2l0nS8a6ioMiC2LRTTDAP+3wMKQ==
X-Gm-Gg: Acq92OEL2yUc/aKWo3IjgbyMVRlLmZenX00AuWJ0ms5qRAAVgVzq6EHuF3DSLyvD/vr
	TQuwOaJcqStl19ES/NDvDY62LWQE1q6nK/DBxvh3MXYuX88QIB4pyTEmircyTIK7q6s7qsPJyIY
	W+YBoL+mH8P8YoIzYOOb8RGzkacoJLX8IxmhvTs4qgTNLjwOZuZk7X/vM0pUEsGX2RipXQn9FSa
	XZn8m1VAcrSXiX7sDuLUuRw7kxrZbKRHrV58A4OKX+Cz5TX0U+Jh3/zHbzGUEhkn6yVmrbhbhif
	zdU9BPFFqrJvJGnhX4i4Ya+1l97xeF+nxpAisLDM479lcygMSIgIQt3oxTYCqmtWoOg4LBpJhn7
	a7nR/U0W8/RYpysqW459ArpNrKL+pR67efs0NgxT70zvRqFgQkvbh0FuAZ8O46SE+yfdAKoJb7e
	xfWoncYnYoL12tA03Znm4aJWWPc0js6PrAdjh/OqWLCwGZ+XPfmvHXrn3YjFT5AJ0/VkHnq5Dee
	CHcP3TgCJFCR3h04VkIsNxaLw==
X-Received: by 2002:a5d:5584:0:b0:45e:ed7f:1dd with SMTP id ffacd0b85a97d-46030645e65mr2572317f8f.25.1780646277227;
        Fri, 05 Jun 2026 00:57:57 -0700 (PDT)
Message-ID: <a95fc402-bc12-431f-b4a4-8506f4d6702b@suse.com>
Date: Fri, 5 Jun 2026 09:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-6-frediano.ziglio@cloud.com>
 <ddf972f5-fab2-4833-99a7-d008f4d2c7e4@suse.com>
 <86898787-9b59-4976-ad8b-5dbe681e34d3@citrix.com>
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
In-Reply-To: <86898787-9b59-4976-ad8b-5dbe681e34d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780646277-A8145161-B81C2159/0/0
X-purgate-type: clean
X-purgate-size: 993
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:freddy77@gmail.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim,citrix.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55B8B64634B

On 04.06.2026 16:48, Andrew Cooper wrote:
> On 02/06/2026 1:23 pm, Jan Beulich wrote:
>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Instead of using the absolute __start_xen address, calculate it as an
>>> offset from the current instruction pointer.  The relocation would be
>>> problematic if the loader has acknowledged the Xen image section
>>> attributes, and mapped .init.text with just read and execute permissions.
>> How can the loader respect what .init.text wants when it sees only .init,
>> prior to the subsequent patch? Was the series meant to be ordered
>> differently?
> 
> No.  Xen explodes if you split .init and this relocation is present.
> 
> It's the part where Xen undoes the relocation that the UEFI loader did.
> 
> Removing this relocation is necessary to make it safe to split .init.

Okay, so ordering of the series is intentional as is, but the description
here is imprecise.

Jan

