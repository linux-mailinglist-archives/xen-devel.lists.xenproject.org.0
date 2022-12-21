Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8416531DE
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467912.726986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFL-0007HK-A2; Wed, 21 Dec 2022 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467912.726986; Wed, 21 Dec 2022 13:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zFL-0007Dd-5x; Wed, 21 Dec 2022 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 467912;
 Wed, 21 Dec 2022 13:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z8h-0003Di-6S
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:28:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2053.outbound.protection.outlook.com [40.107.13.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d2938a5-8133-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:28:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:28:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:28:05 +0000
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
X-Inumbo-ID: 4d2938a5-8133-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuHha0+8JPGsDy/jCXR0tZgx98mbuyRysym/7Wz4HNcJNTL6ZCrpkBSJaZ22M3/7Wv4q17SdRO6Z6FLKoB5AeONABxgel3aau8r6VmDXNS9Ce/ZhlhZ6UeaqV2+GdEGCEopGHpo4d72m1dIBtCaqi3AdI5xpGewfMd7APYjCDs5W3hjsnNKndgyXwSUsRInpP5zPtjBqWJiMHlHzhGnL0Ehrcgub5QppLh5yonQbVOO04rvPzshVVWEov5X/A6PV2sDCujwr6uQvI8CFw+py4fSu1mTLMX3BAUDyrHfxmRaqNXNT/+vvPbrRwU9OGGuzDMZmrTJfmo9nP/1Ws60Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lk1AWG9IAHms14v2W1Bq9TzpL/y0E/qqZRroIHMP9pc=;
 b=lt3cAp84PpenpteprfJCxIPzatbm/JszTU7IY4eQ4LxxKlPXFOIQccSahjfhDiPLJwYVF1Zo0M+UN+fLvJAXE5QbRDJkX/AD/ppOXvbpF9/i6IilSSMCbHddHTHIwxXyZWAvwHZ4zskF8Ix52N4Tq15GO62eIbxIO1B/ise85Eb0DxY8XvjhVfgWH4sFIqfS1ZVSNRf0BcVTf+ruOqdc+uQsJV4qdlaBc2FjY87z9ETgeE1co9+MpranPiwFvdj+P+FZPT7vHJyH71Y4fTMO/xSUHBHEx/6zPAsAKzGDDYUg00VsedNX7m8ez/9tssBE+ubYaLLiHAcmV/g0aDS8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lk1AWG9IAHms14v2W1Bq9TzpL/y0E/qqZRroIHMP9pc=;
 b=Qj2dwaYBSvUxiC8HrGHRGiI+Dv2Mzw0gjRUKpwJEchlgQloi3qsAj44qiRSty+etTEcBcKPRz3RuxKZ+OgDePiOFMxZ6VPxyMWbLNn0O0ymLim2Nxxwo2V2cFiJpxgTp4dQJQSpliwFijSQAsXH4rzQNwoDafgOHI8b5k2uPedopPX/26J+y+mLP+BALqf8EvuG3e6XWbZiICi5Zyc+mTOkWbRttB/ctwiiiF+vmFz8tD86KeduCADcPvEvRYmhiabFdkjsdI2oRrn+Xq7DjH7wDFJ2MxyMpCV3nte6QI845shdo9p75eot7mVj8R9BAtVsg/q+SwgqdTt/0zVdr7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3410c8cb-57d1-dcb8-ab58-dcd3ca6748c5@suse.com>
Date: Wed, 21 Dec 2022 14:28:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 8/8] x86/shadow: drop zero initialization from
 shadow_domain_init()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 4459deff-4f47-4ff7-d0ba-08dae357310c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqJf6Z0uJL/GVn/2d80KBSjafM/NMyQn0ZB/za5e0LW8kERizP8VexE1p/AzuhHJe6snxChz7wdwWrnKuU3KMxfwRVMuebJyJIvIUmX1wweBoWz2KSkk2ZOgpPtA6akUOILHoh5feOl8a80SR5Zvm+803U+gDKOYjHOIltiabeP2nzLw7E0QBkJ73/4nr7ljF+px3+a8JvIHY8BV5kR8cbeOYKIicLwnGauG4hQH/fgKWMCk4vYl5wBPOfcw3Wv6QyVXtcGG+N45XtV/87YCTldJblvHzF9/kjHvH2W4kTkf5FlyiIFCFLtQdeo5E+q6u/iVtaySgFoLFJLMyP9Es+lNUtNzx9uNz+CSIm2A4t4sGYGshO5ppgob297co+lG2X0VtRNdoiFnJeOAX9o2ohdQms259Wt6VvCY8WlXRo8e12y0SKnPphf40oaTmG0AdtiXUUaGg8NPVPtQXZ+PGRDPdHaDh9ugkHm8LBfsnMT5MWF8HqefpM9A9nHkZZn8zeR+dFkHEf4QQBiqXeeBqVa0PrASBOJ5JeqSru9n5nqFjtodyngvIRThZqaBYpTXq7MS5B24Egxi8aH2wQ6BlROXEonkQ4Mm0avZ0+mhybvPODG2oh+Zw88IEUXFFaUOuUk6DsBHMyMqiTbccdS87jhb9B/+hAHZqNeM6sWMNpvZfVm0lQbxBpACjOZs7PjXyY3UcQT3JzlcpJtV8dpq9846wn5bSDTlRRisVaYfhHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(83380400001)(86362001)(31696002)(2616005)(38100700002)(36756003)(478600001)(26005)(186003)(6506007)(6486002)(6512007)(66946007)(66476007)(5660300002)(8676002)(4326008)(316002)(6916009)(31686004)(8936002)(66556008)(41300700001)(2906002)(54906003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnhvVHRJampNL01OOUxOSllEU0dMZkgwRGxKUWxOSUlkTFFnYnpWRUk1R2dp?=
 =?utf-8?B?WDFTZEU5Rk4xR0szNUlla25RQ0F0YjNlVDNHaWNtcFZGRmJCeE5PTVlaNk52?=
 =?utf-8?B?T3NqWjMxUWN1d3pNRzg1eS9qSXFNdllBMkY1UERRQ0RBbFBBTUZheWIwM0RS?=
 =?utf-8?B?VnIzYUJmMWs2RG9CMVBnSzFsQmh3aVVZQ1pNTEg2bm1nU084VjErQXhWekMv?=
 =?utf-8?B?TmRHWEFDSEdNYUJTUWpCOG9sR2g2UnNCZ21MdjAvMEIweUk5UE8rQXdYZHFV?=
 =?utf-8?B?N3kwbnpQVHhuOTRsWW0rZk5UV01PZnMrY2VUMm16MXhSRyswYXVNRnBLQzVP?=
 =?utf-8?B?U3Q1ZGQ5OW5pVWFVUTdXWTdZSnZ3MTgwRTAzQlhiSXRJMWplTEY0aUxIWHBX?=
 =?utf-8?B?ZC9uV2RjT1NJQW9HL0czN094eGhqU1A0dGZ3a1NMVVdLRTk2UCt5bExEYUFt?=
 =?utf-8?B?ZUFGKzBIRWtkdkNkWmh4cjlZNTRlYlkyOGhwS2QzRmFzWGo4ZGJWMDlzZDFY?=
 =?utf-8?B?S1FyQUJuSVZlZVpGYUUrUUw4ejN1MEs1SFJNMUtqdU4zUVlMeC94RGpRdnM4?=
 =?utf-8?B?RVE1eERpanRiOWFSWkxqNjJrNk9sUE1EQlpzRTNiYlpjL0pUSHJoU2x6elYv?=
 =?utf-8?B?bnNyWU1HOCtYbDVIcU9ERnpLampTWEdRc0pKMW5ockZrM2dvUjloL0ZkVzJP?=
 =?utf-8?B?MGpzRm1sUHNkUUozY3d6cGo4c2RkbGN3L1dvb0VoN2ptQVUzdlNER0ltSkxN?=
 =?utf-8?B?eW1NQkJEVSszaE1YVG1RTnVzcjIzMnkrakh2dkU4ZVlLaktQNHk2aGF0eUNr?=
 =?utf-8?B?VnNSNE9qaXJlUGMvNEM0VWgxdHQ4TFlIRW40MTFwVTFWY0UzMElTbTlVd2Fx?=
 =?utf-8?B?dGdEWVFIbVZ2MmFmKzJvbzRPdmhtL2JDK3RkdkEweDBPanYrbVdMcXo5bnlp?=
 =?utf-8?B?bi9LYWJleUxoYVRJQmYyY3hqQUVHdWlGekx4UHJURzFDVFdyR0xmMy9zaHVx?=
 =?utf-8?B?RGJZUkkvYm4wQlBIanIvZDRuWEpqd1pyTXh1S0cycktzNjdxNXVsUjlmRUFq?=
 =?utf-8?B?V1h4SldzdHlYVU0vdjBYVG5nREV2T3ZkdWNCSVg3UlVvakhDMXNjb1VLam9Q?=
 =?utf-8?B?QTZXQ2V2ZHZSZnBXdlBkak9kN3RCYW1CeVhWVGJFQXF6STl3ZG1VaVlQSkFK?=
 =?utf-8?B?UzFESmYyMk1YL0JRajVJREtVU2tpV3pmSUhpQ3IwTzlTRUUyanFQMkxuaXBy?=
 =?utf-8?B?dEE0UW1XOFhaYXlvSjN6aGxRV3lGZk5FNlVHaWlCWlpXTVFDSXRGZ3dsRk1P?=
 =?utf-8?B?Wmhha0w5Vnh6SS9uSGFlZXlFT1RrbTRxbjVETXhaQkNjUUtSN3ZqRWlLT2VE?=
 =?utf-8?B?Ui9MdmZWVnFwK2M5alNhZG41SVU1RG5XVEhuTzI2UG5STlhGT0JleHptM3lQ?=
 =?utf-8?B?cVMvaEdxNHpDWG00NmJWTkVnSG5NbXVUT0h2dzJYNVpzc3VMZjBjZjV2dXpy?=
 =?utf-8?B?TkV3b2lsZnJIR2hMVTd1VWtjSGhiUlY2ZWx2anZhc2xLOVZwd1BhSkVHeEVL?=
 =?utf-8?B?N1J3a0pVem9uUXhrQXI3bVcvYXQyNTNQc3ZUbjJHZ1UwNjE2TCtHL1FKR3ll?=
 =?utf-8?B?dGg3dlVXbTdIa3d5a3djMjZyMmlucmxUSGtkNy8vemRWMnRjT0lsSEpTNmhO?=
 =?utf-8?B?ZEcxQ1ROR2YyOEpoYk82RXlPYnE1d0lnT1E3U0ludnZjck9CL05YTEV0ZEkz?=
 =?utf-8?B?WEhXelNRNm4waW80OEovb2ppMytyVGNYNlo0cC9DZU1FaGxncFpCd2ZjbXBJ?=
 =?utf-8?B?S3FDOE1TWi9SUnY3NXFtM2tnaWUya3lkbVBzRTN2ZitWYng0UVowcXJvVXNN?=
 =?utf-8?B?d2kzY1VBZGNVSnhBL0JDOXU4bVUydWVPWWZ6SnVwT2s5NWFHMkdNblpWSW82?=
 =?utf-8?B?TVpDR0J1OWVwdGdFUGphNE5PMEpDaENwbUg5ZzBYS082NW4vSUd2blBDZUVN?=
 =?utf-8?B?WXB3RW9Ob0lHbkpDUUY4NlJoNmIwS0lqcndpaS8vNVplWUdkSUc5WnlGNDda?=
 =?utf-8?B?WmtyVVMySFZQQ3hQVFBoOGt4YjJ2RXk4ZHgxN2E2Skhoei8zL1F5dC9tN2xm?=
 =?utf-8?Q?QjeDsHQPtsJKfiuMqWV0cjLQ2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4459deff-4f47-4ff7-d0ba-08dae357310c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:28:05.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7F7vMgztf6iwuf/INMvs6qwwP4ooHCy++4qV6O4od1Ac7fFOGSjmuZ8qqxOIPoKLkQuEodti8Fi+WS3nOE8jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582

There's no need for this as struct domain starts out zero-filled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -64,12 +64,8 @@ int shadow_domain_init(struct domain *d)
 
     d->arch.paging.update_paging_mode = shadow_update_paging_mode;
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-    d->arch.paging.shadow.oos_active = 0;
-#endif
 #ifdef CONFIG_HVM
     d->arch.paging.flush_tlb = shadow_flush_tlb;
-    d->arch.paging.shadow.pagetable_dying_op = 0;
 #endif
 
     return 0;


