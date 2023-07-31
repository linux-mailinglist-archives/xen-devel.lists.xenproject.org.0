Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC3769B54
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 17:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573167.897621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVC9-0002Bi-5W; Mon, 31 Jul 2023 15:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573167.897621; Mon, 31 Jul 2023 15:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQVC9-00029n-2c; Mon, 31 Jul 2023 15:52:29 +0000
Received: by outflank-mailman (input) for mailman id 573167;
 Mon, 31 Jul 2023 15:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQVC6-00029f-VJ
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 15:52:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eabe4fb-2fba-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 17:52:26 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 15:52:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 15:52:23 +0000
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
X-Inumbo-ID: 3eabe4fb-2fba-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rcp9yYCmCf1UiIT17DSASF0+HRg60JJD4dBbQSnoYhpIHoiHtv4pzmRDmlLhK3NFT6CB1gPAzDrwJzJYpP8GXqFpNsTwIh9XhyfV7kD9W657n6x3q+SQ10Q1I7v9PwU4eRzfMWJKHVG/5xtObN+36jpNsFpr/u47gytbV7ghvCKK/OIGXlN9HeSTP+aYpJMMQE/MiFtdc89472GwQeUKoJHC82cTYfB/uyusUtFs9CtHtR2QqyJ9b6bACSeDD3aK2sR3OFCFRVE6/TjogsrkGEOnmYfUsTx4MRO0A2mfvbu98vqw9wrVLS0MMWKVFWuLn3CGxK+qvCYypqsb9Wx9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmOpGfNTF1DcuS34iEkNYtxo6gugpGeU7QrqlugyK1U=;
 b=UbTEKPZnt51qO3lBmpRZfxxNWxB7XBzG1nj8ViFj2BvntvUBGi9v7Url5vqrpXDFCS1E6g3k/iWTsefi9jkeugco8fAsy5hE4qwT3jDxM7fWjDqX5z5YbWK1Q5CUfcoE8UL/WtyXcXg8CbpCvNhoKmbVNnCYm6Zv8ZhiBwCordGWwKc/C54amhkWrfwf0jZUepaVRgY/I0fz7vJiRtzrDlV1Lm+FJzXPJ7FjqMFTYA8zP/NB57vC6hwW4WGgN/iFg/BY+N179PhUqWwaSu8YJabBg+8cEfGLLLtDVEi1mzAXmywqSntWDeH4n6JHsrHiA+c/jvrmh3XN57dBgCNjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmOpGfNTF1DcuS34iEkNYtxo6gugpGeU7QrqlugyK1U=;
 b=0Fzgif8EUf5ihtf4u0d3jvfqHOCrjgpWXDNwO+4rdhsgH5Bmc2+TviVzLRapgXAuBBbiZdaJK3lPzI/Bm1Z3efx0T1XX02gN8OKF4WS/CgDu1UQurhEzONU7avWaI11CbcvLsmCWefJY57VQEnky7orU8wgvXhoqS1wNWG4UFzjvzGO9IZ8gOLA5bZV66dIrKhcWuNidI/SxuNKrtD+dexLI9EUcHZbABO4hv5iPOWK2NBCu0ctChmpBACax+COIJLXmk9hgEqKYVH9E66JERmky/+HxDnBF5uDYf/oiecVbsgC1J2iRFYitjG2ljD7oE2+Zt4e/7S1riOM+p3f8dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d280f52a-0d88-77f7-12d7-b952bd1a102f@suse.com>
