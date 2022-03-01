Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5AD4C8E11
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281576.479967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3jK-0003ZO-On; Tue, 01 Mar 2022 14:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281576.479967; Tue, 01 Mar 2022 14:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3jK-0003Wg-L3; Tue, 01 Mar 2022 14:43:58 +0000
Received: by outflank-mailman (input) for mailman id 281576;
 Tue, 01 Mar 2022 14:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3jJ-0003WX-OT
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:43:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e66ced-996e-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:43:56 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-rD4iyPtWOT6clTKuJ1yfVQ-1; Tue, 01 Mar 2022 15:43:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6691.eurprd04.prod.outlook.com (2603:10a6:208:17a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:43:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:43:53 +0000
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
X-Inumbo-ID: 05e66ced-996e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646145836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfYXY4Pa2JRczICtJYZAMBr1IkiD/j5RCEybgZF2ddY=;
	b=dN9UAj6xZmnXPWKqVYad5IIk+B6s6OvZzf8RhuVdQ5Fl78nRsh7mdnV0fYA6EKnqwMcWUG
	SN/V1Vy1ydGXd0HZVqn9on+lynabXSeZwHareoCK3oVJmHQd4Tr1kn0MtLpk6UG0qP7Hzh
	FQHNowcgzxJInjIPfBZjX8MUxVqypfQ=
X-MC-Unique: rD4iyPtWOT6clTKuJ1yfVQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJEXnXKAuhhoTk7WEQmKvlNUNhbiVab7yDNUaRcRXm/dkIff/eCFuh6l3VdyAhpJfsuhGMVCbFAWBQBOKiE7Cw02kM4H8k8ig+6xMuCm2X4DPpYIOLZ2mYhj/iotQ35xQ851RuR2Sci6YZBsiFjbYK7FmAlVY8pygCfesCE11i5OPqJN15Iwce2KKPKLzC+3Qh2ZdruGFBjVUAPta+WRuRUeJl7LK6G4jI329tBkVMDFRgjBt2Er5TBQcTLhTkuHMRsIw48CWJiM1YHU3Lvgort/TWq5JfxMXFm1cn80vKJoxMIbx9RIRDq7KuAdqFAnVU6k/x/oBM+4QrsZjZA8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwJzIZS51ymivE2MOwq4WJF7j8kjoWz9UHofoBY9E/o=;
 b=EwawHODIh2SfRzZcEd7OtH5ZC+JlpNpg3UrLFuZAJk12Bc2/pmy2PvsfLiDhDzqfa7vLyawDffGBSmsGUZvDbrKhP/3s7YGsmOa8lnRETdD/ExqjQnd8YQk1Zq/XLcJd0vDtu6Hx5B5lYUUlftdChK+qmjKuy8E4nrn94uOnax4e6sf7i+L4VZgxbyahYrEBeVkZ7rJZAz1dEzxxiAF+pyhMJHTJmQ9KjntZc8pRm2xi/2EkAfKbPPlOZAojyo3au/WoYsUwOP1D9dStsc/TBQQebHJye4PbXI4eZ+5I9Pqo7EeBvqiL95qlMN60IVf+wenKQvznDMykA6XGXvncwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f30d30e-5e65-bd03-2975-b81e2eba60a7@suse.com>
Date: Tue, 1 Mar 2022 15:43:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] x86/time: use fake read_tsc()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <77675e7f-2a7e-f517-4aba-e20774c8bfe5@suse.com>
 <f4f0e92c-9586-e021-6ad5-718628f88fcd@suse.com>
 <d1c3822e-bec1-d8ca-8954-a4942f5bb23c@citrix.com>
 <2c3bb06d-e4f4-33d8-7972-71dc7d61c554@suse.com>
 <ea46555b-6ab3-620c-0937-401f6335b842@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea46555b-6ab3-620c-0937-401f6335b842@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aa21200-4fe0-4c76-0ba4-08d9fb91e7f2
