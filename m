Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC06B22439
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 12:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078549.1439584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullys-0001bt-V5; Tue, 12 Aug 2025 10:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078549.1439584; Tue, 12 Aug 2025 10:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullys-0001Ym-Rs; Tue, 12 Aug 2025 10:11:46 +0000
Received: by outflank-mailman (input) for mailman id 1078549;
 Tue, 12 Aug 2025 10:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=54Z7=2Y=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ullys-0001Yg-0N
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 10:11:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2412::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be30e988-7764-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 12:11:44 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 10:11:39 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 10:11:38 +0000
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
X-Inumbo-ID: be30e988-7764-11f0-a327-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpEZeY6l6/ZFDXlTH2FMCkTqkm9N5udSKeXDrh3/lT2HHK26xHPbomS7GfLQHtot812TNANzdMiC8BeNtf7W5s2N9eBCbVTzBZZgAG0wijeOBVJIkIc84HvXkQiGXZvou/2WvZRcmwKiJDiUQbiJh10cD3D3dHBmCo3u554AT70Ubm+GRHsIlMqeir0fHI8SzorH80prdJAot3wlMTpUljT/k2YbxuYDZKQJEJc5ox3iS8vLq8ubfryDSKz+HKIAc3IHQzypQ//DRVNuEJ+rNn5tirSQWZ6OLLpo86o52LjkrcMwDVT0AFpibZeDKqGf/emR1k50trdd1pCP/FdPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5CqrD0QCpyvn3rtMOXG9B+nPojapx8fA1Mxvt8sxQ8=;
 b=iDfaWWKPxEmzJmD8iaOTpKKcjcY4pQMmsSKrpW5JzenlF4Q5+I00S0wnESCebW14P44DhieWrLBOZ6Jeb+0xIphTsqaO8b35F9vw2KLUISCc3KZr/A7ayb0v0+03IUYwUqrEdQshuGcxsnBV4zNnlKJdTQeFO3c+HAXNmjNVaIqpyIuiv0ZFAXh3qgBKDe2hiUJ41BL3xe1LpGEQ8IbyvY1SRQNvlmewkVHblVp/5eSQHxW+8cZIFMPiSqTxk1PfxTmB1TuVuqH+kKG844o07ERX82i6U0dtMMBPUdAHxKE5Hn8UCwQ5mLR5EkovRhnVWAlHgevJ+pHcbNVOU2POLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5CqrD0QCpyvn3rtMOXG9B+nPojapx8fA1Mxvt8sxQ8=;
 b=NzZM/o3tAahlKWbuborMKTYIDByEKSpKesHoxqTezI+62Lcyp2C+JdAKCg2YxXtCRE9WdoSumWpiTCJoS5WCh/iKgL6n4j+EqkK/RwrT+fRvB/C2e1i4K+PtwL97mc2W1geR0ijNTHwlGipI2qm6Umdtmwheama52YkW3zf/De8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with
 CPPC-related parameters
Thread-Topic: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with
 CPPC-related parameters
Thread-Index: AQHb8hcn+tWFoATVBE6qNhfRcQLSnbQ/8H0AgB8IiuCAAAT3MA==
Date: Tue, 12 Aug 2025 10:11:38 +0000
Message-ID:
 <DM4PR12MB84513774A96C9A3E9A95BAD2E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-16-Penny.Zheng@amd.com>
 <9df16790-268b-4221-87ec-829ab4446872@suse.com>
 <DM4PR12MB845130C5A928F8B36DA5C4F9E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
In-Reply-To:
 <DM4PR12MB845130C5A928F8B36DA5C4F9E12BA@DM4PR12MB8451.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-12T09:56:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH1PR12MB9599:EE_
