Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C547C734D56
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:16:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550854.860042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBA3L-0007lZ-SI; Mon, 19 Jun 2023 08:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550854.860042; Mon, 19 Jun 2023 08:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBA3L-0007j1-PB; Mon, 19 Jun 2023 08:15:59 +0000
Received: by outflank-mailman (input) for mailman id 550854;
 Mon, 19 Jun 2023 08:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBA3J-0007is-Fk
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:15:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe12::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 832f1a2e-0e79-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 10:15:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6830.eurprd04.prod.outlook.com (2603:10a6:803:132::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 08:15:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 08:15:49 +0000
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
X-Inumbo-ID: 832f1a2e-0e79-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewhxT6Gs9IvAW0rybB57f+D8NUJKXp8Tn9QiCAhzyeNRifcyuZVKGePPcJsRSp5dm6wFTTVVhjxZNFmRGMN7kbUfmXZdJZG0NB8ANoJqtP2bWLRAWZq6Tkamggo2GI9aBXVl9zmNHBOje6apDvYnhrs8fhJj1OlkuWaibUkKSUMswD2ld4u1OcwDbImUl/eeBVejQ2JJJH3bRrDdYzxx5fTiiLXdwql9KpHzMvg3hvQtljkBWu8yrfT05HqYnWjP6MQPZdfQilfD3zDRxuGSMdH3B5W6BS4jFvQGXVXBreNZcPuvTHp+V2vGz/n/WuN3XG4+RbTkDrwWnR2yCbIvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=go0JS0HA4u0Kgnz+KBvafMfe0VuKi2wXRAKEo2ro7dY=;
 b=i108oflLk+TUHoJKkyP1K7itiqqTPXNJDL/b/BEt91aSyWZHKTgAQlvlKzRj72lrxln3rIr1DQ7PwvHikHmETtTnsA2hV7esKWc7+9a7pyQayRTSKX+4DItmtedCN+rgoL1+BdKq2gFUMrnZBSmX0Tyf5knPVO6AH/OhyV4PFVFTh7xFzXHyFhlHTncNl3S6Kr0xIhKtxb0kAGvwbc7R5Tl+OFDpBkqvsGEkXAdAN5/jCFxy/ZUhY7adZ1oKD9mFL15CNyiR9Cuyprrs0Jk15O2nRW1ISgG+YvNnSqu6qEQkFOiD+cvNBGTQR4w9/pnAyyj00dxbEYbJ8vc4faQb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go0JS0HA4u0Kgnz+KBvafMfe0VuKi2wXRAKEo2ro7dY=;
 b=vW/t3I5VCS79SVJOhfNg2X1j3RjjbmPqFN9avzAzF14EVE8bcmBy/T226ODIlkE8ZfQNpDXRvXJg3DZFSkRaY2os9XATrAiDfkATjJaoOPwa52+ipUMZlvt04rntnOybn3ZrzTXkMbkgFnHmvlXxOBK4Pq1I7nx+RbeWuYo4iA0CJ/asP16Wdh/+gAtTcrALok99TNJmlk/KW/isvQYIqnLBq1ASFnNuQyQiBP4U97aKzZXc5OEpeRK1j8bUSbxlbIPbSk+JICpVCGQqEjtLIBOr82HJr5LCYG09MUQTea04VlwgrMQTGMJOBAAZtlq0hugFOh1k0BcMTo8Qnrg8sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d7af6ea4-f12b-9750-737b-f82aae418d2d@suse.com>
Date: Mon, 19 Jun 2023 10:15:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] x86: Add Kconfig option to require NX bit support
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230615153157.444-3-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615153157.444-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8157a4-0321-430d-cb0b-08db709d63ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qr08gDGMCLrU9Oa518AaNMv4C7MKMKeZqntWquzBBFineRXvl5xtUulv/1wZrv26aSB0b9SryutHG/IvtEfPmbTp54dF5R706Q4BwWBY3znl4cvMD1/UJtsoeyau0TPM26iE5voYmmzlwwdJXGMOoJW+RAxgT8zfCilr5vqv5vlK06E6f7qhJPz04QgIJ24ZtxOc08gVYMPCifHf6Zt9UglbSkkLOgeJjBAtjQF2Ye1vjJiJ5Y/7uQCYKsqS67O3rbl23zVcLleGuvcUUfA5dknpxUC/hhXW2j6xwvXrzOW5zcIqXxSjKDCdYm7ZoY1fmGP0tQFhmiRQrwBJwn2kYDLWOp9UKgo/SQD65nIcAF+MxRyfQTkLao0VaFu7kbcWJ2oTT403rXQUxzXQntA+qSYePKeLLPYZ7qWH97/uZm4sxrD7V0oAZhCwovCwTR5P5IrXIxRslgpD2ieTqzLHKD+IvLYkIGsLHMVBE/KAGICcYr4Rj0vDnctQbNpbSU5ZAM+gYuLrK1Zd0ykgCE7+8jar+MXQsV2LePW4dCIakCPZp7IEmY5X74awtAdgUBySUseJcCB8oHEMlBwixFDD7j/vTjZ4HOkwfocvi065YlGuiz75Uc++kb2SUhtLY+Ni1CH6WjKsI2lFzFNdMfJ1Dg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(38100700002)(6486002)(53546011)(6506007)(26005)(186003)(2616005)(6512007)(5660300002)(8936002)(41300700001)(8676002)(36756003)(2906002)(6666004)(478600001)(66946007)(66556008)(4326008)(6916009)(66476007)(316002)(54906003)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURUMnBRNXpZb0JWWlJYWk9kdzFoWThrdlU2UlY4VVMybzFQUG5XNEhYUHJi?=
 =?utf-8?B?YTNlbVQ4a3dNbFp3UVVWMUVYOHBEckErcEQxdG5lNm1ldG9yTEg0NnVPWkxE?=
 =?utf-8?B?dU9GK2tCVHRSSklyOVg0QkQ3MjMya01RTkhlNnFFWWxNbnVNeWZ6Z1dJeWwy?=
 =?utf-8?B?M3ZjNVZvV0FHK0V6bHFGenppN1RUemZyR1dHaHI0SWY0cFVkcitScW9MU256?=
 =?utf-8?B?WWZxQi82UHJVeVFxcDlvQ0JiUVgrdzZTSmZTOUh0cHQ3Q0pzK3dJMVlHMVUx?=
 =?utf-8?B?R3pKZnMxcnYxbEI2dWFjRXhMZy9hYzVLWU1kdUdzZjNIWUpCSWJ6YVNhK1c1?=
 =?utf-8?B?VG9zWHZhNzc5dlNMa0VFR1FISEx6bnBuYWx1ckdhQUJLUkc0M3pWRFhMbXUw?=
 =?utf-8?B?YU9pc3VKbVNIb2VlMzJUZHpUSU5Ybjh3K3Y0SmRoUXdaejV6WiszZjhwK3NQ?=
 =?utf-8?B?cDJjRXlLUUpEaVNFVGF6T2MxbDVTN3NsQmF0MzFSMk5FTVBvU0NFdk9TUzUy?=
 =?utf-8?B?bnp6U3BWK1NSYVBTVWFkNTY5d0lCbDF1Mjd0Qk12LzNIUiszSm95dW9LWDlV?=
 =?utf-8?B?NWJzZWdyMC95UXM2NmxERElqZzVQSTNtRmptcVZ1Q09qdVRzNktpc3R6aXI3?=
 =?utf-8?B?VFVWQUdpVHNkZ3Y5MnErNUVJdklITmpCaGdqLzJtS0R4QkJBTEgvQ0RmejJy?=
 =?utf-8?B?RUt0dG9jbHJEbzRzR0E5UkZwSU5nZWNnOXRLcDFIVDNRSHkraG1YOGNSbmpZ?=
 =?utf-8?B?K0Q2cXJMQUpYSWh2WFNJeTloTmRNZjNTQWcyRURaYnlwbTNWQm5KcC9aNlVl?=
 =?utf-8?B?TWdhZzJIaS9UMExlTWRVTzNlaEhPcmh5WnN6RFR3ajBzaVVqdy9iR3JUcTNs?=
 =?utf-8?B?bGhaQWtqTDVBWjJTT210bGZCVmR3VXlHM2NPM05zYzlhOUpvdkQyODVGZmVG?=
 =?utf-8?B?RE1seHFkYklFeXlHQWxLMXRKM2VCRElrRjV6cldCU1FBdHoyNlB5eUFsU1ZT?=
 =?utf-8?B?MDVmZURrczRyNGtvQ0hoUjJIUEtpdjFBSzZSMmIzd3N1di9pamNSR0w2c0Iy?=
 =?utf-8?B?SEpMbzdvRkZGdXJERi8zVVh0TFg2emVyNXVoaCttMms0ek5HRjZ2WU9nTS9u?=
 =?utf-8?B?bVErZ212Vy9aaGpnYjB5VHRtLzczU3VDRnIwQ1p4N1pzQ2J1ZGovVERaYnZN?=
 =?utf-8?B?ZmJHbjV4TDkxQUNsUFFPb3FEbTVaVUFYcDgvV1JQVitSNnNkK3I3WG9pUEx2?=
 =?utf-8?B?Y3lpOTRWRXBSY3VFSk92K0dFVHRTRDFsN2NxN3hqY1Rvd0Z5bG9maHNhd1NG?=
 =?utf-8?B?bXhuWnZaQU1pdUxZNjYvcHF2WVc1TGpnUzgyRjdaMmFnZXdpOTVkUlA3TUJz?=
 =?utf-8?B?VkR5TlptR1loWWQvWDZIVEtNWU1OMGE2TnN4WFV2cEJVNC8rc1B4SVV2REVK?=
 =?utf-8?B?TWN2S09EdlJ3c3ZwQmxBWGlBdkl3S2FWRzN5SU1IbHpBM3VrNEdSQm1aZitP?=
 =?utf-8?B?V1djOGsrWVhyVjh3K1hpblQzR3RPY0NCTzFmM0NXRWcydURzNjh2QjRmU2JO?=
 =?utf-8?B?RVNtUytrWTJDS3R6a1NCWExrZXF2ckhYRFNqZVJpa3YwUzYwRnIzWDF3Y0pk?=
 =?utf-8?B?RVVjWlI4QUVuY05kNDZPTHdRWG03Rml4VnNyYUtIL09CeHp2WmlrcnZybE9v?=
 =?utf-8?B?d2pGWUVGZVd1YjNVUFo2TVhFd3R4cTJ0djNBRTFQaTR1UHlBZWtIdm82ZUlu?=
 =?utf-8?B?RXZMVUlxWThJandsempqMmZhSS93dTROSFhSYml5UFVjODBwQ2ZTUVpybElt?=
 =?utf-8?B?a1czcFVWSlVGZnEyT2VuVXY5UXpDWTkvN1RSaU1kU1hWQnRHOGUvcGJzS3Zk?=
 =?utf-8?B?cFZaMGxhOVpLRExuYVdtN1M5NFFYTG40QWR4VWdSYmRrQzc5MVAzV0pFakNj?=
 =?utf-8?B?V0IvdUZ0SW5JTEVkTytzRHNDUEMza0xGSWYxZ2wycCtub25VRElEdmtKbXZC?=
 =?utf-8?B?R1E0VTFBTEdDYWNuNGJteXpVQnh6Ui9CeEpPQ0o1cXp6TkhxYi94SGxwTkFw?=
 =?utf-8?B?Q2xCeTZ0aS83clhIQnlaOVppM0tnellOSjdTbEw3bi9ZMXBjRFBQNy9DeFFY?=
 =?utf-8?Q?sJcIQbwecDhy3r0S+cpxqE1+y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8157a4-0321-430d-cb0b-08db709d63ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:15:49.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZfC0krWYJDh4pAhI8YyQO2kHOReAmsALJR0YAeJHchsR/GSSRiZemRQLN4SomDq6VNlKn+sICf27f2HJXc+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6830

On 15.06.2023 17:31, Alejandro Vallejo wrote:
> This option hardens Xen by forcing it to write secure (NX-enhanced) PTEs
> regardless of the runtime NX feature bit in boot_cpu_data. This prevents an
> attacker with partial write support from affecting Xen's PTE generation
> logic by overriding the NX feature flag. The patch asserts support for the
> NX bit in PTEs at boot time and if so short-circuits the cpu_has_nx macro
> to 1.
> 
> It has the nice benefit of replacing many instances of runtime checks with
> folded constants. This has several knock-on effects that improve codegen,
> saving 2.5KiB off the text section.
> 
> The config option defaults to OFF for compatibility with previous
> behaviour.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Just one nit on top of Andrew's comments:

> @@ -697,9 +708,11 @@ trampoline_setup:
>          jnc     .Lno_nx_bit
>  
>  .Lhas_nx_bit:
> +#ifndef CONFIG_REQUIRE_NX
>          /* Adjust EFER is NX is present */
>          orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
>  .Lno_nx_bit:
> +#endif

In the comment the first "is" likely was meant to be "if".

Jan

