Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3351445681
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 16:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221652.383465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miera-00027g-7P; Thu, 04 Nov 2021 15:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221652.383465; Thu, 04 Nov 2021 15:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miera-00024f-3O; Thu, 04 Nov 2021 15:41:14 +0000
Received: by outflank-mailman (input) for mailman id 221652;
 Thu, 04 Nov 2021 15:41:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mierY-00024Z-1z
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 15:41:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2745b0d-3d85-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 16:41:10 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-SKVcAAQJNZmzf3DAtTQFog-1; Thu, 04 Nov 2021 16:41:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 15:41:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Thu, 4 Nov 2021
 15:41:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR1001CA0055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Thu, 4 Nov 2021 15:41:07 +0000
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
X-Inumbo-ID: a2745b0d-3d85-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636040470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yoCaEg0C3Fg1pJTSzEB8ER9mwM8qGYZjmRopiTyZKmY=;
	b=YCuCz/BfKWzZ9RGno3iW8GHenu0ZfucLGnlnEaq12QnbNiJW/vZ8AXNao8JthaQ80X/kwt
	OTYj5Vl0+dCLZJgs4oHUHY/UApAaxXfAZr8unIlzbafKFfUY08B/fq+zIpcQFGPMDF5HGg
	tAlYoedSh8Oei6ohZEcjBwOO7XGu/xo=
X-MC-Unique: SKVcAAQJNZmzf3DAtTQFog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+N0BJsplrDoO67zNZdTwUBPxdC7Z3f6AM0/Aaq+4aDzGGx7MenLmMB7G+Wa3j2/lqorcXbHkMMkoYRRlkmAqxokAW3LO8XkyZmB5Ul0XGcc76xr62nkxEtefLtvSNfTBd/YGWQK6mt0K8TuUAlda6Qvw1Y5F/GhXbcFjtvlqMZgrrB69ti7e3kT8vRupe1ORtTIite1o3PMpR26OFHHNw3yh1uXg0bZnDhgHbZ2U6RgR2zt3NOPiWe+/Btd1e5wQdFOrRdXCdfEsB6iFxQc7UK2e9gOPn5txQ5QS/94O06fCtwJH107f/qjrfToYE2XKcH7pT7lcXSPZTWYsB9j3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkLnCSa4yT7YYJx9k1XWUf7ff4DEuuzTFJCcqDj8Wv4=;
 b=H7M7mTxsR2s1exjNZ/W8GFVBo8bHVIwwEMgRfMwJOU/aaWVYAhi+FhJ0DwTIeEfvcXb4SFIbLvYUoSfc1Y8A4yqpnr0RWWN7e7TxZLHoGlDg4tPj9KJpaMmzz+b/XMQTEtzB7yvaoUCFr/RGi6xZLmP15QmVtzvGtwmVs1KbIaFEfCKj8+O8hZlj90AOg4m4F9EcA+PXDatWK4q5YWSPb/VMsbpCSkz8rOnn+4PtCaDQCDdlxImDnC4ATD80uhM0T7RH0QWDNPKhk0UgBDILAhEx+/ZJfifOAjgOsMwtlPimH+TAj0/6TPscoCFymscXA2Q1JxSIU35912RDzAhQvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea046172-703e-002f-8e12-c579d5067b25@suse.com>
Date: Thu, 4 Nov 2021 16:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH][4.16] x86/x2APIC: defer probe until after IOMMU ACPI
 table parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
