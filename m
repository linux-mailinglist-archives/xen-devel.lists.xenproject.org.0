Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A7B27E3A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083218.1442850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrdq-0006TO-TL; Fri, 15 Aug 2025 10:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083218.1442850; Fri, 15 Aug 2025 10:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrdq-0006Q9-Pq; Fri, 15 Aug 2025 10:26:34 +0000
Received: by outflank-mailman (input) for mailman id 1083218;
 Fri, 15 Aug 2025 10:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6Ka=23=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1umrdp-00069F-4R
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:26:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2412::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e4e28ab-79c2-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 12:26:30 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 10:26:25 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 10:26:25 +0000
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
X-Inumbo-ID: 4e4e28ab-79c2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASaxq9Wl6/wZUhHux0lNkAYuZ34xIqXgoF7LceMdrQ2HRK2roZSVhDxF+f03gK6zuOjBR2nOy+1nLmWCKQUfuEViIJUuob1dL8jJYYt0WTnRo7+CINIxqepIO0Lrygl50SpZSuoWa+AVbcck+pSPZwzXosGSrtXCOfkVfS+fdtTIKwaK6xC5uwFze2WbgNCcXb5sQAH2AC+FBiba1/p8/P+2yzErjswFFQp9HJCHQkLuS2ZKLOlf9dqVC/2ciT420+i4E/CWMtxIUhiBLBHfP710x9qmmzjvwJ6DK93jyY3hutoIpe6IGYwDHxo2HwDT7NA4booZCwpilLdYmgRkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq58ZRNJZvGKoX52oub8t7ukTUrSA/AVvQtJz1xA3Ag=;
 b=jqEDGwl4adwlpZMVg2aSmEV+YWWmrO3kU8ix30iwV6eDIpZvTdckuTWDr0SCgWVle5oobW+x2ghEz42+hgt49JsApEesWwDcNPcC+03T47nXIdYVPReL2EOd6RFM464AlpFqnsWufqoFGAQtod5OG/IDaum1LJE20FqVUwoSQYfW6x7vLQbQj4+ym/bhosYOSS8mgEHvl+u1BqOblm2WwKE9F2o8vvWrnrS4/kJQ3PIM8rraUBriuzqOlX7oXRvBibfi5cl83bT8QBSsKisV5iBgYUnvVtqheBaOr+vDmTlqbecZrgfRVliJ9M3X/gC6VnJsFfz4qGETmPG/KLVm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq58ZRNJZvGKoX52oub8t7ukTUrSA/AVvQtJz1xA3Ag=;
 b=c8g/wy/6Gpi1+q0a6WL4+m1v8OkRPoYsYuUcEC1ENl+GSDbeEvJFTTE87y3q4CbC1YWm4/xVPpGKy6pTK5vHHzDz+K7k0ccYvXmRiYM3brTxDFkjf2bVJcmbMjSUJTxEjuqjt4ji7RmKw3aq2hZn9YZxIjq/TPLPTSNHtprbZus=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Topic: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Index:
 AQHcBFu8ZJDiUyPinUSx+WVIYPWedrRSHgaAgAAiBnCAAW81gIAPKleAgACWNgCAAB1FUA==
Date: Fri, 15 Aug 2025 10:26:25 +0000
Message-ID:
 <DM4PR12MB8451846A825A3EEDA400690CE134A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-2-Penny.Zheng@amd.com>
 <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
 <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <3e20688c-c125-4aa4-bc06-1fe634550f70@suse.com>
 <alpine.DEB.2.22.394.2508141604510.10166@ubuntu-linux-20-04-desktop>
 <de30aca2-1840-473b-8995-fd58f2447c44@suse.com>
