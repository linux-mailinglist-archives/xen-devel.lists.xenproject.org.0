Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3FA50F45
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 23:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902874.1310817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxgU-0002T0-E3; Wed, 05 Mar 2025 22:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902874.1310817; Wed, 05 Mar 2025 22:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxgU-0002RR-Au; Wed, 05 Mar 2025 22:57:50 +0000
Received: by outflank-mailman (input) for mailman id 902874;
 Wed, 05 Mar 2025 22:57:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpxgS-0002RL-Qm
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 22:57:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4111f0ae-fa15-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 23:57:46 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-abf4802b242so9744366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 14:57:46 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac1efd7d3dfsm372188666b.166.2025.03.05.14.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 14:57:45 -0800 (PST)
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
X-Inumbo-ID: 4111f0ae-fa15-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741215466; x=1741820266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iOEK8Q5iQn/5cK6OlgLwl5nwQ1puwz4Bez7lEpItq34=;
        b=rY9YoLNGXA/C0DDfoVXU/0ZDLCEkct/8CFLxrZrWqXTbhWP2nT/TE0Vwg8VuzLGtSq
         Xw2n+plNUw+kje1aC3NrKyQspdrnLmAVlVHr32JpRr3KUUx9JdjF9hP9X6EXPRc+eGEp
         puHngbmwqt0J638ZZ8qOT86NqZ2jVAwYdLfXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215466; x=1741820266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOEK8Q5iQn/5cK6OlgLwl5nwQ1puwz4Bez7lEpItq34=;
        b=rFjbDQgNvA6tNl3Q2Yq4ouCfPeCSKsJN96KBYppopx60mxj96uBve9ZJqVmrCMXbGN
         aNIgYnZgZWbdsI77NWSE2Vo3HWqoafdii3tR5pX+lY44yZsyEN1QmJUpc0D37c65Jkr5
         YxoPylVzNRISGuFfE74P7/OmToie/SJw2aOxSBfCU6CkLsi4fUJe4VkiB5P5P9Jkjryl
         8SF8Iz9AWHjVgzhVBi8g4CDhRrmbY7jtpPjOyeGerV9HxZKCOncZrEDbY3FCO6JcTqSI
         RPtSbUqjvUroj5SsZOklUkX037ZfTr4k70xgkU2pwsJi373ULHlph2MUmv9w6kEk3qfX
         RO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcMnMkyTmi8Fxv/5YaguJtzLoEocDU712JViTBJR8uvypp+TLDzmT6v9SprP9A6/3oAszuWHZqlZo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8MmCBVZQWo+B6kc9oZK9EP2Fn94VJfe5VFhERMZTTNGPhlbXQ
	6LudDa3OZXiMH9DbTrbqm3X7K8OmhbcJkkfsgzUjbQRcnH+5xi8pXgRXSdm7ik56f3cw9/PP54X
	6
X-Gm-Gg: ASbGncvIesACjYvwXTjMvN8E5afruB/tIFjx55AIJxoYj0WBx+PSx/FwUmT18n9WKtc
	bYYAQ5hqQHeT3Lt7K2YtO2fKHJwBtNs8gL7izDeO69GyythF+hJT/VDU7p2ysBy+ewNw//uL4fb
	bWo6XtGQxTnjK7OHtry4VaiTouKcv8xzrewe52iOr8t0j4DDCi7bVKTT52Yrt+w0Ott54P9Dik2
	z3432/nPrRzD6yrsDNXJ7jo59Rs0zRF31IaZ3Z67FSSqCRYG8t4AE+d7WYb19bKSNcOa6XVmkpb
	qcX/yiINSdsf6vagC97r+55sALV5Lju36IRi7TrmOOFqdMaEWmuNrLMsM07ycNj87xEZpt/lV5U
	5rdLKaW2I
X-Google-Smtp-Source: AGHT+IGMWpcTR/9Fj0JeIj6qDhKEzbmcyD/tRgd+uvNb0W9FM5ENsOQymhpIvmHax/3+lmJjG7KC4Q==
X-Received: by 2002:a17:907:7e96:b0:abb:c647:a4bf with SMTP id a640c23a62f3a-ac20d8bcea1mr427935666b.23.1741215466041;
        Wed, 05 Mar 2025 14:57:46 -0800 (PST)
Message-ID: <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
Date: Wed, 5 Mar 2025 22:57:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250305085201.14258-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250305085201.14258-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 8:52 am, Juergen Gross wrote:
> The description of the Xenstore INTRODUCE command is still referencing
> xend. Fix that.
>
> While at it, make clear that the Xenstore implementation is allowed
> to ignore the specified gfn and use the Xenstore reserved grant id
> GNTTAB_RESERVED_XENSTORE instead.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  docs/misc/xenstore.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 38015835b1..d894d24d11 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -286,7 +286,7 @@ TRANSACTION_END		F|
>  INTRODUCE		<domid>|<gfn>|<evtchn>|?
>  	Notifies xenstored to communicate with this domain.
>  
> -	INTRODUCE is currently only used by xend (during domain
> +	INTRODUCE is currently only used by xen tools (during domain
>  	startup and various forms of restore and resume), and
>  	xenstored prevents its use other than by dom0.
>  
> @@ -299,6 +299,10 @@ INTRODUCE		<domid>|<gfn>|<evtchn>|?
>  	for example passing a high-bit-set 32-bit gfn as an unsigned
>  	decimal will attempt to use 0x7fffffff instead (!).
>  
> +	Xenstored might ignore the <gfn> value and use the reserved
> +	grant table entry GNTTAB_RESERVED_XENSTORE instead for mapping
> +	the Xenstore interface page of the guest.

I'd suggest making a stronger statement than this.

---
The <gfn> field is used by xenstoreds which use foreign mapping to
access the ring page.

Alternatively, Grant 1 (GNTTAB_RESERVED_XENSTORE) is reserved for the
same purpose, and is populated by the domain builder on behalf of the
guest.  This mechanism is preferred because reduces the permissions that
xenstored needs in order to function.

Both <gfn> and Grant 1 need to agree, because implementations of
xenstored will use one and ignore the other.
---

~Andrew

