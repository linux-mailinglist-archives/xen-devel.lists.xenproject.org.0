Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321719968D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 14:30:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFyg-0004gH-Iq; Tue, 31 Mar 2020 12:26:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Z5r=5Q=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jJFyf-0004gC-1N
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 12:26:45 +0000
X-Inumbo-ID: e189804c-734a-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e189804c-734a-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 12:26:44 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id o1so6632996edv.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2020 05:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=4tvxdJW2PKpiQdh7UFOZIDyXgFhChYNQG+MqeVEfk/Y=;
 b=iP4hmPYkdD+/FgHTf/3W1n0YVcZCAL15ZZlxfdFEUpATfOKkSP5XAIEtNcN8GEzW5e
 I3H0d/evfq1zGp9MRcy70/g+ISpC0bOVrhv+vcurkqlfabiyVt7zGQtUKh8+uRx/AE+4
 szsYzWpVTCgcebUZNrFwVr5IOk/bIl8m9p4bMTpbnt2xOnYhxrk6WVb5BELaJQdyTCz7
 O5/kYnwIGTmyFceGL6nVZODCxhdzTC2IR30TVrfH/HviCzn42Pz1rj1G5VGwkLcZYHhj
 BOQXISQPA0Ftggk1BCbZCtcAMjBSxqAONBuOJoD8uvNNnou8kmp7SRwxIFx3vxYpE+Ml
 9rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=4tvxdJW2PKpiQdh7UFOZIDyXgFhChYNQG+MqeVEfk/Y=;
 b=Qq0fFyn/JZvmvFwfg+6fZCoiJ+N5SFsNOWh0Ac+/EWJtLzByB/pTYcRbNDczGNCS8N
 g98qcDE7hPA6i4FamjhZ1v3vnPfS0jOs5tXlsX1tvX1Ld/lgdgtiQI16Dt0oCebKhu/s
 nRJ9syUHR9wfsT0uWfqRGN9CBT6DcFMEKQZq/u3oyAtg4vcwjiyq1fSfQpv1hT72sRqz
 2vf6nEQec/29Mq149XC/if4Ima7sPPXP+E5FZFKf6ojA+qL/C4gscaqM4aGOETyyqVvv
 owi8239XGuMH1Is/KGBgCTp+NV7auRRM70/JAwxrgMstcGpeGJfbdVCo3MtlUM7xKAq6
 aL2A==
X-Gm-Message-State: ANhLgQ0GCGVCCsShcibdARd1OxOUH720Ib0MdG6hCRnzrbXVG6yZU8fQ
 83NCMgFkXwqWNhn7U5ycq0o=
X-Google-Smtp-Source: ADFU+vt7aYeX29i/56xtY2VuTdTRfG7nyO1HIZx+dtoefTSZ8K9CxRUJGssxIsqip549lMzU+mhEtg==
X-Received: by 2002:a17:906:1e87:: with SMTP id
 e7mr15401767ejj.320.1585657603345; 
 Tue, 31 Mar 2020 05:26:43 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id l91sm2253658ede.64.2020.03.31.05.26.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 05:26:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <a036b093-0f0d-6998-c6ec-4463d53b337f@suse.com>
 <f6c5299a-e84e-dd81-9143-0c7bda4eb782@citrix.com>
 <9dbbd801-6972-ddf4-0ea3-62422987426a@suse.com>
In-Reply-To: <9dbbd801-6972-ddf4-0ea3-62422987426a@suse.com>
Subject: =?utf-8?Q?RE:_Ping=C2=B2:_=5BPATCH=5D_x86/HVM:_fix_?=
 =?utf-8?Q?AMD_ECS_handling_for_Fam_10?=
Date: Tue, 31 Mar 2020 13:26:41 +0100
Message-ID: <006001d60757$a2b6da90$e8248fb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHOb7FXGvUqGA6Lzs35EJcgu2cWxAIUbgquAcCvBkGoUyZo4A==
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
> Sent: 31 March 2020 13:16
> To: Paul Durrant <paul@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; =
xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>;
> Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Ping=C2=B2: [PATCH] x86/HVM: fix AMD ECS handling for Fam 10
>=20
> On 16.03.2020 14:41, Andrew Cooper wrote:
> > On 16/03/2020 11:00, Jan Beulich wrote:
> >> The involved comparison was, very likely inadvertently, converted =
from
> >>> =3D to > when making changes unrelated to the actual family range.
> >>
> >> Fixes: 9841eb71ea87 ("x86/cpuid: Drop a guests cached x86 family =
and model information")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Paul?
>=20

Sorry, missed that. My mail filters appear to have let me down...

> >> --- a/xen/arch/x86/hvm/ioreq.c
> >> +++ b/xen/arch/x86/hvm/ioreq.c
> >> @@ -1284,7 +1284,7 @@ struct hvm_ioreq_server *hvm_select_iore
> >>          if ( CF8_ADDR_HI(cf8) &&
> >>               d->arch.cpuid->x86_vendor =3D=3D X86_VENDOR_AMD &&
> >>               (x86_fam =3D get_cpu_family(
> >> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) > 0x10 =
&&
> >> +                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >=3D =
0x10 &&

LGTM

Reviewed-by: Paul Durrant <paul@xen.org>

> >>               x86_fam < 0x17 )
> >>          {
> >>              uint64_t msr_val;
> >>
> >



