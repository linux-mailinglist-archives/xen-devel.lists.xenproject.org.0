Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175944C717F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 17:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280687.478725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOifU-0008BT-Ov; Mon, 28 Feb 2022 16:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280687.478725; Mon, 28 Feb 2022 16:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOifU-00089b-K1; Mon, 28 Feb 2022 16:14:36 +0000
Received: by outflank-mailman (input) for mailman id 280687;
 Mon, 28 Feb 2022 16:14:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOifT-00089V-5V
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 16:14:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841b7d88-98b1-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 17:14:33 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-AVI7rqiEOCiW6tFtWJEk5Q-1; Mon, 28 Feb 2022 17:14:31 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3355.eurprd04.prod.outlook.com (2603:10a6:7:81::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 16:14:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 16:14:28 +0000
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
X-Inumbo-ID: 841b7d88-98b1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646064873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/iB1gH2B0YDzTRzLQbEQ5yEasgwypiYGXsPhPBKxCzE=;
	b=gPJKPaHrJNihZwYPa81AL99mO7MlvcTSfaplZGC0ckSTmQYsrfLIOyIkEBVjc0E19z0Go/
	ONHSOxYQOxTKIQiF2zLWw6twbzNyBxomXM8BllWQ2TDS9tm6nYSAdnpZX343Qd0O3dcj40
	/Exh4/oaEwqWwJOs8i2CDTfaUxvMOrs=
X-MC-Unique: AVI7rqiEOCiW6tFtWJEk5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlvFLfDuUj3daSg0RCzC312dEOVBoVTuRwE5luAzT3X1jXogf4vzVP9MFO0/zfTlFW48Xa5OtbVzoFkdr4sEGPpywXg4Rxt/Sdo3i6lFMzmRMdF74+kE/lFpyTYeEurGklehcCGFX6GoukUFItZXXP53Xf+m9Xufbm05JvWzrP4y9lZ7SVbk5sQtdjSEtkaCe2jRSvwnYOnfJKBqWpyhkfepnvZSu/uf5hqV0HNjuMgPv97y0bv3GJ+GTdo/p3aZT9/y0e/43ZDSOusVMLDq9VPL9bb8U4QHCyM4r8ae9ANIqLZK5z4ESvm6mY5eoIXK0hV1gkg8mkJTYtgYINf4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tlt6OpVr2kmTAbmmEftwGEsWE3Ic2XnKOSvXTcRhPQ=;
 b=WN8ijB4GWKWNNJufbZZH3lUn1ACNFS+rbjz6sGb2lHYThey2eXvCUet7o8W1DFwRKB8NKIsu4keM5TKXi91SSGdtDK3M+qNi3xwODjXTKFxX0AaXOEztc/kXD9aF8C/JE0naHacq7BlQMXKx8ZBo0IHcCqP/sQ7YOpgJAg9r6DkqW1L8FaM4OP3QF4n0HGu+OB+wawjnq7qtwwMyJJfFbJlhK1/5JUeKtLHmiaVK6Ti3Z6TAW6mP+5zuaEQWNR/gUJjJpMbsj+yubS6mOU0o7SvmBtUUfXM7FAbGj9UVxgv+Hox3vF8rqtBuIa+oqAQo3eymQFNnzVkiR7R/66Vohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6b59e3ea-01ff-e26c-02d4-3b11594fd7f0@suse.com>
Date: Mon, 28 Feb 2022 17:14:26 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yhzr739VZdRLWnok@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8026027e-11ee-49b8-ba64-08d9fad5651b
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3355:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3355CC5A4DDAC0029784A45EB3019@HE1PR0402MB3355.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mTwbersICBxpWNG+rloAL6FKi04s2d9eeRwvQPOMCsDnFeo2y8kXLU7unS0D1svIdwunttgsbzbDLu0qJpORbJhH5LZV0KuPsVT/3sDFFWS/knYXl78CjKLYhGAsrBLSZdehl1HfgPSnvk2+t9w7Q+vVjKiOqC5q4sLhroRjnUNkS1q659gnJi88PaQv00zd2NpmgFcyblKC4iu7S3ycWPVbr2k6b9EcgP46SyX+j3bFRbRYy0lBtKdalS3yxZgFzcwQFfBjXH9XYnzc83KdQsRItJAzyf6rIKG8F4JPcblzQUd4HiC5534p86qFr6GM8oH7D68Rr5FG1besjEqg6gRX/qFKPjOtrDqVAPwA+O7bvvepKpPkAz4QZrXuir5UUL8zIbXWnjVNsJ0W3MYM28F7VlWIxyuaNeKzWvWxO7xM1u1Sc9iZ+JLF9MnHt+3Kr5SdY+dtvntHobsY0PUmLanUd+n/fVh0uXp/ohJ1a2CXr/ZJHrptaCRbt0CM/jGIuP+tPqYDmVgS8Y3KqWyZ6nMXwcGPEleIew7z1NLvYEUZA+rNxwQjaWSHD8eEpg7j073RXtTEZchDySiGwiKPTeY/WlRZKdRHJabWMXevmrBCZlHUiWAX7F5E+xI3vI+VhPLXbcADhTZ0Y7jXuLZE1UqKhsXwBpbMmTO71xq2R7i7gnexILzQXvs5FvDWWoBmcu63s4zuWUoV7xsTCkFVdgTZ0S72DRy7rgLfAh8OZeuJlhCdlv+n33vVjUqLDlAb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6486002)(31686004)(83380400001)(53546011)(6512007)(6506007)(7416002)(8936002)(5660300002)(66946007)(31696002)(26005)(186003)(86362001)(66476007)(66556008)(2616005)(36756003)(508600001)(8676002)(4326008)(54906003)(316002)(6916009)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RaOAdqstYac/p8aoFyFS3Sb8Kg+kp6SHLqM6ZNI6GaARkXhhj0ay8eZ6pZn+?=
 =?us-ascii?Q?rumRbnO76E6of6lU5ErL7PtPxxc0ZI8a9AU/Y5PW0aW/PC5HM50ohLZO1fXz?=
 =?us-ascii?Q?F7waxI3QRIpLf742LSlbJpBjSFX9SY7shbGiMfiicJJJUm23gB0O83UkFBWt?=
 =?us-ascii?Q?ZCYOX0nQ/VT7CJe0Jfn1V8MN0sXKp9mCw3MXwnNDKrioIf5sY2xkYd52TfWl?=
 =?us-ascii?Q?ADBweynxb2dBiufnCHdLv2u6Gt5GZRvgj6SIinmuEBUHdt2Z9pvSXCh9cQ4b?=
 =?us-ascii?Q?WVM4tPHmU69dFxAsdoCXS+sxNVMOAZqDM9BVtJqTMvPYA6hUPlc0fZ103NNS?=
 =?us-ascii?Q?s9u79n7N6mouQ/u3UIJvolX3QbHanP8EDclxdJ6z+JzRWsEwrMAW9vz+98zI?=
 =?us-ascii?Q?OUW0WaNtcffrIRDqOxN5Cf1XVW1IBxL/m7H9OutoFpsa4PLJwZaCQ473r8E5?=
 =?us-ascii?Q?D8jsthsnR0HyN6ORu6malZcWMbXxYe3btuDM13AvjwZNy97YBPcvjtmoyIqr?=
 =?us-ascii?Q?9A2SseXJ0YrAa/773aV7eKXcx55BNAWFxl/ysV4LjXZ5hhrd7fcAS8CzxW7W?=
 =?us-ascii?Q?QEU+i0kg4KpQmiapQjZih57w/eL9GkfpWqymZW/F6zzQSsy0jSEJ3zf2hWFV?=
 =?us-ascii?Q?qa0UihO147CeBh+8yM/s4IoWAADqL5EqgO1eC9DGpgl/B2klZMebFy4cVYqR?=
 =?us-ascii?Q?dcKGLRbolJTZP73O6nBdwgnMjDnms/GOjYdkuXwgEZq7dYsbRtG8UWj5ZUlw?=
 =?us-ascii?Q?Y6D4oi699JW488so9tDvmH2+LNfivjaGZXa354dpO+tqMZQykTo9c+H8oeWD?=
 =?us-ascii?Q?AZmfiDTiOE0AhFcys/9NhMekWyLaKfvqewfJJA90lbvcYeKjvFZcxOMHVm98?=
 =?us-ascii?Q?ZSQPiL1e9BSzZKJdSCWZPfWWPYxk8+cOLSSHcLfurM/1go28uqGDHOFTmMbG?=
 =?us-ascii?Q?cL++/W7LZzIKj9dsdMvglSDH4a53FhBrV6xLwY5tw7O26y3N3r0cpuM+uHfk?=
 =?us-ascii?Q?xmJSMKMMiOwQO5YGGPcePnYCbigfXCCKpUpHBa4REPISEINpvgH7L49cWqJl?=
 =?us-ascii?Q?gceOdRiWya0QSc+dRiaZgUWx3IFeI/7yH1semPN7bNJ6GKCXx+FPK6Vt5orH?=
 =?us-ascii?Q?oftzq14jwBZTsD8QK6PjDC3TiZ4qqmkHPfunwd8Sd5r5dVg3A0nxXHz18uY4?=
 =?us-ascii?Q?Pwr7kRp4oVY0TYb3x6GfDNPt3RygbtMgB/djrFeOdNEAbMGib17MK/iFFCi1?=
 =?us-ascii?Q?YZTuYmjh76OEv9FzVEtH9E3sUwasq3W8Nib4rJTBiF3rttalXqW3QbG7EzYp?=
 =?us-ascii?Q?wOko2RgIU6r30JxqopEewW7NIu3x+oEGco2dRwrDj6j9knp6Ol8x2E9VeAHe?=
 =?us-ascii?Q?+hijCH/MVF27/2xxmFk2LB8Dvm/yw7If+laPRc1Vw98H/U/dad0w8rhDyx/L?=
 =?us-ascii?Q?W4Jbhk/7vUIBFeEWzYFX8e4ZXh/ZTKPyEXC2Sc74POOfzs70FRqXTIoSnEH7?=
 =?us-ascii?Q?l0ZBJx8ojJmLHpaW0MExilvYwn15sAWiaM1Zz/HPZnvctxhNWfzzB1gXriuq?=
 =?us-ascii?Q?JKHGniYtu7eQTs2GZTOM6a+TL2Z/KchCRplXbnRTKDXidkDbs1c5nAS7oaUq?=
 =?us-ascii?Q?vhOwfmos6nnzlFyU0XjMprk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8026027e-11ee-49b8-ba64-08d9fad5651b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 16:14:28.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTGxC5Jh7S4EedSqxDnITeUQPlr04wmshpPtnoZNdoUJ2JBZkMI5wwl+3EAhD5snC7wXIkNrNYZ6+xfqkHeAww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3355

