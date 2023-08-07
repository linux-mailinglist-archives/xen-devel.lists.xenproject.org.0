Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0E772771
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:18:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578521.906058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT146-00033d-EM; Mon, 07 Aug 2023 14:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578521.906058; Mon, 07 Aug 2023 14:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT146-00031t-BD; Mon, 07 Aug 2023 14:18:34 +0000
Received: by outflank-mailman (input) for mailman id 578521;
 Mon, 07 Aug 2023 14:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT144-00031d-Ay
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:18:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4893128e-352d-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:18:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:18:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:18:28 +0000
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
X-Inumbo-ID: 4893128e-352d-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FO0HTaoeFKsJdqLV5yDVJWhE6VCawUUyfUvhDDxsxIUsOhn8SkpFINV+OIa9OC1ZBu5Ib2W/2VVbomBic73idrQ805gv4RANYcPgglQou0hUsVkj3zKzSJBYeZX2UyXwbUpYkR92Sc3CDcldul4lKgmD/FNdwkwanPY5xBzk2djFWJSOAlRDEBu7CDo+JedygGlupIyojYy409Xbha4t8aHH0rZR00ZXHuIH9yEkA/iemYsvSoBwgFu2AfVooD8Qz9pR017Ym3vERm3sqyg7ZkYlRsEdskfF0nqXTJZKh1kcain68y+WekgXVz/23RrfO5m7/5Qtv+3d4puCjKdQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKHsxWsoK0lnmkfytgfpihvQurqU3dukBFi9QGrwNqo=;
 b=gAE+07Dy2yY2IUOk8m4b0bsVawtQbmWjLRvE0SqH4V5/cWZZB2+q3Ss36CQG7HyDnk7A7VA4tlZWw6Xm0GhtqO0Hj4330LMeiRlOS9d7RfMtVicEvxgGdkorUcL3di2VjWFqZ20IrxDe45tZFgJ3H9T6d5nRMJmcWADqHrxwyS+Ftgh5EZEQe2Sy2FNyChT//p2il/pGAHjHoCzXr2iSEANrEUMKiKPrb3UTUhkF++AdFvX+2SIQEidq2EFBpIBAn8ROGuvLn3W4avt+h7KTqoKyNwuSApZKK0atJMFxHwKOdE14UlZRBQkZbYKDmPSwUYQFypgr2Eew2DrsFoz/mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKHsxWsoK0lnmkfytgfpihvQurqU3dukBFi9QGrwNqo=;
 b=lxZuN/BUHsSSi1WO31KwyJFtFRH02EMg3KZ9UKTR4d7i2AoBXnSiyb2WLhbXYHDxGaqkME+h4YQYER+6aQiGUYoWyR7cGcdpCCtnSWF7aoSlwxBm/IecvigT3iFM//AnOnvpa0iwFV61RLpRrH5b+kYoGTG4+rLhsB/WnWed7/G4d/ngfjxTs5NbjXMbIgqX4LN6eO4GBeWOPCSEvC5uXE4KyaMYp6Yg58oslPEahTFUx9k2EVOqzoEoRkOdM4DvzRYc9ylB/AkOGN2yHxbwMazybWVcT5WM+2pN+1BTlIqG1PfeURmZvoEWcPgYVIoW7U4GGHJOid7p32nOXHR8gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
