Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461444B559E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272501.467371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdtW-0007tj-G4; Mon, 14 Feb 2022 16:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272501.467371; Mon, 14 Feb 2022 16:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJdtW-0007rR-Cm; Mon, 14 Feb 2022 16:08:06 +0000
Received: by outflank-mailman (input) for mailman id 272501;
 Mon, 14 Feb 2022 16:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJdtU-0007rL-OX
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:08:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49cdfc01-8db0-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:08:03 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-Itk0yU7ANimHtrBLHx28fw-1; Mon, 14 Feb 2022 17:08:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2926.eurprd04.prod.outlook.com (2603:10a6:800:b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 16:08:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 16:08:01 +0000
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
X-Inumbo-ID: 49cdfc01-8db0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644854883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nbq4sQnmqk3MsN0OZY5mRXiNBWgdOrNm8u8zqAKKpsA=;
	b=TDLwA84bqFmdrBVa3D+zuCK/mf0nUOp80mLQlpj/2P9VEA9FslIy0Q/6kb4x+pbEKMccxM
	aJELW84HFZcCkfl3X1vuN6LJtiaQv+fAhY+iB3g24xe3NDWLLfk/kBCUOjoDwFd95PUV4A
	jqHxLmTBbU+uqR3mIqJut6bk2RcpDpo=
X-MC-Unique: Itk0yU7ANimHtrBLHx28fw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fvq4mZ6o5e8SyLw6aXs1rIgQ+k3IewY/H/d4QOhmeo/Q23ZYwHeBYFvkIL7kHPD5/N+yX29LAkgKYuV2auj68uBWJl+ZamEsX3sroPKDbt7rwOTtF7xrGpOpYNUa1IhY5AtHldc78HYsG6IApGWdcavFH0DNVPHhHGGAUNcVH2t1uPkXWfoAlef2WdAibZIrbJvNAyoBiQc53JYpQMCLKxYaVz9xlr3i9rb+hqhB8kBRxTTVqZk9tnQ8iO9B664NQw1efMsx/OuR4dSgzhDgFBNJHZaj9kJJRCzcD41x4oHZCoYFqIWUO9T8G9ameY+ydjDpTu0hV0KgLHkt5ZM5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhY03lxHPMCG6Jq0lSqJfOp+8hAqqZYyfYrGfCPZ/c4=;
 b=hhZmA6i3Xa0R1mbZx5wdpEtDwQRlHRV0rpBIRZNnmYzw03l4n4qeKxxd0yFlQT3kn/shI0mrQo1JMQG8X+T0vZoKkMfGVkywggr6MYrlzNyZzb+PwRFjZRon8lU67BQuuu9f/xLvKKWsAQKSzv5H1tBd+z6duWeiKWK1QrsjabLvfM0jVQdJZyB/BWD+B4+wy8A57AUfPWKivEF5ob4gzg8MJxjZr1gKvGokcbAFLucvAPQwGjJa9kjTdnSQoX++B6AGGFZ2+DOhjgsxqCYK5D3Ioq2UQAWZD0v/EnJzvZ8tq2stZ7eAA+gGw2torYILWJ2nFT7UPDfSxVuwhP1Ntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9fc136c-e7cb-e15d-869c-a952b5b6dc31@suse.com>
Date: Mon, 14 Feb 2022 17:07:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's
 fields are HVM-only
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
 <EFFE5241-CB1D-4173-87F9-16AC428902F7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <EFFE5241-CB1D-4173-87F9-16AC428902F7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:206:14::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b00563d-0d19-4b42-8fd9-08d9efd42c9b
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2926:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB29265648D52A70D8D644EA9FB3339@VI1PR0402MB2926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4s7iug46xJCCkJPDNmfuGy7zQrHl24+qswpYrXYrBe3GtGMfTWR+cup+Zx3ZrJf+rGYgwEmRAbmEOfH4t+ZK3/aNVdU2Ig5Unm0Q4K7kv33KYjjz4gas7fOOSOL9WYTX2DrIMGgrHNUC9OukG243l0NGNRvQmrkQdAW9SiGsVP6dd8OKVB94ds+9iK9Vkp0oA9vCMXkM4Sctj2g/8OEkUtFFL7fgzeT5X9F1fBc0e577/U+UY7/55DsgN78VRc3Nn4RQOVQf7SUMUUCzZGxtC6yYZ/g5zWwxOCXeJz5kKDz4EPXGPG5Tqvebddxr1zaFUzHqOewriLTSkrZOiZzjR5W6hsVBHswbCdGKAICaQetlyGPpSH3AoHbOyAgFifi/tGz4JhzdHT/nDemRK1LtMSQHLq8GDZ+CxDQZiCftje27twcu/e/jPMjuVx/YBF+AHdS5JHJNhkeX0m6XGrvzboVyNJ5fNW7y85klJSDlQ7bPXJY77A+F+JGUQHiglBxjvzf/vsLTdc++d9wFC5N5wEm1OQGX3ub5PnA3G31h4M6WmRTRlkDUt0Sgp+UnQKIsXcFcBc1uH8/OSh8qe6KaALcqgjzQbvkKPVti0sg4Z7ePGqDxRlTQdurq/4bP3vY/ZL8OLRTLTq5wqc6R51jTqqYTingFOwH9iEYZQHSNqpHjlA4MB1vvVf1jClIQX8xgajdkghxOU88bSM8Y8td3MLIpOnqTBH3Jgy2ku8q0dedYj5hqmFdHW1dbOZqJMAz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6486002)(38100700002)(8936002)(83380400001)(5660300002)(508600001)(26005)(186003)(2616005)(6916009)(6512007)(2906002)(316002)(54906003)(86362001)(31686004)(66946007)(6506007)(36756003)(4326008)(53546011)(66476007)(66556008)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e6Ob7s5XyPdP/npyC+X+0wJABS5MabAzI760ysF7o6XWQqJXQ1o/TvpSft+N?=
 =?us-ascii?Q?CvY+kqZIRoTociyH6s1AwACKioZeIO0aNsUIXRc6jkX2f2jDkic7fVu0pOeZ?=
 =?us-ascii?Q?T91qjkoXT/N1N9/gYMiiw+YxEG0ZR1Rw/TB3H+z4SsQr2qKidcLniUV4y6BQ?=
 =?us-ascii?Q?rzTs1ApylXpuJKz5NZN43l/XXhDGw707dAuasAe9pjzhViqVCa1FuJLLP1F6?=
 =?us-ascii?Q?Pjbo13CK7sRmsqR6QrfF01x+crPiJ15Pm4jwMcq2nZfA3vUKLxywlYkpiDNV?=
 =?us-ascii?Q?TtgZkwF2di7iRLRnqmLB/3sWqwrlc1J1Aro2xyM9dMkHwjFD4x2/fo7X9ico?=
 =?us-ascii?Q?F66IY7IDK4ZY1NMz6aH0Zzp2RmR6JbeIV1k5kkTkacii0bXL7N9DIxLvbM/N?=
 =?us-ascii?Q?HM5AsRAyaeIcts898cespI0j0gw+OsP2hPC/QLQ4h1IIgkDoT59DrZ2hhAL7?=
 =?us-ascii?Q?yEHn1pDjKKh6GPEi1K/TeUj3l6dLWCBP1iybobloof23nduI3tMP7bHxY0OQ?=
 =?us-ascii?Q?tHw3w/PUk2J8/SDvmtWY/QQMO7vg3qET42sEQ9a8E/NER2sB/7lWIZCOFOTu?=
 =?us-ascii?Q?drn9PRZHOcsLlgWGIyczdFTUC9MTqu40PxUJ2exkhS7LIpVRMHOsMEsAPvdx?=
 =?us-ascii?Q?h5GmjV3ZnQjyNctcSKWtBXat+oW5hRnhUy1fxj1GfB+yA2rTej+6UerL5Rlr?=
 =?us-ascii?Q?0ky9cS3Kz1aIvRqiIYNoQgh84x6WM17dbJUOkcYEVXYf9zf1IIZkXBDUXK+F?=
 =?us-ascii?Q?voeKo2VBeav+DYJESdqiA/GDi5dUoy5C4/iK7K0xDiLLZG1ElfSXEhfBOwsr?=
 =?us-ascii?Q?rKcJt/2rzCfbjfQsGoHtIYzY4QtDkVIwLe+iifa0axwFaOTeUsYqFtEHTUvS?=
 =?us-ascii?Q?Xo31flrImKFLQPxHbRv1JQVoMSseFlzQjouKmXBtFync6VUEtZSaVFNMZjM3?=
 =?us-ascii?Q?ELkTsJodN2quTsfxiqZBTwBHMgETFj6KyObrlXGO2aGEt5fxe4kTJ4/NH3Sl?=
 =?us-ascii?Q?0eKGCKSw8XXU45CwaXIzHFoGSbxKM5gad3AEqHO0zU2/SKSU+k19R2Kgd7C/?=
 =?us-ascii?Q?vSzGBFE5gzYf8bLaGiDrEHxxIr3/i4QDoCONbaXN0hvpG5ov0kWpXwJohyqh?=
 =?us-ascii?Q?qreo43kge/Mx4PKjAqANrbi2WgNijgFcqBaUz1kgfT74ae0RcOxcCu/9oh2B?=
 =?us-ascii?Q?yNMOAbm2pBAAXuR5UJMboWbTxgepxspFpdaXZ68Zjgz78fp048mfo8v9Lfum?=
 =?us-ascii?Q?E3lmGyJaLRLtdUl5rGSEflqByj2oDb90jwWeyrUc7Paq0AdO+Zi/QQv+iYCm?=
 =?us-ascii?Q?Pu/foIsHxggA7fQsigst+Dq3dBGzdZ8+e9wqMbfKzhRlcTRRoyavLYCqujdD?=
 =?us-ascii?Q?+Bqiu0wJ9ZWz1qBec0+bqI1ic0Lbku19kpDI3w83QMo2byIkFwE2WDT6Q/wr?=
 =?us-ascii?Q?qUuVpTJf7YcsKe1IaQwegIrevZt5D4ssheXPX5ZEMbagtBs7eBMDSf69koCl?=
 =?us-ascii?Q?RlVXM8pMLiTyYpNfDgI0W+PpqSjodbe2L79qddjLVZR1nD9zrHnT3RFvnoGx?=
 =?us-ascii?Q?Tb/JBp+qXVVUQia/gM498E+8ru3svfKfhhFWpWHqfkFFa2WjSfJnLD3oTZoA?=
 =?us-ascii?Q?alRHV6iHGyodGoIpE47ztbA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b00563d-0d19-4b42-8fd9-08d9efd42c9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 16:08:01.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTNH2SlG9Zk/DP510RArdBwosfr/cqdAGTA7slFLqEGqWZ9jcfrVChp/R3RyROdVJwXQGWz8Qfv3StUOV7DPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2926

