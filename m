Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A3442EAC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 14:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220220.381399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtOV-0001AM-Kh; Tue, 02 Nov 2021 13:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220220.381399; Tue, 02 Nov 2021 13:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtOV-00016n-GS; Tue, 02 Nov 2021 13:00:03 +0000
Received: by outflank-mailman (input) for mailman id 220220;
 Tue, 02 Nov 2021 13:00:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhtOT-0000p6-Pp
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 13:00:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 248ff405-789d-4b89-938f-59bf84d22a0e;
 Tue, 02 Nov 2021 13:00:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-uHyhMywqMzipuFGM1oA0eQ-1; Tue, 02 Nov 2021 13:59:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 12:59:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 12:59:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:20b:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 12:59:56 +0000
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
X-Inumbo-ID: 248ff405-789d-4b89-938f-59bf84d22a0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635857999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+PjICVWNpmAeYInRgYCqejJBvANk8gRoGI+CTZ8FXo=;
	b=QwaJgxSJ5injpqIUEwgCj9PDNuCG/y242atTESxHdsa11AKBPX1fNhe+ZORN2UNM1kW3eE
	hQeb8w5G5eLDMWC9Dd/PMOb+4aZvaGOBiJceFCiWn+o+VNXl5SoMH37cw/byIBlWuAMGJk
	/tpowLjeV8GZNk5H4vUWfdgoCs2dWZU=
X-MC-Unique: uHyhMywqMzipuFGM1oA0eQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD/2GyRPlCqhty91AqAUXYoTz9zfdg/3XbnMJDrjFDvEmq0tyLC1RhJK92rDcSd3W3YIzn2C8bsBVAq/MNKhLdykXT2LA/EQmF7MXjSH3aPmrr/kNadT1gBcirBKmRaEVecOZ/sSohHjrbhFV+1fZ3++MDhrLxba3RWDjQcvbg3WdqGRfyGlKK6IhWnngx/B/Rw6k6dkU+GsGRO5YvPZGzsDER3dqDp6RXltwoAtEF0ritKQcGZmduY591akkuLHBM7hG7hagevwXIZZ+OpLESSimXxHRdzJgvLK41LPONVvzvGwx3m7imqvp4sCSd7IDVBGi0H9YBHDiAQm91tLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZe1Rgwkk4WTiRfL9hG30OPI6hqJHX+D2ekIkyRvwFM=;
 b=j83hox0XvKvWJkJyNzaxpzHFx7wDiU48clfJ86n5VYA/nvYUtZGZSLCABWUNQ5R5y6PqQ7+3BYKfcZlMgeOzkg/JfHdY3JbgyQqdFJkIiyaV/GghiMshqr+LFu//S2vp0mT84TrbJbrO1n/MrYMUnEOkFXEqUKztvVj+oAxyNRi3q5/3xi8LmbXxXZkPiz6VU1HHyq3Y2/3vvnXxJJ0NrLz+fA2lnbAu2n/TgCqlyPCGc45ZynHFVwHclflqJOCqs1W9rXSKCcupNF03q/qlXSzmQOTBX9/dEKwx/sJjuY+155o8xp8Jglrazk8IxfGpllbBRznbbq8vQTDutO+aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9be5708-dc5e-4c78-0042-410289e296b3@suse.com>
