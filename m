Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FB500E21
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304720.519430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyxz-0004xY-2f; Thu, 14 Apr 2022 12:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304720.519430; Thu, 14 Apr 2022 12:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyxy-0004vg-VX; Thu, 14 Apr 2022 12:52:54 +0000
Received: by outflank-mailman (input) for mailman id 304720;
 Thu, 14 Apr 2022 12:52:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neyxy-0004Nu-3A
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 12:52:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1cb5e7-bbf1-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 14:52:53 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-ukyQhNmIMnqAFAlHaiW6cA-1; Thu, 14 Apr 2022 14:52:51 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6228.eurprd04.prod.outlook.com (2603:10a6:208:142::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 14 Apr
 2022 12:52:49 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 12:52:49 +0000
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
X-Inumbo-ID: cc1cb5e7-bbf1-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649940772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iG03g41ap4phssauvE68l94oKQ5bkip1aCgJZF72X78=;
	b=WQF34+PfHXxO407P/0xrx6ADsv8POt8tGALL2p4L7tofHQFb/TFHyqrCzu7eLgjlZeVBxj
	/2zJzmTh+3wucYHnS+d75xy9Xa+GGXwOWgg+UKY4dFyVWGgYuUyNwV52Cbnh3DYnFkDSz0
	dH7fJ3TQDXTnpxBS7GN02sLtENuBDS0=
X-MC-Unique: ukyQhNmIMnqAFAlHaiW6cA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSY2dA9wasFULBg6SnzcXh/XpEWm7/4XEClfpppvrA5tEkNBwkayCNNXXC030lMZ9hIFJEAIb1JINj7sbJvDBpzvJbXfoj6CS70e0uoYPqOI5wMnGuFcIdQ+om7NqL8cNQP+d6byH/bYPqLiqITnmXKW/7uDigBm/VX1YL6xKE/Ya7FFzBChqhW21xM079nsK6qbsiD8iRPJd0u0Y+RkS2KjqN1r/HibdUhB9moznwQFUF+BS1ZXoGLh/HbHtfCTQBO7vGIXGmjIq34bskOkGkphB+6GTsG807wR6mBCthyIaaNFZ0gpJL9oAu2lu788GtqRQA5uOOKlQFPEQWh3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KWP01lNvpF59J6Of1jzl/vhPMK3P3XrLhG0Ma26yVg=;
 b=HyWu41S3zmzKObbk0alSZ+iVmVE5aC2X+iXFQ4dvL8V5Glu5WL2m8NlXAJz+KhIoBFHPdfCQyUrwZrEu87rWpypr8u11rl1g5nydrv5iYZGEFMQNB6sSWKMgOXq0PP9IiVkBynHgFhQ1oPdLI9c/SxAAAEmTsUTQ1n4OwWYK7jfynTRF55wOtgqQVufwH3gTmxmx7FwqZzqIIRPH1I6aWsMG/axSBQgTwCsyoRO5RyhZyUJnV8s4sw//YFTh5WAv9sMFit2Nxui6jSyqIWGmxBLN57PdrVnOO6OMBDfdANXwDBluQ1wPalF00VzPQJnrUeAwhNEfuzcFfLbECuT7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04f9bd9c-70da-0966-afa6-96f81e290204@suse.com>
Date: Thu, 14 Apr 2022 14:52:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] x86: improve .debug_line contents for assembly
 sources
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <23509d85-8a73-4d81-7ade-435daf46fcd6@suse.com>
 <YlgWKGmR+u41zSsw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlgWKGmR+u41zSsw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61f1c1b2-ee7a-42d3-310a-08da1e15ae7b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6228:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB622848E30B81E974AB39734FB3EF9@AM0PR04MB6228.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bPm8GgGITvgDXmTduZ/ISL+AKPCzIzHoHJhaIbXW8j4wCA4GSKLzo7qggcinA6EZEHbCixSTzWoFi8R/z9k7Ip7XXYq0O0xTEfUUdeTAgJr8xWD+fIS2EB35L/PfSxSfKuJ6CA4SGrKHQyfhlRLTLKHvIZDssSl9Ugj/3iG9kNsY9baXY9L8RUWK/Da6nfemsHP/h25vqu8kQotbr5UZHMajo7Ux/RqD9dXal5Xm2hKHMa3h5le3e/xXOFVOGvToEWWNDpPKLxcYyLp/4mKn7x6WYQKlt3uQAyP9qtinuQrDx6KRLBbCTx7pePAMFQsYfj7/dDasSOBAJT+pe3v1VBPBmDfcYLfQdnc/7gEMqggpw6y0U/Hu4kNAvi9PaOf3dC4WkAotkNINvnXmznKroupDl+OtfvPIXMYaM3jsNR4QKmPDTyKJnvyh8+0ACTbGSnRMkAgNdoLOkZvYHsjJbilsPhBZpmyRddZlycwW77vRWCOn800qCwvGWGBE/jb/VUw3j4PjbyjG7DenDtsOqaufwLbO3Rj/8xFhkmKauxmTOLI98XgXtc3cC3qDRb24aOf8mFLMqxolnBacFj3L2zOeDvk+Ib8jOEsBWhgHLKqvfIO41F/YnFw7v4Ld78mdWbNIgCV77pzihdwcs+BmCOVhU8ZGpdJjDq9FLcJ3NeqsS5vubJnUAZ8yaQ718mLXMGz/ROnMbgBuAwPIb1JgN9ySD2xxmA0vzQgzUoXbu9ScmGUP1UMwOn9/gSMMmM/JAbeq+6RbRdVKZ/yz9qvMbvmjpnq3QrOhtgRmCaP0B/hbGLetcOBJXZveKHcuabnPjXyP8oOlXuNlgFIkyIQQL3j5weH/Mnfb4Lj3FfP6VqeBgdZJX08mgvKukDmAQ58b50Nd/tmfxvgF6GOqv8nUXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(26005)(508600001)(316002)(31696002)(54906003)(5660300002)(6916009)(86362001)(83380400001)(38100700002)(966005)(6486002)(53546011)(6506007)(2906002)(36756003)(31686004)(4326008)(8676002)(66556008)(66946007)(6512007)(66476007)(8936002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yxvSWkoAYQr0wsoUaT5kbCvN1zN6QMLWsMUsyMaQOxXkv0hy+RHTX7x2NtcR?=
 =?us-ascii?Q?bFmHVTdi6Hlf9qRm89jagmmF5V8YAXENVA6Z3Ou7xfZcDYYHVZ+8joQtSxkr?=
 =?us-ascii?Q?DrIqfMVdwEf93OXZ5c9nHOMOHwsVCjyaR3iYsA64bmjFnJAHJc4D1E3zqxHH?=
 =?us-ascii?Q?sVgwqZDeqBtVeNZ+8XICAr+npAijUIduIQSV97NLma3XaLVAW+VSbtSDz7X8?=
 =?us-ascii?Q?NwtMzD6RcZE+p38K1VIGkfgNWjwLXz8M+axykjsRfV/T/bEfeSMai9Z6Rr9e?=
 =?us-ascii?Q?sOr7kqEkASeD/o4k5B4kazf7sj32VM5cl0L8NVDeKbBosZzoem7xkqu0ycas?=
 =?us-ascii?Q?frsCJR+WJMeHxq2FWdG7kJBoiyNwhlVGaWzCutyo01lSRPlhI3XgCQc9+uI8?=
 =?us-ascii?Q?U03jn1QbHkx6NKd1wfgNQ/K07d3yZxHkAHKrZPeheJTCt/KTO0JVOsrCDuKl?=
 =?us-ascii?Q?onGNx90V9rriBaCK34hmva6PiFJa9HMesjfZ3s0C2qaCnG/u3US/D+mUt3Gp?=
 =?us-ascii?Q?QTZXiPeXY07mTIX2gq3QgqM1yuJwpeweKiuXVryKXpX8bJBd864AWpik1wED?=
 =?us-ascii?Q?s8em0W3WDwD6whzhP3Bgiok1gl1ENR9h46iaTyqLUrx9UmYjBc/NqS/CRasc?=
 =?us-ascii?Q?CfX2swVi+9SDqxYoGMa3McHncJ4HSCeeir742qESySZi/LIeTRAuCbD9F6u2?=
 =?us-ascii?Q?5RT9makSCDRyu1Z67h6AayYHSk4JMITTrCs0FFrePEhtDLroIfsx4wSF7PTq?=
 =?us-ascii?Q?dj4Byx5BRlbqEIVs9tGMXtrUz3dxsVNN/45iaUVNrHLhvePqToe2KIomBlqY?=
 =?us-ascii?Q?j7mIjpyTYPx5e+4vAGArTR0k5RdQ1rGSl+84rGkpBMpqOSrH39LbV9aLH6Ri?=
 =?us-ascii?Q?zcwoOYToo7PeE+VvcwT2dcPmLwk82mXbjq+pDbKPz72uAuPGFi8kQEyoZdUz?=
 =?us-ascii?Q?9rftRSrsmyMZgrtgJvbPYydrMzQcudIgvuM2K/q410jzARifeJQM4e7yu0mm?=
 =?us-ascii?Q?7YZOjw/pqIZ/ytvEAa1q+9tAb2lGhB+8gk5xQs5PPb0Nj/xN4IPQpADxCJ9u?=
 =?us-ascii?Q?+6q+vn4es16WEh4RWHtVcwkq3qbTc3lMfzIP7U/ifk11F/FEaQeFe6c8GqoI?=
 =?us-ascii?Q?9fikerqt0qqUX0CPldsG3Q2SYp3vZ9CkiN3nPfX2LUPF6NXOFeITnbqlqssZ?=
 =?us-ascii?Q?KnCVnejFECt6sqKFFycRy7/Z2pwlFbnCGo3RhF7m62LmHC++dZ4b0qL+4kbn?=
 =?us-ascii?Q?6YDIpDZmMASbc84f1p1U8+NKNlDS6q2TdOh6G74ulR2ts6OZLqZbpvuzfkw+?=
 =?us-ascii?Q?SYbxI4AQ2dfeUeH1aVplIjrG7CU9cAdujIqd4o6IIoc7t5lqxSXyKMtfSGsF?=
 =?us-ascii?Q?gEK1QQzsf89f6/p2U0XZjb7n3HGB68kM85TgSEytFrP/TPmdWXf2g4D/ddtY?=
 =?us-ascii?Q?ojfBwPycnNdhzTvrnXNP9z5g4b1tU6nJ44dz4DBllM1ufBJNj93F58NultRU?=
 =?us-ascii?Q?j9qT4ky87GTH23Tz0e0EUkcF+spYJ563iBSFdve9UPBnUooi77l0mRqILgyc?=
 =?us-ascii?Q?eD9T+zgt+BnaY1K1aIBkcdbOsrgVe0MswxyySuln5bTU4WNhLydsippqHqM1?=
 =?us-ascii?Q?EiOHJ+nOPCfwKaUjSVEzr1HESo4YonHtWbQw+huunj/HHNnZCHNBoGwG9lRx?=
 =?us-ascii?Q?k0mO0b+4umCRuudz6GOhlQJlyEDRJWxGXPO5ELNUCGDVmWrJrOweeKJZsAM4?=
 =?us-ascii?Q?pIG7uFW+qg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f1c1b2-ee7a-42d3-310a-08da1e15ae7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 12:52:49.8364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mITBBLKSguAvgfs4ib0PJIK6ir4I7DENh4CTc0TSclfaXxAjDnOw3S6dCcXOi4dimiY+JzGu+DeZRc0cUEYQ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6228

On 14.04.2022 14:40, Roger Pau Monn=C3=A9 wrote:
> On Tue, Apr 12, 2022 at 12:27:34PM +0200, Jan Beulich wrote:
>> While future gas versions will allow line number information to be
>> generated for all instances of .irp and alike [1][2], the same isn't
>> true (nor immediately intended) for .macro [3]. Hence macros, when they
>> do more than just invoke another macro or issue an individual insn, want
>> to have .line directives (in header files also .file ones) in place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> [1] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D7=
992631e8c0b0e711fbaba991348ef6f6e583725
>> [2] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D2=
ee1792bec225ea19c71095cee5a3a9ae6df7c59
>> [3] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D6=
d1ace6861e999361b30d1bc27459ab8094e0d4a
>> ---
>> Using .file has the perhaps undesirable side effect of generating a fair
>> amount of (all identical) STT_FILE entries in the symbol table. We also
>> can't use the supposedly assembler-internal (and hence undocumented)
>> .appfile anymore, as it was removed [4]. Note that .linefile (also
>> internal/undocumented) as well as the "# <line> <file>" constructs the
>> compiler emits, leading to .linefile insertion by the assembler, aren't
>> of use anyway as these are processed and purged when processing .macro
>> [3].
>>
>> [4] https://sourceware.org/git?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3Dc=
39e89c3aaa3a6790f85e80f2da5022bc4bce38b
>>
>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> @@ -24,6 +24,8 @@
>>  #include <asm/msr-index.h>
>>  #include <asm/spec_ctrl.h>
>> =20
>> +#define FILE_AND_LINE .file __FILE__; .line __LINE__
>=20
> Seeing as this seems to get added to all macros below, I guess you did
> consider (and discarded) introducing a preprocessor macro do to the
> asm macro definitons:
>=20
> #define DECLARE_MACRO(n, ...) \
> .macro n __VA_ARGS__ \
>     .file __FILE__; .line __LINE__

No, I didn't even consider that. I view such as too obfuscating - there's
then e.g. no visual match with the .endm. Furthermore, as outlined in the
description, I don't think this wants applying uniformly. There are
macros which better don't have this added. Yet I also would prefer to not
end up with a mix of .macro and DECLARE_MACRO().

Jan


