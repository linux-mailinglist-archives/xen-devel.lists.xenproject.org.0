Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EDF4D00FD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:20:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286085.485437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREDu-0000co-0d; Mon, 07 Mar 2022 14:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286085.485437; Mon, 07 Mar 2022 14:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREDt-0000Zm-TQ; Mon, 07 Mar 2022 14:20:29 +0000
Received: by outflank-mailman (input) for mailman id 286085;
 Mon, 07 Mar 2022 14:20:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/EJ7=TS=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nREDs-0000Zg-6k
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:20:28 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb34409d-9e21-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 15:20:25 +0100 (CET)
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com (2603:10a6:20b:88::11)
 by DBAPR03MB6517.eurprd03.prod.outlook.com (2603:10a6:10:19a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 14:20:23 +0000
Received: from AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d]) by AM6PR03MB5000.eurprd03.prod.outlook.com
 ([fe80::cdef:8699:47b:300d%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:20:22 +0000
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
X-Inumbo-ID: bb34409d-9e21-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+H9i2GA0fyKdply2AIYsso6j31Cm3ydrbYtcRcsfgRpuP6OwIA7g2maDduyy7f9HbiL0e80MdBdZLE0W1OpM19N5HwGNVdx0MAyVE3EEekyZqHxzkmfmcybkuaeZ976IC8Kegzlo8NThi1TuHjKxDgwdx6WMbvLp1t+CmckFxqVUNAZgau5z6MYoF0Le6vMDoawUQWlUejM1tXF0ARGZKK9kBOqf4WJ93JZNyIe/Kb5zfGW/F01Rm1G9FK7gHH+IOeXNhkNos1LdUYK7jj11BEol/RxCuN6wd/bqXl7q8h9WymnqNn4XZD247mlum3Wv0BXLx8kWv9zCo20lW94uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B89FcYxILbSsm9x4zTe5ruz1r7jr1d0Fn8Ch8Vdyqyg=;
 b=RvZkvyutlborDtF216LPVI4MjuqORMm8Xhuerspd4GN0tLEVgdWwUxuUQWvec1y56izxtOvvZNUQbfguoc9vtTJZcgX/Nl2dC+llcGdiX3lbZ3JN5HO5hy/Zyz5Mrdy8WYaqRjPsBLSOn6Lj31J5K99BiQGeW3Mh0hH3B+UlOrrW0y4oZsoQlSXnCrlXvRqnexriYbR7vD4d/Td7/TK92aqNgGz3094STe4ER+1nVoawWjrNBui/J9hldaC3lC/PE8nQndIMMjYXQqjNGh18v1FUmh4wad8SlC2OWwoeZaW71XRA+oCDz1S6KJCBtrPMyk35NJKpgsqYL3m4v3Aivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B89FcYxILbSsm9x4zTe5ruz1r7jr1d0Fn8Ch8Vdyqyg=;
 b=wVK9LvHvECfVKx2X/6LiE/foZ4CuIGUSKjbuQpIsGNVjp91hvoz2lLos6cCQimnlxjepJSGzdAt1ahxbbBGQZf4CobwJQc68NNi/hXMCD6Ll/n2s28yiJQb2+itXiSbPE+Xot50Oa42wOvHR3/Ae2sRLWyD6fP7+cHbHwX1tx3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <93fb9755-d40a-3cfe-1f6e-335b57d5a213@santannapisa.it>
Date: Mon, 7 Mar 2022 15:20:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
 <YiXq5HIrvZsy7QKU@Air-de-Roger>
 <b388ed5b-177e-2e9d-6450-6df16d9250c4@santannapisa.it>
 <YiXwhUnZL8bcJvH2@Air-de-Roger>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <YiXwhUnZL8bcJvH2@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::34) To AM6PR03MB5000.eurprd03.prod.outlook.com
 (2603:10a6:20b:88::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35a89b43-ed08-433f-10a6-08da00459dd9
X-MS-TrafficTypeDiagnostic: DBAPR03MB6517:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR03MB651759DB35EB3214EB4D157398089@DBAPR03MB6517.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SmEm8Uf3wuj6ak3pSlVWlJe70LQOxEXvC+nu7118SyqNCMsamaPXbUyV30BVB3UEv1hLYYd+W5fYvZjnggoEAXyx4FQsrk95S2J2lBc6qzW8IPAYm/646yXLnaXYHSMqgG7rU/C2nt+8BiwYJCe8tz/wxIKke1oTw2eoDEMMHF6H/0Y9Juy8sBaFl/Av4bapk7b/DUv6eGC19XksvdGMhwVsRc4NqRGTEN95mDRVJK45xT6jSWAvQhTF7zuQqj20i7aHTwTR+4n2tQJeiSWh3HqHe56ME98M17hmja3xS1wzZlZtDO1RyJDuEJwwDNA7wS96I2TT4PdelQfd7pG+CXfCxH19BXUFeYBApgjc9AJu759eK75uoY3kDkm0tg2SHVXHugU3nuozyS4oA3BaEp0isPXbXRZt2+FDhmp1dHvEiI8swO2WSqnxFqOGZYIajlSOMeA1q5mtFf9VWSrqvEeomrA/9W3v/Byd5rQzUOzwpK25ozm1/Dg8Wx09GE78PFV3qYqdN9wXXXsuF8r0wctoIybVf3KFiAJ1rNbnAiNgZcKK2LMJ6z+HMXykkwLUy4EFiud/2jCRXL+nM+L9DzRX6yPtAE6WvP/12skE4oOdWCxEH4bIklKdcpSDMdPUWL08XyexCfRCImgqL4kWhyWFeMDNyM3JPZPFA6Mx5YuIB2RAGWvY38Oqg+kvypSXK7bJ+2q0lvg595RQs95PChb524NPWgAhGO0Gja0ZnXa5qrgBwMHDDPFyfKZUnuwiT0OzfAuJ26U5jm80XNKrXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5000.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(38100700002)(26005)(66476007)(66946007)(83380400001)(186003)(5660300002)(2616005)(38350700002)(786003)(316002)(54906003)(508600001)(6486002)(6916009)(2906002)(44832011)(6512007)(53546011)(6506007)(52116002)(8936002)(31696002)(3480700007)(8676002)(31686004)(4326008)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzVEVjU1N3dvcG5NeUF0SFhzR08zTUpwZTRqMXAwNitBMDBLY0J5NXpZbDd3?=
 =?utf-8?B?bDNTZDdoMjhONkxpQXRLbCtXaVBZV2xRN0Zac2hKTkhnSFVTRld2L2pFRWd5?=
 =?utf-8?B?WGU3ZmlpUnZraDFhc3ZOYVpubkxzY3Q2Mk9wRmZxMHlCYXZGc01iNmp1N3Yv?=
 =?utf-8?B?NmdnMk0wRmk4MGxYNmlCQjFoOXRUcEpCWWRoK0pGTm9iYUZqdHBINDIzNnhH?=
 =?utf-8?B?Y250bzM1SUxJVzFwRldnSTM1R3NIbTR1UC81aGhaYzVTK09UbGlyZVNraGdW?=
 =?utf-8?B?QVlydjlvTVZqV1V6WmZaQUQvMit5SzJVaGw2SVUrMUtlT1krK2FiK3E1Y0sx?=
 =?utf-8?B?RFlLcFppelpjdHMzdlB1R2FSdjVsNGpQODZXWE0wTWV1a0k1TFl6WGlBMmJt?=
 =?utf-8?B?a3YwbmVHTWoyTUhRcitBazFVNU83UG9PMUdvcFBDamRuVVR4SDFGeXRqNnFI?=
 =?utf-8?B?enFZK1EvMC9yaFJjTVpsV2Yya2p0WnpGM0FEdWh5dXpnYzRzR3VZMmpZMmox?=
 =?utf-8?B?SjRBblhUQ3gvbjNWYXBJeXJzdTIyY3hpV3ZJUWJHSDBWbWNLVS84Nkp6ZFJT?=
 =?utf-8?B?cEFBWS80bFRUYXpHZ1BRWVFqVWJFdWhQU0VmdjB6QW1BQWZJRmRQK3kwMEdD?=
 =?utf-8?B?bnhtSGhibTlnRnFqUnVJcU9Sa0VqRWRIQms0NW1BSXZRV1p6NHZSL0dHWWVS?=
 =?utf-8?B?RWlJWnd0N2x0aVhpMTBGK2lWK0NmeENtR0lBM2UvMFBPbGUyeWU0TnVjTWl5?=
 =?utf-8?B?dkMxbGRpc1hLT0xBVGthaC96QjNxWDVIVDAzS0xSSzNxbUdKT0Y1c20rSlRi?=
 =?utf-8?B?RE1LVGw4Y2IrNlJXM1RjelFXNmZaUjVSblRBa3MvcDFvQzl5QzhFR3cyaGpr?=
 =?utf-8?B?OFBZQjlmVitYRVdMZlV5RXcrOHlaQkZmZDlYZnFIbEVFNzNKSDJQMW9sZlZV?=
 =?utf-8?B?K3BjcHpDRThOcEg1R1pJRXI3TFZFd3B4VVo2V3BCYWt2WnUraWJGQ0ZuWWtV?=
 =?utf-8?B?LzFDdnR6dXl4VHlKOWJXRDlEdjFKWG9uSS8zZnYzWTg1b0pEdXdnR3UxbjV4?=
 =?utf-8?B?cUZuSlNXZHNpRUFDbXpZdHlZNlBGelNHNTVGdW9Hb0pkWStRZ3JSVUM0b0s5?=
 =?utf-8?B?YWI5eVN1Rk03TDFVblJiQ1hRWUgzcFdubk0xOUFSK2kvQzU5KzhYdS8rUjBJ?=
 =?utf-8?B?VmcxMk9rcDhtSTBPckJkZFM3S0hnY0F4UDhpZHZQOTRkVnYxVnRSOEJtQmtJ?=
 =?utf-8?B?Ti9Uc0lWcldLeW5YOFJlcjk5OVZISzRkeUxtMGp3YXQyNUtMb3J6TGVyOXZE?=
 =?utf-8?B?YXBzUmtNdjFUT1dNd1IwSFVOL2xyL1ptTGNUdTltQ3VJQWExVkJXa0FONEhk?=
 =?utf-8?B?eTI2SWNZOVJHUHFuR0VSakNseHJtTjdTcVpVODBucld4bHVwTFkxTW95M1FH?=
 =?utf-8?B?OWVTdmRJYkRHZmtnK21SS2ZGbkV6a3dPMEJiZWJ6eWh3NlZjSnM2Q0xJWU1H?=
 =?utf-8?B?cU1hYXU4WVQ1OWZtb3hLZnRNRS9kZnZhNWhyRUdvL3JFWFNiV0VXRkU2emoz?=
 =?utf-8?B?M3ZxeFloYk0zYkpVRXVnMDR2ZkZPWFE4SFhOdExueHQyYkFvYThuUm1VNzFG?=
 =?utf-8?B?UmRNbW5OY0V4cW45cDhybWRSWU5qZHovdkxDbkZGMmM2QiszZTYvQ2RFLzNp?=
 =?utf-8?B?UE13eE9MakNZRTE2dS91YkdKOGtKRlhyYXY1UFZOM09CWW9xZFhybTdkWlpt?=
 =?utf-8?B?aGFTVXBhVC9lOXVUdjlobzdENU9MQUtlZlRBdmdxU290Vzl0Z05YOVhqS3hi?=
 =?utf-8?B?SGticWFESGRDWUdDZVh6RHR1eDZBb0lwN0ZKUXdpU1AzSEZFeVhFWnF4RSs3?=
 =?utf-8?B?djFDMFg2Qk1nMDNuaDg0S1dSTHBJMGhGc1hPc2p4N0daR01SQjhvb1p6SGp3?=
 =?utf-8?B?UnhEVVlxOHNQQ2Q3RkhKYlJsVkhSU1UrR1B1NkN2YkNXL2JucmZCelNZbjU1?=
 =?utf-8?B?cHpHaEVnbzRhS0RIdHJ0alVCNHc4U2VobmZ1bFdMZVphWXFXSVZ3ZEczYVFj?=
 =?utf-8?B?OUY2Ri9pRzhJcGtyQkZ3OHFUWDF1NThiSWFlZHpzelFad2pWaTZjVThMOFhU?=
 =?utf-8?B?T2o0LzVNRVNJRnNLQlplNmIvZk9RK2U3QnlOSzdlVElySnBCREhSaU9vSDA3?=
 =?utf-8?B?NklBM2xGbkpKdGc2d0dMT3JlTjRsa0I3c1hYeExIRzE1MUtMM3FTVWQweGRr?=
 =?utf-8?B?Nm9QYmlmb01kR0hTM01MVmZKTXptS2E4aXB1NnYvUlVWQUNidXZUT2ZkQnhT?=
 =?utf-8?B?NzlkaHZiQldGKzNVYzJISEVrUk9WL2xTVHR0aWt0ZEJHQlJva0lvZz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a89b43-ed08-433f-10a6-08da00459dd9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB5000.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:20:22.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /N3rfFj4qpj2VZlQ4xLCRsrhMdfUixMPA2OVpzxLELS/2LyhwMlK7UY8wz2Rtksdpv6scKUCMUQQmsgsL0iRwy0E6C3sEhLcpqDKm5MR2UThtsDeZOPPGTSusNxupnfA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6517

On 3/7/2022 12:46 PM, Roger Pau Monné wrote:
> On Mon, Mar 07, 2022 at 12:39:22PM +0100, Andrea Stevanato wrote:
>> /local/domain/2 = ""   (n0,r2)
>> /local/domain/2/vm = "/vm/f6dca20a-54bb-43af-9a62-67c55cb75708"   (n0,r2)
>> /local/domain/2/name = "guest1"   (n0,r2)
>> /local/domain/2/cpu = ""   (n0,r2)
>> /local/domain/2/cpu/0 = ""   (n0,r2)
>> /local/domain/2/cpu/0/availability = "online"   (n0,r2)
>> /local/domain/2/cpu/1 = ""   (n0,r2)
>> /local/domain/2/cpu/1/availability = "online"   (n0,r2)
>> /local/domain/2/memory = ""   (n0,r2)
>> /local/domain/2/memory/static-max = "1048576"   (n0,r2)
>> /local/domain/2/memory/target = "1048577"   (n0,r2)
>> /local/domain/2/memory/videoram = "-1"   (n0,r2)
>> /local/domain/2/device = ""   (n0,r2)
>> /local/domain/2/device/suspend = ""   (n0,r2)
>> /local/domain/2/device/suspend/event-channel = ""   (n2)
>> /local/domain/2/device/vif = ""   (n0,r2)
>> /local/domain/2/device/vif/0 = ""   (n2,r1)
>> /local/domain/2/device/vif/0/backend = "/local/domain/1/backend/vif/2/0"
>> (n2,r1)
>> /local/domain/2/device/vif/0/backend-id = "1"   (n2,r1)
>> /local/domain/2/device/vif/0/state = "6"   (n2,r1)
>> /local/domain/2/device/vif/0/handle = "0"   (n2,r1)
>> /local/domain/2/device/vif/0/mac = "00:16:3e:07:df:91"   (n2,r1)
>> /local/domain/2/device/vif/0/xdp-headroom = "0"   (n2,r1)
>> /local/domain/2/control = ""   (n0,r2)
>> /local/domain/2/control/shutdown = ""   (n2)
>> /local/domain/2/control/feature-poweroff = "1"   (n2)
>> /local/domain/2/control/feature-reboot = "1"   (n2)
>> /local/domain/2/control/feature-suspend = ""   (n2)
>> /local/domain/2/control/sysrq = ""   (n2)
>> /local/domain/2/control/platform-feature-multiprocessor-suspend = "1"
>> (n0,r2)
>> /local/domain/2/control/platform-feature-xs_reset_watches = "1"   (n0,r2)
>> /local/domain/2/data = ""   (n2)
>> /local/domain/2/drivers = ""   (n2)
>> /local/domain/2/feature = ""   (n2)
>> /local/domain/2/attr = ""   (n2)
>> /local/domain/2/error = ""   (n2)
>> /local/domain/2/error/device = ""   (n2)
>> /local/domain/2/error/device/vif = ""   (n2)
>> /local/domain/2/error/device/vif/0 = ""   (n2)
>> /local/domain/2/error/device/vif/0/error = "1 allocating event channel"
>> (n2)
> 
> That's the real error. Your guest netfront fails to allocate the event
> channel. Do you get any messages in the guest dmesg after trying to
> attach the network interface?

Just these two lines:

[  389.453390] vif vif-0: 1 allocating event channel
[  389.804135] vif vif-0: 1 allocating event channel
 
> Does the same happen if you don't use a driver domain and run the
> backend in dom0?

No, it does not. On dom0 everything is set up correctly. Here the final
part of xl -vvv devd -F executed on dom0, which is different from the 
execution on guest0

libxl: debug: libxl_event.c:1052:devstate_callback: backend /local/domain/0/backend/vif/1/0/state wanted state 2 ok
libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=0xaaaaca342470 wpath=/local/domain/0/backend/vif/1/0/state token=1/2: deregister slotnum=1
libxl: debug: libxl_device.c:1090:device_backend_callback: Domain 1:calling device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0xaaaaca342470: deregister unregistered
libxl: debug: libxl_device.c:1191:device_hotplug: Domain 1:calling hotplug script: /etc/xen/scripts/vif-bridge online
libxl: debug: libxl_device.c:1192:device_hotplug: Domain 1:extra args:
libxl: debug: libxl_device.c:1198:device_hotplug: Domain 1:     type_if=vif
libxl: debug: libxl_device.c:1200:device_hotplug: Domain 1:env:
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     script: /etc/xen/scripts/vif-bridge
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     XENBUS_TYPE: vif
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     XENBUS_PATH: backend/vif/1/0
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     XENBUS_BASE_PATH: backend
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     netdev:
libxl: debug: libxl_device.c:1207:device_hotplug: Domain 1:     vif: vif1.0
libxl: debug: libxl_aoutils.c:593:libxl__async_exec_start: forking to execute: /etc/xen/scripts/vif-bridge online

> 
> Regards, Roger.

Cheers,
Andrea.

