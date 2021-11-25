Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE445D321
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 03:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230620.398707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq4MM-0004JR-BY; Thu, 25 Nov 2021 02:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230620.398707; Thu, 25 Nov 2021 02:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mq4MM-0004FW-3E; Thu, 25 Nov 2021 02:19:38 +0000
Received: by outflank-mailman (input) for mailman id 230620;
 Thu, 25 Nov 2021 02:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67yb=QM=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1mq4MJ-0004FQ-SP
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 02:19:36 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 201bf9b8-4d96-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 03:19:33 +0100 (CET)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AP1EcR8031342; 
 Thu, 25 Nov 2021 02:17:46 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chmfn4ed7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 02:17:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AP2B8IU040120;
 Thu, 25 Nov 2021 02:17:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3030.oracle.com with ESMTP id 3ceq2gyrvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 02:17:44 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MN2PR10MB4333.namprd10.prod.outlook.com (2603:10b6:208:199::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 25 Nov
 2021 02:17:42 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::8d84:1f40:881:7b12%4]) with mapi id 15.20.4713.025; Thu, 25 Nov 2021
 02:17:42 +0000
Received: from [10.74.109.97] (138.3.200.33) by
 SJ0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:a03:33e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 25 Nov 2021 02:17:38 +0000
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
X-Inumbo-ID: 201bf9b8-4d96-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=XIExMbmexIaHezqSI/l6ZxC8Z/2Hwa+QIr5mkWtcLk8=;
 b=NFVwXs/5vmPTY6vPDcX+Mug4rpe1nwWPFxSLIcemtJuZBQQFW7ERlfaytUTXmF0JkT9p
 IOxucwxK7lJ7ry9239mmxFZXMg/79LBTK5UuxDGyguhHXqkat2pGHATVBdqTxx938VBL
 C8NS6lylIKZB+xwrUmUNnm/vZosdQb9szwOTsTV9Im3iRjKfs/q1k6GzAVetU4t2f/00
 +ntE3PotJ1V3sPdh0FYoQhV8NvqJRyW553pL0n6hU4se4z+/pl7LtOCCgnE0qB1f+Lcb
 ATj5PtVXtzOt0i8x9ykk4+rrCJpUMhbyAXDyl/rQFUIMnazGBVFPLOS6HlmqtiWCxE49 Jg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwVH5PMmRewWFxcNUl8jo4h95uf6DrWPCIBFy4hTPfb9F7aq+W5sO7gYot+wn3HSpzIPXZRiztnJOxwchoOkt8dkN2KzVdiyWE8+xB7D8x+dMZEGgClQ4hAOffdyjKVffNgf/j3QlLbLVMR3W/IKRneQ1Z1zAgS4Mv1tMsSo0sPwhT1oz8PxaczWNZUPVscw7OFviSgrr4/R7FhHl8KtEBtpg8T6CpkySpwn18WsBTgH4F47MgfV9Oz8zOTkztcUb6U+kcUQbtqXRsn6Uej0lHqDb0fCDBWpUMhOyCfhoPIIdYKThk3APYcJEqhoW4Zz2SxLUocUakiRA26KhDK6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIExMbmexIaHezqSI/l6ZxC8Z/2Hwa+QIr5mkWtcLk8=;
 b=MCsOZo8TKfgtYvHtE3uVJeUDw8k37ERRWSwskj80GuWO2NMhOkK1ZjNBCDNCZ5jorqhrjDM+NYpuU3PelI3S+ARRVA0m9KDnTdg7tocxjP2hX9dApKiYjCx/S8H2VhVsZedL9TCkVAw8ajLZlKlGoAbaYWprMaJjIlv5ytgVQAg8ZmMp85WYdISk6LkPj5yo/uX6EusJEdWndczBGIndurms0GMdU3/Qs2tdrH55eEAVTN123SsAbREdavf80KOlfrvSlbn50FEOL3i8nymfmrnG9wQqPydgdwjiyAGh7SpbGQ3pM3b2Q2ccl3S3HPU48ACLrhfU7hS0tqPZBkeyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIExMbmexIaHezqSI/l6ZxC8Z/2Hwa+QIr5mkWtcLk8=;
 b=mrRgb+yinWBcumDvymicXVS0ct6B+yAnbhlomJbi7EPk5Ce9i9MRKH6FE5foNbdSQj/M8xiFV2e9KXybmvt/dEy4dHAxDyfSvxI3EfMCgMXpHRVBTXjWJYRoFoYpa2k8HKlnHeFjYAqe8NtfffAmWQbtv2GDmaiaX/WMppFxB+g=
