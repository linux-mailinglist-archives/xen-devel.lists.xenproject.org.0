Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0884647BA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 08:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235594.408692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJot-000828-Nr; Wed, 01 Dec 2021 07:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235594.408692; Wed, 01 Dec 2021 07:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msJot-000804-KL; Wed, 01 Dec 2021 07:14:23 +0000
Received: by outflank-mailman (input) for mailman id 235594;
 Wed, 01 Dec 2021 07:14:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msJos-0007ze-Jb
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 07:14:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4de3dad3-5276-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 08:14:21 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-xLLOAa6tNVytj8IaPAOMgQ-1; Wed, 01 Dec 2021 08:14:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:14:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:14:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:206:1::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Wed, 1 Dec 2021 07:14:16 +0000
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
X-Inumbo-ID: 4de3dad3-5276-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638342860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIRH1aImBK6j98HLmRlw4xmYhA7G69JSk+OJxmaJkbU=;
	b=LSQqrD3riuWDWNEZQO/53WsbtQfmM+LZZiEx2n+pMmb28b9m5ZXLw8dP2B8j6MednQvh4e
	rgej7yi/uGzIeC4FSITsPFjBkvtRK/x/UkZ1T3XnglFN0JOuxFO8KRuKoa+yI5KCOHqaSC
	PwPAWu/9HZuq+sLvJ9olKci0rMuxJfk=
X-MC-Unique: xLLOAa6tNVytj8IaPAOMgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDpg0oItFKPGi7PT0+AW+8UeEYuUCToPjpnUe4S0si1oAoiqjtAlNHvU9oFUgc5IhGOuRrTcyKG/aYOpGLsv/kjBMiFWXAocZ1UbbM4+xu+cnkppIKWtkedafX4lRlNAYieX2pMowSr3WrqTeCYkFmIwE/1HHqA4Fb86uAMO9vNoXz+mYdmvtw4jG9zVbz9TnwyfaTAFYlJ1RiYXEGLUHnTU7K0eBlZUtQYMuHaiaJiXM9qwVj7tXgt9utg0DhtzHqhcGzPWWTMmDRfESvBLe/KZ+TBVBGP/o+JkXWwR0jy6afP/ECqYDlgMVAtmMOuBG5z1KIjaAvADZRK7eLqa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIRH1aImBK6j98HLmRlw4xmYhA7G69JSk+OJxmaJkbU=;
 b=RWBhiGvi2f0fmiYXuRs6UNDcnwuA9zbDvAfUTUikiEYWPPXpGtQ3/IxQ9IIvtES0sIlBeC4jdvZfmFPgfGLImIa51akqmYIBED2xn0fSts+1pE7rgLI8K56aXyLFAtCDPsug2QClQ71icLmnm0ADmBUd6ROuEtLwpdAgyDF+8dKB5sMa9uYE5hC3HDxu475Fea3nZkCzxQrxxQqvxUvhOWhr18l4nA2d7fD49HGx3y0I0B+Xz+EHPmRttmdnYbCIs2A4nI0t8M0GAB7i4r5w5nFkuGEPlAeLlmnAWWsVb8V5tbwbeh6bZyqIIiIYbpt+fcDyM3vXIswncprT6cERKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9a28b6c-2d60-e1d9-6e7b-21a2f1921ec6@suse.com>
