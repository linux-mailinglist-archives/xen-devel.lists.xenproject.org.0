Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6E4D5D0A
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 09:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288825.489886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaL5-0005lk-D7; Fri, 11 Mar 2022 08:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288825.489886; Fri, 11 Mar 2022 08:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSaL5-0005jc-8f; Fri, 11 Mar 2022 08:09:31 +0000
Received: by outflank-mailman (input) for mailman id 288825;
 Fri, 11 Mar 2022 08:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSaL3-0005ip-RZ
 for xen-devel@lists.xen.org; Fri, 11 Mar 2022 08:09:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9289c869-a112-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 09:09:28 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-DXckLLDDOR-y-zbnWdt8Xg-1; Fri, 11 Mar 2022 09:09:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 08:09:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 08:09:24 +0000
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
X-Inumbo-ID: 9289c869-a112-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646986168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ndhTxU01gVi5qaL0V/zrOWyWVNtAt9NIcKZrXiULoE=;
	b=Hznxq0ACwbRzrLXqUWH0H4xTcNLRyI+Vyv9Kutr39+wsTdMmKraE1qT/Lheq2AUzntWZi/
	b7MIxijJr44gwmMdC9WcJ/8esy3QJZJeh1LFMUnQ9ZnXGtekTnsbjNi6eMjHpRpF1ZmtlK
	I7CLxXrHYZA5+Bso/HS6MksROKybJsU=
X-MC-Unique: DXckLLDDOR-y-zbnWdt8Xg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYjwPYD2q7ASPqvUgBZqCWgeFtbVP40xQ9usYMppHs3IHkCG94Foew5bk2cZvzbPalet2+CJXI3kQFaL1xL2UZczgjohrRor5n/bE2CvUH7zipIz7vQFPBpbxXvYN9v1oQKdzpLe4WKHYS5BcGD3F0Y3EOjqzqAzVXXgH1790xgTG4FWmc3VMddu4suMDsgubkeiUAq7rI9UzsXVx07rYyZUZwe/WcPDTQ/DNbZ/B/P2KDAr4C/XUoRUnZv0S0zoELZpTyYk3I9+bEaPWpMYjeYMnB34EyTnx4nc++NZxyDLQGkkqBm7R/ePTh3oLVSkwIn2AvdsC8Lx7iHlWBWlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ndhTxU01gVi5qaL0V/zrOWyWVNtAt9NIcKZrXiULoE=;
 b=EY3ZJPmcSesa78+kPT1vNeVZDd2ZmkY2oHU62c5FAG9gbVqU1tbC2sm2RSm9gRWh9Tfwbo3d3vv+RT1hM7cGYUuSRsdLF219AhXvQsqXq7AJTx5dJRf86Cb0wNN8LcNH8la3ktwXC2mWACHjbG2ZFeRv1y3XoGxs3JHVEgVOvRQ+YV2koK6xhOQs+Ceu1bEjmtOAo6p5j4l5cTgtAArc17gQN60Gws+MruSMSrlsb7COg7ElDBGnlZAfM5VTrghyCesewRyu/6bizK/YVVre0iNCzJlwX5I8OWLZmZC6HDO6ZzdbKNXRJZbbW8sMQIVQqouf8W7AKXVgzCGZQdvefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e74415a-d0d4-321b-be2e-a14db297c51a@suse.com>
Date: Fri, 11 Mar 2022 09:09:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: BUG: libxenlight fails to grant permission to access Intel IGD
 Opregion
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
References: <4703b7f1-8d3c-5128-213c-e39f487e4cde.ref@netscape.net>
 <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
