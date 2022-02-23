Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F14C114D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 12:32:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277336.473797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMprp-0001Lx-7M; Wed, 23 Feb 2022 11:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277336.473797; Wed, 23 Feb 2022 11:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMprp-0001IX-48; Wed, 23 Feb 2022 11:31:33 +0000
Received: by outflank-mailman (input) for mailman id 277336;
 Wed, 23 Feb 2022 11:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMprm-0001IR-Q2
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 11:31:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 242634e7-949c-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 12:31:28 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-MN91TbUtP5W9FgCEHB7WeA-1; Wed, 23 Feb 2022 12:31:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 11:31:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 11:31:25 +0000
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
X-Inumbo-ID: 242634e7-949c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645615888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiokagSwW7oft5YfoUtY1q5MIq5PaNW8aRtwexB10Dc=;
	b=m6EOszrLOrOX8Hq6R6Q7CoqO0syvmoTQvg0ynm7c9SRephkq5aYvDkQ5DJCjWunUPJ3Ze5
	ZIN0Yj1cBK3V/CUhAqnjzEFWokgkpk72snaCJrs4rHb1m44RvykOjZLN1IUWzoRzyqej4w
	7/oZnrWY3ClijuFgzI1qSf9MKwtBL5M=
X-MC-Unique: MN91TbUtP5W9FgCEHB7WeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTK0BQbJ1QP2vfmlmV+Vs7yGu4zhNETzuwXLSAxh6Fau+GjcpISy7T/3hrpjC4UPAi9VQhswm3BDSBV0DQN9LjQtYNdCfVbWvkNBXu6vHKF7IaYx6VQHJXKPWni0LEynsISYXpqM1WqKnP3r+7jXjf4v6OVkEvpO73ijTGJhkySQmV8CJ3H+Nce/OFn1XBiZ33HWBGDi3ur0VXOgZ/EAayd8OuMO/TcMtYu4cfGz5H9iuuSty2xjadD5KXDgu7Olf14mAFi8iyxEDRip/thYBDcYnMlK/Hl1iFfO0ZqfAr5wT4rypctRh1+Avpnk9hrUzPFiWsmXAH+aRcVLR0M0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTT5nBsFvcPRM7gkaZ9hXwUhZEF54Jsjj4N4/hO/hxE=;
 b=f70gOQRYFeV5uGom1KnaotP78+GV/+s/GwDapB42noznrdfSc3+da+jKAW9FahDAZjKOVxOwN/9qiZMUvNzIZ7iCJL2f/y32z5v7YsVd4EcBCZMCjAu2f+6vv74MjDXyeTX7w0qGcKUR1v05WW0QiyQmS4de8Fgd7pN6ww6lrCHqeM17Q3LofdNVscpMewTAPs+ZrxJkKU51ycU8dy8A9CTXKIc6ghpU9RFrhvD5KWhGel4r1gXHvMbAGrjTESKTE6NfSw6BllLKLXjlszcC8diiszT51AJ6yy4cE7PajiWxyfrOZLttMpbonHsqr1auDCnETI8qSbL9NJjdGyzgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48241c60-294b-782f-7217-45a3dc929c38@suse.com>