Date: Mon, 7 Aug 2023 16:18:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Simon Gaiser <simon@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <298af911-f4f0-165d-c493-90407d649945@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: f728a14e-3ca1-4311-cb3e-08db97512ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ovWE/vGWYk0MNIdwrYhwpTguI1hjzzodLQKvOHrZDye10v9+d3GnlLayuid8YER9UkAgP1uLw9B5FuYDtcaguyaKhFfrv4VFrCE3Uzg3xT1lpb9VZUc1PSC6W27I4JNRHcVAb+4ZQVPp00iSZOgAinGZ3D5eDDbJAlB0flYMqwpWLHSljNXx9Si98rJphsAfOUSzN4uXuP0ZcNjpRiGobI2MwbAVNbQ3qdPRmfR1vrZ5PHQmFFaxKGZ9Np6OwPv1EwwYaVSXOJZspN275gjjdIqToKM+IabZVnltaYo3h1dy3KIvxoPsFDVbv88ERdSr2j0sqO7huMKjcX8mExQbKQUJ906uF8ZaO6mfvM7yp4p/U2iQ46LgJdD1gjVUlvaIHMxWCoKDAGGqoG8xi+A8su8lqIn9gT77+m6cwiMXuxW9g3DAJ2/HnPgfML+B7LsZLBmU9FWdptVYG8NeKuXN/MTD/610c0P7t2JXOG/RTzGcQQBwzSr02CdbShQRCEeWE2G4krsXspD/JliF/mEMDy3nBeCI/I61B/1qX9tKwBvbHwFvzzQlCukx22uUzWOfPPo2FYz8MFZ2muivXcCBG3TGjpXhnpv2t/JLN9STNOYpPcrm2Y/uh/na3jOHS7s1sgD8yt8Y+JVzS17MAm60Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(376002)(136003)(346002)(186006)(1800799003)(451199021)(2616005)(478600001)(31686004)(83380400001)(6486002)(6512007)(53546011)(26005)(6506007)(41300700001)(66946007)(66556008)(66476007)(8936002)(8676002)(316002)(31696002)(4326008)(2906002)(6916009)(36756003)(54906003)(38100700002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGdnYWNaMzdybmUxZHVpM3FWaG5pd0hGSHN0NjBrc05laDdpbm51R1EwRk1W?=
 =?utf-8?B?S0JLZCtVdEp4b1JjV0JleHFHSndEcTZrRjN4cVV3UE93N3BpcG5vN2NlRFY2?=
 =?utf-8?B?Q1ErRHZDL0hibUlSdUpUTHovelN1V3JUOWJRUGhyMVIrNWk5Uzh1eUoydkZ1?=
 =?utf-8?B?OXpWV2s4ZExmZmgySEpFdFBFTCtGZFVablRjUHVubFdvcGx0OE5TTk5BR3dh?=
 =?utf-8?B?em5YOG02dXpaVXpMdStoZlErdTZZMURxQ04vdzRRa1R6VDJ3aTZqaWlMWHVL?=
 =?utf-8?B?SldURmhTV1JMeEtrMjZKcjh6UnV0MEdkaUUyeHk2UDNsMDRqdFVoZEZXcG1O?=
 =?utf-8?B?UDFVYWFSa3Z2aU9FTVJ1OXZvbXovUmxJTzJZSEpra1RHL1o0MXhxRy80bE1l?=
 =?utf-8?B?R3U1Q3dKWTNBU3AwcWNyYjlMUjVCQWw4UHdKem84YWE4dDBzNmxWWmNIWWQ4?=
 =?utf-8?B?TTFYYnkrRnl0TlNIamNpRjJCWkIrSTRHalNMcXpJK01LdkFMWVNHUzR1emZP?=
 =?utf-8?B?a05EUE1KRGZoTGZEMHNGQXVXU2VRMnpEKy9iVGZpZzFZU0JCQkxvVmc3cytl?=
 =?utf-8?B?T2JIOHJZUTR3R3FYVkE0dURCczJMeW8zRUJGaGZRVmJRL1MrYzhuS3FacnRV?=
 =?utf-8?B?K2ZlaGgvTHhBUGlkN0pSVmFiZGExNUp6bDRncldadkRQcGpqUFQzWXF4UFVv?=
 =?utf-8?B?STJRQTk2dUl2eFJrUnlWcFVYVkxKckdYS2JjeFJUbk83NCtDeXpvV0gzZytx?=
 =?utf-8?B?VDZvVzJ4c2FWV0pOeThzM1FreEtGdUVZenBGVHdTM2R5ZXdkSllVdW8rK3ds?=
 =?utf-8?B?bGphM1IrOStlYmRGSDFJdldkYlJNallqTTNxcXRVVzNCeEdtbFdJR214Ulo3?=
 =?utf-8?B?dFc5dHNCNEhaN2p3QnVGSEJFSHZwdUE1ajFWdjJrcWt6Z0NoZDNxdDgxckJN?=
 =?utf-8?B?Q0EwdC9lb1VSQmJOajJaMHFPcEEvazVKR3B1ZkVsWkhzemZvVVFVbnJXTWpq?=
 =?utf-8?B?KzBOclFxcU1uNW1kMEt1bHd3MGNtMC9XaEFHMEYvaTdPWUU1TkRvdGxNdm5z?=
 =?utf-8?B?eU1WSnZhY0FkVkh2MTUyUUtlTkFCVGJScE5JSC9yaEhBd2JUZ1JzT1VBT0hS?=
 =?utf-8?B?aXIvVTRiRy9JbzQ5Mmh6TUd3V0lURXdrUnNwd3BwQitoNmpKYVkwYWlQWiti?=
 =?utf-8?B?YnJTRHVKUFBSY3NYKzZhN0Z5WXNQOFFVUXhvazZ3cDRNTE5TUGxjV0lqd2Vr?=
 =?utf-8?B?S25sN1k5Z1paQmloRE02UXJGa3N0ZVN6UFJ1dlZHK0UwTG1aZTBneHd1UmFE?=
 =?utf-8?B?dXoxZTh3WGZxbUQ2VWNuQmZEVHZ0YXU2RTN2MG5ORHpqYUpMeGh4OTBuajBV?=
 =?utf-8?B?dldiQ0UxNzFiZG52ZWxlQUxVK0RHZkZVVXAyL2tyUTdVdnUzdlpOOUs1RWRG?=
 =?utf-8?B?UWlYQkNUYmlvdlFCczZpckZabXdsdEtFUUZEWWlMNTVEUUpnN0RxMy9WZzAr?=
 =?utf-8?B?QmtYMHFtWExCa0xxQ0V0Mmx5MFRRME0wK3pKcXV5M05nR3FUVHpxZzVSYklX?=
 =?utf-8?B?S0ZZUmNYaVF3UWprTnBFN2J2U1JLMzZpclloTWtDZEl5T2hybmpuUStQbW9D?=
 =?utf-8?B?SnQ4eFMvWkg4R3VxTkNLcHF4OVlOL3BDN1hyRGpscGdocHdVaHdlK3FJdjUw?=
 =?utf-8?B?enBWYnV0c2ZMWVNGbEtWR0gwdlhDL0xGZXdpaE5pOURuVUVEeW9xYms3djZ4?=
 =?utf-8?B?alNiSDRuRW1WcjFhdnltU0tpVUJDLzNJRXgvYllXd1RVNTFsanRHa3JDMkxI?=
 =?utf-8?B?dkVaeFpQdmFQNUZLbC9LNWE1Y1FMNnE3MmppZjd5NWZpblB6Tm5PVGI3cmt0?=
 =?utf-8?B?NnFzZ1ZZSXFWQ3oxWmt3dEhDTzFYNm5PcEVvM3JqekVNS0lsYVBJdVF6dVl6?=
 =?utf-8?B?Z3JpK1NudWxZRXJhaGl6K2NMMmRYQm03QmhRQTRlK0RrNDRYMmpwbFFqV3pC?=
 =?utf-8?B?LzgzUDRzRE5DM1ozN0g4UXRFUHlQRDBYVmdhcXhjU1JrN2diQnAxanJ2bGZK?=
 =?utf-8?B?bkh3aEt6d1VsTWZrcTRhQlBFWUlYZzJCMHNReGRUSEc4WjJ1Z0FGNnQ3RlJP?=
 =?utf-8?Q?dbDrX5GgCh/tKPnGCu4shyoUW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f728a14e-3ca1-4311-cb3e-08db97512ba1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:18:28.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eYkbPeSmfh7n/NtWSeQDvEYkgYmiAOlDKDSBJ/tOSXxcWmnlNjuVnw7UBCp0gyeyw7hYKg6RRX1G4nux4SX8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On 07.08.2023 16:04, Andrew Cooper wrote:
> On 07/08/2023 2:17 pm, Jan Beulich wrote:
>> On 07.08.2023 14:55, Simon Gaiser wrote:
>>> Jan Beulich:
>>>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>>>> 0xff. Linux already has code to handle those cases both in
>>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>>>> same check to Xen.
>>>> I'm afraid it doesn't become clear to me what problem you're trying to
>>>> solve.
>>> I want Xen to not think there are possible CPUs that actually never can
>>> be there.
>> Did you try using "maxcpus=" on the command line? If that doesn't work
>> well enough (perhaps because of causing undesirable log messages), maybe
>> we need some way to say "no CPU hotplug" on the command line.
> 
> The ACPI tables are broken, and Xen's parsing of them is wrong.
> 
> And irrespective - it's unreasonable to have users work around bugs in
> Xen by adding more command line.

Well, considering how rare CPU hotplug appears to be, such a new option
could default to "no hotplug".

>>> Without ignoring those dummy entries Xen thinks my NUC has 2 sockets and
>>> that there are 8 logical CPUs that are currently disabled but could be
>>> hotplugged.
>> Yet it's exactly this which ACPI is telling us here (with some vagueness,
>> which isn't easy to get around; see below).
>>
>>> I'm moderately sure that soldering in another CPU is not supported, even
>>> less so at runtime ;]
>> On your system. What about others, which are hotplug-capable?
> 
> It is required that all APIC ID are stated *ahead of time*.

Would you mind pointing me at where this is stated? Aiui MADT entries
can be modified dynamically (we do so ourselves in the DSDT we supply
HVM guests with), and as I further understand this may be required
also for the APIC ID fields because firmware may not know how APIC IDs
are to be arranged for a new socket before being populated (by perhaps
a not entirely identical CPU, and this may not even need to be mixed
steppings).

Jan

