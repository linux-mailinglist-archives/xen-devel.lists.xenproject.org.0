Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B68B1CA8E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 19:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072055.1435385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhn3-000549-AW; Wed, 06 Aug 2025 17:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072055.1435385; Wed, 06 Aug 2025 17:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhn3-00052V-6m; Wed, 06 Aug 2025 17:19:01 +0000
Received: by outflank-mailman (input) for mailman id 1072055;
 Wed, 06 Aug 2025 17:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sNe+=2S=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujhn2-00052N-70
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 17:19:00 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70174fc2-72e9-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 19:18:58 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so1144085e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 10:18:58 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dd85f423sm117872045e9.18.2025.08.06.10.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 10:18:56 -0700 (PDT)
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
X-Inumbo-ID: 70174fc2-72e9-11f0-a323-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754500737; x=1755105537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fycESYHvMlXY4+OXo1c6bZ155av+Ka8X4doJs4DZUbA=;
        b=QQUMY02xjNDFGUZtHxZvR5543qgfu/hVe+GsNF6ngGC9zMyVVJRcjXZHoOojBg0rrT
         mhR8f0mbCGzKrviQm8zbYc0scUTS5oeeWfC2wdZUja3pEgicHUAMOftD5bOy21lYezk2
         rtJ5j8NJRZclHRkvOkc3MHzofuPieuKQV5D7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500737; x=1755105537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fycESYHvMlXY4+OXo1c6bZ155av+Ka8X4doJs4DZUbA=;
        b=uJxY5jcIL3Ctqp6zaDKSxREmIKjZ0NMRd4HIUdoUBJ/wpLwvXDwrHmQ81W5X2J32Z0
         9zPN7nNvWrexaFiQQ/Smzd+bzqk5+xp4RdrvDeY0fKycnJ8XLXF5/WNxUzljRViW9spg
         /CH1Gk0ILo1c2oirdIv7mJFusH25HLrX0l3mirdVKMU8EyfYOwGRBWpDzuccrzJFBuTY
         EEQmqfx2ZDH+rhGuZVkf+f1keQjABSRKr5HSPbxk7od2iZ3QKJ3B2P8Un3FemG4gLq2k
         HrszV6JtLpcdl7Pm7HT4UslqkPOVcZlKfrUvv10eXlvD0OpNncByM/ALRlR7pnKLwxE1
         CA/A==
X-Gm-Message-State: AOJu0YxteM4i2NhzrwLZadKWbI0HtlEh8GS5Z3zkn9EYhFBaM9x4Mkvv
	bjtFHM9OMb0ahlglaKVf1n5ZCOHLWPXLcfRO/vEQeq08QWfLnJnjwPvRI0Ykv8qtN8+IcuCDFfE
	EtqSZFVU=
X-Gm-Gg: ASbGncsOtGKMLFvo0qXh+TpLMCD2J/hjODV+LBR0J+/6C68uOUTpBzOqV5pv9lssa5R
	xZCNSvM1dXyPw+GHhlzmU3kWsx1zIrfnlZaprbHfXMwq78dLqO81Hfj7Z8/nrQ5CHGQEJnbx50C
	4zLVThenL0DyZSfPd9xXCRMuO9WNcaoO003HC4XGp0x/qWvodJotU3iH6DNPMduyRjTqdQSkRrK
	Z2+q17fZ8i5at29A2EYQrWfiL7djpo2AjnqvPpcJakiBL9E1p9OxmbaGmBbnq2ZKdMS1dgRKT75
	zOKmW00kArxUJvGv9vS1lNtWU9Ml4xNsOoSfHILdEsl6zh3tLzo3g5NqiRxADyOxUY/5gAFgroR
	3Po4szjLvM9fEi8O4OtRaW19K8MqWtg5LyviHNwicoVTGdG4px3OcsP9f2B/lPT2BRvez
X-Google-Smtp-Source: AGHT+IEmbrkZiMfmYNE3BzYKROfhK+cEN+E91S0UnGhWVCXUWcoo0liAAb475aoyuPryIUW7BpUtEA==
X-Received: by 2002:a05:600c:198a:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-459e70ec7e9mr31249545e9.21.1754500737539;
        Wed, 06 Aug 2025 10:18:57 -0700 (PDT)
Message-ID: <f66d1f51-61fd-4fdc-99ac-74411d1ce888@citrix.com>
Date: Wed, 6 Aug 2025 18:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Reject XEN_DOMCTL_hypercall_init against
 oneself
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250806165543.169140-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250806165543.169140-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/08/2025 5:55 pm, Andrew Cooper wrote:
> A toolstack is expected to use XEN_DOMCTL_hypercall_init where applicable to
> construct a new guest, but is absolutely not expected to use it against
> itself.  Kernels have a stable ABI for accessing the same functionality, via
> MSR 0x40000000.
>
> Found when auditing hypercalls for Host UEFI-SecureBoot safety.
>
> Reported-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>

It's worth nothing that the observations which lead to this mean it's
impossible to support multiple TCB domains without Flask.

Imagine that we did have two control domains and they could operate on
each other.  It's inappropriate for the domain's kernel to be auditing
which domid's are which privilege.

Flask can let Xen express that level of control, and in practice the
system would need configuring with a privilege hierarchy. 
Equally-powerful domains which can operate on each other simply doesn't
make sense from a system point of view.

But, as Flask is not supported yet in Xen, the Host UEFI-SB security
policy is going to have to be limited to a single all-power dom0 in the
short term.

~Andrew

