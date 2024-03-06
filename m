Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61426873E20
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689452.1074435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhvgr-0005Jz-UX; Wed, 06 Mar 2024 18:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689452.1074435; Wed, 06 Mar 2024 18:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhvgr-0005IM-R9; Wed, 06 Mar 2024 18:08:29 +0000
Received: by outflank-mailman (input) for mailman id 689452;
 Wed, 06 Mar 2024 18:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VYTB=KM=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rhvgq-0005IG-5d
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:08:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 869d389d-dbe4-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 19:08:26 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 18:08:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 18:08:22 +0000
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
X-Inumbo-ID: 869d389d-dbe4-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXWswHKpyV4sj36i+QY0iSVVlHLD6L1GXbvDehMJFf/TV66IC7nbdCxQwcShIzds9I5QTq1euiwN6ts9vpYZp+2UTv3FBN90nhRTtjToNNzijihSBV97eBeOSl7qiCyPDayeTl5esD6ufvoGow585PJMF6BHlcDNtDAxAF5MCStu8+6ogUIb0ZtRy1qjIUl29h2W4ASFiNOC7cTZ3+G6xijpdKwERBVuShReoYJc+RBB7b+gMzaZSPhNZZEkz1LVB6kRoqY8N2BcKW53QSwSc7ANMXPv/c7gzIp/NvT4+m7cdsOElPnhIH1I5ScFbTPCSentYBvpc/+mo8PHjBIZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCDgLiYEndT/i2zM6Nh2/QLh+4ErkHJLrN2eNndJs+E=;
 b=E4+7n90bJfPBWfWa2HAbwQSIC9DBAaMelp8ibd6ocTYCr2dFV3J4Z0TlJY4mrw0ZcFdrtqIjQFzT54eCWOgyIH6uTtCkpdNwNHuvq/nPgi2vMCDA3SxT9CuibriEV1k+6Y+VHR+ecqnO/o4EksXOJf95GfJ5xb8B025Nkw8J0W13TDQ2wa8Jgf41HMmENsOjbp9Z8cmr5ImtGB0B7HWil1BCea76gtcaWxXu+PZD8d40b/HhRJIXdHuKJY/SPove0GGCwLweQGEAlynwTkR80jslTdsxceCs0hOXnb1QlRQPG8ykyN7WeMUco35EC0H92gc/7gzl9kN0EfevRbtf8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCDgLiYEndT/i2zM6Nh2/QLh+4ErkHJLrN2eNndJs+E=;
 b=n/9dkPnPsze/2717LnI6rslqpoTccZ8iekjHWNQ62yRx0SQR21dccon96IN8VkGbyqhXfV0QJkEmcce2fgLX+BTrb1Yo4UFQfmSPLN8eZZHoPMKi7u2jzGHtVSOzGT/nBgvhs8/hQjNKBHfs8yYeaNwTtioPpXsyOTjm5N1gOwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <19852f4d-fbeb-4314-a2cb-ab3f05da13ba@amd.com>
