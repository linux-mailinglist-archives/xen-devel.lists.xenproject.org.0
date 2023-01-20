Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2755067558F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481764.746870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrIZ-0004Wp-Ac; Fri, 20 Jan 2023 13:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481764.746870; Fri, 20 Jan 2023 13:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrIZ-0004Tg-6e; Fri, 20 Jan 2023 13:19:15 +0000
Received: by outflank-mailman (input) for mailman id 481764;
 Fri, 20 Jan 2023 13:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIrIX-0004Ta-KY
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:19:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2041.outbound.protection.outlook.com [40.107.14.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f4f664-98c5-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 14:19:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7866.eurprd04.prod.outlook.com (2603:10a6:10:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 13:19:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 13:19:07 +0000
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
X-Inumbo-ID: 06f4f664-98c5-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBDrQSemKOQvkUTJrgHyPwg357HeTprP9W3rM20PNKJsp1RqhwGNvEKW9y0A8/eJQl+oxZD/fOGnj6Jn81LX6ZHtVJKlqG4cDf1Ti7TuOGLTHNqO4fDbSZsQ+uNimpHZNUYXUNgpbU2WSg2j3pAGhcMDEo45wJJHVfjYSQ6hgL4ATZLGyMZqSHirMWtAma74aUrWq4KXYKZH3h3BuVPSWiRsFaeAh9Oi85K6b7LeYSgy9QgqG3ftuCx6XoX1Ca2nQmPpDuTDWiFfWvae+07QE0iNRoOxv6RybMPzMdZWggbXukKWxBkYfUvbLz+F6jwyOr01Wem6uW5ng/ODMEBl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VvP7C/TUCj9ivO2/VCWsZ8mJIl1GyIGDFOXUDq6QEA=;
 b=JLik6hkL04BMxpwy0tMHYsqIrQyrgzfCu+8l+n3qHOD2R4+eUv+Dsj6h9mpqUExeRnLGNyzFbGoPfaESiO3O54xIiYdPYL3wAcZNwIw+ze9VuU1+8N4hVv2XNI9UcF1l6QIXNFjqMeOxmuNE4yzj4EAMM5S0lIasPkQCx88/RxezdpGEIMG5gTG8qiBBAVOQX1Go0pFyOY8kmHQjnOsmpJFE/KA+zu4iNBT9VxZIDmjyWO7I4k9E9SDzQXGX/+Iq8V/VK+DtO5xqK8lSonaDvO8uLHJtxu9+qTOXa9u4B4CjZZC4y5IegBZZLkiT3O5+BVB9bwk8cwyw7qzZ/SSjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VvP7C/TUCj9ivO2/VCWsZ8mJIl1GyIGDFOXUDq6QEA=;
 b=UpepjUprJfxlgNjDa8fq6RHz0wADgnJ8QTSqdnpkEpVW/TjtRo2nr+HEjnpC5YjALE47avsXC3GSxmxyg94loSkUVo60LQDoOaDtUlLs+sV9pft5nGmlegasx9yC+JzkzGoVlh4rvdMv+fs4q8m8QKqOrIwnF3oZLzTLDlzGHFET621j9KF5pPKhGBNDcdvxapeRu+PJ5aOsPIh2L9dLgWSdtXNVpxRhd1rDVUtZdEYe9s0cgV63kkoG3AbG44/0b3a8MTENhrSvhFpOuV7+3GsIFMeCWx/lwmxVhulDz2kZ3tzCGNALA1NLkHwb0Ohv4s+caqgCAszSOe6N2BuaSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95d73822-5321-4c9b-04d1-8ee4f78ff35d@suse.com>
Date: Fri, 20 Jan 2023 14:19:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tools/symbols: drop asm/types.h inclusion
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com>
 <d519b6c5-5972-ff31-c3ee-39649babde7c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d519b6c5-5972-ff31-c3ee-39649babde7c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f88c991-f268-43e4-dfa7-08dafae8e8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r+/3H7x0ClTnu2mLy8/fZd6CIleCY18ZvD6KL/ViB6EKXX7H7L6UYGFocfYZ1aNHnWvOQDOpoNcszIcMpjVqJiOZ/1dwi4Ay4+eJ4qeQLOkx2BzxhEWD3EjNrOZq9yNuQAYG+ILIyTd5QY4au0nHvXFuIFGK5tW4K6DP6LcmwxO0bxrjoUQBmZWUntafqZEMavzedrAhFvv2qN8P5OL+OebhjppIr7ElRmsM9FtoK6RGeGyJ3kLqXlegOcM4LCvWejiEobe+vXDJmdq25FCGWSiKlpoGHWo/s/SYWUbiGDqTH2Lmi9PdHNHtlB/dUu9Nmzc/xA8otJcNlgHoGENI48jfSiWcdO4tEu1Gg3pMmlhMk1BHH2i9ESY6B6iDviAz1o8wbmlRyQ49E6nG81xeD3cln6YdahLjcfDPz6OgtE6Dacfjf/zm0JkvgsSnR0OKbqnHoJGyeb1e+nrGe8DC1KeQWYU1i4b+9hCmEw8YePkHUCve2gMj5l26i6UPbrIvFSqQip8O7j6hTQoCbAi3EiDg7D8EnwVdgTdZQ3ACyGXaigJzPOMGmKkY2atbBa27g8b5m1AP2fQycfLVQ2V+HpHad+7M3qSiFBi2jmf++/4VedMnakd9d0IkksMWouY56hkgzelRiFdL/SDjXExzkHDz4IVDUSf5aQJu2fnGNVGdgN/axtgNDte4r1AiJM62M3e9sWEKMf6jbrRHvANARQrZX489QXD+qub5rYYQI84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199015)(53546011)(6486002)(7416002)(316002)(478600001)(41300700001)(31686004)(6512007)(38100700002)(31696002)(54906003)(36756003)(4744005)(86362001)(8936002)(5660300002)(186003)(26005)(2616005)(2906002)(6506007)(66476007)(66556008)(6916009)(4326008)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09PeDQyQWNkeGdpVmhpdzFLSmd6YmxPRjBKbThTN2lFQ0FCVUVGTVloR0ll?=
 =?utf-8?B?dWZVeDIwMEFJQ2RMN1p5OEI3YUV1UkU3SkR1Rzh3V1pxRGRhZGhGTEU2cDBX?=
 =?utf-8?B?QnVmVmFLY1NwY293SWtHaktISk9RYUNHR210N0lkVWFnc01Bdi9iUFdNRlhV?=
 =?utf-8?B?MXdxdk5GdlMxaUdRYUhWMzBUbWg3bm42OWxZZFZQMkdVRUE4bjVUSnZaekJZ?=
 =?utf-8?B?Rmo4ZnRDeGpiSndZdHhMejdVZklVLy9wVFlLS0dVaWhSbzd3VGlqVW8vUVZk?=
 =?utf-8?B?WHF0NDNpcTVpWUhFcTF5SzJrVmROb1k5NElwbUcybExFcG9sc2pGZ1NLVDAw?=
 =?utf-8?B?dmtrZHE2Z1pteGg5bWIyZXllWXBqZmk2WVJYLzhBVW14TkVDdU0xVmgyM1pY?=
 =?utf-8?B?ald4eHE3TlhQTlkzUzdxSW02QVljMGEyT0ZDQ0I4TWRLN2JSeFp5WndCdk52?=
 =?utf-8?B?aUJmUlpUWkw2VmRMQjRHaENCdi9mQ01mWnZyTUFoY1dtenZpQ1p5QjJsY3VK?=
 =?utf-8?B?b2VLQTdUd3RCV0VLeUxveTRiSkJZQnVuOElSTko4OUovZ3dxZ3lqL2tOZGc3?=
 =?utf-8?B?b25kc3huV2ZQbS95dzduMnRWWncyZmtuanh4REZENExZNXMraVE1N25zMVBy?=
 =?utf-8?B?OXQrMWhGUFkyT2Y1b1M0UnovZEVBZFdsTU9DNkQ2bnBMY1Bvc1hWV2VBSUVD?=
 =?utf-8?B?YnI3YXFhUXAvaXU5TEpXRDJjclA4VDV4ZERGV2Z4aWJUNXV2N1psT1pmcmpV?=
 =?utf-8?B?YVB0ckI1MjZnUEdHOS9OVy9kYWIxNjEvakorOXNIWkNzVnJ4MlZGSXFaK2Yv?=
 =?utf-8?B?aUZmUjFLVTFlZXBHNnBpWkI4NHR4VEdINkt3S3ZaQ25lUVQ1UE5qUjEvWmR4?=
 =?utf-8?B?aktrbVNiNU1Wd2EwdC9UTmd1TVgwbE1lb05WVmNtVC9KbDN6b0pSREJ3ZWd0?=
 =?utf-8?B?b3ZwOXJVUExWZ1B6Z0pPbEFoWDQydWpEQWVUcDV6S3dyLytjUzQ1dTR5ZnNP?=
 =?utf-8?B?U3h0QlE4dVc3RzlLUGRHelFCeGZscDl1bGREU0lHY1NHaW9oK0JZOXNTWVoz?=
 =?utf-8?B?TTVmd1ZHSzNCRWpGWGNzQVVMVkgzUm9rcDJTTmlpWDVIdHdpT0hLRG1VWDR6?=
 =?utf-8?B?SVFXanloTjNaK1FZR2FXcnBJNWtTUm1lWmxuVEZpNmJOWE5MM29ra25sV0tI?=
 =?utf-8?B?YmNoeGdXR1RxaXUzKzZIdlFWSDRkUlBpYTd1ek5zMHE0dHZoRk40dTluSUs4?=
 =?utf-8?B?Y2wzOFpxakJmNVYrRFAxeWNRZktZeE12eEIvNklyVWtHVzljaFRJK0xpb29P?=
 =?utf-8?B?TFUzWkRPTnJOWkpONEMwWkE2YjZCZS9NMjNlREsxK1hRdG9pdDVzYXprZ2cy?=
 =?utf-8?B?bFloSFVDTXBGdHhGQlgxd3RLUHRrNmpvQU9SelZoV09mV05UdUp3VmtyMWQ4?=
 =?utf-8?B?SWdhcXhaUXBHV2M0NEZhRC9oVi9RZEkxUCtVN2NCVkZxczJWbllWYjZxWEha?=
 =?utf-8?B?N2VJU0ZwdnBBVlhDdFdrdzBVK2UrZ3NoOUd5ZlhuWGM3aVFaZ3RER2dGR3V0?=
 =?utf-8?B?cmdjRWJUZ0NRQS9mVTFZZ2tVU0E2Y1g5ZnpRSmhuSlk1UDlyTU5oU1NKaDkw?=
 =?utf-8?B?VkdVYVpsb3ZyWjNxQWwreTBmQ2hkUzBHcjI1dkNIK2xUa3U1NDFUUDQ1VGJ4?=
 =?utf-8?B?ZVk2NWhkTGJENStZeHdsRHlJVzJGU2Izd2o2OUk2TWlpVi9SUEwyak5mNjR2?=
 =?utf-8?B?WmhpQ0tEelpQczNjZFU1dGxaRFR1TXdhd1U2ZTk4SmxzVDRjclNWWVdzZjdl?=
 =?utf-8?B?VXFoOUtUaHdhbEFDUE1jOXdkZlo1N045dFNkSHROR2kzeEUrd1VZNVZsLzdD?=
 =?utf-8?B?aDRCeFFpMnJTOUZ2M1RWMnpvQ091eTkxcyt0cW0xWFE2eGtLaXN5SDF1Y3Fp?=
 =?utf-8?B?RHBmdTQwNkwxZkxrL0JUc1dtUFFvLzF3UGN3SE1nZnJMYnpueHFTaDF2c01o?=
 =?utf-8?B?dkYxdUhrZFRzK2ZUaFpUQXpIM1NrTk9GUTluMjQwakM3dktMenE2and6UkQ3?=
 =?utf-8?B?c3VqMFRsd004UWNScXp2b1JvNVlIYThaNHYxOVVrdWFnTitQR211bllhL0M4?=
 =?utf-8?Q?pdFCC7V9efXRtTFT/enC5WoM2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f88c991-f268-43e4-dfa7-08dafae8e8f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:19:07.5899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GdrAIFxcP38wPEoFVPzI2uz4gfT7ia01yYmuTZswP0mVnU2oWOgsziaxCDxB9WYng8cvoiwIofCbDOY4fHAAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7866

On 20.01.2023 12:24, Julien Grall wrote:
> On 20/01/2023 08:40, Jan Beulich wrote:
>> While this has been there forever, it's not clear to me what it was
>> (thought to be) needed for.
> 
> asm/types.h used to be directly included in assembly x86 file. This was 
> dropped by commit 3f76e83c4cf6 "x86/entry: drop unused header inclusions".

Just to clarify: The statement in the description is about $subject,
not ...

>>  In fact, all three instances of the header
>> already exclude their entire bodies when __ASSEMBLY__ was defined.
>> Hence, with no other assembly files including this header, we can at the
>> same time get rid of those conditionals.

... this further aspect. I can certainly see why the guards may have
been there (without having gone look for when the last such use may
have disappeared) beyond the bogus use by the tool.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

Jan

