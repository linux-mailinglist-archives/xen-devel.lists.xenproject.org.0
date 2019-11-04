Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B22EE395
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:21:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRe7q-0006Qo-12; Mon, 04 Nov 2019 15:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wy1X=Y4=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iRe7p-0006Qi-Aa
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:18:37 +0000
X-Inumbo-ID: 5f1d0212-ff16-11e9-a181-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f1d0212-ff16-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:18:36 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FCPlL032257;
 Mon, 4 Nov 2019 15:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=wI+MlQfXsMx0uWokWMoST+s/IjPegRzzQjCD9nh+Q+o=;
 b=Y4QNrQVsbZ/BnO04dhmq9gO+33O7WD7A0vrMN69D194HaDfvhyveJxdhBvQRhwKLcNib
 c4NM8JddRmjoeLcyY2S0nAW+ZLf70RNi1rhwnvCH4v8HByMiPEEuc/Iv6XefpjpcCgsM
 HrU4gex/gSamGEpCKjgQtxGqaORbunYDONOCxp8fiPky4MlihpexRRQTnTa+A5rJd8m4
 xcCdhAY8xazJR/xQlraufK2Gfk49rbwdnckKLu3/VX3xg8bBGfVGBLk5GIqCHzE6LU8G
 M6wKMs1Lyf1ZZRcwP4Ao/BB1NdVlXuywgl9WzbfJdO7gY2NPAX3FZz41XpKnKryFvHM9 Ew== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2w11rpr20x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:18:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA4FAASi019949;
 Mon, 4 Nov 2019 15:16:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2w1kxmhnd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2019 15:16:19 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA4FGGZo019676;
 Mon, 4 Nov 2019 15:16:16 GMT
Received: from tomti.i.net-space.pl (/10.175.168.29)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Nov 2019 07:16:15 -0800
Date: Mon, 4 Nov 2019 16:16:09 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20191104151609.k4qxlw4sbqvld357@tomti.i.net-space.pl>
References: <20191024114814.6488-1-daniel.kiper@oracle.com>
 <20191024114814.6488-3-daniel.kiper@oracle.com>
 <e094a1cf-6bf2-1e8a-94c7-47767d66138e@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e094a1cf-6bf2-1e8a-94c7-47767d66138e@zytor.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=925
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911040151
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9431
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911040151
Subject: Re: [Xen-devel] [PATCH v4 2/3] x86/boot: Introduce the
 kernel_info.setup_type_max
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
Cc: jgross@suse.com, corbet@lwn.net, linux-efi@vger.kernel.org,
 tglx@linutronix.de, konrad.wilk@oracle.com, ard.biesheuvel@linaro.org,
 peterz@infradead.org, ross.philipson@oracle.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com,
 bp@alien8.de, rdunlap@infradead.org, luto@kernel.org, eric.snowberg@oracle.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDE6NTU6NTdQTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4g
d3JvdGU6Cj4gT24gMjAxOS0xMC0yNCAwNDo0OCwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4gVGhp
cyBmaWVsZCBjb250YWlucyBtYXhpbWFsIGFsbG93ZWQgdHlwZSBmb3Igc2V0dXBfZGF0YS4KPiA+
Cj4gPiBOb3cgYnVtcCB0aGUgc2V0dXBfaGVhZGVyIHZlcnNpb24gaW4gYXJjaC94ODYvYm9vdC9o
ZWFkZXIuUy4KPgo+IFBsZWFzZSBkb24ndCBidW1wIHRoZSBwcm90b2NvbCByZXZpc2lvbiBoZXJl
LCBvdGhlcndpc2Ugd2Ugd291bGQgY3JlYXRlCj4gYSB2ZXJ5IG9kZCBwc2V1ZG8tcmV2aXNpb24g
b2YgdGhlIHByb3RvY29sOiAyLjE1IHdpdGhvdXQgU0VUVVBfSU5ESVJFQ1QKPiBzdXBwb3J0LCBz
aG91bGQgcGF0Y2ggMy8zIGVuZCB1cCBnZXR0aW5nIHJldmVydGVkLgo+Cj4gKEl0IGlzIHBvc3Np
YmxlIHRvIGRldGVjdCwgb2YgY291cnNlLCBidXQgSSBmZWVsIHByZXR0eSBzdXJlIGluIHNheWlu
Zwo+IHRoYXQgYm9vdGxvYWRlcnMgd29uJ3QgZ2V0IGl0IHJpZ2h0LikKPgo+IE90aGVyIHRoYW4g
dGhhdDoKPgo+IFJldmlld2VkLWJ5OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3Iu
Y29tPgoKSSBoYXZlIGp1c3Qgc2VudCB2NS4gUGxlYXNlIHRha2UgYSBsb29rLgoKRGFuaWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
