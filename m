Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E35466040
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 10:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236404.410078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msiFG-000565-8c; Thu, 02 Dec 2021 09:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236404.410078; Thu, 02 Dec 2021 09:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msiFG-00053k-5N; Thu, 02 Dec 2021 09:19:14 +0000
Received: by outflank-mailman (input) for mailman id 236404;
 Thu, 02 Dec 2021 09:19:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msiFE-00053e-TH
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 09:19:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8df9d63-5350-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 10:19:11 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-XS68MOMaPEutv5_HswM4Dg-1; Thu, 02 Dec 2021 10:19:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 09:19:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 09:19:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:20b:f0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Thu, 2 Dec 2021 09:19:05 +0000
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
X-Inumbo-ID: e8df9d63-5350-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638436751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OXIdnLQ2xYyiV4KvIQxRgP+JHsO90gS6brmMhFPFcoI=;
	b=hCBLgNONkCpgddGUaPgK9ftCXCoAFab6Zc6iXpcsLPxHWYi6XqYCXoEC15j5QeUo/m5JF7
	ta0SyEnOrB9hpQoGTfp72+1VUkn+zCGCRq0OKc0ra6OdV8rnVck6FbLFP7vrj3k/W4dhqU
	wyQmIQrzT7TuYIDWeOUaphY8tn3M1C0=
X-MC-Unique: XS68MOMaPEutv5_HswM4Dg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFhdlEEwvlXldfCV7IuWc6aaufxfo59+S1Bwc5c3PGxeEP9BEwBrqEAvXKsXG0sbaoVUg3Zr2B2FKlHZKnGU1qQtBRS5y73Z+mkIguc1eISv8LA8GSCkVdFBrLyesNtjNstvVppvrBxWvu3LYkTpm9hoMZMrBSByIR3E+Y2DOfPxsNI26ywWr0jxUYvEMk5sHhz3FmSc5co9r6lqTSMWj7zQLzuboyqT/w+XeJPVPmBQ8aRj3a+7d3Mw8jsVcpxIEOabiTbTs1VhRgh53O9lygx7C3wUwxxmGK33s+74OOooymqT0ul3GvZVcMeHURTzorQYORh4c0euH6/b+5RE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n5PImIlT9tbs9yJ0pbbJF3BrhRvqpW0KMCJAPX0tWg=;
 b=lPN+4naCG54ZI9P5el9gyGy/ovB5eMsmg9i6OPOomfCPCmMHi3LGR8lvQq7nixafWczz0kabAEKtgqtZZezd2W/GOTaofmFZ1zsP6v/I9jSZduDB+IRvr69FJDY6yYOqU3PwSXI6NwCHt5Iso4JMc0l+DjDZpFTaPuTo8nMoC9wSSGslR315V03b+xlP0kTsDVcdS79j3/4CEh1D66YGAOWEgGff/IoM5k9dGgtfaMfjHDIt6WaAJ2JmsTMnYKbo9/6hsU6xomLKE0/uuBDVULbGfmUn9yN25LcvSAaOYC63LmdvOlzO0/H9VjKSt6ciQWxRvWaPzksOqwQNF+QUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b361ea84-2b4c-6f3f-5a25-11d1ad2bc5fc@suse.com>
