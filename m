Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5EA1261D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872615.1283585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4TX-0003J7-NX; Wed, 15 Jan 2025 14:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872615.1283585; Wed, 15 Jan 2025 14:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4TX-0003GT-Kf; Wed, 15 Jan 2025 14:34:31 +0000
Received: by outflank-mailman (input) for mailman id 872615;
 Wed, 15 Jan 2025 14:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KZm5=UH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tY4TW-0003GN-1T
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:34:30 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d270db67-d34d-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 15:34:27 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa6b4cc7270so972277466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 06:34:27 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95624ccsm758876866b.126.2025.01.15.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 06:34:24 -0800 (PST)
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
X-Inumbo-ID: d270db67-d34d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736951666; x=1737556466; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7++nirqBdRkMi+YWr9wvpdbbsVplcj+nbvkw0Rns88Y=;
        b=ji2Q7BzULZwShqJp6EfFrtyTttkWo7puNXu9aYtE4hLfiyWv8olLBBhvOyjoNvALcA
         V7fu2l5jH/TJcIcNb8c/gELQ+sYo+1CsDPx0tZASQlfAy9YNZtu7HzS7BPF6AjTR6SlY
         KU3KYSuJW8zv9KzKsFqJGl7pR/SxTXTC04CzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951666; x=1737556466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7++nirqBdRkMi+YWr9wvpdbbsVplcj+nbvkw0Rns88Y=;
        b=u6pt6adhXraRsb1a4RKy3nBs9OUBsADApxMK3lyujagtXZOaCklx98S16ejgUJO+Zr
         QgBtxNLeYEoEsxTHwUngBbGInrcTcpnFioZziqt2Sw44n/jKxIa1pnhUMHrLUyjmGDDg
         r3lZ3x0Pb/9ac2OeN2MndSQibpZmyRDfxjT4pPtBxhuLhwo0VXe8F+dHSPDT+edxEmBB
         RfweULSHJjXiOyBXYCS+2UEQ5qHGgyxcgg3vD1WU+PebNWEynKggYqyv2u1+8Dlm1AJb
         LPMg96LBcJ5fVo/mDjbKO+b7rV95uu1IaUk7SR58XyZf/WGjmYdQXXDnjY2f6b2f5GIX
         3BEg==
X-Forwarded-Encrypted: i=1; AJvYcCWotLYo++wWMlJ+YR5Mzu8ukGFBIHrHXF/9h6OxO3xpTsiOrDaONvxTyrC+IPJpTrZF/+hFKcXuHi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNB+cT5bFyZdxfRexXmX/uDnMxbikqpXAb/8LLWkRptWwjEojB
	/BMfG5C1JjT58p8eV1FZCxRElKHA/KQZg26dCGM5GxrtKMPJB7HB7fgg8cmbrCQ=
X-Gm-Gg: ASbGnctJob44Q7sq/L8s9TWZxxdGQqs3lk6xF71dEfY3HyeFdHCkJGo31EDNGZRKT8a
	zzNoPCs6sFxTXwxsFl9OoAPkKb/1vllva65Jfg6Vnkc9RgJY79FxyzB3t9l0ovkMBtHgl23jeIx
	Qzt37VZd6wSC1kBaoWiYxJFrbwLiHnYXHf/OyFNo+R3bQ/sxuY+5RVpKcOYLUfNk9hUtkq/lqH5
	yUXCCKc4Pwg626JZQ+nGKLcadGD3nyW/ba9dwcE9q123chL7hmn8PZ6ZGkE5A==
X-Google-Smtp-Source: AGHT+IEROnS06Is+yJ/NYS7Lbm9RMq3n6vCGKiNQG/awRliXEYcSaYzplNZMMZfLGBtWkxyV4wv/kg==
X-Received: by 2002:a05:6402:2746:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5d972e1c54emr74030348a12.17.1736951664916;
        Wed, 15 Jan 2025 06:34:24 -0800 (PST)
Date: Wed, 15 Jan 2025 15:34:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH v2 0/2] xen: error handling and FreeBSD compatibility
 fixes
Message-ID: <Z4fHbzgSmV9E5DR4@macbook.local>
References: <20250110093531.23221-1-roger.pau@citrix.com>
 <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>

On Fri, Jan 10, 2025 at 10:02:53AM +0000, David Woodhouse wrote:
> On Fri, 2025-01-10 at 10:35 +0100, Roger Pau Monne wrote:
> > Hello,
> > 
> > First patch from David introduces a new helper to fetch xenstore nodes,
> > while second patch removes the usage of scanf related functions with the
> > "%ms" format specifier, as it's not supported by the FreeBSD scanf libc
> > implementation.
> > 
> > Thanks, Roger.
> 
> Thanks. I've got a handful of non-bugfix cleanups to use the new
> xs_node_read in my tree at
> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xs_node_read
> 
> David Woodhouse (4):
>       hw/xen: Use xs_node_read() from xs_node_vscanf()
>       hw/xen: Use xs_node_read() from xen_console_get_name()
>       hw/xen: Use xs_node_read() from xen_netdev_get_name()
>       hw/xen: Use xs_node_read() from xenstore_read_str() instead of open-coding it

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> I'm slightly dubious about the last one; xen_pvdev.c didn't previously
> use anything from xen-bus-helper.c and even hardcodes zero for
> XBT_NULL. And I look at the way it deliberately reallocates the string,
> and wonder if we should be doing that in qemu_xen_xs_read() for the
> true Xen case. And does it even matter anywhere except Windows?

I would take the opportunity to use XBT_NULL instead of 0 on
xen_pvdev.c for the transaction.

Thanks, Roger.

