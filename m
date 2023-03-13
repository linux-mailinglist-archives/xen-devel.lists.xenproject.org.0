Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D356B7197
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 09:51:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509165.784453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdtd-0002tI-6G; Mon, 13 Mar 2023 08:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509165.784453; Mon, 13 Mar 2023 08:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbdtd-0002r6-3X; Mon, 13 Mar 2023 08:51:09 +0000
Received: by outflank-mailman (input) for mailman id 509165;
 Mon, 13 Mar 2023 08:51:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbdtc-0002qj-1f
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 08:51:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7d00::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec6ed4d-c17c-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 09:51:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9237.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 08:51:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 08:51:00 +0000
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
X-Inumbo-ID: 2ec6ed4d-c17c-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZJUS+4hHgR8M9XyvuxEoPkV3CwPLEcx08f7f528vExnca96yx28w6dv0+vLLfUbZx3A/ZpokCUo7gI4qjwYT7TaSPExoyYoo2rNTyI4+fK3XK7L/npvkVJ0Wl/rMHjd/BsQfg0nXrK+NX/fpgvp8rg/RsUz31uUe6Y7EyHvK7pQTMw+2g1e90XPiNGyW+mw3a3DVoBGl2R3TqlqKHEoy1iflOYPPIyObL8FJyL3S8xIyup/ORXG/Bgy+2/V66tdqXWMsrxrsOIBumzT5F5FTophQ1a6KUV0WFp9DNzMOKMZrlpc4BXbRYjwgULxwGTYtDkIn1BDWPQE8zZOBmpYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfrqzWsc4VLnScZs6DhsxmCfA+SsjVybkPhE3Ti7ulY=;
 b=ivU7M2K0okYlbWoGTBXB0QAOdGDC61/lwXK4QwDIYTXhQ3uSrnsjeC0nqgDyVmkaQHprov9HgwLUXHc/PBIhRvyARjn4V8WS39bWMBHU42PiOgIyRj+sCLwEtGy8/LxCmErlUUYj9I4GCw1gEEwP9W8JGD8oOVBI09oSuSK0aDno9VR9DI5WKKKLHmFzIkqT53UU7IXQBGcRyMLvbhxFtIxPfQRCMINt/0yMegGylRtXUGzWL0xmnfmoGjjX9jBm9K+rd2mGwiktlePCtdqalC97kgO6QXQgXGMk3uGREwIGWIKJt7G0IJekNIkA2WiBMJWJQXxg7NvJp6S3Eo2j9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfrqzWsc4VLnScZs6DhsxmCfA+SsjVybkPhE3Ti7ulY=;
 b=vxBlLuqhCr2nt5NJbzhk8xZbn7LKXUj4YilGfZ82DlZgSijhBKk+nIolqtCpGvaya6xKuGNxARoQMVvtX7Gg94xAa4r3x6NoO251WrOot11/x0P0NsXZ5isfr7rbI36bXHQsZdLZ/8al0f8Iqa/D6p40hERmlSv+IVaG0uPnBOnnCt6DG628sY06jAkzd7CT7/iRgfr3lMbS494lvlklQ+6PZQLocSs+1hDwSA6tbMguD3SW5u/uu2Vx7XcZHDuujf5RWmATNkrS9tJgwYTqcdL9SKPLRfTqEPlrpGZMudXMN6a/gOfHh266ctuOLKqx8V5CrFkshPU6rjCx1JmFjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ab2c05f-80cd-5548-722a-86e6d521568d@suse.com>