x-ms-office365-filtering-correlation-id: 804bbdf0-1757-4622-f52e-08ddd988a06d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QjNHTVp2cFFhOHM1YzdDSmVET1BvTWFqWjFJdGRwOFowR1RVeTFIWi9ZWFVx?=
 =?utf-8?B?YXNmUmErK2xlUm5QMXJOSmYxY2JTeCttejBERjhyRGNmcURoMGRrOEdsM0xn?=
 =?utf-8?B?WGVoRXE4UEFLSU4yNGUrcEJrWVRnVTZ1QUVySGVTZjZwUXBlMnN2c21kMHhF?=
 =?utf-8?B?RUM1b1pFOUlvZzREdjlKWXNzbGRHZTZFQjlWakduQ1BYVWlpdHpRZ0hUQUVE?=
 =?utf-8?B?cHBCeEM2cW1YaHgzVE4wc00zcTRJRm5TdVJmV2ozUjBubUxMRXFUME1XZGhi?=
 =?utf-8?B?ZXNQVG9FeUlFK3VWOFJJWDJ4ME9jUHB1WnVscHJDR2lwOFRGSmFoZHVxTUEv?=
 =?utf-8?B?aWZIb3pyK2dDdmg5SWVMZk15WGx6SURvSTFoSTRDQk9kTThlZmNTc2Z1K0RM?=
 =?utf-8?B?WmFzYkJ4d2xaSktWZlg2Zk1rZUFuN1ZoQWhpY3BtbDZhL0NtSERJQmNONHVj?=
 =?utf-8?B?QitSNVphYkE4OWN1VTlkdlFldjBqcURNZVhLakZhZHZsV004KzQ0a1RzdkxW?=
 =?utf-8?B?NzQxM1hlb1RqWGgzZSs3d2Y1Y0I0TnhrQjB3d0t4eDFyM2U3YjkvdUVMUElR?=
 =?utf-8?B?U1FmSDM3M2tyVXAvbkJMWDE2aExlT0ZkeWFvYnU5NzFlR2FlbjczTHJCeGZx?=
 =?utf-8?B?K3F4RzlxVTV4YVZKaVdVVkZoYjFVdlhxRnpySDNMaGNGVEhXMmtyZ2xmNnU2?=
 =?utf-8?B?UkhsQyt0TmsyNlBmWjB6dUVtb3JxSVBERWp1WWNpSDNCREIrSE50bWt6OGtP?=
 =?utf-8?B?cmpxWEp0QUtZRnROZWZFVFhxZ0lNOHVLMzNsZlVlYzUvRmZnSFBMVTEvdzAx?=
 =?utf-8?B?MVNkMm1ZZENhNE9JYWp5ZVBaQythOEFyYjc0dU9GN1I3QS9tUGF6ODNIdFNK?=
 =?utf-8?B?QTNyZWFmbzNDeUVRc0ljR0cvNnBrWlo1MjhWYk9rUFgrdlV1UXRoR2N5eHhy?=
 =?utf-8?B?QmhBdytkOThHaW1OV0xiTjRGYVhzazMzdEJQZC9YWVBTcnNPaUw1MkNiOHBl?=
 =?utf-8?B?SUNaL0toV2tYOEhzN1cxcEtZeTNXQWl0WElKUmMycmpkcjFpTGpGNjY1ZDFs?=
 =?utf-8?B?R3NTeWMvQ05JZTh4ZkVNSnZRTGJ5YTBkdGVMOFJJZ0dQOXFrNDBqOHA5OEJj?=
 =?utf-8?B?VEMwWmh1cC9YUElaWTdIa3RaMXZPNnJrd2kyUVl3MHdCcHZiSWJsd1EyOSsx?=
 =?utf-8?B?S2t4Rkc5a1BjbFZDazkyUit0V0crWmdyK0FkU1NsVGl4Mm5taS9hVllTVU5p?=
 =?utf-8?B?VVlNQy9iMTdHNldFRUJaQURsdG5vaDZxUWxvbFMrL3lneFJRZThVaDFWcUNs?=
 =?utf-8?B?dzB2c1RsemNaUHo1OHdMUlRXejYvM2JPcE8rODVZRktHOFlmZ2NLL1d4T3k3?=
 =?utf-8?B?SXIyL2k2aEdqYVpPZmt3b2J5OWlSRUZIVGRrUWk3Wkd4bHkzVlBsdUZWeTIx?=
 =?utf-8?B?SU5oUmljSllPWWRHL21UTVV4TlNFaWhkVnhETW9nL1hPeTZFUWNVT01YNTNX?=
 =?utf-8?B?TlR1Mm9BQlY5YWhZYUtxY3NIbC8zREhiVk5sc0ZiWWI3SVNrdHNlbGVpckxC?=
 =?utf-8?B?Q0dzakM1MGhYY0VTRDRhSEN3a1BzTGd0WkpqQnBrZytNYTlFeGxaU2ZSSlNo?=
 =?utf-8?B?bDRkOTRya2NTRS9ZMmZWWHJJSEJ3UUpxdk5ueXJFQjc5OHBuWDY1VnJYcytv?=
 =?utf-8?B?ditQdVl3UXNuR1gxVTZRMlpBNUlkUExGZ0Q0VnhvYmtrVW80R0J5dm9sWFBV?=
 =?utf-8?B?RGpFWlJTZkZsNlFCd3RNQ0pLMkI5VWhuWTgxQVVUTlFTb2NnU3RZTit1SFY2?=
 =?utf-8?B?N2F4WTluUDVscWdDdzZ6WXhiODA4T0N6c3RKKzR5UVA2dUdIQW5nU0ZWdEt2?=
 =?utf-8?B?ZkJGNy8xNDM1UWREMnlGMUw2dkl0NjBWQTQ1aFpSSjZMdTBXekRxSVF0TVVy?=
 =?utf-8?B?UHdQOTUxeFdBT25IQ2dmdEtlbVUrT0NJU1VGR1ovWTdhdVg5Mm5GcEhXb21J?=
 =?utf-8?Q?yITAo8moQw1XQczUugYaUJYarIFLSw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckpiaGxuU1ZkcDV2SVlSeXNVamFLcHJZTUZVbllPVDVFc2pmenFLS1RsdkZQ?=
 =?utf-8?B?cStWTTVWOHNpeWwxMG9rNWxRWS9vdnNkWjFWMFM3SmtEWUFMdHNGdVF6RDUv?=
 =?utf-8?B?WWpDOVBSNWVsSTFjUG1LTmZXWCtwU0YxbWNwSnNxTzAxNmg1MHhtSlRYcTJC?=
 =?utf-8?B?V1ZZYnAzRFgxbTE5UXUrSGtjaWZ5Q2M1cE5RZUxXcGVKOVl5YkNIU1NhcXp4?=
 =?utf-8?B?U3g0cFFza25vZEttRmFpdWpvdWlJS21JblFCYnRUS3NuQ1ZNRlUzWTdTWEY2?=
 =?utf-8?B?dzljTzJDNkE5SGI0UDg2VHVZd3NsUTRQSXQzS1l5UHVrRWl4U0ZOUWxacFFq?=
 =?utf-8?B?cFZNVXdOKy9hR2doSm15ak5oREdyK0NNVHZBTUZmZXViODV5U0h1YVB4aHVF?=
 =?utf-8?B?L1pJUjJzOVc0YlB4bFZuRVJEWVF0RHM5OFphMkw2enRpSHdDbUVHN2IvUlhJ?=
 =?utf-8?B?cHBQcU1xNS9WNC9tSWlESzAzVUw4bE4yWEFJQ21QdWNLam9HalE1SHp3ekhn?=
 =?utf-8?B?a1NZK3hnZXNYK2pSSlVTd29VRFp0YXNlV2JFVzVvNFBzNEFLcGJFWW80Q0I4?=
 =?utf-8?B?MFdGSDhtcjN1S29PY2UvYU51MmVBZGdERDQ5MUE0dG1DOHU5VkdVekxzV0FE?=
 =?utf-8?B?N04xNnZ5Q21ydjZKTFFYV09nZzY3cTdRamhlVlcwdG1FWEQxbWJtSUtpclND?=
 =?utf-8?B?djRENWNBMlhrSStyc1hVOTlDakNOQVI3SWxjOTJ1R2tpeHFIVllwSVFrZmdR?=
 =?utf-8?B?ZGgva1poV05jbjM0Y0VnN0RqQmVSV2RCcUNjODdQT1BLU2tOTnhhU25nMGpo?=
 =?utf-8?B?MGFnWWtrc1dwOEpLRExLQ0tEcVYwWFdmTm1FOHVyMFppMEF1dUFYS01GakZo?=
 =?utf-8?B?dGE3TWFGZVpxUERkREdQdXBONkYrc1NuaE0rdFFyT081OGxqd1lBOTZucytC?=
 =?utf-8?B?bkMxUXpoUU4zN092bmRnTStVTHVocTI0aGN1Q3lvdkxRSlkxei9QbzBkR3Nm?=
 =?utf-8?B?ckxtNWtXb2dQcmtkNHhEUnI3VkJjeUJvbElFa0RsdENiUmVUQ1djVW9hVTJG?=
 =?utf-8?B?TVkvUDJGSXZyUXBXVnNBc2M5U1ZDRG9mNzBhR1BYRENMalR3ZWgyL1RkN2R0?=
 =?utf-8?B?WmFpOVRJZCt5RVp0NGlQdG9SZC90Y09wUlYrSHZHQUdudzZLUTI1VVhqR1li?=
 =?utf-8?B?RVpJbnd6dFBPTlVjTnVnNjZBVTczOWw3WXZyejJtYTZMSkZ0OUNTai8wRGFB?=
 =?utf-8?B?QUxFSzNsN2c3UDRWSUIrMjBGakZ4WG5tbVl4Yjh2VFBrTGVQdng4aVlwM21J?=
 =?utf-8?B?Mk83SUhDQ0RqaVcwOTdEWlEwcHNIZkJMU094UDh0STdxYXNoYWY3YjJsR1Iw?=
 =?utf-8?B?ZDVpeWZYK3hiUDhLemI5YzMySlhDcUVxSFpBY2YvWWpUVVVwamRSZUlpQmRt?=
 =?utf-8?B?WjdESy9ublNMZE5IN0hGZDFaOXczZVJIYmVQZnE2ekhmblFpSUVlRFJkUWcr?=
 =?utf-8?B?b1NpUkV5MUNkVFdqWGFYSkc1RE9RRSttN0VHalUxZFdnTWNLdk5DT0tYNDJO?=
 =?utf-8?B?RGtoY1VJNVRyUUthekI0RlEvbFdaejRBYTIxQkRRa3BWaXNjZDIySVNPQlBm?=
 =?utf-8?B?aVhXV25Vb1dkWitoY1RKRzlHakdVT0FvWUxFVEpLZVVMTDA2emNUWjkzSk9V?=
 =?utf-8?B?OHRDanFSNGRMTnhwTXUvTERTN3FTMVVQYWxRNXpCYXpPSDkveEQ3YTBwU1dE?=
 =?utf-8?B?R01XRnh5a3Q1cGVPditiR282aDlPaDF4MlBpUHdCQm1YT0ptRmNHcEpkTFlh?=
 =?utf-8?B?bGVMSGl2Mk81bGxWNWZ4VVhoNG05OWNHdGowQzdON2VzUXhieUdSa0JUNWVS?=
 =?utf-8?B?NjVWV1lxbWhLL2NoS3J1cGxlOHhWV05iOXVVRkxyd0hHdzF4b2NIR3djMDl0?=
 =?utf-8?B?Vkd2UExpclpndVhac0QzS0xxN3d5c0puZmM1bXA4Z29wZFZiLzVzTjIwdFh5?=
 =?utf-8?B?bkNCMDEzV01BTjFzMkRvSnVZWm5abDdiaHRpRUlKMU8vZXFJdHcrejJTdjNP?=
 =?utf-8?B?dWt5QXM2ZEZDR3REZjhTZHYvMGFGTm5yQVNNcko3WC9sTVRmVnZ2b3ZtbStF?=
 =?utf-8?Q?+X8w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804bbdf0-1757-4622-f52e-08ddd988a06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 10:11:38.6498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fXluRQqCI8VSfOkKyl5VDRfOlkfL+9JpxEmkKE8xhJW5safbSPjbsuiX/Z99gNNw8+ZnUiQSTUmfo6+ToeGgng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZW5ueSwg
WmhlbmcNCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEyLCAyMDI1IDU6NTYgUE0NCj4gVG86IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFu
Z0BhbWQuY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2
NiAxNS8xOV0gdG9vbHMvY3B1ZnJlcTogaW50cm9kdWNlIGhlbHBlciB0byBkZWFsIHdpdGggQ1BQ
Qy0NCj4gcmVsYXRlZCBwYXJhbWV0ZXJzDQo+DQo+DQo+DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4g
U2VudDogV2VkbmVzZGF5LCBKdWx5IDIzLCAyMDI1IDExOjU2IFBNDQo+ID4gVG86IFBlbm55LCBa
aGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5n
QGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNo
PjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NiAxNS8xOV0gdG9vbHMvY3B1ZnJlcTogaW50cm9kdWNlIGhlbHBlciB0byBkZWFsDQo+ID4g
d2l0aCBDUFBDLSByZWxhdGVkIHBhcmFtZXRlcnMNCj4gPg0KPiA+IE9uIDExLjA3LjIwMjUgMDU6
NTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ID4gTmV3IGhlbHBlcnMgcHJpbnRfY3BwY19wYXJh
KCkgYW5kIGdldF9jcHVmcmVxX2NwcGMoKSBhcmUgaW50cm9kdWNlZA0KPiA+ID4gdG8gZGVhbCB3
aXRoIENQUEMtcmVsYXRlZCBwYXJhbWV0ZXJzLCBpbiBvcmRlciB0byBiZSByZS11c2VkIHdoZW4N
Cj4gPiA+IGxhdGVyIGV4cG9ydGluZyBuZXcgc3ViLW9wICJnZXQtY3B1ZnJlcS1jcHBjIi4NCj4g
PiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNv
bT4NCj4gPg0KPiA+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4NCj4gPiBJIG9uY2UgYWdhaW4gd29uZGVyIHdoZXRoZXIgdGhpcyBjYW4gZ28gaW4gcmlnaHQg
YXdheSwgYWhlYWQgb2YNCj4gPiBldmVyeXRoaW5nIHRoYXQgd2FudHMgcmUtc3VibWl0dGluZy4N
Cj4NCj4gVGh4LCBpdCBjb3VsZC4NCj4NCg0KU29ycnksIEkganVzdCByZWFkIHRoZSBuZXh0IGNv
bW1pdCByZXZpZXcuIFRoaXMgY29tbWl0IG1heSBzdGlsbCBiZSBuZWVkZWQsIGJ1dCB0aGUgY29t
bWl0IG1lc3NhZ2UgbmVlZHMgcmV3b3JkaW5nLCBhcyBubyBuZXcgc3ViLWNtZCAiZ2V0LWNwdWZy
ZXEtY3BwYyIgd2lsbCBiZSBpbnRyb2R1Y2VkLg0KDQo+ID4NCj4gPiBKYW4NCg==