Date: Mon, 31 Jul 2023 17:52:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 1/5] xen/lib: Move simple_strtoul from common/vsprintf.c
 to lib
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <294e48747a0f9aee0be4fd178fcab029fa317528.1690579561.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <294e48747a0f9aee0be4fd178fcab029fa317528.1690579561.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d064243-257e-4dde-dec6-08db91de2195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LJI50pNmzZ767BxwhUvtqnt3F23c6hAOh7iqN/xICH4+IJZtaWG+6jx7ogwfu/2BHudQm0c3pnRAcg1ZF72E766p8wYCFBW6jq+cvv8+gpZNRDEAlUuUAYIgxefX7Dh7nBgwz+3E/ainzBAK0/6zNQ6NsLQI0KipdnhMb8oB8jtyp9ddlQIU1AFAUivsivTF0APeVWvCBaSut2qPEw4eOH6ZongeR3eimeeP9ZJ1innN98aHPOBIMJktvOHEV25P2bPNUcZQQN/Y1R6naGHdxca1neHSWtPHkutrpNDNrAW7WHEiPnmFB7L5GIScPEFNOj+ZGB3Wtpmk7yEPhVx7gXOgjhq5RZ5Kacl2Z08Yjk+6/aYeiQeMJ0HxOP8I1yNQjVBHYW3pVL4/pBtljMWdvSEwT7Af2iBFxSMOB9rz9DNrUH1MRHy6sFDyuuO2kzFmEzEgdLi7A1np/5JIwHoAFJ1MD5QEGw5N0GBW0O0P8JxWCQ5BIBtgY+gGIObtT32uV7TGafjF74h+biL2vhMNRj7FHF5+TDU4RLpZi/UCMsWZIUDCTIDwl1QlaaJmBMaaxFJWIjKLXJGcB0IG15dCBOq+dwUq1Sa5DGVRg+I6H1d8UO2kcVI4Ms9QPCNBY3TbtVCTY3dOIvP5vs1hrGxv2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(66476007)(86362001)(31696002)(8676002)(31686004)(8936002)(316002)(4326008)(5660300002)(6916009)(54906003)(41300700001)(66556008)(66946007)(38100700002)(478600001)(2906002)(36756003)(6512007)(6486002)(6506007)(26005)(83380400001)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjVGOWxHWVJpSmVBdGp0UlNaUWZtc2xkL2pmOUFJRnNsWmpNajFlWi9POEVi?=
 =?utf-8?B?N01jMkVoTXg1ZHpPM3ZLdXVSSHkvaStqOStyc281ekNXTnl3YlVGWVpnQ3Yv?=
 =?utf-8?B?VTZLOFZ3d2M1Wi9iL0NraEowWnN0ZjhJSG8xUFFDaHlWTGMvQ0JtM0FIaU90?=
 =?utf-8?B?Nko2bUw1WENiK2lQelpCTjRNbFhvN0p6bDNwUDFqMWhTcWh0d09rOUxva3A2?=
 =?utf-8?B?MXNRQXpEcHRxeW9SZnpjR0FhVEZiSXNaZ0R2MzVLMW04bTRyeEYxKzFMQ2Qx?=
 =?utf-8?B?ZmY0VEQ0THpaNkNvNVU0bm1ndEw0NzdmSjF3YUNzNWV3bVVQRm0yOWpuQ3BV?=
 =?utf-8?B?cWRVUnFEVUROVTZDd2hMbVoyVjNsOFNQcHhpWWZzSCtSMU95UkFGVGFhc29s?=
 =?utf-8?B?V2pTaDhIZGRZS09lelBWam9xdnpYN0dWdkE4UnljWFViSCtTek1aTUM1d3JG?=
 =?utf-8?B?eVdFQ25UeGl0VmdNaC9VeVlBK3FuWjVucXpnelZFNExoTERPdWxrYnZPT3kw?=
 =?utf-8?B?clVjMGtLMmNIclA5Z29Eajl0UEdwQ0ZleWh6SGh0b2Q4WUZtVWpFUjlmVnI5?=
 =?utf-8?B?SkxRMVdYSWNhTEJHcCtjWHR3a2d0NDB5V1M3NXYwNWRNQ05hNzlVVGxicWNv?=
 =?utf-8?B?cjZiZnVBYUpiV25GVkc2V3JBOFRIa3BlS1F6SDdXUEZZcUh5WVFLMm1HQjYr?=
 =?utf-8?B?SlBUQnBTVTZYaGt2TGlhYjk3ZXBiMXk5VnZLYVVEM3NIeEEvNEEzeDY0MmZ1?=
 =?utf-8?B?SmJxRlBwZ2JwbWVDYXhwbTdVdThxZmpvM2ZlcEozblFsTjJpK2RmdU5FSTdt?=
 =?utf-8?B?ZEtUMVZYNVdxSFpBalNpRDF2WWQwb0JiTVpGbGRWRmoxSW1tOTIzaWZlRy96?=
 =?utf-8?B?VGo4a2VIeHJDSGZvTnovMHFEMjNIRlEvQ3lYemFkbHJIWXFoYXI1TEN3MmFl?=
 =?utf-8?B?dXN5VktmZzFWaVdVV3MzNEdTclRpd0lvdi9xTjZoY2ZBZkJKZHN0VnYzbThs?=
 =?utf-8?B?QXhSV3BycTlleUxlRUVNZ3g1ZjZMVjBUMFRvT1phZkg3aHQxMnkxN25LcTNG?=
 =?utf-8?B?YTdMYXFiYXRqcEZZVGdxcy82Y1NDcG5raHBHT2NqSDZrSzJWL25kTHFkeTBT?=
 =?utf-8?B?VWxjb2tIeHZ1Lzd3UDErSGswRDVCZGpnSkprWVhxSy90OFlJaTU5dlcxQWds?=
 =?utf-8?B?dkh6QmRRSnZSZFMxV2w1OGd1OEZxVXpFRk1UeWp6VkhYbXplOGs3eVRtRTVO?=
 =?utf-8?B?Smd3NUdmZnNMMjFMSmxQaHJPVytCQlh3UXg5QnZjbTB4dXlTMXRYL3U3RDUy?=
 =?utf-8?B?VVNuMUZibjBDaWYyZDFUYXVESll0NnZzY1ArY29MdTBpc21wb3g5cWpDN01M?=
 =?utf-8?B?dHlaanFYZThhbEVrRjNSZWxoRzVMNEw1RkdHazdKWTNkSVNMb0NWK0JUWjhB?=
 =?utf-8?B?Slp2TmFSRVFaeDJOS0JyRkNyLzA5VzBkK3lmclNGa2R5TXJuWmphTGswbFk5?=
 =?utf-8?B?RGhKWDlVZGZzQzNORWx6MkN4U3VUZ1ArQWxRUkpmZElrMkwzY3FTRE04Y3V0?=
 =?utf-8?B?SUh0RS9lcFBmT1VJUEpLLzhBQVlBVEltU0hpdE8zb1RBczhQdGhIODNraDVT?=
 =?utf-8?B?TExQVUExa1dOd0hlaFpLY2l5Zy8zN1BtbWJsMEdCRWFFTGdYQitrTDl4R0JP?=
 =?utf-8?B?MXlRVUZUTWo0eklhQWtzYlRtNkY3NG1maDRTblk3MDZJWk9vVFVidUtWcm5K?=
 =?utf-8?B?dXdtNXNNNDJhUkMycE5Lb3N4c3h1TmUrQ1RHYTJJT1gydDRtc2RTUVhEV3pM?=
 =?utf-8?B?OGY2M1ppOWJzMFVHYmtqSFZpT3dmbkhJQytoZ205SlJ1RkdLK2N5bURneXRt?=
 =?utf-8?B?T0RiU044d051eGRCRzJrS2JJVWpCVG5tVEhnbFlUVWN2dDNMem1MRnZvaXlQ?=
 =?utf-8?B?bnpqTVptNzdqVHBpOWQ3RitXZmZEZHFCUGNQbnlQTDE0RzlWdll0b3NwOVc5?=
 =?utf-8?B?Ylp1SDh5dzRKYXN2dStoOThlT3h4L2JQUzdOM0FxbnA1WnkxdGM0aThzakVX?=
 =?utf-8?B?R3JGamJZVWpUOU5CK0R2MjJtYzZnYThzK3dGZ0NFK01ndjZ5Q1ZYNmIvYTQx?=
 =?utf-8?Q?J+L86VUAnDDv+G8SErerwxhP+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d064243-257e-4dde-dec6-08db91de2195
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:52:23.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcFqdcWBgppJFJOxJV5Pt3Oz1p3uiciCa1U41ds5IRH83QNKliDSnmmFcv3iglOKog0g8CBgJGc/j3bd8yVpnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230

