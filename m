Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB6BF6C7F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 15:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147178.1479452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCRj-0003nE-9D; Tue, 21 Oct 2025 13:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147178.1479452; Tue, 21 Oct 2025 13:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBCRj-0003lF-67; Tue, 21 Oct 2025 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1147178;
 Tue, 21 Oct 2025 13:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GCgz=46=redhat.com=mlureau@srs-se1.protection.inumbo.net>)
 id 1vBCRh-0003l8-FE
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 13:30:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20041c07-ae82-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 15:30:36 +0200 (CEST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-y5eDbybCOZ-iAdc-ht_x2w-1; Tue, 21 Oct 2025 09:30:32 -0400
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33bdd0479a9so4445924a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 06:30:31 -0700 (PDT)
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
X-Inumbo-ID: 20041c07-ae82-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761053435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8G6fSfFVaONhcxA1DHI9VcxajpmfGw7mPN/aSeM7JQ=;
	b=TYLMtjQiwwzASnf/uHR/Nu07AIpDho0lr/i7SQhIqrIWdzujJPpplh3/mpczznacvYXScq
	M7WjQA+wygu/MmS8tF/uUGpkAMeUdNsMXKfmDj25X1N1r3TaPI9wp2892+LNXSC8oES8z0
	+TSfK8ZeuODX1Epw3esi1xbKFKZkvh0=
X-MC-Unique: y5eDbybCOZ-iAdc-ht_x2w-1
X-Mimecast-MFC-AGG-ID: y5eDbybCOZ-iAdc-ht_x2w_1761053430
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053430; x=1761658230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8G6fSfFVaONhcxA1DHI9VcxajpmfGw7mPN/aSeM7JQ=;
        b=umgjZgSLodCiiVK+urGmJOucQmY9k1Jn8tcLqQT59S4/eU8Kqx8Cb2E85Xejp6VMf0
         AoDziP45TqjC+onDWmX+O2HWqXk4KwxrSPX6B17fVDwR7r9IJjSAIRFAi5OSDiLaTgcn
         j6A7tJAS/qP9ZABXHF06l3NvB44XVItn5T7cvZoHODrFQE9gI++4d2tPmXQzjLPzPFsP
         KuGNvkbDpC5RFQmHlBhqL/z53ot1OH8XlnC//jzWFaUjK254JbuA0pBmw6dq/lRTajni
         HjHFSYVfQvmUzKh2AR6mIC1ljZHq5jlO7qzmBBM5Gmfeg9pPgcCXhK6VXra+F2fouERH
         E9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXnsFdIuxxpXo1UZUqtj2UBDRHj84Ss7KWZvDwhrDcy6kgKQryQ/6Yi3MQSxye6XYqEJOCeDhvWPpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSbPcfV4bOICO55dFc23PoedcAL2EKIUr02lBklpLHBLkOwIG1
	Qr/hY16T+jfS4ciZm3Y0BcVWE68apr5G9+STOV5MQcuu2A+Icjqt4oGJoJNZsviou66IDg9EO1x
	eGv21sMrWV04Qah/cy64w9AROGpwCiYou/P1qC4vR7dKMoIJb1rhEN+xc+B9o0hhz7+M7zcb3ZK
	c2Dkd/oRUvjldBlGdVCI82164a7zUJv+ub2czPH8kgMs8=
X-Gm-Gg: ASbGncvEuq4zLls706QWWhYCdZub6VcgjpTQJNd6EaqupKXPeqnKeYlWdFkSuVIt2h/
	7EifnT2r8JlIPTPjmiPU3wdkjJ8mVN7Z4bkhYpWxdb5kt1w1h9+y8u6Z0pss2udZAwGK2tCbUd3
	Kd3zV8Xse6UGgHJm2e8Xn5GXmT5ttVm//6hPLIjdfCt2ShbODhf8/1SifNO1nEbksV+KBIidw5f
	C7cA0hIN//RCTs=
X-Received: by 2002:a17:90b:3ec6:b0:339:ef05:3575 with SMTP id 98e67ed59e1d1-33bcf8f94c3mr25685614a91.26.1761053430081;
        Tue, 21 Oct 2025 06:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrcrzdwZmuF2cCRqH2vToyJMLy2bHoJ+Kx9jzECaxXzAzohnouc6v8JutWnCy0AcLWb81s8PtUoo7SVr1fd6U=
X-Received: by 2002:a17:90b:3ec6:b0:339:ef05:3575 with SMTP id
 98e67ed59e1d1-33bcf8f94c3mr25685486a91.26.1761053429385; Tue, 21 Oct 2025
 06:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com> <01a51fe7-4414-e787-ddf5-5ede0c1e1e74@eik.bme.hu>
In-Reply-To: <01a51fe7-4414-e787-ddf5-5ede0c1e1e74@eik.bme.hu>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Oct 2025 17:30:18 +0400
X-Gm-Features: AS18NWC-i6fdjk32NEoXZbM96aNPF-p1sZDoFKybRPcKVdB4OOANWfiaSgrGQ2I
Message-ID: <CAMxuvaz8GueSp-vPHFWnbv+Odcy63Cz_hZHd3NzReWXp3pnsqg@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, Zhenwei Pi <pizhenwei@bytedance.com>, 
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
	Frederic Konrad <konrad.frederic@yahoo.fr>, Alberto Garcia <berto@igalia.com>, 
	Thomas Huth <huth@tuxfamily.org>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Yoshinori Sato <yoshinori.sato@nifty.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	"Collin L. Walling" <walling@linux.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>, 
	Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Michael Rolnik <mrolnik@gmail.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "reviewer:vhost-user-scmi" <mzamazal@redhat.com>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Fabiano Rosas <farosas@suse.de>, 
	Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen <zhangckid@gmail.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
	"open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
	"open list:Rust-related patc..." <qemu-rust@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _VCx4hn6n4NYWc2pfHUAcDtUb3sc_cMAgNGnPEiHdrk_1761053430
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000016e15b0641ab341a"

--00000000000016e15b0641ab341a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Oct 21, 2025 at 5:25=E2=80=AFPM BALATON Zoltan <balaton@eik.bme.hu>=
 wrote:

> On Tue, 21 Oct 2025, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > /**
> > - * struct CharBackend - back end as seen by front end
> > + * struct CharFrontend - back end as seen by front end
>
> I stopped here, haven't read the rest of the patch but the above comment
> seems to become inconsistent. Which is the front end and back end now?
>
>
It's the "frontend side" of a chardev "backend". Naming it CharBackend has
always been the source of confusion, since the actual backend is Chardev.
There was earlier attempt to rename it and various complains. I believe
this is is long overdue.

--00000000000016e15b0641ab341a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 21, 2=
025 at 5:25=E2=80=AFPM BALATON Zoltan &lt;<a href=3D"mailto:balaton@eik.bme=
.hu">balaton@eik.bme.hu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, 21 Oct 2025, <a href=3D"mailto:marcandre.lur=
eau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br=
>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>&gt;<br>
&gt; /**<br>
&gt; - * struct CharBackend - back end as seen by front end<br>
&gt; + * struct CharFrontend - back end as seen by front end<br>
<br>
I stopped here, haven&#39;t read the rest of the patch but the above commen=
t <br>
seems to become inconsistent. Which is the front end and back end now?<br><=
br></blockquote><div><br></div><div>It&#39;s the &quot;frontend side&quot; =
of a chardev &quot;backend&quot;. Naming it CharBackend has always been the=
 source of confusion, since the actual backend is Chardev. There was earlie=
r attempt to rename it and various complains. I believe this is is long ove=
rdue.</div></div></div>

--00000000000016e15b0641ab341a--


