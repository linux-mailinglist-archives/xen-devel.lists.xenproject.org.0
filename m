Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDD404AB5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 13:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183035.330962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIWQ-0005Vf-Bu; Thu, 09 Sep 2021 11:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183035.330962; Thu, 09 Sep 2021 11:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOIWQ-0005Tf-8Y; Thu, 09 Sep 2021 11:47:14 +0000
Received: by outflank-mailman (input) for mailman id 183035;
 Thu, 09 Sep 2021 11:47:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOIWP-0005TW-76
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 11:47:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d0ba1e8-3f70-40cb-a175-bcc29db97450;
 Thu, 09 Sep 2021 11:47:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-FCqiz0XqMk6rcmwqthxy6A-1;
 Thu, 09 Sep 2021 13:47:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 11:47:09 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 11:47:09 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Thu, 9 Sep 2021 11:47:09 +0000
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
X-Inumbo-ID: 7d0ba1e8-3f70-40cb-a175-bcc29db97450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631188031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sULp+l2kqAgCSokCE5w2q5oOsJM9PUFaGgsREdzx00E=;
	b=YYaYaeMlc+PmE5ouMJqd0qoMT4SZGJv3jlv0e3NR7Id1aQDkwGkNIBkUpeHToIjAx+tVGE
	vPZAFUOx/PMwgFepP0oXoNcXJqX8ZV1xdaEM5dGFuiJgqECKL3gYAgDRsBPMGO8dznx6Nn
	o6MFqEJBiE8hXSBH88i1Bmw3ze5xsus=
X-MC-Unique: FCqiz0XqMk6rcmwqthxy6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDBVUTZCF6obwKU3FSpBfoXBvrxSb4WTOk5+IJSglRSP2r0Zgu8/eXhWwlnKbTZidVSgyAFXzoYu125xhVy97ywsWDFayyIgUVlAj2RrwCGBANfUIp+mRzjFBd9EjtNPa1A3dwP2jZfxBwankccqvw/PQJYkHSkyAnSTgODupxGMOgsv/ELXAUeZHZyGaPzDq/qsm2Dgz4OGYfCwIw8ANXYxYpmlDkdx6qaFShe2PYZEdip36N73/LCYziPNTwGBx5Qikx2vWots21px+wuN/eJnBX86KVpvJcsGErEIrE5Ux5pIlS5CBLDmyNmzwr4z5Ur1BtN7PHb3U3YazJwdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0JzcPlTJl3BbF5ISgULEF5qWV4rb7xfJfe1oGQ4LpKw=;
 b=OizRKQGZRz+Cs/ditIXgmd444vnnSqsvPQEXucIxrKH3fwqxJtwcp1OZ8bfs79yoA0CEOCPUiwESxKqxPSIb4S0CBxLYljGtu1OP/8gFJNgv4PK9Dsdk72/dAr/WCNDBxP7TvTiFaInksK5o0VZn9dehCKYfV+rhUZZbWqICK7TzQ3gw023wE7q6JEMKMtl1TM4fPn3fgAjdT2OSn1+ezcG+MPyDK7ldEe2kowrYFeefR2bwd54v3JrV9Nhdi08UEEmzqBZdb8kmSIkIVbPzVKNyTFWpzlvdaqYEcf77s5fTWxmUXhOzEAMkJ1eASlOISWJjSziGAiTCfRaVOVqfiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/svm: Intercept and terminate RDPRU with #UD
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908161918.25911-1-andrew.cooper3@citrix.com>
 <3f272ea6-02ab-8f70-19cf-28a92421531e@suse.com>
 <9a4392f1-dc8b-76aa-f5c0-1db70dce3b42@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4603360-c105-8f69-2c1a-081ea2605e05@suse.com>
