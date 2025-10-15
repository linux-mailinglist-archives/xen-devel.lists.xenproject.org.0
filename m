Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92343BDED39
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143611.1477303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rL-0002vH-Lv; Wed, 15 Oct 2025 13:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143611.1477303; Wed, 15 Oct 2025 13:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rL-0002sm-I6; Wed, 15 Oct 2025 13:48:07 +0000
Received: by outflank-mailman (input) for mailman id 1143611;
 Wed, 15 Oct 2025 13:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rJ-0002AF-ST
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:05 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f3372a-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:48:05 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:48:03 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:48:03 +0000
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
X-Inumbo-ID: 92f3372a-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBmCzwRurlPgCTPrxdWfalX9AMD34lhya/slimtvZMrPuC/kWApROARAPYDqg08kYQx11UakbCmd+DVng9P0byep24LA2tRWo30znPB4Gjrk0SSw43tXJhTylKwLlIyC3UGzH03frLre8/SnG5++k47Ef7dLmnPZFkNSTqa72ZRKb3qRk3DscHBDO2mS0ZClOnlzsRSzYcZv+Q5It95nntCiaLJrbgd8NUoOlgQ/ch5/0MAIwT0eFl44rVva/RtKLay15X5gBZMzO0eYr1W4fPLczgC4F7m4RYuCY9KKaSinOBzKb1JY4fr9RAuMBII9Up3Zni3Lx/c/d8oyL4unOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrHEmkaFLq+k4yjYl1wqBoURqxns2g5ZgZNwc8LrECs=;
 b=jhvPlop+nWSTPsIqXRx835a6yBU9obCaRtge8y4xwe+e7TSz4gi9BIT2NtJPb4/2urdedp4edzlJjEBkafxxb5biEv/NOOpJxFqrRFt+mqJwRXbnUVudu2hnD0mYPus0kBFynMFcQyWlvudo0OK46c4mgYS0BmqP1ttJC/nuRBre5hydBGw9lKW/WoQc3AO6td/HYP3jLTEOGMVRdP3Aro12+4OB/hK9zp/S11uz708Z/WCCP0mHnADT/zzoW5DdyU5BNdy8xYyULdeU1XCeo4r6nmi/GVx9jf08iLRB31E6D0T6IVJfFSsUwfPsmavDLQuzUJyJWEEaxijlYMtWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrHEmkaFLq+k4yjYl1wqBoURqxns2g5ZgZNwc8LrECs=;
 b=xx2pg7hvwpeLErDd0Qb6Ox+m5LtFmN4tC3+d5e+KarGGX6XXKWoOoJuziyAjO5cABXmVw881PFJRjGZ9jJV1/J0BqqUAIa3L2Esg4sraBUg6imqRW2Tk2ihjDa1AIo16UsMXLJYrX+1+Xhiwhzkk7WEelAdRGOzXpCqFDUvhe2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH for-4.21 3/6] tools/xl: check return of json_object_object_add()
