Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A915EA879F3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949354.1345914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Exe-00029C-HD; Mon, 14 Apr 2025 08:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949354.1345914; Mon, 14 Apr 2025 08:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Exe-000264-EE; Mon, 14 Apr 2025 08:14:34 +0000
Received: by outflank-mailman (input) for mailman id 949354;
 Mon, 14 Apr 2025 08:14:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4Exc-00025y-Ca
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:14:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7512ad-1908-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 10:14:29 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CYXPR12MB9388.namprd12.prod.outlook.com (2603:10b6:930:e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:14:25 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:14:25 +0000
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
X-Inumbo-ID: 7c7512ad-1908-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcY778N9puR607nhqdjAYtzfUnz88jmGxUQKs2O+uVlEJgIiN8G0l8LGzF/WlkHl/1hpUzFqwn804ilxywnsqdJTa1OpXEV/2tAR2jPt5MEpoR+kFKPzFbKLrx+U6I3KFHfMS+efq9PHHExPzUvxQRllS7uGcHx6YEk+ekOIVyBNqKiUpmU/gZA/l7+sDjjqMDtrrKVyzTPE+dv8HEBanpZcMvNBqpTbjK+ipv7mqeifHIMIESzU3TaDBsh1+ayaFwDDWa6ajSQGnGI6HK3mFCTbm+E7k37ZAUH4QKmSX8/Lx1BqnZQxT+PIYw1vqMgLw3aL82rvRBIrS4w3AYyKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQXZacACADDzwhw6ZY9RVkMFNtb+/JyZ3k6RwRWqN3c=;
 b=f9N7pnuf9307P3ayT2kXOPKf2J3E1oc8F8t8CZYNRPULscbl7x2Mo84nQnJYKRmoefPTHHu7yUb5gWVCKCtX0N0AyR9Ewlj5wF76FuRZ3kGSn1iOq4oIsjB/nG5xRsE1R4PW12Dl65BUpufyKPP0BIGf3a39tgHz3QfpY1diavRc1j5mXCjmfTbBpYR8QIPH9ex+pf5XQbeVNHRIQKbQl1aSzoft91D2oH0Q+koRfLZe9Qjm7tzsr7+S4GQY8J+tSZhbHL6kvh4rzWvUVkb+JvhTlQ+2PxJxzvrc18WxP+CZO8NMoNejQv5SgliIOMVp/ONdsUGd0n91YmbVsREwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQXZacACADDzwhw6ZY9RVkMFNtb+/JyZ3k6RwRWqN3c=;
 b=M+DvzvkBwQG3yL9kugZJ1aSbmjADUb8vRzN6TWThAdNf4p5HalBjjxQxF4zW2F45DsEqF4wBr8t2DR2GljUbellt8mKT6Gb28a8rEIujkI/V5eIua9MbzzHxLva+UWxyjjSEaAVwihzHNE0Tm5T+zPFbrtDUzCbRJHIkOBbWGek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <52847015-1773-46f8-b831-5f6ec4f293ac@amd.com>
Date: Mon, 14 Apr 2025 10:14:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen/arm: Move some of the functions to common file
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-2-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250411110452.3748186-2-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CYXPR12MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: df3041e1-0da3-40c4-540a-08dd7b2c5ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDhDLzN6QUFld1JUUlFlYVhiVHViUXVuZlBOc0JBVENCaDFKUVFhZ2xPOVdh?=
 =?utf-8?B?WngvWHRONU1zOXk1OXUyMHBVNlhNd0VZWFZzU0xpcXh0UjA5RXZDYlk2Ky8z?=
 =?utf-8?B?enM2TmVWeWp6TmwrZUF3bmVaa0h1Wm40OHdYcjZrNVlzY1c3YlFPU1dWVVdo?=
 =?utf-8?B?ZllkbDlzNWRuN3U1TmdVdm02SWlYOW9ncXMrS0xONGVNWjZIRkNpSXYzekgv?=
 =?utf-8?B?eUxtS2FoNkxpT1o2dHd5NEhZL0M0WlNsajlYQ2xqamxaRStha1JEK2VrcDlK?=
 =?utf-8?B?dEl5VXh6bFIrTzdwMUhRUU4wbm10a0JPTnVMaGMwemxwOHJWZHN3RXAzRWQr?=
 =?utf-8?B?Q3ZwbElhVlVLZEgxU1NOdDM5QUU3U2krOEp3bGJ0NUtFendDanEyeDFlWGc1?=
 =?utf-8?B?L3YrWlp1OXJPN1U1TzJ1L3N4ZUJHNlhPdllET0hJTEl4YlJwZEY4c1ZrZDA4?=
 =?utf-8?B?Rm01TXRaOUt2VExmMDVGT1NoUlVQZE9NQVlDdlZyYXlJUGd4YkxlWjdRa2xu?=
 =?utf-8?B?V0FJOUJsMk9zWG5YQWNMTTNDL3dBSTBkUzJQUUthRkhqdmRUcDdKV0NVdWZO?=
 =?utf-8?B?MVBBTTdsMEhNd25zM2lBUUhwOXV6blBtMTZVTUhsWGJ5alNjcVg5UnZWNWxR?=
 =?utf-8?B?QTV2YTVpVTRZVDRiQm9JdkYvOUhhM0RhRk5VS01uTjUzNndNeFdrempWSFdp?=
 =?utf-8?B?QmErWGk4dTB1UGNkREVnby9RZ2FvcC9NVUlMNmpjL3loNzVtdmdlOXNUMzhR?=
 =?utf-8?B?eG52T0E1eFFuYm1CcmQ3eEswQ3Q0cC9nenhUVW5mUHdUYjVpczVPN0o4dFdV?=
 =?utf-8?B?Z0d2b3lEeFladXhIcGVMYWREbHpaenFGZVVybW1pQ3pRa2ptWWQvcUpaWVNr?=
 =?utf-8?B?M09NVWErb3VqaVh4a3NMOWlNcnc2SkpTL3BCVXc4QU82dEdZNzZjdTB3SHFF?=
 =?utf-8?B?MUFrVTIzSldFWk5FTkVMSHFNbmlFWURKNFdDUHJkcEowK0pKT01mMTZMWUIv?=
 =?utf-8?B?ZjR4Y1VsMll3aWYxNUliUmNLbEVsbDE5MFdaZGRCQTc5TDNsYzFzQUl0NUZl?=
 =?utf-8?B?T2NWbHBUNEFmeVR3VlhxMnpkalFEU0dlY1ZseXZnSWp1dVkvbjIvZmR5enF1?=
 =?utf-8?B?eDVoS2pIOVBlMU5UYzMvRGNRVTc5MnJ3VlJiMkcvSFdJYzhHMFE0Tkd0RmRq?=
 =?utf-8?B?TjhMSVZ4cG9sbkU1b2xoUXBBQ3ByWlJoVGR1cnZsY2VOS0tndDFNUEw0Q2pQ?=
 =?utf-8?B?OVhWL3Q2Y0RqaUV0UG11cUowdDhhaUNoWjd3NElFNnMwS2tkNjZFWStsVFRh?=
 =?utf-8?B?RksrZ09PenI4eVlGRW53T0o0RVpwRkhRcHB4WGVhZyt6ZHBmdUJ2bUJsSjQ3?=
 =?utf-8?B?T2pPUkZuRWZ3cW43eE1NVlRWVUtwbWh3WU0ybzdscWFUaDd6UzFueEkwMENO?=
 =?utf-8?B?V2ZGWUVVaVFkN2FJY1pXRDh4Y1FHdzB5Ri9FZnpHT3hOZGpEblNxYmhCQUFM?=
 =?utf-8?B?Wmd0YmN5dzUvcjB4c1RQR0NnajYzeHNGS29kUUthMkVSbGxvUi9QdUFkYWNJ?=
 =?utf-8?B?a0RTSGJ3TlpjdHA3Q1Yva1Q3ZVVoQ2lLQkZadHRCY3ViWE9ydjhJRWkzc1JW?=
 =?utf-8?B?ZHRyajVueVB4SkJzTEZPMTFnMlBSditHOUlVMGNHWmtIMkZNa0tMS0Q4d01X?=
 =?utf-8?B?S3g0cjV1dXMrV2l5Y3pJWjVGeUdSbTBQM2o4T0FWOExrbGxJY1VVeTJsRkMx?=
 =?utf-8?B?MmE4Q1R3SEliSFZ1MVhnZEp1cG1ZZkdGdnBvZlRnRURGSURXdHZ5c1JZdFlr?=
 =?utf-8?B?NnUwNENuWXdKVXJrV1NEelVoWWdXSGtsbGc4azNIZ25QY1VxeEkzU2taMUxv?=
 =?utf-8?B?Um5VeDNvdklLOE9EQ3Vnd3QrMU5aYU1SQXZ2R2RnNWVJejk4QjI3N294bUl5?=
 =?utf-8?Q?UdxGxi7V79A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnBtUmFUMjNad1l1SVpOSmhlMVQ5VWpGeVZHOFhBUkhnc3VrNWNHK1F3bDZE?=
 =?utf-8?B?K2xGSmZWY0dRbWo5SDRlNC9WWUlJdlhnTzZuTVdIT0Q3WVZxbE9VdUhER1NY?=
 =?utf-8?B?T21wKzA3dDlzNUdkbXR1am5pVXBUUis1dzlhTmZtNmRwMkdEdUlCMDdaOU1V?=
 =?utf-8?B?SzdMZGVhNUdxcW5HdU0xWnIxN1hkSEtZN1h0d053N1Jvb1hMTk9NWDJXeUNN?=
 =?utf-8?B?VVJ5RC9ycllObjZmMWhTS2NCVnArY1FSZWhRMExJQlpxazBBelpmSXVvOGpy?=
 =?utf-8?B?THJEeGFYNFdBV05XYUFOeVhEUnNVZ2xySG5BM2dCRlRwNWM3citMZWc2Wll2?=
 =?utf-8?B?bkFhS1dVRVdGNUdBeER2R084d2dQNWlWNWxxSnlIckRyNTJpVUxmWmNQM0tJ?=
 =?utf-8?B?Y24rY1R2emtUaldKR3ZnQm1HY1hKVG1McWQ4OW5KR1g0ZlVFeXErc2h1SlJu?=
 =?utf-8?B?dzZUck50WVY1bDNibXdFM1lWNXBDVEFvVytjeHE2K0RlSm56NXRrZzRLYWpW?=
 =?utf-8?B?SWZ2MDdWNjRBRFc4K2JEVzRDNEZLdVhIckNSZGNNcmVlcXo3dE50ZlZiVU1E?=
 =?utf-8?B?WllJSjl2RFFOaisrRlpUTC9BdTd3dGNSSEFiWFFhWHQxMkFOMm9ack41NnNN?=
 =?utf-8?B?dG5scWt4WCthRzlwVFFsLzQxS1BpZ2xMWWRrSno0dUQ2QlR1blFzZjBsSFhh?=
 =?utf-8?B?TlZ3cHF4VFdxSmtaOE1VdVRmR3RDM0paUEZmOXExa0prd3R1L0h4UldxOEtI?=
 =?utf-8?B?T3EyNU5CaEpDc3lTWEFUdGpzZUk0eklnT2FIejBuT0RzZERJWldkbmpVZStv?=
 =?utf-8?B?VGxFQ2RNSHFYcUpJc0p4QU4zTWo4d1RCcWJYdEYrSkRYcyt4NklOSzVXamo4?=
 =?utf-8?B?TDMwK1BuMTYvR2xEUURxZGJPdnNvZDREb1ozSEkrSTNvSFQrSWFLeEVYMWhC?=
 =?utf-8?B?NVBEY0JMdWY5L0k0L2ZuMlVOck5vbGtFc1JZMFVaemF0cXFrNGpsS2RDa042?=
 =?utf-8?B?OE5pMkMyTnBjN05WQS9Rc0d5YUg2MktxK1c5clVVY3JDUWl3dm9DL2ZkU0lK?=
 =?utf-8?B?cjhLeE1QaUh3Sm01dFVma2pYSnF4SlMvcmFZMythUXhDTGtHdG14QjRHK1R3?=
 =?utf-8?B?ZHRUSTltdGkvZWdOR01kQmlFQTNGb1pQYVRaR3ptVW9Xa0lFUk1JRGQyRyt2?=
 =?utf-8?B?ZnhUZ1U5d1BBcndWcm9mTmp5OXZWKzMzTCt4MzZ4VlVRQUtMZE02MTRwQ3RZ?=
 =?utf-8?B?aDdMa25ONFJnNFQ0bmZmL2dFYk4rbGtBemMwbkRwRXB1SVFScjdaL2x2aVFP?=
 =?utf-8?B?ck9ORWRuYUxiMFNuVHVxdTQ0MjJIdzd3VWRhZzZiUmVFRFRDTU5GZjJUT0xs?=
 =?utf-8?B?R1RsT3dqQVN0cVhBZ09rdS9XKzJWN0NNRHZseS9HbTEvakZNMlRoeDNrOCtM?=
 =?utf-8?B?TmwweThqeTE5eWVKUndoUDRVb2FSc0IxZFZYOGhGUzZldW5rTWlmdzFoMW5G?=
 =?utf-8?B?NlBOUkhVSTE5dkhZNkZMRHllRllSMGY5ZkgwV3AvelJKZ3lxaHZKOU9rNU1F?=
 =?utf-8?B?UUF5a2NxblN4a0VwQUN1NDB5L1g0ZWNwTTFsd20yc3dqeXhNN3FSQlMyVzFW?=
 =?utf-8?B?S3JKSlh0M2VwYy90NlhuaThia2M4NFpwWStiQXc1ckhqTUp1M1Y5ejlPQXZn?=
 =?utf-8?B?NEpEVHBJd2hkZ1BlV1ZKcVlQMkUrYWprQVBQMGxRc2JPalpqMnVNci84RHV4?=
 =?utf-8?B?WUJ5dCtXRDJMS2MydTIvSWhLbWJLNWJ4dHZ4WFZQMG01TlMwZDJrcktRWkRv?=
 =?utf-8?B?UU1BT3hsd01zeG92c0x6R2FCYmdvbUp3d2VYanlrU3RiTmhpRUxRb2RoOWh0?=
 =?utf-8?B?aWJ4L1Z3VUZIS1RKMFhMaHdhVFpGSmdqaDFYS1lIanFCWWhsSERIUFhqV1ho?=
 =?utf-8?B?S0xvY3M5cXI1cjY4OUxyMjI1NWN2SHpYTmZjUGdjTmd1QTVTS2ltbzZ5VU8x?=
 =?utf-8?B?RHhVZzVmYmZ6R1RPcjBHUCtjalZnT2ZvMEdTMGpOZHYwZkpzQVp3elRXcVhB?=
 =?utf-8?B?djkxdlpTTHJOdkNURmVKdjltUGpEV2dxcVBnS1kySHNLVUNiWjNRSHp3RGNN?=
 =?utf-8?Q?MvynRPUofJTrhL1+DJeQr2SdC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3041e1-0da3-40c4-540a-08dd7b2c5ed0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:14:25.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tMeavXCLyY5Dx7Vslb3di9XP13JqAyHWqHWeMmci12WilkpEWcJtEZ9i7n85mq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9388



On 11/04/2025 13:04, Ayan Kumar Halder wrote:
> regions.inc is added to hold the common earlyboot MPU regions configuration
NIT: I mentioned this a few times already. Please use imperative mood in commit msg.

> between arm64 and arm32.
> 
> prepare_xen_region, fail_insufficient_regions() will be used by both arm32 and
> arm64. Thus, they have been moved to regions.inc.
> 
> *_PRBAR are moved to arm64/sysregs.h.
> *_PRLAR are moved to regions.inc as they are common between arm32 and arm64.
> 
> Introduce WRITE_SYSREG_ASM to write to the system registers from regions.inc.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


