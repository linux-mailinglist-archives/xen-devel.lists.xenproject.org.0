Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE58115828
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 21:18:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idK1b-00056z-Fw; Fri, 06 Dec 2019 20:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HeIL=Z4=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1idK1Z-00056u-Bm
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 20:16:25 +0000
X-Inumbo-ID: 46675412-1865-11ea-8432-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46675412-1865-11ea-8432-12813bfff9fa;
 Fri, 06 Dec 2019 20:16:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB6KEWgG114752;
 Fri, 6 Dec 2019 20:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=p/YTvvom34GtZZcvXS0gonfPUVStG0D6uk5Y6bPRAes=;
 b=kub5IABHD+tSbALFLNrsiqhjdr1mi4Msoy8ONy7ep/SwgEG+Re0vXFbmngyYj2/tF1i+
 hl1+7w/UmSEoZMun820740k6ixBjWH0GBm84WE6hHWYzSsOhUh+pbq1yg7pUtxpjALNW
 RSxTesMn5RMu/XHHKLQL9um024uBvensBIKgtjJqSUKs6aRm7guJH/+7VBPll/IVd9FR
 LyL2qBVdGfQC3wf5ohJdY2YU3yZZ7Ql05G/uFKznm0JIWvnn99BUviNtVoUnzIRo77Gk
 uaFbIFIVcDE6KykJp+C6zbmIOWu4T6htrBQkbXz3027YDwsrjsZj6cfMWWBQDfb+auHz WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2wkh2rx3rv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 20:16:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB6K9O0n145755;
 Fri, 6 Dec 2019 20:16:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2wqt45atmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Dec 2019 20:16:20 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB6KGJPs030735;
 Fri, 6 Dec 2019 20:16:19 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 06 Dec 2019 12:16:19 -0800
To: "Nuernberger, Stefan" <snu@amazon.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191206134804.4537-1-snu@amazon.com>
 <9917a357-12f6-107f-e08d-33e464036317@oracle.com>
 <1575655787.7257.42.camel@amazon.de>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <4bc83b82-427f-2215-3161-5776867675a1@oracle.com>
Date: Fri, 6 Dec 2019 15:15:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1575655787.7257.42.camel@amazon.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9463
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912060161
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9463
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912060162
Subject: Re: [Xen-devel] [PATCH] xen/pciback: Prevent NULL pointer
 dereference in quirks_show
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>, "Seidel,
 Conny" <consei@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Dannowski,
 Uwe" <uwed@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNi8xOSAxOjA5IFBNLCBOdWVybmJlcmdlciwgU3RlZmFuIHdyb3RlOgo+IE9uIEZyaSwg
