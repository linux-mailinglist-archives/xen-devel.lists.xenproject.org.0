Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185844B9EA3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274696.470259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKf1v-0003nk-4i; Thu, 17 Feb 2022 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274696.470259; Thu, 17 Feb 2022 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKf1v-0003ks-1k; Thu, 17 Feb 2022 11:32:59 +0000
Received: by outflank-mailman (input) for mailman id 274696;
 Thu, 17 Feb 2022 11:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKf1t-0003km-OI
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:32:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e69cca-8fe5-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 12:32:56 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-TNl0pBOONhi79z-fqIFinw-1; Thu, 17 Feb 2022 12:32:54 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6052.eurprd04.prod.outlook.com (2603:10a6:208:142::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 11:32:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:32:52 +0000
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
X-Inumbo-ID: 59e69cca-8fe5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645097575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vh7KOYva6Ba093wY9CUMgReHNFbDuL2OEmcxgRhWDOo=;
	b=QuBn0Z8SaGhuiY0JF7eB8cc9QslKp611pWMOql/8OLuEXBuEYbm00rFPhR4l25H3Af/Rgq
	L1P5JGD7ru8Av5M3lN0KZmogWp/NLl0+tKKI2M89jda8wIQZjLAC9doPT1djwdthGN+6wK
	UlCS9YQ5QRcwnQWqHnRL34k4DGiLT2Y=
X-MC-Unique: TNl0pBOONhi79z-fqIFinw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdgJfoxp9BWHCY0n9qJf6q8SrKsv5iDf4GOFSFmDxoOp9agqKrKHuxH9rIVESp/df+Vs/oiKFMz0Mgu6JoTCPlL6YbfwGmwbuHK8yDj8Ax1jSyp6wcVQ0phwxgprU1pJ1g5QIY6ijAnQ07dq7JRcFdxYthlIGmAvmB3f2LLHZqjPHUcx2CcT1iXbt+aDEkyDevToaEkCBHtdhb0SWtsRwnWcmmMUDx8nD2tb4C/oGebr2Z/NMAL2B1M5tBDm2hllYV5sexixPxWpsRLUfujAQHi7HB1rrdoFgZWu5KXr3iiNp3jC1G6EQimDz5nr1OSUt8Jax0w/Lbt7t8R8afdZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvTUJhiMRJWr+rrdO40Y/ElFkK53sUNEBhoi51pO0uU=;
 b=ZZ20rR85gUgiwCNmnNy45/Wuo//sJGMjK5P2N4MVzcDM7hkGJvUQ3QqGLq0FDUo9rO8AZ1KgpaprnCBoqzi5IYU45FmfVhi5Y7D2+Zbhp1pbincC6Ud11HAHiqcpK8tdRAq42O18m4HrETZQAKfty2SDl4HcxmY6VVC7ip2Kb6+AUvz21MPreh1LR7o/64DIpD9Lt8rK8FYuvaGQdnChhpHztEEy4/HezwrhajoKo72LvahP+HrMWU/08QBwwY2K8yBf/4UNWM7/SKQgtm0J4xrJMSCztlgXYr5awNZAF+ANENfxNIkPZDDnuzx2HkumblU5ErsrROes+sTa446m6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e08b9837-9798-c884-6219-1680d319ba53@suse.com>
Date: Thu, 17 Feb 2022 12:32:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 06/70] x86: Introduce support for CET-IBT
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-7-andrew.cooper3@citrix.com>
 <26bc666b-e9c3-7f12-6d8d-256311846233@suse.com>
 <b2236a34-b20e-6706-c5ab-6be5b47b8f6c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b2236a34-b20e-6706-c5ab-6be5b47b8f6c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1227a7a9-2184-45ad-f349-08d9f2093c0b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6052:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6052A524B6245E80A0A918F2B3369@AM0PR04MB6052.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VEgYerq2CNyxGXsf4dEz/7hMvePCpAd9tSY7nVz/LQV/AG3W2eY4biU5U387OoHSqjPGrhj7FZLVtOi3Do6Yo5e6qzkiO/DYz4kx8Qx7yOp+IVIoVX3AVpwiMvrV/rfUt+/AjrHjsJxBb8HrZbjpF8hTkJOwtSa7EiFMphEPys/Bi1df0SGLMltKF0XQ3wEkAa9NKHDCIe7fGpKR4paV+31gxvr6LLCi3UqLtan7sAzTXiMkDmdTsumaRMdfnZgUAJc1vKJYJ/WdJLOjp5EcHSQzlAwyQprUWO5YdRcQYH+mwy5emAHdYKOtP6WCvI/9QATCc7OXQuqFkYcismRtfOyy/DmQ8e4awPdgEdCAxwQsCs6D5+L0lbeLde+49Vmm7Y8g/Dq6fDVoQIKlABRndEVLzH393RANw9KfX1cB6A/NgIuYQ10st0hZykWlDs5Q8fdbOY1MR0CMfuwq5ga8JSWUXGoUGOpOmGEvG0iSWcQOT7xhGa8lp4fsNByLO+NkkW73wikvp1MUkofzyi3lnK3EfNc7mKRTMAU+KZ2MUrXGo1hbZ/0oB3C5CE5nsYbvW88BbeZcHu0wYEMozOLB2s1dplcsxiZ7VtYyebMSV3JxVn37f9J4FWncI2PfIdXZLv36feBIOb3+PK4rSFOnR2p5a7yQhECYeoJAcY3DaDiml2sABQ1Eh11Q5Sw2X7rjOmLofhUObdjaANyeSNb1qVj0UMtq2jsfPjXX36HDwHJMrcoplimBIK8kE8dH5VEObNbBEGF0JBT2Q8mL3YiNwDiyfxuVjqO1OByZ/CDhKBYgfcsCFdHEHA0ZrDuZ/YRyYTgU3YCSPprhvO53aP1WhA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(26005)(5660300002)(4326008)(31686004)(53546011)(6506007)(6512007)(508600001)(316002)(6916009)(54906003)(36756003)(6486002)(966005)(8936002)(2906002)(83380400001)(66476007)(86362001)(66946007)(8676002)(66556008)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cpWLpz94M+qURkqtPTXraSD2kDAdmB94NFxqqD+aJjyyzGj0V8dvrQNcq+Hg?=
 =?us-ascii?Q?E4CAeDPf20tRKj6rZSvT/hOz0EOyc7GSbkWBheVFGTSyQikHrO5bzfpIOBR1?=
 =?us-ascii?Q?2rsfUmzlyDvLXxyu4/9pU01AwGubmt6QEVtSJqxoFvFLu/+T6c+OegEzKafy?=
 =?us-ascii?Q?xi11FrxSUehSvhpjFcczrbLgLE8JeD1bJCNfWFfzSPal7Bpl9GorMb/blqdb?=
 =?us-ascii?Q?uk2xoKbAvR5Y1oXASjLfoZ5YRrMjVfSMg7UYTAGzh/W2LEi33cWzJyd3Krzx?=
 =?us-ascii?Q?NigyUq9DjAXbuFm2bgtPdBzZphyNOoRm7Q7IZwUDL44lrPb81CRvdMQVQlki?=
 =?us-ascii?Q?yONwThZ6EsmmNGPyld/kYTQg2w9j59+nhpjk3tUJC4t0Xkq4CWdX1baKpYFo?=
 =?us-ascii?Q?97t7+C1SADEq1Jhe3/NMRAK8+XM9wQ+LYsIdlsBuPRhvhnjmCKYnDhd+yJLA?=
 =?us-ascii?Q?e2oG8UX25QAuMiX5XjTyCmawebcB3nDID9HslEm2y8asoHG4k/LVi06jZJ+X?=
 =?us-ascii?Q?mdqWtWboo6vwjRbzgi/fc82hh/AinWYvybR8VB3JY2kRPzB0Ewr2xEwLx5aC?=
 =?us-ascii?Q?h+uvz+0WPdtPvZ4gS8LoANInIiAwwrPEQctITvFDg9O0iDnTs6zYuZ2ilvvF?=
 =?us-ascii?Q?yjkm+1u4bu2PJeD+/Hr+xyUErUIyl3kZG5KL+y7WUNo2xdOaWIBufiVZCutX?=
 =?us-ascii?Q?gPb0XqufwmAjw4pymh6rwUt8x+zJHUtUGelf5snyaNqjjf9/5qBx8LmmC0B2?=
 =?us-ascii?Q?hySJ/dkSLabyoxCxEuvfrUiMqX1TyUmgsx6euF9pFSUoq5HGdXMCWMJl4kNW?=
 =?us-ascii?Q?uECUmrR7XwihOx3I5I+6PJULefyGF/1dr8xnCU6rpkmmUv35zDzykW9P17R3?=
 =?us-ascii?Q?MH8Uec5fsiHwnrGLOHp1PtaISeXMKmC0v+ymkMG+DZD7hJvkI6z+ji6n8WFc?=
 =?us-ascii?Q?8ty/izBuyr1Y4vN/CMrVwpJ1nT8z+s8acLEPU+dmjgaBLTLtbgu09z3o/Mrh?=
 =?us-ascii?Q?KX0TqiyebygYS77RRMcny13hZ7XJ4/vaIT44LTKU2n5BZ2nOk2OJb8xN6OCx?=
 =?us-ascii?Q?nr5yuY4EQaHEP62C6EGI7q9BMuU4Z6m+eoKJC6ODSRYSN+6ADLD0HPC78Ggg?=
 =?us-ascii?Q?9eYxd+4fddb/Xlspy8Tr7/YiENS6L6iLoSe0vI8fWmM+UScnRCfJ4qZXgTaK?=
 =?us-ascii?Q?S+DVzTDWfeiTZwAGnTgOn5D0wKlmOH7vF/TgF5XlFZ5LI6qRLLDbSJEcryKz?=
 =?us-ascii?Q?5i5WRFNf/+7qZNKtvo4VDIu329nTCnvF2yoyxsHj8GiS9khg7Q3ZwH2sFz/p?=
 =?us-ascii?Q?gOU2pvFs8NN2knTuMgVpcSDdg79wGc9LHZEVs1AfDU6qf5iZMrqPy3Egws1I?=
 =?us-ascii?Q?g2v2urUNsvcNZXTEexqfarL9bh8MaeVCfqR1vLtmsykqP+yf7RAguWJJyumb?=
 =?us-ascii?Q?EQ3Kx7zQdIN4N+s+XQurxYRKbrhU/Zazr6Sf7KVaLI+KPwl0AYrIZJSnBySN?=
 =?us-ascii?Q?ZCk9xxr8Y2IGBCFbg4l6rlxj+0vF+MpL1EGCaes+K5i9MvfzlJauYuuXIQWW?=
 =?us-ascii?Q?N/qjgTjaa/V10C/DLiJd3iphcABRjMAx4zNN3nlYDcNYMCPAi1d+H74gEsUb?=
 =?us-ascii?Q?N4oB+5eFnTY2v7MDxkMKX/g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1227a7a9-2184-45ad-f349-08d9f2093c0b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:32:52.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xTEg+sYeAuB7iC8Fcq7D4uM7mOFKqovv7lMTtEWVAtUwBrh0+QIaynmNP7K0jxm8S0iKRuTrzFEpzPfZ1F5Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6052

