Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C8402806
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 13:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180856.327701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZbs-0006EB-Vr; Tue, 07 Sep 2021 11:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180856.327701; Tue, 07 Sep 2021 11:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZbs-0006By-SP; Tue, 07 Sep 2021 11:49:52 +0000
Received: by outflank-mailman (input) for mailman id 180856;
 Tue, 07 Sep 2021 11:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZbr-0006Bc-6b
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 11:49:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e9c2f4d-eb57-4274-a466-f4335d13ce44;
 Tue, 07 Sep 2021 11:49:50 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-0EYdDkRHO7izB27Zj_Z-RA-1; Tue, 07 Sep 2021 13:49:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 11:49:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 11:49:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0053.eurprd05.prod.outlook.com (2603:10a6:200:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 11:49:44 +0000
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
X-Inumbo-ID: 1e9c2f4d-eb57-4274-a466-f4335d13ce44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631015389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHenRRTyf45+WJBF15XEKH7XjRi3lSRhsGAvltq2EWE=;
	b=AzoDJmxPKIgCko/Hq/KjLR9Vz4ZY3+jt/+I5yuHD8h3aEGCWnJKzA3/AhbqH3tJbR+ftQn
	UW/t6G7RA5Qnj2+ZTqyu8ACNzUKwvaVGFgOcV8b5GIdCxGFSOImJTGaZu97lSwFlzd9bSC
	BTIqlbFKd7XM2saWiAt4CraXKf8b8Gw=
X-MC-Unique: 0EYdDkRHO7izB27Zj_Z-RA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYj0HIVfm48U+c49s1gTcyPG6K8u+GX8M50bbRawIaTf3nexRPn/W4zGLG0+a5viCkE8g7OZjoQFbGLT5Ez7SVGVT3afJVpJBKKUJvNUv22h+M8pNrzj50Veu5vU1ALhkMX9UZ6cIA0qDNqxI+RDdwto/wOnSxIKK97Uj6uoS+NF+Ht/JEEpd5o1H0OktqzDQywVKV8qsR/LZx4HCtpMREsCvBsq7x382seFYgXLMW3oP9/gKWR9r7rpUR/fn5IeuS7qkkzykUXcqF7eoHYRrWsLFUbUPj0L1mpT+da67yIpTL9AEDGPjq1P5yVuqKRs8CNbOarSI6Yu2RGhSm8kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uHenRRTyf45+WJBF15XEKH7XjRi3lSRhsGAvltq2EWE=;
 b=Er8VV61mSivAevJPngEKURkhnbMXPKJeZ955bhojAnW7QPjH1QfMOV8Tkyy1E0IgfGYE9zjct8FQXwHMjtGnEdE1orhv3S7Cyq3/cJR06BITXXRZoV5aTwuLmpuN0rnN4dOKI+qbGA0Va0Wd+SsG1ytJOQoRy6VBSwiYTwfetHWW3G82N1yuS+jMzCrWQ4Zf7zpowk/rakaNXFrpkGqF8m+LOTTQvXv+R2QmgliAE1VPGSAhQsqAn9z9T0x/Ufa22iqu+jb9B0fFqrTl3uv5/ypABNgRr0LvqyRCOi7xzw/N4O67e5esQwHnPTulasZe9oFy/CqtaV6EcPZAYrr6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
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
 <20210903100831.177748-5-andr2000@gmail.com>
 <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
 <16e396be-89f5-4d42-d57b-d91f09b70644@epam.com>
 <00bbe12b-6a79-e660-c5c1-57ccb200d2eb@suse.com>
 <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <938156e7-cbd0-a19e-f09f-a41dce051367@suse.com>
Date: Tue, 7 Sep 2021 13:49:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <242373cf-9854-74b7-4d54-bbcacc6cb7cb@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0053.eurprd05.prod.outlook.com
 (2603:10a6:200:68::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d46988d-393e-466e-86a2-08d971f59657
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325C7215AA53AD7B56DA9B6B3D39@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YSB3lk8s/QoJO04og4CPCeAHRQLHRS4Qlr64DhwDaDZjbkzEJ+WmdqPGnmS/57/VbXzklXyjlEr5LvFqBEfmJ0bzwBTBNfx6RCp5R7GdyXEXVwCe1rIdA0mJMdUUS/cWz9W9rtcSo6EkvQr5qBjwmhiUFhKg+jZGzhpek5rwVTzVxrrOWcxypcqDByWDt/IgWlPHOGqI/XFVS9YDlbX6emnCD/FSKd7xCXkWPWlagZS+0TGOsSODo+Ea6ajHBXWp3nyiZ1egOQCOM+yMzljnXVfXYK1i6/PxwjmaevIq5lInEmYt7kFg61fxPj+T2uu3Xx00JyOM/yuzAXFHshezHigwOxZZN2bCNji2nhEucTELEWELTfx/4uVtrQE+ICtf4RmKDg9+9fOzrnzRglKJGxfA9iDrCnq28t+clDkLp783cZkHXqWRQwnZ1ZGCDK72rEL37F6Jq3gXJb2TgktSqzZ8aUBA1xg0HDgH1nOukv736yvo/cnlueGVpc5KFhMNKp7E/t+7qF4oXvRyoOLvW18EKehIT7LX2prtPdABnVtD2sQ2p8IRPtCK6nb+b95RxkE5BQQ5PBniEAsvM+hsgCVHFGi2rKNKZO2GbyUGI3sq6hTzX8syuiRWIv2yg6bT2uB7AZ6Xw3FiaDal7CB6rIGWMBInj13HqXkGATOd8blM5xMY/X7/cWxh39wRJua1a3zKvT9UxbqSFmRYb6N8i64jBRuDm6Ezx+WUBOcdvouxT14ajTY/k58iAhHFC6xE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(316002)(2906002)(8936002)(110136005)(186003)(16576012)(31686004)(31696002)(478600001)(956004)(2616005)(5660300002)(4326008)(36756003)(86362001)(6486002)(38100700002)(8676002)(53546011)(83380400001)(26005)(54906003)(7416002)(66946007)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVlvZExCeTd5eFhsODhxdnFUWEF6M2ZrVitrOU1pZGVlY0hlVnFPdC9sQVVC?=
 =?utf-8?B?VEx6eG5vcytIYUVlN21lZVplWFNmc0lJYXpkb0Jwd0diVXJJMVBRRGR4N1ZB?=
 =?utf-8?B?SS9SR1Z0WjBUVHdrNG95YUxqVmtuZEx2RXVFZURFQjR5LzBaamNaQnM4VUhW?=
 =?utf-8?B?bHFDYjNhKzNtZld6anZVYXpMWkdlNnRUeXY3LzJISGxlekprOWo0NXR0ZjNG?=
 =?utf-8?B?QVkxVUx5L3FaYTBuWUwwMDNZWHc4R2FDRG96TkhRQnpJZkRIWUFJVkI0eitM?=
 =?utf-8?B?S01QQ1NXV29KMmcxSlBRWnBMeDZmL1NvdW5yQUtWUXBITVNLUWJ0dWEveXl2?=
 =?utf-8?B?NTRlMzg5eHBtd2E3WExCeFdTNzgxOWRTWEFDWFczYWxKbEtPOXRXVldYMVdv?=
 =?utf-8?B?cHBHOFZhN2JNV1R5ZmRPL1JLUGFScUJZc3FwRnJkL3pxWVA5WjNKd20xLzlF?=
 =?utf-8?B?ak9UZGN5S29KemVBKzVSRVpoYUtDY0Y5bjB1ZzlJdm1PaUhaL3FhZnVKTEk4?=
 =?utf-8?B?RGxnM0FIS201RGZBSUZhWWpaYWRQcnJqajJUUFVwcFNUZ01ldVYySW5QZFZB?=
 =?utf-8?B?RjdLZ3NPYUJTemRLU3c0T3MwemJGK1RJaXJCRDBDemFPZC9kWWEzdU1RTWJ6?=
 =?utf-8?B?UjdNdGVXYk54MzcyZndDcHVGWlJiZzk0eE9KSTJIdXVkZy9VTmQvdTU3cmE3?=
 =?utf-8?B?WUxvRmdadUFqQjdxU3YvbTl4a0hPb1cyVlN3VGdFRSt4Ny9EdlFrSDNIa0tL?=
 =?utf-8?B?emp1UEdZQW9nV3hBMVJTT3lLNk9rcnd4V1VHYzExcmplWUFGc1JEQXlaV1Fu?=
 =?utf-8?B?Ry95ZHZNQm93dlBlSXRMRmRqd2RmRStreU4vRkZyYkZaTDlIZldqekhCTENZ?=
 =?utf-8?B?MEI3OVNvRm4rY0JueERHek5PL1R1c0J2dTl6VnlBUjRzZ0lubFpzeDlYY1Bt?=
 =?utf-8?B?QXRyeEVwcXYwUGFjQlU3QzN6RGRUVGlIQnkxaXNZdkQ5dzRZQ0FqUUlTNzJX?=
 =?utf-8?B?NE56WlFldWgvRzdyNVF1Q0xKNU8yN3drV2RGZE5ZZ3RVZUxxVDJrSzdLRXRJ?=
 =?utf-8?B?MVhOR2F0Y2I1U0ZyQmhWRjN0d2w5TGxHYy9pOXY2SU5lN3dvTU5DSmtYUWpF?=
 =?utf-8?B?UjRQdUpCNlY3d3FVOXVVRXNQSm5Nbk5jMTJTc3ZPa2RKTXpxYUY4anM1U0Ru?=
 =?utf-8?B?VzY3RkRaZHVxT1A0dmQyUmkrSDRDYXhKTndLTzRVaTlSdlZDSi8xcURvQzRQ?=
 =?utf-8?B?UnpYMzBEaHpMaHJJMkVzNC9zUG5NdW1ObVB0TjJjaG5LdU5NTFR0UHQ4SGha?=
 =?utf-8?B?aTZ6UXNpdWhXaFlmcG5QbEl3ZTB2dDYvUWlvUnoxVkhPeHFYNE12eUJldDJM?=
 =?utf-8?B?azZHTWtnK2ZtSGNMTHNlWlAvNnJrUGk1YjVJbENyc2t4ZFpOWUw1eW1acEU5?=
 =?utf-8?B?ZEowcVo4LzRQaXk5MTJoVkgrZFVTMFIvQ0poODdMUTQwL1o0SENydXVCemo1?=
 =?utf-8?B?UW41Z0tsVytodmxHMlM0ZEdYUmNrUVorQjRIcDZEeS9DVnh4QnYwdGsydTJJ?=
 =?utf-8?B?N3NhK1JoMWFDUXUvYkhhbzYzb2JYNkZmdWZxUUpFNUplNnA3bTNsZU83TUVB?=
 =?utf-8?B?V0EvMmNQdEYxeGo2UkZZUGg5ZnlQTFFxbURYeTRwWjN4N0cxazJCd0lNTkRO?=
 =?utf-8?B?SzRMdVFwWXFoT0JLbnZlQ1NkWUFQSU1zZ1VsbklwdVhzS09ZU3Z6cFM3Smdu?=
 =?utf-8?Q?YJzdIFdFfnpKrxaa12Xo3FxnPR828PYMhI5jxm5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d46988d-393e-466e-86a2-08d971f59657
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:49:45.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkQZB7Wq/IXVB1IMrFP9tmvPahQMIIEcr5pWYIEDWIk6PQ5hCHsAnThhHI7M/vedM9B0V0wEZrlCcJiMaRjhxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 07.09.2021 13:10, Oleksandr Andrushchenko wrote:
> 
> On 07.09.21 13:43, Jan Beulich wrote:
>> On 07.09.2021 12:11, Oleksandr Andrushchenko wrote:
>>> On 06.09.21 17:11, Jan Beulich wrote:
>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>> @@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
>>>>>    }
>>>>>    REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>>>>>    
>>>>> +int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
>>>>> +{
>>>>> +    int rc;
>>>>> +
>>>>> +    /* Remove previously added registers. */
>>>>> +    vpci_remove_device_registers(pdev);
>>>>> +
>>>>> +    /* It only makes sense to add registers for hwdom or guest domain. */
>>>>> +    if ( d->domain_id >= DOMID_FIRST_RESERVED )
>>>>> +        return 0;
>>>>> +
>>>>> +    if ( is_hardware_domain(d) )
>>>>> +        rc = add_bar_handlers(pdev, true);
>>>>> +    else
>>>>> +        rc = add_bar_handlers(pdev, false);
>>>>       rc = add_bar_handlers(pdev, is_hardware_domain(d));
>>> Indeed, thank you ;)
>>>>> +    if ( rc )
>>>>> +        gprintk(XENLOG_ERR,
>>>>> +            "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
>>>>> +            d->domain_id);
>>>> Please use %pd and correct indentation. Logging the error code might
>>>> also help some in diagnosing issues.
>>> Sure, I'll change it to %pd
>>>>    Further I'm not sure this is a
>>>> message we want in release builds
>>> Why not?
>> Excess verbosity: If we have such here, why not elsewhere on error paths?
>> And I hope you agree things will get too verbose if we had such (about)
>> everywhere?
> Agree, will change it to gdprintk
>>
>>>>    - perhaps gdprintk()?
>>> I'll change if we decide so
>>>>> +    return rc;
>>>>> +}
>>>>> +
>>>>> +int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev)
>>>>> +{
>>>>> +    /* Remove previously added registers. */
>>>>> +    vpci_remove_device_registers(pdev);
>>>>> +    return 0;
>>>>> +}
>>>> Also - in how far is the goal of your work to also make vPCI work for
>>>> x86 DomU-s? If that's not a goal
>>> It is not, unfortunately. The goal is not to break x86 and to enable Arm
>>>> , I'd like to ask that you limit the
>>>> introduction of code that ends up dead there.
>>> What's wrong with this function even if it is a one-liner?
>> The comment is primarily on the earlier function, and then extends to
>> this one.
>>
>>> This way we have a pair vpci_bar_add_handlers/vpci_bar_remove_handlers
>>> and if I understood correctly you suggest vpci_bar_add_handlers/vpci_remove_device_registers?
>>> What would we gain from that, but yet another secret knowledge that in order
>>> to remove BAR handlers one needs to call vpci_remove_device_registers
>>> while I would personally expect to call vpci_bar_add_handlers' counterpart,
>>> vpci_remove_device_registers namely.
>> This is all fine. Yet vpci_bar_{add,remove}_handlers() will, aiui, be
>> dead code on x86.
> vpci_bar_add_handlers will be used by x86 PVH Dom0

