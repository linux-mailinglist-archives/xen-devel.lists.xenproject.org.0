Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC84D5C53
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 08:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288797.489831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZkK-00084Y-Ra; Fri, 11 Mar 2022 07:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288797.489831; Fri, 11 Mar 2022 07:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZkK-00082G-NL; Fri, 11 Mar 2022 07:31:32 +0000
Received: by outflank-mailman (input) for mailman id 288797;
 Fri, 11 Mar 2022 07:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSZkJ-00082A-6x
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 07:31:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44278901-a10d-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 08:31:29 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-26mGd1CpOROmDQlDwSCbfQ-1; Fri, 11 Mar 2022 08:31:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4254.eurprd04.prod.outlook.com (2603:10a6:803:4c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 07:31:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 07:31:25 +0000
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
X-Inumbo-ID: 44278901-a10d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646983889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4zkjxkVZiYDgmPmUWX5tjEAvsyz1m61cvfXGo4002w=;
	b=URGk/0oDj5/rIhzJbSWvAyD3EUnPhi9iP1OvaRrLKq5JG9Jrb7Lr6KzXs6avxdBtLAvi0O
	+MDy6U5r9+oE1mSxxM1+Hg10nEsTCGO94HL4ot59+jVcRTQOTtMd3Gt6ivAyatSL9rrif6
	+iaoihYWmVxoWsGz5RmSDE2gW4pBZso=
X-MC-Unique: 26mGd1CpOROmDQlDwSCbfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYnSGWBQbCmd3stf5f/+06Uq3KTVpARI9k3W9dRvkeDBV65TZMdbNSpVMt34AVd6sYME3rqluYLZDZC97B5PMDuT3bH01W1aLN4k3D/OQALrXKPpQqwNyh39JGcj+pPsdnrABfq0CshrgHMqInY8uI7bh0bFvkwrJFyNEPtp/yHvf++0xGgMDW05ivXk90pGwz8B4xlYtdraNPugPzn4U6Y1011bNxP4lXBT0ITymXnsMFqSqF5VVTJpt9SVn4+TVbs2E2m7nggKm4seJlXiGXJoFlNzQh7rcYxzhS0s9kSPTULf5r5d8Cs+N7gdoYWIXAUkIFUNDxq8Jh1mw+JdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wloZl1mLIM3AW+cXBMeY1xnluT4vQZGey+5pgRQ9lME=;
 b=XN5zaBkV7Wu1SJJXm9ROVw1uZo98noNOySsGacGFPT+JncbRwFzitS3ijzVSShEtlglXSBmyFn0UQOGAotLZ9aTF1z/e6TLdpLO+TNNrzu4hMt6opADDX+W8jehmTZTnU5BMIZRvlM8GbVqYUvRTlfCfVkzjqcVv9+aEcjwb3tb4Ozib9wWC6WERDmhYfN4R1FAx0bWFFY2G3dDoBiODBu4OYVUwUCMyfYZ3P0s4a9gQ2FPZC46WVG5JGLzGy3n85YMmEeUFUY4CQ4dxkC76Q48TZPUmQi7vqr8TXNEGi8BxVZHgGmGdb0sCvby+8RkriFH/B5obErpWVIhVxKW0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d54a2875-b170-3d38-b025-1654d8c61203@suse.com>
Date: Fri, 11 Mar 2022 08:31:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220201164651.6369-1-roger.pau@citrix.com>
 <20220201164651.6369-3-roger.pau@citrix.com>
 <ea9c7232-a98b-7fb4-a151-0c1e3ce1e1db@suse.com>
 <YioqL+CcQHiwyRwi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YioqL+CcQHiwyRwi@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d11d13a-7330-4e91-02b5-08da0331264e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4254:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB425412D34ABAEFB774C6C440B30C9@VI1PR04MB4254.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x9St86cgo1QqnwVyXGNjvhc3235A1cV5ebrfEtijyRhTJMFPJjZY3ol+z4L/Mh/kdKqRRZR4Q7lxb9LNdPB/NZFrOXPMcZuWlbbD0MpN1Om/nc2GzKviqvTpYa2w7hz/OIRsLpzdVVqd+fMtJLZA0VDJrLD+6Cw7PcRfiFRe4xrHyOERlT06fNJ3W9UozflWA77qVXCa1NQe+XsTctOow1Sa6Dnw80FtIb6MzLsOrDXdGZVgkcRyquUhRrhb/BurbZzcaG+S26plOJUlEQF/Ru9Ai1SOIzZPRJymbWNsUTJxoq88pmnwlOv5O59H/sD0NvQETf6cu51vodvoWqAqoAAqPTY976gSJJMTGG342BTlDUaMr960bySl01oWaAvPaNou5TPPaPQznyu+Lqxpymd3Mn6CSJ7ZUmdz3TnDQlI4HwrzddAe3ZnDag5CjElPKzfrwDG5P1Gu52w9/qm5036/2fXkV/FkoUkfeNGSTnfRYLTif7Sbqia8h6PMpV+QRoLf/6vgCIe8yRdmnbwdQMpU74TbLaUGRl3eGBy1ckfbqqD6rSj/ESAHepMLEuK4VNZJ2x0eORNHx+YVmAhbekk6iYeDangsKXkqTV5tcTU71GW9Xi59M2IYGpACg3S1mHimMQcD1Ob6prum6pCvJmJQhcVSFJ7OWnu7LIDMLB+MF5kdGXk4dvygP6hUfedJxctyT+jhUAJfhJaaiyyzWfjcHohzVNK7cCpypb8+ox9OrOkEQXl9byrWJxVCOPUV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(53546011)(2616005)(2906002)(6512007)(6506007)(8936002)(54906003)(6486002)(6916009)(316002)(31696002)(36756003)(4326008)(86362001)(508600001)(8676002)(66476007)(66946007)(66556008)(31686004)(83380400001)(38100700002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?22PFKPB7oBElNXpciEEF0XiYe+8hyhy+M7rKA8NEMWk0Le+l018Il1/+cm1Z?=
 =?us-ascii?Q?VoS4XXv/TcOBknYOLdb8wsI/ceNrhO+nVnGLoJbQRS1kWwXfw2n5Z5a6Fgb4?=
 =?us-ascii?Q?YIlEKyGhSXuYnHsJxBppgcbpVnv13dWnvT6GU3Cd6LP3k73sr9XMle1zX6p8?=
 =?us-ascii?Q?EMwyzf1iBz9CgYVLkW3XtXOv/UlEZFgf77bYEryFlEn7gELya2OqPGsR5sIJ?=
 =?us-ascii?Q?CWD3U4zmyM/bYPHH+5RCYcS/vZASCYdHQ8moiLyO0IqoDK1yAZXdsniiof5H?=
 =?us-ascii?Q?XvLHMyqw6UgbrL84neBI1xIUBQQN3MUUi07+L8alqA1J9/RqmnPESXVyWB9M?=
 =?us-ascii?Q?v/2BX45Ebt5eYMpeVXB2L3Z4sqmoEhp+MlyZL4EF8jzNYTozqBDs37GZ9fJG?=
 =?us-ascii?Q?uPhsQPomN5v0edaGY+6LWtuk8o0amtZiCKHSPM6iCDpGO5KOVO2VVWZbP1BK?=
 =?us-ascii?Q?gDdaTDWJGe0dw0q6ffP03unAdE2aJlekxchLvWIOAof3n+401Er0OiSwItcA?=
 =?us-ascii?Q?Yip6gRcxb0DqORRU5UFHYBs5jeZi9ndaKiMkNDFTdZkmWOyl84RCjpnQOiBu?=
 =?us-ascii?Q?dcCVEzEeIcqgZwxTbT1y1M6laRV/tHOw1Jzo8tSPbzrdvmYIJGJn3RezqmGP?=
 =?us-ascii?Q?T8A4TCeldp1jHPOX42I/xlGkowLRs04NhhfTBK3JdQ2A2vXHCZy1stuuKOB6?=
 =?us-ascii?Q?HhknIgK2HEH+QXKKehGvRM6rQH12Yi51N3TchDznsT5t7dJKl7djVt6FVcjP?=
 =?us-ascii?Q?MUUMksxYxnuUgMPKpXk2Jedkbgpq/QBy4z4OFqMezGlwvI1X3eOVZr5Arovo?=
 =?us-ascii?Q?CA5bUCr/RJHTZH3fH6RV7bhNYXMEoPDb/AJxedrkGcgPlO9T8qDp2KQxqkUJ?=
 =?us-ascii?Q?eZPQPkri9gIc/XJ0WXKkOXwdkHGCzPF0i86C7Y7AFEeQXj0sEyLLyPZs53ZP?=
 =?us-ascii?Q?h+qOhndLmv40hOSVwgKmwkmsRZoBkByhlHBwNRPARCu0fDdw0Mi9D4sZ3g8b?=
 =?us-ascii?Q?XEbBi8oPdrvFQnpzVQ4TjjhK6y+b1D1FjhjtPxJbGbOQOtqhMa0KoS/UOoPU?=
 =?us-ascii?Q?E91aN13CPucxq/211W64YqRiYryN3AMPG1zK2tVrS7Nx3tzhEu13HvsfFRmG?=
 =?us-ascii?Q?cRq1JrEWCXfeCw1XNKsM1Fp05dSL4pHp8BkSnZFuDeppuy0/h47ZCJb1reoQ?=
 =?us-ascii?Q?SaaDF9w/raYtMlYz7sEsNvC8TvsLhEsaEcWhj9nmeAqrkru76jqIhpWz6UQN?=
 =?us-ascii?Q?za/DMvSK/vpbMebhuAE+FlrUCgLy5C7qyXAr9cdkJp3+0EsKFCD7wkKJ2aGq?=
 =?us-ascii?Q?dhczEe9B7NyP+zl+5zH4wuGQwvrr9YtSU5hR5n1fHH6OBkqSGzbj95EN9yk0?=
 =?us-ascii?Q?tyb9ApN/uMY5U3PIRx5L1mZ2k2e7+j4MpqmDD57o/5xyapFENc/2X2jh6JUR?=
 =?us-ascii?Q?eyM654M/PS869mrGpOqgDZla38Prlvrk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d11d13a-7330-4e91-02b5-08da0331264e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 07:31:25.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmmGK9PC24fygYsUv9ZF0pjBeqUcUJ3qBw547zU4V7ZNode8u3dcSwaP77sA2Kfz8ga3AgJoJDSXWGDHu4ZFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4254

On 10.03.2022 17:41, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 14, 2022 at 05:02:52PM +0100, Jan Beulich wrote:
>> On 01.02.2022 17:46, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/svm/entry.S
>>> +++ b/xen/arch/x86/hvm/svm/entry.S
>>> @@ -71,7 +71,9 @@ __UNLIKELY_END(nsvm_hap)
>>>              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
>>>  1:          /* No Spectre v1 concerns.  Execution will hit VMRUN immin=
ently. */
>>>          .endm
>>> -        ALTERNATIVE "", svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>> +        ALTERNATIVE_2 "", STR(call vmentry_virt_spec_ctrl), \
>>
>> I'm afraid this violates the "ret" part of the warning a few lines up,
>> while ...
>>
>>> +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
>>> +                      svm_vmentry_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>> =20
>>>          pop  %r15
>>>          pop  %r14
>>> @@ -111,7 +113,9 @@ __UNLIKELY_END(nsvm_hap)
>>>              wrmsr
>>>              mov    %al, CPUINFO_last_spec_ctrl(%rsp)
>>>          .endm
>>> -        ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>> +        ALTERNATIVE_2 "", STR(call vmexit_virt_spec_ctrl), \
>>
>> ... this violates ...
>>
>>> +                          X86_FEATURE_VIRT_SC_MSR_HVM, \
>>> +                      svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>>>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this poin=
t. */
>>
>> ... the "ret" part of this warning.
>=20
> Hm, so while I could load VIRT_SPEC_CTRL easily from assembly, loading
> of the legacy non-architectural setting of SSBD for Fam18h and earlier
> it's likely not doable from assembly.
>=20
> Since those helpers would only set SSBD, isn't it fine to execute a
> `ret` after either having set or clear SSBD?
>=20
> AFAICT the requirement would be to either have loaded SPEC_CTRL first
> (if present) in the VM exit path, or to set SSBD before setting
> SPEC_CTRL in the VM entry path.

Yes, setting SSBD with SPEC_CTRL already / still set ought to be fine.

>> Furthermore, opposite to what the change to amd_init_ssbd() suggests,
>> the ordering of the alternatives here means you prefer SPEC_CTRL over
>> VIRT_SPEC_CTRL; see the comment near the top of _apply_alternatives().
>> Unless I've missed logic guaranteeing that both of the keyed to
>> features can't be active at the same time.
>=20
> Xen itself will only use a single one (either SPEC_CTRL.SSBD or
> VIRT_SPEC_CTRL.SSBD) in order to implement support on behalf of the
> guest. amd_init_ssbd already prefer to use SPEC_CTRL.SSBD over
> VIRT_SPEC_CTRL.SSBD when both are available, so we aim to do the same
> here.

Hmm, I can't see the change to init_speculation_mitigations()
guaranteeing that at most one of the two would be enabled.

> I think part of the confusion steams from using info->{last_spec_ctrl,
> xen_spec_ctrl} even when SPEC_CTRL MSR is not used by Xen, I need to
> clarify this somehow, maybe by not using those fields in the first
> place.

I don't think this matters for this particular aspect of my reply.
It was possibly causing some confusion to me, but elsewhere.

Jan


