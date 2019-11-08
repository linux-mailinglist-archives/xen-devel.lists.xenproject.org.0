Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA732F44F2
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 11:49:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT1no-0006Bh-Sw; Fri, 08 Nov 2019 10:47:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U++q=ZA=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1iT1nn-0006Ar-2I
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 10:47:39 +0000
X-Inumbo-ID: 2d8917fc-0215-11ea-a1d4-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d8917fc-0215-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 10:47:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8AjGqi046403;
 Fri, 8 Nov 2019 10:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=kBevcn7bSITNRLFqXhWbTPcrt4smHMbslYxVx+6MMTU=;
 b=MAIfZ6eVxbW4QkaPitoy1W0MajRcHVkJNP3Z36YXxrAVfEubFE9cuhDFGGKWq1bpBvbj
 nWL78QajL8j42KbXqnsk5toA9wprVDmJ4JJ2hhB/10vuw+hP7MR5gCvLeZKvNEUarNbs
 0JlVoh7EBuHvR7pVSxRWpk9iCEd51jX1HwaPeZZEiKeBkchEeloe3NKrNQ31SFk3bhDJ
 S19teEm/EqM5+Z53rnthfFxvbWBkQVi5NmQxzpC6WEhE27GUKdqcDZAMBupFWYy8yTy1
 bvx7DT70HsH31DqZX3K1gSnmSCDmBVYz/FpbnsGR7XD4/pV0rpqOfbchMK8bWFqVq3o+ /g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2w41w14gy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 10:47:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA8AgOOf193616;
 Fri, 8 Nov 2019 10:47:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2w4k31hjkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Nov 2019 10:47:15 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xA8Al9vV008851;
 Fri, 8 Nov 2019 10:47:09 GMT
Received: from tomti.i.net-space.pl (/10.175.202.125)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Nov 2019 02:47:09 -0800
Date: Fri, 8 Nov 2019 11:47:02 +0100
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Borislav Petkov <bp@alien8.de>
Message-ID: <20191108104702.vwfmvehbeuza4j5w@tomti.i.net-space.pl>
References: <20191104151354.28145-1-daniel.kiper@oracle.com>
 <20191104151354.28145-3-daniel.kiper@oracle.com>
 <20191108100930.GA4503@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108100930.GA4503@zn.tnic>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080105
