Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734DA7E424
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940435.1340217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oL9-0004CT-0P; Mon, 07 Apr 2025 15:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940435.1340217; Mon, 07 Apr 2025 15:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1oL8-0004Al-Rv; Mon, 07 Apr 2025 15:24:46 +0000
Received: by outflank-mailman (input) for mailman id 940435;
 Mon, 07 Apr 2025 15:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LsCM=WZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u1o9n-0005V3-A9
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:13:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:200a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb3b1aaa-13c2-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 17:13:01 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 15:12:57 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 15:12:57 +0000
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
X-Inumbo-ID: cb3b1aaa-13c2-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtrLfD/Yq8cFOJgQ6Pf1cyuoHHpeA8rwMhkZU58Kqso6+NpQDgaJPQzfDCy9Q8QHulPI0QijU08w3C4ZldsVNd7gx7J5fxym8Z7WwcuIX3YaLtOIohndwQlQqE88yqhRZbbDS+MdOxk/qjigTXAtgZpg41uNrJaZ5M+K08jwXRT+Uw9qhtXkneARcXSMPcrksBigEbkzbpCQh3dwZwrZjwyZaj5sGel4qDJjAzZN2seh/5G3HMeA2ppo3/wEj/+GK7t3nhMZuFIz6Lvm8pVYX8pm+AGZ1zvnuP+7vdD42sSS4g8INKy2eOPFsASZdOENwOH+fO0TPhk5CJNSPDdFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXxhfpBP5/w6R4H8kjYqrOY7hTQbBnkef6sJ9e0luL0=;
 b=WsOSkte0rnmHNwFUP/yZTSpY9vCyvaDIm3BF6jZQ7uZ2UFu/A4XuCddX6fo/BVmDevqWBbgL9ib7P68pX6zSqFllxDCiDc/w/g3fKTTt51fJ8ZSJg9AF1Zis5rCs4WvtZSB9ZRKJvCzP0h13/fj6lWsnWfSU85EUENCxcJ3EXAaI3LTX3WwOlUM2duTFIgcduEDR+K/zxpswQBQVZzkrmKK7agvuCKTKzzJyhmZy453lg3vDLE2EdUneU0KBm44E4hen/A3vq4pSjm1MZKBeppFQswtCSw9NwWRcwDR/inQgXanw61wHknNHPNI4qGWhMz6WYfl71PfT0HxU1vNbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXxhfpBP5/w6R4H8kjYqrOY7hTQbBnkef6sJ9e0luL0=;
 b=TwgCugKv+kEKo992q2mjdhCKoINui0eWOyRYcBodji3PJrYhKOb1I3QmaFycEKIPudx3mxnN9U2SPnASwO+Tqs+ltam6HIcWI1n4bdx4Dzw8FwDgHPbdJ0wkHVwFV0Xu4IZVhu2ZjlRGLs5ecIKD+5nZzx8l5l2xXLNz6bQySYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dfbcfb4b-a045-4db5-b367-d1673d893c5c@amd.com>