In-Reply-To: <de30aca2-1840-473b-8995-fd58f2447c44@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-15T09:56:48.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB8205:EE_
x-ms-office365-filtering-correlation-id: 2899e091-0aad-4997-3a11-08dddbe6304a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGdZQnZGQlRWbW1QaGVjaGRHS2tYa2lEemgxaHhYamV6YmxsSC9wdmtBVCts?=
 =?utf-8?B?VXpoTFRNMXFoTkx1blNHR2lxa0ZYSVRjSmJTYjl2bC9nTUxBc3hDVk1wK2Q5?=
 =?utf-8?B?dUJFUEFsZEFRcW85Ykc2UC90L0JyZWRrRVpaVSs3V3RJRngyOVNpMGtiK3Ar?=
 =?utf-8?B?UlJzcldhd0RIdTBDY2VxbmlDaUhkdkx2NWJOZGlWbnNSOWdnNXphMjZGQzBn?=
 =?utf-8?B?d3RrQkxwVUYwcFFXaFdsNm9ZTWZMT2xQZk0zNHA5NHNsbUN6anlBenhJY3JN?=
 =?utf-8?B?dW5JRm1ITWg3N3JqcllTZGdDN2hvTGRnR2wvWXlGamlZRExmWDA5Mjh4eUht?=
 =?utf-8?B?OXlFalJoT3A4SGNzMEM2WVd2WXdKMnlUVGRscVh4Zm5HTkhlYzJBYXFmdFFu?=
 =?utf-8?B?VngrMElVenpEcWhnZEpMV0diKzN2NmQ4dGZBSm14VVVXVUpUTHRGTWFDSi9l?=
 =?utf-8?B?USt4dWd3djZheUwwc3RqZ0pLeHNvZEwxa3hobW5FbDJXVzBYd3cvU2h4bWsw?=
 =?utf-8?B?VEwwS25GSlUwUE9MUDgvN3JWUVhrQWtlUzVQY1ZUQ0V5K2N1VVFpNmRta2hF?=
 =?utf-8?B?YnprekZWQXlBN3FoOFZ1c0t6dDRHWHMyOU4xY0hBQi9FTW5tRGhrOFkyTlN5?=
 =?utf-8?B?T3NYbFR3RnBROGQwQ2NEc1lBcVJDK1J0c09yNkR5MUxEVFBTZWZPSTkzeHVC?=
 =?utf-8?B?ODRCdldRYVM4aDlmcWdCVmR5UDZaWTRyU3M2SnA3anFkMmwxenV1SGRNdGVX?=
 =?utf-8?B?aFZ2ajJyUGIzUUZDQy8yWlJmSnA0aSsvVzJPU242eDJDeUVtNitZNEFQWU4w?=
 =?utf-8?B?RHY3dlVmZTlEVUZ4R0lveUJnNFY0R1p2VEREaWFLa000bXova3JmUExDM0NX?=
 =?utf-8?B?OFVwamErRjdvQ01CV2lxa1FLL3lmaG5nWllSRXBqV1pNZzdqRFFQMC8zNjhR?=
 =?utf-8?B?eUhuUS9SbjZsWncrcE5WN3dNSGxRLzQxREtCRlV1c1dwOHNobVJlZE5MUDJ1?=
 =?utf-8?B?WWxESGU2azMxdDdWUUMzRDkwOHNnLzJoMFk4YkpYbVJKYzNEY0MveFdSNDQw?=
 =?utf-8?B?WmQxYm9qSERqWnAxd1UrTGxsQ2xYMjI4R3NyUkpDbzFtMU52SUo0L0hSWXJG?=
 =?utf-8?B?Q3Nlb1QyTDN0ekd5KzZ1Tyt6M3RKcFlCOVdUQjVJclJSNGdNUXdBTnNZanJa?=
 =?utf-8?B?VVdNV3FyQWg0eDRZdTdiRG1GOGg0d2w0MWIzTGFOVHYyaUw0VDVzM0MxS3lm?=
 =?utf-8?B?RW9TeUxSOFIyY2U3TnFRbk93OGRhMlVURjkzeGhUZlZRSStHVUhiUng4YVhO?=
 =?utf-8?B?RVE3WGEwK0ZheXVSVDY2TDRKSmtvWXdtekM3ZFhlMUg0TGpXQzB6NDZOUm80?=
 =?utf-8?B?ZW9OWk9Rb01vQkpRR0Rqd2ozWjdxWjFveEw4aXI2UEt2ME5xUXVGZTdKWkNO?=
 =?utf-8?B?MzdCVThKZi9jUXJDUHBGZFZXb0xTK2pXWDlUNG5QSW1RUkcreEdaVmNnL3B4?=
 =?utf-8?B?VkZYdEFycnNyVzZBZ215TjNhTm1Pd0NPVXRQZE5kckxVUjcvYTg0dEV0Znpn?=
 =?utf-8?B?TVRMSlh2SkxBSDN1RXNuNjRiUEgrQmJjbUphYmZkQkdwWngzV3NQdWZMRk85?=
 =?utf-8?B?aHRFcm54UHVOYytYMzFWOC9RNTM3UWdEcjJ0U0N4OFlDOHVuc0FSTkVCSENr?=
 =?utf-8?B?dVZTRXhGN01oaytMcVByazFETU9zdTlvWEQxSXhzVWRxb0NsMkU5b0FzNHlY?=
 =?utf-8?B?WG5WMyt5bnh0dVpna2pGUUxpdVJiMy9KWkNJWlFKVFJTR1IyOFVRTnViNVhl?=
 =?utf-8?B?aEx0WUNsV2d2RllkeEZOM05SeUhEM0dFZ21sU0pwSjk5VEFrM0xTYVdRa2x6?=
 =?utf-8?B?b3pPd05OKzU5RmtEVlFGSmZNSmU4SCsyQjFEZCtzWTJHZGFobDR6aXZCS3cy?=
 =?utf-8?Q?4C8uUUSwNuQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXZtMm5rTUNDclBRckNwcUFOb1hMM1F3VHlEZyt2WkdDTnp6WTFJdTUrMzVF?=
 =?utf-8?B?d3VmbFltQ1FsZG83REFyNWEveWNPZDB0SkMzazd4cUdaSmpKcGh0ZHlmeENh?=
 =?utf-8?B?YUhLN1NLU0RUbSt2b0l3TGh3RGFCUnVRVGpJT09jY2JHRlZ0dDFqeTllc084?=
 =?utf-8?B?SVNTbzc2dXp0KzFXSDZYa0RuNmw3d1hLUUNXdXJ5QXVtbTkwRjViR01hRDQ2?=
 =?utf-8?B?WmtFRUZUV3FXUGpadS9OWFNpOU9hR3hkV3pjL1I3VjQ5bDVqUE1FblZRczBp?=
 =?utf-8?B?d0pIc3N3a0s3NUhOd3lnVDR2ckRTWjVxNUZidDgvcWdKU3gvSEZlSFpwaVhW?=
 =?utf-8?B?b2wyQlhMT1Njc0FGdmJreUJZaUhZcFU1VXZSMnJxVDRpc2Rha2Fod21nU0tV?=
 =?utf-8?B?QUROZ3VLL1dlVVoxcCtGcFlBVkJVSmNUZVgyWHZKY29uaVd5SzQwdTUwUUds?=
 =?utf-8?B?ZU8reEdrY0M0YmxManlXaHppNHBNU29uc3JvVnVYcnFRU2V0ak4wZDFGMlJa?=
 =?utf-8?B?NXkvTDAwVGVTZTVKd3ZYOU9JWHJ2MWFDVnQ2dTVQSmxwdVRIZjJOMVpMeXBI?=
 =?utf-8?B?N0dXVGZsWklNVnpPNWhNV1h1ZzdRV053bjNRNU5lTHJ4VFUvQ2gxcDFxTXQz?=
 =?utf-8?B?UmduS1FkR1dpaVVSTXhOdEJVTjFPQzFReTdWN3NaSWtBQVdIZm05VE4xTHVQ?=
 =?utf-8?B?K0xvTDNMV3NsVmhXZnFSVmNLcCtNVS94S3pUNWt6aDg3UU9ubVl6WHVJNHQr?=
 =?utf-8?B?NXdyODdyZmM2Zm81eWFWTGprZUg5YUlsSHRlQncyNnBrTmE3dXR3VFg0S0xJ?=
 =?utf-8?B?YmdOWjQ4WkNNclB3QUwyNkJOZkZjZTRWK1JKYlQ5eDg3N3RhNVpURGpLanpy?=
 =?utf-8?B?algySzZMUVpBUnNSREtRcWxTcFd0WTNjenNrYms4b3A1eUpYdFdrYVNJYlpV?=
 =?utf-8?B?Ymt4emRFeFZ6dERPckt0cFVQUHhudG14K2tSYkxmVkRRR0RLQ1dOOU5mTTUr?=
 =?utf-8?B?UTl5Ni9OVW9Ka2lsNzVqLzdpMnh4VGZURDRwdCsvektWQ2dZQlRYTjhZSkw5?=
 =?utf-8?B?RWlDVmt1WDBmVUlTZG5rOXZweVJYMnFkaS95Q2l2aHFGa2JYaFd4T1RrdC91?=
 =?utf-8?B?N3J6UkMzQ05tY1RyV0dabTRFS2drUjhvM1ZBWEd4SUxtWDZBMHJyZ1A3eXF5?=
 =?utf-8?B?RGNjTzBZNEdsUzVNTkQ1UlU1aFdHQzdrank0ME5hb3VTWkN3U2pYaFNPSDlW?=
 =?utf-8?B?VjRhWFRQcytsV0pkam1IUUJvYzNHOEpmSGR5S1JwWDZ3Qk9XNnZHbDZTUlZR?=
 =?utf-8?B?V1IyTDFVUFltem9RTjR0UURES3F6a2NPaEp1M2tzZ05zWXE1dmxpK0lzVHIz?=
 =?utf-8?B?Zmp1RXRkcUR5RDdzeE9OdmpxTU1NTVhEWERVVGN3d2FTTkxrdENRc08xekJm?=
 =?utf-8?B?ZjhncWRPMmo4TFM3TXR4L3J6UzdhRmt5bjREOVNFQXVtUHd3U3pHUEwyM005?=
 =?utf-8?B?OGhvZDlMT2s3akE1c1NqMFBkZmNaRXYxOEd2VnNwNCthOUw0bGZqY2hVS2xu?=
 =?utf-8?B?ODBmNmVPcUI2amVCeVZCMmxqMXlSR1U2T2wvTnhaNDNIdTN2byt4bWIwQ1lR?=
 =?utf-8?B?UGtEVXhUb0lic1FuQnFmYy9NNlN5TUxoL0RKdzdFc3dsYVFzN3NodU9WMXl3?=
 =?utf-8?B?cjMvOFFZWTFUTVlWbytBVUVTdk50aDdlb0Zzclg4eGxDcnlIZkdWUkoxS2Zw?=
 =?utf-8?B?UWdTZUVsK05XUXFycDFqQWtZK0hxNi8wZ1VNSDIzV0tKbXZiZnFlKy9pUHlM?=
 =?utf-8?B?V2RUenNvVmRzUlVWV2p4M1hXTlRicU16STBqL01manJhMlVFaG1jV3FPY1g0?=
 =?utf-8?B?UllwMlZKVlRiVkFjSW95NmpWOEM5UkVoOFp4RWRqVDUzT0lkaWxENk8vcDda?=
 =?utf-8?B?SWtMMHZiOXJQbnB1Rk5KSW5FdW0xL3BUd1dJbFF5U2tmUE5GL0Z6U1dlNWV6?=
 =?utf-8?B?bXZaLzdzN1k2ME1Pekd3aGpiN1N0WGxzVjhDNHU4TDdMQnVFV2wvdWI4S1Q3?=
 =?utf-8?B?V1ZkZUovb0h2SzFWT1J4bTd6RS9iMnBTK1ZSaGZJSDFITXlGYkJ0VjhUaWdx?=
 =?utf-8?Q?BSys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2899e091-0aad-4997-3a11-08dddbe6304a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 10:26:25.5423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D77mvVM3OBqAFftP0yB929A5mVM3aHFWSz41O1bYtN9g6z9kzBN2AEXABJmpjtU6M/8sgjNa5AolWel26ligAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDE1LCAyMDI1
