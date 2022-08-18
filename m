Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E3597F79
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 09:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389346.626200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOaFs-0003gT-Dj; Thu, 18 Aug 2022 07:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389346.626200; Thu, 18 Aug 2022 07:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOaFs-0003dM-AX; Thu, 18 Aug 2022 07:47:52 +0000
Received: by outflank-mailman (input) for mailman id 389346;
 Thu, 18 Aug 2022 07:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOaFq-0003dG-S9
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 07:47:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e988456-1eca-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 09:47:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 18 Aug
 2022 07:47:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 07:47:47 +0000
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
X-Inumbo-ID: 0e988456-1eca-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNn5HKhrt5JVM7YYwa84HG9FdddMy/r2Oin5ptquwv8hdgoaq6riEdFV29mYzJl7IBXEQx/rfcCIrgF0KSrmS2zR8NRw+ewKE6c11yeDgzvLF+KCsnoduZLycLcxuv2xPc/duClQJx9wOmI8jNb/NrELzJkl49g+1CkFkD79E5srhvjLupsBs3hAr1SwPohizHbFe82FA5pN/dglPKjDlm2rVxdragMWyd3eqrNGitckL6BQxkE473uVW2RsE5lCKnd37rNtBQaN60Jz46WXhAFDHrhNhUJ/rgneZvp8Bq/0C6qKNipOAOg1IzEJCvbKz+HgE9FfS+2fYW2fRkcFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0SyKFYYw8nQchJ4woRaOGSYS4C2uGr4MoMDxaLa5vE=;
 b=Sg5MfsWAKfkpPmlS/XudIgbgwrdA/0DdXtz5axrJodhIIVJkphgzHOzDjByn3friGh73t6qdyBMd8lW7TyTeUEQHjgkIde9fVOmec/yJ7WBCt09GFd/kM3y6cdN17Kz9LA/JeO6i/W8RusK5bh6cxhTL5Wn589JRptW4D6ubYa8RemmIPyQO7dtqDR2TJPPVOp9pDfrL9wjBrJGw155bO5BIuL5+P5+TIVVUhl4Nd6dkuAo4K725Qfh67XxAa6q+2frnI1MYC88DuDA6dSmWG4/+Ejfv/YNST+PTbnvKJLJPvryNy7tUxTOz8DXuN3FhW/1WpK2F3FXcgjYB6/AXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0SyKFYYw8nQchJ4woRaOGSYS4C2uGr4MoMDxaLa5vE=;
 b=WfbaBEarx4xxMxQyca2I8S2a2vJJY3u2EfUmIFSuM/Bht8H+9De6I5otjSoN66doSyNnU7EyzXh5qNgIWFDJW7FZsT/rFSid9rOSARWUwQ644ClA4G/jCqXUZPS0vSeYb8sSfY6uH6nFHsbhSLA71dtOrc71X5wcAixfwfy4dSKWd4YjhsX0/JirOuV35ADVHQO6vStiBdm56Cyeq2BCuxHWviqlFTJs60VaNWlfdtT0TaTXp925PiarxrNL8N16U7pjG7fGi6380X7PY0EE5seus2h6IZfxLGfs6SEyWJU4aqB74ACceAUBWX/SYEh50joHK8V8LcIi2yHetisJWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3d2fb83d-f75e-6c12-a48d-bfa175e6faef@suse.com>
