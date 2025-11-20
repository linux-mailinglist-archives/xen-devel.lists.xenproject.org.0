Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6EC73F54
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167209.1493554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3jn-0003QT-Bz; Thu, 20 Nov 2025 12:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167209.1493554; Thu, 20 Nov 2025 12:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3jn-0003O3-93; Thu, 20 Nov 2025 12:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1167209;
 Thu, 20 Nov 2025 12:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3jl-0003Nr-SR
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:26:09 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1735a337-c60c-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:26:09 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5553.namprd03.prod.outlook.com (2603:10b6:208:285::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:26:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:25:59 +0000
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
X-Inumbo-ID: 1735a337-c60c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyrXJWMwjFFn4sWRimWuIZbQZ+37nF1Z4Ggwbm4mkiC9UmHxLxo17epudnoxeCs46Dg+iDfsSjmpwX/0h8+5yDcS7kR04mcF+R5VrnJjUbSa55o5s5eGHuRi6+hH9IhV90kO3fuf2K2jEayvL2zIz0FTqMG9lPgu47jpHdmIwZrNHb7rKg6Ifzo4ABXp4b4umtp/WUinyAhBRQvpYpRdoI4M6XlQ+p6RNai+PQK1ZkLcrnI/lN3bS/RY9zq4/61nVFoRAgfEpOJgw4FwBJJ4MV9FwSTLuqoNpYCEp5ZaulE/SPP1bYJ20v7hONg4srorzM4iRnekeIpq9//1TxxUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/rRoJDtqXaWbSL/VMSXbtHd7oOQffvpyJobCfiu7xQ=;
 b=BeftVSDvMWZqPAz5KzEw43ByKI8xN6ZKLrq/j3ztnYbPAvbCPAnHOV78GHyogJWCItjOr4A5bZVgE9R+XikfH4jWapsQHbRSWE+MkVlyGP7oAFhaxJVVX6qnnyC8MYdUn7NpP4plbe0X7lfE7agkizRllAi57LdHgzG/jUY3a0w3ezslYT5D4pRQm7nGR3wKkOSB73vLHj2AgkUjjT17LIQW5SNSzWjTm0L8+Z/BJ1HpvhKgEFffPMJa8f4EXesRPXCI+YhCUvzLeLGDyHrr4LvA5NCEbRkqERE/JkzQZLsdnuhgPDN6EWMAHXQ7OpS4pJvGSvfPlD02cQBSdZlQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/rRoJDtqXaWbSL/VMSXbtHd7oOQffvpyJobCfiu7xQ=;
 b=ndJrCtLJdFfbIkLxtEgyjJwz0P4bMh4uDiNXVp3iRrMcb6EmeLCRAoem4OXqAswTkMtJDu82dkuN/occNO8WAWGVYzYtt2rgERfkqeHeI4uW/AG89yEeG+583L1URlzseE+bF2j7AN+lNGBVI2hqWgNjrVSi/fag2R/jaRnXPBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c0930b51-5e57-49a5-95e9-649b581a38e1@citrix.com>
Date: Thu, 20 Nov 2025 12:25:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] x86/apic: remove cpu_mask_to_apicid hook
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120090637.25087-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251120090637.25087-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0043.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::31)
 To CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: ac06cf6d-d1b0-4d76-4102-08de282ff64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDBFMFFRT2xlTGgxVGY5OE4xeTFReDZLVzdRbUFMQngrZ01JVExtZGpKWTBn?=
 =?utf-8?B?ayttQzZTT3R5Mlk3NEcxUjZTQ2I2SlpNOXlDWnJIZWRVbUJNSTAyZ3NGVnB1?=
 =?utf-8?B?bk5LMFdBL05zYXZKYnk3ajlCQVR2dFRqeXI4cStpcjNRTTQ4VTZzeE9LYmRT?=
 =?utf-8?B?NHJRZGozQWpZRmMyOTB2dlkrb09Ga1ZLWXBtYkJydUdVQWhHZnBvdUVpcHNY?=
 =?utf-8?B?MEtRZ0syU2Y0cjRDaElvTUhCZUFBQU9JR2Q0b1VtMGJMcE10TDFpaHpEcVk4?=
 =?utf-8?B?ZnNhRG5VWGVKb3kyT0pQNmpxdE02RTNqUCtlWUFGeDdXWG55L1JCdHBEb3ZI?=
 =?utf-8?B?NDZHcDc4aTV2K0V2YytxR21hOUdLOHhSMnlnRTAzU21vZWlqVzF3Tjc3VVRJ?=
 =?utf-8?B?RHBGRERiS3B5R0J6eHNPSFRwUjhYMjYrZ1VlQlJHNTd2Y2lLTzdmMkc0ekxl?=
 =?utf-8?B?QnJ1S2ZFOFpvR1lFdWRyNkVoQUZ4NVhSWUhIb1pldk9kUW5YRGdZTWxqVG42?=
 =?utf-8?B?dFI2YmtnTVZqbVBsaGZ4S1NqQ2w5eklzeUh1UkRoaHNFRTFoNHM3Rnl6WVBR?=
 =?utf-8?B?eVNkejdlNFljd05MUFNUNWV0NFd6amE0Tkl4SHFXaHBQTWdNNUVDTk10ci9N?=
 =?utf-8?B?Nkd6M0xqWTcxa3hBeVNsNk9iRmR5dmNiUGJ5cEpJS1dybTNnUjNMaEFOL3Jz?=
 =?utf-8?B?QXhPcngrZWVlaVl6elJsaVIwbEpQcDVRVCtmdG9TV0RDcTEvQnZaNmt2V0hR?=
 =?utf-8?B?aFE2ODROUnA2eG00aW0vZmt1L3krTlRrNTFFNGExUWRNb3JJZUlIMHFIZ2lZ?=
 =?utf-8?B?ZXc3MDJJUzdiZjZpMVkxcnpoaVBQd2c2TGlJRzVoTW1va0Q2akZOZzdwelY4?=
 =?utf-8?B?eEszcVNpMUVXdU9XT3FCVmFmZTg3MFoxMVZoVUJ3YU83NHY0WXRoZHBmL3dY?=
 =?utf-8?B?MVVPYW5pWGdGc0REZHdtSG9BcGdXT2R2UWovejBVbnhNL05sQjVPQkhTNkhk?=
 =?utf-8?B?VE5wUzdBcXFJZ0xVc1BTMDZZckxYekE2QzFtb0pvMUc1RnJqQjVIMG44dkFl?=
 =?utf-8?B?TitGZVFKanJBZXdXekFPUW5OdDJOd3FhZFJ2ZTZJbzMxK0hHTnFDcjAzN1ZZ?=
 =?utf-8?B?MDQvdFR2R3BwUDJUdENvWlBSUVNwYlhUelI2eVovYlpSVmVwY1o3dklTbnZ4?=
 =?utf-8?B?WXNWUE1QaFgrNm01L2pUS3F6elpIMXlmM1lrS1lFeGkrMlhid1puN08rRG5F?=
 =?utf-8?B?UThuOWdMdVowWjYxTlAwUzJnY01TMG1CUGV1VTkwbXNUTFpObzJtcDA4MDdV?=
 =?utf-8?B?eEdDaGhoMHFHK2FxTlpNbm84aWJxZ2VrZnBHaEFrTnRQM0NqV1ZraWxSeFA2?=
 =?utf-8?B?TmRKMzREL1kwSFdYV1JKVTh1cWRyR3hmYTRXZ0JudHhJMk9oQ2FtKzZ2Nkg1?=
 =?utf-8?B?SlNna3MwU1pZTVZTVmNwL3I0T1AxbERSVG9NN0tuSjNUdlVDbDU2V0hmaTRj?=
 =?utf-8?B?cGNJMHYvNW84K1hDWVp4NXJ0M3FuN3ZCNE9PbzExZ1NXVC9qWGVUb015TUx3?=
 =?utf-8?B?Y1lORjZ5RDlRbitDV2t6V1FPc0dXSnI4TWs2WWI5U25FMWxDcmdxdEFHN3pT?=
 =?utf-8?B?V3JGblJtY3N1RUYvYVlHeXpzVlFFcGw1Y2ZzU2hqVjRMMlJnNFFuRWhlaEFV?=
 =?utf-8?B?b3phTy9keEFyb3FpWitTVXRRR0F3emt2aXRlM3V5UUZKZTdHbWRZQWltVnlY?=
 =?utf-8?B?TU5IWk5yd0l2c1Avb1BOYlBSYnFaSnp3TEVRZEo3Q0p6a0U1QlpUb1VVSXg5?=
 =?utf-8?B?dHpoM21SZi8yMWFlRHBjeldyODFrSVFqdEErNmZIMDdGSlpVb2tUaG5tcExN?=
 =?utf-8?B?a2UrTkNuNnRDRVdJQXo2QUZ3YU9nU2d0TDhHaDhGbUFNVlcxdW4vcWxlakFj?=
 =?utf-8?Q?EzIKDUY8xJgaHCuHEJcExPD9ap9TAQSc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEdPZUJVeDlUdjRUMk1FaHJqYUIvRVM0QSt4MTRnaW5nR0VTRXFjLzFNazZM?=
 =?utf-8?B?ak9GN1lWcjJGbFZzMFdmWjVSN3FvNzJkYUNkMW93MnhqbUg4VlhDN1V1RkxK?=
 =?utf-8?B?aFl2ZmhJRkp4bWJxU1NnTmVKL29Vd0NXdnNobi9ic3lzK245clBvM2JOZXAv?=
 =?utf-8?B?c3EydCtjNzRVQzh4WnFqRFV6a0w1RXNaNUNodU82SFFUbm1XRXpmMnVCSHEy?=
 =?utf-8?B?VlpSZ0w5YU1CVm1OSGo1bi9iVlQ0dFFLZmtub2xxZHRESmlyTlIxMTI5aEZQ?=
 =?utf-8?B?UHcwczZCQ3k1RWU5cnlzWnBWWnZTVVdXRHlTdlgvZlV0aG1JY3FtTjZzVGJh?=
 =?utf-8?B?bzZPRUxFYjN0eFRBMEpsYk9DYmJFSWJpSUxIcHdRbVlacVRCUWgvQ0pGSHFC?=
 =?utf-8?B?YlVXMzRJd0FyOTFFZkNNNFFLSlZIdDNuajV2NGduVGtrM3JyUXNtK2VHdHQ0?=
 =?utf-8?B?R1lmMHorVzZVV1FxZVhtUldmSEszWEJweWtoSHZxb0RWS3BKUWxwOVQ4Wlcy?=
 =?utf-8?B?UzA5ZmFrMHEvald5SUpDRlVnR0NFVmNTZHNDVk5FU1lNWWZnR0FTWWdjOHcy?=
 =?utf-8?B?V0VwMHNJVXdpOWp6dGlZR1JJT2phd0lJL29CdHVUaDhPcnpZbFpPb01IcHdO?=
 =?utf-8?B?MWVpRDFHZkIvSlN2OW5UTDZUUkEvd1Izelh5ekM2MDFSRFdVWDJ5WTJRWDN4?=
 =?utf-8?B?SmpDMDllZ2xGQlJ2aXJDcXFKamkxUFJuOTV0aGgwYy9oWE9ScU1uUjROMzRZ?=
 =?utf-8?B?Q3B3TlpoVjlZRW93TG1pQ1N4ZEpLdVR3YllFbHdmM3dSaVdoZnF1eHJhem1S?=
 =?utf-8?B?OG1JeGFseE9lb3FVWVNCcDFsUkNUaVN5OXhFNjVWbElWVi81M1dFMWZncFlF?=
 =?utf-8?B?T1ZQVjRxV1lOeTdpVE5VeFkrTlF0d1VtVnJLbmVZREdiVXBwVldyNmhUZWtp?=
 =?utf-8?B?WmovTWhNd1pjdFBkR3J1VGdLTzEySUlrZE1Vc0JGVWwrRnNrcGJHL1NTaGlD?=
 =?utf-8?B?QXpZNlJUa2xOUzRERU4xSzZWU2kreTAyemU5Y0JCK1d4ME5BZDROTkpub29w?=
 =?utf-8?B?T0N4cTNzMHIrbTRlSEpLa0NxMjQrSlhqQmVvQUl2TEtPSm1zTGdKNUd1dTR4?=
 =?utf-8?B?cFBLb1l6ZWpKZnBSNVRheUpsZWNHbXY4MEx2Yy90SEVBWjU2UmFsdlM5YVNl?=
 =?utf-8?B?TjZZWWZ0N1c1TWJ1YmhXVGpSazJkRUwrOWQwUkxqMDFmaFNHZW1sMTVxUUhH?=
 =?utf-8?B?bU9Qc1A2MXNIeW9wbXhOSFNqNkRuL1VBR1BtYUJYem5XUkt4c2VZWUtJaUho?=
 =?utf-8?B?a3ZyUnVWZzZNeUg5VVgwaVRTazFSMmFxc1N2cUUrSVRXMFkzUkZjQ0R2d3Q1?=
 =?utf-8?B?Sk9TMEJGOE1wU1FFcGJSalc0eHU2TEhBL0lMVzdoTXBSb290K1RIM1VHTlNG?=
 =?utf-8?B?WWdzZDR0TUExZVlDaDFSQ1dZb3Z5Z2gxejFQL1VNdVFWVkRiNEFPaVVsY21H?=
 =?utf-8?B?M1dJczBBK3g5ZFFGUCt5RFRhanEwcDN5dmVqcFFZa21sV3ZkdDV1MGdVYXhp?=
 =?utf-8?B?ZW0rNXlkeTNnSW53bnRocWY5VnM0VlVlemNwQmtHYUczVFBMUmJuS3Z4ZDVF?=
 =?utf-8?B?TUwwQTUyTVJDb1R5MExydTFYZW5MVzdkMkhQRERuN3R2UC9MeXVPNW9JNDdK?=
 =?utf-8?B?eUt2b2hjR3kvbncwa1JSZ1FUU20xdkFUUndpOXIvTU54eVY4SXZoTnh4bVBu?=
 =?utf-8?B?eE5IWGpuUmpXTEVnTitUS21zVGhRd2NCcG1aMmRRYWFMUDkvQXlUaW40ZEY5?=
 =?utf-8?B?K05WVUNlNEl1S1ZIUGNXcUhhVlIxZ3FMS2FYbTRZck9OODJFemlBUnI0Y2hJ?=
 =?utf-8?B?S2ppS0lXOW1PcVhCQ2wvcjJPNnQycVVzcW8rSG1HbEJ0blpvanRTMTBwWmtY?=
 =?utf-8?B?eVhzVVpwanIwSmhTK2xOVjNRaHlKM2cwODNCK2dLbm5vb2YwUkNVN2VnTmd1?=
 =?utf-8?B?YlZTQ2xMZGtMQ0FTU0JjZWNpeFRxbUt5VjBtalQyUEhSaGcvTi9RNThGc3l0?=
 =?utf-8?B?bkhDSVRMOGtNbDVzQUVZTWNVcVpsOVRyWDVXOXR3SE8vVEdCRWs0L3lJTnNk?=
 =?utf-8?B?RmxZdXVTYjA1bTBZZ2FFMmVTOXhlMDZ5RGtDMmswdjJ6aUx6WHJ5RmxzNEsz?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac06cf6d-d1b0-4d76-4102-08de282ff64a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:25:59.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnAmhe/bxlkVgaTNHstav7LUNrzkZX8chaLZP9DFo3dSY5vI3j53K0sCx/XXM4G39dUi2VQ5rdXB4UUr1GUzRHFi45NBGw2k+Gs3DxGFZpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5553

On 20/11/2025 9:06 am, Roger Pau Monne wrote:
> All implementations use the same hook.  No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

