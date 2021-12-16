Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD5476BC9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 09:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247756.427226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxlzy-0000Fc-LK; Thu, 16 Dec 2021 08:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247756.427226; Thu, 16 Dec 2021 08:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxlzy-0000D5-I6; Thu, 16 Dec 2021 08:20:22 +0000
Received: by outflank-mailman (input) for mailman id 247756;
 Thu, 16 Dec 2021 08:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxlzx-0000Cz-HR
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 08:20:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00d0120a-5e49-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 09:20:18 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27--xuTyexDMkii2xQbfIcWLg-1; Thu, 16 Dec 2021 09:20:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5326.eurprd04.prod.outlook.com (2603:10a6:803:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 08:20:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 08:20:16 +0000
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
X-Inumbo-ID: 00d0120a-5e49-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639642818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTfFCr2+4IWUIwCXpW+B7oWvdRfx5RdM/OXQuzVwbhE=;
	b=O8CVwa1vhydLnF+jeiZNFIpTbCdthmR5PV2Tr1z0gdqzcPHZBI36pS7jNJJ6f4eCxb8w3f
	6//BXE2s2qZM2BvPt5Zs6F72bHxdD/+4Bk3xPuW/zZwAgTRDKA8VOew7hEU1FPSJqklYLs
	boW4TtxFAGj6A+BKqNZbCcclvP9dM4M=
X-MC-Unique: -xuTyexDMkii2xQbfIcWLg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsCUup+yD186z3q+v1jJtFgv8bmTd+5e8qUrHlgo97zPrPtbj64lWS9lUpbWESn9kYKAwPq5kLzWWtYZDdC9r1K7pImEbIXf0qGUraxpmYEzARLKiLlxjkqeORQ5M+I9VljLZ37TORXznbJlDPlcKP315GL3zSFtSSE7dNmathqYphqcT0jmc2PxbAVGMykRVXDPNagJ29v3Xv5FKHgzdQYsTNgK1SCUwYqzA6xpvFFgGuV9WJFGl9lFS2zrdFrl3SHcsBjIUNQ24O44/CXmPtyOfvk7zyst0zYdl21Y/E2buMcm0wGTbQLZu3HtcYgNMSnD9EPp8Z4eP9yTZfgywQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNvgtSniZ8bZ4mekxxI8cWsVmTiwNR4T/2Sb4VG8PR0=;
 b=NiKcAAihE3V3Gnxra4jK4unYvb4nkwYoyZfcDMx8kDkBkBa8ABo48AH2fef5WUaPK9KZGzVmuNdglqnPgKwTtVy3PeE1pxgyw1FieT+KPm4ucazqOsX+V9T+z0Zax8JKKQg4JTXSsNpsxGUkaTxIMcD0Lb39jnm914C3rEejjxoETcYO3so7H/LNDY99NSN3x2q2bfjUTPJlhmAVuTjn6fhefDxdxIt1sskTmnTsW6gmzgY+oThJ+usHDq9dDtuj3b1XmVDzzNFFbZglQCeTdn9iU6hiBuhtMeMUnmCR+xQ3SBoVgasJSSlC9yjUllk9ukZ7jfDmphqyYqSnEw1dDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a44e6eeb-f803-11b0-da78-d4437ce1a59e@suse.com>
Date: Thu, 16 Dec 2021 09:20:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86/cpuid: Introduce dom0-cpuid command line option
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211214211600.2751-1-andrew.cooper3@citrix.com>
 <b187ef25-bbfa-1880-0a10-462c2ba64e72@suse.com>
 <1d937a49-e0a2-58a2-b51c-495a957adb0d@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1d937a49-e0a2-58a2-b51c-495a957adb0d@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f182b9b-3f82-4012-32f8-08d9c06ce3a7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5326:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53266465AED2471692F6ECD2B3779@VI1PR04MB5326.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UCT7aT/CnohxhHDiNLmkl32tUedX52JBpc7x1pWtpLy8s+rNq/4pzd8JnDKajOw6SuozfXgS4SbzuaRyrLIOmKNV22Xd72a7SC8x+wizhoZU52E7Z0+aIHceKY8zNQO5mnBNx5biRnNog3yI4FvyIelWVMGIb5d5DAV2Wjsgr5lbXsjQzf9Rnu4rorkiKhW2Va0AzW7wz2aJvQzyHYaOy39GVun0O6ZVW3s7FxlRfmFmDhUo+OtVM5Bz5Yo0DiLCA8/at1w9vHaWv6I+i283MhCeoD7bLF8f69BuAQNbajZSro8F3BJmtPhcjw2BWtYIhRxgk6MvQC3igkjEML3WbWpN773MAc4cqEoR9xdZ5iRC82Iq0xwAqujyWWzV3qyeoiT21TB+GX3iH5EaBZrgS8F3jvN2cLafQv/rmddAjUjA+dCaPmFSa3I/GH6HlwwwJy1zjDRfBZOrR4mHuWSwM7HEyZOmCR6k6EzRq2N+GpWyrKGA7CoBa11E97soW5A+iNfd5t8VzkiTi35Mtvu9tAYh3r6LY5JGW14XZc7u4Zow/6Lz5wNQggQ5EkKifasl/8WDfcWbyHN6Uod7Ynu/qs6xI0EAC/QlHDR3XFa5UUQ7rIWRDBccsbqKRVBW+jQhswqRebjl/cQuCcy592JhHIVzXtTJ1rUX2ySpXdUyv8kPQ8Hrus/mcxhKy8mKkDL+ugWmkv021BNluiJpNL7oPZBU94QpHgSO1MYwv1Bp84w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(110136005)(6486002)(2906002)(66946007)(4326008)(316002)(8936002)(54906003)(8676002)(86362001)(508600001)(31686004)(2616005)(5660300002)(66556008)(66476007)(6512007)(186003)(38100700002)(31696002)(53546011)(6506007)(26005)(36756003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igzmotjWa9ecx/kDE9Dn4GVD3yb3IRaUyKWYSel9PtfGxXh6CYVMXOeMUcpx?=
 =?us-ascii?Q?lHUMfhJ8yyFyPCdbD/oo+Ro5DBcMiera6qLsK67JF/bjwgkhAyt2EuM1iX94?=
 =?us-ascii?Q?q1L37HMF0sQSbqEN+qLMThMWJzP0JVXwppofqTOW+kGKHym9Nn5nvkW/gV6/?=
 =?us-ascii?Q?VnlKdTATJ9hHrjMCQy3jBC0FOs5BmHS0jHOJO6qFpfySrU/x9N/Lv59zU+yO?=
 =?us-ascii?Q?1M+MPbsU6l0KQHAs2kVxpfZXrzZ+dt5S2HG7V9Rtqp55KZTlI8dBlb6Ne/bw?=
 =?us-ascii?Q?tIRCEQD4vk0InQ5GwnQVq9IwjhI9qO3ea05YDRsVFYBJdsCYdbO58YJNXKnE?=
 =?us-ascii?Q?12HK0bVmCKHsDvA+4UxXtPXx3FgPlZleTarXj91Fkkn2V+UWv3gUK/hPK8zs?=
 =?us-ascii?Q?hTqnRoGzS22BafRqMLQsqNg1F4+NqUEARbdM78pXwpJDLtYPlEcpjzvZSXgp?=
 =?us-ascii?Q?6lcOzmpcDLq70V+SZyr3GRKBwIx4h7u2x5wF9FtpD1/Dei1xWeDxFGisb3kZ?=
 =?us-ascii?Q?VlFYpkVF9exlxIeHhKGjapTp3G2IgNx+VqG7NzOD3scHIG7v1yUQDf84j9fC?=
 =?us-ascii?Q?8779ePzTmAoYvyIZy0TLpPk6EZ0blXLsTZ2vIblP4KOhJeK2DJwLtczTnyhh?=
 =?us-ascii?Q?DP7XfQB2Xq1t9ccOBjOSKJZ0ZCtgfvYQVXCjhcVo8n02XQoNiuwF5M1WhJwn?=
 =?us-ascii?Q?Zr7W4XbAE8CpOhSmbeCGFem2mEHJCkqractsSeEhOIN1bPqmXOmobOfWfB2c?=
 =?us-ascii?Q?mlcn8efrgeaaM6aNfY1S0Y0gE4VRknG4yslYxj5PAlEO9rZzmzp6b9IErYrR?=
 =?us-ascii?Q?7DcdvBo6U8lZGm6iZRrfetMkbk+V7HgA2GkQSDIvgydEhnaNe2MES+71EXbQ?=
 =?us-ascii?Q?GrBHRHw4RDL/98SOce67mCsnSIY1DjW9qE9yEVM2WsNPZAGiS73M4m3J+sML?=
 =?us-ascii?Q?5RbwOR8UXO3tVjW1BZDaJkstmEnbPpeNMHSkPZXyDc8NhQ2xFd5arhWttZS0?=
 =?us-ascii?Q?1+XudJgB8Wj6SarxoDWaCbL3ulgyV8obCEJMn8zyadopOJ+CXcXfgD7dKv8j?=
 =?us-ascii?Q?uK2UBf6exPZZea2uzdUhK7scC/b4eAixRblMAX8QGJtlJYcNtZ+4O7LAGIHW?=
 =?us-ascii?Q?g9Qghqs7j2q4xNjg0oKQgzk1WwxW/yvNtrfkCS+QaMJy0zt9bPSHhdh+0tEY?=
 =?us-ascii?Q?jC6h3bjRU6FtETS6gLaZFiAtLn6cV7dAaEcyYE8uhQnbnArTJk8PWf6v80xJ?=
 =?us-ascii?Q?zahAUge4LgTwi5VwVuRwv8IV6zbHa65xhQye+2Pf7hfBxV1X5Iiuv8X5oeGS?=
 =?us-ascii?Q?HpKuRKhQnr91o5YCQo1c/i5su6QLaOvi4SS4NHUEbSyPTOpLCLIzKALAlFzE?=
 =?us-ascii?Q?989WhzcD6pUKMMn3nc29vr8e+0iHsyADjUpyuZiC7Lo2mNPPONpIndgmU4J1?=
 =?us-ascii?Q?Rk+tMn5KlK7uQOxEtjGwpwpUmF4kl9shkYULylPx8H4eLCI5UU1Qj9ZUakii?=
 =?us-ascii?Q?cbQDTKZnEteA+1YQPt1PICxgVj6EKFJlcNNGoJqvl6ha87+L8D41ff8NVFdO?=
 =?us-ascii?Q?7iGeDJN+C5SY+/FwTD8KsVpaaXLJAtmiKrv6Yr2bSt4axLv4oMF8P19qTCHp?=
 =?us-ascii?Q?RoXfXZarJboPyP9VdrtJgJE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f182b9b-3f82-4012-32f8-08d9c06ce3a7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 08:20:15.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kdmd9z85bb4Vn64TJJRV1fUUKUGzx/f4vHVmmqKj3OHsI9/RVwuX1UHUvh9cpYuaSL5CcHYe/lb6NrCDMI9A0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326

On 15.12.2021 13:13, Andrew Cooper wrote:
> On 15/12/2021 08:34, Jan Beulich wrote:
>> On 14.12.2021 22:16, Andrew Cooper wrote:
>>> RFC, because I think we've got a preexisting error with late hwdom here=
.  We
>>> really should not be cobbering a late hwdom's settings (which were prov=
ided in
>>> the usual way by the toolstack in dom0).
>> For ITSC I think also covering late hwdom is at least acceptable. For th=
e
>> speculation controls I'm less certain (but as per the comment there they=
're
>> temporary only anyway), and I agree the command line option here should
>> strictly only apply to Dom0 (or else, as a minor aspect, the option also
>> would better be named "hwdom-cpuid=3D").
>>
>>> Furthermore, the distinction gets more murky in a hyperlaunch future wh=
ere
>>> multiple domains may be constructed by Xen, and there is reason to expe=
ct that
>>> a full toolstack-like configuration is made available for them.
>> Like above, anything created via the toolstack interfaces should use the
>> toolstack controls. If there was something dom0less-like on x86, domains
>> created that way (without toolstack involvement) would instead want to
>> have another way of controlling their CPUID settings.
>>
>>> One option might be to remove the special case from init_domain_cpuid_p=
olicy()
>>> and instead make a call into the cpuid code from create_dom0().  It wou=
ld have
>>> to be placed between domain_create() and alloc_dom0_vcpu0() for dynamic=
 sizing
