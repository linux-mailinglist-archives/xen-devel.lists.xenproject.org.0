Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57743C95B01
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 05:09:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175503.1500149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPvDg-0004RH-1l; Mon, 01 Dec 2025 04:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175503.1500149; Mon, 01 Dec 2025 04:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPvDf-0004Pq-V4; Mon, 01 Dec 2025 04:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1175503;
 Mon, 01 Dec 2025 04:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPvDe-0004Pk-Hb
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 04:08:58 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73ad43e6-ce6b-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 05:08:55 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 04:08:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 04:08:51 +0000
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
X-Inumbo-ID: 73ad43e6-ce6b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsl+IX1Z72h1NbxP8yVludxLHrXpWGKIZ2+GS8uD9e8tOvp956o46GZ2YKDndCsuZ7iRE2MaPgvEf7q6uRbkOZj3aSF8l87einmLsX2CC7HGB499hLUMYb/loPVL6kzVFB3Zv2PyMuRazTg3G9dDlwszKG4ZvJFsKKOEHgZSAmhyU5b3V6jkmAVj8mcF56zXZ2xybrXRJY+lKmFKBozBbBsSZ+doaFKU/HLUzXsheNt5AurusloN+1veQHGLigou1dAjdllu+zpsQIQXEVd1Pi++Cq2WHkuXp73R3f93UR8o9pfGnK5aEY6+AnFfxO2fq1axEOdHWpZCnhgt5QaRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7knYHnqsmGgFdKG6Txs4G4DWIqBK9cVQ+CSbYowSyM=;
 b=UR1h+fGM2cszKl0qF/RcpdIa7P2PK8VdOyX20IpaHVG0b8kTVKyHcKjxRx7lEWOTSC+47Zef60Zk/cKiJRpVIHp90GZz99inpLX/sazpOz1et2pclzPMrwxmKVuLLEOudVZQ1MuMGF9wp/gBsXBTfoCDeCjTBpQJkoLzU+YJpTnDLrd7vfEnnIR0Tgx79Rve9a3Fu7CJT/BUJuuCje2w9+VRgfqiHmh+1vrJtTkL60NuJpyOFz36Z7hm73PV65v5tqkUIcdkGtAF3AZl8HNq4VfG1L1QMJX/XKW9TeocCD6g3KFgoFg7038G/7r0+oMIVuKjyKy2OfpT3ZuWsYmIjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7knYHnqsmGgFdKG6Txs4G4DWIqBK9cVQ+CSbYowSyM=;
 b=YsZZx0GdRulqJ2Kx1ESOJhKzG5nVcz+KTnYoqV6JlLYrAzLablKm9023QkO2KaISyl48l3A1xiPsjG76HiuaKgHj8N8wtNXGpnirbl/hi64k7n4rpLEXKREhuoCj/RiEsUMuYKMSmcKjanJdeXVF//4qiWIMk2vrWLXYJHS+Ymw=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Topic: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Index: AQHcWtXJjf66LsUGrE2uxhJqk+lJcbUC9piAgAk/5nA=
Date: Mon, 1 Dec 2025 04:08:51 +0000
Message-ID:
 <DM4PR12MB845192E5CA6B8364D853AF15E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
