Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFBC4D4E2C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 17:08:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288471.489148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLKr-0008DR-6P; Thu, 10 Mar 2022 16:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288471.489148; Thu, 10 Mar 2022 16:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSLKr-0008B0-3I; Thu, 10 Mar 2022 16:08:17 +0000
Received: by outflank-mailman (input) for mailman id 288471;
 Thu, 10 Mar 2022 16:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nSLKp-0008Au-Vb
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 16:08:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a2bc5ef-a08c-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 17:08:14 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-R7bo826bO3iJT1BY5juSQg-1; Thu, 10 Mar 2022 17:08:13 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM6PR04MB6757.eurprd04.prod.outlook.com (2603:10a6:20b:fb::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 16:08:11 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::dd50:54e6:1f96:3b33%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 16:08:11 +0000
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
X-Inumbo-ID: 4a2bc5ef-a08c-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646928494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41vb8MNvBpU12xre5qevGtO4jMVtPh5Q8JtUiG0Sg0g=;
	b=Pn+1S0wtYtQAE27OqjqOpebrc7LtjYuJL0H47THCx//3FIZoxwzzT1C3I1VfDHWvweaHEV
	XidHTf0tEnT8SKMrqpRc+PNGnPhU3cq4l969BogFEkye0oGHJMPlnNiSGq6co/6nS9rzGz
	sSM8bWr+w95xoFRnHP0R6pJP627Xunk=
X-MC-Unique: R7bo826bO3iJT1BY5juSQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+N8xP/XWTcftcBsGEZNZjPtaIao/0iM8tTZqlQw9a1CtjRrknyO95XZ3py8nmFaHULZKvc71WyyjcQpmjgzczx2W7zx8Jqes70nh0vWy5Z5vUtoN0QzK0mneu8gz9afjoOQBbUt4A0fHSJXM4vBS3fxBKIt6XIZnatV2gba32kb+dqdPaMiLqx1EnZORkE3gRqqV9qxzFOZ01T/KnwSvVtNBibL+cB0+9Ig+3nUyyXqfQXPuEvp5tH098ab+b9xhzQr5z6ozU9i9v/f/T4e2Ko0LwlmgO2+c7TcROWVmrlZ+8QPVxqfgnRsbQgKQ/Fjs+EU7t8Y6Xh89IjoIQlFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2ajQbdS592gU6A5RpIAVFt/gH7Fr3CwjQ3HlwM07HU=;
 b=a/b0iZFk18/ixBC4sSTZoKxTTVU1jDbctbgRHbzVBJ1CBnTkYYVb273r3rbBh8TqVvNJH57/lfY9o0GXMm9wSr0bGXCpPi0a76MaU/JHINF+dMz6EXAWGoFabAGvSSN0SsCVrw85Wh9xbZtwaFgxA+VSA3eqZvB/kF6vRU4jjsR7c6VqKaVaRl2ocCMLiEOAq1xMlAxRXrP3xnKqEaORvePUVP7RUk/NHmfqmo/VPN0HwkCu2Vq1r4vBYvWZ7l6tcbFWK14FeSEMV005Iwrfh76xQ013vVTtI9FjYoHJSUGa5ogJBndAsuQPj+DGiKyfeVoBz7POzrfoT/CGJzJ5QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
Date: Thu, 10 Mar 2022 17:08:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YioddbNor6w/U9ed@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0110.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::15) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec62654f-50f5-4c0d-acd8-08da02b02cb8
X-MS-TrafficTypeDiagnostic: AM6PR04MB6757:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB67574CB7664B67A0A712DBE8B30B9@AM6PR04MB6757.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FIWGPXvBZ0sKZHTX4uNHVe10REurJF4W367iXhH21diXvWfSMV2MCBPgjnU5a0NW/j8Vq77nvACkmVHG/kgECojB3W3+z4jaXU7FovczadqOv40zDKSOrw04aLccocWgFKDNqRFA5udrVhLuNH3HhhhbFXDYNZnQJx41hyQE6CYrHbzPLpQtDIhKhougWOReouFVZmOrVaQWCKKj7XK57GHO3tr6786JIzC2HAA3bopWi2Tba4lEzNJ4N9R2/JFfUBvGON//6PQVrbuqAmR28x5yI63rjQvbMUy+oIKkm2jEYbgrYqseawZl8cxfus4JgtLDCbyEXPqXGaR+s5X9WuRTjxRHPKmWxSBpjy0JhNfd7KTdxaShK39FMtYotyS7TYt+ZF6xp23qiBmI+bpxscEFadZcNVzAClw50Vt9xxLsmzYNMRhQvxtBjVnOWlk3p8zAYrj+OgyoFz9qiVpPwKA+usMj1wNCbllzz5u0b0Fc3xQMt6ea4wlniuUsLbOb9MEuqB3tofoQdEoGl02lIjvkOnPpuOiJsJEjr3az0O6lJQ0Pkim8s4RHW3Fx1696P5BJYWM6aqnMbSeClj9ryJo0IVS7pyEmz6/gK3LmafawytGe0lxt1LXUqcbF6BFH+s5ez4bZz9tthtkoDYMBZGQCB5xB4iqcN8P4JQc5fNKsb6z5Bb4pGqxIXj+HoRKKcZeRYBYLr+mBrnQ9BNLb7oDb1emJEBEUkb+HWZe9T9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2616005)(26005)(53546011)(31686004)(6666004)(83380400001)(8676002)(4326008)(6506007)(38100700002)(6512007)(66556008)(66946007)(66476007)(2906002)(8936002)(4744005)(5660300002)(36756003)(6486002)(508600001)(6916009)(316002)(86362001)(31696002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQKs3fYVK5mgiNdLcTWTtJg0atcLoXP48vTehYaDdoZpqYryLqQAky7ohgwR?=
 =?us-ascii?Q?d9Q+BMl4TdMsAp6xIf97pQLsiTaEH+TDmLqal7o5WfA793sHRnXRAwmCCYzD?=
 =?us-ascii?Q?kWt0r/hglaDgfuSJL9hKL0m/c+zKqsE/nx6MSzfjGZQuSI2b7OzscC+xxaZu?=
 =?us-ascii?Q?pKMK7WvjP+hDVVrNRtpt5VkfRaqtf1ZXbYBAuyQ5zEjr2yZr55eHFKyFCABn?=
 =?us-ascii?Q?0/zQvEYC6V5Fcx9JYZmiwBRPC5Rgr+6wWZOa5FFX8e85eyAieRa4zlXN9Ozq?=
 =?us-ascii?Q?JzuCb4eY1NFkoDgRnbRN+MVd3xFJfY3tPX6oWFwG5tIppVLvVAxY7T0AEjLO?=
 =?us-ascii?Q?apBFfFFZ/VIO30hzUr72DbXa9R/SJxInITvWFlDkQ7uJhjc99KFP8Et4zqmr?=
 =?us-ascii?Q?xH6oZMO7yr1RVrH+vE09IRFa3gRn3XEwRFM2KE0KbCPzrr0yLME5mHS/tkRn?=
 =?us-ascii?Q?Jx8uIOoIAczhzNaWFuLkMyLjpAQNopEbU6ru/9l9xtGCAQCMpu03w0BNeVKP?=
 =?us-ascii?Q?zBvRXxGKyzTHNxamX/ZLrM3Oy9KDfR1Qn+J5uxl+zIFqUym8bySbMpddecCL?=
 =?us-ascii?Q?4YHnUIJ18weTI+t1MHTkuvcdrLFywcOGWyvLw7Fy0GAYZxS5xMTmDL1QTB+7?=
 =?us-ascii?Q?801JcQ9wAdjhPUtvx4VKZxL0kDmgLix55JCcv1IKyiLSH6O+KTWPqWeL+5Al?=
 =?us-ascii?Q?2PkFaytlNOvBVvMmE3jTDyQ1ldIQn6B/Bl2uaNyOWLEEKluwzy78tJOZsM/4?=
 =?us-ascii?Q?R89tH1DzzNshKxZHvAxiG1xW1a3IolCcbfnPXCgPtwZrf3BA6UpKpVo2bS1L?=
 =?us-ascii?Q?y0Xl+4Rp9hO0SiZ+MA01ce8AarHAlj15vvBGoqVWid731e6XqsuNhSnAy0r0?=
 =?us-ascii?Q?k+LxZ2NIx4GGr6x75kA8u2KUcacK9L28l6TD4HEf5m6RycxKnzibnYSPXF8s?=
 =?us-ascii?Q?WaLZify9MdtoCrwVmIeTHWfprL68vPEcOnrcuH4nNq1n57ZLYy8zkWhS1l/n?=
 =?us-ascii?Q?0pbPikWJhdZA4aa3c/ET0RLUcczq4xLzF8Py2MtGV/hckw05mE4/e209StNz?=
 =?us-ascii?Q?ikdD8WgNg5DSp7CiF4DLnFOreXxBUIlTyAyR8/m7E6r27+BmWXG4CqYvcwtD?=
 =?us-ascii?Q?ojK0sd/335eww5CWlz7qL0NCdroLMecE5PiyTv5eeWUopzCXPfAc6f+lKfg3?=
 =?us-ascii?Q?facQtDYPH++ratHwKUtjxpMxbCr9OwgFg6EK6RDkDti9cydSjGh3akkVOWpR?=
 =?us-ascii?Q?4MK1rsicuDihsxr1XZaFkFkHuyzBJfwU/crqrjuYNRGIUNFeFXSHQX9BJBja?=
 =?us-ascii?Q?ig7vGBWGD4oWkX2H3wxEdOCOasR+cbCisPt8PZPlTy+mZhqgWYoGBep6KJ6J?=
 =?us-ascii?Q?lYb4bvuAnFTvWGiorlw5BGMTVHtuvzbxQGx1nAgztF2vS8ZtArxoGufeI4+v?=
 =?us-ascii?Q?or+eLc+hIjcKRGQsCAcT3lIwp/vZalfIOl79hVdgDSCVT486wub+oBgvlcEo?=
 =?us-ascii?Q?UedTxnLT05LECL8xw80qrpxXdRl7wSUp777freX7z+rKo2B3xdEyVagidC3j?=
 =?us-ascii?Q?WIx5n25NN5Q4rysn2XbvUjWxyUzyaBQe5Ipo6uh5mmQf5aCVWkooiPZ5iDfc?=
 =?us-ascii?Q?hJjycy8rv17HUnrB8yl7R9Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec62654f-50f5-4c0d-acd8-08da02b02cb8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 16:08:11.8208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOq9gWxr+u116/tekgJfZYF47maHfLmG0Zt6lEcLDNfn18bsVu6w9Dq8PgZBWRLs8gVO744SGVHQ/W4jEo34Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6757

On 10.03.2022 16:47, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
>> On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip=
_amt, unsigned int idx)
>>>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>>>                                             PCI_INTERRUPT_LINE) : 0;
>>> =20
>>> +                if (uart->irq >=3D nr_irqs)
>>> +                    uart->irq =3D 0;
>>
>> Don't you mean nr_irqs_gsi here? Also (nit) please add the missing blank=
s
>> immediately inside the parentheses.
>=20
> If we use nr_irqs_gsi we will need to make the check x86 only AFAICT.

Down the road (when Arm wants to select HAS_PCI) - yes. Not necessarily
right away. After all Arm wants to have an equivalent check here then,
not merely checking against nr_irqs instead. So putting a conditional
here right away would hide the need for putting in place an Arm-specific
alternative.

Jan


