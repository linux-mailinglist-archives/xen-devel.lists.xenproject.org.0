Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E19F2E41
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 11:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857691.1269911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8UM-0007JL-4S; Mon, 16 Dec 2024 10:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857691.1269911; Mon, 16 Dec 2024 10:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8UM-0007GE-1E; Mon, 16 Dec 2024 10:38:10 +0000
Received: by outflank-mailman (input) for mailman id 857691;
 Mon, 16 Dec 2024 10:38:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3c03=TJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tN8UL-0007G8-Dk
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 10:38:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6787e12-bb99-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 11:38:07 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d647d5df90so3833533a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 02:38:07 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ab5695sm3021655a12.13.2024.12.16.02.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 02:38:06 -0800 (PST)
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
X-Inumbo-ID: d6787e12-bb99-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734345487; x=1734950287; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xDjQ3yeJk6FyymKuNTEpWNfKrXU4gPmReKx7i7Ge4nY=;
        b=GMDIT01Q34GwO4C13LP9Dm8P5uPZWjC97SmkBYcpJvedPHFhRSBHhIYhD8O/qYcKBt
         ni/fAvCNWhbdsXnEq0MsWwRLY2zK3l2mq4rxbHmBjxVMZdgOt0gFMie3vsTiRBJyurQo
         vZL2ZfPX+z7bmlwJAK0QjlFEHY/x67gkP/aV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734345487; x=1734950287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDjQ3yeJk6FyymKuNTEpWNfKrXU4gPmReKx7i7Ge4nY=;
        b=gn18ZsbHP8LqLL8M0fceBsEql09LhkcbdQ8z+CkUSkIGnlOCqYhV5+hiET70jfc93U
         kE2gSGqDiFyqebclpl0t7yv8O1rPmRGrYhTaLJ5TrKJdtSXJeMIOafiPmoPtvzk4Rn93
         q4iWp9pzj7MYKGn1DwyOq88OY2J0fHn4bA4tqMcEu8Lyw4xqztKQw2wjfW2EE+tMO6G+
         JTKVLRnWgPjRlg0zK4E705j8pGzAy940oaupFSJ4aS38kxNamPNJ2f0WkXVpVxkPFBgZ
         +q47JOJv4mu8gNpzawifKCKJ+JDb+CvfkP2wGkYCOdY7oslA1TagRxiP/lHJgFM9vgTd
         WKzw==
X-Gm-Message-State: AOJu0YwyKX8QlXdfEICDc5GwkaRscxNRbjiBFu+v90TN4DsqEa0eaU8S
	+hfA4zEwf6rfc49QuS9tVT+y2Al5dGxyb9USjDH4QyfptoXoSxEjal5riSCp4UE=
X-Gm-Gg: ASbGncu98x/6V7T6q4JFrm9MEZsU5tH/7t4bQC13YU9EcYBpV19kM7mOeMsprbbuXyL
	IKApjESs+e5TCqnqlM8QqEcL8aE2qNQBkCr+pXqf51I1hgDBHScyqG8F6hT7WA2LgN2wS1CKky+
	8300kpX+gnDqjMT+dFz0PGMhUl2fiC9VwIKBN4NiVDpX2IDlaMHYZiGYni/kTSkj6R6tjiiJXZ4
	E8iYNyIm+NM10KTDJ9mnR8YjYIcbXUl6LsVaIeKCubvMsrJwIed4HLrNqj4Jg==
X-Google-Smtp-Source: AGHT+IEcS/DTGGk0yWNg6DrZEvSrxXyYCbvVUts0r1Uex6pabuyYvdUq2Jfpa2jlRJm889lg6pcMBg==
X-Received: by 2002:a05:6402:2394:b0:5d0:e877:764e with SMTP id 4fb4d7f45d1cf-5d63c3b1c46mr7913752a12.24.1734345486998;
        Mon, 16 Dec 2024 02:38:06 -0800 (PST)
Date: Mon, 16 Dec 2024 11:38:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v3] vpci: Add resizable bar support
Message-ID: <Z2ADDeTBVyv-W3vd@macbook.local>
References: <20241213054232.2638640-1-Jiqian.Chen@amd.com>
 <Z1__--RWN68hsOCX@macbook.local>
 <0773afe1-e892-4df5-a19e-25c55458e5cc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0773afe1-e892-4df5-a19e-25c55458e5cc@suse.com>

On Mon, Dec 16, 2024 at 11:30:22AM +0100, Jan Beulich wrote:
> On 16.12.2024 11:24, Roger Pau Monné wrote:
> > On Fri, Dec 13, 2024 at 01:42:32PM +0800, Jiqian Chen wrote:
> >> +static int cf_check init_rebar(struct pci_dev *pdev)
> >> +{
> >> +    uint32_t ctrl;
> >> +    unsigned int rebar_offset, nbars;
> >> +
> >> +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
> > 
> > You can do the init at definition:
> > 
> >     uint32_t ctrl;
> >     unsigned int nbars;
> >     unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> >                                                         PCI_EXT_CAP_ID_REBAR);
> > 
> > 
> >> +
> >> +    if ( !rebar_offset )
> >> +        return 0;
> >> +
> >> +    if ( !is_hardware_domain(pdev->domain) )
> >> +    {
> >> +        printk("ReBar is not supported for domUs\n");
> > 
> > This needs a bit more information IMO:
> > 
> > printk(XENLOG_ERR
> >        "%pd %pp: resizable BAR capability not supported for unprivileged domains\n",
> >        pdev->domain, &pdev->sbdf);
> > 
> > I wonder if this should instead be an XSM check, but that would
> > require a new XSM hook to process permissions for PCI capabilities.
> 
> Ultimately perhaps, but right now we need to bail here irrespective of
> XSM policy, as the DomU side simply is unimplemented.

Yes, I should have said additionally rather than instead of the
is_hardware_domain() check.

Thanks, Roger.

