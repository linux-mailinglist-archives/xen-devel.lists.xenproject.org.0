Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F960707B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 08:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427360.676324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollrU-0007ve-DL; Fri, 21 Oct 2022 06:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427360.676324; Fri, 21 Oct 2022 06:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollrU-0007sD-AH; Fri, 21 Oct 2022 06:50:32 +0000
Received: by outflank-mailman (input) for mailman id 427360;
 Fri, 21 Oct 2022 06:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPHp=2W=redhat.com=jasowang@srs-se1.protection.inumbo.net>)
 id 1ollrS-0007s6-Np
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 06:50:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a40f50df-510c-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 08:50:26 +0200 (CEST)
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-JvB9qQ5uO7-pKpIUC1SLhw-1; Fri, 21 Oct 2022 02:50:21 -0400
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13305999f45so1249229fac.18
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 23:50:21 -0700 (PDT)
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
X-Inumbo-ID: a40f50df-510c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666335025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOzz6RqxEFeDgZOvB1fTWZ3fuSCGIDuMSc6tKtrk8+s=;
	b=YVu21WPyAEtms3VE7lk+X7rgL13OEY+xcmmTG3AHIT4DNMeuRqWOKtJD/VrXGgxKxqBXwz
	4NhWVTMVqaVmznx9x100fyv+conFESz1FWDeAnPtPTzaJW1BhHFNiE5Xap5P7Z7k68cn+l
	DHqyjuLlDouiwQZLGkqh6uJdEttry2Y=
X-MC-Unique: JvB9qQ5uO7-pKpIUC1SLhw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOzz6RqxEFeDgZOvB1fTWZ3fuSCGIDuMSc6tKtrk8+s=;
        b=ewgL0LZl6CdpfxnABRk4cUBr5N+nOSICOZpB7JPx22hzqAVN8yBqWKvC1OIqmgVs1r
         oaRL9VcyB3M8wmqvVhdWkvxT/ufvVmFv4CB5y9YXxl/ztWvZTfRlou2HlnMqtqZEj9up
         lj//myniSYTJFkWC1MEnzYxnvErw6sJ+Rm0xQAA5c3ESOOpR4sklaBeMqBzvZ3y85zon
         sUKg4VUNT6fOSsU7sHDBOFSISVTQZkxH/18AEUK0t0O+9NZUXu4IT3Nfjl0zSZno9dcr
         TY8lSwB3xvEcm3vGrbwvA0+AJGVVyJKImcdAjpGlrX18TwmcV3ZeYMDenFgaF8NdVRWL
         S6lA==
X-Gm-Message-State: ACrzQf1b2T/zUK6DgOSjr7NGftRngTkGw8daQ7y54ieB2U2XfRCV0AIM
	gneNgydNBNC6z/j/rs9Lw89/a8x0JpYnMd1DXbtHAFonM4lDLvq+1mdLG0VMtpZlgx5m8p47bnc
	NwL9fmncf2s0mPBFDjCdUykPH1JXMN28fm3zP9URiyTc=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id bj5-20020a056808198500b00354d7cf9acbmr9563868oib.280.1666335021210;
        Thu, 20 Oct 2022 23:50:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4MsrSkczxgyL5VrPWYzqqA1GHmIu6vGijSgB1rVxOImIbAyk3VP+uSlEbR8x7X/fkgKZMWn8pgX5+JVE+IwmU=
X-Received: by 2002:a05:6808:1985:b0:354:d7cf:9acb with SMTP id
 bj5-20020a056808198500b00354d7cf9acbmr9563848oib.280.1666335020995; Thu, 20
 Oct 2022 23:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221020162558.123284-1-lvivier@redhat.com> <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
 <87h6zx4qsk.fsf@pond.sub.org>
In-Reply-To: <87h6zx4qsk.fsf@pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 14:50:09 +0800
Message-ID: <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Eric Blake <eblake@redhat.com>, xen-devel@lists.xenproject.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Ralph Schmieder <ralph.schmieder@gmail.com>, Stefano Brivio <sbrivio@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 21, 2022 at 2:46 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Jason Wang <jasowang@redhat.com> writes:
>
> > I've queued this version and will send pull requests shortly.
> >
> > Any future comment we can do patches on top.
>
> Please give Laurent and me a few hours to try to improve PATCH 17's
> commit message.  Which you could then integrate without a respin.

Ok.

Thanks

>


