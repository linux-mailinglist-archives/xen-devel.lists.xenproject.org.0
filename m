Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF27A4929
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:05:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603994.941172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiD09-00076d-Tp; Mon, 18 Sep 2023 12:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603994.941172; Mon, 18 Sep 2023 12:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiD09-00074S-RM; Mon, 18 Sep 2023 12:05:17 +0000
Received: by outflank-mailman (input) for mailman id 603994;
 Mon, 18 Sep 2023 12:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pP1k=FC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qiD08-00074M-Mv
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:05:16 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e955e4-561b-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 14:05:15 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-503012f4e71so2207239e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 05:05:15 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004ff6fa3f038sm1780122lff.144.2023.09.18.05.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 05:05:14 -0700 (PDT)
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
X-Inumbo-ID: a0e955e4-561b-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695038715; x=1695643515; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cKmCF3XWTOQdRl++98lYuXTpGeRL6KKlRJY+OxeldBQ=;
        b=bE3Y9TVwb+qB11eAhTTBOZC2r1oquIfNNS+ae8y+JiIK3Ztnc3ZhtKCkq2ie55JCrS
         5v5SYbifIBD8JJ1Iw88BJxTs8b4kFoCk11y+lSz0FPBntLTpXu4ksp6EX1kYwTV4aSte
         QW/fMJrxJcQTPVubG4o2/bV4jwDe8dP2x7o8yahgpVYxQO5Zzba/mXbDf93l77RDb2BW
         0oYb8/g6Rle47Tt5ZCHDm0MMTtU5GVFG8MNaec5EfgSMEuqdTkH1L05LNiRX9fGL2AvL
         nHDzXXw4t9e95koybgAss4TU3xRCG8iP08G2x0GCofy1sMtdG6U3pI0i7+IFon69Gu38
         XUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695038715; x=1695643515;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKmCF3XWTOQdRl++98lYuXTpGeRL6KKlRJY+OxeldBQ=;
        b=ktMiyzgUM95q5KBqnGQhqREfF5GtN035P2S8wg6W6fNpKTwcnZW0I2XHCqmDbDxMj7
         y2jPA6Xm47x9on6xYOqKpWWC4fosoaL0pImcgwYYBmFYEHjeN9H6YEcNw+d842e1QQDe
         FLF+T753ppc7dN/U2y1Wz54/9QPGfppq5M860WnqCyOZv6TU/txnZotU1lRHERMNOCb4
         jpo9IhnijvKwKpWoKx1yPzvL+WARaEo67Y8s9SWSDnnAtQPX1aO62+2RmPd404HERWL/
         HkV1VdFB1/lnuzVDYphheeXEpZhjC4GSkcAaavGpkvidpNW+3xWex/zJBhw2DEd0t83L
         vbYg==
X-Gm-Message-State: AOJu0YwitBsrPxFDpmxKOsQKR6mEw3iSW1PO+GhQ1KMQz/SuWul0sLll
	Q+vvQOTF2Hh6Y3uoEQSD1ek=
X-Google-Smtp-Source: AGHT+IFnUvdDM/yyDqfrQnWoM4gtwItFXSQVkbM0T9/lvJk+6RyAbL4ZkBRecp9zZFKYN0mcZAQOHw==
X-Received: by 2002:a05:6512:3708:b0:4f9:dac6:2f3d with SMTP id z8-20020a056512370800b004f9dac62f3dmr2876781lfr.13.1695038715055;
        Mon, 18 Sep 2023 05:05:15 -0700 (PDT)
Message-ID: <09d0449004162ccd339e9e8559b7efad3e2335bb.camel@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Mon, 18 Sep 2023 15:05:13 +0300
In-Reply-To: <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
	 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
	 <3b7ef926-ed06-609f-d443-544bd9125bec@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-09-18 at 11:29 +0200, Jan Beulich wrote:
> On 18.09.2023 10:51, Oleksii wrote:
> > On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
> > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > Based on two patch series [1] and [2], the idea of which is to
> > > > provide minimal
> > > > amount of things for a complete Xen build, a large amount of
> > > > headers are the same
> > > > or almost the same, so it makes sense to move them to asm-
> > > > generic.
> > > >=20
> > > > Also, providing such stub headers should help future
> > > > architectures
> > > > to add
> > > > a full Xen build.
> > > >=20
> > > > [1]
> > > > https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@r=
aptorengineering.com/
> > > > [2]
> > > > https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kuro=
chko@gmail.com/
> > > >=20
> > > > Oleksii Kurochko (29):
> > > > =C2=A0 xen/asm-generic: introduce stub header spinlock.h
> > >=20
> > > At the example of this, personally I think this goes too far.
> > > Headers
> > > in
> > > asm-generic should be for the case where an arch elects to not
> > > implement
> > > certain functionality. Clearly spinlocks are required uniformly.
> > It makes sense. Then I will back to the option [2] where I
> > introduced
> > all this headers as part of RISC-V architecture.=20
>=20
> You did see though that in a reply to my own mail I said I take back
> the
> comment, at least as far as this header (and perhaps several others)
> are
> concerned.
>=20
I missed that comment on the patch about spinlock.

Well, then, I don't fully understand the criteria.

What about empty headers or temporary empty headers?

For example, asm/xenoprof.h is empty for all arches except x86, so it
is a good candidate for asm-generic.
But asm/grant_table.h is empty for PPC and RISC-V for now but won't be
empty in the future. Does it make sense to put them to asm-generic? The
only benefit I see is that in future architecture if they follow the
same way of adding support for the arch to Xen, they will face the same
issue: building full Xen requires this empty header.

So, should I wait for some time on other patches of the patch series?

~ Oleksii


