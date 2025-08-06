Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEBB1BF61
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 05:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071100.1434645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUzs-0006W7-V4; Wed, 06 Aug 2025 03:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071100.1434645; Wed, 06 Aug 2025 03:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujUzs-0006Ug-SO; Wed, 06 Aug 2025 03:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1071100;
 Wed, 06 Aug 2025 03:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOQm=2S=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ujUzr-0006T3-1S
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 03:39:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efab2b3c-7276-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 05:39:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Wed, 6 Aug
 2025 03:39:14 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 03:39:14 +0000
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
X-Inumbo-ID: efab2b3c-7276-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmwgJq/XI6qKJbaZ0kP7iZ/dQfLg476lisouKHRSkHN6jrHP1kMOFIegb8bYuqtXW03BZ5ro5mbZKSFpEdXKlSLJrA/nNwxGEN2qpW6j8Cyk6zmQkLbTCjWLLwaiEM7rBZmbSic9aOXD0dRxM3VhE+Tmh5wMgQmHtSOO+hvbpniqGYqJFW9TdH7Ft2fL7vx0ZkutQOOfddY/PXawL5foinrZI6mpgWEZ1l0MTd/2S/UkLyUL0NCq3VRnfOP24tq0iqiuOTIrl0M3FkqoVFe8d6AVACaGAVlZnwjUHroxIkmnsLV0Zr8VJeWmBfx6sKLEt1CqLDBGaPlujGbNfFDIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLkmqVTfKVZJZB5yp+5RloWood+UEHnFL3yzWi//LvM=;
 b=gzI+djsJjn/tKxlvtt+PlqWUcXwHaBepo6Ehhv1/HuWIaDKlHz25d+KNOyLftafFEB/tWjFsLbEOsUH3aqLKnTzDhLAsO7DbZ/iyh7kiEgPxK/CB/PqmgQgwK451slFD1prwJkIguaCvGWVSLGeJf8Xb85I0xGgdkgnnqFvzj5eettMDjmAxMNoJ62NahBuGxPv0GdEIlY1L2sag9iUdiCDUxTH7uf4MmkNNw3shuO3Ws/ypgmo6BQ15R1PVAHC4FlC2GcQlGTwy/VmqNQA17kCuamggPT2PcRXy0EGpPFUC27QbuzOG+LdRtSDRMVKkBHgsJNzF8GvlvRLDnUFpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLkmqVTfKVZJZB5yp+5RloWood+UEHnFL3yzWi//LvM=;
 b=36ROVVcaLYC1TTT1GqmYMK7c90cTrc0Gy83bV6V23KX9xf2N+zZsuGr9pBoqtbuiRJipRDgqAJGZ9Pf4hc85hJFiZxFazBEPYHDShU26mbO2xE/5OLNp1yIly0OEb2rroP/eovzD/YlY2edXD0R2M8/TL684AWIgAlW9USBETbY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v10 2/4] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Thread-Topic: [PATCH v10 2/4] vpci/rebar: Free Rebar resources when
 init_rebar() fails
Thread-Index: AQHcBbvxdj1/OHisv0yt2jqXoA238rRTv+0AgAHBO4A=
Date: Wed, 6 Aug 2025 03:39:14 +0000
Message-ID:
 <BL1PR12MB5849A83162C8B4B2AD11E45CE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-3-Jiqian.Chen@amd.com>
 <a14449dd-a7dd-4369-9e73-656442b36f2a@suse.com>
