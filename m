Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB645F57B6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 17:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416298.660959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6XI-0004xi-Rr; Wed, 05 Oct 2022 15:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416298.660959; Wed, 05 Oct 2022 15:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og6XI-0004vH-Ou; Wed, 05 Oct 2022 15:42:16 +0000
Received: by outflank-mailman (input) for mailman id 416298;
 Wed, 05 Oct 2022 15:42:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L813=2G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1og6XH-0004vB-1s
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 15:42:15 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c4fc4e-44c4-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 17:42:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9398.eurprd04.prod.outlook.com (2603:10a6:102:2b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 15:42:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 15:42:10 +0000
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
X-Inumbo-ID: 47c4fc4e-44c4-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6iX8YyYgLBVdFA0qrOF+hj3jc4F9NpSxzPYkD/hnHjF96FSNskCgU3CZTO3AFF2hBQW/Vf63RA+jAkP1Kn26WO8ecEHj1+NTvF0f28G+/vKkn2dywQQlfJDJf1ezvDBbXMUHMs03c1DeVZ+VWIN25uwSCmeDWTYmzcl2n3UfBkEUNOtnsHassgEIK1pERgcQyZ/91LfdJlan6t6VlHK/cgFWWzNc2Hu4cztbQLJ3PIcs9X2uKGl2/0V4oMEKNimJtGBk/zv4oX/cFOCq8c8p+/fBboB4YhSojhNmy12Bev98cfTyur5bbH6BROydQvsFtw7F1iohKoGpknaHHHUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R45kvSpgNo41zQgGYhyvN7VqsNv2ZbBp46TZEtB2fDM=;
 b=QcwE6ZEy8nlixcWmmT2DE1LVYMDo16nmA6zoOCIz4ZWnXUuU+JPAFxjHWih7AZ1f0wOngYAIgyj+sranFoK5MjsZz8BlbLzp6yXSBpqhxc75+5AmOkWJQMq0VyLWzUFqVTRyshEmldiSx6dmUwdBroVXYhKyPzT13QYVHL7Mhv8/yY/kC44aVyESIcMmHvtxGIUW3gO2PUYziNQg57DZ1VB3NNzr1ya+nsiXdy4cU/GhuxEI+j2Bg5a9SZHR5a1XJatd6ykTvpm2iBEKv120UPsJQCSCPKslu4F9DQpuoILI8oRTdr7o2rjMocwxlyENZs87oRd2eI0/kZTlfIKc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R45kvSpgNo41zQgGYhyvN7VqsNv2ZbBp46TZEtB2fDM=;
 b=yccSPJdcLWdrB3V5LMbSFJxKQBmYJEeMwIDp1EzbXPgXyivk3513NLBh8Uxbc5I5pic9CdKXSMvLVyGw2JbbM6VU7UxvRRv9PAHbei9O4hDoo3yfMr1rh+WofUH4a+pSdBvUvv5QeQ5AxYdarMno6fZpW6wsXVIm2mM2ROLjRkTa8JQ6ULijbwykhXbyot+FRHWHrV/p1deU2/D6g4hoFHmOuqs6tJdJJW2+FJqG47yroYHM4nRJL/UT+T9nzH9lzIoTXLz8Xu1JiZqKATK75mSdO6izIQ003Tixnhr3DQJalfZSx3j64CCU8wVdHZupbi8Nym5H0Am/4EGF5i0SjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <544a7408-ea02-db17-39d7-82b7a1f56622@suse.com>
Date: Wed, 5 Oct 2022 17:42:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH for-4.17] x86/pci: allow BARs to be positioned on e820
 reserved regions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221004153645.3686-1-roger.pau@citrix.com>
 <4c1ce9fc-7501-89c9-f66a-9b6671d98302@suse.com>
 <Yz1CPNwo1hiWZTw2@Air-de-Roger>
 <e38bae0c-c0ce-4953-2813-0d03bd3effbc@suse.com>
 <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yz2Q1C7Z2zolHAvK@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8bcc14-011b-4d4f-9e2c-08daa6e82a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4PQnSJA31XuB3lsP4cs39KPPFBOGUwGKjkStL7JLhYseIFWRx84YB8d1yEx/CC/cI2PL8ILk/eN5rpvEGrAOxFKd0PhmRPuvC4I694IVFBzsu2KN+DVwR/8j4z1lZQ+3yMvIWq0plgDWuFgA5d6UQeXag3uZqBwpeogByCpsTIOPxlIhVDSp8JQhV0FFV3tCGhZofGLIk7uljGkD/voFqeS9TDTu4x4ZcTM1cKA7xF1YoOnghNXLVJ16QZHfIhSiDd8d7hTYCSVxfBaRfpE7D+SGwLyQF8VU3FHKBT192nmff/sNirP0xJboqFuwzLEK1HTiYxc3QBHc7JXnYEt+KukvjNkGeejZn1dfpIje37/1H6BAvuzygmCncvFOEkV6cIFaTlPKYETJDpDy+1vlJhM8FrHuCzX8V9qXWUV7UasAFseQKWdAyJFbAmh+XJPTYk1iEINAPfACxFqM6E53UW6o6coKIDuLK4ymdzRfDAvi/SYbKVBSfiqmQgELGVKESVGvHpOy9gZt3n/aRTBmmjn/J7hzF2ObnAd8OLcTcpa6weO1KjE0hXy979QBSTbk8JB7QyZH25GeR/xUM8NZo/7zmLTuWq17MhAc04pTVC43v8ItG2p/QL3DiURn6ALZBIaeyi0omr1rSDyUM2g5lm50CA60tsoD5FrHkZZg4sswF44GYd/mEKNkFJSWjn8rQ4fQRrphshAaSdXLaiMRMEMACmkDNhsw6uH+EomMJvzs1ay3ikqFHJRiiQXBlJfOABOUunHYW5/LmaHmx+7cKGW+f3txOE0ck2hNWBy2IIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199015)(31686004)(36756003)(66899015)(86362001)(31696002)(53546011)(6512007)(38100700002)(26005)(2906002)(66556008)(6916009)(83380400001)(5660300002)(8676002)(8936002)(4326008)(186003)(2616005)(41300700001)(66476007)(316002)(6486002)(66946007)(478600001)(6506007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2xBQW9GL09pWks4bjRpWUtUUTUwKzBxUmRsQVova3c0OStCNzBvekdvT202?=
 =?utf-8?B?d25qMEdNSHp6NnpQVG5pa0xWVEQ2ZHhNbUJSNWh4Q05oelpCVHNscEZicGhD?=
 =?utf-8?B?eERkNXRHbDRVVzA1SGhMZGF5VzBuL0RyWnk5V0tvM2Rlbjc1M3p0aG4vRksx?=
 =?utf-8?B?NUp1Z2d0RlNXNk5jb0pycDhaSDdjTW1wUDh4S1B1NU1kN0VaNkJpWWRONVpY?=
 =?utf-8?B?K1pqRmlYN2RDZC9ETlJySVNRa3B5L0dwZUVOUmw4VHIrVzRreVI0TUtmbEVO?=
 =?utf-8?B?cllrdmZORGxwWFJSdC9ReGJRWDZhZDhsV29iRGpUTHM1QXVXZEo1N3R4bEJX?=
 =?utf-8?B?YzZzdTY2OFN4M1FscElmS1ZnaGNvclowVmJLOUdjVGRVTzFPK2JoU1RJUDhu?=
 =?utf-8?B?Q2RIelk4NFVXSThvb0NzbFJTUnRTenNBZTdJSFFQTDdJWTdCTkg3ODBIU1Ix?=
 =?utf-8?B?Qk1aOFd0Mk1zUS9yc240MG5vU3FzbG45R09sSlpmQW45WU1LamZCZUNrV1d4?=
 =?utf-8?B?UGRBUkZ4dFpHMUExNlBWWTZsYWhEbHdaLy9OWWRVV2RyeVY5ZDA5dXB3aWNM?=
 =?utf-8?B?TGplckRZanRXV1ZqQWlQKytkWEhsTlVGOUUvTWlCL3ZRVzZ5RWcxMDMrZkpN?=
 =?utf-8?B?dm9zWGgvVm5uZkc3a21kcFE4TERzZkU3aEhKT1BwZExPU0VuK292MlQydmoz?=
 =?utf-8?B?dWcrSW8xcTJEdVRyM29BTDZWd3ZnMzRuVnVDWnQwR3ErWWFYNXhFMFAySS8w?=
 =?utf-8?B?a3laUklSOXBoNEZ2dFBad3BZczBJVkFlT2lpR3JEUDg2VDdGcVBLd2IxaU1u?=
 =?utf-8?B?WlE1L1Uxb0E4R1R2YlVMckFVR2FEdmx6ZXdvb1dRZ2d0VDYxQ1phWVF3RFFu?=
 =?utf-8?B?aGcyVVo4ZXUrc3l5Sm0xblI3Qi9EVE92bFpWUlRKV21sMkptbDVEcHIwWmJx?=
 =?utf-8?B?SzRHdFlOSUNkcEY0eUsrcFNqMWRDWllybWZ0SWJoNEZ0c1FYalY4cElNZVBI?=
 =?utf-8?B?dnBzT28wT1AySys3TTJnalkxdzNkNW1rbGllS1J5THZIVldRcW96N08xMnZL?=
 =?utf-8?B?OTlaa1hiTXpVYXo5K0t0M2wyMDJ1cyszTW9mRXRjSHRrVGMzT2NZR1dtWGNo?=
 =?utf-8?B?TWN4Y0lNYjk2SXRXLzhCNDhrMVlUekpLMGVkNU5Vb3F1di9uZmtUZUlna3l1?=
 =?utf-8?B?TnlHRTZ1RVVmSlUxUUk4alQxVExkZmEwRWQxSTZUZzFnSHgydmNHeFFITmdr?=
 =?utf-8?B?bGYwUkJ0b3o4RmtRL0F2dEZIVGtJdFViOTBSVmJIY1REQkFzY2ZzTUJnZnhM?=
 =?utf-8?B?L3F3bVM4WkgyTElpZHpITGhha3VMejBPck4vZndDcHhVYzdjQzgzYzF3d09B?=
 =?utf-8?B?Z0kzU3NaU0NnQ1BTTFp5L3pZMnVPYXRnOHBDaVRNcUh2YkRiTWFzWVROMVEw?=
 =?utf-8?B?YWlycldHbHdoeWxYemlMRlpldU5pR2NhTE1kKzBjOTZTYi9IQ0pVNnUvQ2tC?=
 =?utf-8?B?SUZhcXVhZStqQUNqNVYwM2g2NWd0alVZVEE0U2ZKVGFMZW52Vmc0elhCUkFz?=
 =?utf-8?B?VXVmWlgzSG9iLzNHSlpJemwrWUI2MTFKZmo4QjM4YnVYNmR5Y3dTVjgzcEl5?=
 =?utf-8?B?c3pjWlJMa2pxSTZ2eDV3ZTR2L0xoRFExSGliOGQzZ1doQjE1RUlTd0FwYURY?=
 =?utf-8?B?M3B3Y1I2VmI0WHYxbStObnRZSVhSUk91ajRTN2NSeElkYmhuMDVEdHJBL0Rr?=
 =?utf-8?B?U2NJQUk1ZzVJTi9iMHROc014TUxMOURxSGdWalh4T2tLWDlXTElQTldkc3Vu?=
 =?utf-8?B?WG1CT3dhRTdyOWdQN3dpSndjRHdRVDBQTURiem5oQ3lLeDNra2NiNGpOa2lx?=
 =?utf-8?B?QzZnVzBjYUJHTmVBYzNpUmYxTzZRbUFXSWdHS3kxc0VvUzRTcnZncXVudEFG?=
 =?utf-8?B?UUNWNW9CQldyQ1Jydyt2R0lNc1Z0cDdmdEEwWTRkK2h6WDFXSzhYZ2QzalB1?=
 =?utf-8?B?RlJscjNYUlpTWEVoOWtUbDA1M096U1lGSldUUUpTR2s2R1lOSnlENHRQYlVM?=
 =?utf-8?B?UjhoUmwzcGlweS9VaVdxeVVvVDhmWDhFRzRWTjZickdTK0VnamUvSUMrSnN1?=
 =?utf-8?Q?7/Ij4xaaNgwrf4tzQEBLlqDM9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8bcc14-011b-4d4f-9e2c-08daa6e82a88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 15:42:10.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5aMUsrexRmZ/IdtkGF+O+WFF0WomtEDtXaSfclGtSucITK+emOBol+3qMdVNstu9D3G6yZdJmK3gwo3OLzLrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9398

On 05.10.2022 16:12, Roger Pau Monné wrote:
> Hm, I have the following diff attached below which is more limited,
> and not so bad I think.  Initially I wanted to introduce an
> efi_all_mapped() helper, but that would require exposing EFI_MEMORY_TYPE
> which is quite intrusive.
> 
> Let me know if you think the proposal below is better and I will
> formally send a patch with it.

Hmm, personally I like this slightly better for, as you say, its more
limited effect. Objectively, however, I'm still unconvinced of making
this an EFI special case. How would non-EFI firmware go about
communicating that it is going to access a device at runtime (which,
as said before, I consider a no-go in the first place)? Likely by
putting its BAR range(s) in an E820_RESERVED region.

Plus the MMIO range covered on the system in question is pretty large.
That way we're still allowing pretty wide an abuse by the firmware.
Furthermore the MCFG range would also be covered by an
EfiMemoryMappedIO descriptor (in fact that's the only use of the type
I had been aware of so far). IOW the change specifically permits an
overlap of a BAR with an MCFG range.

Who's the manufacturer of the system? Or put in different words - how
likely is it that we could first gain understanding on their
intentions with this region? You did say the system hangs hard without
some kind of workaround, but that doesn't clarify to me in how far a
use of the device by the firmware was actually involved there.

Have you considered other routes towards dealing with the issue? One
approach coming to mind would build on top of what you've been doing
so far (either variant): Besides avoiding the turning off of memory
decode, also invoke pci_ro_device(), thus protecting it from having
its BARs relocated, and also preventing any driver in Dom0 to gain
control of it, thus avoiding two parties competing for the device.

Relocating the BAR outside of the reserved region would be nice, but
will likely not resolve the hang.

In any event I'm still hoping to have a 3rd view on the situation as a
whole, irrespective of specific ideas towards possible workarounds ...

Independent of the above a couple of purely cosmetic comments:

> @@ -98,3 +99,28 @@ int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
>  
>      return rc;
>  }
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    if ( is_memory_hole(start, end) )
> +        return true;
> +
> +    /*
> +     * Also allow BARs placed on EfiMemoryMappedIO regions in order to deal
> +     * with EFI firmware using those regions to place the BARs of devices that
> +     * can be used during runtime.  But print a warning when doing so.
> +     */
> +    if ( !efi_all_runtime_mmio(mfn_to_maddr(start),
> +                               mfn_to_maddr(mfn_add(end, 1))) )
> +        return false;
> +
> +    printk(XENLOG_WARNING
> +           "%pp: BAR [%#" PRI_mfn ", %#" PRI_mfn "] overlaps reserved region\n",
> +           &pdev->sbdf, mfn_x(start), mfn_x(end));

Perhaps re-word the message now that the check is a different one?

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -78,6 +78,30 @@ bool efi_enabled(unsigned int feature)
>      return test_bit(feature, &efi_flags);
>  }
>  
> +/*
> + * This function checks if the entire range [start,end) is contained inside of
> + * a single EfiMemoryMappedIO descriptor with the runtime attribute set.
> + */
> +bool efi_all_runtime_mmio(uint64_t start, uint64_t end)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +    {
> +        EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;

const?

> +        uint64_t len = desc->NumberOfPages << EFI_PAGE_SHIFT;
> +
> +        if ( desc->Type != EfiMemoryMappedIO ||
> +             !(desc->Attribute & EFI_MEMORY_RUNTIME) )
> +            continue;
> +
> +        if ( start >= desc->PhysicalStart && end <= desc->PhysicalStart + len )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>  #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */

Perhaps put the function inside this #ifdef?

Jan

