Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C394C8CB9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281446.479780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2dv-0002nj-3S; Tue, 01 Mar 2022 13:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281446.479780; Tue, 01 Mar 2022 13:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2du-0002kp-Vf; Tue, 01 Mar 2022 13:34:18 +0000
Received: by outflank-mailman (input) for mailman id 281446;
 Tue, 01 Mar 2022 13:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP2du-0002kj-14
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:34:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a3f27dc-9964-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:34:16 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-mqzv5cn1N6yqZRKOEcfAzA-1; Tue, 01 Mar 2022 14:34:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM7PR04MB7061.eurprd04.prod.outlook.com (2603:10a6:20b:114::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 13:34:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:34:13 +0000
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
X-Inumbo-ID: 4a3f27dc-9964-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646141656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1AyWg0vwPItKSSz0+s8cP9t1+6GAd0LD25hIoGPo7w=;
	b=akQ5s24Lx7WYuerwDgFXC8daBDy117MiZCHWMeSviW5/uBYFSy9qnD++gN0LFcQWS1UUyU
	yOG8aChBZEjMmttXalWR0hXDlO7Dneunl+d1B2iavU0BmHPA86sx+WVVha2CLbqG3qCWHr
	04sRUXtHXcvz/43mQgAIDXjPjgLIs/o=
X-MC-Unique: mqzv5cn1N6yqZRKOEcfAzA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aePV97E8tc2RxVczVqwKFVsApN1okvUpt5ID1HyAP3fZnav5d2mtpeQra7Xiu6E1K7gWERYZd5BHItcoM+B3dZXR7YCyO5HSyj4XgTn+ziepCfIsZ7QRSRy4dK+3f8JPEXJ5VeYF9io27+hl+kX2+uw/7dwufeB6CMkPZtq9kxlz6d3Half20mWab7RA7ejiwXKksXMp4SHqjRcUfgHQHBQJORZ8qBGZRTCAH7j4IjRYiLtwSe8myXMRa2K0Tqz9za10SO5AUK6ZJoVXzxIsmoFnGfq4SNMIXJUBZKKiOys6wpxceBjMiOqAoALI8VXLLZqk+3diULai+9u70B+f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4ApPAC8cZm8fRq41lmYjfGFw5DqEZ5qWgmha3HlxGo=;
 b=AF0IcW32fTSwzbd0Fj4Ap1i6CyEA7zgmtsdFotDIiiRNLMLMNmP8hkIpBW2IoS3myboOFIJGsULQcRkDVdOg10x2mrqK9lMeC4QeaV0yFHC5RHtijXsnJos0bHUXDnquW1Gn+pIan/ceum93Zmu/khuuojxu+/EoHEoVb5bwIEzRP4Hm2n1y1jBBVvhVJLs2Qmzc3PveHciBRdYiJ2EZA8tuDNKG78Z+N8xU1Fg3iaSyA/FBTHURdBCqB/7Q9mrt9V6nY0oaDmqrRcKT80BTHuLk8xjZLsCyxMJYhwdZlY6AazcuqS4IUPsbyZKrWt4qsNXLR8CKH7m73Lv4TGf1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06452eab-653b-458a-048b-cc709151353a@suse.com>
Date: Tue, 1 Mar 2022 14:34:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/altcall: silence undue warning
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0e3594ff-c637-46f2-bc95-7a26b5471b86@suse.com>
 <40306bc7-f61c-d330-0ec7-d986e4711d88@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <40306bc7-f61c-d330-0ec7-d986e4711d88@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0070.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8294b98-c379-4f69-e660-08d9fb882ca4
X-MS-TrafficTypeDiagnostic: AM7PR04MB7061:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7061409972C2EC82B081D107B3029@AM7PR04MB7061.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fb8lPPWHgC2gxWvypA85/C4uTbPx8cs+39yt6i5PdFk6SBqSyqLixbDjRx1UWQSGbfGIWyZmtQNYviljOPLbsjMVcf9BXfHwyOqr2mePEchD2qWvTGccy3+KnT+XAfG+iOdgCODEFZ1ZFjyLyqZARV5jjj+zQSHgCzoUBkudmeYAgOsiqi5FQfH7wy+qsrkEvan9pNrVlC01dzRa+2VB2rqDkbV/CBhh+ZYc/Slz5fQzzOuky9X2DDrmT38iK9dWvXLgr9NAPF1uKeqc3ZIIWXwDfUlp59bHFS5vNwvg8RVUUgkjHQNzEPI1yXToE6+AyxmivOWn6U7VhRsMaNdPCzh4QqBR9gNTgxAvFSp4ccxcaQZ33qxQtXOwIO/a4on2F+qCsjYxU7mQR/pfoNhpv7thBGTCAouF97892jkQQOnawIdC76bQ3s6HOR4nJrlrV1yeVmvcBY8kChl9U1Qh2vthyfW5A340201VexDtCL2q+mbLpyg7fiFd3IeKRWDHFGi4N/2i5RjDN+S2iXpT4CsLDRB6j2aZWT4K65LTX5XL664gpQ+CXN/T4yJtK4K/XxwpTSHUJhBoes8VCCSr4j0B8QLBHlBuGu+5VTjs1+EdMDOM606+0MrsmGbSvVaqpGrzjgS6+FFDmrzuaQcZ1eBBtdg9Yljb7a3oaWc/pJ4TEVivUF/jusXK6+mMmG0R6FVjaGxK76sq+4iex9pCGvd+r70cQ/21ahSrBzjO66g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(31696002)(53546011)(2616005)(186003)(6486002)(66946007)(66556008)(508600001)(6512007)(86362001)(6506007)(316002)(6916009)(54906003)(38100700002)(83380400001)(8936002)(5660300002)(36756003)(31686004)(8676002)(4326008)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QylmcOEI0Zjj+sYx1ZZFYAyMNEGS5XlWHysaySX5PDjx7ZOKWEMu6UQhdFSz?=
 =?us-ascii?Q?XI/9ryw3PpWZmcOYrakIayz4luWANZf5AAqcWl9GKyq32x21sNUrqOAF2Asn?=
 =?us-ascii?Q?s3JUOtKYPvvmBONYLplr9feUU08wOGO3a4IdRs7HE+yoepinKjQuDF1Bq5vN?=
 =?us-ascii?Q?ICy2CPHMj+ICCGo08V2q5j/iB2xL7ne1Cde/d5dEqk7vysQUswE60elRwhvW?=
 =?us-ascii?Q?bcdUvccHeWl00fhNuTJFhZHOx85YjWrmG1FZSm5JwfDrYx9y7BwIW63ILd81?=
 =?us-ascii?Q?WjuGUTF20bMIgt/XcAIDl4mxwjZwRRzeAIMdB8p/dKqkNqB9zAvL9i4L3mlx?=
 =?us-ascii?Q?LzgmTNjSbhzN/iOGvHoaE+eULT8bj0Xn8p3kwK6U2xADdkT3d+Gl520yYWrS?=
 =?us-ascii?Q?1kBc6JLecnGyLVJfQMbAHWzpEP5kQMQ+Zqkzvame0i1X1yMVFZPdxA9hnbbO?=
 =?us-ascii?Q?4BiE4DjhfgiZhVD8MnigKanvXuqVZ9L7eeCVx2nuCT2BQWQB2EC5QWQBrX/v?=
 =?us-ascii?Q?NxNKGXQHHqcrnMHF52rXa1nLhLoum9rxwH4lTYz1K1ywQEC/7DYsw0xwKRnq?=
 =?us-ascii?Q?1Cn/tyvNqt14iUF4Q6hOWFIie4wNqgICtWfd8/hyoGFMC8qdWNkZz2iaRpkL?=
 =?us-ascii?Q?WiSdpfc4u6k9jqKihNlOfv+OcujcwKor5N+NtFrjQU/MADvep+jU5fNUijzp?=
 =?us-ascii?Q?6kyUSJhNHW14v/RZGb43QhGr6OOjP8agYWuo07aahCwBNzoMi6AOxOQUP/ow?=
 =?us-ascii?Q?7VAVy1V0ct2OOAHWmpjy7AltPVz822e2UyyD7LcQ5KHFk06i3Y4spVePGrXA?=
 =?us-ascii?Q?7yYpQbGOBexwdayucnhE7QH7BRPkeEq7b71HTiTQU4LSyhPYp4LHWWCovTAT?=
 =?us-ascii?Q?kJVy81m4GuFov3blxHXBF1wZ9F3EA/PbhJFLenNjQphcAj9hAG8ut5+r9g3E?=
 =?us-ascii?Q?jdo1S1xiLoAzcGAttXXOzjeDbChnZQf9e2PO6Fnj3ANP1fxAR4ScBZlf39Cd?=
 =?us-ascii?Q?a9E3aVYmzPyArzbaIvPJsD2oqwIjLXunInvQeTTGIYSMrZVm8ddhihyo2L8M?=
 =?us-ascii?Q?KNKwztYagvnRk9Wbw/OXPmMtI1WaKmI6JoersDCK9Mje2YK6MNS2plWED9g2?=
 =?us-ascii?Q?INwOCVR2siZJek23gy2HrFVTLfnm7tUbuUGU/OVMXG4hrJ5xcr4N51MiX8qa?=
 =?us-ascii?Q?GxoMQHGrXQ7aIzw05RAwQVZw/7w394lLZY+Vm3IPDEogZv4b0p4kpBAu5Kju?=
 =?us-ascii?Q?kBHKY0AzOm23vKkyehLfNhChW1a2BfCqzC1t7QqL+YiXEemMIF8FwWFUkqoO?=
 =?us-ascii?Q?QA1VXHJa/bbdyE2uNnbGrDEAP6kdyu5rpJD09izTSCjECY1G9MFSHXus4/tW?=
 =?us-ascii?Q?FvkEKAa+PANNWjUoXzKPeC2bbY28ch41vaINorNP+YqiP87UTf9WnfX8Qd9W?=
 =?us-ascii?Q?I+7mg3MUf6wLIysFRtIDjObPYRCyT74inWeXPu42j6W5PZhMuMRl2RxNJ13o?=
 =?us-ascii?Q?8pw9TAusjO+ZrEYJDHOmcvgBL1hkhJ0t6xqwDvU+J4kptTzBV0Mf7mx2gf1U?=
 =?us-ascii?Q?vy6/owJp1PVIn1bmLEfKQ9LFipejKlnh8jI2CkdDKVr3zgacwJ/0FEoEfkFQ?=
 =?us-ascii?Q?RhwnVt72VmLA6TNJC3bVSs4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8294b98-c379-4f69-e660-08d9fb882ca4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:34:13.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H40kgJ+gKrWehKTnylnE9EuK/lye1fRH+pc7PWUWzEKWEhHEvegjYG/MgN4HLDCv9GdvuftYYle2l4qJjibn/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7061

On 01.03.2022 13:48, Andrew Cooper wrote:
> On 01/03/2022 11:36, Jan Beulich wrote:
>> Suitable compiler options are passed only when the actual feature
>> (XEN_IBT) is enabled, not when merely the compiler capability was found
>> to be available.
>>
>> Fixes: 12e3410e071e ("x86/altcall: Check and optimise altcall targets")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Hmm yes.=C2=A0 This is fallout from separating CONFIG_HAS_CC_CET_IBT and
> CONFIG_XEN_IBT.
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> ---
>> Furthermore, is "Optimised away ..." really appropriate in what
>> 37ed5da851b8 ("x86/altcall: Optimise away endbr64 instruction where
>> possible") added? If this really was an optimization (rather than
>> hardening), shouldn't we purge ENDBR also when !cpu_has_xen_ibt, and
>> then ideally all of them? Whereas if this is mainly about hardening,
>> wouldn't the message better say "Purged" or "Clobbered"?
>=20
> I did have an RFC about this.=C2=A0 Turning ENDBR into NOP4 matters, on a
> CET-IBT-active system, to restrict the available options an attacker has
> when they have already managed to hijack a function pointer (i.e.
> already got a partial write gadget).
>=20
> From that point of view, it is hardening.

But then you don't say whether there's any optimization aspect here.
My question was really about the wording of that log message.

> The first version of this logic was trying to use UD1 in the same way as
> Linux does, to harden non-CET builds too, but that does depend on having
> objtool so all direct branches can have their targets updated to miss
> the UD1 instruction.

I think it would be possible (but likely cumbersome) to arrange for
this also without objtool.

> P.S. I'd still like to have "away %u of %u endbr64's".=C2=A0 It occurs to=
 me
> that now we have check-endbr64.sh, we could `wc -l` the $VALID file and
> re-link this back in, but then we couldn't check the final objects.

I was thinking about this wish of yours as well; I simply didn't know how
important you view it to have this information. Not being able to check
the final objects is not an issue: If the data is available after the 2nd
linking pass, contents of .text isn't going to change anymore. All
addresses are the same for the 2nd and 3rd linking passes. Hence if the
checking was inserted between these two passes, the value of interest
could be propagated suitably.

Jan


