Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3713F99D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 20:36:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isAtB-0003cS-Oz; Thu, 16 Jan 2020 19:33:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e/Wk=3F=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1isAtA-0003cN-Hm
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 19:33:08 +0000
X-Inumbo-ID: 03b58358-3897-11ea-87b9-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03b58358-3897-11ea-87b9-12813bfff9fa;
 Thu, 16 Jan 2020 19:33:04 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GJSA7B103088;
 Thu, 16 Jan 2020 19:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=+3CiL8o4Ab1hWnW+Bk1R7PIglLbQpoWVfBDqitAc30E=;
 b=hjodwcHNG44e9KM05h9K83TmC2ixqR2EykHwMiDLJSgKuPJEnl4yzs62CSTa6754+8eP
 /ozW6kq4i4WUoMfzN9fb4rALlTuwRusdzplqAOPYxHMesCuCNYK9YM7edrQHZeckbldP
 2xmyHwwRxD70cpnpWucsSPbLhzLI4pm7SUEVsyV2KJk7yqsONTnIaUuH79iKfk4eWG8T
 6T2aQ9wYiBZsjVdd3GA2Vq1nLcloG0CQnZEPO93hG1VMKDeepdGP72Jd3h2aajioqXga
 Mg9JmC3qzuVUlwhLZddqjuWgS1Ld3vjk3Qr1KlB+3gVuNAcnvwYYisHSu1YoSjV+uW1d 3w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2xf73yvnej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 19:33:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00GJSwAN179955;
 Thu, 16 Jan 2020 19:33:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2xhy23wdr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 19:33:02 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00GJX0Nm016627;
 Thu, 16 Jan 2020 19:33:00 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 Jan 2020 11:33:00 -0800
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200116170004.14373-1-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <dee2ba34-c39a-9729-8136-463c0daae9d6@oracle.com>
Date: Thu, 16 Jan 2020 14:32:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200116170004.14373-1-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001160156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9502
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001160156
Subject: Re: [Xen-devel] [PATCH] xen/balloon: Support xend-based toolstack
 take two
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxLzE2LzIwIDEyOjAwIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IENvbW1pdCAzYWE2
YzE5ZDJmMzhiZSAoInhlbi9iYWxsb29uOiBTdXBwb3J0IHhlbmQtYmFzZWQgdG9vbHN0YWNrIikK
PiB0cmllZCB0byBmaXggYSByZWdyZXNzaW9uIHdpdGggcnVubmluZyBvbiByYXRoZXIgYW5jaWVu
dCBYZW4gdmVyc2lvbnMuCj4gVW5mb3J0dW5hdGVseSB0aGUgZml4IHdhcyBiYXNlZCBvbiB0aGUg
YXNzdW1wdGlvbiB0aGF0IHhlbmQgd291bGQKPiBqdXN0IHVzZSBhbm90aGVyIFhlbnN0b3JlIG5v
ZGUsIGJ1dCBpbiByZWFsaXR5IG9ubHkgc29tZSBkb3duc3RyZWFtCj4gdmVyc2lvbnMgb2YgeGVu
ZCBhcmUgZG9pbmcgdGhhdC4gVGhlIHVwc3RyZWFtIHhlbmQgZG9lcyBub3Qgd3JpdGUKPiB0aGF0
IFhlbnN0b3JlIG5vZGUgYXQgYWxsLCBzbyB0aGUgcHJvYmxlbSBtdXN0IGJlIGZpeGVkIGluIGFu
b3RoZXIKPiB3YXkuCj4KPiBUaGUgZWFzaWVzdCB3YXkgdG8gYWNoaWV2ZSB0aGF0IGlzIHRvIGZh
bGwgYmFjayB0byB0aGUgYmVoYXZpb3IgYmVmb3JlCj4gY29tbWl0IDUyNjZiOGU0NDQ1YyAoInhl
bjogZml4IGJvb3RpbmcgYmFsbG9vbmVkIGRvd24gaHZtIGd1ZXN0IikKPiBpbiBjYXNlIHRoZSBz
dGF0aWMgbWVtb3J5IG1heGltdW0gY2FuJ3QgYmUgcmVhZC4KPgo+IEZpeGVzOiAzYWE2YzE5ZDJm
MzhiZSAoInhlbi9iYWxsb29uOiBTdXBwb3J0IHhlbmQtYmFzZWQgdG9vbHN0YWNrIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiAjIDQuMTMKClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
