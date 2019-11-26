Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B013910A23F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdmi-0006Vz-Pq; Tue, 26 Nov 2019 16:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+oYA=ZS=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iZdmh-0006Vu-2B
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:33:51 +0000
X-Inumbo-ID: 869ed15c-106a-11ea-83b8-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 869ed15c-106a-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 16:33:50 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQGJHlY142142;
 Tue, 26 Nov 2019 16:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=dV+UNnbFbZyy2zMG1GD9dLeJuiMR7oDetZ136K6ZlvE=;
 b=Ieb+aaiWXI0sOiBUtdR+N0XI0/eHNeLozJDX0NRFLcl28lcdZdPhhJ3NfIybwL28vQNS
 DRoeUGf6hquGdmcRMnEfB8UpF3Md44WHnOeQJ9510bRpTMB6Qc1sbd+ygR3uCaAiawRd
 97WsRgsHck/GZfcxd2P550UIVGhJ0bIFZU6GtfKR2gAKU9XvSXHj4FHn73x9OJAuh1DQ
 S/C44hdDY2Nwlju1vWy1sd0naenQaww5dKRwTEvEEZYpmyJjEqbG2YEP5Ovr4Whb3GqL
 mPb+1qulTalsq3scVJoUKF1Yr3m45OH1T8rFc2jee7Slmu46vVVuyZu9p2hfrOTTFp4c 0Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2wevqq815x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 16:33:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQGIgEO110915;
 Tue, 26 Nov 2019 16:33:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2wgvhaaa3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 16:33:44 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQGXgd8011730;
 Tue, 26 Nov 2019 16:33:42 GMT
Received: from [10.211.47.34] (/10.211.47.34)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 08:33:42 -0800
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <9c80966a-05db-bd0e-c7c2-fccf8c3fb02d@oracle.com>
Date: Tue, 26 Nov 2019 08:33:41 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126132648.6917-3-roger.pau@citrix.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9453
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9453
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260139
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgNToyNiBBTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
cG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBwb3NzaWJsZSB0aGF0IHRo
ZQo+IHZDUFUgcmVzdW1lcyBleGVjdXRpb24gd2l0aCBhIHN0YWxlIGxvY2FsIEFQSUMgSVJSIHJl
Z2lzdGVyIGJlY2F1c2UKPiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMgdG8gYmUgaW5qZWN0
ZWQgdmxhcGljX2hhc19wZW5kaW5nX2lycQo+IG1pZ2h0IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVz
IFBJUiB3b24ndCBiZSBzeW5jZWQgaW50byBJUlIuCj4gCj4gRml4IHRoaXMgYnkgbWFraW5nIHN1
cmUgUElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluCj4gaHZtX3ZjcHVfaGFzX3BlbmRpbmdf
aXJxIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpbnRlcnJ1cHRzIGFyZSBwZW5kaW5nLgo+IAo+IFdoaWxl
IHRoZXJlIGFsc28gc2ltcGxpZnkgdGhlIGNvZGUgaW4gX192bXhfZGVsaXZlcl9wb3N0ZWRfaW50
ZXJydXB0Ogo+IG9ubHkgcmFpc2UgYSBzb2Z0aXJxIGlmIHRoZSB2Q1BVIGlzIHRoZSBvbmUgY3Vy
cmVudGx5IHJ1bm5pbmcgYW5kCj4gX192bXhfZGVsaXZlcl9wb3N0ZWRfaW50ZXJydXB0IGlzIGNh
bGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0LiBUaGUKPiBzb2Z0aXJxIGlzIHJhaXNlZCB0byBt
YWtlIHN1cmUgdm14X2ludHJfYXNzaXN0IGlzIHJldHJpZWQgaWYgdGhlCj4gaW50ZXJydXB0IGhh
cHBlbnMgdG8gYXJyaXZlIGFmdGVyIHZteF9pbnRyX2Fzc2lzdCBidXQgYmVmb3JlCj4gaW50ZXJy
dXB0cyBhcmUgZGlzYWJsZWQgaW4gdm14X2RvX3ZtZW50cnkuIEFsc28gc2ltcGxpZnkgdGhlIGxv
Z2ljIGZvcgo+IElQSWluZyBvdGhlciBwQ1BVcywgdGhlcmUncyBubyBuZWVkIHRvIGNoZWNrIHYt
PnByb2Nlc3NvciBzaW5jZSB0aGUKPiBJUEkgc2hvdWxkIGJlIHNlbnQgYXMgbG9uZyBhcyB0aGUg
dkNQVSBpcyBub3QgdGhlIGN1cnJlbnQgb25lIGFuZCBpdCdzCj4gcnVubmluZy4KPiAKPiBSZXBv
cnRlZC1ieTogSm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpQYXRjaCB3b3JrcyBmb3IgbWUuClRlc3RlZC1ieTog
Sm9lIEppbiA8am9lLmppbkBvcmFjbGUuY29tPgoKVGhhbmtzLApKb2UKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