On 28.07.2023 23:35, Shawn Anastasio wrote:
> Move the simple_strtoul routine which is used throughout the codebase
> from vsprintf.c to its own file in xen/lib.
> 
> This allows libfdt to be built on ppc64 even though xen/common doesn't
> build yet.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/common/vsprintf.c    | 37 -------------------------------------
>  xen/lib/Makefile         |  1 +
>  xen/lib/simple_strtoul.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 37 deletions(-)
>  create mode 100644 xen/lib/simple_strtoul.c

What about its siblings? It'll be irritating to find one here and the
other there.

Also please no underscores in (new) filenames unless there's a reason
for this. In the case here, though, I question the need for "simple"
in the file name in the first place.

> --- /dev/null
> +++ b/xen/lib/simple_strtoul.c
> @@ -0,0 +1,40 @@
> +/*
> + *  Copyright (C) 1991, 1992  Linus Torvalds
> + */
> +
> +#include <xen/ctype.h>
> +
> +/**
> + * simple_strtoul - convert a string to an unsigned long
> + * @cp: The start of the string
> + * @endp: A pointer to the end of the parsed string will be placed here
> + * @base: The number base to use
> + */
> +unsigned long simple_strtoul(
> +    const char *cp, const char **endp, unsigned int base)
> +{
> +    unsigned long result = 0,value;
> +
> +    if (!base) {
> +        base = 10;
> +        if (*cp == '0') {
> +            base = 8;
> +            cp++;
> +            if ((toupper(*cp) == 'X') && isxdigit(cp[1])) {
> +                cp++;
> +                base = 16;
> +            }
> +        }
> +    } else if (base == 16) {
> +        if (cp[0] == '0' && toupper(cp[1]) == 'X')
> +            cp += 2;
> +    }
> +    while (isxdigit(*cp) &&
> +           (value = isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < base) {
> +        result = result*base + value;
> +        cp++;
> +    }
> +    if (endp)
> +        *endp = cp;
> +    return result;
> +}

While moving, I think it would be nice if this stopped using neither
Xen nor Linux style. I'm not going to insist, but doing such style
adjustments right here would be quite nice.

Jan

