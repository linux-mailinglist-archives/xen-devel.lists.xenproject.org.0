Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE74C8E0A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281559.479945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3fq-0002GF-T1; Tue, 01 Mar 2022 14:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281559.479945; Tue, 01 Mar 2022 14:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3fq-0002EO-Pa; Tue, 01 Mar 2022 14:40:22 +0000
Received: by outflank-mailman (input) for mailman id 281559;
 Tue, 01 Mar 2022 14:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP3fp-0002EE-3q
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:40:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 846a9d90-996d-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:40:19 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-yx1oQ5sdNVCrWUFfaeoeIg-1; Tue, 01 Mar 2022 15:40:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2326.eurprd04.prod.outlook.com (2603:10a6:4:47::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Tue, 1 Mar
 2022 14:40:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:40:14 +0000
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
X-Inumbo-ID: 846a9d90-996d-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646145619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Tp6eeM+bJVVLPcsHvwb5t5ic8e0eWZrXvqaygMrey8=;
	b=AvAE7/fwGpSl62Mu6LqI88pasOlANnXRlUF1PQ5dOD8kc/aq5UMovoB/OpngquAbH44rHW
	+/ed2lA2N5y5IphCEnYTQejxraVnQQFZGVLRSHWnU1zd2Uonw809nUnxswqboAhU2B6fvY
	iImSzyIZuDH/ftHcd2vHDAtVf2MWUYA=
X-MC-Unique: yx1oQ5sdNVCrWUFfaeoeIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PifrZlDFm1nqTTnG4KOvyoQqRAdZddoIrTXMtyBL6/oF/LmJZZmOBoBPkry1J4pucAf67aJ1C88hGLou36bApoeqB/ybgm2Y9NDkzi6xOWMYfWovK8fPnyC/uVNYz5lMQAx+ieeGZ+hQ+JpZ1urDsSdhXlQYWDkIUW9AnnQlZdBdfx6n3q+ijS3Dme6Fl1dGrfSTfVBUcCbwgu0SIqA+qe7e2dZx8vFGRc/fMsxRY8BdMDtS1Y5OKsWLw+iVljfstwFbEjMWFfelZS50p8KC7LLlSRu7XbWCnU8NecvAE6o6WNd4ZRRNtTfvjaISEG7lJS5BTbgeawfs3vQ6R++ULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+3+5dA28raY52aHpc7KzJ6+oTJvxhqJIrB8LChS1A4=;
 b=Hu2uPspnWOPGe/rT7iptNLr087gMN6DDHFtEJlvTsGkGsl4y/1a5iGfY1cCwuYofoWgVDS0Goj0YdEyrgDG/PH+nC9jIqi6hfTQUY+Se/2SoItlkNcm2zeCCnb5nGvdO0NMSUyXnrl7lwo0mPGfvjgI5bH1x3i2cYfw/uYObgQwwoPovjVnhLCa91gFnUE6mvsZJFyNerKmJu9jrShbhOHmqLnW5zB9ii8cBhQkjwendPUmbBLN8L2r0Ls8B+PhMOioujVq5banyyEAY5dYy5Iwev7FgARfpXDfqHO4KST7Qn0SeMWVG1UFejtHApaKHvqs0J/BFET9nfOZgQpPcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <152549ca-37b7-47f3-3b63-2d2ccf8070ad@suse.com>
Date: Tue, 1 Mar 2022 15:40:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <YhyrAyxhNtNWi7NY@Air-de-Roger>
 <9aff51c2-0e8c-685c-7bff-0ed7ff7347c7@suse.com>
 <Yhzr739VZdRLWnok@Air-de-Roger>
 <6b59e3ea-01ff-e26c-02d4-3b11594fd7f0@suse.com>
 <Yhz4yShnpcyq5IDM@Air-de-Roger>
 <60bcd74d-5686-9813-e3a6-b28c15b66a22@suse.com>
 <Yh4riyoA0BGgfAYi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yh4riyoA0BGgfAYi@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0017.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4bde3d-a4f5-42c8-f726-08d9fb9165c5
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2326:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB232603A7624A10DBBDB93B62B3029@DB6PR0401MB2326.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a3WiOBdWFr0uLAuJNl9A8Pz62mjFzfgBZsejDCpaRiHvnuNf+WB0lkMxhQOd1FdXx721HSxL4VeFdEFk+ofGnTplEnmx6G3VWPQYI2P33I1vtAnS2rrjwlvRrEFXz9NKN+I7up4Br3kZA6rQX12o3CvXkvFaoDkitT/6QS8//MNVGHcsZyZ9Cw5rJ+gYExYvpXu+hR2RmGk0qipjg6EbHBnxEBDV0TGreL4q/GH8c7J5AWjBfWgwu+zlPVEpFskmWOcuJYZW78NsYKZ/nWY8hNcAONS/N9mjsb6gSvYHF3z0FU0Z0YWYqaz/efNOo9t08ab//v88zaGRwN0ZvALQCCV83xbIMC7KV/vgrbrBApL6rjJqJhOIFJTf9IB9+cccYvf5smLK/c1w/1sZMjc2otGTpLIgGKIv4Io7+Vdum0ORpoxgN1JAmNkFDnxGzzwVXObVwtCI56udxR2x3eJmPNggQU+7Yur2bztHdiEYG55kxS9NqpwFAdV3lReFAJ+onHpLaYwkHaolKyf//rtzg2YA5awaHz6ugnNQhq9+ak12XeCtNER8243XK90XIylFSTvBSXWM3p/Dt+h+Zl1s1J9IORrWn9lJdOE3+xC2c1D6+mEgyjh3y5KS1q29197XGebUET9Gsw3ciMAOnHainJLfGo67/lhscPGrZ+I32ofV/CVklfTSBkh8UILcYacQRVY58n5Qc+d8p9vHdie0A+z79sH7ixN7o2Lb++YEsxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(38100700002)(6512007)(5660300002)(53546011)(186003)(83380400001)(2616005)(26005)(2906002)(6916009)(316002)(8936002)(54906003)(4326008)(8676002)(31686004)(6486002)(66476007)(66556008)(508600001)(36756003)(66946007)(31696002)(7416002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SViXnrNLyiz3pJwbf+gBmPlsdn4r3GO5WgPEO0FXbN+IA0eCiBwrE66KzK8?=
 =?us-ascii?Q?JLamUKY4GAzXuYaxk5HWbjL5qDewaflz5YTOiW2pcGUS9FnDdRlz0KLN65PI?=
 =?us-ascii?Q?otxtApY7Bmb+qzYw60F9Yav2082eC2K7Dr9b8u9atH61ADnD5lhJ2wInRN0d?=
 =?us-ascii?Q?oJ56cu5LIto0NcyChuiEne9BSzmrpgnb5lqJqet43sjWQWLw0kuhr8fdEgzO?=
 =?us-ascii?Q?vu8cWs0v3FCojbKNFxvW8xOZe+5OWrTpyRhjBumU+a72IVXFFI3TaLNh62Mh?=
 =?us-ascii?Q?T9Seu9DUyf1TcmnZ6BPwRgWOzANjcqVotDyne5jxC3t6OhoJ2xnoeqISOJf7?=
 =?us-ascii?Q?MHKepdscSgZX45skh131rVzUM0g8Hq5K4ctWmwEdHeyDIOP8MLShZXrv32bK?=
 =?us-ascii?Q?Mi++QIRuDC39LPNfypNzaoM746gDKfym86gk+Po6VJIeiZdLb/fRClBGZzog?=
 =?us-ascii?Q?D2Kvk7YdEwS/iUUGpgGYOJyIAO1CK08Dm5M3dyfz9oLjLZ0Vsz2FAhw6NPzc?=
 =?us-ascii?Q?zz8K/VKVJ1raxl6FnIbM7U7KXYnOUYP+FniRHr626eB3WXNgKYm2GYMkl5Bv?=
 =?us-ascii?Q?sZxIUZzlHW5VsVl1rB6Ij28TwB3++yI4fjuc50rL+blX7nV2UNDrNRdKDnP1?=
 =?us-ascii?Q?6c8rmP0y2ghG63NYx1fWhMIBwQ6TUq0W/D6NOH8s8H3RCvBwhTil1nPHnGlH?=
 =?us-ascii?Q?HMQcYRaSfAis+8nNzU0YUPIrcI3XGN54ZRL5wkhwyJd3tzgVJ1HSyeEzvMB+?=
 =?us-ascii?Q?c3CH2IZtWBav0zBNUHqw40eWCrCeuNitkG0d/Wss1obCU94auJGfxwon/Pnt?=
 =?us-ascii?Q?b6vtFJMjtzeQH8NywHVh9YEMSEQBHuvZsAUfRmDoP5E9Veh22G6axkcv19CX?=
 =?us-ascii?Q?+wifCqfrHoNGCGxQZP5dw4GI77dCPYbdEuj4vgtOANJ3nhmACIrBaylCJERQ?=
 =?us-ascii?Q?lf0tCBqNEWp27P4upFOxdLzLwQsyj5SUKEWanykVaEbw0Rg1y8ajdVIeP5XQ?=
 =?us-ascii?Q?29i6nHBc2hkE3NhLZk5dQDyN85UuXdn4+yDigOYlyDZkmNoCzMQ3QVjq6kFH?=
 =?us-ascii?Q?N/0KnIiyPwi7SNlmDqTrNJFaszNOnG3MG9cQmQH6YDd/5bzz3KwnnXrFrnK9?=
 =?us-ascii?Q?GB4Mr+8R6890+RYQsObxJ43jibV811bmNZDHyB33+B3mWVMf0ardEHDnY00s?=
 =?us-ascii?Q?NqOokRoNRqIpn7a5+TMzxmx4tLHJq5HuEbvWhzcNuue9isOvD+7b6O5DnDwd?=
 =?us-ascii?Q?k5OgvyPV3Sh0Cov147wa7EAIMsRkihIEHA6BZ/55DsdMl6eodX9IAaEDS36q?=
 =?us-ascii?Q?NNoM8z9B1pcv9zsxagsHFmPSkoRN474krEqOe6rajeoMmcRReKz5Xp9aSCEn?=
 =?us-ascii?Q?Kpmoc/Ms72BFhtEeOycoYGAmPvKvoncWvdM+xVaIzrzyw1fnbyVXUzmKJM4d?=
 =?us-ascii?Q?ZDzg+m7bquQbdtjzon8QzzqISWofF+/QOYJB0wVBKTvdzkIlGysZvIQS6wad?=
 =?us-ascii?Q?0HCkuXwJQhfXYM5haKg9+QxH43EbDgloVWKnRaHeys4VdDs9LYEldDDcGkGk?=
 =?us-ascii?Q?GNY+uddn8K+hzMMp9QGM13TEUVeudRd9ualvsQgQPWP4vpOoCNjZoKtSy2LF?=
 =?us-ascii?Q?TLAs02fFyGpKLjYKd4NCQ6A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4bde3d-a4f5-42c8-f726-08d9fb9165c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:40:14.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9Qdym0WiZwq4WWMfKBqiUjjI60brcYcnzntw7LVQKeHisDMpq8bP1vtCTRKlVtJ9webQPT4XFG0AsrYRdgiJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2326

On 01.03.2022 15:19, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 01, 2022 at 08:51:59AM +0100, Jan Beulich wrote:
>> On 28.02.2022 17:31, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Feb 28, 2022 at 05:14:26PM +0100, Jan Beulich wrote:
>>>> On 28.02.2022 16:36, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
>>>>>> On 28.02.2022 11:59, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
>>>>>>>> On 18.02.2022 18:29, Jane Malalane wrote:
>>>>>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xap=
ic
>>>>>>>>> and x2apic, on x86 hardware.
>>>>>>>>> No such features are currently implemented on AMD hardware.
>>>>>>>>>
>>>>>>>>> For that purpose, also add an arch-specific "capabilities" parame=
ter
>>>>>>>>> to struct xen_sysctl_physinfo.
>>>>>>>>>
>>>>>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>>>>>>> ---
>>>>>>>>> v3:
>>>>>>>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actual=
ly
>>>>>>>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>>>>>>>  * Have assisted_x2apic_available only depend on
>>>>>>>>>    cpu_has_vmx_virtualize_x2apic_mode
>>>>>>>>
>>>>>>>> I understand this was the result from previous discussion, but thi=
s
>>>>>>>> needs justifying in the description. Not the least because it diff=
ers
>>>>>>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from w=
hat
>>>>>>>> vmx_vlapic_msr_changed() does. The difference between those two is
>>>>>>>> probably intended (judging from a comment there), but the further
>>>>>>>> difference to what you add isn't obvious.
>>>>>>>>
>>>>>>>> Which raises another thought: If that hypervisor leaf was part of =
the
>>>>>>>> HVM feature set, the tool stack could be able to obtain the wanted
>>>>>>>> information without altering sysctl (assuming the conditions to se=
t
>>>>>>>> the respective bits were the same). And I would view it as general=
ly
>>>>>>>> reasonable for there to be a way for tool stacks to know what
>>>>>>>> hypervisor leaves guests are going to get to see (at the maximum a=
nd
>>>>>>>> by default).
>>>>>>>
>>>>>>> I'm not sure using CPUID would be appropriate for this. Those field=
s
>>>>>>> are supposed to be used by a guest to decide whether it should pref=
er
>>>>>>> the x{2}APIC over PV alternatives for certain operations (ie: IPIs =
for
>>>>>>> example), but the level of control we can provide with the sysctl i=
s
>>>>>>> more fine grained.
>>>>>>>
>>>>>>> The current proposal is limited to the exposure and control of the
>>>>>>> usage of APIC virtualization, but we could also expose availability
>>>>>>> and per-domain enablement of APIC register virtualization and poste=
d
>>>>>>> interrupts.
>>>>>>
>>>>>> But then I would still like to avoid duplication of information
>>>>>> exposure and expose through the featureset what can be exposed there
>>>>>> and limit sysctl to what cannot be expressed otherwise.
>>>>>
>>>>> So you would rather prefer to expose this information in a synthetic
>>>>> CPUID leaf?
>>>>
>>>> Depends on what you mean by "synthetic leaf". We already have a leaf.
>>>> What I'm suggesting to consider to the give that hypervisor leaf a
>>>> representation in the featureset.
>>>
>>> Hm, but then we won't be able to expose more fine grained controls,
>>> ie: separate between basic APIC virtualization support, APIC register
>>> virtualization and interrupt virtualization. We would need to keep the
>>> meaning of XEN_HVM_CPUID_APIC_ACCESS_VIRT / XEN_HVM_CPUID_X2APIC_VIRT
>>> (and exposing more fine grained features to guests make no sense).
>>
>> I did say before that once (if ever) finer grained controls are wanted,
>> a sysctl like suggested would indeed look to be the way to report the
>> capability. But we aren't at that point.
>=20
> So we would expose everything in the 0x40000000 range, and caller
> would figure out the position of the Xen leaves doing a signature
> check until the Xen leaf is found?

The leaf number doesn't matter. The FEATURESET_* constants are part of
the ABI (just that the names we give them aren't in the public headers).
There would simply be a new FEATURESET_x4a.

> I would agree with this if the hypervisor leaves where already part of
> the managed CPUID data, but the work required to expose the leaves in
> the policy/featureset doesn't seem trivial. Making those leaves part
> of the policy will likely be done at some point, and then we can
> decide to drop the sysctl bits.

I may well be underestimating the amount of work involved. I wanted to
put this up as a possible alternative. Seeing that it's not liked, I'm
not going to insist to further pursue this.

Jan


