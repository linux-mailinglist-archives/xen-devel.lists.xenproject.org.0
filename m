Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D404551A354
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320810.541750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGeL-0004TS-Nk; Wed, 04 May 2022 15:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320810.541750; Wed, 04 May 2022 15:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmGeL-0004Qm-KC; Wed, 04 May 2022 15:10:45 +0000
Received: by outflank-mailman (input) for mailman id 320810;
 Wed, 04 May 2022 15:08:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nmGcA-0003bg-WC
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:08:31 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dc8c419-cbbc-11ec-a406-831a346695d4;
 Wed, 04 May 2022 17:08:29 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id e24so1489435pjt.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 08:08:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a62be09000000b0050dc76281fesm8311194pff.216.2022.05.04.08.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:08:27 -0700 (PDT)
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
X-Inumbo-ID: 0dc8c419-cbbc-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qb+1GrJs8SRgE6Wq+GlmzxuejfTqdKZ3b89DzJavSQw=;
        b=QW7CQXai9IiD71Wvf+o2VYxsrI+DMXmN1vsS0b5DV0rtrX+G8r3eGzQnrLgcSNLS6o
         18VjexLmt9t17aqS0qc4jCF5CPslGIy/SB1vEauI+iOiw3aemKigwzjm7wU//Osg3Pbt
         9wMF/4HUhAaX0invtmDD41DdrKFbACP1VK8u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qb+1GrJs8SRgE6Wq+GlmzxuejfTqdKZ3b89DzJavSQw=;
        b=XvfkywNj3hPCxapKjjwM40c8Xxsteuyr18doI0sCiVopQbPMJwrhv7B9gLsgi7kuOm
         Er405qRRSZXaKzuW1eOkV+cHqv64dLxXBviYiwUBayLFbTH4eMqWFM4QaZQa8rqf1vMx
         AOniQOEc5gSs8Q6NEmx7x2c7q6hKmDIjUS8f8yOHAvsRoTxakxpud9R4RWZG0vxMX7oN
         5uSINehXYJteq7XEiEj7LiaXbIlViVPL3ij0IMmuisinhwTEW0CtqfXvGRldfniw9eWx
         r3O/AcexBq7xEinQB1eklqyEc3dE3N23rtxrg5pWVSWd92GT3Z83iDjHXnjbl3Wb1yRP
         r29w==
X-Gm-Message-State: AOAM531OFwVDRAv449Pg2VeyEfslOkQfpvAVMoSxLWtcb8Jur7Ba4boh
	iPXvYmomoRc27rYPfNxw6FOnzw==
X-Google-Smtp-Source: ABdhPJwHiFEMEf0LT8rKs64uS9VK7WCOKMtRJ3EqkT4Zb3Dx1isF6RYPGWL4Kz+uhEu4FzOD4HUSMQ==
X-Received: by 2002:a17:902:82c8:b0:15c:f7c7:ef9d with SMTP id u8-20020a17090282c800b0015cf7c7ef9dmr22125373plz.44.1651676908149;
        Wed, 04 May 2022 08:08:28 -0700 (PDT)
Date: Wed, 4 May 2022 08:08:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
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
	Keith Packard <keithp@keithp.com>, keyrings@vger.kernel.org,
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
	linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	llvm@lists.linux.dev, Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Paul Moore <paul@paul-moore.com>, Rich Felker <dalias@aerifal.cx>,
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
	Wei Liu <wei.liu@kernel.org>, xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 10/32] wcn36xx: Use mem_to_flex_dup() with struct
 wcn36xx_hal_ind_msg
Message-ID: <202205040730.161645EC@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-11-keescook@chromium.org>
 <8735hpc0q1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735hpc0q1.fsf@kernel.org>

On Wed, May 04, 2022 at 08:42:46AM +0300, Kalle Valo wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > As part of the work to perform bounds checking on all memcpy() uses,
> > replace the open-coded a deserialization of bytes out of memory into a
> > trailing flexible array by using a flex_array.h helper to perform the
> > allocation, bounds checking, and copying.
> >
> > Cc: Loic Poulain <loic.poulain@linaro.org>
> > Cc: Kalle Valo <kvalo@kernel.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: wcn36xx@lists.infradead.org
> > Cc: linux-wireless@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> [...]
> 
> > --- a/drivers/net/wireless/ath/wcn36xx/smd.h
> > +++ b/drivers/net/wireless/ath/wcn36xx/smd.h
> > @@ -46,8 +46,8 @@ struct wcn36xx_fw_msg_status_rsp {
> >  
> >  struct wcn36xx_hal_ind_msg {
> >  	struct list_head list;
> > -	size_t msg_len;
> > -	u8 msg[];
> > +	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, msg_len);
> > +	DECLARE_FLEX_ARRAY_ELEMENTS(u8, msg);
> 
> This affects readability quite a lot and tbh I don't like it. Isn't
> there any simpler way to solve this?

Similar to how I plumbed member names into __mem_to_flex(), I could do
the same for __mem_to_flex_dup(). That way if the struct member aliases
(DECLARE_FLEX...)  aren't added, the longer form of the helper could
be used. Instead of:

	if (mem_to_flex_dup(&msg_ind, buf, len, GFP_ATOMIC)) {

it would be:

	if (__mem_to_flex_dup(&msg_ind, /* self */, msg,
			      msg_len, buf, len, GFP_ATOMIC)) {

This was how I'd written the helpers in an earlier version, but it
seemed much cleaner to avoid repeating structure layout details at each
call site.

I couldn't find any other way to encode the needed information. It'd be
wonderful if C would let us do:

	struct wcn36xx_hal_ind_msg {
		struct list_head list;
		size_t msg_len;
		u8 msg[msg_len];
	}

And provide some kind of interrogation:

	__builtin_flex_array_member(msg_ind) -> msg_ind->msg
	__builtin_flex_array_count(msg_ind)  -> msg_ind->msg_len

My hope would be to actually use the member aliases to teach things like
-fsanitize=array-bounds about flexible arrays. If it encounters a
structure with the aliases, it could add the instrumentation to do the
bounds checking of things like:

	msg_ind->msg[42]; /* check that 42 is < msg_ind->msg_len */

I also wish I could find a way to make the proposed macros "forward
portable" into proposed C syntax above, but this eluded me as well.
For example:

	struct wcn36xx_hal_ind_msg {
		size_t msg_len;
		struct list_head list;
		BOUNDED_FLEX_ARRAY(u8, msg, msg_len);
	}

	#ifdef CC_HAS_DYNAMIC_ARRAY_LEN
	# define BOUNDED_FLEX_ARRAY(type, name, bounds)	type name[bounds]
	#else
	# define BOUNDED_FLEX_ARRAY(type, name, bounds)			\
		magic_alias_of msg_len __flex_array_elements_count;	\
		union {							\
			type name[];					\
			type __flex_array_elements[];			\
		}
	#endif

But I couldn't sort out the "magic_alias_of" syntax that wouldn't force
structures into having the count member immediately before the flex
array, which would impose more limitations on where this could be
used...

Anyway, I'm open to ideas on how to improve this!

-Kees

-- 
Kees Cook

