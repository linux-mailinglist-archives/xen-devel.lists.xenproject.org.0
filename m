Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8605736B6D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 13:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551711.861373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZvs-0000yE-Jp; Tue, 20 Jun 2023 11:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551711.861373; Tue, 20 Jun 2023 11:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBZvs-0000vs-Gp; Tue, 20 Jun 2023 11:54:00 +0000
Received: by outflank-mailman (input) for mailman id 551711;
 Tue, 20 Jun 2023 11:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBZvr-0000vk-BY
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 11:53:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22ff643a-0f61-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 13:53:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8672.eurprd04.prod.outlook.com (2603:10a6:102:21f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 11:53:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 11:53:53 +0000
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
X-Inumbo-ID: 22ff643a-0f61-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Apu0RCuUiaTB6oMwO0q279+v7GjRHj8Ja0W9/4kHxFa5IyWQ86mgpZrRAR3Rnc4hZ+EOl+jGSoec8RotJMBFal5xHwkG+WDfUSTp1ute0h+cl9UJFfPAc3Pa6rwesiugi+j6qUxSIGNJAZLR4ugMMbWW3+K23xMqJQARAk8XkpY1oRYBdppiAu97dx/3/pKIe9HvtOxkCMDlEYbahQCh4WTaO9wF8wHqRP5KQalxZwAL0BNkyKmpXPKc03B7xFDHYOzrt3K/fWHy6VHxSETHglX1c4jxwl1CjzVaJ09xdo1D+1NcwN9B/aR74kCBPwXmdBlTQa1HpMtrywY0AfzaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcnxm2UA4PTZoJHwXgvyEwJ37MxC7qs4DMoAl6fX3ac=;
 b=QN5JZCnC/TvDAw+XhnBD1OGhL2oIdU/EKpPSQn2vKtrj06sFabxMcnJdEvjXxCUqlJjuwzSY9sUhNA43U5SvERqE5v1T+j+Jlu/RUSOp31KvDCKsCjWPXTHuRRM3g9cl332UpWEa0nahYLvPj05XjTIegx4QVrd4rrWNpassNYutP9fWMhsLjPr4NDLqKjPzJoTSGjNZJ/94twgBcugMcEQ/Vc05u7yK+4oRt7KSRYsdTQpjmZCuA/W+BdlVHHbEBIvzTg9tgSFXWui/i7kvdm4HyJwMfHNVYfCxjOcNl1fE6QiWW7GHpQJcrz6XwIgaNIh5CLGRr+4+pQjQu8rAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcnxm2UA4PTZoJHwXgvyEwJ37MxC7qs4DMoAl6fX3ac=;
 b=F+JBznjgBqs87779M4z3KuqTmvnRb2+qX8Rq/lc30L3IHbLi/DwetuVN1Pqs3WacgOXIWhYRKwwxA0SwbtWUlSqdNqy8EsuCgIiHx+WrEDz7hUUq9bbStrFeaj1P3c3LMxTNxLb7jW61QkL8+izGmdhoerg4SPb9L5OfvQeq0jwrAfIOvdO0hSDshpDVwU3FV168DsiteXLtSmI1xKfhlzG3ptDjNkTN1bCvt5rdXvbFQRPonHn4OyhO1tjg0pCDl5cqk6GwVFKhWjv/rrmMmFFmmJVkg1BaIiadT67y83G3XoniCXYSrxooL2SGdjAr4s3rK2sBE27RUZb8TDBliw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <efa9a3b5-06b9-b918-a551-665f6d36e849@suse.com>
Date: Tue, 20 Jun 2023 13:53:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/13] libx86: introduce helper to fetch cpuid leaf
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616131019.11476-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8672:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e21a00-78ae-4c38-aec7-08db71850539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ai8TQjWiP9d4WJhAaV5ukSNg+2EFaPo2B8FSHTsZfPPzNp76hS6Efu9XAvqOmuFGuMYBXQw/sPXUxXiJb7rkilr5b2Qu8i6vUb8S4fjMKJv4+6wC2vwhiRVPzIFrXM51aOSg0RipHk9mARfgDTy2xtDmBKhuYdE3dXjnYH850PzTxDv/jS1kVL25EBzcR/vxeEEvsI3QPYCA4rmYdZ27aagX9ZDaV8Fj4N+TFBSnTuTicHnIB0fPbEN+S6/j6x8q6+BNa1HLu1bmGv8tNX58IToPcU5G0OFzqpqwnzcIVCOBJUJLoVM0DkwZlbl5zbZ0z1HfPf2TIUo64yN4hzqeQhxRG4CWkAKWVUTnrlfJokRUA+ogucKrYdyCIYKbR15fyEIG7gMrutY8olBoV/92Pi5HhNxSEfpnVbN1EDcRHJ3/NzFT2j+SXWRN8pXrhsbdRr8NC4VZLuY5BPdSwajU+0K1ZLLJCj2uppZ0stQjAyMNMNbaQzsZKZBD4bF5CbtAmbCDvZ9zxbFSsTBcPTd6q7qV/apq3TfnhVCKQn9mtLj18mjxgYy9Cjwzc8SbH4HG4JnSk35PGufhq1P0WkzJavCZ20tjTWPWJV4bN5Z/Ta83S16UKJO8CPSYTKgflg0qCjQO2ZQbjd2dnGV5wdenng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199021)(4326008)(66946007)(66556008)(66476007)(6916009)(2616005)(38100700002)(31696002)(86362001)(53546011)(6512007)(6506007)(26005)(186003)(83380400001)(478600001)(36756003)(6486002)(54906003)(2906002)(4744005)(41300700001)(31686004)(5660300002)(8936002)(8676002)(66899021)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRwbFNOb3ZhQUZVWDdHMzVLR3Nxc0Npclp5cG04SU9kOVBPeTd3UlVOY3Nm?=
 =?utf-8?B?TUFMdkxVV1ByRjRCZG5GdnNvZ0lYYXpvT0QvdUJRZHRES3pDcmJKQ3RxUjlS?=
 =?utf-8?B?cTJMenBBNU9RUFU3ZzVldGlMNkxlTnk3dUErcjZtcTlDQzJFMUdDUlFGZTlI?=
 =?utf-8?B?ZGhCbUkxYUU0T1YwV2tQV2RjRnhLeTlRU29zaERTYVBFTHk0REJ5Ym5yQlFG?=
 =?utf-8?B?elVJRXY1aXdtbHBIWVYyZC93bDdUQWpFdDBSZmNpb1dPU2c5ZFQ1bGU3YnJw?=
 =?utf-8?B?OWwva1ZTcHVsalZ0OGlaMHVtMFJmMURqa3JvOUpoVmg0MHllSW1RbXZGK2ly?=
 =?utf-8?B?MER5c0xYWUFra3M1YjNqVEJ6RXNHcGRGMDlWV3p4Q2wzbExacCtyQmZYbW9O?=
 =?utf-8?B?T0V6ME1ka2Z2TXcwaGVqUXYvQzRZeUNOb2NiZjJnTzJJUlpQRlhnaWJ1WjBR?=
 =?utf-8?B?R0llWC9Oc3R2TWh6cThON2NZV2pmUzFaNEJTdWxla1ZiKzFySndGTGlGZ1lt?=
 =?utf-8?B?VEMvTkhmQno0a3BTclRiRk5tT3BPWU4zS0xla1Z5K2FPRExoYlhSK243TTl2?=
 =?utf-8?B?eUlYQVd6OFc3dUFwMWFZVmZPeDhsc0xGZGVkVzlIUDlsamxGRFBDanRkZmdl?=
 =?utf-8?B?TSt5SWtJLzdaMkFiN2tac1hZbDNjM1VFUjV6RHVqQzhJdTU5U2ZEeU5JVWVu?=
 =?utf-8?B?NjA2R0U4R0RSS1NWK29Ib3k5c3pUVG9xejcwMmVjcG9ycFNHSENtZjlmblp1?=
 =?utf-8?B?cmdUeFkwLzZxNmpFeWt0cUFmV0xHU2E2Y0lLTVFJTFBqd1NHTmlTNVp3TWJG?=
 =?utf-8?B?SU42Zm1COEJSV2orZ0x1MUQ5c01MMlJvSjJzbGR0elRyV0NrOTNBdjQ3eVBz?=
 =?utf-8?B?QkpuNVRpS3Z0eC9YVDA5OGlNOU1KMFd5UEpTMW5mZEIzQjBvaWNqdjVZdUxk?=
 =?utf-8?B?WDErZHFTWDZTTWdlWVlnOWgrVldKTDRsSldHd1BsSzNHZDVTQ3F2YzQ5QklH?=
 =?utf-8?B?TVdoMDNCKy8zdUtDSGRuU01DUFVwOEdKbHZ2cjN0YlArWjh1Z2pjNVlLZkVO?=
 =?utf-8?B?bGl0QlhiUG4rKy9ZVlhaRmtJU1M1a1dHUzV5cUhvck81ei9kTmhRd0MzTnFw?=
 =?utf-8?B?akdqRWtRSEY3cUxiZjllcEtiUUhFQnhlS0kyRDFPRWZQL25TcVpJQkFYOE5K?=
 =?utf-8?B?clZ1M1pFNlBOS2I0R3FJaHE4by9paTVPUytvYkRXamxBZlZ3VnlGOGk3dWRB?=
 =?utf-8?B?S3ZFb3Fsaksyb3ExZFFXTEZ3aWRsOVJIb295SGZHVzN5RFUvcjZjc09KYnJO?=
 =?utf-8?B?aURSa2JCRnFWTjMyTzNtbWFEajBDTFVGa1dobTc4MmhFMnFWTU1HcEpPR3Za?=
 =?utf-8?B?bDQ0Z2NGYnhiUGlPUUsxZVBHa2xLK3ZjVC9yNEVOWEN4SzNQU2FyNzBxam5u?=
 =?utf-8?B?ZHdWQUV0RzNYdjBHYUVlN3FtNVdoejJybmozWnp6Z1F6OFRHdU9PSlVoM0VF?=
 =?utf-8?B?aEJsRTFWWlFwS09EOGVHZStYWFp4VXgzS0NxSWcvc3ZWVjVIS3dFM2cxTVRw?=
 =?utf-8?B?S2VEK1ZRdTlPR0N0K1YyZEJHcm5pSHBKUGFJR3JjWkpaNlliNXh2V3dKbVZP?=
 =?utf-8?B?T29LM3dDdDVlSDV0U1lCZ3kyMVRNc0RpZ0NoenhBNzg2dEZFSTRjM0lCY3I2?=
 =?utf-8?B?OFR0bVBkVnlSdk1HNU9NOFVJOVNmKy9pQWtiTTB1d2N2YkZGKy9vSkl4V1Vh?=
 =?utf-8?B?SDF6Tzk0c3NnaTJSeGh3OG11UWhvTGV4TldGUlRBeWpOL2ZXV3hGczY3SmU3?=
 =?utf-8?B?ekg0dEZpcFhkNi9pYXJWNVVqTHNaMEFkY2NvZkZDdm4xTDY0R3FrYkVqT285?=
 =?utf-8?B?L2VoOExzSWc5dFh2ZVhLT09nRTBpLzEyc244UjVlSC9kem5JR3JLNEp3eTUw?=
 =?utf-8?B?WlFZMjl2R0Fyem1OT2lvcEhidmdjSzQ4RE9pWTVqVmdBcDdnM3FpY2FlS2Y2?=
 =?utf-8?B?NnQ5OVZpOVZoakJiSVFOeHBDeHZLZ1Q5RURmWkp0TERaWkc0Vkg1d3BIMXNr?=
 =?utf-8?B?WS9XUEZWaG4wSlkzNVNNb3dVUWNMVFBYd0FvT1duSSs5ZkQ4THJNUTdVOUZl?=
 =?utf-8?Q?+/bGcXAbet3G+9K2J4TI8Urau?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e21a00-78ae-4c38-aec7-08db71850539
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 11:53:53.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZFF+QHIWTIlTmXwzCwwpy/S+j41uroK/1wg3FZZidghLZYFlAGLtDA8MjGXdgEox/QYAwtDkMVruaWoYGsTxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8672

On 16.06.2023 15:10, Roger Pau Monne wrote:
> Introduce a helper based on the current Xen guest_cpuid code in order
> to fetch a cpuid leaf from a policy. The newly introduced function in
> cpuid.c should not be directly called and instead the provided
> x86_cpuid_get_leaf macro should be used that will properly deal with
> const and non-const inputs.
> 
> Also add a test to check that the introduced helper doesn't go over
> the bounds of the policy.
> 
> Note the code in x86_cpuid_copy_from_buffer is not switched to use the
> new function because of the boundary checks against the max fields of
> the policy, which might not be properly set at the point where
> x86_cpuid_copy_from_buffer get called, for example when filling an
> empty policy from scratch.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v6:
>  - Add more tests.
>  - Drop Jan R-b.

Feel free to re-instate.

Jan

