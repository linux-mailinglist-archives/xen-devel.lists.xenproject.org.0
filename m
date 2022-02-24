Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7AD4C2CAF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 14:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278241.475418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDrG-0002bZ-CI; Thu, 24 Feb 2022 13:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278241.475418; Thu, 24 Feb 2022 13:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNDrG-0002Y6-8E; Thu, 24 Feb 2022 13:08:34 +0000
Received: by outflank-mailman (input) for mailman id 278241;
 Thu, 24 Feb 2022 13:08:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNDrE-0002Y0-HP
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 13:08:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd6542b4-9572-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 14:08:31 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-FqY1RuRGOM2NKg8FhVPpPg-1; Thu, 24 Feb 2022 14:08:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6295.eurprd04.prod.outlook.com (2603:10a6:20b:72::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 13:08:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 13:08:28 +0000
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
X-Inumbo-ID: dd6542b4-9572-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645708111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OD6me/iHS9h2m3dA0IrLXXQNaO671RgMeWQa7RgByt4=;
	b=j863uh4vyMIo6vvQusKlX2fOouMrjFDtjyVkT7tD+aVrXfFoLd9dFoU9tTNQWPO7/oUAay
	hhjdGNqiIIjyR67MPExpaSK0Zn48y2jgDNauW7rAi5mRspfKBsUw8za8jRjEJP/nr2zVrH
	Mdjf09yF9cbXgZ8OnG6KNX0CsCNLRWY=
X-MC-Unique: FqY1RuRGOM2NKg8FhVPpPg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxnyS9JjPd2mmRS9GtyMLTB8aA0p2J7Inew/qGUMZ9b+2pBnY1utNbp3wt+ydv0TkhzXPT3hd9XzEnxncm3YPdDGBOLdQR3xE/vIGlBBz4loqjaq+5TgcX722FK4B/vUtpHrKhEi00GovoVpf/rSRxrqwrAmO608xVYfo2i5zAYAEFpO0DDqduHxWMRTEJlRqlfYbzqPimU5y6/8qb7eKP5at6n6INpX0eky9gHVVvYA7RgXJozbnvU6AP7Md/YNJkV5Ph54gWlss/XcAOrQKo9BFniAFbR5tWGWPKOibJOKk6jAp0Pii8s3CtRvSgcASJNpQSCeJBwBaPwygVC0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gesGas7EcP9vw5Ssd1oG9f3IkHkO20rbqqAzhzDJDaA=;
 b=jXoAnEI1qt+WiFH54OLOcyxcE4w7hXm78RV3nmtHffod8FFSh/mEs5H5xmbXY5UWw+lvjrM91ojswKep8aHNMkAs8Ff4HpX/sHYhKpW9iikd7Xc3RRlBi7AFux/dD6KuYexVYvOAJrZG+Hns8hQd9F5corZa1S3hPpkbFSd3Qa+TNeW+5S1fCZ7Ox7oaROvmpx9/WsWtjYONM980Mc4X9sdokuijNpxHpyb/8FSP57sDevi9jEkNnT9ZVSmxVc3aKsw9zkrq4+WgZuSZv8Yi+4vjxmItol/Q8ElimDVqwEfFz0P8NfsHIDE0tPo6X9k4g26uYyHXlVwtXswSsVIcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6270f203-c839-e54a-3f94-7db88759ed0d@suse.com>
Date: Thu, 24 Feb 2022 14:08:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Ping: [PATCH v2] MAINTAINERS: update TXT section
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4f26b785-ae03-34a7-7dfc-d36121a44ac2@suse.com>
In-Reply-To: <4f26b785-ae03-34a7-7dfc-d36121a44ac2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:206:14::43) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7a5c070-72af-4e37-4134-08d9f796bf59
X-MS-TrafficTypeDiagnostic: AM6PR04MB6295:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB62958975FF90C521700ADB2EB33D9@AM6PR04MB6295.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V89MaHtaUOcXrxbYge8GbIuG8DLJ7Ox3plhgrWbtWApTUPyRGlNtiGQIWsJFmo7aoA4kexYuQoynzk6tyIA1UKxFmXq6ejwA4z8ze1VigJG1xRysrcCu9sZZ99ts0wEs+JVCKRnhCv9Z65IWqoy48DWZ8aZgVXxpGkgOyv0uSI1lVzQvI/2yDrq3CBJ9LxFNegkAE+aB132gB151d7+d56TwzfHVZ1z0Gr9zPFvQqbVUrttKv+waYQN4VMkhtqJVvH93APjUZ8Lfee4WOXMXEyaU12luuoT91CXv+qUJuqICXgIS5rbkpzZpiXXO5c54lo7giIzXKJ5RJ+uEn20sn6LWRHxjtvXJtJ5c5QankjLF4iUwja1pW1CN4Oe4Mu3Fax7nGG1aYpzrcgPypd2ipwVitrXf/wNXt1/gosQ/9GS6Y9YgTCz4v89epTfDBDcazvDsEkeSTFEhkoDObT/YIcOP4RYXv7hSrEokcA7K9yGG+5zPzpPHwRTvjU6euJv/YoHg8zrXJmwwX3/99k992PWhlQaux6hb+QPzCJrwn1lSNk6qXQXcH6Al5GD3JxzUhtCFpBEmXxgymTntCxMDlFPIjhGpTWtMhQNLfUTTXNUpzJcfWaf6q+6k1x1y9F5IzUoWVkr43jfjhiZ6b4oqEGcDFlnOSiDRkIPyb/mVU2dKS+KUlUg+xS9hCSlG6SgkdwnJomOwvpNMk5NvtipWzA63F6NMjmyf9gGvJMGcOTDY+N8UoaNOr8FP6m765KGv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(26005)(186003)(2616005)(31686004)(4744005)(36756003)(6512007)(53546011)(6506007)(8676002)(4326008)(508600001)(38100700002)(316002)(8936002)(110136005)(6666004)(5660300002)(66946007)(86362001)(31696002)(66476007)(6486002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTPzv2cKwRCZaX2t1RoNhPUEZ/o9VSK+ENzthl1BjNXwcadRCoPhBPH5qTVi?=
 =?us-ascii?Q?o/fom8CN+WoTPcNfYXhGEr9ZBpuDlY0y5tCopuj7XB6uG0jJ+RbNeaZ/p2UX?=
 =?us-ascii?Q?ZfbSjXpVz5c/HDqpIEC86hBlxsCZX6jTHi7wZgtZmunSIzdPtJZMzlmlx33r?=
 =?us-ascii?Q?ZqJ7reHrULzcsJQQdsGjgQQENwMtOrpaLGuzRKJfC2baQn6XjGauty98q/gY?=
 =?us-ascii?Q?Vqzds0RRkm4I5JY5IUM2GGtSg1oee75M5tJqn3oHWkgPQAGxBGR3RiQnc8sG?=
 =?us-ascii?Q?hiDF5FMcrw4ixqdCn7NDK+BypecVWGEI0vFEB6hhVqq45hxmveS9ZtmYs+q2?=
 =?us-ascii?Q?zCFzNVAzxIbAFdzaPWns/ahBaXhsiGg3a86zhrowqkrTPlDmcjyuCzjlQ5+1?=
 =?us-ascii?Q?36syJWpWZzHshP58mi+9E2GPEGTmmVCqQCjX00oZqIKD3bQQ2ybL5Zc1U95n?=
 =?us-ascii?Q?frN+DgRC+X2UOgWQtb7qYU+cu+AMdS/xfHZzqFKrUlQO9aPVnQ4hEyhaOEvw?=
 =?us-ascii?Q?qSr6jmKrtMpTelncDSwKKFU9vukXVptr7wdkhBv4DPNZnsieiicoJuChiOY+?=
 =?us-ascii?Q?XLgsHTMGEAyYDRBs+i3t6EIdVdhK0a5Au0K4QV5VikRUb+mpfXOL18p4JEwd?=
 =?us-ascii?Q?p4fp2uQ8koqn/8V0NLA3BrhPn3QCGIJ40AsJCeSWG142DCMN4j8TCwQ9+Fd+?=
 =?us-ascii?Q?eb/Q5kSisQh+jXLNUFaVWSElfbpqMJIit3nFI7zaULGtA9qKVongNeCpBuwQ?=
 =?us-ascii?Q?1xtB5nPxAmq6uXU88auWFqyc13hFnDmY72ALrSPq9awtdzl8WCKGFn9Uvhu9?=
 =?us-ascii?Q?LHr4md2D3thG/yq/QAqdCvyVB4J3xJ5PhEy2VOSlV5V3/wdgGeaUrXon3mi9?=
 =?us-ascii?Q?5qVXtuzyqbEiLvBt51J++2ep7xAYRnZISbh2A3FNqOzkzBLs8M6P0zZujGLK?=
 =?us-ascii?Q?KYKc9wWPBsbronPYtqgEmTvWc4dmHOF2TG5OHLn4SWvrr1sFtJzXLhczOhWt?=
 =?us-ascii?Q?fS53SiWHbglYNg4bYBjVZTjJsGLfDYGeT+POYEqw0rEKRmOf7owQ16Yh/KRu?=
 =?us-ascii?Q?33RlXiEiExILZMC7r2JlL9TgIDFBsrh+Tf+nuL1y0tIMhYNxsZiYqkbtCUye?=
 =?us-ascii?Q?276jRwhUOWmiSU90Kznzi4+yHyAGOWw9H/I7KVo3mNFFoH+YeNyx3ufOmZ/6?=
 =?us-ascii?Q?B6aKfI4Rfw9cwUyLbP0p0ir+iYhkotXjUmYX9n8M6LRse2/BVALAURIkOCZp?=
 =?us-ascii?Q?Fnjxb7nKhaN0miVcTGI3K6XcVsC0W7h8douqtIKSzy/VORkLrOwVi6xtbu0B?=
 =?us-ascii?Q?mq7QirplhGKiArzkQgvblOK1OrrOLC6SVQITrKUxAYMeF83Fr1HHVajOmheE?=
 =?us-ascii?Q?VfhOTU9jf/Lw+m29aOUEGVsham+OWa8b4RsVvWJcywlT6sI6TWOnRy9Gq9rg?=
 =?us-ascii?Q?7fTIZhQZeE8TIkwZxI2UuOiSiGiZnXnbuPK/pXOjxtTz24/zdrUYhxXKj4x/?=
 =?us-ascii?Q?LWXQy7aJXlHOmZrBNDXTcHhM3oYij1x5Yt5x//uZYj4gF9q50jxvktwF09vr?=
 =?us-ascii?Q?9nQrVjxO+Dw9elTLnRH67TaIMFK6/N5qpVof8xPuP//fhuLAkGmiQ1/q6XEL?=
 =?us-ascii?Q?uy9j6W2l5puz6VkeTc3/tIU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a5c070-72af-4e37-4134-08d9f796bf59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:08:28.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IfmxPO072q3Z2crr8CnwOuN3s8T5kQkIpjT7BDFopsngL4fp2Jc3PAGND2midmCosc3ejJp6KYm3bCHl042SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6295

On 17.02.2022 18:02, Jan Beulich wrote:
> Since Lukasz has left Intel, they have suggested a replacement contact.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack here please?

Mateusz, it would be good to have your ack too, considering it wasn't you
who proposed the addition.

Jan

> ---
> v2: Only add Mateusz, and only as reviewer.
>=20
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -318,6 +318,7 @@ F:	xen/common/hypfs.c
>  INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
>  R:	Lukasz Hawrylko <lukasz@hawrylko.pl>
>  R:	Daniel P. Smith <dpsmith@apertussolutions.com>
> +R:	Mateusz M=C3=B3wka <mateusz.mowka@intel.com>
>  S:	Odd Fixes
>  F:	xen/arch/x86/include/asm/tboot.h
>  F:	xen/arch/x86/tboot.c
>=20
>=20


