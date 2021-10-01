Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB141E7B6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 08:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200403.354929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWCHG-0007xt-MX; Fri, 01 Oct 2021 06:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200403.354929; Fri, 01 Oct 2021 06:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWCHG-0007w6-JH; Fri, 01 Oct 2021 06:44:14 +0000
Received: by outflank-mailman (input) for mailman id 200403;
 Fri, 01 Oct 2021 06:44:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22t+=OV=epam.com=prvs=09080f3fa0=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mWCHE-0007vy-NK
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 06:44:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c7c722c-129f-4277-a787-e34a5e94ad7b;
 Fri, 01 Oct 2021 06:44:11 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1916Sadr002384; 
 Fri, 1 Oct 2021 06:44:09 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bdw3gr1n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Oct 2021 06:44:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3586.eurprd03.prod.outlook.com (2603:10a6:208:43::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 06:44:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 06:44:06 +0000
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
X-Inumbo-ID: 6c7c722c-129f-4277-a787-e34a5e94ad7b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCoFeg0AIRzfA5qv8KeBTC67DG6VRC0MZJOuJT6kbjt03Er61Jr0vqD3IRx1vLOfpv16Ly++6XRELg5+5VJLLrOuLExnIkq7Btpq0O9efdHx9Y4fQPqYB8wbNX5BYywb5+fkBqQF7l89F7pjoc9xs6bDdk43wraBq0ELKvA5X1RtMdyviql1sVonh69wsIa5/9C9QvpF1RoTCJCiV8kHuFmQdeibJ9JbNl69l712KMD/bh5cjGo25fyqie4W1snP28unTnnBVwdcLOKJFop5rP7OznBDVD+jXOGChZadnPP8c+KF8X67gbzNwzdZaRjXx4GziK1PQx4zrj9sASDkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8McOopZ7VYJo3QBix0nYIjZHyBOF/jivVjH0poyI5c=;
 b=UEabVqWbCDWCtkrTxRi/U8PmKANTTt0b7i/XWOrsanO+7iROx75M5G35ktiUgWg+d3oviCGHvi8AdPqOwxDNue3MnGm/2rHOBnChKRK8u5NSU+ayQ6XL1lFEl0JV61GEerXnhLliEtZobT7NsP931x3u9HNNXgMr2+dH6K+Yp/CFR3ZJ8QBsHUGxNxWd3ZdJgzkkq2DBuqhw/+Iz7uAmh0JaMY88g1/ys6j5qgQxc5JBp3r+dSGPwYuDr3dIqsui3VuqR6j7uqk/YUniUqVFp0JNbmMdY3izCmIE5ETsJfnio9cZdAi/XhJLeTgPgm5ugqeEGEg30OKQ307bu7ONIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8McOopZ7VYJo3QBix0nYIjZHyBOF/jivVjH0poyI5c=;
 b=4TJcyDqzy/e3G4eQlJ+w4/sUdalpneyOeHUYHEFvs7aHzq9iIVS3x86Tv6dm9JxCdOZRnXpTvK/ocwObnMp5QzB2jGE5KhM5JYj+BOFpMLFtMuJ+AjKjGMCm+FFWHlH0cKQ8qF2XoTgEVmQigSXaiyRVadiiLs8lnhcMBT9wv66UrHmSrOrtQW/Y7qFq2AQEVte6blJbFq8hIrz9s+gm3HTlupk9UgSI3loxNNbMmMDcJh6VzxswuUU8drKIpz0vfUHLRG0xZhtuj9vCmh2wPcEBw9OVRO0X4Hq/jXEqtOq56jEkc0JBHimqLO7grtUMGmMEhucxGoVnz9dVK+OK0w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v3 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXtcqz/jFZdzuyGUmCDWKb0tIV16u9T7KAgABkLIA=
Date: Fri, 1 Oct 2021 06:44:06 +0000
Message-ID: <bf6c9756-4d41-682f-24c6-3f4b7589afb8@epam.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
 <20210930071326.857390-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109301742300.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109301742300.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06530992-af07-4e8d-f778-08d984a6dd54
x-ms-traffictypediagnostic: AM0PR03MB3586:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB35861D9AB95A81B166A845BCE7AB9@AM0PR03MB3586.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5PCXZx6Ldt1f1oDlzh5RYKlAVSwXqXjRpSp5dW97cwoh4pibsSS2iSC57BvtcuGNR9/uSumyG8sbrx+xKiY4KU+jMIZrKCEdEDpfBKisg4Kwbmw2YnJtgZnCaAEJ68bV88umQyWO0zWdBwXjlPnPcY3uUHHrhLQQ+vIEdgz/TVFEaR4VvZjiUr/eYeFFBSS04Wbb8Hqz9+L89Q/P3IIZJurPNu2bQiPNU+mMMOlzx2ykWXIiXu0aL8YGu5Ll3MV5xBV2EytKdusATmGgNnLnP7MDSY1uB3IfLy4dRiVVjH4U2nbScNRTQ900Bz50Y7Tx3uATT3WxoCZ3lt0lAEfj5nfy/PjmKjQ91CKPXikZXldWaOf/JMSrxXyPH4Wctla53xsAYDsMr4KFrp+b2u0GFv4KOVlobgqw1pq3JwQQHt2uBT7nPawUP8NrtjvTZwbwSMaivPqET+XHS80znUAF7+PA3Im15i1z/BkKMPLqhNKmUCGWZCsfjJVIN+4VlzCYgIjaBGcB8YtMs0W30alHdEbMPrHbcuH9pT0WmZTJ+KRtDPJfuPSNLOLuM4bqSU/qXkMsnLPyyx+8s1HkEG2QwhfZhsL+jtdZLBDh8F4D2U7T7/yD00QAEvSqhOO6sOzMdm9MWUO0Xg+Dm2yKyI9YIWJTQsVfQSQwbsoXLltTbYIxBUFKeg+RM9Vyh3eRyKXPeKBcKTxupFlgEnCrzuTNDScp+xeE3+qcyDVxbPg6a/7rTvCILdevfTIVD/kh6qEE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(6916009)(186003)(316002)(4326008)(38070700005)(54906003)(31686004)(83380400001)(38100700002)(26005)(36756003)(122000001)(31696002)(6506007)(66556008)(66476007)(5660300002)(66946007)(86362001)(53546011)(64756008)(76116006)(66446008)(2906002)(91956017)(2616005)(508600001)(6486002)(6512007)(8936002)(8676002)(107886003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V1dJL0NSbS9PY1MvNHlwQUhQdEdWYUFIMHZvQ1hwUEQ0bUFGdm9VaTRteGpu?=
 =?utf-8?B?eE9zd3FDL0drRTVLZ2RoNk03M0dqOC81ZjJsV0k0RkwvODdBcUNKQ05iZjJo?=
 =?utf-8?B?Q0VHRXdVT2Evc0ttMzR4aGJheURGNmJTYTZTRFJETmpoeVdwVXR5VmQ5Ymkr?=
 =?utf-8?B?eHUzZTNOUnkxZW9yVzBuMFBOOWpUZ1lXUlo3SHdDaTQ2T3g3Z2VnSGpGRSsr?=
 =?utf-8?B?azlQSFhTS2lULzdrVERUSEJBaWFURE9MdTB6VyswTDZ4KzhlVDBxbXZ5cGJl?=
 =?utf-8?B?TkdCRmZWRXhRNVhBQWl5eDVBdUlFTll1NWs5bm13ZDNaWGlqUVF1aFA5cmQy?=
 =?utf-8?B?b0dCTlBMZjgyRHRhdGNjcnVxWEdieExqQVArREc3U3NPdlNlc0E0Q3g2NVNQ?=
 =?utf-8?B?Z2lXcThHSnlSRHZETk0vbVlFK3FSTnpHTUJsbmhVcWx3OFAyVWw0MTVYM2k2?=
 =?utf-8?B?bkJVMmVRRk9UNXRQaDhPSG9TVnc4M1JhQnJpT2lUVzZMR2VESmVwNC9ucnZX?=
 =?utf-8?B?aWVaa3RpTmpPdVc3QzJSWEdSMUMyeVlnY0I0dEovRldPSUo5UzFCaDA4WGhQ?=
 =?utf-8?B?WjFHT2NETjhSNDBJQ1FTbnZFUmZIRTc3S3RnM3VhM0tieFFJaVJmSC9OcjJG?=
 =?utf-8?B?eG95V0hiRUtQQjlDSUJXa0dybnh5MzQwVDlRQUsraGRoUThlY2VCYnFPbTNX?=
 =?utf-8?B?UHBlNHFSTFEvaURyV0N0Slh5c3pmMnpwTXpodXpCM0QrZ040K2QwT3kyTmE5?=
 =?utf-8?B?RDVnZDZqMUM3aWdhNVVTbytwWnIxZTg3STZiKzFrQVhFdmpEM2tjeXBhcTQr?=
 =?utf-8?B?OFRaSTRqTVJJVlo0ZmhCM3FMbDhHQjZNZ1ZZaVIzYUJUSzdUdjdwR1Rwb0Uv?=
 =?utf-8?B?K0tzUDRpWElia0E4L3ZqaHVkc3hxVXByazhkZDFaQXpZWXhGMEFqMnR5cHY0?=
 =?utf-8?B?NGcwTjNuM2xlcUloSUVSZlRuNXNQMHBGUC9BOHhkWnFuTGlPN0JCbUQ4d3dO?=
 =?utf-8?B?ZkRueFcwWmpqMW1ndkJucG9GZUVZZU02VWpKNVBKNVpJem1wVkNYNzNJV1JB?=
 =?utf-8?B?VEpHSWFwSEtxT1owZC9WVStRZG10UUxrZ2ZmM2RsUDNXZWZmbXB5SFFkRWsy?=
 =?utf-8?B?cGFKSlF5NU9kWkZhSC9ROFNQSTV6Q25xdkRkQTRUbHZ4bi8zYWsxL045RDdp?=
 =?utf-8?B?RytoUGNNUWxhVGgvSGVDeEJQRk1SVHFCTEJNOE12eXhlSC9saHRyY0htUjFT?=
 =?utf-8?B?YjVER1dqdnpOc3ZIcWw4QXBqZ0N5c3piVFFKalUzcW9OVEJiNkszN3hLcjd4?=
 =?utf-8?B?eHM2QndQSzRKNDBKTGc4Q1JXTXU1TjM3cUw0a2lIbWdZT3RIdWswWEhDZDRZ?=
 =?utf-8?B?UExyVWpjYU9pR0xSL0FRN3pSdDdKa3ZnVHA3aG1ua3JCUmU4TXJqMitqNlJ6?=
 =?utf-8?B?cnAyRng5VUR1UDJzOUhCWVFZM2l5VVZ0eXFHS2J0dXpKK0cvNC9iaitUSXRz?=
 =?utf-8?B?YlI3WkZnaHdiMWRqY2NTTVBTbThPYVM0c0dyMGllRC9FbW9VbUgwTmUvQ0Z1?=
 =?utf-8?B?RjJzVjlHbmVjd3QyQldIN3dGUjdTRkNDdjJYTWgzQnRLZnVrRzAzYWVRR3JT?=
 =?utf-8?B?RnJzOW5GcnRVS1p1RitNNk5BMEN6ZzhDekg3dDlMemdZQ3FJMm8vZm03QVBJ?=
 =?utf-8?B?WnNIVXBuNnNHeEpiTk51MElJN0VjQnVKRzFiMHROWmd0QnhyR2lQb1g5c0hN?=
 =?utf-8?Q?Cgpen6F6iDyEsWyErFC+dPgpoG8UN26L2xIQHW4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2389B732E35AFA4B861784A4BAA93A38@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06530992-af07-4e8d-f778-08d984a6dd54
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 06:44:06.1281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FmV6htP6JemTo4C6Gl1ZAq+jXBBmMdFsoVJoQ3/WVo/DGjyZqB/YZmk+2PmfSZopSb+n8hU5MsneSKaNN7Mm9ogf7I7hmKvFpouazC1cGRh0GrcIq092052FfABYMBJi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3586
X-Proofpoint-GUID: zmsYezIog8Fu7O-5IUItlKpiVvHuH-om
X-Proofpoint-ORIG-GUID: zmsYezIog8Fu7O-5IUItlKpiVvHuH-om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_07,2021-09-30_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110010044

DQoNCk9uIDAxLjEwLjIxIDAzOjQ1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFRo
dSwgMzAgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gRnJvbTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pg0KPj4NCj4+IEluIG9yZGVyIGZvciB2UENJIHRvIHdvcmsgaXQgbmVlZHMgdG8gbWFpbnRhaW4g
Z3Vlc3QgYW5kIGhhcmR3YXJlDQo+PiBkb21haW4ncyB2aWV3cyBvZiB0aGUgY29uZmlndXJhdGlv
biBzcGFjZS4gRm9yIGV4YW1wbGUsIEJBUnMgYW5kDQo+PiBDT01NQU5EIHJlZ2lzdGVycyByZXF1
aXJlIGVtdWxhdGlvbiBmb3IgZ3Vlc3RzIGFuZCB0aGUgZ3Vlc3Qgdmlldw0KPj4gb2YgdGhlIHJl
Z2lzdGVycyBuZWVkcyB0byBiZSBpbiBzeW5jIHdpdGggdGhlIHJlYWwgY29udGVudHMgb2YgdGhl
DQo+PiByZWxldmFudCByZWdpc3RlcnMuIEZvciB0aGF0IEVDQU0gYWRkcmVzcyBzcGFjZSBuZWVk
cyB0byBhbHNvIGJlDQo+PiB0cmFwcGVkIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluLCBzbyB3ZSBu
ZWVkIHRvIGltcGxlbWVudCBQQ0kgaG9zdA0KPj4gYnJpZGdlIHNwZWNpZmljIGNhbGxiYWNrcyB0
byBwcm9wZXJseSBzZXR1cCBNTUlPIGhhbmRsZXJzIGZvciB0aG9zZQ0KPj4gcmFuZ2VzIGRlcGVu
ZGluZyBvbiBwYXJ0aWN1bGFyIGhvc3QgYnJpZGdlIGltcGxlbWVudGF0aW9uLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiAtLS0NCj4+IFNpbmNlIHYyOg0KPj4gLSByZW1vdmVkIHVu
bmVlZGVkIGFzc2lnbm1lbnQgKGNvdW50ID0gMCkNCj4+IC0gcmVtb3ZlZCB1bm5lZWRlZCBoZWFk
ZXIgaW5jbHVzaW9uDQo+PiAtIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPj4gU2luY2UgdjE6DQo+
PiAgIC0gRHluYW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBudW1iZXIgb2YgTU1JTyBoYW5kbGVycyBy
ZXF1aXJlZCBmb3IgdlBDSQ0KPj4gICAgIGFuZCB1cGRhdGUgdGhlIHRvdGFsIG51bWJlciBhY2Nv
cmRpbmdseQ0KPj4gICAtIHMvY2xiL2NiDQo+PiAgIC0gRG8gbm90IGludHJvZHVjZSBhIG5ldyBj
YWxsYmFjayBmb3IgTU1JTyBoYW5kbGVyIHNldHVwDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L2RvbWFpbi5jICAgICAgICAgICAgICB8ICAyICsrDQo+PiAgIHhlbi9hcmNoL2FybS9wY2kvcGNp
LWhvc3QtY29tbW9uLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIHhlbi9h
cmNoL2FybS92cGNpLmMgICAgICAgICAgICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4+ICAgeGVuL2FyY2gvYXJtL3ZwY2kuaCAgICAgICAgICAgICAgICB8ICA2ICsr
KysrKw0KPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5oICAgICAgICAgIHwgIDUgKysrKysN
Cj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gaW5k
ZXggNzkwMTJiZjc3NzU3Li5mYTZmY2M1ZTQ2N2MgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4gQEAgLTczMyw2
ICs3MzMsOCBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+PiAg
ICAgICBpZiAoIChyYyA9IGRvbWFpbl92Z2ljX3JlZ2lzdGVyKGQsICZjb3VudCkpICE9IDAgKQ0K
Pj4gICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICAgDQo+PiArICAgIGNvdW50ICs9IGRvbWFpbl92
cGNpX2dldF9udW1fbW1pb19oYW5kbGVycyhkKTsNCj4+ICsNCj4+ICAgICAgIGlmICggKHJjID0g
ZG9tYWluX2lvX2luaXQoZCwgY291bnQgKyBNQVhfSU9fSEFORExFUikpICE9IDAgKQ0KPj4gICAg
ICAgICAgIGdvdG8gZmFpbDsNCj4+ICAgDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Bj
aS9wY2ktaG9zdC1jb21tb24uYyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMN
Cj4+IGluZGV4IDU5MmMwMWFhZTViYi4uMWViNGRhYTg3MzY1IDEwMDY0NA0KPj4gLS0tIGEveGVu
L2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3Bj
aS9wY2ktaG9zdC1jb21tb24uYw0KPj4gQEAgLTI5Miw2ICsyOTIsMzQgQEAgc3RydWN0IGR0X2Rl
dmljZV9ub2RlICpwY2lfZmluZF9ob3N0X2JyaWRnZV9ub2RlKHN0cnVjdCBkZXZpY2UgKmRldikN
Cj4+ICAgICAgIH0NCj4+ICAgICAgIHJldHVybiBicmlkZ2UtPmR0X25vZGU7DQo+PiAgIH0NCj4+
ICsNCj4+ICtpbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKHN0cnVjdCBkb21haW4gKmQsDQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCpjYikoc3RydWN0IGRvbWFpbiAq
ZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGNp
X2hvc3RfYnJpZGdlICpicmlkZ2UpKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHBjaV9ob3N0X2Jy
aWRnZSAqYnJpZGdlOw0KPj4gKyAgICBpbnQgZXJyOw0KPj4gKw0KPj4gKyAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KCBicmlkZ2UsICZwY2lfaG9zdF9icmlkZ2VzLCBub2RlICkNCj4+ICsgICAgew0K
Pj4gKyAgICAgICAgZXJyID0gY2IoZCwgYnJpZGdlKTsNCj4+ICsgICAgICAgIGlmICggZXJyICkN
Cj4+ICsgICAgICAgICAgICByZXR1cm4gZXJyOw0KPj4gKyAgICB9DQo+PiArICAgIHJldHVybiAw
Ow0KPj4gK30NCj4+ICsNCj4+ICtpbnQgcGNpX2hvc3RfZ2V0X251bV9icmlkZ2VzKHZvaWQpDQo+
PiArew0KPj4gKyAgICBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2U7DQo+PiArICAgIGlu
dCBjb3VudCA9IDA7DQo+PiArDQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoIGJyaWRnZSwg
JnBjaV9ob3N0X2JyaWRnZXMsIG5vZGUgKQ0KPj4gKyAgICAgICAgY291bnQrKzsNCj4+ICsNCj4+
ICsgICAgcmV0dXJuIGNvdW50Ow0KPj4gK30NCj4+ICsNCj4+ICAgLyoNCj4+ICAgICogTG9jYWwg
dmFyaWFibGVzOg0KPj4gICAgKiBtb2RlOiBDDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L3ZwY2kuYyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+IGluZGV4IDc2YzEyYjkyODE0Zi4uNWQ2
YzI5YzhkY2Q5IDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gKysrIGIv
eGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4gQEAgLTgwLDE3ICs4MCw1MCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1taW9faGFuZGxlcl9vcHMgdnBjaV9tbWlvX2hhbmRsZXIgPSB7DQo+PiAgICAgICAu
d3JpdGUgPSB2cGNpX21taW9fd3JpdGUsDQo+PiAgIH07DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQg
dnBjaV9zZXR1cF9tbWlvX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkN
Cj4+ICt7DQo+PiArICAgIHN0cnVjdCBwY2lfY29uZmlnX3dpbmRvdyAqY2ZnID0gYnJpZGdlLT5j
Zmc7DQo+PiArDQo+PiArICAgIHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdnBjaV9tbWlvX2hh
bmRsZXIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICBjZmctPnBoeXNfYWRkciwgY2Zn
LT5zaXplLCBOVUxMKTsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gICBpbnQg
ZG9tYWluX3ZwY2lfaW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICB7DQo+PiAgICAgICBpZiAo
ICFoYXNfdnBjaShkKSApDQo+PiAgICAgICAgICAgcmV0dXJuIDA7DQo+PiAgIA0KPj4gKyAgICBp
ZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+PiArICAgICAgICByZXR1cm4gcGNpX2hvc3Rf
aXRlcmF0ZV9icmlkZ2VzKGQsIHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKTsNCj4+ICsNCj4+ICsg
ICAgLyogR3Vlc3QgZG9tYWlucyB1c2Ugd2hhdCBpcyBwcm9ncmFtbWVkIGluIHRoZWlyIGRldmlj
ZSB0cmVlLiAqLw0KPj4gICAgICAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9f
aGFuZGxlciwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHVUVTVF9WUENJX0VDQU1f
QkFTRSwgR1VFU1RfVlBDSV9FQ0FNX1NJWkUsIE5VTEwpOw0KPj4gICANCj4+ICAgICAgIHJldHVy
biAwOw0KPj4gICB9DQo+PiAgIA0KPj4gK2ludCBkb21haW5fdnBjaV9nZXRfbnVtX21taW9faGFu
ZGxlcnMoc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIGludCBjb3VudDsNCj4+ICsN
Cj4+ICsgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4gKyAgICAgICAgLyogRm9y
IGVhY2ggUENJIGhvc3QgYnJpZGdlJ3MgY29uZmlndXJhdGlvbiBzcGFjZS4gKi8NCj4+ICsgICAg
ICAgIGNvdW50ID0gcGNpX2hvc3RfZ2V0X251bV9icmlkZ2VzKCk7DQo+PiArICAgIGVsc2UNCj4+
ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBWUENJX01TSVhfTUVNX05VTSBoYW5kbGVycyBm
b3IgTVNJLVggdGFibGVzIHBlciBlYWNoIFBDSSBkZXZpY2UNCj4+ICsgICAgICAgICAqIGJlaW5n
IHBhc3NlZCB0aHJvdWdoLiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgZGV2aWNlcw0KPj4g
KyAgICAgICAgICogaXMgMzIgYXMgdmlydHVhbCBidXMgdG9wb2xvZ3kgZW11bGF0ZXMgdGhlIGRl
dmljZXMgYXMgZW1iZWRkZWQNCj4+ICsgICAgICAgICAqIGVuZHBvaW50cy4NCj4+ICsgICAgICAg
ICAqICsxIGZvciBhIHNpbmdsZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24g
c3BhY2UuICovDQo+IENvZGUgc3R5bGU6IFhlbiBtdWx0aWxpbmUgY29tbWVudHMgYXJlIGxpa2Ug
dGhpczoNCldpbGwgZml4DQo+DQo+IC8qDQo+ICAgKiBjb21tZW50DQo+ICAgKiBtb3JlIGNvbW1l
bnQNCj4gICAqLw0KPg0KPiBBc2lkZSBmcm9tIHRoaXMgbWlub3IgY29tbWVudDoNCj4NCj4gUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4N
Cj4NCj4+ICsgICAgICAgIGNvdW50ID0gVlBDSV9NU0lYX01FTV9OVU0gKiAzMiArIDE7DQo+PiAr
DQo+PiArICAgIHJldHVybiBjb3VudDsNCj4+ICt9DQo+PiArDQo+PiAgIC8qDQo+PiAgICAqIExv
Y2FsIHZhcmlhYmxlczoNCj4+ICAgICogbW9kZTogQw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS92cGNpLmggYi94ZW4vYXJjaC9hcm0vdnBjaS5oDQo+PiBpbmRleCBkOGE3YjBlM2U4MDIu
LjI3YTJiMDY5YWJkMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS92cGNpLmgNCj4+ICsr
KyBiL3hlbi9hcmNoL2FybS92cGNpLmgNCj4+IEBAIC0xNywxMSArMTcsMTcgQEANCj4+ICAgDQo+
PiAgICNpZmRlZiBDT05GSUdfSEFTX1ZQQ0kNCj4+ICAgaW50IGRvbWFpbl92cGNpX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCk7DQo+PiAraW50IGRvbWFpbl92cGNpX2dldF9udW1fbW1pb19oYW5kbGVy
cyhzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICAgI2Vsc2UNCj4+ICAgc3RhdGljIGlubGluZSBpbnQg
ZG9tYWluX3ZwY2lfaW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICB7DQo+PiAgICAgICByZXR1
cm4gMDsNCj4+ICAgfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGRvbWFpbl92cGNpX2dl
dF9udW1fbW1pb19oYW5kbGVycyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK3sNCj4+ICsgICAgcmV0
dXJuIDA7DQo+PiArfQ0KPj4gICAjZW5kaWYNCj4+ICAgDQo+PiAgICNlbmRpZiAvKiBfX0FSQ0hf
QVJNX1ZQQ0lfSF9fICovDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wY2ku
aCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgNCj4+IGluZGV4IDU2NmE5NDM2YTE4ZS4uMGQw
MjY2YjEzY2JhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaA0KPj4g
KysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaA0KPj4gQEAgLTEwOCw2ICsxMDgsMTEgQEAg
c3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBpc19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCh2b2lk
KQ0KPj4gICANCj4+ICAgdm9pZCBhcmNoX3BjaV9pbml0X3BkZXYoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpOw0KPj4gICANCj4+ICtpbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKHN0cnVjdCBkb21h
aW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKCpjbGIpKHN0cnVj
dCBkb21haW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkpOw0KPj4gK2ludCBwY2lfaG9zdF9nZXRf
bnVtX2JyaWRnZXModm9pZCk7DQo+PiArDQo+PiAgICNlbHNlICAgLyohQ09ORklHX0hBU19QQ0kq
Lw0KPj4gICANCj4+ICAgc3RydWN0IGFyY2hfcGNpX2RldiB7IH07DQo+PiAtLSANCj4+IDIuMjUu
MQ0KPj4NCg==

