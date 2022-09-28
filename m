Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF45EDC6D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 14:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413306.656870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odW2N-0001Xw-7k; Wed, 28 Sep 2022 12:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413306.656870; Wed, 28 Sep 2022 12:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odW2N-0001Ux-3a; Wed, 28 Sep 2022 12:19:39 +0000
Received: by outflank-mailman (input) for mailman id 413306;
 Wed, 28 Sep 2022 12:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odW2L-0001Ur-OP
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 12:19:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0ffba84-3f27-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 14:19:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 12:19:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 12:19:33 +0000
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
X-Inumbo-ID: d0ffba84-3f27-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asVf65sdeDK7hWo3DYozk5OWQHr4Jzs91yXzmA0uZfDLPd3v60eAZxS/ky/QWhYp1qwC1O6gsIJxjK50GzqYFgB6Jo1sY4s2ywLVNjNCSHxgFZzDLmg50moY6OFchW6tmXUtd9CRg964r8zoe7Z/gPVj3VlHIqDjbKuA/QOsIXqb52CbMHQ6pOz8el3JRQdImVrtUy6eiJnREPatpV1/92+fUIlJdoIrgbCQF95mpXrhpCLtl5hcAa9HZYGhTFtUeSQlmapZOco+oYJ0f9bHHa6PthsKv1V/UJRbdJnAKaCJDM0IkbnafZJFI+2iFL6z6mr5AxYSTcYZCjDcyrzVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNlty5GSGJXEwlDKKrNA66z9NHQdWfa/G8QT3SLNiZg=;
 b=jtv5eMi2gSqFop3/+MD0/GWLQxT98rmiG4zESBFJHimipUHGG0Z2K0PuWlAhasXCOH/68wFNhY9kQ7qNKR3tOZnkEAhrrWmfXgIIepd1B+EQnUkXLz2gexBbQEAl15uQTGgyIyxg+kG4vspMsmSUOhJcLxnOuTDL2kQaS3/DMXTEFt5xzRZq/r/Rn5ieZ9D5m4ZnqSawP6jTUuWxJ53uCDFkj55QlfmTc+L95KsYuFSAbGl+BnW4gKR0NYIqcHgXnr8MHNFZMxEVwURwGiwbev8YytPSnemUOwdsF5IbmRNC+f28xBUJ5vk2aRshxR15T3xaEcm4AhKfQVBnRAl0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNlty5GSGJXEwlDKKrNA66z9NHQdWfa/G8QT3SLNiZg=;
 b=3hvU/JlII1MlQ0+2m8fUzeWrt3v6KSFIj5X793VTvtS0+Qm7YDiRDZX+WCOofZqMuD7GHJuWV8gHYZLth4p9HtVGwgWWb9JcY+r7ljsJpt3u0mjIKe0HrnSew4CHM2nPNGbFIGapAiweyW0+Cy+eH/tapNUJfdksPPGC5+f/kvb2ITpwgBnhDOaJKyqW6jFaWcbEQLtcv3GdhHZQUgpSKSElhq0y2rTZKyh16lTCJMIr01bkB5x6LE6bAVNnZVCo7LGtLq+bPnGwX3vIgC0tMczWqjl0bKqSJfQtKXdhn0NHBYM9hOKWZiB1hcZnyzfF7/1nGoExfTJGPpTobQplzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a67df6e-bab7-978e-0045-9165621d1ffd@suse.com>
Date: Wed, 28 Sep 2022 14:19:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [4.17?] Re: [PATCH] x86/NUMA: correct memnode_shift calculation for
 single node system
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
 <YzMcZHa55QPqepiv@MacBook-Air-de-Roger.local>
 <db13d059-250c-4224-cfa3-b2b148f95532@suse.com>
