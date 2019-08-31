Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E5A49E8
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2019 16:52:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4RAd-00036i-Ds; Sun, 01 Sep 2019 14:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1kjy=W3=web.de=markus.elfring@srs-us1.protection.inumbo.net>)
 id 1i3zU4-0005Pu-Ul
 for xen-devel@lists.xenproject.org; Sat, 31 Aug 2019 09:15:49 +0000
X-Inumbo-ID: ea306008-cbcf-11e9-ac23-bc764e2007e4
Received: from mout.web.de (unknown [212.227.15.3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea306008-cbcf-11e9-ac23-bc764e2007e4;
 Sat, 31 Aug 2019 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1567242926;
 bh=W42yxbYmQCv9tl6YPZs0YFC5fDpZrDuUEO40d5+J5IY=;
 h=X-UI-Sender-Class:To:Cc:References:Subject:From:Date:In-Reply-To;
 b=Rb418DWmi/RVbd8sECvNY7M6am3zzXtvu6Z8MKvDEcaqy80J5NzEeIsZquRc+o3+K
 RcMPUbulCWil2CYSmPwWqfOWbsvJq8lYGIRKuYobskoTbIVH51G/a5nLZzGK7B0dUo
 Ub/VAcIMteSPNk9yZ43wLPYl/AxtOIz+Ty7w1ZYE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.129.60]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MXHt7-1hjODj0cab-00WIUk; Sat, 31
 Aug 2019 11:15:26 +0200
To: Denis Efremov <efremov@linux.com>, Joe Perches <joe@perches.com>
References: <20190829165025.15750-1-efremov@linux.com>
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <0d9345ed-f16a-de0b-6125-1f663765eb46@web.de>
Date: Sat, 31 Aug 2019 11:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
Content-Language: en-US
X-Provags-ID: V03:K1:qKSdXHHLYLKjlRCvxxm0CG4/ObWxvY7GHVNBMu8mxxGycRrayx8
 4PbzO2dvqjNnF+AFg4bA1W4zmeQSpNZ7vt9DbPnL5lk34WKJYWD9NUPM0PlrCLMjYkm1F6U
 BXfMva6PP5qxs+6jegtT9nR1r+jzSjNeTTC2AqMHglXEtSWbQLq9Fa4eMsUVMGo2eepnDXr
 VwnOxGgwPijQTQTX/f+uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nkNVUAuCw5k=:pAP5U5L7C1x2boPp1IRXmn
 D13IzlXT/kI0Odb0OEskHBv1fRCMj7J727enJOB+vAgZd2n6ZXAAaWlSqHLVcohKzncPx6QpO
 Jkkz3w/W/rmQNzfpoIhIUW3Uccf/fl14QBw5X5i4PyFGDK9jzI0Phtg8JML9FgdHalKCIpNWP
 o213QJNReSqJUzIClMxbcGq2voyTmxMmGEwBIXqC58OGwigFy7zuu2Fy5ondTj8F6i3gbb38h
 c6JrfIYpAxvFnO9nRMcO25oqflwZdAfHvFzJ2iu+3r8XsTgWukdxyVbMiL8ftz50QxC2DJqzq
 Ayqcpn0a9Y7cTytKg/qxVHdxdOIF48+PWbHaSEgzP4SLLOPElveDdWhJEc0vM5xdTU1Dqb7hM
 NcCaA0zHOKUIDqcYJ6jN44G6CZgVS/MFofCq8QcCo4GFiBNWMHS4cmZtOpUQJMXQuRbrwvm5s
 QLUFHQhzpAX2K0Aj8VIVILu1mHvF1oeAJg0lG6KqkOeZEm+Unicxfz9HErsixNGFodYh0D3/K
 Pus4ocado7zBlJoZThrgPZ8TvIHn8mX0WI7LW+JhXvD1rFkJmT4VMVuezkSvp3NJ9GaBnkiEN
 2DsKyjBxY/6mcp9cg5MLZTh0zU4f7ZpgvIRT7mBBrJ5TGKKmZLH7U/Z5qQmwJz28iIVaVlH4p
 wK8w2niZej5noXMTOemcJJnIR+evko7BhWXbZHiUAALjl38emkz357bvLjEkVGm7h8qIAQyjv
 9Ffe8YuiaY+tWayyEFK6qfYIHwGdEZNrYmIuX9tupSwJCJ8bCFsx9n7SNCZvSRm61MjQsWB76
 icYRtytGOYmCsolycXG6KEM734RMbdaPv2pCjSKPk80uNsPY10n0pxzKUpdSnG1O5lboelK/K
 +pQTb7oUbCkyxCvKMOBAo+HHvPT1QQcSGkQreepWbCChdY7O5TxdjvwnEYYPBYSyBIKA4j2t6
 gmzI4FQ5Tbv5lKlap9HBlQSeD5ynZnaeINJfHFu/XpQei9uMkeptC8IYqtcno5/KHj4gVLoN6
 dvIF455p6LB73n4l5ci1UNJB4L7BiFhMmqFWnfszzCVLZrOOA94053rwKZECu2B8PgnRB8RwQ
 RHR8X1QZRRFkw/YnadMqgavlvTg6QJ2wAh3pxzJ+iXjpxC1IgfnMhR3w1p3UqTC4whz3ngKbv
 qqUbKY+8ilN57KkwviQJZULRks7t3CtGMgptQJeouQnu6rZg==
X-Mailman-Approved-At: Sun, 01 Sep 2019 14:49:34 +0000
Subject: Re: [Xen-devel] [PATCH v3 01/11] checkpatch: check for nested
 (un)?likely() calls
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
Cc: dri-devel@lists.freedesktop.org, Leon Romanovsky <leon@kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-rdma@vger.kernel.org,
 Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>,
 Saeed Mahameed <saeedm@mellanox.com>, linux-input@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Pismenny <borisp@mellanox.com>,
 linux-arm-msm@vger.kernel.org, linux-wimax@intel.com,
 Enrico Weigelt <lkml@metux.net>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Whitcroft <apw@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sean Paul <sean@poorly.run>,
 Anton Altaparmakov <anton@tuxera.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiArIyBuZXN0ZWQgbGlrZWx5L3VubGlrZWx5IGNhbGxzCj4gKwkJaWYgKCRsaW5lID1+IC9cYig/
Oig/OnVuKT9saWtlbHkpXHMqXChccyohP1xzKihJU19FUlIoPzpfT1JfTlVMTHxfVkFMVUUpP3xX
QVJOKS8pIHsKPiArCQkJV0FSTigiTElLRUxZX01JU1VTRSIsCgpIb3cgZG8geW91IHRoaW5rIGFi
b3V0IHRvIHVzZSB0aGUgc3BlY2lmaWNhdGlvbiDigJwoPzpJU19FUlIoPzpfKD86T1JfTlVMTHxW
QUxVRSkpP3xXQVJOKeKAnQppbiB0aGlzIHJlZ3VsYXIgZXhwcmVzc2lvbj8KClJlZ2FyZHMsCk1h
cmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
