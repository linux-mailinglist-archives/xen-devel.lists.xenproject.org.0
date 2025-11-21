Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E171BC7A075
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 15:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169271.1495049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMRrT-0007pM-15; Fri, 21 Nov 2025 14:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169271.1495049; Fri, 21 Nov 2025 14:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMRrS-0007mc-UI; Fri, 21 Nov 2025 14:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1169271;
 Fri, 21 Nov 2025 14:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3Zd=55=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vMRrR-0007jX-KX
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 14:11:41 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff6ae3c2-c6e3-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 15:11:39 +0100 (CET)
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com (2603:10a6:10:18::24)
 by GVXPR03MB8380.eurprd03.prod.outlook.com (2603:10a6:150:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 14:11:37 +0000
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365]) by DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:11:37 +0000
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
X-Inumbo-ID: ff6ae3c2-c6e3-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VsdDEGCcw8PFfR/ExVGroYrWy4A+CsiGppMqqh0iYnMimhub6wwogQWdbBiY4aToUNg7+/nhOfokELAbsmJJ1wipD/kxTNC/fgrRiSo3qmOPSUYE7T4Z/Wuy4MxkmAQCFSzhlxDXgkmSv8r2CcCbd+pUhwNcHHT2APMFxOospB51rstRmKkG/JkThtcFySRqz21e9HlUB6+mYmAtDO1Ge/S+d4cmyRf9rxtlpPNP+oLVGIyisvWAl9MjRW/0xoar4hsjPHmeYao/W2scAyLIao2E9iwgfdBopwBi/5pT7laKYwdSX2L3suCctEo+421ed948aIpEbigNebY/RDBxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo+uifZwV/WvF/M351HDnKMCvbufoV7D0uNOQ4gfSa4=;
 b=Z7jFQVlWufaLart7ONnRkLEU1HFNb2Rf0BZEhvkkWzObZ1Cu0DLnSrcvzNtdYJOvE4c0IwcLuvQZLcSNQYsfHbzbLlbtPcq28lTOo744roMufLj5y97YBoS1+vn6pfm9i/fS8oNpJluAskRHRc+JwkjcTol59mvKYTnxUzGMCNDVx9AxvOYbyT4YggHgxvV9Orry5u2uCwqoGEHlVVX/aLQXWdmGLrg8q2BhfGJ9FAF1TMPvrElVn+6wWdtTTKc7PKZ7gZ4TIY02mXMZv1eKlQMU+c9JnTqVJmyFIVEF+5weSnnhzDbwXYq8Bw1QWP2W97Nzjw8Ip+PKG/ydazPtuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo+uifZwV/WvF/M351HDnKMCvbufoV7D0uNOQ4gfSa4=;
 b=aWETciMsMwG+NTW3oXjkat5cvhFbf054TVnMaIWWsEDT/Bfvo0X5veDEniB7vxGUEn2sX6mJ7oXvuTWH9NbdfOIsLpC8n1dKs19I8m8bIl9+vF2KS8LSI8sPBrpTg24ev0MEdczgXbPvfO4Ety3GeWSysGx7MXhwGOBLc16ysqSIECFOozoyzBhUvBWObvOhEBYBfmtA+9YCb2k7NtQm0AGAkO7vyv+S6egZPY5Sv+GMg4gD5bIbKQN/aU2WwzdChbqqjYJHKGjnVLOTp/ojg2FHMRRmhbvL0POaHinPnaqN0KSRDBOvbeaR+kD4h9g3uHOP06pCUU5q6EqHmgqpxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <19f7b2b5-13c3-434f-9e43-dd218445d6c2@epam.com>
