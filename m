Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E715A6CC17C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515870.799162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9mf-0002e0-8b; Tue, 28 Mar 2023 13:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515870.799162; Tue, 28 Mar 2023 13:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9mf-0002bm-5j; Tue, 28 Mar 2023 13:54:45 +0000
Received: by outflank-mailman (input) for mailman id 515870;
 Tue, 28 Mar 2023 13:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9md-0002ba-PH
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:54:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16ed3f8a-cd70-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:54:42 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9657.eurprd04.prod.outlook.com (2603:10a6:10:31c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 13:54:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:54:39 +0000
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
X-Inumbo-ID: 16ed3f8a-cd70-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbOTnknAQZWimc13KZlIh2OIVBo2eiyAYM4zba11qrKaDyuTkhC1eb/80zRGZAegNWYUmoD5aB/qhzX5xRPBOpHNd4uXAAzMm4iJi3+3HDJeJXdmAunIg0xE1XQJOtCW8bu90EQov0zQ6hZCWHXjs4nbuwwYmdySETN4Jst2ZcoN6JyJwGiEf3ZIAkWnv0Y2d/WW7s1a6sxK1Q2wzLUua82LP4omTn35JZ7+v12uAaJFXu2SLH/OgIhdy0uCi6PCtv3j33q8p6XfOASewt6/HZ4/5SslsPebeyC6lbyyGInMRy/IkhMl34hbhkjM6jXgBWDFja3zVb9PqsoMjdp8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=da4x69juNdHN/z5lLumvV+pmMAm8MxL/bno2l7xNtMQ=;
 b=P/wfK/4AWCgg0a3uQtzQwHjZ1UB0/QVfS3bzlGUAae/JR+lrUkzdclLU6i65YiMDxGseRKP4Nih/oi7lAjgeP9QNRjtmtOZs0Oala3T2ZvORwoifjfKi0TcE/XAQhI8qRiXdXZky662T3ucrkV7e4hkcsGMb72pIJ8tVZDF9sZ4Rrbd8/7tN2ng13N4jkwl7yJR1rvYfvE5exbZm8YxIy5T/D76rw2W5uAM8ndypTgvH8/w8RcrEaSFbi2GIz6VjQpR+4zrLLMjioXLr8MhA0DJkR8ze6ykQ4+5Eg70oMhGMFSEZBz+88iHjuDfvMxavLQ30M9Pjd/hVNBXrHEN+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=da4x69juNdHN/z5lLumvV+pmMAm8MxL/bno2l7xNtMQ=;
 b=sLsGNObzaTZ5tMeg4Dm04pcEv7qTEAyP7ziD7MzDV62TZK/+oam/hOtA+DWFpO8kq/XbPAZfKBvLUd2/Pn9mh6DCUPMS4KXiT2SbvA4uFKCiCGr9kN9/DdE1tzIk9pXMfMsmnRWVblGb06gSsYA7LsrPnQ1JHWUPN/E9wxDogy4XDGqyUUbcllkx0gUmU9brUspXA8FPG0ks1aV7Eo1f31xR5hRd8xzCC9t1lm7ECu2EjhQzWO77UvYJRm7/tOd21M3RmZbFhfNfYxte2N6df4QR45IsLG+8c1LUfDbQ4WAwxn2a4z1qraXRpFl+5LZ+ijzmB6q8sWViNsOwUKEXMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcba169e-9243-3e7c-f1fa-400af444f158@suse.com>
Date: Tue, 28 Mar 2023 15:54:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com> <ZCLl3ePLgrmFTViV@mail-itl>
 <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
 <ZCLrX2TmYlg2kMxL@Air-de-Roger>
 <CAKf6xptXovH5-OwuuJ4cNz4JxG-mw3mcwRBJf4PuTwjBA12fSA@mail.gmail.com>
 <6d4c11c3-31f1-48bc-b7b6-0ad0b73fc09c@suse.com>
 <CAKf6xptkHRcda5DPs4e2+7sgq8ck4-wKZhTHNC+43XWHZy_2TQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptkHRcda5DPs4e2+7sgq8ck4-wKZhTHNC+43XWHZy_2TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: 407e5bc0-9807-4064-5ed1-08db2f93f946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QHQsOmmid/oYaMQ57/ID5hGtokFcMPYmYn9zDeCbaUGF8gVGeibkh8UmPCYo4j84Cn7ka2D3KMdtSpcFOuLEEZL9yxCgJGx02G7EZppipea5kPakokOpbhplj1JvJ3zP0VWvXhkDDwLm7CwrqcOJvL5MLv3NDOWse4u4cFC+ZUtndw5dq6HyDItXPy25mAh+PeBZGicNIzleI+94GG494xzLHqaRj9Cg/yfnpEGjlrQ/M7gpO6uq+f6s64b+1y8ipe1Lrkcm4Z72FXAaWc3EvuC+GXGeTL0e9kmAfNPRC1FPKZc2ISZ6tR4491qLhaQ0j/Ql15pQLZVzEl0Z33Zn+qIo4/sJOREdzdazEal2eSlEOyI6c6Q06K/sbNkOsEX0tqqZlJlO3rS6PpXHRUDCL5IqEdM4fmHf+hRucUNvPxN3FPAs9Nao+icTB3BJBwNTeU88gaHXJpouf55oRpn9mTuupntQoizwah5mvTMikjqooikqrOT7HTWLfKkzE727m0ImHV7ssdiTkcm9o7XGUx/Q/MBlJZWlKM2fY3QuvOomnci5PYcfscMcCCKKGNLThIUMtVmAZhNqUjYYDk5t/7hseBuvhmF4/g1oeSoCNhXilC4gqmbGsALkj3/7H9zLK6O7W7sZQXHuGn/p3mgV3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(31696002)(8936002)(316002)(31686004)(54906003)(41300700001)(2906002)(66899021)(5660300002)(6916009)(8676002)(4326008)(478600001)(66946007)(66476007)(66556008)(2616005)(38100700002)(66574015)(86362001)(6486002)(966005)(83380400001)(186003)(53546011)(26005)(6512007)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3Q2elZ4bG0yU1NTQnVTdXRpNkZmZUtWU1NvdEhyNVduMTNKTUo4N0o1YkRm?=
 =?utf-8?B?ZTRnUFhHaUtFM21MNXEyMU1BaU1UWGdlK1Y2ZEFJNFBOUUZGS05lcXRrTy9z?=
 =?utf-8?B?U09nUGUvVEs0NjMrUnA2K1VQdDJMWTlpT1ZKWnd6aERiU2d5THpGZXl1dTRm?=
 =?utf-8?B?OEZ3QWRrSit0NXRuNENiZW9ZcEJtblZHUys4VmE5V3I0N1R1S28xSGZaVkg0?=
 =?utf-8?B?azJiMnBNZ1RsM1RKTlRRMTlhQzdMZ291SVZJNFVUUUkzWkZ1QWZQcEZZYXJm?=
 =?utf-8?B?Ky9ycXJ3c2ZqcEh4d0V2Y29NTWpBUDRWRVVGR2U1b0JXWk5ubGQ0Yk1TZFJ4?=
 =?utf-8?B?MlJaYlJON09EMlg5WXcxWFJ6S0NBK0I1aTRpQkYxWk5zSzIzK1hPbGtTMEs1?=
 =?utf-8?B?RE0zdVYvNGk2VXJWL3gxd3ZOYmUweTM1NzBmVnhtWjRYU2ZnY1loMnlLWXJt?=
 =?utf-8?B?RGsvRmVwYkZ6Yy9lRHpQZGZmTWZIS3RJKzMwSWQ5dFRpT3VjbjI5ZzZuM0FF?=
 =?utf-8?B?TlJjWjJOZHAyajkzTEd0SG91VitlVWxQaWszZzRlZ3B2Zkw2RG1uUmVYR0l2?=
 =?utf-8?B?TVpnR0krSlBuOWVYWjVlbkJEWjRQOUxmM0s0QmZJRW1xQkkyM0FnZzhWNm5a?=
 =?utf-8?B?Sm1ld1hjbGlFR3QybUhNT2ZLQThyZGJiclMwakFLbjdhUGJBYXAxZlBzWVpq?=
 =?utf-8?B?em5DaDI2UUk1anJ2T0luNE84enBHSkx2UHNja1VnZm5pMUVJcnE0WE1UZlJn?=
 =?utf-8?B?bHdZVW1zZHg5MDhkMjNPWURITHBjQi9UQWhmVzNxSFR2TTV6bUJSU0VEWXRp?=
 =?utf-8?B?VkM1RkM3dGp1N0EzUmtqbTBCNU9YVDFIZjgwVUtuMmFSdnp5UERTYjVRcTM3?=
 =?utf-8?B?Z29mSGpFcEdnK0FZOWJJUElsUXFSMTdUcVVvWndPNjV4N1ZiK0V2K3RuVVps?=
 =?utf-8?B?TWFIeGRRQ3cwQ3ZsV1BCZ05EK1FtSklBcmhmbE1FVVRib2Q1K2dzR3RyTUZT?=
 =?utf-8?B?OXp4TjkyMjc1SHJ2ZU13QWszRWwxUythOFpUV0gwSUdHK1grYmZoZ0xBS2cy?=
 =?utf-8?B?VlZ3VTZXbFdmaW5GaGxzTVFwU3pKdnF4aTRkNlpMOThzc29ZeTZPdVlhSFB3?=
 =?utf-8?B?eUlvWjl1YmIwM3RUNXRRZ216R1E0cFBlWGxuOUlMckYvdHdzdHhsZ01SZ0xF?=
 =?utf-8?B?Rjd5cGhRaG5yUEZLT3F5eTRVenJBQ2ZIcitOS0c4VW5oeXFyNmh6dEx5VVN0?=
 =?utf-8?B?ZnFiVTd6TURxakcxdytvLzFvbkwzUkNMZkR6RVU5U3h5RVhZZFpqNG1SRXRj?=
 =?utf-8?B?RTJiMTU3YTJOb2lzWU1jTnFXMGc5a2VaNGZjdlo4c0x2QXBqYVhITC94a1Zw?=
 =?utf-8?B?cTJNdkZydDVWQUxuNTUwOUphVkhTNDJ5YjI0SEdqQUhiWmxNWTJXc2p1T1dp?=
 =?utf-8?B?bW95RFYzeERCSUhaanpIZm9ENFU1cFpleXM3c0FwNEM1cVJsZXVhV2dObytX?=
 =?utf-8?B?YkJCdFNqclFnQTYxYlFoL2oycWJJd2VhcURvS2R1V0FTOVRzLzB4MkkrUjZ6?=
 =?utf-8?B?RkpYNldUMld4QmxSRk5iczFXTXI1bWtIOVFPeG81UlFaNlR1N3lSOTQvNFd4?=
 =?utf-8?B?UnpodUtGZldMbjZGVzYwVm1BUTRXckZQNGMyYi9BVVcvSFpyazM5TFdOK2lX?=
 =?utf-8?B?eXVPdFNCOVlFVTdjb0tzNmk5TmFZRWdRY2ovWjlSOVBzV0NHMEpIR213aHNE?=
 =?utf-8?B?OGR2elZGUnorZ3QvU2Y3dDBiS1RudlRwdkJsOFBqV2FNejE1dTliaTVXVXV6?=
 =?utf-8?B?bHdDWC9jMjJJeW5ybzQwaE5iTUowZ3Q1Z2xhdTNXZDVod2lMZFhIWGtCaHBa?=
 =?utf-8?B?eHNFcUcwWmRBcDN4NitrcTdvUS9SSzdZQTJpcFJ0YU5STTdXWGo0K1ViYUZs?=
 =?utf-8?B?UEFmYmd3WmlCeithVE01VHFoV1dQa3FuTUFrUjRvWnZJU3BPc0o1aEg1THpW?=
 =?utf-8?B?L3BIK0V4ZFErTS95RVpuRnY3bXRRaDNBdG5tNmpYLzUreG9GV2V5Y0MyOFlo?=
 =?utf-8?B?Yko2dzVvV21YNDdDTnN1M0F4VnR0Q004WVF1MC9yWEkzZXczRFRpM2pEeHBF?=
 =?utf-8?Q?Qpqp86XbH1MO/d312QNg1l7LZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407e5bc0-9807-4064-5ed1-08db2f93f946
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:54:39.2683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuGQYNNT4m8mCG0MhwLJ8WV54Ukovn4oXNQRtk5iITrDR/v1B7nzN/nUONB1NR67/dP9gQUijvr2HtopNxzTxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9657

On 28.03.2023 15:43, Jason Andryuk wrote:
> On Tue, Mar 28, 2023 at 9:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 28.03.2023 15:32, Jason Andryuk wrote:
>>> On Tue, Mar 28, 2023 at 9:28 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>> On Tue, Mar 28, 2023 at 03:23:56PM +0200, Jan Beulich wrote:
>>>>> On 28.03.2023 15:04, Marek Marczykowski-Górecki wrote:
>>>>>> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
>>>>>>> On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
>>>>>>>> Some firmware/devices are found to not reset MSI-X properly, leaving
>>>>>>>> MASKALL set. Xen relies on initial state being both disabled.
>>>>>>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
>>>>>>>> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
>>>>>>>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
>>>>>>>
>>>>>>> But pci_reset_msix_state() comes into play only when assigning a device
>>>>>>> to a DomU. If the tool stack doing a reset doesn't properly clear the
>>>>>>> bit, how would it be cleared the next time round (i.e. after the guest
>>>>>>> stopped and then possibly was started again)? It feels like the issue
>>>>>>> wants dealing with elsewhere, possibly in the tool stack.
>>>>>>
>>>>>> I may be misremembering some details, but AFAIR Xen intercepts
>>>>>> toolstack's (or more generally: accesses from dom0) attempt to clean
>>>>>> this up and once it enters an inconsistent state (or rather: starts with
>>>>>> such at the start of the day), there was no way to clean it up.
>>>>>
>>>>> Iirc Roger and you already discussed that there needs to be an
>>>>> indication of device reset having happened, so that Xen can resync
>>>>> from this "behind its back" operation. That would look to be the
>>>>> point/place where such inconsistencies should be eliminated.
>>>>
>>>> I think that was a different conversation with Huang Rui related to
>>>> the AMD GPU work, see:
>>>>
>>>> https://lore.kernel.org/xen-devel/ZBwtaceTNvCYksmR@Air-de-Roger/
>>>>
>>>> I understood the problem Marek was trying to solve was that some
>>>> devices where initialized with the MASKALL bit set (likely by the
>>>> firmware?) and that prevented Xen from using them.  But now seeing the
>>>> further replies on this patch I'm unsure whether that's the case.
>>>
>>> In my case, Xen's setting of MASKALL persists through a warm reboot,
>>
>> And does this get in the way of Dom0 using the device? (Before a DomU
>> gets to use it, things should be properly reset anyway.)
> 
> Dom0 doesn't have drivers for the device, so I am not sure.  I don't
> seem to have the logs around, but I believe when MASKALL is set, the
> initial quarantine of the device fails.  Yes, some notes I have
> mention:
> 
> It's getting -EBUSY from pdev_msix_assign() which means
> pci_reset_msix_state() is failing:
>     if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
>          PCI_MSIX_FLAGS_MASKALL )
>         return -EBUSY;

Arguably this check may want skipping when moving to quarantine. I'd
still be curious to know whether the device works in Dom0, and
confirmation of device reset's effect on the bit would also be helpful.

Jan