On 14.02.2022 16:51, George Dunlap wrote:
>=20
>=20
>> On Jul 5, 2021, at 5:15 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> ..., as are the majority of the locks involved. Conditionalize things
>> accordingly.
>>
>> Also adjust the ioreq field's indentation at this occasion.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks.

> With one question=E2=80=A6
>=20
>> @@ -905,10 +917,10 @@ int p2m_altp2m_propagate_change(struct d
>> /* Set a specific p2m view visibility */
>> int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
>>                                    uint8_t visible);
>> -#else
>> +#else /* CONFIG_HVM */
>> struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
>> static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
>> -#endif
>> +#endif /* CONFIG_HVM */
>=20
> This is relatively minor, but what=E2=80=99s the normal for how to label =
#else macros here?  Wouldn=E2=80=99t you normally see =E2=80=9C#endif /* CO=
NFIG_HVM */=E2=80=9C and think that the immediately preceding lines are com=
piled only if CONFIG_HVM is defined?  I.e., would this be more accurate to =
write =E2=80=9C!CONFIG_HVM=E2=80=9D here?
>=20
> I realize in this case it=E2=80=99s not a big deal since the #else is jus=
t three lines above it, but since you took the time to add the comment in t=
here, it seems like it=E2=80=99s worth the time to have a quick think about=
 whether that=E2=80=99s the right thing to do.

Hmm, yes, let me make this !CONFIG_HVM. I think we're not really
consistent with this, but I agree it's more natural like you say.

Jan


