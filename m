Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE577278F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578534.906079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT183-00056i-Bh; Mon, 07 Aug 2023 14:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578534.906079; Mon, 07 Aug 2023 14:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT183-00053v-7o; Mon, 07 Aug 2023 14:22:39 +0000
Received: by outflank-mailman (input) for mailman id 578534;
 Mon, 07 Aug 2023 14:22:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT182-00053Z-BY
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:22:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbdc0ec9-352d-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:22:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:22:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:22:35 +0000
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
X-Inumbo-ID: dbdc0ec9-352d-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZ8Y8H45FO3xMAqoBAQ1XNha897aK/O0xvXejXdarK18NrmsCk40/+pLi8dEOlLYrx3aWsGIdIdQ3pDUEzVscaIyp63vMGljMnidyDTPQKjW+r2GgrcIu91H8LX6H7U5n5iVHA5ARGWREbhUdHB/Gu2bj0gNHU9HvFLaWphWXUE9axR7sgqwk9ge23G4Q4H4RO+zFetfkmoipk8skYsH6SP1y+qOdHZy1Az/kp8ukvXu7V8b7dzZNbvYQxaF+J8JPB4N4iWbdWMlr6+Pqb94S26KAhlOVLj/TOkac5Du75El+elJx67hFk3QJZtWlO1yQx2eYBEg3yXiwu14jpgxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDlRfR4t0qica/Jj6xFprBqfVxFTz9UTLu70O+sA72M=;
 b=CCubH/tCxwy/+guABVb1Xq3l/hV7RV8s8g6rWQ4roMccyMkZMqh77dnU7BwJ7oEDIzSToXpqZFsTQ89w/M/pbJVeJLU4EZrww1LBdfG/AcprKGsrtFaI0IjCEsW3DTnGZCfR9nhZkNbFouQtnDWE1/cmPTf+vqz/BVK6OGKlXuA5BkkxnPD3bhan+Z34GjECapL2iYm11dqKAjKNbyS/kUUQ3J3TvpB5ds8fET6Xa6ffjpRsA6XviAnwJ6xWM8D0Aa341SI1YLOeE2tATv8RqZQHX+B/JLSvXuKVkBmyXUxgrJsw7MuHVwvw2ty5chOzExxrMIEngVnUixVzUAn8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDlRfR4t0qica/Jj6xFprBqfVxFTz9UTLu70O+sA72M=;
 b=a3emV82FGh2NiIyXTd+h0+PuTN3Fea6/w37FbulLjtjVnsL/ti+vLRCjUSyJMpIC01sE7VdbQPPxNNMup0Fzy/wqQfW+hSuZoS2OtYtBS2P6koSk7r3vsxp6Io5G8KGdEgD1s+KVBAi3RxUN3kBLjZhPcUH73plqnySfPpMUwx9pMUqA7HYk19eWILIg5lAVC+fLcxGU2vzhGWAyPlD7SkIni6ne9BvFarhnmWuu1z84t+UAxXqPQyWotOYAT+iL4Jud/psoxScKRpbGRzCGMMznBjhlgtLwRZOpOTKW6xOH2HC7USjh03imcE+6zOKGhlVD8K4VLrf32dwKeVIDQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f93413a-4752-c053-863e-43552f92b28c@suse.com>
