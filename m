Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D48178A4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656307.1024412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHOm-0001QO-QS; Mon, 18 Dec 2023 17:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656307.1024412; Mon, 18 Dec 2023 17:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHOm-0001O3-Mr; Mon, 18 Dec 2023 17:27:24 +0000
Received: by outflank-mailman (input) for mailman id 656307;
 Mon, 18 Dec 2023 17:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFHOl-0001Nv-Ai
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:27:23 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b35a7820-9dca-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 18:27:21 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so43245665e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:27:21 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b0040c6b2c8fa9sm15922513wmq.41.2023.12.18.09.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 09:27:20 -0800 (PST)
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
X-Inumbo-ID: b35a7820-9dca-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702920441; x=1703525241; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N97KJJh7YxnvzRwSNbzfg7j/XojNhy0O2qrEDAsjJiU=;
        b=JCqS1VAcz56pKgBwrgndZ1snEcYXy0vg9fQxv+0zzguV/RwZyUo9PUbzs5+TTtxpER
         2n9Cgq2pOoA0f3y/tWyAK7wtzawodV8MF7u3SV0p5Gpu2jPn8ZaBW/jhsvI1AuOdbQz1
         Pe8wgKbQtxFXaPX/4D4dA2AAfMbHmpGKJpdkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702920441; x=1703525241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N97KJJh7YxnvzRwSNbzfg7j/XojNhy0O2qrEDAsjJiU=;
        b=oM6FDxnuVgUYXVjd4/muFfu/m9drh4zpmRg49jW6pIHgC1LF0pa4nhNlBbC5O0ZaSW
         QkkvIF+4fjpgeA7bNxUCCopUV2ENPdOXgFRXkloe2hsvdtIM8qEHc7Dlgtvd+e9ysjh+
         EPATP0wN3N/l17ohHciO3pAZOxFzuCJeTtr5hukGMz+E1u+61ry6NhuvKszaG0zPEXhw
         E8M8pyUbg5CUe9MFPhN2iCh6NIYe8AdWhgy49sICL0ngIua4DjibyOxp5/XwGKcsbnBg
         K71uup0gIz+FH4/42L4GudUxSQU693L01U3oSFdtZnSsFdvCv0BM6tJivl9lfT+M632j
         Hw1A==
X-Gm-Message-State: AOJu0YwMwLugt4ZCFQYsmdfYmEod6f0TVyaYyDG2WF7sL4MPIJwBI9sh
	SvX4sPy7yiQTB0jZMNxpYclB0nfJWIUPeP+vh44=
X-Google-Smtp-Source: AGHT+IElQYDurvYnkxm8JO7CLv5Q4tWhq1E5WyvyhZx5+ZlVmBbeHVOlTtL2T6kPKgE0WhD+OtXjug==
X-Received: by 2002:a05:600c:1913:b0:40b:5e4a:40c3 with SMTP id j19-20020a05600c191300b0040b5e4a40c3mr7627332wmq.227.1702920440898;
        Mon, 18 Dec 2023 09:27:20 -0800 (PST)
Date: Mon, 18 Dec 2023 18:27:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/4] x86/spec-ctrl: defer context-switch IBPB until
 guest entry
Message-ID: <ZYCA94DyU_IlPDyQ@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <83c2a504-bce4-d3e7-1d9a-76ac0ca17bab@suse.com>
 <ZYA9ap4dB5nnFCu3@macbook>
 <c618b09d-c9eb-4f2b-81bb-18c486ba6ea2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c618b09d-c9eb-4f2b-81bb-18c486ba6ea2@suse.com>

On Mon, Dec 18, 2023 at 02:58:01PM +0100, Jan Beulich wrote:
> On 18.12.2023 13:39, Roger Pau Monné wrote:
> > On Tue, Feb 14, 2023 at 05:11:05PM +0100, Jan Beulich wrote:
> >> In order to avoid clobbering Xen's own predictions, defer the barrier as
> >> much as possible. Merely mark the CPU as needing a barrier issued the
> >> next time we're exiting to guest context.
> > 
> > While I understand that doing the flush in the middle of the guest
> > context might not be ideal, as it's my understanding we also
> 
> s/guest context/context switch/?

Indeed, sorry.

> > needlessly flush Xen predictions, I'm unsure whether this makes any
> > difference in practice, and IMO just makes the exit to guest paths
> > more complex.
> 
> I need to redirect this question to Andrew, who suggested that doing so
> can be expected to make a difference. When we were discussing this, I
> could easily see it might make a difference, but I cannot provide hard
> proof.

That's fine, but with the added complexity in the return to guests
paths I think we need some kind of justification for such a change.
If it was the other way around I could easily see it as a benefits if
just for code clarity reasons.

Thanks, Roger.

