Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A345274D4B9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 13:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561181.877568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpHI-0006Hp-7R; Mon, 10 Jul 2023 11:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561181.877568; Mon, 10 Jul 2023 11:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIpHI-0006Eu-4D; Mon, 10 Jul 2023 11:42:04 +0000
Received: by outflank-mailman (input) for mailman id 561181;
 Mon, 10 Jul 2023 11:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIpHG-0006Eo-LI
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 11:42:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7f1bd96-1f16-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 13:42:00 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM8PR04MB7954.eurprd04.prod.outlook.com (2603:10a6:20b:237::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 11:41:56 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 11:41:56 +0000
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
X-Inumbo-ID: c7f1bd96-1f16-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jydgb0r15t4QzF3JFKXNqvmrH49YzT5HgkH25qmObzJIoDiY+e1f+6jDla6XdJ1TH17MXlNK48eytBGAfmDTs1sSzu6LUEnJYTSHrAu0BZx/mrdMD8tvO3JMIOgVCRkRd6HICkQHVx1vchULQmHCsTXUywpxhVVtG/2MlDqnf6nR7CFv3UQZrKM/NQdGpFt2rpxW+go7X1JuWGrsNh3aDuoNH0pJ9+h+v5ej251vgbIJ2vrE2BHrGi0c9UoG7xxCK23rUmhaCBCQ44a0e0yu2xx6XLuVA4oFbXNXtg9GweN3MrGaG0lEstD9qgubUdt/wsDNGKzeCV/nC3DKRcwdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4ChUr3+yTXCGAely9Zb2mn+pPQKiUfYt0OutNbQLEk=;
 b=NESaHzVriVU+U1PRHLUQoIC7ymLYKRN9YpzCPu4pZ4kWzK3qGsvyyeXLvMSjptuOg7XpH6/UDKC+ykPazWuzw6c8EbusANntVzulo+V7smW0MzoWisce4Eisb0/m2NM3Wp2TWAeDhevkIKt/fm/ltobX2hBMGS7ky7J9zNIwT9+yF0tlJ6m2m0c/+xJKtigW5kDHkGWcs9wFn/qbecSbHexlnVf9Wl43uQ+EcwHXOR9E4vBZ38fedEbi7D4Ke3iksdXzDGtrzNhdAE9iw7Yy1ggyLSjxs53trOaLFc+36rVjeEr2Yd9jQ6rmf+OxKnoAa4VDi7+WOIr//V0VnhemwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4ChUr3+yTXCGAely9Zb2mn+pPQKiUfYt0OutNbQLEk=;
 b=zhyBL78Vzab8y1cDEvfDVuO6G+xrD5tHFcAgF8dGqjtzu6QqtZjsFhNBalRnQCDixG+dpk/Kz/2M/Zhe6+mO2UHhDYD7tpBfPj1kQUrhfwHw7BSCP2hPQzJBzQMFtvw4S4zKVvkrJRh23GxvJpYWQyHYTeAAvA4tqfUTW6/xOJaWuVSqyFKqcP6zXNWZi6g515GNSSHpfEOHurBHOlq0rsfbCSMdWwp1QAFfZbdXEJ1R80dSJu6EAXQCuztiTydsJwiJCGoUbzNHwojd2BmkmlpewzVdg2V40RkdM+RpE1D2IevZm9/2zYZzI4WhGqbu3TUb19n6Il2TKXGntNJJnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d89a2ccd-bb76-cf0e-687c-e4f2e333b1e7@suse.com>
Date: Mon, 10 Jul 2023 13:41:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 01/15] cpufreq: Allow restricting to internal governors
 only
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-2-jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230706185440.48333-2-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::11) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM8PR04MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: f1012461-824a-4ee6-ea37-08db813aa9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tLq6O6JOuQOS/RmvNKDr5t3oqaE0QAt/s0bjHtToui/ph4DcUC8M6KPvT+/APK++NDUjtAA/CJ74Ir5PdLTEMEw2wKITqklQvCixdepVKxBTswD41PH/VcghyaHabKc6zF808LDUWlHjjReEUwiJMzWNyC0ly4DuxZxxJt4yGPzIpuO+ZIdMkwVRZZedJASSmRpKY3h5XTcu04VJEDfbVRX/1wqwgKnJXZdiYXx6Lwok8xJhwzVqZe5Vs5+JU+p6jUIJeUHoWt1qUPVwry2es82Bbrmo9VTQZBqBl+hkx8aUjTGRSg3B7l13BFwBDZgFf9JE8VlT9Sz/qDs9UHJPvQLBHWM8oJbyi8zApfCV/lnwThFbrl8zhK+KcY4qtp1ssJwIiQj2KLdS4mt7vky42jyhMriydpD1GTri2AOPQEp2VC3cyOYgkhYGNB3SFGZAimec5Tc0bUQkeiF6vrAvcfopnqu2472QRSZLQSoW50N/KkMDUkm7uPCYeLk9mGsb61lbyxWFh6A905O1kd9peBqUeh9Za+YJdbUV007ovSb7YiBUbuRdX11hC+LRo1YoUg3qfJ6I3SxIamE69/YptjvBdBn3mJrKIbQN/gnuCBBuyX6WdGb4NibdgA8XFekIcOjs5grM7yJILO80jQ5H6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39850400004)(451199021)(53546011)(6506007)(186003)(26005)(86362001)(8676002)(8936002)(2616005)(31696002)(31686004)(5660300002)(6512007)(6486002)(41300700001)(66476007)(66556008)(66946007)(2906002)(36756003)(478600001)(4744005)(38100700002)(4326008)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkc4UUxxZlFqMGNNRVpoVEQyQ216K2lNTDR2a2hTRUowYW5zbkRMeDk2Y05r?=
 =?utf-8?B?djVnNW5nY1IvZXZva0Rsclo5Kzd4WUtUU2ZOT1JueWM2VkFESjFnZ1FxT0pK?=
 =?utf-8?B?OGR4UlF0YmpRWm1MUnphaUNBN1JVN1hzSmV3Q1dnem9LbllOQnltemhlNlNY?=
 =?utf-8?B?WG1oYVNCUzVjRXp4N1RXb2c4RkFDcnhjNUFqVzFCMGFvUmk0UVdxWWMydmZF?=
 =?utf-8?B?WDFzRjdya3ZCM3FzVStnbnpMd3VJL016WnZEZFVETGlHV3I1dGhsUTRzR0cz?=
 =?utf-8?B?amRFZngrbkY5SXA1S1hXUjljNjZyT1QrMmUzWFpBWmY3MXJlM0JpMWUyZGlh?=
 =?utf-8?B?ckdZekl5dFJPUUYxUDZtOTJLVG5rT1FBVHg0YU5WSnRKL0tnUDlyYm56VUdX?=
 =?utf-8?B?Y3hYd0dsaTJBWGRJcEtRUXNpVm5TR0lXWVh5YmlyaTFpMnZBcHJCNUI2WlZS?=
 =?utf-8?B?YlNSL3MrS092aWRqVTJYME9vTHZ0ZGZIdTQ4MXo2TEYvODVHYnNkRUVnZXJo?=
 =?utf-8?B?WXpFa0VSaGgzYisrOGlEOUw5SzdGOHFIRy9qSlpCRG5YQXlDMzN5QXlQeW15?=
 =?utf-8?B?d0loZE9BT0hJQVBhL1p6YW90NWVtYjdBU3NMVGVQemlHdVZxNW5YVHpFVVBT?=
 =?utf-8?B?TDMyVkRlN0g0RTZIcnMyUFROcnp5czZrd1d1bjZKb1h3M0pPSHE2ckN3aTcx?=
 =?utf-8?B?VEVEWG1Ld3ZPNmF4STBYQ1JSaS9IMkdQcFhyNWFCV1ora3NqT3Z2bTVIUDBJ?=
 =?utf-8?B?ejd4bjZ1aUdLNXNJSW52WURoS1pIdDQ2QjRTUVFuQnFNRHlaZTU3MFJ6Zy9l?=
 =?utf-8?B?bXhmUUdGcmhGM1poZ2NKc3pVTlN3T3RtQlU2REtRV1JtN2NFRFVHRXNOeWda?=
 =?utf-8?B?ZFpIb0Y3cWZRU2JJOG9MNll4SnV0L3JDejFVbUlXd2ppdy9xQ3JjaktTNzNG?=
 =?utf-8?B?T1ZFYUhiMWo4SmZSTkxNdzN2dE9sbWJoRzdRZDYwTlI1OUhTaU5XbVRWT1dF?=
 =?utf-8?B?M2JFRTNTT2lNK292Q1l4VlRvTWI4cUVOWm8vV1ptdW1ScmVYclVtdzRMcGdU?=
 =?utf-8?B?ZE8wMHlyK1BENW9rNlU4elQ0RW5nNmptNUJqYndwZjdQaENsTnNibm5uZkJW?=
 =?utf-8?B?QjdvejdEejltM0pIemEvVWtjd2lhOXExejBhVUgvWkRHTnl2TWdGM1h3MWVD?=
 =?utf-8?B?V3FmZGlEeXhVS0NwRDl2Vll6VEZaM1hPRUNCckdGVEZGNElTTUNZdFl2UC9v?=
 =?utf-8?B?NVFnanZUK0M5K010UVJYWGRDZ2x5NmpQOU55K1JleU9oalljemR3Mk1TNWdP?=
 =?utf-8?B?V3dyU29pK3psOG9sbCtKRzlwZ0lyTDFtOE05cklETnJMUWtPT0QrZnUxM2F4?=
 =?utf-8?B?NjhWeS94RTdhWjJyMjMwQnNHMFZFM3I5emx0a1pla3J5cFFjNmJyRlQyMmpR?=
 =?utf-8?B?S3RYSWxVcE10a2xRYXFMUjAxcG4vbnZFekdodWliN3VWV0c4cVlRczhmN2pZ?=
 =?utf-8?B?Y0lIRHZINm42eURCVFpVa2g3OHdmZVpub1E4cWo4YWFrckFTL2l3MmVsTTB0?=
 =?utf-8?B?L0c5ZHlSSnhKMEwvYUxjckFTMjRISjlVR25lL0d6dTEzbEswMWJ4a2UwWFg3?=
 =?utf-8?B?ckh5YVY4WCtrR2dBQ1BSRS8ybWRubFZJY3FRZ1hKd2NmdnFZNWxQQ2xMaFZw?=
 =?utf-8?B?VmlZNTJHQ0tKS3BBZWRYLzU3VXFxa1lHamc4QUZwakZPcC9qdUtVTFFydDdX?=
 =?utf-8?B?TVdSTWpVbWtLRUk5bk1saWZKR3g3UkxqRXRkQzAxVDdTZTZVY0JUazQ4aGlq?=
 =?utf-8?B?cnpFSE1SY3d6RE5QWUFPZnpxR0F1REgwZDQwRnY3MC9IZUgrdGpBL2lrc3J0?=
 =?utf-8?B?Y3pnNDhzN0dZbGlkN25GQWtIT2ZBMjV4Um11R2hBRGtzSzBRSVV0dHFaS2hr?=
 =?utf-8?B?WTR2bGRkTzZiNTJIUjBSSm9OMnlCaW1tZUhWczJjUEpNVHdkL2xUcytXZzZF?=
 =?utf-8?B?OFkwZ3Q0Q2N5R3ZvVWdRbHA2ZHNlcXF6cHRoNGZpbEJUK3NqUngzc1dqSGdB?=
 =?utf-8?B?cVlLOU1ia1c1aDBNaXJFaHJ3YWMwbWVRb3JKRHA2QWJ1cFBocEZkaGdWbWNx?=
 =?utf-8?Q?SEDPEpzur2Jd3PsUyrJCni32N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1012461-824a-4ee6-ea37-08db813aa9cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 11:41:56.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kOwuDyoyAqPuCfnzZLcp4Id0mJFiXC80X1Ur17Qsgn4r4SDEfB04Ry7VgQuBu/c0Wuhg2mcQ5RbxZWmfeUBIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7954

On 06.07.2023 20:54, Jason Andryuk wrote:
> For hwp, the standard governors are not usable, and only the internal
> one is applicable.  Add the cpufreq_governor_internal boolean to
> indicate when an internal governor, like hwp, will be used.  This is set
> during presmp_initcall, and governor registration can be skipped when
> called during initcall.
> 
> This way unusable governors are not registered, and only compatible
> governors are advertised to userspace.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



