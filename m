Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28769886
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn395-0002wV-0o; Mon, 15 Jul 2019 15:44:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T47n=VM=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hn393-0002wN-FU
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 15:44:05 +0000
X-Inumbo-ID: 5f50abe8-a717-11e9-8980-bc764e045a96
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f50abe8-a717-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 15:44:04 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6FFhqTs021946;
 Mon, 15 Jul 2019 15:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=l/u+2fguqZgRhJpV4dlrbyYA/Dtl3SrTOUeeBoUA+oE=;
 b=fW0H3IJiwQoBM9x7mkpoTVBjzeWsJ+7OYm7KKUI1j93xQFeQf428au+Q+tgWS1pA2Apj
 lpi3GRrmzixEmdwrfLPupjMZ4JeZRditrdiMpyUuVVIuQkRfGcXz+mN8VNpDY5I6J/Fc
 12tRm0yyC/iIpogVxAH6RjUfMCpUvWyk58/wL7jLe/Z9MsZ7Rp5aarm49H/FBpcbDqNh
 xz8wzv3YSLABCMDItqzi0nbvnMiYZl2/rVs1hUX4UVE1JYCC8McSP3XucHCvfmWegVvy
 QoP1oDdfyFhetcfNznmxwpZyO+wcYosuvYfkGqZt71bTqXJdlsSDuDRh8xcv+Lp5EeIr RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2tq6qtfcp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 15:43:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6FFge8S173725;
 Mon, 15 Jul 2019 15:43:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2tq5bbvewc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 15:43:48 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6FFhjg9011527;
 Mon, 15 Jul 2019 15:43:45 GMT
Received: from bostrovs-us.us.oracle.com (/10.152.32.65)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Jul 2019 08:43:45 -0700
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <20190715113739.17694-1-jgross@suse.com>
 <20190715113739.17694-2-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <91ed11a0-c97e-8caf-c71c-4595be4dbbb4@oracle.com>
Date: Mon, 15 Jul 2019 11:44:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190715113739.17694-2-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9319
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907150185
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9319
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907150185
Subject: Re: [Xen-devel] [PATCH 1/2] x86/xen: remove 32-bit Xen PV guest
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9NYWtlZmlsZSBiL2FyY2gveDg2L3hlbi9NYWtl
ZmlsZQo+IGluZGV4IDA4NGRlNzdhMTA5ZS4uZDQyNzM3ZjMxMzA0IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gveDg2L3hlbi9NYWtlZmlsZQo+ICsrKyBiL2FyY2gveDg2L3hlbi9NYWtlZmlsZQo+IEBAIC0x
LDUgKzEsNSBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gLU9CSkVD
VF9GSUxFU19OT05fU1RBTkRBUkRfeGVuLWFzbV8kKEJJVFMpLm8gOj0geQo+ICtPQkpFQ1RfRklM
RVNfTk9OX1NUQU5EQVJEX3hlbi1hc21fNjQubyA6PSB5Cj4gIAo+ICBpZmRlZiBDT05GSUdfRlVO
Q1RJT05fVFJBQ0VSCj4gICMgRG8gbm90IHByb2ZpbGUgZGVidWcgYW5kIGxvd2xldmVsIHV0aWxp
dGllcwo+IEBAIC0zNCw3ICszNCw3IEBAIG9iai0kKENPTkZJR19YRU5fUFYpCQkrPSBtbXVfcHYu
bwo+ICBvYmotJChDT05GSUdfWEVOX1BWKQkJKz0gaXJxLm8KPiAgb2JqLSQoQ09ORklHX1hFTl9Q
VikJCSs9IG11bHRpY2FsbHMubwo+ICBvYmotJChDT05GSUdfWEVOX1BWKQkJKz0geGVuLWFzbS5v
Cj4gLW9iai0kKENPTkZJR19YRU5fUFYpCQkrPSB4ZW4tYXNtXyQoQklUUykubwo+ICtvYmotJChD
T05GSUdfWEVOX1BWKQkJKz0geGVuLWFzbV82NC5vCgpXZSBzaG91bGQgYmUgYWJsZSB0byBtZXJn
ZSB4ZW4tYXNtXzY0LlMgaW50byB4ZW4tYXNtLlMsIHNob3VsZG4ndCB3ZT8KCgo+IEBAIC0xMzEy
LDE1ICsxMjkwLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0
X2tlcm5lbCh2b2lkKQo+ICAKPiAgCS8qIGtlZXAgdXNpbmcgWGVuIGdkdCBmb3Igbm93OyBubyB1
cmdlbnQgbmVlZCB0byBjaGFuZ2UgaXQgKi8KPiAgCj4gLSNpZmRlZiBDT05GSUdfWDg2XzMyCj4g
LQlwdl9pbmZvLmtlcm5lbF9ycGwgPSAxOwo+IC0JaWYgKHhlbl9mZWF0dXJlKFhFTkZFQVRfc3Vw
ZXJ2aXNvcl9tb2RlX2tlcm5lbCkpCj4gLQkJcHZfaW5mby5rZXJuZWxfcnBsID0gMDsKPiAtI2Vs
c2UKPiAgCXB2X2luZm8ua2VybmVsX3JwbCA9IDA7CgpJcyBrZXJuZWxfcnBsIG5lZWRlZCBhbnlt
b3JlPwoKCi1ib3JpcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
