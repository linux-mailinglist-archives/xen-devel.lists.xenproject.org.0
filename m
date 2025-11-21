Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8567DC7AC42
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 17:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169351.1495100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMTki-0000AZ-8C; Fri, 21 Nov 2025 16:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169351.1495100; Fri, 21 Nov 2025 16:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMTki-00008v-5a; Fri, 21 Nov 2025 16:12:52 +0000
Received: by outflank-mailman (input) for mailman id 1169351;
 Fri, 21 Nov 2025 16:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Phs=55=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vMTkh-00008p-GO
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 16:12:51 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea8900d2-c6f4-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 17:12:45 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA4PR03MB6893.eurprd03.prod.outlook.com
 (2603:10a6:102:eb::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 16:12:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 16:12:43 +0000
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
X-Inumbo-ID: ea8900d2-c6f4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROesC2/q/m8RCU1W8EkL5mR/LBvcapiKrR17/T9zFjHSMk/gK0S1o7P2B2l117rlDAPZpkhYk1QBrN1HBMqnmJ0yxg1XLoAf9O9aLfnCjFWm0kiX9UZNr5pPlLDOgoABOR/IQIW0zCsf+JKsIdn/asnHRWb7I4qMgdJJFJQIjqgpzkFUFOGJJ3CtiJXI/7yVf3jwVmTPFokvO4gzT8WocJA80Qm/4yFne1DKKVLKjju+2JDOoZynqKRUoi1zZCwqR2RkDiic/tnYvmf7XBpi4Mzect89wnQzLUkrZIsTwk00e5Qhf1BxXuWwwLY4cxcTXTIqnG5+/9yVkeXrAc05jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k23mqt9vGiQn+5NT+svvRsKuhNjONLrhUic2jPaETTQ=;
 b=h3y1MqSI1Z35hWott7pye27uudnZ0idaMqCmjWhwzz7KgQqeRd01mwiyyfQZs3kDLySEPLrU4eGSNJX7qqcyTP+vHDb9LF+GagFnhE6agO21o/8CWjiaG1UKRaZYsCxNkz5d/sRbhbiqY6/6kXKR8dV5KRo7kwLG2uN9Fsm/mXp82Zx/nC/QBrI/JvkOvf26aVTdVvmjxfkjpckbnzI5D5NHxzGJRI7eE/qdL5tDSDfWTidWlZ+qBYplV0ypA0IseySnN9TFs4lU9MhbXmlE73O3cY0dqOoCceC2i9Tf0elNgaF3nsF2n0ATp3nXXZazSWDmPMxGX+BtsfrZhr7vyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k23mqt9vGiQn+5NT+svvRsKuhNjONLrhUic2jPaETTQ=;
 b=jnh7hLJWR6/kbeZxhM+w73WMRHuZWTqJF49qSvFlD6OJ/OiXrQa/Zbw/h5uT1Mi6Nx/xot0C01tqwvArZsQ48NqQmfxAaZBUgfVwb5Gdm7VtZLeM3b9pUaFQlTWw+pYCoLfS0+52bHnyFqxnKJxgx98WG/fc19JyFSvBmItV3DORfCblnZIjZMYjAl3jZff3Vd8joOdd+1GEDguelpxoE+Fr1kNp0g/IWL04tPlQtbhZlYjhS3kdbSwwXIV+EvGdlMehAEepPWcd7eGZFiZXp52nR9XD8SG2RAEeDZN6vDlBFlwKm4jmBzTLoru/l6E3UxOyr4RtRgViNW7uLLw6CQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"Alejandro.GarciaVallejo@amd.com" <Alejandro.GarciaVallejo@amd.com>
Subject: Re: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v4 6/8] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcU8JY4MUEJP5v5ECe3RrLj+fwX7TwwqoAgAyZJQA=
Date: Fri, 21 Nov 2025 16:12:42 +0000
Message-ID: <e87dbb8d-0f4c-49a9-bcf7-93667e5ca181@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <656cb01061f2ec726eb23784d01517a94117618e.1762939773.git.mykyta_poturai@epam.com>
 <a3628426-cc6c-4bfb-892f-895195d5d87d@epam.com>
