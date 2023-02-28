Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78786A5396
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503020.775136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWu9N-0005Gh-T8; Tue, 28 Feb 2023 07:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503020.775136; Tue, 28 Feb 2023 07:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWu9N-0005E7-Pa; Tue, 28 Feb 2023 07:11:49 +0000
Received: by outflank-mailman (input) for mailman id 503020;
 Tue, 28 Feb 2023 07:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWu9M-0005E1-Fq
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:11:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28fb3299-b737-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:11:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 07:11:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 07:11:43 +0000
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
X-Inumbo-ID: 28fb3299-b737-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkzkNtcYAez02vzsJS5gMOr/VxLTwh+PzWSn+G3m7fGeZ/ipCXT4lihd7TcWzmkZf3Hx/5uAgsXyFC5d8R3brAgz4Ku4c1Q4Lgq3aXGOvJeHDXEGIWt3yyoVtal+yhZfCYAY1VWQeGCCvQXXeReDFMTGqe8bigsMjKuexETPupztFcNmGOVwf5Idx82wD1mOzQqxJTDYz8YiPeLQTrdgrsv2E84wwjUZR1Vkf0fjW+O4OYWZpyB4blwr3PGCLF/MCzZ03Ik5L+imF34Aunqn738px1B3PKjLTLcjM647ibLWFnR5CfSVK58Vjy62H6pxOd7ejPf2soWYuYL9pZZKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irgS3X6svl5E0MP5sT240RbMxpC8oY26rhK0rgNmK1w=;
 b=DYuL4mqG8iFQfJJ+p7W5Sq78ir+FShHfA21JUbuaDM61CNmS0n0fr/QAkXKoH0Wbf8xW+9KvafOvNkn/xm+5ihG+pAoflAL0/wojcWBXeFqIBPPLYpoFWQE/oxiQ7kwM+VFYAvpP6X+a8UxnCU4DNBxUKz7SBdFMdmpAzVPvIMFhG9vw6tWKy7kCVQOftK4PiDYvmLuszMVX3B6fJQX9XeMafhBkmafgtnC762pJqVbJlOV6AIjzgM6VVj0QhK+QYTPJJ+Ut56NqbCyyTbqTQ1JWNnkcO9MIVM5ZCt1rYqqVoKrvKg+cji2mcigmbsjMlegXgBuSaXDYaCLkKQn4uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irgS3X6svl5E0MP5sT240RbMxpC8oY26rhK0rgNmK1w=;
 b=FEVa1MY9x1C/feO8EgTAftX93XO5GErb42LqJg36h4PMJxB7I1uz4b28WL6Vfy+3TLxczbxWL+efRIgfJ2njMt3H3bAPVRnbfCTS1QfRvrHuD9nhU5aOd1DhYT1PXAY2GGU6bFSJ26zyPeZJ8EQV5VXhKm0o2k0ICLLvAeyp2e2ldYKNXeN+7HZIIpIrxIEXJNZF4/EV7T344OZMiKTw6J6GtTbKC830/SIbaO7sOht39mHGkBSG7PKiIykS1GA1j7SZDlOw1hThAyER2jL64xZWkAfKLZJ5bEQboY1RToRJ6xhxvAL++gsZTBF4C1+Q7axgYizNz1w6LOvkyCtClA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <491961e2-f9a3-2bd5-e757-a094577ed068@suse.com>
