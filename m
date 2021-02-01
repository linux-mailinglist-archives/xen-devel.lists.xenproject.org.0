Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1430A94F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 15:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79900.145691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zp4-0004Zs-KF; Mon, 01 Feb 2021 14:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79900.145691; Mon, 01 Feb 2021 14:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Zp4-0004ZT-HE; Mon, 01 Feb 2021 14:04:58 +0000
Received: by outflank-mailman (input) for mailman id 79900;
 Mon, 01 Feb 2021 14:04:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6Zp2-0004ZO-2J
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 14:04:56 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be5a8e3c-0c23-4a6b-99f4-096628b665d4;
 Mon, 01 Feb 2021 14:04:54 +0000 (UTC)
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
X-Inumbo-ID: be5a8e3c-0c23-4a6b-99f4-096628b665d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612188294;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ezH3Gpyp4RfJM+MVTYcXvlw268WLRxhjfpjZKqCoeG8=;
  b=dOPSvYoNoi7m9ZelO8gR2tmG7fAv5LvM2QnO/4Xp91dTa0RaJut3sIX1
   9mIOAPHsImzWwms6hcW9C/rErnEqKj0+ifIa/v4DiYEBldUsxk8LVzlZt
   FZ0VF1+T0TNQy/xaRnwNxGUS9i/0U9jRjC4KksNY6QEYWWDz45c29wajR
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ekg0SIFOziXn37hvBr3A0eEAPIA57Il8D9Eqso+E+AhA0yQjQrX7Hv6KdHyZWx2H2qg0ekAFln
 NTutp79kenxuG0jv+cmiOGjmJvBVkjjmj0wEAxVLL65FPTzGcJ3KbJRX7DBxAu+LJELjFjRYoQ
 cTaTbZ3qTRFncnW658YHYSDNuppu0Ek3kYRSamC3l4AYJ8Zj6gAIkWJpZd7sUAeB8n74YYxGlB
 8nJyCRmCAVpgA402Ot0uoNPeQ93h/ym5NHsPArSew6iy7yUaNO1xBFQy+b8u8b3rEzbdGnPNan
 JaI=
X-SBRS: None
X-MesageID: 36273297
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36273297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZDWpxHR7ZlY8muUBnINGWIga4vxBZJQuSFSsZb89b5jB5APwUJUmZ5mIp5NTE+RFNLfb3UBqMzAFcXqyC8u+OMz+3bd6pAIb1RBOVrN8aaeEdEo1//UxAR/9upEd6UUr8MkxsOQCP9PAzGnpfc64NAsx544XhEZqi2BHfg9S4Tsq3cHeUsqoFHE4TwX59vcvEhwmHSCdS5ylXU9faGtfvmgXEekDTBUdKq2F9auRteDYsWZcom9WZDIKIzPtAXVX31iczFNzkHKCPYxAlaGgUQefFcgxfdVUx+sebXo/I6OlQOCM4/3qzGSD1IC/CRBk7fRXMa8kdBgQDvxkO4xkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW4ZU4gQ3UGSA87v9AW0hVKlpA7k7ugSAiZ7f1Na3Rw=;
 b=bQogFHT8CzckcJ0u99myTq12/naZ0XOj90D3v7AO5D/SaqYMv4+dYKf4Q5ZxCQvTOg0croaxPkfaY5XbqAuym6nPGYDO9lRwLKpi1WRDuK5P51uyEiDB3w6ZV3Ey/6KM9ZSFDizrYYcp1/F1mIYSlOTrpkmPcAAJJflU0tzc/fqVI2u1MriKvneoffhxQkjve1eeLItuYrglg8zV/tTtpTc7lSHPMJuF24Hk+DXL8J0wNgTpjooce+PcnYQemDnGOl9zRGPtTA4TldVmr1p+yBX17SUrAy9FUFBAPr6RdYsRaHXKcyGG+fHZhQ7dGeqzagiMzyrufqfIHs7uAv/PcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW4ZU4gQ3UGSA87v9AW0hVKlpA7k7ugSAiZ7f1Na3Rw=;
 b=Q3i+V7if+LPf/nVzDA/hj3qudHzh23ffD87jn0ZeO+2MilH60s/5cO3kQ45WFE+Y6dC8FdUfvY2Vu0Qlv7nT60dujtsOgMEhFtMDadg3L39ctPJQMQ+tCiZOZzCuMyvi3JpMZf8L/oXA0nvlVzbXUk17cOgDXe5b3+0KMhc2qrA=