Where / when? You add a call from vpci_assign_device(), but besides that
also being dead code on x86 (for now), you can't mean that because
vpci_deassign_device() also calls vpci_bar_remove_handlers().

>>   Hence there should be an arrangement allowing the
>> compiler to eliminate this dead code.
> 
> So, the only dead code for x86 here will be vpci_bar_remove_handlers. Yet.
> Because I hope x86 to gain guest support for PVH Dom0 sooner or later.
> 
>>   Whether that's enclosing these
>> by "#ifdef" or adding early "if(!IS_ENABLED(CONFIG_*))" is secondary.
>> This has a knock-on effect on other functions as you certainly realize:
>> The compiler seeing e.g. the 2nd argument to the add-BARs function
>> always being true allows it to instantiate just a clone of the original
>> function with the respective conditionals removed.
> 
> With the above (e.g. add is going to be used, but not remove) do you
> think it is worth playing with ifdef's to strip that single function and add
> a piece of spaghetti code to save a bit?

No, that I agree wouldn't be worth it.

> What would that ifdef look like,
> e.g. #ifdef CONFIG_ARM or #ifndef CONFIG_X86 && any other platform, but ARM?

A new setting, preferably; e.g. VCPU_UNPRIVILEGED, to be "select"ed by
architectures as functionality gets enabled.

Jan


