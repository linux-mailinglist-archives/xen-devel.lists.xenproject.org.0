Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB394AB574A
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982986.1369357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqjk-0008AL-L3; Tue, 13 May 2025 14:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982986.1369357; Tue, 13 May 2025 14:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqjk-000880-IG; Tue, 13 May 2025 14:36:04 +0000
Received: by outflank-mailman (input) for mailman id 982986;
 Tue, 13 May 2025 14:36:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgbk=X5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uEqjj-00087u-8f
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:36:03 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96aee3bb-3007-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:36:01 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 14:35:56 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:35:56 +0000
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
X-Inumbo-ID: 96aee3bb-3007-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdyugGuWLqACgswvilKNaimB+Xl18GoJkOwQyY679viOSkdDu7S/Begy/fc8ZhbdDD/njdts64ct7b1OvQR5wfEpzjpQx0dX/vtSHLnBQM9UGif++XO1CpaJWGFjoJ8xAkTe6eJI42Lvg0Xd4YOukTOfeklIH39hFF/uT+jcDINlQbTAXcLGDzgfqP1NgAig2mgif5KNcV1JMzLEsbRzZzs/spl3NJjnI6eytOhhaWMBl5XUUcgCsoXCbbLL1mzv6kwlX6lc6qUKhsHpi450IMwbknZr8cOTbQC4ORghtjNiGMNakTu9/wkBEb3DTr91mLuagzUK79y/gqvG9l3mBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ou+H08DgpXPdH5Fc+TEuxB0I5RyEVSYEveewH+BYlk=;
 b=hkYzAAkPA0SEmkc3URoYErUREdeu23Na6qrpwKLqW7MMtdEm5lMBIHDPRwh6jr0XJhrBFcnoTyc7GV8YS1NGZtWMmScCMgyySRDtdemMUax538iJchdnwz6O04VOj3Z2uV8aNKU0psgJUm90Qmf78YJK1mPeRbmsVw7DYiRWrtNi7ljqP01GTIlqk64G8DuMENAjGuuQcYZsCd9tT+agmueGKXBZHBE039XtdVMphoA4iVgBRHyNACrtUlKOeSPYKsjS1yRBR3TV6lS0OQkjYKX17LhtpCcDLQxPDJ5V3AtRs5i08dBpz0VePzbKkTLVjGXOZpM69xuAUkZkjoOmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ou+H08DgpXPdH5Fc+TEuxB0I5RyEVSYEveewH+BYlk=;
 b=A9FOyUvhICamECM/vvRprZaG1p79hLGBHTowqXBGf9Dfn+glHrIK4pV0Ab29kFOdTPL5faWrzhvHPxlyuugCka7N9ht/DWaqQHVBUM6Dem+Tz0PmmXf5fyS6gW7lpCbMxvMeePaM+ALipUl/3Fu6tPtGZROwaC/mr5DqEQ50fFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <01ed25fd-a5bd-4f44-8e59-0f7c24738aca@amd.com>
