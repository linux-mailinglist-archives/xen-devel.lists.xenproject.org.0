Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9036A61473
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 16:03:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914776.1320431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt6Yd-0008PU-0O; Fri, 14 Mar 2025 15:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914776.1320431; Fri, 14 Mar 2025 15:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt6Yc-0008O4-TW; Fri, 14 Mar 2025 15:02:42 +0000
Received: by outflank-mailman (input) for mailman id 914776;
 Fri, 14 Mar 2025 15:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJYk=WB=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tt6Yb-0008Nn-DQ
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 15:02:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f403:2612::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f7d145d-00e5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 16:02:40 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 15:02:37 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8511.031; Fri, 14 Mar 2025
 15:02:37 +0000
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
X-Inumbo-ID: 5f7d145d-00e5-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha2PYnLkk8yLWpUAk2s93zlTekAD/IcO1+EXrR0xXBPDUJStaTH5fNR+10xeQ1X2p0GtG5bPqAiUcsNvX/ZZZ49RvVKnkEDP0Xg37kwzaBOuS7aRb6KyG5oFYYrHgvVhGgYj3s0eWxldczCXAl9gNMa1TdR4lm50VJ9B35v2sL3aW8GcsQgESLRklZfPteRq9w8fvMs5l+8KuolCsxP7cgc51zghb9pQG1i+vTP0XFM8P6qNrqzOUj0KhVkzo0H7Lt79a1rtr1IfAkZoVoLYL4quBe51GgeORxJYvrViHV6+/VOgDvZvYMPcg4moJPswnwZljEEvpXljhZsdBWY+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz/UUX6mzr4+LQUxK33o0eylpDeWHEZ2iCAyKYgU2V0=;
 b=PQahEAhprG8rIX1KdH/jLtmGAPo+zMSrPASw4GlWFdhXB9FvLAZuUg4Haf5c1BVA+uFFzZa7uY8l8wN3F7TKSaJvCqN8k6Ng5Nl2sT8wt5YluXzwPtfiYeUEKZ8VX0IUdz6498h9sCDxGS3r2a+O2isAkiowc5r4PEzoIjq2+APTTeo+TLhDvoeKipiQ7MAH7xaGybAG1ALW4EuG9Dysb7XdEHNLlTqUgrYUHZDdYIxcq2/FBhSCq3WdRAXwbtvzbHoalvoCah6MuZmnjPu1ruNf+BUCtZixVToOy7oW3vyr0rSSq8uTZANjO4hzhFakcY59LSL50ngr1+fV0SGvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz/UUX6mzr4+LQUxK33o0eylpDeWHEZ2iCAyKYgU2V0=;
 b=EEWr8rGPk3ZzStoOpP74s9IgJ3Ye2/pli6gMzGTMHm5KoSKXuO65tmjBWY2HgxcfBE91V8mI6ioJ0tYJr5IzFy4Lhi3CeRbkRYokjUHDg8dgRc+nszF3r+uGOM7jCy4MiYUvC979p0X/1rDw8TSCFeTz4sLWJ3kOvQikN1cKBXaD1IMb1RDtHu8T7kOveWelYxJZz0xwkY9sM6IL/7NUvrosV5IslmCo7zKSYrqBPzdpIvF40p5awp6+wkyk548ESkXgPsGPE1u4BTayJjvCfb2LRYL1sZw6vVM5IjYb+V+Tc1yV1KEcBmfw/C3F1RBWyHHuOtnwnXttZsZrA4YyMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4cab2232-1021-4cde-8ba7-d3c196ab5131@epam.com>
