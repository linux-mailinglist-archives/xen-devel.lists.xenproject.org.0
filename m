Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083887472E4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 15:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558360.872376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgFq-0000b1-PS; Tue, 04 Jul 2023 13:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558360.872376; Tue, 04 Jul 2023 13:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgFq-0000Yf-MP; Tue, 04 Jul 2023 13:39:42 +0000
Received: by outflank-mailman (input) for mailman id 558360;
 Tue, 04 Jul 2023 13:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGgFo-0000YZ-Rv
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 13:39:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38646085-1a70-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 15:39:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8215.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:39:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:39:36 +0000
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
X-Inumbo-ID: 38646085-1a70-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l61Y8kkue908wus6N9YdSUQoJ4bADhLt4ftLCHbb9OWwi1mQFjyNj4YqbOJZr2zWutmNp43J3GiWq0NqjMefmX+MeX59wSfxtIOajI9kk9fnNK1k5GeaalqAQVoB6d87R9qoAPsaNovs9W5schgkH/lxn2sqPvrc6OEaEDu8prMO1I8AgaS01aE67upmYiIPb1KihOPXyeRmQhqppT1fpdq0yk/yZ2xHXIuJxVRaIPC4b94+hY63hegWzyv8v6gO8xnvJYgAbcgrmX9llrLhqjuHQSiL61mHQk0iY6V+0k2wxRHXHTNMQLevFVJ0JnAYDPzhrQ75SXZre7moxdgzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=134+lnW6M8o5uUgaYmeEKgQrOjOjiI5sdQXc8ZqDUTs=;
 b=KlXho/ymW1jkwDC1ltH7pF0H0rtCM8IHjsq/IQ2+isGcbRsit3ZwLFAhDBFtckmZJuebQIVY4Wo0ABMB+vECN80UbzG3D7JJ+5J0xU4wFCNWqkCyaExoS183q8m8/j2sp9Yc5DPHKLJwyLB41aUhoW7pXxHc3rmB8S9uSH2KJCdR4C6dz6x4me+kkFETECcpgvyvhTugk5N4OYnD9svylrj8+/ytJbSqebL4vgVA0UiWsZvFf9RsSZoA9NQQ5piTzsHBXd/8v5YHksexZ66ATZbIG5ir00ISotWOEWreb4i540tB5YT33kBm+TxAEsqmr0Hau8EQOUdOpFhw6pBEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=134+lnW6M8o5uUgaYmeEKgQrOjOjiI5sdQXc8ZqDUTs=;
 b=LMXmkm44OGkhtEOoVQa8Q5PCPHrx8/0XIDXgOR1dE9E/d2OqDBqZSsus7JE8uuyT6xIL9IiugmOAbgCzzeA6uABdJZS5u4lFhhS3L9SP7tS6zxawTpEGgNouu4t0CsNL5c/khyUX7XKwfO56p86U/ZcYvUr76+pweudluLHLhgucYAjcMoq5NHv27JRyWLzUCcRwlUosPDz70TswYepCBSP/HGPuNCLc7496LKkNCn+gefmOh1vBzo2/BJFS9p2k3ZJyrsHS+wdCif5tTYztOc1/LHaBkYgqKSQ+Etu2QqptqhJj4Dt7d6pwVPrFhbdmCmNrSPAnWmCs/5Zj75lTAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cd67316-4347-a3b6-0f4c-1864ce08ad5c@suse.com>
