Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBA51D089
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 07:18:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322329.543842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLe-0001BF-Df; Fri, 06 May 2022 05:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322329.543842; Fri, 06 May 2022 05:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqLe-000186-A3; Fri, 06 May 2022 05:17:50 +0000
Received: by outflank-mailman (input) for mailman id 322329;
 Thu, 05 May 2022 18:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4XN/=VN=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nmgNm-0005rK-Dt
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 18:39:22 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ace1cade-cca2-11ec-a406-831a346695d4;
 Thu, 05 May 2022 20:39:20 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id o69so4959550pjo.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 May 2022 11:39:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a23-20020aa78657000000b0050dc762818bsm1678035pfo.101.2022.05.05.11.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:39:18 -0700 (PDT)
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
X-Inumbo-ID: ace1cade-cca2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bIDYG8oUb6Mu7NvJ6XCyJeRsH11vzTSCPCwxqfuBo6Q=;
        b=TAsZfcIzZ1Euc/qIeEg34BQq2COz7cgqBz00GoicuXUNf9pdGcbnWHwxzUdfUr95G6
         aZkeIr2DXfy8REqoWNWUrHkDO72sG3i0jXoJwl1ByCdJe4nI3ufTivSeF9XGTyVfZSBt
         E8X9FJkYlIIwFcdiPVlMoWZYSaWqjlfPLGIK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bIDYG8oUb6Mu7NvJ6XCyJeRsH11vzTSCPCwxqfuBo6Q=;
        b=aZKrZZJcOgK5XxIJxJIbk6+YB4pz9jlVrFE50WJC+Hl6gM0mWYls5etgTKj6uogsCU
         RMwKLk5ZpdHqgy2fuVRx/bZU4pG6hnBZ3d2nP9m109Y9Cx5ZmpLb7StfEJCfkXDM+nx8
         dsIzjnhB9wiid7+XjV14p06jZcFLDLhl1dF+N8s1Ha1Phb4FoXiMkF4DWQFJH296tU78
         JH77jMT9Co49mGLa8RITm2xW+7Mr4TS/G3H6ojrEkneIRaEflK4AK+mzY0cLwpCzLy+8
         hzf6Cobh352jY6UFYgmgx82m0eJd2+tLDvVZr+Br/XMuHvWmGzQsK/sHEMChAj1d2QnC
         M8lw==
X-Gm-Message-State: AOAM530dBnIi/Jlm2zjLNSd9wPkXHPdZCekKuWYlwG1Z2te823n2V82n
	i+9J0orBeM06kjgdw25ZBcL2iA==
X-Google-Smtp-Source: ABdhPJywOBGnVCItaZdbWHBhKk99ReUqQqdPAt9X91jhcKRKzWEoF57vDV5JAH3IfEnT7+kmtExgOg==
X-Received: by 2002:a17:902:ea53:b0:15b:1bb8:ac9e with SMTP id r19-20020a170902ea5300b0015b1bb8ac9emr27991008plg.45.1651775959313;
        Thu, 05 May 2022 11:39:19 -0700 (PDT)
Date: Thu, 5 May 2022 11:39:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Paul Moore <paul@paul-moore.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
Message-ID: <202205051124.6D80ABAE32@keescook>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-29-keescook@chromium.org>
 <CAHC9VhT5Y=ENiSyb=S-NVbGX63sLOv4nVuR_GS-yww6tiz0wYA@mail.gmail.com>
 <20220504234324.GA12556@embeddedor>
 <CAHC9VhRJC4AxeDsGpdphfJD4WzgaeBsdONHnixBzft5u_cE-Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhRJC4AxeDsGpdphfJD4WzgaeBsdONHnixBzft5u_cE-Dw@mail.gmail.com>

On Wed, May 04, 2022 at 11:14:42PM -0400, Paul Moore wrote:
> On Wed, May 4, 2022 at 7:34 PM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > Hi Paul,
> >
> > On Wed, May 04, 2022 at 06:57:28PM -0400, Paul Moore wrote:
> > > On Tue, May 3, 2022 at 9:57 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > [..]
> >
> > > > +++ b/include/uapi/linux/xfrm.h
> > > > @@ -31,9 +31,9 @@ struct xfrm_id {
> > > >  struct xfrm_sec_ctx {
> > > >         __u8    ctx_doi;
> > > >         __u8    ctx_alg;
> > > > -       __u16   ctx_len;
> > > > +       __DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, ctx_len);
> > > >         __u32   ctx_sid;
> > > > -       char    ctx_str[0];
> > > > +       __DECLARE_FLEX_ARRAY_ELEMENTS(char, ctx_str);
> > > >  };
> > >
> > > While I like the idea of this in principle, I'd like to hear about the
> > > testing you've done on these patches.  A previous flex array
> > > conversion in the audit uapi headers ended up causing a problem with
> >
> > I'm curious about which commit caused those problems...?
> 
> Commit ed98ea2128b6 ("audit: replace zero-length array with
> flexible-array member"), however, as I said earlier, the problem was
> actually with SWIG, it just happened to be triggered by the kernel
> commit.  There was a brief fedora-devel mail thread about the problem,
> see the link below:
> 
> * https://www.spinics.net/lists/fedora-devel/msg297991.html

Wow, that's pretty weird -- it looks like SWIG was scraping the headers
to build its conversions? I assume SWIG has been fixed now?

> To reiterate, I'm supportive of changes like this, but I would like to
> hear how it was tested to ensure there are no unexpected problems with
> userspace.  If there are userspace problems it doesn't mean we can't
> make changes like this, it just means we need to ensure that the
> userspace issues are resolved first.

Well, as this is the first and only report of any problems with [0] -> []
conversions (in UAPI or anywhere) that I remember seeing, and they've
been underway since at least v5.9, I hadn't been doing any new testing.

So, for this case, I guess I should ask what tests you think would be
meaningful here? Anything using #include should be fine:
https://codesearch.debian.net/search?q=linux%2Fxfrm.h&literal=1&perpkg=1
Which leaves just this, which may be doing something weird:

libabigail_2.0-1/tests/data/test-diff-filter/test-PR27569-v0.abi
        </data-member>
        <data-member access="public" layout-offset-in-bits="128">
          <var-decl name="seq_hi" type-id="3f1a6b60" visibility="default" filepath="include/uapi/linux/xfrm.h" line="97" column="1"/>
        </data-member>
        <data-member access="public" layout-offset-in-bits="160">

But I see that SWIG doesn't show up in a search for linux/audit.h:
https://codesearch.debian.net/search?q=linux%2Faudit.h&literal=1&perpkg=1

So this may not be a sufficient analysis...

-- 
Kees Cook

