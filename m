Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D94941481
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 16:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767890.1178599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnxN-0007Hy-As; Tue, 30 Jul 2024 14:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767890.1178599; Tue, 30 Jul 2024 14:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnxN-0007FQ-7b; Tue, 30 Jul 2024 14:36:05 +0000
Received: by outflank-mailman (input) for mailman id 767890;
 Tue, 30 Jul 2024 14:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTg3=O6=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sYnxM-0006se-0x
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 14:36:04 +0000
Received: from sender3-op-o17.zoho.com (sender3-op-o17.zoho.com
 [136.143.184.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ae3800f-4e81-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 16:36:02 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1722350157300640.2217030234874;
 Tue, 30 Jul 2024 07:35:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-64b417e1511so34461977b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 07:35:57 -0700 (PDT)
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
X-Inumbo-ID: 0ae3800f-4e81-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1722350159; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hfCuvxWjoiiZ59yTIS/+pCEnZVhZFIjM8aPkjTWr1uW8sldNF7KLBAHZDlMeOXnHfmLCZuGoQDwocAr+YEUTZHejpwVUPxbWSKydMk8EVAZftB7/9MWTAcz/3x7mK5KLdN01B5o3aktZE9W4d8SkMSxiDH1vvBICV1FWqAXBf8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722350159; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D1ebpLyx8gR86eeQvtJ6wU+dy9ju+XdkIf9IVMlzmQo=; 
	b=IWQTTMtKgJiM4J0eiFhshBJLWZe0rQNAeiMKhosaib/P8l4ExCJQi9xUWyY7SoJDXUEoP6liB3DxjLCUFqemPS3T3FILMChF9gV5I76nkJewYbfk6lEZ/rz3cRivaXM3jKt3V3vJfMwBDeloZwDf8WtFHllzxpbmDilY7z7gQt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722350159;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=D1ebpLyx8gR86eeQvtJ6wU+dy9ju+XdkIf9IVMlzmQo=;
	b=SSOCsHId9pGL9VADvmBIofwfaPf+ej8y2A72njtlmmMDw9Ij/CHwxZq37KroEccu
	Pnuyi9IhHZPudERwjZ53N3UpdXnWWn5ha4G92J9Jdy2PejmFviiSN9WcJYjGda/expN
	xVe5j+8VhD2nXIMDyr/au6hAdbY3xbdj4w5U9uwc=
X-Gm-Message-State: AOJu0YwBSH/yCRTB+dg0fKqsCjTnFZ0GilmC2JaXINYh13v65177//1D
	7SrHI6Woo+gazohbKE0xYdQtFAdR8hV83z9xXHbKglYFZ3Fi8QV3XWu0z4l0ITFJ//1aSMMSXeG
	ADhxY9dbqnD/qASQQPS8qjr8HL2I=
X-Google-Smtp-Source: AGHT+IHIDQK94uXMQIslV+V0IpD1u6rhrvHxBU2KJjq7fSO/uzmi6beaomz9Nz2PlokD6uPkIgAA5EcTiCicGUDllNE=
X-Received: by 2002:a05:6902:2807:b0:e0b:28ce:6156 with SMTP id
 3f1490d57ef6-e0b5466b3bbmr11505415276.55.1722350156536; Tue, 30 Jul 2024
 07:35:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com> <b0292af6629ad483dd0a437960585cf5aa3a03cd.1722333634.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <b0292af6629ad483dd0a437960585cf5aa3a03cd.1722333634.git.Sergiy_Kibrik@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 30 Jul 2024 10:35:19 -0400
X-Gmail-Original-Message-ID: <CABfawhn_qiPGe75a1nKJYop45zN3uMdN_u7ok8wmwaRFSCGH4Q@mail.gmail.com>
Message-ID: <CABfawhn_qiPGe75a1nKJYop45zN3uMdN_u7ok8wmwaRFSCGH4Q@mail.gmail.com>
Subject: Re: [XEN PATCH v5 02/13] x86/monitor: guard altp2m usage
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 6:18=E2=80=AFAM Sergiy Kibrik <Sergiy_Kibrik@epam.c=
om> wrote:
>
> Explicitly check whether altp2m is on for domain when getting altp2m inde=
x.
> If explicit call to altp2m_active() always returns false, DCE will remove
> call to altp2m_vcpu_idx().
>
> p2m_get_mem_access() expects 0 as altp2m_idx parameter when altp2m not ac=
tive
> or not supported, so 0 is a fallback value then.
>
> The puspose of that is later to be able to disable altp2m support and

"purpose" misspelled here

> exclude its code from the build completely, when not supported by target
> platform (as of now it's supported for VT-d only).

Probably wanted to say "VT-x only" here

>
> Also all other calls to altp2m_vcpu_idx() are guarded by altp2m_active(),=
 so
> this change puts usage of this routine in line with the rest of code.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

With the commit message fixed (probably could be done when applied):
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

