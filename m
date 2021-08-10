Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4C3E55EB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 10:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165307.302111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNT6-0003X5-Iu; Tue, 10 Aug 2021 08:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165307.302111; Tue, 10 Aug 2021 08:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNT6-0003VH-FS; Tue, 10 Aug 2021 08:50:40 +0000
Received: by outflank-mailman (input) for mailman id 165307;
 Tue, 10 Aug 2021 08:50:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDNT4-0003VB-Pa
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 08:50:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed6d67d8-5d7f-4e5d-986d-a15835cea009;
 Tue, 10 Aug 2021 08:50:37 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-U8oL2d8JO2KQApmhx4wv_A-1;
 Tue, 10 Aug 2021 10:50:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5469.eurprd04.prod.outlook.com (2603:10a6:803:cf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Tue, 10 Aug
 2021 08:50:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 08:50:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0063.eurprd07.prod.outlook.com (2603:10a6:207:4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Tue, 10 Aug 2021 08:50:34 +0000
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
X-Inumbo-ID: ed6d67d8-5d7f-4e5d-986d-a15835cea009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628585436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LA5vc7AKnxr2j5Yli3XxgFfd7eZWXXgh79223SoGstg=;
	b=LIFm6mw97HW9oc63QI0jDeLMyzmEv6y7zXhdDFZAoryrunEE7Ru1mPCa/CpzgT5JVJTIwj
	qfoi/+aOZpiJMGPjYzgIOzgK6dOgcVSeTSEUxpeHBwKP30D+hGXCypw9B2+Vo+dXeywhJA
	anRFiBQtugXV88Cu8MW6uUA6HmagVpE=
X-MC-Unique: U8oL2d8JO2KQApmhx4wv_A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0meJsFzscdbhDu/Z8FZo0geykCh0uBgUaITgeElcGuVZBR7Y5vrXGEjZ27iz545/wUK5KkevyXKSKmYvkIlaG3RK2duEKDnSliCwOUiOuZv7Vt/FIG5kpEP6e5byJFMBZdvEB5xLiTMsw6RDXUqcxNpFYaJacphOhUvblF6hvx/92X+S75ldhm7WPepSbFzz7sTJofIbBvpugOX2bTNQPTvV1Ix9esdnEkcQCdBHIWt/A6wGFERKnglWXx1AQxWl+31V69Ka8cU5puu15AEaLBDmHCZOrmo2XBYbBulmAeFFRxCWFqZhthlF3c4LHSl17wG06ivL53axMnUkXXq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cX/OdxhS05KxFemItL4i8M3ZAAsY9eNexcSZe8RO6a8=;
 b=QdM2/BjJQZyjRKq4fh9JioVa5I1a4HjV4CjecQghOtoPjdIjtCFmfMCZOS3gm9V1DM2f3fmPOVRjBCaCpAL7LuOK28W2iHZXmi83b6Khu9UtVNiaLf6kq8DZUaAXVDMt/lWnJfccoFrzAYWqt58G3npq8jhiWBQOI+5Pe6ws1IL4ELE1PvTohAbowLiT9PghmEcNFPbLe6EEELK+new8PbcX27pL3JL8D6r13gA3hKxQGq3GMZy0/q92FCL38Hf0Czu8/AXR/yrvic2gyFocm129oN9L/C8F2BG/JmpPBoXsabKwOK7wBJLsYNZGmtCuo4JgEBev9Hu9S5FtSK75mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86: work around build issue with GNU ld 2.37
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
 <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
 <28bc0732-9c20-c670-4485-8b39bc595eff@suse.com>
 <b310f267-c478-15b7-7e1d-19a650d0a891@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee086e0a-f0c7-51c1-5be2-0610b6c78628@suse.com>
Date: Tue, 10 Aug 2021 10:50:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <b310f267-c478-15b7-7e1d-19a650d0a891@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM3PR07CA0063.eurprd07.prod.outlook.com
 (2603:10a6:207:4::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8fa1e85-23b3-423e-955d-08d95bdbeabf
X-MS-TrafficTypeDiagnostic: VI1PR04MB5469:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5469DFD176DC2DECC819D291B3F79@VI1PR04MB5469.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/F7UpIdTREbi1QeKj9crYPPTv6qrvqe5ZX4ikwn0a0cYH2bGjx8IuTAGeOxK5YZYRfhxqHb2SPyPgVKQWJ3OGSZ+o6IN4Gyle7v0rBD8FtGZt5EyjhHne3XjAb8yKMc1yXErLLH7xab3nO03dFsxLpID6/cxgMH4IlZTZK4+mz7ykvbvuySKDrbf6l6ENY4MgwY6VDEtgzYy0EM4W+znrIqDESDG5vDTmpX+HZJucE3OckaNdaXuLHCrhbu6us9jHdSUWAZhc4i+0ABE1SGjl0Om6CNupQwKdzNYP8/7sp6ACxmpo8f1PB4cHa26YYxq9RFe6tfQ0KRP0/28TCC2jJZzigXTonxb4CQVJsgXpHwjrmB+3p/qGWIjsQImLK5OYKsoO6BpzmvcQZ26DFZvLhOER11fi40u5fWynUGtjTD3knKuS81kPFsTTWaHFEtz5nZvCUdGKpVCTiuSq00BG95tMn8Aj1dO7y/78FSa94zez8o1rX/39HxiDBk7UMOFOTL7PUQ4GIOEue4H0tgjP2qzuxwLyKa4FfPGUo9fy/9hPC+AJpc8OEHlkOgeIldbsbeX4EUHwbzJk7QBWzek/CvWiRsc2MUoDG2aQ1csmRE6T+rFTDq3JlR/2qZIhWiU7RSn3q2vaEZVeFjq18G4PGu6HsnKq1p3RHGyC/6Wfn2bRuEr8y5jq1Mb4okVmbhfd5iYX3nElps7uN1EGaLta02kSnMdzBIw6iNTTrMH+yv6tdr1uy0TITwQPOozMeibtGC+3Q5eJva1Du/4hRDVNY/Cs+XrYoKa9VSwqo8ve3ZPNDqxTNOyu1oCorWKaVwc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(478600001)(4326008)(8676002)(8936002)(66476007)(26005)(66556008)(66946007)(86362001)(2906002)(31696002)(186003)(966005)(31686004)(83380400001)(36756003)(53546011)(5660300002)(6916009)(2616005)(956004)(54906003)(38100700002)(6486002)(316002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Db4ooXmsks4bV7Zbahdodm0ywfVNtBizTy9haSdLKlciGw9s4OVwHhVL7cN+?=
 =?us-ascii?Q?PxkDB5Nt+6Mj01Xys0DvnDkms4ckRaxg6/Tc8J/olK7EzGDvb8tYDq99li1v?=
 =?us-ascii?Q?DRHCcq7MimBT9Dj/7bFt9sxtUt9d4LG1fMOuPbc+yugosIUZncTssJo3IQJc?=
 =?us-ascii?Q?vYmE2uJpqOVRupucPQUARKT1s1DuPXR9QXpwijC9AeABbBzQGBMnRwf+CDol?=
 =?us-ascii?Q?Er8Oz3HZDWzy72ZYwmUkSpcUdL0YTTGV8IizInmrqSfZbLyNI5kmGr1jnT7X?=
 =?us-ascii?Q?y8OYQQBWnshENF5hW4LSQHdqHqo94Gpazg4MF9sp6jVbcNfgZQ3d+mhgpnUH?=
 =?us-ascii?Q?XkfTF8x+KXi+fIZ/qAUBhb+awpHcHLzKJnkOlMtMPBCLOAVWwtGwnWFEj1ip?=
 =?us-ascii?Q?bltmAyz2GOYEU63idNcXFjFgR7MUEQ2gJ+bQk1tlO9VXWYM6uMFWPMVi6iwd?=
 =?us-ascii?Q?RrqIsgWnDLodaGHqo+IJbfpcEXazpWbIT9IJG9qTHjhKngpdyBv4iNwm9cAD?=
 =?us-ascii?Q?M/cv/S9IZtzooIj23z0qySqUsvYtrDOvsGpKXesd2jaT0xaYEcNBGdcJDos4?=
 =?us-ascii?Q?uK4y6aaPdjlh/5fHbY40Hck4AgTAtOmBr2KEGO6/uhjAmRDZuQF6HvAETxD1?=
 =?us-ascii?Q?IbQfJoxZjN8yz/Qm7sC85wdsgAWlQXmqK+Awoa2C9GabsuwXUp4bOL7VgQs/?=
 =?us-ascii?Q?GRTPMlZj5cb5q7AIYWFwHf0cra2s9DU6Yr0m6DdsU/lNKdV8eX09DlXF3OKx?=
 =?us-ascii?Q?UWzAAFwOQ1TWn+HzWLf4Jn26QA/ZnJDBLNNk/3TlkWVoFjZqCXnjhhcTggBp?=
 =?us-ascii?Q?HZnOM5o+PYmAvxFRy6BdrY5rqkWVjRCZuHey8KMDs+ygsL447gv8R2yiUYD3?=
 =?us-ascii?Q?bYI/IZ1NeToDBtoyCJHLwoVRDNL26nqHDpo3/J8u9rm9ZHSQk4UFqNYnO/Fz?=
 =?us-ascii?Q?lIuHoFLhiSd5WfXS7n8FEPCKqYAOB8/6YhXFuUJkmB2O9Uv724P88+Z83K2R?=
 =?us-ascii?Q?+M80YBxos5U42JEU5whZTRnDYLd0ExbggkCcL4BvND4Qi+o4kt0sL7yY9MXn?=
 =?us-ascii?Q?qyRo/5Da1XO6QKoesrteLdHhumJct+FU5cNhiaRqSgh8Fw7M959ETl4iUYCV?=
 =?us-ascii?Q?aKS7vBkq8lf357if8d/v0EyKttS+yuSw4g9hsLtD3Og8mZpv0BY5JCEmoYLO?=
 =?us-ascii?Q?mTNuiWcEk9D4J1BXpC+wa7xOxaMNizM2Vlka0q0JmhBaZ8t6ofXpnJ8iKDRo?=
 =?us-ascii?Q?ZfEXy835F16ZpnxnfLEMqGnMuAorTWJPxUo6iWldap0GpKfzVFjGKrX4TmVX?=
 =?us-ascii?Q?DoUJ2k/9fSmFvrc0TtT2elqx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8fa1e85-23b3-423e-955d-08d95bdbeabf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 08:50:34.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBBLPurt9ZeoJh5fNjeRB9t3HjLoFyh7+gHjA+eY3nCCAhxi6EjVSCmJq60WZpNBBm5SsB2ktu+qQmfO5LqWRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5469

On 10.08.2021 10:33, Andrew Cooper wrote:
> On 03/08/2021 07:37, Jan Beulich wrote:
>> On 27.07.2021 14:33, Andrew Cooper wrote:
>>> On 22/07/2021 10:20, Jan Beulich wrote:
>>>> I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
>>>> which broke the hypervisor build, by no longer accepting section names
>>>> with a dash in them inside ADDR() (and perhaps other script directives
>>>> expecting just a section name, not an expression): .note.gnu.build-id
>>>> is such a section.
>>> Are binutils going to fix their testing to reduce the number of serious
>>> regressions they're releasing?
>> To be honest - I simply don't know.
>>
>>>> Quoting all section names passed to ADDR() via DECL_SECTION() works
>>>> around the regression.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> I guess we've got no choice.=C2=A0 Acked-by: Andrew Cooper
>>> <andrew.cooper3@citrix.com>
>> Thanks. I see you've committed this already.
>=20
> Actually, it unilaterally breaks FreeBSD builds:=C2=A0
> https://cirrus-ci.com/task/5417332467040256
>=20
> I'm not sure why my build tests didn't notice, but obviously this patch
> isn't a workable option.

I'm confused: Is the tool called "ld" there something that's not only not
GNU ld, but not even compatible with GNU ld? (Iirc clang's linker is named
differently. Or maybe that's just on Linux? In any event I've just checked
with clang5 [on Linux], and the build worked fine there. But this looks to
be using GNU ld irrespective of the compiler choice, and I also don't seem
to have anything named "llvm-ld" on that system, despite there being a lot
of other "llvm-*".)

Jan


