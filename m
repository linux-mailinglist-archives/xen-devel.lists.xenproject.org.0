Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B24C8E6D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:58:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281632.480060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3x4-0000ut-W2; Tue, 01 Mar 2022 14:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281632.480060; Tue, 01 Mar 2022 14:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3x4-0000sI-T0; Tue, 01 Mar 2022 14:58:10 +0000
Received: by outflank-mailman (input) for mailman id 281632;
 Tue, 01 Mar 2022 14:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3x3-0000rR-D1
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:58:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0159fdd0-9970-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:58:08 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-Ef4FgCsSNMCwDjXCLyMM1A-1; Tue, 01 Mar 2022 15:58:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2431.eurprd04.prod.outlook.com (2603:10a6:800:2a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 14:58:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:58:04 +0000
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
X-Inumbo-ID: 0159fdd0-9970-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646146687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztmfq5fITsOk3cRhkKnyEXijrKpo+rZWlcUJd0hVKZw=;
	b=U0Zc5qzxhgWMd+/zhR3cvI72kQbvQKVrxfdFyO0nWna9yKvfaV3iA8vs82J4m+VGQqB1xB
	eWqB5YDXBH9xpDLFRmW1tgRjCkpDIQej0iMeTbKMxupLK09P9NP5dbYgj9zN8HZXZ176zY
	t/QDUCunOzS2/oqupQab6CY8RQaZZgA=
X-MC-Unique: Ef4FgCsSNMCwDjXCLyMM1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrcMjknU0DDePEJoRvWfkRUV8Gc333BhnZf+xx5uonIqZLuLTRcdZuQqppZXpeU0oPeC3WU2A94Ozihzryij4ioujID4i5InZAedJkUyEstVUBe1ZNP8DFjjSFTedIct3+cN3fd+YCDToXA2PFOyZtbqAz0AdtkJnbgrMWxsWZRNfpf0CxGP8NB2j/xCRrCAHTWv1pu4AZ9wvMmGu8OF03kxbirrE/IA90d6fBNjORO2/ewlbG74DtjFHWB1So5ZS3mitekAO6eKW7//oZ47SVkMUYxzL0M6ZApGZiaOWOI1C1h80brW+cD8lFux/dP4GkT5ru42Azlw/5maGaUX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=am9EStbXSqHKqU0MT/hvArx+4c4Jvx/vCLeo3n2ngx0=;
 b=DwUqpbd6okEoR/EjzF0E17B9RKu/Hvx8GDwmVYdxiYqR6vci4M1DVJXgDSpTS2b7u4h3GSLcDK4AxfdMF0E60BR1pceKgWb2FsS2I+34T3tWU9PNJTx+J9r0WQ4as62axrk1IRCgAunXhtaIbCmDfPjKBcjwgfL66da1lWUyJlzseuHE/pfPBwOx9GmKd8HEvJjXwYsSABFT4PsfPpH6OP/mbcP2KChEZ3wZ7QMlO0NVD5LGWRLtaADqVhHHkYgHKJgkmuxFmdZbNqfavDPv10XThCrNEyuP9Mc3QXtpt1ZglVWL/KAsS/EN04ZSMBM3fIbD6tCshf8yN+Oepzsd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf6f400f-9901-aad4-77e6-56333992a76d@suse.com>
Date: Tue, 1 Mar 2022 15:58:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <2808e805-60a7-2f1e-0ff4-8da123c79afd@suse.com>
 <eaa7f36f-f8b8-604a-9d97-6cadadbe6eb3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <eaa7f36f-f8b8-604a-9d97-6cadadbe6eb3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96722ba8-581e-4301-b895-08d9fb93e35a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2431:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2431230E255A430B9038B506B3029@VI1PR0401MB2431.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AREPU62mRoOSOuId9LRNsn9FkoDTXHd1L7NBBX0hYEb2cY4S7v1bwUCRuId6+CApun9s6Cp+Hjzcj4F2XnttM/P6/BmZT4xKQhmwrYC9GeTnHsNBYe5EuS7lrx7JB7MBtq5tgCNGgWlwOIbPTyMmCk/8A7m3DzqbxLmVM6uYS6NReFiDSptD0ct1i4/d25lLiu8A8qb/NYrp6pgVcM7F9ihEFP+8d4e2hjI1pY7GAJGbkgAOvpsvBuni3S7qmysDmd5fh31D4jkzdITQE8ahstFpBIW2qm5fAHMtyYSFAg1T7qL3MJPXP12OuUn6UfwH+7Xw3pEWlfRyOaRRyEv2TphwGVIhrSlyoiXPgPJ6gLFnsGAckoicTYa4eKsER6rpzunNCj3XK5Q8R0qSbFa6YtWr7YZibfzYX8D5rryHWxs/Eei7ihYj4a9Mv0F0ofSd/Eldz3rCAkAA/0W4JZzdGFle7vvl/PNcGxhXl5JnWVhjywBUxV+3+2xu0FKRSUnwxqsit1p/UbEspt+q+ok9zFtTmE/MU+8IiKZerdgPsYvIErglnR7OGWzaaQN+DxtOSh2JGsBIYyQzt/nbNFmN3PEP1APLzrhNeHCq76hSstBQ6pOgn3RPxEqiI75hDQO/sItquyBbHx56oYckg/1vxTSnm3Q+2PAgcff46+ml7v1CR+1dznmSRcoadeARqv8VZyBlu/iuyAiO28x8Sd72zx15u+sJi74XG5S09GsIwxQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(66946007)(66476007)(54906003)(66556008)(31686004)(86362001)(5660300002)(508600001)(83380400001)(4326008)(8676002)(6512007)(38100700002)(36756003)(31696002)(2906002)(316002)(6486002)(8936002)(6916009)(186003)(26005)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m7hO/U7iKMtOAWX6+VR7lR0l8FT0sH2UYi7NQc4JkLZWFNXf8m5A7KrE3lag?=
 =?us-ascii?Q?zIwWABwzeMlp295/HEMynua6uSxL9yFjEuXXneX1NNAzgdTBg6ivrvqey2Qk?=
 =?us-ascii?Q?CsOu1/AZetBcBR/HgW6/nhoMFEwRB3xFWCuGBUrXXp/NwzRzhJdVYaPKO/hE?=
 =?us-ascii?Q?vPDhWoaeEhFN5nA0KQkf9jrRHPsqm52wgomxIgSjM7LNyK99HlJMvzcf3gpQ?=
 =?us-ascii?Q?u0LYKvPWFDW0lcfAo/paS9bfS/TjjdV9/A96MtkHqfnZExRSq3qP6BkCmf0C?=
 =?us-ascii?Q?bOUo0F8AuXI0xab9RZd8eV1TJcg0u1By+bhTWP45GpZQZNXP5oCDOya1S0Ki?=
 =?us-ascii?Q?AuGq79x+N9yRvzh9O9anQaekDLhUw13xz9ijWuhESNuH4YLrpIEVFaB5M1Ng?=
 =?us-ascii?Q?4kh7KBG4V1qpTBONXUWXQuYLcKq9+5DR3Cwvq4BK4Kb+pOICipxcYS6+TcAv?=
 =?us-ascii?Q?0+A1zr+RM2rqwuBSGlzbX/pEwuF2QCRJ2wp2QiiwWg/76RA45zeVJAxzy8e0?=
 =?us-ascii?Q?7aA9EknmKbvY2c5Mv52Yy8kNjjqNriEjQ/qxBnzzmMrH6wXixvhXJRCDcXiH?=
 =?us-ascii?Q?/Qs1FGVOAm3jBsNayObQT1qjYPfIIHcx3N5v5Mgh10hUXpNeJVu423VhIbKW?=
 =?us-ascii?Q?0JKqRUB/h2jdYyhthgKJm0c7uBU+EIJXzuLTslwN7nXxRYbZG5F9cd7uPHQq?=
 =?us-ascii?Q?PPVZQAxGkPw85NnOBwN8kANfvSuyeLjFGAKe1AtNz+6h7wS3St4aORxxbmUQ?=
 =?us-ascii?Q?Zc1lo+Sqb9/PPbgKZycytiCQ4bf34WvxL8gCZoEq+80A/j169zHE45/AxdMr?=
 =?us-ascii?Q?x/cKeEGVSDUZl6/6JpJg3Dm3QlCOiCMkh+/2d6M8R8FcbeVMcsdTHVtLyfGP?=
 =?us-ascii?Q?vKE2seoJ9/bbFbBkjqJ+GMpqtwxtgM5hL9aRMpJFwUV/q5M+Nz/dNz5SkiwJ?=
 =?us-ascii?Q?YOWPK2LC9RSj1Vt60KMXtmIPB5z+y+raN2EufwtzT4oP1OApUzZLjnUQJh+E?=
 =?us-ascii?Q?YeRiILDjATGOLKD5sKvUmTSl1VJmQ+M0E0Ba9oEiSokqQXNNZ9kDJlX30wxq?=
 =?us-ascii?Q?lAL3Vjbf807qCmisj88WuRUxRGodwQYnSxwtssYmyYg1wkjnL5A0u3GA/v7b?=
 =?us-ascii?Q?UYZUVMbfA44C7JALzc8SwoikFfR+jRzEZHLX1009qPXAXXzrIFJFxGh4PgSG?=
 =?us-ascii?Q?ir+XM05Lo8RRKBJw3c+GMxkC0Tnor07ElxtF/V9Ohm3/SItB/I+M+rWsxKTA?=
 =?us-ascii?Q?S3WYVjk9wC+Wp9El6RwP68dQZzl/+7mdW82oBO2oX/S5SZWwdse7lmQXr3O7?=
 =?us-ascii?Q?4SC6zxxJbM5vL3Orlt9MgfikEg2bKl6Yk1KNT6MF33u3UWmVB+DjdHRi6Wcl?=
 =?us-ascii?Q?jK99VT09Gz3vDj5IpBho8yLH/EL8gqmyJga441eLeAFd9DcpKdHsB4XGvxtR?=
 =?us-ascii?Q?lScim8Uvo+6bI2WU9fPuqRQ808lxoGmho3FibqnXrYvq0rPoWZyabvvD/I40?=
 =?us-ascii?Q?f2weCPCyi4as5tbLWyB+N33cDkxZbTGij/O518L1ixAL78vy5nOGpWMvuvDP?=
 =?us-ascii?Q?qptV+zDRSJvqT7Gm8kfZhKimY28GtNKXeXJE70d/oNzPsJ0T7LUtLXHFmA/h?=
 =?us-ascii?Q?ZGrIuLgDV1DqifGb0/vAxZw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96722ba8-581e-4301-b895-08d9fb93e35a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:58:04.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ud7AS495cBgQ5VBGPi3ANRk95yai57qL6rovlowViipB9kiq/g389eqZJ2GRGDxfQNfKnO5FpLnQVSk2nhf+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2431

On 01.03.2022 15:51, Andrew Cooper wrote:
> On 01/03/2022 11:59, Jan Beulich wrote:
>> On 14.02.2022 13:56, Andrew Cooper wrote:
>>> @@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternatives(=
struct alt_instr *start,
>>>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>>>          text_poke(orig, buf, total_len);
>>>      }
>>> +
>>> +    /*
>>> +     * Clobber endbr64 instructions now that altcall has finished opti=
mising
>>> +     * all indirect branches to direct ones.
>>> +     */
>>> +    if ( force && cpu_has_xen_ibt )
>> Btw, this is now also entered when the function is called from
>> apply_alternatives() (i.e. when livepatching), but ...
>>
>>> +    {
>>> +        void *const *val;
>>> +        unsigned int clobbered =3D 0;
>>> +
>>> +        /*
>>> +         * This is some minor structure (ab)use.  We walk the entire c=
ontents
>>> +         * of .init.{ro,}data.cf_clobber as if it were an array of poi=
nters.
>>> +         *
>>> +         * If the pointer points into .text, and at an endbr64 instruc=
tion,
>>> +         * nop out the endbr64.  This causes the pointer to no longer =
be a
>>> +         * legal indirect branch target under CET-IBT.  This is a
>>> +         * defence-in-depth measure, to reduce the options available t=
o an
>>> +         * adversary who has managed to hijack a function pointer.
>>> +         */
>>> +        for ( val =3D __initdata_cf_clobber_start;
>>> +              val < __initdata_cf_clobber_end;
>> ... this being main binary boundaries, no action would be taken on
>> the livepatch binary. Hence (also due to having been here before
>> during boot), all that I understand will happen ...
>>
>>> +              val++ )
>>> +        {
>>> +            void *ptr =3D *val;
>>> +
>>> +            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
>>> +                continue;
>>> +
>>> +            add_nops(ptr, 4);
>>> +            clobbered++;
>>> +        }
>>> +
>>> +        printk("altcall: Optimised away %u endbr64 instructions\n", cl=
obbered);
>> ... that this message be logged once per patch load (with a number
>> of 0). I think the enclosing if() wants to be amended by
>> "&& system_state < SYS_STATE_active". If you agree, I can easily
>> make a patch.
>=20
> Hmm.=C2=A0 There are other livepatching fixes going on, but they're start=
ing
> with fixing the build system breakage.=C2=A0 (The major livepatching fix =
is
> to adjust how we patch an old function that has an ENDBR64 at the start.)
>=20
> That said, a livepatch needs to contain a section equivalent to
> __initdata_cf_clobber, to be processed during load, dependent on
> cpu_has_xen_ibt.

IOW you say altcall patching can occur in live patches? If so, then ...

> Perhaps the best option is to break the clobber out into a helper that
> takes a start/end pair and returns the number clobbered.=C2=A0 That way, =
it
> can be reused by the livepatch logic, and independently of this printk().

... yes, parametrizing would be necessary.

Jan


