Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6CC1FB88
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 12:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153502.1483825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQXx-0005D3-96; Thu, 30 Oct 2025 11:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153502.1483825; Thu, 30 Oct 2025 11:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQXx-0005Ah-4k; Thu, 30 Oct 2025 11:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1153502;
 Thu, 30 Oct 2025 11:10:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5IGd=5H=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vEQXv-0005Ab-K0
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 11:10:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06fff14a-b581-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 12:10:22 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBAPR03MB6408.eurprd03.prod.outlook.com (2603:10a6:10:194::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 30 Oct
 2025 11:10:18 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 11:10:18 +0000
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
X-Inumbo-ID: 06fff14a-b581-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL3s88FCcDnNwSDPip8aZuRWnhayauKrA3SMXl1YY6mz2t3oplRRUtPa7Ijzpx8vn0xkipRN/DXysVzqMMziNkuzlAglnecnk/o3BalfCjO8cOn1VMsL/4kYfPEYV937tHtR+oZ3PFnYwUEUlkQg/AeTTLXGcUY0BOtwdlK1YkEyV4jI7dFD11gV+zZB8EP2ewgk9hzXTcBzxWxYAcJBvvKS0W9PDI+7pLcsA72L/wUDtQ2xI0NKg1LXsnzYFJCTF6ALlJldWqZu/+ehjMbKSr0gU3uD2PsmlEhh9DY9YRqC7zQpA6L/1cg+SU5hOY4Zj6Ue3G+Tvulh5AZ91iRmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrohxZxly6XcDkOA6IHvFKj6ZK10AjLi3CU6oDGeaWU=;
 b=zROlx/MgtMAkROmKnInMPL0HoyRJdNJkeDVLorc7Eha7QDcG4i6LB3sKY3W7iSHXuG604IBTBmG2o2kt9Y30LQNfuzOagKCIg4uKiA4oL8bNoAnMgUTiUgz2/9Uc2xZLQR2jmYZHu/AcnStu49Nj4a516HfIw7eH7qQJjUyJ4sX919IZeSM9h53XY6OeFX/y4qQP3cQadN1oWC2CYdD5uVH6w6nZx07YCM26BLODcs83uE6gtUnd7V7gM3IWONF38f+3mMhfCddv3m/sjfU0j9hyqlsGgmY+YrpRg28m+oj/qPTWNvy2jr0SOYXEenxSrOtwNCZSbsLAYqBSiJ+oWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrohxZxly6XcDkOA6IHvFKj6ZK10AjLi3CU6oDGeaWU=;
 b=EqaBYLak9Uk7rdEzi7Jfi3sIih9tDnIQv5Oupwjnt2kZsYBcLVeClrkMW4ggN8qSjdOKgvZgIcv5qVroii7ET1Xc83qFuJusF8H99yB2JsCDazj9oo/a2xDR1WUCDaEwVWs2WddeAKfrFQkSm/j5mV8LhUUGnG/rRyVeL5/uZYqFgSOWjyTpNej83OnT4dtRuUYsv9yXQNarv9mx88QmLeHjiYxSHGy207OK8w6+cDybpxiiNnU/AGzPtqAU0j16GCDDWXihWO0h/WO0nHvatbiO7LmSyci8PIUXBw32G5ISTtQ184G7Z59XVuoQ31If1Ww3gs1x9dP6bV1tGydJOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5664f69f-729b-41eb-8e39-67609de42e3b@epam.com>
Date: Thu, 30 Oct 2025 13:10:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/28] xen/vm_event: introduce vm_event_is_enabled()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-9-Penny.Zheng@amd.com>
 <23426fe7-533a-4ffc-9ad5-a620f2ac0cfc@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <23426fe7-533a-4ffc-9ad5-a620f2ac0cfc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::18) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBAPR03MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cc5e5b-12eb-4562-7136-08de17a4e917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVFxdThGQlRDN1UxNmhiVkNBUms3NC9nUllTN0JUTm1KQndrZWZVa0RTMW9a?=
 =?utf-8?B?ODhia2VsYytacjQ0bmh5eC8xOUVSNC9EdDhKejdEVlNDa0Q5a1RxSUdHWGVK?=
 =?utf-8?B?Z1ZrOFh3UW91bGpraTJ4eHdwVS9IbGE4UDFyVlQ1ZG53S3IzdUxEL0V6dmJ2?=
 =?utf-8?B?UnZaZ2VWV29ZK0g2NlI1cFpBSExsMmtocUlWZVh6OFFUU3E5UWxnSGFBV1R0?=
 =?utf-8?B?QnFXeWtSZkU4dysvQXVVT1lRZktobXBwNzM1aXpPWVdEQm53SUNNb3FFUDk2?=
 =?utf-8?B?emtmSzJROEh2U2tlN2N4c1lIVDA4ZkdqSTdkRFhoQUVPTEthMUlHV1UyMVA0?=
 =?utf-8?B?S2JIaHJ0K09iQm8xNnlyUGxLTTJxWVhhZmRYZGZza2tQdDA4SmZvMGYvM3Nx?=
 =?utf-8?B?SS9JSkpuV0FITWtmbE40QTdNTml5NzhCR2dDZFdwZndoZC9ZRnNmamZsc0lv?=
 =?utf-8?B?WURzY05ST2tVUzdvdTByN3NRZHhaZ0wwQmFGRWY4dENibHR2RG9vRTNkU28w?=
 =?utf-8?B?MG45VDZ5cVlGVnAzODcvVGZETlFhcGZkTlMxTW9YS2VKTUtlTzRqMGhybmVP?=
 =?utf-8?B?bWZ5SjhHTnl1SE1TdnBVeTRMcy9pN2czeTZabkd6aVdxc2M0RlI4bmg4NTlH?=
 =?utf-8?B?Y0JEbUxodEw4K3AyNUdPZlhId056RnM4ODBDUXZueXRlUzA4cnRwL2prbWgw?=
 =?utf-8?B?dkprTkpFN2RlVzF3VEJtTjRVQ0hwWFlQTjhnYllrdFU2bnBheVRzT1d1WWV3?=
 =?utf-8?B?cWFjNlBEcEgyUFAwR1laandvNDFqeW1FWjlYSlBEQWlPeTZrcnlGS0hkTTht?=
 =?utf-8?B?aVFvVERLYUJTWE9VZUxxRXJ2R1RwTm84bFdOcitWZ1hxb082czFJUnVFRVl6?=
 =?utf-8?B?bWJyTGoweWZMOVZ1QThnT0Q0WE1mZWRaWTZsRUtLNHVReUJOSmh1NElwendJ?=
 =?utf-8?B?UnkxaXBjTjlxZXdFOUxMZCtINFJrdzhEK1FNNUhHMFBLUkwyYWI4TnNDc3V4?=
 =?utf-8?B?aDhma3RZQTBJQ1c2dmU5bnRoYnh6Vm01N2ZUdk0rUXA5Ukwvak82c2FIUmFZ?=
 =?utf-8?B?Q2twU1ZHY1VYaEhDZGljS1JteE52aVVmNk5MaEd5U3pQS1cxVllWV09HQ1V2?=
 =?utf-8?B?NVQzeWQ4aXg5Sm42T3JVYUd0TXA0b3VvNC9nd0VOVUt1NVFqRWp2TXQ1aS84?=
 =?utf-8?B?UkMvUHBGRmNnNTZNaFNDcGVTVTh0WDV3MEFDWjBqeGJYZ3Y3V2JqVDRQRk1W?=
 =?utf-8?B?ZkVCMVhHWDBoeGRhRDlCbVY3a04yelRJQmwzS0tUZ09YZXhrajRPU0Q0aGRR?=
 =?utf-8?B?N2lDSXhaN1FzVXR4UVFEZHBDMG1teEpSbGlYNnc4bzYzWU5nRStUbjRWTkV4?=
 =?utf-8?B?VTQxMVc5dkxFVks0NE44cExjK2hXNmtyLzEyNUo5M094WnN4L2QwQkhnbEwy?=
 =?utf-8?B?NDFOMDEyVGtQN2swbGdlWUltVEdUaS8yRXBnazhubzArd1NrT3RxK3c4cHpH?=
 =?utf-8?B?RlpXaitRbEtGOEhGYTJVWGNPV0EyKzZibXIrbGtpcFByRGtvTFZ1OWwrMDNS?=
 =?utf-8?B?ZXg0a1UvT1pLTWs0ZHE1cUgzdGFPcHdncUU1em9USXBaWkJ0Mk8zWDAvUm9q?=
 =?utf-8?B?dFVFbE1JQ1MxMFNrbGF0QjBRNEV3MERKeU9NUy9Nb3pmby9Wa25rdmp4Q2dG?=
 =?utf-8?B?eWdxb3dkcTJnOVpTaVFLaDZ6ZUUyM1lKZDJKdGRwMzJhdzlCL0lwa0hTRXk3?=
 =?utf-8?B?QnV3VUMrZkRYQ2lHU3VINmdjSlM3cytzMHk4ekZKUUdjSXNUTXA5Z01EQXRo?=
 =?utf-8?B?QTBpZVdwQ0hNcXpRUVVpV1l6Mlo5NXJNVWx4RGEzL0pSc2hxMW9Pby9hZWx2?=
 =?utf-8?B?Tk8rLzRBSFBmNkxUMUZCQVNNdGdzemJQb3FBTXc0eUpSNnVIY3hWS0hzZE5K?=
 =?utf-8?Q?mqdMqYGIS+AoSfs4nmtrdR4MQ83VPoTm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RElVeEZ3cStRYzVKUTcxMDQ1MHZiTy94U2c2Y3l5ZHU0bW90YnBMeTI4TGYz?=
 =?utf-8?B?d3Zta2lXT3I1a0VERXdIZmxGR3hSSUZmSEZ0RmhRY3JtcHgrb3Btc0lxSHZU?=
 =?utf-8?B?SkQwTTRQL3pNeGpYNlc5djI2blZhSDl0aFJYTWJyNXUwVDVqNUN1L0VjeGw1?=
 =?utf-8?B?OWhQMElKLzRDWlFGWTBhTWk1OUVPZmlySUg5L3NrYkEyZDZHNUhES0NtUkp5?=
 =?utf-8?B?Q0M2VVNaRzNPdllUUlN1ZTJTSWlSSnhVSk1UN0J0MHM4L1kzUmpCNzE5ZUsr?=
 =?utf-8?B?NmJsVHB3TERMTDI2azViSkRsdWMyd0FtUEt6UkowYjFYVTJHd2o4SkQzRm1Y?=
 =?utf-8?B?am5BRVp0STRTektUYzd6MGZUR0JaZ1NzdTBqclV3dnBMZmdKOCtzSVNJL0Vk?=
 =?utf-8?B?YzlLTW1scThIcTFNckJvYjhzQStkcTg4UjJWczNzTDV6bENyV0xDTTRENVJH?=
 =?utf-8?B?d3BVbTFVck9KdUM5Tm51b29mcGl5ck5Ia2RhR2Q0c3VrTDFIeVFyNGlFWGR3?=
 =?utf-8?B?SEJGU09rdUluaXh3NXNnZEhHeDZ5ZUs0VUI5S2t4YXRsdGFnNDc2a09OWSsx?=
 =?utf-8?B?dmJoblh6Nk9xZTdOOXZ2Y3VCaWRzbHEvV1d5TFNHaUhkTVQ5bk0rM1J1bWI3?=
 =?utf-8?B?SnJEYlptT2tXZnZKTU40cGlWMFdvUXg5RFRFUjluYkNURHBNTGxqaEFVdEIw?=
 =?utf-8?B?TTdPM0pVL0xhTlp5azRkY3NxaVMwNFNveTdoVnNWVi9lTjI4NmVjcERLYmha?=
 =?utf-8?B?VUNYcVF4cm5jKzlXVnladi95Z2dvaDlFdnhvdFpZZlFVUjE4OHJpcVZTYkF0?=
 =?utf-8?B?ajdXZml5djR4SERYZCtIZWxHbjRBTFE4NjhOV3VJN1Jtbi9qRnRBWEpUUDds?=
 =?utf-8?B?ZzdQTjFnUmpVY3FJdXp0NitNd0JpYTRrQXBFSHlyVUdRdnlGblJ1UUhUNWp3?=
 =?utf-8?B?NUsxQnZlWmcwa2t2SldQNFZ1dDdqT3NwdWlWMjZQdktSZm9SRkdpbzJSd2o1?=
 =?utf-8?B?VTJ1TFNCa3VEVnNpYlppc1Uzd1Z6YjJlZVhyQXdTdm5CU0JDdmp0QWl3Ujg5?=
 =?utf-8?B?WjNJOFlxUzNERmZaSVpobWhoK1N6aDNHUm81b2Y4eW5EVEt4NXZ2ck5tTDY2?=
 =?utf-8?B?dmtNeEo2MmpJQ0FGSGw3ODJla0RJZFNKcHkwWHFSSHpBUXBRb1I3ZnJnaXRU?=
 =?utf-8?B?Zk9tSVhNQ3duS3p0R0JoaXdFNmxjNkdpamdvSExWVG9mUldEenZaWWlzUUgz?=
 =?utf-8?B?d2RSRmM0SGN1OGRlRHNWaGhSNkJCd1A4cFJPR1NKeEhYR1hHUUM3cDYrVUY3?=
 =?utf-8?B?UnFpOERhOWZEY3N1SGl1eWkyTHYzbU1IemxIRU1VUTBVTHZRUTdIYmJsWU91?=
 =?utf-8?B?QjVkWVk4OGVmeGM5TEhnME54ZmNwZVZVc09zOHA3NUE0U2dxM2RTTzM0eG5L?=
 =?utf-8?B?SXJ3UEQ5VGEwYUNYZzloN21rOFFVWTgzTUZ1NmYvaFFJeTlUOVN1emQvdDJ5?=
 =?utf-8?B?SWwxcENXNk9vUmJBVWJDZkI0bnNaNk1wck5Qcmc2ZHl4MXlQbW81TS9PNUxu?=
 =?utf-8?B?MGh1cllKWnhockQwUlp1dkZxUUp6Z0tyMlFnUEN6NzJBQ1hJN1pKUHRTUmVC?=
 =?utf-8?B?bzRzSk9JTHdMRWlTa0pFU05oK2EwWEkvVklrOUM4eWQ4NXR2WHkzV0dHYlhU?=
 =?utf-8?B?RlZ0MHRBdU4zTDhISmU5c0Z5S2NzTlJlL200aUdtekZ5VFhOQjRCYUVZcDlT?=
 =?utf-8?B?Q0Rpendta3gzc1JVUUZKVjdHa29Tb0ZpTnR2SjJxTkROcFA4eWkyWWlrWmg0?=
 =?utf-8?B?d1dtWWdHbmlWTUVpWThncXQ3MHBmeUFqUkNKeTVhYU03YS80NjE2K3BYUWpB?=
 =?utf-8?B?WTlreWlsNlFuUU9sQ251Q09EenllSzcrdndYWUZscWNiMU1lZzl3VlFibENv?=
 =?utf-8?B?cjdDb1BES0psQlVPTytVbGF5Ni9Nc2lkb3JLcWYrMlJuaHBaSUtmTzd6S1ln?=
 =?utf-8?B?QnRNVXJONGpCU1V2eTdTUlhOSUxmUm5CSTFONmdSYWxrdTk4Z3lZMDZJRm0v?=
 =?utf-8?B?bmkwYTZyQ1IzZ3pmTnBOZ2lCNTZOMy94WWFDNnFCRkZNOXZsVEVPUUlpNllY?=
 =?utf-8?B?cE41b0s1ZmxTcE8zMTd4ZW02cmM2WVpNeGt5WjV3clpJSVVNbWdzZnppKzc2?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cc5e5b-12eb-4562-7136-08de17a4e917
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 11:10:18.7411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9q9pKmSzrwSZBOQEztlbA7GvKxaNfOFemZVwLKacB+oEQD3Y7p1jP8SEqk6MgzPApwRFRKIvWsS1jTYr8IePqFS4Nl7LwLPR8kIeKRnVXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6408

