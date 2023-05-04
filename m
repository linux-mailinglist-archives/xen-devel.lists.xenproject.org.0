Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EEE6F6CD6
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529749.824483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYtN-0008L3-LR; Thu, 04 May 2023 13:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529749.824483; Thu, 04 May 2023 13:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYtN-0008IN-IJ; Thu, 04 May 2023 13:21:05 +0000
Received: by outflank-mailman (input) for mailman id 529749;
 Thu, 04 May 2023 13:21:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puYtM-0008IH-9n
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:21:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe12::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8402c845-ea7e-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:21:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 13:21:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 13:21:00 +0000
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
X-Inumbo-ID: 8402c845-ea7e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gm0bs90qeOG0WODSswUzUOhzkZ38lpvH8xbJmewoJqCIMpl/5jqJmehxgFvp3fKoFmehYKbgWrPy87LIpHupktbPM97b3V8Sl7M8ABmQleo9iTSXElA62QOvLSXx5hhkyf0kJ+7d7Xx+EvQ7VdwpkUjWmgj6o4cnADHJgZGLGoGZbxa8akOpWD4tfxFZY1xDdKJZnI+YYJHEF3z4Aq0ThNq8s6RvgQH3kn4an1hcMCksU3Kz9Nib/V6zA5x2M4lCXbU+lkVXO5gp7DMpl7LoG2y1oDzweSDE1eTS3+0BF6gtKzZAHNZEt1Zzu+qSE7tY9LXxGFAXCGMYAfrDwKwqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4lJ5TCVn+ArYoM6a9T+pkoACxd5SnywVsjoTgae4rU=;
 b=VzK4l8udJDs7dHKzUKpNQH4zv97ZrLhcflGMO2Zu6SF2BfNt+u8lvpbWOCOzPGetk73SvimjgHFaOH8UBOL8eKOIaCyRH8MDSCmAsXTtJMiC/tkVR7UxLjp3czKhjD7AiK7tQbD9ulDey4qpP0buZsGle9niFtLh3pTNooob6bF/BzCCr7qFfp59jPwKnKF71mH9ZCYjA5/V09+pC9NPbYiyiNXo++vHehuCojknBKtikCu+f+6EAfbkgWo1TcN+4okLdH8s/TtPbPkRAGZMvSF0PR2RrJyLQ3nzxtkOPdg+gKJUb05IKOjdpRbtefeE/elWIuc+109JLyri+PwwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4lJ5TCVn+ArYoM6a9T+pkoACxd5SnywVsjoTgae4rU=;
 b=m9mn00OWurukgjPA2dNPa7Bhi0HyOC9AR9uYW3SuD4wSZc2UaW2I9vY2whvuCc0E3jo1G1fybn6sKESfNTLH769Q7IapI4iK9wsondvH8l5K+Ib6OGtexNstYP3HKA7ec17FO4YQOwTDexP5dwpABo4qP2/mLjP5JdnjKVGD7jYLq7QwDamknhbXKQuJ7OAsGp4+tY4hFwG8RQOdXBM5pyFOI+4akbBq/RM7CGId7eR3qd9CLhHMpbJdHXUovtlO/6TO7WvoxuC2vn3LUhOXsgXVY3q3Bg9miFjLZl9NndT7bO/zX1lm9HDAaDx81PvHOqHhmgmoVgVxxouq7rqVUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12008cc4-965e-9d7d-b655-95c867b3bcb2@suse.com>
