Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97033467908
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 15:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237689.412261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9AI-0000Id-2D; Fri, 03 Dec 2021 14:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237689.412261; Fri, 03 Dec 2021 14:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt9AH-0000GQ-Uq; Fri, 03 Dec 2021 14:03:53 +0000
Received: by outflank-mailman (input) for mailman id 237689;
 Fri, 03 Dec 2021 14:03:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt9AG-0000GK-Tl
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 14:03:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d802b85a-5441-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 15:03:51 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-3oWnzzAdPh-d5tvwk88P5Q-1; Fri, 03 Dec 2021 15:03:50 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 14:03:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 14:03:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 14:03:49 +0000
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
X-Inumbo-ID: d802b85a-5441-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638540231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGCsuCtzO/s2HKEU6qPlE6FbZFHB+IRDx0UauEYKxtM=;
	b=ck4FdNV8l7wfrSwxA1e4ml+dNbp7kt4JsyYlFBcnXdvCdPDiO29Gnz7pMqsd03e7cBGMhE
	PB/BQ49zfzO89CBwTyqSailAfVYGJJ+KMuda+6TkTqptH3865EsbQkwN8B1sjmU3NJjZgz
	ZnWtF6IJCk5eGkzU4z3hrDNGwC08Y2w=
X-MC-Unique: 3oWnzzAdPh-d5tvwk88P5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM92Gl/gePMR4lsUIu+U/gUzRH8F/hPk8jmMCf7GTuylDxW+Q5ceJVSydjcXPX1lVxjg9rbefQQCxqf6FG3KIEXuUjCMUmdyDVXjEI6y7a1pk095MBjWpUdiDqFbKz0Vl30357gEfUSMZwg2BI3SXiXBgm5qbSZ5GxlvxZTLO3gp8DriPx9g8Yyu3lTPvMMq0ifjjHEBOsm15ofvClATUcqI6klqfOpYLrM1jwqLz2C4ecdMLP7dtyv2vbyijD3zkf2Rr0m+x8q0KsaJUthBBiIZ4wHLmWA5csq4Gql2Rz/prOvUYgqi9niCWLvvFnLW4+ENcVpkItlVnwHwROXr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx3J8gPY/VjfIr6NrBe442u2MW4Q426sUZp1jxLwy7k=;
 b=SbJaTm6AbZLsBf7R62wAYI6oxZnAG0f6iXC62RFHpFHfr1nS8TZrTFhmDJApolEi2JpyWpUV+MmBD40dhzBrLS5wLu56vT5GI2qs6KBhFoniP1G//Pvu2h/UVeC3YUdbuUeOF8EPMxPuSsoF0DzCdgsCU+E4OWM6lvV8qW6EEVZMDnxjAwCi1HHZ/D3UdY1KTolXFrKhhPfaBgDsiM5fOchVg+1aro8BkBiX6ziri2VRroeaZPTBZz4WGwdrc7H9cm0HUu9cxL/tv9ft/sESVfSkGS5JizrOzJuZgNUHUE56nB0jesHSYN8s4+ozXjo4rjjwoWzDmx8Has//Vw76XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4922cb60-700f-c135-aefa-81c6ae55c9a2@suse.com>
