Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C64B519C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272151.466954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbNS-00030I-64; Mon, 14 Feb 2022 13:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272151.466954; Mon, 14 Feb 2022 13:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbNS-0002xh-2g; Mon, 14 Feb 2022 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 272151;
 Mon, 14 Feb 2022 13:26:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbFF-0002qS-LM
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:18:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94672d69-8d98-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:18:20 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-pDiaXwnuMeeOp_Y7p74urQ-1; Mon, 14 Feb 2022 14:18:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by GV1PR04MB9197.eurprd04.prod.outlook.com (2603:10a6:150:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:18:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:18:17 +0000
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
X-Inumbo-ID: 94672d69-8d98-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644844700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZJD/wOULmCc9InPJEL2dJQ1YMLNY8I9ZV4mWc9LIC4=;
	b=P6wS/UGCGnVmazT9utG/tT8c/44RE3z374v9Z1h4e+W57DoAVqooRfnLxVs8qjwpcQTgWI
	frrEXcTZsl5vc+j/et5A/AN06PJIi9L9abR+V6ZdC3NHIiOc7+h3yGZqewqQVbz/yE8Hsm
	joTp8IUskt/L1Bw+p0xT+QGqXVjKKh0=
X-MC-Unique: pDiaXwnuMeeOp_Y7p74urQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krwDG7ka8S/B1u4MhwE0jGC3i+SVwVkB4m/1yIgAMQ2nXICPwmk8hqChBSu3tG6CDex9F7+vm+433glImsBJZaCmuRMjtMuKH6UAkdyi18McjmndPaSzDVakNCrG4hiWs0+eppI1FrxsD9nYkCHqzODzqRxg5m451bMWgFLEx2yZZ9W8lQMAKL23u+SDWH0EGiU/PfGAGvDFywWwrGJgmC+fraHeoMW23qHj2dmPy+U28GnAfOj5U0hm5+hTcfkXWjPIu7cUMHPV3Hl+LgSBtpLPWKTtVzW454PSNSNIVii3uzoBmMR67+Ah9OvUL2A8MdU6BjeQMH1hYZO5TNUl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUfT+uee7lkEeRwRu0M2jDvu9D5RBEzvexxm5xFV+08=;
 b=AD7jfpEIG6eJg+C5KJ/lZzLTMQFm79Ui3ioy8TRYH7cHbdnrCPXDalDo0lZwQCrPrkUtTQBMWCuoLnwgxFKw9YbOzC2IT/PFz21d0xMl8UmrjDTmcV/05z70+kC01tu5uymIejz/KboQ+S2u5R7xs1gExzm5ZGze1wu/fRl09ohYt4rL71kuBxEhbbw8wveNARXwXK8cLSUmRWylM/bHlJ4EP4R6klUFPsXAqrNzx4S6zuOLlVKMFqA9W3mhzidkNFCF5fYDD9StNXhlIagIedrsW++N1DBpsrEUxnMlQdidgIfI3nOjhrjKUk5BmXDJDpJTzW27+mBlkA0hY73/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
Date: Mon, 14 Feb 2022 14:18:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0285.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 898c0395-c262-4fcb-cf00-08d9efbc7668
X-MS-TrafficTypeDiagnostic: GV1PR04MB9197:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB919734D4EA962509A5BC45D0B3339@GV1PR04MB9197.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxFS4HG9tF+uXIE+el1M8fEEUbDmJYCB4dJGg7koYvkhIXbzULr52QghS4l1nVqPsNrQigUkSSmPWUNvh15HBjuL2V9pUsit70KTZCGnbR7qo3+jf661dHF1D/tswfMMz263RRKmIWV7QBNcg6S8Hint41jn1EIaDyyx6sQRPAmghAQkcCTEmlcwuMmwR2QKOav2kisgEjsWPybOS93q4LOE+43oFDbvDb/TVlyMS4JXJJ5dizGu2X9ri/TTwT2TnDG84URkyjh4BMzDpzoSe05/dHXtPtSJtNkNcSTRg3+oYLcyNVURqWMwB4qK9X+fhjZPpeorZ9mu7cIIDJ0GPhrSAb8ML8nZMhDnVKZKZE/xJEDKb4YXfDGIOn9liTBslL4RGWneuMDWM2Vr5QYRuYtqcSaeKdZyVKwf9JYtCFGgNkS3rOftQcktVRZYzfFiPye514GhwIr0qNqz5s8ay01YYtMvZYNTdpTR10SFNOppg7sbKUYomUNodWst+F3RAit4yLtedSegiLUvLoapS4KHvNNXH6eka+kJFCOjgFm8mH8xA7UuQCCJb4SVBy/cn+gNw1/rmzSyds2yJfhPvAPiFtFMXzeiOGqeFJIqDpYmLBMESkjel98sIgitveHfF3U1K0sZaFr7IeW5TV2GRbwczgnolm1uCt7sZJvP7CM2fa78hpCxRxP1jPnEvaPHH3TrgFM2wMcyTaUA2bLSIwYdMk0VcmLi6ZOExAjuwdazAxIrjdnqyuQo5oZhiIyO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(54906003)(316002)(6916009)(7416002)(8936002)(5660300002)(2906002)(2616005)(186003)(26005)(83380400001)(508600001)(6512007)(6486002)(53546011)(6666004)(31686004)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ULa+YXtSLjjVHdF2t/s72OhP2AT9yAAX/yZ42zNoGpa2R/Jx929U1/p1FMoz?=
 =?us-ascii?Q?Dw0RuFkmvf79eYm+GtjIaBagLaG3MXgycWmbSY1VjvpM+HAjPpboFZu7ik5D?=
 =?us-ascii?Q?hZg7mzLu3tJIYpb0Fn0RO4S8HczDdeFt6mjM2id2hyZHQBTJOqpRKbO1tKn+?=
 =?us-ascii?Q?ZjTVoOVwQfL/yeK5oAH6rCVf9hYGjAM+VRVux8XiZ82po0askgAU5FufJI4Y?=
 =?us-ascii?Q?3ide9PWslcCeEx8tqEOOm1SIZXU1YF1OJ58B5qq9qpoDnr6DG4PWtSa32pUp?=
 =?us-ascii?Q?IsaaiHes95PdV4satO1HwvJnKk7o8xjTBMfaXK3M9Ust0+D5a0M59w5rTmW3?=
 =?us-ascii?Q?GHfYx0VMhmXALPfHif9NiJqmzpW/5rqwcMoYcWQMOsiFSY3OGKk2LgZDtUce?=
 =?us-ascii?Q?fIZyCdaBHXmfKgLcBIQDznT3ZIa8Y682VMmJwr8Tiget3MUhe/Dd6nTntaBf?=
 =?us-ascii?Q?WMonm97Zupiyv8ZmJr/I2MpSoGk2aH48z1hZXE7heZZ59FcgZffsWVGdbWKp?=
 =?us-ascii?Q?vg/g8RQgcFhG1SKzgvcEWJSAAsTzjCz+SF5Q/QaneKrq7XubVnjIaX1wC88n?=
 =?us-ascii?Q?dxq2BqFQTF+kO79xiYQZiZmdwRwo36moa0jT3yBWoaYauES6Hfj+nt6P4R44?=
 =?us-ascii?Q?xOnGtvYTzT6jyxcB/a+O5XSf8hWHa5a9Z8mWQR09uhM5K7sQIFILC/91l9rV?=
 =?us-ascii?Q?D4zEvEFc1wPpIWQyaJdqMoPUq3TovBVXArkt0qPPD4+5PAY4RQrYFhSui5sj?=
 =?us-ascii?Q?HYHTQUbNqTN3JaTf+YdGN9t62vdzoDrEuAT0HjXM+EtB4HIWX8sPPj402gZb?=
 =?us-ascii?Q?M7nImHueaQTVaV+3G9w+pU4UAwrUBpnVLzFlUToQEmJaOjEKjD0kioLKWXeO?=
 =?us-ascii?Q?sgoG8YGMzcT3NehIbo/L9WRtc8SV8qVFWR5lF63s08Y1erG8IFz5HzMiB9tI?=
 =?us-ascii?Q?SJ0t7a7HFF7Uzpm5ZWXad2/TZ4cldpcDz+PgfdyVwTjcEq6NJ3hR5pHaKbNQ?=
 =?us-ascii?Q?m72tJFOB6WV5ZYlmVkoCkXlL8i9fSRFvRE8Vq6C7LukEkIi+ynsanludbc8U?=
 =?us-ascii?Q?4kLpSN5ScuOX7JQCo7ud1/v8x6XljNDBqmzRI+RdBptT4bYTdecjK1D7tZkS?=
 =?us-ascii?Q?er10njEx25fz4J0AESkfeIAqE4v/u0AMkGDPgTmTk3MikWElg2Hd6DOSO6TN?=
 =?us-ascii?Q?7DEkV2taBrPnuyAxlwRcBNOnfSH+e/6mo+g6Nwmlk3jsPZlXpOTXn5VMJCPr?=
 =?us-ascii?Q?a0Qr1sydBHDeuB4/fzrB0x+stLjjmHrVSGFnxDTQx7QmKoqOovq171tPngCB?=
 =?us-ascii?Q?SLiMgmXK5fe5ML1Ot96yOJEz+eu5PEhsEr8+OG0MEYygGezGqlqw6xzhWl54?=
 =?us-ascii?Q?+Vn6JSLCSyfpq+3U/0xuwt/TgcYN2/6HHgeFMmLTcoaZoJYoXL8/Y9wieS6p?=
 =?us-ascii?Q?SaS3H6LsVsq2DzODQojDudM+HUCnoGIXRhbwnutWM3Esi4ZNT4ILixFKCgQ7?=
 =?us-ascii?Q?YNLdA94WgMYCll6m9SMzMLBBoTnNRHUKM6/0I9Rwv1IkYrUhqidU8SRWpQMV?=
 =?us-ascii?Q?hafF3Phixdp/AfAx0j7g1qXq5wQmiIxC4yEVC6IJKtCWhCsdyAFtfiO3YusU?=
 =?us-ascii?Q?eb9WDe90H9L5GdLc/+1PRhY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 898c0395-c262-4fcb-cf00-08d9efbc7668
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:18:17.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfKLuumB0DbcM6l1ytN6arRpLuI4CXnkKUt3f/1v1J9S43xCALqZeFUwEwV0AQ93FduFA7/vicLlqB2LGLgoAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197

On 14.02.2022 14:11, Jane Malalane wrote:
> On 11/02/2022 11:46, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 11.02.2022 12:29, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
>>>> On 10/02/2022 10:03, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
>>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs=
.c
>>>>>> index 7ab15e07a0..4060aef1bd 100644
>>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>>                MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>>>>>>        }
>>>>>>   =20
>>>>>> +    /* Check whether hardware supports accelerated xapic and x2apic=
. */
>>>>>> +    if ( bsp )
>>>>>> +    {
>>>>>> +        assisted_xapic_available =3D cpu_has_vmx_virtualize_apic_ac=
cesses;
>>>>>> +        assisted_x2apic_available =3D (cpu_has_vmx_apic_reg_virt ||
>>>>>> +                                     cpu_has_vmx_virtual_intr_deliv=
ery) &&
>>>>>> +                                    cpu_has_vmx_virtualize_x2apic_m=
ode;
>>>>>
>>>>> I've been think about this, and it seems kind of asymmetric that for
>>>>> xAPIC mode we report hw assisted support only with
>>>>> virtualize_apic_accesses available, while for x2APIC we require
>>>>> virtualize_x2apic_mode plus either apic_reg_virt or
>>>>> virtual_intr_delivery.
>>>>>
>>>>> I think we likely need to be more consistent here, and report hw
>>>>> assisted x2APIC support as long as virtualize_x2apic_mode is
>>>>> available.
>>>>>
>>>>> This will likely have some effect on patch 2 also, as you will have t=
o
>>>>> adjust vmx_vlapic_msr_changed.
>>>>>
>>>>> Thanks, Roger.
>>>>
>>>> Any other thoughts on this? As on one hand it is asymmetric but also
>>>> there isn't much assistance with only virtualize_x2apic_mode set as, i=
n
>>>> this case, a VM exit will be avoided only when trying to access the TP=
R
>>>> register.
>>>
>>> I've been thinking about this, and reporting hardware assisted
>>> x{2}APIC virtualization with just
>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. While
>>> those provide some assistance to the VMM in order to handle APIC
>>> accesses, it will still require a trap into the hypervisor to handle
>>> most of the accesses.
>>>
>>> So maybe we should only report hardware assisted support when the
>>> mentioned features are present together with
>>> SECONDARY_EXEC_APIC_REGISTER_VIRT?
>>
>> Not sure - "some assistance" seems still a little better than none at al=
l.
>> Which route to go depends on what exactly we intend the bit to be used f=
or.
>>
> True. I intended this bit to be specifically for enabling=20
> assisted_x{2}apic. So, would it be inconsistent to report hardware=20
> assistance with just VIRTUALIZE_APIC_ACCESSES or VIRTUALIZE_X2APIC_MODE=20
> but still claim that x{2}apic is virtualized if no MSR accesses are=20
> intercepted with XEN_HVM_CPUID_X2APIC_VIRT (in traps.c) so that, as you=20
> say, the guest gets at least "some assistance" instead of none but we=20
> still claim x{2}apic virtualization when it is actually complete? Maybe=20
> I could also add a comment alluding to this in the xl documentation.

To rephrase my earlier point: Which kind of decisions are the consumer(s)
of us reporting hardware assistance going to take? In how far is there a
risk that "some assistance" is overall going to lead to a loss of
performance? I guess I'd need to see comment and actual code all in one
place ...

Jan


