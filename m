Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4EB4B6FA8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273302.468434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzdm-0008Un-JA; Tue, 15 Feb 2022 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273302.468434; Tue, 15 Feb 2022 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJzdm-0008Rs-FB; Tue, 15 Feb 2022 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 273302;
 Tue, 15 Feb 2022 15:21:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJzdl-0008Rm-LW
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:21:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaac2518-8e72-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:21:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-txbCxrkNOIinvfSL7Ydjcw-1; Tue, 15 Feb 2022 16:21:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM9PR04MB8146.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 15:21:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 15:21:11 +0000
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
X-Inumbo-ID: eaac2518-8e72-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644938475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVYyXNlz+eUTKUaImCCi+2YvqtL+8wAtJKZF8Z58ZAM=;
	b=WsCBCo9a8ssvssn96Kv+HMnLRtRGvKoyrJFEO87tAfOVmE+jVmtsegsd0euLBk++vJmQUR
	GDOYENCRGmBRl+8ab6Q4VL4jZgxNFvTw5l/XY1V53+UOz2Yelfo1mFMuahLOQ3nbkMLN5/
	MnmSpce27QZPxMhXsVXfDNH2RAOP3iI=
X-MC-Unique: txbCxrkNOIinvfSL7Ydjcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq4jI+Gmr2+f/0RNwS1T3APPlPk+kghLtIbMCZ7N2aMmU7qTs7+aHMVdWpitxDKAZnEmDB8GFKpYZNvjfsKUe53v4V8/CROJXrjO7+pYKbQLgFwHAdEwWbICiDsjkMuSTJtPWURaaanN+f+4rjdc8Ig3WxWQJZ80iBvFw1PLqsJxpbpOL9UpNRFCoTKIpRZt9kXe56WALQMXyjp0ZYI+ZaGZNnZrXl+yXSagtdxzgUSdt/hQCAh8C8f9e8Teho5VKQw4dN6j3REyvUu8RNtNQUa4H3b2L4WdXQryeZq1USXwpzDV7F/Brr1AD4RAExJyrvBk71Z7Fpn5AYAKAhYp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT/s0DHryS9jpcUeZjhi23fefi2zohL4auKOBEk71DA=;
 b=WxCikzkUfA1tiykBvKXnvF0kw30UxYyjnFW2NzPd03diWQuN7fbsaGAX7eXi8WF9/c03BXMSh85FtC1KgZ53X9z8jbXfLr3Wy0JMHC+BKxgRsiVcUPYG4i0ty92IQMw0AOARYqlSlYkotORbXCrIl5Fwy4Z3C4nJzH2CblVtH964+OaIutkT8e4jtk8zxg+GNMXKKcWXh11Jol/HQ1pWet4n92n/HSdxTOfOB86ecAbA9aa6o1Zo5n+iQsh3BTPcMP6AragrIlB7MhYXem4gZ6EHXWn6V8NnKNpUaZjat9I+nwH+jC2pmXRd4D0pMbGDdSo10cln6QMHXX0wApILnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7fbc16f6-4175-06e8-742c-9aa8c7eb3e91@suse.com>
Date: Tue, 15 Feb 2022 16:21:09 +0100
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
 <42fb3257-0c36-c156-c81b-f70dd5f247aa@suse.com>
 <9721222d-1c0d-ddaf-fbc6-801f5d9445f5@citrix.com>
 <12727658-68f4-1785-9b37-c948eb2cba71@suse.com>
 <9ed50d7a-23c7-2405-ff5e-15cc02b0c67f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ed50d7a-23c7-2405-ff5e-15cc02b0c67f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0252.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0dbc66b-33d1-4bb3-5869-08d9f096cc7e
