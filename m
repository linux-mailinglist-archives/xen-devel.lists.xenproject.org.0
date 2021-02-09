Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D38315759
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83407.155150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZE4-0003WB-6x; Tue, 09 Feb 2021 20:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83407.155150; Tue, 09 Feb 2021 20:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9ZE4-0003Vm-3h; Tue, 09 Feb 2021 20:03:08 +0000
Received: by outflank-mailman (input) for mailman id 83407;
 Tue, 09 Feb 2021 20:03:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GlY=HL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9ZE2-0003Vh-Ah
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:03:06 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ccd6d5c-053a-4e29-a9fa-a9bae9d54129;
 Tue, 09 Feb 2021 20:03:05 +0000 (UTC)
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
X-Inumbo-ID: 6ccd6d5c-053a-4e29-a9fa-a9bae9d54129
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612900985;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RhyvlAvej6uFasCeoeU7D0dVC/Z4zPiTox9Lv2VZcgQ=;
  b=Z6+KxwOuFh4FpFInK0u3uIYY1kymHhqGHMNLh3Mrq9bR49w4bKFodJ1A
   4HfluovDVh7psC7yWrV8Ve0SoZC/QmYwYmkbOlzqcBiGej3BRg59ZJMDv
   Y6eohSeKTysv4yP/axfVdWyGOdrDK05bVQdtlyG5eAR7ysn45OafvEDn2
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3Sc4b73rnR4qID9eZCIvziHY7zr0yzJA7NhBMn504csyx/ynXpdaDHO5vaE5xZAGsD/uuBqHVT
 Qblt8dO3Sw/P7B7kukSxS5i2GrmkIBCkxIA3WKh1kKXSyiY7Qpy4IkuM1P5dxbfevNe4QAWXum
 KBrshqUt1lksvKpMSQcTvivRfaCuNNz9e3MG+pXm5Gs22Bh4JIopm/URSObAbEwNwUMy02R20u
 qMLzG538E4AvF1jPN8Rh0Cz+NyoBKshrJZHMuUjRUG8ZWZoLuIAttpxlPcUR46H7aGwPwUHmdI
 TAY=
X-SBRS: 5.2
X-MesageID: 38253602
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,166,1610427600"; 
   d="scan'208";a="38253602"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jImxHux7MqiS/AL69Y75DZ3KblRv32s7yAOvXTgRNPwusKjJAPoH/nzGV6DEOSpA+/VSMN3r4ObMfd9ys7vPRBzlI7Qm0XyF3XEH4CuGlovgFbdXZ0Tprn+JslOUsT2lbqeR9dFyNzrDHyYgTa6AmfWrDOZsDA0SQJeyFXwWdXM9FCN3t2yz1vmt6tAIHyC38qkrMjF/v9ZeWI827Z/wDCWRAEJOU63r7oYHivTAgoJyYWcUd7RD2H6wtkwseGJAwtdm0LPFZhBI7z3GxEw7+Yoh6uvvqr1dCDrli5gj3rnAypcDZ9iWG1wPo4wk+HZeTURpg0hHhvPnVzXACkCufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOAoT+g4WqRsMZuM9rfXCyGWS86HflA8SSBIFOTmXko=;
 b=ciGzT0/rGHIlBvhIvg9JyR5qbUb9HB1jiIWCE7gXea1lh6YCP9+goEqpI/dm7ojUBbt56MfJy2nJJWYLn4A2gMPGGYEprZ64cdBuvNyPv18BPl7gfjAMSNJ+186jciTOnrupAx9FBFWW4jGvdbx1tMcPW8cJ9zpqv0HxPi2VqgTKuMu/XHO9t5SuMnEwBmGJHroUUH7GEp2RG16NOMi1Ffnm+vrO2KvgHXZ2ctlD70icGtnFbOcQsTSOyDHrdBBT9/g6FOzfskonOPAITbFlS7+aXPGEEHZJipaj20WuFf4mGqnezhBRkzPqPxRzIOD4Edk9lbDtS4hGVep2ql7YLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOAoT+g4WqRsMZuM9rfXCyGWS86HflA8SSBIFOTmXko=;
 b=YllCTg+2gPN9+f6TJjZqcymR9R5e+hR1GCgZCqLX9bAisUdPYsa9GTSPSlUsbaCKepXqdbxU7ByXwwR20cCsBQHtexzp48DMJiv4OBNo19jZX0gtyFrEdwU2czuOUb6bbFiWQF6Os1qQPwOb5wQqD04HARBHttROMJd8PEiTeoo=