Subject: Re: [PATCH v8 06/16] xen/memory: Fix mapping grant tables with
 XENMEM_acquire_resource
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>, Hubert
 Jasudowicz <hubert.jasudowicz@cert.pl>, Tamas K Lengyel
	<tamas@tklengyel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20210130025852.12430-1-andrew.cooper3@citrix.com>
 <20210130025852.12430-7-andrew.cooper3@citrix.com>
 <YBfTpTzi+wo7AFSH@Air-de-Roger>
 <53a26fb9-9c43-d1c4-90cd-bb29d57e106b@citrix.com>
 <28e8d116-9d5f-3c73-b366-63d5b047b085@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8c4ef206-8378-8fa4-60cd-199491a136c6@citrix.com>
Date: Mon, 1 Feb 2021 14:04:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <28e8d116-9d5f-3c73-b366-63d5b047b085@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::32) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ffde1b8-c535-4116-b7d9-08d8c6ba509f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4584921BB9142DC5EE937B9CBAB69@BYAPR03MB4584.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UJHa6Bqb8VaOQC+e0zBIpHoHhHbqO7C6ifNi7t2iMhyzhXD9a7ahg7fcuSQ2PtL666ACBlJo050rXDyk1o5AiB+M3+ERN+21fWrl9WWGxQILvNCRc5bZkSga5ZGxv3cVrSYSaJxKX5SNoVej6wFFj+XGu2I/WnC/GhCjBAC9PciYqR2QVPC7NKOZjCkQH9tY/+RGd31kNBy8t3wQbRkcWgs2cWEX4uaAT+vbVyGa22tEyWy7KyQm9Agk72HVldnwYD2rF945qbyLGVZfo0uV6kz6PWtZ2s9L2WQsSCAILcJ9gFuwU1P6jAw5iLvRwA9MLoZ0xI0qAaNJSxODEQw5nOFX6NWrYXOgwOQO8CGlsoMMpDPVvlEEiJFdIev/85dHcdJ/FSdeoD5FA+HypYw1hXaskAuX7vRAjM7Vd41OyGfYAjh2qCft94JPDqG1pr3i/WXTueaEtcFJBmftswP8JXgcKrDX8X1MUHqlQN0zal+v31Z9FgeFAbTF/v7otoP3wN4FK3vdJlrluOblrvbaFqjcezLKiuFlTRFcdf5CSWECbTLbTn5IHjcyr3kBHDIsC5qZIqP+/H8FtxB9D5WHw5StJUsWvywPUtoxnTFGLQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(53546011)(31686004)(186003)(6916009)(2906002)(4326008)(86362001)(31696002)(107886003)(478600001)(5660300002)(26005)(2616005)(956004)(66556008)(8676002)(66476007)(66946007)(16526019)(7416002)(36756003)(316002)(6666004)(54906003)(8936002)(16576012)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bklZSHp4amFYUFdFZ3hhMkJucG5nM1I3MFl4S3FaNTlVdmUrLzN6alhTS0U2?=
 =?utf-8?B?YXJzK1kzVU1DbnpZSXZIbFJJamhuU3lMZHBYYVF5dWhOOFZBN2J0TmVZTGtp?=
 =?utf-8?B?VjE1UllEdlMwWGU0bk16NGpmREVqVEVoRTJUNTJyalJZMWFjRzJaWWQvUEI1?=
 =?utf-8?B?QzMxK3lkVjhzSHJMUEsxd3lUSjBjOUR6blBCSlpGeThBTENKUE9ZQ2lVYW1V?=
 =?utf-8?B?UkVkVjhhVkhMcnY4OXQ1M1NVZDBjY2c0dm9QOU9ZRTk3cHBxV2ExL04vRlJy?=
 =?utf-8?B?b0lSUkVVRFh3RW1uZXdVZXR3ZjFHQkNnRGNmRWU2dlJOUDRZQ0FkVWdIM1pV?=
 =?utf-8?B?YWFwci94ZjdteGxvdlFSMGRwOVFiNWtEa05aNGdXY01YNzJVZ1hwdDJpaWxM?=
 =?utf-8?B?UWJTa2lqYnpxdUd2dlI1TnVPRGRRR0Vna1V4STk0dkJ3Y2ZocmJHdHpPcHF0?=
 =?utf-8?B?aDFlbFUyNS9ORndGSFdKOXVMbEhBVnR6MGhqTzBrWjNXK3NPblpkNnF2Rk9k?=
 =?utf-8?B?SG5zM2w5ZGVibzZSVjFFdm1Bek9WUjFLWUFNSEJBVmthangydHBobjQ0Z0JE?=
 =?utf-8?B?ZllaM29sZ1ZxMzdZNXR3YUtyajMrZEZGdzV2Z0NhanArSEVSUVlzUVdsSTdo?=
 =?utf-8?B?YmdnMnRSSEpTdHQ0SkFueUJ3bWhiSkZudXpNTmZpZmNYZUhIa0xBbCtsME1k?=
 =?utf-8?B?cGVSM3RENWsrOU56dDJzVmdVeTZ4OWxiT2x1VFlpb3BSeUxyT1VMbWMrOXVl?=
 =?utf-8?B?bUdGc2k1d0FTMnN5NUJ2RHFOdWJENnZPUVhVemdIdWdLMTh5M1l3M29NUWVa?=
 =?utf-8?B?N3RzbUJvL0FvYVVETUNQNmgrd0hZd3V6Wkx1T0FwN1R6aDM5ZlhtbmJ6eit0?=
 =?utf-8?B?aDdFeVBzWG1QTWQ2RXZYRitMeUJuNThZclpKQmhDRjN4Mjc5VjZ4SGJva2pn?=
 =?utf-8?B?UWpmM0JuMG5qMjFHVEZxcmJmTW95TEE4S0FzSlIvVFpaZ1h6cVZKQUVoS1pO?=
 =?utf-8?B?RitjVHZvVVFVZmxWYUtWdzhCYjRqVllwWDh6VUErVWI5UVppSmJtSzZUMGg0?=
 =?utf-8?B?Y2R3TDc3MWtZTVZpZkdBdmNhd2VubDE3dTZtUEhncnAzT3Q3UnBZeDRNeGJB?=
 =?utf-8?B?QWNHdUZIUjAyLzJ5YVdSQUNWbUN2MFV2Q0h5RkJWdDhzaXNtNmhFVHY2UkM1?=
 =?utf-8?B?YXYvQkNIUklDVS91alNNZVljYnRhaVBPRWZ2Q2tneG1vdXM1Zm85Z2RybkFC?=
 =?utf-8?B?UHRCdWhBcVppWW1hYVBPNnZFckQ1SzcxVlN0NU5BanZsNU5uaWMycUFMQkQ5?=
 =?utf-8?B?eXBqVnQ3Z0RUN2dkcWVuek9HRDdMc0o0ZXNKMnp2RUpBeWR0STVMd2F5bkM5?=
 =?utf-8?B?QWdjTWhSSDlhMUx2RGV1VW9ESGRYU2h0QVRsd3ZUbFhwYTc4R2VtN3JwaGd5?=
 =?utf-8?B?VGh1RjZTdk1RZ3FYMUl2L1o4RWJaVGRKeEZ3d1F3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffde1b8-c535-4116-b7d9-08d8c6ba509f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 14:04:39.3395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVB3tqcFjkYCAUZyFNMLWvn2wVlVEHxmj/7jsBllj7KvCs+7wBceAaWj7HBvPpzzsyC+aJXKdzInv4p+xKs5H3Jo7mQQe77xkmBXwZge67E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4584
