Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDx4DyvKgGnQBgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:00:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98515CE91B
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218746.1527599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwLd-000528-Rd; Mon, 02 Feb 2026 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218746.1527599; Mon, 02 Feb 2026 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwLd-0004zE-Od; Mon, 02 Feb 2026 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1218746;
 Mon, 02 Feb 2026 16:00:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6EL=AG=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vmwLb-0004z0-Pd
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:00:19 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43ef652e-0050-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 17:00:17 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7057.namprd03.prod.outlook.com (2603:10b6:806:35a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 16:00:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:00:09 +0000
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
X-Inumbo-ID: 43ef652e-0050-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpMY29qlob8gGUeeUGoVcDV25EbCsHXeucC4SXPXfWgpgOinqdIFIraWa/5D8R7qwaN3U/iuCfmFGnbWIo2oZqw4OFkiagak5X9TmWuki10+crTM8BHuTRpFQjC8S+SO9Riw/3iCfNxaxGrkiJN8UeHLRgG3TDS4TlNgBAMn8ckFSPqhn8B/5d+02HUL3zWZ62OiyWRb+xJ9cawGODgSOvld01NLu+qnOoivVZQIb5lIFPlrnVgmRi2XWsuVAbVp3cIn4i1vgm/myNviddSmzUSnMyMT4Nw81XhvJMWSYwEpEQaHalpnKg2IUCMu/yU6RfypMLWUqWGwZdqEkTTSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoQZyhnwV7D+SCqtmU76R4MA/AgoW1y5UP6xiiVvY3Q=;
 b=D/MS1acdFLgDRHecDF1OmFtYfHOvMAK2Vjtwb6LbkTNiknGpR19E/iKxtozxiM8f6rsVXyyvEHJIKMNVJJHxy0m+jmocJZTe9SA0DGcBpAgin7uEuuiONEfmaxj7E7zQY10F/vZUiNILeeIpWV0RZzZcITjlCZPWu38oLaStlpqcaZUZOQTpR9s1/adVM6kQe5O5Snrjz12BxHFeRD0rJWj4O4JGAR2i4tFzdE2ZONFu5SZfajtv02Od1dRUoKqMTu00gjqnAaIjHXQ8aB0a/ZBipynVVgOhIR/WWgT5o9rg/Aup35wIapxkIJM7Peyamm0gSmMCGqy4EPAYfYOMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoQZyhnwV7D+SCqtmU76R4MA/AgoW1y5UP6xiiVvY3Q=;
 b=B6SBngS1WkUA3ou96EUwrUZqNRMvXwc0gMB1Nr0e7AGhCvVLPYbgBO3SNDwzQD4z66+OcCe2GGR+y1d+vzIDourqchcIYLjpD8dEwwCBWiv2CRPbOdRsG1ICorSV+W2Txt0QrR223jsN/XUTbMDLu6UG396olFNQesdcY9+nUzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d8eb4220-da82-43b3-b0e0-9d006f68877c@citrix.com>
Date: Mon, 2 Feb 2026 15:47:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/cpu-policy: move CPU policy library code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
 <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <7c06bd5e-fad2-42cb-947f-6749f647b068@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 22403a62-7709-4367-b605-08de62742447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWI5VHlyMEZZckZRTTg3SnV0dDROZUc4Zndta3k3MWJSelgwazVERDc5ZUFC?=
 =?utf-8?B?eGZRUkJhYWh0L2dBZTRBRktjZmdZeTZBU0lqR1ZJanZhK2xhOVZhWjFTMU9O?=
 =?utf-8?B?R3Rzam01QnFuUzE3UkVNZlowb2Z3S0JBK3VyRXhicUkvVHg2QjlkMFBYczA1?=
 =?utf-8?B?YjJaY0dSWE4wWXk4SmdOV3o3dUxLTGFtV3gzZm9YYVh2aWEweS8ybnk3dVlH?=
 =?utf-8?B?STJaQXgzcFRjY3JaZzEwdEl0VVlwZHdhRFViQmw1VE8xdW1iVzcxaWJlSFl2?=
 =?utf-8?B?Y0hUS1QrVkFpVmlxT1NkaWhxTG5rcjBWR0VCb2QrQzhlWkRkcmlxWmpvdFUx?=
 =?utf-8?B?WTJ5RHBQNnU2WXo3TUFja2xaOVlQYmxkZ2hiNzFSalBrSlY5RXMva1NlaEpE?=
 =?utf-8?B?clB3cjVGdmJURVRVQTJ1NCtXMm1May92eWZkVFZqSEc2RHd3MEtZS3crWktq?=
 =?utf-8?B?RU9yckpaUTIvaHNOM1N0U2h5Nmt5THR4czZaVFc1UFBYS2lvSVo0S25pMkZW?=
 =?utf-8?B?d0pFYkRBUGo5RGNCSldScUZxdGVQQmFBZkpvSWYzZVR1ZXNKSnNnUTUzWFc1?=
 =?utf-8?B?eW5ZckhJLzN4ekhPMjRGdnJ4d08zK1pRbDMrZE5XNTlWcVhNemYvcEpMck1p?=
 =?utf-8?B?S3lOdnJ1eWhzVVVDVk5UVTJWYjBVaDdZN1hlRHg0UTBIb3pGdk1oS204SGla?=
 =?utf-8?B?ckRFb2VUbUZ1TXAzb1h3ZUszVlhMRGxUaXRiUUR5THE5dnBaQUV0ME4wM29P?=
 =?utf-8?B?MUtwaTlzM2FsRWFiQ2k4dUdzWFJLNVVkTDkvKzVrRTV0QTZvM1ZKR2ZEZlJp?=
 =?utf-8?B?QjhNMFFMN0R5cWRVZW0yRTF4WkF1dGtzcVMwTlpRUk9kNUxvTkNmTXo2ODd2?=
 =?utf-8?B?MitUZVNZNnhiTXI0NEgzenppS1A1N0l6TVBlN2M5TFF2WWpqTnZjTUpSdUht?=
 =?utf-8?B?YlV1aGpJWnJHcWJqOVlBOWRSa2NnUTkwaUxFdlVEMXZIMnR3cVpZNC9oZ1BV?=
 =?utf-8?B?TVVSQW5sWFB3L1RKd1Vpb2pHeHhlWGdLa2QvVFovUDAxOW1wUDZiUVg4WWIz?=
 =?utf-8?B?R3hSREdiVUxhUGNUUi9zenVYQXprZFo0SHl4YWcyN2pMVVhaMTB5VkJwQTIw?=
 =?utf-8?B?aVFHbGlseVlmSnFLOElUdFZqOXJZK2UyQmdHU3NjVFNBMGsrZEJBcGF2Zitk?=
 =?utf-8?B?eWVKZDBRa2dkQzRKNWdNeEdBQkNOMFd4M3orejVKQnZmUXBmNUZlNWpHeWlT?=
 =?utf-8?B?RHJvYlpyZTZERnJ5dHU0WXYyU24wd2RyWFJYMUV5d3BsalRvMkYzUFhUWU1V?=
 =?utf-8?B?OUlENGtJeTFiZ1FnVThxWHNlK1htZEFRbjIvSDNKdy9FNHIzbHB2ZXUrSkpi?=
 =?utf-8?B?SzBaTHRXMThidmVMRjZreE5sNXg5dE9sdGM1T3JJNVNtTkd2VlE3Z014T09Q?=
 =?utf-8?B?bzZjNVhUUyt2U1NHMi9yZnpBbVBmVjhpL2QvY2NWelhkN0N4RVhCbmZ3UWYz?=
 =?utf-8?B?VXAvSVhYZXo0ZEFQaXdwZ0V1VFFDOXZialBCZUhvOTJwOGpuMXRZVTVJWW4v?=
 =?utf-8?B?NDFCUXBtS2lzbDhvMS9xM0kydkd3SVM0UXdPLzN0aGhLbWRRQTZXaHhsSTVr?=
 =?utf-8?B?bkNrN3hEVW1BaDNCUGpZelVDNjllUUtIQ0lSMjBBZ0VmRmxkaElqU2Q5RTFr?=
 =?utf-8?B?ZEFMZHNIbkVNNjdPem95bWpkS21yVkt0M2ltaWZJS3NERmt2WEFpNXUwK08y?=
 =?utf-8?B?NHB5aWgvZ3ViL0tZZEV1NDg2RU1EbjdwUnAwR2l0TUV5TFhmWnQvOGtvdEwv?=
 =?utf-8?B?NVBMMGh6N3JGWU8rb29WRmlUais5aXlyWmVXdk9yTlJ1cTVRalo1UllZWU9P?=
 =?utf-8?B?bllOeXVadjMybThBbUZCZVNXem1MQWJrVWtwNjMxMHdySlc3ajE1VGNjNDRY?=
 =?utf-8?B?aVZQQitxSmxtRFJka2E4aUNrSmIwN2ZlY0E0VVpzWEV5dkJ0ZjNZWUtnY2hN?=
 =?utf-8?B?SElOUUdRbC95dTYwRktGeHBWNXdyenM5R2F6ZjFnM1BNQnViRm4zb2haMXd0?=
 =?utf-8?B?d2d5QzBscTFneWZUVG5RaGlkT2xEU2UrQmd4TDBPMVZXSis2ekc1cTRMYitX?=
 =?utf-8?Q?NtTw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1GbkVyTGFZYTdxekx5U2U1T3hKNlFGT3BKZHowbUJVY2pHanpXQVc2aTk1?=
 =?utf-8?B?dWF3Z1BVaDJIY0ZwT20yUFJPVm94VXF2YXhkZGtiUFRuSDN5MXN5dUY0OGVs?=
 =?utf-8?B?eWVoUTBlam82YUwrOC9kOHJtY3RTTDg4WnR6b1BIcG9IZWVPb2FmOGljMzkx?=
 =?utf-8?B?TjlMeVZpdTA5S0FZUHJQcE5yMFVuelZ3S1JVVHlKS0l1M2xmckp2aXB2NzhB?=
 =?utf-8?B?bk9xR2pOcWYzUnhYbWZudVRpZGQ4TW9FWTRFdjk2YWRsUnlWVHkwTUZCSFd5?=
 =?utf-8?B?UGlXRGFudGF5NXJnV0dIKzlhLytreXVkU1gxTlF6enl6bDdFRzBndk1TamxQ?=
 =?utf-8?B?THFackREU3I2U3g2dkdiZkxYMWVoT2p1akVDYUtrcDhVSDFwVEw2VHlkVXM5?=
 =?utf-8?B?STZTa2EzaDVTcmFBRGlCTksxdXRqYkIzSHpRcXRJYXFxZDFrUllTZTlDV0Y3?=
 =?utf-8?B?a0Yxb2x5MUFhczdQMnd4TThuOXdMRjBUNHF6bFMrUkczQ2xXaUl0MFFsbFBr?=
 =?utf-8?B?dmh5VmRDdWUveFBEeC9SZXphSnRDcUtxaGZsN281S2NtQVNLeUtyVHhMVndQ?=
 =?utf-8?B?MDN5VjIyWDJkWWVRTHB0cVdsNGRtNGJXOTdwSnZlZFZnRStoOFhGc3pLYnpL?=
 =?utf-8?B?dU5EdjVVT0JjQnVUcjVhTGhCVGZSYUlUeENIdUFxdWVXSEE2M0M4RmRpck1i?=
 =?utf-8?B?VTNUbWM5eXNGRWdzOGwzamEvUldsZXFlV25tTW5sMG13Vy9aRkQrejBGZjVR?=
 =?utf-8?B?b2JYOVdRK1lwbFNqNDdOeTVPb253MnorMWl4SFUrNURMMEFXWHN3UUxoUXJj?=
 =?utf-8?B?ckVUUXRwdmtWOVlkZ0VLNzdhQlNiRFF5Qm5JcDY3NEpFNDFGTzN1elZzbE0y?=
 =?utf-8?B?dG0rSVNTN3did2w0QktzOFhLSWhNY2JYeS83c3ZFUlJtZnkvSHZGUWg1NXJN?=
 =?utf-8?B?WFZkM3pjZE1yQ2ovWmZoWUM2ZDdSMElFYlBxbnc3aENpREJOTFd5bm5hRFly?=
 =?utf-8?B?OXpENms1SlN5TGp6bDEyeS85OW5Jalk2YmZnTVdEdEJCQ2d2Uk9tTjRZSERs?=
 =?utf-8?B?djhJUDIzUHlvTVhiTHNJOWxVcHMwYnJuWVdrWGpHTFBndjVpNlVhT1pVcytN?=
 =?utf-8?B?R0xzMmhFUUpXTTQ0ZFFQSHROOWdYUHpzL0Z3bi9OOXNYNEVJT1hlZEdaK2JF?=
 =?utf-8?B?bE5Cb29KbVJxYTU0R3RUb1lqTTh1MkR2UVpQNGY3MFg1VmJHRmlZL09PK1lq?=
 =?utf-8?B?ajc4L2NvWGdWS2ZjQTg4WXZNbmY1NkViRFMxQUQwYUxHT3Z6cmlTNnFnOHJr?=
 =?utf-8?B?b2ZlenZqeGRiZ0NnaEF0eHlhTHhiWGxSYnR4eFNUTkNtdVExNkYzREFRSysr?=
 =?utf-8?B?dUN0bVJtdUpZblNLUnV5V3hFbzZ4UlhjV0N1NlZQTnpSR3JpUUUwcytGNWZj?=
 =?utf-8?B?S0QyL1hIZVZmY3UwNkc1WURHdzd1cnhhNU1aaXg4c1FpT0JadTBLZDBEdFBo?=
 =?utf-8?B?dEFwNmxSeHUyVG9wdUQ0SmozS2MrcjI2OW9tRWd3NnhsOGMwSUlhSFRrcjJn?=
 =?utf-8?B?UVB4dDkyRGMxa0Vpb2ZYdU9QbENPVGY2eGx4c0E4UXd1ZXpvUUJ3SW0xQkNF?=
 =?utf-8?B?RGtYandHZytmM1JHaTluZWtDUGkwZ3U1bWRPeFBFdCtHV3B1ZFdVY1JsM0Nw?=
 =?utf-8?B?ZERXNytJU1NYYWtWOEFFU2x2Zmw2MXpuaUl1VGhqeFlCcE1QWGpqT01Ydndw?=
 =?utf-8?B?OUptcS9WMEJIQTk3dmhkdHkwSEsrL0YzNEl4dzVHNWR5UkRPSUh0S0h5eGpP?=
 =?utf-8?B?cEhHYytJSi90czU0aytJQ0QyNSt5cWYvSFpMM1FaZFBQczhnWUVkMWdvb01o?=
 =?utf-8?B?RDhyUG16MTRZVjduTGlQcmg5SWt3MTNxMy9VSGg0U0pDbXRRU250NHBKaHR2?=
 =?utf-8?B?dUNvYlc2TXpMVVZaTnMvVFdrd0RJOUYvR3FReXQySld5OUw2eVFSY2szZFhJ?=
 =?utf-8?B?REdzTlAxYm4xUVREMzdzZFJJSUQ5bnZUMkF5Ym5Rb2ViWVJGaVl3NmxYcmlx?=
 =?utf-8?B?dTRQUDEyaGp6QW5DYlRZNGQxZ05aTXAxQXpxMlhSbjJqOUFYTlo0NHBoN2Rl?=
 =?utf-8?B?L0dyeElJeEtiUXlJOU1yN0NUZmpQTnQvenh4VWZ1UjlOLzREWE5XcXdkU2VB?=
 =?utf-8?B?M2tLa0VaREtpSjhMaXFndzJxWGRWandCOWxHTjJ2REw5aTZMMDdJTk02ek9N?=
 =?utf-8?B?ZjZ4V0JHc3hjSDdsMnVHbEpHOWtzM1FqaGE3aEhKVEMxdUZBbWZPZjN0bnlZ?=
 =?utf-8?B?N2x2SFZBUzI5bzVMYzFDMHo2VTBCVnREbWw0UVFMeVJJaGRoMitoMlVwWnly?=
 =?utf-8?Q?r7qPVDA+VzDRdYtA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22403a62-7709-4367-b605-08de62742447
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 16:00:09.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rddtwnCvmJGpqjL4y2SMuSb95R79gHrDeWmiU/sesVYYuiybmerb2J7LEaHxTMXmqf/nUNhhXsGy6Hv8g2AwIyuXKrHLsHAPCvOCVMxeEFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 98515CE91B
X-Rspamd-Action: no action

On 07/01/2026 2:17 pm, Jan Beulich wrote:
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 0203138a819a..be6c76d2934b 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -4,6 +4,7 @@
>  export XEN_IMG_OFFSET := 0x200000
>  
>  ARCH_LIBS-y += arch/x86/lib/lib.a
> +ALL_LIBS-y += arch/x86/lib/cpu-policy/lib.a

This wants to extend ARCH_LIBS-y surely?  Is this a rebasing oversight?

~Andrew

