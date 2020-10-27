Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A0A29B794
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 16:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12963.33460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXRHM-00069o-9P; Tue, 27 Oct 2020 15:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12963.33460; Tue, 27 Oct 2020 15:52:56 +0000
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
	id 1kXRHM-00069P-6D; Tue, 27 Oct 2020 15:52:56 +0000
Received: by outflank-mailman (input) for mailman id 12963;
 Tue, 27 Oct 2020 15:52:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kXRHL-00069K-10
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 15:52:55 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9586153-8ea9-4817-a6e9-7627099ee4fd;
 Tue, 27 Oct 2020 15:52:53 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RFnpif024163; Tue, 27 Oct 2020 15:52:46 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 34dmbx68h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Oct 2020 15:52:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5700.eurprd03.prod.outlook.com (2603:10a6:208:16f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 15:52:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 15:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=y/3m=EC=epam.com=prvs=8569373f95=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
	id 1kXRHL-00069K-10
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 15:52:55 +0000
X-Inumbo-ID: b9586153-8ea9-4817-a6e9-7627099ee4fd
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b9586153-8ea9-4817-a6e9-7627099ee4fd;
	Tue, 27 Oct 2020 15:52:53 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
	by mx0b-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09RFnpif024163;
	Tue, 27 Oct 2020 15:52:46 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
	by mx0b-0039f301.pphosted.com with ESMTP id 34dmbx68h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2020 15:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvSiumjoBJjPUyl96pA4106ckW/Y6kVwHdr03vQeCgc382u2pZSoZwCC2z/0vAgDeRvpJlbTx51VW0W1pzlmimNruAFWOnQVh7mineuFarONWwdMzpdYxghSW1QNOHsE9QI629nTmB6ZedjeGydUoFLepldZaX+p0SXvYY97wyhSSnApXBGRSkpBrru55j9x8jMFiee9iTKOLd8Gm31SCqb/2uvmFyc9svfpFyf8nEXDe0Uqni2JAKeq9M8enr0lQtK31+MUC5zcdFzqMS3ix3od4tTTBGYRHXkkcFRyE/TYxJpxemcq7iKKouxN4n+6cAsqJ/2EqbMh7PGA2MIHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypum0ZP6pul9yjowOAW9sosm/3UXA3wT5wkWTOQsbTE=;
 b=d1eQUqUKbkkYgsaoTJYSKzKPuPw6FxBLq24suY+lg0mU7MQNvvgOg3BdGHnoCwNqmLx2wYTyrL6b6EZc3NRXNXM2S+yGGBMRd7Z26Gz+O4sReez6/YVTp5j31mgNEMFdz5uy8eMp8nWhNzJGx4RAYv5Aid5hKpjBn4SDgx8Xat6/onhgGDUbq7bbXeCzaTn4pqGvHDpf29q9zESJkcm+45akefhb2BoGrEkH4HSVmPSxRH9cQHsawpwMI3lzlT1rWbH7x+r+t0TjKJMSNAqR0Wui15zEfBQaByymUBHBfTj/aH7JHeY9St++XxFuJf2A813/DpSSw9zyGzCFw1IY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypum0ZP6pul9yjowOAW9sosm/3UXA3wT5wkWTOQsbTE=;
 b=t0gEVKG/0Qr6EeK5P2GgCgGBdvYqqCXDoUlCBWO7Swa8+vWh4fyebgpCQj3kEYT9P2YqJm91fpJ8RbPJNZnWY7UQqhwR+LKE/3k2NgE9HEVIDeBaabRO5shgZZlDdAFLUK+SR4fybuwwpgGRm45ylf93RZmKLQ5m/Ee2WZBlSb+2N/XN8dAWiCm2iQFVxMQh/KPp2p6pfo2oWyHErEsmTsP9YLXlxgbbGEiCehK6S6kMZgFjSbA5erUMUCDl8P+RVURyQebkPQk7BuOJ7pB0/KroXVT071r2p5YtQ8TdSl+eadsAWF65e6c7tWA5TYUpuG0AHbBj4XQ2EsRuBy3nEQ==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5700.eurprd03.prod.outlook.com (2603:10a6:208:16f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 15:52:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%8]) with mapi id 15.20.3477.029; Tue, 27 Oct 2020
 15:52:42 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "wl@xen.org" <wl@xen.org>, "paul@xen.org"
	<paul@xen.org>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Topic: ARM/PCI passthrough: libxl_pci, sysfs and pciback questions
