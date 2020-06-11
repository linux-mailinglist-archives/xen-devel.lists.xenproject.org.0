Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91CC1F6776
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 14:08:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLzy-0001nH-Gp; Thu, 11 Jun 2020 12:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPau=7Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjLzx-0001nC-QL
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 12:07:57 +0000
X-Inumbo-ID: 2f649fa8-abdc-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f649fa8-abdc-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 12:07:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id r9so4750629wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=SQjfCLhpn1aUhJIKbYJH4jjv4xfDX96+6/uKPZYtr+o=;
 b=sAwGtmfq85dRn88LA//XkcFUWnRvB/6KSXq2BHr1bQa6dj/RETp6lJtKWsSP+J5U2t
 TEenVL4nt8npCpzDwYBAdVL2hGGjAvkiFz0zuFtNaELEIsnpH4i9PiPl2fSHzzVw17xv
 J8OUNZFKoeXrYdIuZ2X409oZ4ieMYRwPPRKvpsnvxU/zwnjqPvIKiDcBpP6zrddJqjk2
 j5EvC03XyL29sTQiNExsjD5DnlJ0cysFLj+jpJ4umQYNosYvUVazLoKUgcwZhf5ezYkZ
 HdlRo7MpDobI1XTVlRiLDe8tyAnD1nwfXEs9B0LIQURP1MHj1ukco7JiqioPwHlVLbOy
 vdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=SQjfCLhpn1aUhJIKbYJH4jjv4xfDX96+6/uKPZYtr+o=;
 b=Q8SbaL1wso5yQvnb+/FthndjK0lnXgikXUtdJpIoIv+SN/9Kq2ww2pzxdP70lMvjlA
 8BKbffVVwdTHR4Dr97rbQMTfkQNo1TA+Ryz9kQFVkApV2it+BzkST6yIu6DRIfBH9dmi
 3EgcPLsqK3kr9D9JzxtMKT4o9m1F5c/na67rYhZ5X0cePbEc6cmLajjlO3rCsGfn4Q3t
 QY4sMwi4OILLddgAtmS6jOAb5YIMYgXmxSKOO3U+yhQHIWQii4L3J4zafxzuZ/uN6g64
 gBJEF9QVK5alAiGOY6MpRaLR+831deQf5XE0mzAQ/JRmmVB9dnZpM545vcEVaW6RRok/
 wFqg==
X-Gm-Message-State: AOAM530f1rYpqXhbNaIzfzBd+xeu7sDeMh5McLcb4KgqGp2H3E4XdJ0y
 QEHvmfraNyOtAWhD/uST1XM=
X-Google-Smtp-Source: ABdhPJwXLXJ1OV07e/4hbQ1MSCcH+zpoui0yVnQ3aKm4JrukvxzwuI2aJkl5xHTJ5TuNZFDspVglMw==
X-Received: by 2002:a1c:6244:: with SMTP id w65mr7857843wmb.82.1591877276115; 
 Thu, 11 Jun 2020 05:07:56 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id q1sm3751244wmc.15.2020.06.11.05.07.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 05:07:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Jason Andryuk'" <jandryuk@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20200611035518.379297-1-jandryuk@gmail.com>
 <e43dbb75-5e37-ee2f-b856-7e86baa1810c@citrix.com>
In-Reply-To: <e43dbb75-5e37-ee2f-b856-7e86baa1810c@citrix.com>
Subject: RE: [PATCH] libacpi: Widen TPM detection
Date: Thu, 11 Jun 2020 13:07:50 +0100
Message-ID: <00e801d63fe8$f0682d10$d1388730$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQD+75p+LtrZduM9I2CZ2QpfMgSpTQIvmX2vqnB1jmA=
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
Cc: 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 11 June 2020 12:52
> To: Jason Andryuk <jandryuk@gmail.com>; xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Jan Beulich <jbeulich@suse.com>;
> Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH] libacpi: Widen TPM detection
> 
> On 11/06/2020 04:55, Jason Andryuk wrote:
> > The hardcoded tpm_signature is too restrictive to detect many TPMs.  For
> > instance, it doesn't accept a QEMU emulated TPM (VID 0x1014 DID 0x0001).
> > Make the TPM detection match that in rombios which accepts a wider
> > range.
> >
> > With this change, the TPM's TCPA ACPI table is generated and the guest
> > OS can automatically load the tpm_tis driver.  It also allows seabios to
> > detect and use the TPM.  However, seabios skips some TPM initialization
> > when running under Xen, so it will not populate any PCRs unless modified
> > to run the initialization under Xen.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This looks like it wants backporting, so CC'ing Paul for a 4.14 release ack.

Agreed.

Release-acked-by: Paul Durrant <paul@xen.org>


