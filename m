Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983F34A94
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 16:40:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYAYC-0006QW-GJ; Tue, 04 Jun 2019 14:36:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bjho=UD=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1hYAYA-0006QR-Jw
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 14:36:31 +0000
X-Inumbo-ID: 22549cf8-86d6-11e9-8980-bc764e045a96
Received: from uhil19pa09.eemsg.mail.mil (unknown [214.24.21.82])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 22549cf8-86d6-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 14:36:27 +0000 (UTC)
X-EEMSG-check-017: 22149722|UHIL19PA09_EEMSG_MP7.csd.disa.mil
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by uhil19pa09.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 04 Jun 2019 14:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1559658986; x=1591194986;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Xr2q+fOlghcsruIQmEc7afzxiFgIQb+O4a3C1s6tDEQ=;
 b=RYGNOWNH5y7AhXIzWPOXjOUuFbvre/8/NKkGWtu3Lp0O1QbarBxn51IS
 XtGpp8bDI7kftLTQZcicaKVAIfEsaRuP+lWnkUuR1/Shelym6Y7swBKGK
 rYNLeinadqWhrvO/3Ksks/HjJnVXaWccUsIjChqfO3VGlrwcQZzynVrdg
 fXthsLvxTeVZYEh9/XhJBc1tYC4uZSp6zQGnEmQibVRT3t4sf0DL1WJTG
 5fcxrg/oY6EQRb/P5PMdwL/NRfCJ9SUAWJWLigH1zdGVZJ9yN0F09MjRq
 YK/u2VmdEGP0ot8LuveX6H4s5aFtnd9VSOZt/5JESfMBu/TCstGPkPtb3 A==;
