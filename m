Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB0FBF6F7F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147313.1479642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBD2R-0004u7-46; Tue, 21 Oct 2025 14:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147313.1479642; Tue, 21 Oct 2025 14:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBD2R-0004sh-0Z; Tue, 21 Oct 2025 14:08:35 +0000
Received: by outflank-mailman (input) for mailman id 1147313;
 Tue, 21 Oct 2025 14:08:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBD2Q-0004sa-5R
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:08:34 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1a6380-ae87-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 16:08:29 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH5PR03MB7984.namprd03.prod.outlook.com (2603:10b6:610:215::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 14:08:23 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 14:08:23 +0000
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
X-Inumbo-ID: 6b1a6380-ae87-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2NDB0BBUou1FlDeRl0oB9qIhj4AafKB1B75jw7k6nIwPoywF7e4pIWTLstcyj11z1Ok1K4xogobqJt+vkOStCg0iHEjvJWoeiG9iN9NysKU9xVjRBcSMLtkE9CPyb0WrSGeGzRkxFe+2r5FsHE5f97rTzdkwon/C9obX0XMVlSR3NduDIw/fHXZ9obUQt9zciTPYo6TLibYjpV+X8S7/a2IOI6yKq76jt68Jj5Z9HuStEnjuQRiIRQB21YVyN6LwvQbZntlWH9iBKhNDihLiuq8qmRVvnLCtMKqVkznGpm+5FOvLfbyiqUW1JjL5o8BxV9pbFt7MOvtZnF6rNtiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtkUEkELIOA3Q/vj/pSp+bGE2mQzeFFvzy5eb0dweg0=;
 b=m3V0edd5/b9XI8ORZ5VSqFOU514MyPWsjLTNPJygjHsH6a3IN6RjRutk6AxlUNGGPU6tKmGf/u1s8kOUPbcmq9+1+KtHhn1+8sFwlOBIcOkJkanaJ9gAfVaV/qgd283xljkl1b2yGh3Dffkmu3DfUve5bRGxzrlCqJReNx07MBCaWusuXwczflPAfcpg4SRgOpoY6tmlWvluknFej67eNJJUJwjeZH0JVC5pt6Jqs0pNwKaSYWDCufkaUE1FHG91nPIVg1Ft4Y+JdH/1IjCeg0//u6zJm9v8Gt9lHV2joWUg+Ionw7/YGmJ+ByrWPc/bezxxGaB37Na8vn7cT05eIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtkUEkELIOA3Q/vj/pSp+bGE2mQzeFFvzy5eb0dweg0=;
 b=hhZjgh6GMCjF69+XDzOUEopUXrImDIvkWq6+NSFzIP1TJML7pVlKrNIB0sT0VxHLcRrIp/8LHXEvoFx3eUEWGGIlqSJk1hTCZjBx8PtXyfEetz2lj7my0ru1UBHKeQjJxxJVWcLMlTBAHn7h92PZ3N7e4nNUZBQXQornwfH1NSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 15:08:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 3/9] x86/HPET: replace
 handle_hpet_broadcast()'s on-stack cpumask_t
