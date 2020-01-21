Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B1414462B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:02:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0b9-0005D9-Sa; Tue, 21 Jan 2020 20:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m9h7=3K=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1iu0b8-0005D2-02
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 20:58:06 +0000
X-Inumbo-ID: b3397b20-3c90-11ea-9fd7-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3397b20-3c90-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 20:57:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00LKi8uf106524;
 Tue, 21 Jan 2020 20:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=sQIpcY1y8JQiBv7GeVpp3LwGOCapV6OOv7DeFWTBAfQ=;
 b=aKmqpYT7BUOuZTD7vBxNzJ4pbw0wuv0Q5wurb41650FsEW53wOm+Eqd9EVscpiK0wO2E
 hhYoqGY0BRrdQlRal64e108xZYtPLzh54XLBlzFDJSnSAx/SR6Y5diLkNoQqxihc7FO0
 gglrNXodwrMDkb9iCaK0xO9ricAsxH/Y4UeQvsetw9QPgeOAy0Rn4bHPt2cOQ4EnvViH
 zJGt1HYz6HVh1bpgiscKoz22xM8QUHZzFXUGKah/4RJkcDHXWUHOQWC1m9OJauXZFF5F
 LvlrB+AwcWUnpijR3rY3th6qwk7ovJd96D/w3u/3ThgvRppWs98QK4lrzKO4956hgbpG ZA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2xktnr7kv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 20:57:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00LKiKor059737;
 Tue, 21 Jan 2020 20:57:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2xnsa9d930-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 20:57:52 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00LKvoR0004213;
 Tue, 21 Jan 2020 20:57:50 GMT
