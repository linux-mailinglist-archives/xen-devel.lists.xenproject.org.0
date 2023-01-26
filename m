Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E7E67C6A5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 10:09:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484847.751687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyFa-00021R-Ps; Thu, 26 Jan 2023 09:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484847.751687; Thu, 26 Jan 2023 09:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKyFa-0001yh-Mq; Thu, 26 Jan 2023 09:08:54 +0000
Received: by outflank-mailman (input) for mailman id 484847;
 Thu, 26 Jan 2023 09:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKyFZ-0001yb-Kz
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 09:08:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce6631e-9d59-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 10:08:51 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Thu, 26 Jan
 2023 09:08:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 09:08:46 +0000
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
X-Inumbo-ID: 0ce6631e-9d59-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB0sYNfFOrFzxdoHaH4DfaWjmX8FACGONScwucrBd0htmFLkAmcU7JqWTPwL3TPJ5rKIKUBiRnf/9IIi7LCS+U1AkPM/q2Bp2/poQOPR4KmUTwS4M44mcNqGxYINyN7+X7xV9xn0QklhU6fVzAQi1DQkUNpzssDa4UTzpJ5h5B7+GlsiGVHJD6cMruJvH+XSOd+4vJMPX69BFxOTqMGXsGH27XtMwrbGhUUzxwQV0YGI7ld0TC+WF0EiqtgazdQ3yuE/kZmGpcmqFk/+JGFPwujOKAw7wvmoiAX9o4RupmIbqk5eaLmj7AV6RyoCNLmbDjuMRsqaFWRjv7TZsKN13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RiI8QZcCWBDagvCxjm3/OB8m9mvzCFh1dM4+LmAZCk=;
 b=dvTnxYXeZZGH0NOmgz1CyenNhIcKx2uSxTc/88GrcnvLaNL/QFpUO0Hpg1nx6tA5PMo8CJHq51GO/YA6xBDFdcf33OWUXeBDOzTSEYSGV8HrM5cGVO64oSWYo0VXz3HpVqAZEzYzWWNSNPSqJlq3bNNE8hSg3Rk8acaEq2dh3Ayen39kO4n1Ja1SCktMfrGwK5tTgvE8v/zhBqZpcvC7ofKT4o7unw3cxFwPiWE/gqg7Zmkh06zFy2hNJ9cff6Pen/qfYKhO8poKWD8UvHQypc8PeFCG0fPKJSgGajvlVCtn+nMn5ITB6goQt5H+k6lqTwqdFAsfS5iWG3kfwoU4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RiI8QZcCWBDagvCxjm3/OB8m9mvzCFh1dM4+LmAZCk=;
 b=3nWxqRRs5gO8J0TraANDbye+TV6/0XjjFZicnMo4ruGHjDX+0PM11iAcpGpwMza+oT6dHdzv5YNjBdGtOoFZvlQZPQesLUI95Hcli/WyC6/MXJn9esvR1KLyVzhnFYqrDDQEk7KpxNncNlxnnYMKZBMZdCFsWVhlUbyPJj8rA/ZUgOR4Vt1nWaJnmzfxOqUwR69yYUVU1b59rwwI1/zifizgDR7VsqUxQxrNHG2teWJAOtIvQgBO54OpLDPuU3TMjAgyAi0ZaoimDHsDs8r6IPEx+ODRl10KoxPFPSGc4nEp2T0JNmWoCrMbpXVhPDaB0wl3QVX4WzvKjMHWbVWEZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
