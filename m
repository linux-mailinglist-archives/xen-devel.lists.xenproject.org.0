Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74F6AE768
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 17:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507635.781402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZab7-0005Dj-Pa; Tue, 07 Mar 2023 16:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507635.781402; Tue, 07 Mar 2023 16:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZab7-0005Ax-MI; Tue, 07 Mar 2023 16:55:33 +0000
Received: by outflank-mailman (input) for mailman id 507635;
 Tue, 07 Mar 2023 16:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZab6-0005Ap-Bh
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 16:55:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de82a871-bd08-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 17:55:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 16:55:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 16:55:29 +0000
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
X-Inumbo-ID: de82a871-bd08-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVG6GXWvK2XpN4XRro9vmRpubiIGok93uNtnWHZd+mhOVfUE9f+XcZj05BOvOq6yeFAq/FrqkwROTn4KVVB98/ffNjIytcdzQCS1zeqRzt6BG6Naeze4nMFIIJq7mvPrbk7mLaphA8ZoB838NXpoJwwRBFmdB8AK62ll7dEOthRkGSFfdm8Za8pAEZAaf1aRtMhk6yFHHLt44TZUf/36/JMGWccOA513jTUPX1GbInwXZFkr6SJOBcjNlPWP9OvawhKXU5E1d+bMwAPzDKTVvL7JS3KzqKuhAe4DfLvuojrfgDYWYrIAhSKZ7m2lSMboW1BXA0Ke0ugnh7T9v46lcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaoeVogFuJ2E497MlnfWpCYFKBn8otA3ia/LOL1N1uU=;
 b=BeklafaMvGZEN1/O3qxvwSQyXFOcXXSbu9a9nIcuthAv/rLP1VW2phBqyBpumEDiEH1q98ZkxX6m60LnVD0rBJbDhDCRalGxeu3SLIsnyOH7dNtt5O+YNUVU6F0NnQ91JAgThb7UGbhCEnDz4X53QRs1d+tF6nvtAvsbBBRdNPXoVUqjcHx5b9UdqdOWQ+/Xp/mPiUiBSnMKhqbwlK2IwE7NySg78FfKVA9pSIRuJKfa0vZQHHJbb9A2tm95v1w+Gu4yKQAKj1PjfI6KsnA496n/8XtAcwbZ8awurq2rUUBNCn5CYl1CksPk8nGYw7eWPXc+dQiyHGqvuprmdFxCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaoeVogFuJ2E497MlnfWpCYFKBn8otA3ia/LOL1N1uU=;
 b=Btm0i0K4eEaa+7ka19wPkvsWpDSDYDQnB5mBWslo4I45qDWEmLPy9JwedylBOyC59F40fBY7gdUSA/lndG7pki6f+zCh9Vd8A0l7PDV2e/PV+0In5HJzA2slhIXv07moUjYx+9o01EXhwlt7wiEtr13fenUUYw4oqszmKgPWV0QBpridIfl3JiH0IYlmdDcbUub0PWUrPaP+cfpqXH1QamaHYndF6o0/f9V7HYyXPTgHMNncOG8mW7dEUDYIVGgtLYfbJETHnZxf2TnsW2RLweQdPeSiEzskMlPYYmvJZXHFioLTcIVCN1EIEp7LLVwf9x9Zb+AOUvKJtPz7whi/4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29630f27-3de9-ea1a-de2f-f9c8449da2ab@suse.com>
