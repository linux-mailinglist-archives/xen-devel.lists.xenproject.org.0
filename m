Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33441C0A3
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 10:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198825.352529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUtB-0001Xu-DG; Wed, 29 Sep 2021 08:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198825.352529; Wed, 29 Sep 2021 08:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVUtB-0001VS-8n; Wed, 29 Sep 2021 08:24:29 +0000
Received: by outflank-mailman (input) for mailman id 198825;
 Wed, 29 Sep 2021 08:24:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVUt9-0001TL-5w
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 08:24:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a81c7a55-20fe-11ec-bcdf-12813bfff9fa;
 Wed, 29 Sep 2021 08:24:26 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-44mRcsR-M-mjLuHpgOnEuQ-1; Wed, 29 Sep 2021 10:24:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 08:24:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 08:24:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:20b:462::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 08:24:19 +0000
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
X-Inumbo-ID: a81c7a55-20fe-11ec-bcdf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632903865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dc35Spxy70nhW60kM/sdbASAJlGjvSvVzTsJkyPWwmI=;
	b=hZZ1EmsX846a1+zWTgDQ5JGUM7HFj7YXZi0FPkxpOawKTLEOA7xDslO+rOoErWmS6eBksQ
	oYCh7GA47Z5l5zT2xFPc38pmbpU/y/b0GGn8kNzO1OIvA1kaohtfwKDL6D/syjSKEk8kxS
	27sZ3uTRBdxiODUZsF8d4z63pJmyces=
X-MC-Unique: 44mRcsR-M-mjLuHpgOnEuQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdNWJb5YoOLW2QNKqjzoIxtFagHVNWIg9TRjjNPbtoXI2aHjFxz4k3Gqa7bsWHshj077ZQ4jTdvN4tRuRYtJPUX+q/mEGn7VARRJdjSNqW9pfKb9iTsSVemwxYL8RIIV7cwhNzSIk7uNOgXlgOrzmn+vtvQCRLog9P6S7XId5eHQYJk9RKPY0uDVFYC/OHF0Qvbnrkqc/TjlblCV5JrkMPmcrdA9lU6TlVDNKpcqTXgIFD+swutRn4dUURU/xcaIh9BmWpnztnB0lzyaPZfu09X5FcDcB1wDqlOgsNob05UjDCoBPrLYvZ9NmrWX9tof4hYEEG0BwncBVYkb+hp23w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xYLDlTKQG/veH3t6BApJ/5eZwO8H4btcFF9540vj7no=;
 b=bee6KJmrc0V849gs2cEh3G/naaUj6Lk/8fLJL+U08htNDaF2LCKj6GmpQw4TjGwkjZsVVCR+qcJOFWN8+Qpb5MbE2f96L6Ns5C/apMA6XZtKLkV0q3Ye23v5dEJZqoFHwbMfl2+3lQYdStF9LWPPIc/CDO63MmA0N3mhD8Cf7E72JXKVmnmwJxNPbuxfSAY9KX/fpC6F9ZPAFmvlhbIRsgRyxC5fMpEd8j3eMGmuELNhRA/0i2eMuZL1JELv2dnRAncie0SM6vVZpuwfD4OtSs7Bxfuc8sSFOZkNqeyklfu27bYJ55vYKGGlO3gPrvtOL01sDAaZPAB0f7J9oJ/yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 03/17] xen/arm: solve compilation error on ARM with
 ACPI && HAS_PCI
To: Rahul Singh <rahul.singh@arm.com>
CC: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1632847120.git.rahul.singh@arm.com>
 <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67ae3cd5-e90a-5d62-b7f6-b9802ec8296c@suse.com>
