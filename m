Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F347B404702
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182749.330491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOl-0008KX-2O; Thu, 09 Sep 2021 08:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182749.330491; Thu, 09 Sep 2021 08:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFOk-0008Hs-V7; Thu, 09 Sep 2021 08:27:06 +0000
Received: by outflank-mailman (input) for mailman id 182749;
 Thu, 09 Sep 2021 08:27:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOFOj-0008Hm-Ih
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:27:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6359178-1147-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:27:04 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-4kHK6nxZMYq4p-MIH3RgNQ-1; Thu, 09 Sep 2021 10:27:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 08:27:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 08:27:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Thu, 9 Sep 2021 08:27:00 +0000
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
X-Inumbo-ID: b6359178-1147-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631176023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbfbMu4AIYc02eVv1Yja5SXVJWTZIYj33ovk8QlUmAQ=;
	b=l8LM+9ASYUA4rVMAZNSYDW7bwc26RQhR8yiAVO6YYx402/vkt9Bj9X1bMak6GWoKKOatDW
	gJkTOmUj7OtSx8iu8cBc2AsebHIBVYYNZjqkcdcNDq0+wqHEQvqMWbt4ZIxcW6uBUF5axb
	H/FH3o+r2kwqGy6zLd4VP+yL5dMM4ro=
X-MC-Unique: 4kHK6nxZMYq4p-MIH3RgNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKe/xMwgeBuP3DkXwGX/vys0yJksINQWcHdm/M/B/geQHF4NHE3P9AXf2F6tU6ML/UOHg9H5Aty4OtX0P0QHGzA6mWXPSWYWQ7NJHTwViR8JUWsj9CROy9JKYME0N2HzBVWkpfbSPY1Gsw/9oPza3E9NiT0X3X9w7RTKNWfp2ozMt/tla29XaNZy/HRjcjI6/L+AHlF2cFD3vnR0XF0n5dWEEtBDkhJo/dXro63EmKbx9VL288FukXkbKLBsD2UrYKwfAmwhSlyWVVloxGdtJA995tOxFHFBAF1EcgOHzNdn85MorXDter+lWgFJITPFd/eT0dxHNMx1BGzoNc3fdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XbfbMu4AIYc02eVv1Yja5SXVJWTZIYj33ovk8QlUmAQ=;
 b=OSWUzDzK9XPc7vTUnEJpMr4mHGdHQkFdZnDFCTdmf4wEh0s7lVIxPxi3LqRhnp0fD/br7PRKkzcuv4sxtD0xuINJFyXf1P4mSf8FCz9AwlQwZ5S3wq6++lotzVu6yMyvEEhNE80W9Lt65X4dsAfIN3911JzxckmM8Pfa9FHiXlyowdwYXtw5Rgrag25KKJ1PIGYJUnnzc1cHzdrkJHsuaRIUIi/0rVI78UATMuEwtQeaQzrWCjNaqjs7v+eAFJVUmRYkWIpONZeSQTONWrecSiyEvbQsc3Wgdt5z9+rOVQIp/MZGgp8iEd8yRyg22Qf0+fZ0p/b/JTr/rib1b2lxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 7/9] vpci/header: program p2m with guest BAR view
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-8-andr2000@gmail.com>
 <90813678-d873-d346-5f53-ab97aaedd3e6@suse.com>
 <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee9a69f1-6b47-a944-7255-4ffaa3e1c601@suse.com>
