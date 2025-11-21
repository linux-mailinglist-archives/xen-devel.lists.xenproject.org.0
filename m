Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED2EC77EF1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 09:35:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168427.1494439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMc6-0001D5-8d; Fri, 21 Nov 2025 08:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168427.1494439; Fri, 21 Nov 2025 08:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMMc6-0001B1-5k; Fri, 21 Nov 2025 08:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1168427;
 Fri, 21 Nov 2025 08:35:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF7N=55=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vMMc5-0001At-23
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 08:35:29 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0454c7b2-c6b5-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 09:35:22 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB5961.namprd03.prod.outlook.com (2603:10b6:408:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 08:35:19 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:35:19 +0000
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
X-Inumbo-ID: 0454c7b2-c6b5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sakXfkdhlWpibuLAeVw4gU/QFqcDCOv0LZIhgEdDuHIwTmObO2CpekUet01QCP+S68XQSayyfqMneJjX/2OvvpqOhYI9JS1z70iFRaiXM4m2wWvYDxqXmpFJDXG6h9Yq2AbvlsfyMNyaYXRhDx8WOumZFNxW45eEOdXPY1TTUxPenDt5+pQQ5LTOcTDok7qEQjo6qObyCo49YAmegSXOmPLOfNZ04O22aDXWZeqvMGCxlS5vki80vH78bgtDSKFnrspG79dUpsAijIlpXTWQVxReKpGF0j46PExT6/+HGyfGd0oKaf7SJyRhyRgfaULKSAd+dceo+37GXen55aqWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrB1rjPRspIo44Td7iiOaT+uC2b5eHdGVTpyfXNCtoc=;
 b=Bpnjb6lySXfISNfPNC+jTMXqSwbmeMJYXeaM8HPlH5fD3Owht8sdAgy0HdQjMiebDKN9G3aR8NG86ijnJlp6Fx6J4EfjMuEcXiQgmG/k30MONSXZ0sEWgZowOOU3sanDJe80+qEXjUqsLXsGtD/tO8WqTcH0hYG2E0oORoMyVeWQPnUuvFjHKfRZtAeNQJDxlbtZKdOtyzL7df2lquyvOj5TMunu+se3WCM3/6L6XA2t7ZnlBpA1qF+8mK7SsYPG+yIRyQafinYyp6uXDiWfOgvRpyueONPa0StZeakOewx02yJa5OSrxsAU8KjVtEjQ7JbDtSGoo1CD0KkpegDv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrB1rjPRspIo44Td7iiOaT+uC2b5eHdGVTpyfXNCtoc=;
 b=Clxs/6uHZJDgvZUkr6rtbb3vCazFQC5lFccUTyiwvHfGNnJuiZjB9VMzOvzECa71RlXPa6ce/TRaDycm1Hnisp8tB4DG3krRmHAu5kOfqApfB9+d3X6GRlBvwKNC2Zzb8CFHHPVeSD4au0QOrVbT08b5sNla+uJXx8vWlDlto5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Nov 2025 09:35:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 06/12] x86/i8259: redo workaround for AMD spurious PIC
 interrupts
Message-ID: <aSAkROL4OqcZ8AAX@Mac.lan>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
 <126dc8bb-4f89-4a40-b39a-1b09d78b3eac@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <126dc8bb-4f89-4a40-b39a-1b09d78b3eac@suse.com>
