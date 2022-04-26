Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C1550F227
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 09:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313486.531034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFV8-0006QD-Fv; Tue, 26 Apr 2022 07:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313486.531034; Tue, 26 Apr 2022 07:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFV8-0006Ne-Ct; Tue, 26 Apr 2022 07:20:46 +0000
Received: by outflank-mailman (input) for mailman id 313486;
 Tue, 26 Apr 2022 07:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njFV6-0006NW-Jb
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 07:20:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61f85ff9-c531-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 09:20:43 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-SqvMo6YqPSGI-k4OX7jqcg-1; Tue, 26 Apr 2022 09:20:40 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB6035.eurprd04.prod.outlook.com (2603:10a6:208:138::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 07:20:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:20:36 +0000
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
X-Inumbo-ID: 61f85ff9-c531-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650957642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hu3XjBfndRFS7kaQGKdcObWEE04oHKkTNxI49/Uo9Gg=;
	b=azpNmtJxW//dQypX+/X/6m/U0WNAyU6Z3mSrQRwotCWxVlZeA5Aa4cAAGi6TDAjgkrkdX8
	Um12RYxxfSfhJlWILSgQv5/OEbFpbfL7c3vCr9IO05yt9oaf+YuZddsX4JhtX6Qlvoe5pH
	pz8rP6lY6nTwZ+wCkEvRF67WaItcqYk=
X-MC-Unique: SqvMo6YqPSGI-k4OX7jqcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7JL5PFtHyngTFD1dF1zSHA/TqyAvKgIwg9NLZEoFyWB576Ns5zzUtTnyft+MvJzTX9nYSk9bVhibd8toPtQNRcuwdlTBPFzPHw9byavSaUqY9UOx09KevKHn38N2VJH+oZGKaLLT/f3RSFMjyPQxhqd0mzodS4bbsMeKZA+IEu8UhYiNMx3SprQqhSX8qWjiJV//rTmGEG9gluwUJV+EHZU3hYPcr4zOBG1d1RJRhPUu8YYjcOPTv1Api71IWkZkq1tFuQH5fbn+RM5Itj6VDgGJ2RlwNAtrOzR2a/q/x6Dtfqj3kHEENrrhDwWqJ2e9CUdLjhORqIg+uVmaRcHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfWdct7/ks7y+3bhXjDQexMqtYWIYdzZ67UZ2gVJpfw=;
 b=WLWNIWNc2pomhcATlniS4L/Bnhd81CFY8b6BUEk1PAac+8xZfkRTjsgR1D5xBluNuv9epd7H8OUhEJPIdq33qt0ZYTtoABPZ1z0TsPeW53+wx0ddhcF+xJCGIWOEiUPckLNrfNqBTLl2cI2I8kWiJk6pJuAUSPYkXZoxU5II43Yx0sLOhRO+G/7X2+UsVPZbtEPsS9wPMfH5chT9CsgOLMCQ6RTI3bexMJtg6DRoDiKxUF1bAhV6Mo30gfmo/WrHchqgW7dHNE8DPSG0yFow8VKnpfZ1u0hqftId3WaQQ1VklHdE+nRy0D4q8A0+GWaMSU1D/FO/IbfBlzho33Bjlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d76db1d0-6026-b043-44cf-dc36fed04864@suse.com>
Date: Tue, 26 Apr 2022 09:20:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] xsm/flask: Fix build with Clang 13
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220425180756.29738-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220425180756.29738-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab92ff82-1049-4c98-96f1-08da2755427b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6035:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB603579DD3F1E56AD0EB79071B3FB9@AM0PR04MB6035.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nkbSD9VwhJJdumI7u+LXf0DycO06s3ngtqYiR2oRlWFKUf8RgaSwCRmBhYrQpdb2W4zeGRbHMJ5cS+t1T+5A0fuCdxVwFJiZxORsqoJApiigTcUrzu7nym3CKCIJ4YykEssdFWSVijq9GONHxf2kuSorCvHMc0BiKgyHrFUFWZISs+7dTjNnH+/M8DK9w6Nvnm/zAAnylzE5rar1CR5MoiKYTXJmbkkhUnzaD12Sa7BMtXyIIW5rmuc9KxPwO9JZzal5l8Lb5nGw136yJX+1EQVsBZmfl5H3xGO4LBNZ6LccxPOG3ShEecKaOJJKLnotSpYrtljgakrN5Z/xkJ4tQk3KDrbTO2G+uE2LcRY0N371PU2giRjkzdQ+3KzOwYZp/NbRy4xYNYMvk8z3IC+GbAUzS0Wv7YE1WRDodh+j42JthciaAuC2k84Obb6COeGktb2SGzGKq1IE3nGWBCjZplqk24wEjrc4xxzvdf6pDSTsOe/2QFAkB85tuJtPbdbMR0A9f0FN2FYtn+8SYcY8bZOzEbegqzcT5Sblm8DKNTT4WJ83tLfS0kGCnkVI9yrMr6cnoJgYAERFUf3YNkxDEDTrE9oGeKF+A+/+YLSUhHd5SHjYqVLAGpfVU9hfsazzD4EBKeDeWnD/pNbD6s9hOQQfwLbg9vkqoeXD94CNusFI7kDWH4yust3nvH+ZFhClrHTLRtlO+0mVI5w9HznWj8j7XZ2yM3SsPVo9WmEQYyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(6512007)(5660300002)(8936002)(26005)(66556008)(316002)(2616005)(2906002)(86362001)(38100700002)(31696002)(508600001)(6486002)(66476007)(4326008)(54906003)(6916009)(8676002)(186003)(83380400001)(53546011)(6506007)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgW/9EJ15HCLxrm/5HVyL4kJI2T++L1/0kcSGnLFKVVk7KpC0hk7WGERvCCY?=
 =?us-ascii?Q?kCjTRXEpLpYrvKM1s2p0naE/GyCRb83fqpbd9Vhz0JB6dSRNH+kecA0s7CfQ?=
 =?us-ascii?Q?SW6JtRH7tuew2D1xmGijcBx2h15/0aI/wxjVeSucI3BGaGzPLpT6wDtenlVj?=
 =?us-ascii?Q?tdSL6RCCtZwC26yBgQIo2Gy0DwNTeZtpEOYopMnarBJ1/QQ4Krh03lW/0LPc?=
 =?us-ascii?Q?Mbnkqy0JUJokIQFqnQObhmzMhh6cgOWeLEj3Pw4UF6+H8ftUSbSJyesuyZmu?=
 =?us-ascii?Q?TTXSb53QoRUqXlJqUKMZbCYD4CMNmJT+b69p38dxFFQjKC5vOYCr9DJgtQmY?=
 =?us-ascii?Q?5puv4nUphnTrEoxSfpBPZv0ZP1pMwGYZK6u23hIJ02zGqBAzYYeCE5rz2Lnq?=
 =?us-ascii?Q?LadMGNdaE7MDYM3J5VxZ1/qqld6BafraDyivAy/fE+48PRMZp3BiDSsv3ALF?=
 =?us-ascii?Q?7GYqlDaOGXES9SGCQNUNRIGjgKQFvOCeoau9Qr6Quh1W/1rS0bY8xQAzTPLS?=
 =?us-ascii?Q?jviXLt6zeivmgpLxiAT0z77RQ7SuH9dGvbuDDtzPkwdzZSUt6OqlKs3Dbwip?=
 =?us-ascii?Q?PI5ldErdrAW/RhOSw15QacMJ2hsdWlZh7orMbbENfhIcnv5A1jwJ8Lf9d2SN?=
 =?us-ascii?Q?Y3p1S1R5nHIP7j6RgSCqB0NKvgy8CVoTXavh9/ruxXvo0smwob0PqzlKTGKU?=
 =?us-ascii?Q?6MMOrsvA6KjrnsHwZaBzrYTJiCZG5pI/5bMaf0esL41g5n/WgtaeuouZsq0H?=
 =?us-ascii?Q?HBF6d9anXhfEtEuOAauK2s2TmLAHqNbJ4iQpigI4wbYrO/Bn92B7qdxEaUWc?=
 =?us-ascii?Q?rEixN31h2mJvvUF+6Rqrz1tEM16Wc3xr4gbb9cZcCjzIUJKWjL3em99nP/7u?=
 =?us-ascii?Q?XgO608/3y8Go3U6iYQzAfO2Gch/m1eRdU4S+xuSDtsmv3uZYq8Rkv0Jyojxb?=
 =?us-ascii?Q?tgvDo2hnEE5pM6c0x++U1l9w/eTTUHeAOPYfVE3fVSQ/9d5z4Rdg1NEo+jSx?=
 =?us-ascii?Q?b4Fv+vuW6qBhdGMjALOKhVmuyX+r4rYWKomwdt7gKoxZA1LfVNaSadD9gfJ2?=
 =?us-ascii?Q?OaOu4ZM3Xhl6f8U51mccrKBuoc34ajkrCxMb/vpV/9Yt67pW7sF4Z7lDW7gZ?=
 =?us-ascii?Q?ghTRcQ/hAVfNq/h7BRUb9JB4GrDR92j8sQBkY5kD8ObRKzvTjCFzG5qCjSKz?=
 =?us-ascii?Q?UgO9vxrrG3RS+AzqOChQ+GQ4zxteZW9wYcef6rTsncuoc/EQAhQewxoftDA8?=
 =?us-ascii?Q?0NkpWpc/8Q5eV3o6Uecj3/oJxcT1kCF+rtwQCUIHRdvhYi81LA7xyqNDpG0F?=
 =?us-ascii?Q?TbMVTqJQla7+rAjkhxeR5/OhDh01Mg/1aQHarhEwuDe4pdrcYF9DnrqWhyJU?=
 =?us-ascii?Q?npCBKE/f/1d8urBXTd8JEOGEpWbXLTSdNK+GrtNMWA/oNTaVxqb+CJRHLIHX?=
 =?us-ascii?Q?TbM7xJDr0bYSdyDwoOlxrDLs6SrcQRFWQ6SAtu+/iq7Bv5gCK2RjZCCoD6Q4?=
 =?us-ascii?Q?xsRKxFdt1uO9B0uXGmI4lWWjlxaWORbqjAjR1iIVeZfa0kQD+9vmMFEVVVNm?=
 =?us-ascii?Q?Z3vsXpN/jLeTg8+7Ps4II0BFxtgU2XNjcwLFk2DhQ/gT6LqMMYcEp9WZMr0f?=
 =?us-ascii?Q?A6WtNYZkrJyS8sPskT7ApjoDDmaKBfrls/015tQipFyGsmhuNiHHpSjIUFip?=
 =?us-ascii?Q?h/RyWDtrep6dwgW87ORvRPE6rRdmOQRadmghk7BJWl2F12MYEyv+hPEsiF8x?=
 =?us-ascii?Q?xRoX2AWlQw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab92ff82-1049-4c98-96f1-08da2755427b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:20:36.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rqXbnimmGZUUwiYEobW7X8qR+4JDhcEGPIUHPpX5MiMbm+U6rSKotmq5OTcSSau9ZwHBz1ZCNVvYJCT2GqLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6035

