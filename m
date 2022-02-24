Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B79C4C3193
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 17:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278490.475763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNH7M-0006k7-Nh; Thu, 24 Feb 2022 16:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278490.475763; Thu, 24 Feb 2022 16:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNH7M-0006h3-KZ; Thu, 24 Feb 2022 16:37:24 +0000
Received: by outflank-mailman (input) for mailman id 278490;
 Thu, 24 Feb 2022 16:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gX/V=TH=citrix.com=prvs=047ddeb39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNH7K-0006gx-MJ
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 16:37:22 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08315fc4-9590-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 17:37:20 +0100 (CET)
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
X-Inumbo-ID: 08315fc4-9590-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645720640;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=t+8rG6Fm+mpvRCzCQQn9JDgF4eVQf/agejDrWs9oP8Y=;
  b=AqKoe3QxBV3xsVbNaTxwCa8Pto3FWR3TzxB17CO5zLHxvH8FvgZDe1yk
   +3zIjYXTQOecSwSbtCR7Vbi15ydjCRis5U07eK/du1KZEAs5hjjMXtptY
   HOUeTr8ZbgJRHxSTnlZuQ35nZZAWIwfrNjb8s24704JSAgGHFF8frAvG7
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67183607
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jdxGlqKOs49YKtNoFE+RJpUlxSXFcZb7ZxGr2PjKsXjdYENSgjdWy
 2IdWjvTbq7cM2OkL49yPovjpB9SvMfcxoUwGlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2NQ02YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NQRvMCXZgMLApePt+oYehB7MA1kJLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv35AVQ66BD
 yYfQWVvTB+eQAdDBk4GKJIGkuyFr3fEdCIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wv
 Xna9m70BhUbMt23yjef9H+owOjVkkvTUYQeDufgrqZCj1iax2hVAxoTPXO4rOe4jAiiWttZA
 00S5icq66M18SSDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXcLeCssXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7jJICi4KU+XL7uXGDqJ3gRy0Wyh/OQTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9TbwJtdiON7Kih6SdkifdokmCgmbKggjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ymkUj9jeDFOybOIVvgDLdoRrpnhE9jiF+Im
 +uzyuPQk0kPOAEASnO/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3LY9laUtF
 6FdIa1twJ1nE1z6xtjUVrGkxKRKfxW3nwOeeS2jZTk0ZZl7QALVvNTje2PSGOMmV0JbaeNWT
 2Wc6z7m
IronPort-HdrOrdr: A9a23:g9xeUaov9XioBRaDGViMpT4aV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="67183607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXkrGviOt2pG4WfAHMClrh6Ik3H0DNSnOn99ENfvzmZ5F8vCJLW5AcdE9DcyyqqfHUlTAYQr7JXp7HEpldBW12AoNtS9VMDZhG0wofnBaeIw59lW9AqlyX+wGlOKHxQwFZoMXxrtpplarrRoptm9x0FMVR8VQ/PzE/Zguu9gDiGjqfGOORkjnUjfq3fBBk0/cEZD5MvCFQ5oZq0iuishErfGFa3u6ZD7boP4PRaq6y9ReUOq7GbWhkLsN3ZVe5sNVRAnISAo3QTYAKY05Ib2uXwK0M/ftUNXb15PgreyzYOgYL4D5O2lFCtjRtPHggS61WHz2DLzXJWq+L74Xh7N7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yeyjqo6BAR6+mndrcxmXz+lkFiDgi+mh4YsAir/cbrI=;
 b=AzV9FTrRBv2o4E0UwqOI0GJVSqUH39Y3I5N9G/dVWjS+Vsjoe0zQL9aIefwf9JB/Ie23ijs5Z57Ts+A/5VbNMnVg6tuZXMXRK1kaJBPchQbBnWO3WtauiaIgatoxyvGz80cL6JATvKAlzQY++dDTw1Lvxjd5H8FEFg6Bbwosthf7BlhlgXw7yTYuxAh/GJaxJF/5YFUdKCnWJL4UEyCQWBUuamCh4OMimsHlRFX3wxHKSbWpiBxiPrmnF9n2VsuiQjVYCCME+4QIDCT9p3tRvwq0dGSEIw4jr5Mf01knYEBccPvOtym5WS0R3fizRKcO1TD7DEECsuNzddvnDfelGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yeyjqo6BAR6+mndrcxmXz+lkFiDgi+mh4YsAir/cbrI=;
 b=nQ0amT+JAV3uUBprJ/qt5ewDva9xJ2mpqZpgZKJH84j/ZmV3EnBHHlyXlt5wxxmm7dUaAi8q5w04NiYzo1vaig4nkw9Sa38H5JtHDtdzOqJdU9zIP9gzbCO8m5NAHvTGswTYdz5RAeenTbCp8H6ouq1Q3PjarhLtp/WrIZovr4Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: [PATCH v2] pci/ats: do not allow broken devices to be assigned to guests
