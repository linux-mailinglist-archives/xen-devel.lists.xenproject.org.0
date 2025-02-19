Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3ADA3B009
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 04:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892374.1301357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkan8-00025U-8P; Wed, 19 Feb 2025 03:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892374.1301357; Wed, 19 Feb 2025 03:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkan8-00022m-5U; Wed, 19 Feb 2025 03:30:30 +0000
Received: by outflank-mailman (input) for mailman id 892374;
 Wed, 19 Feb 2025 03:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODj2=VK=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkan6-00022g-HU
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 03:30:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabe7d9b-ee71-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 04:30:25 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB6718.namprd12.prod.outlook.com (2603:10b6:510:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 19 Feb
 2025 03:30:21 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 03:30:20 +0000
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
X-Inumbo-ID: dabe7d9b-ee71-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuxG6bJznJa7wnjm6P6liXObH3iay7iTo7SKghrLRUQOOok9AcOrruMlOtfFnbUXb0cjze8c8qs+jKjF0imVo6MQuhrg6J69wSUL7SPI7MAG+7qmcHOD7CGcsSvE+560WeZaPmyagDAdeHP+wDb0kBo5DCflhuCuIHt5eZNXckTvQd/lrbZTjYZV5XFg4u/9vE55QKFMvOb70o1Di5AplwKv0XHrZJPlYxq3reH5Fa7dnCGp1J+mMKZKplizgCOjI0SFhA5y0l2wIFznoAz3G3R2xCDWM+REnyksMU7JjYwFzHQYNfjkzTWPD0jF0hJ6OKXb7xiamJhp6j5f2yQTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V18Ie5zW2MezKi1pYgLDLVuxoWoWK/MMaIkC6LHFcXM=;
 b=HAGpSUYs3+fUn+SkqZE0dtQSG18lxkBzmWvx1L+J9/+zt9qUb/MSLbw1Bwq9QKDVGBSxqEs0+nnSJQ3h2EnXgaOgfKnsSqF+MswL4WjfrA7FLcvUdAPsg0el7AmfVPHlyaediGyctOESps6Cw4DQrwESJ0GZAh0C/crFNfqxjACieClyI1PgBteMgp55sKzsqIh7WFhLvKW2ntxwAKL2avqT1iXTYU5u60gncsKTSTypzaTBOaWLxlY3StMn9fJdSeFGuVenix0FJoLG2vJ2VESEU+lqvtto/xrYbAWyYQK7DmN+qi0DLKFZ68e99ywn9bUhyQHUxa5XJ5URFmzWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V18Ie5zW2MezKi1pYgLDLVuxoWoWK/MMaIkC6LHFcXM=;
 b=eqjG0XHGqqwoErIr8ZH3bHF+HL40JUUjVCpkyVgOlNSdW+NU4NKtUC78tXBlTQjqHdlgLOt9zyh4MSGAjLVLywp/RqiYSQ6EN1BHyK7l7DyusgIzuJDi7Y2MwA41tiikL41hMh/LgEJ6QIXh5SSWcC4vhStvi5No2EcxQIzx3iE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Topic: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
Thread-Index:
 AQHbeHHOqjf30im2P0K06mFnJR527rNCCo2AgAkjUfCAADA8gIABF+pwgADDeoCAAM5owA==
Date: Wed, 19 Feb 2025 03:30:20 +0000
Message-ID:
 <DM4PR12MB8451C0F0B6690F6875F9553AE1C52@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
 <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <f9dccb9b-24e9-416f-bfd7-787b8df4b617@suse.com>
 <DM4PR12MB84519F089FBB09112A16D438E1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <77bcd512-eea4-4098-bfe8-c7442cdf4fe9@suse.com>
In-Reply-To: <77bcd512-eea4-4098-bfe8-c7442cdf4fe9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=cab83dfb-1b23-4f78-b729-81bdabfe8d86;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-19T03:14:32Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB6718:EE_
x-ms-office365-filtering-correlation-id: 1ab12495-fd16-4342-98bb-08dd5095bd03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFBGUkdhcGhib1lOSFc2ME9rR3FmdkwrZGdDZ0pIK3llZ1l2Rk9HdkhrdVJI?=
 =?utf-8?B?VHBzOVp2V21XT1pSY2ovQjVpSVh4MitXTVJnN0Z4MUxPdWpVSTdBQ1NrTnpF?=
 =?utf-8?B?VmRVSEIyNlJBUnJoc3d5akxNam00dDZDR2s2ZE9YRC9LNFptSVpZUVpkYXpB?=
 =?utf-8?B?bGJVTWVPblExeXo4V2Q1TXpvaFhHd2s4RHNGZURJTyt3VHpKNmdNcEdabVNh?=
 =?utf-8?B?TXZMM212Q05LV0Z5eGVJNnJBamlZamw2Z0xZelRqMW1PdnVWMnh6Sm5KYVZz?=
 =?utf-8?B?QzZXQlJIVWJCTVRJbWsyQ3UrZUtDOWJkdmtqR2l1UUVFQ2cvdU5yZ015QUtB?=
 =?utf-8?B?c1ppbUlRLytVVWV5bHRNNEVldk5EMFdjNDZuT2I2a0JoRW4yOUxKMm04eHRr?=
 =?utf-8?B?R20vK1VSbjFBUWRkMThQbitsNEV6SlBZeGd3aVJrNytWZ2REb3N2ZU5NVnJU?=
 =?utf-8?B?VmJURkkzT1VpNDJ4TzFKaTA4VjBNODYrUmFPY2VVcU1ROGdMVnl2VDB5UkM4?=
 =?utf-8?B?RGVicG9sWDlrZ0JITUc0UlNIM2xMVUpPSFpOcVBUSjFBWmxBV0dVYlc2amoy?=
 =?utf-8?B?ODN0MmRpc24xMUNvcWhuMjRjZVJ4a1p6SzRjR1JnbjJFZkhNUGNldGpNMjVX?=
 =?utf-8?B?YXFlUU5PR3l5bllDV21sVERRdGRKUzl4Yk1TdDJkYmpjTlZ1WWRXNXBEZGgz?=
 =?utf-8?B?bGdLV0dXNHNqYTkwNmwzeFVmK0VlcHdVKzZhb21BbXhZd2ZHWm1sRjhPODE5?=
 =?utf-8?B?aFprOS90ZnBVUXJBV3pwVXVnRkMvdnByaTFRQUg2bzZDYjBZU1dVaGhnUW5Q?=
 =?utf-8?B?VkJGUW1teENDSDZLeTBvWHVpSkJEcHJCOWxSUHBiZW0yTnpWZWMzeUpTRWEw?=
 =?utf-8?B?UzZhTVJ3ZnR0RzVScnBsUWdqNWdHSEpjY0VlaW50ZzY4akJiRDJMM3N6YTRF?=
 =?utf-8?B?dkEyMEEvcWl6SHFJbTdrSDFpcUlzcDRhWWZZWTBhVmIzVWpkVGptbHlObkxY?=
 =?utf-8?B?OGY5ZjdDZWU5c1lxd2NZZ2t4bDhncnh3NTZxeUJzdW91aVp1ODVKQ0lueGR3?=
 =?utf-8?B?eCtUY2RFeHI4UXI0YkllUTEwemNXbE9pWTdQaTJ3Tm0yL1UzRWdNaWdCLzFB?=
 =?utf-8?B?NnBwOEd5SDBkblQzZ3M1S3haM1FxRmUyZFZiN0E4ZkdyMmptYTJ6QjA0T1lF?=
 =?utf-8?B?NWg3cWFTZTljMVB0c3pzZEhwNzR1SEI5YTRVbmhBZ2plbElWYjAydGlWTkI4?=
 =?utf-8?B?Sy9LaG83bHZnN0xac3h5aCtiQXNJQjBDbUIwVGtHVEppanBIY3RJdGpWbWVz?=
 =?utf-8?B?L2hveDFjUkZjTTlaZU5aZE1RRmo0WklzVHdmRCtLTi8rV21RdHBRR0VQcTBN?=
 =?utf-8?B?YnVJU09NZU5lSmo3UGE4UjJvOHpoWmUzSG1wVkdkTzRrY2txUVZaejJKN1BN?=
 =?utf-8?B?ZnV1NFdhQXpiVXZYellndS8xZjBOUUExU2VOTU85VE8zSjlZSUJqYW9JcHly?=
 =?utf-8?B?b0JZamY0ejhCZGRGRlJkL3VnMjVBZlk1VjJsb25SUHV4RnE5azJpbmhOMjZl?=
 =?utf-8?B?c2pNekJzRmpXZGcxV1owWUR1YmZscWl6WlJBWkFqK0J0VFcvNFNWL0NVeThO?=
 =?utf-8?B?cWxJQ2lOanBaTDZNNW9WWjg0M0MvU3NzZUw2d1k2Y1RackRJR29qamVPdE92?=
 =?utf-8?B?NGpWUjh6c1N1Y213RkVMTlQ0TVlPai9rcHpTVTBjQVFIb2lJMUlOZWF0Uis2?=
 =?utf-8?B?cVJ0N1ZOOWx0MmdpYlE5TVo5NHVMRlZ3UmtIMW52WGlOKzAyelEvRDJiUFVa?=
 =?utf-8?B?OXZBTnJvcm1peGRJeS9SVkVBVDBGelplbnFHSTRyVDRFV2RBNDRYdkdYVnpv?=
 =?utf-8?B?UWY5cHRYamtGckNQai9obU13RmxGcWRqZ2pBOHZDRGVYNFZoZWF2RXB0Z1kw?=
 =?utf-8?Q?Pto9uePalvhizYwNcbxAyUo0rJDjwo8S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEhKcHVRTGVnYW1EbVE2WFVjaXRsM3hJRzhheGZuUk14SjMzbjJ5a1ZLRHdG?=
 =?utf-8?B?ZlBqb2V0bHJWNm9EN3pvbVZLWjVkdWZNMkJyNGxjWWFWdEl3WE5NVVVhSk5F?=
 =?utf-8?B?K05JNFp6OWRyTGttY1V2WmhUZzVJaGRKRHI3elo0WnNDNmFLNU5aaEZVdjFF?=
 =?utf-8?B?NjRtLzNWSmhBemhtL3hoR0ZuVHk2UWpXMjAwOERKcWFwN2pDbkZ4VDJ5S1Rk?=
 =?utf-8?B?NUJMS21MQ1JHNjZmUWRMejNJcnpGbHkyTUlLVzFTWVNMWnRLelAzVWN6Z2RT?=
 =?utf-8?B?MTFuWnpvaml6ZUptMGdZcmtSckU2MGNYNmwwTURQNmFOZm9yL0tNbEp3dkZY?=
 =?utf-8?B?OW9ndUdkVUhhd3VpYU5oYk84aUhTbGZEeHFlNmY0ckNxTnZSdXhMODd2RUN0?=
 =?utf-8?B?a2tOTlFQS2cxNFBqb1ZUNlJVL2lXcjF3MzdveGQ1MVB6QVJNVzlwNU82Z1VL?=
 =?utf-8?B?dEU5NTd1a1VwMEtlcHQyKzU5Z0VUOTk1YzlrVDZkajRzNmZYbnlOaUk0NHFG?=
 =?utf-8?B?UFFJSUhFREdsZ3ZCOUZBYSs2c2MreUhvbFlNUTc1TTVUemowUUdyRkFXc0RT?=
 =?utf-8?B?RzNaQW80akF3ZVpYblp1WlB3dVM4bFBSN3p5THZMUXFrcE9jL3paOUlCaTBr?=
 =?utf-8?B?cm1SZnlwdmpjVzZHNzRhc3J5Yklrd0xVNWJiaVFMdGxpMWo1bVRISWc4L2xr?=
 =?utf-8?B?THAwOURHK0ZUT2IyaEkwcnE1TjJpcXNIc1BjK3NYVkh3UW5RT1BiRzRUSFhU?=
 =?utf-8?B?aE1LdkRnSzRjcUg4UTRmK0YrT0FmSmd6aXlyNFZNQ1JleGZlaE1nZWlHQ2ln?=
 =?utf-8?B?cldrQTdmYzhkejBHV3JMVVVlKzhhVklkM0dNNVRPaEpEcHFUNUVpR0E1V1gy?=
 =?utf-8?B?QlZ0bm0wNzllemlIOFNjbU10T3B4dWZpUUNYaXdwMW5SR1N3ZzE5dEFCSmhm?=
 =?utf-8?B?d0xKR3RRdnJLTDJhWWluVVVYTW5oVWZNZmkxaDU5V2V2QUZmZzh5T2w0ZkZE?=
 =?utf-8?B?WXBndUI3Ym9DWU92cnJEVS94cHRsWFdnLzBEemdLNVdwaTZxZkZXaDkycnJX?=
 =?utf-8?B?TURBYm5CbklFdUV3K2JHMWF3djRIUEhGWE4xNm0zYVNuVndnL1RLQlVibmJm?=
 =?utf-8?B?SVBsL2tsMWJGTm9hako3VmdTSlFQRU5oYUx1NHpobVBicm1FZTEzYzdRME41?=
 =?utf-8?B?czFtcUxBVXQ5ZGdpZHhjWnJUbSt6aURNdExtcjNkVjdLbTRUdkpMdFRJWnFK?=
 =?utf-8?B?cTgvalFRbjZmMi9vTDZWM2Rrd2lUOFhpbDU0UjVyK0MzN2VzaDJlaFVNUE9q?=
 =?utf-8?B?ZTU3YjU1NXM5YWgwdlQ2d0Z6NHREZlV1UVgzY3ErbHVDejNiNkl1bUd4czkx?=
 =?utf-8?B?SzZCVC9landBbEgwekdnN3ZQQ3pRV3pocmJic29uT3QwRU4vRlZ6Y1JlWHU4?=
 =?utf-8?B?TXRMYXVQcnBBekZ6cW15eGJsb0tuS0R0ZUNYSThsRVFGL3lyNTZ0TzJHZStL?=
 =?utf-8?B?UVpSSUljR3FlMUlxTUR0Rjl1blNRcnhKdC9LcnoxWHErOTVscGV3TzhMUHls?=
 =?utf-8?B?UmEvYXlBYjRoa3JjbUo2WjR1VTRyYisxcEN1SEJYZGgwUGhhYWtickhwdGla?=
 =?utf-8?B?WFoxUXE1VlFZVWZ5S0k4bk9TdmFvYzVuSkJRK2dhQktQWTRKbHVpblJnTWlB?=
 =?utf-8?B?MENOQ0g0SnAzZS9ISFNrVHJ3UWtwOHVyalBnNFVhQmYwbHJBYWV3UkVSWWVB?=
 =?utf-8?B?eE9Ed3VlbkdXc1VjTmRvMGo3WnQ0OXY5N3FjNVRFcDVpYVQ4K3B0c2pwRUJv?=
 =?utf-8?B?MGxoWDRIeVRrWGREUml1YVJRRzhUcGJMcUsrUm9XczdXekREWm41dzB3OG95?=
 =?utf-8?B?aHF4SmdhRjBJbTlKZnJxN3RIMEc0czQ1N20xY2F0RCtqSnVTZ1YyZ1BvM2Ey?=
 =?utf-8?B?NWlob1JJcXpHVXpPSVZxaE9xclRGTyttKzJuSGU5NHk3RTZhRkg4QmU5V1FJ?=
 =?utf-8?B?TEVTTExXUC9seXVpQlNHc3NlMG0velY0dFlCdUVqQVJmcGhLaUZmUDBXMVlM?=
 =?utf-8?B?Si8xd3FTWk5qRi9OSExqTklvamc3Q0hGNmdkT1R6MW5hU3dZMHFVTWpXU3c4?=
 =?utf-8?Q?OeNg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab12495-fd16-4342-98bb-08dd5095bd03
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 03:30:20.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fifm140bXWlOmPTxBbGo3j7EjwxFmzWbZibFSaiqw4LyIvryCLj5GTsym11RvmHm5cra9sbefaEnDayBJBNHgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6718

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwgMjAy
NSAxMDo1NiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFz
b24uQW5kcnl1a0BhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT47DQo+IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgT3J6
ZWwsIE1pY2hhbA0KPiA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+IGRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDMvMTFdIHhl
bi94ODY6IGludHJvZHVjZSAiY3B1ZnJlcT1hbWQtY3BwYyIgeGVuIGNtZGxpbmUNCj4NCj4gT24g
MTguMDIuMjAyNSAwNToyNCwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTcsIDIwMjUgNjozNCBQTQ0KPiA+Pg0KPiA+
PiBPbiAxNy4wMi4yMDI1IDExOjE3LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+ID4+Pj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTEsIDIwMjUgODowOSBQ
TQ0KPiA+Pj4+DQo+ID4+Pj4gT24gMDYuMDIuMjAyNSAwOTozMiwgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4+Pj4+IEBAIC0xMzEsNiArMTMxLDE1IEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNr
DQo+ID4+Pj4+IHNldHVwX2NwdWZyZXFfb3B0aW9uKGNvbnN0DQo+ID4+Pj4gY2hhciAqc3RyKQ0K
PiA+Pj4+PiAgICAgICAgICAgICAgaWYgKCBhcmdbMF0gJiYgYXJnWzFdICkNCj4gPj4+Pj4gICAg
ICAgICAgICAgICAgICByZXQgPSBod3BfY21kbGluZV9wYXJzZShhcmcgKyAxLCBlbmQpOw0KPiA+
Pj4+PiAgICAgICAgICB9DQo+ID4+Pj4+ICsgICAgICAgIGVsc2UgaWYgKCBjaG9pY2UgPCAwICYm
ICFjbWRsaW5lX3N0cmNtcChzdHIsICJhbWQtY3BwYyIpICkNCj4gPj4+Pj4gKyAgICAgICAgew0K
PiA+Pj4+PiArICAgICAgICAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJpdHMgfD0gWEVOX1BST0NFU1NP
Ul9QTV9DUFBDOw0KPiA+Pj4+PiArICAgICAgICAgICAgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJF
UUNUTF94ZW47DQo+ID4+Pj4+ICsgICAgICAgICAgICBjcHVmcmVxX3hlbl9vcHRzW2NwdWZyZXFf
eGVuX2NudCsrXSA9DQo+ID4+Pj4+ICsgQ1BVRlJFUV9hbWRfY3BwYzsNCj4gPj4+Pg0KPiA+Pj4+
IFdoaWxlIGFwcGFyZW50bHkgYWdhaW4gYSBwcmUtZXhpc3RpbmcgcHJvYmxlbSwgdGhlIHJpc2sg
b2YgYXJyYXkNCj4gPj4+PiBvdmVycnVuIHdpbGwgYmVjb21lIG1vcmUgbWFuaWZlc3Qgd2l0aCB0
aGlzIGFkZGl0aW9uOiBQZW9wbGUgbWF5DQo+ID4+Pj4gcGxhdXNpYmx5IHdhbnQgdG8gcGFzcyBh
IHVuaXZlcnNhbCBvcHRpb24gdG8gWGVuIG9uIGFsbCB0aGVpciBpbnN0YW5jZXM6DQo+ID4+Pj4g
ImNwdWZyZXE9aHdwLGFtZC1jcHBjLHhlbiIuIEkgdGhpbmsgdGhpcyB3YW50cyB0YWtpbmcgY2Fy
ZSBvZiBpbiBhDQo+ID4+Pj4gcHJlcmVxIHBhdGNoLA0KPiA+PiBpLmUuDQo+ID4+Pj4gYmVmb3Jl
IHlvdSBmdXJ0aGVyIGV4dGVuZCBpdC4gSGVyZSB5b3Ugd2lsbCB0aGVuIGZ1cnRoZXIgd2FudCB0
bw0KPiA+Pj4+IGJ1bXAgY3B1ZnJlcV94ZW5fb3B0c1tdJ2VzIGRpbWVuc2lvbiwgdG8gYWNjb3Vu
dCBmb3IgdGhlIG5vdw0KPiA+Pj4+IHNlbnNpYmxlIHRocmVlLWZvbGQNCj4gPj4gb3B0aW9uLg0K
PiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIFdlIGFyZSBtaXNz
aW5nIGRlYWxpbmcgdGhlIHNjZW5hcmlvIHdoaWNoDQo+ID4+PiBsb29rcyBsaWtlIHRoZQ0KPiA+
PiBmb2xsb3dpbmc6DQo+ID4+PiAiY3B1ZnJlcT1hbWQtY3BwYyxod3AsdmVyYm9zZSIuDQo+ID4+
DQo+ID4+IE5vdCBzbyBtdWNoIHRoaXMgb25lIChjYW4gaXQgZXZlbiBvdmVyZmxvdykuIEl0J3Mg
ImNwdWZyZXE9YW1kLWNwcGMsaHdwLHhlbiINCj4gPj4gdGhhdCBJJ20gY29uY2VybmVkIGFib3V0
IChvciwgcHJpb3IgdG8geW91ciBjaGFuZ2Ugc29tZXRoaW5nDQo+ID4+IHJlZHVuZGFudCBsaWtl
ICJjcHVmcmVxPWh3cCxod3AseGVuIikuDQo+ID4NCj4gPiBJIG1pc3VuZGVyc3Rvb2QgYmVmb3Jl
LCBzb3JyeQ0KPiA+IFdoYXQgaXMgdGhlIGFwcHJvcHJpYXRlIGJlaGF2aW9yIHdoZW4gdXNlciBw
YXNzZXMgYW4gb3B0aW9uIHRvIFhlbiwgbGlrZQ0KPiAiY3B1ZnJlcT1hbWQtY3BwYyxod3AseGVu
IiA/DQo+ID4gRldJVCwgYW1kLWNwcGMgYW5kIGh3cCBhcmUgaW5jb21wYXRpYmxlIG9wdGlvbnMu
DQo+DQo+IFN1cmUsIGJ1dCBhcyBzYWlkIHBlb3BsZSBtYXkgd2FudCB0byB1c2Ugc29tZXRoaW5n
IGxpa2UgdGhpcyB1bmlmb3JtbHkgb24gYWxsIHRoZWlyDQo+IHN5c3RlbXMsIGJlIHRoZW0gQU1E
IG9yIEludGVsIG9uZXMuIElPVyAuLi4NCj4NCj4gPiBTZW5kIHRoZSBlcnJvciBpbmZvIHRvIHRl
bGwgdGhlbSB5b3Ugc2hhbGwgY2hvb3NlIGVpdGhlciBvZiB0aGVtLCBhbWQtY3BwYywgb3IgaHdw
LA0KPiBvciB4ZW4/DQo+DQo+IC4uLiBubywgSSBkb24ndCB0aGluayB0aGlzIHNob3VsZCBiZSBh
biBlcnJvci4NCj4NCj4gPiBJZiB1c2VyIHdhbnRzIHRvIGFkZCBmYWxsIGJhY2sgc2NoZW1lLCB3
aGVuIGFtZC1jcHBjIGlzIGhhcmR3YXJlDQo+ID4gdW5hdmFpbGFibGUsIHdlIGZhbGwgYmFjayB0
byB4ZW4uIHVzZXIgc2hhbGwgdXNlICI7Iiwgbm90ICIsIiB0byBhZGQsIGxpa2UNCj4gImNwdWZy
ZXE9YW1kLWNwcGM7eGVuIg0KPg0KPiBXZWxsLCBJIGRpZG4ndCBjbG9zZWx5IGNoZWNrIHdoZXRo
ZXIgdGhlIHNlcGFyYXRvciBpcyB0byBiZSBzZW1pY29sb24gb3IgY29tbWEuDQo+IFRoaW5ncyBp
cyB0aGF0IHBlb3BsZSBtYXkgd2FudCB0byB1c2Ugb25lIHNpbmdsZSBjb21tYW5kIGxpbmUgb3B0
aW9uIGFjcm9zcyBhbGwNCj4gdGhlaXIgc3lzdGVtcywgb2xkIG9yIG5ldywgSW50ZWwgb3IgQU1E
LiBIZW5jZSB0aGV5IG1heSB3YW50IHRvIGFzayB0byB1c2UgSFdQIGlzDQo+IGF2YWlsYWJsZSwg
Q1BQQyBpcyBhdmFpbGFibGUsIG9yIGZhbGwgYmFjayB0byB3aGF0IHdlIGhhdmUgaGFkIGZvciBh
Z2VzLiBZZXQgdGhleSB3aWxsDQo+IGFsc28gbmVlZCB0byBoYXZlIGEgd2F5IHRvIGV4cHJlc3Mg
dGhhdCB0aGV5IHdhbnQgb25seSBIV1AgYW5kIENQUEMgdG8gYmUgdHJpZWQsDQo+IHdpdGhvdXQg
ZmFsbGluZyBiYWNrIHRvIHRoZSBsZWdhY3kgZHJpdmVyLiBIZW5jZSB3ZSBtYXkgbm90IGF1dG9t
YXRpY2FsbHkgZmFsbCBiYWNrIHRvDQo+IHRoYXQgaWYgImFtcC1jcHBjIiB3YXMgcGFzc2VkLCBi
dXQgaXMgdW5hdmFpbGFibGUuDQo+DQoNClRoZW4gSSBzdWdnZXN0IHdlIHVzZSB0aGUgc2VtaWNv
bG9uIHRvIHNlcGFyYXRlIGFsbCBvcHRpb25zIHVzZXIgd291bGQgbGlrZSB0byB0cnksIGJ1dCBp
biB0aGUNCnByaW9yaXR5IG9yZGVyLCBsaWtlICJjcHVmcmVxPWh3cDthbWQtY3BwYzt4ZW4iLCBp
ZiBod3AgYW5kIGFtZC1jcHBjIGFyZSBib3RoIHRyaWVkIGFuZCBmb3VuZA0Kbm90IHN1cHBvcnRl
ZCxsZWdhY3kgeGVuIHdpbGwgYmUgY29uc2lkZXJlZC4NCklmIGl0J3Mgb25seSAiY3B1ZnJlcT1o
d3A7YW1kLWNwcGMiLCBhbmQgd2hlbiBod3AgYW5kIGFtZC1jcHBjIGFyZSBib3RoIG5vdCBzdXBw
b3J0ZWQsIHdlDQp3aWxsIG5vdCBhdXRvbWF0aWNhbGx5IGZhbGwgYmFjayB0byBhbnkuDQoNCkZv
ciBzcGVjaWZpYyBkcml2ZXIsIGxpa2UgImFtZC1jcHBjIiwgc3ViLWZlYXR1cmVzIGxpa2UgYWN0
aXZlIG1vZGUgd2lsbCBiZSBzZXBhcmF0ZWQgYnkgIiwiLCBsaWtlDQoiY3B1ZnJlcT1od3A7YW1k
LWNwcGMsYWN0aXZlO3hlbiINCg0KPiBKYW4NCg==