Date: Wed, 23 Feb 2022 12:31:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 60/70] x86: Build check for embedded endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-15-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e37ec452-7e7b-409a-e525-08d9f6c006af
X-MS-TrafficTypeDiagnostic: DB9PR04MB8137:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8137E306EF12643BB44548E7B33C9@DB9PR04MB8137.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yzGi1T2nv89fOPy/xvfzCCOXkTD4E3wAvE5A5cEBaSDaLVSsOuD7eFFvVEanTdQqRVTG4ud73/8JDmEVOL5tWhKZ+IEk8+3zK+7G+Zs75XRGONagKVsuodsy+ikt177qJLc5MrNmiYBqE8821Nfb4mBS7ZAJrRqGafWUXMjhTjurrM7YjJYH5hlzMVgwaH1CVxPmllzoPDS9BWukkdD1ZRXKL9tEMmjrNCfcBEFKVUqcDXTq+kzg89iMa/Ykr3nbB1iqS2I2RNwG2A3xZ467qU74fbO+ZF6yEM46eO24fgPKs/JEEXUjnwMRWj5DGsPis6tqcyCaFl+5DeRAHAvMnR+jvefhbLOOUehPRudGetBsThlvpjbYieJESXvl+Jc8ydV8pmrqKAmPwz6U7A+EA7qhW/tcR1e/1YAaVUYk+VrvLRLqF05jPJTki8cBSZ9t99fZSbDbavbzFlz8YrLC4mn2QY/mMTkfGpqsWlfPal9PCh5y/BzLOa72WszPn7svGDfjUmrr08mBI05Y87AIkzaZSxovLx62lmp8tiShdZAvueqM1weHopUqVSKBbbyGruTH8q4K9Ey76JpFfCpBaQToH/oxmVo2m3YzwbMN/IEo9NvMCPoNoNYFGavWJymluMFLJc0KLoTWgKICW7DJ9m/5YzmUO0n3I+467wq/5Xz6Lyk34r6APiEt9Ns7W6HvBWbTnyx9URRYvOX8Q24bDgl5exme38ACQMAnCwKkpcr4mFOLaOX5dX3cH3pZiZIF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(4326008)(508600001)(8676002)(316002)(31696002)(86362001)(54906003)(6916009)(66476007)(66556008)(5660300002)(6486002)(31686004)(38100700002)(2906002)(8936002)(66574015)(2616005)(6506007)(6512007)(83380400001)(53546011)(36756003)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4v6cGmNcLuw6hlFg36I0pHxWVRCT7WdrbPl6NbePHgtJGy7pdwGF3jYlFhI4?=
 =?us-ascii?Q?vaQRAmsmCfl8Rxfim+rZaa3PeB2Nzfg6d2SSxjBPpu8Ql5JjeSb2UuQ3u9EZ?=
 =?us-ascii?Q?9qxUhubK2kLFp7bGxAxNt/hBwlBosL6Ni5WLCxrYFs4vk3MKGM/YKWAbmM9+?=
 =?us-ascii?Q?ryuJUWqQFMjVahl3MJrYswGoV1OOPFHS5sNAGYmR7ltWZfT+H50mT/P6LTcl?=
 =?us-ascii?Q?UeqAKjHdccpUDza/2qecMIyziavI0bTBh7TOyOyTleT2P23ROqaSB8vgMcyY?=
 =?us-ascii?Q?qgTJkafu+2hQToQvA6hHiaVpeZvI0WKAzfJ1Iqr6dvenucVJ2nLS8mMo2tuu?=
 =?us-ascii?Q?Y2DRsh4h2V6OqmrXSs5lnxuxVzWU1lAlXZwo1EF/MEWxykQxcc+Dl25ZzIa1?=
 =?us-ascii?Q?CEZ4F1zkCC4LrFGWFeaSFVaRGac4+12guL8uMwoOMO83Y4T+/jGO33AuqqV4?=
 =?us-ascii?Q?1TEL5zaq3eubu8QHMEC9dcNYpuq/I3viMXk363W+lsYuFspvC7PjPGlxee54?=
 =?us-ascii?Q?gKd2AwEshsTWg957kzRiOTudfCuEi69nQQgFyi2wznPjqyBsLhwtU6t6VEYm?=
 =?us-ascii?Q?GfI7yMvZxh0lspkHLkFbMpjzB+TFnOD/sF7cJweWSj3uEMl3GVmoxlv/Qzw9?=
 =?us-ascii?Q?jTR+AKqBwcAiMTqWTuJhXLSAd03T57lBjIYBxpLEvK36qdFNxk3qATjkU8Jd?=
 =?us-ascii?Q?1mEusfhZMZ4d5DIPzklSdiQNQHe7u8vkrbV3imSfhW5HrErSx2a5MPS81IgK?=
 =?us-ascii?Q?6kTzLLw0PBoU2FeNFkWOnsLijf9zCxt8apFJXyGI/B8VDuZJli6IMPlnzRF0?=
 =?us-ascii?Q?tRp++fnfBL2XUhdXlX/Anjc6n79ZOu/vbDU2LXlm+EhLk98IMtOHFRQsrN4H?=
 =?us-ascii?Q?2xMFSXIXEnfU4JtC5sjoquCMhe59WnDakQrXSodX/1lLwYFWm7SqyOMvoe/C?=
 =?us-ascii?Q?hcqRWEqPqB0tyne4aSZ5ymPccuzW7Q5ZgKUBFseHIfKzKCB7C1f61jvzpJPV?=
 =?us-ascii?Q?wvWCJnZkhyh5Q2VXSBCW902suGUm9/LcW/Y8E35Z4SF6Q66sllrLqb82g3JI?=
 =?us-ascii?Q?JyiH8S0p1rz9L8JHEv86Jlj6bb44ebJWwLkZ8nq6451nrk8C7YhzTDhqBRZK?=
 =?us-ascii?Q?18588EzK//L4AHQLCOACAife96qqDlt4Nx3TW2zKoSGNNKj1PSmdkOHWIQil?=
 =?us-ascii?Q?7E+6ADBhSDa7IZKe0DYwcQBhycS92I4SSrRzuGIPaxQIOmBgpiye5jJcFNF1?=
 =?us-ascii?Q?lwGhU/MfE41sepOTqOhiAEN+gs4UpGPFyVUzdmlB32p2L76W9UvOofpZiQfn?=
 =?us-ascii?Q?cnBcPQ4dt0PvIuW4bFhgWK1th9YujLGl+gz+M7evFJ99KhkP/C9O6cRUlK4Y?=
 =?us-ascii?Q?o9k9W/PybpuFY4CtXxgiDnGxxclP60r0CqSdoQGxo2leyplkr37fspOjjT2L?=
 =?us-ascii?Q?277vIGj+g3a5/+/6gu0IuZjDDiXeCxK/CYgeTbpXEr2IYGv4kyTgPbmL0kVQ?=
 =?us-ascii?Q?nPchTUsZvekpFa7lg7Af22P6dpo03eCpykt6rBcqop1mONvt1tlJO+HebmsA?=
 =?us-ascii?Q?5VWJv/hKca17D5R78gUYzmv0nDVRt9n48m8Xymuz5f/hwLs3Ow3yqLrjxQzT?=
 =?us-ascii?Q?oiUbCiWgFD5U/GOFeUMMuiA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37ec452-7e7b-409a-e525-08d9f6c006af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 11:31:25.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +syzSNgB/f73vFM4AOvVERTM6YoKr/HkPDuarM2H6uAnOY2WWcEsZsLZzDsr0pAaoocyPlFN1AplGs3tYG63hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137

