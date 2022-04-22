Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000350B16C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 09:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310713.527645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnhE-0004wA-Ld; Fri, 22 Apr 2022 07:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310713.527645; Fri, 22 Apr 2022 07:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnhE-0004uJ-I7; Fri, 22 Apr 2022 07:27:16 +0000
Received: by outflank-mailman (input) for mailman id 310713;
 Fri, 22 Apr 2022 07:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhnhC-0004uD-Nt
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 07:27:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a9fa63-c20d-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 09:27:13 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-2Is5hBucOPCENRDt3XpBvQ-1; Fri, 22 Apr 2022 09:27:10 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 07:27:07 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:27:07 +0000
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
X-Inumbo-ID: a0a9fa63-c20d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650612432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=el4Ufmdp+XmvwbZ9wycrdfprh0xDhjlQOVswJzgLjHk=;
	b=iFtkSBwS727HwlPgVGqxiVBADatxT7XyV9pC8ux8QhzKxplhRjgspC5G4i+GFq+K2YyT1q
	1lrGMV9UG7JGQhbP0lP3N9+XNRWIgXJqBNmrmGvcsmynf+pfTM0XRQa3GVdgUrO2is8QMv
	R0D/iPFpQlSz5XVsJTcPafvxtUU9D1M=
X-MC-Unique: 2Is5hBucOPCENRDt3XpBvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0UKiZGL8qM69gus9pNiLeMIiY0JhpFw16Hdy98A/mgV+1IQodwYZuBrla8SjgwyuTy98MezwOJcqsMhcl4D+Ex6wMPdPIMFK8djhI2AOcZxh9PRuwcJ2/QPvOzwA8uJkwV971IfAYfDvQGpXgwHto35m5EcH3zY8t4L5BT8VHi0p8tYEMLYeb/gti5ha34jkCbpIxG/q43Ce1BlogS+zrr/CKQYI7idRmX69ip+VUY3q2nZRKFgA+HoH0N/nli/kJsJbpGslKEXB1Vjj92H3F1nSVSpVVo0doyCerToZuS8Vo0JfSrrgiohp594vK/OXYUUED0oXJipLpI4y7laVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrmLkCznumhuP0eFOrcZnX3e9fgH0jxpTDlPyTGPLhI=;
 b=U5NGyqLWdQkj3+mEoHD/n6Xbx3i37xps66u9N5HoItNC0vAzigCz/sQMAoJeE8Wn/v6ls4xfkx/3F+nqu6XolkoQjbzwRjPyxSSqM9PEdeWu6XisAGnXKJG/SxZdKDncsJLbJwsp8uirxo+AqIQ0aRljDRn/ji30W/HWS/jSIfe8gbs0HGKg+OPaWLrlzS4JEH6s+u53hVYiimvL1JN0S+egtJnqN8lpXP8sahRb0bghoJDxmZTGusN5uA311OmYItB0tbZSsyia7F6jyn/CPIXCaKFxOLgC/87s02L4u2ttTrkC0kjH1UdKK7ZLeB17rn+XI7dZipvRAXSDYDIiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <434a93ea-d311-a980-1efd-507937bc0010@suse.com>
Date: Fri, 22 Apr 2022 09:27:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/6] x86/debugger: Remove debugger_trap_entry()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-2-andrew.cooper3@citrix.com>
 <57858c7b-019a-2888-42ae-7ce9a7c88cc0@suse.com>
 <b32d8ab5-dcca-971c-39ed-032aba0dcea2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b32d8ab5-dcca-971c-39ed-032aba0dcea2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bdf61a1-448c-43bc-135d-08da243181d1