Cc: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4703b7f1-8d3c-5128-213c-e39f487e4cde@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1b72d91-a4f2-43b8-57af-08da03367484
X-MS-TrafficTypeDiagnostic: AS8PR04MB9111:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB91114D2AFAA774330842D1F8B30C9@AS8PR04MB9111.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	geFZhzW86mX7s5zTgjHzKetuOvsF/GqZAniD5Vl0JSyiLWaJs2oj9KrGviLa+ib/YkhWrOV3CWajhhvfpe8djFvggTYf9X719gTlMfGApuS1FUpRszfMN9UjrACCb1Tu1cYHg3xIf45jjcEkRjd0vxIQ+zegD3617bZrL8cwyInasMWcTN7lv73UNmTRXijqtDvT3o8WdgSt3cyp8NoyZ033IaoFroSEL+jAVLATsBYpwSnyLRMfG7ursWDpU2D0wVwqx4F6X8JYlMPPRXXe0Q/MdLIJJey5X7X11h8rIjjPVwXmWuuG+4ABIRpq8ueu7LgTqvz0J9BYgUTye/Z9BydJdXlxLKUVQZILBMKfKd/HO11Hvpu2Epm95G54lnya+tkEy1bqeHuSny3GxkH2l4jd0RrBpXOgoFAoqh/UNcaMo4WFKHODxUUv1KXAua9EKNIDPf2dVyqTlum44CUU/K2EiG5XBf4xmKR1z/bb02d0ddQHNARxDNjie8af3Et7YMCkr+6R2Qz6PZiOQ6PswaPPNxI/Hn1JZtWMe34Vx4fwenc1xK6KHGDC5zjfSeWKR+eqgJvuiuyvV87AfrZRO7W1Y6eCV5lolbjrv/umZAJLEdhxRIabkrOCltZzkWJnTEdM1G7T0UU+lmd491iygvhSJliYYpXTHSHFnt7RlIS103q4AQRG+ym1rctH7KC+sIAvpmxPU/N7Q2R2gx4sdlXH5/9RWv1/vprLnNB8FqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(2906002)(31696002)(38100700002)(53546011)(6506007)(6512007)(6916009)(186003)(26005)(2616005)(316002)(66476007)(66946007)(508600001)(6486002)(5660300002)(4326008)(8676002)(66556008)(83380400001)(36756003)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWpxV044YnZYWmZ5a21hSlUrY3hVTDdQam5kT1FxcmJFUm5Ub3IvVDM3Uy8x?=
 =?utf-8?B?Tk10QjVOdzVsdXFmZ3R4dHBOUGVPdW96L3Y0RE01YTN2SjZtWXdhNTdnZXpx?=
 =?utf-8?B?OVI0UCtHVU1ZemNVYlJReWpqYTZjcHdiVFFZKzNGSGJITFlJc3NHV3BhS1Iy?=
 =?utf-8?B?Q0xSaWZrdE1jN2diYW11NFlKS1c4eEczcXFoYUNYY2F3anROdDdYSlF6aXdL?=
 =?utf-8?B?Ry93VGRMbUp1ZSttZERLVk11NHlZa3VwVnFmelFDeXMvY2RvVE9BQTlaelJs?=
 =?utf-8?B?QTB4MXFlYlBWU3FyeU5ldWJ1TWlQNytqQTA2RVVld0tiNHNjZFpLSnlrNlRr?=
 =?utf-8?B?bGNEdW5rWngyRktlaG00d2tPRGkvWEhRQU1OSFMxWjBqUmNGVG9zT1F0Snov?=
 =?utf-8?B?d3BaVXowVlpSRml1YTlFNmZhMlFUa3VZUmRBNGx4K0J1ZEZ5VzRKQmR1VjNL?=
 =?utf-8?B?dENIY3IzUVV2UFd2NnNKS3F0QUlweUswb2JyQ081VURFM3QvejRNcE5mTEVS?=
 =?utf-8?B?T0NldnoydlladzNaLzFHM1J1QWNmY0lmc3ZCWGtPbFovOEh5UkNsZGU4SHN6?=
 =?utf-8?B?R3lkaFpqS3VaK3dScjVoNWVxdDc0TXpzbmtWVFVMck5UVXh1NzhZKyt3V2xr?=
 =?utf-8?B?VmQ4RVh1aDI4RUVqVFFKd0MxUjYrSng0MjNSbEtZT3NXYTlNSWhiVjhnZy9L?=
 =?utf-8?B?N054RW1WaW9ZR2N2T2xiZ25qdUVLcUJBSnkrZnkyeDBYcmxWNkNkVVdUVjNB?=
 =?utf-8?B?NWdrMEx4ZEVxbTBzalpzWk5VMEFOMTdCVHRCeTRteDd4ZEZBakh1K2pqUWQ5?=
 =?utf-8?B?QkFxWDd4Z1lOY2JJNTBXTlF6TFc5eWlyTDlSTDJ4djhkN3dlYllaMHA4dFJM?=
 =?utf-8?B?TXNBZHRlZnpNS0dzLzA4ckRick14ZmJ5U1dlS2ZYVmxVMTlTRGo1NWhhSFlQ?=
 =?utf-8?B?cHM3c2N5VVhoRVN0b1FEenY0eDVLQk9mbnJqWnVFYjJaRnlObFBCdkdBckda?=
 =?utf-8?B?N2wwOVlSalJPK2l5U2tlMFdkdnFuUVM2eCtpTzlkMzJwYjhuWFdkd2lSN2Ev?=
 =?utf-8?B?dmdXOU45K052NGZycW9VN0l2WnIvU05SWTN0RjE2TnVhQSs5RmRTZnRHeDJP?=
 =?utf-8?B?Z3BsNnJGdXkwRndwUkxHa0dtL1VwbnY5cUtWOWVveUZRdU9JUzlKUk1ZUWFH?=
 =?utf-8?B?ZWZVZ016azNmTWpGNnM5VGxBWjhPeU5ZaFVPbi9IU0k4UUNkemJieGVjSWk2?=
 =?utf-8?B?V0FZUkVUS20yb1dobzJwcFFPb1R3ZHdmbFpYdkRZQ2hTSkQ4YVY4RFo2d1FD?=
 =?utf-8?B?UitQYWVRQ1hTSCt5RW91djJZeEJNczRNZ3JYbnlTM0EveCtRbXZ6a0xla01I?=
 =?utf-8?B?OGtFVFo3Z3dHSnkrQldyV2J3MnQySnNoU2pNdEFZOUdmcjRwbUUySDVXMmRB?=
 =?utf-8?B?aFAwWDZEeDcxNGx5MWUwVzFRWElQYVpQQUltdmNGR1hRVGhzeERaTHlxaTdj?=
 =?utf-8?B?ME5yZCtEdWJjKzg3WWdQZ3VzVElxN0d6QkNySkdnZmNiODJQRHBGNXg3Sk11?=
 =?utf-8?B?ZHNreTFTWHhjby9KZ2hFNngzU2VPamdRTm1FTng4a00zY2FPWkd4RGl6WjNh?=
 =?utf-8?B?cjh1QVpOZmRhU2ZITzVRaU01UFlNOVdKSEN1dWNzczFsZWoyWWFUSUpoMnVy?=
 =?utf-8?B?ZjhrelJVWEx0VFhRbUIvdFlSMzZGU3AvbWUxQTFGTUFpTDJaVmdhUnBheGdE?=
 =?utf-8?B?bFQ5WUh0UUNwTUQyS09pYlVTYm9FN0ZLbVVGQXMxbjI1MHg4T2dJOGRFRzJt?=
 =?utf-8?B?U2ZaZWVibnp5ZitadW5YOWlLMEpTd3NjZGQwQXcrYitZbjk1aDczUFNMTUFy?=
 =?utf-8?B?dXZsV2FrMGU4dWFXR0lTTG1lTnhlRXVuUURLMVE0cnY3QXdUY1NpR0JQY1BP?=
 =?utf-8?Q?rdvrl0koMg0TpWAclwED/kl9Y09t2Yec?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b72d91-a4f2-43b8-57af-08da03367484
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:09:24.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7J4+kLFikP82dOtYntbxazDKkFFCb5gcGepE2p+IRtzY94hpV0CR+lCUxrm4tq7JXJ0d7lq5YWHgbD2sAxykw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111

