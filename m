Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F85D695FD6
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 10:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495080.765329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRryu-0005y4-Bt; Tue, 14 Feb 2023 09:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495080.765329; Tue, 14 Feb 2023 09:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRryu-0005vO-8F; Tue, 14 Feb 2023 09:52:12 +0000
Received: by outflank-mailman (input) for mailman id 495080;
 Tue, 14 Feb 2023 09:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRrys-0005vH-0z
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 09:52:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3df3bcac-ac4d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 10:52:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 09:51:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 09:51:38 +0000
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
X-Inumbo-ID: 3df3bcac-ac4d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKPgDmxr3JcwFy2oMwj1JOMtn3GayE2zJrurM61g4yBQHPHGjsgPc7N5WWDc6saCpY4eOhr/waAiiu3CwBpUQQgSzqg6uwbddhIp0s2YLsgDTe0s4FyVDKGbGIB9hEtMN00FnKMPHwFxkOGM4kea80KOhFP4UBHXcfyEH5I5NFcc2FCEGRftsjA3iMjvTwTNKnmji9v8PQW1NGl6qIBbh1EBxflxJ88j4apU7qWfpAl+yjzQOuq3HaV9FvYt05Aa3MELcs1gadpOjbPQZpKpyO2Zx1ILWXAXN2TmmZ/gyL44oEKX3721OFbJv3a4zbAPQXNx1SfTCcAMdEaloWHAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZocWXyZtw3yVPEYBp1SF2PtD/fD8PSpNe7v3NRbbHM=;
 b=RXt85asNcjIuwysUjGxYtfgYo1wGm+gHeRW6HE6deInq0ol++rklwYQU0WqB0GdmqiRVfQYa4IVbHmW4/yquWySrfwBHOjZvzwgoSFQgXAac97/6upEKzq/bCbNX9RyJndBcgQWuxPcw5GJSr+FhGAD0vobmoaSOoPmHK81HKoBkvmwf6dZyndDtek6VVpcKVr/j0pV3UIRQ4ZUMbB1EOQ2qgpleyoM/ecnM88uTfD+KFw0VxVh5V6e9Ngzii3+5l/rvmmzv1++dd3Ly8Ta/ewRvMUIW+5KAMrW0ZMcbP4zTffcSXmKqkBXkPLHJW8CBEdhIWsgjSjMtY1V63Fz57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZocWXyZtw3yVPEYBp1SF2PtD/fD8PSpNe7v3NRbbHM=;
 b=mVyVu0HQLAQUauSmhoQl+spLB+SfCqk33Pa7dJhT7q+hZSScozSKthwh4eByEyrul2AiNtgb71Klbvz2HLK7E3S/rNzfAzvt93oMAz/aSMB7UOL6VRf9Dd6vAoqD05nCnFC+yKNPH/mAruiofYKXPtWe99awewfxO0oV5tsATdygkPkrZMfMApP4WAtFOpyGsD7uo5YXVSes7HDtXPkovGK+OmrGx2/9Ui1gYXFjqqYAHQ6PTU6z4JjLX0HBxhcg8c9QrOVVneV/QcHoule5MwiEbbzQPIl7GUITUaii1ghFiWmUTXwKWOiLtGPJtOrfcIYXk0nbInFNBvrMJoJQBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d86325f-8706-98d1-c233-963fd42076fa@suse.com>