On 25.04.2022 20:07, Andrew Cooper wrote:
> Clang 13 chokes with:
>=20
>   In file included from xsm/flask/flask_op.c:780:
>   xsm/flask/flask_op.c:698:33: error: passing 4-byte aligned argument to
>   8-byte aligned parameter 1 of 'flask_ocontext_add' may result in an
>   unaligned pointer access [-Werror,-Walign-mismatch]
>           rv =3D flask_ocontext_add(&op.u.ocontext);
>                                   ^
>=20
> and the same for flask_ocontext_del().  It isn't a problem in practice,
> because the union always starts 8 bytes into {xen,compat}_flask_op_t, but=
 the
> diagnostic is based on type alignment alone.
>=20
> struct xen_flask_ocontext has the same layout between native and compat, =
but
> does change alignment because of uint64_t, and there is only a native
> implementation of flask_ocontext_add().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Slightly RFC because there don't appear to be any good options here.

We cannot address this by altering the public header. Besides us having
previously agreed to avoid the use of extensions outside of tools-only
parts of these headers (or else you could simply use uint64_aligned_t),
you're also altering the ABI for compat guests by changing the alignment.

On irc yesterday we had

18:12:06 - jbeulich: With alignof() =3D=3D 4 the compiler could put the var=
iable on the stack, but not 8-byte aligned (if something else occupies anot=
her 32-bit slot).
18:13:34 - andyhhp: well - it can't in this case
18:13:37 - andyhhp: I agree it can in principle

which I don't understand, but which I'd like to understand in this
context: Why would the compiler not be allowed to place
compat_flask_op()'s op variable 4-but-not-8-byte aligned on the stack?
Then, if forcing 8-byte alignment of op, the compiler still issuing a
diagnostic would be a (minor) bug imo, as taking into account variable
alignment and offset into the structure would be enough to know that
_this instance_ of the struct cannot be misaligned. (Of course this
wouldn't help us, as we'd still need to work around the deficiency.)

One possible way to deal with the problem that I can see (without
having actually tried it) is to make the two functions take a parameter
of compat_flask_ocontext_t *. That's type-compatible with struct
xen_flask_ocontext *, but has reduced alignment. Of course this will
require ugly #ifdef-ary because the type won't be available without
CONFIG_COMPAT. Otoh any approach avoiding #ifdef-ary (like introducing
yet another typedef matching that of compat_flask_ocontext_t, just
without reference to struct compat_flask_ocontext) would needlessly
impact !COMPAT builds.

Jan


