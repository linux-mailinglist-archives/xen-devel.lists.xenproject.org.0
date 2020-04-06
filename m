Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1719F135
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 09:50:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLMWY-00089w-NR; Mon, 06 Apr 2020 07:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=etk8=5W=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jLMWX-00089r-97
 for xen-devel@lists.xen.org; Mon, 06 Apr 2020 07:50:25 +0000
X-Inumbo-ID: 4597a3ea-77db-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4597a3ea-77db-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 07:50:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v1so18026106edq.8
 for <xen-devel@lists.xen.org>; Mon, 06 Apr 2020 00:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=4qcawpa47PB085W508PsWHKMkbC38SCDQTtKqzAFNL8=;
 b=BCSbcKn1M8QpQlXF6aqW0yfFzjAwC8oFGFrGk3I+ZzJU3kmlqc94ijU1we3BNYjbXP
 AYZobo97H18P27hI/e4Gy+Wou9uLdQ+cZro1YMexYPX7/sxZn8N70VnaWHsvPYneajNG
 IH8LyoP7+lD11mqc/+8xvL4mn7nN7TLVxDrYOJyafOxd2pTnXa3NOsLtxM3N9NDC8ZHZ
 MVaNWXXm/t1+9sJD7bZTxOf/Mprf6hKXtEwItDsGB397vsS5l1ygQjDjYo+8lS/nqRmK
 vZ3WGuxDOeoK8mZE1NWEQSp88cdFRiKzGCc/dL2urkh6+7H/tRXWvjI22/euAWpTx9rY
 90ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=4qcawpa47PB085W508PsWHKMkbC38SCDQTtKqzAFNL8=;
 b=LO4Yx4CbdwEo0kd4a153QtM0dQiLovH/Gj24523AQQsD4ufeNb8JbcBevsaaL5h1t4
 A+tIwSSgz9C20B3BURjPIKdp+w7ErjxFIwhauuMGyaPWU0OyhnyspM3pTuaFMTUUnoac
 jXDhKjodhx6iRsMc5BX/CtFPsS/wau6n1SURqbjzqCsUn0bPWCT9YD3atHdZ8489/gj6
 G80Lpx+TXFPS/MkpTWzt+wcPLdOwzfZNBjmIpcwBMlMJGno8/UvSBDhPjKHPzaryD5aM
 6bxnmsuuZH6o0B5qYubhlX7X4p60YEu1pCrlnyO8pVVZHOn9xFQgTd0DtG7IRhlUjWW7
 EOig==
X-Gm-Message-State: AGi0PuaNasm8VUghIj6ekgcXkYtBArjH13YXlsbKk7phupwce0JN69pc
 e0f3TWx3W/OAqqqr3bfAfIM=
X-Google-Smtp-Source: APiQypI0EUWBKYbznEtKPNz5UwUrsSO/J4XDLwMPOMVoE1DefD8K8rZJMluaXdDHLYWcnpOIlJlXag==
X-Received: by 2002:a17:906:5c43:: with SMTP id
 c3mr19671805ejr.3.1586159423195; 
 Mon, 06 Apr 2020 00:50:23 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id s4sm2429352edw.19.2020.04.06.00.50.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 00:50:22 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Dongli Zhang'" <dongli.zhang@oracle.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Anastassios Nanos'" <anastassios.nanos@sunlight.io>,
 <xen-devel@lists.xen.org>
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <d698f1ed-247e-404c-04ce-762c651771d1@oracle.com>
In-Reply-To: <d698f1ed-247e-404c-04ce-762c651771d1@oracle.com>
Subject: RE: Live migration and PV device handling
Date: Mon, 6 Apr 2020 08:50:21 +0100
Message-ID: <001301d60be8$06afa1a0$140ee4e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ9hFEeoa99jEIZ37IjX6uiVjJ3WQHz1sx0AqxQcWKm98VpMA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Dongli Zhang
> Sent: 03 April 2020 23:33
> To: Andrew Cooper <andrew.cooper3@citrix.com>; Anastassios Nanos =
<anastassios.nanos@sunlight.io>; xen-
> devel@lists.xen.org
> Subject: Re: Live migration and PV device handling
>=20
> Hi Andrew,
>=20
> On 4/3/20 5:42 AM, Andrew Cooper wrote:
> > On 03/04/2020 13:32, Anastassios Nanos wrote:
> >> Hi all,
> >>
> >> I am trying to understand how live-migration happens in xen. I am
> >> looking in the HVM guest case and I have dug into the relevant =
parts
> >> of the toolstack and the hypervisor regarding memory, vCPU context
> >> etc.
> >>
> >> In particular, I am interested in how PV device migration happens. =
I
> >> assume that the guest is not aware of any suspend/resume operations
> >> being done
> >
> > Sadly, this assumption is not correct.  HVM guests with PV drivers
> > currently have to be aware in exactly the same way as PV guests.
> >
> > Work is in progress to try and address this.  See
> > =
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D775a02452d=
df3a6889690de90b1a94eb29c3c732
> > (sorry - for some reason that doc isn't being rendered properly in
> > https://xenbits.xen.org/docs/ )
> >
>=20
> I read below from the commit:
>=20
> +* The toolstack choose a randomized domid for initial creation or =
default
> +migration, but preserve the source domid non-cooperative migration.
> +Non-Cooperative migration will have to be denied if the domid is
> +unavailable on the target host, but randomization of domid on =
creation
> +should hopefully minimize the likelihood of this. Non-Cooperative =
migration
> +to localhost will clearly not be possible.
>=20
> Does that indicate while scope of domid_t is shared by a single server =
in old
> design, the scope of domid_t is shared by a cluster of server in new =
design?
>=20
> That is, the domid should be unique in the cluster of all servers if =
we expect
> non-cooperative migration always succeed?
>=20

That would be necessary to guarantee success (or rather guarantee no =
failure due to domid clash) but the scope of xl/libxl is single serve, =
hence randomization is the best we have to reduce clashes to a minimum.

  Paul


