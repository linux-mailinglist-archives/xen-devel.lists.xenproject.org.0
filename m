Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D5ABB518
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989511.1373523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGtyn-0000pm-Jm; Mon, 19 May 2025 06:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989511.1373523; Mon, 19 May 2025 06:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGtyn-0000nn-DM; Mon, 19 May 2025 06:28:05 +0000
Received: by outflank-mailman (input) for mailman id 989511;
 Mon, 19 May 2025 06:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFfW=YD=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uGtyl-0000nh-OT
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:28:04 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2412::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68bffa61-347a-11f0-9ffb-bf95429c2676;
 Mon, 19 May 2025 08:28:01 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:27:56 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 06:27:56 +0000
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
X-Inumbo-ID: 68bffa61-347a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQIoc1egJfxCPWG4Zm1DyTQXH/HAR3vtLiDa/7YjqqU0i7X7J05y1at1E0elq8I0xuT4zle4fwvV51DlHayM59QsqEuo/HONfKJCw+bkIOAbgIRQop0++34Tu+hlSmB68h5wkzut4PuT3nJnmhMdD3Qc1Dnu/1k2mEaZt1ago7EQVn38UhljndrQ6dfHVo7j/4xP29vr/wEIETJsn/bp7Vb257iPa/68+aqheriq5XdyL4aaAt7XKp7IjhKdUT7UIR/zpnJfEYRie79nWZJCW1GawWzycxKc/Ex0Qfq7O83SAeEkHhsCrh8IC480oDOy2Ty6p7W5AYvkaKRX1TPVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2vFWmbdkCaRYOG5Yj8A/inODvdpDHCOkqaXqlWLch4=;
 b=k9J5joK6MPb/ouqw6fAi1euix9MKMV8YxaI91fsarN1kZXMX+lhhU2kVKOpSI4+jiQH71mzx4yModJ88h4xXk/bVYdQ7Q/fJVhnTCAw0dhddjkz9lNjxUnpVIFPdu5BMJYYiWriXIRrKVtEyU9lxRVCBK/5Y6MR4RgKxXVub3ASSIrWCdCcPi+HNmSa87WdJ+V6XDrJ5xazHx48VJe4yK8XdWRPKR7RtBLZZaFoWBoj3mZWAiw4Hvdr3lNWgotRFZFR7KBDgb0kkJumvyAvGNRX1RkgpXxHTXN1y/icDc1wk5qU+CblSC20SKRC1mgF5S00Sqz6JlHHEqju168ZbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2vFWmbdkCaRYOG5Yj8A/inODvdpDHCOkqaXqlWLch4=;
 b=y8BcIuDR0E++4twNOox39SJYqQO03+AUEUd3/EbeXPHiWvriDqOzYfI60RtofZ/Z3pphC27Ioaz/f4KuRYwQkqMQw51vGKJ2S1TAa/+CN9hBXz+gUyFLcH0jWDWToAp6c16DQWdNoQd4sDFW5cKHdE2jF3tPdloYiuntwdSiKDo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbrRCkbAdH8T2kS0OlR5huTdSxQbO6ixQAgAATnQCADAI+0IAIsjAAgApgROA=
Date: Mon, 19 May 2025 06:27:55 +0000
Message-ID:
 <IA1PR12MB8467D276A22BAF765C9387F2E19CA@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
 <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
 <DM4PR12MB845196DB77AC3D6FBCC1C69BE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <eeb66db3-623f-4ca8-9ea5-4d89e5b4a824@suse.com>
