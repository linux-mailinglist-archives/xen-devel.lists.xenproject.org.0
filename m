Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA47080E1
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 14:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536308.834501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcUO-000129-Cj; Thu, 18 May 2023 12:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536308.834501; Thu, 18 May 2023 12:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzcUO-0000za-9D; Thu, 18 May 2023 12:12:12 +0000
Received: by outflank-mailman (input) for mailman id 536308;
 Thu, 18 May 2023 12:12:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GxtU=BH=ziepe.ca=jgg@srs-se1.protection.inumbo.net>)
 id 1pzcUM-0000zU-JX
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 12:12:10 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34db536d-f575-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 14:12:07 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7577f03e131so108391585a.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 May 2023 05:12:07 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.25.194]) by smtp.gmail.com with ESMTPSA id
 w8-20020a0562140b2800b006215c5bb2e9sm476635qvj.70.2023.05.18.05.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 05:12:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1pzcUG-0055VE-PF;
 Thu, 18 May 2023 09:12:04 -0300
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
X-Inumbo-ID: 34db536d-f575-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=f1WIjix4LVO2qoUadyymiNEwWX8LVYnKjiZJmHZsA00vpgp8OzN7fLeOXwmxyAsNjQ
         sHOCKYtaHjUeBnmA70xUS7m11Y8GXRs0HF7i7PVSFcwvUzQVx0yAXlGLYQrw7yq7y3KH
         MBoMqwZGJTzwuItitFkcFv88cqBCrBWri+DUGp8Fc0eAqXpc1sD7lY1vf9Zu0c1UnHTi
         g1NSzolGSvoeoheQrwHIwMvc3Rso4DvQpoRRtvFDk7J6iY3SLf6NCCF8S9IRrkOXhhUV
         HRuCy/CUe+KQ4Lk9dlGX7GSjHNglFJk4MTFkm4joUr1QsJe7so9IrOlgfq/tmei89LyY
         B2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684411926; x=1687003926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1LVde9eD9hiDa72aXFp01UeitZcx1XKK5VRIQwwJ4w=;
        b=aNDm/WiTAASwzuNVH0coKJFiv8uGRW6l8qOZ33gCG0lkbBYXghWcGiojgHAnc3J4i+
         msexDCAKOuDMoWfYldMkaJ6hm5rR2qwYBdwfzzt1mMhw09n2RDDxyzIXfc+jyJzj5GTe
         Mp7FGIFqtKsS7Aa9VtAhHR84qE19YWTWSn0wDHxMQsjlIwfVxmH97b1kK5jgJgTLb6bb
         41hgEdGvPQvM3dJBin4F6QW4SdEwtEzo0/plnCmrTz6uEjg7h5a/gyxp7cntbyF9yW6z
         KQSueZl+/4A1A+tF33golwFn9Rxm1nkqqqw8bq02q1h2/Bwjjc8XBruH4jUy99lRQsIr
         bj7Q==
X-Gm-Message-State: AC+VfDwr/BgDK9J3FcFEaCtt1mqKjUE4CqeJxSgcLuTwuXj00oR4CT5r
	Un8OivgN9ByC2O9BSA37griXIQ==
X-Google-Smtp-Source: ACHHUZ7wZ7lgCFFjWmWBQuc0tx+WGJVC/VREvoop6Vbqh2gPTjnAeer0zQN00cudqqAWi4mVPLtPKg==
X-Received: by 2002:a05:6214:2486:b0:5fd:7701:88c5 with SMTP id gi6-20020a056214248600b005fd770188c5mr5974330qvb.6.1684411925806;
        Thu, 18 May 2023 05:12:05 -0700 (PDT)
Date: Thu, 18 May 2023 09:12:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	David Hildenbrand <david@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"David S. Miller" <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/34] Split ptdesc from struct page
Message-ID: <ZGYWFIfyDtdpeWg1@ziepe.ca>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>

On Mon, May 01, 2023 at 12:27:55PM -0700, Vishal Moola (Oracle) wrote:
> The MM subsystem is trying to shrink struct page. This patchset
> introduces a memory descriptor for page table tracking - struct ptdesc.
> 
> This patchset introduces ptdesc, splits ptdesc from struct page, and
> converts many callers of page table constructor/destructors to use ptdescs.

Lightly related food for future thought - based on some discussions at
LSF/MM it would be really nice if an end result of this was that a
rcu_head was always available in the ptdesc so we don't need to
allocate memory to free a page table.

Jason

