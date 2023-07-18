Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68A757822
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565047.882882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh5N-0004HR-6o; Tue, 18 Jul 2023 09:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565047.882882; Tue, 18 Jul 2023 09:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh5N-0004EV-46; Tue, 18 Jul 2023 09:33:37 +0000
Received: by outflank-mailman (input) for mailman id 565047;
 Tue, 18 Jul 2023 09:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLh5M-0004EL-32
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:33:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7497e0-254e-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:33:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:33:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:33:05 +0000
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
X-Inumbo-ID: 2a7497e0-254e-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlZp49RVm+VSFxacMa5vtK0Ao5hX3EbADM+u0/IX41kIZ3bORpbMSjlRDdx+6Q9r7E6ICxDp+zRWGzvaBRSiDdiGN0baqK0JFiSt0XF5J0Ip2AMaT+bsOXXjSwHL/l8sxabvoMcFDhWEBbWsI74YJfJXSpXCjnWjOlZXVwEMyfPJeZ7wCZwoTCRM9T1/E4KrX/l7k9I/MX6srxMcZvN+sSKBK3JA4gSDLsMfUSmYREoLa7yR+epSXYvwZFAdKaEjSOYiN/BUfmEsfwA1MS8DSBw4ckS2+jnYqjizPGFoldXZVdlrWvPnj6pIZvs3uR0EPkVcyBSUQpFJxE5G2lXeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP2dXm2eXieX/ufdiLz07SKqSRZfYZRY1a5RBUMzF9g=;
 b=IB7yibi7wx4Xxk54ATzXUcWHOz9mDXGoKEg9FEGXqNdwHXg5M+x5olHeO0qqIDdV9Mg5KUThnit4v8H/hUn5+AMCohCqYnbxmGTWk51099PoK13LDUCD+Ux3A3zQN+b5xL4mMNFlYIBUqFkCWZig5Xyd9mHdpapDEev3nfwkK+cLUIZ+zHA7yg7FuMQYlJO8VC6NuSoej66su4aGyVPPQGLJJA9+hhtvCT5NbIyL+nR8Yiupq/fQUZtDdTukviIT7xp6S2qr3tZbNsIvQGD3ufTnKpnSULO72l8D3aVB0MTs04IV0Opp0jcwEvrJdvp+3MoSSN1L6/mRfeRG+osSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP2dXm2eXieX/ufdiLz07SKqSRZfYZRY1a5RBUMzF9g=;
 b=AIn7mHXH/MA6QwQhP9VEj1QtO2wC/Cf2TbfHmg1HrZAyzJX7qyGQ3uuS67P8R7W+LiCJwyRurWcgu53i1uvOym2P7rEgCMxQtfbfTsedlThPtdL6oaQGD94f+JLkUNtHEJ3fKizNO63RXpW3ph3zXuCoh0RWFuZQs79KSMa+917Ve8ytJphDGTyT366ddzzwyEh1hfHSEoqhaEmEMARlRR0oCnpGAQKvUUVRa2O50F/02bNxnCHHQyIUF0lm6tLbA9AmqQkwDbr6utn4qgnyYGcU9mo5zu6m7nQSYzBeukivWCxVp3Ie2Luk4WNa31/cFtg08g+M4rQiGWfZDlU6cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ad1dc72-3b1b-fa7f-8ce4-dd7973c8da93@suse.com>
