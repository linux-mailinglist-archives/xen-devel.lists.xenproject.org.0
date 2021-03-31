Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C193500A0
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 14:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103925.198218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRaGH-0000rO-HG; Wed, 31 Mar 2021 12:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103925.198218; Wed, 31 Mar 2021 12:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRaGH-0000qz-Df; Wed, 31 Mar 2021 12:47:53 +0000
Received: by outflank-mailman (input) for mailman id 103925;
 Wed, 31 Mar 2021 12:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRaGG-0000qu-5b
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 12:47:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09285ae6-d139-4523-82c6-12c37f772f85;
 Wed, 31 Mar 2021 12:47:50 +0000 (UTC)
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
X-Inumbo-ID: 09285ae6-d139-4523-82c6-12c37f772f85
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617194870;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YbpQLEEV61oRahyMsPxDBF89XFYXmd/uS9twCmsXoKE=;
  b=TSm2gkXoLD+NU1mAV0J+SwT7ROS0HALjDvT5XNMf5kSIytDcBNEOXQan
   h5NjxFRCLWAVHIX7Dh/lgiIbvoODTjRaeYWm3H16n6jcwo/V+Rn1zluF4
   gIFz+HvtCIPg1BMR7QN5aYdIvqs261HcpVHJ0NXkcSNk2wHBU2TPrTMwr
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9NCmvY16RvpIrz/dKQsCQRTESVSxoLjz7iev3Rj1V+1hDWm5Gz6IvRZQ+VoD6TvJpKeResixny
 dNrVAEYwFhhFaC6hnmmO306Fxb/4KSQRmjbpcS8eGpfXbniZ7Ykshnsp2J0H3yGVn4qkWZG2YG
 TlaVk1/uJFAGAUdmnZxpABuFJ8JRaZ3nZx6iR/fDtMYV9P+KUK9NQCVOIn3pb5MeiawyB9+QLl
 qVB9IogANntZ48IEwRX1l2X+tD+4T9+HO5jiUjAihYWpL+gPlEhZnlYNxBa0bEyKFdKkOsDbp+
 B9I=
