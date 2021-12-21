Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51B47BE24
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 11:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250285.431107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzcNL-0000ED-DY; Tue, 21 Dec 2021 10:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250285.431107; Tue, 21 Dec 2021 10:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzcNL-0000BW-AI; Tue, 21 Dec 2021 10:28:07 +0000
Received: by outflank-mailman (input) for mailman id 250285;
 Tue, 21 Dec 2021 10:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzcNJ-0000BQ-SR
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 10:28:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc06afb-6248-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 11:28:03 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-adcV3999PuiK-YxZMV7DKg-1; Tue, 21 Dec 2021 11:28:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 10:27:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 10:27:59 +0000
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
X-Inumbo-ID: adc06afb-6248-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640082483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TeorPbmK4xA/qK6GK0zZUlvYr4koE5RgSO8GtZKqbbo=;
	b=Yp2a3GRZOKqpqnSVYLfFWr/cOpBgYCJJ/BXhHFqvaJYcThAb+QXhPV6o4tyUrCUxQXvPR7
	7RGwUvAkYCfhao/2YX+blm6+qYu3sbYoH0sHMWwpbqstU+FERcDGB1pyCjLPB08pOoGoU1
	YYOm1eALklpmq4fxNWmdjFwyktaDYBI=
X-MC-Unique: adcV3999PuiK-YxZMV7DKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCiATofkT6uv0Z5Y/NtbYnUHjAofM9HTKvtlyksih7YrdqxcNwgmdz0s0CPaf22+PvK4w5/5/aHjsGHcbBpc/YbRP+MvdqkiKRBaj7+Xt7lLCDUgo4eMWDwTC2IhZIryghlXFkVDcrhuUvUYiLYhHmXu3MxWYo2rsKZ/0KKnzCaI+KhsKmKsXsNpPvEPW3u87QRknQ2W69qWHFAwHRQ8zx99uDWfcrnNwHk5U1m5W9C6MqMbuZTl0xwYKTwN4UOr9LuhLIJqwv0h2WbnieRAHQD42wzLRFPbzfhj9u02B6QJBIS1OuatnXWMSMqsFKcUdeBPswSMNuqA57SMzgPTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MgJQtXGk+8EPq85VhQcNTrmoGDyXH9sJ7Zoej/YbPI=;
 b=AsknbHHVKXhBN1SHiio9gmo9hz9gi3EbLQDDirtRnpab1yuUnI4u0p/lKJHBl4HM9qE0uo7SVPfpKve49PcJ5sW+W4yAx32O+SajZVBuVtRg9XhOjHvJjrbNH8KVxzLXKLYUfI7qnRYezvWEqhLA5/rTQW7ZCCXpyy3a51HTwBi0JKUuw6TwTsN9c8WUgRBkV887qGAjqvhqO8NrTSyN1yQnNE77NzIRt76y+TM2LSe7rgAVrKAKwflgd+DenNj3brO3KnzkcpizM0fyZIB8UUwtKWXsuzOyiYwd7XEtwM9vNcULOFvK3F91CSQ15Ajp8a2eTEnDOgQ7byigxoDLTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2784dbb8-9237-0847-2be6-ff8a216a29d9@suse.com>
