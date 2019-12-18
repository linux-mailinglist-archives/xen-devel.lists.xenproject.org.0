Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DD124DA3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 17:31:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihcBE-0006XG-Cy; Wed, 18 Dec 2019 16:28:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vJJ6=2I=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ihcBC-0006X9-9X
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 16:28:06 +0000
X-Inumbo-ID: 5d05fa96-21b3-11ea-90c2-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d05fa96-21b3-11ea-90c2-12813bfff9fa;
 Wed, 18 Dec 2019 16:28:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIGQnDg157353;
 Wed, 18 Dec 2019 16:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=EY5z3IUc+EB9adVCcbGYo1cKIPObK318tad++BUmkT4=;
 b=BNPP6h/26FhpPgx8tQ9pCsS6+ptDzGF/uOEHHU08TvwAE+eX0ctmq+k2MlargVdJR2ig
 nAxrpa0XDxksRcxJ4Cz7mc2YThcxjKTaSArKJWRDux7iixCM0zUC9ML5p7A+F337tQFE
 b2rhY/xO3ahjAfU0KuA+aN/JPGoXS8JRHeYoGZ3hCYi0upY764ShOhbkXYjdpc1NPls0
 78ypcD8oIvVYgK5d6fmgzXHo5KBy0mRLmXIoecm4xDR/8q2uEy99EtBc62SsO+N13sM5
 8RZ3fteOwjZG04Mc6LqbFTVdqmO+qDxGmSNzrgYnudoKzpZ7OSQRDgh1tBkkJAVqYGqQ Mw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2wvrcremdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 16:28:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIGNZsB027684;
 Wed, 18 Dec 2019 16:26:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2wyp4x4tu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 16:26:01 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBIGQ0Jq029098;
 Wed, 18 Dec 2019 16:26:01 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Dec 2019 08:26:00 -0800
To: Roman Shaposhnik <roman@zededa.com>, Jan Beulich <jbeulich@suse.com>
References: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
 <b7ae9bd5-477f-40d7-27f1-68aaf2745b1a@suse.com>
 <7157118a-a40b-e72c-3924-1acefc4b9e35@suse.com>
 <CAMmSBy80bkS5VG+HbBN-YxOiqZiRj1xWjzirFnVPMrb_AxbU1A@mail.gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <1df9a0f6-b1bc-f715-70d5-aac8e64aa78f@oracle.com>
Date: Wed, 18 Dec 2019 11:25:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy80bkS5VG+HbBN-YxOiqZiRj1xWjzirFnVPMrb_AxbU1A@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180135
Subject: Re: [Xen-devel] clock source in PV Linux
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8xOC8xOSAxMjozNiBBTSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBXZWQs
IERlYyAxMSwgMjAxOSBhdCAxMjo0MSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOgo+PiBPbiAxMS4xMi4yMDE5IDA5OjE2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4g
T24gMTEuMTIuMTkgMDg6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IErDvHJnZW4sIEJvcmlz
LAo+Pj4+Cj4+Pj4gSSd2ZSBub3RpY2VkCj4+Pj4KPj4+PiA8Nj5jbG9ja3NvdXJjZTogU3dpdGNo
ZWQgdG8gY2xvY2tzb3VyY2UgdHNjCj4+Pj4KPj4+PiBhcyB0aGUgZmluYWwgY2xvY2tzb3VyY2Ug
cmVsYXRlZCBib290IG1lc3NhZ2UgaW4gYSBQViBEb20wJ3MKPj4+PiBsb2cgd2l0aCA1LjQuMi4g
SXMgaXQgaW50ZW50aW9uYWwgdGhhdCBpdCdzIG5vdCB0aGUgInhlbiIgb25lCj4+Pj4gdGhhdCBn
ZXRzIHVzZWQgYnkgZGVmYXVsdD8KPj4+IEkgdGhpbmsgdGhpcyBpcyBmaW5lLiBJIGp1c3QgdGVz
dGVkIGl0IGFuZCBJJ20gc2VlaW5nIHRoZSBzYW1lIGluIGRvbTAsCj4+PiB3aGlsZSBpbiBhIFBW
IGRvbVUgInhlbiIgaXMgdXNlZCBwZXIgZGVmYXVsdC4KPj4+Cj4+PiBJbiBkb20wICJ0c2MiIHNo
b3VsZCBiZSBva2F5IGluIGNhc2UgaXQgaXMgc3RhYmxlLiBPciBhcmUgeW91IGV4cGVjdGluZwo+
Pj4gcHJvYmxlbXMgd2l0aCB0aGF0IHNldHRpbmc/Cj4+IFdlbGwsIGZpcnN0IG9mIGFsbCBJIGZv
dW5kIHRoaXMgc3VycHJpc2luZy4gV2hldGhlciB0aGVyZSBhcmUgcHJvYmxlbXMgdG8KPj4gYmUg
ZXhwZWN0ZWQgbGFyZ2VseSBkZXBlbmRzIG9uIHRoZSByZWxpYWJpbGl0eSBvZiB0aGUgInN0YWJs
ZSIgZGV0ZWN0aW9uCj4+IGluIFBWIERvbTAuCj4gUmVsYXRlZCBxdWVzdGlvbjogZG9lcyB0aGlz
IG1lYW4gdGhhdCB0c2MgaXMgbm93IGRlZmF1bHQgZm9yIFBWSCBhcyB3ZWxsPwo+Cj4gVGhlIHJl
YXNvbiBJJ20gYXNraW5nIGlzIGJlY2F1c2UgSSdtIHN0aWxsIGEgYml0IHdvcnJpZWQgYWJvdXQg
dGhlCj4gY2xvY2sgZHJpZnQgd2l0aCB0c2MuCgoKZG9tMCB3aWxsIHVzZSBUU0MgZm9yIGVpdGhl
ciBQViBvciBQVkg6Cgp4ZW5fdGltZV9pbml0KCk6CiDCoMKgwqDCoMKgwqAgLyogQXMgRG9tMCBp
cyBuZXZlciBtb3ZlZCwgbm8gcGVuYWx0eSBvbiB1c2luZyBUU0MgdGhlcmUgKi8KIMKgwqDCoMKg
wqDCoMKgIGlmICh4ZW5faW5pdGlhbF9kb21haW4oKSkKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB4ZW5fY2xvY2tzb3VyY2UucmF0aW5nID0gMjc1OwoKQnV0IGFzIGZhciBhcyBUU0Mg
c3RhYmlsaXR5IEknZCB0aGluayBpdCBzaG91bGQgYmUgc3VmZmljaWVudGx5IGNoZWNrZWQgCmJ5
IGdlbmVyaWMgVFNDIGluaXQgY29kZT8KCgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
