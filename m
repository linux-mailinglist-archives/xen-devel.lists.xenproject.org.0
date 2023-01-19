Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCE6734BD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 10:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480902.745520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRW2-00049K-HT; Thu, 19 Jan 2023 09:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480902.745520; Thu, 19 Jan 2023 09:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIRW2-00046f-Df; Thu, 19 Jan 2023 09:47:26 +0000
Received: by outflank-mailman (input) for mailman id 480902;
 Thu, 19 Jan 2023 09:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIRW0-00046X-Sl
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 09:47:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45c21b3a-97de-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 10:47:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 09:47:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 09:47:21 +0000
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
X-Inumbo-ID: 45c21b3a-97de-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJS5eeu5pEswiZbuP1beeikY73iOwPP25USDKZU5++DxPrxEGtkKj2Nw+zYeQsFHziyHBJdwQhwmuZLOsyBUokwihr/Q6LiPdkUWUhPcL3ZXTmkMY0lmxQ/IVrXAgLa38v2Jr1roJ4sz82faysV0j59Gr+sAw2enUsDisF8LsT7d5UZvZ0ovsfdILKbX0s7YtcUZHO3AuE2EjJPUFf0oP9DoGMaBxFzJer9x4tScfhZo2UuYsqluV9ZeGa6UzbOKr25+Tztzw2sJ0R7F1V+nYRCnTuf3Ofml0fGqsfIUftmnshkz7y02Bc7yuF/Kh9ejlOn79cWGyQvL6gS2FiQQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StbcwKNzIXnWXnkbS0ZasGDA2Bx/FiHBhcOFCg53lfY=;
 b=jAYUCFs6+OYY2M9jMfRo8ftCzZZO0N6rLSl3IUldMYTcW5K99JnAZAAti6pXCiirV8bfSL+PcI9x1z4rDiGDjND7jkmg7YPkpTohFpzHPMCzewJNjofp24cHM3RPL3xP5H1MHfwSASNh12jT7z1DnOTsMsDWYVE3MHs8htkryqOcwMHGQxW5NFIfMfASL64nog9aA7EtFlh83hoefuL8bACF06EuUpakJ9ugB/wAAurhir13GeGt9sHMNxOyDu6k+nZMfTFLT2oGQKR7ZkjBoAefF5O1Zg61COrzuY+2FWf5CntTUDaVvz11rxJGsDcergdMyfB8HHb8lM9B9M64KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StbcwKNzIXnWXnkbS0ZasGDA2Bx/FiHBhcOFCg53lfY=;
 b=a+iw+6kxUaCRbdveZzSqOznExR/4seFaQXfxRkSTVBkaz2E233jbp73esu2H7ctAxC6r63po50V4jQ21QwVokp2CSUIDRJW7/G3oiJ4SaFld6QL+I6JPFHJ1C1bD5MBzjTdMwfHwfBSHMJXda10deH/T03WZRh42FSOy1a6nKODkm3ntJJ1OQeeB68f97csbq1+GWi97QkbVGAbVrpoZgFRNAe8PDvvdhXV9y64xilrt9VK7TliClpE26Iw9CC1scQ6QkNHHBERSRGXONF7W4uwxK/YKYMk4fHWaFVH5NLEsf8sxOkt0w+WxM36oe+In5Ca5sZ24eqYIquQUGu3vsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcd0ed06-8f14-b085-b5a4-911d3b859ef9@suse.com>
