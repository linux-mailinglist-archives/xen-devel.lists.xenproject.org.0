Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5443DEEED
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 15:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163481.299461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuHT-0002Us-Rl; Tue, 03 Aug 2021 13:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163481.299461; Tue, 03 Aug 2021 13:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAuHT-0002Rq-OW; Tue, 03 Aug 2021 13:16:27 +0000
Received: by outflank-mailman (input) for mailman id 163481;
 Tue, 03 Aug 2021 13:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAuHS-0002Rk-8g
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 13:16:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3464b42-2a55-4823-a4a6-13dcd4bbb54a;
 Tue, 03 Aug 2021 13:16:25 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-MCgc6gGCO5CcsvTpwwb8GQ-1; Tue, 03 Aug 2021 15:16:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Tue, 3 Aug
 2021 13:16:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 13:16:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.9 via Frontend Transport; Tue, 3 Aug 2021 13:16:20 +0000
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
X-Inumbo-ID: f3464b42-2a55-4823-a4a6-13dcd4bbb54a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627996584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aP7DhwqvIYqGNhPQJsiIMe7LnqMN6onjtyn0zuzxbM=;
	b=SdLvu/JAE/sF6mUDHYpR+MI2yhMRK2oOf1xU8afaFG48hCDtikdgmvajBxzWSbexCeOKN8
	05KG2tA7w6QiBQMlSYL+gpe2x6nnwqLHgnTslu1NCnYM65LM9Wkhcn3cRxdxdAHRCTOrDP
	ZZlKsvPaaRbWi8laxzUo5/G1I1FiBvI=
X-MC-Unique: MCgc6gGCO5CcsvTpwwb8GQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVWrZpTm1OSoEW9wmGP5A3Ry1LxVD8clAMXJnYNcFse/ARVXFqrYPjpNvMXKp7H3mRmlTyWHQci+cKu9Z3xhPCKQVnNc4H6tt+S/kotsi61iE59eGHaLlaSvhOnbDfx1vYuZQRf9ICEcADcda81/qu3JfQPsiZ2VcMVnbbY6m47yMx17v4OTGYhOPwe6xtRcK3DSRPZ0sHPP2TPPvZDEqIZ9aJN4gv4agzM5T/Lxg/iEHMhebhhlsgWlyCB5zI/u89ShwxVyeROslTrRaJ2tiEEvdtlRbJfn26Oh2zUSLS2+BlYyR988gJV4r/4ysPJKSj4QWRUsTrZp8KciAL81NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+MCmpB3bu8w8TPPkXRleFzoMRNNuIJB3/HiR289Sf0=;
 b=Iy8TwLML6HCIvuDa/ja/n31uaeVTG4lMQ9nrBC2gfxcBVyKQF4zErAq5eLzA08s+OvcidW9SeceoXYb2XYLb3I+5dyuvji74hDv1albqmvCcbv5klK9XgVSgg8yp5GTO2Rz0zF0/czrAAjg+gEo0gxMOa9TUiFwLUrB6D8PjWnW58oUf3G+6DxUGoqGXxZvE6t+0E1p7bDsY+ohx/YXDmvKObeyoaUVxx/l23PDS5+659RUTthr71c1fYtZJklODzme8mJtYUYA2l1btthpzUQjFr9PCp7P6ZzY9v0Aj0PF+k6H3Gm0gGm2wmV15Bfh/n3TGJIDMtNO7PPaDUXRdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] VT-d: Tylersburg errata apply to further steppings
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <07ded368-5c12-c06e-fd94-d7ae52d18836@suse.com>
 <YQk0vrH5Oe62ozbW@mail-itl> <ec1cc65d-5a10-7ef3-2643-622302cdafb7@suse.com>
 <YQk+I2FglGrnuyPw@mail-itl> <10425176-438f-370b-9d60-183d6e0f5441@suse.com>
 <YQlAsAneiMOD+SMq@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7b0c929-26d8-c1de-7658-a58ed31ee9be@suse.com>
