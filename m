Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 406A2F1864
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 15:23:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSMAT-0007Yx-Qt; Wed, 06 Nov 2019 14:20:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xBt7=Y6=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iSMAS-0007Ys-N3
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 14:20:16 +0000
X-Inumbo-ID: 8cf1f4fa-00a0-11ea-a1ac-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cf1f4fa-00a0-11ea-a1ac-12813bfff9fa;
 Wed, 06 Nov 2019 14:20:15 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6EEDwW161104;
 Wed, 6 Nov 2019 14:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=rrAkTdNz7Asf7no6Ybvb6SVtWjYJTUrv+7pV2Vl0rHw=;
 b=YmoqQl8vfXth8Bh1nCPdOODImKHtKujTGqGXr1v62TxU6ojodvyNdamBEuVzcACSud46
 ehxJlWIyEBq9ayFjkxXRgl3QBht2PUI8JkkxH0qkoxMwaYciRDmQCot0rcheZz/quIU2
 QDX8/9M6lUXG005ztkh2lqzTGI0NCKeF2Nuy4y5MMip2RY+mc+IZC+PnI7xI64zgoNgF
 MnJ05KtzCWHNFcP/04n3QifgFY3sd4DQ5WoFEOwwccsfPpZXQPqYX3euNXyC75rGSRTx
 Ee01pEq4rrsOLGgDuelRBHTLannkyShQBx1pru7osccZadCvQZHSseqrbSDdj9V6aGK3 Aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2w12erefa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 14:20:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA6EEjln081627;
 Wed, 6 Nov 2019 14:20:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2w35pr3ce1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Nov 2019 14:20:12 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA6EKADv023582;
 Wed, 6 Nov 2019 14:20:10 GMT
