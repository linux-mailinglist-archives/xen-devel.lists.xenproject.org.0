Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DA3EB678
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 16:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166813.304494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXju-0000s8-9s; Fri, 13 Aug 2021 14:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166813.304494; Fri, 13 Aug 2021 14:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEXju-0000qA-6n; Fri, 13 Aug 2021 14:00:50 +0000
Received: by outflank-mailman (input) for mailman id 166813;
 Fri, 13 Aug 2021 14:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ewIu=NE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mEXjs-0000q4-RV
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 14:00:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbcbded8-fc3e-11eb-a2b0-12813bfff9fa;
 Fri, 13 Aug 2021 14:00:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-nYeJ2EI4PcqKH9B0Sni7tQ-1; Fri, 13 Aug 2021 16:00:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 14:00:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 14:00:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 14:00:42 +0000
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
X-Inumbo-ID: dbcbded8-fc3e-11eb-a2b0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628863246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEOW0kWsmOUnWbQAIRKotlauaCHcBX1jh8PqMUdhEfI=;
	b=kajEkYlz6mo2/b0JXFYU45OvbbOfl8C7k10IzNB1lqJz0E9ZZvFGDl2YjQ9wIeXEMJ2dvw
	PtUfJKtT2Wzm+iTZrSclUyGJkkdn2ySwrp28LWOKIguF8EBAntcCFuRTpZqj/M+oBrZXxF
	1xGzbPj1LdTcxsOuT2R4dNOJQViTlEo=
X-MC-Unique: nYeJ2EI4PcqKH9B0Sni7tQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8WKAaesP/+38guImEMtuU3F9eRRuKTIyLxOdR1lrNDbuQ3relZYFDkbeWH8WPk0AH+potXqgzFIlDQErYRn3HSqr6xAG3d/F9VyDXymlz3MhLx6iGyBJwiCQjmxDXNbyv95+tLOhzb9xy2gbHACxwR73K4VpTANLjkDdziWCoJ9v+BapBvAOtU4zundZQYQrPzENS5/U3Ow8kng7BBShneFVHRj4J7550hd6mdG1oHcUxOJ70TU7yTRJdcVK2XsO2meys9CuTEDuaPvNLbgAo72OwDaqVpfv3fooYqFKbuFckeaxHbEK994ML2z4Ae/GntMCO2a3IpH5AQXj+3T0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikvUIVVD7Jdc0rntdl62pdakrVq+rqyhTr09oVykQbI=;
 b=XLasQ62WdiKrp6X36n/9oHYuCwQIAY3Jtb9LBS+aLNrPziNS6W7ftBDrFjha/UP1Sl+7cbvTeXNNbDc0E0lPM5ecXnuecUOnBB/qw7mDBrOWgxq2yYnW4pXHnr44RTHn+2elagHNacgBGP2wCosev7iAxGwNLebjBGMyOS15IGWntPKQL79wjhuIS7r2GXk8tDBoPttjXyDmif5/XTq4/VBtykrm7mj6MAG2+iufrX4ICT8o0seh7Drs2oGq41Nrnact/dgAScnv0ZyXe2n6OTVLE8HcPrGbPX+SraW9gPpCUKlrrsnn374VymPAzxk3Cv2dRQ6lNtdqu44GmBSdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210812170350.23543-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94239a81-1d8a-e6ec-f572-9c8d5f3ec50f@suse.com>
