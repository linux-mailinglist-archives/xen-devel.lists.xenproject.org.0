Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568D7437B8
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 10:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557379.870679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9ni-0002Zy-G7; Fri, 30 Jun 2023 08:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557379.870679; Fri, 30 Jun 2023 08:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF9ni-0002Xx-Ck; Fri, 30 Jun 2023 08:48:22 +0000
Received: by outflank-mailman (input) for mailman id 557379;
 Fri, 30 Jun 2023 08:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FThZ=CS=redhat.com=pbonzini@srs-se1.protection.inumbo.net>)
 id 1qF9nh-0002Xp-Ed
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 08:48:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc3e18cc-1722-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 10:48:19 +0200 (CEST)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-9FaEi0l5PcG8A44kDw8pkA-1; Fri, 30 Jun 2023 04:48:14 -0400
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-4718c0dea6fso427738e0c.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jun 2023 01:48:14 -0700 (PDT)
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
X-Inumbo-ID: dc3e18cc-1722-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688114898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3TB8wM4H6TBhOOT2MNHjZR0ekToWhlAhT8+JOtuFFcM=;
	b=QBwW43K3qvwzDoEf1yZ6aSBfxDPKNoaatZOAQxAC7Lv5+RcyPuJZx7XrpHC9ktf4Cr29ve
	CP1ku1tWe50GEkIVUEB2L6Il8wyT1lezovGjvLWCTy/oxj6eIq4Xpprs1npnpS+Nf2C6U3
	4J0vvFk43t9C7HjpFgUlCIAmzBWqfAI=
X-MC-Unique: 9FaEi0l5PcG8A44kDw8pkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114894; x=1690706894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TB8wM4H6TBhOOT2MNHjZR0ekToWhlAhT8+JOtuFFcM=;
        b=Z99843DNYn2BP3GqgKXut0OCIVVkdCtfzL8q4tCcNxxTjBuGKpQ3SaTG0ytUqm3YxC
         WJ5tV4c2TxaVJLm5owHi+2DCJx2f0+fBDt5hW+0aaHAraxft2rOOIwreehEtx9vU1UUT
         5YrkhSRxLRogOZntJZd/lu8e01sKFk9xF+wZDRfQCvqIvFH9EjObJYw4sd1aS3Cv8VEa
         sgSDdJWE9N0QoPoTeerNsAGslJfbcSBKkViBxSI1h2ZifgElOIF4XhJTduNtIPe2fy+b
         AaEUlOv1af+GlMeCdoENjz6CAeAxTb8Xq/o2B+Frjr51qxJpm4b+kY53VseswZO7eGrX
         Qfbg==
X-Gm-Message-State: ABy/qLYxV7WCHnN3upfywcHhXLow1RWoi9eb0gc1MkxrytpTxObyQ2an
	Riu0dY4Q4xxY//mrc25e6vFg4Oai2J6rhKf8V07aOIGDn0B3XBR3RUD319VEur1v0pwgRlknQp5
	X9q5Y6UPWzl3+2hF46HwqORNV0ySTURV3F10nQn62gxs=
X-Received: by 2002:a1f:3d8c:0:b0:471:875d:598e with SMTP id k134-20020a1f3d8c000000b00471875d598emr1400122vka.14.1688114894112;
        Fri, 30 Jun 2023 01:48:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGLUzgXllamVoix4PwpFQXjNbgp7rb8mGurpVINlrMfIinygDVMGUbf2XJJGJivCKigjBqJZrM1Q0MOPOs/BI8=
X-Received: by 2002:a1f:3d8c:0:b0:471:875d:598e with SMTP id
 k134-20020a1f3d8c000000b00471875d598emr1400118vka.14.1688114893881; Fri, 30
 Jun 2023 01:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de> <20230626231901.5b5d11c1.olaf@aepfle.de>
 <c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com> <5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
 <20230627140740.2736f6e8.olaf@aepfle.de> <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com>
In-Reply-To: <4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Jun 2023 10:48:02 +0200
Message-ID: <CABgObfamZEHv0W3B6kPXGTiT1f2G__S=Bi1-_PYeSomsiVFaFg@mail.gmail.com>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Bernhard Beschow <shentey@gmail.com>
Cc: Olaf Hering <olaf@aepfle.de>, qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009718d505ff54e07a"

--0000000000009718d505ff54e07a
Content-Type: text/plain; charset="UTF-8"

Il mer 28 giu 2023, 13:28 Bernhard Beschow <shentey@gmail.com> ha scritto:

>
>
> Am 27. Juni 2023 12:07:40 UTC schrieb Olaf Hering <olaf@aepfle.de>:
> >Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow <shentey@gmail.com>:
> >
> >> The BAR is a 32 bit register whose default value is 0x00000001. I think
> what's supposed to happen here is a pci_set_long() rather than a
> pci_set_byte().
> >
> >Indeed, the u32 at that address changes from c121 to c101 with the
> current code.
>
> Neat! Would you mind sending a patch fixing the BMIBA register to be reset
> as 32 bit?
>

I think we should also check why writing the command register is not
disabling the BAR as well.

Paolo


> Best regards,
> Bernhard
> >
> >Olaf
>
>

--0000000000009718d505ff54e07a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 28 giu 2023, 13:28 Bernhard Beschow &lt;<a href=
=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
Am 27. Juni 2023 12:07:40 UTC schrieb Olaf Hering &lt;<a href=3D"mailto:ola=
f@aepfle.de" target=3D"_blank" rel=3D"noreferrer">olaf@aepfle.de</a>&gt;:<b=
r>
&gt;Tue, 27 Jun 2023 10:12:50 +0000 Bernhard Beschow &lt;<a href=3D"mailto:=
shentey@gmail.com" target=3D"_blank" rel=3D"noreferrer">shentey@gmail.com</=
a>&gt;:<br>
&gt;<br>
&gt;&gt; The BAR is a 32 bit register whose default value is 0x00000001. I =
think what&#39;s supposed to happen here is a pci_set_long() rather than a =
pci_set_byte().<br>
&gt;<br>
&gt;Indeed, the u32 at that address changes from c121 to c101 with the curr=
ent code.<br>
<br>
Neat! Would you mind sending a patch fixing the BMIBA register to be reset =
as 32 bit?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think we should also check why writing the command register is =
not disabling the BAR as well.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Best regards,<br>
Bernhard<br>
&gt;<br>
&gt;Olaf<br>
<br>
</blockquote></div></div></div>

--0000000000009718d505ff54e07a--


