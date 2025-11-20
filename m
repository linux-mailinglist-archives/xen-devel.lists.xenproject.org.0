Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F63C73E12
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167130.1493494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3S3-0005Vs-O1; Thu, 20 Nov 2025 12:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167130.1493494; Thu, 20 Nov 2025 12:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3S3-0005T2-LB; Thu, 20 Nov 2025 12:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1167130;
 Thu, 20 Nov 2025 12:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ChS/=54=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vM3S2-0005Sf-Vj
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:07:51 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88742ea2-c609-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 13:07:50 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB5955.namprd03.prod.outlook.com (2603:10b6:610:e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:07:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:07:46 +0000
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
X-Inumbo-ID: 88742ea2-c609-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJ8zaSfgMDzWUn4srr52zoGVXkfbM5+fdG1YZ2EH0fjRkGc+7xtuSVDMB7G4dulKFCJ0R4ypDtgtyyqmmVg571O4OcBeJeRsSVfpAcAf3jKh4t4nby8lTv86pO0tEbbblBhb+EguvmFTGnWNzfjxGlybXD4XfJfp3N9Zhn0njIdikKgu9UWKJVdBcb51bK1ZvdObTwxXTA7CDFhcdYbuppXPUdB6Pa6IXKCdxsqvQ4kn46hrsckaVMhzcDq42XhRn42kB5GUJtVDAYQ5r8wv84fENINUlCY9gyAjH1zTDoloEKf3fZdIx3JC7QIunpzPpVEmG8l0VamXfL6FqRQeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Yk4MQuWf2HsEp0T0R8SyJFKiiYK/ggqbJo83GsPQy8=;
 b=thezSZPYqWrzHETlc7s71yBbxLdgtRUWLHKQitFIizZeqDu++k6qpxPTtN7EGmxmBOtrkuSxlDN8XyUsuWbDLR38MqAbTmCBQAV9Yufl9tGofPRdntbk1aLTrLJ5is7d+rkNur+CS+DNmU19Sn97O5uHudBVK5/XkYeplm+Xk98NGtQ5rtd6OOtxgYuHcBYMve7aMERWeXldTS0c916/BGa83BC6C4usYSt6ALpFCpk/yyC3FUCVo7u2CWbYshFctQs0+3VdZRX6eG0Q341WeaMX0ZkaLeOJWcjdnQlxd5Db8PI9CrE35HFYRLcBzO/7txxgskK4hGKyY038m0+RlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Yk4MQuWf2HsEp0T0R8SyJFKiiYK/ggqbJo83GsPQy8=;
 b=YwTpo2qHh/MOeixicIO5KSoLkgVdfIeqkAgIewwvghthP/52WLj1BPHeRZi8EOwk2ThIiJ0T1jx/Zhs1dD0UQxolQminwdvJcmvg0MasVirG5DgPBimeKuBLMXwcwroe20kME9qyRncd9UBjeJQeK4Htzh5ljeqPv+DaNfsC3SM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <332c3ec7-cd91-474b-ac03-235a4a30d4f5@citrix.com>
Date: Thu, 20 Nov 2025 12:07:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/IRQ: direct-APIC-vector setting is now init-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <3d412bdf-e053-44f2-b51a-300f9cb3e775@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <3d412bdf-e053-44f2-b51a-300f9cb3e775@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0403.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: d1264521-7ba1-458c-df9a-08de282d6a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGxqMzhNeXdrVEFRUFZmM2ZmOUI1MzEyZXlOWENXZkowS3NrMnEzUFRtQzhB?=
 =?utf-8?B?SFEySytaaVMxUHBGaXRBY1pEQjUyT1g4c2lQUlpDaDd4U0VPcmU0MVZPam96?=
 =?utf-8?B?cjlKZks1TFRDWjZHYmxqUVIyN0tSR3R2UkN6YlNQZHJrbW9rNmozZHhiSDZ5?=
 =?utf-8?B?QUxJLzA5czFXOVZhNmlaMG13Ykx2VDkyRkM1SnlabWdxVHlDRWpuMDlHZjVS?=
 =?utf-8?B?QmNCREU0QUNpUU1sTitER2NmaEg2K2tVOWIyVlcrOHh5MFp2RE9PRjdBYzcx?=
 =?utf-8?B?RUQ4WmJGbXpMS2hKV043UHpETjhhUlBJbm1SYVg4Z1ZIaS9OcHEvR2Y1Q01i?=
 =?utf-8?B?QnlPS0JUZWNjekJuVjFJOENCald4UWp4SWlSeFVBb0laQXhNYmRBSjA1OWFt?=
 =?utf-8?B?QVBDbGtBcWFvTzRBaGJNYitBR2xSMUlLbnZvSXFuNUZ6MjcvalE2eXdJdnR6?=
 =?utf-8?B?S21JeGY1a2FuNC8valorQTZoRmFQV3ZwVHJadTVUanJyTGlMVFdJT0tna3N3?=
 =?utf-8?B?dzhHVVNZUTBuaDBsaE5mVjJBR2FSdW1MWFJORVFqaGtPK3lXaG1KQ2ZESEs3?=
 =?utf-8?B?YlNxT2ZDc05kZWRUbUdDelFiV2tHYnlEcFU3dWRWNXJOdEhyQ0ZQc0RBYllQ?=
 =?utf-8?B?bWZFUzNML0hSaEpHYzlpYS8zVVphdmhRNTZlcDVNWG0yanV0QXZ0YjZxTUJm?=
 =?utf-8?B?czBmbTZBeHZMMitPMGtuYzMyUnVvcU1abGlINlBZeU0zdkJ4Wmo1Q2pkSFV1?=
 =?utf-8?B?QUtaamFJeGg1aUlQSXo4R0pBemVVYzc3UFJLeHlReEh6YTRVaUVGa09VVEhs?=
 =?utf-8?B?dlJibVdkcnVhdGxqWmdhejlRS0hSN3E2bk9IL09aUDM2cXRXSnYwWkZBSW5U?=
 =?utf-8?B?NjYwRDJyNXpuT1E0YnE3OHUzWEVmQ1ZjK2NodEVFb0VNRnRuOWpSakZxOUQ2?=
 =?utf-8?B?SG5NQjN2K0dEeXc2NG5OOHVnMk1Rb1FHdFROUlFia3BqdVVIb0NpRmJaRmpW?=
 =?utf-8?B?QVlGV1A5WWJ6S2FGTVBtdFJNTmYwYmd2ZUdCVUpyWmJsQ09SS2ovZkw1YnZj?=
 =?utf-8?B?UmlSTE5nVllFcll6WCtzVUtLNDRxZDV6a1ByMkg2YU9zb1FFdWt1VmFWQW9W?=
 =?utf-8?B?bncrTUNwNHVKaHhBU0YvR014MlN2a0hQaVE0L04yMGNXd0lReTJ5ckNFMWpY?=
 =?utf-8?B?cjRyaEJsSHZ1dStGbG96RHIrSzVLc1hRZEY1S0l3KytWV3ZJTWlTcGx3RnBV?=
 =?utf-8?B?cEtta1pyY2E3TjViYXFWT3BLVW5PTEdwVlRHbDZnMVgyb1o1OUx1d2phZ01w?=
 =?utf-8?B?OUNjT2NhMVZwNkRqZk5NMmFiWlNyMXF4UDhiQ2FXMWJNWUlUakVzR3d6WWRn?=
 =?utf-8?B?UGpBWk9SV0lYSmIxMUsvSVI2bnNSNEJzWlBtR2pub3dpclcxTDdVbGtGQ1JN?=
 =?utf-8?B?MUpuUlFOVVNLQ3FCVVo0OS83SVJkSFVoQmhYTXZWdVE3bm9MNVU2NnZJelFu?=
 =?utf-8?B?SU4ySTV0QVRDWHdCMlhkMXhUZmZRL2xtSUxwRC9QRmRvdElqektlVDJhZzFN?=
 =?utf-8?B?UnpWM1d6SkpjM1J0ZnVNdWtLNWtwbjh3LzZETk5kUGk1K1BTWS83RTdIZnVE?=
 =?utf-8?B?MWhUMVhqKzdnclduRnlMTm9UMFYySlJuZmFyOS83WlZDMk85dkh6amYrQWI4?=
 =?utf-8?B?TzFzTFhEZ2owTmFNWmxJMjhZd3pPejVKenBBUHNTdGcyYnAyY212cG5SUmg0?=
 =?utf-8?B?QUpSOWVLMkJXemdEdHIxNGFYZmU5NFp3YURodlBQMDhhNmE0c3lCTnJQUUFz?=
 =?utf-8?B?cXgvdFpIUUdrSTg2RjQ0dEhSejZZWldzYnJ1SGNqd0lZcmRCKzJaUWxscFI3?=
 =?utf-8?B?S29hQmVJT0FvV1g0NHMxWmM5ejN4RXoyK0pYYkg3cUppUWNYbVlnRnlOZ0s5?=
 =?utf-8?Q?QPWj/k7gbjTBtelDvOQ57ZU2l07GVdww?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzhNS0w3MXA4YWNvUFVjVm9DejBuTy9KTVdZNHp3eDdHRVJ6eEQrWEJhNlE3?=
 =?utf-8?B?WVl2Nm5iZlJnZ0JlcWtralBqaW9GVVNYUE1jMzlBV1pLOFFpS2dpeStwNkdB?=
 =?utf-8?B?VnVaZkVhQUdQYnNmY3JiblhwOURTVTcyQjlDLzhkRjgxL2VGVTNXYTI2YTFE?=
 =?utf-8?B?Y25yellBbTFMd09IbGV4Q29ER0Z6VjJPWWVXdDBramxJTFhVb0ZvSEZ4ODZB?=
 =?utf-8?B?RDc1WmplTXdwQTNQWWI1Y0xScG8rLzliR0s2cmZVc2Z0V2VZNDliVGExL3B5?=
 =?utf-8?B?Tk5lWmltVm1iSHFrOEwwczZpN0ZZalgrdEZBVGNKYS9HNExKckh3MGlHVnQ3?=
 =?utf-8?B?K3M2bDBGdENkNHUzdEdHd2xUTjhNdzhZUEpPSHNKWkh4KzBBLzBsNDZ0VFQ2?=
 =?utf-8?B?b0tpMC9KbzhrOFlTenQ2WHR6VDIvbTQ0RllXMFRvMStMZVg3VzVSa2hGZ2pN?=
 =?utf-8?B?UktXVmJrV0h3djdsTFJCMW9lS3krcCtnZmN1MURpakdZL1B2SUpSbSt3emEr?=
 =?utf-8?B?aENZZ2YrVUtGdi91ODhER1JXV3ZFOWZ1WmRXaEhFZ2ViMzAwYWhCTG1jb2hn?=
 =?utf-8?B?SGY3ZWZqSmlZS1NHSXpEeWJLcTV2ODdJdW5mbXhUSnRHeitUSlU0eGsvUHg3?=
 =?utf-8?B?NFBsV28xd3c2Y3FQT3I3VzdqSlBUSXV2M00vR2tCY1FLNmhJNC94MHcvcE1B?=
 =?utf-8?B?cm1HV2JyTzl2ZW1MeHFzSkJuL0dMT1F2ZWpKTTlrc1ZlTC9RYVlQYzhEdlRB?=
 =?utf-8?B?RldmNnFGT25kSmExcUpFdjMzc1VaS0NaTVZLajlGa3VEL2NCc2RZY05Vb3Z0?=
 =?utf-8?B?aXRDTjFmVXR2TGp2KzY1Nkx5L0c2NzB3S3JpWkVuK3pGdk5TRlJTSXFuMkdZ?=
 =?utf-8?B?TWxzN3lvenZoZ1YxUGhYbjgvckc3TGkwNjcrTm5DV21JcEMvYUlSckFDQmFv?=
 =?utf-8?B?YVZIVG5ldTN0UFV4SFEvaHN1UDhsakFHNXJJaTd3ZWRMSUtCeVo2UWRPYWI1?=
 =?utf-8?B?LzZOREVvcFlGMjJHSmFtMzF5TE10VlYzTjU4OHdMNVN4cE90YmVTWlVNaGgw?=
 =?utf-8?B?alAvYXNyWlNJRG9jSFAvWUJ5ajNnUnh2cmJSWWFvTy8xaXdhZnNNTWlMN2p0?=
 =?utf-8?B?UjJHTXBBbk44QUlBZUdSN1Z0QjRjVEZZbjRVeERQb3Urc2hOb2FESjZ5eGFV?=
 =?utf-8?B?UCtlMlM2eVN1dytsT2NNKzE3RVlob2d4dVFram9FcHlCTWNsL0trTHlaZlE2?=
 =?utf-8?B?UjZFQmlrWExNUlFIazExQ01nNjNJOUR0cGFSUzIxZTkwemtLK2R0N0xRNzRr?=
 =?utf-8?B?Wjh3T0xNU1I0OVA4YzRBMWxpSGpGQnBmZk9PMFpqTnBRUjVIOEFCeVFvT0dK?=
 =?utf-8?B?S0dwSU1VY053TEFLYituOE5zMTE2ZFh1Z1FSY3lOYjBrUDNTNTUxeHRDNDZv?=
 =?utf-8?B?L0xVT3QzYllybjR3cVJEYjAxNFdJVmxLd0FyNm5qM0FUSVBSZmZDYTY1NG1I?=
 =?utf-8?B?eGYwMXBaTzM4cUpQc3FvSE43UXpFT1dBQWZzRDZ4TUQrc2JMbEl6TXBITFJu?=
 =?utf-8?B?ODFMQTJJNERUaFV2OXhLaXk3ZC9DNnE4c2VWZXl5eWc3K0N0L2hCbWlmUkxu?=
 =?utf-8?B?emdkZUoraHd1UnpWNjQzdFJJREJLbFU3NkNiSHg1dzZKVDlPQWk4VDZDVE1l?=
 =?utf-8?B?VHBUSzJHSTM0c3Z2SXE2UkNPblZHdG9ucXZ1NkpGQ1pncUloeFFoNnllWDZO?=
 =?utf-8?B?OWIzRjdqa1J4elBjTHdmR250WVBiYXpSTW9MTGRUSHV0K0dVS2hFVzhvZE1V?=
 =?utf-8?B?Yi9JQ2puVWxsTzR3QjZrdUJnekVJcUxqWldiOUJTTklDK1dKTDM1bkNRRE4y?=
 =?utf-8?B?NGxWamJ5QU43RnFFOUQzN1UzbjFocUxnUWN2YjFobTMvWXVrUU1KRTJQd1lk?=
 =?utf-8?B?OFV1b3lXeUNBK0N4Q3drcDcwckNJTXdIWk9kcXNYS295NFdiZTV0ZlVSdXd2?=
 =?utf-8?B?UHNxUEhTL3F3eHNOYlEwNGc4YzVsbFBNWUVDWmQyNlg5aDVaZDA4dUtDOWE5?=
 =?utf-8?B?c3RsQW1SZGt5Q2RpdHFKcmVMOW9HY1hEK0FaOXRweW9sY2NTZXFUazM1dDdm?=
 =?utf-8?B?OHlja3hGUWlMU1Z1eWpPZTFRdEZhRlhmUWlJUkljRlVIdVRCUHNOaWx2TFVM?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1264521-7ba1-458c-df9a-08de282d6a7a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:07:45.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9n6G0PCx/Ms7IYVBL9YbSdsJdwGZYzYvOm8RK7NU3ftkvJYQyfhpyEPPPX/awc7OyFs2JuKb0iMdg4xhCiPnaraTZBFrmLgviX+w1fvo+L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5955

On 19/11/2025 10:50 am, Jan Beulich wrote:
> With all callers of alloc_direct_apic_vector() now being limited to BSP
> setup, it and its helpers (whose other callers have already been init-
> only) can become __init. As a result data items can be adjusted, too.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Question is whether with this the "if (*vector == 0)" in
> alloc_direct_apic_vector() is of much use anymore.
>
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -970,22 +970,22 @@ void pirq_set_affinity(struct domain *d,
>  DEFINE_PER_CPU(unsigned int, irq_count);
>  static DEFINE_PER_CPU(bool, check_eoi_deferral);
>  
> -uint8_t alloc_hipriority_vector(void)
> +uint8_t __init alloc_hipriority_vector(void)
>  {
> -    static uint8_t next = FIRST_HIPRIORITY_VECTOR;
> +    static uint8_t __initdata next = FIRST_HIPRIORITY_VECTOR;
>      BUG_ON(next < FIRST_HIPRIORITY_VECTOR);
>      BUG_ON(next > LAST_HIPRIORITY_VECTOR);
>      return next++;
>  }
>  
> -static void (*direct_apic_vector[X86_IDT_VECTORS])(void);
> -void set_direct_apic_vector(uint8_t vector, void (*handler)(void))
> +static void (*__ro_after_init direct_apic_vector[X86_IDT_VECTORS])(void);
> +void __init set_direct_apic_vector(uint8_t vector, void (*handler)(void))
>  {
>      BUG_ON(direct_apic_vector[vector] != NULL);
>      direct_apic_vector[vector] = handler;
>  }
>  
> -void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
> +void __init alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
>  {
>      static DEFINE_SPINLOCK(lock);
>  
>

This function, being __init now, cannot possibly need the spinlock.

To your question checking vector for 0, that always wrong in my opinion,
stemming from this being a bad API.

It should become:

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index bb3c9f9e5234..9ae0bece1af7 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -161,7 +161,7 @@ static void intel_init_thermal(const struct cpuinfo_x86 *c, bool bsp)
     }
 
     if ( bsp )
-        alloc_direct_apic_vector(&thermal_apic_vector, intel_thermal_interrupt);
+        thermal_apic_vector = alloc_direct_apic_vector(intel_thermal_interrupt);
 
     /* The temperature transition interrupt handler setup */
     val = thermal_apic_vector;    /* our delivery vector */
@@ -689,7 +689,7 @@ static void intel_init_cmci(struct cpuinfo_x86 *c, bool bsp)
     }
 
     if ( bsp )
-        alloc_direct_apic_vector(&cmci_apic_vector, cmci_interrupt);
+        cmci_apic_vector = alloc_direct_apic_vector(cmci_interrupt);
 
     apic = cmci_apic_vector;
     apic |= (APIC_DM_FIXED | APIC_LVT_MASKED);
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 640872efdd2a..a473296ba94f 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -289,7 +289,7 @@ static void __init cf_check setup(void)
                XEN_LEGACY_MAX_VCPUS);
     }
 
