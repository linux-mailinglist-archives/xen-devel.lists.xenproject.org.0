Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AB7AB9809
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986581.1372120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqhg-0008Pl-Rj; Fri, 16 May 2025 08:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986581.1372120; Fri, 16 May 2025 08:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFqhg-0008Mf-OJ; Fri, 16 May 2025 08:46:04 +0000
Received: by outflank-mailman (input) for mailman id 986581;
 Fri, 16 May 2025 08:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UFMR=YA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uFqhf-0008MZ-Fw
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:46:03 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f641f79-3232-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 10:45:58 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-74019695377so1512491b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:45:58 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-742a982b7f3sm1058048b3a.87.2025.05.16.01.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 01:45:56 -0700 (PDT)
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
X-Inumbo-ID: 2f641f79-3232-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747385157; x=1747989957; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfzlJ/qnT8QfHcjMeisE3sUR4E0aVwvxuRWnbDCyJ7E=;
        b=N6m7peRS3KQV9Oe4FdIBiz2oXUc4e+4MAJx5USl+99N7XQpTrCUL2gu884qhRO/1UC
         MShbTkpyhy0TP7Zejiz5TUTHSdLVvTbQhL9VUIrl/ztqpyV7ikk2knzNS9JjCdwvzTI6
         3KSA8olU4CuBP207LUR9o3XeYyNbeFe5ue89E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385157; x=1747989957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfzlJ/qnT8QfHcjMeisE3sUR4E0aVwvxuRWnbDCyJ7E=;
        b=qn2+1n/8OUwfT4alzOrjkGNMcTbIKUKxn+/Li2mt2t67snFm10cEgE2M+yHEXmVjep
         592MeDJ0ge9oljRIj1OyzVIU9Ed1Jj0UjIIUrRL3/hrxTtbh9gG528XaJTXx2zLBevRC
         b8vd/iaoAecYRxffOnP8lNM7s0cwvyUNjhr1ADw//8naCZa13DUBz8kiuG5xPxa7d/Ee
         A/dWc04HYvgOOBAe0RHi2VLHxBsbAtrYMJLyh4s9+WicKKBajmJVpxD7+5aI9e111/QG
         DBLtTZ5wXIHVrsb/G6FgGeXH/Q85etB4uQuedsvPFjzPj08VkrOUzbMkJw/wd3Tv8sdN
         0WEw==
X-Forwarded-Encrypted: i=1; AJvYcCWEpCZg8Td2LMUx1/oOCgzdKo3U1Ovoq2a5TX9HaJbRL/7BnxLa0wT2bdZ0q1OgVdLaEO5dZUOL8Jk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIu+2Fb7Irr0sxGyWs+bjKUL/qrQ9c8s/aoZ64kCT07XP83z9Z
	0knIiR9hMFJkHXWG5ZFcZ/yUjV2HIcEpmBAcjnJNH6GBUX/s8k0hhvEO2Oo9HjO8SrQ=
X-Gm-Gg: ASbGncv7YtEBqepXu/AeoUaKko7IWRlcgQUTmrxxLtFxbNWPz8AwR1jhaTgLrbQiXDM
	cIkXuZew1nXBwFGJe4Si1F0y0FXh8z/iAbtXpc64pAWfNKEmbD5a1J9lu9EwjtFCf4yqBOFXJqD
	Kk0OT1SESi6lfSKauZ3noJWxp6mUbOxllr2oCjaiVHxXidpDGEQP0y+wcjgjAxmO2OQJjwdfIyR
	iHT2txL8N/a7GqR3hdUEHRpItNKK8L8IpekqNJv7dVU370rFSSwnk1roiFqCFXysPOPquwa/Id6
	a40NdLwdJXOachmb6hBVBOk+Ic+stLuruF47PDNr+dNmBQsNeP1uFvQ/ZC9KCLVnFOXkhAk7URV
	l2J8TpJNvIvF/0fgog8w=
X-Google-Smtp-Source: AGHT+IGmIYZZ/tfy+QfATAVNbxNkGtGNh6ykiLCvCMmOk7TpKYh/WhOGYWWpNPUwx/thVvfW421h2w==
X-Received: by 2002:a05:6a00:18a7:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-742a97769efmr3707070b3a.3.1747385156582;
        Fri, 16 May 2025 01:45:56 -0700 (PDT)
Date: Fri, 16 May 2025 10:45:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/9] x86/mtrr: use memory_type_changed() in
 hvm_set_mem_pinned_cacheattr()
Message-ID: <aCb7P2PWI9vBdKBF@macbook.lan>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-6-roger.pau@citrix.com>
 <df82f2bf-4992-4af2-9ffc-e734ea627a13@suse.com>
 <aCbtsaR3tj99UQfF@macbook.lan>
 <a5f496d4-53b7-4aa6-a63b-0baa1b5c24a2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5f496d4-53b7-4aa6-a63b-0baa1b5c24a2@suse.com>

On Fri, May 16, 2025 at 10:02:22AM +0200, Jan Beulich wrote:
> On 16.05.2025 09:48, Roger Pau Monné wrote:
> > Overall, I have the impression hvm_set_mem_pinned_cacheattr() should
> > only be used while building a domain, and hence the flush can likely
> > be skipped unconditionally, regardless of the type changes.
> 
> See my patch submission, which had this remark:
> 
> "Is it really sensible to add/remove ranges once the guest is already
>  running? (If it is, limiting the scope of the flush would be nice, but
>  would require knowing dirtyness for the domain wrt the caches, which
>  currently we don't track.)"

Well, I had an extra patch to attempt to do track vCPU dirtyness wrt
to the caches.

> 
> As apparently we both agree, why don't we reject requests post-creation
> then, and drop the flush? The one thing I'm uncertain about is whether
> the DM would actually have carried out the operation strictly ahead of
> the domain being first un-paused.

I've looked at QEMU, and I cannot convince myself the operation
couldn't be used against live domains, it's part of a memory listener
hook.

What is also concerning is that this seems to be completely ignored
when using AMD NPT, I can only find references to
hvm_get_mem_pinned_cacheattr() in EPT and shadow code.

Thanks, Roger.

