Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE84BF6EA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 12:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276689.472938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSzj-00051g-9m; Tue, 22 Feb 2022 11:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276689.472938; Tue, 22 Feb 2022 11:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMSzj-0004zC-6c; Tue, 22 Feb 2022 11:06:11 +0000
Received: by outflank-mailman (input) for mailman id 276689;
 Tue, 22 Feb 2022 11:06:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMSzi-0004yy-1s
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 11:06:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fece42a-93cf-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 12:06:09 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-MJxL8VwvOUy4O4FHexA6OQ-2; Tue, 22 Feb 2022 12:06:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4056.eurprd04.prod.outlook.com (2603:10a6:209:4d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 11:06:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 11:06:04 +0000
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
X-Inumbo-ID: 6fece42a-93cf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645527968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+FlNmGTJAP7ySZOtoSzd387XJPuUCqJKFUhMMsiLe4=;
	b=Y6qgAIuC4r2BS9aib3RBkySY7Epc//IhQFYywpG15hfj4UuPVZ/nHhx0NGlPCbU4KEKY5C
	Eg4b2pOtxz9qkSssdYEJfRH9EUEsnBarIMLfaoARHnyKCC1cLMOf4CFZ/fnz7TKIosec5p
	5YFzHSMN6IxvXAHpknqC+BYnLade3oU=
X-MC-Unique: MJxL8VwvOUy4O4FHexA6OQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmnEMerGkWh5DzpX1wYitapUly0N25vQmn1NxxXwqvuww4xiGGl5IESn0+CkKkoo3f9ZSKM5bxzKyFfG0WIVpHtN8n7QvLopXuAK6mRVoB6EIJY77EWz+yt/COFKbJGlhP+IdslHecMe/esvQa2+5sUOButIKEXhA+pUmAyUkrVTnpqO6wGkA5qFHcBQW3cmrmZsCjyvCWNZhBlfQowawrnHOMleCAWnrWjld20SiaDlw0xzTogu0q9C0YtBg0YKbOF0LEAOoPHbCPv4sMGsEloxd5L0loCp6HlaptWmRG07QpPk5DE6rH3vxiWYu00JCgEgDO8Xy0V525Uah1bH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFtFAO7JUprpOdWh9zZbXNzXCr8f+xnCmz3TMEOS+UY=;
 b=ZVa9b3VLh0MyWKjUGF/WgqjEBY8fBAp67l9py2MLHP5zkCnUh7iYkc9f60zmOOJbfOrAd4M9I2yncW3BzAtyel86DEM2h/9CdttUEX7EP7na5CuObU6RRYtuHu1xBbtgT7glJs1zXa/bPW3wzxcIED4pa2etQwPaNIeGDW1qW+Mdpewu7cEDgsajszaK2ZPIqprsa+Mbe5OuD4O8ESAc/bVlvGVrT7lZ0qvWdhlltt7aEPXszY7P06DQwyhBgzdBpDwFQLhteJEtIIRGq5Hs+UsqNdiG6jfNI+YxvawzXjfrEVYO0wDrDEw6Os2lTq9t8e3Vf3J6o4CHE5bznO4g+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <493ed0e5-7121-c372-9a19-3ed0bb549ea6@suse.com>
Date: Tue, 22 Feb 2022 12:06:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and
 __initconst_cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220221180356.13527-1-andrew.cooper3@citrix.com>
 <0c253fda-c5f6-b7ea-df6c-8b43b86c6a59@suse.com>
 <9e442a8d-ef71-3776-e655-8c8a226af706@citrix.com>
 <61efbf17-b07e-d513-7430-d0549e1384d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <61efbf17-b07e-d513-7430-d0549e1384d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0032.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa75ae84-f643-4110-8a34-08d9f5f3517e
X-MS-TrafficTypeDiagnostic: AM6PR04MB4056:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4056557F2D347E59E11795C4B33B9@AM6PR04MB4056.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZnEAoCA5qar7kBCNVbr9w4BtqpozyZPWtSgEmcQZxDpQeUXebXcwkvAEeDtbsm3SQlulY8NHU8/VH76ErNyo9zIwMdnMzPXKBRRDXpzqy0V8BmG5ppZugp702vYd9+8k00FW87EgMk3x0ssydU6xuEE1HNpMjHiKw8BQNxnCTNKhf1PMMcQvnZpND9sHiSMSlIcNk1xnsngSBIQvM/unXfDXGgsxaJMLheO4QKSOH5ASFK1KL8BLu+9ei1bufdDX7TJ9d8KKxKNKrBqPck3zHBgtpUzWUpM0sfV8USyJqkR7W9evM8mp7NBAKyBT0xqt3duPJt1K2A1Upv22ToWZ22Xxj4ypNgzrHFQfdcbYUAIk+zOpHv2/8a1YBjaLOwqBzZ/4v5RHRQnR2Eo3PO4k+REwT6wSGMApDSwc7XBleeWByUhpJlRndxQd64TSMH5YbnjsSvLpkWWauNYOfbsM3bRkHRYNWavLiDxXNOasjaN1oeCXXWrdD3HbEohuQ7fuUuc+rwJ7HrJhUZFYzGPNAQut2zCsiT+ii0SlFvw3F1IX4k/4D5mA9dp3Ted2VpWt5Y5K+CuK5tKEqOqYgoz42ZMaLLPs792XMINQPpHnOECosvB65ZlEMIp1YM04FeIZkxr/xXjrU4RzjSO6MVaS50xkOf9hfJPkqLK/iuu7jkScOUCTgoIQt6GPVOxaQzvxIDiYJpQMlnVbF/WZb15fSYzR0xv9UfsN1Lq6yalcAc1i9a8hJwn1uw3oC5KISm01
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(38100700002)(86362001)(6512007)(508600001)(6486002)(6506007)(2616005)(31686004)(31696002)(26005)(54906003)(186003)(53546011)(66556008)(5660300002)(2906002)(8676002)(66946007)(316002)(8936002)(4326008)(66476007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GHDtRJ45/U+KBM1WpxucZm1HuqZr+VpEcKlkXQtE3cgdAtoUJv9L55kukNin?=
 =?us-ascii?Q?KmqvSO9GesPng3AJ+jT4Bp/FVjqqAzJHOnFndxLn5Ub1vPNZsiVJN8l7down?=
 =?us-ascii?Q?rONMV8WAxYkOHKKqL0gfmnIGc+t0KdieEjysrZSuub2Q5GBNTVXEbfnoO3dt?=
 =?us-ascii?Q?03dkDXVzPXsGBytt2wn2vD5z3YUGouTKfXXxGpEmsk5/p4f+V3tvrVhxSt8q?=
 =?us-ascii?Q?b2tTcd/xMwYaCzCceWFL2R5EfCbtFoqjaPDPSSlwWpgNlTyIM/Tz2emTofiN?=
 =?us-ascii?Q?gCmIYg+KiRA/PotoKPv/eGePa3VAFDIm1vVjaEhtJcz+OvdEnpiiPmMMfuuJ?=
 =?us-ascii?Q?LoFlhWz7qb+e65vbr5BqkPj5Bug0KlxrZjZTXAcnnBrbQjwijOQRFXahew0P?=
 =?us-ascii?Q?u5v2MFiYqtf3agjL3osRcBM4bxedYfEhDllZ7OGQ8bAeZ5FavUGV8ReuSZGE?=
 =?us-ascii?Q?0+K8PyTIVg1Me2IugjxTgOhdOzYK8DnfEzj/frHCP39tz06H+YR2LhFhnYYb?=
 =?us-ascii?Q?FRSY4MMyRpvLImjJJkvBjV2JuaxK++oHe84DmW0Z8dZCsxXMSUVUY1Alrq8V?=
 =?us-ascii?Q?rydRScKygnmXUegxypVYHsHF4jbRnMx5HCmp2bafshbUKvK0+rlEsHLO+/FM?=
 =?us-ascii?Q?S53r7PEKoVuugbpxvBCDAKxbasEcPSmJyx7D65EaUNZm1zcgsiA3yMtL/Qas?=
 =?us-ascii?Q?LOeWeBH7Jeoci98mdzZoqBR9OEUjxG0sJs6QFRHfR+n2NyaxBJtSQBpvk22V?=
 =?us-ascii?Q?h9e+YHQGS83chGoKBosDe2HDBdmTtlQUUDhvNVopC6gDZN5HGmJdbdsE0Da+?=
 =?us-ascii?Q?XSZ0PoTIO+lQOzDgreywZFZnDf99stsNg3yRYvuaaXTCl3gtmKQHrULuBLCA?=
 =?us-ascii?Q?sJziKeAvWSU7W38WB7kCCMkDCwdOleF6ESzz2SbblOpg96lQaleGl+Id6ywq?=
 =?us-ascii?Q?eBtQKwuYxPAJXQxgQzp3cH14dG/PyTqt9vKo5skyL7tBLbwmBkOyoJdgeI2u?=
 =?us-ascii?Q?GkOC+luFzhJHLWisYx+FfIgGYN1zGWAGC4v1VAMu2doy5FUQw5+6oRf1PrYX?=
 =?us-ascii?Q?qd4QHO09bljmtjPwpyuENPGD4dsHeByPTe6pb4/kf1aWolAtHX1zQu67UvZs?=
 =?us-ascii?Q?DG1ZqQO0BP+b5pE51gbX8gIM6XGzVbiqsEu62EHLpw9bj9QbuVRnRJp5AuFQ?=
 =?us-ascii?Q?qoj+0U9DC5QmLpw/+p1zneWMXZUYhJqL8pZsSjntPQT8gIDJXUyI7KBpm1pO?=
 =?us-ascii?Q?ClYnfSDtWUj0nRzpDTM+68NcOw7asUlhmiDodjqEYQ1eIiUmOzWMmUJAI+NZ?=
 =?us-ascii?Q?pqKjzcwP1TntINp+mft/0gQnXwyRJ0TMDvZCrcJHwJfw8prx15GZKE6BOH6d?=
 =?us-ascii?Q?4hCySz1yy+PZW2nMfWcTjR6CDGME7oZWQ5EFbMA3Nf5+Dx9yCtEwksnRQz3Y?=
 =?us-ascii?Q?lhy2WbfqshZIa3nS90+uOSFJMHQjxdXiAmm6YHIQBvX+jT5AyrRQ3zcZx1ea?=
 =?us-ascii?Q?joSB+ZTBwQ2XNePVoKrwcX6ZRmp4jLBfEmIBjVGr5FvCr0jJGyYG4D6vcUes?=
 =?us-ascii?Q?xhXxQvsANqkreQy95PIbKr3ngzWdwDicfkBJyTFnXGSnM0+6YKI8dTLIAuSg?=
 =?us-ascii?Q?uDkPdUVjJf+ebIbvS9FFtgs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa75ae84-f643-4110-8a34-08d9f5f3517e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 11:06:04.3991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPfAkQIWrFj/PqLdCSSegl+NZ6PBQxfzOIuIPimzTCu4c5nLzHAa2Mvc0FwE7U77fHvLqd5ecNoKqPLYW0nTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4056

On 22.02.2022 12:02, Andrew Cooper wrote:
> On 22/02/2022 10:54, Andrew Cooper wrote:
>> On 22/02/2022 09:29, Jan Beulich wrote:
>>> On 21.02.2022 19:03, Andrew Cooper wrote:
>>>> @@ -106,7 +104,7 @@ int iommu_setup_hpet_msi(struct msi_desc *);
>>>>  static inline int iommu_adjust_irq_affinities(void)
>>>>  {
>>>>      return iommu_ops.adjust_irq_affinities
>>>> -           ? iommu_ops.adjust_irq_affinities()
>>>> +           ? iommu_call(iommu_ops, adjust_irq_affinities)
>>> While this (and other instances below) is x86-only code, where - with
>>> the removal of the #ifdef above - we now know the first argument is
>>> always ignored, I think it would still better be of the correct type
>>> (&iommu_ops). Perhaps the "(void)(ops)" in the macro definitions would
>>> better become "ASSERT((ops) =3D=3D &iommu_ops)", which would check both
>>> type (compile time) and value (runtime).
>> I'm happy to fold that change if you want.=C2=A0 It ought to optimise ou=
t
>> completely for being
>=20
> Bah - sent too early.=C2=A0 "for being tautological."

It's tautological here, but not everywhere. But imo the ASSERT() is
good to have anyway, i.e. even if it leaves traces elsewhere in debug
builds.

Jan


