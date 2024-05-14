Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F98C4EDE
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 12:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721373.1124775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pIL-0007f3-DF; Tue, 14 May 2024 10:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721373.1124775; Tue, 14 May 2024 10:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6pIL-0007dX-9Y; Tue, 14 May 2024 10:22:05 +0000
Received: by outflank-mailman (input) for mailman id 721373;
 Tue, 14 May 2024 10:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6pIK-0007cf-0z
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 10:22:04 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdc00472-11db-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 12:22:02 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-34f7d8bfaa0so3825610f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 03:22:02 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a7907sm13238777f8f.63.2024.05.14.03.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 03:22:01 -0700 (PDT)
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
X-Inumbo-ID: cdc00472-11db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715682121; x=1716286921; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9aEqg3pai1C+QnmBjJjdlQhpYcDZfyz4ua4D3W/WOTU=;
        b=O7sUvMNIoQkGHVwor8aHmQF279nl0r6sKY1I9n+ekpbZoO8VD2AUQNRLa2p4Pqw0Uz
         5wsFFde7DxrFEHXRFjask9wMm9UK+8CU1l8AFmPhmMwcZe8T+uOdTDLFwG+4i7m58hRa
         C506vbFR8bpVqbz/ICEj5DwAgxZj2VQ1ZhfNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682121; x=1716286921;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aEqg3pai1C+QnmBjJjdlQhpYcDZfyz4ua4D3W/WOTU=;
        b=PV8ki54QXiNNWm7yoB/g3OmuxYiEQetMmjKyPinW5Zmx4hXkUMsJBZnrCZq52CJ7Me
         cCWYpcWzxPUnUfR4vZJACVOeGx+pWQWWGkP0tPtf57Ipw0fMxfLDhIjg74O3Li6BkWrx
         xpERIldD+jXJ6mjyoVhDIIm7TFvTAbCcG9vmQcNSXoqf9LLUK1abNl0P0ttlYpfhp+dT
         bSKho2g37E/uqfCYE8pD4AEwR7XiKUsNIwiRBX8vggFHlER2FBbqtmfJwT2DyveRwnoI
         ZstEr2GWNtKgvwnCKbCU2D+IGtfTmYnlP5eWmb1j/heaWPHNHjcEZ/0IW+O73Dg46wFT
         QZQg==
X-Gm-Message-State: AOJu0Yw8MWLg4VhNbIQLv3OMF6hhXtnU0kFeOpaGNoWNdoT7Wis93n9T
	qBwpsCQLRG4Q2NY4XgEMYelIvZAO/JxMxVkIhxdhQGRl0ob7UdCE7NMrbGGUfgM=
X-Google-Smtp-Source: AGHT+IFnCiHBLTKR5f4oq97PkKZYHF/SRzm/zZi1Wq8WEO1cgwZjJoaSBOxz8DBdNbtJo9d98hggKw==
X-Received: by 2002:a5d:550b:0:b0:34c:67d6:8dec with SMTP id ffacd0b85a97d-3504a62fec5mr9690654f8f.6.1715682121494;
        Tue, 14 May 2024 03:22:01 -0700 (PDT)
Date: Tue, 14 May 2024 12:22:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH V3 (resend) 07/19] xen/x86: Add support for the PMAP
Message-ID: <ZkM7SK8U1Qsk7E3x@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-8-eliasely@amazon.com>
 <ZkMxgDPYgaKnmRRE@macbook>
 <87950da7-f765-4656-808f-6c63a29ced3d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87950da7-f765-4656-808f-6c63a29ced3d@suse.com>

On Tue, May 14, 2024 at 11:43:14AM +0200, Jan Beulich wrote:
> On 14.05.2024 11:40, Roger Pau Monné wrote:
> > On Mon, May 13, 2024 at 01:40:34PM +0000, Elias El Yandouzi wrote:
> >> @@ -53,6 +55,8 @@ enum fixed_addresses {
> >>      FIX_PV_CONSOLE,
> >>      FIX_XEN_SHARED_INFO,
> >>  #endif /* CONFIG_XEN_GUEST */
> >> +    FIX_PMAP_BEGIN,
> >> +    FIX_PMAP_END = FIX_PMAP_BEGIN + NUM_FIX_PMAP,
> > 
> > This would better have
> > 
> > #ifdef CONFIG_HAS_PMAP
> > 
> > guards?
> 
> That's useful only when the option can actually be off in certain
> configurations, isn't it?

My comment earlier on this patch suggested to make CONFIG_HAS_PMAP be
selected by HAS_SECRET_HIDING, rather than being unconditionally
arch-selected (if that's possible, I certainly don't know the usage in
further patches).

Regards, Roger.

