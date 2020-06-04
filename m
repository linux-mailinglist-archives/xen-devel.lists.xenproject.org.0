Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFC71EE3C9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgoW0-0000CO-Ci; Thu, 04 Jun 2020 11:58:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EphU=7R=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jgoVz-0000CJ-I6
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 11:58:31 +0000
X-Inumbo-ID: b51ed1ae-a65a-11ea-9947-bc764e2007e4
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b51ed1ae-a65a-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 11:58:30 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r7so5807854wro.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 04:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=cNAuUPcCaciSyOFWPd6BJu6y9TZPieUoikaUPOLBltY=;
 b=G3BA3qKwpoQrQT2givVUUQrCkQcWl/0RaYNR80VftP/VvvqG35TFRKTePRdezRdUxt
 gM+FxZDxmZQ4L3pQei9A/RPLwtS+D09NvYskmrnU/WmS77fTiloTu67SsGqNCzaXcCCs
 DnnWqKoN245/8s4gTCwWaq4P6DBRU2/nqLFLNSU9DaemmnKj76uyegYkEesn8Qk4/bau
 AyjKr376Lpv1ukwYOtZZ1IqxacUmW1/rtLWuOdojc8I9zLpj8JseTSsLSom2HIxs26Ln
 sNbQjtGvTK6X065WQBNjY8jKqW/U/5ZxAYahUVW7x0IbjKsHB7nXhsc8UXtyq+YqmL50
 qWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=cNAuUPcCaciSyOFWPd6BJu6y9TZPieUoikaUPOLBltY=;
 b=CaBY7ltRR6SrV364ItdCgExiVS6XpiOQKBEWl6dV62ly1Q43Hch6vSt2FZ0Rs9POoV
 A9EDnMzQ+ebg0y2HHyybQr1/bRRQuwRodz1s2EzlPPRIDXOzS+AcOX1Jk14VrhRd+gNi
 +I/gxVZmmY8oOJER8uWvmpltqhLBul/BkFdqOwlx8j+BaInTZgeZG0gtWYIIMsXMt00E
 7pk1O8pKaCo4ZWQw1O7FelwD5/uYBCyvkdHHePUY6rLwHCATKDYlI4M4knRY7MHYpT0y
 K1PtW4kPDneCvYzpIcH9WFJqae/6Y/k5fzY0iNSsLaU8gY84yObxpngS1KOQYqekQBp0
 hwuQ==
X-Gm-Message-State: AOAM530LKyHi/ZetiUye37tWs9TBr+CQ6kcAgv92DpX8MBoqj48w9zvO
 /RoNp0UeZBsFg5FEuZgPFnk=
X-Google-Smtp-Source: ABdhPJx3pyZ+2yfqfX6IwOd6p299idt+NCIYMiybC/FarcClMxnVstqQeNZO0xPSEy0qDjDU492XwA==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr4180792wrc.331.1591271909989; 
 Thu, 04 Jun 2020 04:58:29 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id s7sm7958628wrr.60.2020.06.04.04.58.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 04:58:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <1591224108-564-1-git-send-email-igor.druzhinin@citrix.com>
 <006401d63a44$a27349e0$e759dda0$@xen.org>
 <4d1da8eb-a06e-c97a-09a0-e84070dc5ec8@suse.com>
 <000f01d63a5d$fe3787f0$faa697d0$@xen.org>
 <bc69e2a7-4c0d-5e77-db37-15f5525b9474@suse.com>
In-Reply-To: <bc69e2a7-4c0d-5e77-db37-15f5525b9474@suse.com>
Subject: RE: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc NPT
 faults immediately
Date: Thu, 4 Jun 2020 12:58:27 +0100
Message-ID: <001401d63a67$763f9810$62bec830$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKnLWBT9mNjQEOL+u7d2oiXq95SHgJRYkBUAnFt9OEB/ZZVsALqGHDzptkfTAA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 04 June 2020 12:47
> To: paul@xen.org
> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; =
xen-devel@lists.xenproject.org;
> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; =
george.dunlap@citrix.com
> Subject: Re: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc =
NPT faults immediately
>=20
> On 04.06.2020 12:50, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 04 June 2020 11:34
> >>
> >> On 04.06.2020 09:49, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> >>>> Sent: 03 June 2020 23:42
> >>>> To: xen-devel@lists.xenproject.org
> >>>> Cc: jbeulich@suse.com; andrew.cooper3@citrix.com; wl@xen.org; =
roger.pau@citrix.com;
> >>>> george.dunlap@citrix.com; paul@xen.org; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> >>>> Subject: [PATCH for-4.14 v3] x86/svm: do not try to handle recalc =
NPT faults immediately
> >>>>
> >>>> A recalculation NPT fault doesn't always require additional =
handling
> >>>> in hvm_hap_nested_page_fault(), moreover in general case if there =
is no
> >>>> explicit handling done there - the fault is wrongly considered =
fatal.
> >>>>
> >>>> This covers a specific case of migration with vGPU assigned which
> >>>> uses direct MMIO mappings made by XEN_DOMCTL_memory_mapping =
hypercall:
> >>>> at a moment log-dirty is enabled globally, recalculation is =
requested
> >>>> for the whole guest memory including those mapped MMIO regions
> >>>
> >>> I still think it is odd to put this in the commit comment since, =
as I
> >>> said before, Xen ensures that this situation cannot happen at
> >>> the moment.
> >>
> >> Aiui Igor had replaced reference to passed-through devices by =
reference
> >> to mere handing of an MMIO range to a guest. Are you saying we =
suppress
> >> log-dirty enabling in this case as well? I didn't think we do:
> >
> > No, but the comment says "migration with vGPU *assigned*" (my =
emphasis), which surely means
> has_arch_pdevs() will be true.
> >
> >>
> >>     if ( has_arch_pdevs(d) && log_global )
> >>     {
> >>         /*
> >>          * Refuse to turn on global log-dirty mode
> >>          * if the domain is sharing the P2M with the IOMMU.
> >>          */
> >>         return -EINVAL;
> >>     }
> >>
> >> Seeing this code I wonder about the non-sharing case: If what the
> >> comment says was true, the condition would need to change, but I
> >> think it's the comment which is wrong, and we don't want global
> >> log-dirty as long as an IOMMU is in use at all for a domain.
> >
> > I think is the comment that is correct, not the condition. It is
> > only when using shared EPT that enabling logdirty is clearly an
> > unsafe thing to do. Using sync-ed IOMMU mappings should be ok.
>=20
> Even with sync-ed IOMMU mappings dirtying happening by I/O won't be
> noticed, and hence the purpose of global log-dirty is undermined.

It is, but there are point solutions in some devices and, if not in the =
device, in the emulator managing the device. This is why migration with =
assigned h/w is currently feasible even without IOMMU faulting.

  Paul

>=20
> Jan


