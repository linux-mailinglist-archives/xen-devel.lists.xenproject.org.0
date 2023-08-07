Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6C7724F5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578388.905864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzvp-0001SB-2y; Mon, 07 Aug 2023 13:05:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578388.905864; Mon, 07 Aug 2023 13:05:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzvp-0001Pl-00; Mon, 07 Aug 2023 13:05:57 +0000
Received: by outflank-mailman (input) for mailman id 578388;
 Mon, 07 Aug 2023 13:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSzvn-0001Pf-Gj
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:05:55 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23798a7a-3523-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:05:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:05:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:05:51 +0000
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
X-Inumbo-ID: 23798a7a-3523-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfHc6HxbYrVL+TcGDMnR1+BpJQ12D7q8wfDMRwNjFSxck841DTPtzkMxkLR0ziVwfiFS08N+Kt98kQ4FXQYDbTx3K5TiqKxp5y1N4rTkQxPDoD4csB3KgpWIGAkw2R60+FgCxwo0EbeXkvkGxNqNIi4U4Iy8I8m6sxZbycg2n8bB+aCzRnhypzIGu7VZsHDUyS85ZGizqcT6TasXE380xcNSMH8tEa4t69kMLBrf78klUesa6u0L/ctC7+aod5jtfJ3F+eqUBSMgxbNEiLtr1YytNQW+fBbmxjUJKjla6cMLxzTPsp9O4uPIZ9I9DXLCyM/RdeVgHMBy5yzm6csxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8uigQ/CapaG709BkamdJgc4DzMxFOjlVJzxKZz1Wtw=;
 b=kMh3MvoT4qEpqVeOQaymcfjpxRKQ0PzU3ziEnomoeKgVkEM/UuqWKyZU5xn34FV1J/P+PnReRPmrOppvxWqUEWRhkH+jYzbRXLxALiz2cwB1t3Tz/RcGl5e23IetFT/OHU5CGapo0ccZ2NcrfcaIPZ9dPO73zAvIBJHW1rKvxNmRGoCFFanWZ+p7VyqmUfnn0JehHcsbnSaQiU5BmLIn09brvYwL6nyAtVuNlpcSmqMqEa2zdWMV/qFRIfrsd3ssNMYuxNQTk1iy8AYbsWnvXsDNdWmzdF82b8bFUHwIi+ZFPJ+pJOdefKj/hV2odni38KzBbL8sYUXTa0v6qM2ZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8uigQ/CapaG709BkamdJgc4DzMxFOjlVJzxKZz1Wtw=;
 b=doJFq2fzFy3V/L9O1Di0ZwZPCmrfO/1AjRkcLTq8r1ur6DMNlRilpFuVWM6vn/D1J3PhTA1pKnt00H+S9CI/rUKgs8pW9EZxVaM7/kIHklMDA1IFGP0MB0vXcatsyQZJr9M5omUCf1gf+vJyvdnEyns1F3RIObDG33OZYhq7TuMx7S6s0sTuwjnS35ee5+LuxxaxY7RGdt2+32g29mXLUScAxvXhW4xafMB4OWLNS/AIPz1Sbj/OphXk3aaKf6VXCFw/puDZZhI0qIreTX/XHPbb+ApWFe8QfMqRrO6fuOJw+VQ9b0HbVMOVLfr68cnVBtVv5SQugYwA2xoryEQ74Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55099faa-206a-b7ae-8ef1-64d1dc344c4c@suse.com>
