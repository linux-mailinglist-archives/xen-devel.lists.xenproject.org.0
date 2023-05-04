Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F576F69AA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 13:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529691.824363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWx6-0004n4-PZ; Thu, 04 May 2023 11:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529691.824363; Thu, 04 May 2023 11:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puWx6-0004jr-M7; Thu, 04 May 2023 11:16:48 +0000
Received: by outflank-mailman (input) for mailman id 529691;
 Thu, 04 May 2023 11:16:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puWx5-0004jh-JF
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 11:16:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 273ec68d-ea6d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 13:16:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9793.eurprd04.prod.outlook.com (2603:10a6:10:4b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 11:16:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 11:16:42 +0000
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
X-Inumbo-ID: 273ec68d-ea6d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N64I1iwmbMxAKwEsaemQDBbUh78M9b+vl3vIpdg2byb4h15Ml2KyE4/FbqUjiBLsfAy+wEtv2pe47QduNqI13EZGjJtKOobaDJ3vmsBjpCMKZulOh9LbnpPIIItv4BDFw8mb/eBLsIuXEkeAt+/Wd8AJutbRn6CPfvm89S04SiVDQrXGxtINwnh+JUv4Aw/cPeMYqdqfbuuzRa2NsDRW6IF/rFy6Lo0AqhGr0uP2L3Dw7hjDzuvBNUByvgnShysbFpWIBXaYdh5GDi+Xr9OsLgMct3uy6nS+ZWQej2Ygdi1TSD5T/DCgJ4JMTTJ6EmjZbKX5A7ovIrdR8oHIh3EQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S3W2ejMYn/rH8lVeyeUbkQTvRytkuUemNf430mkBhQ=;
 b=RWzZlSFlSCpSS9pRfZHp7+gN4AiCw9sx7lVFLQXFvCw82wvRa4WB9A4/frYItAFccbX6WeeCn3ekSGbfSkwZHrbO9rKPNCT0Kpp6AcK8mOdDKgiWLG5daWuPByhF07VKdU1iu5BvXlKy3gddyO4RnVcp/M+LOE9/qzWjoBCbbzwSJoAZ84DzxuIj20vH3mPYpKKAacqDBXuilCLmgyM2b5Jy+9Ey/mllUHMQjheRmkuyh3ejaMvVSyqi2+3TbQRMAli+AWGdra648ARWR+1OF9EYBBKqHqLWiB7lKSniHGC8ZS/1IA9AF2QeJsNeF/V1v2fu41JghJoSnwfqWWwYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S3W2ejMYn/rH8lVeyeUbkQTvRytkuUemNf430mkBhQ=;
 b=ADer5v4rbHKDno4WhREKfnZZWNIPXp/jsi7xsA4Gw2yyH0LwVsYBYaNb/TgGuHmz39MvH8VTHG2R1Jpzr6N0+W/yKeMn/L2q1ShNBsC6p50B7eYWjCo90LcP5UY5vlRzGhnlrKJN98Btg2pbB45/XpOvIkamWRNJuX/oMwCAYFh0VKXBLSrJqDWIBVsvfGAqMq/zVrLHTi/UePR71AetgIbGEb5bNUkiXNZejH9LZntk1Qc6K2kPl9lA9QZT1VD4+DXZgh73IKKRI6GUlBKG7l6OoudNfr2V/xo7Q1ahYzgGSKoSkuE+x53wmXInwmcV78kGTGqHpBMiSm//orteSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e03df79-578b-165e-3935-58370b93e96d@suse.com>
Date: Thu, 4 May 2023 13:16:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 03/14 RESEND] cpufreq: Export intel_feature_detect
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-4-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230501193034.88575-4-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9793:EE_
X-MS-Office365-Filtering-Correlation-Id: fc258486-3d59-47f4-78b1-08db4c9109ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HIwKMs2YLwsCkBHnnJY+U0XWF+5LsfrgJvSlO/KrgIlaKc7E8uSWIOfRbnXT9CiG46cLJZVg2kDqTr0w1lZdcSK0I6+ilSpjitD8H+18jWqsf4deC9goPatvKsjS+yJBo0jViHGjifwpqxpWs/ygHXKVvfry5oA6GfA4V11A2ip9+YU8fetti8AlEWUA8YRV1vxBrkYY9e+vPZ57oBCfs7rO1CjtVBgKqJQRn6XOlirMBW/eg1Ncb4Lv9QM9CyFqVoB/4oP2Wiu5xzhPseIJnqAhqU/8NMhVt94dCiMqqSYthtT7pVEjgHV0ghBiUH6KBH32YrxQJ2B3BBDuI6urssOj5d6iO19JinWA0b64aonMxN/nyNLxPZjgZldVVvs3txFyfMlvHMZyTtmaIplFcWScomdWiY/6bYIsufL97yZeYw5HdV2D6k40uNxsvDWBMFsTtq/xvFmV7bG1O3wgY+1QVDcQHs0Luea5Htnj1DijIHwobJ5yEmRe86sx794Ml4pBp0EgZA9WtvRHBsUwEiouiT91lGjbzvw5Hi+DaN+t6CbW5eJV9OeNdmoLRoYGU5CNufgs29z1Ynk2BqVPYAJc98KFHmYrr/lXv3s87Fym4OLHRI9EiX3ruq15IUbhwyK4FEXM6Z/ijNHKiXXA8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(31696002)(6666004)(86362001)(41300700001)(6486002)(478600001)(36756003)(66476007)(66556008)(66946007)(4326008)(6916009)(558084003)(316002)(54906003)(5660300002)(2616005)(31686004)(6506007)(26005)(83380400001)(53546011)(6512007)(2906002)(186003)(8676002)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWpJYXlEUU9jUk1wV3h4WHRKY3d5cFlHSGJWd1dLL0wyTENLb3NtVG11SEwv?=
 =?utf-8?B?Z052bGY2L2J6c1pxd3V6L1NFTHYrQmpYRzFiSkxmVmdBdloweFRkNXlnaFdx?=
 =?utf-8?B?dFFMNGJaNm9ZQkpabitsRVplUWhFbVNOWEY1TE52SDRERmZycFNkK3hhQ0VB?=
 =?utf-8?B?WTQxS2xTTGdUS2hHYWFyWDZCeS93OXB6UldJUURpTW1xTjlCWXdLOE1uZG93?=
 =?utf-8?B?K2RwVmdXMGZXMnA4cS85R2lUaHJRUDlSclBhbTRWbkJzcVdCbUMvSS9IZE52?=
 =?utf-8?B?cERTcngrL1RPQjZGdWNPdTFHSUJKZkdUR0h6NWdsVHdpVmNMRGZZQ2dTNnNK?=
 =?utf-8?B?d01CMzE5YVlsWURPYktFQ2Z0Snl6TzU3eXZTUXdkMHFwbndqTTU3S3AzZHlQ?=
 =?utf-8?B?dHlDNzErbW1WRXdVdXZ1WkJEL3FDTXBCNThMem40WVRTNjZPcFp5SUpuUXdL?=
 =?utf-8?B?SVl6M1FTMVloVG9oQ3hqSFJqSlJPOWpYc3VUc1lCYTdETEVJVWJLU2wwUWhw?=
 =?utf-8?B?TFM2YmdxdVpWeksvNW4wakNDNlRrWHdPTE94amRQTFpxaTlKaHhlTmJWQ1la?=
 =?utf-8?B?bzhab3NKZW0vdHBNdzZwRHlMZnBBUlY4TmtpTnFCMUtVSWZHMEphSGNIOGNZ?=
 =?utf-8?B?RDQ0eWZIbUV2WGFkQkNGMDZ1eGpwNGd4ZTk5SFc3TEhIamVHVER5VXcrQVVa?=
 =?utf-8?B?ZmV5YzFma2lHME1VQ2tJQ20rc0o5bFN5RldLYkZJQmdRMzJpN1RtN25WdVB0?=
 =?utf-8?B?Y1FIZ2w4YlBNSU1xc2VTV0tDYjNpLzlEeW1mU0pxeHA5N0ZURFVyd3pKOENv?=
 =?utf-8?B?d2NrMUVjcFlFaVUxQ0JMM0lIWnl1NW9vK0xveVIveUpzQ1JFVFFGekdmY2lS?=
 =?utf-8?B?bWQ0SW0yRUlnNzJHay9PQVZDYW55RlZQajFISWJ3RUVNS0lCb3B4VXdBNGhE?=
 =?utf-8?B?WjZsdE1zd0xSRzRNamQrNWx3VkpjSThabE1BOUhvTUhneUowTmFSbEcraGVy?=
 =?utf-8?B?SEVWOXM0TzdJVVFLeVFSMzJoRVJmdGFMWmFNZDZRRW5zVk8zN0IxWGV5azZ2?=
 =?utf-8?B?bzkxMXdQaExYdTlPcUpjWnR6dTQyRFVUbDMvYjFZU1BiM0FZa3V4K2tBLzVz?=
 =?utf-8?B?K29pdGVrUUhXZzV2bmpodnFGaW1Rd3kvN2k1b21uMFJaR3ZudW5GTDN2MzJy?=
 =?utf-8?B?aWdYU0NQU2pKdHRLVkRRZ3BKQ0dRaXZ4dTJ2MUVrTmRIenRnR0hjejJtMmpR?=
 =?utf-8?B?Y3FRMnhNTy93UXV4azc3L1RNWnBFTU5aRkJGTGdaSXl4d2ZqZTd0aUJzN25X?=
 =?utf-8?B?QXpiTWtUKy9ZR1hoa0xPQnhMMURUcHdNRFpHUldLcmJRS0VKOERJSkkxMGNU?=
 =?utf-8?B?dEhwaVZTdU02SlNjRHNrdDB5Mi8rR3BlVXJIalB6WEF2eWZsdmhtMzZncSs3?=
 =?utf-8?B?eTFSeFdtRjlwZllaeWtoWDhzVUZ1WTN6T3d2Rm5yVXZjOW5iSnFrNEpjeGts?=
 =?utf-8?B?clR3TmV6RU5yZnVsdUtXa0RnQVlDelQzTnJYMlJ0Sk44V04zWXBpa0J3T1FP?=
 =?utf-8?B?SUVNcFZiRFpLVXhrSnc5QVJiek42V2YwQnFUNzhSWXYrUVZCczJNWnVxbUR2?=
 =?utf-8?B?TVRHVXdvTXZtakd2NFJFV2MydHFTdlZOVytjOTVzalJDYW9PMmxmOUpkMjds?=
 =?utf-8?B?Q3oyMXpKL3NrWFIrSE1SanAwTGRNdHlTRUZqNGdtME1Pb2hIL1Y4eFJIcXRt?=
 =?utf-8?B?Y3pvTHV2UmE2YXkzOXljcldIT2d0a1BnTnhOTGRrMjNyS2hidmxNK2FtVnRp?=
 =?utf-8?B?NmtlQ00vWG9vT1hBQnlXSk40NFROZ0RCMlNIanE2WmFRUnNOSVBsbkxkR3JO?=
 =?utf-8?B?NjNDWGllajQwWmNjVVdRNDYwTmgxRzJQSENxdDJQUXJ5dTBxM2VrTjFubmcw?=
 =?utf-8?B?OTdUYkZSQXBpOUc4cnVhVlpNbXR5T2tUOXFIM1AxMWtXU3QyWFRsbjluU2FY?=
 =?utf-8?B?c3hERTVPUktCQ0U0MjMxeHg1d2R2cmYzU1FIRStURU9wLzNERTM0bTk0YjBU?=
 =?utf-8?B?YW5yR1Y3S1RDUHY3RFh2TkNndWEwbm0rL1ZFQXRYQ3RTUXlQZDVVZFJLSlAr?=
 =?utf-8?Q?4Dx370DvV7jUT4+Hv20Hnme4l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc258486-3d59-47f4-78b1-08db4c9109ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 11:16:42.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4U8hSPxoXLRjwgmBdo4RU0a/HVvVPoLKl1sRySQDGl4ou0pcIlYRbOuI5PxhR2twKFzwRFNGKemn7r+2ISLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9793

On 01.05.2023 21:30, Jason Andryuk wrote:
> Export feature_detect as intel_feature_detect so it can be re-used by
> HWP.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



