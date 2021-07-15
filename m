Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0343CAC1C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 21:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156921.289532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m476x-0002e5-EC; Thu, 15 Jul 2021 19:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156921.289532; Thu, 15 Jul 2021 19:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m476x-0002bJ-B6; Thu, 15 Jul 2021 19:33:31 +0000
Received: by outflank-mailman (input) for mailman id 156921;
 Thu, 15 Jul 2021 19:33:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyhT=MH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m476v-0002bD-D5
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 19:33:29 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e57cf80-85dc-4e15-8755-925facf9102d;
 Thu, 15 Jul 2021 19:33:28 +0000 (UTC)
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
X-Inumbo-ID: 1e57cf80-85dc-4e15-8755-925facf9102d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626377608;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9rFNWFlj9QCaAFA4QvcqA9PtUhlyxU/r8Wn33ovdGGg=;
  b=DXouvCWOh10Y48Gw7Yn99nTy7srwWCRfzfkzquMu7Tzl8JiZeb2iyYQ0
   rQ1x4f3nhWZ/pzgVAWmx07wShc0J4D10boWwbXteJZygtwcE3j5if4fwT
   5xyk5zBukUqLu8MzGi4WnJSohJU6MPW9i9PUhDQYrX+b6g96EjEE+uA8S
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: vZn8hqhl/E9QGHRMgNeuP80zw3rvn79xR731YzRmJ3seh0e+RfLPDOPfM6Omhki0fwVd3hCNNc
 /XqpnPyUg9M56ZVX77kWZ4vxWOVbyJDJtaVSRSTnnTamOooL8mdh+exA5OdnsNrt0RmzIlH4iI
 9M7LOffOsXxE/gCV1zXv73bCpsZRD0FyFVukCj0N2QiNQJMKVCft5v+WWSPuYZCyx4bJg5B0E2
 H4P3CRIrtVdn+63yeGrk7c+2xXpCN0WWpHoxwbBSVxaBOaj4eXEy/hrkYW8xilunsB/WRCazAf
 DTo=
X-SBRS: 5.1
X-MesageID: 48440665
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mkAsDaELqXqoqCcSpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.84,243,1620705600"; 
   d="scan'208";a="48440665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j21eh2TZpxqOzNF137ZqjS+msuYfDLDSiVCyI0qbBeWXcaUS1YyxPuogsdfUTnRFldG3HbRysJgwevMdtPX7yU+ZDVsqXhT0jseBJsvAsvtZBOZdRYmfCCjXIUmA2IGesyglCdt4vPdZioDj3BEs+OUKzHb0DCE4dGQwInZgRIR716vUVXYqGvTNBF55VVWARs59gYLNdOGCLn3hsZt7fUzZucsEctvcPSgV3HQm71wSa62Gzv5bqdV+ELMuZoqA10DsLUCF3/Q1JT9LkH9CS1NCKtFgsOCyG6pwF4zCTRgs0F+bTquPLhcXf40AG3vU9T0BiALIFg7sQQgRwohtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pw9MWLCvrlHTL+avR4APXUKKGaKcOwj4dGl7QwaOYVI=;
 b=n8M+PXlMJD967tgqYAsprnuloOhE3oelwfWfpq/mLfC0AS3Ov81yE8GpvyYJj73BnMObw22qxOx9BVnoxWj5dLE6xrs/Gbn/Vc/0RCVgPhgyB/qO/rxF60n6Up7UBDigu0wSyLEgLAp5/HscgGhRhHyoYRre/AqRIGlYF4PXlkJo5HgUTvX4GiTgdwIWbPsQEbjBEGfNXuMkAKlmjWoWYjONyzug/5ZTfn0ZmU8sLdo7lvNw85kSnHcny/7D23gx4myWiHcFFrZvffgrrPGoVr1iqjOBtHg5eP0O3dPKO1TNjLmApq8mCpmOmWdsIBPcjV0KTDDkoOpy4rPfVTz5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pw9MWLCvrlHTL+avR4APXUKKGaKcOwj4dGl7QwaOYVI=;
 b=g7kvaYAPLq/8+Wtrr0sFACi1/jluVnLbrUg94fXQlzyugsWSH1cuN33bXKfDNWuvIn8QXtqc58Guc3ELnro2gbWRfCM7lqV3xWOpUOjd6+JTmCGRKCfni4N9xzZYOqVOh6oq26dXaIir1e9nzX2O9nSjmnmS/fzXUKPQch6Q0Gk=
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/4] Remove unconditional arch dependency on
 asm/debugger.h
