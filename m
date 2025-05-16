Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF0ABA68F
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987767.1373012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4SY-0001yH-0E; Fri, 16 May 2025 23:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987767.1373012; Fri, 16 May 2025 23:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4SX-0001wN-TS; Fri, 16 May 2025 23:27:21 +0000
Received: by outflank-mailman (input) for mailman id 987767;
 Fri, 16 May 2025 23:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG4SW-0001wF-5h
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:27:20 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ececa03-32ad-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:27:18 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso24029455e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 16:27:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d31fsm4245267f8f.6.2025.05.16.16.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 16:27:16 -0700 (PDT)
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
X-Inumbo-ID: 4ececa03-32ad-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747438038; x=1748042838; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EbB1TmCF6/lzHlUUOQ2yuQHZP4GsZ+gKkf/sN6XE2jw=;
        b=RbfRZf9D7dUya9A3aRBbocUjWjitZXW4pOuTtBAZkI5If6H1iR2a2CqI7HZUvvvMPw
         T61JNi+HhiTDpT2d/p1a3lFnlZbFyRtxVaDbQn4FWvgINqGUStx8/O2rf5RApt+uOgbs
         Luwq2j+833255G5iAdtqOaft6KPcNQL5ZvyGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747438038; x=1748042838;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbB1TmCF6/lzHlUUOQ2yuQHZP4GsZ+gKkf/sN6XE2jw=;
        b=j8xT1ui/1zFZhi2uvybFNzNgLZ+XYxfz2LqX/p4n9daZPStGFhUzkM8RvczsP3qzfy
         WoF3AqfIVmv6tqu6heqzk5XqswbgUiNEeKzBwsF9bmtkblIS/PyVycJy9C/KtdrTLsES
         yFQAR1bYl8VTKyJg8hHeGSmhYuZTNtKeSaWQVdETdsVXfeb3LGgRcbb1dTh4pH1LD6JG
         8YXrzbwMPmIIHu4aLkbuU9ngY2rRIOmpiBPSki7tSMRgQvnqmoLMKUQkz3vaHu+Dxjc7
         mR3zitm7aE5RItMfWfHED0BSPI++5SPVRbyIvkTjTDITucjFHTTSnB3HXsDXQzoALfAL
         5/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVjXlj5RrqHl1FGDexT06bBp2WFi7kf+Hol1/ixezER9l1aDQMNMX7zVkKQ5x5TKYGCZIMHpg7SipE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyhJFeXVX2JxVND0hOq0t9tPDZbDG5ouUkvCpI1hhaLGNdKew2
	X/oevT1WWyVi5xTGg24sxkE1CvNEA90w8nzGU7+SM6OL1Q9u0/BflGQyntmGTMK2NI8=
X-Gm-Gg: ASbGncvV7xN9gHpTpOPFLGLTtXP4li2w3Jn71YtuBR2SzT+Rt4AJyoYi4UXXRcBqMm0
	vzfkboB0ClsiQgnRjh1i5yMmxAC9pmQHnxosBjaUhaEO3qDk/inu/UqTzob5ch2aOWT0M5eELV4
	ObgHQ9V6CWoTVWeODlq3qQZuOeboSJ8kNT0G1O/pr5zVbHSCo0cU6Eh0f9GBjhC9QhPPPDsmc39
	bO5vPop/BPP8DhWFDBG3yppTNgxKg8pJBmiIGas28BNO8+vpNa2EGdKQEuzWJQIZG7zdvCtX+pl
	yk33Jhb8FzQuupCyfc/OVsPYWzIBVvM7ofc9q51fqW78D+J0WSf0+DKx9XCWmLaTvttgqZXrp33
	f7QpMTaDONsg9f42TKYPnE11K+oI=
X-Google-Smtp-Source: AGHT+IGxgXvOgAXFE0w3M07n8Fa+RkNV8CoVW0Qkg7uVrr+wR56kjFasq5/tA7Cwd+32/oOxBWdwKA==
X-Received: by 2002:a05:600c:3e10:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-442fefd780fmr42374125e9.6.1747438037751;
        Fri, 16 May 2025 16:27:17 -0700 (PDT)
Message-ID: <9b94e43e-3357-41c2-b982-26ed7ffb2fa5@citrix.com>
Date: Sat, 17 May 2025 00:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add inclusion guards
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-3-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516232130.835779-3-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/05/2025 12:21 am, Stefano Stabellini wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
>
> MISRA C Directive 4.10 states that:
> "Precautions shall be taken in order to prevent the contents of a
> header file being included more than once".
>
> Add inclusion guards where missing to address violations of the
> guideline.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> diff --git a/xen/common/decompress.h b/xen/common/decompress.h
> index 4683eb6c7e..034c833665 100644
> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -1,3 +1,6 @@
> +#ifndef DECOMPRESS_H
> +#define DECOMPRESS_H
> +
>  #ifdef __XEN__
>  
>  #include <xen/decompress.h>
> @@ -22,3 +25,5 @@
>  #define large_free free
>  
>  #endif
> +
> +#endif /* DECOMPRESS_H */

This is borderline too generic, but a COMMON_ prefix doesn't make it any
better.  Oh well...

~Andrew

P.S. the decompressor infrastructure is several stacked disasters and
needs redoing from scratch.