Date: Thu, 19 Jan 2023 10:47:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 00/10] Rework PCI locking
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <9a98a83a-32e5-67fe-431d-7bc5f070674e@suse.com>
 <64359f65-4a99-f9ef-b35d-49b44670c7e6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64359f65-4a99-f9ef-b35d-49b44670c7e6@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e9475b-3850-43f1-07da-08dafa022902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aESjZySuPmzHnU/8IjMk+yijx/QvPdce9ev1NDUE9FljRzYG23xNzjbxOjSZMrniIajE6k3vO4qSrdxMURe7PWZrKAFu2Wj+wk1OXO366kybi4GwuhqW74fe7PFDUYXQ3V88h0RpS+E8TwhfN4A6L5WRzl2xbH7lndCQIi08l3pi3sFT9EH8Mw/pi1mIVN9OzoM+3pjsjMF1co8dL+yL+vz8HlUxyNLGf4KxoHPTbAr9tFhgIu+5zDJmyg85as9JrbuMFafFxInsKkEzOxOpHoI64zkrRFkSuTYhLhqnaf6fF9GWdkKfXglt1bO3J1Oo//6tn5LIdt4aJkdPBvi/d/6KlHPlgKbJGKXACOV4GexQiKRLETpeo+hApSqt2xAkyVqd67Hi6DcrbaekOWD38KBT+Ocg+8UQANDJQY7FEfX8BdGyHLWQ+Noz6c4S2MRXXaRuZ9jTHHH52zafL7X02aBl8XstNkm8Fq+B9pUkVKWibB1x66D1pvWhEIzpy9+98syJBLmQp3fI6cWh9uWuCnUiviZ4gqklP+39oBP4RNuo3zrxcuvq1StrPs1ivOWcPR1wBnDWVBYWaOeeN/TCf4a5trk3dcLNGJQPgTITf0tXcGSucfqTdjtagAygbDoxeH4i40sCilvGAxbBbgXyG5ITfa//hYtZC5tDJ2ZiDksa60NNpVZNbamgHXsjFawT8aP3iy/db+J0C1ugS5LG/R/c1x37cvbj+k/oV1qkV9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(316002)(38100700002)(31696002)(86362001)(36756003)(8936002)(5660300002)(7416002)(66946007)(6486002)(66556008)(4326008)(83380400001)(66476007)(186003)(41300700001)(31686004)(26005)(2906002)(2616005)(478600001)(8676002)(6916009)(53546011)(6506007)(6512007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2I3M211Tkt3L1JUbFo0bXJUQytIdmFmSmVFQzNMZWd5YlhJek8wNHdyeUpr?=
 =?utf-8?B?SzYybjF5L29yelVibURVNGdTY2czQ1V1U2VrNmFzTDJmeUJUYitiYVZjcTV3?=
 =?utf-8?B?Z29EU0ZISW5id08wckFWVWRaL2VMZWZjRzBxU25ySEZUNVBSekUyZUU2bGlC?=
 =?utf-8?B?ZFRJVms4RS8yZ1h0eUlkY2F0K2F3N3M0QWQ4K1g2dnZKS2VieXpsVkppblhX?=
 =?utf-8?B?VElaQTc5L29ZZWM5MEd0NHkyYWdhR3ozUXNKWDZqRGJTVlVYU1lTK2RsQ3VI?=
 =?utf-8?B?UzR2TjlpcTB0d3VwcDhVL2htT1VaU0tIeUVVWms5SXZLRU1uaW1GdUJQMFhN?=
 =?utf-8?B?MWNuUkhqcTUvMG0xV0hWNTVib0FPcjFmeDlkSU9tYkt4VXo4MkNNWk9mVG81?=
 =?utf-8?B?cFZJVmMwR3RiOTZPSThMM2pid0x1aHZZUDl1RFJCYlhkY3ZpWitGdVBjM0Nw?=
 =?utf-8?B?NTVucmozdFZKUmlwaGVtZHFXakd6RzRFRWxpNUFKekh6anJvQ0pNOEFCR1l0?=
 =?utf-8?B?UnlGYlg0dmgvZDFZdjY4RUhVeEppR1ljZHpTNU5FNENDVjFPMnFzNnl5OU50?=
 =?utf-8?B?Z3VVWjIvUlYrWGtDNnZYUTZuSGxsSkk4WGM2dCtYM2tJRHBaeGsxaHpVaDUx?=
 =?utf-8?B?UDhlMUpQaFZHOFg0RXFUK2ZxWkRDTWZFSmQ3YXZWMnI1OHpVd3pQTWpkY3JG?=
 =?utf-8?B?eCtjOTRvMGNoWFhGYzlrMEdLWVFJa0ZIZC9JNVFyaGlNYlU0eVQwRjBaOERT?=
 =?utf-8?B?WE11NVFtZFZ2eHhzQjZsSnRLcGlDRklrR0JHcU5uVklLVWhkdERCcWh1eG9V?=
 =?utf-8?B?TDVsN3dxaHZ1Y2VId0JUalM0ZUw1ajlXaU5QUnNzYS9FTlBPNFZMMU9UTmU1?=
 =?utf-8?B?b2ZST1N6SDhsMGY2N1dlSU5lNWREU3dCQTVIcVNscm5NRXFLRWoxSjk3dkxp?=
 =?utf-8?B?czVEZkgxQXBuRkFtaUZ0cmdMRGpNeStQV2ErOERwRCs1UFBFOUlWS2JYRk9M?=
 =?utf-8?B?Mm1tWnpUbGtSbjNXZGZpZ0VpYlIrd1JqQ3ZzTHhicndFNnBqaThnZUZoa0lz?=
 =?utf-8?B?U0FFWFZoT2hNSzRoSEorNzVINlRFK21sdkE3TGJUVzNNNUdUS0V0R2dWekNC?=
 =?utf-8?B?Mmh0RG9zWWJOM0JST0s3Skd6M1l4aGR0QzBUTjB3RXpvY0ZZdzJEYlBueGJ3?=
 =?utf-8?B?ZWsyN2Y2TDJZWjdRMGxXZXp4QmF1NmZIMjR6SUNMSEYvdUp2cFF2MXhoWFl3?=
 =?utf-8?B?emhKcDBaUWUyTk1aWGRMa0pDWE1zakZaYTRHckRHR2JOeE8vNjNLUktaNVRI?=
 =?utf-8?B?SWl3T0xjSXQ3b2JYQlh1c0NlbDFmalJMemRIK0p2eWRPcWY4UW9SMjVVVHhY?=
 =?utf-8?B?RGlzNmZMK2xqWDg4d1lrMFpoUTdBaUtzUkZyQmEwb0hrOGp5OGd4RkN6T2ZI?=
 =?utf-8?B?RUQzYkhmZXhrTUIxT3BzVEtaNndaTXdlMEs5MEFYTmZpWU5ORy9Ncnp4R25B?=
 =?utf-8?B?d2pOL0U1Z3dFUFQwZkVDYW8xMjRzVUl4aWs0NUFkSVBYblNhTjVQRS9na3Uy?=
 =?utf-8?B?eGQxbzl5NTBJZS9nODYydmhuRFlpeUdxQUFYVHRxM1BaMC9leHNxczdDU1g3?=
 =?utf-8?B?K2w4eXFiQXBMd3hFRjBmejUxRkVYdklGRC9sOWxaejZ1cko0Tkl6QWtXUjZQ?=
 =?utf-8?B?SnMzcWFSVTFkY1Qwai8vdW9Tc2RsUWZ4L2ZSZDIrdDM1ZUU0UmpJcURXYyty?=
 =?utf-8?B?T2ZBTmRyclBWS29UZklDUDRua0lwZGFEa0k0U0U2QktNQTNEelF6ak1uTlJj?=
 =?utf-8?B?UjRqZ0YyVWJEZmxBSWNmdFFEMVdudzRMZ3RDUXJFQUxDUk9NL1ZPM0ZkVW4z?=
 =?utf-8?B?c21JSWc0emtMajEwRzNOYnJMNEozbzVtaTFCL1lHY0tlbUY0MHlsOTgzWm16?=
 =?utf-8?B?SGVWb3ZTbnVGR29wcE9ReFR3RnVDTmhnRWJoQUJQQnZoUDY1S0cxekRZOXJG?=
 =?utf-8?B?LzloaUNRUWpaeXErZEZreW9iWUVkUmhDdWNaMllyYzE1c2Y3OHZqMVQ2WEpQ?=
 =?utf-8?B?TjZRY0ZTVWI3aGJiTUhKbS9sMTVmZ3hudWNKbG4wanR3a1ZmaUM0VHBwVDky?=
 =?utf-8?Q?vATleSFWBO9u/ojXOuXZGTK1n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e9475b-3850-43f1-07da-08dafa022902
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 09:47:21.4192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9b7HGzDFKPbXgw14rFpytN41FaMv2wsKiEjiAUohkn3Xdi1LGHoP6qNv4PLaXHnmaBJ9zcfI5Cjyj/YIw6fgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375

