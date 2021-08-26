Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249633F8847
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173032.315730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJF37-0007wE-Sa; Thu, 26 Aug 2021 13:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173032.315730; Thu, 26 Aug 2021 13:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJF37-0007uM-OY; Thu, 26 Aug 2021 13:04:05 +0000
Received: by outflank-mailman (input) for mailman id 173032;
 Thu, 26 Aug 2021 13:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJF35-0007uD-UN
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:04:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15b92d42-066e-11ec-a9fd-12813bfff9fa;
 Thu, 26 Aug 2021 13:04:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-c2OzPJdIOHau6LELVn0HHQ-1; Thu, 26 Aug 2021 15:04:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6383.eurprd04.prod.outlook.com (2603:10a6:803:11b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 13:03:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 13:03:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.9 via Frontend Transport; Thu, 26 Aug 2021 13:03:58 +0000
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
X-Inumbo-ID: 15b92d42-066e-11ec-a9fd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629983042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GdIY/LI8aIgHDkkRCsjnncExst2s1X93xFAabas8RI0=;
	b=kuej0CcLyVnYaZKvRbhrrackzNB9X5+9gpjgla0ns+HaSXTocKtSfIt3HJBqjTADCxvaer
	sRBd97b+Tt9NEC0hXEAW4Li7vrOUz7EfUPmRJXFUesORQ7ybrLtrDp6ZjBQP4oAoFAiSHR
	dBoIGeF455G/cBWt233TxUGmQ9Py3Mk=
X-MC-Unique: c2OzPJdIOHau6LELVn0HHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqrI/Kbl9XmJ/BEKbamjtsFMyRKmsdjCltGDHWEs7sZhKpaW6uEbZGq+P+2Jeh823a+9gKiD/uCetKyFI+ZYKmGwZjYExLIOHFWBdWQ+6B3HBM7xOB6Ci7a5z9w/VRWgwGSDY7N2KviKPv7WPXyzadRjuijsy5Tu3JXqJZp7WKM5BzJd/3N7Xl5IJMqA4oaz86Rnhl3ijGpRe+69b5GG7EevN6asriV7/RBZjijtDx+PVJk+KGh8sEIW8qrMc4I9HtIIIzfqAI5zH1P/9VxapSlXeK0AXNO9cgMzypDQWmqlAcy34m/jejtCtF06xrc0CJFS23h9/7RP94nZEVrJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdIY/LI8aIgHDkkRCsjnncExst2s1X93xFAabas8RI0=;
 b=LXj/DT7U9RafOji2AWO4RKlOblMWV+WZ3ozMSTxNDfAP+qDg4s5/iP2GL3s3w1dQfFKB4kgmfwhl0W0y0rmEw1q2lZ3o63D7g+WRxjosu7/ixnf87eNTiI899GgK584LKpUq2xjR5tICItopmzXSy1PcEyrCUSYY9EzYrA6UkDsfzo2XGFRC1VSBexHWxUsj+48ufumGzPifkxWpixn9TZiVvIC9/+/GrpZS4GfrwiWNZpM4UG+ncie0+/WsrvJ5BanXX8k5m0xn8NWVwT3j3Hp3vXymTKhtLd22Ga+jOLl+V79xMxIRc24yscehGgmLFk43bNr1FzblGLLYv8Dc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/9] gnttab: drop GNTMAP_can_fail
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <761f3ea8-bfc9-4a8b-7878-2ff9e3047309@suse.com>
 <871a58f1-e978-6046-db37-037ec18dbb9d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fcf7ebc4-0f7f-0da8-b5ee-1578ea2c8806@suse.com>
