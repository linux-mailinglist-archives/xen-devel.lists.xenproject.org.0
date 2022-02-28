Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FA4C63D2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 08:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280173.478015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaWF-0004ZU-TZ; Mon, 28 Feb 2022 07:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280173.478015; Mon, 28 Feb 2022 07:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaWF-0004Ws-QX; Mon, 28 Feb 2022 07:32:31 +0000
Received: by outflank-mailman (input) for mailman id 280173;
 Mon, 28 Feb 2022 07:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOaWE-0004Wm-6a
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 07:32:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b69ebb-9868-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 08:32:28 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-3QOJmHaINY2B7vuDJZEA-A-1; Mon, 28 Feb 2022 08:32:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 07:32:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 07:32:24 +0000
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
X-Inumbo-ID: 94b69ebb-9868-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646033548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIEe3hY3fV9EBs6DUgYbFBLUC7pe1lAdEmYvL22XwHc=;
	b=BkpkeavWgjxtH/Ow/XuPunPdr/VF5CqkVotS8CZmbvhHCagvidozOl7jbJAVv2AtOungwf
	07aDrr4eMb3aB4rOICnu79HXFszzs1xZ3t3YP6DY3e45lkkjBJCfv74LwKhFMlJkYOneCg
	IScjuTd38BpvDo47vqpbeS/bMt16EJk=
X-MC-Unique: 3QOJmHaINY2B7vuDJZEA-A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dtb8vd83m0CsJ9NguGaxRxZ0HPVozU2n7Qi/EYXNRwDq42WEGzjvhsZsj9gPWTkDJlSkhugiDdEFDssEWeGjkHj45CqdSG5JmQmmHq+FqqV/oNtBKCb8baLkM+BJ9UoFDb9FnaZMkFKHfcJRuZFtWhZjt+xGPndhr2j1siyQ8hR1Yqw6hxzdHJHppUnviw3cdZ38q5iFfVjyZCYRbBzqGEmaAcDtLtkMdb3R+1fvrAPEXoykVqn6OR79pBbUFkMUPwa1eBXf76/Tpo/B1kPOzdBsTIURGeZ2aCLMQTqkAk1CaaJuBviJbYPQJilikk0u5hQWAwQbwbNQq+/pUmhaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIEe3hY3fV9EBs6DUgYbFBLUC7pe1lAdEmYvL22XwHc=;
 b=Mz25tU4SR7d9rGQHagWY/kpn1ekz+ZvIycqXfzs1Vbe0yfas/01yeX/WWlX1z4ITUu6bhc/ww1RHpTZyxL4RZk+2ev76MqkFIHdlSkZQgEaQ1YgBp6nhgW5RiOVcxd6b+jALzXyURdLMnxoKXUEPc1IoBIEBYt7JiFBUbVQ/UbzmkYQhquIOQDyrjlhVpDR8u+XTqk6LoM+/+uH99b4iMe7PhM2M8qmAas3doEivj4tyCZP5NpfPSyKvz22RB0Ioq2npWXf/Mx9cZXbRiOD44O1lBo/3DB39Nfc8hHJeOZ+jG7fzrRwKYZbxYr0GneeBdd03EnkC1cuylCV1dQBWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de431523-ad71-1cb6-a28d-07418886ee23@suse.com>