Message-ID: <cda514c2-bc6a-ee18-3de8-706c705bc902@citrix.com>
Date: Thu, 15 Jul 2021 20:33:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <cover.1626286772.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0479.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca88646f-c509-478a-64b4-08d947c76803
X-MS-TrafficTypeDiagnostic: BYAPR03MB4613:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4613855C76F9CDBAE959E697BA129@BYAPR03MB4613.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyd0eEW8JYM40SQFbAhmERxyOcEWcqKgQdRU69S7rWbrAkK85wTt5DJV97JTau2ICs6i8e81FM4+xSecV9zsl+RA1x0CAptdzoMibQjFNQKX1U8hQZw/Kw9MseupAuIaVTNBbCMJvYBYQAVel9Jla5vOQ8hEzxg3UKbWn0qnfHqnFOiYZ7JwkecwKwyFCaoBVBBfbkjxUyzIsP6V5FGD+QE7kcjgKlzp1LVVER3nolKJE4LD99CCSTl6weXsBAZ+hsI75rVQpizBbPjI+/UEoETNbDMNT3DL8yopcIVP8+g2TSYvlYkexZcjs6HZimeBwnOnOZGu6Z+rGQaegQ1FjbJZK9KU40/1/dFTvwbV1tcjUnFjiEM7n/ICZkzcbDymno6qETKJaDWqgj6BSxTZ/17zEeQRbiuffK2ZNm4ZQ8A8Urr/1KwF5p26m9V2NAt29dQtlSYiAC4cfn6EJq6AytmipmrxgHdAnMMefaXdzDJsMqjLUDDil6CSYgLXoSqmot9XTXyhCk+FxJFJV8NKCuxrBpF+xnF8peqLCfHLh2/R+y17hXDwZwbeF3tnxENfF2jrq5u1GM8nPCozeiDQuZYZEFW408lqmGdGKw5Vw0KACmoKKlBKDmDJs3f1+qfH7g4e7IObvDv7glVFDwBfrPKjIkhtV6/wrEAG9o8lOf6QcWj6egBq4yA6x/c60MfkYZ6OjDeSo6/Of2uizMSwvkRCiGacmXtt162MHWnD4zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(4326008)(316002)(186003)(8936002)(66946007)(26005)(66476007)(2906002)(16576012)(38100700002)(478600001)(54906003)(66556008)(36756003)(956004)(6486002)(31686004)(2616005)(8676002)(7416002)(31696002)(53546011)(86362001)(5660300002)(6666004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDV3RkNFMWN3U2owTldrWTg0d3F5cml1aU1TNG51MzRkeHRzY3N4Umxyd3k4?=
 =?utf-8?B?Uzl2azh5ajVYTXpJdkxtZ1Q2Q2ZlTWVkWDQrMGJESWFFcGtneENuTGJsbzR2?=
 =?utf-8?B?ZVF5ZHIxQkRUSnlJUUFuYlQrRS9OdEdDcWV3SFpmK3dBY1NrSTZzaEVlS0N4?=
 =?utf-8?B?QlBlbDBMb3hYR1hQc1NCRHMwZ1ovb083UktaWWpKcXpDUTdQbVdDejd1Zm5X?=
 =?utf-8?B?QkN3d2tudXdaSTJObHU3Z0tUcEhpdGhuK3BNRUhySDV4cUp5VHB1N2RaZE5L?=
 =?utf-8?B?eXFURWxNT3NCM1NwaEs0RDRZcVdrUEsvcUF4RjAva1h0ZjFHOW1ZcnUzeVRU?=
 =?utf-8?B?SDIzN3JPcGVSL2poRTVXT0lFMVpGZWNFa3BsbWljREJuVTFhdDVUTDNDbUhG?=
 =?utf-8?B?RERYWVpZR2JIc2UvRllpUTZKcUQ5UmJ6WlZ2eVI0b1MyWTd4cWRFK2Rha1p0?=
 =?utf-8?B?VUdzRVhKNktlaHdLVzhIdlFMMCtvOTA4YW82QS82MXRwVlZqQTM3bkw4ZzFB?=
 =?utf-8?B?Sk9lRDBCTFVteFRwbDZqV0JjME81ZUR2UWRaTFRTMnZOTnMrSDVGWEswdzM4?=
 =?utf-8?B?V3BiK2RUcFpBVFFEdk1YQlZLWDRmUXVSL3lYYTI3U3M4UjkxNFUxb3NFdGJD?=
 =?utf-8?B?K2IyZDQ2Ni9Rc0M1UDRZRUJVRkxrSzFOSGdxV3g4SkE5UHZJV0k2K21OUkpv?=
 =?utf-8?B?anhIby9ENjk4anY0bmd0N3ZWcERCMmwvQnpNTkx4djhoc3luSEQrb2pVam94?=
 =?utf-8?B?NTlpQk9jcDRQczNDUU9jcEVLZklSL21odzNjQzJlYm40Y1RDMDVoWmdkeWhr?=
 =?utf-8?B?d1JPYno5ZHVLVHdySlZnSjNjSmx3WWUvbHorNDNuakJFTVg4OGxMUC94NVNP?=
 =?utf-8?B?QUxzb3BmN1ZCbWg2S0hnSWtxTkNGS3hVZzYvTHdnWHVabThtZ0lseGVaSzJH?=
 =?utf-8?B?Nk5xejZWOUtCMGNNU3ZmTlljd0lGcW5LQUtZSEdlM0JuUGJzQ0t4M0MvTXZn?=
 =?utf-8?B?WUNRMW0rWmZjUzJ0dGEzSnUrNmlKWEF2MldtZGgzRmkxVjlrRmhRUnJvRFJL?=
 =?utf-8?B?NHJpNVFGMEQ5UkdyaFdORFFGQWpVU0J5azY0VkNPSVJCdXVvTVZBQ0s3VVJs?=
 =?utf-8?B?VDBlOVJZTVpiVjFxanh2S2FBSFRKcmM5K0h6aTIwMEdZcmxnQjhxOC9mdmZ1?=
 =?utf-8?B?QlJ2ZWdEN3dIb0FxdDE5UHhnT0hJU1VFZGxLR3U4eXRTQ0FEOGQvaThkd2RN?=
 =?utf-8?B?dEdxOGhSVWZXUnJtY2FhKzF1ekVIOVFDTGZPbTRyTkd5MlBpL0JHbUlBdmhT?=
 =?utf-8?B?WHA2ZlBSNVJocEYyOHpmTEdmRVVNT3FWSTFOZWwyOG1wSGN4VjlkZUdpR0py?=
 =?utf-8?B?b2NWNGFVdm82QlNXZWVuaXVGbFM4RDB0cUord21tZGFnTThJeU1IMXlzWkRW?=
 =?utf-8?B?UDRjNFRraU1pb0ZyZDhFMFFYNnZRQnI1YkdEUVJIdS9iMzBsdXc0SDFSMWNS?=
 =?utf-8?B?NXI0SnpFVHU5VEkxN3FodTlPazNqbWhaeWZYRFZHdGtJNUpTV3ZCVGJIdytk?=
 =?utf-8?B?ZHMyMUtsTmFaWkFOWUlkTllIVUZRK1kvZDJuOUdtMkRhaGUwVDVJNGFJclRW?=
 =?utf-8?B?d2tDRFNKOGxBMEVzK0JVZS8rOXIzM1dnbm9EYW9ueEQzT25nOCtHL29MWFdU?=
 =?utf-8?B?M3FMeUsvYXM1UnFYSXFpdmh3Zm1SQ1NwS1ByNUU1WkREQlV6NjhCdHg4QmJX?=
 =?utf-8?Q?VPGtD181H0xfxw9aBJhHE+nEq4sx28kEMsg4VVf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca88646f-c509-478a-64b4-08d947c76803
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 19:33:22.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXP50Sf1EIOTV9C3gZQ4V0bLbBtsWGsyd9nkrJ0OK0ppyYLXiUhcJszWwhw59W818s1YfJuW+gIRZkesZYRbLKb1gKPt4hK9nxHtsBWuzw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4613
X-OriginatorOrg: citrix.com

On 14/07/2021 21:37, Bobby Eshleman wrote:
> Currently, any architecture wishing to use common/ is likely
> to be required to implement the functions found in "asm/debugger.h".
> Some architectures, however, do not have an actual use for these
> functions and so are forced to implement stubs.  This patch does the
> following:
>
> * Supplies common stubs if !CONFIG_CRASH_DEBUG for any architecture,
>   removing the need for all new architectures to have "asm/debugger.h".
> * Moves parts of the x86 implementation to "arch/x86/debugger.c".
> * Removes the ARM calls to its stubs.
> * Centralizes non-inlined x86 code conditionally compiled by CONFIG_CRASH=
_DEBUG
>   into arch/x86/debugger.c, which is now conditionally built for
>   CONFIG_CRASH_DEBUG via Kbuild (i.e., obj-$(CONFIG_CRASH_DEBUG)).
> * Tries to improve the x86 implementation by not inlining large
>   functions (but preserving inlining for those that seemed "small").

My replies from yesterday appear to have got lost.=C2=A0 Lets try it again.=
=C2=A0
Jan already picked up on the header file and commit change in patch 1.

However, patch 2 actually demonstrates a massive confusion which exists
in the x86 code.=C2=A0 We have two things called debugger, which are
unrelated, but mixed in asm-x86/debugger.h

There is gdbstub itself, which is an implementation of the gdb remote
debugging protocol over serial.=C2=A0 (I've never seen anyone use this in a
decade, and the logic isn't remotely SMP-safe at all, so I'm very
tempted to suggest ripping it out completely, but lets ignore that for now)=
.

Then we have debugger_trap_*() which claims to be arch-neutral wrappers
to a common debugging interface, which is only actually backed by
gdbstub in x86.=C2=A0 Both of these facilities are to do with debugging Xen
itself when Xen crashes.


Then there is gdbsx which is totally unrelated to the above, and is a
daemon in dom0 to translate the gdb remote protocol into a set of
hypercalls to perform on a guest under test.=C2=A0
domain_pause_for_debugger() is gdbsx functionality, and nothing to do
with Xen crashing.

On top of that, debugger_trap_entry() is actually a layering violation
merging the two.

Therefore, I recommend the following, in this order:

1) Patch emptying debugger_trap_entry() and expanding the contents
inline in do_int3/debug().=C2=A0 Both already have an if ( !guest_mode() )
path, so add an else if ( ... ) clause.=C2=A0 This supersedes patch 3.=C2=
=A0
(Also, fix the logic to have "const struct vcpu *curr =3D current" and
avoid the opencoded use of current lower down).

