Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEEB03821
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 09:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042634.1412711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDkn-0001PA-RH; Mon, 14 Jul 2025 07:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042634.1412711; Mon, 14 Jul 2025 07:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubDkn-0001NV-OG; Mon, 14 Jul 2025 07:37:37 +0000
Received: by outflank-mailman (input) for mailman id 1042634;
 Mon, 14 Jul 2025 07:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubDkm-0001NP-Ay
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 07:37:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63ba5a5f-6085-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 09:37:30 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SJ5PPFE4FC9FAB3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 14 Jul
 2025 07:37:24 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 07:37:24 +0000
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
X-Inumbo-ID: 63ba5a5f-6085-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvYpzPfRy32R4T8TNT40geyrafiGwYhWPk4hTkY7PeXT3J6wGtoCuiXJU4Q4Gu++yaaMRXqISvNJZIFXWwPHxiKuuqTVVF44BOuFPyDpk92P/yjfjLBUeKWw1ta+ifBGa+7RUN3TvV3wejVEzygx2xmo7N+KRhugWkmEuV+uAv3d0kluFSssZeVBaIPHvBCrxnWqnS0mCFSYkBuy/ONpe7puC/qpimNRtQI00ObI159POyfbawq+DecYJeQ2/V5YR54bgCUiDALjzwfSzNMT6OBK2L3CrRB2m2r3LQWFtepjpLxqCqiI3UbdCve3NBmVfynz1kDCCwKpjfynKu6dEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAQve6ucj1tk0cDSsciK/KnWsvdAxmV8s5w7EhzdirE=;
 b=Cx/JiNwrvD8WQM37lDevWXf4XqSfibcMGJDPRxxu/OR2AQMXYBvCoth6rvveSBU4N0E6rKzeohPuSEPM1mkfXu+cvXH+bqzx1+DhVPYhiCCAOOFocZip+vWCLLLY1R5zkI5rvutbkl+JB8JYxCVda56dp+jUfy5poRFF9XKEDxGln1wJnvyd+sk4Mjp6APe9Iu9zGp5c9j/gkjk5F0QdtkryZ09WTpTnOjJZ6kwvwToVmFjNbWpqH/171jEquV7LimDVm1MzAcCjLMht/J5IHkzJjUyhE1SmSufRP9o2ZPOPODWPHZkiiTJlC6lpBnsqx9iKSbLil7AykUsOZZ9hyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAQve6ucj1tk0cDSsciK/KnWsvdAxmV8s5w7EhzdirE=;
 b=B+RBWg2a/AaG1lCbfxxpdLUGqJy8OxD4A7FqB+w5eFDU8smQp8sASXGG85rO6UV16Rb3Z4+VPfs6HJiXmmM9cJ6xZJBLyOcchQYxqTTqtqDJ+ASQ7xySkJ0/x6gwN2guasi2LZ70Hhl2qObuWZzDTgPKOysEuff9aQvPFzfoAN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <037ebff1-7e78-4170-a636-989e534dc11a@amd.com>
