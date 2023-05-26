Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383F712055
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 08:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539967.841349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2R6o-00059E-Qw; Fri, 26 May 2023 06:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539967.841349; Fri, 26 May 2023 06:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2R6o-000578-Np; Fri, 26 May 2023 06:39:30 +0000
Received: by outflank-mailman (input) for mailman id 539967;
 Fri, 26 May 2023 06:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q2R6o-000570-6o
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 06:39:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e3f2fd0-fb90-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 08:39:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 06:39:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 06:39:24 +0000
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
X-Inumbo-ID: 0e3f2fd0-fb90-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIFaFhV+3QKJxn5Mq+71L9sFoQ8u15DtJFRqJY+GjIgYAIyhxIlt7n/ELHLmtPQ6ldBiRruiKzb64DcyJLAuN18PcScOezvBl+H23zDtD3bEAM9IGrBn0ETUtGuD/0pb9erra6fuNNrxfw0eAbsh/l2+rieYcji5O0zWcBYCR/PMBrK679XDYA1soziExnf4R4Li98NW+HhwZEJWBsCOH+n7B/vx4AcTEFqwHcIOeUddnNZwrptxASE+5ZC9GRUN85jtsgcsPncPBpJcx5KGFIVU7FWQ9qtHaNogu3W8nWHQUBvYY/Vaw+CBUhXfBA9HapgQVzRK7ybQYqkXFLC+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtSzzzpng+FxZ8tPNm+1f4rXVUhvSlo2x0OWjzc0ykI=;
 b=AytSRLiZxskjmH3onJC1BYkbZxTU4OYi9isfNqv3GyGWB/fi3Oc2yHVWXdAwjgECXQkPzNhtGx9xlqjnAavp32To+qWAgKDbjmGrqA8NI3do4ozVlDkUZz6T/vB3p2jS8PEPug+jZwe1QPfaCS+MhuZuWKRBHE/csyECobagGqI70UH+wiifa7MQA4w3hT3P9rak/AgRriYqiMm+b3p4GDFu8VUF1kq5UV3a2dUTD4D05gLJZXobT8Q+0miMXy6zBmBAhw8byEDkvFq6/1ImhI1z7OQAIj1/4S8PXb6oziZ7lymHK9p2X+pGyzA9F7DzrZp8sUKo5ymXzhs111wEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtSzzzpng+FxZ8tPNm+1f4rXVUhvSlo2x0OWjzc0ykI=;
 b=m+Ejf1/mewFSt6pF5chihC+TgqnFPWGat83xxYeONCmfw29R+fRkTTzx/fsrUIlu2a5iwkGil5Nl55fw8Lpm+iIRRWxaVpg1PSKxDVGNyE3TmoJzG3suAI6Sej693OTZtV5I596DzysnIgHbfTIS5zXkHXgh9Mu4bQO7PYokIotrHEFixHVB/YQLftzZXacL4ygXCGw+Yo6ANZDKzOolntU1KD9kZ+aQGlRZMmRwAKfWD1TlT/FzLm7TwxfUG54HW6BOxCZTZFIdq8Aq6ARxyWk0g82X8Llv3Dol+4f2oigWuzmy5spmVkh+IES/ot+xpBzDCwIqt6Y3DC14xELfgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22f1e765-891d-ef2d-01b5-e9dfe6ca895b@suse.com>
