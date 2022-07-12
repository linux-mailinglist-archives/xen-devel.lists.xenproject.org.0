Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF3571C59
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365749.596068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGpY-0007xl-4G; Tue, 12 Jul 2022 14:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365749.596068; Tue, 12 Jul 2022 14:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGpY-0007vj-13; Tue, 12 Jul 2022 14:25:40 +0000
Received: by outflank-mailman (input) for mailman id 365749;
 Tue, 12 Jul 2022 14:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBGpV-0007vc-Ng
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:25:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7efa81b2-01ee-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 16:25:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:25:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 14:25:34 +0000
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
X-Inumbo-ID: 7efa81b2-01ee-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blc8Qvcg1AHbe72T+m+trXu8MLQuWys2dmHnyAXohS9rfkmUsv4ZoXw6C7eV169wL2aPDx1Sv4lqvFTt20UeU6TjBYene6Z8+82oEtMg3mZjHA4kqPhAtLrW43XJNxTg92tmTUYNEn7q2DqewW52aAhpi2SpztyQh715qWrrNGVuRqJ1RyeiDFgq+vFFpnAFLUB640pRJlTJEdIx4tWac/J9pHF7grZuyZnZptudAvDAU1NwX1kkl9pLs+U24Pk6Bcrwqt+mlnRaS2uQa4EXRbUJfag3mOg9MK+xFWhe+i3paDoqWEJRUeVBGdWpu2zpR/k1cDs9PPi0Hn5bVuGtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnGDZCiSKW2A8fPt4iaXqGq0kr2RHdUx6hd/eh7V5I4=;
 b=fqL3e38sfoOxwGnq+Q5jnsQQMZvVObJ+NgnpDjvGW2Hg6I5xN52HamSDWiJUcM2pi4wo6CbhRjzL0zLjNssC3Ge/WOBPdD8k2B1dvCX0euinPmFWLdYu20I3e1W1XLMbWV/u/QCYZIuhKhT6w5iFmRovLxom8M/rbQWN1XRgEaDILT+I7R2doWR7ylf0fOS57r8n1yZYky1eQIFu9Dh9/2xG6Mw9tdMvJ2vYVL4ZylDwtY8NoK35IQ+0DFTnQucVBNo+p/ZFJtE/+lPEZhEu5Re7jhM3XrFXYGQqwY9y3cs6wd57OftMDddXaR3zbopllIBl8EJKd9t1dkqAcFaZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnGDZCiSKW2A8fPt4iaXqGq0kr2RHdUx6hd/eh7V5I4=;
 b=SZfAJonm3Q+j7OisAFXicCmjYlnAmS5n9Obc+hu5ZVmzWn6hBs/CczaARwFO8IO4HmlOBm1VJ7me2yfWcI1QhZv2XEPna0T3fcQfPo53qsvQbulAVdW/U1Cm21/JENdP7aYUEmZVCAhBzl3A4/Pq+knI4cRt37K1IsBaWF6KGokjx/EJfsHIloBbDPZlF1Fz+daZmPYjAI63Z0AZlimfiFo9kkVtTl/NHu99MIHns2bEWxB49XkAOvhNo/v1sWQ8fh1FnInhr6xbLc4eHCvtQqS9wloZiZ+SQHAHxBXtcDaUl1Cd0kA0zyArYZx6V1p6WH+mWbkHW8SIedNRTOoFrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fb8c6843-2170-c0d6-52f9-0edfb0d6684d@suse.com>
