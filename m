Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D283575ED91
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 10:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568491.887836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqwh-0002Bu-Qh; Mon, 24 Jul 2023 08:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568491.887836; Mon, 24 Jul 2023 08:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqwh-00029k-Mn; Mon, 24 Jul 2023 08:29:35 +0000
Received: by outflank-mailman (input) for mailman id 568491;
 Mon, 24 Jul 2023 08:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNqwg-00029c-Gx
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 08:29:34 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35a8f480-29fc-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 10:29:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 08:29:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:29:27 +0000
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
X-Inumbo-ID: 35a8f480-29fc-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lahD2FPQof/jxrQc5I44eWWYcW4y06gpqTW2zjlu0Xteiv+rQ0VxIXXQ8dFhvF2wuTe2uyXQ30CqLUBjWqoSgLlyTMZkBROCr37/xpwV5u2b86OPaZm0nEUzNVDaTexC+z6NPsd3RXaOPzqgAXMuRi0sjpDgX39sYkjOl1NZ1Wv4lTtI8Kmm/NWjxg7GjEzEMrKJ3NH/Zc71tV0mMYYHgeQRhyNJhWwJA8+KIWBGNALezbiKOFmhQ6Ec2DmZBFVJ9IEq0aIqWfhsWFFk6fXbYCmAk8T8zbIsn70i8I9h9Ay7xUyDY7yLlEdogI0+jk/u2KoTADW1fHBUVxtJwysp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfDke/U+2CTCKL9TRdwGPQCdC4iiO9A5/s2heYKZN04=;
 b=IIbHl+zjHhxClRhnXYCcmgMovcKYfC3yX/6vd7YIMHFyGjUjLoI301a3SmdAJ4sWDrWTyXWPIjxryHmk8CMhdoAvVEmXwT227jBRtGB1Ua67P4Jw+5qiQQ6DwwMIsjDqPpuzWTRHUOMUTOlUrbm/LEcL2Ghw6Z3tAbSm7CUkmDSn+JqQ/8smxR5HFE3kwK7NpxsfLv6OcQgEx2ZSgpU8T9i0Af5Xajy0hv6nIoD1Wmfc0sL9jV4E+aOWv2EnsYei58QKIJprQKa7KzE41KTx9vQWPYZX0j/BhUbXws8HWp8Lze2xU6lvP/R3XkAcU6DzIU8jSFjRV7bow1sJAYJe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfDke/U+2CTCKL9TRdwGPQCdC4iiO9A5/s2heYKZN04=;
 b=OqFws6FzrWcX2y+V37N+N00N0a0nEdra+Oom7vfBghbKvu7X0ZmvTsj5Z4qwEc7DiAtp1f5qUqT/H+0lr2u8jmNgdglCyPuKwJxhqYuAUvY3ti1FSPPCOZ0f3NXqF24+DUPhQBdm+WCjR9xLMS1gJbLZJ59DuTj2nqSrGrcEGj2E2uazI+Pga7b3rSHOds9qVmja8Yy1V+lcyYbhzPy3ukiVxlHvMfW71xxJCmY4c6TVE0OsoSlNi7hAGWuMpUYxCeHq1xWGFM4tyXvG7X5jVlooU/gftgHMKiqL5ZfW2wPLOWrMEV5v0P5aW7D1GmR/SK71jsHtOYo+kS0/6n+FYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37878809-d541-c891-fa73-ecac321af00a@suse.com>
