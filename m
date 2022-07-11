Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0F56D4ED
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 08:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364868.594825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnES-0002uV-WB; Mon, 11 Jul 2022 06:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364868.594825; Mon, 11 Jul 2022 06:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAnES-0002sR-TR; Mon, 11 Jul 2022 06:49:24 +0000
Received: by outflank-mailman (input) for mailman id 364868;
 Mon, 11 Jul 2022 06:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oAnES-0002sL-Bu
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 06:49:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f29b94-00e5-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 08:49:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6096.eurprd04.prod.outlook.com (2603:10a6:803:f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 06:49:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 06:49:20 +0000
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
X-Inumbo-ID: 98f29b94-00e5-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFaYP1gbWg1L/HHV9QeFLlTdPlotE5wYdiYsfXw/+CvfdL9+smIaD+EWYllZb+UdRxxU/ZeAanorLnfSbbhsPDvOPzraMOh4Cx+EnjgJP04nQPVMAsVohL/ZkOhdvjUohLWAQqok/RZpesfXpn1qNPBSO5WAPTGRUCE/s9kgTaKP1uKdIps888/NCYhNby4YDJGyUmCVyVSwuYhbNdVWA9iQ0wkfVHVShFRsXAJX4SCWZCAeRMAA+Yt4VgwaKBmnal1c5kCS341vVQ5Bzp7WGEXqPRM7BnCrCnQSzvZO6k1GkkF/WxrQwkAhFcdMNcS+gGj0DrRpp69zR5OM4Pw96Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHJyWPEeuM2dfUOwCD7WXTabkMnns4N96cScWwbhG3k=;
 b=S8DBKQd62uT+K3leSUtiE8oINvwX44jfmfpyU3dp05PjHO5t9OJ1vuEJHo3QIXgctDF03Ve7SED+dcLxovzsMJePJLRC5pw7dZWzbQBiX9jKqcSzbsOaKLSdlAMVeTDlUl0MCR6nFwrHz63e4TpnrAnIJHwyQpRvNABJTljSGE1exocd5WZOo+7mM8BzVfwrVsfI1JJw7kKqA5y7bMUyLrUMxqAiIcm4Wqw/tw2CBhEwudbkXNziq3hxK5WENLGOqEbu+/s4JNpl4OxaQAMsWdgqxFcG3/BkrTH+g4PnRoEoeKyUlNT+rB2twuEHjJlf18a2l3h+fstJRB59qPqnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHJyWPEeuM2dfUOwCD7WXTabkMnns4N96cScWwbhG3k=;
 b=nwldtidMarKMWr9DnWl4Xht9iUJhsCHdyUjDcFNZHr5EkCjAhXk89bfkwZxVod0ZXOzY6vut7t+V6vmK9/2lpEyKeXXX32D6ReO5pJncq0Rs6x3ZGhAMVS5BbQVe1SWQJXRPUrKZdOvlCMkvkZFZNPOqwwqhS1RgnrBY4xojmBZ6xx7/STp842VYJYOekYo2DsEHDvlkr321+pmKGBNUrhMwQC8WVMwU/DDg+Nn+vndrroxsh4wWq79vISAjPb3VemW5PWTRuctDM2ZLTbyLLL6QUxN1dSF9VIQ5oG+Rom7rTgB5p0PKBTcIqw5bLEGnMocyZcYBnVGOlf0Zx+w2tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56fcd704-cee2-2c49-fd03-b2271212ade9@suse.com>
Date: Mon, 11 Jul 2022 08:49:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Add fine-grained cmdline suboptions
 for primitives
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
 <20220708161934.10095-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708161934.10095-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0049.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6fd0f8f-f3a8-4309-5485-08da63097b95
X-MS-TrafficTypeDiagnostic: VI1PR04MB6096:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Rp3fR3uQ4PD4BkoS4VIyZP7NzHP4efGsSj5gMjRNtNIkbi/OFE5oa34ivKsIG2+nK+nSuDtbM+Iz+AimsPKC1tGr2PWsHJs9fN/ecpd/xFrdF9XwHTNlEO8J8JWAkwkGb7QjBg5VKs786pGgdtZYrE9gpnIQ+Kz3CIfMExfXMgw0KEf0jRxTs7za2XcIseOgh6LqndTKxEiY1e0oCAwEJQoihdThVDDBC/w2AXYr6ZlNidxOPSIqh9x9iIm3k/lg9t6Ikw0/VIz7r4NQaRiNOmk9fOPayCuZzK/+cKKRXMGLfBx4wz9LvtyGo8EhUyLcatuuy0qfLf9tJNofXi0tuj/8ePo2BpDtAkKGApKX44fG7Me3cTB0kSFnV0Oh9rrMZc8T8uVzi3BLhWwnO92H2ONfHGrYQmrKdO/qs89/gJvE7mYyjWSKMWsYSHqmsrVs6TG77qZ+gX8Y1jSDK9BIt0dRh5G5qZTVmPh+4zWku/4jSewZDIyxfNmPc9zgp9xc2kkO0GZI2oLHkHGDBMW/1dlT+aHCsygF09IbDKr42qEmXEwjIZ7cMCfbJhUmE+tstM0Gr4mwelArJ/tgVMfA30OEbGRihMNch4jY1k0Zix3HeelwuDfXiWlgQ9ZezdVDiHV5MuiJ81IY0PrcO3gfczXfTfVeNuqeG3elplATOBYulE6DmlNvJ61ROIa8uXeqcZnRpqWwwF9PGPGeysuP2IiSnH8hI0VH8s9EA7bVkXsDrPPmbDXZ52Z/EU/JbsFidgXoEKGbRL6hBLXQ4vOvag3dzKwvOCWKm3DhBK1Mvb6CbD6DIVvdjeMBV7NiTE3B7brN9+7qSby18u+bJeJ56fQeOom2CXgpHunxhN1NTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(346002)(39850400004)(5660300002)(8936002)(2906002)(31696002)(86362001)(558084003)(36756003)(38100700002)(478600001)(54906003)(6486002)(6916009)(4326008)(8676002)(66556008)(2616005)(186003)(66476007)(66946007)(316002)(53546011)(6506007)(31686004)(26005)(6512007)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3hQaHJWeTBFbDcwSTFwUStGSGRrUE5Vc0lvWFk1S1IyYmJNTmJIOTJGSUVF?=
 =?utf-8?B?bjRsdmc0VDl5b1licGpkNXlteEZqemIyaUl6d1lKaStxa0dRUU5hWVcwRjJy?=
 =?utf-8?B?OHQ3TjhxWktQaXozL21tNmN3aW1obXZhM0VQZ3pCZWJvTCtFTVpneGR1NFdQ?=
 =?utf-8?B?VHRHbFNqMUozOEVUMi83eXF1b3kxU09CVzNlTHZkTHU0ZFRpV28xVTJLeFFk?=
 =?utf-8?B?Wk9QOStyT1hzT3VoTzZuVHBDOHdwZlZpRnZtUk5UTkNFWlZYK2FPckx3THBK?=
 =?utf-8?B?U2FkcmNxWEJMTm9QQVdTZStFNnNwZHRtdWp2RWxPVzFnL0RJNmJTOE4va0Jl?=
 =?utf-8?B?Wmd5M2tWTnA1c1J0N1VJc3lDZU5Rd0s5OU55MnpWVHNjekVIOHRkeWdQSkpN?=
 =?utf-8?B?TUFuVkxvVUV4MHVQSTBpRXl5cFdjbWxFOXV5YTJuQzhwdkJuVGtXQWVFUDg3?=
 =?utf-8?B?K1JGNU5pMHllNVBPdFlNV0tWVmNFTjdPa3dCb3VNdkF1UjQ5NHlYcEIwWkk1?=
 =?utf-8?B?SGJhb1F4L080M3ZaaXJYcVB1d29LVmVyZkJzcUwyYXpqVUlyb3RNVTVjOGo2?=
 =?utf-8?B?V0FGckJxT3N2dVJpS0puWWlJdCtpcGNSeFlXeGluRjBLamVBSWRjaVZ4MUVK?=
 =?utf-8?B?bzJkb1lZcG1VcFlwOHZxRUZGSG85NkV6SytuajI1UjRhd2VtbzRiOXRqZnRv?=
 =?utf-8?B?czJCQ1UzaTYrNUltKzlpRGR4MXVpNDl3Nk9nV3dpVm16MHVMT210aTZHcmlI?=
 =?utf-8?B?RGtCMmtVWkJwRDVySEFiR0lKYWwzOS80V1UrMEJGcUF3dWphNVdENW5UNXJ3?=
 =?utf-8?B?emNIeUpVODlYdDN0Yk5iVjNGVzB3Ym5vVVY1d3IzR0JVdFJuUVlhZjM5UHhW?=
 =?utf-8?B?cklCSG02WEhQdmFKeWpRMUJUQklESzZNem1pK2F3S2g3NWNEQ3c4TUVxVStV?=
 =?utf-8?B?QkxOcUozQndjSWlUbDFqNjlNZCtlQzI2d2JSL0lBWHpWV3Q3SDU4ck8rUzgx?=
 =?utf-8?B?MFF2WEhoeThIMkMwaTVocGJZY2RLQngzTGxRZ1IzbjROTVZPRGJ2bnhEZU00?=
 =?utf-8?B?SWxtNXVUdXpseWFLblJ4dTF3b1JXQzhNWGRxY1QvdjYzVVhucTlPMlJXOEg0?=
 =?utf-8?B?bER6eVNnYWo2N041ZDhzL2YxR0Y5N3pIU1cvT2VZd2ZTSTBDaDlyY3dEU3FB?=
 =?utf-8?B?S2dLRGoreFhKKzgreUlsN3ZtRlNiTTlldkpWR1lHSVdCWXk4R1NWa3VIS242?=
 =?utf-8?B?WEwySFEvTXhGVlA2VzBKQlV2djN5SStUbnEzTVI5RlZtcUYxdHN1SVNUR0pF?=
 =?utf-8?B?UmxldjBOSmFYeHVZeng3VFBBc1BVMk1HZnRUZjdpdkkrQXlKbndzc1gzZHhJ?=
 =?utf-8?B?OVludmZCbzViOUhsTlM4NXBuUm9iUTkyZGtySnFJcVgwNmpHT2FUN1lWNG0z?=
 =?utf-8?B?WlBKenZWczFKa1NITnM4cVRvd1N1clpiM3NrUXJkNDUwV21tMmMxUk1NYVFk?=
 =?utf-8?B?L0Vub3RQb1JxU0o2d3dYVlUyUWhWeGNzOHJPemdsNklVSUdzOWRqcTE4WEd0?=
 =?utf-8?B?RW5Jd1JrVURMeVZSVjVvSnpQaFhFM2FFNzZVenppUFBlMDBOR0Vxd1A2d3Mx?=
 =?utf-8?B?K1k4VEZacGZKdW9BL1lxd25kY1R0ZzVmZ1cxd0htL3FLWC9SVldkb1hMMWtr?=
 =?utf-8?B?ZTY3bkdSQjB6M3dTNUlObnJOMWZqQ2RUQjFxRkV2UFloVTdYYVpNRUxTZ283?=
 =?utf-8?B?T1VPS1J2U1Vmd2taQWVXbVRGTjQ3T2pTNGV2SlF5RWFhYisvL1J5NjRjMzls?=
 =?utf-8?B?OTVoSnBXMWtCdFdhcWhQMHd6STZNUit1N1BnekJtaHJzTEFJcVY5aUZtbTh6?=
 =?utf-8?B?MEpvSjlSY05OQ0JqTmtpWnZFdzhudEZURUx4Z0JGSnd5ZG5DaElUdVp0Zlcy?=
 =?utf-8?B?VlczdnBMRCtQVTg5ZFY2Wm1maUFNNzl2ZUVtQ2w2bHlWeXo2OUdGdmZhdmI2?=
 =?utf-8?B?ZmpUS1M4WTNML0EwYVNKcG5hbVJuOHEwN2QzYkRTekI4ZkhKelNqZHdRYWdH?=
 =?utf-8?B?MDB2TEN5eGxPTEg0RVFDWTBuMkVnZEdxbEYzNzNNd1IxTlVsakJ2NWI3Vlgz?=
 =?utf-8?Q?v4H7R3jIjtQwhcUDmh24zmeMx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fd0f8f-f3a8-4309-5485-08da63097b95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 06:49:20.7148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNKbvQL1VsqZFyyaCOfGZ92/3v/+3l9HnScXmxQIM1jKsl/mUwzu1NstsrCH0S95zubO3tv/Foxjs2n6fTSqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6096

On 08.07.2022 18:19, Andrew Cooper wrote:
> Support controling the PV/HVM suboption of msr-sc/rsb/md-clear, which
> previously wasn't possible.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


