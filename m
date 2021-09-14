Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E940B2C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 17:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186869.335621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAAZ-0000PC-Fp; Tue, 14 Sep 2021 15:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186869.335621; Tue, 14 Sep 2021 15:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAAZ-0000Md-CT; Tue, 14 Sep 2021 15:16:23 +0000
Received: by outflank-mailman (input) for mailman id 186869;
 Tue, 14 Sep 2021 15:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQAAY-0000MX-Cb
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 15:16:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7a9532c-d93f-4499-ad5f-9b66a47ea524;
 Tue, 14 Sep 2021 15:16:21 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-8HoWLGSgO7mgBzjrM5Rt4w-1; Tue, 14 Sep 2021 17:16:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 15:16:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 15:16:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 15:16:18 +0000
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
X-Inumbo-ID: d7a9532c-d93f-4499-ad5f-9b66a47ea524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631632580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7lBNw3GpzbaauOe9fp6xbD5cH6EpZcG6XxCsx0N7VeU=;
	b=Yrs/0RSxh/q2sX9MCdTirXdnv/1D1p3znEqv+hIK9eWQesoyjeHhqw7sLOb5jIZECLPWBz
	74al3y8uI5kd3OjGSjuXdlI7sy5gMGQPUwd1FgImvWstvj/dZ//YBl/8WdB/IQ+yy8laaq
	v/xGvC8ICJFUJBMVuOLEdeaMNuuyp9I=
X-MC-Unique: 8HoWLGSgO7mgBzjrM5Rt4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEcVrm8TeQKyMUzDbnpgBDmJWEddILKWPjVPsR+StOT0T2LgkrLrmQzyuU4lnJVAe8sP9HD9T5xntQNFd+UoMcyxc+7byrdxBrLdMXyKv5Nik20qQM8AHeBS869NbYoeahUFH+z+IlaoenBL/Ld3nJnevFsFQENZTp3rwKr4rxw2wcHkKngFKxOevrq1leNGpUyMo/MI8fL2LsMwedzD/594BrY+Sd4Ibdz4dmqHfj1/0kY3krX5hJsJsPPgauEJ4FM8wB+usB3F/HOiZv2aFXUdCpy0CBjbLKCrXwM6MIh450WdtoMOhmg2inu7kBJXhZIpNhbgPZDjKkMckLHhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RpA+BPFEAho6gwLyuh4KFPPGvMqgp8OhzuIrcaCHD5k=;
 b=KBqoeg6eVCIfzr2NLUwosfdcsT1J41FMuYpzGs3UbN1OciDerDxttBSc7xsnGaF2vXuzH+bPhEzv/c69W+SxVHxOHnsBffA8IkT1pQiseHDOZw/IjuEz0xmWCKq9UOItGP9Q4hecgfwTXyHfjgQ12T6DnoFG2uR/zrPp2W5OBFZ7CAlM7AnEIttj8hU6JRFR9pkmtXOwSDWNiD78Pm0LqWHI28/Zbsq8qHSaBY/yizDu1mxY6ab4KHAnweJAcRA6pWJfguf9P44Ys3+6Pa7MNIddUcaQgI+4V8yqFmyYJ5JBCva0birXon1iuJPTxnQ5O7hXAOgKSzZ9Y0iUG9c/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH RFC] vPCI: account for hidden devices in modify_bars()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6285981f-683f-a043-7025-993613eaea7c@suse.com>
 <YUByvkKO+NlIjB2m@MacBook-Air-de-Roger.local>
 <45e8ef36-3f7a-5cd7-e640-61e1c6d63903@suse.com>
 <YUCFxJnDoaVNgHiu@MacBook-Air-de-Roger.local>
 <df432c93-b722-6006-c3dc-7f511b377bcc@suse.com>
 <YUCwD5RWj0WKZZUc@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8b1b328-7887-cde4-dbe4-bdc43a1d5147@suse.com>