X-SBRS: 5.2
X-MesageID: 40698558
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:iDbA6a8x9ZfKDLrMvupuk+FLcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/3eBJuPW9c1CCirxONrIT7HR+RwwsEX1p0oIsK3G
 DZn2XCl8Cemt6hzBu07R620713n5/bxsJHFIiwjKEuW0nRoyKJQKgkZLGYpjAyp4iUmSYXuf
 3BuQ0pMcg2y165RBDMnTLX1wPt0Ckj5hbZoDfy6xaTwr2aNUAHIvFMio5DfhzS51BIhqAG7I
 tx03+ErJ0SNBvcnU3Glqn1fit3nUm5q2dKq59rs1VjV+IlGdhshL1a1kZUHJAcJTn9+YAqHc
 J/Zfusmsp+QBe0aWvUsXJox8HpdnMvHg2eSkxHgcCN1SNK9UoJg3cw9Yg6pDMt5Zg9Q55L66
 DtNblprqhHSoszYbhmDOkMbMOrAgX2MF3xGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUXtD3FRCO37GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDclYziMGtys9vQ/Hzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk7odA+d1WSot/aC4Hju+DBGcyjZobFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfMdyXEjNdNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzWE
 N/Jbjgg56qvGXexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPUdfwWWAPR06a8/NCg
 ZQqxBW9MuMXtKt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KI0nVqx3HQDiDAd0hg5ulW
 dGZGY/NwziPwKrrZ/goI0fBenZedU5qhysO9RopXXWsljZmdsiXUIBXzmlUdeehCEnQzY8vC
 w3z4YvxJ673Rq/I2o2h+o1dHlBcn6eDr59AAOZX4lMgbzwdAZsTWCFuCyCh3gICxnX3nRXol
 akATyfePnNDFYYgHxe36rw2H5fd2mWfStLGztHmLw4MV6Dlmd40OeNaKb27nCYbUEaxPoBdB
 vfZyEJHw9oz9er9RKclTqYD086zpE2MuG1NsVkT5jjnleWbKGYn6APGPFZuKt/PNf1q+kRTK
 axfRSWID6QMZJe5yWl4lIefA96p3kvnam2hFnL7G2k0GU+BvSXClJ8XL0fK8yd6W+hZ/vg6u
 QMsfsF+c+LdkP2YZq67IuSSRhpABbau3S3QOElsoo8h9N7iJJDW73gFQLV33RG1igkJMj6lE
 kiUL12iYqxT7NHTog3QWZl5VInm9SEEVszviH3CuE4e0sxj3WzBaL/35P47Z4uCFaGvg3+JB
 229DBc5e7MW0K4pPQnIpN1BWRdc04n7nt+uMuEao3LEQ2vM8VO5kCzPHP4ULhTTsG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt1+dfvnaOnPEJcd4t/qgOVqNhaO24Mm8yBfPIAHLFHgwtM
 libkwfbsNKlz84qpY4uxLCE5DKng==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40698558"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWwyLFkU/oiYQB5ntuW8YkrlsE0rR/LyctL1kExYmSw8q4VybpSFNRsrwRUKDG4I91HFoxMc5XLg1MQ43pAMOoS+dnZSCnCEwdMTFtXDDOg36aJNz2kRGsFEOCnSBo0y+cX+ZVWEVz7oCx7s3Y1D8D2s7F9mxDycnZECckQGXMhWNFTTZ3jqREG8i6pKJ694wwOQ1xKDyp3ee3OAGSSlzrJvNu2RkyheLbxRSoVRYK6eJq+ygf6oTsjgp5SCoFtT23Zu/Ecs07nAncx8Uo0fT0NUVZJAFsDDDmwkao45bKzmfAdNN8gfZLraGszxrgpmtI2AW84Ijq/OKn3WL/w10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqe121CWTkA1QpsXwlGVx3sF9YsG+h9QMxHFoPiNb/A=;
 b=kgT8eq2FSEwTL+c1YOQDnIWysfLn/UF015jqF0rs4JceKBu7zLCtl7UqE8w3hMnkh+mxj+QjnS5auJYEOPgIVh0YCbgsdm8whO9U3SJUt6ET4GzstzI+GQEM94g3q2DR2B0RcuBq7XgpYKk7eqmmMhB1kXIVK7xx/j0K+ZkPV5Wm9z3BdAckNyOyIVxg2suGOYKlJMrnP4jWPN3dF64FG1G4QvUu1Mayc1EL4Q2Epcpf5PeIx+NdyFikbdVXk3Iz8gsVl7BkNH8J/ArsIeP91Jhzx3vjuK/bizBT4cGtCr0TRvXmLTldJN0V1UuASm69yPrMqiLfAwx7VOQAnv5TAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fqe121CWTkA1QpsXwlGVx3sF9YsG+h9QMxHFoPiNb/A=;
 b=Jk/hYFBx8B+kytwg401WWcw2M2lwpiW5IabCt29faPAM36VQdWjGgA04navpFgqMm9nF4HYbFoentlfc8BfuhtJZscIk9h2H8R1hEoLZMhQO9XZMWH2NtyxW7FWMp/Yef+kqYzp2Bg8t0aNZC04/XTj6Yt3ES0cyPRfOsJP8Cjo=
