Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B85B32544
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 01:03:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090606.1447751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upanQ-0007SK-UY; Fri, 22 Aug 2025 23:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090606.1447751; Fri, 22 Aug 2025 23:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upanQ-0007On-R0; Fri, 22 Aug 2025 23:03:44 +0000
Received: by outflank-mailman (input) for mailman id 1090606;
 Fri, 22 Aug 2025 23:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b3U+=3C=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1upanP-0007Oe-8z
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 23:03:43 +0000
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d7112b0-7fac-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 01:03:40 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1755903813534238.83015038587212;
 Fri, 22 Aug 2025 16:03:33 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-435de818a74so1442093b6e.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Aug 2025 16:03:33 -0700 (PDT)
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
X-Inumbo-ID: 3d7112b0-7fac-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1755903815; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YJIn2fKfHpW+zjVrIYX3Hb6yQoAUWbK6klmC+W5w1K+PIWiAlFQLOFa63g1IM9N5yEaQJlU6GF/cvBaKdY//4dqMNvAx2AO8iLUYGVmwP/dsqTOxGCygfs+FMJ4cHpQY35R7sck4kpLPQvbDsQmM07OlOqlMfqyFQEd5NvPu2q4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755903815; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JOk0Em5lTEW68Sb47GPCJPnPCmD+WNvM3mJaDwujsHE=; 
	b=Vsza1Rgkay7On/xJ+HPeKrc/vgTxN+KUpEA6YyZNjEkgsIN/5Qnggu/tisAvqAUIAGIg+9OYEcw5sd+SvpnYiwvEB9OvIYR6Y2iZAC/uh4BZtlGfsW0ZPMtMRm7JOLWmjESsLPPIsGvlN21cRY+ERIRCl0YciFiPHfrVAfuuDQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755903815;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JOk0Em5lTEW68Sb47GPCJPnPCmD+WNvM3mJaDwujsHE=;
	b=WCyCj00+7QLYIZTLLSCEcDu8MVBaETkvTPMShwoHwigm+MCS8KMIdq9V9SqNuQod
	i+s47rII+AYaHoW+gCG/U/CQwb5uFY4ogWdpre5cSX7BHG2s79QQ5u75Ms4ZcMvHX7d
	XmecRnfsRVDBNZseH7AIUg3LOsVKBP00kicIgv00=
X-Forwarded-Encrypted: i=1; AJvYcCWqhlAjusxocLRqweCwSncg2kMLE8/76/VZv8rpKQLW9KsraXkM0qzCAm9S2unVMaxctz6TcQq5yEQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzU3VUXnNctqH73E4AQOnwWE88WJxhSBhdnIetDNmZyOjYnPNrz
	9WSaZYZiYY35ADfJhYJnNnsTJuJqoWX8EbX0KL5dG2VatyQ2hS7fN9veHuGTea+f7jotY019CWM
	kMgQkCxwEAgaZIyo+UGUGt2vtkRAMUvs=
X-Google-Smtp-Source: AGHT+IEuKjBzWDiuU0Ds+F+Bz+18A+eirMdHei2WIbGpyp9ffdJkIF9y6/6bdoL8T1uEl/QPUUPE9XGqsOBlQNd8xgU=
X-Received: by 2002:a05:6808:1446:b0:437:75ea:6c65 with SMTP id
 5614622812f47-4378527bb90mr2207071b6e.40.1755903812751; Fri, 22 Aug 2025
 16:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753953832.git.w1benny@gmail.com> <2fc138bf8f1100b6347b965e16691b9d6e3272fe.1753953832.git.w1benny@gmail.com>
 <dcbd4381-50e0-4d20-b627-7719bf31fe20@suse.com>
In-Reply-To: <dcbd4381-50e0-4d20-b627-7719bf31fe20@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 22 Aug 2025 19:02:56 -0400
X-Gmail-Original-Message-ID: <CABfawh=pkasx4XVg8jHunHVeUQvSovHg0iT+JQWhJRDjnEyMnQ@mail.gmail.com>
X-Gm-Features: Ac12FXyhivlMO_jqstzAn4wlSpyvAXSasN22RMt7DpR7l_K49aTnwEsWLYLXxwE
Message-ID: <CABfawh=pkasx4XVg8jHunHVeUQvSovHg0iT+JQWhJRDjnEyMnQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/6] x86/altp2m: Wrap altp2m-specific code in #ifdef CONFIG_ALTP2M
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:33=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 31.07.2025 11:27, Petr Bene=C5=A1 wrote:
> > From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >
> > This change consistently guards all altp2m-related functionality
> > behind #ifdef CONFIG_ALTP2M, so that code and data structures related
> > to alternate p2m views are only included when the feature is enabled.
> >
> > Apart from that:
> > - hvmemul_vmfunc() returns X86EMUL_UNHANDLEABLE when altp2m is disabled=
.
> > - do_altp2m_op() returns EOPNOTSUPP when altp2m is disabled.
> > - struct hvm_vcpu, arch_domain, and hvm_function_table only define altp=
2m
> >   fields when the feature is enabled.
> > - Moved several declarations under #ifdef CONFIG_ALTP2M in p2m.h to avo=
id
> >   polluting builds that don't require the feature.
> >
> > Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

For mem_access bits:
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

