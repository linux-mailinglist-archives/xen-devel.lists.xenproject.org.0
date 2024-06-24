Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B79143F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 09:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746144.1153113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeXy-0001sj-4E; Mon, 24 Jun 2024 07:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746144.1153113; Mon, 24 Jun 2024 07:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeXy-0001qx-0e; Mon, 24 Jun 2024 07:55:30 +0000
Received: by outflank-mailman (input) for mailman id 746144;
 Mon, 24 Jun 2024 07:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xeV4=N2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sLeXw-0001qA-I7
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 07:55:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ec855a8-31ff-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 09:55:27 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d26a4ee65so3649569a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 00:55:27 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d305841a5sm4348528a12.97.2024.06.24.00.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:55:26 -0700 (PDT)
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
X-Inumbo-ID: 1ec855a8-31ff-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719215727; x=1719820527; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yWAq2lg3tgVYQqTGi+PCIx7d456rjClkYIehC/RPXDE=;
        b=gcZ2RB1bdWHteK3jG1ar7/9S74eLtMmCAV1fWdIezJs4M4tpIIrMdfYVznu1an0s00
         mfUecloH6x7Ocjht9VByV3t5jhgeXE/ussOqSUCFWy5oHACofLqAPZRIwmB3Z8O8cdWw
         AinhB+NLckIHa6g06tnH1SejR7UCqIyKzvHtxz7ybTxjs+ZgFpwuRY1eMxXr16XHvhIM
         t/oCwCQ4GskLRIxZ+v1YSK0iOA9qY1X2a4xouYojeGe2F+1D2StjjmUuvEm4wTiDKbH7
         O+vq0gLRmyaKad7Jyphb/6kcLEQksFcVD4wttDnn7V6dCRBl0b2K9lv0Un6JB0zjUKfZ
         bvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719215727; x=1719820527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWAq2lg3tgVYQqTGi+PCIx7d456rjClkYIehC/RPXDE=;
        b=wqdgdd6EwKT7mobY8/a0ueb98ydJcZHR+q9bZFBYITdL1aTHP3IEEGI62SguTrMbv4
         os56+X3mtt03lry6/FMo42wspxfe3svzqL+uF2AiCTAbM1kmKrHKb3sW/VyIH13C13ZZ
         vT/f6k0jplF9h2pGx8I8f3TbdJQox4kNzi20xmowMGbdCdeXcR7eTeG6Eyi9K6dYkJYm
         aHCp70OZj1iadpXcWshyRvLC6ni6Idg9Yj8/sXKOIk0gQHsYuCpauLLWWeQSv1/xRdxB
         4NknBR8vwPN+ysliK3V26G1ZWbfT6s7cs8QcRzEI3h6/WL9mri99RwJnjwuQg+spWuXQ
         4J/A==
X-Forwarded-Encrypted: i=1; AJvYcCWyncA5lE/x/qJprcpfM/rENr4pxyA4frdFOfjkakgRFajIK+LaeKwTdjJp5gpE+85uuOh4TUS815NrP6OAWApctH7NnzvkkoKwye0MAHE=
X-Gm-Message-State: AOJu0Yw+Dz1+bnQhlD/Wl/JPMZvS3Bc+yc1JNoQUpsRNeVQ4AHW2PQey
	gwEiYOrEcsdTfVCQ4q/25I/PkjM9D4rrrxdPmUXFSbQkQXsceVHV
X-Google-Smtp-Source: AGHT+IFL/9g1TcYmwQ5gZ1dJEMPOeHqMRZ/R4vUPZw7nKmSaX+FowoxL1pQK+XpHZ5/yWpdlNJc8iA==
X-Received: by 2002:a50:d699:0:b0:57c:6a71:e62e with SMTP id 4fb4d7f45d1cf-57d49dc02c2mr2453472a12.23.1719215726818;
        Mon, 24 Jun 2024 00:55:26 -0700 (PDT)
Message-ID: <74d59fa3da525e58a2ae77ed6ec62e5187d4f6e8.camel@gmail.com>
Subject: Re: [XEN PATCH] automation/eclair: add deviations of MISRA C Rule
 5.5
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>, 
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>
Date: Mon, 24 Jun 2024 09:55:25 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406211506160.2572888@ubuntu-linux-20-04-desktop>
References: 
	<dbd34e37b5d757ff7ae2a7318ad12b159970604c.1718887298.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406201722100.2572888@ubuntu-linux-20-04-desktop>
	 <alpine.DEB.2.22.394.2406211506160.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-06-21 at 15:07 -0700, Stefano Stabellini wrote:
> On Thu, 20 Jun 2024, Stefano Stabellini wrote:
> > On Thu, 20 Jun 2024, Federico Serafini wrote:
> > > MISRA C Rule 5.5 states that "Identifiers shall be distinct from
> > > macro
> > > names".
> > >=20
> > > Update ECLAIR configuration to deviate:
> > > - macros expanding to their own name;
> > > - clashes between macros and non-callable entities;
> > > - clashes related to the selection of specific implementations of
> > > string
> > > =C2=A0 handling functions.
> > >=20
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> >=20
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> I would like to ask for a release-ack as its effect is limited to
> ECLAIR
> analysis results and rule 5.5 is not blocking anyway (it is allowed
> to
> fail).

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