Subject: Re: [Xen-devel] [PATCH v5 2/3] x86/boot: Introduce the
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
 linux-kernel@vger.kernel.org, eric.snowberg@oracle.com, mingo@redhat.com,
 dave.hansen@linux.intel.com, rdunlap@infradead.org, luto@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kanth.ghatraju@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTE6MDk6MzBBTSArMDEwMCwgQm9yaXNsYXYgUGV0a292
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDA0OjEzOjUzUE0gKzAxMDAsIERhbmll
bCBLaXBlciB3cm90ZToKPiA+IFRoaXMgZmllbGQgY29udGFpbnMgbWF4aW1hbCBhbGxvd2VkIHR5
cGUgZm9yIHNldHVwX2RhdGEuCj4gPgo+ID4gVGhpcyBwYXRjaCBkb2VzIG5vdCBidW1wIHNldHVw
X2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2L2Jvb3QvaGVhZGVyLlMKPiA+IGJlY2F1c2UgaXQg
d2lsbCBiZSBmb2xsb3dlZCBieSBhZGRpdGlvbmFsIGNoYW5nZXMgY29taW5nIGludG8gdGhlCj4g
PiBMaW51eC94ODYgYm9vdCBwcm90b2NvbC4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IEguIFBldGVy
IEFudmluIChJbnRlbCkgPGhwYUB6eXRvci5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
S2lwZXIgPGRhbmllbC5raXBlckBvcmFjbGUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBS
b3NzIFBoaWxpcHNvbiA8cm9zcy5waGlsaXBzb25Ab3JhY2xlLmNvbT4KPiA+IFJldmlld2VkLWJ5
OiBILiBQZXRlciBBbnZpbiAoSW50ZWwpIDxocGFAenl0b3IuY29tPgo+ID4gLS0tCj4gPiB2NSAt
IHN1Z2dlc3Rpb25zL2ZpeGVzOgo+ID4gICAgLSBtb3ZlIGluY29ycmVjdCByZWZlcmVuY2VzIHRv
IHRoZSBzZXR1cF9pbmRpcmVjdCB0byB0aGUKPiA+ICAgICAgcGF0Y2ggaW50cm9kdWNpbmcgaXQs
Cj4gPiAgICAtIGRvIG5vdCBidW1wIHNldHVwX2hlYWRlciB2ZXJzaW9uIGluIGFyY2gveDg2L2Jv
b3QvaGVhZGVyLlMKPiA+ICAgICAgKHN1Z2dlc3RlZCBieSBILiBQZXRlciBBbnZpbikuCj4gPiAt
LS0KPiA+ICBEb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdCAgICAgICAgICAgICB8IDkgKysrKysr
KystCj4gPiAgYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2tlcm5lbF9pbmZvLlMgfCA1ICsrKysr
Cj4gPiAgYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9ib290cGFyYW0uaCAgfCAzICsrKwo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3g4Ni9ib290LnJzdCBiL0RvY3VtZW50YXRpb24v
eDg2L2Jvb3QucnN0Cj4gPiBpbmRleCBjNjBmYWZkYTk0MjcuLjFkYWQ2ZWVlOGE1YyAxMDA2NDQK
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24veDg2L2Jvb3QucnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL3g4Ni9ib290LnJzdAo+ID4gQEAgLTczLDcgKzczLDcgQEAgUHJvdG9jb2wgMi4xNDoJQlVS
TlQgQlkgSU5DT1JSRUNUIENPTU1JVCBhZTdlMTIzOGU2OGYyYTQ3MmExMjU2NzNhYjUwNmQ0OTE1
OGMxODgKPiA+ICAJCSh4ODYvYm9vdDogQWRkIEFDUEkgUlNEUCBhZGRyZXNzIHRvIHNldHVwX2hl
YWRlcikKPiA+ICAJCURPIE5PVCBVU0UhISEgQVNTVU1FIFNBTUUgQVMgMi4xMy4KPiA+Cj4gPiAt
UHJvdG9jb2wgMi4xNToJKEtlcm5lbCA1LjUpIEFkZGVkIHRoZSBrZXJuZWxfaW5mby4KPiA+ICtQ
cm90b2NvbCAyLjE1OgkoS2VybmVsIDUuNSkgQWRkZWQgdGhlIGtlcm5lbF9pbmZvIGFuZCBrZXJu
ZWxfaW5mby5zZXR1cF90eXBlX21heC4KPiA+ICA9PT09PT09PT09PT09CT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4KPiA+ICAu
LiBub3RlOjoKPiA+IEBAIC05ODEsNiArOTgxLDEzIEBAIE9mZnNldC9zaXplOgkweDAwMDgvNAo+
ID4gICAgVGhpcyBmaWVsZCBjb250YWlucyB0aGUgc2l6ZSBvZiB0aGUga2VybmVsX2luZm8gaW5j
bHVkaW5nIGtlcm5lbF9pbmZvLmhlYWRlcgo+ID4gICAgYW5kIGtlcm5lbF9pbmZvLmtlcm5lbF9p
bmZvX3Zhcl9sZW5fZGF0YS4KPiA+Cj4gPiArPT09PT09PT09PT09CT09PT09PT09PT09PT09Cj4g
PiArRmllbGQgbmFtZToJc2V0dXBfdHlwZV9tYXgKPiA+ICtPZmZzZXQvc2l6ZToJMHgwMDA4LzQK
Pgo+IFlvdSBhbHJlYWR5IGhhdmUKPgo+IEZpZWxkIG5hbWU6ICAgICBzaXplX3RvdGFsCj4gT2Zm
c2V0L3NpemU6ICAgIDB4MDAwOC80Cj4KPiBhdCB0aGF0IG9mZnNldC4KPgo+IEkgZ3Vlc3MgeW91
IG1lYW4gc2V0dXBfdHlwZV9tYXgncyBvZmZzZXQgdG8gYmUgMHgwMDBjIGFuZCBpdCB3b3VsZCBi
ZQo+IHRoYXQgbWVtYmVyOgo+Cj4gLmxvbmcgICAweDAxMjM0NTY3ICAgICAgLyogU29tZSBmaXhl
ZCBzaXplIGRhdGEgZm9yIHRoZSBib290bG9hZGVycy4gKi8KPgo+ID8KClllYWgsIHlvdSBhcmUg
cmlnaHQuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlcG9zdCB3aG9sZSBwYXRjaCBzZXJpZXMgb3IK
Y291bGQgeW91IGZpeCBpdCBiZWZvcmUgY29tbWl0dGluZz8KCkRhbmllbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
