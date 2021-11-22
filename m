Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFFE459326
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 17:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229019.396358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCH4-0002l0-7P; Mon, 22 Nov 2021 16:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229019.396358; Mon, 22 Nov 2021 16:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpCH4-0002iy-3f; Mon, 22 Nov 2021 16:34:34 +0000
Received: by outflank-mailman (input) for mailman id 229019;
 Mon, 22 Nov 2021 16:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpCH2-0002is-Sv
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 16:34:32 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11c6c982-4bb2-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 17:34:31 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-42BqV8KBNyqhSWblD6u6hQ-1; Mon, 22 Nov 2021 17:34:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 16:34:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 16:34:29 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS9PR06CA0122.eurprd06.prod.outlook.com (2603:10a6:20b:467::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Mon, 22 Nov 2021 16:34:28 +0000
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
X-Inumbo-ID: 11c6c982-4bb2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637598871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWs0GYRaolvqvKBdWk/e0JT4PrZ+xyx1Dq3BOuRvsYs=;
	b=YYqeTMREzt2bwkWtEFXOXcfI7q9D+JArS92M1IfJpACpihKgVJtzZhCwshYnjtkC/oYyLA
	f/JNQSRHzk9r2WlpFCdDb9HNqP1e9GOh2kszbQfO3IxxbWGmRgd2hu7ZYpLEE+cPGAaLHI
	1JjBYmHgypXdNd7YNEdg1nXJNiXW5tE=
X-MC-Unique: 42BqV8KBNyqhSWblD6u6hQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvON89sOBHX/IYOTW/TQ8UbMBGs5yhlcNfClTfeMMwHvtjYGRyhxqRO7injpgbWQLK9gfiUI+fNDcuWjG4ggK9pkJ6t3IxebGmAun5VM8xkTDCSp9uQ9ToEKg6ylVgUqbN9bl9y1F4oT0nkSlqZbEJD9vegIgZQv5nS8KrHfCJoTn3zc9wmzB4apLZAtQQZLJVHuy7qyMY2x3OH88XUkpgqkHBZ+zBr3WjvHkuqfCLUKRclspkYTtq4ficm2CYqHT2IxQLDUNmgTToC4Dl/K2NQWkmQY1EpdcQpxrjS6ux1ontpzT3e5GomD1o1lReRrIXpN5F8fZQ5ophHbG+i+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9LF+fweeCQ3ndoYkCSk/u/MH/+mpJvAtWmcG73EPxc=;
 b=EODYhbVwYkWMhrVUEIsDpDEmFu5UfUlQva4uq4AFHnFpI8VVUMjPe1Hc4eknK/67ppr/ZcoanjMifWD7dT+vLbVtHmIvingW8G50Jps8D3+nbxBg/8H+ZZcKnFbuuePlXSG1YT21+XlsQ+6KHCrTvASoy+HOXWY0Yf1YJcQq6KquvrvTHJsydbt+GobBbDnrjhyTzDNOr/29NeCWO8+eTHis1NyLr2UM+DloaXCTOkRQVkIr4KHx3eFSqH7Ql9Bibl2/N9DAgXpD99jefManXIpCdi3dVRTb8++xaUjfniyCLYwvNxpAr3imHyGa/dZA7Vc1siKiAanC5YDLk77EMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1baace8-4fdb-bbe6-f421-050e1400a738@suse.com>
Date: Mon, 22 Nov 2021 17:34:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 5/5] x86/traps: Clean up diagnostics
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
 <20211119182106.14868-6-andrew.cooper3@citrix.com>
 <fe2af9ad-36a7-40c9-8591-4b83831a3e87@suse.com>
 <68c0d8b1-68de-fe4e-f3be-de70117a29fa@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <68c0d8b1-68de-fe4e-f3be-de70117a29fa@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4e1d90f-b5af-43d4-5e54-08d9add5f467
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43500A102304CF70524B65C9B39F9@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nPItE4/SCV7UBSJ6xKhsVBU9dXSpvvPhwvAJSgpuqmb/HK59RhyKWUGuenmm6S8kgEMl6ZtTdbl+XkKmv8wZ0B5C1EVQ2wofBecRp5+OtOzIXdtQ922X+rimQE7Ezcr7JURNi7LXtMka2X1w2wDZLK+y32uEJuoXBvSIoSGR8jqt8tJ6DIl7Moosh64419g2bD1uVV4Wzzi9Ud9WlOPcP2sQCUpBM7ydvgMqMeL70z0/YYgE6+a2hFrL3Gmvqh9i56LTCYMa5w9MksAHklmtcZ2gUEsZ4wZC41rkva+Om2anJTmc97km7QpRIBQPIdFp33qz0BXQGpDlMJru1XcUxDInJovuDfRO2CYzLpqoZkg1VEhz2EviX8T56xmPaZd+PaQj+Z17OsOcV19NjYp4JNxQoZKlQRj66avpZXH/jw5nUEMNZ7lsFOxlyjVmP0sVZRS19EA1ivLryHSR1lHHL28uOcr1Xr+pFfC1e6BTKZZpQiJKCaOENx80WphzI1haAn2d1HLPCt/MaobO8oHWp8yhBgDgPQc4+PuzJgZjir+Sa5op6FJZ+lwr0mIr4uxzSIydIJMZHjQrLK4AG/UWF+xa5tpHGazTPnEbpMBYg055s4HL3r3ogHvtu8aiI9YwgirZehs6BZORgHgL9Mqu8ffyMmZfVBBpL4ANcVG/CiB6Aivw9YsfdiDdVkJngGejNQ5w0XKP20W1h91rZFmQ4dHyi+hALSG+yeQMN63Tqnc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(110136005)(54906003)(38100700002)(31686004)(4326008)(8676002)(316002)(6486002)(36756003)(2616005)(83380400001)(508600001)(186003)(31696002)(53546011)(66476007)(66556008)(2906002)(8936002)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9sP1inebEMF6pEqqCDCQd0VIc0erbvpp0+7jbQe8LftqFTwdOou+xP9eyf2X?=
 =?us-ascii?Q?rQMvl5x386XdvXw/WHN/4xyZT9x1XhMLf47huCB/c4SWgC1s1eoQiWIG8soX?=
 =?us-ascii?Q?XfMdU5EqrQoNqOGqtZdeJ42cuODK6NvByfKUr98p0ldGJSqM/MkTW5ZEa0MB?=
 =?us-ascii?Q?D9fFi2+kJHiet58Jw1EEx3PCmoM/3VeGjrt542U62q0sIESBDA0hATHydJOd?=
 =?us-ascii?Q?5UPpSHvlNVDM9oYOSK1+UiiHQJEZOWG5HSbaqcfiDWLDqBVY/nN/vEG87viP?=
 =?us-ascii?Q?nNNdHLlvqoU5hfeAThfmqYoAOw8brYKZCU1WTWbYHMkme0UvHIfMdSWez8Ab?=
 =?us-ascii?Q?+rsAxtoWNe4fTgBTY6ih8SuQayvBBV60+O6U2aWNsEpejZnQmHOUo6XaB/KI?=
 =?us-ascii?Q?uw/c9AiQ+XzViH7zgI8JwpLA+zB/qz73j83vFgSKz4sxcL8nE07a7hD7lDuS?=
 =?us-ascii?Q?hrBqSvNHwYJ91VVeRUE4Rvbm7Im6Hcs5hGywQ4CN80bjI6eEmrwNUS4xVP6b?=
 =?us-ascii?Q?1PqRvKxzN071TmPQ94SOe7NBBxOh5kD4nO84zLTmIqrSLJTlpcLpI3KymnHj?=
 =?us-ascii?Q?ODCv3T5QjG2OB2/qNX7qHZdl8Qfxalga1Pph/XMo220UULDsgK/A4E3E+QID?=
 =?us-ascii?Q?2bIqP1/ziiJ1DcTZJ0FrEaJObhM8C++oLM6hwC3EpXIsP47bOivnMJs/xWnD?=
 =?us-ascii?Q?li+rq1u0F4/7w7/o/u1yzpJCIazvEUVKGvzDConOupLqo2uAqZvQzjNuYc8M?=
 =?us-ascii?Q?y70S5RgoQxVGNb0aj28AVmBMlF3+VSxXSvX0WRT4HuNuj2d4tuM10fcpqmKN?=
 =?us-ascii?Q?l3MkShAVCKMqiR9Jb3OAfbAiLcRR32ZbSN+sloHThcs5btspXcBoGesxhYHd?=
 =?us-ascii?Q?f4sJ5IowHoAcGzbBWZypftX0kdtGcJkHl42q2Su8Jw8WY/ySEx+nT8yRzIKt?=
 =?us-ascii?Q?TPn015kwslcqfO7Rv54/iYtirmcwh4zsrEZe2u4W/0Wn6wqXkd7+N2FwkA17?=
 =?us-ascii?Q?qrDzQJ8MBNoyRPE/8V1WOq0toe6MCZuHMPiGZL3yjBiGoTce3KNrmYNKFjit?=
 =?us-ascii?Q?1aOv6zoTCKcixd48RDPvBLV/LVssh75g1hAgrTm3FBN6jHkZwaKBWTH34kV9?=
 =?us-ascii?Q?dwDIW1gXcymy9ZXxd/TJyP/1Bgnt9i0P79Vs+qcu7ncafUmUtc2gAb6K9LmM?=
 =?us-ascii?Q?TdPRUkbJ+4iyN8xpyJkcpP/VuaCLAtqOT9eJb8l1+modkTnvjzAZJqW3zIG3?=
 =?us-ascii?Q?Awsxolfby9H1rS5lmzdGP2AFTSrmGGbIQ7hpEIglbiM+iJ5aVPZaurFWnlwS?=
 =?us-ascii?Q?P1pP0QxZ80shAb4/Xu3NZ5fxIotkn0mky7d+ZKK2eS1PIWtHcD37iNoLmRDW?=
 =?us-ascii?Q?Ba7OS4oAqXPktxPnAW+CekFOqFhqEVIgCaEdG6aFeF1t8JhsJ8R87HJ45RaZ?=
 =?us-ascii?Q?5eScECNjlESXo1tyW555Aj83O+g3GZ5Q5NvKxK60vvabLqllEHi1aQPuLp1x?=
 =?us-ascii?Q?R53XjQzIvM7SdPB7K4grHyJJNohU3rhEzBhxTHKCzlo5KargNSMxkG1gbz6I?=
 =?us-ascii?Q?HacKd7RGXQmImhJuOX7dgov++n9GRvuXuANK6+1de24haubEQWlreGgcQe9y?=
 =?us-ascii?Q?2w2Jdb0UqCJ46Oe2nEAr8jZkmcOMUK0h98M/U6QOGs95KcYXcycGGk9PmstG?=
 =?us-ascii?Q?QI0g8gi8l2bw7NStUEZ53xMRBpw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e1d90f-b5af-43d4-5e54-08d9add5f467
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 16:34:29.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0W3UG+ScNsOjLoS/Vk5N7BGCujFSpuYEJ/kDj++e3QpHD6uIFDwjIQyTvYDoiViBIvoUZCSBB4KJsiunrJ+WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

