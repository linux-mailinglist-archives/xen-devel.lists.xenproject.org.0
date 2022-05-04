Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B807519835
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 09:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320377.541078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9Se-0002QC-4o; Wed, 04 May 2022 07:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320377.541078; Wed, 04 May 2022 07:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9Se-0002ON-1Z; Wed, 04 May 2022 07:30:12 +0000
Received: by outflank-mailman (input) for mailman id 320377;
 Wed, 04 May 2022 07:29:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+0t=VM=sipsolutions.net=johannes@srs-se1.protection.inumbo.net>)
 id 1nm9Rt-0001cR-TK
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 07:29:26 +0000
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:191:4433::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb90edf8-cb7b-11ec-a406-831a346695d4;
 Wed, 04 May 2022 09:29:24 +0200 (CEST)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nm9Oe-001wnb-ND; Wed, 04 May 2022 09:26:04 +0200
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
X-Inumbo-ID: eb90edf8-cb7b-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ity6IPNC2WIGLGTiJizfPDCFcsI1FfOGUjdPuI/9x1Q=;
	t=1651649364; x=1652858964; b=uLXceoXRzocE9rr9tSqSs3uwv2YN+Y2ols3vkwJs3Y80NTC
	SHrykdTo0rjdIMKD1kdUgluxp0pOBzv4vqReeotEDsKew0IA0V4g7ZTRWNZZsRXFODX7TO0A9D7NY
	IchhOKlEq5QBQFzOkV42FF1wCVIu3tXzAVjIhBKA0O87cF6n3RnAHUaXk+axAihNbPJMW5/YL5jQl
	EJRchlELJXVJAfqiU9LX00czxRGevoxwrxbu1sLHbNWZfH6AsHgi+hmPFIthDXbadbXtBfWz+gCeu
	ylNizrxU3D+4BhDE+2fuiAHq5Srn8Frknie+J+sc3cHV2I5EjxH4Ks1/gwZL9aJw==;
Message-ID: <d3b73d80f66325fdfaf2d1f00ea97ab3db03146a.camel@sipsolutions.net>
Subject: Re: [PATCH 02/32] Introduce flexible array struct memcpy() helpers
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, "Gustavo A . R . Silva"
	 <gustavoars@kernel.org>
