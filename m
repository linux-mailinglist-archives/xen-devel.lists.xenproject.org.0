Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE76A57E6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 12:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503258.775491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWy5e-0007rv-Tg; Tue, 28 Feb 2023 11:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503258.775491; Tue, 28 Feb 2023 11:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWy5e-0007pQ-Pv; Tue, 28 Feb 2023 11:24:14 +0000
Received: by outflank-mailman (input) for mailman id 503258;
 Tue, 28 Feb 2023 11:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWy5c-0007pK-Ox
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 11:24:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1a07cd-b75a-11ed-9694-2f268f93b82a;
 Tue, 28 Feb 2023 12:24:11 +0100 (CET)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-NyJScZV7OvaOCD4NWlqdmQ-1; Tue, 28 Feb 2023 06:24:08 -0500
Received: by mail-wm1-f72.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so4129592wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 03:24:08 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1c540d000000b003db06224953sm12401771wmb.41.2023.02.28.03.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 03:24:06 -0800 (PST)
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
X-Inumbo-ID: 6c1a07cd-b75a-11ed-9694-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677583450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
	b=BkQXwGdzbZF7Ur7AANLRRr+QWwW1OHQR2nW1Vgk5a5JIUSdMPgeTNzG98NUtP3k+HbOFfI
	67jhmhwcRZDZtZufzs3aObGCWX8JoAjIyr/DdZcws63PGVodZTwHknpK44Uem3kj8h6EXR
	t6/k75E1XuB19tI0E47Ql/07i49uWz0=
X-MC-Unique: NyJScZV7OvaOCD4NWlqdmQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677583447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPt18yMFBhgEWcyFKRvmzxmC7YZWJirJ75g/XkJWVsg=;
        b=zA9A0bV4NhvDRfpNtMsFEdGpL6XElE2dA1DxE2dY4hYrh/iQfDuMcmhQ/Lp8PWzM5M
         ueHjuHg5tx56Njn+MkvI16P3GZNkYX8OoZQwUPaikjc1pUUvNR8eQMke27rVaraHd68c
         OYwWJH5sG6mWv8msc3Lg6hIBan1x/2+w0NHzb+fN6Kv8tlDHDdEmbvkC8OWwD8SdAa80
         P4spcS9PDdF7s8WYQOAd7bjopxjBxAlcu3quqkD0MLYpnZtrpm3gV7KBcIz4FizCweAz
         X62RcMruFOLolEwZDRuW/dXpBp+kr5v1YJ75DUu+Z9QtLDRvgBqLRAnFiM9r/pQ2WwSM
         96Gg==
X-Gm-Message-State: AO0yUKUGnCuB456k1bUO4RpGun6ugbMO7NSCO884JVC5fJqYneI6dAK5
	nsMt7VwUZIcrVshB69TBHUP1Q5qnKGKn/QHZcuRa5QCmXLL3lSNOPAA37gZ/achJNDGyALk70Sl
	rFn2imibybMvMzgNCPTE/+fFivPg=
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id t7-20020a05600c450700b003eb2b88a69amr1863547wmo.14.1677583447614;
        Tue, 28 Feb 2023 03:24:07 -0800 (PST)
X-Google-Smtp-Source: AK7set9T5ZkS4VbZWkKkMQx04lsVjTlgvyWwH8VrH3B39Ebim23eqhBX9ts8ZVRgNNp1IV6iBjuM7Q==
X-Received: by 2002:a05:600c:4507:b0:3eb:2b88:a69a with SMTP id t7-20020a05600c450700b003eb2b88a69amr1863526wmo.14.1677583447355;
        Tue, 28 Feb 2023 03:24:07 -0800 (PST)
Date: Tue, 28 Feb 2023 06:24:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228061853-mutt-send-email-mst@kernel.org>
References: <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
 <20230228040115-mutt-send-email-mst@kernel.org>
 <fe4626c6-6103-d5e5-6920-9dfb4777b979@redhat.com>
 <Y/3MIUDRBUSNg6C5@redhat.com>
 <20230228050908-mutt-send-email-mst@kernel.org>
 <87cz5uhy50.fsf@pond.sub.org>
 <20230228055016-mutt-send-email-mst@kernel.org>
 <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
MIME-Version: 1.0
In-Reply-To: <072a7502-6061-12b2-f778-736c6a8f5912@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 12:12:22PM +0100, Thomas Huth wrote:
> On 28/02/2023 11.51, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 11:39:39AM +0100, Markus Armbruster wrote:
> > > The question to answer: Is 32 bit x86 worth its upkeep?  Two
> > > sub-questions: 1. Is it worth the human attention?  2. Is it worth
> > > (scarce!) CI minutes?
> > 
> > 3. Is it worth arguing about?
> 
> You are aware of the problems we're currently struggeling with, aren't you?
> Darn, we're having *SEVERE* problems with the CI, the QEMU project ran out
> of CI minutes for the second time this year, and you ask whether it's worth
> arguing about??? You're not serious with this question, are you?
> 
>  Thomas

Yah just couldn't resist. How many minutes do we use per month btw?

-- 
MST