Date: Thu, 24 Feb 2022 17:37:01 +0100
Message-ID: <20220224163701.89404-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f69a873-98b6-486a-01ab-08d9f7b3e9ec
X-MS-TrafficTypeDiagnostic: CH2PR03MB5350:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CH2PR03MB535066A581017B65F2EAF4D58F3D9@CH2PR03MB5350.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLDltzc0XdWzDjWuE7gbGIdWTWOWeK15NCtLPiLMQbHbSHv/2vw8QL1O0Mk1BRgDb59UHCgQpbJcLPWJp4s9PmQB6p+N96Si7+gWwfmrSckmpWU7zIoy+Yzs+gpBdEYhjCrURkgGmNW0LWaPIYAoTTrpWRaicIk5Pgxtf2RsQxjh7UK+1y5zmldfCMx18+9kLwVk7iurArTOaXTa/583xVGAjU9rbL7jK3YD9yrUyebTyEcv8idIuE1fNE9rerVRehLz7bJy1c8CsVceMD7wpQk6ievZkPekl0W2GpA3VpT8rqyCQASfSyuWHVXRDkDqgChp60IxCMyzYxSuP7LmZNM1eqA12CIQ1vAoxF28mJM/EW4POIh5uLO2Yh+nzeUiMWcBIpgPGozHQV4BSUuPLYX+6q9039mnKxlDaYr0wRoOVLNiBFICZi27JmK+y1Ma9d8Ol4EssMfLiUry33QCBoKQg0mW5ThMSEGJcPGeGk6qPKFuGn0quT6Rhp4Cq/3N4OdgZ32Z/JoSt/uT/dAgApqaLb78a8akX7ok2gOnb4R2x81sienH9FdgeQOn4DBak3kQk9c2ICoJ+UWNKTMXEykA0pMm8wXQ7DTj6Uewgz76ETZgMUphOrm1AkLaqErpQQHneGMytVUXjckjuOwbjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(54906003)(66476007)(1076003)(316002)(4326008)(8936002)(2906002)(6916009)(66556008)(66946007)(186003)(26005)(86362001)(6486002)(8676002)(5660300002)(82960400001)(83380400001)(6666004)(6512007)(508600001)(36756003)(38100700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWZkM3NsaWlPMjhzTmY5SXg3Nnl4d1E0YTJLanJEZEdKTU94cHIxQmxUU2tD?=
 =?utf-8?B?Wko0UmcveUtLTmIyYWxoUFVoZmxFYWlWRDA4REM3VDdURkxOOUZEdXF1T1ly?=
 =?utf-8?B?Yi9KRjB1Q3FoZi9oby9aNGNqTkRUbWMrTmNaUHpHNDFHbWxrUXVBL2ZwYXVl?=
 =?utf-8?B?VGh0TEl2Z3R3ZUZ1bE1rRzMxeTBERi9ocWJyMkE3eFdQL244VkxoK2krY256?=
 =?utf-8?B?QUJhSmx3MVdYKzdoSzU5aUY3TGprK0VwZTJMUTRPR0o0d052Z2ttVk5HcTJE?=
 =?utf-8?B?YTdGMjNFcFM2Q2pDUEF5N1N1SHExd2VzQUdUQVJnVmNkWGtlY01iRFI5VWR3?=
 =?utf-8?B?UW9XeGQ3RlI5L1ZENHZ4RjRvM1I1RmZhUDRhV0FDWVZvWG1sckoyb0pkNWVy?=
 =?utf-8?B?MHJuTnBEMHoxZGswYVNMU21pT29BczJFSnhoMG1OT1N0UU8vdXp5NUdEM3Zs?=
 =?utf-8?B?TFR6QWRVQnNVOTJwdW5OcFpqR2pvcGtPa2E2cHNsRE5GUFdzemd3RjlmMXVk?=
 =?utf-8?B?WmljMUVHc1ZyL2hqaXBWNE9zZlh2d211dWRQaFZUOU9Ubk5FQ2tjQzRTQm9r?=
 =?utf-8?B?V2piQ0kvdFNNYlRpV3pEZmExT0dSV2hza2VxWnFyeGRpRVA4bUlCVG9NYnQ5?=
 =?utf-8?B?UC9IamNjRUZONUFGbEVxOUpubjZkOUdCTWZ5T0RHYXlpS1hGK3lIdDhOUXVQ?=
 =?utf-8?B?MXNzQk1GQkw3YVpES2ZjYlRlYXNhMC82RHJEU01Zd1ZVeWZBSjJUQm10R08r?=
 =?utf-8?B?Rm85SGloOGt3RG8xdDY5eE5OMlE2bGVBeCs3YlhTWHVRRWp0RkFCeG94UlRG?=
 =?utf-8?B?ME9ubkx0c0hCSDIzVjVreEdnOWtVQkNXQlExRkUrMEd3cVlkaW9GSjlpNEVK?=
 =?utf-8?B?YTRnd0xsU21jaGdwWDdCWWNFQm1sRTdRM2ZILzQxMGlVaHh4VzNhazFpejEv?=
 =?utf-8?B?Vm5LYVl6dktQTmRwMEcvMUI0cDlBTVBKQUM0c041SGV4d2VGMFI1MlluOEhr?=
 =?utf-8?B?ZHBTZHhGekhuanJNSHBJeE5KWVNaTW02TDJGYkVxRXg3VGJaRlc2K3pDWlly?=
 =?utf-8?B?djFPWGUvOG5tR29xMk53TUNHYlR1RGR1NnljcjVWeTdmazhrU1F1Uk9wZDVk?=
 =?utf-8?B?SlA0a1BNQUdVM3Z1SklRcjBVN0Z1VWYxck9NUE93MFVQSUNLMDJxdUR5K2dI?=
 =?utf-8?B?V0pCQXhGWXFBZjcxckRqcUlpeStsMEwzQUh4c2wya3NVdWs1OVlmZ0RDejAz?=
 =?utf-8?B?bkJLYkhQZ0hQTll2N0Q0WG1BM1JicUM0eEthLyttRWxHNmRxVzJhWGlKOEd2?=
 =?utf-8?B?REhIZFZobHF2NklkRzVvU1RvdU5YQ1NOcmdaV0poaCtEMVVOUzhyMW5aa1ZG?=
 =?utf-8?B?Y1lRRTloM2E2K3JXTjhrVHdnVWhHU0ovNnR0bUFKZi8rWlAwYUtWcnZ4MG4r?=
 =?utf-8?B?Mmc3d1ZyL0lUUVdkQ3FiRDM0Y2xjTmxNdVZhN3ZOaTJlT0o0MkdZWjVPZ0hx?=
 =?utf-8?B?djZOM0lpVU5UMHFNdVdNWit2Qmc3Z1kzVU1IRCtEZFhLam5zc3k5WWk0V1lP?=
 =?utf-8?B?a2pjaUtWQi9UdXNId2Zkd2thV0NMS2o1TERYUVE5bElOcUhJY1dmNWg0cmF5?=
 =?utf-8?B?OXFTaCtMeVlmLzIwV2Jaazc3UWZUMkJ4LzRBUkJkZmVyVnR3OER4ZDVaWXAw?=
 =?utf-8?B?b2NXQURSSnhUS1pvZm5kSFV1Q3JRVm0yRXB6aGtzYndGQVFIWG5PSVNTZDcy?=
 =?utf-8?B?TVBqWVNhNkliRmEvNDhmZng2RENML0QxeVFLMFhrSXlVSnprUWZjZFNKZXp4?=
 =?utf-8?B?R3YxSURselBNQVNINHJOZnZyRzJsbHhRYlhDNHJaTnU0VWFqTzJVZFRzYlhJ?=
 =?utf-8?B?dlZUTkdITno1WWZmS0VRdW1WeE1EVHROeGhFOXVSSDVkMFZvdjVKb2c2N2NJ?=
 =?utf-8?B?YTBCNTh4KzBKbEtmNFFVM3NFQWUzaG1jTWNhdmxGeFZiQUZDUkNXUXhMcWE2?=
 =?utf-8?B?ZHRpVnRsTWhYSmV5azVCS0VzaU5HL1JTYVVBYzJkdTJCZ0pxbzJ3Y3JkUzIx?=
 =?utf-8?B?SnhvRCtPWDVsWkV2UzZqNzZnOU05T2ZtK01VbTdmNjlEZU4veEJXMHlxRUk1?=
 =?utf-8?B?WnlrdDRlWVlZU1JPRUt5ZU44cVJPUHlyQUNsZk5RbjJ6Uit3UFY3MVJRRWxH?=
 =?utf-8?Q?DcdKTNx2lCUVWvlHz+c4TCs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f69a873-98b6-486a-01ab-08d9f7b3e9ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:37:14.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrBEr1TFGMw0+A26x7+EiQr/hlFi+SPcxByCEgnwO+DrAwfqsyFqX3eoEmZC5t+1LWDlnwpjvbq25Byk80+6NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5350
X-OriginatorOrg: citrix.com

Introduce a new field to mark devices as broken: having it set
prevents the device from being assigned to guests. Use the field in
order to mark ATS devices that have failed a flush as broken, thus
preventing them to be assigned to any guest.

This allows the device IOMMU context entry to be cleaned up properly,
as calling _pci_hide_device will just change the ownership of the
device, but the IOMMU context entry of the device would be left as-is.
It would also leak a Domain ID, as removing the device from it's
previous owner will allow releasing the DID used by the device without
having cleaned up the context entry.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>
---
Changes since v1:
 - Allow assigning broken devices to dom_io or the hardware domain.
---
 xen/drivers/passthrough/pci.c        | 11 +++++++----
 xen/drivers/passthrough/vtd/qinval.c |  8 +++++++-
 xen/include/xen/pci.h                |  3 +++
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 70b6684981..91b43a3f04 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -501,7 +501,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
     xfree(pdev);
 }
 