Date: Thu, 9 Sep 2021 13:47:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9a4392f1-dc8b-76aa-f5c0-1db70dce3b42@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40fa862e-8f0b-4c09-89a9-08d973878e64
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703764830F24A5525DDB4A18B3D59@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	452srsurza27m6JWSXeRkVxBZo32AHWDdsPxlKAsPjOpi9UOOe+0sIXWkr6BocBambdP2mccLHBHAojjLRXR1gLYDPpy0qP6o1ibjhBqGf3sXt+zCJCzKf76TA5MZKVzH7tRu94y8fIEUAi8nyf3f+ImykQw3c1uO2d5Y3Vv0hq25FB3CfYEBoOkEZmsXf7jXPmE2UV1SMMWgMk8lj9Qy9OhrR8ktBF4wDBkr34KYNb/9LT9I8n3NLp+OPhdNGwKwSbfKJhfzqNkblOfRCy4ZJVd/inlXKVQPk7JLPPhS54IIdt1u9amt6XC/Qf1rk3U6h7vEJoAyoVKeETT8FG7Yig+3tSHZO6XicHAoSCYOP8mbFTxCLFKn4ZOa4Nx/iDjNVIaNbU2Xr9DupQKPgiS/961JtAP8b1cOcYgFv9qmupTOSBR9yHa3z2L9Q5B4AsXvXPwI8+LGSyNQbEx/tl9xHqK/7uu4Vmqap1Nc3jRXEm/IBQbvbb4JftfDGmEZZRWA5pny4r8hUPr/pUmEBPEdFBCCSuiJ/sQu3OSAKYO26knjidimTW+CGNPE9UiZzJ7itUEwMz+8zVjYmC8ywKwiHbhTh80+IRiJPMpFURB45MqJqXqBvU8xYCL1c+u/ZRlRu01QvWmyQ3HxCJBpDIRhp5frE23RDy1eKjAczzSNAYzJEJGrfAXXUeUSLgA7E+RCuzh9losQ7L9Noscr1vnyJd5rLd1q90gPT/pZCQBZtkdQMio8/VRpjm1vunmG5vD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39860400002)(2616005)(16576012)(956004)(26005)(186003)(36756003)(54906003)(2906002)(316002)(53546011)(478600001)(6486002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(8936002)(31696002)(31686004)(86362001)(6916009)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2J7XD/JbpZwEQR6rFQUpJ+m9nIZYJ04sVLS5SFTszjG5U92bnoMB4q8i5bgO?=
 =?us-ascii?Q?hN8YhuMwbLX6u0deGz+pGzHOf5ngW0cmOWgqF0DGNniW/rI6HIy4zxStTmat?=
 =?us-ascii?Q?GepRrOitD937X3tcsrXZcz1we3bKfJd3WRRkMM5J5YlyF//MhcwmVDWVwpZv?=
 =?us-ascii?Q?iiRcIUOsKtZSg7A+Rxhr4cpeZyp6YC3xqfSluq5oBfrRGKNPQZ34vGm1yzmm?=
 =?us-ascii?Q?kPLkewhI1FdV55TjSZPHYblusfR84EBiFDGpDtzT/VNKBTDom76ygOaUR/0M?=
 =?us-ascii?Q?EIWHjqHjwu4HZKASB+LKMWULc5aA0JeqvTtVMP10D4cVeImIt93h4MPVDftb?=
 =?us-ascii?Q?gmvG6pTAIwl19LtmxhDt5DOhfwRjb3M7Z738zXp3OI6DhN19BH/1bsyd0O6x?=
 =?us-ascii?Q?nH9i6HNQ6KIGixECdU1My37LnNplhdbF3mB2QpCNzfTDrvF8GqaFty3wbQpt?=
 =?us-ascii?Q?BQC+hposE6OZF9stHV+A4oP/zn/5BMxc385Qf34ba8jrPQ4dOz3nQ0ZYDLzX?=
 =?us-ascii?Q?pAyn8MYfZXiEw4xa7NHvWdhwuW8bntUu4ixI7sZCAuZpUFPeRVGhRN5Y9TsE?=
 =?us-ascii?Q?omCUVaboPqHGKE3ISODYNKoZj/vRUyBFHTR4moRbz6PD1pFuihgzyrHPeJ11?=
 =?us-ascii?Q?oF6qSeCWUFxGgAIyc/gndcu3HLo2mg8e35NZYfDBvCVb3wp2IWAH6EcStwWi?=
 =?us-ascii?Q?206KuiY87A/I4nf6dE/5X4r5ehvlr86GP6isdnrRbYAp4B8j1qPwGFSKkjIM?=
 =?us-ascii?Q?EOQ1spYyyqSbVbnMs9djvJr9JiyJOGsCxHMwaMuysnBUUrXhREdr0zBlT9UM?=
 =?us-ascii?Q?r8PFyQyoEw04nzaV96hYNXr75LRVdelPOUMKL+os/0lDOGbclh/BxeGiPNKO?=
 =?us-ascii?Q?uMxnPR36res2pCOUUy/lhzqLX7iaN+to/AefdylRGVf355ddVu0JVXgJaTRt?=
 =?us-ascii?Q?7rUDJyn/EPMgeZVAyYuL++921RgKzzmzuxeJP/EJGODSpSfZCyMlsQAuVuRD?=
 =?us-ascii?Q?a3YXnfYV7H/8kI9waORoU2RtAASwE1lwbLrDMFygGXx8A03dnefIlwEm/CJh?=
 =?us-ascii?Q?uNsSDEdNBnQ2Gg2PWKb4cde1i9a1cUZ+G3n++3fPcL8dV5hBuSvvrDbvjRtE?=
 =?us-ascii?Q?x9AO+aQuu0wsRwrNdEEkBogC+tgcnfY4KAPT01S9xPaQDxfBcotNmSn7ReWP?=
 =?us-ascii?Q?b0UcdeRLYHDQpobstzoJsa9X1rS2lTLWozSH/UZXsTmtbxS0LGpNKh+GOepT?=
 =?us-ascii?Q?/DcznSlHFD0CEENjK+sw70Nf+R/7QyYqCMbzkj/DZoW4ab066EzU+dtFkn27?=
 =?us-ascii?Q?AamMi+fy6xr7LCwQS633hpbS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fa862e-8f0b-4c09-89a9-08d973878e64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 11:47:09.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uc4FE5tBdW46BlB8wN7OUK2lvntpjXD7K3Ocgd9J0pAKZCsoNTJk6PxZKdhBSfuOSe6fRchddeAbFoMjYnpjTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

On 09.09.2021 13:34, Andrew Cooper wrote:
> On 09/09/2021 10:57, Jan Beulich wrote:
>> On 08.09.2021 18:19, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>> @@ -70,7 +70,8 @@ static int construct_vmcb(struct vcpu *v)
>>>          GENERAL2_INTERCEPT_STGI        | GENERAL2_INTERCEPT_CLGI      =
  |
>>>          GENERAL2_INTERCEPT_SKINIT      | GENERAL2_INTERCEPT_MWAIT     =
  |
>>>          GENERAL2_INTERCEPT_WBINVD      | GENERAL2_INTERCEPT_MONITOR   =
  |
>>> -        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP;
>>> +        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP     =
  |
>>> +        GENERAL2_INTERCEPT_RDPRU;
>> Some of the other intercepts here suggest it is okay to enable ones
>> in the absence of support in the underlying hardware, but I thought
>> I'd double check. I couldn't find any statement either way in the PM.
>> Assuming this is fine
>=20
> They're just bits in memory.=C2=A0 Older CPUs will ignore them, and indee=
d -
> pre-RDPRU hardware is fine running with this intercept bit set.
>=20
> Honestly, I've got half a mind to default the intercepts to ~0 rather
> than 0.=C2=A0 For running older Xen on new hardware, it will lead to fewe=
r
> unexpected surprises.

I, too, was considering this, but then we have

    default:
    unexpected_exit_type:
        gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
                "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
                exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
    crash_or_fault:
        svm_crash_or_fault(v);
        break;
    }

at the bottom of the switch() statement handling the exit codes.
Getting crashed (or crashing because of an unexpected fault) is
surely a surprise as well (to a guest).

Jan


