Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E94C3FC4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278771.476140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVeA-0005LL-H3; Fri, 25 Feb 2022 08:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278771.476140; Fri, 25 Feb 2022 08:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVeA-0005JU-Do; Fri, 25 Feb 2022 08:08:14 +0000
Received: by outflank-mailman (input) for mailman id 278771;
 Fri, 25 Feb 2022 08:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNVe8-0005JO-Us
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:08:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 128d5a32-9612-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:08:11 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2054.outbound.protection.outlook.com [104.47.1.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-BxiCtfTXOlupAQFzqxlAtQ-1; Fri, 25 Feb 2022 09:08:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4769.eurprd04.prod.outlook.com (2603:10a6:208:ce::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:08:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 08:08:08 +0000
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
X-Inumbo-ID: 128d5a32-9612-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645776490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiAbcjw3IJnH6SQpm1Ncps3d2ZlSMnMmS/DnNHXZ46A=;
	b=VyG1pIiX1Lk7HTdoY+9Ur/6+6Qwqnjp6Behagdql1r5AHUrqHxonir0ToqIwVBiVt/pCS2
	Cq2KIXJT0XgVyVrAImgnXOgZyD5G8zZqknxYpSWv/XQhgbLwDYnQC1NF5BphjWm9v6zims
	rnEl1J9AXrJbAWGXWf2xrwd0OTAnlLg=
X-MC-Unique: BxiCtfTXOlupAQFzqxlAtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUV3dZsLouEl2eQk3d+7FEtWkf7IR/psdyXS5TMPDIFOjRulMoLjvKyHWQG0Gj5rr1m08aeHATDAXASVzqOAA2oxCNpCA7JYfYQtSLm8Hw4mpELIbzD0gNOUVEYemHHYyNk2ROXd5cfhvndGtob6rNWx7mlakibWnroT2VIJLHmERnIJ5Qe/wVgPFax/eEudTssyeH3d/WwRcPTkHBhZ8uZlpgKyw7kJ5AYI5QxWWgJc2PTZJ0Gk+k11WflkPgDu7RwhtOYx/t4UkYqqMbRpBijHFF9ycnbFu4tt1Ys4A6RO02lE5LeLlaJVeb2DloDQrK8i1mSduTravY8RdOgoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8j6NO4oah08wH/fsHgkYTWGSVNd52XmtLPxm300hho=;
 b=APnOu7MtsQ+ySyGWKObSx3nx8x+XLaHXawXvv8Y+suqDvKFPrvH0gVaes8duuYGQS/hgNkTQuqb8aKCMSaPD5z1995RPfljMUIFNelAI156QSDjfEUBGcec23ctSxK2MWy0d4uh0GodKgGtHuBHgjNiAdi21T6hEFNtqvzipEiEMYdTV+BVl4biRD3MSEpJ5jMqA4Uw3DEseXtHJFCkZhonZJeBE+dUQ3sRrJZ5gTsWrX9r1QjecW8nY0PnITlRBKpWCn2FSGSNLT895EDZqhbZUZMTBOlZ4JBzAbXv8Cqp0u2PKdw2g/qIEeeRSk5/JXdTQQxsFk6IWCnRacJqvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da4f6447-03ce-2c31-3243-909d879745c9@suse.com>
Date: Fri, 25 Feb 2022 09:08:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Ping: [PATCH v2] x86/time: switch platform timer hooks to altcall
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
 <68d40be4-9ced-01bf-8bc3-585f11827504@suse.com>
 <822a757b-a9a3-e677-4cc4-3879125f9f24@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <822a757b-a9a3-e677-4cc4-3879125f9f24@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0086.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b5fad0a-d567-4cb9-403f-08d9f835f542
X-MS-TrafficTypeDiagnostic: AM0PR04MB4769:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4769430B4A7E4318E264B401B33E9@AM0PR04MB4769.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cAf1uobqDu+vQEpr5Y9BJZI4I3vUuX05cCgcwA0TvpaNf4GVYBpnquShRWpW1IfPMT7r1vfeBSZcPZae+TICK7ntmhRurx7RhC+s950ll6Kg+p2xMRrfbxrDvERn1/pBagNz/G43S6Nzfq0S6+NkMi1XkkpV8YfxStVfe51tzQ8N42QzgOo+Zz3jjuLja1Gzgo0lgp3k+3weboxkRW6rRwBTtWv3t9j0wbXarB/kLA92Qya3jLWgpxuU+PU2z/GawIs2+tVvxC1Hat+jLgCU0PhZL2UAotlw2/AreKbRC1tnUDmHsY3IRiWuARc4nU2YLsozcdy1kfCuTdI/LlyTGGvG/XXUUrFtMOKSpnN+0nq+I+fvQUvjf8O3ZG0fUpJ/wbEd/MsULdZw9613TkpY7PbIMQ4kKSZjWwTWZltHqg9Bmvg4nxpPNhiA1a+pOD6iHqvFDJIyykaX9GUN+xQM0oIN2uconBkEPVE3tNWIs0GX9pBMb+vT1wGP/aZUkPLih0RzeP1rCXBRYufg5mjUk5wnLM9xSxhFNTwUBZtvs1wL5iXqPgFJ5aSfF347Bggw3hM+gJhTJVnKSt8moSDRmJNMU6V4okg5k2miPsV36Y/JnXT+18FgtNUyBFCY3inMPZf7xooJ6Pbl0ZsXg05xbWNJFxBKLQ08QLfLAFHr5w13IzNDq1OxYodlnR+545odv54CCJQGvCOREFf/fZsGAuwGsuQp/nqCFfnyQA2dpEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(8936002)(38100700002)(508600001)(83380400001)(54906003)(6486002)(316002)(6916009)(36756003)(4326008)(66946007)(6506007)(6512007)(6666004)(31696002)(86362001)(8676002)(66556008)(66476007)(53546011)(5660300002)(2616005)(2906002)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vv1FQHTizhfosY++lS5ZiSVjIXgLt54cSIyJVqa7ANVBlm3vO+sdaxq7Pikp?=
 =?us-ascii?Q?GBLnWB9f0jbWq27C5m/v9nuGVP+t4yfCYnMF8TgrjumZyzfh8loPRG8Gxu4L?=
 =?us-ascii?Q?6d1g3cXrr939WqKH5031o4MXKsA5qTfTjJ91wts9SXsUqRy+yZeyr0omlHnh?=
 =?us-ascii?Q?EXiLwDLrmQn09CsaeqLTUaufKRxO2HmIJaphYkt5F9pcaOMz4QGVetFYR+MS?=
 =?us-ascii?Q?8dzs5z3IbN5oeXIAJ/Z5SWJlP3AyQzxzgwRNCvA2Ya03wqC0AAA8qvW6YRZQ?=
 =?us-ascii?Q?YMvSL1PzXGdZUM9LPexlO6jB1WOa0I6ji6pQYcBKm3alY21I1IIUWtVu9C+B?=
 =?us-ascii?Q?yrpeq+MMOPdU1ZBhlLQtXgFYIRzi8BVqgQEh7OycAEH71sUG0a//h1E+UyDH?=
 =?us-ascii?Q?dwA0GG16k9EpF2t+mF2wmmW2QRgArttV+0nbh9a1d+MQs/wpp7c+24ItaFnF?=
 =?us-ascii?Q?MWO0VwqX5Nex6iZK5BOneX2Po4R9gyk4rgpUWEQFkhviI88wddt6Ivg05oY9?=
 =?us-ascii?Q?UwVb+CTjMCXK3KNCCHyGiOxHKYtGHmLLOhAW11BC2KoU8HiBfs9wRYv4g/DT?=
 =?us-ascii?Q?gqTtoVIINz9e0X0exeuu7LCL/33z/K7np2IDyNRKoPsq2gGbsWsNDbHz0lB/?=
 =?us-ascii?Q?9S+l6ERoLfreEabKk78zCCDck41wUZuiReM1DiDOCN2FbIWD4joFgW9VSDhT?=
 =?us-ascii?Q?W1BkhHE83nM8jUlY1/XgY4ODo+0a1auTC51ENHmMgb8vW5g26iQ8cJvf+/qh?=
 =?us-ascii?Q?xjCDNX75ejiwb8NxxPk4jxHAslw97cq2XEKei1AdyXTzIIG/eHQWztGACYW2?=
 =?us-ascii?Q?D/vRL7recsapHuHSyYYfCABbMiQlzYJmWRo9P8DVhBVMPWlAIMn8UKcM0Tgb?=
 =?us-ascii?Q?4B0Nx3WXWiRTMoP0cijFRuYGXDqx5quQpOk+Gjlmv6wDMwzyMA/7dBjxNjXb?=
 =?us-ascii?Q?6u/GTw0dFQRYPyaQqSjhIGGH5JZ/O5cdb/qo3MyygruPdieIYUwebARGTMCS?=
 =?us-ascii?Q?DV4Ko6+xHRKNFU+vdllxZfLyVvZIhOdh4JBFJZ+nku3OtlE+y2vlH3F4+LF+?=
 =?us-ascii?Q?Y2HrqK617LMAczvimsCIVSnG/hXSOdZeF7W9abOVGN70BpvByJ+FIaNqiZTs?=
 =?us-ascii?Q?UCJ06laaf5S2/gsBroUJonJKFvCbRUtysfv7D9FNB3Gha/2OyirN8yRXPI6B?=
 =?us-ascii?Q?hAEY0bwyx/YJuqsb9MmW9qMwPl7VqHckrEFpcHfetTUK2F3JjvwmljYyq4sM?=
 =?us-ascii?Q?jbc8DbEuOtX2CU58qP9OssZGr72POjY1OEgl1p7skna3l/9x75AOFKqBHqxh?=
 =?us-ascii?Q?SqW/PI4XTXqcqOUMNopd7OPHi2SyELpZFRergz/kWR+4Uz1TW4u+1241/jYj?=
 =?us-ascii?Q?XRqTZdwurL+Rh7KppRRURmYw/xvB8YXtdvXdWpL6t/88NngqsXgIFp9tEByW?=
 =?us-ascii?Q?gkNV4NhNFNk9ukp0rSvXclw7j7n0Y1kfMcaH8o5e61h4hZJQv3lkddk3KjPs?=
 =?us-ascii?Q?9qrRE0Zr530ZUknkNs9MY1XZqkGYJStGaYRut84C2xysBhPTQxOhmWs1/UDq?=
 =?us-ascii?Q?2cRT02V8C1gHodoTqevf2g6WgxurafBeAVjSj9407OtEKq4d0zrflla5uE3t?=
 =?us-ascii?Q?2EW9Bs0i5YmTw9F8idq0qEQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5fad0a-d567-4cb9-403f-08d9f835f542
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:08:08.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSSRg8R14cpHcZuYaQZq/OztY/6L2MWT74+9xYDuy8duLaKWAFf2KRr22d35eB1/5XysrhBK6SWwu6YBqt60Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4769

On 24.02.2022 18:39, Andrew Cooper wrote:
> On 24/02/2022 11:25, Jan Beulich wrote:
>> On 13.01.2022 14:17, Jan Beulich wrote:
>>> Except in the "clocksource=3Dtsc" case we can replace the indirect call=
s
>>> involved in accessing the platform timers by direct ones, as they get
>>> established once and never changed. To also cover the "tsc" case, invok=
e
>>> what read_tsc() resolves to directly. In turn read_tsc() then becomes
>>> unreachable and hence can move to .init.*.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> As this actually amends the IBT work, I would have hoped for it to be
>> viewed as useful.
>=20
> Sorry - it fell through the cracks.=C2=A0 Definitely useful.
>=20
>>  Of course if accepted in general, it would now want
>> to have __initconst_cf_clobber annotation addition included. Albeit
>> there's a slight complication: Some of the structures are written to,
>> so those couldn't really be "const".
>=20
> The .init.cf_clobber section needs to container a pointer to every
> target function.=C2=A0 For the current ops structures, we just put the wh=
ole
> ops structure in.
>=20
> For individual functions, the best plan I could come up with was a macro
> which emits:
>=20
> .pushsection .init.cf_clobber, a, @progbits
> .quad fn
> .popsection
>=20
> wrapped up in #define cf_clobber(fn), so the end code result ought to
> look like:
>=20
> static void foo(param *bar)
> {
> =C2=A0=C2=A0=C2=A0 ...
> }
> cf_clobber(foo);
>=20
> similar to command line parameters.
>=20
>=20
> That said, in this case, can't we cf_clobber each platform_timesource ?=
=C2=A0
> It would require altcall()ing the resume hook too.=C2=A0 (the init hook w=
on't
> matter either way.)

The resume hook is altcall()ed by the patch already. The problem isn't
that the annotation would be wrong when placed on all ops structs, but
that a mix of const and non-const isn't okay. Some of the structs can
be made const (plt_pit, plt_xen_timer, and plt_hyperv_timer),
but others cannot be (plt_hpet, plt_pmtimer, and plt_tsc). (There's
also going to be fallout from making some const, as then the .init
hook needs to change so its parameter is pointer to const, which in
turn requires updates to plt_hpet and plt_pmtimer to be no longer be
made through the function's parameter, but that's merely a cosmetic
and patch size aspect.)

As said in reply to Roger, I think I'd prefer to do this 2nd
transformation in a separate patch anyway, putting in the one here as
is (merely mechanically rebased over the cf_check additions). The two
steps are technically separable, and with the other adjustments needed
it seems better to keep them separate. (And really I'm about to put in
the patch here.)

As to the init hook not mattering: verify_tsc_reliability() is an
initcall, which happens after AP bringup and hence after the 2nd
alternatives patching pass. Therefore plt_tsc cannot be annotated. But
that's fine: It has no resume hook and the plan is to do away with
read_tsc() as a real function.

Jan