Date: Tue, 18 Jul 2023 11:33:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] Make PDX compression optional
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: 34dcfbc3-5316-4010-c9b6-08db8771fd34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hAl2p8d7NTPEYpiZLpXZYcVvmELVZ8+8ptlL2fkuPMqm/FDOzZQi2LGlxoXmyOt18Jx7D/Q92u+Tv+kAttLG+ywSrTaGp7jQzHIaHqfWqnohIPdEwccTF+vKCqHPBgAShQ3YhYhYhw8qhEL2z3LD72hXgFv7SmhtWDjT2MpK4C+JTDSxABp5bVXRV2MtZRtzMpF5NL7Ayy9A9LN7adItNy0G58NMvECLy2Oe9rkG0VZZpUNCGmhxckAUV2cIHZXiBX2CJDjHF+2QQA7w8rL2v1sHCwZqApM6dxJeqTVHy8ZGn7enzECXUWXIc/hT7HJbG0oErlKmdetcULgxcXBXAO0YSpQ0ZXLZni3XIMiR9z81brAwFz2QDmlsp7qG4zX00GXtxbE9oLFOWk/OfHWaD/r95m1zyJYNCSwC4ke1NykTpASYgLXdvgxvlbOvdpysyvmb7NZuSgjnPzitQzmQ1Iq/oQrQ1s0g4eJfx2psXc2GUX2WpB54wHdeY9Gftnmklv44HI6sP3vbgoLzGSiXOfDjLm9GULcBroiVfrQwrxEwGC3l3aosN+fyNhzYUfWTsJoTGwh/+bFVpk2X/yDOqeUsvplYrbeExOP0I8AvLl28RZ6duSq+EqScvDUMzpcXhgJoXPPMjINDOuKbNcdng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199021)(54906003)(6486002)(478600001)(7416002)(5660300002)(8936002)(8676002)(2906002)(36756003)(86362001)(31696002)(4326008)(38100700002)(6916009)(66476007)(66556008)(66946007)(41300700001)(316002)(53546011)(6506007)(26005)(186003)(2616005)(6512007)(966005)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czUrSGpWMlQxSkpVVDQ4ditjZFQzQjQwalBWTU54Z3lqMS9XWFlyNHNWWVhT?=
 =?utf-8?B?dnc0YVpTa3NuR1FHNUZtZnR1SmI0U2c5d0NUcUNoczFwajlYdHpSTGR4N1E5?=
 =?utf-8?B?UGptTG1BeFFiQnFTZHJjQS80YmhlOHJaOXBsTFZQdzA1L015NW1IQ2U3Qmkr?=
 =?utf-8?B?cTgzWmhlT2dQTkJnbVdySnJydDUweTBQai9Gc0ttQnRTWUpJQW80eE84NzQ1?=
 =?utf-8?B?NnJUaFZ2NjUzVzZqYTVpcU41SnhYTFUrU3Bibmp6SnBiQ0loQjQ0WUxmck5Y?=
 =?utf-8?B?bFl2ck1FMk5ZRXdqa2wrYndHUytjc1hUYnNQYms4endTMnBNb1VsdElXN3Zm?=
 =?utf-8?B?TzMrcndzUitrcUVoYitmS0Y4Sk9LbGlwc0ZXd3dkQnBhRjFUSGtvMS85T0J4?=
 =?utf-8?B?ckdBTnNRUkt1ZThKNDNiUkI3QnBsSWtueVV2RkpxTXZLdmFoYUNIK1JZTFMw?=
 =?utf-8?B?ZVNudk9GUklkdVpNekRPZXpWY1RVUy9UQlZ6SjFOSG11bjVGMzhhN0drMGNr?=
 =?utf-8?B?aU1oTCtPRGxYOThjUDV3MVZlMVY5eUFzcURIRmtqWFVWUUpNa3RXMDkyNEJJ?=
 =?utf-8?B?MzBHNlZUMkVZNFhLWDhjamR0bFRubmhudGdiWGlRU3JPeXk0aFZtNzNBOGVY?=
 =?utf-8?B?aHBMeEtkNzg5Z2pTcEprSG93aDY4SFByczg2M2hHOE84cjRQcEFXeGd2cUJF?=
 =?utf-8?B?SExndTU0cElaQU9aaTlXMWk3Z1RNZWZHdGxZRkVhUVpsRGhWaVhqTlZpZGRF?=
 =?utf-8?B?SDEyRkQwVTI3WUJjZ2k0MWYzbDJUblRuZmdBTmFLUXNGOEtIVFh0KzlyL29w?=
 =?utf-8?B?bE83eStkRDlseGFVd0ZVdE50Y2hoemJVVUdBTGd3V1Zwa3haaFRkWmpUODlh?=
 =?utf-8?B?TzNVU2FlVzZpZXVzdnE4c0hJTU10Y3JHeFJqTlNnOEdFenI5Vk5qaEhGQ1ht?=
 =?utf-8?B?OUlNTk1QS2Q2cGFSK3hFdXB5WHQ5TFNacVNKRHFyRGduVVpKeGRrRmswWjZm?=
 =?utf-8?B?K0dnWHd2bmJMVkRGZnE2dEtEWGE0UTBwcWZjbkVvYzJTdHF0Q2U2dGVZK2g2?=
 =?utf-8?B?S3djdWg2cVhvZmxoQlJKeHRRdU1OYmxrMkpaZEFYRWtteG1QSHJSNVBld2t6?=
 =?utf-8?B?VWEzeVlUUHdSaGU2bWFxZ3RRL1lTQlY3cnpqSHZ2d0xYSTk5bXQ2T0xGbFpu?=
 =?utf-8?B?MVI1WEhxUEJiMFFIbHJSdlRzQ0JmbmtxMmFndzEwdGg3TWcrUHBwZlhtQ0JU?=
 =?utf-8?B?eDVtSjZQVFNPblhvVHBLdVpGT3lRN2ptM3BISm5RMG8zSURXWCtrZDk2YmpJ?=
 =?utf-8?B?ZWJ0UExpRngydnhpRkxLaE5kb0xHeUp5a2FYNW4vZ1VQOVNCcGJOd1p1Z1RX?=
 =?utf-8?B?NjJIZ3JMZFBhS0cxR0VwbVpiOTlUQ2Y3eTcwN254VTJiNXE1Y0xJT0pTTzNp?=
 =?utf-8?B?VjlDZENMV0lmRjZOOTZXd0FTNHdRZjRVYVhHc1ZKZmovK0xIenNQaVNMZW9r?=
 =?utf-8?B?VlVUTVVueXZ6MVZqNFdtRFJNaWlzZ0I3cWUvcEVNeUFqVUdXMHA5YStma0tN?=
 =?utf-8?B?VUs2d0crei9nWHltMG12SldhZEh3QXN2NEp3bktzc08vRWt5Z0kxTjRpK1Yv?=
 =?utf-8?B?L2RMa1JFd2l2SHk2R2U5VGJUZ00zSUF6WGNma3hoV2ljNmQ1eitaT1VDOVNR?=
 =?utf-8?B?Y3YrLzFKNnpEVks0VkJ5ay9Qb2MrUllOTjJvR1VXODErdVZpUVBEMWg0L0xL?=
 =?utf-8?B?TFJjR2xNNnM1b3czaEcwUy80RzlacFBLb0lxbytYenVvRTdGZHBMMjNMMmNW?=
 =?utf-8?B?RjZuekMrRWJTRVRhWjBQVkZJN3lmZXAxQXJSNEtIWStjeHpQTG9aYnlHcC9S?=
 =?utf-8?B?K2t4YWFndEk3QU9YTkdQaFk5Zmd5N0VZN3hlZ2d0SGlzVU1TckJoZFBBVU8y?=
 =?utf-8?B?d09DbFpudkdpUFIyWkhuNzNjRmZmRXpVVTc2L1ZTVThkL25xcmN6b1hTTS9N?=
 =?utf-8?B?TUZSbWxvc2Q5cTJPZ2VzNUtJMlovNUphaHZnNWljQ2d1VE1tRjN4dnRKOUk5?=
 =?utf-8?B?UjZzcEFqalJFbTJMNVJNZVd1bThPdnlsbnlZeWJPK2t1RzVCaHB5SUlnQzhL?=
 =?utf-8?Q?NjWXp410rAsqOHSjnt0X2Gpwe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34dcfbc3-5316-4010-c9b6-08db8771fd34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:33:05.3105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noIur7BQOKLRcySYOPJ2QnFSJfItdZp/a+zn1y8u2hWof6qjlGWRpphzuBcN5acBmtDgS+B0T0d1DXhilE/9rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7737

On 17.07.2023 18:03, Alejandro Vallejo wrote:
> Currently there's a CONFIG_HAS_PDX Kconfig option, but it's impossible to
> disable it because the whole codebase performs unconditional
> compression/decompression operations on addresses. This has the
> unfortunate side effect that systems without a need for compression still
> have to pay the performance impact of juggling bits on every pfn<->pdx
> conversion (this requires reading several global variables). This series
> attempts to:
> 
>   * Leave the state of pdx and pdx compression documented
>   * Factor out compression so it _can_ be removed through Kconfig
>   * Make it so compression is disabled on x86 and enabled on both Aarch32
>     and Aarch64 by default.

I disagree with this choice of default for x86. To avoid surprising
downstreams, this should at best be a two-step process: Keep the
default as Y right now, and switch to N a couple of releases later.

But that's only the simple / mechanical side. Considering my earlier
effort to reduce / remove the involved overhead dynamically at
runtime (which you may or may not be aware of; see [2]), I view a
compile time choice as less desirable. At the very least I would
expect some justification towards this build time choice being
acceptable / reasonable despite the earlier effort towards greater
flexibility. Only such would be likely to have me merely defer to
other x86 maintainers, rather than outright objecting.

Jan

[2] https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01616.html

