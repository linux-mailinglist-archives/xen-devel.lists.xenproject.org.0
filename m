Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC34BB3E2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275159.470881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyHt-0008Km-P1; Fri, 18 Feb 2022 08:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275159.470881; Fri, 18 Feb 2022 08:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyHt-0008Iw-Lm; Fri, 18 Feb 2022 08:06:45 +0000
Received: by outflank-mailman (input) for mailman id 275159;
 Fri, 18 Feb 2022 08:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyHs-0008Iq-Dl
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:06:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4d51263-9091-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 09:06:42 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-J4vxsJ8XNUaVXhKSQpAtCw-1; Fri, 18 Feb 2022 09:06:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 08:06:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:06:38 +0000
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
X-Inumbo-ID: b4d51263-9091-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645171601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aBiAVOMZGq++Df5VR4RIU5g4UdPKgSP24QnQ3tsEYec=;
	b=OueQmu6XcniZdJ90mM52fNIGWLKZ3jyBTOfIMun/6NNMfT9j93awndlCtJhCjWao2AcYYl
	wV0Rb9kVH/a1mUnRdJfAk0opAav8HlJ4dEza/jth03Ue0kom+Hg5wz9LfzCtZkg1qE7ONe
	roV1KO6OKz1XTfkU3xMJB29rTeEJkgk=
X-MC-Unique: J4vxsJ8XNUaVXhKSQpAtCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYtO8JpamBF5jCaIKtNwaIOAHYmQNS1kpnwUfti+PeY5KLOCOxM6SieujZp6yGG8m54JaAVl5nbWuqCO/VrGymM1kTQNxUiVzxb750Ypo7xaJpbwv11sXln5zuQmuTesIdE1yhZFYjcCYTH443lcG7SH3q/Ul7mu3XLaysiD3im57Ft2Zyucg7ATfHMtrpS1jZOwMHJv9p07tzi69EQvkEwG/QdWk0JPKemQT+6bby0DRIrrZkNQyOKmmtC1/N0e2SkvhujoYH3/5Vb3/fMmjgDynGliK8L5390X+sHEAAvEXDtis/huqZ8fGBtlI4jUVH0IKEGm+V9FBvqRauqcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrBq8lgcrPZI8jhsiqj2B0Fr5vp3ju2ZPZOYgHn9a2k=;
 b=la78hV+1vZeo2QTKMOSc7l5RXbNsmtJlMHe7LeVMoT52oThwOa+dC+CBloW2/8NwJv9qArX21884mp0WfjinG8ox+u490gU1UfIsLcbQQdwptmqWhO2dl9iv0ZbBMu1fqDIG+xiv8o/Ejmnojw3A/qmoisFHY9f5kdUyfqU0TGnhMWQvoes0fEhrhEMeN19nI6sRKsYF0eURCD+L858Su3tg1dDOdS8d4Dev9wlOISWVAlNXsDDwIK8q7ZC3SDwqdygfJmXqQqDgaJ+XoUNpYEj7wWVtqKUQxAW0TFq0Q3/8Akv5A7OMJhNZfFHGWgqMNCUQVLBSV6+1+NnikNBPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e59dc35d-013d-1db6-a61e-c2e4504952b1@suse.com>
