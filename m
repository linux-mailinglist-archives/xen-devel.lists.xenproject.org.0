Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF493DE703
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 09:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163287.299138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoXT-0005tO-Q7; Tue, 03 Aug 2021 07:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163287.299138; Tue, 03 Aug 2021 07:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoXT-0005rH-N5; Tue, 03 Aug 2021 07:08:35 +0000
Received: by outflank-mailman (input) for mailman id 163287;
 Tue, 03 Aug 2021 07:08:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mAoXS-0005rB-8w
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 07:08:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51180141-c077-4f3b-a9e2-34af0b2d7e3f;
 Tue, 03 Aug 2021 07:08:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-KqZHfWmvOKui5XycPEfF0w-1; Tue, 03 Aug 2021 09:08:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3535.eurprd04.prod.outlook.com (2603:10a6:803:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Tue, 3 Aug
 2021 07:08:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 07:08:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.14 via Frontend Transport; Tue, 3 Aug 2021 07:08:27 +0000
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
X-Inumbo-ID: 51180141-c077-4f3b-a9e2-34af0b2d7e3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627974511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lv9DbWb5g2knpgXNM8f31+ru7nyNBCiPbQeCA/o0vY=;
	b=OY/yTqN4nHbRZQSGQGSnNLJ3S8YkksBG0wp0PkOMJ6fhiUlEOREtJanAkvKU3a7oWmy94z
	hRTMLRGud7YK26VK+gypnW+LvlaxXWQn6zFfa645rHjOOD1juL0lFTkw7Rnl/px4Pd4gU3
	VusT2xXntPF/JLl/h4yoT7g1K+aXg/s=
X-MC-Unique: KqZHfWmvOKui5XycPEfF0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SABVZieULOFaXtNDDbDWGWMtINGeUghhdj6CsdpBYCu0FBm8ig7Dm0nkh4rHe1axj5cL9gHnKi0aWhnz7RLTeXz3w1RbAPcJBosnuX5kKdzFzEuPwir5F7Ibf//VUMWhIhVJwcf7nzno9XQ9SP9GcxYZBioBdySps4DfQRgTqZKxvTDO3dwF8IKr5+omNeU5NZ745RwBxay/wMF72SzB2gjLb8Wdm74N4ip8IRMK4E2954FEMb1yZsrgdD+Z7Sj3JYdJ6Kd88cPL6/H+sPxH1EzqG4yQiF1x28FjRK/e2Mw/VMDYRK78V7D3aIc/6oZW0fYd1zB0+qA1cgLc9NEEOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lv9DbWb5g2knpgXNM8f31+ru7nyNBCiPbQeCA/o0vY=;
 b=ECX23CjHcjEEQ/byLLkrnsrt4LkHBWnTOZv0xvYWJeuO7BBsyNgbd3CnWmxxwgWCmpe7j8ajkzbXwvYCvjaVVzT9Bx9Aa2OUilQbfyk4duAdM/EZnjiofeA5qHHeeUgh4ctd6gDPMKtOKOAPw3dcY6TtvzG0Yf7utCklwtazI+NsJVABxeXlqeMNx0MoyIbvHJiCMKIGjMviobepfyBlLbVlYv1G536pdH/BeFsI3TBhaFs5mmxoJEb6QHYP4NY7ed4jkrQo2qNWaH7NX/ur4nMy7DYUdCu5aTQOZ47bdjKQKAJUIxJ3+5ljfPlLLrAsRzS3uSQ4BMCAYCpNMB+oJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 06/10] xsm: enable xsm to always be included
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-7-dpsmith@apertussolutions.com>
 <e4aea947-ae36-7791-dd95-94ce0e60a62a@suse.com>
 <9be23243-3f1d-fd63-944a-fccfa12fc54d@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <efcf68d4-5ef7-209d-4576-eeabe0485bcb@suse.com>
