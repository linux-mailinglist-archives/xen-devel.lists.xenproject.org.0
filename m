Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA1FB9DF4F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130146.1469755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gul-0005Hh-Uj; Thu, 25 Sep 2025 08:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130146.1469755; Thu, 25 Sep 2025 08:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gul-0005FH-RW; Thu, 25 Sep 2025 08:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1130146;
 Thu, 25 Sep 2025 08:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIiA=4E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1guk-0005FB-Jq
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:01:18 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ceda7514-99e5-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 10:01:15 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Thu, 25 Sep 2025 08:01:10 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 08:01:10 +0000
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
X-Inumbo-ID: ceda7514-99e5-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2/jEchnOAv+g7rYOJG45sBSi9p2QqgzgRE9M3kHSzeVJtLLsnPkL8KWQfzAkm/nxglmNWAPmx1p3Cxy/lrGIY44jLklZ/iFPMTmY4ScmY/sWbjpsQGrGVxCr1ULnojfJyJdGcGGYtfoLwdLBj0tRO+ljNvD/xHmTvTJCv/Ia376kTLYbJ7WzSPNMFr57Yj8KAp6Q8wpQSXJW5gPfP+Hv55JwIa/rMyTwqvR2LjY2LsXPTeB52Ic493m5eebp6pTfYohnw0dqu/lhJZbesE+y67nrbjzZY68d09bXnQgeqbdWg8ycZdUlOYIkpSXQ2ylbwxpQNF5zMAZpOzH+uhSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf4IFhFuD8Di93RYEIE05Acw8s3Dm4KQr/5bJzi0AZA=;
 b=WebUqCwiV5K58QR7XwErtQkNmB2YQKgxDIkEvVvpf/6I5ajR2Q9PDHyWvxm/lDP0I84L7hbwkSJoKJ0+Jc30FpTMAkr2TNVyZia1cKKYwgtEdVjeEo+jr7VhsDvXE3TRXgYTP+r3Dfhu4avaUfgGA5bjR3aNiX2J/K5ptNQIyMYdSmxIvYAKDUte3R75OAJG7WlHN7iT94fI9WASGy2GYrlCdJ7ju6tBwC0m3qpfn+Z76ls6AC+EdPSYuenjrShXkQQV/NMMUIsjnfOsqjgjWsc2/OhsxLR9mpXiBA5OXK3t805g3srA47I646oS7qd2zqfyrP3mpY2hQzpu+uAisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf4IFhFuD8Di93RYEIE05Acw8s3Dm4KQr/5bJzi0AZA=;
 b=csHMq5mGq/k5VaithGgGoDFQjx6QD7WWqV2Vz13uB6RyzrL4nqWx2LP7RdW5nfD3GFJ77qGH4liNtcBoDskijnpmecj5jHXdm1AcvX/EF7avCcj5OhcAkIy+H4Fn49iBzVtO9TTuIccg27nxh/jkXgC+e1wlS+zbAa85dcuAYoU=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 16/26] xen/domctl: wrap arch-specific
 domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 16/26] xen/domctl: wrap arch-specific
 domain_set_time_offset() with CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYVha7/RUmVzU62kcSZyqSE7LSN2dWAgBXF6hA=
Date: Thu, 25 Sep 2025 08:01:10 +0000
Message-ID:
 <DM4PR12MB8451DA8988F4CE78F9F8A03FE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-17-Penny.Zheng@amd.com>
 <2d4bed7a-352b-4090-a07a-fd617e2f932b@suse.com>
