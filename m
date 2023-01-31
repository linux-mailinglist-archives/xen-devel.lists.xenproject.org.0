Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F5682850
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487452.755063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmg2-0003Gx-VH; Tue, 31 Jan 2023 09:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487452.755063; Tue, 31 Jan 2023 09:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmg2-0003E3-SV; Tue, 31 Jan 2023 09:11:42 +0000
Received: by outflank-mailman (input) for mailman id 487452;
 Tue, 31 Jan 2023 09:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMmg1-0003Dx-Qq
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:11:41 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe16::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45a4f5ec-a147-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 10:11:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7458.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:11:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:11:38 +0000
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
X-Inumbo-ID: 45a4f5ec-a147-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0E6leiZcuKNdXbzF6gJgocxZH35J42hvKn2Ke5oJarPqlRW+Co479bLZuSmI4U0kCaQHi9IdiuSNQ4AG7k7tulG4RSF3fTLiCbtR6GwGDFKf3sbH2UiBaSyZhV8mZfexPoygW+JuoIxezA9u9luNCWFSlPaqPhMDJbNIAmXRc+AJohEARrCXypGmEedJ1npfgj/89OYrNaAteGbdpYIutHxIqHPECqnDs+eJTNe1UWZBTjFX2DA63YXHxl7f6Sdknyv8cabunvFZ43xZYHBk3xlbM+ojYOFqis1u+WsNJnwk1/ZBzB3aWSmv+DrmWQl5PWOJEC6HuH3XKzUIKd6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+Us/zrBz+sIWQ2aX9yjTegxSf9aX72zo+V5LClUWLw=;
 b=HxBeMtWsB4voVpEdM/7rDxx8ktxcN+fYPNdghx9KbULTdjlo+IBxlojnt7CfdEbHFF/ksfWHY8rEGFE3bh0N5t5wyhf8x+6i1/KlUHNAl2T5UN+9Z7biy7rMKO/emeSHuO1etuu4Y4fcrskLwX2gnusrDNKRNZ6f3w1E8LDq5/muoew46Tw6ibNqwz94Q8D7prmwBIS9SrJHCgnZzBbaPJOxZrR4YsVa7WhFhuJ3dNrRJDLh7zGNQrVnBWtu6UQn1BNtriQPNapDBYByEdxO+oMY2h/e3xcgSEZSrdL06RWE5V3b5v8ORrer6HPDMym80BCNKYoT6Q3Dn5qGwWlABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+Us/zrBz+sIWQ2aX9yjTegxSf9aX72zo+V5LClUWLw=;
 b=3wBkJcGIitQFGeviU++J41eM3z2vCB7QLFkWr/yc1hW7G+1HwKJi/OTMC8FT7T9UWxg398fR2r28ZjTO/ytIzdSN+C8evYch2eUefg4Abdpv0f21lbrf0qOLaSYUVxfEJORjdaxcLk0CBvQZRMqOUfXcV/RdLwfQmZ8STHuvA3KisY3NBzQQv2Te+48Q7cBnkNxWQA2g/GzZoph0ZiVS3z16e52jnr/ep2Gks+Izl2VFSJPvx3abbGa9dN37OOH/B9teFgva/MwyDeH8aOW01JKFiDnz6dk5rYow0gSAttDQO9aVhYtEEfOU3YhUdBCNqJ8WdR4ohdRgiMh2RHFTlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d645ef07-f30b-ff6b-ffc0-7ef76da63285@suse.com>