Date: Tue, 3 Aug 2021 09:08:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <9be23243-3f1d-fd63-944a-fccfa12fc54d@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e69b0e-6df7-455e-0de4-08d9564d7e50
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3535:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB353542BA300D44C67C906810B3F09@VI1PR0402MB3535.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UWgOEC+ZBDvd1QlnZWQWGgqquQi1jtvMKlzq9S9SYqcNN6dkfhELgLv4vqxzXK1fSuDig3Mx5bEByXagRg4mdtCITWgrDGO0hQgcsmdm6FxlVRogpd4sI2kgQqvp6W17ZuLzui7Z4VHq7eOEEIBVwlHjK+f2jBV2gstbPKqDH+H4tp6Y69uNvcucj10dat1ZIiopaHtqY+YUu1LqLvDKPSozj1nNFpkgXBdaLJuKZK5tNiTwQKIyc9qaCwzBKf3WNRHuSKpFPjk3XmrU+Q+Nt8FGErxBKIz7M+lvOuZDpFfcGVXc/YXoa6PGgEa2a5kScCEJZI38Ne837/ZMZkfYNijZlQJI4ugcdlD2wJHSRdsD360hRIk/DbUwYgxIEKingrKPmS+eSTt17F88PliuJ1BTD0OfDfXvqu8ci3LKsl7sXqb3y7le2yNIKXP6zGlC0miJ0bwIkmRVkXvR9/ZbIQPMc9UaFDgFQ3yNuFrgzyk5XSjxnidP7ffH+KgQRtw0uiUaUras/8ow44FNCEGUVmCSNKy2nLaX4zv/p9Rs8uKGmxiMm9Pv1SVCKSm2wIHVZKLvzdXabEeJJoFIjUG6en4rWdByqcH18taFUM67m3HU0WwTwMsxIMZMLU5tSN/F+BEJEI8UebnB3YMo2Hx3YfTtdYaW49xQAV/7sAkaAQGs2RimQsvJs+zORh8lYAELquxQMBi2ig7HC9kJkwr9FECH2s2riPxO+IWSRj/RNpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(376002)(346002)(136003)(396003)(2906002)(38100700002)(478600001)(8676002)(54906003)(83380400001)(186003)(956004)(31696002)(36756003)(6916009)(6486002)(2616005)(5660300002)(6666004)(66946007)(66556008)(26005)(31686004)(53546011)(316002)(8936002)(16576012)(86362001)(4326008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUFPdGZzbnloNDl2dll3MDVNWnVCU2FLRzEyZ09iTEFjMEthOXNrRFVMNFlj?=
 =?utf-8?B?UFdrT0M0OHVvSExWQTlZR1loWGJSYXpCYkxSWXRzNUtXMmk3bTZ1ak51SFdT?=
 =?utf-8?B?T1pZTnpwaUx4Y2VJZnhCR0NaNVZ3NXEvRXgxMncwT080bW9jTlZNZEJadG1h?=
 =?utf-8?B?VHJlK01lM3QrRFl3NVlLaXJFTUpYRXo3QU1ZaGh5MzFLZlA0Z0tXd3llVVJ0?=
 =?utf-8?B?UGZZZGwyczVEZHBYS1ZRMU9Za0E0NGxYRGs1TWVmR2tjbk5yN1ZZSU13YVNT?=
 =?utf-8?B?TURHcDNxMW4yMlFuczJyTGhMRjZ3Qjk0YktId3c1V0IrbHA0WCtBOER5MGpy?=
 =?utf-8?B?b09IcktZNGRIV0hVNStOZ0g2TGU4TURjOERaVkRYUkNpUXJTN3c5Yk5QQmk3?=
 =?utf-8?B?bXMxcW9RM0FCN2daNTFPeFRGLzErMkRuRlZiY2x3VVVuT1dHL1Uwc21Sd2Rv?=
 =?utf-8?B?emVncWxCTm5aWEUwSGR0cmw2enp4c2NkK05NVkUvUjZKM0hQaHdkMmgrMitU?=
 =?utf-8?B?TUNIOS9iQzFjZWJZVFg1REk1QzdxTkRxcUp3L3g2REZxTjRvWUpLQ1lnaDhk?=
 =?utf-8?B?cWpNU0VmcmJiQTRVMXpxUmFGK3V3T2dXWUFoMFliWGFGRlMvOVlCdUdlR1lK?=
 =?utf-8?B?R3FMSW5ma1FvQVY1Nmg5SGgzbDVhMDNQRFF5MVN0VUxQYmhaSEZVR3BlYW1U?=
 =?utf-8?B?YXI4RHVyVnQzdUFwZ0o4aEhaRG5Dd1lqR0QwVkpnQzFMYW1OWlhXQmR1MGtl?=
 =?utf-8?B?bjVVSEN1NEJEcy9BM3kwd3oxcEl2Tm0xNnIwUzBWMnhCSGR2YjJSTXZvMjFR?=
 =?utf-8?B?U0tnYjJoQVQ3TGVSMG51NFBSMGtYVFU0T2w1UnRvdTVyYXVyakJOVDZzYkdp?=
 =?utf-8?B?cWozVktiZEpyREVTUExoZzJBb1dnNFA4SlgyTHJSNnRQM0F3TnJnWkhHM24w?=
 =?utf-8?B?L0lPVEEvenVJaDdWZ2ZFRGt2NXZKNWVOQ0tnYmJkWWR5N25WNURJTVY4N05N?=
 =?utf-8?B?RWJIWlI4SHRuVWZGSFVBZExZL0hQOGlCUUc2MmFETXBZYWs0UkorTFhqUlNV?=
 =?utf-8?B?WWllcTAwQjdPMCtLUkp0VWtKUHdRUllDZXlaa0tWby81cGRReERtbVBvUnBi?=
 =?utf-8?B?ZG1Yd29BY2pOQVpmTEF6U1g3NGZITXdna1YraWVhZ2ZCem9BRVJBaTVtTXpv?=
 =?utf-8?B?c0dLSy9ya0xHNUs3djY1WG5aREZNb1VTam1TNkh1ajdHOEFNSjQ2a3k0NXdz?=
 =?utf-8?B?UXFiVXg5S3VXZ3Z4NnFJYlFqWmFWUVgvaEJRTWlLYUU5MkhvMU9PVEo5bmgz?=
 =?utf-8?B?amExSjlCQ05XSGtSeE05SVJaT1ZNbkw4L2ExRk1nVm9SYUF3UHhnNVJpRm9h?=
 =?utf-8?B?RGdoVjgrdjdwQ0g5NmhSNW9ZREVNUWRsZGQybXFBRC80ZGFRYTAxQkZTbGph?=
 =?utf-8?B?SmZuc3l1VTBmcFliZ29CSmxEUk9Cc0hpbVZpeGs5V2szR0dxMHlLRU1kUU9k?=
 =?utf-8?B?Yld0L3h3UWI0RGd6WVI1REUzdTBQblRMQzBPT3pkYTN0LzhLVys5SHNzd3ZN?=
 =?utf-8?B?dTh1NEs0N3FzYTUyMjdQcDFrSW9Ldm5sdGcrd2NuUWVTSHR1OHRmQXdtYTYv?=
 =?utf-8?B?OTZLdDRCR2paVUZyb09xWnBkaHZtUTk2VnhDckgyYkJHSGg4dHBqSzlrVXhn?=
 =?utf-8?B?aS9NaTlxUnlYUG9CeE9ZWnVMdkVMbWtzSDNZRjZOZmFhWTlWNVUwUGZpK0xz?=
 =?utf-8?Q?/HcAKTVIzagReWzuVNsL5iP3dtqtvA71kjim5BB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e69b0e-6df7-455e-0de4-08d9564d7e50
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 07:08:28.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B38imzEHz8Fe0jhIeq6MEGm3B27bSkh+GRz2rnMPCryLxi81PwZ6UeG+hFDnVhSELiKe3tlPqHqCG+dETR2W7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3535

On 25.07.2021 22:47, Daniel P. Smith wrote:
> On 7/19/21 6:24 AM, Jan Beulich wrote:
>> On 12.07.2021 22:32, Daniel P. Smith wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -200,23 +200,20 @@ config XENOPROF
>>>  
>>>  	  If unsure, say Y.
>>>  
>>> -config XSM
>>> -	bool "Xen Security Modules support"
>>> -	default ARM
>>> -	---help---
>>> -	  Enables the security framework known as Xen Security Modules which
>>> -	  allows administrators fine-grained control over a Xen domain and
>>> -	  its capabilities by defining permissible interactions between domains,
>>> -	  the hypervisor itself, and related resources such as memory and
>>> -	  devices.
>>> +menu "Xen Security Modules"
>>
>> I remain unconvinced of the removal of this top level option. I don't
>> view my concern on code size / performance as "unreasonable" (as Andrew
>> did call it) when comparing with the current !XSM configuration, and I
>> also remain to be convinced of people who had to simply answer 'n' to
>> the XSM kconfig prompt being happy to make an informed decision for all
>> the (previously sub-)options that they will now be prompted for. As
>> said before - it is one thing to re-work what exactly !XSM means
>> internally (and the conversion away from inline functions may very well
>> be a win; we simply don't know without you showing e.g. bloat-o-meter
>> like data). It is another to require in-depth knowledge to configure
>> Xen that previously wasn't required.
> 
> For me personally a concern about code size / performance itself is not
> "unreasonable" but I would say it is a bit disingenuous to use it to
> defend a position that the security framework should be special
> conditioned and kept convoluted considering, 1) other subsystems, e.g.
> iommu, do not appear to me to have the same subjugation requiring a
> special case of one hook set over another, 2) the architecture (Arm)
> which IMHO has the greatest concern over code size / performance is also
> the architecture with the only security supported configuration that
> requires an XSM enabled configuration, 3) this approach effectively
> requires the maintaining of two sets of hook handlers which increases
> work and risk for vulnerability introduction, and 4) based on the
> discussions at the Developers Summit, no one seemed to be aware that the
> only logical difference between !XSM and XSM was the invocation
> mechanism, inline vs call-site, let alone that XSM_HOOK represented no
> control check.
> 
> To bring context to the discussion, after applying the clean up patches
> (everything up to the patch dropping !XSM) of the patch set, the
> bloat-o-meter shows a 0.18% increase going from !XSM to XSM (without
> SILO and Flask). IMHO this increase does not justify keeping the
> convoluted gyrations being done to swap in an optimized security hook
> when no other security module is enabled. In fact we should be working
> to make the security framework clear and concise. I am all for
> maximizing performance while doing so but the end goal is for it to be
> clear and concise so that it can be reasoned about by everybody.

