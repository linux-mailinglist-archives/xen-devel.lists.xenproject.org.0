Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90A91594
	for <lists+xen-devel@lfdr.de>; Sun, 18 Aug 2019 10:35:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzGaj-0000Gb-TN; Sun, 18 Aug 2019 08:31:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j1co=WO=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hzGai-0000GW-Bp
 for xen-devel@lists.xenproject.org; Sun, 18 Aug 2019 08:31:08 +0000
X-Inumbo-ID: 84011b5c-c192-11e9-8be1-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84011b5c-c192-11e9-8be1-12813bfff9fa;
 Sun, 18 Aug 2019 08:31:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7I8UAkQ045583;
 Sun, 18 Aug 2019 08:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=mime-version :
 message-id : date : from : to : cc : subject : content-type :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=OscEuJNSgaecc7omNE4pQTG5ugKKHTX9RKDQmcCtGr8=;
 b=VmfD0lZbcw1KI7nt0/A4dxSbgisrKmDi0ksS4DOvJSPFmZguw8QqN2r6SDm0Z6wBNXmX
 G9BAwNYAcfAOXkDya1jgpQlSWYNjdB+cjqm5KpmO9/O5DiYiytDKpaY/fxumu/OnzHuy
 bqVLfnlthkywEusuaLChoXe8DikNC9QC5x70lHKijTiX8EYQ58fAgNB/Sehg3d3xadve
 cIvZ77/epLNw47iZhE+9dRhe/nInKAarpbCUqO2bxH8hlMTOBZF9b3hDtUoKNAdhHiBj
 ZX0/GJSPhIZwysvofZ/ZXsZfA25bQwi/C6L147375Qu19zddOcs0YzKkSOVJ99Yzhu/L 1A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uea7qawt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Aug 2019 08:31:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7I8S93Q053923;
 Sun, 18 Aug 2019 08:31:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2ue8wx3qu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Aug 2019 08:31:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7I8V1h2012172;
 Sun, 18 Aug 2019 08:31:01 GMT
