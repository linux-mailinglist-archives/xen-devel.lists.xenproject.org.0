Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF4982C9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 20:30:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VLX-0006Qn-2N; Wed, 21 Aug 2019 18:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1vq=WR=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i0VLV-0006QO-Fm
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 18:28:33 +0000
X-Inumbo-ID: 79fd24c0-c441-11e9-adc9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79fd24c0-c441-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 18:28:33 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIIvv0124550;
 Wed, 21 Aug 2019 18:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=OhU7krWQvamQeN6qlaAtDJ5RwY9TMLKjMNLtdRnk1Fk=;
 b=OBVlzhVWmwnj4wQAZt/WA1GtAfvI095lFTqpX7jfvNihYxb1q1hCGV4qBkMnJouO6n+u
 F7OROp3xa7U3ijQL8yuY1Fa9nXugFaNZOITQgU1WqBdPIMY1vLS2DPViAAdstlpeYqxd
 ND/1qMa7za3aTkU0CVDayIj5UUfy/plDQ/INtEw2qBWUW7w5BCgVzgG/gBrCOb7zl1xN
 9ntie/Wz6B7frXUl4o7iX0LXhCBfnYH0lqetXLG2LaThaeHAKMOG9xLYuaE/1OnUO8RJ
 oews1P3n9duJsqRNpWO+caPCvN5KDd+VC57nBz2tIZi+Fdg2YtdPtl4rusyXXLYQz7T6 lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uea7qyk6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:28:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7LIIoDC082400;
 Wed, 21 Aug 2019 18:28:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2uh83p050c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 18:28:23 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7LISMll018774;
 Wed, 21 Aug 2019 18:28:22 GMT
Received: from dhcp-10-154-125-129.vpn.oracle.com (/10.154.125.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Aug 2019 11:28:22 -0700
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Organization: Oracle Corporation
Message-ID: <e4458dba-a515-4b4b-b3c7-0f71565f9ee0@oracle.com>
Date: Wed, 21 Aug 2019 14:28:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-10-wipawel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908210181
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9355
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210181
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA0OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiAgIHN0cnVj
dCBsaXZlcGF0Y2hfZnVuYyB7Cj4gICAgICAgY29uc3QgY2hhciAqbmFtZTsgICAgICAgLyogTmFt
ZSBvZiBmdW5jdGlvbiB0byBiZSBwYXRjaGVkLiAqLwo+ICAgICAgIHZvaWQgKm5ld19hZGRyOwo+
IEBAIC04MzQsNiArODM5LDEwIEBAIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyB7Cj4gICAgICAgdWlu
dDMyX3Qgb2xkX3NpemU7Cj4gICAgICAgdWludDhfdCB2ZXJzaW9uOyAgICAgICAgLyogTVVTVCBi
ZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OLiAqLwo+ICAgICAgIHVpbnQ4X3Qgb3BhcXVlWzMx
XTsKPiArI2lmIGRlZmluZWQgQ09ORklHX1g4Ngo+ICsgICAgdWludDhfdCBhcHBsaWVkOwo+ICsg
ICAgdWludDhfdCBfcGFkWzddOwo+ICsjZW5kaWYKClJlcGx5aW5nIGhlcmUgYXMgd2VsbC4gQ291
bGQgeW91IHVzZSBwYXJ0IG9mIHRoZSAnb3BhcXVlWzMxXScgc3BhY2UgCmluc3RlYWQgZm9yIHRo
aXMgZmllbGQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