Date: Fri, 26 May 2023 08:39:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v2] vPCI: account for hidden devices
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7294a70c-0089-e375-bb5a-bf9544d4f251@suse.com>
 <ZG4dmJuzNVUE5UIY@Air-de-Roger>
 <614c5bf4-b273-7439-caf7-f6df0d90bf87@suse.com>
 <alpine.DEB.2.22.394.2305241627290.44000@ubuntu-linux-20-04-desktop>
 <8956af09-9ba4-11bf-a272-25f508bbbb3c@suse.com>
 <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2305251224070.44000@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcfb854-f985-4a1f-550a-08db5db3f1ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BOx6YjxBRhCd9+0XA+qjtEUiLX0nE7f3ACp0cUO2WBDaheBskuLNgRVO39p45QmcQVJmCnXY/QThEAHQaBCPaVwgQMLWb1xyHGHLeuVOMVi2CLN32LdrNJs3wi9oDbqNRAI6eTGPqNiJECxJn3xJXqiUDYRok0dacHld70xawksRcq8/wdENK+SU+exqw7Q5z6i+oxIqpIr7ZLpCgR+jzyfwEFo/SWDIdYUiWReRL6zx2VxY25YPvYPmTWbCA3EEByokfVxHdhINoo5fGLooERRJiyM3JQNFh08EvPyJ6964VG4sbwrvvwE7MuIcxjr5Ui1POMU8WwhskvN7jSo3nSxwO8J0dCxSvHO82+DjKQZ6wUAjsVw7rki7oEebOp4xM/d22WDpUhSvoFr71NwyLDrc0sPTjSdu+a/lz8JQzfYzBS8Io9T/WJCRNyBEVAa1e3H/LtrLhg1+RpwIYO60tWE6MN1sC5/SxugDKBKyLtLsWvdA9gOUdnc7/CQ4AccQzvxmsBAt5l9aSmYYpSz7+LTG+TKLgZ3lW0O8p2E3LMGFnMU+ALduWbgtyE7uuf4Zhr3w1dtN7FlpORkEHJcFdI3dFPiGkMMM9cpcq0NMvUEdOLE9AUlJXlT2nRjdunVKV1LsJrcYZ7yVv3KQl2hAIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(5660300002)(31686004)(54906003)(478600001)(8676002)(41300700001)(6486002)(66946007)(6506007)(6512007)(66556008)(6916009)(66476007)(316002)(4326008)(26005)(53546011)(8936002)(186003)(83380400001)(2616005)(2906002)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qkw3U0pOVTcrcGxqSlIzTWpQcjlLZzgwU3hySmYwK3cvSmJTTm5VSlZxemhM?=
 =?utf-8?B?ZUZzZjJLWTU3aHgyM0JlWVpCTkV2S1JPUk5qVmg3QkFMSDRPRGZ4TkQ5WHI3?=
 =?utf-8?B?R3piRWgzUlFDKzhGR1crdmZtUHNUQlhHQ3FjV2gxaEM1RHVLSFBSY0FRajFk?=
 =?utf-8?B?OXlVU0JKaHZpdmNRY0VXTGVCaFQwcTZjTXhOYkJ1R2x1bGhiZlRBTTcwWEh1?=
 =?utf-8?B?M2NtaDJLaFRQZFAyMUpxbmNxbWZqbEU2NnVlQ3UxYi9hRjM5SWVibXBnMlhq?=
 =?utf-8?B?amhJaFdoNElXYVU2NXRKWGZQcjNQVzA4UERBM1pXMDUyWDRrQjNCZnpMQUVu?=
 =?utf-8?B?c2NDQmN4SmZOdnljM0VpRmNFazdpNHhJRVdlQjZOQmNMMnJvc25NZlgyMEVB?=
 =?utf-8?B?QWZPbldtSkhETmhNSEtKR2J6ejJtcGVtNXdWek1tK2RrK1JwSCsrOVJKVnRG?=
 =?utf-8?B?ZllqZUlEUDBlcW9mUWZWQzNtdG9MKzJyZ3VuQUhGZGpwVVgxR3Q0blYwOXVK?=
 =?utf-8?B?aTc3MzZTQUZqU2tBR3pMRElkRHVieXMxQ3NBWU9vVXRmQ1d1SDR0Q051Z2VP?=
 =?utf-8?B?bXBKVWI5WXlLRXI4RnBFTnlXMXozdDJmeUN2VVR4bktWSG9RRkhaRXl3S2hW?=
 =?utf-8?B?Uko5eFlTWW1FaGFrbk5mSG5VUjFFN256RUgrRTU5T0RaNER1K1FDM0sxUHk3?=
 =?utf-8?B?d2lyemdTQU5ieXN5SkxNUExpbS9zQ3dCNXUyUTRMODd3ajNaamlIL0R5RkVO?=
 =?utf-8?B?QWJDNEkvc1lwSjZ1SGFiVTUxRDVvQTMrNTkrYkpGb3JBSFRWN2JiKzFWTGZF?=
 =?utf-8?B?VGtsTkkyNmZ2QjI4eVJFMTg4bVFkWDFsNkE2ZkRsejRiZ09TaTZDbVlUVldy?=
 =?utf-8?B?c0R5WFFqbk5Hb0h6aXl6bzRPeW5EajFYM2JtYnNsTGxyb2NJZ3VqMjFoYnFj?=
 =?utf-8?B?VTlPczMvQUdGYUdCazdFUVp0ckxSNXlPdjVRSlBvK3lXNzFOY055dlVPY2l2?=
 =?utf-8?B?bFZxV2pnVHcyaDZhci9MRFJyVTJMeUFvdE1YQjBJdlhlWmFSUjZYaUVhbVdy?=
 =?utf-8?B?ZDVkdW5FOEIxT3B3WlVENkpOMU81OXRaMnVTVENkN2RCbHZCODBPaWVMWTQy?=
 =?utf-8?B?NU00eE1icnFoUmhtY296S2JXVXFaMndiRzc4ODFFdjJhVnIrVWNDbGxzRG9u?=
 =?utf-8?B?K2xPbStNdDEyeExaQ3lvRW5EYkU1eVVSQnA0djhVbFZJSkxUbUhBelRIVGpZ?=
 =?utf-8?B?RkdFRFZ3dzRRblZIMTdXQVN4cDZkSW1odm9Ud1pwVjNsQ2QxL2huU2NXZWow?=
 =?utf-8?B?L2lYNzJkdnpSOHRSWGhweFQxMGVoZ0Z0eGF0SGs3cmQ1OWpHSFFVdzRPbzFx?=
 =?utf-8?B?RVBNdkx1eExjQm13UmxtL09hUkhPcHpHVjJqQUNnSnpMNnkxb1YrR0EveVVh?=
 =?utf-8?B?MGtpMVZqcXJ0c1QyR1gzb1cyM0d5UjdzYStManlmNGVHNVVWNm9YOE9ZN09i?=
 =?utf-8?B?NHRBc0tiSHVtWi9JQ3N5SnhtWnByemtoSS8xcktxYi9ReEh1cWFwLy9oQUoy?=
 =?utf-8?B?TlRzVHJhRUZvMW83OFVKd2U1aHFLQXVlWVJXMkFpblM0ZWszVHdUaXJuTFJj?=
 =?utf-8?B?aFcwNDNlVkJSUVdkM0dxeU0wOGRwRWhJZVJxcnZ6Qk1jU2w0UGtFNUFEWHcw?=
 =?utf-8?B?OVNJMjh4S1NnaU42c2dyWnB2YlRRRnJ0cjZWR2VxY1BPTFI3RUJld1ExMkhh?=
 =?utf-8?B?VUF4QlcxOVZwajN0QU9STGszUU03Z0hNMmF6NkZJcWpRbVgvL1M0Q1JuS2VS?=
 =?utf-8?B?K1ZMei9GTWRKN2VjYWtoVERuQ3NBdTJrWTY0dEs2aml3WFFSWmFscnRQSmhh?=
 =?utf-8?B?K2hRc2l6UVA5cEhjM1ZsVWh0blV5ZUY1L3kzQzBjVC9PQjA2cG1sTHlNeldB?=
 =?utf-8?B?aHY2MnUzQmdUY2NFSGxnV0MvakR2VFNwb0lrQ2Eyd0lzSGtUWVY1VllSUDNZ?=
 =?utf-8?B?Q1VwMWpKeXZ2M1k4Sks1N1JxRjJEZDErV1RHZzZRZTcwMWV4dVFwNHM3TlJz?=
 =?utf-8?B?MGdCM1QxUFJrTzhMZXBWbXRRaWwzUUlwaTBQTjdRQXRNcHVtblNQeCtWMnFy?=
 =?utf-8?Q?7hROfuXVTqKGJMiTgoOdG9N8T?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcfb854-f985-4a1f-550a-08db5db3f1ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 06:39:24.2148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV5IetxGFlQuysfL3hC+c6TaRy2xfDMsEEKgquNJ0vXVZ7uZShwnHoEl+0sx0hsr9Ve1XkJiujbhsIckYgrTTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

