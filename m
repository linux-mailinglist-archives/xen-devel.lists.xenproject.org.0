Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66744B6405
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 08:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272796.467763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJryI-0002Fe-W5; Tue, 15 Feb 2022 07:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272796.467763; Tue, 15 Feb 2022 07:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJryI-0002De-Sb; Tue, 15 Feb 2022 07:09:58 +0000
Received: by outflank-mailman (input) for mailman id 272796;
 Tue, 15 Feb 2022 07:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJryG-0002DW-Ra
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 07:09:57 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b792d6-8e2e-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 08:09:55 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-m1OuiyIQMZyZcsIbUQGhlw-2; Tue, 15 Feb 2022 08:09:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3230.eurprd04.prod.outlook.com (2603:10a6:802:6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 07:09:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 07:09:49 +0000
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
X-Inumbo-ID: 46b792d6-8e2e-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644908994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kKIihStcUVH+xcWxHahG+1jFaWxyJVKgfrL8wEgptw=;
	b=kJw0MCsg9RS+bRxT3UxWNQWMJAJcGZmhaljIRwrqrCDrxQghiQoj4dVjYEJPZpuZYHAgKQ
	y2WICeV47F+7gA8HCz/NxG+L14Ari2y2XpLosdQa84NvuXtwO4mhrKUpmJ28iW4v52wtHP
	40HGcfLl4OEhq+5s9uIrOLdJmVJm91M=
X-MC-Unique: m1OuiyIQMZyZcsIbUQGhlw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8tjlZZ1vnr5s02UWkNfl5JV06eWUR9UrqgbhwXTMlbsDq3f/nyzSlwhTwjawch4DASlVMt0gYVkZAIuitWkRBQ61vQ00+qm9Ud3kLoIh43duIIPZ5ZnoiVdAbIwI/P6vC7vfIJJEH9xJo1sxS98hRhK/1MzJ/kEk4qDDcl4oWFqy7lyycGopzvVeeCmMJshpJPN+QqN1O9hhpEekRNxD3nRGxtdNTU5qQvjH579Gveupzc8zp36cHCBrfbzbjo3rfBvMw2W7o/CAPNBqWP0ypSf1JqoyCXszVna/dp3+MPMMBTsAMSRK8VlDQ2XC6PEUYINH1tcgwGN6m2qnvMCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do+/CNe2wWfLWK1zsQR5/Pkxi+lTgmSc56obCjZ1g9Y=;
 b=MwL801hz3CKf5vUZWLYCpcWHgz1HUwW9oemRXrtzIrw1qsaV54qFP+9mIZsDC5TgyPYbieqIO7avHayd9b2bXx8mpA7Ws7y2BsWXGGAlmQCyBVoAKoxn5adySZead2Ezk6r8+6MAyzPPHg0ZaTuaAKkCQNqsTzEjfnZjT5+FVc4uKFYsOFPdp2Sk8pCWcpoKQNbgSMw56nTdEgknM9AopR25rfRqDdqNhRs2j7zq1NAFsKuoB4mEureKnbkH8VYHI435GYTNA0D1i9m3F7ST5N16QVJfoZmfvPZQg1X8YCUcvLH3b16gV+ShpcBthXUIZ6KHniVg74+rw4I0Q1Vd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
Date: Tue, 15 Feb 2022 08:09:46 +0100
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
 Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
 <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
 <6c9400b8-7c76-34c8-f69e-3fad1eb53b8c@citrix.com>
 <101b0950-b7f2-119b-b654-574a71cec3bc@suse.com>
 <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1bac0507-9420-f0b9-f846-f1c73bf9678d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0203.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ffaad1d-8f4c-4766-9b0d-08d9f052279e
X-MS-TrafficTypeDiagnostic: VI1PR04MB3230:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3230F0A3334B101AF8FF03C5B3349@VI1PR04MB3230.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oPg9HOYDOUbEuZaWovuPLxl7KedvdwSllw7tpySb2JO+RgVI1/vPW3JI2o0JmYfZhnXUioX4ntmFpbg3MsA6k2aTkYolRFf1Ysqn8CWarobRHfVolQG57KG+/X3f/ez0FwfAGan5pt6+Q5Bqb8k4YSp06DTFbxHF9Z5jpf95o+TefTKy9D90I5M5NT3R+9VK/UjIW7myvipGG5QbilcIDUJFOAyXyh7+AwwyGWCDUbELCjPwhu1rJbN5aw3pU65XrsAkjQCf7859j1igoYI4i4J8ceUlSw3bYQRh7tAx6Euptv6Eeff8MKpOVoy+O0nJDKbvs8OcStltcerAav5j3aRwrRbQeXSuNi3B2r5IbmWH+smcTSDHoMpNEtjHOjYQs//BhgObnLChShWU02KhfFsb3WgDF6k4cGeQ7AKj1z2HfO3PcpsmQ/NoBZzFuCulTr4fNrYv41Al1P1HPy+OaJWvme2/J8TUe2lJZaiWwq9djSfY8X+fa6K9veeGxA+nd5GQTNXVhs0auo+WuDLQPzTtBqG1NSsjZEU8HN+9iG6dBd/dHhpD+oTktuF2E39vtKPgZrLHGP2ZToNNmqiUHPYgagrCeYt3ftBGWiI3CqElUXVMbfqOkOfB0OtZuK3sPvQupE7xFO5TlDpDlBvO812d/5jk0RpSd6qIusIj3McMGci52bPPVeWgS1RFA/y+L9bb0eIB7eriR9FF58yQkBKklqmpGDCPl2RhrhgN3SM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(2906002)(38100700002)(83380400001)(66556008)(66946007)(66476007)(8936002)(8676002)(6666004)(7416002)(4326008)(2616005)(6486002)(36756003)(186003)(31686004)(508600001)(86362001)(26005)(31696002)(53546011)(6512007)(316002)(6916009)(54906003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z9DjMQhgzPPgxbskbahxhLwnw1qGlN3eRD8k6nYlTs9AlRW4qqTIJQsdLxl3?=
 =?us-ascii?Q?W9xC08KipbitlJxkFJ99y/cSVZJtaIy0H6Df+kHzS3JSLVn/++wmX2jk1s+F?=
 =?us-ascii?Q?dlUnAq+2iDX4jybsFIf0z3lOMA9b0CLDZqS+pykNJ4Fhfd5I64I4wvo26Zdc?=
 =?us-ascii?Q?7ZWf9NqOqQ9eyfgGwzGPVio2ZPxR771h+4NnJs8EwX+nxJa2wXRLEkNjthRJ?=
 =?us-ascii?Q?LpO/7FW5U0BZmGMT8WTnq35rj/JYIVBoJW75PMJQMe2qu0/vvtg81WA48kNH?=
 =?us-ascii?Q?uqSqq8basOkDWZTw9bH+PQLjOTAaT6ZYpQ6pU85bO3y1emSBqoHZJ/nJUlcm?=
 =?us-ascii?Q?+9Ra98gZ4YDC/P3n+Hl7u6w9cVw9Fq5LtMkcApasT2yYh2a5/jh+wSGORPQE?=
 =?us-ascii?Q?d2t6FyYIi6oyZfpOC7sPPB6773Y0GeIRNjLkpX1mJSsyYGZw4yeDriTYQP3w?=
 =?us-ascii?Q?YP7551gVh9DIrxOgWz+PeM3zI1/2w8Lr/14MN4zB2369PiHjVDwpzCmwieSh?=
 =?us-ascii?Q?KBNc4W9JzGLqs9mP4WPZC7Kkw0lASaXcQ1yXJV7+a7RE+gWam/usE3KpW9as?=
 =?us-ascii?Q?3JYK5vxwkC1ucKxXdR0LPws4AdeA35UP24zn4hkbXFCw8d8xKFclDYI119n1?=
 =?us-ascii?Q?Mh8rp+BGDZhIm8ZvAlC3/n7GWfQxDlUpasQbnA9NOiIlz2/MZV1Of3rqe8j4?=
 =?us-ascii?Q?an2D8OIgyb+rAf7bxxqaSXhs2c7nwVzypXOON51lqYJ3Pgbbq9CSZiTDG3/P?=
 =?us-ascii?Q?l0VUERvI/gtipbTIfgUvfu26A9IwGPRIp7sTJvNbpPq22IhiGxDU4zdcQd/N?=
 =?us-ascii?Q?iyerL6jlr9Zd3sxG58sFBu2ytTUt86K9bJU5IBD6CbVY6A0J9O/Csv9VO/hF?=
 =?us-ascii?Q?tp46r0VE7NtQ9fqNBDnIpOsDNZp0t4nAQw41880oLL5a4cgl/x9alMxKWdH+?=
 =?us-ascii?Q?1c3a5wCmDp6b+rf6j92tojYgRZ03w0yziHJQGLL9UkJURvoAh7cGSK48xi4U?=
 =?us-ascii?Q?xtv7bkjE+IAtm6aa1dJRLUuCLauqMrRWYsCHHzagTrIxIpQRdDO66lWpEB0e?=
 =?us-ascii?Q?iWe7V8IVkwF02ZjZ2N0U2gw8OQ08iU6hp1QmsBpRki+l94xuiEekjG5KvMOp?=
 =?us-ascii?Q?9MttYTlxijQl8pv0CkvJs1iiX4iGdUkYozSQv+I6uN/L7nbWU00y1p/CY9lQ?=
 =?us-ascii?Q?D2j2PJEqHW4aidZ01Ja8TClO7vY2vSCmsaUMCvmXMBpQN31++KlLDq4GK8w7?=
 =?us-ascii?Q?ORlNKNvVnNCh4g5SVVHb1p8wTakswbMbfyB1UVHHOPGSMLgGtFtvqZC2KEpN?=
 =?us-ascii?Q?unJBUsaW8GypUd20IM9LP8dxZ/RFO33tQX9cd3tOOcMYjRzy13ONnRdNh9Pp?=
 =?us-ascii?Q?FGGF/Ksm+bqw23K2NMVdrV0YbNqzRcJfWHQTfs8wzdsDtjI+SkNN8ctz2gMs?=
 =?us-ascii?Q?xlihiohM1RaAMXYBbS4PT0TxDH6389AORjMhGFwfAr4xsHGaCs2rh8fnEQhW?=
 =?us-ascii?Q?hSqNnXM3bHz4dmIWKV7RjFFkFnEM/mlS8pRNH8m4+joCNEDA6T4sSIaeY2wi?=
 =?us-ascii?Q?M9Qxywul2sCog2lJB9VCbJEuoX+vEHib6c8smicUiuJ+3ZmNQHHPqeuyYIB8?=
 =?us-ascii?Q?2pL08ZKDwOHDOWFlorKssPA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffaad1d-8f4c-4766-9b0d-08d9f052279e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 07:09:49.6544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+Zsdvgr98jW77eKWTrcziBFKF5zll2WDff8QCWs6Sf4nCKr1hlYX4cCInNCeYlACLrEDWPOT9310N9gIZSICw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3230

On 14.02.2022 18:09, Jane Malalane wrote:
> On 14/02/2022 13:18, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 14.02.2022 14:11, Jane Malalane wrote:
>>> On 11/02/2022 11:46, Jan Beulich wrote:
>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachme=
nts unless you have verified the sender and know the content is safe.
>>>>
>>>> On 11.02.2022 12:29, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
>>>>>> On 10/02/2022 10:03, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
>>>>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vm=
cs.c
>>>>>>>> index 7ab15e07a0..4060aef1bd 100644
>>>>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>>>>                 MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>>>>>>>>         }
>>>>>>>>    =20
>>>>>>>> +    /* Check whether hardware supports accelerated xapic and x2ap=
ic. */
>>>>>>>> +    if ( bsp )
>>>>>>>> +    {
>>>>>>>> +        assisted_xapic_available =3D cpu_has_vmx_virtualize_apic_=
accesses;
>>>>>>>> +        assisted_x2apic_available =3D (cpu_has_vmx_apic_reg_virt =
||
>>>>>>>> +                                     cpu_has_vmx_virtual_intr_del=
ivery) &&
>>>>>>>> +                                    cpu_has_vmx_virtualize_x2apic=
_mode;
>>>>>>>
>>>>>>> I've been think about this, and it seems kind of asymmetric that fo=
r
>>>>>>> xAPIC mode we report hw assisted support only with
>>>>>>> virtualize_apic_accesses available, while for x2APIC we require
>>>>>>> virtualize_x2apic_mode plus either apic_reg_virt or
>>>>>>> virtual_intr_delivery.
>>>>>>>
>>>>>>> I think we likely need to be more consistent here, and report hw
>>>>>>> assisted x2APIC support as long as virtualize_x2apic_mode is
>>>>>>> available.
>>>>>>>
>>>>>>> This will likely have some effect on patch 2 also, as you will have=
 to
>>>>>>> adjust vmx_vlapic_msr_changed.
>>>>>>>
>>>>>>> Thanks, Roger.
>>>>>>
>>>>>> Any other thoughts on this? As on one hand it is asymmetric but also
>>>>>> there isn't much assistance with only virtualize_x2apic_mode set as,=
 in
>>>>>> this case, a VM exit will be avoided only when trying to access the =
TPR
>>>>>> register.
>>>>>
>>>>> I've been thinking about this, and reporting hardware assisted
>>>>> x{2}APIC virtualization with just
>>>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
>>>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. Whil=
e
>>>>> those provide some assistance to the VMM in order to handle APIC
>>>>> accesses, it will still require a trap into the hypervisor to handle
>>>>> most of the accesses.
>>>>>
>>>>> So maybe we should only report hardware assisted support when the
>>>>> mentioned features are present together with
>>>>> SECONDARY_EXEC_APIC_REGISTER_VIRT?
>>>>
>>>> Not sure - "some assistance" seems still a little better than none at =
all.
>>>> Which route to go depends on what exactly we intend the bit to be used=
 for.
>>>>
>>> True. I intended this bit to be specifically for enabling
>>> assisted_x{2}apic. So, would it be inconsistent to report hardware
>>> assistance with just VIRTUALIZE_APIC_ACCESSES or VIRTUALIZE_X2APIC_MODE
>>> but still claim that x{2}apic is virtualized if no MSR accesses are
>>> intercepted with XEN_HVM_CPUID_X2APIC_VIRT (in traps.c) so that, as you
>>> say, the guest gets at least "some assistance" instead of none but we
>>> still claim x{2}apic virtualization when it is actually complete? Maybe
>>> I could also add a comment alluding to this in the xl documentation.
>>
>> To rephrase my earlier point: Which kind of decisions are the consumer(s=
)
>> of us reporting hardware assistance going to take? In how far is there a
>> risk that "some assistance" is overall going to lead to a loss of
>> performance? I guess I'd need to see comment and actual code all in one
>> place ...
>>
> So, I was thinking of adding something along the lines of:
>=20
> +=3Ditem B<assisted_xapic=3DBOOLEAN> B<(x86 only)>
> +Enables or disables hardware assisted virtualization for xAPIC. This
> +allows accessing APIC registers without a VM-exit. Notice enabling
> +this does not guarantee full virtualization for xAPIC, as this can
> +only be achieved if hardware supports =E2=80=9CAPIC-register virtualizat=
ion=E2=80=9D
> +and =E2=80=9Cvirtual-interrupt delivery=E2=80=9D. The default is settabl=
e via
> +L<xl.conf(5)>.

But isn't this contradictory? Doesn't lack of APIC-register virtualization
mean VM exits upon (most) accesses?

Jan

> and going for assisted_x2apic_available =3D=20
> cpu_has_vmx_virtualize_x2apic_mode.
>=20
> This would prevent the customer from expecting full acceleration when=20
> apic_register_virt and/or virtual_intr_delivery aren't available whilst=20
> still offering some if they are not available as Xen currently does. In=20
> a future patch, we could also expose and add config options for these=20
> controls if we wanted to.
>=20
> Thank you for your help,
>=20
> Jane.