X-MS-TrafficTypeDiagnostic: AM0PR04MB6691:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6691858D92D4DF19E406BC0FB3029@AM0PR04MB6691.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5T+/aoBSOw5sPkLKI8AKPiWfdJm1+KlAqzmoAJbLUCBFDFhtFX4cKnXJf1SdwA3rO8NUDAftOfeGmbWR6tDcogt4iAE3rQ4Ag9hr/vQiYgldaFqzMeQSDO/PKEwyw628PEE1OHzUvB2BLsf8i0JRty7XgaxRFUhLVYMG+Uy0e3Ls4XNwWTFu/cm73hdwZHncxYVqPhuvqy4a6ewhQ20Dw7cAtfd52Gj3V2yoXvnkEguGkw3waeqiumhF1nF2RAb6ph9XjSh0tbs1Ane1uI7KP/2/gqp+hpIgEg97Mq64C6MRbJbFNNXaq9AG6PXcUm5dFhPTyhBoHRcMrk7sZIBJAW+2wkcfHRZvGRSu33CpULjcg7BoAcVl4bfBhWrefjEExU11icRjGlWz0QILcQ9AOnYvysWDRBLqJ6aJ+rbEjHr7TpExQ/tjxGgrTdiJUoWevzN+N/FAy1QckctW4rG2aEzTNneEZEsjw5RDTL5RCfzcFTt/wDoGZYLiYpYNfJ5m9IjWQmiwRFvDzg+IOzoIl1pyzTLPuCyueM8YKmYCqbsuo4B2D2KCzZ7g9IY1C5MRi/Sv4Pc+E+Jfau0w2p4PqFMPaLSZ+6zxnIxoHMa4h7bCa+4nGg2akvNmI2i1WDB4DTcxYQZx3Z2Wl1Yj6HLQu9Z92nx4SrYIzMx8RMx125QhhnweXjmkgGfJNfSEu8V7okw6YzeJDwzP4GxB19wJVfyUgdzZYANEmKY39gbTWotVFuzOsEbElJyAI2XVtTCh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(8676002)(8936002)(38100700002)(2906002)(36756003)(31686004)(66476007)(66556008)(4326008)(6512007)(5660300002)(4744005)(316002)(6486002)(2616005)(26005)(186003)(31696002)(6916009)(54906003)(83380400001)(86362001)(508600001)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jd4btnBgANNtO23KOyIeXX7LnOW7UrrYLUn2bWOuoc6d3cAQMqseu96aGbcC?=
 =?us-ascii?Q?qrwJR1++iTmKNsN2cJc1DfuusEnurWWPu0Vn7Ck5dlBtR2KDcsq1OTgdhTl4?=
 =?us-ascii?Q?C+XsPjGIYvmUwHYEwsTVPfFQS7fefdBOOkQ4JT0DtSwnh5CurdHXHZVr7kT+?=
 =?us-ascii?Q?NR57rMkngpSJQT+09Uzq4UcUeFqxPa3Y8/xl9zQ8ZyXQ0hZy/LtwFvcdMRTu?=
 =?us-ascii?Q?kWNvssZIbwrsOi41IlPk6x3nVPx5IJMM+nZ9AmqPsteRYhfPdZ6TSWY+rrH/?=
 =?us-ascii?Q?Z5Qrc1rLzWn0GWXxps5WvMl4bhR1S3P8SEK6IK6AAiipY1j5+B3hoMoClBpy?=
 =?us-ascii?Q?sn3tykjYK+1TJvDJAGDqmnY8Bandxv/e16DBsBxevmOmBdqfqE33Cp82vYxC?=
 =?us-ascii?Q?xRuQ1/2eSPr2JdiHVIsSrY7TrUFbT2kpklE16kosT4BuUlqZYIRvxsJLOVyh?=
 =?us-ascii?Q?b6NywYS3m47JOBT/XZompi7ZXAgUZUaQxbMzf2TfyJ+/mjZCGALgDPw6q8Ec?=
 =?us-ascii?Q?pPujUAlvT75cL00OrJu8UIsAjRAfhp+JoOVcHLC+vgctPgqHy6k+AMphgqcR?=
 =?us-ascii?Q?JSeIwqXFdzFOsQeSdUxdBO5OumZwhPjm8XlD9Pfa/tQ03KuKvLMXESaWHNKA?=
 =?us-ascii?Q?B7bJygxO5zIPIOcoJMwyZ0iGU0yMlrlB8fYlc+Uym8pPXKgrnIpzU+ncYmW1?=
 =?us-ascii?Q?1sesMTiUfgyYn7/Cu3uNZx34ubxnSp2zNKZwPUnv+ZQuTz1YAuEkmkvthIEV?=
 =?us-ascii?Q?+0Ss16mZMWGpEkgk1psX2guWrIc1/yAKulnzkUcUWDuTZbAKzbqSAeub8YDP?=
 =?us-ascii?Q?jpPxcMyuexfAgUbhVacbH/c6bnJW0/fUHzKI8F48KtPUKD7KJ5/H520JyPHR?=
 =?us-ascii?Q?H8WA5nbwQ9adldMWNA4e/CBkH8fracitHNrz6NPMLRZ78fL8zndCwr5ghE0b?=
 =?us-ascii?Q?rThpgNKj0VQkjc2ncZ27fjuxuDMgmH7gJhlAc4wLYDo3jBQcNMHW0pUO6mA5?=
 =?us-ascii?Q?rz31ezBs6v0aLyJ5g1Glk0lh0MCcSwggVIJzTApF/k8l5zzMw6BcLso3IJJQ?=
 =?us-ascii?Q?jFaBmcWOWqHZAuLJ9D0UjpX5HsxZ+6XDRI+MhchzWdwm6ShxmKAk2GnFfzie?=
 =?us-ascii?Q?aLNLuGSGvW2sMPsIoQZMaVqEhzb0CGEzMq9CSsXGe10qVxMxiRqDjhca3Bpz?=
 =?us-ascii?Q?db5ZCV8DhjR34PMIRILI0W9nP9DIL+viT1gZD98OV3i0oViE8iHlM3MU2De2?=
 =?us-ascii?Q?qDzOFz4TQRg2KfUWNwbx4TQ/GDeMAjUrvbBCocJyUyMAqkJIVYTVwdlByfxq?=
 =?us-ascii?Q?nvwQTFi5GEVSKBP6yEgS1O+ezXYzGqf1GSwzkuWOujezpcmpSlhejs3sVQt+?=
 =?us-ascii?Q?9nTpxFUgZsuyBEcmCzGT+zEAAt+73Z/sz7y7ijyhmTol6y2xSjeIvHKVYkPm?=
 =?us-ascii?Q?HbXVofB85lYPsfaR6Nj1JEfx80UNq7N8sBb9j3QvRMq9co8HCKFgcNwfWIfL?=
 =?us-ascii?Q?VvL9ZTni/b0Vihk1KmK3ilHhMZO91eGX5etsDIuSU3972UH7QW6vInXW+hNz?=
 =?us-ascii?Q?Gm5rNAPQY07vUDh8Q3qCEy9DNUBvZpV3DuFcK/yM18YDBz86ZbK2X0doEiaq?=
 =?us-ascii?Q?4CnrXyHAY5SZdwyWaoCPaUA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa21200-4fe0-4c76-0ba4-08d9fb91e7f2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:43:53.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gpljv+BOz/ZIdvuGYSEBKNWK3MUpNP0Qe2Q8c8QQJ6+Ib4TVfAqh2gOuiGxkVge6QSqgkk1SVVniFDfTxIYNVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6691

On 01.03.2022 15:39, Andrew Cooper wrote:
> On 01/03/2022 14:14, Jan Beulich wrote:
>> On 01.03.2022 14:07, Andrew Cooper wrote:
>>> On 01/03/2022 11:05, Jan Beulich wrote:
>>> That said... what's wrong a plain NULL?=C2=A0 I can't see any need for =
a
>>> magic constant here.
>> Are you fancying an XSA for a call through NULL in PV guest context?
>=20
> Why do you think that a risk?=C2=A0 Only non-NULL function pointers are
> followed, and altcall resolves safely if the pointer is still NULL.
>=20
> And on that subject, don't we not hit the altcall's BUG_ON() for
> exceeding disp32?

There's no altcall involved here. As said in earlier contexts, altcall
patching comes to early to cover plt_tsc use. Hence the only concern
is a non-altacll-ed use of the pointer.

Jan


