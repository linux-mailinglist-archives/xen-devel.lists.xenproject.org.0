Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C866FAF96
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531477.827187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzZD-0007eA-1n; Mon, 08 May 2023 12:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531477.827187; Mon, 08 May 2023 12:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvzZC-0007bi-V6; Mon, 08 May 2023 12:02:10 +0000
Received: by outflank-mailman (input) for mailman id 531477;
 Mon, 08 May 2023 12:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvzZC-0007bc-0j
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:02:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28888e36-ed98-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:02:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:01:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:01:39 +0000
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
X-Inumbo-ID: 28888e36-ed98-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MToV/TB1E+2uBMoQPaO2FQBZJb76tbKhqNA3SdYF0HJtpLYPL4U9OyMilRtRBx39kMI/1F36YPrDuPmQpbZCOU9ql5ClF1CTnLbDhGvbIKZ3Cci2Nynv4Sofy/B85sZrRv6mxTHEDf+5EQ6LR6hlHn3jHSRMa54vdVY8QxKCKQlG8BR37udykFO+Gaw1SnVA4CGAqD11KaCVITa1xZVJQuSrrkcT0n9FVoJSg79DZAmlKSASvh/JvIdynmnxJRxO6PNQln8WjGcb33IIuGJs+kjVFxvxFEKe7Cb/4+ZJyoBwcCfAG2YlO2hDZM/MNUPd0nUhZvWr7v3z5047hBwQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7kDkVV1bON4Xwcn4ICUJBwyjXPzXnP6fiusd2Z9+aw=;
 b=nJ/361o3DZ4/3/6cvgrK5KxP5u8FdeInQcwIor1wsN9gbajlogh3XPN+UnUN6zQciqV5O+rt98EgY016UaKQ1lC5PeGPrqLm4YHSxf0dyYVnZZqZFi3RToId/hZAZKQozRKku/7ASV09IgCR+ra40M2yy5CUwcSpJBUfN6NPXYMiz6a2DxLE+p9O7jwtgUunWFkakhFcwAolqPaGQVL/ThuSwy3jCBnVjPVi+5jNYdVXYYpMMR6fCl/qQKIQEpNxqXBqMFR0QS/CpNAhUT45Sk5S8wM01q5cQ0LglfC5Ppfn6PMrrj0XcnB27/sBP+yqfqYnSmqWErT9WEzuPL8nQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7kDkVV1bON4Xwcn4ICUJBwyjXPzXnP6fiusd2Z9+aw=;
 b=G8T/qXcRbm97ZNl7SMBaEFCqPU+DALmwg/p3GT4/xdnaJQTgTf77NP58q2Ktg5HoaDSBH6POsLZXJW+wEQ1d9GInU0Abv4ziRUNn4SYQZRZQS547YuGrUm7iCYdc7gIwBUyz2t/zW0etha9qw/2nVvj9EXakqrukgP79JoLUv9j/7TJ93ahI1GXXZvpsWaYkbTkcKhZSYJE6GtM78TfwXhPenG5B66EqANGUlSjONxqoE3tMzkorqG9KVTWEk6ZIuVf/sAZ4LXPC2f1fP6BpsU5F8Z97T11Yqx2MpRTy03c3Slm9XOx1AMGohuYVc6ztAzBOqu6s8ioEVlN6orevCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <938a8260-d05a-feef-82f2-ed680db1cf90@suse.com>
