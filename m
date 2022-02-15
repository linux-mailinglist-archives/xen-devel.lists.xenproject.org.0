Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306094B6F8C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273291.468422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzVB-0006xM-IV; Tue, 15 Feb 2022 15:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273291.468422; Tue, 15 Feb 2022 15:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzVB-0006uW-Ed; Tue, 15 Feb 2022 15:12:25 +0000
Received: by outflank-mailman (input) for mailman id 273291;
 Tue, 15 Feb 2022 15:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJzV9-0006u3-S8
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:12:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acc5d41f-8e71-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:12:22 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-DBko5ycjNwSKjeImIMk7zQ-1; Tue, 15 Feb 2022 16:12:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6726.eurprd04.prod.outlook.com (2603:10a6:20b:fb::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 15:12:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 15:12:18 +0000
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
X-Inumbo-ID: acc5d41f-8e71-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644937942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DC8CGbIVjiAu6uvxiyZ9QaOrQAizhVbxqCr/Ont0Wes=;
	b=IrvxQZCNGD8A5xXljt0QIX65Yj2jxE/qUfovYC7aWyfWFHtnz9TkOiDoky//VYfZ4uEOow
	Wu1d49YHXOmZDaywrf6/AXkdj7+B2khx3RcS+2Eg6urSqUW0l8RFGDe9fXQ4CoDLtwvyPG
	0rotIZ/e3702XxeWMjJXIpzO0+VPI/8=
X-MC-Unique: DBko5ycjNwSKjeImIMk7zQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9mDwBip2wo/I5dmBug1JoZNP/u+P5ylj85dxvhZCwsDkMC0Sy/PdxCjqMME2uAzkC05wnFUz47eRepsKWCAnydsFxu4IpRQ/21r6oM706zdGirSajw9XL1lpoTs+S9OLZXizPbBWKejm8kWsDAaK/z+4LnR9wpQ3EE1mqoP7UERXI81OHb/wdHbfrn9U1oSIzaL5qqrLajW/0brSU5qmACDmQKSLVqmzQUGCtx9EE4MX47R7PeFs5TmWYswijf33PatChLab700CtmnxdHEBAgvbosvot0KUYZkZX7kSBgHjlu4klrQ/GKAkMu60pG2JxDsywBq+euocOHLFnNLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OjA9TshIMqhKI2zeFdrZMHMll3Ah9QhgOmXJszO66I=;
 b=O2QatNcZkvceJqhu6CASAzpn7oxM3DuG3F6JR/T5YjA/CJfdyhgGHzs3Si2CSgk6JqzDYmiWHc8Lf+tkva08mqpWQkrAGUjM0EpKxMDWor9DZuLyXeE1it5FYyiNqXMdtbXWM0GWiOlvwzjt2w5JJr4P+9PmOuS11J0VLohlZp0uBCpA1yA8rGMjAtrhoQJv6UroHm4s62tdLorpMzn4LU2sISfQme1FAgNDU0FRAjbTGZua1sKkycQBLNolSpubbHCJUrsUPxMt2hk/TeSMix/zuzmSjb3J30eHTlVpG1HtAbYFIkt3NyVDfK+5DyFTlPWwT36KegTdIApWdZ3/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95c29039-302c-256b-d381-2b5b8b9c1a4a@suse.com>
Date: Tue, 15 Feb 2022 16:12:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 07/70] x86: Build check for embedded endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e1226b5-e0fb-4159-9644-08d9f0958e9d
X-MS-TrafficTypeDiagnostic: AM6PR04MB6726:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6726A8BCC84A3EAB406E1F7DB3349@AM6PR04MB6726.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8cODcs/8w2pMEwdd3labD4w2XX3L6vT2zZirNYftleuMpIdkheBCASukY8l7A7GIu78a2Cg6nJskiyYXxoPMNvp1XNIhx6gTTu8Gi/jpLU/ELdlFYw22ExWM6sXplnL9med1zxhj6wrh3eT1eH9NKFNrH5Tv+IxA9Xp6EuZTRTQZWz6YdV/3dOXmQpcyOnMRbd6F5FLgToDdZPn3BzHnz3/9xuEFr/qYj27NlVeCIwUNlLIoMaQYdrCN1LaSPkFID4M2EOC6gO9f+ZJC7UlUYHAMJZzZ8XR8RAH1gAs7+AW1vf3zih3CHXcgQ4O1cvHoQco87tlqd6gmOpy29p2+eqMHfq9S9Z7bVMvBUwReQ9PhfJ4HRpSg+XsTEN7LknIxz2Vzt5UueYBrE3B+dckbWkiPMxxzzoFzHTox8IaPwcJhof8ebcCgQj0V1ea/hxT3CRmwu0NRlblya5K8sGQPtkV5OYEZeI2GRnMhmDkpKm8Fh7Tb4M7pPZhqAJOJ+XffKkYDh08SuZRvJz7WGXeEttU1RC3J3gn6U2uebBhLS9EAm1hfmPfHfgI1eYDsi7IlzPAiLz8gZYZcr70CjrGGqE0mI8HuPBFcvClCHe7chvg9agLc4c6a6+IsGM8YHu4FNPLcA1CkIpm3HDw+hrwwjvYDkHdYqebUcyOo09nDQ5vBXlTndNheUhQsORlF9isNhF/I4Mb5ANHd4mJeKEge3PgWHo5KMQYpE2hSm3gYfTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(508600001)(110136005)(2616005)(316002)(38100700002)(5660300002)(53546011)(86362001)(31696002)(6506007)(8936002)(6486002)(66946007)(83380400001)(8676002)(4326008)(66476007)(6512007)(2906002)(66556008)(31686004)(66574015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MBtHWAwUET1UU/O7Qqr6YjvnO/a+FabQ1rqP6FBfs4YD+gQywcoT2FfmFATA?=
 =?us-ascii?Q?smH11dlBPV1HL7L29JZacn7xDaqsdJOuafquRZ/iUcWzoBEGKl/w8fQVjx0q?=
 =?us-ascii?Q?52E7lTMK7cFyYFKhme3KEVbesDdoGrp1Iwa4cnZrnJ88U19GM3Wl8BUwfA8O?=
 =?us-ascii?Q?MRTD2uqLJQhD7v3B6aeIVWnJte9hcPbilUkk1fhVdP22sOciCNCuF0LHUpuZ?=
 =?us-ascii?Q?oElEy82K0ODwbJUoTLlufx0xy64j/xU3XiCylxgQsoDXz1OAtZJ2VyWxsM0U?=
 =?us-ascii?Q?Yw7ekzPfWgchKxsLXrm8vcaudt95y28Rz/aMR/Jlq7kELltr1Z8IW5LGczzi?=
 =?us-ascii?Q?Qu/xtsjKm11VZxBj9CZ8ATsmnA68GGSyiT79rCFvwFvtYD59lVYlasjM13qI?=
 =?us-ascii?Q?O5oPMfpIedZxegHA6roG+6qCnZO7LBUTzuXoxNHmhOJhhOS2Dji33x/b7d1T?=
 =?us-ascii?Q?iLNdTKsupIXIIjlh3HyrXdk81df1pO/x5EhO4ON2aqep3djach8Jms9kKrvx?=
 =?us-ascii?Q?IZjMCEx+zMEvg0NJpoPJ7cx8+iFzBYxmS5d3vjgByO2ThioGf4LN8hCpI47Z?=
 =?us-ascii?Q?zdNyeoZdc5N9Fmngw+CfPQjTTE6CiJS3c+sLZIouyKQXrwvHClvQHbKECua2?=
 =?us-ascii?Q?eahdTauYBdOz4XMOsTOBt3K53Y3J2xxYPcHGGSr2CPTHp+i3KPuR1rnMkVS2?=
 =?us-ascii?Q?tSVfjKqw/h+qng1YAYv7c4DGmoPNk7VlWhZSLCvY4YTuayQ8/kUGcGaLcAmB?=
 =?us-ascii?Q?OyaaPH7DQENedGjnAqw9klMPQyViJxsrrkgXbrrxbpc/jP77T1mjuq4hnTG1?=
 =?us-ascii?Q?Mnst9Pmdd0ux53oe9ZSWNhN0yxK6fNJzG0T4y3AaJC9bBHP01kW+9N6jGxYW?=
 =?us-ascii?Q?yoveyfOgSW41Vq0pOzP3PklvNjhOB9ffDcRG9SfLYGa1knv/umiEI1r5OVHH?=
 =?us-ascii?Q?NO8GNTN5d+lMf/j33uwflBlUy8QgO1cf0bty8LAOyP1YueXBlGhhrjPxD2pX?=
 =?us-ascii?Q?mBvqELKS9LuNwfAJ4tIGairLQCDcq43VM32knuxbcLpRkgXSCmoF0LErpe4W?=
 =?us-ascii?Q?9zbqu0X8VPiu/Fu0uQudKSkR9f9su/6NGxhrGnVlOYUfBi19ymLuApxa77xo?=
 =?us-ascii?Q?L9Y3HMjYerDSChrShjhGzqJWPgBxn3XKZ5gd+N7eDKv50kVZEEwJd4+uag88?=
 =?us-ascii?Q?gtXa0iuDdMLjPyG1/YKcacQoEGQSmqCPgdHtRs/6GMfWmcP2+0EO/yJsRZFF?=
 =?us-ascii?Q?6l6nCOw483ldaTxL9eWzeO1eA1B5sbiWfKEld0xI1ZBFciaeY8x1YkLEiVQa?=
 =?us-ascii?Q?cJTkh6E7U0AV1eRnn59dtNFf0KmpFAEf+CMu9bXLnK/0DRQZMmzLnLzOl++t?=
 =?us-ascii?Q?wjaVv1PDAUS88jfAK3/kGCWNOmQ9F1tu0u38rEPpPtEw8WTMZjcO2ojU+ac0?=
 =?us-ascii?Q?bt/WsdtgA3WPVGWinShYISx4WT2HoDFPwyf8CtEz2ljUnTmZk+JTFHGh2TYR?=
 =?us-ascii?Q?ns6LkFnlItnmqw8ztUGmE4E8RWGGUDiE3BkZSaHF4WWfUsakTmyrfB6DlSP5?=
 =?us-ascii?Q?Sh6byO/De0oxHIQH8BHhFTbh/wLSzWpJ8b8RYci+mpZESYSZvVc9VzEFfhNK?=
 =?us-ascii?Q?x7tl7TLtz5LrTku9I90GFho=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1226b5-e0fb-4159-9644-08d9f0958e9d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:12:18.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okuYcMN9+bZsO/irNNFF0S0Xp83lu3uBvKjMdMxaTmnQ6zBWsb6s3zYWSxxdF0tan6fnp8YzVPN2Cgr1yi/Xcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6726

On 14.02.2022 13:50, Andrew Cooper wrote:
> From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> Embedded endbr64 instructions mark legal indirect branches as far as the =
CPU
> is concerned, which aren't legal as far as the logic is concerned.

I think it would help if it was clarified what "embedded" actually means
here.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -155,6 +155,9 @@ $(TARGET)-syms: prelink.o xen.lds
>  	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>  	    $(@D)/.$(@F).1.o -o $@
> +ifeq ($(CONFIG_XEN_IBT),y)
> +	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
> +endif
>  	$(NM) -pa --format=3Dsysv $(@D)/$(@F) \
>  		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		>$(@D)/$(@F).map

The same wants doing on xen.efi, I guess?

> --- /dev/null
> +++ b/xen/tools/check-endbr.sh
> @@ -0,0 +1,76 @@
> +#!/bin/sh
> +
> +#
> +# Usage ./$0 xen-syms
> +#
> +
> +set -e
> +
> +OBJCOPY=3D"${OBJCOPY:-objcopy} -j .text $1"
> +OBJDUMP=3D"${OBJDUMP:-objdump} -j .text $1"
> +
> +D=3D$(mktemp -d)
> +trap "rm -rf $D" EXIT
> +
> +TEXT_BIN=3D$D/xen-syms.text
> +VALID=3D$D/valid-addrs
> +ALL=3D$D/all-addrs
> +BAD=3D$D/bad-addrs
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
> +${OBJDUMP} -d | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &

Since you look at only .text the risk of the disassembler coming
out of sync with the actual instruction stream is lower than when
32- and 16-bit code was also part of what is disassembled, but it's
not zero. Any zero-padding inserted anywhere by the linker can
result in an immediately following ENDBR to be missed (because
sequences of zeros resemble 2-byte insns). While this risk may be
acceptable, I think it wants mentioning at least in the description,
maybe even at the top of the script (where one would likely look
first after it spitting out an error).

Do you perhaps want to also pass -w to objdump, to eliminate the
risk of getting confused by split lines?

> +#
> +# Second, look for any endbr64 byte sequence
> +# This has a couple of complications:
> +#
> +# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, caus=
ing
> +#    the grep offset to be from the start of .text.
> +#
> +# 2) AWK can't add 64bit integers, because internally all numbers are do=
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
> +grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
> +    awk -F':' '{printf "%s%x\n", "'$vma_hi'", strtonum(0x'$vma_lo') + $1=
}' > $ALL

