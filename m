Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKvAJoXnjmkDFwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:57:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AFF1343F5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230346.1535835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoyl-0000vj-9Y; Fri, 13 Feb 2026 08:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230346.1535835; Fri, 13 Feb 2026 08:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoyl-0000tl-6C; Fri, 13 Feb 2026 08:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1230346;
 Fri, 13 Feb 2026 08:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqoyk-0000tf-3M
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:56:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eba579ab-08b9-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 09:56:44 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48068127f00so6022365e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 00:56:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a15d99sm18472075e9.4.2026.02.13.00.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 00:56:42 -0800 (PST)
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
X-Inumbo-ID: eba579ab-08b9-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770973003; x=1771577803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zH+dfXMLW9Wkdy5tpFV7npIQyZ3f/yh74lCb7XAfvqw=;
        b=OC+e+fqJigbrS56szm3ExzRmOiZm98bFmE8OovpCC15rFDn5OIzxVOQBfHECvUL//5
         SoEi32fhGvoYJkQ1aJzts7I3H5+lkTaE1FoYvwjGJ6E/ER3h+CK58DTTY1tsVK1hbhAl
         3lAzY+zDw4SxDOkfmHntmz+gixPHfIx4fxSYepVie6HVKdGYX0mFZnxHlX82Z3KJp/EY
         AiLuePxsquoE09e5MVpdW60caZQLpT5YbWk15J3RsXwetnPp0xMDqhM9cCOKRuCtO60N
         /pEMfNp8r9Fcn8C2xPyeXcm9igrBJpaB5arecsK4+7CeSGbbP+HwqmB8D8ov+mwQvlkX
         SD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770973003; x=1771577803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zH+dfXMLW9Wkdy5tpFV7npIQyZ3f/yh74lCb7XAfvqw=;
        b=dCgdPKXDWJ/lbB1x/7DG2crI8UTAwHxIK8wevqk5CDLk0XKCCamSZR10LnWm8D6ibB
         sE6AWxzx9BvVIuDcSFwAITIf9I1/aQab0gkO89qzEUCFPoDJrIt10hd/MOKM6Kbl8S0/
         o/3KYlTExRUhYdJeCoTEFt255ohyQZs9WER0b7cwRMWl6F9aRI+uGWPi/RAB5IFHTxoa
         KHHbuUfpqpyoBljxC4vOTlGt1eo4z65cHfS++taalsjXiwpzDPvu+vsIZbQluRSziz7z
         Xkew+k4SjM6E851H/IxpHwPvj9NRlrZVWNItsxs3oIRZSYh4DgQMQb8BVwkrEeDtfUyJ
         B7IA==
X-Gm-Message-State: AOJu0Yzdk9T6MeLIex1VGgk88jYoeUTOm8azs+t+oY/Dc2Dv+1OUWMav
	NHXzREAFzRygzI24ECKwG2KOSnQlhfDMyCAPikUtrsU/sqmy+C+9b1Bu7LUUUZVzo82gE4YX2RB
	3ZSY=
X-Gm-Gg: AZuq6aLbH8lK65TCTikkkwQ986/dDBbtLSZdUh5t6BV4afQAGzMJipgcprxnFrB99wb
	OjJw6kXZTevpDNqEooFTW72WXRW5JZ/vtF8ZXlEJumichcoqJN6gJPM/bmduDlFe070HqMr6zyA
	nifj994GDfhcV7zY0F4Xr91O8cNdPkVTXFuuWHlJDQwaIbDLTEPzXZVFhofZuZfdV8gQFCjyfOJ
	xqQkDE5ezCZ415J2ol4QULOKfSzCo5XubidI+t1IAzG1Ep6FslkZkLvHFaEpgdosCdpX/HB3Cbd
	PNyVYwBcFbwyo72fDo8czpielF6ijYcJwpJjbXX+K8CQEgeEwvYra8oKeusVIsB9PSKTNKSVzev
	3t8L1Gy4cTsoTLeQSjP77LlaKePnZfJjkyH9FRkPTOUeTTC6QBJgXpQzvffu5d5QbhBk/M+ouxb
	b919w/A8OwO5vOORkGqgKXoey9HXGUKbUkaG9E4yyiBmB+B/8IJkunirB47+xGs5VMSj9GgRGIC
	9n9qoKGsdDfLuA=
X-Received: by 2002:a05:600c:c165:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-48373a5ba18mr17427605e9.24.1770973003436;
        Fri, 13 Feb 2026 00:56:43 -0800 (PST)
Message-ID: <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
Date: Fri, 13 Feb 2026 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot boot PVH dom0 with big initrd
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <aY6iVr990vWeO2p5@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <aY6iVr990vWeO2p5@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 02AFF1343F5
X-Rspamd-Action: no action

On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> After fixing the xhci crash, I hit another issue - booting with 236MB
> initrd doesn't work, I get:
> 
>     (XEN) [    3.151856] *** Building a PVH Dom0 ***
>     ...
>     (XEN) [    3.593940] Unable to allocate memory with order 0!
>     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
>     (XEN) [    3.599884] 
>     (XEN) [    3.602482] ****************************************
>     (XEN) [    3.605272] Panic on CPU 0:
>     (XEN) [    3.607928] Could not construct d0
>     (XEN) [    3.610692] ****************************************
>     (XEN) [    3.613463] 
>     (XEN) [    3.616035] Reboot in five seconds...
>     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> 
> Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
> 
> If I skip initrd, then it boots just fine (but dom0 is not happy about
> that). 164MB initrd failed too, but 13MB started ok.
> Just in case, I tried skipping XHCI console, but it didn't change
> anything.
> 
> Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
> started from GRUB, using MB2+EFI.

Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
for passing from the boot loader to Xen) only after copying to the designated
guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
its calculation (adding initial_images_nrpages()'s return value). PV Dom0
isn't affected because to load huge initrd there, the kernel has to request
the initrd to not be mapped into the initial allocation.

Jan