Date: Tue, 14 Feb 2023 10:51:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] xen/cppcheck: add a way to exclude files from the
 scan
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: wei.chen@arm.com, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230214085635.3170962-1-luca.fancellu@arm.com>
 <20230214085635.3170962-2-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230214085635.3170962-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 7637d48c-08f0-4b67-7e13-08db0e7110d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FagKfigS9DpOYHHdnTwak8NgJprW/oswTgv+6tGCG9K2QwGxfcUAomXpg2XLjZ/cLdHvLa24NaaCeSreaiNimLPfdIYK1KxLzPQL3mtMkpQOZslqo/Oy1o7EV84XdGCgXEpxMHJe5S0AIXT5XNjwvzC890AjbVP4BBL+zUKjFF4An66eEvY0GZbHgAF0omzngeYvdH+PV6BPdAyro5QDb+H/J0RVTa14xr738PRM7i4HWYvQAvzgHHww1ib6A3xhab617RvRphdmrFI4RMYDkPLHdl2kZHzblkFKyY9W4+VS1O0M+/q0NqlNbTAis7xATN0URMPN3Lf8ZD18WP6ClFjqLU22b/w3lzW7BIgHLP1wKkd7SycC/MV+Q9cDpyB5ZWCJbzV4Pr1rRl5bIOcvIOwbxxJ8R/QfcvAPxgezJADSMZa/OQD3AGtI1y8AYyQ6p0NMuJDfPV1nXEUK/mwxnhFVuUuYlhyntSgLhzhCU5brIceYs4mK6YOeNXFc/hjeJiIJNEt8uuHQfITqQyNAyLiuZKRJbk2tLZB4Pg0nKeWSNbJbU2TOk7aFqM/x4NSco6FXAaAhSPxgqfdVld2o1yIlUHXPTFjeW8QJOpNL38Qj89yfxt3hwaNwJ52lMYluoqi69DePCbDMuiVGK214CjNelKBYz5XEex2a3/VZeY9t3JKc7FEUG3rHRtbZM3q/02JcONI7AgYO1exR3Y58Uxzdn5s0Tf6GU63w4S9iXydr1OpAzVTfUbUVwL/ewvuW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199018)(31686004)(66899018)(53546011)(26005)(6506007)(83380400001)(6486002)(2906002)(36756003)(38100700002)(54906003)(66476007)(66556008)(6916009)(8676002)(66946007)(4326008)(186003)(6512007)(2616005)(478600001)(6666004)(8936002)(316002)(86362001)(31696002)(5660300002)(41300700001)(7416002)(43043002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW9MNHpWRUVTK2Eyc1lpYTZER2llYWk1aHlxVGxaNWlBTmlVQytsN0tTK1da?=
 =?utf-8?B?SXQ1VTBPUEVHajBremlkMERHVm8zZkZMamZ4M2piRHVST042cncyeUNndXZk?=
 =?utf-8?B?ZFVTOU9lbDdMRU5oanhDNVdIc0FIT1IxMnlkZUpOQ3YxcnZvK1RUWGtMWXRO?=
 =?utf-8?B?RTJWTTc2a1prRnpSdTNmSys0WVJMTHhmZjVCd01zMjlqckMyQTBkNktva29v?=
 =?utf-8?B?cFU2aXdabWZsblpNWUMxRlhuMjVRbXV2b1RBeXRta21scVFaay8xOEtaMSt2?=
 =?utf-8?B?cHZJb3Z1MUdURlFLZ1FoNkk3RmoyNCtaT0ZOZnNPVDFaZWJnY1d0bVhWL2tF?=
 =?utf-8?B?RWRCbllQOG5oYmVDb3FMd29IVEsva0ZUMnBURitDaExTQnprYlFoVEh1R2xy?=
 =?utf-8?B?TVBEY3NxWlBWbEk5UzRVRkc2RXpiTkw1aG9QZjNDWXRHb1pYVlAzMFdQb0dF?=
 =?utf-8?B?cGtVditwZlRLM3NoQnFsOWNNYm5lRndqdmh5cTJHbnBaM2w2MWFLSHFmeWhT?=
 =?utf-8?B?UjlsZnVaMTNEbmRMWlpkR2p0VVIyT0J2QTJ5SzA2SXhycjdPZW9rR1EyVFBn?=
 =?utf-8?B?ajJBQUJ0aDEvYVgxLzkwNVhsZkR0RTFXMjV0SUZxYW1sSVdUMjVqVXRYbFhm?=
 =?utf-8?B?NmFUUmQ5RjBJNXRCNVdKMDE1MlVYWVJWUlk1WmJDQ0dhRXVaZHI1SzJ2aW11?=
 =?utf-8?B?cU1hU1M5VEQ2RWQ3TjFGNkZMZTBFUXcxQVA0V3FiWEVjR01qZ0djaWpzM0RO?=
 =?utf-8?B?dDZ1Q0N4VkgyeU1ld2RzVm1vSzZzZEU5eUFWSTcyUEVZZzhuYnovd2ordnJV?=
 =?utf-8?B?ZjZFTlBvbEZOa0JlS29XdVhGZ2NQVzluUjBWRWlZdFB0UkNtVHEvS0pTSy8v?=
 =?utf-8?B?bzBwYmFjMGdFNDZxaXRTTzAzRWNjWUVRaVlhTDF6U3JtYkNrNE5ONE5CTmlG?=
 =?utf-8?B?ODhDUW5STVpMUSt3Rk1vTWVnN3FTMWdTUTdYSHZMb1B3TWY5SkFnMCswa3lI?=
 =?utf-8?B?MUk3cXZmOEg4ZW95R3JjMGc2aXltY1MycmdLQ3JtVTAxUkFzazdHYWFFd0RW?=
 =?utf-8?B?MFNpQUUzSE56c2lRRi92SldnSWZud1ZYeWExS1Y4U2JYSitTNHhQUytFZlZm?=
 =?utf-8?B?cmZrRVlKcE5vTE53TXh6bldkdEZaK3R1NUZQSlBidGI2Z2tydFR6ejJnZ3pz?=
 =?utf-8?B?ZW5WZ2JkZTMwVTFHZXFIM1JxemZ0WDNlQzI4SEQyMUJ3V0crY3RzNzdNYS9w?=
 =?utf-8?B?U2paVTZTUng5YXB4ZUx4YVEzMFNEZW16RHBXQ0ZaRDZXMDV1U3dDSlRZOVJO?=
 =?utf-8?B?YlBqNjcwSEFZZXF6b01DVzQ3QnZlclIrc0tsdnJkZjdEUDJJL0lkcVVUczhD?=
 =?utf-8?B?ZWNLMk1ockczRmpreDZTVDR2S1lYb3dKYm03anVyMHBkelNaQ2RRWk4vMmVz?=
 =?utf-8?B?NnFMRWFoNlo3UGxsYlh0RVdwN1o4eUpHNDdHa2V4SkliQ014RXgrR3Z5b0F5?=
 =?utf-8?B?LzRURURrWlRJSHhxaUJBa1hhU1ZoWnJJWkNVWjlHQkxJTHlDcUx5cTZPV1Rw?=
 =?utf-8?B?NUxjc2pLeVZUbHlLQ1I1cHNhL3JGVlFxOGFyVFhjQTdaSjVjRVg0SmloN09I?=
 =?utf-8?B?VGFEWGRtakxjUWlUaXhCNUxuNnY4MkQxZEhObXlHRGFIMjVtU0VGR01nYkVX?=
 =?utf-8?B?UDVzL0t0Vm1JazFvU1p5S2ovU1AzbGxhYlQwWUgxcVZwaUZBN2ZCQkZKN3po?=
 =?utf-8?B?cFZOVjRaWjVkditsZ0pDbnpYb1ZhVDJvWTE1VVRsMGpodnJiM21FV3QzRFho?=
 =?utf-8?B?VkxuY21mNHZJU2wwMXE0cXo3ZnRFTGhieC9IOENSWDFxVlI2VXMzSUVFL0d1?=
 =?utf-8?B?eEJJYUlyeGpIZWhvUXNROXlUN2pvWGZEVlp1UHFicnNTMlI3Y0VMRGlQdEdK?=
 =?utf-8?B?eE5WWlVnYkdENEFOd0pyakZUSm5qeDI4ZVBOSWNhejB2Vjl6VHgrdkFjZG5V?=
 =?utf-8?B?R1IrOTBaYXNqdVJiM3J2OXNyS3l2bFlwemtsV2hnek5FSjNqNUZBWlNtZTFJ?=
 =?utf-8?B?M0lIWnZtVW4zWFhiVUpEaHU5bGdiUnpjdGsycktZTUVhQjBqYzlIcUpka2xQ?=
 =?utf-8?Q?E6UDrWFufQa6InJokcje7F7sh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7637d48c-08f0-4b67-7e13-08db0e7110d2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 09:51:38.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnEQostgJIO74e7GN6ALuJ2KD5rspNNkmdA8syB5RMStD6INeMKDxkmBy6gW1zEGlSTHspjrWc2jDHTEEVrPbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

On 14.02.2023 09:56, Luca Fancellu wrote:
> Add a way to exclude files from the scan, in this way we can skip
> some findings from the report on those files that Xen doesn't own.
> 
> To do that, introduce the exclude-list.json file under docs/misra,
> this file will be populated with relative path to the files/folder
> to be excluded.
> Introduce a new module, exclusion_file_list.py, to deal with the
> exclusion list file and use the new module in cppcheck_analysis.py
> to take a list of excluded paths to update the suppression list of
> cppcheck.
> Modified --suppress flag for cppcheck tool to remove
> unmatchedSuppression findings for those external file that are
> listed but for example not built for the current architecture.
> 
> Add documentation for the file.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/misra/exclude-list.json                  |  4 +
>  docs/misra/exclude-list.rst                   | 44 +++++++++++
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 21 ++++-
>  .../xen_analysis/exclusion_file_list.py       | 79 +++++++++++++++++++
>  4 files changed, 146 insertions(+), 2 deletions(-)
>  create mode 100644 docs/misra/exclude-list.json
>  create mode 100644 docs/misra/exclude-list.rst
>  create mode 100644 xen/scripts/xen_analysis/exclusion_file_list.py

As I think I have asked for before: Can new files please avoid underscores
in their names, when dashes do quite fine? Or does Python have special
restrictions?

> --- a/xen/scripts/xen_analysis/cppcheck_analysis.py
> +++ b/xen/scripts/xen_analysis/cppcheck_analysis.py
> @@ -1,7 +1,8 @@
>  #!/usr/bin/env python3
>  
>  import os, re, shutil
> -from . import settings, utils, cppcheck_report_utils
> +from . import settings, utils, cppcheck_report_utils, exclusion_file_list
> +from .exclusion_file_list import ExclusionFileListError
>  
>  class GetMakeVarsPhaseError(Exception):
>      pass
> @@ -50,6 +51,22 @@ def __generate_suppression_list(out_file):
>              # header for cppcheck
>              supplist_file.write("*:*generated/compiler-def.h\n")
>  
> +            try:
> +                exclusion_file = \
> +                    "{}/docs/misra/exclude-list.json".format(settings.repo_dir)
> +                exclusion_list = \
> +                    exclusion_file_list.load_exclusion_file_list(exclusion_file)
> +            except ExclusionFileListError as e:
> +                    raise CppcheckDepsPhaseError(
> +                            "Issue with reading file {}: {}"
> +                                .format(exclusion_file, e)
> +                          )

My Python isn't very good, but isn't indentation one level too deep
here?

Jan

