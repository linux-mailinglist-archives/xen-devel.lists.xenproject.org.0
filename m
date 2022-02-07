Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ED54AC4A1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 17:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267176.460893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6Qs-0004Fy-2R; Mon, 07 Feb 2022 16:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267176.460893; Mon, 07 Feb 2022 16:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH6Qr-00048v-V5; Mon, 07 Feb 2022 16:00:01 +0000
Received: by outflank-mailman (input) for mailman id 267176;
 Mon, 07 Feb 2022 16:00:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH6Qq-00048g-4N
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 16:00:00 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feacb15f-882e-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 16:59:58 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217FmQG7009571;
 Mon, 7 Feb 2022 15:59:52 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e36cw01je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:59:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR3PR03MB6684.eurprd03.prod.outlook.com (2603:10a6:102:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 15:59:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 15:59:49 +0000
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
X-Inumbo-ID: feacb15f-882e-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvRz0AUThSV68jGgRZu9ME08QykmUpLlUDaDYvyD5uH7Scx31NNTUjrGJf3M0ntpkSnT0ADYg2+dOBZBnwAwNaCgkNaaBJ5+d1lmHKlemSDpSlRB9R5FBM9J7Juox1RLQf1J4Y14gJofFexRlYlj0bYOsGHjIQK177vKxi2PwpPoG8bD0lvzmvAxgcgLCu47FR96yS2PcLJlNnkrlLD4/2miY4NETebaErGk4t94xXRB9IVOWDevgTJ4BIDaf+XFOTev6BVpBa8qhaORdZOrlohem+mJtgchzRm6OdudHS3NrGYcNQSKgbjUl2212z6NhJ76w0qPuu8cxvkQqx4rAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpY/66G44ayxxo5csJuPIW+GRqPkDjn6+f0c0h9nrow=;
 b=HG0PCAxpmRgnsCvvClR5Sn0gAk9K6bseWOL8KXkOcvZUCjavmcCaXH7I1kAw3kHGgx80FHShKN35pRIuDPiztspKQIKHTO3BwCXLJ9ru6omMqzs8RPtXvOJf0lNqnqH5ukN3hY7a7AU0xkx8i+LEX9aiOcvHu3dNpxywen0OKc8YHujrTZeoDIokqyIewW3BXighrBJZP7QdCS7/QwpOcxPu51x9PzmdYby6sfqm7FzMjYhe1S3TmywhVWibtu0pdGKO9ftLFwzQnghiGBv5KZaqL1Hr5TANt9VdDmDGi/dBLPDNfLo5FTsR77jFR+PWNEOGg2rTWzkYGnlxSQ1Oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpY/66G44ayxxo5csJuPIW+GRqPkDjn6+f0c0h9nrow=;
 b=SZAZZtxgGk3362yJI/ry92sXTMAuFly3kurzzqQ7VOPdGRQFvBFoJlN14NM5Nfau9G+mf4S9Nqn9YVTikR572Nl1FpJtfCn7tGk6bbxb79/tFaT9veBpCg1QSG1Wpw+IF4t7gcbqPryKQcLGxHpVXoyXiL61qCFXXUKaT8YldBippSWbOS37b4kYvJ60pxmpO937tgTytf2bryldqXuWpE0NfjSFTS7ymYQVT62cc8QKDI3+5C/3kZFcWXeB04/JbDvkseiqpYQ5UnWK72Szc+n8DJTz2qJBkgNUhbjtUnxEOoyxy4BAGcGEzQQEC0j2sJoaxb7gdoNBuZaXHA8hsQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAABC8AgAAFjoCAAAI+gIAABB6AgAAIsAA=
Date: Mon, 7 Feb 2022 15:59:49 +0000
Message-ID: <064a5d95-9841-863e-8486-497cb7fefc7f@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
 <6b4ea90d-cc9c-edf7-e579-a84d72431d7a@epam.com>
 <f6f16729-8404-6703-11c6-dd7a4ebc658c@suse.com>
 <c5eee75b-bcf3-7e31-e25b-0bf0b217267a@epam.com>
 <06408e4c-3b9b-256c-9fe3-73d9a5383907@suse.com>
In-Reply-To: <06408e4c-3b9b-256c-9fe3-73d9a5383907@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f59c70f2-3662-4ac4-31e9-08d9ea52debc
x-ms-traffictypediagnostic: PR3PR03MB6684:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB6684A18756AAB2A87B0B0602E72C9@PR3PR03MB6684.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Qvv9ZQfWqoeCD6cOnh1vNoY60kJSxKxFTI9IubpDnnO1DGuI3hdmq2JVApbjUT06hcQY8SxPVenZpkrO+eVT5UB8jSNmxGVqrkpmLA90prTz10TrCsMPTAB/t3xDYD27oqdJMfnFcTo7cI3sxTCCLyR2/9Qt9xQSeYN4dCRckoJ+L+egU49lnNRWnBk4GctzIDIBJHzdj9CcsNvLDrNP1YDIW3wZ5OfKOSiWF8Ijcx6J9T/n0rhYy0EA7Q6LD46QxT2KCJElQqg+EJ3mblR+wg0+fJ8acNErrbgT7Ah33UNdKZ18OI7Ut1kupi5guo2CycEnw/RpQALHbmmKxpR9x3t4Oj+w9ub4WW19Q52oDV3MPFC3ZEtHM2m250q8pPveHQSJXbmZBLVN+FhwZ1jue7ce5ZCGSsGfh9Bb14S2tYfjlJ/dReWm6Fb45BUNMwBPtKeFKZLd8kJgU+LfCVdV1vpda3xr/jfDqTvy9KeQATPDxDZuShAp9J4qtiIO2tT6juabPt+3XNqQrGma657dVB+Yk85jScoDmM3WBbfsW8pvMOJFEs/nLnxHqJJjSjp/yFBXIESpBex1IpMDGEciePOUnZGXRq1IZgAl0nX0hCywXN8BTRKXFmq9NZZEfMU4mbGhjvXtliaxIAlRrbLsgNi3muaZUXWqjjtH46SkEqadRRe9/s30IEjcBLu5kVwaLmgT6Bn4AWKhhffjDNutTdMuuq4Ix8fiF/J9flQiSZQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(91956017)(31696002)(38070700005)(86362001)(4326008)(8936002)(66446008)(66476007)(6486002)(66556008)(76116006)(64756008)(8676002)(7416002)(508600001)(5660300002)(55236004)(54906003)(71200400001)(6916009)(186003)(6512007)(36756003)(26005)(316002)(6506007)(31686004)(53546011)(122000001)(38100700002)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzZ5Q0pSeERBYWdGWXVzMC8rMjZFRld6aVNNUUpxSlVWNTI4N1VlWTRoYWhZ?=
 =?utf-8?B?c3Z2UVBJaER2djd5NnRDb09aYW1SL0N1MW0wWSt4UlByR2QvSDRxZnd0TmdO?=
 =?utf-8?B?S0x1VzhXM3YxbnJ2WWg4eGd4c29PK1hTcjdWb2lwRitXU2lGNjJ2Zm5ESTVw?=
 =?utf-8?B?dUpKbEY3RzZXMDFzYVF1dXJicHc2OE42TkIxZmFvYjBPUlNsZnRCL082Qjl3?=
 =?utf-8?B?RU02SWFsK3kreGVjUExEcnBCQ29pRURoV0NTVzY4ZVBJeDdOYnhRc3l0eFVL?=
 =?utf-8?B?bE14SUFHMTZuZFo4bmt1T2FKVGtFN2QveE5jVGEzYm96N0ZuK3ZVNyttVkJm?=
 =?utf-8?B?N1JwUHljaFhFSmNuazNTL2N0MGF3eGhlQURUMU5JM1FmTkFnV2ZQd0lEa01H?=
 =?utf-8?B?bEkrdzc0SnFabC9FbXBjVlIxMlFOS1UyakZLeVlSQzhkWllLQVdBU1dScEth?=
 =?utf-8?B?Vk1tZFVDNy92RzJvNExobEF1Rzdac3lwc2Q0a0krQ3Bpcjh1OVR0cVUwbjBX?=
 =?utf-8?B?THZ1R0p3WGpZYjR1UDdGUGdMQTJXcFZESDdaSXNNNGh6RytmbjE5MG50aFBs?=
 =?utf-8?B?U01hVi81NHZ6Qm1nVUxtbUJSM3ZBcnNweWlSYmhoMTNWaytmQmhpRERVcmJX?=
 =?utf-8?B?ZzR0TWE1Ty9BSDY4TmFjZFhidktNRUNmbzRDK0NjaFh3Mk9DcXp6UWhpUlk3?=
 =?utf-8?B?VHZ5SHBwS1locHFuZHp3ek1rUm5xbmJ0elZId2dLQXh5Z1NVNHl2ZEI0SU5Q?=
 =?utf-8?B?UzRlaTdGWkhzWDFIbE9MSkJDZUFwaWFXRG5ub2JEVHI1OXV5ZnoyTWRYV1FK?=
 =?utf-8?B?TEdrSFh1REN5cmlzVUhWM2NuYTdBMDBJY3ZhbnZDZnhqNEl0eENYYXRTWEU3?=
 =?utf-8?B?MlJMRTlGVFpadmtoODlsTDRNMktRRWpXbjIwVUtOenlMdGlKVW5WSWluZHhz?=
 =?utf-8?B?RnluTk56UUoxOTNFR0NWS2VXVmZpNGpFWmx1bW1kSFVCenprbWk3QzZRQVZm?=
 =?utf-8?B?VUlaR3NCcURjV25rSFNEN3BGaHZHMk9jUTRiYlM5QW9hZEM5ck8rcHpLR2xD?=
 =?utf-8?B?Nmg1QU5hY3hETjlGQnJab0c5d2NtWlpISjJaTnhPdVhRNkdRUXJBM2wxNWtO?=
 =?utf-8?B?U3RyZ3BmOEdaLytoYjF1U3RkRFNCb3Vnc1AvSUhwd3ptb3hJU2YxUHBmdkhI?=
 =?utf-8?B?UERuWDgycWNZbEsxeTUwZmhOYWlOYnlvUmp3K0FOaGtpTlNZcUc3NVFNTHNo?=
 =?utf-8?B?ZiswOTIvUkxFUCt1SE5Lb2phbkNCNGlnTDdjMmxJYlF1V21oVVRmbEE0S0lp?=
 =?utf-8?B?M25EbkN5RHVXcXY1ZkpqVGFqZm1DdnFkUzNpNVc2SW53RmxJMWVBL3JxR2ds?=
 =?utf-8?B?SE10bGd1eXNGMS9rKzhJbTlWYTdTSUF1aFJEZnpSVFpoc2VqQmxSR2pGSm1O?=
 =?utf-8?B?U3RvSWV2RStrU3ppZGN3WmlaTDVpMzJiTDBKRDJ4TFVkb3RxY3VZdFhxR2hr?=
 =?utf-8?B?U3pOWU9TL21heTg3dy9qL2VsYUt5bkR6S0dnZ3l6YytNQVFYK0ljQjAwTFJk?=
 =?utf-8?B?VzQwSXI1bnFpdFpaUUsyTVo5QTdrajRmMStmZ21ISGdrWENyc1JsNW9KVHVY?=
 =?utf-8?B?WVlOQkFQUXkyQ0hTVFE2enVyaHRwS3J2TVVyR1lVTjRHamJ4dFhHZWgyRHow?=
 =?utf-8?B?ak5qeldEMFZ1WVYxVE1qZ0FjQzFROXFWTG9JOUJ5ZFV3N092MTFkMlJFV1N6?=
 =?utf-8?B?RUlwRWQ0OGxlK1RnWGJqTkRMVDVXaHlRZTNObUE5ZEV3WXBWS3hrbmdnT1ZW?=
 =?utf-8?B?US9GK1hNdnFhVThQQW9MTUF3UEZ0MEdta0d6NXMrc3QyY09uanVoUXFScCti?=
 =?utf-8?B?cXhOK3RFK3dVVURnQmNiRC9uZ01vclRTRDdYZ3huWlhIWE1oN3g3L2V6QWpX?=
 =?utf-8?B?ZUErOTRUY1cxYzZLc3gwNHJBK2QwTjBRb0U4TGdURElpeE9PL0ZMRjZPb0dR?=
 =?utf-8?B?dXE5eVJId0Nhc25IY0ZuUVZOZjNwNU5xaUswMisxOGxrVUlUTjdhZnM5YjND?=
 =?utf-8?B?aTBXb3I1aTRzRnpBWTNGVGNtWERxRW5CWXMzQms1MVNrVmNxQ084dC85U0pu?=
 =?utf-8?B?bzI4MFllZ21hZEhhWEcrb3pqOTMrc2xLaU9tUlhRMllDVWtuTUFUQXhnbW5r?=
 =?utf-8?B?a28rVFRMZVRIUkpITWZ3UHEzM05UR1l0b05FYjJWUVo4ZWNtYU13VTk4R3Rv?=
 =?utf-8?B?VWJYbTd3c3pCS05Vd1dRcVVUTjY5Nlo3dXlBb0paTXZRMkpMMW1aOEw5NGhP?=
 =?utf-8?B?YWwweVZpUmNscHJYMFVwdUV5K0RMRFdzV3hRcEEyZFdlSkpPdE53TTRmZHJH?=
 =?utf-8?Q?EqORUjRHNd/yxJOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF80018098A95748AECD469ACF93717B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59c70f2-3662-4ac4-31e9-08d9ea52debc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 15:59:49.3791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0YHNRewxEmetDZsOEQe6akSmzgYjOil8ub2DBTRHmdrrIMviK9mRYv61VsSDiGeVdz6cfxyAwTYQ3AxZK4QeWnskMjt59z/G6JiNe5puRxxW5Jc+WPw3f0e0mhta1/cz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6684
X-Proofpoint-GUID: 07fNzmO4YQy5amGLE8Ft1xI5xeoJ20YZ
X-Proofpoint-ORIG-GUID: 07fNzmO4YQy5amGLE8Ft1xI5xeoJ20YZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=674 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070101

DQoNCk9uIDA3LjAyLjIyIDE3OjI4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNjoxNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwNy4wMi4yMiAx
NzowNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDcuMDIuMjAyMiAxNTo0NiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDA3LjAyLjIyIDE2OjMxLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IEJ1dDogV2hhdCdzIHN0aWxsIG1pc3NpbmcgaGVyZSB0aGVuIGlz
IHRoZSBzZXBhcmF0aW9uIG9mIGd1ZXN0IGFuZCBob3N0DQo+Pj4+PiB2aWV3cy4gV2hlbiB3ZSBz
ZXQgSU5UeCBiZWhpbmQgdGhlIGd1ZXN0J3MgYmFjaywgaXQgc2hvdWxkbid0IG9ic2VydmUgdGhl
DQo+Pj4+PiBiaXQgc2V0LiBPciBpcyB0aGlzIG1lYW50IHRvIGJlIGFub3RoZXIgKGJpZykgVE9E
Tz8NCj4+Pj4gQnV0LCBwYXRjaCBbUEFUQ0ggdjYgMDkvMTNdIHZwY2kvaGVhZGVyOiBlbXVsYXRl
IFBDSV9DT01NQU5EIHJlZ2lzdGVyIGZvciBndWVzdHMNCj4+Pj4gYWxyZWFkeSB0YWtlcyBjYXJl
IG9mIGl0LCBJIG1lYW4gdGhhdCBpdCB3aWxsIHNldC9yZXNldCBJTlR4IGZvciB0aGUgZ3Vlc3QN
Cj4+Pj4gYWNjb3JkaW5nIHRvIE1TSS9NU0ktWC4gU28sIGlmIHdlIHNxdWFzaCB0aGVzZSB0d28g
cGF0Y2hlcyB0aGUgd2hvbGUNCj4+Pj4gcGljdHVyZSB3aWxsIGJlIHNlZW4gYXQgb25jZS4NCj4+
PiBEb2VzIGl0PyBJIGRpZCBnZXQgdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgZ3Vlc3Qgd291bGQg
YmUgYWJsZSB0byBvYnNlcnZlDQo+Pj4gdGhlIGJpdCBzZXQgZXZlbiBhZnRlciB3cml0aW5nIHpl
cm8gdG8gaXQgKHdoaWxlIGEgcmVhc29uIGV4aXN0cyB0aGF0IFhlbg0KPj4+IHdhbnRzIHRoZSBi
aXQgc2V0KS4NCj4+IFllcywgeW91IGFyZSBjb3JyZWN0OiBndWVzdCBtaWdodCBub3Qgc2VlIHdo
YXQgaXQgd2FudGVkIHRvIHNldC4NCj4+IEkgbWVhbnQgdGhhdCBYZW4gd29uJ3QgYWxsb3cgcmVz
ZXR0aW5nIElOVHggaWYgaXQgaXMgbm90IHBvc3NpYmxlDQo+PiBkdWUgdG8gTVNJL01TSS1YDQo+
Pg0KPj4gQW55d2F5cywgSSB0aGluayBzcXVhc2hpbmcgd2lsbCBiZSBhIGdvb2QgaWRlYSB0byBo
YXZlIHRoZSByZWxldmFudA0KPj4gZnVuY3Rpb25hbGl0eSBpbiBhIHNpbmdsZSBjaGFuZ2Ugc2V0
LiBXaWxsIHRoaXMgd29yayBmb3IgeW91Pw0KPiBJdCBtaWdodCB3b3JrLCBidXQgSSdkIHByZWZl
ciB0aGluZ3Mgd2hpY2ggY2FuIHNlbnNpYmx5IGJlIHNlcGFyYXRlIHRvDQo+IHJlbWFpbiBzZXBh
cmF0ZS4NCk9rLCB0d28gcGF0Y2hlcw0KPiBKYW4NCj4NCg==