Received: from localhost.localdomain (/209.6.36.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Nov 2019 06:20:09 -0800
Date: Wed, 6 Nov 2019 09:20:03 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191106142003.GA5520@localhost.localdomain>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
 <20191105194317.16232-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105194317.16232-2-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1911060141
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9432
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1911060141
Subject: Re: [Xen-devel] [PATCH 1/2] xen/livepatch: Add a return value to
 load hooks
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDc6NDM6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbmUgdXNlIG9mIGxvYWQgaG9va3MgaXMgdG8gcGVyZm9ybSBhIHNhZmV0eSBjaGVj
ayBvZiB0aGUgc3lzdGVtIGluIGl0cwo+IHF1aWVzY2VkIHN0YXRlLiAgQW55IG5vbi16ZXJvIHJl
dHVybiB2YWx1ZSBmcm9tIGEgbG9hZCBob29rIHdpbGwgYWJvcnQgdGhlCj4gYXBwbHkgYXR0ZW1w
dC4KPiAKClNob3VsZG4ndCB5b3UgYWxzbyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gKGRlc2ln
biBkb2M/KQoKVGhhbmtzLgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDQzogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBG
b3Igc2V2ZXJhbCB5ZWFycywgdGhlIGZvbGxvd2luZyBwYXRjaCBpbiB0aGUgc2VyaWVzIGhhcyBi
ZWVuIHNoaXBwZWQgaW4gZXZlcnkKPiBYZW5TZXJ2ZXIgbGl2ZXBhdGNoLCBpbXBsZW1lbnRlZCBh
cyBhIHZvaWQgbG9hZCBob29rIHdoaWNoIG1vZGlmaWVzIGl0cyByZXR1cm4KPiBhZGRyZXNzIHRv
IHNraXAgdG8gdGhlIGVuZCBvZiBhcHBseV9wYXlsb2FkKCkuICBUaGlzIG1ldGhvZCBpcyBkaXN0
aW5jdGx5IGxlc3MKPiBoYWNreS4KPiAtLS0KPiAgeGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAg
ICAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gIHhlbi9pbmNs
dWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oICB8ICAyICstCj4gIHhlbi90ZXN0L2xpdmVwYXRj
aC94ZW5faGVsbG9fd29ybGQuYyB8IDEyICsrKysrKysrKy0tLQo+ICAzIGZpbGVzIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL2xpdmVwYXRjaC5jIGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+IGluZGV4IDdjYWEz
MGMyMDIuLjk2MjY0NzYxNmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+
ICsrKyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKPiBAQCAtMTA3NiwyNSArMTA3NiwzMyBAQCBz
dGF0aWMgaW50IGFwcGx5X3BheWxvYWQoc3RydWN0IHBheWxvYWQgKmRhdGEpCj4gICAgICAgKiB0
ZW1wb3JhcmlseSBkaXNhYmxlIHRoZSBzcGluIGxvY2tzIElSUSBzdGF0ZSBjaGVja3MuCj4gICAg
ICAgKi8KPiAgICAgIHNwaW5fZGVidWdfZGlzYWJsZSgpOwo+IC0gICAgZm9yICggaSA9IDA7IGkg
PCBkYXRhLT5uX2xvYWRfZnVuY3M7IGkrKyApCj4gLSAgICAgICAgZGF0YS0+bG9hZF9mdW5jc1tp
XSgpOwo+ICsgICAgZm9yICggaSA9IDA7ICFyYyAmJiBpIDwgZGF0YS0+bl9sb2FkX2Z1bmNzOyBp
KysgKQo+ICsgICAgICAgIHJjID0gZGF0YS0+bG9hZF9mdW5jc1tpXSgpOwo+ICAgICAgc3Bpbl9k
ZWJ1Z19lbmFibGUoKTsKPiAgCj4gKyAgICBpZiAoIHJjICkKPiArICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBsb2FkX2Z1bmNzWyV1XSBmYWlsZWQ6ICVkXG4iLAo+ICsg
ICAgICAgICAgICAgICBkYXRhLT5uYW1lLCBpLCByYyk7Cj4gKwo+ICAgICAgQVNTRVJUKCFsb2Nh
bF9pcnFfaXNfZW5hYmxlZCgpKTsKPiAgCj4gLSAgICBmb3IgKCBpID0gMDsgaSA8IGRhdGEtPm5m
dW5jczsgaSsrICkKPiAtICAgICAgICBhcmNoX2xpdmVwYXRjaF9hcHBseSgmZGF0YS0+ZnVuY3Nb
aV0pOwo+ICsgICAgaWYgKCAhcmMgKQo+ICsgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgZGF0YS0+
bmZ1bmNzOyBpKysgKQo+ICsgICAgICAgICAgICBhcmNoX2xpdmVwYXRjaF9hcHBseSgmZGF0YS0+
ZnVuY3NbaV0pOwo+ICAKPiAgICAgIGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSgpOwo+ICAKPiAtICAg
IC8qCj4gLSAgICAgKiBXZSBuZWVkIFJDVSB2YXJpYW50ICh3aGljaCBoYXMgYmFycmllcnMpIGlu
IGNhc2Ugd2UgY3Jhc2ggaGVyZS4KPiAtICAgICAqIFRoZSBhcHBsaWVkX2xpc3QgaXMgaXRlcmF0
ZWQgYnkgdGhlIHRyYXAgY29kZS4KPiAtICAgICAqLwo+IC0gICAgbGlzdF9hZGRfdGFpbF9yY3Uo
JmRhdGEtPmFwcGxpZWRfbGlzdCwgJmFwcGxpZWRfbGlzdCk7Cj4gLSAgICByZWdpc3Rlcl92aXJ0
dWFsX3JlZ2lvbigmZGF0YS0+cmVnaW9uKTsKPiArICAgIGlmICggIXJjICkKPiArICAgIHsKPiAr
ICAgICAgICAvKgo+ICsgICAgICAgICAqIFdlIG5lZWQgUkNVIHZhcmlhbnQgKHdoaWNoIGhhcyBi
YXJyaWVycykgaW4gY2FzZSB3ZSBjcmFzaCBoZXJlLgo+ICsgICAgICAgICAqIFRoZSBhcHBsaWVk
X2xpc3QgaXMgaXRlcmF0ZWQgYnkgdGhlIHRyYXAgY29kZS4KPiArICAgICAgICAgKi8KPiArICAg
ICAgICBsaXN0X2FkZF90YWlsX3JjdSgmZGF0YS0+YXBwbGllZF9saXN0LCAmYXBwbGllZF9saXN0
KTsKPiArICAgICAgICByZWdpc3Rlcl92aXJ0dWFsX3JlZ2lvbigmZGF0YS0+cmVnaW9uKTsKPiAr
ICAgIH0KPiAgCj4gLSAgICByZXR1cm4gMDsKPiArICAgIHJldHVybiByYzsKPiAgfQo+ICAKPiAg
c3RhdGljIGludCByZXZlcnRfcGF5bG9hZChzdHJ1Y3QgcGF5bG9hZCAqZGF0YSkKPiBkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmggYi94ZW4vaW5jbHVkZS94
ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaAo+IGluZGV4IDRhMWE5NmQwNTQuLjM3ODhiNTJkZGYgMTAw
NjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2FkLmgKPiArKysgYi94
ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaAo+IEBAIC05LDcgKzksNyBAQAo+ICAg
KiBUaGUgZm9sbG93aW5nIGRlZmluaXRpb25zIGFyZSB0byBiZSB1c2VkIGluIHBhdGNoZXMuIFRo
ZXkgYXJlIHRha2VuCj4gICAqIGZyb20ga3BhdGNoLgo+ICAgKi8KPiAtdHlwZWRlZiB2b2lkIGxp
dmVwYXRjaF9sb2FkY2FsbF90KHZvaWQpOwo+ICt0eXBlZGVmIGludCBsaXZlcGF0Y2hfbG9hZGNh
bGxfdCh2b2lkKTsKPiAgdHlwZWRlZiB2b2lkIGxpdmVwYXRjaF91bmxvYWRjYWxsX3Qodm9pZCk7
Cj4gIAo+ICAvKgo+IGRpZmYgLS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2hlbGxvX3dv
cmxkLmMgYi94ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2hlbGxvX3dvcmxkLmMKPiBpbmRleCAwMmYz
Zjg1ZGMwLi5kNzIwMDAxZjA3IDEwMDY0NAo+IC0tLSBhL3hlbi90ZXN0L2xpdmVwYXRjaC94ZW5f
aGVsbG9fd29ybGQuYwo+ICsrKyBiL3hlbi90ZXN0L2xpdmVwYXRjaC94ZW5faGVsbG9fd29ybGQu
Ywo+IEBAIC0xNiw5ICsxNiwxMSBAQCBzdGF0aWMgY29uc3QgY2hhciBoZWxsb193b3JsZF9wYXRj
aF90aGlzX2ZuY1tdID0gInhlbl9leHRyYV92ZXJzaW9uIjsKPiAgZXh0ZXJuIGNvbnN0IGNoYXIg
Knhlbl9oZWxsb193b3JsZCh2b2lkKTsKPiAgc3RhdGljIHVuc2lnbmVkIGludCBjbnQ7Cj4gIAo+
IC1zdGF0aWMgdm9pZCBhcHBseV9ob29rKHZvaWQpCj4gK3N0YXRpYyBpbnQgYXBwbHlfaG9vayh2
b2lkKQo+ICB7Cj4gICAgICBwcmludGsoS0VSTl9ERUJVRyAiSG9vayBleGVjdXRpbmcuXG4iKTsK
PiArCj4gKyAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgcmV2ZXJ0X2hvb2so
dm9pZCkKPiBAQCAtMjYsMTAgKzI4LDE0IEBAIHN0YXRpYyB2b2lkIHJldmVydF9ob29rKHZvaWQp
Cj4gICAgICBwcmludGsoS0VSTl9ERUJVRyAiSG9vayB1bmxvYWRlZC5cbiIpOwo+ICB9Cj4gIAo+
IC1zdGF0aWMgdm9pZCAgaGlfZnVuYyh2b2lkKQo+ICtzdGF0aWMgaW50IGhpX2Z1bmModm9pZCkK
PiAgewo+ICAgICAgcHJpbnRrKEtFUk5fREVCVUcgIiVzOiBIaSEgKGNhbGxlZCAldSB0aW1lcylc
biIsIF9fZnVuY19fLCArK2NudCk7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gIH07Cj4gKy8qIFNh
ZmUgdG8gY2FzdCBhd2F5IHRoZSByZXR1cm4gdmFsdWUgZm9yIHRoaXMgdHJpdmlhbCBjYXNlLiAq
Lwo+ICt2b2lkICh2b2lkX2hpX2Z1bmMpKHZvaWQpIF9fYXR0cmlidXRlX18oKGFsaWFzKCJoaV9m
dW5jIikpKTsKPiAgCj4gIHN0YXRpYyB2b2lkIGNoZWNrX2ZuYyh2b2lkKQo+ICB7Cj4gQEAgLTQz
LDcgKzQ5LDcgQEAgTElWRVBBVENIX1VOTE9BRF9IT09LKHJldmVydF9ob29rKTsKPiAgLyogSW1i
YWxhbmNlIGhlcmUuIFR3byBsb2FkIGFuZCB0aHJlZSB1bmxvYWQuICovCj4gIAo+ICBMSVZFUEFU
Q0hfTE9BRF9IT09LKGhpX2Z1bmMpOwo+IC1MSVZFUEFUQ0hfVU5MT0FEX0hPT0soaGlfZnVuYyk7
Cj4gK0xJVkVQQVRDSF9VTkxPQURfSE9PSyh2b2lkX2hpX2Z1bmMpOwo+ICAKPiAgTElWRVBBVENI
X1VOTE9BRF9IT09LKGNoZWNrX2ZuYyk7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