Date: Tue, 4 Jul 2023 15:39:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: XenSummit: Empty per-arch files
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 920c3806-19b9-44ad-2da5-08db7c941b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YHpTc6hKpmGrUlg3bCjIDWawluBEccKcDmLoSBXXpbSpQNcwSt3FX+OT0MQPoKdBf1Ge0kC43TabqobLZMfIwbVCob7B2jpnI241+NoiNFEEUgleUniUkpki5kVyHDOXkrHnFzwuhXkSjbv/Ep1wmoAit3bT3jqrmx0h7uK0lP0lDPYMw9xPcq812/5OaK/hjMjqo3fYK2h2aydMPZLKsEYJkYe/c4YSpSYZJVlYJkfXcMmeIgRne8GuGkosBpPqq/FDn9MO5lRAChSJQQ/MTOtL0RafOAegOduitE6MfQw8vHsZMzqYmkGrLdiV+vbbT6fV78JAtz9GtSiYRHcCJxvKMYap9klVNM4Am6wKLMIh7KCTeG46+acZ1B09honm+XYxvJG4glcWnxDWzrGn/TB2hwFpCizeB/mC3lUlfLdG72PfkVJLCHpFYPFUy94Ix1ttKj6fbG7yTjEa4vZVRquYSPAcmhVZUdIzHqHhuEid342yEy3eg9sdBA1SiHcpjnBsTQ5Wg6jc61zL7BTzE5lO+O7hnALgo6Zmr2SouolNxlAk7kEC5xp5c6DRahaC7Mgnp44T1IQF20Zx2sz4/mgPS98n4yW1hzRzWHkiMyH/v3H/13S8e0JcYIyR5QxZcS2wOty/V9OJjBOgLMDMYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(39850400004)(366004)(396003)(376002)(451199021)(6512007)(6506007)(53546011)(66476007)(316002)(38100700002)(4326008)(66946007)(66556008)(6916009)(2616005)(66899021)(186003)(26005)(478600001)(54906003)(2906002)(8936002)(31686004)(8676002)(36756003)(31696002)(5660300002)(7416002)(86362001)(6486002)(41300700001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUtNTnljbC9iVlBGb1dWNExVU3JaeGFBeHZ0Y2hDbk9EUEZNbGcweXozcTFS?=
 =?utf-8?B?NDFTWkhBNks2ZGlBcitGNENwQ2JnQU04eUZGeUxYNHhBMG9kc3QrZnppVXlZ?=
 =?utf-8?B?K1k0Y0ZxTWloTDFRYlBGaEdMUWVhamd6V2pmdElINlM0SWp6VVBRZ0xLU1VD?=
 =?utf-8?B?ZzZPSzVJTE9OZ1VvbXdJblgvb005YmhDRzkyTE9nazg2WmU1WmNyZHhaV3NP?=
 =?utf-8?B?ZUJmZTA2ZXI5VzBrV0w0Rkh6VGl6enQxdUs5TDhialV1YjVXUHBvKytTN0Rq?=
 =?utf-8?B?TnpramQrdlI5WXhGUWFyT3JudmVUM2pCUkRjeW5oS252eGF0MEczdy9YbFh3?=
 =?utf-8?B?QVRHMVdINzBaRUZQK3liU1dTa2V4cTJoZkp0UnE3RE4xZVRzeFgyd3NqUWY2?=
 =?utf-8?B?cEF4UVBIQXZYcUhsYXZyaHNPSnhHS3A4eGZYV2p4WldqajZpQmVOWmd1RUgr?=
 =?utf-8?B?bi9sVnUvTHZ0eXA1TW93RUZOei9lU3dUNjZXS1lDeERqWUd4YzFpMkRoR2FU?=
 =?utf-8?B?V1hBQU1mZUFJSkxEMGdXYlBSeHM2QXV5ZUFyaXFSVC9reUxhUC84UkFCOWpt?=
 =?utf-8?B?Z1MrdWE1clRJWHVwemRPU3FzL1hWQ2lHM1BRcFpwNk1oTlloUlVXd09TN09a?=
 =?utf-8?B?ajIyMVlkS1hDMXpYODl5MVduL29ZWFZJcnZhaUpweDJRcGJBUkZ5Y3FFSzhY?=
 =?utf-8?B?OE12d1doT2ZKaFBvT1VxRDFYeGhzb1Z4YnNkSlY2R21HQ0tTaW9ROTZ3MW1a?=
 =?utf-8?B?R2lKMWRkZHdIbzdWV2JHdUx2RU90N2NCVkgzUEF4K2VzQWFSdnRPWVo4eDN4?=
 =?utf-8?B?VTJpVFZYL0JYeE1iU3Z2TG8vS1k5MzlvanArc25KcnFOQ3NRSjFLY3VSQmFF?=
 =?utf-8?B?UHFGQzJmT1RZS2hHYVIvUG44VFpYVUVxb3psLzl2cnVGa1JmNkRmaTZqUHF2?=
 =?utf-8?B?VTJONEpIbFNOMlpjWWQ5NGF2bjBEN1hHcktxU21xU2ozVmRhNHhOQytYdVp2?=
 =?utf-8?B?eVIrRUFoQWxqbFB3bW1KNERXWUl0anFwRlRBbnNQUG95NVhZNnJ0RE1mS1dR?=
 =?utf-8?B?dHl1d0pVQ0FLN2ZSMHNhNGFPYXVzUWVrM2k1MkpUa0M1NVRTdXdsRVBmME5p?=
 =?utf-8?B?OWU5aWs2dDE1QzFkSVVUbzVZL0NIdVlJYUEwclcwLzBwUzYwVks2cVFtV2ls?=
 =?utf-8?B?RlM0YjBXczlBZUtMU1lXNWhjb2FtZG1QUjJnbEpxc05SKzZLUVUrYTF4RkRO?=
 =?utf-8?B?OGFVK1RVeG41Ym0yU0crdXRpL20vNTBXNkpaNncwdlBFU2RVQmp1YjBDVmNV?=
 =?utf-8?B?emtWYlJQdFZNT3FhMytxR0xDOXkrdUt3dXg5czVLeUdleUpJeDBKZ1VWUVly?=
 =?utf-8?B?c1g4NTdlaXNRQ2RnN1E4WkpjeDY4OHFzRjF4RFBRcnp0R3R1K1BpNzhITjdp?=
 =?utf-8?B?VWNWSlkyWGJDWEFMU0VENU9IbmlCRExWblBzd0JIVlp6dWtpT2ZEWmJrV254?=
 =?utf-8?B?MnBEdDg0WFU4citsL0w3Y1FYQXZ0L0UwQ2VnVXF5Z2F1cUZoalhHekJKU1Yw?=
 =?utf-8?B?ejFxTTM0ejVobmtqeC96S1ZvWWpVcDhtdzhzbkxzbG9xUGF0aUdkQ1BINlNZ?=
 =?utf-8?B?ei9DWVd1eGVQYjFIT2ViUEhZenBVcEV2RDVMam84WVV3T3FpTHRtZDRNb2Jr?=
 =?utf-8?B?Q0hRcEg0TWMzZWhHUm9Ja2NSa0x0RGlIY29JZjJEamZ6eWp4OHhpN2txOEZX?=
 =?utf-8?B?QkhWWG1mMjR2dnp3K1ZWbEVSdytidWRJajZuN1BORjNieVpXTDdtaFFpNllz?=
 =?utf-8?B?TEc4eU9QMjZPaWkvVUEwb0ZRL2Y2NTYwTWdta21oWDdwUVZydEkxZUxRMjJs?=
 =?utf-8?B?QXRocTZKZkpYYTlaVzNGR0xvR0c3RXhqejdTS0NONlRORVNpOTd1WnIwZlda?=
 =?utf-8?B?eit5bzNRZ0NINzQySlA0bWt3ZS9iQ085OTJIOGd2SlJRZXlEMFV2NXc1NGpV?=
 =?utf-8?B?RmlkYUNNNmUydXhRVEFvQ1pKVmhlNmlwS1lGWTJnY05iWjZwMm5BRFp2QmZi?=
 =?utf-8?B?cklQUCs2ZVcvNElDWWVKKzQ1WlZPSDNHZmVaNnJwMzBpNUdPOWUzRW1xbW5q?=
 =?utf-8?Q?lZle47huvORstflK/oUnhINJo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920c3806-19b9-44ad-2da5-08db7c941b92
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 13:39:36.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVaIAMskdRQH7nI0dHZlUb4wBaSFZTqYvJ5XCUa3jF/M95E4QTiGlqyDsQ6GPy9u9u4lGmwW6+uJKFEEbQyTqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8215

On 28.06.2023 13:32, Andrew Cooper wrote:
> Hello,
> 
> This wasn't a formal discussion point at XenSummit, but Oleksii pointed
> out that it was still a problem, hence this thread.
> 
> As we take on more architectures, it becomes more and more important for
> things to be handled in a mostly-common way.  With that comes quite a
> lot of <xen/foo.h> including <asm/foo.h>, and the arch one being a stub
> in simple cases.
> 
> It would be nice to get rid of the stub files; they're irritating to
> deal with, both when refactoring and simply for the file bloat they create.
> 
> There are two options which come to mind.
> 
> 1) Use __has_include().  This would be ideal, but would require us
> bumping the minimum GCC version to 4.9.2 as a prerequisite.  I'm not
> aware of any way to emulate the necessary behaviour on older toolchains.
> 
> 2) Have a stub "architecture" which is always last on the include path. 
> This would reduce the number of stub files from one set per arch, to
> only one set.

I'd be in favor of 2, which iirc is also how Linux does it (in certain
cases, iirc; or maybe things have changed yet again there). They call
it asm-generic/, which I think is slightly better than anything with
"stub" in its name.

Jan

