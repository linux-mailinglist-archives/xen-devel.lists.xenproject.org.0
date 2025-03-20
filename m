Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2308A6A670
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 13:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921988.1325867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFJY-0007Gh-Fp; Thu, 20 Mar 2025 12:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921988.1325867; Thu, 20 Mar 2025 12:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvFJY-0007FF-Cn; Thu, 20 Mar 2025 12:48:00 +0000
Received: by outflank-mailman (input) for mailman id 921988;
 Thu, 20 Mar 2025 12:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvFJX-0007F4-B8
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 12:47:59 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b8ae4c5-0589-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 13:47:56 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so407395f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 05:47:56 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975bdfsm23373069f8f.49.2025.03.20.05.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 05:47:54 -0700 (PDT)
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
X-Inumbo-ID: 8b8ae4c5-0589-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742474875; x=1743079675; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ohDvokwzOA342grvJiU5s975o/nWeqrqF4AM2MGd/hI=;
        b=CSak0PzG6BbAhdArtYibtl/qmW+zIXtKndgwiexq7qQVgLPuJ1EVvNFMY2j9pvjUQf
         7/lUBf7L/DDV61WuWw4AYRDXiLN3b7+NJ4qsDpu3wDGyXk11wZm1AbzWP2wJ8NQTB+lq
         8fnBHlk6Kz5TaceZDhjuaAS0RgucZYV/fCkF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742474875; x=1743079675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohDvokwzOA342grvJiU5s975o/nWeqrqF4AM2MGd/hI=;
        b=EKlscP1a4Hsc+KkfEMtdaaFATOXMSDuWnpctuIchOwN4+uQu9RB1ojC7t3NMQ6qqPj
         eXYufF/IUMbYnlCCPUPEHLLnx6mVM2nztQTzx98EkdT6PQxZ20rBH7H+2Grox2fAJGdD
         0zu8CaYqL1F2E597HW0DtNndWu/d0pzdQj6wQL8i0lI+vgJIZZLtj35Qj+2pYB0S5jlJ
         lG4KtaGFbqAViqMBhzFKG79QF14V3gI7YjRfi2KFte5XvH+TOPeoY54AKN7KKnaMzahJ
         d6nADqDnaJ89w4R/dvWkuavy0mlLXTvQRx2XQsKnWE6h3N74T3Ksw8M44/XYNQCLP/xC
         7eTA==
X-Forwarded-Encrypted: i=1; AJvYcCW1P2YxULM8xiK7yfEuiD+yp/jd1msgiODAyj4rEvEa85wWceNfvDJE5lseAiiS4os+RFXKzU6ZDjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5E+5wmFl9yFKMfnTf56iBLLYkmscp+5IXXIb6eKBbeAEyzSi9
	hMf/e9EWChRoiS3RJnq0UmuyyCDDuq2ILLFYOT1T/mUbJRtpeXETjKDQV+uOn9I=
X-Gm-Gg: ASbGncvx568HwMSD/ku0dkmCRbHB4wcTta+OCxkLz2hPwoX4NreprKVCoOt+KliPlhj
	k6HJSSi++ksvP4w76u9VLiMkWUI+qLUajkHOxRjaYRX5MFeCB7+BPnJLy3D1HnfuBd2gd0QBwOI
	488NWadupdROfE7iZQDO894IXipe7vVk++HeiB5J3N7s+7rPKTT/5p690xQvJtda1FEs7E/R9gN
	bOFuoATDUFzVlmJPNEw6uGvBwfpC6l3WKWPFCraRpcSrIbok6JIG9KnbHos4OF7hMfgCPn42dBp
	KFKEzPMgDopWqdJatvGQuhtkPwrwXUGVjlfNqvEZ4hfvhatUv6aBOKGX9mdkTuELHi8NkswLYu7
	1z6bpUO0JNO28VYZ2vXpG
X-Google-Smtp-Source: AGHT+IHsR1IHYUZjKSneWnIRuObsX5ubhxFuDOJ7xXuHTUrmHVBnKN3mQxQKxrdLxeg+UUS+KcFo8Q==
X-Received: by 2002:a05:6000:1545:b0:391:4743:6de4 with SMTP id ffacd0b85a97d-399795e7623mr2637545f8f.50.1742474875325;
        Thu, 20 Mar 2025 05:47:55 -0700 (PDT)
Message-ID: <b11d8525-13b4-40a0-8e33-b37c7e0d85a2@citrix.com>
Date: Thu, 20 Mar 2025 12:47:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] process/release: mention MAINTAINER adjustments
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6cc3adc1-5d54-4880-b3f3-2f688c2f39fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2025 12:12 pm, Jan Beulich wrote:
> For many major releases I've been updating ./MAINTAINERS _after_ the
> respective branch was handed over to me. That update, however, is
> relevant not only from the .1 minor release onwards, but right from the
> .0 release. Hence it ought to be done as one of the last things before
> tagging the tree for the new major release.
>
> See the seemingly unrelated parts (as far as the commit subject goes) of
> e.g. 9d465658b405 ("update Xen version to 4.20.1-pre") for an example.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As can also be seen from the referenced commit, the document already
> saying "drop any references to the specific commits, e.g. date or title"
> hasn't been honored in recent releases, at least as far as
> QEMU_TRADITIONAL_REVISION goes.

Oh, lovely.  I wasn't even aware there was a necessary change like
this.  Also, I haven't made as much progress rewriting the checklist as
I would have liked, so it is probably best to insert into this doc for now.

The qemu-trad comments I think we can just strip out of staging.  We
don't have equivalent comments for the other trees.

I'm not sure if it's useful to delete the check-in policy.  I think the
note at the top listing the backport maintainers is good enough.

~Andrew

