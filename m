Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF163C822D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 11:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156004.287918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bbl-0004qT-4C; Wed, 14 Jul 2021 09:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156004.287918; Wed, 14 Jul 2021 09:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3bbl-0004nY-0F; Wed, 14 Jul 2021 09:55:13 +0000
Received: by outflank-mailman (input) for mailman id 156004;
 Wed, 14 Jul 2021 09:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3bbj-0004nS-UW
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 09:55:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57754b66-768a-4607-8a53-924b02ae7ed1;
 Wed, 14 Jul 2021 09:55:11 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2058.outbound.protection.outlook.com [104.47.4.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-DtxubS-9N3CEd8p9VMKlRw-1; Wed, 14 Jul 2021 11:55:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Wed, 14 Jul
 2021 09:55:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 09:55:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Wed, 14 Jul 2021 09:55:07 +0000
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
X-Inumbo-ID: 57754b66-768a-4607-8a53-924b02ae7ed1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626256510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fedO57SkFDDXrNnP/dbrn9xGLKzSS01cyqPY+97YwKg=;
	b=XA2KUCM4elCgnpaPycoF8kh3f0oPmiwYL2BLtilOPQfzb7F1Z3l8r97NtqQA6Mbrn1qe3u
	eQGpS7KHIbarOIUCgiSjxMQfG+8KhFCOJXSvoecIMZNaceI9OnOHQfwD/Ic80TWIg/Fu6z
	nd5YLxUAYeHC3KADcvQKblctHFW+f+Y=
X-MC-Unique: DtxubS-9N3CEd8p9VMKlRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CoUYdxNVnW2+saz9Qy0vxWeaHna8UQrO/YdTnxM001lxuri07/gO710Fywg7bRDrpRcRkhOTiivtIm/a1ELRMbqSDPEtXtoK8jbpjfzfe0UM5n1Jk7RiIRXLTfQgqyFgr30ceyACpZjLthWE2XYKxGRx/ErXR+QWiROHc+l9/+Yg4XNyAZGrNqh6bWO+P0Eddb59jB5JMwyzF5+xowGYPU1V4+AJ3+0rv9bEc816awhIibzTwnKZLdh5T6XIrrRt4c4MOGR1yAXZ9I3Mp64jQis5kIxiKwKwRAoGbjwrgVJfoCS6kcgQDQIwn8lOfkDjwvV8NrDjkT0rWb/65T0mGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fedO57SkFDDXrNnP/dbrn9xGLKzSS01cyqPY+97YwKg=;
 b=JYaa5J/UpV08kZ9yMsAYUkNGrZXeHmq4O1/ncVpiqaKRy2TJEyid38Y/y3QrdrbjoBteDDCrX01Icd7K/u4PDwYtnDuUu+AFk2jYcvzOoWJp2AJLF7dzyIKwDva0hyzfZsbTw2fZbXcKtrSOE+nLn7qTC2Bw1SRuG/XAw9XCg6/ff42Y7iD3JLFZCqAWVy6WqVDcBFKVYIgIhr+oQPLaagtcrvULb7KLwN+hitqbqwYHZvYS3AgsqhPgtww82b5mtZ2mfW30pNnJSJQxRUqJdz3Xo7k+BGOT1FZFyER+tmlqQkdPz50FbxrVH3XgeypDiSHpeUH75OdgIJpFlpMo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/4] x86/debug: move domain_pause_for_debugger to
 debugger.c
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
 <b7b3169d191c3ec86a9cf5267e661aac9c17559b.1626136452.git.bobby.eshleman@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <201ea9f0-e46d-e381-5fb0-15a8a340ce70@suse.com>