Date: Thu, 18 Aug 2022 09:47:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yv3rc7vNCmTrFdgB@leoy-yangtze.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30ded84f-a384-4a6b-4f1a-08da80edf1a7
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	62wlHhLSZNYJHkUMtbjTX6ilEFxprtkVb5MtuFKN8UrUWIs1/MRv6dd5ZV3COl7a5Upid0E7MxE/vRKgkBij56KCxLHsX5XOze92RpKQAwpY1HQlLug1AEIGAwhV6ZvJW4u7g5CePpsUjAGJnYdnn4IVEHloMTe0R0Y5tK20qY/SmXtifnsk0gYc6hbGTpOa/CO7ijnjA+1apzn+1QDpHiM6/fht89vuTfPLlNbg0lVvszs7ZCVRZPoaJilxVdRSD69QsWAZDiPVrj0uLl/3VzBuJoJRsjIKkTNTY/O5j+6Ixg5noq/hueMRZxhGlL5RAjC+nc0sWbzRnyPgepsImfH9+3fs0wvTzpr0H7aUn/Syy61nzBRNgru8UeP191EWtmGYKPo1ztyXSiBVgv+zg1H9rlxpfFAepOVBTUJ0rHrp81r+ULZ12m+zIh7DUNUo1FQXtvNGRnJsQHvGtZEp2g4wKLnLrQM8i7m6g1BmZYnFwZqR/915o6ECRjwL2v+sfOo5XqA7VbTn80lpVioi+4mjwaStOnoB3lZEjfb3SfoaTsMDgzv46FfVPEYiSimZr37sRXbc4nCAz0MpcuCuqWAvjx5KxReF8qRgY811DTGsFs9OQvpJRdedIJ0JriFHQxsm3NNw/yQmbwc9m1aVe+uNlHgjI8yhLv3LiVMFncmcK6yk/kvrJjtGIgfUpE4IqLQdtQ2TJmwLGwzQSHSrif3pfyohpNto9O9xEH7LOVtD4TGRLzhl9K5Qj+x2xHBycZZw7fDOHOuk64dJZ8ww7f4mYR6VJHmA5yCHJKgJZKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(66556008)(6916009)(86362001)(4326008)(66946007)(31686004)(8676002)(54906003)(31696002)(38100700002)(36756003)(66476007)(8936002)(6506007)(53546011)(6486002)(83380400001)(6512007)(316002)(478600001)(2616005)(2906002)(5660300002)(26005)(186003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU5YTFAyS1FVbitwclhTMGx5YlBQM2czdXFuQ2JYMzQxN3duSTRiZFJnSW0z?=
 =?utf-8?B?dlVtaHZPdXQzbDQ3Rm5pdkt4YnFBY2V4blJBZCt4OEtsYjNKc1JuMXRLUHcv?=
 =?utf-8?B?Q052bVZPTnlnS0NpQSsyNWhKNVlaNzVUL3hwbWxZMy9Vd0JuVjY2akhDV2V0?=
 =?utf-8?B?OTNBYm1oekZFcjR4TG5BZHFXZ3pScTAxdnM1M2dsdXVWbGlPRDVEdFlRYzV6?=
 =?utf-8?B?K0hOdVltYlplM0c2UUFlRVhOTVlLQ0huaktFSTEwK1VYUXhhRnFRSmhYZURY?=
 =?utf-8?B?aG05QlRjWDdpUWs4Ui94K1FSVy9sc09ZSklQZ0NvYkF2UUFVbVNZd0FpOVQv?=
 =?utf-8?B?ZHBWM0xxeVBCTlZzVUxSOWg2VmtrT0ExUkRUS1pkcTZ2Q092cVhIT0JmNzZO?=
 =?utf-8?B?anZwS3hlSnAwNlZaWUhQRkpwVHprWG1lR3R3UHcxLzA2emhGVmxTOEdNUjIy?=
 =?utf-8?B?VXViZzA0OVpRaytTSVlLblU1TE8rRHdTakd0cFNUWGg3MHFsNk0zQU96QW5N?=
 =?utf-8?B?VllMYlVoZHh6clcrVlUzWGtiT0x0YVM5LzRDaHN3dTJVbVViOWJyZTF4RmJU?=
 =?utf-8?B?S0ZrUC9FOTJOTjF1MmtqNDVBTkpsTWEvR0lkcWVscUtwNUtXRkkyWXA5V25u?=
 =?utf-8?B?a1hqdlZML2tKc1RoMm1yR0pnNUpoT1NpSHBsY3ZFT1VHRzRIZW9zbWFKYzRT?=
 =?utf-8?B?cXh3T3dPQ2RsWFdYMmljL1MvWWViOTNRUnZxQkZMd0hZNS9xSjkzRHRtZ0RH?=
 =?utf-8?B?Vk5QeDZIRm1EejhGZzVpblNWcEVRRG5ObWh4MVFTSTlxcFlTcGg4c0RJdTN4?=
 =?utf-8?B?cjlPWmQxc2JJRzBUZHRURFdaczFHcEtIN1VXVWZPaHc1RU1aaGpOSURsZUhp?=
 =?utf-8?B?QXhPQ1RmYTNoMU5BY1lJWGlXTUN6NGowTjlGbEUyK1JZblg1N0RDeURFcVpa?=
 =?utf-8?B?ZHhVb3hmejFmZE9YRGlQOHROcDEzZStlZ2dVOU5nSG9IM2ozZmdPVzZXWm1l?=
 =?utf-8?B?L0JXQmxFUVFaM25DWFMzZ3B4cHRJWjFleWVvTXNpcERRODZpT1BSUmFmMjFu?=
 =?utf-8?B?TVZqZHBRTTY2d3JzRHJ1L2ZIOGE1TlhIMkVMdmxDTDg1b2VyYWJIa0pmMUU4?=
 =?utf-8?B?TjRRUzA2MjRyeklyaXZTeTNFM3VJOXo1NjFvR2IycytTMmt5aUIreStWRDJp?=
 =?utf-8?B?OVpQbEdSMmVzeTZkRHAzSDJHeGo1RTZNZi9FMDk2Qkl0cGRLTGpxSUxvU09I?=
 =?utf-8?B?ajY4RjVjQVlHc0xycUlzQ2hyaVpvOHUvRStQTEY1aWpzZlFQYXk1T2llR09Y?=
 =?utf-8?B?eFZneGM4S1Q3RHFDakFUTy9BaUtSYUhLWmpNL1RDbnA5MlBqR0xRNDZPQmxy?=
 =?utf-8?B?ZUpGSC9obkFnSWIxNytERmt0TkhwMm1NS1UxOHh5Y1hxV0lvMERYdU9XVnhi?=
 =?utf-8?B?U2NTdGFFVGZBYjRXakt1b21yL0FnSFgvallFc2hPTklXWlhlQnQ1YkVDL0pp?=
 =?utf-8?B?NFpHWDFtL1dpM2g2TmZTWEV5RHQxNnJVRnhPQ2VTcWlMNkJBSWZzRGlybk5U?=
 =?utf-8?B?VkY0SEdDSUJMbHhTTk1KZUdWaExKalplN1VKc2pJVnJSWWxrQWtVMGZiZ2ZD?=
 =?utf-8?B?bGp3K003cGVVbk5XeVI0L0lOT01IcXV3a1VYeEZialh0NW5BbXNBd09pSUJm?=
 =?utf-8?B?MlFpdDhLQ1JIWXZlc1ppQlI4TVArSlJvUklmMHdnRDkvdjFpYVQ3ZENqWk5r?=
 =?utf-8?B?K05JUlZYd3NDNTU2S3Y3MzJqWm1YMWxlSkdOM3BjekFOSS9sNXU5K2RQaHRO?=
 =?utf-8?B?YWhOLzc1MTVLVVNkRFdNb2M5K1hxYjh6bUFpQXZaMUxPQkEzelFyM3JIWWZ3?=
 =?utf-8?B?cU1PTWQ2VUdXR3dsOXFEWTVwQ2NtS3RXM0hpWVFua2dXSTRyVlZlaE92cnoz?=
 =?utf-8?B?ZEZrSzluUlZLek1idWY1Smp3TUxBclVYQ3dpeFAwb2ZFTEU2RytjdC9yR2Ur?=
 =?utf-8?B?cUJac1VHa2VCNjJiREVnQlZQWEl2alo4MjlFQ3hGMnpNRnhzV3lyRFpmaDNj?=
 =?utf-8?B?L2NrdE53UExIbEdBazdVVmZsYVFWcGlEWmZ2UVNNYUxJd0Q2S0ZQNmZON01s?=
 =?utf-8?Q?qFhq9etI+tbWV8/YwKWXphJV/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ded84f-a384-4a6b-4f1a-08da80edf1a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 07:47:47.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5A66dSQCdyBZrctWcf0/eSrF7YY7uj3JoEeilAkOIsNt1BnA9H+Ywa4YLi1WqprC/w8BX9jfctB8injpewkRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

On 18.08.2022 09:34, Leo Yan wrote:
> On Wed, Aug 17, 2022 at 03:17:53PM +0200, Jan Beulich wrote:
>> Furthermore - what if Linux decided to change their structure? Or
>> is there a guarantee that they won't? Generally such structures
>> belong in the public interface, guaranteeing forward compatibility
>> even if Linux decided to change / extend theirs (at which point
>> consuming code there would need to do translation, but maybe using
>> a Xen-defined struct [plus translation in Linux] right away would
>> be best).
> 
> I saw Ard has helped to answer this question in his email.  As Ard
> said, the general way is to rely on Linux EFI stub to allocate the
> data structure for MEMRESERVE configuration table.
> 
> Given Xen uses pseudo EFI booting (the ACPI table is passed via DT), in
> short term I don't think Xen can support Linux EFI stub, so we need to
> maintain this structure in Xen as well.
> 
> This structure eventually will not change frequently, so I assume
> later we will have little effort for maintainence it.

"Will not change frequently" isn't enough. Imo there needs to be a
public interface structure in Xen and translation code in Linux.
That's the only way the consuming code in Linux can remain (largely)
independent of changes to the structure in Linux (i.e. changes there
can be expected to be accompanied by updating of this code, perhaps
simply in order to keep things building).

Jan

