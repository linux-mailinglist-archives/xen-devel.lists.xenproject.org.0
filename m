Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45743B0F1C1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:58:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053841.1422638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY6j-0006ZB-Vd; Wed, 23 Jul 2025 11:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053841.1422638; Wed, 23 Jul 2025 11:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueY6j-0006Xb-Rx; Wed, 23 Jul 2025 11:58:01 +0000
Received: by outflank-mailman (input) for mailman id 1053841;
 Wed, 23 Jul 2025 11:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueY6j-0006I5-3m
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:58:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47355068-67bc-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 13:57:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso6167680f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 04:57:59 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca4d74asm15965745f8f.63.2025.07.23.04.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:57:58 -0700 (PDT)
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
X-Inumbo-ID: 47355068-67bc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753271879; x=1753876679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ABw393hUcxLFal2Ll/gqw3DAIer68JomaxCS6ojv7E0=;
        b=dQIKu0JOTGJM4ull+C2tY/n6zlZMR0CE5av6thRyIV5NsJlUV0ltZUjGJy+WbEgUqy
         ndPKnFTG4L3D5aRorzfCjv/X7zdVIxczoh3/Xo7CMqKTDRgg9SLTBFTJWDn/2Lkgeq/u
         07hjRev+gEllib5xrxL8VsjGDe8rqswO5JSFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271879; x=1753876679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABw393hUcxLFal2Ll/gqw3DAIer68JomaxCS6ojv7E0=;
        b=rmYlviCNTMPRbUckdAvcy//PpS2aIzdurjFmBDxEvQlBya3Eho/y0pRx++4jQeWThQ
         S9S7Ivpe43gs4B3N2h8FrfXCByN+JE2jPhZOZgMCXBI+P2mK1vLJqEMFyo5hB/tJCzmv
         OkA5KwkjqWWVYic6jI03r1f/p3Zb0yQnVuwsqAiBvCPYdLjscresRuyQwNT699k1hjeK
         tfS1MRGnc8PjFu3CuAnstk2f7RUaCw7pR0cy55zJiK0++ScVFQ8g6GI7vZ7AXPnK3FWt
         rgdU7uVY33r1OABeKgtafkmFQQN8ktDb8LXuJaKWUuSlzxsy/qE+tN0AWTcrovK3s+7g
         KCNw==
X-Forwarded-Encrypted: i=1; AJvYcCXkUQ3NZHySz0oJ/P9NYbwn2HUcEEWACGt/AkedxxwfAdvflkj+ZkGD7yGDTa0Iu6bt78pxAGqn1yQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLI+0otGlCEK2HLBRwJoKkvwOSQzRZvGBYSrcBXiZvHhtDoisG
	A51WG31GHs88k7e8tWtLKfhx7lp4LogsAdmrgOzq26xfXANAQ+cYcT6crWcG/TKpD0s=
X-Gm-Gg: ASbGnctFgnWHyK/50299qrZrylHPrC8fqzVdzP7XWSiQK75+Z0p072FdV+WDyP8Be0j
	pcq+yxs2tjn5ZmHXAZObCuWLHc1gf0+X7WsCL9s8CamApUTM4/Vgkc2v/c8+83meCxtVlbHnTj2
	9DWElrTFcmgBxHRdVfEZX2TJeopjPMwAiLR1gTLQaKjoQyGTrXUyyI1TFwEY14Vgk0sWB5URcuN
	6UbZHyBCkaDyGTVH6o/1BcBjrM+p3USZA9CiZmwOCfzdWRnlYvVBsVaRCJdIRhjU3ysTA7SGp26
	Itm4V0R7JdSqmtMHYgIBjeTx/gp4d3o/x1ti+qdj8G0d6kHksHNm1WTS97Kr938ILShqhfS1W9t
	+fQ94hqltR033CI66o7Ahjr57p+USzoXauWqpKmelwg+X7DYF2/GID1ezJgTgKlL/JSy1
X-Google-Smtp-Source: AGHT+IEPTv3oxH9VqnA/jK7J3N+yh+ukjZcl5u+hYzmoQkDttk4JuyL+y9uFmc+PaoDOQPAtf0i1YQ==
X-Received: by 2002:a05:6000:40c9:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3b768eedf61mr2694670f8f.21.1753271878950;
        Wed, 23 Jul 2025 04:57:58 -0700 (PDT)
Message-ID: <da18408f-3f6c-4e8b-b277-fb18c98517b4@citrix.com>
Date: Wed, 23 Jul 2025 12:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Replace do_sched_op calls with their
 underlying logic
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <584b490f7f26a746fd2c74be977a4769f73880bb.1753261165.git.teddy.astie@vates.tech>
 <01989510-d034-4a36-bced-fda8b8dbb537@citrix.com>
 <477216c8-f31d-4f85-a743-aeba6d434ee0@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <477216c8-f31d-4f85-a743-aeba6d434ee0@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 12:57 pm, Teddy Astie wrote:
> Le 23/07/2025 à 13:16, Andrew Cooper a écrit :
>> On 23/07/2025 10:05 am, Teddy Astie wrote:
>>> do_sched_op(SCHEDOP_yield) just calls vcpu_yield(). Remove the indirection
>>> through the hypercall handler and use the function directly.
>>>
>>> Perform the same for SCHEDOP_block.
>>>
>>> Not a functional change.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>> ---
>>> v2:
>>>   - For SCHEDOP_block case: export and use vcpu_block_enable_events instead
>> You need to adjust the commit message for this change, now that you're
>> exporting vcpu_block_enable_events().
>>
>> With that adjusted, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> If there are no other changes needed, you can propose some updated
>> wording here and it can be adjusted on commit.
>>
> Are you ok with
>
> Export vcpu_block_enable_events() to perform the same for SCHEDOP_block.
>
> (in place of "Perform the same for SCHEDOP_block")
>
> ?

Yeah, that looks fine.

~Andrew

