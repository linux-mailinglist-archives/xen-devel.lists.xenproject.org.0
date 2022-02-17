Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD34B9CF3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274597.470117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKduF-0006W4-H1; Thu, 17 Feb 2022 10:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274597.470117; Thu, 17 Feb 2022 10:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKduF-0006UC-DM; Thu, 17 Feb 2022 10:20:59 +0000
Received: by outflank-mailman (input) for mailman id 274597;
 Thu, 17 Feb 2022 10:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKduE-0006U6-8d
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:20:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1fe71c-8fdb-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:20:55 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-NKXEcG0YO8WnpF6p6XQDeQ-2; Thu, 17 Feb 2022 11:20:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6748.eurprd04.prod.outlook.com (2603:10a6:10:10e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 17 Feb
 2022 10:20:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 10:20:51 +0000
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
X-Inumbo-ID: 4a1fe71c-8fdb-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645092977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NCkLUEy2U6STOHaphPPK/NDCiSK/9UshqiogFsCJ9u8=;
	b=K2ja0xpYL7UEFjrofX0KfZQ+jVtrX3w2lKaABW/NSDZpROb0mUMuCVlRkjSCu2UOIfP+6P
	gThg+TChJ1ISSlU+leJQEnAdiJd5zA70gXEV31MTWzF0S8kmKQr4QF+ihgSOPm+NR5ra+f
	28dW/NN7VGeJkvoGYVkOTkd3cGV6dmY=
X-MC-Unique: NKXEcG0YO8WnpF6p6XQDeQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYhyvqieWnlrM+GQLxiRpFeVu7OPFGCGl7Et84oGBlAgcb8MXX3YSDTqtF0IvK38rHZ4Y29gu8HSZZQFbF3in7sDlSM+xwYL/nnv+icY0dur/SBldVDpzmVa8oXhgyNW2rBTFqyx5+zbzIIs9H9Z0hjz5MQ0HVb0kAiXzhJA/Ns6m+Z0Tcm9aFHYPbhuhdADSiFoskmrsW+eaP4pOlp0BOcG4oBoFwY1/WgIMSEfD129sCC6FNhNjp9rppAi3IkTDXj5oN9BbXtW/W2WXT8GAtWiqkXPTatIejkTOIGxoCepc5KoS3z+t/AGw3gVPFO8DNGKwrhct2GPtyr+UV9JWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgaWmZ0lcq7FzIcTB3VPyEClczv06jhS9M81h14zoSc=;
 b=XitLCcnX8O75KKEjALtUl1eN1A+PikeTKGu/42if+VV+eG5GIcruyWl/gpw2cq20ke1Xm1AyBId82c1/KdEepryrVSh2FF/hW5Q/5GlfGk3uBFeTbLSGb/3Q24fOFga4EmEcG8ZJYXUkTJ60CamDTISyRGCKZ72JhJsvd/MmdHOoI3W/YQe/s7iDF9JSE2YLn8dVl1UIppPJXqzOc6K7xg1f0iCYyFx6uJL6cKMtR3LyNmT+YOx8RPZC72K3jxrqwmQlJ4GcLmIuZtlD/fxJWR3aBmw0AZI2ksOyscbiS97/hiSJNA8kqzREOIk6MmSjo6eJ8FBxYqwFJf/i0rCeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44e0ab16-e807-c8f5-deef-7094b7aecdeb@suse.com>
Date: Thu, 17 Feb 2022 11:20:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 04/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-5-andrew.cooper3@citrix.com>
 <4d8ab414-caf4-5a12-4cb7-a88c633cfd66@suse.com>
 <e18c0c5a-d00b-adf9-d4b0-28e702a18241@srcf.net>
 <6566bf52-58da-f804-f5c2-fca64c1f150c@suse.com>
 <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f0889e93-aec0-443e-b3fc-081892edaf2b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR08CA0047.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d79aebf-8883-4afa-22a6-08d9f1ff2c36
X-MS-TrafficTypeDiagnostic: DB8PR04MB6748:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6748104038F6F065A131C69BB3369@DB8PR04MB6748.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DMKCms0Y8V1uTSqwlURtgVvYmRo/+Ok+lNjBtW4oh7E2xZBUvZP0R9s+fG4rpHWoQYaNeJ7rmfIlLQPkKQ9RjcNH2fjdLV/5Wcmr4giTS9BMrcbIxDK9kwrEDSJo+q/zNG57PFyp8PsEw6TJbNgoC14KnJ+cjiXA4zNgxpOkAFnx3hssRq6q7CuZqFJzLz0IwyiwaEZQjm8CRuMECW5k1vQn7ajmrZQtbzBwQvpYvvzV/7Z0Ld3JXfntstNk/OIXH2zDSCQiXbYkKO8JZH7+c+9KKJ65VLL+qaICxiJnU8xO8ibe3GFBbqfwXpXcR3jOT3nqhwzNGbZzHW2buRRM6D1b4FvdikfKC9rJdJx7xmIZR2Taszq8wDu4azqp2XMBBfCPVoN6HcUckNfj9ZNtJ9vVM/TwNhFo2V0HX/RUgCd36pTVaZ7/AUEZa0WphUIBoP50eju/k0ZnPyQRD06oqLfGiqCCJSa/+F2Om0e/BffO6q13yPeXzrpWlbTRg8FeqUfuSskgWe8XkShYy0yW+ENuCb8p4OqhJkUH69NQuT+RMz25SYG8W1AvgAV8/4R1kldj4KCo5j+DE26q9Z1BdKIMHvenizWxgBt8c1DuX/I5JBlTLPdODHxDldk5THFgg/mHYzSTQMniTdKVwHys8q/LvhnNoxBoXooQh6GAZeao6AG2NkmT64Egz+jGupgXpImfPbzjP1uhdcBgrH07n8CjjHQOh+/eLSX8Ly4OCCf/Pxa7ot1oN9iqHehJhifB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(6916009)(31686004)(6512007)(316002)(186003)(4326008)(66556008)(5660300002)(2906002)(66946007)(54906003)(36756003)(8936002)(8676002)(508600001)(6486002)(38100700002)(53546011)(83380400001)(31696002)(66574015)(86362001)(26005)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oFSpJlTEnRhxlI79Y+WOm7TwDP7XUbIVNn9SrO3xDTcpEhqKom/bi+0Djigu?=
 =?us-ascii?Q?2o6rh6QlJebbVb7+k5rXU6l+PdAw5PqAugOAFfJRIdOYcaaVl+zjgc0rwwxX?=
 =?us-ascii?Q?tX7Fe7GOjypIRV8GaobrEeKfLAHbQiChI3HPIikYlq6OrR3/Xqv8dnFvdPTd?=
 =?us-ascii?Q?jJIp8Xj2/yZVH4uJR7nmKecxSd1qYjKzxebkKUDVSOSwS24nuWNsjCDErNhn?=
 =?us-ascii?Q?hNx1349xUo/dt1ejfJiWLmHxVtm4tTQdLjXnJFhCgeS2FVMgpX3CBVIMJZQc?=
 =?us-ascii?Q?lnhVxdR2xZD8I8vYK3MsBDxXgWvfzkgWrTBgHSs7qBViYzPZ0R2iRSEBpFzN?=
 =?us-ascii?Q?hZKJDMrtB8ea2rLt3TKs2w54nS/622nPC+OhRM0Jenx1XbKM+bwctGVcu8yy?=
 =?us-ascii?Q?vuSxHY5wa2MpPpf92nTJBmVKPKt1VtI2uGA0dOO2iNEg9brMhXLHv2glRUyP?=
 =?us-ascii?Q?4FZj9xQadXY5+/o7FdMOIO1/FNIt+C7oLq3wxj9uTd8IhH5u0KnI+J/xBCMV?=
 =?us-ascii?Q?VQLKz2JRpTC8kjs6Izdx53Q/Dr9edaQkk2rkvVx/Jh40/4zof9//jMuQ/+2f?=
 =?us-ascii?Q?y4fGAJh61AZjJURORTZLI6LmMKueWmeIcegnBe5h4B8DSZbgOnOwEVNstxW4?=
 =?us-ascii?Q?TQjZZEcceOpBV4ICf8BtV5qN0MqqUNgz9nXLznoV3ENGODBKjfQfjSv0H0EY?=
 =?us-ascii?Q?Ky7jrLRHwabHLvOLyJJXq07kldGzKJCBxnHbm4d4NaxromJqwOGiLsZV8Jbj?=
 =?us-ascii?Q?btKrSUZVaxy+vA6iVaKiyV6vPFL8PXiEUTfeXMoT1W53aknyCJLZ7ewbg/7U?=
 =?us-ascii?Q?aDtU6J8+laBpIHL3z3gXvBLtlMOZhq+IB1jdAqsqFt2Y+yIQUTBPj69e6A9u?=
 =?us-ascii?Q?/jjGoBdGRbIlngiYn8EoXaOS19eV+k+2dz7YW/CwmsvxHTjjvNBVr0hu/0gX?=
 =?us-ascii?Q?nQp0vute1W79YIfeNdlmFSsbLImZySXTDnqyo+mt+FBfci1DpSLuj0onfOf9?=
 =?us-ascii?Q?66lYuU+0ZEuoiz/MSmBUgXbBTukRnlm82FlQ6Kf+kNfGD9hAeeL9qy4ubRWx?=
 =?us-ascii?Q?e+6UaPtTuzxq8Xcm2Ls9JEtcKUkLuSMbx4eBp1TZ+djVtMJC3yEFyTeHTIko?=
 =?us-ascii?Q?vhWFGjd+QzAHeiC7BVcZDa1At/lbTwfVloG6NRV935u47q1TAJHfqXCfotMY?=
 =?us-ascii?Q?tIGU44hhRBph2z33eyAfGaK3B/k0mpmjQgyBuvs6qv0y0PaOEcGaGsAd0SGu?=
 =?us-ascii?Q?Bh54k134wgl7PAUzHhuGU0tI6bF0g9kVMbA7sO2CrfhKhMFkyv6dYyDIO/pE?=
 =?us-ascii?Q?Yfqmh6eIoIO9C3K2Djuxi+3t9ehv4ze9Dh+EVuScT3Va3RlisT3GFpwc0his?=
 =?us-ascii?Q?B+xflu+ZHBeiFnF+1uqvQmTAZ0lywGEtgNZN25POlEmy3oVCQY1GCoCW040n?=
 =?us-ascii?Q?x7TrbJJk64cqH2P3PZkJQa2p6r8JxwXjZ7HUk844NFhrHVU2HApbPAQbWbZ2?=
 =?us-ascii?Q?aWykLFa70XDKhLwQnG9l/NTqbk3wgh34WmxYRajZ8ekRszU0+Upxaa8OMLTx?=
 =?us-ascii?Q?4kDASMm4f/nF066UD0kaIMLKoS+R5qZUCx+hTp5JtTprj0Z8CnciryOsb3RF?=
 =?us-ascii?Q?//t7Ys6VbAbCIe/lq610B/w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d79aebf-8883-4afa-22a6-08d9f1ff2c36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:20:51.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTjC5erxGQDtEJMSVcfTR3MOeEa6i9TnJl0VPTNcUEirYKEf5kPZBndw5KhAF3zugxdr2FkzntsltbXyrp3Ykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6748

On 16.02.2022 23:17, Andrew Cooper wrote:
> On 14/02/2022 13:56, Jan Beulich wrote:
>> On 14.02.2022 14:50, Andrew Cooper wrote:
>>> On 14/02/2022 13:33, Jan Beulich wrote:
>>>> On 14.02.2022 13:50, Andrew Cooper wrote:
>>>>> From: Juergen Gross <jgross@suse.com>
>>>>>
>>>>> When running as pv-shim the hypercall is modified today in order to
>>>>> replace the functions for __HYPERVISOR_event_channel_op and
>>>>> __HYPERVISOR_grant_table_op hypercalls.
>>>>>
>>>>> Change this to call the related functions from the normal handlers
>>>>> instead when running as shim. The performance implications are not
>>>>> really relevant, as a normal production hypervisor will not be
>>>>> configured to support shim mode, so the related calls will be dropped
>>>>> due to optimization of the compiler.
>>>>>
>>>>> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
>>>>> wrapper do_grant_table_op() needed, as in this case grant_table.c
>>>>> isn't being built.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> I don't think you sync-ed this with J=C3=BCrgen's v3. There were only =
minor
>>>> changes but having a stale version sent two months later isn't very
>>>> nice.
>>> I did resync.=C2=A0 What do you think is missing?
>> A few likely() / unlikely() as far as I could see.
>=20
> Oh those two.=C2=A0 I appear to have forgot to email.
>=20
> They're wrong - observe they're in an ifndef block, not an ifdef block.=
=C2=A0

I don't see how the (unrelated) #ifndef matters here: The #ifndef
is about grant table availability. The two likely() are about
running as shim. I'm of the firm opinion that a binary built
without PV_SHIM_EXCLUSIVE is far more likely to be used as a bare
metal hypervisor. And for a PV_SHIM_EXCLUSIVE hypervisor the
conditions are constant anyway, and hence the unlikely() has no
effect.

And if your way should really be followed, why did you deem the two
unlikely() in do_event_channel_op() and do_grant_table_op() okay?

>>>>> --- a/xen/common/compat/multicall.c
>>>>> +++ b/xen/common/compat/multicall.c
>>>>> @@ -5,7 +5,7 @@
>>>>>  EMIT_FILE;
>>>>> =20
>>>>>  #include <xen/types.h>
>>>>> -#include <xen/multicall.h>
>>>>> +#include <xen/hypercall.h>
>>>>>  #include <xen/trace.h>
>>>>> =20
>>>>>  #define COMPAT
>>>>> @@ -19,7 +19,6 @@ static inline void xlat_multicall_entry(struct mc_s=
tate *mcs)
>>>>>          mcs->compat_call.args[i] =3D mcs->call.args[i];
>>>>>  }
>>>>> =20
>>>>> -DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
>>>>>  #define multicall_entry      compat_multicall_entry
>>>>>  #define multicall_entry_t    multicall_entry_compat_t
>>>>>  #define do_multicall_call    compat_multicall_call
>>>> J=C3=BCrgen's patch doesn't have any change to this file, and I'm afra=
id I
>>>> also don't see how these adjustments are related here. The commit
>>>> message sadly also doesn't help ...
>>> The changes are very necessary to split it out of Juergen's series.
>>>
>>> Without the adjustment, the correction of compat_platform_op()'s guest
>>> handle type from void to compat_platform_op_t doesn't compile.
>> Interesting. That's quite far from obvious in this context, so clarifyin=
g
>> the purpose in the description would seem helpful.
>>
>> Coming back to the syncing with v3: Was this change the reason then why
>> you did drop my R-b?
>=20
> My porting of this patch is a non-trivial modification from Juergen's
> version, and not eligible to retain any tags.
>=20
> I thought I'd discussed this, but I appear to have missed it from both
> versions of the series.=C2=A0 Sorry.
>=20
> Either way.=C2=A0 It's exactly the same purpose as before, but modified t=
o
> compile in isolation.

I see. I'm under the impression though that parts were effectively
present elsewhere in J=C3=BCrgen's series. Perhaps it would have been easie=
r
if his series (at least up to the point to which you need it here)
would (long) have gone in already. What it looks to be blocked on are
two or three Arm acks and an x86 ack on patch 1 (which I've expressed
I'm not entirely happy about, and hence I'm not going to either ack or
nack it).

Jan


