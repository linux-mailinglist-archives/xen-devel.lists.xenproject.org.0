Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30353827218
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 16:06:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663583.1033579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrCI-0000NN-Aw; Mon, 08 Jan 2024 15:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663583.1033579; Mon, 08 Jan 2024 15:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMrCI-0000KU-8L; Mon, 08 Jan 2024 15:05:50 +0000
Received: by outflank-mailman (input) for mailman id 663583;
 Mon, 08 Jan 2024 15:05:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=07o8=IS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rMrCG-0000KM-Ey
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 15:05:48 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 674faef4-ae37-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 16:05:47 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5537dd673e5so1610075a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 07:05:47 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 w5-20020aa7dcc5000000b0055306f10c28sm4341760edu.28.2024.01.08.07.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 07:05:46 -0800 (PST)
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
X-Inumbo-ID: 674faef4-ae37-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704726347; x=1705331147; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qk9RFZ21+Olzb5wzkJ7XdY/XlzRPL92kkiuTPh0cOmI=;
        b=IG4XqBhvYvupwzouq6HeIJcaaTeDEbFx7x/EasG8swYVsohgq9Lq61QPcguIQH0/cb
         6iU5EaQLLzzlJ33vBu62b4Pzf99QNsdUs+gvLKiroiC12CblaKtL3azv/hvzKHphlCBm
         qngyNcSu/1Oeuy9/syMIWi6QRWuWTTL1aUvRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704726347; x=1705331147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qk9RFZ21+Olzb5wzkJ7XdY/XlzRPL92kkiuTPh0cOmI=;
        b=SMMZJyJmkNq8aRlfBNSSrnjXUzzGBKMkg8h/RqRDKfyh9SHXnJxg0Z49FTyOsPmhYk
         bHdMJy6BOtfTQZA+WOl82bOdb0eEmDJ5P8GPqXAr7G3mNKIEFEx7eibie7M++d9wKVCG
         jx32JDMFj6wP5/4r6OQ/odBxjWHzmla9FtMhKZj/XWMyUq6cSAQj4BlBXX5eZ4PQclAB
         OtFtgfcbihp2kQCPxVCXqFauy2uF1UdrwfDbykboT6vXqfkwdLWulu1LrnW5cy8q563i
         YNH/1kurPYck7W+J/9GGv1KyPS6FvJ850dl45DJWeQ52HH+Vgt0BzL/Unalk0jHViKX5
         RBwQ==
X-Gm-Message-State: AOJu0Yw2lPT9BDbivfEEMO3klBZUt4cdJF8/YTz8nDbwTJjUGTp+Yrwu
	m11y8gdEJdS55Fe137ZBT/v/iKinFsy2Tw==
X-Google-Smtp-Source: AGHT+IFdewhegn+pHAGDjDyvsq5s6si+NpnfbHcwQLvfuUdh7xKYMEmtTmbv6SUDhKkGJs1odQWn0Q==
X-Received: by 2002:a50:9350:0:b0:557:7580:fb2f with SMTP id n16-20020a509350000000b005577580fb2fmr1841401eda.31.1704726347041;
        Mon, 08 Jan 2024 07:05:47 -0800 (PST)
Date: Mon, 8 Jan 2024 16:05:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Message-ID: <ZZwPSZoqyY6g9yhi@macbook>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
 <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <882bd39a-8a29-4f4f-b64f-765c4858b1c8@suse.com>

On Mon, Jan 08, 2024 at 09:55:26AM +0100, Jan Beulich wrote:
> On 06.01.2024 02:08, Stefano Stabellini wrote:
> > On Fri, 5 Jan 2024, Jiqian Chen wrote:
> >> --- a/tools/libs/light/libxl_pci.c
> >> +++ b/tools/libs/light/libxl_pci.c
> >> @@ -1418,6 +1418,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>      unsigned long long start, end, flags, size;
> >>      int irq, i;
> >>      int r;
> >> +    int gsi;
> >>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
> >>      uint32_t domainid = domid;
> >>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> >> @@ -1486,6 +1487,7 @@ static void pci_add_dm_done(libxl__egc *egc,
> >>          goto out_no_irq;
> >>      }
> >>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> >> +        gsi = irq;
> > 
> > A question for Roger and Jan: are we always guaranteed that gsi == irq
> > (also in the PV case)?
> 
> Iirc for IO-APIC based IRQs that's always the case;

I think that's always the case on Linux, because it calls
PHYSDEVOP_map_pirq with index == pirq (see Linux
pci_xen_initial_domain()).  But other OSes could possibly make the
call with pirq == -1 and get a randomly allocated pirq for GSIs.

IOW: I don't think the pirq field in xen_domctl_irq_permission can be
altered like proposed here to switch from passing a pirq to a GSI.  A
new hypercall should be introduced that either is GSI specific, or
contains a type field in order to specify the namespace the field
targets.

Thanks, Roger.