References: <47392789-2f10-9de7-036d-b2345a24a028@suse.com>
 <YYPsT7wp0aWZapHU@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYPsT7wp0aWZapHU@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 754857d7-1542-4825-5c77-08d99fa98500
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384DF37D5F3E4A259656FE6B38D9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s1xjzix8GaEICSwkiiJn89Hz4uGNvxbs218MbhZ00E+Ad3TqyQATx9W76lGfrTsfwNHInJaiCKgulND6aPBGuQDEmQL6ADDnclCrdDePMg0x7Jii+tGLYfYTQ8IimcddUD0R/tLJzgRTn0qov/autypf/rLTYber5FwlRu6Wb5YPztW8krXRmWJIYt7Q2JRqo9ViLdru3YKWzPJBvlg2LBWYPonQ+lGceQd32m6viadShXn8NOTGMAmEzQy3OkTWMZ0EF7vIN7qKAQnTrLS7HugroW0O+gG6vcfardCSaMl1Xk+fGW8I9XD/i6VPlm2RkNFEHJZUwvVOOit2/YYFPE7kakOqLZeBGOZHfsc9k2oQfSPmslcXxFO3Lwrpt9VgVDoAT4iGjUMxqA+FlhYk0PAdZ5/sNqS8O+4hRmfPMyfz4VbFeLeUgasM9j76uJkARySncie33Az2i2ERdReNSHB4e3LXjA7NNRzsb0aXXWj+iVfp/mVr3ZzhZPwdBFoig5JD6FfC3bj7Q7WygFFKxbFY3aAw0MyylD0vu6p4xmqMD0VFalW4FXEhqlhKPvyL1nzK2efoexN5anZBsOm/TT7hL5zaGoL2LGbhURVcmHDTpndHNwmE+tcKQ/BTNRIJPiUTu5EdPNf80a86GFaW4t7x8/LVuqdR9sNb1l39AvUcGPV4Cc/lS2CVntvQ3l+AUsyyLxh1L41IDzHtKmUvxsBzRtUFVFLNCDVj69bnjTMdvpYEzEiwFx2xqhEpWuMU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(31686004)(36756003)(508600001)(53546011)(6916009)(31696002)(66476007)(66556008)(5660300002)(2906002)(83380400001)(4326008)(8936002)(54906003)(186003)(2616005)(38100700002)(26005)(8676002)(86362001)(956004)(316002)(16576012)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bueyCv6/xjnxFOzlleXQMZe0jQq+WMJaZ3T96VQF8DY9TAdvjsczfA1SXTMM?=
 =?us-ascii?Q?JUFLP06+fNINx8JD5L67MT8vLP0X+35qwbnsGwQZ55O/AdwGbGnWlBUD93B8?=
 =?us-ascii?Q?YO/Cb7s2Z34I6gHz+/811cNODONNZ6g07Q9RnCdc9X77gVRLUJ/wbJsK3z4U?=
 =?us-ascii?Q?tZ77J+iSHx0ACVpOCQKDRBzWQMCt9j44RsM8DASpEksPebCh4hVyjHk3tY5n?=
 =?us-ascii?Q?VEUqbWfw6e05qd+Y9oRYQh0l1X4fWM6sr+W7hc01+8hDP97OTR9ar2IxGAeQ?=
 =?us-ascii?Q?z30j/X80BtjHHhOCJsPthgSTN3ip0nn7yU4kinAqFRjExOYsXMnjiPcp6T5w?=
 =?us-ascii?Q?2L8sVBPGcWWLHKzEMRV9mv+gGGsw722u4oXqSZ9ET0x3tbT8RWB5wHlLxbgM?=
 =?us-ascii?Q?w4VbBiK/EjhGJ9wk8xcV1eWDIV4R8WJ+ikcm1xjH+AXZVHltxrKUGIr5Usdw?=
 =?us-ascii?Q?dBDX2+YBmWvetthHB0n6Ixpi35LKxJD/wZlsL95mpH6IeddTVDSgRqkF/ct2?=
 =?us-ascii?Q?TImo4g3VepVZpmJk7+gK7sctABGmlQAhkTrXOh5IbTL9gBlDvpugoj74UX1P?=
 =?us-ascii?Q?omNTYJDAU5+LNTjt9Qc+yaBgaBBbYnWg9CoGl9OMfzFTbnM07VqJ7HAptCyY?=
 =?us-ascii?Q?I97vLM9AdH/SYAlNoMgEsotB8Ix9PHiFG6eJuB3WywwURl4Sujc4Uw7HLGQp?=
 =?us-ascii?Q?r3nFRrAWdWt3QQ1SjNJTRPfmJ+9jGKJzsIsjKAVlsykDbWT2kiV5i+206e6e?=
 =?us-ascii?Q?u+Slgo5l4bP1/gl6teqhLeZjLqEiaLMqgxmv9C63+LrjxszP+cEp/6kXBXEH?=
 =?us-ascii?Q?Yu8RF6O+ltyIZ01vTtz9HV969B0X6lULajVln9M5YzweaP86YKix8MhQfVTw?=
 =?us-ascii?Q?7UWhmJhhs/kUrwCyOyn6LwqaiVuV4GVgq58+1yzsnsOv+G+KWDIUPZphXbb/?=
 =?us-ascii?Q?wi1zEw9L5z/MtvkEbGpT7ZY/bYNehFgK8BuxDlnlXUBiMVaqdXMI9FdpuAkE?=
 =?us-ascii?Q?fkbtG/OIq3r4SkmcPtbVeCSpbMnzYK4EA2jP8nSlfSExP0J2GjSYGP3M7Zbh?=
 =?us-ascii?Q?F6G4iuzN0AkSpW0QHdUFja4sYPYgTxs9NBPvEJ3gigbOJe3m6Sjhv+Os2M2B?=
 =?us-ascii?Q?uZoN4QWgxnw9m+zgSpblhDc+Yk6ht3yyllkDr6eGvknNVaaaBpvCKvZOBwkc?=
 =?us-ascii?Q?yhK2GqRgrnX1O6iEW29rf7ttqSFbMrK3fJYqTvFG1YzVWQSyVjVIelnMxmb1?=
 =?us-ascii?Q?6DpWU0zEdqr2MtFHo+NZScnMp5Om84l++7hhEBPmHjmFJnhrZQTLuqfPrb4s?=
 =?us-ascii?Q?U+uYEjiVTF/jpm3JH9GDZryF2IPAz9109kATGdDv07JTcM8xSCcYCJvTC4xu?=
 =?us-ascii?Q?sLhPlC1neZF8UL+V91J6ovQkPwruQStbNuPhxYvRlc83cxWrEz/1r2pAWsfn?=
 =?us-ascii?Q?RRvLsYpNwvTDLg+Qe4Qe7EZNYv6dq/K+2ZPgUjossH3wfT7Mba0czYdoQ8Dp?=
 =?us-ascii?Q?6htdJxVVcGCS3snk3a5jWaJNRYkf2A98nUBw0xCpBDN3Thf6wLI2yiwD/kq4?=
 =?us-ascii?Q?uVWlnpT3jgrzpnO4FOVTmzekFpD5i8Jqgs6F4s52Og+bOlGaY4v6Snut1MeX?=
 =?us-ascii?Q?+9mlirF0DO0mgOdYK546HI4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754857d7-1542-4825-5c77-08d99fa98500
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 15:41:08.1497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDBKs0Z35l5KEzoI7sPF2jBMNvCf4ZjK9gztTPKQOho7TY62EZzYNJMre21eIynQfVLNPgePY0ItYV5MXedPdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 04.11.2021 15:21, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 03, 2021 at 03:40:55PM +0100, Jan Beulich wrote:
>> While commit XXXXXXXXXXXX ("x86/IOMMU: mark IOMMU / intremap not in use
>> when ACPI tables are missing") deals with apic_x2apic_probe() as called
>> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
>> affected: The call needs to occur after acpi_boot_init() (which is what
>> calls acpi_iommu_init()), such that iommu_intremap getting disabled
>> there can be properly taken into account by apic_x2apic_probe().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> LGTM. I cannot find any dependency between acpi_boot_init and having
> initialized the apic.

Sadly there is, and I've now learned that when believing I would test
the change yesterday I actually didn't (or else I would have spotted
the problem that I've spotted now), and instead I did boot an older
binary: acpi_process_madt() calls clustered_apic_check() and hence
relies on genapic to have got filled before.

I'll have to see if I can come up with some variant avoiding the issue,
but I suspect that's not going to be 4.16 material anymore then. My
first try is likely going to be to simply pull out acpi_iommu_init()
from acpi_boot_init().

Jan


