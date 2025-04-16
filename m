Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88888A8AE4E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 04:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954790.1348753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ss5-00072P-EZ; Wed, 16 Apr 2025 02:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954790.1348753; Wed, 16 Apr 2025 02:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ss5-0006ze-Bu; Wed, 16 Apr 2025 02:51:29 +0000
Received: by outflank-mailman (input) for mailman id 954790;
 Wed, 16 Apr 2025 02:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2j5z=XC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4ss4-0006zY-HS
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 02:51:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad412fcf-1a6d-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 04:51:22 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Wed, 16 Apr
 2025 02:51:18 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8655.022; Wed, 16 Apr 2025
 02:51:18 +0000
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
X-Inumbo-ID: ad412fcf-1a6d-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j68GXVd3gC42CBwXrV0Jb/NKOiBOdx7C3hmUvpmbrcj5qAVsofW7vexMf68GbtKVSSFH9loruiVTSk3W8b5tLDe8fQAAe4IZtRD9JKDrGQF81Ruzj2Cq+0494OYXFBs3HSrdOkZHDV2NS33JqMUzJ7qrwrinX9N6NIuSDRiEXYXWk3Ld9fMu7Sz6XZE0QrqbXdCoJtQVnMAqt7t6iufPEHMNZPdxwp9NL4XfSvTOAcykDGKWTufQrngBISE3ESk1l+Aa2xvTvToQ3Nz+FQ2jXebzATo/Su6UUfykARu6bzr26Kvh5yKSqy7MjNy1IX40FtrfIMYa0k7Ui/KFzf3grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3UXqsuCsDLcKENbSxacyCOs0J5BUmClCDY4I/P3Ezw=;
 b=imhiAFvnPpj4Oat0mcaC19GG9q8Zd0ob1eEMsK7SfdBAormp4M42Xapm/8UujKRBhgFAfg6Qo0pcndIW/DJiwhGdafdJur5HPc+kz8FFvWKhQfZHnC5O8K7wCWy6VBT82vAfh8n/mZGJavt68O91HIyoNru1Q+kyulX+ww7XIe0X61xNJhvb3OfLWbFRY+uTwuKsQPlWhX5k5cCmswrQq1rZndIqz33XC2Ur1ooFrYJHxTmcTR7wgm0oMHc2aCn/zpxKoZrvlkPrJ0f3PomO0Zr64MKPWou2Cl63f8VusIn/+doEZh+Y8IeShOsElyV0wsoWibdek1tX9D+b0wg9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3UXqsuCsDLcKENbSxacyCOs0J5BUmClCDY4I/P3Ezw=;
 b=CcdKHRBacEIt53+CXk9CKjws2tUWGg9cVm2AifKPDb8JObKlraK/Tyi5SfoW1WdmosgTypIVsIvJg608E91ZUYtLs1wa9dqxRQP4Aw+MY++DBYlvPb4jbxwH03h7ixvWieWbSFbM9SDreYmRAHhQlU0QBrS83Jv/WsOVVSc5Ips=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Topic: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Index: AQHbqRsaTINnyZcO4ESL6xMBZUfUtLOkiv4AgAGc7AA=
Date: Wed, 16 Apr 2025 02:51:18 +0000
Message-ID:
 <BL1PR12MB58493D18F9F533FE3D928607E7BD2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com> <Z_4wkFn1VvBe_6Eh@macbook.lan>
