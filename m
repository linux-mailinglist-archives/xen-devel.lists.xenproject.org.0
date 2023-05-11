Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7926FF52B
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 16:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533443.830124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7gB-0007Oe-82; Thu, 11 May 2023 14:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533443.830124; Thu, 11 May 2023 14:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px7gB-0007MD-4Z; Thu, 11 May 2023 14:54:03 +0000
Received: by outflank-mailman (input) for mailman id 533443;
 Thu, 11 May 2023 14:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1px7g9-0007M2-Pj
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 14:54:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a94d94bd-f00b-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 16:53:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7958.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 14:53:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 14:53:57 +0000
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
X-Inumbo-ID: a94d94bd-f00b-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNP08cvsY8UUKWk9PpCAYam+XAmQWDNIDrP4w9tAyLfnrCdgF9r7Wk3/f4PrCWeqQeHIZUPYGXFMsrsjTcgLHUAptOnq8Rw5wFq9975L85yEpP/ei8df5G9/LlPFpRrggqqGpEumZab3tgCRFve3c5HIhVBYn3rBM5ABnLe8VUmQ3EW/MH86GhWkaoiDm89KjZ0nDOOJpdaaYcq3WFqJWKPPhTEQGYFNdZsjmrIsdACw0SwR0I7cNNw/4aQNhPCquMZWcNfQTsdknSJwlU3DK1gfjSGHyrKE1XJ4mL8FMrkpo0FPBlDCjxMslbP83namIKFRuBwmmZgE8onWgLIjuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDyRx9KEvOcLTceN4UAuszxKCI14sK+kGj6KLWLhXFU=;
 b=oMt0cYTsiIZkKxK7U5/+ufV9E8hxo61ESHWYMXdhIiSiD2+aus9wEV/aLRq1srSBt+qHJVrOEw7idX+l8+7b7KL2BBfIsVxWS+p+jr1G8JZhqh46VAwvtmo/o/BPFI+OQr463oOZbKggRuRDkPy+PU2UvTDvMFZnNuXj1JCjFr6WT72DGG7nZaBnUZFuS5M8zEUBHU6YN3vJ6akaBQVb5vYfLc1SDbYc/Td6pLRRtHrwuQtvmM8nwXwx/+n0SvBUCvOJaNAkIevDX952J1qfDpt+LZM4jSkczrlCGyOGBtHRj7j06cos3eLj2TsoM7UdcFxW1xnZsKqbhoIO78bmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDyRx9KEvOcLTceN4UAuszxKCI14sK+kGj6KLWLhXFU=;
 b=A73hX4yvL/TcpY8GOUVUv/rCR64wRZ00HuN8beN/4MVsNB2IPCvkqfpm2M5B0o2Rhsd/cAw+WiGdpYqWoJImyCUmVttoAbQ2rtjs5GcO/HK36xr0LCuJsC7w7Qc6AN3R1vU0761fcQ0OPKM07xjp+zZ7hMfnvHuCqsnTf0ZI3fvceQcwVWqzTYJJRKJDjUmnBpCxnaEspFOaEJ2mly8S81azk+y+Lleo/T8dVXnFKKvfuYk+3hMFAKEXNnu0FmPgYKkJW2dP0orxz4BEaWRWmQNEkQagGrwm2u1ntuTsr4xTr9l33a5Rbn5KLkF7/+dyOCF0oi6bkcP1MwlEO4Qu2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5aedc6b9-2ef6-2c85-1949-b6cc333a7267@suse.com>