Well, I guess if the majority is with you then that's what is going to
happen.

> As to your position that this increases configuration complexity, I
> would have to strongly disagree. I have worked to ensure no new
> configuration steps are necessary.

I'm having a hard time seeing how this could be the case, especially
since ...

> The default config will only have XSM
> and the default/dummy policy enabled unless on Arm which will enable
> SILO and make it the default policy. Prior to this if XSM was enabled,
> the default policy was forced to Flask. While I am an advocate for
> Flask, I do not agree this is a reasonable configuration. It now works
> such that,
>     - if you enable only SILO, it is set as the default
>     - if you enable only Flask, it is set as the default
>     - if you enable both SILO & Flask, it uses SILO as the default
> Which basically works such that if one selects a policy, then it assumes
> that policy is desired to be used, and when more than one is selected it
> will default to the one that functions most like classic Dom0 model.

... I don't see how putting in place suitable defaults would suppress
any respective prompts during e.g. "make syncconfig". (I can see that
what you say may apply to e.g. "make menuconfig", which I think I've
indicated before I don't use myself and hence I don't care all that
much about.)

> IMHO this is much more intuitive. Now one alternative I am thinking
> about that might be a bit of a compromise is to move the default policy
> selection up to the same level as XSM menu. That would make it so one
> could immediately see what the default policy is but must go into the
> XSM menu if they want to alter what policy modules are available.

All of this appears to support my assumption that you're looking at
things from a "make menuconfig"-centric viewpoint.

Jan