Date: Fri, 14 Mar 2025 17:02:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86:monitor: control monitor.c build with
 CONFIG_VM_EVENT option
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
 <39235285ffe341e446bf0fd5cc345379ae394e50.1741772330.git.Sergiy_Kibrik@epam.com>
 <871f6abf-5046-4435-91d6-b8ce2d9dac06@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <871f6abf-5046-4435-91d6-b8ce2d9dac06@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU5PR03MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a16b8c-6531-4110-7c90-08dd630941db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkllT3grZDYrTXlxdzFINXVOVUNHendWTEd2Nk0wUThCRzBJcERmaURPbnNP?=
 =?utf-8?B?cTE4YVRrOGdPMGZVSFhoRmRWNS8yK05lMGFYajR1eUxRaEdncHVhSlh6UTRn?=
 =?utf-8?B?d2NKMUNHdnlQNlFCcXA1cGpFV2hHdVFBVmFHRUx6TFAyNTRmbEdZV3owaldB?=
 =?utf-8?B?ZmtiYVpNelZBTWhld2JGNFpJdGF6anZsUlp1YjR5anVVRWFVWWpsMktJUzA5?=
 =?utf-8?B?NXJrZXg2clJsd0xnL0pYZ1NwZ1RjU2cxWXBQdlQ4U25EV0pkWE9kald0U1ZX?=
 =?utf-8?B?M2lKTFJZMXpSWG15UWppUmVTZVdmT24zR0RGdXBJUnlKanB4a2JmTVlKK3FK?=
 =?utf-8?B?TW5BUXJEZXdRdWR4OGd4MUNqaEFyR3lIdmRROVNEbzl4NUdTUjJtMCs1eThz?=
 =?utf-8?B?OWtqTDFXdVM0UnZ1anAyTC9qL0JhMWJER0hIYzFwZ2ZIOVd3MDZ2eUs0eVRW?=
 =?utf-8?B?WHlsdFQvY1NXUGhjSkNaRGQwaEVTU2tEd2Mxa3ozNWFMU3gyZ3hPUGpsMXM4?=
 =?utf-8?B?Y0JNeFlvTGtoNEdUU1ZoMFJ6Y254Tm1lUitzZDdPSERmeUtKbjVtN0lYOGZs?=
 =?utf-8?B?aGdhMmIwZ0VHUWF3bTYyTkxWWnNHZjFRNVFXQjJvanNmTTVvQmU5QzlHbEJD?=
 =?utf-8?B?UElxMTlBM1g5bDExZmtHMGhPd2NyN3l1RnM5YlFiOFJpRFdUQXdiSXJuNld4?=
 =?utf-8?B?ZytQYzFQV1AvWE1GVGFuR3FvV1dJbXZEckd6bWMvOFJVZ21vOVdpTnVxckpO?=
 =?utf-8?B?aW1DR2JzNWpqbHEvTDBZem53YUI5TXVTdzdiZm9RdWFScVJQTGs5eUtnd0dl?=
 =?utf-8?B?MUN4bzdDa1c0T3R3a1IxcklnYW1nUTFtOC9Rd2JrSGVzcE9VNzQreld1Vjdv?=
 =?utf-8?B?dkJobEZQc1haMGN1OWVHRUZPazZuam91bFRTamlITGVGVVBRRTN5NytEMXN4?=
 =?utf-8?B?RzA1REN3b3BYcUhxb1VLNHl5dnpVTU1CalhlZTQ1ZEZ4dDFwVi90L3MrT1I2?=
 =?utf-8?B?dWZWQXpGN2cvdXQxSTIwbGVicGY3ZHdkTWE1ejV2ZGh6Vmg1SW5YMlpiUEd2?=
 =?utf-8?B?VVV3RklSNUNkNG9XcXVFWnlybjZrRFR3aElqb2djckZYZGdPQnZZczBoczRn?=
 =?utf-8?B?NkVzbll5ejdiWC9OS1dlYmZYNlMyQUM3enVGT0ZxUXZ5cTdqcmU5VUtnaGxD?=
 =?utf-8?B?SlczR0g1d2ZvMEp4SGNRVWNyakNNa3hRendZcEg4Wm4vOUplV0VYdENubkpP?=
 =?utf-8?B?R2h1R21aT1pSVnU3ZjBDZm1VeXFrNHREdXFqQzk1Z29BQVBIZjhqT3hGRzRH?=
 =?utf-8?B?SHc0TEsxRlhwb1h6NXVNSGhsQmcyenlyWjFvb1YyK0xCVnFsWUs4S3g4RGg2?=
 =?utf-8?B?b0JQbnkzM1pzVSs1YUZlZmtRRUYxRWx0cDZmcDB1dlhLcXdTT2l3ZzB1MGhD?=
 =?utf-8?B?d25GdGloNTdFNGFQQjhzM2NaUmhsVDAwQ3RTSkg4cmlabFB3UzhKVHcvNWhr?=
 =?utf-8?B?SFVuSTJ4UG94Y2RuN1pnaVZmdG02MDhWYjlSM0VsWXR2d0Y0eUNrSmRpdjg4?=
 =?utf-8?B?RHl1VmthRHZvd1lYVVFFTXFRcFoybDhOSXlsMVVkbjNidHFUTDVObmpvZk56?=
 =?utf-8?B?cmhJL09GYzFaMVdFN0FDLzNRTHdMUnRZNzJTS3VZc2FRR0MyVCs0VW81OXBr?=
 =?utf-8?B?ejNteithanI5UFdqc0pzRUxKTU44WHFYTWtzRFNPVWU1TmpSY1FwZ2VrRzJl?=
 =?utf-8?B?VHkzdHRRK1c0MzhnWkRkUGF1MXNncGJQNWZMdjZzZ2N4U1lmcUhwZ2Z6bGlq?=
 =?utf-8?B?RkhQem16eW4zYndNdG9oMkoweEN1aWR1bXZ3ekNCUWhLOUNUOEVYdzZwR0RS?=
 =?utf-8?Q?slKru+Bb8grBd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlJZR0dBT2ptTWMrK2gvbVdycFZJc2thMENaSDJCL2pzYjM1bzdnVVgvcFdz?=
 =?utf-8?B?U0w0VTlwY1hINzlyaWJKS2lJWWs5dGJyL3RzS0FOdXVrbjd2MnBzbC9qT3BD?=
 =?utf-8?B?bXN6cGFRM0NBdHMwNmJOenFXUnJyM05TcDEvODdNNDNZa3dDbHNSaXNjNS8x?=
 =?utf-8?B?MlRpWWJOdk14a0ZNZ0cxZm1ZYUNyL0hWVG5nOEhRR256TTVPL21mbGo5Q0Fh?=
 =?utf-8?B?aTZmNmNGblBRWHlwSHFLaE1neStXWDZRYmFObnhwbjNPS2tLU1o2RnJjcUFa?=
 =?utf-8?B?TW1VbEcvbXNFRll5ZnN3Njd6QjFsNG1lZnRvMUFmckNQdHB1VS9sUDNUMWVJ?=
 =?utf-8?B?Q1NucUs0L2JBZ2ZvTjFwb2YyeDIvdDA1RkhFOS9MZEd4TjlVSUtzSHJDaG1V?=
 =?utf-8?B?YjdyME9xKzZSazZDa3M4Y215T3BOR2NkUGo3S2xCM0lHYWppcXZ6dFI2a00x?=
 =?utf-8?B?RU1LNzQwdDM2ejhsZkthM3pEdVVtTkFJZWdUT0trazZialIrNE03a0N5WU15?=
 =?utf-8?B?VmZ2MW9PRlJmVzFsY2dIeWxONVdKUk1kK2ZhQjRuelcxMTFsMGRqUm9NTUhC?=
 =?utf-8?B?U0hJaVhISVcxR2RuUUd0MUx6U00yVzJmK2kxV0tldjFMdDUxNE9oK1RSUHNM?=
 =?utf-8?B?cVErNnlxSXlCeENtU08wa3FKYkZOWXA3M2ZjTFJPajJWWCt4OFpWT2lNV0du?=
 =?utf-8?B?VXA3NEJJeTdOc1Bpalozblh3a1hwTmJOd1NFQ2J5WTNJQVQ3VXJBSExraUJu?=
 =?utf-8?B?TEMybXlqdFhKL0s4WlIzWVc5dS9oUmZILzFjOVdXYkU3OVUyMENxcGt1emxY?=
 =?utf-8?B?OFZVS1lxNVVQeUgwd2ZWMjA3a0tWOFoyR0JuVGFxVXNYcGhUMStiQ2ZNUUZM?=
 =?utf-8?B?TUJ5VDVHVjcrdjJ0aGs4LzdPOHJ3N05wdkVXQzZ2ZWlqWGx2Q01vM0NqMkVO?=
 =?utf-8?B?Y1FqM2VQL1pIN3YxZEhmNGVOZk5wQWxwWlFEYXYzZ054ZERKNXJkdFE0ek1v?=
 =?utf-8?B?YzhHSW5TUFEwRDVGbGxsRUVQb0l0ZWlnOTlkL1hONlk1Ty8rVFcvdkd4MzRR?=
 =?utf-8?B?aktzVmZUZWNtaWsvV25IT3VyN2dFa3NTOE9sTjBBd0xzTzlNNjg4dVVuRVBT?=
 =?utf-8?B?OXJmU1RGdW85RlRlVElGZXFKNk44eVIyaUttR012S095djJvOGwwd0ZsdC8z?=
 =?utf-8?B?dkJjbXRxM04yeTQ4bC8xNVAwVHhSc240MUx3SDF0ejBYNzN2NGM3WEZWSkRJ?=
 =?utf-8?B?Q3YyTUZqemxTVEFDRWhCdDZtZFpoTmpRd2NyS3RobGxXWjVTRU1KdGdPdXhi?=
 =?utf-8?B?eW9GWlBtUVk4dXdTaEgzUVArQXRCMVB3TGwyblFqRmJMQmNwL0xrUzVidlJ2?=
 =?utf-8?B?NTlKOExJVGxkODY3NXpBeFRNRzgwRFAxaTRwbE1YM2s5eWtZWlBiQ3dBY1Fs?=
 =?utf-8?B?anRpU2NOMmxGbFRHQTFLMTNzbDRZRmZuRmEzcm9GMkJSdWpzNU5YNUpOZE4w?=
 =?utf-8?B?eThLVmRhNGhsdWFkQ0F2c241LzJZZGljaVJUMC9tSS9zdENEM2xRUithTFV2?=
 =?utf-8?B?SERXVVowWXMzVHJJalBxQWgzT21EcnBsUzFlb0ppUkw4NFo2MmxZMi9SWlps?=
 =?utf-8?B?QmdZUzVSWk1JMXNmKytQVFZsWGpYN2Y3K2htclNDa3QwSmxENXI2THdlUHhS?=
 =?utf-8?B?Z0hmbVd1OENoTktIVWU1V2ZoSkV6cVRyNmQxMHVuRHZob3BRRmNFM3UwT0U0?=
 =?utf-8?B?cFU5NXZoZ1NXcXFNTjVZMEZnWlUxNlhxZlp6TEQ3SXNoTzZVd3Q4NUo4bXFF?=
 =?utf-8?B?c21jS1hDQTdPMmxyTUQwd0g2S0tiK1BOUUlvMGEwRlNBSWZQUTR6dUZHeGdV?=
 =?utf-8?B?SHhwT1N0eUFXdElBbkR2NVpieXFnVlNFTVVOcnJIY2FKSWpoMmN5TEMxUDhM?=
 =?utf-8?B?RGxhUys4Q0EwZG4vK0Rpb3p6eUdrMWhaSUFhVWZENWpiaTUyaWcrMXJSL3NN?=
 =?utf-8?B?MzRUdm9sV2U4RnRWN3hlc3EyQnFuSkVhRzRMd0pkTnltQXVLUUdRNE1kQnRI?=
 =?utf-8?B?bys4YmcwSXhwaGdnR0VOS2EwZFdRVkhncVhuTjJvN3ZveDIyN2NzK0cxVlRl?=
 =?utf-8?Q?eRDCxp+6ARiIq9x4NHull7h5D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a16b8c-6531-4110-7c90-08dd630941db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:02:36.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz9E1ilyuNaWEmHWpETg/fEgArPYs8IHZcipHe0DdF5i3KdPKLLCWz6KKLJo2J0fr53hceZzDsEHEciC3xgTxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10441

14.03.25 13:11, Jan Beulich:
> On 14.03.2025 06:23, Sergiy Kibrik wrote:
>> Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
>> relevant and specific to monitoring. This is only to clarify at build level
>> to which subsystem this file belongs.
>>
>> No functional change here, as VM_EVENT depends on HVM.
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> I see you've adjusted tag order in patch 3. Why not also here and in patch 1?
> 

oops.. I've missed those, sorry..

   -Sergiy

