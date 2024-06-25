Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA491611E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 10:27:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747432.1154842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Vz-0007i2-94; Tue, 25 Jun 2024 08:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747432.1154842; Tue, 25 Jun 2024 08:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM1Vz-0007gS-6A; Tue, 25 Jun 2024 08:26:59 +0000
Received: by outflank-mailman (input) for mailman id 747432;
 Tue, 25 Jun 2024 08:26:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM1Vx-0007Rh-4J
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 08:26:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af24fa6e-32cc-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 10:26:56 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7194ce90afso319500366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 01:26:56 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72605ff279sm115202166b.5.2024.06.25.01.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 01:26:55 -0700 (PDT)
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
X-Inumbo-ID: af24fa6e-32cc-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719304016; x=1719908816; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yEwKOUGGCIv8ACnry1j25lAziChwmD6QHaW2e6K1n0Q=;
        b=cG2L93+yDlrg97KN4mc1T1WsEKtE8sSeFgqxqDUvWG+n5IRZdTdc3NmSVd/D6xGpR5
         m9bGIyssP6qvt4AgpX2mBTiDBQc/qTHBFFtzpl6f0WoAzvWDQL09BLBljE49jl1RYPdJ
         0zCBjacZ56xbklCjExpMa0oI46nyquVkW8PPorbZ2XHIiUGy6+D41MGmsMpNnuFf9zxX
         /W/2/uXgI9zjhu5TzxK3B1Q8mrPjlBfdibkUDzsnj0JkaSvRNgf08lTiw52S1EsUwjzo
         rr0KIO2EyDAGvSUbTszlvx046efTcSJcIAPYoKKuQDhO/biH785tRQV2TnFpQLFSKGzZ
         TZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719304016; x=1719908816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEwKOUGGCIv8ACnry1j25lAziChwmD6QHaW2e6K1n0Q=;
        b=lUPjfhVJGtgD9DHsVO4hYyEj137UPJHyiCCaQYbVqcfK9AcloPM3xYLX5VUhqiS2nt
         K+edH76iSRSqrOzJ+ZNXF+E8pEBInXv6HRNX+ksK+F74Wy5P2Iz97aH7FBuyYQ/5PLrW
         B7ULTkr487Fjdr9Gj1vjCc5Yvjwx69iO8+r03EDjQvNRH+5yjbI5AS5smH6Xabeqkxqm
         MgFRVFLcWuzxSt2sHQwRDPhIhS2h7O9eQbSRDmvL2TI9Bu4TN7sTutruPmwboxo0ecWc
         2hsu90ezr7KbgXy5YerZ88NtuygMxkb3Qn9XD+K9pF22+9II97YI90HWZNDne0ZA8IBQ
         u5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3WI8e2a68Bl6jd87Ee+ZEqF+OuU/CMiFCAYCSpq8QFM0Aq6/076qm8pQwbjGB5a5s6UzKj3qRppZhBPNYw+y0bO/OH9ifSgtGJV446ho=
X-Gm-Message-State: AOJu0Yw/ZYA7n53qRIyBd0xT9xkjyV73EHKM6XHKWBYxIZS5dCL1KhXW
	TQE+n2B5ot5xySr24sVGXSZPjklFPd2Cqbwe9qMJOn06YImpAUPf
X-Google-Smtp-Source: AGHT+IH7gUZQtsoXSPsGOcdtI0e4fB6/EsVmDjm0zgn/6rmDTLoSwvFbWUWR/csnhPnvGks6idtjXA==
X-Received: by 2002:a17:906:3c50:b0:a72:40b5:f6de with SMTP id a640c23a62f3a-a7240b5f752mr500406366b.3.1719304015791;
        Tue, 25 Jun 2024 01:26:55 -0700 (PDT)
Message-ID: <e4eda2b666a13b4f6049f7b27c5fd571519e28d6.camel@gmail.com>
Subject: Re: [XEN PATCH v2] automation/eclair: configure Rule 13.6 and
 custom service B.UNEVALEFF
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>, 
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Date: Tue, 25 Jun 2024 10:26:54 +0200
In-Reply-To: <alpine.DEB.2.22.394.2406241725240.3870429@ubuntu-linux-20-04-desktop>
References: 
	<5c60e98d70ae94c155fd56ec13b764b7a8f6161c.1719219962.git.federico.serafini@bugseng.com>
	 <alpine.DEB.2.22.394.2406241637380.3870429@ubuntu-linux-20-04-desktop>
	 <alpine.DEB.2.22.394.2406241725240.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-06-24 at 17:26 -0700, Stefano Stabellini wrote:
> On Mon, 24 Jun 2024, Stefano Stabellini wrote:
> > On Mon, 24 Jun 2024, Federico Serafini wrote:
> > > Rule 13.6 states that "The operand of the `sizeof' operator shall
> > > not
> > > contain any expression which has potential side effects".
> > >=20
> > > Define service B.UNEVALEFF as an extension of Rule 13.6 to
> > > check for unevalued side effects also for typeof and alignof
> > > operators.
> > >=20
> > > Update ECLAIR configuration to deviate uses of BUILD_BUG_ON and
> > > alternative_v?call[0-9] for both Rule 13.6 and B.UNEVALEFF.
> > >=20
> > > Add service B.UNEVALEFF to the accepted.ecl guidelines to check
> > > "violations" in the weekly analysis.
> > >=20
> > > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >=20
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> Hi Oleksii,
Hi Stefano,

>=20
> I am asking for a release-ack on this rule: it widens the checks done
> by
> ECLAIR but only for non-blocking rules (a rule not causing a gitlab-
> ci
> failure). Hence, there should be no effect on gitlab-ci.
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

