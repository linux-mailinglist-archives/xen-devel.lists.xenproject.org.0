Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FC435BD9
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 09:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214205.372688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSdo-0001MA-AT; Thu, 21 Oct 2021 07:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214205.372688; Thu, 21 Oct 2021 07:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSdo-0001KL-7M; Thu, 21 Oct 2021 07:37:32 +0000
Received: by outflank-mailman (input) for mailman id 214205;
 Thu, 21 Oct 2021 07:37:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdSdm-0001KF-DF
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 07:37:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be089830-3241-11ec-836a-12813bfff9fa;
 Thu, 21 Oct 2021 07:37:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-PNfUmATON7Sorso3cQxCJw-1; Thu, 21 Oct 2021 09:37:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 21 Oct
 2021 07:37:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 07:37:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0276.eurprd06.prod.outlook.com (2603:10a6:20b:45a::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 21 Oct 2021 07:37:25 +0000
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
X-Inumbo-ID: be089830-3241-11ec-836a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634801848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=USQ7yNUiDGlLiTzN8f3dMUwHzw8OTMUEoe7iirHHcZo=;
	b=U460inu1ewtMBreohvntRZ5XGVIPsY30/UypGnjsM7dwGgMH+H7zgxF//eZYc/oHvFco6o
	UUlvh8fCpMHzkuTcIf7WdWpImKGlNF2SAN6ccj1kitXjFPxthF42Z/gNRPsNFh06txixH8
	mPg3/OdoHyCYd5OnG9b8kY6dgZtpV2c=
X-MC-Unique: PNfUmATON7Sorso3cQxCJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUcEP8TT0Q1ynyvnpA4BGMQu61yVQwAQHiw/zLn38YSoNU5czz0oOZEBo2gq+kBNp9G91g3A38jpw082PKFGWmeiBMZyzEy9T4KQ2aPF28wzfpLYs89Ibb4Hl81/x2XosrOhGINV0t480aatdlpawRiz/yY3HkR4qCxhNGwoptcR77QtKXyyPSI8/P18aPOgxIfyqPEZr4BRL98+YdLYJjyf40NvE4uT9YofCyZkSFjs+QohYng/SnXombzyd3r0yqTpH4itSqqqZrKsvMUU5zB0pNhw258VE6ZpPo7s6GU5iHFdv8olE1VNjdGRteMox5JXoQcq+TFj2FEcAJRYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gEpTw3//89MXNDe64M3tf+KTQ7BkEXPlF92RZax728=;
 b=KPvvDpT/L3pKaYlo0Rw6XQhkNcLv8X5rm7D+NSqiQpAAAPRBb2COwJ9uXK/NZPzDfiNBQfSo8fT6Kb+mhnHDVdQXogisFIp1Nz9d1m22wJzOUhI65Y/bGVTmSubzL9VLGRHRocFAG+gexULBNfrv+28Rf+LG5yC6kpvDkzWR3NbToMv/uwhHZIY2EvwMdn8AMzPiodnOOjI1NBVPCZM+hjoafVNhIozUduyGIfp5tks1Mv1Zylib22N1Kb7cGVU3fOkgnu6Z7RSk15CKeCt5WIKTe3Bu+XH1WWyWRODHdszWDHtS9LXEgaGHp6AMCfUOdTH8nJvh60fP4GEdPq52AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/IOMMU: mark IOMMU / intremap not in use when ACPI
 tables are missing
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <684e4a04-3ef3-46be-3302-149d5ce30177@suse.com>
 <e710cb3f-9343-f9d6-123e-287687e7bac3@citrix.com>
 <50e25c02-e5c6-b04e-e21e-a8a1b53f087e@suse.com>
Message-ID: <c13f3387-92fd-e334-ce14-57ae29dcfb5b@suse.com>
Date: Thu, 21 Oct 2021 09:37:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <50e25c02-e5c6-b04e-e21e-a8a1b53f087e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0276.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd157a25-ab56-49f2-463a-08d99465a095
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35367A0365294D9E02D63578B3BF9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IYRbuqdYfU3E+9Mr4hHukRL/owte1GfhIDHdaQ4Nt0xuoitejbsoHXALBuQCV8PLOq7Al+45fQOz3IFNj1xseWamZ8ujImSCPeB102q4IV+3+t9XK+eEMzRXLYe03yyJvQt48SBtHly+9eBbgsjr6xsbNakDV3bBQCUexCKCb4zwQkU6HjDUGrt/qvulGSCQdwEedy6Q+NFCB3gFVwNZow5UD09L9NG6SVLtsTZbDef93915o40KNlGRpMAnPgL8hwG8V+nkD2Tv/wloSc4ckU3kc8jFT4EXgygk2s7T3CigrWpjyBqlpH8tzeSZkJROL+Yvpscloxp2sfltQaI+og0JQEXr+PjaisWcyCVgoQZF22R52qqHIoKuGVMHrcvw38UdzwaWF7uEZgd0IsKf6A1etCcqRyi/1FEwlbWdDXzka3/Wm9Ioj7kB8FfDUJHcvjB2HW7C7CUsLcnFlcwpcMulM+JhuMXYARlyBAeIditrBNN961tSTA5IZT+XLwMZKI4cGEQLOV+i+nIpsjVXCe4ueC8HcTPFEaOQkkabeslh8CEauAVfw5Ssahjy5sqgh1kFz7uwnC37P8XtDnlMB/CIyfaQi5oGw4AyyFIJWjm4o+ZSjzxvAuqcfA2gGAoC3OzmCNIw2f368dHYh3cTNwfI7I8Z2eaxCXmXpyJFXUFKjMe8EDjvSl4eAwx1hkuOp1L2PyNMEJKwoe6EFCoPAZGgpi77FFRKJWqS0HQQ1+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(2906002)(4744005)(4326008)(508600001)(5660300002)(53546011)(36756003)(186003)(8676002)(31696002)(26005)(66946007)(66476007)(6486002)(8936002)(66556008)(86362001)(6916009)(956004)(16576012)(31686004)(83380400001)(2616005)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wly2wVkDS+nEI3t8UOp0n2oJxfTZ50SCBbnMrPdm6xYdR8f+MjZuVlQyCrCl?=
 =?us-ascii?Q?5LdraNd+/llR5tvtTkT993JK3S8MSKSGFqoWXth7K8uSLlRDvKgbmAml+wUi?=
 =?us-ascii?Q?Nu5JfOicjL6LHK/gc1L0zDuISWIFjBIrb/ywRHX+OFkvF1mkkxI7Im/RKiVz?=
 =?us-ascii?Q?aUcg+2Y7rL2sq5wskq6TW00hysELYGKJPRZlqM29yZIKc6PvEI64BvCtJ7my?=
 =?us-ascii?Q?4KU6zAbNWu+rDNB7JW8CqoiNrtpkSeSwj228tn/qZ640RUIVS2IH1hb49Da9?=
 =?us-ascii?Q?93bv6Fo0hvnlNr1R6CiYb5LNm2WQ1VuNORVuRujxlYX50u84PRmsPF+Xs1Q1?=
 =?us-ascii?Q?aCSrGlPGHVEhLeaGkbmECujLymMGhoWgdZMADQGGXxnio6hsPlU9OBB/+HwJ?=
 =?us-ascii?Q?XzHnST519fs32iMc2Xk4aG3C2UF7evxxHQeDiVN4D5BdpcWqtwBSfAPDkcoS?=
 =?us-ascii?Q?ZUPALE6LaGO7aioNG/jhzD9zYiqs+tGHCP7yepp3Hoex8cjM2GutSvjDB+wH?=
 =?us-ascii?Q?DwyfCTbku/3+O3wNNfviGB997Mja4z3lORmo4/HlCcjnt1mStfyhWUWQQa/o?=
 =?us-ascii?Q?JvGFuLtvLfpi90+0maFoK4fzj6xGQk490OlaKV1K+ex/29wx5/BfVcnaCfz8?=
 =?us-ascii?Q?18PbPCNh7u7O7f9Z4LpMfhJLcwaBIgxXIKVOPizDtpL5kzABykY5zU0JvnjE?=
 =?us-ascii?Q?QUTj0KUeW8l+YZV8IgtfR/2jrfmBsIUQYTV9olYtw0qQewJ6/o101KajSSz5?=
 =?us-ascii?Q?jEEC6mHqeXPKBBy+mFsFTd+8ezKcSKHcJmYuLFGeOPgNmgP2+Uw2wacGJX8R?=
 =?us-ascii?Q?QuazAOpDaHghzRPB3uQG1wUjQBOVLymfUvCxx8KEJ7qbJgfuJK3LB716/Tiq?=
 =?us-ascii?Q?sqqZNJelxMeVqJYP3i7EDdTxLuB2M5PmkusL11nA/KciWOPkCmCjkYPIwMxb?=
 =?us-ascii?Q?vCg5v8GOP9TWUbMfRWm4yrczDzTZpUAiwAqzDoOjANgwa6PlSAS97inKaMEo?=
 =?us-ascii?Q?UmBvIUqtKOsQsw/PRaN4M1KKlK3uRoEpKCuh4Pmy9fVSfcMu4MkQOI+XCLIY?=
 =?us-ascii?Q?NIlwpSEDT6zgfdIEAA191HkxTnki6aWiBtE4aeWswhSq2CCpY04UHtTzeM7E?=
 =?us-ascii?Q?4zc8du9kWPfmwU9xTrdENNq9++imfMZrrX3sPAtinavt/a3jDl8a6aj5a4EL?=
 =?us-ascii?Q?+AvC3aWgfMRbdbbhIJmsctoq8aCtj3RK8lvN0kWiXiQa8lTcrTErbiligp8+?=
 =?us-ascii?Q?6ESY9VUttOyc8vLVlr4JSD+pKVbMZsnGK/fhe2Mhv05vb996kvU1RGSM+SNx?=
 =?us-ascii?Q?kqMhob5InMRanIyXn59C+VOP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd157a25-ab56-49f2-463a-08d99465a095
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 07:37:25.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 21.10.2021 09:21, Jan Beulich wrote:
> On 20.10.2021 22:01, Andrew Cooper wrote:
>> However, I don't think skipping parsing is a sensible move.=C2=A0 Intrem=
ap is
>> utterly mandatory if during boot, we discover that our APIC ID is >254,
>> and iommu=3Dno-intremap must be ignored in this case, or if the MADT say=
s
>> we have CPUs beyond that limit and the user hasn't specified nr_cpus=3D1
>> or equivalent.
>=20
> Reading this made me realize that the change breaks other behavior.
> The conditional really needs to be iommu_enable || iommu_intremap -
> at least AMD code added in support for x2APIC already treats the
> latter to not be a sub-option of the former (iov_supports_xt(),
> acpi_ivrs_init()), and e.g. intel_iommu_supports_eim() also checks
> the latter alone.

Actually the check in iov_supports_xt() is wrong - it needs to use
&&, not ||. I'll make a 2nd patch ...

Jan