Message-ID: <4d04ea65-ea74-dcfd-5b0e-984b44f91961@oracle.com>
Date: Wed, 24 Nov 2021 21:17:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be
 brought up again.
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Cc: linux-kernel@vger.kernel.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
        x86@kernel.org, xen-devel@lists.xenproject.org,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20211122154714.xaoxok3fpk5bgznz@linutronix.de>
 <87y25djhaj.ffs@tglx>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <87y25djhaj.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83d9c98a-fa39-48ba-bdb8-08d9afb9c29d
X-MS-TrafficTypeDiagnostic: MN2PR10MB4333:
X-Microsoft-Antispam-PRVS: 
	<MN2PR10MB4333A7FEE475BCFE49AD391A8A629@MN2PR10MB4333.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k1QiTl2F3nC1NlHp70TThl61xRM2o6L0NTtwFg3zWd4xMIFGrIOPDsHK6aIA0UBBopOyC2Z+a7UPJcsmN8SCDs59/Ef0TYcn56hr/RH6GTk4o95GdBq2qYz0VjePHL4wE69caX3bP6DjI9aySABbefHsGqG3lAo0HfVGIoUJ6n2opvOZyOCSSKz8B2xoydfxsm3mWPPndzg76xeUK5ghE8nG+37x5oeR/RVeMihpW3PqakR3t3sJn2vH6Ji2jO0NkSxtWAFWcLPXHgXvalaG4FUiGOC6ScRVWKBRFfuJDkTufn0oWqVZ1mqv+CZixTwjXkj/eOWdjc/yIwKYjBjggodyjIxJYHvane6rlbYu7NkNAfWYfcealtUjwgkAxqwQOjh1VkNf6LYIaBYE89BDaYful2AkIh/4HXID28m7/JT6ySwiVPWEpEpUNZIL8fKqKBcnH3fKZAnJoYYrWYEv+38jv3VPVzK0qMG3cZMXF4FUc+5cnYGpJoJDGBTrxdhxHVskMVaXmzqWqSPQsHg5dLROL5DUSkb9N1B/1XT9ftfggxNhIkxU1kIV4LWtF/wkh8Sjom8R8/YkNr4+rPmcoiQhiP5tHWJDqlWLEW0N6MkMEjJPal64HkOAJnHVLEERCqlzKN0TcTltgjeAPFN8i6eFDScpP7KP0rqNvK9WVBve8ShoBPb/chuHDZ0HzFcStnTKmzGNaZSN7As8NvZcfbCsDnSZSzdonhahUUTJlfC0H3Hj1Yi+Acc4JC67Dl4a6SIlUaqcq81WV+C6tRijI3w2rQHnguXN1Ti/EesFHUBwFnCXMywk+B/Awb72cQoeydIGmg90yW9F1UM4+MCEXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(110136005)(7416002)(6486002)(38100700002)(6666004)(186003)(508600001)(54906003)(5660300002)(31686004)(26005)(66476007)(966005)(2906002)(8936002)(8676002)(44832011)(36756003)(956004)(2616005)(86362001)(4326008)(66556008)(83380400001)(16576012)(66946007)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?am0rWXZEd3NSV1ByMTdSSy9SR0VEUTRoRTk3SUR0RzVpN3FhY3JXOCthUE05?=
 =?utf-8?B?ZmJBQkZPRE50RnZPOWhzQm9KMXdOR3habytTV1lyNHJibktKcXZnNHlxYzhz?=
 =?utf-8?B?dFB6U2NFRExyb0J3blJ6a1FBQmZROVRMaHczL1dmSkNxOC81S2tON3VNd3lu?=
 =?utf-8?B?eWgzc0RTN0hSL3kxdGhxaDR0WHA1OGJEUVljVHJJUlp6Qkl4UzUzV2pkbnE3?=
 =?utf-8?B?bkRJUUd2NGY2dEV2U1lXeFJVdEdnN0JIbTJZeE9La0hXYnpaNndxMUhxdVpa?=
 =?utf-8?B?dXh2TTJmaWRhTm8yV3Vnclc1a01YSTBwVmNnREFwcXZkeStaMjRSQldxYzdM?=
 =?utf-8?B?Ky9Rd0xvc0F1VG9tUUNqVGorTk5ZMHNWSVZZUTFCWmZsUmdqeDBuTmgzR1lV?=
 =?utf-8?B?SElDejF2ZTBSYWF3a3lIeWFqRDFmeXpvVkxma2ttSTdEVXNvVTFhaDhJOTNq?=
 =?utf-8?B?NVJvYjZvb3Z0Wk5MWmNCaVhUZXhDTUVvdE1HRzVkMWtPdHZJZHNIOHlsMXhC?=
 =?utf-8?B?T2xyMHpxZndEZHFJellQUmhpTzkrQUVhaTdEQkxmd2dLZ2diOUp6ZlRUK1FF?=
 =?utf-8?B?YkVCYXQ0WmQ1S2dZeUwzODdnZStLeDZNcE8wRUV5YkU2VjRaRkFIWDMvbzRN?=
 =?utf-8?B?S1VIQUc4Uyt3ckVSRmN1WHhjek5QTFNqWTF5QzZLN0F1OEJTd1FVR2pidmxz?=
 =?utf-8?B?WGQ3NUlOMnlPMmxIVkpZS1l6bGdQeUVJNVUzVERHdTh2UGIvUHQxM1QzV0pz?=
 =?utf-8?B?ZnczdWZneVF1Tlh5bnIvRUNNTld4Q3NESnZsMFpRcTNxL1BJVDZXOWR3Zk40?=
 =?utf-8?B?OGRtWmVHOEhLbmxDY2hwbTR3czVuVTJJQTBRc1lBcUNGRWEwSE5OaVRyRmNz?=
 =?utf-8?B?b21Qd2wvblBKVWtoTkc0MGEvaHhuNCsyR1pSZ0NxRUZ6WkxpQldOSEtkcTd1?=
 =?utf-8?B?Nmd3T0EvZjhUVzZPMzByem5HMkFleFRZdG1OcmpvRVVHV0hkb01GSldLQXlU?=
 =?utf-8?B?Y3Nnd3RKUXNnTXhkNm8zRzhlUXIxWVIyZm51aFJseHVob3lpTW9vblY1L3o2?=
 =?utf-8?B?ejA2U0VMRkJCbE1HeFJXaGpyYWplM3BiT1ZLditaNFg0MnE1d0NjMERINFZz?=
 =?utf-8?B?ZkRybDRHUFMwK3V3WVZIRDYzVkpyMEoxYUFNWDZuSVBBQlpPdEVnaUhZQkVy?=
 =?utf-8?B?NVB1Qm5LRHN1b1p6dnNzdVN0Y0tMWndrd3ZydXEzejFzemVBRzNIRnl0VFli?=
 =?utf-8?B?NmpUdXlUTU9BbjNuMjVoN3BmRUIvdUlSbzFoWXFjWFVVb1llK3RLOUQwRkZz?=
 =?utf-8?B?YjYwOTYxQlZQMkhzaS9rZHROOHVsYmJScUhDaUVyd1MydVlrZWFtajRhZVVX?=
 =?utf-8?B?bzV1cVdqVzZrODlVbWlXdDlhSlY5RXkrTndnajJaVGtZQUpoUEYrak9IZk83?=
 =?utf-8?B?Y210ZFkwdGdTRm53RVQxYmZ0NDQ0NFRRbElRL0Q4U3Z1Z2pGZURLMlp5c0xK?=
 =?utf-8?B?NlAybkQ0d3YxdXl0dytNdzdPd0RHdk1EZnhDdWFlR2NIaUtWTVRjSkF5U0pF?=
 =?utf-8?B?MmtjRmluQ0M1NldhZnFaM0FkL3kwZW5FM0QwRnZEZHo4dlZCdjFNOU9nMXJW?=
 =?utf-8?B?N3ZBcVUxMzdwVzVDZkg0YVJmUlBxckQ3cU5hTnJ6U0daY2lhTkxJeDA4cFhK?=
 =?utf-8?B?UmtxWkllSnRsYXBXK3R4bmlweGpRc2hyMGhnYmlmeVlCc2FIRHNzZENxc0hO?=
 =?utf-8?B?cTBJTGxrV05weTlMRXFKVWFIWTN3YnBkeEJuREl1bHlvWG15WHpsLy9URHRm?=
 =?utf-8?B?dnRqK1JKWXE4Q21ZM3p3dUQyUzcyVnU2a1RZVS9SS0JwSVBabmFvWHZFYnNW?=
 =?utf-8?B?ZS9RK2VpMU1aL3d6T285OEJWaGR2S1JnQmZDdUYwRlVGQUgvb0VwTk9mRW00?=
 =?utf-8?B?TE5PRnpSb3R1b3ExRjNFa3V5aFdnMEtabkFLVUFTbWtpZUVJYVV4WGl2bTQ0?=
 =?utf-8?B?cnlJREI4RmdwVXYxM1FHbk44M2RsSjVBY2ZNN1cvbkF2cDFNTzIyc1ZWVFdS?=
 =?utf-8?B?aEpVaGNjYk9zMXZtUFVFemh3S29SaTJWd0JRYlZCb2hZZ3JZSzlpOWhXeExu?=
 =?utf-8?B?OFRuL25EUkVXYXNRL1hiTzFMbnJXQm1BUnFaTE9yNllnMEpJR2dpOCtQS1lG?=
 =?utf-8?B?SDV3eUd2WmpWVmVwTlNjSEVMZzY4ZjZ2azZMUGQyajJHMm9Pd05JOG5PSE42?=
 =?utf-8?B?OGgrcUhVRHh3M2F2TkxmMithQXRnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d9c98a-fa39-48ba-bdb8-08d9afb9c29d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:17:42.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xybOlaEKm0/vN7QoyN6rHZk1OlVLsNPqBCANyikCDVgEQeKOJYmUtJSN6pYkmZGxT5CGZIVcFQvDSCvL4UuKecyLLQDALmK6LdLW6xDl/z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4333
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10178 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111250010
X-Proofpoint-ORIG-GUID: OQhjtSONJBqWvYheHkHfOJjV7zgfYSpb
X-Proofpoint-GUID: OQhjtSONJBqWvYheHkHfOJjV7zgfYSpb