In-Reply-To: <a14449dd-a7dd-4369-9e73-656442b36f2a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8989.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ5PPFE4FC9FAB3:EE_
x-ms-office365-filtering-correlation-id: 1eef808b-cc92-4642-206c-08ddd49ad092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S3djdTFENlJmWE9YS0dtdjdTVGRiTG1vWDJrdTFEY2t3TlA5Uk1NU0N5N1RE?=
 =?utf-8?B?d2VncnRWaEptRDBMZFB5THFwd3Y5d1h1bHRJK3VVSGxjdVJJK3ZjNEJPQmhx?=
 =?utf-8?B?VnFORWI0Y2R2ZmZUUXhFYWJaazFVZVIwL1VZcmN6ZnFuVFZTUEk4Um5jY0Fp?=
 =?utf-8?B?MURqT2lJTmNJd3k4MXV2QkdVaU5zU0ZTcHZEVHRtVFNTelZUZ21SVCsxZHNm?=
 =?utf-8?B?SkNqMXpTOUJrcDRnVGt1MC9kTm9pa0RzMVp0OTVUbi9nTWsySG1OaW1rbmJE?=
 =?utf-8?B?RU1oaElYVG96WGJBTW1hTERDeFd1bWxNRDhUZ3JncXZYSzNFN3MvaWk1cEZK?=
 =?utf-8?B?dVpKaUdjOCtMaHB2MUpSY0NJeW50S21MQWZQRTVlSVdXNVl1VFVDMytBbzNI?=
 =?utf-8?B?ZVRPMXdmY3cwVEk2OER0R2hmUnlTdTFzMGp1ekJ6bmdwM2N0aEpxQXdrVXBw?=
 =?utf-8?B?dzZ5ZUVQRFZPRDcvRXBtTTdpS0d6VnlsVitvYlhuWVhyU0pnVjhUTURZaHNS?=
 =?utf-8?B?TFpUUm5Ga21vbzhPVktlRlE2VzRxTmJoY2VEY3BVMDJvcW45WVgwKzJ3SjNq?=
 =?utf-8?B?QUwxbFBnc0RkOXQ1VDIzd2hkZWlobkl0QVJxYW5obSt2NUJYTklXcm1xOTdJ?=
 =?utf-8?B?R0xlWUhqM3lrQVNGMkxSTlNSU3pkVTBDc3oxWEx3cnVSVllhdmltMHpxQTVZ?=
 =?utf-8?B?eENBS00vZGk0ZWMzTWpKbEVIZEl4SGpjMFl4eTlvZ01ObnQ3Z3p0OWNYakNl?=
 =?utf-8?B?M3U2VGtxWExlN2xGUmRpc05DT0VZeGZ3VVVDUUtHR2R5NUxzWCtFRWJpN2tZ?=
 =?utf-8?B?WE0wWHA1aUZMQnVXUkhsZE9samZDSDlSZlZMa0NFc040UFE1blN3U1N1KzVI?=
 =?utf-8?B?eVE1RTBwYlViWklXcEJsdjBhTFdXU1p1c1A2VHNVR1dKbTl5ZlVjSEpDd1Fv?=
 =?utf-8?B?Y0VJTU1VTzV0eTd4Y0lpL1lFWW9VM3VLMDRnTSt1QldXQkliMy80WGhyNVpL?=
 =?utf-8?B?cHdsZ0NMeHFoZ3pwa25wZUZFZkxrV0pzcHVLWWFicXFIelZ5NUJZdHZxa3Vt?=
 =?utf-8?B?cWpOUmVtZjM0M0NFN0FjdTNFR0plbThwMUhwZmlkM1RRUDE2SUFNNTVLM1NZ?=
 =?utf-8?B?eUhWL25vUnloZWgzb0I5VzBZLzhTUW5KN3BSN056djBGNjRicDI2QmhBc3ZK?=
 =?utf-8?B?Zlk5anRucXJ5NURCTEd6V1ZzZmprcU1ycHgvZGkwaytpcXZkWVhxSHd0ckxG?=
 =?utf-8?B?ZHJPdThGeDhHbG9vRXg3ZmgzSytpSFM0QWRIWCs0cFYxRFZYYS85UzM4cHZ5?=
 =?utf-8?B?clNXWE4wb3JLdWRYT0trWEhJUi9KdkUwZEVubDRaUC8xbmZrS044ZWJyZGMv?=
 =?utf-8?B?TG9WZ2d6VzBsSEtlUHlLRHJ4NkVwUTBYTVZOYzlISFlwN0wxVWpMM3E4SkJP?=
 =?utf-8?B?V3czNEVHTTRQNmRJcHMyV0RrenRDUDF5OHc3dG4zSEV2ZWgyV2sxSkNvRTd0?=
 =?utf-8?B?TldtOXkwQm9FazRkb0NYWmdNZktRRjMrSUFUdFd4cXhZMlUvVy9FWnFNNEsy?=
 =?utf-8?B?NHhMVENuMjAybDVxN3BIQ1FPcFRQYjVsNS9uUUt4R20wazRYOS9Genlra21H?=
 =?utf-8?B?WFZRVGxTZmg0UmNiek5MT2NzYmxia0JBSGdMOWg5U2lqdFl2bUY4WUtma1FJ?=
 =?utf-8?B?a200OGxDZmFoVEFUMVk4K1hkOFJOMHpBQUNOMUlTN1N3Z0VlSE5kei9jcDVJ?=
 =?utf-8?B?d0lVU1JTMFUwWEFCZEU2bUxqTEZmK2xKY1Zzajg1WHhIMERsRWVYaUlFcU0z?=
 =?utf-8?B?Z3VNQ3NCUkgxMFRVUVpObktKNHRubWJzTVpyN2lKdmxES0ZDTVZoUHU5Tmht?=
 =?utf-8?B?VTBvRzJoazZmZFhIUFR4OHcyaGNRT2lveXNBZ244blhZUUR6MU9NaFVSTHVI?=
 =?utf-8?B?R3lnOTNYdm5IZFV1Q1NUb0EzbUFURFJRSW54V0ZLbjVIQVcyRExvcEhUWnN4?=
 =?utf-8?Q?lgtVqti6KRdt7TohKn5B2dJ514Stsw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U05LWXZyN29PWjRFZisxY1NTNENlbUd6OHdCam1GTGdXeGJJTnkreldkNGFz?=
 =?utf-8?B?VTUrQWt1am9uWDJCbzBPVEpKRzQ0MkhPcy9sV09xWGhGcHpRRHNHSUJBRTYy?=
 =?utf-8?B?NG96aDNDUmRxT3dHc1dlYXl5Y3JwWnpyZFRWRmZGZEx6aEh6bUdiSTZNWlZG?=
 =?utf-8?B?d3NHWVV2RjBzZklMSThnTVdPeWtSbVBIRFI1STc5SnJlbWVyNDd1d0dGb1Iz?=
 =?utf-8?B?MFY4WXQ4TnRoQktqTmpieTcydHJMVmxtbS9VMnV5RDlOdmo3eElRUkRua3hl?=
 =?utf-8?B?bFE2N0NHcDRLNmpVMEFaTWhheW1HOS9jZDM4WmdYVVUwN0FVYk1aVDhrQVFu?=
 =?utf-8?B?QlJhVTNnNWdCTWFONXpMTkZxSFBZODRwWEdmeEVMYnY5RVZGSHlnTC94a3d4?=
 =?utf-8?B?dE5CZWlKK3ZCV1JGSlRiYldYNDhZem9OS0wzcWN6dytzM3FMZ2xzK280ak0y?=
 =?utf-8?B?Z1BBYnJKd2pXbnZkNXEwOHZpSWY0U3BEbW4wM2ZlZEZsc0k0NldmN0NLeGJ5?=
 =?utf-8?B?Rk1UOU92aHNpRVFFYlpXUXN0b1NYV29XMlhab1Y5aFhOZXdIQWc3SXlVbTFW?=
 =?utf-8?B?OEovT0MrdzBkeFpYdjlicWFLd29yU3JIY2xJQWZYMVZwcnNoT1M1cmtQUFkr?=
 =?utf-8?B?ZXdudVFsMml6QVN6dEw2YzAxWTNHQ2d4Rks2dmNyOVYwR3IvMXI5N3QwOEY5?=
 =?utf-8?B?QVpOZTU3MnNiZFFzdCtRdzBoaTRGQmVlcndxck1vNFdOZitzTzdMaUlwSUpD?=
 =?utf-8?B?QUFNUWJhT0xvQ3lldkxzeHdNV2x4S25pamNnRCt2clJ0Z3EwRFdPV1JMQlc5?=
 =?utf-8?B?Sm5lQ1RBM05IKzREZ0E2blJHMkdnOERDSWJUOEZGZnl5NCtqdFhkZHJ5RC9K?=
 =?utf-8?B?Q2tLeURWU2xFSkRLSnNxNmFnd3JCTzlHWm9tUGdaVlp0bHhmcmNIa21BOXpO?=
 =?utf-8?B?c2ZXcnFUYWNGUGlIMTRPYXMxazRScG9SOHg1bVFqZnc1T2tMd2pPU2VleUVu?=
 =?utf-8?B?dkJpZWlXbnJXSFUxY3lURnk4QllsMW5zSDQ0OUs3TWFoNE9FbUhhNTRNV0tO?=
 =?utf-8?B?dVo5MzJJMlhCNWlxSjBZaCt5dDdndDJpenRNN3NPTmYxM3hZMmhTZU1idjVQ?=
 =?utf-8?B?Ty85NWtBVlFRRDdJcHpobVVFWmZ6ZnFZZE1ZTHlEcWhHWFZOSkNjOGtyb3Qr?=
 =?utf-8?B?YjVIWnVvM25VNjJqRGFvbno1YUgwOVFIbDJ3YjZyUUZhbDkxSUNoWUpnWURl?=
 =?utf-8?B?QTdtZGtrdjFRbGlvY2YrbkZGeUtWQUlGVkE5VWJOZXd1Yk9DSWZJcWhDWUNM?=
 =?utf-8?B?WUtXbWhnVm5aSGRiRlB6TnNPem1RNGkvaHpxWWdKNGpneGQ2VGk1QUh5MlpQ?=
 =?utf-8?B?ZE04WnNwMXBhTmlYYjBiK2orTnV1Tm1vYnV4OWpPaWJzcURSOVNBd0VwVVNm?=
 =?utf-8?B?aTRvN21KRlV6RExLS0RoVlNHbURzcFRPbjUzQXVOOStwNERoTHBSWUxnb2JH?=
 =?utf-8?B?VGY4Z05Fc1FLdytNbGRVV3drMWxaK1pzTlNSQUhwak5ackpiTkFUZ2RMSzBi?=
 =?utf-8?B?MlY3c0I0RU84aWZTTkRxYVd3UitWa2RqR1ZIRFYzVmtpcGh3bnZGeWNmbGNW?=
 =?utf-8?B?ZDZuOUU5MGRubkV2RFJQdGxYM2RaWG5sNzMzQy9aYStscFlaeGJveXJVdVl3?=
 =?utf-8?B?Snd4b0xRT3hDZmV0U0R4M2pKMlNzdDlIQURlcHZIbEtQd0UrcS81VFhEdHFp?=
 =?utf-8?B?OHlVaEl3VWNta0VVOEpOdXdRdENzbGdSa0wvZ28wYllteGtMTEFKeGpzMjlX?=
 =?utf-8?B?UHBnS1ZGYkNLY255Sjd2b2ZiMXJRNUpUQ2F1eW1pNmxPNzJ1SG5UWWp5aS9h?=
 =?utf-8?B?WGZkQzh1Njk4VHFCZWxHVkI4SGlrNjJ5cjNlVWNMQjI2cDMwZVdBdjZoWC9V?=
 =?utf-8?B?SUpWUnZseVEwQ1dRRDBOeU9hKzYvWlRVc3k0YktYYUw3V1BVU014UjZob3Iy?=
 =?utf-8?B?RHVBdk5iUTBsSmRyT251S3hpL0dzTVVPWkY4YkVDZlZFZWFlZnpjWmQwdWFQ?=
 =?utf-8?B?WVdWUllLQVNRbUFoWEordWRISC9YS2xqdXBBSnQ0QjN3c1RESGxYQ2RjN2dv?=
 =?utf-8?Q?HzW0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69BC010C2C3CE14B815346F26FA9C342@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eef808b-cc92-4642-206c-08ddd49ad092
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 03:39:14.5450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAgE0xrtPT0IgkBQymSp7v8K5Itsb8/6SXP2VNj24UbICJQXj9sJ1AUN5ydu33oSYhjpQHuU6qCLBP1SJO0T/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3

