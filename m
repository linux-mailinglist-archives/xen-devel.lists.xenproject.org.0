Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8D4BB465
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275225.470998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKynm-0007Lh-MU; Fri, 18 Feb 2022 08:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275225.470998; Fri, 18 Feb 2022 08:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKynm-0007Jj-JH; Fri, 18 Feb 2022 08:39:42 +0000
Received: by outflank-mailman (input) for mailman id 275225;
 Fri, 18 Feb 2022 08:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKynk-0007Jd-OZ
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:39:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb99333-9096-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 09:39:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-S3qw7ABENImTacbhv9hK2Q-2; Fri, 18 Feb 2022 09:39:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6086.eurprd04.prod.outlook.com (2603:10a6:20b:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 18 Feb
 2022 08:39:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:39:36 +0000
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
X-Inumbo-ID: 4eb99333-9096-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645173579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVCxnMLfzFqoNvutd3hEV89puCpn08g09o07iaObBvA=;
	b=IRF1HyV2cTnbieoN5uAWj3+IwGQPaKB4ye1aw0RyLBiihna3S+jy6WzpovsrSreewONyx2
	DPTGzGQL4NR+gTysk9sIpwrYiEVxLRAhX6RxgTYQ40YHKeh1nP4zY6YZqYGitqQIfnuf3L
	ADvUFwV2l/hNt4Y9QbXrM/nGYnv8yRc=
X-MC-Unique: S3qw7ABENImTacbhv9hK2Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNIpPE0xhfGD92xBSBSWuCa1PEzu1R8TTh1KSTJBKuTkUyJWMDpe6BXizLp94CZ43vCETB3G+ex4OnWs/nlXAWnvsTMsZIK8JiuUvRVOCF1Pl5jVf3hu/QZoRFJuacdxF0clq8TrjkAWxK37AHooHS6r7H7N/ruBTIOEyiLRUlcVsfpOmFIhJ07ugAGpRRoYbJVgoHLDYjt2tgQ8cMzyTMrLdoI1ytpo7xO/Xn3dLSGFAXTAPTfjT1bGPHCEdnAHDc8ZgEVpY+Xn5K6VI6KTuPxIc+7Zkc2g2N1E2h1g2Pl/Xhk3/YFcPKoSMlqXV2vUNuxVoz+VsDKvPai0XK/pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sA2PzKQ4OmUxqARxBo/HC7VSsPJXf02Cdes+lt85rmc=;
 b=DU/e11UJC1L+x9Gm4oX7yBj4kdGEoi+uWh+cF9R6pSkQwXkMmoYoofpU+toe0EKYPOgdzQfb48R1lqZhbzj85lmAOZKOkiNm9K+ThrboCJJYib8aPR0tlZbbuWN92xu5mhGkM86/YIPnH6quzj6+Vkm/BVNp4RZTrJXNxz7AMODprUY5lfU/sAgufe1dkpQkvZQmHUnM4RWAIAugvF8PMaZYOQWi46T5ny+RRPIVPGcR+dfTzvwwaA1ji8hykSm6WBzSxGBIdhHmSXI2tigZQA/kz7uifvdY43Q6bx1iBz57u1IZ11ftFbspDH3t3XkckAbQY4KTQ3nCIm+xl9Dw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66c63b32-aca9-0fb8-ea6d-8b91c23eed9e@suse.com>
Date: Fri, 18 Feb 2022 09:39:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Ping: [PATCH] x86: replace a few do_div() uses
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <01baee92-9d7f-5a2c-d63f-1de390bc10e2@suse.com>
 <a5af3a6a-da51-2624-622e-2566c8db7dce@srcf.net>
 <f4dd528a-d1e0-f516-bb7d-f1ec01abc3d5@suse.com>
In-Reply-To: <f4dd528a-d1e0-f516-bb7d-f1ec01abc3d5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3213bd-a183-47cd-6ea6-08d9f2ba319d
X-MS-TrafficTypeDiagnostic: AM6PR04MB6086:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6086AB2FF5AD931287915932B3379@AM6PR04MB6086.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+/Hh8Gqsi5QQYhXV+XuH4i0BrzUwzIDJWiQNu30xdVWdBxt+MlzCaBz7sch8MLeW+/pNeElP8/PIR1Qa6cDYRlQoygNGjRzO2bFW9pHf45aevK/3DS0IYiMwWPpgttuIoTKpnWfzKHl0FRitvl3HYGDRcyzYhsXDbNxONKqwfjquePesSQtaAuJpgNvLQ6jBP5uity8fZf3/LZQTOU+1IVfZFZlzlNc/n5d/pjZrgjcPpw35UWTp9XOKiGIv0zSaFC+wzQOVdSWKaxargIe/NeGy4iAI1GbPmCE3FG21pvXHxUG0TgfFNGOD0sL/iCH9/Rj9hs1+ZAthn0oEF52YDB28dhV84lQ65smXWSl168xoZHOJ3QWF0rOGwHHmzkq7OepKk0pBEX8a67C2FeOr/S8jvtHD7F2uQTxp61jnAR0IpfFnAPuja7JnZnbFiHi+k5vFdxQB3j9zTdqonE11FIPPv0aMA9gpJziP6XTYJfse4doH13va+wH1Zkrd4VcG4ZZpwEOP/oH7WuYVvlqnra9gSnQX7aFc+hyX53MD7hiv/AmebyJ1p3iK7Fo5WTEl+mDP8wu4Fi+iYm5onvQCPHJMLtMDy2em8MqPwEiD1Wp9lLFaqjB/ogKXcv0LcPzDwDgx+sJgZwWCWPOcM7jHwmAGdBE2+0iPh3+7xDSXAW4u9NngLZ6vBKRVb6ok2emIZQjXXSerMe6B4JmFEvs6wNmAzVeUagKXsylmnFSTW4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(2616005)(8936002)(38100700002)(66946007)(83380400001)(2906002)(8676002)(4326008)(26005)(66556008)(186003)(31696002)(31686004)(86362001)(6506007)(53546011)(66476007)(316002)(508600001)(6916009)(36756003)(54906003)(6486002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OpH0w7pCa6EUsulIAGIVxnqAt9ieSICO5hvwYR+Oc2tKSo//5gHJ77pqbrER?=
 =?us-ascii?Q?hEClnaJGP6dHckxjIaXlvnbIFEMlI8T3Lnoz7+BweIvuGe5nnH8spq537fXl?=
 =?us-ascii?Q?MHBSlh43xrACo4qJgZlLbFg4Tt01eZ04iu9m4eXFCtpRGP98hpPFEtl48FsW?=
 =?us-ascii?Q?oohU8UevPFdBAQCwC3yzMZZ5rV+r9WYbu4t2o1GURKqTNZlH+oTU5VayuyS2?=
 =?us-ascii?Q?prciveTnUUHUCdxLbwjprS2MgoE5I+ISAB71EilcsURXBxh7uMQct3dMLFgu?=
 =?us-ascii?Q?a9pdK9Kr355FY9Jhey3TiTSB06nVyHZ0PLQyt9HgSyUDd0yZfzojBcxczRHX?=
 =?us-ascii?Q?6wRDrPotZ8bDjcbVGkhrcnX10XnXIso0f2UZ4ooikZr2Q+oftdzWirLdkNOd?=
 =?us-ascii?Q?UprYJcUkg3im1viuxE9BJFB7RiJ+0dMG9OEd1Ctd0lt/ZJc/cQfOY91kgI9i?=
 =?us-ascii?Q?EgpoLgo2foJMNN30ChOYF2DqD73zF75xpWMq6oZNGQ35WZfxsK20uARQNcfN?=
 =?us-ascii?Q?TCgwF4qAznF4I+b1JFQsrH7HuRYcPqGJ+dro9xKUHGD65xk3tIRexAhWJdaR?=
 =?us-ascii?Q?bmmobr139lgh2y4kweyqMGe3AxjmadAT2XRSYAk4gnadgtOxsM591qhF3+YY?=
 =?us-ascii?Q?673FimzScKpDms//GULuMl/wY4R02BPX3dw/9G5zpn8/OHWSmFwBd1qciDHs?=
 =?us-ascii?Q?JOR2j/P30s7kahXpUe+PYSzlX85vJhjhmOXRm56iI/40mC7il24MGFGURM7P?=
 =?us-ascii?Q?X17sShtBTA8aWoVANZrdzPfZS1LjnXKEinVXZyKq4uaaLUN5vbJa9OAXI3ub?=
 =?us-ascii?Q?RjtTTNOsiAnNFCJL33vtJ6XUt7OwU3AYX+fuX5fZKR9OzZlOFWebyAj1j7oZ?=
 =?us-ascii?Q?FqHBU8Y8DnzBqitvEXeMCLxb51VHD9ZkArfAVOYiy+NEnPz+yRQdZ+i1zLl3?=
 =?us-ascii?Q?gYMglR4ZgR9/u3AH+2bk0hX8qwCQR29ch+ClTg3UvCvSIN/MgZt+iIHfr8Pk?=
 =?us-ascii?Q?+mMxzq8FAJ7KSMW0nM6cfb8gvCmNLFGemgGQfiLqMaH4aywIRCFwAej1j/XP?=
 =?us-ascii?Q?4t9WU1Yllm90SuCun4LqzhiynEyhig/IeS4qQfTYj8kZRaJUFEEYzkl5rn1x?=
 =?us-ascii?Q?XMgXgTdxp9Zjm+ymqTCB0BIfzj3pBO6+CCUagAGfVkFY3zUei78wp3riE59g?=
 =?us-ascii?Q?RBiL8VAJbQaQYQOaEISvy6j0BIqdlWHEtMdVknRoyudJSVzGWHZmpkiWxzPi?=
 =?us-ascii?Q?RcsIZ1ScXY+Y82iF6wCkx6brLQ2ZykkifjPXXzXw98s+dRffAdDABu8HNQOH?=
 =?us-ascii?Q?sC2T1EdtFTFwcXMAJAd5giT2l+S8cZiCB/mPXuHCBSHmUJfhBKpn952J1CIp?=
 =?us-ascii?Q?zJIA4stXB9/lmhPTDdblrj/+QEHo3NIkMdjP0+NwWO7MmOwE3N//KR+yS2Nd?=
 =?us-ascii?Q?5qQ0ym+/juvFmmEtXrv6CC+AFoImfVcU7RsR0Std4czjSYreLvM4wNOoqfj8?=
 =?us-ascii?Q?MOV9+Zg+jmwrQRoAsLTPykY23S8w8G9/nReFw90ZKBGv5IZjTG2xVZ7oOyAm?=
 =?us-ascii?Q?JfnDEt9PI/1lxCds5QScBRGaY4w+PYU6yonVoYtEDR4qpHzNXdrYGcS4/Vww?=
 =?us-ascii?Q?gx0fxd+IXYFBHwc2jHvwj1s=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3213bd-a183-47cd-6ea6-08d9f2ba319d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:39:36.1906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7hOstShIxy6DMwhbuGU/vsevPfbIuxxOBAFFm8VFzaT7pGVMd2StZ+ujxX5bQCPgwWa++aOhNGQmsXxbcL3law==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6086

On 12.01.2022 10:28, Jan Beulich wrote:
> On 12.01.2022 10:22, Andrew Cooper wrote:
>> On 12/01/2022 09:00, Jan Beulich wrote:
>>> When the macro's "return value" is not used, the macro use can be
>>> replaced by a simply division, avoiding some obfuscation.
>>>
>>> According to my observations, no change to generated code.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I like this change in principle, but see below.
>>
>> do_div() needs to be deleted, because it's far too easy screw up.=C2=A0 =
At a
>> bare minimum, it should be replaced with a static inline that takes it's
>> first parameter by pointer, because then at least every callsite reads
>> correctly in terms of the C language.
>=20
> That ought to be a 2nd step, requiring agreement with Arm folks (and
> adjustments to their code).
>=20
>>> --- a/xen/arch/x86/time.c
>>> +++ b/xen/arch/x86/time.c
>>> @@ -610,8 +610,7 @@ static uint64_t xen_timer_cpu_frequency(
>>>      struct vcpu_time_info *info =3D &this_cpu(vcpu_info)->time;
>>>      uint64_t freq;
>>> =20
>>> -    freq =3D 1000000000ULL << 32;
>>> -    do_div(freq, info->tsc_to_system_mul);
>>> +    freq =3D (1000000000ULL << 32) / info->tsc_to_system_mul;
>>>      if ( info->tsc_shift < 0 )
>>>          freq <<=3D -info->tsc_shift;
>>
>> do_div()'s output is consumed here.=C2=A0 I don't think this hunk is saf=
e to
>> convert.
>=20
> If by "output" you mean its "return value", then it clearly isn't
> consumed. And I continue to think that I did express correctly the
> effect do_div() did have on "freq".

I think I did address both points (the earlier one was actually more a
remark imo anyway, not a request to change anything right in this patch),
so may I please ask for an ack (or a response clarifying what I'm not
understanding in what you have said)?

Thanks, Jan


