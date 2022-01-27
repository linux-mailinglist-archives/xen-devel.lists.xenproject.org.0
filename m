Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB849DB68
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261204.452001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzA7-0004YI-TI; Thu, 27 Jan 2022 07:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261204.452001; Thu, 27 Jan 2022 07:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzA7-0004Vb-QN; Thu, 27 Jan 2022 07:25:43 +0000
Received: by outflank-mailman (input) for mailman id 261204;
 Thu, 27 Jan 2022 07:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzA6-0004VV-K0
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:25:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54ecef95-7f42-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:25:41 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-GoEUB8VoOTqR6oVs_tWYOQ-1; Thu, 27 Jan 2022 08:25:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB9173.eurprd04.prod.outlook.com (2603:10a6:20b:448::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 27 Jan
 2022 07:25:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 07:25:38 +0000
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
X-Inumbo-ID: 54ecef95-7f42-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643268341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=giiA0YIIHYXKkbOfu9lf9cgqbEe8SY9/S6H2aCDZb08=;
	b=CRytd9XWKN+ZFd1YN92wrzPf0j6bkjnIg02ChFrmWDhB4lEumQb6FkBWRo82sxmB4WsQF5
	jM1SUZL0ZcgB9f7IDShS/x1d0I5ztKvCuOqqRCkjHPc+uNNI2f6sM2EX1XHe8kmqSTq9rl
	i3O9+qVkt8ZI5e/ueEEcyxsyD9Pkf1A=
X-MC-Unique: GoEUB8VoOTqR6oVs_tWYOQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ej12aIky/cgW0n+CunJ6Kbgcb40AY1gl97YkUqnzrbnrXmlboMx8bwMW5KubB81c1ZLh1VFHVNw+EjrIXUvkr7WDO8D/eSG12hNLVYF/bcGW38EE0hia72dh4L3pHrqj5R+vicV88XuySZRorMZGi3hY+dX6GRAVaW6auLcCpUvDCmk+THTGgg+rEjCHOMIzD7Fvrnhz90/BjFiOt72b6y4eBROM5bnr/riTtJUKKeuX9CcMzyRF+sK77j9WNHcHGh0JJ7EH0anvSTZjEPvtl8iZtKneigbu/JJFPPcOCz/AjCD4nq2ZLlIps26M22qMRPBBNw4RupdPCU1rifzoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaotrinTgkLyYR0wKqR/kZNg2yeHCpazezaokuSXli8=;
 b=Lh4V2xhuBbmyrP3UGXLBd4WX1ysPQ48lraCD9hu51HbHudZmZp14XMaGqA1x16mY90TMeTAYmyRQqkC9mrCbv9L/wUgR6n7l+vnoNtU4dS0/94DK6cTGYFx8fTRxL4X72QCBcAhw5OBTKjYL+7arFBt46Rpn0ob5FXBqdRGAgW0TXHrgMIaEor/zVMdAN+uVG+Uju8yLucLZ7dQkzh7D8ifLgfkmaUJxt4pOQNLHGY4zCxgDP+oRZIixENE+9jiBlcrU8m5UichWeMeJeyTYFp/R0EIVDJR1RLF/qMO9VK9QrmEsCMQ/2+wcULOMZ+BnLGZX1o7ewojSqqLNjQreIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6431b317-a3a5-013a-83e4-37b5c716ceb2@suse.com>
Date: Thu, 27 Jan 2022 08:25:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
 <20220126084452.28975-4-andrew.cooper3@citrix.com>
 <f5c1134a-f446-7031-877e-6a3177120de9@suse.com>
 <e987b428-d617-ec8f-16f1-7fd32005f9f3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e987b428-d617-ec8f-16f1-7fd32005f9f3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0024.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0066a237-a94c-4902-f1d4-08d9e166371c
X-MS-TrafficTypeDiagnostic: AS8PR04MB9173:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB9173B9931FA3062A5CEF5565B3219@AS8PR04MB9173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UxAdlF73ZE95Yo/Vg+SxFpzBSOLMDlNLya3/a21abs1KTAyGenMqN78WbWaxxTYqH/75o09My6MwnVPYlkJ7l9RNNN2JMO94i1qz/nb/4WegaT9Bff2ph5N6J0JbDwmAAS8wKxsrftrgYma0r0E9lohwseFIcFkN4Ugfc8GF1aNc96n8oTc8EK656rqC9KItvxA/1licmzF/1NQ/I9+9J04lW8wmi5Qp7KChNwaFpkR36hWVKT9qiK/1JmrCSaf7+l/FWnna2U+w51WmRG/2pmn7amLcwlzWku1mkRcD+QhCUuFVV6skh19kRGvL1GqLP8bAHodvwnI7HhJAZ2L/Dw8YTqxMdc92Tgzx4sAmB6OPWLxIFLjtseg3Ep1UGHBQR19ZA/g6eR3Uo1L8K4sV6qGua0cdLubFs7VZhZgi+RVEM52q/NfmO1xa4agk7Neu2nEEikNq1uKYys4UzL5HI6XBoyHp5L4e4v+gRwocwFd9hwDHpkcZaIoqr9RXjf1XoB0TG2bX5GK3Xant2/k6KCMHW73FvGWipO0pvxMfpJnnbxC6fhPRb1gyyoZAap7akFbTZ8pKyBo23UuVtGBHcg7/XVz+QjUD1akDB0tuzeR47r88e+PL8BH9MwBlfYp5TwOLjivEFUeP04OjjNJHPT9Za7DF23XcRkznxT3JY+vcz8BsBwWb/l77bu4aIVoAOHE47EUHiALjCXqWM6FKeW0B4VF2u2ltMrolu74zg0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(8936002)(8676002)(31696002)(66476007)(66946007)(66556008)(5660300002)(53546011)(4326008)(86362001)(2906002)(38100700002)(2616005)(6486002)(6916009)(83380400001)(186003)(26005)(54906003)(316002)(508600001)(31686004)(36756003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17BmMG4Gtmy/1YD8B/3b1dHvtOjtYNuL79jS6ftCI8cftKnbdWF5oui7DEBj?=
 =?us-ascii?Q?or++RZhlW4DVha2DTA/5dGKvY8mKweI0fCtPFzBfUORtX7hhiasoCwCbTc7A?=
 =?us-ascii?Q?qNgITQViCOTbyIGwTdZOoo4ggi+A7n+WKPDbbzRnU/v3oH5dq11wHFdl51KW?=
 =?us-ascii?Q?EOzgclGgiCeHl31Y8UPuz6Y18yjy90nQpJWzhlj5/9YDUOIJFCBiWrBh5T8x?=
 =?us-ascii?Q?ARml7kI4JfoBKK4UKDQOOh03j1BPzZ3f9ZEBJGyxp+6iy+tdLPJgA7+MHDgW?=
 =?us-ascii?Q?wdCa9IlTuHRl7IpHbXEscUcIhWhXDie7FZm8CHWltDKtaUkbFKDv6gR9HnzX?=
 =?us-ascii?Q?iI/5BKbS7UARvBnRIlU6/r5xkhnAiU4KT2WwkrINKiEAVBS4OvjP/FX3Cd+a?=
 =?us-ascii?Q?sqZpo5Hta9SpqwhPT7k/g9AP33N+xPEQclkKI1lp7qhEi813X5ThQrW1kVM7?=
 =?us-ascii?Q?anByCpiNkbzdxiwJqys6uWTX+dzyUFGUmYwq9enk1jNeYbHz/QD7MFTKskZ1?=
 =?us-ascii?Q?mlt+HkSOaXPYsL+iZlQn6EQD4n4BzznBVK8xW9u1TVnxxWk9ZDjgF7JGwd3G?=
 =?us-ascii?Q?oA6guG3LLdOq1/7NwXpMA2gWOwLyxc7fPZBoySKfUb32dBvTIJY8+ktnqpu2?=
 =?us-ascii?Q?M1NPZseyHUQjGREHY4zgykUll9LwnuVI655+yhHJO/h+HeYUY5/O+2rSZaII?=
 =?us-ascii?Q?za+QY7I6jd6cr6mGOg0jRo91fzwdJvSqTsGDJo8BoG+lwACmWVoKzZirAl/3?=
 =?us-ascii?Q?jYQDCv60ZvcWiR3bGtKAEt2/gNSyjqlkim4sToBdJJO4a/FfeIHxSGk7bUty?=
 =?us-ascii?Q?ihODrIMaLrjNn9KWo76RpqcQ+b+s0LII8YruscUJCIq7/5oxRacrNAV5MxK0?=
 =?us-ascii?Q?OwIqLQbGgWw+ITIGNkbNOgwHyY/Yz4cOM60qbrMMGVqgMI7hmzHXTYa/VBym?=
 =?us-ascii?Q?1b/w7nYzJ719n0bqZPo+D/wWThcFmY2OK/qR8VnUDdro/ltExC3BedM4wPmS?=
 =?us-ascii?Q?24zJxg0N7Zj6HBHwldMdbyS6xawD6ln6bj35jgrAt3Nx9kTL9L48xkCaI0JG?=
 =?us-ascii?Q?K9spHqX546zyfC4Tas1UEx96Mo0OiE99ajKUJz/7Edz+vbLKecebaPs0xaov?=
 =?us-ascii?Q?8ShwPuTDjjOSwhbpIJp+v0dPC8U04KVz3qJ+WknfYjA5ENyeNv0WUZU8ONDP?=
 =?us-ascii?Q?cY6yliyHaReM2JKm6oKZhhqy0kReCRXazTXTGiEpZvfeNdP24avucpHtaduK?=
 =?us-ascii?Q?sL5P6TxAvp5HZmqfJnyoZh0Z0p5qMGU8PNsQ1dsivwj4yrnFgkBRyRAsNKAc?=
 =?us-ascii?Q?Pgtjhj7gLeA2bwRl4UT2oxu+n946cOvjKSYmbCGYyV9oxfafu+6Z90h53v9J?=
 =?us-ascii?Q?Yze5IOd8GhzY7XxZdHtkkwEl9acNRqW40r13J6Bn05WNVBwIjtq6s/EhqsMI?=
 =?us-ascii?Q?/+mcvQzlgL6Un14uwB4wxC1VdfFGtOX0I8VeYeMb0AE0UHnvLig5A5BC7a0B?=
 =?us-ascii?Q?sau+BP0sUg/nhMFEz8kN8Y0f2mjeHu+SNnJ3BJj+t/KJKk9aXj9Hcigs3gbH?=
 =?us-ascii?Q?hCpYstj41EtO0Ad1UyRuSlnbbjleufQ6TfIRk08DAeshkPuQ8L9+C0ii2J+4?=
 =?us-ascii?Q?7pTaN7v66nmdgALCquIQy8U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0066a237-a94c-4902-f1d4-08d9e166371c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:25:38.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9b8Q2OkXbVMgpWOpe10IaMD5eRTyzs8C7O2Zymujdgeu7TZRds56Ya1LQaBmxL8oRifwezJ3UJgDXXqaX727g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9173

On 26.01.2022 21:16, Andrew Cooper wrote:
> On 26/01/2022 16:50, Jan Beulich wrote:
>> On 26.01.2022 09:44, Andrew Cooper wrote:
>>> 1) It would be slightly more efficient to pass curr and cpu_info into
>>>    vm{entry,exit}_spec_ctrl(), but setup of such state can't be in the
>>>    ALTERNATIVE block because then the call displacement won't get fixed=
 up.
>>>    All the additional accesses are hot off the stack, so almost certain=
ly
>>>    negligible compared to the WRMSR.
>> What's wrong with using two instances of ALTERNATIVE, one to setup the
>> call arguments and the 2nd for just the CALL?
>=20
> Hmm
>=20
> diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
> index c718328ac4cf..1d4be7e97ae2 100644
> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -59,6 +59,7 @@ __UNLIKELY_END(nsvm_hap)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* WARNING! `ret`, `call=
 *`, `jmp *` not safe beyond this point. */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* SPEC_CTRL_EXIT_TO_SVM=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Req:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> Clob: C=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE "", __stringify(m=
ov %rbx, %rdi; mov %rsp, %rsi),
> X86_FEATURE_SC_MSR_HVM
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALTERNATIVE "", __string=
ify(call vmentry_spec_ctrl),
> X86_FEATURE_SC_MSR_HVM
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0 %r15
>=20
> is somewhat of a long line, but isn't too terrible.
>=20
> I'm tempted to switch back to using STR() seeing as we have both and it
> is much more concise.

No objections. In fact I think when I introduced stringify.h over 10 years
back, I didn't realize we already had STR(). Quite certainly first and
foremost because of its bogus placement in xen/config.h (same would go for
at least IS_ALIGNED() as well as KB() and friends).

I wouldn't even mind phasing out stringify.h again. Or maybe we want to
move STR() there ...

Jan