curr->arch.gdbsx_vcpu_event only being set for TRAP_int3 looks totally
bogus (the non-int3 paths cause gdbsx to miss notifications), but is
repeated all across Xen.=C2=A0 Keep the logic unchanged across the move, an=
d
leave fixing gdbsx bugs to some future point.

2) Patch (or patches) renaming arch/x86/debug.c to arch/x86/gdbsx.c, and
add a new include/asm-x86/gdbsx.h.

domain_pause_for_debugger() wants moving (prototype and definition)
which subsumes patch 4, and deletes domain.c's include of debugger.h

domctl.s ifdef'd gdbsx_guest_mem_io() wants moving too, as it has one
caller, and is the sole caller of dbg_rw_mem().=C2=A0 The two functions
likely want merging so we don't just have a wrapper making trivial API
change.=C2=A0 This will also require some header file renames.

With this done, there is now a properly split between the
actually-CONFIG_GDBSX stuff and the actually-CONFIG_DEBUG_CRASH stuff.

3) What is currently patch 1 wants to be next, taking with it the header
file rename from patch 2.

4) Finally, the remanent of patch 2.=C2=A0 The CONFIG_CRASH_DEBUG
implementation is now just the gdbstub call in _fatal(), so I don't
think a new debugger.c file is necessary.


Hopefully this all makes sense.

~Andrew


