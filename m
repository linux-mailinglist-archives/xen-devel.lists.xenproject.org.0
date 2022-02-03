Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A384A8401
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264678.457861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbTZ-0006LD-Vf; Thu, 03 Feb 2022 12:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264678.457861; Thu, 03 Feb 2022 12:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbTZ-0006JQ-Sg; Thu, 03 Feb 2022 12:44:37 +0000
Received: by outflank-mailman (input) for mailman id 264678;
 Thu, 03 Feb 2022 12:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFbTY-0006JK-Sl
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:44:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a8da2f8-84ef-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 13:44:35 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-RpzGfCAKO1GQ8aLm8WBtmQ-1; Thu, 03 Feb 2022 13:44:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:44:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:44:31 +0000
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
X-Inumbo-ID: 0a8da2f8-84ef-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643892275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FiLxVk8iiEYG+at9BCceDO5cYQTAVRGZhU4E+w1O6uc=;
	b=JNvmOLq4oDza4cPWuiAknmS9+vWzO5DqibD0g+uUZ8jjQB0gKU0S1KYCRZfu2E5dTGxS7H
	vrLjRWgaqf4Am0GRBj47RXgz+39KwpMJKJ+1igWeeL8UHli3aY/EjmL+YT23dUJ/nPKUVy
	RFIq20QBhdw7Z8SSmxT2ZAFDlUfnAK4=
X-MC-Unique: RpzGfCAKO1GQ8aLm8WBtmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQ6qdt6BQk0HSk9YtuKI/Goxptif6nFq1HWgl8shCEQIZMlWki6m6v6j0hffu7DYJl1yxSCdWc4XIx/xVRgdxzg95DQLA/nwA9K8qjbuo18IEbU0JYR3l6HEFK7RBfrNyevw7n7TMhDwsL3ZPjCcYITr3DUJp+hA7SE2REpSoJVxk+t2f50ax7zpVoKhgJsGrVpOe1DMSowK+a7nWFG56+4t++ypwVVjhcC5fo3gok+hWbop3mEED4eLr5psipXQUS+k8T43++GHbPOPBhIVfBSeb93xB7ZFqPgV76Fw74UbbWffprzwzNUPhdsOs4l/1sCmP4jdt72W36NnjXHChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiLxVk8iiEYG+at9BCceDO5cYQTAVRGZhU4E+w1O6uc=;
 b=kPh0Ja+UEsaDc+Fky++DYBxBzpTo4UVN/ASTB9X4L12wq9aAXA2wMa/0WRe9F4nTp0XaONzNwlG7hDy7tYitddsKZx/muMiyQ4M738hJdwCmpZQ8VgiJFjFHR8Ar8jfKNxWzW6snkijwLD/jNjhEgH2RlDOnqFMk5oVOGR8FovITvm98Xgy7uLqqAxQQqZQLehfFW2MCEBJtuTKwXxVF7IwIrcBsg7fpu4NSQU4C3zc6NqIiOgNtA9I0mAoWKrOxp1WuQykf9d+xcTTUB7czvP9O0QdPWe61kySUHqYuQHOTD/0S5LlLBGsjFCAk/KDFHtnH4qrC0FyAItD3D152jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ac4e23d-afcd-d965-fab0-b437baef8172@suse.com>
