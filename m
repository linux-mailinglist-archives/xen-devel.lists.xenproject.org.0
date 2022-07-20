Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9423557B798
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 15:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371795.603662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9sm-0000hk-4D; Wed, 20 Jul 2022 13:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371795.603662; Wed, 20 Jul 2022 13:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE9sm-0000fO-1N; Wed, 20 Jul 2022 13:36:56 +0000
Received: by outflank-mailman (input) for mailman id 371795;
 Wed, 20 Jul 2022 13:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H1QO=XZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oE9sl-0000fG-7x
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 13:36:55 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150059.outbound.protection.outlook.com [40.107.15.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044e94ff-0831-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 15:36:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3272.eurprd04.prod.outlook.com (2603:10a6:6:10::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:36:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 13:36:52 +0000
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
X-Inumbo-ID: 044e94ff-0831-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjX+Jh8umV3vkbksm+MnCV/ge8xQGEbMYjASCPoNX71fKDJYn28ws9513ONW9yz/+R1S3Zu9vwJSl7lV6xM/Eb1GZjysSe7guMdE2gyJwrTRttaaF7Pq9d8sReM1xQUeg2DbsYimld76VAeDnjqvAHOAozQBa7JASyZs2/uJZTUDyYuP9eLILZDZ7Twd9dTHRvq2D7fPAzhHN2GI2ZmfX723W4IdW5brldUZxXH2xepEwg1lhvl294j2lzZF01Zo+MnmZcfzfP7HOZC4B+8Uzm4tLZ5c7qPj83tcZREWGPaSP+/Sfa+oaq/XnY08EWVCF1+6db45Qh3AfPCP77LcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02Xp6Q0Kl5AIhlobm5XcZDgjJAMUIe8aGwPMEGe9YWc=;
 b=AyWDaqHRjvUDdOaL9Q83r12wsF5uwCwUHkG2erwRIMM8yBcBVT78apbNoP9m0cRr5mNnIxBsKacJr8r17LlMDyjBFHXa4Y/F4fZo480l97UIylfzhPeVn+94mpF3qztw0dEEdOJnmWWRemsd60Gw+jeLm6XYfe75RNvwX5M2h4x7qjqY3CjluvAiy+EcFX04+k3J1Wg9M3JeIjYTzi649MEp7HGWgnVxnSKxnRAXOvtr/2pql6AcSlI6M2pEoxLVzIQK70ErquNoXZULp7akiuoUzySUT0VnhQpMnMdwaN0LmMXbULnJzo//N7A/jcVm7nHOfjAziKOR3OxorqARyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Xp6Q0Kl5AIhlobm5XcZDgjJAMUIe8aGwPMEGe9YWc=;
 b=lBXRmcwv8ziIBx1ZzbyuEYJuedQ15wQdgG9x7ns5tMROn9ayhqXd4QgCELDRITOMInzbzXkBvck1x8X2SQBOP+LM4sDOKcP8NB/XHKNjxt1Y9DNqihqqOUh0Lne0NLkB6+SxeIVYICFGjEefxagKj2baBAlnEFOMbeCICEuerLYPMFXq2DCnpaSc62Lx3T48BzBXfUoL4gnZ+iAb/5B0EBT2u2zGt5bl2BRmVYVQtZwoUpHUj27hBEiaZjz7rE92gN0dE8OZV38tGKA4O7v4Zc03lYuz7fXTVt3KctYmT/hQnTf2kGa2Ni5VDwfCmbvha9k2ftMPtEXgmWGzwwmUTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d1eb47d-607b-1519-7e38-d0b574dc5d6d@suse.com>
Date: Wed, 20 Jul 2022 15:36:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86: also suppress use of MMX insns
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 ChrisD <chris@dalessio.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c35482f1-f1a2-5326-2ecb-9e97881fab01@suse.com>
 <8fa727c8-3ee8-44e5-74c3-2c9c585f12c0@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8fa727c8-3ee8-44e5-74c3-2c9c585f12c0@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0364.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64527076-e61e-40be-a109-08da6a54e7c8
X-MS-TrafficTypeDiagnostic: DB6PR04MB3272:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p+4DYoahxWmIeMVNGlwoXifws2VEYpJvY9mhgOi2mXidRqrQY0R2COQIMN9PqhKwnQPL+FyO2BGG92M54SuuTXeAUWrcD6rIOFJDvJegvzNo1oY4zavMnv+OrqhL3pI3/iNvl9C4UHi5bcsPGFYbNYMpjHlAePdea6PdXYBJBMTXqnRc6/44W0em00eMaEQbu1b5+hrMyHlZyP8SyOSIIxJ0XTSczbtkhIuGHZXHXhK+W+3EaH8gsAYCSZruQYYza3UMlCCqStbYF5k6lfXagEDMVKiWxKtbE8KYQNAZrlZt5TX6KlnMoa3bWosoRbczqma1IG9l3gDVnrTnIoRtnznQQSUBaH3OGRCsz8VD+pLF2iJu2E7eVtygnWsm8V2m9AWLz2pnkH4X5NbhbbcaF+7z/VJcwce3ySNRGY7QMlP047zUKsI82a/19PIuu57llcxfBzxCfPIgEUymZAxqsyVFUJfGYV+Nl2mDJzP15yfOLmVGIOH8PmiZ2y1E9cJ9dxm2iKdF4dC4h2iYPAj7zgi8NbI5RkF0K7WMHrckz4GTv3MuZF/AOHiS2uhOHNZ5RYB8U74Pwa3NfdTwX809OsDt0nSeVH/Expb6MOtTbty3+6jf6O7ZOtEscpX5RVs4XE8ZQ6aaHAwwZnfkPKl0EWl3l4nTA/0yoBP0LoLdccagTDBhZPthzX+ms5Bss9FzXBt9po7v0z4LQixgJ+MWZUGG0f2x3Ua3bylbRoYOyONe+ZqSO6X4v9oVXew4LI7F3wYsLSubNBu3oMSIAd8Mk6iM89AUmWxa6BXmXpz9h7pUxgJZU7DB8vy6rK3GxCcKXgvNWpTO53o5/SPUCyStEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(376002)(366004)(396003)(26005)(53546011)(6486002)(31686004)(36756003)(8936002)(4744005)(2906002)(41300700001)(5660300002)(6506007)(31696002)(2616005)(186003)(86362001)(6916009)(54906003)(8676002)(66556008)(316002)(478600001)(66946007)(38100700002)(4326008)(66476007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEl6SEhKUXBZRkJOd3RGZHdHTzVQRmRMcHNjMkpOVFM4LzA5VG9RWi9Wakto?=
 =?utf-8?B?VGMrTkpVVTZTZEwvRjlHY2EwRHpmSVplbzgzdWN2U2xQbUlocUpaUXJzekEv?=
 =?utf-8?B?ZytXdFNXUnd4RVFHOWY3YWtSRVlEWXZVOFg4Mlpra25pQ2VsR2RueU05ZHhj?=
 =?utf-8?B?a0twVTlvU2hsM0pMa1lNVmswV0NmVU1kbWFRZFo5WjRPdVpVRFpuY3MrcUtD?=
 =?utf-8?B?TGQrNUxiY1JiNHBWUEVLQUpHRldOU0w5LzVRenZOczRkdkZjT3dZK0RPZ1Fz?=
 =?utf-8?B?NGNreUxrOWhRMWtrTXBxWHY1NVJGbXpBRzJMVWlwOGlSNzVJeG9qVG5xTFRx?=
 =?utf-8?B?N3J2aTlTV29jLzBxSEFtdDd3b0lJZ1JJcGRsdm1oMjUvQjZyN1FwdGc0cWx0?=
 =?utf-8?B?ZlFnWTlMKzZsSUFXNk5DODFxREwvWURQOWlKZk42ZW1aV244NGZic2JJOEFl?=
 =?utf-8?B?L0NqUlFmditLalhnSXdwQy9HVmRjaTFERTdlZUIwV0JVWXBGTGlzZEVNSlg0?=
 =?utf-8?B?L1hLZlh0WnBib01Oc3pkVktIWUpZWHdnaXVleFphZGJmZkZtNTFySnROeVpI?=
 =?utf-8?B?Q0dJK0U0bys3TEkrdG9VQi9UM2VsWXh1U2ppYW9aOXNORUEzdG9JNHczcFZj?=
 =?utf-8?B?OHZRR01lMXdOQ1BVQVQzdnkrSFdXdXRuMXZXbUg4M2xFU3NGRU5JYUd5NE9B?=
 =?utf-8?B?TlpORUlnc0tnRXZPUWRUWkRFZmlMWDRBNXZudFYycXhrZ1cvd2wrcVNhRWVG?=
 =?utf-8?B?cWdRU1lUSnpZbmJJUTVTYzNZNWtTOXd1QTl6Rko3NDFXUHBOdHRFN0dDekVy?=
 =?utf-8?B?L0NyLzhnTVI1VG9jZ08yWWhjTXlSSHNRKzU2d2NkM1RBZVdaV3R0VGhUemNY?=
 =?utf-8?B?MVBVSlp3aWhFZkIvYVF0SnY0QjJYaWxSWDJoRFErM1dSQnl6YXlPU2dFWStR?=
 =?utf-8?B?L3ZycGJiaE5hUXVNeS9rV1VxUEFMbHdxZXBZM0J2bG9EOEkxV3pBVEVyMi9j?=
 =?utf-8?B?dDFTM2swV1gvMFhxTkRYa01QeC80RElFbHlraXJLTXY2Rk1WZnpERE14MHli?=
 =?utf-8?B?bjI3aGJhU0Z6V3RhLzNxZVNFYVQ4eHFVN3NNSklHaXhuOEd0L2RXOVIwSHls?=
 =?utf-8?B?K1FpM1gxVlUySDNjWUtWNDBVVUdWSzZ5T28yNDJJT3BCU0JCZnhlTGhjNXdy?=
 =?utf-8?B?Y01va0paM2xJWnpLTFZmK2N4N25EYndpS3lvV1E2OUFRMnpiQjlXYlFJZG94?=
 =?utf-8?B?Z3BFUFBNVmtxb04wTG00VXlZQ2VuRGhZbS8rN3Z2NkR3c3FTR0k3YXR2cEE1?=
 =?utf-8?B?dG0rZ1EveFBrYkpqVGlrTGkxT0lJclFLSGRlZmdSOFpGbnd2ckZWUHlEMGZo?=
 =?utf-8?B?eVBCSTk3WEx6VXVCQllrazE3MEo4dTBmd0VEc1RPekcxYjQ4R011eWpKTktm?=
 =?utf-8?B?dyswam1RZWJVNVNYTlc3NWpiSkU5c085Q0V0SHRGcmlqRjhpUWZEazZUbE1W?=
 =?utf-8?B?Y2h6ekllb05wQVNTcnhYRVY2YTJVOG5qS1FJcDJNR3UwSStGUDl4bG5tL1BG?=
 =?utf-8?B?YmpZM29qaEJsY1FudFM1SnI2SzcrQmVxWkZ6OXdBRGd6QlBIY05OdzhRZnUv?=
 =?utf-8?B?U0pqeXA5ZmJpbFZwZmNRQUdaYjlvbjJMUHNjQ2xrekR0VlhUOFlRcThBYU0y?=
 =?utf-8?B?ZTlYRml6ekJBeXhTTHhYcFVwSWZQcXRQbzVPNHdtOXlKTlROcFZkdmp1U3Yy?=
 =?utf-8?B?cUcycWYzOTV1NG8yWDNMMWJWTlcyUXJENEErMDQ4ZGkzUGpiUXB6YWhyaW1r?=
 =?utf-8?B?YUx6UEUxN0YwMkpmYTRlWDVhSXVLNzNFKzhtekxZT004eW81K1ZsNDNaUTlO?=
 =?utf-8?B?TGhVR1doRWlNbzVBNXJkNnlLcldPa0p0TDJzbjEyZjVsejMzR3JkZXE5UlRO?=
 =?utf-8?B?SUhvVktJeWFIZ0t5RWVGSkFVakFaTTIwY0F1azFhWmhNSjAyRHMwT29UUGJF?=
 =?utf-8?B?WE8zQ3NuU2U2V1lYWWVsQ3RJZ0I2N1FEVlM2b0E5OEwrbjVDa1dZY0pTc1hU?=
 =?utf-8?B?MDNsZGw0NlhFV0xtdlVvdHRXbVErcm8yQm1tYURPeVFMVEZ4S1FBcHArL0Fw?=
 =?utf-8?Q?rrZjC3vW7UZG3U26IoejfKd7c?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64527076-e61e-40be-a109-08da6a54e7c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:36:52.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9q0MWVZC2BEbOudtl1iAGHnIcTK8/uupQipBOyyru942pM4lAH98pVxtF/eceHrfkxneZVaKmSGArse1/7cZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3272

On 20.07.2022 15:33, Andrew Cooper wrote:
> On 20/07/2022 14:30, Jan Beulich wrote:
>> Passing -mno-sse alone is not enough: The compiler may still find
>> (questionable) reasons to use MMX insns. In particular with gcc12 use
>> of MOVD+PUNPCKLDQ+MOVQ was observed in an apparent attempt to auto-
>> vectorize the storing of two adjacent zeroes, 32 bits each.
>>
>> Reported-by: ChrisD <chris@dalessio.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> But while we're at it, what else might we have to clobber to stop
> nonsense like this?  x87 and avx come to mind.

AVX is taking SSE as a prereq (with -mno-sse %xmm etc registers simply
are unavailable). And with -msoft-float I would very much hope we have
clearly indicated to the compiler that we want no x87 insns whatsoever.

Jan

