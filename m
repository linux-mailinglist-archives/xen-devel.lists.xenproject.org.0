Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C011736A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 19:04:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieNKp-00047n-VN; Mon, 09 Dec 2019 18:00:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lB68=Z7=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1ieNKo-00047i-Po
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 18:00:39 +0000
X-Inumbo-ID: c8c597c6-1aad-11ea-88e7-bc764e2007e4
Received: from USAT19PA21.eemsg.mail.mil (unknown [214.24.22.195])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8c597c6-1aad-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 18:00:30 +0000 (UTC)
X-EEMSG-check-017: 58664009|USAT19PA21_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; d="scan'208";a="58664009"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by USAT19PA21.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 09 Dec 2019 18:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1575914428; x=1607450428;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2uz8xOKXLjIfq6F8Y7OBh4Qh3vYapYdGT+BNbVImB4A=;
 b=CvMDS/AtYy32whKwgbumfABWGoX8ScB6c1MNGAtVwgoY5uKk3atVqSFK
 f4cS5Sj6oz+pfrzVRYuzZy8yIgEEZbImglTy9cFh8EZA6pmbsze/MemwN
 x409n+v9FCCiVqX1KAxCSHlgpSK6Fbz5/MPtQ6e8iv2m5cTf1lYS+YHIQ
 3mnJ4uE6c4f1PkcFByQyXW9TH+/RtUohtQSv3vtVa/hSqVxlDxmq+gU3A
 +9/Wnjjhqh8OZ7VoqyXrBW4HpG/6TOgOTSfQdyDxZneqOUAAIZDd04Of6
 d+SCf9hBqVqnpXyohKT41FfE4sPY+5sqTjK+mklb/MF8Gkj12bS3HfLwO g==;
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; d="scan'208";a="30907674"
IronPort-PHdr: =?us-ascii?q?9a23=3AD8+0RhReHD98gyanH9FSrlq3/Npsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa67ZBKEt8tkgFKBZ4jH8fUM07OQ7/m7HzVRud3Y6C9KWacPfi?=
 =?us-ascii?q?dNsd8RkQ0kDZzNImzAB9muURYHGt9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV?=
 =?us-ascii?q?3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oIxi6sAvcutMLjYZmNqo9xQ?=
 =?us-ascii?q?bFrmdKdu9L2W5mOFWfkgrm6Myt5pBj6SNQu/wg985ET6r3erkzQKJbAjo7LW?=
 =?us-ascii?q?07/dXnuhbfQwSB4HscSXgWnQFTAwfZ9hH6X4z+vTX8u+FgxSSVJ8z2TbQzWT?=
 =?us-ascii?q?S/86dmTQLjhSkbOzIl9mzcl9d9h7xHrh2/uxN/wpbUYICLO/p4YqPdZs4RSW?=
 =?us-ascii?q?5YUspMSyBNHoawYo0BAOobOeZTspfzqV0AoxCjAQWgHe3ixztNinLwwKY00f?=
 =?us-ascii?q?kuERve0QI9AdwOvnTarNL2OqkcX++6w6vHwinMYf5NxTfw6pLFfgw9rfyCX7?=
 =?us-ascii?q?99d9fax0k1FwPCi1WdsYLrMCmT1uQMrWeb6/drW+yxhGU6qg9xuCKgyd0iio?=
 =?us-ascii?q?LUgY8a11/E+jhnz4Y6P923UlV2YcKkEZRMtyGaMJF6QsU5Q25yoio6xboGuY?=
 =?us-ascii?q?CicSUM1Z8pyRnfa/mdfIiJ5BLuTP2RIStli3JkfrKznQyy/la6xeLhUMS/zV?=
 =?us-ascii?q?VErjJdn9XRuX0A2Abf58iaRvdn4Eus1iiD2xrO5uxCPEs6j7DUK4Q7zb41jp?=
 =?us-ascii?q?cTtEPDETLol0jul6+Wc1kk+vCv6+T6frXqvp+cOJFwigH5KqkuhtawAf45Mg?=
 =?us-ascii?q?gTRGiX4+W81Lvt/U3+W7VFkOE5nrPFsJHaOcsbpqm5DxVT0ok/8BawEy2q0N?=
 =?us-ascii?q?EZnXkDNF5FeRSHgJb1O1zWPfz1Aviyj06snTt23fzKILLsDovXInTeiLvheK?=
 =?us-ascii?q?xy609YyAo919Bf4JdUB6kcL/L8R0D+qtPYDgUjPAGv3+bmCMly1oMZWW6VBK?=
 =?us-ascii?q?+ZK7ndvUWH5uIoPemAfJUVtyrlK/g5+/7uimc0lkUbfaa0x5sYdn65Eu56LE?=
 =?us-ascii?q?WeZnrsmskOEX0EswclUOPqiUGCUSRSZ3e9Ra4z+jY7CIe+B4fZWo+tmKCB3D?=
 =?us-ascii?q?u8HpBOaWFJFFaMHW71eIqaRfcDdiaSL9RlkjwFTrihV5Qh2QuhtQDkzbpnNv?=
 =?us-ascii?q?DU+ioatZ39yNd1+/fflRYo9Tx7F86dyX2CT3lonmMUQD87xKJ/oUNnyleEyq?=
 =?us-ascii?q?h4mOdVFcdO5/NSTAg2L4LTz+t/C4O6ZgWUV9GFUlu5Cv6hBik8VJplytkCeU?=
 =?us-ascii?q?tiXd6liQjOxXGCCL4Jjb2bQpcz9/SYl0j8IYNxxmjL0OF1n1QgB8dCK2Cirq?=
 =?us-ascii?q?p+7BTIQZ7ElV2DkKSnfrha2zTCojSt122L6W1RVg99Ve3pUDgwfELfo5yt6k?=
 =?us-ascii?q?zOQrC0AJw7IwBBzoiEMaIMZdr32wYVDMz/McjTNjri01y7AgyFk/bVN9vn?=
