Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55D6CD31E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516086.799640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQBk-0005GR-SC; Wed, 29 Mar 2023 07:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516086.799640; Wed, 29 Mar 2023 07:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQBk-0005DI-PD; Wed, 29 Mar 2023 07:25:44 +0000
Received: by outflank-mailman (input) for mailman id 516086;
 Wed, 29 Mar 2023 07:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phQBk-0005DA-2E
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:25:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93d40dc-ce02-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 09:25:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7871.eurprd04.prod.outlook.com (2603:10a6:102:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 07:25:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 07:25:39 +0000
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
X-Inumbo-ID: e93d40dc-ce02-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjttkJa2YOFuI9xAFrHzd8SERt3Tv+fsgNBZJ+gwgbqaug+URl82fECyzOuyIwvXW7abvpZkCMVWPh//xBoOzP7eS1YYMjvgMkiJu06LwEJf5d59yG9WbgoZVLuoipr1EcxjuTwGoIyP/WOJjSWtH+vFiM80wnOvmHkkDPr0/88z3HGtQuAvIdkGUuuewRKFbvRYIqphU+eVbJScEGJDVyzFHIoHABJuBhJ5TzDNvmmwQN30rFhTCEz3NZgZPKRTnxoDGu8G6nXEK8IWV04Uh3tmrozQeXyJIHxNd+HKHjTeI4rLnqrkuxYtOGPH1tNP/GzkT+EfWoNJYre2czP3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioLo9+0X+GQ5YQ1JVPore/ZKCbNiW29s/t3/+NymwGQ=;
 b=ct2gDBa73+CKnM5l6+D8RTkobqtwNsecasNNYVUQc2aGsAb7oq/NjwGjSq6oBMxEpKzcUy//EChKnZAfs3McR+8ptSIKso5jvDgMrB+6eUR/VRW7e/TVfpEL/lieLi1C4NjWOF24rbn2NZzkktUurHaTgbuInBOXzPOnhBDI75D6F4daI0T9v6y/+I5KWpUJzQTP8VOsef+GU81fuTruXtmHimlCjf7kP7GWvcYyG+mrPVqJfTrZSkz7t5Z4GSHFdkQ89WznD07cV3BmQvGsvj484CX25+KhSzWN6jnRZWN22B3tKawlMHZv6SHGttLkCcpkMfWnCEyKRRr2uIt6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioLo9+0X+GQ5YQ1JVPore/ZKCbNiW29s/t3/+NymwGQ=;
 b=PLY+h2SFtQetfJT3XRaXGs8H63QNht1sxtm+B3NdSjPTpxXnkaBMwooYXG1sDEEBlpBdnstpl7kW0QzGfeu1AuAnNgZYfZ6x8fqS9S3GFzPWAlsTWbUqwJsf/jLB2Dx5EJAGNi/uOb6jexoGJ5D/B0d+7kgkosRhHpe3Y4G+J/MtCuxlSrYigwWn7mjdxBK02dogg2EaekEwlcB9VVaOEj3+6RMxxlCQcEW1OoQyiPOQtugfTx7HOjjYDSf1gykOes0vGLzGDPMs+qEHXCFGcCd2Wr7HJGqXL1YAurwAhTVVvwC8mXWPgv56SBgVDXqFUxEwNLoHKdkvfkNFsIrbtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8227f9c8-6066-f495-a620-b52bb6080875@suse.com>
Date: Wed, 29 Mar 2023 09:25:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ns16550: correct name/value pair parsing for PCI
 port/bridge
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e96dec5-1575-3561-c61f-ee188c884b9a@suse.com>
 <72defa4a-3dfa-e113-2313-4b897c3dace2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <72defa4a-3dfa-e113-2313-4b897c3dace2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 719f3f05-62e2-4e4a-2196-08db3026cc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4NCRZ92xefOOHHm/vOVlbm2qwG4xsGIhPluVmg/oIgnSiq7dtkjFhK/gYxGwi3qEyoGcr0hC+Kjcp3GjplTM3G+Ska3La2wFhx2MA0aYVoDeiGNwzrKhmToxDJ7LPSZI4ZprGcrvGDp/0697IV5NMa13qjfqWDXBsjBYQqO5ZLPhW9sDfwMKQXwM4zHir2lpwDozoV0eGSvADUev1R0RKmzQmRXmCOH5/Djge6BNL0LDs/LuZeZL+fIvpox1v47eTB45wgfMpy9JDrVWtpnF0OZe+s9Rpxy5leG0s4EtySKoj6ATaF6/YntJJoaItLDfN7VM1pBVs9n3gm6XhIOAminWQi7Q1hMZBNHFH6dDJuTVLzNTne69PUo32iQOw/yhfe8XWLMq7kVlGyz5FJR/hv0Jhnjx+puPRItk21+u7/ChluDjv/cZlcJayggMiC7POr4Yq52JQr/etBN+y0ss0LjWWPr/ZDcUQxk/VOKWC7JQNRfnBR/bAQ2wxhuAXYzwyDuNbldaQRwL/LYbf4o97EudnkD2cfyZumbM/CYkS//I3h3s9aCEfq4PIjYT4JRGe27zvqshDqQjUm4+82kLTwU0OjW/cPGXGMiqbOkm/L0F0sf8KfOffbNDe+7/4TLEEcLE6+syQyDYQnceg/w9kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(6512007)(53546011)(26005)(6506007)(6486002)(6916009)(31686004)(316002)(54906003)(478600001)(186003)(66556008)(2616005)(66946007)(8676002)(66476007)(83380400001)(8936002)(41300700001)(5660300002)(4326008)(2906002)(4744005)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2dMMmw2a1ZDUXEyaDU3QWVkdUpER3FGbVk4RXpJdVFFcWw0QlpsVW5yblpx?=
 =?utf-8?B?VFBkOTdUZEdiZm8vVVdONnQwdkFVNFh3SzBxcDYxeXF5YWZ2TmlQWWUyZ2tU?=
 =?utf-8?B?VEJnQ0ZqYXhnN1RaZ1NRVUc3Y1Q5cThrOFMxUUxqZFpqNG9Fd2xCU0FiS3My?=
 =?utf-8?B?UGpjZ1ZTcjZid1Z6TVNqTGp2ekJqdTRPZ25oU1UxU2ZSNlBIUXpKR3c2V1Rk?=
 =?utf-8?B?Qk9nVG9tMDNublErUVZpUnU5TkQxN1UzdDZQK08wdzlVV0ZPbnVySUlqVnlH?=
 =?utf-8?B?UnlweUZNZ2xjTEMzcmI4bUJ5eTRScW5YSjk0Nlk3cmdOV0pyckZmdXlsSVlu?=
 =?utf-8?B?WTN2TEU3TTFXZzZKcFpxT0NFM2RENUZzQ3NqTklPTFV1NE52c3dZck5zTkNW?=
 =?utf-8?B?RkFCNnVHbUFUL0ZlWG9SS3BvZnYvOFUwdWlKd2x5S1A2Wjgyd2NQWkFXeVVx?=
 =?utf-8?B?YnRaNHlDOW5jTmNITXFzeVUxV01RcXprazlURnkyNTJIWnlPeXNOcmJKL0Jw?=
 =?utf-8?B?c2J3ekxTMVEvM05lVkF2R1BtS0xzd0N6ekdqQ0d5bE16TUhmRUx3Vno4emJP?=
 =?utf-8?B?ZFQxSER0R3QvUGNURCtjbmF3OHpJVk5aVlpNbittVnJneERqT0xPNmU5a0hz?=
 =?utf-8?B?UGE5WTI0aWNaNVAwOXE2OHpCdytoOTNuQ0wzMWlka3dyRWJ6LzdNRXpzSnlW?=
 =?utf-8?B?bGJweDRtbldTTCtoTE5KRDFUeS9icmJLcU95ZW8vRmhZdk01OHBZOGJYY0pL?=
 =?utf-8?B?cWFuVWlkQllwUFI0YWhDcEZTWERuTzdEV3lmRXVoTDNLVHNhVDZpSnR6eFJp?=
 =?utf-8?B?cm84Ky8ycFVTNlAvR1ZRMzhWVXlMMXZsNTVwendMVDFqWHcyZEdJdkZzZSsz?=
 =?utf-8?B?YU16VkgwbnkwZVRudTUxYnIxSFovbXJ3eEdiZFc5MWEvRGZwMlZ5MHRyeTlV?=
 =?utf-8?B?ME5NbUQ0bXhucTRhWlIrQjhjVW1RQmVFcmJFaFJQRWFiUm4xT0Z0WldkMm5H?=
 =?utf-8?B?bERPZS9JcWpYQWJXb2pqeVc2UDIwQkdOUm80enAveFlQekE2SVhFL2pZandK?=
 =?utf-8?B?Q1lxdGhXM05aYWo5TDFEdnFJcXFLTG1IRy9zamdaNldjK1FRZEorR3hoU3Ba?=
 =?utf-8?B?cStoOGMwVzdubjFpTGNIeDN0dTZ3eHlyNUVHYlRPVWJmN25kM1FybGJid004?=
 =?utf-8?B?WVdkN2lJOU5LSXZJaHVYOXlaaTdqUERjYVNhY2VIMW1mbklBVWU4QUR6VmNt?=
 =?utf-8?B?Wi9TV0tpNGs4YVpKTndWNEVOTXd4STUxa2tTdHI5Nzl6Y1g3NDViaW0yVEMx?=
 =?utf-8?B?WVVsZHo4bUZVSFR4eGtaT0NpWUt1dDFjU2tVcjYxSzI5WERnRER6eHlwUVBV?=
 =?utf-8?B?eGtUa1NvL1AyWk9jUUVpUUo3dVBIVDJNRHRSZXhNMmZ0bDM3YVEvOGMvSmFi?=
 =?utf-8?B?YzZKMkM2TDkyUWhiUGRvNERTWUlWOFg3dEU2bE9qN25mc2UxM0lLSlNtc1E3?=
 =?utf-8?B?SmlyOXROUjZqUWcvaUtma0xTY3JlVU5WVEdkTTZqdjR2OXNNVnRYVVhNTldZ?=
 =?utf-8?B?VHZ3WjNlZVRKc1FhT0NPZ0IyWFRkTk5uK0I0WUgvbE5penFxemVoblJ6QS9m?=
 =?utf-8?B?dmVzRDUrWkkwbDZBblJkNWNFUWo2THIvdkZIV0gxd3hXek1JRE5FTlRXWDh0?=
 =?utf-8?B?M0EzZHJ0N3c5K00vaVBBQUZwOGJvMGlteVV4cVJUWFN6WXBGY240TXhCYVBU?=
 =?utf-8?B?M0g3bnVYMWhCRE1Jc2FGUGRWZnIybjhUQkJmZTZpSnJpeFp5Z1NkOEg5M0dz?=
 =?utf-8?B?Wks1ZVczalNBYnNrd3NQUEl3b0FMWElYMXZ1SUowNGx4QkovTld4UzhyTXk0?=
 =?utf-8?B?RGhzNmc4WUdBZzJkaU5uTmFXQXVLM1BLVUs4MDd2OEovaHMvR2V6RmdXeFpW?=
 =?utf-8?B?aGlCdWFjRDhhZ0xRYkk3b2F5WG9yZ2w1ODZqSU92c2dmTHlUWEVCVkV5dmNU?=
 =?utf-8?B?YlNBcnJZdzhmLzZVZlF3am44Y3hqeTc5ekdXTFpmeDRRUWtOMnUza3E2blR5?=
 =?utf-8?B?d1AyYklTMFk4cFdDUXd4VWRlYlFTUjJuOGR0NUFvUG5wdmFpMGhtNE1hVjRn?=
 =?utf-8?Q?ZRH4GmjRrD7+Nu07F36zMrQnx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719f3f05-62e2-4e4a-2196-08db3026cc32
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:25:39.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Radb5FapmvMi7wu1rBe/6CM3Dc3j1jYdpohj95RbZVtlHQjVPBT5CFk6iZ4pRSKWv9p5UjNYG3C7gb6b9K79kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7871

On 29.03.2023 09:19, Andrew Cooper wrote:
> On 29/03/2023 7:50 am, Jan Beulich wrote:
>> First of all these were inverted: "bridge=" caused the port coordinates
>> to be established, while "port=" controlled the bridge coordinates. And
>> then the error messages being identical also wasn't helpful. While
>> correcting this also move both case blocks close together.
>>
>> Fixes: 97fd49a7e074 ("ns16550: add support for UART parameters to be specifed with name-value pairs")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citirx.com>

Thanks; I'll assume you don't mind if I correct the domain name spelling
while applying the tag.

Jan