Date: Tue, 31 Jan 2023 10:11:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 05/22] x86/srat: vmap the pages for acpi_slit
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-6-julien@xen.org>
 <ca02a313-0fa2-8041-3e8f-d467c3e99fb6@suse.com>
 <965e3faa-472d-9a79-83ca-fef57cda81c5@xen.org>
 <41de340c-b5ad-6c30-816f-1ce1ddc98069@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41de340c-b5ad-6c30-816f-1ce1ddc98069@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: d02748da-a364-416e-57d6-08db036b28cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tclx+1hAdDQEpUuV/4tSk7w7IZOf03Ad06pUMOfEtYc9dXC5pGYgqZYZkQOrO1fwYQnwJO7AlwkMFabYAOw26wDrPwz5dwWGrvJzuNKRjcqRWolyzIjtvblpL8Fe8aQTCTlZMYN/YbmPXDyaHfwDBtf7SZMQPfj/fLMU1BPJdPOcQTsR2ZsJlr6TXYb5g31nVE08qTEOZcKvmJHgQKv0NaeXcsOkehbYRAck08bCglUmsALbkfL0lJl3JsBYG8HA2+jc6o0Gid+ZSR/UK54dpss+u+RewsJb2vTdvtzHoDgDsyl6AN5R6iuvFToUc36OUh7GtKbDm9RqPSFk6t8TmtLyIaIe65bxHkWlgTUCkSda1taKOX3J8nLNvw5os2chTeauLf0Ire2Kgh7D+QPphPWXsJcilRY2y8bs2V5XkVIRsp6u5u93t8nHoZy4Ps1mnZQtdlhdpOqOLYshpEh4NDIiO0gA6tuz4HshZtKDYA6heOqAg+xA3fg5leORfMGXqtPDZrcvGStjJD6+O77EVfGcNfSEwZdHN+cn2o2qnKkNVqiIIQ//xUiwsL3yR9fK8LElu1NKwB0nvVi0gEiWpTNjF0PiNHxGkg41Hd9XZeaU9h7y65Fdwj6QDQL6yF+CQzucEtFy98nbkon2WBcPRR04vixwOgHw9ttsPC/vS/7+cegT4Dfv5pxMOZeMWrnrxL+ObuxNXIBGtwVlCGaX6c9dGiMSegal6tMBdFJ/hJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199018)(8676002)(66556008)(66476007)(8936002)(4326008)(66946007)(6916009)(5660300002)(2616005)(41300700001)(53546011)(6506007)(54906003)(316002)(6486002)(478600001)(26005)(6512007)(38100700002)(186003)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2F0eW9DWHJEYmV3UkJ0M0JMMWY1YnVVZENNdXBTU1NiSkxSQzBKUExHMmtJ?=
 =?utf-8?B?OEpDTHFJU0RhTTMyc3B3RVIvejg5ckdQeFNWQkR0bGJ6dTZkTUcwbGpCWHly?=
 =?utf-8?B?NUxscitqL1BZeGhNeThOL0o3UTR1azFKUXpPMXZoaUNzV3VoVVoxYUd3cUsr?=
 =?utf-8?B?NmQxeTFLVGVNUDhiUmlTTVVERTFtU25pRVFVTDBQd1FpTW5qcGNNNE1pVUVl?=
 =?utf-8?B?UXRkNy9rdnhDMVUrd0xDb1ZReUg0YkltZW1CMDlhelBmSlhuaU5NUGczK0VG?=
 =?utf-8?B?R21oNWt1ZmlVbGdVT3lFY1V0RE84K0czeW1IaGNvSzZyUUUzeG5RR2N3UXNV?=
 =?utf-8?B?RVNKMmM3Szh0b3A1ampaWXJSb0tKeUtORDY2UE10UjJvbU1mQ1VIVTRNYzg1?=
 =?utf-8?B?cERzaEVtd3RrelhjMmFtZWZMR0pNTW4zdCtTRkp3Zy9TQUQrak9KK0tJZ2NK?=
 =?utf-8?B?d2FFcGM4ck81TnI4bG8rdlNEOTFnbEhudTNCZzgzcWpDUFcvek1rZFI4UXJn?=
 =?utf-8?B?bithVmN5TFhvOFd6bE5XZFBxbWJJQlV5SDJqZWpJcEpIME1MaVJsWmdST1JW?=
 =?utf-8?B?K3M4dUtDR282TVUxdWkxYW1KOW1FSmljMjU3Q1F4ZXVXUHB5YzJDM1R4YXdL?=
 =?utf-8?B?ak52MDVCWUpLMGlPNmxsRUN0UzJnYnkvWllxWjg0ZjNiRkV5K2lLRnpMNlVl?=
 =?utf-8?B?eEI2eFpOa29nb2hsNWtCK1F6V01vMkY5dEpjZ2tiT0FoZmsxbWRKM0ZtaXkv?=
 =?utf-8?B?VGhPcHl1NitzM1prWWJFTnRiSFREeStFZnQ5cTlyc3puNU1hTEdXTUMvRGNQ?=
 =?utf-8?B?Z3pZMWpWM2ZwSE0yTHcrNFQzUnhKd1RDVDVKczRXUUlNYmMwNDl4dkV0QWh4?=
 =?utf-8?B?a3J4ZmpKSml3OGY4dFZZME5zcTI5VFhIZW9DL2FpeTAzM21VOHA5bDE3MFNB?=
 =?utf-8?B?cjVNb0hNQkZrUUxvMklQVkRhYmNSL1F3ZjlVOVQ0dDFQSmMrSnlVWFJxVURT?=
 =?utf-8?B?TUh0akRadGRBbFYwQXNacE83TElEL0xYMjUrb2JFOURTcnE1bkttYk9zM1RJ?=
 =?utf-8?B?TkNjaXNpOUE5QVNFQnAwdHhOU3R6eGJ0WEs2ZUNPL2lvMGl4cjlLTGVPS00z?=
 =?utf-8?B?V1k1ekYwWjdYOEVMVm9LVG5ncURxMTNTNEFiS1lrcTdBNzNlam40Q2NsUTI0?=
 =?utf-8?B?ZGpibjE3S2pPTlRremNibERvNjB5N1NVMkc0WnhHN0U3MHdpOVZ2VGJSRFBs?=
 =?utf-8?B?UGhObmlueGRkUlhtUUg3ek9mejNzZk9Bb0pQU0svRFRPbEN6dWF6aldHRGY4?=
 =?utf-8?B?UHR6b2JxNjhLODdNSWpEdDBSNlhxQkNhcklGeUpYRmpKMGpWYzFFUVhUMTF4?=
 =?utf-8?B?Umg4dlo2NjVUakJ0aFJEdVUzUkxhNHRJbUZpUVNuSHp0WVA3NnBlZFNQQXJt?=
 =?utf-8?B?OUZ4MWxhSXJnakFleHo5bDdSUVRwM1VvVUNYdGZEQUUvajdZcGg4aUczVkI0?=
 =?utf-8?B?eHpFZ1FLWnFNaXpFVUF1TVNhblF6VXIySHRqclhNOTRCdmVuaTFGVmZOWGdO?=
 =?utf-8?B?Zmg5R1E1c2NzUjZKOVlOaEF5eTdGTFlPazZLWi92MzhWWTNmUHVYbXZwKzl6?=
 =?utf-8?B?cXRoUnNsYmhiNHRxZmo0dzRZQ3dSUTl6RC9WSWN2TVd2WklyZkwzbmNYWGVl?=
 =?utf-8?B?VmxOdUJvVkJ2cGtvZVZ3M3h1dkM2cUx0NGxIcWZKTGZvcUlQOXd3dEtzTFVR?=
 =?utf-8?B?dkxEYVpScGNEL3J6Q3JrWGJCU3BRSVlkQ1ZoVEpLeGJMT0lHZTF5d0VNcEtT?=
 =?utf-8?B?bXFDMmR5NlkwVURJSVVLU3FPNGFpdnJEZm5pRjRFSmlMOHlCQ3FlQ29DeEdB?=
 =?utf-8?B?eG9Ea1ZsdDlMNnR6YThrdDg0TkNIOWgwUkc1bFdOaFRyUjdyTVVoUVpLNERv?=
 =?utf-8?B?bHhuWDhLZDJJOXRNaDFydWV0WW5xSko2ak5mTjZRWU9TMVlUWGlSVGFIQ1BO?=
 =?utf-8?B?RnNGcUM3UUFqTmw4V1JaaTBrbWNDYnJBblAyTUNOSTRXbk9MelVFckVmWmR4?=
 =?utf-8?B?SFFXQjIwSGVrWXo3UXdZR1FITkE2Zm1ZbExMWTdMay83WjBlMU9Ea0lJRXJY?=
 =?utf-8?Q?ZAg/Z5oVd+pzndykvDh8QAJY6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02748da-a364-416e-57d6-08db036b28cf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:11:38.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3ppFa4qlNi7ezDF0hsSJTwnCu4xUF6pf29mYBFK5TCBcbZNczUgs5upX3ngG+98VMFLvJKxtplY5eisM9JgCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7458

