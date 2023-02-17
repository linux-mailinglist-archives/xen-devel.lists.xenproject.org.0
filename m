Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5469AD6E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 15:11:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497133.768039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT1S2-0005x7-Sw; Fri, 17 Feb 2023 14:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497133.768039; Fri, 17 Feb 2023 14:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT1S2-0005tj-OY; Fri, 17 Feb 2023 14:11:02 +0000
Received: by outflank-mailman (input) for mailman id 497133;
 Fri, 17 Feb 2023 14:11:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pT1S1-0005tb-4v
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 14:11:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6fc2642-aecc-11ed-933d-83870f6b2ba8;
 Fri, 17 Feb 2023 15:10:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7905.eurprd04.prod.outlook.com (2603:10a6:20b:235::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 14:10:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 14:10:55 +0000
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
X-Inumbo-ID: e6fc2642-aecc-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTl1yy0h0HXMqKfG1spQWrLL1XB8S76JR/gV53NLU2T0xuvccNPF8XoNonmHhGpABZbHExo0c6Uonncn+XCblq+a6EmupcnjVD1Fv47NEWsWWtBONiBldi5QRvfwS9T9tL29E4aNmzqXc1c5eVNxUZIiwUqcQRfAB4GVbLt78jLT+HjedTZe+7N9vitm2+U+coVN5/LwIdvED0NBYFXxdDvY8gvCVOasBwINcLTCAHIG0XFHilzsBhaOt0H3nqOg4/MLW++L8wjwtqpHx5CCA7WkZ5l6MagJB+LQcgsO9UlRIc4oydfVpDwzPKoAedkb+ohPbbR+0qMgnCmQqFC+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8N9ZuO1bWoIoIf1JAd9rHc0q/9QQQjWX6y9ZSEOl2U=;
 b=DhJGfgvOdFLvydxfG2pLEqqvLJTEjSaF3YlqqOAbUrOpVcmNsWhrFjA0+1hbrdG/VyAnif/57Gr39cQvUkd73KgLLHWcW5PLNpfxkUu+XI28gc8cPd0+TQ6qu9XMvV9t2Wu8WYGKs1wUE0YHBvX3rFhZQxWgxDHpyqDeATzQEFPnVhMqdwYcC/Ywd8NtLhgejYwyX3rrIIsRFxuD70YANLIA758U3jFNpYYuD97+56eVL98wAt+Pwov42Il3VS/1kinxO06OjCIB9UKTlb/KHN5DC2FILh8sNiNtVKodp1DkpQ6grOMIOjdbLB8lH4oEm6za9hnDkxKwKttI6GoO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8N9ZuO1bWoIoIf1JAd9rHc0q/9QQQjWX6y9ZSEOl2U=;
 b=bs05I9dwloJah1nZgz14KN1YMm9h2igzIgv9TJQfGR27e3h5QQ7VYKJETrn3Zk3T5RL8GXGi3A+dU0GUxCNZNVWi3h1nudFyk3zjxY0CVW4CLIW7poosvcv2+to0ru019MFS+LfoM+nz5x5Bkr9juzlxcgjoqZ9C6MU1y6owvsAkKg7xkq9PNiKh/GbTXBcrNm971g9/C56hU3wJNUds4vKnQalehrjoPdKPRq8Si2MlKSwanbZ2xkkZEbH6cU7ZLDrYbRJd+Kke9gn2QlP1NvdgQnIyLAV9LKHh/jcJdSA3oJYXl+c07lwoixMaAj0cD7UTmosqasr6iO0G3lIDoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
Date: Fri, 17 Feb 2023 15:10:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
 <3aa736d3-b833-0c6c-2a41-71cc4b953aae@suse.com>
 <20230217085006.GA2281468@horizon>
 <7e79d20d-0922-565a-e46d-e3366c0bcfb4@suse.com>
 <20230217092948.GA2282871@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217092948.GA2282871@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 57caef0f-037c-4654-dd93-08db10f0c8e9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pXm4m0MuvLK8NxhcISd1XtzlM5jNMSCiFrCnnJF6njPKwdNAx2kjloGeK8n+TpJUZcHjs8D2ZQwepppaDi+HD5WiPq7MIW0P2tcst88psCM2/twRKBvtJT9w1QnEC7xCRp3qVo+X+ChnXH7U+ELlwDjxfhwXZf9CK/WquiKwiBNGsbpewtZxs7dkNhukfZqIJC4/RhBpC58VrXlcWuzn93rWQC4RuSTPWEb3sbm4YuJSUohK05Vf/Dn13GGhQbSr6+Sm7mZfOFW1z/lwYqwuodZIXMwgi7D6xNnj5eXFWbTNe1or1jYeo33ehfRuQ28jPiLJSukOZiCme7SvwjxL2C8V/u91EB5CuN/4WKszFL7L6H89pUlzsHsXNFe4AhWppKOcGGhIbf2oYcrSt9b5uGYiffG93YFZ1c3eWJT4VRPipPQrmNmy9R1vFckKWfCPaFcsTrcV2RsCvpzjNqZF5l4T5d+iyfUyFq7FOdeZ6141/u67KQ/dDMC2uMpTbjUjrW1wj2mLSD4rMLit82n8PpfPi9u1oli23j+tpviKDC3WJ5LWlSYertWwJ1e/LnzM9bJ65aijhYbEwc7OINUtnqAh92dJ6u7uTagOWlwSQS1daCSqG2CZOggyCBZ4gDd8K3KqQEotg0F8yH1BGOni32UrE5Kc3wCCBjDfaWdn5iX0wnLsqc9SjP3LddQWVIb/vckhvMh3T+Vc5f8DvcK3lTRkjipBgj2znTghW3h/WiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199018)(8936002)(86362001)(31696002)(31686004)(38100700002)(41300700001)(5660300002)(66556008)(6916009)(66476007)(2906002)(66946007)(8676002)(4326008)(316002)(54906003)(2616005)(478600001)(83380400001)(36756003)(6486002)(53546011)(6512007)(6506007)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VuZGxoNndHNUZPYm9xRHdjbkdTWGFGTEpIc21HaWNOb2t5bitINnBpSmh1?=
 =?utf-8?B?NURLMGNkWGt5WGNaTkJJSFZ3TDNXUTNmWTErS3RXd3RWMFdMV0w1dTBHMm1P?=
 =?utf-8?B?UmRpMmVhdFBLOUF4ckt1eTlvMDRTQ2xVbTVXdGoxS1VDNUVoSFNTV1VjaVk1?=
 =?utf-8?B?V25hZHk1ZWNScUd5dFFMcGZFREM3ME03UkR0Q2ZJYVZUSm90SUhvQnJxQnd6?=
 =?utf-8?B?enlWUFZRcm1ERmpSTzFjWGJXK29BejN2OENlVDF0Y1dEVnhlMjREbWxZMDFQ?=
 =?utf-8?B?QWpIRmNhYkVYUHNUcVhUaWVjTHp5QTRCYzN3T1dYdjh0c0Fib0w4a3VFQVdr?=
 =?utf-8?B?KzA1ZVMzSXpSWGRjZFV2SHV2d1c2MEhyeHhLTnMyTEk0YmRocDVpVmxQbzFs?=
 =?utf-8?B?T3ZCV2p6OFNELzk5MUhmRmcrdjFrMnlML2dSUWpJczlWSDFGdENWTzlLTTJE?=
 =?utf-8?B?VHAvL2V6dmNOL3RoeEFuLzlWRFRuaE1lYzFPRCthcWpzbkNhQkVrTkVjT25x?=
 =?utf-8?B?R3lURm9IVEFFc2s5dGgvaG9zUnlWb1g5eGVPandZMXlGaWhxNkxNb3pNaTVD?=
 =?utf-8?B?bi8rWmlFQ3BWV2o3TDR5VEJQRGxKYVovMWM2SVBCL0dka1dxU0dMWm4yMkVw?=
 =?utf-8?B?cm9rODltVGtmQ1RHSnVFd3MvL1NCUEY3cHk2NW54YmlVcEJ5alFhRzRsSkVl?=
 =?utf-8?B?dFVRRnRjcUdLdDlIelZjVlBrT2VwRzNZQlVlWm9ERmorR1dSRk5WUmdMZVVj?=
 =?utf-8?B?aDRQTGdwdVIxZEowVVhmNThKdEh5SHM4WDJvUyt1ci9yU0pLUkZkWnM3cEpp?=
 =?utf-8?B?QWRxSnZkZDlKck5jUmRieitvM1pTamFabVAwalo3bllsTlpZTDNvMXdhSzAx?=
 =?utf-8?B?bE4yR0VsNXBkSFAyM1RGTFQvUlgwN213MjFDUFUxOUg3empqNW0zMWhIUU9G?=
 =?utf-8?B?QWluSWJLMlhRRHJ1Z1BDRnVaWUdzSHQxZ3RqdUxPWVY2bUJ2bGNiL1hYaWZB?=
 =?utf-8?B?U1B0ZWcyL3BndHkzU1FaMGZWUkl2OTdNU1djKzFWVXJsa2hCZXhtY3Rvangv?=
 =?utf-8?B?UW1vNENYenBRdWI1UVNoNkdKN1NlRWlZMVpLeDZZWlkrdU8xYnNrWHgvNUx1?=
 =?utf-8?B?LytSQTQ5RGppUkJaaHFpNUEyWUJOclozVkc5S09CUEh6OENJNmQyTW5Ub0Vq?=
 =?utf-8?B?OHpqaDJzN2NXYkhsTDhhMVB5OXdjM2UrWlpmejlWbFJhRkdSZnlJWXoxRWxD?=
 =?utf-8?B?Uko1SHFTZWhEcGRwTVR5WDNDVGVXQlMvNWUxdTNnai91RFpIRWlqdURISi9I?=
 =?utf-8?B?MnlGZDZVVVNXS2lWendEZ1RTSUxwc3JVenJZWHFEUzFnRFNmdUxMUXNrVWlq?=
 =?utf-8?B?WEFDS3Q0ZGY0TzFKdWk4ZGV0bWl4QldHNEdpb2h0aVgxU0FoYzN3ZDl3c3Zy?=
 =?utf-8?B?NS8zVzBaUnFsWHQ5RVpOc25lL2I5eSt3Q0FwdmU0VklSRG5uM09jM0FqZHQ5?=
 =?utf-8?B?eVJ0c0dUczlPQ2JwSkhKaEhtaTFyWlRUU0ZYWUlnWkFMS2RIZGw0anlqWmR1?=
 =?utf-8?B?U2hlczVmb3M1bmY5QTRRUHhRV29IanQ0czhVbmJyem1RUlo3eGRTajRtZFQ2?=
 =?utf-8?B?aFVoMmJ6R0pUQ2FZalphWXNDRmR4TEdkVjlrMFFpV3JaaWVPQjBoSmRoYkxE?=
 =?utf-8?B?VnAvbUVIeTU0cFVQeVNBQUVabEMxeW1iTml6WUQ5c294OTNqQUFzZ0dMd3FM?=
 =?utf-8?B?L0RzRjNpam5aY2FNQllVM3Q4VzJJS0ZIVGFFa1dWeWJEeDJkYlNESUFldWJI?=
 =?utf-8?B?aUFqRGlycGh2SDFOcnFEdGxaR1hyMUd2ZlhwYzRrVFd6TkFOVUlDdWhETnRV?=
 =?utf-8?B?MHNKYUt3bEd0c1JaSlBuaUZLYSt4bm5ma3dvU0pKM3paR3NJZUN1VzU1Rmww?=
 =?utf-8?B?MmxSVjBEKytYdVhPZEM1KzdxeUl1VWxHQm1zVFVlcGRGVmZFbVNIaGtRNkZW?=
 =?utf-8?B?STBEUjZhZ0FIZEFsT2xGczhOb00xY0UwbFFCZWVpcWVCV3Z6WlJvU2IxNTVZ?=
 =?utf-8?B?SXVXdkoxK3hMdXoyUndiZS9ZU3VKSjc3VFpueXlrRXNkVzNXUjVJQzFqczFr?=
 =?utf-8?Q?vwIkLB+6MT4W7Hdn1Petl8WHs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57caef0f-037c-4654-dd93-08db10f0c8e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 14:10:55.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+yeDXB9y6GL7SByVStfdPxWsOUgReBJV/bJVqX1KL7m1rbjOyDUyw6Zxzk8/Kwd592aAVd211nxyscVi/Y2Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7905

