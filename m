Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098978EE0E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593883.927006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhMt-0005Xu-FU; Thu, 31 Aug 2023 13:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593883.927006; Thu, 31 Aug 2023 13:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhMt-0005V0-Cd; Thu, 31 Aug 2023 13:05:51 +0000
Received: by outflank-mailman (input) for mailman id 593883;
 Thu, 31 Aug 2023 13:05:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbhMs-0005Uu-9d
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:05:50 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2084.outbound.protection.outlook.com [40.107.13.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b08fc47-47ff-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 15:05:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 13:05:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 13:05:19 +0000
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
X-Inumbo-ID: 1b08fc47-47ff-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt3iZftyXHRdn1/YnV1wRrFZ4CcNVyKpyJGURjftoSkeh+DTT+8QAwwMkhbROSYsTpkXfOWb4oLLsw2zlP3dcbI1R1zTvk9kYRyG+JddypRBmBXqZ8eZu/966xRq3f4s8g7LoB5RVo+DLSWqyjeAFE+9msVgJ6dDaTASSeJerjGh9rXPpgZV5GO7E+O+aHxwVuN+wmH+GQSUvsp0h1pzqYFMcixD898hWojOYhtMi+jQV0vxmFp3Whirwl0LPRu1LYIyG0owicZRkPx1H5gTpE5yPt4mTF1L3A84h0xETUjiMZop1/ZaX/iOkKQCdg4rOm7m6EBDs28AtDESPZrghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RKLictqT8RQ7ZB7/x7DlpnQjCWm1z44DFO94tl4Jmw=;
 b=l99BZCeBQM8uZ++e3Sj97SSU9CBHQAJiiqicLRQNZMvNI5DKSSIhg0T/EK4msx9JF8jEWWuMfMvWgz6VBNIsWjnqyRymEhh6TwucHWVhW+baJoSjMoBKxVLMXk/ZaeD985/ePm5oSf8YCRw9+4fkKwz+O23nA8ijKfAUyCA5weaPLKa+3UXqSS4ejbXZLysZz4bhly0mpXCR3re1Z+uYIAvT7YbxYMyxAl5BBoMuw3Vj406Iw8jjnFzuCbp206UKEnV9tyvUCLBVGawvgMKjRxQu4wck7cSSduHbWoixV7iot/oQfu4BjMOBQvAEAwJwQjI7rubj7OIcCVvrWlUQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RKLictqT8RQ7ZB7/x7DlpnQjCWm1z44DFO94tl4Jmw=;
 b=VxypDua//fA4XRpPwmyaiXuNjIh0iKY4IBjAavBOdZy3YP+cWMi0qk+WXMU0M2+rfKnzi2MvsJPErjzjGzDn5xFEDYyF/OSSt7svowNU7SS8RGR+VQ7ovZ1TnWcgsjoiwZdqWcBDBKJWaKTSr/8udNvg9D+pVdgq5NyfLp1oVLcJxEiVTgoutTenJ4XhbpJAKne8S/mmB/mlytrjIRdD+0SGHVgKToLf8rYt8zKMdhEncRUU+BaQGFIb9hC0RYmr1XuxyXt1AI0YLaCFTBk3bWhGCbRgZSFgSOBlCn6mJmtw4FoF4P4lAXnQqrGuLgS71PSIaP5+kW7XYyJfUJ23/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ea28c90-68aa-4a14-e352-2bcb6e42a76a@suse.com>
Date: Thu, 31 Aug 2023 15:05:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
 <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
 <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
 <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
 <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: eaddda4f-08c5-4e22-0219-08dbaa22ed36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80XOQeOvg9LRltAxDMMNjBVLw1RGVtl0TPXcoDXAw4TOFPlzedRJHzi0zuYp7RAHp1PjbMJbGTWojJErAZiq3MMchxqLf51JgU2w76nFe6ku7NOTsfxur3lV+wWVdv/wJDQTZpbPcUAxy/tJa0JbtLhj8L9m2tadDe/C7Po80bqfmj09wicSaryfa5FXWyKklEWdb1cQU4oQmEK1e0hYPfSqfWYqTUwBpr25iv2jFzIkWfw6ZCThqXjvbIl8PPMbjOZo1S0ev5dOuxhHspuEknst6x5F94YS63yKIVyQzpSk9np+utB2P6sU40AzXYzWFGoIWNex+ZbihQvTMW8C/+OJ+TrQQz1aaCY2XSPNYaQ1adzeCsq5F6XZQRZ2uZTX/0nn6JEwXp0Rx7nh+nBIVQyqrjM7v/iT6dtukHVMFeZ5ZcEhTM6oOohFvdcp7jxv2GORrcKf41x7ueqEH3rOFNcN5L/5K2VwTS9DhqngN9SVA/3WSvKtfwB5cE+we8LYYAwCJoN/gB41rjO775puANRboXewm/b96a1tgIAClM59AU1Ujj4aHY5na0TrDG8eLO7NdawvLsLBvnhvWNL/abo7QcNh2vydMVGplYtFQmLdJ7o3x9XCizgeNP5hlpVfAbe2CnQ8VVP7Ju5Ek67mMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(39860400002)(376002)(186009)(451199024)(1800799009)(36756003)(31686004)(83380400001)(4326008)(53546011)(41300700001)(86362001)(5660300002)(8936002)(31696002)(8676002)(6512007)(6506007)(26005)(6486002)(6666004)(2616005)(478600001)(38100700002)(4744005)(2906002)(66946007)(66556008)(66476007)(6916009)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZKb29HbTVCMHdzKzlQcjJ3anRIWmVGNVJQWHJJb0ZlSWZDeFlFOVhjbFZX?=
 =?utf-8?B?MHJSeTYyWnk5c08rMDRJTE90NmZ1Z1hWNzRod1dYbE1nYUxTbGNyTjBQZm5w?=
 =?utf-8?B?bGYrY2VDWnVyZ0RFZWVhYXkzbWRGeWZqYXRheGNlT0NFMTMrREZJVVBYRG5B?=
 =?utf-8?B?aE9TSU1iY25qMEdHV2xFRnVidHZIWWZJQnJWRlIzcHBRUjk1U0oySFpOcGdm?=
 =?utf-8?B?Vjk1V0w1L0hDd25TWkc3L2hIYUxDaG1XZXBVNmhxZHhiT0QxVU5NSkNyV0lM?=
 =?utf-8?B?RjJ6UkRDYUYzRE9jZHFMdDJVRzBCWjJOQ0g3T2hkbFpBVWtxRkZDTC9tdnNH?=
 =?utf-8?B?aHd4dEMvTXRMUFdYSXBjV0JvR1NkWDI0b3dKQ25hTTFTaFdMeWVVMUI1ZVRQ?=
 =?utf-8?B?b0FOVEhaR3pxMHcvcHVKK1pxcVdmZHpuTjd3N0l4SEQwKzFlSy9BVnBmR1Rk?=
 =?utf-8?B?SnNpZk05TDdESDZaNXhZSC9oalgvenlXZUViWEFzZUdHQm9wRThjZktsQXIr?=
 =?utf-8?B?Y2JqRFBqdWY1SW5nOTZaTTJaQ1dzTXdXWjFyamtkS2U3NGlIcVdWVHRXYnoz?=
 =?utf-8?B?SDJJR296bXM4anJpYVRLdWpIZWN5QnlPNVF6SjQzNmpxU0JEUHFMR2xHZnJm?=
 =?utf-8?B?K25iRU5VQ3BBd0NBTWhWaUdNNzlKNjVscS84Z2JoVHlYdUFRdm1SUElncG5K?=
 =?utf-8?B?eEpOV05SOFozVWF5RHArS3E2TXNKVnpRTVZpV1J4TStmWG83cUlYWHUyU1lK?=
 =?utf-8?B?NHVlZnZlUEdiK2N6OFZSamk2SFFHZi9tQm1ES2JUMCtUQ3czRjhNa1NJdXIx?=
 =?utf-8?B?MG5LSUdMRjZselhyR1BYY2FJUE9RdjNSRWM0bEJjYUkyQ1FTNGtuYVFpcFJh?=
 =?utf-8?B?UnBCY1htSWR0THo0cTZyZ09Nb2F6azllOEl4UzExdXo4T2I5TGx1L1h5QkFX?=
 =?utf-8?B?ZGVnYmRFZnIrL3RNMVlYZGZ6WGEyT0xoZU9VQXU3VmFNQUM4cGZ2dmJQQzJG?=
 =?utf-8?B?d2NIV25Pdk0vcEZSRlltOGR6Q2xHUWN1WG9rQk9TRHdFSnhNdEtSTXdjMVRR?=
 =?utf-8?B?Qk8wMUFzbEd1em5sNTI4T1pLbnZ0VW54M1JQRGdCWUhvRHpJWGVKUXBuZCts?=
 =?utf-8?B?Nmc0LysydmNTWXE1bDBNTlpRcUt3UDZJcjk1MXVub21ickQxMjZrbnVIRWRM?=
 =?utf-8?B?VjB3ZWQzN1hYSW1KMHIyVmExZXN3YkljbjFDeFBXem1udGVJWEJWdHZ5djg1?=
 =?utf-8?B?Tm5QR1RrRm5XeVFqdHdtTlpvRzZ0NE5aNU9KaW5UV0RhWlJrcFV5K3ZYTG5u?=
 =?utf-8?B?QjZHeWpiRHNGQncyK2pTczduTU12L2Y2VytGUGxtdk8zR3VPZkNUZGJjcmc3?=
 =?utf-8?B?Z0NZWkplcnR6cXRSY3BORDc0MGpXbUpLUnlRRlRaOC9BbHEvUlN0UFMxUEN3?=
 =?utf-8?B?dUxGc1Z5cEhMWUp3ZXdTTEZhVHNLY2MzWThQOHRHR3hsaVJGWktGRHNUM1hO?=
 =?utf-8?B?SVRqdFkwaHgzM1RsSWs5Q2toRTE0RVNDZzdWUnBjb2J0R1Q3STY5WXNmelQy?=
 =?utf-8?B?b2FzdzdsMjduOWgySG1SQmM1Z0VXaGJzcEpFSmg0cDRXUi9XVWtDNFdPcmZ0?=
 =?utf-8?B?c1RtbFpJdHROTzJLQ3pjMVJUZlZKMHdLNExoZUdKME10bERPL2crL2NWcm90?=
 =?utf-8?B?RlBIUEhpQ2JnVDRGR1lLZjNnSlMwRHF1b05vVWNMU1VsZGc4YnBIbUxFNzFO?=
 =?utf-8?B?amxscm43VzYrWnpYYURndC9SNGlDSEZQMnBjakNQNHZ2S0g1SjkwWEZDR1Vp?=
 =?utf-8?B?YUZDMFd4NXNxaldXTm91OVBUYVdKMXV4c3JPbmdQVmZJMS92ejRkL3R5S3RL?=
 =?utf-8?B?K1QxUFh2QmdCUmRUS2VGRUtjZFFzbk1zQTlVa2w3eHhqTk5jVnlpN0ZyZ3JY?=
 =?utf-8?B?TlFmTGlJdHE5dVdHMmdKM3M2NDVncmxiZlNhNVBwYWk4K1BUK1l0OHhaRkpM?=
 =?utf-8?B?YzRmS1ZLOFlhbE9CMTJ3TW9SV3VCcENteWZSTjhOcEwzdWc4UWFtczhCcko4?=
 =?utf-8?B?RzZpOThyR2pmODgvbFFVQi9nNmZ2aDVnbVB6QWU2aER4RHN5ZzNYMlJNR2Jv?=
 =?utf-8?Q?INh8OJppA3Vfwwq94QV7hyKuU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaddda4f-08c5-4e22-0219-08dbaa22ed36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 13:05:18.9946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KSalR5+emZxNugamUB+DR1D4xoBxVu+0VMvaUJ3MB6kb0ET7Geq6IEC+AnQPMCHv+Eb1FYMVKOpTuiy4trjfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951

On 31.08.2023 14:54, Simone Ballarin wrote:
> On 31/08/23 13:10, Jan Beulich wrote:
>> On 31.08.2023 12:08, Simone Ballarin wrote:
>>> The danger of multi-inclusion also exists for .c files, why do you want
>>> to avoid guards for them?
>>
>> Counter question: Why only add guards to some of them? (My personal
>> answer is "Because it's extra clutter.")
> 
> It's not "some of them", it's exactly the ones used in an #include 
> directive, so I'm not getting your objection.

My point is that by adding guards only for files we presently use in some
#include directive, we set us up for introducing new violations as soon
as another .c file becomes the subject of an #include. The more that it
is unusual to add guards in .c files, i.e. it is to be expected that
people wouldn't think about this extra Misra requirement.

Jan


