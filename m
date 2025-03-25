Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FFA70378
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926553.1329391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx58h-000244-R2; Tue, 25 Mar 2025 14:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926553.1329391; Tue, 25 Mar 2025 14:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx58h-00021T-O3; Tue, 25 Mar 2025 14:20:23 +0000
Received: by outflank-mailman (input) for mailman id 926553;
 Tue, 25 Mar 2025 14:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+BiV=WM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tx58g-0001Qk-2p
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:20:22 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492206a5-0984-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:20:21 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso4810420f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:20:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efc90sm14057266f8f.98.2025.03.25.07.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:20:20 -0700 (PDT)
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
X-Inumbo-ID: 492206a5-0984-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742912421; x=1743517221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy08LQ5dd4JW1w0mqv3BG4JlS6pHNQpzUUnNIgYKP64=;
        b=FNo9MtkoVzMlh1gg5AeXp67HvqSV2xEPPuXTDjFvk5+jJVb2FGnQH59+eZvaPcFw+K
         t95DxMNczcDHvekj8SXkzGuUiMAg4vfZxKVG+OR2RYzYVoKyScZr6PlykInkxd+jOOKT
         WIEVbQMU4juRORQcw6mXL4PZN93vJ/ypLjmYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742912421; x=1743517221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy08LQ5dd4JW1w0mqv3BG4JlS6pHNQpzUUnNIgYKP64=;
        b=ELF/KVdaZirN5Ciy/pcJoXVkEMlggjoMmIrexMdlSvr/UtmBXnKdIjCNv9iLJ3zY8N
         PbEneU/VkQkBA0qcse2Qz2+thc5r401e59t8DxdqcD38/GcLiO9myRFG9iMFgZtH8jYr
         HqAMpabfnUoVfPfMnLURF1wm5RND/I1kIULxf2Iq026LC7AagU6G2zXoklYQSRq81IgD
         xjVjV263Oy1KNfSmmNohV7dm66/WIPcToWruSjRmYzcf5LEnDL9AE7wJIqdGjjZf022d
         JNOh2q4V5vOLlfcUKO5mWyoxWmfNY6vPyeK081xSOOOkzHRf57u9/Ttyn0r9GOWO5O1K
         BeXg==
X-Forwarded-Encrypted: i=1; AJvYcCU7qtttApWiDqG2/Nj61WprsvXW+8OzMLDoqA9QVR9Uf6V/J15FSW/MpImkx+BcPKztGn50dVet53M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysICxb9g/4WgFIok5fURIGEJCZWaN/EgDJvLsQ8HyjqYUPmRLp
	VO8ypLSOALpDXHXf21UIzgsL+85ey+cqvTdqwsAMrbNoY1IIR4dAyvMccuUPbec=
X-Gm-Gg: ASbGncsYVg1bNFzV0jjz74cZIs3Ntrz38qxWGR7fIlk6nA2+Bhc0XqIZ8Q8TyZzoITs
	wXvPj17c07KdVg3le2pnKAHhsbly8Ey9g2l2ngyyuEzk8V3tW+Fi0sbtKegemlXbj59ikQe8pjg
	YP476ny631oBmoN2zB7OHo01zrgStNYMQdHCRLVp9vExe3zDH6ipgHvYVdGpoBJjckC3FAU1h9H
	G9talmswlCR9o0laN3YGt+Y2bsPmNgMrSzweIt6DpDVrC75vwmW2Vbu57lTOgw4Um2TlxssvZwG
	A1ul/EfZz3q5RYqTj1QwwvTG8zmKtjqBkdH9bniCEmDfxXDkiH2k0ns4cjBNnd5H33K2MXdoViB
	Ofv1NKz7O2qaii44XJ7b9
X-Google-Smtp-Source: AGHT+IGNjam863VFTzeJWHYLjSD5RaUDDWfqprBKHaFZN9RzxpwpFIw30uMRXvwjVJ5sD4JwV9VA+w==
X-Received: by 2002:a5d:59a2:0:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-3997f8fc43dmr15485393f8f.15.1742912421119;
        Tue, 25 Mar 2025 07:20:21 -0700 (PDT)
Message-ID: <fdab048e-3738-4e3a-8865-41af3180bf3c@citrix.com>
Date: Tue, 25 Mar 2025 14:20:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenpm: sanitize allocations in
 show_cpufreq_para_by_cpuid()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jandryuk@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/03/2025 12:51 pm, Jan Beulich wrote:
> malloc(), when passed zero size, may return NULL (the behavior is
> implementation defined).

More importantly, this is the Musl behaviour, so is how ~most of Gitlab
CI behaves.

>  Extend the ->gov_num check to the other two
> allocations as well.

I'm not sure what you mean by this.  Only one of these hunks has a
->gov_num check.

>  Don't chance then actually using a NULL in
> print_cpufreq_para().
>
> Fixes: 75e06d089d48 ("xenpm: add cpu frequency control interface, through which user can")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The code change looks ok, so Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com> but I'd prefer a clarified commit message.