X-MS-TrafficTypeDiagnostic: AM9PR04MB8146:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8146712AB4FCC302CE29309EB3349@AM9PR04MB8146.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wXVPetlkPiiFcpAPZNFw/lz+tKZHP4bpNUCUqBo4li33QO1CKo59975R1xGfyajZoZkCOANWCnYx33O6cJtbDvIDBtUL9Y0+YjmBbH/TD/CGCkSFp9xBkRNfKY7vp3U/xapqPqncKpetzmHtfHSg/f613I2ekMuxV4T+c8xyrX3RtpqApWsfNqK45O5xvQ69wo96nmrYRVq+m856JP6H2VKrzCh8gNCH9jYuHhPGjJ+XzI2KBGdHeJZMF2mL+OQmbtwUwDZkeq4EKsY7HzuvKv9hQZo3vj/0Jcdj7XdVZZxvMnbgbtsjfFkw0Lp7p+Px1fm0FoK1NEzUaGG6uyeRPhey5sAUIVdgH1PNqidstN8zdDpuv5gJPNEyEmWeFvN7xdF4QmvnEOv74HTzbvApeyvFLmOVe4Kg1dMAgFvuZWEARv3rU9Jtw1prtXfjQjlb9X4nR/7GITRSa19m1n1ZuCL+3rQ27eA3DXQcGkmN/NhpFTacUyNdOQF3itsiPmdPbHSszweZKe/EnpVDHWD1Uz4RszU1Dl6Mm9WulLL9phHKgG86mzrExqNSdbBsVmTLYwFPPYnAbMxHCEuduMq+9P2uymnh170jaFEcU4Yr54nJNqYU5DIMzl6WWUtAiq0A/W0D3nU7p9MVMVOGt7rD+KN8ydc+OS1tkrNLhsMz3kvrML2YpFBKEU/eMxhdRBtyeJTB6keg6QBQihkn8O/9xzAV2G6EKnDOjjzgGzwTep9kBwfKM8/3AxiU+FA7X+MQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(66946007)(6486002)(6916009)(5660300002)(31696002)(86362001)(8936002)(38100700002)(8676002)(4326008)(316002)(7416002)(66556008)(66476007)(508600001)(26005)(83380400001)(53546011)(186003)(6506007)(2616005)(6512007)(31686004)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YTyqmuCnf9ywMB4aqIP96k7Bmq1xwoSw0A11MkiFITs0iBueQLIF3VNQcPPQ?=
 =?us-ascii?Q?h0NVemhbtoHX3KWQb/7yR4lYnVU4CnJ9mWcvoD6Fkw9XoAuKhe9xT62pzF4W?=
 =?us-ascii?Q?T6kSPWWja+aF4eqFac3dzEocX9b8vGUY/OWDar/eDYBg77Gk3xkZDup0ihEM?=
 =?us-ascii?Q?oC8xerVQg4HRWgJGhHeQ+nKT2PgEvUtLaYZDfPl/SmFzLeXyYxOH5w/f+58d?=
 =?us-ascii?Q?SIgotBSdcD4bz/I5mTPdwa3jFx+Mg1MeoSjoABYgSeyDPAL0nD7Cu5hdsBp9?=
 =?us-ascii?Q?r8rqVv+JeUnNP4KqGltDMTT3s43/heMZZ9OREnT1fzKGIbyyEYrNWz3be5Ax?=
 =?us-ascii?Q?nx+FC1xjkPwHd5qHFhya94F/lhu3sv5czpsNDbNycv6JxdiAaxFOqbjA6kdY?=
 =?us-ascii?Q?kFwi7HeO6dbxLBIAVcbsGFSYnvrmvNgBEBqGzGeBQjXbnfbKK5TKUf81RzN1?=
 =?us-ascii?Q?NFOK0sELktrbhXh5cKYF+6HzohF5VR5iZjtqX3hIYovI29Id5wa5fsPEz+h5?=
 =?us-ascii?Q?NvTv6fX0/VyboPibL4CLXhgSe/DCrIEDAP43027lW1mjPYGhpZTyU+L5Pln4?=
 =?us-ascii?Q?HfAlcAErsJERrJWUO/QWIZA6jk4rxtV8B5HNdZz3pDfxU9t5tn1AlzCn3H9t?=
 =?us-ascii?Q?616tYs8SEfjeOW97+PxUD5ZSyJjDnnrNvbkMlEDNDAV0e0mAABQowpqo6cXC?=
 =?us-ascii?Q?F6fkSkic1tZ2ZuB0UILt+Xz56lo2WWgkTKX5HWN4kO6Oj7We9UfWy70GecT2?=
 =?us-ascii?Q?ZurCy4NBsZDReW/zcTuCcVJfBuDvjVFZGF9TObSGdcnuDdqPprVqPPW5Spp7?=
 =?us-ascii?Q?p/rTug2cmoXFPX3THD9lgk2ELEI8na2WclN0OKEEDUSM8USADpHJWmfJEyIl?=
 =?us-ascii?Q?yYwOxCebbJQBL84mv8IWUsiCw42hCh8zz4DW5mlPOXtWJVO8u1EYlJUGEiuZ?=
 =?us-ascii?Q?UW8WwTLoqI0C+qpwgCQpLKWWdepTHLMuai2/QjqC2MLbh0qJ0aoj+JqG8H5X?=
 =?us-ascii?Q?ugwAUQVdX28TTSQpq3iryMeHQ9XdVW/TF6PHrsqwQ8nKRZJez/iycn77Zasi?=
 =?us-ascii?Q?F3eBaRpTGketLxfp7dJE5Uog7NoKaOR3zmS9dkYpLEacMqGa9NFmykzeGoVs?=
 =?us-ascii?Q?yHPDEsF2vectNF9RNhKyRIj61S7bw/mj6/bLd2JLaff4VoNn7wLmHW8+ebh+?=
 =?us-ascii?Q?Z0NJMBqwSYw6BkhMcOPRU+ApSkfxHDRmoD9Lm79gUrJccNaEag43ksv0Tp8T?=
 =?us-ascii?Q?imVLFg2wqSExO7BkxGCTdDqt1ZxQBu4Gk6f/MbK9iKCKWvbPhTUQXUE19gvA?=
 =?us-ascii?Q?4iBXZgYQLY1oBqmf7wwU36QqhBuo9IW/OuOo/V+98lNfpJzJF18vFeEq3UUs?=
 =?us-ascii?Q?LTo475qfQ5jBb636BEIbVnp7wFjVvq/7kSAy4FWxZJ0+4Z8p4sq2MPimBVW2?=
 =?us-ascii?Q?SrUvXoVO5PxJgnh1+79pgzlY0IbKEBd/0m/EVxr5Pip3sHadYLj1rpv+pU9J?=
 =?us-ascii?Q?WE+mOvASwnBj6aG0txSKKUkoJGxO8DqNdYgMPO3BzUFKgqVfnydbfExUHV45?=
 =?us-ascii?Q?HGnsY5n0DHviwuDMIEaxrj07zOvRfJyInNYgwHnUHnBpIeH5PjlaRC7oYXWH?=
 =?us-ascii?Q?7MVCbJnCURkmdfSfcUji+To=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dbc66b-33d1-4bb3-5869-08d9f096cc7e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 15:21:11.7478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ex1ib9trXZ2FY+Vsrz/ePG/l0ObkSZTAXzB4iV1WcyYz5y/8W4ESgUV0Hack4dajEZ/YVsVD//onZOpR6LjfYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8146

