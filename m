Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F69712063
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 08:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539971.841359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RCH-0006bv-G6; Fri, 26 May 2023 06:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539971.841359; Fri, 26 May 2023 06:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2RCH-0006Yq-Cs; Fri, 26 May 2023 06:45:09 +0000
Received: by outflank-mailman (input) for mailman id 539971;
 Fri, 26 May 2023 06:45:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2RCF-0006Yk-Nl
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 06:45:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98bf52d-fb90-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 08:45:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 06:45:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 06:45:03 +0000
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
X-Inumbo-ID: d98bf52d-fb90-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8bKQCDHSqG25La4LCF1AKrZP77iAC1h5VZbY0/J5Ei29Xt6fUUCjhGlJjY03MNOYNLTxUmF454BxAWgS5//KKGqcDqEAKXfRcVkq+p9P0u4D7/rozuQ8qsUF1hO/e0Dc//3gQoO1EPioJ3u5xPyNnEZEINdDpt/fNgwfLLVbOKIcvcjjdVRirtcW9K12rRfc9NzRWClA2fKlmAw41jR0JyUiqIg2UYc2J8S9hOmmJo+nu3jGLwXfRvB0oCiSmR2SheGTOa00eu4sNCy/9wK7pkoYZCWSiKjTDzHVinSBk363mBgmCZoC4WWpR9ozN2LB+5qDh0Dd0G0LgJiaqDGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J23g29un1LOhO77WgR3rIOzyGYtTUUL25Pkp0eBhcyw=;
 b=MmQ5d2vQqlQ4dtYOAk4xn5IeyKUGe9wsPh3dZvBS8o6kCUJMhYIEBhR4dSgKteL37bZLHtcPZNUkoVVqGAUeWYMHfAg3JhOVz3VNUXY7YxWEXIqMu+ipVwimiLNwgm22T3+sHMqkoJnjjSZDW7qJemDabzLd0cUGx0cmLLPiq+nB8rZJnO4o85fBIpRPQ0492JWHrP4jh59IYV5qlM+yC2NgArLmPNnBMddkwpkQKlXfLOg3kdp4LOTIaH6HXShl2EoWAGxXgiYdEWV2w7iPIQO04m4/BVtuIByCK9UN6fnbdREAJRHPRxwwv/RebqudlqSrX7JK9jgUOgQzJWAZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J23g29un1LOhO77WgR3rIOzyGYtTUUL25Pkp0eBhcyw=;
 b=ASKo6+dJdl1r4UK6pImdlTLsvQd7ghk1CdDSu9ywSSd12W4hy987tl5ExkNX8QSp5mmz4TGjKqpB+gjQIFxVJT7uzP9emfUD+/fx8+UkwR1YK7g6rUkOJXR3t3vIlXAs4lPvZTQ72MLgLTyHvNK6P91JY/jlJIGaZcoAxbNlt13K9OeOX/kDbK9mgHe+8R0Ce17QqvtFwW0iAuzG/yLq7D+lp5Q6h5Gs10QFLXCoF3SRDPZekYJJmj5TLrgZN+SfJ6uN7uQCywPbYi/efzjLIYMvsywu2E+Nztcu2SpK1Zx/A4yQXJP9e8Frogxp/UQ2n3VteMlVed6JfAe6oeYiuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03127618-13a2-872e-82e9-b23ce8095f70@suse.com>
