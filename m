Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56998718419
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 16:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541842.845019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4MPg-00010t-0T; Wed, 31 May 2023 14:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541842.845019; Wed, 31 May 2023 14:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4MPf-0000yp-U1; Wed, 31 May 2023 14:02:55 +0000
Received: by outflank-mailman (input) for mailman id 541842;
 Wed, 31 May 2023 14:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4MPe-0000yd-7X
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 14:02:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4dd29a4-ffbb-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 16:02:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7953.eurprd04.prod.outlook.com (2603:10a6:20b:246::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 14:02:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 14:02:48 +0000
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
X-Inumbo-ID: d4dd29a4-ffbb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfSkkMmMNSpMIC2r+dgDKEQrgKp+j9A2IKlgnGRbZ2vvyLGt6jlfXioH/vPTWvHWkBPIQVx9psezbn6piXwq1IfD6+sabgRU5qcPDmS8/UO+ZI1vk5e4/U9jjzXJPF+XkmYDIb3kvbrU1IVE7HmWQzcbyL2kR/77+ra7A0gMOI0FTJ1A9XaojBQS7ZILbrc4S9IJhb7fni7YJvfT6qVQDX7xBBHGSfFNGCOMI2w7x2xJsUyaLkp8qD7rFmXkulHFBSeDI9oVFpws42NaJkWgbE4ooFyAePschRZd8sD1atUQ9eMIN+Gf+YQxJ2ldbevlXV77aNxJWe5nK3hqINyqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGqqPUSwVl8ZXQWXWeiK1coGaeSXoF+U0q1t2zckZSg=;
 b=jLRkeSH+sEvnoDbaBN6M8LHzcjTs05IW+43P0iOlnC+qFHdeShapPg8S3Wq/SbVZ1gk+VQu9CR9wjRGZNN4ZhHl82XxNMGoKE1k6IyB+PMu8GqxSdpsoAMTKnBkBpExv+tiAIU8P4+JJwMr7id6ZtPFAu3s5zWzRZmYZbDpkoKNwe7eACVvq98CbqW90ieUJ0L5fM5agJznsEn4DiEzaWZLKj0p2agsB41QzD+zuVcTJldMzoIgitoWHrhl8Dq9IMIq5w183RYGwPGnVaFP1ozUNO4WGIPqEwjU6Qa1AzFKJU1iIAlBiLrrrC1RhJ/pEsESjamPJ61AqbOPX2mKSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGqqPUSwVl8ZXQWXWeiK1coGaeSXoF+U0q1t2zckZSg=;
 b=3Dwpt0GUTzGvamZae94XsaRJkSbr6dp2VPCQH6MRfczIEhMCpjWjXXDWHG59u9Sbvd8dOAQ39zc4F0wmx3q8bmrouqIx+dcwI0oUV5OUUOyD+3TUSpWgx7ebJAlth2+Gtf/Kl9u2l0l1PTXqQfMUzGBp5n+s4jTBhcsG8+0lxmIQrWzu7xuI6CFDtQRmw/yG9gwuAl9egI3lqZFtxJdTJnhI/Xom48+rbNspVk2DPBCX/bRPQlWFDbcQiQ/ZuX0Dgbvl13ivAXAsp/UutY+dcRg9I9bTkGpiJR24tbcYeon9pNo47nmjF+hMFssN3Ou/Bd6DkLgkHLDflKxVVEJroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9dcc7a9-066a-58ed-0404-c787aea68325@suse.com>
Date: Wed, 31 May 2023 16:02:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] vPCI: fix test harness build
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
 <838c09e5-97ce-2d23-9d42-645a8925217d@suse.com>
 <ZHdQ6Qw8vQIZ+s3c@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHdQ6Qw8vQIZ+s3c@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9f9e6d-e83b-4554-792f-08db61dfb6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RTKmKc8uVx1nKFs/ISP/G7OWzqtFGp1k02nxWpfFeOsGSzYHOXihqYhGfIrnpaN1xeCtk3fW5zr5OO+/2076dEDPLbyXGavFEopem87VHLEa2zRF6ZM8B86AOztSyXnnW0nd5MfVOVYvAu2Is2rt2prqLrRvWMPToDKyKR7meqdyEU9G6ORTNCSIqQN6uOGlS67ZFW9ApOn4K1YI7HDyR9LQ1fDnqNJkUYcIDEZk+e0zi/zXpMvPb0IR91PSixLI4inlz9wFkLHs+8hw34pT2T/72wwrVG0obbcEsvIkzfBiB1IOKZDMuAO297Lj6wO6oJHkiUajqsqKQFaAAtp7aGwfU14qRDXnjKXa2MonEB7M4VXi4qxusqO7OeRPGKtsyfx3kI5vbENa/BfCUSESa70NNb+EWND9lkOSkFQ6Y7LilB5GE+i3LMha8/lx3Jurdv2F4tB72eEdy97W8orQJAkyjmkBaial+Flva/coJSEUa0tfx3UCJfPDNOufcj2hOdd8MCTQcDF9O0Edik7AHYO9QVZWq2wwGPGK3wuKfjwhXG1vZ0HifyLyVyPDhaz/RE4EuSWEpWZ8K9rFMxBH6UkN8WClHvc7jvwT9gizyaDRhjCsfS0YH/1XGcox1F98Oyhusq+x9oUkGF9D7QCjbQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(6486002)(316002)(6666004)(5660300002)(2616005)(8936002)(31696002)(86362001)(83380400001)(41300700001)(8676002)(478600001)(38100700002)(186003)(6506007)(6512007)(26005)(53546011)(31686004)(54906003)(6916009)(4326008)(2906002)(4744005)(66946007)(36756003)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVRldnBxb0xoOURvVXlVbUFxeXRTTUhNVUtKaW1EZUdmWktrQXl0MGduY3pU?=
 =?utf-8?B?NGxTemd2TXVkRnd3VklIM0NZQkVXazZqLzNBcGxmUXlsUVp4ZVcrZXhPQW1H?=
 =?utf-8?B?N1dYRHhORm0zYVRsaTFYdncvZDlLOWdKQituUU1HWnZFSFR0QW9qTTIwQ3Rh?=
 =?utf-8?B?aTBWNzBNZ1BYUE0zZlVKa09VMG5TdFVDV1JOaHoyNEdQUk1XSmFJUzdaWlhp?=
 =?utf-8?B?eE84cHJyYmNUNkN6VHY3clFpNDhTNU51ZjBkOHlhWFVpMmNZclRXZmkvSlkv?=
 =?utf-8?B?WlROZ09yeXl0dCs5SFVvTjI5T2hDREIxdk5xVFdHQ01raTlOT2VwNytMTDhs?=
 =?utf-8?B?aU5uMDREUWN5Y2w1cE0wMktFVXNlbWovTzd2eVlLTE9vZThLWCtVUy9DNE01?=
 =?utf-8?B?SGtCTFhCbDNVM1BpeG0zUU9VR3hPTVIvSEFCeVp0SDFJRyt2MHVaYkxhYjBs?=
 =?utf-8?B?UENsQ1lYZWZ1WlRoblRtKy9vd0k1UElKdVdXR1V5QThJcU1WT1pkcVBydHY1?=
 =?utf-8?B?ejlZN29HUkFvZTgxdEc1WVRGTFJ2aHkrd0lYaDBaOGNsQ3FvTU44aVRCRDQ3?=
 =?utf-8?B?bU03c05FNS80REwvc1MzNU9vWmYvWjlwYUx1L1A2OGFmM0o0WjdMNFQvYXFq?=
 =?utf-8?B?VWNGQVV3Zit4Mm45ZTVjZnlGenhGS21mWjdZZGFoV3JaRjRMcjFrRkI3NmNG?=
 =?utf-8?B?ejVCTzRGL3ZuNTBRRDJHNTB4UDB5SFRKR1I2MWhCMXluM3d3QW4xdUVVWUJP?=
 =?utf-8?B?MFJSZXkvcFEyREN1dStibWJPUEJaYS9sQ2J3OFRUVVdiM2JVLzBrZEVJdzVt?=
 =?utf-8?B?TWRHTWNObzZUSHlBNld5NFVWVElUbFpPNjZBSDdaQS92WmZxcEdKNXhlblM3?=
 =?utf-8?B?V1JXNkdxTHpCL1dWbzVYR3hDQmhvUG1WdFcyRDhlRGVRVkMzUGkvR2IyaGZI?=
 =?utf-8?B?amhxSGlCNGp1ejdQUmNhd25WZVZMbkNVc0hsaEZYcElTRURsS3BQd294S2Nn?=
 =?utf-8?B?a2JEZjY3TlVMcXU0cWVTd0lMdHBhaVkwaHZEVUF2NTI2OWd1MXY2UERUc3A2?=
 =?utf-8?B?SGJjMU5yN3k5czlrU0NmbXBrQ1R5UVE3MUpYdU5CT1loOUVRR0ZXWlJBR0Jq?=
 =?utf-8?B?UDZkZzBDNHZSTjBYK3U3aDBIMytBeHg2N1I2cHM4a2RwTEJkMVFlZXRISWUv?=
 =?utf-8?B?UkVoeVlpeGpYWE8wNm5kU2F2OTd2NkFXUVI5eGV0Z0RxUG1vTm1DTTREc3Na?=
 =?utf-8?B?Z1d2bDBROTM3V0hFUUUxVDNlYlJHdDFyRXZxVGZSL25wTFJIcVFVYkYzK1Bz?=
 =?utf-8?B?RjdUTFk0SkdqMHdIeDhaQ0pFWTNtbnh2UWpFd2EwdzFBU3ZpZ3FPcW9iV1g5?=
 =?utf-8?B?aW8xOUdXVmg1OWw5eDZkSGx3cUJGa3MwN0pRcmFhbndaTWRiMjNCc0QrSHJ3?=
 =?utf-8?B?VFFkZkhKQldjVnh6T1JTdSttQUlpTFpkcEtpZm52NTg3S3pkSVNFcFVuYmNv?=
 =?utf-8?B?ODhZcFJOdVJJT0NPQ0Q1bzlYeENBOHhUQUtieXVFZTQ3cjhwNnFnckNxUjZ3?=
 =?utf-8?B?MzBabEJLRjBnMkp5QXkzZVhLSUQ2SVdkYmdaNDRJdzlGYmpwWGhoRWtITzhz?=
 =?utf-8?B?NE5BY1NnU3l5S1NQNTJLaFAvM2lMZUtVZHdRMFhzYnpzSmpyb0NEVmluTXh5?=
 =?utf-8?B?QVVXc3JuYlpkaW5TQ1MxalFHSkZmdUZGeFBMckJYNXQ2R1pvbFBjNXdkMTA1?=
 =?utf-8?B?dUZmOUl0RDlZQ3RCZ29YNEM1ZDB1YnhZaDBPdEdObWl0c2VQUmZxYVBCalFJ?=
 =?utf-8?B?UGcvZUVOM1M0QjRiSVd6RWZ6VmJMUTFMN0lYMFpVOUttSnFmV0lrY3lqZjky?=
 =?utf-8?B?b0xxdHFGNlFiSnpvNkFlc3U0N2pzS2ZOVC9wbWRIN2tkdE4wOFJpUFBJZ2Fo?=
 =?utf-8?B?OHRoTXJVcDQ3MTNxSjFmdkQvTnowZHhZNmFNVVE4NkR6em5XTTl2N08zR2pU?=
 =?utf-8?B?bDR2VGFmOFdYQUxwcVh5WStEcUc2RVV0OEVVNlZtZVlBWTY0NXV4KzJQSlUw?=
 =?utf-8?B?U0xIOTJGdXJiZWVwTjNBNWxiczRFVlRQTEo5RzJJbXAxTFBoOXpSZ2E0M3Zx?=
 =?utf-8?Q?Y33TxTDiZlF4a83TNUR9nE6ww?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9f9e6d-e83b-4554-792f-08db61dfb6da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 14:02:47.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLnpamAlAVur8NZihRKkyGnHfWVA52X9/pCTI1w8lOmamGK+ntOJcotN5ZlSz1hx8yPffsfxOTP917h9WwwzBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7953

On 31.05.2023 15:51, Roger Pau Monné wrote:
> On Wed, May 31, 2023 at 03:19:56PM +0200, Jan Beulich wrote:
>> The earlier commit introduced two uses of is_hardware_domain().
>>
>> Fixes: 465217b0f872 ("vPCI: account for hidden devices")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> We do rely on the compiler always removing the call to
> pci_get_pdev(dom_xen, ...) or AFAICT that would also trigger an error
> as there's no definition of dom_xen in this scope.

Not really, no. The stub macro itself discards all its arguments:

#define pci_get_pdev(...) (&test_pdev)

Jan