In-Reply-To: <db13d059-250c-4224-cfa3-b2b148f95532@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2227b3-640a-4582-61b2-08daa14bb3a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G1Zmu1clx26RrtwUAflD2a0P4C68uOst/EkdfsvFS8ZavjGs8ZnNrxfbktoquhP04jXBq5udp9bY7RCueWGYq47t377U3czFFo3dmM+0bfqu2ZxBL/73V5EE7TBSvOvIZnfVQ0CzS6J/Lc0BP19tIhk3VMrV+kBKM5+yhGXkV6rheDDxyUPDEL06ATT0AI9UVtfimvKOwlAcu5SGLwzTadHLEiw2hpEA27st0NDRoBR0raZkzS6Eq74B1pQAZArP1A6l3JPDT4d0JfvLonOlf2oh0WdZr6j2GdsFL7+00MEMLJfikMbmTx4Av6eGpWhs9l+SEFVfKAHjLbYsygXLni5E2z06drznDmvTL5VEbsn3wUjxZEwNnpgbqqf9I9Sg0TbM0cvbOpHIe8wSL8gYfPYUbK3fbQZr9h5kt15wnWAoSXbmbAZuEZ5qtP4PbNdoYMSGAZBB5WboIEZqyW5hl2M13Jwa3Aw/NrnF1fjnDOMJq5mRQlOBbST+rTM5VT+ispVMpQIcMR5cZQSaG7OgT2Ljoi8SntOR2PY3uK+R0sriXLiMzV5dLaa1TD23P0lm45A6VklCg7agQAOA/jR4qCCOQeWUs2f6LTR7rVyATLECg5jULGPCGz31MLcq3rxrq6peacDgAmci7Hts0FAcHPM1wrlSzJByMCmShtgDNJtGk9+w45pmn3qP9jK4ZUdhJtaVV2m7od50CpDbB7s+z5GwfSyCHyol1Iy6fGHmLjz1/TLOUQil2ZQqkjJkkU1isdkQ0XKG/dDfT37+lutxxnorPWG1tXccZBNxrqbu3LU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199015)(2616005)(186003)(38100700002)(26005)(6512007)(4744005)(5660300002)(41300700001)(2906002)(8936002)(478600001)(6486002)(53546011)(6506007)(66556008)(66476007)(4326008)(8676002)(316002)(66946007)(110136005)(54906003)(36756003)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3hPOVhDb2h4QXZCQTBuNnlMa0tFV1RMZXA3YzF0eTNqb1dOYnQxNXUxODdh?=
 =?utf-8?B?TUZqL0ZvRWhlZkZQUktqM213Q2JDM2h0bU5iWThFSlpUQjdTL3B2SnVTVjJu?=
 =?utf-8?B?OUxxNkZmZHpuTXJpVklnclA1bzRNNUhhNUR2ejdmanprd2hkUlFxYlllZVBJ?=
 =?utf-8?B?SUF1bXFLcThiSUxDSDYzQmxFVDk0U3NQdlAvYmJoL2V0aUxsK0NtdG43bDdY?=
 =?utf-8?B?NXhtMnhneHdmZDhnNzJxbjNPalo4RjNqNk9QRzRkNEZJMGhpdkFIYitsUjgr?=
 =?utf-8?B?Y0kvM2tGZStCelVGL1JySU9tS2pFY0NiQ3FNUUN2RzNacnlSc01Zczh0eVRB?=
 =?utf-8?B?MFNpek5KbXNLbEZ4VFFGUHFidEhkUFI4Yno1N2VDcHhxZks5SzE2bHIrMk9U?=
 =?utf-8?B?TEdCWkhxUEJEWnJEdmlvTisvUlh6NUxwQzJOdTdIbWF1b0VZSm85akVEeE5s?=
 =?utf-8?B?Z1BpcUpLZTYxM083Y1g5ZTdYNXBmZUNxTXNOQys3TnlaTHdqSE1kRUNQM3d6?=
 =?utf-8?B?WGJraXJ2MG8yU1dMdWkxMGVaUjU0MFlWM0JOZG51RHQzU2oyM3NDZTFjcWRK?=
 =?utf-8?B?TVh1NXV3S2w0endSZEkrdnRvdG12UUZKa1JsWCtGUG51RnRNN0pkcTlUMHdp?=
 =?utf-8?B?WVVINmtVenZ3NVRsakpKY21Bdm8yWlZVeVNmRlUvM2syQkkxSmlmdEVwL0ZN?=
 =?utf-8?B?UVdwcDhrN3MzcEdxekxSQzA1VU9ZYVdJemxDVWVyVklVTlpOMXFQM2JZSVdR?=
 =?utf-8?B?b3JBK1BvYXp4YjljY09NdzBlVG0yTmNuYmp5elFSdGxOYmx4RkJxckYyQnNQ?=
 =?utf-8?B?WTVPc3pWUVJWWXRTNWFhOEFVZHU3RTUvUTRmSW12cGx2SVhjN1VIRmpYeGNl?=
 =?utf-8?B?aEd0ZktVdHJ6OCsySzdaTUhXM1lmUE1DV29mMHhTSlFvSjFxb2ZmZ0tsTHZi?=
 =?utf-8?B?OGh1YjM1dmpEejd2YVYyY2FSTmxNdE5VbmYwQTg0dmRHM0kya0lSNUR1MDgx?=
 =?utf-8?B?VjhmcUdZU0NRZW02NTJhbDI4bzFiZmx1UURtOFp1SXdzNHRRSkNkQTdnSTlV?=
 =?utf-8?B?enZYMEFnVUUyWGFHMDgyMDE5bGdPaUNQYml3N2tKaEdRcXFQZHdmaE9pUTc5?=
 =?utf-8?B?M25JYldwZTdPSXpPQ3ZIa2NEd3pBTnBQYVpuVVRNcFl6dTRvaWlhWmtVZFgw?=
 =?utf-8?B?WmtWVFhxdXdRYVk4NzhxK2JDNjdJeTVvZVdxTG9WcVlMc2ZxMUdlYTJ3N1dE?=
 =?utf-8?B?Y1ZlS2szTGNhcVpsVGR3OFFCTGtRcHcvYWttaWNmTmxweHZ5ZUNCL1ExM3Qy?=
 =?utf-8?B?c2F6dUNaeUMyT0ZWMFFKbDF2dHdQS0lIV04rMmhQamlOSS9zNTdlS013YzhV?=
 =?utf-8?B?YkhaaFRlTHArdjA4T2J1SEhqVk9oVUZabzZWOUNVUG9OYXhyVnYxQ2liR2wr?=
 =?utf-8?B?WDlFcjNwMEVVckNGVW41Tk5VSWExaE0yR3NFYjQxOUt3SDdobUlyWG83Y2Ro?=
 =?utf-8?B?ZGMrOWhPTFlzblIyK2cxZURyVFg1aDJlWGtZbkFxM1VsMWRpdC8ySFVnUk8v?=
 =?utf-8?B?N3RwMkFYZkNqQ0M0Y2NLdElZWEtkbm9jRXhpTW96U1huWVVIRHBzRktvbW10?=
 =?utf-8?B?Nkt4UjdVSVBFbmpBTUV6dzJza0MrT05KL3dybjdmeGxRQ0d2WktOSzVsbkZ6?=
 =?utf-8?B?dUZNMTZETnFtWkV4b0lqVVpBRGxJL0ZDUG9YVW9YalBVVmFpY0ZLaEhMNVNm?=
 =?utf-8?B?UEJNRVJJQVQrUTIyU1JFdFMveERLeDZrVUtsRE9ja0oxKzdWNE9BazVvM1d2?=
 =?utf-8?B?QXlaR2xBSnJDTlhFZUJtM2FvTmRyenRCS0RkSlphMElvYUFnR0g3Z3pzQ1FQ?=
 =?utf-8?B?bVNMSmhWbG8yRVlhVi92QzZ5YW55amNZM0hTRzlMNm9HbGtVVGpaWkhQQnBJ?=
 =?utf-8?B?UVZscUVmeHVqTnBlaFRzdTF5UC9JS0tLVW96M3k0alhLRG00ZUR0MG5WdkF6?=
 =?utf-8?B?ZERwa0crUXV4c2JucThBYUszYmhvSi96M1dYTHBoZjRrWFZkdDZTZWI0cjVh?=
 =?utf-8?B?SXk4QTEwa3BhMWhZQmQ3bGxmVm83UHdGeHNTM0JHMDRKMkYrVm80VitHNEda?=
 =?utf-8?Q?wy0jyF4WvK2XOTlj1p3lqH4K7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2227b3-640a-4582-61b2-08daa14bb3a2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 12:19:33.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eqVBH2eT1qi1Kw7kRh4QEZZ5p8aSoNrrbfSFwErrqkhzJvX8gYDbvFIK9oEBJczn6Sb6wTAhXGoro4LLSG45w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805

On 27.09.2022 18:08, Jan Beulich wrote:
> On 27.09.2022 17:53, Roger Pau Monné wrote:
>> On Tue, Sep 27, 2022 at 04:15:19PM +0200, Jan Beulich wrote:
>>> @@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
>>>          if ( spdx >= epdx )
>>>              continue;
>>>          bitfield |= spdx;
>>> -        nodes_used++;
>>> +        nodes_used += i == 0 || !nodeids || nodeids[i - 1] != nodeids[i];
>>
>> I think I would also prefer the `if ( ... ) nodes_used++;` form, as
>> it's clearer.
> 
> Okay, will switch then. This isn't for 4.17 anyway (I think), so
> there's no rush.

Actually I'm not so sure anymore as to 4.17 - we're in feature freeze until
the end of the week, not in code freeze. So I guess this (and the other two
related patches, provided they would get acked) ought to still be eligible.
I guess I'll give it a day for objections to surface, but otherwise commit
v2 perhaps during the afternoon tomorrow.

Jan

