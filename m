Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434151EC32
	for <lists+xen-devel@lfdr.de>; Sun,  8 May 2022 10:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323963.545839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nncNT-0007CK-0W; Sun, 08 May 2022 08:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323963.545839; Sun, 08 May 2022 08:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nncNS-00079t-TD; Sun, 08 May 2022 08:34:54 +0000
Received: by outflank-mailman (input) for mailman id 323963;
 Sun, 08 May 2022 08:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nncNR-00079m-9k
 for xen-devel@lists.xenproject.org; Sun, 08 May 2022 08:34:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9be8ad0-cea9-11ec-8fc4-03012f2f19d4;
 Sun, 08 May 2022 10:34:50 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-kEfqWQKoPJ6rYcdBSWTWnw-1; Sun, 08 May 2022 10:34:48 +0200
Received: from DB6PR04MB3159.eurprd04.prod.outlook.com (2603:10a6:6:11::25) by
 PAXPR04MB9325.eurprd04.prod.outlook.com (2603:10a6:102:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sun, 8 May
 2022 08:34:46 +0000
Received: from DB6PR04MB3159.eurprd04.prod.outlook.com
 ([fe80::cf9:4a87:2c14:aebc]) by DB6PR04MB3159.eurprd04.prod.outlook.com
 ([fe80::cf9:4a87:2c14:aebc%6]) with mapi id 15.20.5227.022; Sun, 8 May 2022
 08:34:46 +0000
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
X-Inumbo-ID: b9be8ad0-cea9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651998890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiU1mAd1O3/oJ2eDLJEdoOia9ggJEiEAacNYAszM1Bc=;
	b=SGv76GCR7CGuUV7TUrkoTB7PJNzOPKZ+FfpVDny5hOoBDBvZpDZogMbbqtX+y2w+9cnA24
	RKfIC7/VHntmVwaWOULxPpjkrR+9sfZw5CBuf32J9yP5LbSrc9wraUzPJ9e1FLvuOlCliq
	kKEUVPJDvBaRc9HodhCZ1Is5aVcH00c=
X-MC-Unique: kEfqWQKoPJ6rYcdBSWTWnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b65xESupKEMNwFHdFBEHo1QjeiBNDW1Df/dci6UBWraxmhfKJOCJuvUPHiQ1nqYbN4CGoN6cWvGkcktudTcuE26SxK3GslkDvROhaEGhoYsrmr5DOVs921ZJafRpNbC9dLzKPEoEB3bUF/6WTOfdUyai9LZ7fbnV/Lq0Uz9fyy/MERx7sFMbHjJpD0yX9u+gcu0Os/+vJVV//xb6/oXP+/pRFhrvk9DGozgQV49rLXliwmfkdWad046TcGkAVTx4BuqGkcd5YdCRVV/lWQ+snvANXC0Yv34DonJNskzyF5pgEDRFQ6ActXzN8v7kA/n7DvsfzrcMZrf5ntZkOkIZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAFEYnDOT9eWcDTZSxyHNacLa0a6evqvAOC1nhPlTEU=;
 b=Ip2Fo8ZUZIlsfzqUT26+AAxIu7gQLToojVwoEHHwQOMadsk7DCxHaS2OhjIuOkmT5um5+hV/8ARnO9fRfiZFi2n/KQmGd4F0ICx0L4P+dNa4Aa2u7PR9VjclfA78RPfEMzaAgaWqJNAMJwdY+1cAKaR6mQO3XSFETRwqtNvTIfqhePHNDqK81WaVi0TW5pQb4ajLgBh38BPniWdzL1wN14ox8hH2+TURlllf99mzcslpnNeAA2AixyWTOpBhqCti+GoqHHM1IlfLkdC5LZOp8eAnlRWuja6EwPL/WGtvfQ3VSn79ITPyjtne0N4c7HPJ97q+5icrYPtI2FW9U3uC4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cb23441-d8c1-5640-d630-30881841db0c@suse.com>
Date: Sun, 8 May 2022 10:34:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] build/xen: fix symbol generation with LLVM LD
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220505142137.51306-1-roger.pau@citrix.com>
 <cc494c68-787a-3cb9-f192-48511d5577cc@suse.com>
 <YnUjICUinDIiNJ3p@Air-de-Roger> <YnVAPMZ0+dd9jLF9@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnVAPMZ0+dd9jLF9@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DB6PR04MB3159.eurprd04.prod.outlook.com
 (2603:10a6:6:11::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d35e5c4-c031-4834-f980-08da30cd9bc8
X-MS-TrafficTypeDiagnostic: PAXPR04MB9325:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB93253F3880788C7B716E10A4B3C79@PAXPR04MB9325.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Isl8c7pIqkvLLG7XSO5kU3XknYAZgEbDOkfOeCK3Za24sf1+jT0G0yX93H/MG2XxsHm2P0PKMjIG5D78lw5/D8rS6l/sO2ReVpOPF9elBkd5gfjwCu59u1Saz7CHwaGcetwf9qbUr4GJKx0g8fNie3Zr7Z6sxijU1+9zNJmEBFEgjNLae9J1/mOp3Wa97Zup08L4IZdUYFOPN43A2vLdsDeco0FWYss00aWaE+X10lC3d6prboRLZ82w4fqke5VXu5LiR9SZE5oMUpszC8j9gLAeBfJUuYPNorkmYizI21aHAE794UIXiCFflTKgkKeo4hYrnBrsIdJjH8qRhkvV9v4UkrhfcCh38BH9nNS1pLpcZDi3otAMvJD0UGQA2im3EegcwdNNz9UhpQAW0pqvXbjUjl1aihQ/as0UeDmyjk7AkFPrBjWw9IG4bO8TT5fi6qhiVcOxANhqwN81f5dg/2td8Zdo87SHW3KOBLz3gDEgQW/b07EJ2oSxtiz68yFT52ZDxZTTXu1I4Nke4zJX6W4ClV86EGM/FLVHZXicGKti9zpU7uCfyucgnnlSeYFvhsoFCqdVI/Q1mqGKwJY1TcAGFK3jvpdhDdHIv37dPr9W3rHztwlUBVkKTlyodT/kcA3DT0PYyjSp0d7NkPPfLWJkoiwEF9tzkFYhs8EskofdqGquID/QuxsierxIbQhBFSe/4rXIk5PAIF4tXvJl4ha9zWjcbos1f18FLDrz9xp9OkgXP+JiGjjljEoAn6Ihu5ga0nmSmJj0P3EZw6rLicwe5XQ+Q9RjuBaaKAmGhW1gNDMQVZjjnQgvMBNp6n3F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3159.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6666004)(2616005)(8936002)(6506007)(6486002)(966005)(5660300002)(53546011)(508600001)(6512007)(38100700002)(31696002)(186003)(86362001)(2906002)(83380400001)(316002)(66946007)(36756003)(4326008)(66556008)(8676002)(6916009)(66476007)(31686004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TXzJbZBQE7Y5hCRHjuygxPBdMWSjxVDsswZtVvSlpENpvY/SCnRg7qu+wSw8?=
 =?us-ascii?Q?XcGCqDxWgsG8P+zLWy72nIi1fDf665m5LgTD1WVeXjaPMGZ38zLhaXF3s/Fi?=
 =?us-ascii?Q?O3n7K5uYTRTjEWJu2d+v2eWIj/UbaUEubv/Ws4mbY9qo+ZoYbvqDuNwGgHo7?=
 =?us-ascii?Q?Km9/hFAzQKmoJ4K1Q0YV0Pq5CzBB2MeYCNijQYTB14iXu94rnQWBvv33CRrd?=
 =?us-ascii?Q?wLX1tCgCTGEV4AH0sG47DojBrvhPcdGsY+KoRANp0xzNgEWkaUtWTn1pdJEl?=
 =?us-ascii?Q?CrdR/Vrcqxf1ucKJ7+N9gZnmtmHbjfMvJz/O9AgIWkYb2xYU2yPNYPCmHoHv?=
 =?us-ascii?Q?Q1mv/SrBLOKGudIy4ptxbv704eDgIrrQSIMH3qloqV3Eweay2rgEFofYnivr?=
 =?us-ascii?Q?oL7tUSqEgDP5H/Gze9IM4hg3JibHzqEmCKbDGuJMniGuS0617CHzIGIUympU?=
 =?us-ascii?Q?tb2pCr1KawcV/mXGlA0D/xgwjMrx1LFglCtoJl67XVzutWzdGg+ePwqhevp+?=
 =?us-ascii?Q?+tHnnpK/InG/jBM4vCddmg76MlZ7x3gj4hN85sm2kT8nvaCaupo9Gc7me/6t?=
 =?us-ascii?Q?U7FgJ9MGAadkTdHrroBT3CTbKRvzDGS8GTzwI/JgMFbdTaEtD34EnXQxtiTa?=
 =?us-ascii?Q?jwe7VLY9x6sJAS0Six/lbMAhpnegZQ9zRKlnjjKceROa9BYBLcjkVqIn41US?=
 =?us-ascii?Q?wKJa4pnD+bIlcTHnnSRuMmCPG/85xovDhFeUCK0GL17gv8x3sHItjFzXB3ZM?=
 =?us-ascii?Q?Z6r58M+gTc/JJXL1b5IGrx9IrqAVO+HhJalTmH35MsOVslsvzzmW+BUtSm1m?=
 =?us-ascii?Q?3JoTtjz/QWdUMvd+YYpVSlvAnPyEpge8nqW3jK38zX3IDp6TuV7R0tLlmxBq?=
 =?us-ascii?Q?QXX0rdW1oQEq9z6fEHq6eogMWHVvHzgneL8FvwCUPkFF4BYojV5h8mK8Xsaa?=
 =?us-ascii?Q?aNjFGWzgi7rgzEaF7u85vrF49W4uQV5f81Xk95J9kANoIH1hgDLFxCMDduVv?=
 =?us-ascii?Q?wXQrGElwvPT3Gh9t4qlrJRttVIALZknR6+eGL58ZTcHhwlkvEsSGnfvHiNve?=
 =?us-ascii?Q?ZXG2v1XhK4cdom/r59C+REwGNfxxNUhhp+qREmW2inc+ErrkjgKIha9KCqvj?=
 =?us-ascii?Q?Kv7yHZ+8czLId399QRpsl0wAw+NKzyzv+T//ts5+NryV/PCQcj0aTKpGjsUy?=
 =?us-ascii?Q?LQZTVySfUqJiXNOjOP0Qw4JfJUSY5Tr2c0Bdg3svq+woukdSCGx8O+rD5XVH?=
 =?us-ascii?Q?jpjpqz5unIqLIA5Ir7tjPfldeTkqi70zki57Ym58fRvkBp53Yh67FM//YZ8k?=
 =?us-ascii?Q?b7I2XOyQBWJvHMejdUx7zX4NM3iyRfFc5i2QZzfHR7M2M6DLcsgnM++eBlll?=
 =?us-ascii?Q?DNsRpnFcJu53DNs9EExgJQgIB2DwE8Vjou5B0/Mxzjzv/rN5oSon0qVpfnTI?=
 =?us-ascii?Q?9ZCcW0hoi/l3w0BPYS9xgELuuCBJklRoHSi0f2nVqqeY3BD11fEx9xt0KMFL?=
 =?us-ascii?Q?RqG0SB4aA66S5hOPoe8oTWvg8hkWI05mutp+r/z6wDhIoVnaFS11mdPMTHIc?=
 =?us-ascii?Q?LH0Lcx+iNj3i69gznQAs2KlYAFMgnicbIXCfLTJuQH56Bk4oFcrLyodqYr9d?=
 =?us-ascii?Q?sAI8vVNEtRSN8oMGfWNEvICIGinXO4aEy1hYbpUzZo0yuzGKNp+mc5suPsal?=
 =?us-ascii?Q?2QBNADjDoVwn226R1QFxe+ohaMN7IbECSEQAEIhTySRQjKmiH4VZE/fBZjtT?=
 =?us-ascii?Q?cwYT7no5it4c9Ze5p0EvWE0VUDh6JSMF9UcRZymR4fGN7TRh3IrLXNqhGVSW?=
X-MS-Exchange-AntiSpam-MessageData-1: J9YWVZ1a6B6yHw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d35e5c4-c031-4834-f980-08da30cd9bc8
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3159.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2022 08:34:46.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkRuEUsWnkYR6tSEJYTsfgzF8XqCHXBoIGVy4RfFbNRc5iJYgwyfvGC0lBCF5O9jJmcHY8BQgZciFwSrAivq4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9325

On 06.05.2022 17:35, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 06, 2022 at 03:31:12PM +0200, Roger Pau Monn=C3=A9 wrote:
>> On Fri, May 06, 2022 at 02:56:56PM +0200, Jan Beulich wrote:
>>> On 05.05.2022 16:21, Roger Pau Monne wrote:
>>>> --- a/xen/include/xen/compiler.h
>>>> +++ b/xen/include/xen/compiler.h
>>>> @@ -125,10 +125,11 @@
>>>>  #define __must_be_array(a) \
>>>>    BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&a=
[0])))
>>>> =20
>>>> -#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
>>>> -/* Results in more efficient PIC code (no indirections through GOT or=
 PLT). */
