Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A8669F4D6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499489.770645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUoWB-0003UO-5b; Wed, 22 Feb 2023 12:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499489.770645; Wed, 22 Feb 2023 12:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUoWB-0003R5-2P; Wed, 22 Feb 2023 12:46:43 +0000
Received: by outflank-mailman (input) for mailman id 499489;
 Wed, 22 Feb 2023 12:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUoW9-0003Qu-4V
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:46:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f238acbb-b2ae-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 13:46:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 12:46:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 12:46:08 +0000
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
X-Inumbo-ID: f238acbb-b2ae-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZpDamAT6fve8hIM0TSHD1uasQ4yYe2M3BtWbmIOXI/in54UZZds+hFRYbITgtK02oDkTekETQsspi6b5dggWywtNUtApbSGWjO9MWqhCAse7YKs02L47GKeHyREmoAb4yB18po/ti1q26Ml7CKZhJvpDljsyLsiJC+ByxF5ZiWRKQQ+LaPUtg8RguGc5SKCaFLnkM2jXm8WySOWDLmbs2LyEAm9e5K5jCdhhEExshX7tjYJl54ApEx9UrgaX7uk4sQklL0Owv1bFjOIUQOlVxjBw2ns0NHhb4TY+5S2yALKjkce5Xzjvl0dE2FwV3nLAjeCqDTBKZzZVVFG0HR2KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e2gYccZwIsZm+Te80WpjZ3dxaiEcjm/S7skp/m8/d4=;
 b=dhePvobic6xRptiR+5CmSlesbuWMuqj8HFXu+MEz71U9vlcqNMNkGUf2UWXQYQdKGttWYNOfrQR6JabViFDy7NHIH3tAPARp4iSII24vxKfoBj+ojpzZgFQrWFVYWuFRIxVabGW+omyZyEbs2aof+X377vxFbTpRtdE1VU0yKnuCK31yJAT+7Gf1VJxKAQBSZydHzpKrd2LMR4No/MeTVZxIvxqap9UuSf4/64pPhqOgbgxuEKe4wSLyIXztN9+gG06CcIyQ7bN7mRSEtKPPw+wIZvqkTKGIAUGsFo6bgux7N+/laM21d9zI7q9xZZBB2iqveraJLWTrwTrNwRsRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e2gYccZwIsZm+Te80WpjZ3dxaiEcjm/S7skp/m8/d4=;
 b=B8ebiim4DGHRJ4kPQU5LtMrULILBwDeglzIEjg/y4J47Lo+PXds1k10IZBDLfi0QYvFW28pQwEq2F2n1hAbAznAPQKynyFbt/gIE62CyOR5ORRVT7icLsX3LjFvADR/HGXPuehvfNwZAsjgZLsi9bRDGFZhPpEj5UvheKea/3bAjZxxhNkZLlKFf6WSxNTi9BpiwFCiLqkiSSPip3WqtgtgLvj+0loYUWiWSZ8FurN+6nQN7z69Rw609veL/WrQXCbdq/IcQMSHn6t/bxJ5rLUvg7cf0Tn40fd8GjYtSfAf/V1V+vVeJaC4XOoK2guOP2ivAx81gz1XiNGzqHd4Gyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <214973b0-5fe7-9208-2cfc-dd2884583157@suse.com>
