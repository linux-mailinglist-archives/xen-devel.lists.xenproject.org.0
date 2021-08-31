Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781F3FC388
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 09:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175519.319727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyUx-0001mJ-6b; Tue, 31 Aug 2021 07:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175519.319727; Tue, 31 Aug 2021 07:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKyUx-0001jc-3a; Tue, 31 Aug 2021 07:47:59 +0000
Received: by outflank-mailman (input) for mailman id 175519;
 Tue, 31 Aug 2021 07:47:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKyUv-0001jW-Fw
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 07:47:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0d1607c-0a2f-11ec-ad0e-12813bfff9fa;
 Tue, 31 Aug 2021 07:47:56 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-dIa9zdZhMMCpmqKIOMYRNQ-1; Tue, 31 Aug 2021 09:47:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 07:47:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 07:47:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 07:47:52 +0000
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
X-Inumbo-ID: c0d1607c-0a2f-11ec-ad0e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630396075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ixhy65TcmV92v6tAGmnzUlvQpUNsgVOc7kPEGPPR7s=;
	b=WjvJvN2VWecv7oUyGR/BEfT88flz6TuFcGAzkkSb4hszVNNX0/ScVaUBJ8uDmfdYk98CVS
	KI1wcMy32JpelibHP3uSWMpzEUNmMD43bYBQrOGC1AcTLp6E8hvsYcEs60LkADjZn+StsP
	X747zNtd4ox1DA9zkAIxzeVA8Il4kbo=
X-MC-Unique: dIa9zdZhMMCpmqKIOMYRNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHn1N/b1cXfOW5aNlkDgsfi0DIVI/+FllvJbm+PX6ZyWRPgXrmxNqL3Y0DcbjxjdBhAUb3ugXYUBr8Qfses548iA6ugvzKfzczwNEctRkqwcGvVpCQTLn7WgqVRGJYtErwgGLcHQxHMGAbfHpAdmywcS8C4ztLYX3q4krqkSuDLXJw83EAZdBH9Pf98ZPoN5jv7pycoSd/U5sKygB2M6cXbZzTtaMsPEahogbn3mMiDeBZaFMJazuh5MnA8PurRGYgZR7KiM4TkrK8m/ABNyHYPeEYGA3qE3vtF1X0hWMMuJoLUWrSLjROTVpZUi3DMtUeKoYeEXIzWC3ANA7cpE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ixhy65TcmV92v6tAGmnzUlvQpUNsgVOc7kPEGPPR7s=;
 b=PvwUmCDggMICxjHxCAJ8qFKdS69vSABsbhb78cRDEX83EQgjiOdW1OcYSyapjrMrsh/fCoUULnicaKNJilyzg5rrvL8wLbxCgVRF5imfOHFt5WCgYr44fa0hbaOISYnv5XfPOgcblqJyNBZebtpICiQwe9U9YjwOx2bmLI5UKdLddFho86Ybz1mqoP+P6AY2JONy9TS+LJqh3EIu+0Uk3FMw+tjMKIin3f39OC/Kp5rlQgBOJM4CrtH897I3yvfKjVsoxAi/MGHAkMKL03z1BL9+b5laMuL9KeurEqrAAHQoJ8WY0KfVOyjfEVJn2RLFMy9xWw845bmaobc69vNVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <b2e8863d-217a-fc0e-3176-a20ef5ad0872@gmail.com>
 <e87ad2a2-7ee0-a2e7-7bab-0c332aca7aec@suse.com>
 <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
