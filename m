Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B29B142AE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 22:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061921.1427523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugU9s-00007r-LZ; Mon, 28 Jul 2025 20:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061921.1427523; Mon, 28 Jul 2025 20:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugU9s-00005S-HV; Mon, 28 Jul 2025 20:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1061921;
 Mon, 28 Jul 2025 20:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugU9r-00005M-AH
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 20:09:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb63b88a-6bee-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 22:09:14 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so26614835e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 13:09:14 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac76b92sm107007325e9.32.2025.07.28.13.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 13:09:12 -0700 (PDT)
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
X-Inumbo-ID: bb63b88a-6bee-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753733353; x=1754338153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VeNuiEy+K33IcUNoktOlxil/mwvReawH5d74Z7gZpnk=;
        b=mKrWmF2vU2z15Rb8kbOBAEmiJrVE2S+8pSO1rg1WYGJ6oMCwggDK6e5+Oyj1MuQL5d
         O++IVMeTE3ik7tL4BV6r54Nnt/IhG/6FTe+BuacGH5lsx2EUSuzsdPLckTs1pI+2KcpI
         8fl5c0NKFo3bLqja4YUI5exASyfwgQXHUte10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753733353; x=1754338153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeNuiEy+K33IcUNoktOlxil/mwvReawH5d74Z7gZpnk=;
        b=bFkYz1q++Dpf9cBt7vkPcBz/t59/qdx+sRbRNlSYfdisehbTGNnU09NQjL9L9AIX5l
         oIPlJIIt6is06LR7doirVEv3ZGOpI/j93kS4MyKZjf8Q7lelQ0dW6r37t3SNlskyWL51
         xhsHW/RrEBKe7CGDwHWHV254E0AhxD2rlptjnejdronYCRFnTV4AxvPzzL1OmeeAgXP2
         ajzHBMP7kWVEQxWM7SmNV8iqfY2/lK2947mcauc/ArEfKLzJhA0Dvd+ekZ6dK14D47Y8
         JlSd340anMiIcAx3v6wD0oml+k3+IABMAn+E9OuL2G3LS0Q/+6/Is+TwCKjE0JVv6o7i
         gAPw==
X-Forwarded-Encrypted: i=1; AJvYcCXPOfP56JwW+No71m1pONG9zWLeEvSMGSMjBISAdmc8kPIGG9ghxOoiJT43UcrbOXIkeR1bhbM4BtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5qQxstv01x6utSmfw2NEkl6HeUA+PL3Fe7GNAQlvzwg1/vyzk
	O63bZfzf4iARiHIkkj1rMzzNZjB9NYJ0RwWqWXHcwPZfOwWx50xCGX8upijbPOptXpA=
X-Gm-Gg: ASbGncuCMoS99tpqo20Gao/775MC7KlS+CdQw9kcBerYR8m+1C+ok5ZQlXb79Y72cMW
	xX0+WsUQqG+EU6LeN4Y/TQCNY6+9UZoIMP/27Rnv2YGvfO2HVaJDyDQbO67xxWPilAMuxo88E88
	BeaaicpccuKeUQs8PSopklnp/X0cyOXS9KXOUApZkGKUp5q1ZWRnGC3k5KgTCs5QdcqVqHtzKBL
	/QiUC/CL2RPz3YP5qfGmZ6b0RQi03NJ196dzDityvlv79xQHst9/7KHwp5D1K8JXVlG2rtprrVe
	Mq9tfmmsjUthcAB3sfJ42+9H87CHbrW6NDhNwBjSMj32Fxqf3yOrckcFEunLj7oNFhS1vaDxx8q
	sAgeGG5oHKZaryCdsllIC8ffjfRnhKx8QusTtkLlaJ9NISwic+ed1sU2kyi+3Q5MUu09mlCI6Xn
	qQclE=
X-Google-Smtp-Source: AGHT+IFZmf4AW15ezazHeTZPO/2SGbK3TjceblUOZs6iX6LqtDPylCZCBcZyG2Jiy2bpaciWaXIleg==
X-Received: by 2002:a05:600c:4749:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45876554d95mr97733505e9.31.1753733353398;
        Mon, 28 Jul 2025 13:09:13 -0700 (PDT)
Message-ID: <08ca27cf-435b-4807-8cbc-0b866709b9df@citrix.com>
Date: Mon, 28 Jul 2025 21:09:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: fix memory leak on error in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250728195245.90356-1-stewart.hildebrand@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250728195245.90356-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 8:52 pm, Stewart Hildebrand wrote:
> In vcpu_create after scheduler data is allocated, if
> vmtrace_alloc_buffer fails, it will jump to the wrong cleanup label
> resulting in a memory leak. Correct the label.
>
> Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Urgh, sorry for breaking this.  Ultimately it comes from having two
different error handling schemes.

This patch is probably ok to start with (and to backport), but a better
fix would be to handle sched and wq in vcpu_teardown().  That way we get
a single failure path that does the correct thing irrespective.

An unrelated observation, but there's a waitqueue vcpu allocated in the
common path, but I was under the impression that only x86 had any need
for wqv (and I still need to get around to fixing introspection so we
can drop wait.c entirely).

~Andrew

