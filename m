Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8582851B758
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321357.542379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfk-0008NJ-5M; Thu, 05 May 2022 05:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321357.542379; Thu, 05 May 2022 05:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfj-0008CH-UK; Thu, 05 May 2022 05:05:03 +0000
Received: by outflank-mailman (input) for mailman id 321357;
 Thu, 05 May 2022 03:14:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B872=VN=paul-moore.com=paul@srs-se1.protection.inumbo.net>)
 id 1nmRxA-0004q1-H8
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 03:14:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887bc140-cc21-11ec-a406-831a346695d4;
 Thu, 05 May 2022 05:14:54 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id x18so4363792wrc.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 20:14:53 -0700 (PDT)
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
X-Inumbo-ID: 887bc140-cc21-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ucVUJA/3XuUnAZZDdzrSa00V5OM/xNG80G7w+rY/AM=;
        b=TuxTKLvOuI4WPEKhesTppN+S/ZTkV+RZI5Wf5W2p+hsrw7/gyfISF8EIiT+rnx8Zu6
         zyyiN1wYwPcxjcCA2Sf5xnxirRkddqYIXy2R06dd7qAEUind0ZWDkOOMEqGzEQWPzWzC
         ZTGq5qihhGmXwhHHxuYfhzg3wQjnC+ThZO+LDVhD9+QIb89VKx3wO1YbUFwWrxXrBCMa
         SL8UA4+69pMFcpj8M2pJPoNe1J5xXeNZwxQABf1kR5+ALPhLTrYwt5fLtjpY8BeYkBF4
         nHH6g/sC5IM5M9d/Ecm/JssJwuDneWf8+Vn5nXmTehGUz+AEuc9+Pt2ztZNda+z83bgG
         KQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ucVUJA/3XuUnAZZDdzrSa00V5OM/xNG80G7w+rY/AM=;
        b=Zw3nFjN8S7/Kv/W0FIrlMJUz9TqcHJC4InBc0P7+zZYiAd4uy2cc6u5kOuLPej0Nym
         WVstf2peChtvRwt1nMgDFivM7zx+WK7o/6098pOm825HKwGj8j/PpE+N5PqNEFxVoY8Q
         geh/5QqrGW0vCH5EhUMM+y6Z0jKKIfc/a8xJ6WaGiwTGOcj42drncBQqczVmCLACDeYj
         8qRkhLzr4plWhOfn2N7UKTC9FSMdmClTOjc/ppXc/QS78Co07dSnkrDT1/wZrx2SXQV0
         REFdDB0OlR2+9eGDXUhvstLcEvsrKlrGwpRJXtP/TRDDWHMKL6bL4HoL4Gyn1FuM6W9o
         SCNA==
X-Gm-Message-State: AOAM530QA0vjVgLsX3OECeA4CWm5gVaLMprQ199KH9UQdcn5miJa7sTO
	71FS+iNju4L1uvUV0Lw9so37OpNd8llh+nI4hO4y
X-Google-Smtp-Source: ABdhPJzVMX+BMHIo/6Rx3rt/EGt5DUCiA1Xs3vZE5oz5hLJkbM0bMmp2okAEnKI/au/mDAitpvRIKuXqsxBU1V8TuLw=
X-Received: by 2002:a5d:590d:0:b0:20a:c3eb:2584 with SMTP id
 v13-20020a5d590d000000b0020ac3eb2584mr18412244wrd.18.1651720493308; Wed, 04
 May 2022 20:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-29-keescook@chromium.org> <CAHC9VhT5Y=ENiSyb=S-NVbGX63sLOv4nVuR_GS-yww6tiz0wYA@mail.gmail.com>
 <20220504234324.GA12556@embeddedor>
In-Reply-To: <20220504234324.GA12556@embeddedor>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 May 2022 23:14:42 -0400
Message-ID: <CAHC9VhRJC4AxeDsGpdphfJD4WzgaeBsdONHnixBzft5u_cE-Dw@mail.gmail.com>
Subject: Re: [PATCH 28/32] selinux: Use mem_to_flex_dup() with xfrm and sidtab
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Xiu Jianfeng <xiujianfeng@huawei.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, 
	Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>, 
	Baowen Zheng <baowen.zheng@corigine.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Bradley Grove <linuxdrivers@attotech.com>, 
	brcm80211-dev-list.pdl@broadcom.com, Christian Brauner <brauner@kernel.org>, 
	Christian Lamparter <chunkeey@googlemail.com>, Chris Zankel <chris@zankel.net>, 
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>, 
	David Gow <davidgow@google.com>, David Howells <dhowells@redhat.com>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, devicetree@vger.kernel.org, 
	Dexuan Cui <decui@microsoft.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Eugeniu Rosca <erosca@de.adit-jv.com>, Felipe Balbi <balbi@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, Frank Rowand <frowand.list@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Hulk Robot <hulkci@huawei.com>, Jakub Kicinski <kuba@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, James Morris <jmorris@namei.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jens Axboe <axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo <kvalo@kernel.org>, 
	Keith Packard <keithp@keithp.com>, keyrings@vger.kernel.org, kunit-dev@googlegroups.com, 
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>, 
	Leon Romanovsky <leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	llvm@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>, 
	Louis Peens <louis.peens@corigine.com>, Luca Coelho <luciano.coelho@intel.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, 
	Nathan Chancellor <nathan@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rich Felker <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, "Serge E. Hallyn" <serge@hallyn.com>, 
	SHA-cyfmac-dev-list@infineon.com, Simon Horman <simon.horman@corigine.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Tadeusz Struk <tadeusz.struk@linaro.org>, 
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>, 
	Udipto Goswami <quic_ugoswami@quicinc.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>, 
	xen-devel@lists.xenproject.org, Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 7:34 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Hi Paul,
>
> On Wed, May 04, 2022 at 06:57:28PM -0400, Paul Moore wrote:
> > On Tue, May 3, 2022 at 9:57 PM Kees Cook <keescook@chromium.org> wrote:
>
> [..]
>
> > > +++ b/include/uapi/linux/xfrm.h
> > > @@ -31,9 +31,9 @@ struct xfrm_id {
> > >  struct xfrm_sec_ctx {
> > >         __u8    ctx_doi;
> > >         __u8    ctx_alg;
> > > -       __u16   ctx_len;
> > > +       __DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, ctx_len);
> > >         __u32   ctx_sid;
> > > -       char    ctx_str[0];
> > > +       __DECLARE_FLEX_ARRAY_ELEMENTS(char, ctx_str);
> > >  };
> >
> > While I like the idea of this in principle, I'd like to hear about the
> > testing you've done on these patches.  A previous flex array
> > conversion in the audit uapi headers ended up causing a problem with
>
> I'm curious about which commit caused those problems...?

Commit ed98ea2128b6 ("audit: replace zero-length array with
flexible-array member"), however, as I said earlier, the problem was
actually with SWIG, it just happened to be triggered by the kernel
commit.  There was a brief fedora-devel mail thread about the problem,
see the link below:

* https://www.spinics.net/lists/fedora-devel/msg297991.html

To reiterate, I'm supportive of changes like this, but I would like to
hear how it was tested to ensure there are no unexpected problems with
userspace.  If there are userspace problems it doesn't mean we can't
make changes like this, it just means we need to ensure that the
userspace issues are resolved first.

-- 
paul-moore.com

