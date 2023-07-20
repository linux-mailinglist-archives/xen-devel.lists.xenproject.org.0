Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFA75A6F8
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 08:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566378.885121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNYC-0005YV-T5; Thu, 20 Jul 2023 06:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566378.885121; Thu, 20 Jul 2023 06:54:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMNYC-0005Vu-QJ; Thu, 20 Jul 2023 06:54:12 +0000
Received: by outflank-mailman (input) for mailman id 566378;
 Thu, 20 Jul 2023 06:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMNYB-0005VI-Ba
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 06:54:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39fbf777-26ca-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 08:54:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 06:54:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 06:54:07 +0000
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
X-Inumbo-ID: 39fbf777-26ca-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DECQIz602xp+9BS2Dqmc143170jNb2qL5KNLvEUQVEAdtgOYWrknTfcyBknbGiZxgmGhI4Eng3mouFumd7Y/q73OE5sOhNXW6tD76AEHr5oTaqhsKnVczOPNEmSOjSLF2K/AkJhbw+h38TACP3X06BZm964JcyWyqowYGvvPliFyf1RvAbEMp2zKS/D7hoDeWMRjAVV/fyCjUhw4HAMcEf6arB+4lTP3HJDERt35dou+cCpKOKllS1IO7M43DoWIyr+2kSjDSlgjz6pY/XJ1Y/7AvyI9nsF7w9PFrwndtgF1GBweKS6gNT55T+Jxo37C7QFvn+ueV5nPlrsPwT8V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1p7v/xnAfS3GdvV0n3XaCjPonJf4p36L4CnTiaPwEo=;
 b=G7ysDjnGLk5C0tJCEKdCjmkUCpkahvR9jaxqf3LmNqRyVREh7bVCjHmsqi8Ngc7Rhje9bqnSy1GoXvY0B03VL6KsrloAf2U0IdKmUrdhjc+kfEJfusXazlZH1zzZ3qEoeNJPXvn45/rQ7nvamTHY+OD+B+feNIe0xG24jMY7AnxB4GiGmaPVd+h0o+d7iEiSw4MOn35pTZW38aylfqXtP8AlUcHAV3Rbng594TvqMXJuFKttCBMA7PTl4fXkdsWJtlp0Y1daCpdSWhoLeYCEUQq37pcX6UyhjY0kC3jbJT8+G2Dyb6B6D9b6kxDwww3u5sqJpeYo2NRi23t4fwY72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1p7v/xnAfS3GdvV0n3XaCjPonJf4p36L4CnTiaPwEo=;
 b=SHr2JqybKSiMkq7T8sm0SnXB/+wyKOPgTwvkf/HZRuk+X86OV7XXlmTU3nvZ1sTnZRCA8uP90CZtUbXaoJ9uW7x62o13AcXY4PTy+8J80D7ihdFIoXhCxV2FKgPuLfd9HWiAUsxrOwOIhxMfiTN8xO9f9ZPOVs8s8OUr8mp3aGAicOzeVeCPc2bTZpy9wZ08F6vM+BJ8FK44VrH/lrL8ZXO0rzrtj3twSZjP6OjDlKSA5W1gs3Q048a2PVjCFp3SsXUprykjkTZXXEXqe3yDc5Tz0pPrmzxotSpf+LT5ZVxQ158gRGzp0MIUNyVmYWdPCeqyDBibOVaJrzyxoObpWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3249fd7b-e58e-0400-7087-06460a38f177@suse.com>
