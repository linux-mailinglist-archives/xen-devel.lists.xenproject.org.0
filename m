Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA5BDD464
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 10:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143174.1476934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wQe-0002S6-7z; Wed, 15 Oct 2025 08:00:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143174.1476934; Wed, 15 Oct 2025 08:00:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wQe-0002P0-4u; Wed, 15 Oct 2025 08:00:12 +0000
Received: by outflank-mailman (input) for mailman id 1143174;
 Wed, 15 Oct 2025 08:00:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v8wQd-0002Ou-95
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 08:00:11 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7ebdbd1-a99c-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 10:00:09 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA6PR03MB7613.namprd03.prod.outlook.com (2603:10b6:806:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 08:00:05 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 08:00:05 +0000
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
X-Inumbo-ID: f7ebdbd1-a99c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ6kDK3s06CJ5oZe5QLxUZd/THG/RPsgv77SLoXOvpijkSR1Nr5eP9ZAui3YjPWnND+FwLWp6J+4BkZeqmUxQISuNoaBqOWblCYzE0elsiye+lu23JqO0uCGXUqoPLsTL6xYkpvEQzUuf44dtHdZgwEFPcc0aCLMkllZmA0azCiJFeVyEpxx77TTTV6tXgTJfopCNDp8WjtQishHbPZG0fzKs2hW73XQeeDkkUZ8ZA72rTesccVCZTBr3c+QihIOwQPNWLoTmU4iV+dpeMVQ+avWu7iK96Vii4jek9KbCBSbLGiE+p8ruI6QS+rGa/rB8RSn7JY/KpiKtwC/MUyAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vcbsXIqrCq8YdWBCB0C6VDcIG3ez+Qw7RtHM12iLo8=;
 b=LTL913HHlDOMbabJQLnqksW7SLxD9T4Y8B/V1uO5yE/n6cq32Xhj3B5zpx+pXmdaMuQ+vhpEIBJERJiGeaVwNtZK1vReF/qh2ETiFy+KPvBFIg/uqeZ+wGv4+X5OR0T2ZKNudQhUWVzpISVFZ4EhFgcQAXMpQWKxYTwHu0I67ZdzDP+Gdx6oGMcMpoekkY0D3zvFoj96qGjFL8agIMz21bCxfsJVO2N1WoAWjKazXfOktx+N9JlqQ5YyyBi/3u9aE3q41xjySp56FSs3m2tpl6KktRpFuT4uWsEQJWzryyE3g1RFzIfy1mBG3jWFFzGl96Ht/rCytUz2os+kl/Byrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vcbsXIqrCq8YdWBCB0C6VDcIG3ez+Qw7RtHM12iLo8=;
 b=z+35YrAm3ycvhckI8NbZpFSWnETQlN+eGC/GVu2i3loOjKSORP5OHK5E8u5YyyVrt2pCLzafwOheeohaYRmU1NKyxU+Gdw2hTfVGX77dCyELJBscdbtz04rM/4AjlEiOF2ffZ50Ez1xOp6FTygR7p/8BpX/AO5vRQkGlfnSr1XI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Oct 2025 10:00:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Subject: Re: [PATCH v5] x86: make Viridian support optional
Message-ID: <aO9UgQ3J27hVgGIa@Mac.lan>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan>
 <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan>
 <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
X-ClientProxiedBy: BN8PR15CA0033.namprd15.prod.outlook.com
 (2603:10b6:408:c0::46) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA6PR03MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dca0906-a6e9-4207-5f37-08de0bc0d922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUN1ZCtLOTNRNHNJNFI1VmdMbGlJV05uSFBqSFFsRFplY3lRSDNRY0NOSFEy?=
 =?utf-8?B?VzA5R0ZvSmFxeDVOOVVEM3NMV0pPWVk2V3VUV0JCdENrTE8walZBWkg4V1lK?=
 =?utf-8?B?blVXUStCcGpJMUFqZUNHUWZRSHBsTXAwajNxK1dGYWd0ZnEra2NuYTdDMmxV?=
 =?utf-8?B?OWYxQjd5L0liYjNIZTZ1UUJoNENlTDNlakVOSVU3UXRZYUU4bm9VRUhOVDZm?=
 =?utf-8?B?b2ZSeW50Q0xXV2ltRFc4QlNhMzdGTU1reUJlbWZTM0haSmVLT1RobEdxNndk?=
 =?utf-8?B?QUpTeXErUFJTaTVCeUNUMHVmZ04ra1NpVG1ld3ZJd0pYdEpQTyt3MVgwTCtr?=
 =?utf-8?B?SEloQlBzUEhCM1ZaSk0yYnJ2QURRYUQwT2RDTm4yYW91ZTFpa0UrcktnVHZJ?=
 =?utf-8?B?elErUDlua3NUTFpzaTdJcnpqTUpJcks2OVdreDVsQlpwNzE5a1FEVnFtZXlO?=
 =?utf-8?B?ZlJOUWZFSVNHamUySXVQZ0p4YmZXTDZJTzYrTnRNK3dCL0RZL3pvb01iVlpZ?=
 =?utf-8?B?VWc3UEV3TStJUUtCRldWTkdacE5rbFYvcktxZlFiS0dUTkVzZ0NzSXlybmN3?=
 =?utf-8?B?RW51S0crT3hSR2xZRG5hd0xFRXBWbDZ2N2NlTWJaYlhTQkVJR2kxbm01MXp2?=
 =?utf-8?B?N1NwOWVCTlJrdEJidjJ1THAvbGhHYjZQRWVwanVZY1dHbHY4UDJmcmpETUVq?=
 =?utf-8?B?T21vN1JrOFZJempWSHRxYWpVYnY4WmE0MFlFbnJzWmlXeFhqZDV2dXhYcUdx?=
 =?utf-8?B?WndWQjNMbWlsVnRMRmxqRFdrem8wT3ZBNU41dEZhVGp1KzJQY21sV1FYMjhE?=
 =?utf-8?B?QTlUM09yS3IydmtodjNkMTlheXZJckt5VXVvZmI3VFhHTWhGaVRHUDRDMDU1?=
 =?utf-8?B?empVYUdBZFhvdVA5ckJoSFhZUnZaTHNhWDd0aDZHTWFpS1duYlQvdGNvb3k4?=
 =?utf-8?B?UVNCRzJnRXB6VTVtbS9WZ21PbDVEbUY4Sk4wOEwzTyttZXh2d3cwcmg3dlZV?=
 =?utf-8?B?RHFlMnRIUDBjeUVObXhIcXJKaTVBZVJTNnhiblBkV0Q3RUlqb1ZoZW1wRmNp?=
 =?utf-8?B?cGhQTHdjZDZVaU5reFFURDd3ZnBCYVJsTVpyWVRXT0o2Uk94Q09PbWJLdHo0?=
 =?utf-8?B?SUQ3Y21aMU9ET3pZLzBHWkVxYkxDamhlRncwaUs0cnhzekk2WDJxVnNNN1VF?=
 =?utf-8?B?dXYvSGFCWWtaRXFEK3R4YkZuTGxqWFFVc2ZJUlkySlVrZUFTd3o0dXZ5eGlG?=
 =?utf-8?B?N3hYbWxYR3NCSnNlU2xuNmMyam1EMkN4TElqRStPMzZQMjhUSFNIZi9BbDdN?=
 =?utf-8?B?WXRYVFRsZUtlMkwrcFFrMHVxbmx6UVhUcXZES1ZnQk4rdE9qOEZ0Y1hBUmdi?=
 =?utf-8?B?YTJjS3JLbGMzSXVzQUdzd3BuMHVFcDEvMWs0NFNBMTYvOTFGQzJOK3lsM2py?=
 =?utf-8?B?MVlVZG9EQXJRZGFkaGcycFBObEhSNitFSDZRUUduTjJIcDZSUnBKRmMyWEdu?=
 =?utf-8?B?aDh6bDMwb3NuSFNibEo4cVN6Z0psZU9hUnZicjhvNitKRDVCTGlEOUFSdEZ3?=
 =?utf-8?B?Qm1jZVN1M3ZkTVlCZUN4QmFNTnE5UlEyeXh2ajg2blZ4N3hmaForc1FzWFhm?=
 =?utf-8?B?ZElmSGoyQlJ6Si8yMHFjMkdmczhxbms3NEZOTURGcGN4R2FJYTZ3UUQya1RD?=
 =?utf-8?B?NkpKSDd2ZnJBaDRCOGlyZGh6OEUvbmZ3MXNkY2RTN3YvUTZ3QUdPUUY1WjFh?=
 =?utf-8?B?U2h5RjIxdmRFRng5TkxZeXo5aWxVSmtsb2dSbWZxcklSNytsU3RXUklRVCtN?=
 =?utf-8?B?bFI1TVR1M0pWWHBXK0lxKytLYVpvdmZhNEhkOXc2ek5JRVg3TERDbWxzYkV6?=
 =?utf-8?B?Z1Bwa2hHbDNjbE5lckJzWjdqUzIyVDYwb2xGbXdEYnZxRVY1aGhzYjJDeDZY?=
 =?utf-8?B?RjJGb3VkbXV5VnFHdkV1dTNraysxdjRGTDVQc3lwREdUMWlQMFQrZWVSdXhO?=
 =?utf-8?B?bEZZb0NpaHlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjBwSk1rbTdESUprNCs4UWlYYzdIbWhielk2RjZMVGllVlVrckJoWTBFUita?=
 =?utf-8?B?bnFjcnhRNEtscmdqMHJoaE1nbjlkRkNJeHIzOTd2dnUwQ2hkUTlybXg5QzFP?=
 =?utf-8?B?MzQyeVVNdUt2YkE0UDVkT3B0TWhZcXJWNlZzNjAvVnh0aXF6eVVFN0V1NWpq?=
 =?utf-8?B?b0hIM01PZjdTYnNuOUFacGNhWnFBZUVNOE5kTmsvRXJLOS9uam1zN21oWno5?=
 =?utf-8?B?RDBpYW82aVdrUmRMR284bjU2UkQyN0ZLNmZzQmxrdWdHazU4eG1NUFozMktU?=
 =?utf-8?B?dkhUTzVKWVFqcXNjQzZMSnZIaG5jS21LeWZMMEdwd1JxSi8rQjJ1V2I3czQ2?=
 =?utf-8?B?OUdtNzNwMzlmTExFa3IyUU5RaTg3VkM2YThmSzV6aWE2c2c4eHR0dlpCdEFn?=
 =?utf-8?B?QWt2a01JdGxjc0VROW85S0Z0TmY3cXViakFvV2IxQUJ1ODYvT1VDelZab28r?=
 =?utf-8?B?blIxaGgvNUtXRXB4NGxUdGJmd2tNR2pFaENjOThzOXNGcTM2bi96NDYrTzM1?=
 =?utf-8?B?bU9xV3FYL1VldzdRaHRqRTViVHVZSEk2RmE3YUx0L0JtWGFJMWlrZDI2MkpO?=
 =?utf-8?B?SGFTZm9BdnRBTXZtNDRoQUtvekt0NjZQeEwzR05PNWw5ZWlzYVp5YmZOWTBj?=
 =?utf-8?B?NnB0VFJzVnJ3dzNvZFJ4eFNiZS9pYVl5VWdGQ3poNTBaNjlScGhqbks4MkM5?=
 =?utf-8?B?NFJtaVBBM3NQNGZuQmJrTFpRb3RhdWo4bFNaenA3Nmg2VjRGWU50bCthRkpa?=
 =?utf-8?B?UitydlFsK1p3SDhGVUV2MzV5MGJQNTZKanIrYld1NzF5VE4rWFd1QkRLUFRS?=
 =?utf-8?B?VkpvT3ViRGs4ZDZZZE1IZzBGUXpxZ1FsRXRsVkRScHNOQmdJdkJNMUhCK1Bk?=
 =?utf-8?B?akx4QkRiUFBiK012WGFJa0c4dmdCd3N6d21OV3JwcGZYejRCdzFLRUFYRDNN?=
 =?utf-8?B?UUtHTEZOWFpqSHptb0JGakdzS2RiR3VxWmxsMERJUHdWOFVJY2xTa25aSjRC?=
 =?utf-8?B?czdxTHQ5Q1Z4Qkp2Q29QcWIrcFpZN09sV29oektuNlNtejBWUnRMb3NYREht?=
 =?utf-8?B?WkhrRW1SSCsyQThhVUhOV1kzWEwvVnpYVDc2V3hmcTkybmduL2FGNis3b0dF?=
 =?utf-8?B?OUpOVGJGZE9hZERVRmVKQlMzbllrcGdFR0xoT3doLzVZRGxwZXpuMk5UZVlG?=
 =?utf-8?B?eEcrYWdpa1I1ZTdjaUF3bnFFN2xVU0ZFREVTVGcvN2RSbnE2K3FjR1ZubGx4?=
 =?utf-8?B?bTJxY3UvVDhvVGNvNjNnWW5PUk9IbmhSN3MzUGptRGQ2STB2WXVqRWFWcVVv?=
 =?utf-8?B?M0o0RWlFYXJrYXo0c2RENncvNFNaT3ZIclF1aE1GbTdyVU1CL09BM0N4ZHA3?=
 =?utf-8?B?bHhrQndJSnNBaW82ei84YWJNWVlHNVBZeG5oMnJmV2ptdGtVODY3dnZRM0RL?=
 =?utf-8?B?dzhJWTl5c01vOUgramRZeDgreFlNVWh1c3lIRlJ1QTNVVmd1TDJpNVMyTm1Y?=
 =?utf-8?B?SWk3V3lFbDRvY01KN0NDQng0ZHA1ckNoUHRYOU1pN2ZqNkZsVHFPQllFSmw1?=
 =?utf-8?B?RXc5dks4K0x1RVVucmllSSt2VjBrRTVGOEkxQXVvTVRYWWdlRkNMZHlUcG9Y?=
 =?utf-8?B?RG81Yk5KUkpob3NiZUZrMVF5cXBiQ3Q1MGFVeW1ZWkh3cHVvdWlZK1NuQ043?=
 =?utf-8?B?VlZOWFdaeUQ4OE5hbGdmNmNWVk9oc3FPNmVKL1pDV2dVdG5TcS95ejZhOWY1?=
 =?utf-8?B?SnRHVk55YWcwMk9TTVkrMlNiRGtOS09pbTNUSHp5U3RrcUIwd1ZjUTVjRmxI?=
 =?utf-8?B?SU1YOHNhbzRodVExSW1ORVFMQXJOM1VISHlPVnk1UGFmRGVzaDVnNEpHQytB?=
 =?utf-8?B?Tnh3REZIRDFEZGYyazMwU0J1OWtUQmt4cHZFZENuRTdpblV5N2o0UmdHRkFt?=
 =?utf-8?B?cloxL0gyUDNqZStDWWJiR2JqMll2NlJPVVZ6RkVhREEwNlFndHBRSWR0TXJD?=
 =?utf-8?B?ZlJFSG9oRUgrOFQrMFljY3dja1ExNVA0TnJKQVhhNzdlNGkrSWVoaXAvSk9u?=
 =?utf-8?B?NmFDTFhBeHdBS1Z3aU1wM2ROcnNQQlF5NUNrYkF2Q1ZkZGtQdmVIRzJzaExN?=
 =?utf-8?Q?NkPI7hWPXx2FT4wKq372sfWk4?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dca0906-a6e9-4207-5f37-08de0bc0d922
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 08:00:04.9158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvESOIj5q6W79UrQd8DXUj5Lu0bQOnj8jnIkoH11woXP1AIUOJpLdJ3tClvlgA1QKIv/ilqh+XNyo4KwLKuLJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7613

On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
> 
> 
> On 14.10.25 17:38, Roger Pau Monné wrote:
> > On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
> > > On 13.10.25 15:17, Roger Pau Monné wrote:
> > > > On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
> > > > > From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > > > > +
> > > > > +	  If unsure, say Y.
> > > > > +
> > > > >    config MEM_PAGING
> > > > >    	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
> > > > >    	depends on VM_EVENT
> > > > > diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> > > > > index 6ec2c8f2db56..736eb3f966e9 100644
> > > > > --- a/xen/arch/x86/hvm/Makefile
> > > > > +++ b/xen/arch/x86/hvm/Makefile
> > > > > @@ -1,6 +1,6 @@
> > > > >    obj-$(CONFIG_AMD_SVM) += svm/
> > > > >    obj-$(CONFIG_INTEL_VMX) += vmx/
> > > > > -obj-y += viridian/
> > > > > +obj-$(CONFIG_VIRIDIAN) += viridian/
> > > > >    obj-y += asid.o
> > > > >    obj-y += dm.o
> > > > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > > > index 23bd7f078a1d..95a80369b9b8 100644
> > > > > --- a/xen/arch/x86/hvm/hvm.c
> > > > > +++ b/xen/arch/x86/hvm/hvm.c
> > > > > @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
> > > > >        if ( hvm_tsc_scaling_supported )
> > > > >            d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
> > > > > -    rc = viridian_domain_init(d);
> > > > > -    if ( rc )
> > > > > -        goto fail2;
> > > > > +    if ( is_viridian_domain(d) )
> > > > > +    {
> > > > > +        rc = viridian_domain_init(d);
> > > > > +        if ( rc )
> > > > > +            goto fail2;
> > > > > +    }
> > > > 
> > > > Are you sure this works as expected?
> > > > 
> > > > The viridian_feature_mask() check is implemented using an HVM param,
> > > > and hence can only be possibly set after the domain object is created.
> > > > AFAICT is_viridian_domain(d) will unconditionally return false when
> > > > called from domain_create() context, because the HVM params cannot
> > > > possibly be set ahead of the domain being created.
> > > 
> > > You are right. Thanks for the this catch.
> > > 
> > > Taking above into account above, it seems Jan's proposal to convert below
> > > viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
> > > 
> > > int viridian_vcpu_init(struct vcpu *v);
> > > int viridian_domain_init(struct domain *d);
> > > void viridian_vcpu_deinit(struct vcpu *v);
> > > void viridian_domain_deinit(struct domain *d);
> > > 
> > > Right?
> > 
> > Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
> > flag you need to exclusively use the Kconfig option to decide whether
> > the Viridian related structs must be allocated.  IOW: you could also
> > solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
> > is_viridian_domain() for most of the calls here.
> > 
> > The wrapper option might be better IMO, rather than adding
> > IS_ENABLED(CONFIG_VIRIDIAN) around.
> 
> I'll do wrappers - less if(s) in common HVM code.
> 
> > 
> > > [1] https://patchwork.kernel.org/comment/26595213/
> > > 
> > > > 
> > > > If you want to do anything like this you will possibly need to
> > > > introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
> > > > domain has Viridian extensions are enabled or not, so that it's know
> > > > in the context where domain_create() gets called.
> > > 
> > > In my opinion, it might be good not to go so far within this submission.
> > > - It's not intended  to change existing behavior of neither Xen nor toolstack
> > >    for VIRIDIAN=y (default)
> > > - just optout Viridian support when not needed.
> > 
> > OK, that's fine.
> > 
> > On further request though: if Viridian is build-time disabled in
> > Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
> > or similar error.  I don't think this is done as part of this patch.

Another bit I've noticed, you will need to adjust write_hvm_params()
so it can tolerate xc_hvm_param_get() returning an error when
HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.

Implementing the Viridian features using an HVM parameter was a bad
approach probably.

> Sure. Just have to ask for clarification what to return:
> -EOPNOTSUPP (my choise) vs -EINVAL.

Let me add Jan also to the To: field so we get consensus in one round.

I won't use EINVAL, because that's returned for deprecated parameters
also, and when the passed Viridian feature mask is invalid.

EOPNOTSUPP is also returned for non-implemented hypercalls, so I'm not
sure whether it could cause confusion here, as the hypercall is
implemented, it's just the param that's not supported if
build-disabled.  Maybe ENODEV or ENXIO?

Thanks, Roger.