Date: Tue, 31 Aug 2021 09:47:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3a6ca3ac-8771-2a80-285e-701c5c1b8343@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0030.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e17fd4-43f3-4cdc-7497-08d96c53a34e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040C5123F25E4BAB4A7B1D5B3CC9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I9cHRS7MZ7kkLvsf/Iw0aFnj211fu5DP/3x6TkP75j4fPsGp9KPxYI3BOLerDHnorZZNItFSpHLAfP9GuJy6X+JIICCjz/mRnHN81wzjU4YXZN1TZTZGuSZcyNkKyU5WeDfUErnvJbI/gqpS2dqmHQ+zT2UT3wj7kr0Y/8qduQ/tMGtY/yy1v44qxgyoVR/5MxmaIKyyZiiYZ/pFRDGZk7qn+nmxxdXpolhgV5NHvLCoFXQzbZJmm6fTqYc8JgN444kFJrQPZainVL/txMdl7BrgfU2qPl0CZYsKp2eVhZC/OBIGkneBExfdfh0QMU2c2NGiFqkWTf3LQWAoL0QDk+A5rcddnbm4zMtzEf7ogi1gK0Di0yoXNamHxJ6rMGuyp/QQDHuSbwIyXCSoGoXSuqTxGzZKSlgMyGdJiD6pNLafSdjzl5jbJrDe6G9rWpaLlu3BrB/XXJab2Ua6o1yOTyuDRJ8LqdT1622wituDx1e7TyRaPPlETaB9wZdrklPNGQsHYovIuC/1Rq6MvRLAg09OVV7Ngi0te6/i3Ak7t88UztL1yHyT+sySu98CcSRashosmyQjpDiJWLvjC6y8rUVZcG1nN11zfJ+AJI9ZKjxKpwdXjye8/V2IA/qog41dvDZ/pDdSgMF7NO+DuIoR+v930tIiTd2+A+z+WPJPPn5EPwDHiHW7XCoq/mwTaB/7hGuehI5iRCZuNvZExZQU2NMZRuBcMGwut2jdcZI6JfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(66556008)(15650500001)(36756003)(31686004)(8676002)(83380400001)(16576012)(5660300002)(956004)(6486002)(54906003)(31696002)(26005)(8936002)(66946007)(86362001)(6916009)(316002)(4326008)(2616005)(38100700002)(186003)(2906002)(53546011)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05DVGhuOE84aDJ0SzQxZFJFSi9jK2hJSUh1WEsxdkkxbW5HenV2QVJVOFg3?=
 =?utf-8?B?Zk9yckZ4UHh1UHZnZkpwcWRNdk8rS1ZNenFOeWhoaVp3c09xUXU5TXpRWGdh?=
 =?utf-8?B?VmpSWWpGR2tvcXk2aFBSakFTTTkwYU9VaSs5M0h2L3RLajNhbEFFbFlTd1hp?=
 =?utf-8?B?aDVHQ25UalVQZkwvdFJFWTZoLzdZT2Zta2RhTVFZNzYrcU9YODhNYTdPTm9i?=
 =?utf-8?B?djNSRmRSelVnUzNoZnYyVUxHV1NQUDdmWkhnQ2x0ZGJ5YXRmb1lGQ09FQ1cy?=
 =?utf-8?B?T0NVZmZGS1h3T3psaHQrYUJtbTVRY25yUUxlSEpCT1YyL3ZxV1gwTGlyQWEr?=
 =?utf-8?B?Sit2c2plVlJWbFJtWlFhM1FxTVlaczYvVkN0WjEzR3Y5OVJhc2l2WXpJRW13?=
 =?utf-8?B?WlJ5ZFdIRXZQdnJ2dkRPSDJLcnRDbkFXZldMRGgzKzNLQlEyYUZOS3BrbVov?=
 =?utf-8?B?bGl0L2VTSCtaTUt6Tk54S2JBZVdQM0JJaHVQc0ptQzdTQ2I2RmJqNFBpbnhH?=
 =?utf-8?B?YlppejdROFZqNk85a2ViRDRLL0hpdkppMkxheDliR1R6MGxjSEJTRThCSmhr?=
 =?utf-8?B?WFV0RzFvUXJScGZuWkhaaVBPOWpvakxQTGZERllTZHE2K1RQM1ZoTE5IU0FJ?=
 =?utf-8?B?cW1oa0loU0gvTmk3Q2Fvdk1vOXpaOS8zbVBRUzFEWjJ6anhFa1NDWjdNTmJo?=
 =?utf-8?B?YnA4R0ZOR3FYK3VGeWN3U01HU3drb2ZMMjFEYWJNeHNPWnlxaCtXdkNFb0Jp?=
 =?utf-8?B?ZzZLZ2NaS0ljdGEwbTFFcXpsaE90eXVpUWRBbWtFbEFvUkZadk5ydUtZZUh6?=
 =?utf-8?B?SmFLTEtvVGtDZ0RCc1VHY2RvbUpjN2RTUnE3cmdPeTQ1OThXbE5LNlVzRlBW?=
 =?utf-8?B?V1JpSXNRbkplSDM0TWZTQWwwbWovdTJqM01QMHI4SGdmLzNMeHo2R1J0YWZF?=
 =?utf-8?B?bFBmeWxZdDByNnovSTZxMCt3M3pzMFo1eHcwclo1WkQzTURTL3M4WFlaV1dm?=
 =?utf-8?B?T3hiaW5iblJrbGRIRDVBdGVwV2NwWDNvSTVvNVBqMWNpdnFuSGc2djRBSjIy?=
 =?utf-8?B?cEgyVnVEbXhqNWJtSzdlSTZpQmIwTjVjUEFiVnV6alBJYkIxSUU3czBmWFMx?=
 =?utf-8?B?Q2ZpRXpPUUdmRmk4TVJkYkxXOWRHVStWV21VVVU5b2Z6dmp4dE9udFBScDlC?=
 =?utf-8?B?Zjk2U3FKbC9RckR5dElUTVhDRWczUEhLaDVMTkI1Mmw0R3cyRkJkcW5qSURW?=
 =?utf-8?B?b0JQYmdlV090OXlkN1lodjgxQ0pmT1dEdFVyd2pmZTI2Y2lNMkJiTWJxUWZm?=
 =?utf-8?B?RG5pdEJCRjc5bEE1ck96WnpGKzB4MEc0U1BUT1ZvNGlVek9FS0JKSmVOeDI4?=
 =?utf-8?B?U3h5TU5ZTG1kUEh2cFc5N2ZUN2Q5N1JIbHJsakdHTkNhVVppMzVUNit0SGUz?=
 =?utf-8?B?OWFtNkZaUUJ3ZkNjUklRdmpXbHAwY2ZYc2VqTmhsbUsvaFlQb2hYcVhFR1RU?=
 =?utf-8?B?VXdnRk1YUnF2cUU3bitveFdWUHEraytxNTNGOFU1V3E5UlA4RWhKTmRsUmxo?=
 =?utf-8?B?WHlJQ2lMSUI2Y2NJdzZGTHU3R1R2djZFcDZyQ0lGejY5N2x2NWVyMjlvcEZT?=
 =?utf-8?B?M09ZRWxOdDNjT2UvV0Y1bm9JSVZuWndjVzdEWU1obmtMYlllK1NhZjU1YzVX?=
 =?utf-8?B?UFdVT1RjM3pZamRocnNFTUZJUDdHTzVzVk41QnN5L043U0FZM2hObi84WlFn?=
 =?utf-8?Q?TsXNCKf4kaBbdaDZSVL70UbsnOJIw1uzHbQJHUI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e17fd4-43f3-4cdc-7497-08d96c53a34e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 07:47:53.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMF02uV+rKWTioKTxtYfuaqKLFUn6zMJVQ8yB5DmW4hJlAvaOFTj5bAsrmi6UOA5mBeaXrmimFN8LqqdLaqzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
