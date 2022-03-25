Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12464E6FC2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 10:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294615.501011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXfrn-0002Oj-JF; Fri, 25 Mar 2022 09:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294615.501011; Fri, 25 Mar 2022 09:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXfrn-0002MZ-FL; Fri, 25 Mar 2022 09:04:19 +0000
Received: by outflank-mailman (input) for mailman id 294615;
 Fri, 25 Mar 2022 09:04:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nXfrm-0002MT-4A
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 09:04:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c82ffc6-ac1a-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 10:04:17 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-sYkEmkfjOa2LmG-XreTRJw-1; Fri, 25 Mar 2022 10:04:15 +0100
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by HE1PR04MB2969.eurprd04.prod.outlook.com (2603:10a6:7:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 09:04:12 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::5413:50c3:f5e8:d90f%9]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 09:04:12 +0000
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
X-Inumbo-ID: 8c82ffc6-ac1a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648199056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MRId9/P8+thvn1M2YI6hr0OA7Vd58ZC6sg5a9lbD7UQ=;
	b=B3ZrMb8NwmNFs+6YwXwEDurX8BX8N5lvrH6Z2cehDQp3aEuyyn+adoVSmzkj/xGxRQgdQK
	JMnJu9H/EFm6v1RwwEmJQMkX4jJov0RexoNeOe0jnRudfsROcrlKQzdolvBlvvDgsyxyx/
	GxJiZqvj65o6kenRgjZPC/fRccmjH2o=
X-MC-Unique: sYkEmkfjOa2LmG-XreTRJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq3bwcpp/2G4Qfv5ln/OglqmWcTbSc+ybS93rbTDXZdpr7BZc6oQ06kFl9pMk02hFp1zPo8LczJv4fHwuq8uhfg6y6GZ2oRgVje+jE8bkdtx95zXSd2eP44gqyv54E4nfRVoE93h2LKWDBPyXU3y+2qq1CbTayXSl45fVE+bOn0sO85mxasOHrhMOb9MAUFk4tOY9CFIh4dfV9BSGyF7X/bXOqVzULKD+E194fNALwJvkQ9tg7FfUlzyo1V6P5p1DukW6XxBFGbqHK/PlKkJG7jXLJsprAw0Dtu+Ifq9K8pCSAyMPAd6S3n9JMjkLb2QisSXHqjW0I5Divpm1IVd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ8l/2BcuZozdEUVZ7R72SwDOUWwjW+dyVeQZT/kfFY=;
 b=GNiDVG+KVIu1HL/J5abPdmQ8AN/XcY1uhoQD0pBXa6hHMUrAwBXiJkihvE+IH2lkWoMh8A1CfqNBpOuLcKNznEWDQPxZzxzHt9mmicfvmnbPDPz12GsnTxJC7of3UBc1s7PIe30lenAZ9w/ME2q1lMyth4kGuMnN2BxvIJQKGQMtryqlmsGeZEMH/5T2+emBzlc7yagoI3q+hE0HtZbNFSQeWd3NPyinHNJ5Yo7BvX3f3ODfdumzjS4JVK0+4D0uB7TH7MXLVxRkt1eU2qonPH76BohkFeevcUHEJf+kb+fT8WqS5MKaKMYxriAnA5oYXf3VAy4ecJCA50aEGBcPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bcc54d8-e766-1d53-6bc8-bd67f8838d73@suse.com>
Date: Fri, 25 Mar 2022 10:04:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
 <YjySMjegTNFBE5RK@Air-de-Roger>
 <CABfawhnnAehxaByyncaYAjSSbddJi8yeTnjcXX_a+st8Q+C_+Q@mail.gmail.com>
 <YjyWW2CkQv1ckvXM@Air-de-Roger>
 <CABfawhn-QiUBuq9c4tzr=9nL=J-ntm1hf23mbeRu-qCAKRDj1Q@mail.gmail.com>
 <Yjyfygi6pE+UVhjM@Air-de-Roger>
 <CABfawhkQoOnKv7OWNus0WBY4CjX+1uU1ZeZgQ-mU-sRtQFE3QQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkQoOnKv7OWNus0WBY4CjX+1uU1ZeZgQ-mU-sRtQFE3QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0144.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::10) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c729e28f-1f64-4990-8035-08da0e3e6dc4
