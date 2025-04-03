Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC77A7B1B2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937462.1338430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SXU-00083B-R1; Thu, 03 Apr 2025 21:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937462.1338430; Thu, 03 Apr 2025 21:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SXU-00081C-OG; Thu, 03 Apr 2025 21:55:56 +0000
Received: by outflank-mailman (input) for mailman id 937462;
 Thu, 03 Apr 2025 21:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0SXS-00080n-Sf
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:55:54 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69f8e75a-10d6-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:55:53 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c2688619bso917429f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 14:55:54 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226f2bsm2805855f8f.96.2025.04.03.14.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 14:55:53 -0700 (PDT)
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
X-Inumbo-ID: 69f8e75a-10d6-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743717353; x=1744322153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jEk4p1EGuiNew82uYqfK9X7g/oQhrIPhVM+dtL/2Fpk=;
        b=idR9Ld8lmLEcj+WMZ0xkIXiS9t8mk5eQSS88RuKMXHonixGTNvfY9jVkfQ3N/dGXwF
         t7ZiUbHdxoTk/QcHOM6qXJbCsDGHZiLVQ+k0wK3e3AbOwvkIHz3vkb3sXMdcGA7YTHFr
         KaQHGe3v2eoM4amfaVPBf4F0rcWhr9V3HSAsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743717353; x=1744322153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEk4p1EGuiNew82uYqfK9X7g/oQhrIPhVM+dtL/2Fpk=;
        b=uoxSs+zQLXHfssuhv8S4AOPRXWt6D6y9mEvRZK8I+qoOiaoAQdpcsoXLwrtd1il6e+
         zInEFTk+zwWVuCcdWw4WVQZpExXMAO+/4mzsa3B3JI1NRqqwYbtrphzBFpl1FJvCeWCj
         l5TlyXD8MA/tJRpM9DQzhlUPwupmqtSeT9rOCSUrj+b2EnSN2Y21uTTwx6mC4d8C0b5P
         8cV/E0RTkYFpU34+Ds23M4nnV3qdvxS0O+TLnQaThSMcOiYdI7Yx634TdrncgJfOXtE5
         7IANcFflCtMi9eafC2WmxGFcXPx0q9R1ptL6QPQA8E+ge1OphFkhwalOczfCLbgrqS5H
         1l+w==
X-Forwarded-Encrypted: i=1; AJvYcCWgHL/GgUXLRThxxBF+nixURH46sFmkvE11K40nqnxuv63Tlq0hnAAj+8TQQHHh12JAtqxynRiBCSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcPOZ7iRTPoSybfcIe7EESMCBSxLcWgqm5AdSoEH41NwlJ5wkT
	Ddr6+tyKtc4vKYU5HK1C7FFPx5sEBsgM5zvdKZIjESoMQsMOadyflTIh0KNpbI4=
X-Gm-Gg: ASbGncu684g1s4UVXQxSXI1bQL/iaTJEqGpS/aif88+S0CJpxtmz+WcnPoG5U5FzqDm
	qTO+zoa4fIH6yvrh8tGy8lNatIkpbBHgyNchroEB7tCS6PB1M1t6IgSDDnWhcQuLbKTydjrS4MB
	DzwkoJsRZnjPrAzT9RTHmHcxjSZIEF808W8Vs7QTCIyvDTxj86LaLiaQ95pc9uEF1ue7nqHxcOE
	o8GgMOTkOPEVv+N6j4621Gd3MRny8z63hvPxumY/bQKFX/IuJJuKGy0tzxPaahXBQzk0szklSu7
	qHOK3k6rpk+hnN/NFQF8kAi7NXKv6wCj1gxEHP+VOJiz4djulK3681K4fzpNC50bw2FxECH9hkj
	vDlI3NQ03D4jurULrg6H+
X-Google-Smtp-Source: AGHT+IEQ/G7fCl/PPMw5NWlIu7fUiuVmfVEGcS4iKpzVyES71q32bO3lGKhkUCNTFKq7nw6/a447pg==
X-Received: by 2002:a5d:648e:0:b0:39a:c9ae:9efe with SMTP id ffacd0b85a97d-39cb35be4a0mr720993f8f.18.1743717353435;
        Thu, 03 Apr 2025 14:55:53 -0700 (PDT)
Message-ID: <ddf63f06-4b27-4113-b407-102afe8dd59c@citrix.com>
Date: Thu, 3 Apr 2025 22:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/amd: Add support for AMD TCE
To: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech>
 <73b1dd32-c15e-46c4-982c-9b7a33c8785b@suse.com>
 <463eca2f-9e2a-474c-ae5a-4ed6cfe01ff8@citrix.com>
 <7056c584-a95e-401b-bb35-e5d0e4171878@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7056c584-a95e-401b-bb35-e5d0e4171878@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 7:36 pm, Teddy Astie wrote:
> Yes, while proving it on the hypervisor side may be doable, I am quite 
> unsure about PV guests.
> Some calls to HYPERVISOR_mmuext_op incidentally call invlpg and alike 
> which could be affected with this change, as the guest can "assume" some 
> behavior aspects of invlpg.

I wouldn't worry about PV guests.

They have to delegate TLB flushing to Xen anyway, and already don't get
to choose whether Xen uses INVLPG, or INVPCID, or something else to
perform the requested action.

We've e.g. switched from INVLPG to INVPCID as a consequence of Meltdown,
and nothing exploded[1].

> Aside enabling this flag for Xen/PV guests, it can be useful to expose 
> it to the guests. While it's currently not going to change anything as 
> most of the related instructions are trapped and managed by the 
> hypervisor, it does affect the behavior of inside-guest INVLPGB if 
> enabled in the VMCB.

Good point.  Linux 6.14 does now use it when available.

You should split this patch in two.

First patch exposes it for guests, so use an H tag in cpufeatureset.h
(available in HAP domains by default), and adjust hvm_efer_valid().  I
think that's all you need to do, although remember CHANGELOG.md.

Then the second patch turns it on for Xen.

~Andrew

[1] Well, XSA-292 was a spectacular explosion, but we fixed that.