Date: Tue, 12 Jul 2022 16:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] xen/x86: rename bad_srat to numa_bad
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-8-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b4d2ddb-9260-4efa-decb-08da641261cf
X-MS-TrafficTypeDiagnostic: AS8PR04MB8884:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tuoduSuV2TVQM38fkhxmlBRv2qM2x0eNpsadRqnfG5Q8mEbfsCTT3ZIxJfxGaVeIv3H8zx5YyNeTydWGPpIUKXayfErIz6lGznmXlcke4zRqJ08zjotPJ8XTRo2033fzH96RB2M2dU9hM7AAXCGCTgYs+a7Q0rjeyhZ1kVqUcYTG5RsLNeulD7OZBe6lR58pnQHfayyuI8rc0q8J1BDKxa6DFK9dDEt3i9x3UMHW2CKLVZhzziBLe1peOs+0GYg6uuoEKCP/sZdLDd8PDdmeYZzWOTm71Z6hygvh4LgTGw9u5WVU5RrpUwZvVUmmJu+6p0Pjk3hmpeeDos18lV6LThUDG3psOGZSvYsD6GQhv3AoHDawyulzbTLQUdBqXJJcUSowUAAXYmlaV1rVPtiRDIuLknxczq4CFOLFpGU56/FMohPCLz+Vov7TYTgHtwHphwF81X+Gz/SlprByj+XPVAJMEwbSxsyTTPk31TylElurxpRFcyAgGUcVuwjRgTcG2uXeHcFWfu+YYeSh6XHxlD2ayVFSoj7AK6wsaAcrCn6Ha/Ol1ZxEm6+UnvegtRrsr7srUqswlRJpKmGgqnmOQsTKl3h+sMZusU1eyTbEQ9ljZ887oNFjyPkfIgsVxaP5/leao1K1WUPxlPw3L9MENFm6+k9k0AaSCPCAQbd2aaCEV9Vyc8TAULrtmaCCsfrTTaJVmEnJ+rCvpxmxBYWKUMcHX0jWPistDpXbP5RY2iQ/684jf7VdKlLM7f2wXxNpkU+aF1RBWJ1zKxFGC2AVPZYN58o2VjMOpAZWSBb/Kx/SY9kXpSTnaySe8scpRWwjcomegiYKwWOuozzGxUjU6wzQbsPkOq8IQgDKTcv8pV4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(346002)(136003)(376002)(366004)(4744005)(31686004)(66476007)(66946007)(66556008)(6512007)(4326008)(6916009)(26005)(38100700002)(2906002)(186003)(36756003)(5660300002)(8676002)(8936002)(54906003)(31696002)(478600001)(6486002)(53546011)(6506007)(316002)(86362001)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2xnSE42dEN0aS9haFZRbVNrY2l4d2VIKy9VUDl5bHczNnB3MnBxWTdka0Fu?=
 =?utf-8?B?elRtc3FwaEtadHFJMkJZZGhZMDgzTDRhcVljQUYrWnpjc2tHbjg4ejZ2SDV1?=
 =?utf-8?B?NVBlY1NFUXIrZ0ZzTXBDZ0tZbnJ5YjRoNlI3S1BQN2czOGVKZm9NVENhQzBZ?=
 =?utf-8?B?QmF4Yk9BZW5TdXVpMi9oWCtoM1hBSytoUUVuV2N6K1ZoQkhmcW9BclpWZ1dK?=
 =?utf-8?B?ZGc5MGpnY2pidE5hbStpKzBkOTBHeUl6MlE0YXNpcG5JcXArN0wvSi9mVS8r?=
 =?utf-8?B?RnV4V0F0Q3ZYUW9iZUVIZnN4T2dpcjl3bzRPQThvT1gyMVZCd0tscTdhcTJy?=
 =?utf-8?B?ck9TL2tzQS9jcjlrdG9MdU1vdnJ0U1B0YW9WWGlCRkJoWVJQUi80eW5odWlj?=
 =?utf-8?B?SG4vT0x5Sm1nYmIzcUJFL3lMUTZRczNMRGlwRFBjVzJKeTQ0d0hScDZLNkhZ?=
 =?utf-8?B?Si93NU1sSzRFV2VFUDNyaWpmRzh0Y2tNQUlLdG5xays0Z3EralRSMld2b0ZD?=
 =?utf-8?B?aTJhZWQ3Ykd4dVBwTUwxSnBaRS9FblFaRldSdUMrMWlnWUpwelRnblJ6VDQ1?=
 =?utf-8?B?Ly9sb3pXbndWNVRMRVhhNW5McjBSa1JDa1JIdUFHNkZYUENPN1lYTVFIOU82?=
 =?utf-8?B?dnl3Skd1VnZUZkpibkthTHE3bmNVbFd4aTY3eDBIWGV4c1hqK0ZHUERWeU1o?=
 =?utf-8?B?a2Y0MWhnZHkrVWdRWnlOYmNaOTdFRFVGZmltaDZldS9udjF3cDlHdFBudG9h?=
 =?utf-8?B?K0UwY0VWV3MvM3VaSWlEL2I2cmJ0T0puUERuU283REkzSUZpc1NZUnF4LzY4?=
 =?utf-8?B?Y3dLQlJhWjIza284cEgwVlZaUTJGSnMwRmkrbFdaZU5vZi9CY0txQWhXT2Ir?=
 =?utf-8?B?YTNOVjVMS0FmNUxZNWFkMmJFektlMzBsNUNyMHU0S0k2ODRNNDhYQzFMTTRF?=
 =?utf-8?B?WDZpNEhxZFJmNzVMcGQ0MkF2enVtd0xNMk9FQ05SRTNMeXladGlXeG4vM1ZQ?=
 =?utf-8?B?UHlzU2pneE4ycmNoTFUyc2FzL2FoSkZnb1ZZK1l3TDlLRWNDbTVNdHJKL1RF?=
 =?utf-8?B?UFh1ajcvaE9WTkk3Vjc3Vll1andBdlV3b0x4RTBOM2FrTFIzVm96NDF4R3VY?=
 =?utf-8?B?S2ZBSERXa1hDbVI5QXlNODVQVlNsVVUxVTR4cENJcGZnNmdxdXVkUFg3ZVBx?=
 =?utf-8?B?blBEclFqWWx6bmxHYWdsWDJyRVJRNFBVZ2JSdVZkWE1Rc0d3dUxWRURrYStD?=
 =?utf-8?B?aCtkQnBWYUpsb0VCSXU4c2dYMitZK2pkTnVyQlRyN0UzRXdvY1FRcEZxWEFp?=
 =?utf-8?B?VDVBaFpMTnhUMENjdmhlZXcxSHR2Y0FhRHQ2WTl4Q0syRTJJbnVzYWVCWWs0?=
 =?utf-8?B?SjlUZWFibnJ4RXFDTkR3a0ppMlBJUnpKVGJQUjcrSTErS3ErQ2FYUEp6cDUr?=
 =?utf-8?B?T1dDaitEUlMwbzBxOUs3OVRZOEhRQUVJRGpBSlB1OFNndGFJQkVPNzE1SzZ5?=
 =?utf-8?B?NE5aS2tCcnlDVGZGbWlnN2t0Ymc2MEVzQktjWXVCMms5RzBYRDJnTzZQVVFn?=
 =?utf-8?B?cDFiWER0NGtObnlSV0NxTHVKSE9WKzNoSS81NmlYb0R3YWc4bHY2QnR2WTR3?=
 =?utf-8?B?dU13WDRIU2FPMzVxaUZTVW5laE1nTGNPck1GSUpyT1JvQm1iZ3gzRjBIZ0pY?=
 =?utf-8?B?dSt2cXdkVTg1YlFUYVUvaE1adUVid1gxWi9xQUZmeG1mZTE3aHBEcFFjUjdj?=
 =?utf-8?B?QzR5UW9HQ3NyY2lsRThSSTBYMGZ2VkpRL0tISzZIK2wzNXNVdFJMZ2RsbkEx?=
 =?utf-8?B?VUM0SUFSK0preW5uYlJUSGtMcVdXek9GQUtMNlFRM0VGM2lFVXRaa2c2NHVo?=
 =?utf-8?B?NWsra3VNb0tqWVh5SWxINTA0Q0ZOWTZBZE0weU9QaUxGWkFMZUZnQ09aWVdy?=
 =?utf-8?B?MFY1WDlqamJuaE1vRlZpaHg0aHo1ZEI0dTk5TXgxblZvMW1LYlVORmlpalRa?=
 =?utf-8?B?M29vc2g4VitJOW1kRWxKbTd4YXNXYXZpaXJDazEzK3BYVlZPK2FrbzVnZWt0?=
 =?utf-8?B?N1ZXcEQ3R0ZzVDhBTUIzUzF4U1BRUi9EYXVQbHhJc2tpbnU0MGJ5UGo3Y1h6?=
 =?utf-8?Q?NxbcJ0jp1z6Cs0wHbiMoPM/J2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4d2ddb-9260-4efa-decb-08da641261cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:25:34.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/24w1cLQdL2hTXSHND3KRvqVIGDJcxmBEkO4XFsOJVskeF9vfVVKcZ+90tT2Iz8edYNthvL8P1Be7rUf9yi6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

On 08.07.2022 16:54, Wei Chen wrote:
> When NUMA initialization code is failed in scanning SRAT. It will
> call bad_srat to set disable NUMA and clear relate data. But this
> name is ACPI specific, we have moved generically usable NUMA codes
> to common, bad_srat has came with these codes to common code. But
> it's not reasonable for other NUMA implementations to implement a
> fall back function named bad_srat. So in this patch, we rename
> bad_srat to numa_bad.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2:
> 1. New in v2.

I think this wants to come before moving to common code. And I'd
also like you to consider using e.g. numa_fw_bad() or
numa_firmware_bad() to better reflect the original purpose.

Jan