Date: Tue, 28 Feb 2023 08:11:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
 <aa326f9a-94ca-75b9-6d4a-ab6fdf992c29@suse.com>
 <2fec6c39-f73c-719b-7bc9-02e1ec3f195b@citrix.com>
 <5e623eaa-ce32-e3ac-2089-68bf8125b5db@suse.com>
 <18b9b99e-1d93-73d8-f9b8-873f44287c5c@citrix.com>
 <60252bef-c732-b061-8ec0-c4022eb41255@suse.com>
 <dc6b36df-f46d-0903-0789-5dda74490eca@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dc6b36df-f46d-0903-0789-5dda74490eca@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f569d1-1839-4910-596a-08db195b0bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YegcFONXKq94VS/cOpATMHOcR70XATY2m6lN7qj7yrun4vTYcSgvD1NYDWojA/rfb5eI2KPPVexEYHnel1Hi/UxumG3fm50Pqz5oT3QlzsIDpfgIuXHXaq3MXR9G3kH2U/9m+8EQ2F7hMHGAhYV683a5zzc+BDSEC0wu7v3F/oSfeD1YvMqtTSR6J9VhJnusxjRFf9utF4WOAfAHlUeqb0G6JYIpe58MO3LuEJaGc0nyrG0YkXvbWQ66M3K0Vw3x2LVAAam0sCfv1L7p2OhQ3rdexUfY+Crj/CzYm2x90KKlXXtfwIq2ysoaH5l3GYx2V5nJvvhPhp0X3Edol8GmEGWiSXDFX5r9D0kTolWtdq4c5wQpnEoMiBbjMpncssxz8LHnU17eTdQixQi5iJk5vMc27xIwecrrZOj45qYDqKSr/rHoOIpp3YQURKRYAEN5aT1i38cc6zVK1sFYJW0GKizeiEDuySA1nbRKu/x6eP2TFHPrfXVScH+sP5cz5nh1nI6P3p9vjbVi1JcyCUjX6eZ9cL/zXyK7bouYu7MohR75y01hF4n+QewdjxYKhF+s1s2oCV03BDPZVzmR49YZc6BJPaVVMRSQwklYkWKvtTQZu/Osd20G27BIAC97Rd28cZwRRL0oHIM55N2zhFl47u4l/JA4A8WBLhAoOVOaxMYHvO8E3UceqSw36dvvi4hIXD7sC62YMY1Pp4Adb1Sn4tLYWXfIfmQcw0Rn/1XVs9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199018)(31686004)(86362001)(36756003)(41300700001)(66556008)(66476007)(66946007)(5660300002)(8936002)(31696002)(6916009)(4326008)(8676002)(2906002)(38100700002)(6486002)(478600001)(54906003)(316002)(83380400001)(26005)(2616005)(186003)(53546011)(6506007)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODRKTy9yaFZobS9YeklQVXZ0d2NsajZVdU9qUHhQZXpzc2FKM1R2bzJxUDlM?=
 =?utf-8?B?d0NETEFaQ1BORjcyN0l1M2V1aGJUS3pmZ2FwRGlFNDFpSnFNeXljK3RaTU5v?=
 =?utf-8?B?VlQvaE5qdWh3NWxCN1U5R3F3RTYvZEJKbXphdGw1cjhNQWl4ZXllWStFTU5T?=
 =?utf-8?B?b0hzUm1OOUJJKzhhV0FQeFpYaFEvcld6MmxNeXVTMUNPczFZTE9ic3BIcjky?=
 =?utf-8?B?cW14bW84Uy9yVm43Z2lDUVQzeVI1TDlZWHpqL0xURnh6SFZkWTBPN0V1TzFT?=
 =?utf-8?B?RTJlWC9KN1haTVd2SXRoeDBEdHp0TVV0Yjgxb0g2UTVZVFJST0JXK0QyQWVZ?=
 =?utf-8?B?U3llVnFJN2ZIS0pMamJGaHNCaVI5QnVlcWJMWU9JOFZMTWpYUlFDRk1Fb1VK?=
 =?utf-8?B?KzV1VXNlM0lpU21MZlBlcFA1YU5XaU9KK2pFdzZCUlBKekJ1TWdnUzRMTkQ3?=
 =?utf-8?B?L25zQVNmV0lnTzUrUllMMVg5LzdvbG9oakR5ME1ldEZKN1hseFloWWZFaGo1?=
 =?utf-8?B?UzcwRmUrcmtJcEtvYlQydERhYlFPS0ZNdis4RmxLTUU0RlQ4cUZWRHRTdGp4?=
 =?utf-8?B?a1IzVU02SklQdDU4amNZM1g0ZG10S2ZHd3JXZlM5d1dDVG53OGlMVm9ZdlNq?=
 =?utf-8?B?VnEyeU5EUmJPdmJtd0dZU1lWL21VNUthTWpJM1JaSHI1Q0tTSW1uWjNBRjh5?=
 =?utf-8?B?Y2IweVZiNXBPY0xKS3dhM0JGOWhRbTcrekpnMzZ3SEkrS0hHcGVtMmJQU05m?=
 =?utf-8?B?bjE4VHZLUTF2V3JtOTU3bWdaeVgwUHR5ckpncWlnamRLamx6Tk51aXg3cnJq?=
 =?utf-8?B?Qm5peEYvZitKd1BwMlNBeE9HWWthdWJmQWN6Rk1HTFErOG4vYWFsK0h6V1hQ?=
 =?utf-8?B?a3lZRVJjNGQxNGMwbnNCOStJbzJ2RW83R043WTdFVEIyVE1RWVhTU2lyMjFW?=
 =?utf-8?B?QWFWRFY1VkJFbUx2dWdnSVlTVGg1RWhpdzROVXMyQmpTNTg3TTM3bmZhQW9X?=
 =?utf-8?B?TlJaOUV1YkdIdGhmMVdydGRFeS9RaXpBdWZIRnB0T20wY1BqRk94cW9oWmRC?=
 =?utf-8?B?cHFiREdMTWI5eVg5Q2NhU2FqT1VCS1BGZVVCRlcvS3pRNjhON0N2UlRUZjh5?=
 =?utf-8?B?TFFLUVhveTRUeU5pbEt4NkNMVm1CVkhRNGpDL3NVNFlqdmhqL3VlTklQZEVw?=
 =?utf-8?B?Q3Nwc3UzTFRSak9kZ1NjR3lkU3hWSG9TRm11cGh2VUc5MWpQKzBGSlNaNlNO?=
 =?utf-8?B?N2dEVW5OWDZrOW9yeEZhTENEbEthSUUxL1ZiK0pGcE40NXlFeHJUQ2w3dWxr?=
 =?utf-8?B?bTUvL3ZkQi9EU0VFSEo1SlE3eWRibk56RW9sZU5VbFJPMm5RYmdqYS9VOStm?=
 =?utf-8?B?QSthT1U4ejNJbUFpM2ZvQ2J1SDVNNTNSM2tFV2kydWRyNEw4OTVBU2ZlZ1FF?=
 =?utf-8?B?KytkZTJiaUxKYlFNV3BxdGZwZVZ6T21QRVRuYVl1SDVOalloWUlPSlhRbXUw?=
 =?utf-8?B?aG5GRDNETitWM0R3ODRhYy9TSzZob2gxK3g1Y2ROYTN5MGtYR1VXYjNIeVkr?=
 =?utf-8?B?eGtIM3lINDJpN0c4R0ZTdWFnd21DZ283OWw1STRzR2IrT0JqbEF5MXNlM05V?=
 =?utf-8?B?SzI4eFNMNSt4ZGk1eDdyU3EvQjhOeFZINDBDMU94SElOaytab3pjcjhrNlJY?=
 =?utf-8?B?ZnN0OCtRVDYrZVE3R1VOWCtPWUt3VEdCeXBvMzBBbXJYOFF0YXl6VlRWYVN5?=
 =?utf-8?B?UHdxK0dPaFplQmIwcWxhQysweU9mOUFCdm1TVlJzdXpGWFVDbTZBUkJ0T3F3?=
 =?utf-8?B?RFRodjJIeStYMkFHT2VENmVyYU05UUdIMWlaUndXWUw2UWlveUpZQUhBeEhS?=
 =?utf-8?B?TXRSTW5LNWpqOE5DbmlKMHhNdzZXQ1p5Ky9aSXlPT1lmMnJBY2hDMTZBRXhH?=
 =?utf-8?B?WTByK3B5WkdJdC9PTTJuTFp2VCtxemtvZWVRSXFaOTdoTDZabXcxdmNucjIw?=
 =?utf-8?B?aWhKK3ErRzFKUDZlU0FxUXpmaHRDcTFoQVAvSmdITmR2RER2N2t5UHRzd1dL?=
 =?utf-8?B?WFpDT0N0c09sMktwWUNvMVdYMTVEc2ZmMkRRSkJzV1dZQk42SEN1S05sOHRF?=
 =?utf-8?Q?CQI1qU8v6GvMXE8C9JPKo4xxj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f569d1-1839-4910-596a-08db195b0bcf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 07:11:43.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f51f91Iyp5lCmG7l8Hrc2/LLlnu86MIlpuII97azZcB0M6W8UOT6CEdOwQ+EPu/auXk4EJw4EZk+B5wEjbVYWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100

