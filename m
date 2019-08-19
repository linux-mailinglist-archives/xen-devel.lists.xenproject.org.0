Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AF94FC5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 23:20:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzp15-0002Az-Jb; Mon, 19 Aug 2019 21:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4zt0=WP=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1hzp14-0002Au-3u
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 21:16:38 +0000
X-Inumbo-ID: 9f8bed40-c2c6-11e9-8bf0-12813bfff9fa
Received: from UHIL19PA37.eemsg.mail.mil (unknown [214.24.21.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f8bed40-c2c6-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 21:16:36 +0000 (UTC)
X-EEMSG-check-017: 15520276|UHIL19PA37_ESA_OUT03.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,406,1559520000"; d="scan'208";a="15520276"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by UHIL19PA37.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 19 Aug 2019 20:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1566248131; x=1597784131;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dGIImVlIsBGWPoPgm6HSGVTcHDa8itXK6JT8ViiuCOQ=;
 b=Yox6OaTiDwKzEj4JIrx5W90WLYRMuhLLhMrOH8sg0Pf0QWgpozwdkT4o
 tF5YcuAQoGk08EESaxqKWY73suu0otAkRd1xHP4b2tJvD6p1vnVnF+2cC
 DtAOigOEI7SZ0W1h8l/Yn9Nlnd3CJ4IqQSH0920bU8UNT210v3+IRcYI5
 yHETkZz5MTwGfT2SOC8Def+NwusT5K1AohlofNEVJNKwVLjCsKPLG7i5O
 eURVjv62PQj+gwf+eXDEhVtJFHJMVqzCAYpmyNheFsX9ej7GZGcvAexOq
 gwRV7ZaZAiuz5ZtH3i+eLgjsYW6kPiobpO5L+fxVBLCQtKqdy3QBSYFdR Q==;
X-IronPort-AV: E=Sophos;i="5.64,406,1559520000"; d="scan'208";a="26958852"
IronPort-PHdr: =?us-ascii?q?9a23=3AopBcMx8gbzxpLP9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B+1e8WIJqq85mqBkHD//Il1AaPAdyBrasf2qGP7vyocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmSSxbalvIBi4qQjdudQajIttJ60s1h?=
 =?us-ascii?q?bHv3xEdvhMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW?=
 =?us-ascii?q?874s3rrgTDQhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VD?=
 =?us-ascii?q?q+46t3ThLjlTwKPCAl/m7JlsNwjbpboBO/qBx5347Ue5yeOP5ncq/AYd8WWW?=
 =?us-ascii?q?9NU8BfWCxbBoO3cpUBAewPM+1Fq4XxvlUDoB+7CQSqGejhyCJHhmXu0KMnze?=
 =?us-ascii?q?ohHwHI3AsjEdwAvnvbo9f6O7sdX+2u0KnFzi/OY+9K1Trz6oXFdA0qr/GWXb?=
 =?us-ascii?q?J3dMrc0UchGBnDjlWRt4PlOy6e2OoTvGOG7uRgT/ighHQpqwpspTWg28gshZ?=
 =?us-ascii?q?TXiYIa0FDL7z50wJo1JNKkSE57ZsSoEJ1Lty6ALYd2TcQiQ39xtSs817YIuo?=
 =?us-ascii?q?a7cTAXxJkoyBPTcfyKf5WS7h79W+udPy10iG9jdbminRi961Kgxff5VsSs1V?=
 =?us-ascii?q?ZKqTdKncfUu3AW0hzT9tCHSvxg/ke9wTqP1x7c6uVDIU0siarUMYQhwr8tlp?=
 =?us-ascii?q?oIq0jDAi/3l1n2jK+RbEkk/PSn6//7bbn8o5+cNot0hhn/MqQohMO/Hfw1Ph?=
 =?us-ascii?q?UBUmWU4+ix1KDv8VfnTLhFkPE6iLTVvIjfJcsBp665BwFV0pwk6xa6Fzqpzd?=
 =?us-ascii?q?sYkmQZI1JKYhKIlZPkO03OIf/kDfe/hE6gkDFwx//cJLHhDZLNLmbbnLf7Yb?=
 =?us-ascii?q?l981JcyBY0zd1H/5JbEKwBIPbpVkDsqdzYFAU5PBayw+b7E9hyyoIeWX6VAq?=
 =?us-ascii?q?+YP6Leq0OH5uUqI+OUfo8apC79K+Q55/7plXI4lkESfa+w0ZQKdn+4AOppI0?=
 =?us-ascii?q?GCbHrog9cBCnsKvhEkQO3lllKCVyZTZ2y1X6I++D40FJ6mAZ3ERoC3j7yLxD?=
 =?us-ascii?q?27EYFOZmBaFlCMFm/ld56fW/cQci2dOdFukjgAVbigTY8h1AqjtAzkxLp9KO?=
 =?us-ascii?q?rb5CkYuYjk1Nhv6O3ZjQsy+iBsD8SBz2GNSHl5nmEVRz8y3aBwv0p9xk2M0a?=
 =?us-ascii?q?himfNYEdhT6uhTXQcgMJ7Q1fB1C9f3WgjZZNeGVE6mQsm6ATE2Vt8+zNgOY0?=
 =?us-ascii?q?J6G9q/jhHD2iqrA6UNmLGWHpM76b7T33jsJ8Z+0HvJyrEhgEMjQsdVKWKmga?=
 =?us-ascii?q?t//RDJB4HVi0WZi7qqdaME0S7P72iM03eOvEVZUAFsUaXIRmsfZlbNrdvn/E?=
 =?us-ascii?q?/NU7iuCbE/OAtb1cGCMrdKasHujVheXvjjPsnRY3ivlGa+HxqH2rSMbI3ye2?=
 =?us-ascii?q?oDxiXQBlMJnBwS/XaaLwg+Byigr3jCAzxpEFLle1ns/vVmqHOnUk80yBmHbk?=
 =?us-ascii?q?Nl17eu9R8am/qcR+kU3rIetycrsy90E0ql39LKF9qAoBJsfL9bYdMy/lhHz3?=
 =?us-ascii?q?jVtxRnMZy9NK1tml8ecxhtv0Pv2BR7EJlPkc8vrHky1gp9NbqY0E9ddzOfxZ?=
 =?us-ascii?q?3wOKDXKm/o8BCpcaHW2UvR0NSX+qcK8vs1sFTjvAe1FkU893VrycVa03yZ5p?=
 =?us-ascii?q?/SFgodTYrxUlor9xh9v7zaYTcy553V1X1qK6W0rj7C1MgvBOY+yxagectfP7?=
 =?us-ascii?q?2AFAPoD8IaAM2uIvQwm1e1dhIEIPxS9KksMsOpafSG37SrPOl+kz68kGtH/Y?=
 =?us-ascii?q?Z90kaW+CpkUePHwYsFz+uE0QuGSzf8llahs8/tlY9YYjESG3K1yTL4C45Jeq?=
 =?us-ascii?q?1yYYELBH+1I82q3NVxnYDtVGBG+1K5HFMGxdOpeRqTb1z+wA1Q0VwXrmahmS?=
 =?us-ascii?q?u50zx5iCsmrq+C0yDU3+vicx8HMHZRRGZ+lVfsPZS0j9cCUUezdQgplQGq5U?=
 =?us-ascii?q?Dgy6lVo6R/KHTcQVxTcifsKmFtT7G8uaaFY85Ku9sUtnBvWfm4KXyHUKT0pQ?=
 =?us-ascii?q?dShzvqAm8YyC0hbTispr3yngBgiXLbJ3F2+j6Racx2gBvS+tHYbfpQxSYdAj?=
 =?us-ascii?q?l1jyHNAVqxNMXv+s+bxLnZteXre2unV5BXOQXmhayavSK1rTlmDhGykOq6ss?=
 =?us-ascii?q?H2Ggg9lyng3p9lUjue/0W0WZXiy6nvabEvRUJvHlKprpMhS4w=3D?=
X-IPAS-Result: =?us-ascii?q?A2DeAwBkDFtd/wHyM5BmHAEBAQQBAQcEAQGBZ4FuKoE/M?=
 =?us-ascii?q?iqEH48RgWIIJZNwhx4JAQEBAQEBAQEBNAECAQGEPwKDJiM4EwIFAQEBBAEBA?=
 =?us-ascii?q?QEBBgMBAWyFM4I6KQGCZwEFIw8BBUEQCxgCAiYCAlcGAQwGAgEBgl8/ggurN?=
 =?us-ascii?q?IEyhUiDL4FJgQwoi2kRBoF/gREnDIJfPodPglgEjmCccQmCH5QzBhuYRC2NL?=
 =?us-ascii?q?ZoaIYFYKwoYKQ+DJ5EjIwMwgQYBAY14AQE?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 19 Aug 2019 20:55:29 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x7JKtRtL026764; Mon, 19 Aug 2019 16:55:27 -0400
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-8-paul.durrant@citrix.com>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Organization: National Security Agency
Message-ID: <e9a79795-4444-1ee8-f2cf-890fb92bdc2d@tycho.nsa.gov>
Date: Mon, 19 Aug 2019 16:55:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-8-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
 appropriate...
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSAxOjE5IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gLi4ucmF0aGVyIHRoYW4g
dGVzdGluZyB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBvaW50ZXIuCj4g
Cj4gTm93IHRoYXQgdGhlcmUgaXMgYSBwZXItZG9tYWluIGZsYWcgaW5kaWNhdGluZyB3aGV0aGVy
IHRoZSBkb21haW4gaXMKPiBwZXJtaXR0ZWQgdG8gdXNlIHRoZSBJT01NVSAod2hpY2ggZGV0ZXJt
aW5lcyB3aGV0aGVyIHRoZSBvcHMgcG9pbnRlciB3aWxsCj4gYmUgc2V0KSwgbWFueSB0ZXN0cyBv
ZiB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQgb3BzIHBvaW50ZXIgY2FuCj4gYmUg
dHJhbnNsYXRlZCBpbnRvIHRlc3RzIG9mIHRoZSBwZXItZG9tYWluIGZsYWcuIFNvbWUgb2YgdGhl
IG90aGVyIHRlc3RzIG9mCj4gcHVyZWx5IHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxlZCBmbGFnIGNh
biBhbHNvIGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZgo+IHRoZSBwZXItZG9tYWluIGZsYWcu
Cj4gCj4gTk9URTogVGhlIGNvbW1lbnQgaW4gaW9tbXVfc2hhcmVfcDJtX3RhYmxlKCkgaXMgYWxz
byBmaXhlZDsgbmVlZF9pb21tdSgpCj4gICAgICAgIGRpc2FwcGVhcmVkIHNvbWUgdGltZSBhZ28u
IEFsc28sIHdoaWxzdCB0aGUgc3R5bGUgb2YgdGhlICdpZicgaW4KPiAgICAgICAgZmxhc2tfaW9t
bXVfcmVzb3VyY2VfdXNlX3Blcm0oKSBpcyBmaXhlZCwgSSBoYXZlIG5vdCB0cmFuc2xhdGVkIGFu
eQo+ICAgICAgICBpbnN0YW5jZXMgb2YgdTMyIGludG8gdWludDMyX3QgdG8ga2VlcCBjb25zaXN0
ZW5jeS4gSU1PIHN1Y2ggYQo+ICAgICAgICB0cmFuc2xhdGlvbiB3b3VsZCBiZSBiZXR0ZXIgZG9u
ZSBnbG9iYWxseSBmb3IgdGhlIHNvdXJjZSBtb2R1bGUgaW4KPiAgICAgICAgYSBzZXBhcmF0ZSBw
YXRjaC4KPiAgICAgICAgVGhlIGNoYW5nZSBpbiB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlICdo
ZCcgdmFyaWFibGUgaW4gaW9tbXVfbWFwKCkKPiAgICAgICAgYW5kIGlvbW11X3VubWFwKCkgaXMg
ZG9uZSB0byBrZWVwIHRoZSBQViBzaGltIGJ1aWxkIGhhcHB5LiBXaXRob3V0Cj4gICAgICAgIHRo
aXMgY2hhbmdlIGl0IHdpbGwgZmFpbCB0byBjb21waWxlIHdpdGggZXJyb3JzIG9mIHRoZSBmb3Jt
Ogo+IAo+IGlvbW11LmM6MzYxOjMyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmGhk4oCZIFst
V2Vycm9yPXVudXNlZC12YXJpYWJsZV0KPiAgICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11
ICpoZCA9IGRvbV9pb21tdShkKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdv
dj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
