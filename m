Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF45CA16836
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 09:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874821.1285199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZn9l-0008Mx-FM; Mon, 20 Jan 2025 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874821.1285199; Mon, 20 Jan 2025 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZn9l-0008LP-CW; Mon, 20 Jan 2025 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 874821;
 Mon, 20 Jan 2025 08:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiXK=UM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tZn9k-0008LJ-Ba
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 08:29:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e726a76-d708-11ef-a0e3-8be0dac302b0;
 Mon, 20 Jan 2025 09:29:10 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 08:29:04 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 08:29:04 +0000
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
X-Inumbo-ID: 9e726a76-d708-11ef-a0e3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVzf3dYVUcmju5InveuEvE+m9uouTi+bqQ9ih21Yh2JZ265da4jdql9ivD9I2JCVnXnQU2bxEuEVYevRYHvhTMN44ifwoZbfq80f8R8ws6GGd9plkKApAHe63gGO99P0tYipviPqjUopTrDjGOYL9bYirEAim7JjGAy2mOKD+PCww66tH3EJSpk8EgyKToISHRtq9n8ay7r59QBqK1Zoyl1J+FA37zh6Qxe2hheb5UN23CYuOld9YQR/B3YBXhbeWWA39ZH0v/aaNPPrkfKJSiMZQdONhfpAAyokHd1QMNveYiLdeu2UEK+QvY9P/7T8CJg4Tyr7/ft5ax7NRA/SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ynM/lfWoVXzwT4DZ6o9ktmrkPZFyJwLOwBQ8mbcao0=;
 b=Asf87K027yeGyXfly8jHRKkBOv0aKxfuBM42AGFKxVT3QK1aZYlCqt/TRkzQ+5f5c1PX8SchdfdKGRZUkrDdpKm4fhdRT8sy7McYlFXzkAxygms8GcPhkOPI36RJJKw1oCTKzm8c/RDkqqBUatP6um5OXbxhHJq0x6cDilYPDUALrbz7NkpCd8CGQc3VyxB2kQf63gJ6EQCpqmginXDckhEHK0m2VYXH/jAt0j2GtlHtWn6KaAhmFHGtowyLj5AcJXay9nYWQ/jzRXaxpefSpYVf0l4BDXyb5zCTt/7dnhi8koc54ta9VEg9wl1gFGanxg0Tuah1vWomz1IJMIInuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ynM/lfWoVXzwT4DZ6o9ktmrkPZFyJwLOwBQ8mbcao0=;
 b=yK+oAiOwc/I6H0nzLpVSHsD9Ocomp0OgCjj0R0dER9YVXaaznDyml2baccssLIAf23Mt5wWE6uAxIAFCSDjrtqrGev9NI47t+rauV5P/mLZElJ8I04FD5bzRrowoIhhphmv55DWfslZ1nTWUIwpfyLlT6gZaQYu1g1kk/PJW/74=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 04/11] xen/x86: get processor max speed from DMI table
Thread-Topic: [PATCH v1 04/11] xen/x86: get processor max speed from DMI table
Thread-Index: AQHbRVyYUn8JDdimHUmiK3WJzTytZ7MOc1iAgBEaM5A=
Date: Mon, 20 Jan 2025 08:29:04 +0000
Message-ID:
 <DM4PR12MB84513955738017284726E260E1E72@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-5-Penny.Zheng@amd.com>
 <69360d8f-61e8-4bdc-b7e4-be67dbdd719b@suse.com>
