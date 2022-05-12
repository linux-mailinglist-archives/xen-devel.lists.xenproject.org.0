Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F46B525B07
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 07:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327983.551182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npNwT-00061g-Ou; Fri, 13 May 2022 05:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327983.551182; Fri, 13 May 2022 05:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npNwT-0005zr-Kp; Fri, 13 May 2022 05:34:21 +0000
Received: by outflank-mailman (input) for mailman id 327983;
 Thu, 12 May 2022 21:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEzj=VU=redhat.com=dhowells@srs-se1.protection.inumbo.net>)
 id 1npGYw-0007I3-Fj
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 21:41:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49adfa64-d23c-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 23:41:32 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-_lIP8Q0uMUaVvsz49D3spw-1; Thu, 12 May 2022 17:41:24 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9268296A609;
 Thu, 12 May 2022 21:41:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.37.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2C7416156;
 Thu, 12 May 2022 21:41:05 +0000 (UTC)
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
X-Inumbo-ID: 49adfa64-d23c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652391691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YX4qZOz+9WbIDFanSGeueshT1smpwyQHiwCB0mvZIgg=;
	b=PJOaSv3WRC6mW8fZIEeGNINL8AFfYV/cmpyaj0b60jdo61YZtLWwHjI13lcxJUtguTiBd0
	e7Viy8VZ2VtnUIXmveWCj7AsY5cedemQKGLnZmSszi8yF8q6vDw8yfxnbp4xaZVd5JbEgd
	tna+B+5FsaWBa4ZrgAYRX5bJ04PvTc4=
