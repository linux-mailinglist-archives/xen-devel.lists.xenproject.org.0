Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A793FC43B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 10:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175562.319786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzEf-0001vu-8C; Tue, 31 Aug 2021 08:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175562.319786; Tue, 31 Aug 2021 08:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKzEf-0001tz-3X; Tue, 31 Aug 2021 08:35:13 +0000
Received: by outflank-mailman (input) for mailman id 175562;
 Tue, 31 Aug 2021 08:35:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKzEd-0001tt-SV
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 08:35:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d26c9ae-57ed-487b-bde3-22577ab40d87;
 Tue, 31 Aug 2021 08:35:10 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-ls3fbCuLNVKVD7N4CgjEjg-1; Tue, 31 Aug 2021 10:35:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Tue, 31 Aug
 2021 08:35:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.017; Tue, 31 Aug 2021
 08:35:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.19 via Frontend Transport; Tue, 31 Aug 2021 08:35:05 +0000
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
X-Inumbo-ID: 1d26c9ae-57ed-487b-bde3-22577ab40d87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630398909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDD8iCT0ur9si+zDyGYDe/Nu7kW3jpmLE6Gqgg2++Yk=;
	b=koPAWPtzylSQquUDZDS8mBzVI22C/GwNI6z7ZGwxLJgBu8r41azgKTOw7C39oVNvcVA/hp
	/iyrd2yNUelImespfW/EkmLUB1QAbfW86jEumniPJsjlOPRyCjmcVE7ihksm8UE1qFwyJE
	qlnUUney473OCOFnKLlqBJoKSrWpaaY=
X-MC-Unique: ls3fbCuLNVKVD7N4CgjEjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6073pccS/mTkVIenM0f6n79zI4JjyfWT/X1mVGbsDQ0WymO2P5cfiircRW9QkGCdS8jg5s8jicqZiS39kU1nKoMolKe4ri7cE3VcnJhsVzxpUFZXnTsctOKPKrM5HfzjPh5WTvRCfSo+YFj2R5HaezDItam+QA21aByEPAhfiUjfhsxfDy+xQLrk1Tuc7fyyjfTgC9c2sw/6F7VLNtfn6dInyElewDcB4X6K3+5Iet50I7QXBUA2aQ5JNYslonrZXbo2kpAPnkO0kfS9xyOlwMcQEZ5Cw9Fn905sQXiAY/9+uQuWfcT5hD0FVpOp2qJ7dhBBPMz/Xpuwg4yCVnF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDD8iCT0ur9si+zDyGYDe/Nu7kW3jpmLE6Gqgg2++Yk=;
 b=FIUsUnHWp89x2GKN8X8C6Qoxi4HRtTMaifn4UMxLbcpADSF2zI9SUFhvM+3qthW4JuBDTm89rii1Pj8PI/O0zNHDj75OPkJj71ki+QNfOA1ibd+tDEn+Be67mJp1t9iP9/pJLEF2w22nXD90MmIGTbQ8hI4wUvdruJRLIb9LUiIwIxzGoY4KtZ9AZZNqZ8GIKmUGCYwHSE5A0j8mre+LtQ7mpCS1EKzHXhsZ8nAJVagmFexjNYYdPcE9i8YdGs8J8bgz7rPLPPTfow0CSU8mhBRHv8MYdiHEfzPc8lIfPYIYhwGmO++V7WY51UpvfOvO84I3tzZqTtbdnGFnK8a3yA==
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
 <8295cd88-4e4e-4189-cf27-ce83823357df@suse.com>
 <1f571749-5d41-7c4d-8ca0-afc91d2f83fe@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2f81bc05-69e0-f3e7-4a50-67b40352efa6@suse.com>