On 16.02.2022 22:54, Andrew Cooper wrote:
> On 15/02/2022 14:01, Jan Beulich wrote:
>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -39,6 +39,11 @@ config HAS_AS_CET_SS
>>>  	# binutils >=3D 2.29 or LLVM >=3D 6
>>>  	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy)
>>> =20
>>> +config HAS_CC_CET_IBT
>>> +	# GCC >=3D 9 and binutils >=3D 2.29
>>> +	# Retpoline check to work around https://gcc.gnu.org/bugzilla/show_bu=
g.cgi?id=3D93654
>>> +	def_bool $(cc-option,-fcf-protection=3Dbranch -mmanual-endbr -mindire=
ct-branch=3Dthunk-extern) && $(as-instr,endbr64)
>> At the top of asm-defns.h we have a number of similarly operand-less
>> instructions expressed via .macro expanding to .byte. I don't see why
>> we couldn't do so here as well, eliminating the need for the
>> $(as-instr ...). In fact ...
>>
>>> --- a/xen/arch/x86/include/asm/asm-defns.h
>>> +++ b/xen/arch/x86/include/asm/asm-defns.h
>>> @@ -57,6 +57,12 @@
>>>      INDIRECT_BRANCH jmp \arg
>>>  .endm
>>> =20
>>> +#ifdef CONFIG_XEN_IBT
>>> +# define ENDBR64 endbr64
>>> +#else
>>> +# define ENDBR64
>>> +#endif
>> ... it could also be this macro which ends up conditionally empty,
>> but would then want expressing as an assembler macro. Albeit no, the
>> lower case form would probably still be needed to deal with compiler
>> emitted insns, as the compiler doesn't appear to make recognition of
>> the command line option dependent on the underlying assembler's
>> capabilities.
>=20
> $(as-instr) isn't only for endbr64.=C2=A0 It also for the notrack prefix,
> which GCC does emit for any function pointer call laundered through void
> * even when everything was otherwise cf_check.
>=20
> It's another area where treating the cf_check-ness as type-checking
> falls down, and created some very weird build failures until I figured
> out that Juergen's "Don't use the hypercall table for calling compat
> hypercalls" really did need to be a prerequisite.

