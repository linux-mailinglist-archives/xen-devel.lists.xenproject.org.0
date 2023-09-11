Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440079A783
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 13:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599321.934679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfehl-0002Em-64; Mon, 11 Sep 2023 11:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599321.934679; Mon, 11 Sep 2023 11:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfehl-0002Bo-2d; Mon, 11 Sep 2023 11:03:45 +0000
Received: by outflank-mailman (input) for mailman id 599321;
 Mon, 11 Sep 2023 11:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5ji=E3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qfehk-0002Bi-2i
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 11:03:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de3d3b2e-5092-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 13:03:42 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so3969412f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 04:03:42 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x14-20020adff0ce000000b00319779ee691sm9619448wro.28.2023.09.11.04.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 04:03:40 -0700 (PDT)
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
X-Inumbo-ID: de3d3b2e-5092-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694430221; x=1695035021; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMn/IgLrc17cG2QUCeRopnm72OVmY1SutD8xwx8P65Y=;
        b=rBJzLL6kXtwCyuTgtLXje5AJe09UQliQA0hzjXbcW8wdooIIlMShTJaOhL34mI/ZmK
         5aM3OPBC0wARyKsOKyxS+ED8+G9HuhK52CXwpPMf6J71TzGyyh4ZrqJzaBYz/WrD8W9M
         WmTqhO5oWMhUQI3GmNoarU1cGFqkbuwBj5bI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430221; x=1695035021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMn/IgLrc17cG2QUCeRopnm72OVmY1SutD8xwx8P65Y=;
        b=L2jWi1FKsP8QI10dj7gU+cQhnwKasqCRmxN6KHjxDBH0DxrqgJRgrVvRbhT6L7eh8I
         bdn2cCan85VzWl9KXEx2o5MKoUWSUde15MhQnpUeNsq7sFSakXfcYzC4itUzkW8UGW5T
         e5mrZdc30ePbQlBkkoIpzqL4l6lNMrJSVS18opI17O2hQJflyIRK3ckM3qCTB5CpqXiT
         WkqZ13qtY1gmxjQWxUCY3X+7717w5s+qK9DyRXJ3lXVUzPebL8MHG5Qgn08US4CnfXNH
         M6GzinelehTSwn4dtqdBGLhoGuSe5p5FRm/xS/dgdouwFgWaKfhqPhXcK21J16iHssb9
         t7nw==
X-Gm-Message-State: AOJu0YzbrPhUbkXeDEWkVf8TXEtZdtsC45TvnbttYPuezKJQE1VF+9TC
	7oL+fq9/XeXhCMGU/Fn0ZzczlA==
X-Google-Smtp-Source: AGHT+IGFg6hrzJ06dyMv1s2ef7hOmWRrt4/kC9QOS+E0PSbNOdAWQiJylPXc+LmNqm79tVPDH0su9g==
X-Received: by 2002:a5d:42cb:0:b0:317:5eb8:b1c4 with SMTP id t11-20020a5d42cb000000b003175eb8b1c4mr7236305wrr.2.1694430221438;
        Mon, 11 Sep 2023 04:03:41 -0700 (PDT)
Date: Mon, 11 Sep 2023 12:03:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach
 for HVM domain
Message-ID: <83e32547-e861-45a0-b0c4-84fe4fd3ca05@perard>
References: <20230809103305.30561-1-julien@xen.org>
 <20230809103305.30561-3-julien@xen.org>
 <48113eee-e047-47ad-b7a7-29feb8464ce9@perard>
 <438b2e6d-004c-42d6-8238-1d8e77e274e6@xen.org>
 <656761cd-22ba-4edb-b7a1-bc08f672243a@perard>
 <f060a049-b01a-4dcc-a89a-48716e418671@xen.org>
 <bc936e81-f1fa-45cf-a097-53aebde1fd6e@perard>
 <9b849d85-c54b-4b6c-95ef-721c57dc39f5@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b849d85-c54b-4b6c-95ef-721c57dc39f5@xen.org>

On Thu, Aug 24, 2023 at 06:27:12PM +0100, Julien Grall wrote:
> On 24/08/2023 17:58, Anthony PERARD wrote:
> > On Thu, Aug 24, 2023 at 05:46:45PM +0100, Julien Grall wrote:
> > > On 24/08/2023 17:34, Anthony PERARD wrote:
> > > > On Thu, Aug 24, 2023 at 12:15:39PM +0100, Julien Grall wrote:
> > > > > On 18/08/2023 18:04, Anthony PERARD wrote:
> > > > > > So, this new pci_revoke_permissions() function been place before
> > > > > > do_pci_remove() will make it harder to follow what do_pci_remove() does.
> > > > > > Does it need to be a separate function? Can't you inline it in
> > > > > > pci_remove_detached() ?
> > > > > 
> > > > > I decided to go with an inline function to avoid increasing the size of
> > > > > pci_remove_detached() and also separate the logic from cleaning-up QMP an
> > > > > resetting the PCI device.
> > > > 
> > > > It's fine to have a long function, if there's that much to do. You can
> > > > add a comment if you want to separate a bit from the rest.
> > > > 
> > > > Having a new function would be ok if it was used from different places,
> > > > or if it was needed for a new callback in the chain of callbacks of a
> > > > long-running operation.
> > > 
> > > I don't agree with this definition on when to create a new function. Smaller
> > > functions help to logically split your code and also avoids to have to
> > > define 20 local variables right at the beginning of the function (this is
> > > what will happen with folding the function) among other advantages.
> > 
> > You can always create a new block {} in the function, if that help with
> > local variables.
> 
> I thought about it... But this is just a function in disguised with downside
> (the extra layer of indentation).
> 
> I was actually going to try the folding version. But given this suggestion,
> I am now struggling to understand why this is a problem to have a function
> only called once. This is fairly common in Xen Hypervisor and I can see at
> least one instance in libxl (see libxl_pci_assignable()). So what is the
> rationale behind this request?

It is to try to keep the code laid out in chronological order for this
async operation. See CODING_STYLE L153:
    https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/libs/light/CODING_STYLE;h=b1a6a45c74df083cdd793e5cb6a67a76cb5c1174;hb=refs/heads/master#l153

(libxl_pci_assignable() isn't a good example, as it should be part of
the API ;-) )

Cheers,

-- 
Anthony PERARD