Date: Thu, 26 Aug 2021 15:03:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <871a58f1-e978-6046-db37-037ec18dbb9d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1370a774-ca5a-481a-8148-08d96891f7fe
X-MS-TrafficTypeDiagnostic: VE1PR04MB6383:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6383323EF3B67930172277EEB3C79@VE1PR04MB6383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iZe+IHxlxV28BpE1JmxLWqqRUfvQ40XRYENaCADAaAGeGbZTnPoygyG3BZwyHdz+wtNiPMQZF/TsdiFIxEToBo6OHaS/ovHz9Ymgaao8wmB8CrU++8gKLukdVsNSknO6zQvE40MWiTAQdqRJ0pAgpo7mBsktONuaDFI1Z/Q//NGUTdALKyABmwhQ4RKMiCEeMOsDppYPL1KpEa23BBxuBKE6DagTM8ovhx3ZAq8yBI12s1t6P3czlzq2nns44Y3tbT3aVYyU2+zccG2Yn4SJjgNQ5uY6Txi5Cw4eclx2xBWey5fLrxZmoi7vIlKG2JlIdvZ/eFGSRzYoITddlwfogrn2Lkn7EoBj0CFW+hGZOPnKlKdPxYA7oBMRwmvL6k2k2/GSQ3cmpl/wsLLeIe/y+9qod1XL3m/rjrBqQ1pZNaClNns6ofH9ZpSZOQVnKwk19Tirwy8dybW2KoXv+tCMnGyaBT7HX4MZpReFWtFbzCfPOIOfcwbtwWbTimGPmo4ilDjzx/uUYxrdJZojqx1jAVuExRH1Q57Xpb3IQPXYv6utQEyhE6tGe7ot5txZPCgH3H9NiK5PJXo83nEKBK+69cP9L5yzs9RQn2bU1WhJu896Y6s77Zu2gopv2bgh6sqpVCYiVvqseuvCFwPNg8ivf1AnsxWF+8utQ0Gw/quUAwDiqW4wm2H+eZVrvC3YnW63Nj3iuoXCQZNGq2pMHS5DAnFz3Aw8Z4g4j/ltS0cLZ7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(346002)(376002)(366004)(2616005)(956004)(38100700002)(4326008)(83380400001)(8676002)(2906002)(54906003)(31686004)(186003)(66556008)(36756003)(16576012)(316002)(6916009)(5660300002)(66946007)(66476007)(26005)(6486002)(86362001)(478600001)(31696002)(8936002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTFIMTlFTjlQRE40cjg3dVQrbXF3SDQ1MFByNC8zVVljOGUwak11Qi9HSGht?=
 =?utf-8?B?djlwWjl3U1NNd0VnT0pwU2huNGUwV1dvdDZ5WjhqUmtncnFJaEtCa2NKdTNx?=
 =?utf-8?B?dmMvcE9EVE5lNWYzNWZ4REcwdVlyVkVzSkVpV1ZBUThsV3Bwd2x0YXF1UjNu?=
 =?utf-8?B?Mzlhbk45a1dwUXBVUkRlQ1JvNEtZQ1NtNnNZNVRjWStvYUpySEl3WEM1YzFZ?=
 =?utf-8?B?ZXBUNzNKNFRaS0s3MWFDUWc5bEdvNldsQTcwTnlkYjlZb0IwL2ptOUg4b0xj?=
 =?utf-8?B?aGFtYUdDaE1Hc2EzbThzSFV5WkJzQU42VzlETlhYS2hMNW5qTVR3SUViL1hQ?=
 =?utf-8?B?d3FRSHdHVGFqb3QxeUtwaUhXRGc5Z3I2UzhZc2dMRTNCODR6SVBPdktFLzFt?=
 =?utf-8?B?Z1RoZFd6RWdZZHFXc0lPUkcyQ0JrTmFJdzNhZ2xVT1RFNGREK0wxbHg0ejh2?=
 =?utf-8?B?YUdYejdKaVpKZExmY3dqVldWWHMrbTdSRmwvQ1ZDQ20wTTloS1JURXozMkNv?=
 =?utf-8?B?cDBBU1R4cGF0RUU0S3VqbGU1cnpTemxKdU0ya25idnVOWTc2a0pkU3VhaWFQ?=
 =?utf-8?B?WEdLZ0lYcXpGdld5b0p2ZDY0SmVmaFlGMURkT1JPY21tMHE5SDdkMTJzS0Fx?=
 =?utf-8?B?ZURlOU9tTitRb29WWWI0UnBiSzhBNkZqZG9kRlIzN2ZRVnBSS0dwaGM3L2Qw?=
 =?utf-8?B?dlVHWk5jMGhXUjY3Qjcra1Vnd1pwakVEc1FUemVGZnI2MEFlUk1KcW53bU1V?=
 =?utf-8?B?ZUxMcFNUN2RFOWtsQUNTbHZ4N3RHL3RZdjhXRENhZDhOZGlyOWJIRHNHME5P?=
 =?utf-8?B?aDc0QWJtdnZWZ1RHS2JLUG5DdjR0eDEyc3YwbC8wdGRudnp0ZGdyUklDT0py?=
 =?utf-8?B?NUZsMmVBMGZXNllrY1NWb1Uwcys0VStsZVBMNno4RFBYNkFKYUxoWVoyNEtJ?=
 =?utf-8?B?TktQa3BvRzFib0o4TjlOWWRRc0lRUFltak85K0xPMTJpRjl5OE04eFlvV3Vs?=
 =?utf-8?B?VWkyMFJrZ0F1T3NUL0hOWjRWNUJGN1VXdkp1Zm5IZHc0bDRMWVpXSytxMVRP?=
 =?utf-8?B?RGFza2N2U29JenhvSkhpZ3kzeXhvTDIxRm4xb3phVEdEM25ac2NwWGdhdFds?=
 =?utf-8?B?dlVpK3g5QVNwYjhEYkVPUEMzQ0MxdFUzVWY3RTBWcXVQQ29DTDNSU1pYRzJI?=
 =?utf-8?B?ZUlrUjU4eDd5RkdONDh0RlFFZ1NRT3dXdFlCdEYzUjIyUW5sdkxqNG9MTWFa?=
 =?utf-8?B?NmxjdG5iZHFaNVVpRitzNTB5SmdhYitvdExNR0tHRmI2TkRVb1piQkxTNDBG?=
 =?utf-8?B?b0dYczBqZGdZeVo4QUJjU1Z6bWxRd294VCt3L3l4cVBLZUNkUEQvOHBHT3VW?=
 =?utf-8?B?ZGN1WmdrL0x2OGhCL0hSb0JjVjhjZHdIeWk4WjdBVVduOVJmdE9XQW4raTNy?=
 =?utf-8?B?R0ZieTdLdXo4OXhLYlROQm00MW5OTHlsTlprWUcyQ3lnMUp6ZzEvUEdabTZp?=
 =?utf-8?B?VXoyNEMwUWc3bmFGY096RldOSHdhYlVMNUZORWNqanBjck4rV1hBaVRHaEtI?=
 =?utf-8?B?Rkk5YzNuVHQyM3lram1wYnJTa1Q1UFVTWGNlb3JNYUZOVzcwekRNT0N4S2U2?=
 =?utf-8?B?RGc5aEptRzBHbXBPL3ZBYSs3bWFDNW5IWFdtRFloQmNPUkNTRzBmTzBlaklo?=
 =?utf-8?B?UXBtT3g3ZGEvMW1mY1JaWCs2S0hnMWgvaXlaZFFnVFBFZ2NOMlEyeDV6M014?=
 =?utf-8?Q?fqnoS+Ht5ObpuBvfpSKrL6VPb8tw3AhAUC6Wsw/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1370a774-ca5a-481a-8148-08d96891f7fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:03:59.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpBw/bx0Am689pyIpiRaMyf8ytsaIFB3k7lpTzUBwsEF/Z9BNYrMMkHwwqPG+KXtwTjSj/2iRQKL6a5k+0Fr+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383

