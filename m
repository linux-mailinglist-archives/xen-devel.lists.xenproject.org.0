Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A002FF52FF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 18:55:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT8QF-0002aV-3v; Fri, 08 Nov 2019 17:51:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6rQo=ZA=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iT8QD-0002aP-JC
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 17:51:45 +0000
X-Inumbo-ID: 6d1059c2-0250-11ea-a1d5-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d1059c2-0250-11ea-a1d5-12813bfff9fa;
 Fri, 08 Nov 2019 17:51:44 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8HiwZm014462;
 Fri, 8 Nov 2019 17:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=4Q2vomyu+V+7z2hBJhsgNNxnF7tgvfliPxyAg4JvbaI=;
 b=P75o1dUeVQpUQvJkFYjzvxkqVtM4qRYEjX1gb8iSRp3vrTquias3TZMQfUD54bMChKnQ
 waSJRCe5za8eVE6031woDAqxBpGKNgrZLiZSPDPsEBOCuTrZHyX6+n6gc+vlnfXaGhP/
 8sNcJiru1UQlp5TPoKP6k7na9yjUnRJ24/BVkHhxNp2bWOFYKzI+DhOZ4ccYsvxip0UT
 PUwUVBiNgnmtETF4jBR5xgh89rvlD7vVUotbo2kUNOJ7XTsPbMOchWRI0PdIiHeQvsyK
 HNGXcdHZ7suV67THTpRKQ/kkJDrhCt2VSExZu2XhJBYZhw+UpVndpesk5uz+VBUdvmJj hw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2w41w16t03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 17:51:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8HnDQH100789;
 Fri, 8 Nov 2019 17:51:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2w50m5tqx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 17:51:34 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA8HpWC0021238;
 Fri, 8 Nov 2019 17:51:32 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Nov 2019 09:51:31 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 6DC986A0107; Fri,  8 Nov 2019 12:54:56 -0500 (EST)
