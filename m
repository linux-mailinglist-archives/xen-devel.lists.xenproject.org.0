Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D8BF7120
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147351.1479672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDLS-0000ft-5Z; Tue, 21 Oct 2025 14:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147351.1479672; Tue, 21 Oct 2025 14:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDLS-0000d4-2M; Tue, 21 Oct 2025 14:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1147351;
 Tue, 21 Oct 2025 14:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ych8=46=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vBDLQ-0000cy-Kj
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:28:12 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3a9eb7-ae8a-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 16:28:10 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-890deb84f95so635552685a.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 07:28:10 -0700 (PDT)
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
X-Inumbo-ID: 2b3a9eb7-ae8a-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761056890; x=1761661690; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOkDZIYP624hXJ84QvSPoENvTgmCF83wfkY593GGoOU=;
        b=HFUf07gI8lsToZui/9DZ1QvAKPOkaoMV4fY6XW8PE0hF+XN5CS5LzayQeUPHjQBvT7
         y69svkphRvK1fXN+ciri1Anit7ju2Ird5UR+HMW4opj7q5/pd/XOB4K2FSkuQv7VQ9pS
         QU50Hxe95x/NVrl5GaHeMkF1i3zGSwf6PJh++da6DClYxslXc443oZQjKXrLlEqX78Gf
         fOEf4m7rfE6Fl2cPeDgaJZKA3Io1C4421zQnS6CaA+g8jaKky1qTd++ckBPJEg1VQXui
         jkRaEuikEWbuwFjSdvDczqgkmPjxfXlGz1KSg2lKjZPXOJoyr0Zpy6DtxWzmB/sAlN8e
         eZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056890; x=1761661690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOkDZIYP624hXJ84QvSPoENvTgmCF83wfkY593GGoOU=;
        b=sUvvqG/3Tt9/REyBAIyrsZBRSWaC2b3xelThn7xgz3pSK80W/7hGKMpFaFFnljbBVi
         hV5uncMaieSThgoDj8EVcNb3qwr6xRUyf7JimHMI8I6cCjLeMymwCVoB1E+7I/TXlCBg
         ihHyxzKwIYV+R4NiGIP2MsEnoc65Vchcb2W0o2PafT8GBeZxTjcciitJIflQQy3WvDUc
         PWACYjT4S5GuhK7hiNcNZ0/SxsUh2HH3LRGibu2QBVgBuIhid/I+B80XADfQ8CZ1q+UD
         CfgWMYDS0XQB/+TTkL53JLy+eapjP81+F8Ix+ekZMRAWjRraCB1DtXl/c1TIDwIzk1Jg
         Eurw==
X-Forwarded-Encrypted: i=1; AJvYcCUVmjt6r3/CudaWDr92BUTz5/yu3kjNHT3JxwaTSUUK8bqOJ9yumippJK2MPqL4gNzKi/Ue0s0GU64=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnCbTpKKOQEGrzlW39OgDlyRzTghwFpiZ3QpD4Dxw9FThsLo/h
	+ETUtfBfeb3a54O+peu4Ec3O1Mp3DiO+QUdopO8mzg5+uDh3PUdxENlRlJaMVkSiC4X05nfb3VN
	00Bw9WdllFPR6azKrh2UoqSukpoo1IKg=
X-Gm-Gg: ASbGncv0Oyno8zvEqvichNvKHkja7HyZnNYyZQx0r9bIPKLnAQ0v9QED78XR5FcENnf
	9SWlwl9Y7jNeFoS4rPZVnpfsCbNAHeMYuONXrK/zxhxmUm1+/vRneHnwmSn8PNPPiap/556zfF6
	cOPcp+U6cuum8SHpNwFt2yftUK2gPRr3gzXiJSqPzHxhKf1461RkhJUL8qkwSlgOA+K9sEwg2Ui
	k2rfiSoLzdSh+VyAocfD7a0xdd/R3fl2BRsq3+KcR64FHH5Mo8Q2z+5D1YTdpfP6Av22iko6Mez
	OZ4pYB/cnxYoknDq
X-Google-Smtp-Source: AGHT+IGp+zf0u9SIF08iLE3a5Asq68ZbyrbibcTK8YXdD3xNkn5pXcBzDMuiMfZHuV9n++d97YerVbPf0S+nqo2EBIc=
X-Received: by 2002:a05:622a:310:b0:4d9:dea6:4ff0 with SMTP id
 d75a77b69052e-4e89d3d5924mr245955091cf.56.1761056889597; Tue, 21 Oct 2025
 07:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
 <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
 <aPePcTKl6s4FoLCL@gallifrey> <CAJ+F1C+bGKtY6nf3LCXrwhZ2aEdu2npXJ9FapmsqgX0uLL5TUw@mail.gmail.com>
 <f764e4cf-d134-4c4d-a313-a5b7dd6620d0@linaro.org>
In-Reply-To: <f764e4cf-d134-4c4d-a313-a5b7dd6620d0@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Oct 2025 18:27:58 +0400
X-Gm-Features: AS18NWCtKDmDRRz11NBqNv3KECG8ofxt09PdE7ub3r-ykIF5WUP85WNT3b3fqdE
Message-ID: <CAJ+F1CKG1G=5o+bDBXmLm6ywWDD19z1OFBwQQnDMxMFytFQ2SQ@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	pbonzini@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	Zhenwei Pi <pizhenwei@bytedance.com>, Laurent Vivier <lvivier@redhat.com>, 
	Amit Shah <amit@kernel.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
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
	Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
	"open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
	"open list:Rust-related patc..." <qemu-rust@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Oct 21, 2025 at 6:23=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 21/10/25 15:58, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Oct 21, 2025 at 5:52=E2=80=AFPM Dr. David Alan Gilbert <dave@tr=
eblig.org> wrote:
> >>
> >> * Peter Maydell (peter.maydell@linaro.org) wrote:
> >>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> >>>> The actual backend is "Chardev", CharBackend is the frontend side of=
 it,
> >>>> let's rename it for readability.
> >>>
> >>> I always thought the "frontend" was the device the guest
> >>> saw (the 16650 UART or whatever). invocation.html has bits
> >>> talking about "virtio hvc console frontend device" which
> >>> seem like they also use that terminology.
> >>>
> >>> If we want to clean up the naming it might be helpful to have
> >>> a comment somewhere documenting the different components and
> >>> what names we give them and how they fit together (or even
> >>> better, something in docs/devel/...)
> >>
> >> Or something more descriptive like 'CharGuestSide'
> >
> > If we are talking about the Chardev frontend or user, that's too
> > restrictive. We have generic stream handling code (think
> > mux/hub/tests/client/server etc) that do not fit that usage naming.
>
> Isn't it
>
> - backend -> host adapter
> - frontend -> implementation used by guest
>

Sort of, but I think it's too restrictive to name them after "host"
and "guest", as they also have different purposes than strictly VM
components/side usage.

I believe talking about backend and frontend is usually the preferred
convention.


--=20
Marc-Andr=C3=A9 Lureau

