Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D649D4AD52C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267897.461656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN6W-0001dd-8H; Tue, 08 Feb 2022 09:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267897.461656; Tue, 08 Feb 2022 09:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHN6W-0001bm-48; Tue, 08 Feb 2022 09:48:08 +0000
Received: by outflank-mailman (input) for mailman id 267897;
 Tue, 08 Feb 2022 09:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHN6U-0001bg-L4
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:48:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b89ef6-88c4-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:48:05 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-mQC2Y_7pNEypQJzJRbTaIg-1; Tue, 08 Feb 2022 10:48:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6558.eurprd04.prod.outlook.com (2603:10a6:803:11b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:48:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 09:48:02 +0000
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
X-Inumbo-ID: 36b89ef6-88c4-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644313685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3X14j08nir1L1vwZexD8I0I8pAJdzSR84jrvsZd40Q=;
	b=T3pPr91N6MZHfVWQLn7RPVAqSQGzQYL6XvcrvM7Le4z5/Sth7FDH+jZfaDI6UTZd2mnAmP
	+NFJNHYpBj8Hvtz2j/lwV+X9WOMkTdsO95kxVjjwyEJYCHD0kKyubfXf4eQ2nwktRqIczH
	jg5Mwa4JR4HwWJ4MI8/IwlO4cdNrnag=
X-MC-Unique: mQC2Y_7pNEypQJzJRbTaIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CF3iqnVHKWhqTLvU9SJLiga69w8PJ3lBnQ8p1XSJcThZe31T4FQM6sPZS6LHXh4aj+/GldbrpFmCnO1dACv40oFRuA6Eikk2UOv1krl8apqwYsqpdl4DE7ALb7X8dRpP0IQlpBSlUI3v1X4Ky74ScBnV7n7D9m2QPRQBHla0Qs6qnH9XyNYnaf3SdmgGkCZanmmkLPhDRJJnTYn6vnE4/kOiZ2QBbPEqxioTEaT+BPmE2RJtgH8gjgcSQf5D2c8IG6s7LEjnrLGrZzIhMC6mifmiB1eeSOHyODv8XWuYJyHaxPzpvaiQomOqfhQYXIZ0A/bFcwvmGl/P7MMJbEn2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMCNwo8UOrbIlwP7L8+4ukTLhfXLpoJj/Xl9xyg0R5w=;
 b=RyL8M9iYFHjI9KDGCvSA1sIMPZiaNMp8yO+fpz0OpnnYviXwvXcjR7qKel8BJrdoxr/UQEy4gpLFhE3ct4ttoBt3E5VlK9uWizQ3roVgvMQOWFCOKfVXlIvGCXV4e3gJchbUfJx5/nuebQkopOzIhS6zeSsCZrhXV1434f85WtEhtD++dnkfW38C4gTwvq3cQzrN/nVJ+YduMQUnJRHUiEe/USkm1jYBvuhtB0t43FIMzcaohAcsvp38flwBNiI5zWZ2S6Mam0mJvUr+Zgb/0j48EVkwVpBGjDjxTW8mKyLD4bRSjAZA8bSdH5AZPBik+BmWGirjk02bBvNGEJ486w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
Date: Tue, 8 Feb 2022 10:48:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
 <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9baba63-fc8c-4ab5-db4d-08d9eae81922
X-MS-TrafficTypeDiagnostic: VE1PR04MB6558:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB655846884287B72EFAB11DC1B32D9@VE1PR04MB6558.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JREW4EYB+N1SiozW9CiApYPeZnu93GBlMHDpBNH2HvySwzD+BgcfcH587kxr80LiQD8kEDUhbw7S+WWpRhYLXeMqkheGkapMlnJVsuLmrX7WHAK3k0kP3bIknZSXrvM/AKfMfUSiba/gShjWEgAvUgkJ1EDCt08bauDrs4Qax32pI+x5SS65mUbDkCpDiZLvp4Jw5Oib8f1YvgXRB06dG2QRaOaRBez+eNGgxpJJak4AVGFVY3t4TPLbNezTjXjTQCDgNFlS1kBdF4Ngs1D5grV5s4XopwUIqfCN1VjBDGWKNYj8ev6f1fX6HWZz7BJ1R/b6hdIv7T3PRZDGb8oEfED3ulG9CLZVApnrvUqWb54owSf+59f5AaD7IADJAeGlgQqipZeoAg7YCGUZUaQzx6+bOPbUCI/WWPb8yzlfqMNJAkGNTrtJTARbPhD2JMzMZNncdWIJ+56OLGd1KsGgb7J/QYxo/OElpMeh20yBwv9LVc36MbKhuzK6O8d+PdDS6PaClceqwLV6HkwCWW2BafAsVY6yn13C217sqne9V0Jy9zDyFWkgwiUnk8sJgar4drpFsbkKJiYSn+zZWoqs3eW2tnTUVuHJgcnweWlZCl3FIY4JO69y/0f9oONHLBF3XcaiDuiIuhB/2GRlYrXLHlv2r6ghX55jWcyuYNXLdCa7gshS6gFVcHpTL6BuWpS7blxeoVkrTAdGk+baDVV54iXijxFEv3qugiohqny3/14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(83380400001)(86362001)(66946007)(66556008)(508600001)(38100700002)(8676002)(8936002)(5660300002)(4326008)(54906003)(6486002)(7416002)(316002)(26005)(6916009)(2906002)(4744005)(2616005)(6512007)(31696002)(186003)(6506007)(31686004)(36756003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m8jITvi+sJAYrPbbqfciTjwwyLsCOv8O6q0V2jIz5UtiFAKyjytRG8xzU7MW?=
 =?us-ascii?Q?EPmerVFlQn9l3sMc8u6n/ohYlYlzNJitZour00C+EBBJfOW9cbMveR+oka4Q?=
 =?us-ascii?Q?ttnsrnBZs1AXCWg7lqh0XQIftPUfjJ8KbCDpN5Ya6su+mWW2trFranCekCv8?=
 =?us-ascii?Q?xZYNMFcPaepk4W5rz+RoiCLC6iz3o8MsflXUtI77Zn/1CQNMMeedd6qefgMo?=
 =?us-ascii?Q?jm0dYgkmDSD2tMxBPBUFt0gwkdNdgQD+ge5u9BtZtRpfXhnV7xgmFy5gE5Lz?=
 =?us-ascii?Q?Mn8jEpbs28AtjWdpX/rvgkZsX68F4PWFqWn3VVqOkYMPsCBD2TRvhhe61qOe?=
 =?us-ascii?Q?fFJAHE2Q4zKelPwIgmTeDHhw0tW2GbT6xojQ4I1rkh+e5OubvDsjVlID8Fdx?=
 =?us-ascii?Q?4paFhFug0WYBQnKA4oFZhYlUtqGaWCYUaR3P6GSBAIIUQvgwe0ScIix7juMJ?=
 =?us-ascii?Q?GExYYA9TJpTk+q/z13lTejroBsoWxn/uRVpq7Oc8eVYWOyxR/8U43+6DCTNo?=
 =?us-ascii?Q?w2VRGwXqXydNBDtSLqlX8lr7vt3aj2EJ+30Elbl/e7ewr7ItvQ+RxOMGqRB3?=
 =?us-ascii?Q?J9ywQk6uKMY7YuaovRYGR5yndoQbUkQyp08LriE4+8Gy5JmWJ/sCj1eFpORp?=
 =?us-ascii?Q?SDhmEnQpkSNNJ7foz5YtoiOl1hsd9TsGSpPhB4CWKnZAMzCo8qSwalLPuYHc?=
 =?us-ascii?Q?poeM01WOzuxl6PSWzmjlGDtknVFU9Ld/FGd+x6d4dsGLfAngK1Qznd1rojfu?=
 =?us-ascii?Q?dbsbcXLOW9Gr+dhhAef2eaPujOVu69UUy/mMlwV8Aj1FaY8LRsSBji+Gnrwy?=
 =?us-ascii?Q?d+EshnffkgJXJvk9lo07rzX6M5GkcC0oIaz6skvAiRF1kKwUZM8XaOb7TAOF?=
 =?us-ascii?Q?mVjSgvS8RXMPTapWafve5DUfa3dJYYqDkPet4jDUT6dzQi19V8zCdBIkr/Eh?=
 =?us-ascii?Q?Q3f0mEHLAODp90YY1XCA743ATX9tBcw3VNUCu51XqzIzvPpVX5u8dzWTonxb?=
 =?us-ascii?Q?1pTiOeDRZtzlbdT2XgQhyVS4kxB1/KpSxGZ1M6XWFqCGOrtdye+uoKCsLlWI?=
 =?us-ascii?Q?DK0QRTOOxDtZRhFCCtPc3oDFYTHtS9+s22rSHBTq5QLFfZpcS3g8ZAk1CZCi?=
 =?us-ascii?Q?AKEq0BulHtmU2fKXlXbFu1kF+MmPbQ6f6M+mU0ad+jBVlFJxBpm4U179PzOk?=
 =?us-ascii?Q?dI5K+x/5Dq1/a8h0f/oibHTtOdPGyR/Xi0neA3DgnZI4h4nqDmD9Yxb9Rc7M?=
 =?us-ascii?Q?n+6dVtpwVI2EkXZVQIB6oax5iHeOpVAPVrAGPzMe68yYzAvkPvugRD9hc3vz?=
 =?us-ascii?Q?ij4dpONryDJwi/qsj9Z77wZC9EHlQ1RnNCeWtYIMvrSluHLoQCxO6AdkpWzB?=
 =?us-ascii?Q?JGugSyDN5RNojkADzIMcXLwPPV77XvzqkTpx+0XmnrrDA6r6YxMtal5E3sCU?=
 =?us-ascii?Q?gpXrqz0enxCTV23MrFm36IsrfN4cNKJJBuVLfNCAinvmmo0jHfocBOpXityd?=
 =?us-ascii?Q?v9yp/LMKicFRK3BQcw0HBNpAAeVKr1htF/uha/cJevFN+211+iTuMkSj5KTQ?=
 =?us-ascii?Q?rERX9QwS84wppfitkgmZTKI/Oat9ZXv6CdvTBleyqLTisxizD7Zq1bDTfNqB?=
 =?us-ascii?Q?b+DjYB9iWUchYXjZK5U+qj0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9baba63-fc8c-4ab5-db4d-08d9eae81922
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 09:48:02.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFDrWDCApF1vtqrawRFgkB2d4HC1k78wmO74O9NvrnC9MhWE7/AEiuZsPHTsYMvH4rirh84Zxpo4PEtoBW/2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6558

On 08.02.2022 10:31, Oleksandr Andrushchenko wrote:
> On 08.02.22 11:25, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Feb 04, 2022 at 08:34:52AM +0200, Oleksandr Andrushchenko wrote:
>>> @@ -516,6 +594,11 @@ static int init_bars(struct pci_dev *pdev)
>>>           if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_S=
PACE_IO )
>>>           {
>>>               bars[i].type =3D VPCI_BAR_IO;
>>> +
>>> +            rc =3D bar_ignore_access(pdev, reg, &bars[i]);
>> This is wrong: you only want to ignore access to IO BARs for Arm, for
>> x86 we should keep the previous behavior. Even more if you go with
>> Jan's suggestions to make bar_ignore_access also applicable to dom0.
> How do we want this?
> #ifdef CONFIG_ARM?

Afaic better via a new, dedicated CONFIG_HAVE_* setting, which x86 selects
but Arm doesn't. Unless we have one already, of course ...

Jan


