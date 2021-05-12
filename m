Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4615D37D2B1
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 20:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126343.237846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgtO4-0006kM-0g; Wed, 12 May 2021 18:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126343.237846; Wed, 12 May 2021 18:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgtO3-0006i2-TG; Wed, 12 May 2021 18:15:11 +0000
Received: by outflank-mailman (input) for mailman id 126343;
 Wed, 12 May 2021 18:15:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XikZ=KH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lgtO1-0006hw-Sm
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 18:15:10 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc95ab92-7a81-4758-a4d2-37b11ddf6708;
 Wed, 12 May 2021 18:15:08 +0000 (UTC)
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
X-Inumbo-ID: dc95ab92-7a81-4758-a4d2-37b11ddf6708
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620843308;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=amc0m8q2dyYx5RpIF9dBjoPSkDmKLQmozHAEGQbqqiI=;
  b=fA0CCT1g72s/02bTgSexVt59+DCFJ9qFIMugPwEckxKku+tYqLizch6C
   G0liBELZm9xTlK835JYs4Ei+4Z88YAmk9qC+n4CVRKi9cKk8+WJFVPRca
   t2W+PKl89wKT4uuXl8N0P1oZZV4m5OHYligpIRF8CobfG/N3wrOsIAYgt
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J7NEQ0U3qCLA/sDNthOJizJTLrUQgYDBuVl3kpT019BADEa850BdP6Xe3sl28twq0Ob9pNf5Yp
 jt5/N9hvk0mh/SAKwmVdE7LKwmlmo21wuX8bRLPX1U6iUTAUyYIIFT07VTJLMtBLLs6/ykLeFe
 bZia3wYeKMq/R5+Qf28/SEFe0Vw/Ko38+m3v/+iIrgzJzNtaIyW4eHS2Af21Y/LecaIstiTyq0
 tO/Sh7l6swIt8Eb8MvZ2VXxojCo4PIrYpsDKsbXU4C/OjG8OqXDDLV/L+YpdvghMjwnD+wDzSt
 +eA=
X-SBRS: 5.1
X-MesageID: 43655362
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OyGE3KPbx5qsZsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="43655362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clv4At08S1nQo9WRiSA98ub0RLEvyiMSVRDvAKJl5r2/jMSc3H+ykJg/hUl+X74In5bKct1rOWAkvduJSBHFbD1P4G/Js2dLcd6hUaei2jyljLcFZHzRiX+aW4YrophNtxdf77hUEsA3kV/kFUXVcdmcwIH0nvjpq4UKLTElm2jlu/77c5bgQfFD6Xn26KL7sbUBM6bU/tzLtx7UXzIcdcS6lygUFoSKOlKaYhGEjOKE01P+Z1E/Er3p4QMsDn1NYRGCQ+GU7Dd+kEIjgTN/aCUr/CpCf8bFboAOJebGIKml0xmaxy5n39i/Ng5VhJlivWcJ10hwKeqV7IK/PBC6hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amc0m8q2dyYx5RpIF9dBjoPSkDmKLQmozHAEGQbqqiI=;
 b=oWMJuYVBHanFFpJ9xAe2UNt00Hpg6VWPZxnuxO8Mp6edYS+cXfqaByAQk4v9t2JGekhmGygSDnpLAUKIxS6HXMDlOJhTPuzC9KmEyw0jG4+5xQYRHKAYkmpyuRr88wPq7snxGsVYh0t2qoFMPXzuxo3lAm7jKNIzBVq4wCa5wA14NzS0fuY6ahUAhfZWT5xxW/faibRXzLoPKagMNb6cAspwgoo1Gdbmj0zK2LVyUSmN75nqP05HLME4I5SFo6SPsdHKoh0C9jQGVXzNqKtMFKBVcYeiWC2y9rWcFSl6wJrr5XXpuIMiihinLxIj4kqTotA3IbXkQVziVODGl4vDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amc0m8q2dyYx5RpIF9dBjoPSkDmKLQmozHAEGQbqqiI=;
 b=AK0pmRSrbd6t+8pj5c7MeD/wwTpu8/9UFftqjoFSLMyFVwtjYCbfK8uRNMrMGCoXi6LyuHW+n+5ese5Ih58uqtASsNEr6WusgrWJKj/7pNVYNED1lm4mb2ZALq3qGB2lBEu6ZR7VP5Ibaab23USTtgIC1U35nhLFtx/TkKMoL2o=
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@arm.com>, "Jan
 Beulich" <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <xen-devel@lists.xenproject.org>
