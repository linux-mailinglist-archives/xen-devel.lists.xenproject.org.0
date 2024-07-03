Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD6B9255C7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752820.1161064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOveX-0000FC-Kb; Wed, 03 Jul 2024 08:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752820.1161064; Wed, 03 Jul 2024 08:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOveX-0000CA-Gw; Wed, 03 Jul 2024 08:47:49 +0000
Received: by outflank-mailman (input) for mailman id 752820;
 Wed, 03 Jul 2024 08:47:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAj5=OD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOveW-0000Bd-Fg
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:47:48 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdce20f-3918-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 10:47:47 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso3080690a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:47:47 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf188afsm486739466b.24.2024.07.03.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:47:46 -0700 (PDT)
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
X-Inumbo-ID: ebdce20f-3918-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719996467; x=1720601267; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g282Etc/lucc/LAGc4Tu1MqJLAdGFp+q8jN+uKR5CmE=;
        b=MsG0rYYkSGp03M70RuEVHS9XG3/cNN8GEDWazCDTj7h3ZNgFq1k5mcGKI6NEJHPPIL
         4lgh4ctkusbLQeMH0uPqQFeA/qrLlYOz4gf0GbKznzv6pPe/1f56sGUeAt+vFnKj9TPZ
         Ivibt+RavjVTjJwGQR3ZRexqS81dZeBVULLNzRa6arU1iKnEVBfCwK6+8dKd2SSYSDy/
         4jZzxZ/1r8F5LI448dLsNSVmAyh7w3RcK7/2iDLbxuW98za62yQiqWrngGobDqCzNkF0
         ZAstvk4+Kz0zktcBmKGYCGGT5CJjsFGpM81mRTib7ro3ti+vLWd+RIJxm26mYKyvrGz8
         Wuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996467; x=1720601267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g282Etc/lucc/LAGc4Tu1MqJLAdGFp+q8jN+uKR5CmE=;
        b=LALSqmY0+Bbq8Mgk2ud8G7ZnyMv5mAgP5T4knzak/XMH7jbixf3GXwhPRk/kJH5IrB
         E9s4nHqOCJlIu782FeZxao3E+tACX/7Dq6t2bxD+DRDGB5nJ17YwPq48qE3r5YraUaYe
         tVmg+DFUhw76a8scb2hZ0v0xOLjQtBs0UWhApf41xr2MojmZv+JTUfi9g7DshD0aE4lq
         4/1+o91OOXrjWnB9/E+DzMJu/CTd5zgqg5j1I5KbBMAKRPwcmg+kKjQoE7JWRyPZ0rjM
         OlMUf5ZffrsqCB7cYDzJzinPCZucspGAqr2+hILiJYqomhXnyDixRj7Ywnul0pE8p2vU
         hBIw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9sb0vKgJXs6OH/DqoZX4udHaMKAc2PF+lkwxYCPmYczyeoEaEMGmbJf1iinHodiD8kWU8Sa7KUTDqFy7HdO7ZKViorrbTNCVja+dTgA=
X-Gm-Message-State: AOJu0YxVi05T9gsuBPvOvP7quLgav5nmlCJS8Py6GX35pN2BSxYhTF1N
	qmOVJF1zKERfl5A8DvrvC2BkylOFaPd53YG/ztUUPWgreEH4G0QB
X-Google-Smtp-Source: AGHT+IGPzGxDOveHMzkGS67sicRveuuFI1uzRAqNi96SayCAWCTyTSfTAoB22G+jC6gfyEvxioUltA==
X-Received: by 2002:a17:906:229b:b0:a72:4281:bc72 with SMTP id a640c23a62f3a-a75144dd493mr740986166b.63.1719996466451;
        Wed, 03 Jul 2024 01:47:46 -0700 (PDT)
Message-ID: <ad6835dad7bee82bbe0aa66ca9a5070412fcd826.camel@gmail.com>
Subject: Re: [PATCH v14 1/9] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 03 Jul 2024 10:47:45 +0200
In-Reply-To: <630de29e-e350-47ee-b451-5312befde5ce@suse.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
	 <2f60d1fd7b3ac7d603486ce03a112d58352bf16d.1719917348.git.oleksii.kurochko@gmail.com>
	 <630de29e-e350-47ee-b451-5312befde5ce@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-07-03 at 09:24 +0200, Jan Beulich wrote:
> On 02.07.2024 13:01, Oleksii Kurochko wrote:
> > The following generic functions were introduced:
> > * test_bit
> > * generic__test_and_set_bit
> > * generic__test_and_clear_bit
> > * generic__test_and_change_bit
> >=20
> > These functions and macros can be useful for architectures
> > that don't have corresponding arch-specific instructions.
> >=20
> > Also, the patch introduces the following generics which are
> > used by the functions mentioned above:
> > * BITOP_BITS_PER_WORD
> > * BITOP_MASK
> > * BITOP_WORD
> > * BITOP_TYPE
> >=20
> > The following approach was chosen for generic*() and arch*() bit
> > operation functions:
> > If the bit operation function that is going to be generic starts
> > with the prefix "__", then the corresponding generic/arch function
> > will also contain the "__" prefix. For example:
> > =C2=A0* test_bit() will be defined using arch_test_bit() and
> > =C2=A0=C2=A0 generic_test_bit().
> > =C2=A0* __test_and_set_bit() will be defined using
> > =C2=A0=C2=A0 arch__test_and_set_bit() and generic__test_and_set_bit().
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V14:
> > =C2=A0- Nothing changed. Only Rebase.
> > ---
> > Changes in V13:
> > =C2=A0- add Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V12:
> > =C2=A0- revert change of moving the definition of BITS_PER_BYTE from
> > <arch>/bitops.h to xen/bitops.h.
> > =C2=A0=C2=A0 ( a separate patch will be provided to put BITS_PER_BYTE t=
o
> > proper place )
>=20
> Oleksii - seeing that this wasn't actually done (as noticed by
> Michal), my
> intention would be to adjust the patch while committing. Please let
> me know
> shortly if there is anything I'm overlooking, possibly implying the
> intended
> adjustment shouldn't be done (and further suggesting that the
> revision log
> then is wrong and/or incomplete). As indicated, I'll need another
> reply of
> yours here (and for subsequent patches; maybe simply the entire
> series)
> anyway, as a release-ack is still missing.
The changes log is correct.

If we are going to drop BITS_PER_BYTE in xen/bitops.h, then it will
need to be added back to <arm>/bitops.h as it was done in "Changes in
V12". (This change was lost somewhere due to an incorrect rebase by
me.).

Regarding Release-Acked-By, I was okay to have this patch series during
Soft Code Freeze but now we are in Hard Code Freeze state where I am
expecting to see only bug/security fixes.

Unfortunately, it would be better based on current state of release to
wait 4.20 staging branch.

Based on that let me know if you want me to sent a new patch series
version with BITS_PER_BYTE adjustments or it still could be fix during
the commit when 4.20 staging will be available?

~ Oleksii

>=20
> Andrew - this is going to be the last time I ask that you please come
> forward
> with any concrete objections to this or any other patch in the
> series, if
> indeed there were any. Without you doing so, I'm going to commit this
> series
> (or the parts thereof that are properly ready) as soon as a release
> ack has
> arrived, but - to allow a little bit of time - no earlier than
> tomorrow
> morning. That'll be on the basis that so far possible objections of
> yours are
> purely hearsay; you never voiced any on the list, and even on Matrix
> it was
> only along the lines of "there is something".
>=20
> Jan


