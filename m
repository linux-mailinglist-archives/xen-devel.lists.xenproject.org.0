Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640564F7B7F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300563.512744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOLu-00072G-NG; Thu, 07 Apr 2022 09:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300563.512744; Thu, 07 Apr 2022 09:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOLu-0006zi-Ji; Thu, 07 Apr 2022 09:22:54 +0000
Received: by outflank-mailman (input) for mailman id 300563;
 Thu, 07 Apr 2022 09:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncOLs-0006zc-Or
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:22:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ad3cf3d-b654-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:22:51 +0200 (CEST)
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
X-Inumbo-ID: 4ad3cf3d-b654-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649323371;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JyEumARdcZ/q3QURekD/nEisKxI9oAoukv3P7eGFKgo=;
  b=CcROWpn5BpvEdA80V+UEg1zMQP3sgqI8Vhj4xXxT1fd1byABhj1trzpE
   70/C7nuRRNEATrVFAuWAwDY8+Lr1MbuoBB/8vbpjdcXF6ckcFZvxF3ahO
   DBmMkL7P4F3OSKRs3Xk6QUdJ4goapio8ib4/xiG6GhzmgscKW3crj1e1M
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67662869
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6i099q5ewlVx5CsW7XXAGAxRtATHchMFZxGqfqrLsTDasY5as4F+v
 jcaUD2OPv6CYmrxLdlyYYS1pElV65SAzNdkTQM/qy03Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YThXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSvch8mI4nyh98YSihWDDl+OpNa1K/IdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQqiAP
 ZpHOFKDajzgUyNCBGtMDa4Us8aKu3WlXANB8W6s8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW73XcPARcbUV+6p/iRiUOkXd9bb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c9hNF+w37imdx6yS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWKcmqS65Oqsgi3IBkbMncCYhEYYRsKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ904DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IP4AeP8UhK1DepUmCgHJ8OUi3zSDAdollZ
 /+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwJzryYo
 SznAhYwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LYLISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:w060o6GwZZPNpmZ/pLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="67662869"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gK+wLqufx9d11XaZyCef/kIqG/wr7ZymJNr2g0HwnfdyKGmWTEzsy8IgaE82ezHfrBSj1TrCdnO4OxV+Yae4eRT/gQEuKatj4HEWVAGKvNL1cjTWLBPG9VSmRuqUAfQ4mKNRIkPH+B9SscTOzxi8eiGDYjZgtcft8kEbMBYlU4DV26WuXbYoR+NANEcnBR52Fj/0Mw9maQ1uvSzNKjqEb0H1d61NeEUMdQ2ylL41oQ8reBUkqTE6KtFenxzHoZp9XvtV6/wgy/FffkZohIFsnjfRG4MgTbl/Tq9vzzwxZ7uie4P1MVMHtliKMoP4TTfJo6NA0RzzVphJW/CCexPuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoEkVdeuF0017vsm02abjyJ5Ut7M4pi8LJ13OXWTqw4=;
 b=RtZlUTkM77KA8Cr89u8IShDW43oTm8aNH6Sp6vIQS+f+3GCaw3mzJLTkYfCjSiFCZBHC3c71y3mYN++oYKtHu+TB1LZgSSInOXhUcsKi4zoLmqHxAGVy65bP++b18BffiXrs7Uklk4ux/0y4/r9Wx54Jdn+1tXwOL0mV7wJ8NVoM8129lqM88Q7QG6VxMWFhfTcqpIFoexwG+hT/1oqXBTJyaYxVOP10JTKnpDcr1d15cvajofdozYHXri9igZyIOZK1Y+LzLtl4OQVUnI7qvRudn+AUrKawEWLf0Bxmwol/SA64z/snpa7bxNQXGnr7e9hfKMKGRGT8xYLOkj7NlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoEkVdeuF0017vsm02abjyJ5Ut7M4pi8LJ13OXWTqw4=;
 b=GWeWOoJmtiM1QW4stO6Z8CNRal9Q2c72eXIKaBmE+xnkINO5ca5T5Fdg+QsXb7iObQ9a+w+zeNBHgQbsfAx90H1c1A4Zzfj2CvLDNL9UowRSuySV6kz3QGCuv7t1oNbg1Nli5y0K3TpiLgzftKbxGJby++WSFuXdut6fuh4+kF8=
