Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B4C1762D0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 19:35:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8pqQ-0001UO-P4; Mon, 02 Mar 2020 18:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5f3=4T=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1j8pqP-0001UJ-JB
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 18:31:09 +0000
X-Inumbo-ID: fb647542-5cb3-11ea-9fd5-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb647542-5cb3-11ea-9fd5-12813bfff9fa;
 Mon, 02 Mar 2020 18:31:07 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022ISqsg026066;
 Mon, 2 Mar 2020 18:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=WVXQ68+B2r6iXNu6e7LMo2xOoZ1egN//CGlyC6L20tE=;
 b=KUyhnFHzMbORv6zOmRodzfG0PP09x38HrSVaKDc+uIaZsII0pDNBgfNik3C14SmI4tJb
 yTxELxorBibp2Y0N2jnhGtb3KKPkK9/CibiwDdJpIeabLF+NITXP4ADXImdXOHPHRH5c
 P9cZbVn8tKACHFDheFoFt+Zq0L5JrzCkxyJD2X6tU1kXH54Ak9fe5arSbxmgBFY1hZ0Y
 ZX7aZ9VwFPxj/s3lPjUjgffZlv73SZ0/t9XBPZfr3IgcHvAC2ePWe0esutZk48LS8iZj
 TLM/CT888RwyfRN6T0rlS2N5jSOOVe5qGlVWo+zfLm0+F4DTOr6fA40By/Bw8prv/WBh 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2yghn2we56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Mar 2020 18:31:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022IQalv092187;
 Mon, 2 Mar 2020 18:31:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2yg1rg63yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Mar 2020 18:30:59 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 022IUvtu015045;
 Mon, 2 Mar 2020 18:30:57 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Mar 2020 10:30:57 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id AD4F36A013E; Mon,  2 Mar 2020 13:34:43 -0500 (EST)
