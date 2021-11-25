Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED6E45D90C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230981.399325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCl6-0005UA-Og; Thu, 25 Nov 2021 11:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230981.399325; Thu, 25 Nov 2021 11:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCl6-0005S3-Le; Thu, 25 Nov 2021 11:17:44 +0000
Received: by outflank-mailman (input) for mailman id 230981;
 Thu, 25 Nov 2021 11:17:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqCl4-0005Rx-OY
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:17:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cbfeb9a-4de1-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 12:17:39 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-CcKZXh0vOIenmyBxLZ0Erg-1; Thu, 25 Nov 2021 12:17:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 11:17:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 11:17:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0002.eurprd05.prod.outlook.com (2603:10a6:203:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 11:17:33 +0000
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
X-Inumbo-ID: 4cbfeb9a-4de1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637839059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3LBUQf/auwUIDfWkFkF3keE2tlU9A8h0sZ4WqeeE/lA=;
	b=jHbSTeb66vIByKDaHNE0uQDSkKaVyx01qUtVkKRAbmqowqoUXY04GJKNsl+a0ut8+sGuxX
	VNK0PvTj3pVz+esZlJUaL+LGsefqwfc/mOOphTg3NCAN3FIdikuk1L8g/0QC3U8WRR5DxS
	bHh8EH0e52/FRhEWwdxYH1zGjXcc43E=
X-MC-Unique: CcKZXh0vOIenmyBxLZ0Erg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arRo3PNlcgAi42hDkJqzspaT1e5dXUnMhUaXH79f9RBzch4Fg+xGRajtZU0a7TY3SNyuvc8y9mANvbzXcR7DEFbZKYvrlL1GDmg5j7E3Anomiay7fOWa3UDq9ErjchuRXotIfRgR4ibTe1GgNIqbZOfwr3kfdeght0nPk4r0qkIp/5uKHsGpu+Zao2dp2XIge1z2VH4+8A4z5RttdoiKhY0eggKOnTr9cOL/QfvtkuSanA+r823nKR3NS3O7xYw0yZvmehAr/IVDyxXQ7fgav1ovPVEdN+Woxb8RLRrX9L/E9GQuWLHoOBKObE6C7ctqwVrL2qw/UpxFrhof5NkPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qzn/kpt33PAZbQW8/une7kjGEoccxWfuA7ZBjT4d4S4=;
 b=FQHnseizwoM7101g8VUtQjDiA+wx3Yem11ofxVmrG1nXf7hEYmuICoQBHvoz2qCAU3KD28CnPCY+duklpt7Ys68yyHt14ADjFaFcmpLv6el1eA2O5dXvIzdMKmHAJIHNTbKOBbjWb3C/EBOc+3FB6o9zOg6qJ8Up9w8FnSQqeEMY/Njr0z7ASTTvAD0HyZixAbm9r1uezkTeZp+MdAvtsM1Ujd/j2ISoaC5kgVZBu3dQPb/NzhaKPeRej7Rs98mqogDY+kDdPgs1+7yP5qzZOYM9iS/Lx09vQ+XFVLNmNpiS75hyh4Hser22sJMLkq+LMFrschFTm5ChNG7vssSRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <892d6148-e98f-def2-121b-922f1215a442@suse.com>
Date: Thu, 25 Nov 2021 12:17:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-15-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125110251.2877218-15-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0002.eurprd05.prod.outlook.com
 (2603:10a6:203:91::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f22a0d78-6b05-4690-5da7-08d9b0052e39
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB484770EC687E65461DD6ADF9B3629@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uf7Ec/I+7oKzi75LD+WvkKWscX9nBzU6sleHFL0qcuw9mhK02njtM+ecb/GIMzXpT7mVMWYsagGbr4nU9wdYOygK1VKEB88zgz6GNposW59+xLuZc1CKIbrM9L//4dJvKLq9WYHnoi9X7PuX6DdFJeipOCe+6sTU3yaAETVRJ2PNAUpt2Lpz0mqmVJZZ2anD9SEd7FRIUmOi8eVn4i4geikrx/KMSX/ToLVot4Vc/CBbr8UF5wjiMcDWzJhs7/+zs8MzqaLFcC4JvL3JITqWnBsh1HtXD9rgzqQc51g62MpJ33q7Oj5IxkoW8OjjTdDMoVQriQuInA6nAjH6k9zrHHmsjqIXTCY6pYjyJt+Vtcqs5ejHSv8n8X0q8fuiuO6QjzBaI4Jf4zAK8vk2x4i4lwCmGNL/F4awFkDr3drPpP98BR28EbnvyA/t+RVhAJZxs0j/N0PKIwsQGLQA3UBMprGRk++mHCiY2yJE1k53IwUH33Mz0UKFquygqUPr8vuaMuWouFkIueaTScd17m0w2Pg5xtucK7No/rdNvza9Grsfd9R1q0pfmCyttapmYZLuVuMbFvhxk79fDgmEhifxPePD0JqbCLcihR+4M53847hEqjuetER6t7pKblHsv406ppgMHFPRV1Ugu0Q45LJmQXbxCWW57B4BAikpC/vBAreb9+zWszyQwcESTU7vW1CauY/UI6ocXkmevMM0UysKad6AVo1tNE6U95HnwLpDPRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(83380400001)(66556008)(66476007)(6916009)(316002)(31696002)(956004)(508600001)(186003)(2906002)(4326008)(66946007)(8936002)(2616005)(36756003)(6486002)(26005)(53546011)(7416002)(5660300002)(86362001)(8676002)(16576012)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EV5hXPQNSMEXUwxPYhsDUrQ+aB6qNsh8KVNupETZoASwHQ7qsCiOZgHyXAHg?=
 =?us-ascii?Q?HGnKeDfgTK/cjlQSFCuLrudGrPyAn0b5RvWyTaA55dkjOK09xlvtpuwWJlgK?=
 =?us-ascii?Q?mg7w0Lj6wjhThs4odrf0KzbYljRrikbQ9gCZO2Oho+EXyv4TlrRP2NXuGk5D?=
 =?us-ascii?Q?JVU7S/cEiNC3tweBcCQMCBrPIxokCh+6Hb4PwExl2tVa9Wh8+2Z7EmiZcCLE?=
 =?us-ascii?Q?Dn4fu1j6EhsrR4adPPUelMGSKtPdKCznPuLds+xuAhf3vXrJNhqg8reliCkv?=
 =?us-ascii?Q?O4t/X/UVvXQ5nHjGX+jw5lhXpbv8DOz3md69ZpPIrYUs9l4KuWsnkSl06kVd?=
 =?us-ascii?Q?gD3OUEBIwVWlFm5fOVoDWkVGZLx/D1PmMo7C+462IojFItR3RN0LlaN/3ZXt?=
 =?us-ascii?Q?0jDG2qGmtAmI+79DLKKTMRJec37Ps7QmlGYXzlEvkZx6Eb17F+MZxYqLTaDS?=
 =?us-ascii?Q?UYUX5In3c7uh3KmklYeXgvN/PbAiafvWLGa0hmLqSEJVH+9kdJu8LAfeNXd9?=
 =?us-ascii?Q?pfCA1yRbnfS6CW6SKXo/TSbFQKBTUeM+LLoG1E6K8tHAGoHkAkoltauoywne?=
 =?us-ascii?Q?yLuSclwj9vE5/fQFRoQF6JZCxFh5HFl1RfRDUl+P5Ef/Rh+rCONf5l907Z6T?=
 =?us-ascii?Q?u6GiqqbOAu1B/AifVWTXRTD9YKrEAgerTvPAry1EwfKGOUPPaL+7Kq5Hq8j3?=
 =?us-ascii?Q?UQaM8vd9cXk0WXSnfVbFFp0F7vvloDhaGCzdn4Ox4vPppY7Rae1NsN2R2MKh?=
 =?us-ascii?Q?WFjMohUL42fDn9czmu7/7mWVcUdpUAiB2hzrd/iBGx7XJLm3PCx86pNuaujE?=
 =?us-ascii?Q?FFWgeLYUUFiKfriI6avhprSGKqxtFCZG0/uZi6tpozb+ETKuhJquPKCura8q?=
 =?us-ascii?Q?29QcjQLRMPlmDEXmD9EmcO1SJVsLwsuLBy9Fbyd2le1ao7pYAcbWIkjIRcPg?=
 =?us-ascii?Q?ohFFRVj+z2dfrGSCCrT9w1w21O2c104mBhZGnhdb5Vb3c7+3T6tVYSqYP+T9?=
 =?us-ascii?Q?wd1fHsUjvYGPMB4GWArV7m7TCh5PEsEdxDjZ05yj+/gnf+iXVWmSZEyFMZbw?=
 =?us-ascii?Q?sbii6jPhxJbCsL2+C7jqLuZjxciA52jyLsMCU+biCb0lDd8hi/4vnsnzV2ht?=
 =?us-ascii?Q?PCeeFIw0QWT27ONUeiTAsKTz/w7KLT8jRZyLw8c0TlcSgvh8rVPWFmonuBFz?=
 =?us-ascii?Q?9JLHP9LKVOwK6XUTBTB75gviyuLD/0xHwXtbSdvFqxX9P3J+0pDfdKt2sKzY?=
 =?us-ascii?Q?s7ULGcHr5QeRA9u2Gx1S8r/GYA0pa1UwSRENHwjz0fwK119Gt44q0L/91tza?=
 =?us-ascii?Q?hOmT5vxTvaJ5glRrV3BAY6uSgiy9WRWmp3kKrL4MQa0S8GSUOaZNJvOZ5BaU?=
 =?us-ascii?Q?obbBuy8Se1WZQVOuXDDYF7IVfDp0vKPZaFqKGDR4lQ/7EXZ0YPgLznCfXJzQ?=
 =?us-ascii?Q?vJGjo1TucWxCGYpQiDc0ZwFICHwF/9P949NzA4rseRLYA8kyIjuLZ8SvDTZW?=
 =?us-ascii?Q?2xZRyKmQunp0+j/GmE58xEKzh6RsD3R5skiLLargYvcP22FRJwea7vGd5t5v?=
 =?us-ascii?Q?AhrPoTpF8EazzJNc5fIJpre77w7ql0HE5uvm2hjw5jYfIdYzJdgdgJIoNdLd?=
 =?us-ascii?Q?oSxiaokEGZH67LfU379iINc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22a0d78-6b05-4690-5da7-08d9b0052e39
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 11:17:34.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkL//W7v8EcOuMHB8/6ZCsr6ntoee88cPY91OwyG5FgVJ8WXePYjo5j8G7YqG+eTykV0wVBY9NZOZHjefdo56Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> For unprivileged guests vpci_{read|write} need to be re-worked
> to not passthrough accesses to the registers not explicitly handled
> by the corresponding vPCI handlers: without fixing that passthrough
> to guests is completely unsafe as Xen allows them full access to
> the registers.
>=20
> Xen needs to be sure that every register a guest accesses is not
> going to cause the system to malfunction, so Xen needs to keep a
> list of the registers it is safe for a guest to access.
>=20
> For example, we should only expose the PCI capabilities that we know
> are safe for a guest to use, i.e.: MSI and MSI-X initially.
> The rest of the capabilities should be blocked from guest access,
> unless we audit them and declare safe for a guest to access.
>=20
> As a reference we might want to look at the approach currently used
> by QEMU in order to do PCI passthrough. A very limited set of PCI
> capabilities known to be safe for untrusted access are exposed to the
> guest and registers need to be explicitly handled or else access is
> rejected. Xen needs a fairly similar model in vPCI or else none of
> this will be safe for unprivileged access.
>=20
> Add the corresponding TODO comment to highlight there is a problem that
> needs to be fixed.
>=20
> Suggested-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Looks okay to me in principle, but imo needs to come earlier in the
series, before things actually get exposed to DomU-s.

Jan


