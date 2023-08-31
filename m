Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADE78F3DD
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 22:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594110.927317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbo99-0004Sj-Ds; Thu, 31 Aug 2023 20:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594110.927317; Thu, 31 Aug 2023 20:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbo99-0004R5-AY; Thu, 31 Aug 2023 20:20:07 +0000
Received: by outflank-mailman (input) for mailman id 594110;
 Thu, 31 Aug 2023 20:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OzwQ=EQ=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1qbo97-0004MJ-KV
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 20:20:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4823ae3-483b-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 22:20:04 +0200 (CEST)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-i8uwDpJVMje9jm8IJ2GgRQ-1; Thu, 31 Aug 2023 16:20:01 -0400
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-40559875dd1so2520191cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 13:20:01 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 y21-20020ac85255000000b004109928c607sm882603qtn.43.2023.08.31.13.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 13:20:00 -0700 (PDT)
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
X-Inumbo-ID: c4823ae3-483b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693513203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufk8GCiw/LwQVAZTYLTycpsT48xt2rPVrWRGaQbD81E=;
	b=S98mnzqerKLbV0+to5cKfrqV690GUHwMR12aMIBk9XenE+loxdLZARqMcXkP+4xwVJw57Y
	5TWJs5XpV8F/QCu7NF8cE8Z10//ve6pPETvP4KGDL7784Fr1VyISuBSYgszQ50EuDgf/oc
	qPzT0s1B0/Wb6jEqB+sKj9L+veOQRuM=
X-MC-Unique: i8uwDpJVMje9jm8IJ2GgRQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693513201; x=1694118001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufk8GCiw/LwQVAZTYLTycpsT48xt2rPVrWRGaQbD81E=;
        b=OBkZOZtEa3Y8MCz5tqKIAYlJ1gvCVBIMZwmJxtiinFWPGCblFEnodZEE3CiOy8V+zI
         /0dpJPMGMrS0bspQCTyUfwv86EnUc5WKRoi4toVNiQfZceql6to+nho/BnyIq1r9sXB2
         nEBmnVz7knwUw6XP4Vr3fos7rvlu4mzPoU5rH873mGfsoyJujVJ8owg8OrpwNQj8/8ER
         IiwwzHIqJYDPn/+hR9mwabHJ64lq4t8f/OgNO8MWNI4KUif2pTt1EFPZD2fyWO9rRzyr
         A+/x84k6vP8GihLIwtw1YELOJufOH3yESkj6uPEydbMO0eq89MYkE91DPj4VwzzyCwd2
         iCIw==
X-Gm-Message-State: AOJu0Ywq4VBmOEEvaV4yA2b/Ixlk94UprZqQnkMHVZIWrJ3S2diueYzg
	S+4SmRpbH7zQLZxo8Qe6y72UUidd3woaC8GHos4hb6WXsUgaYDJrYGXsb8ULYojfemNLj6sIuDY
	gw0J1GmCEjULQWhh9G25OUzZ6XZk=
X-Received: by 2002:a05:622a:1a95:b0:412:944:542f with SMTP id s21-20020a05622a1a9500b004120944542fmr554598qtc.2.1693513201283;
        Thu, 31 Aug 2023 13:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFAF781BYCy/7xjebcfDDFV6O9tFD+MwHw2lCzWGRBIbm6hK0VSsMkVUfbwGvnURh5QKA8xg==
X-Received: by 2002:a05:622a:1a95:b0:412:944:542f with SMTP id s21-20020a05622a1a9500b004120944542fmr554577qtc.2.1693513200985;
        Thu, 31 Aug 2023 13:20:00 -0700 (PDT)
Date: Thu, 31 Aug 2023 16:19:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
	idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de,
	sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org,
	pbonzini@redhat.com, marcandre.lureau@redhat.com,
	berrange@redhat.com, thuth@redhat.com, philmd@linaro.org,
	stefanha@redhat.com, fam@euphon.net, quintela@redhat.com,
	leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH 2/7] migration: Clean up local variable shadowing
Message-ID: <ZPD17rBVIoFgpBWA@x1n>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230831132546.3525721-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 31, 2023 at 03:25:41PM +0200, Markus Armbruster wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=local.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