Date: Thu, 26 Jan 2023 10:08:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: george.dunlap@citrix.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230125205735.2662514-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230125205735.2662514-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9280ec-288d-4722-4adb-08daff7cee33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E/FHT6nTtMybwU0xG/d9YeLpvKjvkyEBsl5RemgO3HhkVg2fdh24zo5OHa9ePyAyPZQpgonKbGtKPUPB0r7mseZGZ68wmqmclNUps6a3Y+UfDpXy04ak7eWBd56bkVXfJ5ojjnqdcThqBG5TTPp/6Zz6NYl+pY5cz9c8hrZtXiduWaPL3mc6G5U2Kj491zRW4xjsCMRcm9KVGarrMcDDHSrO18CdT5Jy/m/GbUTailI+m+Plur0Dv5bAZYRNOABtojYF2H2csvcgws4k6VgMj2WzEQVMIuqofZY01brlK5jH73oUFokhdbgTBZaZpxggnlunsugAC/90xpOIIqP1RD0RJ/WLWUmc8PoXChLuU0x9b/uFp7gZ9mEFvdlC0GNk7WOTBLhHqYA3/RxY7T4bKBfRyhuvvxFNrItjmHJslD1xbKLKKQCwBBUellFWepW8UFqpBRi2vq6HSfYHGFWUCs6djqx91o1BwOqawOhzlTU0eJJy4QTOQQ3DPrTaHNgRt5lDoxOsRXq5XSOHdVyjF2tW13r4tBgiHCs2CrERvad6Z1mbGL5zjf5Bfz3X+qYnHLW3Dzx8IDvStUOEq4fhwKeT+RnQh8DCjSFf56IFZB0/gHPLDXWDKjE4oRHpsVmt79L5Rwfir+O1xM9UfgyEGdtDNnTWhcd9eSN3Pr9Zep7p5p5pD/J1u7TtdldXPAcGnluwO/wQDcTvVpWCiHRAM9rgI2wd35OSZ8I4BLiF23E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199018)(4744005)(31686004)(5660300002)(41300700001)(8936002)(2906002)(66476007)(66556008)(6916009)(26005)(8676002)(4326008)(31696002)(66946007)(186003)(36756003)(6512007)(6506007)(53546011)(478600001)(6486002)(83380400001)(38100700002)(316002)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUs2bG13cWRmeG9rNEpxL000Y3hmdnhQTEtRTU93SXBEbWY2T0IybUJqQm5u?=
 =?utf-8?B?STJOUHBJTG9KRFpBdE14aXVxb1V5Z3RjSnNHZU1NU0x6UGdtQmlkSE1YTzNu?=
 =?utf-8?B?aVhkTFNycEpNTkNGNi9hOXFTdnhHN09xOU9OaGRkUThzbjhRaDlaa1U5bjRz?=
 =?utf-8?B?VkMzUkJPMGUxRWFaSHFwZ2lTOThKbWU5Slo0dk9NS1hObjJieGF2QVIzNTF0?=
 =?utf-8?B?RTZqMG0zaXVuQmQzY2Zzb2dvblMvMFNONnV0bFRBRlhxZDN2eS8yQTFHNXph?=
 =?utf-8?B?ZmlnU0lHUTA4VmpUYzlqNmZrNWpKSTVWRWFlbUcyd296MENFWXgvR0Zhcys1?=
 =?utf-8?B?S2pvaitCMkFOMUJ3eEppZWJOVWVmK3N3NUVUTlAwU3BrY1MzMFNsWEtuajc1?=
 =?utf-8?B?eml3NVNtbEtrS285MTljQUZudHJvMGRseUFrSnh5TGF4VGFEZ0EyMFF6ZGtH?=
 =?utf-8?B?MlQyak5nODdPUWlNU2JlNXoyd2Z0QmlvcTVBc3EzQ0EzMWsvOGVBZTdhaUtP?=
 =?utf-8?B?M2V6QmhoOVhZc3F4NE9XQ0xiSmZNdjdvemNWT3B0Rm1CRlhZYjNlMnNMK01Y?=
 =?utf-8?B?bXI0NzZDdEsweTJtejdJb3JCdWhMR0U0NFdrNUF3SU5wMUVySjhtWlFOK29F?=
 =?utf-8?B?dXJqenVQbk00VFNXTFJsZUFkcW1PdFNLQk0ySkdzWm5Ia3hnTVZ6YVM2dUFH?=
 =?utf-8?B?enF4QitiMFdEd1VkUGtEaVhPUmNXa0pZR0ZpVTE3RWY2V0QwUFo3VE9QemNI?=
 =?utf-8?B?cGhpRTFkN3VleHAwSFRpWFJlNkJYZ2h1Zk5ZWmtrd0hDSTRDQlVmV2RmdVdG?=
 =?utf-8?B?cS9kK0hsd3RpdzBaRjk0c3ZkUHZrc0d1dldteGJSUTE3YW5xaTQyUUphWFpQ?=
 =?utf-8?B?eGtwL0V2Z2Q4WFhVNGJnY2llMnRPNDZIMHlMNm5vbDRHNDR6U2JCSGw0Vjcz?=
 =?utf-8?B?TkQ2djlINDVWQXlpZ2JkcCt6RG9MZDhSSTlpdTh6OTZkdFpoMVlsR3lVWnM4?=
 =?utf-8?B?czRiU3V2VzUzeElzalFLb3d5eEJaZXp1bGplT3BySlh0R2RWdzZ5ZG95OEFp?=
 =?utf-8?B?cWY4TndCam5OY2JOVGFOdVlHV3dTZnZiSXJaR2RIYXpTUnZTRndpVExIMDBG?=
 =?utf-8?B?V21pTkE1b1hCTDVEMXdFRE1uL1hBb2pVR0ExR1g1OUN0QTIzYjZhYW5VZnky?=
 =?utf-8?B?T3hvSGZkRU5FeklNSnJ2U1VNWGVSd0xWYWF0REdlNldrWTM1eUdpN2xpWG9k?=
 =?utf-8?B?RHhjQW5URFNDMVMwNnk1ZmdWWHN2K3IwaHlmaGR2WDFkYS9TRDJoYUVqQ3Jm?=
 =?utf-8?B?RVlObXVDcG5abTgxc0JybHhUK0JvdTNkeWNWSWNuYWlKay9CYlVFdWc4S3Z4?=
 =?utf-8?B?YmRpNlpEQXlDSE5JaEtIN0dNVXZ4dW1RMTlZanpLNWRjOUdhc2JCWUJwVi9I?=
 =?utf-8?B?Lyt2MzlHNWxzWHlWWGdHWks5Lzc3SGxvRmtWY3Z4TEFLZy9KNE8yaFZJVGFX?=
 =?utf-8?B?Q0Q3ZmFDc3JCQnI3V3JoektXQ3pONVltbEtUMXcwbGhBcmU5cUdrRGcxRHJh?=
 =?utf-8?B?VXpnWjh4cldqSGZKYWNLcER1akRqcmVmNUs4TjY1WUhNQ0xlbGJWbXBJSzdp?=
 =?utf-8?B?Y21mMlN0L0pEcytsNjNRb0ZqWnhkenpzM3U0d2N0YTRJVFRrVXZRRGN5Y1lW?=
 =?utf-8?B?WnVNM2U2bzRWTERDNGJUTzJTT0Y2Z1A2WG14RFVhS0ZUYjFUZUNSNnhEelYr?=
 =?utf-8?B?YjZxNXZGb1RoTHYxQU52YTVHRm4xcXNHamNmTGRiQXNZMXNMeW1vNlM1Q1Fl?=
 =?utf-8?B?UFNlQ0tRYU01d3dpZ29sU3VxcFh1WThHRi8yTUtzbW53eTZ0TEE2RVkwaWJS?=
 =?utf-8?B?ZXczRnNFdkxFSXJQbkVjNXBmWGNJK0paUUF5N1UzT3hwMi9yZG5ReXRpd0dV?=
 =?utf-8?B?cEszcTFJMXJJNEsyUmoyTG5IbjVXcVF1L0Q5M081N2R5T0QybE00Y1o4ODV3?=
 =?utf-8?B?dnFhamIxdjAvWTZCbUN0MzJOVFFxOUo1aEplVWpKWjNNOVpGL2NkUHpaTzg5?=
 =?utf-8?B?OG95eDdkVlNkR0p0bG9BQ1JoczE0bUJKc0NORmZKNmwwUUwwMlNLWHlCWnAr?=
 =?utf-8?Q?m/pzzjE9QHwC8lqhjuq+6yNuO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9280ec-288d-4722-4adb-08daff7cee33
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 09:08:46.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsGgduxdXWmpfr7UgmiEq0l5S6MYPlpQqFLVOKAdDC7438Jc1hsFiUlkEPqS5q96PJureV1RlTOAhWPq74FmhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500

On 25.01.2023 21:57, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> As agreed during the last MISRA C discussion, I am adding the following
> MISRA C rules: 7.1, 7.3, 18.3.
> 
> I am also adding 13.1 and 18.2 that were "agreed pending an analysis on
> the amount of violations".
> 
> In the case of 13.1 there are zero violations reported by cppcheck.
> 
> In the case of 18.2, there are zero violations reported by cppcheck
> after deviating the linker symbols, as discussed.

I find this suspicious. See e.g. ((pg) - frame_table) expressions both Arm
and x86 have. frame_table is neither a linker generated symbol, nor does
it represent something that the compiler (or static analysis tools) would
recognized as an "object". Still, the entire frame table of course
effectively is an object (array), yet there's no way for any tool to
actually recognize the array dimension.

Jan