Date: Fri, 13 Aug 2021 16:00:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210812170350.23543-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0209.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af2fd814-070c-43fb-af2b-08d95e62bd84
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2608FDF80C83540E6B99A247B3FA9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YBbHgZoNNLaYbLL7vHb+h66hDo+NWnoaaFNJcgpuMs1hSZgaVnyo3iSpNDeZmO8NlGZoG6a4gwL6dFzmWrDjEfhpumMq5UCNrj5OJuTarICsBlbpv7Z1L18HBwQhFx2UJ9C9xlUoQufnKgWx7XH/J2bZfOmCA/N34Das0xpYms2IKmCpSY9+d2YYYxCnLPs2Jng7KHyTi2/Ff7x+/f1zQfJzOZfLhneLxegyBGlxGtLjp6onpk3NLZcC5Tfe5uPA/JfpuxFUBbmA/soehjRCJwDT3refrM1KtbxpfdZg0kpfaWfIW+jPOcBGFbMEAKqN7VeivdD7uGtw+V1DyvQtVQ95aq0XkY52ktBWJqGjhkyI6zv6IO9JHupg4yy4Ix0FRZeWDJhaBWAT9hKd17GJQ0T1J+Bxhi9mz+uTwbIl7CDoVOELXz277TChLxJKg4iA1YR7x1r+KmN01EOWxIuF4BlOwAcHCwITAQFUnmV867ul28ZOHO8TjfwdtIKJPonaOUvdakfqkHPsZwOw3hcXHDv0tR/WJ3qdaCUZmIUfSJCwUM4PWDD4sFpwUtv3cYXG5kbiCnGtFeq2c9gVgK3XH0AXEqO85sOvDxf2/2fyE4CCZubrfUL6bknolxpKPdE4HpWndtGCgaO3OEIIy7+2lrDjnZyMDMohFcDoeR6b3NtmgxTAeTjrjMr9MZJZ4DoxAQj1WzEwFJ32oUilSFaC2Q/qy/nkIOGctKzUPDUvEtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66574015)(16576012)(38100700002)(316002)(4326008)(54906003)(31686004)(26005)(956004)(36756003)(186003)(86362001)(8676002)(2616005)(5660300002)(6916009)(53546011)(508600001)(31696002)(8936002)(2906002)(83380400001)(6486002)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xQZ54q4XyFXHN21rI71U4rGMRU6bl/zsvxv0SYLpznNTdw9nJDemHSHJ7WD8?=
 =?us-ascii?Q?+IhcnMjxIz+plNjNlCxoaHOttiEQL9h0+hB4pDFlBMEZqqpvDesKIR4GfFr0?=
 =?us-ascii?Q?27/h0HtrSeDNLT8wLDRTAXiflQVbWWJBOf4v3Z4Yvn/V76XfGHXSHD1epiap?=
 =?us-ascii?Q?QJvaOqRdOU3za/zU/X+lpuZfDpNver4Hbvq9GsASV6sDmCFLMJiJQu231Oet?=
 =?us-ascii?Q?mCZ7UE9WpK4d8c+USQg+mLGjosb7dLHM4cJ2ezDzknayJe5B0bMc86rUMRZs?=
 =?us-ascii?Q?kTT2mqj8NpumovVitejO0u+vBB4i17zApb6fCpndOpdgYPnED6qd8E8abMwO?=
 =?us-ascii?Q?lQGy60yh5hzFtaVQ2cC1FuqfvBv2BmORMQAQ/ZoUuC9lMsvaQDlyOajgiSdm?=
 =?us-ascii?Q?BM0upiNymhXzt1YOJum5x0WWDby7L1lzvIgkng+LBgzDMvUjwEMoqeohouQs?=
 =?us-ascii?Q?sZuxNzgu7R/63I8ylBMCVLt74mthjU3NeoMt3nLD64C80TAgA0HvOULiPAdN?=
 =?us-ascii?Q?vGEyjNVmIPiFbg6v2wDpLvFXrkyi2l+15nWTzvRgGCMnSO12Uscbz+AZQJC4?=
 =?us-ascii?Q?gdTUfeY7t+/bPND2WzwmKiRT0XxTxZmYIwXxgi66zK0rdE3xh9gziKkMYNi9?=
 =?us-ascii?Q?Y6lOvStD0MpnN86BxFSkTNIpr47NyOmmqkU0VEztnuLs/UDQhVLuOOdPv5Po?=
 =?us-ascii?Q?1D7sctlWk0mSG7SreOdJePG0Tjs0AdFxLtx+l0URdY0jP+n6EM7ptw2Hqbwp?=
 =?us-ascii?Q?QKu7GmZ77A2qKDzLWUOk/cOGTawsfE/O0WwvKj5EWmjxWqRG7a/aOXBI3eqL?=
 =?us-ascii?Q?lgTIRBCzLlaT6IJWmxPZ2wgM1YeLvQNivOPeJ+CgHiU6GHIKwLwyPb68Vork?=
 =?us-ascii?Q?CKoPdFZ7yXTu1nc2a3Uads4g/89XYQXQOetRn4CrjNG9uUPI5JYBjYFP6Y/S?=
 =?us-ascii?Q?tF95Kj0V2mAySMxolB/P8SPeH2ozKXxZLyoQVIU2uBMJmAI02Uncfkn9xtyg?=
 =?us-ascii?Q?65g5wsj87AwvJyMx0ALsK5uKQpqyhW0zgDl8pNMaVE7mSkmKROUJSeXjWTLw?=
 =?us-ascii?Q?ymkuL4kOEmV2K4wROCBxC1+LRlQ10MvYiT+bC1zg3nnkHTLqcXRL5apgFVdN?=
 =?us-ascii?Q?6yWv2FH2AGrxR2Sgri+1ilgJu8ApgOT1b1+aWVUPiCOWfYy7BpRlA631FHRp?=
 =?us-ascii?Q?fgORVVTeJQJT3XkZizUeAb5f+gWxtMEzY0WQ67v577+gDYRcibVcQrrD0dki?=
 =?us-ascii?Q?y5mSvwY8HmR5FzfgQrN+xEyzRHyJ1HWc/3S78+xqbAwwodnlq/fVfHTb3UOM?=
 =?us-ascii?Q?usRJuRb5z4qPv2XIUrD8ZwAY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2fd814-070c-43fb-af2b-08d95e62bd84
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 14:00:43.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B91qx9g7rTxpfCYs+E2C3vQoW24Mcwp1CYGyjyOkWbGQb1eA3otS4gGrZfjsxZkWRRj1uoP0JWrbQHWTLk+3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 12.08.2021 19:03, Andrew Cooper wrote:
> This was a clear oversight in the original CET work.  The BUGFRAME_run_fn=
 and
> BUGFRAME_warn paths update regs->rip without an equivlenet adjustment to =
the
> shadow stack, causes IRET to suffer #CP due to the mismatch.
>=20
> One subtle, and therefore fragile, aspect of extable_shstk_fixup() was th=
at it
> required regs->rip to have its old value as a cross-check that the correc=
t
> word in the shadow stack was being adjusted.
>=20
> Rework extable_shstk_fixup() into fixup_exception_return() which takes
> ownership of the update to both the regular and shadow stacks, ensuring t=
hat
> the regs->rip update is ordered suitably.
>=20
> Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_war=
n to
> ensure that the shadow stack is updated too.
>=20
> Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow s=
tack compatible")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I'm not a massive fan of the large ifdef area.  The logic could be rearra=
nged
> to use IS_ENABLED(CONFIG_XEN_SHSTK) by indenting most of the function, bu=
t I
> can't see any way to drop the goto's, and this is certainly the least-inv=
asive
> diff.

It's not really neat, but we've got worse code elsewhere.

I wonder whether gdb_arch_resume() and gdb_arch_write_reg() also
need some sort of similar adjustment.

Jan