Oh, I see. I can certainly accept this as a reason, but half a sentence
mentioning this would be nice in the description.

>>> --- a/xen/arch/x86/include/asm/cpufeatures.h
>>> +++ b/xen/arch/x86/include/asm/cpufeatures.h
>>> @@ -39,6 +39,7 @@ XEN_CPUFEATURE(SC_VERW_PV,        X86_SYNTH(23)) /* V=
ERW used by Xen for PV */
>>>  XEN_CPUFEATURE(SC_VERW_HVM,       X86_SYNTH(24)) /* VERW used by Xen f=
or HVM */
>>>  XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen f=
or idle */
>>>  XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shado=
w Stacks */
>>> +XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indir=
ect Branch Tracking */
>> Is a feature flag actually warranted here, rather than a single
>> global boolean? You don't key any alternatives patching to this
>> bit, unlike was the case for XEN_SHSTK. And the only consumer is
>> cpu_has_xen_ibt, expanding to the boot CPU's instance of the bit.
>=20
> These are just bits.=C2=A0 They long predate alternatives finding a
> convenient use for the form, and are 8 times more compact than a global
> boolean, with better locality of reference too.

Well, I disagree (and we were here before, so I think you could have
predicted such a comment coming back). We should never have cloned this
directly from Linux. It's only bits, but with enough CPUs it sums up.
We shouldn't duplicate data when we need only a single instance (and
when no other infrastructure, like alternative patching, depends on it).

Last time you put me in a situation like this one, I told myself to not
ack such changes anymore, but here I am again - in the interest of not
being blamed for blocking this series:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