Date: Fri, 26 May 2023 08:45:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
 <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2305251226000.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305251226000.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1164e7dd-3157-4c54-596c-08db5db4bbda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aHRmfQW5A1LHVZwIReh2Vxo6/BqIUYN8Zx2/RvZFBUoENztIr6nRkyzCLGQSlPXZdzUWq2psKB0/PbNRVSUhYYVbNTE+buBpP4hA3RT2IimDhRoPUoOg1Pq/uqvqGLNeUAA7Bt759TPrSvp2ZfWBZI5IkNGgJSoBDCuisMQTuEh5TURl5pF6083YEyVkpKXiLzhsMMSZxDQx4FBZHHeQdqdBNlVHShH32fdiAGA3vS/wduyCyDNSttBwB53Wb1ioCrzj4/4H3raVfR66Dubf/qZ/tRcx73A+LxbE6d4ClTABucMFJ56et5AMxUwYUG763OJYGiueZSgt0Qt2YkwcP+k/6ZZ5fuQuqCKP4BLDyLHsPcime0pMLzMCP3qhj/y4bBMm6gwwBcdzoFx2ZRRCPlfxixP3cSjwdmkkMTcvmyj6KS5r2n3bXSDq+z+PLroKl1LemhaQ9Phku9a5v7qqUYnWSMxksZ/6GG1mkXYhWB7urp0fl+p3UZP1zlCyqlelAB60OclsGKjLerS5MkQ/ETMz6pnRlIj4oweyNvuLi9di9oVisSae+5WwSwi5xcLJgZLwhkXUeeXGXoZ1EfMJuR1xnt+2sQiFHlQu1Vywn/J28QtB1nBdKAAxa9vrYhBUoj8aTJgyW8J0Mi5VLwbU3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(5660300002)(31686004)(54906003)(478600001)(8676002)(41300700001)(6486002)(66946007)(66899021)(6506007)(6512007)(66556008)(6916009)(66476007)(316002)(4326008)(26005)(53546011)(8936002)(186003)(2616005)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajFOa0NNR0pnSDhsNWU4SGZWaWJRSUNHKzJubGl2TXlyQnhrT1F6eURLUlYw?=
 =?utf-8?B?ZFFCajZuTjNsZTB6MlNUS0lTK0hwZEFoTThNSGhPQkdvelB6MzVlU2ZvbzlT?=
 =?utf-8?B?cDhucXVWcjZsZVRscHhEQ2F0VjduOTAzRXZMUndrUEVHY1hRZHIyd2FNZnBL?=
 =?utf-8?B?MThzSEgrcVFBQ0k2cTZ6Y0NML1VmcjRWdGJiMWtNTjFjTFd5VmRWc2hrQTlk?=
 =?utf-8?B?bFMzcEtjL2dIdGFWZEhydXFRVThKUWtna2ptQU5oOWMvL0haZHM4NDIwZGxi?=
 =?utf-8?B?THNQUHVtSjFSa3F0Sm81WlpXM1pzUWVSeFVFUUpPUzRDcTI5NlozY1hYckNX?=
 =?utf-8?B?NFdRT2l1N0Z2dHRwNEJHTjF6M25udzNQSjVJNnlHTEI3aHh0K0lEOFNPdVlO?=
 =?utf-8?B?RkxpaEhPSDBZRGg1RjFnSFZZblFtWjAxMDN6T29EbmFwYzZJZjhVZzBqeW9X?=
 =?utf-8?B?bjJBWjNtZ3hwQjJ6MGcxb2diMjlNWEZuNkUwbWw3YjcxWDJlbFl6aWVRT1dC?=
 =?utf-8?B?Ykp2d0pnUHJOME1Fc0s4NWR3QVpmczZLdC9mbStYWDM4Q2QzT0FwMENnenlF?=
 =?utf-8?B?QUViVWdJZHBwK1IrU3drY0xPZlJNTGtwdTg1U2Rmdk5GOXFrWjJHUkZReVBK?=
 =?utf-8?B?elNjQTM1WklLeXl4WHNpRjFaYVR6YmpZQUE1SHJYTlRXUmI4RkcwaWNrUXdE?=
 =?utf-8?B?clhxbVFDalIwYTFnWjdNakhRMGRJMTY3Q1l1S2dFa296REVkYWovSjNqUi9x?=
 =?utf-8?B?OG5nNGFFRGlwS1R5dXB1NURNaW5PTUthUUkvb0E4S05kT3dKTndUZ05jN0FE?=
 =?utf-8?B?STZMVlhwZW5tSWYvR096dzZLS0cwWUxBbjd1VWJ2dnBXakNTZUNKcklQbkR2?=
 =?utf-8?B?ZTh6Rm5Xd1l0VzcvVmhWcTZ2Tk9CYzRmVWQyY1JjL2M0ZHRLczZTM3hQRlVF?=
 =?utf-8?B?Ukd0VENpNjFyUmJidURLZFNETXFPKy9sd3RqMFFTZnA3WmhXNC9tVEtjeEJk?=
 =?utf-8?B?bkVWb2lkMTZrRnF2UmRtYkMwbG5INGUvZW1YWXUrVTA5VkhGbU5RaERNNEpW?=
 =?utf-8?B?eThOQllkYmpTZkxoNnBha2twRHIvWjV1QWlhMDJYM2I0Ykh4ZmdtVGsvTXJJ?=
 =?utf-8?B?aHhPZnJMcTUrb3hwOHNsMXU5NS9xd1ZWajdvMTR4ZWJyRXdqb3pSdkFrbXdY?=
 =?utf-8?B?N0ErWHBFVG40VEJZeEc1YTlKZGtSeHlsTjBJcjBuRkFOeXJ5c0U4dTRxMlRY?=
 =?utf-8?B?UGJwQ1VUZXpVeGNuWTNOK1hlN1U1ZnJ6UDRLVGpYNHJjcERHbmRYRy8zTndF?=
 =?utf-8?B?ckVuV2kvR1BrOFVDWFBBMjNtU1ExcjRZZlBiVmYwZWJ4ZTJZM3VQZ3hGTlFv?=
 =?utf-8?B?eFE1ekR1UnVOaDN5NXE0WWtBWWNkODh5UU81TG5EektnK05NR0o2VmZiYVps?=
 =?utf-8?B?UXR3emo3cG1UZEVMVFN5VTVoU2pSRFRzL3laTlBraERRRzRqR1hIazZFdGZp?=
 =?utf-8?B?N0w4MllOWXREZGNDK1RmTDZGOE01UitEdndIQVZYaC9XdDQra1ZtNzcwMC9O?=
 =?utf-8?B?RTYrR3Q4OGZnRWVyRGxkYXlHREZtTk5FUDFLMHRTRVhYMXdDaEhGZHVKYzhP?=
 =?utf-8?B?VXEyck1QMDZmamExVXk1cllMQmI0S0c4OU5HRitocVlFYmlBWVF5K0gwWWo4?=
 =?utf-8?B?ck4wYk0zOEJVVG8vN1c2LzZpc29hcXBIMXFlcDVWZzZpZkJRaUh6SFZDcFIy?=
 =?utf-8?B?Y2sxZisvRWxad0c0S0J1TGZQTkk4S09rWityYmlVemFxMWpoK1ljRWptWUI1?=
 =?utf-8?B?UG9aOGN4NzJzalYzbUhSVytIZ0YwUWc2Ni9hMHJYTFhxN2RJVXZJams0QnhT?=
 =?utf-8?B?VWxhamhFYTZkWFY0WXNhRk1TZXJzVUVJNWQzV2ZLaWh3dGVlZGRCRWhKM0Fm?=
 =?utf-8?B?REZna082ajBNU1h4SkY1bm9aRFhveUtxNURscm9Zc0tFclNIczRTc2NkaGJN?=
 =?utf-8?B?bU5KT25LNUhxQ0hkMDBvaU94N0ZiN3BjR2xYRDVlZVhxWm9vN3psMExPZjZi?=
 =?utf-8?B?ZHp5SDVkbCtjd3k5NU9sZlJzZmRWZUVYMEpPbUw2MFN2SlRiQmRSYWc0bW5x?=
 =?utf-8?Q?KFgnYzljxUqLMQWhlJj2DsZmB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1164e7dd-3157-4c54-596c-08db5db4bbda
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 06:45:03.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgPwtS//wNFZMlaNU9Ydvszg1vwlUMYeqbTXRTVhL1beC+NIwqD5L11wI/vhOCHspvmLdwbDtknumsXjEfg4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

On 25.05.2023 21:32, Stefano Stabellini wrote:
> Like I wrote, personally I am happy with whatever gets us to have the PVH
> test in gitlab-ci faster.
> 
> However, on the specific problem of PCI devices used by Xen and how to
> deal with them for Dom0 PVH, I think they should be completely hidden.
> Hidden in the sense that they don't appear on the Dom0 PCI bus. If the
> hidden device is a function of a multi-function PCI device, then the
> entire multi-function PCI device should be hidden.
> 
> I don't think this case is very important because devices used by Xen
> are timers, IOMMUs, UARTs,

... USB debug ports (EHCI, XHCI), ...

> all devices that typically are not multi-function,

except for the ones added. Furthermore see video_endboot() for a case
of also hiding the VGA device, which isn't unlikely to have secondary
functions (sound controllers are not uncommon). Hence ...

> so it is OK to be extra careful and remove the entire
> device from Dom0 in the odd case that the device is both multi-function
> and only partially used by Xen. This is what I would do for Xen on ARM
> too.

... at best I would see this as a non-default mode of operation. Of
course we could also play more funny games with vPCI, like surfacing
a "stub" device in place of a hidden one, so the other functions can
still be found.

Jan

