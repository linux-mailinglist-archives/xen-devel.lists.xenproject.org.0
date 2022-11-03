Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A98617EE2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 15:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436605.690692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqaqM-0006Vo-Tp; Thu, 03 Nov 2022 14:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436605.690692; Thu, 03 Nov 2022 14:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqaqM-0006SM-Qf; Thu, 03 Nov 2022 14:05:18 +0000
Received: by outflank-mailman (input) for mailman id 436605;
 Thu, 03 Nov 2022 14:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqaqL-0006SE-PR
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 14:05:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ae78492-5b80-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 15:05:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9571.eurprd04.prod.outlook.com (2603:10a6:102:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 14:05:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 14:05:14 +0000
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
X-Inumbo-ID: 8ae78492-5b80-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH/vPbu8IVqZ4zCBGdazgriZRhb1P2BO4wissWKSghj7NAgzN9LcZ2AJY/Ak+pnBahUFYHA5sw9kBdZx/lkf2QNX0tb9T7KuzbXIyIMfGEYY9yx2duhW4wGqqhB5A/Y23hwmnV8i1HZpiYWip5KTUCpVb3xkO+uw1wdtLGoij/nPj5Trr3/B6KnzKRTqJj/oeuF+fI4eP7XeLIFWBUaXQ/dkCxDE1kdt1podPjc2uFBDobteviQj2gFOLbUX6qYglztpjafGWSpCz1vpUrADpan9bm+ifTEnydK38r93zKk8g/GpziO+1esyjJWeC2GzY6+D3F5xzpzVtuSPyeX52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMyWF/gwKvnIWN63Enwct1+di2aHXK1Zxpo0YArVQjA=;
 b=U0w0lBZM+iESlLAAoJpeYEdhj/yDz8inDOqZWJR99tYrCtG1FWeZm6rCAjlPis+/Wg7ChzxBEPUSK1FYJWJbTD68wfzyHwNoHjtHLCTK0r5GpeSREg1aGOCstqRgg0DMiDAo2FdMrxVGxWAb1LYb0mg8mR5rExiSsvZtJgZHOLAb82vEqdORmoJLWAH446xs2loMqy4kUbIKTWQAZnkqdGwYD0JiAARjI6dnzkMkNT2Ljwb7kXoITDrDObHRCiOrrfweY34pb5+T2KnLFEABotYbRznVY5zca2omSj8GaEkk+t+jbTg5bvTz4EqgtzajXyvu2JPXsBI3xd+NW0coKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMyWF/gwKvnIWN63Enwct1+di2aHXK1Zxpo0YArVQjA=;
 b=q2OVZSsD7ZIMUl+RF2iCAW648L2eRWs0g5nxLuhbPgoovcCOHmnRQqOL9j7sYV7xB4EqYSJMkJeQEdJsT18ycMcChnY5HFuTymk2ICRYpapf5p0RHSHbMbsoGBqd22OFPb+/OLhoAzPAw8tDfWbmF7XOIFImqnitC/y3LBUvjOBKYeyZ1DGF/1tN3Js44TNqM9D4vdQ4ilhaO5xwaMJcwITQS24+YwzpO3aIC0XBVHBtiXvP6EGnTOKRnbg3RQMKDB6et+GB+q2W8E/zeD9wXky1klcBqkYx7h4J8Td8IduhsE4yzfQZ98ovueNwssWsQoHL20mV0e+q4I0Z8TsKIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c40eea6-f167-6196-ac35-4c0044bf2cff@suse.com>
Date: Thu, 3 Nov 2022 15:05:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2.1 2/3] amd/virt_ssbd: set SSBD at vCPU context
 switch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221028114913.88921-3-roger.pau@citrix.com>
 <20221029131258.95811-1-roger.pau@citrix.com>
 <198d04be-e7f2-dc11-18b7-ef3352d07b80@suse.com>
 <Y2KrF+0ns174JC7S@Air-de-Roger>
 <20869a2c-224e-698a-b927-96d6ad752b9a@suse.com>
 <Y2OBRg0cpVkgu1iP@Air-de-Roger>
 <37c145b3-9667-200d-c13b-912f3d9b8a0f@suse.com>
 <Y2OZn7GvnfMt/r0Y@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2OZn7GvnfMt/r0Y@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: dec04ab4-1964-44e2-b0ad-08dabda46da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tdIPT1DMb7N3kGa+HoELH/v7/6czAbC+Y9FKhCuOcOltTMPQ6AJg2EwEBjae4ttlGxtM7wAGdQ+XqVg4XpQfA1sryGcGHSXLYbi6FroXZoLssjr6mThrzdP6RQOuISgjNbVesoDERE4TWRgU2r+Kl4Sil5RLofox74dxPsbRhEBPDt0j2AKSOfOWIkuaVwXRwWLQphoKVJABL3K2EFBnBqsSYUhbNMtpaLDQt5KGSAfLTYN4EEZLI0yClBWKDQstbRGeA38sgikNJEwKhaoDLXsxsro6IQOpzFA8L4OQ7t7oTEcmIKIXOU5IArFzidw/NWwtJLw1FCgyb+cCACRSTaLy6Gq80iLeNWhQ1POAu7JVrufZmFvv0tatqH0KKMNDChxNuf/WJDBiNAKrv7EYI7ItERAOKouApgQMjUfQDvtaPsV9AcIGFTd+9rPtslXh+jORT2T0HiE1Ztldmq1h5Dq83Zm80xbWLk7iSMpOKTUTpGt6hOu/lCqPpy9Kr9fHEaPJ3flys4NMWLrIvg20Gf4Zb4p1zV5wbm+lALiNfLc7Sk0h1h7gLphBrCGEHcAyyAc813eREMcEEhRxp2kNljQpJ3EVDPU+Hi1rsWhsY/us1lrBYqBGt7GHzdOOSnWcjVggiaGyh8V3GZyrcOF0zpx0CwNWbILyNd6t4Hco0mZut7y1kw7gYObsgGhBZL/EuKmz9wDxh68dqud53Ju76ev6OeFAf/btndnq2p4YaY7j1TjRBXui3o54Wchh3xTAcH2V5sUW9fWJCBgnejga/muKz74M24x5ppq9RMevXD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(2906002)(66899015)(36756003)(5660300002)(38100700002)(8676002)(8936002)(66946007)(4326008)(66556008)(66476007)(54906003)(41300700001)(6486002)(6916009)(83380400001)(6506007)(86362001)(31696002)(31686004)(26005)(2616005)(53546011)(186003)(478600001)(6512007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0MyM3g1ckhpenJ4MHlUN2dHTDc5aDk4TzBEOVlONWVqR0NtRlM1ejdid3pF?=
 =?utf-8?B?R1IyZ2M2RGxuSVlFT2JpQWVqRzMrYWFUcHhiQkRTZldSMHZrNzh2djNTNzlV?=
 =?utf-8?B?Y1lVVGE0aWF5TTRLUDBWSzRQaGRRSEc1cnpFWWhzY2ExQ2NwT1hQMlArai9O?=
 =?utf-8?B?aUFUVFNlaEQramVZeWV6MlpOK0dmNDBSd2NMNGdVSWxZMFl3MnJsbDZiUmEz?=
 =?utf-8?B?bTNpS09FR3grRXcwTE9UdkZLa1NHS1Z6VWJVQmJSSS91cmtvQi9LL1NwdW1G?=
 =?utf-8?B?c0FHMXo3RVpEazUwRTQxdXdMdkVONUpjOTZVQWlBUEFkOEpmL2lqQnJYNUYw?=
 =?utf-8?B?MUJ2eXhma1ZhbW12Vk84ODFXVXhKajZ3QVFBdzBEZVhsZ2dMOG0vQjBZSk1a?=
 =?utf-8?B?VUdnWi9Dem0vbC80ckMzMjY4bFBWbjIrRmR5c0NaaEhCblZnYnZwWVpTM3dl?=
 =?utf-8?B?bVczdzRJRG0ybXhORjZpQzk2djNVT1d4cURLZlZJbG50ZkJVUXEzMjFkem1a?=
 =?utf-8?B?TDRyeDJKMjUvWGVhYWpiMUdEa1d2ODNpUzlQV25acGVxZXg4MFBYd2F2Wlpv?=
 =?utf-8?B?a0R2OTFGT2tJenFXZ3lQL09FOGZXZGNybjRmc3NFREhxdm5waTIydXhkaFZi?=
 =?utf-8?B?c2pqSDRxLzlFdHRtNU92T3dpVS9oWmhDakg4UDRyRDVDdzdac3Aydkx2SVZZ?=
 =?utf-8?B?RytiY2xFUElkQklKSkFMa2J6d3ZnY0xJL1A2RE0vWE9pSzFBeHkyNDI0S003?=
 =?utf-8?B?Lzh0VFcyblJrSy9wRHMvTEovUUtkd3plNDRURGhEVGVQbk55SG5odG4ramtj?=
 =?utf-8?B?enVFeml4UnE2dTNucWFrRXFVUUhPVjZQZE04bzUvek9Eemtsby9sT2dxNlNV?=
 =?utf-8?B?Q1MzV3pNcFlMMFVRenpPY2VGN2dTdVNhMFlnRnJteXBCU1FtUkNxMjcxYlJB?=
 =?utf-8?B?SEhnc1BmNGdNV2h3bXFPWDcxVDFYZ3RNSVYwQkJGMnZRbndhTXF4dWNkS0FW?=
 =?utf-8?B?ZkNtZjhKb0huY0piUUxYUjFEZ2ptZU41cTJETWl0SStMd2ViMEhSanF6TjBO?=
 =?utf-8?B?TVg1WHNGL3pRd1Q1UlZjRk1nSDlEbEphVGdNZ25CVktOM3JlM0lZRjU5bDE4?=
 =?utf-8?B?VUlzODMyelR1ZkVWNUZuek5PRHhWSzVVRE51UXpEaTJ5RTV2UzVsVmJ0d1FD?=
 =?utf-8?B?dUhVY0c3ek1ONmw5UnA3cDJNNzRuVmRIVWNtdVBpRDZ0a3RPQTNiWnF5Sk15?=
 =?utf-8?B?Mkd0c2hVNTJLTWthQnZYazkzZkxRdkc4cXlUTXdJck9Vb3llQzBSeUxmeGtP?=
 =?utf-8?B?NTVsNWRBdzhWZWlCTFdDNGF1V3JIVWlDcHRLcTgwYjJsSVZZaStGVnVJck9I?=
 =?utf-8?B?MTZ4Y2N5dnlqQ0RFUjN4SFI2NjJLOUhvODl6NUJKSTdyVlFVeUpuT21qVE1t?=
 =?utf-8?B?UkFDN3FDSUU5NUQrN0FKSldVbHRqZlFhQnQvU1RpQ1BkVmhxSXVYZ2U1OUE0?=
 =?utf-8?B?UkdvaXdZb0xORjYrVEhUNGdCNWR1TXFjeU85YkhCdzlqNyt4akhTdDd6bnBO?=
 =?utf-8?B?QnRFbTQ0Zkl1TTU2eENWYmYrUFYxaW9XMmcrMDZGMkRqUHNaOTgvbFBsV1Qz?=
 =?utf-8?B?RjlYOEViL1QxUVFTcHNIWTlyYjdWRnp1cWJ4SkdrSXhBU0FvNjVValZ5MVBR?=
 =?utf-8?B?cUh0cWZEV3ZaRkJlSi85ekFSTW0vU0xsdmtNWTI5dXVNZ1FKeVdORklkdTlJ?=
 =?utf-8?B?cEZZeWNabVpCOUhWVXViRnRBbTcxWEtxbUtjMUdVOFVTeHhScDdVSHZRNnhT?=
 =?utf-8?B?Q1NKdzVMSlhneEVMa1ZFRk9WYmZGUDZ6QzQrcFlMRkNMU2JEQTNyaEhYbFRO?=
 =?utf-8?B?SjJtQWpwSCtidGRhcHFBVmdDYWNhVXRRNnRGK1RqVWZIaEE2bnlsaU43UENP?=
 =?utf-8?B?bVpNZVNPSFNYNnM3RXpPR0xieUtuRzMxT25YQmJ4UnhGSVBtVk9Fc1BoalVq?=
 =?utf-8?B?REV1dGhLSVBmMnJnQTBJVUxQMU9ZSk5PaWJIallWTTBaanRtQ2Z1VFpYMnlP?=
 =?utf-8?B?UThBY1VIa1RsZ1FPZ0tqUk52b1QrQXh5bGRFdVNaUWlQdVVGUUFZdUdFMEVa?=
 =?utf-8?Q?7us4n9jI0dgaQCXqKc5DNJvdt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec04ab4-1964-44e2-b0ad-08dabda46da7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 14:05:13.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5sqALKJbj/YATPWDeDj5KbINWZdvU5VcYl/3e81bAipYP6Qvg3IjXQoKdON/F9TCeOpY0r3Z6T5kjjiC+//SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9571

On 03.11.2022 11:36, Roger Pau Monné wrote:
> On Thu, Nov 03, 2022 at 10:01:49AM +0100, Jan Beulich wrote:
>> On 03.11.2022 09:52, Roger Pau Monné wrote:
>>> On Thu, Nov 03, 2022 at 09:09:41AM +0100, Jan Beulich wrote:
>>>> On 02.11.2022 18:38, Roger Pau Monné wrote:
>>>>> On Wed, Nov 02, 2022 at 12:49:17PM +0100, Jan Beulich wrote:
>>>>>> On 29.10.2022 15:12, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>>>>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>>>>>> @@ -973,6 +973,16 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
>>>>>>>  
>>>>>>>      /* Resume use of ISTs now that the host TR is reinstated. */
>>>>>>>      enable_each_ist(idt_tables[cpu]);
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
>>>>>>> +     * is already cleared by svm_vmexit_spec_ctrl.
>>>>>>> +     */
>>>>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>>>>> +    {
>>>>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>>>>> +        amd_set_ssbd(false);
>>>>>>> +    }
>>>>>>>  }
>>>>>>
>>>>>> Aren't you potentially turning off SSBD here just to ...
>>>>>>
>>>>>>> @@ -1000,6 +1010,13 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>>>>>>>  
>>>>>>>      if ( cpu_has_msr_tsc_aux )
>>>>>>>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>>>>>>> +
>>>>>>> +    /* Load SSBD if set by the guest. */
>>>>>>> +    if ( v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD )
>>>>>>> +    {
>>>>>>> +        ASSERT(v->domain->arch.cpuid->extd.virt_ssbd);
>>>>>>> +        amd_set_ssbd(true);
>>>>>>> +    }
>>>>>>>  }
>>>>>>
>>>>>> ... turn it on here again? IOW wouldn't switching better be isolated to
>>>>>> just svm_ctxt_switch_to(), doing nothing if already in the intended mode?
>>>>>
>>>>> What if we switch from a HVM vCPU into a PV one?  AFAICT then
>>>>> svm_ctxt_switch_to() won't get called and we would be running the PV
>>>>> guest with the previous HVM domain SSBD selection.
>>>>
>>>> Would that be a problem? Or in other words: What is the intended behavior
>>>> for PV? PV domains can control SSBD via SPEC_CTRL (only), so all we need
>>>> to guarantee is that we respect their choice there.
>>>
>>> If the hardware only supports non-architectural way (LS_CFG) or
>>> VIRT_SPEC_CTRL to set SSBD then PV guests won't be able to change the
>>> setting inherited from a previously running HVM guest. IMO it's fine
>>> to run Xen code with the guest selection of SSBD, but carrying such
>>> selection (ie: SSBD set) across guest context switches will be a too
>>> big penalty.
>>
>> Hmm, perhaps. Question then is whether to better turn it off from
>> paravirt_ctxt_switch_to() (which would take care of the idle domain as
>> well, if we want it off there rather than considering the idle domain
>> as "Xen context"). Or, yet another option, don't use
>> *_ctxt_switch_{from,to}() at all but invoke it directly from
>> __context_switch().
> 
> I consider it fine to run the idle domain with the guest SSBD
> selection, or else switching to/from the idle domain could cause
> toggling of SSBD which is an unneeded penalty.
> 
> If there's an specific issue that needs dealing with I'm happy to
> adjust, otherwise I think the proposed approach is an acceptable
> compromise to avoid excessive toggling of SSBD when not using
> SPEC_CTRL.

Well, perhaps. What I was suggesting would further limit the toggling,
but I'm not going to insist on you going that route.

Jan

