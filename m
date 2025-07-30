Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD6B15F4B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 13:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063824.1429535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4ui-0003eE-03; Wed, 30 Jul 2025 11:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063824.1429535; Wed, 30 Jul 2025 11:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh4uh-0003cC-TZ; Wed, 30 Jul 2025 11:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1063824;
 Wed, 30 Jul 2025 11:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoeR=2L=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uh4ug-0003c6-Fz
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 11:24:02 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae997b6a-6d37-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 13:23:57 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so5075435e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 04:23:57 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfd10sm24967845e9.21.2025.07.30.04.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 04:23:55 -0700 (PDT)
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
X-Inumbo-ID: ae997b6a-6d37-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753874636; x=1754479436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LIh7syB9kViLaLGuLWbXuHxfGMLv3rAamybzTCzPkC0=;
        b=JLiwquP3zKZNoe5rAgidT6wKAnaVYaiKfSn+EEwHu22WiIfzh2EoeVcm74JQB6EWky
         8I9/MPCb6/PZwMCi1TeJchsGw/+5z8npecsFcXJca3H5iRoO8R9w/ZW0Pdz+/wMBRAVO
         cJGd1JG/g6JCAvT/N95X66B8ChliaNKMoT/LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753874636; x=1754479436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIh7syB9kViLaLGuLWbXuHxfGMLv3rAamybzTCzPkC0=;
        b=Hd/vx2kbDl+N/eP+QHh2f9Jiwvx3yiO/llpjth+hOcDjd5ODvrKBJaIz4F/EvRURcy
         YDKe3ZHmitxj3bZ6s08W/Op0n8UZ2s+FPEvPlRi+9JzKpaK3AiCi+3chrjTbf/XZ39iI
         ITcXBjM0yItl9sczHkyyqx9T/S/2P5ylKeaU57Bd9yFA5AFS+Syjno6/NY3hhutV2ymU
         kkffEmASPLt3cZ8NASAqaQ3s3ow/KEeOebtlJP5648FCZ3a4SXepQ/Ndgzh9L3BgBEC4
         4X4wq8mu0nc8/hKj/JAY2/tdS9fa5ncsgLdXp2y3KVbBNqVfiu/zzjY9K6Q3w45TFrUG
         ZNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXul++yRrOjIq3WYokeFkkNUzh3EJFLag8QFXsXpHUVrqHX2p7nVbCDK4QyhWICCKw0oe7fkRA61R8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoRQvIz/C4O3getrLGaWRL1guC6XKlUAkKfA6vS0XDYBEMRBfB
	32l7rWKfU5mnO3//6OK59yVaOQUZqgi4ICQItb6iRTOF0BcgQ9YD/Do8CFehZQnGQq8=
X-Gm-Gg: ASbGnctmU3FvqzhSgGT7L8vcw1o01QnVTTitXXTYFXu8u48cTZzPmdG7yaOUM84nBuf
	sRJ25XVegNxdHF5DKPjPQb53yH1tn425MEuN+DL2cD2YZDBoQ+kX8fia/4M/B0//6r9uVsVPhnv
	2Tt7vHM03935vVlYGTps7PqGKc/iTBHeVpmTF+C86iQwEOAdetGPCfszci8OnGYYzdlNwcxXi1r
	c3bfYmE8n+s6jHXwxFy05pMfWMY/uWMMjnYZWDYtYFWUyzGHltfpMsY4ux3QUKloFMOMTWceOSI
	6Rx+zQk/QsrCkihizesND8hA6k3odZRpY67L/kVvo7cxQf2icjki1kY9M5O7T5CkDCFnzKzqkX1
	vfxQYhd7ryCaxrDCPmOgYO9+TTpmcxK3Xz73CLnG7SF4T5OAUCJ1HD2P9KV3Fz0aGHrkv
X-Google-Smtp-Source: AGHT+IEA1YxKm+Q1M8HG0fyTmeBzI30/o7MudAg9h0K70rVSqL5HNSgnwobKVW42OKubLUv+gHy0JQ==
X-Received: by 2002:a05:600c:c0c8:b0:456:1122:8342 with SMTP id 5b1f17b1804b1-4588dbc50a3mr37591775e9.5.1753874636397;
        Wed, 30 Jul 2025 04:23:56 -0700 (PDT)
Message-ID: <89058017-141e-4837-a547-10b41b5d041b@citrix.com>
Date: Wed, 30 Jul 2025 12:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] vpci: Refactor vpci_remove_register to remove
 matched registers
To: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-6-Jiqian.Chen@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250728050401.329510-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/07/2025 6:03 am, Jiqian Chen wrote:
> vpci_remove_register() only supports removing a register in a time,
> but the follow-on changes need to remove all registers within a range.
> So, refactor it to support removing all registers in a given region.
>
> And it is no issue to remove a non exist register, so remove the
> __must_check prefix.
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Bisection says this causes an assertion failure in the unit test.

Running /usr/lib/xen/tests/test_vpci
Assertion failed: vpci_remove_registers(test_pdev.vpci, 16, 2) (main.c:
main: 407)
FAILED: /usr/lib/xen/tests/test_vpci

Full logs, not that they're of any more help:

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1956817587

~Andrew