Date: Thu, 20 Jul 2023 08:54:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-13-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb5e209-0e80-4da8-fd7b-08db88ee1cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fGh/D4byJ8s7xmBiLK6Z6BR1mE5Bc+VaHaCOScTmC254x49ek7X1IDIeFou0hvKpzCx3Xa4alOVRgKwV9Zzei/eqDfr8pMFr1lYskBzaQY4zXzjxSyVu9Tdi5qB+USVjaCwhJfqR1Wm95HbNVRosj3Ww+lJCPb7v2rnPt26d2Z50BilVe0IhvIwKdN87ALgyPl8AkEujWlFsGXAgeUbF/6oZFJ1+G6x4BTnELhN3vm4UlwfkXfpKp+rBS/3lmWrV71n3xuVr7K7xgDiUQQ70e8DgzcTyyWVdPOy0VNyQPDMsNhcKbYI/emvMsMEK5EHrSVgDhkYqR3YE6dCgtBtmLXUxqafHkERRooQLkNsDrXamAsvCW1/MmyJb2WazArtCkks2DJTcd6OEoCowyQCtyEVSptWcfDz/K0OF2pGTDEZTX8yve4wd/n3YcT67T7SP2Z2/L6c0qIXCMiYoR8ttPhoCBg9+wD+ITfySxxXB13Uam7m9XQSETUMn25gwehuhu8hb0CDPJRny3PES4gFYG+/4dVa4jlaVaBEFFW2d4QWamPTzQDJp+/0BFFXiMzLq/AmO/YnY5G9CNZxpjXcdwp9NfVQ/MqfB406j+3Uek+o6YCjaH3eOdtC+kpUL9XrqaGtCvLwrh8Pzoa+4lzksCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(31696002)(36756003)(86362001)(38100700002)(186003)(31686004)(478600001)(6506007)(26005)(41300700001)(66946007)(66476007)(4326008)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(83380400001)(6512007)(6486002)(53546011)(4744005)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUxvTUIvam5USnV0cEExQjBGZVp6TXlnSTI4ZHJ2TGdpZVljZ09OQ0dVVi9t?=
 =?utf-8?B?WkFiWUtlRWxKVmtPUms4cHZqd21FeVAycENHcEg3M2U0WmtHV3JWaVdrNkZU?=
 =?utf-8?B?ODczaXRSU1JKSmVLa2ZiTU1VRTkvR0tNTDFSdkNMT0RsaGtZemw5ZUN2NG9G?=
 =?utf-8?B?NE40RnBmQTJadVM1SVBGTlhCRk55cXVJUzBNeDBJKzY4RS9XZEtBZ3ZieTNG?=
 =?utf-8?B?MzFBbmZ1KzMyeCtMMWhBZFdiNCthcDdIeC9EMUNDT2lBOUY2blF2Nm0vbnVx?=
 =?utf-8?B?YVhqTnJ0Z1BhQnl1RGJrYXYzRHlzSlJsRUhyOG5WQUdHQmVObS9ZVCtTNE9z?=
 =?utf-8?B?Zm5HTENvejJ3cUZjVXIyenI5Z0ttMnR5WDUwMVk0ak9DcnZJdUF3MGNveThh?=
 =?utf-8?B?VnlZRTltMnR5bk53NzM1RnlKOGRBNjVhbjNoeE90RUgrcEYzTXh6RVFEVmht?=
 =?utf-8?B?aTFsdENmT1ZNUE45YTZFS21JS2JnZGpBRFQ3R2dLOGdhZ2pQOC9FNUFzak9P?=
 =?utf-8?B?NmF6UmdOZiszNThzTWEwSmVHM0pmaFp5V2ZYM1N6d2x3bzNxVjZKbHZFam8y?=
 =?utf-8?B?V2YrWS9NZXJlSU5hVnU4azhlNDR4TGJvUEFDbFRrT05rZXdjZm1uYllBL3FT?=
 =?utf-8?B?NjJicFZLUXNPdGU1dmprd0hvT3VNMzB2cHBPSE5SWUFFNVY4Q3pUQUZGWUZU?=
 =?utf-8?B?bWttSkpTdjJHQVd0OXlwMXc4dmVjdEd3N0l2UVZMOTdYMGZJV0xMaFB6dk5w?=
 =?utf-8?B?b3Y5eDNBbFp6OXNaVWg0N1hvaFdXbkQ1L1RMdGRXSTMyQUlwcnoxVnMxMUNj?=
 =?utf-8?B?cVJjNFJXVTJTMmhld0xDa0VCa3dDVWwxYU9jbVEwc0ZSQmkwd1hOK3BJSlJN?=
 =?utf-8?B?SmFBNWdEaVVhLytLd0I0dk90RWRHbktoTEdsZllBUmhlemYzbjYzNDh2OVBS?=
 =?utf-8?B?cGZrcmJNYUpFUmcxeWRLNnlKSDJLSThROFhkdjI1VHRWRVFEdlRjNUdKYWNS?=
 =?utf-8?B?dDRPNURMdThaOEkzSi8xUkUyNVVOME9LNTlSeFExN2kyb1gwRlhWWi9hcnZs?=
 =?utf-8?B?dnZqMFhaS2tld3o0Z1B2bWpOL3pibFdPQVB6NjErOGExalVNZUhEN3FHVTZG?=
 =?utf-8?B?bmpuNHBCM3N0aGphZXdSTGhKOUpDQU0rL2JUcCtiSmNGcXVoWnlWYjhOblkv?=
 =?utf-8?B?OTFBTHFWb3ljc0ZQcGpROTZlTjhIZG1OZWFJT2JaQytwbmRmczI1WFhBZTIy?=
 =?utf-8?B?NUliWEZ6U2l0R2V1NkhRaXBqOHlFeXg1Mm1Cb1F1cnF0VlE0RU13MkpxZTl3?=
 =?utf-8?B?VmdjODRRTGl6bU02TWIzTnlkNk9VVVJSSEhQWUczbzJuYS9JdW9vVENnU211?=
 =?utf-8?B?aG1Db0dZcmptRnBkSWlPWHNNMzREbmo0eHlhemU1OHd0a0p2aDV0K3hzR2FT?=
 =?utf-8?B?N1VhbGZFeitKN3NTVk0xdVNITUJGR2FBRzkyWjVLRnhZK2FFbWtFeXczSW41?=
 =?utf-8?B?NmhiMXV3TkEyYTRJVy9SUDZSQkhJVkJkbmh1QlR0WWRmSndSQlUybVNickoz?=
 =?utf-8?B?YTFuWi94TnNqMGZvMUJ1Nmx4ajJNSzNaSytCUnBBU1JwcS9UZ3pyZ3drdUhw?=
 =?utf-8?B?T1BYZjl4emNUWVdVMzZzeGZTVUI0Y002VEJ5L2JIcjJhdjNVdUxhWUp3bS9w?=
 =?utf-8?B?L1pselVSVFo1L3RRckY2ejZOeGNJekRHR0w5QmlkUzhGbUZvUHJVT28yTXNX?=
 =?utf-8?B?N0RqVDk5d09uYmtiQXRwN3laOGoxL0h0S3AwZEloYWp5ZHY3bHNFODlGVlJa?=
 =?utf-8?B?dkt4QngyNzhMNzAwUmlEVW1iS1B0U1JmTUFnNzh5T0ppRGRKZ0s5Tk9iUE0r?=
 =?utf-8?B?K2NwT1QxU3JpMmoxNlNnZFFielBPOTc0c0tlTFBWdXU3dXQyWTFSMkI0VGNN?=
 =?utf-8?B?ZENaSGVFNlFleWhTNVIwZ3RRaU1SdzNrNFpUVlFsWmxOMlhTdlRteVVKY09C?=
 =?utf-8?B?K0hDb1dkQTBaSmM1Y0JVWUl6WVZsY2s3VlFLQk53bVBzTzFHMHBuaFhKb0U2?=
 =?utf-8?B?dHRCbmlWRGN3NXdseXRLZUhQQ1N6dTZaNWhQOUxwbkUxSDdSSWN2L0hXeWx2?=
 =?utf-8?Q?5ktMrQC7Xecr6wBmNdldcDBlc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb5e209-0e80-4da8-fd7b-08db88ee1cfe
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 06:54:07.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DJIacmoTMDUwI7qu0fPdO+TWNck57oxKlXluZId2TH7A0wl+1itG5wRTju0wMboLfke/pbzQq1T+zbU9wBfVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7617

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -177,6 +177,30 @@ static int add_virtual_device(struct pci_dev *pdev)
>      return 0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + * This must hold domain's pci_lock in read mode.

How about an assertion to that effect?

> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +
> +    for_each_pdev( d, pdev )

Nit: Style (either you consider for_each_pdev a [pseudo-]keyword or you
don't; depending on that there's either a blank missing or there are two
too many).

Jan

