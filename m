Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5778F3CE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 22:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594105.927306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbo6Z-00038K-0A; Thu, 31 Aug 2023 20:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594105.927306; Thu, 31 Aug 2023 20:17:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbo6Y-00035p-Tj; Thu, 31 Aug 2023 20:17:26 +0000
Received: by outflank-mailman (input) for mailman id 594105;
 Thu, 31 Aug 2023 20:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OzwQ=EQ=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1qbo6Y-00035j-5y
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 20:17:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64fca9ec-483b-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 22:17:23 +0200 (CEST)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-45z1k2tDOTi8vMP7DGrV2g-1; Thu, 31 Aug 2023 16:17:19 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-637948b24bdso3044356d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 13:17:19 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 r20-20020a0cb294000000b0063d152e5d9asm879005qve.120.2023.08.31.13.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 13:17:18 -0700 (PDT)
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
X-Inumbo-ID: 64fca9ec-483b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693513042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5a/SwKv6GUP+JWqMoj3PY4osU8HvXRNVst9zAGspjno=;
	b=SVgILnbOJthNxqdjzdnhkb4XOkLKInvpNFIWFKnBL1TO5+W/yWoF9naRBMC2FO4UCqp1Ky
	W6Wl0J7ZXFtV1ZBl3bvMp5cpDYk7nvKfZ66HMQ/rs8PIwqhZD+2Ic8fnKtap7DAGfCQziN
	8yt+V7j7qjkdsDUnTODe9iMYHUsnfBY=
X-MC-Unique: 45z1k2tDOTi8vMP7DGrV2g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693513039; x=1694117839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a/SwKv6GUP+JWqMoj3PY4osU8HvXRNVst9zAGspjno=;
        b=DnzwDur6QpMYROd/SnFwD1akXy5dTuadhKyAnKVzd1BQt5+tRBS+jeWcgeqy2Qy0jW
         ruBhZek9yW/PMySTVsKls+KnRhyu1wOH3Zfo+aIuLjbcZmM5ThuUUQ4Kh2tYZsvyGpfj
         GKYeSQ+pxQGAjULC6fN+/jk+a7I8uPpAC4lcZp4Itcvc8iq/cEqMcOoX9d/Yd/g3Cgpt
         nd4oMbOo7zZ/y9MJxK6Ov2H0VxlXF8kcbi1scereOb5TsrIQLWk9ipcnbsXpP8/1tLMy
         FRiJEZg5D7TMV0gxdbwl0hcASBDtU4NbWHfcbGJxfbDGdaTb0J+jToSa7QayF5dciO6d
         4jfg==
X-Gm-Message-State: AOJu0YymxUMNPCuoItb/foQPIZNr951UfFEG57iGSydMlggKIqmakMr9
	mYh456DL6za+tXQv0fsmVt3OEAfNJ35hlk/X04Wwv7X4pcQZALLkflXOcprbmwbl0fLKFmiA4ZZ
	9wccASct9pjZzRl3CLcCVIe8AgBk=
X-Received: by 2002:ad4:5e87:0:b0:616:870c:96b8 with SMTP id jl7-20020ad45e87000000b00616870c96b8mr283046qvb.3.1693513038818;
        Thu, 31 Aug 2023 13:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKsmxbV+DJ7b6GRufNNcqu4EXMeqeuic2S33WKPblsBhfVhu2iLfQSsXd6CNYuiszcB6i/5Q==
X-Received: by 2002:ad4:5e87:0:b0:616:870c:96b8 with SMTP id jl7-20020ad45e87000000b00616870c96b8mr283012qvb.3.1693513038588;
        Thu, 31 Aug 2023 13:17:18 -0700 (PDT)
Date: Thu, 31 Aug 2023 16:17:16 -0400
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
Subject: Re: [PATCH 1/7] migration/rdma: Fix save_page method to fail on
 polling error
Message-ID: <ZPD1TPNFFVax067G@x1n>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230831132546.3525721-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 31, 2023 at 03:25:40PM +0200, Markus Armbruster wrote:
> qemu_rdma_save_page() reports polling error with error_report(), then
> succeeds anyway.  This is because the variable holding the polling
> status *shadows* the variable the function returns.  The latter
> remains zero.
> 
> Broken since day one, and duplicated more recently.
> 
> Fixes: 2da776db4846 (rdma: core logic)
> Fixes: b390afd8c50b (migration/rdma: Fix out of order wrid)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