Date: Mon, 28 Feb 2022 08:32:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
 <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22ae35a0-9df8-9357-4b44-2f00586144fc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9accf07e-ec40-42cc-67dd-08d9fa8c7690
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB88977AA5E84AD1EF5D853490B3019@AS8PR04MB8897.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aDKcpVdl5CL6aqrooO+1CuDYztbVvM/8b1LJYFW5dJKdtLG3SFJ+07C2bMbBShM5qblCLvX5IR88Q2Q58YIGc0fiFUYkMTy8dp4fMj36A/P9LYVh9uV/s6eaEBusmJY7gHNR3KtfIMUoilASqTk5ylea3HegliGUgXF8W7i7ITW0Bce2pDjLMMEa2solecSBrvfCWpFVjLBJIBxMztkA5NRIP4fcH6FNMgza4fWln+3xWrddFMdvzCnZC8FecYJw8/dERzNWhSuhGJ6rLHsZIAFrzlfX4zQB07Pc6PliB+0NaipbiOHsHN/itDBrZEsF2CZaH+dtttcH5ja/1Z/D099E6JW808ZQOmhd7tNyBtHAiXbHbXGCWrIty6qFuX72AO5HzZDLJuFGKWpegEtKOU/1BN7O02VqftKKnAzkME6nd18+XWzxS18mbgnXwHQx66xx7F4+5wLQ4lUro0CEqWUqZxkj5k/ecfUaBTCeUyPtESmLwQiD2yCM2tmwqHPRHRzUIObSijcMwHT7lA0KU++/Pm4GoQTtKumgq88hUIeu7EMMtUHN4aXjHunoSxSxy17mXjr+TThL9HnCHXLG7tcT0nQtS9KMbLAdlQDb8J+b13n4HzoeZkyT+xaUshHxPUUt0ZOdwaN2ifgarQfrbqB73ek3xd3xjQTzoF5rTkvVrOVUqIv49PzyZsYQQ7ZcsWC95N9gSkQK8E/EiN7svUzS9VjcuABBbU5Jb7Utufr7d4vmgoYhIepIwfYRt77u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(38100700002)(31696002)(66556008)(86362001)(8676002)(66476007)(508600001)(31686004)(2906002)(66946007)(36756003)(6486002)(316002)(6916009)(54906003)(4326008)(6512007)(7416002)(5660300002)(2616005)(8936002)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGtUd3hQNEVGSE9OTVFKS1BiaERHbzhXUE1XSEgvaDdtM3F5Y0ZISkZnUVJh?=
 =?utf-8?B?SEtNblJqREVjQXM2M2ZpUFZDMGNVV1hzbVlCd2xDSnhVTGxYVzFZZ3hUSjRZ?=
 =?utf-8?B?dUZzdy9QNi9peDd6KzA1aCtuSXJkVjhyZ1FxY3p2dUdnWnRhM3ZuZ25URVRF?=
 =?utf-8?B?RXoxNHAydldqMEtjY0ZoS2NnRytuU3EweVE2OUx1cUZjMXlhODdQT2piRG4x?=
 =?utf-8?B?OC9aV251ZHkxdDdUV0VyUDh2M1VmOStGMVV4V1RxbEZQclBCcVpnTUtiNEpQ?=
 =?utf-8?B?RVcxYVB6YktmV3U1Si9rbXkxRlRJS0JVZmhUWVpaRFpPNEJ1ZTM4NEtiRjNF?=
 =?utf-8?B?WU1tdU1PYm02WXJxL1NsalVibjRZMHlTY04xaUM0OUdFRVY3UDg0Z0ZiS3hS?=
 =?utf-8?B?R0FPQUdkOTdUVlg1cVZKQ3NjNkJRZ2pTQUY4K01kcW54Q2x0UUltczhWSU5B?=
 =?utf-8?B?YWQ2S3o5Y1pKdGQyNjhjdUpnd2txUzRhaExsZ2tEbUd5emlkejhrVUtCM20x?=
 =?utf-8?B?aHBJeHVsbWpSR0x2UVBMZTRZRDZ4ZGZQUmxxaDkydFdHUzlKOG9MalNjNVdG?=
 =?utf-8?B?Vkt1VHJpZVFldVZJOG9zNUNLbWw0bGRQYm9ONTJXWks5YUp5T0FqaW9sY2t3?=
 =?utf-8?B?UTlGTFc4SUJXQktxTDMxQ09yRzRlcEUwQ1d3TnRUeHFrQVFTc1NNaUdhdkRP?=
 =?utf-8?B?aklBU0FHb3YvZnZCWkRscEViK1NCWmNhaTZEM1NuN1UwbDZDaHFUS012R2hY?=
 =?utf-8?B?blBLYzdBT2ltZzJ4bVJ2Z0tRYWkycVhEaXJOZ3lXam1xRmRweGFFanJqTjdp?=
 =?utf-8?B?QVJyVkg2M0tLZWtMeVhHN1BWdFMrVFluVFgwbGdwcVNEQnBqRmV1R2dXYngr?=
 =?utf-8?B?VkxReEFTVzdyc2UzcXladjF5UXJmSVFjeG9mSy8vYXJQYXNYM2dTY3VsNzBk?=
 =?utf-8?B?eElUMXA3Z0tjUVBCV3RvdEFWMkI1bWIrRHVub0ZPSlNpN3FXTVgxbGpRMTNE?=
 =?utf-8?B?dXpnZnFDT2FJRFBqbjRLbFlaTUMvclNkYzJnbWcvaUNySFpKR0IvQk5nRVJH?=
 =?utf-8?B?dGpOZ21pVk9zTXM0dG9iTnIxNGVWY1dqODNLekx2cFBOcERISE5JTERZaFNu?=
 =?utf-8?B?QnJDdXdVNWwxQ3dpZnoxbjg1ZHdSV0xxYm1RUFE4V2UvMlA4VUkzVHZPeWJQ?=
 =?utf-8?B?U2creVZucmEyYjJ6aDFldTNrOENwS0p4NXZKaTdIaGEvWGVwWGZQM3BqLzVS?=
 =?utf-8?B?QUZZSXR1Z3lNZHM5bHdoQjBLbVBBc3cycVRETFdib3JJTC9EQXhWT1BJdVps?=
 =?utf-8?B?cnlsVE1ZbStZZkZqdnE3bnZOd04zV2poeXdFb0FaU2Z6M3J1aU9kUU1rNHJH?=
 =?utf-8?B?dWcyUEZ5WHFmbFEyekJjd2prdDczbUY5UXFqN2x5SnBxVVU2dzF6ZkRzUXpD?=
 =?utf-8?B?b2xlcDZpWDlQd2htWHNsa01EdHNWYWZ4SFM2RGp6MDhlQTRuQVhZRm9JMzVM?=
 =?utf-8?B?RjU1Sll3OHhGWE5lM1hyYUlLY2o5Q0QxZ2Y3dzg1YjFISkM0MEkrN2lCclhF?=
 =?utf-8?B?QUVzTU53YmNmY3dkek03SzlLTDZDOS9WQXJrTkF2b3YydThwbFd1anZMb3h6?=
 =?utf-8?B?OWZFYnhsNDEweENOWFVocFc4Tjc4WmovYUczbGxaVktTTVYrVkRraUNENDVE?=
 =?utf-8?B?UFJzbFpDamNyNjYzK2RKc2xzN0dIMkJqRUphMmdDUktBS3JoMjhrcS92UHJO?=
 =?utf-8?B?T1N6Q2F0SzVKRThKZEM1MUpMTGx5KzVYaVVoNDVabU8vdDcyVzlZaS84NDZh?=
 =?utf-8?B?T0N4RFdYWnk5Q2hxNGRyK2NOcEZ3VFRNWXdOSlFHQk0vUkUxK05EdEViSVRF?=
 =?utf-8?B?akQ1UGx6aHZjbUVkVjVZS05RZXNCSDUxbzZkMTJPekxjNitMeExKVUlXSzNB?=
 =?utf-8?B?V25nMmsvTWJJWnY4NlUvbUhOOXlCZ2JtUEgxWUFzTzRCUzBUSkN3OFEwblUv?=
 =?utf-8?B?T0xUc3ZkcXYvcU83YlhndDlpUTExb1g3YVgybzhlQ2E5MTk0OGdDeXdDc2JC?=
 =?utf-8?B?Vm0wTXAxaTkydjNmbGpGOVdPdXNEVXBWYnFEWVhSdWFhWFg4TnY1dE1XOHdG?=
 =?utf-8?B?MkhjZ1I3NDlRVVlwcmU1M2VwaDVJWW0xMzRoaVlMb3dKOXFRaGRaMEkvUDlI?=
 =?utf-8?Q?e7iJVJfmdMJsafRFejUkdq4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9accf07e-ec40-42cc-67dd-08d9fa8c7690
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 07:32:24.2895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGrc5UWcmB0lzcls+Ey1dnmPI5PH4htMUE+aNkTM9fonj5N+E+JTCk876/HukS2TRu/JZBruvwxGd71WEmZYKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897