Message-ID: <aPeT0h-S7FVgk3TZ@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com>
X-ClientProxiedBy: PR1P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::7) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH5PR03MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e954ef-d926-4a4e-8284-08de10ab4beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjNNWW1tbUJQL1ZQUEhYQ0o4SEVoZjhrYk9Ncjd5dWo4SWxmaHkweTV3RkZZ?=
 =?utf-8?B?bUJ6YUZUb1JkVlpTcEZmTGtLcW55M1lPdFNIMGxGcWtYc0dVVFBsbWFvcC81?=
 =?utf-8?B?Mko3T2FkQjZGWUFkY3RHMW11UDNvQnU5KzkxR01pVkRoYVl1TTAxL3hUZklW?=
 =?utf-8?B?WHlRd2JQQkVnYjBvZnE0R2J2QjNSZktqcUxtWmdxTUt0VzQrdEU1QW9nK2p5?=
 =?utf-8?B?S2g3NXFWS2xIM0NHZUxyamVkdTB4MTBqVkQyclE2cEw1S0dBcGw5NzJjelM3?=
 =?utf-8?B?SHpnRTVManlmTURvSG1LeGQ4OHhUbXh1NkFsMUFPazVpcTNyUk5WZi9ydzda?=
 =?utf-8?B?bnlHSzZsUDBaTkNoOHA0bHQ4c01FS0FPNkg5bnNSUXFCYXovSERsbWxWZkVj?=
 =?utf-8?B?SUdDRlk3VXpOeXpUT05uWDlURWliNDdPcjZVc3BpZW43MkxBYXNSN25PcUJL?=
 =?utf-8?B?QXZwcEdiYkZ3YlRCcTBGYnFpdVB3NzdGZGlXYnhiTzE0MjVkakx5UWFMOXdl?=
 =?utf-8?B?NDVNQTVnTGUyZkdickdLZGxzYmpoTmdPRysxcTB6UXcwemhyaWpLbks3Qmlu?=
 =?utf-8?B?ZFZKTzdUVmdVYlpzeVhKbCt5STFpdStKVjZVOVBVQWVhTlVESXBPY28wTEV0?=
 =?utf-8?B?dmNvK1MxSUFtWFVFaGRCc0lMNE9pbzZEWTNVb25TY3dmYXR1K0hDeWZBdDh2?=
 =?utf-8?B?VHBPcXhOVjVPSGVtc2NqMmJXbHJjWWpRT2pNb3JpNC9SSWlHQXFBY2pGVm1K?=
 =?utf-8?B?K1RkOEVpaVVSOUtSY21MeTE5ZTFmQ0FzS3cyMU1TS2NjNmh3ci9FdGNyL2lt?=
 =?utf-8?B?dUpWbXdJTHMvZy85WXdWaG9Hd29JMEdrVkFTTUJRclc2Uk5SdVFTbkphRmZk?=
 =?utf-8?B?QTh6cjE4amJIS0Z3dkw3RnNLblBxbHZpTVd0ZnVja0pVdSt0N3lLcjNoUG1P?=
 =?utf-8?B?SnJFZElQYjYzY0ttQkF6VEg1bm1NR1lvbFBQTzN2S3FIb2oySDNrTVBGV25s?=
 =?utf-8?B?ZU9uNVhBaGtRM1dXZFVHSDRzN2tUZG5jeFBObmU5YjcxNS8rNXIzcmhabDJl?=
 =?utf-8?B?TjgrMmI4UlhMU2pvcXorTUg5elIzWWdSVVloYm45V3pHU0hkWVRrVWtUUHFS?=
 =?utf-8?B?cm42VFY0WldIRUZaR0h0TlZ3K0tvbGlVa1kwVUQ5ODBBMU9tOW85a0hqNENY?=
 =?utf-8?B?NitvNThwc2xoa3ExTDZIZ29DeGxtWU9KNEZkUkRrVFBJQUxpRFZGVUUweUNw?=
 =?utf-8?B?MDFURUdDWlc0ZlZXMUZpeThvbXAzTW0xVExhS1V2clJwb1p6RVlDM01CR1Fq?=
 =?utf-8?B?ajJHdkFQZXhqL2NaRWtQUU5Tc3BpOWFnSkZDaXlqVllxUlQvVG52bDFvWkdk?=
 =?utf-8?B?dUZzQ3loeGNQUE90RlJndEEyZTNBL3UvRjE4QWZtVWI5RUpOUkdRQVBESFJI?=
 =?utf-8?B?RExTcGR0aEdlbVE1VHIxZnZKRmdHZXFBcGo0UmxFUWtsenkwVkFJZUFWY3N1?=
 =?utf-8?B?K0ZzNG8wWExKVVhNVW5QTU9hZWVqYUNJSVlJemlzVXdvUTc5OEE2aW1Xdmpk?=
 =?utf-8?B?V2FyV21ISmxHdDRTdlZqY3ltbm1saktFWmdDRHhQWXRZRlJ5U1AyNWZ1Y2Jy?=
 =?utf-8?B?TXhTNjdNMko1T2JIWnI3TktpVGdObVAwVUQ3dStwWVllcWtsbCt0M1JZRmwy?=
 =?utf-8?B?TTlBeXZGcGJSSkxyY3ZmYjVWQ1dHZVFaNnVpRnloK25YWlVHS29ySEljbEI5?=
 =?utf-8?B?Z2hpQ0dkRFE3Wk5pc0Y3VTlLaDlsZFJKVW84NFB2MmtDbGRlTStBRmx1cnQ2?=
 =?utf-8?B?WmlxVFRRanZuSjVLT28vVXFtdHVXL2RSNnpLUnQwRGt1bytmZzVNQnRvMVJh?=
 =?utf-8?B?SkZYakNRWm1rTnZMRmt2NkxFUS84VXJGcC9IRGQzVGNRdjN2dzNxQzRsV0ZQ?=
 =?utf-8?Q?T6Eutkr1oru1rIoYWjC/C3oZA7xoZ/DL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2p5aEYxWHNFdlNhZFJNZFFKNzZTY2RmTDJCUTBPRVE1bDE5ZnhHZXVjdUNY?=
 =?utf-8?B?WHhsZ3BQNkg3YzNMVjgwY2NLcGIxTHdIMWRmcktjUFhhQUZnVHQ3cVhOK2F6?=
 =?utf-8?B?ekVMSWVKSXozc3ZWQ1VNS2ZZMTdJWjNGN1BySjc0Z0JhQXdPL2RZTkZCV2Jh?=
 =?utf-8?B?TUh1R3o0Q2FTYnBJVldmZ0crTU5QYVNsU2FPZEh3aVkvVWNmSXBvb0I5YlNL?=
 =?utf-8?B?SC9tM08rMnFXZmhGNEZ3aUVrMlhhRDF0UWtRWWlxeXUvYWlzc2F4cEc2V2lr?=
 =?utf-8?B?ZDF1V3I3M1UyODFkUGN3UjhyY0NVNy9ZbzNmWHpUZnlkckphdnJrcWQ0OTd4?=
 =?utf-8?B?Q24rcE95WU1CT001cnFBQzlnUEd2d0JlWUwyeG9lTFNDN0VxeGNGSmFuNFB5?=
 =?utf-8?B?cW1JQTlFMzlXaHEycGxOeTA3bkplWnhrZEMvUUpXMy9OMTNzV1p1MzBTSFdY?=
 =?utf-8?B?dlQyQ0RTNzlDRC82TWlZSGI1b1ZrWVRSdE1BYzlzVTlRaXRWK2FPRmRFTTVs?=
 =?utf-8?B?Zk9HUDVVUFF0Z2t5QWZLSFN1SnVDbjlMS3VMNmx1clVvY2RZYTJCNGVKY0Ro?=
 =?utf-8?B?Ny9MUjM3c3NHdDhTS2pZUjlHbHNLTm5iNUFQc1BXUXFoWTF1TTNYbnFpN1p6?=
 =?utf-8?B?dFExVS9EWXBYMTBKdzNrTmdmbk9jdGpjeVp3VFRHOEVORW1aSndkQy9ueU9D?=
 =?utf-8?B?TUNUOTJOUFJqbGdVZTRzcDB2b2grMG81VFhlaGJjclpvWEVqcUY0Wlk2dlJ0?=
 =?utf-8?B?WkMyVEV3cDdGWEg1T00zKzEwR2w1ZEU1TGZpRk1LM29XaHBSV3dRSUp4bi9y?=
 =?utf-8?B?dzVLczQ1TGw3ckFNT2RDdUx2MzRMUU9BcFJsY1pqS3dBb1NzdUlEazVUYUxI?=
 =?utf-8?B?bFN3VDh2a3hFM0VQQXVEL3UwV2ZZbWlzam1oTXZ6MHRZb0VBdTgvSG5jNWRB?=
 =?utf-8?B?M3dwRlRPQmhWT2Q5UFNSektQU2x0QllmaEN5Qm1aVldpRDk3UkJPbnJyRFRV?=
 =?utf-8?B?Zkx3S1kyL0EwaXp0UitkOTVGc3BIYTByQ29oVkdORFJxTndjQUpvc2h0elFM?=
 =?utf-8?B?bUxMVCtUYjFzVENkNWRyN2FIa1h3aDczWWlNL3RHbXIwQlFCRS9WSW5YMktD?=
 =?utf-8?B?YkQ5QU1MK1JtbjRKZzlxdVZOcmlrWEVnUmkwcmlSVmZXcWU5b0lJVXpZa0pW?=
 =?utf-8?B?VXRXQW1XQUhhcEgwWHJqaHVRTEVWZjBTZy9vb3FIcEhiK29UK1Yyd3hqbzlX?=
 =?utf-8?B?SkdMd2hwZTExOThZNUR1VjBPRW01Y2Vpelg3Vmw2dk1zU2lZa05NK1U5dnlj?=
 =?utf-8?B?V3JvZU05Y29zTk5OVC9tQnVNZ0szTUNtYVNBQUdoRlBWRElpMzQ5eFBHdGJM?=
 =?utf-8?B?aVF4RUtpdlViM3JEZTZjZzJEc3YrTk9YZ2VTVUpLeElkd0l2Ti9RSlJCd2NV?=
 =?utf-8?B?d2NDOXdDVXhmblNVaityTlRjRGhJaWREWDFjaGVjK0hhQzZLRlBneThyaGJt?=
 =?utf-8?B?cGpSeVpoSmQrRnRWWGtYTHJqaTE4a0F6TlhEblpWeGN4d0tLVUtKTlBmclAv?=
 =?utf-8?B?Y2VaR1FrRVpDZFpSUys0YWthL3FiM1NKTGJSSnJLc1BsRlRROHZ2M0VIUnpY?=
 =?utf-8?B?TDI0MUQ5c0lvRjA2ZnI1TjQyaDM5T1N0V0ZYMURPeVY2MWdGL3ZuNnlBU3VU?=
 =?utf-8?B?ckp1Zzk2L2tsVE9pdkUyQ05vY3lCS2FodkdPVTVkczJwS2t6SE9JMkN3UWlM?=
 =?utf-8?B?VktZSG9maCtwbFlMVTJJOWNMTnJDYkM5NW9CZHZTQmx6TmdONFlEMDZvcGh0?=
 =?utf-8?B?OG9hQTRVK3ZmZFNkSW10Unc0ZzRwQ1lXcFE5azA0eHYzcDdMNm96OURLclRN?=
 =?utf-8?B?dVJJOTJqaE9peGpBR0RtN0NJc2lRWkVFb3VHM3JPOTIzUDFpMW1BbHB6MFZi?=
 =?utf-8?B?TGhwa1k3ZDdKb0tFUFFXd2wwbFhvSmZZNk5vY2hmV1hOUVZxMzRDcmdLZHdh?=
 =?utf-8?B?bEtRU0dyekNIekF2a1QzVFVmRUFtKzJxdHl2YVV5K1VMVzBlMjBUQStOQitr?=
 =?utf-8?B?MFc3MnIwTEpVNjdIYjNTR2l0T1JodHoyY2Y0a09OL0tsanppaWZzRUFYd0Qx?=
 =?utf-8?Q?qDQAL3GQWxuFNUgwukE37QcVa?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e954ef-d926-4a4e-8284-08de10ab4beb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:08:23.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSe+FA3PPkdFZggVgPh/d0nntiARQFlvkMoyleIuSFvV4kb16TWiDuj8DqYj5UK0gfzoiyYBipC2SswoqXzb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7984