IDQ6MTIgUE0NCj4gVG86IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4NCj4gQ2M6IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IEh1YW5nLCBSYXkN
Cj4gPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IFJvZ2VyDQo+IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50
aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFs
IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbg0KPiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MSAwMS8yNV0geGVuL3g4NjogbW92ZSBkb21jdGwubyBvdXQgb2YNCj4gUFZfU0hJTV9FWENMVVNJ
VkUNCj4NCj4gT24gMTUuMDguMjAyNSAwMToxNCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0K
PiA+IE9uIFR1ZSwgNSBBdWcgMjAyNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+IE9uIDA1LjA4
LjIwMjUgMDU6MzgsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4+IFtQdWJsaWNdDQo+ID4+Pg0K
PiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDQsIDIw
MjUgMzo0MyBQTQ0KPiA+Pj4+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+ID4+Pj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Bl
cg0KPiA+Pj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0K
PiA+Pj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEB2YXRlcy50ZWNoPjsNCj4gPj4+PiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1k
LmNvbT47IEp1bGllbiBHcmFsbA0KPiA+Pj4+IDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+ID4+Pj4geGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+ID4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwMS8yNV0geGVu
L3g4NjogbW92ZSBkb21jdGwubyBvdXQgb2YNCj4gPj4+PiBQVl9TSElNX0VYQ0xVU0lWRQ0KPiA+
Pj4+DQo+ID4+Pj4gT24gMDMuMDguMjAyNSAxMTo0NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+
Pj4+IEluIG9yZGVyIHRvIGZpeCBDSSBlcnJvciBvZiBhIHJhbmRjb25maWcgcGlja2luZyBib3Ro
DQo+ID4+Pj4+IFBWX1NISU1fRVhDTFVTSVZFPXkgYW5kIEhWTT15IHJlc3VsdHMgaW4gaHZtLmMg
YmVpbmcgYnVpbHQsIGJ1dA0KPiA+Pj4+PiBkb21jdGwuYyBub3QgYmVpbmcgYnVpbHQsIHdoaWNo
IGxlYXZlcyBhIGZldyBmdW5jdGlvbnMsIGxpa2UNCj4gPj4+Pj4gZG9tY3RsX2xvY2tfYWNxdWly
ZS9yZWxlYXNlKCkgdW5kZWZpbmVkLCBjYXVzaW5nIGxpbmtpbmcgdG8gZmFpbC4NCj4gPj4+Pj4g
VG8gZml4IHRoYXQsIHdlIGludGVuZCB0byBtb3ZlIGRvbWN0bC5vIG91dCBvZiB0aGUNCj4gPj4+
Pj4gUFZfU0hJTV9FWENMVVNJVkUgTWFrZWZpbGUgL2h5cGVyY2FsbC1kZWZzIHNlY3Rpb24sIHdp
dGggdGhpcw0KPiA+Pj4+PiBhZGp1c3RtZW50LCB3ZSBhbHNvIG5lZWQgdG8gcmVsZWFzZSByZWR1
bmRhbnQgdm51bWFfZGVzdHJveSgpIHN0dWINCj4gPj4+Pj4gZGVmaW5pdGlvbiBhbmQgcGFnaW5n
X2RvbWN0bCBoeXBlcmNhbGwtZGVmcyBmcm9tIFBWX1NISU1fRVhDTFVTSVZFDQo+ID4+Pj4+IGd1
YXJkaWFuLCB0byBub3QgYnJlYWsgY29tcGlsYXRpb24gQWJvdmUgY2hhbmdlIHdpbGwgbGVhdmUg
ZGVhZA0KPiA+Pj4+PiBjb2RlIGluIHRoZSBzaGltIGJpbmFyeSB0ZW1wb3JhcmlseSBhbmQgd2ls
bCBiZSBmaXhlZCB3aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YNCj4gQ09ORklHX0RPTUNUTC4NCj4g
Pj4+Pj4NCj4gPj4+Pj4gRml4ZXM6IDU2OGY4MDZjYmE0YyAoInhlbi94ODY6IHJlbW92ZSAiZGVw
ZW5kcyBvbg0KPiA+Pj4+PiAhUFZfU0hJTV9FWENMVVNJVkUiIikNCj4gPj4+Pj4gUmVwb3J0ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+Pj4gU2lnbmVkLW9mZi1i
eTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+
PiB2MSAtPiB2MjoNCj4gPj4+Pj4gLSByZW1vdmUgcGFnaW5nX2RvbWN0bCBoeXBlcmNhbGwtZGVm
cw0KPiA+Pj4+DQo+ID4+Pj4gQW5kIHlvdSd2ZSBydW4gdGhpcyB0aHJvdWdoIGEgZnVsbCByb3Vu
ZCBvZiB0ZXN0aW5nIHRoaXMgdGltZSwgaW4gaXNvbGF0aW9uPw0KPiA+Pj4NCj4gPj4+IFRoaXMg
Y29tbWl0IHNoYWxsIGJlIGNvbW1pdHRlZCB0b2dldGhlciB3aXRoICJ4ZW4veDg2OiBjb21wbGVt
ZW50DQo+IFBHX2xvZ19kaXJ0eSB3cmFwcGluZyIsIChJJ3ZlIGFkZGVkIGluIGNoYW5nZSBsb2cs
IGlkayB3aHkgaXQgZGlkbid0IGdldCBkZWxpdmVyZWQgaW4NCj4gdGhlIG1haWwgbGlzdCBpbiB0
aGUgbGFzdCkuDQo+ID4+DQo+ID4+IEFuZCAiY29tbWl0dGVkIHRvZ2V0aGVyIiBzdGlsbCBtZWFu
cyB0aGUgdHdvIGF0IGxlYXN0IGJ1aWxkIG9rYXkNCj4gPj4gaW5kZXBlbmRlbnRseSAoaS5lLiBh
bGxvd2luZyB0aGUgYnVpbGQtZWFjaC1jb21taXQgam9iIHRvIHN1Y2NlZWQpPw0KPiA+Pg0KPiA+
PiBBcyB0byB0aGUgbWlzc2luZyBpbmRpY2F0aW9uIHRoZXJlb2YgaW4gdGhlIHN1Ym1pc3Npb246
IFBhdGNoIDAxIGhhcw0KPiA+PiBhIHJldmxvZywgc28gaWYgYW55dGhpbmcgd2FzIG1pc3Npbmcg
dGhlcmUgeW91IG11c3QgaGF2ZSBhZGRlZCBpdA0KPiA+PiBzb21lIG90aGVyIHdheS4gQnV0IHRo
ZSBjb3ZlciBsZXR0ZXIgaXMgbGFja2luZyB0aGF0IGluZm9ybWF0aW9uIGFzDQo+ID4+IHdlbGwu
IChBcyBpbmRpY2F0ZWQgZWFybGllciwgdG8gaW5jcmVhc2UgdGhlIGNoYW5jZSBvZiBzdWNoIGEg
cmVtYXJrDQo+ID4+IGFjdHVhbGx5IGJlaW5nIG5vdGljZWQsIGl0J3MgYmVzdCBwdXQgaW4gYm90
aCBwbGFjZXMuKQ0KPiA+Pg0KPiA+Pj4gQXMgUEdfbG9nX2RpcnR5IGlzIGRpc2FibGVkIG9uIFBW
IG1vZGUsIHBhZ2luZ19kb21jdGwoKSB3aWxsIHN0aWxsIGhhdmUNCj4gInVuZGVmaW5lZCByZWZl
cmVuY2UiIG9uIFBWIG1vZGUsIHdoaWNoIGdldHMgZml4ZWQgaW4gInhlbi94ODY6IGNvbXBsZW1l
bnQNCj4gUEdfbG9nX2RpcnR5IHdyYXBwaW5nIi4gIEkgdGhvdWdodCBpdCBiZXR0ZXIgc2l0cyB0
aGVyZS4NCj4gPj4+IElmIGl0IGRvZXNuJ3QgY29tcGx5IHdpdGggdGhlIGNvbW1pdCBwb2xpY3ks
IEknbGwgbW92ZSBhY2NvcmRpbmcgZml4IGhlcmUuDQo+ID4+DQo+ID4+IExldCBtZSBwb3N0IGEg
cGFpciBvZiBwYXRjaGVzIGRlYWxpbmcgd2l0aCBwYXJ0IG9mIHRoZSBwcm9ibGVtLCBpbiBhbg0K
PiA+PiBpbW8gKGxvbmdlciB0ZXJtKSBtb3JlIGRlc2lyYWJsZSB3YXkuDQo+ID4NCj4gPiBXaXRo
IHRoaXMgcGF0Y2ggaHR0cHM6Ly9tYXJjLmluZm8vP2w9eGVuLWRldmVsJm09MTc1NDM4MDY5MTAz
MDE3DQo+ID4gY29tbWl0dGVkLCBjYW4gd2UgZ28gYWhlYWQgd2l0aCB0aGlzIHBhdGNoLCB0byBy
ZXNvbHZlIHRoZSBvdXRzdGFuZGluZw0KPiA+IGJ1aWxkIHByb2JsZW0/DQo+DQo+IEl0IGZpcnN0
IG5lZWRzIHJlLWJhc2luZywgSSBleHBlY3QuIFRoZXJlIHdlcmUgYWxzbyBvdGhlciBhbm9tYWxp
ZXMsIGxpa2UgYQ0KPiByZXF1aXJlbWVudCB0byBjb21taXQgdG9nZXRoZXIgd2l0aCBhbm90aGVy
IHBhdGNoLg0KPg0KDQpJJ3ZlIHByZXBhcmVkIHRoaXMgY29tbWl0IG9ubHkgb24gdGhlIGJhc2lz
IG9mIGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE3NTQzODA2OTEwMzAxNyAsIGFu
ZCBhbHNvIHdpdGggaXQsIEkgdGhpbmsgYW5vdGhlciBwYXRjaCAieGVuL3g4NjogY29tcGxlbWVu
dCBQR19sb2dfZGlydHkgd3JhcHBpbmciIHJlcXVpcmVkIHRvIGNvbW1pdCB0b2dldGhlciBpcyBh
bHNvIG5vIGxvbmdlciBuZWVkZWQuDQoNCj4gSmFuDQo=