Date: Thu, 4 May 2023 15:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] x86/bitops: Drop include of cpufeatureset
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504130755.3181176-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504130755.3181176-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e515585-10e6-4872-76b7-08db4ca26778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OqaQLPii4qhrQGCqjMhKumNAtW29Lx8nCNbTOK1jnYA/2wSfy8zla+BlHLoTgd/+9U6DPleF5ovlTCW1DUWC7+sjiO91P6TwtjgnEdI5vcU0A6OjyK05K43DBJvYwKMVnA1LUrFSOqhwSHLE5yr4iM3c2KaEmI5SL7LS0ZIlY3A8USDxnTBnY4/b95fKFFACU9D75uIcQau36DvOARRsgzFL/wKPxaRKh6pTNTM0ljjFkV7eV3RLB7SEfk3UivzPfv4fyOilQS/H5AUJDD8VCIb/kYhpBD6Ys5Mz39YrK2g5BsQtysoyT5DJ/twkh9xjI6ODA+VrN0wst/XWGU0nfWoLyVQR9yrPdydfkp0xrxk2pzqQzHGY3lAOXUOpeVSPTWYl0mg2Hu6IL+EucU11T5TjtP98sLYSZ9iPzrUOOpEQhlrA8lkpEmePV4B2ZfLqG2JByfkdSWZ15KDukZi5GxAikzSKNj61q89iJTHyQGAdahc0uvFe11HjTfBtAY4Xe311kNHoOy5jQSvP/oZo9wMvrfzCYJrPTqTWqtKTz/D+E/ku5mhp6HnJN72KfaElCpUhUTXulBBrjZPQmrGmehx11gCGGf2saJV4B5DloA8SFjFx4h90UiyiVMwix/JJkQa01uMx5smh+IbIFJcc5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199021)(83380400001)(54906003)(2906002)(478600001)(316002)(5660300002)(8936002)(66556008)(8676002)(41300700001)(66476007)(66946007)(6916009)(4326008)(31696002)(38100700002)(86362001)(6486002)(36756003)(186003)(6506007)(53546011)(6512007)(26005)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDZxZ3NUcXR4TitsMFJteDFFZnJrNFlNUWk2WTgzUWFSblc2R1BtSUhURlNT?=
 =?utf-8?B?REQ5YXdObkg0TUZlRlMwMGhXaVJUQVdTKzBwSElSb0Y5bng0WFR6Z0VGNys2?=
 =?utf-8?B?NWwrcWVHeDdoQXErMnd2bEhNZVdxQ3JTOFcyNWtqeXVaaGFHU05CYVM3T3Jo?=
 =?utf-8?B?UUFxVDNqQzFKeTd6QytqLzhsWElkdTVNS2VPVDlzaWFqd1RUaTJScDNrVUF3?=
 =?utf-8?B?Y2ZBN2N6WmdTUDJBbXNXSWpUS3kyY0JrYjNIQ1NNb2dMYTdzMnJoSjZGRTcv?=
 =?utf-8?B?MWNNSDRjOWYvTVBTNlN0bXA1UGJjekYxVmlGNXpmYWFRMUY4R085a0lEV2xZ?=
 =?utf-8?B?Z1Jlc2FKbytqdkJMNXhrVW9ic0w2MFVjd0NxYXN4K0ZuMWw3OXdBTFJ3Rzd6?=
 =?utf-8?B?cm11L1g1VkFsVXBNT0dUbGJRMzF4YmdmRUtVZW1JdXlMQTk1UmFlRHJ4TUUv?=
 =?utf-8?B?cjNOUzdDakErMUxtNU9WaVIvTVZjcjFQOFVjcDcyTTJEK0JHQStIM09Fblh3?=
 =?utf-8?B?UEVOdmIrbVowelU5aUFzZXRoS0tyOUZIQ1c1ZWpHQ0xPMVlxd3JXc1VJK0Fy?=
 =?utf-8?B?ODJPd3V1UFBYd0ltM1FIYldtSHZuRnhWNEJYT3NtNnRZV1ZFUkw5TDU4SFdX?=
 =?utf-8?B?ZFNOZVRXTjdkU1ZtQjFXZkk1STNiVlhVcTA2eHp3Z2R4N1IyWmpLckZIc1pV?=
 =?utf-8?B?WnZQdmZhNTU3alhWTHZySmp0NXdrZWJFSTNDdjd4QytTbzU5Nm9iL2k0V3lx?=
 =?utf-8?B?U05zeWxjSWR1Ykd6MzFoKy82aXFVNDVpT2VQdTAveEFKVHZHZFNXandsWFBr?=
 =?utf-8?B?S3FYdEsrY2NFVEgxMEVwejR5WUhEQjM3dVZjMjVqOXVsdFJvaE1wUjM5VWZ6?=
 =?utf-8?B?ZUNhbU5xNExMTHV5NEN1Y1ErdkkvOEJzZVF2dkE3eFVZQ3JMa2JNbHI3YjdF?=
 =?utf-8?B?NjZuaURBeHdTZFROUFBsaHFRbU9XSjRwNU5LV01RMGNJTmdEYmRLcUVzS2Zn?=
 =?utf-8?B?SmY4VEJGdCs3WlIyZTlIQ1N1d1hSSHJqUlhLdzdqN2JpZndGSWtGVG9xU0VV?=
 =?utf-8?B?a0lOMmhuSWFVcDNpbFMwUzJwdVZhUE1ZZks5bnU3OUhzRGwvSndUaUlQcnk3?=
 =?utf-8?B?Qi9WaElzL1AxMUFNYks4QWlQU2o0Q1lFL1plM3BKS09HMmVFTDhHWDVzTEQ0?=
 =?utf-8?B?R2liQlBJSjA2SmhhTExEbGNIQjkvMEovQ2s5V1M3eEU3aUhwVHVpMEZEWmZN?=
 =?utf-8?B?b011akcvVU94bEsweHk2UFhGY1FNc2k0UkVrOUdVclpOZmJnSk5lTWxpT0hJ?=
 =?utf-8?B?WWxzV1htWGMyVGZQZHNMYWJJOUxhaDhnUVNQRzhIbkZhU2dSWkIxU0dmZE03?=
 =?utf-8?B?b0hNcDRqbEJhT1dieHp4MWhSV1NWUHg1ZFhoU3pUUUE5QzBnNTdueFZqNUNZ?=
 =?utf-8?B?SnZBd3haSnVONUxhNG1KN0xFTTlWZ2NFazg0Zm9JMnhQM3RldGVDTThqOGVu?=
 =?utf-8?B?QkdYaG1zTkkwc1JjQXY4WDg5KzFoSzFkemdIRzVwR3VZaWNDSC9BTlNaMmlU?=
 =?utf-8?B?dmJtaTlrRFF0ZlVoUWlmWDZQZzFSamVJcmQyK0QxVU9remZKenlZSS95T0Vs?=
 =?utf-8?B?bVpMVzg1WDd2Yyt2ZU53UFNGZlUvYVEvSDdNdDBWUHkzMWxETHFpaHFad3Fm?=
 =?utf-8?B?Wk0yMDZub3VURVM0ak01cEl1T0V4Q1lNWERqYW1lai9Bak5FQ2xlRDE2ZWVG?=
 =?utf-8?B?NCtCaS9iS0ZrdFQrZW4zTG82MWRwbEE3Rkg4aEdjWFlzWjVUNmZIakZPcEh4?=
 =?utf-8?B?MENXcmdFQTkyOVo0NGNxWCs1clp4M2lJVEROVDhQUHBpbXNOZnJ5aE9CNEFQ?=
 =?utf-8?B?VFgvVTBRanhOcnp0aXlqSkNiMWI1MjRCNEVsQVkyL1BndVd0QlAzL1FXelhB?=
 =?utf-8?B?d09qSWdqaUE5VEFYU0tSNGxyODV1UjU3UTF4ZXRGZzFNVmpxWWZKOERRaC9v?=
 =?utf-8?B?d1hmd1hYUFdpME81S3hpc3NRbGRoRmpaYUxId0JFQTJERm1pZG5TUGVPbzRm?=
 =?utf-8?B?dkl4SG5QVjlsWndBZnRrWi8vMEN6SkxQM1ZlaWgzMFpOWFRKTGo3d3BhL0Zw?=
 =?utf-8?Q?OPAfcA+Mo5K7uE9dm6ec9B3O9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e515585-10e6-4872-76b7-08db4ca26778
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:21:00.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/ojy2G6to1WF50O+/Gs97rRqpuLcTsQYKdbcVDsY0UhalF5xSdq7eoemK4t3lz9UdVPBPdYgqvZNW3m65Uuiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 04.05.2023 15:07, Andrew Cooper wrote:
> Nothing in x86/bitops uses anything from x86/cpufeatureset, and it is creating
> problems when trying to untangle other aspects of feature handling.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/include/asm/bitops.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
> index 5a71afbc89d5..aa8bd65b4565 100644
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <asm/alternative.h>
> -#include <asm/cpufeatureset.h>

Prior to your 44325775f724 ("x86/cpuid: Untangle the <asm/cpufeature.h>
include hierachy") it was asm/cpufeature.h that was included here,
presumably for the use of X86_FEATURE_BMI1 in __scanbit(). I guess that
wants to be asm/cpufeatures.h now instead?

Jan