Date: Mon, 8 May 2023 14:01:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 12/14 RESEND] xenpm: Factor out a non-fatal cpuid_parse
 variant
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-13-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a870ef-4c92-4b1a-229c-08db4fbbfac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lYFtfDl4Syoq01yxV7s6UaBPdcKuVmjYHav6/Ax7k/P1e2JEfc8gw1SUa4hV9IDMvg26Yne8hMDv1U1qkkBsLuHSkFIERaKIKHrV3cEANRQfcDpgt1hJ/iMnZyZoKN+K0pg2WVIgNXn3pdDpiY8zs5hsRRZ6N8d2KwHLSkFBIa4dSA2wHufs99Qgo1VZm1KDq+oz25+t3IDHvW6+iVUfjDWoug/6K077QPNZchjnv+MVE1NYYJk+1Q73NOzHTEgLi8ZpOT6KxcggKle09uFdZ0L4XsVFDVnhFmjhgMdgtBrzyp1XnCNQtTFjRX/qfe1KfeAgFKZkjuW/KIxb17ZXTiLtySkxLyTgB50UohrR3rsu9O/3WKMAWqDtEhj88/EoY7Q5TeHh0Sft4QGpWsHvhxILlVlQYYENtHNsOtYEhBXrL/HP8B9H6ztVGPM/AnslFIUgSvqblEvkzYHslRygZ8f1iVMWwQbfIBkrnmdO0T9vaaXE/aPimPcoRHSFAjAXq8FVUJv8IhQ0rO4C5bv11IvZgyE+utGCEBFXh05u9W5SSnD/dfodoNE1R1B2lbVv25myKHonjLajRQni1GgYuI+VL1KUy7kdQ11sU/y08jgLPElYoN9e2P+sGXzpU1/y9rl43swJridpR8lvVSPAJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(2616005)(186003)(36756003)(38100700002)(31696002)(86362001)(2906002)(6486002)(8936002)(8676002)(316002)(41300700001)(5660300002)(54906003)(31686004)(66946007)(6916009)(66556008)(4326008)(66476007)(478600001)(53546011)(26005)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWlzbWtUWHdyeTFZZjF0bjd5V3BiU1NYMms4MUZBWm9sYjVaaEhDR2RVZExG?=
 =?utf-8?B?dUlHekRtMmloWDRFRlBpU01pcWRWenMvV2R0NmxyNFZHTzc2bGdPSkl2ZVRO?=
 =?utf-8?B?VWhTQ1JPYzJRbkRqak4xblExSEdkUzhBeXB4ZHU0SnhSc0V3ald0SEFZd1Nr?=
 =?utf-8?B?d25HMUo4ajVtckV2UWkyWitocWdjL04wNXFtL2JnYmhhNE51M2FrRENlWEVW?=
 =?utf-8?B?SFhIbUF1ZjJEM2MyaERwVGcraUpkQlNBNmVQeXp4ekZnVlRvMTFQU0lkQlZ6?=
 =?utf-8?B?cEcxWVJFMGc0SS9LeDRWZitXZThkL2pOUmlFVWN5ZzJRcHk2cmNpa3VYRUFN?=
 =?utf-8?B?RnpIVzd1aEpGTjVZdjlwekxaZGIwcUFLM3drSGhHeXBmWlk5TFRLSmpPZGVX?=
 =?utf-8?B?bEJxeG84SC9mUXduVzBuQWxFS00wREFyU2plZzNNakk5RW9ucUdRQS9WNFFW?=
 =?utf-8?B?MDFnaG5YMTE2djl5bE80QS9KcldmUUI0VWhmeWdTUzBHZ3JuYnpJcHFtbjFK?=
 =?utf-8?B?RHpzd3FreldXRTJOUXAwT3p3Q3VZc3JBbWtNdHRWRlZFYldTam80cWFmdWhV?=
 =?utf-8?B?cDUzazV5MllQY24rK0JzNS8ycE9jZW9vQktyaktQTlk5QlRDQ3NpSFlQSUhU?=
 =?utf-8?B?elRiL2JDd3dUeTM3Qm1JbTJhelVmWU1WV1JEZjg0dzBSMGgyZnNxRlJvd25w?=
 =?utf-8?B?elppc3grK2U0TzJVVUZDMDVOOVhJRUMwRkxTaG8yTjgwNDFCNk5KMVlwaGVo?=
 =?utf-8?B?SEFvaFo3cXZvMjdWTVVHVWhoV1UxWXZwU2tUNnh2ZEdvY0svOE93OTF3NGM3?=
 =?utf-8?B?L1dEL2pjVjNidVlxSWk0M1JTUFVPRVFnV3ozOGJRL0lKcHZxYjZRQnV4ZUpG?=
 =?utf-8?B?OCthTkYzaHYyVVlmbW5wUml6WHBMcDdEOU5TT21jR1htdjBNM1IwR0F5N3FS?=
 =?utf-8?B?bm9hMkd2RmNNN3haZnUvU2NxWm9GTjF4cUgwSFJwbnZtZDVWWkdqdEpDMHRO?=
 =?utf-8?B?dERlbk10a1FWK3hpSGNoeGhlaVdUVm1VekpRQkQ3ak5LWnNPL3JORzdnM2tL?=
 =?utf-8?B?MkV3NDFBT0NVbTdyVGE1U0NMakZ2MzR5MTBvM2VOMzhkbUd5amsxUEVDakcy?=
 =?utf-8?B?ZVJYcTArQ3JCejVJQ1VZckVZWEpsazZhcEFwVGxXRVlkUDhDMTRaaVdaWSsz?=
 =?utf-8?B?VnFHYnF0REtNK09IWUY4bFFVVzV0ejZyUGpJZmpHcHp0NDFYYS9rYlNhcThP?=
 =?utf-8?B?M2hOT3JWODBGMDhPMm94dGJxOHpjUTBSL1VPZUE2ek1TRlM2ZkpJTmcyOFRn?=
 =?utf-8?B?Q1RNWVQ5T1JSQjI5VlBkN0ZQV2RSZ0pQTTh3aUxaeHBDTWRXN3lIbll4QmNj?=
 =?utf-8?B?eTZTSHNPRlBWUWUxbnpvTm1RRUZzNUdmajlHM1EzYWVTUURkOWtic2VDejRq?=
 =?utf-8?B?WkpqWmsrYlo2N1B5V0FoUVJoMmVZeWlDY0liVnZYWElla2ttd2x3dis0dWtI?=
 =?utf-8?B?UDBURFZJTVIvWHdGSFhBOUdEd3JXaitqOG8xb1FsWjFsb3ZxaEdmU2pRQ0Zu?=
 =?utf-8?B?SjNidHRUYXRaR2tHNUJhRjFBODFKdFdoRGVBeXdCZzFUdE5BSjNnR3hxS3lP?=
 =?utf-8?B?SCtTajgxcXVLNW41Uy9FdWs4dXJ4bWEvOUhaUHUyb2U5Q3ZKWERPdDZBeDN0?=
 =?utf-8?B?aVRoZXJXS1F1TGMxT20zakFPM3BRc0NrejQyUHh2Qy9WSUdFcVRCWFpJMkVV?=
 =?utf-8?B?WEtmaHBFdEtRNHFmVmtFVVFxWnh4ZW5RZmI3UUU1RllrcEFHY1d1b2NyWUY2?=
 =?utf-8?B?Wm5WdExoamtwbmxad2xib0JhQm1sYnFzK3laOHVmR21kV0lJRm8wTWdaajhD?=
 =?utf-8?B?Q3VkNHF0WUhucGUzdVBkcDYzZ0pKZXU5TVlnMEo0em4xR0xYRjk4aytLOXY2?=
 =?utf-8?B?b3J4MDVBSkIweWhTTzVQSXBaY3NrbHg0N2FmVyt6OFd2YlN5aVNsM01LMEpa?=
 =?utf-8?B?b3ZuUjhRb3JuL0p3QW5jV2FwVWpmV09wQ25lQ2lMZnp4QmlQbVNYaGF0RFJF?=
 =?utf-8?B?VTZNTjArUk5qQWhMTHN1ZEVrTW9mUllLbVdsUCt0cTdrUlR3NWdURTgxajlK?=
 =?utf-8?Q?9hexHQF96wxYscogASMy9P8pv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a870ef-4c92-4b1a-229c-08db4fbbfac9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:01:38.9917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySqZQZFhC1qKTEWTt7T9+XIXvMOk9lm50FpkJDnldCQInZExpqSaj29qa2gxAKnom1B4T774pJOVc9OSCuEDKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352

On 01.05.2023 21:30, Jason Andryuk wrote:
> Allow cpuid_parse to be re-used without terminating xenpm.  HWP will
> re-use it to optionally parse a cpuid.  Unlike other uses of
> cpuid_parse, parse_hwp_opts will take a variable number of arguments and
> cannot just check argc.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2:
> Retained because cpuid_parse handles numeric cpu numbers and "all".

Assuming you can convince me of retaining this patch:

> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -79,17 +79,26 @@ void help_func(int argc, char *argv[])
>      show_help();
>  }
>  
> -static void parse_cpuid(const char *arg, int *cpuid)
> +static int parse_cpuid_non_fatal(const char *arg, int *cpuid)
>  {
>      if ( sscanf(arg, "%d", cpuid) != 1 || *cpuid < 0 )
>      {
>          if ( strcasecmp(arg, "all") )
> -        {
> -            fprintf(stderr, "Invalid CPU identifier: '%s'\n", arg);
> -            exit(EINVAL);
> -        }
> +            return -1;
> +
>          *cpuid = -1;
>      }
> +
> +    return 0;
> +}

Looks like this function wants to return bool?

Jan