Date: Tue, 13 May 2025 16:35:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen: restrict CONFIG_STATIC_MEMORY to ARM
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <7e5ae810c1cf542ea33b2a2e836e8d9d7b1749b2.1747145897.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7e5ae810c1cf542ea33b2a2e836e8d9d7b1749b2.1747145897.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: ca913d98-3a4a-40d2-7920-08dd922b78bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlI2K2o2S1ovQVgzV2dSV2VYSEg1V1VlMm9sVTRINEp1VXdwMXRoR2Rna3h6?=
 =?utf-8?B?MFNnMXM3TDhqeHBJTk54ejlLajdUTGxTZjNJQXZKVU42REh6a3MxTWg1eHFt?=
 =?utf-8?B?Z3F5SWxNWC96dUxEQUdWSlpkd0pmeTlsWU4vY1V1NWRFTU1IblhWTnc4VjZV?=
 =?utf-8?B?TzdGSWxxcEhZcnlmL2pYQXBNZS9FbGNUaXNNVU1WVjU3cjA1UUV0cTVrY0Fu?=
 =?utf-8?B?R0xzaWVYOE1TaktGNFR5TmNneWo2R3Z3Szh3R29Hb2VNWFI4K2U1Ni83Z3dL?=
 =?utf-8?B?VlMxZUN6QjZTZDJyWWhPTStiSStMZ05iZHNkejdZcFVQZ2tTL09MSHVKTERw?=
 =?utf-8?B?RkpoSkJ2SnlxQ0h4amFBd0dVa0NFcWhvM2xrZnMzWDU4WTlMRzVFdE9HUjJ3?=
 =?utf-8?B?VkdKWHQ4cUlQTDRuQVJNTUdzZ0R5aFo1dFdObGRLYnQvajBFS2NMV25USUJV?=
 =?utf-8?B?TnpISkhtYzZ4UXpZS1ZoN1draVk0WTkxZm8yVzFlb3IxQjlXR0ZWUEJhOTBI?=
 =?utf-8?B?clJpVFNMVmlZUzVSUzZPOGhqWWVqdzgwa2kvaUxGK09PS0xDdGZQUmNUd2VT?=
 =?utf-8?B?YjhybG9QLzExOWh3OEVtMUZWUWE2NXRlWlk0VlJ1WmdmK2RPUEVYcVRoM0NM?=
 =?utf-8?B?TVlCdUlVQi9IYWpIZ0pCelZ2cVNoVzBaQnc2cEc5cHE2QS9Mb3JzZzczWHBz?=
 =?utf-8?B?MzFtTGN2b0ZpbWsrZDlUSkZvSytXOThxWjBJN0N3ek5xNEpqdXhPbmpXMlZJ?=
 =?utf-8?B?UzM2RjRhZWc1anc3d21uQk9xcVltRklEZSsyTm9oRVhaOFpzMmlkMldaK1RP?=
 =?utf-8?B?NytqS3pJeHAya2VFUDhzbmlKQnR6dml3WFBQRUl5T2tyRWZqL2QxYm41YTJm?=
 =?utf-8?B?cmR6dzROZkxUZGpLQ3JEbVJsSHdKTmtqcGRoT2MrRWxRV3ZVbkFLTGVHZHFn?=
 =?utf-8?B?dU9KSGJGMHpKYnZoUEpNL3cyUnRDOG5CNm8wY2RaRFNRMm1qdE9CbG5LVjln?=
 =?utf-8?B?T0FWa3RoUmRsejdEVmZ2dHo4bGNtSmFtakRjR1RzMy9iZmF5dXVXalZScHRB?=
 =?utf-8?B?cmlmNVZzR0lYT2lId09YUjAra3FFcnZoK01xcnhuRis3ekFnWTE2SUdaWU5U?=
 =?utf-8?B?UGNxSUFhdC9aSkx3L2x4REFJNzZPZFZjN2MzcnhlNlpIZWYrL3ZaWkZ2U3RF?=
 =?utf-8?B?NnlTSGFCQjRaYm5GTmc5NHIrU2dYZ05qWUtXa1dnN3FYY2ZRS3ZpU3k0UUN1?=
 =?utf-8?B?Zm9aUFJFWnlrSnpSczVXMFVCQmxLZE5ualJnUzh6TnNBQWtVSVpiMDZNSHpp?=
 =?utf-8?B?ZjdPUG1rTnp4UW5VQnBLdU91NFJWTnRqV2NQU21qU0ZRUWlBazYyWTArc2J4?=
 =?utf-8?B?d3lBVWpMR1RJU1VLSDVxVlpKenBZVk5pVTdkQzI1SW85N3dRY0RWcW5qeUtr?=
 =?utf-8?B?SDdKUUhldlpwQXpCei9SdkN0UVRtVlByNXkwVm5CaktOcHNWWm9FVU53dzMv?=
 =?utf-8?B?TE5SL0pkUGlhQkVHTGhQTWxiZXNPWFlZSWdDM3pjRHJhM1N2WFIyZ0w3V2VT?=
 =?utf-8?B?M3pVZHZ3cnRERncvNCtFWjRibnFNdUtkYnpodWN5SnV5OXRHMzZmYmV0clc2?=
 =?utf-8?B?M1U0VDdSa00vZUcydHl0Sy9PMWhEZFlVUFd0NG5NY3U5bUFJcmN2cGc2QlVv?=
 =?utf-8?B?WjRCek9MVS9hZnlvL3ZxL09oSkRPdkU0QXVjaGJtdWo3TjNoUkRxQ2ZhcEpQ?=
 =?utf-8?B?djBuRmtUQ3l2d2t2K1FjYWgrU3hNcUQ0NTJYS1NMRExwVk9CZ2tZdStKV2pu?=
 =?utf-8?B?N1ArbWJ5VEtlVHZWWXFhRUhoTDRPaS83V1QrQWczejZ2ckhDaUhKRXRWa2tU?=
 =?utf-8?B?UDR4SGIvVUM4NUNUVEQvd3ZKTzdMdDBsQkcxcExPcm56Vnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnRRMUN1S1dsR25SVFJlSFU2bXQvM2JZbW1CVjFHQzd2V3MrRENEMDlNQmZz?=
 =?utf-8?B?c0xTYTJTOUVQZzJIaGZoVUwwNHYvN2lDM2hpQXJDTGQvV1YvQk11aWdJTkhz?=
 =?utf-8?B?ZUlZSmdXbVZoSE9YSCtCNS9DOWhCdHl6clJIMUhiM3RCaUN5Z0lFZE1TSFJi?=
 =?utf-8?B?UlpKQVNuNFBOTms4Z09SQ3YxNnpERnFvZkhBckhlaWVyMnhHeGNmM0ZvdlFP?=
 =?utf-8?B?VUlOQjJYQnFqUW50NjUvWngzd2ZnRTlJdFlISkh1TjBNMlI4Z05odGNNc1Vo?=
 =?utf-8?B?L2NFQkovZHhmZko0T2xxbzFhNWNsQS9hQ3M1UlZtRHpMcFh6UUMwWmNuZXB5?=
 =?utf-8?B?Vlp0QUxBTkRVSlAvQWRWTlFrbS9QblB2QS9Dc1VZN09Lc1pQZHYzNzZQN2wr?=
 =?utf-8?B?bTZEMUJWVk8zUVYwOTNPSUxZZzB6azk0S2lrVDI2Uml2RnlGdjYrYUJ3SXdO?=
 =?utf-8?B?dUxjMThZbllGd1kxTmhjUWwraWhlVUxWMEttRkU0NVBoblN4MDdvVXBuSk13?=
 =?utf-8?B?aXAxNGxJb1Y2ZTAvVzdrN1UrdHFDRG8vSzF6cFAxbFROYjVvaFltcHF3OFF3?=
 =?utf-8?B?aE03RkwwSTdwNk1JMDJ5ZlloVE1wc3l5Ty8xakZyTFk3Q0dKL1dqaEI3TGtJ?=
 =?utf-8?B?a1REY3BGKzQ3Y2wzOGYzcExEWkRjdTVTT1JvekVOenJINXl6dG9PZkIwdC9h?=
 =?utf-8?B?QTJqaVNSVWhDRnhtdXJoSFAzL3pJRjA4KzIvNElyMjFXRmh6c0F1dWNHbWZG?=
 =?utf-8?B?TDJDVm1yUGFyWVgyaXV3Wm01bFlzSUJoVDhEcE1Kam15TTdXcXRLN3I2eVI5?=
 =?utf-8?B?RisyZzZScHkwVzFOSCs3RG9jUFZ4eDBRNVZEYzZUZkxvbWF5Z2R3RUl0TVJt?=
 =?utf-8?B?YzNHY3FnWlY5amNxMmNIOGRkMGhOK3ltNTZzQmxibExQamFpT011WTQ2VU9P?=
 =?utf-8?B?S2oxUXQ3UEREcUV1YytIckxiWmRZZXFUVzd1ZlNTdHZ0d3VseWhMelFKckZN?=
 =?utf-8?B?RERuMmVIUXgwN2dhQklaWHhEZGI5dE9LWVBCYnJWSm5wWWJVSnovZ0NSNW9E?=
 =?utf-8?B?R3NxMENQd0RiMU1DeFg0MS9Eay8wWHdEUytCMUdxMlVjYXh6bDhsamYzczdI?=
 =?utf-8?B?Y1hGMVVvRFBvTzU2ZzF3eHVPcVBCUXZLMzVIeDd3VnFpcTdDZVlTSlhodlZP?=
 =?utf-8?B?M2ZvUk95dVF5ek84bCtVdHBmcmR3Tlo0VVhpZDlBR3VQdU8vYjQxUVB2VU43?=
 =?utf-8?B?V0YxS2l4YnFmcTlERUJjVGhHKzlHa1YrYjlyMGEzcy9zS2dFNTlvRFFtWkpt?=
 =?utf-8?B?YmxYRE4xSENSaWMwOEE2azc1c0cxbnphTURrM0pPRTJ3M1BndkhvRzFXQ0Ja?=
 =?utf-8?B?QlpMZWJLeU9NTGIxamxtT0hFMnBDc01SQU5WUE5NeDMxT3MwTUZGVGdGYVFy?=
 =?utf-8?B?QlQ3Q3N0ckpJN0lIYVhKckNpZXhKYWo1Mkg0M1ZYaW9SZUFiZmQ5SjhSVVRt?=
 =?utf-8?B?ZExlb2E3UEVOaHZleHZQRTJ0aEFOZTYzdTdkeU9sOS83RkRuT1JCaDNxOHhi?=
 =?utf-8?B?SUpnZVp0d0dxaDNDR0kxTnN2VU9teDVET2VqSUFQREhGdWpxV0E4aG45eUNy?=
 =?utf-8?B?OERTck9ZZnlFNEV1cTFhd3pTU0Rja2RtNDJmbzdHN3l4aFl3M3JUMFMyZ2Y4?=
 =?utf-8?B?SFQxK2ZqMWZNenMxSE9RM1hJcUdiY2xSTXZrbzNaQnhjZjVSK3A4eEFGbERl?=
 =?utf-8?B?M1V4c3hkbnZoWVV1TFNhektGM0lYT1Z5Z011dFBZaGxKNXVwbzNxSDluQnhn?=
 =?utf-8?B?YmRGRkx5VGkrTHRCbXVLU1ZEbWNNKzVONEhBMlo5NEdUdmxvYW50U3c5QmNi?=
 =?utf-8?B?ajkvaXFwdmszOUNpNVdMOURkdTVVNzBaTDhiTzRZcmxyMnRnWFA1WnhFN0Ni?=
 =?utf-8?B?OUlQNjRXNXBmZUVLMDRxRVR4d3IxM2Nqd3BWN0RYSTZYcXhVQ0V2OVRGTksw?=
 =?utf-8?B?UnZsaHpQTm9tQnpwSVRKb09XR05kVXZVSlFLN211cFRwNUd4cVFaV0srbDVp?=
 =?utf-8?B?ZTlmSVNUYmY1M3VMZllISGI1d1BoUnExVEJtb1hJR2VsbStic0EybE5uZjBU?=
 =?utf-8?Q?zTd9VcpN2pIJacI/29Uy2yGEG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca913d98-3a4a-40d2-7920-08dd922b78bc
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 14:35:56.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmm3b4F90Yubm6Pdm+iiDVcMT9t0s8qIOWJK1OxHXcLI1R7n7gNoc/ar9qGoczRb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138



On 13/05/2025 16:29, Oleksii Kurochko wrote:
> Now that CONFIG_DOM0LESS_BOOT has been moved to common code and is planned to
> be supported by other architectures (e.g., RISC-V), the dependency for
> CONFIG_STATIC_MEMORY needs to be updated.
> Since CONFIG_STATIC_MEMORY is currently only supported on ARM, its dependency
> should explicitly reflect that.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


