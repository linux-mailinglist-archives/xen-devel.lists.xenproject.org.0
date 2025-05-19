Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA10ABB65C
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989604.1373623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvAp-0007eh-NT; Mon, 19 May 2025 07:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989604.1373623; Mon, 19 May 2025 07:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGvAp-0007cz-KX; Mon, 19 May 2025 07:44:35 +0000
Received: by outflank-mailman (input) for mailman id 989604;
 Mon, 19 May 2025 07:44:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGvAo-0007cs-KB
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:44:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1980e327-3485-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 09:44:32 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 07:44:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:44:28 +0000
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
X-Inumbo-ID: 1980e327-3485-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXY6/nrTwXdwCs3Vg8N/aQp9ZKAZkxXWcEYgitPFqsb595+1FdiCy3CA7rUL2tqSf2WkVkBctfKoEgnRvl+jGmy0pMv36E7wIh/MmjFlEgb8mJ9PKDZWIxQdLbw8qOEpSVJMpSgWffTYjKinZHXDHYkOmTw9icwGhH21CZmqk4Uy+ZD3RaNOszF67HPZ3PVuPyw5eZ2ss9P0lKJrQaD5N07+QG5DSHGQVna7JX2mK9qAZ75UfJJszJTUDVBiZb76TVSKvIK6IUT4LUwF2zmNiob+edaz29aPCRdOD4fceunbDIoQ2di0rE+OZ3dDLKi3Em4ndzu9Xv/WcBvlxNTnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxaQ6PtlbYk8raRyt3q373mOAZKq4W/vMpTGipk7u8c=;
 b=V2Y2UiLaaywemwHvQj8y/RcujjvGFRlcR0F7N7B9+xhjdjnhU5MJq0by/dfotEyCbs0UiIyScycmuytECFllUv1n+1pY1w45wJmmKd9L4ZE6EWA1zPTT3QB0KkcXTV367ogn2o/jaXHpmoEuyDIoeMw1QNcA83dej6Kd6wORhdujUvo395DiQqi2HZ9YyDp+LgHs3UF8s7Xe8cgE7IoMeuHVFFjrGJOJa5Eb6apyADcnlQriK3ozdmEdiZEg3Yw/H5D0eFQS9ZqcpQzv2srQvYmUkBQSG6Q/ISuSb3QlqmEeiEZ1155QvNEitAl2/wc/1KMQ4gRcVv+CNYDjBxMhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxaQ6PtlbYk8raRyt3q373mOAZKq4W/vMpTGipk7u8c=;
 b=5RChZjfcJm9j4WCHxc066csZrFidXzpe86rqWjm/DCo8BXgs6xq+zMnpuR6Sbl/YD9FH/Yv7fksrKCMfrwxLS6ZGbS+3aVVpppe45dhmPYIeSUcniZR0RSc4Yhth3eAyAjLF3tzJ3jLNlDvcFzU0qnfhivAeP9egi4G10t/DcbI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 07/10] vpci: Refactor vpci_remove_register to remove
 matched registers
Thread-Topic: [PATCH v4 07/10] vpci: Refactor vpci_remove_register to remove
 matched registers
Thread-Index: AQHbwMGiFe8O5wuIW0u6gzvdFdA3jrPZjXsAgACaRgA=
Date: Mon, 19 May 2025 07:44:28 +0000
Message-ID:
 <BL1PR12MB584964FA7FB4CDD2207676E0E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-8-Jiqian.Chen@amd.com>
 <7129d506-b03a-4f89-8128-84b8befe8799@suse.com>
