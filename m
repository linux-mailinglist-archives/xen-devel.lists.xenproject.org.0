Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7F441605
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 10:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219057.379695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhTSS-00061w-Kq; Mon, 01 Nov 2021 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219057.379695; Mon, 01 Nov 2021 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhTSS-0005z9-HQ; Mon, 01 Nov 2021 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 219057;
 Mon, 01 Nov 2021 09:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR8P=PU=epam.com=prvs=1939429689=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhTSR-0005z3-P2
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 09:18:24 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8ba9ec2-3af4-11ec-8541-12813bfff9fa;
 Mon, 01 Nov 2021 09:18:22 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A168FMq007737;
 Mon, 1 Nov 2021 09:18:20 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3c292p0wa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 09:18:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2196.eurprd03.prod.outlook.com (2603:10a6:200:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Mon, 1 Nov
 2021 09:18:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 09:18:17 +0000
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
X-Inumbo-ID: a8ba9ec2-3af4-11ec-8541-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5Tlvma2oC5gnBLY2mlN7QvG5+OF3mvH9OrcFnDUxrz1hSRlSgyB8NSjXUA+kFH+kY0HbiON8uzylSJjvExUkP6PF5ta3T12Z3ChI2GkQSXUhkxeFyjYhcTnvP6GQZIy2OpBCm1AuF5jy5BiPBGSGW6pNMd9DvuZ8UJ8hMEgGwNcUtTqjm8ifW3cSpaSfwybqF0wmxEB48+KzCI7+vf/dd+6sYsFo4XwNOnEqN7XjziYhWBJad6C4zIdQqS65j0PLhuJZGYGBeh6zsYP4M72PWaGQOqEuqE/rIeSYesjutzM9PafnfPLeoV4JHvwg33dIMWJ/nwO6zj76YHcnv0w3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz7GenSZfn/VssXRB9AyKZjXNmfL2O/ny5JPCnHLnA8=;
 b=g4r8dZPyARjpDB1O+RSPYm4GMoCuBM5kU76lRa19qcsj45YCvS9+3WugfA4mk5ne85fR1wok9gdJmEL0pM09lsUlRmhzxg3u9EToSMWy7o/byENPwWQra5cKP4L5pWPU8rcRrtzeS1MMKh56BJeflwuq1Ns5kbvF8F5hOaqZPyuxW4oVc4J4ZLj8JPHBpfx6vAzwCZpqEVnxRByQioIGYUDgxZfV/2jc1gec17uFfQt2th67UOo0TOhzX28rBkTdjL2/MykaWrdKoxcJt72xKAfZYJkbNNpdFwL4ObBdJakZsuO6Z9TCTQ+q0a3PTvzrytLfTmU776ipLZmNx6yY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz7GenSZfn/VssXRB9AyKZjXNmfL2O/ny5JPCnHLnA8=;
 b=Q5LDCFtBRr8lNIEEk6TF4PHBw0OJ8vHZY37O07Bj2xy3DyVdBi5bvPignLrAmUI1shD4R0xw4G727hs+zm1j8BZ/2CdpcMXkoumG5ZigJmkOjLTiosAffF/Mq2S1+v92dL8r9gnyuBsulQclJ6Xrj7i+SYTyg+tkYLne/gDTTqNPrwMQYQIqpE7WvmSB50Mm37pY717VgZMHghh7Xf82K9f7a6VQiGCzDPVIpuuWbgHIv8JOmQWKOZz4I4CTVHpRY1YDs/ULnj10D/+lJVXkrzUFVP1lIOp71gQMJMB6pzlurEXaYDNn3qDF+8iUjjoJaZC/GrOzaFvUEbNR/h4YJw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Topic: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
Thread-Index: AQHXtdAhL3wGQmCTxkGG8eG4L2Ylc6vkA8CAgAqTbQA=
Date: Mon, 1 Nov 2021 09:18:17 +0000
Message-ID: <ba1fea82-e2db-89af-b48d-56d393bd4ce8@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
 <YXbRsbzLxZs94v0Z@MacBook-Air-de-Roger.local>
In-Reply-To: <YXbRsbzLxZs94v0Z@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed8a2f69-8f98-4714-814d-08d99d188a6f
x-ms-traffictypediagnostic: AM4PR0301MB2196:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB219690DCCD75794603514B61E78A9@AM4PR0301MB2196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0KVtpfkWSbgpVr2RkUJEbq9cw9NlZZkJHcDj4DDP3XZQORDFQx3GqdfYIY6MRhscB5giW7cCJVYaxOhb/TcnjBipqHDzbOPsNBA41ECyXOaykzFSPsxBQpR+1cFWpXoo+5cnvDvd2RFHfGSFfnFMoanQI8Te10MKZRkSe2dTP2ieoa6qjRW+yqYjYaooWU/coI80DtU3OB2Z1rWhjuzfmcdYRddFDzMwQ/tOoPzB4Ehl2EPorgbuElxwtSlSWYstdlUyYD7xS06mUSpAEYbycW4UdKc3N16mTavrBhZkzfjhAuKRR5NlYc/82ZIzjeJJu5jG3wgslbmFJl3Bet8o72+PxFO5VddfWo3gVFgE4O9CBBqbPKd0U8vvuCQdDSJqVDvCLmnPeXkL/nuk4dnmD8H2msKjcs8xqYy7C+cc5rTQQIKuA0s14lN+ASCQBrqAh2DdnQDiiXzjF9O6JHNKGdhqW6ACXDAx8W3eqJhQUSf5Am5ZyB6vi8Eq02kBzr3UdrUHRgdZVFjpNWeX7xGNdUTPeCGAKAuEi+kzLAeR8PIdGmAl2ScGzs2dzqg2wL/HDQrCi5K734MQ535/TRxdkrCoWCVDgaFWnc34RwE6/oeYowXl81P35CaT3faKghRlAOnHHrhM4maKcMduyCP6DO4EEGnsTnaycPZ5IcB9Jfrx1fsdAwmX5dTVoXlXlkcqkFC452UJsY6AqEozyhI9FkX6ijjNiQcl06CD9rUhREqLeXQyl09Vq+e6G2lfkSsu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(66446008)(66556008)(6916009)(66946007)(2616005)(31686004)(66476007)(2906002)(36756003)(64756008)(186003)(54906003)(71200400001)(31696002)(26005)(86362001)(316002)(6512007)(6486002)(4326008)(91956017)(6506007)(8936002)(76116006)(38070700005)(8676002)(107886003)(122000001)(508600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SnZhUjZJN1dkZkRra1d3UGZyZjVEMVFibUJ3dm1xZDFIQVNnM1NHaHhpNU1C?=
 =?utf-8?B?WHB2UDlwc1k4blVtREFMYmVJWnBPcUFUMWlGNnJtdWszTGt6RXZHcnpTNXhn?=
 =?utf-8?B?c0lMbWdScnAyNXVMZlV4YjBVVUl6Rysxb0VlSG9HY21jNnhIMUN3L2plY3Fh?=
 =?utf-8?B?dHZueno1NEowenFUa1JJeGc1Z0J2ZFY1dkU5Si81SXZKQWwwZDZvdi9DWUIr?=
 =?utf-8?B?UEVQNHM3V0k5TktwdGpYNXhuajNvWEFlVXJPdm85MVF6WUZCL3NRQS9GZ3lG?=
 =?utf-8?B?ekJSQzVMUGlEdnhiY2hxQmdCMWlGa2JIV2YySXV6NVYwdmRrOFZWMTIzNWFj?=
 =?utf-8?B?SFRWeDZWMXBzVER5UWN2NlhqMDYxY3AwZ1VnKzljZVZERFBib0xTYzBmWnMz?=
 =?utf-8?B?Nm1KOHhSZEl4RlkxYkdpQTlnYkxhTUxYUWhqcXFrMlVSbmdNNml2bWFWL2du?=
 =?utf-8?B?R3pXK0VoRnNYK0hYRHhROVIvNFpZK3VtcEtmSCtVTjM5NnBGOWlqNzVQTlNw?=
 =?utf-8?B?b1pJNFZZUi9pdnBna2ZPc2pZRUtTelZ5WWxEcGdqamFKWFhXRk9CYkxjZWZx?=
 =?utf-8?B?ZTJGeDRpQzV3ZW1DcU1IQ3ovR3I4ZGhMLzRrYkVtdG5BR0ptK3lhcVB5Skdq?=
 =?utf-8?B?Q3hhemN2aEEyV01hSURvcGFWOHpUZUxNYS9iRE93cmtVN0FQYUpqTGtWMlFU?=
 =?utf-8?B?Y0d3Q1FtRTIvNGxlQXNTVjk4WUdEYTBaZEovSURwcGdsSnE3N096Wjgzazhs?=
 =?utf-8?B?ejUwUlpsMEZqTWtXTVJCSzZIUlJ5MFVoQmRhOHZWZUoyOVhVVVE4VEZLR295?=
 =?utf-8?B?Q2EzUVNSZ0Q0L0xiUFY2L1htWVVZUlhxMXV0bWRCSTZhWGFEY2FvaGI3RVpo?=
 =?utf-8?B?L3FtdG1LY0JUYXVDcnk2QWwrR0FvNXZtdFRreVM4TkRkYTdZV1VLbUpTT1p0?=
 =?utf-8?B?cHRzMHVTWUdiNVdoVEIrREFVczlpVFZzY3Z2KzlEc25lT1lRaXErRFJYQWdC?=
 =?utf-8?B?TG44TWZjek1DOTY5WEJ2SExyWHhlQ201OEZxYlIvMno4YjlYNG5TT01lRnl6?=
 =?utf-8?B?Y0puUFdOWmw3aW5Nd0RPZlk2Y1N1cERkV1J0cWxKbzlRRUxSSitwOHNPUVRE?=
 =?utf-8?B?K21qR3BrZllKaTZxc1BMdmFHVStWQ3BDZTQ1YkNYUDhabENENnQ1STFKdUR3?=
 =?utf-8?B?czBHdFk1VTBvdjhEZzEvMk5tTG1tMjJNVUgwU1pMTnhaNGgvREZ6bG8vdUxN?=
 =?utf-8?B?ZmloaG5ob1h3RDlreXltckNza3hXaTdhR3pTWlkxOEw5U2VJVm93TDU2dTJW?=
 =?utf-8?B?U3QzZWVvZTZKM05Ua3E4QW5ST2V1UTRNRzJoM0l4YjVlSFNwOHNNekVVRTV0?=
 =?utf-8?B?MUMzQUFDVkVpY3ZOSTdMUmQ4T0VJcGZCSkNaZDIyZzBTWGp1VE1FdFpHeXpP?=
 =?utf-8?B?RzVFMHBwQ1JIdXlYU1N2WCtsNUl5TE9GNHR6Mmh4WC9BcDZQdEtOT1VqNE9I?=
 =?utf-8?B?dXBYV1J5Um9BN29ldUkveVUzd2RqVEEzT0xyRmpTREFrdVVBUGViNnUreFpa?=
 =?utf-8?B?UmJlZ2dKOTFyNmlhR3hCZjZtMCtsTUJORUR6R3Y0WnNCTlB1aVBOQXo0eVZa?=
 =?utf-8?B?ZXVBc2FTNEx1Qkp3TlV1OWVnMnJObjdpMVZqQ1RvYzNjcVBkeVAxN1h3WUJq?=
 =?utf-8?B?WDcwUzdvQzlzMFVBcFpXQTlXQkZQdWhTbVUvUEFKK1BHdEZwaXh4aWFmY1Ju?=
 =?utf-8?B?TmJ4cG5TMjNqbEJwbGZMNGZKNk9wSndjVmVYU09BeUw0YzFMQlRHN0NKNVZY?=
 =?utf-8?B?TERPWW1EaXJ4b0lvU0UzSlRHNUtZSGVzR1hoM1l0S0VvR3ZMSnRpUDBjQ1FR?=
 =?utf-8?B?NmZYMlB0dHgrWWkrWG9ZeUFrL0xZWjkrRStCY3BiVTRNbzJmS2UrUDZ3T0x3?=
 =?utf-8?B?dnY1V1Boa2NScVRvM2VyU2Nid0FrRC9BNVZwYVhnaXo0T01MaU1hanZWWVJI?=
 =?utf-8?B?RVJpVkhqMXVUTXhLckxhK1N3Y01WeWVSWmVidEgwUmRDbUtQdnd2amNKK2Rs?=
 =?utf-8?B?UXkwZ2QzZmN0d09meEJpM3lHZ1JFaEZTaVkwYmY3NWRsTWw2aS9ETnRveFNS?=
 =?utf-8?B?cWE1S2l4YXIybHdSWWNaU2VFVC8zWjVtU1pMT2tvMWU4NWNVbnEyaVAyWGtr?=
 =?utf-8?B?ZTlVVUg1Z1IwV2pxVnU3R2lHdnBhN1pIdDBRNURXeUloalg3RXdkTDVYSkcv?=
 =?utf-8?B?anJIdXF0b3BqT0wvZkZHUU0zZUF5YjV4V3ljSDhkekpDa09rZ205UW15dE52?=
 =?utf-8?B?YllkampSbi9Qb3RhQzVtWlJ4NFJpRXFseEpCNVE2TVV2SmtnRm12UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <745CC0E63735CD4EB16128084B05B135@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8a2f69-8f98-4714-814d-08d99d188a6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2021 09:18:17.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5mgolVra7lGJyNZxyvTr2vJojdcNdY1k/LVh6UclfLNHJDefc9iSIYRxQyYcWYZ7eN058Tw4bkvqr/VoHRueUf90p3Fr+wHejkmmTTPQt3X72eJCkf5LLNsQmBuFIqxR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2196
X-Proofpoint-GUID: Au2-IJp1iOgDy2x3ttkHmqkFvab5dSZK
X-Proofpoint-ORIG-GUID: Au2-IJp1iOgDy2x3ttkHmqkFvab5dSZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_03,2021-10-29_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010053

DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwNCj4+
ICsgICAgICAgICAgICAgICAgICIlcHA6IGZhaWxlZCB0byBhZGQgQkFSIGhhbmRsZXJzIGZvciBk
b20lcGQ6ICVkXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgJnBkZXYtPnNiZGYsIGQsIHJjKTsN
Cj4+ICsgICAgcmV0dXJuIHJjOw0KPj4gK30NCj4+ICsNCj4+ICtpbnQgdnBjaV9iYXJfcmVtb3Zl
X2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPj4gK3sNCj4+ICsgICAgLyogUmVtb3ZlIHByZXZpb3VzbHkgYWRkZWQgcmVnaXN0ZXJz
LiAqLw0KPj4gKyAgICB2cGNpX3JlbW92ZV9kZXZpY2VfcmVnaXN0ZXJzKHBkZXYpOw0KPj4gKyAg
ICByZXR1cm4gMDsNCj4+ICt9DQo+PiArI2VuZGlmDQo+PiArDQo+PiAgIC8qDQo+PiAgICAqIExv
Y2FsIHZhcmlhYmxlczoNCj4+ICAgICogbW9kZTogQw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+IGluZGV4IDBmZTg2
Y2IzMGQyMy4uNzAyZjdiNWQ1ZGRhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBAQCAtOTUsNyArOTUs
NyBAQCBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpkZXYpDQo+PiAgICAgICBpZiAoIGlzX3N5c3RlbV9kb21haW4oZCkgfHwgIWhh
c192cGNpKGQpICkNCj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiAtICAgIHJldHVy
biAwOw0KPj4gKyAgICByZXR1cm4gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRldik7DQo+PiAg
IH0NCj4+ICAgDQo+PiAgIC8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGRlLWFzc2lnbmVk
IGZyb20gZ3Vlc3QuICovDQo+PiBAQCAtMTA1LDcgKzEwNSw3IEBAIGludCB2cGNpX2RlYXNzaWdu
X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4g
ICAgICAgaWYgKCBpc19zeXN0ZW1fZG9tYWluKGQpIHx8ICFoYXNfdnBjaShkKSApDQo+PiAgICAg
ICAgICAgcmV0dXJuIDA7DQo+PiAgIA0KPj4gLSAgICByZXR1cm4gMDsNCj4+ICsgICAgcmV0dXJu
IHZwY2lfYmFyX3JlbW92ZV9oYW5kbGVycyhkLCBkZXYpOw0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGJldHRlciB0byB1c2Ugc29tZXRoaW5nIHNpbWlsYXIgdG8NCj4gUkVHSVNURVJfVlBDSV9JTklU
IGhlcmUsIG90aGVyd2lzZSB0aGlzIHdpbGwgbmVlZCB0byBiZSBtb2RpZmllZCBldmVyeQ0KPiB0
aW1lIGEgbmV3IGNhcGFiaWxpdHkgaXMgaGFuZGxlZCBieSBYZW4uDQo+DQo+IE1heWJlIHdlIGNv
dWxkIHJldXNlIG9yIGV4cGFuZCBSRUdJU1RFUl9WUENJX0lOSVQgYWRkaW5nIGFub3RoZXIgZmll
bGQNCj4gdG8gYmUgdXNlZCBmb3IgZ3Vlc3QgaW5pdGlhbGl6YXRpb24/DQo+DQo+PiAgIH0NCj4+
ICAgI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+PiAgIA0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBj
aS5oDQo+PiBpbmRleCBlY2MwOGYyYzBmNjUuLmZkODIyYzkwM2FmNSAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgN
Cj4+IEBAIC01Nyw2ICs1NywxNCBAQCB1aW50MzJfdCB2cGNpX2h3X3JlYWQzMihjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgICovDQo+PiAgIGJvb2wg
X19tdXN0X2NoZWNrIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KTsNCj4+ICAg
DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArLyogQWRkL3Jl
bW92ZSBCQVIgaGFuZGxlcnMgZm9yIGEgZG9tYWluLiAqLw0KPj4gK2ludCB2cGNpX2Jhcl9hZGRf
aGFuZGxlcnMoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICtpbnQgdnBjaV9iYXJfcmVt
b3ZlX2hhbmRsZXJzKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiArI2VuZGlmDQo+
IFRoaXMgd291bGQgdGhlbiBnbyBhd2F5IGlmIHdlIGltcGxlbWVudCBhIG1lY2hhbmlzbSBzaW1p
bGFyIHRvDQo+IFJFR0lTVEVSX1ZQQ0lfSU5JVC4NCj4NCj4gVGhhbmtzLCBSb2dlci4NCk9rLCBz
byBJIGNhbiBleHRlbmQgUkVHSVNURVJfVlBDSV9JTklUIHdpdGggYW4gYWN0aW9uIHBhcmFtZXRl
cjoNCg0KIlRoZXJlIGFyZSBudW1iZXIgb2YgYWN0aW9ucyB0byBiZSB0YWtlbiB3aGlsZSBmaXJz
dCBpbml0aWFsaXppbmcgdlBDSQ0KZm9yIGEgUENJIGRldmljZSBvciB3aGVuIHRoZSBkZXZpY2Ug
aXMgYXNzaWduZWQgdG8gYSBndWVzdCBvciB3aGVuIGl0DQppcyBkZS1hc3NpZ25lZCBhbmQgc28g
b24uDQpFdmVyeSB0aW1lIGEgbmV3IGFjdGlvbiBpcyBuZWVkZWQgZHVyaW5nIHRoZXNlIHN0ZXBz
IHdlIG5lZWQgdG8gY2FsbCBzb21lDQpyZWxldmFudCBmdW5jdGlvbiB0byBoYW5kbGUgdGhhdC4g
TWFrZSBpdCBpcyBlYXNpZXIgdG8gdHJhY2sgdGhlIHJlcXVpcmVkDQpzdGVwcyBieSBleHRlbmRp
bmcgUkVHSVNURVJfVlBDSV9JTklUIG1hY2hpbmVyeSB3aXRoIGFuIGFjdGlvbiBwYXJhbWV0ZXIN
CndoaWNoIHNob3dzIHdoaWNoIGV4YWN0bHkgc3RlcC9hY3Rpb24gaXMgYmVpbmcgcGVyZm9ybWVk
LiINCg0KU28sIHdlIGhhdmUNCg0KLXR5cGVkZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0
cnVjdCBwY2lfZGV2ICpkZXYpOw0KK2VudW0gVlBDSV9JTklUX0FDVElPTiB7DQorwqAgVlBDSV9J
TklUX0FERCwNCivCoCBWUENJX0lOSVRfQVNTSUdOLA0KK8KgIFZQQ0lfSU5JVF9ERUFTU0lHTiwN
Cit9Ow0KKw0KK3R5cGVkZWYgaW50IHZwY2lfcmVnaXN0ZXJfaW5pdF90KHN0cnVjdCBwY2lfZGV2
ICpkZXYsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlbnVtIFZQQ0lfSU5JVF9BQ1RJT04gYWN0aW9uKTsNCg0KYW5kLCBm
b3IgZXhhbXBsZSwNCg0KQEAgLTQ1Miw2ICs0NTIsOSBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCiDCoMKgwqDCoCBzdHJ1Y3QgdnBjaV9iYXIgKmJhcnMgPSBo
ZWFkZXItPmJhcnM7DQogwqDCoMKgwqAgaW50IHJjOw0KDQorwqDCoMKgIGlmICggYWN0aW9uICE9
IFZQQ0lfSU5JVF9BREQgKQ0KK8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KKw0KDQpJIHdhcyB0
aGlua2luZyBhYm91dCBhZGRpbmcgZGVkaWNhdGVkIG1hY2hpbmVyeSBzaW1pbGFyIHRvIFJFR0lT
VEVSX1ZQQ0lfSU5JVCwNCmUuZy4gUkVHSVNURVJfVlBDSV97QVNTSUdOfERFQVNTSUdOfSArIGRl
ZGljYXRlZCBzZWN0aW9ucyBpbiB0aGUgbGlua2VyIHNjcmlwdHMsDQpidXQgaXQgc2VlbXMgbm90
IHdvcnRoIGl0OiB0aGVzZSBzdGVwcyBhcmUgb25seSBleGVjdXRlZCBhdCBkZXZpY2UgaW5pdC9h
c3NpZ24vZGVhc3NpZ24sDQpzbyBleHRlbmRpbmcgdGhlIGV4aXN0aW5nIGFwcHJvYWNoIGRvZXNu
J3Qgc2VlbSB0byBodXJ0IHBlcmZvcm1hbmNlIG11Y2guDQoNClBsZWFzZSBsZXQgbWUga25vdyBp
ZiB0aGlzIGlzIHdoYXQgeW91IG1lYW4sIHNvIEkgY2FuIHJlLXdvcmsgdGhlIHJlbGV2YW50IGNv
ZGUuDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

