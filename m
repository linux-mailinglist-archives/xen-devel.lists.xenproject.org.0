Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770E643757
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:49:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbR0E-0000hh-8b; Thu, 13 Jun 2019 14:46:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vHmO=UM=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1hbR0B-0000hc-8d
 for xen-devel@lists.xen.org; Thu, 13 Jun 2019 14:46:56 +0000
X-Inumbo-ID: 1451c278-8dea-11e9-8980-bc764e045a96
Received: from uhil19pa10.eemsg.mail.mil (unknown [214.24.21.83])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1451c278-8dea-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:46:52 +0000 (UTC)
X-EEMSG-check-017: 419950187|UHIL19PA10_EEMSG_MP8.csd.disa.mil
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
 by uhil19pa10.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Jun 2019 14:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
 s=tycho.nsa.gov; t=1560437210; x=1591973210;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=glciBYsGpznf8nsMmT1XvL9GC1GkO9CyXe8r53WsJJs=;
 b=bl97VGOrRL7Y7/Y6qavzI8FYPsTuW+g2fQvL4VGO1XFdfKJoSzX92Q/l
 FFy8wB4ByqpXgsVgEU2IZMy6URnm4uS4/ADXVSRvPeC5clBfNP1EuKYnI
 hHaTgZrXQ4qAiXK92fnqkOJd+MHp3eVaRq5EroNMR3Zn5AhtDfGvSrRun
 YP6mZGfwKhcy0vGpZL3EEYrFGyEdlUGc3gZs3uEKK/2tTHi3TGmhTmF/T
 JWE/rHIiFVooFJD+I8o9LvDNO7YlWYIpp8hPjzO8rJD05B3tWCZRbAjTO
 OUBFJAlbpJDxGV7NvDu7PgyqcafeE6DYqGYxx7xRpuAlP1P7YWci2o7rU g==;
X-IronPort-AV: E=Sophos;i="5.63,369,1557187200"; d="scan'208";a="24709340"
IronPort-PHdr: =?us-ascii?q?9a23=3AxI+A9BYoBqvD2BxcYvfPrHn/LSx+4OfEezUN45?=
 =?us-ascii?q?9isYplN5qZpsy7YB7h7PlgxGXEQZ/co6odzbaP6ua5BD1LvsbJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MQi6oR/MusQWhYZuJaQ8xx?=
 =?us-ascii?q?jUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU063/chNBug61HoRKhvx1/zJDSYIGJL/p1Y6fRccoHSW?=
 =?us-ascii?q?ZdQspdUipMDY2mb4sLEuEPI+BWoYfgrFcKtBezCw2hCObpxzRVhHH5wLc63v?=
 =?us-ascii?q?w8Hw/Y0gwuH9EAvnrao9r6NqgdTe+7wbLUzTjBdf5axSvx5YbKfx0nvPqCXa?=
 =?us-ascii?q?hwcc3UyUQ3GQ3KlFOQqY37MDORy+8DvXaU5PdhW+K1kWEosQ9xqSWoy8gxhY?=
 =?us-ascii?q?nGm5wayl/e9Spj24s1Od25R1J7Yd6jCpdQsTqaOJFsTsMtRGFopj83x7sbsp?=
 =?us-ascii?q?C4ZCgH0IkryhHQZvCdc4WE/wjvWPieLDtmnn5pZbSyjAuo/0e60O3zTMy03U?=
 =?us-ascii?q?5PripCj9bDqGgA1wfW6sibUvt9+Vqh2SqX2wDT9O5EJUc0mLLHK5E72L4wl4?=
 =?us-ascii?q?cTsV/ZEi/qmET5kK+WdkI+9uiu9+vneanpqoWZN491jgHyKqUumsqhDuQkKg?=
 =?us-ascii?q?UCQmeW9Oum2LDj4EH1WqtGg/IonqXDrZzWPcEbqbS4Aw9R3IYj8RG/DzK+3d?=
 =?us-ascii?q?sFknkIMUxKeB2dj4fzIFzOPPD5Auu/g1SrijtrwevGMaf7DpXCKXjDjq/tfa?=
 =?us-ascii?q?xh5E5E1Aoz0ddf6opTCrEFOv3zVFT8u8bGAR8hPQy0x/joBM9g2YwAQWiPGL?=
 =?us-ascii?q?OWMLvOsV+U4eIiO+aNa5ETuDrkNvcq+eDugmE9mVIGeamp3IAXaGyjHvh8LE?=
 =?us-ascii?q?SWf3zsjs0GEWcQsQo0VPbqh0GaUT5Pe3ayWLox5igmCI28C4fPXI+sgKGd0C?=
 =?us-ascii?q?qgEZ1WY3pJClGIEXvya4qEXPIMYjqIIsB9ijwESaShS4g52BG1rgD6zqdnIf?=
 =?us-ascii?q?TQ+iECqZLj1Nl16PbJmhEv8Tx0E9+Q3H+LT2Fvh28IQz833Kd5oUBnzVeDy6?=
 =?us-ascii?q?d40LRkEol04/pHGic3L5/awKQuDNT7VCrIc8+HTFvgTtjwRXkhQ9R0z9IQbk?=
 =?us-ascii?q?JVH9S5kguFzyesRbgPmO+lHpsxp47V2Xn8I45Rxj7pzqAogRFyTsRDOGK8j4?=
 =?us-ascii?q?Zj5gPTAMjPiEzfmKG0I/dPlBXR/XuOmDLd9HpTVxR9BOCcBiES?=
