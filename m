Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3BC3ED3D4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 14:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167314.305388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFbZk-0003hb-9Z; Mon, 16 Aug 2021 12:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167314.305388; Mon, 16 Aug 2021 12:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFbZk-0003fA-6O; Mon, 16 Aug 2021 12:18:44 +0000
Received: by outflank-mailman (input) for mailman id 167314;
 Mon, 16 Aug 2021 12:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFbZi-0003f4-3Z
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 12:18:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e24506de-e292-464d-bd75-945aef955593;
 Mon, 16 Aug 2021 12:18:40 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2055.outbound.protection.outlook.com [104.47.5.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-laEcj0KmPTa_CXdPoi-gAw-1; Mon, 16 Aug 2021 14:18:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 12:18:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 12:18:35 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0136.eurprd07.prod.outlook.com (2603:10a6:207:8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.8 via Frontend Transport; Mon, 16 Aug 2021 12:18:34 +0000
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
X-Inumbo-ID: e24506de-e292-464d-bd75-945aef955593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629116319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UewiwcEhmm0LvOEalgiQfprYe3IhHLTTcM1LZ2QaKTs=;
	b=lsMuBmF4hTDHIv1yYeKvkmL91eyD0ot2j59P0nxrmfQjUXIbDhgLwmm9aLajg1X0v3om+V
	D8DgRGQrP2WjJWVUDEiZAGZZUs1LMmlWmQ08MmQnG2JTV9tE1umd/7w5lg4Rz3cWBlw0p5
	D/RvvFb7GKdRxQp3jfyVLMFGp2jfss0=
X-MC-Unique: laEcj0KmPTa_CXdPoi-gAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEb6M5xll7AcrdZP7NgYYJHI5kUrCsn1knmQK/pLw5lSWAC8/K8SSeFv+nWFO4ZCkz5z2soFZ4Gbk/Isd3d85m31yclSYM5BUmjaxzSCOIde0brF6WkMvjRjOaKlgZrSBFzXz7M8ds9l5G7Y65d+ckZ8W1jGW3KOa1oijfJF9MgjZbRmTlovK6ZEYjST9Cl+0CWS43vvqjKcFYs92HSonvZd+Z/C6pe5KwuWVA043d8jE5Y2IP9U0QvC+T+/e9TuZe0EOwsGUb8J5CTZ2tt34dPzOa+UDhSQI9YqgzpU4djDOhqF8rQBaETVclxxZieELFNhA1ZXjfRWcJ3Xx9iRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLdrxTGdZFCryAH4GWRA2jk7HUt4Rx9l8xGQOGwP3H0=;
 b=loZkZQUyxBJMX22ySK3AAa+joX/75ewAt791bdWzw/mfzDKGIkevXMQoUbaF2U2JSXASuRNHp1Ygzgt2r6itKbUkL9eaQ0ER75cDKEv/ZZl0M6ye8bSPwCBtvsh7PP8JRLPDG91N0tFsUl1GKr2dSNFdOMho9vwusBxnmRot9U/0WdQozcBt/OCQblwcrI5jD+IcvmEwjEJtLRmbGzsI+4YejHrgte/V7T7lpC7kQdTi/30o2wRO1BaFzjfgXrubEGQhgqQk4foy78XLk5fMjxfWoeBxC6gvoIwIfG6XoGGxphe7n+tP68stba/ExOEYIm2CEIuN84e8ReqyA3wDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
 <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com> <YRokMeJ2bMLAZFD4@mail-itl>
 <7e88f6f7-afd6-d12c-8a14-a5c3853d0a90@suse.com> <YRo9LrkAhkDSF1iq@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33258024-41f5-5a39-3549-df424f995513@suse.com>
Date: Mon, 16 Aug 2021 14:18:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRo9LrkAhkDSF1iq@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM3PR07CA0136.eurprd07.prod.outlook.com
 (2603:10a6:207:8::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 732efe71-d63a-4098-4334-08d960aff84f
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311878C1627D8E670B22F32CB3FD9@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t97GP5da1yflZ4Tv3xTPN19HNcF4YyWhiiTv+liXMh+qHMbp5mxQs7BVo5BgcVncBErVwkVA8Z/Q03mwAAUibWplfuZ//TeAniOJSWZg5ZHrLy2kOXWO5NqWci5g/I4pmxWs54hRyp6+b7wvF9dwANYPHqCVun2FQakZkt0/gzGnB/RS0DUJYw/e5049LnZYafSrZAq2Yfre94L/LzukE5Vymrdzj6i4kMg/72/P1fUkHjPuKkgwcRSboLPmgFbd9AB25sM8/TNJmnC2x/F5Ndj3Az6yOgxQFB6adm0C4qzt2kAQM678PQ+VghIr2oKW7x+dyi20s3JsE/sZfr8CwaVfnizbcO/rm9PZsNCYFzl/nAnQKFezs861VfG1qRygc4AFHYOSj1wI1HPOLBDuto5Qtvf14ce/96gYZc7SwNwckFCXpKwhyid3w2cmUsIS15d3X9eg2/N/4V9W8dkegvuTwfwq2iTeOQQ62P78weY0z/N4eqFkg+9e5cWiDbIM5uClGdstzNz3b2EDYwdECxBUCEud4HNdFI2lCDqQpGKQ0IxDoaF92LWrabOx2BveFifqIzIiMgqGnNswh3sFapTrHOR2IzaE1RmuK3J91eJwTkdQeuj6NjTeLH/cBIPZ3YoK2WiJvDK6JuEyExGUI9FhUPlYkUPjFjPhduZABjcAHtor/xx1lB+waNI++AxYOqKOecC76OghIrIfLWuCV3estnN2D27rekuYOaUyRykoWM8sRNAiAWrIs9DMTqFHPH4lj4dX4Jdlpa/LQsN6p2wtpORnvPgBICzDWX+kfsgMCpsWctNuh4NwqZdzc2T7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(366004)(39850400004)(376002)(956004)(2616005)(66946007)(66556008)(66476007)(66574015)(83380400001)(36756003)(2906002)(186003)(316002)(16576012)(5660300002)(54906003)(6916009)(26005)(86362001)(966005)(31696002)(8936002)(478600001)(53546011)(38100700002)(8676002)(6486002)(31686004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9nmuZDZLQaX2IvBEkXcHg4fMxYESeQA/tpnivrJR3o1BQPYoShqwR7AR16Ef?=
 =?us-ascii?Q?REfAYuq2oqgne7Cky82iRKe1lphD0s8B7M2N8BfrD5We8x2fb9XVmc8Oxxps?=
 =?us-ascii?Q?vcQTEpZjaoA3LtvDZ5zNy4SSX4iK3dj91VEmAn6YxFs0tt9Un9gES7w4gaWH?=
 =?us-ascii?Q?5IJNa7xNsho9ohMH8AxR7KtzZgjSI1WwguuU07dTrPArjV5v/ulu8f5MHAEf?=
 =?us-ascii?Q?axW+CwVqNvOcRxZLTLgyWqwmdlqCLzjNnQ289hWPsDsFmAAnijsiY6N3TOkN?=
 =?us-ascii?Q?3jNQ6bhMZNMKbLG1HRLtbix81KkVpwodW6nXUdiwQgP6Pi6dk0v8gGTbLR+R?=
 =?us-ascii?Q?4a1EyRjG1KXQfBEMCy2k2DY8G4teBKqKWNoLPw3YYZcJyJscJQSrziJWwRrr?=
 =?us-ascii?Q?2Wg5CZaRo8jekVpsDOhNMiMaFAE9GLyTv8dV4jOdSS87FYdOHQnPS0qMvY6y?=
 =?us-ascii?Q?Be1kac3KuTC4G4ZeroZjD/M8DUp4cNOJyEnxEoiWN2EdWIkbP9cJAUpxZOHm?=
 =?us-ascii?Q?Uh7B0Q8nFn8VvCmdYZ8nMt86/kqYYKTImDlPirr8tMmoGDFwJBXg4KNcC6X/?=
 =?us-ascii?Q?chYjE84hW4VdWKe6fKHCJmIJJZqte40j8Fcu/sq6XtY3aqYKPfdpiIQ7/fmE?=
 =?us-ascii?Q?SEJRdvqLLCzkC1kOYxO4HuBLb3KTKtpBWnj5ssRvwMuOBXnnWMq7WilfPx0p?=
 =?us-ascii?Q?AiBRoDcgqTgdn11mx64YRp5mTsSBbriHisqdTuziiLC/cw09vYwNlDDRBk94?=
 =?us-ascii?Q?2F8Q3dKU8bBq54+WiMfkx9rdQlXQAbj+N/uywoBNGTTrm1qrJtuhKTbx1u5P?=
 =?us-ascii?Q?N9RRyAYWPROq5sUwCAW/u/Iz4HkU7cD9w5Hq6PVKmb93r4YwUOF/7It0Fc09?=
 =?us-ascii?Q?/RicL9PDxBmngcUFB10uWLt9NKml4kUpS7E8dcK+pj656XmQTdhL5qUp+S6j?=
 =?us-ascii?Q?AgxYYP6LqThNelnNS9nxE4UckY5xk5jyIyh5SJYnRe/chd+DQID7WmnlJgMn?=
 =?us-ascii?Q?nrfZYSFyYID5wBaiTPt3HpQTsQCHZJur9sk8MOUkGaqp0u8m8g5FSNaLC8FV?=
 =?us-ascii?Q?OCi3dqzhxy1TV4S+WNQ31sI63L/AXUzsmXj0h7457yXc7PkBQnGIdcMizmpU?=
 =?us-ascii?Q?y9hXMe/UvQ6t2NMX/bYeveJ1qtjZmtCOfVKkXiCWLZzT8KEMVIglF1anZYgH?=
 =?us-ascii?Q?KCQNOWcabvt6ihmFC3hVKPtWXvgdIlrI98GzmKN1q+J6vsTHiinYmxoTLSCV?=
 =?us-ascii?Q?XpzrkILTc2IE4tQIYbITUHsTdATvPBc0INS5md13KWukS/UcEbtDL4H+KfmZ?=
 =?us-ascii?Q?NMxTpJKXcywdpuTMelhxn6Cm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732efe71-d63a-4098-4334-08d960aff84f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 12:18:35.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u9otsvjlR9GteqqEqsB3nd/X94c+y1G5eZhpUiqKTO2e+Zn5TtlcoQKIbV7fPpUyjTdvC/Nql7svsH/OJDOhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

On 16.08.2021 12:25, Marek Marczykowski-G=C3=B3recki wrote:
> On Mon, Aug 16, 2021 at 11:18:31AM +0200, Jan Beulich wrote:
>> On 16.08.2021 10:39, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Mon, Aug 16, 2021 at 09:55:16AM +0200, Jan Beulich wrote:
>>>> On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> Besides standard UART setup, this device needs enabling
>>>>> (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardw=
are
>>>>> control flow (MCR[2]) is ignored. Add appropriate quirk to the
>>>>> ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). Th=
e
>>>>> new function act on Exar cards only (based on vendor ID).
>>>>
>>>> While on IRC you did say you have a datasheet or alike for the specifi=
c
>>>> card you have in use, may I ask that you clarify why the logic is
>>>> applicable to all (past, present, and future) Exar cards?
>>>
>>> The spec I looked is specifically about 2-port variant (XR17V352), but
>>> there are also 4 and 8 port variants (XR17V354 and XR17V358) and the
>>> Linux driver applies this change there as well. But indeed applying it
>>> to all the future cards may not be the smartest thing to do.
>>>
>>> The Linux driver checks Exar specific register to identify the device,
>>> instead of using PCI product ID, for some reason - I guess they use the
>>> same chip in different devices?
>>> Would you like thing like that (after checking vendor id), or turn it o=
n
>>> just for this product id I have?
>>
>> Hard to tell without knowing whether the extra reg - as per the spec -
>> is connected to any of these. Is the spec you have publicly available?
>=20
> Yes, here: https://www.maxlinear.com/document/index?id=3D1585&languageid=
=3D1033&type=3DDatasheet&partnumber=3DXR17V352&filename=3DXR17V352.pdf&part=
=3DXR17V352
> (and few more links on https://www.maxlinear.com/product/interface/uarts/=
pcie-uarts/xr17v352, but mostly the above PDF)

Ah yes, thanks.

> Hmm, maybe I should add the link to the commit message?

Wouldn't hurt; question is how likely it is for the link to become stale
in the next couple of years.

>>>>> @@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns16=
550 *uart)
>>>>>      }
>>>>>  }
>>>>> =20
>>>>> +static void enable_exar_enhanced_bits(struct ns16550 *uart)
>>>>> +{
>>>>> +#ifdef NS16550_PCI
>>>>> +    if ( uart->bar &&
>>>>> +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2=
],
>>>>> +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI=
_VENDOR_ID_EXAR )
>>>>> +    {
>>>>> +        /* Exar cards ignores setting MCR[2] (hardware flow control)=
 unless
>>>>> +         * "Enhanced control bits" is enabled.
>>>>> +         */
>>>>
>>>> Style nit: /* belongs on its own line as per ./CODING_STYLE.
>>>>
>>>>> +        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);
>>>>
>>>> Wouldn't this better be a read-modify-write operation?
>>>
>>> Honestly, I'm simply mirroring Linux driver behavior here. But also,
>>> all the bits in EFR are 0 after device reset, so it should work fine.
>>
>> Firmware or a boot loader may play with hardware before Xen takes contro=
l.
>> I'm also not convinced there would have been a device reset in all cases
>> where execution may make it here. (Note in particular that the function
>> and its caller aren't __init.)
>>
>> A plain write might be okay if the spec for devices with the specific
>> device ID documented all other bits as "must be zero" ("reserved" would
>> not be sufficient imo), and if the function was invoked for only such
>> devices.
>=20
> Other bits are defined and are things IMO we want to keep disabled. See t=
op
> of the page 40 in the PDF.

To be honest, in particular for the low 4 bits I'm not sure we should
alter them if they turn out non-zero (e.g. due to firmware or boot
loader action).

Jan


