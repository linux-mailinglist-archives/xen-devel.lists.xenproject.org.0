Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950AA5070D7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 16:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308210.523830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngp32-00072p-QB; Tue, 19 Apr 2022 14:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308210.523830; Tue, 19 Apr 2022 14:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngp32-000704-MJ; Tue, 19 Apr 2022 14:41:44 +0000
Received: by outflank-mailman (input) for mailman id 308210;
 Tue, 19 Apr 2022 14:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mThm=U5=citrix.com=prvs=101c57682=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ngp31-0006zy-MN
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 14:41:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3278937-bfee-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 16:41:42 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 10:41:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN7PR03MB3489.namprd03.prod.outlook.com (2603:10b6:406:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 14:41:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 14:41:36 +0000
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
X-Inumbo-ID: d3278937-bfee-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650379302;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gMo6hutR0hEBf7C2oenOjhDdkMMK41o9n0zrs/2QlOo=;
  b=OsXgW21Xpbumer1VdRwJI1eHfJf0HT9DRV7PRzw28AYmcN7QCrMa29T2
   5OIIA0JwSQnOSIwbKgYaMNKmy8N5jFq2HfyDs/cxibKy3M7orX6azvJwB
   LwVXP4fblNSRkNFVIi8ihKAgIvo19u/rglNyx/XRPqzSCNhp7j3V7gxxI
   Y=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 69433224
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SlOeVKCnsxoBPRVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApDJ21DBUn
 TBKDD+DbqveYTfxedtwPoXg9BgO7MLcndBqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jg09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhY0
 tRiqa3tSj4WFYH+2+c3WSB0PhpHaPguFL/veRBTsOS15mifKz7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t2B8mbEs0m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLWwE8wnP//ZfD277xjcqzqKwOd7vc9XRVelLkRemj
 zji4DGsav0dHJnFodafyVquifXIhjjTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDQ93wWRT+vXCFuwIHVsRZO+og4QqJx+zf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJd58G5+dliyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsjDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:BxtNH6HEqRRQfGf9pLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.90,272,1643691600"; 
   d="scan'208";a="69433224"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+OI25m5A3zf/8N2skojC+JZFQZDOq6lX6gZWxozpk/uaVTzivIwXqJFw19LBuMXPQR2lwUkcLPDF6rEvPQt2f5l5k3FLNfN0nd2uU/ewcFu1RaevuoyHmb+mvVcbPbWBZxPiyt6xx0chPdb/jwDN+uNU3XHysLlFRuM+mK8ktCP/rdgvkD3moLu32PoGwFwnL1s9dwzqJSwLKR63o3djFdzrTyujSyUg19hwFf4dHEr2kxTrxc2jzINS2k+pszmVahDcsvuuqwHptNOW9tTjIZ0kwPa3pDhJ6kmdDdsVBdM7ZpzYQyq3AYXjm0cW4HWKMGlIgVS6SimxuDNzz64RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMo6hutR0hEBf7C2oenOjhDdkMMK41o9n0zrs/2QlOo=;
 b=f0w236OCM7gvR71Bh9DakeSMVnk7KB2hnknbP+U4+rSswkNpsKwplzR51gLNeBFwFPIAW5paheJ9FXoJsllebydCMGOT+wpTkzuDyJULKb0kfUR8wcCW2kLL04B+yKuiPAROaw1Oq68iX2ExvEFoX8gkFv3XscbUmBLx/9V5zUNxZRBfki0aXMsWLGOUVQf+7I3v8qz4XAyyUcanAunYmP/g3vGnbZzjl4IhNZCtG1KU3/WvlH0u+eYOWg9Wm4ectMiR7+dYURKv/ouuLIMKR4gKfSJHie0X73e3Boq7fRk2vIWydovB33KU4z344KVDpjOwrbZcb4AxKUk6c7zPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMo6hutR0hEBf7C2oenOjhDdkMMK41o9n0zrs/2QlOo=;
 b=dPdTrvmaBH7eDxHiqfGgbePE6iDExe2hP4QJ3jUS8sf+bgz/xyVOH9XXYPlNY4EmAwNCKgKUFW2VOoGohH47uwkOleC2vQay6DfjPEwG0Yxg+nai/SQSUwa8kL1hxO49MdIEtys+7uN2pEv6kIN3WUJiV0yW2VRNs0KJYK7UBIA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 2/3] xen: cleanup gdbsx_guest_mem_io() call
