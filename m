Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5143251B756
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321065.542371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfj-0008CQ-O4; Thu, 05 May 2022 05:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321065.542371; Thu, 05 May 2022 05:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfj-00082J-Gn; Thu, 05 May 2022 05:05:03 +0000
Received: by outflank-mailman (input) for mailman id 321065;
 Wed, 04 May 2022 23:41:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozbP=VM=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1nmOVn-00024e-VY
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 23:34:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc27fa87-cc02-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 01:34:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86DE561BD4;
 Wed,  4 May 2022 23:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1B9C385A4;
 Wed,  4 May 2022 23:34:15 +0000 (UTC)
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
X-Inumbo-ID: bc27fa87-cc02-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651707264;
	bh=rg7gAW6bX54fvgfTyj+iLNX8iI1sLhWyZHkaZSInPKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rr/VhCUks/jvvIukLEQ8hvouelHSSI+9oZesVy9WjHsFReyAH53SdMAhNcNxTncRh
	 AeNcfpQbGYHxmfRd7jiZWMjG0UbB4TKauYhVIbCXLf6VkMiM+KTnvLtKq+XumdW3b5
	 5XsvfgT+eqRG0aM2cOon7t/TFhjG0ZcaDmVjSrCT8tVFYMC+NZbIz/9jgmtLbpb2XF
	 jXkHA/11zXgPOkzwOz9hKL1cmOdu/0VL29aSmhBA26JK83Tblanq8QYFCE42J8CQ6Y
	 8C4e2ka/Vcj7axXhNyNWWZ2uF0Rop6olk1luKtEofCYGXG5sML5MH30Czl0f2TcCS9
	 K08sslbYEpn+w==
Date: Wed, 4 May 2022 18:43:24 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Kees Cook <keescook@chromium.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	netdev@vger.kernel.org, selinux@vger.kernel.org,
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
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>,
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
	Nathan Chancellor <nathan@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Rich Felker <dalias@aerifal.cx>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 28/32] selinux: Use mem_to_flex_dup() with xfrm and sidtab
Message-ID: <20220504234324.GA12556@embeddedor>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-29-keescook@chromium.org>
 <CAHC9VhT5Y=ENiSyb=S-NVbGX63sLOv4nVuR_GS-yww6tiz0wYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhT5Y=ENiSyb=S-NVbGX63sLOv4nVuR_GS-yww6tiz0wYA@mail.gmail.com>

Hi Paul,

On Wed, May 04, 2022 at 06:57:28PM -0400, Paul Moore wrote:
> On Tue, May 3, 2022 at 9:57 PM Kees Cook <keescook@chromium.org> wrote:

[..]

> > +++ b/include/uapi/linux/xfrm.h
> > @@ -31,9 +31,9 @@ struct xfrm_id {
> >  struct xfrm_sec_ctx {
> >         __u8    ctx_doi;
> >         __u8    ctx_alg;
> > -       __u16   ctx_len;
> > +       __DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, ctx_len);
> >         __u32   ctx_sid;
> > -       char    ctx_str[0];
> > +       __DECLARE_FLEX_ARRAY_ELEMENTS(char, ctx_str);
> >  };
> 
> While I like the idea of this in principle, I'd like to hear about the
> testing you've done on these patches.  A previous flex array
> conversion in the audit uapi headers ended up causing a problem with

I'm curious about which commit caused those problems...?

Thanks
--
Gustavo

> GCC12 and SWIG; while it was a SWIG problem and not a kernel header
> problem that was thin consolation for those with broken builds.

