Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B6151D08F
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 07:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322360.543864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLf-0001Yx-Hb; Fri, 06 May 2022 05:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322360.543864; Fri, 06 May 2022 05:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLf-0001Nx-9m; Fri, 06 May 2022 05:17:51 +0000
Received: by outflank-mailman (input) for mailman id 322360;
 Thu, 05 May 2022 19:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4XN/=VN=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nmhD4-0004WN-3d
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 19:32:22 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 147210c8-ccaa-11ec-a406-831a346695d4;
 Thu, 05 May 2022 21:32:21 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id k1so5327212pll.4
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 12:32:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 q187-20020a632ac4000000b003c14af5063fsm1666643pgq.87.2022.05.05.12.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:32:19 -0700 (PDT)
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
X-Inumbo-ID: 147210c8-ccaa-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EOewjZKogNzEx9zFkxTiwVeX9O73E8+rxUrKCGLnZxg=;
        b=TgYp87XeMuHw4kfuuIYKyJ5xg3Bf+EBlgFpOVZz9+/0BPs+Z6azVvmnOICk6zx2eTE
         tczIFjF07XtN/n9uGmSnmZf+pbPbkOzW9u24HVcBrKjfFRAXW8suN/eYiFsQiaSTDjAj
         AGDsgPRlkyLVEDH7ZM2ezggNxFIlqaWFz6sF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EOewjZKogNzEx9zFkxTiwVeX9O73E8+rxUrKCGLnZxg=;
        b=OJtc/+6Hh/aVYasailIzy1n2itDAEIfh5OLXb3asdy3vHE6IpEH3v8nfeMIgvvekiP
         ksPRGq2PUgElut+wOrDzlXpTIxfGg8UPTbJI0AEn3Jnt/2PCs7KRS1BKxbqOblMo0kvL
         fGZ1FHMjUdnPjFd8Czbm/K2Ya+D0/5EKxPGK9pFLwLHJka/kwmB1XrTBXSSWpKTZpyRi
         wYDZeOZhMTKU3C8GlBZ/PbM83NOBb5lplfrRmRD4IfiKdFdMDK00vCgGc0aVPsNCW8i4
         6WvojIXm11D7J27grcGlX/xvQhyVsuwLoofGu/EPpOPqZx0+7a6JBjnpRd8O22StfR2D
         xZNQ==
X-Gm-Message-State: AOAM532BTQWV6XmRI+RYW9y+ezliXHorqGEsBq8b8VNdPJC7F8+rtJfW
	UQBKfdwDOVMkzVzQ194MtGuMNw==
X-Google-Smtp-Source: ABdhPJxL8Xyqbkq2ci79I6DY8zysA5FCbZa+vgjColIyO04wVwYosK0CB3nAiv0hotnSlV0fyXrrOw==
X-Received: by 2002:a17:90a:c08a:b0:1d9:88de:d192 with SMTP id o10-20020a17090ac08a00b001d988ded192mr8024103pjs.8.1651779139639;
        Thu, 05 May 2022 12:32:19 -0700 (PDT)
Date: Thu, 5 May 2022 12:32:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Keith Packard <keithp@keithp.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Daniel Axtens <dja@axtens.net>,
	Dan Williams <dan.j.williams@intel.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org,
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
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
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
	John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>, keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com, Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>, Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
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
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
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
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
Message-ID: <202205051228.4D5B8CD624@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
 <202205040819.DEA70BD@keescook>
 <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>
 <871qx8qabo.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qx8qabo.fsf@keithp.com>

On Thu, May 05, 2022 at 08:16:11AM -0700, Keith Packard wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
> 
> > Yeah, dunno, I guess I'm slightly more on the side of not requiring it,
> > since we don't do the same for kmalloc() etc. and probably really
> > wouldn't want to add kmalloc_s() that does it ;-)
> 
> I suspect the number of bugs this catches will be small, but they'll be
> in places where the flow of control is complicated. What we want is to
> know that there's no "real" value already present. I'd love it if we
> could make the macro declare a new name (yeah, I know, mixing
> declarations and code).

I don't think I can do a declaration and an expression statement at the
same time with different scopes, but that would be kind of cool. We did
just move to c11 to gain the in-loop iterator declarations...

> Of course, we could also end up with people writing a wrapping macro
> that sets the variable to NULL before invoking the underlying macro...

I hope it won't come to that! :)

-- 
Kees Cook

