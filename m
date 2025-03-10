Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38583A592C3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 12:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906439.1313884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trbLL-00059a-US; Mon, 10 Mar 2025 11:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906439.1313884; Mon, 10 Mar 2025 11:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trbLL-000588-Rl; Mon, 10 Mar 2025 11:30:47 +0000
Received: by outflank-mailman (input) for mailman id 906439;
 Mon, 10 Mar 2025 11:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVaD=V5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1trbLJ-000582-SV
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 11:30:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ac5e3b9-fda3-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 12:30:44 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5e033c2f106so4459888a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 04:30:44 -0700 (PDT)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2817467f4sm355041266b.172.2025.03.10.04.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 04:30:43 -0700 (PDT)
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
X-Inumbo-ID: 1ac5e3b9-fda3-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741606244; x=1742211044; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OQxnETLuidWx1OD1p8lJ/SqXzDhcjHPLsYZrwDUKfw=;
        b=ZsoP0mzvv0s8yI1X+vE3L+cWdhuQ6DYZJ3gjyB9qbLb2B0UB0Yt4FITKdxKZbX4kw1
         AskXiOxVs0V2Xr5NXIpBQszTK8f4uZHjXoSyhXXWEAXJqtJRJZHXkB3RvuEmtx5+zrkT
         wOnlY3VhAgjLoNdMNyrIM+IMp1ZGO5s1cmpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741606244; x=1742211044;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2OQxnETLuidWx1OD1p8lJ/SqXzDhcjHPLsYZrwDUKfw=;
        b=mO/XB1FkEXJaWcpKAYnQffKjm/kp0qMYOFnZL95goV2GgJvHtxZuMM39liwg8ijLJJ
         SK8hTgVim9qhf+HdjoexbCTAaPhcdSQDMgZr8CPgO54rn7tJT2gLQwBlgegqAtQqqmhM
         dT4RERdkskQSWqsWmpRo8+DODtdUdYjwaBDl+pFqU99ljXVpGBxoi57Ep0jypVcau/lW
         1JunMUVzgSrfhWDeqS8Q2bCR+XcPHg0ik+mOYOM3itWXltUBpXle6eT85hASAZKw3u+U
         /GO+r49bASlfom3/1qEsg4xUzAzbVidCD2bDHMXRvcwqmXvJhSIElSg15hYh+9/My8sV
         h4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6XHHieUeWvPHdtdkyW6ldZyewWAMwUFCemfdehTfkoiCOxV0baWhMFc8rOvvS/Nx3FSjocXxnte8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCu2Cnm3qO3FEczGgis2A1WL5Xxvzk2oow/HItr63us4BWLv8J
	c2TvC7l1gFiQlR9xezBaoZq/31g3GcTjWQbdQCRpg9IPQeBYRukkH80ehUp0ols=
X-Gm-Gg: ASbGncslRObfcKnjJaTdPtqndBOBz/pdfcpZkG4EcBZyitz2J24m+TAzFQVDmEf3IcC
	9m7CVE9nGJVMRqAUdJuQdTlpLZW5rfxozZ0ryyDxt0Mkv6TJ4Jx1q2k0cEwuirX/UpsdGEi9VX0
	rUw8s3gtXSi9yEQZhMEnQ5o27xEBFhARDmgrHRN+9a+/JgPfJFMmoNjvTto8D+C+qGk1xZ3Z62Q
	50mti4C4UNuqIuc/8kF41/f3Ob9oshzA9x/YCs3/G+6am9+bl/HrEUKdGLXGcn35QqfR/Sn+w+m
	88Ewh1h9/opvCAy6z2UHMCRBTEkv7fV3DMGbSyzx/Q8kPh9/7HA=
X-Google-Smtp-Source: AGHT+IGm99IJEtpbVJ9szZRAWJ9GAOJC0pfNlzjFraw6IUEuI+T2ge6Vek7i7ftUDnUWPBG7ULNo7A==
X-Received: by 2002:a05:6402:40ce:b0:5dc:9589:9f64 with SMTP id 4fb4d7f45d1cf-5e5e22be6abmr41283394a12.13.1741606243503;
        Mon, 10 Mar 2025 04:30:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Mar 2025 11:30:38 +0000
Message-Id: <D8CJVWUM5KCZ.3PFRO6295J7NN@cloud.com>
Subject: Re: [PATCH v3 0/2] tools/hvmloader: Decouple APIC IDs from vCPU IDs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250204173120.56598-1-alejandro.vallejo@cloud.com>
 <c72e7407-4b2c-460d-a425-a8c056a23a26@suse.com>
In-Reply-To: <c72e7407-4b2c-460d-a425-a8c056a23a26@suse.com>

On Mon Mar 10, 2025 at 8:33 AM GMT, Jan Beulich wrote:
> On 04.02.2025 18:31, Alejandro Vallejo wrote:
> > v2->v3:
> >   * Moved "extern uint32_t *cpu_to_apicid;" to patch1
> >=20
> > v2: https://lore.kernel.org/xen-devel/20250204144542.7399-1-alejandro.v=
allejo@cloud.com/T/#t
> > v1->v2:
> >   * Dropped patch to skip writing the MP Tables if apicid >=3D 255
> >=20
> > v1: https://lore.kernel.org/xen-devel/20250128163342.1491-1-alejandro.v=
allejo@cloud.com/
> > source series: https://lore.kernel.org/xen-devel/20241021154600.11745-5=
-alejandro.vallejo@cloud.com/
> >=20
> > The hypervisor, hvmloader and the toolstack currently engage in a share=
d
> > assumption that for every vCPU apicid =3D=3D 2 * vcpuid. This series re=
moves such
> > assumption from hvmloader, by making it read the APIC ID of each vCPU a=
nd
> > storing it for later use.
> >=20
> > Alejandro Vallejo (2):
> >   tools/hvmloader: Retrieve APIC IDs from the APs themselves
> >   tools/hvmloader: Replace LAPIC_ID() with cpu_to_apicid[]
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Cheers!

Alejandro

