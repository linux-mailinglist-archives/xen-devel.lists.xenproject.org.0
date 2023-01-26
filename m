Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41867D21A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 17:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485144.752148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5QB-0002Ms-S2; Thu, 26 Jan 2023 16:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485144.752148; Thu, 26 Jan 2023 16:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL5QB-0002Kj-OD; Thu, 26 Jan 2023 16:48:19 +0000
Received: by outflank-mailman (input) for mailman id 485144;
 Thu, 26 Jan 2023 16:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL5QA-0002Jq-3z
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 16:48:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7d00::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac3f0bc-9d99-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 17:48:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7861.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 16:48:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 16:48:13 +0000
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
X-Inumbo-ID: 3ac3f0bc-9d99-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ+kCTQo5WUHIzkpK8QPkc8DDNJ7Kn3eQpSpocAdQnN5yikYNfglkqbNDVTjc9Sls/7gEQiWwBGKHz6l+rsAp8ICIP3dLZVGgtGvSYwB02zxhyDhjBSZpMbe0bpvtWIJN8vnvuPbrqMvst3EXi/UF6PfryQhEKrVVsBD7rjDxoIT+w/pzcxYeU2ifUnOPR8JyM3jhy4SwnqImQ7QumDvUBaSj3fW+PP8kS1ZH1qikspbjN8ytUuIPyVQHskxR6naF5JbU/Arc9i/h4wHHNveZq7KYovtaTSM15vvHkJ+/UrnAh0Dwuu3+0FYM3FhZauI4nmnW7yfA6xPhtdeb/ffEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPds969yM+ezwXn14kl8/MZxAMdHi6ULw6VbqlqSeKU=;
 b=LyhlGr3wmvTlKdAHGY3+gcUWU4zelstlRLMfFqKlEYIVVykt+pSqvPsaHGLzJVqQZu+hc2ymUnsfLpGurhgDFoA7JWS3XmbW8xM0e0/C2JegC7akDDmAfp7qp7fmVpKS+0eSSceeureCmwra4Vu82rJGrVnghuWMvPdFMEoK/hsD3syi46HttH6swN4662Ao1SbO1SgtQSKw4tOcfpH470cc+sCooJzlS6OwQZTHkpuojdvX7yqvaqNq/w6Ce0cuVHxS/SETbAQVV5+RE65D2hH93o4Zuuv2DbU4tsNwAgUJuzB3ioxObsdveKplWLIxhI6M5i3r9UNuPr5V5Zd80w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPds969yM+ezwXn14kl8/MZxAMdHi6ULw6VbqlqSeKU=;
 b=qs/Ge3JjWEOjpNCGajVEc01JDNW/dLW/4zYmQOKRGWS8S8eLmM+LQlDDY9Kjp9h+fLQjVBbrw4kMr8B6zSIiciIWwYK0UYnxinbB7hXHGT++7FjDzpQ2PUrzCDOZ6EOBK4whWkV0VAl9YklyRi5pkNcBHm1L09iWePsqI4vVgQsMCw80er+nENErVYBXKQ7jbUbnuxC205pvjYgeBKx5ssJ62F9u5wig6a5mbIjfhVvx0BLfLa+50InC3K6gbc1Kjek2yUdqSXSpu5Arg886wKGD4B6thSP1cyVmwU9bbSZE+C2N1a6Pr69rygWWmAY0I4LaxpY2itxpDpcnYjJVzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <151a70b0-fcb6-9b0f-7834-d2cc15b5d9b0@suse.com>
