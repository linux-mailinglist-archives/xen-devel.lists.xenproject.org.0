Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784E1F3830
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 12:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jibcl-0007m8-Mx; Tue, 09 Jun 2020 10:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kazQ=7W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jibck-0007m3-Jc
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 10:36:54 +0000
X-Inumbo-ID: 22379f88-aa3d-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22379f88-aa3d-11ea-bb8b-bc764e2007e4;
 Tue, 09 Jun 2020 10:36:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q19so21784051eja.7
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2020 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=xDrG0IBGL3d1f09YwyXG+nOe4RkWdBkRplunH4cdBYk=;
 b=uDJ/6nH5cIpXGK5BeroZuPvvTZ1ynvw3whpU48hS4YkrMcfHr093yozc/p7n06vUbK
 KVzuqeZHRy++yZJm9njgwUtR6p9vFeg84BjwlgeoPpHAjVoBRpDnITxsLNJrRNPmqz8w
 s4G19J9rygsEqiEXwTxkxQW6cBCSXd7wHbnOyMdsU9v+TWwyJqLGiLGqpVHeW0K1c/qk
 2PfCGHkTGV/jAXxpEggBFGvjSlNRbv6TcFB/BSkaYIvXSXn8Cpx1a9yUmcDnwbYFArIS
 te5lgJHyxdQ/9VQj3mKrnivKCGBrg+APvJs/wRD+9urODPbZjvteIZF7EJSUCsIPNkPj
 Hl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=xDrG0IBGL3d1f09YwyXG+nOe4RkWdBkRplunH4cdBYk=;
 b=IX0N1VFFcD244lqhlFI7Ks3EbJE7m1bgqiTwQ3GIIS9QF51NUM11s2VfxRqWCw57kH
 kk0T4ajEc3No+9ehk0jbeMU/oriiU5rT+3nCjT/TRcvwraW06O45X5GgE7cBRBtNn83j
 4vu52Nl7nigByQuCIFZ/iy6mLyFa2ekLkYZn4Ieyt7tiwh72JWe0D85NP6t6z0PspwnN
 CuF2+5RNRFhtnQtyjMmxTaapvnupVDjmVGyV0TDLlrVIAAQnRNhibUJOITrH6/0h6hU+
 ndlI9PEEaYDtVSL1EJuF2ld+SJ/eKZgrS1Bm4BNeTpJ/LkpcJoyiHmYciG8+H4G0MraJ
 JPRg==
X-Gm-Message-State: AOAM531qlw0PSQE5iGs1k7glhGDpbD0mpAtzAQCl/3ooZCWOEI6Wc/7d
 +dnMZ7wr4KMHYVLY8DirYIE=
X-Google-Smtp-Source: ABdhPJyHbbWaQS4m7C0LHQk17XJzqVW0H2QpBO5GWuDWt3RyaGLuOOUpb9rfsyQwwcS943/xeVDLVw==
X-Received: by 2002:a17:907:9486:: with SMTP id
 dm6mr25817567ejc.248.1591699012841; 
 Tue, 09 Jun 2020 03:36:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id b26sm1200494eju.6.2020.06.09.03.36.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 03:36:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <baa738ce-0398-48df-e94e-dc8b86a35f6c@suse.com>
 <d28d54d1-3548-3eca-b672-2f9ea1b5ceb9@citrix.com>
 <0d16dda5-298d-248c-7b9e-f27d74ca1b7c@suse.com>
In-Reply-To: <0d16dda5-298d-248c-7b9e-f27d74ca1b7c@suse.com>
Subject: RE: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model numbers
Date: Tue, 9 Jun 2020 11:36:50 +0100
Message-ID: <007901d63e49$e3420de0$a9c629a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHNuGDW4G6EWwQ8Lw5IwByx9xcfDQHRd/baAjaUi1CowOJpgA==
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 09 June 2020 11:33
> To: Paul Durrant <paul@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; =
xen-devel@lists.xenproject.org; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH] x86/Intel: insert Ice Lake and Comet Lake model =
numbers
>=20
> On 05.06.2020 19:37, Andrew Cooper wrote:
> > On 05/06/2020 08:51, Jan Beulich wrote:
> >> Both match prior generation processors as far as LBR and C-state =
MSRs
> >> go (SDM rev 072) as well as applicability of the if_pschange_mc =
erratum
> >> (recent spec updates).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> Such changes having been subject to backporting in the past, this
> >> change may want considering for 4.14.
> >> ---
> >> I'm leaving alone spec_ctrl.c, albeit there's a scary looking =
erratum
> >> for Ice Lake indicating that MDS_NO may wrongly be set. But this is
> >> apparently addressed by ucode update, so we may not need to deal =
with
> >> it in software.
> >
> > I've enquired about this.  At a guess, there was another hole found, =
so
> > MDS_NO has been cleared and VERW flushing reinstated.
> >
> > Either way, changes there can wait until we've got confirmation.
> >
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Paul - any thoughts about this one either way for 4.14?
>=20

I don't see any harm in it going in at this stage.

Release-acked-by: Paul Durrant <paul@xen.org>