X-ClientProxiedBy: MN0P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: ab295cfa-4795-4de4-1183-08de28d8e72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjR3SXRpcHRTMU5pbko0c21aRTlMMlhIaFBXR0UvUnVRb0tscHpwZm8vOTFM?=
 =?utf-8?B?TDgrVERYc2NYV29CL2tWTlg2RnVITHpGb0JwMklYMzlndnc2N0FsaS91allO?=
 =?utf-8?B?YXdPWlRDcUwwajl5OG5FTEVwdUhlY1VQNEcxTGZ3b3VXS20yYWtGMmQ1RVRl?=
 =?utf-8?B?K3ZjcFJEWER0VnZNRHkzUUkyTHludmVGT1dpVXhKbFowaUpqTERXbFlZNjlO?=
 =?utf-8?B?NG84cy8rVnhwYjdvNGZyWHd3V0NXT0JEMk1MOUZIa0toVmUxL0dQem1GcWtn?=
 =?utf-8?B?WmNxV083a3BvSFo0YmRFS2VvN0ZCMzBEcjJuSGg5YjMzVVVSc3ZuSU1STG9s?=
 =?utf-8?B?cHBwcnJ0THlZeUswb1p6aFVEd0hrblJoQUxKY1VYY2JzVm02YnZpN0hXQXF3?=
 =?utf-8?B?SXgxazJzN1RleThZSVh5RXVOemlvN1kwV1ozT3FHMWJ2UUEvUW1ZTWI3K2x4?=
 =?utf-8?B?eDR2eXpVaGJQVkFDMWszL1hnaHRLeWswdXJXbXdpUWhSWHVjV1lrU3g1ajRr?=
 =?utf-8?B?Q1lBVW9OSlVwN3lxb3JIMEJncWdYZytxUXV5MGRXZTFPSWRPZk1vL1pHYjhl?=
 =?utf-8?B?RmtHWGZ6b2hHTWVGZktXa2hnanJ1dTJaZVdmdFlQL3BaTU1URStKc3hUbGIz?=
 =?utf-8?B?SHFnYmsrdFQrRDZITVRORHQzb2p1RDZRNmkxRWJHWHFuZ3BrSHlUS1JQSFBT?=
 =?utf-8?B?bHJqU3Y2OXM5L3pWUFN1Y1g4ME1odVhJVG9lRk42eDRma09pMU1wdTJYLzYw?=
 =?utf-8?B?TzI3cmwxRWYzVFVYWGMxaVBiK2grcGY1RWdhbkkxOVFxVStaSDhtMy9JS0NJ?=
 =?utf-8?B?NGhYMnV4NHp6ZUhBaFZxOHY1NnExSmoxbktqVHlHSUtQOEwySHpRLy9xeWZ6?=
 =?utf-8?B?UG04andYMWhVUjRtdForY3RVelpwdk91dDVKVE1FUmp5N1kwUTZGUnBWbnl6?=
 =?utf-8?B?TW9Pc21BUlZpS1RpUk5uL0xOYTlqeXQyVmtNSUptT0VmYldWTUh1c0dkZWJQ?=
 =?utf-8?B?VTRtTHFWYVM1b08rbmJ2Y211aXJWWXZLaG9LRmwyaU92OTFwT1VGRVFnWktD?=
 =?utf-8?B?d2M0R2huWks4UGl1UFlOdUVTSmcvQS96NHdBYzZWRzNXYUJid2w4VnRSeWVV?=
 =?utf-8?B?eWpFWEVJOExPTlNVTEhNS29DV2R5TEZVWGc4RS9mY2I3Q0ZQVmw2eUFYaXc2?=
 =?utf-8?B?WTQ5clpoK3l6QUY3QStNRDB3SmxtYllaNmxrNHRodE9aQk5EdlNIQUVsRDJG?=
 =?utf-8?B?clBzWlNIQkVYVEUrWUZ2dzlvS3JuY044RHBzMm9NdEUrWlJvTVNCT2oyN0ZD?=
 =?utf-8?B?ajBsS1RpMWtKVkdtWC9VL3g4WE0xZ1NqVjZZdHNabWlwUWhsRFpydGttdmty?=
 =?utf-8?B?SFBFL08yZGp2eUdPeGJvVWlNQlkwckwvTkdTTmdHYzZFVVk5cjI4RWJGOFVm?=
 =?utf-8?B?d1lvWHkvTUR2ajVISGt1bzRoaURmSjFhemo1UG84TUdlUW9YbmlzZlg4QmZS?=
 =?utf-8?B?UUs1VFBSMTdEM0xjSitKaVNqNzJKaU45MVgrWkJpTVJRUVRTVFk0eE96NER5?=
 =?utf-8?B?eE51THJoUlppbEREcS9uZldheUJMVW1JQjdKbjdwSVJxTEorQ2dUa3hWNC84?=
 =?utf-8?B?bEhvMktvbHpoTDBvTVgrZ1pEQ0F5aFFPMlpRKzljNzhwdVNZZmMvcDd2L2FT?=
 =?utf-8?B?d2dPcGNXWWxyUmtEV25BSGNTbzNVOWNBekRTMnpjMjRJUU1mZDhhK0JpWmw1?=
 =?utf-8?B?RUtnWVV5MzY3RmpLSGxpU0RhOUVZeE03NTkrVGdIbUE2SlJpUDhVZld2SENp?=
 =?utf-8?B?ajJEb0VaS3dmTnBRUm83c2dEaWFUL1A3YUllSU8xSkdqOUVqeVRoTm5CNEZM?=
 =?utf-8?B?WDc4ckVOVVFHQ0p0Z1ZkRjRSbjdmRmx5T2N5eWl5WXFCVkloZHozeDI0d2xa?=
 =?utf-8?Q?FLAJ7gHOrGOgJK3C/ZQPDbBEHaM8Mgtn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnAvTGwzcmhDdjQydlFhanR5QndqVnFISkc4VEl5SFZENFJTUnhLQk9keDBm?=
 =?utf-8?B?UlBXNG9uTkV1ZnJKSTZTMkx5VFpJalUwRzNOelI0UmVMVGYyT1RvTG04NjVT?=
 =?utf-8?B?LzlLL2pDVTVOVFRZZnNONG56eUJ3TlpTQ3FqdVNNYWlMOFNzK2pnY095c2lZ?=
 =?utf-8?B?QmNXMUxNSFpOb2lDTkwwaHYybnZlOWg4YlFUQ3hwZWNxaG1ETkJvZnQyQmV2?=
 =?utf-8?B?cWhJVjhoQlptMDVSQnNDTmpCVHVUWEpVNjJDNXNwWTF5bFcwSTdtUGhxbndp?=
 =?utf-8?B?L0FkT2dyQVRwSWZ6TTBxbGdUR01mTGRGWUVCc2lrVytRMEkyZlVwMlBZRGNl?=
 =?utf-8?B?dnMxZG9Jcm4zN3BJZ3ZNOC8zeGtyR3lVQmRZa2hBUGtTSzF5VVNQNzhQeGg5?=
 =?utf-8?B?VCtlWmQxR1BWS3E3U2FGM1BodllEalpSbU5makljWGNHM2lJd1ZqZit0Y3Nj?=
 =?utf-8?B?RWFYSmRtTmFCNDlqaHhiNWJkdmNhQ3RVWTdGMDY4YnpGQjBMYkIxalh4MEN2?=
 =?utf-8?B?WWJ6dTlvUjZDRDJxeHRxZ1djeGZKOWJ3L09KT1psSXg4OXFMazdDb3hrNHVR?=
 =?utf-8?B?aHFFMzV5SloyRDlObUlzenFwY2RSMnhQZ3dqam1vY0hDY3BSUXdOVkZJa1NF?=
 =?utf-8?B?emQxNXppdGhzYUdvSzFBN2hTM01EUy9OWmgvOGwwajdyV2g4RHFHQnNOcFcr?=
 =?utf-8?B?cU5YeE5qKzZxRGJqY2NkKzV3a0VBaFhQK1pRNWp0RE9WdUtscDBrRmJ2TFlS?=
 =?utf-8?B?Tlp5bU95SEhGUWp1dThxYVp1YnE1bmpvN2NESFJyOXlONjU5ZmgydHEwalNJ?=
 =?utf-8?B?RmRBSUZ3ZDNNZE9HL3N6dlc1MTVteDdlQlFKZGNOT1dianVubUxBNkt5emZ4?=
 =?utf-8?B?UlR0anJsWit2NXFQUnZCWDRINzBNYkJhK3VOVk5IbEljNUhwNXNPQmdWck1X?=
 =?utf-8?B?R1Y0eit4VnlCZFhXTEl2a2xyUkNWUXBkVTZIV1Naek1XNzlTNnBKNHJWbjQ3?=
 =?utf-8?B?WXlJN05acUszQ3IzMHc0ZVBOdXRhUVlYcDR3ZldPY1ZQQ1ZiUDh2ZHNFYlJo?=
 =?utf-8?B?S2pCWlpZRFJuN2tGZFhmTVY5M09XejZoVWlIMzJITUdaeEFpTW9DQnR5SnRm?=
 =?utf-8?B?bUg1ZHFkbEZEQTVaSVlzaFFENWE3MVZRTU03WTVMeXBJRDkrQnhDV2hyMFNo?=
 =?utf-8?B?Z2tXR05ESTNpeDVyUXhVK096ZGxkTmRaQm9ySzFkZUVKZll5VmhiL2pQckxR?=
 =?utf-8?B?K0l3UGxDeEF1eStFUU5mQ3V4VWhCMkRXOFRsUWphdzhUbi9pc0JLaHZCcS9z?=
 =?utf-8?B?N3ZnNnV0TmVIWXBSTnhwQUdPNlV1Y2lZRDRta3U4ZVpnSkZmbzBGNDdQZjFG?=
 =?utf-8?B?Y3FvblNueWVBNnVFMlBxUGZ0RVNweE53RHVzT3AwVE1ZY0R5YXFGWUt0WlFm?=
 =?utf-8?B?aXdKNXp4QlQ4RjZDSXlsVzBKS1k0VWJsMWJRZzN3cTJ4MjhaZmhuNkdoMEh6?=
 =?utf-8?B?dnNBUmoyZFQ1QlQ4OFNQcHJJZ0plYUtUMTBhc2xXMGNIeElUWGhEaTVNZGxB?=
 =?utf-8?B?My8rcW5yTVNCWTJkRFZubEU4RXRNSjlPZi81SUc5TGpCa0QyOWc4N1U3akps?=
 =?utf-8?B?VHVMNWJUS1p5VDZUcDVrS0VtcjF3aVFYdUFaN24xdHZndTFjbzdhak5sZVhv?=
 =?utf-8?B?Q0dDYlk2ajdta1huZnV4U1pnWTQzWWlkdDYwMjNYRUwyeDRpaHNadjlvVlZ0?=
 =?utf-8?B?RDY1U1hOOHNpdmZ0SjM2RDA5bWdqanEzOEIrVlJUK3BJKzJBWlp3Vy9TbzRa?=
 =?utf-8?B?S2lmak0rSTNiNzJUS0JHWnN5ZG9tZ3g0MjFTSDNXZk01MDRBMEFaWXkrd2ZD?=
 =?utf-8?B?Q1hpU21VZEw1bWVTeFZ5eXlMUVpMdmI2R2kxclQ3SG83M0FQVklDSzdkN3pY?=
 =?utf-8?B?RERhUFoza1VIZ25PUnVyN3BwNkRIUkZwMmR1dkVxeDd0VGozWWwzRFErQXND?=
 =?utf-8?B?YWJPbFNIZFhGdnhhdVM3N1owWDdrcW0xSW45dVBNVkd5UVhLVmI5Zzc3MXo1?=
 =?utf-8?B?R0tOTFVDMjFydmFPWUVVeGpBNDZWeWZvdnE3ZU5qVXhWSG1GWG5kU1lib3Yx?=
 =?utf-8?Q?JRqasvFQFZH2qUC2xVDGSn8ye?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab295cfa-4795-4de4-1183-08de28d8e72d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:35:19.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr+J1+yIGQFJ52Ss2X+toD6xwOETyTm2LztW3Lwdzg3/UEVafuqMuePQRD4MbUrIIQelDjd3SrUvOA9fynsnGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5961

