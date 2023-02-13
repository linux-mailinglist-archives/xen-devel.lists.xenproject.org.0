Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930526945C0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:25:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494397.764436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRXsx-00036S-AO; Mon, 13 Feb 2023 12:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494397.764436; Mon, 13 Feb 2023 12:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRXsx-00034X-6r; Mon, 13 Feb 2023 12:24:43 +0000
Received: by outflank-mailman (input) for mailman id 494397;
 Mon, 13 Feb 2023 12:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRXsv-00034Q-6v
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:24:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 627a8d80-ab99-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 13:24:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7888.eurprd04.prod.outlook.com (2603:10a6:102:b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 12:24:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 12:24:37 +0000
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
X-Inumbo-ID: 627a8d80-ab99-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkpyWLfqCZjHbzy2DaTLa7+ogv0Ekka7HNNctKBMsupL26KLDKwf2iyJIgLY0LLzGwapgPFDN1ILFcCNEYvb3lToX+ue17bxY3o9XsehbU1U0J2Gx1GpKcdxgrABMnHSxFcOSuZWn0AV7PP8HQd/CFAoAxDj1XUc1/BxTZgCLWw17gsPcR9itH3kzRB31x42tRlzbY3tF4e/61iOLrTwhtjTiQKZAMvUwG5lJV3SteoVEisluyFZTMxoQTzUP/AX5j8nIwTQ49tiqp4MSx1yX6q68FsX+sL6o5m6nWgu4SYUHS946984cyBOYaNW8uDDPThH5/6rk5WWITvCslYfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YsjAhCBjbwcxdKKFnvaYX2fjq8yJPWPxAaiLi//Jfc=;
 b=f6c/BD0dodQhY3GeE/q/29EyREql7zgMMdANQIRIGSzgDfHtDCUjpcZxGWAU+OrAPLvp0RzatmSrp8GAKaq5W6phJGGW4XSZnOmgS4LPuRgTPtr2AyjumeoQxhY03+sqIe48tKJFkrxlXRkTcQWCbP2PtgzVl7h55EgLpMEdIclz8Ytn/TZfPJDjc74aZ+w6KoWqx04G8hdegKPprDpHksPQEOO/kOCGzaXyodPvWwubqIBIdnTdyG9Pfsd8TNzU3JdqLvxvp0ow8wlCI6B0gNCxFewKvYH0diM1JCsoUuVYVQOBJAz2mSJ+7Ir1YB66DhAvwo5UrPhib8PN8Xb0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YsjAhCBjbwcxdKKFnvaYX2fjq8yJPWPxAaiLi//Jfc=;
 b=xs0P5DP69zXD1c3czTuIo8yoiMSDXJaWCMT7YIBkTg9hzB+y8ma5UWyaBr3JIqlXSuBj1nXei1Atd3HUifan0e/V+XMdPHFUzoFFLjdOgwu/9NR7wrTqz0arvVzNH1TQrl54g5yxXTB0qVM2EXNGCRmbfn2Ct0WqqhM0WlU1057rGgS/Dulxb8dhe5OkwGQRgOTJ2vWbh/tGGy4dx1IZPhY2yxvUI1Jbn6BxYdNQOH1ZOnNgiwRO5tmWSu3oKg5jYVbJ2ky4e/sI5oERbxndgazOrbda8dyi81/K/59GHgOcXTPThBdPWCSibUuJbUXZSePxRlWgpV+SkcY9i9KJ9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
Date: Mon, 13 Feb 2023 13:24:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e79e9ab-0cff-4137-24bc-08db0dbd456f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S9IDMKI287TOj765tExJ2keVAOK60eLF9lVQ2FqyNkIgeUt0xPtRs1hlfLsYHIqaW/WQo5IQ7W9vW7bXSs/GokPHV0/iK1ag9Nc9fqBI/8lbdpL93ylvPuN/1LE4lTulXAPfXM9eYUzg2tZpBBVzG354lg/76s+LpYCAeeeNBmBCzF/DGzP6ysZ/zCq3ICb00AHtiXG/elroTO4ejVjRmx6xvHRqvA85SSqOZ3+2r1GTzYLaecOess5sxK+zosL9ZwnT6YDTijTboQePRzGqLGl3CT2Cv56EBGm4UmQmkfOgp7qsjyd5KGq26n6lO6lANe6HAeowcBP+FAFUEMz3Y0vcj+AGQqQ/DoaS+KuCdmCsYDdyRsPqhu+IoOiSqJHfoRXtBrr5d3cf7+qcjwyOxZWUIkmDYu9GzTINVXc/SAw9SO9Urk9ZqqbBKzbaBJ7MzwKUPNUw8asUONiIwkPFuljwBxuqUpzR6eUN+mrVZjB8rXtirR9CoTbE9Pex0ShaIpJ4QAkiKCkeVBU5jTq8Pb/Q5aB9xWuNcv56u9gCjj+ELKwEVPDGxYftKzuVnqmk+5H+DluvrUiuy2UoJ/WuSx/OnUCmPBQMsmddBhQ66XhsOza3danD5abjIAnnUklwtEarRIwhmiOQZALjc2ojmN7IBBPzecUoQ+2GC58C8JGcbSQt6HARNbIeAka0XfI0K53a2XBIHn2atcysYksDwJizy8DCCd/XuCSUsz7FRg1kPdUMUEC6OdN0tIQJE54Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199018)(31686004)(6512007)(83380400001)(186003)(26005)(36756003)(5660300002)(2906002)(53546011)(31696002)(6506007)(86362001)(41300700001)(478600001)(6486002)(2616005)(66556008)(54906003)(8936002)(66476007)(316002)(6916009)(38100700002)(8676002)(66946007)(4326008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXdqQmdoMnFxalJzY2pDY2JCL3RYVmk2ZVJmZFg0YTE2dXQ1Q2hzV21HQzkw?=
 =?utf-8?B?eVNreUhoRW02Vmt4OStuOTdQZitsWU5DbEZSNmFSV2lHTEZ2SWdSMUd5MzMw?=
 =?utf-8?B?bUx5TVYwa1VnR29ndnJtaEsweVhxN29vbWVoeXZtMk1jN3NvZzFKTGhwNzB3?=
 =?utf-8?B?cnVjRmdnRHhNeHcwWjgvKzJPMUo5WlF5Q2lrQVNCdEdneHRhNlpmOFV2a05z?=
 =?utf-8?B?RGVNVzlnTkN2NkNOMEYyeWh5aitCZHErMVo3enNnK0RFdi9jZm9zRkZMVGMx?=
 =?utf-8?B?NWtjNHdRL3gwb2Y1Z29JMFhxbXpiSy9LclhtSVBncnF0bnVCQTZzNVZRU0ln?=
 =?utf-8?B?UWJnb1BobzNJUzEzOGVIRzU5a2g3ZlhmTEhFMWdXd3VneHV2a3JyMDBMaXM5?=
 =?utf-8?B?SUtRY1Ztb2EyeTBJZ09BREtQWldyT0xBYjBmWkxEdTFBdEtpMCtCL0lkVjJL?=
 =?utf-8?B?c3hwOEc2OWgra3Q5UmVHK0ZTWnJYU1hMV1lZWkJpWkp4UEd1NGVpeUM0WSt1?=
 =?utf-8?B?d2IrOWdmUEhTUmtqRjJrcGJGSW9kekZkdk1MLzg4aFRkc3FmdVZRaU9Gb2Vy?=
 =?utf-8?B?ZG9wNm5MSm9rdit1U29jYjdHUThDNmkvMklzUGk1RlhEK2ZtZlV3NmdydFJ5?=
 =?utf-8?B?eFlrcVZaZktiNTNLTzh3UCtldU5OaTVyQ1R4TEcwZHB0eGhCK1FqWWRmSXl5?=
 =?utf-8?B?WGxhMVdoKzJDS1ljUWpWN2hNRVlCdFVVSkpnQ09DdEVydDBHR2hkQnFMVm5C?=
 =?utf-8?B?UE1yMldid0cxT2xzczV5dTU0SnJIbjAxYUs0UlpkdWJtSHlOb2dZdDZUZml2?=
 =?utf-8?B?OXpFTjFoK1RkRUpmQWdvOURJTUxKK05sSzhIUjVITGp2NkZvNkc3WTk1eklW?=
 =?utf-8?B?dm9HbnAyZ1ZaaktmOVY4bzZyU01DSVFKb0ZmckhjbEErWko2UUhsUm51NEd3?=
 =?utf-8?B?NkwxMFVwdWRic1l2cDgwRXVOak92NG53dWlwWmlLbzBlOXp6UGIyNUlUMlFa?=
 =?utf-8?B?OEI4WFlnaVRCblJqcXVoUzFkRzlXMGM5b2wzNGJzVzBEMEpqUmUzM0dUUnpV?=
 =?utf-8?B?RTdDODY3ZUJid2xHUkVTYkk4WVprQnVTbUM0c1lqc1lneXFsUkx5enJhaFNE?=
 =?utf-8?B?cmJxUit0ZWVBbG1GcHFYUFhvc2t2UzZZd2plSEFLLzBXNnMrMElrQy9Ld0Nq?=
 =?utf-8?B?RzNCaDQrSzA0dERja0RhemEya3kwditlMmF5RU1qWVZuaEZia05KTlJmUDdT?=
 =?utf-8?B?ajV5Z0l6TmZaRGNYeG5PTWZIUU9lSUlGUGp4QzFjVHY1eVZCSTZ5Z0lGT2ZE?=
 =?utf-8?B?T1VOanFwanZEb1R6OGcwM3BRNS85Mkg5bVNubU5qc2JIVnhLREVzYUUzSjV1?=
 =?utf-8?B?WVVFVVBsMjhZRHpnVG1LeVZEUDRFMkFYdDVGa25hdFhsWW5ZOVVrcXRPYTNh?=
 =?utf-8?B?dEVaWDBqT2RQc2g2SE1KM0hRTTYwREJTckpHd3ZDUEl2dVJZNHR5NS96UlNt?=
 =?utf-8?B?RXB1ZUNBL1U4aDJISjFLaW0yWE9qdjRkcHBpVXlxaEN3NkF6bUhkSHY1QzFq?=
 =?utf-8?B?TnZuR2p6aXpOOU1wNmJlNGQreHpEL3U0ZWt5cDBxWnc0RDdmOTN0MkdpSkFH?=
 =?utf-8?B?NWY3STgrSWJ1U1UwdWNiaFV1RS90UlNXdUoxa1kwRUxSWk9VenY3S2RhRXhF?=
 =?utf-8?B?endiYzZVeHB1c3VMWUdWd2FEeVZlM3FkbkIzMnA2RkcxZjBCRU9wWXJVSFpL?=
 =?utf-8?B?Sll2b01hQWE4a1p6R3R1SmJMUDZSYUtIZTZaU2pmWHlVRDR3RU9CZnFuTkVs?=
 =?utf-8?B?ekFzSlRFdEdWallXK2J1MlB3R3lweDFJTzlvUHFyOElxb2lnWHhuOUx4WlI1?=
 =?utf-8?B?ekpVNmpTVVNBT1J6U1JiZDl1WlRwVytYTTlWY1QwOWhqWnZUQnR0alIrQnZQ?=
 =?utf-8?B?bnNrS0hlZUNEMlNPSkZ1UGp2bGNvWTI4dlJPZmNYQmVWdlFvM2ZrcXZCMElC?=
 =?utf-8?B?ZGpQMFlRVS9SMWNNdmpFNFBleTRDYWliT3RzTm94V0NRc2JzY2NONk9IWVd1?=
 =?utf-8?B?MldPZXlCeVRQaWdPTEM5dGxON1YvYlZJcC9yenp4Wkc1WCt1djNoQVJEUzlr?=
 =?utf-8?Q?eEyA6btqfIIkrNuJ5rVAhZSsV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e79e9ab-0cff-4137-24bc-08db0dbd456f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:24:36.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 274Rcgwt/UCWAqXcHN48FWd4OZZ/gWA854JZs6SSlCzKit344jCTzAzObx1zCoqup1lzeAcQJdTuERMTl7+Mhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7888

On 03.02.2023 18:05, Oleksii Kurochko wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -92,6 +92,12 @@ config STATIC_MEMORY
>  
>  	  If unsure, say N.
>  
> +config GENERIC_DO_BUG_FRAME
> +	bool
> +	help
> +	  Generic do_bug_frame() function is needed to handle the type of bug
> +	  frame and print an information about it.

Generally help text for prompt-less functions is not very useful. Assuming
it is put here to inform people actually reading the source file, I'm okay
for it to be left here, but please at least drop the stray "an". I also
think this may want moving up in the file, e.g. ahead of all the HAS_*
controls (which, as you will notice, all have no help text either). Plus
finally how about shorter and more applicable GENERIC_BUG_FRAME - after
all what becomes generic is more than just do_bug_frame()?

> --- /dev/null
> +++ b/xen/common/bug.c
> @@ -0,0 +1,88 @@
> +#include <xen/bug.h>
> +#include <xen/errno.h>
> +#include <xen/types.h>
> +#include <xen/kernel.h>

Please order headers alphabetically unless there's anything preventing
that from being done.

> +#include <xen/string.h>
> +#include <xen/virtual_region.h>
> +
> +#include <asm/processor.h>
> +
> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)

