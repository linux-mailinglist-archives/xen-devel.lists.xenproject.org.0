Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4840C705525
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 19:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535436.833140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyydZ-0000RA-3s; Tue, 16 May 2023 17:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535436.833140; Tue, 16 May 2023 17:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyydZ-0000P2-0w; Tue, 16 May 2023 17:39:01 +0000
Received: by outflank-mailman (input) for mailman id 535436;
 Tue, 16 May 2023 17:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKnf=BF=redhat.com=jsnow@srs-se1.protection.inumbo.net>)
 id 1pyydX-0000Ow-HA
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 17:38:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885e26f8-f410-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 19:38:57 +0200 (CEST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-ttrvkttINniNw_plmSPcBw-1; Tue, 16 May 2023 13:38:54 -0400
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6434336147cso8246265b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 May 2023 10:38:54 -0700 (PDT)
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
X-Inumbo-ID: 885e26f8-f410-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684258736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7JGMjrkbABMXmudfgjOwEmUZFJhzeLKxKLcXPj6Fso=;
	b=KRA8bo/3JK9izibu72tDcbgNmcoTaS2QDNlvi6idksoR7blblWRtaoUpAEJm+4FaWcibbx
	GAjhBnkG36F4Dbz7ueZmX4wbZpwL+oJ+dhmFd9EpfGJq1JqniHPFxFNzXKms1RX5aAjlDg
	4antL9sef/Pq8V1zHooPyieghQB9Tlk=
X-MC-Unique: ttrvkttINniNw_plmSPcBw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684258733; x=1686850733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7JGMjrkbABMXmudfgjOwEmUZFJhzeLKxKLcXPj6Fso=;
        b=d4OUU9u0zMpXTo+cSEmi+dOV/GUi179RBUKrfzwHzI0/XQdKzCKjTDhK2PYkvscDr0
         F2M0n3iQILXzQ5qPtX2Iih+/dLbgNmeurlBwNyHbzKZfWBYsn7EPToGh8BL3fcJteRYU
         4moTzSHQ2MtQLG4ZneRWJoLxEML3lJvzom/xU9qqfE6G9pmcABRyyXnyqy3RD497Wnv2
         VnKuiUSebmQxIioipq8aJR6QKnP+XZRVDTAMaAX8nqZeCCF4J6hoaKMCdz0JQddebwEb
         XVP8CF/Qw+Q3o/ghTDdDUlH817jJS2UDTu9s5F8jIhwu76b1fcS87kQY1pbqAwLoVXYw
         M/rA==
X-Gm-Message-State: AC+VfDxYNOcwQLPvnkoUNCIvocHAwS5Ae9S7j9ieJwPu08mw0VUHgp+h
	Mi2LZN/IHomL1g8NUsQX+8NS17cPgBRwXiMbS5pEId3WDP+gqoUlya2BeijEa9H8//c02uSWasU
	jX/qvevAITFudlq4Ywq0PpMSnUuJgNqJsHzt/Omrdh4s=
X-Received: by 2002:a05:6a00:189a:b0:646:7234:cbfc with SMTP id x26-20020a056a00189a00b006467234cbfcmr42825192pfh.27.1684258733606;
        Tue, 16 May 2023 10:38:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DqjD5Mv/y/nBF5tNjAvtQEFBbZtdinKk9xVA0Nn3QAhyxhf+TjPJwds4k7CJPEPxrICXCVe7WEr6J8AcMekw=
X-Received: by 2002:a05:6a00:189a:b0:646:7234:cbfc with SMTP id
 x26-20020a056a00189a00b006467234cbfcmr42825176pfh.27.1684258733316; Tue, 16
 May 2023 10:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210317070046.17860-1-olaf@aepfle.de> <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de> <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
 <20230509225818.GA16290@aepfle.de> <20230510094719.26fb79e5.olaf@aepfle.de> <alpine.DEB.2.22.394.2305121411310.3748626@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2305121411310.3748626@ubuntu-linux-20-04-desktop>
From: John Snow <jsnow@redhat.com>
Date: Tue, 16 May 2023 13:38:42 -0400
Message-ID: <CAFn=p-aFa_jFYuaYLMumkX=5zpn228ctBcV=Gch=BhmQs6i2dA@mail.gmail.com>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Olaf Hering <olaf@aepfle.de>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, 
	qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 12, 2023 at 5:14=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 10 May 2023, Olaf Hering wrote:
> > Wed, 10 May 2023 00:58:27 +0200 Olaf Hering <olaf@aepfle.de>:
> >
> > > In my debugging (with v8.0.0) it turned out the three pci_set_word
> > > causes the domU to hang. In fact, it is just the last one:
> > >
> > >    pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
> > >
> > > It changes the value from 0xc121 to 0x1.
> >
> > If I disable just "pci_set_word(pci_conf + PCI_COMMAND, 0x0000);" it wo=
rks as well.
> > It changes the value from 0x5 to 0.
> >
> > In general I feel it is wrong to fiddle with PCI from the host side.
> > This is most likely not the intention of the Xen unplug protocol.
> > I'm sure the guest does not expect such changes under the hood.
> > It happens to work by luck with pvops kernels because their PCI discove=
ry
> > is done after the unplug.
> >
> > So, what do we do here to get this off the table?
>
> I don't have a concrete suggestion because I don't understand the root
> cause of the issue. Looking back at Paolo's reply from 2021
>
> https://marc.info/?l=3Dxen-devel&m=3D161669099305992&w=3D2
>
> I think he was right. We can either fix the root cause of the issue or
> avoid calling qdev_reset_all on unplug. I am OK with either one.

I haven't touched IDE or block code in quite a long while now -- I
don't think I can help land this fix, but I won't get in anyone's way,
either. Maybe just re-submit the patches with an improved commit
message / cover letter that helps collect the info from the previous
thread, the core issue, etc.

--js


