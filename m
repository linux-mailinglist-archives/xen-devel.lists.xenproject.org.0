Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C76787636
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 18:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590240.922383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDfC-0004OS-BM; Thu, 24 Aug 2023 16:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590240.922383; Thu, 24 Aug 2023 16:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZDfC-0004LX-7J; Thu, 24 Aug 2023 16:58:30 +0000
Received: by outflank-mailman (input) for mailman id 590240;
 Thu, 24 Aug 2023 16:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVrA=EJ=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qZDfA-0004LP-3Q
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 16:58:28 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7195b7f5-429f-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 18:58:26 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fee87dd251so241995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 09:58:26 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v26-20020a05600c215a00b003fe61c33df5sm3218874wml.3.2023.08.24.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 09:58:26 -0700 (PDT)
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
X-Inumbo-ID: 7195b7f5-429f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1692896306; x=1693501106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGC/00NYbki6wATV+1nHi3uSvdm1PZzUguQ820Plzmo=;
        b=cQb/QfOWl6U+vBmwfS9RqdhZgkf06QTLTBQFyiZr6BC56R+uFYrTxIhzZsuRDj7gnL
         qM3m0Aob1WYHbLzQ9vj1Dx1Nf4Xzq/Rooz0wwhwk43hjxwOuuP2KJGPAfJ7ID4kzWiQy
         Bi8kbwftDmDIMXIIxaLHmPLEGT7B4JfN7fwX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692896306; x=1693501106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGC/00NYbki6wATV+1nHi3uSvdm1PZzUguQ820Plzmo=;
        b=MjT119CIazVw5YxZG/P/c/oQpCM4+YWno2gzHTmzVHqs4avba/MVnJM955llgvfl1d
         s7RBmIQgYUOxoO5a7FWNYB0bbEFlBLSdUaZtxP/Cd8WQPHOFbNK04MyCTo9RkWScLP2U
         3/ZNiENT96pzs8A137aKOqzk284atgypSY2MMCvkQDwwb7ARGbY/k8+oxXXn0a3U94HJ
         F7SZnbKI3ezRZYI3TcpUnDT48tRWNaHxoLL9i/0s95JfutjJ+U2sHMSyOepKQ55aIXjw
         Xn0dtH7LIHRxGjs9+8VO7bFfPBrfEURzfIO+8BZyzj6AYVVbSNZDY8b8aWm5iCS/JhA4
         04nw==
X-Gm-Message-State: AOJu0YxNCWpWU/ZDurztoxUjW3rloJgH6NlHG+WknKygw+G/khCdn/Sf
	OpGSBHBBZYXjPkBm0NKry8UWjQ==
X-Google-Smtp-Source: AGHT+IHOS6ZTrRuhGf1I3REI1dN5Y7sIDkEBs83xB72FHNrtoZxolOKMofdxupiftCFEvLX8yLvndA==
X-Received: by 2002:a1c:7205:0:b0:3fc:5a3:367c with SMTP id n5-20020a1c7205000000b003fc05a3367cmr13163232wmc.32.1692896306383;
        Thu, 24 Aug 2023 09:58:26 -0700 (PDT)
Date: Thu, 24 Aug 2023 17:58:25 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach
 for HVM domain
Message-ID: <bc936e81-f1fa-45cf-a097-53aebde1fd6e@perard>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
 <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>
 <656761cd-22ba-4edb-b7a1-bc08f672243a@perard>
 <f060a049-b01a-4dcc-a89a-48716e418671@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f060a049-b01a-4dcc-a89a-48716e418671@xen.org>

On Thu, Aug 24, 2023 at 05:46:45PM +0100, Julien Grall wrote:
> Hi Anthony,
> 
> On 24/08/2023 17:34, Anthony PERARD wrote:
> > On Thu, Aug 24, 2023 at 12:15:39PM +0100, Julien Grall wrote:
> > > On 18/08/2023 18:04, Anthony PERARD wrote:
> > > > So, this new pci_revoke_permissions() function been place before
> > > > do_pci_remove() will make it harder to follow what do_pci_remove() does.
> > > > Does it need to be a separate function? Can't you inline it in
> > > > pci_remove_detached() ?
> > > 
> > > I decided to go with an inline function to avoid increasing the size of
> > > pci_remove_detached() and also separate the logic from cleaning-up QMP an
> > > resetting the PCI device.
> > 
> > It's fine to have a long function, if there's that much to do. You can
> > add a comment if you want to separate a bit from the rest.
> > 
> > Having a new function would be ok if it was used from different places,
> > or if it was needed for a new callback in the chain of callbacks of a
> > long-running operation.
> 
> I don't agree with this definition on when to create a new function. Smaller
> functions help to logically split your code and also avoids to have to
> define 20 local variables right at the beginning of the function (this is
> what will happen with folding the function) among other advantages.

You can always create a new block {} in the function, if that help with
local variables.

Cheers,

-- 
Anthony PERARD