X-IPAS-Result: =?us-ascii?q?A2BiAgATYQJd/wHyM5BlHAEBAQQBAQcEAQGBZYFnKoE7A?=
 =?us-ascii?q?TIohBaUXSWaXAkBAQEBAQEBAQE0AQIBAYRAAoJJIzgTAQMBAQEEAQEBAQMBA?=
 =?us-ascii?q?WwogjopAYJnAQUjFUEQCxgCAiYCAlcGAQwGAgEBgl8/gguqR4ExhUeDIYFGg?=
 =?us-ascii?q?Qwoi10RBoF/gTgMgl8+h06CWASUHpUuCYISk0YGG4IWlRaNG5hgIYFYKwoYK?=
 =?us-ascii?q?Q+DJ5BuIwMwgQYBAZAtAQE?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
 by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 13 Jun 2019 14:46:49 +0000
Received: from moss-nexus.infosec.tycho.ncsc.mil (moss-nexus [192.168.25.48])
 by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
 x5DEkj9U017902; Thu, 13 Jun 2019 10:46:46 -0400
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xen.org
References: <20180529120648.30429-1-olaf@aepfle.de>
From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Message-ID: <b54162cf-1f51-3571-a970-98a728885333@tycho.nsa.gov>
Date: Thu, 13 Jun 2019 10:46:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20180529120648.30429-1-olaf@aepfle.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Quan Xu <quan.xu0@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yOS8xOCA4OjA2IEFNLCBPbGFmIEhlcmluZyB3cm90ZToKPiBUaGUgZnVuY3Rpb24gcmVh
ZF92dHBtYmxrIHVzZXMgcHJpbnRmKDMpLCBidXQgc3RkaW8uaCBpcyBub3QgaW5jbHVkZWQKPiBp
biB0aGlzIGZpbGUuIFRoaXMgcmVzdWx0cyBpbiBhIHdhcm5pbmcgZnJvbSBnY2MtNzoKPiAKPiB2
dHBtYmxrLmM6IEluIGZ1bmN0aW9uICdyZWFkX3Z0cG1ibGsnOgo+IHZ0cG1ibGsuYzozMjI6Nzog
d2FybmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3ByaW50ZicgWy1XaW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgICAgICBwcmludGYoIkV4cGVjdGVkOiAi
KTsKPiB2dHBtYmxrLmM6MzIyOjc6IHdhcm5pbmc6IGluY29tcGF0aWJsZSBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiAncHJpbnRmJwo+IHZ0cG1ibGsuYzozMjI6Nzog
bm90ZTogaW5jbHVkZSAnPHN0ZGlvLmg+JyBvciBwcm92aWRlIGEgZGVjbGFyYXRpb24gb2YgJ3By
aW50ZicKPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CgpB
Y2tlZC1ieTogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