Date: Tue, 7 Mar 2023 17:55:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
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
 <9864e936-5c77-a790-e36c-766d5359cd83@suse.com>
 <20230223121647.GA3260113@horizon>
 <496b1fd7-4540-66c6-be89-51f20a6666ab@suse.com>
 <20230307144427.GA997565@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230307144427.GA997565@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: b9834b90-f886-4419-9ca9-08db1f2cc16d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0CHeuRlFW3PngrummR1yCvHFd6GKMI20nmfcytR4umMFvXqy5rGyZoJaEjh97a3sPLnn1iM1mqsUz4nmAYTYA7RTnMxlVJ9350HtKpuLOS4+1vUzVpszM1PMIDd/tIOi4Mgm7havyQy7ruITHYsNAzI+mr2O+Qo1w/ZrXDnglIzahwQvLNE42pLRLiwcYbIAkQxA9ndpEx0bEx7deGDn2jcoDN4MkwLdo/CiJyw4aMv+RRaptHpNCgI335e1fKZ5qCW4znyfA22quERocUmog/cHH4vSotPVD1WXaspN4Bz2N+pmbdUq8Ikn2jc2/ohuWwS7xnHe7UA7FrgSPUdPYqre3IB3wxoslAabNlCtI41L4OnXOl9BsEYisCfCNV6penuWSCmU3x6a4D7vsiqjDe+NTLtEfr2bUoQmo7/l1hzrBz3PW4A5r68V8d/KwqHWRC2MXhzdfmVRj2iZGpnps7NFyniTdyN/S8b1cH7ZzcCNkfS/khR0y8ryQny08FZmg+cfdfTYOkj+WaYM5hQsTSxUT8qGUVO6mhtkObBFE+EviuJQ7lPctWHLD4dkH89vGPzFDUgGctjXlawZU7SH7G/O2lC5MhVtAgBnLwTFXVm5345aMha3LyU5SU7bsGPj4j3frZCmO2KjRvPCg+eoRyvA1rEivzTg5+ewQQyO9/MYJcKsZsi6fo1OOJrS9i7K/s5fMuCFEQ9aiOxLGCrMbS6425qZi5zWkbKWk7DzJ/w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199018)(2906002)(186003)(5660300002)(6666004)(38100700002)(6916009)(66946007)(8676002)(41300700001)(66476007)(4326008)(8936002)(66556008)(6512007)(478600001)(26005)(53546011)(2616005)(36756003)(316002)(54906003)(86362001)(31696002)(83380400001)(6486002)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmU3a0FuVXpuWEswYW8xVE9uZ04wbGt6RkFTVHNwQ0xhZW5rNk04ZTE1bmox?=
 =?utf-8?B?OU5ENjVlUFc5TVU2UHBqSE9OcjJNbG1TSFFUeEU0SlBZdm1NN3JMVzlQU1cr?=
 =?utf-8?B?WUlHM0hmMHlDQk5Rdy82TlE1TVh0Z3dhYm93b292KythTmlqWERLbVZieU4v?=
 =?utf-8?B?am5Cc0JuQVhLSFJwRlNzd0x0SlBLWjR0ckVFUmZFMVRLNWpaSStVdEJ6MTE1?=
 =?utf-8?B?N0dvOUdkQVFueEpjRGJKRWRSZ1hhNmR3dHE2UjZFbUZMb3lYZWNZL2RRek9W?=
 =?utf-8?B?alNGNEM5NjlNMXMrMFNkcGkrQjM4Q0t4anV0TDZKNi9UeEl6U1J1STM5cVZp?=
 =?utf-8?B?allIYXN5WUlkbG9sR0g1Uk0rOG43VnA1MnNhRzN2Zlo5dEd6M3dtNUZ1ejZF?=
 =?utf-8?B?SlNEanFNT3plQnJWN0VBT21UNkFYTzFQS2p6aXhCQUxYRmpGcmRpenVMazJz?=
 =?utf-8?B?ZzhmN0hYenBXeDJyMEI2dW5XMld3RzFJK05pb0kvZXZNWEMwUDF4ODgrVmtE?=
 =?utf-8?B?VlU3VTRLL1FwZi9nTGo2MW51RVhKQWJJZUZGR0w5SFdCYmtvM29NVklGYWV6?=
 =?utf-8?B?YUcyUWhYRThRdkN0eXNLTXZ5WFNFSEFORUJreE1naUY3MnR0RDVVZVZwaUlo?=
 =?utf-8?B?UWp2L2Jkd0RuZkNDeGJkWWZpRGZ2OU8veWU4SndPaVl3L01QOUtCSnNPbWVP?=
 =?utf-8?B?RURoL2hIak9rRTBKcWluMm5UaWVUMkwrcWNxNGZvdER6b2t6RWx1cXIzT0RU?=
 =?utf-8?B?cEhraXZtWjBxeENLeTRBZVZObVY4a0lEVlUrSW1KNG53SEFQcDZYOVNFOW1j?=
 =?utf-8?B?STZ3aStEcENvSVJ5ODc3ZjZsRnk3ak44c09wampWZWV3R202U25uVkowaWVH?=
 =?utf-8?B?WnU2dzVnbU9CaHZaMWNrWmo0SnA4aWo2aFROTjJtUnViamZTcEFISS9zemxS?=
 =?utf-8?B?bkdqbnlPSVpaK0EydWQrZmVoTDl2MUhmV01XaVltZkJBMmxEVDN0bWVjRnlB?=
 =?utf-8?B?OFVuU3R6c3pMWGFjdFlyRUlFMjRxUk9MTDZieVNpMVRaUmpMYkJKVkN3aFRi?=
 =?utf-8?B?T2JDT1Z1MVl3NU43Mk9VbjhIZGhmbnlBU0hrUmVPazFMRjFSYTlqTUpKc1cy?=
 =?utf-8?B?SGg0eUIwZXRZUHUvSzdzenludU9YL05MMmlCM1V3L1dtdit0NHl6Qmhlb2N4?=
 =?utf-8?B?dUVvS3AzVjNqTHhsZU5LdVNpVnhZaENUKzdNU2tmWHhhWFd4ZkRxUlcrR1k0?=
 =?utf-8?B?QWtBSTB3d3ZweHhVbHlpTGsyNDh0T3dhTGhkM1NZUFVIaFdEN0FCMGxUa2VH?=
 =?utf-8?B?a1JxY01zektvdlpZMDFyYU9La1lVY09kdFQ3WlVaOWlZZzVBaXpNM1I0elRx?=
 =?utf-8?B?Yk9QT1M4anRkbk1PdE9EbFNZL0crd2RUTGtmeExPbUVSNXI5YzlEYUwwTHNr?=
 =?utf-8?B?WXNxMW9FclE0em5wSzhhRTlSbGY1dkZHS0JZazE4cjN2OHdRaWg5ME11WUlt?=
 =?utf-8?B?VVJnSnpzckY1Q3pscDkwWWZUNEIyc3BRS1ZUR1JXOHhyRlBrb3pneE5XbEhY?=
 =?utf-8?B?eHdjLzVtWjUrL2FORkhpb3Q2L0RZWlYySEdmTk9PeW4xUVdFM1c3aFhMMVZG?=
 =?utf-8?B?Z0Z5dW95ZEZ1T1l4b2tiMXk2cnowc0tKZUtmUnFKQmkzNDRmc3lFLzcxUXB5?=
 =?utf-8?B?R0RRL3hPdDhIaWNRRTVKOE1GV1RtNUxpajZwcmlyYk14c09NVkVJajgvaUlY?=
 =?utf-8?B?dVZCbzloeXR6T0FZYis5RktXNzMxUkNpd0ptT2pzRklOakRkUE9VR1Q1U20x?=
 =?utf-8?B?VzFWUlRRWWpDNkRCUGpkanRxM0kybThBakUvUHVkSlZ2TWU3ckxNNzdzS3Ew?=
 =?utf-8?B?Wm1odUlUeDA3andEaW9WVEJWdHhObXB4OTczMHJSRUgzK25PL0oxdThUVnB0?=
 =?utf-8?B?dXlRUVg4aXRMZDBRSDVrbTlTLzJoeVBabzM1aGxnNzh3a3NIS0ZVdDEwUFR3?=
 =?utf-8?B?MWhMM3BCbHVIQy90RXRIRUczUDlVdnhuQlp4L1NVbHQ3L1lBeWsxYlU2STJm?=
 =?utf-8?B?SmVIa2hmZDFCQ3Q2QVYrc1RZZXZPL3Y2NzVQNXFjNHVHUTZrVUQ1c0Jad3E0?=
 =?utf-8?Q?zey/1CPE8fn+3MhhNCkcvndCu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9834b90-f886-4419-9ca9-08db1f2cc16d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 16:55:29.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbhyPjKLkfyKJe/41AGsy6TVXGbu3vE1bQ72RX3Osl4Nynd3I5PXvFfth+4Cnamop+bQIyp9fHccjfEH8cGwTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

