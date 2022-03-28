Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4FE4E8FA3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 10:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295349.502540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYkJZ-0000zq-6S; Mon, 28 Mar 2022 08:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295349.502540; Mon, 28 Mar 2022 08:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYkJZ-0000wi-2f; Mon, 28 Mar 2022 08:01:25 +0000
Received: by outflank-mailman (input) for mailman id 295349;
 Mon, 28 Mar 2022 08:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nYkJX-0000wJ-O5
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 08:01:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4225c1e1-ae6d-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 10:01:22 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-ht9aaLqwNBmXrQmfnV_deA-1; Mon, 28 Mar 2022 10:01:19 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 08:01:18 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 08:01:18 +0000
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
X-Inumbo-ID: 4225c1e1-ae6d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648454482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0P6GmUH77+aZ3ylUQrs/UF+9IJkM6ERu1BhuZM+h7k=;
	b=lAAqBK4Vut1BFcztQNpX6VUOsoPDhpmCDdE+/7S3nfhyryV2xyIZuc0uECpImLPgsuLWMz
	TrBOw/woVv33RIPcev+jcMscop/IknU78UuURPTjWKH/xVmu0ZqDyKigZL2kduvuuuNRfL
	0OntjavGItNsZ2oclH6KJo5b+ZXCvDQ=
X-MC-Unique: ht9aaLqwNBmXrQmfnV_deA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3NMNXdtcIQbSUD6S0KFQOZQ51HltVxTp1nrgydQBX0kDkotu5PInkMq8j30aXF/ha8OKD11tWp7W8QgCAjdwe9dcj3weaNPMijt6VcMMNQu6o5SFkTnlaJvEbqSsaSmU+Aw89BhgqHd96R+ulmEgma5aB6nvv82fcqAOHkRxXKlVmNKuaIWu9ZaAjWefFSEIqYylabXHGKogdl0skCvbtKMkGDLUXSiSeuIPhfQcy3c6qKKN2Hq8CqO1rlkOIaW0kC1toIWCp14t9fN/gw/zFcqkggMUFoO6KTJmG28ySR4WBF8SgB1Q+4RLNsakZcu+fnBitmgpsYzlsQo++AqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9mEmxrl8ffP3GS7lGrHnftNEJDZMAYobYpyn3MjpVs=;
 b=V15F/0fKd5lH2ArfgYT48CFR62gmat1gxYUdJ/I3iQhsPpotzpM5WM4Jhyoq+x09l7rXaM/SeCxmKYJ80siTmWqyPbEoOcfFSQTzn5/M74ISljkUXRMIY3EixZkDL/ZBOeSN6HX1t/wA+tDt5ay/5bYCgI7XpvT1BYIcyCwK/JCLTwyYq6jeWlTfzN4YE5P+ICbF7xo8Gc7atmNG3zKALNSTrhA3Qdfsrz1SZAScfvA8UUHIkvVRSWRAeNV2HULSGjPpwElvb4fD0UyxHnYlReUNABvNss5mzSPSFmhYyXtdky2a7TX12rM4GOO+xs40SHEYAgZEER2hbp5WVAxQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09b2072f-6337-94d2-c6e0-e31d70edfbac@suse.com>
Date: Mon, 28 Mar 2022 10:01:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
 <c5b13e54-8868-3d30-70ee-1d1daa082ec6@suse.com>
 <f2be5a63-837a-204e-ba5e-5ecb48c9caad@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2be5a63-837a-204e-ba5e-5ecb48c9caad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::34) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 822f749a-48f7-48c3-b798-08da10912394