Thread-Index: AQHWrEfNmyZZUV4zgEum5lDBP9dPxqmraEMAgAAxlIA=
Date: Tue, 27 Oct 2020 15:52:42 +0000
Message-ID: <ac342c70-8fbb-023d-00b3-4a1bc1d389a7@epam.com>
References: <ad25a5ba-f44c-4e88-f3b0-e0baa5efc5f6@epam.com>
 <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
In-Reply-To: <20201027125104.axv26kdqljqsvufn@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd9da055-fdff-452e-7222-08d87a905718
x-ms-traffictypediagnostic: AM0PR03MB5700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB57003FDBD8584C6CF4A8A9CDE7160@AM0PR03MB5700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MVOFD7LpiErbrZiE0KCIFyfhH8ARNMluCtveaap0sEDNgI+4nfxy6u+dQP2037msFegN3dA9ymcIUEChoxlhw1QVvxrHTnG2ynkhaAFo+aThJ/8X1G/lHUW+R1YhRvDNZtWLPMWK4KpyX4V9y5wOsfjtuM60hOmlJGHFdFBT6Ycia3ljPiolWmx99cr96dSIdzHXvXyFtagfgpgCCNCFGPUTA1eOhHdkMnpCmuQoFSF95dFXC+qRuKJwxXoCtZqvPgC0fAgvD7mhZjLPrJE7okj/SfKchNmsuQWofXJgKP5qqdREQedxx/dsk10YdK8129dOM15a4nVrFubGmtYhlw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(5660300002)(76116006)(66946007)(66476007)(2906002)(36756003)(66446008)(7416002)(66556008)(64756008)(2616005)(478600001)(8936002)(53546011)(71200400001)(54906003)(6512007)(86362001)(6486002)(6506007)(6916009)(8676002)(83380400001)(316002)(31696002)(31686004)(4326008)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 J6EQ4qh4FpE2CpkjHAbhktfJyw8Hl3ZCWZrsz750RFCLLw0pxrlEZZRkQCaEhALTK2yL6Ur+jYFMMKWIdm3YKeVq+h9ediwXFCIuXVQTXUszDHID0un/sB4OYX7bGa9gU1k2QTJVt1E4lsHaoecD19AYMqmISIP3b4EICOGjo8y7LHGXQCPB7KUVEVhD9A1d8aI5lfTaECF6GZppjGP77h9spWD28DXZhYLjbp9toPI7m99uRgdV5rvUEd4trTSysRATOHR3ldr4K5M5wTBDsbzYo+iKNgHfGg/PWGBBMbfnpbOf+dLPjyyVJwwuMdXqSS7CFePoUnOnP8XE6YEbr6FVgvl+l5iLGcpEep/T7P9XOtFkqG3hcI4H+v/r5Z07FVXjitJSpbdxmmtCJ3Tkee+z+fgbuxiBnuct6JApB6DTj380bvhZtyVuxaJjf4+826mqjsJBdn/HrmTQX+E+202ZxbhJmUw9XVRJKHWakKaimOnbNg45663YfU+f7wXChAzcqd7o/6gaMc6aho4LVrkhdzyjHPqwaz6EIp62Z3wiIz9tUyPVl0cQYId6ugd95YHX9p+mZ5zL6yA6rbEDTo1wmU6mS8LWb+cp8JQA8CBXxvSh3DOhacqozGIibIifl4+FQ6ZpPrN48ngfbWJU8A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <51389A2462735146BE4B4CDAFEB521A7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9da055-fdff-452e-7222-08d87a905718
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 15:52:42.6939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydadhrt917nhZIaS5hOdi+pCA1dsAfSkz0plyIm6Uw0Hx6x0Xx0s3g2PDzrVhqPAxrwxind8sfUMmty3D819hGNCwWOSmU3s6JB2HSz+LlbIwVodSgvRvxeFeOxKaKuK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5700
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-27_08:2020-10-26,2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010270098