Date: Wed, 6 Mar 2024 12:08:19 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
 <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
 <CAKm-UmZoKwre8-G793VqRNFCmzAti1o-0Kp3ZyV_Z5cc0YNiKw@mail.gmail.com>
 <CAKm-Umb=kGFqc5je9E3bbfQ0bcbZeY_Ntv5JDmO-vXj3N0MvPg@mail.gmail.com>
 <CAKm-UmZ113q-a8wEE5yo0OPPM3JpNqJzKaU1eNiCzT2YkGU0pQ@mail.gmail.com>
 <CAKm-UmaG3KRtDkrEH7cNgLkRkRs2HG357S=BUjomhN6Ad-AkCQ@mail.gmail.com>
 <a3472888-7bfb-4889-8ccb-58384afff324@amd.com>
 <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAKm-UmYyxC5SrqdW3MYj326J7CCGRHZpc1+D0Dezd27z++3JJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR02CA0128.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c99929e-468c-4710-fc21-08dc3e08694a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NaT6c8zKxmb5RQEDDeCIVnKHzR9kUMeNdCBO8BEIwfV0ftofyt3y3y4ePT0b+o99dGEfv/dbVE2o9K1t8ijCZ4CilywEtz1kSII/PrFOY5iBGkba79nQdNyjFWknCD4yCkL0kN5gVR9tQPEpjI1scv9tmd/UQaUskkGDi28W6arVDiPsD4814bk+gqrnLLy9+7TTnv5mr3CltlUCIZgDCAMAbpvbnxz0qi0SkirhviEW3nxJy22uWchCfVLgeffOOh4g/JfXyNGy9SL53DMlb2R8iFoI6PGHN2gnGqnDh1mXSIEoj5WCN4w0fyhPnTB+hMeoMSaatqGQiFEbc+eaFCxrAeTgB6WxZNetlzPBNj+jZCg/e+ANopCwKupSNbNVx0t9KYT5i4GZnOmPdEawnZgFr1iLd2juq+HvNKo1CZZxzsk/IXiOVTWqubPZ14sSIbKYnlEmmvdZELykWJjz2i+eet++h/iXK+o7+4q84fGzGhxl6Qskj2j/ADKehcTCPKoq2Z+3VxaF4obB4dIw0ennD2HDs36odkTSK+56U5r+xkTXB+Vngq7NB8VJR4k4Kuq2F4XrA5yjL+sOR6114LSe/RhcVSSSNIvaP6trO+I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlEwTGNMQi9zQmFQSU1wdXMySXh4UnU0NTJCa2M3OFVJVG5WeERya3Jwd3VQ?=
 =?utf-8?B?RmFVOWk5NGp6NmJ3QXVpdmRaZ2pmQ3dvdXZabCt2cy9aTWowbVJqQi9NS016?=
 =?utf-8?B?RVUreDUwQ3NzOHRQWkNialVvTjhVK05QVVA0ZDRFNnNQYmlaZll4aUJ0Tm1K?=
 =?utf-8?B?KzFGdUhRZ2ZFNlZHSHJCRUJiRjRKUjljc2xieThvSjErdWhYVWUvVUNRaHhw?=
 =?utf-8?B?K1V5YysrWHFRTG1uK0QvRU5GM25jM3lDN1B3Sll4emJGZ3QreVhzTVIrYUIz?=
 =?utf-8?B?Q3RVU3dSUWRwZ3FDa2VRUDdpSHYyOEo5bUo0Z1hWTXl3ajVPbk5FUVFXVDVl?=
 =?utf-8?B?U2NtSmtEbnNmWEdHWjdXcTlLRFpLMkxjNlR1SC8rZytBN09nODZwbTd2Q2M2?=
 =?utf-8?B?QWs5ZkU1Y1NBdjhBY3pTWHhtQTNIWkt2N1pxMmJhajlBajZkRmpOZHBpWjlI?=
 =?utf-8?B?UFpma1F1RHdPYWY0aThQNWhFYkRPVE0xbUxIVFJhUXVWRkI0VmJLTVoyRGRl?=
 =?utf-8?B?VWtGbjV0MXU3eURhZEpXVUhPZDBhY3NZTFl2SStkdU9mRk9UL1hqMTlCUEMw?=
 =?utf-8?B?M0FPR0ZqQW9rSi9rbHhaRzNUOFdrZW1nU3JlZG5MZVBpOW55UHpGZ0lOb0V4?=
 =?utf-8?B?SVZ1UittK3MxUFhNUTRjTWt4M3l3U1Q1V1pRQ2dtQW5KTDBBRVIvbFBkdlBI?=
 =?utf-8?B?N2wzc0ZEUG9UMmw4UklPSVBGYkRoZnZpa3hOYnAzaEtkWDBIeURYZmpxVlRt?=
 =?utf-8?B?ZWJGMjNOTU9MZGlHOVc0R1RPSUlKaWtHbUhDM0pNSUtObkM2blJMRXJ4QitI?=
 =?utf-8?B?MEwyMnJYOHQ2anRqY2F2UmxsMVJNS2Q2S0FlOFVyM29DOGZvZ2ZVZmJEMGlF?=
 =?utf-8?B?b045RjJVVXBtQzQ2VUxjU2ppQUpwTkNnNWkzcnVjbmIrQkhzbmJSV0syaGps?=
 =?utf-8?B?VGlmenlZQlh2S2VaTmxOM2ZuS203dlptdyt5N0JpTnlScHpSS0VSUW91R2w4?=
 =?utf-8?B?WXpoNGlwRitMcFovdS9saVpTTjFmRlJkNHEwb1lKQnBPK1IrTGl0MHlGU3pK?=
 =?utf-8?B?QjZOK0E4YSs4OW9ZcGpiL2FnY3ZVWDRXeEcvRTY1ZHdUMndyakpLcXIxYzIx?=
 =?utf-8?B?K3ZVcHRVckNKbnBTZG9qSzJZL2F0VE1kN0NrSFZGSEpNODVzUnlId1RnQTkx?=
 =?utf-8?B?YVJvSXBrdVJYSk1tVC84SjZIV2J6aG9xSVE0MTlaeUtXVFMzcy9LR0RidDhq?=
 =?utf-8?B?eE1iK0p3ODNDUkF3ZDNNMTNzZlAyNzNjM1V0S3RLOUF5djU3dnJIS01oVkhk?=
 =?utf-8?B?ZFVpZzFURXNzVDJLcDBvS1p6YzFqaWltb01vSzJJY3o0TmVvOVc0NmVnOWpq?=
 =?utf-8?B?N2Q5MzVzZWxNTVZKV2VtM2NVTGx5MWhPZ0cxdlI0Z0h1ZzNURXJGMEhVdHRC?=
 =?utf-8?B?WmNLZjNJRGdLdk9ZbEN4bS90Yld1cVpUN3JRR1p2NS91OVgrQUY2ZkxSRE9I?=
 =?utf-8?B?b1gwR0pLVGkzTEtFRzczQUJVdnRLWmpwanRTTnZDUzcwNk5vbGY4LzgzdnRL?=
 =?utf-8?B?dEVGUGV3VXZEeGhWRWc0dmZTNDZlTGU0YkNKbWRaU2hlYVZlSmxOVVRhNjVh?=
 =?utf-8?B?cGFISDhPekVSMVpIMVVRSVZYQ1FuM296elVUZGQvTjNUY296Q29JdzcrSDdJ?=
 =?utf-8?B?M09IVTE3ZkVhdTdGdFcvamtVdzJBbW1PZFo5NTZ3c0s5cmpmZlRiQUtMTWRD?=
 =?utf-8?B?VDhpWE5zVEc3MGU4ZEY1RVAveTA4YVQ3OVNmYTFnOFEyb1A3RkdjMElDOTRh?=
 =?utf-8?B?TFVocGxQai85cllhK1hmWGlpS0ZlQnJ5QnhWejhpVHhIU1dSeURyTXBxTGJq?=
 =?utf-8?B?TkEvemk3U0pIemVLM0U5dmdMTExVb1g1TkdBZ1RkZkdyMDhTTlVRT1l2WUdm?=
 =?utf-8?B?ZnAvZnZTUDBQak9FaXkyNkQ1eFZ2UHptQzV0Z3dyRkZ5WGQzb1pMOThURkdj?=
 =?utf-8?B?cHdMTFF6dWUyb3c2N0l6TWQyakhpekRtb3l1WVZXOHV4c1NHSjY3YW1OM1Zp?=
 =?utf-8?B?TzR3LzB3bW1JdjV0VWt5K2lFV0MwMUhuRy9zdmp6YXlkZm1FdGR6UnZjV3hx?=
 =?utf-8?Q?VGV2B2ZlbElFK9J08+ZQuAlpY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c99929e-468c-4710-fc21-08dc3e08694a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:08:22.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dm6fHIKw0ocqPKrVZYnT+cwu/uMRBGIh4ssPgyK2SXGswpctVGrGszpLd17N8RYSx9y/VyI3A7gDTDBPYEnPcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612