Date: Tue, 3 Aug 2021 15:16:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <YQlAsAneiMOD+SMq@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce9e78ac-7f2c-41c1-6985-08d95680e32b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49414F3344DBC978A7D27418B3F09@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lxInrqkw1IpPpcGpIjJR9ztgWt4G5HZLPTYm4VNHWIIPQ6CRbVvnWMGExeK6tXY4r9rAZnGQXQ6gozNi3YTgHxCkQQYKiYyRxSoNUiFaH6rfTdWHL6Dk8WGRJDUM/G6I5GghGLXluuMgupaK0NpHGpbmQjeYNDJhcLRxr14qIDpam3Jr5EH+/KFDR6N05mZLjnN3u27qkKxJEAjv/tYhuB9gLAIM9TrmOn+O08uKY9mpxUACxyJ+LmqVHxuAol+Q4DGUhWLXeSFMcN+AvJQh3wJMtecdFakmBFnccM51kYsGlfk6UycwydDMgebzoa0WX8/CO/jpV74vUMUuf6ZO6NfyJPzEh8VoMKFQVXQti8P2rOwJzRyAER2EAbuxD0vDpPWysO1nm3JrASgaOwc1xcq+ytuVM6umCIf8BxY2DU/2VUL/gL1joWE7HaJpwJ911gxoaVw5Kb6rb3nSEnRpBDl2Outd/3/UzKDyDQtJfuWJIvy+LGsNwvgYTWxFxwUh2HIr5u/5gVwjPhq1PDpnpbsbN5et47gTgl4aAVQwFs1V7aq+9NII5LjGMI5df4t5QuJ4zeEH5aTl0hI5zruEkgZcZzH00Z2069Griam+oLpYgEMcaVMKtF7z/cc/+p5Is86IQJzdK5nnfh+Pzb7twY9yJbaWocyCt/I0tqI048Y6OBeT8oX7S5qYdQZf8ree2F3Zi+6Vr4UwS7YRomMR0N1G6+rKxAg8o4OJpep07Y8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(31696002)(8936002)(83380400001)(508600001)(54906003)(86362001)(186003)(316002)(16576012)(66476007)(66556008)(4744005)(956004)(6486002)(8676002)(2616005)(31686004)(36756003)(53546011)(5660300002)(6666004)(6916009)(2906002)(38100700002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qZbma9XUZqrR9Ao+2BsTy6bgLhmeCO1Qt5MS2AuSIPh6BqXPOVonQsKg9eGS?=
 =?us-ascii?Q?vMvMNv+gdr0i5FFK8xEQRU+0T4XFoRKm8FIrRJryQUJjuvzCT/2lTAlkUYF+?=
 =?us-ascii?Q?QPrRsn1kXZPcNWIp094OEzTPecwHp+BsHU2wHTSH8eQsmS/q080kan4Y7WWJ?=
 =?us-ascii?Q?1p2j6mQLyauUd9XO+vf2anrUa1J49hXIGUrcbHsnUaQJnLEcYaL1YVDawgQk?=
 =?us-ascii?Q?UDSwXe11HmgVvJ+9uFH8KnySe+pRKQtWRuMjEL2mJeTBk9hCfauJq9tPSsxQ?=
 =?us-ascii?Q?HYRWx+425RbQ2wExkOCeEwz8HGo58/Y8FUdDE0zNS76l7MmvKBSGu9bC/q66?=
 =?us-ascii?Q?2BPV1r0NpJkU8hvfbxXfgaNE5hs7wYvuH4WRbsDXhpzAEZhbZHGd+YsTXM7E?=
 =?us-ascii?Q?p7If/Zi3lXAV8opPxqm2WzhU8d488b0+Vr7o8YzvOkIXThv3cXNdttlwSZ2H?=
 =?us-ascii?Q?MBta5L+PdbDm+Pdcn+A9ZRo9pWcoIo0IJLNCc7d83BrONBO+zbEeasO/ZE1h?=
 =?us-ascii?Q?3GQtPLDUOSUXuOzG5XGDN/CSaEpTxl3POE0sm93Ap1usNS6c32Rm97B3l6aJ?=
 =?us-ascii?Q?bFA7gmFVBbw91/Mhlcp14vpZZBIyibVPkA3L3uluF25pq/b8M+ULKut2kxqN?=
 =?us-ascii?Q?LVAZceMdBhk0yqvMBsrnTQo5SACfrFewRv9hUb/knx16KdkOiltUAWMYcpsb?=
 =?us-ascii?Q?hMdG5WROSgaJAbdAi7MOTZZueKvX7hICzYTjwdO254j4ay4JH57pVAqT121Q?=
 =?us-ascii?Q?l8ZsjF7eawOhgkZV7GctLEWPH05OP/WPdka7cPiyZxDQrhZueElQ+w6HBdMh?=
 =?us-ascii?Q?qheGTGF5Fy0V8vXFxEk+uIG0FwTxCL6QxVCfcWGkpZkz22xwnGwwiFtqrfSp?=
 =?us-ascii?Q?KkYcTtc9hd+OTmqh3VwSmXlfe03PKQyEft/99/PVIH3b/dTklSnyDiDqp5wD?=
 =?us-ascii?Q?AFuIj38v4HA2DGdkquhSt4XtqNnJOEckaM2wqR/u4U+Nd3/QPzaMzAWPJMUP?=
 =?us-ascii?Q?tIFu73Tmq3WR2LR2wsHUTJdGqGFRiqNeyBZUo0EuOtWf8ZlILZE6ufw+PHR1?=
 =?us-ascii?Q?cubzh0XN1PdKLqATrMDMovU25dd9XApL0teJTHPJU6zHoT/ZmNcBhc3IcjQy?=
 =?us-ascii?Q?0lQxm6kBVGL+NtWkynnq5A3mtXPsfI2HNRV87+sanfy9KrAW6qcEmcQKx2d0?=
 =?us-ascii?Q?w19XytLfB5+Rm7Ci5UdGkDCQSbUqp15yCoHfYCLx07LM3p7X1anyEpwRkb1H?=
 =?us-ascii?Q?YKKn1ZLJYedbcqtfJpgbs4i7CMXmOmgDYBqFTmSEd4BAuqy4aMYxW3yvffI3?=
 =?us-ascii?Q?98g+dCPPKNPqMgxRAh/3Se7i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9e78ac-7f2c-41c1-6985-08d95680e32b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 13:16:21.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0XfX3qf123sgWPCIP0ln88VUNEDXT0MjABGgqmndwXbjB7wSTqTPC+HDqkWzaoCn/9Gqgg0XbhRMg9mKlgPpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 03.08.2021 15:12, Marek Marczykowski-G=C3=B3recki wrote:
> On Tue, Aug 03, 2021 at 03:06:50PM +0200, Jan Beulich wrote:
>> On 03.08.2021 15:01, Marek Marczykowski-G=C3=B3recki wrote:
>>> Ok, then, just setting iommu_intremap=3Dfalse should do the right thing=
,
>>
>> ... if "iommu=3Dforce" is in use (but not otherwise), ...
>=20
> But that's the purpose of iommu=3Dforce, no?
> With "iommu=3Dforce": strictly require IOMMU
> Without "iommu=3Dforce": use IOMMU on best-effort basis
>=20
> It makes sense to refuse the boot if intremap is broken in the first
> case. But also, it makes sense to allow using IOMMU without intremp in
> the second case.

I agree with both statements. What I disagree with is that the latter
happens by default (instead of only upon admin override), including
the case of intremap being unavailable in the first place.

Jan


