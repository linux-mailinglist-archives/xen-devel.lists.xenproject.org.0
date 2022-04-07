Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9214F7A1E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:45:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300518.512644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNlZ-0005dO-Fg; Thu, 07 Apr 2022 08:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300518.512644; Thu, 07 Apr 2022 08:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNlZ-0005bB-Cm; Thu, 07 Apr 2022 08:45:21 +0000
Received: by outflank-mailman (input) for mailman id 300518;
 Thu, 07 Apr 2022 08:45:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncNlY-0005b5-0V
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:45:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d534542-b64f-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 10:45:18 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2058.outbound.protection.outlook.com [104.47.6.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-lTpXDD1AN_mu79ALWVKB2g-1; Thu, 07 Apr 2022 10:45:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Thu, 7 Apr
 2022 08:45:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:45:13 +0000
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
X-Inumbo-ID: 0d534542-b64f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649321118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Vgy/nQhPaEJae7S5nCPjqoPV5kuRYuknf6OE1w3sW8=;
	b=CjzROzE3pD8xP0m+bAX/hZgooG2gPCpYYEYdVBqFIUnuYQVe+cOnLAoW+mNDPFwID3jWTv
	3UD4PXyVbY2YiDVxIWzpuscg/CwvMbnpM31kLNc/MnDWift3XYrHHhOVIW1FQnrOZJWoMV
	NyXFZoua/iphb0ldSXpRGzqsKIlayIQ=
X-MC-Unique: lTpXDD1AN_mu79ALWVKB2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxigr1bOkxFzEj27GiwSiz9vuitN/Qk+sG1zVPd6RlFGfTaim2OlFHySSs3/iAUUg8coBzP4lWU0RmrIWGZ3Kq6maV4M4aPadMquNrSDXdHKu5Zh1a5yzMMsLF4Nd6JTItoxtxUynbZi+23X1v8RpYzkP38NafqvYT+9kcnf4BWlmuBByl0a4yoa9mVFj/YlgfZrvVRAQpnFfxt44J0NvlFQPJPMk44W+WOauKSvKEivKYLWw6y5B0Wjwl5LlMVlkrfuij/8Zl7nFCmAvZlWO4jarB707HYsd/xx/I3ydLV5z8KVjwItZHi1LJHC5OIhLnZctjLlwbO/jcxorBgjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CLZAi0cLY6kqsFOAu7uy8giJZDS95AXEjzDsNp3OeI=;
 b=i3iFKZB3hSOyWHkEUFCddHYzB4XNMurH1G/Nxt0Kdgih1ORmF0JiQ+Ak+XsKu2dCsM4VLzpjPnWMhAcp2C5mI/7To7jbHzB4ba+Q/Q3gtfOkHvB423g4RUeOYRdJJQxe+wPNz6fuidvZTt1bJcIlC1vGzGlxrsuSgjlAELFgfRkRrNwdlN7vgJEz5oHD3uoufgyh3fv2lZkEuXROesihbXrUoktMTvsQikXmyDwvRLWTz8t87Amf5b5WArkW7pGTlBch6jjil7sKov8kwPDWKhGrbnHzjBXgKd6htIxqDPdwf8DeMbeG8vActZBBEU5qGWDLt72sY1ixke555COTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de79b53d-0129-ee14-f7ec-fb7fb768b27f@suse.com>
Date: Thu, 7 Apr 2022 10:45:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jane Malalane <jane.malalane@citrix.com>
References: <20220401104713.22291-1-jane.malalane@citrix.com>
 <20220401104713.22291-2-jane.malalane@citrix.com>
 <Yk6glX+SHMyY/GYF@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk6glX+SHMyY/GYF@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0038.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::20) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89f3a793-35fe-439e-f153-08da1872ee5a