On 25.02.2022 17:02, Jane Malalane wrote:
> On 24/02/2022 14:08, Jan Beulich wrote:
>> On 18.02.2022 18:29, Jane Malalane wrote:
>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>> and x2apic, on x86 hardware.
>>> No such features are currently implemented on AMD hardware.
>>>
>>> For that purpose, also add an arch-specific "capabilities" parameter
>>> to struct xen_sysctl_physinfo.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>> ---
>>> v3:
>>>   * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>>>     set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>   * Have assisted_x2apic_available only depend on
>>>     cpu_has_vmx_virtualize_x2apic_mode
>>
>> I understand this was the result from previous discussion, but this
>> needs justifying in the description. Not the least because it differs
>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
>> vmx_vlapic_msr_changed() does. The difference between those two is
>> probably intended (judging from a comment there), but the further
>> difference to what you add isn't obvious.
> 
> Okay, I will make that explicit.
> 
>> Which raises another thought: If that hypervisor leaf was part of the
>> HVM feature set, the tool stack could be able to obtain the wanted
>> information without altering sysctl (assuming the conditions to set
>> the respective bits were the same). And I would view it as generally
>> reasonable for there to be a way for tool stacks to know what
>> hypervisor leaves guests are going to get to see (at the maximum and
>> by default).
> 
> Like the "cpuid" xtf test allows us to?

I don't think I understand the question. That xtf test is concerned
about checking the CPUID output it gets to see itself. It doesn't care
about what other guests might get to see, nor the maximum and default.

> Makes sense to me. I'm happy to take that up after.

"After" what?

Jan


