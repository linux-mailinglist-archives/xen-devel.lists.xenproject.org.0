Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466855C879
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 06:41:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiAYi-0005pF-HG; Tue, 02 Jul 2019 04:38:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=is1s=U7=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hiAYh-0005pA-GV
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 04:38:23 +0000
X-Inumbo-ID: 388ff15b-9c83-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 388ff15b-9c83-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 04:38:21 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x624XkMF095873;
 Tue, 2 Jul 2019 04:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=/2LHMY9wbAor8bZR0fN9L8PLrX6qbsO7NNpH1UIpzQU=;
 b=2u2YMm9yy8nU9Tj9/2jKRysJLa0L214kwYtqOm702YTP9ieMWzyWFaTZLt1iNPcCxwK5
 LVb9NZ5W2K58B/Pk4X3UgbiRfUWwOztBOpBcCccttEFsozG4K7P8tgiM0sj+sg+i1N01
 oJKxHESsIu1+4Fp1MIVZEj1nsTJAsRL46RSD/anNvT3JMOKaA45oYAE9dwTf12iwtmIB
 yzi+CUqmAin56MKWNtpWpMgoeDAygYpfhtQjArH6aan1x0qIGHDQZoAgqCH29mZLsMe2
 cZJScYZEMhQKbSwpwS5xYDcXAR6Bc+cnDSe1Mej+ACaOU/n0+G2pJA6z691EkG3Mk+RM Bg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2te61e111w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 04:38:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x624bxdW124275;
 Tue, 2 Jul 2019 04:38:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2tebqg98m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jul 2019 04:38:07 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x624c6Yr020828;
 Tue, 2 Jul 2019 04:38:06 GMT
Received: from [10.191.19.75] (/10.191.19.75)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Jul 2019 21:38:05 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1561947628-1147-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561947628-1147-4-git-send-email-zhenzhong.duan@oracle.com>
 <20190702034818.GB8003@bostrovs-us.us.oracle.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <454f55e9-176c-2ac0-8422-09811f80cdde@oracle.com>
Date: Tue, 2 Jul 2019 12:38:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190702034818.GB8003@bostrovs-us.us.oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907020049
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9305
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907020048
Subject: Re: [Xen-devel] [PATCH v3 3/4] Revert "xen: Introduce 'xen_nopv' to
 disable PV extensions for HVM guests."
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
Cc: jgross@suse.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org,
 mingo@redhat.com, bp@alien8.de, boris.ostrovsky@oracle.co,
 xen-devel@lists.xenproject.org, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy8yIDExOjQ4LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MDEsIDIwMTkgYXQgMTA6MjA6MjdBTSArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgOGQ2OTNiOTExYmI5YzU3MDA5YzI0Y2IxNzcyZDIwNWI4NGM3OTg1
Yy4KPj4KPj4gSW5zdGVhZCB3ZSB1c2UgYW4gdW5pZmllZCBwYXJhbWV0ZXIgJ25vcHYnIGZvciBh
bGwgdGhlIGh5cGVydmlzb3IKPj4gcGxhdGZvcm1zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVu
emhvbmcgRHVhbjx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+PiBSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zczxqZ3Jvc3NAc3VzZS5jb20+Cj4+IENjOiBCb3JpcyBPc3Ryb3Zza3k8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+Cj4+IENjOiBKdWVyZ2VuIEdyb3NzPGpncm9zc0BzdXNlLmNv
bT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaTxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBD
YzogVGhvbWFzIEdsZWl4bmVyPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IEluZ28gTW9sbmFy
PG1pbmdvQHJlZGhhdC5jb20+Cj4+IENjOiBCb3Jpc2xhdiBQZXRrb3Y8YnBAYWxpZW44LmRlPgo+
PiAtLS0KPj4gICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dCB8ICA0IC0tLS0KPj4gICBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jICAgICAgICAgICAg
ICAgICAgICB8IDEyICstLS0tLS0tLS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDE1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+PiBpbmRleCAyMWUwOGFmLi5kNWMzZGNjIDEwMDY0
NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dAo+PiBAQCAtNTI1MSwxMCArNTI1MSw2IEBACj4+ICAgCQkJRGlzYWJsZXMgdGhlIHRpY2tldGxv
Y2sgc2xvd3BhdGggdXNpbmcgWGVuIFBWCj4+ICAgCQkJb3B0aW1pemF0aW9ucy4KPj4gICAKPj4g
LQl4ZW5fbm9wdglbWDg2XQo+PiAtCQkJRGlzYWJsZXMgdGhlIFBWIG9wdGltaXphdGlvbnMgZm9y
Y2luZyB0aGUgSFZNIGd1ZXN0IHRvCj4+IC0JCQlydW4gYXMgZ2VuZXJpYyBIVk0gZ3Vlc3Qgd2l0
aCBubyBQViBkcml2ZXJzLgo+PiAtCj4gU28gc29tZW9uZSB1cGdyYWRlcyB0aGUga2VybmVsIGFu
ZCBzdWRkZW5seSB0aGluZ3Mgd29yayBkaWZmZXJlbnRseT8KPgo+IEF0IGxlYXN0IHRoZXJlIHNo
b3VsZCBiZSBhIHdhcm5pbmcgdGhhdCB0aGUgb3B0aW9uIGhhcyBiZWVuIHJlcGxhY2VkCj4gd2l0
aCAnbm9wdicgKGJ1dCBJIHdvdWxkIGFjdHVhbGx5IGtlZXAgdGhpcyBvcHRpb24gd29ya2luZyBh
cyB3ZWxsKS4KCk9LLCBJJ2xsIGFkZCBuZXcgcGF0Y2ggdG8gbWFwIHhlbl9ub3B2IHRvIG5vcHYu
IFNvIGlmICd4ZW5fbm9wdicgaXMgCnVzZWQsIHdlIGdvCgp0byB0aGUgcGF0aCBmb3IgJ25vcHYn
LiBJIHdpbGwgYmUgc2FtZSBlZmZlY3QuCgpUaGFua3MKClpoZW56aG9uZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