On 3/6/2024 12:05, Sébastien Chaumat wrote:
> 
> 
> Le mer. 6 mars 2024 à 18:33, Mario Limonciello 
> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a écrit :
> 
>     On 3/6/2024 11:28, Sébastien Chaumat wrote:
>      >
>      >
>      >
>      >
>      >     Reasoning backward  (using a  kernel without the pinctrl_amd
>     driver
>      >     to ensure xen only is at stake) :
>      >       checking the diff in IOAPIC  between bare metal and xen 
>     (IRQ7 is
>      >     on pin07 on APIC )
>      >
>      >     using kernel argument : apic=debug
>      >
>      >     bare metal :
>      >     [    0.715330] fedora kernel: ... APIC VERSION: 81050010
>      >     ...
>      >     [    0.715433] fedora kernel:  pin07, disabled, edge , high,
>     V(00),
>      >     IRR(0), S(0), physical, D(0000), M(0)
>      >
>      >     xen :
>      >     [    2.249582] fedora kernel: ... APIC VERSION: 00000014
>      >     ...
>      >     [    2.249730] fedora kernel:  pin07, disabled, level, low ,
>     V(60),
>      >     IRR(0), S(0), physical, D(0000), M(0)
>      >
>      >     So the APIC table is not the same.
>      >
>      >     As strange as it looks the  (IOAPIC 0) pin07 is correctly
>     described
>      >     by the APIC in xen but yet differently than in baremetal.
>      >     But the APIC message comes long after the
>      >     [    1.833145] fedora kernel: xen: registering gsi 7 triggering 0
>      >     polarity 1
>      >
>      >     so I wonder if the APIC pin07 info had any influence.
>      >
>      > Finally found the fix : adding ioapic_ack=new to xen boot parameters.
>      > Not only the trackpad is now working but also the ACPI Embedded
>      > Controller which is completely disabled.
>      >
>      > Sébastien
>      >
>     That's great news!  I'm personally totally unfamiliar with
>     ioapic_ack=new, so I did a quick search and found out it's a Xen
>     parameter (I came across
>     https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html
>     <https://xenbits.xen.org/docs/4.5-testing/misc/xen-command-line.html>).
> 
>     This mentions that "new" should be the default, so why isn't it the
>     case?
> 
> 
>   "This is the the default unless directed-EOI is supported"
> xl dmesg without forcing the parameters shows :
> 
> (XEN) Enabled directed EOI with ioapic_ack_old on!

Got it; it sounds to me like a logic mismatch in Xen then.

> 
>     Also; I'd be really interested to hear what happens with s2idle with
>     Xen
>     now (if it works).
> 
> 
> suspend to RAM now works :)

Do you see /sys/power/suspend_stats/last_hw_sleep increasing with your 
suspend cycle?