X-IronPort-AV: E=Sophos;i="5.60,550,1549929600"; d="scan'208";a="24375962"
IronPort-PHdr: =?us-ascii?q?9a23=3Ajqa3UhPsis+IKSGbqzwl6mtUPXoX/o7sNwtQ0K?=
 =?us-ascii?q?IMzox0K/j9r8bcNUDSrc9gkEXOFd2Cra4d0qyP6PGrBjFIyK3CmUhKSIZLWR?=
 =?us-ascii?q?4BhJdetC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBx?=
 =?us-ascii?q?rwKxd+KPjrFY7OlcS30P2594HObwlSizexfK5+IA+roQjfssQajolvJ6YswR?=
 =?us-ascii?q?bVv3VEfPhby3l1LlyJhRb84cmw/J9n8ytOvv8q6tBNX6bncakmVLJUFDspPX?=
 =?us-ascii?q?w7683trhnDUBCA5mAAXWUMkxpHGBbK4RfnVZrsqCT6t+592C6HPc3qSL0/RD?=
 =?us-ascii?q?qv47t3RBLulSwKLCAy/n3JhcNsjaJbuBOhqAJ5w47Ie4GeKf5ycrrAcd8GWW?=
 =?us-ascii?q?ZNW8BcWCJbAoO4coABEewPM+hFpIX5vlcDox+zCQyqCejyyDFHm2X20LUn3e?=
 =?us-ascii?q?o/HwHI3A8uEdwAv3vbrtr6KKgcXPupzKTK1zjPc+9a1Dn/5YXObxsvoeuMXb?=
 =?us-ascii?q?V1ccfJx0cgDQXFjlSOpozhIjib2PoCuHWa4ep6T+2gkWAnoBx2rzeyyccjl5?=
 =?us-ascii?q?fGho0Pyl/e7ih53IY0KsG4SE58e9KkFoBQuDuAO4t5RcMiXXhltSAnwbMFoZ?=
 =?us-ascii?q?62ZDUGxZsoyhLFa/GLbpKE7gzsWeqPOzt0mXRoc6+liRmo60iv0Oj8W9Gx0F?=
 =?us-ascii?q?ZNsyVKjMHBtmsI1xzP8siHTeZ9/lu51TaPyQ/T7uZELFgolaXBMZ4hw6Mwlo?=
 =?us-ascii?q?EJvUTfHi75hEX2jKiMekUi5ueo8Pjobq/jpp+dM494kgD+MqIwlcyjGek0Lw?=
 =?us-ascii?q?cDUmeB9em8ybHv51P1TbpUgvEsj6XVqJXaKt4apq69DQ9VyIEj6xOnAji739?=
 =?us-ascii?q?QXgGcILF1feB2dlIXpJ1HPL+z4Dfe4mVislixryOrcMr3uBZXNMGDPkK39cr?=
 =?us-ascii?q?Zl905c1A0zwMhb6Z9JFL4BPfbzWk7tu9zYFRI5KBG0w/35B9lnyoweXmePCL?=
 =?us-ascii?q?eDMKzOqV+I+v4vI+6UaY8XpTb9L/kl6ODojXMjll8dZ7Om3Z8TaH2jBPtmOU?=
 =?us-ascii?q?CZbWDwjdcGFGcAphA+Q/DyiF2eTT5TYG6/ULg65j4mEoKpE4nCSpqxj7yG2y?=
 =?us-ascii?q?e7BoNZZnpIB12XDXjodpmEW+0NaCOdOMNujjsEVb25QY87yR6urBP6y6ZgLu?=
 =?us-ascii?q?fM4C0Ysp3j28Zv5+HJjRE97yF0At+B3GGMU2F0hGIIRjAs0K9jpkx9z0+J0b?=
 =?us-ascii?q?JkjPxACdxT+/RJXx80NJHCzux2EdTyWgPcftuXU1upXtSmAS0rTtIwzN4CeV?=
 =?us-ascii?q?pyG9KnjhrbxSqlH6cVl6CXBJwz6q/S3mb+J8Fny3bJyqYtlVcoQtZJNW2inK?=
 =?us-ascii?q?F/7xPeCJDUk0mDi6mqdLgc3DTM9GaM12aBoEZYUAtoW6XfQX8fflfWrcj+5k?=
 =?us-ascii?q?7aTLGhE7InPhFFx8GYNqRKacbpjVJARPr4Jtvefni9lHuxBRaU3LOMbYXrd3?=
 =?us-ascii?q?8B0yXaDUgOixoT8mqeNQgiGiehpHrTDCd1FVLzeUzj6vdxqHe/Tk81yQGKbl?=
 =?us-ascii?q?Zs17mr9R4Pg/yTVfcT0qgDuCc7pDV+BEy90M7OC9qcuwphe71RYNwj71dBzG?=
 =?us-ascii?q?7WqhJyPoK+IKBmnVMedwV3v1jy1xVsEIlBntYlrHUyzApoLqKY0k1OeC+E3Z?=
 =?us-ascii?q?zqPb3XMGby9gi1a6HKwlHezMqW+qAX5fQ7rFXjuhupGVA//Hl93dhV0n+c5p?=
 =?us-ascii?q?bRAQoVS5L+SFo49xxkqL3AfiY94IbU32V2Maaoqj/Cx84pBOw9xxa8ZdhfNb?=
 =?us-ascii?q?mLFBTpHs0GBMiuLPIlm16mbhMEIu9S8LQ4MN+hd/uDwKSrJvpvnCq6jWRb54?=
 =?us-ascii?q?Bwyl6M9yt5SuPT0JcK3feY0hGAVzfmg1fy+vzwzKJNY3k4E3e7yCPkTNpzTK?=
 =?us-ascii?q?BveYcACU+1Pta6gN55gsi+dWRf8QuPDlUH1cvhVRfaQEb01AMYgUgYrXGogy?=
 =?us-ascii?q?KQ0y1/kzZvqLGWmiPJ3bKxJ1I8JmdXSTw63h/XKo+ugoVfBRP5Yg=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2BiAgAIgfZc/wHyM5BmHAEBAQQBAQcEAQGBZYFnKoE8M?=
 =?us-ascii?q?iiEFJMIgWAtmlgJAQEBAQEBAQEBNAECAQGEQAKCUiM4EwEDAQEBBAEBAQEDA?=
 =?us-ascii?q?QFsKII6KQGCZwEFIxVBEAsOCgICJgICVwYNBgIBAYJfP4ILp06BMYVHgyyBR?=
 =?us-ascii?q?oEMKItaEQaBf4E4gms+h06CWASNbYYKlQ4JghCTMAYbghMBlGMtpQ8hgVgrC?=
 =?us-ascii?q?hgpD4MngkaOKCMDMIEGAQGQSgEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 04 Jun 2019 14:36:25 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x54EaLbx013672; Tue, 4 Jun 2019 10:36:22 -0400
To: Jan Beulich <JBeulich@suse.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
 <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Message-ID: <aa07d7fb-979b-a5b5-cef4-d440e974d30e@tycho.nsa.gov>
Date: Tue, 4 Jun 2019 10:36:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8zLzE5IDQ6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA1LjE5IGF0
IDIzOjM3LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+IERpc2FibGUgaXQgYnkgZGVm
YXVsdCBhcyBpdCBpcyBvbmx5IGFuIGV4cGVyaW1lbnRhbCBzdWJzeXN0ZW0uCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiAKPiBEYW5p
ZWwsIGl0IGxvb2tzIGxpa2UgeW91IHdlcmVuJ3QgQ2MtZWQgaGVyZSwgYnV0IHlvdXIgYWNrIGlz
IG5lZWRlZC4KPiAKPiBKYW4KCkFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHlj
aG8ubnNhLmdvdj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