On 18.01.2023 19:21, Julien Grall wrote:
> On 06/09/2022 11:32, Jan Beulich wrote:
>> On 31.08.2022 16:10, Volodymyr Babchuk wrote:
>>> Hello,
>>>
>>> This is yet another take to a PCI locking rework. This approach
>>> was suggest by Jan Beulich who proposed to use a reference
>>> counter to control lifetime of pci_dev objects.
>>>
>>> When I started added reference counting it quickly became clear
>>> that this approach can provide more granular locking insted of
>>> huge pcidevs_lock() which is used right now. I studied how this
>>> lock used and what it protects. And found the following:
>>>
>>> 0. Comment in pci.h states the following:
>>>
>>>   153 /*
>>>   154  * The pcidevs_lock protect alldevs_list, and the assignment for the
>>>   155  * devices, it also sync the access to the msi capability that is not
>>>   156  * interrupt handling related (the mask bit register).
>>>   157  */
>>>
>>> But in reality it does much more. Here is what I found:
>>>
>>> 1. Lifetime of pci_dev struct
>>>
>>> 2. Access to pseg->alldevs_list
>>>
>>> 3. Access to domain->pdev_list
>>>
>>> 4. Access to iommu->ats_list
>>>
>>> 5. Access to MSI capability
>>>
>>> 6. Some obsucure stuff in IOMMU drivers: there are places that
>>> are guarded by pcidevs_lock() but it seems that nothing
>>> PCI-related happens there.
>>
>> Right - the lock being held was (ab)used in IOMMU code in a number of
>> places. This likely needs to change in the course of this re-work;
>> patch titles don't suggest this is currently part of the series.
>>
>>> 7. Something that I probably overlooked
>>
>> And this is the main risk here. The huge scope of the original lock
>> means that many things are serialized now but won't be anymore once
>> the lock is gone.
>>
>> But yes - thanks for the work. To be honest I don't expect to be able
>> to look at this series in detail until after the Xen Summit. And even
>> then it may take a while ...
> 
> I was wondering if this is still in your list to review?

Yes, it certainly is. But as before no predictions when I might get to it.

Jan

