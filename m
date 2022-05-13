Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF464526682
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 17:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328605.551666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npXYz-0004Xv-DF; Fri, 13 May 2022 15:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328605.551666; Fri, 13 May 2022 15:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npXYz-0004Uo-AO; Fri, 13 May 2022 15:50:45 +0000
Received: by outflank-mailman (input) for mailman id 328605;
 Fri, 13 May 2022 15:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/V4=VV=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1npXT6-0003fC-Ja
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 15:44:40 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98b7e3db-d2d3-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 17:44:39 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id e24so8415481pjt.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 May 2022 08:44:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b0050dc762815fsm1962911pfg.57.2022.05.13.08.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:44:37 -0700 (PDT)
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
X-Inumbo-ID: 98b7e3db-d2d3-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ptf+f5eGDE5JGEu9b++jcke6m+bu7vV+b5hUvmlYQQo=;
        b=SjhK1c9Qotr1qDOqwKlBj3Rw1mlIdcXMiMnONLsDWXIlWQego7JtnDd+2u8lNhcb5o
         VntS/+cGhwP5NiXqFa0xo4Eurcd+QW1c6ntV0GvlsEyq5axRcQY1ctFnycyCWVGns4We
         RoLfLtxqMSNKYzeck8DbrFFmqTXggtzGcj49k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ptf+f5eGDE5JGEu9b++jcke6m+bu7vV+b5hUvmlYQQo=;
        b=HoYvLbw0+g8e7kC5GruStGpbPxWkNXqopwN6LqI2SCQ/YzGGv1GWJ5juJWV5R81Rnj
         eudEOLlufhwbNUqEhtIWUcB1jgQNs5+NqcGF7A6P36FmP/oTmwioofz7VevLzwV05ASu
         wPywCwiPXdnuP3vLJUIbWOnghpX8FW+VQZPTLbTNqD+a097Ps0yPAzLSyD1sIHuSdPZm
         b6S8T/rjHcYH69n9e0TDdJQGP7PGsfFiNmDDARpb6jY2Ds/NnES4/jEYKCeoIlDSvk8r
         1NfojlMfOSMTbagUKoGDVMgdOQzF9GWAUYEsv3kFWuk5hkNq34YaP7BrWl2q/J3eskgw
         W+fQ==
X-Gm-Message-State: AOAM533EPXZpvnh9KLhZPm8yzXtoNx8c8yzSL+ht66yXZRpdB0ekpglR
	QEDbHpA5Yz9Ch6gEfTYx2KHhZA==
X-Google-Smtp-Source: ABdhPJwqAuPQuzMa7Nw48HvMFa1XRY2nR8VILarc4i/slU4gICU2Jf1z21nHPUdwsTyzLFkYEaFwYQ==
X-Received: by 2002:a17:902:e393:b0:15c:f1c1:c527 with SMTP id g19-20020a170902e39300b0015cf1c1c527mr5389721ple.22.1652456677768;
        Fri, 13 May 2022 08:44:37 -0700 (PDT)
Date: Fri, 13 May 2022 08:44:33 -0700
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
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
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,
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
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 19/32] afs: Use mem_to_flex_dup() with struct afs_acl
Message-ID: <202205130841.686F21B64@keescook>
References: <20220504014440.3697851-20-keescook@chromium.org>
 <20220504014440.3697851-1-keescook@chromium.org>
 <898803.1652391665@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <898803.1652391665@warthog.procyon.org.uk>

On Thu, May 12, 2022 at 10:41:05PM +0100, David Howells wrote:
> 
> Kees Cook <keescook@chromium.org> wrote:
> 
> >  struct afs_acl {
> > -	u32	size;
> > -	u8	data[];
> > +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, size);
> > +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, data);
> >  };
> 
> Oof...  That's really quite unpleasant syntax.  Is it not possible to have
> mem_to_flex_dup() and friends work without that?  You are telling them the
> fields they have to fill in.

Other threads discussed this too. I'm hoping to have something more
flexible (pardon the pun) in v2.

> [...]
> or:
> 
> 	ret = mem_to_flex_dup(&acl, buffer, size, GFP_KERNEL);
> 	if (ret < 0)
> 
> (or use != 0 rather than < 0)

Sure, I can make the tests more explicit. The kerndoc, etc all shows it's
using < 0 for errors.

-- 
Kees Cook