T24gMjAyNS84LzUgMTY6NDgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI1IDA1
OjQ5LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvcmViYXIu
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiBAQCAtNDksNiArNDksMzIg
QEAgc3RhdGljIHZvaWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25zdCBzdHJ1Y3QgcGNp
X2RldiAqcGRldiwNCj4+ICAgICAgYmFyLT5ndWVzdF9hZGRyID0gYmFyLT5hZGRyOw0KPj4gIH0N
Cj4+ICANCj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfcmViYXIoY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICBpbnQgcmM7DQo+PiArICAgIHVpbnQzMl90
IGN0cmw7DQo+PiArICAgIHVuc2lnbmVkIGludCBuYmFyczsNCj4+ICsgICAgdW5zaWduZWQgaW50
IHJlYmFyX29mZnNldCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQ
Q0lfRVhUX0NBUF9JRF9SRUJBUik7DQo+PiArDQo+PiArICAgIGlmICggIXJlYmFyX29mZnNldCB8
fCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4gKyAgICB7DQo+PiArICAg
ICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4gKyAg
ICB9DQo+PiArDQo+PiArICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmVi
YXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwoMCkpOw0KPj4gKyAgICBuYmFycyA9IE1BU0tfRVhU
UihjdHJsLCBQQ0lfUkVCQVJfQ1RSTF9OQkFSX01BU0spOw0KPj4gKw0KPj4gKyAgICByYyA9IHZw
Y2lfcmVtb3ZlX3JlZ2lzdGVycyhwZGV2LT52cGNpLCByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJf
Q0FQKDApLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfUkVCQVJfQ1RS
TChuYmFycyAtIDEpKTsNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiAiJXBkICVwcDogZmFpbCB0byByZW1vdmUgUmViYXIgaGFuZGxlcnMgcmM9JWRcbiIs
DQo+PiArICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPiAN
Cj4gTVNJIGFuZCBNU0ktWCAobm93KSBoYXZlIEFTU0VSVF9VTlJFQUNIQUJMRSgpIG9uIHRoZWly
IHJlc3BlY3RpdmUgcGF0aHMuIElzDQo+IHRoZXJlIGEgcmVhc29uIHRoaXMgc2hvdWxkbid0IGJl
IGRvbmUgaGVyZSBhcyB3ZWxsPw0KV2lsbCBhZGQuDQoNCj4gDQo+IE1TSSBhbmQgTVNJLVggZnVy
dGhlciBoYXZlIGFub3RoZXIgYWRkLXJlZ2lzdGVyIGJlbG93IGhlcmUsIHRvIGVuc3VyZSB0aGUN
Cj4gY29udHJvbCByZWdpc3RlciBjYW5ub3QgYmUgd3JpdHRlbi4gQWdhaW4gLSBpcyB0aGVyZSBh
IHJlYXNvbiB0aGUgc2FtZQ0KPiBzaG91bGRuJ3QgYmUgZG9uZSBoZXJlPyAoSWYgc28sIEkgdGhp
bmsgdGhpcyBtYXkgd2FudCBwdXR0aW5nIGluIGEgY29tbWVudC4pDQpTaW5jZSBleHRlbmRlZCBj
YXBhYmlsaXRpZXMgYXJlIG9ubHkgZXhwb3NlZCB0byBkb20wLCBhbmQgZG9tMCBoYXMgbm8gbGlt
aXRhdGlvbnMgdG8gYWNjZXNzIGRldmljZXMuDQpJdCBzaW5jZSB0aGVyZSBpcyBub3QgbXVjaCBw
b2ludCBpbiBhZGRpbmcgc3VjaCBhIGhhbmRsZXIgZm9yIHJlYmFyLg0KDQo+IA0KPiBKYW4NCg0K
LS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

