Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0783263223C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446596.702249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox60c-0005MA-6G; Mon, 21 Nov 2022 12:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446596.702249; Mon, 21 Nov 2022 12:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox60c-0005JM-3G; Mon, 21 Nov 2022 12:34:46 +0000
Received: by outflank-mailman (input) for mailman id 446596;
 Mon, 21 Nov 2022 12:34:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox60a-0005JG-EJ
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:34:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df963846-6998-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:34:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7939.eurprd04.prod.outlook.com (2603:10a6:20b:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 12:34:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 12:34:40 +0000
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
X-Inumbo-ID: df963846-6998-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSKnNg0NFbBpQIgP59srSBup+GsP0OvnSctiNK1/jR4pqMS7d0epTQx9J8EbstVJMxNt5Me8P5K3Gl5Bbk03VQOR2oq9OoW7k7jneFdflWJijUSzgsg41rNgVKBLt8IwtxjTa2jlbyogLYAvc9Bg9fnOVGefbAqr9r0744ShLHzMCPxnpkoYpkfff2URp+YRMGdLmN0vv3iISDOU0KLbi+iSsrJ7aYjpjjMDfghZgFu0R35YyXelR7z6/SSu7NVbRgDbYZNDxBhhFo7pd4eAB519r8L125SqtNl/Tw14MhjCeJP9ppUucXmFAsIR7Rg2yglxYAVnlV8V419IPI1rBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgMQQ1uffSE9xiLv/nTQb1rO9grcF4e+l3+hkZFc1fc=;
 b=ZmdYskC7uLzEnxTKnPE41A8QQahq7z0RlJ8CCOJeOBXHwjQ6Ylz1ChlXk20bkKZEjPtXv2z0GkKGVeOyayrS/qC8pI9re3xlqsLr5QIRSZW42RtN3PVcwIXgUoF/gMio/pbR8pdkMOohD60U4Qe4GXkW3XtXoKC4oZdmhfNyUUzEqn7hYoZj4PseUxP9t21jTejAQatbjsrvZl2MpNQUVR5Mi0KPYqQRn5/4EAY7uO/rONSejQEbyhZRQI9hiXmtjyNfkUidUdlLEKcwjrixhOcXdgumlucaVqqn5pbEvPZzwdTmVt6noDVhGxIkROuuHznMIg6HcrbuseLfuY52EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgMQQ1uffSE9xiLv/nTQb1rO9grcF4e+l3+hkZFc1fc=;
 b=A1D0ONP2eNFAIfQ12JiUMS/wNPvJpzU1mL00DxSPUkPkS3llskknOqNiQM7sL83au509zW2D93hSrBEoFyvGlZKbxOvwkt20aU11x+x1BAVgW2D1Luba9JAjc1KEtBTzHgZFsSfsImiHZPp4LqcnfcW0CKXxH1KcQlfVatqUcydk68GtSJgb60EysrwM/VgrSH0fNOab3oPjmtwROF6Ics3NUZrAl3v91B2CLUHIE/n4oXSNvgEYekG9xBlLhlRTsl64IsOy56NzJfmUk0pJD9RXMIlH1o9NI/DhJ0iGSbfXNG9Sxg+ef2UDxFeSJlLru4TbbwgLsmh7hK3pNc8pkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
Date: Mon, 21 Nov 2022 13:34:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: b087305a-4c87-4628-9dba-08dacbbcc288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G2IAPvZxTqE/GFM0eIgSprPyKIsNRh3dlM6POmMaky3J+PtqvqVA5mWRjGQvouwgfG6/lKWWOBjAjgdVgYNL1Wm7lx+jyRX2JWd9bV90rpnbQtozaVRzVNf7D2YTdl0MzO/URePGwvDj7JGehUsMcK2DJi5Q3TQKjMu3edgZZG5ecxQNP9/1PG86b2QrE9FRHVpEifNbDsjUHiLQ7B3wrn2lpGCkR7LcroprggtBFeVp9AxZqdve7G/B/AAKQXiWzaeLI4yEwSbJn6HC9aq3NnM1Wi3icmRd/tWOmRyR0rOAt3yjCR4LjG4f70SX7wqovjsa4lLxCSAG8d8EEDg6Ba3IgG9ydrQVdOlbmCro9iAbq4a2ceGM0Zy0LXp6KOYdYmprovgmzkeTGhi3cgI/+wuluguQmMN8oL5ljwm1XECe/0wLj+O4Zp2mhOocdEx9NnpHkvJoROl1E25067TfMUCKBGV6miHNGkzARNgQzNRaA8vs5AKXf2mIz3vm1+iQKh/UIFkB5HQIUpa1XVexcwc+x0qiccw1hAezL8+E8NP2Wu6kGMNf5DXzoMh8G/J1SwiZ2I8A/uMW6StzFZvF4dD8d2JrR4DxPWu6A6NQng+/wCnN/WqQ0s3mWFPD9Ux0AKT16BSt/XOaS4LKE0m2P06Q2ry/U4ZlL/O2ISvxSc7f/IGW3wOv1ozUA0k5rrnS3VGnFCk50oCNskrLXXXaonYWm9++KiWVcVmM8WD8cec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(5660300002)(54906003)(6506007)(6916009)(316002)(53546011)(66476007)(8676002)(4326008)(36756003)(66946007)(66556008)(41300700001)(6512007)(26005)(2616005)(8936002)(186003)(38100700002)(2906002)(83380400001)(31696002)(86362001)(31686004)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0NoblJycHRHVm1PY1hPYTd3WTRraDVIUHNPaVZqU09FZG5WMHVKc3VFT3VD?=
 =?utf-8?B?RG1rcGc1QStRQXZWdSs5MDQ5M3NVNzdMM01MQ1lCR2lRLzNKY09tcFJvQmlF?=
 =?utf-8?B?K1Q4dXRyVkhTc09xeFBCNmNvaTZoMFBtODMxNjR3cEtCM016cWtIOFc5TUF2?=
 =?utf-8?B?OTVJSkcrWUhpbkVTbVNrbEJmaWlIaWNGMForeVE3bG5tMjJvQk5Pdy9vY0NL?=
 =?utf-8?B?aVVGLzltZ2RPcXJvZDNtUk1XczNZUUtoV1U3RFg0MWJaa2kydEhwZGhQalhJ?=
 =?utf-8?B?VnFQc0E0VDYyRzIyUW1MenRBV2ZxSFJxcHhYSlpkK0ZDK3ZtelZCaTBvVUlG?=
 =?utf-8?B?RVVMV1R4Qms1Wnc1QU9CaHlMeFBCSlNqU0FZQnRzVzhXZjhGNmtOQXpnNk5E?=
 =?utf-8?B?L0tMcUZPcHZjTnNmc0JrcGp3ZHVwQllzVVUyT2VXM1NYZWpjY0dXM0ErckNP?=
 =?utf-8?B?cTVEQkVRWUJ4UWZTWHltR0UxalcrejVPQmZ6Y2dtUmRGTGdYclFVSExoSWV6?=
 =?utf-8?B?WVg1cklGOExFbWpsZ3dqV2RnZVh2b3MzWkVBOWFhcUdqNFlKaDlJWDFRcG5Q?=
 =?utf-8?B?cTJkS0hqb1lYcG9pcm54d0FzeFNDM1VySzJQLzBYOWdrbElSRk1wbHR1eld6?=
 =?utf-8?B?MFNPMmlFeUpiUS9VSlhQOXc5c2hWVmRYTFpUYWZmVlgzSXNuVVppL0dqZU5p?=
 =?utf-8?B?dGhDWkswaXEwclVCdXVaSXFHWDVvSHdLa0trYnRBRVk1ZElGNWxhSTJ1eUhz?=
 =?utf-8?B?RXhnbGpZWGVzUzRkQnFITWJxYWI1dlJkZVdtN3NpRXoxYUlXTE1PRUZaZ3l4?=
 =?utf-8?B?NlloMlZlWk1MOXZ6QkVxZ3FublBTN3FhYjBuOUlvSmZYMFJ1SjJJMTUzWFhO?=
 =?utf-8?B?VmhXci9xZktCUnpDV3YvSFVHaFJkRmd5TnJ1b2l5dUVkdlU3WlprcGgvYUtu?=
 =?utf-8?B?eXJ2RVJGZjFCRUNxSnZkK0Zld2lHUUpVbzQ3dGgwVmJXVkJReHJScW9GMEZm?=
 =?utf-8?B?U25DVlZiRXo3VTNCMjJUc3pNaFdtR3NKV1JMTy8xcjJqald6dUhBK2VhN0dU?=
 =?utf-8?B?N1hodUxpWm1mYlQxamRZOFRhTldudXYyUlJ0eVh4NFhBdmZybURuMkYwTkVD?=
 =?utf-8?B?R2ZvZHNqdm5EaUw0ZGNYN0FlZDc5Z1pnUzdLWDNLbkQydmFqOGdwOWVYeE93?=
 =?utf-8?B?RStjd2JTV2F4dEZmeE1JNDg2VjlPaVBCTWJPQndFeDJhVXVFUEwwdFM0dURW?=
 =?utf-8?B?YTFXWHFjVHRsckdJbzQ5aVNocWNNeGtNWkg1c3dORWdESmNRSmttZGVKdjVx?=
 =?utf-8?B?R0tqUzB3Zk1JenBMdEFac2pMV3k0QURoOUN6d3JZOHRZUUhyallWeW5OVkl4?=
 =?utf-8?B?OXlHNzR1NFRPM0NFV290a0hXUTFhSFBDd2FpczR1NUdRUFUxODFrMU9RZlRI?=
 =?utf-8?B?ZVBURitSazNzb1REbXFLRU1PRmN3K1BZMldUOWNPakkzL2pvUk1mOWJxN3hM?=
 =?utf-8?B?ZXVXdXluNWpTUkMxeklmem1GVWFHZy93NXF6NW02ZjNRUEVKMTBPd1Bvai9j?=
 =?utf-8?B?SHovYko4dDdvREdaQ2M0S3NGcFdrbDhEZG9OclJjV3doeHlWdGw5cGdxQWtj?=
 =?utf-8?B?RzlWd3lYQjVyWmh1RkdOeWpNZEdBYlBVVHk0eUU0U1NaUXRzdGZiOXlhTFY4?=
 =?utf-8?B?Q01rNjQ5SUxWK0dZa29iMEtyS2k0ejZVa1BFTDZEb2owOGhwM2FVOXhiVFZm?=
 =?utf-8?B?c215empwUDJ4Tnk0eHBKU2lqb2MydFhWSUoyVUFnWlNkQ3B4dVRFTU1qYnkv?=
 =?utf-8?B?RGxCR0dyZkRvYzJNWStka00raWg0Y2h0WWUyM3ZmSXRWUUhQZFZuL24yVERa?=
 =?utf-8?B?WXVDWlpKOWQzaFN6eVllSGo4aGpibWdkaXhlN0F2VmExU1grZW5SS0JKS1Bu?=
 =?utf-8?B?MW1mMVNzRjJDenJuaDVQNEtQVTd6bE1iWlVxNzZwSGV0eEVVWDUvd0N5NjFB?=
 =?utf-8?B?MDZkQVlTRTVkM09qdjlQaDZQZ08vVVpTaGhXYlhQOGdzZU9raWZQS1dXbXE1?=
 =?utf-8?B?OFNKVWUza09lNmdsUlZ0akJ3TmtYV29acHowR3h3ZEhiOFlEVFFuZE9OTUtB?=
 =?utf-8?Q?aHGC1PxD25+VenlkmKYVmx+uy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b087305a-4c87-4628-9dba-08dacbbcc288
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:34:40.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I61HqU/H/uS5xw5FTW2yVvhBN8Sbi4fmWaKPLGcLzt81ieB7cqFO9yLXe/yCxNoOJOcTUlkm/DHqZn5WNndobA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7939

On 21.11.2022 13:23, Andrew Cooper wrote:
> On 21/11/2022 08:56, Jan Beulich wrote:
>> On 18.11.2022 15:27, Andrew Cooper wrote:
>>> On 18/11/2022 12:54, Jan Beulich wrote:
>>>> On 18.11.2022 13:33, Andrew Cooper wrote:
>>>>> On 18/11/2022 10:31, Jan Beulich wrote:
>>>>>> Linux'es relatively new use of HVMOP_set_evtchn_upcall_vector has
>>>>>> exposed a problem with the marking of the respective vector as
>>>>>> pending: For quite some time Linux has been checking whether any stale
>>>>>> ISR or IRR bits would still be set while preparing the LAPIC for use.
>>>>>> This check is now triggering on the upcall vector, as the registration,
>>>>>> at least for APs, happens before the LAPIC is actually enabled.
>>>>>>
>>>>>> In software-disabled state an LAPIC would not accept any interrupt
>>>>>> requests and hence no IRR bit would newly become set while in this
>>>>>> state. As a result it is also wrong for us to mark the upcall vector as
>>>>>> having a pending request when the vLAPIC is in this state.
>>>>> I agree with this.
>>>>>
>>>>>> To compensate for the "enabled" check added to the assertion logic, add
>>>>>> logic to (conditionally) mark the upcall vector as having a request
>>>>>> pending at the time the LAPIC is being software-enabled by the guest.
>>>>> But this, I don't think is appropriate.
>>>>>
>>>>> The point of raising on enable is allegedly to work around setup race
>>>>> conditions.  I'm unconvinced by this reasoning, but it is what it is,
>>>>> and the stated behaviour is to raise there and then.
>>>>>
>>>>> If a guest enables evtchn while the LAPIC is disabled, then the
>>>>> interrupt is lost.  Like every other interrupt in an x86 system.
>>>> Edge triggered ones you mean, I suppose, but yes.
>>> For IO-APIC systems, you mostly lose line interrupts too, don't you?
>>>
>>> The line will remain pending at the IO-APIC, but nothing in the system
>>> will unwedge until someone polls the IO-APIC.
>>>
>>> Either way...
>>>
>>>>> I don't think there is any credible way a guest kernel author can expect
>>>>> the weird evtchn edgecase to wait for an arbitrary point in the future,
>>>>> and it's a corner case that I think is worth not keeping.
>>>> Well - did you look at 7b5b8ca7dffd ("x86/upcall: inject a spurious event
>>>> after setting upcall vector"), referenced by the Fixes: tag? The issue is
>>>> that with evtchn_upcall_pending once set, there would never again be a
>>>> notification.
>>> Ok, so we do need to do something.
>>>
>>>>  So if what you say is to be the model we follow, then that
>>>> earlier change was perhaps wrong as well. Instead it should then have
>>>> been a guest change (as also implicit from your reply) to clear
>>>> evtchn_upcall_pending after vCPU info registration (there) or LAPIC
>>>> enabling (here), perhaps by way of "manually" invoking the handling of
>>>> that pending event, or by issuing a self-IPI with that vector.
>>>> Especially the LAPIC enabling case would then be yet another Xen-specific
>>>> on a guest code path which better wouldn't have to be aware of Xen. 
>>> Without trying to prescribe how to fix this specific issue, wherever
>>> possible we should be trying to limit the Xen-isms from non-Xen areas. 
>>> There's a whole lot of poorly described and surprising behaviours which
>>> have not stood the test of time.
>>>
>>> In this case, it seems that we have yet another x86 PV-ism which hasn't
>>> translated well x86 HVM.  Specifically, we're trying to overlay an
>>> entirely shared-memory (and delayed return-to-guest) interrupt
>>> controller onto one which is properly constructed to handle events in
>>> realtime.
>>>
>>>
>>> I even got as far as writing that maybe leaving it as-is was the best
>>> option (principle of least surprise for Xen developers), but our
>>> "friend" apic acceleration strikes again.
>>>
>>> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
>>> because microcode may have accelerated it.
>> But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
>> VM exit.
> 
> Intel isn't the only accelerated implementation, and there future
> details not in the public docs.
> 
> There will be an implementation we will want to support where Xen
> doesn't get a vmexit for a write to SPIV.

I see.

>> If we didn't, how would our internal accounting of APIC enabled
>> state (VLAPIC_SW_DISABLED) work?
> 
> It doesn't.
> 
> One of many problems on the "known errors" list from an incomplete
> original attempt to get acceleration working.
> 
> There's no good reason to cache those disables in the first place (both
> are both trivially available from other positions in memory), and
> correctness reasons not to.
> 
>>  And the neighboring (to where I'm adding
>> the new code) pt_may_unmask_irq() call then also wouldn't occur.
>>
>> I'm actually pretty sure we do too much in this case - in particular none
>> of the vlapic_set_reg() should be necessary. But we certainly can't get
>> away with doing nothing, and hence we depend on that VM exit to actually
>> occur.
> 
> We must do exactly and only what real hardware does, so that the state
> changes emulated by Xen are identical to those accelerated by microcode.
> 
> Other than that, I really wouldn't make any presumptions about the
> existing vLAPIC logic being correct.
> 
> It is, at best, enough of an approximation to the spec for major OSes to
> function, with multiple known bugs and no coherent testing.

But can we leave resolving of the wider issue then separate, and leave
the change here as it presently is? Yes, mimic-ing the same behavior
later may be "interesting", but if we can't achieve consistent behavior
with yet more advanced acceleration, maybe we simply can't use that
(perhaps until a complete overhaul of everything involved in LAPIC
handling, possibly including a guest side indicator that they're happy
without the extra signaling, at which point that yet-more-advanced
acceleration could then be enabled for that guest).

Otherwise - do you have any suggestion as to alternative logic which I
might use in this patch?

Jan

