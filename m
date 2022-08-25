Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926F5A0BA1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:36:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393168.631942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8L6-0006iI-QF; Thu, 25 Aug 2022 08:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393168.631942; Thu, 25 Aug 2022 08:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8L6-0006gM-Mp; Thu, 25 Aug 2022 08:35:48 +0000
Received: by outflank-mailman (input) for mailman id 393168;
 Thu, 25 Aug 2022 08:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR8L5-0006gG-Vg
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:35:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80070.outbound.protection.outlook.com [40.107.8.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea455ed4-2450-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 10:35:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6410.eurprd04.prod.outlook.com (2603:10a6:10:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 08:35:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 08:35:45 +0000
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
X-Inumbo-ID: ea455ed4-2450-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbEskmgw16jA8EJk5cUtmisAZCzqDCGVNW+A0kJO9iVMl590rDWIwl3Wbo8N4rr3ToW7y9NFaliMpJdmfqMFj6Nbaxi03Xxz1QOT7etEYqiwWNcDtBN1+pbRquFdVEjBSNvKdfFCz4oqF6N7oOwq12hL6mGg6H06YJ2yLnAIc802V0QLjDNrF/RuJ28JgFMV80hbnwB/DvjMTio/s2Z2bWKYOK4kB1SITh9d1DFnRCSGJ/yCJur4RRdrJ7b/RUS+M2axol3yUk4hy+n9p/uHiHPHbJoj4+Pw+/fNYJeIDKWdjoM3/NVhcUHicHHgDBWLwtxD1ejDaRb/pHCCjYOWgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hscJ+ul5cgr57+yhUVg2raL3XL5c5yz7Eqw4EEQmS7I=;
 b=ks2UDkC+xQf/AN4sKiHGTdz96NF2MzeHcR4Q/784BSGdw/iAo4vDB5pNGYywtKF6OIrHHe+NqOYN4CtMC0mZVovTAjQ75j8w+FNeD4UXmv/VaSoEptISYxTpPxBzrdoYrTkYWjwBZfrvIOA5f4Ig5rgLdJbbUN/54Ptir0OMpdmO/pkw4PfqZ0LAA4CMU0SeIAcPq2zkKeUbhntS7ZXlYNKhwhahg7+U2s+kUFQRFtQ2wlzBd56KjSG12ipVsoNutI4Xaotf9uw2L2AhDxjOuhmxt1zw1t07P+MsFr8VsZUN2A7dmpqO3FjaoneRnOWAKFLXNaPK0KJe/qBC/tyjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hscJ+ul5cgr57+yhUVg2raL3XL5c5yz7Eqw4EEQmS7I=;
 b=tNZSDwUNxNpYmMR7R23RFORP9E0Qv/t8IxrxpJglCR1FX2D6AHf8BOkpKwAIej8uIG8XySFoRR6T4Elgf8BkAURTdFOKbe4s4SmHnQTY2rr7COiof8vkyF4XQWiLtmBTnx20FsXwV35v0VHLk4OpH+LF27VrPJBB9ygy+aj/KDZjpWU1lYlv0jYw4wMDJFh/0bUh38H5lTim3dx9F9ioH0D2Moo8bweKTo1J28lOx5Hn43FItSZolC1DfpZcqTmoip73JUslIQ7rqALn6PKHiWZG8eguDGHNfUT0xR9r2nEDYnx8ZEnlBbqDaWUxHNPPqYAhSzpHDs0hKO+r3VOxsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
Date: Thu, 25 Aug 2022 10:35:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com>
 <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
 <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3766d36e-957f-43d2-5d7c-08da8674cd92
X-MS-TrafficTypeDiagnostic: DB8PR04MB6410:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imYglwqvwTbv6qxUjmsreejfqHoMXlGHyHzQnBsFnZjSa+TVFoxAOztPoe/cB18dMxZXZivPpWaErYp0MOawL8FJMAxhKVFQMzo64+dCWMTP/kxiKVd+qUl4Zkc/SC6arujtdC1he1AvIPQXGSxlASYEgiAOfzSVX1U4eFud6Wm/hYwr2UbCLB3yHHbYDbs3Vy21+o6JrC/Z+3Am8F650d51JIc6QG9pZzn8aziDZgVfImzKs84PmndpP/8u+ZJ/7PsY8rPaoaw4RlDuDijHf01h7UN0XkQQAVF77Rxi65u2d94GbewWkCXN+VJuF1sZ0o++Ejtgu0MrmodeDQcunAT2hzYhDgikF2mqRVyyCzBU5O9dD96zZIKiH/f22eqKcdizh4rc7mY29Z+azdV8Z3aysgIB4J1BkmfpeuuDdM4q44Q2tsSBlBkUWZMZ6DK3RgLByiZkaQt2y8gLvh+2rdxVGz+U+wKNI+Ci0IAmz2Kd+lbxWXdrHOv2jT3zkMZXQp93tOt12JXSCbI1WMkcSUBVc0a+39IjW8CqDJso/FrZsiL74hxFRQHtN2rkZf5AFguQHbwQWyDOp5wQ9oIhD+fxgHs+GjniuTMZ5l3a9G6HiVPwOdwJthZYmxLTR/wms564YTLbOaLzWisImug2mJQcnq6okQGkJo3GWk242fMIPMWba7+FuHe+H9FjroBeQUM+hOcNp2LZ6TmO/YhJ2RsNrF+g4qEAGvCqYXSBNAojb/TtnB7B0mwHX6GKhee2ZP1kF1vD/3WfPDf6D/vA+cymBrDf+GyUzzN22gBjX2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(396003)(346002)(366004)(136003)(53546011)(6916009)(6506007)(41300700001)(31686004)(26005)(186003)(4326008)(8676002)(31696002)(86362001)(6512007)(66556008)(66946007)(66476007)(8936002)(6486002)(83380400001)(5660300002)(4744005)(36756003)(2616005)(478600001)(38100700002)(316002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDNhQUNaY0F6OE9YY2hHMXhLTG02K1phWGdOWTBSMGMwVFZWaHlpTnM5SElO?=
 =?utf-8?B?VzhReE56Ylpnb2tmaG4vc0t5aDNab3ZzbDBHTG5leCt3amZTWDIyR1ZiU0Zk?=
 =?utf-8?B?d1lGVWllU2o3Zm44VjZadVlQSXlHKytkRmI1UGZRc3VCU2dlOCszWUViaXY4?=
 =?utf-8?B?ZUhLMEVSeFVWUC9OTkZFZWhlc1hKVGVhazNUamZRNUR4ZmFnRUlmcTh6YVdJ?=
 =?utf-8?B?c3QyNHd4UmN5MmdBdkVzOVJRUklhcUlBbnoyQXNoWldnbExxYmFKcGFKQURG?=
 =?utf-8?B?U3ZQL3k5NnR4L3dFR3JHclIvY1NLbzFUOTZTVUMyUW9XbTBhdDdWU25TUWRr?=
 =?utf-8?B?RXBQb1R6dUJLK1drWXd4WTY3VWE5OHhPZnB4bmlXdk1NODZKTTRUckJjZTMv?=
 =?utf-8?B?UkZTUVZLMk1MOHcrOThKVmViSnlJb1BTdFFCTmVMRk10QVRENllsYk56L3Ft?=
 =?utf-8?B?NzZyckJLS1ZEU3VBdlQ1NXlacWNqQ3N0MmVTOGNIeTY2azIwMmJlMlhXU1A2?=
 =?utf-8?B?ZmpEM29vcHBBZFZ2YzFKODluSmxhcGcyeTlGUTRUaVczL3laaUVUL2dDT1Qy?=
 =?utf-8?B?dFRiT3pYcnlyZ05HL01VZjd0ZmptRmJtUW5UTXMrRjNzd0VwS2ttdE4zbE9v?=
 =?utf-8?B?VnZTTmUrZDN3L3lzc0Q3TXgyb2lnNHhDZk1iZm5GOFpheWs3R3pxbDZZQkFn?=
 =?utf-8?B?ODdCdmI3UHhHMUNIWUk5UXQ4RG9IY0IreU83MUhpRHV6SXAveXFQKzhhbFNG?=
 =?utf-8?B?VXNSMHcrYXhJU1FramVsNWZIQTJwZzdIc21McnlIbTNUaTJiQ1Q3VFM2bzZB?=
 =?utf-8?B?YUZXYlQyUVJZZDQwT2FMS3B6eUdPL09LVjErUkpPOGlBVTU2cVNtUzlFRUJP?=
 =?utf-8?B?YjNOakFmWXdLWTlBS3NJcXczRVR5RmdlaGc0ZWdnQ2ZRM3dRT0Z1YUFyQWU0?=
 =?utf-8?B?TVJESUluZ3ZLZUlmclFpWUpkRjJTYVJoWkxDaE5wVElVWURhWjFBZVJPZSsw?=
 =?utf-8?B?ak51bHMva3gycnJsdUVvRVFJdFZEd0MrbzJ5YTd5TjF1RFFYZXZJZytETDVq?=
 =?utf-8?B?WWo4RXpPQ1JXVzNFVGM3bWVoWHh3U3VIVUhtNlBCYnQwYUg4bzNFQUpoWjhr?=
 =?utf-8?B?TjZSN1kwOWl4TW9JMFNsNkpzenowMUFHcUVYeG45c1lQYWJzZWs4RmpyS3F3?=
 =?utf-8?B?SmwrZjdvb21HdFhKK1BRdktNTnpqVGJKOC9mWTFFVUFuM2N1WXE5NzJMQlJQ?=
 =?utf-8?B?elBSTnM2Nk9haVJ6blhkakVGNjBFcTNzN0pCT1pUdFBLN3VZdWlwNU82T2E3?=
 =?utf-8?B?T0F1WFE2R0w2WkFIbUwvL3RTNTkzYXFVbUp6dDFsZDlCZEpkSXA5ZE5aMUtu?=
 =?utf-8?B?cnlON21neGEvcG9sRHA3YlZaQ2VnUjFzZ2pETTNsYjRMU3R3VmYyalNmaWFS?=
 =?utf-8?B?djh6cTF5U3A4T1BrMHRHTDdHOHMxZmJUSUNrN0ZQbUp6Z3VIUldtYWdYamhN?=
 =?utf-8?B?NWxBSUNhNkk1R0p5aDhPSkNUZ0s2ckZWZWVzN3FwK1hKak16Y2NicThlUDFk?=
 =?utf-8?B?RjIrN2xOdk4vT3o4cUdRRDhSZTdXcnpwaXZXSGRrUktkS2wwcTlaRU0vakts?=
 =?utf-8?B?c1lUYUlKNzV5SVVULzZZMnUyS2VZNTUxeUtwRHR5azVUTzZGSkRJSDhuZmgx?=
 =?utf-8?B?dTROVngzMm41b0FjWmEvRjJTZSttOFdBRjRIZ2JOSGNKWFUzRnVUdXUvcHVO?=
 =?utf-8?B?R3Nmalp2VkxsZFQ5UkF2alFvNjRBN3hoU0NWVEZHaDhscW0rcDczSnlrc0NB?=
 =?utf-8?B?UUI3ZXc3Yjg1RC83M0taZTJWVWk2ZnpSN09RV0JjVmZlS2w0QmdISUhTRTY4?=
 =?utf-8?B?cGYwTWtpV1ZweHN6bG95OHB4K05qK0xsa0YvZGl5TFNISnBIN09wSXdNYXRR?=
 =?utf-8?B?UFhydGxTVmdMejA2QVFramovSm9VeE1qemFYQ25oMjFuWVpNQkUva2dLbVhn?=
 =?utf-8?B?Rk9Ia2xualp6V3N4dEFKbUtkaTBGNHpjOXpUaWx0M3c4MXZubm05VFg2N2dy?=
 =?utf-8?B?U21SMldXZUg5dVJTSTZUSlVYMVpDWUZLRWNZZ1lMYzNaOHk3OXU1ZTd6bXdV?=
 =?utf-8?Q?aIuq5/u2woQqbCOqnVsAr3OHZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3766d36e-957f-43d2-5d7c-08da8674cd92
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 08:35:45.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxCQb3h41nqrX2ebFk6yIJXSwL97B5eCpAheD3UKee1nudhuZPTZBkWGoc0F1/0jzxKp1AKneHj9yFWoIRii9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6410

On 24.08.2022 20:15, Dylanger Daly wrote:
> I'm sorry I didn't get where in /sys/firmware you'd like to take a look at.

It's been a long time since I last needed to access that, when it
was still /proc/mem and/or /proc/kmem. Their modern equivalents might
be /sys/devices/virtual/mem/{,k}mem ... But if that's not usable to
get at the needed data, perhaps we should go with logging it by way
of a patch to Xen. Please let me know if I need to hand you a patch
to do so.

> Sometimes when I power the laptop off I can see it's crashing somewhere in ACPI/weird address issue

In ACPI or in EFI? In the latter case suppressing the use of the EFI
runtime service for shutdown/reboot may help ("efi=no-rs" to disable
all runtime services use might be a good first try).

> Is there anyone else struggling with AMD Ryzen 6000 on Xen?

Don't know.

Jan