On 30.01.2023 20:27, Julien Grall wrote:
> Hi Jan,
> 
> On 23/12/2022 11:31, Julien Grall wrote:
>> On 20/12/2022 15:30, Jan Beulich wrote:
>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>> From: Hongyan Xia <hongyxia@amazon.com>
>>>>
>>>> This avoids the assumption that boot pages are in the direct map.
>>>>
>>>> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> However, ...
>>>
>>>> --- a/xen/arch/x86/srat.c
>>>> +++ b/xen/arch/x86/srat.c
>>>> @@ -139,7 +139,8 @@ void __init acpi_numa_slit_init(struct 
>>>> acpi_table_slit *slit)
>>>>           return;
>>>>       }
>>>>       mfn = alloc_boot_pages(PFN_UP(slit->header.length), 1);
>>>> -    acpi_slit = mfn_to_virt(mfn_x(mfn));
>>>> +    acpi_slit = vmap_contig_pages(mfn, PFN_UP(slit->header.length));
>>>
>>> ... with the increased use of vmap space the VA range used will need
>>> growing. And that's perhaps better done ahead of time than late.
>>
>> I will have a look to increase the vmap().
> 
> I have started to look at this. The current size of VMAP is 64GB.
> 
> At least in the setup I have I didn't see any particular issue with the 
> existing size of the vmap. Looking through the history, the last time it 
> was bumped by one of your commit (see b0581b9214d2) but it is not clear 
> what was the setup.
> 
> Given I don't have a setup where the VMAP is exhausted it is not clear 
> to me what would be an acceptable bump.
> 
> AFAICT, in PML4 slot 261, we still have 62GB reserved for future. So I 
> was thinking to add an extra 32GB which would bring the VMAP to 96GB. 
> This is just a number that doesn't use all the reserved space but still 
> a power of two.
> 
> Are you fine with that?

Hmm. Leaving aside that 96Gb isn't a power of two, my comment saying
"ahead of time" was under the (wrong, as it now looks) impression that
the goal of your series was to truly do away with the directmap. I was
therefore expecting a much larger bump in size, perhaps moving the
vmap area into space presently occupied by the directmap. IOW for the
time being, with no _significant_ increase of space consumption, we
may well be fine with the 64Gb range.

Jan