Date: Mon, 14 Jul 2025 09:37:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
 <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To BL1PR12MB5272.namprd12.prod.outlook.com
 (2603:10b6:208:319::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SJ5PPFE4FC9FAB3:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a912bb9-d3c7-434b-b941-08ddc2a94556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWs1b2JqKzNyRzA0Nkx2MmJXSFIzbGxSSGpSem1KUjVyUm1FUk1HNjZpQXNi?=
 =?utf-8?B?djBQRzN1b2VZMVJRYW5hNDR2NElFdVRyeG1QVm9lcVk4VVpEalQ5OHNGYlFx?=
 =?utf-8?B?TU5zQlNVckduOGJPYzZ1c0JFZjJoZFV1WXR3T0h5MjgyRzRKNzM5U2puczRo?=
 =?utf-8?B?NU1JZGZNZk5BaXpTS0NQQ0NtYzhSZWREVW9uQkpiVkRzdnV2NEVMbElzZkc1?=
 =?utf-8?B?YW5nbGQxR0cxNFVIUFh0L1pZekRNU0tQT0V3K2lXbDFLSkxUOWhzSWcvSEZX?=
 =?utf-8?B?RE9KVzBqSUtDbnRxTHpjemlPZ3VMM2lPck5Kb21ndW9GQ2JvUVFBZCtqMW40?=
 =?utf-8?B?eFlueDhJTmNpZFRBOGtqaThSOUpjeG16cmlNSkZ3SEVrSGQ5QWVPZzluU3lF?=
 =?utf-8?B?WnFEaExpMnd6aEhEdk5wN1g0aXB1YTRRdTFGU0xrYWMrN3Y5TUVuU0w0alkv?=
 =?utf-8?B?bE13K3pLc0dyM050QjdqdE1tTHp0eW40SmRuZmdqalQzaHV2T2xBZ1U3Z2pv?=
 =?utf-8?B?RDhydmNmK2RYTWlTNkcxa05STWJTaDVzN1dBL3NGSTNjYnJHaUdlZTRKN05k?=
 =?utf-8?B?Nm94NE5iSjA3TEYrWklsU2habW1DbVVxSXkwWGNqbktyK3NzSzErNW54WTVq?=
 =?utf-8?B?c1Eyc2hkQy9MazNyRWl3bXN5U3VzZVdEdlBmUVVFUnhNOG4rZjhzRFk0SFZG?=
 =?utf-8?B?U0c2RUlSREJndDNoYWQyeFY1ajg4WmdUbzhUNGQzSyswdEc4UHUwVTR5bE9W?=
 =?utf-8?B?QWR0N2U4dGN6TmV1REFCeXVNWUhYb09WWHk5cGhZbW1QZnNYU0JES2EvMkpi?=
 =?utf-8?B?Wnk4eUNDeG5heHNGb0xSNkNmUlhJOVJ1ZENtTUU0a2U0bG1yekd5YS9rUHJ3?=
 =?utf-8?B?YzM4NE1PMDJTeWtRWjdYeTVtL0l4alhvblFwTkFOVW8wQ3RWUUZpcHFMeVla?=
 =?utf-8?B?SGFrZHEycEo2SmRLOGZEMnZBMkFyV2dUemVKdDczS0xycVNWSzI1SGdrc0FR?=
 =?utf-8?B?Q3pSdUZEWVdTZWFNYUlsN241UHJkTDU4K2twZ0swc21odktuaSt3YjRGS0w0?=
 =?utf-8?B?VFpkYmsrYkdIeGVBQWM3R1B6b0MvcHdiREJURVZzMFh4bmhkN2YwN3NpWUJF?=
 =?utf-8?B?RkpYTjBzTVRpdUplSVV4THRiblZFM29ZWmhJajE3TG9vUFQyUWhDWFRrZUQ5?=
 =?utf-8?B?dDVVWjNPdTEvSHIxZng1V1lMc2RyOFBURTRQMFpxS2FzUGRaRURqNGhIdWQw?=
 =?utf-8?B?TkpBRzlBZ3prMG5VMDRKZG9uOE9UQnUzaVlONGZjT0hsalpCRnM2Ky8rZmh6?=
 =?utf-8?B?c0xDWUR4bHUvY0o4S3lFaWkrcFcxalV5cEwvbFJOS01WblUwK3piM213V2xt?=
 =?utf-8?B?cEQwOHZyVCtkNjd5YkVWWUtWSnNMZURlU0ZaL2tIaS91RFExL0VyQlpteHo2?=
 =?utf-8?B?ZS9xRlhISzdVOWMxcjFUY2ZMd1RrYkN6STQ1SkNaYi93aElZVGkxSDlkQ25N?=
 =?utf-8?B?Sis0Y1hWMUdDV09jYy9nSUZpalhwdXZncGpOOTdjSW5VeGFuaXpQYWdHWUkr?=
 =?utf-8?B?UFB1dlI0U0p3aDF3MW1HUzFYRkZRcXVYSldTU2ZXSWFpSS9xU0l1ZkdSUFRl?=
 =?utf-8?B?eDVZNFJSY3FjdmN2bHlqZ1dCV3MxUHhFTUoySjZPUXRVZ1JPMWRrQUhXVEVi?=
 =?utf-8?B?cDBOdEVrZ2FpWStybDNxc29QR2twV3gybGpud1dCQnZVb1QxZVJaQkhUV3ZN?=
 =?utf-8?B?clhKdndwWkxab2s0SkY4MGdsYzJlTkNobE8wWkRwNndOamxRaVVId29SR2Rq?=
 =?utf-8?B?S2daQkh6QkhnNjdrckk5R2RpZ05lckt5QldGZTNPemtMV2JwZDFDSnhYVExP?=
 =?utf-8?B?d1o1bEgxaVNaTGJwclVVYjg4cWdIdzcydUV0VzZUZWZHK2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlJaRzhqWG9lN2FXVnhlOWc2TmlvN1FxMk5ET2lRMzQzNlk0bnV1N3h3R3VH?=
 =?utf-8?B?aEE1WTQvYjJ6WTE1dmwwRUhSWlBZWHpLYmV2ZjB5TjB6THVZY3Zuc25lOUh2?=
 =?utf-8?B?WDh3Q0liK0U2eFhvUjM3QmVUSXYrR00ycjNWSU1DbU1ITXphY3gzY1pQL0Q0?=
 =?utf-8?B?TmcxVlhGQndnTHZXa0RkUHVLR2tsOEZpVjJMZjN6MndUZU9LakZQV1VCanBs?=
 =?utf-8?B?Z1VwMFB5NlA0NjhIU0FFeWNJWmo4T0kvS3ZuLzRiNVFlTkRYVHl3MkxmRzlJ?=
 =?utf-8?B?bkxHZUtEV0d4NXlzcU5pMlBNakV4OEw0NWZoMWliRkZvdkV6a2o1MzZOSUs3?=
 =?utf-8?B?aGZOSVdWREdJRmVmK0g2ZThwcFpoVDFOOE04WFRTSncyRXRZaC8vTkNhVTdQ?=
 =?utf-8?B?VkNHWnBKN3FIS2NUanRwQ1Q1bk1IWithUGowOE5vNk9tSlREVmxXKzFrN2hB?=
 =?utf-8?B?MkNPTlovci9VbXM2L0NFVGM5THlMS1krZGlDak9VSGNJSFhJc3AzOW94SFlE?=
 =?utf-8?B?K3B4QSs3RENDTlhUNExOMXNhWS8vcThLcVFCajgyU2hXTmh3ZnNycFBpdFB5?=
 =?utf-8?B?K3M0cndCb2NOMVQ1LzZ4UEZkZk1JanZkMFR1Ty9kWUcwb3BXVGt3N1VMcWRW?=
 =?utf-8?B?VUZSc1FzL2UrWEhpTGdRd01jUkR4Sms4TDcwSDEvTUpWVW9rcGM5SWt2WURs?=
 =?utf-8?B?RElETXRobllTMkc2R0crdzZYUElPVCtZVWJDekZ4ZHlvQXlTTmtIOC82SEpa?=
 =?utf-8?B?SHNqVXR2c04weE5SQ0huMzNmU1VFNGQ4VXlGM2FoanlMcnRFM2tTNXJROFhl?=
 =?utf-8?B?enFhcnJkd2xUWHhFOCtTUUV2allhMjlNWEZhc2w4VzV2OXF3aE9QWTRJUkRS?=
 =?utf-8?B?MVlDMzI4UWdNRlFRbXdGZERuQ2RiZldscmNRb1AvWFplTDVWNG9jOXUzY0tV?=
 =?utf-8?B?VFlQY1dETmFYSnI3eVBXSTFGUXozbUl3NUxQUUtuNCs5bjhtcS94UFhuYXhr?=
 =?utf-8?B?SVdMcE51WVVrR2dYQ25ieVR6cDNUNU9JMXVFb09RYXVwVWVXT3pyQlNyQmsx?=
 =?utf-8?B?M2NRcGMxWVArWm5PK1FjRUJnQ0djQkEvbU9IaU10SjlYMnZ0UHV0QXdwSlJv?=
 =?utf-8?B?c0p5S0lVNHlSZjU2UjRONDAyd2h4emc0UldmNjEwSktweGVWT3dCZ0xzTEhU?=
 =?utf-8?B?VkRKWEpzQ0ZQNFN1QVptU2wyWnlDak5FM0ZPMWMxaHpqbFNweUdKakE1WmdH?=
 =?utf-8?B?dTBzV0Y4UW5qdU5pK3dVSW1zWm9ETFVJRjYwblhVd2dURmJqU2I3Tjk0UzFq?=
 =?utf-8?B?Q25GdzdGRTczYmV5ZStoSlhNZnVyZ3B2Nit4MWxQSzRqeWd5ODJPMHltby9B?=
 =?utf-8?B?cDZjTTlxQzBCZS85TmNpK1ZYaGd0RzFMMlJPQldMUE9NLzcrZTF0aGFPSFlw?=
 =?utf-8?B?NXpSWWdSM0F2UkRybmovazFxUDhFbzlWZUJMa0w0dVNSaHg3YUJBQTkwelRm?=
 =?utf-8?B?TS81MlVmQmNZK0FZSjJBZEVmOTIyUHd5Mk53c1dsRGppY3A1RUZQbTNQMGtW?=
 =?utf-8?B?V24ydlY5TTZxeE9CMis4OC9VNEE2dlZZdk9OeFowOUZnQjJ0ckZ4RUxzTGN6?=
 =?utf-8?B?Uml1aU9WMjRwUkFhU0s0NU9QQTV3ZmpzQW5iY0g1Qm1sc0NkWDFLaDN6T2FL?=
 =?utf-8?B?Z0dDVXY0Tk5uRzZuaUJVZit2SWpBOSttbE82NWtudU5zTGZJMTAwTGk4RjBR?=
 =?utf-8?B?TWc2a1JOMFFMa2NHeUpjc0lSaGRteWRGbjMzaEZvK1BZVnZZeWhzTjBTYmtD?=
 =?utf-8?B?QndxblN4NHZjb0tpd3JMWmVsSTB0TmZRTVlPeGNydmtvMENhUEx1NllmMTlS?=
 =?utf-8?B?MHhQb2s5ZW9Bc3J2UzlDeTNXN0tRa3V0UFNIM215NTJVVGdiMkRBTjYxVGZm?=
 =?utf-8?B?d09kSGVoejNHd0lKMVo3Z0Npbk1EVzBiNHArM2U1YnRLNjN3WTV4b0pDbEgr?=
 =?utf-8?B?dVMzRVQyMHVkSk1nUTlpeWdQZ3BRNGdDZ3M4N1hnalEzNk11OHRsc283bExU?=
 =?utf-8?B?VTBTZmN1NFVXM3ZaYzFPQldxNVpCTDE4cGZFTkVmOWJqUEtnVHY1TlBkUUR0?=
 =?utf-8?Q?FyhZCIgIyLVdSCUBnDjgJqDm9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a912bb9-d3c7-434b-b941-08ddc2a94556
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 07:37:23.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xl4DSQaXy/AfoQ1ppPbzw2lqvC4/wCYWirrIsKRlovTEfYCe0VtpzcEhDLMAcZpo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE4FC9FAB3



On 12/07/2025 12:29, Julien Grall wrote:
> Hi Michal,
> 
> On 04/07/2025 08:54, Michal Orzel wrote:
>> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
>> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
>> sense to keep the two loops iterating over all the memory banks.
> 
> I saw this was already committed. But I have a question. Wouldn't the 
> compiler be able to optimize and remove the loops? Asking because we are 
> trying to limit the number of #ifdef in the code hence why we have stubs.
Before submitting a patch I did disassembled init_pdx() with and without my
patch and in the latter case the compiler did not optimize out the loops.

~Michal


