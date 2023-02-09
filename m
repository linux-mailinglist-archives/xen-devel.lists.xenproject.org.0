Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE4690464
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492260.761719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ3kp-0003N7-SI; Thu, 09 Feb 2023 10:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492260.761719; Thu, 09 Feb 2023 10:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ3kp-0003LQ-Ob; Thu, 09 Feb 2023 10:02:11 +0000
Received: by outflank-mailman (input) for mailman id 492260;
 Thu, 09 Feb 2023 10:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ3ko-0003L4-8J
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:02:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf2594bd-a860-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 11:02:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 10:02:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:02:05 +0000
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
X-Inumbo-ID: cf2594bd-a860-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGDCmiHPIBBTZrOwojCPZ3cDi4UjCQp9OxQ8avkQErOIvUWy1+vm/tW2P/1QOwqNEKECU1DArGVfmtdrLZC7QCRsorqNzgoidSVr0rpXLP1paOM9oTkHEvQyZ7PN9/iwDH4Dpd3Y+tqyxqVISOVZdrvhwInvo8G9KzoGsSY52Q4SNue11zLJnkoddvo3Ojn59/nbpdbuk/EIi1JPfncMyUTriRXxdWXkYBVyH4Q19HPZBz49P2xlaDQ+j4LKigDyvrxjFTVDHwMsYrwEN21hQzj1rbTCTE1+VGLsPh2R8ObCF39x2mLLUusjMY9ejNg4HNylVxKGh+vZEBUO1y9Ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xITieCvaNEutDuBjygYCGsMQHCOrX7cQXP2FUxCmTh0=;
 b=QsAZYM4/og/mBnUei0L394Mco7AsjVbiAlkv5jrWAFh2ZH1NeSd2J5QdVjIQHB7YnRH6rYxpeE4dNau9mblLSj4tucjtBpOuxOs977RmXx37lds6vmzhMMXUCEmsL2qBt5gnIX+gxLvTpIqkbch20qPd6CgIxAVxXJEh2PDT7Zo0LoZGatOPeZO5PZuJE4Hg4FjXlrEcyT32NkyTfoyR4I0otsFy9dyKOiYPrv+r6hzfKHWZJ4Zv6FZtflxstZZ56HRB3XvS7NBiEem8CpcpBzCGNUjbEVTzmcoiX2ZCDM93sQBg0kYyNf931YQnr7+S7OgyqwmGHPsGiiEqp8m/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xITieCvaNEutDuBjygYCGsMQHCOrX7cQXP2FUxCmTh0=;
 b=IKnzQCtVIGKt34L0hZmboqDNcv6zx8KGZIjSEFdTXmscVm9IqI0lsGNjmaE/UIlqsl5uc/6y+bdPk+QrYeJjc1uoCRui3yupRS8K5fgMGszNlcQo/ZHFi2BtLcKjfhLDTpAUQ1urDJiPmQvTJiuolkkX3qf2OrcV3DQkOSXjtODPsBFj8OAfZS1JZePScuKbJIojmXHtERAg0LOCLfw2vquz8Up+o1zv4VwSwF41JbfoBolJWNS7/XpxpfO0GNZ/xJNCvFM8cLmibL09qYxg3pod/bpp5KlLxnY8YgGX4AmX0Ok5f+3wiCsi3G+FV5gAf5F4sJtJB4UDoD359Z8t5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15a27b40-54ab-6b7a-9702-f72cf870e6d1@suse.com>