Date: Mon, 7 Aug 2023 16:22:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 02/13] x86/svm: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <2779c3b2cbe27d95274a4ab44f6b9c877e59e8bc.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031742470.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031742470.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ebd6dd-8b30-45e4-9e87-08db9751bf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5E8E1oQcLnHWl4+okfbhYEb8POVcmlgMWlfU4XaVHgVaetN7StZZGsYujdmL6+bv/EDJzwh5K08LmCdt9dqVFZzrhz874unC5808e6UNNIUnA7WwsTjsfu3Sp631ys9HqvUQzpxT819u+Kyz7URPzU2HALphcQPIvyP/G1c4CExqch5ooNkL8/+hiftJ+eLx6Oq5IiRKQSKfXKUKYtjkPRJLRyeDaqbnIBsk8lNrfmMN4a3EI9wYxehWSxskIiNXs/SE7RYYJddVda8BykkqnW+75PWoPenznJ9oVCpKv4v+2tENSWW/Ow81wIRncmzhEvuxTTBW7a2zq9rRPqZKYF3hVj1oEprLrEMjN9WHXRR+zOSJvFpAWoBLJrZNTU3JqIHE2MlkzQ+WqFzBdWD8O1/fPswdsTy8aVp24fAhlhj+x9pXdTQAUztuMmCB6Ze2nzWmKy3JDiOtfEabVJYyyXPjSI6jvxEXv5BGAD6BEtMvRXIKJYpVFcw6ZmYhH9/y47WeYwA1iua6mrzTnQ5rPl8UNFHXs/9D6yTR4TrW9qxk98YC7lgWm0rrnRx2rXMK0oRsvlLYOLzQfCEH4ervCn1NNvQhSO2qAw+DthKZiUg1IFmmrInQ/L92a+EgHZAn5sKRBSdwSuGkWc2lb9pUFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(6916009)(86362001)(478600001)(54906003)(38100700002)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(4744005)(2906002)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUJOUk5Za3RRN3hoWUs0Q3ZCd0pXcHRMditSbTdpd1d1bXZFaEw0WmVXRHFo?=
 =?utf-8?B?dUszRm5XSXhRZDVucFc3SDh6Y3JZTHlrT2I5TFRrb2h0ci9rR3BLMm1mY1Za?=
 =?utf-8?B?QlJKZTVaOUFZTThPT2t0blNIbWxNeEprSlpXTnRXamUxYXFRK1l3WlVUU2N0?=
 =?utf-8?B?bktoellDT282ZVE3MmFrb1oyZjhEeGlGdE9JT1k2c0R6RjZLS21McnduUHdY?=
 =?utf-8?B?K3VOY0NNS0dQUFVUUmlYWmYyOG80MU1LS0xDdTJNUWtkcE9yVnpxRzYwVGMw?=
 =?utf-8?B?YnZXMTZQaWxHdHp2VnBkcnhROWY0RHh2dVFwQW9aVmgyQmpEQjJJeFpNOWlx?=
 =?utf-8?B?NWlqTlR0N2l1QTJkV05QRC8ydEVubHEvV01zTlMvOTJUMDZxMjBHcUUveWxn?=
 =?utf-8?B?bitnNzN0RVBPRXk4VWFIbWVEdUFtVEVyYjFQdzZ5dnVlbmxTQXhuTE5uZ0h4?=
 =?utf-8?B?TmNYRG1sWVAzNUVkeWt5dFJ6OTZOaVFsb1l5MjJ1Ny9jY0lyOHJlaVFORDY2?=
 =?utf-8?B?TTE2VkNzSlBSNmFvekRodHdyZk1FMnZwSEFndThKRnR4R1h5TGtuWXNIdnRq?=
 =?utf-8?B?U0R0bTg2dXVhNkdDeFpOR2hsNGtFWkdGUFY0a1luUVFOYXpPVFJXRVNIdDcy?=
 =?utf-8?B?UGg0RWhkM2JlTHZsK21BOHBmZEU3U2ZUSXlXeTZWNCtmeW8yS2VoK0VTb0tt?=
 =?utf-8?B?TEtQd25ZUXh6Sk45UW9jZ1B5RmpHSk9wVkdQaWJNRWZldXdqcGQvbVFVWEVK?=
 =?utf-8?B?c2VrWi91c3FMRVFLbXNTNGNmbmhEM0gvMU1KUzJWdE1iQWp5L2JRTHh0REdB?=
 =?utf-8?B?RmU2UFp3OTdkVWlHaElrV3ZZVkhtcURMZndMMWorMkNXSUpVNnNGZWtIMXBm?=
 =?utf-8?B?Z0tpVFNyZW1SNzR6d083S0FUQTBqdUZleHVRY0ZDdlBLNEFuZFd6ZXV2dzJU?=
 =?utf-8?B?L010dnFpTnQ5aThrNHdrdGw3bnFvZ1JhL29SN09ZV1JEYkxMNVZJbHlXWGth?=
 =?utf-8?B?UkhYYmU1MEtpeXRINmMyVDRwL0tZQzlIVENyV1pTOERkd2VvTVBrek8wUzEy?=
 =?utf-8?B?VTR4MlRnWXJZWGJNNG1US1Zqdmo3VEpOeld3UHpJaUFZM2RVMHBOMzFrV3JS?=
 =?utf-8?B?WmZqempVNll5V1dIeTArcFFkOUFsMU5Pa2RIUEJ6d2JaVVNSMFNnN3R1L2tw?=
 =?utf-8?B?cW16WVFCcnhkd1ZCcE9ZY0ZtVUlIa2lyMytDdGMzeGVVNnZ2cXR1ZlJsbng2?=
 =?utf-8?B?MXVlTmlCQXRmdEt1Z2JHYmVlcXVtZzkzdVN2bDNlQVpuQTV5azFkQitpV2ZM?=
 =?utf-8?B?WTN1L1BNYlpLKzNMRVNzbVRSQmtDRTd6bzdrVUc5L3E3VXFwQW9mZUJjdWZK?=
 =?utf-8?B?WGpsOCtUdFd2ajdQVEw1Q3ZDL3Z1T08yTzEzY3ZXckRuUnNURjhVU3VQMDBU?=
 =?utf-8?B?Z2liVVBoZmllVXlMZ2pqMlVkYWJrdGFyZEZybDkyQU1FNXVMWE5rTzJjcm9J?=
 =?utf-8?B?cU1xY3NHZ2hXVTUzeGZlSE9mUVVQYk56M1YzMjZBK0Q5ZGFqWTJOMXJJNEFn?=
 =?utf-8?B?bTc2NzRuekhZR0V6RkhDSFNDbnZZL3RENFF6NUxicExDOGZOTHNWNjFmZzh5?=
 =?utf-8?B?Y1g1Ti9FQzZlRmJZb0tlMlRnOUxIVzd5a0kxUmZocUZtQlJENTlITkJuTEhv?=
 =?utf-8?B?ZXhuRnZJWTFINktxdFJHUDlqYXlWaEorUHFhdmREWUJ5UHY0Z1kwY09yb3M5?=
 =?utf-8?B?VlMwbTdMR2F6WWJlOTEwdVVOb0xUZnYraTRtS3ZxWjkwZHMwZUFFTis1bVlB?=
 =?utf-8?B?TFhZdVdNQlViS0g0c3lXM3k3ZThTb3ZZODBLemRZUnVhVlYxMldrS0FMdW5s?=
 =?utf-8?B?bVFITGRhRkQ4dDVhazF6MVBIVG5TTEJEUmlIZmxGQkZKWGJuQWl2VllRNWkz?=
 =?utf-8?B?c0E2K1FqbHJHUVUxK29Mbk1RbFRwcEw3d004SlJac0pORDVvWUNVS2d2Smdv?=
 =?utf-8?B?cm43YXMyQ2xDajYwOTZDRnhYZHJCMXhJTzY1WUFiVVFOTWh1KzBUYXNZV3R5?=
 =?utf-8?B?OE9uM0lXRVg1cmJhY1pZOHdiM3JhNSt5REIyeWR2d0FvUjdJZmJWdU1LTFB5?=
 =?utf-8?Q?jJTWjV9lMmANkjSQpfINAW/yM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ebd6dd-8b30-45e4-9e87-08db9751bf1b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:22:35.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAu/LLAiqmfiHBCz4v4Waf1Nl0s6ApOnTXe5OBK7yVT9LMrT+OnOCzQgLPXZfx1JPpo6ba5FT9jnRtvTrG7+9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824

On 04.08.2023 02:42, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