On 15.02.2022 16:10, Jane Malalane wrote:
> On 15/02/2022 10:19, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 15.02.2022 11:14, Jane Malalane wrote:
>>> On 15/02/2022 07:09, Jan Beulich wrote:
>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachme=
nts unless you have verified the sender and know the content is safe.
>>>>
>>>> On 14.02.2022 18:09, Jane Malalane wrote:
>>>>> On 14/02/2022 13:18, Jan Beulich wrote:
>>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attach=
ments unless you have verified the sender and know the content is safe.
>>>>>>
>>>>>> On 14.02.2022 14:11, Jane Malalane wrote:
>>>>>>> On 11/02/2022 11:46, Jan Beulich wrote:
>>>>>>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open atta=
chments unless you have verified the sender and know the content is safe.
>>>>>>>>
>>>>>>>> On 11.02.2022 12:29, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
>>>>>>>>>> On 10/02/2022 10:03, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
>>>>>>>>>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vm=
x/vmcs.c
>>>>>>>>>>>> index 7ab15e07a0..4060aef1bd 100644
>>>>>>>>>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>>>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>>>>>>>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>>>>>>>>>                   MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>>>>>>>>>>>>           }
>>>>>>>>>>>>      =20
>>>>>>>>>>>> +    /* Check whether hardware supports accelerated xapic and =
x2apic. */
>>>>>>>>>>>> +    if ( bsp )
>>>>>>>>>>>> +    {
>>>>>>>>>>>> +        assisted_xapic_available =3D cpu_has_vmx_virtualize_a=
pic_accesses;
>>>>>>>>>>>> +        assisted_x2apic_available =3D (cpu_has_vmx_apic_reg_v=
irt ||
>>>>>>>>>>>> +                                     cpu_has_vmx_virtual_intr=
_delivery) &&
>>>>>>>>>>>> +                                    cpu_has_vmx_virtualize_x2=
apic_mode;
>>>>>>>>>>>
>>>>>>>>>>> I've been think about this, and it seems kind of asymmetric tha=
t for
>>>>>>>>>>> xAPIC mode we report hw assisted support only with
>>>>>>>>>>> virtualize_apic_accesses available, while for x2APIC we require
>>>>>>>>>>> virtualize_x2apic_mode plus either apic_reg_virt or
>>>>>>>>>>> virtual_intr_delivery.
>>>>>>>>>>>
>>>>>>>>>>> I think we likely need to be more consistent here, and report h=
w
>>>>>>>>>>> assisted x2APIC support as long as virtualize_x2apic_mode is
>>>>>>>>>>> available.
>>>>>>>>>>>
>>>>>>>>>>> This will likely have some effect on patch 2 also, as you will =
have to
>>>>>>>>>>> adjust vmx_vlapic_msr_changed.
>>>>>>>>>>>
>>>>>>>>>>> Thanks, Roger.
>>>>>>>>>>
>>>>>>>>>> Any other thoughts on this? As on one hand it is asymmetric but =
also
>>>>>>>>>> there isn't much assistance with only virtualize_x2apic_mode set=
 as, in
>>>>>>>>>> this case, a VM exit will be avoided only when trying to access =
the TPR
>>>>>>>>>> register.
>>>>>>>>>
>>>>>>>>> I've been thinking about this, and reporting hardware assisted
>>>>>>>>> x{2}APIC virtualization with just
>>>>>>>>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
>>>>>>>>> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. =
While
>>>>>>>>> those provide some assistance to the VMM in order to handle APIC
>>>>>>>>> accesses, it will still require a trap into the hypervisor to han=
dle
>>>>>>>>> most of the accesses.
>>>>>>>>>
>>>>>>>>> So maybe we should only report hardware assisted support when the
>>>>>>>>> mentioned features are present together with
>>>>>>>>> SECONDARY_EXEC_APIC_REGISTER_VIRT?
>>>>>>>>
>>>>>>>> Not sure - "some assistance" seems still a little better than none=
 at all.
>>>>>>>> Which route to go depends on what exactly we intend the bit to be =
used for.
>>>>>>>>
>>>>>>> True. I intended this bit to be specifically for enabling
>>>>>>> assisted_x{2}apic. So, would it be inconsistent to report hardware
>>>>>>> assistance with just VIRTUALIZE_APIC_ACCESSES or VIRTUALIZE_X2APIC_=
MODE
>>>>>>> but still claim that x{2}apic is virtualized if no MSR accesses are
>>>>>>> intercepted with XEN_HVM_CPUID_X2APIC_VIRT (in traps.c) so that, as=
 you
>>>>>>> say, the guest gets at least "some assistance" instead of none but =
we
>>>>>>> still claim x{2}apic virtualization when it is actually complete? M=
aybe
>>>>>>> I could also add a comment alluding to this in the xl documentation=
.
>>>>>>
>>>>>> To rephrase my earlier point: Which kind of decisions are the consum=
er(s)
>>>>>> of us reporting hardware assistance going to take? In how far is the=
re a
>>>>>> risk that "some assistance" is overall going to lead to a loss of
>>>>>> performance? I guess I'd need to see comment and actual code all in =
one
>>>>>> place ...
>>>>>>
>>>>> So, I was thinking of adding something along the lines of:
>>>>>
>>>>> +=3Ditem B<assisted_xapic=3DBOOLEAN> B<(x86 only)>
>>>>> +Enables or disables hardware assisted virtualization for xAPIC. This
>>>>> +allows accessing APIC registers without a VM-exit. Notice enabling
>>>>> +this does not guarantee full virtualization for xAPIC, as this can
>>>>> +only be achieved if hardware supports =E2=80=9CAPIC-register virtual=
ization=E2=80=9D
>>>>> +and =E2=80=9Cvirtual-interrupt delivery=E2=80=9D. The default is set=
table via
>>>>> +L<xl.conf(5)>.
>>>>
>>>> But isn't this contradictory? Doesn't lack of APIC-register virtualiza=
tion
>>>> mean VM exits upon (most) accesses?
>>>
>>> Yes, it does mean. I guess the alternative wouuld be then to require
>>> APIC-register virtualization for enabling xAPIC. But also, although thi=
s
>>> doesn't provide much acceleration, even getting a VM exit is some
>>> assistance if compared to instead getting an EPT fault and having to
>>> decode the access.
>>
>> I agree here, albeit I'd like to mention that EPT faults are also VM
>> exits. All my earlier comment was about is that this piece of doc
>> wants to express reality, whichever way it is that things end up
>> being implemented.
>=20
> Oh yes. Right, I see how this info could be misleading.
>=20
> How about this?...

Getting close. The thing I can't judge is whether this level of technical
detail is suitable for this doc. Just one further remark:

> +=3Ditem B<assisted_xapic=3DBOOLEAN> B<(x86 only)>
> +
> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> +xAPIC. With this option enabled, a memory-mapped APIC access will be
> +decoded by hardware and either issue a VM exit with an exit reason
> +instead of an EPT fault or altogether avoid a VM exit. Notice

As said before, EPT faults also are VM exits and also provide an exit
reason. Therefore maybe "... and either issue a VM exit with a more
specific exit reason than an EPT fault would provide, or altogether
avoid a VM exit" or "... and either issue a more specific VM exit than
just an EPT fault, or altogether avoid a VM exit"?

Jan

> +full virtualization for xAPIC can only be achieved if hardware
> +supports =E2=80=9CAPIC-register virtualization=E2=80=9D and =E2=80=9Cvir=
tual-interrupt
> +delivery=E2=80=9D. The default is settable via L<xl.conf(5)>.
>=20
> +=3Ditem B<assisted_x2apic=3DBOOLEAN>
> +
> +B<(x86 only)> Enables or disables hardware assisted virtualization for
> +x2APIC. With this option enabled, an MSR-Based APIC access will either
> +issue a VM exit or altogether avoid one. Notice full virtualization
> +for x2APIC can only be achieved if hardware supports =E2=80=9CAPIC-regis=
ter
> +virtualization=E2=80=9D and =E2=80=9Cvirtual-interrupt delivery=E2=80=9D=
. The default is
> +settable via L<xl.conf(5)>.
>=20
>=20
> ...because with only VIRTUALIZE_APIC_ACCESSES enabled, hardware decodes=20
> accesses to the xAPIC page and the VM exit gives an exit reason.
> And if VIRTUALIZE_X2APIC_MODE is set, although no assistance is provided=
=20
> w.r.t. to decoding x2APIC accesses as the MSR that the VM tried to=20
> access is already part of the vmexit information, VM exits for accesses=20
> to the TPR MSR are avoided, regardless of whether shadow TPR is set or=20
> not for e.g.
>=20
> I hope this makes sense but I welcome any other suggestions/corrections.
>=20
> Thank you,
>=20
> Jane.


