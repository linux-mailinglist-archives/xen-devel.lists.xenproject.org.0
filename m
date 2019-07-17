Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3A6B467
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 04:14:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnZOG-0001r0-0i; Wed, 17 Jul 2019 02:09:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SQlR=VO=oracle.com=zhenzhong.duan@srs-us1.protection.inumbo.net>)
 id 1hnZOF-0001qv-08
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 02:09:55 +0000
X-Inumbo-ID: f4dc1d0a-a837-11e9-a660-933dd5bdde53
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4dc1d0a-a837-11e9-a660-933dd5bdde53;
 Wed, 17 Jul 2019 02:09:50 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H28cCW063748;
 Wed, 17 Jul 2019 02:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=k6OoYDpDJSEgTlR5RU9Uko7N/wO/kkXQFXDYsd2fX68=;
 b=vxtR2YjGDMFfmCHNO5nY20srytuCTUahocLUmfg0L1yyjNBY0OIjy2FX580hfDkE0UC9
 ycAkTN7wl7DGD031V374WGZbONFC/8FAaB2QK4vIWIbG5BiElVSMq6W2Ll4sJMciEyNM
 /bcI1N2eF/nUHR24KNEkmbXsnXMkXOXPKHMCb5XKSLuky/c/s3AhrmYWa5PmOjCIeZOy
 NnevOXgdkSkYptgJCHAGgljJnLEHyFeE4mAay6fsNiRKQCWz7EQaxiGpGWs37ZBkZ4Qa
 VXOJi9a5NnxMADX0x/WlUyC0sTtGmXYMiTa2BV4gTxC1F6Ijip0f2Tk3iixaYy2rZUj2 5w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2tq6qtqtkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 02:09:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6H27n7Y037839;
 Wed, 17 Jul 2019 02:09:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tsmcc4suj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 02:09:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6H29Ytv014962;
 Wed, 17 Jul 2019 02:09:34 GMT
Received: from [192.168.0.8] (/116.136.20.190)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jul 2019 02:09:33 +0000
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
References: <1562846532-32152-1-git-send-email-zhenzhong.duan@oracle.com>
 <1562846532-32152-5-git-send-email-zhenzhong.duan@oracle.com>
 <2433589d-a2d2-6b51-cfbd-c1141014ab93@suse.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Organization: Oracle Corporation
Message-ID: <67261f6e-5dce-2452-a6d6-aa6ca73dfeec@oracle.com>
Date: Wed, 17 Jul 2019 10:09:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2433589d-a2d2-6b51-cfbd-c1141014ab93@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907170024
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9320
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907170025
Subject: Re: [Xen-devel] [PATCH v7 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwMTkvNy8xNiAxODo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxMS4wNy4xOSAx
NDowMiwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IC4uIGFzICJub3B2IiBzdXBwb3J0IG5lZWRz
IGl0IHRvIGJlIGNoYW5nZWFibGUgYXQgYm9vdCB1cCBzdGFnZS4KPj4KPj4gQ2hlY2twYXRjaCBy
ZXBvcnQgd2FybmluZywgc28gbW92ZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgZnJvbQo+PiBoeXBl
cnZpc29yLmMgdG8gaHlwZXJ2aXNvci5oCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBE
dWFuIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPgo+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxi
b3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+PiBDYzogSW5n
byBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFs
aWVuOC5kZT4KPj4gLS0tCj4+IMKgIGFyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlzb3IuaCB8
IDggKysrKysrKysKPj4gwqAgYXJjaC94ODYva2VybmVsL2NwdS9oeXBlcnZpc29yLmPCoCB8IDgg
LS0tLS0tLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29y
LmggCj4+IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vaHlwZXJ2aXNvci5oCj4+IGluZGV4IGY3YjRj
NTMuLmU0MWNiZjIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2h5cGVydmlz
b3IuaAo+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9oeXBlcnZpc29yLmgKPj4gQEAgLTU4
LDYgKzU4LDE0IEBAIHN0cnVjdCBoeXBlcnZpc29yX3g4NiB7Cj4+IMKgwqDCoMKgwqAgYm9vbCBp
Z25vcmVfbm9wdjsKPj4gwqAgfTsKPj4gwqAgK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl94ODYgeDg2X2h5cGVyX3Ztd2FyZTsKPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl94ODYgeDg2X2h5cGVyX21zX2h5cGVydjsKPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9wdjsKPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl94ODYgeDg2X2h5cGVyX2t2bTsKPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNv
cl94ODYgeDg2X2h5cGVyX2phaWxob3VzZTsKPj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgaHlwZXJ2
aXNvcl94ODYgeDg2X2h5cGVyX2Fjcm47Cj4+ICtleHRlcm4gc3RydWN0IGh5cGVydmlzb3JfeDg2
IHg4Nl9oeXBlcl94ZW5faHZtOwo+Cj4gVGhpcyBzaG91bGQgZWl0aGVyIHN0YXkgY29uc3QgYW5k
IGJlIGNoYW5nZWQgaW4gcGF0Y2ggNSwgb3IgeW91Cj4gc2hvdWxkIGFkYXB0IGl0cyBkZWZpbml0
aW9uIGluIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgaW4KPiB0aGlzIHBhdGNoLgoKT2ss
IHRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLgoKSSdsbCBjaG9vc2UgMm5kIG9waW5pb24gYXMg
SSBkb24ndCBuZWVkIHRvIGNoYW5nZSBkZXNjcmlwdG9uIHdpdGggdGhhdC4KClpoZW56aG9uZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