Date: Wed, 22 Feb 2023 13:46:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
 <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa0d3704921f5ec04b66c8aa935638a64018c50b.1676909088.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: c527d5be-d02d-4adf-4ecf-08db14d2c492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+cdyNd61lT0OyyKkNDIILWBRkPnAOufXFwgbGxct8TzF6p+WiiEtvg7WUTZKEKbz21DtyfwwvXwHiuhitTx+YfrATti5DlBVLyKaHAxDNOWeSITePdDMW76NzRTCmV2hnDwzuV7ZhG/6cqu+QYP9Hkz6bmzKbe9O6y0sEk/gH4dRVxRV6IGuZibI8TvSe9NC7uRMfcgBAmlBA2wxwpkj4ash9CN0EhCwmuxctZnJUylZM/Wa6QVSUJz2CI9zA3drEi2CEfnG6jsRWPlvJScf6Puo5wnYIsHRwSz7zT8Lg1Gvndz9IUuzOHgXNRnKUq567EL5vr8Ifz6UPmK2TM4p0U0nUWuNj370SOrl1+0dg4GAmKW6IqpCHO7fYoSjNhVk9VM4eNXK5IsJytVjjtYbtDDwd+1K95GwRGt5WFR/atM7knulsG88KrHmwPfEsFzjkfCWo3edaldABf5vC0yTaM5EpEE+njJ1vnT4ZgLxLae4T+oVAU7aH93n7k37m4E0lbLCN8bnHfT02QRqWxhcM8ArP7+21gTWk9fHSX2pln1UjGFq4/4J305lyBBQNBY1Phw7tQUaa+j3yycJl8LV/StDSVuoNbc3MCoq8tRHPXZ3jdkM+1IhiUmToL3OvW+MbiCD7CzrkjRg3RAmwOfT/tcE/cjgGxV80FTu9NuKZ6CdHfZ/bjo9jkUTMvLfuQ3pGqJfynTKRGSr8XjRJwnlIEwwGEsuP/4/NiiEX96r/sqPpLsYvd+KYghst3n/1eFH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199018)(86362001)(31696002)(5660300002)(2906002)(31686004)(38100700002)(41300700001)(4326008)(66946007)(66556008)(66476007)(8676002)(316002)(6486002)(36756003)(54906003)(110136005)(26005)(8936002)(6512007)(6506007)(6666004)(53546011)(2616005)(186003)(478600001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmpnSGlqSy9NYW1rdDAwSVRJS1g4cmh3LzJZdGtJSCtpTE9kWnNOOXo1Zy9n?=
 =?utf-8?B?OGo1WjRIQnpONXFiblBocUFnN0hpNVBqYUJpQlUrY1R6c3BKd21IcXpBQWow?=
 =?utf-8?B?d2ZkUmVkNlRQQkNuQkxGZW9XS0JjMnFBenY1QW9MaHRDRE9aQ2xieDloMlIr?=
 =?utf-8?B?YURVRVVnVjZFTVBDK2pXRzRSS21SVkhCQ2dmMzVYMkE4eERCaGh1d3p5SEh0?=
 =?utf-8?B?a3dsK2szWndsWmtPdkZ0c2tQY25TaVdVL0g0NXB6cWtCUmJGTnBqSGZuMHZI?=
 =?utf-8?B?Qks3WTlqcFJCT1p1Qk5COUQ2RFY4alhOMUZNT1I4cUhsQWwvTVdyS2hZbDlv?=
 =?utf-8?B?aUhsaFhWY0JRVXBXbWwvemhxbGMxUFJtZktOMFJ3Rm5Mbk44OVQ0Q0pjSVEv?=
 =?utf-8?B?V2dvalU4UTVMWS83QTBSY1Uralc0ZXMxajQzekpLaEFDVFdLWDhMYkZTRC93?=
 =?utf-8?B?S251c2pWRXJLOHNiRHFycFlPZ2Y3TitsMExJcGJWcUtoUFU4N1pYVWlTdkRu?=
 =?utf-8?B?bU85WUo2ZEw3ZmF6ZTc2TDRxM0pnSjFJcVltc0EwSGJBSi9EY2ZRRWc3UzNK?=
 =?utf-8?B?KzJQRzBpRklhVE1ZelZ1NzlRME05UFdsSlJiSTQzMlhlZHdBdFJaWkx4aklZ?=
 =?utf-8?B?akwrb1NsSHorcktWUTdpZnIxeTIvS05CNlhkVy9NMnYwN0J1RzlJNlRzR1Nz?=
 =?utf-8?B?QmRZcDVNTkhmbVZCdnFnMS9vT2xhaVRoSm5tTUVJODU0eGNaMXkza1pybTM3?=
 =?utf-8?B?cXNiaUtXVTRWZHFSNXdneFRmNXVlZkpFN3Z4c3ZadmxyWDNCVWhqMnE3dzRL?=
 =?utf-8?B?bzBkcW8zVHlFcVgvRVU2Rmx0cWUxalV5Q3dtVnNneTFrREZkVXpPYzdBQXhj?=
 =?utf-8?B?Qnl1OVMzL0RHa2ovWDRCOGRxUDU1bzFZVzlSLzNuNkdSTlAwUmhoQ0U0OTNk?=
 =?utf-8?B?L2pBVnZxZGFqNFRLRnBvS2JLUEs0OWdkNS9BdklhTzRrVjZ3NkdJVUhreDFh?=
 =?utf-8?B?bWRTNHU0VEtpelpwUWM5SXkxZU5oaHpiaUNUSmlYL2xBZ0U3WHYvRkcwcXdh?=
 =?utf-8?B?eFM1Zmh2NVFiV2RNbGtQMTVpbGV3RkgvUmJBOVZ3ZGZSS2EzK2tMSE1vNG0w?=
 =?utf-8?B?VlI5YTk0ZlRUVTVoQzlveFRwUzVyUnhtNjdDOGIyVDkyZTd0OXJIaEpMUkZJ?=
 =?utf-8?B?LzJYVGVTNVNvRmVNemJqVzF5UzE2NzBSbHFVN2c2eWl4dllCcEJheW5nbzZR?=
 =?utf-8?B?RG96b3JhdGhCb0JtbDdMbEpWTzdUeUZOT0JTMHltejdmcFpRRUxsc1ZQTTgw?=
 =?utf-8?B?dzR5alYvQUVEUXFrdWh5Vm43M0ZEdUxhOXNsVFQvU2RhWlMxME0wWVdRSUUy?=
 =?utf-8?B?NDJWY1ZSZWQ0QjZnYXdKRE43RWZvM0Z3KzVkTmo2WlR6a2p5NFZtMDlYY2Vz?=
 =?utf-8?B?TWJCS3ZXWW1OVU92c3ZRL3BzdnRaNnBmRFg0c1YzdkNkRUIrL3BtUUY4TmhT?=
 =?utf-8?B?aVlIZlVjOFV1STJVaDcvUjgyZkkxWkZKVVpPdHBZQmltcHE0dkpmM05RL085?=
 =?utf-8?B?M1MvdHpESkI0OVNZb2dCY3ZlL3Q0ME5lRUg1NU9JTndWTmYyNkdoMDRibkZj?=
 =?utf-8?B?RGp3UGovYTVjTHZqemlqUklaSi9xaFlzMjdFV014Unc0K0I1amNROVBseDNH?=
 =?utf-8?B?bFhSaCtuTndVaGVrRHBGSHRucWtxZGhTNmVJSEw1a3FUQnRkL1ZGb1YxT3Ba?=
 =?utf-8?B?eFd5alMrNHExZGdvam9MRGZ0YzhNMVNSOGRNMHFDMktkRUd4anRXaThrMXBV?=
 =?utf-8?B?RUc1WUMxQ2tRaVBMazFsMHRxSzhGVFhJc3kxVGFkOXo4S21XeE1DcXNCL25F?=
 =?utf-8?B?QkxpbmlHR0xSTG14aUg4ZjdWcHh5YjBmdHR3azBDb3grakpXR05VY0RIbkZG?=
 =?utf-8?B?citBbExBT081T25lZVdSbUVWdmJJZldsckI2d0JtaGZiM25jbEZ3NkV4Unhh?=
 =?utf-8?B?OGFabjJwcmV1VEdWWjFzYUNJelFMMTJrbGx1eHBFOEF4a2JFWUM1MUFiaVh1?=
 =?utf-8?B?N2lNOThreFJTbTFtRWhoT25yRFVISmZFMXQvZ2dmSTVveVkyWW9rY2hEUCta?=
 =?utf-8?Q?tgfgT9EwKOHgpfTJ5/lvSpo9a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c527d5be-d02d-4adf-4ecf-08db14d2c492
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 12:46:07.8542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8U7Smco0zhsRTu1A+AK1j5RDCXP+9ETNLXfuspKyyZJk46YU+1CPHYt8gzR0bfEe4tqeexjisONv7itzt4IZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

On 20.02.2023 17:40, Oleksii Kurochko wrote:
> A large part of the content of the bug.h is repeated among all
> architectures, so it was decided to create a new config
> CONFIG_GENERIC_BUG_FRAME.
> 
> The version of <bug.h> from x86 was taken as the base version.
> 
> The patch introduces the following stuff:
>   * common bug.h header
>   * generic implementation of do_bug_frame()
>   * new config CONFIG_GENERIC_BUG_FRAME
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> ---
> Changes in V2:
>   - Switch to x86 implementation as generic as it is more compact
>     ( at least from the point of view of bug frame structure ).
>   - Rename CONFIG_GENERIC_DO_BUG_FRAME to CONFIG_GENERIC_BUG_FRAME.
>   - Change the macro bug_loc(b) to avoid the need for a cast:
>     #define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
>   - Rename BUG_FRAME_STUFF to BUG_FRAME_STRUCT
>   - Make macros related to bug frame structure more generic.
>   - Introduce BUG_INSTR and MODIFIER to make _ASM_BUGFRAME_TEXT reusable
>     between x86 and RISC-V.

Hmm, below I see it's really just "MODIFIER". I see two issues with this:
For one the name is too generic for something which cannot be #undef-ed
after use inside the header. And then it also doesn't really say what is
being modified. While ending up longer, how about BUG_ASM_CONST or alike?

I also think this should default to something if not overridden by an
arch. Perhaps simply to an expansion to nothing (at which point you
won't need to define it for RISC-V, aiui).

> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,113 @@
> +#include <xen/bug.h>
> +#include <xen/errno.h>
> +#include <xen/kernel.h>
> +#include <xen/livepatch.h>
> +#include <xen/string.h>
> +#include <xen/types.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>

Is this really needed here?

> +const struct bug_frame* find_bug_frame(unsigned long pc, unsigned int *id)

Is this function going to be needed outside of this CU? IOW why is it not
static?

Also, nit: Left most star wants changing places with the adjacent blank.

> +{
> +    const struct bug_frame *bug = NULL;
> +    const struct virtual_region *region;
> +
> +    region = find_text_region(pc);
> +    if ( region )
> +    {
> +        for ( *id = 0; *id < BUGFRAME_NR; (*id)++ )
> +        {
> +            const struct bug_frame *b;
> +            unsigned int i;
> +
> +            for ( i = 0, b = region->frame[*id].bugs;
> +                  i < region->frame[*id].n_bugs; b++, i++ )
> +            {
> +                if ( bug_loc(b) == pc )
> +                {
> +                    bug = b;
> +                    goto found;

While in the original code the goto is kind of warranted, it isn't really
here imo. You can simply "return b" here and ...

> +                }
> +            }
> +        }
> +    }
> +
> + found:
> +    return bug;

... "return NULL" here. That'll allow the function scope "bug" to go away,
at which point the inner scope "b" can become "bug".

> +}
> +
> +int handle_bug_frame(const struct cpu_user_regs *regs,
> +                    const struct bug_frame *bug,
> +                    unsigned int id)

Nit: Indentation is off by one here. Also same question regarding the lack
of static here.

> +{
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    unsigned int lineno;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +#ifdef ARM        

Who or what defines ARM? Anyway, seeing ...

> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;

... this, wouldn't it be better (and independent of the specific arch) if
you checked for BUG_FN_REG being defined?

Another (#ifdef-free) variant would be to have bug_ptr() take a 2nd argument
and then uniformly use ...

> +#else
> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);

... this, slightly altered to

        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug, regs);

> +#endif
> +
> +        fn(regs);
> +        return 0;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_ptr(bug);
> +    if ( !is_kernel(filename) && !is_patch(filename) )
> +        return -EINVAL;
> +    fixup = strlen(filename);
> +    if ( fixup > 50 )
> +    {
> +        filename += fixup - 47;
> +        prefix = "...";
> +    }
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
> +        show_execution_state(regs);
> +        return 0;
> +
> +    case BUGFRAME_bug:
> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +        show_execution_state(regs);
> +        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +        if ( !is_kernel(predicate) )
> +            predicate = "<unknown>";
> +
> +        printk("Assertion '%s' failed at %s%s:%d\n",
> +               predicate, prefix, filename, lineno);
> +
> +        show_execution_state(regs);
> +        panic("Assertion '%s' failed at %s%s:%d\n",
> +              predicate, prefix, filename, lineno);
> +    }
> +
> +    return -EINVAL;
> +}
> +
> +int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
> +{
> +    const struct bug_frame *bug = NULL;

Nit: pointless initializer. You could of course have the assignment below
become the initializer here.

> +    unsigned int id;
> +
> +    bug = find_bug_frame(pc, &id);
> +    if (!bug)

Nit: Style (missing blanks).

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,161 @@
> +#ifndef __XEN_BUG_H__
> +#define __XEN_BUG_H__
> +
> +#define BUG_DISP_WIDTH    24
> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +#include <xen/stringify.h>
> +#include <xen/types.h>
> +
> +#include <asm/bug.h>

Any reason this cannot live ahead of the #ifndef, eliminating the need for
an #else further down?

> +#ifndef BUG_FRAME_STRUCT
> +
> +struct bug_frame {
> +    signed int loc_disp:BUG_DISP_WIDTH;
> +    unsigned int line_hi:BUG_LINE_HI_WIDTH;
> +    signed int ptr_disp:BUG_DISP_WIDTH;
> +    unsigned int line_lo:BUG_LINE_LO_WIDTH;
> +    signed int msg_disp[];
> +};
> +
> +#endif /* BUG_FRAME_STRUCT */
> +
> +#ifndef bug_loc
> +#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)
> +#endif /* bug_loc */

For short #if / #ifdef I don't think such comments are necessary on the
#else or #endif; personally I consider such to hamper readability.

> +#ifndef bug_ptr
> +#define bug_ptr(b) ((const void *)(b) + (b)->ptr_disp)
> +#endif /* bug_ptr */
> +
> +#ifndef bug_line
> +#define bug_line(b) (((((b)->line_hi + ((b)->loc_disp < 0)) &                \
> +                       ((1 << BUG_LINE_HI_WIDTH) - 1)) <<                    \
> +                      BUG_LINE_LO_WIDTH) +                                   \
> +                     (((b)->line_lo + ((b)->ptr_disp < 0)) &                 \
> +                      ((1 << BUG_LINE_LO_WIDTH) - 1)))
> +#endif /* bug_line */
> +
> +#ifndef bug_msg
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp[1])
> +#endif /* bug_msg */
> +
> +#ifndef _ASM_BUGFRAME_TEXT
> +
> +#define _ASM_BUGFRAME_TEXT(second_frame)                                    \
> +    ".Lbug%=:"BUG_INSTR"\n"                                                 \
> +    ".pushsection .bug_frames.%"MODIFIER"[bf_type], \"a\", @progbits\n"      \