On 28.02.2022 16:36, Roger Pau Monn=C3=A9 wrote:
> On Mon, Feb 28, 2022 at 02:11:04PM +0100, Jan Beulich wrote:
>> On 28.02.2022 11:59, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
>>>> On 18.02.2022 18:29, Jane Malalane wrote:
>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>>>> and x2apic, on x86 hardware.
>>>>> No such features are currently implemented on AMD hardware.
>>>>>
>>>>> For that purpose, also add an arch-specific "capabilities" parameter
>>>>> to struct xen_sysctl_physinfo.
>>>>>
>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>>> ---
>>>>> v3:
>>>>>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>>>>>    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
>>>>>  * Have assisted_x2apic_available only depend on
>>>>>    cpu_has_vmx_virtualize_x2apic_mode
>>>>
>>>> I understand this was the result from previous discussion, but this
>>>> needs justifying in the description. Not the least because it differs
>>>> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
>>>> vmx_vlapic_msr_changed() does. The difference between those two is
>>>> probably intended (judging from a comment there), but the further
>>>> difference to what you add isn't obvious.
>>>>
>>>> Which raises another thought: If that hypervisor leaf was part of the
>>>> HVM feature set, the tool stack could be able to obtain the wanted
>>>> information without altering sysctl (assuming the conditions to set
>>>> the respective bits were the same). And I would view it as generally
>>>> reasonable for there to be a way for tool stacks to know what
>>>> hypervisor leaves guests are going to get to see (at the maximum and
>>>> by default).
>>>
>>> I'm not sure using CPUID would be appropriate for this. Those fields
>>> are supposed to be used by a guest to decide whether it should prefer
>>> the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
>>> example), but the level of control we can provide with the sysctl is
>>> more fine grained.
>>>
>>> The current proposal is limited to the exposure and control of the
>>> usage of APIC virtualization, but we could also expose availability
>>> and per-domain enablement of APIC register virtualization and posted
>>> interrupts.
>>
>> But then I would still like to avoid duplication of information
>> exposure and expose through the featureset what can be exposed there
>> and limit sysctl to what cannot be expressed otherwise.
>=20
> So you would rather prefer to expose this information in a synthetic
> CPUID leaf?

Depends on what you mean by "synthetic leaf". We already have a leaf.
What I'm suggesting to consider to the give that hypervisor leaf a
representation in the featureset.

Jan