In-Reply-To: <69360d8f-61e8-4bdc-b7e4-be67dbdd719b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=01dcd389-e04c-4bec-9154-66fe2076012f;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-20T07:22:59Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB9023:EE_
x-ms-office365-filtering-correlation-id: 94d2f463-5499-4315-1b84-08dd392c8039
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MUtLUEFSQTZYWFh6YTgrQzlRUHhrUjZpSjd2TCsrWWl3S2FCZXFTcjQ2UVE5?=
 =?utf-8?B?TWJ1OW94NFRHZFRtOFFuenVxYWo4SURpakJOeXQzdXVIR1FVb1RYQUZRQVpu?=
 =?utf-8?B?aDQxUXlCUXlqT1N1b01oVzN1R2FDcDh0bk5TU09PUitBaWVDRnlkaHJmcGdL?=
 =?utf-8?B?bEJlb3hjVVNBM0pkY0tZU2Jqa1I3QkVnTFJsN3pXSm1ubDZTWWtZd3E5SGls?=
 =?utf-8?B?SFdWTkpnbUFCUkRyMzIvZzVlM3ljSzhISldZZHBvZnh3VzVKdzJBYWFxN3Az?=
 =?utf-8?B?WlFTcXNHWUFKbGpvNTZVS1E5K2dWUXJVNGtaRFZ3WGpSOEhQNGRrYTB5Mktx?=
 =?utf-8?B?QTU3a0k2dVRGWDhmeWlONklHOExkVnRFcnVFeDdCOCtLanBUd1NqenFrNk5q?=
 =?utf-8?B?K0JmM0F3b2Z5bTVrSEpnUHRZMHpIYlRaaWJzTG1CZUE2MjhSTHkxQ1lSR1Jp?=
 =?utf-8?B?dVpldlArTzJpaHk2VitPRlRXRTN3MzZtWWh0YTJDTFJqTkVUdUhuUENGS0xr?=
 =?utf-8?B?YXFib1JLbXR6TWdrQVRsR0xCZDhJNS9NdHMrWXBWaXIxWE1ycEdpZHFFMEs1?=
 =?utf-8?B?VDB3c3pzL0JGbXBIOVJTYlNWMzZmbjRnRTVhTHJQTHRkblZCNVlodWwzQ0o1?=
 =?utf-8?B?ZUJoMEp0SDJPUVhCSlUrMTZxZTRBaFpwN1VsZElQSlFHRjRMRGNZZzlFbVpp?=
 =?utf-8?B?M2VxMTNPaGdjN2hwbGZ3ekZyR0xOOVlFNEM3eVVIMnd4M285ajZxU0tIZHJC?=
 =?utf-8?B?NEdwV1dTdjQ1c0hxOE1KdnMzYTBoLzFrYUF1SWZRVGxLajlxMVJjMDhETVQ3?=
 =?utf-8?B?dHFpR0srTS8vNFV4MFFhN2h1ZTJEeGROOFcyUkFCSU55OHRhOEY5blFFT1Ni?=
 =?utf-8?B?KzhRczYzenJSOERRdzk3N0t2RkJSakNtbUVNSnRtQThXVkxkYTZjOEgyZmFD?=
 =?utf-8?B?U1FOYzRPNmkxTHlkZUx6dTVkR0NuaWVsMGY0RnN3aDV3TTRycFZtSm1oNWxY?=
 =?utf-8?B?cG0rbGhNdW84SzFrSm5GY0xjNGliTkZPdlNrdmg1ZGhBbit6VnI4TG1kNHcy?=
 =?utf-8?B?Q2xob0ovVjBDdUhORnBqM0dhRGxESm1NNGEvc1l6KzR0SjBmTGJkU2lBNll2?=
 =?utf-8?B?SXJReERxWDY2eUxPYnc4cDhtN1l4aUQ0cmdTR1E0VEJuYnR0Wkx0eW5MUnZJ?=
 =?utf-8?B?Z1JxTFQ5UnZWQmJ2YUtVblhKUmhadGtNZUJmMVNyRkZPOGtJYUZGazJRQ205?=
 =?utf-8?B?eU90ZVduN1ZVelZYRXNmdTMwS0J4OGFycG1IL0RBM3dzTmJjaFZFSHdKdEhX?=
 =?utf-8?B?ZmJYeVlxZkluU1VMd1Yxcit6QkhSQ1NBdnhlNGU1SkVzSTNWcU1GQWIxR3Rl?=
 =?utf-8?B?WVNteFQwdHU2aUI5d0t4REJhUnYyZW52d01jWHYzbEk3enozbTJkRTg0Nlgy?=
 =?utf-8?B?Ym1SVGNVQkkwM3V3M2tyTzFOaFBoNmJ3NmhYbFVWekkwWExQQ3p1YTVyeUZD?=
 =?utf-8?B?WTdseGhxaE5lSENJOFlNOXVQQVV2d2xUSEhsaDRtOUJkOHJIVFM5N2pqNUEr?=
 =?utf-8?B?dEVDOStEWWdrYkdGR1duRndMUkFaU0hScUtYZ1NzcnpTY3d0bUIwSjZ0NUZU?=
 =?utf-8?B?NlRqL0c2UU55WUw0aFk3U2hKZ3dHT0RlWnd4cU1IdE9FNzNURHJYRStTVlh3?=
 =?utf-8?B?dGhqQ3FvRzhnZjdVNFlpbkVCdE1mN1dUSlhKMVdQTmZRNHBhamxSUGl3b29s?=
 =?utf-8?B?VlRYWXd2cmJEQWl2YmRWZCsvaGZOcEhqbzJzWmxmMCtOSzFmMGI4My9IbUt3?=
 =?utf-8?B?YklSckx6Q3NjWlpIeWNMeHZNTmRjTHU2ME1kbzBjaEtUNDVSL2ZjRG9OM0pC?=
 =?utf-8?B?WGRweTcrcUdzT2grOU1Gbjd5WTV6NmhoUHNHL1lvMGdQdGtJTHlXMm93YUM0?=
 =?utf-8?Q?U3CZuavUEwS0w1mf6sIPoA7+XHBbzo8L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmk4bGpqUGt3QUYva1dONVRtSDU3WW1kWmpveERmTncvc1V1cjdEMVRFekt6?=
 =?utf-8?B?dEk2elVROUM4cFNlZ2E4OURGMWtCL2NtL09tMUlPZnlqYXZKZjZRYUk5NEs1?=
 =?utf-8?B?UXBhNU1jc0xiWXk1empiUStleVRKOFlCQ0Y4VUNkaHNUY09nTDYwQkFhbjdI?=
 =?utf-8?B?bEY3VzdtdkhjVE5Fd0lYUGlXWnpOdnYxZ0lEd2FiT3czOHMwRi9DMXlhaDlp?=
 =?utf-8?B?d1E3VVNqRko3Q3lQZWorQ0s1WmJDSmVTT1dJV1VuNGpRYmF1Zk1xcG9NN2ht?=
 =?utf-8?B?d2tmQzlCUHBYdUw4eTNsQlZBKys5aDFYVzh0YWR6SUN3WU9kTy9aWkpaT3pS?=
 =?utf-8?B?MnJqUHhBakFCM3N5c204YXlrVVFxQ3FYTTluaFVjRjQ0ZVFYODFiVlhVWHBo?=
 =?utf-8?B?RHlFUkgwZnhKZU5WOGozRlpUTU1mdUJrQlhqay9LdEpPUDNnTkZWblV2L0I0?=
 =?utf-8?B?N3lyR1EwT0Roc2gyZzMyaFdQVGJtRDdlamd1Qm9IZGtNbUM3RmdrS2xLdERX?=
 =?utf-8?B?eURrQVhxUGIyeHo3NDFSVW0zS291QmwwaTRJdU9FUlhtS1htMUxGNTFnRi9k?=
 =?utf-8?B?Y21QeEg4RFRJTVFoZmhqQThTVFA4QXdXa0liZmRTa09qZlBRMGZTajRDNmlw?=
 =?utf-8?B?ZjRsZjl1a0NXbkwzSGNvREhpTkM0aVdRK25NdGVVbmJIRElINWZPdzltZU0x?=
 =?utf-8?B?NXowMEcxM1BvRDJzQzZZbkMvZVMwNjNwVktPOTJSNFpheWJOdGg2TFVNVXlX?=
 =?utf-8?B?d1RRQVlkdWVvMFN3QWJ2eXZyV2N6cllqSVA5YUQ2TDJVSVVMMmtZNUhrVFhm?=
 =?utf-8?B?YnpyU2ZkajlOamN6d2IzMU5Sa1ZLb0dxNC9YcGFveEFLYkgwc2t1ODhrSFo0?=
 =?utf-8?B?Zms4aEsxYW05ekZJTVJ5NXU0VGdjdXdMSTJCc2pOVkV2MnRuUnZMWVQwOUxU?=
 =?utf-8?B?MzVHSUFVRVRFWVd2NkFhdXltaW9Qc3NhUUVNNDUrZzlmVDhUTFlVNDhYaFdX?=
 =?utf-8?B?WkZmQkdRbjlDdFhJVG1Lb2hwd3JmSnJkYjZEUTRJSDdIaGN6aEVsdlFkOExP?=
 =?utf-8?B?TzI0MnRCczBvejBzQWZhR3VvbGMvNkl4WHllZForNXI0ZENDSHVwOEhuaEM1?=
 =?utf-8?B?ZEJWUlBtTlB1eVNxd2tkVGwzQzlwZDA3K0VVVWhqN2l4OE9hM29XWjlKV3BC?=
 =?utf-8?B?bzBoVEorZ1l2TkRzcS9ZTGtXSVRSM0h0RUlkdTlJRGljQkZXcW1EQkR5WSsy?=
 =?utf-8?B?cGRYTmIyUGVib0JWMUNEZHVVaGY3eVpBK0xrUTl3aE5lMUltcHFmV01mQkwr?=
 =?utf-8?B?NnVGNS9vU0k0TWxWRSsrK1JjR1h4RStGSDEyY2E5M1RwdHpRM2FWb09YY0pl?=
 =?utf-8?B?V0FLSHEvcldCSytZSkNGRkJQOXlpNytPeXRhWFprSTFCdHdDcVdORkVFYm5N?=
 =?utf-8?B?dzZGYWRuM1RjaHUvTVhXR2xMUHZTaGxiR3crNlVsSDduek05WTEwVVZvYkNi?=
 =?utf-8?B?NmpUMStqOExiems5cnpyZlN0ajIyNjFOR09zRlJML3hncXF4eUd5RnNMSGNh?=
 =?utf-8?B?ejREblRIUEc1cEJyTklreG1ZWGsxYk5xaWhlQzZWbVprUlpIajA3eE1HTHhB?=
 =?utf-8?B?WHkrc1RaS1BodUp3c0IxOHFpSVhYQUJrQ1AwM1VQQ3ZLN1N3Vi9saFRrQ0tR?=
 =?utf-8?B?Rk9KcjNzSmpuRDE5Ri9hS2FNUmRDbXk4WlRxbzBHLzU4TlpyTllpeEt2YjBl?=
 =?utf-8?B?eWc0ZnZjMVUzM3JpeU1CTUJnK3NNdEp3b0UwMWliaVZYUW5EamhDRzYvbWRN?=
 =?utf-8?B?ZXNNSnlycGtTdExJVTJYQWdHVDNDTHdhUXZLb25oblBEWkdKWWNjSTNWVytI?=
 =?utf-8?B?VGFXMHFlN1BJYUNHc1dmNkYwdlcvbUtTUTZhdTcrZzBtNENqTWgyMEhqcmRi?=
 =?utf-8?B?YkFTYUJrRGMyaHlYSEdLaHRWWXhpeDBURjRkcklHbW12ekp5YTAyNjJ5dE5v?=
 =?utf-8?B?V0NpbDZreXZ6d0ZhSHNBMUN0d28zaElUK2tTbDRXTjZhRy90c00wRVQzTTNr?=
 =?utf-8?B?dXpkV0R2TTZMbHdsZFViZVFiOGFiSzdtRHBnM1ZCTGUwTVJjNUZQR2xDbFZm?=
 =?utf-8?Q?qKu8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d2f463-5499-4315-1b84-08dd392c8039
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 08:29:04.8575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BWYKPTVfRS6BnB6lG0nHEYt2P+VGDas4HUnbbmQrpiQDr4JnOf7nO80JzpRY0x/tNmkwc7LDCsssvLjeLHxHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDY6MTMgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4
ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djEgMDQvMTFdIHhlbi94ODY6IGdldCBwcm9jZXNzb3IgbWF4IHNwZWVkIGZyb20gRE1JIHRhYmxl
DQo+DQo+IE9uIDAzLjEyLjIwMjQgMDk6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFdoZW4g
X0NQQyB0YWJsZSBjb3VsZCBub3QgcHJvdmlkZSBwcm9jZXNzb3IgZnJlcXVlbmN5IHJhbmdlIHZh
bHVlcyBmb3INCj4gPiBPUyBnb3Zlcm5vciwgd2UgbmVlZCB0byByZWFkIHByb2Nlc3NvciBtYXgg
ZnJlcXVlbmN5IGFzIGFuY2hvciBwb2ludC4NCj4gPg0KPiA+IEZvciBBTUQgcHJvY2Vzc29ycywg
d2UgcmVseSBvbiBwYXJzaW5nIERNSSB0YWJsZSB0byBnZXQgcHJvY2Vzc29yIG1heA0KPiA+IHNw
ZWVkLg0KPg0KPiBUaGF0IHNvdW5kcyBlbnRpcmVseSBmcmFnaWxlLiBUaGVyZSBhcmUgYmV0dGVy
IHNvdXJjZXMgZm9yIHRoaXMgaW5mbywgYXJlbid0IHRoZXJlPw0KPiBTZWUgZS5nLiBhbWRfbG9n
X2ZyZXEoKS4NCj4NCg0KVGhhbmtzIGZvciB0aGUgcmVmZXIuIFRoZW4gSSBtYXkgaW50cm9kdWNl
IGEgbmV3IHBlci1jcHUgdmFsdWUgdG8gZXhwb3J0IG1heCBmcmVxdWVuY3kNCmZyb20gYW1kX2xv
Z19mcmVxKCkuDQoNCj4gSmFuDQoNCk1hbnkgdGhhbmtzLA0KUGVubnkNCg0K

