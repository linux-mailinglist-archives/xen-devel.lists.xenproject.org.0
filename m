Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7F40D3A9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 09:17:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188140.337212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQldU-0006wc-9U; Thu, 16 Sep 2021 07:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188140.337212; Thu, 16 Sep 2021 07:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQldU-0006uG-5P; Thu, 16 Sep 2021 07:16:44 +0000
Received: by outflank-mailman (input) for mailman id 188140;
 Thu, 16 Sep 2021 07:16:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gy=OG=epam.com=prvs=9893242681=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQldS-0006tu-3k
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 07:16:42 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f562238-4fc3-441d-9c80-d73846a6c445;
 Thu, 16 Sep 2021 07:16:40 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18G6MCnr021917; 
 Thu, 16 Sep 2021 07:16:36 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b3yter9an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 07:16:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4308.eurprd03.prod.outlook.com (2603:10a6:208:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 07:16:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 07:16:33 +0000
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
X-Inumbo-ID: 3f562238-4fc3-441d-9c80-d73846a6c445
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1WEHDviZEbOXqq5p7vFFSOr2tfdc6Ef2BP6kC6/BOeXGWrk4L9/xnuHc+H1dpAgmilfz3W3GbzYkNbs+Xxx9ASKO8fdnbTW9V6cCYiWzxGabp2oX1YjvfihGDvskE4IRsi3ozicWLRd9ANip1f110KTrOQvP7YVV3GWSe81obwKfAB9MHHq3vl8LQ/NmVnftjZxO34A0aQs9no7Nx9TRhcP2h0x2stjLknG79DpnCm4Ff/cQ9MMWBLP/B+IpIod+On9HOWbqf2b8sKf77vBfYud3dWTatVYwhi7dcDSS2XLx2dSpNOx+mzFiWwR+TFLThN9ll2I+lvpSVyfIzbyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4kxncR3dmPW+A/TwUGeqPoNHqXq87uFi9iCENuBJwxc=;
 b=fTToUN3PFN6bbv8hWe6NK8PlMeLq+VputtoqNIAijFVekpm7k/JPx/CXqG3MkpMF+EhluX0szAbTzTZCJufKhepCcae0otWCQ42IeeDEFc+QfUedyiSC/mUNuFf8RY0i4WSWvbOUHSpK9FRaW9gyr3mZDzrPSUj6zp2brcwVK7vGmMZAvigXtrfghC8dnhNTh3jZjpD29qmQ9wScfne9e0/Oz2lA22Xq6+MZoWhXEuFzQoQSUCD2A7LivcNo8Iz7rdz3tUybQq3vd7IwF3rL7YugB3hhnX+9Tvqlun+oCCjPB66IYbOBqIaey1E1HluKQxxhpfBCCTVfL3CWYmeXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kxncR3dmPW+A/TwUGeqPoNHqXq87uFi9iCENuBJwxc=;
 b=g3VLpjR887KT+PRVohxuuyOZBIX5DfWo8Fvv6k62SYDA6A4Q1fQ0CmDndXbEQen96QT+weXgNCe9eI8f0i8Uf0eNuJJ7SU/x6KLoOz+VnfdJvWC8anVRpDmkIBlbYfieEAW3PS81yCnVp7bHD59clVVnE3lpAwzEc2RCxormIPbD10hxUuknLurqp/NHKejnTII8I1VpNh/lf/FOsKaJA2Lf+WGnmEAMdrD8x47D/Fh2ebqodr/YALokM41J3ZFW6gT+myQf58NX9q7KmWDJY6+9eE/jEu9bBWAL9wItx7HhY6r7oA25YqpI3llqqW2FTRDezhVeoGB+1T6Baq/DeQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Rahul Singh <rahul.singh@arm.com>,
        Julien Grall
	<julien.grall.oss@gmail.com>,
        Oleksandr Andrushchenko <andr2000@gmail.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: 
 AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiAgAARZwCAAFsJAIAAFA4AgAO3eICAAc7agIAA860AgABTv4CAAPQVgIAAAsoAgAC3nAA=
Date: Thu, 16 Sep 2021 07:16:32 +0000
Message-ID: <4093d5fd-1d44-cc33-9fe2-2695f5d3f16c@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <684b3534-40eb-add7-f46e-c6258904757b@xen.org>
 <alpine.DEB.2.21.2109101325110.10523@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1pSoLpesjqNTiG3-t4+pvju3EetYzcFpuNzMdRWi1GYg@mail.gmail.com>
 <3ecfc742-b720-0381-dbd8-7147615494c8@epam.com>
 <1e71ebba-b2d3-1201-05ac-e035f182226f@epam.com>
 <alpine.DEB.2.21.2109141731410.21985@sstabellini-ThinkPad-T480s>
 <ee38bc53-c590-24d2-9061-3d4fd33f58bd@epam.com>
 <alpine.DEB.2.21.2109151246450.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109151311480.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109151311480.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f13f8b97-f22e-409d-03d5-08d978e1e986
x-ms-traffictypediagnostic: AM0PR03MB4308:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4308962D5BE2B68E210DB16BE7DC9@AM0PR03MB4308.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NgbcG627dq2EbDMzVIwm6MnfvgXmUju05EXSm1ovUCDV4KAu7qPNtpE+ggXUuStojw9c8TBcZpgmZ2TbAgUcq68hKXRKPTwGKsV/nW4I1VsodWjigRwiCd3KsJeQMFNIoPLdf2sIzVfOvQt/ltLnyMAtuSqyJkGxXtvZmC7kXfVRMcQpi09gc9/jX3cHVLjmCBmmKel8n6PeTkKJs5Aq3tbdSQwfUWn8zdKB2b1elFQvC8Go7nIFOrhs98SN37vEZZ4qYYfClNcpVwa9xesb07UB1q+9+2HrpVM37LUvL32VbYubWJ3fxN7Qdq8ZtLo0rJULhzoMJ8AGY8HPH5VL5PmO3T9VKQTdpIYjSDSts2NaJbQ4g3R84+PBSc/zSlG8fC+uxbDT1WwGNJ4fi8J7ME97RWc1iUjJqRcxkNcLF8mlosqfPOs/HmrsNb587E236PKBDZkMLWzFXc5qgo0+DRmw1PCNbpRLfnknzJTecvBoLZkff2gJA5Iw62HUSXdowJcyat/SvhFIl0xrvf2DNZWpNoCfPhKkFzOgpUnRRbhQEfYeCXhyl8rRmbI62LLO2TbFM/0XbIyoWsrmM2j7KIrFYnbVgk1oXAoylRz/MvOp+idP3LdvK26aaY8hlg9eksHXwYaWzDffiQfAFiVHxn3JjGMrNoVl55v9r8jNs65wX1rK28zzbg1YsHa2Xzzu/Ociu52tIyK1LXx9juNe+kAbqusoX7nfAIN7/3Mi72tNs/pN+7G+cfG0q6TWM2GzmqqwgKZYv+dLoGQ+K1f2x9eKZW7dNz6gqrwUxVY/VthUJwbtETa+gTozdvr3P2yn4TV5MvqWme3z+J+tuJUH9A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(64756008)(66946007)(66446008)(2906002)(83380400001)(76116006)(36756003)(8676002)(2616005)(316002)(38070700005)(6916009)(8936002)(54906003)(26005)(6486002)(31696002)(5660300002)(122000001)(38100700002)(71200400001)(6506007)(86362001)(186003)(91956017)(66476007)(4326008)(6512007)(966005)(478600001)(66556008)(31686004)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NjBWeDQzUTRPN2FwVXYweHhxbWlOYmF4YkN5elRsWHB0Z2JuSi95R0NLWjQx?=
 =?utf-8?B?QjlMMHg4ck5NNGNseG9iYmF3TXRRK1RzNHlUVlpIVjQ1Z2hjTGNsb0NaMEND?=
 =?utf-8?B?RTFPMUxDbjdtQWRwOUgwVU9UZGNudTM2eTBSLzlXNDBEbUFzR3FsMVZPUWJv?=
 =?utf-8?B?VlJRVWVtZytMRitqT3dXamY0VHVOejBmaytaSUROaXV5RzgweWdIdm1rZmll?=
 =?utf-8?B?d0Y4dVNWL1ZBLzUwUWkwK0YzOUtPb3NMQXdiZm54L0xXUWRPOUx0QU93YWQ3?=
 =?utf-8?B?Y3hlZEhOTEsycWJQTjBndFRvdlZ3K2owc2Q4MDVtaytUY1M3eXVxQmNuZXVL?=
 =?utf-8?B?aUszaGdIT2JHZWFBVmEzcVZsaU9HV2FtYUxaUDBvd0RLNURCWHA2YnhUekd2?=
 =?utf-8?B?MnlzRXJjdC9iZVdMdkVUQXcxYnR1azdORjgya3NLemtwZXhkUmV1WUEwZjJH?=
 =?utf-8?B?aHNXdmhTVnRveW55NHNHaXE3aldueEtFT0pIbnZBSjdBbU8reVZCTlR0WGI1?=
 =?utf-8?B?ckJJYXhlMDVDazJVUHNBNmJUNEd6NkUwZ3NjUW5jeGhiSk1QM2xXMkY2RXVU?=
 =?utf-8?B?TmJIbEdjYlpYbkppR3Y2cHRCb2l1R0g1N3ZDcm14OEZ6YW1IaFdDZlRmdWY3?=
 =?utf-8?B?Z0lOVk8vN3dqWFZYTFZLT3ZPV3J5NUhxSEtXbWk0bG9yMTNmS0ZwOEt0WUpV?=
 =?utf-8?B?VEVYeCsySGcxb1FSbm4vc1RuMEgxVWg0b056UmRIV2dRb0lMSHZOYUYvaHZt?=
 =?utf-8?B?dzhFYllGVG1lb2pSNmNKUXk0SENwMjMvVnpkTnF1dmZ0UWtwWjRTOHZObTI0?=
 =?utf-8?B?VytZZ29jQ1c2eG12QmkvUHZPZU1ieFJFbndFTHRLUUVpb1pSZy9pRzJLVkoy?=
 =?utf-8?B?NWVSK2YwWDVHdkZEdGhBSytTc2xOMDFBQmp4MG8wclgybk9wZ0kvR1U3U1hE?=
 =?utf-8?B?M2dJMXdBK3Z0MzVmZDQyYWphVGV4b2MraE93ZzNjdDhHK1ZzTmk4ZWZ6cGVT?=
 =?utf-8?B?aGdGZklJS3JKODZ1QXFNcTlQTjFWTUYvelVlWk0vbHVOb0tESXd3OWtwTk4y?=
 =?utf-8?B?ZjVDZ0xvWDVZNW9sQTdsUHlXSnN2NkZHcUp4TkFqQkQ4eE9BK2ZMdk96ZnVx?=
 =?utf-8?B?SVNDZ3hiWWRTM1ZYZXErVHhpRitjOXJjZjQzWHVzYUxXVFJIS2JUMy9vclBN?=
 =?utf-8?B?QnorZ1BXZVBzSVc5ZlNWWFFpUzRDNmZzOUlONWkrOHZscFQwTFFTZEFZSDN3?=
 =?utf-8?B?UStYSFhPZldUUGpCTld0UFNmZFYya3RzZzlwS0p4eFBVMldNTktFeCsyajMy?=
 =?utf-8?B?WmhUTlEySklnUTRYMXJnWkNOMVRUTnQ4Z3l5VlZxZmlBNld0VVI3aUdsQXlr?=
 =?utf-8?B?UlV6dUFsR00zbi94ZXpWeldDSGVRRGo3MkJCczBhTHdRVXhZc0VMVGRFWDdU?=
 =?utf-8?B?UmkwTVMvcXdLR3ppbTNpcnM3dUgxTVFvQlZDQXZIUVlSZ200TEFLUEdqM3ZZ?=
 =?utf-8?B?cEhJUGpYczBkdEIyaE10amthc1BsYU5BcGtXN1l1b1dvOEw0aXZZVzc1U0VL?=
 =?utf-8?B?aE4wQ3duMmt6ajFWcERZdjVlZGRwdTlZKzE2V3Q2ZEhuQjVCYURMbXcwZzIw?=
 =?utf-8?B?R094ZjFESjVsOW1JR2NHQVZDTk5YamRaM0dETmdHenNZMnBjdTd0cXdubVlI?=
 =?utf-8?B?ZGZMVWZwcU9xNGo2dEdjWDRLS3NJeVBJaUp0clRxQ1pzbjUxdHNUbXFrVVRY?=
 =?utf-8?Q?4aD/h5wlzkWypLxr1izozZyrxmEs3qgTxVo/kah?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB6B9D0CB5A40E469DD08819EEB1627F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f8b97-f22e-409d-03d5-08d978e1e986
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 07:16:32.9140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +FODNYjQ5OYGMPRF2Hz2NfsB363A/VvNyGtZkOO1PfppZdDt/X0WKhPO1EEpEkySpnwdoJqngtPN9s3365w59yEqlrrumFK8MD7pYs+FgQZukao4+I+B2ufeqWr7/tGh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4308
X-Proofpoint-ORIG-GUID: 6OU7VgRqD9r65_CQJWNWrZx5I_D9G0y9
X-Proofpoint-GUID: 6OU7VgRqD9r65_CQJWNWrZx5I_D9G0y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_02,2021-09-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160046

SGksIFN0ZWZhbm8hDQoNCk9uIDE1LjA5LjIxIDIzOjE5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+IE9uIFdlZCwgMTUgU2VwIDIwMjEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+
IE9uIFdlZCwgMTUgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
IE9uIDE1LjA5LjIxIDAzOjM2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIFR1
ZSwgMTQgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gV2l0
aCB0aGUgcGF0Y2ggYWJvdmUgSSBoYXZlIHRoZSBmb2xsb3dpbmcgbG9nIGluIERvbWFpbi0wOg0K
Pj4+Pj4NCj4+Pj4+IGdlbmVyaWMtYXJtdjgteHQtZG9tMCBsb2dpbjogcm9vdA0KPj4+Pj4gcm9v
dEBnZW5lcmljLWFybXY4LXh0LWRvbTA6fiMgKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBYZW4g
KHR5cGUgJ0NUUkwtYScgdGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0KPj4+Pj4gKFhFTikg
PT09PSBQQ0kgZGV2aWNlcyA9PT09DQo+Pj4+PiAoWEVOKSA9PT09IHNlZ21lbnQgMDAwMCA9PT09
DQo+Pj4+PiAoWEVOKSAwMDAwOjAzOjAwLjAgLSBkMCAtIG5vZGUgLTENCj4+Pj4+IChYRU4pIDAw
MDA6MDI6MDIuMCAtIGQwIC0gbm9kZSAtMQ0KPj4+Pj4gKFhFTikgMDAwMDowMjowMS4wIC0gZDAg
LSBub2RlIC0xDQo+Pj4+PiAoWEVOKSAwMDAwOjAyOjAwLjAgLSBkMCAtIG5vZGUgLTENCj4+Pj4+
IChYRU4pIDAwMDA6MDE6MDAuMCAtIGQwIC0gbm9kZSAtMQ0KPj4+Pj4gKFhFTikgMDAwMDowMDow
MC4wIC0gZDAgLSBub2RlIC0xDQo+Pj4+PiAoWEVOKSAqKiogU2VyaWFsIGlucHV0IHRvIERPTTAg
KHR5cGUgJ0NUUkwtYScgdGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0KPj4+Pj4NCj4+Pj4+
IHJvb3RAZ2VuZXJpYy1hcm12OC14dC1kb20wOn4jIG1vZHByb2JlIGUxMDAwZQ0KPj4+Pj4gW8Kg
wqAgNDYuMTA0NzI5XSBlMTAwMGU6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgRHJpdmVyDQo+
Pj4+PiBbwqDCoCA0Ni4xMDU0NzldIGUxMDAwZTogQ29weXJpZ2h0KGMpIDE5OTkgLSAyMDE1IElu
dGVsIENvcnBvcmF0aW9uLg0KPj4+Pj4gW8KgwqAgNDYuMTA3Mjk3XSBlMTAwMGUgMDAwMDowMzow
MC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikNCj4+Pj4+IChYRU4pIG1hcCBbZTAw
MDAsIGUwMDFmXSAtPiAweGUwMDAwIGZvciBkMA0KPj4+Pj4gKFhFTikgbWFwIFtlMDAyMCwgZTAw
M2ZdIC0+IDB4ZTAwMjAgZm9yIGQwDQo+Pj4+PiBbwqDCoCA0Ni4xNzg1MTNdIGUxMDAwZSAwMDAw
OjAzOjAwLjA6IEludGVycnVwdCBUaHJvdHRsaW5nIFJhdGUgKGludHMvc2VjKSBzZXQgdG8gZHlu
YW1pYyBjb25zZXJ2YXRpdmUgbW9kZQ0KPj4+Pj4gW8KgwqAgNDYuMTg5NjY4XSBwY2lfbXNpX3Nl
dHVwX21zaV9pcnFzDQo+Pj4+PiBbwqDCoCA0Ni4xOTEwMTZdIG53bF9jb21wb3NlX21zaV9tc2cg
bXNnIGF0IGZlNDQwMDAwDQo+Pj4+PiAoWEVOKSB0cmFwcy5jOjIwMTQ6ZDB2MCBIU1I9MHgwMDAw
MDA5MzgxMDA0NyBwYz0weGZmZmY4MDAwMTA0YjRiMDAgZ3ZhPTB4ZmZmZjgwMDAxMGZhNTAwMCBn
cGE9MHgwMDAwMDBlMDA0MDAwMA0KPj4+Pj4gW8KgwqAgNDYuMjAwNDU1XSBVbmhhbmRsZWQgZmF1
bHQgYXQgMHhmZmZmODAwMDEwZmE1MDAwDQo+Pj4+Pg0KPj4+Pj4gW3NuaXBdDQo+Pj4+Pg0KPj4+
Pj4gW8KgwqAgNDYuMjMzMDc5XSBDYWxsIHRyYWNlOg0KPj4+Pj4gW8KgwqAgNDYuMjMzNTU5XcKg
IF9fcGNpX3dyaXRlX21zaV9tc2crMHg3MC8weDE4MA0KPj4+Pj4gW8KgwqAgNDYuMjM0MTQ5XcKg
IHBjaV9tc2lfZG9tYWluX3dyaXRlX21zZysweDI4LzB4MzANCj4+Pj4+IFvCoMKgIDQ2LjIzNDg2
OV3CoCBtc2lfZG9tYWluX2FjdGl2YXRlKzB4NWMvMHg4OA0KPj4+Pj4NCj4+Pj4+ICAgIEZyb20g
dGhlIGFib3ZlIHlvdSBjYW4gc2VlIHRoYXQgQkFScyBhcmUgbWFwcGVkIGZvciBEb21haW4tMCBu
b3cNCj4+Pj4+DQo+Pj4+PiBvbmx5IHdoZW4gYW4gYXNzaWduZWQgUENJIGRldmljZSBnZXRzIGVu
YWJsZWQgaW4gRG9tYWluLTAuDQo+Pj4+Pg0KPj4+Pj4gQW5vdGhlciB0aGluZyB0byBub3RlIGlz
IHRoYXQgd2UgY3Jhc2ggb24gTVNJLVggYWNjZXNzIGFzIEJBUnMgYXJlIG1hcHBlZA0KPj4+Pj4N
Cj4+Pj4+IHRvIHRoZSBkb21haW4gd2hpbGUgZW5hYmxpbmcgbWVtb3J5IGRlY29kaW5nIGluIHRo
ZSBDT01NQU5EIHJlZ2lzdGVyLA0KPj4+Pj4NCj4+Pj4+IGJ1dCBNU0ktWCBhcmUgaGFuZGxlZCBk
aWZmZXJlbnRseSwgZS5nLiB3ZSBoYXZlIE1TSS1YIGhvbGVzIGluIHRoZSBtYXBwaW5ncy4NCj4+
Pj4+DQo+Pj4+PiBUaGlzIGlzIGJlY2F1c2UgYmVmb3JlIHRoaXMgY2hhbmdlIHRoZSB3aG9sZSBQ
Q0kgYXBlcnR1cmUgd2FzIG1hcHBlZCBpbnRvDQo+Pj4+Pg0KPj4+Pj4gRG9tYWluLTAgYW5kIGl0
IGlzIG5vdC4gVGh1cywgTVNJLVggaG9sZXMgYXJlIGxlZnQgdW5tYXBwZWQgbm93IGFuZCB0aGVy
ZQ0KPj4+Pj4NCj4+Pj4+IHdhcyBubyBuZWVkIHRvIGRvIHNvLCBlLmcuIHRoZXkgd2VyZSBhbHdh
eXMgbWFwcGVkIGludG8gRG9tYWluLTAgYW5kDQo+Pj4+Pg0KPj4+Pj4gZW11bGF0ZWQgZm9yIGd1
ZXN0cy4NCj4+Pj4+DQo+Pj4+PiBQbGVhc2Ugbm90ZSB0aGF0IG9uZSBjYW5ub3QgdXNlIHhsIHBj
aS1hdHRhY2ggaW4gdGhpcyBjYXNlIHRvIGF0dGFjaCB0aGUgUENJIGRldmljZQ0KPj4+Pj4NCj4+
Pj4+IGluIHF1ZXN0aW9uIHRvIERvbWFpbi0wIGFzIChwbGVhc2Ugc2VlIHRoZSBsb2cpIHRoYXQg
ZGV2aWNlIGlzIGFscmVhZHkgYXR0YWNoZWQuDQo+Pj4+Pg0KPj4+Pj4gTmVpdGhlciBpdCBjYW4g
YmUgZGV0YWNoZWQgYW5kIHJlLWF0dGFjaGVkLiBTbywgd2l0aG91dCBtYXBwaW5nIE1TSS1YIGhv
bGVzIGZvcg0KPj4+Pj4NCj4+Pj4+IERvbWFpbi0wIHRoZSBkZXZpY2UgYmVjb21lcyB1bnVzYWJs
ZSBpbiBEb21haW4tMC4gQXQgdGhlIHNhbWUgdGltZSB0aGUgZGV2aWNlDQo+Pj4+Pg0KPj4+Pj4g
Y2FuIGJlIHN1Y2Nlc3NmdWxseSBwYXNzZWQgdG8gRG9tVS4NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4g
SnVsaWVuLCBTdGVmYW5vISBQbGVhc2UgbGV0IG1lIGtub3cgaG93IGNhbiB3ZSBwcm9jZWVkIHdp
dGggdGhpcy4NCj4+Pj4gV2hhdCB3YXMgdGhlIHBsYW4gZm9yIE1TSS1YIGluIERvbTA/DQo+Pj4g
SXQganVzdCB3b3JrZWQgYmVjYXVzZSB3ZSBtYXBwZWQgZXZlcnl0aGluZw0KPj4+PiBHaXZlbiB0
aGF0IERvbTAgaW50ZXJhY3RzIHdpdGggYSB2aXJ0dWFsLUlUUyBhbmQgdmlydHVhbC1HSUMgcmF0
aGVyIHRoYW4NCj4+Pj4gYSBwaHlzaWNhbC1JVFMgYW5kIHBoeXNpY2FsLUdJQywgSSBpbWFnaW5l
IHRoYXQgaXQgd2Fzbid0IGNvcnJlY3QgZm9yDQo+Pj4+IERvbTAgdG8gd3JpdGUgdG8gdGhlIHJl
YWwgTVNJLVggdGFibGUgZGlyZWN0bHk/DQo+Pj4+DQo+Pj4+IFNob3VsZG4ndCBEb20wIGdldCBl
bXVsYXRlZCBNU0ktWCB0YWJsZXMgbGlrZSBhbnkgRG9tVT8NCj4+Pj4NCj4+Pj4gT3RoZXJ3aXNl
LCBpZiBEb20wIGlzIGV4cGVjdGVkIHRvIGhhdmUgdGhlIHJlYWwgTVNJLVggdGFibGVzIG1hcHBl
ZCwgdGhlbg0KPj4+PiBJIHdvdWxkIHN1Z2dlc3QgdG8gbWFwIHRoZW0gYXQgdGhlIHNhbWUgdGlt
ZSBhcyB0aGUgQkFScy4gQnV0IEkgYW0NCj4+Pj4gdGhpbmtpbmcgdGhhdCBEb20wIHNob3VsZCBn
ZXQgZW11bGF0ZWQgTVNJLVggdGFibGVzLCBub3QgcGh5c2ljYWwgTVNJLVgNCj4+Pj4gdGFibGVz
Lg0KPj4+IFllcywgaXQgc2VlbXMgbW9yZSB0aGFuIHJlYXNvbmFibGUgdG8gZW5hYmxlIGVtdWxh
dGlvbiBmb3IgRG9tYWluLTANCj4+Pg0KPj4+IGFzIHdlbGwuIE90aGVyIHRoYW4gdGhhdCwgU3Rl
ZmFubywgZG8geW91IHRoaW5rIHdlIGFyZSBnb29kIHRvIGdvIHdpdGgNCj4+Pg0KPj4+IHRoZSBj
aGFuZ2VzIEkgZGlkIGluIG9yZGVyIHRvIHVubWFwIGV2ZXJ5dGhpbmcgZm9yIERvbWFpbi0wPw0K
Pj4NCj4+IEl0IG1pZ2h0IGJlIGJldHRlciB0byByZXNlbmQgdGhlIHNlcmllcyB3aXRoIHRoZSBw
YXRjaCBpbiBpdCwgYmVjYXVzZSBpdA0KPj4gaXMgZGlmZmljdWx0IHRvIHJldmlldyB0aGUgcGF0
Y2ggbGlrZSB0aGlzLg0KDQpUaGlzIGlzIHRydWUuIFRha2luZyBpbnRvIGFjY291bnQgWGVuIHJl
bGVhc2UgcGxhbiBJIGFtIGp1c3QgdHJ5aW5nIHRvDQoNCm1pbmltaXplIHRoZSB0dXJuIGFyb3Vu
ZCBoZXJlLiBTb3JyeSBhYm91dCB0aGlzDQoNCj4+ICAgTm9uZXRoZWxlc3MgSSB0cmllZCwgYnV0
IEkNCj4+IG1pZ2h0IGhhdmUgbWlzc2VkIHNvbWV0aGluZy4NClRoYW5rIHlvdSBmb3IgeW91ciB0
aW1lISENCj4+DQo+PiBQcmV2aW91c2x5IHRoZSB3aG9sZSBQQ0llIGJyaWRnZSBhcGVydHVyZSB3
YXMgbWFwcGVkIHRvIERvbTAsIGFuZA0KPj4gaXQgd2FzIGRvbmUgYnkgbWFwX3JhbmdlX3RvX2Rv
bWFpbiwgaXMgdGhhdCBjb3JyZWN0Pw0KDQpZZXMsIGJ1dCBub3Qgb25seSB0aGUgYXBlcnR1cmU6
IHBsZWFzZSBzZWUgYmVsb3cuDQoNCg0KPj4NCj4+IE5vdyB0aGlzIHBhdGNoLCB0byBhdm9pZCBt
YXBwaW5nIHRoZSBlbnRpcmUgYXBlcnR1cmUgdG8gRG9tMCwgaXMNCj4+IHNraXBwaW5nIGFueSBv
cGVyYXRpb25zIGZvciBQQ0llIGRldmljZXMgaW4gbWFwX3JhbmdlX3RvX2RvbWFpbiBieQ0KPj4g
c2V0dGluZyBuZWVkX21hcHBpbmcgPSBmYWxzZS4NCj4+DQo+PiBUaGUgaWRlYSBpcyB0aGF0IGlu
c3RlYWQsIHdlJ2xsIG9ubHkgbWFwIHRoaW5ncyB3aGVuIG5lZWRlZCBhbmQgbm90IHRoZQ0KPj4g
d2hvbGUgYXBlcnR1cmUuIEhvd2V2ZXIsIGxvb2tpbmcgYXQgdGhlIGNoYW5nZXMgdG8NCj4+IHBj
aV9ob3N0X2JyaWRnZV9tYXBwaW5ncyAoZm9ybWVybHkga25vd24gYXMNCj4+IHBjaV9ob3N0X2Jy
aWRnZV9uZWVkX3AybV9tYXBwaW5nKSwgaXQgaXMgc3RpbGwgZ29pbmcgdGhyb3VnaCB0aGUgZnVs
bA0KPj4gbGlzdCBvZiBhZGRyZXNzIHJhbmdlcyBvZiB0aGUgUENJZSBicmlkZ2UgYW5kIG1hcCBl
YWNoIHJhbmdlIG9uZSBieSBvbmUNCj4+IHVzaW5nIG1hcF9yYW5nZV90b19kb21haW4uIEFsc28s
IHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5ncyBpcyBzdGlsbA0KPj4gY2FsbGVkIHVuY29uZGl0aW9u
YWxseSBhdCBib290IGZvciBEb20wLg0KPj4NCj4+IFNvIEkgYW0gbWlzc2luZyB0aGUgcGFydCB3
aGVyZSB0aGUgYXBlcnR1cmUgaXMgYWN0dWFsbHkgKm5vdCogbWFwcGVkIHRvDQo+PiBEb20wLg0K
V2l0aCBtYXBfcmFuZ2VfdG9fZG9tYWluIHdlIGFsc28gbWFwcGVkIGFsbCB0aGUgZW50cmllcw0K
DQpvZiB0aGUgInJlZyIgYW5kICJyYW5nZXMiIHByb3BlcnRpZXMuIExldCdzIGhhdmUgYSBsb29r
IGF0IFsxXToNCg0KLSByYW5nZXPCoMKgwqDCoMKgwqDCoMKgIDogQXMgZGVzY3JpYmVkIGluIElF
RUUgU3RkIDEyNzUtMTk5NCwgYnV0IG11c3QgcHJvdmlkZQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhdCBsZWFzdCBhIGRlZmluaXRpb24gb2Ygbm9uLXByZWZldGNoYWJs
ZSBtZW1vcnkuIE9uZQ0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvciBi
b3RoIG9mIHByZWZldGNoYWJsZSBNZW1vcnkgYW5kIElPIFNwYWNlIG1heSBhbHNvDQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJlIHByb3ZpZGVkLg0KDQotIHJlZ8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgOiBUaGUgQ29uZmlndXJhdGlvbiBTcGFjZSBiYXNlIGFkZHJlc3Mg
YW5kIHNpemUsIGFzIGFjY2Vzc2VkDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZyb20gdGhlIHBhcmVudCBidXMuwqAgVGhlIGJhc2UgYWRkcmVzcyBjb3JyZXNwb25kcyB0
bw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aGUgZmlyc3QgYnVzIGlu
IHRoZSAiYnVzLXJhbmdlIiBwcm9wZXJ0eS7CoCBJZiBubw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAiYnVzLXJhbmdlIiBpcyBzcGVjaWZpZWQsIHRoaXMgd2lsbCBiZSBi
dXMgMCAodGhlIGRlZmF1bHQpLg0KDQpUaGUgbW9zdCBpbnRlcmVzdGluZyBjb21lcyB3aGVuICJy
ZWciIGFsc28gaGFzIG90aGVyIHRoZW4gY29uZmlndXJhdGlvbg0KDQpzcGFjZSBhZGRyZXNzZXMs
IGZvciBleGFtcGxlIFsyXToNCg0KLSByZWc6IFNob3VsZCBjb250YWluIHJjX2RiaSwgY29uZmln
IHJlZ2lzdGVycyBsb2NhdGlvbiBhbmQgbGVuZ3RoLg0KLSByZWctbmFtZXM6IE11c3QgaW5jbHVk
ZSB0aGUgZm9sbG93aW5nIGVudHJpZXM6DQogwqAgInJjX2RiaSI6IGNvbnRyb2xsZXIgY29uZmln
dXJhdGlvbiByZWdpc3RlcnM7DQogwqAgImNvbmZpZyI6IFBDSWUgY29uZmlndXJhdGlvbiBzcGFj
ZSByZWdpc3RlcnMuDQoNClNvLCB3ZSBkb24ndCBuZWVkIHRvIG1hcCAicmFuZ2VzIiBhbmQgKmNv
bmZpZyogZnJvbSB0aGUgInJlZyIsIGJ1dCBhbGwNCg0KdGhlIHJlc3QgZnJvbSAicmVnIiBzdGls
bCBuZWVkcyB0byBiZSBtYXBwZWQgdG8gRG9tYWluLTAsIHNvIHRoZSBQQ0llDQoNCmJyaWRnZSBj
YW4gcmVtYWluIGZ1bmN0aW9uYWwgaW4gRG9tYWluLTAuDQoNCj4+ICAgV2hhdCdzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gdGhlIGxvb3AgaW4NCj4+IHBjaV9ob3N0X2JyaWRnZV9tYXBwaW5nczoN
Cj4+DQo+PiAgICBmb3IgKCBpID0gMDsgaSA8IGR0X251bWJlcl9vZl9hZGRyZXNzKGRldik7IGkr
KyApDQo+PiAgICAgIG1hcF9yYW5nZV90b19kb21haW4uLi4NCj4+DQo+PiBhbmQgdGhlIHByZXZp
b3VzIGNvZGUgaW4gbWFwX3JhbmdlX3RvX2RvbWFpbj8gSSB0aGluayBJIGFtIG1pc3NpbmcNCj4+
IHNvbWV0aGluZyBidXQgYXMgbWVudGlvbmVkIGl0IGlzIGRpZmZpY3VsdCB0byByZXZpZXcgdGhl
IHBhdGNoIGxpa2UgdGhpcw0KPj4gb3V0IG9mIG9yZGVyLg0KPj4NCj4+IEFsc28sIGFuZCB0aGlz
IGlzIG1pbm9yLCBldmVuIGlmIGN1cnJlbnRseSB1bnVzZWQsIGl0IG1pZ2h0IGJlIGdvb2QgdG8N
Cj4+IGtlZXAgYSBsZW5ndGggcGFyYW1ldGVyIHRvIHBjaV9ob3N0X2JyaWRnZV9uZWVkX3AybV9t
YXBwaW5nLg0KPiBJdCBsb29rcyBsaWtlIHRoZSBmaWx0ZXJpbmcgaXMgZG9uZSBiYXNlZCBvbjoN
Cj4NCj4gcmV0dXJuIGNmZy0+cGh5c19hZGRyICE9IGFkZHINCg0KQXMgSSBleHBsYWluZWQgYWJv
dmUgaXQgaXMgKm5vdyogdGhlIG9ubHkgcmFuZ2UgdGhhdCB3ZSAqZG8gbm90IHdhbnQqIHRvDQoN
CmJlIG1hcHBlZCB0byBEb21haW4tMC4gT3RoZXIgInJlZyIgZW50cmllcyBzdGlsbCBuZWVkIHRv
IGJlIG1hcHBlZC4NCg0KPg0KPiBpbiBwY2lfZWNhbV9uZWVkX3AybV9tYXBwaW5nIHRoYXQgaXMg
ZXhwZWN0ZWQgdG8gZmlsdGVyIG91dCB0aGUgYWRkcmVzcw0KPiByYW5nZXMgd2UgZG9uJ3Qgd2Fu
dCB0byBtYXAgYmVjYXVzZSBpdCBjb21lcyBmcm9tDQo+IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhv
c3QtY29tbW9uLmM6Z2VuX3BjaV9pbml0Og0KPg0KPiAgICAgIC8qIFBhcnNlIG91ciBQQ0kgZWNh
bSByZWdpc3RlciBhZGRyZXNzKi8NCj4gICAgICBlcnIgPSBkdF9kZXZpY2VfZ2V0X2FkZHJlc3Mo
ZGV2LCBlY2FtX3JlZ19pZHgsICZhZGRyLCAmc2l6ZSk7DQo+ICAgICAgaWYgKCBlcnIgKQ0KPiAg
ICAgICAgICBnb3RvIGVycl9leGl0Ow0KPg0KPiBJbiBwY2lfaG9zdF9icmlkZ2VfbWFwcGluZ3Ms
IGluc3RlYWQgb2YgcGFyc2luZyBkZXZpY2UgdHJlZSBhZ2FpbiwgY2FuJ3QNCj4gd2UganVzdCBm
ZXRjaCB0aGUgYWRkcmVzcyBhbmQgbGVuZ3RoIHdlIG5lZWQgdG8gbWFwIHN0cmFpZ2h0IGZyb20N
Cj4gYnJpZGdlLT5zeXNkYXRhLT5waHlzX2FkZHIvc2l6ZSA/DQoNCldlIGNhbid0IGFzIHRoZSBh
ZGRyZXNzIGRlc2NyaWJlcyB0aGUgY29uZmlndXJhdGlvbiBzcGFjZSB3aGljaCB3ZQ0KDQoqZG8g
bm90KiB3YW50IHRvIGJlIG1hcHBlZCwgYnV0IHdoYXQgd2Ugd2FudCBpcyBvdGhlciB0aGFuIGNv
bmZpZ3VyYXRpb24NCg0KZW50cmllcyBpbiB0aGUgInJlZyIgcHJvcGVydHkuDQoNCj4NCj4gQXQg
dGhlIHBvaW50IHdoZW4gcGNpX2hvc3RfYnJpZGdlX21hcHBpbmdzIGlzIGNhbGxlZCBpbiB5b3Vy
IG5ldyBwYXRjaCwNCj4gd2UgaGF2ZSBhbHJlYWR5IGluaXRpYWxpemVkIGFsbCB0aGUgUENJZS1y
ZWxhdGVkIGRhdGEgc3RydWN0dXJlcy4gSXQNCj4gc2VlbXMgYSBiaXQgdXNlbGVzcyB0byBoYXZl
IHRvIGdvIHZpYSBkZXZpY2UgdHJlZSBhZ2Fpbi4NCg0KQm90dG9tIGxpbmU6IHdlIGRvIG5lZWQg
dG8gZ28gb3ZlciB0aGUgInJlZyIgcHJvcGVydHkgYW5kIG1hcCB0aGUgcmVnaW9ucw0KDQpvZiB3
aGljaCBQQ0llIGJyaWRnZSBpcyBkZXBlbmRlbnQgYW5kIG9ubHkgc2tpcCAiY29uZmlnIiBwYXJ0
IG9mIGl0Lg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQoNClsxXSBodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2hvc3Qt
Z2VuZXJpYy1wY2kudHh0DQoNClsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2hpc2lsaWNvbi1wY2llLnR4dA0KDQo=

