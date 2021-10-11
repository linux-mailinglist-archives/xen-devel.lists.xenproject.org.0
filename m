Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5F4286C3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 08:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205391.360679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZohc-0005Bu-0J; Mon, 11 Oct 2021 06:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205391.360679; Mon, 11 Oct 2021 06:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZohb-00059n-TE; Mon, 11 Oct 2021 06:22:23 +0000
Received: by outflank-mailman (input) for mailman id 205391;
 Mon, 11 Oct 2021 06:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZohb-00059h-2a
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 06:22:23 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3227b8c8-2173-44f6-b802-f1ca7d9e0e0b;
 Mon, 11 Oct 2021 06:22:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-IOp8gOFuOWGx5ACyO_erHg-1; Mon, 11 Oct 2021 08:22:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 06:22:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 06:22:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0041.eurprd06.prod.outlook.com (2603:10a6:20b:463::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 06:22:16 +0000
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
X-Inumbo-ID: 3227b8c8-2173-44f6-b802-f1ca7d9e0e0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633933340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HCAH6vjRwTJkukXYXXbe5vn/S9xW0yV0Esn+bHehBQ4=;
	b=fZSnQcZMQAJ5SKsMvjxXRwTckxQkcoemY9q6BHBTp3WYGokLOqiZ75NmO8o5Ynzbs08pJA
	r0I3plJ17TwtYfrmBLGvI6o3kXDb9FR4KehYH4xXfRtzP5uJBf8ncK9Nhf2OUbGSflB6W6
	CEC2fqzqNUyE9+AeIwAT1V30+ZegkCg=
X-MC-Unique: IOp8gOFuOWGx5ACyO_erHg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evgmQLC37Uo8GefsZn/HC0EDj4kiWJyACd9Kts0etg0+VSDKjFKGIawVOOi9O/Gks4HnJIV0JUHp5QHayiMkmILajbP1lOlOlxBpqN+DJkztL5Eo8UHSoUMWAqi1jHKABpSNwubC4Jh7NUYSUzOKRn+tqUhrpS9sSCbbdVhFaHlbRI6EprSYWyQDkTwRh10yGUHv/Bk+M8jHXjf8YDgKu+rs6c6u4jMbEk0b9DnLc9gx/S5GeI1HeSlOgCpC3n9xxDVitqd9W89Qy8FIkILEoErVExJ9dIxvZrZc/sqylbSD2a1patobxuGloUAPasp09OlSt4quBxA/ofp7XH5tmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cfSuhUjCR2LRhze5ASoTxf+xtQqvwf8VHRb+u3awzE=;
 b=Zhzr3kP3JJ0jdk4QDEYvaVzDujS03HBLiywOQYbOFWD4Nvt9OuyH9AdQG3869Um4Kh4JujCoWWRFyR59RYHuWI7WJqThGEG5i8CeL55OVxcg3PB71RQ1SR5tU1barcg56RNs18aj+iKrcryHDq+QWEUlFTEUx/uBxqvO/6IwQsfvMMcVOaNKLb/ww4c9IH5m/63oDZy11sfrOp6Mr4FlZ2TTAD0KGWSbNrEc7dnER382tbFvNuvmADDnN1HHVnj8ZWFZdIatHAEnbdUh3JWgG+kB+f+3m9sFBBW4UnfcHEpqMk11NfvFXkaMCUM8v9/h5ERqF9evOnqOaQ3JtVJ94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/PV32: fix physdev_op_compat handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e8d21433-2f4f-f662-dd45-1543da8f4caf@suse.com>
 <24595827-df68-816b-9356-935c3fb80746@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ca849b62-042e-0e8e-c895-5d8a26241c92@suse.com>
Date: Mon, 11 Oct 2021 08:22:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24595827-df68-816b-9356-935c3fb80746@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0041.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0645383-553f-4b38-079c-08d98c7f7912
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33926EAD1BA467CC0A1A4016B3B59@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ai7uAEY9wE3g6bUVG5QkXNkGy3YfXZD8zXz3sDMzP+a78y3CklgL4GqVJY1ae+gxEpWq3FvKlgW/Cu2rgbr9lh7CMxIK7obe/Xm8E6dN8/YSPcnu5YYARhtpOSGz+/DJJghtXKHLuy/ExaJKndM5Ozord2FGKLZ8LtoEGJCWlRe5Qmnj6yNVMXJ0h722FuvTynEfkHkVMt2tfhrrA11CnHWbwLCrCrXmZ7oAU1BqK33IrKvJD5ISuocoS9DGuFoL5rWQYFBKbcq85xOtrUcrMo8E9iMtRAdV9AjDVpaVxhv98kWSNbRZseAUXO6n5kZ+xDOBfxZz7SGTjUNfoT3/ESTrqhhANXtV3pY9QgqQuFfrWM0CiXxHjYpCDMWThjqUfhvy4tKHuFoa0oo34WIqhvNSwagORXr70PsEus71zF0JzSilYCeNMRlqhhSkb0snadKKMwx2cvy7/HqzPTqs+8JKsy5p8KSk156/7F0NspHNJb0ETQ1accBDl6IroIR5cntBLFulu4skeWVZmXMoBAmDVYA6a8U839l8AHBaX0xaVBcyoLUcsEwmsMFIE13GGhWwjujRJwVtGbksk2tjZGB/Ejm4HwlbOJP3H8nEHjuSQelalZKCGNk2gK9WD2oa1qMdSg6UDDGIrrnS3po2kj8UzGBAK9rdta7rBUvh1n5f2CxSHW2kq1M2O68SH0onYVIn4P0HRJCvDwQDw1hkMTimoAb1DV+PYuzEBWzfm9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(38100700002)(66946007)(53546011)(8936002)(186003)(508600001)(31696002)(16576012)(66476007)(86362001)(66556008)(316002)(2906002)(4326008)(6916009)(956004)(36756003)(6486002)(26005)(8676002)(83380400001)(5660300002)(2616005)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gtWL1Qw0hKJXUd47MitguJtdtPSSMbMdYmaMPFuweXL0/xoO6oMe8hOzNpjl?=
 =?us-ascii?Q?iyZcjBtXWqYARX5FieZgwKBZ7BUmIOb7xroLfk9rscN0uD1Y8+wSG9kZbRxB?=
 =?us-ascii?Q?grCrn/MgHe/chk5tOZAwzLyItOAaVpqMZ0WO29MC1QdMhWFBUspcufVLGczE?=
 =?us-ascii?Q?wGMqX5e3LRSJrHFWm+LJ37gAKUFNwaJhd5r7nZGuYoInSbSL+rAP9dbkT5hh?=
 =?us-ascii?Q?esZ0xf6cgDaB0/mjPkjxkAVZ9HmXSoXLWLjfU+TXSbbt1UKvd9IR4QZBBRXe?=
 =?us-ascii?Q?fRbdIe4ao4TdRlxi8105H82OEmtcgj0/voP4wgi+xXSToRMKCVC3rALgN84C?=
 =?us-ascii?Q?ENAu5PRO59UXnZaUZ0Ip62k8hE7EnaUHpaAv4uVItjioCrHR6i+l/VSRDJV0?=
 =?us-ascii?Q?qLIULZzmIdb95bs3OsQOKAyNkrXeIFvUwmLS8Q9e61Th69KiQfiqq+xekPH8?=
 =?us-ascii?Q?00MtgyALW1YWwTVnauUr52reQkxgp/EGN1ACPeucYfacL9BPqSdfXBgoLZNc?=
 =?us-ascii?Q?2DyFQqeoq5MGgtU5ecOWTX6NU+NKHQE12GFubXeXH551wNQiTXTznx9wxrMJ?=
 =?us-ascii?Q?J7tK4hs4ZQTHyAjCYgPaFCv0KJbgkjL+mHsIU9tKF1SwcUO4kD8aw9D4r0Jx?=
 =?us-ascii?Q?Q40p5t7kQn51ZoAqzh42DFQXapHso9DOhoET1XnZ8H6C6ehXt1K7jM7XKN7x?=
 =?us-ascii?Q?R5hGqE4bPuMkXcu8DsCo6kcvpoxitLN8Py9khb17sUAzFUZ2hQWs1gsrdrhr?=
 =?us-ascii?Q?g474pWsT3k5OsVJbGgpi5NK3/N2W7oVS71Uas3YcmcA7i08mZAR94eaTfNRI?=
 =?us-ascii?Q?3cNGh4LBsUTStbJjA6pjOZZft3R0GFKjE5iCxWxVuufnTlNAm7BCec/6BdpE?=
 =?us-ascii?Q?TsLRizhupZgws5qG5HdLOqSJN6hlNrjD7ViUGmrfGg5pI1v6Rbquz4aU9ttH?=
 =?us-ascii?Q?dt6Q6CSGwvzMPuzDfRtu0ho9yZNoPPdgXV0OZAIJtxxhuMhjHiw/wS3rpbb8?=
 =?us-ascii?Q?iyzBt/dOB5IrpprA+L2SCLNZe1FZIrJxlr2EBV/8mcl2ZvD5+vl7pR3cnpZf?=
 =?us-ascii?Q?EuhbMxptqBGO/gm4q2DIZqumn/XFaLHiFpENBeXUZK57vXZogp/i+WE2VtBt?=
 =?us-ascii?Q?jfxSomcHkXH7UebfM7bO6igs1IrVH0M06ElZQTh1eEMXmxoy0Xn9diHayjWy?=
 =?us-ascii?Q?HpJrppCC7a48mdEFAIacytbioXdHDfkO7n4Vb6xtiG17dO8sid1e0GXf3+dw?=
 =?us-ascii?Q?e4+cpDoSESBPhKHize+iM5Sbo+V/YNNimWjZ2deKBaz5lOC6wefeNfKqazSR?=
 =?us-ascii?Q?nX1A4Ebf6s1wxsEZxDT1qGwN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0645383-553f-4b38-079c-08d98c7f7912
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 06:22:17.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gBb2YqQqqpIsd2RnKP2GR9Y5wMLAVghQQW4qkwxQiQK3BU2BVqtXJiw9n3c0baKR/g1tMzjuDPKootTV9so/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

On 08.10.2021 19:47, Andrew Cooper wrote:
> On 08/10/2021 11:47, Jan Beulich wrote:
>> The conversion of the original code failed to recognize that the 32-bit
>> compat variant of this (sorry, two different meanings of "compat" here)
>> needs to continue to invoke the compat handler, not the native one.
>> Arrange for this and also remove the one #define that hasn't been
>> necessary anymore as of that change.
>>
>> Affected functions (having existed prior to the introduction of the new
>> hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
>> For all others the operand struct layout doesn't differ.
>=20
> :-/
>=20
> Neither of those ABI breakages would be subtle.=C2=A0 But why didn't XTF
> notice?=C2=A0 Edit: It appears as if my PHYSDEVOP_set_iobitmap tests neve=
r
> got completed.

But the XTF would have used the modern hypercall, wouldn't it? At
least the pv-iopl test does.

>> Additionally the XSA-344 fix causes guest register corruption afaict,
>> when EVTCHNOP_reset gets called through the compat function and needs a
>> continuation. While guests shouldn't invoke that function this way, I
>> think we would better have forced all pre-3.2-unavailable functions into
>> an error path, rather than forwarding them to the actual handler. I'm
>> not sure though how relevant we consider it to fix this (one way or
>> another).
>=20
> EVTCHNOP_reset{,_cont} are -ENOSYS'd in do_event_channel_op_compat()
> without being forwarded.=C2=A0 I can't see a problem.

You're right - I think I did look at do_physdev_op_compat() deriving
evtchn-compat behavior from there as well.

>> --- a/xen/arch/x86/x86_64/compat.c
>> +++ b/xen/arch/x86/x86_64/compat.c
>> @@ -10,8 +10,8 @@ EMIT_FILE;
>> =20
>>  #define physdev_op                    compat_physdev_op
>>  #define physdev_op_t                  physdev_op_compat_t
>> -#define do_physdev_op                 compat_physdev_op
>=20
> This is still needed, technically.=C2=A0 It impacts the typeof() expressi=
on:
>=20
> typeof(do_physdev_op) *fn =3D
> =C2=A0=C2=A0=C2=A0 (void *)pv_hypercall_table[__HYPERVISOR_physdev_op].na=
tive;
>=20
> and the reason why everything compiles is because
> {do,compat}_physdev_op() have identical types.

Oh, indeed - thanks for pointing out.

Jan


