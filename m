Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F61A65E1D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 20:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918061.1322810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGIn-0004pS-47; Mon, 17 Mar 2025 19:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918061.1322810; Mon, 17 Mar 2025 19:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuGIn-0004nj-1S; Mon, 17 Mar 2025 19:39:09 +0000
Received: by outflank-mailman (input) for mailman id 918061;
 Mon, 17 Mar 2025 19:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuGIl-0004nd-L0
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 19:39:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c52d75a-0367-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 20:39:05 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so18282905e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 12:39:05 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe659b3sm112010005e9.34.2025.03.17.12.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 12:39:03 -0700 (PDT)
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
X-Inumbo-ID: 7c52d75a-0367-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742240345; x=1742845145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayn5J6LJaGQafMwbKAyLUUoJjn8vaHWPoBig+Z3H0d0=;
        b=jvfchGL8F13drAhMUutzMwY1u6kOCAe5yBnU5waTq328AZPY3AxzNX6EPZDUX4NLcE
         Ts+4rD14JKFoupxy0lPnumoIgaeCWplFxwP+8U5kCuWp+AlLtAUQLymoXlz/fOaT8Znr
         BeXIfEhm0zQdgMgLeObROamTrQVoPO9IyEFaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742240345; x=1742845145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayn5J6LJaGQafMwbKAyLUUoJjn8vaHWPoBig+Z3H0d0=;
        b=tb8ourFlE6PUkF6IHbVvnPGXrbMo1n3ijexSoHZ+aLW3RtaMTP9Ssw5VtTmVfdcDhM
         FlWUoT9B47Ufzx5Ghs30CdwC8nu+zf4Ir1eEkPe6Gf4N5MzAyzgdNLAJlRACawgEcrFr
         /acfihRwY/Xr6AmKzNxqQh8KxogOfH3NjkdxDM29e5061e3VKhmB8QreEV4WoxHIhhcx
         0GfljzcA2Qu/HTAhMbntGKtPpiLgH0MbQ1b/oqbQNrm5XaFYz2yCumfW+0yoJGcgxe96
         FtTDcUlcAl+aHpK2f8zq8TPvIshNMXi+fGajNkR+ob+H6wcDlLxKyW1TNcdaRNMcVSi6
         nZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXICNWOrCFd7hKCBmrxGi2UK3FDoF2g5HK15Y7/a2oKineEccWAPfEDDfNLCC9PwuRd56wQXH95ckg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJic9bik53GKR7l1x9MxPk7bXiriW15amLnxP99KvVRo+PuYFk
	+AaRDcjoSKnd7jMvmhkTPxSi1sQiUfdD+XUL9AjJ7gI4SQIGYY+3Qw4zEWoXn0w=
X-Gm-Gg: ASbGncuOv6JkRLv7eNHvDiwe26Jp33t08vm1zRqY5OP2w7r95U+41J20fmFTiGDfoHW
	9hOXQmceqrtVEYxhJouYz067UbTeROw+6xyd3TnuZ+1Xx+Pj5zQGduTlpfZSuYOCM5Spuwr0mP0
	nCSZNkl39D6m/IyLyHgx771J/9WPIPg09JrTStshPl/J0bYyjzBoJKqnaWtZm0KjydlXG/y/we+
	Xk/+rM2JsfnveCYKrN8IzmhgXnDhK35QvPi9gDbs4KkeAjp4OkoiPb/E2EBx2sHCrFhJirKDi0p
	O7TkRyBK8zPn++HwvW4BzYLSnYvTOayioeipA7b0AilluEX3dvkQtok7B7PK0Uma6ZpLbEjBe8t
	hZZqGMR1DAF344nGDnY0=
X-Google-Smtp-Source: AGHT+IHRpcZ5QnvTZu+w3e8hNSN+PCp/aCGRPSDo0dx9GDN5+wWjEJmZYiH8oHP8XHr1uUvuHBeJ8w==
X-Received: by 2002:a05:600c:4508:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-43d1ec72a1dmr139164785e9.9.1742240344636;
        Mon, 17 Mar 2025 12:39:04 -0700 (PDT)
Message-ID: <f719a9fe-7df8-4456-a261-af111e023310@citrix.com>
Date: Mon, 17 Mar 2025 19:39:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/03/2025 4:19 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> new file mode 100644
> index 0000000000..210df6ba28
> --- /dev/null
> +++ b/xen/arch/riscv/time.c
> @@ -0,0 +1,38 @@
> +#include <xen/device_tree.h>

SPDX tag.

~Andrew

