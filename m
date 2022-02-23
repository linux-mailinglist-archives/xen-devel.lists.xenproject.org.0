Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FF4C156D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 15:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277395.473876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMseK-0004K0-KV; Wed, 23 Feb 2022 14:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277395.473876; Wed, 23 Feb 2022 14:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMseK-0004Gf-GQ; Wed, 23 Feb 2022 14:29:48 +0000
Received: by outflank-mailman (input) for mailman id 277395;
 Wed, 23 Feb 2022 14:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMseI-0004GQ-Tw
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 14:29:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c219ba0-94b5-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 15:29:45 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-cY13-Bf5Pt6PboSycw268g-1; Wed, 23 Feb 2022 15:29:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5947.eurprd04.prod.outlook.com (2603:10a6:10:83::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 14:29:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 14:29:42 +0000
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
X-Inumbo-ID: 0c219ba0-94b5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645626585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xIdKrvfeB4WO/QYtbzJorRsITmpWIWfeO53pg3NB/78=;
	b=cNiUszxSNixcIxJEXk2hUayHFK8vpWyvM/9N+523EkyATx+GrSzED0wGFCK/bjTAeyziKR
	R6WeAOvMJQpzJj2YfeAlFQvwbyyaRAB5YGBjqJeEQbEmKQohFnZYJ6IN7DumezJLi+vDDy
	1xsCt8xEhJtVq/PYEveo8CQx6bli4X4=
X-MC-Unique: cY13-Bf5Pt6PboSycw268g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3DpNYxzkPwZDMqdO57iMMQIGaQULiuUXt/fY5uQ3SofD6Ravt61Q2Dar3NaNFT88ZdkPAlCzojcv2K0FC2OflKl15ZhTvyNnXYGQ4elNlfE3mlOBVLzmAzw0IW2cYRtUuARLmE0zbY1beiYjRrGyr2rHHmW1TsglmBqAk8IDPPbBjiTTj1Bzs6x1QbrN7ysC+tzQpf0tRtJUGbR/HMga6Jtsjh3pkmh+LdpQr2CeKjCrZ53bfK/mPcqNlehD7dIF9mzv0dG5fZEcZpba6SLK2rcMxR79R47zLpC8xPONVW9PlI2aEfH+G0f0KCCjybeLlhwASSZV53Xh473S8vJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AP0wv/rDw8QLXhERmaitdBAiW7jkpfZhtNATeW13Ko=;
 b=CA8pzuirXKY1OBtkZnRdCQmthyhkbh4YJbRMbbhdwLsFNmx/DJ9/l8TZqucdsQgFQRINmOebA2t6j/mU6qXlysjs56zVXjem444VUvHA2wPircJPQKb6zlwCq+fyVeSy8ojpE979otVKdUQ7GiIj9A2zxuQYPzHEgrdyxIeaqBtj3QldYxSDMXovoaLFqLsZFMi4cEaodKQdDCrr9Wo66FanoJ770mFUWIzNcyChQmdeRqmiavnWmFf3gR686BOTNrMoYgwHc75s/OjYVCUhfnRfSppDiLuQm4rhGQddXZjiDbaqmUmQCUYhfAoiwo+NylQnq36cm8y+PYJR5ib5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29040861-0b89-d376-101c-35d749653837@suse.com>
Date: Wed, 23 Feb 2022 15:29:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 60/70] x86: Build check for embedded endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-15-andrew.cooper3@citrix.com>
 <48241c60-294b-782f-7217-45a3dc929c38@suse.com>
 <505a8553-5930-762b-ed07-f8f49df20064@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <505a8553-5930-762b-ed07-f8f49df20064@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0845c134-ee3f-4162-9b07-08d9f6d8ee7f