Date: Fri, 18 Feb 2022 09:06:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] tools/libxl: don't allow IOMMU usage with PoD
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20220217140923.22485-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220217140923.22485-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0007.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366917f1-ab7a-449a-dd91-08d9f2b59680
X-MS-TrafficTypeDiagnostic: AM7PR04MB7094:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB709433AFA1C6EB15D9BC7F9FB3379@AM7PR04MB7094.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5YGV/4NGPKTBVYP5JLcCtcz/r7hjaiLLOFtzrVT6GTINrANUlOSEopHWn+Xn4YcIfgz960J0d8+Vh4RcF86PkUKS/9ncxSS82lS9jszGz8uz4lfVIbwBPF+vLzI2HCWqtLWubf5Mxsk+6hqh21p/3Q0qeRmvOvkjFrBBNwnzbaRxLYSAw7BzYQuJPZzaT993+JYNmnUy4OYW/TQ3NIcjZnb37+bX85W57UTTVFZiv3pbhHnt6D70C+7uJ3GDDpPJj7DDzyg/PYKopsKvpQTjdozNAFTRsXvAARvQMpgyNhSV4m4u/+70BLwm+D7Qg0ymUtsltiwSXyqWshU5tp1dfQpIFadeQsptZvs5VGhwU2HYBtgurPw9UziFmKQKc/w4S5fohRMKs6bZ7iOrdbbdVr3EG03kiycwj22i3W5/DpgZSGxu4xOKLw0ai0QlYLbuyE3LkpZWSoLi94CmnXhbNqyh39YczFzbRH0MIdwTaxvgM3USSyw8j7kz0f5fv7tD7wA7i9l3wcuE0uBQcbDG/cLWolEONFoSHBt+pKUrImJs0iyRYa1YANmOviola7mAfRiLN8s6O5i2d9mkXQR8oFcI9MbRw2HPxtav+zHYl+xtoPXHXqPPjCHnGvSa+7zFT++i2YzLFJSXUF32rSSKFN+J4/l742rKoxjw88kItvFM/DX7yeO/crMjsMm4jTgRIxau/5vtdmEaAY/l8SxAfl9PIlmyUG5BS7jJ63CjOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(26005)(31686004)(53546011)(6666004)(6512007)(6506007)(508600001)(54906003)(316002)(36756003)(4744005)(6486002)(8936002)(2906002)(8676002)(86362001)(4326008)(66476007)(66556008)(66946007)(31696002)(5660300002)(6916009)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N3OxSZ4mwBU5OQasG9CyJFNT/NakxQbuI9AgsQ8hmAnPoRQZuhbSFzV8JhUm?=
 =?us-ascii?Q?ZEHdvFkkM2avCzhmtSZx2FYo6xeTfgwuMS5xk341u50MT3T3Q4aCl1Au+RAc?=
 =?us-ascii?Q?qGGitIWlQr/LsiEPfvo8rHs1kaaR6bUJTd80rzco6RkWKGn1lNFOMaowFDtV?=
 =?us-ascii?Q?3NrucPDQxnAAeeXnWOw8VjIEVMwF91ngJ0H9zaZm7fjLs6x5AZanmQgJupIB?=
 =?us-ascii?Q?GZz0O64dcsL1eN0sotxCQAw/mCw9zuIdluL2KtqPIay5JtOxzX5NBpcn++DT?=
 =?us-ascii?Q?xFZejRt8J4fOBKiXeNUM5Ep8NV20xYbR/5eoHsE4xs2Rbg+8+yo8HLvIh+OO?=
 =?us-ascii?Q?cJJHAukvhTlKsjv67E5fQmgbQRmHCpqDG9qbz/9buhwow2nzPvoViOM3b6oM?=
 =?us-ascii?Q?K79C+5CwWngqXtq4euUFtWYZvpU7KLIoViFWTM5EeOyTcZvk9/Yiu8yLNcD3?=
 =?us-ascii?Q?8x9nOMoJHfav8DYQm+VX5OU1IE3bKsNGg8KJXxrrjW3CVtY0Y+c6L8umM0FZ?=
 =?us-ascii?Q?aFA3B6q35MbPpI/jjwIl4R7G7tODZaG76nj+Fj2rEnIc/Zlh2qWd0mydtxsg?=
 =?us-ascii?Q?OQbd3T2iVaT5OIIG04oQ+xTc21lgk1B9SkmC+s2R/hfvF+xXch383hOPqWdw?=
 =?us-ascii?Q?YENy6gDhe2OnujnbZUQCuKsFZXW+Kpew00JOx0FBYZbdZaYOvjm29tKXItc3?=
 =?us-ascii?Q?bne7FbegIJt8MRLiTNCkfN1T2c1MLCowamRASLIZjOI8vFsqbv+W0yearol5?=
 =?us-ascii?Q?826j+HZ2IDcGneUKFTO9sI9WcWjSc/JBRmKlIR5OxqRdLy+QqEHbUr1hS97H?=
 =?us-ascii?Q?S7xCvRQB0rEteg+YzNR+YTsvtBEnOKcsBi2DzGWcDMp5HTGWTPO7UsRYSNP/?=
 =?us-ascii?Q?I9gfBPXDMHvDpI8jT1HTtQ8V+BZwD/oUuEu77j9KQyZ1bvAsJxR/D0MBUJfr?=
 =?us-ascii?Q?Ikn0fb+SQXmODvEF8xBhq3GkAQYMtFuHPBwyavpjTKYV13i8kq7E+68jY+6H?=
 =?us-ascii?Q?/fd+ugGyfZ7lsK8ds3jOzSLXNZyRhpWlLfUu417h587LMhN74VD/hx1uUaal?=
 =?us-ascii?Q?hgIVeeSKSDZoiZZPZyE+428d5C+1Jna77YCeLRsOkp2CisvAOAnIAoQoqMFC?=
 =?us-ascii?Q?RQtTkzBpOuGy40UKItG5Abc++YTQw7/72I2N3lcBwUOWddIX5/m8VZMcauct?=
 =?us-ascii?Q?GOALvbKY47zIr6SJCbXNhGa71WaxUOOzcYdHMw2G0ZD+fY3lTf053aMNTolP?=
 =?us-ascii?Q?mJqB0DfvO2sgvp+ZnDUiOdKmw3UQyfrVNY6ltM0qXWK/vbsZE/XkOcx1u3bz?=
 =?us-ascii?Q?5rVU6v17q1R6Ee7O+RM9rRI6Xd/J0TaRk21h2tSTmim743xKZwW5gdvn0ZIn?=
 =?us-ascii?Q?QlYwQhSyahQi+AyDrYK/oL4w1JWNDFlS6OSu+kmD25kc8Qri4s0YH+2edxIT?=
 =?us-ascii?Q?WEcTyIMR43/fk29CCVDe/H1H4FlE79gfgDx0ua+Uc8g6m7C3Q6MIo7IuYhNu?=
 =?us-ascii?Q?Z5r223xaEG3Xi9da+VyFl/mVdJR2LSvp4B3jZvZDypsD8loJNVJWrM87HbYV?=
 =?us-ascii?Q?9Imb3ykKCrUQaNVZazMqvFyEvVAGH9j4GtwksGcMpnFucRKwJZDhSikwUpTc?=
 =?us-ascii?Q?MpZNGCVmdg31tJOVP0x6rW0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366917f1-ab7a-449a-dd91-08d9f2b59680
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:06:38.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Us88UERTHGHwBf1NuVTTv1+mdyEaOAQf1iyRKSn+RE3Js/ml/aV3oik1Zyxgl8zXUS98w9829805W9lg3CAEmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094

On 17.02.2022 15:09, Roger Pau Monne wrote:
> Prevent libxl from creating guests that attempts to use PoD together
> with an IOMMU, even if no devices are actually assigned.
>=20
> While the hypervisor could support using PoD together with an IOMMU as
> long as no devices are assigned, such usage seems doubtful. There's no
> guarantee the guest has PoD no longer be active, and thus a later
> assignment of a PCI device to such domain could fail.
>=20
> Preventing the usage of PoD together with an IOMMU at guest creation
> avoids having to add checks for active PoD entries in the device
> assignment paths.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I'm inclined to queue this for the stable trees. Thoughts?

Jan