Date: Tue, 2 Nov 2021 13:59:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: Arch-neutral name for hardware interrupt support
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jane Malalane <jane.malalane@citrix.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0128.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd986606-e1a9-43f3-e2ba-08d99e00ab9b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617640A9490EFF318BAB41BEB38B9@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z3YnqTZFaD0vTm6bAjFEy9GEaQe+XRlFKUg2/1CRoW9dB4xAunBws6r5i4lMMzFttQ2/PIbvWgpkuqc37Q0R6gdPt2aGoiEKqgKQGWU13nNvSfZIyjQ519K8bFV5BNees5mWYS0+Dqlr56EgdXVRiX3xZ4Cn6j8gJ3GwsTP9+dQayI3uJdBHDLA+cIWcGasAwkLw1F+hQahrMsxRIMuPnbJogzs/F/id8bw6ZVGz0kI2FVOSENHOASB0dH8vgL5tOSJLU1aftOYY8gTn//qboEDez/yh7dwtyAoatL7+ypQBHfBJyeah/r/UmIJOSbQSufXg5H/Tmx/cny0v+l/FBnlJ0Xn2BDIPPqXKqdiEaGT3il+gwG9dqSCUYAQJD7Ap5Pia2B0YrW/AqbyBcBm/YIDKwUs1FZ0TabR4Lal/TJUjdUtVy4W3Qd8NlhjD4bhlXpdUSuY8ZM6sHjq7bNvT8o+f4Ojbxk8IYcbxiN2Lq4+8Ijhk26g0/dhtA5IpyvGAiSAy7S/DQc1VPN8kx8HRaxPpcd6b9ERePbjYxPaXHiJyy0k3UaSvvgdCtwImt+MG9izgz2FPJ8a9UMut9lJ6m/K+NW+Bapp1rp1s3WAFcJJcnwMiTAFBhIMnR+Cclq5yr6y0aflB8/ds1TzIn4y8VRmHPqei9j9/GJJ/wYUljZKaTkFURoLefUwCAJ+AF8ToMYpzisnseechKlkXY9R8YGP8ZPEvc8RzpAVUITSCPv1juEFjM+01oxUtfOQ0x2a2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(4326008)(186003)(66946007)(31696002)(66476007)(2616005)(53546011)(956004)(54906003)(86362001)(6486002)(66556008)(4744005)(31686004)(316002)(16576012)(6916009)(26005)(508600001)(38100700002)(7416002)(5660300002)(8936002)(2906002)(8676002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8evsThfFZwv+ArrUB62/qURmNdfOXqXICPudEHPWCJcslJOjYu5uCJkiAAWS?=
 =?us-ascii?Q?Ki/Cg2Q1JBj4JgpVICAlMXe0BAgsIlhBe0K7N8gNf4pPNorACQeiBuRjGyGE?=
 =?us-ascii?Q?8JyriSjfZ21ZFkVvXik9dKNFEfDvWy3n0XA+LcUjU5mZgyVXmGSupbD0jCy1?=
 =?us-ascii?Q?4xDgfG762WSAGixDRtwEidvpFWCx2l30voyapeu8PcKT2eCeeSFC3pl6Yvyy?=
 =?us-ascii?Q?V35CqrLj3t0uQAweNV0AmqODX+puoSXX2USp/96Yo3JrSWJmZvA7HmMy1MJK?=
 =?us-ascii?Q?/eIGWOG3LBLugL6Z66c9IsTjMl1asudk/6W2N/GZt8N4MKZ+8cR5y4snuEmg?=
 =?us-ascii?Q?Y03CUM26IM/pl+bzPP45hRiEG/0XcYIO6ihAKdjRYLmYkog3W/Y2GfAUD0oY?=
 =?us-ascii?Q?zInRAal45Nmry86d59eyd8wjqdUV1MEODldSELyU7HJNVSTizHeWZgsdinYL?=
 =?us-ascii?Q?HzBIfb3xXueMINFfd7+6l+p2XlHzwrmXRHf1+D8v1jeZTp8Uan07WBcNbU7l?=
 =?us-ascii?Q?vVlv2hHA7dfdLL2n+Ilc4wd1kfQyWdfthiDo9BUBDc/pc//7eB0xbSbUTURG?=
 =?us-ascii?Q?R3CTp29eix234W2h/NROh5PjnvoV8eC4YK8yQ+HJkbZ/F0eKkDpb6Oc9LxoW?=
 =?us-ascii?Q?Alf9gbJ/iWaULTXct1fEPBkcJ9QHCszAHYKjno93GYUDlA+YAxew+bLGQT1D?=
 =?us-ascii?Q?5MZV7ddBE/bVIDJaV4CY/kwLDFv8LnuHt7V+YhIVEIun4jPllRQACOHYLSLE?=
 =?us-ascii?Q?kktPCBczFlspVTga35JtXRfqdRNKth8m/Lc9nLE382BtbmvyetKKuyEd0vqA?=
 =?us-ascii?Q?YR94KS9SDbksLW57OuG4+pdsk2nRPrKTLp87PFTwjFI4rYsLplpwNg4NFjWl?=
 =?us-ascii?Q?eeBv/PNsU+XjQcONBLVp2eXYUDlMa27/7QhEIHpdceT8o9Rnd5D0hrW+0//+?=
 =?us-ascii?Q?zC2gxrjgVGt/OzLk5jRm+h9pN8HkR7bOjN3PiwOPLLxfZKxuzERTb4rWZR1K?=
 =?us-ascii?Q?1J/ItzTd3/6ZKoI7hGtge80A5DWb/pS9zV2+yw6k0Fj2R9NZ17vVhQwLUwhS?=
 =?us-ascii?Q?GDS11/DU3KTxTDy/Cx7/N8E8qG76MhYjlh7q2wqB/AfwFl+Y0r1kW6E4XXWh?=
 =?us-ascii?Q?vVA9ZiWjRj3iekZOPhkAXN9hqBMAA6GmUx6kD0G7i+t3n1gAcjFI3LYz4f8i?=
 =?us-ascii?Q?KOEzLtPsGdqhZOx9SxS09rKaixjQ3DGqcveGDS0kBP75OxMz391ND7KZEBIo?=
 =?us-ascii?Q?acFhI1AU0iTI4gE0gF5QluCGjmxCwvb1IyDBrKuW2SU6Tyr3EtNonF3rD2TH?=
 =?us-ascii?Q?4SCemVEn63Rew+FrBiPDHfMkpobdm1mgp57x0uKSK4JrPZzHexFh8fREtG/8?=
 =?us-ascii?Q?UPoCFAte0M6Q0UVz7JY0u/ESysV3ChPqEi1CzlRrBoecWAdZWrBJrF3AJYsa?=
 =?us-ascii?Q?IxqYe3hedmauZJ81wVrYnKjxlHpVvP5oZISOqMgBoSSs2RYKzHd1OrEeX35T?=
 =?us-ascii?Q?xny1A4NfJckY5+HbXAtdL/I9YTGRi/nTZsRcshaaR6aVH0yKq9j7Bvk/LP1t?=
 =?us-ascii?Q?8kMrlwZMEQd9qh5Qmiy4j+j5H9riDguq5MNTiNlMcKNlG693EZF7/AAPqfmn?=
 =?us-ascii?Q?2C+h1uyxOk7l0YfCQJnUm4M=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd986606-e1a9-43f3-e2ba-08d99e00ab9b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 12:59:56.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1wq7s1oaIEEpZ9Z1chYkSma5G1p6gOXFhuBqu30LYLcXDRPMtCjeLpYUImcHiiZn4eshv5DVpbWksc1VWW7uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 01.11.2021 11:47, Andrew Cooper wrote:
> Hello,
>=20
> On ARM, the GIC is a hard prerequisite for VMs.
>=20
> I can't remember what the state of RISCV is, but IIRC there is still
> some debate over how interrupts are expected to work under virt.
>=20
> On x86, the story is very different.=C2=A0 PV have no hardware assistance=
,
> while HVM hardware assistance depends on hardware support.=C2=A0 Therefor=
e we
> want to introduce a new CDF flag so we can control the setting per
> domain, rather than globally as it is done now.
>=20
> This brings us to the question of what a suitable architecture name
> would be.
>=20
> Hardware Virtual Interrupts is a little too close to Hardware Virtual
> (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
> HAP) doesn't seem great either.
>=20
> Thoughts / ideas / suggestions?

As per the subject of your mail simply "hwint"? But, as Roger says, a
good name certainly depends on the scope of what exactly you want to
cover.

Jan


