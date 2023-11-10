Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200E67E7A39
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 09:41:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629965.982546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1N3S-0002Ne-62; Fri, 10 Nov 2023 08:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629965.982546; Fri, 10 Nov 2023 08:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1N3S-0002LO-0p; Fri, 10 Nov 2023 08:39:54 +0000
Received: by outflank-mailman (input) for mailman id 629965;
 Fri, 10 Nov 2023 08:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1N3Q-0002LI-Hb
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 08:39:52 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe12::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53b267f-7fa4-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 09:39:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9770.eurprd04.prod.outlook.com (2603:10a6:20b:654::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Fri, 10 Nov
 2023 08:39:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 08:39:46 +0000
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
X-Inumbo-ID: b53b267f-7fa4-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYTLiym4TFOim6IVoata7pXmNIYaDv5yDw2omInXWKlIguQGUQg9I5RGVuWYO1wVnjPi7NE8hPZNwNtb27GmaddKXJURlFmQEukcZi+LX6KoujQ8QF/TI5xpyudccU25+cN84ij/yndeVLSF2I86t/cUFt0gsgxY+jTMuOlQxrR4SztsTL9A45ng2SllGVRY/6iheQZVcx4Hg/5U1VURE38cEg72MFugHb4l4RUUl1CC9LOgLcVn2ath+zQhe7XgdgCO4+SmXw7pka4d4Juzov8roxf3KJ7jdMRcsYHTY2QYZipCVtfEz7UjT0aA3c0EZsXTYXfEiv5jyyQ7TatkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VA/MDRhUT/rDnENS7ezaXAuZsVISm+LSgUQlhipzdk8=;
 b=VNsoBiwhw8o3wmbmPoKfhrtjjkXghyITd4BqR/ihWRn6F9bbo4ZhzWB/Opk+cfGQMYPeT3LksVwzC/wbo6e0UtBZpxwLttHBNSi8Rd4AOYWUroiRXtXR4tOSQnqqvPJRqC6/udMPWeJeL59BSAM2v0NEZ61XPrRu4nQVsSy7FlMFw5ZoxBjiseA/z4H0OnNU9IFCLB7ljn//w9nC9E7/h4w78XWAdXBeVduiduRWt+Q5z6dpCag5bktXLnqY43hmI/D51C2xs/3FTUpn8an+J9DkdO6mUr1ETxKTEIHNE/Lcb11l2Qzm8VXZXb2vG94GC+69KjdV24x8SS6FFopg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA/MDRhUT/rDnENS7ezaXAuZsVISm+LSgUQlhipzdk8=;
 b=MiTOguRNDPpGJBSTLkmMIPL15kQDvNQLUs3fsR8xkrkp+9t7UE9eqLgVh+UFFi4K6c+hy1P+tdUyuBuxw82aOXFLQiJsINsLbwMlv197IL5lnryOOjG4YM/NxoQZe9CBACm4IifCiE/CMeC4sD4EbK6f5rT2zFIuenM1owAJENafwp8/NAGgGUyerxiOxM6Hl43v48BT+ZD9SXA6Ug3i7/hoiKgW1CDni8h+Vt7MA1W9jTyrgs2sjgXd47K5CDut0KZmP5ksA18xaSK9U7Jl2A2xlJNP1pxoU76tKpdn/EhTZgNOBuRuK/G0HWRiZvkMS2nn29Bub7WeJ57vyPYLHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa411ed2-b791-8439-e70b-2d728c173d63@suse.com>
Date: Fri, 10 Nov 2023 09:39:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/9] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-3-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231109182716.367119-3-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9770:EE_
X-MS-Office365-Filtering-Correlation-Id: a93ec536-80b0-4387-9fbc-08dbe1c897dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	klWUQlVbaeRyQ8MRVIrGYV+QmiU98JFe1qNUcpzuO0hqZXQx4adeGkWKYjPro0sesRoaRKEkNT1poik/FkrFk3zSibb4G6T0iww9koEufvG5uE9jxeiH46odLbCRXLavJyl/lerRjUlSymrUA1psKaPjZqeqn2QyJiS/q1DbIEI23TD4OlyeCpBQpzq4+I9JJB+rJNUWq9NvnwcaOkXs7Nmm7gBxLElK3rYBsi2PmlSQTXTC293kzB2D90fGOkkI1fwJ/p69gK+5R01qrPY/jgdOtTyvOrYl0uL5s8VcvL6z/tykf9o+lT44mOaXyP4pyr/ibAAitYUgSefUDB3VNyW32gZJqbI0prgEQDUQ9lV3/k1fyrkuzG93O4jm3RRR9ZphymxKY9VxgIljNU7AyRm8PZ7dQMqWXx3PnCweyimeu0R1ZAHIGyYUlzov9z1SBLeWvxbJCMlL3HaoRn5mR+v3ALU9E+QveYSobg1CzFG9de4CzecYlwLdUefuYq06Vz8PbiGGtC6HAohI/F64MoJgqjQZth5NSFpXzRUCK023J4GsSWGQUoB/SS4RXjdpm0RHLzp24EY5mNZhxpNap30Dp7SEpj1cGxCGL8cQpQpi7gDnZFQUA/m09q1nDCma2yfBCqRG4ns7ZLPO/gB+Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(478600001)(6666004)(6486002)(2616005)(6506007)(53546011)(6512007)(36756003)(38100700002)(86362001)(31696002)(5660300002)(66946007)(66556008)(41300700001)(7416002)(54906003)(6916009)(316002)(26005)(66476007)(4744005)(2906002)(4326008)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHJwZVRoOXhSRUJ2K2tDQzljM0Fqa0pOU3VNbTZzZFNKWjUxL1k4eXZzUjlv?=
 =?utf-8?B?SjUzdUtSVU11ZGE5Z1NkTjhUQzFuMGZXaEUrOUlteC8vRloxcFhraUplWkRS?=
 =?utf-8?B?MlovL005Tko0VzRSQ2lQbzhlUHB6d00vVTlLMlNwd1RFRzhrcUc2aHFHY2Zl?=
 =?utf-8?B?a0dUWm5sN2tIYUVQaGI2WDBMVWV4NSt6Y3dFZHQ1a2R5dEJrTzU1QUd5TWI3?=
 =?utf-8?B?NW5ObmVTdVU3ZDZURWxCckdwb1pKZWtsbWl4bzdGdkV3Mlh5RGJNMGpnVW9m?=
 =?utf-8?B?dWpoTzBJT1MzK2oxMy8wTFBWOGdrUnJGbGNVZHBWZjN4ZElXekw3Z3F6RTRL?=
 =?utf-8?B?aVlkc0tvZjNmRWppL09DOWNUU3VUYklZOENTZjB0NnlkaXlRSzFzT2ZNSlpL?=
 =?utf-8?B?MElUUTY1Y3BxY0d4WHhVTzRGYVd3WnlVdWx2amtXcXlUQUt3U0dPK3ZnV2Q3?=
 =?utf-8?B?d3Bibm80djVSUXZScUwyTUxtRVJCSENHWjBqRERxYWF5c3FucFIrUG8waU0y?=
 =?utf-8?B?SGNLSWZmRkpDMlhEbHR6bDVoM2UraE9tek1ndUdnNXhEcmxYSVB0dmVoUngx?=
 =?utf-8?B?eittakJzdmNUWldPMWJhNjlSMThHa1BQbGM2MjNxYzUwdGxMbEMyck1hMVJT?=
 =?utf-8?B?dTQ2d1dXYlhkTDIxUUZ6RlMwRGgxV0dkdmdhaEloVEpCdDZlVU82aE94SzZz?=
 =?utf-8?B?TzN0MHduZWE2dFpUUWlONk1Eci9TZERENFJEV3hwcGRNQUtncVh2M0Zxc00y?=
 =?utf-8?B?blduV0J2K2FlZVFLWWdsbTlQWTZ5N2p1ZkQrSjdXZlhVcnViUC9kb2xPN3VJ?=
 =?utf-8?B?UUhBYTIzdEZVMTI2a0oyTkVHa0VwZmpNRTNVVTdCT1B1V3haTGo1UWRsVDFj?=
 =?utf-8?B?WVFZWXVPaXo1cFh3b3RURnEveCtMS2ZlYytmSms1OWlXRlpjQWl0VVZpTkpR?=
 =?utf-8?B?SUZYb2M2NEJ5T0VPTUVRUE1KMXhqZytCNWpkTDNFZ0VTTTR1NW5jcHpFQ0dr?=
 =?utf-8?B?bTYyQnpiQnZjR0tCNUordjA4T29CY05ZWk5kMHlYcjNvazVKTVd3NmRQNG0v?=
 =?utf-8?B?UzgvWWxZYXZmbEhXU0oxNkRCN0VRemhnNmlRR0VQN0NOODh6enQ0emgvcG16?=
 =?utf-8?B?UFE1d3FSZllXcGVhZHpZSHNkd2lvOGxjWVlHT1NXNnNhNjg3VzV1V2lvNWZ4?=
 =?utf-8?B?VXBqSFk5Y1p1d1p0elgyMjFQOGE4UDdtaXhzRi9BOEhmUUE1VHhsaUxQOEFU?=
 =?utf-8?B?MW5RS3NhMjF0VjV5VmYwYWFMSkkzVGthSzlZdFEwUjlKSFYvdjZnYmk2eFFy?=
 =?utf-8?B?U0w5L1NXRGhENnV5U3RDUEpKbFliTXNxcmd1S2lmRkQ2dkYzVnJhZTNjOW1n?=
 =?utf-8?B?bHVBL2VIdUlTODVSdm96Y1Qxckp0M2x6T2s3NHZ4aDRKYmRqdW1scGxzQ2pr?=
 =?utf-8?B?b0cvMlR0VjJoVmZBY3ZzRUxGYUJVSFZGWjhhOHM3NjZ4V3JCWGtMWW5EMzNi?=
 =?utf-8?B?NG02R2ZKa05ldVJaUnBoL1VtL1JOOGtDOGViR0JJWGVhUmM5Vm1jd0hUQVF0?=
 =?utf-8?B?K3RmdFNkK21GQTR4ejgxempLbmtwTjV2UjlsQVBBWWszU3JxcjI5UzFQT1pQ?=
 =?utf-8?B?dk4rSENCSzE4VC9zSElGakNBWUI0RjJHUm10bGRtdnkxS2RWSlErekdEaVVy?=
 =?utf-8?B?RnhuTVZybVhMRkdYNGwwRmh2WnpZRWF3WWdSbmttWkJLTnhvdHd6TTJwMzFV?=
 =?utf-8?B?ejdhNzNielBQMWRJM002TnJhTSs2TjFHcitycFB2ZU51NXVNNkFJb3lyUDJN?=
 =?utf-8?B?d2hsNjFXNEh3aGx4WEtydkRraXViNWZ5aUNwVlpZRlBlTzJ3MzU1bkovT3RI?=
 =?utf-8?B?TjZiRjQzb3VCVVlkd3pMeFZkK0Z0ZHFFRndBbzJQNS9LbkNGOXNQRDhLMUFT?=
 =?utf-8?B?TWQ2ekxWd3VQVFRsaGJNMjRrUTZycysrdGxLTFpqMTlFMEZySVNKUFI2czlh?=
 =?utf-8?B?TjJ6TGE0a0pqYm1HUTZhU3czS3ZrWHRrYXBabm9XQ3FNanhHNnFXNmlqbjdH?=
 =?utf-8?B?aUV1Q3RqNGp3SHNQcmxuTnRmeWdGM3RYUUtwYjBOUkJOWHRFNDhITExYTkt1?=
 =?utf-8?Q?aq+XAWi0GZ5w3pFcWA4kqBitU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93ec536-80b0-4387-9fbc-08dbe1c897dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 08:39:46.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rM31DsVqr2hBZO/VR3MlZe9pzG1x+O3dOTNuPgol81+5MWSthAzsqALSStAYKJWLacpd82tVzSqvitz7muCvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9770

On 09.11.2023 19:27, Stewart Hildebrand wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -245,6 +245,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   */
>  int iommu_remove_dt_device(struct dt_device_node *np);
>  
> +#define NO_IOMMU    1
> +
>  #endif /* HAS_DEVICE_TREE */

When looking just here (i.e. once that was committed, when looking just at
the header) it is entirely unclear what this #define's purpose is. My first
guess was a bogus attempt to escape using some CONFIG_* setting. Looking at
the use sites, this looks to be a kind-of-error-code. That wants saying
here in a comment, alongside the scope of where this may be validly used.

Jan