Date: Mon, 24 Jul 2023 10:29:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] docs/misra: add Rule 1.1 and 5.6
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 george.dunlap@citrix.com, bertrand.marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230721221636.3693746-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230721221636.3693746-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0236.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 864d19ac-d92f-4538-ea26-08db8c201831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nTgPXBzE4XDFWzHj7Ol+CwuCz+LPfrqAYMCAppbGblY1kN4Z1mKCogu+r3t/pty52GI/cL1VnvG94C6kQ4PDvRB9IfJf6Ad8lT7UL4mH31YRWzrPvZNofl2gdA+r3iDv02jB5citAtVeoyaaoCWhwu73RYcT6esGiNnaHRll5gq/r4FaGWDRuZ8ueUUNJ+3TVbOkCj2BZRU4OqJOf7vB+JetDp2RYX7LhNTZ5mKdcUpL6+coc9WhWlG/MiCN/1EABZzOVxVMJpoW5OW/u0STjFfJ57eY0nIwqy167LBx10pLCyXv/lolAsbI6LImF0A0bQxGF7tCJnic6YIW+0HXCG+zRFxDKKsGjr/mVUEqkpbJpqZ643Vvyz3Asij3xL3Oh4hx+Rr3DQYkqy8jy/i5IxDlbwRLuOZtSg74G/1FIRfQqJ4u4+pE/Lcn0yF1gyVkUW6R+rsvaXC0Imw1joNOK3Fb/f7sv+DuQeZpSZz7XfkV8bgEXslfpNjBZgKv4e725ZV2vKVFEuUxkNX99JOmmU22oLw7t1WYxXX4oUXfRBjk21+JAX1kc9K5x155znOLcrE/4HQy5CydlvYxGNRQwOWXQw/gNEKYBkHt8SDJwa8O+dUh+Nd7Tj+yxx/FCDKaKm+og6m9O5UlDFSr3YfjHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(31686004)(86362001)(31696002)(38100700002)(316002)(66556008)(66476007)(4326008)(478600001)(41300700001)(66946007)(5660300002)(8676002)(8936002)(6486002)(6512007)(4744005)(2906002)(26005)(186003)(6506007)(36756003)(53546011)(6916009)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFIxSjlXc3ZkcHZKcUc2bVVIaXlyWTZUeEFBbTY2cmRMSkRxMDlob2czV3Js?=
 =?utf-8?B?aVVocXpDZXg2QkIxOGZ5QVdNRGtnNlpBMUtpU3RZOGtVamZJcUx1Vlg4RTFN?=
 =?utf-8?B?TmJ3eVFhSHJqa05yVjR1OEJjY3N0NWt1NGFXTDhkTXE3Y1FFeS9QMHdxV1cr?=
 =?utf-8?B?SGtPbC9OSytYUFUzcERMcGtGUWU3R0FsSVhtdmJhaW93WDNEQldxZjlwTTZ3?=
 =?utf-8?B?dGhxV3kxcG1lNDVPU0NEc0tmWUVOcmdCU3FLQktLOE1Uak9lYWFXb1RpNlV5?=
 =?utf-8?B?eFNGcm1FTVFROHRwMkZIVUJIUVFHS2lFckVEbXZlRXBjOURQNUEyMW1ZaVdX?=
 =?utf-8?B?aUV1MXlYSDR0czhwTHNEZ3NVTnBCNEt3L2VybkZ5eTljbEZaczBoNHE2V3di?=
 =?utf-8?B?Rk9PekRvZ0hKTEpuUWFIVjFvaGlwYW96ZnFvaHhCTCtadEJJWXpvYkVTcUNH?=
 =?utf-8?B?YzVXV2hrQmUvNzlSNFVSWEx4VHErVmhFRWFJTEV6TEFYcjhnczZtRWRKTUJt?=
 =?utf-8?B?YXNMcTl6amJKRVdtbG8yUEZQZ3U3aGJ2Q1Z4RlBtciszSDRqOG1uNGRsZmJv?=
 =?utf-8?B?MXozYmFVVWpVUFZ2bXFoRkVKSGxVMzhaTTU4RkoxYXkyRTk2QkpJUHJDU0pY?=
 =?utf-8?B?Z1NzYmtaNTIwUUtNQzFCTUlVVTNCdW13bzlLUmFxZFZ6ajhVTTY4REs3NGN1?=
 =?utf-8?B?UnR2ZkVWK241ZjEvZGh0UXY2N3p5c2JpR1AyTndXMlc2Vlg0ZHhLYUt5RFdC?=
 =?utf-8?B?Y2E5cFRQUlhMTDBRWUQ3V0VlRGRSU1pDU3lwZmVvcndhODJ6by9EVGR2U1Z4?=
 =?utf-8?B?OFUvSEJCUEt2M0FKdm4rWCt1TVRiVTIwNDVvWk9RNE5WR2hqRm0ybHo4R0lm?=
 =?utf-8?B?NXlxNEhWekF0NmU1UmNQclRWdDlGdTEvWlRST1QxbEdlQy9kWVlIVVIwODZh?=
 =?utf-8?B?M0JuZnhkSFhkUVFDTnY4L1RBbEtrVjJTbEYwdTBmU3RTTDJGeGQ0anMzdHE0?=
 =?utf-8?B?Y2l1ZE15VUtUZ3RRVlcyb1RIai9ERVhYdzFwNkNza3NBVzMwaUxZbFZSTTZi?=
 =?utf-8?B?ZnRPZmE2V0dqN3VVM2U2cEM1V0NTcWdyUGVkSzQ2TXBUM3JrdnFWQy9ibCtZ?=
 =?utf-8?B?R1B2R3dCVXJvUDhpTUNYdWExL3YxaXIwSTRadjRkL2dUVnRWeFk5T2t2ekd0?=
 =?utf-8?B?dDh6STlJaHU1SlRzNDJxbDJ3LzV2NlBpR0tyaFlybGxETEozd05tSFczeEFp?=
 =?utf-8?B?L2lHUGVjcStDVFVXbXpFWGl6eE9YMUU4eEJXNVZLMG5ZOFJpcmVldXRUTkc5?=
 =?utf-8?B?U1ZDVVBhckhqalFrbVdYUnZYUnoxU0hVRlcyNk9keXhGRUxrbHg2VldqNGEy?=
 =?utf-8?B?bmRrejhJMExsNFJIRmRtSkJWbGF1RWVJMExqcUx4Q3hFZkc1RURFTmV1V2tU?=
 =?utf-8?B?dHdZQjFTVWw5ekR4NDRzcVRuV2RyTnZIVXdhOFdhMUJpd2NKT1U2QjhZa0pj?=
 =?utf-8?B?bU41WWF5MnQvQjE4TUg0ZE9uYm8yM3BUNXhCYTNzdUNNRERYdGZCN1pPTDg5?=
 =?utf-8?B?SXRCRTA2c2Q1aDRHYTFDZlk4ekZ2NW1nSkhMKzVXcUlKVHJPaFVZTEVTYlEr?=
 =?utf-8?B?RGF6L1B1VzFZNzkxSEJZUzVoWldCQTFFc2VDNHRkMEVxOG8vemRxb2VmaDQv?=
 =?utf-8?B?ckVZelVFLy8xTUJNV21hZjNCOHA0R0RyYjNxMjRwelR3dVFCU0pIYVVzOWlV?=
 =?utf-8?B?V1JmK3ZndUo5Vjhib3dGcDJ0eDVhVFFRZ0RpRFliV0U3RjhFUFJZNzFFeFVR?=
 =?utf-8?B?dlF0eHBDWXlJOFhDNUozeVZVbU9rWFhPNjd5Nnd2TzRFWHZPcHVDUVRGWDUw?=
 =?utf-8?B?R3JKY1lCSTV5UURxeXM1TWY3c1VHZVhUOHJzSmNtd3UycVhsVWVDQ2Q4d0g4?=
 =?utf-8?B?MVZyZWZzZlhMSEcyclJpeVU2QjlZcmJRbkJLT213K1J3eG9wSHd5ZVV2cVhT?=
 =?utf-8?B?dnU1bDMwVjhBdnh3clhVeFNMakltTHIzZ25sNVdpOU9pUEN1VnZzTU9ickdh?=
 =?utf-8?B?K0Mrb0JTVy9taDNURFJFaEVtaTEzblJ5YXM5SmFxSGpaUWVoMXV1Y3ZTVkEz?=
 =?utf-8?Q?QH6+BG955MZrjPQjGZuohoiht?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 864d19ac-d92f-4538-ea26-08db8c201831
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:29:27.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 807a5TkBlMQVuoa2U2rjW+qc4NwkjVlUO5NJQlSis15ip2w0QPQHjf4XIAJ6HISaK/SDSwqBEBlZX1jovgMr1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

On 22.07.2023 00:16, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Rule 1.1 is uncontroversial and we are already following it.
> 
> Rule 5.6 has been deemed a good rule to have by the MISRA C group.
> However, we do have a significant amount of violations that will take
> time to resolve and might require partial deviations in the form of
> in-code comments or MISRA C scanners special configurations (ECLAIR).
> For new code, we want this rule to generally apply hence the addition to
> docs/misra/rules.rst.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



