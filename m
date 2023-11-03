Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDAD7E04A1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 15:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627176.978074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyv7B-0005Lt-Rx; Fri, 03 Nov 2023 14:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627176.978074; Fri, 03 Nov 2023 14:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyv7B-0005JP-Of; Fri, 03 Nov 2023 14:25:37 +0000
Received: by outflank-mailman (input) for mailman id 627176;
 Fri, 03 Nov 2023 14:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zopV=GQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyv7A-0005JH-4n
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 14:25:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c0e4a0-7a54-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 15:25:34 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7120.eurprd04.prod.outlook.com (2603:10a6:800:124::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 14:25:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Fri, 3 Nov 2023
 14:25:32 +0000
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
X-Inumbo-ID: d9c0e4a0-7a54-11ee-98d8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa+NptrlU20MtQC6rfkC601ssInUObVffj6tC7iKTi4b21+anX3kjx7CMyvp/Z0WrSj8DC5Cqc5dmCikitJoVzrlNPcUlwMMUSJT5wYybwV+dtERoTzgZ8nunBEvTQ1RozWIN65U9pMMHsNxGyOaOOqzzGS1upSAlBqug2uWfchxTgYBblbp/3dRctBKf7u3/uUyo2w6qOOKEpxIL05J3Mj8AiqcecJrEgBfmUE5d51XUuzZSQmWgQxQXSohcGRg0yn0lNlfOf/MlMxnKQWOovVZHEWKLFUn6udFJGer92rokZUEgajpxWWEMNzSeaSOfG0KULQPuZZzEzWTrRwVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3X8e0fu4vthgi4zigQbWNAthBBLrp+q2J+crtzxxaA=;
 b=DOKICPZwZ7w/cScfN8AgMOsXtUwR9uYs+Y3GHcgOQcmyNM43OYGHoPwIo55KtF310JBGsrEEXY75jZoKKgzNA9nL0oa3RgHxGqbSJzTAWiTWipHg6ahtW8/SYNGDCgXsW38ZTEfPLGeNHOEjqht7Xdvcu6FSAc9gGrzkpsJI1A27OJ27m8p/4EnJmT+37RfnWSwAiS35CGAV9e1fHbv8bglnzPHFLlx58mr4oJ9VBIHsXuYZFCb2CelneV07riDjCGtIoCFHdiEy4EHBnbzclVqnyS6MLAuxwYi6yw8jKfPTI/Pr/kZweet1ab1jZPaoW3J65ATp8YgLjlP4de6nTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3X8e0fu4vthgi4zigQbWNAthBBLrp+q2J+crtzxxaA=;
 b=rH3RvjsjpPLLetS3RBnPx4BSLYfrsk6pG+BbtXe8eCvLrQgVQrt/injjx/FU1GkzVHCtO9vNP7Vp8NfTz4TNEBS9TIjBCLqwgipaavVcwd+IZ3O1zrwngXIGZJkodx7Jx/P9MS1nVCQAjs1j1XCACWnFYfiAnrkPdDbcG1aVUDguri7axo3goJEDwf7CfNQVO3O/XiXL55v2DKpQACVy8MEuSxPP1oiZcLVLSvkMRU95Lh8cY7dpbe748ANQDtlf7yOiejtiBj6o2UKMzFfFpZFoN0P4ZD6r44aXJXQ+OWRmXkvs56MDrNaGn4RbXaI2EMJ9eFJE0Zz9MvhwSIOx8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bca91593-f822-3f73-9390-a0be751241e5@suse.com>
Date: Fri, 3 Nov 2023 15:25:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231031145259.77199-1-roger.pau@citrix.com>
 <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com> <ZUTsCjVYXQzJVVJi@macbook>
 <869b790e-91c1-f416-585e-2c14eb4a5087@suse.com> <ZUT4nig3QbIodRwV@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZUT4nig3QbIodRwV@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: afb8d5d6-83b4-4bfd-a6ce-08dbdc78bccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+DkslFZZoHh1KYyRw2EYBujSXxIEVA2he6UYLaL79jr2ma59a7Bean2HFXHfIQjHQpZX8oUfii4C2SRI2iPFQ52Ht67tXE9cRsIrNsSEhMqqBM2rV1IiORzIaMT1QrlI4OsVCS5o8qkvzbr6ElHM0GZycsp+h2PHuvZkzQVYbCfDS/8c1tVJqRDKH0KBDSDrsnOcK7uFT/RgbfNerSO5Zw7JJPYddMa52n6gGr93zxdBuwccoZzQ6OdmolUI4qwCPgH6rJIEibyY3ewHJunKfBbwsrW+At5Le0ydLDVNTJH+bocNeAEs7XwrkKiIJHZd46rZKpdwTPMAJjPtlOURPYuZTmEczUZ1ZNU5Hr4YvLbY3cRnuDhUVr4A2ehDh0Qz2ziqpQyZTeIzfSFrfv3cDAKr/a215/SB2ZK1X2+Cf146oLZW1o/OnLnHlcKueM73Scix+plTkCOpphmKoY75kN5uI/oTF+yzl/BvV7Bm6j43BtpHclqUwoVsKsweyJdRbK94lTDyx3r/ctkNIM4dF5e7Rw7H6fwy2kmQASwIWvrHBvahWRvl3wCuFjeVYwOHRBjwFE/jMwBbPXICvUGftnRQo/wTRvPQrl0kR3yMuOuKWxLqFPjJYqSjJ/ZkNXBJf6t57m9gXOGgsnhcg0eZ3pzZKhK/QISsqQQS1C6ZD3wCyNI6BsrOhB0yDPGLsyX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(2616005)(26005)(478600001)(6512007)(53546011)(6486002)(6506007)(316002)(66556008)(8936002)(6916009)(5660300002)(6666004)(41300700001)(66946007)(4326008)(54906003)(2906002)(66476007)(8676002)(38100700002)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlRreHNHTlk3TytkSjc5N3dOVjJ5WlVIQWpKUDM2c3pvN0gveVowOHlJNE56?=
 =?utf-8?B?b1ZjR1Bwd2JSaGtpZ2FZOEFhWmp4cmp4TkRuTjdmQWIxZ3pRUG5qK2xtSXN3?=
 =?utf-8?B?bHo1R0g5TjFDZTV2L2EzaTBoT2ozU1NrR0lTNUxYc3J0d1NNbTFDUTJHMG4y?=
 =?utf-8?B?QWFJL3dqOHBWbkFEWG5hWmI4UkZTTTVjNEF1NHVlcmlOWEhGSkRhYTZoWXNz?=
 =?utf-8?B?b2QyVTRDUzRxM0RQZmRiWWZxRmFvU1FVSm12VDBoUEZtWm1Vc2NKOUVnT3F0?=
 =?utf-8?B?UzdJL0tPak8vRDllQnc3UDdKMytQQUlycWJXNEZuSGpVdkRUS3ozQXgwWFdT?=
 =?utf-8?B?NXpjUWZvRHBoYlAzUldhR0ZWd20xZEtEZUZwRDczYi91eENLclpxUzVJa04z?=
 =?utf-8?B?WFFPTENONEU4cUZaVDJQSjN3Y1FNbEIwdHhhRTNLMTFkYVBxZndUY2t5QTYv?=
 =?utf-8?B?a255U2RZTUNCUFg5NlZYNXpxTVBjNmVxMmRwdGlkR0t1a0l1Vzd1a1F2K3VK?=
 =?utf-8?B?bVJnYjhuNWxRNU04dWx6a0Q5ZlJBMzJyK1crOVBsc0pWS3JrOW5Eb01nT29G?=
 =?utf-8?B?NThndXNack11UjJXb2dwTHkra01PamVCbEU2QXJhWE40elZuOUJ3TFM2UTVu?=
 =?utf-8?B?c203Qms0YXBBdVlZY3JhbEdNaWhPRVkxMUF3M2h5cER5ZzQ1U1k0d0NKekpQ?=
 =?utf-8?B?bE9iODVpRjFDRXZOVTZEd0F5aWJSTmoyM3JaKy9ETzFZUWVRcWRlZ2ZQMGZ5?=
 =?utf-8?B?M0RWTnRiaFJNSS9TNElQWWxKZmkwQTVEZm9yeWpTTVUxWndTam1IZytjVkQ2?=
 =?utf-8?B?YmY0WlFuYXFBZU1ySlFlaGIrK1ZjeW43Yk1rMFh6alRDMWpMbXRabU1aMGF0?=
 =?utf-8?B?ajFhdHFIN2ZlM2FXOFE4T1F6UVRwQkJ4RWZPbVJPWm45VUpCbVVMNnNTRUtq?=
 =?utf-8?B?RWRwNGM2Q1huN3NYSitHclJNV0FEVUIrZ3FGMk4zclhyRHk0Ylh4dTJRcE9h?=
 =?utf-8?B?dEF5bWdXc0VBTVh4NGZPM1NOMDVZVWFHdkVvWHpRaCt4NjVJSUJORlZHVjBN?=
 =?utf-8?B?aFdPZysvSkk4RU5sZWp2V1Z3ZkJVMEVTMlhMcDRTTmNxamF2WXpBRG96TEpK?=
 =?utf-8?B?M05EOE9VWUd3TzhRYXZTVTBJN2dGcGFVbFpkdWtzWWtnK2NsN2VOWG5yK2lx?=
 =?utf-8?B?RVNqaUJDNU9KMzYxL1FQSXF0VTdsV015Sjd4NlByUHRJWHJLN3p1UFdMbDdK?=
 =?utf-8?B?WXlNZmRaT0VmTW0zdHh5Tkl2TGJxR1lBWDdFUmN4VGNBMjlUM01sMTFvRC9B?=
 =?utf-8?B?K1FZbkZneTlXM2dRSENJQlNiMzFhV1lZOGdCaTBIWGRHL0V6S0EvNDJOc0p4?=
 =?utf-8?B?WjViR0FvbFQ4UW9xZWFwWVp2T05xdW1RWTRvZHhlcXRHVTF4N1R2QlhwNldi?=
 =?utf-8?B?RjYxUWNRa2FWVThraWdXZlU5cXdpRDhzaVJDOUdEV3ZRRWk2TVphVXI1SDh5?=
 =?utf-8?B?bFNzYWtUa05ZeGpoNDlFSWRnZ0hHZkNZK21JS1hzU1FvVlNlVG5kV003SUdr?=
 =?utf-8?B?aVlsbmphMjR3Q2JBMUwvUG9oSm5zVW5vQjlCME0vdlZEVmhOSVdveGZ3VWJX?=
 =?utf-8?B?NXdGOVRxd0hHemh1Wlc5Nk9uS3Zzd1FKMEdxWFA4ZkxZMy9zUlB4OE93Mkl0?=
 =?utf-8?B?TEhWYk9UWUtEbGFocWJPSnJBMHRYZC9LaHVJaGdyMUdENzh3ZTVvUXFmSFMz?=
 =?utf-8?B?bndVZVFpWlhTR1Q5SFlqQ24zOFd2eVJFY0JabWp0UUZvQmREcmlERlVnTUQ1?=
 =?utf-8?B?RFkwRHdESCtvc0dLUmttTWJDbXlydjN3VzhyWURKci9jTlpoN2pBY044blg3?=
 =?utf-8?B?elJCUmJqY2trWVBRR3ZsN1hDQmxlUE9ZMUpoYkk0VkxpeDZvUVhZcnZySEdC?=
 =?utf-8?B?dVcvRXRSbWNFQXNOVU10ZFR5SHVaVGVLYnlnMC9JdVNnNzBuNyt3M29VQVJ1?=
 =?utf-8?B?TVNTeWxFRWE1c0UyMFhmRjJVeDR4V1NrNjF0Z3ZQM1hqTEhGMEg5U1VYVXE2?=
 =?utf-8?B?QmRzcmJHSTZKd1lrT08rTUJ3eU43SVVQWU8vakVsUGRjVFlqMmlqZFA3S0dK?=
 =?utf-8?Q?5XP5H2Ivlu9L6it/3NMt6nb3p?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb8d5d6-83b4-4bfd-a6ce-08dbdc78bccf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 14:25:32.5982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frKDA4bCItGEwTO9vNvUFCoOYjKArVX9tpHeb+puZ84DJPV3xfjPfGxZyffEarmEiXVX95Fo3k3aQkstn3NMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7120

On 03.11.2023 14:41, Roger Pau Monné wrote:
> On Fri, Nov 03, 2023 at 01:51:13PM +0100, Jan Beulich wrote:
>> On 03.11.2023 13:48, Roger Pau Monné wrote:
>>> On Thu, Nov 02, 2023 at 02:38:09PM +0100, Jan Beulich wrote:
>>>> On 31.10.2023 15:52, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/genapic/x2apic.c
>>>>> +++ b/xen/arch/x86/genapic/x2apic.c
>>>>> @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
>>>>>      .send_IPI_self = send_IPI_self_x2apic
>>>>>  };
>>>>>  
>>>>> +/*
>>>>> + * Mixed x2APIC mode: use physical for external (device) interrupts, and
>>>>> + * cluster for inter processor interrupts.  Such mode has the benefits of not
>>>>> + * sharing the vector space with all CPUs on the cluster, while still allowing
>>>>> + * IPIs to be more efficiently delivered by not having to perform an ICR write
>>>>> + * for each target CPU.
>>>>> + */
>>>>> +static const struct genapic __initconstrel apic_x2apic_mixed = {
>>>>> +    APIC_INIT("x2apic_mixed", NULL),
>>>>> +    /*
>>>>> +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
>>>>> +     * exclusively used by external interrupts and hence are set to use
>>>>> +     * Physical destination mode handlers.
>>>>> +     */
>>>>> +    .int_delivery_mode = dest_Fixed,
>>>>> +    .int_dest_mode = 0 /* physical delivery */,
>>>>> +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
>>>>> +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>>> +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>>>> +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
>>>>> +    .send_IPI_self = send_IPI_self_x2apic
>>>>> +};
>>>>
>>>> I'm afraid the comment is still misleading in one respect: The .init_apic_ldr
>>>> hook is also set to its Clustered mode handler (and validly so). As before my
>>>> suggestion would be to leverage that we're using dedicated initializers here
>>>> and have a Physical mode portion and a Clustered mode one, each clarifying in
>>>> a brief leading comment where/how the handlers are used.
>>>
>>> I've split this as:
>>>
>>> /*
>>>  * Mixed x2APIC mode: use physical for external (device) interrupts, and
>>>  * cluster for inter processor interrupts.  Such mode has the benefits of not
>>>  * sharing the vector space with all CPUs on the cluster, while still allowing
>>>  * IPIs to be more efficiently delivered by not having to perform an ICR write
>>>  * for each target CPU.
>>>  */
>>> static const struct genapic __initconstrel apic_x2apic_mixed = {
>>>     APIC_INIT("x2apic_mixed", NULL),
>>>     /*
>>>      * The following fields are exclusively used by external interrupts and
>>>      * hence are set to use Physical destination mode handlers.
>>>      */
>>>     .int_delivery_mode = dest_Fixed,
>>>     .int_dest_mode = 0 /* physical delivery */,
>>>     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>>>     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
>>>     /*
>>>      * The following fields are exclusively used by IPIs and hence are set to
>>>      * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
>>>      * is not used by IPIs,
>>
>> Not quite correct, I think: This is setting up the receive side of the IPIs
>> (iirc LDR needs to be set for logical delivery mode to be usable). Beyond
>> that lgtm, fwiw.
> 
> No, LDR is read-only in x2APIC mode (it's rw in xAPIC mode).
> init_apic_ldr_x2apic_cluster() just reads LDR, but doesn't set it.

Oh, right, silly me. Perhaps the function could have a better name
(reflecting its purpose, and making more clear that the hook is merely
leveraged for the purpose).

Jan