I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
environments that's redundant with "unsigned long", and it's also
redundant with C99's uintptr_t. Hence when seeing the type I always
wonder whether it's really a host virtual address which is meant (and
not perhaps a guest one, which in principle could differ from the host
one for certain guest types). In any event the existence of this type
should imo not be a prereq to using this generic piece of infrastructure.

> +{
> +    const struct bug_frame *bug = NULL;
> +    const char *prefix = "", *filename, *predicate;
> +    unsigned long fixup;
> +    int id = -1, lineno;

For both of these I question them needing to be of a signed type.

> +    const struct virtual_region *region;
> +
> +    region = find_text_region(pc);
> +    if ( region )
> +    {
> +        for ( id = 0; id < BUGFRAME_NR; id++ )
> +        {
> +            const struct bug_frame *b;
> +            unsigned int i;
> +
> +            for ( i = 0, b = region->frame[id].bugs;
> +                  i < region->frame[id].n_bugs; b++, i++ )
> +            {
> +                if ( ((vaddr_t)bug_loc(b)) == pc )

Afaics this is the sole use of bug_loc(). If so, better change the macro
to avoid the need for a cast here:

#define bug_loc(b) ((unsigned long)(b) + (b)->loc_disp)

> --- /dev/null
> +++ b/xen/include/xen/bug.h
> @@ -0,0 +1,127 @@
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
> +#include <xen/stringify.h>
> +#include <xen/types.h>
> +#include <xen/lib.h>

Again - please sort headers.

> +#include <asm/bug.h>
> +
> +#ifndef BUG_FRAME_STUFF
> +struct bug_frame {

Please can we have a blank line between the above two ones and then similarly
ahead of the #endif?

> +    signed int loc_disp;    /* Relative address to the bug address */
> +    signed int file_disp;   /* Relative address to the filename */
> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
> +    uint16_t line;          /* Line number */
> +    uint32_t pad0:16;       /* Padding for 8-bytes align */

Already the original comment in Arm code is wrong: The padding doesn't
guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
size. Aiui there's also no need for 8-byte alignment anywhere here (in
fact there's ".p2align 2" in the generator macros).

I also wonder why this needs to be a named bitfield: Either make it
plain uint16_t, or if you use a bitfield, then omit the name.

> +};
> +
> +#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> +#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> +#define bug_line(b) ((b)->line)
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
> +#endif /* BUG_FRAME_STUFF */
> +
> +#ifndef BUG_FRAME
> +/* Many versions of GCC doesn't support the asm %c parameter which would
> + * be preferable to this unpleasantness. We use mergeable string
> + * sections to avoid multiple copies of the string appearing in the
> + * Xen image. BUGFRAME_run_fn needs to be handled separately.
> + */

When generalizing the logic, I wonder in how far the comment doesn't
want re-wording some. For example, while Arm prefixes constant insn
operands with # (and x86 uses $), there's no such prefix in RISC-V. At
which point there's no need to use %c in the first place. (Which in
turn means x86'es more compact representation may also be usable there.
And yet in turn the question arises whether RISC-V wouldn't better have
its own derivation of the machinery, rather than trying to generalize
things. RISC-V's would then likely be closer to x86'es, just without
the use of %c on asm() operands. Which might then suggest to rather
generalize x86'es variant down the road.)

At the very least the comment's style wants correcting, and in the first
sentence s/doesn't/don't/. Also %c isn't a parameter, but a modifier.

> +#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
> +    BUILD_BUG_ON((line) >> 16);                                             \
> +    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
> +    asm ("1:"BUG_INSTR"\n"                                                  \

Nit: Style (missing blank after opening parenthesis, and then also at the
end of the construct ahead of the closing parenthesis).

> +         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
> +         "2:\t.asciz " __stringify(file) "\n"                               \

file is always a string literal; really it always is __FILE__ in this
non-x86 implementation. So first preference ought to be to drop the
macro parameter and use __FILE__ here (same then for line vs __LINE__).
Yet even if not done like that, the __stringify() is largely unneeded
(unless we expect file names to have e.g. backslashes in their names)
and looks somewhat odd here. So how about

         "2:\t.asciz \"" __FILE__ "\"\n"

? But wait - peeking ahead to the x86 patch I notice that __FILE__ and
__LINE__ need to remain arguments. But then the second preference would
still be

         "2:\t.asciz \"" file "\"\n"

imo. Yet maybe others disagree ...

> +         "3:\n"                                                             \
> +         ".if " #has_msg "\n"                                               \
> +         "\t.asciz " #msg "\n"                                              \
> +         ".endif\n"                                                         \
> +         ".popsection\n"                                                    \
> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
> +         "4:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 4b)\n"                                                \
> +         ".long (2b - 4b)\n"                                                \
> +         ".long (3b - 4b)\n"                                                \
> +         ".hword " __stringify(line) ", 0\n"                                \

Hmm, .hword. How generic is support for that in assemblers? I notice even
very old gas has support for it, but architectures may not consider it
two bytes wide. (On x86, for example, it's bogus to be two bytes, since
.word also produces 2 bytes of data. And indeed MIPS and NDS32 override it
in gas to produce 1 byte of data only, at least in certain cases.) I'd
like to suggest to use a fourth .long here, and to drop the padding field
from struct bug_frame in exchange.

Furthermore, once assembly code is generalized, you need to pay attention
to formatting: Only labels may start at the beginning of a line; in
particular directives never should.

> +         ".popsection");                                                    \
> +} while (0)

Nit: Style (missing blanks, and preferably "false" instead of "0").

> +#endif /* BUG_FRAME */
> +
> +#ifndef run_in_exception_handler
> +/*
> + * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
> + * flag but instead rely on the default value from the compiler). So the
> + * easiest way to implement run_in_exception_handler() is to pass the to
> + * be called function in a fixed register.
> + */
> +#define  run_in_exception_handler(fn) do {                                  \

Nit: Just one blank please after #define (and on the first comment line
there's also a double blank where only one should be).

> +    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);                 \

x86 makes sure "fn" is of correct type. Arm doesn't, which likely is a
mistake. May I ask that you use the correct type here (which is even
better than x86'es extra checking construct):

    register void (*fn_)(struct cpu_user_regs *) asm(__stringify(BUG_FN_REG)) = (fn);

> +    asm ("1:"BUG_INSTR"\n"                                                  \
> +         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
> +         "             \"a\", %%progbits\n"                                 \
> +         "2:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 2b)\n"                                                \
> +         ".long 0, 0, 0\n"                                                  \
> +         ".popsection" :: "r" (fn_));                                       \
> +} while (0)
> +#endif /* run_in_exception_handler */
> +
> +#ifndef WARN
> +#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
> +#endif /* WARN */
> +
> +#ifndef BUG
> +#define BUG() do {                                              \
> +    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +#ifndef assert_failed
> +#define assert_failed(msg) do {                                 \
> +    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
> +    unreachable();                                              \
> +} while (0)
> +#endif
> +
> +extern const struct bug_frame __start_bug_frames[],
> +                              __stop_bug_frames_0[],
> +                              __stop_bug_frames_1[],
> +                              __stop_bug_frames_2[],
> +                              __stop_bug_frames_3[];
> +
> +#else /* !__ASSEMBLY__ */
> +
> +#ifdef CONFIG_X86
> +#include <asm/bug.h>
> +#endif

Why this x86 special? (To be precise: Why can this not be done uniformly?)

Jan

