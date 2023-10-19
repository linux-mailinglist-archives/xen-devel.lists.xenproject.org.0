Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032E7CF5EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619175.963813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQfX-0007IM-OU; Thu, 19 Oct 2023 10:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619175.963813; Thu, 19 Oct 2023 10:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQfX-0007Dh-Ka; Thu, 19 Oct 2023 10:54:23 +0000
Received: by outflank-mailman (input) for mailman id 619175;
 Thu, 19 Oct 2023 10:54:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQfW-0007D8-JD
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:54:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db253fc5-6e6d-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 12:54:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9978.eurprd04.prod.outlook.com (2603:10a6:800:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 10:53:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:53:49 +0000
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
X-Inumbo-ID: db253fc5-6e6d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNcdyh74e5eogeeqtdECzIjEBiA6xeC+udGFxxWz/WxqFJCJeZ0e9YP57n94V1VbWpnOUD6Ur3fEJ0LT0AG3Ir4XzXRPpKRdj6RdR29XKyie5vXBDtYVAhwFvXsn6nfmBwcRfLq1HU6Ks8D10wC09LyclnG63KTpu8bjl/ddeacVqHv3oQITv8tzaB5mtgIw+xniaQuX4JNTI6HfPojSbtj8itK+Ys3iKJXNrpTr71miDa8Faph0e2jhtXT8BL+ZLGUKSoithvJ5Q+coGUxo1U52zCRy9VD9u4/lIjDZNIPw/7pEKAGolmeMKEcXZJpFG3ydcybvg4wO5SIBEiebpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNNGs01AkRp997b2t+zz+4hVoA41QnX/ieLc32A3NMk=;
 b=X9l5cN6JCY5zlWm1GDRUJBM1CPDTUguACrvivxAGNjnNlBLdgMgJwdV4/eVzh4iVWRE/7n0Q4j45JZPW/zNsUQ/6Ybajr9fa7abEnHGAwVZF16nHTHN48h8+lOiiYkE48JQbcjS12CEKpMs10SBe0Ea9EjjlHNDKFzNfijGiVsIPWN6s5P9GgXe8IV0v32NwzmRdWuf9DJE4Q4qCuYNSa3xOT36LqrpExD3n6b8ZjqrXu/9+elhhFp80Dxd63ecs8YjXbdx/c1beMOWfieAj9zPny5JfsmFBbjlUFyvuvhLnvY3w+cw8stAE048DClHFezZ2LH9TBJViwyVikM/2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNNGs01AkRp997b2t+zz+4hVoA41QnX/ieLc32A3NMk=;
 b=2Jr2X0z7AmQDAysSt/xUJsGjOE4H8QvSndcZ4r3G6aptyFPgI3vxTzF4H8+k7Wo1xCkpdQ2U/rSBdVBCxQa9dFIGy7DLzcF/BuERUHaXv0gpNLHCG8SDqQCYu2gRJFYLFOS+hs+kSwrBoZGaiO727Uy0bO5ysikp9VGkMZ4RyqRc4lbq0o1MAN/330KfzC1Hcl7Y0MjWJcmKp3i7BdRNPEmm2lQnFwKrlTPFB4kItk2+DFD+tVSfqtQ188RhSYx8f9+gaNuCLNSyDX8nH927L7d4rgzQbIrWaXyfkolAES95VxXiTX+J8h9GhUQRuC+iqI6Ae2oEDs6g+ShTcD29JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17d9102a-da9d-d41b-6362-1ccfe21b7976@suse.com>
Date: Thu, 19 Oct 2023 12:53:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
 <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ee7b3c9-de71-4790-815c-8b2859a85465@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9978:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d335a8-8c5a-4385-1f3d-08dbd091acec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RXn2iCx1SgJn0V7P1y44Zvf14ybQkTr9JoD/L9BGCt6d44E2gHVc+bxvFlzxTQ8rx3/n9kyJsbb3Tnv0LtErwVzpgYKKOamZebfuw1vki0s7DJCsRc7Xq0ygt5UvmKzIO3wE0zE4ubLnA4WJNZ02uilTvnntcl6XLnfnLO+A/KTLRE4Z+G3LlN1ocUYNh/9Uxce7z8kip2nwrE1QXe+2iV+STUMKhN33U37eNx43jG/F9fglRhMTn+5GDVx01SWRgyFlPDn2WaIuEzUMfIrMj4NH0INH6YIs/5r3Ory/CQRw5g3t+aIwOJfeNBjLv0CLtNuPYJSLtpXc63BopVGY1msj/mYFbVNSg7gUyS3lGzlSXwdcYSIJ7OgBFwxOQSdKnh3G2Y4GPFKVkXUs1coh7HcVNNM8mL4n3NdwiXGT0lIqj8m9SPp2RZHvDaNi23IMMjEFyyjvjZrEarEz1YhZKul4pEMuRQjIEXdrAv9DAtcQRbchHoLTEvCxTVOqf6kzj1Jq+xIj84YzroiasNkSfrx2VLeyTrb8ktoHDwV/ZsQIU58/WzmA2Md+sZfH7V02KhNbYW6M4M5L8tOUwuQG+jZu8Soes2kKYlLbBhOxf6pn/i1gFkh4uimU75ujNn7itJ/jBcvM5NfCTYZpzYf4JCIIRq6TQM94emN7hlfaZBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(31686004)(2906002)(31696002)(6916009)(36756003)(8936002)(5660300002)(4326008)(8676002)(6486002)(66946007)(54906003)(478600001)(66476007)(26005)(86362001)(6512007)(53546011)(66556008)(2616005)(6506007)(41300700001)(316002)(38100700002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTlobmR6bUoxcmdQL3hVVGFDY3czdTlITWM2eDBrTml1bFJMZWJENm9zMXgw?=
 =?utf-8?B?dm9EN2ZzY1Jnemd2dkxFN2RSVnpNZUcwekhVM3doR3E0UjdyRk1uWk91dmhO?=
 =?utf-8?B?cUx6dG5xdWpkRURwemFwT015Vkl3WENycVdXeTVoN3lvZzFaMDU4Z2tqMjlv?=
 =?utf-8?B?dGhnaHhMdUx6Ny8zYzdQYlhObklmSjBLRUY4WUtVeTBrRmwyM3M4OWFvN3dW?=
 =?utf-8?B?dVNnVFBpcHNYZDArc09zS1BrdDRrQmJRUGUrQVM2UzFBMmt6WlFjdG0vR0ta?=
 =?utf-8?B?YjNsUnpWL2hHanZFMWVIT3Q2TGVDZnVNWWtvd1lnTktrdkFGMzJHSHR6d1F0?=
 =?utf-8?B?bEdKajg4R0ZPVWJFOEtDNlVPQ2RvY0s5Z0k3QUowaGRQQlVrb3hlSkRXSEF0?=
 =?utf-8?B?aEp4MTlsNUg1UmsyWTRMdzlBdWM0ZHk5OExGbXpPMlZpYUIzc1FBSkZsdi9u?=
 =?utf-8?B?eVA0aDE0T3J4WG5ud3hKdS94NzZxeFJEMWFabC90c2lHRzE2T3l3TU1Ibjha?=
 =?utf-8?B?YTlCS2xQWWxaSlA5Rm1XdEVuY1MrQnJ2WEE1VTJBRHNYTDlXdXJQTGRscDJy?=
 =?utf-8?B?QU1hd1hQUWhGQS95aHIydkNWSzNEQ0xzZE55SGJvbGtoMnc5ZWVvUGt2NEZY?=
 =?utf-8?B?TDlxZFB1dWducDZYNGo5UVRSU3dYdEZDVlhMWjl3czBCSTRiK0FPWkgzTElr?=
 =?utf-8?B?cnpyd2hIcXkwb1pnOHNTd0UyUng5R3RaNDR2cFFxRkF2Vm5qQWhFWE03R2Fm?=
 =?utf-8?B?NWcxVlpLVGcwVVJFWDZiN1YvcDVGYXhES1RNdmkxRDA3Rk1ndHFaR3RVeG5w?=
 =?utf-8?B?V0ZublJuMkZ6QnA0WUhJQUF6d2wvWFZoVVBtMUF5anpaenZlMHI3MVp5eFIw?=
 =?utf-8?B?eUlObElkRnVGc2hKMGxqT3AzSkgySlArR0hPakNYb3NPRmlIYW96R0JoRmpt?=
 =?utf-8?B?ZVE0cThwT21RaitxTHhWSGM1WmdHdFN5TXBETi9pKzlEckx4YWt3WGFTTVJi?=
 =?utf-8?B?b3lzYTJZWW0vUVhqdWZia1NGOUJhdEd5NE0weGUvR2RDcTVsR0lWb1E4UzR4?=
 =?utf-8?B?OXNJRHQvS1IzeUVKZS95MzcyL1lyYkY2Z2FyejNzYzBiZTB6ajJnLzZsaVZQ?=
 =?utf-8?B?SEg0TjMwNVltMkZ3MGY4UTJRaUk0WVNadnQ0Q3dySDJSckIxK3FjR2F6UnQv?=
 =?utf-8?B?ZzE0dG52cDlRQVFHbkFTVER4L0kvMWZMK0prUmZTeWpORGNKaG83dXM0dmRC?=
 =?utf-8?B?M0dDeEFaM1I1STA1cHBLVnB6MWplWk03ODlvNkRYaUF6UHZ2R2ZuYkFkTm1O?=
 =?utf-8?B?MjRtdzdyRGZHaEowZ29LMm01YXovQkpBd3Z5RDhlUmZMSFZ4NG9rcFNpRGRK?=
 =?utf-8?B?b2lQbHU2b0ZrUXhIV2RMRmpjR2RFMkplNy8xbjlsa3BKV3FTTjErOENkR0do?=
 =?utf-8?B?UEFFYnY1YUpEQTFtQ3VQWFlRcjc1eGZFOE01NWd5a2IvL3J5K2h3Z01MOUNt?=
 =?utf-8?B?OEFKbGY2d01KNmxuUDgweHhzMWJnOVpEditONHNFS3h2cGVlS0RaWFREellt?=
 =?utf-8?B?aWVtVUpqcXU0ZmEweHUyNDVYVGp0MGNVeHNkNGlUT3d3VWd0UHJLSzd1djlG?=
 =?utf-8?B?S1lub0ptdVJYN0dHZUlOQUdLMjVqVjdaSHRIS0RYckQvSzNNcWRXa05vQkUz?=
 =?utf-8?B?dVQzeUViYTBsRDNmMTdZcElvelhISTVDcHNTYWZSWmFSbklEc2lkY1cvL0JF?=
 =?utf-8?B?OE9VaG5ybFVpb3Vpa2E3V0dwNWNnb0xrNDJ2V2ZZL0czeGV1UWJvOTE0cjJC?=
 =?utf-8?B?V3oyTnhXZ1FDaE5kQTZZYTNDNUQ3MkdrWkxSaW5rQVFyQ0JXaEM1cFpBZlZM?=
 =?utf-8?B?QUROS3JxR2xFOXVpZTQ5MkhTZU16VVkwVDlNQitFUkdtd2QwT3FiVnlvRC9C?=
 =?utf-8?B?anF4SG00QndNMWNKZXRaVkYwS1k3dzlaUEV6YzVJZllBUXViMjY0NERHdjRH?=
 =?utf-8?B?WGlWYTEwVkV5eHRVeWZmNThJQWZFVjloWld5dkdNSng3MkJLUjdSZ0RHMTN3?=
 =?utf-8?B?MmtlWkZIL1lHeUM4cDIzRTBIWk5jeW0wVk1lVEswUTgrVmF4VjRKQXBqT2tw?=
 =?utf-8?Q?b8bIktMlpk75UItUAxaluS7NX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d335a8-8c5a-4385-1f3d-08dbd091acec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:53:49.4290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwPmYEoIuSPbpl4+B0yqnNNL+zD4lAnGtCPbsxhjai+FbSRr04BRKvB4b9ATCiTBdP4LrdwgBUPrJkacvRVyVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9978

On 19.10.2023 12:42, Julien Grall wrote:
> On 19/10/2023 10:14, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/device.h
>>> @@ -0,0 +1,65 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_DEVICE_H__
>>> +#define __ASM_GENERIC_DEVICE_H__
>>> +
>>> +struct dt_device_node;
>>> +
>>> +enum device_type
>>> +{
>>> +    DEV_DT,
>>> +    DEV_PCI,
>>> +};
>>
>> Are both of these really generic?
> 
> I think can be re-used for RISC-V to have an abstract view a device. 
> This is for instance used in the IOMMU code where both PCI and platform 
> (here called DT) can be assigned to a domain. The driver will need to 
> know the difference, but the common layer doesn't need to.

Question to me is whether DT and PCI can be considered "common", which
is a prereq for being used here.

>>> +struct device {
>>> +    enum device_type type;
>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
>>> +#endif
>>> +};
>>> +
>>> +enum device_class
>>> +{
>>> +    DEVICE_SERIAL,
>>> +    DEVICE_IOMMU,
>>> +    DEVICE_GIC,
>>
>> This one certainly is Arm-specific.
> 
> This could be renamed to DEVICE_IC (or INTERRUPT_CONTROLLER)
> 
>>
>>> +    DEVICE_PCI_HOSTBRIDGE,
>>
>> And this one's PCI-specific.
> 
> Are you suggesting to #ifdef it? If so, I don't exactly see the value here.

What to do with it is secondary to me. I was questioning its presence here.

>> Overall same question as before: Are you expecting that RISC-V is going to
>> get away without a customized header? I wouldn't think so.
> 
> I think it can be useful. Most likely you will have multiple drivers for 
> a class and you may want to initialize certain device class early than 
> others. See how it is used in device_init().

I'm afraid I don't see how your reply relates to the question of such a
fallback header being sensible to have, or whether instead RISC-V will
need its own private header anyway.

Jan