On 25.05.2023 21:24, Stefano Stabellini wrote:
> On Thu, 25 May 2023, Jan Beulich wrote:
>> On 25.05.2023 01:37, Stefano Stabellini wrote:
>>> On Wed, 24 May 2023, Jan Beulich wrote:
>>>>>> RFC: _setup_hwdom_pci_devices()' loop may want splitting: For
>>>>>>      modify_bars() to consistently respect BARs of hidden devices while
>>>>>>      setting up "normal" ones (i.e. to avoid as much as possible the
>>>>>>      "continue" path introduced here), setting up of the former may want
>>>>>>      doing first.
>>>>>
>>>>> But BARs of hidden devices should be mapped into dom0 physmap?
>>>>
>>>> Yes.
>>>
>>> The BARs would be mapped read-only (not read-write), right? Otherwise we
>>> let dom0 access devices that belong to Xen, which doesn't seem like a
>>> good idea.
>>>
>>> But even if we map the BARs read-only, what is the benefit of mapping
>>> them to Dom0? If Dom0 loads a driver for it and the driver wants to
>>> initialize the device, the driver will crash because the MMIO region is
>>> read-only instead of read-write, right?
>>>
>>> How does this device hiding work for dom0? How does dom0 know not to
>>> access a device that is present on the PCI bus but is used by Xen?
>>
>> None of these are new questions - this has all been this way for PV Dom0,
>> and so far we've limped along quite okay. That's not to say that we
>> shouldn't improve things if we can, but that first requires ideas as to
>> how.
> 
> For PV, that was OK because PV requires extensive guest modifications
> anyway. We only run Linux and few BSDs as Dom0. So, making the interface
> cleaner and reducing guest changes is nice-to-have but not critical.
> 
> For PVH, this is different. One of the top reasons for AMD to work on
> PVH is to enable arbitrary non-Linux OSes as Dom0 (when paired with
> dom0less/hyperlaunch). It could be anything from Zephyr to a
> proprietary RTOS like VxWorks. Minimal guest changes for advanced
> features (e.g. Dom0 S3) might be OK but in general I think we should aim
> at (almost) zero guest changes. On ARM, it is already the case (with some
> non-upstream patches for dom0less PCI.)
> 
> For this specific patch, which is necessary to enable PVH on AMD x86 in
> gitlab-ci, we can do anything we want to make it move faster. But
> medium/long term I think we should try to make non-Xen-aware PVH Dom0
> possible.

I don't think Linux could boot as PVH Dom0 without any awareness. Hence
I guess it's not easy to see how other OSes might. What you're after
looks rather like a HVM Dom0 to me, with it being unclear where the
external emulator then would run (in a stubdom maybe, which might be
possible to arrange for via the dom0less way of creating boot time
DomU-s) and how it would get any necessary xenstore based information.

Jan

