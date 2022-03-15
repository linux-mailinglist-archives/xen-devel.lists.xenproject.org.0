Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623A4D95AD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 08:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290654.493020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU1yo-0007Os-Rm; Tue, 15 Mar 2022 07:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290654.493020; Tue, 15 Mar 2022 07:52:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU1yo-0007Lm-Nr; Tue, 15 Mar 2022 07:52:30 +0000
Received: by outflank-mailman (input) for mailman id 290654;
 Tue, 15 Mar 2022 07:52:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU1yn-0007Lg-8n
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 07:52:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf0015a-a434-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 08:52:27 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-wTihynskOcuYRnbjvyKeYg-1; Tue, 15 Mar 2022 08:52:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3193.eurprd04.prod.outlook.com (2603:10a6:7:22::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Tue, 15 Mar
 2022 07:52:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 07:52:25 +0000
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
X-Inumbo-ID: dbf0015a-a434-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647330747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I7dnC4DWt8NPoO0cXObtun/M/SFzVw5ZzESLj3cnNAE=;
	b=mDMrQw6Rl5ML9i6C5DBc3DlHrVw60jogeQqQaPJWKJVAAbn5iUr/PZwehR/DiCKnBUr+Z+
	zzw8Er0RjXzljiiqHXjp6ah5OqELRkT9AOkA0tTxVcPQldisnok+/ETyPLoqofLLlKXEEs
	GB6Ikj+Y339IknnZVzY1wNLx0t1L7qk=
X-MC-Unique: wTihynskOcuYRnbjvyKeYg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giXaX+j17JDTJrBw0Qs90CdrSCyVKfSyNhKx74knJSISvBvWzUoGOgGUMpA5lbeLQgx6cfLHce5L/IwjSHhI30MaxsldeQQS9c1zniAsz8OFtsHC/W7pmckRkAVONKVMUCXs/LWX5HxelDdnSyWKn0FKGH3OqQlNxQ57yvt6NF2h/R6iwfzCECd4gm+HTlU0G6NKsl2Cw5g+UDcihw3pdwLvkqALeLMKMZkDKsntK54j+2Gh90KmJk7Q37j4FLUV7RZ/8Fg3I/lyWR49eG4Ueq535CORPPQ/dNBPhRqf8rxKjN0DkL7b266L0fsV2zxSPKxLJfMjE9naogvY1GIgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7dnC4DWt8NPoO0cXObtun/M/SFzVw5ZzESLj3cnNAE=;
 b=FirpFQlvg2PkVUTKhlN1JEnv/Q9bwqVYUxc7p14I3aEegNW/1/OzcCvnNKIin5nrw9xorsW1+Pc7lfBJt/OqxG/zcOUmlu1T1clxlomJXD48iiNBtgZhah9p/fhVDlBJF+vaxprGQhU7ag7ylPYAta58rCf1COdl13UAZ6ZxgIuvpYpUvK2YoMV0WgHEtN0C9yo1g5ECIz4lpqJB7yOPwCzaawpV9VabkhHX4yXzoypltmCkbCt/gJCnNJTnYy089sgMeizJC1Ka768UUpXhXrNuOiALOTjbJGb3tNw/q0Iji++jmc5y4ppluPdafIl91bLIiymvQmHdshwbbZ7sXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adb20db9-a38f-538a-a3a9-a5f7968fafc8@suse.com>
Date: Tue, 15 Mar 2022 08:52:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Some feature requests for guest consoles
Content-Language: en-US
To: Andy Smith <andy@strugglers.net>
Cc: mikeh@csits.net, xen-devel@lists.xenproject.org
References: <20220314163627.4pck24ahx6igggff@bitfolk.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220314163627.4pck24ahx6igggff@bitfolk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbbcf476-67dc-455b-831c-08da0658be70
X-MS-TrafficTypeDiagnostic: HE1PR04MB3193:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB319346B78ED239BB576AC649B3109@HE1PR04MB3193.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F6k5Eu+D+bcOKEokw21W4czKoBE6mI7vXtAoN9dYiLk1k1LFAdu2pQkVvirfdacME2RKrjm8vTa3jmiKVQf+ZtUb4XKLqmEwlRWfxGuGcAnBjLau2vkpmopc6JERjvIDlDoOGMsvtCYGUyWJitd77qT2HX7K00rmXaM5vEpbwMMofwfMmq0ABmkaEgttS/I9ck/wC4GY9Hu5wJ3+j684yoT2w9qGJMszYjWIcgLgAFmnUBfSrDRxG3sWd6FJaUPc3R83nEIPdjcVg/FD2Q7RbAYJRBcM2Kfu8C5r9L0cpr1/4uIx+T1zeAE2COI3zLGGT3X8mJvlbPEJEY8UtEXf1N9/hJ24nyODRbHbBjjanna8YP5UWFXjf1e8SVTNgUWad9SLdq+pSozxR/KjJk46l2gBJeF80bnY7hEokumx8jquCpxghGg9rrlB1uLGenUseAt8RHXHijgo+0CLGHXfq/aXWHT8c0M5o+7QiYdu8AGBARC2lv3kxwTn6aAZCkKIfp0RyJEWA75bTWSqGd47b3CvU/SIADUZP8gRQQeMbmTrurIfJ+3ou4Vy0F8MsWJxdxd1bakCY01hbJtj3Ej2inNiajR+yQCQw6lTWRjaf62DL6VNUd+b5dJE6wNKHEJB53Hbgj5Babq5e+1EiJNY2rzDHmfU2kS9jULeAZ00DIM1CqDPOW0+9ABpiWmycYz8lzJR1uT3pIquEifg6oD2DXpKnj2hUJ/MPX+nPTwwTaA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6486002)(36756003)(5660300002)(316002)(6506007)(53546011)(8936002)(38100700002)(8676002)(83380400001)(2616005)(26005)(6512007)(31686004)(4326008)(508600001)(6916009)(186003)(66946007)(66476007)(86362001)(31696002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THRlbEF4bWsvTWxuUTBaS3ZlZ2x5emhFUW1idGo0TlhUbCtKTlN4dWlmZkZj?=
 =?utf-8?B?QktSODVlWFBYSWF2ODdwMlkrd05hZG5tY2EyV09Zeml5QllDZ1hJWlpzd29C?=
 =?utf-8?B?aUE3SVVTdmszejJaMWd6eU8rVmtFN2Y3MlFGQzlaR3B6Y203ZVVPNENNdnlZ?=
 =?utf-8?B?c3FTNU9PbVRqcktSN09xMGs5eUpYQVJqeGJDQkJMZzVOTEZuL0h6SGczKzFt?=
 =?utf-8?B?T0FTMW9xaTNFNk5hL010elFOREhENXNIcDlYVE9lTWJhZ2tGc21mOW9yNzVB?=
 =?utf-8?B?V08wZGorNVZpS0RNcStndDN3OGNpRWs4ZDFTbUJNTHFRZEV6eE52T0pUOGRk?=
 =?utf-8?B?WGxPT2xlRVo0SWxSM29kMFFoWHJ1MjNyaWNLcHBsajdhNWg3TWx3eThwWmdq?=
 =?utf-8?B?NmRPNFJHN3FBRmpoa0lpNWg4eHlnb2hwRm16Z3NEL2ZRMUJscDJkTWR4d3Za?=
 =?utf-8?B?dzMvL3hmRUdVQzJIZkxtUGdNSW9rRUZEUGxnV1RFTUZLZ3hBbERka0ppMnhy?=
 =?utf-8?B?L205U0tScExQd0w2NnFBQ0NUTXNvdDlZbVE1c0lOVXdJQm1pd0ROL1d2TzdV?=
 =?utf-8?B?RkZ6R1lJSVhHdDVJQm5ydEptZzV6SGhPSU83RFdPUmV1RXZHWFNKSWRma1Y5?=
 =?utf-8?B?eHBOZEoxT1hneTIvTG9id3N3aDN6bU9iZzY4cTlyd1ZzcjZIbEhWQTZUZG9i?=
 =?utf-8?B?NW9ZS2l2UGFrcEdNRFpJOGs2WE5qNEpLbXE2K3ZOSGRyb3cybWVuMFNxSloz?=
 =?utf-8?B?cTcvdFZvbGhEN2hvemxMNUExYkErdDRVZC81RC9wQ3RsaFpCbzh0RGIzTFA4?=
 =?utf-8?B?RUVPNHZIbER5RWRTdlVKbzZVMXFRM0FaY1FudzZ5djcyaXlVa05ZMTMySS82?=
 =?utf-8?B?aXl0Vk1WVmNYdUJJdHVZWk5kZndKY3d4djI2L2pheGczVUo3eXpGQkNhNDRs?=
 =?utf-8?B?RzdSTEI1QUNmb1oyZnJkZENMN1plR0J2RzFEbmR1WXRSZUNsYmw5K3hsVmht?=
 =?utf-8?B?RU1XNFBldHZicGNtYW8zNS9GUDhKU0dwMlU0SkVOS0c0SjQ0U3EwYjJhYXFM?=
 =?utf-8?B?d3hZdjRjdGtqeUhwMWFoQ09HL1Z4dXRoNnpDVFpoQ0lIYTBiL0FjZzhMS3NU?=
 =?utf-8?B?cHhzYnU5TFcrOE5aSjVkcUdIV2xMOG91K2xjRk5VOHR6KzFXR08yVU9kb0xX?=
 =?utf-8?B?bU43aExNdTVuNkN1ZWQzbVREeGt2OW15NDdvRTYveWcxdFdreERLa1pyeWQ3?=
 =?utf-8?B?YTJqcDErU1JWMnZ2NG1pS3BlOWV2bjI5NjVpcXZsdUFKZ216ZTJPV1k3Yi8x?=
 =?utf-8?B?MUUxRG5SamV0MlRKcElOUlBvRDdqRlR3STMyNGtsNGs1Q1B3WDI1dWZDVEY3?=
 =?utf-8?B?aWdKR05VQjRlR0NadFErZWxEbmY2RXpyQ2VFaWJKTUtKWWZrMWVRbkJaUGxE?=
 =?utf-8?B?NCt2VWdUU2R4S2xHZ1lPSGJMWXlqeFFoWFUwdWtKamhwVExLVlNyV3NzbDR6?=
 =?utf-8?B?MytHVmoxTmZ4UHJQSDMwSWVOVFczL0F6c293dnZTZGo2eDU1OUZRdzF4bk5j?=
 =?utf-8?B?NWpwZy9mdXZqb00rRFMySnltNTZtT1JlS05TNjBucTF3NDlQRXhXdjY0MWh2?=
 =?utf-8?B?UnQvR3ZIbDhIT1ptWjdROFF2Y3REZFI1dXNZbHNVeGNQQWJCWkM4NDRjL2ZG?=
 =?utf-8?B?NFpBN21jMzlwT2F1aGRyREpFazBuTTlkUmNUdmxybW1Ca0psdnlxbWdaVE93?=
 =?utf-8?B?amFtdXF2RlFxUEdHcno2amxBQW1HVVVaMkQ0eU5FNHF0NU44aDBVaUZ6RG1Q?=
 =?utf-8?B?R3ZFZTd0NmhHWnE0c0I5YUpRaEhtRVBzTExaUW9YelpNNG1KOU5lOThrUDVZ?=
 =?utf-8?B?dWx0cUhrM3ZocUc0dG5pUWVTSHRUWXhzRksxTEtEWFFqNk5Jd091N1ZISS9H?=
 =?utf-8?Q?LJKfiGpL6WztXBDR0feWGQDe/E/zCuMB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbcf476-67dc-455b-831c-08da0658be70
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 07:52:24.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPKZxSpEn6AhlGcW3QTI6cudp4vXUU0TT5O0xCLEBlCCBYqrGAR8J9sy+8BACSOZnkPXSZtx1cjMWjRg9apIvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3193

On 14.03.2022 17:36, Andy Smith wrote:
> - Ability to remap the "magic sysrq" key combination which is
>   ctrl-o, and possibly disable it while leaving "xl sysrq" and
>   /proc/sysrq-trigger in the guest generally working.
> 
>   Reason: guest administrators are often inexperienced with the
>   details of Xen. ctrl-o is a bad choice because it's actually the
>   "save buffer" shortcut in the popular editor nano. On more than
>   one occasion I have had guest administrators be editing a file
>   with nano on their console, they go to save it with ctrl-o which
>   appears to do nothing (because Xen is waiting for the sysrq
>   command that follows), so they do ctrl-o again which is taken as
>   being command 'o' - immediate power off! I have had an emergency
>   support ticket about this because "my guest randomly crashed while
>   I was editing a file".
> 
>   I would therefore like to remap "magic sysrq" to something more
>   obscure, or failing that disable it in guests as we/they will use
>   "xl sysrq" instead.

Without meaning to turn down the request, I'd like to point out that
- as of Linux commit 368c1e3249af (over 13 years ago) pressing ^O
  twice does not have the described effect, but actually means an
  individual ^O to be sent to the application,
- independent of that commit ^O followed by another ^O would not
  trigger the 'o' sysrq handler, but do nothing; said sysrq handler
  would be triggered when ^O is followed by O or o (without Ctrl),
- this sysrq triggering model isn't specific to Xen (and hence
  sending the request here may not reach the necessary audience) -
  besides being implemented in code common to all hvc drivers, it
  is additionally handled by some non-hvc tty drivers as well.

Jan