Date: Tue, 31 Aug 2021 10:35:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1f571749-5d41-7c4d-8ca0-afc91d2f83fe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1395264d-2c10-437c-c920-08d96c5a3bef
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3389854761283B3EE801EE0FB3CC9@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dRRCAAUoBLdDYtvdTxIY81z3mWH3+pddmxPZIcnpoLrmWAfop4j2+z3zsAZaUHmbhdf45efXSLFcllMzzI5CWfdPTzsclJFBPLIL17Tl2N4ApJKUfxCamHO2yG01XzEoOZ49aSf4kqheP8TKttUkcx7MecF5KzJY5eILGt+IfOgiX8eMjhWAVyisykaPsaGNgITs41JbGLS+naUrUL8RoXf6M0FAYgy8kpdeEMviIyq7NpbYkzRWC4Qy0qmUz6RkLJs0BkQ7MjcXg0oPGENjytLDdzNt5hdCo+C50TMQaazs4LaIAyVK1qKLCE5G+6CY9YnryPJP+S93mtW5xiL8vRjIj+vZxycRcte2r3a771xVp/I/N42KBP8ABtKF+hfsfjM+j1QitUpi4ImjT14kpDVt3o0zMz82cTEmnXaogVQq8f+MErPNhRe21uAJ/eYtp9FRdFs2D9tjuCc56Bx1blupQxrSYvZGp3ZceMUBJDNLmzVz6+H1SeLBlh+dcstyQufpGTQ5mFQNRCXfO6xLOUfMcW8EJ5RHx/dqhFrGEfBeRxZI59scZvTa8lGs734ygYBsPypOqheA9F7OV/jxpuw+XuTaQ5WeFEyP0b3XpyX4FQd9sIMsJMqDHkVkFh0hnKzHyiP1VYVoWsyck0BrZ6zSFpWM6QULx3SG1OIa+E2pGEolGygrIMCPhYFKS1OOI/LcZEx5MegW/tC8uXtepgPUZ4/gsYxHxrzHz/13brM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66476007)(53546011)(6486002)(36756003)(316002)(16576012)(8936002)(8676002)(26005)(86362001)(15650500001)(31696002)(83380400001)(2906002)(54906003)(31686004)(4326008)(186003)(2616005)(956004)(5660300002)(66556008)(6916009)(66946007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzRkM1ZnRm96WHc3eHg5eWxYajFQVXU1RWpvN1hzeFFUZGgwZFVYbGc2Qkxi?=
 =?utf-8?B?UnRsT1VPNUszR1FVS09KNDYydzVBSHFOa2VDZDFoekxBVERyRkR2YUQ1V0lK?=
 =?utf-8?B?UjdrWnRBNmtXeVRYMGJNN3dEVC9OWmNMdnRISE90bG5xN3V2TGhTNzVLNXVR?=
 =?utf-8?B?OHJ5MzZoVGRLSTdGbUIrUmdOTFBlMENUakh1ZTF3WVdUYVVBOWFxSjJsaUd4?=
 =?utf-8?B?dnkyWTlsaHZtckJ3TTdqOGFNYUhoV3pMSkhJNUQrOVd0TW9QeWVZSXNBdFpa?=
 =?utf-8?B?M1BqY0RmTERYNW5sdVRvZEdvSjNEeC9WcERITkQxSDNRMHp6bVdSU1g5UHZN?=
 =?utf-8?B?SC85ZVhDQVhERGJScVFXd2tGNWtSdHR2NlBXc2poK29FQUZ1czl2bWlBSFFu?=
 =?utf-8?B?aEc2ODZjNnlYV05aWkhSWExoeDlOS1dLZzdJR3RpOGVwdmJrSnJCWXhxVllt?=
 =?utf-8?B?b1BITitsZ1lFbjluSzFnbmFBODlwajRJWEVqUkFHdzEreDBnT21ibkhjS1ZN?=
 =?utf-8?B?L0ZKeWxabS9ta1hOMVZ2RFVyeFlEZVBlWDNadDRpZWNVOFh6SXM4T1pLWitH?=
 =?utf-8?B?K3I0Q3Z0R3k1bU95OGhiYWtKWGtkOHBQSExxZVZROFBLOThSOU1UTjFCZHVx?=
 =?utf-8?B?Q3ZHWUd5QkR2dEZ3TXRjRXhqWGIzbmxjb1NYcmtxOVowVHFvWXZITzV3dE5v?=
 =?utf-8?B?bC9TK1dPa3JQZ1hBVysvdlBBbkpvbS95VTdiempOT2tYaWtnZGsrQ1B0bG4z?=
 =?utf-8?B?U2pGemp4SEM1dGZYUXIzL0VoVzhaMWdwYzFndVV0czhEbTBtWnVqMUZzMlJk?=
 =?utf-8?B?MzNRSmM0aHRpZW1JNThtcklkME5oSWpKZXVaQzRQR1MvWjByT1pDVkJqQkpm?=
 =?utf-8?B?Nm9lSnZvUEhrNXE5SndCMmJHdG1lS2pwalJKcy9LMm1SNWg3RDdIT2VmcUxV?=
 =?utf-8?B?dlRGeEx4dURiK0k1SjBPZzVGV3RFbEdsVzEzWkQyNGJnd2NVaUxNUzZrL0RX?=
 =?utf-8?B?NkVFQmd6RDJVOUY0SWdOaktZdmNPS08rUGNCUnlVSmJtVGY3Ulo5Ly9FbUZF?=
 =?utf-8?B?MWhGOVJLNnBaN1dPVHU1ODIyK2o3d1NQUmQ1ZFpzTjVzS1dpc1lPMnFRbndL?=
 =?utf-8?B?VExGL0hyd01RMlFSNGxMekdGUjdTaGp3TUJIOGtwQnNCcThJNlhOQXRtbDFm?=
 =?utf-8?B?TTVzZVRWQ2R6RS9OTU00b2RPTlVxR2RPeW8rOURxRmJ5VXlXYndaaC85Ni93?=
 =?utf-8?B?STZwTE9SMGxzZ1hGNE5FV2w4eHJLc0JwUDFjYkk2SGdzUy84WXZEdmViOC92?=
 =?utf-8?B?WG9EMGdRc2NUVFZYbnNlSlVOakRuV3BCUWg2SmRMbEk0UnFFeWdJOG1WWE9r?=
 =?utf-8?B?WHNydDB2Z0VFWkZKS2lTQjl1Tnd2UHJnLzUvK29RUldkV0JBUW4ybzJBWU1U?=
 =?utf-8?B?UGZUWUpnZmVFcFo5ZnQzams5TEhjLytPRTU5RUtoL0FuQXdYVmdxMkJ5Vkp4?=
 =?utf-8?B?YVlHY2M4SE03YXBzaDA3b2JaVy96VWZWbmFhWXA0ZVFHS3B5ZnFoeDVicmVL?=
 =?utf-8?B?NW5HOG5JWlRlYmpVcEV2MGl4SE9mOHlvQmk5S2x6YXIvSWpwZGZuOGRwNGVZ?=
 =?utf-8?B?b3dGcWVSbUZzMzJYaklMUzRlOURoUnIzbDV3Y1FZNkdsZHFPMXRrVVRsNlZL?=
 =?utf-8?B?ditkQ0V1Y0w2T0d5bktEUDd1dXAxR2QzV3RvSEFtMFY2NU42R00vbyszK2Fq?=
 =?utf-8?Q?nDWtenZonmal2ozf7zZsI5nas99kP44Gg2LkKFC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1395264d-2c10-437c-c920-08d96c5a3bef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 08:35:05.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rpZaGghqhQGK8bRv20u9ZzZcNglrKxTx9nZlZuu9xaVPWgQ17EAQXy9QuIVJ3vBGo4mhZ3xmEoPPzOX5ELgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 31.08.2021 10:14, Oleksandr Andrushchenko wrote:
> On 31.08.21 11:05, Jan Beulich wrote:
>> On 31.08.2021 09:56, Oleksandr Andrushchenko wrote:
>>> On 31.08.21 10:47, Jan Beulich wrote:
>>>> On 31.08.2021 09:06, Oleksandr Andrushchenko wrote:
>>>>> On 31.08.21 09:51, Jan Beulich wrote:
>>>>>> On 31.08.2021 07:35, Oleksandr Andrushchenko wrote:
>>>>>>> On 30.08.21 16:04, Jan Beulich wrote:
>>>>>>>> @@ -265,7 +266,8 @@ static int modify_bars(const struct pci_
>>>>>>>>           * Check for overlaps with other BARs. Note that only BARs that are
>>>>>>>>           * currently mapped (enabled) are checked for overlaps.
>>>>>>>>           */
>>>>>>>> -    for_each_pdev ( pdev->domain, tmp )
>>>>>>>> +for ( d = pdev->domain; ; d = dom_xen ) {//todo
>>>>>>> I am not quite sure this will be correct for the cases where pdev->domain != dom0,
>>>>>>> e.g. in the series for PCI passthrough for Arm this can be any guest. For such cases
>>>>>>> we'll force running the loop for dom_xen which I am not sure is desirable.
>>>>>> It is surely not desirable, but it also doesn't happen - see the
>>>>>> is_hardware_domain() check further down (keeping context below).
>>>>> Right
>>>>>>> Another question is why such a hidden device has its pdev->domain not set correctly,
>>>>>>> so we need to work this around?
>>>>>> Please see _setup_hwdom_pci_devices() and commit e46ea4d44dc0
>>>>>> ("PCI: don't allow guest assignment of devices used by Xen")
>>>>>> introducing that temporary override. To permit limited
>>>>>> visibility to Dom0, these devices still need setting up in the
>>>>>> IOMMU for Dom0. Consequently BAR overlap detection also needs
>>>>>> to take these into account (i.e. the goal here is not just to
>>>>>> prevent triggering the ASSERT() in question).
>>>>> So, why don't we set pdev->domain = dom_xen for such devices and call
>>>>> modify_bars or something from pci_hide_device for instance (I didn't get too
>>>>> much into implementation details though)? If pci_hide_device already handles
>>>>> such exceptions, so it should also take care of the correct BAR overlaps etc.
>>>> How would it? It runs long before Dom0 gets created, let alone when
>>>> Dom0 may make adjustments to the BAR arrangement.
>>> So, why don't we call "yet another hide function" while creating Dom0 for that
>>> exactly reason, e.g. BAR overlap handling? E.g. make it 2-stage hide for special
>>> devices such as console etc.
>> This might be an option, but is imo going to result not only in more
>> code churn, but also in redundant code. After all what modify_bars()
>> needs is the union of BARs from Dom0's and DomXEN's devices.
> 
> To me DomXEN here is yet another workaround as strictly speaking
> vpci code didn't need and doesn't(?) need it at the moment. Yes, at least on Arm.
> So, I do understand why you want it there, but this then does need a very
> good description of what is happening and why...
> 
>>
>>>> The temporary overriding of pdev->domain is because other IOMMU code
>>>> takes the domain to act upon from that field.
>>> So, you mean pdev->domain in that case is pointing to what?
>> Did you look at the function I've pointed you at? DomXEN there gets
>> temporarily overridden to Dom0.
> 
> This looks like yet another workaround to me which is not cute.
> So, the overall solution is spread over multiple subsystems, each
> introducing something which is hard to follow

If you have any better suggestions, I'm all ears. Or feel free to send
patches.

Jan