X-MS-TrafficTypeDiagnostic: HE1PR04MB2969:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB2969E51113066F9B2B565560B31A9@HE1PR04MB2969.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+dE0iHjQu/efzqiW+87PeVd7ysDG21jhWWylieigQ2SbIM4N8gzxzXvdFRk19LzMnL9RxLI0+Si10NBBTlkUa8/tw4kts//7qehkWAJWJyRhvDgZUtYiI2Fp724NT37hFroCSDiZ5DLWVV99904V1mJAVkKdprU4zdummdChAcGUpunU94+OmkwM86Yj3FKCSEOFmIse2w9FRb/+gasfhtbLB7EDGOe/xvncYUVrg9U0CKS8kNYLTICjPJ7xHi+vtJqa6hhHt/D4bEGlz4mrFYgxshNIHu2odP/FY2MYzcE0YdtpDnWCuDPQBN1InHa37ZKXxK4GL4U/Qv9ASAGQeZXV6bnsOlDRzo7dRhXhaBP+S/2QJlhXhEGmhHFrq/a49cNLOLFyW8MqaxHUMVg9NxuK++bx0oyJoyCbIHrPkXNpWeJJt6H+Y6ATxrDalDLg8IndUgX2lrWJq0OtAUiWUjcloC/6aVBS+J0es9thekK7JrvKD9a0uq4qeJ0H/ZsjPox646oZa48p7GGUWCJ6paEsY4AZS7/hbmThdTfkYsw0jDqNH/+vtv/wihZOd0B2hVcXQqC8WQXNw0sbYdnRCSKEz7u7ZJK1cycxU3RVQDIFizQgr3J1m02tWX2qy8Lbz8gTYdTRP5yXI5Vnu+yNBZnr8s5rBvrrvDXGRuwcUl81q33LINcaeezRWcKji53T9AHfgasUZTdwk9zBXv9f0au/g4sfu5oV7YcvhCCXZSAMIotl9Cd9ZvHIbD2lQig
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6486002)(66476007)(508600001)(86362001)(31696002)(316002)(66946007)(6916009)(54906003)(66556008)(4326008)(38100700002)(83380400001)(2616005)(186003)(6512007)(53546011)(6506007)(36756003)(8936002)(7416002)(26005)(31686004)(5660300002)(2906002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qihxHjh0lgvRiLLeONTFZ7PcdTjlD5YzITxh6fhj9uuFqR0rgzKDOvzbf0Nq?=
 =?us-ascii?Q?9UTvNTJoSt1My+OulIIg1eLUpFtkDkl91/ZByoZ8tB+gsPRxqCYE8HeN6VJ0?=
 =?us-ascii?Q?kX4PxHH268gkUte1MpMAHZ+E+py6yFMuc3HZkAELV7bfPV8l0mAqjgzLHaIO?=
 =?us-ascii?Q?cShS/vPFCr1pKYikLlZcVja9qiWh6siMR760a2iTdh/60Pk0f9MPwg9hA37E?=
 =?us-ascii?Q?uYZIcV+XI2zqZmku/k+ijeD6qPPkavY949WndA/nTX2zcZs1F+9rorhUDsSF?=
 =?us-ascii?Q?VyXoG2PJJFSdPeYkBMwp3YiX9n809UDrpzAgzEAEbRAvYuDrapUP46XIX2AG?=
 =?us-ascii?Q?JLSsOf4g/ugKDSNMYNaDUbPH/xtP+QxW9vJV9fG5PQJiRRgcPxPC2BPPzH1e?=
 =?us-ascii?Q?6sJ8OGyiQqKrAg2CvEvAeIra49b7U+n2TjNDFcy2Dej6FkxEfgezNFPWkW8I?=
 =?us-ascii?Q?Tmo3NT7qBxwNtGmty84QVTSvdNd5dWpXY93r/xP/nMl/sDwuLwveXcSpcnkB?=
 =?us-ascii?Q?yJKHhDrmt/OkF4PW9Cd667p31Cu/iKm/y7RZKOm2IqgobVdsY8a1Ez3iaTAB?=
 =?us-ascii?Q?6QDgfdt4YgWbi/Wt+EbIfU3adGzIc37hj2QAfbmA5eVSXqczABCQIOcx2Abv?=
 =?us-ascii?Q?NxyV2sHXtAOlfY4qFzpOijsb+I7jYrqWcxieNgpFsQGQxGkE2rXLoFCB0kzP?=
 =?us-ascii?Q?BH+dss/n0mC7Vy0RKv+Y45GVLIoIkxFC5VPEYlI+WBfqX6Qyw+evmBTVQJxg?=
 =?us-ascii?Q?89/bGOkjvJqMor0dXbXuvZBzbNTtabs43CSeZTomTJ18eHkMW2hM22crXuFX?=
 =?us-ascii?Q?jbjf/PSYHPgfFvpm04Zd/UcoGKCAwgkT+xcT3++5ntvj9kIgpg07Iboz852v?=
 =?us-ascii?Q?2GXANABZA0TpmWTnwr4iCSxC3MiKKpEX4jY1ju0S1DEXeMDdTwV/eEz1Nlx+?=
 =?us-ascii?Q?7uOL/GOQbgc5nNToT4vf48JZPNFkxIt+irlvWoth8cF4bdBHfjoDqZIBCIcS?=
 =?us-ascii?Q?+QVu1lX6IjeCUFZS+msyEayzS8LAgvZJFVJmz5l93KMiTmIEB3pGVEWPegm+?=
 =?us-ascii?Q?mj1a3ppe4HgKfHozd5YFNP/Gu97YNqDMn8oVlBBtw/fQZd+ifJZb3W4WHxSS?=
 =?us-ascii?Q?cpEmqJ9Dvr5XoTSeBxNwyYeMlUHJ1biJm4Lk1FlFMj0P4QFkQmWe2UZLXBnu?=
 =?us-ascii?Q?UxL8W/9FXvpr44Yu4H5ByiNAP024ylFBoSpbY5YEmCRcXPxCcCGSU1c2NiQX?=
 =?us-ascii?Q?I9/CzLvB8+EahlAcpsUNsP2CmhRaQFGtKEaR5iHfOaY83VhoLY256Eu/monS?=
 =?us-ascii?Q?r3Y9S9UxapjwWGA1ET08GgzmNIVOB0Xt9gjhKC0boFF83HdOkBzkJYKPzDKU?=
 =?us-ascii?Q?v5Ni9wRJVte+6Nh7C/OamksvtrOUxrReucusWiyNjNFbqopaXNBgvP2WEafR?=
 =?us-ascii?Q?NYI1sx/z7s9u0hshWUcBLRgHNgLOrYd2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c729e28f-1f64-4990-8035-08da0e3e6dc4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 09:04:11.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsyK2vWyHNAN7o+qaoA7ffOrxMOQHwaxCp8AMBHhs6dwMN82Bdf4CU41zQv8onUlAvkgniZYaPOEyzSICaSGyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB2969

On 24.03.2022 18:02, Tamas K Lengyel wrote:
> On Thu, Mar 24, 2022 at 12:44 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
>>
>> On Thu, Mar 24, 2022 at 12:22:49PM -0400, Tamas K Lengyel wrote:
>>> On Thu, Mar 24, 2022 at 12:04 PM Roger Pau Monn=C3=A9 <roger.pau@citrix=
.com> wrote:
>>>>
>>>> On Thu, Mar 24, 2022 at 11:52:38AM -0400, Tamas K Lengyel wrote:
>>>>> On Thu, Mar 24, 2022 at 11:46 AM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
>>>>>>
>>>>>> On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
>>>>>>> diff --git a/xen/include/public/memory.h b/xen/include/public/memor=
y.h
>>>>>>> index 208d8dcbd9..30ce23c5a7 100644
>>>>>>> --- a/xen/include/public/memory.h
>>>>>>> +++ b/xen/include/public/memory.h
>>>>>>> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
>>>>>>>                  uint32_t gref;     /* IN: gref to debug         */
>>>>>>>              } u;
>>>>>>>          } debug;
>>>>>>> -        struct mem_sharing_op_fork {      /* OP_FORK */
>>>>>>> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
>>>>>>>              domid_t parent_domain;        /* IN: parent's domain i=
d */
>>>>>>>  /* These flags only makes sense for short-lived forks */
>>>>>>>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
>>>>>>>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>>>>>>>  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
>>>>>>> +#define XENMEM_FORK_RESET_STATE        (1u << 3)
>>>>>>> +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
>>>>>>>              uint16_t flags;               /* IN: optional settings=
 */
>>>>>>>              uint32_t pad;                 /* Must be set to 0 */
>>>>>>>          } fork;
>>>>>>> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_=
event.h
>>>>>>> index bb003d21d0..81c2ee28cc 100644
>>>>>>> --- a/xen/include/public/vm_event.h
>>>>>>> +++ b/xen/include/public/vm_event.h
>>>>>>> @@ -127,6 +127,14 @@
>>>>>>>   * Reset the vmtrace buffer (if vmtrace is enabled)
>>>>>>>   */
>>>>>>>  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
>>>>>>> +/*
>>>>>>> + * Reset the VM state (if VM is fork)
>>>>>>> + */
>>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
>>>>>>> +/*
>>>>>>> + * Remove unshared entried from physmap (if VM is fork)
>>>>>>> + */
>>>>>>> +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)
>>>>>>
>>>>>> I'm confused about why two different interfaces are added to do this
>>>>>> kind of selective resets, one to vm_event and one to xenmem_fork?
>>>>>>
>>>>>> I thin k the natural place for the option to live would be
>>>>>> XENMEM_FORK?
>>>>>
>>>>> Yes, that's the natural place for it. But we are adding it to both fo=
r
>>>>> a reason. In our use-case the reset operation will happen after a
>>>>> vm_event is received to which we already must send a reply. Setting
>>>>> the flag on the vm_event reply saves us having to issue an extra memo=
p
>>>>> hypercall afterwards.
>>>>
>>>> Can you do a multicall and batch both operations in a single
>>>> hypercall?
>>>>
>>>> That would seem more natural than adding duplicated interfaces.
>>>
>>> Not in a straight forward way, no. There is no exposed API in libxc to
>>> do a multicall. Even if that was an option it is still easier for me
>>> to just flip a bit in the response field than having to construct a
>>> whole standalone hypercall structure to be sent as part of a
>>> multicall.
>>
>> Right, I can see it being easier, but it seems like a bad choice from
>> an interface PoV. You are the maintainer of both subsystems, but it
>> would seem to me it's in your best interest to try to keep the
>> interfaces separated and clean.
>>
>> Would it be possible for the reset XENMEM_FORK op to have the side
>> effect of performing what you would instead do with the vm_event
>> hypercall?
>=20
> Yes, the event response is really just an event channel signal to Xen,
> so the memop hypercall could similarly encode the "now check the
> vm_event response" as an optional field. But why is that any better
> than the current event channel route processing the vm_response
> encoding the "now do these ops on the fork"?

Well, as Roger said: Less duplication in the interface.

> We already have a bunch of different operations you can encode in the
> vm_event response field, so it reduces the complexity on the toolstack
> side since I don't have to switch around which hypercall I need to
> issue depending on what extra ops I want to put into a single
> hypercall.

The two goals need to be weighed against one another; for the moment
I think I'm with Roger aiming at a clean interface.

Jan