Date: Fri, 21 Nov 2025 16:11:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/24] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-17-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251121105801.1251262-17-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To DB7PR03MB4603.eurprd03.prod.outlook.com
 (2603:10a6:10:18::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4603:EE_|GVXPR03MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: be9bdec4-5083-49a0-0461-08de2907e26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjlEd2xTY0E3QUk5WHVEdFhIWERLK1MwbExuTTJzREsrNnFRZHNyd3ladURw?=
 =?utf-8?B?N1oranFaTHJaWXo2ZEFsdU45aGthSGhYN2hsVWhSRXVwdGEwZEhFTWJUTWxI?=
 =?utf-8?B?VVhWUWtOTDNuMitBYUo1N01yUmpvdXloUHNBNTFUK0ZJMXoyeDFncThnaHM3?=
 =?utf-8?B?WkxobmlvUU9uaGY5cEFOZ0dmOXRITnowWHlIMVZvb0FKZmtERklwWFpNL3FE?=
 =?utf-8?B?SmNmZ1E2bE9BcmFYcGlrQWZEQklPNjJmZGZjTUpjNUZhdFJUTVV4eXZyd1Jz?=
 =?utf-8?B?UjFaUXlOckRFZW1oR2sySUIwOUxONjZLTGF3ZktVSDZhNUdPclRJMGF1TXNj?=
 =?utf-8?B?NDVHbFVYYUIrYXhrZUZoNVVRckxSRjN6a1kzZG9sUW9tVjg3VjFOSU8zcUIy?=
 =?utf-8?B?WndTa2RyV1RFU05ua1hwejJTdjJvT0NBNGRCalRyZHNQU0JsMGdWY0hLVGs4?=
 =?utf-8?B?aWladEZnbmpMS2t2dXphT1RCR1JDNjV6UTRFdW9MTHJ4dkMrUzhCbGF1UEFU?=
 =?utf-8?B?TWJ5Nk93dnJiQkJ3UkpQVzIzQ20wSWZqejdTcFNmZk4zbEhXZ1JuMXV6RXc0?=
 =?utf-8?B?Z3pYSDZSUWdqWmpuL25nL3d0bFRCcldPOUYwUEdnd0xlS3NFTUhFNDFTREJh?=
 =?utf-8?B?Zi9DdE4vVXRMUlAyN05mWHlsMDM2WUxJRTF0LzVvcGpzaVpNRW1XUHl5K0Nk?=
 =?utf-8?B?YnQ4WlprOWNObVhWUVQyNXpYaEZwVzNQL3o2VWU0YkFjczF0OGxGNnVIZElC?=
 =?utf-8?B?SlU2cTZtdkFQWDhWTGQybDA3dEpEcmJEbGFqbkswR29paTZpZEJ4WnF6SHRS?=
 =?utf-8?B?blcwem54VHVmeHAxanR3VGRvM0tzVjJLVlhXK1l1ZEFteGJRUXJ3TEJ3UHVN?=
 =?utf-8?B?NC9PNzZGa1ZoNEJ2ZE1EU0ZiSnpEbkx4VXZmakZZQVhyUXNpRjhVazF3WldP?=
 =?utf-8?B?aEN3UDkxMEVKb2Y4MTA5RGF3TzNrenhhMUlPbHhKbDZ1T1JySmRVUm96Y2tB?=
 =?utf-8?B?Vlp3MDU2YVVld0drd2x6S0pKQngxb01ZSHJld3NUWWRHblp5TC80QlNiVit3?=
 =?utf-8?B?NFM5ckp0ZUxmdHUvYlh3dUlIeXFHQ2lsbGdYd2l0NFRzUWtRcHlJVFNTSzlQ?=
 =?utf-8?B?MkZlS3h4YXlkVEZ5aTV5bXU0d3ZmKzBkN2l0UWg3eHRHZ3dOazJYd3BGRm9s?=
 =?utf-8?B?c3hsb0hyaGFmWWtwVm42dG45VCtnSXRhT1Qybk5zeHU2K3RuRG8xdVpkd3h6?=
 =?utf-8?B?d3JKWTR5dnhsZktJMVlFMEJKb3Q3REJTMkcrQjRDQXRwUGJ4Q3JoZUE3bGMr?=
 =?utf-8?B?VTIraUNDQ2VaZkZVRzk0MGNyblRyZnY5Nms0djVMeDA5TjJxVDFGTUxGb1A0?=
 =?utf-8?B?c3p2QUpMaXdGY2xyQmpJUWpJcTBLcUp4Qkw4eTY4eElEbFdFUlJid0VnQ3dt?=
 =?utf-8?B?a2prcjlyTTJxYlY5cElYMFlwWjZxc3cyUFk3b0F0cHdWRkhLM1htSnpoUHd3?=
 =?utf-8?B?ajlSMHpDTmdCd2lWNi80eTFHRk9oWDhYNEorZTZZaUpYM0RpOWw0WXlnZUNU?=
 =?utf-8?B?YUlraDN6akZ2MDRvcjRZcnJETGxqUzV3TFp5Qm9XcjRmdUdxTzl4aVIrbStT?=
 =?utf-8?B?MHhFK3I1YkZaekhVUURTdlNOcXdNN2hVTnFwR0hqdjkzSDFvZ0h2VVhPUGRk?=
 =?utf-8?B?WHowKzZVeFVHWDNXSEFaZEd2di9YQUszR3RLME5FbmFCMndDRVdFL0ZNN2Js?=
 =?utf-8?B?Um4vRlFrM3p1NW9SOXFRQzJrMGpTVTVxU1dEWW5JVXhLaStQcTMwUmM2WG1k?=
 =?utf-8?B?NmJvRkU2dHRGdGp1ajJENkJXb0U2dTVuU2tYOEZiVDZNMVFXa2p4SnhFVUU0?=
 =?utf-8?B?L2hvMENQZ0E2NnhISExCMTgrYzVzVThOUDI2d2kydlMyK2lnM3IvamJjZXB6?=
 =?utf-8?Q?uhCYtkDS3+OpM7+C3YSwYV52juYdI4hm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnZ3STlIbWlKVm5jWXczZTVKWUx6OGpoSVZlYXl4aFZBRml4K0hDUzNLeVI3?=
 =?utf-8?B?QWkxK2ticEh5TUtZMlJlYUlCU3BWaGE0WHBtRndBU21RcWM2eHMyUVhRbCtX?=
 =?utf-8?B?VnRLdjVKb1VxWmdRdlplNGYrWHVrVjE4Z2Q3QWRxM1RCL1hvaFd0YzhtQU95?=
 =?utf-8?B?MDNidmxBWUtIUTRIZXYrWGlYUmpBeGNIUEZGeFRsdlhOaHpoZVoraEJVY0tR?=
 =?utf-8?B?RmdXbkJVcGxSaE0wQ2RQMlZTWEVmRGNMMzRTbVc0NlpFL0F0T2lvK1ZVbkhS?=
 =?utf-8?B?Y3NYbEgvRFAwSUhJUlMzSTZ4Sk9TdmhvdUtsZ09jTFY0cldLaW9NUm84RHkv?=
 =?utf-8?B?dHFOMlN5QTEwbDV4TEZRNnhlSzBXSXdHQ1dRZHFuMGh0UWp1YjJIOWNSUC9k?=
 =?utf-8?B?eldNU2xUUFQzdU9BWVA5YTdqS3BjaDUwOWhrRnZmVEE5cE5vRnJTZzVFTkdy?=
 =?utf-8?B?MDRyUnlqUlFLRlFhU2gwSDM0eEpCNmFQaDFtWUYwdmxwU3hvVWRvaURXUjBW?=
 =?utf-8?B?TWM5TUVmYWtlWDNKU2VXYklDaDIrQzZvTWkxc0NMM05LaVUwQ1NWdUFmWldF?=
 =?utf-8?B?US9JNEtRSzZna2MvY3RXRlBOK0pyNTRlQjZiV3VDekw1THRFOXNvMEFUeDZp?=
 =?utf-8?B?MEcrdmtVL0tkU2dyQXZZcFdLZWNZMmpHR1N3dmd0SXZaa0Q3NzlXTll0VDJE?=
 =?utf-8?B?UU5GTTg5V1AwcjFmRXIwS092SVBvRHlTSEF5Y2Evd2s0ODlsaE1sNnJOc0F3?=
 =?utf-8?B?azlMUy9SbkVZaGh1cHZrSWg1d3AyNy9rVjhMMTh0NTI0eURGd252VWpyM01S?=
 =?utf-8?B?VVQ4ZWpBdk9DSTh3blhXRUk2aEFKd2RPeEtCOUZORnhYQ0pHRktKNUllZFRa?=
 =?utf-8?B?QmZuaFN3NnAzS1JXVzlMSXl2T2I5WExndzY1NXhEbkF2UFFRTUtkRVg5WkRV?=
 =?utf-8?B?cUEvWVBTUENPTVJvNzZ5eGhUSkdMOVR3QWhCeDgwMHR0S2Zuc3NCSlphMHJu?=
 =?utf-8?B?OTFxNXhFSFp3SGJ1N3pFMFRyaE04UjBaZmRQL0gyVStkcTZadEVaaVBOcmZ6?=
 =?utf-8?B?WW5wOVR4cWwzRmFIRXJsaFhjRTFuSXBMTHc0QUZ4OUkrTUIydVVlcHc2ZXRE?=
 =?utf-8?B?OXNtd3NleTA5QjBtdjJ4VVJCNXFVeVpWaGpyT2tBVldQbnI2TlVGZmorMlRZ?=
 =?utf-8?B?cXRMMUZmeDBBUmlXaFRLb1BqMWFHSHZUNDhYQjlpRXZYZ3lBOWx5UnBKcDAz?=
 =?utf-8?B?THRnaTJqT0hRNVJQek51eWdQaWNRN0M4ZGl2YUtja3M1OGQ5WFh0SkN6MWJD?=
 =?utf-8?B?QVJuVU52L0d6QVBmTmFGdldqTWtCUmQ1S1BvQ3p0SHFjdVBwbUJVMm56T0c1?=
 =?utf-8?B?dnduRFRZM3pKTGF2NkdGYmFESWNOZ1dXZWlnSWFNZHNSbzJCWWU2Z25CMzB0?=
 =?utf-8?B?OHduWTF1TDgrbFFRbDBoaVV3ZkpnQXVGWHh0MVBVaXlMNFNHclMxNlV0Ynpu?=
 =?utf-8?B?Znh3YnlMeFdoeXZZMUUvMHoxR1JyMFVVbUtJVFplVk16cm11RThjajI1QmpQ?=
 =?utf-8?B?cEJVbXhCQXF4VXlITTVVZUdLNGF6RzQ4TVBCTzdXOENUeUQvTFJVRzRueGNT?=
 =?utf-8?B?ZWtjYWs1enBORUxIdVBTZ2Z0bk01VkFLUFNjYjBjZzJNQkFrZXNLZ3U5UlI2?=
 =?utf-8?B?K05JSFdDNGt6dHlGQXZkSEoyR2dKRjZjWnVwNFE2R2Fzb2NIZ0grQ0w2VXlw?=
 =?utf-8?B?RjlNbFc1Ylpnb2Z3NEZkbFltVFZGck1hdHRYb1RMRVM5SXBnVjNKQmJVMTZq?=
 =?utf-8?B?bTNPTTJRZDRTUEdLdWMyMDNIN3Y2RTZ5YmkzaXRqUStSZElhTzJvcEJORDVl?=
 =?utf-8?B?Z0RHd0JRaGZabTlMaWRxM0h6ZUVQb2oyVTdCbjdtV08wa2d3R1pwLzEvTnpY?=
 =?utf-8?B?OHdoeG9OOTNhSndUckk3NjJlejdTakhRWGpJbEtBaWRFemd1K3dIQWZwSitl?=
 =?utf-8?B?cXk0KzdwU1dwUThQNkJ3ZkUyblM2T3JaZ0VJbFhrVG5ucEJ5M0lXcmU4TnQ3?=
 =?utf-8?B?YWM1ZnQ5YVhVR3ZhVDhSK3U2SUFIdE5tekU5Rm9DblhtS1d6NmNuTXZHUk9v?=
 =?utf-8?B?YldMK2ZsN1J5NzdMWEZpUlE1YjA0dnY3MWdWK2RtdWgzd1R6NDhwVjJRMktG?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9bdec4-5083-49a0-0461-08de2907e26c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:11:37.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjWPshXLgEeXI1Yc63x2zaTnjJVUO0IGJRGdeE5tStqzDExDMtmY2OF89gFyZoyC4CwoiH9fdKEFdUzeTblREXbVTDIyYywP7J8cqVp8+Sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8380



On 21.11.25 12:57, Penny Zheng wrote:
> Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Otherwise it will become unreachable when MGMT_HYPERCALLS=n, and hence
> violating Misra rule 2.1
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v3 -> v4:
> - new commit
> ---
> Commit "xen/domctl: wrap pci-subset iommu-related domctl op with
> CONFIG_MGMT_HYPERCALLS" and "xen/domctl: wrap device-tree-subset iommu-related
> domctl op with CONFIG_MGMT_HYPERCALLS" are the prereq commit.
> ---
>   xen/drivers/passthrough/iommu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index c9425d6971..8812e38174 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -625,6 +625,7 @@ void iommu_resume(void)
>           iommu_vcall(iommu_get_ops(), resume);
>   }
>   
> +#ifdef CONFIG_MGMT_HYPERCALLS
>   int iommu_do_domctl(
>       struct xen_domctl *domctl, struct domain *d,
>       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> @@ -645,6 +646,7 @@ int iommu_do_domctl(
>   
>       return ret;
>   }
> +#endif /* CONFIG_MGMT_HYPERCALLS */1

"/1" type - build fail

>   
>   void iommu_crash_shutdown(void)
>   {

-- 
Best regards,
-grygorii


