Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE004A95D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 20:04:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdIPC-0005FY-Ek; Tue, 18 Jun 2019 18:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=44nJ=UR=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1hdIPA-0005FT-MK
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 18:00:25 +0000
X-Inumbo-ID: f03aacea-91f2-11e9-9920-5f86754854c1
Received: from UCOL19PA12.eemsg.mail.mil (unknown [214.24.24.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f03aacea-91f2-11e9-9920-5f86754854c1;
 Tue, 18 Jun 2019 18:00:21 +0000 (UTC)
X-EEMSG-check-017: 30074316|UCOL19PA12_EEMSG_MP10.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.63,390,1557187200"; d="scan'208";a="30074316"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by UCOL19PA12.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 18 Jun 2019 18:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1560880810; x=1592416810;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=IN8rPqDQk2ovL1ObL901pclCoFPEsKpDGXAnvJ78LGI=;
 b=nJtPtb+6Nvpsk2h02l4bdunMEElnsPwgK7ncVMp4FCXiJg+zbHUQq9DG
 DN2N7ZVV5REZVublcI7JTEcCFBsInuk91pxMz9RPmY2jEGvp8aQceuRJc
 dff2vCLQpVCgJ8UMe9XC1kYt9nAhvndV46Bjo/tGXKJlljdRr4+j16Sfw
 ySyAvO04W7z5+bP/kp04Lua+KQrMqNg997TvZUtWzUlrRq2C24BZySGCW
 xJWpRY71eVrQxmlweYYVM4HCfSdTBAIRieh1DASljnbF4FCFP8H59wssv
 EeOvuSAX7n9bCVWv96Jqj3KhFmI7QKx6l5byMQNdWwv1PDx+kcJehoeVY A==;
X-IronPort-AV: E=Sophos;i="5.63,390,1557187200"; d="scan'208";a="24870304"
IronPort-PHdr: =?us-ascii?q?9a23=3AacASnB1hw20V7HWosmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZsesSLf/xwZ3uMQTl6Ol3ixeRBMOHsqgC07Kd4/+oGTRZp8rY6TZaKN0Efi?=
 =?us-ascii?q?RGoP1epxYnDs+BBB+zB9/RRAt+Iv5/UkR49WqwK0lfFZW2TVTTpnqv8WxaQU?=
 =?us-ascii?q?2nZkJ6KevvB4Hdkdm82fys9J3PeQVIgye2ba9vIBmsogjdq9cajZF+JqotxR?=
 =?us-ascii?q?fEoXlFcPlSyW90OF6fhRnx6tqt8JJ57yhcp/ct/NNcXKvneKg1UaZWByk8PW?=
 =?us-ascii?q?Av483ruxjDTQ+R6XYZT24bjBlGDRXb4R/jRpv+vTf0ueR72CmBIM35Vqs0Vi?=
 =?us-ascii?q?i476dqUxDnliEKPCMk/W7Ni8xwiKVboA+9pxF63oXZbp2ZOOZ4c6jAZt4RW3?=
 =?us-ascii?q?ZPUdhNWCxAGoO8bpUAD+wdPeZDsoLxo0ICoQaiCQWwAe/izDFHhmXy3aYnze?=
 =?us-ascii?q?ovFw/I1xEkE94XvnnZqND5OaEPWu630abI1y3OYe5I1zfz6IbGcR4vrv+DUr?=
 =?us-ascii?q?1ybcXfxlIiFx/Hg1iKtYDpIz2Y2+YLvmOG7+RgT+Wvi2s/pg9/uDevwMYshZ?=
 =?us-ascii?q?fNhokIxF7L6zhyzocvJdKiUkF7b8OvHZxNuCGVKoR5XMwiQ3tytysh1r0HuY?=
 =?us-ascii?q?K0fCgNyJg9wR7fcOaIf5KH4hLkSuacODF1j29mdrKnnxu+7Eetx+LmWsS0zV?=
 =?us-ascii?q?pGtDRJn9bSunwXyhDe7NWMROFn8Ue7wzmP0hje6uRDIU8pi6XWM4Uhwrsslp?=
 =?us-ascii?q?oLtkTDAzP2lF32jKCIckUk/fCl6/j9bbX8p5+cKpR0hhviMqUuhsO/AeM4Ph?=
 =?us-ascii?q?IIX2eH4uSzyKfv/Uj4QLVOlvE2k6/Zv47GJckDu6K0DABY3pwj5hqiFTuqzt?=
 =?us-ascii?q?sVkWcdIF5YYB6HipLmO1DKIPD2F/e/hFGsnS92yPDJI7LuHJrNLmLZn7r6Yb?=
 =?us-ascii?q?Z861JTyAo0zdxF4ZJUEasOLOj8Wk/2qtzUFgU5PBCsw+b7FNV90ZsTV2aSD6?=
 =?us-ascii?q?CHLaPStV6I6f4vI+SXf48VpS39JOY/6/Hyin85nEcXfbO10psPdHC4AvNmLl?=
 =?us-ascii?q?2WYHXyhNcNCHoFsRQgTOP0jF2PSjpTZ3epX6Ig/TE3Eo2nApnFRoC1mryB2y?=
 =?us-ascii?q?W7EYNKaWBaEFyMFm3od4qcUfcWdC2SOtNhkiADVbW5SY8hyBWutA7kxLphNO?=
 =?us-ascii?q?bU9TcYuojn1Nhx/ODcjwsy9TluA8uB1GGNSnl+nnkUSD8uwKB/vUt9x0+Z3q?=
 =?us-ascii?q?h+nvNYD8Jc5v1TXggmMp7cyPR6BM7oWg/PZdqGVFemQsm8ATEwQdM92cMBY0?=
 =?us-ascii?q?F4G9+6lBDMwzKqA6MJl7yMHJE06KXc33fvKMZn0XrGzLMuj0Q9T8RTNG2mmr?=
 =?us-ascii?q?R/9wncBoLTj0qZkKOqf7wG3CHR7GeD0XaOvEZAXQBxT6rFWmofZkTIotjj6E?=
 =?us-ascii?q?3CUrmuCbA9PQtZ0sONNLZKZsf1glVHWPfjItXeYm2rl2isAhaIw6uGbJD2dG?=
 =?us-ascii?q?UFwCXdFE8EnhgQ83mcMwgyHCOvrHjCAzxtDlLvZEXs/PJgp3OmVEM70wCKb1?=
 =?us-ascii?q?F717q09R8Zn+CTS/QW3rgcoicuty10HEqh39LRE9eAvBFhfLlGbtwm/lhH0W?=
 =?us-ascii?q?bZtw17PpyhNK1ihUARcx5xv0zw0xV7EIJAkdIlrHky1gp9NbqY0E9ddzOfxZ?=
 =?us-ascii?q?3wObrXKm/o/B+1dqHawF/f0NeS+qcM8/k4rE/jsxu1GUom7XprycVa03yZ5p?=
 =?us-ascii?q?/SFgodTYrxUlor9xh9v7zafig954bP2HxjL6a0tCXO29UzBOsq0hygZctQML?=
 =?us-ascii?q?uYFA/uFM0XH8avKOgxllmmcB0EOvpe9KkuP8OpJLO63/uJNeAotj+7iWVM4M?=
 =?us-ascii?q?gp8GiB6i59Qe7gxIsezreT2Q7RE3/sgVHkvs3plIQMMSEfGC+zxDbpAKZVZ7?=
 =?us-ascii?q?ZuZsAbBGG2Ocq1y95iwZn3VCgL2kSkAgYq0cmodB7aQ1G18hdZ3Epf9XColS?=
 =?us-ascii?q?a31TVcjyAirq3Z2jfHhevlakxUaSZwWGB+gAK0csCPhNcAUR3tNlN4mQ=3D?=
 =?us-ascii?q?=3D?=
X-IPAS-Result: =?us-ascii?q?A2BkAgCQJQld/wHyM5BmHAEBAQQBAQcEAQGBZYFnKoE7A?=
 =?us-ascii?q?TIohBaSeIINml8JAQEBAQEBAQEBNAECAQGENgoCglEjOBMBAwEBAQQBAQEBA?=
 =?us-ascii?q?wEBbCiCOikBgmcBBSMVQRALDgoCAiYCAlcGAQwGAgEBgl8/gguqOYExhUeDI?=
 =?us-ascii?q?YFGgQwoi14RBoF/gTiCaz6HToJYBI4NhhyVNwmCEpNNBhuCFwGVHC2McJh2I?=
 =?us-ascii?q?YFYKwoYKQ+DJ5BuIwMwgQYBAY8qAQE?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 18 Jun 2019 18:00:10 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x5II07pD007336; Tue, 18 Jun 2019 14:00:08 -0400
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D03BE5102000078002385FE@prv1-mh.provo.novell.com>
 <5D03BF8E020000780023861C@prv1-mh.provo.novell.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Message-ID: <7a1b2be8-a765-a055-a6d0-f393d1dcf25d@tycho.nsa.gov>
Date: Tue, 18 Jun 2019 14:00:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D03BF8E020000780023861C@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] drop __get_cpu_var() and __get_cpu_ptr()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8xNC8xOSAxMTozOCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gdGhpc19jcHV7LF9wdHJ9
KCkgYXJlIHNob3J0ZXIsIGFuZCBoYXZlIHByZXZpb3VzbHkgYmVlbiBtYXJrZWQgYXMKPiBwcmVm
ZXJyZWQgaW4gWGVuIGFueXdheS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hv
Lm5zYS5nb3Y+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