Thread-Topic: [PATCH v3 2/3] xen: cleanup gdbsx_guest_mem_io() call
Thread-Index: AQHYU/TKb9uyvM67ckKrRx0R1hRAjqz3TzoA
Date: Tue, 19 Apr 2022 14:41:36 +0000
Message-ID: <41b47fc4-05dc-ae8a-262e-94513042adad@citrix.com>
References: <20220419135254.21729-1-jgross@suse.com>
 <20220419135254.21729-3-jgross@suse.com>
In-Reply-To: <20220419135254.21729-3-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e2c359f-9c40-466c-a271-08da2212b4d3
x-ms-traffictypediagnostic: BN7PR03MB3489:EE_
x-microsoft-antispam-prvs:
 <BN7PR03MB3489ACE5F37A99707F28791ABAF29@BN7PR03MB3489.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 S0TP9Iwy/HzqTjx9xpt/m5vF50BIL+JOE8I5ioZ8TyI/s8hoYl2eZhVP6wWHNJS80xPYfS7hbA7OndakBw98yVHVax/yTTivKP3oVmjAsxJZ+eXe5WZPjwxVoekFJNnk3XgXRS5tN0cXGK7ffqikP9dlgdSJ8guFZvWr6E7BtQtbbRCrjiKep5XEXJwTMi9VvxCtlpfnlCDr6WXv/lQJh/uBmpGCvOu7UKAcnoDmdUKfLY4/cUljnuWHn3kt0CCdmBGW4Lph0iPLuR8KgcJqpEiJbenxBtxUO2Tl2IPW+INlrsU5TpXhQ3daWuA1s29MIdzE5HqJW/ftjC1XmMTCvSNZeCAQuCE3UWKLRambLPzeFzicutlUAUxEk/kgtfgPPri7o7tv5EGop0ArMnngMcpU1cp4U45+6mWfHj3LakVcY8l0al1Dqqv6RC3khz5mGC1lV1+hVTidemr2awg3zDlD7bg/Va+sONT6yQi8C/+za+BnAugF0qc9TaamAGh2RrmK1wiElaV7P4dbC8Z5ya9ujVD/KZ0ERh7g/hWasTHwifDc77qTZXsMVaDrhQKLKEoZHOl6/3bRXVdpG2ISViazzlxD8qNZJYYEDLaWmq8Zy9jt1vozyZFmcDewiCjH6Mw/SwuX7kSTcseSzkGlopjReTb4me1gFi+Vit9QPorqOU0kwOko8WrMkaFClkii2Ubolol13B69WvOPlDp+BzyOWD0pDixhHNwoG9dtFD82x7s91xdXRajYCFAL5Hor3A5eUsKmzCmyQUh1oLSFlg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(186003)(26005)(66556008)(4326008)(36756003)(8676002)(110136005)(31686004)(86362001)(2616005)(8936002)(5660300002)(4744005)(82960400001)(31696002)(6512007)(122000001)(316002)(54906003)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(508600001)(6506007)(6486002)(38070700005)(38100700002)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1hLV295VDRQVElaQjB4SUcreVpVTlNmUnQyN2YwdjgzQUFuc0xSYmdFNGht?=
 =?utf-8?B?dlVNUTZtMkFyREtyMTk3Y1QydHhIeG52Z3QzNFc1dmZIK0p6SlpOVEd5Mk9I?=
 =?utf-8?B?U1V0Y1VHMkZnMG1IekJva2xMdEZiZHlMaWRTLzJwcG5EcWZRRENjWHNGdlkv?=
 =?utf-8?B?MmpzUS9qanFwU2RjenIyRzdWM1ZSajVoRUVJMElyZU1nY2hYb1dQcm5HN1Q3?=
 =?utf-8?B?YVNGaVpGQUU3dm1ZbDJqOE82djJNMEFlTEh4bS9iajBYMVA5VUViUmR5dTVS?=
 =?utf-8?B?ck9renFKcVNsUndaMnFzbkpHZ2hBc3UrOVJLZmMwV1Y2c2N5OVFmNGczc3lG?=
 =?utf-8?B?OGVLRGh4cWxkbUtzcjBWdG1lTDFKdU02ckhrS3g4UlR5MzkwSnhlRnJaOWxJ?=
 =?utf-8?B?bHp4UTB5YmVWUVU2R05manhHRy9UMXViM1BVYjQyVWdXSUltc3VDOXV1cG9V?=
 =?utf-8?B?SElSb3FFTVpabXcxRFA1UEVBREwvNWhmR3pnSUxhWFZmZ2JKLzF3eGhBSEZB?=
 =?utf-8?B?WWlDNG03YVFRUjB6ejZvYnV5aTZtR3FOZFhhdGpNS3FKa0NybVd0bGxhZWs4?=
 =?utf-8?B?N25CT09tNkxubjJVUWtqZ3ZoWDNPMkdNQVZWTTBMRmVnUjlSS0NsWTJJd3U2?=
 =?utf-8?B?TlQ2bXFaanF2RTRzWWZlYnZSL2FsQmJVcldhUHpqc2ZDUDRaUmhxT0Q0MUkx?=
 =?utf-8?B?Q0J5dWVYZzdXUkJtODBiQW5WVlpzeFQzQllFK3I1My9WQ3l5SDNuZUhaUktZ?=
 =?utf-8?B?anhpdjBPckQraTFLUHkvOURMWFA3T280VDZmaE9xVUVUcWJkU0Y2VHdlVVdk?=
 =?utf-8?B?MTZ4cGw2N0RYL1FvcjMxNmF0d2czTDdzNm9CV0pHbWRuVHNmQzI2MDRYMXYy?=
 =?utf-8?B?Z0VZdEt5alNUQzBNYVdGejRGZTkxRFhrdUhIdkV2RU5hNXN4NHRNeDlzbkRQ?=
 =?utf-8?B?aGNnbE5ybnhYWTUxRmUvN1U2TCt3M3JQTW44dnBNcm9tRTRwVjJlcW91Z0tl?=
 =?utf-8?B?OFNMQm5INU13M0JWOXdiTTMraytuSzVpeTExU2tmTnhJbk5HREIrNTZEbHRO?=
 =?utf-8?B?V2ZwR0s2YUFiR2tPcHNrVXhLc0dxayttUlAwZmRrUVc1SUZvOE5sdk1wWUhz?=
 =?utf-8?B?MGc4VEgvSnkvZjFTb2l4b3VIQnM2aGJGWCtSS1Q0VUZ5aEJXOEZHT29hOW1L?=
 =?utf-8?B?TWNkbzlsTXpzcVZjVUZPUm12VVVVSEdhUk1kcFNzTWFxd2lxZkl3V0IxeDI5?=
 =?utf-8?B?VTM0NlZqbzcrUzhKd1krczVmc2lNOGpBcW42aW91bFBhWkJHdDV2b0FSZFp6?=
 =?utf-8?B?RC9oNVpGTGs3dk1IQUEweW5NVmdRODR5OVRXUGVadm9jYjVzeU1qaWlvZFhD?=
 =?utf-8?B?Zk1XYXpjRll0K1hLMDZmZGl5Ni9lcTg0Y3Bua0ZzWDdNbXovUXI1SUdLOHJT?=
 =?utf-8?B?QUJjejJOK1NtVTVsWkd0QU4za0lULzcwczZwK2FibHpQOUI5cTNiWlpxMWNa?=
 =?utf-8?B?NE9PeVNBSmZrU2wrTFIwMm0zRHl1MTFaeWlzZ0NoN2toOEVJSmplUWQvV0c0?=
 =?utf-8?B?eGxsODNGZU1Uck9iR3lpYnRNaWNNNEhsbTl4NjgyUkJyRlhKUFlCUm5wbWta?=
 =?utf-8?B?RGhhdENMZ01kRHNSckNYOHp4b2NLUThZL2VHdDFpeWJqaGdKVkM0Q1pvWEFn?=
 =?utf-8?B?aW0ySE5CTDRTYXV0UEdhSXI4YlBYVDNwR2gwd24yalBNdXQ2QnZKQ1paOEtV?=
 =?utf-8?B?S1VyR0o2dUFVZ0FhRktQdklJUmlnOTVENUZuaTNZMHNOcTVrQTZRbFhRRkhQ?=
 =?utf-8?B?ajZhaHY1VU0rZ1krcGxYMEZVdEk3eGxBNmFCVTJ1SE5OVC8xWVRQU0daUVNp?=
 =?utf-8?B?UlBlWEpmb0FjYjFWbTZQUFhiWEUra3MxQ1lTWnQ3bHpPUllOd0pWTzB2K2xL?=
 =?utf-8?B?NFh5L0xGTVA4Y1k1ZGsyWnUrQ1NGSWIvTnM1VHo0RXpmTkxCVkRNMVMxTXQx?=
 =?utf-8?B?RDJxUGtsaXE0U09US1NuQkxhaDdQOVFwK2Nwb0UxRGlxSDJobHNhbVlGRkI3?=
 =?utf-8?B?QkZsR2JLK1U3ZE81bUhFVkJ2K2hUMmp5NWZkS0FtQWwycXgvblJOSGMwQWtz?=
 =?utf-8?B?UEc1ZVdNQjh5elBVY3h0WnBBRG0xd0EyZWpNek50dEpvbVJ1ejhHdkZLc0xF?=
 =?utf-8?B?eWZDWGNMQk5XdlJ1MjNoOE9EVi9acGc2QVkzRllPZGFweVd1Yjl1dnN4SEJi?=
 =?utf-8?B?amJFZ0lvR2hIWkxPeDcrbWhySFI0RVZuSm5ZY1plMkk0NWsySkY2UzY0dGpV?=
 =?utf-8?B?MTlpdlFORm1rVnVmSS84NUIvVXRZdldjVHJiUGNacUZhSWt0YUdnQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74F50357D23BE54EA0D7AD4D0ED38ADD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2c359f-9c40-466c-a271-08da2212b4d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 14:41:36.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqCvOW0hr/UNR9zVXOiEkyPCkFqtZy008UpAjaZmhmbOsSfNx5dqJ0RtpzU64Mx9SKiHhiHa5VSBzYDQfCoVhbO1djv4iU13vTWB9q3A30E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3489

T24gMTkvMDQvMjAyMiAxNDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gTW9kaWZ5IHRoZSBn
ZGJzeF9ndWVzdF9tZW1faW8oKSBpbnRlcmZhY2UgdG8gdGFrZSB0aGUgYWxyZWFkeSBrbm93bg0K
PiBkb21haW4gcG9pbnRlciBhcyBwYXJhbWV0ZXIgaW5zdGVhZCBvZiB0aGUgZG9taWQuIFRoaXMg
ZW5hYmxlcyB0bw0KPiByZW1vdmUgc29tZSBtb3JlIGNvZGUgZnVydGhlciBkb3duIHRoZSBjYWxs
IHRyZWUuDQo+DQo+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNClJl
dmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpJ
J2xsIHJlYmFzZSB0aGUgb3RoZXIgZGVidWdnZXIgY2xlYW51cCBvdmVyIHRoaXMuDQo=