In-Reply-To: <6781dbd7-ddce-49c1-a359-0910e91bda43@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T04:08:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB7992:EE_
x-ms-office365-filtering-correlation-id: cbaf2db4-66ac-4e94-7fc2-08de308f55f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2UxUHNYUUEzZFNEMGJpb3drOGZ1VmoyVkhobkJ2NEp3RE4wSUZzZG1INE5h?=
 =?utf-8?B?WHcxLzg5VDRDSEpXdzVTbU5PR01EVE9MY3ROTUpGb2hPckhGWVZYQW5jTUZO?=
 =?utf-8?B?Vzd6M2YyOXJPODBHQTRWM1B0ZUpUeFo4MDl3dzk1UnlHU05HdXBMQjgySkJ5?=
 =?utf-8?B?eWFyNTQvRlJxbXA4ZmtGQ0l3UzVMVGUxN2RBS0kxL2tKenZZYTVhNTQvWEgz?=
 =?utf-8?B?ZzgrbVVpV2JBaWFVOWR1eWRNZVNCc3FXYzJGNkl3cFlVN3lHTkoyWWcwdzBM?=
 =?utf-8?B?d2tKRkZiWGQ2M0tyQmp1QmdzMkYwU2YwUFMyWFdmVldmT1ZxL1IvR1Bnb1Iv?=
 =?utf-8?B?RkNKVkNNR1Z2clorZDdLN2R1VVkzMWFnNUY2SFB3WTlvSmNxbjIxaGFqTWE3?=
 =?utf-8?B?Z1VGMjhUZG5LYkVnY0tMTEQ3dnB3NVdQODZoc1BVNmtJSTZ6bi9NVkZFOEhW?=
 =?utf-8?B?UEU5cTZOdFF1MXpmNWlXRDFISzVrSHJ0RXgzK1JqeG02R0ppWDdVbGRyWS9z?=
 =?utf-8?B?TlVLMThZUCtjcTI1U0lkRzJjTy84Tjh2dy9Eb05iczQwMFIzQ0ZTR05mUG52?=
 =?utf-8?B?MXIvMk9aNUpVR2EvZ25mbkFGR250anhMOVlNSTFzRW93UFBKbFJKcUFkb1Ew?=
 =?utf-8?B?WU1NVEJoSk84dFMwRWJjSkcxdXk0STFTdVhpaloyN0N4R0NMSUttcFByUlVs?=
 =?utf-8?B?ZVhBWFByLzlBSC9kdDBteXVFU1ZmMVJtV2trdXJ2aGpPSnFNOTBRd3pJdC9Q?=
 =?utf-8?B?blQxTWs2RDd3a1RIcVVmS3JUem5tcG1HUVAvcmNXL3RRUEhCdnFaR3JmeVZU?=
 =?utf-8?B?UXYvTUVTemNaYnI5cWRFOHV6Y2tyeFcrQXpFQ0VEYjFFRUlPakowYjFSYTEr?=
 =?utf-8?B?L2g2dDlzZm1xRjU4QUhqS2dDNDZJWjhucTFJUkg2WWtJWDdkcWJRSGRENWx4?=
 =?utf-8?B?ZlZCS2MzTnN5OFNCMno3VTd6NjdEblczZTd1WU5Gb3ZCanNlZDRubzl1SW9D?=
 =?utf-8?B?ejd2MlFxaUxlaGp3S3AzaXQrcWZlamQ3dGdZUE9JcXorYTFWUktsWUNjdUJV?=
 =?utf-8?B?RXhTcWJiR1dxYW83RFpHcXRkKzF2ZDJUZ1ZmSDBTaFFGYVRybGdHY2wvcnM4?=
 =?utf-8?B?U2JNbWMwUmZURi9MTzMzSGxzMHNkUHhJYk9HanhVN3VWQnZnSlVQQVJwQ1dB?=
 =?utf-8?B?S0lHOHhFOEFreWN2dFpldG55Wkh3L0JzMkJabFpuOHZWVCtSaVo1TU40enlv?=
 =?utf-8?B?SW5FaGJwWkpoTEhMeXVYTWUzMTN0NWtBSThkOFhPWHg1YjVjUFJlVURGUUVq?=
 =?utf-8?B?REsvU3dXMVhrNm0yeDZPWmVkVmMzcHdzdmoxMS9ZVE5abnp3ME0raVdJRUJJ?=
 =?utf-8?B?enFwNmwxc3Jzejh0RHpKTmRjSTlENThBU0dIcTVkWGhmZS8xQWkrTjRFdlBw?=
 =?utf-8?B?LytiajJTS29oQTdhbFlXb2M2TGQ2QXU4QUo2ODNDNTN4S0dCSkRYT1M3MUZR?=
 =?utf-8?B?TEtrWXB1NTFDUnk0UnBib0VTRHpaY1lWY0pOdjMrQkQwY0EzdDFYeC8vV1BT?=
 =?utf-8?B?ekZsQ2Z6cVh5TGNraFZXMlcvalhWNEZmditQWFRVR1hKSFdDSzA4VEUwRjVO?=
 =?utf-8?B?N0NlMTFRcTMwTGYrQnhLUmFRcG56UzBCa2JEeCtBM2FQL1c1MElTNkR6VnI0?=
 =?utf-8?B?bVNKWm1uTVJCQnJKMzRmbnIvZ3FhdGErWTd5UDc2eVJ0Zjd3K00wNG02VFRN?=
 =?utf-8?B?M0FoeDYyaTNMQktJN3pFdEQrOExlSk5YUVFYQmx2aVpwbjUvQWJMWDB1M05U?=
 =?utf-8?B?WnorM1ZLMFdNamZXMktZMUpXdnIxRGZBQktOQVlpTUhnVSs4RE9MamtDOUIw?=
 =?utf-8?B?RjZBRXM4SEhldzRmaGFYazl1QlBhM1NLcnRvUnU1KzJNSUJPREVGYUNsM1pr?=
 =?utf-8?B?c3Q0bUg5RERrTSt5ei9WOEJtMzdvMlc4QmtLMnBPeHF4azVGUGRObytZMnZE?=
 =?utf-8?B?UC9RWmtqZW0vallMVm9QUnVqY1ZDUm96NmdoMUoxVXZacDFnZVFqSysvY0xF?=
 =?utf-8?Q?efXefD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aCs5bUFPNk1Uc3d3bnorYXhtcmx3aE0zZlFDUTRlMHRQNnpCQmhCQW9iQ1JY?=
 =?utf-8?B?RUs3OUlacWpuMTR6dEQrSTU5NjFnY0FoVUJoUm9oZ2c0QldsREpsQ2xnc2FP?=
 =?utf-8?B?NncxL1NMRzFBNDFjTXNKZVB2RzZqZjE5NE5DMWc5blZSdnZqaFlGblFybHF1?=
 =?utf-8?B?QTBaNDFRNUpyTzEydnNTeTgyRk9ja2tMMkZEL1d4Y3RhWElhcHZpSFJoR0JO?=
 =?utf-8?B?ZmEvSXM3MlZIby9wUGlXSE03KzQwU3JnNmFibFNicjV2VnVDbXRwaEhXa3pN?=
 =?utf-8?B?NkFsbjZBMzI5SEx0MS9vRGtPUzRobTlOMHJ6NjVZY0pnVWpxNWZrdmNmTXdR?=
 =?utf-8?B?MzNMNnhDTSsveDFCYjdpRFZkS0hZdjk2V3NRM0p4TmdPcUxvekJnY3AvcFdp?=
 =?utf-8?B?ZERzN0ZtWlZPYzVmN2czMjdnaXFVenVxZFFNN0ZSNm5UM2k4TGRvZEFSQmdZ?=
 =?utf-8?B?bjBENzJOUUpiRVMwdlRCUlVEam8vVHVLaU5OK2pVWmhkRU02a09zNGxlUW0w?=
 =?utf-8?B?SDdza1grSWdLcUxrOGxBVDhCRmF4dVFIOCtIZmFnNFdQcWhsWWlaMjhVd2wv?=
 =?utf-8?B?ZXRNajUwZVVNTWlBL2x1cHVmUkRUK0VZLytiTlYyQ1c0ZkRUYVloZUYxemxO?=
 =?utf-8?B?VUhHOVdIMUxpblJydmMwWnFSV3ZiakUrNThyZUUzMXRpL3N2R24vUGFnRkRC?=
 =?utf-8?B?cGRZaS9qcC9VdUh4dFk3VjB5YUJBMkpDNVI2cHlQL2xReDFSQUIvdWF3Z01m?=
 =?utf-8?B?cUQrZTlUSnhDQml3R2RxV1c4VjlocHIranNHRXJlV3hteHMxbkJBTnRVR3pR?=
 =?utf-8?B?ZWNUYU00UkFtMFRsOGlMbVk2TUNEVUhnNitvMi9LR21qWExmV1JMNGVURk0r?=
 =?utf-8?B?VGNVVzA5bkV3d2ZySldPM01ibHdUT0MzbWVEdys2d0xJcEpqTmIyVHF3USs4?=
 =?utf-8?B?TFNtQlFVaEg5SXlYWmhDR2g3dytla3RyR1kwaWFHdHNocE95RUd3dHRFcUNG?=
 =?utf-8?B?Q0J1ekhMbWRXL3QzZ0NLTDBXcm1BMjFPWElEaHQ4MldQUXA1R05VanJpYSt1?=
 =?utf-8?B?RnEvSUdpbWV6Y2FCd0I2WUsxNmR6WnA4STV4UlBicWQ5YzdGNmVEeTlrdW1p?=
 =?utf-8?B?RllrY1lGTUtMRmRvUkVaOUJscXBwTXNLOGlUQW1MYjVWakhmakdHR3pOZWFv?=
 =?utf-8?B?NEVwMGk0SFFqRE8yMWZrSHYxTE9icFRXSTJ5aXpVTmdWRXJVWGFBbGRrVDNp?=
 =?utf-8?B?NGg0SHRSbXNYK0ZURWJDbzJZSU1JTklXWXUrMzQvRVVCbTd0MWE3OEhOa3gx?=
 =?utf-8?B?U2hDbFRnYXlQazdINDZreEdXcENja29nUGJTLzF0SHhvYUw4QjFwcThMcERu?=
 =?utf-8?B?UDY4endNVnN5RWRaUDdIZmdmTDJKSDM0MEo4Y09OZ2gyaUVHdjVzaEpBQ1V1?=
 =?utf-8?B?cFJSR2taSWFacXY0bUNBcUFNNVpMMWI3VG11ZE52bGI0a3hkbjBRVEVmWkNa?=
 =?utf-8?B?TFAwYjJFdVJDeTlaWkhBaXlYeGd1akkyQTUxNldza3hTRTJpRTgrN1hrbTRx?=
 =?utf-8?B?d0YvZ1BJa0VONmtLOGdEd2VCSzF2L2JlVWVPaWxYd0VSN1NpOFdtNjFNMC80?=
 =?utf-8?B?NGU0N3VVbmh0NzNvWFo3dkxIeEpINmJKSTJxUE1iUnJtSm96RWV4TDZ4QTJT?=
 =?utf-8?B?OFFuRHdOdDJrdFVvNkNtVWZ0aXZ0RDgyeWdCYm1GTnFVZzhUWkExSlZWUEYz?=
 =?utf-8?B?VXRMQTBuOE9ybUJwOFhnTE1lajJMcGR5aGswcHNoRVhkaTdWN3JYMlZkRkxY?=
 =?utf-8?B?cEVLalJwTzMwR2ZPRHF5R1VVaGdEZE8vYUhtczdoUS9NTGJTVzNyYlB1bktM?=
 =?utf-8?B?T1J1WUxVZWVXWlBDMHFkMGJvQXdoVXc2V1dDVnlCLzZNTjZqTWY3ZFMxNkk1?=
 =?utf-8?B?djlvTTIzNHZJSzZtVk1wbXBHTXNqbGdIYkM5U0dSamRvdStvZnBuNS93T01i?=
 =?utf-8?B?ajFwSXFqK3pJeDltOVp0MnYvVTBQTWFBMWtUek5nZU5KYkM3R1VYMVRIaWRk?=
 =?utf-8?B?SkQ2RXNyWUQ4R3VNMnI2NlhFZFFoRkRHVnJyNllYSFJuQjJlYldpYVplM1lu?=
 =?utf-8?Q?z5Eo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbaf2db4-66ac-4e94-7fc2-08de308f55f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 04:08:51.3252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyGf3DS4HW9ZSvmUZ/SKQwnNvn5NAuKbuqqiQrCaXX6ZNOXmfpkUermm8cBUrAvMBqv9zUHZwRfgIdIDHu0BEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI1LCAy
