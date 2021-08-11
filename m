Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F43F3E8EF8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165917.303099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlo9-00042z-U1; Wed, 11 Aug 2021 10:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165917.303099; Wed, 11 Aug 2021 10:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlo9-0003yw-QT; Wed, 11 Aug 2021 10:50:01 +0000
Received: by outflank-mailman (input) for mailman id 165917;
 Wed, 11 Aug 2021 10:50:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDlo8-0003y3-66
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:50:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deefa224-fa91-11eb-a056-12813bfff9fa;
 Wed, 11 Aug 2021 10:49:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-P-DZsbMuOFSaYHLEYWeEuA-1; Wed, 11 Aug 2021 12:49:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.20; Wed, 11 Aug
 2021 10:49:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 10:49:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:208:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:49:54 +0000
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
X-Inumbo-ID: deefa224-fa91-11eb-a056-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628678998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6wCmGxzzOHJR43xy+qjJa5sUS/Jj0WuwOZ94L6wVyI=;
	b=KWIuAtY7AjSNth98tmh75NYun7qlL4IYnQdT7Fy0i8zPKnJrrXweM2ZBOkrpK1y4wZyyOY
	FHf4cOd/Fn+l9TzQHrfP81ig1suljeDfH94lqtO8jE2dG5qfcdOfZhC21F3meQiLIBgwwM
	PYdlYU3L2ACkFuaNaBkLTCGZehpvCu0=