Date: Mon, 13 Mar 2023 09:51:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/3] x86: Minor improvements to xen-cpuid
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230310203712.1431387-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: b601f170-d983-4fbb-f8ac-08db23a011c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MjIyEp/FLhyS2Bg8jT6m5cmLh7trDHS3/d4Kyo4iF45bj/Z1BEz7iGq27mnw/dwJvNbWcF/u4xEkes17Lx31Ydt7dFyFWx4In7AxD0KOe3FpdNDjRV0dTwGz4kQTuJC3G073/qYCJcibYvi6Z/7dKD+fy6mqYjQKGt1bM6dElk2vEiHEGuGgWZLAfbiTNsL/cGb8v/TpGKCTBKMpYIMY/2v58KjIF2pDqJUEx1bqLeYI8vPNU0CNnlHqmi6CTXeQZCV2l7cLDHAxQwvsCon/2i9KPlnFb0th3ZzBhu4P5YTLVf9Vit/SFzHeESDE67NmXKs/vlSsi0xi6A+X8Ixe4eEk4HTshvMd8M2Tz3EPVVXao4tD3CmgDOp75RkJM4/zcxUivY7dO+z5y8gs1Kjve/Bvn/xVgtzrZ6pXDPEKFiPIniafc2tsHN/ObuDbBCPTe5JDYqhzUAsgUmnClo1zwv8OpHzk6g8VuhMaV+gVpC7OlvMyr6FK5b0rgPuc2zpUGV+i6sekVI0EKZnwi2Sdv3D0PnlXhDT3okEsKX6u3+F3LqmdUOkyZuQg/mwaJ93rtDs6CMmf0AUGzmRiGIqj8lnFhelVXjHQw1WMjLPqvH5yPCPRdCWqFtmLMSTGEjxd59UCZHu11Ngj+KEfACuOG5JEMYp2/i+nJsQ7smcnUy0HaGc0X/WBTtc7dnODsICv6crOoL3FkWgxJG0+pzm22MAKAT7PTeRdKacvc8tQNUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(478600001)(83380400001)(2906002)(38100700002)(86362001)(5660300002)(8936002)(4744005)(31696002)(36756003)(4326008)(8676002)(6916009)(66946007)(66556008)(66476007)(54906003)(41300700001)(316002)(26005)(186003)(2616005)(6512007)(6506007)(53546011)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHFWaVczT0NtMWhWSGU2VlNwRjFLdFpHSStDbkV5KzhKN056TXdISkhYVEVJ?=
 =?utf-8?B?R2lWZHpDMjJxVlhVOWRta0lkcWhMRUhuNXAvL1JrUkw3aEd1WDNYWlc5TTRX?=
 =?utf-8?B?SXdQYTR6c1M3NDUzcW1CMjVEZDZWaTZ4b2V5eU82VktKTThjODk5UjBlb2Y1?=
 =?utf-8?B?bm82NDFMV3V3TGVCTjRYaEtKclEyYkQzckpreUQyQmV0eTVIYnFaeTBjM1My?=
 =?utf-8?B?MmxnUkQyckJQeVk1Um9QZzc1UVFQNFEzYUs5MFhIK3Y4VFhzY3FNVzJOeDBo?=
 =?utf-8?B?WU50OVFKcmx3TDFoYXhjS0ZRcU9XaDlGNnVaUm5zRjZPN3VKM2lWSGYvWVVv?=
 =?utf-8?B?ZnpHcFc4T0tQUUQxN09FamROMENpenFPSDZld1B2N1NLRWRXVXlrTTkvTDAz?=
 =?utf-8?B?UHpsTE5QR2ZPTHNNSUducnE2REVCSjFGY3NkM0RZTm1GMmFJcTk4K2N1TUpj?=
 =?utf-8?B?ZWc2elBpZ25mTThxNmNNWnFSYUdZb3B2ZytJYTFPbmhzNEpmZk4zUUpiMk5q?=
 =?utf-8?B?dTA0OUV5Nk4yOGt1U1pUdlRROTM2c1RlUVE1Z3dHdkgxRHJ1em5aRWRvNDdM?=
 =?utf-8?B?WFFlSW1Ddm4xc1hvN0NYVStOUGZlN3B5MmhKdjRHN1pMc0IxVjY1dDNuL0gy?=
 =?utf-8?B?TVFNeGl4b2craGxDRFpBQUJCZkVKbjQ1cWRaYUxORWVVblBTT0lBUzM5d3dt?=
 =?utf-8?B?NlNlMWNlUDlQemJaTjVpTGFQMSs0UTZ5UHFsN1lKdktDWXkyanNDRUZKeVhv?=
 =?utf-8?B?dHVZdE5OOGdrVWU4RW9DTjNubHlueFZrcWVZMnBmcFUyTUx6ZlRaRzFaYWlT?=
 =?utf-8?B?ZkRTVXcrOEh4YXFZWGZCbWtzUlRBaS8wMHNpVFh2SEJnQXBwTXF4emEwMFJj?=
 =?utf-8?B?NElkdCtoZ3ozQVNNekh5TjMxMHdtZWVnV2p6R0YrRGthaE5jbVNwdzZiMmdL?=
 =?utf-8?B?R2diM1ZjU3BOOUdJQlhsb3NRRG55Zkh4RFUxMDFqTVIzY1NabTgxQ3Jqbktj?=
 =?utf-8?B?dTBxL0p3bkZxNXhvUUJxUWsrTzduVFJBVTJjRnNMMUozU2tzaElIQnFDb1Nu?=
 =?utf-8?B?VlJ1MVh3YTFaNmdwZWsvOXdhdEtROEFkZFp6d2NZK0RGKzMzWnZib1J1L0I3?=
 =?utf-8?B?bEdZNGsrWHh3c1JHbk9ycFBVQytZK3EweUFiVnUzRDNNOHVIcHdib3lmazJi?=
 =?utf-8?B?YmVEZWpZV29jWTYxWnBLQ2N6V09RQXZjMVFSY1FTQVJzcEh0R0hDVmFlc2c0?=
 =?utf-8?B?bmZ6bXNkdWJhVzJlY0VOTkN1R0Jab2prUEFhTUVyYi9LSG10MkNEMHFMOUZW?=
 =?utf-8?B?SStWeFZXRis4Vkwwd2Yrd0R0TWk0azV4bXN4NHFkM2RNVlYzMkdxcCtIN0Vr?=
 =?utf-8?B?UXlRQU9CVllFKzU3QTg2Vm5ma2tVSWRnVzJBRFYrOG5MZ1pqNktZaHdZNGZr?=
 =?utf-8?B?eWl1VjNEczNYVWtqc0hzN3ZDcWEvV3Jab3lvYWRHOUJEd2FqNGhiZ0pTUS9U?=
 =?utf-8?B?c0V2M2dMU010QUxXUTFVenBsZ3p2ejVONFRvNWt2amhwYzd5K08wVXNYQ2k5?=
 =?utf-8?B?SHFQMHJnbHg1R3BiLzNLQXJrRTFNVGk2c3R6bmI5djNES3RjK001aW50VUUv?=
 =?utf-8?B?OTgyakZ0Z2dubmF2VXk1UGt4RE5tdFltbEFsNGhpeWtQUEx0L3dGejAvMEVZ?=
 =?utf-8?B?WHE5QzFJVFNIM0hGTmRScE9xK1lDdzd6UzZGNDcvV0FZTEpnNnR1VzNDc2dj?=
 =?utf-8?B?NS9BK1dHNzQ5UDVpMVBqeklpM2VSQWJBUDY3RnpTcVo4SEdTK0RqSU40ZjVj?=
 =?utf-8?B?cGVyaDNqZTQ3eHZHaDNEUVRTb1pOSFU5L0lPdlJicXArTHgwaDdYdzh3T3Zr?=
 =?utf-8?B?T2c2QXN3S3pLdWFZaXFHNDZDekdNMnpBeWlzZnczaU1VWEIwTFF1UGFsb1N5?=
 =?utf-8?B?Rk94NUFVdldyS3NYaW5PMnNMRjBvN1NvQXRqR1hneU1VajRNSm5INnBzdXlP?=
 =?utf-8?B?QmgyMW5NZjRKK09VeFZLVDlubkRMek5DUDJJMHU4NjUxd25pcmNkYm5XUFNh?=
 =?utf-8?B?bHEvVjlJeWVVMWo4amR6NmdFUEJHOU4vZm5VRWNCU0RXbmNzUTBINmlaMlhQ?=
 =?utf-8?Q?4Z+PL6xJcP7Nval9isT15KMut?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b601f170-d983-4fbb-f8ac-08db23a011c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 08:51:00.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCQJpMGxtfOUczY5Ig0HVz7iy+I6zknGVT9a3rIKGw0qiZaa+9olYhkH3Ys5GA1ZhgecpKIp00xm5r/yQDtWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9237

On 10.03.2023 21:37, Andrew Cooper wrote:
> All to make it easier to do CPUID development work (which is fairness is
> mostly me).
> 
> Andrew Cooper (3):
>   tools/xen-cpuid: Support dash as a bitmap delimiter
>   tools/xen-cpuid: Rework the handling of dynamic featuresets
>   x86/sysctl: Retrofit XEN_SYSCTL_cpu_featureset_{pv,hvm}_max

Acked-by: Jan Beulich <jbeulich@suse.com>



