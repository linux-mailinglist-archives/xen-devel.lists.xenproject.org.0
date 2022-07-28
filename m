Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D4E5838A7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 08:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376609.609489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwrE-0006In-3D; Thu, 28 Jul 2022 06:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376609.609489; Thu, 28 Jul 2022 06:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGwrD-0006Fn-Vz; Thu, 28 Jul 2022 06:18:51 +0000
Received: by outflank-mailman (input) for mailman id 376609;
 Thu, 28 Jul 2022 06:18:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGwrD-0006FO-3V
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 06:18:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 252858da-0e3d-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 08:18:50 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM6PR04MB4901.eurprd04.prod.outlook.com (2603:10a6:20b:1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 28 Jul
 2022 06:18:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 06:18:48 +0000
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
X-Inumbo-ID: 252858da-0e3d-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/UGEfhOIAmqeKv8/xgq6g2rquqVr6vGvR1scdJBFDipYl87iGn55cyHDC6KuUSeG93WI/i6OykILMB1kE7igWgoimsO2GE3IxEriVhzTgvcclk/uATWDdDgGvXDuyDUEUsea1AcTYwAk+8g60EeVEB+qraYIIDK73+cq5cF1gN46Neo3nfS1oLzkH05CWfYwTT3jnc/GjsjRV3FPqtTYyFN25t9YomepUnYsZtiYaQAfSjZ13tuhnIR4/GNJDhnKz+2BhbrU6rXOtXxadYml2UR3kKlh75fZIIxz2jGGYRiNMcGpAKEmYabKIm7B3+Ky/c9IOwQhSrUDZm+YoCZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctjXa7nPPm7otd0pZFWiekKrS2ikQDzfOS4K/XiAfPA=;
 b=UT1Gvse1jyX6h9y89S0JkvaL0mRuSJJ4+zF5xOIf3qGU3FfvK4kDlkEYJEuXSa9VK0pJyl+P6wGqAMNaBDAPxM0B/iAYPhm5/BaQv2EkATSf3CxTgt/umndO0WyWxdHHfzVN7BS/mc1bN/7ZvxqxROzo5KQnXH7Vrdxe8/tSydAtvlqPwgO1n1aUhM6eJgedeMc/LN93RxAklZjJB+KW3bZw72G3FnKTtbjORrsJBJGaniwy5Fcx8AvBPxvLYXl1/ahO4PUvKc705fp5soc+LYJFl8jToTJNggMJ1KkaRDUU76Bzz5TI1kPWEHVmUl4+ku3yEPtPVa6NVqNM07voZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctjXa7nPPm7otd0pZFWiekKrS2ikQDzfOS4K/XiAfPA=;
 b=NFjwiVFy0X9v0T/2e/L/0XG7lsalwGPZYaQn8/f32TaAU3/YSNvAfKLlQ/LKIlIBhFvhBQ3cUiS/GDmPp7CiY+kW58e7PPumjADaRfL2NqDNMhNRvoaMvW/JREg3+ddJBlU9cWxGfRrqpBGV1AJ7Zn7U3ccp6zekcoluWrwjYItfoCXbgPbVMcI2umy5P2Ya20IyGoHcDVZdoW7gvh6Of4Pn1OcLOFzfC/A9LMD78z3KWeuqQfM/h7SmxVxjEKnIHdDC/4VMe4qMAU9llCaQurBlRK5jLvsXgNxIy8D8prq2eroPddrQCldnYG1Xmaw0IeuBgkKvUDojT/4UGyyIyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3dfcc54-bc36-be12-887d-a956590ec726@suse.com>
Date: Thu, 28 Jul 2022 08:16:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/8] x86/mm: adjust type check around _get_page_type()'s
 TLB flush
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
 <40042c40-a2ba-e491-d16a-4bacbfc6154e@suse.com>
 <764ae641-d445-f4ba-662a-c965ebcc582e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <764ae641-d445-f4ba-662a-c965ebcc582e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0408.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::31) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c65ffd4-e433-40e1-55a5-08da70610858