Cc: Keith Packard <keithp@keithp.com>, Francis Laniel
 <laniel_francis@privacyrequired.com>, Daniel Axtens <dja@axtens.net>, Dan
 Williams <dan.j.williams@intel.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Guenter Roeck <linux@roeck-us.net>, Daniel
 Vetter <daniel.vetter@ffwll.ch>, Tadeusz Struk <tadeusz.struk@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>,  alsa-devel@alsa-project.org, Al Viro
 <viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Andrew Morton <akpm@linux-foundation.org>,  Andy Gross <agross@kernel.org>,
 Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>, 
 Baowen Zheng <baowen.zheng@corigine.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Bradley Grove <linuxdrivers@attotech.com>, 
 brcm80211-dev-list.pdl@broadcom.com, Christian Brauner
 <brauner@kernel.org>,  Christian =?ISO-8859-1?Q?G=F6ttsche?=
 <cgzones@googlemail.com>, Christian Lamparter <chunkeey@googlemail.com>, 
 Chris Zankel <chris@zankel.net>, Cong Wang <cong.wang@bytedance.com>, David
 Gow <davidgow@google.com>,  David Howells <dhowells@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>, devicetree@vger.kernel.org, 
 Dexuan Cui <decui@microsoft.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, Eli Cohen <elic@nvidia.com>,  Eric Dumazet
 <edumazet@google.com>, Eric Paris <eparis@parisplace.org>, Eugeniu Rosca
 <erosca@de.adit-jv.com>,  Felipe Balbi <balbi@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Franky Lin <franky.lin@broadcom.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman
 <gregory.greenman@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Hante
 Meuleman <hante.meuleman@broadcom.com>,  Herbert Xu
 <herbert@gondor.apana.org.au>, Hulk Robot <hulkci@huawei.com>, Jakub
 Kicinski <kuba@kernel.org>,  "James E.J. Bottomley" <jejb@linux.ibm.com>,
 James Morris <jmorris@namei.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens
 Axboe <axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, John
 Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo
 <kvalo@kernel.org>, keyrings@vger.kernel.org,  kunit-dev@googlegroups.com,
 Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones
 <lee.jones@linaro.org>,  Leon Romanovsky <leon@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>,  linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  linux-bluetooth@vger.kernel.org,
 linux-hardening@vger.kernel.org,  linux-hyperv@vger.kernel.org,
 linux-integrity@vger.kernel.org,  linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-security-module@vger.kernel.org,
 linux-usb@vger.kernel.org,  linux-wireless@vger.kernel.org,
 linux-xtensa@linux-xtensa.org,  llvm@lists.linux.dev, Loic Poulain
 <loic.poulain@linaro.org>, Louis Peens <louis.peens@corigine.com>, Luca
 Coelho <luciano.coelho@intel.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Marc Dionne <marc.dionne@auristor.com>, Marcel
 Holtmann <marcel@holtmann.org>,  Mark Brown <broonie@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>, Muchun Song
 <songmuchun@bytedance.com>, Nathan Chancellor <nathan@kernel.org>, 
 netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Paolo Abeni
 <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>, Rich Felker
 <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>,  selinux@vger.kernel.org, "Serge E. Hallyn"
 <serge@hallyn.com>,  SHA-cyfmac-dev-list@infineon.com, Simon Horman
 <simon.horman@corigine.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, Steffen Klassert
 <steffen.klassert@secunet.com>, Stephen Hemminger <sthemmin@microsoft.com>,
  Stephen Smalley <stephen.smalley.work@gmail.com>, Takashi Iwai
 <tiwai@suse.com>, Tom Rix <trix@redhat.com>,  Udipto Goswami
 <quic_ugoswami@quicinc.com>, wcn36xx@lists.infradead.org, Wei Liu
 <wei.liu@kernel.org>,  xen-devel@lists.xenproject.org, Xiu Jianfeng
 <xiujianfeng@huawei.com>, Yang Yingliang <yangyingliang@huawei.com>,
 kvalo@kernel.org
Date: Wed, 04 May 2022 09:25:56 +0200
In-Reply-To: <20220504014440.3697851-3-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
	 <20220504014440.3697851-3-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Tue, 2022-05-03 at 18:44 -0700, Kees Cook wrote:
> 
> For example, using the most complicated helper, mem_to_flex_dup():
> 
>     /* Flexible array struct with members identified. */
>     struct something {
>         int mode;
>         DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(int, how_many);
>         unsigned long flags;
>         DECLARE_FLEX_ARRAY_ELEMENTS(u32, value);

In many cases, the order of the elements doesn't really matter, so maybe
it'd be nicer to be able to write it as something like

DECLARE_FLEX_STRUCT(something,
	int mode;
	unsigned long flags;
	,
	int, how_many,
	u32, value);

perhaps? OK, that doesn't seem so nice either.

Maybe

struct something {
	int mode;
	unsigned long flags;
	FLEX_ARRAY(
		int, how_many,
		u32, value
	);
};

or so? The long and duplicated DECLARE_FLEX_ARRAY_ELEMENTS_COUNT and
DECLARE_FLEX_ARRAY_ELEMENTS seems a bit tedious to me, at least in cases
where the struct layout is not the most important thing (or it's already
at the end anyway).


>     struct something *instance = NULL;
>     int rc;
> 
>     rc = mem_to_flex_dup(&instance, byte_array, count, GFP_KERNEL);
>     if (rc)
>         return rc;

This seems rather awkward, having to set it to NULL, then checking rc
(and possibly needing a separate variable for it), etc.

But I can understand how you arrived at this:
 - need to pass instance or &instance or such for typeof()
   or offsetof() or such
 - instance = mem_to_flex_dup(instance, ...)
   looks too much like it would actually dup 'instance', rather than
   'byte_array'
 - if you pass &instance anyway, checking for NULL is simple and adds a
   bit of safety

but still, honestly, I don't like it. As APIs go, it feels a bit
cumbersome and awkward to use, and you really need everyone to use this,
and not say "uh what, I'll memcpy() instead".

Maybe there should also be a realloc() version of it?


> +/** __fas_bytes - Calculate potential size of flexible array structure

I think you forgot "\n *" in many cases here after "/**".

johannes