On 11/24/21 5:54 PM, Thomas Gleixner wrote:
> On Mon, Nov 22 2021 at 16:47, Sebastian Andrzej Siewior wrote:
>> From: "Longpeng(Mike)" <longpeng2@huawei.com>
>>
>> A CPU will not show up in virtualized environment which includes an
>> Enclave. The VM splits its resources into a primary VM and a Enclave
>> VM. While the Enclave is active, the hypervisor will ignore all requests
>> to bring up a CPU and this CPU will remain in CPU_UP_PREPARE state.
>> The kernel will wait up to ten seconds for CPU to show up
>> (do_boot_cpu()) and then rollback the hotplug state back to
>> CPUHP_OFFLINE leaving the CPU state in CPU_UP_PREPARE. The CPU state is
>> set back to CPUHP_TEARDOWN_CPU during the CPU_POST_DEAD stage.
>>
>> After the Enclave VM terminates, the primary VM can bring up the CPU
>> again.
>>
>> Allow to bring up the CPU if it is in the CPU_UP_PREPARE state.
>>
>> [bigeasy: Rewrite commit description.]
>>
>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Link: https://lore.kernel.org/r/20210901051143.2752-1-longpeng2@huawei.com
>> ---
>>
>> For XEN: this changes the behaviour as it allows to invoke
>> cpu_initialize_context() again should it have have earlier. I *think*
>> this is okay and would to bring up the CPU again should the memory
>> allocation in cpu_initialize_context() fail.
> Any comment from XEN folks?


If memory allocation in cpu_initialize_context() fails we will not be able to bring up the VCPU because xen_cpu_initialized_map bit at the top of that routine will already have been set. We will BUG in xen_pv_cpu_up() on second (presumably successful) attempt because nothing for that VCPU would be initialized. This can in principle be fixed by moving allocation to the top of the routine and freeing context if the bit in the bitmap is already set.


Having said that, allocation really should not fail: for PV guests we first bring max number of VCPUs up and then offline them down to however many need to run. I think if we fail allocation during boot we are going to have a really bad day anyway.



-boris


