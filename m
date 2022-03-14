Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3274D7C37
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 08:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290018.491856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfMd-0008SE-MJ; Mon, 14 Mar 2022 07:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290018.491856; Mon, 14 Mar 2022 07:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTfMd-0008QJ-J5; Mon, 14 Mar 2022 07:43:35 +0000
Received: by outflank-mailman (input) for mailman id 290018;
 Mon, 14 Mar 2022 07:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTfMb-0008QD-R9
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 07:43:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72575da4-a36a-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 08:43:32 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-GwQdPVcJOPiVvfW_DIAV3Q-1; Mon, 14 Mar 2022 08:43:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4520.eurprd04.prod.outlook.com (2603:10a6:20b:24::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 07:43:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 07:43:29 +0000
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
X-Inumbo-ID: 72575da4-a36a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647243812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=caPMxhOaA7FMzpgkEUcDzeKrDT9weGYZMQ4B6P849V8=;
	b=Wrdtix4R2atCw06leFjkgWdhb7Y/rBY6diwk0pW196wFR9JEJeYpXj9EjySX2wYJGXlGEk
	Cg+0lQrucubv87wXiQ9nhCCX6XD4k367CFXTypj62JlmbjQiWxxkzOYhy5ZL5eCVAN8iN5
	OsP+9RcB99Tv6ufiWBHOqwo95Jx7+2k=
X-MC-Unique: GwQdPVcJOPiVvfW_DIAV3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw/WA3XvRdJTtSYl+f+pWTS3ylJEKtbySL4k+l5eK3HkTW5f0Tv1Gdt+pOBXFSry6g4UGNRENEmmORTvANtTjTl+XsXCeK0l3FK3uVAA0Oct0FemCOhMTorId2VI8MSUrRc44yL6ogVu0sX7PZzw87RKPkCvBme2sZjvSwmYqj7ZrTTYiffH6Qa4dpP3dVrkMQXnqVtg34Wb6ovJWcoJLQxVSldng6hQpgg0pNl0gQnGwT4uZypHM4BAVh+YDsfNHoxZJ9zG2UkYA+VgSTqphkbLM1Wd9lKAcriO/y8IagfzttGbpe0F6iEhmSxzEvkKUcQ8eM9uYpngRoPrDQbT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hza/3FclnI0odoXnUN3BG5VQ7t9Sfqk9PQTc5q7brs=;
 b=e8wsn0tf6sSKgkQafcCvmeT3y8um4INpR2J3Y2SQWHOQHEPjM2RpKG4usslEScoMV4ya8zFWGVPO+IrWMgfoYXDN1wF8p9wt+Qd+CRz0VHiw2xIEP++tRO7bLWA7vWhU/qp6z+KyrGkpbu0Md44pwyEuihssrPcGtUAfjqZr12KY03qmSSybBzcLLCKms8wcLW0sdcH8SJgL0oErGECyozEun8gTD8IJwRJadIJ0w22c4YOFt6O9who0n9IN4nl5LpsD4b7cuQWBFuJNu38O/Dmbsryn8r0hbu1povA9kVuRRPQsa2ozouYHsuoiXsGrQXO76aQUMA3o4mGfqEO0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cdbd90a7-bf4e-4ff6-0e95-0671ad553b83@suse.com>
Date: Mon, 14 Mar 2022 08:43:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: x86/vmx: Don't spuriously crash the domain when INIT is received
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: =?UTF-8?Q?Pau_Monn=c3=a9=2c_Roger?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thiner Logoer <logoerthiner1@163.com>,
 "Marczykowski, Marek" <marmarek@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "Cooper, Andrew" <andrew.cooper3@citrix.com>
References: <20220224194853.17774-1-andrew.cooper3@citrix.com>
 <20220224194853.17774-3-andrew.cooper3@citrix.com>
 <12d8b90b-15b0-c094-71e5-35cfdbfe72b4@suse.com>
 <51ef6bd1-bcd9-9a3a-e902-887d42d7dd7e@citrix.com>
 <bb4b4106-f49d-2b50-1eb9-eb450f6b24fa@suse.com>
 <965e91fa-1f1e-7c57-5a71-a09b170a7d9f@citrix.com>
 <2e1dcfb8-20ae-26b2-427d-9c19bd8c8add@suse.com>
 <BN9PR11MB52767BF5573E31241734F2A28C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BN9PR11MB52767BF5573E31241734F2A28C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0183.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 237153bb-dae3-4991-686b-08da058e54b9
X-MS-TrafficTypeDiagnostic: AM6PR04MB4520:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB45201713FE7FA01A89CCCF1EB30F9@AM6PR04MB4520.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XXAYJ9stZWJXCS1Rymmmvk/2ljMDkC18UzuLzudYYVk06oFi3BnUm8aCP+VZ5YiL0gRzYgyxFEcoZISxSfUvdJSymaXeNEs0M1RyHxymk0J8LOSQxavrJqq9lEabospJ1w+ClQ+tmWVKAkZK5Af2RfH+6NBqoMyEk2G1+Vf25rV5c5szRiNpYZzHdC3TAAUZmf36wJoj+8MivuYkM7yu5dYrNcmT2t4439Zh00bRjjDavLZRkOawzrQ++Ih/ZqXqYsbvaVX0w9rdU5485LJkAVkIJ2OEFq1Ns0E19DOon+Fd5LSB2EEh2MjumLolzuu/nv8CAqN1XSUVvDUIyvNAkia5mS0j+GY8tQmy3MfUpHGP7XbvBPTTLHGKWeSHZHmGI4OzuMIVQ7wDaRiRxIVtlNw8+dEQCFI+RPl/tlyJJHnhlI5xUsnap3ThlR60qqOH0/k8UabflPZxtahI/kziHQo+mM8NY8dO/Ff9/8tP4d11SHP9gED36+Qe2qRqjvCrrV0RHJvHMZ4pusGpiaQ7fJ9/J8/cB76y6maY6pQe+iQouKVYhWHYiwrWMIjuvVBA4cC3CKRrPhT0CrZNY7fpqYPSCNIkgVl7zYltD7EXO4Tru9ISxs+8RnPR1Si+mGabEcsPLfpkur1lWNgwszxwz/KNpamOEI+3tmi2j/zutmVF5lIpZWwS8qyk2WCMEP7YxtqcvHBeFz2/Ku+2Z3lGeOOYXgyVASjru1IIQQqR0Io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(38100700002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(31686004)(36756003)(5660300002)(6506007)(6486002)(83380400001)(31696002)(2616005)(508600001)(26005)(186003)(8936002)(2906002)(53546011)(6512007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ARd5LX0akHSA9O4GwnxuP3xVBn7+8D8k5INQUWpzu6BJexeWCXo+/iZnn8eZ?=
 =?us-ascii?Q?vw6nCJ5mUP3WFZMqrv/N0ybIK7YledDecA1UmO7sAGk36mCZ0dtQ0NbWue4d?=
 =?us-ascii?Q?Hy321ThyVBYbtruy8tOKGqC+x+QzyScCtxIebmWqxcI1HkCZXBrOoKf513OT?=
 =?us-ascii?Q?v+wMuuY0Af0q5poaH6AvT6BJgwwKbRTZDgW0cPuxTGNNSGKZ18E0ja9cX+mN?=
 =?us-ascii?Q?aSBjH14Xcz8d62ixtNlc8lXprSnrO7q9RxX2/dIHTsDAISoWa3lIRWfEn27u?=
 =?us-ascii?Q?PudoZCd8vw7m4hTq1vUfBwJZz1SNlF1TiIbcEh3TRgOFrWXfxgo/ktuG03n2?=
 =?us-ascii?Q?DFLwAbADbAnii1C8SrR821FIItbLjbO5m59LnWX9xK+Ayu+JCQm/w13rU9qW?=
 =?us-ascii?Q?euk8Y4aYpVRC61fdmniynmmKTvAhM4SmIRs1mHTObj/wBYyHjcDZnD7engGZ?=
 =?us-ascii?Q?uV7/mnFeZgsS6j83knt23N2wvYmEs+Wx+2lcsQRtbPKHQv06KiSAoim0GHZh?=
 =?us-ascii?Q?WENPWPKax+wu5IcT8Rwyz9MVFyk6kzDkjLWNqoQKqkeZ2TvapghEiSQ6tpdQ?=
 =?us-ascii?Q?ONV2SsH+zfNWi1TrKQD+BLOHQbj8JofBOVDx3a52/LZbaGOjHNa+mX68o4j8?=
 =?us-ascii?Q?bsCyJMG67LrG5v7to/zXveOR5PSur/ZFDahePVPHDxlFsXRdD+iVvp28LBPS?=
 =?us-ascii?Q?uF3GtY/osaKFbrwJy43AurpDIxZp9L+R5AqlbDiGkSXdWyB45M6wdRl+qoIk?=
 =?us-ascii?Q?u0cng8wUQ0b9TLvUUDp8kpraN+AH2gN2ZtpR36ISqvz7kFr2sr+yfq+v8Zki?=
 =?us-ascii?Q?m76uZ+h924l/ehp97oCaNJIhQvHhgZ01WNu0fTkbJiwkpwaLtZy0AgiRAg9k?=
 =?us-ascii?Q?LC+FI3ThvZl5iN7bD/o7/ytAhg9Tf4xvybIMpYwCOS7VLpq1WMNMpNs0AbGc?=
 =?us-ascii?Q?skF3sFDu4kF3pF+8AD7+29K8uX6+pFA9EKd9z5zsyiVK7E+q2cza9uhjxJHX?=
 =?us-ascii?Q?nt4lWnO37C4Fg4v+V4HW+U4wejiU/DJpAPneq3SlIyZC07YVxhoTWKKlT1kk?=
 =?us-ascii?Q?g5IWu+gE9qWb2exmkWkvvaLk9UDIrwyr+v9nICDEC13DBtYtKAew0Il1aNuP?=
 =?us-ascii?Q?Upszo7H2jp1X/UzNF1vsF6S7VOl0fvj7k8FnoyWq6yQZ0siB2zwuCYDW46Qo?=
 =?us-ascii?Q?2CGGzCOtiuTDFrjf+XvZF0MOeFVhjCf939ten8MACViZapGKFhF8A5lTsV6e?=
 =?us-ascii?Q?6HuatutTnH2LdYmTYNexOhSUAwsQ9Q/9cNGJ3oQQ94axsr7vBa4RZguyENVo?=
 =?us-ascii?Q?VcA8gVz1TugspoZw4oCy7JlZZKsaWGjvsKfKENMj/O/gyKE3U6GZlBQGW/Nx?=
 =?us-ascii?Q?/B1p09La3t2OQeBgQtThYeCiHijY772C/CC/XgDsX24qJOEzDcT5FAvqWM/P?=
 =?us-ascii?Q?tKgT16qRdX5tCwrFmKdJuYWwzoddMENr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237153bb-dae3-4991-686b-08da058e54b9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 07:43:29.2840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oz//y7+IBhQzuBYzUfJquYjYYJTGAjkwi2/NXFkCiwqDmBC5fE8pPeKONmITUbyCZpn/OJSwURzbejbQDU7N5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4520

On 14.03.2022 07:35, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, February 28, 2022 3:36 PM
>>
>> On 25.02.2022 18:11, Andrew Cooper wrote:
>>> On 25/02/2022 13:19, Jan Beulich wrote:
>>>> On 25.02.2022 13:28, Andrew Cooper wrote:
>>>>> On 25/02/2022 08:44, Jan Beulich wrote:
>>>>>> On 24.02.2022 20:48, Andrew Cooper wrote:
>>>>>>> In VMX operation, the handling of INIT IPIs is changed.
>> EXIT_REASON_INIT has
>>>>>>> nothing to do with the guest in question, simply signals that an IN=
IT
>> was
>>>>>>> received.
>>>>>>>
>>>>>>> Ignoring the INIT is probably the wrong thing to do, but is helpful=
 for
>>>>>>> debugging.  Crashing the domain which happens to be in context is
>> definitely
>>>>>>> wrong.  Print an error message and continue.
>>>>>>>
>>>>>>> Discovered as collateral damage from when an AP triple faults on S3
>> resume on
>>>>>>> Intel TigerLake platforms.
>>>>>> I'm afraid I don't follow the scenario, which was (only) outlined in
>>>>>> patch 1: Why would the BSP receive INIT in this case?
>>>>> SHUTDOWN is a signal emitted by a core when it can't continue.=C2=A0 =
Triple
>>>>> fault is one cause, but other sources include a double #MC, etc.
>>>>>
>>>>> Some external component, in the PCH I expect, needs to turn this into=
 a
>>>>> platform reset, because one malfunctioning core can't.=C2=A0 It is wh=
y a
>>>>> triple fault on any logical processor brings the whole system down.
>>>> I'm afraid this doesn't answer my question. Clearly the system didn't
>>>> shut down.
>>>
>>> Indeed, *because* Xen caught and ignored the INIT which was otherwise
>>> supposed to do it.
>>>
>>>>  Hence I still don't see why the BSP would see INIT in the
>>>> first place.
>>>>
>>>>>> And it also cannot be that the INIT was received by the vCPU while
>> running on
>>>>>> another CPU:
>>>>> It's nothing (really) to do with the vCPU.=C2=A0 INIT is a external s=
ignal to
>>>>> the (real) APIC, just like NMI/etc.
>>>>>
>>>>> It is the next VMEntry on a CPU which received INIT that suffers a
>>>>> VMEntry failure, and the VMEntry failure has nothing to do with the
>>>>> contents of the VMCS.
>>>>>
>>>>> Importantly for Xen however, this isn't applicable for scheduling PV
>>>>> vCPUs, which is why dom0 wasn't the one that crashed.=C2=A0 This actu=
ally
>>>>> meant that dom0 was alive an usable, albeit it sharing all vCPUs on a
>>>>> single CPU.
>>>>>
>>>>>
>>>>> The change in INIT behaviour exists for TXT, where is it critical tha=
t
>>>>> software can clear secrets from RAM before resetting.=C2=A0 I'm not w=
anting
>>>>> to get into any of that because it's far more complicated than I have
>>>>> time to fix.
>>>> I guess there's something hidden behind what you say here, like INIT
>>>> only being latched, but this latched state then causing the VM entry
>>>> failure. Which would mean that really the INIT was a signal for the
>>>> system to shut down / shutting down.
>>>
>>> Yes.
>=20
> why is INIT latched in root mode (take effect until vmentry) instead of
> directly causing the CPU to reset?
>=20
>>>
>>>> In which case arranging to
>>>> continue by ignoring the event in VMX looks wrong. Simply crashing
>>>> the guest would then be wrong as well, of course. We should shut
>>>> down instead.
>>>
>>> It is software's discretion what to do when an INIT is caught, even if
>>> the expectation is to honour it fairly promptly.
>>>
>>>> But I don't think I see the full picture here yet, unless your
>>>> mentioning of TXT was actually implying that TXT was active at the
>>>> point of the crash (which I don't think was said anywhere).
>>>
>>> This did cause confusion during debugging.=C2=A0 As far as we can tell,=
 TXT
>>> is not active, but the observed behaviour certainly looks like TXT is
>>> active.
>>>
>>> Then again, reset is a platform behaviour, not architectural.=C2=A0 Als=
o,
>>> it's my understanding that Intel does not support S3 on TigerLake
>>> (opting to only support S0ix instead), so I'm guessing that "Linux S3"
>>> as it's called in the menu is something retrofitted by the OEM.
>>>
>>> But overall, the point isn't really about what triggered the INIT.=C2=
=A0 We
>>> also shouldn't nuke an innocent VM if an INIT IPI slips through
>>> interrupt remapping.
>>
>> But we also shouldn't continue in such a case as if nothing had happened
>> at all, should we?
>>
>=20
> Now there are two problems:
>=20
> 1) An innocent VM is killed;
> 2) The system continues as if nothing had happened;
>=20
> Andrew's patch fixes 1) which imo is welcomed anyway.
>=20
> 2) certainly needs more work but could come after 1).=20

That's one way to look at things, sure, and if you agree it makes sense
to address 1), I won't go as far as trying to block such a change. But
it feels wrong to me - 2) working properly really includes 1) plus the
killing of all other innocent VMs that were running at the time.

Jan


