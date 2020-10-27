Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCA429CCA2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 00:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13149.33745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYF1-00045d-Gq; Tue, 27 Oct 2020 23:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13149.33745; Tue, 27 Oct 2020 23:18:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYF1-00045E-Cy; Tue, 27 Oct 2020 23:18:59 +0000
Received: by outflank-mailman (input) for mailman id 13149;
 Tue, 27 Oct 2020 23:18:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kXYEz-000459-Tc
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:18:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 904df3fc-12db-4189-8424-63a110050b68;
 Tue, 27 Oct 2020 23:18:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OCGY=EC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kXYEz-000459-Tc
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:18:58 +0000
X-Inumbo-ID: 904df3fc-12db-4189-8424-63a110050b68
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 904df3fc-12db-4189-8424-63a110050b68;
	Tue, 27 Oct 2020 23:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603840736;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to;
  bh=IZ9FHP7UM9ir5vN2+AeRAWVYMbaqA/QaczprssiUnIc=;
  b=eyuhy0Zd97UDrpZ7EOXuJha2FLUEwBYis8RPlGZyd3CE9abipUKLweY2
   J31OYHuA3oPQ6kypepPL1HlX0LyCM9d30640XmyK2J5l/YT6eYVF63SxP
   XqcqHCJ4Smsi2j93UGQDm64WXjUX0NK8+Q6BIyHjJj3LuHUE+MXaQrJdH
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: VnByQLNSlIX7iD4ifp24aPZTiaBZXb++wlCSUecghkT5Hdd25WUekYvZve6UplKRQleaiTQtgd
 WkrGun2nbcO3AwraMFnC1X30E7J8x7f5RaJKoTgfdSlmkQpmbgSBNscY8eIDGePLotzuK//ry1
 L5DelmyXWZixd3tRpj0RZ/+4uARrbr8l6gCwI+f4O21o0HdFrv+CYyVGIA+S+e9u4+C/wFuOAJ
 Hd1YCS/ZbBPfGVL/e8pa9DFPAsbsfR3bylLRs+4CHRGfc+XDkoDzeBpAK/QrGkozEApoZDMhYz
 p/w=
X-SBRS: None
X-MesageID: 29977274
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,424,1596513600"; 
   d="asc'?scan'208";a="29977274"
Subject: Re: inconsistent pfn type checking in process_page_data
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20201027184119.1d3f701e.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6c595f1b-72cf-4f9e-5bad-eb0ebde45630@citrix.com>
Date: Tue, 27 Oct 2020 23:18:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027184119.1d3f701e.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="PmNP58m8765AuC1cLqKa14r0h9Udv4XtV"
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

--PmNP58m8765AuC1cLqKa14r0h9Udv4XtV
Content-Type: multipart/mixed; boundary="Pt76t2PbaCJH0N46DjzEpjw4D9tx0Jp59"

--Pt76t2PbaCJH0N46DjzEpjw4D9tx0Jp59
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 27/10/2020 17:41, Olaf Hering wrote:
> Andrew,
>
> with commit 93c2ff78adcadbe0f8bda57eeb30b1414c966324 a new function pro=
cess_page_data was added. While filling the mfns array for xenforeignmemo=
ry_map, the individual pfn types[] are checked in a different way than th=
e checking of the result of the mapping attempt.=20
>
> Is there a special reason why the first loop uses the various TAB value=
s, and the other loop checks XTAB/BROKEN/XALLOC? The sending side also us=
es the latter.

Hmm.=A0 (Wow that's more than 5 years old now)

IIRC, that particular piece of logic took an age to get correct.=A0 Its
quite possible it ended up being a merge of code which David and I wrote
at slightly different times.

Fundamentally, there are 4 bits of page type which encode NOTAB
(writeable), L{1..4}, Pinned L{1..4}, XTAB (invalid), XALLOC
(allocate-only - still not sure what the purpose is.=A0 There is no
producer of this type that I'm aware of) and BROKEN.

By my count, that is 12 legal types, so asymmetric type=3D>"is there data=
"
conversions is probably a bad thing.

I suspect we probably want an is_known_page_type() predicate on the
source side to sanity check data from Xen, and on the destination side
in handle_page_data() to sanity check data in the stream, and we
probably want a page_type_has_data() predicate to use in
write_batch()/process_page_data() to ensure that the handling is consiste=
nt.

Do you fancy doing a patch?=A0 If not I can put this on my TODO list, but=

no ETA on when I'd get to it.

~Andrew


--Pt76t2PbaCJH0N46DjzEpjw4D9tx0Jp59--

--PmNP58m8765AuC1cLqKa14r0h9Udv4XtV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzzVJW36m9w6nfSF2ZcP5BqXXn6AFAl+YqtsACgkQZcP5BqXX
n6BkrRAAg1pM7SuBZRyjw6qrXtkBnjmCHVa6eI9/BShJvYOoZwKINWlmrTagFX6M
q/7tqiU+XMMO1XtQ77XrEWUfLdnagxZSj0LcVXo2j9AOILcEfhVjm06kTr/y1Tie
s8tDBOfTdn+y0kV4ujlCm5sOfBngWEDOtYNXqhTeNZSdbmeeNXLue4ojwLDWP+Vf
4JK34YO0O4q4cGCclIpubPz0clO5ZzOauyBSno2OKrDvkF2C3NuXyvCkIz69oJ3z
+LyngRA38nrGXz3pVDZ9fqvVOvnPLIIwh8oyLE2f56084Z00xuHRpYTE69lF/d3B
frCkPEzOrlQVVepLIlEs0PavRbtvLiV0igzg8IubbBqKWL0c8Zyna4byAR1ZhWkL
A/Ob7K8RfjoBYDnVCAm5qjQpI4NMU8Sc6chevBqeJqNG9lfKRlhISPRBrncG4jy2
n0ggAAdrl6Tnnz2o3W+HiTbKz9500Li2xHfhtOyJiRuDvo3tNh8l24i6B52f12iO
QL6DuQBsmSW7geWl7nBQ9YD1rfkbMQUBRCdnmkAgIF3C/hEJXi2+PpFyqQVZUGqR
oCsNviC3kvxGhhSuZ0KlKisIZySMpVtk8K8UdFMmpje80PbAovAem+PnVVCoJB52
AlFe/yx5ffGOSN0ZidQiI2ac5nQAJSQoONAP3vv41G9t9JuC3e0=
=coZJ
-----END PGP SIGNATURE-----

--PmNP58m8765AuC1cLqKa14r0h9Udv4XtV--

