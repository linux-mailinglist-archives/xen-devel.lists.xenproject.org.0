Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03424401F6D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 20:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180169.326703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJ2B-0006Bq-HY; Mon, 06 Sep 2021 18:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180169.326703; Mon, 06 Sep 2021 18:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNJ2B-00068z-Di; Mon, 06 Sep 2021 18:07:55 +0000
Received: by outflank-mailman (input) for mailman id 180169;
 Mon, 06 Sep 2021 18:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNJ29-00068t-K4
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 18:07:53 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a02463d-0f3d-11ec-b0b3-12813bfff9fa;
 Mon, 06 Sep 2021 18:07:52 +0000 (UTC)
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
X-Inumbo-ID: 5a02463d-0f3d-11ec-b0b3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630951672;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tatBAklfoTz0IHa6ERQ2r3u844FuxIM8q6wiCalO/oA=;
  b=UPScWOQ3csiWpfJ+cGBYjScDBO7H/tNvoWYFPxBw8odbS+498NOpU+gP
   28OzAPXucHm3l7u8LZcadtJJ6jmZn+6iYgnq33hX4fWc23Edv1Df7B9h6
   pK/6UecmXYPf6GOUaWcvbew9Y2FxvrJNqN1Ad/iHyHyGHmJsZPqkyJlAL
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dEaSWqBoj63gUhgCCQ+WlgRYldYcv7Eds+6ZAI+mjCtvfQTL5D/hm9//plqEFfMNSkrW713r9J
 Nj2h1d/9RKP/VTvg3MMyI5Kv/mi62S4M/Qxh1xVqbPO3cF7VYp5vACZ62EbyhbloBBlQ/pDgaM
 ttE4QrcIYbNb/ugqmIBbLZorthWMk6AHPlyaqo9Jxh3ZO4epj1VSqn+PCWtwbEPFWvW1Slm9H2
 NZu/Dr7t4D7zAGj2/LaUErcxvSrHFcK03ZYzWLp4kqZZIXdcRfwseoq66C9NqBV27LLa+Ye15M
 JLp1yXyebgh0TJFYuo/4UYDa
X-SBRS: 5.1
X-MesageID: 53860036
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6na8C60Dd1DnAUXj3ligFQqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="53860036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ2VpO9mG+T2NomCSkFdTBk6E8i4I2vO52EcQbhCplkCSy+2HGAcXbDxkwlZCdR6NIZtlsDrVQZcxTDJendbn0r4kNmYOUwHRP8gg2I23H6ytuTsIFFiJ+cQsfINESBEfS9gbGg+XAi+fuu7MjXpO4OopXPU5jE6BPnQrXAZBrZDCIVoe9db1d22aq//BCpmRoqFVN0gQCa1OfD1IlZpqmnKnhQX46OpORsLKQcE3OqiBS3aZwdBh6EDjwN/HuGeMOgXdMKEIRH3fwhdXlO0puHo8UJqHoIa0f1jgVx4B0zhgJP4tRhBhwCm3KDY8iJzNrqQJOscH1Gqwwb3sG6fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0Mncjb0+JPGtlBvhg0XIVHAc93gaDfzgSaMk3YdIyJU=;
 b=ae+2/oq0Jzfk8uYwF0/lk1izupG7YWdXafG3G6ll7M5604SJODsMqptpVEGWj056AshtpKW/YqhrFfU0SaN7Q2fVCWJhh1Cnfg8QPSMySInZ+0crvyUUSADKH1Odv4ShQUCrMt/bIQ0QhDytMUGiOIyIM8id/tv8L44LMUuIKLjGwrXjaBYRXvByhOqc/eogob4v8fge2rYAjFL57GDW2xmTE8ODg+UqJobZwroRphA/ORl04/tr3MoShrHJXnxX1blPSC/Lw/wupNtTiVmh46+Ed79Cr43gbt1RiKswHxwQCMjOXfA2wE2Am3PGku1f/KEJVVW8WIo0I6fywClFIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Mncjb0+JPGtlBvhg0XIVHAc93gaDfzgSaMk3YdIyJU=;
 b=xnX6zHR0yZjXHyfBffcjLF41hgf00ZSlykbyFrBJWWbf8pDU00oyA4dH4ZIW/2Ae8UG0TdC5IXBKe7j8RduGK4m8rFcE5iP8SGVFsrzPnQF1zQduoEHc/Fg857AdXjtZb9q9LXBJAvpBHnUnbq5xmyjpFZxNlCzEqw9jgsY+xMA=