In-Reply-To: <eeb66db3-623f-4ca8-9ea5-4d89e5b4a824@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=af991c1e-815e-41cd-84f6-d90af1f56690;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-19T06:25:13Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|PH7PR12MB7890:EE_
x-ms-office365-filtering-correlation-id: 90fde0a9-30dc-4049-095b-08dd969e4b33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUxUVU5OaE1KNDlJajJCOUg5UnJvTG9lMlhMOUgxS2VwL05SSFNEeTd1cHZP?=
 =?utf-8?B?V1lYRGlBSkQwODdhOFBJLzYzMTZpa2k4a2lzS2lxenpUY0d1YThURDRLUkMv?=
 =?utf-8?B?TWRNSFd1czdwdXFPSGMyenlVcDQ4ZG1UY3d6Z2lYblRHeUExWC9WaHoybmJw?=
 =?utf-8?B?MXNtcE84eDIydStVZEpxT0QxdFJ6WDhDQ3dwYndFanlGWXBWSVM2M3pyL3Np?=
 =?utf-8?B?dGtXMThHcEl6NlViZGRjVWtmS2l2MDVqa3pIOFJmditEVmdHYStJV1ZwS2VW?=
 =?utf-8?B?Y0xaWmdqa1loWmZBOXlGbFRkMEtDbm1iVnprVERpc2JqaUE0WGcwc3JsMDho?=
 =?utf-8?B?cTFaZEFrMmJGQmN4d2p6OVIrRm1leWU3aXJ4K2duZGtPRFZhZWdZNGdRYjF0?=
 =?utf-8?B?bU5mcFBIMHJ0MWdEanNyMUVFRVFKdjJnRStrMm12eUpkd3QvZ1FtNVJEZktJ?=
 =?utf-8?B?anNqNHNYaGlrcUtVY0lJenZZOUhiMlVjODhEaWtTMXNQOHM1WGk2T1E1anhl?=
 =?utf-8?B?QVVHWXNMZmhJak9HVDBDZURwQ0hHVWh0WDQzekVhZ0pPd3RZeXZZZWx3RXhZ?=
 =?utf-8?B?bzBKSjQ4MXhtUzNDakVJZ0R3dXN0T3lQSExHalBOOGZQSGZjZWlKSXgvNWxt?=
 =?utf-8?B?ZytaNVltRkJhbmMrY3h1ZWoybGJOMFNVWHoxYkgxOHJqanJlTmpuUzI4a1hv?=
 =?utf-8?B?cWJEVnp4NVh6UFkyWjVQdkx2VjU4Ym1vTkJLOHRqNURhWG1PanpzSTBBZkNz?=
 =?utf-8?B?eklNNlBYb0g0QjdkNW80VHRYMWxxcXFDU0FJa3EwT3FpTlRnSE02eGtndyts?=
 =?utf-8?B?b3RHdnNYdCtNZFEza3FHUldla0FJc3dXNWNNL1lwMnMrVUdTMWtTR0crdHdW?=
 =?utf-8?B?bmhMbTd5eVY2RkcvSnhiYkZEbjdOK1ZlWlpORFFXdFB5TXBvSU1uL0FoMDZl?=
 =?utf-8?B?U0RxK0lndkpkYzBFa3Nqa1dMMEp6dGVNa2NjN3lpeHZRN1Z5UlNaanNGWmxW?=
 =?utf-8?B?RzNTOTJNUWdxaE5XZ1RRK2I1SUFxS1pNQ0NiaS9tUjlrNHhtTHRuNzRIUGQw?=
 =?utf-8?B?Y01xY1lUS1owN3RXd2ZDKzNUZ2V0akhzSVZKZlpzUnNzbnZrMWx0cm1iZmZN?=
 =?utf-8?B?NStBb1A0bmhnaVRWT2tCNmFSZ2w1dTd3VFd6d1Fwa0RnM0hpa0NsNDdVS0pr?=
 =?utf-8?B?UGNIeWdxOEhvelArbzRMYmVMWjI1cENrT0ZLMXdFVEpaQkFlL1lPRk54WWxx?=
 =?utf-8?B?ekVNTUVjZ0JMckF4RUxaWW1IcDIwbG1BRkcxbzFyRzVSbHZycTJNZU0vbXZ2?=
 =?utf-8?B?bG9semY5cGluUHVWRjdBSXVFdmRaL1lMM2NpbXJ1eUNPYm1uOE5QMUUyZ0ho?=
 =?utf-8?B?NUJzeUdZMUcxbnljSHpkRE9kMHF1SjdhQUJ6ck5Ib3lhVFpQYlRpRWQ3UlVP?=
 =?utf-8?B?MzFTZjFLRVE2dmJvNkxFZjU5aENSaHZxNWVjcmtFTGZaVFZkMzRKMmdEdTFR?=
 =?utf-8?B?K01pTHhtdVE5SzVQVXZMV2dtNlZCejdvS2d3aEkwd09TWGFsZU8xc2IxR1I1?=
 =?utf-8?B?aGFGSFovdWNiN0grR29Db1kya2prV3FYbkhwd3E3bU56SHp3U3pIc0hJV0Jj?=
 =?utf-8?B?YkYwRUN6MVFsMGFKUnp1Z2hLVkZBZWM1NFVvbis3UjZoVjJxczJPaHE2SkxV?=
 =?utf-8?B?bFJOajdxR2lsMWhDYUVwVzlPVmp2TWk1K1hDTUxrdzlYU0h5bTZVWTBzNytN?=
 =?utf-8?B?ejl0NWdJTWtVdkk0NlZZcVJGMmdsNTAzYmk0L0FlUFpqNXlvSUx3VlNvalV4?=
 =?utf-8?B?WkRhYWlia0x3clEzajhKSTE3Q2pUVVZOT285ZXBzb3EwTkk2T01PcVZoSGp2?=
 =?utf-8?B?d0tnclcvTzlkdUw5b2FNSHJDdGNRYjhYczlVNlZKZkJtSCt1eTR5a1BrQUpF?=
 =?utf-8?B?YTNDVGUzNFpOMW9HVFJJY0tnWDhDRVlONGNlQldxNDlueXNiS3FtbDNUQktk?=
 =?utf-8?Q?CFWgf6VKOUpcTT0Csi69/nob3Rp7oA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OVh5ZUFrZ0lwNGNkM3RiYXg0UEpScUpGZHVCQm9HejlXaEdRMXBEdmh4S2Zi?=
 =?utf-8?B?MTRPVGRsQTdDQVR0NkhqOWVwSWpTM3RHLzdxWk9CeTUxQ2FWODZva3FDOFFI?=
 =?utf-8?B?RXJKZzUxOU0vcTc3aFdJejVnT21VSnpPcXZKVC93V1VnUGNnMjhiTEtpUklF?=
 =?utf-8?B?QVNFcFVFdVE1UHpjUzdCeENLT0JVb3BHcEFUNUZiTldtLzZ3amk5U0lEeHpZ?=
 =?utf-8?B?OGNjbVhBSFU5ZGNiSXdtaVgxclEva2lMTW52Ukd2NW5kTlBDd1RzTUtiS2Fu?=
 =?utf-8?B?UHRZUHErVGN2UmlyeTR5UVg3OTBwWDlTK0cwZHpIZnZPbkQ1TFlJNFBLUisy?=
 =?utf-8?B?V2JzOStiZ0EyNmt5Wk5Ocjd2MFdkMUVxRnVmc25xU0Z1MjNNbVRTT09xTS9y?=
 =?utf-8?B?YkpWZGRTMTgvWVlnaHkveXRoSjhvTFVNU2VDWHdyU3lUU3dFaFZsOGZGTFBj?=
 =?utf-8?B?QkdqMzdycHhFNERIOVg1L3FScWFmRW10ZEFpNG5yNmZ5SzV1c3FBM0g0NXJU?=
 =?utf-8?B?K1Z5eDRZOWV5aHd5NWNBZVdNZ1hJTHZKSjYxSUIxZFFLOGlXZEoxZW5UMjJ0?=
 =?utf-8?B?SzBYakZCOU81YmtMQ2hKZ21reVBWT1BBa2JBdTdMYktDQkZZOGdMSkdud2xP?=
 =?utf-8?B?VVp5UHRXejlBbWxBZzZKajFGb0ErT1hIYldacmtIOXY0UkZjRmVrdi8yY3ZQ?=
 =?utf-8?B?dHpZemNTRlVoUHpSOGQ3VEErUmNCV3AzK0NjaDJNMHNFNWFsM3BHZzRhdGN3?=
 =?utf-8?B?ZWp3MCtrMlRIbHBBS1hESU9qUkNlSzc0OVpteWF0cnZFWHQ1UW9EVmJ2MWtS?=
 =?utf-8?B?Qml5TGFXbTVHSGp1RllwNUZxaFRwQS9WSndhTjc4UUFXY2p4VjNZUmRNV0ln?=
 =?utf-8?B?RjNtNngyUGhVa0NyWEUwNGZUK1hpbHFDbnpPeEhTWDk2cUxoWTZzcHlUSmg0?=
 =?utf-8?B?bUhyU0x5M1dHRlllRW16RVdwYzJER1JJLzc4aHdpUWt2VXFFNHRNcTZ2ZWh2?=
 =?utf-8?B?LytqaWhEY3RmWGZHdmo5TUJmN1Ryemp1TmVMU2Z6THpFV2RLdDl5ZXRFWjhx?=
 =?utf-8?B?L0dzc0tJOGpQOHh1eWJOdFdZdUd1Q1pQTFBJVUFrcXEyT2R1SzRwSjVWK1FS?=
 =?utf-8?B?MUErUkZWY1A0L1VGWEVqNUt2R2ZPVDhxdm1IbjA5cXdFSGZrNnhRMldqNERn?=
 =?utf-8?B?TkRmMllzWXJva1hScUlUM0sxMUVheStSbXppUE4rS3ZYK0RBbHZ4V2hPTW9S?=
 =?utf-8?B?OGo2dkRvV2NuaGkwM1A3ZjFsakpNTk02L09EdnRxZEFqZWtldzZESHdOeW80?=
 =?utf-8?B?Y0ZBeHJsWG4rcDJpZUN1dXBVTlJ1ckx1TTNOOTZWZlBhTmlCUElXQ3lua1Fk?=
 =?utf-8?B?aTNJVjhjU1gvWWZScVBoVXgwZHFqaGxkbEFZdFFmU1g4N2N5M0lPTnY2VUVE?=
 =?utf-8?B?ZDR5WmFPUkNqVUhOZWZhR0tOK3lGTzhoVzViUEptUElaUzhSTHZMQkkxOHBs?=
 =?utf-8?B?TVdvNHBUajU5Rno2cXo5T2tUUUhLSWg0YldOb3Nlc05QV3ZNS0RFZ2VpTDFu?=
 =?utf-8?B?bk1jZ0dNaDRYSjQrRDYvaUI5WGtQV0RhQlowcnhzc0E1dmRvSDVzbVNVVFJm?=
 =?utf-8?B?MWdZclVKb1BqTlpGQUR0K2piMlhqQVFMNDY1bjdvNnpSYW56YlBwMnVvS2tq?=
 =?utf-8?B?Y1dHUEZaRFkyVW9MSE1EQ3VBYjNCdU5GcmUrWCtWL25maXFYbTNNOEpVWVJY?=
 =?utf-8?B?NUhXOVFmTWZDeW5ZbzQzOEwwZElaOWw5T1lzMGtCRzBtZXJHUlZNa1RJWGd4?=
 =?utf-8?B?MnJLMUM2STVDcHF4YkdiYzNmR0tidisrcjFsTS8yVjNhNlhlTW8vM1ZtZE05?=
 =?utf-8?B?bkdmQklqVHQrcVpuSDIyZ0l5V3F3MmoycVp5NVpTaG5RL2FNbTRoZEs4bC94?=
 =?utf-8?B?S1B3RWJkMklFR2JSLytJR3pNaXBrRjMwQ29oN0wxWmJMV2V3SjlrVTBpU00x?=
 =?utf-8?B?NjlrMlM3V1k0aHl4TC8raFMvZy9UVGxUYnV0blpyK1VJcm9KOXNNUUw5RnVv?=
 =?utf-8?B?Uk9ZNXAzaW1FMFdqeS9rVERsQ2ZqSGVzSFJ1WnhjL21CU3dPd2k5cXFabW44?=
 =?utf-8?Q?EcCA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fde0a9-30dc-4049-095b-08dd969e4b33
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 06:27:56.6960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRQ1xj1vdyBCZkMNVci1+pig//t9zlvUeE/oXb8fTTjgA36CJSCZ845MwsbWkEK1ZEFIV3Qp9XR90v6KKIgOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAxMiwg
MjAyNSAxMTo1OCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwNC8xNV0geGVuL2NwdWZyZXE6
IHJlZmFjdG9yIGNtZGxpbmUgImNwdWZyZXE9eHh4Ig0KPg0KPiBPbiAwNy4wNS4yMDI1IDA1OjE4
LCBQZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+IEhpLA0KPiA+DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgQXByaWwgMjksIDIwMjUgNzo0
NyBQTQ0KPiA+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+PiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwNC8xNV0geGVuL2NwdWZyZXE6
IHJlZmFjdG9yIGNtZGxpbmUgImNwdWZyZXE9eHh4Ig0KPiA+Pg0KPiA+PiBPbiAyOS4wNC4yMDI1
IDEyOjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJl
cS5jDQo+ID4+Pj4gKysrIGIveGVuL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxLmMNCj4gPj4+PiBA
QCAtNzEsNiArNzEsNDkgQEAgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgY3B1ZnJlcV94ZW5fY250
ID0gMTsNCj4gPj4+Pg0KPiA+Pj4+ICBzdGF0aWMgaW50IF9faW5pdCBjcHVmcmVxX2NtZGxpbmVf
cGFyc2UoY29uc3QgY2hhciAqcywgY29uc3QgY2hhcg0KPiA+Pj4+ICplKTsNCj4gPj4+Pg0KPiA+
Pj4+ICtzdGF0aWMgYm9vbCBfX2luaXQgY3B1ZnJlcV9vcHRzX2NvbnRhaW4oZW51bSBjcHVmcmVx
X3hlbl9vcHQNCj4gPj4+PiArb3B0aW9uKSB7DQo+ID4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgY291
bnQgPSBjcHVmcmVxX3hlbl9jbnQ7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsgICAgd2hpbGUgKCBjb3Vu
dCApDQo+ID4+Pj4gKyAgICB7DQo+ID4+Pj4gKyAgICAgICAgaWYgKCBjcHVmcmVxX3hlbl9vcHRz
Wy0tY291bnRdID09IG9wdGlvbiApDQo+ID4+Pj4gKyAgICAgICAgICAgIHJldHVybiB0cnVlOw0K
PiA+Pj4+ICsgICAgfQ0KPiA+Pj4+ICsNCj4gPj4+PiArICAgIHJldHVybiBmYWxzZTsNCj4gPj4+
PiArfQ0KPiA+Pj4+ICsNCj4gPj4+PiArc3RhdGljIGludCBfX2luaXQgaGFuZGxlX2NwdWZyZXFf
Y21kbGluZShlbnVtIGNwdWZyZXFfeGVuX29wdA0KPiA+Pj4+ICtvcHRpb24pIHsNCj4gPj4+PiAr
ICAgIGludCByZXQgPSAwOw0KPiA+Pj4+ICsNCj4gPj4+PiArICAgIGlmICggY3B1ZnJlcV9vcHRz
X2NvbnRhaW4ob3B0aW9uKSApDQo+ID4+Pj4gKyAgICB7DQo+ID4+Pj4gKyAgICAgICAgY29uc3Qg
Y2hhciAqY3B1ZnJlcV9vcHRzX3N0cltdID0geyAiQ1BVRlJFUV94ZW4iLA0KPiA+Pj4+ICsgIkNQ
VUZSRVFfaHdwIiB9Ow0KPiA+Pj4NCj4gPj4+ICAgICAgICAgY29uc3QgY2hhciAqY29uc3QgX19p
bml0Y29uc3RyZWwgY3B1ZnJlcV9vcHRzX3N0cltdID0gew0KPiA+Pj4gIkNQVUZSRVFfeGVuIiwg
IkNQVUZSRVFfaHdwIiB9Ow0KPiA+Pj4NCj4gPj4+IChsaW5lIHdyYXBwZWQgc3VpdGFibHksIG9m
IGNvdXJzZSkgT3IgbWF5YmUgZXZlbiBiZXR0ZXINCj4gPj4+DQo+ID4+PiAgICAgICAgIGNvbnN0
IGNoYXIgX19pbml0Y29uc3QgY3B1ZnJlcV9vcHRzX3N0cltdWzEyXSA9IHsNCj4gPj4+ICJDUFVG
UkVRX3hlbiIsICJDUFVGUkVRX2h3cCIgfTsNCj4gPj4+DQo+ID4+PiBmb3IgdGhlIHN0cmluZyBs
aXRlcmFscyB0byBhbHNvIGVuZCB1cCBpbiAuaW5pdC5yb2RhdGEuDQo+ID4+DQo+ID4+IEFjdHVh
bGx5LCBpdCBkaWRuJ3QgZXZlbiBvY2N1ciB0byBtZSB0aGF0IHRoZXJlIG1pZ2h0IGJlIGEgInN0
YXRpYyIgbWlzc2luZyBoZXJlLA0KPiB0b28uDQo+ID4NCj4gPiBTb3JyeSwgSSBtYXkgbmVlZCBt
b3JlIGV4cGxhbmF0aW9uLCB3aGF0IGlzIHRoZSAic3RhdGljIiBtaXNzaW5nIHlvdSBhcmUgcmVm
ZXJyaW5nPw0KPg0KPiBJbiB5b3VyIGNvZGUgY3B1ZnJlcV9vcHRzX3N0cltdIGlzIGFuIGF1dG9t
YXRpYyB2YXJpYWJsZSwgd2hpY2ggdGhlIGNvbXBpbGVyIG5lZWRzDQo+IHRvIGVtaXQgY29kZSBm
b3IgaW4gb3JkZXIgdG8gaW5zdGFudGlhdGUgaXQgb24gdGhlIHN0YWNrLiBUaGlzIGNhbiBiZSBh
dm9pZGVkIGlmIHlvdQ0KPiBtYWtlIHRoZSBhcnJheSBhIHN0YXRpYyB2YXJpYWJsZSwgYXMgdGhl
biBhbGwgY29uc3RydWN0aW9uIG9jY3VycyBhdCBidWlsZCB0aW1lLg0KPg0KPiA+PiBQbHVzIEkn
bSBtaXNzaW5nIGFueSBhcnJhbmdlbWVudCBmb3IgdGhlIGFycmF5IHNsb3RzIHRvIHJlbWFpbiBp
bg0KPiA+PiBzeW5jIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgZW51bWVyYXRvcnMuIFdpdGggdGhh
dCAuLi4NCj4gPj4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGRldGFpbGVkIGluc3RydWN0aW9u
cywgbGVhcm5lZCBhbmQgSSdsbCBjaGFuZ2UgaXQgdG8NCj4gPiAgICAgICAgIGNvbnN0IGNoYXIg
X19pbml0Y29uc3QgY3B1ZnJlcV9vcHRzX3N0cltdWzRdID0geyAieGVuIiwgImh3cCINCj4gPiB9
OyBBbmQgZm9yIGluIHN5bmMgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBlbnVtZXJhdG9ycywgbWF5
YmUgd2Ugc2hhbGwgYWRkDQo+IGNvbW1lbnQgaGVyZSwNCj4gPiAgICAgICAgIC8qIFRoZSBvcmRl
ciBvZiBjcHVmcmVxIHN0cmluZyBsaXRlcmFsIG11c3QgYmUgaW4gc3luYyB3aXRoDQo+ID4gdGhl
IG9yZGVyIGluICJlbnVtIGNwdWZyZXFfeGVuX29wdCIgKi8NCj4NCj4gSW5zdGVhZCBvZiBhIGNv
bW1lbnQgSSBoYXMgcmF0aGVyIGhvcGluZyBmb3Igc29tZSB1c2Ugb2YgZGVkaWNhdGVkIGFycmF5
IHNsb3QNCj4gaW5pdGlhbGl6ZXJzLg0KDQpVbmRlcnN0b29kLiBJJ2xsIHVzZSAiQ1BVRlJFUV94
eHgiIGFzIGFycmF5IHNsb3QgaW5kZXguDQogICAgICAgIHN0YXRpYyBjb25zdCBjaGFyIF9faW5p
dGNvbnN0IGNwdWZyZXFfb3B0c19zdHJbXVs1XSA9IHsNCiAgICAgICAgICAgICAgICBbQ1BVRlJF
UV9ub25lXSA9ICJub25lIiwNCiAgICAgICAgICAgICAgICBbQ1BVRlJFUV94ZW5dID0gInhlbiIs
DQogICAgICAgICAgICAgICAgW0NQVUZSRVFfaHdwXSA9ICJod3AiLA0KICAgICAgICB9Ow0KDQo+
DQo+IEphbg0K