In-Reply-To: <Z_4wkFn1VvBe_6Eh@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8655.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB5687:EE_
x-ms-office365-filtering-correlation-id: 3b8fa404-85f9-4fea-1c83-08dd7c918fdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWxTWVlsUlN2aHQrMUdLZHNMNHVGb3gzUXdZclZJZTRwNTNXcVJTSHRkajk5?=
 =?utf-8?B?cXZ1WWJlUlRVd2N5QXkydDgvdnRDZ3RHa00xVTlOSlRjVlFpS29xdHAvNGIv?=
 =?utf-8?B?dVZEQk5DMkVVTWp5cGxvMEFxTFdSenY3b0tIMG54dnR5dWpPNTFFNlVJY0h6?=
 =?utf-8?B?K3p0VG0veEtIcXRnc0NGeW5LR1hWeWh2dTNhTU1IcnhXaFg1WVhtOVc1L0dW?=
 =?utf-8?B?UlNSRlhkRTUvVnB2UmtKNlM0TldiclpLTW5ORW9nYzdFUkFtOEpsQlBzNDJD?=
 =?utf-8?B?MC9WcVVrbmRVMExrcjdNRFdpdC9sRjhEbUw2UVNHb2hyMHBXbjhiVnRvZW5u?=
 =?utf-8?B?YUttZWZNZHEydzZ1c3FPUysrT3NDTHpDN29oTHNvMlltL3dudkJoOXhzYmQ2?=
 =?utf-8?B?cXJ4MTVzUUlEUEZ5TEN3WXg3dEJWaW1rbjh6TW01ckNNQkg5Qmo4KytUVDNz?=
 =?utf-8?B?KzdnQmY3RTRRYUo1SDhKY2cvNWF0TnlvWHlKU3ZOVTNMSmh5Q2EwRE15OGlZ?=
 =?utf-8?B?UDN3R0tWZ3Q2WU8rSVhXYUZqdWtkRjg0VUJ5VjNsR214bU5NTGp0TVpjNGQ0?=
 =?utf-8?B?TXVnT3Q5V2ltRDY2YnRFUndmc2JtS0hrUmJRaFhvSi90VFBQdjVJNjhkME4w?=
 =?utf-8?B?bHZKMEg5eXNCOVdUc0Z1aE91bFhqU081VWxpV2ljeE1KeDJXYUlqSWtmc0tm?=
 =?utf-8?B?QWhmcWoxY05YSW0xS0tSWXVnQXFtUWxTL3VUeEd5Y0tuTjE0amk4a0pkbTMv?=
 =?utf-8?B?UnpFRm1adU5OR1JSUU1kNUxVSG5naVJMMGpFUCtXYnlzZUN5WXJiRHY1UFFv?=
 =?utf-8?B?UkY3RVFwL0lGT0k4V1ZETW92UHNiT0lTbUFRRENKbm51bkMxZmtBQVBEeklt?=
 =?utf-8?B?UVJpY2lMMjUrTjNGcStROGQwZmZiV0JCZngvNVNaOVExRmJFeFcyTGhNUCt1?=
 =?utf-8?B?WFU5eGdpeGRtNG5GeFZLNWZURjZxNDlvYmVFck80REVOUGZRdmNtYTExNHow?=
 =?utf-8?B?L05QYmI4OHdtTjV6aXlabWJKVy9zRDRmRzBNQzlzbVZTR0R4UXJEQUFvR1Uz?=
 =?utf-8?B?NkswbkNKSkw3SHJvUEJzZU1HdjZZZlFUb1NhWGVpcE5SVnltNUZ3SnJib2ta?=
 =?utf-8?B?RUJpeEo3enlpalNkWGczNnFNbGszQzJQTkIramtWM0F6VnBzdFlZZ085ZUZP?=
 =?utf-8?B?MkZad2ZSTzZYNU9TTzVyTGdXS2hpbWtjNDlwVDBibmtWNTRueUlTeTFiNERF?=
 =?utf-8?B?RkNKbEpQeGw3SXRXZjUyZGxYalFVbllrZXpVYzFNMSt3MzVzRkxWOUtEbHhv?=
 =?utf-8?B?MTNhMUMwY09DQjN2TVdSWk1QaUJpdjNrM2M2Ymg5eTVwQ0tvY3ZIbFJoTVJx?=
 =?utf-8?B?di9TcUpKeGN0TmRQQWRjRmRoVzZDOXNhTEdKTDhIVWNQZGZyVnBKQzhQVkxh?=
 =?utf-8?B?akJ1am5oM3VJczdzYWtVN2t0Um0xTXFya0dESHc5T3JJUWEveUIxMGo5TmV6?=
 =?utf-8?B?T0VrcHZ5YSs2bEFQalFGcGlKSG54ZENnNUk5ZXpXdUZmNUVjRFdZSEkwNjQv?=
 =?utf-8?B?T2hhNnBTbkxPdkZBK3BxK1BPdUhZWmNIM2llUUllSWp3T1U3dFZkbmFTV1F5?=
 =?utf-8?B?WXR0WFpnTWo5VlFqTnNrdy9ZWVpzMTFud21WTkxodUs0aEY0U0cxQ0UyeHl2?=
 =?utf-8?B?VWo5d09xUHlIbG56cWZsSEJKYWt1a3NYL1poQU5IZ3AzWnFyS3V4VG94RHlK?=
 =?utf-8?B?ak9Ua0xqallzVTVYVHFsRkFEVHllQ1RoQ2p5NURPdEl4WHJLRzdPc09CNTZJ?=
 =?utf-8?B?ZEVuN3B0Vmhwb0FOdUZFMlZCMlZXNm01V3ZjVitYY3lWdWdkWXlRQ2dmM29s?=
 =?utf-8?B?aE5ZaFVOQy93UDgrMTNmaWZ2WUxwa2FlcGZ0NzNObXY3Q0RNUDM3QVU3MHpm?=
 =?utf-8?B?Zjc4YlQxSnVYVnBQc1lLK3Izayt4OWFnMTRETVpNRDhoYWpBQnkrQkZTWS9E?=
 =?utf-8?B?U2Y2WkdUMW9RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjJWRU9yQWJtbVBib21yM1o4SFo5REhUOWZIcTVCMCtsbk8yWTJENVFEZHFo?=
 =?utf-8?B?N0JRZTlneWttY29HVEVocVlpSXRwcFF6ayszS25hZWY1YitydkNiVzd0cFl3?=
 =?utf-8?B?VWNiSG5IUE1YNzlpdVI0Y2U3OE42NFZjS2M3NE54QXl2cFNiRFdWc2VyQXlU?=
 =?utf-8?B?UTlvVWRkTkZlRG9rN3p2dC8yS2hERUE2dUwrdjVGSnAram1OUkFtV2xnWTFx?=
 =?utf-8?B?bDlibFhoclVqaFVBL2VjeFY0MHQ2Y0Y1QzJUci9ydnc5dGdTZXhua2M5RG1o?=
 =?utf-8?B?T3JXUnduTWZkbE9vUFVCLzRFZXBlSVdLTnhHQWNHcU9KVktjQnRDN0VkbzBX?=
 =?utf-8?B?bHdPU3lxTFZvOUJ3SW5iTXFYZUlITDdDazN0YjFQSTFRRU41dnhnNlVmZFo5?=
 =?utf-8?B?bDJRYzRFSlBqRDc1ZXdiOVNHSjVqLytDK0pXNWhYYVFYd29lTStXYTNWK0JU?=
 =?utf-8?B?MnJUbHo0MFE4OTd4SVFVTTAvTDcrRkdkMXVSaDZtY1c5WFZEdEVlUFBUZytk?=
 =?utf-8?B?OXd6OWRWWWE2WWgxNWlNbmR5RmFpaG9YTHM4Mjhvc0FWdDVwOFAvcE5Ra2ZB?=
 =?utf-8?B?ZVJCdmFWZi9jNjJEazFMMlhyaTBHbnpKZXN6ZC9UekxzdGt4RkZiTFZKcytU?=
 =?utf-8?B?alJwV1RmbHU3c3g1N3ZJdEpZemYxd2dXM2s1ZDRHeHlLZnNxWlBZUzNZOFQ4?=
 =?utf-8?B?NzZLOXkzbTllV0pXY1E4YjUzdi9PMFJ2UEdmWkxaU1FnUFoybldoa2JTamtl?=
 =?utf-8?B?d3lBMTU5dWExZmlSN3hnaktXcFZkOUtIVDBUVDgyMnNyTUJncE1kZ0E2eFRU?=
 =?utf-8?B?N3lDK2VCSUk3QnpGdTEvclJTbTVoaFJiTFViWEUyOE9mczJYbVFvWU5CR0dt?=
 =?utf-8?B?K1kwNmhCUmpKaHhwZ2JMVndSY1BLTXBKSUZFczRrVjk5akRTU0pxcE01SWlv?=
 =?utf-8?B?UE8wK1lhN1NMZHhMVzlWcWU1am1ZTFRWMWZhaitpV0VIL21HN3EraEVac3lN?=
 =?utf-8?B?NXJjdGVoWk5ESThrakxzazFseHh6Vm9WSnVRbkhOVXlMTEVRc1dQOS91bFpx?=
 =?utf-8?B?NGRqWGRmUkxzMHJINWlDbG4zbUo1TnlHeG1IWDQ2V1NaYVNjVk5RcmtORkVv?=
 =?utf-8?B?MkIyVmJXaWNDZEtkM041eEhpQlVrc1R5QXhiVkwwU3JHTEwyU3ZnNkhMa2xG?=
 =?utf-8?B?WlNjY2Q0TGhSRjJ5MjFZTXJrME5mbDUrdVM1MXZTNUVOQlhEbHVuMWk1WVRr?=
 =?utf-8?B?ejFLTFErMElrVDJoU1BTZnpsRGw3NXhXUWNEaU9HQzB4ZElVOGJOWlZUZGR1?=
 =?utf-8?B?M00xNEE5anYzdmRHMDB5N1YxakIwNWdhRythcjJFVXJYenM1ZWVxU09qOWg2?=
 =?utf-8?B?ZXhHNWREOTNpVGVIeXZRVWcyMERHdVIydmducUlJWHJweW96WFhSUEl1TFVq?=
 =?utf-8?B?Qm9RNENLdk40U2VkdE56VEsxa1ZDK2ZrWWc0Vmtla1U1M2MzTzU3blpUNHdW?=
 =?utf-8?B?M0E5bnh0a1Y4VW81U21qM2xqVUJIeGNiWXNGZmpKdHdWZExzcFlqdENrWUlY?=
 =?utf-8?B?WlpJM1JwcDZQZks4Mjh5SHdGY3BGa2RIRTZZMDJ5azZTRXV5MU5iWGM4dU1J?=
 =?utf-8?B?K2E5a0JJcWFCY1B0dmJQWG1yQzlZY1kzTVlENmhrNHd3Z2RzaGVJZWxteXZR?=
 =?utf-8?B?enVRVEF3ZzlFOVNhenNnQ0p5M2hxRWZ4MktEYkdueTQ0UitRQXFQMVdERUl0?=
 =?utf-8?B?RllaMFdGUjA2cjdGaWlRSXFrR0Zza2lUYnhLd0lkYU05WmNmWEdIUUVpOEhx?=
 =?utf-8?B?Y3RkemNxTGxDUEtTM21ZZTgyMDd5bDZqWDNGbU9SVnQvSWxvTDZtbnhHbXB0?=
 =?utf-8?B?Nk5za1Q2NjR2SEZPb2szb3ZEUkMwSkdDZkxwZmR4eHRvNjZPTnRhZHh4Z2p6?=
 =?utf-8?B?NU5OWnMranZJdm5Oa09nZzg4VVBDSHlPZzE3RkVESEhTYmVlSlNBM3F0b2hP?=
 =?utf-8?B?a3pzaU9BbHRzNkZiUGZROWsrNENSQUFxUkJHTkNtTkxpRlExRktrZ3MrTmtl?=
 =?utf-8?B?Y0lqQW8rN1F3Y0ZhQXJFUHo2MXgwejZiRCtZbnpjVzRYRy85cmE1Q1BqZEg3?=
 =?utf-8?Q?bsc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDD00D33080E4141B275B113150ECE51@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8fa404-85f9-4fea-1c83-08dd7c918fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 02:51:18.2050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uzIEb/uYEzVX9ZzZkElk1AQ4vKwla3uafzTvJMt43zcGT2qYo1DrEJy6nxDtiKWJQPpbKVudoQyG6Tb/5xFxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687