Date: Wed, 14 Jul 2021 11:55:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b7b3169d191c3ec86a9cf5267e661aac9c17559b.1626136452.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d7dab9-f5a0-418f-abb8-08d946ad762b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB51683E33E6D87FC9F2996989B3139@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0txHouAqvJDvMJXr22uDNJo58ggiC3OSCiOKDxr998X+IpJDZhvUH1XClclkjDJZZ1bQrkVdfg67lFHp6fhGNVoQAZslE29d72TriaFS12LbEEOpmm5zlDGbvZbGMF4AUHcozPnq8OQCra6b4u984iCmm2G6o432ZyfsM29u21gOzY7BFAdMqApgvtwy2e0fbUoWnbzqRdUevk8n73KSsHgOlM4r+iaLiUWwgjeDgsJxIK1fU9ttPUuer0OoFFMaDGLbcaOmqka8GUxSwgVRJpeet8z0aeENHq22sqihAxVBYNu26hlChXfbh7+jpfba6dIvbUvXyGynllOXYynM5OhMQp062zhkq/y6Xn0sg3fprmRMbQ5ED4CZCi0+cEUZ+qtlbXCTo/xrUdepbcn2dzXFOklYbAeClq4im+CBbHX/xaAK7OKjL4dfZjIFZaUmnJbUQAgS3/KDVIA/6Zw5uNUeW+QuSPwomPEvRavFUJTe9/kwV1B3yFLpIVUaJr+EDnrQzImy7CV2Sss+16NZ9nSK3qCygfq6FUftdNj+7ynO9g0uKFhJVNrN/jUwDYukdhIAIW2B0HOenqc4NtruUfyv6M8lRLhrW2LwzNpvOudH+XOsIZyzV/FJHgkhrmfxIz2qa9dduLujLfY7BeOpVKSDnHKVKq/aDyGIEiaU4ouXOqcOKb12DKRzeOQ9/dFs0Aow0VN3FOXec7f1da3dD2nqpWp1HeOGQPBATUUZ72w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39850400004)(396003)(376002)(366004)(38100700002)(8936002)(6916009)(7416002)(5660300002)(2616005)(31686004)(956004)(86362001)(8676002)(4326008)(54906003)(36756003)(66556008)(26005)(66476007)(16576012)(53546011)(4744005)(2906002)(31696002)(186003)(478600001)(6486002)(316002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWpqUEdtM1lLWGhTdEYyLzY3UTZBZms3QkRlR0hJSHlCRGxWUFVNc1E4QXpE?=
 =?utf-8?B?V0JkMUNDYU92M01KTkxqcFVUMEc1Zkdack9ES2F4bWdCcnZPb3A4QzJjK3Nv?=
 =?utf-8?B?TnZGaWZZcGdOK0dXMGd6UXJUV1c0enMwWUFPbXJvZVFOWVZqN1BqdUQxZ1Ra?=
 =?utf-8?B?b20wUlFXZUwwNWpXR21uc3krYzc1MHdVYWpNalVwNGJqdTFrMVZmTVBJOUhT?=
 =?utf-8?B?bWJmaFB3N05OOVN3eUVndFRub2RoZ25TWjlxZ0EvdmZLMXphNndJUnpxMXZn?=
 =?utf-8?B?RFNLTTV2dm5qb3BSbVNrYWF2SncwUnkvenQ2Z2VsOFBLQ3lsdUwxM1QrVGtt?=
 =?utf-8?B?VUlKZm80MFY4VnJBSUVBT0tZdDdPVHhiNUlLcHJXeUI2d2lPZ0xUL3J6SndV?=
 =?utf-8?B?MWd2OG5NL29JY2djN3BhanJ3bkNiQWUzcm9rZm5NVjZYakdFOG5mY2hJS2Jx?=
 =?utf-8?B?dXJzUUZZSHJlTG1qeEQ5dGJGYVlKKzAxNklPSFRNQnNCRXc1ek10djhPb3RH?=
 =?utf-8?B?RkNQMENwMGM2VXdCSVhqaHZ3NkZQd1huVi8wdDlZZkhSUnVhaDJ5QW44bzY5?=
 =?utf-8?B?bVZReFF1cjNCRWdhcTlpNm9udHg5TjVLK2lzWXZvUzh0TkxzQUtRQTAzMFkr?=
 =?utf-8?B?cUFxbm1FRTIrTUJLT1Y4bzVxZk9aOHdIbDFuQjJlVHJQVkI2TFpjMG1LTDN0?=
 =?utf-8?B?ckt2cVJQbjA0SjdUQjlxcURONXBXVmpPZ2s2SytkV3RmOEc4ZnIwb0YrVGg0?=
 =?utf-8?B?MStiTThLMmMxdVlBNi9Vdmg1K29aVGt3TENneUYzZ2FIYXZhSmhNWkp2SXI4?=
 =?utf-8?B?Y0xTSmFYVzVKU0FoZ0c3MDBQbWhTblFzWU13aUxiS2IrNTI4MTAwZDR4aklv?=
 =?utf-8?B?ZStZVkhUUEdiVWUwd0cvRGxpcnZVdGUvMytwTjBtQzFTanV2NXM0Mm40NENV?=
 =?utf-8?B?QlhVM0VzMnNrbCthSHhHNTdMMS9QQ1lGQnBMZFVUbE5ZdThObnZJME9jRHJD?=
 =?utf-8?B?OGwzWUNGb1gyWE4wR3RzcHg4UWNSczVsUGlidEpSWk5kTzkxcjBXNkdWR1lL?=
 =?utf-8?B?WUFqNEZLU2hjcm1LWmY1TVZ6T1M4aEVkdTh6bUtROXprcHpPQmt2VXJkZGQy?=
 =?utf-8?B?cW4vWUZ1YW5SbGdHSGk1NmNkWVlVNHV3SENjeHVlQXJRSGJLK04vZGVlclBh?=
 =?utf-8?B?Mm9FZ0RVMFBnLzRveEVUdUFlY0hJL3hKRUFCaFNaY3dMb0EvejJaVEV3NlI2?=
 =?utf-8?B?V3oySkdEMkNhK0tlclJvamhCbE1oWVV0em1uaUgvSVlRenM3L3Z0MytJN2Fm?=
 =?utf-8?B?YW9tTGlTQVZlVEtJNTVmVGtzK2NFMjJXSXZQeWxRMjg4b2o3akZ1N0hxY1JU?=
 =?utf-8?B?MmloaXlqa0J3MWlQNTdoRjBLNUttS1dzT0hkcHUweUFNRDJpQmtBUzNrR0pm?=
 =?utf-8?B?b0dnQlJ4cWRvUVFhMU1vVnFTekVlNmZPLzhsdTlMZmN1azREVUdZOEV3TjNj?=
 =?utf-8?B?dkNxMFQyd29DYUs5MWlnbUtjU2FrWUVGZnhCQXl1ODBSeWsyUVVQdWVqOXdQ?=
 =?utf-8?B?L3ZaemhpaHMrcUUzdzNTWWp3eTRKaTdZTGhpOCtPVWZvenJnYTZxQlIvaDRT?=
 =?utf-8?B?YXVheGIwUDdTSFNRQVpLMTVWUDNQZjdCeEtMVE5wWXhxVGFEc0JiamxWQlRz?=
 =?utf-8?B?cWhWL3B3ZEhvSE1WWlJtRkhaS0lHcmg5azZXQmlKNEhNcmkxRzY1N3RrVzQ3?=
 =?utf-8?Q?AA9Ynrk6meHu2OcD491pBll2nVDv6CsbXLQ5Di8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d7dab9-f5a0-418f-abb8-08d946ad762b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 09:55:07.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozExHOLlAsxvMV7NmETKurW7SV6Flfkdvv2kZ+Ng63L/D1//X1hpVkBvhJWAO+RlzKbeR26hGLlwTZ+8J7gLDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 13.07.2021 03:59, Bobby Eshleman wrote:
> The function domain_pause_for_debugger() is conditionally compiled if
> CONFIG_CRASH_DEBUG=y.  Instead of placing an extra #ifdef inside
> domain.c, this commit moves domain_pause_for_debugger() into
> x86/debugger.c which is only built by Kbuild given CONFIG_CRASH_DEBUG=y.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/debugger.c
> +++ b/xen/arch/x86/debugger.c
> @@ -15,6 +15,18 @@
>  #include <xen/event.h>
>  #include <xen/sched.h>
>  
> +void domain_pause_for_debugger(void)
> +{
> +    struct vcpu *curr = current;

... "const" added here while you're moving this anyway.

Jan