>>> of the FPU block to work.  Thoughts?
>> As said above, I think the ITSC special case could stay. But apart from
>> this I agree.
>=20
> So I disagree with keeping the ITSC special case.
>=20
> I do agree that a non-dom0 hwdom probably wants ITSC, but ITSC
> explicitly can be controlled by the toolstack, and therefore Xen should
> not be overriding the toolstack's decision.

Well, fair enough as long as there actually is a tool stack side equivalent
of this.

>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -801,6 +801,22 @@ Controls for how dom0 is constructed on x86 system=
s.
>>> =20
>>>      If using this option is necessary to fix an issue, please report a=
 bug.
>>> =20
>>> +### dom0-cpuid
>>> +    =3D List of comma separated booleans
>>> +
>>> +    Applicability: x86
>>> +
>>> +This option allows for fine tuning of the facilities dom0 will use, af=
ter
>>> +accounting for hardware capabilities and Xen settings as enumerated vi=
a CPUID.
>>> +
>>> +Options are accepted in positive and negative form, to enable or disab=
le
>>> +specific features.  All selections via this mechanism are subject to n=
ormal
>>> +CPU Policy safety logic.
>>> +
>>> +This option is intended for developers to opt dom0 into non-default fe=
atures,
>>> +and is not intended for use in production circumstances.  If using thi=
s option
>>> +is necessary to fix an issue, please report a bug.
>> You may want to state explicitly that disables take priority over enable=
s,
>> as per the present implementation. Personally I would find it better if =
the
>> item specified last took effect. This is, as mentioned in other contexts=
,
>> so one can override earlier settings (e.g. in a xen.cfg file used with
>> xen.efi) by simply appending to the command line.
>=20
> Order of enabled/disabled I feel is an implementation detail.=C2=A0 Perha=
ps
> what to put in the docs is that specifying both forms is unsupported,
> but "this is for developers only" is already a fairly big hint.
>=20
> The only way to make a latest-takes-priority scheme work is to use
> string_param() (creating an arbitrary upper bound limit), and parsing
> the list during dom0 construction.

Why? Simply accompany __set_bit() by a __clear_bit() accessing the
opposite array.

Jan