Date: Wed, 1 Dec 2021 08:14:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing
 instructions
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, xen-devel@lists.xenproject.org
References: <20211129191638.19877-1-ayankuma@xilinx.com>
 <7224343c-0af9-6610-a58b-291778183a53@suse.com>
 <cb6d5e10-c37f-58a6-e1be-7dd326e2d826@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cb6d5e10-c37f-58a6-e1be-7dd326e2d826@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:206:1::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12840557-5a5b-4bc9-3837-08d9b49a2f97
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349C3B1FF53F28E10DA3D22B3689@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zv/tTx26zKqWlSZZKUbkYZLWkh8f3aC2A4LDqi7fo446ftxki/OPEXdld0mG1ID78QDIb7SXJd46urkPYOlrr9JBGWAvgf2xu5pyP4KPM5obdACZWyqUSaXNgPXqr/8OgrFlsfo1n43Kj5JJjtMuUAhXfEz0ZbgbjetpHk1wdhok6EYb5rhwQoIOfQJQ1Xy8y70Xycxi1fAygf13jJOoXK4drn+tJUEAU+YzJeLgeJK7MZaohB0mRoyYeW4D0hBTdMsbwJO5Zib7hsqvSwUswoCnO2LbGXfXZeAXpOs39ajhg7kj4F3/UsG2OMd3eDAZx+LewIEylIH/BIFef02OnnQukNV2luHOvpcFBOvLvoyUnYDYtMEZDU0U1qkKLwoqP08O4/RrXkOY/o8G22d3be2g/HpriDsQ0LlTdrTRaIQU/Jj6LHiXSZ1vobT/5He4GvEX5oXVK61vF3pyQJvKw7+EP8tuVq60BHOBL0y7R3i1nVkIFBUqBNh0N25qGi96jFWQ2qZBAMS2GOXNao5SMjXi07cdPNNPG1LE9MBHBCnaHXgAnyMMczdJWEatD10UXjNES4AiueKR7xbybrRYWYS/Hai9XF6848DsQrjo777OtrdfV6nlzkh5etYQlU2F7MKfO/qvou+mEEM9glJ2/leIMtYDNA+nipHNozIOFpiSHXXAOYKpiSzQdsy1p6FplZgHUGqnJzYw4gHMhRpFHlODVOa98/QrORkiHe23gledoKmkEXD9a/GgCZrSaej1oXVR/7470+K6o0B5cQUup9cLqcRedrcHm4YlPkTFXoCC8aMKXP/u3SvkAVz4IG0u
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6916009)(86362001)(508600001)(8936002)(966005)(31696002)(26005)(38100700002)(36756003)(6486002)(4326008)(956004)(53546011)(2616005)(66556008)(66476007)(16576012)(66946007)(316002)(8676002)(186003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmY2UWJDUW8xZnE2S1dVN0s4QlhoN2FjSklmOWU5VDFZdnZJdnhlU1VlUndj?=
 =?utf-8?B?KzBQY3VweGVPSGcrdG1zWFNNQVpmdUlIQWdlYll5VU4wUm1uUnlZTHVjclhX?=
 =?utf-8?B?QWVSaWw3SExSUERMVDNldStlV2wvNXArUjRmZkRZLzRCa1Y0WFc0VXVTV0dk?=
 =?utf-8?B?dnZyeTdRaFk5Yk9oOGVSRytTQzE5S09QWjZSRFVQQ1dtL1pLbTEyQXBWNEND?=
 =?utf-8?B?UHFHZ2ppRTFGU0F4NUZKQklwMUQ4bnRCOGl4aS9KMDlkWElnUm51dTBzZHlz?=
 =?utf-8?B?eGJXYjQ1WjJmRzBadUJoMzNxY3p1Y0p0dVdwUXBLMVhvS1BISHRLR2gxTFhh?=
 =?utf-8?B?SHBGampTRjl3MUt3MWZNZTliTHc3WnZ4bXg0MDh3YnM4WEtMaDZWc0xKUzk0?=
 =?utf-8?B?RWkvNHd5VkN0cVlTNnpQZFlwM2NObk5WNGZJVnZiVG1XUFUwYStHeDJkdG5K?=
 =?utf-8?B?dllmMk1td3lxVGJwVGR0UUJKSGx3UU5US201czQxeXl4ZEszR0kzWlVGSWlx?=
 =?utf-8?B?WTRSQjl3TXpJSjZ5T3IwcTRlNlc0Uzh5cEdkWTVCUGh6SkR4ZW1Bd2x1U2Ez?=
 =?utf-8?B?MURYK00zVEUyRnJIek1xWllmZXhOOEF1K2RXZzJCNVBuWU85NGV0aXRYVmV4?=
 =?utf-8?B?VUEwd0Q0Y1hmRitBeW1KVkhzTVRnanArazRyVk4zWFkvVzdpNTIrWUFDYkhE?=
 =?utf-8?B?MjhrWitSTDljSSs1SURYMTRRQlBBbmlsNEMrYmFiVmo4TlF4aXFNT3pyWGtX?=
 =?utf-8?B?SXNldldnWHcyMmxBNW5iY2M1R3F6QkNqWDE5YjhHRGo1djRjZ1EvK2gxZFZV?=
 =?utf-8?B?MklOQVptMXduZDA3V3dFMkFsOThQc2d1d3owOVo0UHF6b0o5ODNTZ2FYTFAr?=
 =?utf-8?B?TXdXWjZiYUd1NTBndzdGeGZHTytsTFFDVVp5YjBqdlkzR2h5VkpGMUZkT1Bs?=
 =?utf-8?B?Uk9FaG8xZ09iazhURVlKcTlPUVNZaUxQQmZiSVovMjk2VXhDUjFSN0YrVEgz?=
 =?utf-8?B?VXRNZi9IbmpHa2x1UHdTcUY2TTRISmhtYXp4TC9BcWp2S0hCZ3VLZnl6Nnds?=
 =?utf-8?B?M2dFRXBGUlN5QzdTL0tEUUIxUzd4OFZXRUNxdUloaEdwUXdHd3JxYmtNeU05?=
 =?utf-8?B?b0Z0S1o5YlUxUXlqSzlnc0dDaUNpTk8vYm5LZG4vTU4ydXBweXlEMThPczRD?=
 =?utf-8?B?bEdINUlFZWxFaTdSQ1VlaEkzejloK3hOY3R3NG8zOGtEeW9iT2FjSFU3L040?=
 =?utf-8?B?eW5LaHNhWGIrdjlzaEdaNWU3b2JwTk9BMUpER0NRcjFHL1I4VkVxOEdWZmUv?=
 =?utf-8?B?cVZYaitFTlNkaXg2L3pRdHJBMno1enlDMGdCempWZ0tYeFFlbG1USXR0MlEr?=
 =?utf-8?B?RzduRmIvSFZtRG1pVkV0clpFRktnYWpDRkZzblU1SW53enB1aVN4VytTamJK?=
 =?utf-8?B?eVhvNitZaDVkTysrbm9tKzBxeXBrMDliQlI4SlpXRnhkd0xsSS9UcGU5SGhn?=
 =?utf-8?B?WjdBcFBTNEJJekhmeHRudUgxTHBJdkJxQk96MXRjU3E2UmJsUE5GY00xR0hZ?=
 =?utf-8?B?dmR4cllBQlRFQ3dCMi9pSE1kV0tMMjRIa25NUkt6NmswdWhzQmxMek1qSEtT?=
 =?utf-8?B?MUh1N2ZrbXNSbnlncEZFenZFRkpxbGMvZk5admpLOFlxaURPTHExZldDWlRU?=
 =?utf-8?B?cUdtZitBUTA4YXY4K0JDdFdLZFU5VEIranVyUmNvMk9xamdPaTF4UkoyNnpt?=
 =?utf-8?B?M3BESENOa0ZaQmNGMGNkd2hMOVYzbHpRUVpkZkEyNW5hREorakZJNWZTRlgw?=
 =?utf-8?B?VHFnUnYzR2hndnR2RVlBSTNybVFKZUVtTzFuN0dVbUFsQkcwYWhjZmVRREVJ?=
 =?utf-8?B?TUR6UTcvNVZ1UjVhUDhQRjhnOE55RVl4TU83N1hUWS84Mmh5cnNJRGxpNWV5?=
 =?utf-8?B?bUF1c2p4R0ZnYTdMcS8xNmVmWlNWbmh3VVV6YTV3cktSVXNzSlJuVy9iZXlq?=
 =?utf-8?B?RmF6Z1YxL3ErcTQ1NG94S25pejRYVC9FYUhFZUhWMUNIOElPeFZwaVZNeUEw?=
 =?utf-8?B?MFJaRmREVkgrR1RwUGtQOHBJejF0TW4wSWxJWWRKTWlxUkFvVnE2L2o2L09m?=
 =?utf-8?B?T2c2emFpY2JBdjNiZzVEbEdkWENaOU1NcitDQUJZVlB1K0h1Z1I2OHZMVUM3?=
 =?utf-8?Q?2Yd49YV/zDQ2m8lf5JFx/BI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12840557-5a5b-4bc9-3837-08d9b49a2f97
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:14:16.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: awFhI47oEuKP4Pj1cZbrMgSpdaMMPk5vwdOQh+vmXWuVxFAJoYvjqu/3+Zq/YvGvAcL0LXmnNE0BNEYkbvMWTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 30.11.2021 19:35, Ayan Kumar Halder wrote:
> On 30/11/2021 07:57, Jan Beulich wrote:
>> On 29.11.2021 20:16, Ayan Kumar Halder wrote:
>>> +{
>>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>>> +    unsigned int val;
>>> +
>>> +    val = get_user_reg(regs, instr->code.rn);
>>> +    val += instr->code.imm9;
>>> +    set_user_reg(regs, instr->code.rn, val);
>>
>> I don't think this handles the SP case correctly, and I also don't see
>> that case getting rejected elsewhere.
> 
> Sorry, I did not understand you. Can you explain a bit more ?
> 
> Following 
> https://www.keil.com/support/man/docs/armasm/armasm_dom1361289873425.htm 
> , Are you saying that we need to handle this restriction
> "You can use SP for Rt in non-word instructions in ARM code but this is 
> deprecated in ARMv6T2 and above"

Are you looking at the correct (part of the) doc? It feels like this is
Arm32 wording (plus it's Rn I'm talking about, not Rt) ... DDI0487G-b
has nothing like this on the "LDR (immediate)" insn page. And even if
it had, "deprecated" doesn't mean "impossible", so you'd still need to
deal with the situation in a way that's not silently doing the wrong
thing (IOW you may be fine not actually emulating the case, but then
you need to clearly fail emulation rather than using XZR).

I have to admit I don't recall what the behavior is when Rt == 31. But
what you may further want to deal with independent of that is Rt == Rn.

Jan


