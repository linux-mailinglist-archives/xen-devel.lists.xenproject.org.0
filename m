Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F56A54FF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 10:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503144.775316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvqg-0005As-Jn; Tue, 28 Feb 2023 09:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503144.775316; Tue, 28 Feb 2023 09:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvqg-000580-Gy; Tue, 28 Feb 2023 09:00:38 +0000
Received: by outflank-mailman (input) for mailman id 503144;
 Tue, 28 Feb 2023 09:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bF4M=6Y=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pWvqf-0003qW-M8
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 09:00:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d74129c-b746-11ed-9693-2f268f93b82a;
 Tue, 28 Feb 2023 10:00:37 +0100 (CET)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-vnwjeYscO8mY6XgsvzEq0w-1; Tue, 28 Feb 2023 04:00:33 -0500
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso12837925edb.4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 01:00:33 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 gg16-20020a170906e29000b008d044ede804sm4189754ejb.163.2023.02.28.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:00:31 -0800 (PST)
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
X-Inumbo-ID: 5d74129c-b746-11ed-9693-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677574835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
	b=U+DS6koPBEwRqWRD7IriCWBo1WzOm0fLEpBRhhqUd/WKuc/s9ohfN/WwpCkF8pUd/0hYN5
	43JF58VRSpJdo0IanoD3glkscSzrACMAH5JTFJMTCI1BFlqCRlhVC7yJM8GhkpwavUmkBu
	pOQ7BmKituFyUdMVDzA/g06CWwe+8Ns=
X-MC-Unique: vnwjeYscO8mY6XgsvzEq0w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677574832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRtxoAuLpdApFzU8iSpQxKbbqyyyhWT3y9LXsZFTdMo=;
        b=29pK7276PbAxrlPQCYMtGhznGyPzjt7os4JRZf6AK6mfvq0EgP0OAbeuTeJ4d1x6N7
         asnys8AybrKk7Po7YLnTa43NRt8Q4doVJolxdjIkVf+kq2M5OfIKkTmIMWSfosoYPpNh
         ma9R7dzQYDfWhKULLeMKGvZ/z5fLvd8/BvL+favJF2d3YvGN2019oIImPospxBYyQHes
         1U1I2v7rkv9qoPciQ7ausochYPcconWz/QsQHh1Oczf6ioJS6g45li46iV+IBMFO5x4A
         v9DVmLTZf1OOjOlIpSKlfnSBr5oHdh5A9kMHOxuhMkI696HtWIz8EBMGG44X4u9ajy4u
         l2Sg==
X-Gm-Message-State: AO0yUKXj2CqacgvJc2PGEXsG//7azserficVY9Z864cmaxxxd8runb1E
	JDv3D1MxgNm8uuQBDBt82JIQL9FHTdcxmNFGFn7iBJMXrMTKJC96c7HV8Vdu21Zlif+oS1mr4Ar
	gV3mR2ty79vWI4JBDaWZtrcGkQdM=
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id fp17-20020a1709069e1100b0088b0a3025f0mr1283987ejc.32.1677574832261;
        Tue, 28 Feb 2023 01:00:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/J1+Ld8LsWEB2TwMozBSOMY+fwEhTxfYILgVCVw7dPM0D6ohU2PzN3oITfWaroDadG9uKo1w==
X-Received: by 2002:a17:906:9e11:b0:88b:a30:25f0 with SMTP id fp17-20020a1709069e1100b0088b0a3025f0mr1283970ejc.32.1677574831962;
        Tue, 28 Feb 2023 01:00:31 -0800 (PST)
Date: Tue, 28 Feb 2023 04:00:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com, xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228035958-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <d1151c34-c2e3-50aa-b12e-f6c5cafed5d3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 10:21:14AM -1000, Richard Henderson wrote:
> > Removing support for building on 32 bit systems seems like a pity - it's
> > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > and the maintainance overhead is quite small.
> 
> It's not that small.

Meaning there are lots of ways to run 64 bit binaries on 32 bit systems?

-- 
MST