X-MS-TrafficTypeDiagnostic: DB7PR04MB5947:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB59477FEBCCEDBE91E31EDF78B33C9@DB7PR04MB5947.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hkNUGPN/mhdQjCTbC7XIilpshpcIgYYt+cWNsH4hpx4XlzPWyI3WV0M0s2af+GjmlkbOo6/ygC9pgYc+8StZSX6kzEThsllBh8fL23ppZhx25FdOLfuyXr2Om+Ljy8mGiwfhVYe0/ekJVGSMjDUuH/+H1RLjCoxCVwoWom+SKl0i3rqVitQbiwvSou7uM1yrx3Fpd3Ej+uXrwVjZgqheLjyeMwrxeTzhQpsmJCmGUCy+Y3WkXDmo5BKlai9aNoxkmuW6EoOnjvNA3Yeqzu6TZcweqRwMMw3xBo3zUh5xG16/VVIod9BWk4eOj36BZuhyti7cub0nkl5ye1cJtjIdr5LUmRc1cRmqAaMbHHrYCLt+nDWDkoReSpGPnyCylIv6sN0OnA2UgmRigHGTGdO8W20HxNtjBFA1E5SjxuyzCP4wPUB9LSIqT7yIM3hpmprtbxGXIGxlL/wbRqwixR2BalVJkBjNn+3zgF0Fx2X+VNDbMm8+UWAA4Pj3gWkJD9lP4ua/xRTiQtnTcqzyjdnvaywGZwl0PeBJttVVo113ciBagy6iG7sUK8y4qnZuTGXuIps2u4zX2Ad012m5LH6qGG62tCy5jEl/fBiB1RYp0w/h4rRipbWupwG+lVqsejoeYgimaH0JZAJ9FJKfqFsp9t2KVIO+94meomVL3kdUGgxlx760NeQa34RTDADbwcVbwr0dfMiDG1DAAGHQg7MbM/e5Os1QaQH82BcOk6fyT3L1a6O9T09UwLHDI61V3TOt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(31686004)(54906003)(508600001)(26005)(6916009)(8936002)(6506007)(5660300002)(38100700002)(186003)(316002)(36756003)(6486002)(66946007)(2616005)(66556008)(66476007)(4326008)(86362001)(6512007)(8676002)(31696002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6RViBvRvt5a2lveMtRY6opMrz1F+WTn7fdAAqPOOJorIhLL37pORp0mwjco?=
 =?us-ascii?Q?/zM4RdtuFbM8lvsJ1n4/okfgUq9njoZjH7q1WoE7RGkvSCiEvrxqgI8Z51pr?=
 =?us-ascii?Q?V4NIb9zUv6u+wnoyzyfdu6vBCS1tYFMPYUxs7j4ahx2IfzZ3Avy6WOsLDfm9?=
 =?us-ascii?Q?NmgCIKqGeLg645m5FQS489+97vu3ZEELt7+sLOIjh+oSA6i2qBxx4Ux5Uky+?=
 =?us-ascii?Q?7KkGpQKLpgxIc+tVQCGJzAeA4EWbr2BG9Yfz+OfRcZV5eq+CXFdD6rQmAtPk?=
 =?us-ascii?Q?TG7GHYDVm/ULAR8d2b1M4J2A570DeWGoOIEGBJrERi+cfSERs21aYA/9O8/S?=
 =?us-ascii?Q?I3gPLADz0EIV0EfSS/lEKGID7ogGvB6F30UtbJRBbztjlV/t1nKVDHQVNQrN?=
 =?us-ascii?Q?ANV7Hze+VihFmVHRE1x41GaOfHEkapm6J8esyjxlH1zRgs+yYd3f7h7OvZqG?=
 =?us-ascii?Q?P+K8StwNVAO5CwyStg9h0s0KySh08zDBFn+6gpHNR5iJPlf/LWDwrGNCJA+h?=
 =?us-ascii?Q?jIvanAMK8YNo/YMx5BMilAoO70RECs9PVioka1z4dvh8RDAONrl9NTmJV6HA?=
 =?us-ascii?Q?/uLoOfzeUeXZLZTfPHMEL/zed16WboXWk1KIs2q6UiAmz0lEf9vVW5tp9Alz?=
 =?us-ascii?Q?g0fIUgZ0U6rjaQI8res9yMAa80Xsog2vlZaMr3liOvpi3p8+faPp8SbqQVCr?=
 =?us-ascii?Q?SN/LKDn+PYT4SBzeVgF5vhBGHr15htphh436djNaP4tPDRfV4SPMdn8jSi15?=
 =?us-ascii?Q?4uRY+vRWB8zW1QB4Iez/jvmn72mLouz31qsiYjbB8unsaKp3aDuJ0Dxib/g3?=
 =?us-ascii?Q?y7/84GZa5i4BhJbjAgQ988dmvQLa+0M1JGRx0vd/OWu87ISQiswe7klRtHGW?=
 =?us-ascii?Q?6TVICTa1puN3nNHKLQ14WmJuqByHi168erb6BGmXk0Vcu87apZ8im4jF7V4o?=
 =?us-ascii?Q?61VijTuNz4qni6AQUDHf1GgptoXPJiUg7btQACX+GykeGrUEp6SzVU/J4Ast?=
 =?us-ascii?Q?RmX+NujvMlWzyFlOQypzUjTJDyuhkQGx3uwx5Qh4i3x49w3hOOmPQKyRZxtK?=
 =?us-ascii?Q?CVZDlCTeha62zsqbynLyGDGeLa7Ju1Uwpq6mb2IP7WfXwXW0WJeawrYipqu9?=
 =?us-ascii?Q?hBn0b4WouXNaeBq4L9+p23CGs5XkuiJcrYloAZ6b4EtuUHMqjj3rbRfDA3HX?=
 =?us-ascii?Q?CzM/dAOfVIB4wgrO20NyrUZdu47cvr2ODeBQnOMlNmdGjeigZBWFBd+ir+wu?=
 =?us-ascii?Q?fUp4bbIDnv/S9YGhC5e92U50K9ygS8JcIGmnjQMfYLlXjfuySw4zRIKaSuhL?=
 =?us-ascii?Q?8YgMoGXy6JvcnVkHKDi9PYrVD3vLJcqeqMGeQ0vpVzoWgnmkmPqWKYYrlxU3?=
 =?us-ascii?Q?EvNIKA17CQjvwzwekq/ujdUw+sJl0IgV1Omntjm8Bsi+pK8SIYwV99on8omH?=
 =?us-ascii?Q?nM8YaxEgK/UbmJvCcxyuzEHujJsu0m2+kxmRGRXSf2X3ejBGMq3svBaICmRg?=
 =?us-ascii?Q?71hLsANGfjq1g/FiWRc1QzrmWLQPNweeaUqjike2fyViwR1tbP1QAONzYaZ+?=
 =?us-ascii?Q?EfOWGpT+DKPCTgYrhSA523djYeBjHabbp0eo4qwpFbqbhWzNenzYvW7L3h4g?=
 =?us-ascii?Q?wWWghvQFO0/Mgo6cf/pzezM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0845c134-ee3f-4162-9b07-08d9f6d8ee7f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 14:29:42.6063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uHfbOlQ8m/AZ44dE+ashUNg3Mguqhy5Ri/Rv8LVPnH37xTUijI9Mbz+zHE0QGYDSpV+/mN6QFYso9RchunaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5947

On 23.02.2022 13:05, Andrew Cooper wrote:
> On 23/02/2022 11:31, Jan Beulich wrote:
>> On 22.02.2022 16:26, Andrew Cooper wrote:
>>> up on a non-instruction boundary.  Such embedded instructions mark lega=
l
>>> indirect branch targets as far as the CPU is concerned, which aren't le=
gal as
>>> far as the logic is concerned.
>> Thinking about it: Wouldn't it be yet slightly more reassuring to also
>> look for ENDBR32?
>=20
> I considered that, but it's awkward to do and doubles the length of this
> already ~0.7s (x2 for efi because this step isn't performed in parallel)
> delay to the build.

(Side note: In general the two linking steps can occur in parallel. An
exception is when the note.o need to be extracted from xen-syms for use
by xen.efi. But that should happen only with old binutils.)

> We do not have __HYPERVISOR_CS32, so ENDBR32 will yield #CP[endbr] if
> encountered.
>=20
> If an attacker has managed to edit the GDT to insert a compatibility
> code segment, and hijacked a far transfer to use it, then the absence of
> ENDBR32's in the binary isn't going to be an impediment.

True.

>>> --- /dev/null
>>> +++ b/xen/tools/check-endbr.sh
>>> @@ -0,0 +1,85 @@
>>> +#!/bin/sh
>>> +#
>>> +# Usage ./$0 xen-syms
>>> +#
>>> +set -e
>>> +
>>> +# Prettyprint parameters a little for message
>>> +MSG_PFX=3D"${0##*/} ${1##*/}"
>>> +
>>> +OBJCOPY=3D"${OBJCOPY:-objcopy} -j .text $1"
>>> +OBJDUMP=3D"${OBJDUMP:-objdump} -j .text $1"
>> While embedding the arguments here shortens the lines where these are
>> used, the appearance especially of $OBJCOPY with a single file name
>> argument ...
>>
>>> +ADDR2LINE=3D"${ADDR2LINE:-addr2line}"
>>> +
>>> +D=3D$(mktemp -d)
>>> +trap "rm -rf $D" EXIT
>>> +
>>> +TEXT_BIN=3D$D/xen-syms.text
>>> +VALID=3D$D/valid-addrs
>>> +ALL=3D$D/all-addrs
>>> +BAD=3D$D/bad-addrs
>>> +
>>> +# Check that grep can do binary searches.  Some, e.g. busybox, can't. =
 Leave a
>>> +# warning but don't fail the build.
>>> +echo "X" | grep -aob "X" -q 2>/dev/null ||
>>> +    { echo "$MSG_PFX Warning: grep can't do binary searches" >&2; exit=
 0; }
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
>>> +${OBJDUMP} -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>>> +
>>> +#
>>> +# Second, look for any endbr64 byte sequence
>>> +# This has a couple of complications:
>>> +#
>>> +# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, ca=
using
>>> +#    the grep offset to be from the start of .text.
>>> +#
>>> +# 2) dash's printf doesn't understand hex escapes, hence the use of oc=
tal.
>>> +#
>>> +# 3) AWK can't add 64bit integers, because internally all numbers are =
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
>> ..., like here, is then somewhat misleading considering that the tool
>> can take one or two filenames as arguments.
>=20
> I can re-expand them if you'd prefer.=C2=A0 This would be the delta:

I'd actually be happy to keep "-j .text" where you had it, and merely
move the file arguments to the actual invocation lines. But the way
you have it with the incremental diff is of course even less
"unexpected".

Jan

> diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
> index 85878353112a..3019ca1c7db0 100755
> --- a/xen/tools/check-endbr.sh
> +++ b/xen/tools/check-endbr.sh
> @@ -7,8 +7,8 @@ set -e
> =C2=A0# Prettyprint parameters a little for message
> =C2=A0MSG_PFX=3D"${0##*/} ${1##*/}"
> =C2=A0
> -OBJCOPY=3D"${OBJCOPY:-objcopy} -j .text $1"
> -OBJDUMP=3D"${OBJDUMP:-objdump} -j .text $1"
> +OBJCOPY=3D"${OBJCOPY:-objcopy}"
> +OBJDUMP=3D"${OBJDUMP:-objdump}"
> =C2=A0ADDR2LINE=3D"${ADDR2LINE:-addr2line}"
> =C2=A0
> =C2=A0D=3D$(mktemp -d)
> @@ -37,7 +37,7 @@ echo "X" | grep -aob "X" -q 2>/dev/null ||
> =C2=A0# names/jump labels/etc, so look for 'endbr64' preceeded by a tab a=
nd
> with any
> =C2=A0# number of trailing spaces before the end of the line.
> =C2=A0#
> -${OBJDUMP} -d -w | grep '=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endbr64 *$' | cu=
t -f 1 -d ':' > $VALID &
> +${OBJDUMP} -j .text $1 -d -w | grep '=C2=A0 endbr64 *$' | cut -f 1 -d ':=
' >
> $VALID &
> =C2=A0
> =C2=A0#
> =C2=A0# Second, look for any endbr64 byte sequence
> @@ -56,9 +56,10 @@ ${OBJDUMP} -d -w | grep '=C2=A0=C2=A0=C2=A0 endbr64 *$=
' | cut -f 1
> -d ':' > $VALID &
> =C2=A0#=C2=A0=C2=A0=C2=A0 split the VMA in half so AWK's numeric addition=
 is only working on
> 32 bit
> =C2=A0#=C2=A0=C2=A0=C2=A0 numbers, which don't lose precision.
> =C2=A0#
> -eval $(${OBJDUMP} -h | awk '$2 =3D=3D ".text" {printf
> "vma_hi=3D%s\nvma_lo=3D%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
> +eval $(${OBJDUMP} -j .text $1 -h |
> +=C2=A0=C2=A0=C2=A0 awk '$2 =3D=3D ".text" {printf "vma_hi=3D%s\nvma_lo=
=3D%s\n", substr($4, 1,
> 8), substr($4, 9, 16)}')
> =C2=A0
> -${OBJCOPY} -O binary $TEXT_BIN
> +${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> =C2=A0grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
> =C2=A0=C2=A0=C2=A0=C2=A0 awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x=
'$vma_lo') + $1}' >
> $ALL
> =C2=A0
>=20
> ~Andrew