Date: Thu, 7 Apr 2022 11:22:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] platform/cpufreq: add public defines for
 CPUFREQ_SHARED_TYPE_
Message-ID: <Yk6tW0Q9ROWABn4l@Air-de-Roger>
References: <20220407081828.38747-1-roger.pau@citrix.com>
 <1d05e311-d466-b729-ebd6-178554f67872@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d05e311-d466-b729-ebd6-178554f67872@suse.com>
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb73d3a-f1e7-4259-e541-08da187829b1
X-MS-TrafficTypeDiagnostic: CH2PR03MB5174:EE_
X-Microsoft-Antispam-PRVS: <CH2PR03MB5174CC328584ECD8C19122688FE69@CH2PR03MB5174.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvTMo4SsWAfc2ogejTkdeXhiZgbP9uWWal09d33hnT38VaaF6AjEpHijQ1ZfdvjsdfSkYwAUOpYI194SplCrRVhbY6K53Jgow7gxGrmIcS8Y5NIn7CZxomF79dybS0X93OqPaypPvgw1M8erb7aGVMfIuJHzfaeNBACEEtgZg7m7x2t8kXsUihjhQrzYw9gkipRi3QORI/6sNg/JExx+JYNTmPRhx0YAQ7pxIj8GZeoJW+0765B74nmGGkCR0bXA9mjaDtOYAvr8j8LNn8WKM5KbPWlW15sp05aVLrM3ecy2XgaIc9e5jsES9462ZOKh0bGL65rmitWOxwB/UG1w6BwzQ3VdbCncCGy+LsocAS4961TuEXDehZykhqkBbIy0u8udS9plFwzKRAtdGj6iRKSMr9xTMvCAvva7syFgPFg3kJ+hwBoQLMsOeZscc7K/KKyVAvonftG1XlobaCuWa+T644W2M7latkg0XEtx+gBNO944RRiX13mwoGQp1MFQA8BfIqzL2Kugh+qB2c9IxhYHaq27u5bKPbkVSTyOUIUhxb6sDIDqywSDZNu6TAea/0kYvrqMmfyj5AKB02SfQztje8Qk2KAzaLeAcc+7nH+yjYQBGC169MTBIKSwJr0L+DkCon1J3mO0V3F4Qmc/3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(26005)(316002)(186003)(6666004)(86362001)(33716001)(4326008)(6506007)(6512007)(6916009)(508600001)(54906003)(9686003)(2906002)(53546011)(6486002)(66556008)(66476007)(85182001)(66946007)(82960400001)(8676002)(8936002)(83380400001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVwaW1LM3FsbFN0ZUZQc0lkMWlWa2Izd1Nhc2ZBYmNiUDJURGZOZXVYd3Q1?=
 =?utf-8?B?WE5COC9KSlFxTWR3VFNVUjV3NDQwRlYzTmYrREM5U0hiWUd1TFNGWjFKK3hT?=
 =?utf-8?B?M1greWhoNmFwM3VDMnJDQUhWVEhka1lhZ21zWGlEaS80dEx1TnpkeGRhZndl?=
 =?utf-8?B?cDc5N0Z6RkpnVDZCYnZJWkQySGpjc2hIdEI5WXFHdVFTTTBPdUM3OUhjUXJ1?=
 =?utf-8?B?OWRmeVFVS3prY3J1M05aQkM4U2hBMlgvNWh2dXNvbzBJczR1ZXRqS01rRFU5?=
 =?utf-8?B?SDJVa2d4Mjd6Rm5QcXZVcEZYWWNZbWkzcXpGSTZaRG5XT2NXUzBENEhZNXdL?=
 =?utf-8?B?T0hKVHlwSStkOE5obElVUzZzOG1KaFhBRTNMTlB6SmUzUGJOOThib1pickFS?=
 =?utf-8?B?QnMwK3dUYWdlQWJOV3VaNERUaEdrWDZTK2NESDVxTEJoK0c5Z1JoL1lrKy96?=
 =?utf-8?B?dStHT2VOSDBvdkVUSkxEbVFBci9NbXRKTFNvaWZTckxGekZEQVhRRi9jZkJQ?=
 =?utf-8?B?Nk90QUdRRHE3ZFhNWlRuakZHdnBHSFpwQ3RTaXBlQ1FXTENsODQybnhjUVVh?=
 =?utf-8?B?UlZhb0tEdTRGaXFJRzFVZUVrekQwUmxwWVc5OUdSWFVVTWozVSsxVFJJNWVw?=
 =?utf-8?B?cFhodHVzZ3pTdUpHMjlucktIRU9XMURzN09wOWpQS0VQT3lmdThQM0xXUmwr?=
 =?utf-8?B?NmcvbnpaNmFNcjJJWlhvZU8rRGoyaXRBS0tZYlljNDYxeHlxcTJlcm8zK1B2?=
 =?utf-8?B?Y0N4aHRmOEpFK0xDSEFxSnVNdDE0VldKd1lxeVhManhNb2F1U0dSMURkbU4w?=
 =?utf-8?B?a0R2Rkl0S29FdG5PeGt2NkxpOVNwRlRuRE1WOTVEd2lXWjY0UHpMZlZnV0pV?=
 =?utf-8?B?VWZ1TC9HQjZ0cVRIb213dlgvRm5XbFVoMkFabjZLRHUvSVRjM3FTdWx0QkV0?=
 =?utf-8?B?SjQ5aVh1K00wN3VObldVZEwzdFhxWWMzVUJiY3hETnRBTlB1TlAvdktoVnMv?=
 =?utf-8?B?NzhvbFJ3dEk2cTQ2UytjQWF3R0w2LzhiRmZlNmpRMlc2eVVYYS9JTW5OZEpT?=
 =?utf-8?B?M1RpRk12ZitIQ1VoWVFjNW90V2pJY2hvQnIwVG9ZTks4Mjc3V3c2WDRKSExU?=
 =?utf-8?B?TWQyMkhVVDkyWGxpRVdEbEJ6TUlBT2hFUzJCUWQ3Z3VDVUJOWkdyWXhxQldV?=
 =?utf-8?B?Ri9TNG9Cd3NtUFhDNlhudUdGLzZpNEp4UXVQZlRkQldOYTYxV1Rob0ljYVJn?=
 =?utf-8?B?ZFZ6Z1JYUndtOVN0eWMvZHB3ZStRaUV5UldiTUZVNno2cEZlUzMyY1Y4eDhP?=
 =?utf-8?B?QVV0SXFBd0dqWVJtMEFEMHR2OGg0Z29saTNTOHpXUFJsZXpEbm1vNEUvdmJS?=
 =?utf-8?B?VVNVdGZJQ3lTRm9Hd0xkK2VjcVVqUUNpK1ovQmdOMGNuUThRZ2xlSjlLcTZn?=
 =?utf-8?B?UUo3ckZ1c0Z3NThpTnFPQk5IZjVENjBXM3hIMks5aVBibGQrTjFUUlJZSW9I?=
 =?utf-8?B?MkVjNFY5U0ZCbWZHUVgxbkp1c0Fyd1hIMHVxNkYxc3pqSzl2RWJtYnE1Q3lm?=
 =?utf-8?B?Qyt6akhLSWd3bmFyWmxKai9ZTTZtNmxNQkhTa0NsMk9mV2YvQnp0WHQySEN6?=
 =?utf-8?B?bXo5Ly83elByWDJlQStwUGVpYnJOYlY5c1NkSGNDMVRVbkpwNzhpbFFZMWdH?=
 =?utf-8?B?Q2lyQXUxRXlUaCtIZUpla205VHkrcUg2TDFkOG5ta2puZUhndTY1bTJVY0dU?=
 =?utf-8?B?N0xHMDNESDFDOXFnb2hwZXJxTlRkKzVCajRxTDRUM3ZOMXloMFQrMmZmellX?=
 =?utf-8?B?cmF2KzFOSUlzdVdzY21CSndMdjlLNzVjR3dNdnBHa2FQY2k1TUkxSVErOTFy?=
 =?utf-8?B?NFI5TVpBaFZ4YUN1YndPUDVpeTkvbDFxOWJaMURNMDNsUlRrMDByOEp5NTlF?=
 =?utf-8?B?R0w1OXk1cWZPNlBhY0dyTkVOS3dwbXp0K3lMdGc3Zi9STkoyMTd2L3JMRE82?=
 =?utf-8?B?VWovV3Qzd3VnclQ1elFGU1pNYnhDWmVtcWNPRzFZWW9aQlE3bE9ZR2V2YzRR?=
 =?utf-8?B?SFlSaHVhTElydEJTMWQ2aTlQNXM1N21yZU5PWHBlelpla3dJQ2lhTmI4ZVdC?=
 =?utf-8?B?ZUVVQ05obW1ZbUp0cmJGSHlJa3U0TWNPZm04U3M5TDhUN2w0ZzRSZ2ZGNUtE?=
 =?utf-8?B?MmN1MHJkRndrY1FxMkh2cTlxMERPR2NvR3FnZnBiUVl6VlBiYjhoMXV5ZERz?=
 =?utf-8?B?RjZWVTFIeENIU3VrM0tjcmFueHBVOW1wZjJsa3dTT3psbzczWjBHak93WHdF?=
 =?utf-8?B?ZnlJMXAxZy9EVnpRTXNtcWlDeFMvNzJ2NlBKSjBra05LZWxQa09Ya29mOVlu?=
 =?utf-8?Q?T9mDq2K7ksU2T39c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb73d3a-f1e7-4259-e541-08da187829b1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:22:40.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmCfhYE4dCTVTHitmzc0f1JNOsJCkOmmdLBmu0jRgBvS2qpYooUKxTMU+8Fvc69DU8JVnLHCbWuh5tnI+UQaIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5174
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 10:48:50AM +0200, Jan Beulich wrote:
> On 07.04.2022 10:18, Roger Pau Monne wrote:
> > The values set in the shared_type field of xen_processor_performance
> > have so far relied on Xen and Linux having the same
> > CPUFREQ_SHARED_TYPE_ defines, as those have never been part of the
> > public interface.
> > 
> > Formalize by adding the defines for the allowed values in the public
> > header, while renaming them to use the XEN_CPUPERF_SHARED_TYPE_ prefix
> > for clarity.
> > 
> > Set the Xen internal defines for CPUFREQ_SHARED_TYPE_ using the newly
> > introduced XEN_CPUPERF_SHARED_TYPE_ public defines in order to avoid
> > unnecessary code churn.  While there also drop
> > CPUFREQ_SHARED_TYPE_NONE as it's unused.
> > 
> > Fixes: 2fa7bee0a0 ('Get ACPI Px from dom0 and choose Px controller')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one remark:
> 
> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -78,10 +78,9 @@ DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
> >  extern int __cpufreq_set_policy(struct cpufreq_policy *data,
> >                                  struct cpufreq_policy *policy);
> >  
> > -#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
> 
> I realize this is unused, but do we really want/need to drop this?
> I think it is used implicitly right now by assuming the value would
> be zero; this could do with making explicit, in which case we'd
> need the #define.

I don't think Xen uses it explicitly, all checks of shared_type are
always against a specific CPUFREQ_SHARED_TYPE_{HW,ALL,ANY}.

I don't have a strong opinion about keeping it however, I've just
removed as a cleanup, if you don't think it's helpful I can resubmit
keeping the define.

Thanks, Roger.