On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
> On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
>> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
>>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
>>>> On 14.12.2022 08:29, Jan Beulich wrote:
>>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>>>>>> +{
>>>>>> +    struct page_info *pg;
>>>>>> +
>>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
>>>>>
>>>>> The ioreq and vmtrace resources are also allocated this way, but they're
>>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
>>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
>>>>> need to guess the MFN, but that's no excuse).
>>>>
>>>> Which might be tolerable if it then can't write to the page. That would
>>>> require "locking" the page r/o (from guest pov), which ought to be
>>>> possible by leveraging a variant of what share_xen_page_with_guest()
>>>> does: It marks pages PGT_none with a single type ref. This would mean
>>>> ...
>>>>
>>>>>> +    if ( !pg )
>>>>>> +        return -ENOMEM;
>>>>>> +
>>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
>>>>
>>>> ... using PGT_none here. Afaict this _should_ work, but we have no
>>>> precedent of doing so in the tree, and I may be overlooking something
>>>> which prevents that from working.
>>>>
>>>
>>> I do not fully understand this. I checked share_xen_page_with_guest() and I
>>> think you're talking about doing something like this for each allocated page to
>>> set them ro from a pv guest pov:
>>>
>>> pg->u.inuse.type_info = PGT_none;
>>> pg->u.inuse.type_info |= PGT_validated | 1;
>>> page_set_owner(page, d); // not sure if this is needed
>>>
>>> Then, I should use PGT_none instead of PGT_writable_page in
>>> get_page_and_type(). Am I right?
>>
>> No, if at all possible you should avoid open-coding anything. As said,
>> simply passing PGT_none to get_page_and_type() ought to work (again, as
>> said, unless I'm overlooking something). share_xen_page_with_guest()
>> can do what it does because the page isn't owned yet. For a page with
>> owner you may not fiddle with type_info in such an open-coded manner.
>>
> 
> Thanks. I got the following bug when passing PGT_none:
> 
> (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
> (XEN) Xen BUG at mm.c:2643

The caller of the function needs to avoid the call not only for writable
and shared pages, but also for this new case of PGT_none.

Jan


