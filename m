Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA0787580
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 18:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590217.922349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDIT-0000Lr-2M; Thu, 24 Aug 2023 16:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590217.922349; Thu, 24 Aug 2023 16:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDIS-0000KC-U3; Thu, 24 Aug 2023 16:35:00 +0000
Received: by outflank-mailman (input) for mailman id 590217;
 Thu, 24 Aug 2023 16:35:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVrA=EJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qZDIS-0000K5-2R
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 16:35:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299d1b07-429c-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 18:34:57 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fefe898f76so137125e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 09:34:57 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l5-20020a1ced05000000b003fc01495383sm3120768wmh.6.2023.08.24.09.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 09:34:56 -0700 (PDT)
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
X-Inumbo-ID: 299d1b07-429c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692894897; x=1693499697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nqD2hIw+B/KywsnCEYrScdBEa8E5/Z/aFGnNFQb0ubQ=;
        b=Cru2GD31uMvxI4uQjM6iyCXm7rqpxMnzGbIc4TxCzxHFxdzi5/sgxxCmo96klMOYrr
         zFCK3aPXL/AnusLagga5MCGyoSzT82fyU8raRWqEILLzMnsNfWgQzmh737+7JeUsBah8
         vvrgsBFMxUyCQHScjdCpQKTsMJ1GVbSU8+A/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692894897; x=1693499697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqD2hIw+B/KywsnCEYrScdBEa8E5/Z/aFGnNFQb0ubQ=;
        b=NbW5x6Y1A2JMeDJtXY+aaG0/DHG2tbpu/cvF8WOiJCQQGB5yfXoxjk6zZixSt4bUx0
         olITCYYvnFODnHvxetNCcaOxClgRVloZupHuerGufRnnEAO0qqHMjeduQ23Ph7dzf81H
         cBisHm0W6Q3mLLFBeS0mBl7Krl02Q8hWfH7qG8+H1SDAC5gGwLtfNeWgkYwRAs2FOfhS
         iy9wRuH9mwS94/c5TiruVF81GTmT6mZ2PW3P190Y3nZOXjccgZJB4vLF92erIi6s9vvp
         rWuZUCWWvmPhF35iu3+wmZeQTDiwligt0T4GUsK+DOrKtuN1ZkHXZB9li13fwdDwXtgY
         oZ+w==
X-Gm-Message-State: AOJu0Yx5+hWlwNSWKDNMcPn+yQ/kSXo0QWRYLBE/TN2DjC2AzQqDFajX
	nMZVhy3QeMdq8XqEQqd0vzqMSQ==
X-Google-Smtp-Source: AGHT+IFUuEOKIcMWGVfTOxfCEmMIOLzlY/ywH859ib0+fct/aNzZotvbFoMIxovYTKXRef1TNIu/2w==
X-Received: by 2002:adf:e7cd:0:b0:30e:19a8:4b0a with SMTP id e13-20020adfe7cd000000b0030e19a84b0amr12094532wrn.2.1692894897115;
        Thu, 24 Aug 2023 09:34:57 -0700 (PDT)
Date: Thu, 24 Aug 2023 17:34:55 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach
 for HVM domain
Message-ID: <656761cd-22ba-4edb-b7a1-bc08f672243a@perard>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
 <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>

On Thu, Aug 24, 2023 at 12:15:39PM +0100, Julien Grall wrote:
> On 18/08/2023 18:04, Anthony PERARD wrote:
> > So, this new pci_revoke_permissions() function been place before
> > do_pci_remove() will make it harder to follow what do_pci_remove() does.
> > Does it need to be a separate function? Can't you inline it in
> > pci_remove_detached() ?
> 
> I decided to go with an inline function to avoid increasing the size of
> pci_remove_detached() and also separate the logic from cleaning-up QMP an
> resetting the PCI device.

It's fine to have a long function, if there's that much to do. You can
add a comment if you want to separate a bit from the rest.

Having a new function would be ok if it was used from different places,
or if it was needed for a new callback in the chain of callbacks of a
long-running operation.

> > 
> > If it does needs to be a separate function, a better way to lay it down
> > would be to replace calls to pci_remove_detached() by
> > pci_revoke_permissions() as appropriate, and rename it with the prefixed
> > "pci_remove_", that is pci_remove_revoke_permissions().
> 
> I don't understand this suggestion. pci_revoke_permissions() is called right
> in the middle of pci_remove_detached(). So it is not clear how it can be
> called ahead.
> 
> Also, if I replace pci_remove_detached() with pci_revoke_permissions(), does
> this mean you are expecting the latter to call the former?

Let's just keep things simpler, and just add the code into
pci_remove_detached().

Cheers,

-- 
Anthony PERARD