Date: Thu, 11 May 2023 16:53:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] iommu/amd-vi: fix assert comparing boolean to enum
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20230511145152.98328-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230511145152.98328-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: cba70c83-9b51-4e32-9cd6-08db522f8bf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9pJKihixDWYE4oldV5IPSPu1NZnwGonQgZ1U0pHRRZh1N7fbvrMz5VFkfA5AARK75Gm1HtMWcmCRia3nTGKjpHsTIb21Zm6130ZiL7d5Ha6BEZA20W+yKRJK6t0rP5h+vY4Jo6KenWdo6yr6upYfDb19j2JGUmWJ9AerIdlqYwM9/CQklvkVdOSSKqkbFgnTMhbSj4/YfHh4uL7hGHy+clhKRX1p5A3qxm4HYp/TGm90TBIQ9Rqn1F+ltMlrZS802Bhng4MTKXXrZclqsFnT0Ypjx9in755rySyXsjS9wiMKq9mt1mZfggTXK36tk44xBekcpepONetIUDfPEYmsLramUULVIIK4PpprlwzygkNDVqedFqSC/KkygHwseM/zb+h3WbDHghw56us4umdG5pQyE+tAV8GkpToC+hx4DXxQmxfn0XhJnYJ7IFr84zl4Uv3oeFZwosEU1k+aZE41OqHeUVDfXw+UCrPOyZrq4IkuRUlWIzhy3bE3ty0IGyVtx7hjoGhkyRv+0tj9SfzfjY1mY+nz+SrAyynp+yD6D/+OjdBI3NiuQDadxSDx029Zx61jSZb3gmlIYgCE/rqqveFys0wXo3YSs82w9KGA8dNheeIMq0EVhNhTxAwgfNsVqtuL5FB7M6akoNHb1AWZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(8676002)(2906002)(6486002)(186003)(53546011)(2616005)(66556008)(6916009)(4326008)(66946007)(4744005)(6512007)(41300700001)(66476007)(316002)(6666004)(6506007)(26005)(5660300002)(478600001)(8936002)(38100700002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amdEemdWVDhNS3RGcUx5aFJ3TmN2S3ZCWWErOXdBZFFmaVd4bmJRVWdiZytj?=
 =?utf-8?B?Y3RLR1lLcyt1VkVZRTlSK3gxN2JCZi9nWnJvTVVsS3NMYVJDRGZhL2JOeWVa?=
 =?utf-8?B?UTllWXU3ZGltRjdsSWd2a05BNFpFZEFhRFhnMkNzaEd4dzJUelZpVGErREtX?=
 =?utf-8?B?TmZudXJrZVBXR09hMm1NWnZ2djFQdTdia0VnYk45ck1TMmdpVjhyOU5sMEtK?=
 =?utf-8?B?cGh0MzNCZ1UzWWFiZ1F6NVIwSVpIOHBUcWY3QUZhMElPQ0pOOCtmcExXSlVp?=
 =?utf-8?B?aUc4bytpb2pqRFF5R1Vpak14WlVZUmpJQkw1Z0l3WTBvSmxWVmwxVThQTVdL?=
 =?utf-8?B?S1ZEYXlBRkRKZGVoeW5PNG0zVVJnUHNiVWtMYmk5TGJLQm1aWmRYaEdianlY?=
 =?utf-8?B?bmIyNzJ4aUJuRythM3hKRXlDSE1Vc2oyTVV1blduSHpDcUNZUXJtak56R0hR?=
 =?utf-8?B?WjFRdWVmKzI4RVk3eFhtVWhaOFYvZmE0c1FTUkQrUHd2dFhBbzNEc0NsYlRU?=
 =?utf-8?B?bUhibkZDTVJhcUxQRUFCZlh2TTFKbVpnUGhHUERtY044MUwwSWFHYTBEY1RB?=
 =?utf-8?B?azByQzk4MkQxZzZINWRaWWRJY3l2OG0waDlHYWxTL3JVd05Bb2wxZUN6Rkdn?=
 =?utf-8?B?TFg5aUdvbWhWZ3J5Qmg4Y2F4VFJGdU41elFuaTFWcnh3eW9vMFhRQll5c09J?=
 =?utf-8?B?OTlwUHdxOUdsa3o1M1krYmNJQlFQREt3WG1ZOUNZTEM5TFBRK0VTVmJZL0xz?=
 =?utf-8?B?NDBhRzJkdXhhU1hmUVRRV2hHbFJWMlZBRG1QUU1GRVZ4UVJlemRSL2Z3cG44?=
 =?utf-8?B?U3d5TzhwYTZEUG03TS9hMnpmSzFWcDRqMVNZUG5oREpKdVZGSXU3T2J4bjFa?=
 =?utf-8?B?VTFocVVHUEpHWWpvUzlvM3drYmZVWE1PRGhFbE5ZSGNta3VML2pRdUdEQmRy?=
 =?utf-8?B?d3pCSXZ3VXlWNzRzYldCNEFlSE83R01SUzBVa2VLWFA2UjhRN1VMNW5IYjNB?=
 =?utf-8?B?aWlRZXNNeTJ5U3p0aFpOSkEwMGdDSERSaXVhMFRLbzhSblptT2JUaGtwRHVX?=
 =?utf-8?B?Uk5SMVRwZTZVbTAvR1BuR1B2OGRTQkFjWlg1bkNIN1NYSWw3ZGJmTDY2UDd4?=
 =?utf-8?B?akdBaFBDY1hPVTJKcERVd0hCWUM1V0ozVHBkWVZwTWNmTG1XengxaWpubmNk?=
 =?utf-8?B?ajZ3TUdMVVdxWVZDTVJyNHI2WHpQU0NWY2g3ZzFDM0NqczNTS3l6TWVhMlMy?=
 =?utf-8?B?VlRBalJ3RVR0ZW0ybk9xZ04zUkx2eTU5MnlKUkJmS3BOTjNRazk3YksxanRJ?=
 =?utf-8?B?blFhUmVITkZJeU1tY1IrOVBGaDd5cnk3Q1FyY3FDZElOTTdwRFpKU3YzNFFE?=
 =?utf-8?B?bXdyeFNrQ2Rqb2lLTWozUTEzWjZpUk5WOUFZUUR2SnFyMWtkZ2ZaWDhGMXVS?=
 =?utf-8?B?em04a0JSOTVrbTY2TWw2bHVhU1hmS3FQRnh6MG50WmRITDB6T3hQZUtZbVB2?=
 =?utf-8?B?U1M2ZDFjR1JWR2FZRDgvUHV5d0J6MVNPQTlPVWQyS0RyOUt4ZEQrckRyZ1kw?=
 =?utf-8?B?K0ZyelNBRXl2YWkzWUI5ejkwUTRFZG1IMFNaRENsV0dtSjRyTHlGdC9mNkJC?=
 =?utf-8?B?cTg1LzZVYkdUNXlBd2dhSXN5MXg5SzIzaUx2WDc2M3U3ZnhNZjUrNmtVbW9W?=
 =?utf-8?B?VlUrR2Y4UHV4bFBHTkR4K050S2tYNm04RDcrZ2M5WEtiNjA0K0c5RHRSVlBl?=
 =?utf-8?B?Q0dpdVM2NkI2WmVmaVViOXV0UmFRN0h6c3h5elord0lxT2RDKytDNkdoQ0Mx?=
 =?utf-8?B?cFVaOUxkS1hES2NhcTFCejhGZTFBdjlNT2dTYzMvcml1WklzenJDYlkzdTNC?=
 =?utf-8?B?Q0plMlQza21iZktPcDcwVXZDM2kzc2ZQblZNbTFBaHNqU0UyMGZmdThua0N6?=
 =?utf-8?B?NHd5M0h2ZXlZS1NyTGlqK3lNejdtRDlHUnlzNGJybXdMNW1ONmFrRXIvOHZT?=
 =?utf-8?B?aWlrMDU5U1hFdElyZGJ0Z01sd0dZTm4ybENKdEw1UnN1YWhoakxXWWwrQ3Jk?=
 =?utf-8?B?MnlYQ3FUS3kwYU5OTHhqdStrbzdhbUJ6R004QThzYk1oWEFyNUNmNERwU2Fz?=
 =?utf-8?Q?nNhzBoqsdlcciiuUKRyNRcGuF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba70c83-9b51-4e32-9cd6-08db522f8bf8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 14:53:57.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtSWyIQvR4NYWILLoj6v7SRT9A71lZCpPx7Ki+1E17hKw3L0IESv+pvbvITI7/H0Iu4giFAW+Hp4B98lcUY0GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7958

On 11.05.2023 16:51, Roger Pau Monne wrote:
> Or else when iommu_intremap is set to iommu_intremap_full the assert
> triggers.
> 
> Fixes: 1ba66a870eba ('AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



