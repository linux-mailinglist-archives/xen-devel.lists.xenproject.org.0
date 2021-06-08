Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E639EE98
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 08:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138292.256042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqV4r-0005Cl-0H; Tue, 08 Jun 2021 06:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138292.256042; Tue, 08 Jun 2021 06:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqV4q-00059n-TD; Tue, 08 Jun 2021 06:19:04 +0000
Received: by outflank-mailman (input) for mailman id 138292;
 Tue, 08 Jun 2021 06:19:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqV4p-00059h-C3
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 06:19:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9cf0fac-7f82-4b78-9645-000feeea19fe;
 Tue, 08 Jun 2021 06:19:02 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-qFf9yPbCOmOK4iQyhid2xw-1; Tue, 08 Jun 2021 08:19:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 8 Jun
 2021 06:18:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:18:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:18:57 +0000
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
X-Inumbo-ID: c9cf0fac-7f82-4b78-9645-000feeea19fe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623133141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X4jiwkTF3ndFYTqlQkRQhHjPPmACvFRX+fMLcraQPy0=;
	b=Fo3hLPDHQIkSsvHMGRlqPIG9gSSChBhx5aLWqWcU/kzUpsuGi0m0DEXxqWs+ISIXZjN/u1
	rN31Xno63JFvY5JOIVyi7Hb7KvywO+1COpUijYYkSFqp2Idt7Ld9uDeCm7jbMEVGsk171r
	wR2/4PsV3p4QoVWJt/hvD+RaEIZFAMY=