Date: Mon, 7 Aug 2023 15:05:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 4/4] x86/setup: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <484a88bb35cdb6e5ec036d40fb2b4e20678fd975.1691135862.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a71e21-8bc1-494a-3404-08db97470669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08UhjZPN014K9BDLGo5Mz/h2ZKSGL6ymwVF4lEb8Bm9YwrL1hmzUUceUcaodxyI7cRutSqJNzCVVGwX4Zt+9l8NhfnlNoS6Sj2l4wQn3l7wBpTaBw1hU5OU+WKxikcN86o6BLXI7oTD+8MX4rYroqc27zbaTV2lmKZDo90cwsz8ynehK5z7y2dnws0vLnkf1+D+GKSV+6zsjFLXcgaOiLoOC6hqZvPo6i+c+q+vATj+HSajal2S3/aQIDT4RkOXMaJiIHO8XZHx6XDq/bsDWRdATGKFV0jvtX+ZshFRUgZ7LAF/uErtZYSu8ixGDoI6R9UZ6ReeqUpooaWEDd2vY4bzxeleeIYm/CgWKyueYzSfiH9cNar2tjZu6OQ9ZTYjpHVXtlyV7g4bEW7JUe3+7ZpX5EFYfpo1cwu8nBNQKmY3aZ05z6WTEtOgp6Ecc5qAYp2zpROKmWJuV5DG/YxObpIQMp7THLdc7PTHwXR/sHRq+0DcDoZyqnuvFYicCcmwMStIBwmZuYHKUbs4OiXrqaIZjZ/6ri7IvGbOJ0wFgoK8Xtd+XD0sqL7Y4uQaMz2YsQE2Ci1KrJms/TvMdzR404Ew5spcZsx58DO6LGWkbqGS1McYCSP61DHXJbPpu4DzmjVTq0L/nGrahIJJh11+U3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(1800799003)(186006)(83380400001)(2906002)(36756003)(5660300002)(2616005)(54906003)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(4326008)(316002)(31686004)(41300700001)(86362001)(31696002)(8936002)(8676002)(26005)(7416002)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVE2ZXFmVUJydk1hc2NqU0tVeEFaUTBJbWZPMlhXWWphdnpaNXlJNU9HanRa?=
 =?utf-8?B?N2d5L25wQ0lObzQ4QmJQeGhtd01QRkdNU1pUUFFKc3gzVFVmLzE3ZGpNVzdk?=
 =?utf-8?B?enhXclkvUTg4SEZqUFFQOEs2elA2VWZmODRoZjVTS0xLZWNWVlo3Slp2NjdD?=
 =?utf-8?B?U1BkR1pVY2NtYmtVSUkvdEtSSGFuMEFTSmQ5VGtuRkE0M0hIWk01WVdmVWhk?=
 =?utf-8?B?WURJRldMUDB4TzZkcC8vNkxJZFBCNUl6MXc5Rjd5TUNBa3EvV25IUVkxa29Y?=
 =?utf-8?B?VENBZDJWL1NEbHYvWkNyVEx6YzZ0cjhOOHBiaVl0dHdpZWpKbHpTdTZvNDNO?=
 =?utf-8?B?eXJWNkRmZUM0V3lDaU1wc0FVN3VIdTZqeXBpUXh5WFk0YU5MMkt1M0I0YjMv?=
 =?utf-8?B?a3RHb1VLQUV4KzRGSjcwVHdTSmx6cGkwL1A5cENwanpDMUh3QkhxYWxCRG4r?=
 =?utf-8?B?TTVkMWFPV3FtS2VEZkQzUU5BVkIrVlV6UHlmeXRvMjg0NElsdElkTVd5ZlpV?=
 =?utf-8?B?bU1GRXFNbXpaWjNsY2ZnVUhVZGtqU28yaFRPYnVCMDk5ZnE3cGJ0dFVjbkxT?=
 =?utf-8?B?WnRQcGJXQmxPMmVrSlgwaC9lQm0rNXlDYWdwdEt6d25ERE9scndUZlFRRmhP?=
 =?utf-8?B?RlpJZWdXVXBoYVFGcU9Sa3YxZjNSSG1uUG1YUm13MW5XUVZXK3k5TkRSdVZo?=
 =?utf-8?B?OStPWnBSMnJ0TXo1N3BFZTVLRXNxK25DMUFNWlMwWGRNR01XMHlNNnBXZUlj?=
 =?utf-8?B?QlBlMFNkNThNSFVVSGVrVEVqSmlhZEVCZDN0K2NBSERFNWEwRFBRYmJrWVVs?=
 =?utf-8?B?MkZIT1Q5bUFPd2p1QjhyT2trdGdBM05INmtORk1EajFkZ2N1NGF2TVBFampN?=
 =?utf-8?B?SnltejJiYjlBcjhleFlBT1ZYTEU2TVExZG56ZFE1S2Q1TkZaV0VPVE01RGZM?=
 =?utf-8?B?UW1WeFRoM2xnNWszaE5HNXZuSjZRcXJVTGRBNXlESElwWHBLVURGa1FrSHJv?=
 =?utf-8?B?UFh2dTVEQys5aENaZ29RY01wTnRoYmovbTIrRllvcEYzOGZyNmZzMWxCZG5V?=
 =?utf-8?B?Ry93UXpyUG1LNXJGSUlXMnM3b0I3WkdsaG9jMHVIZWk3RU5LQWpiZXhFRzV1?=
 =?utf-8?B?R0lOUlZCM0ZGcHZQb0hjbmpwbjNaUGpOUkRzWGc2TWUwVmR5S0xCbkhUclp3?=
 =?utf-8?B?RDAyb0ZJNFVnTzlORWJJeHZ5akY5VkJxV0pXdGlmUDl3cEF0OHhTSW4vVU5W?=
 =?utf-8?B?ODNBQlhqNEFrR0VJS3ZaUkVhMWpGeTg2a1p3UVpwMlRBM2F0bDFIVEVJTkZn?=
 =?utf-8?B?Wkt6dFZmUGE1djBnaEhSNFpudTArYVRBUjVwejhkemRLS0NCaERwZHNPNlVJ?=
 =?utf-8?B?UTNSVVA0amVTOWRlNko4MWZNYXR1Smp2Nk14K0tOSDc4ODRBVHhYb0ZPRmJJ?=
 =?utf-8?B?Rmh4WjY3dHBFRkEvS1RURDdrUktjZnNybUtiMWVpcFdZQkdlNUtiZnlLVllV?=
 =?utf-8?B?VGVENzlQT0RVTjd5QVREOWxYUDlJQjU2NlRNVm9xSGJnVEtoeHdCWURkRmdv?=
 =?utf-8?B?OGQ1L3dJSkovb0wxZWdoVG9yYmhLU0M5UTJwK25XdDRNZ3FDQlJNaFZZRnBQ?=
 =?utf-8?B?T0lxdGdmQkRSbElPYVBWRmtaME9DQ1VNbVhMUER2NS90aGMzMFNGeDdOTEU5?=
 =?utf-8?B?c0pEVUVUL3EzTUhvV3FuS3dTZ3pSM3lJMkdTYnVmanBxRWpMV2hwRWtQK2F4?=
 =?utf-8?B?cWtYQlhwMnhKUWpXOWphTFJpQ0RUMzRKRDlUZXcrYnI2SkRiWElodUlLM2tQ?=
 =?utf-8?B?anpoU0tHdzZ2UEdXOTRmL05qTUVlWmM4RzM5SVdmS0dnUVg1cVJxbkxZUHZG?=
 =?utf-8?B?M29FTGxHbDIveG9kb0VKZWd0NlhONmFYYnRqWFZQUUZEUGVBQzY5b2d3aGl3?=
 =?utf-8?B?Ukc0RmJMY0wzV3lxRDEzZlBTNmlKTUdtL0gyRTFJRGlwYm9pNkFyaktCUXh1?=
 =?utf-8?B?Q2FkR1JuZWZmSm1uQWsrTE1nSUZrTHBWTEVWR0FlRUEzRmhkZXFROXcvQ1cv?=
 =?utf-8?B?YUczUkQ0SFo1SFNsUXhyMkVOcnRTYlN0a1A1a1c2M3ZTNWpyeWN5eE1BemhU?=
 =?utf-8?Q?dhJFWfb/igU9E0ytKCqREOmZN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a71e21-8bc1-494a-3404-08db97470669
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:05:51.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbR9t0qfr/BNld6oqREFSC1klTzVudKa4IDZndzjIJoiji2nIj4WlyIqPIc+H3BjpP/fT+lmTidaZHjHH/5gyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

On 04.08.2023 10:03, Nicola Vetrini wrote:
> The parameters renamed in the function declaration caused shadowing
> with the homonymous variable in 'xen/common/efi/boot.c'. Renaming
> them also addresses Rule 8.3:
> "All declarations of an object or function shall use the same names
> and type qualifiers".

Can you explain to me how shadowing can happen in a declaration? I
would focus on 8.3 here, and only mention the other name collision.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1577,8 +1577,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          s = map_s;
>          if ( s < map_e )
>          {
> -            uint64_t mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
> -
> +            mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
>              map_s = (s + mask) & ~mask;
>              map_e &= ~mask;
>              init_boot_pages(map_s, map_e);

Re-using the outer scope variable is a little risky, don't you agree?
It just so happens that below here there's no further use requiring
the earlier value (PAGE_SIZE - 1). This isn't to say I'm opposed, but
it certainly needs evaluating with this in mind (mentioning of which
in the description would have demonstrated that you did consider this
aspect).

Jan