X-MC-Unique: P-DZsbMuOFSaYHLEYWeEuA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEMDLUT2MQdaW6xJmAXKwIFNsNOGTmkXBl8XFTsox16/pEa7Qnhm/1LWRWCTfbye+Gz9I88yYNfz2oTfTrgHRrt8X05N3bZmpFmnjsQLuUvPHnLMzEJ1Yb7hNRmnx+u65AjPEKgnOI/qXDsRywUsXjinzXvEDw+WRh1v8S8i0/Kx9/BaJPyWadFomflwO7d1WGuRr6Yy9MEZKdKWrw3TRZBDcf2K4hlZ9PulMNcGC2N6R38SChchMLgh+ZkyUJlzsrdjLVNmu8xoPjfXY0dponHjoX8PQBgS+Ve7okqpncQptOY9hk+MnQG5vWBPA6HUR4xygMG1V9Jr5nVcCwlB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6wCmGxzzOHJR43xy+qjJa5sUS/Jj0WuwOZ94L6wVyI=;
 b=lhDOEPJoj1nT2h0YCuyuYWsdlShB0x0kCJPX3b14W6Wu8C9C7TASHjA0Z76UrgkhG0S1VZ3/Prr5iN9HaNjrIKjuuOIUA1bHIO/ulhyKsr92BNZ5Qj3ZRxr1rRZgjHCVR8TtFzxYQhLJXfyqYTSgFDcg2f/XvBQ3KGZfdpsXo078MVxHyigThVKjAPnZKtGwi2fjHU1MpXmVzp5iEGY1QnUii42QfOY3nCAstTCqoFRnYFRF8NCi5wzA7ltU4/Led2efj/znZq7FjSenLCqATmLGQ1iM8lNysqMSHpNI4Y2cZ02h5txCEavQ2OSMEA0+d3Yb7LQhUPGh2NpEIaNKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [XEN RFC PATCH 01/40] tools: Fix -Werror=maybe-uninitialized for
 xlu_pci_parse_bdf
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-2-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6048717-a7ba-fe7d-76f0-58d4877492c4@suse.com>
Date: Wed, 11 Aug 2021 12:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210811102423.28908-2-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:208:122::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87b3ecf6-3a68-4ada-18c4-08d95cb5c0ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152A15E6802838FBF6A6222B3F89@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXv0yKw8zyZJXcSSvIsmZxgEAxda3Qgkf7I+dSX0yVh43V5kGyKIhXZXRaQE/rltJSd48hy+kTSw9hEvVvT/SEbUDICAgQfkghIJkzmrDN1pFGTthWZ9PhqK5oIRYJ+SUbsXqibQkiGeNbNeeC7Ivo2bT8umBaNMsyX6H5WI3c48zBHPSxc2YHYw7I2I3MOf/E9I1CPy/z8R91JX1zLjCReSCaqr1aQ72AcLhMRDCzfi73Kgd32xTHeVlHlTFuykT6VFFdabtR5RP60d+GZqFCA9LibsgiSIFXX2hKE9KOVjRXjZWGd7MWDntV3y+DOod7zBojscehHFYAKo2nRDD77YGgTiwDjlBkwRjgC8JslxUKGfbw3k6y1nXnzBhLv4YZqPvvxnwQ77zD96caTsd1o41d3pDiZhRqANg5oucYXDv7IeA98EmtxdoQjaUsWXZI3l8g/sy89DTdq9Eq2zMXEGJB7lFYzrx0gBTA+tpDYk+JbilVtbSv2Qju5Fs6K6OJRsuKf8TWP1gOP1LpOAQ3yOtXluvh8qj3NPVPrQQrSpKtDUb7q6e3qnxj7inURbVHeXCBcXr5x1J7DW/bT1AU1kHz5Z30EDhq0zVX1f+98CSV12hTog1wgBrKEQpJ36byywpKYjxRe88ACDIJdGJouufIToL/BhYmHBZnBpw7e0HYCc4WrXYvmUQnoHXy1Xi6WAkaJnHwGAFxVjBnXldW5ZNwCLJYWfkkEbHXsegBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(396003)(346002)(36756003)(6486002)(478600001)(38100700002)(66556008)(8936002)(8676002)(66946007)(66476007)(4326008)(31696002)(186003)(6916009)(5660300002)(2906002)(86362001)(2616005)(31686004)(956004)(26005)(16576012)(316002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRVTFRHNGJQSXZxbWlmbGNSS1FGdE1SUmRodllKbWRvTGpMN0FycWhUeHRs?=
 =?utf-8?B?Z2xjaGVxY05HOGkyM0xiSXVid0RyakNLY1diTnFzYmdLVnE5cnN5TkRBY0tp?=
 =?utf-8?B?emNYUUxOMEF5SkdXc0hmQjJLR1pCTEZzNXlaQ3AycDdqelFCQ0dnN0ZGckpY?=
 =?utf-8?B?L0EzTTFtSHVNcDBHcTJ6MXhNaXpFRjdPWjc5VERrY3Y5VXI0OWkrRE9CTGJp?=
 =?utf-8?B?OWxVQmI2Um9kN1loV3g0NlVOTFMreENSb1ZVU2gxdHoxbXdERFJCa2xPTUlr?=
 =?utf-8?B?d0wvM2RCbWZOL0Rjb3pPZzdlRG1KbG9kenRQWXZVZEZHeXQvdTB1WFUzRWR3?=
 =?utf-8?B?Yjh5OFl1TStYTHduc0NhaVoxNzEyakRNMzd0SmdJQkVsS0xyeUlRRU4rT0dG?=
 =?utf-8?B?S2VBdmZlck5JZjFPbjl5bHNKYTdwbnpIcWtDU1p1ZytuUENuWFlGenlYaHM1?=
 =?utf-8?B?eEhXUTU5RXFNYkozcEp4bU40WFd1Z25CeTNHNGRCbW5wRW14TzZnc1ZpOVA0?=
 =?utf-8?B?SExOTzVZY1IvNFZ1Z3lXK2pKRm5hbTdGcWpNLzUrYzV2ejBDYVRtbW9CRlRU?=
 =?utf-8?B?b3IwSExNcXNsbWdiY0JHR2JOYkoxUHBSQVdFYThvc1hXdTJ1Z3ovMncvaWFk?=
 =?utf-8?B?em9WM3kyQ1k0dVQwdFNDbERxL0Y2RnlDaWoyMG1YbnRCZ2V5ekxWc2pzd3lI?=
 =?utf-8?B?VFh6bjhFUHJyR214empVMTF6RnpHTDJTY3V5cGVUTUFuSFNPbHNvZGN6Wkh4?=
 =?utf-8?B?MlYrMEVVOEZvRitZaVJGNEtlRGZqY3B1QU9PWTI1dWFpbFdjRWd0ZVUyU2ov?=
 =?utf-8?B?MEttRU8wbzBUN3ZBVGhKQkRucTUzbHN4Y214V3Byb1NuYlhGSjZ2WXRYemd4?=
 =?utf-8?B?S0VCVUo0S2k0Q29PeXdENFQxdnhvZFB0eldtZGFQWSt2UG9RODY2c1RpZ05m?=
 =?utf-8?B?TXNGUjF0UWUrMlNHVklZa0pjcVhkWnp5NkdrbW5nNVdjaVFoV1lQTFVQbjgv?=
 =?utf-8?B?MmI5M2taa3pXM0oxL2p6c3NpRXd6aHBhRVc0KzZZMjd4VXNkcVlucExNL3du?=
 =?utf-8?B?YitZSThtWjJ6bmk3dmFxZVFub0lDWEtNR2pvRHZEVUVSV0VOOEpIOXBiMk9I?=
 =?utf-8?B?d1BaMll1Z2tqd1h1dDlUOGpQWG52ck9FcEFrdU1VY3ZBM2lzeE9RNHZZVFdX?=
 =?utf-8?B?M0VtK3JIaFAxVUd4M1pHZ0FNOXJPWVRpc1FPNjNicGp4Z1BMZ3NZYkJIWU1Q?=
 =?utf-8?B?V0puT3E5WFA3OWNPalhoNTlKd0NZMFNJYzM0RzFHVTRzUll2U1E1Z2kydjhj?=
 =?utf-8?B?WDY2V2M5S01BNnVQM1cyUm1ZN3BxVEFxQ3JUU3JQWmtNV2pYblpFaGcwUlQ5?=
 =?utf-8?B?VEVvS2NtM0VlZ3ozaDZObk00enllT0JpN29tRy9EcXpiRjZtTW1zTElaNERL?=
 =?utf-8?B?NUczaUdrSGN5U0xQL1BXcHhpR2tmYlEvRUltMjZVSUw3d3ZCN2JzVXNIcWdT?=
 =?utf-8?B?NWxsSVRUWGszenJaK2p3QkFOTElyVE9TaFByQnZzckU4TXRLWnMrcjEwMFY4?=
 =?utf-8?B?a2ZHbGF2VENqWU0xeERvU2JHeHMyOEVjaHRYejNmZmlISWRhVDdpYWYxenBG?=
 =?utf-8?B?SlZrT1dNTGhlcDZJaVBiTlBqWGRtWlZKUGpMZDRjbHc4dGhzSlVBMVhoTDFO?=
 =?utf-8?B?Snh3akhBSEdCSTRCd29aejhmNlNLYlNQcmNCKy90STEvZk95WTladDJjKzRm?=
 =?utf-8?Q?Pv2bptjbl/+AgCBcsa+1mmjqrVbLbnquPQBeAN9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b3ecf6-3a68-4ada-18c4-08d95cb5c0ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:49:54.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmmvI78/Xrq0UcJ1n31BJ3NkoC5M1Bb7sXU8LvUL9BpuFlyO5rePJBRqFMJ6s+pOih7cws8s5aXH8SBmpE+Ckg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 11.08.2021 12:23, Wei Chen wrote:
> | libxlu_pci.c: In function 'xlu_pci_parse_bdf':
> | libxlu_pci.c:32:18: error: 'func' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |    32 |     pcidev->func = func;
> |       |     ~~~~~~~~~~~~~^~~~~~

I'm afraid I can't spot such an assignment in the file (nor the two
similar ones further down). All I can see is 

    pci->domain = domain;
    pci->bus = bus;
    pci->dev = dev;
    pci->func = func;

> | libxlu_pci.c:51:29: note: 'func' was declared here
> |    51 |     unsigned dom, bus, dev, func, vslot = 0;
> |       |                             ^~~~
> | libxlu_pci.c:31:17: error: 'dev' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |    31 |     pcidev->dev = dev;
> |       |     ~~~~~~~~~~~~^~~~~
> | libxlu_pci.c:51:24: note: 'dev' was declared here
> |    51 |     unsigned dom, bus, dev, func, vslot = 0;
> |       |                        ^~~
> | libxlu_pci.c:30:17: error: 'bus' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |    30 |     pcidev->bus = bus;
> |       |     ~~~~~~~~~~~~^~~~~
> | libxlu_pci.c:51:19: note: 'bus' was declared here
> |    51 |     unsigned dom, bus, dev, func, vslot = 0;
> |       |                   ^~~
> | libxlu_pci.c:78:26: error: 'dom' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |    78 |                 if ( dom & ~0xff )
> |       |                      ~~~~^~~~~~~

I'm afraid I also can't spot a variable named "dom", nor a sufficiently
similar if(). May I ask what code base these were observed with? Is the
change needed at all anymore?

> --- a/tools/libs/util/libxlu_pci.c
> +++ b/tools/libs/util/libxlu_pci.c
> @@ -15,7 +15,7 @@ static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
>  {
>      const char *ptr = str;
>      unsigned int colons = 0;
> -    unsigned int domain, bus, dev, func;
> +    unsigned int domain = 0, bus = 0, dev = 0, func = 0;
>      int n;
>  
>      /* Count occurrences of ':' to detrmine presence/absence of the 'domain' */
> @@ -28,7 +28,6 @@ static int parse_bdf(libxl_device_pci *pci, const char *str, const char **endp)
>      ptr = str;
>      switch (colons) {
>      case 1:
> -        domain = 0;
>          if (sscanf(ptr, "%x:%x.%n", &bus, &dev, &n) != 2)
>              return ERROR_INVAL;
>          break;
> 

Also - which compiler did you encounter this with?

Finally please don't forget to Cc maintainers.

Jan


