Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD212B1DC5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26596.55077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaRj-0004YO-JU; Fri, 13 Nov 2020 14:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26596.55077; Fri, 13 Nov 2020 14:53:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdaRj-0004Xz-G1; Fri, 13 Nov 2020 14:53:03 +0000
Received: by outflank-mailman (input) for mailman id 26596;
 Fri, 13 Nov 2020 14:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kdaRh-0004Xs-KQ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:53:01 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f78b6f1-d893-4bec-a8da-3e0818c24995;
 Fri, 13 Nov 2020 14:53:00 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADEplrC024641; Fri, 13 Nov 2020 14:52:52 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 34sd1ptxbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 14:52:52 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4455.eurprd03.prod.outlook.com (2603:10a6:20b:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:52:48 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:52:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u7TF=ET=epam.com=prvs=9586b5424c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kdaRh-0004Xs-KQ
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:53:01 +0000
X-Inumbo-ID: 9f78b6f1-d893-4bec-a8da-3e0818c24995
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9f78b6f1-d893-4bec-a8da-3e0818c24995;
	Fri, 13 Nov 2020 14:53:00 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADEplrC024641;
	Fri, 13 Nov 2020 14:52:52 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52])
	by mx0b-0039f301.pphosted.com with ESMTP id 34sd1ptxbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2020 14:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QW4EvO5bVMjn6buGdk+oJmlNAH/+vdRarF1gwsabKvB4MH8EGOQbKyOAcO1nndz/U0ctONSsn6/NJ9wjMjx1rx75JFGiZjciK3TzxFreKMAiWxkFT9/fUeEGe73VRrFQNDQ4wC1wsAAdXNFonM86QWMj1bUPom9DhTaCwHRM1G6I/kLBYLQSq6QxKpW6S3GT0oRDkv1dpgcqY3sVLBDzkbvTqEeQDfar2+Qt8mnInOCwIOZANGUUODI2u5n4L9qvgiyBRDqsq8VwlMyyQpbE8UY3hV+q37YFIwKXvX+ZyP+M2JA9fhwq2LLzfKCEh2NtdmcCa+6zLP4qxaNcNySNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKVgqdiUThdoPomleA1LrdQuB+4fJ2RkWQTgmFxbz+0=;
 b=Wen79VF+adTz9aEEK79VtANZ4IEBkfJmh+ptj9BXD0LW7MLpqGgxuzj9haYJnSbNPu4900/7XicirR47MSifjxTf2T9Em9aCL0OAUz1Vw7aX/caigGltRDCykNRgNOaeOY82j77HL22w0NoBAHo4B6Wx9/KvACUNlDgIMeyYZjaDXyoolrt2YckQ60Fj+/v/b2bFQXq50ZM9T7RyU9hQ0rE7ZPiSJuZEmA4TYVJRD2x79rhK+MNZXdnRAuPchwLUYh63w4Bggwf1vMjG6qyPKEuAWSIr00ztffAuyShfYgzZEmiFIntQGU5wHyQeeCaYR9cFJIJjW+ZyzlsuhiYOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKVgqdiUThdoPomleA1LrdQuB+4fJ2RkWQTgmFxbz+0=;
 b=MKr34Ewut43TDeAl913B3RU0XVsuHyY7NwKP01NYTAE4GP2BueIlZVfrH7dxGAWYiwNoQ/PfDaEm3hcurDA/sphT2HMtU0A5gPFljlUEeC2Qrlc3sKGZMiVq2hqqGJ3RgLPqi3NK5GuDoToO38hIADaSZmeegrEaKkk4BkW4LU6BDC9EAtGR5Gmbshf+W+EWGjXCY6F1PpyD4JBK8mJSyMeS/feo59Q1Ux+uIboAcI5JuUwogQ/g3ANGxZ+w1rVOwwBsFGIGoAu8/iT/oWX3X+5J4JLUoVomSNhUOynQspvn6PpdUuVAMET7hW9b83cbNgfEBJ2W/8OTgZMtFmT7xg==
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB4455.eurprd03.prod.outlook.com (2603:10a6:20b:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 13 Nov
 2020 14:52:48 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::f413:8db:d63e:966c%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 14:52:48 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAIAAAYQAgAABxICAAAHUgIAAAHYA
Date: Fri, 13 Nov 2020 14:52:48 +0000
Message-ID: <0162c176-d515-7850-b22c-a8451a7697cd@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
 <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
In-Reply-To: <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cec4db3-9da3-4d16-e2df-08d887e3c9d3
x-ms-traffictypediagnostic: AM6PR03MB4455:
x-microsoft-antispam-prvs: 
 <AM6PR03MB4455528E86621C6849839635E7E60@AM6PR03MB4455.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d73musrhJoGEVLWmpWQjbvIKKD+lJhhFfnuuNEuAiSmY8A8kXM82BhKetT69IeG2yy8lJ0K3yaApbGL6UePskz5/O2cABG5C6NSawf2341RbR/Kl9mYCcjdTgZ/F7rlbtAftRdSfmDVUNTPrQIYc/8alrHLSSrOnRtYkIEGwY0MPyYuIcpOnL8gR+lz1XaQEbCWE5cVgYG7p439EWpo7OsWZoyZLQDl2ZQMdx5zYzF5XxOzM5I5M6Ds7/EKBF+IuIHc1f+vO9+DfNG6E5nIKPopy0t8mmFNAz1FfUM2iyO7pIwhlGmCQj1s1isKfp8b4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(2616005)(316002)(8936002)(71200400001)(64756008)(478600001)(8676002)(91956017)(2906002)(66446008)(6916009)(54906003)(5660300002)(66476007)(4326008)(7416002)(6512007)(76116006)(36756003)(31696002)(66946007)(31686004)(83380400001)(66556008)(86362001)(6506007)(53546011)(186003)(26005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 H7mNm9heW7Z7WEzqf7Yx0usi9sjbhtBRpbPF6sI8KY8Vr/UcOGdNM08cAOQGY6PRjbdn8cU65Ng/6j6l5qNrgG+FNbq0aYtAsNPLLzMZFSJ48bcVlg36juJpvpGefMlG1S/HOr6PpIDADfPAXk182bWzJgspomiEEFERS3W3nRwHkUzE7vUGgM/ksJJVl191VIBcvz9A1K4w3FppvgnDp+8B9jQl4DNEy5L751iWfqMlhf1+J+INoh0AlIH3l0pP/VlLyjD4+QnRMxMMyYlTt7jSDxE7IVDCg+ALjLI6U4Y5YnJi16KHSYchiRmdSwnDMusfUARw1eRbG1m5EtSztj1aJsYFPTgZSUg+8ZK3RsupX+Bfkm+PL88aEmptynZYEFUwhotAYJ00T3u+htTryEj1wYKB67Ckc7XJxHpUhmyP6RG5JGjaLTkENQTVQ4yIDC6vmaO2t3zY2n3HBmIxul5m3jSiUGtN+AWZUmzaNFYMyelwDW0GLJepjZlBDBTYPUAkeXheiG6mAcMN5x/utZcHwI1YYNaMLZ//H6wbmVrPIfs0+tBqjrg8Vjapo+WdrhCBXeAwBm/YFtlnoQhL+c+VKbmdwirwHxRCmDBQddyAQL/RIr9LTIcr9Lw1fFkj7vi98QVNJMO1shhvwvHUcw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <29AF1B5B4664ED4DB7E7308EA5C2AC4C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cec4db3-9da3-4d16-e2df-08d887e3c9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 14:52:48.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSAVU+ZSnswbXZ99lQ5O6BW+hZ/DfBvnyR6fiGAklvpx0N+xmK/izxo3FGNx4yVTC2/iWWb2I/ovUBPhNKcBkNdqzwxw1IMDGTuv83OEyMUSNoyCvgDaG+4NqZ23hxOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4455
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_10:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=806 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011130094

DQpPbiAxMS8xMy8yMCA0OjUxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTEuMjAy
MCAxNTo0NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMy8yMCA0
OjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMy4xMS4yMDIwIDE1OjMyLCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEvMTMvMjAgNDoyMyBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiAgICAgRWFybGllciBvbiBJIGRpZG4ndCBzYXkgeW91IHNo
b3VsZCBnZXQgdGhpcyB0byB3b3JrLCBvbmx5DQo+Pj4+PiB0aGF0IEkgdGhpbmsgdGhlIGdlbmVy
YWwgbG9naWMgYXJvdW5kIHdoYXQgeW91IGFkZCBzaG91bGRuJ3QgbWFrZQ0KPj4+Pj4gdGhpbmdz
IG1vcmUgYXJjaCBzcGVjaWZpYyB0aGFuIHRoZXkgcmVhbGx5IHNob3VsZCBiZS4gVGhhdCBzYWlk
LA0KPj4+Pj4gc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhlIGFib3ZlIHNob3VsZCBzdGlsbCBiZSBk
b2FibGUgb24geDg2LA0KPj4+Pj4gdXRpbGl6aW5nIHN0cnVjdCBwY2lfc2VnJ3MgYnVzMmJyaWRn
ZVtdLiBUaGVyZSBvdWdodCB0byBiZQ0KPj4+Pj4gREVWX1RZUEVfUENJX0hPU1RfQlJJREdFIGVu
dHJpZXMgdGhlcmUsIGFsYmVpdCBhIG51bWJlciBvZiB0aGVtDQo+Pj4+PiAocHJvdmlkZWQgYnkg
dGhlIENQVXMgdGhlbXNlbHZlcyByYXRoZXIgdGhhbiB0aGUgY2hpcHNldCkgYXJlbid0DQo+Pj4+
PiByZWFsbHkgaG9zdCBicmlkZ2VzIGZvciB0aGUgcHVycG9zZXMgeW91J3JlIGFmdGVyLg0KPj4+
PiBZb3UgbWVhbiBJIGNhbiBzdGlsbCB1c2UgREVWX1RZUEVfUENJX0hPU1RfQlJJREdFIGFzIGEg
bWFya2VyDQo+Pj4+DQo+Pj4+IHdoaWxlIHRyeWluZyB0byBkZXRlY3Qgd2hhdCBJIG5lZWQ/DQo+
Pj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBtYXJrZXIgeW91J3JlIHRoaW5r
aW5nIGFib3V0DQo+Pj4gaGVyZS4NCj4+IEkgbWVhbiB0aGF0IHdoZW4gSSBnbyBvdmVyIGJ1czJi
cmlkZ2UgZW50cmllcywgc2hvdWxkIEkgb25seSB3b3JrIHdpdGgNCj4+DQo+PiB0aG9zZSB3aG8g
aGF2ZSBERVZfVFlQRV9QQ0lfSE9TVF9CUklER0U/DQo+IFdlbGwsIGlmIHlvdSdyZSBhZnRlciBo
b3N0IGJyaWRnZXMgLSB5ZXMuDQpPaywgSSdsbCB0cnkgdG8gc2VlIHdoYXQgSSBjYW4gZG8gYWJv
dXQgaXQuDQo+DQo+IEphbg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

