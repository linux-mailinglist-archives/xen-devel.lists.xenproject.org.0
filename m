Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75FC611D1
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 17:16:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjmLn-0007lZ-Fx; Sat, 06 Jul 2019 15:11:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3zPC=VD=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1hjmLm-0007lU-5i
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 15:11:42 +0000
X-Inumbo-ID: 5a691fb0-a000-11e9-8980-bc764e045a96
Received: from sender4-of-o55.zoho.com (unknown [136.143.188.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5a691fb0-a000-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 15:11:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1562425897; cv=none; d=zoho.com; s=zohoarc; 
 b=A4y/RrPnH6I5gLZzbP28xvoYm8KNpolC7EcB0vBhwId8kHU7iTOUBjEzrVz8dIN2UuwEdKTcSGuXo420R4PcQcyN6AW+H1ybp67b0/m4z8rtHurM6s0d+Ew0Lk8RyjAUKOJvwNaAjREu/9QE22iEkptxASvQhZAcmAECvmrPgTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562425897;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
 bh=yUbDP3q/txd/A/4NN41sFAcw4qGUMzVEw7CbVsUeA/8=; 
 b=C4Lw841GDhZmi3AlWknelWcZ7qsPARaLloqCixwfIJ/vVDpSgSPjGhfVJeXJAyZtAa+06yDN+MOILiEEXvvyyWpl8QI2f46I6VvDu/21gy18zJ/70yRGrnXsA82FSzkdg4ykRofL1p2zKXesSFDgNr0JYl7Qu2aP209qilV9dWg=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=qubes-os.org;
 spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
 dmarc=pass header.from=<frederic.pierret@qubes-os.org>
 header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1562425897; 
 s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
 l=5296; bh=yUbDP3q/txd/A/4NN41sFAcw4qGUMzVEw7CbVsUeA/8=;
 b=GndjlTQfvG839PYfCdyQVrcXTweK4/a6sGTjJVvy5nDBg6vouz+iZnY4/b6LCOFe
 Q1lm8jVAHxMsAl5WPhpc0XdhG0mtlrCY3oz+VUN8iUzjtzA8Cgns+mumYDCU1qiTTxw
 G90IvfRzg1y095IXO3opaIZxTsbuefI0+i0uDtzw=
Received: from [10.137.0.45] (212.83.146.105 [212.83.146.105]) by
 mx.zohomail.com with SMTPS id 1562425896793467.43360253391097;
 Sat, 6 Jul 2019 08:11:36 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <c7991a4f-a103-e6b7-18e5-fc471eb96b10@qubes-os.org>
 <3743573c-fa17-b1c3-c073-9c0899046852@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Openpgp: preference=signencrypt
Message-ID: <2995c264-16b9-df07-4206-3a166a8443f8@qubes-os.org>
Date: Sat, 6 Jul 2019 17:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3743573c-fa17-b1c3-c073-9c0899046852@suse.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
Subject: Re: [Xen-devel] Ethernet PCI passthrough problem
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5994816224443254135=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5994816224443254135==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qB4D2B5yacNJ3uxUaP0T1n1CHKrmi8uqL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qB4D2B5yacNJ3uxUaP0T1n1CHKrmi8uqL
Content-Type: multipart/mixed; boundary="ErhY70pGUNqehMYKqjHZ5LiYGfXuqpVu8";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <2995c264-16b9-df07-4206-3a166a8443f8@qubes-os.org>
Subject: Re: [Xen-devel] Ethernet PCI passthrough problem
References: <c7991a4f-a103-e6b7-18e5-fc471eb96b10@qubes-os.org>
 <3743573c-fa17-b1c3-c073-9c0899046852@suse.com>
In-Reply-To: <3743573c-fa17-b1c3-c073-9c0899046852@suse.com>

--ErhY70pGUNqehMYKqjHZ5LiYGfXuqpVu8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 7/5/19 4:24 PM, Jan Beulich wrote:
> On 05.07.2019 15:46, Fr=C3=A9d=C3=A9ric Pierret  wrote:
>> I'm experiencing problem to perform PCI passthrough of Ethernet card
>> with 4 ports (HP Ethernet 1Gb 4-port 331FLR Adapter) on an HP DL360 Ge=
n8.
>>
>> I have two server like this one where the first is under CentOS and th=
e
>> other one, under Qubes. Under CentOS, the nics are not attached to any=

>> other domain and classical dmesg shows no errors (see attached
>> 'centos_kvm.png'). It's working very well since long time.
> The name of the image suggests this is under KVM, not Xen. The device
> being at bus 3 rather than bus 0 also suggests this isn't inside a
> Xen HVM DomU.
Yes it's under KVM and not attached to any VM. It was to confirm that
the NICs are working with the driver, not necessary under Xen.
>> I'm trying to
>> switch these servers to Qubes and I'm facing trouble. In Qubes, we
>> attach all the nics into a domain, usually called 'sys-net' in HVM mod=
e.
>>
>> The nics are attached with 'rdm_policy=3Drelaxed' to 'sys-net' but are=
 not
>> loaded in the domain due to errors (see attached 'HVM_dom0.png' and
>> 'HVM_sys_net.png').
> The former of these shows a fundamental problem: Two of the RMRRs
> overlap the BIOS area inside the guest. I'm afraid I don't see how
> to deal with this (short of shuffling the BIOS elsewhere, which
> imo is not really an option). I wonder how this gets dealt with in
> the CentOS case, where you say things work (I take it that you've
> verified that the RMRRs on both systems are at exactly the same
> addresses).
I attempt to follow
https://support.hpe.com/hpsc/doc/public/display?docId=3Demr_na-c04781229,=

in order to exclude RMRR region but as I cannot determine the slot of
the extension card, I had no success at this point. It's not a PCI-E
card it's an embedded module.
>
> And then I'm puzzled by there being further messages about 03:00.2,
> suggesting that domain construction (or device assignment)
> continues. Yet then the same messages don't appear for the other
> two devices (you did say there are four of them, and other logs
> also support this).
Me too as sometimes it is 03:00.3 or .1 instead of .2 .
>> I tried in PV mode, I got it working but I was not
>> happy with that for security reason. I decided to update my bios to th=
e
>> most recent one, and even in PV, it does not work anymore (see attache=
d
>> 'PV_dom0.png' and 'PV_sys_net.png').
> That'll require figuring out what exactly the driver isn't liking.
> At the first glance I'm inclined to think the BIOS update broke
> things.
I will try to dig into 'sys-net' to debug the driver itself.
>> All have been tried under Qubes 4.0.1 (xen-4.8) and Qubes 4.1 under
>> development (xen-4.12). Current attached log images are with xen-4.12.=

> You saying "log images" already points at a problem: Actual (and
> complete as well as sufficiently verbose) log files would be more
> helpful when diagnosing issues like this one.
Sorry about that. As I'm using remote console management (ILO) and no
network for debugging Qubes, it was easier to provide screenshot.
>
> Jan

Thank you for your answer. Any tips for debugging more, even the driver
are welcome. Thank you again.

Fr=C3=A9d=C3=A9ric



--ErhY70pGUNqehMYKqjHZ5LiYGfXuqpVu8--

--qB4D2B5yacNJ3uxUaP0T1n1CHKrmi8uqL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl0guiYACgkQSEAQtc3F
duIeEhAAzZDo9cMFb2PYzDo1iY2Wz9OroKy/8o+ITknmHfJmQLjpkewZ0XWDACWB
4KIhhvNsPDQFPbCUegyU2jTPVgei8tIYRJXalVK6U2Mu5T/XGBNrPY1QnoY2iCDY
OSADmZe+QTrcZGFP7E9VDSW0a3RU4v6qlNy8ttShQA/OfJTo265YVeZmaeJDpPbw
9OF+22SB7fgstwRmVO4j5UaVdEQGfmavolJPLnBWKONAaWp6U3d7v8opI7p/YtYx
Z6kJTUnby/Lf22aksd/7DZ2Hv9eVh7GjmiLFWxsuld2GMkIhAY3O0fOdjkuhZ8+L
XQi6bCOSlaCFKHh9Qc9YE2az3xijOGvhLQ0feh3iPuYhe860OwLvdnRVnUJnVmIT
Z4ZZBV5nOATP/BAgC+i4FDREahd4jtHnGya7mw55LVO2fuXnjdc8JW9UowuSQDez
ZFRr+Kd65sUbr4AknzCVfss6TbXJKX1WAuCugHKPXoTq0Buy7bOIIP3x8XqxzLPy
6aVDftLVEnMK1CSI3BPes35E40vxE7GKpjSLCRzkUopeNMe10iQySxNTF/Oz/JaP
iyVcedJv08uhAmgmzn1I5PNn83UlJT/dyd6FzDnwqDE4KmmQL8FW1yr7EqG9o4rA
glLRsrovlnhSOnlvqaoBzQwuSd22/chBCkG0Mn9OR4aIXF3qKHI=
=cHd1
-----END PGP SIGNATURE-----

--qB4D2B5yacNJ3uxUaP0T1n1CHKrmi8uqL--



--===============5994816224443254135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5994816224443254135==--


