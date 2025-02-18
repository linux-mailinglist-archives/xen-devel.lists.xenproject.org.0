Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568EDA3921E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 05:25:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891062.1300160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkFAX-0002oW-Rb; Tue, 18 Feb 2025 04:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891062.1300160; Tue, 18 Feb 2025 04:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkFAX-0002m6-Or; Tue, 18 Feb 2025 04:25:13 +0000
Received: by outflank-mailman (input) for mailman id 891062;
 Tue, 18 Feb 2025 04:25:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6odE=VJ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tkFAV-0002m0-Up
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 04:25:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2415::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4edfbd60-edb0-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 05:24:57 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 04:24:53 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 04:24:52 +0000
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
X-Inumbo-ID: 4edfbd60-edb0-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awQZ+cfK8jX5/ETBOt0hp59z6ut6o2lEuFhiFKJMzkE9okNf1ZRGd4iR0ASU3mQo1BJ1phYq6moKZTxldxfBmoLpDbPYiONq/hlW5GIyjmRCjZGA1ui81fbJhi2KQWsXhb0wJTst4O027F16vpGjNX6MzqcUOwRhb1IaGYKmFx0xnl501wV5fZnNSOBSLINg0FKn3LMDJrWx/MTpoqamWNdDMP9SgIAEHonR4ImrmkJytX1vump/SVVmE+7v9FkmCy2Y5YoAcQeIw5ifDQ70Rk5fkWXBtGbLT3yrziLqZnHtSjbApDFSwRtlHhojwaYXttaNeEoJ28bsXjq/1CQoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JrW8OX0EtAwTBBAPzU2EBSbL9xWEBgsoC70osK1bds=;
 b=F2owrmeqegyozoL2xpJHbucLNI3noX33V855KQBunFWSveqN85snUXJiARDYm1bXN1FPX7Yr2nUxyxxBtZm8tglrTd5+NcGhdkHnDi89vuxWuRT2pgBuKJCxmilShXIFc8sulRd5GbP+40fLbuGeB1Z0vCQI3qT2NIgFasrxnf1H2Gbf7uh8IcW6a03OJIPBchbi02Q9b/8LeuCLLOBTd5youv9JI2iH0Cv3hnRjofLgTe+auCg+FDFzQKhHxQM1W2S0WAW9kQqWFz78/8tC2qpV2r4UfEcUiAQXPpW0YUceXGe7W4PffFEUyF5hbw6AqE9TDRQNUmrJZTk6g9kEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JrW8OX0EtAwTBBAPzU2EBSbL9xWEBgsoC70osK1bds=;
 b=xGUR18JRw3QXf2NnsrRkkEd3ojyGNQTfIUbhOBPxDtSTugiXlbv6xe7E6Ayl3xXhTFF/9z2dfE1alyqZciHWQpjKbvSooQLN4oxkLgOoXVHS1ee6bpQ9hvnzfdDkR0BShHN+l+AeGzidjs6iBgYBHwQDQYK3UdoHB2W5YMfggDE=
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
Thread-Index: AQHbeHHOqjf30im2P0K06mFnJR527rNCCo2AgAkjUfCAADA8gIABF+pw
Date: Tue, 18 Feb 2025 04:24:52 +0000
Message-ID:
 <DM4PR12MB84519F089FBB09112A16D438E1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
 <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
 <DM4PR12MB8451A3D08427CDD412AA650DE1FB2@DM4PR12MB8451.namprd12.prod.outlook.com>
 <f9dccb9b-24e9-416f-bfd7-787b8df4b617@suse.com>
