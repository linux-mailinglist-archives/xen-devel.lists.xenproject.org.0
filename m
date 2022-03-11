Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AFE4D5C25
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 08:19:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288793.489820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZXj-0005oC-Ku; Fri, 11 Mar 2022 07:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288793.489820; Fri, 11 Mar 2022 07:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSZXj-0005lS-Hg; Fri, 11 Mar 2022 07:18:31 +0000
Received: by outflank-mailman (input) for mailman id 288793;
 Fri, 11 Mar 2022 07:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSZXi-0005lM-0f
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 07:18:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b943df-a10b-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 08:18:27 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-VVkNmF6hM-y7Q-qfalMlzw-1; Fri, 11 Mar 2022 08:18:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6726.eurprd04.prod.outlook.com (2603:10a6:20b:fb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 07:18:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 07:18:25 +0000
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
X-Inumbo-ID: 71b943df-a10b-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646983107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ikbr4D74grBm1OoFVhZv8x7t/XLolbsgh+J/5sw9fA=;
	b=crIab4NRCMDtfs3LlZ4yzPocCKAB+fGgEkh0Yitp6USXy8rJ9JpoM5NvPm3eyb710JJfSJ
	Zxp7hFVAUvbtb5aOr6Mlsjn9cP1ZrRMAbVKtzANyNQlmX7rkTY05yxKpd5wxVrDTvcPYIa
	UEAA72oF9Pnm+xlZLBvqUi8Qkojeu3s=
X-MC-Unique: VVkNmF6hM-y7Q-qfalMlzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVxBC7Cd6/2/EFBkSQS66Y/QUDvwcnrInCojewzqrpjhQHnevPGvF+OAmlCW1mOzdJdf8S/uqllPBTG5SxlFJejrQ9QFtlooqVlFo7wmASIfjTWAbTMNP2g8uRkpsGvEPCZYpjyETWOmNE11wDrVhAXgsxs+hJNrIE+idBhx9xp/qSYMr1WfitoKT4nCMZKHhEZidSxZEpOgzDNfSq5jXzXScyh/44hR3T7MzqgJMGiBcTfdxyEk05W7K6O2wwUh9VZUn/n2WgUHqo7eP54o7dndsIyTafgSlEUIVT8W/4+mkrN1d8N1wjdV2Z6t2TGBdw+RymDjLAxgtA2frJuw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyUJhWfsSyqUUHT6uq6nwQbPw81yxNi/kMNNb7x9pH8=;
 b=H9XVIacNIsM11ofWa/Aa4QP9WbEv9Lx3TxfxoWxetBTBtyvWJLFskX5J5zZcjV8kettCJI3OUyA1Bfqm2MvQamSLWbzesBJ64dI9j4kgaUGtpNQc1Ptonj2XmNA1ad7LlhYfJ1jpKFFtGDEKNPIMdzmHR1SERQewGqMAxYFG4FMqKI/LhwZ4WHIUKAKL2k/8tnFlr3M6nEeLtuBc3Qx2uqYoM0cJuOtz/IYDYF2vSDFkS8DFeVTOiWXrEqmX7mzDOaguVYd1p8k9KhNfGyhAPiqYDyGWrOjFdC+YoO1YJet6aGldeoF+v+z0Pae+NRmmFiAhEdZr00y6T2l25gb+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b240f4f-0cf2-e543-b21b-be356ab71e49@suse.com>
Date: Fri, 11 Mar 2022 08:18:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>, Michael Kurth <mku@amazon.de>,
 Martin Pohlack <mpohlack@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
 <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
 <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
 <83fa28ce-f2db-2451-356f-0dc0266834f2@suse.com>
 <48c6720a-070e-85db-f1c3-448714232946@citrix.com>
 <d65a64fe-72b1-efc5-1804-8f74aca6d803@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d65a64fe-72b1-efc5-1804-8f74aca6d803@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0171.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d53e8592-62ac-4c40-517a-08da032f54d2
X-MS-TrafficTypeDiagnostic: AM6PR04MB6726:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6726CDF24CFC286F2DC85453B30C9@AM6PR04MB6726.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0fsPlRfkKzSTtFZlu/k5qIFJbAXmkQAZIkSCWdHRYtsyjo7f9QjtnW5ZtShLrz16rISbEy9Xxo4sIz6ip9GK8VmsUGGwGn8LgkMtP52ESbPOqbfLxNfSvYdlGiDp6l0BNFKL0KQHIJ8dXeuCiF3YXQNxJMekgq4q3r+n7TQR/OsScPKMTw38R+lYmaHsqjI4b4/NwS3/3+DgMgPw20V9ISGz1jCCZCAhIHU7yfv6i9m/VBN/xKWh8LQi7ptfTBrq8ZgcPTXsS3mLyNSwupnKjLJDczgaLyySk2PM5L5KSGmrjxkfrGZuKRiPeNeHBPeqUfWyaW/m4MGkraNh6lE9FyMU8v6fFcBTg70yH+SP/fhFHJ3vFjQ/X6dOGId7UjlzeF5CDrjN806BrX6jouGXYCF4FfKfzQlUILhkg460/JERtaTlsBaqTJXDvl52+xL2LIKDR+vOZEp8qcrO1zUgxXS4EjYgF+ZUDTWj0jj6ncQwdneh8jCK2RRAA5boRLXOLYwd4A7NDEZD0gggMAda+nxoxYRhvoEFoGZ5UQ60wE/2ShkKW7Zm+RzcHecP0j4kubHkfoqXjxSsWI3R+KzSRLTRvs5D+mb9tb6u5MTLpE8etaBYH74XwTW9ZAesNHArDvFaVmgApjgMqLOdxo+a17xgpqXtKkqZdCoMHSO91BQTYNBKvpovy4knFxMWbEiLmAztQiRz5TTCw3BIgevYox5D2KM2xD8+dC6dQ+VRctQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(53546011)(186003)(83380400001)(26005)(6506007)(6512007)(6666004)(54906003)(316002)(66556008)(66946007)(8676002)(86362001)(66476007)(6916009)(38100700002)(36756003)(31696002)(508600001)(4326008)(31686004)(5660300002)(2906002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTOTaPrEvZtkHByxmjzA/XCqv/Y+OdPHnw+jXhazfu7FLCrqlPXsc6l8rHWV?=
 =?us-ascii?Q?16/Y3cNiPquH1Jji+C3lql25xR7M0Zclr6te1nNMqMt1UAdr6wRnTbXWpgwL?=
 =?us-ascii?Q?vmbrh2cZ0nqgUE1y02Du8VKS/vibMA/c3huEJf9wnV1cal5O8qCeQN+8FEtI?=
 =?us-ascii?Q?wBU4j0bWGZwIKCUeneyFZqkYiXlkqBWbnSIXCemJkSC7PGNLUqc9bE08+ZkG?=
 =?us-ascii?Q?pSM7fTcsCUcUaSwoI5eJyqqnHjHtTqCMNhATfnoiEH7N712k4/VpQ8ro2K0I?=
 =?us-ascii?Q?dWzrQv6Fyi/x9XJWME8xenYkDGUisCcIqic+oi42YcTvbx1/FNRMhV8T4C5M?=
 =?us-ascii?Q?ZLubq2/JJZR0rDuheym5WlxYyTTyyXDQJYP5pnaMRil7EtIOkntBUShl8HaV?=
 =?us-ascii?Q?S8LEF9Jn/9xxlE1lw9PB9s2lPPqFU/1ecGtqTzyRDfcsqacWnM2ASv1rEIMK?=
 =?us-ascii?Q?Ny8c6RofKpCXHvv6n/E0+t9xKV9Cc1jw8QYmbxc1Dn203GVe3e8p9uTmmBx6?=
 =?us-ascii?Q?Kr0tWjfm3oLDlwYe3VGZFBskNDO3uKxOhPV9qK/JzUu8x8FxZlk1WIAS3l8B?=
 =?us-ascii?Q?k5MJbtHzEIdmk/DFRA3R4e0mpvBaIOSATGaEdm7Ad99H8AcSut12mvz0gocd?=
 =?us-ascii?Q?4Z2TP+FlaK9W7tko3x7z8g7wbnuQXOyZ46eDGZqwLNKXtrVhDt8m1HnTCJZ/?=
 =?us-ascii?Q?LRKoDSddgFB2ncjEEa8/cZRnyqziYtipHshLZj6pONHF5XkFL/xELLYmh38A?=
 =?us-ascii?Q?lJQHnZsXWPs1fm/SS0HxJNGHnMlXgVKeLquMS6R9ZwUK6D4WeFm1H8nsq9nh?=
 =?us-ascii?Q?eKP3dl6nJmt7IFZYxVgHW/gnOnX25TazvaA5XFi0P/4AN8X6D+h5xPWkRl0I?=
 =?us-ascii?Q?D9pD7ko/vci+gwfOgl2U52MaOaYd27tWgLdNncBkIDYfHEJTHOVXdreMke1m?=
 =?us-ascii?Q?p3GWA1biTdDD2wsCFG7OWf6dKAxsbL0cHr+UiQvgVKWxe0jzj/i0HDl9seKi?=
 =?us-ascii?Q?HS+NUJatlqnel4B1htFDV5DKaFXVKuqj/MYIHyBHW89EWnzG0RjMJ0aZ7le/?=
 =?us-ascii?Q?bRYmSbSVUu25uH5B4PPlGKObyr9MKB97qykgOnhCj8nVYHQqjUvL+Jvhncx5?=
 =?us-ascii?Q?evdbuMlJyTX0izr05RA2zKDzmn6CUL+pj1IaYYA09S4kclUQHbPbwyg0QQjf?=
 =?us-ascii?Q?eRrApQ9xTDrnOw76bpaO9PsNicZZGKJH945ogUKKmgRgkzLlvPoqrFGw+Ptt?=
 =?us-ascii?Q?Sx2Ao8o/AsITk7fgc/g7vWRLansaP4oXN60nC/O8DmyGxrPQaxxo2/Th2h4g?=
 =?us-ascii?Q?Id6QAF9avU0zJh8ozTRCXRYtrtGA2NgerTUjV+sSZxzblsQA9o7fGimCPF0F?=
 =?us-ascii?Q?Jm0LUVOQXUi1OPzHd93pwsv0M/HhBzTkcSLXgMEnfIdPVJqhNoqs4cj2SfT2?=
 =?us-ascii?Q?gPkMS2U1pldXgFVtq1m5OMUMh1AZnQqT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53e8592-62ac-4c40-517a-08da032f54d2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 07:18:25.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxAAw++6RG8pg0cySQps8NOw9oHWjyNl25VYe7Sxr/fHpqfILdqgReMBxOZWO/5T5tTWbl9sTdf9qSBOFLqDBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6726

On 10.03.2022 19:42, Andrew Cooper wrote:
> On 08/03/2022 16:03, Andrew Cooper wrote:
>>>>>> --- a/xen/arch/x86/include/asm/endbr.h
>>>>>> +++ b/xen/arch/x86/include/asm/endbr.h
>>>>>> @@ -52,4 +52,16 @@ static inline void place_endbr64(void *ptr)
>>>>>>      *(uint32_t *)ptr =3D gen_endbr64();
>>>>>>  }
>>>>>> =20
>>>>>> +/*
>>>>>> + * After clobbering ENDBR64, we may need to confirm that the site u=
sed to
>>>>>> + * contain an ENDBR64 instruction.  Use an encoding which isn't the=
 default
>>>>>> + * P6_NOP4.
>>>>>> + */
>>>>>> +#define ENDBR64_POISON "\x66\x0f\x1f\x00" /* osp nopl (%rax) */
>>>>> In case this remains as is - did you mean "opsz" instead of "osp"?
>>>>> But this really is "nopw (%rax)" anyway.
>>>> Oh, osp is the nasm name.=C2=A0 I'll switch to nopw.
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> Thanks.
>=20
> It does occur to me that we can extend check-endbr.sh for this.
>=20
> diff --git a/xen/arch/x86/indirect-thunk.S b/xen/arch/x86/indirect-thunk.=
S
> index 7cc22da0ef93..3baaf7ab4983 100644
> --- a/xen/arch/x86/indirect-thunk.S
> +++ b/xen/arch/x86/indirect-thunk.S
> @@ -38,6 +38,7 @@
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.__x86_ind=
irect_thunk_\reg, "ax", @progbits
> =C2=A0
> =C2=A0ENTRY(__x86_indirect_thunk_\reg)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nopw (%rax)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE_2 __stringif=
y(IND_THUNK_RETPOLINE \reg),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stringify(IND_THUNK_LF=
ENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __stringify(IND_THUNK_JM=
P \reg),=C2=A0=C2=A0=C2=A0 X86_FEATURE_IND_THUNK_JMP
> diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
> index 9799c451a18d..652ac8d0b983 100755
> --- a/xen/tools/check-endbr.sh
> +++ b/xen/tools/check-endbr.sh
> @@ -67,7 +67,7 @@ eval $(${OBJDUMP} -j .text $1 -h |
> =C2=A0${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> =C2=A0if $perl_re
> =C2=A0then
> -=C2=A0=C2=A0=C2=A0 LC_ALL=3DC grep -aobP '\363\17\36\372' $TEXT_BIN
> +=C2=A0=C2=A0=C2=A0 LC_ALL=3DC grep -aobP '\363\17\36\372|\x66\x0f\x1f\x0=
0' $TEXT_BIN
> =C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0 grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN
> =C2=A0fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $=
1}'
>> $ALL
>=20
> yields:
>=20
> check-endbr.sh xen-syms Fail: Found 15 embedded endbr64 instructions
> 0xffff82d040377f00: __x86_indirect_thunk_rax at
> /local/xen.git/xen/arch/x86/indirect-thunk.S:55
> 0xffff82d040377f20: __x86_indirect_thunk_rcx at ??:?
> 0xffff82d040377f40: __x86_indirect_thunk_rdx at ??:?
> 0xffff82d040377f60: __x86_indirect_thunk_rbx at ??:?
> 0xffff82d040377f80: __x86_indirect_thunk_rbp at ??:?
> 0xffff82d040377fa0: __x86_indirect_thunk_rsi at ??:?
> 0xffff82d040377fc0: __x86_indirect_thunk_rdi at ??:?
> 0xffff82d040377fe0: __x86_indirect_thunk_r8 at ??:?
> 0xffff82d040378000: __x86_indirect_thunk_r9 at ??:?
> 0xffff82d040378020: __x86_indirect_thunk_r10 at ??:?
> 0xffff82d040378040: __x86_indirect_thunk_r11 at ??:?
> 0xffff82d040378060: __x86_indirect_thunk_r12 at ??:?
> 0xffff82d040378080: __x86_indirect_thunk_r13 at ??:?
> 0xffff82d0403780a0: __x86_indirect_thunk_r14 at ??:?
> 0xffff82d0403780c0: __x86_indirect_thunk_r15 at ??:?
> ...
> check-endbr.sh xen.efi Fail: Found 15 embedded endbr64 instructions
> 0xffff82d040377f00: ?? at /local/xen.git/xen/arch/x86/indirect-thunk.S:55
> 0xffff82d040377f20: ?? at head.o:?
> 0xffff82d040377f40: ?? at head.o:?
> 0xffff82d040377f60: ?? at head.o:?
> 0xffff82d040377f80: ?? at head.o:?
> 0xffff82d040377fa0: ?? at head.o:?
> 0xffff82d040377fc0: ?? at head.o:?
> 0xffff82d040377fe0: ?? at head.o:?
> 0xffff82d040378000: ?? at head.o:?
> 0xffff82d040378020: ?? at head.o:?
> 0xffff82d040378040: ?? at head.o:?
> 0xffff82d040378060: ?? at head.o:?
> 0xffff82d040378080: ?? at head.o:?
> 0xffff82d0403780a0: ?? at head.o:?
> 0xffff82d0403780c0: ?? at head.o:?
>=20
> Obviously the changes to check-endbr want cleaning up, but I think it's
> entirely within scope to check for ENDBR64_POISON too, and we can do it
> without adding an extra pass.=C2=A0 Would you be happier with this check =
added?

Yes, this would feel better. Thanks for having continued to think
about it.

> But we also have some clear errors with debug symbols.=C2=A0 It's perhaps=
 not
> terribly surprising that irp/endr only gets file/line for the first
> instance,

I have to admit I would expect it to at least figure the file. But
there's no .debug_line contents at all for ..._rcx .. ..._r15.

> and at least ELF manage to get the function name right, but
> EFI is a mess and manages to get the wrong file.=C2=A0 Any idea how to ge=
t
> rather less nonsense out of the debug symbols?

A random example with a symbol from a C file works here, at least.

Jan


