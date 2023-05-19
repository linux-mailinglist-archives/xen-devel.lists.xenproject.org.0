Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6817098F1
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 16:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537104.835903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00j5-0005Q7-E1; Fri, 19 May 2023 14:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537104.835903; Fri, 19 May 2023 14:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q00j5-0005NL-B8; Fri, 19 May 2023 14:04:59 +0000
Received: by outflank-mailman (input) for mailman id 537104;
 Fri, 19 May 2023 14:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TMQ+=BI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q00j3-0005NF-SJ
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 14:04:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 223ee2e7-f64e-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 16:04:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 14:04:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 14:04:54 +0000
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
X-Inumbo-ID: 223ee2e7-f64e-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaEU7duZZ9+UvXnZ52YZBavccb0KJ5WmKBkimg6aVdvt2y+p2rHKOiPqaK4dVcgK6DKObgQQhQNjGdQHnCuKKjuYfe+b2/c8Y2qdTXr7p9KfGGDYL2tDNe0HIsHfhWtz7rlBe7EO/7l+B9MNIkfWxC8CqvPK3Fg4skuouIlOx1BoEiMxICu1v2QJ8TZpv9OgJCqt7j2m+20/tVWEL0nB2OWazfdge+xT6xh96awjRi/uc12exTXPsd/zCQwGTYBLMnKDyQ8uh0lNKgbt9Xeu0goy98IEhvPSzvo5A6TCeT8KrUu6o8OTChrs/TyMWvQnxR2iWbk88qdG8KnPmLLj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkoE74H0DL22Rh4UD4F39wlDsfv/7WlSaI1htlhZv5A=;
 b=K/m3o13dwqsMg/A3+A8hN7crmYyHVWBjD4b3qCmsJbZJP/KkEJ0/QvTs5gKm21EaR4WJIo44MyHsHLLU3W2AzvTONcYnIbHA5p6w925huNbGe3Oo2IjbeB+FGaR0bjl4lGNGrubd829mDUa7/rR190TyibbPx3AnLajvWgLZrDQ87dkOup1Gto5i8cHMFCSz68eh9VbYuonZtAfubTv14gy530ddKvtoVXZM5MxQacyjICdrV7AC3n6HLSSxx9o+/lyaFEPu90zg99BAYnJO6kaAxiVRQfl6fa1PoCIWD9Oe6IHpuHF49UuJt0hkGhIPKFIsgo+v24m0nS1yUfobGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkoE74H0DL22Rh4UD4F39wlDsfv/7WlSaI1htlhZv5A=;
 b=IIrtW7Svjn0hh8vCg9KBTdGcoiaXqjc5g7s7KV2ZrLgWsQlQ6R3M+O6fDvIeB99GZ80El/reHxHRhdZcn4ImQnjRdMox7zbtJdTIi6bwYXFMrYrr0WEhQUswX3m/+Pf2MR3K46+6DcShJvjlZ59IWuSvek35CB4Mj9eV4nobJ4/gaMLHLzhoFQdfuNLL8QjhwCh0kYSM78mxOUhdHSZOrvq3HkkZkF9vi5/znrCQ1PYaJ/ZY/kE4Qz8ssRn+56NpZBNK7+UCDLv9C5lgSljGRsG2G2mwkky8HrKQJzNta6VSTIG1aUGvw4zq6oWSrvKtOyLSA6G7vNhYaX4AJjn6Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b837835-f0bc-b59b-751c-2831f106b7f2@suse.com>
Date: Fri, 19 May 2023 16:04:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86: do away with HAVE_AS_NEGATIVE_TRUE
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f994f67d-e0de-ad28-d418-1eb5a70bc1b8@suse.com>
 <b79b5b32-7bcb-b4cd-1594-e16aaff640e1@citrix.com>
 <2c867a48-1442-e4bc-0d51-d87c77aba8a9@suse.com>