X-MC-Unique: qFf9yPbCOmOK4iQyhid2xw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut5FNj2o/n8yVjUl6S7k2XLELUV6nTGlhnialy9F6w3ntmCYQWUWd7536FQaoSzZo1RWoYNa4KcvSPWVw38W7dxotNnKKBB+N9R7sqzYJgrPpFawHmsrEusNafsyBO96NvHxZ96kIpgTnrINw01sxONMxIzIgrhBokLZYHPR1teLODPAyYlXNnXV9yCM1wVSPauPmP8peS5WmYvCd7yUcGZe326wwp7G/uObV3/FIv7GVQoXJ9aO4JFY58Vr68vbPbtSUDwqfdHRr9o5nif6A5jO5laLHqneniiCdhAW+FtF4QMifyr0PqoT5Ao0HAy6O8XXHSG6vwJRH9yEd3d2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkjRvjkQYKteAAZxSNLFcpc0YVSD/cAeIqlCB9bbeDo=;
 b=BjS8pzKJK+/Y8wRqPEoPCoS4I3XOfGmIvYbaYoRoppVe5ej7sAt3eGq0rBG2uq25Yb49z/PLdNv7vBQSfK0jh19wBRf2mX0buPhkxtp/zVtDuKf/WEnl6EoPBvze+i/C0vwCqBzZRUGCB0XU9oHf8YeWuXMy87XZT79hSzHFGqG8RdeI6zaANCVBm7Pr5VSrYAJwZoEoikmaeAK7P09fpE8RPJcx2WglfZjLZdqFX+pXLyILOAoYwyccKQ1oqAiUrZ3OlIQEB+quMjGK28sVRnF+XVhs3tNjywRYHFdA3nPxTXXfwoDsl/H2rcV5kqMOFI+Ufdyvl+RAw3n1kjsIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cpuid: Drop special_features[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210607124141.24767-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d09c3a27-4b89-be3f-6dea-37f3759df570@suse.com>
Date: Tue, 8 Jun 2021 08:18:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210607124141.24767-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 098d131e-38ea-40c1-97e9-08d92a454ce2
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389052B295F66790F09630DB3379@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YYQutg7oKUEm/G5x6jEdxR2nFM/wzAxS7wbrf581g/gkP7UQjvSzo+TGHyYKYbBOJm+1JcEb3tL9Q3J730cokX9b6kVP8OGTjcgCzNrOadaga1Nfi4PklhfPCXVBNSY51qcQQFvic9M4NePUveXvASLBYQoMbcSrmYtCU7O9i7STJgSbYVbsV4hdCEPPNkc9dZUz5gFBlJ1FL2fmSOzqrbXNY7vU5xZuDNEHc20pL+mO5ExpeZ4E7fmTjp517GD6+6lgCgjEphBSOIltxiNHXk7wSZNAh1GcpAFWC4cPhzt3R65cqoXs9eIVM40rJZx0DphwiOv+ZiYbtWmrQkEaShBODF3tZ9LulOhulg7DVCW2VW/hCGHHez1aJKfc6OvtqMxgwI7At1vvJQItqGPK1bNFTyu4xvI3w0u8H0NuYEubzo0+ZEm+xBFME6FWad8EnBRajAZ6C5G0XCc4nbtYu0dHgsUGJ5eFF7WsWJVj30zfda10tP1TmqfOeJa+IGdFerWYk7Tch+UdbRsKlSKt8vRDx2v1HJcwqshozVgqXjXXDJGY3MJ+vAQjogeBUed/68t3kwXO1yxL0dLJPRIAinMJr/8GQ42p3df5peNvKip7yUUmI9IGOD9Dhu9qXUPqq6YFUlIpzDdsqE/Ajd7xeE2NNTTe3PZF5VLGyIBuOtuEsM8/LLjM4ZptEOiJlaPL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(39860400002)(376002)(396003)(83380400001)(4744005)(6916009)(2616005)(956004)(53546011)(8936002)(2906002)(26005)(66556008)(66476007)(54906003)(66946007)(316002)(16576012)(6486002)(4326008)(31686004)(186003)(478600001)(86362001)(36756003)(16526019)(31696002)(8676002)(5660300002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?ZrAI+ydcAN8gMx1onqIU7rp1W0y/aS14vwvpJu6i/t719SJFGZJZA6CA+Cl9?=
 =?us-ascii?Q?mJw/yZIdCjBrVHpDVFn0TVgOVAnCsIQsztIRdMm4wf8FgJ6qcINcHZMA7l0O?=
 =?us-ascii?Q?eDTrRhhmNQGxVXPNiuDtRnMZmKrkdClGkaWl9jrtj0jeH1SCPzrfFamW/ckY?=
 =?us-ascii?Q?C9UClBmf2RPlH6klOYK5VLsIUWG4NwDfbjJuwXP67/rZr1aGoL9EE1hYUGd5?=
 =?us-ascii?Q?Y5raW/yadaFZYJ9zARBX30r9kAVEiLSgZXr+huDSH6okQdSW2B/MF8CRXNqN?=
 =?us-ascii?Q?8X7rfB4vZrILKlA1MuI+m4utMn3epmzBxKiLNhrIbm6roe42FH4HVyIFyN/3?=
 =?us-ascii?Q?WzVFDETS7RJ6bwAKLClolUq8R93LiHZstgRVNE8qsGDMbH8YLakrpju0N6We?=
 =?us-ascii?Q?KQyQhmmi639WgYz/ji0A6IUE5F0aQ2Ewsa8rE8AO2Q+dhe483FLPxFvdleTN?=
 =?us-ascii?Q?f2XzaxfRxl/WlbXJX8Hu9ZnAvYxocKgy1rT86vetKAJCMPC50v0pLsgvTaiW?=
 =?us-ascii?Q?xmg5mKcpY/UYZoZTbS/iMRz2WrYTKZffa19deRwSMuFSoJDNlXv5bpv5FT8v?=
 =?us-ascii?Q?tMo/PjGHKS+UA9/wMfbgHrbBwMtf1yudnv7GK/cQDPEZwxf/GdPOyulEgd0q?=
 =?us-ascii?Q?OjyV4RD//h10FZJSm6qhXYNgQpf4Vi2amqidi2kN8l/93E2TYgMRWKMC6q0/?=
 =?us-ascii?Q?EpSd9cd6YE5MoM7BHQmB1lbHpK+1WsSt+O5sPMP3gWfW2jVuMRPRAFkblco3?=
 =?us-ascii?Q?bL91oK9t8ez4JegpqURKDdJAkbnuJfPA3LJ/KhadV5HjHCNU4IS4nvK7S+bb?=
 =?us-ascii?Q?Aed3qLiehxxO9gFllLQlxChTa4ZfvpmXRxYj/6M3hiOFxOXDxeRQZ0FJZfRb?=
 =?us-ascii?Q?PUBgt8FZLJrzMk1pVnLzu/Q+eU9wIWYyIXhXQJny8Y8rABFSZJxvLFfqh8Z7?=
 =?us-ascii?Q?WBKN1pzNyjUPDy+cJ5gRG7+8FzhJs3FoHoUPuo99eHrDmbXDc20J6AGmJ2PU?=
 =?us-ascii?Q?0M0fqxjwbC3C+Jd92716QA5g/CQ+ndXUig7gE7VBfG9/eV/oq8cDia7iwck5?=
 =?us-ascii?Q?A/Z/nLp0huPbH5WrwK5lhRWmmTeVNzhdY1axDVyNL800/6O4xB2gtUAtaKjI?=
 =?us-ascii?Q?r3wc6imHZhPeRzSrn1nSgKPNAwTGQX0lHFJSKsLlmcOX3NtURcs/tJRiKVx9?=
 =?us-ascii?Q?S04tBK6rr5fLpgj305zfLv2kn4TUIMHT7tSeHlKZCxzTGTkMvnoU3P3GtAYL?=
 =?us-ascii?Q?idxggsMhABZFPbmR+Q8BFpJI4AXoH3wbsivvRJbpKmEcF5wRd+7yiBSpZUlu?=
 =?us-ascii?Q?shPFk2DSsSo2c/2YPUWWJkDA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098d131e-38ea-40c1-97e9-08d92a454ce2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:18:58.1873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6rCDTO+ArOl7Js6B21is8wLm5k4C8kxD3K+Pxh7RrJimPltWxYuij7gc2jRxkNxPq389qvc/oM1VGjhrB+kZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 07.06.2021 14:41, Andrew Cooper wrote:
> While the ! annotation is useful to indicate that something special is
> happening, an array of bits is not.  Drop it, to prevent mistakes.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/cpuid.c        | 2 --
>  xen/include/asm-x86/cpuid.h | 1 -
>  xen/tools/gen-cpuid.py      | 3 ---
>  3 files changed, 6 deletions(-)

As osstest points out this didn't go quite far enough, or too far:
Either XC_FEATUREMASK_SPECIAL also needs dropping (including its uses
in libxenguest and xen-cpuid) or, considering exposing this
information via xen-cpuid isn't entirely without purpose, the script
part of the original change needs undoing or making conditional e.g.
upon __XEN__.

Jan


