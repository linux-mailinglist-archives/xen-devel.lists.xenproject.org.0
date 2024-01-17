Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ADD830476
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:24:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668213.1040602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ41j-0006RQ-K7; Wed, 17 Jan 2024 11:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668213.1040602; Wed, 17 Jan 2024 11:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ41j-0006Mt-E2; Wed, 17 Jan 2024 11:24:11 +0000
Received: by outflank-mailman (input) for mailman id 668213;
 Wed, 17 Jan 2024 02:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Go+f=I3=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rPvT5-0008Gp-8d
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 02:15:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53ca3fbf-b4de-11ee-98f1-6d05b1d4d9a1;
 Wed, 17 Jan 2024 03:15:48 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Wed, 17 Jan
 2024 02:15:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7181.029; Wed, 17 Jan 2024
 02:15:44 +0000
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
X-Inumbo-ID: 53ca3fbf-b4de-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JesTN+TRmGKF5Yq9UL2pgs6A5/yec6Q3Ylh1kXaparPx0NucrQFNqSXIGeoDNaMU5pqA64O1GYMdEPdy/F3hHJz9UI8SVZ/nAnMacz/zPHac4RsRTFtAfnLfCpB+kNz481T2IeAp964YL5/5/RqcQq+J81tWGA6VA0keZgg8cXU63ovuWThbgrMuHLy50isDrHOrT3oNIy0nFdNbgEA0wU2B1dH5axTu8Zv1K6d/vfWGunj4ihdo7776IcrdH7EafBpQdKMIRrQ6MMRwm+qR3tiwGvkEbFZj43mi6mgAg8aHyIaVBrWyIqVjf8zJlSW+w8JH53woBhLL5QbRYWNVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsTljQCujIoxIj6coHRh8yy3EymOymYrxEmjuvWwg5I=;
 b=czUcJfiOV9tAQhbRS7MrhoBUlPls8mWvOQ1Zja1RhhbvD9/vV0c66Z/FrMfRmdG8aqKUiVEyetH2gRc6AGeC11JWPgnYOPl5UyTRo5yLvU/8rCNsOK9rUH6udqp3T6LN1L4WQXkfpVlB+BBKwZ5y29obZWlc3L1nfxCD4w+PGmOz+5tjOCM/vXchxKvUOXj6QQzLKAJG4B9YtghRRUdQLPyf4ilVEowwp/i0inQNA8TQHvbofxGr8/GtqWzAnRyNyssa8R3ca5D2yAS3xBHi9C9LXgQab20gfrbXZMTrEgASfgdfDVysQgZN9JKzqEjV9DOo8HnxV/+33RqhJjOZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsTljQCujIoxIj6coHRh8yy3EymOymYrxEmjuvWwg5I=;
 b=nMhG13j1Nxmw598d3l5QB3KWuLG8bLnyHYYsygZtMPqNd1GCD2Gr+cgMKERYLFBB96mLO4dn7A1v7n3jZowkHza00x0j38BlpZGkzW2xN9JeX1o+U+XI1bt0qLUjEsDHYJZwZwOCdswR4Zv0RclL8An92t1iJ4aFMhZGvgL6x7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
