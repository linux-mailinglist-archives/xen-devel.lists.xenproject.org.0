Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915734B8324
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 09:43:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273771.469024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKFsn-0002VH-CZ; Wed, 16 Feb 2022 08:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273771.469024; Wed, 16 Feb 2022 08:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKFsn-0002SS-90; Wed, 16 Feb 2022 08:41:53 +0000
Received: by outflank-mailman (input) for mailman id 273771;
 Wed, 16 Feb 2022 08:41:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKFsm-0002SM-8B
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 08:41:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 485c9b1d-8f04-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 09:41:50 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-88pdkn36O6y8ZFF5rGNB8w-1; Wed, 16 Feb 2022 09:41:48 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2837.eurprd04.prod.outlook.com (2603:10a6:4:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 16 Feb
 2022 08:41:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 08:41:46 +0000
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
X-Inumbo-ID: 485c9b1d-8f04-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645000909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3C9KLmoWGgH3dVrkp1s13qieYY2/tIcI6qYtHjWt9pw=;
	b=WqEEy28whNjEFV4r8mGpz7gVfmwDgQLZgMaqLMXShe+G/6lAex1yOeCQcYF8EY62bBO3sR
	04QwcM9DO1lVJHYvIOHZVFBp8Q3dLuLUMVTQhbPGey/FUdNBcBGocdRWr+k1vSENNV55+n
	6bNXy2kTGq5EHxDfWUZXDX16j1QwnXQ=
X-MC-Unique: 88pdkn36O6y8ZFF5rGNB8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA1wyMFb7YHy2hihRgLHS/tZW5/Maim9PfZAJgT/cA7Atv+oBxiG04H/tbgz0WfvI2ueEObgdnCxe1ce/HgibAy2Ok236Zqb8YKIKf30dndOgyVeovf2TlKX2j42r9V34U4++rPbHJU0OZz33Z/DoQpS+FA5Wu68qzmSioztfJgdG0iN0hQHiLwt3wMxZmI13jQ/uGDQHHak1LwxerTxUsmIL68lqvFxq5gTKveEouLqL0aZnBx8X2C1cDtHI7sgVj3h/M47nlFSMnUZRSCALH27qs5ahf0ojBtDpAMwRHVHIjeI/FCHhV2AByJ3lTIP/sEc+IqzKdlp9sIyS9BKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alk9KMejPJ+5ydPZltrpBZ3oRaO32Id6ixGtBB0nXbU=;
 b=YQWwi3LY91YvKXF4MkfotNccA32etA85midRNUHGJP27RUF7O+JOTop/YhMGTDTxSmhqotp+k73yrQ3QA0QyAiGCBefXiIy5aZU9uYGL/yD3VWhFeTgpr/sLXa28zp4iuBCWyuwRrjNetoBP3V/S5fUhdjQMC+7cg8iO9vv67PeShwr5NEWsaGad/BdQu8BeI9AwjJZRgcdtke6ysLFdvLp2uLACtYQK5cUkmtrM/klPLTBaUmlG9enYQGdpTojS+WgfsK4Qiu4XtqBLqq88cMcQamy7jLaAa3Oi64mI3gvVCAdXfYCAadGLk1lcHg5N6fDvX6amzDnExreMK4GByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c5ff089-780b-9965-4765-be3ef210a913@suse.com>
Date: Wed, 16 Feb 2022 09:41:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 07/70] x86: Build check for embedded endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-8-andrew.cooper3@citrix.com>
 <95c29039-302c-256b-d381-2b5b8b9c1a4a@suse.com>
 <8c6d9714-7e45-1603-a5ad-d49fc060304e@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8c6d9714-7e45-1603-a5ad-d49fc060304e@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0351.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330de225-4ec7-41d0-0cf1-08d9f1282a67
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2837:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2837DF761AF3992F530703B9B3359@DB6PR0402MB2837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I48/Dh98dpQkEeLlcW/L+y5TbUua8g+mrhP+/D/zIHeDlRnb9NSeOuEpZMC27PkAN2LYdyR/kndj5AmqvHFo7Yyw1141hmrLi3VeQx9HjGvu9B6r2W6YV/0k/JYMPNp4UyI3Di6alHhRDMXWqVUhek+E4yJ5JMPnBq5yryRHhVUuWKcYAhUQvJG9Kduf0CtXlANnn2nqSNzV3PsJudiL/KsWSTMPetqZ5NsZ3/ycvid0Ci6ChyBP3pPUxrdJG8ZaQoWislqGFwY0owZiEt2uojQoIh3pItowIG/F58Pm/IUH7E0G61X/fiL9Envd7wYIZ7yljU7hKfwybLsJ8Uq7op0gITB5qj1Wd7Yf9gjgvNL6xwWLyoMVic/4D3PJH7l4mgFInpkliCoaxq2a2FgHDPk2VHbsuuylKEx1KvZHa8zyY3frSVdHiwzQ14/yB3CHQDJql5O1jp+AM+grPnN0UYC3AZ+Yu/ExuD/SYLc85K4pP3gOWZIfmnYRXMhg50W7Oru601Bw/U6dIe324DeFdwBf4a6ZlmaFivkE3+zAzr1HM2tSu7IVxbgFLiDwE0Is9TOjb4GPvw1cmrep0ejrmhLIu4CUW/rXvNStllxEBJPljZm99g4nsPDwRU7oJaVLDKdfdpcavuY33nIXZX7jKkIwM5pCPNtMVlygygThkYScIE8AANHyeuF01PC5JfN8Win1Q3VNFzz9drUPRGQbyGZJHz9wI3vrZZyeeov3mL4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(4326008)(8676002)(8936002)(38100700002)(53546011)(66946007)(6506007)(26005)(186003)(5660300002)(2906002)(6512007)(2616005)(6486002)(31686004)(31696002)(54906003)(110136005)(36756003)(83380400001)(86362001)(316002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9yKzi6P894kw0UDtRHjc0jvgSwm3kIDc1+MUt5qyO6foexNe32daH5I6+s1Q?=
 =?us-ascii?Q?Ke49O1sikUucyNw6N/dui6elCWQ/cW4PEMBwEevWu+TVHGD2KPeWyhSHqTNp?=
 =?us-ascii?Q?v16Rbcpwm6OhhSuWYwnRohTqneBoc2oqQrREElNxwW+MWC82+/lIcsz0aOgE?=
 =?us-ascii?Q?w2x90+Kfj+OYbHgIPT7ONQDHETV6J0EYF5Rlpo3LvmaCkQ0p3vA9q4P+EZ2b?=
 =?us-ascii?Q?GH1Mk+y0rX8xLE78vHF+/bUqTjG/ZSzgUMCAO35VGeHCm/pSPbwUgys/cFt/?=
 =?us-ascii?Q?Og7Md45Y4lEdxyZrhDfsHCUfi8wwDAUCA/HUJz1Z+1O7RzFvvckUuJLG5YFr?=
 =?us-ascii?Q?3ZItubQFDcsC8fz48KaUQ5qQKlkHmJv+JM2pMlQvkRz7UIxghbcUcqC9HPph?=
 =?us-ascii?Q?z9dZpKLOAEsrpwWJgGFVSUNeiJ7CWmuP6tENVcP6rGGMmg76FFgXnKOlMmG9?=
 =?us-ascii?Q?1AxQ+sn6u2XS0tbfRP35gmzD/hl7aHagrKoKTjntDamPuuX9ZJpwAivKRM55?=
 =?us-ascii?Q?4Hx/+2BrJQLke1LrP8UZjLj9ZmMM6we1w63GKygmBVecpmM5HsLeLbMI4puv?=
 =?us-ascii?Q?7OXgn3kq73UdxoyxeEGvfL4si4exV1u2IiUEjPEn/0/hZw4KukUCFLXYaDJu?=
 =?us-ascii?Q?2gAWnUqwpj858qwZxqRwQWqSgL8cP+amEL/pTxrvjgt69MMvqtD9DUvmngsQ?=
 =?us-ascii?Q?S5Kjs65A68Cid8OvfYrMbWw27/D2dJgDL+BYnxKIFxgyeIBVeJHgyWh65rNl?=
 =?us-ascii?Q?td3FSb3+F+3mpR0gCE+Sl1ye+3Y07i8Z2NWVyNyq80pA2DAIvZenNytOmhq4?=
 =?us-ascii?Q?g8ZVmAnyO7kImM8rtxU17uSI+0LvLZNkt8qnuZp7BK61QlTWMhVtMFHO4xDJ?=
 =?us-ascii?Q?t4uKJGmKH8+CXnec8IZ+aGGViML3CAnZ5HnlngR+LxX9/eW+C5UiQQIO0zp7?=
 =?us-ascii?Q?nYlsnXvXZ9OpkL4tGAw1z2ai8HBo1qFxo7Yg6PysYnLjP5TjGSXATUg9JfEf?=
 =?us-ascii?Q?qIEyq3io7XUM7IIfvrMeP8vjMcJ7b3G6At6TJRif3R/ntspz0a/QwZTuUtwD?=
 =?us-ascii?Q?61yWly4t8bC8vuppLQ5aRK8BjDqigYhZYAier9H0yJSVY5Z9X55MwBu5yP+1?=
 =?us-ascii?Q?SWu7fxVtdPcNnCOCKJraCtanKmkYvuzRmOVVrCeUDfP/i7QHodPJBrE5Cap8?=
 =?us-ascii?Q?5eBNDMaG51Qt7I1pxULbAQFgtIb118LIPzD/BAhrPmHCtBepwlvClAPgniGs?=
 =?us-ascii?Q?Qnac/molIedlVx1F7d82W6zdUcGx1PFG4E6ws/4YSysegquj9ocXwUUwzdlz?=
 =?us-ascii?Q?Kl1Ci4TmPfFiTclAuewEg27PGYlbGoiNUGLseNc+J8elNljtlFsD5CbB0ucX?=
 =?us-ascii?Q?KpIJUuN/rjPTJ+rJw+huAXqpCratb2dj3+mQi+tQBo5qE7rNPXU6XaKrnVVs?=
 =?us-ascii?Q?dTdoxGm5eUXMw6Vdbga2OdZuHxAiFsHy2N8zQkqhknAaNsi6iFBGVg9l4ri5?=
 =?us-ascii?Q?Iae9bGDf5MlXv4XwBgY47unX05HU45u9rgzurKozPURTDVaBW34ZTKgrUB7g?=
 =?us-ascii?Q?QvglUJFH4R5blBv6ay7Vi8yn75jlJI+yjlTdNdB2nbrrMaMKdh8ezG5kmJog?=
 =?us-ascii?Q?fftVnH5QO14JfG0WCda247Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330de225-4ec7-41d0-0cf1-08d9f1282a67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 08:41:46.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnRr/hS6XoTQX7GLUZie7i+i7vPFMMDYEdt+6B8yw2/S36pi8Ub7ZYKLVKl3Y7foWDnOy/XylLGe43ZYiwfFbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2837

On 15.02.2022 18:52, Andrew Cooper wrote:
> On 15/02/2022 15:12, Jan Beulich wrote:
>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/xen/tools/check-endbr.sh
>>> @@ -0,0 +1,76 @@
>>> +#!/bin/sh
>>> +
>>> +#
>>> +# Usage ./$0 xen-syms
>>> +#
>>> +
>>> +set -e
>>> +
>>> +OBJCOPY=3D"${OBJCOPY:-objcopy} -j .text $1"
>>> +OBJDUMP=3D"${OBJDUMP:-objdump} -j .text $1"
>>> +
>>> +D=3D$(mktemp -d)
>>> +trap "rm -rf $D" EXIT
>>> +
>>> +TEXT_BIN=3D$D/xen-syms.text
>>> +VALID=3D$D/valid-addrs
>>> +ALL=3D$D/all-addrs
>>> +BAD=3D$D/bad-addrs
>>> +
>>> +#
>>> +# First, look for all the valid endbr64 instructions.
>>> +# A worst-case disassembly, viewed through cat -A, may look like:
>>> +#
>>> +# ffff82d040337bd4 <endbr64>:$
>>> +# ffff82d040337bd4:^If3 0f 1e fa          ^Iendbr64 $
>>> +# ffff82d040337bd8:^Ieb fe                ^Ijmp    ffff82d040337bd8 <e=
ndbr64+0x4>$
>>> +# ffff82d040337bda:^Ib8 f3 0f 1e fa       ^Imov    $0xfa1e0ff3,%eax$
>>> +#
>>> +# Want to grab the address of endbr64 instructions only, ignoring func=
tion
>>> +# names/jump labels/etc, so look for 'endbr64' preceeded by a tab and =
with any
>>> +# number of trailing spaces before the end of the line.
>>> +#
>>> +${OBJDUMP} -d | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>> Since you look at only .text the risk of the disassembler coming
>> out of sync with the actual instruction stream is lower than when
>> 32- and 16-bit code was also part of what is disassembled, but it's
>> not zero.
>=20
> I'm not sure that we have any interesting non-64bit code at all in .text.
>=20
> _start is technically 32bit but is mode-invariant as far as decoding goes=
.
>=20
> The kexec trampoline is here too, but when I dust off my cleanup patch,
> there will no longer be data or mode-dependent things to disassemble.
>=20
> Everything else I can think of is in .init.text.
>=20
>> Any zero-padding inserted anywhere by the linker can
>> result in an immediately following ENDBR to be missed (because
>> sequences of zeros resemble 2-byte insns).
>=20
> I'm not sure this is a problem.=C2=A0 This pass is looking for everything
> that objdump thinks is a legal endbr64 instruction, and it splits at labe=
ls.

Oh, right - I did miss the splitting at labels aspect. Hopefully
objdump is really consistent with this.

> Only the hand-written stubs can legitimately have an endbr64 without a
> symbol pointing at it.
>=20
> We also don't have any 0 padding.=C2=A0 It's specified as 0x90 in the lin=
ker
> file, although I've been debating switching this to 0xcc for a while now
> already.

The linker script comes into play only in the final linking step.
Prior "ld -r" could easily have inserted other padding.

>>> +#
>>> +# Second, look for any endbr64 byte sequence
>>> +# This has a couple of complications:
>>> +#
>>> +# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, ca=
using
>>> +#    the grep offset to be from the start of .text.
>>> +#
>>> +# 2) AWK can't add 64bit integers, because internally all numbers are =
doubles.
>>> +#    When the upper bits are set, the exponents worth of precision is =
lost in
>>> +#    the lower bits, rounding integers to the nearest 4k.
>>> +#
>>> +#    Instead, use the fact that Xen's .text is within a 1G aligned reg=
ion, and
>>> +#    split the VMA in half so AWK's numeric addition is only working o=
n 32 bit
>>> +#    numbers, which don't lose precision.
>>> +#
>>> +eval $(${OBJDUMP} -h | awk '$2 =3D=3D ".text" {printf "vma_hi=3D%s\nvm=
a_lo=3D%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
>>> +
>>> +${OBJCOPY} -O binary $TEXT_BIN
>>> +grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
>>> +    awk -F':' '{printf "%s%x\n", "'$vma_hi'", strtonum(0x'$vma_lo') + =
$1}' > $ALL
>> None of the three options passed to grep look to be standardized.
>> Is this going to cause problems on non-Linux systems? Should this
>> checking perhaps be put behind a separate Kconfig option?
>=20
> CI says that FreeBSD is entirely happy, while Alpine Linux isn't.=C2=A0 T=
his
> is because Alpine has busybox's grep unless you install the GNU grep
> package, and I'm doing a fix to our container.
>=20
> My plan to fix this is to just declare a "grep capable of binary
> searching" a conditional build requirement for Xen.=C2=A0 I don't think t=
his
> is onerous, and there no other plausible alternatives here.
>=20
> The other option is to detect the absence of support an skip the check.=
=C2=A0
> It is after all a defence in depth scheme, and anything liable to cause
> a problem would be caught in CI anyway.

I'd favor the latter approach (but I wouldn't mind the conditional build
requirement, if you and others deem that better), with a warning issued
when the check can't be performed. I have to admit that I didn't expect
there would be no simple and standardized binary search tool on Unix-es.

Jan


