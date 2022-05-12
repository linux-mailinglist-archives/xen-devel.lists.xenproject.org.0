Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB03525B08
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 07:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327986.551187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npNwU-00066L-2Z; Fri, 13 May 2022 05:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327986.551187; Fri, 13 May 2022 05:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npNwT-00061r-U1; Fri, 13 May 2022 05:34:21 +0000
Received: by outflank-mailman (input) for mailman id 327986;
 Thu, 12 May 2022 21:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEzj=VU=redhat.com=dhowells@srs-se1.protection.inumbo.net>)
 id 1npGf4-0007OA-14
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 21:47:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c48fae1-d23d-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 23:47:53 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-NFJuRb6GPNSx8zbxy-lQgA-1; Thu, 12 May 2022 17:47:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD4CF296A60E;
 Thu, 12 May 2022 21:47:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.37.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13B84010E23;
 Thu, 12 May 2022 21:47:31 +0000 (UTC)
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
X-Inumbo-ID: 2c48fae1-d23d-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652392071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YWzVrdFw3n8EH2Ce8k4daz33bBf83epcMdzHAJNT8tE=;
	b=PJ+AYPyj8pLd2Z53EbADYFV5StVYRn6S6jED85CI2KX0LlZFLoUwWpJgqxLVR1cCp1TA7w
	Ee+yFuIUie++p0yEbE/jlRz3u/BKcr+QXYIEz+i/gmydFs8giFyA8SPefd+tYPxjE25Y4f
	XVAG82zZg9XBaQNlBcyJxcIQAVNriuI=
X-MC-Unique: NFJuRb6GPNSx8zbxy-lQgA-1
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org,
    Al Viro <viro@zeniv.linux.org.uk>,
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
    David Gow <davidgow@google.com>, David Howells <dhowells@redhat.com>,
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
    linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
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
    Marc Dionne <marc.dionne@auristor.com>,
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
Subject: Re: [PATCH 00/32] Introduce flexible array struct memcpy() helpers
MIME-Version: 1.0
Date: Thu, 12 May 2022 22:47:31 +0100
Message-ID: <899235.1652392051@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhowells@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain


Kees Cook <keescook@chromium.org> wrote:

> I'm happy to also point out that the conversions (patches 5+) are actually
> a net reduction in lines of code:
>  49 files changed, 154 insertions(+), 244 deletions(-)

That doesn't mean that it's actually code that's clearer to read.  I would say
that it's actually less clear.  In a bunch of places, you've done something
like:

-	e = kmalloc(...);
-	if (!e)
+	if (__mem_to_flex_dup(&e, ...))

The problem is that, to me at least, it looks like:

-	e = kmalloc(...);
-	if (kmalloc failed)
+	if (__mem_to_flex_dup(&e, ...) succeeded)

David


