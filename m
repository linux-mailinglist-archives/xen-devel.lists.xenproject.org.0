Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2DA1D409
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877564.1287698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLys-00072q-6h; Mon, 27 Jan 2025 10:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877564.1287698; Mon, 27 Jan 2025 10:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLys-00070y-30; Mon, 27 Jan 2025 10:04:34 +0000
Received: by outflank-mailman (input) for mailman id 877564;
 Mon, 27 Jan 2025 10:04:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIzP=UT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tcLyq-0006T8-3s
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:04:32 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c63e17-dc96-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:04:31 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2eec9b3a1bbso5714349a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 02:04:31 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa49225sm6705332a91.9.2025.01.27.02.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 02:04:29 -0800 (PST)
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
X-Inumbo-ID: 19c63e17-dc96-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737972270; x=1738577070; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pX0/qUEd7ANo7X6r/6O/NY9oboJ6WoFPfvzM5ggo64s=;
        b=lWZz9j+YQFLQAaVlDVTr/kOhp5VZU+HvHMUBOxLblAUH4HSCchg51hzTl7I8BpcGGq
         xsP3SC9HRDSswxikIWDjcseYF79iNBIukieuK4moq3q/KdofCWNBVydDcT8ThWs4WSGm
         bZjL1f/xhS9ogIaGfVpATP4sEr58PNgjaYCgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737972270; x=1738577070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX0/qUEd7ANo7X6r/6O/NY9oboJ6WoFPfvzM5ggo64s=;
        b=rItlg3/BOBanaGIbiteK+r4nv7uV5DmD+7nOUzQEPi2lCgl/Hq1Y1C4CdJ/49nCerk
         nUqG1GvsFDa/QWcjoTRFLOoPGi5g0hliYKhGJaXKTayKc9IRJEq0xViWM/4deobQnxht
         3Umt6l+UF2TsYEV/4vZVDMKVyxT8WXa0/f2q6v3Ha8SsuTkpBBb4ty/B72qDCmyzg/39
         lkGpjyfqp4wbpqf4mEHWmtER8Cotm39vCHf46FFrEwhwJAQxYvo8PQ7YneEoEKmJqI3R
         1nk+ZGWUfKpgvTzH3tUMvX0vT6Ki1btd7qPWvM/TonGLwABzi2urdow/6C2QyTldRjOp
         WE0g==
X-Forwarded-Encrypted: i=1; AJvYcCXFo24LwmeEl1hk/MAgrna89PPmLSJdCqECOUi2U2Ld7J7kZB38U4iw7Kn/TNjdkVmsEAGAxnU7Qas=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbTmbe8KkUNFECvRuBXj0XoAD76zsWFUqu5c1G7tPCH0LUi0N7
	ELIgZZdJat5KDk2Jrnc1pDABj36Z2qY35YhVMftAYhaVFCg2ZjzQpERyxPyZiU0=
X-Gm-Gg: ASbGncvd52WS61RIL8PpWGt+cn8URm2Lwvrx1sKmG0pHBdzgz/4zXK8mND+NqtmgFkA
	s4K09wUwNmQRSRHDgciXh/uRh6SBhcfx8g7Be3eIBttEDbGLscE9w9uWIWCltk4ZPHaTNKRhwlz
	6WdCB0W5JgsbJvL1sFclXDUcgxnDhKCE85TarA11nTsBVk7jVikiWRgymL3Cwy+WGs2zjXKdAb7
	JCDbBiDU8H0TO1cmuxvAnbXi17yDkLpHLyiZaE3VEEzUASsQg3oss8XbYtsKocR01upzxzGbEZe
	tU1zTFFk4b7iSQA=
X-Google-Smtp-Source: AGHT+IHj6shJN442tHY2Y15siUQ1oeCIHxCLHUh1aM7+1qc1YxN4mN8KGhr1KhXEkj6zh5mx9MaHXA==
X-Received: by 2002:a17:90b:54ce:b0:2f6:d266:f467 with SMTP id 98e67ed59e1d1-2f782d9eb89mr51815166a91.34.1737972270175;
        Mon, 27 Jan 2025 02:04:30 -0800 (PST)
Date: Mon, 27 Jan 2025 11:04:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/5] iommu/vtd: remove non-CX16 logic from interrupt
 remapping
Message-ID: <Z5daKcD2hwIfqC8M@macbook.local>
References: <20250124120112.56678-1-roger.pau@citrix.com>
 <20250124120112.56678-3-roger.pau@citrix.com>
 <5395ceb7-60a0-471f-ab23-451ac7937873@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5395ceb7-60a0-471f-ab23-451ac7937873@suse.com>

On Mon, Jan 27, 2025 at 10:52:47AM +0100, Jan Beulich wrote:
> On 24.01.2025 13:01, Roger Pau Monne wrote:
> > From: Teddy Astie <teddy.astie@vates.tech>
> > 
> > As CX16 support is mandatory for IOMMU usage, the checks for CX16 in the
> > interrupt remapping code are stale.  Remove them together with the
> > associated code introduced in case CX16 was not available.
> 
> Perhaps insert "now" before "mandatory" (then also in patch 3)?

Sure.

Thanks, Roger.

