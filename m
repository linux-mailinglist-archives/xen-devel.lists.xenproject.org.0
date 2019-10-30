Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB5EA2F7
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:05:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPsIR-0003H5-7x; Wed, 30 Oct 2019 18:02:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqvR=YX=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iPsIP-0003H0-Mq
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:02:13 +0000
X-Inumbo-ID: 598819e9-fb3f-11e9-9534-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 598819e9-fb3f-11e9-9534-12813bfff9fa;
 Wed, 30 Oct 2019 18:01:52 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9UHinXl151849;
 Wed, 30 Oct 2019 18:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=WCR3AQ3qtH6hiWIZRstEyaYOp7ZSTtMqefC/OFqkEcI=;
 b=h4nrF62OgFenw9J9keBh9CqosJkKo3CMu2ISGlNFXNpm3oRT1/Z43ZYYe507M2uJ2isP
 I2OEYDTmHPDSTUky2iUjvaRFNlhLhnDvWKXKjVlQmAOjSb5QJ94xcmrFrIYfsNQahlLu
 x04Q++QtN7Hfm/X3kMWNlfPb8IlTmrEnreRpkZm5JPY4e/OQIKBGN9ru2kkHWM0mfJOM
 em2LWwAEUxWMET4jfL1cpcYRDH51KpQYblGs4gUF74hI+Z1BSnv3Im9YVFX6oMpx1vMG
 8AS+7xdMRRKjgi27MBEdzzEGQW4CdyM1bV77McYizBf3Ll1iGjIfN/9mV6Q3k1BCUZI8 bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2vxwhfe2hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 18:01:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9UHiehD101920;
 Wed, 30 Oct 2019 18:01:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2vxwj9rxw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 18:01:48 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9UI1iqx020282;
 Wed, 30 Oct 2019 18:01:45 GMT