Received: from Konrads-MacBook-Pro.local (/10.74.98.244)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 21 Jan 2020 12:57:50 -0800
Date: Tue, 21 Jan 2020 15:57:47 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200121205747.GE75374@Konrads-MacBook-Pro.local>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
 <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
 <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
 <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3f0f684-2520-e7de-870a-7d7be40f66b2@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001210156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001210156
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTA6Mjc6NDdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAwMDo1MCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gPiBPbiAy
MC4wMS4yMCAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gT24gMTcuMDEuMjAyMCAyMDow
NiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gPj4+IE9uIDIwLjEyLjE5IDEwOjUzLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+Pj4+IE9uIDE5LjEyLjIwMTkgMjI6MDgsIEVzbGFtIEVsbmlrZXR5IHdy
b3RlOgo+ID4+Pj4+IE9uIDE4LjEyLjE5IDEyOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4+
Pj4gT24gMTguMTIuMjAxOSAwMjozMiwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gPj4+Pj4+PiBE
ZWNvdXBsZSB0aGUgbWljcm9jb2RlIHJlZmVyZW5jaW5nIG1lY2hhbmlzbSB3aGVuIHVzaW5nIEdS
VUIgdG8gdGhhdAo+ID4+Pj4+Pj4gd2hlbiB1c2luZyBFRkkuIFRoaXMgYWxsb3dzIHVzIHRvIGF2
b2lkIHRoZSAidW5zcGVjaWZpZWQgZWZmZWN0IiBvZgo+ID4+Pj4+Pj4gdXNpbmcgYDxpbnRlZ2Vy
PiB8IHNjYW5gIGFsb25nIHhlbi5lZmkuCj4gPj4+Pj4+Cj4gPj4+Pj4+IEkgZ3Vlc3MgInVuc3Bl
Y2lmaWVkIGVmZmVjdCIgaW4gdGhlIGRvYyB3YXMgcHJldHR5IHBvaW50bGVzcyAtIHN1Y2gKPiA+
Pj4+Pj4gb3B0aW9ucyBoYXZlIGJlZW4gaWdub3JlZCBiZWZvcmU7IGluIGZhY3QgLi4uCj4gPj4+
Pj4+Cj4gPj4+Pj4+PiBXaXRoIHRoYXQsIFhlbiBjYW4gZXhwbGljaXRseQo+ID4+Pj4+Pj4gaWdu
b3JlIHRob3NlIG5hbWVkIG9wdGlvbnMgd2hlbiB1c2luZyBFRkkuCj4gPj4+Pj4+Cj4gPj4+Pj4+
IC4uLiBJIGRvbid0IHNlZSB0aGluZ3MgYmVjb21pbmcgYW55IG1vcmUgZXhwbGljaXQgKG5vdCBl
dmVuIHBhcnNpbmcKPiA+Pj4+Pj4gdGhlIG9wdGlvbnMgd2FzIHF1aXRlIGV4cGxpY2l0IHRvIG1l
KS4KPiA+Pj4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+IEkgYWdyZWUgdGhhdCB0aG9zZSBvcHRpb25zIGhh
dmUgYmVlbiBpZ25vcmVkIHNvIGZhciBpbiB0aGUgY2FzZSBvZiBFRkkuCj4gPj4+Pj4gVGhlIGRv
Y3VtZW50YXRpb24gY29udHJhZGljdHMgdGhhdCBob3dldmVyLiBUaGUgZG9jdW1lbnRhdGlvbjoK
PiA+Pj4+PiAqIHNheXMgPGludGVnZXI+IGhhcyB1bnNwZWNpZmllZCBlZmZlY3QuCj4gPj4+Pj4g
KiBkb2VzIG5vdCBtZW50aW9uIGFueXRoaW5nIGFib3V0IHNjYW4gYmVpbmcgaWdub3JlZC4KPiA+
Pj4+Pgo+ID4+Pj4+IFdpdGggdGhpcyBwYXRjaCwgaXQgaXMgZXhwbGljaXQgaW4gY29kZSBhbmQg
aW4gZG9jdW1lbnRhdGlvbiB0aGF0IGJvdGgKPiA+Pj4+PiBvcHRpb25zIGFyZSBpZ25vcmVkIGlu
IGNhc2Ugb2YgRUZJLgo+ID4+Pj4KPiA+Pj4+IEJ1dCBpc24ndCBpdCByYXRoZXIgdGhhdCB1Y29k
ZT1zY2FuIGNvdWxkIChhbmQgaGVuY2UgcGVyaGFwcyBzaG91bGQpCj4gPj4+PiBhbHNvIGhhdmUg
aXRzIHZhbHVlIG9uIEVGST8KPiA+Pj4+Cj4gPj4+Cj4gPj4+IEkgZG8gbm90IHNlZSAidWNvZGU9
c2NhbiIgYXBwbGljYWJsZSBpbiBhbnl3YXkgaW4gdGhlIGNhc2Ugb2YgRUZJLiBJbgo+ID4+PiBF
RkksIHRoZXJlIGFyZSBub3QgIm1vZHVsZXMiIHRvIHNjYW4gdGhyb3VnaCwgYnV0IHJhdGhlciB0
aGUgZWZpIGNvbmZpZwo+ID4+PiBwb2ludHMgZXhhY3RseSB0byB0aGUgbWljcm9jb2RlIGJsb2Iu
Cj4gPj4KPiA+PiBXaGF0IHdvdWxkIGJlIHdyb25nIHdpdGggdGhlIEVGSSBjb2RlIHRvIGFsc28g
aW5zcGVjdCB3aGF0ZXZlciBoYXMgYmVlbgo+ID4+IHNwZWNpZmllZCB3aXRoIHJhbWRpc2s9IGlm
IHRoZXJlIHdhcyBubyB1Y29kZT0gPwo+ID4gCj4gPiBJIHNlZSwgaW50ZXJlc3RpbmcuIFRoaXMg
c291bmRzIGxpa2UgYSBsZWdpdGltYXRlIHVzZSBjYXNlIGluZGVlZC4gSSAKPiA+IHdvbmRlciwg
d291bGQgSSBiZSBicmVha2luZyBhbnl0aGluZyBpZiBJIHNpbXBseSBhbGxvdyB0aGUgZXhpc3Rp
bmcgY29kZSAKPiA+IHRoYXQgaXRlcmF0ZXMgb3ZlciBtb2R1bGVzIHRvIGtpY2sgaW4gd2hlbiB1
Y29kZT1zY2FuIGlycmVzcGVjdGl2ZSBvZiAKPiA+IEVGSSBvciBsZWdhY3kgYm9vdD8KPiAKPiBJ
IGRvbid0IHRoaW5rIHNvLCBubywgYnV0IGl0IHdvdWxkIG5lZWQgZG91YmxlIGNoZWNraW5nIChh
bmQKPiBtZW50aW9uaW5nIGluIHRoZSBkZXNjcmlwdGlvbiBhbmQvb3IgZG9jdW1lbnRhdGlvbiku
CgpPcmlnaW5hbGx5IEkgd2FudGVkIHRvIGhhdmUgJ3Vjb2RlPXNjYW4nIGJlIHRoZSBkZWZhdWx0
IGNob2ljZS4gVGhhdAp3b3VsZCBoYXZlIGJlZW4gdGhlIGVhc2llc3QgY2hvaWNlLgogCgo+IAo+
ID4gQWxzbywgaXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgdWNvZGU9IHNwZWNpZmllZCBieSAKPiA+
IGVmaS5jZmcgd291bGQgdGFrZSBwcmVjZWRlbmNlIG92ZXIgdGhlIHVjb2RlPXNjYW4uIERvIG5v
dCB5b3UgdGhpbms/Cj4gCj4gSSBndWVzcyB3ZSBuZWVkIHRvIHNldHRsZSBvbiB3aGF0IHdlIHdh
bnQgdG8gdGFrZSBwcmVjZWRlbmNlIGFuZAo+IHRoZW4gbWFrZSBzdXJlIGNvZGUgYWxzbyBiZWhh
dmVzIHRoaXMgd2F5LiBCdXQgeWVzLCBJIHRoaW5rIHVjb2RlPQo+IGZyb20gdGhlIC5jZmcgc2hv
dWxkIHN1cGVyc2VkZSB1Y29kZT1zY2FuIG9uIHRoZSBjb21tYW5kIGxpbmUuIEEKPiBwb3NzaWJs
eSB1c2VmdWwgYWRqdXN0bWVudCB0byB0aGlzIG1pZ2h0IGJlIHRvIGRpc3Rpbmd1aXNoIHdoZXRo
ZXIKPiB0aGUgdWNvZGU9c2NhbiB3YXMgaW4gYSBzcGVjaWZpYyAuY2ZnIHNlY3Rpb24gd2hpbGUg
dGhlIHVjb2RlPSB3YXMKPiBpbiBbZ2xvYmFsXSAoaS5lLiBzb3J0IG9mIGEgZGVmYXVsdCksIGlu
IHdoaWNoIGNhc2UgbWF5YmUgdGhlCj4gdWNvZGU9c2NhbiBzaG91bGQgd2luLiBUaG91Z2h0cz8K
PiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
