Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A29626FF104
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533309.829843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px519-0007DO-6b; Thu, 11 May 2023 12:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533309.829843; Thu, 11 May 2023 12:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px519-0007AP-3v; Thu, 11 May 2023 12:03:31 +0000
Received: by outflank-mailman (input) for mailman id 533309;
 Thu, 11 May 2023 12:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px517-0007AC-Mu
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:03:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d737ea80-eff3-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 14:03:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8336.eurprd04.prod.outlook.com (2603:10a6:102:1c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 12:03:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:03:25 +0000
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
X-Inumbo-ID: d737ea80-eff3-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOKnbHRQ7qSA3rMMiJSiBKFak2GpNdzh/DoqUALpIXSHWkaZmOy1lqcPE2Ahkhzw19z9TAJjHl+y39pPwgbbfO3SOisDH9yk2+QSr+d2k2aP8wcvp4CAWekJXdI3XvoW63qiAyle1HBKDPBNs8nAr5WmTYeJYVXzJ/hdJGozz3Jt08tv2gL1koh7+QLg7UH9w0tSG5pywSbkmoC5XQ/SX+Z8JNE3T7CE7tTSTNI5Ldm68cyTz5ZCb7GmulvsCjbBO4sc71XGxFMo0wPYJU0Vu+s3ypmadUWWUt7UlsSDgZ7f6UU8Ih6RDQEkPph3if6Uni7xwJtl5VleKo3lQ1vFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4PgGZ3pjEle15bDbdUH/uSZ9bCgvWZfEO/3mozQMSI=;
 b=RT+wP2ZZOxemIGdKpS+usQBUYJp8f8jw5fi0jmHGWvL9JCE2g25/n4Vp2KP0vsQvZyXN+wK39kbZsjqiRCJzkSXD9mHkzeqSwHNnWNqufjWtkDPfIjTSKlesf3nQDV4nujyH9D0RKUM3PEDgdAptiUtzfXmVNs3TK/EhSHWOzVzxT/hjsGXWzQOl4Mi6KJ9+HYwoI+8ZuZjA8rb0k4UBxm4v0n88L+fbveEuXcfos838vP73BxwNwtMpwT/49CC2BbehL5qRI/wSlhd695KUfVSoCTyQQ1bD3RhHVH4o6Sxvps8QkIGuZnE5hUMAdvrYCplQnV/nbcDNIeYCbqA8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4PgGZ3pjEle15bDbdUH/uSZ9bCgvWZfEO/3mozQMSI=;
 b=SFVaSuhpr2LaNlBvP7RuBy7PGc9lT0E5g8oSUrHitsK0Yj8E2ko88SJ4Jc59HRCO1xLBJmLvgFzwvf8ftUWZz0bLjd0IpgTWRV+PZloQ1y4FfU+mQZCfQ+AvmgQYaTpK8wawtouImKNR3VrLEQl54qM+LfIubkVCG+a0lNe2YpRHmS7ngMxjRVj1AFlnfZR0GxfhEozeVKbMDD7OQvFmTVQj/a1OXt7qkfROMJAxwgnQll42EtzE5uBhJ4iAheCrlbeTb+PJ0dBPtqTvaA6gnZ5N0CtrguHwQmJXiyRmp0osSZs0Fc7R73BqtbsOk4IjHhZFmFsNrdvhPqWOGRi2xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
Date: Thu, 11 May 2023 14:03:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] x86: Dom0 I/O port access permissions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ef3814-0a90-414a-b58d-08db5217b98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sCnN67wNYB9hQUH+FlaCpMF1wztwqFURnV6VdUehf3eCO+MYbKdxOxFz/vdvZqnLLWeu0dKnyPhrIm9fJmZ1F5eX2qXcki7HfK9y1DXTgNjj+ACV0Mhfo7JjUVWCwdhui8rrl3biwdHj4huZ7fjCVLYWpdAG+QXZQ/W3JP+ac6tpYiluRf70RbJeGbsIULIix7G/I6hHLiZXoDlOo0t/y0ZH/U4zsdWaBGA0Z8Xp03TPTHXk3jAn3yBSt5aV0auiE8FbHWAHg0nKCMdpJOLI+jPidu0+BiYUyWblvmAxun4KA3BMiS9nB8JdxjndTI64Louha2qHogTPWc3Quh5YwxjeHHIKoudZXm6ehWWnd9EseF3XlwN+7hATbY0RJOJRdfu2oKU7iS9WNJMsZvf85jCR8xjwNrfS4ZVHYRORqhaY0q1VoIiIctEh/QnxZ/Ek0fb2SUlj6nLF0zxPxhA9BDSsxtZmYFuWNPMhehLY0iIRjgcpt/eChQ3b4X/ZvRgYOhJSyYTT9sKNLBzYDLc70MPlgkcncfq3ItOxreJU02kuZENW9g8g73dLXktsJRWWB4BCAdguge8arduTNy7zn4rBmXJCzi9LP/7WX5hPwiNH8txXMV7i5YvKlUaHeOiK3KKZ47BtQM17a+AowMuC+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199021)(54906003)(31686004)(2906002)(4744005)(6666004)(6486002)(478600001)(41300700001)(6512007)(26005)(186003)(6506007)(5660300002)(2616005)(38100700002)(83380400001)(36756003)(8676002)(6916009)(8936002)(86362001)(66556008)(66946007)(66476007)(31696002)(316002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU8vMjNtaHZwV0lncEJ0NDVINmQvM1Z4K3dRY1IxdzV1Mm1Bb2loa2JzOXor?=
 =?utf-8?B?RUNNZU5YYVErcVRXeUZ5ak5PcTFxQUt5bDZBS2FZQjlvVVFJRTdmU0xHYWQr?=
 =?utf-8?B?T0owSDM1Mjg0TVZUcFgrb1F4V0NFZy9pR1VwcWd6QWs1ZGphNDRrZzZHeG94?=
 =?utf-8?B?L01pRHFTd2U1YmtId0dNRlJxblpRK2x2VHNuTEkvK2xycjdCelVSL3hudXR3?=
 =?utf-8?B?QUVldUUwNTgxV3hobVBya0FLak5tejNiUXV5MVZveVpXZlBwbUxaL1ZsZFdM?=
 =?utf-8?B?d2ZzYjhueWtWYjlKWG9wTlRoK3FxNlV4V2pRdVBkckdzdTFQTDBsYVVCekpU?=
 =?utf-8?B?UE0vTG9SR3hxbXhUNjhPTTkwdDFXNDYvZ0gvVG5aWFRkZVdrbFRYaU1SL3FM?=
 =?utf-8?B?c0tNTHpDZTFrcWVCWjZoTHY0OXNqUzlqeHlLOXZkcWZ1cVpnRFhPQXl3WWMr?=
 =?utf-8?B?MEJvUGp6cG8vZlJ6SmxVRE9NdUVseU05N2RlclZhUlI1dDZSS0VHUHY2eGhq?=
 =?utf-8?B?QjVZa3FaK1FhRHFsZEIyb3VsNFgyTjNrM3BGeGpDTnBsa0Z0RWhmN1A1MWxs?=
 =?utf-8?B?Nk1XSHp1bTU5MTA4c3RCdzBMTjFTbzhidkNGaDU1MWZTbEVNaTVCWEZkSitH?=
 =?utf-8?B?NGdwT3VCK3pMUDcrMXpKVW5maXMybE5XYzlZbVFzKzM0MFdoWTJERlBSK2sw?=
 =?utf-8?B?eUwvOTNUQmtsZUY1cE1sSWJXOTc3MzY3aXdMQmllekpqWENNaXQ0YUZxbmto?=
 =?utf-8?B?NWxueFNsTE1NQ1hhZVpRK1p1S3dMcnVBMDNMWFpWNy9NL3h6dExxZ2VyalVy?=
 =?utf-8?B?ZFROR096Mms4OU9mcGpzaWFQRXNOL2N0U1ExbjhEZzQ3RHplQUhXSjJmVHls?=
 =?utf-8?B?cWlSSFdmVmgxRXJWUXIzMzFFM2JnTlBiQW5OcGV5SkZ3ZmZzSlArVG9kT1I3?=
 =?utf-8?B?MjY1Zm9za1FxKzk0eHEzc3VsUTE0TmZLd3FwTzRxTVpIQ0ZHeGJxZEwvNVR6?=
 =?utf-8?B?anBzcVJHVmJLVTN3RlFBelVFdzJYamNDVlNWMURHTi9ucW5rM3VFOGlDQVZJ?=
 =?utf-8?B?YzYxT0NWZVZLR1VUOU93bGJxQVBUVjJtcDdOUE9CM0NQNzFGRnZOSENZdzFQ?=
 =?utf-8?B?My8wd2pDV05laTVDQ1FtYUd3NU9nV1VVcitoQnJOUGtSSS9zWjM4NVZtZUJI?=
 =?utf-8?B?K2c3SEFnSXJIZzZuVE1NY3hBQTQ0S2ltT3hHbmNadEdqbjAxNkllTlBEZy9R?=
 =?utf-8?B?Qk1nK09iYU9ITFNsMUFFVStkMDIzTmxVZTdNVThpeWd4d3orSEFabVBOaVpI?=
 =?utf-8?B?Z2ZMbHlnL3BEeGxFYXlpdmdqcHFwSmlaY3BzVDVZNlhpdDdFaG13UFV1R2dZ?=
 =?utf-8?B?ZVVBaEZISXhNVitoVUp5L2NlYWpRMnFYSk5zY0N3UGhBMTdobEtoazh0ZWtI?=
 =?utf-8?B?NktzVUNGdjE2dzcwcGlsVWw5UnF3QUk5cU4rdjFRUkFDRENST3h6SzYvU284?=
 =?utf-8?B?UGlpRFNJcVgyYkoxdytsTlpLVUEySHdrclJrWUJQekdWa0JiTWhTSWt4ZExF?=
 =?utf-8?B?TUx3WjdpeHRtekpod1JJdStmdW0zS1BYRlFJTm16Z0lZT1ZaM1V0WWJKZXBH?=
 =?utf-8?B?NFdYSFRXdEhVbHNVQXB2NTJFV0J2M0FRUDBKeDJDeDhOaHQxZkJBWlBkalB3?=
 =?utf-8?B?R0FQMUlVRy9sVnhBMnlPbmN4NWVYZkhwczdUMzJScnpDVHpWUkZQekJwQWZl?=
 =?utf-8?B?WE5GTG9MYXpBeDh5MVNIdzlmK1VRRXBudkl0SGQrdHdUZ1h1ZW9QUEJ1azlz?=
 =?utf-8?B?MUlLN25JbTZXOTVNTlpkQmo1SmVqWlFjM2p6WkVKQnVadE90VDZrWUN4UFhy?=
 =?utf-8?B?VGExVllwMWlCcmVoRDRnb3k2SmdkVzZRaURMK3ZmS01hTkNWc01qZTd0K005?=
 =?utf-8?B?Z1dGRFpyQ25PUm94N1c5eUViMmI0cGoxaHdLVmRhaFJZOWlYK1ZTdG5UUUtV?=
 =?utf-8?B?UndhbDNMVE1aNGFoZEJBMUNiNkd5YVgzMzRBN3lZSFRqWkg0MXpVZHdUbFIx?=
 =?utf-8?B?MklKaG5IaXA0RnBFYyszUEhpKzFUZkE3bWFEdzdCWkEzMDQrMUswTnBvYVhT?=
 =?utf-8?Q?d9fCCE7dkWPGOpYZabyzq6x37?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ef3814-0a90-414a-b58d-08db5217b98b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:03:25.5955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MxLXBYZr5F7C/SkowUNaU8EMHlDRkKJn1YAdDOus6U/WOU+qxv8JXiElDnffue8De+uYBiyEtQoLN7moBzzUWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8336

Following on from the CMOS/RTC port aliasing change, there are quite
a few more missing restrictions, and there's more port aliasing to be
aware of.

The last two patches are pretty much RFC for now.

Of course an alternative to all of this would be to do away with all
policy-only ioports_deny_access() in dom0_setup_permissions(), leaving
in place only ones which are truly required for functionality reasons.

1: don't allow Dom0 access to port CF9
2: don't allow Dom0 access to port 92
3: PVH: deny Dom0 access to the ISA DMA controller
4: detect PIC aliasing on ports other than 0x[2A][01]
5: detect PIT aliasing on ports other than 0x4[0-3]
6: don't allow Dom0 (direct) access to port F0
7: don't allow Dom0 access to ELCR ports

Jan

