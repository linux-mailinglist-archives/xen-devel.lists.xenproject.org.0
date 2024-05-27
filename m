Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708AE8CFA5B
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 09:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730610.1135739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBV2y-0001E3-OK; Mon, 27 May 2024 07:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730610.1135739; Mon, 27 May 2024 07:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBV2y-0001CC-LM; Mon, 27 May 2024 07:45:32 +0000
Received: by outflank-mailman (input) for mailman id 730610;
 Mon, 27 May 2024 07:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0flO=M6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sBV2x-0001C6-Rh
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 07:45:31 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 174f1edf-1bfd-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 09:45:30 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e719bab882so104065261fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 00:45:30 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fb9042sm132704485e9.39.2024.05.27.00.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 00:45:29 -0700 (PDT)
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
X-Inumbo-ID: 174f1edf-1bfd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716795930; x=1717400730; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCwXm4CkTF9x2cDNqDZPQHJI1jrYKUj/dD8FNi/knVI=;
        b=i4YqivSLcC3XoNSu+X6gMjwKPRA7yy6kDc6UwWmiZJNXCsA0l/vq/fq3gPZgEucOWO
         37mvldd8tq6HudGvX7uqmeM2WQi6fM9LZOFA6XhIzOTbpvLN/8033eELSUSRMGsBNQ4A
         fygyEyy2+AJNKmkjq9m/9ib4e8LlDxyi5hnaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716795930; x=1717400730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCwXm4CkTF9x2cDNqDZPQHJI1jrYKUj/dD8FNi/knVI=;
        b=AMzsPf89/siNnZDK3dTGjP3G+gguEBijtKdo1rgQLXr3ApPGlK115qi2pleLNEvh0s
         pwmQyRY8s5UsJm0lhFm27ONjLYfrMIE9A8V6DlN4tp0J4JcpqU5d2nwUrlleckQOyUVv
         th1/pRpVDJYj2gAuDleLBxYzoKoqAQrpeY3VWKfPTRuWiPC67eai8z3VwiLMj20dhcya
         aZ78FAt2ehSnBhiTGgQs4Q1m5QDNCc0wfBXVjQ0uJ47Hk8HFvvvuzUatv+AqRc26m9dV
         pZPDWmd5+gRWposyqAmjsDvVx2+FU7TCnik6osPiWyCI/4yg7c+Q3OIbDuOcyVLloEn9
         M0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgkJ1nDHJdwXaC55CDjds3J2y7F1PfFTnkc7LQna8M9vKQc1jMk+USGFr9oDuvoyafsqQSoxL3ZuOP87hK5Sz6qZxiYd98Qh79K68gDEc=
X-Gm-Message-State: AOJu0YxGtURFiBpr+x0DzneedXcKEAuCKln9FGUaHq726TY4Dx0JpaEn
	z3FEF3+OMcpOEy4SWnFmy5oJUfFw3vozYUfzC67P5D8NAW67mOGUSgz5IfePCBY=
X-Google-Smtp-Source: AGHT+IHNfO1uozzSIFlA74/2waqzTYuaRNA2g91sAU1dtroDz76kpwdIn0iCG1zTtiVxR77FxmZCFA==
X-Received: by 2002:a2e:2c16:0:b0:2e5:8720:50d2 with SMTP id 38308e7fff4ca-2e95af3493dmr53328111fa.0.1716795929812;
        Mon, 27 May 2024 00:45:29 -0700 (PDT)
Date: Mon, 27 May 2024 09:45:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v16 4/5] xen/arm: translate virtual PCI bus topology for
 guests
Message-ID: <ZlQ6GNO6vv8lTHTM@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-5-stewart.hildebrand@amd.com>
 <Zk70udmiriruMt0r@macbook>
 <4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org>

On Fri, May 24, 2024 at 02:21:09PM +0100, Julien Grall wrote:
> Hi,
> 
> Sorry I didn't notice there was a v16 and posted comments on the v15. The
> only one is about the size of the list we iterate.
> 
> On 23/05/2024 08:48, Roger Pau Monné wrote:
> > On Wed, May 22, 2024 at 06:59:23PM -0400, Stewart Hildebrand wrote:
> > > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > > +    }
> > > -    return sbdf;
> > > +    return translated;
> > >   }
> > >   static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> > >                             register_t *r, void *p)
> > >   {
> > >       struct pci_host_bridge *bridge = p;
> > > -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> > > +    pci_sbdf_t sbdf;
> > >       const unsigned int access_size = (1U << info->dabt.size) * 8;
> > >       const register_t invalid = GENMASK_ULL(access_size - 1, 0);
> > 
> > Do you know why the invalid value is truncated to the access size.
> 
> Because no other callers are doing the truncation and therefore the guest
> would read 1s even for 8-byte unsigned access.

I think forcing all handlers to do the truncation is a lot of
duplication, and more risky than just doing it in the dispatcher
itself (handle_read()), see my reply to 1/5.

Thanks, Roger.

