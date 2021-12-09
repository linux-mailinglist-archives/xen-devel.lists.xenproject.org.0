Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632AF46E674
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 11:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242871.420009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGTf-0008U7-Tg; Thu, 09 Dec 2021 10:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242871.420009; Thu, 09 Dec 2021 10:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvGTf-0008SJ-PT; Thu, 09 Dec 2021 10:16:39 +0000
Received: by outflank-mailman (input) for mailman id 242871;
 Thu, 09 Dec 2021 10:16:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A59D=Q2=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1mvGTd-0008SD-Cf
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 10:16:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 168e6522-58d9-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 11:16:36 +0100 (CET)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-43TT07apOyiRV62Y01BGhA-1; Thu, 09 Dec 2021 05:16:33 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 e2-20020ac84142000000b002b4bc4ffc49so8028555qtm.8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 02:16:33 -0800 (PST)
Received: from steredhat (host-87-21-203-138.retail.telecomitalia.it.
 [87.21.203.138])
 by smtp.gmail.com with ESMTPSA id y18sm3753945qtx.19.2021.12.09.02.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:16:32 -0800 (PST)
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
X-Inumbo-ID: 168e6522-58d9-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639044994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=skSdkMP3/Z5ledz3SKJURFKwF+2QK06u2MtL2wrAHEA=;
	b=eJ3PPnqGbgDhaOFwlkM/pWlsQIi+recOU/k/PNnRCXZzMyx/m2uDqlH2c4YmJC153IL2IV
	Osh0vpH9yIMFTkPN1Bobj65JcZFSRAKVMJRZseojpDEyUS+J2QuUaMWm/j/RA2z3upqyrX
	rU7B6ID90F2sIjtr8dQd5ubBGymX0xw=
X-MC-Unique: 43TT07apOyiRV62Y01BGhA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skSdkMP3/Z5ledz3SKJURFKwF+2QK06u2MtL2wrAHEA=;
        b=AGUKy0WQ8TLqHn09CNvsKn+TpE9BztbKP+AhEzY/CJ0K/h81UMKg/0LqArTV47buWZ
         w5jiHzavFRSAWxcOa9/Meqdsf5vjGEavp3zm1DbMcmLlWx7lLE5zgvXBbZYGQdC3OXiA
         fXg2Jt9voBbfJvG9a0WCWEqyZkm5aBpRncbaBVVoDsfXiZkxZKxKNAg3keNlNYE4HO3A
         ECZpgqjOBbSVw5dgwArE3DXlNpY/D7NKIbk0A/Nm8dN1IfYuuENFTDmRzbEm4bMSPTRy
         QnXtUb9s2AWOtUWzLpvXfWexYqWN5oh6vUaF0D9ZLwYcWtpVwVhtL6JqlqUAXA29Bacb
         h8CQ==
X-Gm-Message-State: AOAM5338MK6LKovQMI0y2OQDRJHTcrURRsHI87jto767ZNzWYFgShYpt
	6vOoDYebSMNmHwdgin6vVa5s8tBPQ0jrwUfNrJEOELnIQn4/EF179NOy1B/MubMDWjIxSZvaSLi
	ZVBkJJ+pPzqXhhbQO0fKUCPX3aHQ=
X-Received: by 2002:a05:622a:346:: with SMTP id r6mr15827160qtw.78.1639044993488;
        Thu, 09 Dec 2021 02:16:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRJ/jy5gwTgSypAPgE1xPC61ttuND6x5A5qbkOiCsntHwUEjX6o68lu/SOhEC/Ll9Ki4cxXQ==
X-Received: by 2002:a05:622a:346:: with SMTP id r6mr15827126qtw.78.1639044993273;
        Thu, 09 Dec 2021 02:16:33 -0800 (PST)
Date: Thu, 9 Dec 2021 11:16:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>, xen-devel@lists.xenproject.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Message-ID: <20211209101626.t5fkmsnjxwjveb5i@steredhat>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Dec 07, 2021 at 01:23:30PM +0000, Stefan Hajnoczi wrote:
>v3:
>- Fixed FUSE export aio_set_fd_handler() call that I missed and double-checked
>  for any other missing call sites using Coccinelle [Rich]
>v2:
>- Cleaned up unused return values in nvme and virtio-blk [Stefano]
>- Documented try_poll_mode() ready_list argument [Stefano]
>- Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers [Stefano]
>
>The first patch improves AioContext's adaptive polling execution time
>measurement. This can result in better performance because the algorithm makes
>better decisions about when to poll versus when to fall back to file descriptor
>monitoring.
>
>The remaining patches unify the virtio-blk and virtio-scsi dataplane and
>non-dataplane virtqueue handlers. This became possible because the dataplane
>handler function now has the same function signature as the non-dataplane
>handler function. Stefano Garzarella prompted me to make this refactoring.

Great clean up! Thanks for doing this, everything LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