References: <20210505074308.11016-1-michal.orzel@arm.com>
 <20210505074308.11016-11-michal.orzel@arm.com>
 <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
 <1ff4f9fb-0eca-189a-2b47-b910dc6b3639@arm.com>
 <42a998be-2f99-a1b6-ace6-4c5d42af7046@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5b23d612-57a8-f0d8-97d1-2b90161b5539@citrix.com>
Date: Wed, 12 May 2021 19:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <42a998be-2f99-a1b6-ace6-4c5d42af7046@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0048.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56704d1b-cadd-49e3-39bd-08d91571dc03
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5079A10B21E32A6621C1B9B1BA529@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dmVgF6+BtLpYdx8pF45FahIdtVo0hddkUdwxTzu2VhDtmm2R5lQm/gKty8pDwqdCXQhwivWtGAyLMAzIS44PAQZIhUgfB1v2/SgmaRN+rDq056uOeKKMWz6mG/75XBjhsliGnaDRxSsIgq5J2RTxXNPU62xOwcjBoYfWFOw6qVPfrKDImUboLbiB7Sp9EMCZ97kaycW9EDkoHfwpEsZDNxzTUzSuqsK12pGbVPRvSslofaOQ63+t/OOT9knm/offb7LTLrj4y9DU6E06ib5RLoIpiSL2PUGuC2rZFBQ9NBphnG003ZPVqjbhgLj6lf24exJJ1nABkWBWGg3PmIZ5FCTqsItrbg6iFp6PDJiVAqShjanVg2lIz+iNr6Ub64qnQmh6fLUdj8tSwmZxlhDwVRFwcljjoLCxdUVKNrwORIQUInTffAsR9ykgBP4fWqAmar29n6JAdiQQYtP/mJTY6wHFPq48DjlOxS9hF7jfhm+QJe5iPN7I9VEu4icXmIbfWj7QdN7uViRaVZ7nQNxmXzIRZJGovXEc+0lRG1V+t8lV3RvIEuxyz9hkv/hcrR3lvlVLYgWHto4mH5j7UDmI6zKKz7xAYGk/ZE/HlVLkNFvpBNq0xllST5aBiYAYBz3yLVRfzqQ7kFTpsFnuia9oNuMPJPXx9yhttb7SmEQWQ/JL3Yr6lgixvTB345oCoo7G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(478600001)(66476007)(36756003)(6666004)(8676002)(83380400001)(54906003)(86362001)(4326008)(38100700002)(16576012)(956004)(66556008)(316002)(7416002)(53546011)(66946007)(31696002)(16526019)(5660300002)(26005)(6486002)(186003)(110136005)(2906002)(31686004)(2616005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWJYTmE3bkVLRVBlZG1KNlMxVXk2RHZQNDEyZ2RtNnJyK2dqZ1BROHdsWnls?=
 =?utf-8?B?RVBrUUZVS2d6UzBiZjJwQ3ZITlYrclQ3YklRTXdHSkJxZkdSV0xoU0t0QXB5?=
 =?utf-8?B?Mk1FSVJqQWZNcko4UHJBazlDOXgzMnJlejU5ZndQYXZQV01WNVNTN1JQR1Zv?=
 =?utf-8?B?TVA1V0hZM0Q1NVlETGxKbjZ0QlFCWEs2YysvS3A5REJoalh5NU80WGZDMW9a?=
 =?utf-8?B?Z0FuZzZaN3UxRkhaaFVBMjFxZTdJZkFXM0VaS0Y0c3FseVN3WkdjMk13b3ZH?=
 =?utf-8?B?emswMmRtTHJNeVN0MHZ0QTRIR0h6NDBESmxIektudnFUN3QrWDJjeXlNM1Ay?=
 =?utf-8?B?eHlIQlNXcHFpOG9oTVhzbXVHM1h6ZWpLUGJnYmdhY0dBNU9EWnpkRW9WWkZK?=
 =?utf-8?B?RUdsZ0JWcExOUld4L3FPMjFjUStTdEZsSzcraTArWjNIRFU0S1NyQVhTTFFu?=
 =?utf-8?B?bmJvQjFrdC9nZzFTc2dXencxWFFnSmZTL2ZQZHNnV29kT1o1Y2tpMElpN0Y0?=
 =?utf-8?B?UkVXcGpjQzNCMzFhalVvYmJFWDJreTl4cXdMLy9ZWDgwa0k2VndVY2RaS3dj?=
 =?utf-8?B?cVAxend0Z3VIbkFRYzl4bkdDUmIxSWtuYlFWOWlEVFlrdUpEL0lxcUxyOTJv?=
 =?utf-8?B?U1RWblVZZFhBaVlMcHU1SkNOMy9vTnVFVDBDNzU5aG5haGtRMGNuNXI2bmk5?=
 =?utf-8?B?Y21ONlE4akFWRTczUmVnclViam5yMG56NTNzREJDL2F4elB1dFJoSTNLcFB5?=
 =?utf-8?B?NlpuTXl1d1NSU2cwZXMyQkNJejZIMno1ZW8zREVuSlVIYWRSQlprVk9xWFhw?=
 =?utf-8?B?TnM3d0NXeXFMVytHUVJRMHBRQ1VmUmhCeWhIeFp1M0w2NjVna1lXbWVEUzZk?=
 =?utf-8?B?S2hjTHNTZi9YMlc0WjBQOGF6OGkyMVh5KzZKcThid2w0cVBCLzdJZ1dFTHVD?=
 =?utf-8?B?SHh3RCt0WFd0bmozWk5ldjY2YjB3WVVBcVdCRkNuVkxqaHVuS2V1d3N5Q05C?=
 =?utf-8?B?NEJXR0ZtYkdJL2k3bTlEcVhreXJua3B3WmdLemFXWGt2T1I4SDdsWDloSXJI?=
 =?utf-8?B?b3FnVWY1cTRXOUltaUMwRDRGemJnWFAzcm1rOFNWMGZEV0NObVZRN2ZUcWRj?=
 =?utf-8?B?OXRKdFVZUnhwQys0NDg3UGJhWERlK0JPdVdTQkRGeHJFSVByREQyYis1VmRH?=
 =?utf-8?B?WWh5clp2SithNUdBRmRwSGZCQjdHb0hNa2h4QjV1bnFWVTNUV0JnTXh6NlZk?=
 =?utf-8?B?NmlzQVQxUFZaSk9CK3Nac0g1VVVBVnNkUnhkVWxnME1STVo5YUV1UTNsRjNz?=
 =?utf-8?B?elBIYXY0N0tNYkNrblJwTFM2MkpKL1l3a2JMbWF2aVU1SjMwRERiYlk4YVJo?=
 =?utf-8?B?ZG1GQnQ0T3NaMEFzMWdtMHJwc0N1b2JWakZHSFZFWk96bXluU1ZQNUExS2JC?=
 =?utf-8?B?dmFZNDdRUVpEK1lFMzcxTldPMlRMZm1HZDZQQUVPMXpWa1cwdmgxQy82a0w5?=
 =?utf-8?B?N1ltV29TYkRnWko4dlJBR0pDNTJPWFVXT2VuZUJGd2xkUlEwUVdKRUswdDZD?=
 =?utf-8?B?REJ5SlVGeHhLZk1TZUJ2TkJHc0pXRU5XaVk5RE5IUXhZaXBWWW4vTElzcS9q?=
 =?utf-8?B?ejdOZ1lIY0JGQzRqalVxNVpCYnVScDBQVnZRRUxCZk9yUURYeU1UUFVmSW9L?=
 =?utf-8?B?aEtQY205ZXdrdHRQM3pseklsVkptRmxMKzZTQi80ZTJSbkNpTWkySE5yemgw?=
 =?utf-8?Q?RcONYbXqHNVmj0CyU6cAaO8c+dK/qZHKsYAa2Yz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56704d1b-cadd-49e3-39bd-08d91571dc03
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 18:15:01.9290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOeBJUgFI+wf7pR8gXshdInJqA42n5a+32AHOtArsjYM+M607T0P6CpcH9BlEHfqg97YFiBaF2NV/axcdzcx38Qu5IKjLcxJxM1DugKvgRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 12/05/2021 18:59, Julien Grall wrote:
> Hi,
>
> On 11/05/2021 07:37, Michal Orzel wrote:
>> On 05.05.2021 10:00, Jan Beulich wrote:
>>> On 05.05.2021 09:43, Michal Orzel wrote:
>>>> --- a/xen/include/public/arch-arm.h
>>>> +++ b/xen/include/public/arch-arm.h
>>>> @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
>>>>         /* Return address and mode */
>>>>       __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
>>>> -    uint32_t cpsr;                              /* SPSR_EL2 */
>>>> +    uint64_t cpsr;                              /* SPSR_EL2 */
>>>>         union {
>>>> -        uint32_t spsr_el1;       /* AArch64 */
>>>> +        uint64_t spsr_el1;       /* AArch64 */
>>>>           uint32_t spsr_svc;       /* AArch32 */
>>>>       };
>>>
>>> This change affects, besides domctl, also default_initialise_vcpu(),
>>> which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
>>> only allows two unrelated VCPUOP_* to pass, but then I don't
>>> understand why arch_initialise_vcpu() doesn't simply return e.g.
>>> -EOPNOTSUPP. Hence I suspect I'm missing something.
>
> I think it is just an overlooked when reviewing the following commit:
>
> commit 192df6f9122ddebc21d0a632c10da3453aeee1c2
> Author: Roger Pau Monné <roger.pau@citrix.com>
> Date:   Tue Dec 15 14:12:32 2015 +0100
>
>     x86: allow HVM guests to use hypercalls to bring up vCPUs
>
>     Allow the usage of the VCPUOP_initialise, VCPUOP_up, VCPUOP_down,
>     VCPUOP_is_up, VCPUOP_get_physid and VCPUOP_send_nmi hypercalls
> from HVM
>     guests.
>
>     This patch introduces a new structure (vcpu_hvm_context) that
> should be used
>     in conjuction with the VCPUOP_initialise hypercall in order to
> initialize
>     vCPUs for HVM guests.
>
>     Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>     Acked-by: Ian Campbell <ian.campbell@citrix.com>
>
> On Arm, the structure vcpu_guest_context is not exposed outside of Xen
> and the tools. Interestingly vcpu_guest_core_regs is but it should
> only be used within vcpu_guest_context.
>
> So as this is not used by stable ABI, it is fine to break it.
>
>>>
>> I agree that do_arm_vcpu_op only allows two VCPUOP* to pass and
>> arch_initialise_vcpu being called in case of VCPUOP_initialise
>> has no sense as VCPUOP_initialise is not supported on arm.
>> It makes sense that it should return -EOPNOTSUPP.
>> However do_arm_vcpu_op will not accept VCPUOP_initialise and will return
>> -EINVAL. So arch_initialise_vcpu for arm will not be called.
>> Do you think that changing this behaviour so that
>> arch_initialise_vcpu returns
>> -EOPNOTSUPP should be part of this patch?
>
> I think this change is unrelated. So it should be handled in a
> follow-up patch.
>
> If you are taking care of this, would you mind to also look to move
> struct vcpu_guest_core_regs within the #if defined(__XEN__) ||
> defined(__XEN_TOOLS__)?

+1.  Fairly sure this is the conclusion of a discussion a year or so
back where I noted the same peculiarity, and tried to untangle the mess
which is the common vs arch specific code.  (which is still outstanding,
and I don't immediately recall why.)

~Andrew

