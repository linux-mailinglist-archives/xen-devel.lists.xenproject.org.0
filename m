Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D45F4189
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 13:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415439.660017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offnX-0003Tt-Ut; Tue, 04 Oct 2022 11:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415439.660017; Tue, 04 Oct 2022 11:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1offnX-0003RO-RE; Tue, 04 Oct 2022 11:09:15 +0000
Received: by outflank-mailman (input) for mailman id 415439;
 Tue, 04 Oct 2022 11:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1offnW-0003RI-Tv
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 11:09:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faa92008-43d4-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 13:09:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8716.eurprd04.prod.outlook.com (2603:10a6:20b:43f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 11:09:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 11:09:11 +0000
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
X-Inumbo-ID: faa92008-43d4-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IToqcuQ9TCdtqWDWj983g1LQcIf3gOVdy241HtcbMwe4uQ8G1KcK92SqN4ncqvwUwSZvgItNJOGCoALLHafhM28ZkKqINHxWaMaGCw/ILWSYwhLGmgI9LI/TLIUU9mEAQlIG1Yhtw0tYiZPXMkne7L51sRVTUULrK7x7xL47hEzLQl4bvy8WiwHZKFaG7m87+vUc2NljiGNlR/NgKzh09K8Gr58xPGGalvTzXtN0hSTTi761X5dRKf7SGTpIps+t6Y/woHPJEPrkJl+04gGfcp0b2GAYJ0sfTb6EYBq/fCUsUXgXqv3VxcdCS4BVi20BkJJliUJwEDDl0C2mycUkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G2iTgslzTmppFWNurxZ4gsNJab+1yPUREtAJRT7cR0=;
 b=gipaB13t1E1xAj9CUegb7Ef3cVTFO4oyd8DOtcsElmY0XcRHHUh+fLwQrUY7F38BpSwUq6jlTHa4/2s8Ps4ATywSMxllCvNpxZ+3es0y0xb+sgggzS8ZO0qvykZ8xACHpHsF4Ijgi5LdekRu4K7LiyYckucj48D764VvOxA1HCRWpUj4ToBAejruL4y3ZacIJyFbDxZfLmiSZFV0P38YWKr0GpdBWIS+lSBws43J5TuXTU7aHpM33nvnDxwbHxTxYegVm1bKhMl3wx9yKiT5gL5MD9P6K/Dwj1X9LdUZW6FTaMkYQxN9VupgQ25B2UTCdSeFRY05ZqnsMLWXul+5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G2iTgslzTmppFWNurxZ4gsNJab+1yPUREtAJRT7cR0=;
 b=gwjkPMTP92xLt1kA2h7mPJduP+U3MSMeQLqdJeM9pxv3HpzoFyZf46MJJwzLixiZwNIL6DKX1TcgBo7BCrfVr6VxYINb1pTBxF+Y7AKzIy/iqqTAL3orxfVYgM5ggI+dAtTFI34S+370VPT+F2lLrj7SCHwa15mCi1gH+FmTq2cr4Oc6Klg3rS13TFOQr5YKBEqeZ/vGRHQjNf0Whv93u0jZlCDj5LOOELy4q76I+Wes13UZmjIeH2da6Vwh0h884w8IOiUQig8o1a4WMZ0I3BDffYxv+GJn+utwPIzca5Qeo6WC9k7iPbrFqQejMx+sxmlMkbTjUp6mAu0BeZodKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de45bc4e-888d-6bf8-4371-1adf46b91210@suse.com>
Date: Tue, 4 Oct 2022 13:09:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang
 <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <Yzb9BDGc45OshRZN@MacBook-Air-de-Roger.local>
 <df0dc3e1-da12-9d42-b652-e33419134d38@suse.com>
 <Yzv92zTdfG748MXO@MacBook-Air-de-Roger.local>
 <19befbce-ac16-19fe-25a0-73678ce440c0@suse.com>
 <4f55fc1b-30b0-c5bf-bfec-bb237b8c9379@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f55fc1b-30b0-c5bf-bfec-bb237b8c9379@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f135ccb-dfa0-4889-91e2-08daa5f8ddc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cnuoNexMU80zoJ/flhMPEfJaYzhJwFBupPU1qFFGltsrJJC/+a+jamH9EEgcM+NX94zw79ZpEcqT0DNCY+XmBVzkA+EBZyJOlgxLcjtBC/xDklRGxfImE8HjqliOwzW/f29ExF2FLMoeCGAk14knxh1btRpyFB0HO9Wn37GDYcNRjNmDR90ZXbdKaZTcrW01XuFAKTDwKdVfV2tLkvLMcm4a1UzUJKd11xg3HhfTOHAWPNHCImIdLzM9q3t8rg2omKnG3sSwofStcW07lZQOxVIOf80KGBUUHCQlej50WFYdQL4zKYFFTDZ0WRhzGiKWbUgI32Rz5rX6hKMBThaS35hdrEAuq2o0dVq15MCPxJFMvQN5j6H42cnNKl92l/Yxjbd8GXyRHaYcJ7yf0PrDc4yVdA5+dP+LDru+ycs7fTIXcxrAR+wWCRjwkENcgnRi7oFR4Fwa8bL21ZNT+BzGvZBUQJY6Rqv2UAXdTooqQ9SyeH+dBwLQcHSfW/UpZIbbSADRUPk6pl9URCx0SuH3vAaxysxcdMFI6g4K1tffrHKgPxnnDbaJnH9vgkrUaG3ScGlhNxu5CQKDzo+fTPzHoSwYkWj2Xiuzbe6ZmQ/rYktS6RE8ywIvd4KiuXKyK/Tn8Qf8a5+ntjjkFiNQe6b9lH15FL9zwMXLMYUi1cv/a9O3+my3X4RD6gdRBqSKmRCdt2N30PfDg+yWAgR90dw36TGHb83W0+M15ASgE8zsnVafgVof+pktjOQy477vEcWsoZW7bhS+vKpKwT05Ee73+26CJbWYKgL2pRfYxtLMwL8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(38100700002)(31696002)(86362001)(36756003)(6506007)(41300700001)(53546011)(66476007)(66556008)(66946007)(8936002)(4326008)(7416002)(5660300002)(6512007)(26005)(478600001)(186003)(6486002)(54906003)(8676002)(316002)(6916009)(2616005)(2906002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkN6ZjRiSXNGOUtSVkNqQVNhNEplNHhQZ1h0UkY1UWxRVmhMY01PRkpZU1dx?=
 =?utf-8?B?N1hHK1BOWVlUNUllOElIcDdSVDhBdGFaQ1RHTVNTcUVXMExNMHdQRitFalJ0?=
 =?utf-8?B?YUpFRFdOcCs2NXcxdDQ0OVByR0t6bjd6eUtidkVNanR4Njd2cUR2cVJzRU5h?=
 =?utf-8?B?OXBYOWtDL05TSHlMTXovZHBjUlJKMWFaSlJvd09rcTc1c2Vad0toNDliNEJo?=
 =?utf-8?B?STRLL1h0YzdidlZ6UFNMZ3NERGtGTFlOajdzdkpFS2dCTDVrUjRZZjB1ZFVJ?=
 =?utf-8?B?S0lUZWN4eEltOEJoQXZnUFR5VU9rZzBCcVlYUk0xQU0za1VTemtWVEEwMnNx?=
 =?utf-8?B?SzBhenlJU0RrUEszdkZNcS9TbDNwYm5pK3FIQlZ3aThteHFmU2pjTDg0L0s3?=
 =?utf-8?B?UldCMWpBWEt2OXY2cnN0clJIYXNvSlJXczIyR2taVFpRSUovZlZlRHBYRUkv?=
 =?utf-8?B?NHF2a05oWmgwTnFWWmFjYm0zaHY1akJaU1p5dUIyZzV5VThSMnlZY1BleGRT?=
 =?utf-8?B?Z0lueFVvWW5FM3JSSWZ5VTg5cWZkb1ZGUk4rcXB4ZkVWdjZmMzlFS3gyemNQ?=
 =?utf-8?B?WWN2c01SM3JUeHdzbjZESXdvZGtTSTZGNzZKVkhqNWVZN21uVkpqNTRHQ2xY?=
 =?utf-8?B?d2ZoZ3d5ZkI0TUF6bWMxWHgza2l4TXFoSkx3TW1JNEJnUUZGdTgwVzlHS0wx?=
 =?utf-8?B?Rkg1cnc0dElLWFFlMWV5bXNpMnBwZjdRdFgyMEYrbGZ3SGJPV1dQSXEyb0dR?=
 =?utf-8?B?RVpVckErRDFJNW5aQVlGeWFta2ttRGkyTktmWm1jejRRSFNka1ZaaUpUNlZ6?=
 =?utf-8?B?cEN6OUtpVE1BcHlYMXFDcXpUTkk1dlYzYkhoQURMMkhFcFNGekhJU2hxaVZY?=
 =?utf-8?B?eSs1aVN2QXVlTXRMVHFUWFhYYWZ5YzJ5VDVJZGdxMnZvYVhQRCtzZWY4azFY?=
 =?utf-8?B?QkxHM0E4OXJ2ZjJGLzZSbi8rMnJzT3dSelo3c3NOdkNvc0RUZWIvcVZjY1hi?=
 =?utf-8?B?M1FkN2s4NTVZL0ptdi9FSi9CcFZ4OHNDS3JtVjMraGg5cUlvdUZxd0F4SXRP?=
 =?utf-8?B?czFsSG1sc0tFU1Z2Y3NMeUhGRnlIenhXQlMxMGR0c3lEZ1hrNlRISGpjT01O?=
 =?utf-8?B?MzVwUmxmQmJ1dTkzdGY1RkRaZDRtUmoxTWpzMmNjMnNSNlhkdERFNzVwcHdP?=
 =?utf-8?B?WVlucnoyckNXeXBhY2tLWFBScEx5RFgxdWMzdDc3c3NocEdNN2t6N2w0U3JF?=
 =?utf-8?B?QUF4NWliVFUxUHEwQjlKaVhvME5NcDhVWTFxcGQwd0EwTnp1TlYzT0FPeWVU?=
 =?utf-8?B?eE9LdVF4S3R3c2pLUDJZVFd3UGxkWk5wWkErY1pFMlk2RVFVZE43blZ2OWNJ?=
 =?utf-8?B?N0JXQk5ncHQrS25HbXoyLzZ1QjJ1bGlLem1QcnlISXNtb1pEa0tyRUg0K3ZF?=
 =?utf-8?B?OXF3VnBUZ21nbS9zZjZ0eGJXTzl4QmF5UWl1dXRubGdmemtZTk9NbmVJaThP?=
 =?utf-8?B?WDdrcSt1TEV4SCtzNC9HNERPMVJKalhoWlpiWTdrZHpwWFVIODRlNGZ0ZGM1?=
 =?utf-8?B?Y0FMZHhpdHlYYXFYeldxWjNNbkMrVFVacnNLNEVHRTJLeE11YTRzc2s5ZnN4?=
 =?utf-8?B?aTZDbXdsR0lqSThCN1FlRXF5bC9kR3h4SjgwTWppdDlHOFZFUTdQQUxxMEpy?=
 =?utf-8?B?cHhtck1tNzlBcDBkdUIyVzJEVlpCTXJsWTFSL3FvMjRNUjVlbzlDeTFzVldn?=
 =?utf-8?B?eFRxeE1xUGpvYWVZS2FJNk1XVjU2cFozWStUZTdZTlhuMEIyY0FDMlEvSmI0?=
 =?utf-8?B?NFNsd2d1THozY1JNTU9SMEwvREVKaVJrdWNOUjdtd2l0a0c5Q29YcjlKLzY1?=
 =?utf-8?B?SFo4bnQwdWVuU2lIdTJvcFQ0T1I2TmpTdU16RnNUYXQ2b2svTGU4RjlQbHEy?=
 =?utf-8?B?Q3NjSU5KNE4yWWZRK1JhNEl0YmZ2bFBGdG1lWlI0OUc2K3pWdFloVHRNN1p4?=
 =?utf-8?B?ZEk5YmlMemhHZC9QdlVmZEhpREJob2YvL04xdUszRUJxYlMvMGtEaHpscm80?=
 =?utf-8?B?UDU4RHJGOXQrM3NQK09UUlZORENlUlBiMTA5SzB3a3JiNlJuZ3dqUTNWMWYx?=
 =?utf-8?Q?VxjSFqsVdTE7tnf5y6iP7QQXk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f135ccb-dfa0-4889-91e2-08daa5f8ddc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 11:09:11.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6LCh1k1YX4qWoG+wvk6bpAmiSiP4CPLcLMo+uu5e1F84IGYLG9Njd90aRqcdg2exayYQ+QBTbLhRPKz8GR5kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8716

On 04.10.2022 12:49, Andrew Cooper wrote:
> On 04/10/2022 11:23, Jan Beulich wrote:
>> On 04.10.2022 11:33, Roger Pau Monné wrote:
>>> On Tue, Oct 04, 2022 at 10:06:36AM +0200, Jan Beulich wrote:
>>>> On 30.09.2022 16:28, Roger Pau Monné wrote:
>>>>> On Fri, Sep 30, 2022 at 09:50:40AM +0200, Jan Beulich wrote:
>>>>>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>>>>>> higher priority than the type of the range. To avoid accessing memory at
>>>>>> runtime which was re-used for other purposes, make
>>>>>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>>>>>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>>>>>> E820_ACPI memory there and hence that type's handling can be left alone.
>>>>> What about dom0?  Should it be translated to E820_RESERVED so that
>>>>> dom0 doesn't try to use it either?
>>>> I'm afraid I don't understand the questions. Not the least because I
>>>> think "it" can't really mean "dom0" from the earlier sentence.
>>> Sorry, let me try again:
>>>
>>> The memory map provided to dom0 will contain E820_ACPI entries for
>>> memory ranges with the EFI_MEMORY_RUNTIME attributes in the EFI memory
>>> map.  Is there a risk from dom0 reclaiming such E820_ACPI ranges,
>>> overwriting the data needed for runtime services?
>> How would Dom0 go about doing so?
> 
> Zeroing the memory and putting it into its own heap.

This makes no sense.

> You seem to be presuming that some unwritten and unenforced rules exist.

There's the PV interface. All memory management related functionality
has to be based on the E820 map handed to the domain (irrespective of
it being Dom0 or DomU). That map has no E820_ACPI entries for PV (and
PVH Dom0 is as of yet unsupported). Dom0 is also handed the host E820,
but it is supposed to use it only for resource management (e.g. to
determine where BARs may be placed, or how to arrange its PFN space).

> Once dom0 has booted, Xen cannot safety touch any ACPI reclaimable
> range.

I clearly disagree, and I expect existing behavior also disagrees with
you.

Jan

>  It doesn't go wrong in practice because OSes don't actually
> reclaim the reclaimable ranges (which is also why Xen HVM guests don't
> explode either.)
> 
> ~Andrew