To: Jan Beulich <jbeulich@suse.com>, Jane Malalane <jane.malalane@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Pu Wen <puwen@hygon.cn>, Andy Lutomirski
	<luto@kernel.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1630929059.git.jane.malalane@citrix.com>
 <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
 <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2
 CPUs
Message-ID: <2972c71a-5fed-0813-8ec0-d179eacff14d@citrix.com>
Date: Mon, 6 Sep 2021 19:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <26b88d5a-ae6f-0065-7c3f-5eeb6dd80078@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e97e60b-760e-4a32-97f0-08d971613b65
X-MS-TrafficTypeDiagnostic: BY5PR03MB4997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49970E3F23473704B3B6FF93BAD29@BY5PR03MB4997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNZHqmSxIatNQYb18rRAi6XBJxigwx3fUFH5MpYv1DDMLgz4oF3irB3mVEMAVEA5546aw62LMASQR9eolrmyq4gvIVsu3yq0KbFE6led3WvGI+SopDLX88iBjoi98tbNAFT8PTT3IGdvGMhm1gcZ1lLd8QQA+ve3toWgTfi7fWu9zB9DMyhNY+H0uu3MDfuHSWgMGav1mgPoHIdq1r1p2VTkVRKbBaLux3YjtRJ9dIEfkXilv/FnzgP+hm2mQDBoCeq+T5FwC0E/CDzRjMZZ9mh9snOgKrrhcvSMWxDsn+fA2xrn+MlOmPLMN5o7FhO8qYOB7diPDVL+eYe/yQ9pEE3+HMmQxYGtzzoZd1sV+G5odnAKYhRPDnP0MDVeSKK7HEAJtrSX3Fh/vskZ6ncy7/yc2qoGOqFnqpDVWkmKly1OrgIGH1C+9PgL0J5qHrcVTn+v8ZFro3rfkKYH27lRl2k8yvg9UEa8Gqk3GHWDo1TMQM9XxGRJFIgzx/5qjj0qjPl7kJsRDLIYn+TzNPTadyxgeaeSO7z2stWm3LSstZa6lqfZFwLjhLTDYG1DybPN/Y7vDQEPyeSmGCYZwhMZk2Yi49NfnHbq2k7mfn1qwGrtWkU6XGpvYKS5XjFwwkZJbK7QHTbaAwvIoA47WSDU8yGIqn/64vlwSPZ2dGxIhjaIo73Bk10U5W7ftASlGzo1+CgnD0os0aNSRvdhuoCSUEc+mZsRQWm9G4KEj4GRL9zHVkIKUfpmHeMInG+oXQGV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(55236004)(316002)(53546011)(83380400001)(8676002)(956004)(26005)(2616005)(8936002)(36756003)(31686004)(186003)(16576012)(110136005)(4326008)(478600001)(6666004)(54906003)(2906002)(6636002)(66946007)(66476007)(86362001)(31696002)(5660300002)(66556008)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2J5N3YzWTBIZENDRnJaWVV4NkhUdHFhSlFKdlBBVFRDQW8zemFhV2MxWSs2?=
 =?utf-8?B?M3E0MXRRTjNqS2x5VzFkbFlBOTc1djZyc0dsWngyNG5QN2p6SjJucGNFbjVH?=
 =?utf-8?B?Z1BQc1BoWXAyNHR1WkRMeUdGVGp2UnQ5bE5VQ0ZoSmVHWFFEaC9aL3RKcU1w?=
 =?utf-8?B?NDJ4K2MxeUJxQUQ5YU9IanZITTl2U25wZVh6b1hyekFBZUFOZHNzUFFHN3Y4?=
 =?utf-8?B?UGJoZitmZk9DakJEL3FScURtWHlYeS82Nko2WW1vZUdxaHFBT1BISWdESWZJ?=
 =?utf-8?B?bFVJenhNTFp2WmptMTlLSFh5NnNtVlVVb0wxRmhVeHZQUnRWSVdkLzdQOHJr?=
 =?utf-8?B?cVZ6T3VzRjVwbGFIbTlFbkYvMnN3aG8raTRXWkR2Um9uUDEyYU9wQmcyYUVq?=
 =?utf-8?B?K2J2Q1dzZnlLSFNDOExsSk5mSDBEdGpGK3dKOXZxTHhNaE8zTGNGQWQzWmVl?=
 =?utf-8?B?K1ZZOWdRL1plaEZSdnJwcy9xY3RqRFJhR2k5RFBwajhwakVXcmhjTENjRitB?=
 =?utf-8?B?cFJ0SWd3bEt4ek1pMlZXQmpIMXFPbGdNTitGT29lUkphU1ViZ2ZzS1N1YUJa?=
 =?utf-8?B?OTVSY3YzSDh3ckFnRCt1TEROL2pOVmZHL0xJcG1iRkxadGEzZEtXNEYzT2th?=
 =?utf-8?B?SGU3NHNheWx1SWs2Rlo2SVRLbWpCZGQvbzZ2NGRDKy9RNkNNSmJjT3phbzU3?=
 =?utf-8?B?eitXRW5iWWpxdHdSTEp4K1VyZ25MTlg2MjB5dTNyTWxrQjMzaDh1UG9kZGVn?=
 =?utf-8?B?REIwNloxYmdiNzFwOFVyT3ZONjBVaHBVZXBEMElxK1hXdzlITjltWU92L1RP?=
 =?utf-8?B?RGxYODUzcUVkOXYyREtIbUFqZXhIbDhBUXNIK3JpejRVWW02T3dLUnloMzVu?=
 =?utf-8?B?eDg5K2VFU1ZFc3pVQ0t3OE91R0dkK1RnVS9pd2F4WUx5dGZhWmlLZGNWdEtJ?=
 =?utf-8?B?L3VYb3Z1S1JBQno5aHhJMWh2M1VTbVpnQlh3dDU1dUhKQ1BZSHlFR2J6Z2gz?=
 =?utf-8?B?cGpwNUw4QS9jcXdrbFZhSlJ3SkZ0V2NtVy9JbC9Fc0I3aVF2RmNvZVBaWDEr?=
 =?utf-8?B?R3p4SEJrM1R4dndDZ3RJTjJRbldWbVVXK2NGQ0FxcE5NTXNZSmVRNUs0dzk3?=
 =?utf-8?B?YjBhSGxpT2doTkwyblllTEJaUEl0SE81bVZLZmVZQ2NzdWhPcjlJSFlTV0tY?=
 =?utf-8?B?YmNRODJBWDdhaTk4YytyTHV3WGY2NGpEejFxcWxhenhvSmlPTC9neXZ0bXRQ?=
 =?utf-8?B?T2dZZTg1c0hjMkVwZStiNXFkS1RwcDRXZDQ3b2c3aGMwYjJTMnc2bzRPZ2Fl?=
 =?utf-8?B?S0hQc1BTeTNIOHpGamcyRFNZSlR0SjViZ0NWZm9NRWswNjUrOEJKbjRxbUpD?=
 =?utf-8?B?RUkyNlgvZHo4RWYveTZUR25JVE9RYVduaVoyV205UWFnTTNtb0dqWmx6T3RX?=
 =?utf-8?B?NGQ3VjY5SXVFYkN3SmNBaTZhMTRuYVE5SnRLdlZKN0orSFJhZFNvUSswalB4?=
 =?utf-8?B?Y0xZWWVZTllHWStPdTI1cTdYbVRYMHJDc0NVWEdDSjduMTAzR0F0OVZsOWZG?=
 =?utf-8?B?VU5iRGJVaW5sYTVqMk1Gc05veEM0VkRJcExURWRXQ0VZc2prUXdRZ3VDQzkw?=
 =?utf-8?B?aFhGUkg2V2dHQXNDRElsUUgwYVBSUnl5ekFObm9tOVhpYjQyOUpPLzFtV0xj?=
 =?utf-8?B?WldteTJaTnRyckV0TVE3TXpVZjk0OVFtZGlJc1pDQXJWMHR2NG1jT3kwK0E3?=
 =?utf-8?Q?KdTslSsxjAgfCwqCMFhc9rZ9mPUC4izT+EdTWGZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e97e60b-760e-4a32-97f0-08d971613b65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 18:07:47.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1POKSrEGRmFY4zTTBpwp50UhM/6sP/EJq5QlxM7n7uNq34mW+8nkCYSCaz9MQwo5/me1Mezze9qtOC1pvs17wH/JpbD4oED30DOOmtJPBTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4997