> 
> On 31.08.21 09:51, Jan Beulich wrote:
>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>> Hello, Jan!
>>>
>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>>> console) are associated with DomXEN, not Dom0. This means that while
>>>> looking for overlapping BARs such devices cannot be found on Dom0's
>>>> list of devices; DomXEN's list also needs to be scanned.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentation
>>>>        would make the diff difficult to read. At this point I'd merely
>>>>        like to gather input towards possible better approaches to solve
>>>>        the issue (not the least because quite possibly there are further
>>>>        places needing changing).
>>>>
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -206,6 +206,7 @@ static int modify_bars(const struct pci_
>>>>        struct vpci_header *header = &pdev->vpci->header;
>>>>        struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>>>>        struct pci_dev *tmp, *dev = NULL;
>>>> +    const struct domain *d;
>>>>        const struct vpci_msix *msix = pdev->vpci->msix;
>>>>        unsigned int i;
>>>>        int rc;
>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>         * Check for overlaps with other BARs. Note that only BARs that are
>>>>         * currently mapped (enabled) are checked for overlaps.
>>>>         */
>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>> It is surely not desirable, but it also doesn't happen - see the
>> is_hardware_domain() check further down (keeping context below).
> Right
>>
>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>> so we need to work this around?
>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>> ("PCI: don't allow guest assignment of devices used by Xen")
>> introducing that temporary override. To permit limited
>> visibility to Dom0, these devices still need setting up in the
>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>> to take these into account (i.e. the goal here is not just to
>> prevent triggering the ASSERT() in question).
> 
> So, why don't we set pdev->domain = dom_xen for such devices and call
> modify_bars or something from pci_hide_device for instance (I didn't get too
> much into implementation details though)? If pci_hide_device already handles
> such exceptions, so it should also take care of the correct BAR overlaps etc.

How would it? It runs long before Dom0 gets created, let alone when
Dom0 may make adjustments to the BAR arrangement.

The temporary overriding of pdev->domain is because other IOMMU code
takes the domain to act upon from that field. This could have been
solved without override, but then much heavier code churn would have
resulted.

> Otherwise it looks like we put some unrelated logic into vpci which is for hiding
> the devices (on x86).

Hiding devices is in no way x86-specific.

Jan