Date: Fri, 3 Dec 2021 15:03:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 59/65] x86/traps: Rework write_stub_trampoline() to not
 hardcode the jmp
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-60-andrew.cooper3@citrix.com>
 <a8434878-129d-8207-09e3-4909e638a4d0@suse.com>
 <57190224-879a-8309-e1a9-534072af9aa0@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <57190224-879a-8309-e1a9-534072af9aa0@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0082.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aba30e92-8e42-412c-d3e2-08d9b665baf1
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB29582FB3DD01488B95A3B3BFB36A9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQ4PhsKt6MZzLutudyNfP6VF7ABdJkebfHEIuVrtrf5l0iSOYpyI6o01ScgfcF7eafmPGH+ma/t/GQL12hKJ0otTUUoNz8h4v6Z+nx4nZQuxjCtmwIZispEUeh9WVu24rThOY+/feEtx+4WIlOgMIoUDvlA9KN/anJkX6jI58UPEVgXUT1B7eQI7wMQmpWgMqG1Hnr7IPCY/EW9WfZxSJ0Z8Gs4cTIJAzYJu5mqQZgS+luG2YPOPWr9d6GQKBrBKDzM8sLGFdoHINyFL5daK09iWWbNfNY9KLzXDTn4MSus9pBmN2GAqfNp2TzQRWMje+xoWZEOm9owZbZw5f+5wm2joAwfCAelFu4Xv7Sh8Sugfn0kHZMDJlK+33uIpOGRS6Nm6Z1O99ves5ylaHAGO9WITFK0k97OrZp/KonOMPIwGg72bWbNbE9BO6KoliTKqteqwvRnQPMxn4kH2VUX0xKTTsNGxaaxgR3qHFBP9ejTWX1j3w/VpOOkTABBMcbcH7M9qEYDZi1uMs5wNv1QLeXBLqjfiaQJVlTGfCfJWWwtKQgFLwOlEqW+fysYb63DEB9kVaJpwyYgC4xIpoIyBIAzbMznF+UL4Fe4ixPJFddebStS9BU9t9ain6JJGzgCFUDocNrLJ9aduuFVI3aacTw5w/q26F5m8wuEnf3dUYrUB99GtJZdjd7xKDPbps2owdB3ijw/ItTWMMIEBlN55TFw9ScW6KglV1r6ObxCsWwqMqWp3aBV3oDECg4Zxg/6Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(8676002)(186003)(66556008)(956004)(36756003)(53546011)(38100700002)(26005)(16576012)(4326008)(8936002)(31696002)(316002)(508600001)(86362001)(110136005)(31686004)(5660300002)(54906003)(2906002)(6486002)(83380400001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?so7uHTQLdHCHhmaIYK+jjA/CuirrqvSfitK/76A/NiS0rK7aStwWs4n7SV7X?=
 =?us-ascii?Q?4t9xGk0ebEOTp2l9Xb15x8pkW1S2Pn6UPPymFfJp5yJKcVOKBF7Noal6Nt3M?=
 =?us-ascii?Q?V5xlCkQ+p4VIEf7tSgLPUbHaHXh14EHc2RXl6mzB9qnuBSLzyd/BBMQlHPWo?=
 =?us-ascii?Q?VL291M0HVz82j/2iOzoC9yU/u9j4L22/RFcttbExssT7oV7MWjU3phjlMbaE?=
 =?us-ascii?Q?XA3+lm7tqpO6GDgCo+ugLb8KOPnNMz3GZC62KPwWoEXKMZVYdZPA4UJDtFgH?=
 =?us-ascii?Q?7btQYlbd/NIYBoudkcQpWe+LsBZeUvd3DuUdny3eM6A+4Yx23o3cuum9llaW?=
 =?us-ascii?Q?rrSUeOVaKbZXEivF3owIlDa2sCTi+/wfcjblBO79B0+38TJbTfq9AtY4iY1E?=
 =?us-ascii?Q?3w6GRKgU4rBVN6SbxqwfKOFFidhIHEtOrOKjLzVWQdYrXQpWF5zTjZu2r5Q7?=
 =?us-ascii?Q?NW6IJUTX+Gu00B/iwolqJEroCL51yIkevG+Lkr0ooZPnC6yvQAAmNtGO3nGp?=
 =?us-ascii?Q?A+53JMoe0GwenohuwqWRtcTmeebfbnopVU4Ywi26iejjrgDCGf1A7zHTxE9q?=
 =?us-ascii?Q?aAkZc7GRpSWNrQU+v/XSKsZV0t7BL6iAm7qAuc11tlaEaUSetqvRQhgKiAgJ?=
 =?us-ascii?Q?0CanvQvhGsJ/Hd7wzb5ldDGHvrs4pN2Sdwzj4N2Kbj7EiFPPbXS6Cgpe/Jox?=
 =?us-ascii?Q?i46K6d860wd/JwPPKjR6ZFpBEz0L3yu4GgQh1pJiuE4sT3AXXvORvQLbZJFF?=
 =?us-ascii?Q?FZoEqCZKp+6vdq9ClOzGjXjTtFvkgSLDlY+4aY8tLORplIkdOsjpzSVP7Ald?=
 =?us-ascii?Q?bATVCy2bYmDYm0EewshAgsFoxUwD+qgnWiHBOAfVIV3mB6PRlo+y7pbXjgOh?=
 =?us-ascii?Q?ZQlt9Xu7z3byfchtx4uVcKjDNRkeVVl8VglYyXj/mGcCD9xmBxl2s66anaOh?=
 =?us-ascii?Q?8qUb3YO0PAAxElvQV/+Ijge35bVGFFokbBIU2OpUNGnovXAEmo3FCd8eK5q9?=
 =?us-ascii?Q?a0vjICCfCWwKU0phtrZizPh/Zl7zhGrJ8hmIapLRZC827C6zFuzvRTcixdYd?=
 =?us-ascii?Q?Z76PCyWU65nb8tX122+6zeMRfQdHrsVPKYBzaNl6w9hGAMlCM7EUKvgSLx2f?=
 =?us-ascii?Q?1LER7op6ZpxNdnAIQ3T35toe/FK1tgmvRLm3QCU73covUlrp8oUlf+XGwHEK?=
 =?us-ascii?Q?W+jrfUMHBB8cvpNvDb4otGY2/vvEUgG0SpQKp+nfYPgC8lE/EUxsNAHnXnSB?=
 =?us-ascii?Q?96qDtt6lBcYgh+xhqAuQbUFzcd1PM9k/pCFeyCk9ym89YI5thOuU23czeqim?=
 =?us-ascii?Q?1EqAcSoiLbHDd7UV5ZQawovEXxW6B1TBmIRX70YZrQ4i8Q+OTldsierog4SC?=
 =?us-ascii?Q?mRbM/Bg9VW5d2EC4OxuvniDiFBVAByXvzLVfeZ8TiFNLCqxXh2WMaHQNpdYc?=
 =?us-ascii?Q?ATYHdlqUi5iuoJJQyyBe9R3EcdVcidyE1OlirJb4gM/Gy0dvD3HI54XPGNg/?=
 =?us-ascii?Q?xS5K52xXnPfO0jPPoJKqtW2Wqt9imYodxxrshIrbBHXA4RedJnpZP46+0niT?=
 =?us-ascii?Q?Sir4uenyuWlCPzSDeg4dlnxeZ31arsnAjcSQO6mVNDYLBK8Fb217ROKgzg0f?=
 =?us-ascii?Q?9YMhe6/TPoqosn/4hxNIjNQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba30e92-8e42-412c-d3e2-08d9b665baf1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 14:03:49.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALViwcgNwgdO/Ca0MrB3yzJUBMtpZMseghgRcYovtQmDLGAHItRSgNE4ftYS7AKozC2uhxtT3Nl2zb/6PCmaPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

On 03.12.2021 14:59, Andrew Cooper wrote:
> On 03/12/2021 13:17, Jan Beulich wrote:
>> On 26.11.2021 13:34, Andrew Cooper wrote:
>>> For CET-IBT, we will need to optionally insert an endbr64 instruction a=
t the
>>> start of the stub.  Don't hardcode the jmp displacement assuming that i=
t
>>> starts at byte 24 of the stub.
>>>
>>> Also add extra comments describing what is going on.  The mix of %rax a=
nd %rsp
>>> is far from trivial to follow.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>  xen/arch/x86/x86_64/traps.c | 36 ++++++++++++++++++++++--------------
>>>  1 file changed, 22 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
>>> index d661d7ffcaaf..6f3c65bedc7a 100644
>>> --- a/xen/arch/x86/x86_64/traps.c
>>> +++ b/xen/arch/x86/x86_64/traps.c
>>> @@ -293,30 +293,38 @@ static unsigned int write_stub_trampoline(
>>>      unsigned char *stub, unsigned long stub_va,
>>>      unsigned long stack_bottom, unsigned long target_va)
>>>  {
>>> +    unsigned char *p =3D stub;
>>> +
>>> +    /* Store guest %rax into %ss slot */
>>>      /* movabsq %rax, stack_bottom - 8 */
>>> -    stub[0] =3D 0x48;
>>> -    stub[1] =3D 0xa3;
>>> -    *(uint64_t *)&stub[2] =3D stack_bottom - 8;
>>> +    *p++ =3D 0x48;
>>> +    *p++ =3D 0xa3;
>>> +    *(uint64_t *)p =3D stack_bottom - 8;
>>> +    p +=3D 8;
>>> =20
>>> +    /* Store guest %rsp in %rax */
>>>      /* movq %rsp, %rax */
>>> -    stub[10] =3D 0x48;
>>> -    stub[11] =3D 0x89;
>>> -    stub[12] =3D 0xe0;
>>> +    *p++ =3D 0x48;
>>> +    *p++ =3D 0x89;
>>> +    *p++ =3D 0xe0;
>>> =20
>>> +    /* Switch to Xen stack */
>>>      /* movabsq $stack_bottom - 8, %rsp */
>>> -    stub[13] =3D 0x48;
>>> -    stub[14] =3D 0xbc;
>>> -    *(uint64_t *)&stub[15] =3D stack_bottom - 8;
>>> +    *p++ =3D 0x48;
>>> +    *p++ =3D 0xbc;
>>> +    *(uint64_t *)p =3D stack_bottom - 8;
>>> +    p +=3D 8;
>>> =20
>>> +    /* Store guest %rsp into %rsp slot */
>>>      /* pushq %rax */
>>> -    stub[23] =3D 0x50;
>>> +    *p++ =3D 0x50;
>>> =20
>>>      /* jmp target_va */
>>> -    stub[24] =3D 0xe9;
>>> -    *(int32_t *)&stub[25] =3D target_va - (stub_va + 29);
>>> +    *p++ =3D 0xe9;
>>> +    *(int32_t *)p =3D target_va - (stub_va + (p - stub) + 4);
>>> +    p +=3D 4;
>>> =20
>>> -    /* Round up to a multiple of 16 bytes. */
>>> -    return 32;
>>> +    return p - stub;
>>>  }
>> I'm concerned of you silently discarding the aligning to 16 bytes here.
>> Imo this really needs justifying, or perhaps even delaying until a
>> later change.
>=20
> Oh.=C2=A0 That was an oversight, and I'm honestly a little impressed that=
 the
> result worked fine.
>=20
> return ROUNDUP(p - stub, 16);
>=20
> ought to do?

Yes, sure. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>  I'd like to point out though that we may not have a space
>> issue here at all, as I think we can replace one of the MOVABSQ (using
>> absolute numbers to hopefully make this easier to follow):
>>
>>     movabsq %rax, stack_bottom - 8
>>     movq %rsp, %rax
>>     movq -18(%rip), %rsp
>>     pushq %rax
>>     jmp target_va
>>
>> This totals to 26 bytes, leaving enough room for ENDBR64 without crossin=
g
>> the 32-byte boundary. But I fear you may eat me for using insn bytes as
>> data ...
>=20
> Well that's entertaining, and really quite a shame that RIP-relative
> addresses only work with 32bit displacements.
>=20
> While it is shorter, it's only 3 bytes shorter, and the stack layout is
> custom anyway so it really doesn't matter if the push lives here or not.
>=20
> Furthermore (and probably scraping the excuses barrel here), it forces a
> data side TLB and cacheline fill where we didn't have one previously.=C2=
=A0
> Modern CPUs ought to be fine here, but older ones (that don't have a
> shared L2TLB) are liable to stall.

Well, that was why I though you might eat me for the suggestion.

> Perhaps lets leave this as an emergency option, if we need to find more
> space again in the future?

Yeah - as said elsewhere, due to the v1.1-s I did look at patches in the
wrong order, and hence wasn't aware yet that you have found a different
way to squeeze in the ENDBR.

Jan