Subject: Re: [PATCH v2] xen: workaround missing device_type property in
 pci/pcie nodes
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <Volodymyr_Babchuk@epam.com>, <ehem+xen@m5p.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210209195334.21206-1-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2a807fd-a027-fa7d-315a-f64db8c56e1c@citrix.com>
Date: Tue, 9 Feb 2021 20:02:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210209195334.21206-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63be1c4d-8db0-4f42-b88d-08d8cd35ae44
X-MS-TrafficTypeDiagnostic: BY5PR03MB5030:
X-Microsoft-Antispam-PRVS: <BY5PR03MB503044254DB56984F24D4BE3BA8E9@BY5PR03MB5030.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iI+oNMfQEZVkqZTn1+vOZ3jKqg9gq/GeYnfuTwiP8hukwHm3KFDJbtY2ND4MBv0XNJpoQho/GGyV8eTZCfE2zJ3z8xqHNsd0tzen0gUjaEcRJFAx21AFXcmyXS1PoWiGdO27x0NdnKWWj67RAM9yF5KBHLKinykA5I11Ou6FOVrLCJfASIyL6iv+w1mIk11dsL7qEkXz5kFvwcc+BsRbVo6iZ7wBH7gt2kTdx1+EiJEk8XUTgWgAd4FQweI3P1W9MKklSFPLE+HjlRX7+jSGikdZp5Bg2heRY1qac8gg+0ZL3FBlOnkIUdT2yDuWqZjkTk1p1ZIKJT9DTWasyevA1iM0Dz0JKNjqU5hELf+mNnQaiiaEHk0NuVFyxhFQjQ3jPT42DCtFUzF1LFgZNvy0iIHR2wkKIL0AGzTW8Knar4F71u+bkOaRd3fQESLQDDpyq9bQXOg3/q764ChVy54SI4KSfLSy3A4j0emEC/nSR9zgdHKK0oYSRAQe7oXmXzIWTB6q9OqEpO4b/mnqocektYhyYx4tuAODAEe/7jQV4Q4/f/mf9EcLcLTCpv8D8x6VrIXV1gy70WDaleg7WFf0563nMB9tTX1P7K1DRTyOfZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(53546011)(6666004)(2616005)(31696002)(186003)(86362001)(956004)(16526019)(26005)(31686004)(36756003)(4326008)(8676002)(6486002)(316002)(16576012)(478600001)(4744005)(5660300002)(2906002)(66476007)(66556008)(8936002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUM5VFNnZTdVZGo1MEVoYk5yQWxSYWpyS0VpWktpMDlSY1lpRDZVVXd6MzBm?=
 =?utf-8?B?OG5MZFIxdHZaeFU3OGpta3hkVXlwS3gyWmh0NmJqam1iV3A4b2poUmhaMjVP?=
 =?utf-8?B?ODNiazh6dE95QmpqdlU0L3RJQVY1bitxSlhyWVBPdnJMWWxTL2E1aGJOaHJ1?=
 =?utf-8?B?ajVPYzNwU29JenZjakVPYTVIMjZBbGhRS2VPY1VKaUZCVTlaRWRObm8rWTZM?=
 =?utf-8?B?TW0xN3Y5UGpOdTBmUDJpUFFwcmhMcmhxRXlpNzJUcitNUUpsQndIdzVCOTVK?=
 =?utf-8?B?UlBtNnE1a3V1bndMYVoxUnk3UUJtL0VCMCtPSFRvK1dyY1F3alVkUmg0c01F?=
 =?utf-8?B?K3FOaWxhUWFINUxTWTBEWkxicGFCM2NwSy9aaXVwZVFWZjA5Wk1FK1c1MWxE?=
 =?utf-8?B?UHM5cXo5TWtIZDZIOFFrSEFFdGlCR1JRc0lsWjVNb0JKOXR4dXliektmOWxt?=
 =?utf-8?B?M3IyRExpK3VwT1AwcjRYU21seEh1WExOV3pLbkk4Vk1ucTRPb0Myd0t2cFJI?=
 =?utf-8?B?bzMzL250TGI4aDBybDYvUjFFbzUvam5UcjVCUzBSUm5TMDBCOTZFekNZUHlG?=
 =?utf-8?B?V1FQK1RkdmswZVk0QndjMGVZNWMrd1JvaGxKK2JYd2tLMjFJdjJianF3QjRr?=
 =?utf-8?B?TU1FbzE2c1pnMHliOEFzbVlCV2t3YkZqOTBkNmFoSk9kc1U0ZW5HdUtFcXVT?=
 =?utf-8?B?RzRCVGNFbDBTVU5scVlWSHNxeGxJRC8wVXdwRzIrWjk1RC9GVm51ejF6Z1Rh?=
 =?utf-8?B?ZVZiZWYrQlFHd1JSZFZpQXA1ZEtWTGdXWTJOZjBHS1o5a0tPSUhWQ2diSzh5?=
 =?utf-8?B?TW0yWlFVektvT3JXTnZQYXJZWEhtdnNUMjhNODdETlNTcUQ2THRGRkx4dkJm?=
 =?utf-8?B?VUVYU3AvdXZNc2hjR3lMSWo1Skl0YkhDNkZZb0J2ZkY2Vlpabk90R09NTGtQ?=
 =?utf-8?B?eE1ZdnB1cEU2UmgwZUx3TDJUSTZhMkxtSEkwZkxrbnZFTGJRM25hVC9CQnQ5?=
 =?utf-8?B?ZkFEekM4VUVJZWpOM291UjJQVkdWMGN1UnI1M0hzb1BOTUNDL0dTNkZWZy9N?=
 =?utf-8?B?ZVBXeTBuTjlOOURaNEdscUYwMTlwMC9Ha1dPSHVvM3RqNnBFK0pOOUNSNW5s?=
 =?utf-8?B?QmhYYXFSbjl2VEJPWDMvK3JpVy9saTB1VEFZemErYk1lOXp2bE5vdmcwNnVN?=
 =?utf-8?B?bUhIZkE3bk5XQ0lDUFBVUnhUUWNHcnY0dHJkSmFOaDNzVjNBQXdTdnJSQ2dH?=
 =?utf-8?B?Y3pyNFRQVC8wR0FGNHBrZFJ5bEVHZHFYdW9sYXVzL0p3UkVKeDBINW42YjAx?=
 =?utf-8?B?WlJUNEFsWHpaZlB0NFlZVHlBeXdPbUVzSW1UZWplRlBYRnlmZEIySFN3M0F1?=
 =?utf-8?B?TjRFOVM5a2oxc1FDT1diQ0pkZldzYTBjbmVtZ2tJOGRxOXYvelExRDN5L2RC?=
 =?utf-8?B?QWlXS3U0bm1Jdjdvbm04Qm5qN00wZGd6N2RseHlIdUowdVFRck5GODZpczhN?=
 =?utf-8?B?U3ovTjVQNCtZWGlFcXRCTXlTSS9Ycjg4cGtqaW1GUHdiN0Y5Wit1a1FBMDNP?=
 =?utf-8?B?Z2ZRM25oV0hYQlA4ckJZWEF5VUlpcHppU3hqS3NGTHN5L2poTEVwby9pdU5X?=
 =?utf-8?B?UmxqeEFlSkJxQktaKzVabU9LYXpVQXRLT0N3dVN5VDUrSkdoWHRNMWRaTU5F?=
 =?utf-8?B?WjYzMFBScmpoQ2NRakc5R0lUWGZrZUNzNHcxQTBaQ2VMcnFXcTFwOUYzY2xJ?=
 =?utf-8?Q?xVEacEL+OpFRJOlzMPQZ4/NO0P1Ov1+3OxBsiup?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63be1c4d-8db0-4f42-b88d-08d8cd35ae44
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 20:02:51.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3EV7ocTEXkny2lmePYHdaxmnwUowdITc5gB1g2ptG77agkEo4xK/p6GXVg2acYEFUgZeGsb47XmI/jeR++H2dEzy+kYstz+GDWAdldbovI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5030
X-OriginatorOrg: citrix.com

On 09/02/2021 19:53, Stefano Stabellini wrote:
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 18825e333e..f1a96a3b90 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -563,14 +563,28 @@ static unsigned int dt_bus_default_get_flags(const __be32 *addr)
>   * PCI bus specific translator
>   */
>  
> +static bool_t dt_node_is_pci(const struct dt_device_node *np)
> +{
> +    bool is_pci = !strcmp(np->name, "pcie") || !strcmp(np->name, "pci");
> +
> +    if (is_pci)

bool on the function, and spaces here, which I'm sure you can fix while
committing :)

~Andrew