On Mon, Oct 20, 2025 at 01:19:20PM +0200, Jan Beulich wrote:
> With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
> the IRQ handler can't be invoked in a nested manner anymore, we can
> instead use a per-CPU variable. While we can't use scratch_cpumask in code
> invoked from IRQ handlers, simply amend that one with a HPET-special form.
> (Note that only one of the two IRQ handling functions can come into play
> at any one time.)
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> While doing this I noticed that this and all pre-existing uses of
> DEFINE_PER_CPU_READ_MOSTLY() aren't quite right: When the type is
> cpumask_var_t, the variable is read-mostly only when NR_CPUS <=
> 2 * BITS_PER_LONG. That'll want sorting separately, though.
> 
> It is important for this to not be moved ahead of "x86/HPET: use single,
> global, low-priority vector for broadcast IRQ", as the original call here
> from set_channel_irq_affinity() may not use the new variable (it would
> need to use scratch_cpumask instead).
> ---
> v2: New.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -196,7 +196,7 @@ static void evt_do_broadcast(cpumask_t *
>  
>  static void cf_check handle_hpet_broadcast(struct hpet_event_channel *ch)
>  {
> -    cpumask_t mask;
> +    cpumask_t *scratch = this_cpu(hpet_scratch_cpumask);
>      s_time_t now, next_event;
>      unsigned int cpu;
>      unsigned long flags;
> @@ -209,7 +209,7 @@ again:
>      spin_unlock_irqrestore(&ch->lock, flags);
>  
>      next_event = STIME_MAX;
> -    cpumask_clear(&mask);
> +    cpumask_clear(scratch);
>      now = NOW();
>  
>      /* find all expired events */
> @@ -218,13 +218,13 @@ again:
>          s_time_t deadline = ACCESS_ONCE(per_cpu(timer_deadline, cpu));
>  
>          if ( deadline <= now )
> -            __cpumask_set_cpu(cpu, &mask);
> +            __cpumask_set_cpu(cpu, scratch);
>          else if ( deadline < next_event )
>              next_event = deadline;
>      }
>  
>      /* wakeup the cpus which have an expired event. */
> -    evt_do_broadcast(&mask);
> +    evt_do_broadcast(scratch);
>  
>      if ( next_event != STIME_MAX )
>      {
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -22,6 +22,7 @@
>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>  DECLARE_PER_CPU(cpumask_var_t, scratch_cpumask);
> +DECLARE_PER_CPU(cpumask_var_t, hpet_scratch_cpumask);

Should this be declared in the hpet.h header?

>  DECLARE_PER_CPU(cpumask_var_t, send_ipi_cpumask);
>  
>  /*
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -55,6 +55,9 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, scratch_cpumask);
>  static cpumask_t scratch_cpu0mask;
>  
> +DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, hpet_scratch_cpumask);
> +static cpumask_t hpet_scratch_cpu0mask;

And then this defined in hpet.c.

Just thinking whether someone would like to introduce support for
build time disabling HPET in the future.

Can always be moved at a later time anyway.

Thanks, Roger.