You may want to use %progbits here right away, as being the more portable
form.

> +    ".p2align 2\n"                                                          \
> +    ".Lfrm%=:\n"                                                            \
> +    ".long (.Lbug%= - .Lfrm%=) + %"MODIFIER"[bf_line_hi]\n"                  \
> +    ".long (%"MODIFIER"[bf_ptr] - .Lfrm%=) + %"MODIFIER"[bf_line_lo]\n"       \
> +    ".if " #second_frame "\n"                                               \
> +    ".long 0, %"MODIFIER"[bf_msg] - .Lfrm%=\n"                               \
> +    ".endif\n"                                                              \
> +    ".popsection\n"

I think I said so in reply to an earlier version already: The moment
assembly code moves to a common header, it should be adjusted to be as
portable as possible. In particular directives should never start at the
beginning of a line, while labels always should. (Whether .long is
actually portable is another question, which I'll be happy to leave
aside for now.)

Also nit (style): The line continuation characters want to all line up.

> +#endif /* _ASM_BUGFRAME_TEXT */
> +
> +#ifndef _ASM_BUGFRAME_INFO

I don't think these two make sense for an arch to define independently.
INFO absolutely has to match TEXT, so I think an arch should always
define (or not) both together.

> +#define _ASM_BUGFRAME_INFO(type, line, ptr, msg)                             \
> +    [bf_type]    "i" (type),                                                 \
> +    [bf_ptr]     "i" (ptr),                                                  \
> +    [bf_msg]     "i" (msg),                                                  \
> +    [bf_line_lo] "i" ((line & ((1 << BUG_LINE_LO_WIDTH) - 1))                \
> +                      << BUG_DISP_WIDTH),                                    \
> +    [bf_line_hi] "i" (((line) >> BUG_LINE_LO_WIDTH) << BUG_DISP_WIDTH)
> +
> +#endif /* _ASM_BUGFRAME_INFO */
> +
> +#ifndef BUG_FRAME
> +
> +#define BUG_FRAME(type, line, ptr, second_frame, msg) do {                   \
> +    BUILD_BUG_ON((line) >> (BUG_LINE_LO_WIDTH + BUG_LINE_HI_WIDTH));         \
> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                     \
> +    asm volatile ( _ASM_BUGFRAME_TEXT(second_frame)                          \
> +                   :: _ASM_BUGFRAME_INFO(type, line, ptr, msg) );            \
> +} while (0)
> +
> +#endif
> +
> +#ifndef run_in_exception_handler
> +
> +/*
> + * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
> + * and use a real static inline here to get proper type checking of fn().
> + */

I realize you only copy this comment, but I'm having a hard time seeing
the connection to BUILD_BUG_ON() here. Would be nice if the comment was
"generalized" in a form that actually can be understood. Andrew?

> +#define run_in_exception_handler(fn)                            \
> +    do {                                                        \
> +        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> +        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> +    } while ( 0 )
> +
> +#endif /* run_in_exception_handler */
> +
> +#ifndef WARN
> +#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, NULL)
> +#endif /* WARN */

No real need for the comment here; you also have none below for e.g.
BUG().

Jan