Date: Wed, 15 Oct 2025 15:40:40 +0200
Message-ID: <20251015134043.72316-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36c::7) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 458125ae-9bdd-46e9-206c-08de0bf17663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWkyZUpyY1kxbkxxSCtIRVBGQngxclUrU2lYcjFvQTJ2cXY1QUpBTy90SkVD?=
 =?utf-8?B?bzJSeXBEVVJlWEtmZS9WT3FISm1BY252bmN2Mk9RbFVLdnRUT3lqUE16Rmsr?=
 =?utf-8?B?aml2Y3BselNaWEEvczJEQ1BOQWlzM2tSelZGNnVkWk0wNHo3ZUl0dDFpU29r?=
 =?utf-8?B?Y1NuQi91eDk1V3hEdkpFdVgyY3RhYi9tSElDNGQxUnZxTm13V3g2RWM2RzBM?=
 =?utf-8?B?ZEg4NjVtOWlJTmRvSlhQZzhNTHVKQ1R0R3IyUEhDQTRCbVFtZDJjYWsrd28w?=
 =?utf-8?B?QkdOMTdUOW9YOGt6VHFTRWNRK1lYdkNUNThEQzU4THRSSm15T1lLekpqbWU2?=
 =?utf-8?B?cjVkZlYvS0NOOXEvTjBKaEJ2cldxMm4rUGtqU0owaWdwbFlSZkxKV3hTeW5K?=
 =?utf-8?B?VnE5NnhOQ1Z5UENoWENZRnBFeVlqMEJTYnJ2aDgzQXFVdHBEWno1N2Q5R1U1?=
 =?utf-8?B?cUthWVZuYzUyNXFLWkx2ZTg2ZldCckFneFdORGNrdmUwa2I0bm5WZm9RTjY0?=
 =?utf-8?B?ZFlMUWdJQzNkVk14azdoZG1Ld2EzK3ZvbldCTkxZUlRUVUVPOVYranZVVCs1?=
 =?utf-8?B?NkFNektyL3ZMWlVHU2UxWit6eSsxbThRTnBIYy9TT3d4U2gyTFhkSEtlSmgv?=
 =?utf-8?B?S3IyODZNM0pjdHhoVmVodURGTlJFN0hJT3RvM3ExeEFHUmRRWFBRbSt3QUgz?=
 =?utf-8?B?czVXekhhWlNQUzdBYVlReEdUNUFuSTZTUlRFejQxTW82Sjk2TE1UTTgzbFZz?=
 =?utf-8?B?aXlrZ1cwZGRxYi85NXRDTmdzMGt1UEhsdnVNYTI0RTducFh2V3hSaldUSGJJ?=
 =?utf-8?B?Y2pobVZQQ0d4aWRleVloNmxVdzFwcWxYaUNrMnJkWWlqckF1a1dMaWRtdkpt?=
 =?utf-8?B?MGFENUdTS3pLKy9NWXlXT2xQcGR3NTU3VlB5TGhMNjNZVWRnVUhZSlBEU0lN?=
 =?utf-8?B?UVZwaFNuQ3NBekxscnViS1NnQUVhemNybEoxN1cyR0hMOUdyNVJHaHlaK2FF?=
 =?utf-8?B?S25SRXNGRnRIZTc2dmpmOWNPRktNajFZOTVYYTNqRDJvbjYyUm9Lem1iWXcx?=
 =?utf-8?B?YmJ5aXRCTldVY05TdHQ5U1BXcXVSdnVMQzZyNlo0NGh0RkUzVDRSTGZUNm1J?=
 =?utf-8?B?LzlPNHJaamJ1dForQUJDT2EwNWZ2eURsQXIzN0h0aU8wTUdqTzNvbnkyOHZP?=
 =?utf-8?B?N2hWb1p0NUtJU0lSSjE4L1pMZU9DSHNMV3MzRE5CZnBobmJZOU1WbDJyQzZP?=
 =?utf-8?B?N29XdTNtQ1N6NWgrSmVkMHFGcXpGZ1hCNnFETUNta0RxTFZJbzdLNkd5RDZ5?=
 =?utf-8?B?RndiT09GMDgwSnc2RnU5YjN1RE91eThWUjJqUlBVOFBjbENmUFFJVWV3NnV3?=
 =?utf-8?B?VkdFK015RXhYbEFyKzExZnFxd0VwZktibDJKVlRCN2tYODNFQTNkK2lJV1hL?=
 =?utf-8?B?VjBrQTVkbDFQT1ZEOENNRXB5SmZpQVorMEhsL29rNXQrZmVWUFlvUFdXeVBW?=
 =?utf-8?B?bTFTK3R3VkZsd3VHeHZUTWFGUXdmS3Q4YWpiUHkyUnBZb01pRWdBK0JoUHg0?=
 =?utf-8?B?SUkwWTNrc00wZ2RRREZ6ZEg0L0RyeEFnQ28zZERtTUp4UzFRSUdjSmd3Rlcr?=
 =?utf-8?B?cHozcWd6NmhUeFhJWG1mU3E1cTZ6bldPUUw3eHZIVFRoMVFLcDVndTVmdnJ6?=
 =?utf-8?B?YnplNU8rZHlJOWlndUxrVmJ3d2pweTcyYXRITU5tRHd2eGFYNFJsbXM2N1k2?=
 =?utf-8?B?MDNXZ1NoNUVtT1lIWktldTBCb09FUnp0RHpYUDYyWVFZVlhHZVZtUjE2cUp3?=
 =?utf-8?B?eHhIaTk5aGVYaHcxNWV3cERVOTc3clBMcWhaMUU5R0tFaG4rWHJDYXgvVHpY?=
 =?utf-8?B?dU0vdzI2clBOM3VidFFnNTNNQmozQU5ZWW9QcG1kcnZ6SUZsYW4ycTIwTWNw?=
 =?utf-8?Q?PNJyAlFPu8YiU9OmY7h0mtkyTr1MWFJE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXcyOHJydndPTmRCSlpqaVMyK0FZNm9JajVTSndqWVRIQnJpbll0enY3OFhL?=
 =?utf-8?B?V3FwOSszbERJL2pmRGg4VDBVOXBOc3RJMTJvL2RMVWxVQ2k2eUlRV1ZVVUgy?=
 =?utf-8?B?RnUzZExsK1doU0pyUEV2S01IbHJLQkFSZ1dvWnNnOFdzTHFxNW85QzdsTnZ4?=
 =?utf-8?B?SjJKQWt3VDBaRVNlMWlFbVQ1K01leDZJUmxqQVoyR0F3Q2t0a3R2d3VhWVhn?=
 =?utf-8?B?T3hoMmYzaHozeGpKbjNKck5NTGxhdStGUUhRT2JEZlFHL0pxVHRLc1UvN05v?=
 =?utf-8?B?NXpLMEtHUlYrU0w2Wk9WRFBESUdmWU02MEdrR3ZWUEVZWHdYSHlXdmhIUVFR?=
 =?utf-8?B?K0RTVjZ1WFRRSWg5WjVXaFk0T2o3Yk9YSXhIZVd5RHlLU0tUQVE2eGZxdlFH?=
 =?utf-8?B?OWlyT2NuYWxqNWMxVEk5cTVRMlNHMnIwakdxKzhaQVVpU3FsZ2RGUHVVSHho?=
 =?utf-8?B?Yy9DdUpyU2ZJZ2FXMHVXTzZ5V2VTdHZSalN6bnpEZTJab29pUnZKdVJPNzQz?=
 =?utf-8?B?VHVnTElZMDlCSVJ0aHhjVGcrSWtlR0tEQm5pSGtMM2UweGF0UUNNUTA4QmxT?=
 =?utf-8?B?VUUzaEoxUUYwMUZuYkQxZmJmNmlpTkZBTzg3S2RwSmFUc0l3V2I5UmRtOElI?=
 =?utf-8?B?K1hYalg3RUpTWXIwYXJETjJsM3J6SGYzUm80UitZSTNJbmp0cTV3Zk5Gb2wy?=
 =?utf-8?B?RDVBTitZcVk3SXNQNmQrUmZiUldETDlFWVJrdDZUcytaZ0Nvd0x5UnlISHND?=
 =?utf-8?B?Tk12ZkszWFBjeHpCZ0RLTXZPU2pCNnk2N1hZRVBpeDZESDlXL29ESGVCemVu?=
 =?utf-8?B?T3J3d2x5SEd0RlF4NWFnZUIwYWw2QUppbGlORzdiOW9zRTZMSFpHQld6R2Nu?=
 =?utf-8?B?dVpSNWhydjNNemdUaE4rRVlqVFRVWHhKc3NxUG9uanZYbFRRaWNLcTF5RldF?=
 =?utf-8?B?aTZPYnU1K041SFFvY2ZneXN4OFF6VERDTXBER1NrMXpLTXFkZXFERXZRcm40?=
 =?utf-8?B?aDBab3dNK21STUpqYzVQOGZWZDlhWngrdXZ5VjFIWFRZa1lWYmFsbytRREF3?=
 =?utf-8?B?VXBLZXVycS9JRTFUeWErRk9UaVhxL0QrZC9lRm0xcG1ya1J0aHVicGJ3UjN4?=
 =?utf-8?B?aG1RRVMrQTJYeFpLVjJ4Rnc3dzk0c0NrM1lRMk04YUhYWkprdDYzcXdxTW5X?=
 =?utf-8?B?ejByNkN1em10UnZPSnlKZkNkUmpTTnN3S0haWWw1T1BvaWVjWWgya3BSYldU?=
 =?utf-8?B?MFc4K2JMd2Erc05kS2xNM2REU0J4K3U1ampqZ3NVNm83WHF3cUxQb2MvY1J6?=
 =?utf-8?B?RFlKTnJTVFNqcnJ1c2h6dmxPOXFTb0dOM2d6NHFJRzVpUzlxOGxYK1VUWDZs?=
 =?utf-8?B?eGFpWnVTUUo3Y3AxdWdWbmtKbndNTzVOYkxMU01IUEZ5Ym85dTRGcWY4Y1NE?=
 =?utf-8?B?QkVQZjVLd0hYMGdmNW1Yb3k3UHRNMy8xQmFhMEl3SlJBajQ0QmRGRTJNOVFQ?=
 =?utf-8?B?cnNHZEJ6K3R1aitSWnRVVmpYU3ZzcklmQjFjTnRGeUJtQkFtMmNyYWgwK3U5?=
 =?utf-8?B?Q0R0eGsySHFWNFQ0RTVjMGc0VHpoVktaSjMrNFZaSEEyS2Q1MHFoWmdDdFFw?=
 =?utf-8?B?eDU5TFNoRjhaU2FvQmVBTzNsV0F6c2ZReEJBSXBncWRPU2RzSnFiL0o1TUk1?=
 =?utf-8?B?dzR3YmhBVENDd1NGd0FkV1M2MjYxaC8yRFQ1R2ZCWFNPVklseGFRRVZsRFMw?=
 =?utf-8?B?dmNxZ3BITTdaSXFpZWE4THRwcWpRK3Zudnd5cTZJM1FOblFoRlVkdXNnUzdG?=
 =?utf-8?B?UkJUSXlHcmRsc0NrMSt1NHFDWEQ1WHUxZ21qNVFpZmxHK3VjUVpSVUxxQlEx?=
 =?utf-8?B?U1RHSGk2Ukt5Q0oybSsxNUhCaEc5WjRmYnlydlU4aFVEaHpEV2tXZTZHTC9h?=
 =?utf-8?B?RGFmd1laQVFMYVR1bGNjanFPWE5LVi95SDBQR04rT2lTVWxsWVgxTDU3cHFC?=
 =?utf-8?B?cGpaMCsrNHBBVGpsNmZ1eG5QcnU5Tmhyd3NmQjY1b1lMaTg3MUVwNlczb0ZU?=
 =?utf-8?B?czRRTjU1TDhUMExWc1Q0eGRVaXU4ZDhPVUxSQUpIRDJvUnFLL0lEQ0QwbXlC?=
 =?utf-8?Q?ad0gtVIh3DvaDT4wgB5C4iaPX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458125ae-9bdd-46e9-206c-08de0bf17663
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:48:03.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNTU1AgjlsaT0kW3oIy5iOrb0NBE9ePDy7frys/a7zLMJdMrggZeuLsSrn2L1fcK9+Bx9zuAfuOCxDRDeZaGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

