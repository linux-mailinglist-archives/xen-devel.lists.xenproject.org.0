Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A684D34E6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 17:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287995.488378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzWw-0004uL-HX; Wed, 09 Mar 2022 16:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287995.488378; Wed, 09 Mar 2022 16:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzWw-0004rK-DR; Wed, 09 Mar 2022 16:51:18 +0000
Received: by outflank-mailman (input) for mailman id 287995;
 Wed, 09 Mar 2022 16:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRzWu-0004rE-TB
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 16:51:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21a78567-9fc9-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 17:51:14 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-MlRv7jlIPNaMJ9hzyEaO6Q-1; Wed, 09 Mar 2022 17:51:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2456.eurprd04.prod.outlook.com (2603:10a6:4:36::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 16:51:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 16:51:11 +0000
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
X-Inumbo-ID: 21a78567-9fc9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646844674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PMwHWffzDw/GeAFdOMFYMJ9ss+Rv7j7HmiSshrB04oM=;
	b=BUWDFzo+s0W862QAiLjXxZylWpScE1hlK3fuZnu3dBlLopgBZDfsQ70Fba7e/anK/iTP0M
	QI2gGJFkUTMHn6mVDgN3h13iZNxSdfy9IcXeb3MFuAbgK7THJq+XpyM30lEkrelXHu6V6e
	opaWY5du2e8wJ7oMSDk3X+GZISMsQwY=
X-MC-Unique: MlRv7jlIPNaMJ9hzyEaO6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrRNqlP0mYjH78qGBNIMpzaNwT/D8zMhE/7BaTGI7OFe7Zn+wJBzTAzgfbwe77wX4Mb2UJd/UJlhAbwmbvkpjrxjYGqyLKSua2bOdjT1RZeM/2qDaHc02pLtV/e1H9zCjdFeKnokJb+5mkrkm9SiJeOPtwkeUXnEEOnBIZbk4VUrsbfICTbSO5vLz7cgGv78XJPB7+oDhdNWkk/BqPM1Ui+/fHytn26vs6y7P7vwOrrXQ7a6dXqhbKsKGt1S09az/446e9g/Py1yt/1ENbLs8aKiwf5yuIUMHwzvmgTbHBGJVXfizu88pzl/JlSkLuYdEZyEZ9ncqCuynpvxH5N3kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLPS/wVVCoDXLowyepZvmkwXjJYYDG864o8BNNVCJzs=;
 b=aTg1ug4fTlV2BiPsupbIxIIKfNnSJGCFNNnvxXADvrDya+7w/PpNCoy293t4D7dafDlZR4xwWVRGgcp60OEaJRyDLQIiriP6wnFAgBb2rjMRrRuZVSFK17xcF/p1jWxysG4e3oBlYskQCltYnVyyVt0DJAMz6t+PQle8DYg5wLu8LZ5p5q+BihM+WzzBNJvtp/JbnmHaITheMmd25zPEnq07WzoOfAiUkZtthja5ufMCpAu0O/xTJ1pQjvJVrM4vws7/Lt7gbjBUMvLrYHdXUkiGv/8Gq8F8feiC1UVYM+rqXKxhT6B5B09FKkRsmncezYG+yKjO+kUL3sYNqK9jEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e771892c-f02e-375b-fff3-a6cff89559a4@suse.com>
Date: Wed, 9 Mar 2022 17:51:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
 <YidM/Wu5lqF48zg2@Air-de-Roger>
 <81dc2758-accc-25a3-7b3c-d9988757dd0c@citrix.com>
 <6a0f4d8f-581d-20cc-07bc-ffbf9a04cfe0@suse.com>
 <8ac6ad1f-de2d-be1b-3639-34effe85bd88@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8ac6ad1f-de2d-be1b-3639-34effe85bd88@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 634a10c2-b391-44e3-437a-08da01ed0412
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2456:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB24563B4F92236128F0798966B30A9@DB6PR0401MB2456.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UOgZ3d5yD4f0rIUAUARDgJO0ZNaBJ4La+dw39xHb9unrZQ7GGqLWkOfEWgdgFxp6sVn8uaIpcB+w9hbcn1QMviejbXUTWMeSpsJ6n6J/BTQ0kb6D63YUU0jHjNjPcPDExIXnmsuyMuiEjUE7HthBcbOAfZolZ/F6Br6zcVnKQ5V6ZGb2099JviNM0h38MLdvL1EtL2EcgIqp0DE4iw5e8lazgTqmRhMIuABXYayBpCvEdotncGnDhP02HZyWY4iaPAH4SNEF5M/x8yXT6nj36ItqxlNT40lOrhpmxxIriK6+yIv4qXKAEYTaahHAGB//Fke8VCRU3cbSqr4gU2a1tMG4LbXygba27fft1/tCA6p1sjhc0PqggU4QdSO7lK2yodJBKjUhhQ54kArRIoRYFUBBOorHUwOS7NS5lIGjBI8+HMWUyH1u0y66BSIihkyZjXsdU7ZiRi6p5GwYjFjitDkl+jZ8fSTQS9wo9oEKxy5AUoi6oy5dJikTc4eOfGq2w6eb0LTzgeSyPInC+XF0iMhBubb8N1y+IzgNckCAzbqgVawjII8OvY4kVD3RB+p1zF06/o3ScOj5n/SCPsNQTEhFXJeN7Zy392w7Gmrh+kXTjaRfNSU7w2LCzQ2AUfSQxt5RNIYj6+LZb/XCCfTHzpmbasfUEzUSBoAYa/g0fm1tyA0d/9WfQNMN5FCDQ7bJGzOcgdGT48X/d2RCFst0UHUn9AuCBPmmwcdTFlBPJ1c/PHMxsUhM3st8GOm/XNzC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(6506007)(53546011)(86362001)(508600001)(4326008)(66476007)(66556008)(8676002)(316002)(54906003)(6916009)(66946007)(83380400001)(2616005)(186003)(26005)(6512007)(38100700002)(36756003)(8936002)(2906002)(7416002)(5660300002)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eWJVW1KsbiVoFSyjF2x1iOzq+znX/JIN9i43APmarpO7zVf7QWLk+/3wX4zJ?=
 =?us-ascii?Q?OyqWOuJYUqWBDUdLXUhU6X0P2Z5/X2oek18sAe09piFVBbRl51yLSw5VCWmn?=
 =?us-ascii?Q?QFjrMsDyfWthy6MvFesVlVzFGvmdp+47o8nbuIpKCXmaFnjwoyLTc+ffQ6fU?=
 =?us-ascii?Q?WQSnah3TYL9Swv3jvS+OauzIwLhD6trBzhhsoU6TPqh9cl0PFqzn+oViH1t/?=
 =?us-ascii?Q?MnQABp/AjMgQT3kAHhOsW1+tfEJ3trFuZmtMuacfhGPJxinGFsmnb9e8wazm?=
 =?us-ascii?Q?0slplBxp7poo/jYjbx0OYAOZLxqII4j2ht37GSRl7oMtjKeNRcHfJo32aOqK?=
 =?us-ascii?Q?F/E7WQuAJJS6i5dJwF+XgbdE2/3A/PZrZFkrhMEbUM89JUDiAXeyO3Rvih2+?=
 =?us-ascii?Q?PeyCtNZBlf+7e6dqYLB31GJYdUrnNEUllPYCKVV9dufG1VqwhqtPeQrUExOs?=
 =?us-ascii?Q?I3kReZy0v+RE3M64lweuWUnBzZ3BRRO4BnYnUS+lrUtJZqyRQbSXoIG1bAJb?=
 =?us-ascii?Q?eCh29++Se8MzQnhhI59fVOtcDJUyv0eZB+74Q4YGscUHFEwGbzKazXUuoNyy?=
 =?us-ascii?Q?yPQP2jtE3TrpB2kauLVp8G2hWfGyESJ+CNzYbwW7E1Q187ZQmyW8+ziV1yt3?=
 =?us-ascii?Q?WUZlJY+bYHxh9TlWRv1Y+wk8pZGn53esZRF7RVuSPulxKiEl2oxYvZ2xDRAN?=
 =?us-ascii?Q?afH0jxosSqBTU+BwFUiPxoa/1IJJy4VG/gBf71wI9nFX+UafnAsbu4luSrg3?=
 =?us-ascii?Q?Q29lyjzutCLY25qh23a7IuYjuACkNZ5kqXFU1YFj5oL7pwBA0rpEAE8mruXm?=
 =?us-ascii?Q?nQZdqY12jlQ7p3vy9tpQY/4TsvMONZ0KOFjiW3PvCTcvePC/tw8laSaacyQQ?=
 =?us-ascii?Q?iUpm8H9qREDYpFku0CgUMmmOfaPKUOFn9bxWKWP+p+T30qF6zMki4WAtkOcz?=
 =?us-ascii?Q?0V4owFCtrFFMynIQ+zA6M5azDbx8kS45g5ajN5Mb3BAw5LgKgmBMD1CpSM66?=
 =?us-ascii?Q?YJKQkoSOu5NO6aHdq4aInYhxwnGxmhMOmulg4sPM8a86vckvDr2jxs7yFgL7?=
 =?us-ascii?Q?fTcKjOZvE4VhdJNMy+Wye9PIZ2Kie3DiRMIr6Ubv7ThUAcdJiG4V03hjweFA?=
 =?us-ascii?Q?k7j2A22GLvPWqqD4RAmYwBR/6hGHbti0XSvnxNYnldIr0SmOs+bToRinz15q?=
 =?us-ascii?Q?9vrTIhKb4eGG7sFpmCExa99K9tZKv2JKfEqE0Qng5Spqs04RMzQOJfl69Nya?=
 =?us-ascii?Q?UuoXk5HcHEhl5leksGhptaF+zvutg1HPLPgS8H2Ev4qqBCBvZ4VoOnn/BG6h?=
 =?us-ascii?Q?IVjC/5/3YJZhP4W7APLNsEQ6Sb/8YmZgSwE6/DdukZnzfzd+osWrG94EpKYG?=
 =?us-ascii?Q?okEd7Nc+LBmZrPnaZVWun/giGVnbyN/Xc3sLtuJzbbv1TtaiN9eGwQYWg8L4?=
 =?us-ascii?Q?jeaeoVf7ibQGkdphf+CmLkQGt/OhP1iDbH0V4nDUfRAzHjLRPj3t09N++yU8?=
 =?us-ascii?Q?vfpqhP2lB3S3v65ANfTqYvjnzKw+etxTQHzbw5NdZzNLiKTRaQSRlQPStN2f?=
 =?us-ascii?Q?f+OcfFD/MN1y2zMW/1dM3q/gdg13QaLeCs9SGXAiuPhgkNo64TRBoTic9ulY?=
 =?us-ascii?Q?OscC40P7NnrC09+INrZt2hs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634a10c2-b391-44e3-437a-08da01ed0412
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 16:51:11.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2V24Dk3HiMi53e8DGb8coz8SdLaz865MD5mtdWVhW+t61KNBAZAoASFj3jLGDbrY4zS3nycK4yhHr6LRsbi2+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2456

On 09.03.2022 16:56, Jane Malalane wrote:
> On 08/03/2022 14:41, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachment=
s unless you have verified the sender and know the content is safe.
>>
>> On 08.03.2022 15:31, Jane Malalane wrote:
>>> On 08/03/2022 12:33, Roger Pau Monn=C3=A9 wrote:
>>>> On Tue, Mar 08, 2022 at 01:24:23PM +0100, Jan Beulich wrote:
>>>>> On 08.03.2022 12:38, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
>>>>>>> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_do=
mctl_createdomain *config)
>>>>>>>            }
>>>>>>>        }
>>>>>>>   =20
>>>>>>> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
>>>>>>> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
>>>>>>> +                                     XEN_X86_ASSISTED_XAPIC |
>>>>>>> +                                     XEN_X86_ASSISTED_X2APIC) )
>>>>>>>        {
>>>>>>>            dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>>>>>>>                    config->arch.misc_flags);
>>>>>>>            return -EINVAL;
>>>>>>>        }
>>>>>>>   =20
>>>>>>> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
>>>>>>> +    {
>>>>>>> +        dprintk(XENLOG_INFO,
>>>>>>> +                "Interrupt Controller Virtualization not supported=
 for PV\n");
>>>>>>> +        return -EINVAL;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if ( (assisted_xapic && !assisted_xapic_available) ||
>>>>>>> +         (assisted_x2apic && !assisted_x2apic_available) )
>>>>>>> +    {
>>>>>>> +        dprintk(XENLOG_INFO,
>>>>>>> +                "Hardware assisted x%sAPIC requested but not avail=
able\n",
>>>>>>> +                assisted_xapic && !assisted_xapic_available ? "" :=
 "2");
>>>>>>> +        return -EINVAL;
>>>>>>
>>>>>> I think for those two you could return -ENODEV if others agree.
>>>>>
>>>>> If by "two" you mean the xAPIC and x2APIC aspects here (and not e.g. =
this
>>>>> and the earlier if()), then I agree. I'm always in favor of using dis=
tinct
>>>>> error codes when possible and at least halfway sensible.
>>>>
>>>> I would be fine by using it for the !hvm if also. IMO it makes sense
>>>> as PV doesn't have an APIC 'device' at all, so ENODEV would seem
>>>> fitting. EINVAL is also fine as the caller shouldn't even attempt that
>>>> in the first place.
>>>>
>>>> So let's use it for the last if only.
>>> Wouldn't it make more sense to use -ENODEV particularly for the first? =
I
>>> agree that -ENODEV should be reported in the first case because it
>>> doesn't make sense to request acceleration of something that doesn't
>>> exist and I should have put that. But having a look at the hap code
>>> (since it resembles the second case), it returns -EINVAL when it is not
>>> available, unless you deem this to be different or, in retrospective,
>>> that the hap code should too have been coded to return -ENODEV.
>>>
>>> if ( hap && !hvm_hap_supported() )
>>>       {
>>>           dprintk(XENLOG_INFO, "HAP requested but not available\n");
>>>           return -EINVAL;
>>>       }
>>
>> This is just one of the examples where using -ENODEV as you suggest
>> would introduce an inconsistency. We use -EINVAL also for other
>> purely guest-type dependent checks.
>>
>> Jan
> Hi Jan, so here I was comparing the hap implementation with the second=20
> case, i.e.
>=20
> if ( (assisted_xapic && !assisted_xapic_available) ||
>       (assisted_x2apic && !assisted_x2apic_available) )
>=20
> and you seem to agree that using -ENODEV would be inconsistent? Have I=20
> misinterpreted this?

Not exactly. I'm comparing existing hap / hvm / !hap / !hvm uses with
what you add.

Jan


