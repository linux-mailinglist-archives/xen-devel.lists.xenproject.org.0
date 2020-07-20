Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C8226A06
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 18:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxYiA-0001cv-Tp; Mon, 20 Jul 2020 16:32:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2q/L=A7=gmail.com=jaromir.dolecek@srs-us1.protection.inumbo.net>)
 id 1jxYiA-0001cq-1m
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 16:32:18 +0000
X-Inumbo-ID: 9338a892-caa6-11ea-84a5-bc764e2007e4
Received: from mail-vs1-xe2f.google.com (unknown [2607:f8b0:4864:20::e2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9338a892-caa6-11ea-84a5-bc764e2007e4;
 Mon, 20 Jul 2020 16:32:17 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q15so8821596vso.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wfkWNTGr7rI1M7TmzCRQ5/XZvg9x2RK3EJGaSSXIjwc=;
 b=h2CVDI0UrkjbNx6BHtZc+AfRHn3d9eD0t5LW0+BGdlDxgqZHXxkr5jJm/mcmoy5BlB
 E34N+LkXAZ3/o1/gaFc3NRDprxrhAKUC/pfQcnJh/OVcpdYsxopA5LZnRccVH7792mKu
 Yp1srZGmaM3BrHfXywBZXR6CFicSOvdsfwfyGCq3gBHBo+EpBiSIzk4cfdsTBWn1fXek
 YufuZbup7NQbwnQwX/Vgm8VDAcwU47naeaB6p2pGp1PDGj8lKyhnB94vNv2adLUT7HEN
 wL0jiIzZ4b/SsCOks4G/OMh42oxxLDhqLAo6j0EH97CfYbvKQwFoDF3SCIXa0QONp4Lo
 TbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wfkWNTGr7rI1M7TmzCRQ5/XZvg9x2RK3EJGaSSXIjwc=;
 b=jwZqyvbbK9ZaJvxWPFJZL/JYE1rwC8r/bhxv97LeAz/QXIxgJgL85sU+3Hy5BAhQ76
 GZh5cCCHo08zgqJMchu6r7SNAKS2k/8xY+8MuRCkArboLyUDWgX033QEHj1ySUJnr3ik
 Kaq9mrMl8BS09NAiyZ/HFx+Bh0Usg9ged+e7qz20zSNfTdNJiBQg9G8t+Ddyyk0fVj9N
 Cwp4NLu/jGXbMUq9Zy+oBmkzAvUXqWvrkw18BKoobXy736pZZur/aFREHtscpKidJrSw
 yN1kbati50ujx2g1QjItKTu6Dfr1WWK7n8qNcRZvD1Lhy683x4Q86X8I1tiGawGq3R8e
 ZVlQ==
X-Gm-Message-State: AOAM532vnq7rRKFf49nQfR88HNBBHurL7zZRKbghDcUl2wld5014Ho0a
 H9i7vVntMXb0/ystT5TJHCBFArp9IxO2fPRHi5c=
X-Google-Smtp-Source: ABdhPJzOTheOnAr0eEUHM/ZlqAgCvRlFJEanTPVC07ExvSJ9ujL0f6oBlRqxMnmovrezxud2+gVAJmf57TMm/uofcvg=
X-Received: by 2002:a05:6102:3188:: with SMTP id
 c8mr17832075vsh.61.1595262736913; 
 Mon, 20 Jul 2020 09:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMnsW5542gmBLpKBsW5pnm=2VXmaDVHzg=OXXvBdu1BsYLdDvQ@mail.gmail.com>
 <20200720070010.GC7191@Air-de-Roger>
 <0a389f69-2c6b-e564-c6b5-c8f09ed66de0@suse.com>
In-Reply-To: <0a389f69-2c6b-e564-c6b5-c8f09ed66de0@suse.com>
From: =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
Date: Mon, 20 Jul 2020 18:32:06 +0200
Message-ID: <CAMnsW55Cnw54_P=_Np4h1siaCPgDjwRFGQ_pUAJEkLELTSEW+Q@mail.gmail.com>
Subject: Re: Advice for implementing MSI-X support on NetBSD Xen 4.11?
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Le lun. 20 juil. 2020 =C3=A0 09:00, Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> a =C3=A9crit :
> You need to set entry_nr and table_base.

Yes, I do that. I use the table_base set to what would be written to
the register for "native".

> Are you enabling the capability and unmasking the interrupt in the
> MSI-X table?

Yes, I'm doing that.

> There are also the Xen debug keys which can be helpful, take a look at
> 'i' and 'M'.

OK, I'll check that.

Le lun. 20 juil. 2020 =C3=A0 10:47, Jan Beulich <jbeulich@suse.com> a =C3=
=A9crit :
> Is this effort for PV or PVH? If the former, I don't think Dom0 is
> supposed to write directly to any of these structures. This is all
> intended to be hypercall based, despite us intercepting and trying
> to emulate direct accesses.
>
> Jarom=C3=ADr - are you making use of PHYSDEVOP_prepare_msix?

It's PV for now. I already skip the step to actually write the table
vectors when setting this up, same as I do for MSI. I still write the
registers to enable MSI-X.

I was not aware of PHYSDEVOP_prepare_msix, I did not notice it when
looking on what Linux kernel does - I'll check it.

Thanks.

Jaromir