>>>> -#pragma GCC visibility push(hidden)
>>>> -#endif
>>>> +/*
>>>> + * Results in more efficient PIC code (no indirections through GOT or=
 PLT)
>>>> + * and is also required by some of the assembly constructs.
>>>> + */
>>>> +#pragma GCC visibility push(protected)
>>>> =20
>>>>  /* Make the optimizer believe the variable can be manipulated arbitra=
rily. */
>>>>  #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
>>>
>>> This has failed my pre-push build test, with massive amounts of errors
>>> about asm() constraints in the alternative call infrastructure. This
>>> was with gcc 11.3.0.
>>
>> Hm, great. I guess I will have to use protected with clang and hidden
>> with gcc then, for lack of a better solution.
>>
>> I'm slightly confused as to why my godbolt example:
>>
>> https://godbolt.org/z/chTnMWxeP
>>
>> Seems to work with gcc 11 then.  I will have to investigate a bit I
>> think.
>=20
> So it seems the problem is explicitly with constructs like:
>=20
> void (*foo)(void);
>=20
> void test(void)
> {
>     asm volatile (".long [addr]" :: [addr] "i" (&(foo)));
> }
>=20
> See:
>=20
> https://godbolt.org/z/TYqeGdWsn
>=20
> AFAICT gcc will consider the function pointer foo to go through the
> GOT/PLT redirection table, while clang will not.  I think gcc behavior
> is correct because in theory foo could be set from a different module?
> protect only guarantees that references to local functions cannot be
> overwritten, but not external ones.

Right, since there's no way to tell the compiler that the symbol will
be resolved in the same "module".

> I don't really see a good way to fix this, rather that setting
> different visibilities based on the compiler.  clang would use
> protected and gcc would use hidden.

If gcc's behavior is indeed correct, then moving to protected with
clang would set us up for going through GOT/PLT there - either right
away (if the implement this like gcc), or once they correct their
behavior. I don't think we want that. Therefore I think we want to
alter visibility between compilation and linking (i.e. presumably
right in prelink.o), going from compile-time hidden to link-time
protected. That would likely be closer to what your original patch
did (sadly there's no "convert <visibility1> to <visibility2> option
to objcopy, and making it have one wouldn't really help us here;
it's also not clear to me whether llvm comes with its own objcopy,
or whether they re-use GNU's).

>  I think it's unlikely to have a
> toolstack setup to use gcc as the compiler and LLVM LD as the
> linker, which would be the problematic configuration, and even in that
> case it's kind of a cosmetic issue with symbol resolution, binary
> output from the linker would still be correct.

While likely moot with the above, I agree that we could make such an
assumption if need be.

Jan

> Let me know if that seems acceptable.
>=20
> Thanks, Roger.
>=20