Date: Thu, 2 Dec 2021 10:19:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] VT-d / x86: re-arrange cache syncing
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <e0819175-83b4-9489-8e4b-7be4940f1d54@suse.com>
 <2a448375-6f57-578f-6ac3-ba818d0c2eb3@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2a448375-6f57-578f-6ac3-ba818d0c2eb3@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57a52971-f96f-4f5a-b8e5-08d9b574ca47
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304C2C94E10A36921530572B3699@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mFpTd2GPq5TXT0r5nYp0cNwd2Kx0sqYtYonD10aC7v1KE07pT/d6J6BSyskCKCg45oy12xukL1c9Xz+W7ix5Dio8V7dcflkk5zIn+Xtfubf1uTeAvKfRAe3trXS9t3JZAFXRFxgLdaEx7hPnzOSEWfvvHlqDxkL+QrGAA8nyZO7jcdYmwZHQ3kvSViPors2PpqHgOmBIKrP/nq6XsdahuXJWhuPCAo4eqY4q7ooJEAdhwKjf514UPFd6grcHe8VSwTNvezSnDH2i4cJzLTqZTXUAnr/fkh1kM3ixW2oz57pXqhPv8v0m3H2XjoiP26PwZXq8vs5kIxsh9BRe8GskaUutE8sJzvv0mJ0c9V5LFoXznO9CHOARUBnpJdzu0F8pjeBSJVR3jLjeEXbw2jk1y2aK443JeFYzMiszkS64tVY09N25AhvAVt07l64tjyiIzdUp/jSZqfzBdlKoRwzTmz7xbDZIJroVYtYSYS5X+/EJ4NuN4bFouT4PTJ/wLtlVmUKh7wMlk93dF7hy+h7GMzcgmUq26628798D6UoxtdfmlQAQf7faqlJ++rH+g/uc5PByks6G+Jji0h4AgjAx5NiiAGVJNcLT7EAVv0rThcceogESvDXqwAFcJ4eSIlRWgo00b8ceSlng0xu6V9KV06gmR+NhYJk/mbpz1CJp94jnCJ1gdvT47cMgP1JsIv7tQ29oCoAg0XtsSTQ1anp4A4QVzt2dWYVNxGEBXZaIjiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(53546011)(8676002)(186003)(956004)(66476007)(16576012)(66556008)(316002)(2616005)(66946007)(36756003)(54906003)(38100700002)(31696002)(26005)(31686004)(4326008)(6486002)(5660300002)(83380400001)(86362001)(6916009)(508600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3CIkcig4/FebqSzKkFpTxRq//6ErFEYwrTXTXKAvePX7nDGIwisejvL2AMI1?=
 =?us-ascii?Q?UqSaU58zt85ns72x0/0i0quTJq8QNTmsmt89n0JpzXQ+EJ6ULWRmipkroEFx?=
 =?us-ascii?Q?VDgL51fc9YdxdcV/UM7f0fy4QoNn0bjyszkxzn7THvTPjZoFCTCpXm5wPeN8?=
 =?us-ascii?Q?uupEEOkE/8xIz72B7fX/j9adn2ZWBqxl9apiL008rCfPOkDNHDhcEeCOU79V?=
 =?us-ascii?Q?g0dQBvm1u/P37Z6v8RCc8ziWyoq9jaFeoe2f8iVPBvcyizFd45RyksCXkf4C?=
 =?us-ascii?Q?mzxKDuMX8Tz7t01trVZFqxQTpfv3AgaQm1aM2he7knppUAUmSKrEvItp2q22?=
 =?us-ascii?Q?4HLOKwNuNo4qtaG5AbkN/ClAjdA6QufROh89ATYVUTqmI90mIv65wg636juF?=
 =?us-ascii?Q?z3315/EaFzIZ9ybK/59tDel9xCmc7HRqiAMP/nt9pZWKWMS4ckKzM+eprMII?=
 =?us-ascii?Q?fLOiinNcogCcYYDM1xb90omQgo1GiQTnjyCxVmVTAaFhZtUo02Bjgd0ljVMT?=
 =?us-ascii?Q?DrSX72Hr/fk2Hel5twneFE585rxSDJPvK/8W1x863lOMYvoZ+ggqyjkp6Mew?=
 =?us-ascii?Q?RuojKdf0LvLpJJhGMoErEk7laOoNEFnPdoTEK/0N8CiptGHgL5Fxg+LpGCcM?=
 =?us-ascii?Q?zUd/l02TKum9/FncjBE/C8zaNkNS7bDdH6Jp0D4Ldhv5pTCAgCSur8d6qp/P?=
 =?us-ascii?Q?N+vsdEAxumPX0I5fAZ4M6Yh+QxyzF+io0l4AEfgDZXW0r0DPHrr0qoPv1/BM?=
 =?us-ascii?Q?YSH3pZHe3j9uC0TKk3EeZomXHJxX4NKwTjjy9JTKbSRGMh8KvfyROCtfsGQe?=
 =?us-ascii?Q?+33Yc/UwIWMuLLDF79y8k5wjHDmk+N7SimlvvdP/8Y6rhvTz4EHLY20EP0MO?=
 =?us-ascii?Q?pMl7qCq4MT9a8ftwW9OGnuT4dlHatylXWiFVgh5fdn3Js/TB+i+FrdtgetVY?=
 =?us-ascii?Q?GMlJvdSL6C85MkmtPkdbJufzcei7+anjNabzbkwpSykvHJ2WhKY/uWLcxMZo?=
 =?us-ascii?Q?cueZFLsHeGbKjXoPAHIEQNT6olyRlcGOav3gA0uDe4Dz86KAuyj8Xd1MErI6?=
 =?us-ascii?Q?TDWbnOCdTuXyJXlRzojQZr5dEiZr2YdWzNxob0dNA7tL8N+q4mMjy7pQm0E2?=
 =?us-ascii?Q?At7OiU1/IygdwFPg1f7dP0ZZLA7wWWuEcJUGMkRkTYeJs8UAB9YvWZ4YsJMt?=
 =?us-ascii?Q?z4WBKwlwLHAsp3IrYqBTfiNhpWbMhVqL/lMxTJLmfXK3GxXpuB+QNJwxw1gH?=
 =?us-ascii?Q?4VWHso/ATwr/y7Kx/1ffRRk3MHBTdAbFvBZLfFIWShYrSYEpfVDufLyFll/Q?=
 =?us-ascii?Q?yPHBJxXUFpl/44vtZ8ag45fpve3LbKcKgXKbv3dBGs7BMOJidEJGt7KyhJaP?=
 =?us-ascii?Q?dfN+qtZ2Dpa1PRTbZd40p84gXNiJS9PuiVzgePsKA5mqPd/4DG5XsjyxY9zo?=
 =?us-ascii?Q?gdTLm1pHisd6YDyo1kgNM7L5ZyxYxfVMwdfLBYa89N30WM2eYFMwxED4BDG7?=
 =?us-ascii?Q?O0yKBZAJyjtpVSMUo8j9cM3yxfnlpWxUlqZzVzrQJmwL61Pejy0xV3fyqs+u?=
 =?us-ascii?Q?3bSDC74IrW537CV1uzWLjaXEtGKRXiO85dyACgoeLRw35FOpgeWgSv/JBTDa?=
 =?us-ascii?Q?VWMqeFxClx8SW9+gSH2uQ1Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a52971-f96f-4f5a-b8e5-08d9b574ca47
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 09:19:06.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro9Xe79QDgP8IcoOaxwV5mklJk7Wyrpxw19edDDePmPFwbvgIhFDhCPqvjUD+S9Qmen/WI/jmq6SFhxdHrNWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 01.12.2021 15:39, Andrew Cooper wrote:
> On 01/12/2021 09:40, Jan Beulich wrote:
>> The actual function should always have lived in core x86 code; move it
>> there, replacing get_cache_line_size() by readily available (except very
>> early during boot; see the code comment) data.
>>
>> Drop the respective IOMMU hook, (re)introducing a respective boolean
>> instead. Replace a true and an almost open-coding instance of
>> iommu_sync_cache().
>=20
> Coherency (or not) is a per-IOMMU property, not a global platform
> property.=C2=A0 iGPU IOMMUs are very different to those the uncore, and
> there's no reason to presume that IOMMUs in the PCH would have the same
> properties as those in the uncore.
>=20
> Given how expensive sync_cache() is, we cannot afford to be using it for
> coherent IOMMUs in a mixed system.
>=20
> This wants to be a boolean in arch_iommu.

That's a valid consideration, but may not be as easy as it may seem on
the surface. Certainly not something I could promise to find time for
soon. And definitely separate from the specific change here.

>> ---
>> Placing the function next to flush_area_local() exposes a curious
>> asymmetry between the SFENCE placements: sync_cache() has it after the
>> flush, while flush_area_local() has it before it. I think the latter one
>> is misplaced.
>=20
> Wow this is a mess.
>=20
> First and foremost, AMD state that on pre-CLFLUSHOPT parts, CLFLUSH is
> unordered with ~anything (including SFENCE), and need bounding with
> MFENCE on both sides.=C2=A0 We definitely aren't doing this correctly rig=
ht now.
>=20
>=20
> AMD explicitly states that SFENCE drains the store and WC buffers (i.e.
> make stuff instantaneously globally visible).=C2=A0 Intel does not, and
> merely guarantees ordering.
>=20
> A leading SFENCE would only make sense if there were WC concerns, but
> both manuals say that the memory type doesn't matter, so I can't see a
> justification for it.
>=20
> What does matter, from the IOMMU's point of view, is that the line has
> been written back (or evicted on pre-CLWB parts) before the IOTLB
> invalidation occurs.=C2=A0 The invalidation will be a write to a differen=
t
> address, which is why the trailing SFENCE is necessary, as CLFLUSHOPT
> isn't ordered with respect to unaliasing writes.

IOW for the purposes of this change all is correct, and everything else
will require taking care of separately.

> On a more minor note, both Intel and AMD say that CLFLUSH* are permitted
> to target an execute-only code segment, so we need a fix in
> hvmemul_cache_op()'s use of hvmemul_virtual_to_linear(...,
> hvm_access_read, ...) which will currently #GP in this case.