X-OriginatorOrg: citrix.com

On 06/09/2021 16:17, Jan Beulich wrote:
> On 06.09.2021 14:00, Jane Malalane wrote:
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
>>  			  c->x86_capability);
>>  }
>> =20
>> +void detect_zen2_null_seg_behaviour(void)
> This can in principle be marked __init.
>
>> +{
>> +	uint64_t base;
>> +
>> +	wrmsrl(MSR_FS_BASE, 1);
>> +	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
> While I don't strictly mind the "m" part of the constraint to remain
> there (in the hope for compilers actually to support this), iirc it's
> not useful to have when the value is a constant: Last time I checked,
> the compiler would not instantiate an anonymous (stack) variable to
> fulfill this constraint (as can be seen when dropping the "r" part of
> the constraint).

This is "rm" because it is what we use elsewhere in Xen for selectors,
and because it is the correct constraints based on the legal instruction
encodings.

If you want to work around what you perceive to be bugs in compilers
then submit a independent change yourself.

>> @@ -731,6 +744,11 @@ static void init_amd(struct cpuinfo_x86 *c)
>>  	else /* Implicily "=3D=3D 0x10 || >=3D 0x12" by being 64bit. */
>>  		amd_init_lfence(c);
>> =20
>> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
>> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c =3D=3D &boot_cpu_data &&
>> +	    c->x86 =3D=3D 0x17 && c->x86_model >=3D 30 && c->x86_model <=3D 0x=
5f)
> DYM 0x30 here?

0x30, although it turns out that some of the mobile Zen2 CPUs exceed
0x60 in terms of model number.

As Zen3 changes the family number to 0x19, I'd just drop the upper bound.

>  Or 0x1e? In any event 0x5f should be accompanied by
> another hex constant. And it would also help if in the description
> you said where these bounds

From talking to people at AMD.

>  as well as ...
>
>> --- a/xen/arch/x86/cpu/hygon.c
>> +++ b/xen/arch/x86/cpu/hygon.c
>> @@ -34,6 +34,11 @@ static void init_hygon(struct cpuinfo_x86 *c)
>> =20
>>  	amd_init_lfence(c);
>> =20
>> +	/* Probe for NSCB on Zen2 CPUs when not virtualised */
>> +	if (!cpu_has_hypervisor && !cpu_has_nscb && c =3D=3D &boot_cpu_data &&
>> +	    c->x86 =3D=3D 0x18 && c->x86_model >=3D 4)
> ... this one come from.

From talking to people at Hygon.

~Andrew


