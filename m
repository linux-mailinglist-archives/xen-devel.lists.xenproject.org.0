Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7835196E3
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320099.540938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Ny-0002dQ-GR; Wed, 04 May 2022 05:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320099.540938; Wed, 04 May 2022 05:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7Nx-000231-Gf; Wed, 04 May 2022 05:17:13 +0000
Received: by outflank-mailman (input) for mailman id 320099;
 Wed, 04 May 2022 03:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm5pc-0001mD-35
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 03:37:40 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8afb1b8f-cb5b-11ec-a406-831a346695d4;
 Wed, 04 May 2022 05:37:38 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id k1so329150pll.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 20:37:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a170902ba9700b0015e8d4eb1fesm7117388pls.72.2022.05.03.20.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 20:37:36 -0700 (PDT)
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
X-Inumbo-ID: 8afb1b8f-cb5b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lsBVjxx2frcPFNjY4/BLqdzh7cys7mpO3LyMH5LAbSE=;
        b=e/seADFb6dKCy5O35I2lb3QkGM1U1AG+HWJjIUEuWUaLYiQ/bRCqVwsL3BCOvWYEuK
         9qpY1aU7RmqPGGBT5JUv2H6Jc6siGFaT+PVsx+FN+n4iHis5NM0gOyiK9HY2IIWzLhh4
         mk3V/alwvU0/DDln8pB7kZALicerW3KUceFLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lsBVjxx2frcPFNjY4/BLqdzh7cys7mpO3LyMH5LAbSE=;
        b=UQoKhUhj8O9oTA6ogw3q2AFB5K5XaCYhdY7KmHXn6oABR2dfhGCQXHu+0HkTJOGlve
         ikD94cSP3XeW4VQdYBrERrTLhKE8UuclDL2jzTQ+E056RH2lP6JzEUQW7Aa5GFRbIxUn
         1VR2WHfA9UsUk91IH2C7U9FQWeF4qbr/Nm3M27InbdbIryJwIR050pDpTXXukcS0S9gZ
         RSA/3vO+QxJXS9WlzNiYRLMbi+aq5dm+iORZlZjp2oT9AG2vZwsJZ4bZu24/rJ7Q3i9D
         t36RElxqfCM8tW3sMLXTbTmWKBTHSaaGRGZQg6Qvk99HvFYzR8Q5m85BPqWjXL92TNFS
         lCSg==
X-Gm-Message-State: AOAM530lXVJZduSvP97LsRa0WdvZeCriAIGQ5T7ZIQvhkNd0br+Wfv/I
	6OgveiKnHeXATwvgsWLv1ysujg==
X-Google-Smtp-Source: ABdhPJw42Y4zw7XGLJ0qL8m2iK8R/sg3Y/yQJpglfujQWmDGz21UKIQOVg7Md/ZATtyrGT1c7jNF4A==
X-Received: by 2002:a17:90b:1b44:b0:1dc:315f:4510 with SMTP id nv4-20020a17090b1b4400b001dc315f4510mr8282445pjb.28.1651635456924;
        Tue, 03 May 2022 20:37:36 -0700 (PDT)
Date: Tue, 3 May 2022 20:37:35 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Rich Felker <dalias@aerifal.cx>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
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
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>, Eric Paris <eparis@parisplace.org>,
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
	Hulk Robot <hulkci@huawei.com>,
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
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH 01/32] netlink: Avoid memcpy() across flexible array
 boundary
Message-ID: <202205032027.B2A9FB4AA@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-2-keescook@chromium.org>
 <20220504033105.GA13667@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504033105.GA13667@embeddedor>

On Tue, May 03, 2022 at 10:31:05PM -0500, Gustavo A. R. Silva wrote:
> On Tue, May 03, 2022 at 06:44:10PM -0700, Kees Cook wrote:
> [...]
> > diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> > index 1b5a9c2e1c29..09346aee1022 100644
> > --- a/net/netlink/af_netlink.c
> > +++ b/net/netlink/af_netlink.c
> > @@ -2445,7 +2445,10 @@ void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err,
> >  			  NLMSG_ERROR, payload, flags);
> >  	errmsg = nlmsg_data(rep);
> >  	errmsg->error = err;
> > -	memcpy(&errmsg->msg, nlh, payload > sizeof(*errmsg) ? nlh->nlmsg_len : sizeof(*nlh));
> > +	errmsg->msg = *nlh;
> > +	if (payload > sizeof(*errmsg))
> > +		memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload,
> > +		       nlh->nlmsg_len - sizeof(*nlh));
> 
> They have nlmsg_len()[1] for the length of the payload without the header:
> 
> /**
>  * nlmsg_len - length of message payload
>  * @nlh: netlink message header
>  */
> static inline int nlmsg_len(const struct nlmsghdr *nlh)
> {
> 	return nlh->nlmsg_len - NLMSG_HDRLEN;
> }

Oh, hm, yeah, that would be much cleaner. The relationship between
"payload" and nlmsg_len is confusing in here. :)

So, this should be simpler:

-	memcpy(&errmsg->msg, nlh, payload > sizeof(*errmsg) ? nlh->nlmsg_len : sizeof(*nlh));
+	errmsg->msg = *nlh;
+	memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload, nlmsg_len(nlh));

It's actually this case that triggered my investigation in __bos(1)'s
misbehavior around sub-structs, since this case wasn't getting silenced:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832

It still feels like it should be possible to get this right without
splitting the memcpy, though. Hmpf.

> (would that function use some sanitization, though? what if nlmsg_len is
> somehow manipulated to be less than NLMSG_HDRLEN?...)

Maybe something like:

static inline int nlmsg_len(const struct nlmsghdr *nlh)
{
	if (WARN_ON(nlh->nlmsg_len < NLMSG_HDRLEN))
		return 0;
	return nlh->nlmsg_len - NLMSG_HDRLEN;
}

> Also, it seems there is at least one more instance of this same issue:
> 
> diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
> index 16ae92054baa..d06184b94af5 100644
> --- a/net/netfilter/ipset/ip_set_core.c
> +++ b/net/netfilter/ipset/ip_set_core.c
> @@ -1723,7 +1723,8 @@ call_ad(struct net *net, struct sock *ctnl, struct sk_buff *skb,
>                                   nlh->nlmsg_seq, NLMSG_ERROR, payload, 0);
>                 errmsg = nlmsg_data(rep);
>                 errmsg->error = ret;
> -               memcpy(&errmsg->msg, nlh, nlh->nlmsg_len);
> +               errmsg->msg = *nlh;
> +               memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload, nlmsg_len(nlh));

Ah, yes, nice catch!

>                 cmdattr = (void *)&errmsg->msg + min_len;
> 
>                 ret = nla_parse(cda, IPSET_ATTR_CMD_MAX, cmdattr,
> 
> --
> Gustavo
> 
> [1] https://elixir.bootlin.com/linux/v5.18-rc5/source/include/net/netlink.h#L577

-- 
Kees Cook