None of the three options passed to grep look to be standardized.
Is this going to cause problems on non-Linux systems? Should this
checking perhaps be put behind a separate Kconfig option?

> +# Wait for $VALID to become complete
> +wait
> +
> +# Sanity check $VALID and $ALL, in case the string parsing bitrots
> +val_sz=3D$(stat -c '%s' $VALID)
> +all_sz=3D$(stat -c '%s' $ALL)
> +[ "$val_sz" -eq 0 ]         && { echo "Error: Empty valid-addrs" >&2; ex=
it 1; }
> +[ "$all_sz" -eq 0 ]         && { echo "Error: Empty all-addrs" >&2; exit=
 1; }
> +[ "$all_sz" -lt "$val_sz" ] && { echo "Error: More valid-addrs than all-=
addrs" >&2; exit 1; }
> +
> +# $BAD =3D $ALL - $VALID
> +join -v 2 $VALID $ALL > $BAD
> +nr_bad=3D$(wc -l < $BAD)
> +
> +# Success
> +[ "$nr_bad" -eq 0 ] && exit 0
> +
> +# Failure
> +echo "Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
> +addr2line -afip -e $1 < $BAD >&2

There probably also wants to be an ADDR2LINE variable then. If
one overrides objdump and objcopy, one would likely want/need to
override this one as well.

Jan


