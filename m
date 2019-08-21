Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED899827A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:14:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0V6M-0004tP-AO; Wed, 21 Aug 2019 18:12:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0V6L-0004tK-Lc
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 18:12:53 +0000
X-Inumbo-ID: 4ab96aac-c43f-11e9-8980-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ab96aac-c43f-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 18:12:53 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI4IZA096024;
 Wed, 21 Aug 2019 18:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=tiNbHfcOfT0LECd16cGUPv1Ssvtud1gsR2Q9Cwb0kpY=;
 b=L/43EfoXggQ2lsN6Gcm24duSMSq5E72wI6gwXJC9+K8Hi9pif79N6Db/c3qoTG0EDgRx
 5pkPYb7D3D3Cr+kUf3tJ7lJdXoDEU7KukewdsxlG7r2oBrLg/9oDwGiomCaLz3+W28Za
 tTW6eOqqQfrMxfEsp5/qaBEuuee7Zghgt3AZJhj51A4m93GzUJj+nwqPIvVS8iMrOlgH
 QMnJv3of6UqIBfc0O+z8TbFnYIAMlEehh6baRF0uXWMDbVsezpzh9wNkbCRyvsyfbFjI
 xBVmg2QZTy5Qjaj20E8EWYpbb7c+0cqU71Ayt1SWQUQ23O9ob4XB9R4akWKPagUywzOU 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2ue90tqnp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:12:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LI3YQ9110956;
 Wed, 21 Aug 2019 18:12:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2uh2q4ubm2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:12:49 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LICmb2008336;
 Wed, 21 Aug 2019 18:12:48 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:12:47 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org
References: <20190814083911.89280-1-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <dcfce3be-570d-2148-bc3b-a3279013ea17@oracle.com>
Date: Wed, 21 Aug 2019 14:12:46 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190814083911.89280-1-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210180
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210180
Subject: Re: [Xen-devel] [livepatch-hooks-2 PATCH 4/4] livepatch: Add
 per-function applied/reverted state tracking marker
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
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNC8xOSA0OjM5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiAjaWZkZWYg
X19YRU5fXwo+ICt0eXBlZGVmIGVudW0gbGl2ZXBhdGNoX2Z1bmNfc3RhdGUgewo+ICsgICAgTElW
RVBBVENIX0ZVTkNfTk9UX0FQUExJRUQgPSAwLAo+ICsgICAgTElWRVBBVENIX0ZVTkNfQVBQTElF
RCA9IDEKPiArfSBsaXZlcGF0Y2hfZnVuY19zdGF0ZV90Owo+ICsKPiAgIHN0cnVjdCBsaXZlcGF0
Y2hfZnVuYyB7Cj4gICAgICAgY29uc3QgY2hhciAqbmFtZTsgICAgICAgLyogTmFtZSBvZiBmdW5j
dGlvbiB0byBiZSBwYXRjaGVkLiAqLwo+ICAgICAgIHZvaWQgKm5ld19hZGRyOwo+IEBAIC04MzQs
NiArODM5LDEwIEBAIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyB7Cj4gICAgICAgdWludDMyX3Qgb2xk
X3NpemU7Cj4gICAgICAgdWludDhfdCB2ZXJzaW9uOyAgICAgICAgLyogTVVTVCBiZSBMSVZFUEFU
Q0hfUEFZTE9BRF9WRVJTSU9OLiAqLwo+ICAgICAgIHVpbnQ4X3Qgb3BhcXVlWzMxXTsKPiArI2lm
IGRlZmluZWQgQ09ORklHX1g4Ngo+ICsgICAgdWludDhfdCBhcHBsaWVkOwo+ICsgICAgdWludDhf
dCBfcGFkWzddOwo+ICsjZW5kaWYKPiAgIH07CgpUaHJlZSByZXF1ZXN0czoKICAtIFdoeSBkb2Vz
IGl0IGhhdmUgdG8gYmUgWDg2IHNwZWNpZmljPwogIC0gQ2FuIHlvdSBhbHNvIGluY2x1ZGUgdGhl
IGNoYW5nZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiB3aGVyZSB0aGUgc3BlYyAKcmVzaWRlcz8KICAt
IFlvdSBhcmUgYnVtcGluZyB0aGUgdmVyc2lvbiB0byAyLCBidXQgbm90IG1ha2luZyBpdCBiYWNr
d2FyZHMgCmNvbXBhdGlibGUuIElmIHNvICx5b3UgYWxzbyBuZWVkIHRvIHVwZGF0ZSB0aGUgZG9j
dW1lbnRhdGlvbiB0byBtZW50aW9uIAp0aGlzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