Check the return codes of json_object_object_add() calls in
printf_info_one_json().

Reported by XenServer internal Coverity instance.

Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/xl/xl_info.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 777ff2c64294..2048669abbd4 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -69,7 +69,7 @@ static int printf_info_one_json(json_object **jso_r, int domid,
     json_object *jso_config = NULL;
     enum json_tokener_error error = json_tokener_success;
     char *s = NULL;
-    int r = EXIT_FAILURE;
+    int r = EXIT_FAILURE, rc;
 
     s = libxl_domain_config_to_json(ctx, d_config);
     jso_config = json_tokener_parse_verbose(s, &error);
@@ -82,12 +82,17 @@ static int printf_info_one_json(json_object **jso_r, int domid,
 
     jso = json_object_new_object();
     if (domid != -1)
-        json_object_object_add(jso, "domid", json_object_new_int(domid));
+        rc = json_object_object_add(jso, "domid", json_object_new_int(domid));
     else
-        json_object_object_add(jso, "domid", json_object_new_null());
+        rc = json_object_object_add(jso, "domid", json_object_new_null());
+    if (rc)
+        goto out;
+
 
+    rc = json_object_object_add(jso, "config", jso_config);
+    if (rc)
+        goto out;
 
-    json_object_object_add(jso, "config", jso_config);
     jso_config = NULL;
 
     *jso_r = jso;
-- 
2.51.0


