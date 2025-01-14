Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED3A111C2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 21:16:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872041.1283002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXnJx-0000S1-EQ; Tue, 14 Jan 2025 20:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872041.1283002; Tue, 14 Jan 2025 20:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXnJx-0000Pp-Bn; Tue, 14 Jan 2025 20:15:29 +0000
Received: by outflank-mailman (input) for mailman id 872041;
 Tue, 14 Jan 2025 20:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tIyo=UG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tXnJv-0000NL-6F
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 20:15:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4921bd37-d2b4-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 21:15:23 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361c705434so42685065e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 12:15:23 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d46sm185145725e9.25.2025.01.14.12.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 12:15:22 -0800 (PST)
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
X-Inumbo-ID: 4921bd37-d2b4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736885723; x=1737490523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qvA3U4uXT67r8lnIiNLurU6RtyPs5q+KYerySYrGgb4=;
        b=CYdHOcYCJtuHr//GODCP45Y1Ff5Qkb4oRm5mExFcrubUyfW7YPU2mf6PmWh2rI3I/d
         VJ7ENYxseoQP90Lx/sKyJ4GT6mcSwQupicOu40oUuyCa9ycYxN4APmjFrU+dLge+aprq
         aCzoCKrAtDwf+QFhSKd0fbJVQuNQ4e+qs2f6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736885723; x=1737490523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvA3U4uXT67r8lnIiNLurU6RtyPs5q+KYerySYrGgb4=;
        b=IEF9aATpR96uU8K2/muggde3ML4QlRLBW0Ur0TL2sBo7OSf5pZ+DGjRWR5KH3UOquF
         CoijgmHoaEFRuJvxRUEeuqjHz2+Vn0kJR1Spr8oDCyjeMYjs8zIuJeLrX4LwucViyXSl
         qkZ3JfbFU2Rlze52ZYT3y1IrHrhunOVGhq+dlwloLtLw2Rf0V4QqA2qq2LEQ7OPk1uiI
         aES+QuXiuRvYdQVAcl6MZrjM++ZzSLgATsvCgKLbCdaDkJrA5XnzMiCHCpsXT/cqdd6n
         Nwq6eVmUdWOGMSvq4yit4CLulUSoyD83P8ikuh+616mNWzA+WhTt/F5dw92siruoB/uG
         Wdbg==
X-Forwarded-Encrypted: i=1; AJvYcCWd8F9kEU+BYujIkUawjmhjcdJF8Rmle9MjpmOnFQI3fW4FW/kEXXS2QkwzRP6iNTVxsSTxuST05yA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuCP5qTCVHiwMdXGWe5EKNBVSL39Os8PzmLRJZi0202hYqhJpA
	PKHieUKSAjhoSN1oO6eoraOxDlHO+OFvFuBicRm8/CqtMx7tyfeTCqpF5qw3KSI=
X-Gm-Gg: ASbGncv65dJtKuffqSWNN8uHHYtqdutSUH64mAL9T6gEjSeA3/fzEvLaZ/B45HSUehD
	lvI+I7Ft08qVuOrANcwpCdNeP8dWwhNbAMIEDFXt83fdFHjbiK9uqI6NBoTBCvUb8by0hUEnBOf
	1hxjva94ZGGlfZ4iHDyZOzdXixCnzfR0imn2Q9IkH+RlQjCT/xA35uTBaT45TI+dOShT7PmhonJ
	xisBoG+/1FR6IWEynXutjb5XDYXVLSqmPx5Dv7LJIj1Eqogj0ckk5UkVV9Cp7nbI0QANJhBHvQk
	vtlRYXgyBh710W21X87X
X-Google-Smtp-Source: AGHT+IEe8K9GFenhmBXmR6QQlxjs+MiB0OffvKNqBEkcuBl6cjZ/v0v8/oC7jyxa1m4hfHmJsmirOA==
X-Received: by 2002:a05:600c:450d:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-436e26a9510mr256291775e9.17.1736885723032;
        Tue, 14 Jan 2025 12:15:23 -0800 (PST)
Message-ID: <9653ccc0-203a-4bec-ba79-57870ed08ea0@citrix.com>
Date: Tue, 14 Jan 2025 20:15:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 7:50 pm, Ayan Kumar Halder wrote:
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..fdb8da04e1
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,61 @@
> +Return Value
> +------------
> +
> +`XenProd~version_hyp_ret_val~1`
> +
> +Description:
> +Xen shall return 0 in case of success or one of the error codes as defined in
> +https://man7.org/linux/man-pages/man3/errno.3.html.

Xen's errors live in public/errno.h

They share a lot in common with Linux (for historical reasons), but they
are critically not Linux errnos because Xen supports OSes which aren't
Linux.  xenstored for example sends errors as text rather than numbers.

Also, that's not the return value ABI of __HYPERVISOR_xen_version.  Some
subops return a positive value instead of 0 on success.

And if you're wondering "hey, isn't that ambiguous in extreme cases",
yes it is.  Xen's hypercall API/ABI are a disaster.

~Andrew