X-MS-TrafficTypeDiagnostic: DB9PR04MB9645:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB9645377F8588EBD20BBE8785B3E69@DB9PR04MB9645.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k6PFDXMXUTB7ppzikQUGSnWSxun3jJzHj4CLtdmgO2g2pQ+iMVzkrnk8qsYGk9QiPLtmMaNRZHtL/MoWMlxcLOyRNIS/Zs1ukYsrRq1vEOg4sL2T0d0pvTG3xkCK4yb6qVORUcGJYaP88IfCdk1Q79KUjhtDwLUWUX0mXeTmvjJELS4lzsmX7dzx4m2IXzt0O8dhMtBgQp5oLBUfHPydT38DWd8teCcSQdgTbhJ9OX74g+tJux/ACrvZZUA+y5KYtFdmT6pZgXPi8S++rOY4cbQf7A9uC04O3wMJMmVe2KE8v7f5kVbMITZvWJEniib6bQ9ZGAUCZ8+VH7Mg+po4Syj7Xuwn2xFYDBC/YFBQkcaiz9Y/QLSSoS670pNiGQPrO7vkVYzgZtUutpCzL39kPIPhYL7Mqk7xLFrFWf2p/lyHml00nt+WySI/1nYd/Zqa1nPgmWKBu73Di1UKD8DWw0ftasdKiDc79rBgtkmlBrzcV+FrpBW5x95CHX2J+1yGDXzcyBtz9Q/agIIMj2jhNtzbq90jF3haJEifRQeYme52VQHWCI0OD/YzT40QYlQoHgBXhmi5qAp9cbDEWWzHcpNm9aGt0yvczEblroE/cQtuA5cTgEVymdUfK9cDdwoutP3mlVCwUe61L/8eNdrYDSHJ1TaKx5FqkpVPb2KNybbK6C9Bo65Rh9Wt7n/erUJ2O7bWZERCc3lff55uAFVn1DFGmJvtjKGm4T7lsEFIZnlkMq0nMKzNmY8TEH7xp6mm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(26005)(66556008)(316002)(4326008)(66476007)(6512007)(2616005)(2906002)(8676002)(53546011)(6506007)(38100700002)(5660300002)(508600001)(7416002)(4744005)(83380400001)(8936002)(86362001)(31686004)(186003)(6916009)(31696002)(36756003)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1VguRN0j0tzoSs9rc9ql8vJUeLg5GM+lr5i97sMZ9KRXlCA4J1se/CrSHr5j?=
 =?us-ascii?Q?4saLOa+JObUl3UTrwoD4OUWZjZPnmchI7d2g/x9tYkttCM1Kc5hp0UJRTtMe?=
 =?us-ascii?Q?WH42PaZE7d9NJooZxi9uDXRe5y8fgusbKg/XhrzzO2tQarLu3ktWLn2fjB8s?=
 =?us-ascii?Q?h1mFgmjsTUmAjvCO7b9NCsLnR+rkvHonVmVacyQMXtXDFyUixIO3Vt4mSt0+?=
 =?us-ascii?Q?iNC7KB7Fciw2C4vT/e2pe9hdLcmLSZmsavdSMhM7HDlfRJWVdI/QhyUdOrDG?=
 =?us-ascii?Q?jVme84Ed4X0xnT/u8iKB5S7v33Jv3ssBt6Bxl59unry0PY4bIWpOaAmbvVWt?=
 =?us-ascii?Q?Q6KO5r5piuW+7pPzPHsHlhamiSc5YYzyP8LCCvV9MYidG7qfb/sXDy9vnMZf?=
 =?us-ascii?Q?BrwR5PFdXNj+CgrSnlQV+1xESzFhoh/Io2OviJWdnYgCkAtqmTbUk8LNNnwq?=
 =?us-ascii?Q?n7dXjquV7ueJabcrQr4f6LRY7xNvhhJRYMZw5fR/xJ4k+mYNelodTeDVmIue?=
 =?us-ascii?Q?B5yjP3274u10aIasE5EM6hryzm+bNFf0nbMuFUgvlga+pbJGM3bR0jWmx0NZ?=
 =?us-ascii?Q?z/nGE56hrtQ1fwbCiHfUqGKRQF9q6Kl019ojSjnVY+MvkZYTZap+ihTMuwdZ?=
 =?us-ascii?Q?LcrReTp7kSy3/CLLjLm6auc4m0xNrMsRivKbj44apPbLi/t48xc7qEk3uBY5?=
 =?us-ascii?Q?HCBCu7I+osM3eAFyaW+LQbhY94Qd8h29uCFLEGFmMceGTw50KlzmPnKIvdQE?=
 =?us-ascii?Q?pDdNLCZ6sHM73et9ywDCppuG6rq9jWrpohsauZw8p4xmZW4CatFf5NFtxEfA?=
 =?us-ascii?Q?O+pDcu4oCCTL3w0YFNfmXjgJZfpKh4ino45yS4aEJ169MIwt/DgqNLxKak5o?=
 =?us-ascii?Q?lHU+HyPvZzT6CSXkLMXCnpw9z5W4unzmH76ehE+ajtOvx2CuICg8oefGT9i5?=
 =?us-ascii?Q?cDqK7Na1nehXdNlTQ+MMmCxJgir8MUr5+CJNJtyi77spFuR2XXrIhzfDMCeL?=
 =?us-ascii?Q?joHQo/tVE3gv3iMc0IbMORDG2ZFE7KVS/cJ9nVs7fp1C4GvugFwLnS5Xme/n?=
 =?us-ascii?Q?kC76ezljXHlcX+gd6hPnI4TeA4JDyTMBo/Xa9K4gEADL3BYA9jiGVnYCmu4o?=
 =?us-ascii?Q?DfdErMouV2+ls28pcxLa6YtS0ItPXzi3TnsEeqw5dMignUpIYvOncD8Zqbue?=
 =?us-ascii?Q?YEJhrlML8kWh3EyQjDXslUkvjM9mY3l8q56zljgLIdlhdKXJxE6cC+rvczyJ?=
 =?us-ascii?Q?FP1pUkDac0BmGCPMvLVOHaTFe0E7DLO+VHDJwiJQdyWbvtyht26IjThU59dg?=
 =?us-ascii?Q?rhaIqPq0XIHIBWVhV+u2TXacu8FpL70+lrjbuaQZk+R8wqK1b+DqpyHJAMR6?=
 =?us-ascii?Q?K4TSH7VyexBcVrTHP/rkho5imSOKZC0Umqn9PcbiRpy61ScFwZbYpxa/Tm7F?=
 =?us-ascii?Q?8Oc6//Rg7sMoJigV+5zR8Xpjtjs9dhCU8iFZPbm42+F5GfxeOXOJBI9AO52y?=
 =?us-ascii?Q?Fp3UPnFZiyWBw8UOzJ9NshQ7Zx3vdY4/nR68hUx7dSKl4RFmoCR1L35QJqgR?=
 =?us-ascii?Q?eZ6QKoU7j89oZQJFM8ywFzig/fWrkUvqCN1yqsbSjg6zoTIt6muL6tOd65mS?=
 =?us-ascii?Q?X31VQkWN4ExdwlKxXWHRPA44f2kZ1xvFXT9/DYkSj27qqWVpN3pazLndKQrd?=
 =?us-ascii?Q?xXHElcABkby1p+ervTfxjVtkDXy1ZCGspsaEWi7NBWEEpexcla5IAT1Z7fRl?=
 =?us-ascii?Q?CsEx78uBgQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f3a793-35fe-439e-f153-08da1872ee5a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:45:13.2496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5ryZw1kjYh+9rGJCp1w4EsbrwMBuxQjAz7R0GzGMVeDiv96KQeJFvB5oMvP88aH4yMfat8hh1X09ar5xooX3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

On 07.04.2022 10:28, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 01, 2022 at 11:47:12AM +0100, Jane Malalane wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -2145,6 +2145,12 @@ int __init vmx_vmcs_init(void)
>> =20
>>      ret =3D _vmx_cpu_up(true);
>> =20
>> +    /* Check whether hardware supports accelerated xapic and x2apic. */
>> +    assisted_xapic_available =3D cpu_has_vmx_virtualize_apic_accesses;
>> +    assisted_x2apic_available =3D cpu_has_vmx_virtualize_x2apic_mode &&
>> +                                (cpu_has_vmx_apic_reg_virt ||
>> +                                 cpu_has_vmx_virtual_intr_delivery);
>=20
> Setting assisted_x{2}apic_available should only be done !ret, or else
> we might be reporting those capabilities when VMX is not usable, which
> would be misleading IMO.

Hmm, while I agree with the observation, wouldn't it be better if all
the feature masks were cleared in case of failure, such that other
code using the predicates wouldn't be mislead either? (That would
likely want to be a separate, prereq change.)

Jan