Date: Mon, 2 Mar 2020 13:34:43 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200302183443.GE14708@char.us.oracle.com>
References: <20200211093122.5644-1-jgross@suse.com>
 <6b65b34d-0078-ad0c-9a6c-ada5d2828cc0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b65b34d-0078-ad0c-9a6c-ada5d2828cc0@suse.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020121
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDM6Mjg6NTVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTEuMDIuMjAyMCAxMDozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+IE9uZSBv
ZiB0aGUgbWFpbiBkZXNpZ24gZ29hbHMgb2YgY29yZSBzY2hlZHVsaW5nIGlzIHRvIGF2b2lkIGFj
dGlvbnMKPiA+IHdoaWNoIGFyZSBub3QgZGlyZWN0bHkgcmVsYXRlZCB0byB0aGUgZG9tYWluIGN1
cnJlbnRseSBydW5uaW5nIG9uIGEKPiA+IGdpdmVuIGNwdSBvciBjb3JlLiBMaXZlIHBhdGNoaW5n
IGlzIG9uZSBvZiB0aG9zZSBhY3Rpb25zIHdoaWNoIGFyZQo+ID4gYWxsb3dlZCB0YWtpbmcgcGxh
Y2Ugb24gYSBjcHUgb25seSB3aGVuIHRoZSBpZGxlIHNjaGVkdWxpbmcgdW5pdCBpcwo+ID4gYWN0
aXZlIG9uIHRoYXQgY3B1Lgo+ID4gCj4gPiBVbmZvcnR1bmF0ZWx5IGxpdmUgcGF0Y2hpbmcgdHJp
ZXMgdG8gZm9yY2UgdGhlIGNwdXMgaW50byB0aGUgaWRsZSBsb29wCj4gPiBqdXN0IGJ5IHJhaXNp
bmcgdGhlIHNjaGVkdWxlIHNvZnRpcnEsIHdoaWNoIHdpbGwgbm8gbG9uZ2VyIGJlCj4gPiBndWFy
YW50ZWVkIHRvIHdvcmsgd2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlLiBBZGRpdGlvbmFsbHkg
dGhlcmUgYXJlCj4gPiBzdGlsbCBzb21lIHBsYWNlcyBpbiB0aGUgaHlwZXJ2aXNvciBjYWxsaW5n
IGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpCj4gPiB3aXRob3V0IGJlaW5nIGluIHRoZSBpZGxl
IGxvb3AuCj4gPiAKPiA+IEl0IGlzIGVhc3kgdG8gZm9yY2UgYSBjcHUgaW50byB0aGUgbWFpbiBp
ZGxlIGxvb3AgYnkgc2NoZWR1bGluZyBhCj4gPiB0YXNrbGV0IG9uIGl0LiBTbyBzd2l0Y2ggbGl2
ZSBwYXRjaGluZyB0byB1c2UgdGFza2xldHMgZm9yIHN3aXRjaGluZyB0bwo+ID4gaWRsZSBhbmQg
cmFpc2luZyBzY2hlZHVsaW5nIGV2ZW50cy4gQWRkaXRpb25hbGx5IHRoZSBjYWxscyBvZgo+ID4g
Y2hlY2tfZm9yX2xpdmVwYXRjaF93b3JrKCkgb3V0c2lkZSB0aGUgbWFpbiBpZGxlIGxvb3AgY2Fu
IGJlIGRyb3BwZWQuCj4gPiAKPiA+IEFzIHRhc2tsZXRzIGFyZSBvbmx5IHJ1bm5pbmcgb24gaWRs
ZSB2Y3B1cyBhbmQgc3RvcF9tYWNoaW5lX3J1bigpCj4gPiBpcyBhY3RpdmF0aW5nIHRhc2tsZXRz
IG9uIGFsbCBjcHVzIGJ1dCB0aGUgb25lIGl0IGhhcyBiZWVuIGNhbGxlZCBvbgo+ID4gdG8gcmVu
ZGV6dm91cywgaXQgaXMgbWFuZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8gYmUgY2Fs
bGVkIG9uCj4gPiBhbiBpZGxlIHZjcHUsIHRvbywgYXMgb3RoZXJ3aXNlIHRoZXJlIGlzIG5vIHdh
eSBmb3Igc2NoZWR1bGluZyB0bwo+ID4gYWN0aXZhdGUgdGhlIGlkbGUgdmNwdSBmb3IgdGhlIHRh
c2tsZXQgb24gdGhlIHNpYmxpbmcgb2YgdGhlIGNwdQo+ID4gc3RvcF9tYWNoaW5lX3J1bigpIGhh
cyBiZWVuIGNhbGxlZCBvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAg
IHwgIDkgKysrKy0tLS0tCj4gPiAgeGVuL2FyY2gvYXJtL3RyYXBzLmMgICAgICAgIHwgIDYgLS0t
LS0tCj4gPiAgeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgIHwgIDkgKysrKy0tLS0tCj4gPiAg
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgIHwgIDIgKy0KPiA+ICB4ZW4vYXJjaC94ODYvaHZt
L3ZteC92bWNzLmMgfCAgMiArLQo+ID4gIHhlbi9hcmNoL3g4Ni9wdi9kb21haW4uYyAgICB8ICAy
ICstCj4gPiAgeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgIHwgIDIgKy0KPiA+ICB4ZW4vY29t
bW9uL2xpdmVwYXRjaC5jICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDI1IGRlbGV0
aW9ucygtKQo+IAo+IEtvbnJhZCwgUm9zcyAtIEkgd2FzIGFib3V0IHRvIGFwcGx5IHRoaXMgd2hl
biBJIG5vdGljZWQgYW4gYWNrCj4gYnkgb25lIG9mIHRoZSB0d28gb2YgeW91IGlzIHN0aWxsIG5l
ZWRlZC4gQ2FyZSB0byBwcm92aWRlIG9uZQo+IChvciBjb21tZW50IGlmIHRoZXJlIGFyZSBpc3N1
ZXMpPwoKSSB0ZXN0ZWQgdGhpcyBzbyBmZWVsIGZyZWUgdG8gYWRkIGFsc28gVGVzdGVkLWJ5L0Fj
a2VkLWJ5IGZyb20gbWUuCgpUaGFuayB5b3UhCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