On 26.08.2021 13:45, Andrew Cooper wrote:
> On 26/08/2021 11:13, Jan Beulich wrote:
>> There's neither documentation of what this flag is supposed to mean, nor
>> any implementation. With this, don't even bother enclosing the #define-s
>> in a __XEN_INTERFACE_VERSION__ conditional, but drop them altogether.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> It was introduced in 4d45702cf0398 along with GNTST_eagain, and the
> commit message hints that it is for xen-paging
> 
> Furthermore, the first use of GNTST_eagain was in ecb35ecb79e0 for
> trying to map/copy a paged-out frame.
> 
> Therefore I think it is reasonable to conclude that there was a planned
> interaction between GNTMAP_can_fail and paging, which presumably would
> have been "don't pull this in from disk if it is paged out".

I suppose that's (far fetched?) guesswork.

> I think it is fine to drop, as no implementation has ever existed in
> Xen, but it would be helpful to have the history summarised in the
> commit message.

I've extended it to

"There's neither documentation of what this flag is supposed to mean, nor
 any implementation. Commit 4d45702cf0398 ("paging: Updates to public
 grant table header file") suggests there might have been plans to use it
 for interaction with mem-paging, but no such functionality has ever
 materialized. With this, don't even bother enclosing the #define-s in a
 __XEN_INTERFACE_VERSION__ conditional, but drop them altogether."

Jan