-static void _pci_hide_device(struct pci_dev *pdev)
+static void __init _pci_hide_device(struct pci_dev *pdev)
 {
     if ( pdev->domain )
         return;
@@ -1487,6 +1487,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
+    /* Do not allow broken devices to be assigned to guests. */
+    rc = -EBADF;
+    if ( pdev->broken && d != hardware_domain && d != dom_io )
+        goto done;
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1585,9 +1590,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
         return;
     }
 
-    list_del(&pdev->domain_list);
-    pdev->domain = NULL;
-    _pci_hide_device(pdev);
+    pdev->broken = true;
 
     if ( !d->is_shutting_down && printk_ratelimit() )
         printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 9f291f47e5..510961a203 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -227,7 +227,7 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
 
     ASSERT(iommu->qinval_maddr);
     rc = queue_invalidate_wait(iommu, 0, 1, 1, 1);
-    if ( rc == -ETIMEDOUT )
+    if ( rc == -ETIMEDOUT && !pdev->broken )
     {
         struct domain *d = rcu_lock_domain_by_id(did_to_domain_id(iommu, did));
 
@@ -241,6 +241,12 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
         iommu_dev_iotlb_flush_timeout(d, pdev);
         rcu_unlock_domain(d);
     }
+    else if ( rc == -ETIMEDOUT )
+        /*
+         * The device is already marked as broken, ignore the error in order to
+         * allow {de,}assign to succeed.
+         */
+        rc = 0;
 
     return rc;
 }
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b6d7e454f8..02b31f7259 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -108,6 +108,9 @@ struct pci_dev {
     /* Device with errata, ignore the BARs. */
     bool ignore_bars;
 
+    /* Device misbehaving, prevent assigning it to guests. */
+    bool broken;
+
     enum pdev_type {
         DEV_TYPE_PCI_UNKNOWN,
         DEV_TYPE_PCIe_ENDPOINT,
-- 
2.34.1


