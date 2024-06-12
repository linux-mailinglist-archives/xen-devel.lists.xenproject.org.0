Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F5090500F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739101.1146027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKtM-0000gZ-IB; Wed, 12 Jun 2024 10:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739101.1146027; Wed, 12 Jun 2024 10:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHKtM-0000dn-En; Wed, 12 Jun 2024 10:07:44 +0000
Received: by outflank-mailman (input) for mailman id 739101;
 Wed, 12 Jun 2024 10:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FFiX=NO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sHKtL-0000da-AA
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:07:43 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a88af79-28a3-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:07:41 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52c32d934c2so4161362e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 03:07:41 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb41e1bd6sm2394771e87.48.2024.06.12.03.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 03:07:40 -0700 (PDT)
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
X-Inumbo-ID: 9a88af79-28a3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718186861; x=1718791661; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ep0PBQ7KNW188xRXp5IS+ALJEl/avlLGzIRQZPwnSBY=;
        b=V9r9zd23RLfcBlf6oeI4Q5cq3EDovB562HcEIrDfK7qbHdSHz0seIuGiPFDWne6gJN
         hUTFji7L2nodq5/BjTOxh1m+vRa56gij9yE3Z++LnTYXoBBt3JgsHUB5E3WlQ/iQu5Ao
         gPjJwVbtxP20UayX6OUAY6MMZnHp1/GePiayNkvrp5NRD2dmRk53qVmebnasxysYKMtn
         Jire+gyP6In3/hSC/wIMGXy3Q75NDP9eN/HsjcSwas+Q3q0Vgqytxjd2uTGKxm8tBQqP
         b0N6vTF1a8nhOkPL67JZMvz5XKVSmIxFIFR4quECN4sKD0OuW59crTmRFxTrnwTaad/2
         3BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186861; x=1718791661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ep0PBQ7KNW188xRXp5IS+ALJEl/avlLGzIRQZPwnSBY=;
        b=WQzyomxr7l9Bayn04dQmKVWIy/SCidLV3wqKI5uDlav4MxAJIDfA/iAgJ3YrjP1VxQ
         zAMlhUUvZ2QcfniXVhXfpYbtQRQQvSqegCb2Mp6uvyEcSHgltkHeXKser21VmJ3iICqV
         JMlkBVSEn9Ir70MjOouUka7qBWgwc9MsId9QRaUwjyeIztTmoPylzuC9qn04nPkinrAD
         eYBhHrr+pbrcQY6cqjGdOsXxAQp0pWNZFCkhxHhCrw0guFY80Brpk2Wvr5gjbQvqnPPh
         rTe3wWSEadEoD7UvvxZB59KgJnJfW7YfzIni/2g/lxSVRLiXU9LTQdVaN2Jqpat03xdi
         TBSA==
X-Forwarded-Encrypted: i=1; AJvYcCVO8kBD4QcAqh8+1giIo+NX+lSzxFWyoGXIfwesVoe05iH0PGVkNk91OIJQJN4MrGNC8FKsmm4dUx+RrbuSlmiS4j/EalEDzFPbJCB49hQ=
X-Gm-Message-State: AOJu0YyxhUjVSTbPNbfbfhg86hjymC7ZfgzeROPcJ5IeXhQkC9lH4UT9
	4h6DP7ItxNh0No/IkPBVtO3w5X/JXcch6mpvMCDmgZNjbq8pk0cn
X-Google-Smtp-Source: AGHT+IG6lD2KlqlU6/mPFVCj87W0QLKiGM3w0TpPFZUmnuH2oz0JsR9TcJIuWLJQym2B1jcoAKSlgw==
X-Received: by 2002:a05:6512:452:b0:52c:4cfa:c5a6 with SMTP id 2adb3069b0e04-52c9a3df26fmr640282e87.34.1718186860374;
        Wed, 12 Jun 2024 03:07:40 -0700 (PDT)
Message-ID: <3d5287cacaf7960cfabc1262fe1603e53267a344.camel@gmail.com>
Subject: Re: [PATCH v2 1/7] x86/smp: do not use shorthand IPI destinations
 in CPU hot{,un}plug contexts
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 12 Jun 2024 12:07:39 +0200
In-Reply-To: <92584a2d-6695-4884-ba2e-990842318d8a@suse.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
	 <20240610142043.11924-2-roger.pau@citrix.com>
	 <615582c8-c153-424d-bce4-eb0c903d28ad@suse.com> <ZmlXve3rV2Vx9bH7@macbook>
	 <92584a2d-6695-4884-ba2e-990842318d8a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-06-12 at 10:56 +0200, Jan Beulich wrote:
> On 12.06.2024 10:09, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Jun 11, 2024 at 09:42:39AM +0200, Jan Beulich wrote:
> > > On 10.06.2024 16:20, Roger Pau Monne wrote:
> > > > Due to the current rwlock logic, if the CPU calling
> > > > get_cpu_maps() does so from
> > > > a cpu_hotplug_{begin,done}() region the function will still
> > > > return success,
> > > > because a CPU taking the rwlock in read mode after having taken
> > > > it in write
> > > > mode is allowed.=C2=A0 Such behavior however defeats the purpose of
> > > > get_cpu_maps(),
> > >=20
> > > I'm not happy to see you still have this claim here. The behavior
> > > may (appear
> > > to) defeat the purpose here, but as expressed previously I don't
> > > view that as
> > > being a general pattern.
> >=20
> > Right.=C2=A0 What about replacing the paragraph with:
> >=20
> > "Due to the current rwlock logic, if the CPU calling get_cpu_maps()
> > does so from
> > a cpu_hotplug_{begin,done}() region the function will still return
> > success,
> > because a CPU taking the rwlock in read mode after having taken it
> > in write
> > mode is allowed.=C2=A0 Such corner case makes using get_cpu_maps() alon=
e
> > not enough to prevent using the shorthand in CPU hotplug regions."
>=20
> Thanks.
>=20
> > I think the rest is of the commit message is not controversial.
>=20
> Indeed.
>=20
> > > > --- a/xen/arch/x86/smp.c
> > > > +++ b/xen/arch/x86/smp.c
> > > > @@ -88,7 +88,7 @@ void send_IPI_mask(const cpumask_t *mask, int
> > > > vector)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the system have been accounted for=
.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if ( system_state > SYS_STATE_smp_boot &&
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !unaccounted_cpus=
 && !disabled_cpus &&
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !unaccounted_cpus=
 && !disabled_cpus &&
> > > > !cpu_in_hotplug_context() &&
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* NB: get_c=
pu_maps lock requires enabled interrupts.
> > > > */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_is=
_enabled() && (cpus_locked =3D
> > > > get_cpu_maps()) &&
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (park_offlin=
e_cpus ||
> > >=20
> > > Along with changing the condition you also want to update the
> > > comment to
> > > reflect the code adjustment.
> >=20
> > I've assumed the wording in the commet that says: "no CPU hotplug
> > or
> > unplug operations are taking place" would already cover the
> > addition
> > of the !cpu_in_hotplug_context() check.
>=20
> Hmm, yes, you're right. Just needs a release-ack then to go in (with
> the
> description adjustment).
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