In-Reply-To: <7129d506-b03a-4f89-8128-84b8befe8799@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM3PR12MB9286:EE_
x-ms-office365-filtering-correlation-id: 37593698-957c-4bf2-fd47-08dd96a8fc2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U3VHTkptQ1lMZ0IzNnBsUXlYYmdVUkM1QjdPUzM2ZzlmWXpNRWZsWFBvZkJU?=
 =?utf-8?B?VmFxdktHU0dodUtzcHNrSERFNDZvaHhTYmNMdW5jSE9kaU1Wem5oZUtCaERN?=
 =?utf-8?B?RUdIMzF3bnd5YzMwVjBjSTlZTFBVa2NybmkzOEZ0RXFPVDdoOWZVUkRBYysw?=
 =?utf-8?B?WTdsYmYrWFRBcUIzYWVKMDNNeVpoV3M0dzYvcmZFSHBuMGVPMlFTVlZtVFM3?=
 =?utf-8?B?UGFjUXM3TS9ZOHoyNzZGN05pQWc3VXRYRWJmaGxjM1VlbTdoUmVLcCtMek1Z?=
 =?utf-8?B?ay9GL0NNOVJ4QXlEbTZRWlRubUpoMHJaRXQ3WlM5MXY1V0RtWlJDek1YRHQy?=
 =?utf-8?B?VkdjbzVKbkRVY3VTeFhBMjF0SXJPMVUyR3F6YllxTkVscmtjQ05WMEVMdnFo?=
 =?utf-8?B?djJCdnRvR0EzaGY1QVJUWGpvR3hCVDNMa0Rvd2VLakhSZ1JKcERsU25FVGVk?=
 =?utf-8?B?VlNWUEFnSkVGcFVKbFBtbjVVZ1ZOM3A3RzU4ZmMzL3pZL0xtcHkrbHdCR1Bw?=
 =?utf-8?B?RStnZHl1WG5kTDBVWkJ5OFRHYzZQTUtiTmtRTHFCNlp0QmU5QjFvck9qbE1o?=
 =?utf-8?B?WEhFRUZmQkxTQjN2UU84cmttUDlZd29Tc0ZTeHFsaElTZjF5QVEwMHo2SHdi?=
 =?utf-8?B?dno0Mmp3cUR2eDlFd0hLRkFka2FISzVJT2NWWTgzZGdlaGJneGZRNWJ1THRL?=
 =?utf-8?B?SmYyN1YzU1dHekxyRlpYY3FKdGtHWm9QQ0RQRjU3amp5a05MS0pGWm9EWHhU?=
 =?utf-8?B?Z0xiQVI5U2JDdTloVFBLNUJ6OGlOalBDLzJHTmJST2xzMVZlNElGci9HelZ0?=
 =?utf-8?B?Y1Z4YjZRTFgvb0ZKaXQvbDF3MmFjOGtZTWhZRC80M2Y5UTlJTjdNcHhpVUpI?=
 =?utf-8?B?ZlZjdFNrRUhQRm1MNW9ISm1WSWtIOGVTQUhNN0VySnNJWFQxVkM2Qnd3M0Vy?=
 =?utf-8?B?d29WN1RWeDJRcHc0OWVyRHJRdlM2OS9yNXJPUi9ZbENKNUpxdVc2eStkb2Ja?=
 =?utf-8?B?MHRhMGRwQ0kwUFd5d1BvSFJMTDA1QlBmWlFSdEhkNmpacndPa0xvaTc5Y0dH?=
 =?utf-8?B?Y05kMUNZeEJSMkRkdDZzWkNBdFRQbGd0L1VVejN0R0tDeXhPL0pjZVFUYXB2?=
 =?utf-8?B?UXhLZ1c5eVRGS0xZN0RobStrN0hIVEJZcFFiZGl4MjQxc2IrdzJLa3BERnBW?=
 =?utf-8?B?OUlkTWRMQkZxR1hOeUxXekhDVVdPbXpwbnhkWG82dGJ5UDdaZVlMN3EwU2dX?=
 =?utf-8?B?a3NnaktldVBhdEU4NG0rKzhSSzlIVDdGMUVxT2N6bWI4NVJuQk5BbTRLVE96?=
 =?utf-8?B?UXV5TVpvVDZaSnNiT1FWTlk1cjVKdldEUzF5djFOV0hPU1JxK2JLd2d6dnVG?=
 =?utf-8?B?OHdLa2NnMmZFSzRtZ1Y4YUZGSi9aZittWCtscnRYRE1lQkhXV2x1SWxuQU5u?=
 =?utf-8?B?enNVd0VmREIvQjZmZVNkaFEwajI4SEtTcFMvQnYySnpSYVNudGNQWW5SVEVL?=
 =?utf-8?B?SmtUK09HclNFTFRMRkZxY3RuOWhGWHROUnU5WWdQRjZNWmlFUUxsVlVvVFht?=
 =?utf-8?B?TUhPaW9tclZPSU40am8xa3Q2bkgzaGtPVXZOWnQwTHdLUm5ETTYzRGtBWk91?=
 =?utf-8?B?SUp2bUlGTGw4V0E1Ykg0cCt3TVdRSlh5Y2dnL2J2UHpFWHJDUkk5Y1Z4Nk5O?=
 =?utf-8?B?bk9YQ0JYcTdMeFFmbDdYb3VzWUI1RUZxZ2pmQmFHMkRGV05aNUh5elRNTmdh?=
 =?utf-8?B?eEF3amRkdEU4VEh6K2pPcEZUQm9JZUtaalVObGx1VnMzNjl0VGpXaFlkaGVu?=
 =?utf-8?B?WXgxbWhScFVpQXQrQmtUZ1RyL1MyT3ZaK1d4emNGVUQ3bmwzWFIvMU50SFVn?=
 =?utf-8?B?NWlpTUNzMUpLRkdmWElXamxqK0hONHArMTh4dEkwLzJsYnljRGJXcHJsVVU0?=
 =?utf-8?B?NFFIWWxCbWExLzVrT2h4Yzg3b0F4Y1NZZTRoZ0loMHlVVWVTZDAvK1doU2gv?=
 =?utf-8?Q?TXE5sjE5E8jmyLsEAJN1RiEdL2bjs8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEREL3VydkhiTFY4bytBVmp2TnVmS0pnVllYZ3BkNlIvbnNOZ29BekNXUDVy?=
 =?utf-8?B?TU9KVlkxbGdUVitUaEk5Z2VvTnFwWDVvMzlnT2hRVW9tc2RIZ0VteWt0dmU2?=
 =?utf-8?B?T0x0SU53MVlyNW9uaGs5ckJKcHFrNnhnVUNkTi9PMFRNRExBd0Z0ZkNJQzJp?=
 =?utf-8?B?eW5lUEJSenJ0dkcxOUVueERrWW15NW5ZOVg5WUxFa1pKY2dYc3M2cE5nNCtI?=
 =?utf-8?B?cG1abWR2aXYvY0VmdDViV3h5R3haVGd6WjhIdXczK1RXSEI2OE0vVThDbDBV?=
 =?utf-8?B?YnlsckcwT21CVkl5eEJpbVp3MkNRSW9BVERaTnpnNmlGRVA1SVlIWU9rbmxI?=
 =?utf-8?B?UktsUmM5blJ1b2VWblVuVGFIKzFzbjlpaXVOQTdIV2pLcG9Jam95enBwY0pB?=
 =?utf-8?B?R29paUZzaHZVa3pzVEJ6TUl2Ukc2bmJhb3E2ZnkwaXZISHFKMzA4azFpQWxF?=
 =?utf-8?B?MTcrME80Y3RTLy9qclo4RE9kNE9rbUZCbDI5OEczQXBWa203dzl5Vk9Kb29M?=
 =?utf-8?B?ODNuWkpXVUYxZXM0RlZ0MDNrZnJYaHF4NHQ1OStST2R2UlM3NzlGTmJtSGJs?=
 =?utf-8?B?bkplQ29XZVJvN3ZDYi82cGJ1SDhaTVdpRGhMbERTV1lOZW0rTU9PY0k5akxr?=
 =?utf-8?B?NCt1UXJicWl1K2xETUNUUUVBQ1N2M1gyOUFSQjRIUHpTZm9YL0tQRG9jQ2tp?=
 =?utf-8?B?K2l3YmRCbWNPL1RJTmdOSnhpWWRBRlRCZ01mYU1Ncm5BUlRGUDRPYTBCdHpX?=
 =?utf-8?B?K1FjajUxdGNjU2gvbmZqeCtHdVV1VWp4Uy9OWHdoTU56K1N3MGpma08wdmhq?=
 =?utf-8?B?Mmh5MGJDbk12OHdLMmQrcmwvbFhaU1JTaFRmTUcrVHpXMlF3YStBT0ZwWTBW?=
 =?utf-8?B?RlEwM29Ccm5nckdxd1dCVnBpZkJKZXk1bkhNMlBXNlBtNTY5S3RXaC8vWmky?=
 =?utf-8?B?NHM5MjZSR0ZLQmNiZ2Z1STdlUE1KSlBPSHIrY29EYm5YQ1JIaEdCajY1bGpl?=
 =?utf-8?B?Rys2TmJKRWFJdElkS3Z0MXVKT1N0N0hITjFEc2g1RnNtdzNTU05NRENiVDVV?=
 =?utf-8?B?TjkzeFFmdVJXWlpXSG5zS2hNNzI2UEZ2WFNaODhMMlNnSEZqdWlwT2N4S1J0?=
 =?utf-8?B?YXQ2RDVBM3g0VmoyOTc4M2srOVM4VHJGVlYwNlJBN3JUTEdJc2pUZlJ3WUV2?=
 =?utf-8?B?WCtpRVRvMjJXc0NXNFlGM2dZeVZFZDU4b01JUHVhNjgzTkhob2RrdlpYNlRi?=
 =?utf-8?B?UzhmTHlBNEVTbGJ4STlLOEEvaDhvVnY3ZWFTTDdKQkg3YnFkUy9WUmJYdzlr?=
 =?utf-8?B?Z1Z4U1QwZWVLc2RwU1Awdk9TQnNER3RsWExhY011b015VnlKMGtGc01JU25I?=
 =?utf-8?B?TjFyeDZHZElzRTVaR0k1amlLaVVJZWY2b0VaWlZOSHpISEFJUGlFQTNTbnM2?=
 =?utf-8?B?czFUT2J5eEpUS1M1QjRCcDBCYXV6bTdoZm15MjRUZTRxQU03eDE2L3Y4UmdD?=
 =?utf-8?B?MW50c3dqZ3NlTXNvNGx0YVM5L08xZk8yTitpT0ZSMWVMV21YdHJHN3lveGxY?=
 =?utf-8?B?UjlubEM4cnU1azFMeWxtMk9rTFBDSlYwSWg1a1dWQ0JJU2ozSnp5bGpLVlJY?=
 =?utf-8?B?S2V0bkJYSmhzNVVadzYwWGIzbmEzdC8yUUxZR0wxbVJCTm5tMGswRHJza0ZF?=
 =?utf-8?B?dXhLTEk2RUVPK0hJZDg0eHh6bGt2azhqTGRlTG1rYm1KaHFNelY5ZUlSY0o5?=
 =?utf-8?B?V1MwZkwxRkRSWHNEZGk5MWhCTi9JbzV6bDNKZkNudk1IVUY4ME5XUlE4eGlX?=
 =?utf-8?B?bGx2czhrdE0wRnYwWmVXT1I1VkFtbVJucVFnSU9qTGRRRU5NL2gyR2ZyRnhp?=
 =?utf-8?B?THlWS2YxVHpiYS91ZmdZVGpPSUhzNkgzVnh4Yk40aGJGc3VOeGNWMmhRa3Bj?=
 =?utf-8?B?MnlpN2RVR1JqemV3OTkwNEU4dUNyT0xEN2NDK1hQWWlCMTlJd0J2WVZXOFZH?=
 =?utf-8?B?MXFvUlh0a3Q3RFFoVHQ4UVV1Q0dZRlJwMm14SWZpRGpHaitrK0hqb21NZW1l?=
 =?utf-8?B?V1FUNFJxVWxlWFFtUXdkY1pLQnVHTWNpU2hReGR3d29VTTRHTHJjc1ltMk5G?=
 =?utf-8?Q?zwL0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <775EDD7F0B117E4E8A345384CEA96933@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37593698-957c-4bf2-fd47-08dd96a8fc2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 07:44:28.5729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6TmfM9/gRsg5i7zPms4Ve/JkWb7gCo9WpwTs8pO3rVWAFdp9+Qt80rV+xiqEN/+DR6uxSgL0oyYGBRxyrdrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

