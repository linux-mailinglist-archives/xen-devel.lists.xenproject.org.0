Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277E75B3C4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 18:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566698.885874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW8f-0001Ny-1w; Thu, 20 Jul 2023 16:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566698.885874; Thu, 20 Jul 2023 16:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMW8e-0001Ks-V7; Thu, 20 Jul 2023 16:04:24 +0000
Received: by outflank-mailman (input) for mailman id 566698;
 Thu, 20 Jul 2023 16:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMW8d-0001Kh-Lm
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 16:04:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 169b161e-2717-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 18:04:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9934.eurprd04.prod.outlook.com (2603:10a6:102:380::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 16:03:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 16:03:52 +0000
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
X-Inumbo-ID: 169b161e-2717-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiUUydj2yQhUK1kBH7AM00xArgxyMsgUAqU6gV9o1slynhOiNXEQH13pLqrvOn7ee3EK81VjmHXMl7Ix534QXQb33sn7I3129eEE+bfXQnYo1bEzOVcPMfEhgmqzlg9VEVABsseJEApilh+BffYIhwNK2eh97AiK6zAxpoJjnTGqAlvIA2WMYKSA68SU3JB2gbUZsOB9Hff7oQkSs8qwZ/k3qxn4+VKyRtAThXSlV+9DxadiRB9BEZspGLW8ldLJEkkaj4Xy8LsaWMZ5UAeQIZuUU4dYjJxhtsqqrDCQ7K3oKot27+wr4DYlC4sSkFumo2jeT/+US/3ahIVvpeJk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVS9GkmxxyRXh5ZBd7SBuJ0ypvXW562UpVnNEbMpIzE=;
 b=fNPdP+Ml41lxdVnffjDmg/feNaqLWSa0Nelp8b/bDvCQwBe9NlNFSZjiHEXcG6m+HB9di/wNz3RHpPXCah2ByltdHPPfBhrHiKAeKzxyBuinYrTMwbUczYuTZv9WPHWpipwJag8IKSuEuvY0S8FmpEs66kz2mI7IMV9YKS5a9P3hg8h0exSGeeS6P8BRRwNsQztAAO1nNrcAHtCgRk2azXmmw37a4xp2rMGo3CHDBAfOHXkGhAX03UUk9GBQYdzvD3cl9zbqXuTC15TUukCkwuYIFEQuI/h9gBw997IlqYDARwuuJabb2NVpjfWgFehrXI76ZHu2zwiSZp+EsMy3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVS9GkmxxyRXh5ZBd7SBuJ0ypvXW562UpVnNEbMpIzE=;
 b=eG7gtSGoqc/tmYS8WVt9qTRMPoj8SOFMcvynQAQjrxqNQDNDv6igBFt2BldgAtBwQBowha/YTIx+Ep40+ErKwAZrFWMbHj9attfp2TCBqpZMLYBIpE7CxnS+xRF8asxWnSy+NYIKMAOISJ5YhpUyMBBtCzYX12NChrL1BdnFNyOrhpG29Ri7yGjwy3hwPUJbo7m7EXiiGp/xevWFxEVUopylVvWnssDMz+bBuArMZqS1vBO1hPJOVzOva5M7MZkT9Hm4xmTsAa2BgjlAFycCZPYESmNxtNNUaAG8YrPpX1pWyYD+QWU+wZg7FkNKkK5wVkosy7h86i4t2VXHmEMdHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9331a8c-69b5-b803-7989-7e3b95b815e4@suse.com>
Date: Thu, 20 Jul 2023 18:03:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: d69b0776-6616-4b64-ed1e-08db893ae948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WaRvjfVZLUMyap4TyWnrGN8+sTln+iGBnl2ev7uAdXRfZz4to4N41IF/2JSaaZRmdwALovmu7pVwFl1VTA9yHbIsl4w445zSYmwKw3y7VzMSMjmTn4+sFkcTNvFASkE9+SS1hCdTzWCXEv/Bond+P4fY3UFQ/FlPVGUyAualCc5rhJvT8XjXiSDnQe174UiA28NU7+gig+4VrZ4uhpPzSTMsEHa/45GAQdyj2bYuQx/vW74FnCXRLppzDcnx78qlkuhIrF0nFPYU+dqYG0nNQswK1TW0cJ7H3CEOZBtwXN8ujKr/2xwIh9zTcYhztOL/IbUr7AqCL0WWcBkWVTChpJI4rESzJda4GL9ycks67K5HAwVbPhsPHwwGq+ZGngRhzCUllEIEReHo0AFxN/VncNjsaB71YQmdWsA8VPhWMxyrtwW94VabNg2T72ls2U6P+ZAN287MKlyE4yB9U8V1KbhMwHhxKfTai4Rg0qhKU981f0Xqh0JMubNzqzwncjXgROu5PXahObRHsTSgs1mNAdnZoPdJdqkuQlGTgOU1TSovmpTpgJ3mU/cITmfnjQtEORFM9OQLiP/W54h3UVlA+wD/9Q0Xz9xPlTVUDShunGCa+1rCdesoq/VVlmsdcmmnMNj5cHkDudLLcuZRssoSLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(86362001)(478600001)(83380400001)(38100700002)(186003)(41300700001)(26005)(31696002)(4744005)(31686004)(54906003)(53546011)(8676002)(6916009)(8936002)(316002)(2906002)(4326008)(36756003)(6512007)(66556008)(66946007)(6666004)(6486002)(66476007)(6506007)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFh4Ym1DeUJqaDFEdUdtNXNOQjEwMExLc0RiWGczM2JRVjJkejJLZ25oSzA4?=
 =?utf-8?B?S2IzUGlLM2ViTHZXZERRSDh5aWVCaDhyYVBwRVJqY3BObTRsbWhQVTBwOWhh?=
 =?utf-8?B?aEwweVdaWmpGT0xoZmNDS0w0NUgzS1ZuMDRrTmlHbFB0YXh1VWVtbnZmcklB?=
 =?utf-8?B?cjEwVUZRd1ZML2dPOW1lS2RnNGw1U09HemNaRHlJZVIvdkdjM2ZlSUUrZy9D?=
 =?utf-8?B?Qzl3OE5rSGJqcjdDbFRiOFBsSnpuL3lkTnNTM0Y0Ym8vTUZZMFQvdTFiUDRs?=
 =?utf-8?B?eGEvZGRsNHZHK2xBZlVURytUS2VsOXJiQ1BRd1RGWit1WDdlcVNEQlN4L21l?=
 =?utf-8?B?YzJJR1RlUjM2U3Z5YjhFQnJmRElJazZ3Y0ZlWTN3ai9BYnB2b25SeTNIWVJz?=
 =?utf-8?B?Um9EWFZyUGpMWm51VE9lbDY2Z05oRW1KWFRZMFdOanN6VzdDRTdEYWNGdDRa?=
 =?utf-8?B?QjlmT2loNVB4eWxtSmJKc1hPL0lUaTd4cmZHZDZvdTU5aDhoWUw3NzQvS0NH?=
 =?utf-8?B?SUVxbmtST3V3ajNyQk9Genl2dlRsOElSb3BqS0VZUTR1RE53elBBam9hRExM?=
 =?utf-8?B?U2RyMWZLeExCRVM0eHlydkIvbE9jMTAzR3g5L0o3MVF3YVY4Sks3Z0JqOWxS?=
 =?utf-8?B?RFlXcUF0Qm13TzJUbGYrRHdoSFN1MlFsenJXMHVPZ2N6UUNQMk5QbzlZNWMx?=
 =?utf-8?B?N3dNWGV0VGtNVWQ5bUxDTzFmR0RhZ1hjQ0xsQlpYUjduZ1J3NmZ4SHB5YUha?=
 =?utf-8?B?UDhleGI4UllncGtWM09Gd05od3duVklUREtUNEpCY3JERjJRZXB6ZEE4MXB5?=
 =?utf-8?B?Ykh2dUg4RUxJQnZoMmFPYWNyVGlDaU1ySFgySTh4VjRUSUVpUVpSUDFNVjAw?=
 =?utf-8?B?cml1anUyc0JuUTFwV1NWb0xqZnJNQnRIR1pVUk5qZktOdVRndkhMRnFKTVN0?=
 =?utf-8?B?UCtsNWZsdkY0Z3d0UkVka2htWFRUNm9MeFFxbEkrOGdLY1h0S0VxcHFqcUVn?=
 =?utf-8?B?UHlsNkY1Nmw2UEc3TG9xa3oyWHZtTVU5bE14NkN2U1lZeUh2RUx5ckFsYXFo?=
 =?utf-8?B?clNBZDVNWmFYZTVOU1VXQ0loV3VkcW14NXRiRExVNW5HdVYyU0V2WWtHcWRx?=
 =?utf-8?B?N1BtcjBtbWxYSGRKOEV4N0g0L1IwZVQvdVNIWGhMbXFTNlVCUHYzTFhaT3Zr?=
 =?utf-8?B?K3RrV3JXNkhEZUxLZmpUNHgyQlBYb0xKUUJKRkdIQks2RnhsWCt5Ry9ET05F?=
 =?utf-8?B?V0hEOExPUU8xSHVtZTljMkhNNUpyNWQzb2pyZGdXVEQ4RXhXcVFld1dzOWtn?=
 =?utf-8?B?N1NuRVFaSWVGQXFBUEUyakc1cHBkekN4NTR6Nmk1WlZodTVxYWcvRXFJbzho?=
 =?utf-8?B?Y3ZOQ0xWdnRLeFVLbnoySklzNGNuWXBCVjlQbnBzYTNCc3hhZFdEVTFrT3pr?=
 =?utf-8?B?UnlUdXM0V21PK2NVcjhOKy9HeWFjaHhyN25uZU51ZWtsZTcyTXlvay9mTGc1?=
 =?utf-8?B?VHVoM3ZBZEcvVGpaVGREZlgzWHpPcEtxeURaSGJGYW93ZldQeSs4WHhaTjlU?=
 =?utf-8?B?YTBaNkZvOWZkcEhNbHlrSlc4R1JMTTFMNCtVQlp6WGJDUVp1NElTUlJTT3F3?=
 =?utf-8?B?ck9BcGtZL09RT1h3cXdWTnd4cUN1QVUyRk9wOEdXMytzcEs2bGEvTWNJV29B?=
 =?utf-8?B?djZmbmxZVEJmQWhmcWpYNzBQMXNDMUNXRjJmSk4rRzhLenV0b210RzB4T0hn?=
 =?utf-8?B?RXJsbmZyMWhjdFUrSXhXQ0tSRUlRSTVJZzR5ejZ0Z2REY2V4Vm5wMW43K2l6?=
 =?utf-8?B?dU9aeDB5S2VSMDhrU2tIMGkwQ0lhbVdFS3lRTEtVM0dEcjhaSitva0FZT1ND?=
 =?utf-8?B?d0s1OVcrTVRwbGhwYmdhNHhQQjBiNmh0MDE4b1lsRzdFeURnZGw2SlNqdVNx?=
 =?utf-8?B?WGdwaTdqbEdMTmg0enR6ZVRqZGo0NzlkeTlaNkFJMlFTQW5oRHZJVW1oY3E5?=
 =?utf-8?B?WWplSk9FcW5mb1Y0NjFYYzk1SWYzVW1QQ1BTZ0wzR1JSbzE2NWRBbXZVb2dM?=
 =?utf-8?B?UkdYN2J1VFBXYXFoN3FETUxROWs3UHd0QUY2dkV2b1VxczdCdHVVemxBaEkz?=
 =?utf-8?Q?ArVDdHTeB4Mfk9+bT8yIu1WHC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69b0776-6616-4b64-ed1e-08db893ae948
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 16:03:51.9448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAnyRlvMoZJ055mSpq7Cc1fTmxAZH+b6qRG/l2yTklqxFNncmYK7C0gvEAXra6Jzrb0VcM9z0M8e8FLBtBhSuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9934

On 20.07.2023 02:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -190,6 +190,8 @@ static int cf_check init_msi(struct pci_dev *pdev)
>      uint16_t control;
>      int ret;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));

I'm afraid I have to ask the opposite question, compared to Roger's:
Why do you need the lock held for write here (and in init_msix())?
Neither list of devices nor the pdev->vpci pointer are being altered.

Jan

