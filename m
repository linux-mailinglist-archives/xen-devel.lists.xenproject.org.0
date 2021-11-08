Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0BE447B43
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 08:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223077.385611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzHF-0004Du-8k; Mon, 08 Nov 2021 07:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223077.385611; Mon, 08 Nov 2021 07:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjzHF-0004BR-5j; Mon, 08 Nov 2021 07:41:13 +0000
Received: by outflank-mailman (input) for mailman id 223077;
 Mon, 08 Nov 2021 07:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mjzHD-0004BL-Jd
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 07:41:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c21a14-4067-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 08:41:02 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-EufC4LC7Mt-YztdV605APw-1; Mon, 08 Nov 2021 08:41:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Mon, 8 Nov
 2021 07:40:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 07:40:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0251.eurprd06.prod.outlook.com (2603:10a6:20b:45f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 07:40:57 +0000
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
X-Inumbo-ID: 38c21a14-4067-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636357261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7934aiGa4z4CkDhDcjeqpydDD4Aq11SQqEQMSo+8Ek=;
	b=X+8CQE2aJn0yYLAFksF8aW2C6iAhuLVb5YqtCVYTGkrzaTZCQHsY9iMM6pqotboWQ4A1MS
	oVD2X9piEkts8MF4d9Uri75C2ybIaVyDt1eAoVXdq6T7eBWQxzwB42N5rytMx8ecZHt3TK
	wlSvIiWsztGF381ufOUJZUOZsdSySic=
X-MC-Unique: EufC4LC7Mt-YztdV605APw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fy6mPaOYlSc3gdF9qKC/QQvV7dKsqOKMLjXEJjPrRLxRUMscIJ3gUOCAV0pBv1tQWejVG+R27Dr72RAztt/YovPrLQQDFLvHElZKRzi5vZ066MJG2BAup7ztbDLtIodmRIRFpYMaHwNtw5NkBccugkI28J4EJgduGi7a4VjySfg1o+5FZvq3mQrVf0MwjYWZ7zPdfywqSJCT3rUVnWLEt8SyC5W9DuiVuKUa9XExzQRd/JZBi5gelImetW5QY+rQDoPOeuTTJH4hC9haxCkHnIIi77yuz4MrcRwXhgMfWZ2KCy3NUEYRIt48Gb65g4XG9lOmD1zTgC9trvDlqcq+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SECgzteS/cSDA5kidSyrcpqCB9IelkZD/cdV4vU94fw=;
 b=TSgK3cfZAJXdYmj+sUoCCP/7LbUYhrIBJJ8Zs4OIGlQjA0b+OaMJAD6/ddjJ5xfF+aKdcyVkEM2/skKsSAJAxDKhbh2G9NJJVfEBjhvNfyKN4sCcRco4uox9k7yxwIPXPh41hYfZjM5pAyRPslMczD/hPtjTDRfX/+P7KITItfOfGOyB7iZQv86WwQklzsQ79ubvNS1VwAfJIaYD9H6bSw7yzE/fBfujK/lAlSTjsZFpLI7p8eBEnv+9GxmXYN3CnR8XyyWaQvn+4pdT4xSPguGy0IBMJxNX6SfLkhDI+rVt01gz2c3g4cnUgkCBHiOTCygGJP9JjfsLy3cAE+NFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af235a71-2916-2498-b19b-4759a9e6fa95@suse.com>
Date: Mon, 8 Nov 2021 08:40:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@FreeBSD.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
 <YYVQAH7OYmFSVOei@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYVQAH7OYmFSVOei@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0251.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ded0939-44e5-47b5-80c8-08d9a28b1ab4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165A86E7F4EF991319211E7B3919@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pMxTlK+oLMWEb4hbNmfNjVuha23N2bTuLJ9mGCmroOdIqZu7Y7d2xbwkONbXERhc49yEQ0vJ5WOB/eBME4qcH3uxoo06AjDkwlQgPF4S7/ecSIU4QD7xdWpVdBXeI2voLxYaEwcUXl+h5xIiy0wExvfV3Hmt8EhGwA7dUUu7IT5TyG6mdGxZ+Pxw+wRuWuHrEn1RabYPJXw34aRCAv/n9i0barLlTmKpzhf219nAJNAn4MYb9fJgumtrR2WpgRlLmw0WnGsnuFlSDECvu8vBMtE8Pk8UaSanAjtI2kwaIFnZ7tYBP0zsKyTzcUUwZISP2T/1SJSJp/sXGcc5Y2ASSfHv932hqR/hB0BH4A+PVXa9YzPX6ucPY952szJCt81pqvcZH+ErAfIa+JbYnxp5NUG+7byL0nfuoAzfV5aXd/Pin/3BMyPia+0K5joYDqyEb892ugRbo31cSDfdVEHy4AyOBgM77FYLdPiorZaiVCKNL5h9PmYvS207AsN9T2FAXrjcAh0SWeDn2U0hDRUraoFy/TKcs/uedkkaqYTn2sMVPiuBgDxcE8V5Naoqzq6Xl+VBpzMvJ+iV2TeIRDOXfLeSTF8gOXK7oc39pTVs/gkyqbORs2fzhwT6VuUDsr1CsW9r8ENHcLxzN7Zlr0kAuvL37vJuQqOakpVSJXQL7H2etBBLdNwe1TKfnDv87Qkwzp0AfEFoAzyToPhgM0qK+xNnqQIqdOO5kwIGqUgn5mkgAZ1+/448x9ZuIWGgWzMk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(38100700002)(2906002)(26005)(186003)(508600001)(956004)(2616005)(66476007)(66556008)(31696002)(5660300002)(66946007)(6486002)(4326008)(16576012)(31686004)(8676002)(316002)(83380400001)(8936002)(6916009)(36756003)(53546011)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Ergs11HBSP8N5P/6neFdrTG28krArYsIvG5+iGZErHAYA6pgBuCQjIy2Hjy?=
 =?us-ascii?Q?hv8e5NrN1qPh8rs/HPB1DhhikXa1Dkx8sqXK9xPofaJDDuCs3LYyOl8CXkoC?=
 =?us-ascii?Q?Y/mp59hJFRf17aT0f7wim9o59p2aPBvcldhzSIAm1qw/a5nTwuqstPfKs3o3?=
 =?us-ascii?Q?XKIUcHg1GqOsC+IyLidq3BP04vSEs4TXtwfjN/GBE6pQxew9UiF1904CrmtV?=
 =?us-ascii?Q?70yzf6oEae6JblQwIgb8C4/+rn2xLX5p3BZnnsoetGvQje/0PJy6p8o/tArm?=
 =?us-ascii?Q?wofX5O5qE6aHh0tbNoCex5/7qcNMs1Yd7QTuZxDIMf2WBkMRxmj7iY5ZuqYY?=
 =?us-ascii?Q?yRd/iHoBHbmrayZJCbLNCBXXpjjbUJK3A7Y+BAifo2wmihU2LubiXmh/wZpF?=
 =?us-ascii?Q?VmGiItftTEg9nm+KgPA9osnfNiLR5SFztGfpcLyssmsXy5XzjR++E7Kg5BTn?=
 =?us-ascii?Q?iwg8jC0CoUrzxNZBa+Hsd6duKAEVIZWBQsvvry4YkGLAp4AyyNG1PSXYRFxE?=
 =?us-ascii?Q?7Enmm4SPos1eVgIs71BS/UcIh4TO8l3LPzIEc9squeuL9XohrPIo1XD6pY4x?=
 =?us-ascii?Q?mWZ0D4odFkwWEUzC5vRWYwDcDkEuABHbDWslSGgRFoWIoykBc7fTjmWxYCBQ?=
 =?us-ascii?Q?bSyw1k4HWQPp096iB085FlnFXHLQcB2MqYSv/mPBvw/3JRWJLq604zY8DZNf?=
 =?us-ascii?Q?WLwCcFlMcNB0aHlUaS0PyS75kQT34Vq3z8E/JoBa1pLyPkE8e/Xmr+b9Ab5J?=
 =?us-ascii?Q?NIBnD2Hl67WfSsvkMTBKhZxgLRKDT2qYIBf44leIKGE3jt92uw/wHCYUHTLv?=
 =?us-ascii?Q?TJKPnzjgpAckL0ywwf29Oo5QfLjzswsoVgzo2FvQoemLG04IdsDw+daILUE6?=
 =?us-ascii?Q?HZLJ9QWEfjS5stGEJcOm6XoRVvxTT6VWn84D6nFfjYjQ9/cV9HzeFlUihP58?=
 =?us-ascii?Q?ESXxzSmZwcPdtbp8CRxnrcFOwkQDCOrccrZjkQxvaJN6y2rM6ipm1DSBC+EQ?=
 =?us-ascii?Q?c+TdRZaZMigUXcc8XgTEBo+BS4iO/orRbhfwDEF5Nm/JhXCfJ8bgj+jGmvav?=
 =?us-ascii?Q?z12ci2FJ0lIz7l0iEVLrKofPjGLqtYWQa6nHz2++rpRV934FlX+AMz742eVo?=
 =?us-ascii?Q?T46RnB9AW32wHFrGJkXU1Do1FxZgYee8gQEWQNBfDX288Zal9HB76kNovmDs?=
 =?us-ascii?Q?+Z1k7Y1dzPuSyoJ+RdxWIHo/73hc0A9/lBfTx5MmC/OQCwprj1w6arfV7WBp?=
 =?us-ascii?Q?Ldva1T6HGRsrNgK+e0bOzk06XnPXY0gGQDSuZhqrPXgeaMPoNGlayJtLcr6m?=
 =?us-ascii?Q?Yjrt2FIVn+683tM/sOGQaevtlcpr02M0/yiAnKl2WcBhH56AA+d6GTyXV7+6?=
 =?us-ascii?Q?o2/xo/V2j49IWbvHbAy+z7b7fMadJWDunOTOSWfN+TN0geqyXJxasFrKi37W?=
 =?us-ascii?Q?zLxImxN+UjreaNmj95jrkdgi2vM1B3ZQQ0ipKUJKLrKtEWjyMf9BLRJ82Lt/?=
 =?us-ascii?Q?fv/kC9vcpJ1pXM6/B5KiLgb/1XcfQzzGXpjhhdNF9xxcu0ghn6ybEXnLwMHX?=
 =?us-ascii?Q?1QN2I4FqXjiXoX5og3OOkhWL0OMOXhT7leDp5Go7K9CR2HkCxODEAc0K19Fv?=
 =?us-ascii?Q?yz7K7GFPDXwPeOWltpllP8A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ded0939-44e5-47b5-80c8-08d9a28b1ab4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 07:40:58.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp5gZjX0iX3qYz1I4AA446Zktd25KEqT8UgJtU0logZ+hcS58Hn1nxEVRBJwBNgv3aGz2Hhbhi7O/lEMcsa+hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 05.11.2021 16:38, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 05, 2021 at 01:32:18PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1699,6 +1699,13 @@ void __init noreturn __start_xen(unsigne
>> =20
>>      dmi_scan_machine();
>> =20
>> +    /*
>> +     * IOMMU-related ACPI table parsing has to happen before APIC probi=
ng, for
>> +     * check_x2apic_preenabled() to be able to observe respective findi=
ngs, in
>> +     * particular iommu_intremap having got turned off.
>> +     */
>> +    acpi_iommu_init();
>=20
> If we pull this out I think we should add a check for acpi_disabled
> and if set turn off iommu_intremap and iommu_enable?

Hmm, I should have added a note regarding this. If we want to exactly
retain prior behavior, acpi_ht would also need checking. Yet that has
gone wrong long ago: We parse way too many tables when acpi_disabled
&& acpi_ht, and hence while correct wrt to prior behavior I'd consider
it wrong to (re)add a "!acpi_ht" check.

As a result I'm of the opinion that checking acpi_disabled here also
isn't necessarily appropriate, and instead IOMMU disabling would
better be solely under the control of "iommu=3D".

Additionally iirc Andrew has been suggesting to drop all this "ACPI
disabled / HT-only" machinery (I'm somewhat hesitant with that, but
as a result I'm also not very eager to actually correct to accumulated
bad behavior). The change here simply would be a tiny first step in
that direction.

Jan