MIME-Version: 1.0
Message-ID: <c45b306e-c67b-49f5-8fe8-3913557a8774@default>
Date: Sun, 18 Aug 2019 01:31:00 -0700 (PDT)
From: Dongli Zhang <dongli.zhang@oracle.com>
To: <xen-devel@lists.xenproject.org>
X-Mailer: Zimbra on Oracle Beehive
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9352
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908180094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9352
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908180094
Subject: [Xen-devel] Question on xen-netfront code to fix a potential ring
 buffer corruption
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
Cc: jgross@suse.com, netdev@vger.kernel.org, Joe Jin <joe.jin@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpXb3VsZCB5b3UgcGxlYXNlIGhlbHAgY29uZmlybSB3aHkgdGhlIGNvbmRpdGlvbiBhdCBs
aW5lIDkwOCBpcyAiPj0iPwoKSW4gbXkgb3Bpbmlvbiwgd2Ugd291bGQgb25seSBoaXQgInNrYl9z
aGluZm8oc2tiKS0+bnJfZnJhZyA9PSBNQVhfU0tCX0ZSQUdTIiBhdApsaW5lIDkwOC4KCjg5MCBz
dGF0aWMgUklOR19JRFggeGVubmV0X2ZpbGxfZnJhZ3Moc3RydWN0IG5ldGZyb250X3F1ZXVlICpx
dWV1ZSwKODkxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLAo4OTIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBza19i
dWZmX2hlYWQgKmxpc3QpCjg5MyB7Cjg5NCAgICAgICAgIFJJTkdfSURYIGNvbnMgPSBxdWV1ZS0+
cngucnNwX2NvbnM7Cjg5NSAgICAgICAgIHN0cnVjdCBza19idWZmICpuc2tiOwo4OTYgCjg5NyAg
ICAgICAgIHdoaWxlICgobnNrYiA9IF9fc2tiX2RlcXVldWUobGlzdCkpKSB7Cjg5OCAgICAgICAg
ICAgICAgICAgc3RydWN0IHhlbl9uZXRpZl9yeF9yZXNwb25zZSAqcnggPQo4OTkgICAgICAgICAg
ICAgICAgICAgICAgICAgUklOR19HRVRfUkVTUE9OU0UoJnF1ZXVlLT5yeCwgKytjb25zKTsKOTAw
ICAgICAgICAgICAgICAgICBza2JfZnJhZ190ICpuZnJhZyA9ICZza2Jfc2hpbmZvKG5za2IpLT5m
cmFnc1swXTsKOTAxIAo5MDIgICAgICAgICAgICAgICAgIGlmIChza2Jfc2hpbmZvKHNrYiktPm5y
X2ZyYWdzID09IE1BWF9TS0JfRlJBR1MpIHsKOTAzICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBwdWxsX3RvID0gTkVURlJPTlRfU0tCX0NCKHNrYiktPnB1bGxfdG87CjkwNCAK
OTA1ICAgICAgICAgICAgICAgICAgICAgICAgIEJVR19PTihwdWxsX3RvIDwgc2tiX2hlYWRsZW4o
c2tiKSk7CjkwNiAgICAgICAgICAgICAgICAgICAgICAgICBfX3Bza2JfcHVsbF90YWlsKHNrYiwg
cHVsbF90byAtIHNrYl9oZWFkbGVuKHNrYikpOwo5MDcgICAgICAgICAgICAgICAgIH0KOTA4ICAg
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoc2tiX3NoaW5mbyhza2IpLT5ucl9mcmFncyA+PSBN
QVhfU0tCX0ZSQUdTKSkgewo5MDkgICAgICAgICAgICAgICAgICAgICAgICAgcXVldWUtPnJ4LnJz
cF9jb25zID0gKytjb25zOwo5MTAgICAgICAgICAgICAgICAgICAgICAgICAga2ZyZWVfc2tiKG5z
a2IpOwo5MTEgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIH4wVTsKOTEyICAgICAgICAg
ICAgICAgICB9CjkxMyAKOTE0ICAgICAgICAgICAgICAgICBza2JfYWRkX3J4X2ZyYWcoc2tiLCBz
a2Jfc2hpbmZvKHNrYiktPm5yX2ZyYWdzLAo5MTUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBza2JfZnJhZ19wYWdlKG5mcmFnKSwKOTE2ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcngtPm9mZnNldCwgcngtPnN0YXR1cywgUEFHRV9TSVpFKTsKOTE3IAo5MTggICAgICAg
ICAgICAgICAgIHNrYl9zaGluZm8obnNrYiktPm5yX2ZyYWdzID0gMDsKOTE5ICAgICAgICAgICAg
ICAgICBrZnJlZV9za2IobnNrYik7CjkyMCAgICAgICAgIH0KOTIxIAo5MjIgICAgICAgICByZXR1
cm4gY29uczsKOTIzIH0KCgpUaGUgcmVhc29uIHRoYXQgSSBhc2sgYWJvdXQgdGhpcyBpcyBiZWNh
dXNlIEkgYW0gY29uc2lkZXJpbmcgYmVsb3cgcGF0Y2ggdG8KYXZvaWQgYSBwb3RlbnRpYWwgeGVu
LW5ldGZyb250IHJpbmcgYnVmZmVyIGNvcnJ1cHRpb24uCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwppbmRleCA4ZDMz
OTcwLi40OGEyMTYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYworKysg
Yi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwpAQCAtOTA2LDcgKzkwNiw3IEBAIHN0YXRpYyBS
SU5HX0lEWCB4ZW5uZXRfZmlsbF9mcmFncyhzdHJ1Y3QgbmV0ZnJvbnRfcXVldWUgKnF1ZXVlLAog
ICAgICAgICAgICAgICAgICAgICAgICBfX3Bza2JfcHVsbF90YWlsKHNrYiwgcHVsbF90byAtIHNr
Yl9oZWFkbGVuKHNrYikpOwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgaWYgKHVu
bGlrZWx5KHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPj0gTUFYX1NLQl9GUkFHUykpIHsKLSAg
ICAgICAgICAgICAgICAgICAgICAgcXVldWUtPnJ4LnJzcF9jb25zID0gKytjb25zOworICAgICAg
ICAgICAgICAgICAgICAgICBxdWV1ZS0+cngucnNwX2NvbnMgPSBjb25zICsgc2tiX3F1ZXVlX2xl
bihsaXN0KSArIDE7CiAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlX3NrYihuc2tiKTsKICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIH4wVTsKICAgICAgICAgICAgICAgIH0KCgpJZiB0
aGVyZSBpcyBza2IgbGVmdCBpbiBsaXN0IHdoZW4gd2UgcmV0dXJuIH4wVSwgcXVldWUtPnJ4LnJz
cF9jb25zIG1heSBiZSBzZXQKaW5jb3JyZWN0bHkuCgpXaGlsZSBJIGFtIHRyeWluZyB0byBtYWtl
IHVwIGEgY2FzZSB0aGF0IHdvdWxkIGhpdCB0aGUgY29ycnVwdGlvbiwgSSBjb3VsZCBub3QKZXhw
bGFpbiB3aHkgKHVubGlrZWx5KHNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPj0gTUFYX1NLQl9G
UkFHUykpLCBidXQgbm90Cmp1c3QgIj09Ii4gUGVyaGFwcyBfX3Bza2JfcHVsbF90YWlsKCkgbWF5
IGZhaWwgYWx0aG91Z2ggcHVsbF90byBpcyBsZXNzIHRoYW4Kc2tiX2hlYWRsZW4oc2tiKS4KClRo
YW5rIHlvdSB2ZXJ5IG11Y2ghCgpEb25nbGkgWmhhbmcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