In-Reply-To: <2d4bed7a-352b-4090-a07a-fd617e2f932b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T07:57:28.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4242:EE_
x-ms-office365-filtering-correlation-id: cc986f6a-2dd9-48c5-1fef-08ddfc09b0cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?emVlOFZrZktZQTE5VXZJRzI5MjREcFNPRm1EVzJxRy83czRUWDBPZUdwWHFR?=
 =?utf-8?B?VlhJNkJEcXNpbHZDZVVHR1RmU1UvTHBENFVjak91RzRLYnFBS0RVTnNZL1Zz?=
 =?utf-8?B?ZDk5RGRaY2J4UWh6YXVGekUzNzJEdWlOM2VNRU9wY0NEOHNxRkM2NUV1aEMz?=
 =?utf-8?B?MGRMbHBzamt3Szh0MW8yVXkzMUtoYUtIWnJVbGlORzlZMHo4S3ZXNkNhcnZl?=
 =?utf-8?B?TEpjZ0VZalU4eUVuRG9wSmhFSXVXbUM0NXA3bk55UUVodUx1THEzNWVUNWg1?=
 =?utf-8?B?cEpmK1oyYnoxMTlKeVhFVXFoVWR3eUZDTC9uejhLeGtvZ1VxSVUrUEJWdUVT?=
 =?utf-8?B?Ymk3bDVOOVBBUEJadDYwem5hZFRRSDNXNFZsTnI0UThhS1NGSndRWnRwRGVZ?=
 =?utf-8?B?ekRLSE1wQ2lxUnZXRmpIcmN5d05ZMEM2d21MOStraUYyVEhzV3I5Z0gxZDg5?=
 =?utf-8?B?bG5JV3pQTjEvQkdCV001RUhFSEowSlRmU3JwNjBWbU84cU41Z09BQ2xycURt?=
 =?utf-8?B?NmNiWkZaL1h0SDdaazEzamJvQk84OThyZy9nWmMxdUFvRWRGbnlBZHV1NUo1?=
 =?utf-8?B?Vyt1d2NWSEY1RmdnaHdZakZEc2lyRFQ2anR6LzF2K0gvSjlkaGx6dlRuUEd4?=
 =?utf-8?B?TEsvVVVmaGpscWo1bWQ4em9PN01FOXkydjYzZHlxQ3k5YjVhdTFxREc5WFNX?=
 =?utf-8?B?eTdHRDZ1MUtQcFEvUmJjRkllNGpablcyYmE5S1hiV1Ntb29sY3R1aU5ObVZ4?=
 =?utf-8?B?QTh4OTNXelVNSjUvN2F0NVdLai85UHVpeWVVYjVna3dhZXhVMFA5SHB2SHFJ?=
 =?utf-8?B?NDZEbVZhRnkrTkdheUkwL0xXV2NLMTBYOGVoemRiUTRkU2tMQjA1REloRDdh?=
 =?utf-8?B?ODJYSmFQcjkwemZmdkxwNWpYRlN1QndTMTcycXJISzV6dFJyelJ5T1lZNHJx?=
 =?utf-8?B?cHlqZDRleU5zendsTTNsMFhVNDg0QUJrMDNsbDVEb2N3NWZ1dkFlbDlaRU41?=
 =?utf-8?B?cGNxM0NrUy9NN21mVjhWUmRyaW1XMzI0SDlrMmpIRmlERXJIaW9MMnl1bHl2?=
 =?utf-8?B?em1MY05mbVBSUnNGTVNJQzRXM2NlaHFDRGdqODg1dVZ1eEo4TFRja1JYcHdo?=
 =?utf-8?B?NmNHOUVtWXpBbjdxSkpDWW5WWjVyUWlDWnNlQTFLVzc1aXA1NjFEME9zV3ZL?=
 =?utf-8?B?ZFFyQzNHVUpkQ2ZwR1hraEljckxzemVJZHc0cmVLZGpFVnlic1pzZ1V0VTR1?=
 =?utf-8?B?SVFXTzFsTTg0djEyWlZpWnZsRmFQNUFwOGwydHpleGxXNitYWVZ5cUZQcU5i?=
 =?utf-8?B?c3lMSXZERWhGWXhka0VPczBub0FWRHdCM2pKVkVBdjVaaU9Ic2FoL0NJSkFV?=
 =?utf-8?B?Vlk2T3JqNzVDZjNtTEwrWXpkUkQ0VVVjNzhobkFkNk94aGxCQWtCZkdjK0NC?=
 =?utf-8?B?ZEFReTNqQTduRVZGWHFCNUcveXFOaGVTakN3UWdETVpTNTMxcWJsaFNGVkM4?=
 =?utf-8?B?dDBDL0NJUG8rTElSdy8rSDhueVg0dituSDBMOUo3K3B4WjNtSSs3NTJtc0lj?=
 =?utf-8?B?VTk3ZkhHZkZ1ejNQc0R4ZUVia0tCRHVCbFAwd2hEbXhOQ1IyUnF0cVJxTzR5?=
 =?utf-8?B?WDdDZm5XN2NyZmF5SjhRd2dBUGdGRXp3MGhSRUpTZXZIc0JCSXdQc3Zzelp4?=
 =?utf-8?B?QVJ4QW9YWEp3RlB2anJudWVzNFpnRVFObGtBWUVlakFvZlRZQ1JIK0dsckg0?=
 =?utf-8?B?MDdXZllLeXh5aTlKa1I3RDRGQmJUUW5jRTk3N3F2MkMvYkcvM0IybFI2SDZF?=
 =?utf-8?B?cStNRDlRM1FjeTkvLzFSTCtPUmRKbGhVQmpxODBqMGxJOGV1eVRjZFdkSlhq?=
 =?utf-8?B?RDQ4SGkwT3pISXJsRjB4K01FeHVEOXhNb2ptQ1VxRU1zR3NzcFJEWURIMit3?=
 =?utf-8?B?QVpKSHJ4a0tKVThzRWFwcGV0b0c4OTNpWXpmL0ltU1RrOVR6L2xkWWJoMys4?=
 =?utf-8?B?NnN2T1Zid1JRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTBPSStQMnF6MHBFbnpsUG9IRkxOb1ZQK0xSaU16eks4cWx3QTlFeUd4eTFQ?=
 =?utf-8?B?ckxRcFdVMk5TdjJKTEMrSnBRczk1L01nUkdFNkUwVnVJZ2tzbkJtMkE5cnN4?=
 =?utf-8?B?QWFRdUdVNk9oMkxHdEZiL2sxeEZVbTJXNXRuSHZ5NVhYNmZNVGdLSXJ2bEll?=
 =?utf-8?B?RkZmeHJzdlBVUVloT3lpTlRjQ3N4TGhIMWNTL3lzRmhKbW5nWWt2ZHBRN0RL?=
 =?utf-8?B?SndMMU1xRmwvaktqUVRKdHQ4V28xSEZHOC9oakI3ZUVKTFlhTkQza1pIbk05?=
 =?utf-8?B?UGJXVHZhektXZFdFZVRIVkUzQ0lRL2J1eXIwdmc3Ujk4UkNyQm9HbVByVE1X?=
 =?utf-8?B?Yzl0TUpieFJ0emhIRVYzVWVhQkN6Qzk2Y0N0U0VmbHFBY2pSakxkYld1ekhk?=
 =?utf-8?B?TnNBRjBqVkF3MnlGTTJkeDZ1b0JFcmVUQTRpNWlFUGkwU1A0MFRoVEFIeVl0?=
 =?utf-8?B?RGdqQ01nNlFVOTJiQ2s2QWpXemFpclBab2d6WjNxMlVEcXZmQmpYS0FOZ1Ju?=
 =?utf-8?B?SisrNHpNRWhUcDhOWDhyQlR3L1dlUThTMXQyOTZUYjlQRU52L01scUxKcWha?=
 =?utf-8?B?LzhQYTQ2OEZ2R3AySUs5dG5VMTFydTRab1p2Y09qd2QyMlpFUkNRd0NKcVMz?=
 =?utf-8?B?M0k3QVpPRUNNcGd3L0huTmtHZk9CUHhPZTJncHpCQUNhUk5jY0FyUnlremJv?=
 =?utf-8?B?UG56cFMwK2JVU0ZUM1A1bzRYcktBRUZmdDFqTDVYUUVKWHFhQmpaT0NLTi9q?=
 =?utf-8?B?UVgxOEVvTmxuTUQ0TmxCTFZhblI1TjN6MlNMcnVlem9LVVBRSC9ma1c3NXU4?=
 =?utf-8?B?R3ZteW1tbkxFNHE2WWZPN2hLbVZlRGJ6ZThrTDlsbldIRkhnQ2gvbkMvakJW?=
 =?utf-8?B?clQ3akN1eVd0a2dnaUFqdE9PMm4rM2FPSEM1bUVUTlMzVmptNmkvdXdwM2s2?=
 =?utf-8?B?UVkzRTlManIrL0t3WXFPbGJJeTN5bXZWQi9mZVhQejAwY0NtQWdzMGZrVXBq?=
 =?utf-8?B?aSszeUFXZEh6aUJMWWFOTU42NGR4UWhjcER2T2QwMTViZkxDWEs1Y3hWREFq?=
 =?utf-8?B?Rlp5QUNRNmdtYWZ2d3ZOMmdHa29vdnRacGJKRFVhUDlxYTNTZFdsQkh2U3hQ?=
 =?utf-8?B?RkF3NzRGdFlLaDFZSlBRZ0F6MjlqWFJDOWhZRGR1UUlPZkVlVXk0NjFKMVlj?=
 =?utf-8?B?L1pkNU9WSFVjcUJJdmRVWGZKT0JTSVZkaUxEYk1LSkIzYXhSVWpTKzM4T2F4?=
 =?utf-8?B?NTNYNVhIRE5rL1E2blJ2eWhpcWN1ejdHRzdXRFkrM3BsNVZmaW5Pa1lJa1Rl?=
 =?utf-8?B?eWFPSGk3V1FCMkFkY2prbDZKMU95bUpqRWh5VEFzdi9NNEtjdjZCRVNKUFll?=
 =?utf-8?B?dkhCOXk1UDFjTlpXL2ROOWNFVk9aWUU5RXZUTFNkekFQTkdoZHVCLzZTV0hm?=
 =?utf-8?B?VEorSmtQZDQxK2pWTzNwVURHUDR5dXU5SFZEZDZmd2tVN2xuV1c5MjhkNTUx?=
 =?utf-8?B?NjNnRVR3Mlhya2lsZ2xTZUhDZlAza0RQV2tBaEpVMlN1RFkveXZXb3lZSnBI?=
 =?utf-8?B?Yi9kSTh0WEcxc005c3A0VTVoY25DNEQvMG1iSnhOYmJPZTd0d0wvNDBaZEhq?=
 =?utf-8?B?MkwybXRibGtxWmUvSjZyeUE4LzdMU0syNE5uQUd4L3h6eVoyalFTcldBUWk5?=
 =?utf-8?B?bEFhekx5WkJXQzdvZVBtK3BIdkFjdWpnNDduUmFqTUVYTTFKbHRXNVVDWHhr?=
 =?utf-8?B?eWR6TTEwdXZFSE9GaXU3anVsZDFKNnQwRFRpcWZsRFp0aWw1d2JvblFUZlJF?=
 =?utf-8?B?Vk5LWngrdHVJTjl3cTh4bVM5aUZML1VLN0pBUHlMbkt4VDkvSGdTcmdBWGRx?=
 =?utf-8?B?eGozZVhJWktzNjZ2WUtHc0lxZzFuTFkwRldqeDA4SzY3dmQ3bEx0SnZOajdp?=
 =?utf-8?B?Rkg1U29sOExBWnZaRWRLNjN6WERyRFcvRnZiemY3aGNSaENuK1duYVFrRHl2?=
 =?utf-8?B?UHdCZUc1bnJ0c2EzblM2c2xzRUFJd21JRVJLeG5ZdWw0SW5sMWVnMWkvRGJq?=
 =?utf-8?B?QTVybjVJcTlVRk1DaEFtaC90cWYrU1RBSDRsSUNlK0N1Q2ZENWxFK2hyYzZt?=
 =?utf-8?Q?+a80=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc986f6a-2dd9-48c5-1fef-08ddfc09b0cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 08:01:10.7522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5p2I1VZ6QI5qM3LGz3hNVnIISHPDLWQnmEF7aKHoUheTrTWJCfVf/7UheQcpAf0aHnUBZu1uIpNIlJLcldRGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjUgNzoyOCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDYzogSHVh
bmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PjsgQmVydHJhbmQNCj4gTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPjsgT3J6ZWws
IE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9s
b2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDE2LzI2XSB4ZW4v
ZG9tY3RsOiB3cmFwIGFyY2gtc3BlY2lmaWMNCj4gZG9tYWluX3NldF90aW1lX29mZnNldCgpIHdp
dGggQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBPbiAxMC4wOS4yMDI1IDA5OjM4LCBQZW5u
eSBaaGVuZyB3cm90ZToNCj4gPiBBcmNoLXNwZWNpZmljIGRvbWFpbl9zZXRfdGltZV9vZmZzZXQo
KSBpcyByZXNwb25pc2JsZSBmb3INCj4gPiBYRU5fRE9NQ1RMX3NldHRpbWVvZmZzZXQgZG9tY3Rs
LW9wLCBhbmQgc2hhbGwgYmUgd3JhcHBlZCB3aXRoDQo+ID4gQ09ORklHX01HTVRfSFlQRVJDQUxM
UyBXcmFwIFhFTl9ET01DVExfc2V0dGltZW9mZnNldC1jYXNlDQo+IHRyYW5zaWVudGx5DQo+ID4g
d2l0aCBDT05GSUdfTUdNVF9IWVBFUkNBTExTLCBhbmQgaXQgd2lsbCBiZSByZW1vdmVkIHdoZW4g
aW50cm9kdWNpbmcNCj4gPiBDT05GSUdfTUdNVF9IWVBFUkNBTExTIG9uIHRoZSBjb21tb24vZG9t
Y3RsLmMgaW4gdGhlIGxhc3QuDQo+DQo+IEFzIEkga2VlcCBzZWVpbmcgdGhpcyBzYW1lIHdvcmRp
bmcsIEkgZmluYWxseSBoYXZlIHRvIHNheSBzb21ldGhpbmcgdGhlcmUgYXMNCj4gd2VsbDogRm9y
IG9uZSwgdGhlIGxhc3QgcGF0Y2ggZG9lc24ndCBpbnRyb2R1Y2UgQ09ORklHX01HTVRfSFlQRVJD
QUxMUyBvbg0KPiBjb21tb24vZG9tY3RsLmMuIEluIGluc3RlYWQgbWFrZXMgdGhlIGJ1aWxkaW5n
IG9mIGNvbW1vbi9kb21jdGwubyBjb25kaXRpb25hbA0KPiB1cG9uIHRoYXQgY29udHJvbCBiZWlu
ZyBzZXQuIEFuZCB0aGVuLCAiaW4gdGhlIGxhc3QiIChidHcgLSBsYXN0IHdoYXQ/KSBpcyBhcyB1
bmhlbHBmdWwNCj4gYXMgImluIHRoZSBuZXh0IHBhdGNoIiBvciAiaW4gdGhlIHByZXZpb3VzIHBh
dGNoIi4gV2hlbiB3cml0aW5nIGNvbW1pdCBtZXNzYWdlcywNCj4geW91IHdhbnQgdG8gbWFrZSBz
dXJlIHRoZXkgbWFrZSBzZW5zZSBhbGwgb24gdGhlaXIgb3duLCBubyBtYXR0ZXIgaW4gd2hhdCBv
cmRlcg0KPiBwYXRjaGVzIGFyZSBjb21taXR0ZWQgKGluIHBhcnRpY3VsYXIgcG9zc2libHkgcGll
Y2VtZWFsIGFuZCBpbnRlcnNwZXJzZWQgd2l0aCBvdGhlcg0KPiBwYXRjaGVzKS4gUG9zc2libGUg
cmVwbGFjZW1lbnQgd29yZGluZzoNCj4NCg0KVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgY2xhcmlm
aWNhdGlvbiEgTGVhcm5lZCBhbmQgd2lsbCBmaXgNCg0KPg0KPiBKYW4NCg==