Date: Wed, 31 Mar 2021 14:47:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 11/21] libs/guest: allow updating a cpu policy CPUID data
Message-ID: <YGRvbgQqyrWw4fjh@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-12-roger.pau@citrix.com>
 <ee841bd2-340e-aed4-2403-a655fbb13862@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee841bd2-340e-aed4-2403-a655fbb13862@suse.com>
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 975a2d7f-c79f-43a2-118b-08d8f4433034
X-MS-TrafficTypeDiagnostic: DM6PR03MB4764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB476445449BC8B1361527B0908F7C9@DM6PR03MB4764.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FKny985RdPvEOZioy9vMDVtpeTb9wSSJobkziMivDpU1ARFkQvCImW6A6Au9MR98/rlG8u+uIT/4ZpS2f58Idat/4XHjTdPdtLWd5o/HXKL8Zx24qzgn6fVpmTjkT3o5ySIw+pn9Dr41X/9r8QAabjO3wyYiUwZRc6227hWGrbrWI/CfO8q89nNMvmjcPL/yS4WgT9bFK/qzEqE53l0kH5TZ9RAc/XPX/E2iaIGuq+CV+3DtFKMunfox18yIlhizw5iakVozp/zyfQwI5QRSBG/TkdKIrLELV1mbLq1Zg4yE+a4bxGNzCUiTXEj8YxWEtpivjtWBR+xzm8q9KgNCrGg3iGp8LfMncwQqPwO6kCCsBVsk+Xr6TVVIuW/UtnolaMoz0+tij8eivZRtO4Ng5/7hkxX8Ye5LQTb8uEJTPJWTxbFG3mgOSXC8wq3joKan1JUorkEgbwfLupIxdqXgw8tpb2Ygenvu7UHCcECcd5Gvyv1s2lcwDzIhBtV7AusmrRpaG+WvEyuHhlnZ3SdfOtt+FVVwmFCPWWqTr8vuXmAfQvDiPlWK1e3WRIVBKSW4/TpXNDssfFyApQwg24+9E/CEVEOaf9w3K0UBwXszhlPLmf0Sx+SlVtAtC4wxcPN5gm0qJ1ImkCtxq2F+QwNZWqfS+X7TZ+knt5jzFlhz/jo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(6666004)(26005)(86362001)(54906003)(4326008)(8936002)(5660300002)(83380400001)(6486002)(8676002)(38100700001)(2906002)(478600001)(85182001)(6496006)(9686003)(316002)(16526019)(956004)(33716001)(66476007)(66556008)(186003)(66946007)(6916009)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUtjMUlldi93RGZBZVEwKzlZNjhFVUlobHVRdTBhWThXV0N2OVNEQUtPakNC?=
 =?utf-8?B?T2Y2OGJYTlhoMytJZ0pwVHRkbGpSSngrQ0xOTTNSM3BzTlVsYVQ4WEI4TU4r?=
 =?utf-8?B?NXlGS2F0Y1ZhWm9mS3FYQVBZODNOM05iUHgxdCt5aklVMXYydDRkeFkvVCtv?=
 =?utf-8?B?ZnpTT0h3eDc5NENwMExiUS9lRldUazhhaENhb2ZtZzhtMmE2dUJpb3RUczdG?=
 =?utf-8?B?MC9WaVdQTUlZWUNnWTBxYjNuTzhQM2JKOTBBZytDSVRRTCtxakRqYVhqdTdH?=
 =?utf-8?B?S0hxWUdrZkd2Vk5lSmQzZDRLWmZtSXllYnhLQ292Mm9COFhGbXAzUWVsL2hw?=
 =?utf-8?B?Q0pkM0RaS0hidVlwcGxZaFhua2R3QVVKaWw2WFNhOXNPWnJrNE1iZWlPalEx?=
 =?utf-8?B?dTUxRnorL0ZOZ0tmVmk4YTV5TExhLzJiQXVsdThVbTA3NkVxaEEybklxaWJz?=
 =?utf-8?B?NzNiSnN1SXVyZ0lGSmdhRlVsN1NJOVJ3WS9vWU9GZlhQTS9kaDhyUEJqT2sz?=
 =?utf-8?B?OXBtR3did0M5VzNPSW9tN2JBaExvRVQ4NUJVZkN3VjduYmhDSnVWbW50MlBz?=
 =?utf-8?B?bTVYUyswU0lJQVdra1VFeEx6YXp3VUhOa3pGN3RRcWNQWXZhTjVnZjBPSmVX?=
 =?utf-8?B?L2dLbWRBYkFWZFkyUytGNDl5aTN5U3hUcklKTTJDbTBYVFllUVhmVTFDMlRO?=
 =?utf-8?B?MnFzQ29ka1Q1SFQ3dDZmTTBHd0JMUDdwdExOSzY0N1NiNVB0QjVrOGlxQnFa?=
 =?utf-8?B?TDE2Sm1zQmJNUU9STHZEcEl4OXZ6VkxBY0lUV2pNcjFMbFZQOVovTktkK1NP?=
 =?utf-8?B?OW1hZklxMjUyQmVSUWJPTkllMmRpY0RhSzREdklhNVNodklIMzJmbkRNdVpF?=
 =?utf-8?B?UUlNWEdpeXp4OUNucURQUy9nVi9VU0VMQ3NNUEtQSGw0YW02L0E0UC9PV1l5?=
 =?utf-8?B?VlJhV0l0dWJLTy9Ia0Z6Y092eWJnV2Q1R2YrMWJucGlUVGY3NlRnQlpUTzll?=
 =?utf-8?B?S3kvUlZyZk9YcGhnZjhsVDRXWnQwZW84b1FVSGZiT2Q0dWNPNjZHcUY0YUxl?=
 =?utf-8?B?UHhtTnpwRjZ2VUd2TVB6Z1JyWkwrNk0yck9iQy84V2FlbURoWDM1b3owMW8w?=
 =?utf-8?B?NFRCTjVDakF5RGx5bGN1Mk1ncGFVKzVaTGF1Y3lWZ2RHY1hueUEvZEswNVNW?=
 =?utf-8?B?RnV5c2NuQnJQRkM3YTZJS3RkejZwTHFFblNFd3NBYlVscTVLM0JTb0dDMU44?=
 =?utf-8?B?SVdVZmQ2NU1abGQ2M29KT1EvSzN0dm02VG1oTFZubEh6R1c3VE56WStOMC9u?=
 =?utf-8?B?UXR2a1ZVSkxzYmYyaDhDZHl6RFhnaE9wMURIMFJ3MXJZN0lUWDdtM2N5UDNI?=
 =?utf-8?B?RndIdnZkREhNMnU3L2krRm5KM2pnUDdJNytZc3Z2S1BnNkZDQVF2dE5hVTMz?=
 =?utf-8?B?TlpHaXpIRVlTbmNtUlMzdEdNRFNPYURwQ3pTbktzSTZHcW10K2dxRE1VTko5?=
 =?utf-8?B?WFJ2THQrQjlIOGdJYW9DNHRqNzNNclJaZmhPRVkwQXN3OE4yVUJCOXZ5R3F1?=
 =?utf-8?B?RlJjTUtWNTZ0ZzloYlFNUlNPQno4eGZiUlJRRkVPcnNIMHg2a01Eb21kTkY1?=
 =?utf-8?B?TzJkeUhZM3dBTkxhMkV0ZHp4QnBGT29DcHRSblF5MUVNMzlmQ3hFUTBsRTk4?=
 =?utf-8?B?RUpYTHgwNEQ2WUg2VkNYMXJmNUdEMVNPK3JWUno3cEpvVk1PbTRjalUrZEJt?=
 =?utf-8?B?NFJoSzNHUmpJS0ZRQjJUU1o0b1RVRmlkWWFhSFhhTDhZWG1PSFFad3FReTBF?=
 =?utf-8?B?dkY0MEtocEY5djhuNTZ1UT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 975a2d7f-c79f-43a2-118b-08d8f4433034
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:47:48.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1G62teZJgmXp5z7nRy2OMo/B4d5KCcdpbs1vu37bh1n2IKbP8Z3O/TKHw4oJPVM18cod3iES/fLTiPr/Yn6DzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4764
X-OriginatorOrg: citrix.com