On 22.11.2021 17:26, Andrew Cooper wrote:
> On 22/11/2021 09:08, Jan Beulich wrote:
>> On 19.11.2021 19:21, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/traps.c
>>> +++ b/xen/arch/x86/traps.c
>>> @@ -759,21 +759,7 @@ static int nmi_show_execution_state(const struct c=
pu_user_regs *regs, int cpu)
>>>      return 1;
>>>  }
>>> =20
>>> -const char *trapstr(unsigned int trapnr)
>>> -{
>>> -    static const char * const strings[] =3D {
>>> -        "divide error", "debug", "nmi", "bkpt", "overflow", "bounds",
>>> -        "invalid opcode", "device not available", "double fault",
>>> -        "coprocessor segment", "invalid tss", "segment not found",
>>> -        "stack error", "general protection fault", "page fault",
>>> -        "spurious interrupt", "coprocessor error", "alignment check",
>>> -        "machine check", "simd error", "virtualisation exception"
>>> -    };
>>> -
>>> -    return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
>>> -}
>>> -
>>> -static const char *vec_name(unsigned int vec)
>>> +const char *vec_name(unsigned int vec)
>> Is this perhaps too ambiguous a name for a non-static function? exn_vec_=
name()
>> at least, maybe?
>=20
> "exception" has the same problem that "trap" has.=C2=A0 It's actively
> incorrect naming.

Well, yes, "exception_or_interrupt_name" would be more correct but quite
a bit too long for my taste. In an earlier project I did work on we
used "interruption" to cover everything (including hardware interrupts),
but the abbreviation thereof wouldn't be distinguishable from
"interrupt"'s.

Bottom line - you have my R-b, and the name change was just an extra
consideration.

Jan


