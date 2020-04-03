Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E419DAE4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOsJ-0007HQ-NM; Fri, 03 Apr 2020 16:08:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DmfO=5T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jKOsI-0007HL-E0
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:08:54 +0000
X-Inumbo-ID: 69d09cca-75c5-11ea-83d8-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d09cca-75c5-11ea-83d8-bc764e2007e4;
 Fri, 03 Apr 2020 16:08:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m17so9128806wrw.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 09:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0y41U1ZJATzuc4am2cSQTNFJJtdkrB4HlZZXeNT5NSE=;
 b=s7ARfL4I1IXzgYPP59bpz8+8apUkk0r2vZT3+CF7nDTkXSIQizEAZV7V5Rq1ZiDXmg
 sxiQ0cNEYmhVcaXSzS56foZ/p5kuOmcvTQofiu5UHUJx8SxlTIBZUVl6nm9sxp7i2KBd
 qv+AtXUXJwZsIkuhLS58CRSIPiNxmIAIhJrWNJioCffHfmF094jXFcOYHtc7vCWGzSEh
 AZklz5trKB+RcocE79T68YG+7TVesQyQ6C+CSu/TpYka804wiOKFQIzPqrTDamk0GIOQ
 11HsoKrrV8I/d5wjGGbC3NAEYJUtGXd4zjhxfxlEgxwihi3Xt4MIWW2S31brg8AtHLsB
 SnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0y41U1ZJATzuc4am2cSQTNFJJtdkrB4HlZZXeNT5NSE=;
 b=RVyRAHAz4Xrl5+t7g3dA+p9H6a8iveNDzMZ57txtwDi1NeIhPDJiL/PiLUuNNvuiyz
 e/RTAdkKjZdFs77QrWTIRRkNu083b9UD0rtKFAKfZdr7kCtzBT0AzxWjBmRu1PDHfVhY
 7ivs0XnlaCFWG8s2UvamsHSDW5fXaRdRCDedOTK6/qmY2RS1NUB3cHxAGQxBgjKpsHQ5
 lwsC1sE5AC0AtxS6W9RslO6bHV1J5hMZ9ipww5ZY37R61gkEkxgHW86PkKAlKyP7aBhX
 khCZrMCm7AIbcx31c0hfcxspOGYnl6Mb/tgica85Fr+R5UGjK9I4DR2+as242HN7u6gM
 hlWQ==
X-Gm-Message-State: AGi0PuZJwZvkaWOXT/UffuFxVu7Xin2AllhLPpIoTOR8t4K599c89QxO
 qAzkkXgX36a0GEItDZCNQqE=
X-Google-Smtp-Source: APiQypLUsRj/fOnC+mRYii/6OIpy2RsRbSx6wsMEBLAWiDXF3/8RQt2uuqs7a2oQg4hiE/ELRrWeZw==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr7240484wro.323.1585930132865; 
 Fri, 03 Apr 2020 09:08:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id z203sm12131623wmg.12.2020.04.03.09.08.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 09:08:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-4-paul@xen.org>
 <b94676ab-371b-bb69-0d07-dd38fe22ceba@suse.com>
 <001e01d609cb$64913fa0$2db3bee0$@xen.org>
 <f04d7e53-b1d9-a304-a7ac-64238836eca5@suse.com>
In-Reply-To: <f04d7e53-b1d9-a304-a7ac-64238836eca5@suse.com>
Subject: RE: [PATCH 3/5] tools/misc: add xen-ctx to present domain context
Date: Fri, 3 Apr 2020 17:08:50 +0100
Message-ID: <002301d609d2$2ae8a480$80b9ed80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AIR6g5qAoK3rZoCJSYWbwIOuLj5qF8YKXA=
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
Cc: xen-devel@lists.xenproject.org, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 03 April 2020 16:30
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH 3/5] tools/misc: add xen-ctx to present domain =
context
>=20
> On 03.04.2020 17:20, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 30 March 2020 11:54
> >> To: Paul Durrant <paul@xen.org>
> >> Cc: xen-devel@lists.xenproject.org; Ian Jackson =
<ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> >> Subject: Re: [PATCH 3/5] tools/misc: add xen-ctx to present domain =
context
> >>
> >> On 27.03.2020 19:50, Paul Durrant wrote:
> >>> This tools is analogous to 'xen-hvmctx' which presents HVM =
context.
> >>> Subsequent patches will add 'dump' functions when new records are
> >>> introduced.
> >>>
> >>> Signed-off-by: Paul Durrant <paul@xen.org>
> >>> ---
> >>> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> >>> Cc: Wei Liu <wl@xen.org>
> >>> ---
> >>>  .gitignore           |   1 +
> >>>  tools/misc/Makefile  |   4 ++
> >>>  tools/misc/xen-ctx.c | 144 =
+++++++++++++++++++++++++++++++++++++++++++
> >>
> >> Is xen-ctx a good choice of a name, considering we already have not
> >> only xen-hvmctx, but also xenctx? If the new functionality isn't a
> >> good fit for either, perhaps its name would better reflect its
> >> connection to save/restore records? xen-sr-dump looks pretty clumsy
> >> to me, but still seems better than a name easily mixed up with
> >> others.
> >
> > How about xen-domctx?
>=20
> Hmm, maybe. Seeing this is about PV pieces, xen-pvctx might also be
> an option.

Yes, that would work but it also implies it might only be valid for PV =
domains. I also prefer 'domctx' since it better matches the name I chose =
for the framework.

  Paul


