Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC194AB5E0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 08:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266466.460152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGyT8-00020J-Hj; Mon, 07 Feb 2022 07:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266466.460152; Mon, 07 Feb 2022 07:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGyT8-0001xc-EL; Mon, 07 Feb 2022 07:29:50 +0000
Received: by outflank-mailman (input) for mailman id 266466;
 Mon, 07 Feb 2022 07:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nGyT7-0001xW-0h
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 07:29:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0fb410-87e7-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 08:29:47 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-OVmlwWugPF-LAq75rShKug-1; Mon, 07 Feb 2022 08:29:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB3513.eurprd04.prod.outlook.com (2603:10a6:7:87::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 07:29:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:29:43 +0000
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
X-Inumbo-ID: ba0fb410-87e7-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644218987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvASHfV8EVi/c7V/xCEFY/mhTVJcHzBNIBTR+4OJZ5U=;
	b=TsjRJ02JQAyEIF7kEFS2o87UiSZnhDPL4KnWq5sy32MreXlayvobNbnRpVS8tXsd2yg/+Y
	zJLyRgaVHCqbqvsnbLJ/AS70Huvm5AzST7h1R/6DDrT44GTfd/r8CFqZ9Xt0wtYKbdMMjH
	Gcr39Y9IU72e2nloXq6uGjKqmSxCfwI=
X-MC-Unique: OVmlwWugPF-LAq75rShKug-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8Lh958Gaa1f1tfPhgD1QDCh9Tdo544c8QqIC9zalGmAKzgliLlFSBm0zzuG9AcKni7OKBKlRnToA0SNdV+0LpAH2zdrOQbAxdbNn2H/iXKa/NfxK27NHsd5XT90EEaxgGX4wXbEhlrjMsfXCbr4em/0jq7D2km76JatVL4khHcxMUJfW4Lba6j32RT5EyA7hXHlGhwZ1urkQczWxeIkpoW186Tb3BOXUldYHbkFYUa51q/I0+539z2Vs74wtbYMc4TxjZ+gX3p1FIXWbbU48kEU0bLi3vuvWmCcPvSdQ+eMOvDq7HMmB9s6Wc2PjzxgWT47uBZVFkxY9tYYbX4c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvASHfV8EVi/c7V/xCEFY/mhTVJcHzBNIBTR+4OJZ5U=;
 b=WjgQ+FZlcH21hZY6Y+j1HwZKvwHusH51+q1AgwuBT9VrZdFZF0iTYAeOmb8qq4DEYkS9JTHDgsMcKbmhkuT9A124phY/vj/6d2pTLhY6YLJXD3rMo+3E0LEOZokGjLZ+h7ROuHZICkNZ4oi5WZPlHW6L/HfEf3qfEZ+1mWZbqPMl0BEaLaJW9BVQ/Lp06hUwClB+iREPP8JWvqgd6LzxMgrMEm1Xjy/0Uso1lOGvl2UhNWTqN9M33GJlmQNNrMBXHmIi5CgcC6RXSbXu2aqGQudao8iQgNu07Fr4eLNJtc+a9ZFzF5nK04c7jGqw8YRKCUB/BtVeDPTwfneHJDKk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
Date: Mon, 7 Feb 2022 08:29:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0016.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e2ab6e-2cdd-4155-c49c-08d9ea0b9bb7
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3513:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB35135E6565190A8C96963A19B32C9@HE1PR0402MB3513.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6m4C9RVEG8yANCeEuwslYUuKTbzKNdtJkTWMH3wO+RLasdMHTZ/ueK8ALErVO+UlsIYEGwCvIMo4I1ojN0wl22UfwlCa+Z5kUQAmva3Lv6mzRq8CHmw8csCXhsShsWNfsDRNQJI0sED7n1INsEqqx/tupN9KPnuqP0Mm8xLjAfl3PlsXw3X+tnVh8n8AfZW/LqI781wtS12RYv7h0AFfgSdI+zWujRt/0euwmhJSSQNVvIUj0OPJsHXQM1jMsn3H8Wp4KUwBc06lABl5LsnREJC+Nzpj0PTE5Pop0AiPSUGuR/WJk/7q5XmktA1D62k3pto7R3YO7aQ+kf0BOBK66UEIfq05pXmg3zgP5RF1veq645086LJZV7xO1ObHlq2j+Hey60SspqQZ+W1NPFIwbIPIy3WWg+KHYehBu+Q9tvIsSEo25S6XiFPSg1OHPoK9Ot0KIGbhstatAdjel2pEFJ6fSbDQFSUG9TiD8kxWdrHenegFG7q8EWh+VbiUc3ckEoa6YMqcCCOwNSOV1kcUY1EzHy+dq9IQ5mjrIHD5sHf7CFjzuwv72h3iSldeS8UdKnE8/QBijuuSi/945ydNy9NwJ9EJAjgroopH7qe6IMOV34GAu9hOnYyXFLMxzKg3v0s6qzCRqSEvTyshpicnl2l6iE0+XbSYg7zt0s0bfvCD6Kft9Dx9qxR4CMyjF6EVPV0zgvLAnW55WsP5lb3ljruujjmYA7c1phlbeHvNIQg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(54906003)(6486002)(86362001)(2616005)(53546011)(6916009)(6512007)(186003)(6506007)(26005)(31696002)(2906002)(36756003)(8936002)(7416002)(5660300002)(38100700002)(4326008)(8676002)(66946007)(31686004)(66556008)(316002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTdXRFFjcVI3Z0F0c0xGSjN3Q3NGOUlJMmppcTA4clorbDJFSkNJVnVWa0dt?=
 =?utf-8?B?VlZQYjdwVHl6UUhsQmt6RnBVcDUzcS9ZNzAvb0hWemFTWHl4elBiT3liRG9D?=
 =?utf-8?B?b09idVkwREJBM2cwUGgrZ3lzL0gzbFFHc2RHMGliWFFycWk5YTZ1QXhNLytv?=
 =?utf-8?B?THYvbVQ1TlplNDJwYU1iMXBPRzE3T2tiSjVrNGQ5UGpibVAvblZaaEFJLzB3?=
 =?utf-8?B?SThGRGwvbjRFOWM4cW1MNDQ3RG5FeVk5ZmFZQVIyWDhJcGkzdGJ1OGFmUHNT?=
 =?utf-8?B?L1dvUVd1L044QTgzRERDKy92dmpwZWptNWd0ajAxWHNiMVVjSHAyc0FQZjNX?=
 =?utf-8?B?cG5yQ3JWdGNEODIrRC9xditBSEpESGhhb3RSYU52cER3aDZpZjFvdm1hNGli?=
 =?utf-8?B?djB3TmY0VW9xUnRMekxZVnNIYWt4Uk5FTDIxZjZBYktWU2J1Z042WUI0d0o4?=
 =?utf-8?B?YytxdE5kR2ZkMXAwY2RyV3JPUEp2cVZOdVVGeDJWUzd6MHJiQW1PcGFJSUdp?=
 =?utf-8?B?c2x2cHBOa1FmR2Z0SStveFdSN3Z2cHRRdlRyYllkZmtVM2RWblZaSHVabXpG?=
 =?utf-8?B?L3N6aFZTYkx3dUhSRmFsQU44Z2ppbWxxNkg2bkhtNWxLdTByN2tNbXFRK2xR?=
 =?utf-8?B?VytGOWxtL0lNTWExSXpzU1pyTFJaZGlTTFhIRUJJanFtZU9QaG9BSjlSTmg5?=
 =?utf-8?B?MGMrTmdBOGVoQW5JQUYvZWphZysvSzIrSWRkVms4Ui96TERlMEZEaFZKT0lX?=
 =?utf-8?B?VTg0eDJrL0wyQk9PMXRNMEtuejZvMHg1QjhWNGJKczN2WitUR1lwd2tySVlw?=
 =?utf-8?B?RGNuaTM3eEwxbnNrMTlWa3g0Z2RWQjh6YlNBOHNmVHcvbUlBS0ZBWkJGcmNR?=
 =?utf-8?B?cnRBelg1T0ttd3Q2QVNVSmIxSUVtbWFyOENpN0t4akNWQ3lQWithUVJ4OFNS?=
 =?utf-8?B?eTNKRGVSYXM3TzJKcFBpL3pxejU0OFZWakZIdFFUYmovZ21FbWNoK0twOVNq?=
 =?utf-8?B?WVRsTXE5c0JNTExoRHlhKzlaL2xjVWFnblNRS1RIZm0wZnM0RysvM2o5aHN6?=
 =?utf-8?B?ZjYwSnpKR2UzZ2t1c210SzZBODd0d3J4WDBXTWpzT2xjb0x0OExKMmlVY1pa?=
 =?utf-8?B?c004ZFViUnE3K0JxTXRuL2IzWUtEcXlMQ0ZTZGprOUJ3ZGlXaGJyaE1UMlpq?=
 =?utf-8?B?clBsL3pJUHdBbG94VFYweE5vKzFZMjVDY0syMEt3U0NiS0I0NkcyMFFpSkdJ?=
 =?utf-8?B?Vm0yemlGckpKVVlUWDcyVEN1Tmw0TmZlRGZZOXRiL3F0N0drcTZqL2dVa2Y5?=
 =?utf-8?B?YUc0cFBRUzlGUlhHa2V4ZUcyL0piMjFmM0U0WGFZbHdaTzB1d3Y4RU9wWlRX?=
 =?utf-8?B?Skc4bzlvb3BRZ2xrcFFZaU0vMWpIL2psc0k2TlNxY2phbkd0d0c4QkdVZDlS?=
 =?utf-8?B?SGZkRWRVVVBDbkpjdFVkMnlpTkd3RlB3TlJScmN0Sks2OWFha3V0OFJ0UTE4?=
 =?utf-8?B?MFNkdWk5MGliMmtHSnFJWmtKME1wdkNvMWJXSEQ1enp5a3d1eGJEVHFPSnRJ?=
 =?utf-8?B?azIybVlQSXRMVUpwZXJMME1RNGxlVEtxanVCbTl3alI5NVBGRElCZ1pBOENo?=
 =?utf-8?B?L1J2MjIrSXVzdnFpcWVSeVEvTm1WcS9QNTZERTZXbTFPdGoxWklBRTJzVFcr?=
 =?utf-8?B?dExITkZOWUVDUGZBbktOeXFzN0czTkxNVGZGbDRpd2x3SldwRU5lV0k1SGJO?=
 =?utf-8?B?UUdVMk9QekJ1a2swZG85ZUxoM1plSXVKTW1Qem9SakFHVTVkSFE0SURESW81?=
 =?utf-8?B?MEJMZHAzU0VQNDd2UmdGdFlyTG5YWnZ0Q1RYN2dKeG9tM0ZIbk5nOEd6ZElS?=
 =?utf-8?B?SWNSMTM3dU1IcnhGcmU0RjZtNnNxV1RNQUdGc0FweUQvWjc1SXF6OCszeC9L?=
 =?utf-8?B?c0YxWDE0bDRMMjBjM3ppcmpSV3NBTVhmTUZ4NThBTjBQMmdna0RjUGZUYVA3?=
 =?utf-8?B?dWErTGcrczNLZ3VyVy9ka25VcE1PMVpuVitwMmhMcTh4aDhjall1N2Zqb01P?=
 =?utf-8?B?cFpTWTJiYUswbTZPQWc2RE5vSW9BRURQQzdYM1NmK2tPTGZYZTlqbm5maVkw?=
 =?utf-8?B?VDZrNUUrcXltSzBGVlpLM2pPQjZmdGhwV0lmR2RQTEFkdTliclJOUVhzMXE2?=
 =?utf-8?Q?1t1/QHT+MKvehc+ejTeZTRo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e2ab6e-2cdd-4155-c49c-08d9ea0b9bb7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:29:43.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL20Ptw09rxXHJhJYfwm+kqy7o/1i8ZWy2K+SdcyoD3Y65pffFYM+dssPBKBjp9Rxyu0649b/uhANYS7bUmroA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3513

On 04.02.2022 15:37, Oleksandr Andrushchenko wrote:
> On 04.02.22 16:30, Jan Beulich wrote:
>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
>>> Reset the command register when assigning a PCI device to a guest:
>>> according to the PCI spec the PCI_COMMAND register is typically all 0's
>>> after reset.
>> It's not entirely clear to me whether setting the hardware register to
>> zero is okay. What wants to be zero is the value the guest observes
>> initially.
> "the PCI spec says the PCI_COMMAND register is typically all 0's after reset."
> Why wouldn't it be ok? What is the exact concern here?

The concern is - as voiced is similar ways before, perhaps in other
contexts - that you need to consider bit-by-bit whether overwriting
with 0 what is currently there is okay. Xen and/or Dom0 may have put
values there which they expect to remain unaltered. I guess
PCI_COMMAND_SERR is a good example: While the guest's view of this
will want to be zero initially, the host having set it to 1 may not
easily be overwritten with 0, or else you'd effectively imply giving
the guest control of the bit.

Jan