Date: Thu, 26 Jan 2023 17:48:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
 <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
 <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
 <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com>
 <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
 <cfffcf15-c2fa-6529-d1ff-a71a7571bfe2@suse.com>
 <CABfawhm_b=MskQN_zZsuKz0FDtZzZNvBMa8bXtxxUZU9rXbUCA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhm_b=MskQN_zZsuKz0FDtZzZNvBMa8bXtxxUZU9rXbUCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 43662b3f-a9f0-4930-687e-08daffbd1d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KX/7Nmaa8hLkIDnzvBmN5wMZObUGyNILIXPrf5v7w0ZmEiR/DfmF+6Wz98x/F9ixgEt/UwGLk5sl7DcdJ0ZNBw7KWjGXvm56mu5wEarHEiRumf9k5qEM33FfhAILrI9paUzifeXx294XcJCcHgnf5fMRQ+5NgP/ZTlpDbRO/+qE2RXbmIn9xSKYi4xG4ujFA3hZnDXdfTLrdpDIphyAgBQOiOYE3CxUgymwUxgWZ/fhoq10WsLYmPhlPqwqdqHC2U1E9xGDnDl9Z2YGBHES9UG43vePSqDmuKqwLPbRKt77tGZvRSw98PKxyVTgIM5nNvU0fkpMXicSYHEKDebYPM4Ra6Fu8dAI+DLQbchbuvA0oZPPbsBchkKci8Xyq2K8XMq7om6/D2R6vht+RVWyTbi0g4tyJqHVYzAS4iKBrOft9oPm5cCF02z66GW4FnPcKnUvWQ/pGegTJ8ZA2psWo6pJb91+t2xotgbD8lvFufK8NyGmr20NNjBJJ5MhqSfphJJbBUvmfrlRvqpmE+qIZN944Wz5b9WsKUzmVIN1nvgUz5deOzOjZisCYhyU9wmM9DOmrje3LvU/lsD6FuQl7lGHvDv67QDmsMmpc6zc0e4VuiNHIMIA8ocDDsaQ2ID3xeLTB547nVm72nkh1IEHJ4orJV8L3PXq8/zLfAw+cU8cDTqYgu2nR8Ql3Ld2JByQPwUDS6jBcBdPp3cu64nmC5uwTUPBZk95ljcVgtB7GEzc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199018)(36756003)(38100700002)(31686004)(26005)(186003)(8936002)(86362001)(6506007)(53546011)(6512007)(2906002)(41300700001)(66946007)(5660300002)(83380400001)(66556008)(316002)(478600001)(8676002)(6916009)(6486002)(66476007)(31696002)(2616005)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS84R3NaSnZKUWZqdlB5U1lDWkFvRkt2dVN1eHo1UjRhVk5NSlRpUitIbnlV?=
 =?utf-8?B?OE9kQ3NDT1pmNjFKNmFPYVNWV0VDV3VFVHovRnFtOVpON0NxaGwvdzYyM0d6?=
 =?utf-8?B?WmdXN1p0UnJXWVMwYlRxcUhMMjRCcHh5RzdWc2xZMFoyZnpYc3ZTVjdXWlll?=
 =?utf-8?B?UTArcHdrTWNabzloZDNXRWd2VHVRVTI5MENhMTBrTlNxV1dNWWNBSEhXeTZw?=
 =?utf-8?B?MVBPZ3duWmV4VEJVNGdCUWRiTXhKZUx4TnBMSmhzc3Fqc1dvRTRuUlVqT2lC?=
 =?utf-8?B?azh1SnhIYmRqWElvWm93cXNPZG5Za2I1eVc4T3lSaExvVTFtb3c2U21hdjlQ?=
 =?utf-8?B?UWtGdENjN2hNL1RNSXF4NVAyK3RlVDJPdGo2KzgxOFE3dFZLMWlmaWtQaEhC?=
 =?utf-8?B?S1hYdi8zc1dyV2NSWFNsV2E4NkN4VHpNUFh1N2xlUFdHK0hLYlVYMlErV3RK?=
 =?utf-8?B?MU5BdXVEUTc2Y2xoQWFpNTJ3WS9YWjhxRUZhYS9DZWptRXBvaU9XZVliM3hp?=
 =?utf-8?B?ZDJ3R0VoWU81bm5mRWU1UHZuUG9JYWNxZlU5T01MM0M3dkFSWllHTkdRdnVB?=
 =?utf-8?B?UWphVnJXcFN6bmk5ejl0cTJVaEhjbUxRa29YZTY2ODgvNjI1VHB4cVBRZmp5?=
 =?utf-8?B?MmQvVjc0ejBYMXJMbFZsK1RlY2IvdnBJeWx6a2ExeVdlODBtZUkvUTAxdlIx?=
 =?utf-8?B?Qkg3Zlp6Qk5XRGRZam9BOWV1SkliSVRKR1FtZ1BTZVY2bHlocXduNks4RklK?=
 =?utf-8?B?S3ZLdm5zbk5qdDNxSkowUkwxQUFYOEtpVFp6T1BLaFg2UDVuT1hQQnBxeU82?=
 =?utf-8?B?eFJRallnRkRlUzExaE82em8yeWRzUnJKb05XdUhGYUNaR2xYNDNlVjEyMUJa?=
 =?utf-8?B?TitFNjdWMjBHZVZCaVZiVkRVVDY5enpFUUE2aVREa0pQNTlKWk44TStMV2hO?=
 =?utf-8?B?cFlwN09DK0g5c1hHaHI1bDdPeEROcVMrZGsvVzJxQ0IxTHRaeUtzQUEwWjNK?=
 =?utf-8?B?YzNvMTVnNjJzYVJ2L01yck9wZUVTK0JYeVYySzRtSDFaYnJ0aEZKQlpsZGIz?=
 =?utf-8?B?NHdVazVZd3BJWVhnNTRvSXV0NDZjM2YvaVNaa2xkMkx6QTA5MDJTTkdGTzRS?=
 =?utf-8?B?MHVIWm5KdHhVb2dJeEJEUjlkNHdLMVZTeXc3dXFXUG5kLzJNQW5tc1RDQUpr?=
 =?utf-8?B?RlEwcnBiRXdmNCszbWRrK2dxWlJYMVJSV2xteDdNS05tSmh1MUNPUG83WHRF?=
 =?utf-8?B?U0xMOHA3WnZwcnZPSlpab0d0dVQ5bUxwdkhoOWpXZUxkdExjVHpQaDlaUkpI?=
 =?utf-8?B?YUtoMGhhOURGMm9Ibys3Qm9KbU1GZW94a3dUakJGa2cwVEl6YWVYZDN5eFFi?=
 =?utf-8?B?c0R0cnoxeDVOeDlXZDNZS00wcDBSOVdwUHRXYmVRUnBKcHdkWmN6NUhkVDhr?=
 =?utf-8?B?dUZjTmVLM0J2eWdpcnd0bzd2Zi94RW1QdW9jOW1MM2xyRFdhcWVqMEtPTEl1?=
 =?utf-8?B?TTZhK09GUGxuTVFudFgrVkJyZ1FlT0s5YW5EeEQyd1l6UC9EdEV3Tkw5L3Yr?=
 =?utf-8?B?YTB0dUJmVlA4eW9Na2dEQlJ1YjJ6R0V3SUtQcDlxOHR6YzlCSHhSWXpTRUli?=
 =?utf-8?B?OWxrazNhU1gyRWpXZmcyeERTRG9SY1VYNnRmMDZqdHFZUURpT3FIY0xRU1FH?=
 =?utf-8?B?SmZPZS9ZK2tpSTRIZUFzTHIyY1dHRUdWaFU3cXdoSTFoaVl1YXo1WjhKMy92?=
 =?utf-8?B?cUEwOGlSMGVBNFVGMFJqY1l6K3hoY2JJNzZaMDk4cVpXTk94dzArVTRZTVVy?=
 =?utf-8?B?bzZBaGdMei9hSzZpUzVrTmxEQnFJcW5icVdKNEE1NnhVVDB0cXRsZUN0TmxE?=
 =?utf-8?B?L3lGYmEzMkkvK1FLcjl5VmZ5RVE2aFN1QXRQem4rS2tIbUUwQ1d1Q01rWnpZ?=
 =?utf-8?B?S1RNbWdGc0ludzlSQ0lqT0xLVDRsWkhCMzY0V0h2UkRLRllKUGxDNzRaOFBL?=
 =?utf-8?B?SnhHV29pMnV3bm1ydmUrdkx3RnBRMkQ1UVJPajRlY3IvaThpLzlaUG5ucGxC?=
 =?utf-8?B?SWFyeVNYODl3K1luZFRhZ1IwWXRNa05OMkNQaXdsMFowQ0Qrc1JiYzBQWUZp?=
 =?utf-8?Q?xE/dUYBsDv1jeJz/jabjbLpzW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43662b3f-a9f0-4930-687e-08daffbd1d95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 16:48:13.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtHNiyfndP5orjGZnWB0it0bwXjYvBiwalVHiPjUxPPzQ8trzn5nLkONh3TlBESl1yx3Bcz1mIx78RgQshtfDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7861