Received: from [10.211.47.34] (/10.211.47.34)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 30 Oct 2019 11:01:44 -0700
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
Date: Wed, 30 Oct 2019 11:01:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030172313.GX17494@Air-de-Roger>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910300155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9426
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910300155
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMzAvMTkgMTA6MjMgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMzAsIDIwMTkgYXQgMDk6Mzg6MTZBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToKPj4gT24gMTAv
MzAvMTkgMToyNCBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IENhbiB5b3UgdHJ5IHRv
IGFkZCB0aGUgZm9sbG93aW5nIGRlYnVnIHBhdGNoIG9uIHRvcCBvZiB0aGUgZXhpc3RpbmcKPj4+
IG9uZSBhbmQgcmVwb3J0IHRoZSBvdXRwdXQgdGhhdCB5b3UgZ2V0IG9uIHRoZSBYZW4gY29uc29s
ZT8KPj4KPj4gQXBwbGllZCBkZWJ1ZyBwYXRjaCBhbmQgcnVuIHRoZSB0ZXN0IGFnYWluLCBub3Qg
b2YgYW55IGxvZyBwcmludGVkLAo+PiBhdHRhY2hlZCBYZW4gbG9nIG9uIHNlcmlhbCBjb25zb2xl
LCBzZWVtcyBwaV91cGRhdGVfaXJ0ZSgpIG5vdCBiZWVuCj4+IGNhbGxlZCBmb3IgaW9tbXVfaW50
cG9zdCB3YXMgZmFsc2UuCj4gCj4gSSBoYXZlIHRvIGFkbWl0IEknbSBsb3N0IGF0IHRoaXMgcG9p
bnQuIERvZXMgaXQgbWVhbiB0aGUgb3JpZ2luYWwKPiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3
aXRoIHBvc3RlZCBpbnRlcnJ1cHRzPwoKTG9va3Mgd2hlbiBpbmplY3QgaXJxIGJ5IHZsYXBpY19z
ZXRfaXJxKCksIGl0IGNoZWNrZWQgYnkKaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIgcmF0
aGVyIHRoYW4gaW9tbXVfaW50cG9zdDoKCiAxNzYgICAgIGlmICggaHZtX2Z1bmNzLmRlbGl2ZXJf
cG9zdGVkX2ludHIgKQogMTc3ICAgICAgICAgaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIo
dGFyZ2V0LCB2ZWMpOwoKQW5kIGRlbGl2ZXJfcG9zdGVkX2ludHIoKSB3b3VsZCBiZSB0aGVyZSwg
d2hlbiB2bXggZW5hYmxlZDoKCihYRU4pIEhWTTogVk1YIGVuYWJsZWQKKFhFTikgSFZNOiBIYXJk
d2FyZSBBc3Npc3RlZCBQYWdpbmcgKEhBUCkgZGV0ZWN0ZWQKKFhFTikgSFZNOiBIQVAgcGFnZSBz
aXplczogNGtCLCAyTUIsIDFHQgoKU28gb3JpZ2luYWwgaXNzdWUgc3RpbGwgdXNlZCBwb3N0ZWQg
aW50ZXJydXB0cz8KCj4gCj4gV2hlcmUgeW91IGJvb3RpbmcgdXNpbmcgaW9tbXU9aW50cG9zdCBp
biB5b3VyIHByZXZpb3VzIHRlc3RzPyBOb3RlCj4gdGhhdCBwb3N0ZWQgaW50ZXJydXB0cyBpcyBu
b3QgZW5hYmxlZCBieSBkZWZhdWx0IGFjY29yZGluZyB0byB0aGUKPiBjb21tYW5kIGxpbmUgZG9j
dW1lbnRhdGlvbi4KPiAKCk5vLCBmcm9tIHhlbiBjb21tYW5kIGxpbmUgeW91IGNhbiBzZWUgSSBv
bmx5IGhhZCBpb21tdT0xIGZvciB4ZW4uCgo+IENhbiB5b3UgY29uZmlybSB3aGV0aGVyIHlvdSBh
bHNvIHNlZSB3ZWlyZCBiZWhhdmlvciB3aXRob3V0IHVzaW5nCj4gcG9zdGVkIGludGVycnVwdHMs
IGFuZCBjYW4geW91IHR1cm4gcG9zdGVkIGludGVycnVwdHMgb24gYW5kIGdpdmUgdGhlCj4gcGF0
Y2ggYSB0cnk/CgpJIGRpc2FibGVkIGFwaWN2LCBsb29rcyBwb3N0ZWQgaW50ZXJydXB0cyBiZWVu
IGRpc2FibGVzIGFzIHdlbGwsIHRoZW4KSSBjb3VsZCBub3QgcmVwcm9kdWNlZCBpdCBhbnltb3Jl
OgoKKFhFTikgQ29tbWFuZCBsaW5lOiBwbGFjZWhvbGRlciBkb20wX21lbT1tYXg6MzQ1Nk0gYWxs
b3dzdXBlcnBhZ2UgZG9tMF92Y3B1c19waW49bnVtYSBkb20wX21heF92Y3B1cz00IGNyYXNoa2Vy
bmVsPTUxMk1AMTAyNE0gaW9tbXU9dmVyYm9zZSxkZWJ1Zyxmb3JjZSxpbnRyZW1hcCxpbnRwb3N0
IGh2bV9kZWJ1Zz04MzIgZ3Vlc3RfbG9nbHZsPWFsbCBjb20xPTExNTIwMCw4bjEgY29uc29sZT1j
b20xIGNvbnJpbmdfc2l6ZT0xbSBjb25zb2xlX3RvX3JpbmcgYXBpY3Y9MAouLi4KKFhFTikgSW5p
dGluZyBtZW1vcnkgc2hhcmluZy4KKFhFTikgSW50ZWwgVlQtZCBpb21tdSAwIHN1cHBvcnRlZCBw
YWdlIHNpemVzOiA0a0IsIDJNQiwgMUdCLgooWEVOKSBJbnRlbCBWVC1kIGlvbW11IDEgc3VwcG9y
dGVkIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IuCihYRU4pIEludGVsIFZULWQgU25vb3AgQ29u
dHJvbCBlbmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIERvbTAgRE1BIFBhc3N0aHJvdWdoIG5vdCBl
bmFibGVkLgooWEVOKSBJbnRlbCBWVC1kIFF1ZXVlZCBJbnZhbGlkYXRpb24gZW5hYmxlZC4KKFhF
TikgSW50ZWwgVlQtZCBJbnRlcnJ1cHQgUmVtYXBwaW5nIGVuYWJsZWQuCihYRU4pIEludGVsIFZU
LWQgUG9zdGVkIEludGVycnVwdCBub3QgZW5hYmxlZC4KKFhFTikgSW50ZWwgVlQtZCBTaGFyZWQg
RVBUIHRhYmxlcyBlbmFibGVkLgouLi4KKFhFTikgVk1YOiBTdXBwb3J0ZWQgYWR2YW5jZWQgZmVh
dHVyZXM6CihYRU4pICAtIEFQSUMgTU1JTyBhY2Nlc3MgdmlydHVhbGlzYXRpb24KKFhFTikgIC0g
QVBJQyBUUFIgc2hhZG93CihYRU4pICAtIEV4dGVuZGVkIFBhZ2UgVGFibGVzIChFUFQpCihYRU4p
ICAtIFZpcnR1YWwtUHJvY2Vzc29yIElkZW50aWZpZXJzIChWUElEKQooWEVOKSAgLSBWaXJ0dWFs
IE5NSQooWEVOKSAgLSBNU1IgZGlyZWN0LWFjY2VzcyBiaXRtYXAKKFhFTikgIC0gVW5yZXN0cmlj
dGVkIEd1ZXN0CihYRU4pICAtIFZNQ1Mgc2hhZG93aW5nCihYRU4pICAtIFZNIEZ1bmN0aW9ucwoo
WEVOKSBIVk06IEFTSURzIGVuYWJsZWQuCihYRU4pIEhWTTogVk1YIGVuYWJsZWQKClRoYW5rcywK
Sm9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
