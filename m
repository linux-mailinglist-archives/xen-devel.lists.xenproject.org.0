Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BF7257C2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544497.850319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ob4-0003Hz-Jj; Wed, 07 Jun 2023 08:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544497.850319; Wed, 07 Jun 2023 08:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ob4-0003G6-Gw; Wed, 07 Jun 2023 08:32:50 +0000
Received: by outflank-mailman (input) for mailman id 544497;
 Wed, 07 Jun 2023 08:32:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6ob3-0003G0-DN
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:32:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe13::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e222f25d-050d-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:32:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9746.eurprd04.prod.outlook.com (2603:10a6:10:4b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:32:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:32:46 +0000
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
X-Inumbo-ID: e222f25d-050d-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi0uvay6jNOeNFO95Qtqx0qGcxNH+oBqHv3VX7t9Vl9+fOK8fhzLIYyQxJfnSHTztBt2nKpgdPWbMhJcXsqQlYwgF2SUSm6R9RlQmuYsBcuCJDeNh/EDB+zLZwg49VBHb8+WnI3ldKnD6X6mTfDT1RiajyXbdC32W0Z5KqU1WrxR6I2gngFoSLbWq5Igpb+nJfw6MEgCwnPFuBQV2fZGg+mUDfQjek1kAaxJ044stl+hbyKnWRD3So5//Kuc8ICDVoUwX9YEzuusyjFWUgOQGEgiR3GfmnuAaTzdbbnY3dGRNCVW0kB2RducRhQxQwxMeOYz+UZ7C+K1bnAQVIn5Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWVl1QsY/cVcT3X9J19Z5ho+B2U7bWpJkaXyPw8HXxk=;
 b=e+zY1BCV0/ZMs3HOAJ89KJd8/ugHqfnNkMLcYf3a3+U/1InTpS7BTz4NfwQWAgKLsjptaLtMo6u00tlCyY75HOpDV8EqQKLyEFEksAbF8hg2UmW2gROeZ01kMtvdy2/FwdGHVU7WIppJaC1MvvnE30n6fAseq9HnqhSEq9AFFie6IPbiAW97lQ78F9e+JWSUufavjIYWh9BPzTzgxrxlW03VcQy6apMeGse0WB33LH/jsZRnxZXGQtqitMRXLCy03Ra6VCZ0cCTEB1In6jvM1JUTeDq3srnmKyHL0/NOCKDFSwi1fosBAnlUwgZu7J7Ucq0QqOtLEzpmidMR//xP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWVl1QsY/cVcT3X9J19Z5ho+B2U7bWpJkaXyPw8HXxk=;
 b=S8KQeIzgwpuyIRGeMZirbFKKI5Umitf+wI/aVCO7kELAkHQpMyvSyc/jTC019yORAj4vP+3THaVVMb2j4H5t7igCI73v6ng6cl77uLXJmtPE0JmHwYxQuHMasowfbl4pAQm/+Bm4GGk4Ef60p17BNp0vXfSe6tQUwR7helRyay7Aj51TC+CdoWdVlkXYugBACRVMaaPXdwe+ttyWwibMXTL5xklsj5h/hIsNPjHWhi2AtLqM1eBpc6hLiWH2xdavNCSpiwV9j3lc5jEagCvb+9U2vxld1hng2NBMNjzXifqpzZbYKZLCLR9Lsp2Q15gFg7cmegpKSAwsZinwec+OEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
Date: Wed, 7 Jun 2023 10:32:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] docs/misra: new rules addition
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230607013810.3385316-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230607013810.3385316-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e0740e-ef5f-4f98-418c-08db6731c51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uORp4cLhKZ/FjeQJCK25b3FnFEi8uOzxIfvv9tNfhvO0bMCLLXxDMgT1glTpRQxMeyUJ9dBXIxk5qrtYExs5GBm+e11WUjSehc4IBBPG9Gx/a2z1PyN9Fm3mvoVMkizJSF8FjbW8NWwgC+u36fCwM0IWNhNBc5cfW/7Q/D2Zc7OO7mdlzoS+Wc1+XLWg+WBBU96w7egWUnTKHMZ03sAAb8WYg5HM1/xc9yRL58dCmLHc4nHrf3uVUS/iM7O7i6XzF2jRPyRcRku+63t3Em0fAAFhRpCdfhr1zEZLuo0RLHO/qAVK+CrA9hYCIOKZkWkh9WBmdVmKYUB8l70WjifwXpEYGdnKNYhSUaam6HKdYinFweZCyS3r3lRmDA7/5650lDoF+zaiCANif2smybiDNmwD+zBX6bUljW8kUvVKRKJg6eEoO+dwBE9KH78YL64TFPi2oSMjqonT67fZZa0xta9479HuUKVIfbuDjzFkHhPjlVfcHqNjoCehxJNTmOYxHs0DNwZkr7POr22QUuZxrWaVSONdeATuctYxRoFuu7YTcMYkd3tK/Fbt4iCxCCxizcFNiRCskmSkFGhNTYdwJhpXFhFY3l+fGUGa/2pnd/jiBtxk1izWuj7ML4i6Mn3qnwTktpGSQqtgp/vNIzDiq0DKMpZldPGrqIdh30ULKaT8Pvvhl7zd4nqlxQBspsVS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199021)(6486002)(36756003)(2616005)(83380400001)(31696002)(86362001)(26005)(38100700002)(6506007)(6512007)(53546011)(186003)(8936002)(5660300002)(8676002)(41300700001)(316002)(2906002)(31686004)(478600001)(66946007)(66556008)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU5CUzhibXJQRXNWeWxjSTFwT1ExdnRQU0VCNHZuRFhRRFlWR3U4YWE5OVEx?=
 =?utf-8?B?MFF6Z21tZ1BYTXVuRW5iZ0Mzd2xDekxpeCt6a09kdGpMWER4MkZkWXd1LzR1?=
 =?utf-8?B?T0FFb05QTERDL0hncTFrWDN3blJMSXlQRTBEaHZaNWxlNTlSUTFsNG9RZGRy?=
 =?utf-8?B?KzR4TTB1ekRUOXBaRWFlYlpoTjlkMExBcnMydHRjc3hKYkROYldrbVhDUDVU?=
 =?utf-8?B?RURnYWhVVnBnbGZxRThLK3lTMFhJQ2RwTjYycTFJNlQyM0N3QVYrdVFaMWxL?=
 =?utf-8?B?MVg2dUU3cktoVG8vejRVL1dmVEFrN1B3d2hLb1BiVW53VmVQeGhpK0Y2dTlR?=
 =?utf-8?B?Qnc1MjB1Q2sxVmlCR09Tb3pxM1ZIQnkwOThzWEFJV2o5QU5IK1JBdlIxZGpR?=
 =?utf-8?B?WlZjSFVZdkF6Y2JpVEx4Qm5DK05tcDAvK2ZlUThwdGZyRlhTeDNWODY5ZGN0?=
 =?utf-8?B?QldIMXBqcStYOVBMd09wdzRSaTRxdytLYUt4Q0c0b0VVT3BGTUlMcWhRQ1ho?=
 =?utf-8?B?b290TnF1WUZPTDdHa2J6Qmw2OFI0N3BlditEL2RDUUdtb0s0dVBWa28rMFRO?=
 =?utf-8?B?V1FYZmJ6MW0xRitsMDZ2VFh3WGh2VUxJWFZVK0JYM2xPRE93aTJrRnVpL1Qx?=
 =?utf-8?B?aVZxc1dBWFVNRlozMDBralZWS2ZxeFVWQUMzOEJCYWFMc0RJTkZzNFNGOGxS?=
 =?utf-8?B?eFZDUjJpYjV6ejNyNDhjV29IZ1V3TllZUklwWFlZUitkd21JZi92bExDZTMy?=
 =?utf-8?B?aDRhbmhkK2JoQmtRK2pXbkVuUWxVdXo1RC84Y0MzbXcvQkhza01VRFd0RWRz?=
 =?utf-8?B?R1dSM2R0SlR2RGZ2bDgxaWxXay9BdWo1ZUtlVmRMQzJkb2ZVbFhuaEM4VElJ?=
 =?utf-8?B?LzNhRFZkZU9qbk1tRjhKa0k0cnRQLzhGc2V4QkUwVkpNYW1memVSRDRVSXFL?=
 =?utf-8?B?YXBXMGJBbm1DVEgrOWRWMGNEOUM1QmlsY244WWNOeUJtNzFwaStVUjdmang4?=
 =?utf-8?B?L2J2SDhNcmxjc1RCZlhDQzd4bTNxNVFZb2RpakVJTlhUK3BtYnYrOUxjM3lU?=
 =?utf-8?B?bzE4b3JYNytkdWNmdGZacnQyeVA3blYrRHBPVHVPSkNFeTNxL0Q5MXRPMTV3?=
 =?utf-8?B?TEVGNjErblU4SEJhODNPY0llVXk5VXJrTzdadUlGVDBqTlNYMC9PbmRkV3Vo?=
 =?utf-8?B?OXg0a1dFbkFHa0hPYXFRQXB3STdPWm13TEZrVzlPTmErN2c5V0VPK3Fqa2RX?=
 =?utf-8?B?NHkrak5lZnA3UG1xbVVMYUFLdjAxamdJd1FoaWFHR1NzdjVZSWthM1ZvT1RG?=
 =?utf-8?B?MEovbjM4VUhEQ3RGVTFBMllZOENJRE1xYXcrbnBnVlpsTGY0NDZBazdOZ2NX?=
 =?utf-8?B?dmVnYmlBMllPRHlIZ1Q2bXQ1djF2ZStncTMxMGovYUhaVEVYbVJPekR2ZHNP?=
 =?utf-8?B?NEhKclF0NkwyaXJ1WkxRcHF3emJaaVpmaWpwOXJyVUE0WkcvSWlyWk1hb3Rt?=
 =?utf-8?B?Zzk0dk8wa09EL2lkSEdFVHRFMlZBUEdWbWRnYjZBN0FKbkVySjZEcXJORXd4?=
 =?utf-8?B?bEIvVEVybFJKVDZja1NVekYyeVh2YnpXY1NQM1prOFA1SmJ0R1lFcCtMbm5w?=
 =?utf-8?B?ZnVycmxUR3VPblY1LzljM09Ddmw2ZzZ5VE1MMk5mcCtLSml6cDRzZTRnQzlQ?=
 =?utf-8?B?N2NvY3B3MkQ0NDlHdFczWEdkUitGQ2ExZFl2Q3ZKVWRWOTNsWmtUZEd6UEhD?=
 =?utf-8?B?V0JwWnZMVE9UUkVJdTFKaXFSZlA5VFBZdFZ4TXBsa0dRRjR4WkJjNk5pcDZU?=
 =?utf-8?B?QjNaSzZTa2NESFl3MytURitOKzBycXd6eFZlODZzTXFuY3lURXlDMkl4UkJS?=
 =?utf-8?B?elBFU2RSTHd2SENxaWV6V0l0YXYzcVA5VjlLVmtpenlxZ2wvdGZnZGJPcG1o?=
 =?utf-8?B?NE5uVTdqajcycFJIT2EzY0FhL0pURTVtZnQ1N3QrQzZZZ1o3d3U3ckxTWTdj?=
 =?utf-8?B?VU43YWFFNzF6WkJ5b2pxYXZKdG1iN2ZuTG9KSFFjYldTS1MrTmtNeUF4c09B?=
 =?utf-8?B?U05FQWFuQm5pME9sSG5MUE9tR2xZcWozeTZua2dLUWtMT3R2eUdIQnhGaSt3?=
 =?utf-8?Q?0HBbvF+vzo2unZt4ZfnJooCqW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e0740e-ef5f-4f98-418c-08db6731c51e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:32:46.3338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3IbVy8E32gF30BC62AfsOA4jgtGGrEe7kQI5iA+K1MZlgBAl+shz0JLB3Kzupq2uks3NDnY6BgtszdvpcYcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9746

