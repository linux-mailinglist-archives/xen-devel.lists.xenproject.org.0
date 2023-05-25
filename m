Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7506C710D2F
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 15:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539591.840631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Axh-0000dn-Qm; Thu, 25 May 2023 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539591.840631; Thu, 25 May 2023 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Axh-0000bJ-Nx; Thu, 25 May 2023 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 539591;
 Thu, 25 May 2023 13:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2Axf-0000bD-SH
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 13:24:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a90ff36-faff-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 15:24:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9190.eurprd04.prod.outlook.com (2603:10a6:20b:44d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 13:24:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 13:24:55 +0000
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
X-Inumbo-ID: 8a90ff36-faff-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFg0HMY67/tALq5lQ4capQRIBH/PvZrtEQ+IZ00tvMAOD2fhiiexPoEUuGIwB2aI1UM+qIvMZyk7lHnSap9hM4xfQwiOAuFdc0XjwkwshWwb+y+5EoP8sVYqBiMz/eckZ4rKRKA/L39XbaCgKGq+s56fvOAMnI/jXI7q/tK5s4Yp/b3GNzjJ45yxnu2UtD02jrXINSeCcU6s7moYUfktUWoyFMrpcn2LdXnd3GWX8+49yl+IZ7qQ50ECS8Cjd+b3fnDaQ8+jMIB+6+femjvMTN9nFZFKGBYlZcW+pKp1IidU3pSJDSkyu0ODb/pS0pgLLaJlA2WsqjRbHCRFBVoPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCtypZcKre8MHrjWUn3KU38EG/uIyM7n69p9uIcxYJo=;
 b=PEMFj0md2YcenuVjM/EeJ/6U5TQmEWDzjc0pIJW6BCabesxw+cHD26q1uos/j5MLycUus7G9N62wwLo1oHg/TbaNY/Z3RhQmg4/u7xiG1gVY9Vk3fJY+huUnmDY6GiBYffSmDDG9AGpTYSxOZVoE7jDqXaoIBWd6Ft/jwHg5RLTVpJ/WxFAcWgywpGNczDSxKmbsLFF1IS/VsjGMQUf1Yr/XWTQ30Ny8cn2QyyRDAy0yagxL6POBflThQJZ1tNS0GXhXVYfN1m8gqiK0DsVWbxS6Ei7a+GS1YLmBHgc3s6UFFzYFDTRM6EC1nvgYxAsmcjpCRfZe0Z/QoaNe/cLh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCtypZcKre8MHrjWUn3KU38EG/uIyM7n69p9uIcxYJo=;
 b=aEB+Ukzo0WtSPC5cfl4JGpZ9xq8Z5cCH2U29he8o1h4AmeJ228+HoeOMj5WUqzdOnHXMDizpzqcaoJZJXPJWTGTqacCYoM9KlIk0Yl/sRDvNaQxOMxzQFu7wncWG1ytHh0AOV2oME8szVkp4BGauQRIonWkQg6mMYEvHV2Wv3phgv/aqkM52jEsg/dGhm1m+zkxwjBIaHP+3sB8jq1zsnwSLv5GsS1f+ytao/7bJ9b9CWhSlnUomrGsVmbmLZUY3Z9Sl8kK90QPaLWaiMAONOLUDic4ny1U635A+LQBaA7iYOya/p5E1b5s8A1oN1x/O9kGP+AuXR8MLIMvOT0HkBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a7aaa7a-92c2-3348-3ae3-40c09c2b1c98@suse.com>
Date: Thu, 25 May 2023 15:24:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <ZG4uUO93Iub36IFp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZG4uUO93Iub36IFp@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2a3551-ee0b-4699-653b-08db5d236dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VdC93cY3CnEs6PbQjCilDHQYitIcezWp9HjFtdB7iAayV7znwWplksSM+CiDMq1GAAk3l+6Df0/o6jyzehCNPTAWIW539rfsvfQAq7Dz5rMGS8mKvbZnG3/89woE8o3NTS/G0INT69l4qMZ960Pl3LpAGFEEgIHVhzCJHCqjIXUnyUbbLfgSuknbWSr8Li9YoHMkovL1/37VTul1VfzbHUTJfmWLOhUSQE4i+X9LJMhRJrgAro6XL80NFgH/suagNwPTQyW2i8UFki+Hm1J4AyARsCfNVQo1eDGNTuWGMq5/Kfd41d1/FdDP7lbO92zbbZObkJiFVLZZ4CYb0RdLPPfaJuLuD9SOoY6O+RCGuEyVpU+JsoOfIAJo7N626nwWqn/LPxbUgRjuJXqDGR0KnQlG8B7p4N+Sjq0gPebAHD2aGPFZFORbw16fFGlHYjHNNFs9zCS90htcnhyErmJXEx1iwgrcWcqgTTUYdlQo8rNj81CSyshDBgklfLDn5Znct9WcvEKYX0CXLmCrhryKLwALMDHnrRsZcrEJjVZKnRI9+C+2zmGVb7wM2x341dF1CBKOiLhgqtP/ZJdErTb6G4mHZ89rzR4g6bcMmulpYBLDYTdB0FCxnk+jjx0+OH425gdfwOB690hbfsSdnAXITA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(31686004)(2906002)(54906003)(15650500001)(66899021)(5660300002)(8676002)(8936002)(41300700001)(316002)(66946007)(6916009)(4326008)(66476007)(66556008)(478600001)(36756003)(6486002)(53546011)(6506007)(2616005)(38100700002)(6512007)(86362001)(31696002)(26005)(83380400001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1o5QXJQaUpDM0RGTDVzYXhhVXhKbWV0OUNOdTBnQ2RoMmZIZlRnc3RuNjFx?=
 =?utf-8?B?RklmYllZc1VIek5lVndEd2xqWnZNTk1KNFBFalNGa1RRZHh4SUdEUk5qU0J5?=
 =?utf-8?B?dzhEdUFzaGR3Qyt2WmxaSUFNRDFwYXBPQnJBWFZ2b2VBRGh5clllNjZCbVFa?=
 =?utf-8?B?NkVKalkxbXRKV2p0M01nbzhOSlFMMzlWNXg4aytEMFFKMFd0ZU1uZlFCWjU3?=
 =?utf-8?B?Z1M2VEFydDBrOWx4TFBJbG00UDQ3cmdKM1VYTC9TaXBCeVQ3eEFzTWp2ZE9H?=
 =?utf-8?B?UTd1cWxYVlV2WmYwempsbncwSVFyMGZRQUozUlZCTUZSQ3VlbFdhRU0yRTdj?=
 =?utf-8?B?eUlXU3RRK3dpOWNleEtUWkRkekRBM2VDUjN2cXVPVzB1V05yNGFreG81QU9S?=
 =?utf-8?B?ZFhiVTF5QzdHa1lZcWwreHBFUkdnK3k5YlUzd2NqRFVyZmExUWpyeGR1QTRF?=
 =?utf-8?B?d1FZTkVwUmFBZElCMTRyUElkamRwSXlEbHBMVFZHSjJiRGRCZnlwdjdHa0o0?=
 =?utf-8?B?VG0xWTJyWWppTDRXSlpBVWNnSnpTRERHOGViMm9yL2Zqb0xkSEJXem5nWmlq?=
 =?utf-8?B?NG1aUGoxZjBZSFR4VTdXRFc2L1N1ckdLUjhMcTBuWlpiTGkzTUJXNHp0Tld4?=
 =?utf-8?B?N1NEZGRsYnZZK2I5VERhYjlwYmFrbmJPNFVUSENQY1FTZ1pMcm1GS2hvM0hn?=
 =?utf-8?B?VmlWQlFzZU4rSmtlSnNlclNxRDBxNUgwcmlJYkttejhmTklDZjhIM00vcUdk?=
 =?utf-8?B?NlVNRXhXVXN0YjZwemtCOE5CSGtMWWhuVkh6RUF2bzJ4YnBjVjk5NHk2d3JX?=
 =?utf-8?B?M2pFSGZNUUU5cXdpWC9KNzZGdmxlYVcyS0JraGZsU3NUc0xCaTJ4VDJrT08w?=
 =?utf-8?B?UDV5TGZySUJ0blBKSUdRblJ1VXpzTVVQYmt1dTQyVC9IS1o0QStYNU1lZEJO?=
 =?utf-8?B?dXhNVGM3c0VNVitscGowUjVyZ1NHelpMR3JpdmZ0YmxxYVA2VkJEVmZlZXNN?=
 =?utf-8?B?OXR4WnRYcDNDZi9OMTZ6bTMwSVRDeVYwUXZSalJLbUZuVXJZeDRHM1VkMzFR?=
 =?utf-8?B?bHI5b2sxbnlDTjJybVd4Q01adk4zS21pLzZONGlFbEFXN2J2Mkx0eVN6SjU1?=
 =?utf-8?B?UG9MOGs3VWRESFgya0hRVm1BRVlBVGgxWjNabkZrTGRCQU5tMGFKUjF4RHFQ?=
 =?utf-8?B?SkZvc01YeCs4R2F4b0lZNjgzTURINzF4OHF1d0Y1V3JyWU45eUVkanlTeFBE?=
 =?utf-8?B?VytYK0VwbWpZbnIrM0hsQ3dSZWJWV0ZxTzR2N0hqUzErT0FDdmN5Z1g0UVRD?=
 =?utf-8?B?eU04ZUIxLzRTU3lWZ0VOVlY3YTdwUWdsR1laUUNzaS83VGZSZ2ZaZU9KSWpl?=
 =?utf-8?B?dGtHOWVvZGpoVzU2RDloVmlhZE5ZRktIcm5nNGU4VlkyME54WEMxeXFkOTg1?=
 =?utf-8?B?WkJsOERoOHhDbmZ1WU9UVjkrR2M4NkZFbXk2QzlHV3VEalQwNnJBRjFaTXpN?=
 =?utf-8?B?eWttUXkzRE5JUURSNmJlbjRVNzNvS0dMT0dXMXdxcnpzZnZRS3AySHJFZzEv?=
 =?utf-8?B?dU5hUm9GdHMvbFoyVmR6aHNlYmV0ckRqNFovTVBFbG9QY2F5anVQMlNENzBV?=
 =?utf-8?B?MjhGVEtqU0RHMGQzbUZXdU5ZTWIzcXJ6cFZzaWFOQlZmMlAySW93dndUTmRB?=
 =?utf-8?B?Q2JZbG14eGc1QnpCWDdIWkhFM3c4WU8vWGNGcHdnajdPcEpCSWRQU3dyaFpy?=
 =?utf-8?B?MTg3TWREK2tiUTNHbTdoemsrcU5jVzFOSVQ1VC9XSmozb2lZdkFKNmxqWWND?=
 =?utf-8?B?STJqUTRSTUF3eVJXcXNncy9ObXlUQ2p1cGxVSHNUbTFrWXBpVmh1a2Q2Rk1z?=
 =?utf-8?B?aEdQRnp0N0JtU3NwR2NIYnRVRlFGY2VsRnpra1pLMkJPSEJWSkQ5TEdJRGVH?=
 =?utf-8?B?RXV6MUkxTkNvZktpckV4NFhCNGtiaWxGVXRVWUFhc251OVgvMFQzeFY4ZE5W?=
 =?utf-8?B?ZzZiR0J6UGpzaE5WZmRUQm5FL0VIaGErMXk4QUhnRXVVM3l0Q0J3b3lqN0ZO?=
 =?utf-8?B?VTlNcFZQKzdZR3ArWHI4ZmZOOUhUTUgwTGJ6L2NSK2RhN3VxT1poVkZzWWJx?=
 =?utf-8?Q?knkaax/3x8cvqcqzsGvfb3M04?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2a3551-ee0b-4699-653b-08db5d236dbe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 13:24:55.1558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4V+452HzbtQLWCcNx7OWDyijp4X4S+DUqI7Wfhjd3R1Ix4s2448+QCIUKeO2WDzPik7dYwN+GIdSHpwqhJQSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9190

On 24.05.2023 17:33, Roger Pau Monné wrote:
> On Wed, May 24, 2023 at 04:44:49PM +0200, Jan Beulich wrote:
>> On 24.05.2023 16:22, Roger Pau Monné wrote:
>>> On Wed, May 24, 2023 at 03:45:58PM +0200, Jan Beulich wrote:
>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>>> console) are associated with DomXEN, not Dom0. This means that while
>>>> looking for overlapping BARs such devices cannot be found on Dom0's list
>>>> of devices; DomXEN's list also needs to be scanned.
>>>>
>>>> Suppress vPCI init altogether for r/o devices (which constitute a subset
>>>> of hidden ones).
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> RFC: The modify_bars() change is intentionally mis-formatted, as the
>>>>      necessary re-indentation would make the diff difficult to read. At
>>>>      this point I'd merely like to gather input towards possible better
>>>>      approaches to solve the issue (not the least because quite possibly
>>>>      there are further places needing changing).
>>>
>>> I think we should also handle the case of !pdev->vpci for the hardware
>>> doamin, as it's allowed for the vpci_add_handlers() call in
>>> setup_one_hwdom_device() to fail and the device wold still be assigned
>>> to the hardware domain.
>>>
>>> I can submit that as a separate bugfix, as it's already an issue
>>> without taking r/o or hidden devices into account.
>>
>> Yeah, I think that wants dealing with separately. I'm not actually sure
>> though that "is allowed to fail" is proper behavior ...
> 
> One better option would be to mark the device r/o if the
> vpci_add_handlers() call fails in setup_one_hwdom_device(), as that
> would prevent dom0 from accessing native MSI(-X) capabilities.

Perhaps, but again in a separate patch.

>>>> RFC: Whether to actually suppress vPCI init is up for debate; adding the
>>>>      extra logic is following Roger's suggestion (I'm not convinced it is
>>>>      useful to have). If we want to keep that, a 2nd question would be
>>>>      whether to keep it in vpci_add_handlers(): Both of its callers (can)
>>>>      have a struct pci_seg readily available, so checking ->ro_map at the
>>>>      call sites would be easier.
>>>
>>> But that would duplicate the logic into the callers, which doesn't
>>> seem very nice to me, and makes it easier to make mistakes if further
>>> callers are added and r/o is not checked there.
>>
>> Right, hence why I didn't do it the alternative way from the beginning.
>> Both approaches have a pro and a con.
>>
>> But prior to answering the 2nd question, what about the 1st one? Is it
>> really worth to have the extra logic?
> 
> Why would we want to do all the vPCI initialization for r/o devices?
> None of the handlers setup will get called, so I see it the other way
> around: not short-circuiting vpci_add_handlers() for r/o devices is a
> waste of time and resources because none of the setup state would be
> used anyway.

Hmm, yes, that's a valid way of looking at (and justifying) it.

>>>  And
>>> hence doing those before or after normal devices will lead to the same
>>> result.  The loop in modify_bars() is there to avoid attempting to map
>>> the same range twice, or to unmap a range while there are devices
>>> still using it, but the unmap is never done during initial device
>>> setup.
>>
>> Okay, so maybe indeed there's no effect on the final result. Yet still
>> the anomaly bothered me when seeing it in the logs (it actually mislead
>> me initially in my conclusions as to what was actually going on), when
>> I added a printk() to that new "continue" path. We would skip hidden
>> devices up until them getting initialized themselves. There would be
>> less skipping if all (there aren't going to be many) DomXEN devices
>> were initialized first.
> 
> I think that just makes the logic more complicated for no reason, the
> only reason you don't see this with devices assigned to dom0 is
> because device addition is interleaved with calls to
> vpci_add_handlers().  However it would also be valid to add all
> devices to dom0 and then call vpci_add_handlers() for each one of them.

Okay, I'll leave that alone than, at least as long as we don't see any
reason because of actual behavioral differences.

Jan

