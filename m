Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C172CF2D8A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:36:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSg1h-0003LO-6I; Thu, 07 Nov 2019 11:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vVaH=Y7=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iSg1f-0003LJ-F8
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 11:32:31 +0000
X-Inumbo-ID: 420281bf-0152-11ea-a1c2-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 420281bf-0152-11ea-a1c2-12813bfff9fa;
 Thu, 07 Nov 2019 11:32:20 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA7BOd77056436;
 Thu, 7 Nov 2019 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Czv8pVqfVxDd0LKsdSWLqwv2PVZZcgc54wLOCYMQZpI=;
 b=IxmL8NC5gDs35jgU5KDXQWFaY6gRj6hkmvOc7nat9QD+kZvucJ3ra2JTVeHCHQJvyMTu
 Ri92gGhFoDOdV+086QQZpBQR+85j3rFpn75uiBe+JJIt6eVElHh5g/GGdaAbeDTGSCB2
 W/1C1jUXTTWhICSoHbN3IOswf8WRZ51u4Jilg8yCj8VDVzzpoAoqmGf5o2Ow6+85Bz0s
 i+sUs3DyIF3avPnqOccY/C2KJ+c1RSp8WRROhlfDPFbH4mcCUkYMVlYAW/YkryitMg6j
 o8zOc1fRM/wOYARIMsUDZcUdDhhNQR51q45jlMviezMw46e+DX30lFJ+Emx5SUQql0T/ Nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2w41w0wev6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 11:31:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA7BSjdh171874;
 Thu, 7 Nov 2019 11:31:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2w41wepmft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Nov 2019 11:31:50 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA7BVfka020250;
 Thu, 7 Nov 2019 11:31:46 GMT
Received: from tomti.i.net-space.pl (/10.175.179.76)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Nov 2019 03:31:40 -0800
Date: Thu, 7 Nov 2019 12:31:34 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: hpa@zytor.com
Message-ID: <20191107113134.yl7e4rwxowr52tzf@tomti.i.net-space.pl>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191106170333.GD28380@zn.tnic>
 <3EABBAB2-5BEF-4FEE-8BB4-9EB4B0180B10@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EABBAB2-5BEF-4FEE-8BB4-9EB4B0180B10@zytor.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=632
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911070117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9433
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=717 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911070117
Subject: Re: [Xen-devel] [PATCH v5 0/3] x86/boot: Introduce the kernel_info
 et consortes
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
 Borislav Petkov <bp@alien8.de>, rdunlap@infradead.org, luto@kernel.org,
 eric.snowberg@oracle.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6NTY6NDhBTSAtMDgwMCwgaHBhQHp5dG9yLmNvbSB3
cm90ZToKPiBPbiBOb3ZlbWJlciA2LCAyMDE5IDk6MDM6MzMgQU0gUFNULCBCb3Jpc2xhdiBQZXRr
b3YgPGJwQGFsaWVuOC5kZT4gd3JvdGU6Cj4gPk9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDA0OjEz
OjUxUE0gKzAxMDAsIERhbmllbCBLaXBlciB3cm90ZToKPiA+PiBIaSwKPiA+Pgo+ID4+IER1ZSB0
byB2ZXJ5IGxpbWl0ZWQgc3BhY2UgaW4gdGhlIHNldHVwX2hlYWRlciB0aGlzIHBhdGNoIHNlcmll
cyBpbnRyb2R1Y2VzIG5ldwo+ID4+IGtlcm5lbF9pbmZvIHN0cnVjdCB3aGljaCB3aWxsIGJlIHVz
ZWQgdG8gY29udmV5IGluZm9ybWF0aW9uIGZyb20gdGhlIGtlcm5lbCB0bwo+ID4+IHRoZSBib290
bG9hZGVyLiBUaGlzIHdheSB0aGUgYm9vdCBwcm90b2NvbCBjYW4gYmUgZXh0ZW5kZWQgcmVnYXJk
bGVzcyBvZiB0aGUKPiA+PiBzZXR1cF9oZWFkZXIgbGltaXRhdGlvbnMuIEFkZGl0aW9uYWxseSwg
dGhlIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHNvbWUKPiA+PiBjb252ZW5pZW5jZSBmZWF0dXJl
cyBsaWtlIHRoZSBzZXR1cF9pbmRpcmVjdCBzdHJ1Y3QgYW5kIHRoZQo+ID4+IGtlcm5lbF9pbmZv
LnNldHVwX3R5cGVfbWF4IGZpZWxkLgo+ID4KPiA+VGhhdCdzIGFsbCBmaW5lIGFuZCBkYW5keSBi
dXQgSSdtIG1pc3NpbmcgYW4gZXhhbXBsZSBhYm91dCB3aGF0IHRoYXQnbGwKPiA+YmUgdXNlZCBm
b3IsIGluIHByYWN0aWNlLgo+ID4KPiA+VGh4Lgo+Cj4gRm9yIG9uZSB0aGluZywgd2UgYWxyZWFk
eSBoYXZlIHBlb3BsZSBhc2tpbmcgZm9yIG1vcmUgdGhhbiA0IEdpQiB3b3J0aAo+IG9mIGluaXRy
YW1mcywgYW5kIGVzcGVjaWFsbHkgd2l0aCBpbml0cmFtZnMgdGhhdCBodWdlIGl0IHdvdWxkIG1h
a2UgYQo+ICpsb3QqIG9mIHNlbnNlIHRvIGFsbG93IGxvYWRpbmcgaXQgaW4gY2h1bmtzIHdpdGhv
dXQgaGF2aW5nIHRvCj4gY29uY2F0ZW5hdGUgdGhlbS4gSSBoYXZlIGJlZW4gYXNraW5nIGZvciBh
IGxvbmcgdGltZSBmb3IgaW5pdHJhbWZzCj4gY3JlYXRvcnMgdG8gc3BsaXQgdGhlIGtlcm5lbC1k
ZXBlbmRlbnQgYW5kIGtlcm5lbCBpbmRlcGVuZGVudCBwYXJ0cwo+IGludG8gc2VwYXJhdGUgaW5p
dHJhbWZzIG1vZHVsZXMuCgpBbm90aGVyIHVzZXIgb2YgdGhpcyBwYXRjaHNldCBpcyB0aGUgVHJl
bmNoQm9vdCBwcm9qZWN0IG9uIHdoaWNoIHdlIGFyZQp3b3JraW5nIG9uLiBXZSBoYXZlIHRvIGlu
dHJvZHVjZSBzZXBhcmF0ZSBlbnRyeSBwb2ludCBmb3IgSW50ZWwgVFhUIE1MRQpzdGFydHVwIGNv
ZGUuIFRoYXQgaXMgd2h5IHdlIG5lZWQgdGhlIGtlcm5lbF9pbmZvIHN0cnVjdC4KCkRhbmllbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