On 28.02.2023 08:09, Xenia Ragiadakou wrote:
> 
> On 2/27/23 14:17, Jan Beulich wrote:
>> On 27.02.2023 13:06, Andrew Cooper wrote:
>>> On 27/02/2023 11:33 am, Jan Beulich wrote:
>>>> On 27.02.2023 12:15, Andrew Cooper wrote:
>>>>> On 27/02/2023 10:46 am, Jan Beulich wrote:
>>>>>> On 24.02.2023 22:33, Andrew Cooper wrote:
>>>>>>> But I think we want to change tact slightly at this point, so I'm not
>>>>>>> going to do any further tweaking on commit.
>>>>>>>
>>>>>>> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
>>>>>>> updating the non-SVM include paths as we go.  Probably best to
>>>>>>> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
>>>>>>> only got one tree-wide cleanup of the external include paths.
>>>>>>>
>>>>>>> Quick tangent - I will be making all of that cpu_has_svm_*
>>>>>>> infrastructure disappear by moving it into the normal CPUID handling,
>>>>>>> but I've not had sufficient time to finish that yet.
>>>>>>>
>>>>>>> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
>>>>>>> disappear (after my decoupling patch has gone in).
>>>>>> Why would you want to fold hvm/svm/nestedsvm.h into hvm/svm/svm.h?
>>>>>> The latter doesn't use anything from the former, does it?
>>>>> It's about what else uses them.
>>>>>
>>>>> hvm_vcpu needs both svm_vcpu and nestedsvm, so both headers are always
>>>>> included in tandem.
>>>> Well, yes, that's how things are today. But can you explain to me why
>>>> hvm_vcpu has to know nestedsvm's layout?
>>>
>>> Because it's part of the same single memory allocation.
>>
>> Which keeps growing, and sooner or later we'll need to find something
>> again to split off, so we won't exceed a page in size. The nested
>> structures would, to me, look to be prime candidates for such.
>>
>>>> If the field was a pointer,
>>>> a forward decl of that struct would suffice, and any entity in the
>>>> rest of Xen not caring about struct nestedsvm would no longer see it
>>>> (and hence also no longer be re-built if a change is made there).
>>>
>>> Yes, you could hide it as a pointer.  The cost of doing so is an
>>> unnecessary extra memory allocation, and extra pointer handling on
>>> create/destroy, not to mention extra pointer chasing in memory during use.
>>>
>>>>> nestedsvm is literally just one struct now, and no subsystem ought to
>>>>> have multiple headers when one will do.
>>>> When one will do, yes. Removing build dependencies is a good reason
>>>> to have separate headers, though.
>>>
>>> Its not the only only option, and an #ifdef CONFIG_NESTED_VIRT inside
>>> the struct would be an equally acceptable way of doing this which
>>> wouldn't involve making an extra memory allocation.
>>
>> That would make it a build-time decision, but then on NESTED_VIRT=y
>> hypervisors there might still be guests not meaning to use that
>> functionality, and for quite some time that may actually be a majority.
>>
>>> Everything you've posed here is way out of scope for Xenia's series.
>>
>> There was never an intention to extend the scope of the work she's doing.
>> Instead I was trying to limit the scope by suggesting to avoid a piece
>> of rework which later may want undoing.
> 
> Can I suggest to leave hvm/svm/svm.h and hvm/svm/nestedsvm.h separate 
> for now?

As per before - that's my preference. It'll be Andrew who you would need
to convince, as he did suggest the folding.

Jan