Date: Thu, 3 Feb 2022 13:44:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
 <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
 <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e02dd501-1649-4c3c-6b73-08d9e712ecae
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3536C940987DB984A35C46E8B3289@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dEUp85BTXrfhz8J1Rtgr2+avtV7F6dAiqHbbThwSKt2BuKNr/CS4ffsQn4y6PTph7rYrko80dk+rlw7BkFuujtjtkKbOfWQ5nbUlfMXeZVlaFZnQ0YbhOzj3jz6t7aj6qyZU7+xtQOQst5btKQaS8XxkPVwaML1F5TyKUVKuXwj6YZR+8YoaCWgLiOI3d4brB+ox/mNsvf8jUmY63tkySAEGbwtP5ugTi7mJMTN0eRXtgEhBt/5GNC3aMienmla1osuEP9IzD5gxWLlzcb4DQM2adUPu6LG5vJ254zxIRH5StTsXaHpw6T36+gnDLawGSjIr+/QLqBauH684GVr5uz1P8FUUakNIBsFjB6N9a558e29Y6lfjRakTQiKqmi/FtT1xwTnJeEAn4BRpbZ0weHcdTlhYug0p95hU3bYrYyIJktcVSUz2tVZ7vM7HGq2rQxcKvwNSbGKtkC0C1qg2qXJtMUAwdhgsWS0sVfsdMZ6twiB8vBmp8MiYRaxC+RNQX63JzFe10SnGNOF2Y9jRVpU2bAmfVQyD7GDnahztuDRfRMeR3wzzzj54zbWjQGPY6irKw737VDfWkeKM0U7b0AnWeueaQlXvV37OmrtBgbcTYuGDC2/ZEE773h1T+D/S7pCbo+gZN3LYE6cG83VHrCBsPxaAyIuDoKnCg1LMIBa17u1Pw1qow9uyMvzBuitZomFiVTSgIWGN8t+uASKi7BUQv1uWhDhFLKbs7X8g0d9cl9YxZeQRjevkFeMz3uqJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(6486002)(5660300002)(38100700002)(508600001)(6506007)(54906003)(53546011)(6666004)(7416002)(31696002)(6512007)(8936002)(8676002)(4326008)(66476007)(66556008)(186003)(86362001)(83380400001)(2906002)(66946007)(31686004)(2616005)(36756003)(26005)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YS9ORWFJK0hXOTJpYjJ0TzJQdXpYcU9PRUl5V1VUWW1nVjZqSXJWbnJQenpx?=
 =?utf-8?B?NWNDVEVwd3dzUytQbmp5ZFQ0ZUMxNUR4UzlrYTBwc0VESElvZEZnbENxZWNZ?=
 =?utf-8?B?eTl6dWZMWG9wT2tvVDVCa2VJbTRWaUNiNGJHRGV1Q0NGS2cwOVRRZlVnYXBL?=
 =?utf-8?B?NzE2RnFObVRSaUhQbnhGNXQ5Q21LRTcrL2hwYTQvNzZQSzEzU1lKbnZMZTQ3?=
 =?utf-8?B?UG45YmpmOHlMZlpYbFJsRWNZd3c3Q3AvenkyQzRyR2JXS0RvaFdTRlVNQmtM?=
 =?utf-8?B?UmtBQUhUVER0V29NZ0xqQzhJMGtDWUZMWGkvZWNYV1JUei9hb3pWT001RU16?=
 =?utf-8?B?bjFDTlVUcVhGbzhub1JNdUduWjdRNjlzMDVad09STjJ0eCtsTTVYWElzbFVq?=
 =?utf-8?B?Z3JMbTMwZnl6Z01qMEtodXZha0wzN3JzdXVWK2h5dUY1bEFJVVd5SWYvd3Qx?=
 =?utf-8?B?ZkRqYzY1K2VMUkJTSHhkRmRmenpsbC9jaUVPUEI5MFFPbkpTTG1uWG5hZ0h2?=
 =?utf-8?B?VDFSMitGYnh6WmRwcGxGQkM5VkpsMjRBRHV2bkowV3g5RVpHSnlYUE5zbXZs?=
 =?utf-8?B?NWk1aEo0bjBud2NpaFJaMkRKU3pCbnZoYU5HVm5wc1JvOHF6SWpjT2tUWHVM?=
 =?utf-8?B?YW95MGQ3VHNZazA2Znp5K3BpUzNudWFtVHYzT24vUVNkTGFxMFNLNGVIMnpG?=
 =?utf-8?B?eURIb2dwZXVMcHJEc0RIcFFjY1Y0WnZCdEIwQ085ZTlWWVNwR2l5eWVsSE12?=
 =?utf-8?B?OGlWSHhPV3ZtWFJrbDhLZHRpb0xXbmVwWGFvTnc1MUlhNUcvN2VTOGN3cWEr?=
 =?utf-8?B?MlpPbUtzUXh0ZVRaalg1MkRpUDU1MVdDR0tycGthNDRHeHRzQUlySWFQUUd0?=
 =?utf-8?B?YytxQnZoMzZzNVZFQkM0YmZQV2xCVTJlRFpVaTRPamdGTjYwOU9ZcUtJRC8v?=
 =?utf-8?B?STdqSUJNc2Mvb2JZOVBwaTF5bVlHVWpUSnJzZlp0RVhLMkI1NmNXMUxtd2hJ?=
 =?utf-8?B?MEpIVVM4cVVRb1FFSTE1Yi9oQSsrbVhvRmk2eTVCbkNmNEN6Z3VpNTFlUGpL?=
 =?utf-8?B?TTJ0OWVXTnkyT3A5RitLdnV3TndYSG56bW5wRU9YaVpsVThCZmsxTGYxanNB?=
 =?utf-8?B?OG95cndSMUx6MjJqeUxoOE0rU0tlNTBqaXE2Ti9aMlV5ek9CM2FVdDRjOGZW?=
 =?utf-8?B?bW5PdFpIMGswblVJM2h2aXh5emFPK0lJUyttWWZuRWlMYlBnRjNpVWJWcWNL?=
 =?utf-8?B?UXdUSVJ6QmVNcTdBc3lMejlIQWwva3N3WEFuVXhuNlNWL1psV24rUWNpRHF1?=
 =?utf-8?B?bzQ1K2hCMDllWStUYjZEZ0U4THpERjBMaHRhWDVlMzJnZmtKaTZVRG1tNkN4?=
 =?utf-8?B?bGNnaFVodlFuRU93UmxXNjR3ZGIxL2tSSjZZMHVhUHUzWnZHc1R6R0VzOWlD?=
 =?utf-8?B?bUpxSC9TUGpxejJ6VEJ3RUtybkFYK1M1Y2pGQjUyQzV1dlFzTEIxa0RPd3F5?=
 =?utf-8?B?WGt5WFhSZWUxUmo1QTJaUThjM0toRFJHd3NVVitxVnVidW12QTU0THRDVmh2?=
 =?utf-8?B?Y3UySDkyQ3ZiNENUb1lPR0dQN1JuK1c1eWMrREU2blVjdThCQXJrcW9mTU9G?=
 =?utf-8?B?dUdUcjZLMWU2UjYvTXV6a0dXN2tWejJZVFdOV1lYVXdvaEh5NWV5Y2hHYVpJ?=
 =?utf-8?B?WUlpUnhCN29QQVk4THorcU5BMEthRkdocm1nTHpXOUdBVk5Da3lab0psSlFT?=
 =?utf-8?B?VXNMOXVjVm81UWhFQ2xNdEplNXQ5TWR0SUx5SjFpZkxOd0swYW5TWkpWa1dS?=
 =?utf-8?B?cVRZcVpCVUwxUWhlOExtei85UXN1QXBuYkRzU1lHNnJBQUhuTHlXOTk0QmVv?=
 =?utf-8?B?TDJ2b2dkdnpRblFhOTRJMzRIT1Q4SVl0M0haWFBFanVHaFJmQXJYQUZDNFI2?=
 =?utf-8?B?bk1DeDVadytkVlEvTlVFaG1GMGI0cWZkbjBFYW5QYVBGMnlubUM1TW9xeTV1?=
 =?utf-8?B?dUtESXB6MllHY1NhbUtrdWpKT1JqZGJRbzg4VmVKZ0dJNnJ4YTZYelhTTmg4?=
 =?utf-8?B?S2MwQmFoTGErcWZWR2EzWTdLcTZRMHZCc25Ba0ZpbjNta0lDK29YbnFNbDFN?=
 =?utf-8?B?TUl5WVBxOGJYVVZ3UmlUNk5Ydk9RS0UrZHpvQ1pmcndhOVUway9wV1k2eURV?=
 =?utf-8?Q?SUPM0CcBdA4tXgLJ/VdTmlk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02dd501-1649-4c3c-6b73-08d9e712ecae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 12:44:31.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edfKmz4+TK/oEUeN/Zr6Di+JsNEYQ7v2P/JDhF/f/dzDDLamsaTcKMvz6PSHAjddSx/KYq8yYzNXc+gp7YWAtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 03.02.2022 13:36, Oleksandr Andrushchenko wrote:
