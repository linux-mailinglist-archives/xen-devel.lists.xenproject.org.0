Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3797FB8FE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 12:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643034.1002885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vvS-0000cQ-HE; Tue, 28 Nov 2023 11:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643034.1002885; Tue, 28 Nov 2023 11:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7vvS-0000ZI-Dc; Tue, 28 Nov 2023 11:06:46 +0000
Received: by outflank-mailman (input) for mailman id 643034;
 Tue, 28 Nov 2023 11:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7vvR-0000ZA-Do
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 11:06:45 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3690e36a-8dde-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 12:06:43 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so3664651f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 03:06:43 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b003330ecc3907sm1324674wrp.44.2023.11.28.03.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 03:06:42 -0800 (PST)
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
X-Inumbo-ID: 3690e36a-8dde-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701169603; x=1701774403; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4544Fpr0xpXzSsGII81PnfJdRXQwcz4p3qozKAwiwGk=;
        b=L0ywxj+trRxjSjFd6jYdMDmwEjJNyZVqiIR571wU5HC3o9LKd1XUNg9uSwDYcP4x5N
         eTNSp9C9/GPW5h4D7etkLIjYkxvNnAGlQufV8fGvCCuxfu2KSkduvJoBD5CfqmkRll0i
         v0vc6FejYEnN1H0BNLPVv7hkI4ZcNa+9EFtqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701169603; x=1701774403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4544Fpr0xpXzSsGII81PnfJdRXQwcz4p3qozKAwiwGk=;
        b=JNpf9lEgsFUWv5s8fgXTUbQSZFRvnceD4cUavaAoAl6oi+xqWyO1ah+1xDK1dm+dD1
         tEH3PT3URIw1P1+2h3sTQthcD4WaLaL4svVtPIWnGdbLzhePiEKtvkieytv7vximh0fH
         zMTpuFcJ83fSNYoMdJAX7F4aeZrCfxJfQamJvQurFXAWNxDZkjN+Jf38b8iYo0K6XZKI
         D3XeSRQvJ/2Ys8aehit+FVKIMJoSOqrZcoCM/iFBECA88W2mVnk6jw94J7pbDxOu1ps8
         do0AsLyJdlu2ruYBQkNsQsiMK/YclIHJrMvugdnTLK/a/p04Xh4jj3AXPUXb/Bh/Ah99
         jyAw==
X-Gm-Message-State: AOJu0Yzc2vys9ooq/nXbKmNL8h0gkG5vCsm9f/MtUltufnYvcm1ZYPlE
	IrneXNSL8syf4Fv6EifO8c2R7Q==
X-Google-Smtp-Source: AGHT+IFtDYyljvWb3A7bJ1Us43VzQj6a6DufjzkHfU8NxQpzEuoUTLtz6a8kXHUUqQujHrcwJK3N7g==
X-Received: by 2002:adf:eacd:0:b0:332:ced7:56e5 with SMTP id o13-20020adfeacd000000b00332ced756e5mr10461289wrn.13.1701169602916;
        Tue, 28 Nov 2023 03:06:42 -0800 (PST)
Date: Tue, 28 Nov 2023 12:06:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/xen: fix percpu vcpu_info allocation
Message-ID: <ZWXJwf4K4FOWSmK5@macbook>
References: <20231124074852.25161-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231124074852.25161-1-jgross@suse.com>

On Fri, Nov 24, 2023 at 08:48:52AM +0100, Juergen Gross wrote:
> Today the percpu struct vcpu_info is allocated via DEFINE_PER_CPU(),
> meaning that it could cross a page boundary. In this case registering
> it with the hypervisor will fail, resulting in a panic().
> 
> This can easily be fixed by using DEFINE_PER_CPU_ALIGNED() instead,
> as struct vcpu_info is guaranteed to have a size of 64 bytes, matching
> the cache line size of x86 64-bit processors (Xen doesn't support
> 32-bit processors).
> 
> Fixes: 5ead97c84fa7 ("xen: Core Xen implementation")
> Signed-off-by: Juergen Gross <jgross@suse.com>

FWIW, on FreeBSD we also switched to the same approach quite
recently:

https://cgit.freebsd.org/src/commit/sys/xen/xen_common.c?id=20fc5bf7df1db698f2651eaa04a3bc71290e1636

Should have checked the Linux side, sorry.

Roger.