Date: Thu, 9 Feb 2023 11:02:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] riscv: add temporary riscv64_defconfig alias
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ce5f9d3-bd03-4f6e-e5c7-08db0a84b2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JvLMYS4eNY4zuChrO4zMe/Awo9eJKfxYsOhu5+cjc10rMUyRj5kkX7CNox+YOxV8evajXSIxOP3wm9RlPLuikrpCW58yHQh6hFTHUWoR/iLqHZ1jJsseylej7/MTGK9dPb9kXufrYQAUJZWEa3q2o8OaOAm7AtBksUJCH66Qi75Ndx3LTpdF2XGhbSywBX9kMO17eFxhBQN8bkwxHxBQxBLtY0qcvuvupHs/qXGE/uRsI2KcpKhczINYv9XtmsCJ0S77ijfl3+7YDEjtfUbUyKVas33EIKFkJ6DpV1/jahgRqz2LnebV8UB/pmkAjdpgGpYP5261U+MIlF/wtfvOKlIIiY8O0UV8odP9lM8bSlVMUTdbEyaLiFCNPDdxUT4LYhRLWsDNy/GULryvGoW96ZfDOf4sWIvBvReLGzS5by7N413d0FC0KF7yEiqYIE5ScpRUjldttaZoS/z80eyh6bd6/8gWBrk99B9tALN88sXB1VR9+vwHy4ghsZazpOYCX6yV6V/XsccqADcPEh0MsuGBWYeFUrEeyIMDWLWyEKzT+akqfi2o827PZaJCT8l6GYzxgUN81XU4rfQ97yn/bI7G+lPhRLF/dxDzqn9uBpWGP700NOArF25Ex0B2sFTD1+aHMBtUihpDpcDG8i5O6FpQ7iZArIFSWvkEIUVmM992s6xCdATGHmTzD2P+rNzNojeM+Z08B4ZiJrrPgvCcSAawA3d9vxf6PXs6rq6jEeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199018)(31686004)(2616005)(478600001)(54906003)(2906002)(316002)(6486002)(38100700002)(36756003)(66946007)(4326008)(66556008)(41300700001)(4744005)(6506007)(6916009)(8676002)(5660300002)(8936002)(26005)(31696002)(86362001)(6512007)(186003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1d6Wkh3M1pseGoxUG1aaGsvVk1kWlMxQXFSdTJ2bXIvWmdzQ3Bmcm1GNjI2?=
 =?utf-8?B?SEE5dXZvZStKVlhkaEorb2hnNUs4MFJ0cTNmejdYL3BzSE52bzlFUWlMTEtY?=
 =?utf-8?B?YXB3dXpCL0VPaVRzWVo5a1VoL2NoZUJsMHhzZTVpV3FnTWxwVEU2YmNCRWxP?=
 =?utf-8?B?amtqTGNlVGx5YkxNSHg4dVFOVnE5d0lCZU9uaE1NSzhvRW5hSXJ0alZYbTB6?=
 =?utf-8?B?UUc2MHRJYU5zQi90SU9LVkp0QXNjby9QKytwbkNwSktSZFQ5cFZnRzZTMGFB?=
 =?utf-8?B?cngvcDVncDlicmVPUUVwNmZJNzZHOUkzZW9uMzdhMitOUDcvZklqV1plb0JL?=
 =?utf-8?B?TnpvSCtDajdPbHBqT25XZjlQK2FDaEJYQnYza21vMFNuZG9NWW9jTG1KM1Fp?=
 =?utf-8?B?UHlsR1ExYk9BVFVKVGNIS0J6QWhxRjF5YmtlcitzUUtHUUFwakVKVGlHYXFB?=
 =?utf-8?B?VVRDSUhIUVdnOUUyY0FES3JaelBpNHJFL2JGR0xIRjNtelhab2lOZXkxTnhv?=
 =?utf-8?B?bWs3TGtLbjQ0NEJJUFpWMzN5ZlJNTlhDaDlreEFYR2lOZlZsQ3l5eXU4dGRi?=
 =?utf-8?B?SVI5UHJ5c1UwTEh1VkNibkNRKyt0dVJjSThTbXZFSk5JNHN5Z0ZZdEh0Qmhi?=
 =?utf-8?B?SDFmaXFnQ1plMzlFT0dhaTQ0eW9qV0FDamxtTWJOY1IzK2pWMFFlYmd5QVFs?=
 =?utf-8?B?SVB1ZlVnUmRPcmZsaXR3RXMrQldLODJZdzJiNTRGdlZNSGxrSVFKOHZYWXlW?=
 =?utf-8?B?eDJEaW00WHZkQVpUMklzZVA4WndqWjVlNk0vZm9XOG9iRENlMHNXcHVUd0tu?=
 =?utf-8?B?TzNYb3hvNWw3ZGQwYW9hcDJWWWpTSXVhU2VMUDFPUGU0eVdnZ05OaTVnZTBo?=
 =?utf-8?B?ZktLSXl2cnVCeWE4UUJCcGkzSWVVMHc1NitWNzR4TjZiMFlHVG9XbVBLQW93?=
 =?utf-8?B?LzVpV1NTSFZKbUhoQVllaFFpc1VUWWNVRGpWempUaTJCM2F5YUZINXlpWGJS?=
 =?utf-8?B?S1poU1NRaDZRRGZjVVR4eE1iME9JS2RDVklsZFNFNHVCRVpiRmNMVk5zL3RH?=
 =?utf-8?B?Q3phN0xjaTZaaFdmR3ExbHJ3VnJJbFdDMnhXT2FJeThXMkx0THg3TklNYUI4?=
 =?utf-8?B?REpGWUx6M3loWVlZYmJObmtGUHg4b2FWN3plVFBvWjFzRWR6MC8vc2tkR00z?=
 =?utf-8?B?VzM0amM5RzhwZ0hrNGM3RWZpNVNLTG9GZjZBWFFiNmtOdStIRFZQZjlPN2Ix?=
 =?utf-8?B?UUYwVE5rbUx1QTV6Y0FScjZXOFdoWmtMbnFtREZtelBGN0tqNFo4N0Rkc3Ft?=
 =?utf-8?B?Vno5VmM4WVc2K0xZcHpGQk16SnlkNEpnbmx1WGhvSVFLcXhpZkFHVGphU2Ex?=
 =?utf-8?B?WjRRTEcxTm1iMVRjTVA1d3cvSUlOcDhkYVhhdzRQTkFvSi82T3hTNkwrdDNX?=
 =?utf-8?B?VlVjaVRzNjVzSlU4N0sxVVpCNmMrcW5TYzg2K2RtU3MrZEF3VCtLeFI2RU1I?=
 =?utf-8?B?UzhaU3N3VGcyV3ZNVUg4ajIyZTYwY1Vtd2lBVGtFb3NSVlpWUFNHYkhWSzZ2?=
 =?utf-8?B?U21DRlJMbXROZmxrNTRSZGhJaFByazlnQmN6eXc5T0ZKTDVCNFJYVFhVMEdI?=
 =?utf-8?B?UDh2dkRFakFwcVhqckVSUXE3cjhER1ZNdSthTFJWcFhUV05UWEVYZXkrZmdG?=
 =?utf-8?B?RWJhQlg1V29EeFNhbzc2cmRTa1NFSVJzTmtrOXJ2VkJDTEtYM3ZvdXRKQUZy?=
 =?utf-8?B?d0FuSmoraldaQndwekFhSk40Z1RDRjF3VWdZOWNJR0htNWNZZ2JiQW5PNGtm?=
 =?utf-8?B?Tk54eDZpVzBvaUtuelcxQWN5VzAwYWlpVGViMXZKRWFLS1h1WUVuZTNEcDBV?=
 =?utf-8?B?c05MWFpKaUwwYWpSOW5ubHR6ZEREUC94dVdubUxRTEJrNUY3RkhxMGhtbWU2?=
 =?utf-8?B?dktER3RyczVHcXJmem9taHFKZDBHdElaNExWc2FFMTgzc3l5MzRESzBTa0N1?=
 =?utf-8?B?MERFWGczVDdQNDE1QjE2YVVwR2J3aDVjb2ozejRhbWZLYi9pVHRtaHByeFd0?=
 =?utf-8?B?U0wwbGNuTEtCTjdYNmc3QXN0M3JWdHpXM3hLTUlQME9udDEzc0JtVTFWZk1a?=
 =?utf-8?Q?NP94sVQXAfpYhy/bpf3lQ5njz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce5f9d3-bd03-4f6e-e5c7-08db0a84b2a6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:02:05.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oe2p8+BLble0yVUp6hfnXYMSYRNq9tU6pY5Oxk9S4O32BRFDI7Nia5XVV0tBORXfOXkjJ8+UgFh5+fqpfL45hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209

This is to allow building of Xen without going through a separate
tiny64_defconfig build step, just like is possible for all other
architectures. Eventually the symlink will want replacing by,
presumably, an empty file just like other arches have.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/configs/riscv64_defconfig | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 xen/arch/riscv/configs/riscv64_defconfig

diff --git a/xen/arch/riscv/configs/riscv64_defconfig b/xen/arch/riscv/configs/riscv64_defconfig
new file mode 120000
index 000000000000..c3c97b4d109b
--- /dev/null
+++ b/xen/arch/riscv/configs/riscv64_defconfig
@@ -0,0 +1 @@
+tiny64_defconfig
\ No newline at end of file
-- 
2.37.1