In-Reply-To: <f9dccb9b-24e9-416f-bfd7-787b8df4b617@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=6daa2ed8-1ac6-4a89-8905-426ad9316cf0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-18T03:16:08Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB7566:EE_
x-ms-office365-filtering-correlation-id: c62dd40e-b8ca-4bf7-c510-08dd4fd430e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bXRYejR3b25HbXNwc2FBZkU5T1NySEFYR1YweCtzN3BxUUJXQVJEZ1gweGNn?=
 =?utf-8?B?dGl0aDVWM0NFbkRZRWh5ZlRYa2dsWTZtNFpJczA1RCs5Tk9Gb1FvUGdFNGFE?=
 =?utf-8?B?NnU2Y1Q5V0J0NE91aG1vY1Q3UDBrV1JjMmJNRjh6VEpXUWpNRGFUUXFZUndG?=
 =?utf-8?B?dTUxM2JWN0ltQW11aHI1OUhHR2NjUnovOVRNdWdiR2NYb3UvRkJnUXo0ckwz?=
 =?utf-8?B?c3VmOTNrSFEyeTdCT2l6N3Z3QjFGMFRpT1EzTjdqRmEwR1lMd1hlbElBMDhi?=
 =?utf-8?B?NTZ1VUwyTVVVMS8zUGJ4dHBFT2p0clpNcEZwTnVHbWtqQzRGMXZHT3FXcE1h?=
 =?utf-8?B?Ly9TUml5citXSm1NLzFBU3V5UFZ2SkJHRGprcEhMWG1rMHBIZXhHdFVXY2ov?=
 =?utf-8?B?cTlQWFF3UDE3cWhzVTF4Y0kvNkx1ZWZZRVUvMmFGZWU4Y294KzNmcmZuWktu?=
 =?utf-8?B?TkVoK0JRV0tYWndYU0N6SkV6dndsQ0pLdjc2a3dGZWZmaHhPK3JvL25uNzRa?=
 =?utf-8?B?YStBaEhaN0FxTUEvc0dzeElmQ2N5Y1BKNUtTVGVMcXR2aGo0c3c3WmJ5WXd0?=
 =?utf-8?B?MUtEdGh3SGJpR1VyNnR2K09hdW1KcWJyRGVlU3BIR05FcytyOUYwQlJERlcw?=
 =?utf-8?B?UlNaYXB3TWFOc1hXZjYySmpHWlhmLzNwRVBhWTB4Z2JxYmhoMGRlUGEwWFBW?=
 =?utf-8?B?UE10TzJaVFQrSjlrdGtsdkVOWmxVVG14VWJLWVFYWFN2M1duZ3FHTHoyQVNa?=
 =?utf-8?B?VFp6dGN1Tmd2ZUZlRE1VODRKNDNpS2hWa21pVUJ0MGMydWpFTWdlbnRJalpH?=
 =?utf-8?B?TXpOYTFBUlJVL2Z6MUxSOWVxWks0eFFPck9MVHF5a3hFS2NnSU9aZmlqSXMx?=
 =?utf-8?B?eENwYzMzZkxJbTFUWVJIQUh5NnIzVlZQVGwxL25wWWtUa3d0SmJWcktiMEZ5?=
 =?utf-8?B?QUJIaHNBK0hDVzVCd1d6U29SWThzRWcwclZZemMyZGpCODd3OVpCbFNqTXBX?=
 =?utf-8?B?OUV0WmNEMUc5cE0yOGoyVnQwV2tqVGR3aUc4dDRkbjhOY1JiSVpiZ2JxbVQy?=
 =?utf-8?B?dVozMklOVmUyeU1mRmU3d0w0Znl5K0R0SnY1aFNRRklMb3VGSjc3SHBGNE1p?=
 =?utf-8?B?U3VKMjNtZXFpKy95Yy9iWW5YQVZoMFM4cUFKcjMxb2JkalY0Wk5PTndnaGFW?=
 =?utf-8?B?YkVaaWUwQmRXOTF2d0FRUnA5R3FsMHBWcURncmhNclBwVXYyZDN2SWFuMm1v?=
 =?utf-8?B?bVpERXZINERGQWM5RWhYQ3VjaElmcUxPdURMZW9iV3I5VTNVSUFvNDN2WVFx?=
 =?utf-8?B?ZlZrUFlSSjZhSzcveXJoZ0pxT1NFVkJVdy9vYlpySEYrcGdrSjM5VmE2a1FM?=
 =?utf-8?B?SXk5d2FKZ2RRcU0zdGVWbHRrMlR6eU56M3FjMi9iZ01RdzhjSkNnRjI1anZW?=
 =?utf-8?B?eXc4L0FUS01sRFFOWTdIQkJmQ24xVmx3bk9uWW5FbTBqOTZOckduU1lzcXJm?=
 =?utf-8?B?WDZsNURxTVdsZU4xL2U3UGVqNkdrYXZUUXF1N1QzeG5JSkN6TjU5dTZON3Ri?=
 =?utf-8?B?a1Y3cis1alRna1JMaWpMcGZCaEdISGxGcmlIY3RkaUFheERFbHlCK3B3Tzhx?=
 =?utf-8?B?bTFLbjV2aVp0dmlWWEVjUEZ5OXV0a0hUU3VQQWhkSVZ6KzZHWVRmdTh4TnQ2?=
 =?utf-8?B?bHhCdHVqcnltUUxwQXhVSk9RWERvYjRITmlYOUtTdWxzYnd1aC9kb3RzenYy?=
 =?utf-8?B?eC9vc1Y5d0QzUVlaQ2NuOFlQdk9yemdiRkllbGt5N1B6OUdJOWhqaThrQkxY?=
 =?utf-8?B?QlplWk9sZC9LMitIYUp4UnVZNjV0MFo3bkFycnVaVTE2bEZsY1RZNWIvL09T?=
 =?utf-8?B?ZGlZUCt3R3BhWHhGT0kwNldKdzFSZk9VMGNFSjkvNGhuWjhhUFowL2JMTWR5?=
 =?utf-8?Q?lhC2gl4wjTQyfQNQoTHgUjH85ANO03BO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVo1TmM0YW54SDhKTDRYL0lMSDFva0RmUGlpU3pFdEd1QU1ISVdOU0RMdHo4?=
 =?utf-8?B?aWZyZTk0THNQVXkrNUVaT3huZW5iaEcxQ0lrWE1oSWlUU3d1TXg1S3NMOUox?=
 =?utf-8?B?dlhKdk82d3ZlM2VQVEVuVTZpeThES3RaWHFKOGp0M3JHRjF4cHUrK3dTRWdP?=
 =?utf-8?B?NHVTMUh2azI1ODZSbkRDUGlhSWVFaTR3UENVRTgzbitOT3FVQ25OVnp4WllQ?=
 =?utf-8?B?SVJhdkhUbVdvNXhBL1RaaW1VT1lkY250bEd2VG9Tc1VVWmh2Ump3RW4vZlMr?=
 =?utf-8?B?OWtTRzNlRk5tNWU3bDFJYnZBV1FRSTRUL2krM01IR2dIcVlTa0tSR0VIN2Ni?=
 =?utf-8?B?OE1kWWJoZ1daY3M3TWJ2N3BTT0d2dzBrT3BUVlhPM3dLcVhwNGxTZTlZemRl?=
 =?utf-8?B?OERWYVQxQlpwVmtmSjBON1V1VUtZLzNhcXhadDllNXQ2MUJheEZYOXFYQ0U1?=
 =?utf-8?B?ODNKNnZJRlBPKzQyNmJ1MTU4SkNyOWJ4dy9jbDhHNE53Y2tBaVlOSnl6bkFm?=
 =?utf-8?B?VlllRUNQMisyY3BLUnB1aCswVHRnb0Nob3NwenNuL0NwV2NadG1UaU9nUGxE?=
 =?utf-8?B?V3RDdlJManhOem8vNEJSMUlWcEY3RFRkemVXR1RoT2piaEl0UzU4L0FRZGs1?=
 =?utf-8?B?eG52MFJjVUNQbXRENHZ4WFg5a1VIVjBPNTNmMk1QQVlibHNqa3VwUTZyaEpO?=
 =?utf-8?B?VzRadGhkZUhnS09zUFNzckJRMFF1aFRNMnVTRlZDc2NHbEV2cWhsSHg2UGpQ?=
 =?utf-8?B?ejNLRDVQQmhJdldGWllEUjBVY2QrVEpaeEJkM2lOcmJEYXJjeHhHREtsVWNo?=
 =?utf-8?B?eURmYndqc0tBUjZpUkpBUURHZitpOXphdU1rdklOdDl1OEpqU3QrNkhzZTN2?=
 =?utf-8?B?NlZjYVVsTGxKb2Y1L08ySVJrMHdHTHdXSFN1UjZnZ0RkYWRUSVgwdDkzMmZH?=
 =?utf-8?B?cDN4SGo2cWEyNW13Q3E2U3kxc3Bremdkc05zNUpDaWNwSUp4TFVFS1I0dE1q?=
 =?utf-8?B?SGtleSs4RUdTckJQZFl6cjV1TGFwUnNEN2VYTEtQVHVqYXV5SFRmaVVWYld2?=
 =?utf-8?B?V3FVS2lNdXVzbXF3U0xnYy9pZmtiSTEyYTVKd0J3OHczMWFHNG1nVGNTNWNx?=
 =?utf-8?B?UjE3VXVRNjZDaTZ2WStySXhFZS85RjFNeE5wUXZFeFRIbldPeDBNUFkvOThN?=
 =?utf-8?B?TFFVdHpFdXl4SktQUWYyRGl2aWY1ZGJYaSs1NDgvaHFTN1VSU2pYbDMycGJm?=
 =?utf-8?B?UnZFbjBBRm9ZNGhodmRiSHpUUlFVckZLUzVoMEFGS09SUHVuZjhSM0gvczNn?=
 =?utf-8?B?K1FjdDR2QkJwRmpWSEZMbGx6ckFhalQ0eVhRbDZyZEt4clpjblArbmFrQkIv?=
 =?utf-8?B?a2V4VnRDQkNOQ1B2Q3Q5OUtDQ3JtWTJvT0RINk5KcENqTktlS2RSdmVXV2Nu?=
 =?utf-8?B?SjZsTHlhci9MYWF2Z3UvUUZnTTM3VFFhQXh0RFR3eTJlUnNheUFmZVFwU004?=
 =?utf-8?B?UlNlTGZNTzM5RThvcENBcU1DRUkycEdTQmNLZnlOQnpHb1M1LzFhWlh1VlVX?=
 =?utf-8?B?bzNjZU9QWlJKMjBIcG9yTFRjenIwZUNtUm5HZkJENEhSc3VITFZGRmozTHA3?=
 =?utf-8?B?SU4wRFBSL3JveGFaYmxyME5BaFU4aE9XUzJlQ0g3bGV4enVwUzRYbEFQS0tT?=
 =?utf-8?B?THBBSUhKMkE4U3hKRjFYUGRLUHhNZmYrTVZvaUFSU0VtUU92aEJhYmk1V201?=
 =?utf-8?B?em5xNHdaWEFEdEJvRFhUYlBOTXF3U01kRDJBM1gwZkMxeXRGR2o2eURZTG5q?=
 =?utf-8?B?YjB0eC90bEpnTW00em1xWkVHT0xDemR6WndzZVhTZWY3UnkvVkNQekVYTjJS?=
 =?utf-8?B?QXVHa2NTbzNObFJYWGpOQTM4eE02YStBRnZYVEs0UG51dC9GZnNpRmswWXdL?=
 =?utf-8?B?S1BtNnlkTk1LeXlDVUkxU294OUpKbWkrYVI1VS9MVUJKSXZleVRrV1NyNnlN?=
 =?utf-8?B?K0NVRnErS1J4eTkraStHNW00SVhqMUlMVUxJVXdTdFRld1pTUGtqTnBNK1RU?=
 =?utf-8?B?NmRlV1IyYkdJOVUyU2tHaVZUUWtwVSttMWtqNW50ODcxaFhtTTY5VnQzSkpQ?=
 =?utf-8?Q?I34s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62dd40e-b8ca-4bf7-c510-08dd4fd430e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 04:24:52.7599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zwN/nljdF9DJd9f3JaldL9r5IcDZ5NrnbhgJmQD/jAERpzYOy2fsHc6wmVy+lU08Z+OC78IBqmSNxv2qx6/vdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE3LCAyMDI1