Date: Thu, 9 Sep 2021 10:26:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <f35a7bbb-8a9a-06c3-c7b3-60b49013d8e5@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d6066d8-7b46-4b24-c31a-08d9736b98d4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233479609F72980453625B35B3D59@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eKcOEkxeu0OQzvZaXXsdLEDN1wmx0nevxJXeX4LKWErxXHHdH0sz9Oscf1aMRAd7Jo29rZ9KB1lvqwg+J8FvmSwXb4cLk67nhE4vrnFSDj3FOPGTjbcdU4FZHAw/WnmeOizsofTkPx2Zyh3dbaZI2j/VfQcOFY7XI1/kTjX6ZX/WpxpLaD+5idWrQFlwXB1iZrNvDDRcTj6cmDx+lwjYebzdUtK4OvjA9tjI4sOVxWQhHfguru9n3Z1b/QvQKE555S+4TWr0MvsbIqFgiW8oI8nXpnRe/u7xxOLUMhiNmw+FMOSpiTCDYSWH2zqqF54wGUoBghAfOKdqEePHDzJtBSsMax+CQJe/OO7j6om0HdxlrPouKaVKvcPpuMn1wme6knmn6gGNERVLkMY7XstTInE6aw5DlrUPB2j5z+63OUAy0uiz7I0X8Chkr4hLpRlXGofJArGizSBydXnIdPIFIxFMkAVwMPgttncoNN39EmQvcihU0Llv0ztRLImmZp1PetStgHxdSMaJCzq5WDfzEO1+zOlsfPuaYadErM35vgaq8zoFmFgAOqNbznJp+3HXvqzEPksJsrKBQCw9VxInrqj4CV0JL69BMQCKI/TBx2MEcY+HG+N5Pt4Zz+ZbBRAvxv2gUoDtW+miS9A5sMQ/oobUNABOKvYm/5vP0kr6H4bA+LlU9M+nz+XHylGGEDM228tOgZ5VNc+DwFp0AZoR5Cx+hoFhMOskNpoSUyC1AEHejd7A72u3newqFnrDOKwM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(39860400002)(136003)(376002)(36756003)(86362001)(316002)(6486002)(16576012)(110136005)(4326008)(53546011)(54906003)(2906002)(66476007)(478600001)(66556008)(83380400001)(66946007)(7416002)(26005)(186003)(31696002)(8676002)(31686004)(8936002)(2616005)(956004)(38100700002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmZoVjFsK01NdDFJcXdoRUg0NHIrQUdPdzhKZnY3N1lFa0E4SnpwNEZleXlS?=
 =?utf-8?B?WmlqeFNJZVZnL09vdm9iaks5eS8zOE5Jd2dYbHZ1MXdsdjR0aGNtTTJOTWZY?=
 =?utf-8?B?K2NEZWhMNHQ0cmR6dE1yeFRUNXFJc3Z3V1M1NWM4QzhOMEU4UC9za2tuZGpq?=
 =?utf-8?B?RmFwdFc0cWlPVHVHbVRsN0t5TVpDUVBtTDM2UDVXTFFHN0Y5Z1c0NHFBTnha?=
 =?utf-8?B?WXk4U1hMbzdnTFJ4UW9Jdk50dG52cStPbjl1OEFzSjRCOWtYNUtFRUFIS254?=
 =?utf-8?B?M2E2NEhNVjFVL0c3QmNQTGM5bTFsaUt6NWx0UjhocEdIdWJ5NmllUVJteVBm?=
 =?utf-8?B?bjFNR2VsSkErc2RIZERJSkdLVTBzSHYzWDRNUnhmVncrTHEyYlMrQy9kMDdV?=
 =?utf-8?B?SjJybDZVYnNNNTdHa082OHNiemtSMkNTSkIrUUxsZGg3b3ZHNEE5ejQ1Z25M?=
 =?utf-8?B?cXlCbEM2SWNqcWtQc1FvdzhzZU9saVhYR3dNcHJ6aG9tRzAzdzNOZFd2NSsy?=
 =?utf-8?B?bi9LTGJUdE1CVm1IZUdFcXFMOGJmQ0FtSGIxemxKNzgvNUtjUW16Rjl2clhp?=
 =?utf-8?B?elUzU0JFdXVzanZhckk2blRVWXpjbWZBWGxReXhhQmM3di94c2tvSm1QaSti?=
 =?utf-8?B?MUtiRUljVHlhZG9yS3FmQ0NGY3dZN2F0UkZuVktic0dMTTZQL0xVaTd5RG04?=
 =?utf-8?B?OEpveWxhblZ6eVFjbDFJQVhnZVNKSFZHRGM0UFpRWSt5NEVoSVB1Y1oySXFG?=
 =?utf-8?B?NEdWK1F3SWI3VmpDNjV5aGFnQWhuVjZKRGVvbkk4UUlyZ1haZytBdm9BeFcx?=
 =?utf-8?B?M0Z4ZThycVZyUWJyZmcvOXJSQjNlbGhzb1FaRVI5TmNnQmN1SG9nV1Z4U3Fv?=
 =?utf-8?B?REtRSDFaM1IzM3JMKzgwMS8xWWZNVmVTMDBGYjJNeTRZSVhhOGdQcml0bzAr?=
 =?utf-8?B?enJObHJkdHZYSnl5R1FhekpFeU9XWUphVEl0djBxQW1MUHZGcFhSaGlscDN2?=
 =?utf-8?B?dVJwUXEvOC9nZVpGOWJXd0dHeUFCVTRxMEtNVFRKb3RSZFU4L3Z5NTNnYjgz?=
 =?utf-8?B?WWl4MGdrZUVHcUpCaDVxQmJKc3JlbFdjTEFWTm5DRHdhN01vemY2N29LOXRr?=
 =?utf-8?B?YVZ4blZEM0RNK0pIUlBvUGorRU9ZdHNLVjdGNVllWU5RazZnZFFsM1M0aW1h?=
 =?utf-8?B?Qi9BU2tyS2NmaU9UQlZaUlVQQkhtbjBtaTExUUt2b29jaDJTMU5vb2pMZlFR?=
 =?utf-8?B?dkw5WU5HR2QyNmRrUzVzbDdIQlJUcWtQaU1wMmhURS9kNHROd0plMkwwdUNM?=
 =?utf-8?B?SHQ1SHlXYmNMcFdpOXRHSmF0ZWVZNlVCcnFvM0lUUnc1N3UvdFJmVXBvczRC?=
 =?utf-8?B?QXhkTm84MUVuYzdBL0lWSlhRTSttWlhwWFZhb09GSm9CQjJnYjZKTmd4L3JL?=
 =?utf-8?B?UDN5YTBUSkpTMmVUTEc5aVVnR1VtMW5qUDNSeU5LU0FobTB3VTBmODBhNmhn?=
 =?utf-8?B?YjJSSzhiVHdGQmMrT0pjSWxXZTZIR1I5VkdETUNUckVvZ3d2RktpRjZDb0Q5?=
 =?utf-8?B?c0IwaGkweHo5SlJXWmR0MVFhRFMwUXg3emh2eW5qQmg4UnlncDZKNTEzVVVU?=
 =?utf-8?B?aUd3cG4yalFRTSs3Z0E0eDBGWldybGNWZm1OUkFBbm1xbFZ4THkvb0IrSks3?=
 =?utf-8?B?VExsRkNmTFUvSG9Sc216OC9JMkREMTJJOHBnZjNINktEWTFlOUx4U1lDRmdX?=
 =?utf-8?Q?uLwLHbelrY7sxMC2Q5FYl6WeXE1Gixay6aujkuN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6066d8-7b46-4b24-c31a-08d9736b98d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 08:27:01.3670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+cabYR0ShczcxyglfXr4ptQ/4EuNrwsupn8dQaeFGkoFWQHtdfcfmqQPrqWFGe8G3wVDO8JBZUQaiPDmhChug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 09.09.2021 08:13, Oleksandr Andrushchenko wrote:
> 
> On 06.09.21 17:51, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> @@ -37,12 +41,28 @@ static int map_range(unsigned long s, unsigned long e, void *data,
>>>                        unsigned long *c)
>>>   {
>>>       const struct map_data *map = data;
>>> +    gfn_t start_gfn;
>>>       int rc;
>>>   
>>>       for ( ; ; )
>>>       {
>>>           unsigned long size = e - s + 1;
>>>   
>>> +        /*
>>> +         * Any BAR may have holes in its memory we want to map, e.g.
>>> +         * we don't want to map MSI regions which may be a part of that BAR,
>>> +         * e.g. when a single BAR is used for both MMIO and MSI.
>>> +         * In this case MSI regions are subtracted from the mapping, but
>>> +         * map->start_gfn still points to the very beginning of the BAR.
>>> +         * So if there is a hole present then we need to adjust start_gfn
>>> +         * to reflect the fact of that substraction.
>>> +         */
>>> +        start_gfn = gfn_add(map->start_gfn, s - mfn_x(map->start_mfn));
>> I may be missing something, but don't you need to adjust "size" then
>> as well?
> 
> No, as range sets get consumed we have e and s updated accordingly,
> so each time size represents the right value.

It feels like something's wrong with the rangeset construction then:
Either it represents _all_ holes (including degenerate ones at the
start of end of a range), or none of them.

Jan


