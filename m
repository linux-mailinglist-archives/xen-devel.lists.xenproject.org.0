Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205AF4EAC84
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 13:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295817.503547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZAEo-0002oH-Ml; Tue, 29 Mar 2022 11:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295817.503547; Tue, 29 Mar 2022 11:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZAEo-0002mF-Jc; Tue, 29 Mar 2022 11:42:14 +0000
Received: by outflank-mailman (input) for mailman id 295817;
 Tue, 29 Mar 2022 11:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZAEn-0002m9-9u
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 11:42:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45f7367b-af55-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 13:42:12 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-pMUsyQh4O3-eNIn_7BRL2g-1; Tue, 29 Mar 2022 13:42:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3591.eurprd04.prod.outlook.com (2603:10a6:209:8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Tue, 29 Mar
 2022 11:42:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:42:06 +0000
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
X-Inumbo-ID: 45f7367b-af55-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648554132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zp2mMUYvEkM5FwPe/Frvx9p3jJVKKtOfKDZpTrno/nk=;
	b=X3bm9Qxxbb4IUSNW3UQDKSRC32BSlJTEKkInSmL8ZT2RvTEq4X5N2p70rjHJWLLQQetdwS
	SHrtAiHh8QmBpiRE+yh2Sw1ccoJ98ff7+MBsff5tdgKVGaY6UC340yxQwot9DlIJrQQI3Z
	KEgcCOYuLQISGHKcZ0nAYRshg6gi9QA=
X-MC-Unique: pMUsyQh4O3-eNIn_7BRL2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9capGzp+1TtwMBTa68yOq0XZv9qfVSnRIjqyjZo1e5vkuLUAigUPtDZEL3uy+xU8aFkSw1gh7Bb7rhvhEj969tMOdu0PPYaYE0+N/GcMbNrHgYsPuW/vAPIpm6vMvrnRNpnhcds9YyS7RyrK0XErvgJsLHnjFlHtMVlCwsbcNTzc3yoSzZapbkPWFy3s/OObzJy/OBOhloPL3eXPwnCe4AB/Dr0jiXagvsEL3twZlGmxLufHV3LQnKFzEVvd4SiC99slL2ITeaLsakzQx+ux/H4IuA0aiTPqdkmODddR14sic1C8UY6jbXPL4ixG8gEjpa9BdZnipXZwhFlgZXKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Da0u2wt/JglFiSsVTCZaF9E4pnNdkGgZuM1GgmPz5Y=;
 b=C1+D1mm8bzPT+SgLQ4prZCEQeEwskHSRmm+ecsF9OSTuE/TKvRZ3DOxhfj3Vn/raL6Xy0Y/m8+JGjpsJtt5o9T6JviyTE6lD7gDJaEN7IxS/7jiYf0xt8+YKqYtaWpmHsmsl4htDlfKLaZqnDI9LocL/3NcZuWLTX5kdgku2tqhlo24L9BIQZXq/52lVDnmZECHFBibsCL/s/a9ie1M0Hwsa8aELwN8b/kGl9qRVvEhidHBjFx1rRp1ucLrZPOLTbetYr65WYg2PFQ+dWKHeOQu5whe7tRPwPkb6F+lCv1msnXSxqlBdTuCtVKAwiC5Jxix5Pa99E2BF2kfHnLkAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
Date: Tue, 29 Mar 2022 13:42:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16b8e549-ff84-4f65-3aa3-08da1179267f
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3591:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3591197EC7EE15EC4A15AB85B31E9@AM6PR0402MB3591.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3KnE6WSsP8Th7KdMrqnW+Va4Kog+LBfJQhpg5ELORONbaY8dQJze1eY9HovLAv8+6dP1k2aUrBUQ9F8pt5K9Tqs0Zg4XUPDq2vSBLtZs0ZvPnH/1Av32I8Dfgw0nOdkfkaGjtSeM/QJqXA3RsrQRs7D8Zg9JpAkiKJaiUUpiyy/xlaW190a5kXPW1tqpiAsutXeawk34iZDnZoOCENEYIGwL2dMDt9iv3a+MzSdbBy8MxS6E/+cEVyD3tpadPNlDpEVorG65EBJ/to5jlM1jPhTnb4XOuXBD71GOS08VcUS/A/xmAcKuIW722lpaTFqfBZaJBpJDWPIXlEkbmBIRa6+OrI15u2+c8j3FXjdZt20Y6MKXwPj9RCTlZRae3ewfOUnOq+dd1HuPJUPWFViLSghRj6nw0KAgyYWy6sriSau+g21N9ZGdPTysxRWhWR4puc5Z/+nksioDBAO47OeiaY3LVB3eY4OCZoICtRvt9u6Xs0/95hnA35zTm7ccWzf7AbQbujFPvWBKqjvTHJcTG7nRAPtTOZKdh4xziwVIfuUZMIlwY0FWxNIvLo8phs8xduxxE1yTE0fruSFB2AN6DqIJdYVz2hBfBNU2zhho2kRivRlgNSNXFLHrxB3pU6SwNI48OFm3n4+moIXqmDZZizxCyAtEq/Dyx62jhJEsmPXaZsOeyS7KvSQKqX8BLYcQtST/g1ag3ojGau3pXVoDmCRxnp6xtHoBRl22JdUw5129PUViFkSicFbCTD/Q+Xmu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(86362001)(31696002)(186003)(66946007)(8676002)(26005)(38100700002)(4326008)(66556008)(66476007)(316002)(8936002)(6916009)(6486002)(6512007)(2906002)(508600001)(6506007)(36756003)(54906003)(5660300002)(7416002)(31686004)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zAKrR+3wIDswPEuzxUVyqxyoSeAqZy6hMgrblZDgANH1btUtMLyp0K65FhmB?=
 =?us-ascii?Q?LH8YDffB3Rewz2paaQ2x6UxG6r8iVERtn0mST0aMdGa13f22fndZ9cTrxMwV?=
 =?us-ascii?Q?Hw+YUoU7pTUT07uBOkMhQVP57LMMLEFmtPvicDdLTEnO7+jiKSX7xKX8HcoV?=
 =?us-ascii?Q?OCAHGW5CDHxTzzxDnQg6+fI925qOmPihlFqOGGcH8Htb6uYvPJTA92sNEWe1?=
 =?us-ascii?Q?aBjay/gXWg3r6T2Zqvd9WceAmXr32/gpa6EFga8wogpgZBdkbdgawKvpJH7o?=
 =?us-ascii?Q?idhjT1FS9RcwiXZXcG/uKHhsf3Inj73KSkdjLyJoyxxEODqVAnl89ay3U38L?=
 =?us-ascii?Q?i06RgBdtz9QA5baLJ68E8nsWcEZETvzL3JmUz1iewsF8SzILDZj2Hlan0SnK?=
 =?us-ascii?Q?EyqZKhAybTW2zlaeAKKMXmmjwfodDMwOBamIv9vYJ33thGp0uGCGZrz9icsy?=
 =?us-ascii?Q?WdF+W1+MlDMGVueyk11UXUCXB3dG9KKZJ6uLyHI6S4iAo2erYy75gx0yn/0l?=
 =?us-ascii?Q?RVtVchYjDoFY/Yew7V5rVVDFPc3x+fHgzBwLglHl5N0FGjSiOz2jJoS+YRey?=
 =?us-ascii?Q?RSrxxO1dCIockHoszLNzN3RlWwCrpEW6hOcPj9cd0eHPGqyuKx1HoiHNrJnl?=
 =?us-ascii?Q?pK0Nh3IQi5joxPUxvDClEPDND0g4eWMpPoiRxnMQXWiKr+5Hz9Ryuci4kZvk?=
 =?us-ascii?Q?PEzbFqKus8lTNrBkiIPp3Xqlutbp1JiPu/nr/u+UgFYnCdDdpA7BHHPHPzbF?=
 =?us-ascii?Q?Mz2oW1w/fgkQk++dH1VIFzf6i97E37yl/K+5Mqi1PxBXUrM7sxKZOQyae6ok?=
 =?us-ascii?Q?03zyADsksSSqxBaUpg1e6SxTY5IDcI7muhaOwelxgcHIFba+zYv2ZkN/FM3+?=
 =?us-ascii?Q?PmlgS9iFP6VZP2mdsEojsKFEfwQKjBCTfaRFZlGDGDLKBCDSXPmYg9s5sF7h?=
 =?us-ascii?Q?+6zRLexVqfi9SAT0wgy27V0QXFQM+1lWAXOald/HdFe8crRyP7rCfA0lTbL5?=
 =?us-ascii?Q?aAqX+90OHmYfzcbrvK+rsyqJp+YHibCBJutyp3q3jKBdM+fGoC3O8Q5DV5Cv?=
 =?us-ascii?Q?CLIb47dSm6c/dzTDylmqWdttgVkmdrR3oPLaLZOvApwuxBnaiIik0pTrmJVD?=
 =?us-ascii?Q?+n05o3+z/Cd7PXqWTGTRF+qdx9WmDe572o9CptksyaCb2Jm0jdWzGnOiFYRU?=
 =?us-ascii?Q?7nd7V8Tuzx5izJHc/yj1Ipik0kj+wzvblF6Hfmn7Bj2iJ7TD9+oDxqteRc1H?=
 =?us-ascii?Q?JwkhyGUMO8/94dwdr455ukVfAOiym7zafju0RtmR/M/Jx0cXDhhw5liQyt4l?=
 =?us-ascii?Q?s0xw5VR904MulXskzFinKJf6SaZn/u3ml86ivxufTzqlE/FSOgirhxl+bI5q?=
 =?us-ascii?Q?BXETB0OPgX7XU2QSyonlC1hC0qn41tPxab9uYJVWHbnT7Cog7DgvceSnVWrF?=
 =?us-ascii?Q?ilXgbkPFg3HStoXduNmShXifDkHPhcrR0MqEEuUMzWwO/VaIJAoAM9GaHig4?=
 =?us-ascii?Q?ItjvOwx1/Jf7jk1g56JaL2tSaS421/0DgzR3hiVwIdqpK6xvW2tQ4vmPzar1?=
 =?us-ascii?Q?Wv/BtHE8F1E1mDamHyPDhkpG3PCbpHbdiHV7Tvg+Hc69MSAKz32ec5KWOFxz?=
 =?us-ascii?Q?tFaCQyCrIcmLUhoKYk2krMJtRziw1A8C1lHCpO1myeQmGrbYLp9zpVFLT58m?=
 =?us-ascii?Q?5rRi+9TdXivf76ee31xGOg/0VFIZQQ4xvuE5f9mvy4zC6vse35UoJKtMYVDc?=
 =?us-ascii?Q?Bsr5aK+nNA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b8e549-ff84-4f65-3aa3-08da1179267f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:42:06.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BAqjgBks0t5Ab7oQM8h6nJt4phSmDBebcDQSLxDPfHQhsXctOT9RK7FzMv7F6KKIClszI+8irCiU73ecffC2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3591

On 29.03.2022 12:54, Julien Grall wrote:
> On 29/03/2022 11:12, Michal Orzel wrote:
>> On 29.03.2022 11:54, Julien Grall wrote:
>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>> --- a/xen/include/xen/xen.lds.h
>>>> +++ b/xen/include/xen/xen.lds.h
>>>> @@ -5,4 +5,104 @@
>>>>  =C2=A0=C2=A0 * Common macros to be used in architecture specific link=
er scripts.
>>>>  =C2=A0=C2=A0 */
>>>>  =C2=A0 +/* Macros to declare debug sections. */
>>>> +#ifdef EFI
>>>
>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support =
EFI on arm64.
>>>
>>> As this #ifdef is now in generic code, can you explain how this is mean=
t to be used?
>>>
>> As we do not define EFI on arm, all the stuff protected by #ifdef EFI is=
 x86 specific.
>=20
> I find the name "EFI" too generic to figure out that this code can only=20
> be used by x86.
>=20
> But, from my understanding, this header is meant to contain generic=20
> code. It feels a bit odd that we are moving arch specific code.
>=20
> To be honest, I don't quite understand why we need to make the=20
> diffferentiation on x86. So I guess the first question is how this is=20
> meant to be used on x86?

We produce two linker scripts from the single source file: One (with EFI
undefined) to link the ELF binary, and another (with EFI defined) to link
the PE/COFF output. If "EFI" is too imprecise as a name for the identifier,
I wouldn't mind renaming it (to PE_COFF?), but at the same time I'm not
convinced this is really necessary.

Jan


