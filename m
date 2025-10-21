Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F642BF57BE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146907.1479249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8bC-0006ik-2F; Tue, 21 Oct 2025 09:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146907.1479249; Tue, 21 Oct 2025 09:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8bB-0006hK-VT; Tue, 21 Oct 2025 09:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1146907;
 Tue, 21 Oct 2025 09:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pTU=46=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vB8bA-0006hE-PC
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:24:08 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1669aa4-ae5f-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 11:24:07 +0200 (CEST)
Received: from PH7PR03MB7004.namprd03.prod.outlook.com (2603:10b6:510:12f::22)
 by DS4PR03MB8132.namprd03.prod.outlook.com (2603:10b6:8:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 09:24:05 +0000
Received: from PH7PR03MB7004.namprd03.prod.outlook.com
 ([fe80::58d9:f998:8591:d601]) by PH7PR03MB7004.namprd03.prod.outlook.com
 ([fe80::58d9:f998:8591:d601%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 09:24:04 +0000
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
X-Inumbo-ID: b1669aa4-ae5f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1snkiTOHIwYJcDODykzlnrLM3q1ar4PtWiP3g8GBT5vA3C23ovvLch2tdvzI5PCZ9pQSvvdi8hEBNdEKHQALHaqUCo84FSmUC3xfXaTFnYWjryd5v/Su0k9f+W1GU4ecPPAiZiTBXx0WsNJvfy1NZ7pno0f3eseV7BCA47P+1bA/8LnJ69y/8JQNXBtjVK21GIzQ0l+kaxAU18xvA/33t99yuzmJpvBkw741w1vayE1BWpTLDQpe8r+2TlVlOcHBoQs7xA2a37XzmlILqImKGpU+RaDuSvNJAiYZ5YDcK3lX1Cxn8QpzCNzRlYCzvT4PYMFNossasahnHtIv7KQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK1ZSAwzYA80W1a/Y6p3pFYyUkbrpRl/Nu6AThUk9XI=;
 b=QuuL5jsanz/8iAlKF17HaGXuhcq5bZMmuDrG81/WKAuWp6umrd7MY9uaZILu5sSXWYhyLIk83Bc5ZCKPGBHy4r5nSM2cMK1/AE+ydDaeHrSwdjvyakfUz+4WQrkfV5hKmozqlOVGS/Eg7YrluQrGQF0/TEvhF8tdb1+SeewbW5fXCxYmtCE1S6ZSPQ6kOPQcoeuF/SKKnlqfvG0rHOFyPbuwyvAwd9/gbw6t506239Em4Cdt0gGVFJ8DBPTSFP094Srkxejiu/ahY16sQwgOzTrC4tJ8t7Qu/qJSTfsNP6vMkFmtn4GrjCW2MGKXXtl//AhHo5BRv5A6AHkKbynneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK1ZSAwzYA80W1a/Y6p3pFYyUkbrpRl/Nu6AThUk9XI=;
 b=KYM7wQOqd6m67g0MuS1bAdxt5prXFoWuMM4H+zNeYk1tyjYoe4JqWO3gFGyROySpezdXg58sZC9KFW4Wtb8mtu1FcykyYXaDUTtVcPpgY0AryRPtNDuKc9IQsE5/dKrc+Yv/TqMsmwcsIz8G8DOIbWAqaFLnwTkMNc9WgY7nY5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <734f191c-a172-4e29-8e97-2dc67c0b4015@citrix.com>
Date: Tue, 21 Oct 2025 10:24:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/ucode: Cross check the minimum revision
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-5-andrew.cooper3@citrix.com>
 <fa9e5a03-0b25-42a5-a51e-6e1c4af7d4a4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <fa9e5a03-0b25-42a5-a51e-6e1c4af7d4a4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0216.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::8) To PH7PR03MB7004.namprd03.prod.outlook.com
 (2603:10b6:510:12f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR03MB7004:EE_|DS4PR03MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e904dc-dbb4-4274-9e46-08de1083940a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkRyRm5FYTJIVE96ZjZmVERvcllENVloVStCcUtyeFF0ME1TOG1TQUY4Wmdu?=
 =?utf-8?B?RmVLUkpRa0JXd0JRdy9mUEltUVNJWlgvN0E1aUkxdVVJMGJJUnFpeEVaN2tj?=
 =?utf-8?B?YUFQamlhNkdDcUNTYTJYc0pmTXpSa05RbGFEa2Y2Ym1RbkpQTngyeFRMQWtv?=
 =?utf-8?B?WSt6SEpHN25NSzk5eWZKbG5NWHViY3JlVEdYWFFJRGlmWjBMcEZHQ1FkeW8w?=
 =?utf-8?B?Rjc1ZHNXQWFPdXRHbVZFVFhxYy95dTROemg2M2lYckZnem9ocHhiMm0ydmNh?=
 =?utf-8?B?UGEzTTBwbmU4RWQ5T1AwZ2gyVDh2U1V0STlGK3lnUmVSQWFQdkJQQ3RrbEhT?=
 =?utf-8?B?NEovalFvcEozZmlzM3hhTzlPekw1b1Ewcy9pb0s5ZlVweUpzNG9yMWRhOW04?=
 =?utf-8?B?SHF2dDhnVGc3bGhid0FnaVV6TmQwTmtaaDd0ankxYTNCNXJRSW9kbDQrdkk4?=
 =?utf-8?B?ZkZDRG82cTV4UmFqbS9rOGVBRGVUelBSTWRmQ29sSzNuNmt6Tkt1ZXFyb0lT?=
 =?utf-8?B?aEp4dnNYcmNNVS84bXU5NHRSc1kyaktIRjRCMlJiQi9RazJvM3FYUGh4TFBZ?=
 =?utf-8?B?RklPVGtwNXJTZ3hPcElqQzlEN09BQVNDRnJKM2xsWWRCT0svREFtVWhUYkhX?=
 =?utf-8?B?SE1ZUEhaRjhIMXl0azd2VEI1Nys3czJ2RzVyanAzWlBmcDRtOTZyNmlTSHhz?=
 =?utf-8?B?ZG9ORnVSR3NWTko4am5jWU1EMUU0WFUxbUlQa2taaU8vV1lDN2pDSERVcURD?=
 =?utf-8?B?U2YrTVgwd0kyeGFrTU9yMmVyaHdOdlJPOFhVRnFPWTRaQ3REbml3WTZDSEtn?=
 =?utf-8?B?WGRBZ3RMeXFJOWx5eGVkRGZKZUluVXUrTUlzYUJrMnZxYW5uRy96SC9TWklj?=
 =?utf-8?B?NlE1QjZwUjNWTzV0bGtUcGVCOXpUYkZoRHpGT25RK2E3S0ttckc1WkpZbXNn?=
 =?utf-8?B?dzV1dHhVTWpRNzR0TTRmMWs2Ri9PNGdzRC9zTzlqTHZOdkJoU3hTS3NxcWpt?=
 =?utf-8?B?R0thek94azRzZTQ4WlAvZU90bHZQMEh0Z0lIeUZ0YTJBQkl5MGZNYm1UdzFz?=
 =?utf-8?B?cEdPUWtRSGhqN3creHQ2cEdyUEtnZFhncFVPTGppaCttZ0FRdFR1VG9QQ1l5?=
 =?utf-8?B?T0lsSjU5TGl1djFlNGh0ZHpBaG8wTlRZRlY0Z29EaWp5QldBelhWbkxHNW1P?=
 =?utf-8?B?MHQ1VjBjQndjSldOeWFTQ3FYVndoYzJ0R0haY0Z5cjRGajZGTnRheDllZkZk?=
 =?utf-8?B?Rk5leVpjcnF1dnVmOXozUkZtcnlCaTd5c2Rrb1g5aHRIaVBTQk55VFVGU3F6?=
 =?utf-8?B?aFpiNlFZMmJuZHh4VlhoRHJxSWd0TTY3Tm9GOGd1eVpBeVprZmhuaWpvV1Ay?=
 =?utf-8?B?T2ZVNzNsVmZ0M3hXeEdJTU1tamp2ZkZYS00wTHVtVEVjTDEzYnhQeWNsbUV1?=
 =?utf-8?B?Tm0rT1ZibjU5WG5oRWJkOGpaV2tNL2FwRDhJd05PMEVvWFUySVJZOFBKamZj?=
 =?utf-8?B?VU5RdjA2dUJBN29nZG91UlM0YTY4b0VxaUt1cGVJUFRma2szQzNObnpQUDVm?=
 =?utf-8?B?VGdDOFpnaHoxU09QZEZMcVhvSEFsbjZhcW43WE1VWnVBcXEwQWx5TzlONWdo?=
 =?utf-8?B?NFdHVnJnbExBUWdSbVh4UU53MEo0ZEp4Rlk5VW9rVjVRaTBaYjJ3TlVselRI?=
 =?utf-8?B?MHNTVVdXQjljOGViVy9Xa3JtbDlSUnkwcFRlem94dmtkZTRJR3BoMmd1OUx4?=
 =?utf-8?B?UVRQZlVPWkM4ZjcxQXBVQVZVNExQUW5oM0xZY3ZLWE1wdmRld3M1TWhXMGJa?=
 =?utf-8?B?OUovMWRsQ1EyZ3NnLy9HR0lZSVRZVDBZb1grN1dMak0zZzNvaVJxdDlkclBI?=
 =?utf-8?B?OFNSMjUwT2lmL1hzRzM1RzV0T1B1cEhKWmJ0Q1hpUElmRGJaMSttUzZqK0Z3?=
 =?utf-8?B?cXdYWVJYNkFPdmlvNE1uY25va051cUJtT2tlQS9ORGxJSHg0QVdkUVBXakQz?=
 =?utf-8?B?enJlOGZJaTN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR03MB7004.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDFKZEJsRGU1YlV3TnozcnlONFlVWXVkNnN4bHl5T3Z3YkhUSVd5aHhsOUps?=
 =?utf-8?B?R2N6VHJ2UHZzRkhESWJWOUJERGo0U2k5c2p6OEZNYko0bkZpVURXT3BCS2p0?=
 =?utf-8?B?Q2NVenpDQ0ZjdFVwT0NORE5vSmczT0RNVHFWUE4xbVlRd2pHZCtyMFc0WjhD?=
 =?utf-8?B?L2UvM0x1VitGWE5IWmFaUjFRb2V2Y1FJcTJWamI1dlJ3Y2JEOE5CRXdwOHhp?=
 =?utf-8?B?Tnc2cG9abFVkSFdhRzRlNnZPV0YyekwrWnpyUnRESzZmUHkxczk5Zzd1RzQ5?=
 =?utf-8?B?UXlRc05wQ0VJMXZpVWgrYjlEaUkrTHhQcUY5VUFaRVp3eHFsUGxxYWZGWFJ6?=
 =?utf-8?B?WDJpT1NEL1BIRVltT2tPb2dUWGk5ZmhjOCt5cUxNSVJlK0x0R3A3aWFxc0lm?=
 =?utf-8?B?YmErQnRqUFR6NFdEVlYxTmU4bWtDTXRmRllrMGlKMHlpdmhwMmNZVkpqcExF?=
 =?utf-8?B?eXlEMXNMYko0ZFNRRGFVbXl0c1o3bWo2MFlWR3IrdjBoK00yQlQyb3JueS9a?=
 =?utf-8?B?MHpuNTNQVHc0WWhZSWM2REdPdUw1dXdQNWZCcDdna0YxSW0xQTJXbmxpYVhx?=
 =?utf-8?B?eWU1Q0ErRnhUNFpPODVzZ3ZiQ2hsOHZ4UjVSYkJKbFR0bzVPRFE1TWNhV3lQ?=
 =?utf-8?B?d2RMbDg0YUlnUDlvMU41UXpVK3RicTh3K2N2YkNzM2o4YTRRTFVjdjRzVGF3?=
 =?utf-8?B?OFl4Tk8zS2dPMjFzWGNsUGdZOUJoV1NGVDJRdC9wNWVka1FxT0x1UlJKMG1p?=
 =?utf-8?B?L2NDUVZoZmFHR0tKUTgwRk1ISVB1SllpYTIwT0xPM29xQzhQZHFEbC9wWkVX?=
 =?utf-8?B?TUlvUThYanBXSmRKK0x2NXJCeDVpYXQyWjRuU1hDaEhzYVlCVU9LbThSQTRZ?=
 =?utf-8?B?TU5INHZTdk9TUEQ1T2ZGTTdOVENuM0dNUEg5bnl5SmlnQ0diZ1FISlp2VFlE?=
 =?utf-8?B?eWNQOVpMRFhpNERZRWcreU00SlNmOTVKN0JaaW5yNEdVV1VGOUUwUytjUkNO?=
 =?utf-8?B?blpBVkJMM2h2NFFvV0dXU0x4bTB6RCtSTjRCZG1DSEppUlRGT2g0dE9NUUY4?=
 =?utf-8?B?NXVieGJaYXVNZjRMR3Uzc3dUSDhmRzkxSTFid21UNFUrcW0zQmFEWDVUazBz?=
 =?utf-8?B?TExRazZVbThzbUp0UTBYclUra3RvZ1dBdDZhUjBMYVFqeUtDeE5sUzFsekxo?=
 =?utf-8?B?WWloREsrbldhVUlRYUZsRWQ3WmlSN0VlN0VsaDBRcGN0WHRYWTYxVTZvNTB2?=
 =?utf-8?B?UG1KQkt2a2JJamU5WFJVR0l5alBUVlNWbE12eW1tbDBlNEFtaEY5MExGZGg2?=
 =?utf-8?B?RXJEOE1uZ3BlNWtTTUQ3b1h2VGc4bWlnd3hWRVlVdlV6UHRQSzNRQm52TmpC?=
 =?utf-8?B?OXp3RGxZajZyamNTM2NiMld4ZE5RWUFQckw5TFNXc3ZyUjBCWWZtdkhYNUpN?=
 =?utf-8?B?eHZtZUJ0TU5HTWFraDQwUDh5bzMyUVBld1dNc3AydFFaRkdZYk5JSFNGN2Fq?=
 =?utf-8?B?ZmVraTBqNW1FM1dQeVNoeUk5bVNXRDFTejdhaVZlT1ZIMlgrRjdOSkJnOUQy?=
 =?utf-8?B?WFp5eDFNOWFaaXo5YU5VTDJkbXBVWExJUHhkbWpFa29yZEFxZkNFVUFSaHJM?=
 =?utf-8?B?ZEdweWtOOHBaWUdsczFMdTJXUXFyMExmS29EcGpFU3h2YTF5WWVsRWNxdWcy?=
 =?utf-8?B?Smp2STljTmF4U0VWbjBrVFJpTEVzZ0gxRjk5WjdyelV6VTAxYUNETWZWTEF1?=
 =?utf-8?B?YmdwRWU4TDR6SFMzaEZnTkU3UDNHMm9oaWIvcVZrTlJPeG03RGlPYlFCRW1i?=
 =?utf-8?B?eVdhRW50OG5GdFU4TWhUSUIwRTBqMWVyaXN3Y3V6MjB0dlFNL3crSElzajY5?=
 =?utf-8?B?R2E2Vzc5Q2VqZWhsMFI3NFU4a1FqT2lpcXBqTmNZM1JKdTRrNkdIMkpIbkR6?=
 =?utf-8?B?SDlLeEZFRWNpWk0rcDkxVmNWZlNOQ2FIMUIzOEZZaGxMSmhtL1NHU0h3b0Jj?=
 =?utf-8?B?L1FrZFhibUVqR3J3cmpuTG5Tc0IzWEpIcWxMWmQxb1MxUmszSkY1SU1WdmVD?=
 =?utf-8?B?VCt4cGRrcmI1ckZQL2ZiNmVVVEtDa2xmNUZQb2JDVjJKemhlT3J4U2c3d0kw?=
 =?utf-8?B?eXZiWWJlWDIwbWErdDdOcTMxRlZmQjVLMHloVjdETTZFVjZSVVJCMFQ3Nzg4?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e904dc-dbb4-4274-9e46-08de1083940a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR03MB7004.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 09:24:04.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0eYfBKPACsCNTiIIfew5lHc8TSIZScrDs/b3RKSOsANkTn0PZn2/z4oyqDNj2A+2xc9y4geavN/0ykZ7wJ3GqcdphiYXPU+VkX8XY1qwVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR03MB8132

On 21/10/2025 10:18 am, Jan Beulich wrote:
> On 20.10.2025 15:19, Andrew Cooper wrote:
>> For Zen3-5 microcode blobs signed with the updated signature scheme, the
>> checksum field has been reused to be a min_revision field, referring to the
>> microcode revision which fixed Entrysign (SB-7033, CVE-2024-36347).
>>
>> Cross-check this when trying to load microcode, but allow --force to override
>> it.  If the signature scheme is genuinely different, a #GP will occur.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> Might be upgradable to R-b if only I knew where - if anywhere - this is
> documented. I can't spot anything in PM vol 2 in particular.

Like everything else about the ucode format, It's not documented at all.

In fact, this was discovered by people on the WinRaid forums, because
even
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/amd-ucode?id=3768c184de68a85b9df6697e7f93a2f61de90a99
doesn't say that the internal headers have been adjusted.

I've confirmed with AMD that it's intentional and expected to continue
like this for the lifetime of the Zen3-5 blobs.

~Andrew

