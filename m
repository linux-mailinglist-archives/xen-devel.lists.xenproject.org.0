Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A175F42F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568733.888595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLM-0001JU-5V; Mon, 24 Jul 2023 11:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568733.888595; Mon, 24 Jul 2023 11:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtLM-0001FY-1y; Mon, 24 Jul 2023 11:03:12 +0000
Received: by outflank-mailman (input) for mailman id 568733;
 Mon, 24 Jul 2023 11:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vJ35=DK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qNtLK-0008WC-CW
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:03:10 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac139c70-2a11-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 13:03:08 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB10034.eurprd04.prod.outlook.com (2603:10a6:10:4c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Mon, 24 Jul
 2023 11:03:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 11:03:05 +0000
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
X-Inumbo-ID: ac139c70-2a11-11ee-8612-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzLXYt9BAHZ7ZrCmErCM6KXRgPQ0g7uLiqavI8pTdBkbJ5W8EH/8F5vAY2It6OrqslY3/6+GaDalpDjzeYpK2dSHnVBovE2P8mIvJUxcGsof0Eah8fX/s90MgsewQsoYZM68T17BZUn3qXK//V830ffxdwBjsyf5A5bn/dxjiJLmqOrQFAg8x8m8eky5xMlMc0chqiWlKQRBv7QwGlzQQVwx1Xydd35ZNKz/Hd1HD22wE9FVo6qoJbNUf6ZpB4g8E2fmMVzVoEwYv0Ug0W/nWsFWa334WNPhyS/W4Plntq+SsKxwsJExK0ml649IhzNO9dwB7LwaZiWF8GW7CF1OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRqRIWSw/+qjfthOL/y9AHdHG6EDej1B561NpI8uduk=;
 b=oTd4vv9NpF62zNVUYbxCtFMK8RLNN5eSAJrR7A1g09OWJcijsSW9Bx9Ueiy6Rf6FTC1E4LDY6bcZGiLUYNlCCq4ml2qgdeISd44tNgyH2Vi0o+ac0w/+eOHlYuEn6TSKbCwM2B4uHRDT9FFFWIiQkz7cdEzQQMhwW9bOAtnHbYJnu34EYF64C7sqVqGmO3lbWCj3/Sxhlj1xlW52LhvCWl7itoNFCUgLdRsCPCnjIXVNRI0VUXPl8qgs9ndn3t1v8rFZYZx+4fSe8mtJN46L6FUZ+yxsXAIySENxD3AFz6IDttaPPA8/Xw7oT5Ynf4i7VilEn93i3kc4ZC1Dxv8o/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRqRIWSw/+qjfthOL/y9AHdHG6EDej1B561NpI8uduk=;
 b=SpyUkBsU30gZt/ciXZYdc/Fq2xAultvlXjcQ5xkiDEGJfCRTvQYdDGR/kmK0puPrLNobpn4vL0WAOBOFQTZc+5eNgGk4QBC719CHEOBBAq9lIGndpjJsoSApUJBzS/icRzzTHGVGDZQTRnM8Ze3DlSe5sMdakfcSkvJsy1ycHy0rmEX606PJdEHlNEnvOgQm+1lwFgzcEjruREpzkstmeniOKT+9KfEQ9N+6Dn0mVvwy4Mig0ChOCK9hIOgIEV5YzmHoilTnuE4qRa7iRSC59dXZtsWGNj8D76h3jUXHBLSMAZtc6OHBAnxh1El0QadrJObZsTExjf4dZDh0iYntEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb97a392-16fb-136d-5781-095fc1cf8406@suse.com>
Date: Mon, 24 Jul 2023 13:03:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB10034:EE_
X-MS-Office365-Filtering-Correlation-Id: 266baf04-b201-480e-3fc9-08db8c358eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYJ6H28v5vqsJ0W5xZ2Xo9qBfTf8+oOfQIRbIlt0xyxv59ATb5rQIQHfdot3F6aFuV0y1numF41eMDkqSuIcyFyg+CLQLyA0jg7Iy4z0581B9ukP729ooovFnJ+SNXsu76wx344tyz8t5ktAPDvmzKgxk7mBO2+AOBEjh82KmBb419uaepX7rMpEKZoXJ6+WcmIHsNjen29LX0MNdLfTe6RgyFvviohBNnMPNWX61ZOXUys/kKCV3bPbay07T8lvofJJAUpIc2dl97lhOpKB6lKqzSDgw9f9ym5oCQ/T5o1XjUfnsW9o5/XCGB9hO9wJjReel6bz4yzPyKqH1TOwC0+NafSGI75WxqZa06EJTh6BOz8ZkO1IgHumjvdGpIuMA5b5KeXTG3eB1sI5ua5MH7qyX5LorG+GpAEItJfxnGuby7o5ZAaGJTQd9fnbR0e5hzWJVTdNSU2Wp1u7HLZuLZRCvjD8fXj3iC3jraioYKMjf/Mcqbxh9+Zknq+beC/Anc0j2dAi3GL0MlmE/tRsnG/Gwj2UC0bf+GFOg++m9uEwfeNPV3WoMO67zzOKCjXfWuLjuRmPun5k7JG/X2HQNZfc7rM5Fw5AvHRzQqOJtGZJdCjHB3LtFk5vXr9Lcp2kH9PHOo1QVqFA8KMo32kCjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(31686004)(6512007)(41300700001)(316002)(4326008)(26005)(6506007)(186003)(53546011)(54906003)(5660300002)(6486002)(66556008)(8936002)(8676002)(66476007)(6916009)(66946007)(478600001)(2616005)(83380400001)(2906002)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1ZudncrSjhNLzRnVjc0enNtUHorSkcwSmtiOCtRbDE5am9tZDRBWkw1S09h?=
 =?utf-8?B?SnI2SkR1RmRiZmdxTTlUMFRsNEQ5MS9EbXpPSDVCUjRQbDlnYnJVMWc1S3Mz?=
 =?utf-8?B?enpCRktLQmc2aEJzeUd6Ym44blllYUJQUzc1MDNWMVlLejJtNUc2SXcwTi9u?=
 =?utf-8?B?ejI2UzB0c0MxdkJnWXJTRE1WaHBaeEZlYkhoRmRsNkhVWGZEeUpzeHE4TUhr?=
 =?utf-8?B?bWV3WCtFQ1BOd09iZGZ5QVYyUlZ4WDhESVM5NTFZajRVRWRpWmxxMXdlNnFm?=
 =?utf-8?B?YmRwL3dMVVZUR1lXQmlHMTBqcjVLdWE1NnkrVjFleHZiK0RFTWpBbGF3Z245?=
 =?utf-8?B?aGxCdEEwdEhXM3Q3UzlhU1ZpWU5OQXNNTFp6blJoUy9WMUt4cE9SNGpQSGdT?=
 =?utf-8?B?WCtEWlpaOEdDZ0FXd1RSS1Npc3k0NlNUMEpwTFVTMXlpbTFDak9Za0Fna0Zz?=
 =?utf-8?B?cTNwMlVDQnQycnVXZDdxZXNNbWlZZ3h1Ry9yVVBXYkloK2JHcWNkbWJtTytM?=
 =?utf-8?B?ekpYVFBBeTYrK2VOR2h5UWlsVlBVZUhuU0ZzYXlSWFMzZWd5NDlsemt4K3VM?=
 =?utf-8?B?cTlRTEdGR3dSeExUaTJ2dkYxbWR6RnNpY0wyQnV3YUNmOTFCeTVHKzdDWnBq?=
 =?utf-8?B?VVNveDdLUzNPUElKSGtwSnBaREhZSVJaR2Y1a1RmN1R5SDlCSlpBOUorM25Q?=
 =?utf-8?B?SlkvWnRBbUdIWndhNjBSMnlZVWIwUnJESC9kRFZmK1dkUFBPL2luanVhTlFn?=
 =?utf-8?B?MVFKT2g4bVJlR1FHSStaWmxpTWZET3kveTJsTnlacDREMEJzeEFGY2V4K0p1?=
 =?utf-8?B?WnJHRWpRVHBodmtHVWp3V1kwcXVoT29VVlpIRk16d3NWbWwzUVo2ZFZtcHFL?=
 =?utf-8?B?WGZuOFJVazM4VFk2eG1tK0FVTXNtNFU3OWtXVDVCamh2aS9yY2JiRXlUU3FT?=
 =?utf-8?B?cGY0UkhjSU9VbUtWb3dRK1doRjNYMytyWDBXdjFma0dDdnFCdWo0bUp5M0tt?=
 =?utf-8?B?VEhaaE5DM1ZCOFZVODdPZElBSmpML1NlMFNmK01Zb1ltRHh3NGxzYjg2d1Vh?=
 =?utf-8?B?dXR1WVFWRG9mTEhORms3aDBjMHFGTFlCRTkzSWJiK1B5NC8zYlRLYUIrR3Rz?=
 =?utf-8?B?Q2R1eG5TMytDRWVIV2dyZ25JYzMvdUJXSG5BaUJFTlBsTUxzQ25DQzlQSFNv?=
 =?utf-8?B?d084T3JvZjdsT2xpMlFGOFRpeVpOaTBNUTJLUjhaSERuOTdhNXRLSTFhOTY5?=
 =?utf-8?B?bTZUcml4Mk1Rd09yczNGVXZTSlVBZ05mZ2FUQTY4ZWt4UjlpeC9zWHZIQTY2?=
 =?utf-8?B?UTRBM3NtYVNOd045Tkx4cDd6cTRzcSs1M1IvMm51K3Z2bDFUcjZHZTJjcnFh?=
 =?utf-8?B?OWpDNU5hSEExQVN3eGloNkN2VWV5WDVEbGgxd1FYb2p5RzJpdldkWVV6UG5t?=
 =?utf-8?B?QWY1MGdiYXZKUlNkZmp1czlCSHYxNFZGSEJVUTVGZmJWa2xEcmJ6Qmt0YnJW?=
 =?utf-8?B?dWcyeGd1VTFnM09NYTRuM0lSTE1YUDJRWk1weVVhVlA1ci9WV2lDak9pbGRo?=
 =?utf-8?B?Nno4cCtoQ21NQnBFRUdUSVduM051bDhvaDVxeGpKZmVXbHBtblBtSGc2cS80?=
 =?utf-8?B?RkRjZVk0dXdGZDd3ODljZjJWVWhQdUNiN2ZRelBkc0wxZTFJK3cxeEM2WWRZ?=
 =?utf-8?B?L09BRHR1Rk1kOUxxZE8xaVo0OVRtKzNmMEJ5NmxSS25hUHl3alQ2elo5aEFP?=
 =?utf-8?B?NFp3RjJiVTFMMkZqVjZYWG0wbHZQSlN1NDVubXRhVlpjcS9vb0lWR3dvRTFx?=
 =?utf-8?B?OUtQTmdlYmE3T09JbFZNUmN3ZkFCekI0UDN6eCswNjZXem1DZlRmY1hQdENj?=
 =?utf-8?B?RC9xUlVJVS9VYW8rRWpBRXh1VzdlNEYvbEJBbWhwejNTRE5sUk1ybXNZZ2Uw?=
 =?utf-8?B?NmtMSStwWDRZeFlyMk9hQXVxWEdPSW1wMlAwdkVsL05HclhlcURmRjdzdVZs?=
 =?utf-8?B?Y3JaenBpWExrcGduSXVCck1FWTZKRis5ZGRBd2lpSEZLRkk0T2p0N1pBd0dq?=
 =?utf-8?B?aFVJZTU4bkl6aWFLQjFOaU8rNXJQZ2xoWDltdkNuaFYrcmNiK2NaVVBUMnNQ?=
 =?utf-8?Q?kz3tk0JITWUAM7HvDRup7LIxj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266baf04-b201-480e-3fc9-08db8c358eaa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:03:05.8869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwKf/UzjS/VfO3cJlTrN0E9DJje/aH6WA3HUlEZe2qJNiPPFin+q0N1J4S0V51DcU6YYCONUy/2tcEcSZeYF3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10034

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,10 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);

Neither this nor ...

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -97,6 +97,10 @@ static void cf_check control_write(
>          for ( i = 0; i < msix->max_entries; i++ )
>              if ( !msix->entries[i].masked && msix->entries[i].updated )
>                  update_entry(&msix->entries[i], pdev, i);
> +
> +        /* Make sure guest doesn't enable INTx while enabling MSI-X. */
> +        if ( !is_hardware_domain(pdev->domain) )
> +            pci_intx(pdev, false);

... this has a counterpart passing true, to restore pin-based IRQs.
While it looks like we have a pre-existing issue here as well
(see __pci_disable_msi() vs __pci_disable_msix()), could you clarify
how this is meant to work for DomU-s?

Jan

