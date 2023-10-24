Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448057D47D6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621695.968419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBO3-0002p4-Vz; Tue, 24 Oct 2023 06:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621695.968419; Tue, 24 Oct 2023 06:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvBO3-0002mZ-Sm; Tue, 24 Oct 2023 06:59:35 +0000
Received: by outflank-mailman (input) for mailman id 621695;
 Tue, 24 Oct 2023 06:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvBO1-0002mR-LN
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:59:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e09398ce-723a-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 08:59:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Tue, 24 Oct
 2023 06:59:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 06:59:25 +0000
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
X-Inumbo-ID: e09398ce-723a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oz+8dc426cXdWwa5EPJ1x/CCElGKzjvjU1WnqpieutY9zQUQ0dD8WPR/sHaF+vQ7RtTjkeJ2rN8+Nv4YAkLWjf9+w/k2uK4PTgjwW+if1iD8kTovoohLTJKJrJn+pgLiqTT4rhhVp6VBgYpwp5qnLUlYtLR5P4N7bmXjg4vGjPDcCEa526FYL0JI5lORJ0+WsABr0JIZ+Q4s1PlMO1bLaCbxLwWuCO+PzquoRsNrgQGlhzIO9OnrzmqcT1B9zJCSWpLIHEeoa9fAuR8HBbQhs6UwTPDOKtDSiZqw+DN3fdlcq8uisINwmKd+dp5xf5ik+4DBufw0e5S6V28EVxInFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pk+4keCSxUbtJQdAhBY3qwtGSvXiFLvAA5eg13nKJcY=;
 b=NSGZqP2FiLSctJ+/p+M7Z1ykgb+TTSg0Mo9nnuccKeXdPuWht7GqUnCObuYiuWN3LI+5LmWXDVt1Gu+0NYMe9fnVmKgjXyVjPGhdrL4tBuSdy9sNOFMZKBFS6J7pGP4wy7Z1ZNxZBpRVOffwr2J+GtOzPz525d/MmyDDJfaGEp4hrHJmxSXOA5LbXWI9iS3Kb9Ajz9bLAG2gkz5dDQ9WLoiCLj4RYrazr9LQHr7b+4EeqfsZBvVZhmny7Qi9iIo+B6iThopadN6jDoVEZnywANh7FU4bcYbokhID8ndmCqLzbZxFSm/iSZcK1D1xpsVWC39L3cUvXmzevEwmKv0dyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pk+4keCSxUbtJQdAhBY3qwtGSvXiFLvAA5eg13nKJcY=;
 b=j64hwYFPaklFvpY5nDgS46s0qIeoykHWT5RWjRUS0mpl5JzW5Wh4CZjjVkkaiAd1lUiQV18Hsa5OA/JFL0wLXswuiXSNVFliyupK3crhszMNu//U4caFqVCmZOo9PPGQrZ6BkiFGc+m5BMwY7QCY4EvdtKb/OONrKkOdCQWcgavU3BZLBNegXigDuGp7dnHRowNa7QdYILqXIecDwFDhLwfYcNti1VwO4cw7x7VWBmhAE4GgMf9/O2SZWLPLvHcNeR1lWyQh/tcAv16wW5NUvUr0rmkjIirRxAKXDbOpxsRLCngwWgi2V3RpoRTStHT46M1Z2eG8YZFN6FSvaiNK7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com>