X-MS-TrafficTypeDiagnostic: AM6PR04MB4901:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2tF1CWWXlDhakWAEkrjZyWYuYnmPYfE10jw+ciIq4h0l+/5HM+lJTCQ4faoRxy4tHQ8aNuGAZNEfrHmxEvBaJxHgbMKfd7mirZk/GwMFBnpcqpI3tSEC8D4uO5cL+v6/QgYlZqaiOg1LolcWDWtztuBDcpyLvh55x4/dB3r+x8Qf+7aTx6LyIJk3m+XEW10bgrfMvU/KjARTDcivZSxkJJzjD4+BxjUAqFuAv5e5scyJZ2G7/8YF9+9rFuo8Vs0JU3E9KzkskseweApgIOhf2Q1a6ye4qQDjY0lonJ0tHKd4zkOI7ggpe8LXn3lALHcdB2RKaFQAX0pRPnHZexG0T8JLJOJTaa8SddKc0jjVK+yR5PSHHMofbwylfJgiCP+LBsTXcUNh5hsXQtO8VzCXa5ndyxsUaGNdfya2Q1yx5P3xhOX27I47ojnlAnMfEccCj6h2Ulf+ypYxyap0lUjvjRA/3Nd898vr/YOOoiy+UG9nnFxlIthXBRiaaR76XtA5NgvXYGLXehNuvmeFB4SWlH3VR3w+izF9P161Aj3nWwZY4D0SFRkkxQ3L0+o5nMlZRZ6rkIaV2EsIlDw0OvAQ4j/W7npkKnDzYx546nFSQnFVrFq/Y+e9hAQ9q8JJ+rY3PtSm+FpD8C6gM6wvNf5LH/54rvDP7vTmn3wktqacIEdmV8bUB2YjpTLIDrZVrTCjbKglsPXMj9YogGqND8Xk3rqYFRZoIcsMtx9dBiVFGt6B4rlA/P1rvQQ1gfcj/kAcpI2L6D/fBjSp+SxpI3xGM06FDoJCrzKjreAZGAIEWH6wBhiAxw0gFLuYu+Cs5K8ujXm+dpKwop4tr2HP6XKUdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(376002)(366004)(136003)(186003)(2616005)(38100700002)(36756003)(316002)(54906003)(31686004)(6916009)(4326008)(66946007)(8676002)(66476007)(66556008)(26005)(53546011)(86362001)(6512007)(8936002)(31696002)(6506007)(478600001)(6486002)(5660300002)(4744005)(6666004)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNjNG8ycHpBVGZIbGs2T01iUnRLNG1rRTlSQk1GL3lYbWlMVjV6clNlblR5?=
 =?utf-8?B?Uk9RQjJUU2R0d2wxY3VIN21NenVoOGpWT3ZrKytrQ3hEWVgxckszc3RHemRD?=
 =?utf-8?B?cTRNVWZuZnlPSXE4dG1YelpZZ3hnQ2ZKMFFXU2h1WjNlRFo2WVFCNFJaMXFH?=
 =?utf-8?B?UWNzYXpaNmc2L3dpWnV2a1NiZC9YcTJnMUl5Z09oWUZvNjZUVm5Pd3Znc1dL?=
 =?utf-8?B?UitNN3dSd3lUY0M1M1dvZFdnZmF1cDZFeDFXbmd3UEVEVlAvdFVoMVZGbUEw?=
 =?utf-8?B?RkJFR0hsM05ZRHd2NzRrKzBsZ3lOeFg2d3RQTlZpdmVub1JoeWE2YTNaWEJx?=
 =?utf-8?B?My9UcmNsb0xiUzNlVVczMDJiT3hKRkNDY2tjWHlBOGpMa1lnRitKaEhxVGN4?=
 =?utf-8?B?dTJIMnVJMkFMOVoyeEZLdUZ5c3JSWTZkRkhxakJnVVRycDZuVU1YOTA3dFR4?=
 =?utf-8?B?ZG1GOVRHVWRmcjdaMno4K01yN0xVdDdQK1Fxd1ZzbHFma1FiVmZETm5uOGk2?=
 =?utf-8?B?QXRSWGtaczYwTm1yYUU4UENhUDBqMFdWT0ZYWWxMams3RjRlTWRkOUg5cysr?=
 =?utf-8?B?NVUySTE5bjg0Uk92djVwRE5zakJZd1BXZ2xsK2FXN0IxbGVVMnlxU21nbFZy?=
 =?utf-8?B?b2t5ZVFLRFNodkVSYlhGc3hpSHpzOW1RQ0xXUlBrU0NMRVErQTlrUTRWSGU2?=
 =?utf-8?B?emY3UlNRS1JnTGFQZzN3cXJPelBmNFJYWkNQWnBGbjFUeFBDSzltOHFsaGdJ?=
 =?utf-8?B?WGxtNGpCQll1UEwvTTVjWnVBelhwN0RybWJDYTNBNkMzOEt5SUthUDlsRUtU?=
 =?utf-8?B?cm1iamdyRkdiT1ZyVlc1UHk2V2NIQzQvTFVuK2w5SWpRcjhQcmE4ZFFHS0lM?=
 =?utf-8?B?SEtUYnFnL2R5NndVakpFY1dWOEFMcndNZkR1THVadHVFODI1dkNuaVBoaEgv?=
 =?utf-8?B?UWdBdndZSm5kbFU4djRQa1RkV0hHaGQ2eWYyVWI1TmVsWEZrdmpsTlpQR20r?=
 =?utf-8?B?MHVPUnY2am1oVE5mb3pibXhtTGpXc0c4Rk9NMkFsdys2UkZhOFJrMVd6NWtS?=
 =?utf-8?B?TFl0bjVwN0ZtcTdscVhwd1Q0eEtXOTYwVjB6TXkwY0RqZXhmeHNnREl4NDZM?=
 =?utf-8?B?RUpKNmdYZUJuS2YxZ04vZzZyVlNuV01vN3ZSU0xqVWdlMzJBbkkzc1pKb0tK?=
 =?utf-8?B?ZlJTVjZqdjlBVTcwK3pKbEVLak5xZzQ4c1pUcWs0RG9NRHNoZldxbWFOVTI1?=
 =?utf-8?B?OGVIV3FacDJEL0RBTzFZTDBFWVU0YUhpTUlkdHpIY2xGKzFPYTZTbzI1MDE2?=
 =?utf-8?B?NEpOWVc4RUk0dHIxNmtSWkpjYkhPcmNVajIvc0RsTjNTYlQraHNURGhZcTg3?=
 =?utf-8?B?NDRTRGcycktVMldhQmZydno1aHl1K3VPdFdNSjU1VUJRQTYzc1UweHorbHZJ?=
 =?utf-8?B?Q3loWUMzY1JTTGtGQ0grNG9OU3FYU3A5SnJuZzk2R2grQk0yTDE4b1F3a2Fz?=
 =?utf-8?B?azQ4TzNKRnpoR2tULzh1ZHV6SU84aUd2VW9KVGJtWTV3T0Z2aTdIZzg0VmxJ?=
 =?utf-8?B?K05BMDRwc0lQU2gwRHgzOHRPWTdlelovczMwZURBVHFhbjhKWE5YVnlGTTB2?=
 =?utf-8?B?Kzc1YlhSUVZVUGNqTnJtVGZld25yWmNpMTZOVlJ2Tm9xNzMxTDJacTZmRVpz?=
 =?utf-8?B?ZmJMdmY1alVDVm1DWGZNdS95UWRwVk00eFY2VXNBT091NWcwWTZCSFREU0d6?=
 =?utf-8?B?VXM0eFBhVkVYYVNsQmlpRWlzc0xvY2tocEd0c1R1Umd4YTMrLythS0grWCtZ?=
 =?utf-8?B?c0Q3V2FoM3F6WnBFVjl0bXJwVWlELy94SDNxbkRxVi9ycm5pNW8xS3Nwb3lj?=
 =?utf-8?B?bEhzUCtvWmc4aGlwZlVBYkV0M0Iza2VCUzFvMVQ2dGt5VGVsekFpaVBVZDRh?=
 =?utf-8?B?anFkRDFkWXhZNUhpeE1QNFFlUHFHaEx1dHBlWEhud2gzZzZkbzMzRE5CNnRT?=
 =?utf-8?B?bjBlZjNIOEJpQ1FRellkMlhWNGtxZjlmNzBVTXA3dG8yMEdtUHArYUc2N3M0?=
 =?utf-8?B?Z2ZtNi96ODBmNzdkWGEvbmxkc3FidVJhdXphRTRVY0VyY2RHalJKUnVsTEFo?=
 =?utf-8?Q?QcXoxthzbJ7w63p/+6SitB11y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c65ffd4-e433-40e1-55a5-08da70610858
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 06:18:48.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kyz/cDl/D+m2Vmdh+PIyI3FBma7zGBQUFdaZXPr3sUPx0NF7o9VxYDvuusIHUbQTmZH5Ev1DrPNHBivpGEsrlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4901

On 27.07.2022 20:25, Andrew Cooper wrote:
> On 26/07/2022 17:06, Jan Beulich wrote:
>> While "type" can include PGT_pae_xen_l2, "x" can't, as the bit is
>> cleared upon de-validation (see also the respective assertion earlier in
>> the function).
> 
> While this statement is true, it doesn't really explain why this is
> relevant (or not) to TLB flushing.
> 
> As far as the change goes, it's safe on 64bit builds of Xen (I think),
> but would not be on 32bit builds when this logic was first written.

How that? The flush is needed if the type changes. If (for the purposes
here) PGT_pae_xen_l2 was considered part of the type, then the bit being
lost upon de-validation would mean we're flushing too little.

Jan

