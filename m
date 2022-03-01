Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F334C8589
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 08:52:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280913.479039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxIm-0006pv-Oo; Tue, 01 Mar 2022 07:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280913.479039; Tue, 01 Mar 2022 07:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOxIm-0006mM-K0; Tue, 01 Mar 2022 07:52:08 +0000
Received: by outflank-mailman (input) for mailman id 280913;
 Tue, 01 Mar 2022 07:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOxIl-0006ld-8i
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 07:52:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d272ff7-9934-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 08:52:06 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-htxtqibZOoq286GUjLQHMA-1; Tue, 01 Mar 2022 08:52:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 07:52:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:52:02 +0000
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
X-Inumbo-ID: 7d272ff7-9934-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646121125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLudaqPC+mCohs93HfhPPRfaG0gLzOtM22zh6VYWIkg=;
	b=TMrZNbVeat9gfkvuId9PjB7xTZ9LRFJdrhLugCwcVq/R3Rj2m52L097GZ+vOIdtOKmj9uf
	gLFVmvH+BrLcFqbhuklurX8K72mBGQHuaYqLjlKU1tglkvrP2Us4mM+xyUdLpWt9WHxtvK
	5InHwgyhNW+Z+DEEkZcKH0bxF2rWxzk=
X-MC-Unique: htxtqibZOoq286GUjLQHMA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUwYcfMPFSPe5WxHopN9BPGSwUmi92vgdGAg3v3nBwbMNpIes2l3d5bdc1qRGJ279QLFXgW9tA+ZUnNF5kw48LxWZtKkeMb4034KeuGfhZZV/ggDdIqyXvYCCzibUumSjwulVM+E5W2jEeneqtwveKnFAMPzSbeWW//YjGky5a7+26sc4tHNa/D4sfDERGI6hxFyXJKYb3a8AyVf9aP+LBqUvrvzBJOYtN1uzbIviC/uIBfdjykjia1m43xN0zLvucClMxPtriWUabRNXR7Sehe/s38fRZIBankUHi5eFMhDLORPEi44H/wKKtrO7S3hcnm3O6pMkb1iQgNcTUKxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuidF6oeap9VolvoBduf0nkrdW2xCpxFD1bQiL7eRuY=;
 b=KtxbB3h9/dNccqlAN6W7ME9sL6yymQruaER2Fzs8H/09UGGfsap8tw9wE9ArIjgK9xK7fxb6orkDj6njClJt9UgmNilKoc7AfhpBczbIc4wmTDdpaVr6nVt16dsSKgcA/FeQe/2U6iRhyRRIjltRQp0JPXz1FDgCQr1NEIUerLgUSKWfdl8KcR9LquAZVMtfTuUQQw85y34xlxoDLHWI90il+BAYdcLLTl6Iyg0adTRRoz7Qw3mTxgp1vMf+hMhsIaoT2ro+ErXUZcBIyMSuDqxqleg1V0oS6p+/8imTl0zNviJKsAK8jcCfyaUiS8uiKYnpV5Ag36hE6MUFgb9hMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <60bcd74d-5686-9813-e3a6-b28c15b66a22@suse.com>
