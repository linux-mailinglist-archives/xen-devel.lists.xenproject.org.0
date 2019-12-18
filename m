Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6E12427E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:12:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVLM-0004OF-Tp; Wed, 18 Dec 2019 09:10:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5XdQ=2I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihVLL-0004Kd-Fi
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:10:07 +0000
X-Inumbo-ID: 2e49b497-2176-11ea-9049-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e49b497-2176-11ea-9049-12813bfff9fa;
 Wed, 18 Dec 2019 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576660206;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=kebSe7bFd4r5WsVKLdOphJxiN8W2bFvnn+rAP1oRUO8=;
 b=RBUOBCn2J4NRs9ntk8eakK9uAzynJU9jdMSWj6XOQP03qdK6gTA6EX37
 D6owjurQT1ab3j1v12G85vPmANWovZZsCOc++rQPCv2Xe9H3LbC7q8174
 evNrqgJmnfD/b1CMQbL4tOPuZQ9X3zIIOU56uJgvMw1jP9Rc6v970Kv9Y U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EkBHfCjZwhI/0x0TE1lZeg7ZkCoL1ZcLw5ijwTVrxj452qCY20spKNFARnPLweRaC9el+X0XRw
 IhNgRirDH8QSCGe2F8iz81w3fsMNlZMWoHCTncZwUgPinNMj0/DyrGxJuLV+xZ5PZKd13k8eqb
 khWk3N1ocUhh9DEYl0QGfbjs7dJIaLdVp+6f2OG6n2jklveRQQuJ/3bSEJmQ8Flgit0xSefm9a
 +K2K+243glOI1Ydb84Yb8kXX+a+h2ounyP9Du3zB7ytpMG24caVqeSKe+UOnk39eiB4evlRV+d
 r1Q=
X-SBRS: 2.7
X-MesageID: 9855886
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,328,1571716800"; d="asc'?scan'208";a="9855886"
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-3-jgross@suse.com>
 <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <bbe9f829-0b79-9d1c-4f08-8bd936a8e0a7@citrix.com>
Date: Wed, 18 Dec 2019 09:10:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/9] xen/sched: make sched-if.h really
 scheduler private
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7182108137065982368=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7182108137065982368==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ZQj0uIYgQaXji3OAClmI87giSi5ADNjzj"

--ZQj0uIYgQaXji3OAClmI87giSi5ADNjzj
Content-Type: multipart/mixed; boundary="r2dCMOFiK0J7dWgEnML9KDFkBedypOSv9";
 protected-headers="v1"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <bbe9f829-0b79-9d1c-4f08-8bd936a8e0a7@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/9] xen/sched: make sched-if.h really
 scheduler private
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-3-jgross@suse.com>
 <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
In-Reply-To: <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>

--r2dCMOFiK0J7dWgEnML9KDFkBedypOSv9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 18/12/2019 09:08, Dario Faggioli wrote:
> On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
>> include/xen/sched-if.h should be private to scheduler code, so move
>> it
>> to common/sched/sched-if.h and move the remaining use cases to
>> cpupool.c and schedule.c.
>>
> Very, very nice cleanup.

Yup - very nice to see.

>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thoughts on simply naming it private.h?

~Andrew


--r2dCMOFiK0J7dWgEnML9KDFkBedypOSv9--

--ZQj0uIYgQaXji3OAClmI87giSi5ADNjzj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd+ezpAAoJEGXD+Qal15+gCfYP/21TMdW7M1JQ62+4SHSTcxJh
f6JfeIDD0DxBoKsKbAbHOuYeW1+HW9Dnkk1B6ZcdUA1DRtZL3E4JPFtCe+yVpKq+
Q8ALN8KKqfALR/3P2EfzXrYtDDfLxosCrerXHmWoJNNDCjLwWJgw6BPQ9Ji0dVF7
tLl5vCwPBh+lIYC8v7xCsBSewMcbnECgKqZpGAKvtQ872yNYZS9dNCSySOg7zh7K
hJgMxdLzymS8uqILS6/+PINC4jYjxsiSf31EYn7wdcaJu6pS1AcUhKkZM7/9/NPV
sw8H+V7a7dFAGgREjCGy2xia4psj5KG1YCBQyWFSna8jxYLwSmsF4mVMEGMD9cdt
0vG4MzhchKjIrGYkvFg8DW9hwm9qKIqE7Jf5alXzMTjjGcfoI5Iaw/CKHwjuTvZk
p7NJCFELGZ6mSwsMAXr4rScOPM3p59xFIRcWYJ0wOEriVaEK9h/VlNg32F+vhAQU
AanLr3riAwxGNA18Iq5/OUjZQE3ElWnbqnr4P8M5kFs321r/ELRNSUEwZVuceRNk
nBuOjL5Od1tHxp0RXWNHISLGb6EN2O5cJ0S+QuKGzEYUnVhyZPT7n7FymMzlfNP0
lY2CHozAKHkG4ThvM/bp66+3Akw2Eu6ce/+XWjIgQzb90TVLyPCPyUsDK00lh5W+
nr63iD2ujEHkapcZG/Vq
=qpfE
-----END PGP SIGNATURE-----

--ZQj0uIYgQaXji3OAClmI87giSi5ADNjzj--


--===============7182108137065982368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7182108137065982368==--