In-Reply-To: <2c867a48-1442-e4bc-0d51-d87c77aba8a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 097ff62d-ff9a-4644-a133-08db58720537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DhkYzc8/D/ATRkGSYQkG5/r5cjgcC8nPxlDoFIWmK7tYpf5e/vLJUmXo7gj2cxGWKIyaEJHwHHDY78GCRuet8yd9xgfkhxgdZjNtaXheSx74ysCRcSMIZhlYWYj5qScepPUPNZvxXdzzRE8ZXxDJ6bIi0ZQrhlII46EqVKPV5xEwr2J5SAFpjWeJyS4aDZhcF+BP40eMmeXgYw30p92JBiR0lTxpFdI8rgBuav+wTObb55FglxFHAt5r0sF3z+m7CjyJGRiDNqE4/GWW+fU601OKQwuVz4NLdGcJDH4ZP5Q1TMbBcgEzZKGOY3fT5sXsRkJ9UMA9XSvRNUAqJOj9CFGCayA/V+hwG1EZWyqT44aUpAbIrQ9/3UPMsnxXcMzqmg6cO7mDK72WC3Xnb4V4f+maEiRqaciy7E/shVMr3pFYi+XYxPivgbwbtcGmXbql+iPmRp5NoNz5FmXMXe5PdvqXQe5Jf118DYP81cMBkoLnR/wrQl7mstNq7KUD9/hzzAxImlqafLaYogExVTvUOm8K0hmNQR6mJw4SH+iri/1ILNTfUTWh7Awhe3oNJPz6vxdy8bMkH3uKgilifu+W1pAfVqlr9AlECpGeo+BMxXyVApiep0oWQfcpfPlArSe3XvJXrOWuwtk8WDksXlGNSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(136003)(346002)(376002)(366004)(396003)(451199021)(478600001)(6486002)(54906003)(2616005)(6512007)(6506007)(26005)(53546011)(186003)(2906002)(5660300002)(8676002)(8936002)(36756003)(6916009)(4326008)(38100700002)(66476007)(66556008)(316002)(31696002)(66946007)(86362001)(41300700001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkpNWWFkellvSWVPZFlnMHJuVU9QU2JESnNHYXFJS3h2TnAwMzJlR1lNM2V1?=
 =?utf-8?B?ZUFMRWM0TXlNOEcwQ0pjdTFtWXhCSWYzNTF4ODJ4ZDZ5dHlPZEd2RzYwdXQ3?=
 =?utf-8?B?SDliM2g1bENQQTBXdW1Jdmg3VFZJck9Cazd3RCswRmZHSGpyTE5WOEIwRkNG?=
 =?utf-8?B?dGx2RnJEUUhTN1dyNzFoY0R3MmRkRVIwZmVjQU1hOHpZOVA1MjFuNFYzU2p4?=
 =?utf-8?B?Wmk1THVFVUR2RWptcFhTbTNIOXVtNU9abmtsMnFCSmUxdit0UFg2R2JQYTg3?=
 =?utf-8?B?R2tRT1ZHbU9HT0wzeFVQOUpPUFM0Tm1RR3k2ajhsclA5aE9DVHQzaVU2alMv?=
 =?utf-8?B?cEpzVTVmc0RJdlNveTA0SDllNjZCMHpEaE9QakRhU044NGtjbnBEVVpLQ24v?=
 =?utf-8?B?Slg3QjFQTHlmT2IxMVpWeE4zVkRIZHFwQklBZWNGV2hVQnhOMlhTbFVEWXpa?=
 =?utf-8?B?QmZjVzZsM2ZVZEE2YUZDRWpGMVl2YzE3SXlXWjN3M0U0c1l5ZjZMU1pjVEt0?=
 =?utf-8?B?VjZMMjRUZ2NnemszWjZuWjdwdVBoYjdOMTFJMmR5M2NHLzZadnE2bVNzUlhV?=
 =?utf-8?B?SVJKN004anduZ0NvNEpuOUxnMnBjcXJXSVNtejBZR1RjNWwrWEpJUk85b1hD?=
 =?utf-8?B?Z0NmdEdwdlBwOVh6YUtweE40bGw3VWpHNnRwT1FJYVpTa3h2V3pBYkJNMllM?=
 =?utf-8?B?Ui84d0FweHVFQnVoT3VkYXVsS3Q5YnJVVTExVmZ0Yi9PLzlnVDZhcFF0OFF6?=
 =?utf-8?B?UGdPYzBlazFvdVB3Z3cwZ2ZWYlU2Mjl5dlAzTUprTm03K3BZU2ltYWZHSnln?=
 =?utf-8?B?OW5LdUxzN2pmSy92QjRteERHcWtmNVZhaEJNWHFYOVpxeEdwVEpTeHVJQzJY?=
 =?utf-8?B?YlRHZnhEak0vSzlQVW1zT0JpRFdKalpXS1ZaWFFDaEcwUWtXUzFJN2J1elVH?=
 =?utf-8?B?S05PU3F6bVRHUURmaU5zMUUzWmFaOTVXdzByQTdYYjFZY3ZvaTRvekhSWG1S?=
 =?utf-8?B?MHlmc2dHM1hyanBxdzQvMCtwTmdjRzJncGtJNlBHY3FEbUY4QVhlOEQvSVJU?=
 =?utf-8?B?ckljOENjV3pMOWsvempVM0d0WlBCVGh3SWdaS1ZIamxlSU9MUHdJT2xSRGpS?=
 =?utf-8?B?NmZUZ0M5NkZ5S0RPYzQzdEJRbExTUEJHUFVzU3dJZEtydnEzaVBselY0ZDl1?=
 =?utf-8?B?SVF0emFJdlVtNlJ1Zm92eVB1N043WEg4YVc2WkxRdk9nNWxLQldFc0FQQVlG?=
 =?utf-8?B?S0t2a0hxQUFSVXZEcEVEWEtLbysxRVlXbWhrZU4vbldIMmVhVUFtMittTHlV?=
 =?utf-8?B?S3JjRjViRDJVeVM5VnhIUk9XKzhMWDdPOHpWMXh0QTNPamVzeU1hZDhGTGph?=
 =?utf-8?B?NUpybEU3d01PclFsQllrODJzMHhjWjZJV25UN3RRQXBTL3haYVQ4VVNDTkNz?=
 =?utf-8?B?MXlNOFcrcUMyMWRlbk9ZbnRQVmJ4QXE1d2tSOExyRHd1aWMxOW55WHRHOEpv?=
 =?utf-8?B?eFBGNG8zdHpaak9IQmxxTEJEU2wrZVp0bWJwMnRLaGlvL0E5SytqMFMzZCt0?=
 =?utf-8?B?aFlpakN1R0tDRG9JRnpGa0RRQW90RFNKZ0ZCTjFWYVg3bjV1c3k1M2VaKzJW?=
 =?utf-8?B?SXJ0S0lGcHZOTnI4MFRUYVlGbEw5d0pTQVZYOU1jcUR0MTBDOVJUODhmOVdM?=
 =?utf-8?B?UEFiT1FMV245VENLM2dBeUVBbHJwcWNXdWFGbFpNRDBNL1JHNmcxSEI2S3Vh?=
 =?utf-8?B?L1VDcmRzbXFySDhmYnM2YmZEK3I1Z1RpeVlyQ3NyTTYzN0JmRi9EbHl0cE45?=
 =?utf-8?B?anFHNldWZ0g2a21jZXNvWFUvK29WeWI2RHdQVHNFTVpRS2tLNUExWUhRQk54?=
 =?utf-8?B?Q3NCcUJJUUpZNCt1WWxHSGV4b0NYSGQvZ0tCeGw1SmxrUm5QOEVScFJ0enE0?=
 =?utf-8?B?OWVhZ0dMcytaTUdBb2NHRUEvbDNmdDhZdkxHb3lGSlRkcW1VcHora3BhaFY0?=
 =?utf-8?B?SmZTUzFlbUVkUUtNZEZ2bmRRQWYxdXdDMzlpbHNOQmE3bWJMc1ZkYy9VTkZG?=
 =?utf-8?B?dWVRQ09wdGZFZENOUVJIVUZHWHJ6dXZOL1Mzc2FHNEFBTDk5MG5obUtOZGRt?=
 =?utf-8?Q?SHky6efx2asorTULOY4JGOUyz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097ff62d-ff9a-4644-a133-08db58720537
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 14:04:54.1470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAOEkdR4xf54qcatN1KW7yTsjvzC5ZgMTzP4KQxW4NETdkr8c9/y2DO7hJmQz1jgDTUMrtNYfbd5Bzv9Leip7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823

On 19.05.2023 08:15, Jan Beulich wrote:
> On 17.05.2023 19:05, Andrew Cooper wrote:
>> On 17/05/2023 3:22 pm, Jan Beulich wrote:
>>> There's no real need for the associated probing - we can easily convert
>>> to a uniform value without knowing the specific behavior (note also that
>>> the respective comments weren't fully correct and have gone stale). All
>>> we (need to) depend upon is unary ! producing 0 or 1 (and never -1).
>>>
>>> For all present purposes yielding a value with all bits set is more
>>> useful.
>>>
>>> No difference in generated code.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Unlike in C, there's also binary ! in assembly expressions, and even
>>> binary !!. But those don't get in the way here.
>>
>> I had been wanting to do this for a while, but IMO a clearer expression
>> is to take ((x) & 1) to discard the sign.
>>
>> It doesn't change any of the logic to use +1 (I don't think), and it's
>> definitely the more common way for the programmer to think.
> 
> Well, I can certainly switch. It simply seemed to me that with our many
> uses of !! elsewhere, using this here as well would only be consistent.
> (I did in fact consider the ... & 1 alternative.)

Before even starting with this - you do realize that the C macro
(AS_TRUE) expands to just a prefix for the expression to be dealt
with? That would then become "1 & ", which I have to admit I find
a little odd. The alternative of making this a more ordinary macro
(with a parameter) would likely be more intrusive. Plus I assume
you had a reason to do it the way it is right now (and I might end
up figuring that reason the hard way when trying to change things).

Jan