On Thu, Nov 20, 2025 at 04:05:38PM +0100, Jan Beulich wrote:
> On 20.11.2025 10:58, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/i8259.c
> > +++ b/xen/arch/x86/i8259.c
> > @@ -407,21 +407,14 @@ void __init init_IRQ(void)
> >          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
> >  
> >          /*
> > -         * The interrupt affinity logic never targets interrupts to offline
> > -         * CPUs, hence it's safe to use cpumask_all here.
> > -         *
> >           * Legacy PIC interrupts are only targeted to CPU0, but depending on
> >           * the platform they can be distributed to any online CPU in hardware.
> > -         * Note this behavior has only been observed on AMD hardware. In order
> > -         * to cope install all active legacy vectors on all CPUs.
> > -         *
> > -         * IO-APIC will change the destination mask if/when taking ownership of
> > -         * the interrupt.
> > +         * Note this behavior has only been observed on AMD hardware. Set the
> > +         * target CPU as expected here, and cope with the possibly spurious
> > +         * interrupts in do_IRQ().  This behavior has only been observed
> > +         * during AP bringup.
> >           */
> > -        cpumask_copy(desc->arch.cpu_mask,
> > -                     (boot_cpu_data.x86_vendor &
> > -                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
> > -                                                          : cpumask_of(cpu)));
> > +        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
> >          desc->arch.vector = LEGACY_VECTOR(irq);
> >      }
> 
> Doesn't this collide with what setup_vector_irq() does (see also patch 04)? If
> you don't set all bits here, not all CPUs will have the vector_irq[] slot set
> correctly for do_IRQ() to actually be able to associate the vector with the
> right IRQ.

For the AMD workaround I've only ever saw the spurious vector
triggering on CPUs different than the BSP at bringup, I don't think we
strictly need to bind all legacy vectors on all possible CPUs.  Well
behaved PIC interrupts will only target the BSP, and that's properly
setup.

Thanks, Roger.