Date: Wed, 29 Sep 2021 10:24:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b95685e16fccf18580c094a5c57db4b83d5b4a29.1632847120.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0026.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 649277ad-e545-410a-574f-08d9832288f9
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB647950EA8E3CACAF67085CA7B3A99@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXHNYjJ2xctKOTgiMSOrXfGocfYHdmvXGSQhhWKKPQW62vValBvdb6hFRkMjTv39ksV0DYYwmvx3P38AEDCUvPrzxBef0KMXJE3+WKXppKd0Oig/dzl2jQceTHxeoiN2nnKinNpv8bT0zZS23WDR1UCxyow5nvgdT3QslaB9Js2zEg/qJ/dgEdc+T4RnpruJ/445E81Wq3QgxkoryRGf7dzCELh36PhDmLRk8apSmfx76hTSajAVMiXUMYJzJAT5uQJDh1AadE9Z13iAsomZAZYjVeZOwrTgmLw9sMw/aYFwCJzCHb/zhJ0XWjc6Wm8PfdZYgqGVLkulO3ESnG9G5Lm97Y3IBwENSslpZ9pjZlGnXAwSkSkLlN4gxltR3AmEG45qmxnsCXqR1N8AYoAmoVBxlJRDhRnxXLTaHo5Wuou1HVErqxEzvLoVDfS3zg3tT9lH5UlQzvOXNXR+vly05IiDvbukXRPSGCDFZEr/Sgs6FIPqEXzKgNGpRdKKs8FQwm2bNxDqInOsTbpf2zwNK3MJb8lBnINh+nK5w9Dr6IoQi5k6V6uANKbZ6hXrMu3QKeDNHVt+n9W5tG0ulljqDvrx2zWtYE/8FEQXKTOnNzPcWLACUuBHJ0whAZbG4BsyjXb5czLYYl/D6Lw/A2ANs7CzGtbX/BWkJrKU88ftvuLD9HC2PXE08k0yh00k2DpLKzzZlmpVrWmuUzSovmBpOD60mUzPpwpgkk3lF7oO1L8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(4744005)(36756003)(956004)(6916009)(186003)(86362001)(26005)(16576012)(316002)(53546011)(508600001)(66946007)(38100700002)(6486002)(31686004)(4326008)(2616005)(66476007)(31696002)(66556008)(5660300002)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/NGQKPg4RHYlrSialoQgwye/hJ8CQRL0gKhJp2mI3E2RPg6aX5RdGkLfCsT?=
 =?us-ascii?Q?yvNw9ZhYebq+WNEBl1sAgaIq0IjL5VKOQMLTho9zpo/e6L2JH5NBXT1hMXy2?=
 =?us-ascii?Q?GIle7Ldu4QEVFjkQgu6LCOmVkg7YmarzT+EOCvtofiuTux9shFFfGzJg2aLg?=
 =?us-ascii?Q?SfKYpzlFhp2W/gtRqic2YXvOaiOqt+QZ30rIdAQmbLaDvlwzuTKA9j0VeE2t?=
 =?us-ascii?Q?YoWBhi379C8IPpJnu3thbXiYRZx8B64W83AlgVWcIppfo/b91n8adXrGtw/l?=
 =?us-ascii?Q?JW73B2prR4Zbx1HnIFe0bsTXHWmylH71i7Fc7QrS51p9BTpWOwJcmP8I+otv?=
 =?us-ascii?Q?RziswwVa6PzNGrKaQxYwZNzCCasyzo7hDfc8wkQ26Ot5nFbSmXS9DvjZQf9A?=
 =?us-ascii?Q?thEBvLpuAtOeZF8Y0pv09XL/iLz2FDKjihh3HKdyTKfp8xDuf8YHlZ5MWKiT?=
 =?us-ascii?Q?Z+6eahPwn7nxzqHv41SzpIG9d0Z1UIlXRnT13BHC5TMu3u32IBR2z+X2GRuC?=
 =?us-ascii?Q?7I3ZT30XqG2fNxssLj2kmrraaDdfyWNRSYwdRbNmr+fbBAv9A/6khmSblLPS?=
 =?us-ascii?Q?uoTjTfFdCnZ/DAhxQGiDChXQWrmYPNaZvmr3QTJKIYurwCNqq9UkahcfaepR?=
 =?us-ascii?Q?fFYr+7xiWcGTBjrWXBJ/ADLbr/LJMez4m1LUTY79RRw2ktf2VDC7P6VO7vYz?=
 =?us-ascii?Q?Cpq3IlW6BqNQxKnncrP8bupCCAd0OoIZjrlPqDNJMbTRvkQ7yt4riv74MA4b?=
 =?us-ascii?Q?gHxJG9euwukeUzN9DsWVgR2fMwYw/1mDgM6vOMwR4pu4n1XCCOmfEt7y78bM?=
 =?us-ascii?Q?hFd6DrQfl0o3Ap+Sm+Y/54mek8OnAHK4Nkw0N2Xhak0u3Zik1nwnqIwBkwKw?=
 =?us-ascii?Q?0g3/qLepOuUHaenY+Beel8YZEdgBOSmeOPuj2jNXCrVWeK5Ei6q/CQvCCzIA?=
 =?us-ascii?Q?LSI1Lj11Zaew1iDVao2G0yo6CgCKUcgpJ8l5ZDYvCK1voQNTjtYzDROfHqVi?=
 =?us-ascii?Q?0zljgykQjHWtEAMghbmp/9hqPo/JQRWbb0/lDBs9MHnYAvzNlGpEqnc8BiLu?=
 =?us-ascii?Q?hT5LV5EeCtNxta7qWbKuRnM8bEccb65cjdh9NLI25ITRVT3dfy21N+Pk105A?=
 =?us-ascii?Q?/4mE7hrvVLxHxGWysiKl8rBm2Olz3J+b/QM6jcLTS5TyRTpKUwbAjQNMAXCx?=
 =?us-ascii?Q?PKuHkhApFWoBIFyuvPSD0x/FK0JYPuqFtePN+mOBBrnxFCTUHuZ9MXNYsK3R?=
 =?us-ascii?Q?bXCZ/hQ1RZSOh9b1xH0bmz5aSDgVjOnz+4RAq1OzXVa0mAHkYLeRFYs7uRLe?=
 =?us-ascii?Q?KkKM/4CZg/qfMJDj2H0z75qh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649277ad-e545-410a-574f-08d9832288f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 08:24:20.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFMxhI9roMktrnNSvSMDFlczM/GBtm1QdHS1laOUrKclfbFUIZhzL73Bl0WZFc9rNSJwdAFshMQLzmcwGZ+9/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 28.09.2021 20:18, Rahul Singh wrote:
> prelink.o: In function `pcie_aer_get_firmware_first=E2=80=99:
> drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_parse'
>=20
> Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
> architecture. APEI not supported on ARM yet move the code under
> CONFIG_X86 flag to gate the code for ARM.

Like iirc Julien has pointed out for another, similarly titled patch,
"solve compilation error" doesn't really seem appropriate here, as
with the tree at this point of the series no such error should be
observable. Unless I'm overlooking something.

I'd like to suggest that when you receive review comments, you apply
them throughout the series. If you follow the approach take in the
other patch ...

> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