X-IPAS-Result: =?us-ascii?q?A2BRAACmiu5d/wHyM5BlGgEBAQEBAQEBAQMBAQEBEQEBA?=
 =?us-ascii?q?QICAQEBAYF+gXSBGFQBIBIqhAKJA4gpmy4JAQEBAQEBAQEBIxQBAYRAAoI9O?=
 =?us-ascii?q?BMCEAEBAQQBAQEBAQUDAQFshTcMgjspAYJuAQUjFUEQCxgCAiYCAlcGAQwGA?=
 =?us-ascii?q?gEBgl8/AYJ3rSCBMoVPgzqBSIEOKIwsBoIAgTgPgl0+h1mCXgSWeEaXG4I4h?=
 =?us-ascii?q?yOOPQYbgkJ0iz+LPY5KnDwigVgrChgpD4MnCUcRFJY+hQwjAzCPEAEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil)
 ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 09 Dec 2019 18:00:24 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id
 xB9I0B4W190667; Mon, 9 Dec 2019 13:00:11 -0500
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191207211634.9958-1-andrew.cooper3@citrix.com>
 <20191207211634.9958-2-andrew.cooper3@citrix.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <d1f11125-d6ba-9c97-e501-40d6fee5d01b@tycho.nsa.gov>
Date: Mon, 9 Dec 2019 13:00:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191207211634.9958-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/flask: Drop the gen-policy.py
 script
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
Cc: Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNy8xOSA0OjE2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoZSBzY3JpcHQgaXMg
UHl0aG9uIDIgc3BlY2lmaWMsIGFuZCBmYWlscyB3aXRoIHN0cmluZy9iaW5hcnkgaXNzdWVzIHdp
dGgKPiBQeXRob24gMzoKPiAKPiAgICBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6
Cj4gICAgICBGaWxlICJnZW4tcG9saWN5LnB5IiwgbGluZSAxNCwgaW4gPG1vZHVsZT4KPiAgICAg
ICAgZm9yIGNoYXIgaW4gc3lzLnN0ZGluLnJlYWQoKToKPiAgICAgIEZpbGUgIi91c3IvbGliL3B5
dGhvbjMuNS9jb2RlY3MucHkiLCBsaW5lIDMyMSwgaW4gZGVjb2RlCj4gICAgICAgIChyZXN1bHQs
IGNvbnN1bWVkKSA9IHNlbGYuX2J1ZmZlcl9kZWNvZGUoZGF0YSwgc2VsZi5lcnJvcnMsIGZpbmFs
KQo+ICAgIFVuaWNvZGVEZWNvZGVFcnJvcjogJ3V0Zi04JyBjb2RlYyBjYW4ndCBkZWNvZGUgYnl0
ZSAweDhjIGluIHBvc2l0aW9uIDA6IGludmFsaWQgc3RhcnQgYnl0ZQo+IAo+IEZpeGluZyB0aGUg
c2NyaXB0IHRvIGJlIGNvbXBhdGlibGUgaXNuJ3QgaGFyZCwgYnV0IHVzaW5nIHB5dGhvbiBoZXJl
IGlzCj4gd2FzdGVmdWwuICBEcm9wIHRoZSBzY3JpcHQgZW50aXJlbHksIGFuZCB3cml0ZSBhIHNo
b3J0IGZsYXNrLXBvbGljeS5TIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgRGUgR3Jh
YWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KCldpdGggZWl0aGVyIC5hbGlnbiBvciAucDJhbGln
biBhcyBhcHByb3ByaWF0ZSBmb3IgbW9yZSBhc3NlbWJsZXJzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