On 26.01.2023 16:41, Tamas K Lengyel wrote:
> On Thu, Jan 26, 2023 at 3:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.01.2023 16:34, Tamas K Lengyel wrote:
>>> On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 23.01.2023 19:32, Tamas K Lengyel wrote:
>>>>> On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com>
> wrote:
>>>>>> On 23.01.2023 17:09, Tamas K Lengyel wrote:
>>>>>>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com>
> wrote:
>>>>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>>>>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
>>>>>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>>>>>>  }
>>>>>>>>
>>>>>>>> +static int copy_guest_area(struct guest_area *cd_area,
>>>>>>>> +                           const struct guest_area *d_area,
>>>>>>>> +                           struct vcpu *cd_vcpu,
>>>>>>>> +                           const struct domain *d)
>>>>>>>> +{
>>>>>>>> +    mfn_t d_mfn, cd_mfn;
>>>>>>>> +
>>>>>>>> +    if ( !d_area->pg )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    d_mfn = page_to_mfn(d_area->pg);
>>>>>>>> +
>>>>>>>> +    /* Allocate & map a page for the area if it hasn't been
> already.
>>>>> */
>>>>>>>> +    if ( !cd_area->pg )
>>>>>>>> +    {
>>>>>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>>>>>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>>>>>>>> +        p2m_type_t p2mt;
>>>>>>>> +        p2m_access_t p2ma;
>>>>>>>> +        unsigned int offset;
>>>>>>>> +        int ret;
>>>>>>>> +
>>>>>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
>>>>> NULL);
>>>>>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>>>>>>>> +        {
>>>>>>>> +            struct page_info *pg =
>>> alloc_domheap_page(cd_vcpu->domain,
>>>>>>> 0);
>>>>>>>> +
>>>>>>>> +            if ( !pg )
>>>>>>>> +                return -ENOMEM;
>>>>>>>> +
>>>>>>>> +            cd_mfn = page_to_mfn(pg);
>>>>>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>>>>>>>> +
>>>>>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
>>>>>>> p2m_ram_rw,
>>>>>>>> +                                 p2m->default_access, -1);
>>>>>>>> +            if ( ret )
>>>>>>>> +                return ret;
>>>>>>>> +        }
>>>>>>>> +        else if ( p2mt != p2m_ram_rw )
>>>>>>>> +            return -EBUSY;
>>>>>>>> +
>>>>>>>> +        /*
>>>>>>>> +         * Simply specify the entire range up to the end of the
>>> page.
>>>>>>> All the
>>>>>>>> +         * function uses it for is a check for not crossing page
>>>>>>> boundaries.
>>>>>>>> +         */
>>>>>>>> +        offset = PAGE_OFFSET(d_area->map);
>>>>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>>>>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
>>>>>>>> +        if ( ret )
>>>>>>>> +            return ret;
>>>>>>>> +    }
>>>>>>>> +    else
>>>>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
>>>>>>>
>>>>>>> Everything to this point seems to be non mem-sharing/forking
> related.
>>>>> Could
>>>>>>> these live somewhere else? There must be some other place where
>>>>> allocating
>>>>>>> these areas happens already for non-fork VMs so it would make sense
> to
>>>>> just
>>>>>>> refactor that code to be callable from here.
>>>>>>
>>>>>> It is the "copy" aspect with makes this mem-sharing (or really fork)
>>>>>> specific. Plus in the end this is no different from what you have
>>>>>> there right now for copying the vCPU info area. In the final patch
>>>>>> that other code gets removed by re-using the code here.
>>>>>
>>>>> Yes, the copy part is fork-specific. Arguably if there was a way to do
>>> the
>>>>> allocation of the page for vcpu_info I would prefer that being
>>> elsewhere,
>>>>> but while the only requirement is allocate-page and copy from parent
>>> I'm OK
>>>>> with that logic being in here because it's really straight forward.
> But
>>> now
>>>>> you also do extra sanity checks here which are harder to comprehend in
>>> this
>>>>> context alone.
>>>>
>>>> What sanity checks are you talking about (also below, where you claim
>>>> map_guest_area() would be used only to sanity check)?
>>>
>>> Did I misread your comment above "All the function uses it for is a
> check
>>> for not crossing page boundaries"? That sounds to me like a simple
> sanity
>>> check, unclear why it matters though and why only for forks.
>>
>> The comment is about the function's use of the range it is being passed.
>> It doesn't say in any way that the function is doing only sanity checking.
>> If the comment wording is ambiguous or unclear, I'm happy to take
>> improvement suggestions.
> 
> Yes, please do, it definitely was confusing while reviewing the patch.

I'm sorry, but what does "please do" mean when I asked for improvement
suggestions? I continue to think the comment is quite clear as is, so
if anything needs adjusting, I'd need to know pretty precisely what it
is that needs adding and/or re-writing. I can't, after all, guess what
your misunderstanding resulted from.

Jan