-    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
+    evtchn_upcall_vector = alloc_direct_apic_vector(xen_evtchn_upcall);
 
     BUG_ON(init_evtchn());
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e2b5077654ef..0919edd73312 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3118,10 +3118,10 @@ const struct hvm_function_table * __init start_vmx(void)
 
     if ( cpu_has_vmx_posted_intr_processing )
     {
-        alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
+        posted_intr_vector = alloc_direct_apic_vector(pi_notification_interrupt);
         if ( iommu_intpost )
         {
-            alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
+            pi_wakeup_vector = alloc_direct_apic_vector(pi_wakeup_interrupt);
 
             vmx_function_table.pi_update_irte = vmx_pi_update_irte;
         }
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 7315150b66b4..0cf47a883722 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -119,7 +119,7 @@ uint8_t alloc_hipriority_vector(void);
 void free_lopriority_vector(uint8_t vector);
 
 void set_direct_apic_vector(uint8_t vector, void (*handler)(void));
-void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void));
+uint8_t alloc_direct_apic_vector(void (*handler)(void));
 
 void do_IRQ(struct cpu_user_regs *regs);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index c740035927c2..f50b5b5d5037 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -985,16 +985,13 @@ void __init set_direct_apic_vector(uint8_t vector, void (*handler)(void))
     direct_apic_vector[vector] = handler;
 }
 
-void __init alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
+uint8_t __init alloc_direct_apic_vector(void (*handler)(void))
 {
-    static DEFINE_SPINLOCK(lock);
+    uint8_t vec = alloc_hipriority_vector();
 
-    spin_lock(&lock);
-    if (*vector == 0) {
-        *vector = alloc_hipriority_vector();
-        set_direct_apic_vector(*vector, handler);
-    }
-    spin_unlock(&lock);
+    set_direct_apic_vector(vec, handler);
+
+    return vec;
 }
 
 /* This could free any vectors, but is needed only for low-prio ones. */


which makes it a far more normal looking API, improves code generation,
and gets rid of the pointless lock.

Feel free to fold this in, or I can submit it separately, but I think
both parts want to go in together.

~Andrew