On 11.03.2022 06:01, Chuck Zmudzinski wrote:
> Further research showed that these two pages at 0xcc490 are for the
> Intel IGD opregion, and because this memory is not permitted to be
> accessed by the domain, the passthrough of an Intel IGD to a Linux
> HVM domain fails, causing a crash of the Linux i915.ko kernel module
> in the HVM domain. My testing, which was on a desktop with a Haswell
> Intel CPU/IGD, confirmed that these two extra pages need to be
> permitted in order for passthrough of the Intel IGD to a Linux
> domain to work properly.
> 
> I find that adding two pages is enough to fix the problem, but I
> have read in other places that the Opregion is actually three pages,
> and maybe newer revisions of the Intel IGD do need three pages instead
> of two. I am testing on a Haswell Intel chip, which is over 8 years old
> now. So the patch I propose adds two pages, but I am not sure if
> it should be three pages for newer Intel chips.
> 
> The failure to map this memory with gfx_passthru enabled
> is therefore a bug, a regression that was introduced with the two
> aforementioned patches way back in 2014 when Xen 4.5 was under
> development.

Thanks for this analysis. It looks quite plausible (but the question
of 2 vs 3 pages of course needs resolving).

> Once I developed a patch, I did more testing with the traditional
> Qemu device model and Debian's package of Xen-4.16 for Debian
> sid/unstable after I discovered where this bug first appeared in
> Xen 4.5-unstable back in 2014. In my testing, Windows HVM domains are
> not affected by this bug and they function properly, most likely
> because proprietary Intel graphics drivers for Windows are more
> forgiving than the Linux open source drivers for Intel graphics
> regarding the details of how Xen and Qemu configure the domain.
> 
> This bug still exists in current supported versions of Xen
> because in Xen 4.16, passthrough of my Haswell Intel IGD to a Linux
> domain still fails with a crash of the i915 Linux kernel module in
> the Linux unprivileged domain when the traditional Qemu device model
> is used in dom0. The patch at the end of this message fixes it.
> 
> I have not yet succeeded in reproducing this bug with the
> upstream device model because there is another bug in Qemu
> upstream that breaks passthrough of the Intel IGD to a Linux HVM
> domU, so for now, to reproduce it, please use the traditional device
> model.
> 
> Also, as a starting point to reproduce the bug, first get Intel IGD
> passthrough to a Windows HVM domain using the Qemu traditional
> device model working on Xen 4.16. Then replace the Windows HVM domain
> with a Linux HVM domain, keeping everything else the same including
> the Qemu traditional device model. I tested using a Debian 11.2
> (bullseye) HVM domain and Debian sid/unstable with Xen 4.16 and
> a build of the Qemu traditional device model from source as
> provided on xenbits.xen.org
> 
> I am using a desktop computer and the xl toolstack and Xen as
> packaged by Debian, except that I added the traditional device
> model that Debian does not provide.
> 
> If you need more info, please let me know. I am not subscribed to
> xen-devel so please cc me with your replies.
> 
> Regards,
> 
> Chuck
> 
> Here is the patch that fixes the bug on Debian sid/Xen 4.16:

As to an actual patch for us to take - please see
docs/process/sending-patches.pandoc for the formal requirements.
(Note this was recently introduced, so you won't find it in the
4.16 sources. But your patch wants to be against latest staging
anyway.)

Jan


