Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB267450366
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225808.390035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma7U-00046K-2p; Mon, 15 Nov 2021 11:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225808.390035; Mon, 15 Nov 2021 11:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma7T-000447-US; Mon, 15 Nov 2021 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 225808;
 Mon, 15 Nov 2021 11:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mma7S-00043I-1P
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:25:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8580f72-4606-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:25:48 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-HfDRYwI0Oy6nrM-osmqzbQ-1; Mon, 15 Nov 2021 12:25:47 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR0402MB3778.eurprd04.prod.outlook.com (2603:10a6:208:6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Mon, 15 Nov
 2021 11:25:46 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:25:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0381.eurprd06.prod.outlook.com (2603:10a6:20b:460::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 15 Nov 2021 11:25:46 +0000
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
X-Inumbo-ID: c8580f72-4606-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636975548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMSHcTmdyydXQzc4HgJXMRC0gZq1M9PvFW4wdowtUgA=;
	b=Dq1P7H9NB9h2xbrvd3eK4hXVNiPSe9T6p8rNQJGyuoP6xK0SvVvBVtB5kn9ZiFLMw4Kme8
	Zx1f/rh8f8gMUJDH72rVRDVP0uqGaxT+A0VniL4wjCLVHeE/8ESQMjyeSgdWLquWqMlQX/
	/nt/5RWZG7gYnNUHFpWXeWPwwBbxJCA=
X-MC-Unique: HfDRYwI0Oy6nrM-osmqzbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5JzeGmI2n0Wz1+c/qo59bpcPqHhwD0WLxdtcEdxd3QqW1uA0PH6yFykS+CmRmfmA+YVKQWbbOUXvmK6ra93qAjUjfeCxXW04HxvecyDsblikXnmVkPS6PxYrDm9aBGobsJHT9HDT5zEq1IgwgcYBGc4hAUBtKE3cFzZM/f14daocuQ+LmS4WdlioyVF5erWRJzr7v/3AUVkMjLIXzCv3S4I9vK2m9SCVIKERr0WOpmJrMetDmJnOLvgbiH2NOYIAmPvtwFMEds7ZJkaH6s7gaHOugPylh3n5Rp2nQcmbl73ueAlDWfsLQQhUf1opbPgJCwJvmhIyLVqqQXq4TyRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMSHcTmdyydXQzc4HgJXMRC0gZq1M9PvFW4wdowtUgA=;
 b=gR4pc1aWjFWTdS+cg00+h1rhD7KBwDkvb6AgPue3a5Ai62gLCDs0Q/RPP2Dvy8YzJhx3TrVCkOZC4qy3Zd84IL4U1C2I1TiBwUUdmrKJQGk+sWH+rsR6RbNDtATeeZVHP3hnDzH2MN/WwJ0uXZ2LXjXyNb0YEF4fCFuOf4PK3XTobJRcoHb452ogdi2HjCEsDKnQt0glkbAJYcwVsLUJEAwk//Co8ovaZQyABONx7Nc3q3cwoOp7chASZpctM3lBkxzs/wafJ+VUGQhdJ+UHudh9S5x0fMMk+Ib3YB9oIt7rFClNzQkaK0GbztMTjbQzxull48b5FJNoUwTqLZ3cOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <796b2d7d-6d68-c969-8c64-1838aa425282@suse.com>
Date: Mon, 15 Nov 2021 12:25:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] x86/cpufreq: Drop opencoded CPUID handling from
 powernow
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211112182818.30223-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0381.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::28) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4648cc6-33a0-4670-8c38-08d9a82aab40
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3778:
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3778A6A56529D0DB921DCAFBB3989@AM0PR0402MB3778.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JrIjtPkQY5LE+REK7x7mVgD1nnqiQTWgKb2e8bvhTU9eT5oJAqx6nEsbkP+m2lWTMKHMGRjBytl+Hk1ZAyb1bxyRWBnJ1ZKmz7TCt0Jf+n0QtMs/ny0L1X8NqCxH+TmA5YhX3/YoUQGznsALFgLObgUEAtq5bfvWYlIosX4ZKB98IHoi4rQsWZJLiTaLzgGCf5s1DavHNuuOPoUyTC6x7UrWIsHy/4iilj1014Q42RT4qEn1sbC9jzg/gQMcX4SaHkBhWuXvlEFHnEH0ER073cV2owz31RKiuvzTsS5vaaiSje0hs5JRhTgSJ9JaCq21sYVmKLcLzgDAQUoc6om9kv7UUfODS5ya9mDhpJCwCFUSg8wM1loc1GIPiAFYEMVGSAfi7xlPD1UlMyqIqhnjB/WsBmabYjbls0cLg1ID1YTkAdxUmFwjn92+O1aMxhgCVGP8jJ6ObdoEHUPswyOsQL84f844Es0JX2iWOxiErr7T5+IV7CBC8IdAyJXohg+4Sg/bFfMlJ03SZ63QJEXC8suOSIul4sTxtPwqSCI/IkFXSAGMaXmBBAWd1r3paCwhUvIMWuOaAwFZTOP5+6HAIrcRv3oEwWd+G+cg9r4KsDX/XXFS9NTYfiefRWGK9UdnoR7POjsasqYyzO9kPPsJYyIM/k33QhSrS6MjYqOGhp+5tEGlT9FYwCgn2lQbxTTt2tVIm1wAnZPbyBBxNX3LIU2mG3+07EZVDskHvWnwZdyHYEGtT/lb05SU6wa35ZIZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(6486002)(31696002)(38100700002)(8936002)(6916009)(4326008)(4744005)(36756003)(66556008)(26005)(2906002)(66476007)(5660300002)(8676002)(316002)(86362001)(54906003)(956004)(186003)(16576012)(66946007)(508600001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm9iQVFsak1sRXpkajJERlB4WUJSZ3lGdmZjT0Y1MDB0YXkxVTNxTEdjaUFX?=
 =?utf-8?B?MHNUU3FLbGIwZHIyVjNIVGcvK1J0ZDA3QWdnWnZEcFJZSnU5S25MVnVYRito?=
 =?utf-8?B?WHAyNmJhOFVTbkEya09OZWdkcmxib3BUdjJTRDZiUllESXNlSTJUQ0wvS0o3?=
 =?utf-8?B?V2UvNHBtRHJvVzMxRHFDYUI0K1Z0SlRDOXZqc0tyL0t4eHBHNTNERnJNUTZi?=
 =?utf-8?B?aks3eHFJc0RXcGM2UEhodVo3d3pvT2ZoN2o3em5kbkJYMUsrR2R4REFGV015?=
 =?utf-8?B?V3EwZGN4cGNseWgxdjlldHplMFk5cUc3MitmbjZ5UFYxNDRtcHdpY2pPRlBu?=
 =?utf-8?B?SzliTjVtUXJDaXpGWXowTG5KL1dNUVZLZ00zd0d1NjlxZ2FRVXI3ek9vR0xQ?=
 =?utf-8?B?Y3BtMGpDQktHNFo3bmowd2FVajNVcnVDTHMyM0FiODBURFo2MTRkNjQzTlBL?=
 =?utf-8?B?K0tXM2xycVFET0FtZVY1a1lkS3d4NS9CTXdvbU1rVUxjVjk4MVVTMGEwV2tL?=
 =?utf-8?B?dGErZHlySTZma2hkWjBIWnlEd2ExNG55NC9GdE1MSkVQRVNhdjk0bnpSMDZa?=
 =?utf-8?B?NTdOS0E5ZzVkV2NSOEI1V0JEZ1l5SnNMTFd3b0liSC9LSmhTblR2bHlyOXNz?=
 =?utf-8?B?cnFBZzR2VDNodFZraXNmVmxaaGZ4WVdFQmpvczdrcXpnMDlDZW1oSUZtejVQ?=
 =?utf-8?B?TWFJM0FYQWprS3ppbzRvK3pPaDgwcmFGQXhPVkR3WHozWkZxWllZVFBWcmRw?=
 =?utf-8?B?aStkNms2SC90TkJ2eldhRWlVNDJhZzlSdldTYW11UFZ2anRtYVNoZzBFZ3dB?=
 =?utf-8?B?WTlxNHlURWp4Ym5MeGs5YjVzK0pWSFpTSjFVdWFBcTJvTy9pRlRVOWtyM05H?=
 =?utf-8?B?RVpBeW1NSUk2VmxsTXFIaVNtdzJwaVQvUkgzaU1SNHRPRDh4M0ZNT0poTFVq?=
 =?utf-8?B?RGpjZ0VnOEpvVnZIaTJxYVgrOWJDTDEyMkZTMW5kY3l3SjhkMkhiTEJHb2I1?=
 =?utf-8?B?L2FiZXZQTUxIY1pMdDFwNnNzZ3luNVlQeU5pQk8ySTV1N1M1VUY1ZEJpaVFK?=
 =?utf-8?B?VXUrZHhLR21kbERrRk80alpTNUxDR21ZUi93R1ZZbnlOMCt6V0lIZUp3RXpr?=
 =?utf-8?B?clB0dzRsU2NEYzY5bkl4WEdJZGxxdEdTRFlPTkxWZmxUNHZIQ3ZhRHNHa0RP?=
 =?utf-8?B?MTlPNGxkaHhKaGUrMno4S2pXa2FEdU9Sa3Y5UndDaWFacjJrdlFGRXQ0a29L?=
 =?utf-8?B?aTgrY0ZsQmczSFRYOUJVQUthUkpDWllxbjNQL0pCcmFyNE5JWVBvQ0JkNjFL?=
 =?utf-8?B?UlNnRzdvL2lxNGNDK05MbHlTRnMzeGtua2JCQWh2bTRVeUZpMVVObEFZb0Nv?=
 =?utf-8?B?cURvTHBhSDRoR1RMS0MrT213SFVQbEVBRFRIcGJiQndKRHYrTHFxWHE4UGRQ?=
 =?utf-8?B?UW05T0V3Qk1lTkdHMGxQUmVwTlVheHJSdEpRdGlRQjlma04zckpSR1FEQW05?=
 =?utf-8?B?MVlYL2s1MG8xV1FjL25NeUdmb3huZjFaSHlIcnloK2llcU4wOUpPcDRyVUhD?=
 =?utf-8?B?MlhuQlpHS0dKV2pyMHBjWHJIZjI0NnYyMkFNRTAzRTVWcWZCMjVpTm9wTzJ3?=
 =?utf-8?B?RDBJMUx0RDhVSzA1bXY3TFJQNWZtR0UvUzJyNFYvVkxtTjBkeGI4Nm9ZUW1E?=
 =?utf-8?B?djZVMjFtcExyR3ZrYW5oUGYrb1pXNmdmZVNSamNZdVc3UEJneHNyZ0QxcFFC?=
 =?utf-8?B?M2kzQ1hWQTFvWGQwUy9KT3Z5eXhITDB3T09sVVg2MVh5R2d0aExwT2hlOWxz?=
 =?utf-8?B?aTA2d3V6UU9GeDhYa1c0T2dYbVNFaWpvZmNtT3JoNC9kYXAwZnpBTGk1TEJj?=
 =?utf-8?B?QTlUOTA5R043YjhvY3hKckdsaHgzOG9xSnV6ZU9WYVBpeXpjUjk2aDVZQXh6?=
 =?utf-8?B?SDB0ZGxpdGxPa2E5bFlaeVZRdHl4U0ZBbm9ZVlFPSFB0cVJUdVFVMDFYalNx?=
 =?utf-8?B?bld4TURkMW9Ya25zMnAyaDE5TGVPeU1XelRBRFNtNWU5Y2hDNUFtRWdTNmVx?=
 =?utf-8?B?LytsNDhVdnpjRkdlN1Q2UGcxQ0pxOThyckJxTVI3NEw4YTBqR2dMZHRzNnBj?=
 =?utf-8?B?Q0NjQjdwZG03QWdxWHY4NzMrd3Q3ZlRFOHhEOVRDOGRqQVN1eFVLK0MvSFdW?=
 =?utf-8?Q?AE0dixJ5W+tH0zaOUEDLLTA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4648cc6-33a0-4670-8c38-08d9a82aab40
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:25:46.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxaNfKBi4b0mQhiq2TkwElgOtMRPKqNPR8FQf9vIj5JPVBuAfjUUYWDJvQOb5twnT86C3hzWtChBefn/jDkbNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3778

On 12.11.2021 19:28, Andrew Cooper wrote:
> Xen already collects CPUID.0x80000007.edx by default, meaning that we can
> refer to per-cpu data directly.  This also avoids the need IPI the onlining
> CPU to identify whether Core Performance Boost is available.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


