Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B1D51A46D
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320861.541821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHEH-0002Nd-6T; Wed, 04 May 2022 15:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320861.541821; Wed, 04 May 2022 15:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHEH-0002LT-3K; Wed, 04 May 2022 15:47:53 +0000
Received: by outflank-mailman (input) for mailman id 320861;
 Wed, 04 May 2022 15:38:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nmH50-0001L8-5N
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:38:18 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36f89b46-cbc0-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:38:16 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id j6so1408490pfe.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 08:38:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a056a00321000b0050dc76281a0sm1144893pfb.122.2022.05.04.08.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:38:14 -0700 (PDT)
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
X-Inumbo-ID: 36f89b46-cbc0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KqAJb/V6gfBBDG6bSPIb4vESmdq1P/sKe2F177CTgUM=;
        b=fQrMYNAIqMyggez1Cxk6MO5ffmDcMsHa95ZyVgeB+XLocHYSpcdXLdDMIvfhtVHebJ
         c6KLuD9O1zHpfXOArUQ9i6OPKZN0wLEdS36xK8UGnJ7GhAZoY1ZaUI/INEIjt/aYGDme
         7yPqIKR/2ePc228VdQYx3R6Gd7ox0JMkE5pTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KqAJb/V6gfBBDG6bSPIb4vESmdq1P/sKe2F177CTgUM=;
        b=v6LRtTLznbgcj3mzaOa4py1sIX+892jBLw4qZz9G5a8Mdiy9mV17rbNZo20U2sEOzu
         eADp+cmcQxqnmKPK+4uC1avaljrE2NJ1IpU8daPh+Xo2TtDWbUcLucn1MP2V9aIbquA4
         2pn1YVs6fFbfsf9S4sUtoehOp1IPVdY3j8tsSKJRKbIyWxMg8Uud34h7wIgV03nLtRK7
         WUKWHZYhQ0eVRApUK3HasUxRSl7m9Gw0BsQY0xdMt8pN8BxnflTdSqw1ZerpQ3FJpZ6+
         PkSuA6SdOt4961jyW7osjVijF7f1HGLEUpRMnboa5/VvyAmFS2Nxz9rD4eCAU5rf8Krl
         eJVA==
X-Gm-Message-State: AOAM533KbJR1LdGZzHwzG8mlFf+l7W3goWOY1t4CQ2GxjWRFRg4mhFoH
	heqkzZ4+jV17UIYEjBd3rCGnuw==
X-Google-Smtp-Source: ABdhPJwBmZJ9wb0LzywgcJVjfOXV8uAsCTwjDfuLOerjn5Pxz0fuB6CwDGapDJ7lr8xm5AQuNXIQuw==
X-Received: by 2002:a63:88c8:0:b0:3ab:1871:13b4 with SMTP id l191-20020a6388c8000000b003ab187113b4mr18710813pgd.85.1651678695070;
        Wed, 04 May 2022 08:38:15 -0700 (PDT)
Date: Wed, 4 May 2022 08:38:13 -0700
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Keith Packard <keithp@keithp.com>,
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
Message-ID: <202205040819.DEA70BD@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>

On Wed, May 04, 2022 at 09:25:56AM +0200, Johannes Berg wrote:
> On Tue, 2022-05-03 at 18:44 -0700, Kees Cook wrote:
> > 
> > For example, using the most complicated helper, mem_to_flex_dup():
> > 
> >     /* Flexible array struct with members identified. */
> >     struct something {
> >         int mode;
> >         DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, how_many);
> >         unsigned long flags;
> >         DECLARE_FLEX_ARRAY_ELEMENTS(u32, value);
> 
> In many cases, the order of the elements doesn't really matter, so maybe
> it'd be nicer to be able to write it as something like
> 
> DECLARE_FLEX_STRUCT(something,
> 	int mode;
> 	unsigned long flags;
> 	,
> 	int, how_many,
> 	u32, value);
> 
> perhaps? OK, that doesn't seem so nice either.
> 
> Maybe
> 
> struct something {
> 	int mode;
> 	unsigned long flags;
> 	FLEX_ARRAY(
> 		int, how_many,
> 		u32, value
> 	);
> };

Yeah, I mention some of my exploration of this idea in the sibling reply:
https://lore.kernel.org/linux-hardening/202205040730.161645EC@keescook/#t

It seemed like requiring a structure be rearranged to take advantage of
the "automatic layout introspection" wasn't very friendly. On the other
hand, looking at the examples, most of them are already neighboring
members. Hmmm.

> or so? The long and duplicated DECLARE_FLEX_ARRAY_ELEMENTS_COUNT and
> DECLARE_FLEX_ARRAY_ELEMENTS seems a bit tedious to me, at least in cases
> where the struct layout is not the most important thing (or it's already
> at the end anyway).

The names aren't great, but I wanted to distinguish "elements" as the
array not the count. Yay naming.

However, perhaps the solution is to have _both_. i.e using
BOUNDED_FLEX_ARRAY(count_type, count_name, array_type, array_name) for
the "neighboring" case, and the DECLARE...{ELEMENTS,COUNT} for the
"split" case.

And DECLARE_FLEX_ARRAY_ELEMENTS could actually be expanded to include
the count_name too, so both methods could be "forward portable" to a
future where C grew the syntax for bounded flex arrays.

> 
> >     struct something *instance = NULL;
> >     int rc;
> > 
> >     rc = mem_to_flex_dup(&instance, byte_array, count, GFP_KERNEL);
> >     if (rc)
> >         return rc;
> 
> This seems rather awkward, having to set it to NULL, then checking rc
> (and possibly needing a separate variable for it), etc.

I think the errno return is completely required. I had an earlier version
of this that was much more like a drop-in replacement for memcpy that
would just truncate or panic, and when I had it all together, I could
just imagine hearing Linus telling me to start over because it was unsafe
(truncation may be just as bad as overflow) and disruptive ("never BUG"),
and that it should be recoverable. So, I rewrote it all to return a
__must_check errno.

Requiring instance to be NULL is debatable, but I feel pretty strongly
about it because it does handle a class of mistakes (resource leaks),
and it's not much of a burden to require a known-good starting state.

> But I can understand how you arrived at this:
>  - need to pass instance or &instance or such for typeof()
>    or offsetof() or such

Right.

>  - instance = mem_to_flex_dup(instance, ...)
>    looks too much like it would actually dup 'instance', rather than
>    'byte_array'

And I need an errno output to keep imaginary Linus happy. :)

>  - if you pass &instance anyway, checking for NULL is simple and adds a
>    bit of safety

Right.

> but still, honestly, I don't like it. As APIs go, it feels a bit
> cumbersome and awkward to use, and you really need everyone to use this,
> and not say "uh what, I'll memcpy() instead".

Sure, and I have tried to get it down as small as possible. The earlier
"just put all the member names in every call" version was horrid. :P I
realize it's more work to check errno, but the memcpy() API we've all
been trained to use is just plain dangerous. I don't think it's
unreasonable to ask people to retrain themselves to avoid it. All that
said, yes, I want it to be as friendly as possible.

> Maybe there should also be a realloc() version of it?

Sure! Seems reasonable. I'd like to see the code pattern for this
though. Do you have any examples? Most of what I'd been able to find for
the fragile memcpy() usage was just basic serialize/deserialize or
direct copying.

> > +/** __fas_bytes - Calculate potential size of flexible array structure
> 
> I think you forgot "\n *" in many cases here after "/**".

Oops! Yes, thank you. I'll fix these.

-Kees

-- 
Kees Cook

