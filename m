Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40215F3E5F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415244.659764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdJk-0001Oi-Cq; Tue, 04 Oct 2022 08:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415244.659764; Tue, 04 Oct 2022 08:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdJk-0001Lr-9S; Tue, 04 Oct 2022 08:30:20 +0000
Received: by outflank-mailman (input) for mailman id 415244;
 Tue, 04 Oct 2022 08:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HeQf=2F=redhat.com=vkuznets@srs-se1.protection.inumbo.net>)
 id 1ofdJh-0001Ll-Nj
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:30:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c575a995-43be-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 10:30:16 +0200 (CEST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-0FQCOVoKOxWHnmH3pVS-5Q-1; Tue, 04 Oct 2022 04:30:13 -0400
Received: by mail-ej1-f72.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so4439058ejb.19
 for <xen-devel@lists.xenproject.org>; Tue, 04 Oct 2022 01:30:13 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 by30-20020a0564021b1e00b004590d4e35cdsm1198745edb.54.2022.10.04.01.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 01:30:11 -0700 (PDT)
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
X-Inumbo-ID: c575a995-43be-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664872215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mx+TIb5N4ENHhgvLtFzyQ3iRnSCgSSPj/Ny8vTXS3Nk=;
	b=KP2JLvGNM9DEp57l3qOrg3MuFaXe8J2+k8hOgOvtpa3mj+c3YmC41r33zDJf8btV0Kh7+S
	PvbfIoQAsltkhwnPuI5DA0gLOcclZKPtGVR12sc3dCJyjPQzyKh6KyqHtMVhC7FnnJX8mn
	yYWUhbWr0ER3bDWXwwSS5J5u9uu3Hu8=
X-MC-Unique: 0FQCOVoKOxWHnmH3pVS-5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kChJ5YXyR55NqzsspcQL6vhugqTTUyXdwpS+PG+Hins=;
        b=FyLduXF3wltYnWa3pY9qIM+6F8fRYXGbZmW92BahoK4eUCrUQWLFrstQVZ3bHD3ngp
         hcJ4BGMJHsuQwJC7wmIPpvYbYfhajwPJcGIkmZXngKllkbOFsA4bv9ClSWX5d3vfgwYv
         tUlqseJV1dA2qPBaJ4ENA9wjw3vF06EiSK/B4HKnayg3l4aj/cNgu6Rp0xHpG9+h88YM
         ul1B/eeLwH8KJKnv4FIfNsjssFfQR2o95F/8MarG8HfPd4JI60fSbuVOLtg2hPifTqlL
         DsG54rgklDndCOsVXbnyg02M2/VO8PJOHhRI9zhfMGvgJnJ7gHSSskjKB6BMfTKlW0qu
         8rFA==
X-Gm-Message-State: ACrzQf2/D9+Db1NcQUuIKlWGkXipif5lrRuvuXfiUaTOT2vkFjSBQWd4
	HPzd3qFu73nUJK9c89Bjvw2wkVmqnG8f2FQdz7s4Y11/OQbq60Mr8I69hpqFWpF3elvGcCeJ5WM
	7RTV/MBz0QBk+Lp0T4jDq+wJeFxo=
X-Received: by 2002:a17:907:1626:b0:782:e490:4f4 with SMTP id hb38-20020a170907162600b00782e49004f4mr18347585ejc.464.1664872212799;
        Tue, 04 Oct 2022 01:30:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4V1XegvfHQqtOdwuF9hkqqgOAv0Ct2ylqgG/E0UdTe0kkF9v3n5AapSW1/X/ZGX1Jj9DACkw==
X-Received: by 2002:a17:907:1626:b0:782:e490:4f4 with SMTP id hb38-20020a170907162600b00782e49004f4mr18347564ejc.464.1664872212563;
        Tue, 04 Oct 2022 01:30:12 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nadav Amit <namit@vmware.com>, Alexander Graf <graf@amazon.com>, Ajay
 Kaher <akaher@vmware.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Srivatsa Bhat
 <srivatsab@vmware.com>, "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>, Vasavi Sirnapalli
 <vsirnapalli@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>, "willy@infradead.org" <willy@infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "acrn-dev@lists.projectacrn.org" <acrn-dev@lists.projectacrn.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2] x86/PCI: Prefer MMIO over PIO on all hypervisor
In-Reply-To: <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
References: <9FEC6622-780D-41E6-B7CA-8D39EDB2C093@vmware.com>
 <87zgf3pfd1.fsf@redhat.com>
 <B64FD502-E794-4E94-A267-D690476C57EE@vmware.com>
 <87tu4l9cfm.fsf@redhat.com>
 <04F550C5-786A-4B8E-9A88-EBFBD8872F16@vmware.com>
Date: Tue, 04 Oct 2022 10:30:10 +0200
Message-ID: <87lepw9ejx.fsf@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Nadav Amit <namit@vmware.com> writes:

> On Oct 3, 2022, at 8:03 AM, Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Not my but rather PCI maintainer's call but IMHO dropping 'const' is
>> better, introducing a new global var is our 'last resort' and should be
>> avoided whenever possible. Alternatively, you can add a
>> raw_pci_ext_ops_preferred() function checking somethin within 'struct
>> hypervisor_x86' but I'm unsure if it's better.
>>=20
>> Also, please check Alex' question/suggestion.
>
> Here is my take (and Ajay knows probably more than me):
>
> Looking briefly on MCFG, I do not see a clean way of using the ACPI table=
.
> The two options are either to use a reserved field (which who knows, migh=
t
> be used one day) or some OEM ID. I am also not familiar with
> PCI_COMMAND.MEMORY=3D0, so Ajay can hopefully give some answer about that=
.
>
> Anyhow, I understand (although not relate) to the objection for a new glo=
bal
> variable. How about explicitly calling this hardware bug a =E2=80=9Cbug=
=E2=80=9D and using
> the proper infrastructure? Calling it explicitly a bug may even push whoe=
ver
> can to resolve it.
>
> IOW, how about doing something along the lines of (not tested):
>

Works for me. Going forward, the intention shoud be to also clear the
bug on other x86 hypervisors, e.g. we test modern Hyper-V versions and
if MMIO works well we clear it, we test modern QEMU/KVM setups and if
MMIO works introduce a feature bit somewhere and also clear the bug in
the guest when the bit is set.

--=20
Vitaly


