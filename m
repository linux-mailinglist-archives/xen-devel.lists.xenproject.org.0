Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE6E205F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:18:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJJ2-0004Ci-FK; Wed, 23 Oct 2019 16:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bqv7=YQ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iNJJ0-0004Cc-Rf
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:16:14 +0000
X-Inumbo-ID: 6c9c1ed8-f5b0-11e9-9487-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c9c1ed8-f5b0-11e9-9487-12813bfff9fa;
 Wed, 23 Oct 2019 16:16:10 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9NG4Cdb135113;
 Wed, 23 Oct 2019 16:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding :
 subject : to : cc : from : message-id; s=corp-2019-08-05;
 bh=ov0wo6s+fDhLIU+vwbnhy4usiayesaQAnee0rMIqanw=;
 b=B1g93HjLOPjokH+bbrFp+jYgj3zEBvEF85KV54iEG2i/glsGDnbbUrQXt43EoVpNyXX4
 o44VJYGQiGWjF3tr0lLDRgrAuxbGfeVqjQ0Jxa5EjzWAqhxDqlUj5TBjVU7rKDA9pqYJ
 BxqByAodLpwzwW1dvNCAaPPBG3IvTsmeNP+QDtwhUCzNnxl8myYOJGPO64u2g5N+M8iK
 jCUIE8pdqcpn3frrCLhEBF9j5hSNgFUIG1yvSGipRdpAUSBPJt5WzB/71T8RLSi/5vsw
 7acjwr9juIe7Ym2fLaa4sGFKEx+xx9uGG8rOc3b/Ll7lOJeOhZoxuVNiXLGrZ8CzpndE yg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2vqswtpjh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 16:16:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9NG9G1T047584;
 Wed, 23 Oct 2019 16:16:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2vtm22fjqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Oct 2019 16:16:06 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9NGG517024595;
 Wed, 23 Oct 2019 16:16:05 GMT
Received: from [IPv6:2607:fb90:6890:b7f2:2187:fe10:b0eb:ed4a] (/172.58.220.189)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Oct 2019 09:16:04 -0700
Date: Wed, 23 Oct 2019 12:14:14 -0400
User-Agent: K-9 Mail for Android
In-Reply-To: <d2836a5b-bfe0-7acb-c008-9a89d44ea4c2@suse.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-6-andrew.cooper3@citrix.com>
 <d2836a5b-bfe0-7acb-c008-9a89d44ea4c2@suse.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <88CB268B-C477-491A-AF58-C22EAEDCB862@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910230156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9419
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910230156
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?ISO-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gT2N0b2JlciAyMywgMjAxOSAxMDo0NjozNyBBTSBFRFQsICJKw7xyZ2VuIEdyb8OfIiA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToKPk9uIDIzLjEwLjE5IDE1OjU4LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOgo+PiBGcm9tOiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4K
Pj4gCj4+IFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0gdXNlZCBieSB4ZW4tbGl2ZXBhdGNo
IGRlcGVuZHMgb24gaGF2aW5nCj51bmlxdWUKPj4gc3ltYm9scy4KPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+PiAKPj4gVGhl
IGxpdmVwYXRjaCBsb2FkaW5nIGFsZ29yaXRobSB1c2VkIGJ5IFhlbiByZXNvbHZlcyByZWxvY2F0
aW9ucyBieQo+c3ltYm9sCj4+IG5hbWUsIGFuZCB0aHVzIGFsc28gZGVwZW5kcyBvbiBoYXZpbmcg
dW5pcXVlIHN5bWJvbHMuCj4+IAo+PiBJbnRyb2R1Y2UgQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZ
TUJPTFMgdG8gY29udHJvbCBmYWlsaW5nIHRoZSBidWlsZAo+aWYKPj4gZHVwbGljYXRlIHN5bWJv
bHMgYXJlIGZvdW5kLCBhbmQgZGlzYWJsZSBpdCBpbiB0aGUgUkFORENPTkZJRyBidWlsZC4KPj4g
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpXaGF0IGlzIHVwIHdpdGggdGhhdCBTb0JzIG5vdCBiZWluZyB0b2dldGhlcj8KCkNvdWxk
IHlvdSBzcXVhc2ggdGhlbSBwbGVhc2U/CgpQYXRjaCB3aXNlLCBmZWVsIGZyZWUgdG8gYWRkIG15
IFJldmlld2VkLWJ5LgoKVGh4Cj4KPlJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPgo+Cj5KdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
