Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA07F8D5020
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 18:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732835.1138854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCixV-0004Re-H8; Thu, 30 May 2024 16:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732835.1138854; Thu, 30 May 2024 16:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCixV-0004Q8-E1; Thu, 30 May 2024 16:48:57 +0000
Received: by outflank-mailman (input) for mailman id 732835;
 Thu, 30 May 2024 16:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCixT-0004Q2-Mb
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 16:48:55 +0000
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [2607:f8b0:4864:20::e2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe227a4-1ea4-11ef-90a1-e314d9c70b13;
 Thu, 30 May 2024 18:48:54 +0200 (CEST)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-48a39e0c441so18692137.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 09:48:54 -0700 (PDT)
Received: from [10.125.231.30] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abd0845dsm566765285a.91.2024.05.30.09.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 May 2024 09:48:21 -0700 (PDT)
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
X-Inumbo-ID: 7fe227a4-1ea4-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717087733; x=1717692533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L+KqWGZTZGpOULZC/Hv+9sZLxHgeNukXsnVk4PzK7m4=;
        b=XAUPxEjOrd/jxgHqS1fiOULrv/j0UlQZmJ+zu8cfitF2D4NcdkXE9fmaDpnJG0DuU1
         JXyjcg/c+kW7O51mrEox6+d4lvOmSQdxD+XYAthy70dSW7qR1woTFtdzuT+lwkwxEpcC
         8UiKmcd71VKVyZvkn1saSgumkUCczl3PdHDEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087733; x=1717692533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+KqWGZTZGpOULZC/Hv+9sZLxHgeNukXsnVk4PzK7m4=;
        b=EmLR5YvSrpWn6otKMHjUtJaaclcAfx4vFT5GGPKm496SZSAe2D0EqOFeN8ObSJrAZQ
         R+5Yvw+/vY5TMoLd/hBTkjNFUhXmmR+ao+79GLT+AzeQRcdW1/L0i/6s8bUzzZ+n5xdT
         2x2t0QfKA3PR4YBT16uYjwZ3fMnW3dwJeEzl78IUIfUYHu/3WchnRGuYSTpJnzT5xw92
         i2dXpeG6EW+ue1ox6cQCq5QttOlksG8H5yzjrFRWSRaV+cJJIb5UK6OLw9Rl5g1USgFO
         h0UF/cObekbSogslS9Qr6Sxh+D0hZD5LgXW8Hu9k6RRYAP1kqerK61nsqYcJP+FiANMa
         oyyA==
X-Forwarded-Encrypted: i=1; AJvYcCWLBBQFkOxGGHbqw/B+ywL/oVpWtP4yYvENhS44IvRuUGd6NpiHydLmhbrIdj7U2RfHltJUKR1qC/XXkOZNlyplPFJWAFjNggA0+WgKhfo=
X-Gm-Message-State: AOJu0YyJ1wduGc4ZrDKCqk81UFTOJiWCwS+50H7yCA3c2fMH5xMX2qU/
	6977p6hrO9R1N/ABgpW0mAFQdCnx78Jpw7PXr0paNh3zmJQqeA5Xp6EhoxCyf+E=
X-Google-Smtp-Source: AGHT+IGEu6NItf5t7ZoJdXMLpswN1Ejx0s5HXCP7DuFzFEI+nVhvVIwvp8QMGk3qHF6IYNf1CEhz1g==
X-Received: by 2002:a05:6102:21ab:b0:47f:684:a3d with SMTP id ada2fe7eead31-48baeab1b70mr2790458137.27.1717087733444;
        Thu, 30 May 2024 09:48:53 -0700 (PDT)
Message-ID: <065c4b2f-93b6-428f-beca-b77e6f98cecc@citrix.com>
Date: Thu, 30 May 2024 17:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> diff --git a/README b/README
> index c8a108449e..30da5ff9c0 100644
> --- a/README
> +++ b/README
> @@ -48,6 +48,10 @@ provided by your OS distributor:
>        - For ARM 64-bit:
>          - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
> +      - For RISC-V 64-bit:
> +        - GCC 12.2 or later
> +        - GNU Binutils 2.39 or later
> +          Older GCC and GNU Binutils would work, but this is not a guarantee.

This sentence isn't appropriate to live here.

The commit message saying "this is what we run in CI" is perfectly good
enough.

With this dropped, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>.  Can fix on commit.