Hmm, this specific case would seem to require to simply use hvm_access_none
(like hvmemul_tlb_op() already does), except for CLWB.

But then hvm_vcpu_virtual_to_linear() also doesn't look to handle
hvm_access_insn_fetch correctly for data segments. Changing of which would
in turn require to first audit all use sites, to make sure we don't break
anything.

I'll see about doing both.

>> --- a/xen/arch/x86/flushtlb.c
>> +++ b/xen/arch/x86/flushtlb.c
>> @@ -11,6 +11,7 @@
>>  #include <xen/sched.h>
>>  #include <xen/smp.h>
>>  #include <xen/softirq.h>
>> +#include <asm/cache.h>
>>  #include <asm/flushtlb.h>
>>  #include <asm/invpcid.h>
>>  #include <asm/nops.h>
>> @@ -265,6 +266,57 @@ unsigned int flush_area_local(const void
>>      return flags;
>>  }
>> =20
>> +void sync_cache(const void *addr, unsigned int size)
>=20
> Can we name this cache_writeback()?=C2=A0 sync is very generic, and it re=
ally
> doesn't want confusing cache_flush().

Oh, sure, can do. As long as you don't insist on also changing
iommu_sync_cache(): While purely mechanical, this would bloat the
patch by quite a bit.

Bottom line: This last item is the only change to the actual patch;
everything else will require further work yielding separate patches.

Jan


