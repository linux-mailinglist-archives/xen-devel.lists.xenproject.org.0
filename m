Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63E90C4BE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742786.1149650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTwQ-0005ZT-82; Tue, 18 Jun 2024 08:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742786.1149650; Tue, 18 Jun 2024 08:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJTwQ-0005X3-51; Tue, 18 Jun 2024 08:11:46 +0000
Received: by outflank-mailman (input) for mailman id 742786;
 Tue, 18 Jun 2024 08:11:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyK7=NU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJTwO-0005Wv-Qy
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:11:44 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65b5dd8c-2d4a-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 10:11:43 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so5739819e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:11:43 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca28880casm1474273e87.277.2024.06.18.01.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:11:41 -0700 (PDT)
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
X-Inumbo-ID: 65b5dd8c-2d4a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718698302; x=1719303102; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epKhMboTN8fRpvby0jSwmPI7ImG32pT8SgyyVWKv004=;
        b=OGmtaxjbamnV7HSHFnf4upkJ6hs4eULK1HVuzILpVNGOFv5bbtsf1c8xY23PnKZaOW
         HXTKY306ldK8dnReF6HBUHia4VcoD6Mx/WT+/2cvo5Tu1MWxMLlDOvVheJVCK1w6O3uk
         QPz8SXJWFfJrjkRyjszThtwYINoj7/rXjWQh9W+xpkU7/INbdeJ5LypWEDHlY1cKR4EE
         U26sIo1JnpmJGJRpt1F+ZfE6/Uh7lLL39/HGE4qWncqu8YtXmjlYVAsrD67+3dmY5RJf
         NA04DBpJtGAuQt2Sh0j3avO/2Y2QBLtyySWQxpJK3ty6yxmo4zzvuFDTQ8CKexVUeC/U
         NJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698302; x=1719303102;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epKhMboTN8fRpvby0jSwmPI7ImG32pT8SgyyVWKv004=;
        b=L7dglT+emLEBZkHS6yyCSptlDhI6sjvl9ZwQCdwRdeyDAxUnjKT319p06rjTo4FBAq
         F3WG97UZRdEug8bleU/Q65DMRIWjxuTLhymVE4k8Dlzm7Hk/xBafM/UoKStxAY0QtoPb
         Rgegz5NqMK1d2BMpnSQbpLfXPlF/OVMOIkwoHPo4ckElwF3i9CiGyCoeyW2myWnWbg4b
         N+QymjDYWn8DoafeHkN5qCWQVm6H8xLfWOD1O4tXitq8qaZXG97nYAfLdRBapGGdWwtq
         5QjViM28fdL3ylK6F8iK6t8IZqfDry36zTkcML85V2059iU7wy6iTXKS2tR5+6W69kUs
         Ur8g==
X-Forwarded-Encrypted: i=1; AJvYcCUbGsn7R8f67liTjipNkgva1L56clERVT2DIrqnG6Buqo4I+pjtCxnTXBIpQntuC2yybjGeLPMgbx/sKu5rjxfEVi06BordcWUCQgRxwAk=
X-Gm-Message-State: AOJu0YwQyLbjUDRxskwz8LC8ORGVhDwROa1Abb+dIy2uzCHO9+xkNJyQ
	Thr6WaRPEKPBQsHiLdVxlvn/Hx2IaRFGBoUZOkzJGJZohpaMAQ3m
X-Google-Smtp-Source: AGHT+IF1ZULFn4olreZ/lbfyZ9NjDRchIhQrSITWPCFh6xHNudHkoY8R12XlZoUJVGI4w32mrYONwg==
X-Received: by 2002:ac2:5e70:0:b0:52c:7fe3:d3e5 with SMTP id 2adb3069b0e04-52ca6e91424mr6264613e87.50.1718698301289;
        Tue, 18 Jun 2024 01:11:41 -0700 (PDT)
Message-ID: <f51438cf61c8b7e8fd5444dbea69f732cdd66ac0.camel@gmail.com>
Subject: Re: [PATCH v3 for-4.19 1/3] x86/irq: deal with old_cpu_mask for
 interrupts in movement in fixup_irqs()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 18 Jun 2024 10:11:40 +0200
In-Reply-To: <f92fc38b-aba9-4f8f-b95c-4723049523d0@suse.com>
References: <20240613165617.42538-1-roger.pau@citrix.com>
	 <20240613165617.42538-2-roger.pau@citrix.com>
	 <f92fc38b-aba9-4f8f-b95c-4723049523d0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-06-17 at 15:18 +0200, Jan Beulich wrote:
> On 13.06.2024 18:56, Roger Pau Monne wrote:
> > Given the current logic it's possible for ->arch.old_cpu_mask to
> > get out of
> > sync: if a CPU set in old_cpu_mask is offlined and then onlined
> > again without old_cpu_mask having been updated the data in the mask
> > will no
> > longer be accurate, as when brought back online the CPU will no
> > longer have
> > old_vector configured to handle the old interrupt source.
> >=20
> > If there's an interrupt movement in progress, and the to be
> > offlined CPU (which
> > is the call context) is in the old_cpu_mask clear it and update the
> > mask, so it
> > doesn't contain stale data.
>=20
> Perhaps a comma before "clear" might further help reading. Happy to
> add while committing.
>=20
> > Note that when the system is going down fixup_irqs() will be called
> > by
> > smp_send_stop() from CPU 0 with a mask with only CPU 0 on it,
> > effectively
> > asking to move all interrupts to the current caller (CPU 0) which
> > is the only
> > CPU to remain online.=C2=A0 In that case we don't care to migrate
> > interrupts that
> > are in the process of being moved, as it's likely we won't be able
> > to move all
> > interrupts to CPU 0 due to vector shortage anyway.
> >=20
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