> Hi, Bertrand!
> 
> On 26.11.21 14:19, Oleksandr Andrushchenko wrote:
>> Hi, Bertrand!
>>
>> On 25.11.21 18:28, Bertrand Marquis wrote:
>>> Hi Oleksandr,
>>>
>>>> On 25 Nov 2021, at 11:02, Oleksandr Andrushchenko <andr2000@gmail.com> wrote:
>>>>
>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>
>>>> Add relevant vpci register handlers when assigning PCI device to a domain
>>>> and remove those when de-assigning. This allows having different
>>>> handlers for different domains, e.g. hwdom and other guests.
>>>>
>>>> Emulate guest BAR register values: this allows creating a guest view
>>>> of the registers and emulates size and properties probe as it is done
>>>> during PCI device enumeration by the guest.
>>>>
>>>> ROM BAR is only handled for the hardware domain and for guest domains
>>>> there is a stub: at the moment PCI expansion ROM handling is supported
>>>> for x86 only and it might not be used by other architectures without
>>>> emulating x86. Other use-cases may include using that expansion ROM before
>>>> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
>>>> wants to use the ROM code which seems to be rare.
>>> In the generic code, bars for ioports are actually skipped (check code before
>>> in header.c, in case of ioports there is a continue) and no handler is registered for them.
>>> The consequence will be that a guest will access hardware when reading those BARs.
>> Yes, this seems to be a valid point
> So, with the approach we have developed these days we will ignore all writes
> and return ~0 for reads for all unhandled ops, e.g. those which do not have explicit
> register handlers employed. Thus, this case will fall into unhandled clause.

Except that I guess BARs are special in that reads may not return ~0,
or else the low bits carry a meaning we don't want to convey. Unused
BARs need to be hard-wired to 0, I think.

Jan