X-OriginatorOrg: citrix.com

On 01/02/2021 13:03, Jan Beulich wrote:
> On 01.02.2021 12:11, Andrew Cooper wrote:
>> On 01/02/2021 10:10, Roger Pau Monné wrote:
>>> On Sat, Jan 30, 2021 at 02:58:42AM +0000, Andrew Cooper wrote:
>>>> @@ -636,15 +662,45 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>>>>                      compat_frame_list[i] = frame;
>>>>                  }
>>>>  
>>>> -                if ( __copy_to_compat_offset(cmp.mar.frame_list, 0,
>>>> +                if ( __copy_to_compat_offset(cmp.mar.frame_list, start_extent,
>>>>                                               compat_frame_list,
>>>> -                                             cmp.mar.nr_frames) )
>>>> +                                             done) )
>>>>                      return -EFAULT;
>>> Is it fine to return with a possibly pending continuation already
>>> encoded here?
>>>
>>> Other places seem to crash the domain when that happens.
>> Hmm.  This is all a total mess.  (Elsewhere the error handling is also
>> broken - a caller who receives an error can't figure out how to recover)
>>
>> But yes - I think you're right - the only thing we can do here is `goto
>> crash;` and woe betide any 32bit kernel which passes a pointer to a
>> read-only buffer.
> I'd like to ask you to reconsider the "goto crash", both the one
> you mention above and the other one already present in the patch.
> Wiring all the cases where we mean to crash the guest into a
> single domain_crash() invocation has the downside that when
> observing such a case one can't remotely know which path has led
> there. Therefore I'd like to suggest individual domain_crash()
> invocations on every affected path. Elsewhere in the file there
> already is such an instance, commented "Cannot cancel the
> continuation...".

But they're all logically the same, are they not?

~Andrew