Date: Tue, 24 Oct 2023 08:59:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: d54c4f72-5fa1-4e65-274d-08dbd45ec25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PGIu8k5Qz2dBS0aMXks67bV+zKueXvpKoDDd5U1XDAxKEBm49J6XoK9wqzCyccLRdPoRhkjEeqOlF5aq6OVJN6fF4UpFAyzHIeOQJhn2gZ4PWnHTHZr94LV7wvJI7I3XpCx4ZiO0vzeJSl7LYfLSJpzJwxmSoRVy2doZ4EkBVZELgdhvJVEH6JFFd1lu/nHMBUTp8dXluwp3/gMBAO8C9C6zJX5qDMOTV8mAJnjjEmDqVeBLA+qJuaaR4ZTGgbvsKT2s2nELI1Uxbam39U2XZ/6Kvw1R30e3ApqP6cPMHerTFyl8DusfGD5BDG5qiZPIa4QTirA0BQ1daTLWZMsK942Qh52p2yvQGOoxrgXbNUkmCgLq+w3/NI2TsAnOO3CQeIICY3aU7Fn9BNHWK3on4Vld6+2JG3Z9D/79DWeDN8rCUpPFxXk7gQdTrnva3TYydThJ04T1zzRDVnvvuvMJBWYiH9sRxg+w3oW9GQ+MlTq8R71leulzhVgE30gY/+qEOOKyte82+9RqR08g8jrGj23LHlqZHBvH8nqIk0QWZuXmUId7r8mf+dx/xJaUQgzWjUEdI4RzXNiQ+tmOzrvH952x4/1QKL9vquAZWeXvlMJuGebLxl9JLV5YFrPPWwIyk+swdDKtuqUs3nMwdkW31Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(346002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(478600001)(26005)(6512007)(86362001)(6506007)(6916009)(316002)(38100700002)(66946007)(66556008)(66476007)(36756003)(2616005)(6486002)(2906002)(8936002)(8676002)(4326008)(31686004)(5660300002)(41300700001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGpMWUJQTU1oQjEzVDc1SHR5aUFOWTh2cmZ1MUZYaXNVOWNvZjFiMW4yTXZK?=
 =?utf-8?B?Y1hBNDZHUmVRc1dOTHg0OEExWEhnVXYxeDNlcDVNeDhyaGdVSXptSER1Tnhz?=
 =?utf-8?B?bTNFeFRnWEZaRWdmUklUcFN2dWFEQVpwek9QZjNKOVc0bTRzc0tLNUE0Q0R1?=
 =?utf-8?B?cjZzbDJDMDB0a3lHZXFtYjltUzhJNm9mbERqSDhkSVdDbDM2ZTY5aFJZQnp4?=
 =?utf-8?B?cXE2bzBCSlVnaEEwc25ndWg5dXhCbmJ6anJCRk8zNFBhVHl2Rkt5emVWcUxn?=
 =?utf-8?B?UlNNZnpGcGhKc0VHYTU1VGtPdmFuUnV2K2dqRDVVNitqRUFVSVRDcGdrMStN?=
 =?utf-8?B?ei80OENaR0RWNGFoS1Vmc2Q0UTRpZVBUZ2d3dk1rZnJnSzNUZ0tlaU9VYVlw?=
 =?utf-8?B?MU9Ua2ZZMHN2Vm9lM2VkeXNacjVvL3dwaW5kNUtyS2o5TU9RejlxZmRBWm9s?=
 =?utf-8?B?Wi90Lzg1QTl1am5iRlRlWGZCRmNRSFBxTVE2eHdRc29SOGZMUlhwVlRnSEp2?=
 =?utf-8?B?dG13Y1RibzRVRStyand2SFhHd2lta2VrZ3AzS3JEQnUwUHZvQ3BNaUpVRVJY?=
 =?utf-8?B?QWxwZnRPbGxweUNMb25BUno1VStqQ0phMjFzVHlpeVZYL3RMVTZuaGxSRGtp?=
 =?utf-8?B?YTdiejJWUU1ybmt5a01DNTNTbEtDMEFEV0tZSkxKbVVldks2VmRBTGJLZG1J?=
 =?utf-8?B?YUtTRGpVNUgzQUpRMG1seC9aQ3U5NFdGeVFuaHQvSDl5WTBSdGczVHB0TEdq?=
 =?utf-8?B?SGk4Vms2OEx0Y3liMnlVVk9wVWhVWTBBYllTbWZvMFdWc2VCekY0TURwQStD?=
 =?utf-8?B?OVBNMDFaME1EUTlRMnU2Y3o4Ujd4YUZUVnQxRW9tdEc0WlZPREQrTHB4b0hD?=
 =?utf-8?B?UTEyK0VXUFIrMG1FdzlqeHNXOU05UGZVTXllb1EwWUlaVEdlQUJjNGVkRWxr?=
 =?utf-8?B?WGs2YjBZcVZzSjdCZ2xVRWp1b1BSMm1KQjRoUEFqYStmQjNLVHJra0V6eVVn?=
 =?utf-8?B?VFoyVWJXL2xHTGZyTVVvR3BzNlBlRmwzQUVReWl2OE1LQXFCdTRvQ1ZQNTZ2?=
 =?utf-8?B?NkZwWXNodVhLVithOG01U29FOXU1aE44M09qNUR1bWVmOXo0OVJubE9wZkor?=
 =?utf-8?B?R3owRTZuYlI1cEtRTnZvd29WZnNCVGNXOUMzU0RGcTY3YXBOcWdRR1BrTDhr?=
 =?utf-8?B?UTZKZkhzK0E1NkpoUk1LWXc3enE0S2t4OTJPZ0p0a3JuaStyalFUVUU1OTdV?=
 =?utf-8?B?bkxXWkhybStMY3Q3RGxaTkwya2xpL0JiT2FRdklmWEQ4QXVaUTdVeXRkaWpo?=
 =?utf-8?B?RHl2aENrWnBnZktVQkxUNjU0ZVc3aURVM21xc2J2TGZaUW5uaWpRSjZRY2JG?=
 =?utf-8?B?Mi8rNUtGZHc5RDJPYXpXMnRRd2Z6ZTJUNGJLNWlXMEJTblpXS2FDRGJZM2hN?=
 =?utf-8?B?bi9LNGs4UkZEUUdZMFQramRVbk9zd0RIaEUrWitVSzRRU1NJNzQ3QnlzMFJJ?=
 =?utf-8?B?cGlNMDBsYnRXb3VCS2lzZytvQ1B5cWxTOUdOWWJic2lkLy80WTZRV0tBS21V?=
 =?utf-8?B?MW9HQ056MjduVnJoU09MaWx0NjlldTczOG9GUFpwTGRwNE41a3g0cDhaSkEy?=
 =?utf-8?B?L1crRFZvNDYyWW8zd3ZkcXo0b2hLMzd3bHQrZ3hMMHlmeC9Uc01ETENUYVFt?=
 =?utf-8?B?YTFBZFBCejR3cmRic1J0eGV2U05KOGpPcXJUU1B6bHkycTNKTnl6ZklCR0F5?=
 =?utf-8?B?VFdzV1pwNmx4OEpZSHU4V1YyMWVlWWVVdXo1akpPNFZPTHU3ekJMNjNkYmNy?=
 =?utf-8?B?Vk9hdUx1MjVYcURpclMxVXptVUd1VzA3ZHlKcGkxay90ejB4OFhsVS92dFc4?=
 =?utf-8?B?aysxQVBUMFBqZ1JCSlIxM0NHQTFZNUJCU3dTZ0QyRkd6eDIzV0JJMUhkbWsx?=
 =?utf-8?B?TG1IK2RPZ1o3M05tbGFITmpselI4Y1IvbDMycDNHWWxQRzhBc21tMGdOemU0?=
 =?utf-8?B?b1UyQkRVVnB4djcwTXZ6YmNibFQ0Uk1IcFNrTWc1alMrQ2NoSCtmSWpJUnpM?=
 =?utf-8?B?UEIrdEYyRDU3V1NBMGhsckZmVDNZY0dybGtZU0RKTTEzZmU4S0lsUHhNL1My?=
 =?utf-8?Q?1Kd1DqRc6lRsUu80X9ANj5fcS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54c4f72-5fa1-4e65-274d-08dbd45ec25a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:59:25.7473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaJuciFn2JbLNbZZ6ts5fsgTumT0lOpDDvtnEskL2TmxGIuzoNn+l+1adNgLTw8uOcRYE3imEGtn5iIrVAGOxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596

On 24.10.2023 01:31, Stefano Stabellini wrote:> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -422,6 +422,13 @@ maintainers if you want to suggest a change.
>  
>         while(0) and while(1) and alike are allowed.
>  
> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> +     - Required
> +     - The controlling expression of an if statement and the controlling
> +       expression of an iteration-statement shall have essentially
> +       Boolean type
> +     - Implicit conversions to boolean are allowed

What, if anything, remains of this rule with this exception?

> @@ -479,6 +486,24 @@ maintainers if you want to suggest a change.
>         they are related
>       -
>  
> +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
> +     - Required
> +     - #define and #undef shall not be used on a reserved identifier or
> +       reserved macro name
> +     - No identifiers should start with _BUILTIN to avoid clashes with

DYM "__builtin_"? Also gcc introduces far more than just __builtin_...()
into the name space.

> +       GCC reserved identifiers. In general, all identifiers starting with
> +       an underscore are reserved, and are best avoided.

This isn't precise enough. A leading underscore followed by a lower-case
letter or a number is okay to use for file-scope symbols. Imo we should
not aim at removing such uses, but rather encourage more use.

In this context, re-reading some of the C99 spec, I have to realize that
my commenting on underscore-prefixed macro parameters (but not underscore-
prefixed locals in macros) was based on ambiguous information in the spec.
I will try to remember to not comment on such anymore going forward.

> However, Xen
> +       makes extensive usage of leading underscores in header guards,
> +       bitwise manipulation functions, and a few other places. They are
> +       considered safe as checks have been done against the list of
> +       GCC's reserved identifiers. They don't need to be replaced.

This leaves quite vague what wants and what does not want replacing, nor
what might be okay to introduce subsequently despite violation this rule.

Jan