In-Reply-To: <a3628426-cc6c-4bfb-892f-895195d5d87d@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA4PR03MB6893:EE_
x-ms-office365-filtering-correlation-id: 0494b53f-abbd-4d1f-52b6-08de2918cd29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzNIT3pWT243RWlaaWhkaVFlT0l0QitxWHlINTZLdVZNbnhmaWRkdWlhNjRk?=
 =?utf-8?B?TitVZlVRR1U1aCsrK2J6Y3J3djV1Q20xdU9MZldVMzhVbnM2UG45Q0ZRK1pJ?=
 =?utf-8?B?Mis4ZmwxTlZ2UmhzK014RGVQcUltRlMzNnZSVkpzTFl5MUIxWGFaVzZoUTB1?=
 =?utf-8?B?TFZWWWU3RGFoWjBSK1lVVWRLYlhUV0RJRHJZR2hLSjdKS0E2WXgya0NqSUFE?=
 =?utf-8?B?dmM0azJUbWhaWXduL1ZEWlZmRHpNSjBCdjJIQjg2V24wZWZGbmwzaEw0Q294?=
 =?utf-8?B?OWtNbGpDdVlLS29CejlnYzdUV1M1bGkrc25FTSt5Nk83Z1VyQ0NaMkcvU0Ez?=
 =?utf-8?B?dFF2VjkzMi8rOXdWUHRyYW1TdU9EUUpVUWRoYmprTXdwRno5RitWdFJaZmJ6?=
 =?utf-8?B?R3FDMUdHUVo1bkhTTnNKNGllNzFZTmxQcE5YdmlCUDQrZnVEaDNXQUdFNGdC?=
 =?utf-8?B?dGVwVVNCajZzZ3lpZTlOeG1xbVlZTnhSaTNlTlRWcjQvTXR5d1NJU2MxOWpF?=
 =?utf-8?B?cExRQ3IzV0FTOW0vZjdENzFtSFF6OXJyZjlJTHljdmQrTTExZlkralY0SjJZ?=
 =?utf-8?B?bFBJVS9JVi85N1B0emJzYUNtVGFtQlZqaldMU3oyWjJ6cWFFdkdHdTA5WWdo?=
 =?utf-8?B?eHhhQ25ERzhURDZyZW1hS00wei9MTWx0bnNzeHh3Sk1meno0NjkxV3B4eCsv?=
 =?utf-8?B?MzdEOENjNFVRY1l0RVBGaERlaHVqUTc4OXlkY3JKK3NTYS9JdDRROHVLaW5V?=
 =?utf-8?B?M2I4d0o5YURMeG8rQXVpVFgzK0ZIU2c4SEJLazZJSjdOM1hpSW45SVNDQTE3?=
 =?utf-8?B?NXhtNHJlMUZ5NiswbDhUTGdlUG9YZ05kVVBVN0pCS1E1V0krZzkvMS85Ukl0?=
 =?utf-8?B?VmVXcTZwQ1UybnczUGVhYzFQQmV4WnIzTm5NVU9GaHhVTmwrSjlybjlENXdS?=
 =?utf-8?B?UVpQcFJTRWZMck82UUhCT09aRjdHL2pLNnpOVHVxc280UGhBR0pzYmo2a3RS?=
 =?utf-8?B?c2xkMnRtdWk2V1NBMUFlVlR4UXl5bklKMSsxT2lrSWlpYmYwQkNYTEs4cGYx?=
 =?utf-8?B?elNQN3hUVVA2MkNLL3lGTUpYazNRMWdjVjkvUHpQT3lSZDJ5a3B3YkZVMEUx?=
 =?utf-8?B?bDdEVFR1NUJtMDQySDU0S1hmRnFtVkpTYTR2NTNKUnhaZTZxeXFxNjdKbHFv?=
 =?utf-8?B?QWRsYW9NMTZWN3Zrd3c3bkR5QXp2M3dMd01HNDhFUTZTa2xTcWl3K0hWQ3Jm?=
 =?utf-8?B?OVlHN1dHUDRzcVhBUERrS3p2NnBPRFVVdi90SXBwZkk0MEtqVi83UHZRanUx?=
 =?utf-8?B?eGowUXB4ajU1d1Q1YWhsY3B5d09RRU05MkN0Yy9KeWltTnJuc1dUZ3JoMkx4?=
 =?utf-8?B?WmFQN0Ztb1JZMDFtbDQyREVyampDRGQyOUJnc00raklUYmhacVU5UGdveEI0?=
 =?utf-8?B?RFZJNDlUUEFnb3ZwaHJtZFpTQ2FWSVlGUmlGRXJRcWdaM3NtaXNTNW9ZUXRL?=
 =?utf-8?B?L0xPY1lYbWtZdlVrV3ZjQ1hiR04ySWlkVDhSQk8wTk56M0Vybkh1ZGhKZkJo?=
 =?utf-8?B?bU1hMUZnWHVINDRlaExNejI1eTRFaE1kcHdLOU9wUkY3NGs3MXFBYjVIcjlS?=
 =?utf-8?B?Z21EMnBXSFRnTk5tUDYzUjVRVVY1MmMwSHN6c1FqeDJiUTJSa1d6Q2p5NXJO?=
 =?utf-8?B?Ky9vcXVoNXh2b25IT0laS0FYSnNaNFVxN01iakJDd0xaRUwwT2c3b3J3TytF?=
 =?utf-8?B?dzhsL1l0ODI3eU9GOUNQazByQTlhQXpMMDA5V1pkQmdHUWJwSVovZGtRajBp?=
 =?utf-8?B?QWo0RzYySUkydlUyWm14R2tJRFBQekFid3lMZ3ZvY0ZENTJoK2Y4VUpYSmhj?=
 =?utf-8?B?VWxiSDlzbEt2d0ozUUdhVDQxbE15NVpjK0x1d01RZXFpOWVQdHJmUHhNVTZI?=
 =?utf-8?B?WC83d1k3NkVZK29UVzdjcllmeFQ2R203a3FjWC9yQ21MaWgrQ3k2a0ZpMmQ2?=
 =?utf-8?B?R09pMFBSS2E1eXJCU0NIcUdvcXR4S0ExQ0tYclp2ZCsvbXAwenVKZFE0MzFD?=
 =?utf-8?Q?xkELNx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0Y1cHRDRS9Ya1FxdFF4VURKRWNOZ1JPQXY3WE0zWGNVUzFTSW9uNFFoMERk?=
 =?utf-8?B?YWtkVTNpSzNpRURxZHFMN1JZL29jZ1piVmNIcTRNb1BWb3dGUlRwbU10THNy?=
 =?utf-8?B?Q2dsalVUaDV0VkJhM2pZZ3NSN3NMUFhhd2RSUWpmOVlmOFJsR1BKcTZocEVw?=
 =?utf-8?B?UG5rNEdMSkhNZ0dsc0M2TnpYM3p0UzJDbFZ6UVNzeXgvQkJFNWxUS01ZUTZE?=
 =?utf-8?B?bFFBRXVVeC8vM1J0SVNXV3ErWmNCTlhycjYxWG95bGNxeUpPL2srS1Fia1cz?=
 =?utf-8?B?a2duYVhSNktJSUk0NTBWR0xjVXJPL05xUW8yTWxOcjBkRlpCYklIN2w4NlZh?=
 =?utf-8?B?T0xZa05kcmdMZWIrZlhIYXZNcHdldC94ajNheEE1SGtjejlnN25zOFlydDVK?=
 =?utf-8?B?NUttVUtXT2tKTktWeHE4Tm04bFhUQlk2dXlxdlRVb3BrMndkMXFjYXRkcytv?=
 =?utf-8?B?R1l2TjZnZHFTcTVVTW1ReDhmRnBlNzhnV0VoclZIVkpXeGVsSmgxaXpaVmdT?=
 =?utf-8?B?MTh1M0RFYzFFWEc3MjM1S1JJbExQeWpJMGloYXYrb1BBTFF4SVAwWktJRnNT?=
 =?utf-8?B?SmVFWHFVQjU4R09HQ2hNUmJLRkY5YWtYa0pxMHFUc0tmcjU5RGY4ZGhpM2Vw?=
 =?utf-8?B?d3dTY0NLSWJJNldaenZvVUtHdXBGQ0VLVkx5Rlh0QjhzRWllaDM5YXhzOFFU?=
 =?utf-8?B?ckxKUms3RjBRWFQ1dDE2MytmaTZpdGh6WUFoT2Nwc2xBVHdGajhnZ3pkVTRo?=
 =?utf-8?B?bVBFZCtqR3FrQ3lKckxzWEsvUFR1YUIvZDRPWjNOREl5MWxVOVgzYkdIdDlP?=
 =?utf-8?B?bXBrSzgyNDNUYlVWUC9OSDdvc3AvVXJuQ25XdmIyaUZaV09QRUNIZGgya1Ur?=
 =?utf-8?B?WHpSQm43WUV4cm5qa1MrR2NGOGdYOVVFYTFFTWV3WGNrRGtiUlcybnJpejZ6?=
 =?utf-8?B?blBmcjl3ZGFwZ0swWEdYaEFZWVIyZ3grVnhSUWZVSVA5eGlUWXNtZlJyVCtT?=
 =?utf-8?B?aWZlZjNvMkRPYmdaYzByeWs0anpRK1hKVGUzZG9QZkx0YWw4MFF2M1Q5a1hF?=
 =?utf-8?B?Wk9tejhmamdhUFRxeEl6NEltZkUrQ3d5ajZtMHRnbTJhUWxTVHU4Q1RCT2U2?=
 =?utf-8?B?Z1BXUi9oWXFvNC9wOUd1K0FLWTJlVGU4bGtUdWwxQnR3V3lBc0x3bDZSUi85?=
 =?utf-8?B?VlpGcllLNXpJUzFUYWNKR0ZTK0M4azg3UEF1azhubHJ2T21ldEpwYUVDMW1C?=
 =?utf-8?B?SlFSQUlpM2xtSE5wVUpnd213Q21NemkxOHNtMXlGT21iN0xOSjlaek5TU3lY?=
 =?utf-8?B?aFRmVDlqYm1Xa3dPTjNKa21jcm1LYml4TmJhQjZYMDVuZktjUFdwZkpUWWVD?=
 =?utf-8?B?dXlLbTRzUHpNK2RsYXlIUXJ1bk5KYk5icWxXQVh2dVU5bUZwVE5TMmNqUkQ3?=
 =?utf-8?B?YVZPRzhUOWZkd05GOUliVDVsKzJrZWt0cjlmNFBPa0dPUWlQQ09RNTNSWDMz?=
 =?utf-8?B?dEVRaGZwcmphODJSd0k0WE55aXMzMHFJTU44aytBT2oybXYwc0t3OVNITFFC?=
 =?utf-8?B?NE9sdHRCL2VGSGZsL1dxZ0dzbk1PWEQ2ZkU2U1B1TTlrS1Q1UVdUVHV5Zkpq?=
 =?utf-8?B?OUdjSzRiZXZmQjNuKzkvYitwZDNPWGJOOHorM2pYWWRXUVZhaG1sbjliL3RD?=
 =?utf-8?B?YlV2R2F3OFdXUDd3TlVwMVVRTXBMV0VhTDZhKzdHTnNrNEMzTHRpOXlWRlNB?=
 =?utf-8?B?Z0NpVWtjNkYxajdLSVhLVFFXSjhZSnl1dzFGV20vNHB3S3hKRUtCNzFrMnBh?=
 =?utf-8?B?TGljc0x4bkJHT0w4S2VmQ3krVjUxdTF3aGNENlV5a0lhK2Z5bVJ5bDJLM2FX?=
 =?utf-8?B?Tm1TdUVhaW1PU1VFVTVpZms0L3JzVXBKMjArVzF6bU9lQ1lHdjZnZmlaUEJV?=
 =?utf-8?B?dWR0VG9aclpvVnRKdWNhbWRBRzNpQk9OeXpObnVBR25JRkYrSktSZzQxVkd4?=
 =?utf-8?B?L2xUNTQvVS9yMVRmWlZ1enVwVXRMbmZCMkp0a28xdGpkdG5kQnpPT3FSWGtH?=
 =?utf-8?B?SnE2djFNbFZldFdNbjJlNCtkVXhBS2o0QmttQndoRjhYYUE4Q2NyYWE1b0hQ?=
 =?utf-8?B?NWNoZU5DT05YV3VCdHBUT2U3R3dkV0ZTMXdiVDR5TVJwT3Zyb3FUeGEwK0lx?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43BF5DEBBC787145B2403B6EE970B965@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0494b53f-abbd-4d1f-52b6-08de2918cd29
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 16:12:43.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgK5z+HeT+QKLuPRsdOiQfPKyLlKOnYlSxr6yLbNMHPf6cz506ua3N3F0rGPO9YI4r4XQjVmiJYLWV1APxAfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6893

