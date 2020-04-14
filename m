Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869651A7A30
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:58:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOKD1-0006j3-6X; Tue, 14 Apr 2020 11:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akv/=56=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jOKCz-0006iy-R5
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:58:29 +0000
X-Inumbo-ID: 40f09654-7e47-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40f09654-7e47-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 11:58:29 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v1so16709916edq.8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2020 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=v1aTs8gBKrFG7WXTg/hGEoWX4C0e8azPGKqQQchQmTk=;
 b=hdE4yeHxn5chh1zcg21GItSrpVRI/xKNK1zvZgjnGcbUW8/sjJX+9Z6l8/Iomacxyv
 Mmg5Pg9lXRKzlXZkvnpGivoPNFMib0UiqvSWGU89I/B5qiXG0IjwOFN+UcpbbhyGJuFX
 p0LuzxxqbvW4kt1y5dN0YzA8KD/hpJL8tLkrEiUer3rt5FicKK9WC84s+IJ2KRDvAyA7
 Bi72yhhQf1tPQZnx6rhq6+stqJ2n6rg2DCUI0WsxaHxGV4/qd2lazS/w46f4aBcd03TQ
 72t02CAVh5E72y6VoxtHMozvzqwsDAgmjUUUjnl8zKzSp2/7gD82RzGl7IF6iUhkXlfq
 q00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=v1aTs8gBKrFG7WXTg/hGEoWX4C0e8azPGKqQQchQmTk=;
 b=r6WYS4soFBr4ZaKTh9Bawi5ks9zVmdagkH6VmpNl7eCpMO/gI+/jKT0uGg+ok4x5hX
 GqrzdIpC2DH21kfGc8F0VWh7O/VRXO6QncLegoCHbbA3G405QO4/R5yv6uGQ/jPHMC4h
 27K0HyWmC2ezqxFqtNeqgyca+SKfiUjx7TKVAJqrWQIMvIl3cRtjn8W6kEqTGa9t8h1V
 fe1HgRlwqc8KmcuDxoMgr9gNaqGJS3g3d2m5Dhpwn+B+c6O8fI6LajbdiKsCNplf/L0R
 aXWm0U4jLad9uArvC+7RdUacaPTXVrg+hPhoWmfyzB64dZnJsh2MEIfh/OAPmLd44aR+
 hZUA==
X-Gm-Message-State: AGi0PuZlRzPkAS8lmZu3+sfbGUw4jmYwmLC2+8RT5JAEF5zqw8+3BL5N
 q5RJA/bZ3uklKVl4wiSSydw=
X-Google-Smtp-Source: APiQypIoJE7ToGYD3n9KjKEQGkn8qo7VPuB2vaiU4Gh+HzAKMbRe/eRp+KTAtKaWiiAgn+KflnXioQ==
X-Received: by 2002:a50:954b:: with SMTP id v11mr20374873eda.28.1586865508241; 
 Tue, 14 Apr 2020 04:58:28 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id i23sm1695700edr.54.2020.04.14.04.58.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 04:58:27 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
 <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
 <6e3732e8-01d0-e9de-e89a-cd1b5833e5a1@suse.com>
 <a102ec836a00714678fb3aa46787f597c9044f29.camel@amazon.com>
 <cfe18a03-854d-8b91-b333-ae2cefe3e1c8@suse.com>
 <000001d6124c$0aced570$206c8050$@xen.org>
 <90fd6e75-32b6-a140-1d20-083947bf1681@suse.com>
In-Reply-To: <90fd6e75-32b6-a140-1d20-083947bf1681@suse.com>
Subject: RE: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Date: Tue, 14 Apr 2020 12:58:26 +0100
Message-ID: <000001d61254$020b0dc0$06212940$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFuCy2uGI4jNh4hl1w2kkxxIVrUTADKkfs7Amx1u9ABXrUQQAMwPUabAgJH1CUBoTRAhwIYHsW9qNyD6KA=
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
Cc: wl@xen.org, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com,
 "'Shamsundara Havanur, Harsha'" <havanur@amazon.com>,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 14 April 2020 12:40
> To: paul@xen.org
> Cc: 'Shamsundara Havanur, Harsha' <havanur@amazon.com>; =
xen-devel@lists.xenproject.org;
> andrew.cooper3@citrix.com; ian.jackson@eu.citrix.com; wl@xen.org; =
roger.pau@citrix.com
> Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode, =
after all resource allocation
>=20
> On 14.04.2020 13:01, Paul Durrant wrote:
> >> -----Original Message-----
> >>>
> >>> Previous commit enabled MASTER for all functions. I am bit =
confused
> >>> here on the consensus on enabling/disabling/retaining BME.
> >>> Should we even care about MASTER?
> >>
> >> With the commit introducing its universal setting, I'm afraid to
> >> avoid regressions we can't sensibly alter the behavior unless it
> >> can be explained clearly why the original change must have been
> >> outright wrong.
> >>
> >
> > Well the original code IIRC had no justification for setting BME
> > and doing it unconditionally does seem dangerous.
>=20
> I'm not viewing this as dangerous, merely as (typically) pointless.
> A well behaved device won't start issuing DMA requests merely
> because it had its bus mastering capability enabled. (And in the
> context of some IOMMU work of yours you actually stated there are
> devices where clearing of this bit won't stop them from doing so.)
>=20

It's a line of defence against some devices at least, but others may =
choke. I still think it should be cleared by default and turned on with =
quirks if that is necessary.

> > Could we at least make it configurable?
> Well, the main question then would be - configurable by which
> mechanism?
>=20

The usual for hvmloader... a xenstore platform key.

  Paul