Hi Penny,

For some reasons this patch is not in the list nor in patchwork.
At least I can't find it :(

On 29.10.25 17:02, Jan Beulich wrote:
> On 13.10.2025 12:15, Penny Zheng wrote:
>> @@ -2340,6 +2341,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>>            (value & (X86_CR0_PE | X86_CR0_PG)) == X86_CR0_PG )
>>           return X86EMUL_EXCEPTION;
>>   
>> +    may_defer &= vm_event_is_enabled(v);
> 
> I think this wants to move to the very top of the function, so that it's clear
> that all uses (current and future) in the function are covered. Same for the
> sibling functions, of course.
> 
>> @@ -3544,6 +3548,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>>       struct vcpu *curr = current;
>>       unsigned int leaf = regs->eax, subleaf = regs->ecx;
>>       struct cpuid_leaf res;
>> +    int ret = 0;
>>   
>>       if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
>>            hvm_get_cpl(curr) > 0 )
>> @@ -3560,7 +3565,10 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>>       regs->rcx = res.c;
>>       regs->rdx = res.d;
>>   
>> -    return hvm_monitor_cpuid(inst_len, leaf, subleaf);
>> +    if ( vm_event_is_enabled(curr) )
>> +        ret = hvm_monitor_cpuid(inst_len, leaf, subleaf);
>> +
>> +    return ret;
> 
> Just to mention, could also do without a new local variable:
> 
>      return vm_event_is_enabled(curr)
>             ? hvm_monitor_cpuid(inst_len, leaf, subleaf)
>             : 0;
> 
>> @@ -3860,9 +3869,11 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>>       struct vcpu *curr = current;
>>       struct domain *currd = curr->domain;
>>   
>> -    if ( currd->arch.monitor.descriptor_access_enabled )
>> +    if ( currd->arch.monitor.descriptor_access_enabled &&
>> +         vm_event_is_enabled(curr) )
> 
> While functionally it won't matter, logically this looks the wrong way round.
> In principle I'd expect the "monitor" field to also disappear when VM_EVENT=n,
> at which point the order will need to be the other way around anyway (as the
> explicit CONFIG_VM_EVENT then needs to come first).
> 
>>       {
>>           ASSERT(curr->arch.vm_event);
>> +
>>           hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
>>                                         descriptor, is_write);
>>       }
> 
> Stray change (especially in an already big patch)?
> 
>> @@ -2551,7 +2552,7 @@ void asmlinkage svm_vmexit_handler(void)
>>       uint64_t exit_reason;
>>       struct vcpu *v = current;
>>       struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>> -    int insn_len, rc;
>> +    int insn_len, rc = 0;
> 
> This is almost 200 lines apart from ...
> 
>> @@ -2720,11 +2721,14 @@ void asmlinkage svm_vmexit_handler(void)
>>                       break;
>>               }
>>   
>> -            rc = hvm_monitor_debug(regs->rip,
>> -                                   HVM_MONITOR_DEBUG_EXCEPTION,
>> -                                   trap_type, insn_len, 0);
>> -            if ( rc < 0 )
>> -                goto unexpected_exit_type;
>> +            if ( vm_event_is_enabled(v) )
>> +            {
>> +                rc = hvm_monitor_debug(regs->rip,
>> +                                       HVM_MONITOR_DEBUG_EXCEPTION,
>> +                                       trap_type, insn_len, 0);
>> +                if ( rc < 0 )
>> +                    goto unexpected_exit_type;
>> +            }
>>               if ( !rc )
>>                   hvm_inject_exception(X86_EXC_DB,
>>                                        trap_type, insn_len, X86_EVENT_NO_EC);
> 
> ... where it first comes into play. I wonder whether the initialization
> wouldn't better move closer, also for the code to be less fragile going
> forward (where a new earlier use of rc might easily appear). Or, like VMX
> code has it, limit the scope of "rc" (requiring several instances then in
> relatively narrow scopes).
> 
>> --- a/xen/arch/x86/include/asm/vm_event.h
>> +++ b/xen/arch/x86/include/asm/vm_event.h
>> @@ -45,4 +45,13 @@ void vm_event_sync_event(struct vcpu *v, bool value);
>>   
>>   void vm_event_reset_vmtrace(struct vcpu *v);
>>   
>> +static inline bool vm_event_is_enabled(struct vcpu *v)
> 
> Pointer-to-const please for (almost?) all predicate-like functions.
> 
>> +{
>> +#ifdef CONFIG_VM_EVENT
>> +    return v->arch.vm_event != NULL;
>> +#else
>> +    return false;
>> +#endif
>> +}
> 
> As long a vm_event is always a member of struct arch_vcpu, IS_ENABLED() should
> be sufficient here? Or did you merely forget to add an #ifdef around the field
> as well? Albeit I realize that would break with e.g. the use in
> hvmemul_rep_outs_set_context(). Otoh that function (and likely others there)
> should be compiled out when VM_EVENT=n. Maybe that's the subject of the next
> patch ...
> 
> Jan
> 

-- 
Best regards,
-grygorii