Date: Tue, 14 Sep 2021 17:16:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUCwD5RWj0WKZZUc@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P192CA0011.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34906484-4f48-4ee3-4e0c-08d977929a1b
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335E5F142E5216B6661483AB3DA9@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0OUNfLr3ndnyhFsNOOIi0eJlPETi0DLr4XUrT2muQODHTJKIykM8wsIjkt5zWvnTYQptmBoskjmVVHXkAGLlt9mOuOCV1q0JyqoTVrUlbxS/dKXy91DIwJId1VU0UmuOGYM5o+4L+eOGHNu29YWL1OEAsfruJ/vQegEaFZKJm8R4bCktpWZUbUCYu1BPveiK4JVAZFO+oJ7GAb/l3rkeZbXkqYisZ7WBg0oFZdZrhms7EHf8PKnr7Dh93oAkPY5f57LDv1UCp8g6oEH04GNyw7hRziHPXKmciFYTrMO9THW1jmKP/2dTE0wE4Aqo7tFs59W5dZPIQJaSOVjecVyUtr7iqDPF3V6XI2Iu6siqk1x01uzYQbzwWofgsSTF4CScDy0azTzbKChtqL6hpTtXHf3AQD8fRu+XmOINNJp+PtuZ9r7EAHO79teJPEE1WrOMNVSL3+UF4AYLRnEU68ibHjDK0l8oK5lZaZlivIM893+FbkxbNhIdlM//BTzvYEODd2mTLJV1FPlAyXKHUB5Z9U+BXXEuLsfu6unD2dD+luCW70SPxbhUutdo3HfdCFw0KmVbUiLcUW8QsfOcg/U+wdPRTY5oPelJ8uz18mRaOYFtP2ZJqedmG+tlJOKjA11LTBKXY4NwsIijrrg52x3I4GYsSuU0KTRNPqJMPxUtj/OkkM2h8LZsZroClCFKma245fUd6KlegDlRhqsmbXXlPXjnlBw7xmsdq4ORR3RDComhDV19AlAxjU+LNQLld2Lh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(396003)(376002)(366004)(5660300002)(83380400001)(86362001)(8676002)(4326008)(956004)(66556008)(66946007)(66476007)(2616005)(316002)(16576012)(38100700002)(15650500001)(6486002)(36756003)(26005)(31686004)(6916009)(31696002)(53546011)(2906002)(186003)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aH3SOYFuTBDVrjyxBugqdiQ1F5Gg3ORqSTfP1vKodnim2/qotz82WkuOGrYF?=
 =?us-ascii?Q?IRCIi9CM2T6n//vpeTAVPVdcLw8n3JDfxOD0VXAkYFcM9WtIHQmymv7YqevE?=
 =?us-ascii?Q?XpYLkwfH3ynq2U+lA4lJIy67NGhQCEL1P2yGu7Y2XMDKMSIGvE3ilxOhlO9d?=
 =?us-ascii?Q?/Hu5xWMn4JN3vrDONrZN2tGWYcYZW6zx6TyEyMbj9LTCcohUHOYGmanqpLz8?=
 =?us-ascii?Q?qV0iLmwsY2tUpyVXZDD8spwT5NlSM6mqRQgNFNqnYiS+0XMhlkzxfy8BHUkV?=
 =?us-ascii?Q?3H4mCGBco/2NJC7nDL6LkJxHe4CtXoQFMAiSUEmLXLXywSyI9wbo2YLtMrF2?=
 =?us-ascii?Q?V5KYL7nvyBlK+mVrfMGhEYItNQI00TGiPcttkl5icKw8g7g/sKL7a6ABy4wE?=
 =?us-ascii?Q?OBIc1paZkuu4n7dbi3bvAoEwo2NgcXxLS4WsKRTdSP2GXRBs+yCw7oVMcfYx?=
 =?us-ascii?Q?D0pvQfQsYgKv1Nxy3wC0pFPpohwyhEDPC2p0jvMsG1PCIdE7hRwXZdyxb6aG?=
 =?us-ascii?Q?+vt6/HRTE3z4kAKo3I33F9RNImq8VAt9BWNlPS8p1RdMRFCSayhBbwIJvh51?=
 =?us-ascii?Q?0eYwYzd7ZWzetd/+7qzkDgXzYTbYTOVe2SStI4ezDZbOev+V5SN/5OpQArhE?=
 =?us-ascii?Q?imzRIg4PpO1wlYlWpf8MxYaqZkQ/gC/Lwd46s4AvkjJfVW3KBiyw+GYsA2hS?=
 =?us-ascii?Q?zdEItPkrFLBZYH8V39I4gp0HsTq7n8YqBr/eU6O3ZaJpuK/s9a6R6NYaAmqV?=
 =?us-ascii?Q?/M/j/d72K7OL0HuyHikux7/Q6iV31ZxCIMG7FTHeZyVbi1MW3LEUcixLE15z?=
 =?us-ascii?Q?8543tL6Lb2SSFmRqRNXiqeUFnF7hcI/XGI6iB6R0f/A5hQZhotBvKQjXlHEc?=
 =?us-ascii?Q?HEdDTbdN3bXoyarBJh7bfJRBcPXWeosPE5m5vKRpQEOPg4DhbqcCWAonduJ6?=
 =?us-ascii?Q?rwFR2X3I6nKKT+Dd8hUWEom6J4AuRF7CTkm1vo9l1XQv73zz3KHHhYP3vIte?=
 =?us-ascii?Q?c8rOyhKnTm55n0SyUDbPbJBt0Eey36xOMWJ19LjxPQSDIdJLNx3vx5/anHhb?=
 =?us-ascii?Q?16BPVUA1qRaREbinlYYafd5rTmf25nGafFUbqXopC3zH5DwivjwTywgW1Mrw?=
 =?us-ascii?Q?qUBbSKlyZdQzHwnnj7pRKKSf+ubTmdvtpQO332PMtpCfaxySu8c9zOt8Bm4J?=
 =?us-ascii?Q?35T+3xcDOzkTOEaUqZ9nBKvcg3WPejIJPoy1k+zY/k2caDCndh5ox0XBXXRe?=
 =?us-ascii?Q?Z1bGZIUY7E6LimeqkQ81RQXT/L7RSOxElK8g/WyXM9Fidj5Nurg7svKqo8/1?=
 =?us-ascii?Q?l46CleVd8r9E8z3oYoznaeyk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34906484-4f48-4ee3-4e0c-08d977929a1b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 15:16:18.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhfBy44hdnjRMkzcOMHE+QxpziyhPGR5G5JCjdwbb0hzBKfoSWg7j2BB1xfe/v7Ir4K/E0tibtvgjquVVb9c4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 14.09.2021 16:22, Roger Pau Monn=C3=A9 wrote:
> On Tue, Sep 14, 2021 at 02:05:01PM +0200, Jan Beulich wrote:
>> On 14.09.2021 13:21, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 14, 2021 at 12:12:12PM +0200, Jan Beulich wrote:
>>>> On 14.09.2021 12:00, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Aug 30, 2021 at 03:04:55PM +0200, Jan Beulich wrote:
>>>>>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>>>>>> console) are associated with DomXEN, not Dom0. This means that while
>>>>>> looking for overlapping BARs such devices cannot be found on Dom0's
>>>>>> list of devices; DomXEN's list also needs to be scanned.
>>>>>
>>>>> Thanks for looking into this, I certainly didn't take hidden devices
>>>>> into account for vPCI dom0.
>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> RFC: Patch intentionally mis-formatted, as the necessary re-indentat=
ion
>>>>>>      would make the diff difficult to read. At this point I'd merely
>>>>>>      like to gather input towards possible better approaches to solv=
e
>>>>>>      the issue (not the least because quite possibly there are furth=
er
>>>>>>      places needing changing).
>>>>>
>>>>> I have a couple of questions, AFAICT we currently hide the serial
>>>>> console and/or the VGA adapter if it's in use by Xen.
>>>>>
>>>>> I wonder whether we need to add vPCI handlers for those:
>>>>> setup_one_hwdom_device will attempt to add vPCI handlers to the hidde=
n
>>>>> device because of the temporary override of pdev->domain done in
>>>>> _setup_hwdom_pci_devices, but I think that for hidden devices we
>>>>> shouldn't add vPCI handlers. We should instead block PCI config space
>>>>> access from dom0 to the device so that it doesn't mess with Xen usage=
.
>>>>
>>>> The answer to this follows (I think) from the one below.
>>>>
>>>>> It's also not clear why does Xen want to have those hidden devices
>>>>> partly controlled by dom0, as it would seem to me that dom0 interferi=
ng
>>>>> with hidden devices in use by Xen can only lead to trouble.
>>>>
>>>> Dom0 can't interfere as long as it can only read from the device.
>>>> Restricting accesses to reads is one of the purposes of "hiding"
>>>> (the other is to make it impossible to assign these to a DomU). Not
>>>> allowing Dom0 to read from such devices would lead to wrong PCI
>>>> device discovery - some devices would be missing (which may or may
>>>> not be merely a cosmetic issue). If the missing device is a multi-
>>>> function one at function 0, other devices in the same slot may also
>>>> not be found by Dom0 (depending on whether it looks at non-zero
>>>> function numbers in this case).
>>>
>>> Hm, indeed seems possible that missing function 0 the whole device is
>>> skipped.
>>>
>>> Maybe we need a special vPCI handling for those devices that just
>>> allows reads but not writes, and that doesn't maps the BARs into dom0
>>> p2m?
>>
>> Not sure about mapping. They could be mapped r/o. And they may
>> actually need mapping for multi-function devices, but I guess for
>> such devices to actually function properly then there would be
>> more work required.
>=20
> I'm also slightly puzzled as to why ehci-dbgp uses pci_hide_device
> while ns16550 uses pci_ro_device instead.
>=20
> Is this because the PCI device used by ehci-dbgp must be shared with
> dom0 for other USB ports to be usable, and hence dom0 will need read
> and write access to the device PCI config space and BARs?
>=20
> Note that pci_hide_device is less restrictive than pci_ro_device, as
> it doesn't mark the device as RO.
>=20
> That would seem quite risky, as it's likely that dom0 will perform
> some kind of reset of the USB device and thus the console will be
> lost.

There's actually a protocol to prevent exactly that: See PHYSDEVOP_dbgp_op.

Jan