SGVsbG8sIFJvZ2VyIQ0KDQpPbiAxMC8yNy8yMCAyOjU1IFBNLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPiBPbiBUdWUsIE9jdCAyNywgMjAyMCBhdCAwOTo1OTowNUFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhlbGxvLCBhbGwhDQo+Pg0KPj4gV2hpbGUgd29y
a2luZyBvbiBQQ0kgcGFzc3Rocm91Z2ggb24gQVJNIChwYXJ0aWFsIFJGQyB3YXMgcHVibGlzaGVk
IGJ5IEFSTQ0KPj4gZWFybGllciB0aGlzIHllYXIpIEkgdHJpZWQgdG8gaW1wbGVtZW50IHNvbWUg
cmVsYXRlZCBjaGFuZ2VzIGluIHRoZSB0b29sc3RhY2suDQo+PiBPbmUgb2YgdGhlIG9ic3RhY2xl
cyBmb3IgQVJNIGlzIFBDSSBiYWNrZW5k4oCZcyByZWxhdGVkIGNvZGUgcHJlc2VuY2U6IEFSTSBp
cw0KPj4gZ29pbmcgdG8gZnVsbHkgZW11bGF0ZSBhbiBFQ0FNIGhvc3QgYnJpZGdlIGluIFhlbiwg
c28gbm8gUENJIGJhY2tlbmQvZnJvbnRlbmQNCj4+IHBhaXIgaXMgZ29pbmcgdG8gYmUgdXNlZC4N
Cj4+DQo+PiBJZiBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3QgdGhlIGZ1bmN0aW9uYWxpdHkgd2hp
Y2ggaXMgaW1wbGVtZW50ZWQgYnkgdGhlDQo+PiBwY2liYWNrIGFuZCB0b29sc3RhY2sgYW5kIHdo
aWNoIGlzIHJlbGV2YW50L25lZWRlZCBmb3IgQVJNOg0KPj4NCj4+ICAgwqAxLiBwY2liYWNrIGlz
IHVzZWQgYXMgYSBkYXRhYmFzZSBmb3IgYXNzaWduYWJsZSBQQ0kgZGV2aWNlcywgZS5nLiB4bA0K
Pj4gICDCoMKgwqAgcGNpLWFzc2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFuaXB1bGF0ZXMg
dGhhdCBsaXN0LiBTbywgd2hlbmV2ZXIgdGhlDQo+PiAgIMKgwqDCoCB0b29sc3RhY2sgbmVlZHMg
dG8ga25vdyB3aGljaCBQQ0kgZGV2aWNlcyBjYW4gYmUgcGFzc2VkIHRocm91Z2ggaXQgcmVhZHMN
Cj4+ICAgwqDCoMKgIHRoYXQgZnJvbSB0aGUgcmVsZXZhbnQgc3lzZnMgZW50cmllcyBvZiB0aGUg
cGNpYmFjay4NCj4+DQo+PiAgIMKgMi4gcGNpYmFjayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVuYm91
bmQgUENJIGRldmljZXMsIGUuZy4gd2hlbiBwYXNzaW5nIHRocm91Z2ggYQ0KPj4gICDCoMKgwqAg
UENJIGRldmljZSBpdCBuZWVkcyB0byBiZSB1bmJvdW5kIGZyb20gdGhlIHJlbGV2YW50IGRldmlj
ZSBkcml2ZXIgYW5kIGJvdW5kDQo+PiAgIMKgwqDCoCB0byBwY2liYWNrIChzdHJpY3RseSBzcGVh
a2luZyBpdCBpcyBub3QgcmVxdWlyZWQgdGhhdCB0aGUgZGV2aWNlIGlzIGJvdW5kIHRvDQo+PiAg
IMKgwqDCoCBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGEgZGF0YWJhc2Ug
b2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBDSQ0KPj4gICDCoMKgwqAgZGV2aWNlcywgc28gd2UgY2Fu
IHJlLWJpbmQgdGhlIGRldmljZXMgYmFjayB0byB0aGVpciBvcmlnaW5hbCBkcml2ZXJzIHdoZW4N
Cj4+ICAgwqDCoMKgIGd1ZXN0IGRvbWFpbiBzaHV0cyBkb3duKQ0KPj4NCj4+ICAgwqAzLiB0b29s
c3RhY2sgZGVwZW5kcyBvbiBEb21haW4tMCBmb3IgZGlzY292ZXJpbmcgUENJIGRldmljZSByZXNv
dXJjZXMgd2hpY2ggYXJlDQo+PiAgIMKgwqDCoCB0aGVuIHBlcm1pdHRlZCBmb3IgdGhlIGd1ZXN0
IGRvbWFpbiwgZS5nIE1NSU8gcmFuZ2VzLCBJUlFzLiBhcmUgcmVhZCBmcm9tDQo+PiAgIMKgwqDC
oCB0aGUgc3lzZnMNCj4+DQo+PiAgIMKgNC4gdG9vbHN0YWNrIGlzIHJlc3BvbnNpYmxlIGZvciBy
ZXNldHRpbmcgUENJIGRldmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2ggdmlhDQo+PiAgIMKgwqDC
oCBzeXNmcy9yZXNldCBvZiB0aGUgRG9tYWluLTDigJlzIFBDSSBidXMgc3Vic3lzdGVtDQo+Pg0K
Pj4gICDCoDUuIHRvb2xzdGFjayBpcyByZXNwb25zaWJsZSBmb3IgdGhlIGRldmljZXMgYXJlIHBh
c3NlZCB3aXRoIGFsbCByZWxldmFudA0KPj4gICDCoMKgwqAgZnVuY3Rpb25zLCBlLmcuIHNvIGZv
ciBtdWx0aWZ1bmN0aW9uIGRldmljZXMgYWxsIHRoZSBmdW5jdGlvbnMgYXJlIHBhc3NlZCB0bw0K
Pj4gICDCoMKgwqAgYSBkb21haW4gYW5kIG5vIHBhcnRpYWwgcGFzc3Rocm91Z2ggaXMgZG9uZQ0K
Pj4NCj4+ICAgwqA2LiB0b29sc3RhY2sgY2FyZXMgYWJvdXQgU1ItSU9WIGRldmljZXMgKGFtIEkg
Y29ycmVjdCBoZXJlPykNCj4gSSdtIG5vdCBzdXJlIEkgZnVsbHkgdW5kZXJzdGFuZCB3aGF0IHRo
aXMgbWVhbnMuIFRvb2xzdGFjayBjYXJlcyBhYm91dA0KPiBTUi1JT1YgYXMgaXQgY2FyZXMgYWJv
dXQgb3RoZXIgUENJIGRldmljZXMsIGJ1dCB0aGUgU1ItSU9WDQo+IGZ1bmN0aW9uYWxpdHkgaXMg
bWFuYWdlZCBieSB0aGUgKGRvbTApIGtlcm5lbC4NClllcywgeW91IGFyZSByaWdodC4gUGxlYXNl
IGlnbm9yZSAjNg0KPg0KPj4NCj4+IEkgaGF2ZSBpbXBsZW1lbnRlZCBhIHJlYWxseSBkaXJ0eSBQ
T0MgZm9yIHRoYXQgd2hpY2ggSSB3b3VsZCBuZWVkIHRvIGNsZWFuIHVwDQo+PiBiZWZvcmUgc2hv
d2luZywgYnV0IGJlZm9yZSB0aGF0IEkgd291bGQgbGlrZSB0byBnZXQgc29tZSBmZWVkYmFjayBh
bmQgYWR2aWNlIG9uDQo+PiBob3cgdG8gcHJvY2VlZCB3aXRoIHRoZSBhYm92ZS4gSSBzdWdnZXN0
IHdlOg0KPj4NCj4+ICAgwqAxLiBNb3ZlIGFsbCBwY2liYWNrIHJlbGF0ZWQgY29kZSAod2hpY2gg
c2VlbXMgdG8gYmVjb21lIHg4NiBjb2RlIG9ubHkpIGludG8gYQ0KPj4gICDCoMKgwqAgZGVkaWNh
dGVkIGZpbGUsIHNvbWV0aGluZyBsaWtlIHRvb2xzL2xpYnhsL2xpYnhsX3BjaV94ODYuYw0KPj4N
Cj4+ICAgwqAyLiBNYWtlIHRoZSBmdW5jdGlvbmFsaXR5IG5vdyBwcm92aWRlZCBieSBwY2liYWNr
IGFyY2hpdGVjdHVyZSBkZXBlbmRlbnQsIHNvDQo+PiAgIMKgwqDCoCB0b29scy9saWJ4bC9saWJ4
bF9wY2kuYyBkZWxlZ2F0ZXMgYWN0dWFsIGFzc2lnbmFibGUgZGV2aWNlIGxpc3QgaGFuZGxpbmcg
dG8NCj4+ICAgwqDCoMKgIHRoYXQgYXJjaCBjb2RlIGFuZCB1c2VzIHNvbWUgc29ydCBvZiDigJxv
cHPigJ0sIGUuZy4NCj4+ICAgwqDCoMKgIGFyY2gtPm9wcy5nZXRfYWxsX2Fzc2lnbmFibGUsIGFy
Y2gtPm9wcy5hZGRfYXNzaWduYWJsZSBldGMuIChUaGlzIGNhbiBhbHNvDQo+PiAgIMKgwqDCoCBi
ZSBkb25lIHdpdGgg4oCcI2lmZGVmIENPTkZJR19QQ0lCQUNL4oCdLCBidXQgc2VlbXMgdG8gYmUg
bm90IGN1dGUpLiBJbnRyb2R1Y2UNCj4+ICAgwqDCoMKgIHRvb2xzL2xpYnhsL2xpYnhsX3BjaV9h
cm0uYyB0byBwcm92aWRlIEFSTSBpbXBsZW1lbnRhdGlvbi4NCj4gVG8gYmUgZmFpciB0aGlzIGlz
IGFyY2ggYW5kIE9TIGRlcGVuZGVudCwgc2luY2UgaXQncyBjdXJyZW50bHkgYmFzZWQNCj4gb24g
c3lzZnMgd2hpY2ggaXMgTGludXggc3BlY2lmaWMuIFNvIGl0IHNob3VsZCByZWFsbHkgYmUNCj4g
bGlieGxfcGNpX2xpbnV4X3g4Ni5jIG9yIHNpbWlsYXIuDQpUaGlzIGlzIHRydWUsIGJ1dCBkbyB3
ZSByZWFsbHkgaGF2ZSBhbnkgb3RoZXIgaW1wbGVtZW50YXRpb24geWV0Pw0KPg0KPj4gICDCoDMu
IEFSTSBvbmx5OiBBcyB3ZSBkbyBub3QgaGF2ZSBwY2liYWNrIG9uIEFSTSB3ZSBuZWVkIHRvIGhh
dmUgc29tZSBzdG9yYWdlIGZvcg0KPj4gICDCoMKgwqAgYXNzaWduYWJsZSBkZXZpY2UgbGlzdDog
bW92ZSB0aGF0IGludG8gWGVuIGJ5IGV4dGVuZGluZyBzdHJ1Y3QgcGNpX2RldiB3aXRoDQo+PiAg
IMKgwqDCoCDigJxib29sIGFzc2lnbmVk4oCdIGFuZCBwcm92aWRpbmcgc3lzY3RscyBmb3IgbWFu
aXB1bGF0aW5nIHRoYXQsIGUuZy4NCj4+ICAgwqDCoMKgIFhFTl9TWVNDVExfcGNpX2RldmljZV97
c2V0fGdldH1fYXNzaWduZWQsDQo+PiAgIMKgwqDCoCBYRU5fU1lTQ1RMX3BjaV9kZXZpY2VfZW51
bV9hc3NpZ25lZCAodG8gZW51bWVyYXRlL2dldCB0aGUgbGlzdCBvZg0KPj4gICDCoMKgwqAgYXNz
aWduZWQvbm90LWFzc2lnbmVkIFBDSSBkZXZpY2VzKS4gQ2FuIHRoaXMgYWxzbyBiZSBpbnRlcmVz
dGluZyBmb3IgeDg2PyBBdA0KPj4gICDCoMKgwqAgdGhlIG1vbWVudCBpdCBzZWVtcyB0aGF0IHg4
NiBkb2VzIHJlbHkgb24gcGNpYmFjayBwcmVzZW5jZSwgc28gcHJvYmFibHkgdGhpcw0KPj4gICDC
oMKgwqAgY2hhbmdlIG1pZ2h0IG5vdCBiZSBpbnRlcmVzdGluZyBmb3IgeDg2IHdvcmxkLCBidXQg
bWF5IGFsbG93IHN0cmlwcGluZw0KPj4gICDCoMKgwqAgcGNpYmFjayBmdW5jdGlvbmFsaXR5IGEg
Yml0IGFuZCBtYWtpbmcgdGhlIGNvZGUgY29tbW9uIHRvIGJvdGggQVJNIGFuZCB4ODYuDQo+IEhv
dyBhcmUgeW91IGdvaW5nIHRvIHBlcmZvcm0gdGhlIGRldmljZSByZXNldCB0aGVuPyBXaWxsIHlv
dSBhc3NpZ24NCj4gdGhlIGRldmljZSB0byBkb20wIGFmdGVyIHJlbW92aW5nIGl0IGZyb20gdGhl
IGd1ZXN0IHNvIHRoYXQgZG9tMCBjYW4NCj4gcGVyZm9ybSB0aGUgcmVzZXQ/IFlvdSB3aWxsIG5l
ZWQgdG8gdXNlIGxvZ2ljIGN1cnJlbnRseSBwcmVzZW50IGluDQo+IHBjaWJhY2sgdG8gZG8gc28g
SUlSQy4NCj4NCj4gSXQgZG9lc24ndCBzZWVtIGxpa2UgYSBiYWQgYXBwcm9hY2gsIGJ1dCB0aGVy
ZSBhcmUgbW9yZSBjb25zZXF1ZW5jZXMNCj4gdGhhbiBqdXN0IGhvdyBhc3NpZ25hYmxlIGRldmlj
ZXMgYXJlIGxpc3RlZC4NCj4NCj4gQWxzbyBYZW4gZG9lc24ndCBjdXJyZW50bHkga25vdyBhYm91
dCBJT01NVSBncm91cHMsIHNvIFhlbiB3b3VsZCBoYXZlDQo+IHRvIGdhaW4gdGhpcyBrbm93bGVk
Z2UgaW4gb3JkZXIgdG8ga25vdyB0aGUgbWluaW1hbCBzZXQgb2YgUENJIGRldmljZXMNCj4gdGhh
dCBjYW4gYmUgYXNzaWduZWQgdG8gYSBndWVzdC4NCkdvb2QgcG9pbnQsIEknbGwgY2hlY2sgdGhl
IHJlbGV2YW50IHJlc2V0IGNvZGUuIFRoYW5rcw0KPg0KPj4gICDCoDQuIEFSTSBvbmx5OiBJdCBp
cyBub3QgY2xlYXIgaG93IHRvIGhhbmRsZSByZS1iaW5kaW5nIG9mIHRoZSBQQ0kgZHJpdmVyIG9u
DQo+PiAgIMKgwqDCoCBndWVzdCBzaHV0ZG93bjogd2UgbmVlZCB0byBzdG9yZSB0aGUgc3lzZnMg
cGF0aCBvZiB0aGUgb3JpZ2luYWwgZHJpdmVyIHRoZQ0KPj4gICDCoMKgwqAgZGV2aWNlIHdhcyBi
b3VuZCB0by4gRG8gd2UgYWxzbyB3YW50IHRvIHN0b3JlIHRoYXQgaW4gc3RydWN0IHBjaV9kZXY/
DQo+IEknbSBub3Qgc3VyZSBJIGZvbGxvdyB5b3UgaGVyZS4gT24gc2h1dGRvd24gdGhlIGRldmlj
ZSB3b3VsZCBiZQ0KPiBoYW5kbGVkIGJhY2sgdG8gWGVuPw0KDQpDdXJyZW50bHkgaXQgaXMgYm91
bmQgYmFjayB0byB0aGUgZHJpdmVyIHdoaWNoIHdlIHNlaXplZCB0aGUgZGV2aWNlIGZyb20gKGlm
IGFueSkuDQoNClNvLCBwcm9iYWJseSB0aGUgc2FtZSBsb2dpYyBzaG91bGQgcmVtYWluPw0KDQo+
DQo+IE1vc3QgY2VydGFpbmx5IHdlIGRvbid0IHdhbnQgdG8gc3RvcmUgYSBzeXNmcyAoTGludXgg
cHJpdmF0ZQ0KPiBpbmZvcm1hdGlvbikgaW5zaWRlIG9mIGEgWGVuIHNwZWNpZmljIHN0cnVjdCAo
cGNpX2RldikuDQpZZWFwLCB0aGlzIGlzIHNvbWV0aGluZyBJIGRvbid0IGxpa2UgYXMgd2VsbA0K
Pg0KPj4gICDCoDUuIEFuIGFsdGVybmF0aXZlIHJvdXRlIGZvciAzLTQgY291bGQgYmUgdG8gc3Rv
cmUgdGhhdCBkYXRhIGluIFhlblN0b3JlLCBlLmcuDQo+PiAgIMKgwqDCoCBNTUlPcywgSVJRLCBi
aW5kIHN5c2ZzIHBhdGggZXRjLiBUaGlzIHdvdWxkIHJlcXVpcmUgbW9yZSBjb2RlIG9uIFhlbiBz
aWRlIHRvDQo+PiAgIMKgwqDCoCBhY2Nlc3MgWGVuU3RvcmUgYW5kIHdvbuKAmXQgd29yayBpZiBN
TUlPcy9JUlFzIGFyZSBwYXNzZWQgdmlhIGRldmljZSB0cmVlL0FDUEkNCj4+ICAgwqDCoMKgIHRh
YmxlcyBieSB0aGUgYm9vdGxvYWRlcnMuDQo+IEFzIGFib3ZlLCBJIHRoaW5rIEkgbmVlZCBtb3Jl
IGNvbnRleHQgdG8gdW5kZXJzdGFuZCB3aGF0IGFuZCB3aHkgeW91DQo+IG5lZWQgdG8gc2F2ZSBz
dWNoIGluZm9ybWF0aW9uLg0KDQpXZWxsLCB3aXRoIHBjaWJhY2sgYWJzZW5jZSB3ZSBsb29zZSBh
ICJkYXRhYmFzZSIgd2hpY2ggaG9sZHMgYWxsIHRoZSBrbm93bGVkZ2UNCg0KYWJvdXQgd2hpY2gg
ZGV2aWNlcyBhcmUgYXNzaWduZWQsIGJvdW5kIGV0Yy4gU28sIFhlblN0b3JlICpjb3VsZCogYmUg
dXNlZCBhIHN1Y2gNCg0KYSBkYXRhYmFzZSBmb3IgdXMuIEJ1dCB0aGlzIGxvb2tzIG5vdCBlbGVn
YW50Lg0KDQo+DQo+PiBBbm90aGVyIGJpZyBxdWVzdGlvbiBpcyB3aXRoIHJlc3BlY3QgdG8gRG9t
YWluLTAgYW5kIFBDSSBidXMgc3lzZnMgdXNlLiBUaGUNCj4+IGV4aXN0aW5nIGNvZGUgZm9yIHF1
ZXJ5aW5nIFBDSSBkZXZpY2UgcmVzb3VyY2VzL0lSUXMgYW5kIHJlc2V0dGluZyB0aG9zZSB2aWEN
Cj4+IHN5c2ZzIG9mIERvbWFpbi0wIGlzIG1vcmUgdGhhbiBPSyBpZiBEb21haW4tMCBpcyBwcmVz
ZW50IGFuZCBvd25zIFBDSSBIVy4gQnV0LA0KPj4gdGhlcmUgYXJlIGF0IGxlYXN0IHR3byBjYXNl
cyB3aGVuIHRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgb24gQVJNOiBEb20wbGVzcw0KPj4gc2V0
dXBzIGFuZCB3aGVuIHRoZXJlIGlzIGEgaGFyZHdhcmUgZG9tYWluIG93bmluZyBQQ0kgZGV2aWNl
cy4NCj4+DQo+PiBJbiBvdXIgY2FzZSB3ZSBoYXZlIGEgZGVkaWNhdGVkIGd1ZXN0IHdoaWNoIGlz
IGEgc29ydCBvZiBoYXJkd2FyZSBkb21haW4gKGRyaXZlcg0KPj4gZG9tYWluIERvbUQpIHdoaWNo
IG93bnMgYWxsIHRoZSBoYXJkd2FyZSBvZiB0aGUgcGxhdGZvcm0sIHNvIHdlIGFyZSBpbnRlcmVz
dGVkDQo+PiBpbiBpbXBsZW1lbnRpbmcgc29tZXRoaW5nIHRoYXQgZml0cyBvdXIgZGVzaWduIGFz
IHdlbGw6IERvbUQvaGFyZHdhcmUgZG9tYWluDQo+PiBtYWtlcyBpdCBub3QgcG9zc2libGUgdG8g
YWNjZXNzIHRoZSByZWxldmFudCBQQ0kgYnVzIHN5c2ZzIGVudHJpZXMgZnJvbSBEb21haW4tMA0K
Pj4gYXMgdGhvc2UgbGl2ZSBpbiBEb21EL2h3ZG9tLiBUaGlzIGlzIGFsc28gdHJ1ZSBmb3IgRG9t
MGxlc3Mgc2V0dXBzIGFzIHRoZXJlIGlzDQo+PiBubyBlbnRpdHkgdGhhdCBjYW4gcHJvdmlkZSB0
aGUgc2FtZS4NCj4gWW91IG5lZWQgc29tZSBraW5kIG9mIGNoYW5uZWwgdG8gdHJhbnNmZXIgdGhp
cyBpbmZvcm1hdGlvbiBmcm9tIHRoZQ0KPiBoYXJkd2FyZSBkb21haW4gdG8gdGhlIHRvb2xzdGFj
ayBkb21haW4uIFNvbWUga2luZCBvZiBwcm90b2NvbCBvdmVyDQo+IGxpYnZjaGFuIG1pZ2h0IGJl
IGFuIG9wdGlvbi4NClllcywgdGhpcyB3YXkgaXQgd2lsbCBhbGwgYmUgaGFuZGxlZCB3aXRob3V0
IHdvcmthcm91bmRzDQo+DQo+PiBGb3IgdGhhdCByZWFzb24gaW4gbXkgUE9DIEkgaGF2ZSBpbnRy
b2R1Y2VkIHRoZSBmb2xsb3dpbmc6IGV4dGVuZGVkIHN0cnVjdA0KPj4gcGNpX2RldiB0byBob2xk
IGFuIGFycmF5IG9mIFBDSSBkZXZpY2XigJlzIE1NSU8gcmFuZ2VzIGFuZCBJUlE6DQo+Pg0KPj4g
ICDCoDEuIFByb3ZpZGUgaW50ZXJuYWwgQVBJIGZvciBhY2Nlc3NpbmcgdGhlIGFycmF5IG9mIE1N
SU8gcmFuZ2VzIGFuZCBJUlEuIFRoaXMNCj4+ICAgwqDCoMKgIGNhbiBiZSB1c2VkIGluIGJvdGgg
RG9tMGxlc3MgYW5kIERvbWFpbi0wIHNldHVwcyB0byBtYW5pcHVsYXRlIHRoZSByZWxldmFudA0K
Pj4gICDCoMKgwqAgZGF0YS4gVGhlIGFjdHVhbCBkYXRhIGNhbiBiZSByZWFkIGZyb20gYSBkZXZp
Y2UgdHJlZS9BQ1BJIHRhYmxlcyBpZg0KPj4gICDCoMKgwqAgZW51bWVyYXRpb24gaXMgZG9uZSBi
eSBib290bG9hZGVycy4NCj4gSSB3b3VsZCBiZSBhZ2FpbnN0IHN0b3JpbmcgdGhpcyBkYXRhIGlu
c2lkZSBvZiBYZW4gaWYgWGVuIGRvZXNuJ3QgaGF2ZQ0KPiB0byBtYWtlIGFueSB1c2Ugb2YgaXQu
IERvZXMgWGVuIG5lZWQgdG8ga25vdyB0aGUgTU1JTyByYW5nZXMgYW5kIElSUXMNCj4gdG8gcGVy
Zm9ybSBpdCdzIHRhc2s/DQo+DQo+IElmIG5vdCwgdGhlbiB0aGVyZSdzIG5vIHJlYXNvbiB0byBz
dG9yZSB0aG9zZSBpbiBYZW4uIFRoZSBoeXBlcnZpc29yDQo+IGlzIG5vdCB0aGUgcmlnaHQgcGxh
Y2UgdG8gaW1wbGVtZW50IGEgZGF0YWJhc2UgbGlrZSBtZWNoYW5pc20gZm9yIFBDSQ0KPiBkZXZp
Y2VzLg0KDQpXZSBoYXZlIGRpc2N1c3NlZCBhbGwgdGhlIGFib3ZlIHdpdGggUm9nZXIgb24gSVJD
ICh0aGFuayB5b3UgUm9nZXIpLA0KDQpzbyBJJ2xsIHByZXBhcmUgYW4gUkZDIGZvciBBUk0gUENJ
IHBhc3N0aHJvdWdoIGNvbmZpZ3VyYXRpb24gYW5kIHNlbmQgaXQgQVNBUC4NCg0KPg0KPiBSb2dl
ci4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