On 22.02.2022 16:26, Andrew Cooper wrote:
> From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> An interesting corner case occurs when the byte sequence making up endb64=
 ends

Nit: For grep-ability it would be nice to spell this "endbr64".

> up on a non-instruction boundary.  Such embedded instructions mark legal
> indirect branch targets as far as the CPU is concerned, which aren't lega=
l as
> far as the logic is concerned.

Thinking about it: Wouldn't it be yet slightly more reassuring to also
look for ENDBR32?

> When CET-IBT is active, check for embedded byte sequences.  Example failu=
res
> look like:
>=20
>   check-endbr.sh xen-syms Fail: Found 2 embedded endbr64 instructions
>   0xffff82d040325677: test_endbr64 at /local/xen.git/xen/arch/x86/x86_64/=
entry.S:28
>   0xffff82d040352da6: init_done at /local/xen.git/xen/arch/x86/setup.c:67=
5
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/README
> +++ b/README
> @@ -68,6 +68,7 @@ provided by your OS distributor:
>  In addition to the above there are a number of optional build
>  prerequisites. Omitting these will cause the related features to be
>  disabled at compile time:
> +    * Binary-search capable grep (if building Xen with CET support)

Nit: With this (maybe this was the case already earlier though)
s/will/may/ in the previous sentence?

> --- /dev/null
> +++ b/xen/tools/check-endbr.sh
> @@ -0,0 +1,85 @@
> +#!/bin/sh
> +#
> +# Usage ./$0 xen-syms
> +#
> +set -e
> +
> +# Prettyprint parameters a little for message
> +MSG_PFX=3D"${0##*/} ${1##*/}"
> +
> +OBJCOPY=3D"${OBJCOPY:-objcopy} -j .text $1"
> +OBJDUMP=3D"${OBJDUMP:-objdump} -j .text $1"

While embedding the arguments here shortens the lines where these are
used, the appearance especially of $OBJCOPY with a single file name
argument ...

> +ADDR2LINE=3D"${ADDR2LINE:-addr2line}"
> +
> +D=3D$(mktemp -d)
> +trap "rm -rf $D" EXIT
> +
> +TEXT_BIN=3D$D/xen-syms.text
> +VALID=3D$D/valid-addrs
> +ALL=3D$D/all-addrs
> +BAD=3D$D/bad-addrs
> +
> +# Check that grep can do binary searches.  Some, e.g. busybox, can't.  L=
eave a
> +# warning but don't fail the build.
> +echo "X" | grep -aob "X" -q 2>/dev/null ||
> +    { echo "$MSG_PFX Warning: grep can't do binary searches" >&2; exit 0=
; }
> +
> +#
> +# First, look for all the valid endbr64 instructions.
> +# A worst-case disassembly, viewed through cat -A, may look like:
> +#
> +# ffff82d040337bd4 <endbr64>:$
> +# ffff82d040337bd4:^If3 0f 1e fa          ^Iendbr64 $
> +# ffff82d040337bd8:^Ieb fe                ^Ijmp    ffff82d040337bd8 <end=
br64+0x4>$
> +# ffff82d040337bda:^Ib8 f3 0f 1e fa       ^Imov    $0xfa1e0ff3,%eax$
> +#
> +# Want to grab the address of endbr64 instructions only, ignoring functi=
on
> +# names/jump labels/etc, so look for 'endbr64' preceeded by a tab and wi=
th any
> +# number of trailing spaces before the end of the line.
> +#
> +${OBJDUMP} -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
> +
> +#
> +# Second, look for any endbr64 byte sequence
> +# This has a couple of complications:
> +#
> +# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, caus=
ing
> +#    the grep offset to be from the start of .text.
> +#
> +# 2) dash's printf doesn't understand hex escapes, hence the use of octa=
l.
> +#
> +# 3) AWK can't add 64bit integers, because internally all numbers are do=
ubles.
> +#    When the upper bits are set, the exponents worth of precision is lo=
st in
> +#    the lower bits, rounding integers to the nearest 4k.
> +#
> +#    Instead, use the fact that Xen's .text is within a 1G aligned regio=
n, and
> +#    split the VMA in half so AWK's numeric addition is only working on =
32 bit
> +#    numbers, which don't lose precision.
> +#
> +eval $(${OBJDUMP} -h | awk '$2 =3D=3D ".text" {printf "vma_hi=3D%s\nvma_=
lo=3D%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
> +
> +${OBJCOPY} -O binary $TEXT_BIN

..., like here, is then somewhat misleading considering that the tool
can take one or two filenames as arguments.

Jan