Date: Fri, 8 Nov 2019 12:54:56 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191108175456.GH3220@char.us.oracle.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080174
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080174
Subject: Re: [Xen-devel] [PATCH v2] build: provide option to disambiguate
 symbol names
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTI6MTg6NDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIC5maWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29t
cGlsZXIgZG8gbm90IGluY2x1ZGUKPiBhbnkgcGF0aCBjb21wb25lbnRzIChnY2MpIG9yIGp1c3Qg
dGhlIG9uZXMgc3BlY2lmaWVkIG9uIHRoZSBjb21tYW5kIGxpbmUKPiAoY2xhbmcsIGF0IGxlYXN0
IHZlcnNpb24gNSksIGFuZCBoZW5jZSBtdWx0aXBsZSBpZGVudGljYWxseSBuYW1lZCBzb3VyY2UK
PiBmaWxlcyAoaW4gZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxs
eSBuYW1lZCBzdGF0aWMKPiBzeW1ib2xzIChpbiB0aGVpciBrYWxsc3ltcyByZXByZXNlbnRhdGlv
bikuIFRoZSBiaW5hcnkgZGlmZmluZyBhbGdvcml0aG0KPiB1c2VkIGJ5IHhlbi1saXZlcGF0Y2gs
IGhvd2V2ZXIsIGRlcGVuZHMgb24gaGF2aW5nIHVuaXF1ZSBzeW1ib2xzLgo+IAo+IE1ha2UgdGhl
IEVORk9SQ0VfVU5JUVVFX1NZTUJPTFMgS2NvbmZpZyBvcHRpb24gY29udHJvbCB0aGUgKGJ1aWxk
KQo+IGJlaGF2aW9yLCBhbmQgaWYgZW5hYmxlZCB1c2Ugb2JqY29weSB0byBwcmVwZW5kIHRoZSAo
cmVsYXRpdmUgdG8gdGhlCj4geGVuLyBzdWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVy
IGludm9rZWQgU1RUX0ZJTEUgc3ltYm9scy4gTm90ZQo+IHRoYXQgdGhpcyBidWlsZCBvcHRpb24g
aXMgbWFkZSBubyBsb25nZXIgZGVwZW5kIG9uIExJVkVQQVRDSCwgYnV0IG1lcmVseQo+IGRlZmF1
bHRzIHRvIGl0cyBzZXR0aW5nIG5vdy4KPiAKPiBDb25kaXRpb25hbGl6ZSBleHBsaWNpdCAuZmls
ZSBkaXJlY3RpdmUgaW5zZXJ0aW9uIGluIEMgZmlsZXMgd2hlcmUgaXQKPiBleGlzdHMganVzdCB0
byBkaXNhbWJpZ3VhdGUgbmFtZXMgaW4gYSBsZXNzIGdlbmVyaWMgbWFubmVyOyBub3RlIHRoYXQK
PiBhdCB0aGUgc2FtZSB0aW1lIHRoZSByZWR1bmRhbnQgZW1pc3Npb24gb2YgU1RUX0ZJTEUgc3lt
Ym9scyBnZXRzCj4gc3VwcHJlc3NlZCBmb3IgY2xhbmcuIEFzc2VtYmxlciBmaWxlcyBhcyB3ZWxs
IGFzIG11bHRpcGx5IGNvbXBpbGVkIEMKPiBvbmVzIHVzaW5nIF9fT0JKRUNUX0ZJTEVfXyBhcmUg
bGVmdCBhbG9uZSBmb3IgdGhlIHRpbWUgYmVpbmcuCj4gCj4gU2luY2Ugd2Ugbm93IGV4cGVjdCB0
aGVyZSBub3QgdG8gYmUgYW55IGR1cGxpY2F0ZXMgYW55bW9yZSwgYWxzbyBkb24ndAo+IGZvcmNl
IHRoZSBzZWxlY3Rpb24gb2YgdGhlIG9wdGlvbiB0byAnbicgYW55bW9yZSBpbiBhbGxyYW5kb20u
Y29uZmlnLgo+IFNpbWlsYXJseSBDT1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3NlcyBkdXBsaWNh
dGUgc3ltYm9sIHdhcm5pbmdzIGlmCj4gZW5mb3JjZW1lbnQgaXMgaW4gZWZmZWN0LCB3aGljaCBp
biB0dXJuIGFsbG93cwo+IFNVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MgdG8gc2lt
cGx5IGRlcGVuZCBvbgo+ICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cgo+IC0tLQo+IHYyOiBSZS1iYXNl
LiBDb25kaXRpb25hbGl6ZSBDT1ZFUkFHRSdzIHNlbGVjdC4KPiAKPiBUaGUgY2xhbmcgYmVoYXZp
b3IgbWF5IHJlcXVpcmUgZnVydGhlciB0d2Vha2luZyBpZiBkaWZmZXJlbnQgdmVyc2lvbnMKPiBi
ZWhhdmUgZGlmZmVyZW50bHkuIEFsdGVybmF0aXZlbHkgd2UgY291bGQgcGFzcyB0d28gLS1yZWRl
ZmluZS1zeW0KPiBhcmd1bWVudHMgdG8gb2JqY29weS4KPiAKPiAtLS0gYS94ZW4vS2NvbmZpZy5k
ZWJ1Zwo+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVnCj4gQEAgLTM4LDcgKzM4LDcgQEAgY29uZmln
IEZSQU1FX1BPSU5URVIKPiAgY29uZmlnIENPVkVSQUdFCj4gIAlib29sICJDb2RlIGNvdmVyYWdl
IHN1cHBvcnQiCj4gIAlkZXBlbmRzIG9uICFMSVZFUEFUQ0gKPiAtCXNlbGVjdCBTVVBQUkVTU19E
VVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTCj4gKwlzZWxlY3QgU1VQUFJFU1NfRFVQTElDQVRFX1NZ
TUJPTF9XQVJOSU5HUyBpZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+ICAJLS0taGVscC0tLQo+
ICAJICBFbmFibGUgY29kZSBjb3ZlcmFnZSBzdXBwb3J0Lgo+ICAKPiAtLS0gYS94ZW4vUnVsZXMu
bWsKPiArKysgYi94ZW4vUnVsZXMubWsKPiBAQCAtMTk0LDEyICsxOTQsMjQgQEAgRk9SQ0U6Cj4g
IAo+ICAuUEhPTlk6IGNsZWFuCj4gIGNsZWFuOjogJChhZGRwcmVmaXggX2NsZWFuXywgJChzdWJk
aXItYWxsKSkKPiAtCXJtIC1mICoubyAqfiBjb3JlICQoREVQU19STSkKPiArCXJtIC1mICoubyAu
Ki5vLnRtcCAqfiBjb3JlICQoREVQU19STSkKPiAgX2NsZWFuXyUvOiBGT1JDRQo+ICAJJChNQUtF
KSAtZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DICQqIGNsZWFuCj4gIAo+ICtTUkNQQVRIIDo9ICQo
cGF0c3Vic3QgJChCQVNFRElSKS8lLCUsJChDVVJESVIpKQo+ICsKPiAgJS5vOiAlLmMgTWFrZWZp
bGUKPiAraWZlcSAoJChDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUykseSkKPiArCSQoQ0Mp
ICQoQ0ZMQUdTKSAtYyAkPCAtbyAkKEBEKS8uJChARikudG1wCj4gK2lmZXEgKCQoY2xhbmcpLHkp
Cj4gKwkkKE9CSkNPUFkpIC0tcmVkZWZpbmUtc3ltICQ8PSQoU1JDUEFUSCkvJDwgJChARCkvLiQo
QEYpLnRtcCAkQAo+ICtlbHNlCj4gKwkkKE9CSkNPUFkpIC0tcmVkZWZpbmUtc3ltICQoPEYpPSQo
U1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRtcCAkQAo+ICtlbmRpZgo+ICsJcm0gLWYgJChARCkv
LiQoQEYpLnRtcAo+ICtlbHNlCj4gIAkkKENDKSAkKENGTEFHUykgLWMgJDwgLW8gJEAKPiArZW5k
aWYKPiAgCj4gICUubzogJS5TIE1ha2VmaWxlCj4gIAkkKENDKSAkKEFGTEFHUykgLWMgJDwgLW8g
JEAKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L2NvbXBhdC5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L3g4Nl82NC9jb21wYXQuYwo+IEBAIC0yLDcgKzIsNyBAQAo+ICAgKiBjb21wYXQuYwo+ICAg
Ki8KPiAgCj4gLWFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJcIiIpOwo+ICtFTUlUX0ZJTEU7Cj4g
IAo+ICAjaW5jbHVkZSA8eGVuL2h5cGVyY2FsbC5oPgo+ICAjaW5jbHVkZSA8Y29tcGF0L3hlbi5o
Pgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94
ODZfNjQvbW0uYwo+IEBAIC0xNiw3ICsxNiw3IEBACj4gICAqIHdpdGggdGhpcyBwcm9ncmFtOyBJ
ZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4gICAqLwo+ICAKPiAt
YXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAgCj4gICNpbmNs
dWRlIDx4ZW4vbGliLmg+Cj4gICNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni94ODZfNjQvcGh5c2Rldi5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9waHlzZGV2
LmMKPiBAQCAtMiw3ICsyLDcgQEAKPiAgICogcGh5c2Rldi5jCj4gICAqLwo+ICAKPiAtYXNtKCIu
ZmlsZSBcIiIgX19GSUxFX18gIlwiIik7Cj4gK0VNSVRfRklMRTsKPiAgCj4gICNpbmNsdWRlIDx4
ZW4vdHlwZXMuaD4KPiAgI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KPiAtLS0gYS94ZW4v
YXJjaC94ODYveDg2XzY0L3BsYXRmb3JtX2h5cGVyY2FsbC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYwo+IEBAIC0yLDcgKzIsNyBAQAo+ICAgKiBwbGF0
Zm9ybV9oeXBlcmNhbGwuYwo+ICAgKi8KPiAgCj4gLWFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJc
IiIpOwo+ICtFTUlUX0ZJTEU7Cj4gIAo+ICAjaW5jbHVkZSA8eGVuL2xpYi5oPgo+ICAjaW5jbHVk
ZSA8Y29tcGF0L3BsYXRmb3JtLmg+Cj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4gKysrIGIv
eGVuL2NvbW1vbi9LY29uZmlnCj4gQEAgLTM3Myw4ICszNzMsNyBAQCBjb25maWcgRkFTVF9TWU1C
T0xfTE9PS1VQCj4gIAo+ICBjb25maWcgRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+ICAJYm9vbCAi
RW5mb3JjZSB1bmlxdWUgc3ltYm9scyIKPiAtCWRlZmF1bHQgeQo+IC0JZGVwZW5kcyBvbiBMSVZF
UEFUQ0gKPiArCWRlZmF1bHQgTElWRVBBVENICj4gIAktLS1oZWxwLS0tCj4gIAkgIE11bHRpcGxl
IHN5bWJvbHMgd2l0aCB0aGUgc2FtZSBuYW1lIGFyZW4ndCBnZW5lcmFsbHkgYSBwcm9ibGVtCj4g
IAkgIHVubGVzcyBsaXZlcGF0Y2hpbmcgaXMgdG8gYmUgdXNlZC4KPiBAQCAtMzg3LDggKzM4Niw4
IEBAIGNvbmZpZyBFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4gIAkgIGxpdmVwYXRjaCBidWlsZCBh
bmQgYXBwbHkgY29ycmVjdGx5Lgo+ICAKPiAgY29uZmlnIFNVUFBSRVNTX0RVUExJQ0FURV9TWU1C
T0xfV0FSTklOR1MKPiAtCWJvb2wgIlN1cHByZXNzIGR1cGxpY2F0ZSBzeW1ib2wgd2FybmluZ3Mi
IGlmICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4gLQlkZWZhdWx0IHkgaWYgIUVORk9SQ0VfVU5J
UVVFX1NZTUJPTFMKPiArCWJvb2wgIlN1cHByZXNzIGR1cGxpY2F0ZSBzeW1ib2wgd2FybmluZ3Mi
Cj4gKwlkZXBlbmRzIG9uICFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCj4gIAktLS1oZWxwLS0tCj4g
IAkgIE11bHRpcGxlIHN5bWJvbHMgd2l0aCB0aGUgc2FtZSBuYW1lIGFyZW4ndCBnZW5lcmFsbHkg
YSBwcm9ibGVtCj4gIAkgIHVubGVzcyBMaXZlIHBhdGNoaW5nIGlzIHRvIGJlIHVzZWQsIHNvIHRo
ZXNlIHdhcm5pbmdzIGNhbiBiZQo+IC0tLSBhL3hlbi9jb21tb24vY29tcGF0L2RvbWFpbi5jCj4g
KysrIGIveGVuL2NvbW1vbi9jb21wYXQvZG9tYWluLmMKPiBAQCAtMyw3ICszLDcgQEAKPiAgICoK
PiAgICovCj4gIAo+IC1hc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKPiArRU1JVF9GSUxF
Owo+ICAKPiAgI2luY2x1ZGUgPHhlbi9saWIuaD4KPiAgI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+
IC0tLSBhL3hlbi9jb21tb24vY29tcGF0L2tlcm5lbC5jCj4gKysrIGIveGVuL2NvbW1vbi9jb21w
YXQva2VybmVsLmMKPiBAQCAtMiw3ICsyLDcgQEAKPiAgICoga2VybmVsLmMKPiAgICovCj4gIAo+
IC1hc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKPiArRU1JVF9GSUxFOwo+ICAKPiAgI2lu
Y2x1ZGUgPHhlbi9pbml0Lmg+Cj4gICNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4gLS0tIGEveGVuL2Nv
bW1vbi9jb21wYXQvbWVtb3J5LmMKPiArKysgYi94ZW4vY29tbW9uL2NvbXBhdC9tZW1vcnkuYwo+
IEBAIC0xLDQgKzEsNCBAQAo+IC1hc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKPiArRU1J
VF9GSUxFOwo+ICAKPiAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ICAjaW5jbHVkZSA8eGVuL2h5
cGVyY2FsbC5oPgo+IC0tLSBhL3hlbi9jb21tb24vY29tcGF0L211bHRpY2FsbC5jCj4gKysrIGIv
eGVuL2NvbW1vbi9jb21wYXQvbXVsdGljYWxsLmMKPiBAQCAtMiw3ICsyLDcgQEAKPiAgICogbXVs
dGljYWxsLmMKPiAgICovCj4gIAo+IC1hc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKPiAr
RU1JVF9GSUxFOwo+ICAKPiAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+ICAjaW5jbHVkZSA8eGVu
L211bHRpY2FsbC5oPgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaAo+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9jb25maWcuaAo+IEBAIC0xMSw3ICsxMSwxNSBAQAo+ICAKPiAgI2lmbmRl
ZiBfX0FTU0VNQkxZX18KPiAgI2luY2x1ZGUgPHhlbi9jb21waWxlci5oPgo+ICsKPiArI2lmIGRl
ZmluZWQoQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFMpIHx8IGRlZmluZWQoX19jbGFuZ19f
KQo+ICsjIGRlZmluZSBFTUlUX0ZJTEUgYXNtICggIiIgKQo+ICsjZWxzZQo+ICsjIGRlZmluZSBF
TUlUX0ZJTEUgYXNtICggIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiICkKPiArI2VuZGlmCj4gKwo+
ICAjZW5kaWYKPiArCj4gICNpbmNsdWRlIDxhc20vY29uZmlnLmg+Cj4gIAo+ICAjZGVmaW5lIEVY
UE9SVF9TWU1CT0wodmFyKQo+IC0tLSBhL3hlbi90b29scy9rY29uZmlnL2FsbHJhbmRvbS5jb25m
aWcKPiArKysgYi94ZW4vdG9vbHMva2NvbmZpZy9hbGxyYW5kb20uY29uZmlnCj4gQEAgLTIsNCAr
MiwzIEBACj4gIAo+ICBDT05GSUdfR0NPVl9GT1JNQVRfQVVUT0RFVEVDVD15Cj4gIENPTkZJR19V
QlNBTj1uCj4gLUNPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTPW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
