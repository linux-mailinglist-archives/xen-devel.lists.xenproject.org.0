Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1F40D35F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 08:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188113.337176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQl9L-000254-8H; Thu, 16 Sep 2021 06:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188113.337176; Thu, 16 Sep 2021 06:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQl9L-00021g-4t; Thu, 16 Sep 2021 06:45:35 +0000
Received: by outflank-mailman (input) for mailman id 188113;
 Thu, 16 Sep 2021 06:45:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2MkR=OG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQl9K-00021a-23
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 06:45:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01efbaaa-a78d-4579-91d3-4231b25e27a5;
 Thu, 16 Sep 2021 06:45:32 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-Tu625PwaPTiFSf8g0UE8Nw-1; Thu, 16 Sep 2021 08:45:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 06:45:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 06:45:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Thu, 16 Sep 2021 06:45:28 +0000
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
X-Inumbo-ID: 01efbaaa-a78d-4579-91d3-4231b25e27a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631774731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ljQFwkl0043Igxc8fvmVI209+Fmz0veBvqBLCjOpVCQ=;
	b=OAQpqsjXw63BjHptkB1TT6PMEQTS9xsn/IWKIfKodE6IuZwZpVrN5i+m0z/faSQpBWmnH/
	cEm4VTJ4bIM2tgbGmOJaH3o4Pky5MikGOy3tj7J/+wAjPcPh7Q7kRWyOcCQLIP4x+81kHh
	87vMth6yg9qECRHMXfobUNbwsb0Mzxs=