X-MS-TrafficTypeDiagnostic: GV1PR04MB9213:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB9213C36CC448E36D6B2A99A0B3F79@GV1PR04MB9213.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/xMLZfWcWhHtLQbg7UE59RcX/82k/nY28iyQYK+dzenQXRAZrR6GsbObpzvlt6nFDkXrQgtvZByroil72NMOiOyPFSmMZUwuRvfrF94fQnALNq6EjvByA/3cQSMUnuU75hrrClgpSlHjQDoxmXr/KMp+j1fIpExRcFUhMLahZsJwFPB9Y8CSiWzK+kPyBSFITiipx5K664VA5E92BGZYYhnLzhKwdxupwC1ybH/jseCLRjqohlyHtFAgZuXS7BsxXxVG4wSVrEbRVEJTNh9+E4yJadfmuHdO1NEK8VfreTXrr9tXmWAoAgcn2FmHelfNknsOEgx5+AmOpd5yDq/T/kcYEjP4rvgXYf7Zdg2M2eAUExs2R+Oq6O8JLrXegc72B99YXBkg5MVegg6kgXlA07bbcsb9twrxlQWee7KaHQwzpYsIlhGFc6EiuACKYW6k2Zzt56ipjvA0cc9R37CAjdayDHuxj7U8kbgHNkR9vB7pJ9PHGW4r5W9bUnRZx69WBw9f6DlH2XwslKs66L/VMyWemx9Hks21lnGWfDyAae3jTn0GqaigXggRRpjPrTquvvFFgXiLif2yYLblpZBBRCoF8Va5WzV9aWdAfp5mqTXUBBjLn6U/guEJIqp02rRxVyZ1FgFxkGKPNJe1ePj/ng6KDqL+2x6woPaoX37dO4VbELiZuzLCCyEq3C2s2zDP/rV+Hpd/IJKGqnPO91OdqtBtF1Z5IA5d8rxvebC4pkj7+yp4fVPP2TU4vHB3MCm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(8936002)(6506007)(86362001)(31696002)(66556008)(66946007)(4326008)(2906002)(53546011)(6512007)(8676002)(6486002)(31686004)(316002)(6916009)(54906003)(26005)(36756003)(186003)(2616005)(5660300002)(38100700002)(508600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Huv1dvtVYgbVGs3bY5mSwBARZAIoqdf3h4Kjm2Oom5px3YOQ5/GIQoGYwc4c?=
 =?us-ascii?Q?iM9IAhcGPN5RbUz4KfY+vNgnthDFuGpYxpOe3i3l2XRBmQS2KgAJqtB+7sK+?=
 =?us-ascii?Q?eELgQw2oBWZvDHPMdTJ7WvsJOSkSQIbnHLfbccdUxKbTCdWuP/dWKdqa1Qw+?=
 =?us-ascii?Q?SHazwXUa318R3bUglRzLEkaW2h2aTKh0WshqDFGwXa4k+YS8lz5Mi39pf5xT?=
 =?us-ascii?Q?6plWg5vJsIR6x7dABCDSoJX/Y8VujoHLuzk0SVuoeAXP2rrjgBmkAUI7MRl9?=
 =?us-ascii?Q?8isbxYzZHIc/huAXvLsQNXrw9EpgIu9ZaJPdzK7bydXAZGTQqaqMg+goApNv?=
 =?us-ascii?Q?IcswhLjZLuR9ckCBi3VJy/NqMJzIqkeDryDxfX9uwqppojfkIh6c3/Ns6UE7?=
 =?us-ascii?Q?dZxR4sVRRmUH8JiUoqyTxkjA27JsPn3cQGBjDajW5tpbHrY7biH5QTq3BUCh?=
 =?us-ascii?Q?u+UmHK2ow/AIGkWKDaNgGcelN0qLH3ERaWJ2tNPU4bzZeFpUgXLUlxWoGRT1?=
 =?us-ascii?Q?yWugGBvxjd9HNOSdVOxC4iI3tV/vC9XyiIeb4jZxnQ0JarRwPuxaXL/1d1Sl?=
 =?us-ascii?Q?rQyzPJSwsYToj1ldhUW1lSH3/FAkGwafeF8QNVSET56ZX2wCpCvKmVCnW+lp?=
 =?us-ascii?Q?GPXo81VN26mMEexkZZHU9g6OPKcqVATL08n9d7tN1TV9fC3DvlhH7Avsl+pY?=
 =?us-ascii?Q?QNGGEn9jmkugT5NcJl7trzV39CAiTdBWcwCMqdnjZVCcBL/1Fnv4PEqX2TWT?=
 =?us-ascii?Q?fvDh9MdPc8OaXS/5Eub9tE86aHhjd4etPxSwNHINIXpn/uzG2Pz4UyioIlxT?=
 =?us-ascii?Q?DkDYVQtY3LSKl16D7piufoVqYWex+Q8vfZO9BUSQbI2GFaDWjKsEC0eJJV1L?=
 =?us-ascii?Q?6lKYsz6t019IwDnBrOTXgiSSa9uWB3+uMGBkkjC2VV3HndNU4YjBOIcpB+Um?=
 =?us-ascii?Q?eTpVP48jBoMjFkTh6cvcpO+N2kGHsLwF989ApQnfYRRO26o895igGJzG6z+f?=
 =?us-ascii?Q?Cv2szLBW4g4ozoiszKA/zOMZrBLEfJT84KOloIf8VlYVG5DXsO82xjkvfgxq?=
 =?us-ascii?Q?S7cJTPLjBYkkmAVQu8s27r7di08plktUFePF6e3ccVN/8f083S59YtLjUNYC?=
 =?us-ascii?Q?1XMMevZ3MdD/eQb8z4ZO8CJGST9S2hmiEgH+1DL5kOHsNUiM8ZKH7GeS0QHc?=
 =?us-ascii?Q?2XT36cL9y5SxLyf4JXtVtuKPVmlA7tXZdQwucexfVF/XXEceht3a8qzePyme?=
 =?us-ascii?Q?+uIHi9gQtmtYFwxLgrjcJ+UuOuPBLnyIrRo+setMg1rEpepo9QHN1mEyrpX2?=
 =?us-ascii?Q?ZKQ/KZjY7iqTogrEwv5V0LKAE5ZjOyx593OYy6k8wxN8NXf1avcPZn7AF9ML?=
 =?us-ascii?Q?YAEpSoyPW08sSg3dI5ODklrDnetmiKQUzHV69Pf6buxU+VI/Cqst7YcZltDH?=
 =?us-ascii?Q?feAjBwOC/J9fXO2TEsmwDeVQJ9Z4NBFtf/iH0Mpey9+uhwSvlrIdFz+4TjS+?=
 =?us-ascii?Q?YF50HAh/ovTUoLgVI4hQbMyVj5J5Y8tO8lWds3DfYhXJ30vaHEJolfgME6VA?=
 =?us-ascii?Q?krZH4k1TKh1057I4BQdvzP+ejF8JB9r/sY5cr2vyznSAwfe7vLM1BvHdUe49?=
 =?us-ascii?Q?Hf6XqJoRRXJQ1iUBi4FqpDbSbw4nHZGAf6b/2icQvd+D2Y3K/j8VoND2u0wX?=
 =?us-ascii?Q?mtEsnZuuzhUSs1mKsDp9L7eK3kmVrvdE7Sg5FnJjJ0EjmlbwO4KfxAI080dn?=
 =?us-ascii?Q?9qVwApW13A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdf61a1-448c-43bc-135d-08da243181d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:27:07.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUiNbzc5FlU+NsJ4XB8GbtxwhrH+MB5QCO97PpVUYMKgiG4t/xdAeyvUXxJHy5P6ZiUl+3MJG1tN3nNFkIAzVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213

On 21.04.2022 19:23, Andrew Cooper wrote:
> On 21/04/2022 14:02, Jan Beulich wrote:
>> On 20.04.2022 16:13, Andrew Cooper wrote:
>>> From: Bobby Eshleman <bobby.eshleman@gmail.com>
>>>
>>> debugger_trap_entry() is unrelated to the other contents of debugger.h.=
  It is
>>> a no-op for everything other than #DB/#BP, and for those it invokes gue=
st
>>> debugging (CONFIG_GDBSX) not host debugging (CONFIG_CRASH_DEBUG).
>>>
>>> Furthermore, the description of how to use debugger_trap_entry() is at =
best,
>>> stale.  It is not called from all exception paths,
>> But on almost all (before this change) - the exception looks to be
>> #NM.
>>
>>> and because the developer
>>> is forced to modify Xen to perform debugging, editing debugger_trap_ent=
ry() is
>>> not the way one would efficiently go about diagnosing the problem.
>> Shouldn't it be the remote end to request which exceptions it wants
>> to be notified of? If so, removing the hook invocation isn't very
>> helpful.
>=20
> That's not part of the gdb remote protocol.
>=20
> In normal conditions, gdb gets to see see anything which manifests as a
> signal.=C2=A0 It does not get to see anything which is resolved by the ke=
rnel
> behind the scenes.=C2=A0 #NM you've already identified, and most #PF's wo=
uld
> count too.=C2=A0 Back in the 32bit days, Xen-induced #GP/#SS's for non-4G
> segments would count too.
>=20
> But in addition to filtering Xen's idea of "fixing up behind the
> scenes", you also need to Xen to understand when to skip notifications
> based on what a PV guest kernel can fix up, and this is getting even
> further out of gdb's comfort zone.
>=20
> debugger_trap_entry() is empty (WRT gdbstub) specifically because it's
> description is nonsense in any practical debugging scenario.=C2=A0 And le=
ts
> not start on the fact that the lack of ability to invoke
> pv_event_inject() means that any fault from userspace will livelock
> under debugging.
>=20
> Deleting it is absolutely the right way forward, because a theoretical
> future with someone wiring this up would have to start again from scratch=
.
>=20
> Not that qualifies as a good reason in isolation, do_trap() contains
> unreachable logic because the compiler can't figure out that #DB/#BP are
> handled via alternative paths, and the gdbsx logic is dead.

The patch description could certainly do with expanding some along these
lines.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