On 07.06.2023 03:38, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> For Dir 1.1, a document describing all implementation-defined behaviour
> (i.e. gcc-specific behavior) will be added to docs/misra, also including
> implementation-specific (gcc-specific) appropriate types for bit-field
> relevant to Rule 6.1.
> 
> Rule 21.21 is lacking an example on gitlab but the rule is
> straightforward: we don't use stdlib at all in Xen.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> We also discussed Rules 2.1, 5.5 and 7.4 but they require more work
> before we can decide one way or the other.

Since I wasn't able to attend yesterday's meeting, please forgive a
couple of remarks:

> @@ -133,6 +146,16 @@ existing codebase are work-in-progress.
>         headers (xen/include/public/) are allowed to retain longer
>         identifiers for backward compatibility.
>  
> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
> +     - Required
> +     - A typedef name shall be a unique identifier
> +     -

Considering that the rule requires uniqueness across the entire code
base (and hence precludes e.g. two functions having identically named
local typedefs), I'm a little puzzled this was adopted. I for one
question that a use like the one mentioned is really at risk of being
confusing. Instead I think that the need to change at least one of
the names is at risk of making the code less readable then, even if
ever so slightly. (All of this said - I don't know if we have any
violations of this rule.)

> +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> +     - Required
> +     - Bit-fields shall only be declared with an appropriate type
> +     -

This requires you have settled on what "an appropriate type" is, i.e.
whether our uses of e.g. types wider than int is meant to become a
deviation, or will need eliminating. I suppose the outcome of this
could do with mentioning as a remark here.

> @@ -143,6 +166,12 @@ existing codebase are work-in-progress.
>       - Octal constants shall not be used
>       -
>  
> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> +     - Required
> +     - A "u" or "U" suffix shall be applied to all integer constants
> +       that are represented in an unsigned type
> +     -

"Represented in an unsigned type" means there is a dependency on the
target architecture and compiler capabilities: Representation can only
be determined once knowing the underlying binary ABI, and uses in #if
and alike require knowing the widest integer type's size that the
compiler supports. As a consequence this looks like it may require, in
certain cases, to add u/U conditionally. Any such conditionals pose a
risk of cluttering the code.

> @@ -314,6 +343,11 @@ existing codebase are work-in-progress.
>         used following a subsequent call to the same function
>       -
>  
> +   * - Rule 21.21
> +     - Required
> +     - The Standard Library function system of <stdlib.h> shall not be used
> +     -

I wish inapplicable (to us) rules would also be marked as such.

Jan

