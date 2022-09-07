Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A25B03B2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 14:12:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401450.643303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtuz-0000Dy-2Q; Wed, 07 Sep 2022 12:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401450.643303; Wed, 07 Sep 2022 12:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtuy-0000Bs-Vt; Wed, 07 Sep 2022 12:12:32 +0000
Received: by outflank-mailman (input) for mailman id 401450;
 Wed, 07 Sep 2022 12:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVtux-0008Nb-9J
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 12:12:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57ef0dce-2ea6-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 14:12:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7404.eurprd04.prod.outlook.com (2603:10a6:102:8f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 12:12:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 12:12:27 +0000
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
X-Inumbo-ID: 57ef0dce-2ea6-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX1oBx9yjBMwPuiua1Z1GfjR0ktwwZulkkHJpMAV3FgZJhpkW8+cDH1BGw9ZiGeTYSnzKDJQcZ9DWgBX9uPPQNX8WD5/u1EE7FwnTWVVn2NH4qAahi/XDeFO1aIfp8Dm4v/wrFmfjcKsTK+U3zftKzf9yVI8LHKgDUZ82WAtezIAm5Ve6RVgIguNijj9ejlObp9aiUktTBfoBOS1wn8vR0xb2PITC8dxY1NFhygNFU8HfH1tGcdiznNYwCbEBvWd1qQUbPmq63BtWuJuxqgw8axx34ncDfmVqpsGKbR/LncipSLa0AVSntDC/y3+tcFDBocIp02CBATA8yB6gON8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIm6Lb9lUpyeG1rj/K/O/GvuUTTYgu++SwSYDBeUgTE=;
 b=lxH1AwUltci1hU5ujAuZHhmW8kbVyKz1/t/DkJMbdOdlJQX3T8fmyD038m7EA4WG0Sqfxkuic2g9Sbl0JQB+zRoaj1EqNa37Hu86gjUq4mbU4b9qAL3idGOG+NgVGVkjlQp2952LhR328AE/oLVuDiCuzO5RYPrWEmGoBU4Uni/q/ICWOULNCC+N6fUKOunzQ3kpFGKE500qgOXZCbedGfnA5iIHDVpFNK332ihBj2Oq94tYhChRkXRjs61kZASMShIvOzzVH87kYMNKVl3i4KO6egWpbGP9LHNiXLjal+xpCNoelGJS2SPVPJrXybmJhe7cjW3G2WRyuQ3vXUNRuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIm6Lb9lUpyeG1rj/K/O/GvuUTTYgu++SwSYDBeUgTE=;
 b=B6PgIpM+bENg9eo3kWSVkrggSd5g4qKG/nkav7JhmnkmN0FkvPNJtmHSyl+QfYluCHQYjy/ZVk6rGK5LplnSQa9Im6Bmp7O7ady6lyCMJoiC1s9pM8nHrawM92tRuVl5lL0cIrgb+e2akWVdoXY0p/oX4WBY7YHVXApuh4wiped4dyGY+uesaaOg4gEayOESo9WFAm528iogb+dC4gBUfdb3ARSgTurapVMEUKHrUqQd6/hYyZKZTBzkbeT9GYEd6LuSVmh/RTcjjYSI5NhUGY0rFy41zciU20TzXtJd7bUYa1rw67aSH8A8GUBqWnRgU0UHdqgsDksTe2jwJQBNhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40400a52-b55a-1c35-5ee8-32ebfb08bc28@suse.com>
Date: Wed, 7 Sep 2022 14:12:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen: Add macro for version number string
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
References: <20220907120420.387771-1-leo.yan@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220907120420.387771-1-leo.yan@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: 041e9d63-3838-4e70-2dc0-08da90ca3ad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kSgl+8rD32Db2Eiq7fmi/tDmt2YDAIyn/WOMw8vrLfOyc0Cybyh5ulGqocZWt65WQC5waUhzvTFsOgRzXo10ux7xoEOnbJe4R0OPur7UTh/ZCagEndp2fqD7Ju3Ty49I5b/27ND5syVrYTIQpAsGdvIKCU3qdwaw2iEyMeWWFVlyQwV3+HLPk7ZtbGFhVSLaeLFj12dQL7kJQGaEzO+eqKC+7C0hQmJcFd5/5h8lIH3MyaEYNMu+S+37RGC2uT/azQa6SCFcC2SCqd2H3eYfEfmolaPrWOHHi/O+/CGDcEGjF2RfYS8V2qBiAG2Fp3RbE65urPoxf47c2Lak0IMK1VpKfFamzj0RWSxJ9VGlPTrkSxnaDTGtJSNiMxVdjjQtLvcpRnENsAS9yBR3o9v528Foz8RieNRLsOJE+ZDbHlcaknEwsNEQPx2bltFuKYZIOR/tyZvqvRP9RBsxY1RHehvwHTtovJQu+QUPn71SnefHqyC5/hx3Mq+vKJp+/4iMUuMfUXuOLTAAFRdGg1mWz8J1qBpi8JYD5QBXjZiaaIdnE/Ep3mP485RbPu+pUj93lIMRXEp3i8RbyL6y/Do0bvjiGZwu5xclULLn2Kavm5WlIMb1R/0xjdU1yZbGEuuYopvPgnY5Sc9Ln7VW34q7iI9e3gg8xaMClW1V+cMIVJZS6ywlzvU9SLJ+/tpqBlUHgIDIahvZ8khjVM/wPj856O5u1C2itTLeMwRkPv/3zCvAmzArdZSDTAwj4GgXS9x6yyHJAYLLvk6h/5Wzgldz30k3rZnetUWDj/3Mh3W6koI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(39860400002)(366004)(346002)(136003)(186003)(8676002)(4326008)(66946007)(66556008)(66476007)(6486002)(54906003)(6916009)(31686004)(36756003)(316002)(478600001)(83380400001)(2906002)(53546011)(6512007)(26005)(8936002)(41300700001)(2616005)(38100700002)(5660300002)(6506007)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW9vclFaWEUvZDRSQTJ5ekFVdHNNM2p6bDh2UkQweTFWY2paWXFST01NU3h5?=
 =?utf-8?B?YW5xVy9kNVl1ODV6ZWVpTmNyY1d3Y28zeXNrRDdSb0NHZW1PdmI4bzBsRXp1?=
 =?utf-8?B?Z3E2ak1FdGxYVnd5Rk94cTBtZW1QWVpFNzF5cDJqbnViTFF5ajFqck9RMkFj?=
 =?utf-8?B?NW9yNkRnc1lmNjlhRGw5b2xpQ25MTUtpV050VEZ6YnlpVzJBNUVQZU45MUhv?=
 =?utf-8?B?Q0RjKytRM2U0dUhqRVhBUkRFR3ZmaVFxampmQTZneUxxOGZIWnYwMzFvUTh4?=
 =?utf-8?B?VmcyM3YvWG0wbVNTWTU4QmdjZEMxTE1peVQzZ0xDSXlLa1lHL1A4RXdRNmtS?=
 =?utf-8?B?a0poWkNwdHVSNnRydmFOciswZDdLWHJ3S2dYcUhobllibUpLZVNBdGVmYVVm?=
 =?utf-8?B?RFpHV3kxVEMvQkE1Q3oxV2VRQnZPKzhjYzUwSkRUSE9pV0dPM3RqSUdyQlZ3?=
 =?utf-8?B?a0Mza24vNnpYSUU5N2IwYVRkMzZhbjRyZjF0VVhLbVVYK0d4bThOQmNwZG1u?=
 =?utf-8?B?M3RHQkhiQllidW1TMUJyVUVpZVZWS3AvQ3poN0YxYVRKQXJaVmZCVitSY0ZY?=
 =?utf-8?B?NzRnQWRGbUJvMTA1U0hXQzZqQndIanlkclpEOTlkVXFPY0s3eDZkcDhrbngy?=
 =?utf-8?B?QlB4NkVhajMyUjBrY3dIRmpIblJ5V3pEYkE3amxQRG5rRUd0bitqdzd5QzM3?=
 =?utf-8?B?ZnQwNW53RE1FNjN4MlF3WVBURGNwelBCUVVxRzA2UGdacGE1c2x6bVIxc2lR?=
 =?utf-8?B?YmNRUVo5NUhCek9WV3ZFMHg1RWY3YnpQNG4zM2FFNkwvTXVlVnBlbmJ6U2ZD?=
 =?utf-8?B?TEExc3RQbkRvSm5PeUp3eWRLZXMrcTFubGpuZG1mekJPYkIzOGlrY1YxNHVz?=
 =?utf-8?B?b0wzeXRSWExHQnhJR2JXV3FMYk5BYTUwTFNyRW5QZWN4MzdyUncxNnhuMlQw?=
 =?utf-8?B?RDRlRnNETzJDd3BmRlZJNmNBcEpnOGVwd3FSSFhnWmJsbGM3UjNyODRMRW1V?=
 =?utf-8?B?U1RnWWtMdEd6YUs2MENNSDhtOXdTSWFoOStCbWVpc2FPN2hhM2tGNjloZ0Rp?=
 =?utf-8?B?S1NpbDBRdmdTV2xQbk1yUDhRdjJCeEZlRnpHV3VyVFhyNkpscTFrc2U2THMz?=
 =?utf-8?B?UENYcHVsank1aUhTaG9mWkthcmV3eEdudXNELzdxWE5YNWRLbUxqNk5QeUJJ?=
 =?utf-8?B?MEc4cDNqUlBIVWthcFBicXJMU3ZoTFBhY3g3RTZFVDRHS2hVVVlkbGs4WnR6?=
 =?utf-8?B?UTlnMUF3QU5CekxTTmNBWHV3Vmx1L1pNRlJLNVRqemlNUHltL3JJbG1uYk9G?=
 =?utf-8?B?MnNxZE1veHBKcHN1Tkl5VjNwK1ZCRFE5OEpNMmx3cTVLM0k1cnE2K1BWWGdk?=
 =?utf-8?B?V2ZsQ3p3d2dOVlNvMmRQR2ZsSnpqNzhlNzNOYkVSSGRqM0lodWVGczl6UlQ5?=
 =?utf-8?B?TTEwdk92QUkwQ1ZDbEpmZkw0amEyRzBnZUd4SmVFMXZJOWpQL1V2MnJQUEtJ?=
 =?utf-8?B?OStmbHRwL2UxWXowTVRPb29GdnEvTjRxV1hJL2JnejY5RzllZysvT21TT2xO?=
 =?utf-8?B?aHFiVUlkV2gxSGp6SWtKVVRtd0UxSklMWk5XVmFWL2R6Z0oyeW1aYnU2WXFI?=
 =?utf-8?B?VTE2K2JHQWhlb3NXQ1hValFpWEJGZEgzNkNlYU1uQ1EvbGp5MHFnVWw3YVFk?=
 =?utf-8?B?dHhITHg4T2xtMWJQUm9Pa0U3eG91RFZENHRPbUV2TjR0T05XMmdQbU1mcHVS?=
 =?utf-8?B?TjhtYUZ6YkdRMk5ZMGRlemFkSnBZQXlUU2wzRU1BOFRtVWVmalIrV0p6WDlk?=
 =?utf-8?B?LzZyMFNzd2ZYUWJlNkVEL2VHVHhwRWk5cFFsamloUjh2OCt0TnJOenJDbDR1?=
 =?utf-8?B?a0FlUkIxOEZ1NTExTFdMdExsZ3RoNUxweTArRVlrSUxnVFJ1Vy96ajAwRWtk?=
 =?utf-8?B?YnVyNG4zQXI4bGxPL3Bqb2FGL0hMYTVnZE5TNWRzd1h4My9zc0kvRkdVa0th?=
 =?utf-8?B?VjdnNjJGMyswclJNS1NDZXEwVXhGS3M5cWZHYWc4UUFTbWVucEZ6ZjJxamtM?=
 =?utf-8?B?SVQ5enBObzl5NktVbG1IOFBrclArRWZ1Zkk5SWVjV0djWUZFdlJYQnNPbUE4?=
 =?utf-8?Q?2MXFuggiwobqOi81PkbqMIf1L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041e9d63-3838-4e70-2dc0-08da90ca3ad7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 12:12:27.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5zt3rcqRBKcXxsRRpWPyYk9RmlWpAA1JugPHAFBYMvaVAyeDOagDucyDRLkC8orHsL6guWgc26XKPipoBytag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7404

On 07.09.2022 14:04, Leo Yan wrote:
> On Arm64 Linux kernel prints log for Xen version number:
> 
>   Xen XEN_VERSION.XEN_SUBVERSION support found
> 
> The header file "xen/compile.h" is missed so that XEN_VERSION and
> XEN_SUBVERSION are not defined, __stringify() wrongly converts them as
> strings and concatenate to string "XEN_VERSION.XEN_SUBVERSION".
> 
> This patch introduces a string macro XEN_VERSION_STRING, we can directly
> use it as version number string, as a result it drops to use of
> __stringify() to make the code more readable.
> 
> The change has been tested on Ampere AVA Arm64 platform.
> 
> Fixes: 5d797ee199b3 ("xen/arm: split domain_build.c")
> Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with perhaps a small adjustment (but it'll be the Arm maintainers to judge):

> @@ -91,7 +92,7 @@ static int __init acpi_make_hypervisor_node(const struct kernel_info *kinfo,
>                                              struct membank tbl_add[])
>  {
>      const char compat[] =
> -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
> +        "xen,xen-"XEN_VERSION_STRING"\0"

I think readability would benefit here from adding blanks around
XEN_VERSION_STRING here and ...

> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1367,7 +1367,7 @@ static int __init make_hypervisor_node(struct domain *d,
>                                         int addrcells, int sizecells)
>  {
>      const char compat[] =
> -        "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
> +        "xen,xen-"XEN_VERSION_STRING"\0"

... here (as an aside I wonder why these variables aren't static
__initconst), just like ...

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1341,8 +1341,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
>              efi_console_set_mode();
>      }
>  
> -    PrintStr(L"Xen " __stringify(XEN_VERSION) "." __stringify(XEN_SUBVERSION)
> -             XEN_EXTRAVERSION " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> +    PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
> +	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");

... it is here in particular for XEN_CHANGESET.

The other general remark I have: Please follow patch submission guidelines
and send To: the list with maintainers on Cc:.

Jan