Date: Mon, 7 Apr 2025 17:12:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Consistently use 'static' first
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com
References: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
 <20250403214139.1671954-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250403214139.1671954-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::16) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 0691a64a-62a5-479d-3139-08dd75e6ad74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVVqbkVRWnVoODlFM1I4MUFwUzJ1K0dKNU0yNVE3azdYUHlmOGxwT0lETGRZ?=
 =?utf-8?B?K0pHMzdpYUhMVStYY1ZYR1JiOEdmV1Q2WjQrUTJHZ1RTQWI4QjZBaWNWaUFT?=
 =?utf-8?B?aXExcHp6dGpTZno4Mkpyc1VYajBwVTlEZHZ3eERzN3pabGlsNDg2TU5wWGk4?=
 =?utf-8?B?d25YTkM5OHQ1bnhWZXdJK04rUWtBUERkNURWc28zZnVuOTNpaTI0Y08rRzdh?=
 =?utf-8?B?aWN3RmwwKzcwUWxwSllHTmZRUnh2WWxJVUFST0hQM0VWZHZZMnNIMjR2ZWE4?=
 =?utf-8?B?SjZaYTRnU21nNGpuQU14bFdnR283bk1vSmJ2Wm5qOTVLYmFVd3VycjZNbk9o?=
 =?utf-8?B?a3k3K1dhekVrSGtYcFpHN1JCRXBWNlIvQ1BGYXZWRzZsbk5OMkhicU85dExm?=
 =?utf-8?B?S2doVENURFhScEpJUjZWVXJBWHNHVmN3MjBiWkJSN1BtTFlMYjFJWGN0VDZZ?=
 =?utf-8?B?cTBYa0dwMFhIWXRUVDN5K3d1emdPczdIc1o1K0dIbytUNnFidjI4aDRvRG9B?=
 =?utf-8?B?S0RibGFSeTE5cHFaeXBZYXluc1JQOVFIRmVObEdjVHF6S25MQUt6UEJ4WmdJ?=
 =?utf-8?B?aUpMNFJ1VmZXdWw1STdEZkhvaU5ZTkNqRGtsQXI0elYxQkRhNjZCNmVkTHVi?=
 =?utf-8?B?UWdaNVFYdUFPWklSK3RkOFl6TFRSS0RqZEN5YitDUlM1aVNyMUtES2F4dTZQ?=
 =?utf-8?B?UEMzdkxYV2szeEY1MmZiRGdWUnRrbldEeEdLR3NFUVFuc1V4ZTBySjJsMmlI?=
 =?utf-8?B?dGwzYmFaYmJzKytTYWRvZVJEMCtqQVBJN3gzMCtDb3cxNkR2YjhBcDg2Wlhr?=
 =?utf-8?B?RVRZWmFxWkRTQWFPb0NOOGxrblQ4NkNTTGd0TlhhQVNLUngyRlZ1N1V0cTFh?=
 =?utf-8?B?K1VRRmswV3RTbGcyYUpCMU5MN3VHT0lzeEZ3djd6LzRVRy9DRVlXbjlSamdx?=
 =?utf-8?B?Z3VuU0pnWGt5ZXN6WlcxSTBaWmZiTi9kUjNNUXd0b2xzOWtMYXowVGpEVnVO?=
 =?utf-8?B?Z2cyeGlYRSt3QjBnRFBOTFgycUFLQnZQQlI1bzNlYS9sTXY4OXU5V0ZhaFpy?=
 =?utf-8?B?ZHVNSzZlakk2K0NpN205YXdsRzRoRS90VUJUbFY4WGpncUJ1dmloRFZwcGYx?=
 =?utf-8?B?bDJwQ1Z6K0Jna21ISGpaNS8ySlB5Q1NXS3JQd3ZkM1RvMnJIU1RzTThVYUpm?=
 =?utf-8?B?VnUyNm53Ti9vT2YrQUd1a2luSmoycVBra1BkRTZqNVQ1M2xXY0hyS3RNZjZQ?=
 =?utf-8?B?bnV4YTVTTU5HYWs3U1FFNnhvc3lFKy9PZEVEdjZhVFcrV2pzMVNXVXFBVkJI?=
 =?utf-8?B?RmJ5ZjY5bmRJVFJYYjl0a2pLbEhHWXk2d0J3TDdkT3YzZWlQdVg3anU0aDZ4?=
 =?utf-8?B?VEg5SUVtMWRWT3ZkeWZlNXArOWFJMUFDdW8rOGN4OTRiSkRuUEJrSHlKaWll?=
 =?utf-8?B?UnpMZzY2R1laQ3dJUjNqVklpeUJma0YzanpsUjV5MmlUakZUVkNBZmQ1Qzdk?=
 =?utf-8?B?VFF0K2dmSXJ6MzdvNHBaUjdOQzNIYTZkcmNleGs3ckprVjF1Vm40Nlp3UGdD?=
 =?utf-8?B?bkd4VDFwZlZUUlQ2Zk4xa2hpWXYxTy8yRWRrRU5EeEd2TVFISmtLZW04ZCti?=
 =?utf-8?B?N05ydW9aSEtFSmkxUkRRVGlJL0dDdlB4N1pHc0hyTk91UFdKQWlmZVlGRnkr?=
 =?utf-8?B?NUx1RGloa0tmMC9ZUW1adkJHVjJld1ZQMHNYV2txUzVVUURFTTUvaDZ4K3ls?=
 =?utf-8?B?WkNWWWhGSDc2b3ppaTd0cU5TVWRnZ2N5WlFJRnRrWnBpL0FJYWw5Ylk4a2RQ?=
 =?utf-8?B?U2FpcmRLblAyNWp1ZTBJOXg5UE1ydHZTTUdZVVI2Q3ZHRGljR2pHdGk1bVdo?=
 =?utf-8?Q?qQ6CZBWlXcgm7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVlNZkZFN2srZENoQmJSSWw0c1R3VVpvckdlbmE3aWljUTZHSVdsY283QVZD?=
 =?utf-8?B?bVNuWllRNkZpM0ZVSlU4OUd0OWFEYkpBejFLcU9JeHNhUHdOWm9NV1o0YVFy?=
 =?utf-8?B?YTdBZGVrdm9DNnJZQ3FuTXVXaUc5Rm41eURRenB3WjFEdkZsMlloc0c2clR4?=
 =?utf-8?B?SHJWcElLQVlyMzMzRUVtN2ZOT2N6MFZJdS9HRHpyVnJmbUlPd1ZhczJQK3JJ?=
 =?utf-8?B?cmVmMVNSNUZQei9MT0xrZUJkbk01TTNNaWZBM2NiRTFKVmlMZ2MvZ1g0Ullm?=
 =?utf-8?B?c2I2TWFXMnIzOGRTM2hHMVFxZ2RkaHRKNGcvVGpZcnVYS0MzbUt4eE9XNS9S?=
 =?utf-8?B?MVh1dy9QdVgxbzdRcVBNcmF6WkZNYkR1NitXSWFKenVHR2laUWNSV1BBeWZJ?=
 =?utf-8?B?dlZRN0VhQjc3WlJaNXM2cWFlbXpRWkZyYi8vYzJLVE5Wbko3SjBNS091cE4z?=
 =?utf-8?B?RmdXZXhWbW5TSnNWMVJPVC84T3cwVGc4eFJCWko4d094LzFkVWMwQTRKZiti?=
 =?utf-8?B?S0hDcHNKWE1OaFNSOE4zdUtTYVZmaXcydjdtMmVPK3A5MkNvM0NjWi9rUUd2?=
 =?utf-8?B?STNFZVV5VXJQVHNhcUppckxQZDVXWlhxZTRPV09sL2xzNUJhSkh5V2ZoRi9K?=
 =?utf-8?B?eWJkWXZqdHRkOXhVSzdUaGo0aXIxK2lsRWJoa01acGNjdHJDalNUNUgzekJr?=
 =?utf-8?B?NlhQblpBQ0FQdXNDclBBYnExY2pMTUNHY1BHQjM4ekZEZmQwWEJrR09oa0dK?=
 =?utf-8?B?dHl6Vk9aWEl3YThPVHRqaGFlbnFuUEhLWlpSbzFXUFpIQVZHY1B3K3ZoVm1y?=
 =?utf-8?B?OFEvdk5IdFlweXpDd0ZueHVjdE9VYjdQUXU5clVMc2taUVc3N0VvcWZzQUpV?=
 =?utf-8?B?a0g5bW5PdmZMZGtwbG81MldGbE0zNHlMTUNmWTVwbThIOUNSNXBFd2JML2Ux?=
 =?utf-8?B?L3VpNXd0Y0wzOVNpSkZOUGF6UkhuVXBYZlNnNmR5a1dVWmNoTnYrU29hM1A1?=
 =?utf-8?B?NTVNUjF5WFlDeTh4a2djV3JyeUpDMDFyQkV1UHh0VHlTUkQ0aDc2aGI3dWY3?=
 =?utf-8?B?Q0hSOGpCbmFFWVJBUVh1ZkJRTVltS0FrZGI4a21nMnJVYnpOTEdKdFBFSmUy?=
 =?utf-8?B?eVkraGZuZUkxaDVNbDY2bGhHSkU5VUxKN25McTJaL3diTHB4d1BaM05QTXZ3?=
 =?utf-8?B?TnZWY2xLV0lvZm00MmtWaDltSFYwU2tIaUhFTm16UklQMWVuVC91TEI5ZDRq?=
 =?utf-8?B?bXhaVFVRSG9kVTRiNHB1RDRvK1c1eDgvV0JtWURjWStTVm9oTFAvRURjcnAy?=
 =?utf-8?B?UnFUVWlwR1M1cG82aEZOT0cyUmdnamc4L2ZBS3JWaVBvQ1lpcHpuSGYrMEEv?=
 =?utf-8?B?RU9Wa0lqK1AyTFB5N1NoZ01WcnZKUXFxYi9zU1hOcVdZYmZUdlJUZmlicnk2?=
 =?utf-8?B?a2h6L2kzL2lic1p0dGRSOWR0U1phTVVuVVBLc21saitqOFRJQktEV2loNThX?=
 =?utf-8?B?clRqb1FlQVBzd1FCQlhFM2h1eGdhMHdKOEtKTW5ZTGVPV051dXZPMHNXcUVL?=
 =?utf-8?B?b2wrWm00akJqSW91NkRwcFMxRVAvTVlodURBSTcyczFXQVJnL2lxa1JuZ3g5?=
 =?utf-8?B?MmhYRGNoMlpqMjdydXRNZWFmTDc1akI4Tk0vRFRoOVA1QXlFRTdNcFpCRCs5?=
 =?utf-8?B?Y1hxQjNPUjhqVTNtRngwSmdqUlpuTEFvNHdQTVlIZjVONDY3NTczdE54di83?=
 =?utf-8?B?ak9rTUJ5aFY3ODhqcUpRSzE1bXlmNG1vRTU3NnU2VkpheXNROURjQUhzUGZz?=
 =?utf-8?B?ZDc4ZytlSDNuR1BPN0ZsczJZYUR5Nis5QUl0OHlzVzdiVG1SZGtDc1drTVRI?=
 =?utf-8?B?b3NKdnVnVHlCSUZsbmtwTkhrR1lFeFlwZlhGbjRhUjcrM3dPUC80VkpSMDFF?=
 =?utf-8?B?MnM2VDYxdkQyNVUrNW1aNnNtUlgyWlZXRjVnNEkzam5UaG5BVmtuRGt2eTdJ?=
 =?utf-8?B?NlljZVJuWi9JWDBwcWx1SndVVVQvb3dlZEcwaDVZWFBCMWM3b1hQU0ErbEpu?=
 =?utf-8?B?eVZaNUhYa2pkTjFTK2JsQ0RPSENVYTRkWWtCMnFiNjE4VFVkZk1VUTREc2gr?=
 =?utf-8?Q?KTWZhmRh5cCwtLUjHV1z0cWD8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0691a64a-62a5-479d-3139-08dd75e6ad74
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:12:57.3732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/G9mRyvih2rthRAUqltqob17vZRX5+HDaQWPSzDt1cE6lDxJRTyN/o/bTHTe8ip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111



On 03/04/2025 23:41, Andrew Cooper wrote:
> 
> 
> MISRA C:2012 Amendment 3 (which is under consideration, but not used by Xen
> yet) is more particular about having the storage class specifier first.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com> #Arm

~Michal