Date: Tue, 21 Dec 2021 11:27:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/5] VMX: sync VM-exit perf counters with known VM-exit
 reasons
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
 <efb282e9-4ddd-22d1-a2e4-36a4d0964ada@suse.com>
 <b083029a-6669-d03c-4b8c-c3b1ed28143c@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b083029a-6669-d03c-4b8c-c3b1ed28143c@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0014.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5f1db0-dfbf-4a90-f869-08d9c46c8f39
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5598B79519DB125BF1A430DFB37C9@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5O3LeDMLwm+PKIrk7MdkSSJE9v4Z1cgQX7SQj8aCXfINvxMlJiat++g4M2G/jGNNdoyObp3oBQeG9rA0dK99b2KHHuZPaKreFeMbrjsS2olVBIMX+c6ByZkGWP41QPPVWlq4eNWB3kn8L0RfV9OEzYqdo1LnN7scspqx+hIiOXSyqgkE3tZxwYvoZ7snu9uwqXZ+W534QRzFRyi7hEDBHWrH7W2QYzD/7KgncLE4GRtd0syETY2V+mivUQRSE4R5XbGc3CZ+uQnkGpHhX37Quo1fqnEBiMb6PyJpwR7QsQpTTpcRl3Qpa5trS5sAy47HjvM65H+wuSxtGi/mN8OPaHd8cXkWpQzDuS9/x5nO0Jqz5bv8ci1LdkSwSJpGaumNjPcni1i4l7US0/+ppzt3R2Z2UsFigrsfy0HAepADYbHfca/G3uFUaBJnFhESYFisFrxfPoiZpRk91c1k4RmAiU+Oa3Bwy48dRyakl76uSAtEKicMCZZSbKhPxjoFPWMUsNjRzuxmYN7nm/E+qYIoEBPsGFLvOSfdhVr1vRGhDFWw/XEOEGAgql/8953PGx5IlfL7KT5O4zsM8oXkB2IQLjRk7N8bQMnkK4RYVQezohIFV193nazTW6i2A1WJNdz4QUz5qTcsH6gmgphCzwEvvjLHJwHLQ81sPyjZWNCW5UIyGYGBzbIG8bkduhNyCDLYZGuh0J4nVF4KVDCjcdzvwE40C18Hb8P78+mmx5ONly0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(31686004)(8676002)(8936002)(66946007)(26005)(38100700002)(6512007)(5660300002)(66476007)(36756003)(66556008)(508600001)(6486002)(316002)(53546011)(86362001)(6506007)(31696002)(6666004)(2616005)(83380400001)(2906002)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ialUqEkJuYAu3GPluYrvkFJGlmZOG+u2khDVcRPSh8REpnPupQcBRT5//H2N?=
 =?us-ascii?Q?rguQ3Dj9cG5Vdw49tWub5t0dQswCu5yAJwoaHTG3gtlX1rJxdy7rVvvjd3Od?=
 =?us-ascii?Q?i6IHGtO2YOLTN9YDri/5vBFUlaafoM1OlWLiAE2WLgNUdut8PvM2eVr748cx?=
 =?us-ascii?Q?Ud2whOKSM0bC7lAeT20JkiJ7BbJR4U+5GxzuYtKElrz6pglsJt+n7FDv57aG?=
 =?us-ascii?Q?2GyekXminvITGUy43GVdFHhkxOp1EfSOs1wv7ke9b8ZxpMJMgMJRGhAiLBDy?=
 =?us-ascii?Q?rZAy3Rc0py+a/Jhgnz3zBDsGi9WuNZt+gQZYSV4asv04LEwvnK9LB9AxDI5I?=
 =?us-ascii?Q?D929SRxm6CXG/nPOp1LqwT3YP9PMA0okj72upzQvaRzGvCplx+GbBDLE/QjS?=
 =?us-ascii?Q?+K0gk+TWiJBWPBjPMBx4TDdwr2vmzafkR6+nuLzpXpGUCdu/DDjkbCnsEoPT?=
 =?us-ascii?Q?lxrRIkAg0Ov34BIg+28bVzNmd3L00pLXrx/B8j5MsMuIl2mhmRGCFACTSuWq?=
 =?us-ascii?Q?SRsg6nzgEC/pJVmvUS+8nprp5XE819Jq3XxzLoe4FzMkfvspnhVgei48XKrI?=
 =?us-ascii?Q?naOPyjAGvm71OUU79rIRSWljTfC6eTofVixakNqvGxdxKGVcd/N3ELrecOMu?=
 =?us-ascii?Q?ERZoOSMfNH5BewJQCSmHf06AfloDV7X2LovvhM3bH8EjV5Kh9pN8WQvNxVLw?=
 =?us-ascii?Q?7V6O2w9O8BFfXxx41fUUItFl6/nA32Hjy5ueh7EGdULuasbbSaZIi1HqH4Pz?=
 =?us-ascii?Q?VmcF3MYdLWG5j1Ar3kMKLuMJY9UjhhFzTHL4GLSZPrS5EgIDc/siKnpXTCBy?=
 =?us-ascii?Q?d+M32CQAaJXIgm+B/EiM/OXCOZGoL238T8aN/hagZMgynhn7UThiw0p0Tp8R?=
 =?us-ascii?Q?5E8Q6IKZoYjG/BFnRFJsfF7vNaymRzzVz8QI1dLSnrZYZ78zoQkHqdxuglWf?=
 =?us-ascii?Q?1hj949FKNNkOLJ9MWFKrHTPS83z5h+ZdKcXq8kmtvmkYdAyjdXeuV6Q4z/4N?=
 =?us-ascii?Q?I284WxfP2eMXnL6tjjoEB2S0TdRvhiQGwTyBQz4er6YpQlo1ZHFTjHH9QD0x?=
 =?us-ascii?Q?9z8ZJ08yiaU603mEHAu793ZnGwSnTEJTcIhe6odNf4AkZoGpt7k2pt9TuPB6?=
 =?us-ascii?Q?hWStZqD3zd1Yx5CBr0B+EedtPhN0e2b9eU0pnexWoExfygvTkMjIt0RI3M+Q?=
 =?us-ascii?Q?aEx8Ux21tiZpXUuA6sAEf42N1ZMu9CQZpWK9pqc62R98zSCR9QM6yoo4kBww?=
 =?us-ascii?Q?jzZWPu/xNtsn4Cq8fdjZ9sgAhwmMqF3uwFQrMQWn2zP6Yq2wjM78sXHkdPsO?=
 =?us-ascii?Q?LszM3XFSiSECv9HCTqsHwubwa0p/zbuMpHbVZmhY8uFqwW5jKUqI1g6OXeAM?=
 =?us-ascii?Q?1ADPLKtG0xeIW9m7gjvGt5eQaIeEg7k0+yst7evxeWxxFESPQlvHzSx0z3C1?=
 =?us-ascii?Q?D6mbUU1kank6S5bodf3HbnjZh9ipBeuTEH14IZcYBdiH8b8WnZka+ndyYRNq?=
 =?us-ascii?Q?CnoEpUM43jNqRuoBu+nYLGhZQtfzy5ST774Otklkls4W9e/lQK1Dr553Uejz?=
 =?us-ascii?Q?x3wKqe224D+ixSBffLoDj3gy5gi9X5S8/QuEgTkVYBgCK8h8vxQh7FWUoR8i?=
 =?us-ascii?Q?IrLR/ih8AJ9Hhs9rn3AmU+I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5f1db0-dfbf-4a90-f869-08d9c46c8f39
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 10:27:58.9608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl3jsTezNIorW3EaoQ6QXECHpbr5IsLMEP7deto1EXSMtrIDEQ+w3lhUkqfk8tJUr20ZV4ADcME0X046hHZI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 17.12.2021 16:00, Andrew Cooper wrote:
> On 03/12/2021 12:05, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/hvm/vmx/vmx.h
>> +++ b/xen/include/asm-x86/hvm/vmx/vmx.h
>> @@ -220,6 +220,8 @@ static inline void pi_clear_sn(struct pi
>>  #define EXIT_REASON_XSAVES              63
>>  #define EXIT_REASON_XRSTORS             64
>> =20
>> +#define EXIT_REASON_LAST                EXIT_REASON_XRSTORS
>> +
>=20
> Given the problems with sentinals like this in the domctl/sysctl
> headers, I think this scheme would be less fragile if EXIT_REASON was an
> enum.

Enums have some "downsides", so I'm not sure I'd want to go that route,
at least not right here.

>=C2=A0 (Also, we seriously need to reduce the scope of these headers.=C2=
=A0
> It's only just dawned on me why Intel uses EXIT_* and AMD uses VMEXIT_*)

Funny, isn't it? Otoh the PM specifically uses VMEXIT_*, while the SDM
specifically talks about "exit reason" everywhere. So there may be more
to this than just the need to avoid name space collisions.

And yes, I fully agree with the need of scope reduction. These
definitions living in a private header in xen/arch/x86/hvm/vmx/ should
be completely sufficient for the build to continue to work. Question
is if, while doing so, we wouldn't want to alter the name prefixes (but
see above).

> Alternatively, what about simply this:
>=20
> =C2=A0#define EXIT_REASON_XSAVES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 63
> =C2=A0#define EXIT_REASON_XRSTORS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64
> +/* Remember to update VMX_PERF_EXIT_REASON_SIZE too. */
>=20
> ?
>=20
> This avoids having yet another sentinel in the mix, and will be visible
> in *every* patch review.=C2=A0 It also gets rid of the ifdefary in the vm=
exit
> handler.

I can do it that way, sure, but then there'll again be no build time
check. As long as exit reasons all get added sequentially here, the
comment in context should raise enough attention, but what if Intel
start a second range like AMD did with NPF?

Jan