On Tue, Mar 30, 2021 at 05:56:35PM +0200, Jan Beulich wrote:
> On 23.03.2021 10:58, Roger Pau Monne wrote:
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -966,3 +966,70 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
> >      free(msrs);
> >      return rc;
> >  }
> > +
> > +int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
> > +                               const xen_cpuid_leaf_t *leaves,
> > +                               uint32_t nr)
> > +{
> > +    unsigned int err_leaf = -1, err_subleaf = -1;
> > +    unsigned int nr_leaves, nr_msrs, i, j;
> > +    xen_cpuid_leaf_t *current;
> > +    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> > +
> > +    if ( rc )
> > +    {
> > +        PERROR("Failed to obtain policy info size");
> > +        return -1;
> > +    }
> > +
> > +    current = calloc(nr_leaves, sizeof(*current));
> > +    if ( !current )
> > +    {
> > +        PERROR("Failed to allocate resources");
> > +        errno = ENOMEM;
> > +        return -1;
> > +    }
> > +
> > +    rc = xc_cpu_policy_serialise(xch, policy, current, &nr_leaves, NULL, 0);
> > +    if ( rc )
> > +        goto out;
> > +
> > +    for ( i = 0; i < nr; i++ )
> > +    {
> > +        const xen_cpuid_leaf_t *update = &leaves[i];
> > +
> > +        for ( j = 0; j < nr_leaves; j++ )
> > +            if ( current[j].leaf == update->leaf &&
> > +                 current[j].subleaf == update->subleaf )
> > +            {
> > +                /*
> > +                 * NB: cannot use an assignation because of the const vs
> > +                 * non-const difference.
> > +                 */
> > +                memcpy(&current[j], update, sizeof(*update));
> 
> I'm having trouble understanding the comment. In
> 
>     current[j] = *update;
> 
> the lvalue is xen_cpuid_leaf_t and the rvalue is const xen_cpuid_leaf_t.
> That the usual (and permitted) arrangement afaics.

I'm sure I was doing something really stupid, and as a bonus I failed
to properly parse the error message I got from the compiler. It's now
fixed here and below.

Thanks, Roger.