MjAxOS0xMi0wNiBhdCAxMDoxMSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAx
Mi82LzE5IDg6NDggQU0sIFN0ZWZhbiBOdWVybmJlcmdlciB3cm90ZToKPj4+IEZyb206IFV3ZSBE
YW5ub3dza2kgPHV3ZWRAYW1hem9uLmRlPgo+Pj4KPj4+IFJlYWRpbmcgL3N5cy9idXMvcGNpL2Ry
aXZlcnMvcGNpYmFjay9xdWlya3Mgd2hpbGUgdW5iaW5kaW5nIGNhbgo+Pj4gcmVzdWx0Cj4+PiBp
biBkZXJlZmVyZW5jaW5nIGEgTlVMTCBwb2ludGVyLiBJbnN0ZWFkLCBza2lwIHByaW50aW5nIGlu
Zm9ybWF0aW9uCj4+PiBhYm91dCB0aGUgZGFuZ2xpbmcgcXVpcmsuCj4+Pgo+Pj4gUmVwb3J0ZWQt
Ynk6IENvbm55IFNlaWRlbCA8Y29uc2VpQGFtYXpvbi5kZT4KPj4+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBEYW5ub3dza2kgPHV3ZWRAYW1hem9uLmRlPgo+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIE51
ZXJuYmVyZ2VyIDxzbnVAYW1hem9uLmNvbT4KPj4+Cj4+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCj4+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+Pj4gLS0tCj4+PiDC
oGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgfCAyICsrCj4+PiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
eGVuLXBjaWJhY2svcGNpX3N0dWIuYyBiL2RyaXZlcnMveGVuL3hlbi0KPj4+IHBjaWJhY2svcGNp
X3N0dWIuYwo+Pj4gaW5kZXggMDk3NDEwYTdjZGI3Li5kYTcyNWU0NzQyOTQgMTAwNjQ0Cj4+PiAt
LS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCj4+PiArKysgYi9kcml2ZXJz
L3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCj4+PiBAQCAtMTM0Niw2ICsxMzQ2LDggQEAgc3Rh
dGljIHNzaXplX3QgcXVpcmtzX3Nob3coc3RydWN0Cj4+PiBkZXZpY2VfZHJpdmVyICpkcnYsIGNo
YXIgKmJ1ZikKPj4+IMKgCQkJCcKgwqDCoHF1aXJrLT5kZXZpZC5zdWJkZXZpY2UpOwo+Pj4gwqAK
Pj4+IMKgCQlkZXZfZGF0YSA9IHBjaV9nZXRfZHJ2ZGF0YShxdWlyay0+cGRldik7Cj4+PiArCQlp
ZiAoIWRldl9kYXRhKQo+Pj4gKwkJCWNvbnRpbnVlOwo+Pj4gwqAKPj4+IMKgCQlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGNmZ19lbnRyeSwgJmRldl9kYXRhLQo+Pj4+IGNvbmZpZ19maWVsZHMsIGxpc3Qp
IHsKPj4gQ291bGRuJ3QgeW91IGhhdmUgdGhlIHNhbWUgcmFjZSBoZXJlPwo+IE5vdCBxdWl0ZSB0
aGUgc2FtZSwgYnV0IGl0IG1pZ2h0IG5vdCBiZSBlbnRpcmVseSBzYWZlIHlldC4gVGhlCj4gJ3F1
aXJrc19zaG93JyB0YWtlcyB0aGUgJ2RldmljZV9pZHNfbG9jaycgYW5kIHJhY2VzIHdpdGggdW5i
aW5kIC8KPiAncGNpc3R1Yl9kZXZpY2VfcmVsZWFzZScgIndoaWNoIHRha2VzIGRldmljZV9sb2Nr
IG11dGV4Ii4gU28gdGhpcyBtaWdodAo+IG5vdyBiZSBhIFVBRiByZWFkIGFjY2VzcyBpbnN0ZWFk
IG9mIGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLgoKWWVzLCB0aGF0J3Mgd2hhdCBJIG1lYW50
IChhbHRob3VnaCBJIGRvbid0IHNlZSBtdWNoIGRpZmZlcmVuY2UgaW4gdGhpcwpjb250ZXh0KS4K
Cj4gIFdlIGhhdmUKPiBub3Qgb2JzZXJ2ZWQgYWR2ZXJzYXJpYWwgZWZmZWN0cyBpbiBvdXIgdGVz
dGluZyAoY29tcGFyZWQgdG8gdGhlCj4gb2J2aW91cyBpc3N1ZXMgd2l0aCBOVUxMIHBvaW50ZXIp
IGJ1dCB0aGF0J3Mgbm90IGEgZ3VhcmFudGVlIG9mIGNvdXJzZS4KPgo+IFNvIHNob3VsZCBxdWly
a3Nfc2hvdyBhY3R1YWxseSBiZSBwcm90ZWN0ZWQgYnkgcGNpc3R1Yl9kZXZpY2VzX2xvY2sKPiBp
bnN0ZWFkIGFzIGFyZSBvdGhlciBmdW5jdGlvbnMgdGhhdCBhY2Nlc3MgZGV2X2RhdGE/IERvZXMg
aXQgbmVlZCBib3RoCj4gbG9ja3MgaW4gdGhhdCBjYXNlPwoKZGV2aWNlX2lkc19sb2NrIHByb3Rl
Y3RzIGRldmljZV9pZHMgbGlzdCwgd2hpY2ggaXMgbm90IHdoYXQgeW91IGFyZQp0cnlpbmcgdG8g
YWNjZXNzLCBzbyB0aGF0IGRvZXNuJ3QgbG9vayBsaWtlIHJpZ2h0IGxvY2sgdG8gaG9sZC4gQW5k
CkFGQUlDVCBwY2lzdHViX2RldmljZXNfbG9jayBpcyBub3QgaGVsZCB3aGVuIGRldmljZSBkYXRh
IGlzIGNsZWFyZWQgaW4KcGNpc3R1Yl9kZXZpY2VfcmVsZWFzZSgpICh3aGljaCBJIHRoaW5rIGlz
IHdoZXJlIHdlIGFyZSByYWNpbmcpLgoKLWJvcmlzCgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
