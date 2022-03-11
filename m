Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC054D628E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 14:46:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289036.490337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfaR-0001Ck-Ts; Fri, 11 Mar 2022 13:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289036.490337; Fri, 11 Mar 2022 13:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSfaR-00019E-O1; Fri, 11 Mar 2022 13:45:43 +0000
Received: by outflank-mailman (input) for mailman id 289036;
 Fri, 11 Mar 2022 13:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nSfaQ-000198-4n
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 13:45:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8819cb56-a141-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 14:45:38 +0100 (CET)
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
X-Inumbo-ID: 8819cb56-a141-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647006338;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Qv4HpE7251WgWfiEkj210g/0/QJJkkuMkcq/yRM0yKg=;
  b=eCRdqwDNV91WJTlnGfOgLdm7W8J+GsFg+DG8wohfpG6BIKhEkDYzDB0R
   hs1j+5nlkPVZTu37gWMUgNKSaZ0YCHoMo9kEABWdZ/uhCvhfppmljyS9Q
   Fn/4MCRTWvBhnp/RU/98FLcQ74kJXmSCt0rl2pJyBkt5ZTQfPrH64pUfI
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66019459
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9slu26LXpHR4cVeAFE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS0WQEx
 mpLXGrVb6reNjahLdh3bInk/EhTupHWzNAxSQplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NJhmrGUYx5yAqPzwdsNeRdjGS1HIbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glu3pkfQauPD
 yYfQStpTkqRYTFLAVRNEJg7vuClp0DSSRQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsuTIzdv56CrYG5j7U9br+7T2TClEYUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNeZJhKTysDA3CMqsyq7AHzFtW
 1Bex6CjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wOsWohexcxap9aEdMMX
 KM1kVoAjHO0FCH3BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid9404GAbOkPXWPr9J7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:88wGcq39cToHGD1EcaAoTwqjBVxyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJ0800aQFnLX5XI3SJjUO3VHIEGgM1/qG/9SNIVybygcZ79
 YdT0EcMqyAMbEZt7eD3ODQKb9Jq7PrgcPY59s2jU0dNj2CA5sQkTuRYTzra3GeKjM2YqbQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,173,1643691600"; 
   d="scan'208";a="66019459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaVEUO3rJCs98yVQfkopRMevSy2sscDv9v7gVZUd4Cx0t57FulaVAfcGuK+lmnFNisrzD3U34OGI4+QwtyTVQkYn++DodRWzSIAimYtCYA3ywZoVrPXvuW8JaaDJYTN+z2T/LxuX4lEWE8u8IiO6q48hCcccAyWeUMa+CDQPlkjFXBpq6UJ3O2C3DeyGsDc+8VvW9JvyZl9dHiY7c9JA5JELMxGwlWcB6V9XYY4BSXMN2EDrxVCWShjmikIk1lMDiCHd5CfGNbo4uqyVw7R8oZXM5EGoCxefZJYxZkw91lOsXv1/iy1w5iI7AoVFbttiEuXQy4Di2QjWBBhz4wlDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1rXfp8sgKLX+pQEw5xzFWphL9/bIweA7E1Bmx9VvD4=;
 b=fGgT9vRrU8sUjxcWHF1pgGNfclyeZiuA3VRyee1xFIsotUVntvL2nDSw/lC4x7KycZMD0kuQbB+3xEiZtx87Dubs3fr0sa5IJw2BjravudNCEUag0Pwp0plofZP8unP481mKUR8f6COndnnnnxTGAUfaDE7V7vwtHwuw/NOpqTu+Rq6b+6gLsc6zPx2QK4NVj4gQ5mdgbj3J7180eeMk6WIfYBBu4Sqr3RhuyIdYVKuQD7IxjDH91x5kmCTmwv9wgEpEgsz4nc3fixcQ26n3NASp0YilXfJdhQ6cMoOrlM+zLIY6DuTXL3+KRIvDhB5xbmpXn0fRSOUx1RVwkOg8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1rXfp8sgKLX+pQEw5xzFWphL9/bIweA7E1Bmx9VvD4=;
 b=RpTzc6FoF0tgtTSQn0opAFXKfjfVQL0EWTQkLXDtt+Jvu3t37g3JVW5+q9THheI4vTU9LcrPj/BQZ6CKbXbaV4sVorypQ5zxvO0iIalZXdbsVFGAD68zIQ9wL8WVzVjVBdzAn5C/5v7S7hEgmud7gIRoBlFwH//3euqffstN2Xo=