T24gMTMuMTEuMjUgMTc6NDksIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiANCj4gDQo+IE9u
IDEyLjExLjI1IDEyOjUxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IEltcGxlbWVudCBYRU5f
U1lTQ1RMX0NQVV9IT1RQTFVHX3tPTkxJTkUsT0ZGTElORX0gY2FsbHMgdG8gYWxsb3cgZm9yDQo+
PiBlbmFibGluZy9kaXNhYmxpbmcgQ1BVIGNvcmVzIGluIHJ1bnRpbWUuDQo+Pg0KPj4gRm9yIG5v
dyB0aGlzIG9wZXJhdGlvbnMgb25seSBzdXBwb3J0IEFybTY0LiBGb3IgcHJvcGVyIEFybTMyIHN1
cHBvcnQsDQo+PiB0aGVyZSBuZWVkcyB0byBiZSBhIG1lY2hhbmlzbSB0byBmcmVlIHBlci1jcHUg
cGFnZSB0YWJsZXMsIGFsbG9jYXRlZCBpbg0KPj4gaW5pdF9kb21oZWFwX21hcHBpbmdzLg0KPj4g
QWxzbywgaG90cGx1ZyBpcyBub3Qgc3VwcG9ydGVkIGlmIElUUywgRkZBLCBvciBURUUgaXMgZW5h
YmxlZCwgYXMgdGhleQ0KPj4gdXNlIG5vbi1zdGF0aWMgSVJRIGFjdGlvbnMuDQo+Pg0KPj4gQ3Jl
YXRlIGEgS2NvbmZpZyBvcHRpb24gUlVOVElNRV9DUFVfQ09OVFJPTCB0aGF0IHJlZmxlY3RzIHRo
aXMNCj4+IGNvbnN0cmFpbnRzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE15a3l0YSBQb3R1cmFp
IDxteWt5dGFfcG90dXJhaUBlcGFtLmNvbT4NCj4+DQo+PiB2My0+djQ6DQo+PiAqIGRvbid0IHJl
aW1wbGVtZW50IGNwdV91cC9kb3duIGhlbHBlcnMNCj4+ICogYWRkIEtjb25maWcgb3B0aW9uDQo+
PiAqIGZpeHVwIGZvcm1hdHRpbmcNCj4+DQo+PiB2Mi0+djM6DQo+PiAqIG5vIGNoYW5nZXMNCj4+
DQo+PiB2MS0+djI6DQo+PiAqIHJlbW92ZSBTTVQgb3BzDQo+PiAqIHJlbW92ZSBjcHUgPT0gMCBj
aGVja3MNCj4+ICogYWRkIFhTTSBob29rcw0KPj4gKiBvbmx5IGltcGxlbWVudCBmb3IgNjRiaXQg
QXJtDQo+PiAtLS0NCj4+ICAgeGVuL2FyY2gvYXJtL0tjb25maWcgIHwgIDQgKysrKw0KPj4gICB4
ZW4vYXJjaC9hcm0vc3lzY3RsLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4gaW5k
ZXggY2Y2YWY2ODI5OS4uOTMxYWU1MTU3NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9L
Y29uZmlnDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4gQEAgLTI3NCw2ICsyNzQs
MTAgQEAgY29uZmlnIFBDSV9QQVNTVEhST1VHSA0KPj4gICAgICAgaGVscA0KPj4gICAgICAgICBU
aGlzIG9wdGlvbiBlbmFibGVzIFBDSSBkZXZpY2UgcGFzc3Rocm91Z2gNCj4+ICtjb25maWcgUlVO
VElNRV9DUFVfQ09OVFJPTA0KPj4gKyAgICBkZWZfYm9vbCB5DQo+PiArICAgIGRlcGVuZHMgb24g
QVJNXzY0ICYmICFURUUgJiYgIUZGQSAmJiAhSEFTX0lUUw0KPj4gKw0KPiANCj4gSGF2aW5nIGl0
IGluIGFyY2ggY29kZSBJIHRoaW5rIHJpZ2h0IGFzIEFyY2ggY2FuIGhhdmUgb3duIGRlcHMNCj4g
KExpbnV4IGRvZXMgaXQgdGhpcyB3YXkpLCBidXQgbmFtZSBoYXMgdG8gYmUgZml4ZWQgYW5kIGRv
Y3VtZW50ZWQgKGRvY3MpLg0KPiANCj4gbWF5IGJlIG1vcmUgY29tbW9uIG5hbWUgSE9UUExVR19D
UFUgKGxpa2UgaW4gbGludXgpPw0KPiBuYW1pbmcgaXMgdXAgdG8geW91Lg0KPiANCg0KSSB3aWxs
IGNoYW5nZSB0aGUgY29uZmlnIG5hbWUgdG8gIkNQVV9IT1RQTFVHIiBpbiB0aGUgbmV4dCB2ZXJz
aW9uIGlmIA0KZXZlcnlvbmUgaXMgb2theSB3aXRoIHRoYXQuDQoNCg0KLS0gDQpNeWt5dGE=

