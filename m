Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8B51D08B
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 07:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322350.543856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLf-0001Ne-3d; Fri, 06 May 2022 05:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322350.543856; Fri, 06 May 2022 05:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLe-0001IE-UB; Fri, 06 May 2022 05:17:50 +0000
Received: by outflank-mailman (input) for mailman id 322350;
 Thu, 05 May 2022 19:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4XN/=VN=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nmh8U-00039Z-3f
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 19:27:38 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a2712ba-cca9-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 21:27:35 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id q4so2427215plr.11
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 12:27:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902c38400b0015e8d4eb20bsm3383plg.85.2022.05.05.12.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:27:33 -0700 (PDT)
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
X-Inumbo-ID: 6a2712ba-cca9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/twjVtbcWPue2Jf3IhiwlWWY7Rof9WWSi6Cv9vIoV/Q=;
        b=Zw4fRetuqYTkqeq+yVUkdhxXm/8i81f3Tz5yiq/8IIDSZ024zV3L+pNdERes4bJaav
         31/Q4CkRhBZLAixBgNaxyPQDOPUfRkG6V2Lznu+vqnnAE8TdezgewvauqqI6bgLcXe8G
         8pjfVWQFjtIzIDipg+thK9X2Q1whG0Xu+Ovt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/twjVtbcWPue2Jf3IhiwlWWY7Rof9WWSi6Cv9vIoV/Q=;
        b=cwl8/4avMzq4C7aRe9r/YYLpXZhKg5+cXwas20fwcysx2qn3KLAfD9w8wR2cnX5GFX
         q/VRe4XPtZfPfxVzVGoaFDfqcWJliuWnl0FlYntlid0Tk7ZZGCZ40Q6Ct+OhWjsH0d+Z
         TXic/feyFcfMcNP4+CRKKFJGdk+NcswBPz0W08NGhWTQXa2PQTDr4L9RlmWuAZx3KQvn
         LQ4vaBfQwJMsLYFcomQaEbIz8SHY+usyeUIgptint5NbEPmr5l4KCgJ98lXwMJIGtQkA
         MX77QMsYhgJ2oMYcmY1y8kmh/N5awdC4upTtFii6+AbMyNpuAuw3npVX/A8AzYD132SK
         5+zw==
X-Gm-Message-State: AOAM533fCDP3t1zESFl0LmqzkKjz2Jdszovzrc3QkuW2mulln3IWacsp
	WUPgIyyB//AZucM1ctLQcpdB7w==
X-Google-Smtp-Source: ABdhPJyMt9gPdDTw+FpTk8LuZ7KJ4bSEOkJZBvChi1uFf0GDszQUqKrXsHdzONZd+UaK2I++GKA26A==
X-Received: by 2002:a17:90b:1d11:b0:1dc:5dd1:b50e with SMTP id on17-20020a17090b1d1100b001dc5dd1b50emr7869285pjb.218.1651778853785;
        Thu, 05 May 2022 12:27:33 -0700 (PDT)
Date: Thu, 5 May 2022 12:27:32 -0700
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
Message-ID: <202205051143.6B19E63983@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-3-keescook@chromium.org>
 <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
 <202205040819.DEA70BD@keescook>
 <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <970a674df04271b5fd1971b495c6b11a996c20c2.camel@sipsolutions.net>

On Thu, May 05, 2022 at 03:16:19PM +0200, Johannes Berg wrote:
> On Wed, 2022-05-04 at 08:38 -0700, Kees Cook wrote:
> > 
> > It seemed like requiring a structure be rearranged to take advantage of
> > the "automatic layout introspection" wasn't very friendly. On the other
> > hand, looking at the examples, most of them are already neighboring
> > members. Hmmm.
> 
> A lot of them are, and many could be, though not all.

Yeah, I did a pass through them for the coming v2. Only a few have the
struct order as part of an apparent hardware interface.

> > And DECLARE_FLEX_ARRAY_ELEMENTS could actually be expanded to include
> > the count_name too, so both methods could be "forward portable" to a
> > future where C grew the syntax for bounded flex arrays.
> 
> I guess I don't see that happening :)

Well ... it's on my roadmap. ;) I want it for -fsanitize=array-bounds so
that dynamic array indexing can be checked too. (Right now we can do
constant-sized array index bounds checking at runtime, but the much
harder to find problems tend to come from flex arrays.)

> > Requiring instance to be NULL is debatable, but I feel pretty strongly
> > about it because it does handle a class of mistakes (resource leaks),
> > and it's not much of a burden to require a known-good starting state.
> 
> Yeah, dunno, I guess I'm slightly more on the side of not requiring it,
> since we don't do the same for kmalloc() etc. and probably really
> wouldn't want to add kmalloc_s() that does it ;-)

Well, I dislike all the *alloc APIs. :P

> I mean, you _could_ go there:
> 
> int kmalloc_s(void **ptr, size_t size, gfp_t gfp)

Oh, and I really do (though as a macro, not a "real" function), since
having type introspection would be _extremely_ useful. Though maybe it
needs to be through some kind of type-of-lvalue thing...

https://github.com/KSPP/linux/issues/189
https://github.com/KSPP/linux/issues/87

> So I'm not really sure why this aspect here should need to be different,
> except of course that you already need the input argument for the magic.

Right, and trying to move the kernel code closer to a form where the
compiler can take more of the burden of handling code safety.

> And btw, while I was writing it down I was looking to see if it should
> be "size_t elements" or "size_t len" (like memcpy), it took me some time
> to figure out, and I was looking at the examples:
> 
>  1) most of them actually use __u8 or some variant thereof, so you
>     could probably add an even simpler macro like
>        BOUNDED_FLEX_DATA(int, bytes, data)
>     which has the u8 type internally.

I didn't want these helpers to be "opinionated" about their types (just
their API), so while it's true u8 is usually "good enough", I don't
think it's common enough to make a special case for.

>  2) Unless I'm confusing myself, you got the firewire change wrong,
>     because __mem_to_flex_dup takes the "elements_count", but the
>     memcpy() there wasn't multiplied by the sizeof(element)? Or maybe
>     the fact that it was declared as __u32 header[0] is wrong, and it
>     should be __u8, but it's all very confusing, and I'm really not
>     sure about this at all.

Yes indeed; thanks for catching that. In fact, it's not a strict flex
array struct, since, as you say, it's measuring bytes, not elements.
Yeah, I'll see if that needs to be adjusted/dropped, etc.

> One "perhaps you'll laugh me out of the room" suggestion might be to
> actually be able to initialize the whole thing too?
> 
> mydata = flex_struct_alloc(mydata, GFP_KERNEL,
>                            variable_data, variable_len,
>                            .member = 1,
>                            .another = 2);
> 
> (the ordering can't really be otherwise since you have to use
> __VA_ARGS__).

Oooh, that's a cool idea for the API. Hmmmm.

> That might reduce some more code too, though I guess it's quite some
> additional magic ... :)

Yay preprocessor magic!

> I was going to point to struct cfg80211_bss_ies, but I realize now
> they're RCU-managed, so we never resize them anyway ... So maybe it's
> less common than I thought it might be.
> 
> I suppose you know better since you converted a lot of stuff already :-)

Well, I've seen a lot of fragile code (usually in the form of
exploitable flaws around flex arrays) and they do mostly look the same.
Not everything fits perfectly into the forms this API tries to address,
but my goal is to get it fitting well enough, and the weird stuff can be
more carefully examined -- they're easier to find and audit if all the
others are nicely wrapped up in some fancy flex*() API.

Thanks for your thoughts on all of this! I'll continue to work on a v2...

-Kees

-- 
Kees Cook

