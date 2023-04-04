Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09B6D6796
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517995.804092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjij5-0006qw-Dd; Tue, 04 Apr 2023 15:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517995.804092; Tue, 04 Apr 2023 15:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjij5-0006nj-Ak; Tue, 04 Apr 2023 15:37:39 +0000
Received: by outflank-mailman (input) for mailman id 517995;
 Tue, 04 Apr 2023 15:37:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjij4-0006nR-AF
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:37:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a019c2d6-d2fe-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:37:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7818.eurprd04.prod.outlook.com (2603:10a6:10:1f2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 15:37:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 15:37:34 +0000
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
X-Inumbo-ID: a019c2d6-d2fe-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss6mEVYZxtrSuSiHJFFHBUVGrlVgNYSmPZKPnC9gd/dk5PhAgiU7wO+mkp/ZHlBooCkHog6WNe+fwjaozsZdptjBxO5v40BPonLu9QN078JEKWnNGf+ciJbWbgR1t1sZiHzqjjU76fK+cgeH7Vi4OrYjO5J3SCQzVpZS99gQvoK16U+BQUlnnDGAZWTfWd2SyccA8wFWQXMJnyTXIXG1EdSHwa9RZ92I1AEyq8VAZJ3CTJkEnzdwkGs/6ktwAH/DodZP9DLcPbW+ZxTZ+2JMn6PR9Ie2J+ML32KiEgQtCKGXIfBkT4/syGOKLEIjR86jBw5NPhS3j79qFo4o1kYAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14ddhLCYch+LjmllLCbgc6txJlddcQ2MeHG303rRx20=;
 b=ErPsOFog8cfLt5vbdqatYRmOpCZmG4zfXpaedBxNZX2QQ89uiM4aXBqS8GYnUecjJL/xhUDDRTgm9iPHbMeyPzgVML/cmda4juOeBMorrwWgdkxnWEUULoumJAFplcbl8OGb0/sz6msO17OmsQrfDSYxHjduTkyz/hOIY7wlZJKG+LsNDa1cs2P5Jnz0DGXhaxJODeIC3AnQAZG2dJG8YGzbVLqJGHuNKc2p12V7v8xaCCNgNf/Oem9zb/vwYqmfD5OOnJJ0OS8dPNQMO2WPptRCVGH52MaqwIkAVPPr0YKRXTOjlOo3KLhjPJk/gqvSWTS3SZuofil4LtYYNyPqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14ddhLCYch+LjmllLCbgc6txJlddcQ2MeHG303rRx20=;
 b=DA3juulYJKMUnEqJdZOQmjLcQxKfEmS3Wr5pB1N6AmFfX1wZU3GKz/LsHgusnuiNDJUzJL8r9SRJRQQ1VPitxd8khTfRnVlNublMmJ3xEXRHmcmH2DgxtJHTZCAX+naWqRmaB2H+SV3QSxGHti0k7W0BgkktupKluw8r9p5J0oUm/o5sWv70fdxrC5PPhb47dgcn25VU670FFy62Ct+sKz9Q99uChq5YmN6yKF0GVPZhV9gK5CZhYmcJNqIlTiOyByK5hSnCz5SlsZTuoRSFf4zJnzD6/HgABU0Du9AtcOk9+8rDPQPEJdXI4QcVfWBjkMWSXsKpu9pzydKTYCo8Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5abc440d-a484-34a1-589b-420902d44d6c@suse.com>
Date: Tue, 4 Apr 2023 17:37:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 15/15] x86: Remove temporary {cpuid,msr}_policy defines
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
 <20230404095222.1373721-16-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230404095222.1373721-16-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 893548af-ce87-480e-3bbb-08db352282ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U1snMlMci7TBwWBm/r/hTsjK5NjtDfLKfyofl/Gle8Rbp+PY1CsZ1gkvqMg0C/lB+y40Fxxe4T3m7giL/6wnhPXEXWRQhn8TQyNkuw+w0tJv3Sk7R7Qhfn1FqkUKSS7qLMoYaqEwj+HzFF2mB/151dzdF2joBxK7HrxyvWjPbjT3UkvYo/uGi/bEz+QvNvbsKqLcO9wKr4Y28iLYX9yxg6gQP/f06l7GzX/2ETqE/J1UTqDlYp64SGvYMi0AIRecTBdy4URipGE7MaJwzsaDbELn8oe9iBd2rAJ7MZZ8gc8UlpQc7QXZbBIzdOyCLWS8OkXX+Dx5iL/siBShoHlNIYt7bVuiIGqQCu0o4nh918BuRRtTjx1J+TxCpvac3H176RPh2YMSgy5Tcn228qrrn9YPo0sU/4axKnOJCyJRcdes7MCfnOSYA4zK8gO9q96q5AWSvQX6ddgk4RVyB/6a1/SOmZ0pY1fKWxkMZRTGcqTyBs3wX0j3vj2E2O2W+NNjCLJNY7YTO0Y1hOxL8zyTBWuH66jwP5Z0zi8K8N6EqzfbuLy3z81tsd2fqu0xKAzdT6kRj09UyJRlaHiN5pgIpmvNybwAVf32Suujq6lMuHXw+Q5De1XGuGvRzmimBEXsEqu47kETk8HvrWFq+85eLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(8936002)(5660300002)(38100700002)(83380400001)(86362001)(31696002)(2616005)(316002)(54906003)(53546011)(558084003)(478600001)(186003)(6486002)(26005)(6512007)(6506007)(66476007)(6916009)(4326008)(8676002)(41300700001)(66556008)(66946007)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVVUN0UycFhqUEIvT2k3M3lsclF5dGVlaVZtWEI0WjI2aThwdExqSi9ycE5s?=
 =?utf-8?B?UWZiT1VpNWpSOVlBSWN4c0hrekptTUNNL1VQdUFkejRxZmprZU9ybHhBaS80?=
 =?utf-8?B?VCtuQ3A3aVN3ZFNQY0NoNDRvSnhPYnBJVGVUTzVxSWJ1N1BDcXY1VnZGS3Vh?=
 =?utf-8?B?ekJJUkNDRWJ2bzg3MFlEZ3I0UXpKYkF3N041azF2YVc2blZEdjFjM1VyL2J1?=
 =?utf-8?B?R0hvMk14UmszY0FRVElUNEFBSE43dGY3V1lhOHNKS0tVR0pxcjhFcEJKaHB3?=
 =?utf-8?B?Q1RQL0FvcWJ5SEx5NlRsN2pYMk9waEprM2VpcTIveTVvYlFYZEJSQloxeTAx?=
 =?utf-8?B?ZlNWOTlnMktaa2hWblI3TXNqb0FCcWxPNjRKRUM5ZkJTMzg0aXZIZHJjSDY1?=
 =?utf-8?B?Wkd0b2tFd0lNK3h4NTVjK3drTUwzYU9wc21aZGNmQit3U05lN0U1TkJpZHFw?=
 =?utf-8?B?WnRDczBYazZVcDUxUklkVXBZQ1hVd3U0ZHFlRG4raURJN0d1YnFUckFFT1lD?=
 =?utf-8?B?a2dld3V1SmFwM3IwNHJzQTVhWHorRndUR2RrQ2N6SlozMnUrVFFFbTdKZ0tw?=
 =?utf-8?B?SVprd3haQWJVSnNQRnZ6cW5iSi9OTytZOGR4OENtOThDenFpUTFtVHAzcVMy?=
 =?utf-8?B?UFp6R2tDaXZIaElXMEZoWWlqQXVjR0NRcEpsVUVUM09nMFYxQlVtWkhDVnh0?=
 =?utf-8?B?NU11aDZYejNocFZucFFRVFg5dHQ0WDlsNlphSUhnTVJJUzNZMDZLMWkvQjcr?=
 =?utf-8?B?cThJaE0xQ3l2MThOd1NWN0dGSWdqbEdNd2NqTGM3K3E5SmJueG43WGxxLzBz?=
 =?utf-8?B?OU5OQ0V1aFpTbFNVSjBaK2xWOVlQcE9ncEdQS1paUUtZTjVsbGFqZzJpaEdy?=
 =?utf-8?B?UHo2SmtxYWdHT3NJZmcybHJrVkd5K3FDMkkraXRsU243L0xNU0JmaHhhTlNv?=
 =?utf-8?B?d0FtVGN6cWc1NkZGVlVTRXV6cGFuYXgxVnNlSHA3YzNLTFVCODkxWlc2WEx1?=
 =?utf-8?B?WThkKy9zVkxhRVZaQ0NhM0RrM0lJRDZvQ2ExaXpLR2FzN0U1VDRkQllmVFlZ?=
 =?utf-8?B?WFU4UitFNnRlQ2I0NmFpOWhiR2k3WWI3SEtBdHRxVzg5WTJWYzdSL2twZWsy?=
 =?utf-8?B?QU4rOXpJbUs3UHhnV0EremZYNGI0VWhEQnFSa1hSeEUvbzlPZFBQektPdEVh?=
 =?utf-8?B?OWlsVGFlandSMmk4bjdKK1NvVXhlNHBJOTVlbFBGSVRoQXJpdys4TWh0NVFp?=
 =?utf-8?B?TVdtS29VTzMyc2F3SVoraUpBYTFyamtCWGNua1o0a3U0NWdINzlqa0ozUVd6?=
 =?utf-8?B?U2tUSHJydWx5Y3M3NDlQdnhOeEYwbmkwdjdPaTBqZ2dqTjBsdjFETWhWNnhl?=
 =?utf-8?B?cWZvZnIvZ3hSWEVHTmtOQmpqWWMrTlRPTEtJSG5yOVVZQmtKNWgycDlvczVm?=
 =?utf-8?B?czl3MmNpanhaMFZUUHBLWWRuZ2hXWnNOZk1tNUJBM2NEK3IxVkpaT0dzaXBV?=
 =?utf-8?B?MWlkY1daU1JXRmNCaW9NYkVZVlRvQVI3Q0hmSEd3YXNXM28wQzVybG1OUVV5?=
 =?utf-8?B?V0xaUWdNMHFML3BxM1o3SnA1ZXRsTlZwNUMxZ0RDb0hhUGtlN2FDN3pnWFBt?=
 =?utf-8?B?a21TZ3VDclA1WkxxeUFtSGNYK2JYSk03WDZnQ0s3YThjOFFqSEVhcG8zeERz?=
 =?utf-8?B?TCtlaE9LbGFKaGI5by9RaEtRZHQzaGJ5Si9aWlRWQzJsMkl0RkZYeERSWHJ1?=
 =?utf-8?B?VUtRcEtnZzJTcVZ4M1hpdUJuN2Vub05YZVZqN0wwSklLa1BkTHVTVUptZ24x?=
 =?utf-8?B?OGtJNk16Z2cvc1cxcUJhQTl5Y2hONERGNEo0UjR6QTkvbVNTR2NVcnh1d0d6?=
 =?utf-8?B?cE92Vkk0b3k3amV1TUdOckk1VDBDa1gxM2l0MGQ3T3JGM3BLUzRNNGZibjFZ?=
 =?utf-8?B?Q3FPK2pLSkRjN2s1bG1NZURaVXBtRzJaSVJvenNwT1dnYTV0eUlEbWg4TDZB?=
 =?utf-8?B?TEY4bDRlREJaSnF3YUxBNW12NEFhTm5YU3JTekJFL0FMRk95ZkhCYmVOMFpw?=
 =?utf-8?B?S1VnYXB3Umx3VEY0V0Y3OVFvS3lqWTQxaTZtdG1wWW4zRk12eURmL21OOVU0?=
 =?utf-8?Q?VJegFsx0vWKmsN8ts84ZbiqMu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893548af-ce87-480e-3bbb-08db352282ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:37:34.2467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF+c51SdEOCP2+ywgvXhNrF7Aei2KGMr4dMfGUhuEiXXXIjJpDmhNSgd5Yj48w+riBrDnEhZxA8fcFPWgw8NiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7818

On 04.04.2023 11:52, Andrew Cooper wrote:
> With all code areas updated, drop the temporary defines and adjust all
> remaining users.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