Date: Tue, 1 Mar 2022 08:51:59 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yhz4yShnpcyq5IDM@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0701CA0072.eurprd07.prod.outlook.com
 (2603:10a6:203:2::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996a3506-f20d-4be0-a4cb-08d9fb585f0d
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3291EBA3F5007D3B7695EC4AB3029@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0hRDOuerqSf+FqZxk31qvNN62t4Wfy3xfixX1Lqhsj+/zAUgJ92bqZ2tRvJeAua0naoBW3c3lcsV4lBB7uRGWS+lv8ErV8VaqugRZzB13KiJV8imZq0QnlTuV7WExjBbtpIt3ydcVWusedY1qxUeGwudXvJQFlMYnPxtVtfMTnOpTBAq1Ht/0fnOiYw8AcPbAwxg9RE+8ylGY3xvRFdFZqSgXdbQByPrnjG6Rabh2+dODhW6obZ3pwECsH8ZdUqd1OxuXWQAx7xRsgMoI8YFSZFT7FL2lNg5cnOf32i8WY+cTSx8dEBbD0RmMpmGkR322vhPBaWePeGawNSoxv5KzqA0ovmb09Bo1GLZQ6T7qPLykjliy9+5vGyHfV4D5KeCO6jZL9HQGfyO0afkBm/0EsKY4lzvr3C+dBVVqofVFx/AR1XAG9O/6wttGZ0fdp/6IG0q/wpSShbmopwgs5FQLNR0pI11TW4XySW1xd1koj6xdA0/+iumnbYJFmf7WFvQsB1E7oyi3gaeiRaf52NgKnJkcrv/eWfW6lcoTxU+pGrn6I0Zy1RZMmWLfJWkHjMWgVmsweR8uMwUtnHnthFBYirF3HZO+lR0kQCJubaAU2hKt2rnl7YEzCihl3Ol1vXV/fI3QZJBhRb+q1dhDUkNy3kEgIh6n/pO3MGr8WEBcCZ2n8LvWUPHVAav9tgYV69QFKzZM6Bj2TvjE8fySQeKX7vqRpDVimgaj5fDIsxAEMbB6slI3MNvubq6m5EpX0ch
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6486002)(2906002)(6506007)(6666004)(53546011)(508600001)(31686004)(38100700002)(36756003)(31696002)(86362001)(54906003)(8676002)(66556008)(66946007)(66476007)(6916009)(316002)(83380400001)(26005)(2616005)(186003)(6512007)(7416002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mtkle632iM2Px8QdpmpPaYQ8sEEVz5SxsCMG1rqh8vz2Lqi+lue9u52N+6+V?=
 =?us-ascii?Q?NisKF6LQOSBWXkVfB7+FAoNYyT1SI8IYZIhD5HUA7IePteBXTO8vuefJX05b?=
 =?us-ascii?Q?hkPs1tB371oj4PG1IYHGgkSI3DGVWShQ8DGrKGdxMViVNMDIO8QEax7hbetr?=
 =?us-ascii?Q?nf1kfD7x08I1D/048MSDBFZUKT4EA+n+uR7VBV8ABbeLd+bA5chNsmgXl6Hi?=
 =?us-ascii?Q?ahaXCNoMLaVHACYY1dHPFt1GUYf2TtxMucUEFgqme/eGWjp1jQ3BYYgtxJuT?=
 =?us-ascii?Q?shuq4AWKhO7gZ3l1xIj2NWpkCwUbJiKK0nokeVQUoOPTh4uJKchSzrh4bqI2?=
 =?us-ascii?Q?7QxBdjLcDXUnWV47qvlDPNC6Vt1NunzPr5X1l+FPJupDTMPGkDmCuAEP9vmI?=
 =?us-ascii?Q?sY1/VejCWqP5+AvRJDGk5mb2GWI+DAKlsVYRGuFhmTdwSt5jyDmoyojiIaeQ?=
 =?us-ascii?Q?96C3X3CBs0WTbePkmiVtRpjYdZtBW+O4XSq4YWQu/UMojDiUWlMtql9RKolv?=
 =?us-ascii?Q?Dg4Zek2dYfCWLCe/kTeCR8daSTIGNO71ITf4kOWso4hUDv9Jy2u77382WAUB?=
 =?us-ascii?Q?9FuAADpjeq36PZPaB+OQye+eQ0vCeulNdlUqrcVZ7CVfhNTGrIxdHPp0Yq2r?=
 =?us-ascii?Q?YtKn3HcRjrZaHzGJiY+XwMG255NyCw3frxHT7ym4vc1l9E4CL8Sqf2MQQRnW?=
 =?us-ascii?Q?BMY+APy0t48WJpI2HUBkth1ZxqWh0zMGBtbJ7Lofxx3uCBM0SBlFptNPVEMr?=
 =?us-ascii?Q?uwi7zoW/ktSC1i9WJhOXEACamIrgAszcuJJJZ7C3OZ+G3ONj9dCLnmliRYBZ?=
 =?us-ascii?Q?WiD5g+X/Xo2pWxzuHHszNaXJOU+xUaNToIqaiZvXVVWdHmE63EXL/Etayd5X?=
 =?us-ascii?Q?AoRh9Yj+p+Op6KNMn21CWGfh5eBJJMWGrO2UQvyrNfihc2TAAYsTAyk9eLvM?=
 =?us-ascii?Q?JImp7O7P5xs1k0wfStoBjbh+fRTwzbYClrSG/Fje9j9DkCK4D3MwBlDgQDoY?=
 =?us-ascii?Q?Qa1dLfzEQJMwF8K/6UzS/i3ji6SxqSsIaGAH8sqQ38MwCAEJdMPxkmlOpAzQ?=
 =?us-ascii?Q?5H3B8rcv082+XHmEOmqCbxDVu4G38moLXgibsXVRFCcLn5IjU6AyfOoZ7HEr?=
 =?us-ascii?Q?6B4HQlZYSDfn9rtKUccJLO1uVFjYvdNdAdQIr7gFOwpCs6LkSbJSK7fs5tCd?=
 =?us-ascii?Q?uWYpD1DQFFirfrAQtQlwGnwHxW2eJd+lLfVYFu1sx7lpQ4QXgKm7bmEICVIX?=
 =?us-ascii?Q?jVzZG7oL+bv77A/9ag9lqH7FPPtzl2gVViGJb/E0IKBkMsQtL0UBS0FkJyv8?=
 =?us-ascii?Q?Y4VWcn7wwSJ9Pl7eQk2clDWoeOOHgo9MWMz1Emqu4r6So75I10c5uuEwhwO5?=
 =?us-ascii?Q?SHFebXRVAF5lHutnDLifjYMXgFYUh7GKxrD9GPtrwLqW8oRXIMQyvJX9audL?=
 =?us-ascii?Q?iAdlggjxH7XC30sK8mexhScBnSqu78uK8AoZw7Z4CGKizaxyWtEoo8ljVzhO?=
 =?us-ascii?Q?DPLzA3jjIDNDxIORlFgkRwKli0PC6DSsXEuUZJno3LOnLuN7QSJs3DspzaPJ?=
 =?us-ascii?Q?9fui53bMqnlwO2zEovSwzFYRgeLmzWvcmkylzIGi2NdmTw/04RTdAX7xC+2I?=
 =?us-ascii?Q?m95hRciN5BFes7zIR31oFA4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996a3506-f20d-4be0-a4cb-08d9fb585f0d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:52:02.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLOmp4H0Pn3ZP2aUuQXOfanPW1NMfmXQRlPAh4t4A+UNvmc+VxjD+g2fyUsw1jgphzceyBHwl0IgDjjLM6Cjaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291

On 28.02.2022 17:31, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 28, 2022 at 05:14:26PM +0100, Jan Beulich wrote:
>> On 28.02.2022 16:36, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
>>>> On 28.02.2022 11:59, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
>>>>>> On 18.02.2022 18:29, Jane Malalane wrote:
>>>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>>>>>> and x2apic, on x86 hardware.
>>>>>>> No such features are currently implemented on AMD hardware.
>>>>>>>
>>>>>>> For that purpose, also add an arch-specific "capabilities" paramete=
r
>>>>>>> to struct xen_sysctl_physinfo.
>>>>>>>
>>>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>>>>> ---
>>>>>>> v3:
>>>>>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>>>>>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>>>>>  * Have assisted_x2apic_available only depend on
>>>>>>>    cpu_has_vmx_virtualize_x2apic_mode
>>>>>>
>>>>>> I understand this was the result from previous discussion, but this
>>>>>> needs justifying in the description. Not the least because it differ=
s
>>>>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from wha=
t
>>>>>> vmx_vlapic_msr_changed() does. The difference between those two is
>>>>>> probably intended (judging from a comment there), but the further
>>>>>> difference to what you add isn't obvious.
>>>>>>
>>>>>> Which raises another thought: If that hypervisor leaf was part of th=
e
>>>>>> HVM feature set, the tool stack could be able to obtain the wanted
>>>>>> information without altering sysctl (assuming the conditions to set
>>>>>> the respective bits were the same). And I would view it as generally
>>>>>> reasonable for there to be a way for tool stacks to know what
>>>>>> hypervisor leaves guests are going to get to see (at the maximum and
>>>>>> by default).
>>>>>
>>>>> I'm not sure using CPUID would be appropriate for this. Those fields
>>>>> are supposed to be used by a guest to decide whether it should prefer
>>>>> the x{2}APIC over PV alternatives for certain operations (ie: IPIs fo=
r
>>>>> example), but the level of control we can provide with the sysctl is
>>>>> more fine grained.
>>>>>
>>>>> The current proposal is limited to the exposure and control of the
>>>>> usage of APIC virtualization, but we could also expose availability
>>>>> and per-domain enablement of APIC register virtualization and posted
>>>>> interrupts.
>>>>
>>>> But then I would still like to avoid duplication of information
>>>> exposure and expose through the featureset what can be exposed there
>>>> and limit sysctl to what cannot be expressed otherwise.
>>>
>>> So you would rather prefer to expose this information in a synthetic
>>> CPUID leaf?
>>
>> Depends on what you mean by "synthetic leaf". We already have a leaf.
>> What I'm suggesting to consider to the give that hypervisor leaf a
>> representation in the featureset.
>=20
> Hm, but then we won't be able to expose more fine grained controls,
> ie: separate between basic APIC virtualization support, APIC register
> virtualization and interrupt virtualization. We would need to keep the
> meaning of XEN_HVM_CPUID_APIC_ACCESS_VIRT / XEN_HVM_CPUID_X2APIC_VIRT
> (and exposing more fine grained features to guests make no sense).

I did say before that once (if ever) finer grained controls are wanted,
a sysctl like suggested would indeed look to be the way to report the
capability. But we aren't at that point.

Jan