T24gMjAyNS81LzE5IDE0OjMwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiB2cGNpX3JlbW92ZV9yZWdpc3RlcigpIG9ubHkg
c3VwcG9ydHMgcmVtb3ZpbmcgYSByZWdpc3RlciBpbiBhIHRpbWUsDQo+PiBidXQgdGhlIGZvbGxv
dy1vbiBjaGFuZ2VzIG5lZWQgdG8gcmVtb3ZlIGFsbCByZWdpc3RlcnMgd2l0aGluIGEgcmFuZ2Uu
DQo+PiBTbywgcmVmYWN0b3IgaXQgdG8gc3VwcG9ydCByZW1vdmluZyBhbGwgbWF0Y2hlZCByZWdp
c3RlcnMgaW4gYSBjYWxsaW5nDQo+PiB0aW1lLg0KPiANCj4gR2VuZXJhbGx5IEknbSBhIGxpdHRs
ZSB3YXJ5IG9mIGNoYW5naW5nIGJlaGF2aW9yIGZvciBleGlzdGluZyBjYWxsZXJzLA0KPiBidXQg
SSBndWVzcyBSb2dlciBhbHJlYWR5IGRpZCBzaWduYWwgaGUncyBva2F5IHRha2luZyB0aGF0IHJv
dXRlPw0KWWVzLCB0aGlzIGlzIHN1Z2dlc3RlZCBieSBSb2dlci4NCnZwY2lfcmVtb3ZlX3JlZ2lz
dGVyKCkgaXMganVzdCB1c2VkIGZvciB0ZXN0IHdpdGhvdXQgbXkgc2VyaWVzLg0KDQo+IA0KPiBK
YW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

