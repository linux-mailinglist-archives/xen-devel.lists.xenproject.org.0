Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3972A3FC392
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 10:06:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175539.319749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKym3-0005Ug-7Q; Tue, 31 Aug 2021 08:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175539.319749; Tue, 31 Aug 2021 08:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKym3-0005SE-3u; Tue, 31 Aug 2021 08:05:39 +0000
Received: by outflank-mailman (input) for mailman id 175539;
 Tue, 31 Aug 2021 08:05:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKym0-0005S8-Vi
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 08:05:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 383ae6a4-0a32-11ec-ad0e-12813bfff9fa;
 Tue, 31 Aug 2021 08:05:35 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-rG_1XT-QOtuWfyipiNrmzw-1;
 Tue, 31 Aug 2021 10:05:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7152.eurprd04.prod.outlook.com (2603:10a6:800:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 08:05:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 08:05:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P190CA0016.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.21 via Frontend Transport; Tue, 31 Aug 2021 08:05:31 +0000
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
X-Inumbo-ID: 383ae6a4-0a32-11ec-ad0e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630397134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HHyKNRHrVqHQC89wG7c9UAgYsny5vZEPLvOD3FDeKss=;
	b=dLIjT+Vs8kx5rq6L83iVcx1gIY1C24dk/p+nOwmVyWuVW/9ZoXFuHfSKSDIlbTwfgFgjQn
	WR/v6dPS4yBYoMxXTc7cE1KMphjPkNR+xDs+MyRjpVNn76uR2sCfqzbOVGzRalMTCinQtp
	h7kkJqPsxocw2jxgrVjWlFAhRVN2OSI=
X-MC-Unique: rG_1XT-QOtuWfyipiNrmzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb69lLPkjWAGBas+Q/7tlBTmaaVktMtwSl4nt1DZCqMzveQG1Vd/BZAf9bVcVJA2MSMEAwxb4Z9S8bcg326LSniws/wyh7Nbghq/UYhJn1C63AdXewGHVDW5CIPXF1xnqxE60HAEqs+Y6xlv584RXupvGWlgYbZnQyIcEDq1C2F+CKHKCOMQjITznlahMxNKFingbc78ZFp3x4lqH7UoLgcBzFLRa8DAaKjtlhmtRRh4iUC4to3cA51bJZjLdAgt84vCIBF+kdbgBvX9onGpbFk1xsiVvQd+RB3T0zpnmhbXcEXtlk+3FvUMiOTeE0SHR6FqGyE9Tys0xT+7mmgzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHyKNRHrVqHQC89wG7c9UAgYsny5vZEPLvOD3FDeKss=;
 b=SJmgCOZc4zWh2X253lcZOtVdYHO/xWTG+u4djKZuQv6KVoXCvStxjkkOm5OcrokfeOot13qgJ2OJ2St3kHNxZD9TFRVotLW0ifMJfOi8fQZYkTITRFyAaiQPVIRno8LG/1d6RAInDCTCJNJmvULXE3QM2tQgQuG2C2v7aWVPXTPklnqKs74J9ahgUlrAvsAaHwXHSPEu1JyYppXNGgdmDhFQN2WjhsyTpFd5pWK3LAck8ydke0KsFy+gQgccrzHGMUXNKwERCOjYC9QQQu3U/JUpG8VhJPm+w4r7vK8eRySdMWJtluFOTKo8F0IZrvUzywhbulOjxQ8oJZcyNRazsQ==
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
 <956dd02c-553e-6aa2-eedf-28703a6ded32@suse.com>
 <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
Date: Tue, 31 Aug 2021 10:05:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <13eb638e-c3c5-6794-c828-04c66bb2bd2f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12521698-21a2-4cb7-3868-08d96c561a67
X-MS-TrafficTypeDiagnostic: VI1PR04MB7152:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7152486EE094CE6486BCFDA5B3CC9@VI1PR04MB7152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L0QfodrpSeVxbTfNiHQAcWAHLL5B39ifqUqVcEVZKVEbrXI4ySK6KMrtMntvli8VtBQfydDyV83zZsjZ3TuKWxws8vDQYNBRR6vubHqHGTjK4HDiotXP7AvdRXPPEUJfAgUTii+v/G181GHGbk3dTgrLM+ggQbEQRBcX/lE5OM6tRYKbV3jWyod9jsHe7kNpBN3T/xRaR7E8Dhvyz3lqH2uk2uDnS+ETMokHJUcYMiRRWmyLbWhT0fhwTZG1R1ZbxTYHBPUcBnUFKH4rKxUztnjc7+1niUPKnkE0bta2OJhE/Z6Qnf/RN+4eiYV3hThZQ1C1LnxTclpafrN8A0o8bHl1NeSDG2QIZOFwPGki0a2XMqF0ZV8vygXa+jtTdwotp7WaNeZIgS1A/kS0ivSXQgWuq4aP11rfClc9cgP9HOqL19ikudycrm4z+2FErzPKWXSubJ7WiSb0VRfE7c3FSBrcnNjc+2GR/JH8ijV0BJsiqiivNPBo/FcsJv4ccXLEnwrHexqp65R90vPQ4G9kDjrjJ6/djimG5ZpnZnziDgiO1MP/TF1P5AoLpQ3GjAvEyLqjtYXAGx1sAiY2VG1feDOCJftBidf09hHgEQIqZ8/Rxa3Td66GUwCF3zHgA8f3FRW1yyz2RRQBd8vwaBgNe1c54n3S0a7FzDXQQKvK/5B7Q2kJYfd49R6Zci4/wQ8+27qX5NrmzM8FSPFLzP5g1MTH1zq0QNSiJd3BxGhCroc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(366004)(376002)(136003)(396003)(36756003)(31696002)(31686004)(38100700002)(86362001)(6486002)(83380400001)(316002)(478600001)(186003)(66476007)(15650500001)(53546011)(26005)(66556008)(2906002)(8676002)(6916009)(2616005)(16576012)(54906003)(8936002)(66946007)(5660300002)(956004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhVUFJETGN6RGg1WUsxNVpZNlJWVFR4Wm1VR3hVRHJQLytCeldhZnY0OWts?=
 =?utf-8?B?SHpaYXZhNzQxeCt2VmpUdHdIZ0pjZWZnRkdUSnpDdTR5ZGduMGZDWWh3WENV?=
 =?utf-8?B?djNGNjJSOGpXTkVpQ2d4Z2ZvUzBKbU5ZdGdUcmhxVGs1ZUxNelFVUVV5cjdY?=
 =?utf-8?B?dm90czEvekYxKzlzZ09OeEthdmdzZHYzZUxYL0FKUHR0MHhPVWlRWjQ3MUFX?=
 =?utf-8?B?WE5oUysyYmhodE5IZGpQZDloOC9iVUhrbnpEV2srNEtZT1A4SXR4MnFMM0xI?=
 =?utf-8?B?dUU4UW9yd21oSWxZZ1Arc1FlcG9NZGdYNnhlOHFOeDBHeWVLR3lrWXJpb01D?=
 =?utf-8?B?SEgxcTFVMUdwMmJ3Sm91bmdGUmM1d2toOGd1bWE4S0RhQmZ5V3VMbTdoNXNB?=
 =?utf-8?B?dWhlUStkRWVvelpEUlRnM0NHK1dvRXhzUW4xdUxLNzJCcnlDYmtNdGdIWS9E?=
 =?utf-8?B?UUdpNWhoUEpkcE45WTU4T0xoZ1dhTFdZamQvUndtUUFibUwwWnU0RTQrTG9k?=
 =?utf-8?B?OFluMlV4NXJmRW1MYW9NVzhpNk1kRGpPeFBsUmZtcUcvb2d4cFcyY0JYN2dQ?=
 =?utf-8?B?NWl3Wlh4TndpaWlPV2pncWxyejFVbUF3cCtSbHh5dGdKRmZhaWIwb3FSdTRy?=
 =?utf-8?B?WXNkUG9qQ1NjakphWGlqSHFjbW5ZNnVkOVd3NWJ5RENBT2xEbEFBZ05nRld6?=
 =?utf-8?B?WHd5VTlKazRhMW5GcEJGRTN1dGVJM0MrbnpJdmQ2S3RCNmJDVGticTBiRG5y?=
 =?utf-8?B?eC9ndlU2NHEwbkhjT2pWRnlydXR1bkt5N1ozSzVWL0x0NktFVDg0cGh1amNh?=
 =?utf-8?B?Wk9CVFo1aGxyaTMrMWI5Mk95SkdOZk1KQ3BQS2V3Sk0xdFhoZFFKVTFEMjRk?=
 =?utf-8?B?QWlQc1YzbjNsR1Nsdkt4bEcwMVA4Ry9JMGNJb0hMZzJaSmdMcW5pdk44dmI5?=
 =?utf-8?B?M0tJSXpURHFpc1J3NFYyWG1KSkt5SHBRQnp0M2lOeUQvTE5yOVdaNEV6Rk14?=
 =?utf-8?B?WXVadlE5R0JoRkh3TjBsTnBMQVJJWEpKejA2RWRnSnkraVNIUDNHa1IzZlBv?=
 =?utf-8?B?T09Bd0lLYzJ5SlpzQmxySGh5Ump3eEsyQUJJdUtWamRZd25FSGRPcGRFU2o3?=
 =?utf-8?B?R3dodjhnTnI0ZjNXM0xWR1ErZWJQTXhEbmk5dDhUVG5tN2xnOWQ0U2FwUFlC?=
 =?utf-8?B?bmwwbmFObW9xVzZYTVlSYTc5SnorYmZ4ZGxFMTZTcFZZSGxybERkaDk3QjFq?=
 =?utf-8?B?Y2tsdkYxc1VtbFFQVzM1eitDL0ZyeUw2VkxiaFZxdUFuQWJpaDMvTnJOVXpY?=
 =?utf-8?B?ZXZERW82Q25zdWVncGErYWl3NkQ2VUFlK3FtYnp1SllOaFpCS2RBZHhKZ1RV?=
 =?utf-8?B?NDRJbmpsS3dZMVZ5dGpUVzRwcEZzRkNtWnVyZ1RrYTVzSjZvbURCd3N6Mm1Q?=
 =?utf-8?B?eFN4WTBXTW5lMW1DeSs5MmM5dEV4MWhQRVVJc3FQWmppS0pXdnExSkpucFpN?=
 =?utf-8?B?TUQ0YSt0M3dyOFlTMkxsM2hzMlRGSnlSZDRQL0pPaUIyZzd6M0Z3dFR5VGZw?=
 =?utf-8?B?WjZFMS9FL2w3WHlZU2p3V1luTFNiWHU3aXRLdGZYZjVBcXBROWoyMDdqWm9z?=
 =?utf-8?B?NDdvMmFHOVM3UDg0QzNhNkVZTEUvS0hjRDdnKzZSWEs0enBETC9rWWdsZ3hn?=
 =?utf-8?B?SVZ3T2lkUXV4dUNpRjExZG8rVHFzdWlVbXdsSTAreDN6aE96bllCWW5XNmNx?=
 =?utf-8?Q?Ahm5p+ZI5VOTrdZ9tqZFxCvonGjwqsH+WwEDlYV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12521698-21a2-4cb7-3868-08d96c561a67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:05:31.6324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQTIVYrljH18y5RdGPA2IthUQ2hJhft8UcJj0VmAY4E5PtEMXEFlYvHRcOLHORFl60G4MUJBBsdX3EwHz1Xepg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7152

On 31.08.2021 09:56, Oleksandr Andrushchenko wrote:
> On 31.08.21 10:47, Jan Beulich wrote:
>> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>>> On 31.08.21 09:51, Jan Beulich wrote:
>>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>>          * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>          * currently mapped (enabled) are checked for overlaps.
>>>>>>          */
>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>>> It is surely not desirable, but it also doesn't happen - see the
>>>> is_hardware_domain() check further down (keeping context below).
>>> Right
>>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>>> so we need to work this around?
>>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>>> introducing that temporary override. To permit limited
>>>> visibility to Dom0, these devices still need setting up in the
>>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>>> to take these into account (i.e. the goal here is not just to
>>>> prevent triggering the ASSERT() in question).
>>> So, why don't we set pdev->domain = dom_xen for such devices and call
>>> modify_bars or something from pci_hide_device for instance (I didn't get too
>>> much into implementation details though)? If pci_hide_device already handles
>>> such exceptions, so it should also take care of the correct BAR overlaps etc.
>> How would it? It runs long before Dom0 gets created, let alone when
>> Dom0 may make adjustments to the BAR arrangement.
> 
> So, why don't we call "yet another hide function" while creating Dom0 for that
> exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special
> devices such as console etc.

This might be an option, but is imo going to result not only in more
code churn, but also in redundant code. After all what modify_bars()
needs is the union of BARs from Dom0's and DomXEN's devices.

>> The temporary overriding of pdev->domain is because other IOMMU code
>> takes the domain to act upon from that field.
> 
> So, you mean pdev->domain in that case is pointing to what?

Did you look at the function I've pointed you at? DomXEN there gets
temporarily overridden to Dom0.

>>   This could have been
>> solved without override, but then much heavier code churn would have
>> resulted.
>>
>>> Otherwise it looks like we put some unrelated logic into vpci which is for hiding
>>> the devices (on x86).
>> Hiding devices is in no way x86-specific.
> 
> I mean that the use-case you have, e.g. a *PCI* console you want to hide,
> is definitely not something used on Arm at least.

Not yet, that is? Why would - in the long run - somebody not want to
put in a PCI serial card in a system that supports PCI and has no
(available) other serial port? And if you have looked at the commit
I did point you at, you will also have found that it's more than just
the serial device that we hide.

Jan