On 07.03.2023 15:44, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 23, 2023 at 01:42:08PM +0100, Jan Beulich wrote:
>> On 23.02.2023 13:16, Matias Ezequiel Vara Larsen wrote:
>>> On Fri, Feb 17, 2023 at 03:10:53PM +0100, Jan Beulich wrote:
>>>> On 17.02.2023 10:29, Matias Ezequiel Vara Larsen wrote:
>>>>> On Fri, Feb 17, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
>>>>>> On 17.02.2023 09:50, Matias Ezequiel Vara Larsen wrote:
>>>>>>> On Wed, Dec 14, 2022 at 08:56:57AM +0100, Jan Beulich wrote:
>>>>>>>> On 14.12.2022 08:29, Jan Beulich wrote:
>>>>>>>>> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
>>>>>>>>>> +static int stats_vcpu_alloc_mfn(struct domain *d)
>>>>>>>>>> +{
>>>>>>>>>> +    struct page_info *pg;
>>>>>>>>>> +
>>>>>>>>>> +    pg = alloc_domheap_page(d, MEMF_no_refcount);
>>>>>>>>>
>>>>>>>>> The ioreq and vmtrace resources are also allocated this way, but they're
>>>>>>>>> HVM-specific. The one here being supposed to be VM-type independent, I'm
>>>>>>>>> afraid such pages will be accessible by an "owning" PV domain (it'll
>>>>>>>>> need to guess the MFN, but that's no excuse).
>>>>>>>>
>>>>>>>> Which might be tolerable if it then can't write to the page. That would
>>>>>>>> require "locking" the page r/o (from guest pov), which ought to be
>>>>>>>> possible by leveraging a variant of what share_xen_page_with_guest()
>>>>>>>> does: It marks pages PGT_none with a single type ref. This would mean
>>>>>>>> ...
>>>>>>>>
>>>>>>>>>> +    if ( !pg )
>>>>>>>>>> +        return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
>>>>>>>>
>>>>>>>> ... using PGT_none here. Afaict this _should_ work, but we have no
>>>>>>>> precedent of doing so in the tree, and I may be overlooking something
>>>>>>>> which prevents that from working.
>>>>>>>>
>>>>>>>
>>>>>>> I do not fully understand this. I checked share_xen_page_with_guest() and I
>>>>>>> think you're talking about doing something like this for each allocated page to
>>>>>>> set them ro from a pv guest pov:
>>>>>>>
>>>>>>> pg->u.inuse.type_info = PGT_none;
>>>>>>> pg->u.inuse.type_info |= PGT_validated | 1;
>>>>>>> page_set_owner(page, d); // not sure if this is needed
>>>>>>>
>>>>>>> Then, I should use PGT_none instead of PGT_writable_page in
>>>>>>> get_page_and_type(). Am I right?
>>>>>>
>>>>>> No, if at all possible you should avoid open-coding anything. As said,
>>>>>> simply passing PGT_none to get_page_and_type() ought to work (again, as
>>>>>> said, unless I'm overlooking something). share_xen_page_with_guest()
>>>>>> can do what it does because the page isn't owned yet. For a page with
>>>>>> owner you may not fiddle with type_info in such an open-coded manner.
>>>>>>
>>>>>
>>>>> Thanks. I got the following bug when passing PGT_none:
>>>>>
>>>>> (XEN) Bad type in validate_page 0 t=0000000000000001 c=8040000000000002
>>>>> (XEN) Xen BUG at mm.c:2643
>>>>
>>>> The caller of the function needs to avoid the call not only for writable
>>>> and shared pages, but also for this new case of PGT_none.
>>>
>>> Thanks. If I understand correctly, _get_page_type() needs to avoid to call
>>> validate_page() when type = PGT_none.
>>
>> Yes.
>>
>>> For the writable and shared pages, this
>>> is avoided by setting nx |= PGT_validated. Am I right?
>>
>> Well, no, I wouldn't describe it like that. The two (soon three) types not
>> requiring validation simply set the flag without calling validate_page().
>>
> 
> I see, thanks. I added the corresponding check at _get_page_type() to set the
> flag without calling validate_page() for the PGT_none type. I think I am
> missing something when I am releasing the pages. I am triggering the following
> BUG() when issuing put_page_and_type():
>  
> (XEN) Xen BUG at mm.c:2698
> 
> This is at devalidate_page(). I guess the call to devalidate_page() shall be
> also avoided.

Well, yes, symmetry requires a change there as well. Here it's indirect:
You want to avoid the call to _put_final_page_type(). That's enclosed by
(nx & PGT_type_mask) <= PGT_l4_page_table, which happens to be true for
PGT_none as well. There may be more instances of such a comparison, so
it'll be necessary to find them and check whether they may now also be
reached with PGT_none (looks like a comparison against PGT_root_page_table
in _get_page_type() is also affected, albeit in a largely benign way).

> I was wondering if put_page_and_type() is required in this case.

It is, or some equivalent thereof. Again - see other examples where a
similar allocation pattern exists.

Jan