X-MS-TrafficTypeDiagnostic: DB8PR04MB7131:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7131DD8DBC4BFB8C9EE9A15EB31D9@DB8PR04MB7131.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SJ3mrBne7pGDqrZ9ckeVUt69S7wvnwv3K8LLDG1sg8nCajc65UEp0+M9hBiCHdC2Ep/3b4Hlw6fiQehbgR36VekGST0wSfneTHrbVWRN6EW8wXxSaaIlHOoGpdtQ1e2NrkBkafpkiRha9mE6dcBi/fOQtuhsPfR3cBtXfazjFXg836MMNaW+s2e0PE25J40G2zrQAGFaQsagReWv0hKouAL7p9FIXC/C+9+r0e/41w13gLiHqJdI81KmYhxiyyNhAeskqdfKJvdo3COSP3A/MR+qo/nnONuDdAiGAfabQblZCZxiR8+3ZgllydYdR/xZWCgY/1ttCapTE8u/cgbEU+keJcEg8HcYOgEwsVQ8AqXXb7x8QqnjSvtg4a20iIXX5oHf87n675Tn5CjTYyBR15juHbnNwzypuuZk7KDa3/uWInmzmwuq9NDh7RwwuJz+lxemBauVSyUDjlxJtXaWelzvDkYXXp6va+W4KNjWsidqeY1OTq0XRqXeJoIZD47D7LbR2Ry3BB52nzwp9B1sriQSbaj5cjYGrpkDe5lxwlCfISP2xnfOabGp27b9rySMdw4nJWK6DaUp2wCCaRNB0yqilfPP9evEAb6Arm9XgcEkvt/3Ds36cwGMmOsKkXADgv/dHANqlHmR4pwC1wfnTxwlNQqPi4cxkgaDTpjCq7QP4nh4Swlk4F0WtG/mLYZr36lacnDc7vDTBIDItfh2W4FScKxx7KIcKVJhphz6zgWxIJnJNfQ/Naf502EgBd+d1YX4eZ8rqrOkRbQ7qmMbpPGF9qNIaGzrqw4+u93EV+tl2SrpRm6ajTgm/BFfjz1OcviFi0G5AfQPmqcf8zZAEDufAf1D498FSfWr7RHf+41nwhW1J9l7S6un4JzPQToZBOkpHw174fLXE3VC72CUhRyaFtqQJorpd8qLaCB8Egxzz3G0sMSro5dUdZxbr30r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(508600001)(86362001)(31686004)(8936002)(26005)(5660300002)(6486002)(186003)(316002)(31696002)(2906002)(6512007)(6506007)(66476007)(8676002)(2616005)(4326008)(53546011)(6916009)(66556008)(83380400001)(54906003)(66946007)(36756003)(4744005)(59356011)(207903002)(219803003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q52LDia0leIZZv2Q2mobYVAJYCHMHeUHIdlCfGlw833ZwuCV1xupL8ijdxoT?=
 =?us-ascii?Q?q2lZsUyE4oIZq6n4AY3nTyhJMLW2/SoAWSNIMFgrcnoxMuTUxRUXShnKqHlf?=
 =?us-ascii?Q?uPYtkZ0Sd9kPe0y022YOUJMOooau/KrWJ8FdH+r8QmHf4uO9EccDU+866ci/?=
 =?us-ascii?Q?I8xuUhalNgaR89CfUTfo0oo+IWswQzKA/B3pltvXtOXF60596qhytYoALzqx?=
 =?us-ascii?Q?gSKizBPw5RZgkBsbYK1omTIcoBCUNeMhgUMkxD3KOh4IDmQWLcxCfgZAaFTC?=
 =?us-ascii?Q?fH+3w+/CxjKVnGOdyV2U4PHbBMlwOviFJxPvcm70EUmTpc8KFG2k2Gz73qkX?=
 =?us-ascii?Q?iLVio5HgKNZ0EHyg20Gf9lFE03LG1YLc6tmpT0KdbcvNkEWJxojiV8u7Xw73?=
 =?us-ascii?Q?K+50m43xpHFr9FDGQPcgVzPZyQ/QzqwJu3iGwDoiRR7ltbz24mMoaXv/1MfL?=
 =?us-ascii?Q?zMU/Fq31ZTFHVRAW8tCf8HYamuHUyKEKsCqlQ++6IMKPnbE1kVW/nks0WwSc?=
 =?us-ascii?Q?3KG+ll0CyuUfhGCF6uGw+iI/Ap/82Ytn2ZiZjXWRRxCMROBmdl3XbnWWzyCX?=
 =?us-ascii?Q?YG8BT+OERE2gu38CifDZhAetNBiGf4KO1oHsDbj6i9h8CR6/D4WsIQ9SkPts?=
 =?us-ascii?Q?WNZN52cnYwsUQDRPBE/tceTPOXB98ttxAKi1jKcmfXIlNtvZ9K840V4SXRlH?=
 =?us-ascii?Q?B4uCI0HZJmcy76Iu6UJUCgjSSKjpLHOTMIEV96Cldj5cQGj750MacMElVWa6?=
 =?us-ascii?Q?N9llNDQVkB8QlFvMag+otYLlRxuOWS5bB+HZshsFv9/yyCvByJc0CLBOBXZ4?=
 =?us-ascii?Q?thwVpgRUJ6uKkIg2xu/O68ym4cmqdhH1+WE4BDIfF8huD+K2+inR/gHQsA0F?=
 =?us-ascii?Q?wEKM7gSNpRfzAzVUBK86IrlfNGjqITwD5oo2Dh3pZJzge5mI0dBMQ7XSK9L9?=
 =?us-ascii?Q?Jxpz/EjxEahXjjYqqXJZp0dstsmyx6pb4J+FYhVKsvUBrahQWpLVjfVvzRkw?=
 =?us-ascii?Q?YfAQUveSC8/K3z/qvn9h+b7hH+FaCEr/t3RU1JTwPxaYqtwg6OxH8hmVsTcf?=
 =?us-ascii?Q?H2FhXKJM0gWfjXajs6AKs/l2EwM+qJXxwC/Kmn3fXBOgqAkCCloRNF6TA7AB?=
 =?us-ascii?Q?QHznr3cj845NzEa7YHLhPXqbADu5Rk2/0IftVYMw91U5BoSMA4osCXbpFftc?=
 =?us-ascii?Q?CzdFoxLIplExx3vHqclpTBdX6i3WT6S09bwNsYubRRDtUJHvO7tUkEMTYjjw?=
 =?us-ascii?Q?Mpf5dHcaipbjmtaQkpPxprYjbS9JuKev7M3Ek+qDawHCe71JtahULNtynhtL?=
 =?us-ascii?Q?rzqWZen0hQf1Sskm4m521MeoB1pJ4SYDC8xZYxEh0T5K8naS0biBPcytQX4y?=
 =?us-ascii?Q?AdkgVYCf2SXnGtXreqUoVNdFVgZx0VbPDO0GW7H3N2pp+8lVhchvojdjmq4C?=
 =?us-ascii?Q?xyEOrk5NnokO7qV9t4aHIir2wyuuRYikCRIAAqjAg3Y/GgBe/5ik+w74nBWc?=
 =?us-ascii?Q?15AyAkbcsBZ9xVaINzKP/2Xh0m9G9yGEBzdO7/JxXioLNtMbgInYQz5bIW5V?=
 =?us-ascii?Q?cPkS1KG788zAetZnxjBZbb5kLJNSjpUQsnHw6MtuwycDhHICfvgPEBx5cd6I?=
 =?us-ascii?Q?rd2CpCmdEeB/TcJ6J33GdquLVjEj/oiQFhge1wfWF5+VgA+yh5TQjum26Prp?=
 =?us-ascii?Q?HpR9Rj7A4LC9AGI+C21AQqD9Et04lduffQ1sBh6CespXCzCZDYSzFRr9s/eb?=
 =?us-ascii?Q?25tgYRG/ZA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822f749a-48f7-48c3-b798-08da10912394
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 08:01:18.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnxkaWjSeabLw2mb8LAI8wsMv7xPVHLUptFdkpdzTc3XaBGW1zgsddmZ/WLrXcH4vkQD5NXmsJb+qfdR/ygKIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131

On 25.03.2022 17:39, Andrew Cooper wrote:
> On 09/03/2022 13:03, Jan Beulich wrote:
>> On 09.03.2022 13:39, Andrew Cooper wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -6,6 +6,12 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>> =20
>>>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dshortlog;h=3Dstaging) - TBD
>>> =20
>>> +### Added
>>> + - __ro_after_init support on x86, for marking data as immutable after=
 boot.
>> I'm not sure something like this (being an implementation detail) belong=
s
>> here.
>=20
> Having things immutable after boot is not an implementation detail.=C2=A0=
 It
> is an important security hardening property, and deserves to be here.

Well. Are you suggesting that we repeat this statement for every release
where at least one variable was converted to use __ro_after_init? The
mere introduction of the new section has no hardening effect at all;
every use of it is a single small step.

Jan