Date: Tue, 16 Jan 2024 20:15:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?S=C3=A9bastien_Chaumat?=
 <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
 <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bdeeaa-be58-4966-9a53-08dc1702362f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	St1Rnv5mvvfxyVArx1bwdZp2L7NjFBsNXgCia2CbVMMoEHdKIqzX1Q4zSVwBFuA/l7ayouWvkugFDS3I00lSeWI6B8omO/r3fz1cmuXeCvHXdIJcDeWwPH97A+sodTfG/CyZlZXF4r9hYuTkkWoO3x+peLlwQaX/05sJ3MsasgsNbbXjBTvsRAzUkQQ+ci3FdvjVr64MmJ/JmVAly7NbGQdvBotW6vnXwiyQ/F1ivpVtd4c6GNqN0dVkOkE1hMEQPyJy0rWqvloHn1FlBYAG6ydpXYTUcyOA/NPP77mEp8ANT2K7k7zX6KaS6jVuxu2c6HyEucqYvTkjmGMeShXWjBVa+DC5aC+em36kG5NE/QN20/+nQPIiuqSaLEVq29s8OFYguU7T5Nrwf2AL+Bcwa2i6NN+cqWhjYaxlypJq9A8P/HJm5Rq8XLCDDumpKQUMg0Bf3wlm2pu3wG/VfK/cuMTZ5iXNLDoJ4uURF9wubizsOLFE7Vmc8wkLhvQvtSxYLk51GzpvjufjHz3iTCrf0ULLey7/DeYQ8HpEXRbYwMmwtQ/+O5bGaMCsqs64fJpd4vqiQilyxKgwz2mFKkFtS9W4Yl1awOTuGmxUyDBobpTg/aJnBfOP86ipPh2siFuM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(44832011)(110136005)(4326008)(8676002)(86362001)(5660300002)(966005)(66946007)(6486002)(66556008)(8936002)(31696002)(66476007)(316002)(2906002)(6506007)(36756003)(53546011)(6512007)(83380400001)(26005)(478600001)(2616005)(66574015)(41300700001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlBzYTBSdHQrc3dka0xFT1Bjc3JaQWdWSHJvUEhFWE00eHRJKzYrSlJDMmtj?=
 =?utf-8?B?eG5pMUxoQ2dkUm5JcHVVTVJ0aXE5V2c4TGJ4WVBpc0ZsWGNTcmxGRGNueW04?=
 =?utf-8?B?WG5LRFZ6ZkxET3JGcW9TeHZaS1lMS0xOTWk5SlJzaitPZXJDVzBjV3NJdzFv?=
 =?utf-8?B?alNTR1VHZUgyUG01UGJEaWs4WnlMTjBqaEJxaitnZldpS2crVGtBK3dENEZR?=
 =?utf-8?B?Q21wcW54RE9RRm5GNnRxcnFFT0RHTVFmeHl0WUM5NkJyZ1VqRW5TcUNDcldV?=
 =?utf-8?B?UzZxVXN3eHZSbGxyYTVVcVRXdElOeU9udmlqN0loeVAwUzFRTnNBUWpJMDM4?=
 =?utf-8?B?RytNbVU5T1FVZGFGVXUrMHRnZmpGYmZCS3cyekNxcnBDNjFpZzZ2TkJXRXMy?=
 =?utf-8?B?MHN6Q2NQVGozcXFzQXVTUHQ3NHR6REtDMFpzMnpKNXd4S0VObE53V1NzTGhJ?=
 =?utf-8?B?VzgrUm5kWWc4NWh4UDhHT0o4dlRqV000UXpDTTNaMFJaUk43NFhkTFUyZU9w?=
 =?utf-8?B?UWwzdm1SN0c4RnBhMjA1TktJMUtZQUN2RnhVR2JNRXkzT0JHZkR6M3d4b2ZM?=
 =?utf-8?B?OWZvQ2FZcWxibjdZTktiaFlHdkZMY0RhbXlhSE9zWmNJNTl4Vzhmbk5lVXY2?=
 =?utf-8?B?b3d3dWZOeEZNcGgvck96d3A1OXMwdXpkZTBDZ1RLRzB0dkVOdVl3UkFXSDJJ?=
 =?utf-8?B?QXJST3ZKSnhveXM0YTVPalRxV25FSnBqc2VjUUV6dUdmaThrdTcwYitNVTEw?=
 =?utf-8?B?cUNwVCtrSnhTNFR2QWFrUjNxQ1dpTVEvRDIvUGx2dCtaSDR6MFdIRmxIMnBv?=
 =?utf-8?B?R2hhMlV4MzB4cTdXbjBrV0ZaZmhWblVjZ2xxUVhXdXJERzBEUmxnVVQrSFlY?=
 =?utf-8?B?U2lSQWxFYzlJak5md1NYLzJWQjhveEZ1QUxsNVcrOURlSVE2bGhGNUptSHB5?=
 =?utf-8?B?RDA0TnFUUjVnUmdjZy9qd2ZWY3h6SU5hVTF4MnlEeHh4SGFTaktkVVE4YlIy?=
 =?utf-8?B?Y1JIUml3N0xQbXJFdndOQXpoTCtwWE9sYlB2SDg5K2t6dkQ0eUJVL1lrMkVl?=
 =?utf-8?B?Yi9jbEZIcUV1UTFXbVV2MEpvNlp1UTIxZTIvVXYrTWFPQ3Zzcjk0TGM1bTVP?=
 =?utf-8?B?bHQxQlFJR2JWZ0UrbC9YTStTRG1qNmRRc0U5L3BMVllyZWQ4cTlwdDJIL0NZ?=
 =?utf-8?B?YndTa3UvYVVUd3dBQ3RHVWxQVk03a1RSaTBUUjFrOXpYTXBJMUJsaWtJU2Fy?=
 =?utf-8?B?Qm1sSzJHSlozNW1XVlVleTYvYzB2Nmk1T0V0dkc3NnpUT2E3a1ZiKzhaaDc0?=
 =?utf-8?B?WmNPLzJxN3p0UVlYY0tDN3B3cDAvVmhFOE1NcFN0SU4wUWErOUl6MW1yZklG?=
 =?utf-8?B?QlVTK1hQc3o5K1lXcm44WTZDWkpGSFp1bUV6enpuSlM0WlRVNUV2c2k4VnJU?=
 =?utf-8?B?ZmNpMGRWZHowZ2RDOTJoRk45R2orTmRIYm1nR1VhUUFjSTgvUFg1MHAwVmRB?=
 =?utf-8?B?SmFrNjg0NkMyS3Q2WEJqZ2U4dFdlaWJQbG8vaWQ3dXR5TmJ5bm1wNWl0MWc4?=
 =?utf-8?B?NlMraG1uQWoybUVROHBabUlsVnhMekp6bVRMSU1nY1pRS2hOazlXeHYzb01R?=
 =?utf-8?B?YjNZc0lBUWtoRjl5anBkN0VzdU9TYXI4OUJEK0ZRdEpXeW55WEE2OWQ5TEpr?=
 =?utf-8?B?aVJ1OE5JVFR4MXJ2SlNTdk9TdnVHZWlZQi9ZUG5MeFB4d25KSlVnZzA0WjBF?=
 =?utf-8?B?NEtkbXFBOUZNRm81cldhd0RWa1doTEZTWkduSWkzZjRxYUxBdDFsNXRYWVlM?=
 =?utf-8?B?SEZzYzZtc3RsQndjdlBOZXhwMHRZRURLOGp6cjlVYk5Mc0FuQmtlaTEwTXNC?=
 =?utf-8?B?MGFtVGZGWVRZUEdQMjJlNFU0am1zc2I2SVk3aWJlbEpyV3lNNCtON20yQkpu?=
 =?utf-8?B?N1VaMmR5aUtUVE9CMzUxa2U0eXNLNEFtOFVQekJGaEVISnZUaGFzODM3VEpZ?=
 =?utf-8?B?S0FhU2FNMEJnQzh4ckRKSG5mVXNHTkJvbmlvL2dOQkljZWVsdmdpWHBJcHJw?=
 =?utf-8?B?U0hlVS9EVzFMMU9PUkh6d0xQS1l4MTE5UHlNK01tOUdSWC9USlZYUmt2UXpv?=
 =?utf-8?Q?Yj+ms6M1u3GkjiPYrN5qOafox?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bdeeaa-be58-4966-9a53-08dc1702362f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 02:15:44.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYHHUN5RimWGQrXS/xtdhlha826l+alhPMSz5nRDsYyXqpd3fI3+LUy6/gHub2A4dEWYh2PB5ziSlvdezsMfeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132

On 1/16/2024 10:18, Jan Beulich wrote:
> On 16.01.2024 16:52, Sébastien Chaumat wrote:
>> Le mar. 2 janv. 2024 à 21:23, Sébastien Chaumat <euidzero@gmail.com> a
>> écrit :
>>
>>>
>>>   output of gpioinfo
>>>>
>>>> kernel alone :
>>>>
>>>>          line   5: unnamed         input active-low consumer=interrupt
>>>>          line  84: unnamed         input active-low consumer=interrupt
>>>>
>>>> xen:
>>>>
>>>>          line   5: unnamed         input active-low
>>>>          line  84: unnamed         input active-low
>>>>
>>>> xen with skipping IRQ7 double init :
>>>>
>>>>          line   5: unnamed         input active-low consumer=interrupt
>>>>          line  84: unnamed         input active-low
>>>>
>>>>
>>>> So definitely progressing.
>>>>
>>>
>>> Checking /sys/kernel/irq/7
>>>
>>> kernel alone :
>>>   actions: pinctrl_amd
>>>   chip_name: IR-IO-APIC
>>>   hwirq: 7
>>>   name: fasteoi
>>>   per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
>>>   type: level
>>>   wakeup: enabled
>>>
>>> xen skipping IRQ7 double init :
>>>
>>> actions: pinctrl_amd
>>>   chip_name: xen-pirq
>>>   hwirq:
>>>   name: ioapic-level
>>>   per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
>>>   type: edge
>>>   wakeup: disabled
>>>
>>> So the skip of IRQ7 in pci_xen_initial_domain() sets the correct handler
>>>   (IIUC xen uses the ioapic-level and handles the eoi separately), but not
>>> the correct type (still edge).
>>> I guess this may explains the results above.
>>>
>>>
>>   Mario (in CC) patched the pinctrl_amd to flush pending interrupt before
>> starting the driver for the GPIO.
>>
>> This helped in  the sense of there's no more pending interrupt on IRQ7
>> (whatever the handler is, level or edge) but then the touchpad is not
>> detected by i2c-hid.
>>
>> Is there any work in progress related to the incorrect IRQ configuration ?
> 
> I'm not aware of any. As per my recollection it's still not entirely
> clear where in the kernel things go astray. And to be honest I don't
> feel comfortable trying to half-blindly address this, e.g. by trying
> to circumvent / defer the early setting up of the low 16 IRQs.
> 
> Jan

Shot in the dark - but could this be a problem where PCAT_COMPAT from 
the MADT is being ignored causing PIC not to be setup properly in the 
Xen case?

See https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/ for some context.


