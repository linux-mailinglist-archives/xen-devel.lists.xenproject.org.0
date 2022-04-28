Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C01512D30
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316061.534776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njykx-0000uK-GQ; Thu, 28 Apr 2022 07:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316061.534776; Thu, 28 Apr 2022 07:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njykx-0000s3-DB; Thu, 28 Apr 2022 07:40:07 +0000
Received: by outflank-mailman (input) for mailman id 316061;
 Thu, 28 Apr 2022 07:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njykw-0000jl-5v
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:40:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ac155c5-c6c6-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 09:40:04 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-ltkeR-PMN6S8zyg4oTtvVg-1; Thu, 28 Apr 2022 09:40:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8759.eurprd04.prod.outlook.com (2603:10a6:10:2e2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 07:39:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 07:39:58 +0000
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
X-Inumbo-ID: 6ac155c5-c6c6-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651131603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Odiby0lIs7X4yMFQcSfohiqhwYd8gHakN4kP6umWyoM=;
	b=CVGoEHL9OxZ0sg6103z3QvPw1L3D3F762lPSt5Hjc5G97EJxJa4S6JEPdlZCP7vMsS1p1M
	a6VQNuQMw0LAFuoW/7rMCvju1wKjgg4+KlY9VxP073DicpTqMPIG4UmRFNlDWQEnWbrLtY
	vW+hFRgfzgDfIKngnd3PjEI+4x71JkU=
X-MC-Unique: ltkeR-PMN6S8zyg4oTtvVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCqOu/kEb/lhnHRNfDdicFYe/vlwC2dXuoiu8+NtkhOrzrgFsNOYdu+TyMpjR1RYPj1dAvbu9GRcd888VLHEg26v3m/DVXNv5nMbDAUp1CeiOfHu5qssWffyocg3pP0yiK+Cz5s2x4vt1Z+TMRlu/Mwh89MO3LBFTJe//C85PFa/yGuecXP96z5QzaptUDA2h1URGVJ9Ogn3rBF5yAoSSjxWcAtnLxBVBIKKqZ9DPjVbhfu5UlaUTYtGgCLjl5eNrEdPByD2Ras49o5TUixI5vA/PnyQpsZamfItqi5wYRK86+NwfptFnF4VOfDlBYR3CgUmzeZJ429OCkQwRk81JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aooAZuzOsOb9Y9yf3pU6UWpZIsTsKdMGT5uy357NJyA=;
 b=l2k81vm7qnoKk7lp22bW0Q/BJIYwCOhRbffxivtsrvBGaE5qHQfRCodry/WBe7ptGzADPr/zU6V2wTdk1qIDHvFVSyJX7t2y6Ek9hCrnEtZ31MTJpBoyYYPo3BDP5XmIWCooyOmjRlsfT+zVKRGe0CM6pS+478jTdfDdxn2tjKOIEOLFzMWSVs69JEVjvHXu3u9zy8Kr6hwTwtYO5ichNf9TUqGN/4wA6D1F60jXpq72wHgERZ1z2GLGugg5JUdw6jSwIKrh+itb+oXXjVyT7KW8byST2MzsUpMYaSpvF9PgdxjLrDenLzYLHvwzUTA0uezP5YdnMElSaY5jOnJDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7835a3c3-7f27-fde1-87e7-bde558d9fefa@suse.com>
Date: Thu, 28 Apr 2022 09:39:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Regression with CET: [PATCH v1] x86/mm: avoid inadvertently
 degrading a TLB flush to local only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: David Vrabel <dvrabel@cantab.net>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220419150320.64783-1-dvrabel@cantab.net>
 <6076f458-a56f-448b-2001-6af38b998edb@citrix.com>
 <b5234297-c70c-ffc8-9104-99eb6f5a0e24@cantab.net>
 <aaa32800-bcad-3a7d-34a3-2e51c4ad9aa1@suse.com>
In-Reply-To: <aaa32800-bcad-3a7d-34a3-2e51c4ad9aa1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0068.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a25f533c-cf64-4011-9cb1-08da28ea4bce
X-MS-TrafficTypeDiagnostic: DU2PR04MB8759:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB87597E44F8A33DA6A491D144B3FD9@DU2PR04MB8759.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5zhDudwzPsBClBUHrv8cOrd0Uzf7pr1RLuGajT1dJJmOg9YwKLZrc6yEwhkYajWFgmJMMl+h0PPLQfMWDRmPl+qyGxaWFD5uQlfSFTHq5BYcH37Z2F+qzHqx5bXImBZZbdiHwucmUYWbezWG5rg4RrmJg1+q55khNul59tzQyInInQFTF3FDUgm83HaVCfIU2YXUrk+BPvT0NCCA5hQbMALpEyJcnjhTH7ZmQuR4WTE+d9gFeBo1nFZWkGM+XuGk8ZQdywkuKue5VlYffTn2aRgXgmkF/C6JEJ4doCrYydklZ8998/0mJn0mcKRIDl/7rVgQLvL03nJGpEeBL2IC+SmK2XQ2do/pp9bPuDMbvAdRkB2gcj72K8OtRCf3/cAe/C2ippACNkmSjiR5gJbd0ZaRAJy6fS/1tfA9n24FOuyfPOKTrWVHvYRCeiMJuuEce/DSBLO6SW87COOgmJOvFbJgwji0dC9Y9nAgSMn1rYTxG84bA05qHAXepDbIQ+mII1D+bjFjp6RiIO9AIx8gDJ19+6Aq3aib3FtH11WtXSbZCmX0E3t39K5ayK5LRBNI6rUpn9aXtPaChooSYWryRaLEX87qpZDTnG4C9CsSysgy6RLC4qlGvwMRmQX92kI1+2GM7xsqDFV0rRH7rr1Yt9t84KchGcpxfQQYRd8OkptLY1cPNIzk/0DPe43bZgzfuytAnYyPdQ7I6JA6BkKGE41AjLp4/qVlSkvo/KG2Cnt+uD3Yz3dzx449OAogyGHo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(186003)(2616005)(31696002)(26005)(6512007)(8936002)(6506007)(5660300002)(53546011)(36756003)(54906003)(6486002)(6916009)(2906002)(31686004)(316002)(4326008)(66556008)(508600001)(8676002)(66946007)(66476007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C9gxYsYsMGQYP4nDF3KudzNemN482zO8GOHnPHX7cZHfjt6kRJ0eMedXhkCM?=
 =?us-ascii?Q?uBKjQiOe0KTINCHfdhVdRXPwQCBb3H9HsxnLn6ydMGbnus0EA2Lp4RFbe7U1?=
 =?us-ascii?Q?O+8eob074sIm21kD2knBM+FvOr/udCkzRhq7l+VGH721Y9EKKozbfPHZe8vz?=
 =?us-ascii?Q?JUs1UcEnjh1/qcugdydjHDXIQhTRyXSLMuJ58TfBHA5x2sVfzV+FwXcd6+YY?=
 =?us-ascii?Q?FFlPtslmWYfZ8zw6rTbyHhsQaO5nby4Vu1reJ3NnK2/5Vxq4nAg1DUMlRmOS?=
 =?us-ascii?Q?Xb7REiJjIoc7bkdduBE4IMESL85B1aNUY4C8pBV7xR3DznSUBFm2zlKe7ti8?=
 =?us-ascii?Q?+q3r/ebwuTiv/P673bxnLA/FmD5evyiVG6CX7T4/30QvNRLx2Zwh7ZKKlPdH?=
 =?us-ascii?Q?iLZzTUNMyO0bK+uwfuVNWwhuZoQT0JL0fXQXnipgq7QMa0Mqc07T5aV77c79?=
 =?us-ascii?Q?cZE6h1d/cSDZri8CLYW3H02CRVXtPNoEAWpIXnL/8uQit8cJHCpw3GDe9hOT?=
 =?us-ascii?Q?j68X0BhcfuzAD72P2+q4AphHaSF0BFEXP8NTl/WvmTINFyt5hCsBnliQRv4F?=
 =?us-ascii?Q?jkTRo2ikqwCC95AAiKOpYBqU0DrtNaw5jvF4FI4GY1csEZckmoHazG6kGlrS?=
 =?us-ascii?Q?A6naJapcT/wcDqCiUGwOe8RJXitvbc+2xkH9/O60GDbLLmUoA5HrBvW/zCHc?=
 =?us-ascii?Q?FbY441AIPcYowNL11xvUv55kcrUOedlRHS/4Jv2wTolgXzN8yDWumBQASsx8?=
 =?us-ascii?Q?7vknO4iHUGEakv84D9bKgeP6SVh3tUTTEoeiLi7QT00A1PLeQw3TTZsHFJzh?=
 =?us-ascii?Q?8JLyB6f+tCX1jL4EbZM+6ZYeg4+qGKiu/Y4VrTq6mwcXGX32iEU9nzLGwIzO?=
 =?us-ascii?Q?KyubNvcf+z4cFzX2C3VZVexnfgvSz6Nsp2g7alcQTstABO9vgdvj2ewema56?=
 =?us-ascii?Q?IHs8HSpUJ8KAriiLKka1jM6UjUVpfBiEvwLvuqSwwVr4kZO12Y2kaMEvwuEk?=
 =?us-ascii?Q?rOothG4PzY3f/Hew5/S446bPkqueDp5MGVmhqv2cJ3dtpJOgUUbiPjeZNx/e?=
 =?us-ascii?Q?+7MsrTNkLw7XZqgtFVGnkcXhgS1IVwUCMp4FYcMkY9usgWTMb9xTvZvIWi2c?=
 =?us-ascii?Q?K7JgGAoTAKhhQYwdH4xz8axfhF+ckQPNac+sZqXgE7/X1WY5imd4jCZ+kOO2?=
 =?us-ascii?Q?nM3MGhx8tkCFpO6PyEL3jPmyqLSISj9cMT6pLZbsiNj4+pKZZzoZcCINS2xJ?=
 =?us-ascii?Q?qgdliWkO6oBmeR2I/O9BtaGQBfOT+RqCFM+b1ht9PzCExIKZGyh1DQeeZKj4?=
 =?us-ascii?Q?emDZDU+4bckzhcaY9ITOFrhxItrTdwjg6ef7ycmnd1q7uqRcav9eoDb+TKNe?=
 =?us-ascii?Q?RAW56vWAO9CytwgG5Di7y3+NKCjOy+sYIsYBoHrSB5mGFZyKxqP7G8Vi7tKe?=
 =?us-ascii?Q?cG7SR/OWyy/0ERYqyw4WxuOezzu0B5wGQQY5RBygKDlI6sU6MrIw1Ga+jJMj?=
 =?us-ascii?Q?9QiLw/MT1XjHIBnBYA1sjL9ZFv4YvuyE48YImwHCDFDneCHvSYJxZstT0yEr?=
 =?us-ascii?Q?9hBuHRf1MUUky3RYX0WmTKHy28wV4DdUPRThkpoBbrBkMVeBmLjJlMKoL7lT?=
 =?us-ascii?Q?VGyeM5HlAsXFDagJVNCRSOZz1McGUbGY2bFhbV75j8aOMg/1gyp8lF5+MwDo?=
 =?us-ascii?Q?LJizxvpresTc8rMCjOYQuvSLtLMXFiNgZau1BmScwHZ7WdahfFbCcwh+Asgi?=
 =?us-ascii?Q?dMfC1G+yUg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25f533c-cf64-4011-9cb1-08da28ea4bce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 07:39:58.7198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPXDojlcuSaoniUPcvoBDIRBfvfqSVCDxTZhoBE35V8MFV127AEyBgFDL9gxmvlLj3ekvffcrhSNwQkgYYmwmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8759

On 28.04.2022 09:37, Jan Beulich wrote:
> On 27.04.2022 20:44, David Vrabel wrote:
>>
>>
>> On 27/04/2022 19:03, Andrew Cooper wrote:
>>> On 19/04/2022 16:03, David Vrabel wrote:
>>>> From: David Vrabel <dvrabel@amazon.co.uk>
>>>>
>>>> If the direct map is incorrectly modified with interrupts disabled,
>>>> the required TLB flushes are degraded to flushing the local CPU only.
>>>>
>>>> This could lead to very hard to diagnose problems as different CPUs wi=
ll
>>>> end up with different views of memory. Although, no such issues have y=
et
>>>> been identified.
>>>>
>>>> Change the check in the flush_area() macro to look at system_state
>>>> instead. This defers the switch from local to all later in the boot
>>>> (see xen/arch/x86/setup.c:__start_xen()). This is fine because
>>>> additional PCPUs are not brought up until after the system state is
>>>> SYS_STATE_smp_boot.
>>>>
>>>> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
>>>
>>> This explodes on CET systems:
>>>
>>> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
>>> (XEN) ----[ Xen-4.17.0-10.24-d=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Not t=
ainted ]----
>>> (XEN) CPU:=C2=A0=C2=A0=C2=A0 0
>>> (XEN) RIP:=C2=A0=C2=A0=C2=A0 e008:[<ffff82d040345300>] flush_area_mask+=
0x40/0x13e
>>> <snip>
>>> (XEN) Xen call trace:
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040345300>] R flush_area_mask+0x40/0x1=
3e
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040338a40>] F modify_xen_mappings+0xc5=
/0x958
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0404474f9>] F
>>> arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0404476cc>] F alternative_branches+0xf=
/0x12
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x277=
6
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040203344>] F __high_start+0x94/0xa0
>>> (XEN)
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
>>> (XEN) ****************************************
>>> (XEN)
>>>
>>> We really did want a local-only flush here, because we specifically
>>> intended to make self-modifying changes before bringing secondary CPUs =
up.
>>
>> I think the transition to SYS_STATE_smp_boot system state should be=20
>> later. i.e., the last point were only 1 PCPU is guaranteed.
>=20
> I'm not sure there isn't code which assumes pre-SMP initcalls to happen
> in this state already. So it may take addition of yet another state if
> no other solution can be found.

Or maybe this again shouldn't be using system_state but num_online_cpus()?

Jan


