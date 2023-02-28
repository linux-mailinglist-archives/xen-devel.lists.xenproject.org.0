Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD516A5D29
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503552.775841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2tj-0001Qb-1E; Tue, 28 Feb 2023 16:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503552.775841; Tue, 28 Feb 2023 16:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2ti-0001Ol-UO; Tue, 28 Feb 2023 16:32:14 +0000
Received: by outflank-mailman (input) for mailman id 503552;
 Tue, 28 Feb 2023 16:32:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX2th-0001Of-1J
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:32:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72db79f0-b785-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:32:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9588.eurprd04.prod.outlook.com (2603:10a6:10:31d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Tue, 28 Feb
 2023 16:32:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:32:07 +0000
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
X-Inumbo-ID: 72db79f0-b785-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHphhbs4YK0m288vgSsbPji34Djulleyjv2M2rOtEdrHX3XAE8Dv8Znd3rDeqfjERvqc8HBbgt4tZTz+7BT+RuzCATaDsXR5vmt76bQqJ0gbHOddJsE9kwwbQbz8RDkR+8JrFFAv78KgtnKvBHfXhNr427MTPhrHY90ZcTnbO/KGB6jdHcdf9QFgs9Q1G0rrCLik4VR62PfB5+xzzu17KmDlPC+8404yvvJIMhZtXf7uR0M94CDaRMyLpoEmUUBNbF2ReJmcFMD1h22uED3vNpaOWS9kj17+RgjV82RW5SPkqpBzyES5E4Pst68xJlSphzGCfSTgY2ONzH5ZH7lElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYUVFIcS25dqJO08hhaGprZVW3JltPGrYCBaCpsQnG4=;
 b=MnQvc7f6Ki00Wwx25r4ruuLlOkk5Y2eJD/K70+LjU4CDTJoo0CY3EkSyevmUWhszZipIrkQNSqAKoCJdC6WGBDXZlC5IAJgrwWP1OPxD5eD1jalMjZJK/q3lGrXvbuqFez7aDdxtIQfufVLIv/tfV8vvJGGWMSnJxE72loYE6FpmUgx6GWdBuqMTy/vcjVXgzMF/S7ROB+qxCThqIXFnIA+iKlY5ilO/f3QNHEaKZuIimSpFFZnbcdrmVG5LaikEzSZOMOVoaKpLbuitIn5o3c1yvD3ly4jhZOJJUAMY4eWlJSc/+sNXYY50ge/JgoKVtpk5XioPPoz+fQCyjf7XTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYUVFIcS25dqJO08hhaGprZVW3JltPGrYCBaCpsQnG4=;
 b=QtfESXX+tKq+WfkcvM6ZweSGrwyZB03EZs6gIYRfYjpRP2GmxSso5J1dUrDza2clM4v4oLjEd3Y1N9/exYcIFTKwk7Q0WxSnjwGaB0RBXGNNDq62No+XTm0Cmjr0xRBV5L53YqGK+il6BwxMk/99dbVVfNUXzlujOSDqZYEmwADRJ9+Ekdll6tWZkMJYiY0UpvhDaax/w0eHAq9ayJ4qbRYOc6GYkUD/u8vbQVBMfmeYXzc9IMiHms7e9dcQdgDImDbqp2R41SRfIGHc2OwZCoOJyXYckiNArkJgXrPa2jqwbAwpvITGW44/MFxYU/n1MkVZ6TJPPtl1jQPiNg24UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <38c11152-2f35-8683-51fe-603828dd4963@suse.com>
Date: Tue, 28 Feb 2023 17:32:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 02/10] xen: pci: add pci_seg->alldevs_lock
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-3-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220831141040.13231-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: 541a7e30-fd60-4502-2e4f-08db19a95546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UymOdWjU+Gciz2Hp6UlEDkt4lVj8odamj0E82yKTP2F7A0pf1O+bC8+8tmSXGyEunVxLrDONSUkkbUClCUQ0eEEW3Vxlr2k60D5F9Mldz8Fz5f5a6Akqawp4ONdLAQH6EaVAw6XjLftSDZahULIkRS4xypft0GaviP19718KJ35ZcLP8kHSiqyF1Pitx/SD7oKFcuRGPDKLAGMBvsD5+osdrwaHpfqCg3k4tJ70QlI1vdpn5oyrf8KyVM0qPtQbketzIwJ7K0FRmlHOtRMk41jx1JkSRlCpBptBflaeJrJsBcSXDHDeWfSPG8ef8y8cw3DXCkoYvso0qyKjocIpSeRGWC4od93Ddju8jwpp9Rp/AYrIo4Msm5LPCCAEERMgwMSLIM6a5cNNPzgS26Q3po0kDOv+47K1J0OYR3OcunXjoi5WhbpVL+X1KK9ERtlu2cGELm8TyCDFB9JiEpJRfouyLsyYXKrrbKlE5JQhz8KwiTHVIx9XK90r3DJi3Rx2Q8DrwstuRy+sFCLlJAPfWVI25LJxm3AhX2KkJI3Af2/xpJdecu2T/2N/RvKog1NS14bH4/CQPJM13yEKFJNFeFNtQ60bWdT9ZBUArC7kn5cUqhxuGiDGH1WPvlGDU/gvDrv42td5ZGh0FpmQ5A9koyQRVuw2ZpS9sRqVO2abXVTx7NtYerKl7dKUQz4do2ZPuPtleG+OKZsoL0t2w+aPRg2bPwVQOtbpIB7sQsBC2Kf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199018)(83380400001)(4744005)(8936002)(2616005)(31686004)(2906002)(5660300002)(38100700002)(41300700001)(8676002)(6512007)(6506007)(4326008)(66556008)(66476007)(66946007)(478600001)(6916009)(53546011)(26005)(186003)(316002)(6486002)(31696002)(54906003)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkc4dU04MDU1VnkrZHREcGR3djk5dVgwRWk4cUxER3pLWmNHZUxtSHBjekpj?=
 =?utf-8?B?Z2U4NjhDUkxSelFxaUZNWlp4TDhCSlRaWmt5TTJMZXJTS1JIUVgyclFaOGxu?=
 =?utf-8?B?dlo4d1loeGkwR09LRVB5MHhyQlJhQWF0cWNya000TU9XMUNzTXNwbkZ1bThl?=
 =?utf-8?B?UVJDSzZ3VmNyM1k3WWhLanRNN0ZucUZBNVcyaGltQ2QrRTdhTVVLTkcwZmVG?=
 =?utf-8?B?cGk5UlJhRnRJU0tGVzM5L3NqR1ZZVlpmcG00YzBIcjBqdFJLS3M1MXMxMUYr?=
 =?utf-8?B?aDJCT3g2WW9rL3hER3EvUDBveC9pWmV0Rk5lLzVsbkZldTEyVzcxNTFYVElK?=
 =?utf-8?B?UVY4cHNnUkhQcERaWU1KVTdMajdKS09vbjBMcEMrRzVxL3BsWEFrQjk2aGY3?=
 =?utf-8?B?K25SYlNkVkNyZ0JkVkdSVlg3NDk4ekxqNDJZd0g2UnFZZm9qK1A5QllnN2tD?=
 =?utf-8?B?VEVsb0tmdzFNcWpLVEV4bi9qSG5mYlpvSmYxcmY2UUtkc3R5ZnEvM1Rna09V?=
 =?utf-8?B?MW16UmNoTzhiZXV4VjRyTlVIeWJqNXFENkNhak5TN01jcjV3VDlTaWpvNGtw?=
 =?utf-8?B?MzlqS3dmcXFJa295bmtOa1UySnIyVmZKaXhYb2hiRjhlQk9ZSVlvVEV4eU12?=
 =?utf-8?B?QXA2eVVsN2lGNVFQSys3ZnZ5ZFhiaUJzV3g0dWZKRGgzVmVwdXhiaG5TRWxm?=
 =?utf-8?B?RlQzWERyOStnaFBVUmpOU01IcVoyWER0cHRRM2tLSXU3ei9DNWxoWmJJZUxq?=
 =?utf-8?B?VFUwS0hYblIzbWdYamxGekZZZkgrZmhud0VabE1wZWw3bUYzVXU5cnFKcFgx?=
 =?utf-8?B?MzEvUTJPK2Rqa0FCc2ZzVVBielZob1V6MVdmMHFzT2piSWd1MTRnMmJFNmp6?=
 =?utf-8?B?amRFYmFGcFRBMWwvL0w5YVAwZTZlTlZINnpVR3YraisvZ2xVYTV1YmRhZFR0?=
 =?utf-8?B?VytMTGovazZkbDJiaU5PNTFLN3VUTWM1OHhlZ3l0elhwSk5CUjAwK2t6Kzlh?=
 =?utf-8?B?K0FIc0xCcHMxQSs0YmRKbCtoV3Q1T09sRXpYenovdmZFWis5cm92Y0xpMWMw?=
 =?utf-8?B?UGFLWXFoMWM3a3RJMU8wZXkvdTl0WDZsdEsxRitjRXh4VjdCQ0w0SmNIQ1VK?=
 =?utf-8?B?b1hMYjNncHhpT2lDanNUbzZFaDhnU21qUW5PZzBtNFdhQkh0QXpoa0QyUXlq?=
 =?utf-8?B?SWpEUDY4UkVxZHB3UFdJK0N5Q3hsZng2OTRsTFZyVFlTenNCY1lxSjF0SmFq?=
 =?utf-8?B?c3c0Qk1zRmhNRmhJTjdlUUx5RmZUUmN1T0Q5R3pkWENUQ2I0V0thU3BySmpY?=
 =?utf-8?B?SHBOMXhKSTJiL1p3bnlnTThMTVBKRVRvWU9OcmZESm96cjJ5Z0RtRENMMXVC?=
 =?utf-8?B?UHpLem5MVEJkR0ZxbnpuZHQwSUdUeFlVTGIveEp1NXZzNmMzQVJpaktQdURY?=
 =?utf-8?B?MTNKdWU3dnpvTTM5MnRrZ3dVQXlEdDJ3QkRuVlhaWFZxVE5QRG90USs4eXIr?=
 =?utf-8?B?SHFkSXQ4cjljY3dOUFRZWWFNbklzL2pRVllOSXJlZTArdHdydDlnMnpqNDAw?=
 =?utf-8?B?Nm9hbmtJRTg3U1RXZHBlYjhwS3V6bUtDaUxzWVlaaWtBc1ZzTHUzNVd4aVJj?=
 =?utf-8?B?aEl3SWJhYWM1M0FNUnhUcmV6VDdjNnlRT3g4M1RrNlFPbGsvK0dIVzJuTUJ4?=
 =?utf-8?B?SVArYjdjM3NzSkRwRVpLdWZ6cG5UQk5NV1o2bGk3c0tSdkFyVDNadWpnMHI3?=
 =?utf-8?B?YnpISnRwbGszbm91MWx6VythWjB2Uit2K2hzR2Vtc09QcnZLL3FScG9EQ1RO?=
 =?utf-8?B?OFU5ZjB1UlBNdWFSM2ZYOURoYlZoWnc5VTVaS3FwZHhyR3htTExVMitEUG92?=
 =?utf-8?B?N0J4NG9aV2FLOVcrSU9OMk9vSlJVUzBZTGNxWXZJaHdBYVZlMDlWRzYxSkRM?=
 =?utf-8?B?U3FYN2ZvbW9IcnVJWkEreGowMnBrNnlNVEtpRmd1aWFCRWVDdEhYbGlibWRv?=
 =?utf-8?B?RXlkZHdTWjd1b1dkK05HSUhFZmw5ay8zUWxCZFZHWUlSdVh6TWorR2tmS29i?=
 =?utf-8?B?STdNUTR1YndtcTZVZkw5UkZIVHRGNXZEa28vRWlUYkJsQTNVMkl3WmZ2UkRz?=
 =?utf-8?Q?RNcRwFNoBaiPTdG0K04Cv9+EM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541a7e30-fd60-4502-2e4f-08db19a95546
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:32:07.6387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMDDhuTcJ0VHG81Rm+eElI9lOQIwOzRJ6AldwYk762ZmoFeXMLG1mN6uvU86E5uWZOOgV5dJVxysZ1oKM26yoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9588

On 31.08.2022 16:10, Volodymyr Babchuk wrote:
> This lock protects alldevs_list of struct pci_seg. As this, it should
> be used when we are adding, removing on enumerating PCI devices
> assigned to a PCI segment.
> 
> Radix tree that stores PCI segment has own locking mechanism, also
> pci_seg structures are only allocated and newer freed, so we need no
> additional locking to access pci_seg structures. But we need a lock
> that protects alldevs_list field.
> 
> This enables more granular locking instead of one huge pcidevs_lock
> that locks entire PCI subsystem.  Please note that pcidevs_lock() is
> still used, we are going to remove it in subsequent patches.

Just a thought: To limit the scope of the steps taken, would it be a
possibility (and useful) to move from the global to the per-segment
lock, extending what this per-segment lock is actually protecting?
And only then take further steps, as already done in later parts of
this series?

Jan