X-MC-Unique: Tu625PwaPTiFSf8g0UE8Nw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzcFbFT0WOJa6GjVF+X3UomqVDsfO3tNTTMM1TdYdL1RyfHrzs6wdM1G47eWpmvzTuHdUxofRwp4KB8fQ59Fm7zzVeZ2HmYjsyS3HS/LMWJYuW1BcSVVaqfSD6H4BANx9BUe7VJq+YY/aaEefrwYG3RCCZNJH8lJlnoIZz+NMluR5Mq8cp8uY7Ozj7YP2oZgTQfXtm18928xgLpZ/5CTgEYw9KnD58bUahAOBU3QU8F3mNhj5ow2nL2TpILEI4O5t/zlnwdrKcNN35y4sJGtvTZPJd0PiHb9Vq1+EuntRxvtm9u2R44leBALfQCWQZ05VCcGcfpnD2t3+gVtA6FDHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ljQFwkl0043Igxc8fvmVI209+Fmz0veBvqBLCjOpVCQ=;
 b=P3WQ5/nvGbwHDYZUPcCYib45heuocqLQON07BuoZzBlqlrxBOQL/+s6CdKXpPHKfpUpfv9FwHsz6C0LbDGskKfnAjfOKdes8olaEfb3bMpWK+9VQsM/pX0j2wA3JyJvcgN6QgXSAX8mZ7hNMz5VOLMdaAhKXbeVLlZaXQV3C3llP3dRl2ipWChOuXH7COC4n5qrdXh+rYKEdSF0mziSgW1KOL4gZeyf7+Gy9biABYeg4ddrCjk9PF39FCRK21YLl9H/dHlAS07OqpIoaNq+m7IL7BkvCmTqG8BOqoHv4YxuWHg73M5gqjy6xbgnNdCqknevjEWMVOOllEO2I16wGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] xen/efi: Restrict check for DT boot modules on EFI
 boot
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-2-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109151445080.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d04b834a-5d5e-de44-5bfb-e6012660e295@suse.com>
Date: Thu, 16 Sep 2021 08:45:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109151445080.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0001.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 452d05bc-c1e1-4890-463e-08d978dd921d
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB647770C5652D81BE32A3E25FB3DC9@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	baa3kYGgRx97DrPyYPiHwcfiPYUkl6yDRZ/0AM+8Hu26SKS4qf9CmWLz1xhP9tqAJo9x+/RevEDweGuHMLDzWKKeRA7bBBjJ9c5cLv0/Uv5bEAs9dOhHmbE1Lr3PohGGMwv48WRm76ZYSjL9CU/mIdxQWDdqVGa1EEWBeaYEcBTmncbptmBZedrde59jiGYzX+DkM8fmKZRmtxsq+Ow13LHawVS0jBjLoUm8S5E+nkAbIdawFop8TH/tZp3B+dR4DfTcHvsg7z1Cc9kVgNj6hwcwfdqB7wAC1k/7iOjw6STjU5ezRKYdzyUXQ/AZn0Qeb1wWyqzYrA95qgo5sMx5OEJoX4bD36BpZYdu+PrLQhoP6hjFC1+Vq8FLwnvygh/qpcefVOp7xrNvly4to+JKNNoMomLc3ExoSvSq91k7EMmRpb1YR+qDLGYu64Gnuqx++bPTFeV070xCYal00qKdyXNRlqZ/Wc/9ULW50cRcJnnWfxp5dtZ09pHVBRhUpdmSLJmqQNi/1DcaV/DuUyxNJb4pWvJRW+ePc2sfK/6OnjQOCUHBjNgZ4HGA37HOlRiNr/TBmCuJAELKml3zggZmmQwrh9AGq2lLjAyOnh8nyG7DMZp3vlQ3J7g8n6OmcDVfRtWEwegdUYoo6LC872xw+jLxHvBJXhY4XQ/NNQffXUufEHj9iIKSTIplLMb68BqFBdg+m6irdR5eQ719FLV34R4Ai3Xp6CmXO/lbCsw9Dsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(366004)(396003)(136003)(376002)(86362001)(16576012)(8936002)(31686004)(8676002)(6916009)(478600001)(53546011)(5660300002)(316002)(83380400001)(186003)(2616005)(38100700002)(66476007)(2906002)(6486002)(31696002)(66946007)(66556008)(4326008)(956004)(54906003)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxOWjEydDc0dUNZSHZWUlRMQWkrU0E4S3pLOW9QdWpnOTBQNmZFZHZ3VDNN?=
 =?utf-8?B?b1lOQWpRWFRiUThOeWZpQVFtWFkvSEZjNWdOODdRMUF2cUFRbnlmZ04yV2px?=
 =?utf-8?B?TVArV0Q0andvU1NOTWQyN25hbG5jVnRpbWdoZDRVcEQwdGEyUHcwaFl1WnlK?=
 =?utf-8?B?NmhnNFNBcjVvYkhVWC9haGhNc1Q2TWk3SHY3MU1JaGo5bzJwd3laNzNZcFhQ?=
 =?utf-8?B?YmdIUElCdU90WTNzWjY3clJPTFhuUWpMN3dYc3l3cW9BWVlPYlBZYUI5UGky?=
 =?utf-8?B?OEsrUXdwVkJuUlZYK1BUM3QyQ2FtTmxnTllWeldnSUl0Y2w3NEpLSGNDVUhW?=
 =?utf-8?B?NkpGQnBaZVB6UWRjL2hZaFpwdU9wbEhaWDZnNy9BbGY2V0t6ZW9wQ2RmcnJy?=
 =?utf-8?B?U1EvRWRUWlZYMTk5N2JRLzNjZU1BcVl6Y2ZSeHAzbE04MW1WdzVmWEVkTGhU?=
 =?utf-8?B?S3dEUitrNzVhbFVXZW8xYnZCZ2l4Rncza2x5c2RSQ2tQWHBxdHg4OENuWFRa?=
 =?utf-8?B?cHhBbzBnWVB1bnZsRm5rTDNrS0tpS3JCaXFNdkRleUJtK1drWUVyNVRxZWlr?=
 =?utf-8?B?dTFjQXU3TktUcXdmNTNHbElHSlhIYjRPNHFJV3phV2JXYU1SY29WdGE5YVdE?=
 =?utf-8?B?NSs2OU94cnZEVGJiVlJRUTV0MjBnbFlLcFRYV2VMZFJPZWgyMXZYMGJOdEF2?=
 =?utf-8?B?OU9VRTk0ZURvc2E4V1d0TjRFTEJLSzBUWk5kOGptZEpXK0RscXBONUw3NGRW?=
 =?utf-8?B?Y3dyNDdGU0VLZVJMQmJJcVc1SXpQNUEyeUlWbjFzRnlEZm5NcXIxeXl2T29j?=
 =?utf-8?B?cFMxYkJUdk1ZTUwrOTRYOWlSMzhzSmk2NjR3M1JETEtpRDR0eFlBWmkxZDJp?=
 =?utf-8?B?dUZFYVVXRXQraUpzckhTaXdQcXFjOGZURDF6eVdiaVV0RkFveW1OUzkyd003?=
 =?utf-8?B?VXBqQXAzK0swcTdtOEd6dTAwdW1ldU9zZXBkYy8yYVYrdU5BdUUvQ3BCc2lT?=
 =?utf-8?B?MXViYzBYUVZsaW5xOGxTeTJUSkgxV2lCeWJ5QVlMSVhwUUMvNkVVNDhla2hK?=
 =?utf-8?B?NThlNmdlSkdoWFYrN2tyS2QrWHlhUG1yck1HdjdEa2NvOU9TUDIxcnIya2xE?=
 =?utf-8?B?bWMwdGI0dzFpRUM5US9UWFI5VlBjaS9IWm9CbHkvSjRmVTcxamRGalFoN2lh?=
 =?utf-8?B?d1krSDQ4UEV1QUM5V1BvUmcydEExbmd4T2dIcysxNnJLN0pwZmhZeEhTUDBZ?=
 =?utf-8?B?Ulh3aGdpZDdSTytWRjJCWDhSZzVmMlNzaGFXS3JiUklpaWEwRkJnZ3BveTFr?=
 =?utf-8?B?MDcvL1pwVEd2VzdmVHhwM29ybThTV0tGUE5qdVRBRFR5TlFIaHdueFZNaFA1?=
 =?utf-8?B?ZVI5eXVxWnlPSCtEbWYyNmVnZVdDYWNLWDVZakNGL25jYnFsaFRIZ0h5V1V5?=
 =?utf-8?B?R1RrVUZUQ2xiOEErWnJmekZOOXFvZVUwSnZkalRZUW5hSEh4Y3IzUVd0L05w?=
 =?utf-8?B?a3NCdUpnL1hqem52YVk0alc4RVE2cVhjRmRiU0FDdmxSbk8xbXUwZkttejVl?=
 =?utf-8?B?dFhFTXN6WEJydkIvNGMwVnlSSXRRdmJMV1ZRa1lCMnlvQkhHWmxkRHhKRTRZ?=
 =?utf-8?B?Ynl5U0dMbnJtUS96eUxONk9TM2Z1enZHQ3VLbVRVMURRbFpLQTB0VkJFaWtH?=
 =?utf-8?B?cjRGU296L29STWNrR2VFOVRiZjIvV2NPT0lBYUMvejFQekRmbFdINC9YL1kv?=
 =?utf-8?Q?yHILNmLnSNe3u6mmnAchaOz6Hnd0uxg/1MRgUZd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452d05bc-c1e1-4890-463e-08d978dd921d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:45:28.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWCNEeqkEMj3HSUxQFwVDVVWT0v/g7VrzlSpDQGij115mWv7jE3PgrTA18uUOVP1WQKhMNaGHWeGhyiEvriXzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 16.09.2021 02:16, Stefano Stabellini wrote:
> So I am thinking that we have no choice but introducing a new property
> to tell us whether we should or should not load xen.cfg when
> multiboot,modules are present.
> 
> Taking inspiration from HyperLaunch, it could be a new node:
> 
> chosen {
>     cfg {
>         compatible = "xen,uefi-config", "multiboot,module";
>         uefi,binary = "xen.cfg";
>     };
> };
> 
> In efi_arch_use_config_file we would check if there are any nodes
> compatible with "multiboot,module". If there are none, it returns true.
> 
> If there are any, and one of them is also compatible "xen,uefi-config",
> then efi_arch_use_config_file returns true and also the specified
> configuration filename.
> 
> If there are nodes compatible to "multiboot,module" but none of them is
> compatible to "module,uefi-config", then efi_arch_use_config_file
> returns false. We use the device tree only.
> 
> I think that would be clearer and more consistent from a specification
> perspective, but it requires one change in common code:
> efi_arch_use_config_file would not just return bool but it would also
> return a filename if found (it could be a pointer parameter to the
> function).
> 
> 
> Otherwise, we could add a simple property like the following, without a
> specific value and without a filename:
> 
> chosen {
>     xen,uefi-config;
> };
> 
> The presence of xen,uefi-config could mean that Xen should go through
> the usual guessing game to figure out the right cfg file to load. This
> would not require any common code changes because
> efi_arch_use_config_file could simply return bool as it does today.
> 
> My preference is the xen,uefi-config compatible node, but I think the
> property would also work.
> 
> 
> Jan, do you have an opinion on whether efi_arch_use_config_file has to
> stay as it is today, or would you be open to the possibility of making
> efi_arch_use_config_file return a filename too?

I see no issue with making such a change; my preference would be an
altered return type, provided all present cases can be expressed
alongside the new one you need.

Jan


