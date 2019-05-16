Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93EC20D47
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 18:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRJRi-0002YP-QZ; Thu, 16 May 2019 16:41:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qiPN=TQ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hRJRg-0002YK-W3
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 16:41:29 +0000
X-Inumbo-ID: 731086cd-77f9-11e9-8980-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 731086cd-77f9-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 16:41:27 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4GGSQmD057868;
 Thu, 16 May 2019 16:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=Wo5wYda75ksL2NofOW02eKT3Xmr2zJkxrf0wJOL9taM=;
 b=cZvj01Stv4nDLUMSfNxbpwkUZoylsA+Bg+KJUXTiv8S1L8U0N111hK18R0dlE2WN/e0/
 53qqR5PUOu9ZWjtb4hQq1AUFZ9dqYh4BWzmup2BX12vhQZDo3vTV9OfzXr7NZFboU8JU
 Oi66ontu3UINIzMh/dyg3sVD+bQabRXCpdfv3Ndp1mDbmukmlT1cCYt11ShVCdqSZ3zo
 GgXbZsDwOEXJZGvq2Covxcw0g+Z1mQKYq9YoH+WRIee26gh7A4eDGayrGHaL8FM3bsZd
 ASgNW+utiEl6KY0arcw5If3AejNdq96M+KzeI9RfotDgUjt8r+ZEOp7br+dlbMEe6213 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2sdq1qvnqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 16:41:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4GGfMSh177806;
 Thu, 16 May 2019 16:41:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2sggetsxsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 16:41:22 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4GGfLfJ010235;
 Thu, 16 May 2019 16:41:21 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 May 2019 16:41:20 +0000
To: Alexander Graf <graf@amazon.com>, "Sironi, Filippo" <sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-3-git-send-email-sironi@amazon.de>
 <f51a6a84-b21c-ab75-7e30-bfbe2ac6b98b@amazon.com>
 <7395EFE9-0B38-4B61-81D4-E8450561AABE@amazon.de>
 <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <3a9762a2-24e8-a842-862d-fadae563361d@oracle.com>
Date: Thu, 16 May 2019 12:40:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8c6a2de2-f080-aad5-16af-c4a5eafb31af@amazon.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9259
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905160105
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9259
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905160105
Subject: Re: [Xen-devel] [PATCH v2 2/2] KVM: x86: Implement the
 arch-specific hook to report the VM UUID
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
Cc: KVM list <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8xNi8xOSAxMTozMyBBTSwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4gT24gMTYuMDUuMTkg
MDg6MjUsIFNpcm9uaSwgRmlsaXBwbyB3cm90ZToKPj4+IE9uIDE2LiBNYXkgMjAxOSwgYXQgMTU6
NTYsIEdyYWYsIEFsZXhhbmRlciA8Z3JhZkBhbWF6b24uY29tPiB3cm90ZToKPj4+Cj4+PiBPbiAx
NC4wNS4xOSAwODoxNiwgRmlsaXBwbyBTaXJvbmkgd3JvdGU6Cj4+Pj4gT24geDg2LCB3ZSByZXBv
cnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlvbiAoaS5lLiwgRE1JIFR5cGUgMSkK
Pj4+PiBhcyBWTSBVVUlELgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkg
PHNpcm9uaUBhbWF6b24uZGU+Cj4+Pj4gLS0tCj4+Pj4gYXJjaC94ODYva2VybmVsL2t2bS5jIHwg
NyArKysrKysrCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYyBiL2FyY2gveDg2L2tlcm5lbC9rdm0u
Ywo+Pj4+IGluZGV4IDVjOTNhNjVlZTFlNS4uNDQxY2FiMDhhMDlkIDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+Pj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+
Pj4+IEBAIC0yNSw2ICsyNSw3IEBACj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4+
ICNpbmNsdWRlIDxsaW51eC9rdm1fcGFyYS5oPgo+Pj4+ICNpbmNsdWRlIDxsaW51eC9jcHUuaD4K
Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2RtaS5oPgo+Pj4+ICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+
Pj4+ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+Cj4+Pj4gI2luY2x1ZGUgPGxpbnV4L2hhcmRp
cnEuaD4KPj4+PiBAQCAtNjk0LDYgKzY5NSwxMiBAQCBib29sIGt2bV9wYXJhX2F2YWlsYWJsZSh2
b2lkKQo+Pj4+IH0KPj4+PiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcGFyYV9hdmFpbGFibGUpOwo+
Pj4+Cj4+Pj4gK2NvbnN0IGNoYXIgKmt2bV9wYXJhX2dldF91dWlkKHZvaWQpCj4+Pj4gK3sKPj4+
PiArCXJldHVybiBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9QUk9EVUNUX1VVSUQpOwo+Pj4gVGhp
cyBhZGRzIGEgbmV3IGRlcGVuZGVuY3kgb24gQ09ORklHX0RNSS4gUHJvYmFibHkgYmVzdCB0byBn
dWFyZCBpdCB3aXRoCj4+PiBhbiAjaWYgSVNfRU5BQkxFRChDT05GSUdfRE1JKS4KPj4+Cj4+PiBU
aGUgY29uY2VwdCBzZWVtcyBzb3VuZCB0aG91Z2guCj4+Pgo+Pj4gQWxleAo+PiBpbmNsdWRlL2xp
bnV4L2RtaS5oIGNvbnRhaW5zIGEgZHVtbXkgaW1wbGVtZW50YXRpb24gb2YKPj4gZG1pX2dldF9z
eXN0ZW1faW5mbyB0aGF0IHJldHVybnMgTlVMTCBpZiBDT05GSUdfRE1JIGlzbid0IGRlZmluZWQu
Cj4KPiBPaCwgSSBtaXNzZWQgdGhhdCBiaXQuIEF3ZXNvbWUhIExlc3Mgd29yayA6KS4KPgo+Cj4+
IFRoaXMgaXMgZW5vdWdoIHVubGVzcyB3ZSBkZWNpZGUgdG8gcmV0dXJuICI8ZGVuaWVkPiIgbGlr
ZSBpbiBYZW4uCj4+IElmIHRoZW4sIHdlIGNhbiBoYXZlIHRoZSBjaGVjayBpbiB0aGUgZ2VuZXJp
YyBjb2RlIHRvIHR1cm4gTlVMTAo+PiBpbnRvICI8ZGVuaWVkPiIuCj4KPiBZZXMuIFdhaXRpbmcg
Zm9yIHNvbWVvbmUgZnJvbSBYZW4gdG8gYW5zd2VyIHRoaXMgOikKCk5vdCBzdXJlIEkgYW0gYW5z
d2VyaW5nIHlvdXIgcXVlc3Rpb24gYnV0IG9uIFhlbiB3ZSByZXR1cm4gVVVJRCB2YWx1ZQp6ZXJv
IGlmIGFjY2VzcyBwZXJtaXNzaW9ucyBhcmUgbm90IHN1ZmZpY2llbnQuIE5vdCA8ZGVuaWVkPi4K
Cmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2Nv
bW1vbi9rZXJuZWwuYztoPTYxMjU3NTQzMGYxY2U3ZmFmNWJkNjZlN2E5OWYxNzU4YzYzZmIzY2I7
aGI9SEVBRCNsNTA2CgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