MDI1IDI6MzkgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IEFu
ZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IENjOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tOyBSb2dl
cg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEDQo+
IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDAyLzI0XSB4ZW46IGNvbnNvbGlkYXRlIGNwdWlkIGxpYnJhcnkNCj4NCj4gT24g
MjEuMTEuMjAyNSAxMTo1NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVGhlcmUgYXJlIHNvbWUg
Y3B1aWQgbGlicmFyeSBmdW5jdGlvbnMgb25seSByZWZlcmVuY2VkIGluDQo+ID4gWEVOX0RPTUNU
TF9nZXR7LHNldH1fY3B1X3BvbGljeS1jYXNlLCBhbmQgc2hhbGwgYmUgd3JhcHBlZCB3aXRoDQo+
ID4gQ09ORklHX01HTVRfSFlQRVJDQUxMUyBsYXRlciwgb3RoZXJ3aXNlIHRoZXkgd2lsbCBiZWNv
bWUgdW5yZWFjaGFibGUNCj4gPiB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLCBhbmQgaGVuY2Ugdmlv
bGF0ZSBNaXNyYSAyLjENCj4gPiAtIHg4Nl9jcHVfcG9saWN5X2NsZWFyX291dF9vZl9yYW5nZV9s
ZWF2ZXMNCj4gPiAgIC0gemVyb19sZWF2ZXMNCj4gPiAtIHg4Nl9jcHVpZF9jb3B5X3RvX2J1ZmZl
cg0KPiA+ICAgLSBjb3B5X2xlYWZfdG9fYnVmZmVyDQo+ID4gLSB4ODZfY3B1aWRfY29weV9mcm9t
X2J1ZmZlcg0KPiA+IFdlIHNlcGVyYXRlIHRoZXNlIGZ1bmN0aW9ucyBieSBtb3Zpbmcgb3RoZXIg
ZnVuY3Rpb25zIHRvIGEgbmV3IGZpbGUNCj4gPiBuYW1lZCBjcHVpZC1nZW5lcmljLmMsIGFuZCBt
b2RpZnkgcmVsYXRlZCBNYWtlZmlsZS1zIHRvIHJldGFpbiBzYW1lIGJlaGF2aW9yLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4g
LS0tDQo+ID4gdjMgLT4gdjQ6DQo+ID4gLSBuZXcgY29tbWl0DQo+ID4gLS0tDQo+ID4gIHRvb2xz
L2Z1enovY3B1LXBvbGljeS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAyICstDQo+ID4gIHRv
b2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL01ha2VmaWxlIHwgIDEwICstDQo+ID4g
IHRvb2xzL2xpYnMvZ3Vlc3QvTWFrZWZpbGUuY29tbW9uICAgICAgICAgICAgIHwgICAyICstDQo+
ID4gIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAyICst
DQo+ID4gIHRvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZSAgICAgICAgICAgIHwgICAy
ICstDQo+ID4gIHhlbi9saWIveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPiAgeGVuL2xpYi94ODYvY3B1aWQtZ2VuZXJpYy5jICAgICAgICAgICAgICAgICAg
fCAyNzMgKysrKysrKysrKysrKysrKysrKw0KPiA+ICB4ZW4vbGliL3g4Ni9jcHVpZC5jICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDI2MCAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgOCBmaWxl
cyBjaGFuZ2VkLCAyODMgaW5zZXJ0aW9ucygrKSwgMjY5IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1v
ZGUNCj4gPiAxMDA2NDQgeGVuL2xpYi94ODYvY3B1aWQtZ2VuZXJpYy5jDQo+DQo+IEFuZHJldyAt
IHdoYXQncyB5b3VyIHRha2Ugb24gc3VjaCBhIHNwbGl0PyBQZXJzb25hbGx5IEknbSBub3Qgb3Zl
cmx5IGhhcHB5IHRvIHNlZQ0KPiByZWxhdGVkIGZ1bmN0aW9ucyBiZSBzY2F0dGVyZWQgYWNyb3Nz
IHR3byBmaWxlcy4gVGhlIHNlcGFyYXRpb24gYWxzbyBmZWVscyBwcmV0dHkNCj4gcmFuZG9tLCBw
b3NpbmcgdGhlIHJpc2sgdGhhdCBsYXRlciBzb21lIG9mIHRoZSBjb2RlIG1heSBuZWVkIHRvIG1v
dmUgYmFjay4NCj4NCj4gUGVubnksIEkgYWxzbyBkb24ndCB0aGluayAiY29uc29saWRhdGUiIGlz
IHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUuDQo+IFBlcmhhcHMgInNwbGl0IiB3b3VsZCBiZSBnZXR0
aW5nIGNsb3Nlcj8NCj4NCg0KSSdsbCBjaGFuZ2UgaXQgdG8gc3BsaXQsIHRoeA0KDQo+IEphbg0K