Date: Fri, 11 Mar 2022 14:45:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Message-ID: <YitSc/Ky6PJb5ndV@Air-de-Roger>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
X-ClientProxiedBy: PR1PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3836b684-d060-4df9-931c-08da0365671d
X-MS-TrafficTypeDiagnostic: CO6PR03MB6308:EE_
X-Microsoft-Antispam-PRVS: <CO6PR03MB63088EDB9B27EFF59077BE668F0C9@CO6PR03MB6308.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uKL+o8O43SEr52fBZAvxJHV+oen/2jRMhrqq7PKtG/I9XeHDP4CyFDFgGqrmiooSz7TKKR4ym+iYCT/LAvX7KZlnYK3KgLVqY6YGaCkz/fIVjakJdcCL5Y7RlKMuZBpjJIbzFhV89hxrbsMn2DfIF2GWGT9Qex38fhZWW4SLk+Nznr9pPhSHvbrFp54Z/LSEI0ux/95aGe99A6hnh1REx3WJBj3APw3lLTwBbWpYfEImWSHGGjUBrBJGkTFhIZ16Tbxp/QEoUghej8iEZoRbli/4jPm6oYyeOwN2xeOicSMTC7JVqbwpQKeOkS6912XUjlqV5JiLfkI+KHDFfwxuujP00gmPs1wgzu2RTA90Qh55yAh+T08y1lC/VTPVF0/S6OiWw0x1azQkkFadeQDJXmYwSXBe0RbOcgJ6NIhTx7jnIJZX+deGv2Q8d1ju2DNw+urSYN6CEgTeXVwYpRXE53nre/s8dSpUXPL2Ay9Ct55wd4jMxSPtk2FhRiSj58oKjnmIxtNARvM1XNqaKb8u2CAy7O5OxcZG9DXhDDxEkC9uBeakPPNSj6f7Y01tf5reSDlaF9J42ele8p6dbWHui8AGbh08l8RDn1VZ126jiMGH0ynj7qsO3CbxISPPx5vDSTVulWC0DzkTepPdFPIXBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(9686003)(316002)(2906002)(6512007)(8676002)(6486002)(6666004)(508600001)(5660300002)(66946007)(8936002)(86362001)(4326008)(66556008)(66476007)(6506007)(186003)(82960400001)(85182001)(26005)(33716001)(6916009)(54906003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjVLQlE2MWlqTllsQmlzL0s1cHdrZmxYUnU0S2tPSHdNWU9zOG85SFZSekQy?=
 =?utf-8?B?S00zdkVkT2hMSW1mZUwzSmwrb2hwY3lDUXVLMUZCV1BTTStoWVJyWkVGMW9m?=
 =?utf-8?B?UHdsSTUyZzZPU0pjM3I0eDEzc1RpRVFtMkg2MklQZEtKMVZlREw0am1qbkJT?=
 =?utf-8?B?OHZHL2prd0pVT29RTjR0bGNWMDBudXU3bXQ3N0tjVnNFYW85ZlVtYmZTdVor?=
 =?utf-8?B?THM2Q2trZ0tad2xLQ3BydUp1aGs5M0xCWHVPV2VWVEQwblMvZlJaNUZiNWNH?=
 =?utf-8?B?eXUvWVRVYzYvaGJVaXE3RnA2OEtldmRJeEtBRkVsc3c4eFI1QzFCYXZ5cHl0?=
 =?utf-8?B?dmcrTnhVdkRmemtuU3hrQ0VPeTZDd3F6OTNXa2pwbzh4YkpNMytvUFJRdUFI?=
 =?utf-8?B?MGhxeFBWOXFvNVlPd1JVakRQT0NYWFRrQnZTRXBHTnVBcmhONUhvcVVISnYy?=
 =?utf-8?B?OFpyL3YwcU9VUWRpckx2aDF3dVFWWG9wek9HVlRWTXBjYjJQc05UVjZyYzYz?=
 =?utf-8?B?Q1d0Y1QrYlAxY09Eb1JsSVlEcmFFYWdTVmU5aERNeWpEZnRubHpPNjJQcTZv?=
 =?utf-8?B?UC9mUTJkcjRsOUtYSzZnRWVpU2lKKytRczUyVXZWZXUrNk9NQnpvQTlySUNz?=
 =?utf-8?B?R0lLYi9QMHptTEdxWDlYdU1JaGpGbU9NWCthNUhiQWRNazlpRGxNV0l5S2c0?=
 =?utf-8?B?dDBWTlBtZ1RBTjRJTUt1V3Jlb0E2a0gySEIvdXcwRkI1ZTlqWGFuaHZmQWFz?=
 =?utf-8?B?eHo3NGlPaVlQbXNrbnhhQ2tYYzRVME1VNzdkd0JsRzlvUWFrZEhxOW9jMlAy?=
 =?utf-8?B?L3lEbndRSjNLRjR1WUpBMFZPZHRvQmtraFYwb0dleXJLcFkycGdCVzV3c3Nt?=
 =?utf-8?B?N2UrNldnUDZ4Ryszb1drQnl6YlZNQ0NjOVVJQUlXOVhBZzhrSDRRTWR4bGhQ?=
 =?utf-8?B?VHBiT0RrWDdrSnVrZlBaNUo4Syt4aEpndzMvY0dlc0UvclhSOTZDcm8zMHhj?=
 =?utf-8?B?OFJXMWJkWjRkU2luOEpYS0M0aXdvdmNxOHVSQW1lSFVkdWJ3TVR4T3hqcSs5?=
 =?utf-8?B?a2FLaTZhTGM4ZEtoVnZLL3NyVDhNTWFHaWViT2p1QXFPRFVDVHo1ZHI5b2tF?=
 =?utf-8?B?aUdBaWVMcUVMK240S1duc0ZkdmlzcUZNemFJZVRUbUtGa28zYU9DQXFLRmR5?=
 =?utf-8?B?ZEJ4SE5oRWlwZFgvTi9DSTNDaDZ6ME5FUVUxNXdLN0ZtcXZHMDNBckpoeS9I?=
 =?utf-8?B?UEVCWjQrOU5iMjh2ZCtGd1oyRW9hN0t0U0FadHZPazlUQUc0L3NIYkZTZzBG?=
 =?utf-8?B?OVNCY2JXU3A0Z1VjVG5jczkwUzJyNEtMQk1Bcm1BRjdTdkhtN3hGcUxNMlBJ?=
 =?utf-8?B?VWN0V2ZyUWNzeWkvcm5mYkF3Q294N21HNklCbnU0R3RxTWhvaEd4QjZTMWlU?=
 =?utf-8?B?Vi9nemhUem9HMXF5YnhvM3BIZDhad3QwMXg1UFZ1WC8vM1Vja2h4SkpFMXla?=
 =?utf-8?B?VVRLNnA5WmZZRHpkMXVRNE55SUNtaXBRVkZ3bmNjTnkxRVY3UXJKSlZqTnpY?=
 =?utf-8?B?RlBVL25CclVjbUJQcUF4d1hLVlh6eWR6K0lLZ01aMEQ2STlSN3d0Nk1rVTRh?=
 =?utf-8?B?My9LWHIrd1BMRHgxMElnOWZONnY2eXJJbWJ5OCs1ekMxblhhQnM2UWFaM0xo?=
 =?utf-8?B?TDJrcGp1QXFMSzJsUFU2eUt1ejRmNnpGaEhtZmJrdGYzRW5WekxrR3BmSDZI?=
 =?utf-8?B?REt5ck1JZk9paWN0MHRqK0c3Z3NNQU96K3JnSmJMVzdmTWt2ZFBrQ0p2V2tr?=
 =?utf-8?B?TmVldE5xYkJpU0hEWGhNTytNTndsNUs5cXNyK3Z2N1crU3cwU2ZZRncva1hE?=
 =?utf-8?B?TE8wRjgwejMwZG1GaHBNaWcyTGg1dmpMaU9kQ05PZVhpSkFSbFdxZW5nUXRT?=
 =?utf-8?B?Vm5EaDh1WGF4dUxSVEFGek1KN0YrZVducVExNUxvT1RGVHk0K3Jrcm5NalFD?=
 =?utf-8?B?dVJweXp1N2dRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3836b684-d060-4df9-931c-08da0365671d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 13:45:29.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjIpL0FZeJ5E7vVFEISR4dcgwwrlgw1/+IwZwnOaB1NjpKtdBwaLFofNj5ICrhwmeGiqV0OtQbxt5lF+6gjm7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6308
X-OriginatorOrg: citrix.com

On Mon, Feb 14, 2022 at 10:25:11AM +0100, Jan Beulich wrote:
> Use the original calibration against PIT only when the platform timer
> is PIT. This implicitly excludes the "xen_guest" case from using the PIT
> logic (init_pit() fails there, and as of 5e73b2594c54 ["x86/time: minor
> adjustments to init_pit()"] using_pit also isn't being set too early
> anymore), so the respective hack there can be dropped at the same time.
> This also reduces calibration time from 100ms to 50ms, albeit this step
> is being skipped as of 0731a56c7c72 ("x86/APIC: no need for timer
> calibration when using TDT") anyway.
> 
> While re-indenting the PIT logic in calibrate_APIC_clock(), besides
> adjusting style also switch around the 2nd TSC/TMCCT read pair, to match
> the order of the 1st one, yielding more consistent deltas.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Open-coding apic_read() in read_tmcct() isn't overly nice, but I wanted
> to avoid x2apic_enabled being evaluated twice in close succession. (The
> barrier is there just in case only anyway: While this RDMSR isn't
> serializing, I'm unaware of any statement whether it can also be
> executed speculatively, like RDTSC can.) An option might be to move the
> function to apic.c such that it would also be used by
> calibrate_APIC_clock().

I think that would make sense. Or else it's kind of orthogonal that we
use a barrier in calibrate_apic_timer but not in calibrate_APIC_clock.
But maybe we can get rid of the open-coded PIT calibration in
calibrate_APIC_clock? (see below)

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -26,6 +26,7 @@
>  #include <xen/symbols.h>
>  #include <xen/keyhandler.h>
>  #include <xen/guest_access.h>
> +#include <asm/apic.h>
>  #include <asm/io.h>
>  #include <asm/iocap.h>
>  #include <asm/msr.h>
> @@ -1004,6 +1005,78 @@ static u64 __init init_platform_timer(vo
>      return rc;
>  }
>  
> +static uint32_t __init read_tmcct(void)
> +{
> +    if ( x2apic_enabled )
> +    {
> +        alternative("lfence", "mfence", X86_FEATURE_MFENCE_RDTSC);
> +        return apic_rdmsr(APIC_TMCCT);
> +    }
> +
> +    return apic_mem_read(APIC_TMCCT);
> +}
> +
> +static uint64_t __init read_pt_and_tmcct(uint32_t *tmcct)
> +{
> +    uint32_t tmcct_prev = *tmcct = read_tmcct(), tmcct_min = ~0;
> +    uint64_t best = best;
> +    unsigned int i;
> +
> +    for ( i = 0; ; ++i )
> +    {
> +        uint64_t pt = plt_src.read_counter();
> +        uint32_t tmcct_cur = read_tmcct();
> +        uint32_t tmcct_delta = tmcct_prev - tmcct_cur;
> +
> +        if ( tmcct_delta < tmcct_min )
> +        {
> +            tmcct_min = tmcct_delta;
> +            *tmcct = tmcct_cur;
> +            best = pt;
> +        }
> +        else if ( i > 2 )
> +            break;
> +
> +        tmcct_prev = tmcct_cur;
> +    }
> +
> +    return best;
> +}
> +
> +uint64_t __init calibrate_apic_timer(void)
> +{
> +    uint32_t start, end;
> +    uint64_t count = read_pt_and_tmcct(&start), elapsed;
> +    uint64_t target = CALIBRATE_VALUE(plt_src.frequency), actual;
> +    uint64_t mask = (uint64_t)~0 >> (64 - plt_src.counter_bits);
> +
> +    /*
> +     * PIT cannot be used here as it requires the timer interrupt to maintain
> +     * its 32-bit software counter, yet here we run with IRQs disabled.
> +     */

The reasoning in calibrate_APIC_clock to have interrupts disabled
doesn't apply anymore I would think (interrupts are already enabled
when we get there), and hence it seems to me that calibrate_APIC_clock
could be called with interrupts enabled and we could remove the
open-coded usage of the PIT in calibrate_APIC_clock.

Thanks, Roger.

