Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A206456B2F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 08:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227646.393778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnymH-00009b-Cs; Fri, 19 Nov 2021 07:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227646.393778; Fri, 19 Nov 2021 07:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnymH-00006d-9l; Fri, 19 Nov 2021 07:57:45 +0000
Received: by outflank-mailman (input) for mailman id 227646;
 Fri, 19 Nov 2021 07:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnymF-00006E-OZ
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 07:57:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f4d524a-490e-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 08:57:42 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-0KEf8So2OoKP9lL3zTm7tQ-1; Fri, 19 Nov 2021 08:57:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 19 Nov
 2021 07:57:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 07:57:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0119.eurprd06.prod.outlook.com (2603:10a6:20b:465::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Fri, 19 Nov 2021 07:57:38 +0000
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
X-Inumbo-ID: 5f4d524a-490e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637308661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuciwUj8k0MDAnrhMZDZbD2cFgi46CwvvxiKh7SC2No=;
	b=V73+eRHN5hcZWZAR8Lzw+6IfM/md6kejluffjl2X4ypWFWAuy4miHK5bZRsXuTPKlW6hvr
	RjAh3rIwnLwL2WleRR5FM6B7dDjvlB3pogygey9bufeurbqDT/wQ2sXMdBjKwON06b+jfe
	jr32qcQs9lwny6yb7F6n8gKtJeEtUEY=
X-MC-Unique: 0KEf8So2OoKP9lL3zTm7tQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgt80h/Eu0gbTXE5sztabtISH+cFILhqBywcYOJpYSuHCOi9v6/Y+rmRnuxrni+usz5D3B8SIEh/yS28B7RH9RLxC9RQx3X1edkhTdoZts9n4zxndr2//pDyDjjOXfiPE+n8A27G4nIWGpkvlTFfBU9FC8wbnhZjOUqo6niwondInONO0YwVFUoma67pq3MtKQg8zAG22pIQuc5jIvuAddMeI6Uw+Edsq1DH49QpKoGCCWBCcH1nm1Cfpeij4CX+P2HgwJT9xxQHTEetgofjANYwPk2eebAFiDEwQ9LsOBzbWkMSlKvQ1C3H/N1U3jk0py2vkY0qix7euQ5RxKwAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhC+gXUL7sP9vCz+tuCYMC5rpJ53h+BYaZEXZfZCEAs=;
 b=f4VRPFmTQHWN9vH3AIOm4sh8KqSJs/vIKL3Z880DnmdKDjRtmBxDjinG/i35okPq7xkETyXTFjAuZ84u0sRN6lyGQpfQV9hGDH1i5R+bbCPhN18P1poCXWJWiH6YUKTJUfoM9TXXE7MWedxd7e2hQlAVhT7sJSZFPzuKVHWYpNU8LD9ElgZK9hdMbQ/UIrQ3OMfRRQl8LM0Y5CBmvLrgGghQEAVJR/We5AewyZfty4yUqn0wep4Nuzn160wOi3K6DPJJuFjL8f+/Z7dDhTplLYQla8DrVtK8IrIQ+apwSh7W9JEpMvaUy9srB7NM6n4uwCF90VgRkzHMbgWU7BwP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c2f5986-f217-0e67-66fc-4ed8ff29713b@suse.com>
Date: Fri, 19 Nov 2021 08:57:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/3] x86/Viridian: ExProcessorMasks handling improvements
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
 <0b8a1864-5ae9-3b19-4d43-893a5777985e@srcf.net>
 <44ccd257-6c8b-c35c-a0be-1ebdbd6d8ad6@suse.com>
 <0352b245-8dee-c960-18e2-ee0ae5846001@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0352b245-8dee-c960-18e2-ee0ae5846001@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0119.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d41a9ea6-f7a2-402a-0bf7-08d9ab3241bd
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120DF489C91A64F3C32F39AB39C9@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xa1zqE59lR6NQhWAd2Zuq09/mp/8LqLZfDqA9GguPz286SB5jU82vawCbh8rU+bNIumfPWOp7FkQKVTFf7uSj9uzMONLaDktiR5V9gtLEuOe/ILBeBkSs5tYM/SA3oOsrbb4k14fnaxKicdp+2tPY+mQ9zG+S6m6cfSwMmsTLD4LKY9ETxOL/EJD1WTnR/ss5vVqStnKUbAfUUNccHPktnpd924SLEFV9SarjNbhW2XuIVuQ/XSNezh9HM4HU5DYKYk4SZBtBq7V0815Ym6UlaE1aSDHjL+P7fNV+9dMRquiORl6hMe4pSYp9/sqelCH46/N7Ax/7OlORxA3xkjT+3fxCFKSue49Kb2/tYE1Kdbh1ea2aEIA4EAeDufJHjS9ZzZtJmv/dhaPNXPa+iObUCYUm47kB9BeBGius697cpqlqfxXiolsyxQ1ymafD0t/DHkJ7J/BssgjCbk9DnYbxwp3oRccW4Hg/S7R46FfmsvdXquhWm8LxnXJ67k/z85jqqINkGizsy8rZXOnfkL45bAqm1/B0k8xFVml0TRFQh4usBPkczX3NJX8Rvr8v3Y+WYBMKTwcP5+MyjI8gXZ/Zd5e0DlMdabLlT2LMFzkJeZbt2n1Cb02wROa9WF9b3ooDEV35FJs0xDtcDyiGe5xl9/qYFrnvmTxdMW7dZDnTceYeIomRaqEoGXGwMaAE73NezkRWcMMrjW5NUJUC5clm/cI8KqOw7SXbkWjrdvYFjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(316002)(16576012)(86362001)(6916009)(31696002)(31686004)(956004)(36756003)(5660300002)(6486002)(2616005)(8676002)(8936002)(54906003)(83380400001)(53546011)(38100700002)(186003)(26005)(66946007)(66556008)(2906002)(4326008)(66476007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kkdkxb3983f/8i2DFgyyPtu9OzziTxi7c798vUdCwGiYsS1FOlrQCqbHI8bM?=
 =?us-ascii?Q?cD3oQsdZ020eSdAjzQb540TcQgZv3BsHE402ONZ8a2VfeNLIw8ovs5bp2b6d?=
 =?us-ascii?Q?T56gsU+V3NV4tXUe1c7ZMHWH/lf79N6b1pGLEtGos/3MCKCPl00c68HMgQoY?=
 =?us-ascii?Q?SynHq/XrQ4tiEc/nuBpCY/1pYDyv+7mpm9Ka9nbsjmXeWMaw2eBqc+S4jpQS?=
 =?us-ascii?Q?hmMzd2OqtkmwhaS/rCUBVbLPzZaeqlTtH5HFKcq9QoAOQa6s+crZFqW1OOlA?=
 =?us-ascii?Q?YC4g6rdS2rXXbgkdY5GAmAQ7zj+7iqgI429og17b24HpcEZkxxlBW0DiBxWo?=
 =?us-ascii?Q?ChQBbrQ4+hyXlr8ccOBX8kLB3o7zd8pIvlfTY9hNofq8WHRB0GylHPhA6Jt/?=
 =?us-ascii?Q?JW58L3OLR7MhL3d//yBruhDgay5l5esgYqtbP9tO2Z2ibwOdS+PJNSpChKy2?=
 =?us-ascii?Q?/o/Wzccepk91SbEdW/SqL8ztsM1VtIDDyiVXhw7XsRHxukgt+W4Ja8xtp3iT?=
 =?us-ascii?Q?YodemYCcV0gQN8h4BdQHWGxDLWElhc1FT5HTfMA7LVaDvYeVfM4KvTlxs8pL?=
 =?us-ascii?Q?6LOwCeQjgQ59GvlsF29nxGGfi5vNkMTjoYbZ6LJ5C/T5k17G3U28MxR0xzzg?=
 =?us-ascii?Q?jT3L60nGUaFBh/NbeR/uajJDM14ofbuWEGloNvE/9j6GuHAHTVVl3aYpN5At?=
 =?us-ascii?Q?/HkH46dq/0DcOpGh4u/kodKWCkdLSWBfLmx9VkAybDnb0cIORPPS+OfqMnxa?=
 =?us-ascii?Q?TpQOGw2a9bTbZYEy7lBf1xVNE9xYAlQotDd4uLorlukEM6JkOWEEJM7P18Na?=
 =?us-ascii?Q?HkP/ucMk2Qp62ZnpJPNPu9QqEoWZLqav62Ne4BraAAGksIoa1gf+55D8Crc3?=
 =?us-ascii?Q?bhtkDiHnu83OXQqoAgKcGlYMLIDTx9yJK60XYvROVgTHmtf6dv7TfZLqBTHF?=
 =?us-ascii?Q?XDa/T+qe/zkRKfc/IbpxZvGTR1hsS3mRmMlhXUXqPmS7CIzdI/Nfs3UkvXX1?=
 =?us-ascii?Q?B6Vwyx7zdTi1crakPx4EPnie0pjinTNJH2X2gVzF3zRR1/k2X56aQpiS+TbY?=
 =?us-ascii?Q?ofYQ1SwFjJ4ElVyUnfo9APUyhzwZfrMTg0iSSDtDHI4BMBoQgDAO4zbSFoup?=
 =?us-ascii?Q?VUByVG8kzCRmhAjvybnpwRvDiy3uZZBGHIPLb80wD1mS7pO16F8U3tMhjmi2?=
 =?us-ascii?Q?7aAvq34RjwJbF89hiW94OPIK2PHPO2FCB5yUGsYlhASufEyX1ZnOMUokPToR?=
 =?us-ascii?Q?czHbY2IZIzleAfByAIIX0pFy98sH55R+COXdqtc+4CQ7V4j76VSfLDPj2oCM?=
 =?us-ascii?Q?ofzvPkX0tp6Xvwpj06mReYirJpO/b1Ibr7cHGE73MnDIE2Y8UfWrXxxaXXcr?=
 =?us-ascii?Q?p5XeCZjkMy6wdbNLCDuS1T8Gy6hvZlO8G/VcG7UKeaTdc3CRA9NaGBCNJCG2?=
 =?us-ascii?Q?psJ8RA4/inVjOmjBIOajrwIIBJ8BL8uZv1Q/s4QJRAbedQWuctK13WqJVvxL?=
 =?us-ascii?Q?lonswH0s2wGDAixCiP/DuPlWkRyBvV/G10ev85IAsPoJRqCoEm3KrOiB33dl?=
 =?us-ascii?Q?HPc47uNmUFgKOsoo2biPGHc/6RrkumvIlT3bOL1sJ1pvrbNP9q/+mCl+tL9r?=
 =?us-ascii?Q?4B8eRKXCaPd8tEhXbxBtjnc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41a9ea6-f7a2-402a-0bf7-08d9ab3241bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 07:57:39.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOA5RbTri3UVMa2oWulTK2BQzD3e+WQt1O0QoWR+i/TBJiLYfM7c2U600/wSqMqzcWGoL2/AM6uYkQ+4WA0Wxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 18.11.2021 19:05, Andrew Cooper wrote:
> On 18/11/2021 13:34, Jan Beulich wrote:
>> On 18.11.2021 14:20, Andrew Cooper wrote:
>>> On 18/11/2021 13:12, Jan Beulich wrote:
>>>> I've noticed the bugs fixed in patch 1 only while doing the other clea=
nup.
>>>>
>>>> 1: fix error code use
>>>> 2: drop dead variable updates
>>>> 3: fold duplicate vpset retrieval code
>>> Oh, nice.=C2=A0 This makes it rather easier to do the flush short-circu=
it for
>>> HV_GENERIC_SET_ALL.
>> To be honest I first thought it might, but now I'm not sure anymore.
>=20
> Just this delta:
>=20
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c
> b/xen/arch/x86/hvm/viridian/viridian.c
> index 658e68f7f2bb..c8c05bfb04a1 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -771,7 +771,8 @@ static int hvcall_flush_ex(const union
> hypercall_input *input,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(input_para=
ms)) !=3D HVMTRANS_okay )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS )
> +=C2=A0=C2=A0=C2=A0 if ( input_params.flags & HV_FLUSH_ALL_PROCESSORS ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 input_params.set.format=
 =3D=3D HV_GENERIC_SET_ALL )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vcpu_bitmap =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0 {
>=20
> which now I come to think of it independent of your cleanup, and small
> enough to be folded into my main IPI change.

FTAOD please keep my R-b there with this addition.

Jan