T24gMjAyNS80LzE1IDE4OjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyMlBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+ICsg
ICAgICAgIHdoaWxlICggbmV4dCAmJiB0dGwgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBwb3MgPSBuZXh0Ow0KPj4gKw0KPj4gKyAgICAgICAgICAgIG5leHQg
PSBwY2lfZmluZF9uZXh0X2NhcF90dGwocGRldi0+c2JkZiwgcG9zICsgUENJX0NBUF9MSVNUX05F
WFQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXBzLCBu
LCAmdHRsKTsNCj4+ICsNCj4+ICsgICAgICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBk
ZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDgsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQsIDEsIE5VTEwpOw0KPj4gKyAgICAg
ICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArDQo+
PiArICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX3Jl
YWRfdmFsLCBOVUxMLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9z
ICsgUENJX0NBUF9MSVNUX05FWFQsIDEsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAodm9pZCAqKSh1aW50cHRyX3QpbmV4dCk7DQo+PiArICAgICAgICAgICAgaWYgKCBy
YyApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAgICAgICAg
ICBuZXh0ICY9IH4zOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIC8q
IFV0aWxpemUgcnN2ZHBfbWFzayB0byBoaWRlIFBDSV9TVEFUVVNfQ0FQX0xJU1QgZnJvbSB0aGUg
Z3Vlc3QuICovDQo+PiArICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXJfbWFzayhwZGV2LT52cGNp
LCB2cGNpX2h3X3JlYWQxNiwgdnBjaV9od193cml0ZTE2LA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUENJX1NUQVRVUywgMiwgTlVMTCwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBDSV9TVEFUVVNfUk9fTUFTSyAmDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfihtYXNrX2NhcF9saXN0ID8gUENJX1NUQVRVU19DQVBfTElT
VCA6IDApLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRVU19S
VzFDX01BU0ssDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXNrX2NhcF9s
aXN0ID8gUENJX1NUQVRVU19DQVBfTElTVCA6IDAsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQ0lfU1RBVFVTX1JTVkRaX01BU0spOw0KPiANCj4gT25lIGZ1cnRoZXIgcmVt
YXJrIEkndmUgZm9yZ290IHRvIG1ha2Ugb24gdGhlIHByZXZpb3VzIHJlcGx5OiBJJ20NCj4gdW5z
dXJlIHdlIHdhbnQgdG8gZG8gdGhpcyBmb3IgZG9tMCwgYXMgd2UgaW4gZ2VuZXJhbCBhbGxvdyBk
b20wDQo+IHVuZmlsdGVyZWQgd3JpdGUgYWNjZXNzICh1bmxlc3MgaXQncyBmb3IgYWNjZXNzZXMg
bWVkaWF0ZWQgYnkgWGVuKS4NClRoaXMgcGFydCBpcyB0aGUgb3JpZ2luYWwgaW1wbGVtZW50YXRp
b24gYmVmb3JlIG15IHBhdGNoZXMuDQpJZiB5b3Ugd2FudCB0byByZXN0cmljdCB0aGlzIG9ubHkg
Zm9yIGRvbVVzLCBub3QgZm9yIGRvbTAuDQpJIHdpbGwgYWRkIGEgbmV3IGZpcnN0IHBhdGNoIHRv
IGRvIHRoYXQuDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0K
SmlxaWFuIENoZW4uDQo=

