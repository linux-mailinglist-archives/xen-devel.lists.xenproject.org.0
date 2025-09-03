Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC9B42557
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108655.1458716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpNC-000751-9v; Wed, 03 Sep 2025 15:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108655.1458716; Wed, 03 Sep 2025 15:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpNC-00072o-6x; Wed, 03 Sep 2025 15:26:10 +0000
Received: by outflank-mailman (input) for mailman id 1108655;
 Wed, 03 Sep 2025 15:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Q+D=3O=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utpNA-00072i-V4
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:26:09 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f3f129d-88da-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 17:26:06 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso11878615e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:26:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b66b6985bsm213235225e9.2.2025.09.03.08.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:26:05 -0700 (PDT)
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
X-Inumbo-ID: 4f3f129d-88da-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756913166; x=1757517966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kpptJI8bwAxPttCSKzlOJOSfG+7s/D1pOF0GDq6uRu4=;
        b=m+baBwM89HLFI5tTRTYPy4Lq3FeRwFgVl2Lkg0U5KQFAgRiszZqN8W2QHpKWs/47H6
         R16upT2y4g93oafq7ETwoCI3nlWw3Sal+zhM+Hbx+488wN7i02x+LxmSNYC8iBhzhpZX
         Z26qGE9zdl62YT+r7Hq90wLWh6zwMHEfypXyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756913166; x=1757517966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpptJI8bwAxPttCSKzlOJOSfG+7s/D1pOF0GDq6uRu4=;
        b=RLURehtPqw0Dbl6Jlu0YxRVrxEg8Xs7hB7Oo1AkOByeRu4ClRV+4okTPyC5kI3k0Ug
         1kovWWI22sWeKRPYgjZ4hF61qXIdeEWkZ71851EttQvKFq4ran2yUABLFA4zWddrPU4I
         ne4K4D4wCkw7CPaFx6zoZlhlrMRtspjtq5snK9aWZa1E5yBr9cS9HROUOs+xyo5fRJlG
         SqgF/sxW2PZELQGMkOxpd5Iqou2JoERC2AI+a9A7WEkg46JXdO/KhO1F6ECMP6N8qS09
         ErCBRH0uDzfSm/XiMxETa0ZW4NvJdNDOlxdRZeeHNE85FTqd29i/HahRwjDXSjeeXFN3
         5ipQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBL8jHr+Wetj79/mUd/e7CCRKWkXFmlUCSyy2JSbHDtNh5vy1e8rK6J+hX8jrqDP3GNxSuBcujCMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxVZLTnDP43DAw3BRM6FabkFDDwK5zaeNBnnMMt4HOzOnjqa7P
	nbQd76yusjHxV7ciHNNPWBMiZgQFGdTM1O1MjnRv0Lu65zotZHWiF1E77VPjK5GMbWU=
X-Gm-Gg: ASbGncv1DNaaoAvTTC7GQ9b9L3kyh5nu1GF8fVgOWcc3R9fQf+xGan0Tbx6kKsSsG+X
	pdLIVkaPoQwdk6If+NzpifZPDRqmbODWtyNTTcIFUnBbD7p2hefh2lbnqtjl7yqHJ5pGaGsedMH
	PFytdkesXdWKjehkFbUh6uK3QNcqLdGzVHYeiIYvb7rAKFTUiT2DFscaDFJYwES1mQL5ClRGTn2
	HUUxIGf1wm6bU1rIaxEhu3O3mYkCBIP/jZ9xrGRfF49cDjDUKhN2SG0NbzoMLzDHVqS2Sg7Lnbc
	4KaLf8MBvqptdESMIjDtXaf1orhG2i0ikKbK46CMyyuNqkumhw6wcGtk7zis6kiRmRErBnqoRAF
	/5FUBk2XyZITbu1monltl9uoUJwTQ+jK7VhBhx1vZkJdvGstsF9QitsIoodhvY8Y2tl0p2+Yf8V
	t6PHU=
X-Google-Smtp-Source: AGHT+IFOpcvYKWkMlJyK2mXxDxQq+ubNAfPEWMp3wi+GGH8Q+VLNDw6vHTWjOZa6KTjcT/KG8CZ4EQ==
X-Received: by 2002:a05:600c:4e88:b0:45c:b56c:418a with SMTP id 5b1f17b1804b1-45cb56c440emr26072865e9.7.1756913165883;
        Wed, 03 Sep 2025 08:26:05 -0700 (PDT)
Message-ID: <795b069f-12ea-4d05-bdc4-877a6a93fe7c@citrix.com>
Date: Wed, 3 Sep 2025 16:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: avoid absolute paths in executables
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 4:13 pm, Jan Beulich wrote:
> For in-tree builds relative paths are used, whereas for out-of-tree builds
> in various situations absolute ones come into play. The extra paths can be
> long, wasting space and e.g. serial line bandwidth. They would also get in
> the way of location-independent reproducible builds. Leverage newer gcc's
> (and Clang's) ability to "remap" file names. For older gcc fall back to
> using the option affecting debug info only.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course we may want to consider putting this in the top-level Config.mk,
> to also affect other sub-trees (presently mainly/only affecting debug
> info, for which even gcc5 already supports -fdebug-prefix-remap=).
>
> As to a Fixes: tag, I wasn't quite sure whether to "blame" the
> introduction of out-of-tree builds.
>
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -448,6 +448,8 @@ LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin
>  endif
>  
>  ifdef building_out_of_srctree
> +    CFLAGS += $(call cc-option,$(CC),-ffile-prefix-map=$(srctree)/=, \
> +                                     -fdebug-prefix-map=$(srctree)/=)
>      CFLAGS += -I$(objtree)/include
>      CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
>  endif

We do want to be taking a change like this, but it's also definitely not
limited to out-of-tree builds.  I have full paths embedded even for
in-tree builds.

To be useful, it wants to apply to everything, not just the hypervisor,
so does want to be in the top level Config.mk.

https://reproducible-builds.org/docs/build-path/ has a full list of
compiler versions. It looks like we need to use both options here until
we can increase the minimum GCC version to 8.

~Andrew