X-MC-Unique: _lIP8Q0uMUaVvsz49D3spw-1
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220504014440.3697851-20-keescook@chromium.org>
References: <20220504014440.3697851-20-keescook@chromium.org> <20220504014440.3697851-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
    David Howells <dhowells@redhat.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    linux-afs@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
    alsa-devel@alsa-project.org, Al Viro <viro@zeniv.linux.org.uk>,
    Andrew Gabbasov <andrew_gabbasov@mentor.com>,
    Andrew Morton <akpm@linux-foundation.org>,
    Andy Gross <agross@kernel.org>, Andy Lavr <andy.lavr@gmail.com>,
    Arend van Spriel <aspriel@gmail.com>,
    Baowen Zheng <baowen.zheng@corigine.com>,
    Bjorn Andersson <bjorn.andersson@linaro.org>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>,
    Bradley Grove <linuxdrivers@attotech.com>,
    brcm80211-dev-list.pdl@broadcom.com,
    Christian Brauner <brauner@kernel.org>,
    Christian =?utf-8?Q?G=C3=B6ttsche?= <cgzones@googlemail.com>,
    Christian Lamparter <chunkeey@googlemail.com>,
    Chris Zankel <chris@zankel.net>, Cong Wang <cong.wang@bytedance.com>,
    Daniel Axtens <dja@axtens.net>,
    Daniel Vetter <daniel.vetter@ffwll.ch>,
    Dan Williams <dan.j.williams@intel.com>,
    David Gow <davidgow@google.com>,
    "David S. Miller" <davem@davemloft.net>,
    Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
    devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
    Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
    Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>,
    Eric Paris <eparis@parisplace.org>,
    Eugeniu Rosca <erosca@de.adit-jv.com>,
    Felipe Balbi <balbi@kernel.org>,
    Francis Laniel <laniel_francis@privacyrequired.com>,
    Frank Rowand <frowand.list@gmail.com>,
    Franky Lin <franky.lin@broadcom.com>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Gregory Greenman <gregory.greenman@intel.com>,
    Guenter Roeck <linux@roeck-us.net>,
    Haiyang Zhang <haiyangz@microsoft.com>,
    Hante Meuleman <hante.meuleman@broadcom.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Hulk Robot <hulkci@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
    "James E.J. Bottomley" <jejb@linux.ibm.com>,
    James Morris <jmorris@namei.org>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
    Jens Axboe <axboe@kernel.dk>,
    Johan Hedberg <johan.hedberg@gmail.com>,
    Johannes Berg <johannes.berg@intel.com>,
    Johannes Berg <johannes@sipsolutions.net>,
    John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>,
    Kalle Valo <kvalo@kernel.org>, Keith Packard <keithp@keithp.com>,
    keyrings@vger.kernel.org, kunit-dev@googlegroups.com,
    Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
    "K. Y. Srinivasan" <kys@microsoft.com>,
    Lars-Peter Clausen <lars@metafoo.de>,
    Lee Jones <lee.jones@linaro.org>, Leon Romanovsky <leon@kernel.org>,
    Liam Girdwood <lgirdwood@gmail.com>,
    linux1394-devel@lists.sourceforge.net,
    linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
    linux-bluetooth@vger.kernel.org, linux-hardening@vger.kernel.org,
    linux-hyperv@vger.kernel.org, linux-integrity@vger.kernel.org,
    linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,
    linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
    linux-wireless@vger.kernel.org, linux-xtensa@linux-xtensa.org,
    llvm@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
    Louis Peens <louis.peens@corigine.com>,
    Luca Coelho <luciano.coelho@intel.com>,
    Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
    Marcel Holtmann <marcel@holtmann.org>,
    Mark Brown <broonie@kernel.org>,
    "Martin K. Petersen" <martin.petersen@oracle.com>,
    Max Filippov <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
    Muchun Song <songmuchun@bytedance.com>,
    Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org,
    Nick Desaulniers <ndesaulniers@google.com>,
    Nuno =?utf-8?Q?S=C3=A1?= <nuno.sa@analog.com>,
    Paolo Abeni <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>,
    Rich Felker <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>,
    Russell King <linux@armlinux.org.uk>, selinux@vger.kernel.org,
    "Serge E. Hallyn" <serge@hallyn.com>,
    SHA-cyfmac-dev-list@infineon.com,
    Simon Horman <simon.horman@corigine.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Stefan Richter <stefanr@s5r6.in-berlin.de>,
    Steffen Klassert <steffen.klassert@secunet.com>,
    Stephen Hemminger <sthemmin@microsoft.com>,
    Stephen Smalley <stephen.smalley.work@gmail.com>,
    Tadeusz Struk <tadeusz.struk@linaro.org>,
    Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
    Udipto Goswami <quic_ugoswami@quicinc.com>,
    Vincenzo Frascino <vincenzo.frascino@arm.com>,
    wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
    xen-devel@lists.xenproject.org,
    Xiu Jianfeng <xiujianfeng@huawei.com>,
    Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 19/32] afs: Use mem_to_flex_dup() with struct afs_acl
MIME-Version: 1.0
Date: Thu, 12 May 2022 22:41:05 +0100
Message-ID: <898803.1652391665@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhowells@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Kees Cook <keescook@chromium.org> wrote:

>  struct afs_acl {
> -	u32	size;
> -	u8	data[];
> +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, size);
> +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
>  };

Oof...  That's really quite unpleasant syntax.  Is it not possible to have
mem_to_flex_dup() and friends work without that?  You are telling them the
fields they have to fill in.

> +	struct afs_acl *acl = NULL;
>  
> -	acl = kmalloc(sizeof(*acl) + size, GFP_KERNEL);
> -	if (!acl) {
> +	if (mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL)) {

Please don't do that.  Either do:

	acl = mem_to_flex_dup(buffer, size, GFP_KERNEL);
	if (!acl)

or:

	acl = mem_to_flex_dup(buffer, size, GFP_KERNEL);
	if (IS_ERR(acl))

Please especially don't make it that an apparent 'true' return indicates an
error.  If you absolutely must return the acl pointer through the argument
list (presumably because it's actually a macro), make it return false on
failure:

	if (!mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL))

or return and explicitly check for an error code:

	if (mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL) < 0)

or:

	ret = mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL);
	if (ret < 0)

(or use != 0 rather than < 0)

David