IDY6MzQgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcnl1aywgSmFzb24NCj4gPEphc29u
LkFuZHJ5dWtAYW1kLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVs
LCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQ0KPiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAzLzExXSB4ZW4v
eDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiIHhlbiBjbWRsaW5lDQo+DQo+IE9uIDE3
LjAyLjIwMjUgMTE6MTcsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPiBbQU1EIE9mZmljaWFsIFVz
ZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+DQo+ID4gSGksDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMSwg
MjAyNSA4OjA5IFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+ID4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29u
DQo+ID4+IDxKYXNvbi5BbmRyeXVrQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsNCj4gPj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZh
dGVzLnRlY2g+OyBPcnplbCwgTWljaGFsDQo+ID4+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gPj4gTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IHhlbi0gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMy8xMV0geGVuL3g4NjogaW50cm9kdWNlICJjcHVmcmVxPWFtZC1j
cHBjIg0KPiA+PiB4ZW4gY21kbGluZQ0KPiA+Pg0KPiA+PiBPbiAwNi4wMi4yMDI1IDA5OjMyLCBQ
ZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEv
Y3B1ZnJlcS5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEu
Yw0KPiA+Pj4gQEAgLTE0OCw2ICsxNDgsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBj
cHVmcmVxX2RyaXZlcl9pbml0KHZvaWQpDQo+ID4+PiAgICAgICAgICAgICAgICAgIGNhc2UgQ1BV
RlJFUV9ub25lOg0KPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsNCj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+Pj4gKyAgICAgICAgICAgICAgICBkZWZhdWx0
Og0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJVbnN1
cHBvcnRlZCBjcHVmcmVxDQo+ID4+PiArIGRyaXZlciBmb3IgdmVuZG9yIEludGVsXG4iKTsNCj4g
Pj4NCj4gPj4gU2FtZSBoZXJlLiBUaGUgc3RyaW5nIGFsb25nIG92ZXJydW5pbmcgbGluZSBsZW5n
dGggaXMgZmluZS4gQnV0IHRoaXMNCj4gPj4gY2FsIHRoZW4gc3RpbGwgYmUgd3JhcHBlZCBhcw0K
PiA+Pg0KPiA+PiAgICAgICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVW5zdXBwb3J0ZWQgY3B1ZnJlcSBkcml2ZXIg
Zm9yIHZlbmRvcg0KPiA+PiBJbnRlbFxuIik7DQo+ID4+DQo+ID4+IHRvIHJlc3BlY3QgdGhlIGxp
bmUgbGVuZ3RoIGxpbWl0IGFzIG11Y2ggYXMgcG9zc2libGUuDQo+ID4+DQo+ID4+PiBAQCAtMTMx
LDYgKzEzMSwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjaw0KPiA+Pj4gc2V0dXBfY3B1
ZnJlcV9vcHRpb24oY29uc3QNCj4gPj4gY2hhciAqc3RyKQ0KPiA+Pj4gICAgICAgICAgICAgIGlm
ICggYXJnWzBdICYmIGFyZ1sxXSApDQo+ID4+PiAgICAgICAgICAgICAgICAgIHJldCA9IGh3cF9j
bWRsaW5lX3BhcnNlKGFyZyArIDEsIGVuZCk7DQo+ID4+PiAgICAgICAgICB9DQo+ID4+PiArICAg
ICAgICBlbHNlIGlmICggY2hvaWNlIDwgMCAmJiAhY21kbGluZV9zdHJjbXAoc3RyLCAiYW1kLWNw
cGMiKSApDQo+ID4+PiArICAgICAgICB7DQo+ID4+PiArICAgICAgICAgICAgeGVuX3Byb2Nlc3Nv
cl9wbWJpdHMgfD0gWEVOX1BST0NFU1NPUl9QTV9DUFBDOw0KPiA+Pj4gKyAgICAgICAgICAgIGNw
dWZyZXFfY29udHJvbGxlciA9IEZSRVFDVExfeGVuOw0KPiA+Pj4gKyAgICAgICAgICAgIGNwdWZy
ZXFfeGVuX29wdHNbY3B1ZnJlcV94ZW5fY250KytdID0gQ1BVRlJFUV9hbWRfY3BwYzsNCj4gPj4N
Cj4gPj4gV2hpbGUgYXBwYXJlbnRseSBhZ2FpbiBhIHByZS1leGlzdGluZyBwcm9ibGVtLCB0aGUg
cmlzayBvZiBhcnJheQ0KPiA+PiBvdmVycnVuIHdpbGwgYmVjb21lIG1vcmUgbWFuaWZlc3Qgd2l0
aCB0aGlzIGFkZGl0aW9uOiBQZW9wbGUgbWF5DQo+ID4+IHBsYXVzaWJseSB3YW50IHRvIHBhc3Mg
YSB1bml2ZXJzYWwgb3B0aW9uIHRvIFhlbiBvbiBhbGwgdGhlaXIgaW5zdGFuY2VzOg0KPiA+PiAi
Y3B1ZnJlcT1od3AsYW1kLWNwcGMseGVuIi4gSSB0aGluayB0aGlzIHdhbnRzIHRha2luZyBjYXJl
IG9mIGluIGEgcHJlcmVxIHBhdGNoLA0KPiBpLmUuDQo+ID4+IGJlZm9yZSB5b3UgZnVydGhlciBl
eHRlbmQgaXQuIEhlcmUgeW91IHdpbGwgdGhlbiBmdXJ0aGVyIHdhbnQgdG8gYnVtcA0KPiA+PiBj
cHVmcmVxX3hlbl9vcHRzW10nZXMgZGltZW5zaW9uLCB0byBhY2NvdW50IGZvciB0aGUgbm93IHNl
bnNpYmxlIHRocmVlLWZvbGQNCj4gb3B0aW9uLg0KPiA+Pg0KPiA+DQo+ID4gQ29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcsIFdlIGFyZSBtaXNzaW5nIGRlYWxpbmcgdGhlIHNjZW5hcmlvIHdoaWNoIGxv
b2tzIGxpa2UgdGhlDQo+IGZvbGxvd2luZzoNCj4gPiAiY3B1ZnJlcT1hbWQtY3BwYyxod3AsdmVy
Ym9zZSIuDQo+DQo+IE5vdCBzbyBtdWNoIHRoaXMgb25lIChjYW4gaXQgZXZlbiBvdmVyZmxvdyku
IEl0J3MgImNwdWZyZXE9YW1kLWNwcGMsaHdwLHhlbiINCj4gdGhhdCBJJ20gY29uY2VybmVkIGFi
b3V0IChvciwgcHJpb3IgdG8geW91ciBjaGFuZ2Ugc29tZXRoaW5nIHJlZHVuZGFudCBsaWtlDQo+
ICJjcHVmcmVxPWh3cCxod3AseGVuIikuDQoNCkkgbWlzdW5kZXJzdG9vZCBiZWZvcmUsIHNvcnJ5
DQpXaGF0IGlzIHRoZSBhcHByb3ByaWF0ZSBiZWhhdmlvciB3aGVuIHVzZXIgcGFzc2VzIGFuIG9w
dGlvbiB0byBYZW4sIGxpa2UgImNwdWZyZXE9YW1kLWNwcGMsaHdwLHhlbiIgPw0KRldJVCwgYW1k
LWNwcGMgYW5kIGh3cCBhcmUgaW5jb21wYXRpYmxlIG9wdGlvbnMuDQpTZW5kIHRoZSBlcnJvciBp
bmZvIHRvIHRlbGwgdGhlbSB5b3Ugc2hhbGwgY2hvb3NlIGVpdGhlciBvZiB0aGVtLCBhbWQtY3Bw
Yywgb3IgaHdwLCBvciB4ZW4/DQpJZiB1c2VyIHdhbnRzIHRvIGFkZCBmYWxsIGJhY2sgc2NoZW1l
LCB3aGVuIGFtZC1jcHBjIGlzIGhhcmR3YXJlIHVuYXZhaWxhYmxlLCB3ZSBmYWxsIGJhY2sgdG8g
eGVuLiB1c2VyIHNoYWxsDQp1c2UgIjsiLCBub3QgIiwiIHRvIGFkZCwgbGlrZSAiY3B1ZnJlcT1h
bWQtY3BwYzt4ZW4iDQoNCj4NCj4gPiBgdmVyYm9zZWAgaXMgYW4gb3ZlcnJ1biBmbGFnIHdoZW4g
cGFyc2luZyBhbWQtY3BwYy4NCj4gPiBJJ3ZlIHdyaXR0ZW4gdGhlIGZvbGxvd2luZyBmaXg6DQo+
ID4gYGBgDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+
ID4gYi94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYyBpbmRleCA4NjBhZTMyYzhhLi4wZmU2
MzNkNGJjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jDQo+
ID4gKysrIGIveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMNCj4gPiBAQCAtNzEsNiArNzEs
MjIgQEAgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgY3B1ZnJlcV94ZW5fY250ID0gMTsNCj4gPg0K
PiA+ICBzdGF0aWMgaW50IF9faW5pdCBjcHVmcmVxX2NtZGxpbmVfcGFyc2UoY29uc3QgY2hhciAq
cywgY29uc3QgY2hhcg0KPiA+ICplKTsNCj4gPg0KPiA+ICtzdGF0aWMgaW50IF9faW5pdGRhdGEg
bnJfY3B1ZnJlcV9hdmFpbF9vcHRzID0gMzsgc3RhdGljIGNvbnN0IGNoYXIgKg0KPiA+ICtfX2lu
aXRkYXRhIGNwdWZyZXFfYXZhaWxfb3B0c1tucl9jcHVmcmVxX2F2YWlsX29wdHNdID0geyAieGVu
IiwNCj4gPiArImh3cCIsICJhbWQtY3BwYyIgfTsNCj4NCj4gRG9lcyB0aGlzIGV2ZW4gYnVpbGQ/
IElmIGl0IGRvZXMsIGl0IGxpa2VseSB3b24ndCBiZSB3aGF0IHlvdSBtZWFuLiBZb3Ugd2FudCBh
DQo+IGNvbnN0YW50IGFycmF5IGRpbWVuc2lvbiAod2hpY2ggY291bGQgYWN0dWFsbHkgYmUgb21p
dHRlZCwgZ2l2ZW4gdGhlIGluaXRpYWxpemVyKSwNCj4gYXMgLi4uDQo+DQo+ID4gK3N0YXRpYyB2
b2lkIF9faW5pdCBjcHVmcmVxX2NtZGxpbmVfdHJpbShjb25zdCBjaGFyICpzKSB7DQo+ID4gKyAg
ICB1bnNpZ25lZCBpbnQgaSA9IDA7DQo+ID4gKw0KPiA+ICsgICAgZG8NCj4gPiArICAgIHsNCj4g
PiArICAgICAgICBpZiAoIHN0cm5jbXAocywgY3B1ZnJlcV9hdmFpbF9vcHRzW2ldLCBzdHJsZW4o
Y3B1ZnJlcV9hdmFpbF9vcHRzW2ldIC0gMSkgPT0gMCApDQo+ID4gKyAgICAgICAgICAgIHJldHVy
biBmYWxzZTsNCj4gPiArICAgIH0gd2hpbGUgKCArK2kgPCBucl9jcHVmcmVxX2F2YWlsX29wdHMg
KQ0KPg0KPiAuLi4geW91IGNhbiB1c2UgQVJSQVlfU0laRSgpIGhlcmUuIChTdHlsZSBub3RlOiAi
ZG8geyIgZ29lcyBvbiBhIHNpbmdsZSBsaW5lLikNCj4NCj4gPiArDQo+ID4gKyAgICByZXR1cm4g
dHJ1ZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgc2V0
dXBfY3B1ZnJlcV9vcHRpb24oY29uc3QgY2hhciAqc3RyKSAgew0KPiA+ICAgICAgY29uc3QgY2hh
ciAqYXJnID0gc3RycGJyayhzdHIsICIsOjsiKTsgQEAgLTExOCw3ICsxMzQsNyBAQCBzdGF0aWMN
Cj4gPiBpbnQgX19pbml0IGNmX2NoZWNrIHNldHVwX2NwdWZyZXFfb3B0aW9uKGNvbnN0IGNoYXIg
KnN0cikNCj4gPiAgICAgICAgICAgICAgY3B1ZnJlcV9jb250cm9sbGVyID0gRlJFUUNUTF94ZW47
DQo+ID4gICAgICAgICAgICAgIGNwdWZyZXFfeGVuX29wdHNbY3B1ZnJlcV94ZW5fY250KytdID0g
Q1BVRlJFUV94ZW47DQo+ID4gICAgICAgICAgICAgIHJldCA9IDA7DQo+ID4gLSAgICAgICAgICAg
IGlmICggYXJnWzBdICYmIGFyZ1sxXSApDQo+ID4gKyAgICAgICAgICAgIGlmICggYXJnWzBdICYm
IGFyZ1sxXSAmJiBjcHVmcmVxX2NtZGxpbmVfdHJpbShhcmcgKyAxKSApDQo+ID4gICAgICAgICAg
ICAgICAgICByZXQgPSBjcHVmcmVxX2NtZGxpbmVfcGFyc2UoYXJnICsgMSwgZW5kKTsNCj4gPiAg
ICAgICAgICB9DQo+ID4gICAgICAgICAgZWxzZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0lOVEVM
KSAmJiBjaG9pY2UgPCAwICYmIGBgYA0KPg0KPiBGb3IgdGhlIHJlc3Qgb2YgdGhpcywgSSBndWVz
cyBJJ2QgcHJlZmVyIHRvIHNlZSB0aGlzIGluIGNvbnRleHQuIEFsc28gd2l0aCByZWdhcmQgdG8g
dGhlDQo+IGhlbHBlciBmdW5jdGlvbidzIG5hbWUuDQo+DQo+IEphbg0K

