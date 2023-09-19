Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A07A6817
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604896.942438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicfA-0005rj-Ff; Tue, 19 Sep 2023 15:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604896.942438; Tue, 19 Sep 2023 15:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicfA-0005p5-Cj; Tue, 19 Sep 2023 15:29:20 +0000
Received: by outflank-mailman (input) for mailman id 604896;
 Tue, 19 Sep 2023 15:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qicf8-0005oC-41
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:29:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ad8b772-5701-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 17:29:16 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 15:29:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:29:13 +0000
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
X-Inumbo-ID: 4ad8b772-5701-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnDLBX7YDODactbo18wHMCqveD7r7E9XhJhZ8Ug6t8pUVhYIPn5eS/QKynoYusVjkoCl1Ey3N+9KsuVNnGpeCgxk4+eh54hWu3QeBFBl/hyPZ36Xb5S3Sepmtpl6dEVJSD9xiBPrzuIg93570Jnwl84jRyQdaBhKZWBI7QpLYTyQDNjfacn3PLwxpf6iydJaDGcXEqqa2x69cRekbcEPgpJ97ov3vQsxlxFy8KFV+4tnGRTNj3Ec0yIFEcOIW1HO6cZTCAVoGaSRUG79IvXM3zInoRJgL72m8C/p+esiO27VQGvkWHwf4cVtskarrWfbjwaOocCULY5Kj3JcVftnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMqZy+T5qTOGeRKLRLiMg+Wra17qmp3hrEr0XqpH/Bo=;
 b=l5+NtD7miNV71HXpJdQcf3qXitUHioh+1/HqPBh1vq0PW/wd50esb1bTcDGfSxAAuEgaRXeF79hXE9WMHtvxGk4ghS7eC1TqJyTzcoCfrqEMVWPur9eLulaKXBOpI/n8N0zeG57SuZLtTjAtxwT25U1UBv9P9UPI5D7w6j97/EdrNWr3+7NNRJOkz8+Xmudyvatrk+HGrKfqy27h0TaQ83OYrF44eb+VnyonuvbAMPVkq4o7Vc5uVS2RXBg4XVsjQcRFXGiNlVe5sPTCl7cuv4PKyIvRmC+0chchn/5KVMbFEHaDRh8Gb+8+uzueuj5yKP23ZixlPTzrTzHUpCZ/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMqZy+T5qTOGeRKLRLiMg+Wra17qmp3hrEr0XqpH/Bo=;
 b=XqTWoFwM3CWo0cr57TDZ7TbeTYIVJTvo3SAon9QaKmIk41tf6X0l3UifQH49bVcEc7sdLctJifTbepIkzZ5Inr0a1Ztk1hQnrlMcDWRScW4ws2Pd7VbyvpROJKvNp+z+ZA8H1c00TyQV+t/fkETcd4UwruIRuIpDZFPRtOw7xorVjG+kCy+C/NsQ4EzTuB2mmfNQDsSRUUjeG2shrDnpD9iNfRTCY1gMuYkXLjfnKxsUhjs35mkDASQXRCFdDUPRXnpGVriMZz5ocUwQ6WJtJq9lineLF1dotSthoo87WGh04O1brr+Cwpr6epUGrG+Ro+tSK+Cluvv+pESyUd1hAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86c67d27-865f-3abe-7b04-4c0eeffe2eaf@suse.com>
Date: Tue, 19 Sep 2023 17:29:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/10] v3: Boot modules for Hyperlaunch
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f3f95f-ab96-4c24-b214-08dbb9252d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TarQ+1qhtYUAvQ+7s6vUsx8tk8yVTJa2kq7vwY1i2xmu9phKXXm9XIrRNsOF/xhzRTjseRgac6o17Vb3mUCH0NB9XoI+LHplLeijzaFUcugy+PgBtrGsxjpTEaOuR5PgL/UPgfjj5yxbnpJCsL6V8RLHWFe6sLD3e4GZZqNlW3RRO2RuWzyrzrmIJEKZVmrXV090m0l2lxmGLHdIlWdOGTR6DgZjXTbRawT2cvlTZUuDOcaBYdALBTnpNclOKQiN/gph3jX7Q7CQ5y8MFXa9iYGbPCow3okddaw8CCKrE907t85QjIK5mmiSX48iIae8Dk3saw+bH38wSz970urXIteRcv58igZzhgxlVCtSLWkPqDExXBw+I3YPpi5Ghg44q8YXY+J5S+bdq9Xv3XCQSdDyF8bPj36cCP4eYOMbA2Zcyf8ikBEJdYcFpAMcJ3uPnIwwNbMPQjddvlrUd/3BvGva3TjQVgkoW3gqF17kHgwCpwqM1kd8vdWspVQSOOs4/XKTQCegvzzm++zLwi2wPE1FiOMrchwlsWBVMYGo1vk4I1NR7+zbWx2sAeUWEgYHqNNoaFTlemEIzsSe49u2BpLswPEE+lFgfaH2mYtaFZ5QOERKjpzElUffUrhkL+ziSAclBoQMSWwQ5+8TAz4RZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199024)(186009)(1800799009)(26005)(2616005)(31686004)(83380400001)(6916009)(54906003)(5660300002)(316002)(66556008)(66476007)(31696002)(66946007)(8936002)(7416002)(8676002)(41300700001)(2906002)(4326008)(86362001)(38100700002)(478600001)(966005)(36756003)(6506007)(6486002)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWRSK0o4ZWxwdjlnVnF1Z2Y5NnM2bi84OGFjUjk4OG1KK0MzeHA1RDU3MUNF?=
 =?utf-8?B?bEp1R1UwMjZRM0RyWFJVMkJsMzkwUWNRNk16WW5RLzVvUGJ6ZENTLzBJNWp2?=
 =?utf-8?B?a3dNbTJCaTZTd1F0aUFma05xd0VyR21HNWk0T1N3WGg3QkZIcmZ4ME5qZThN?=
 =?utf-8?B?cDJWYnRzMWlnODJ6RHJsMlBCUDFDcGZESXBjNTl4WmxJTnNOWm5KbE43c1F5?=
 =?utf-8?B?ZndjK2h5MEo5eDRVejdkRGlFREhub2RFaEJKMDg2cGRWNXZ1RDFWV3IrMXNp?=
 =?utf-8?B?RTN1SzdTdml1TzhkNi8rTmlROVZ4bnIrMGVMOExDRjZnWkZ3aExYcGdkVUZY?=
 =?utf-8?B?cGFXanBvQlYrQ25UOEdoTDExR0NoY2dmbXBpYlRGN2ZxTkV6VDJTVk5XbVRU?=
 =?utf-8?B?d0tLcmZudTNHd0kzZWtQQWVRT3VsNXBMalAxUW5oL1AyUGdSRnM3QlBxQmRx?=
 =?utf-8?B?NmMvc04wa1doNGRYOEdnaUdiTURZWlZpK1I1MldpY053SkdHZWhveHdzSmtn?=
 =?utf-8?B?M24vUVBPVnp3bzdsSHZMKzNlOUE2R2RWZDFFdk1BUXBTZFhPOC9IczJBRDNs?=
 =?utf-8?B?a0J2NEIrYnl1dzQ2cHJNRTNocE5FcWZEcU4zRFBRczZVdGtsVHFtM09laito?=
 =?utf-8?B?dHFtYWNQbURVVVQxeUJwTWgyUzFwdktELzFpZitrSVZRMnVlK3pyWlJ3aUds?=
 =?utf-8?B?MDBWTkN0K1Ixci9RNmtKYVVvTUVEdW12YzVGKzhPWWFwM2FmRWw5QzAvQ3Mv?=
 =?utf-8?B?SFFnN1Y5VGJBZFRScGIrSU5UOFRRR1V3dGE1RE5ScUVsV0htT05TZi9ETS9n?=
 =?utf-8?B?M2JWbzRNUTgxc3d6RVhHMXVFQmZ6SE43VjB3cWVJekV3UmlqMUVENDlCUiti?=
 =?utf-8?B?dGVxTUVEYjM4UHZPTTlYaytsZWwxUjUwajRKaGdsakE1cHUzUm42d0k2eGZB?=
 =?utf-8?B?SGovNTlvNmxCQ3l1VFlyb083cVZmSnBmQm4rbDlwb3lBcWdJL0xLblBuSzEy?=
 =?utf-8?B?cTB2N25aejBzZnExNlMwYmtrQnI2eTNyZUtNeDMyVy91VC84UE9NSCsyWWh1?=
 =?utf-8?B?TG5FT2J5Z29iUWRhNTFjbkVGeVc5Yng3TERTMHJwY1dCb3JDYWNxM1pwbFRq?=
 =?utf-8?B?dnBKK0ZTSnI4K2xWTXRUMGNJblBtSkE4TnZPN1MrVUNPU1hlczJkcmptRms4?=
 =?utf-8?B?WGYvWXNkOHlsZjFXY0htN0NhQmF5WnZwK2V4RS93UzJjeHVCWmYyeXRhY0dn?=
 =?utf-8?B?OEUzL011Y1IxU1dTOXVRejNTV0Vzcmpvc21IZzBWWG5HVTFUS2RrZHF2N29s?=
 =?utf-8?B?c2JxU05kYXZhSFBpeS9qQ25QVmZkWXpyRkFYazI3bG8wT295SFVuMjF3aWk2?=
 =?utf-8?B?czA3YUMvWW9CMDkzdkxXQ09zNGhQTE1hNFJhRDZUQlpCd0dHNEFyMGxuSGdU?=
 =?utf-8?B?a3JBUWhqb21GWVFoOUhRZmo5eDJhZmtSaHlMTXRsZktrNFFLNEt1L2tScEpU?=
 =?utf-8?B?d0FlSVBmOWRkTWlRaWl3ZmxOeUVLSUQxZHg4Zkw4M0cyT2NZdkgyUXV4NEth?=
 =?utf-8?B?RFlwOEhZMXg0VW1KZy84S0Vqa1BhSW9Ta25GTXNBUlpzYjl4L2Z6SDZQNW8w?=
 =?utf-8?B?N0hJWXlzVGpHSzVKN3IxSWdWdGhHdVpDL2NNa0d4NDc3OEhIRHdlTlNTckJj?=
 =?utf-8?B?bThHb3RIU1c0YS8wbVk3R200bHNtZGcxZ1hGYUE1bWdJaGtPRkFsTnZKRDBr?=
 =?utf-8?B?bjBQUTBEMlhTMzczN1AxNG1HWlpRZDI2MFF6SHFzeEtWM3l6Nmk5S1YwZ0hw?=
 =?utf-8?B?OStycmlEaGFUN29sM3h5YnNURFRsUTk1a1BwNmlqeXNDOEdjK2VJaVlXbCsy?=
 =?utf-8?B?M1llTW1JMGZ2UFMzUFJBVGk4dmlHUlE5Y002SDhhQ3p0ZjVJTldUN3F0OGxi?=
 =?utf-8?B?Sy92Zlk0WVhWRVFvWFc0N1ZCcXNDaGt6R2ZkSmdNNUJxM3RTTEpya1c4SHVz?=
 =?utf-8?B?VG56Qys1S3pUMWNaTUQ1S0RydkRPTyt6SDh3eFZGdFdlMXJCVzcyK0Z3NTBx?=
 =?utf-8?B?SU55QVpjYzRoRlBRWnNQRzRVcDlyRE9La1VVQXJmZUJkZ1AzZ3g1aXVTSC9V?=
 =?utf-8?Q?LN6BchYR6Yv1VOM5g4ju+SNkz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f3f95f-ab96-4c24-b214-08dbb9252d97
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:29:13.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgxwDatg0kVmml94V0/fAoWH6ZpxL+K+l7lYdA6/iLm7/jy+cy/ozKamQBo4YFkLINm0Opnnx4hFJWa5juMMtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936

On 01.07.2023 09:18, Christopher Clark wrote:
> This is a v3 series of work for Hyperlaunch for the Xen hypervisor,
> an update to v2 and implementing a subset of the v1 series and functionality,
> with changes made to address the community feedback provided on the patches.
> Changes since the earlier versions of the series are described below.
> 
> The patches in this series are primarily derived from patches 2-4 of the
> v1 full series, in a series of smaller patches for ease of review.
> 
> Thanks to AMD for supporting this work.
> 
> Documentation on Hyperlaunch:
> https://wiki.xenproject.org/wiki/Hyperlaunch
> 
> v1 Hyperlaunch patch series:
> https://lists.xenproject.org/archives/html/xen-devel/2022-07/msg00345.html
> 
> thanks
> 
> Christopher
> 
> Changes since v2:
> - combined v2 patches 7 and 8 for common review
> - rebased the v2 series onto the current tip of staging (sorry)
> - fixed the placement of the patch changelogs
> - provided the changes description in the cover letter
> 
> Changes since v1:
> - the v2 and v3 series implement functionality from v1 patches 2-4
>     - v2 series objective is to enable efficient patch review in support
>       of merging the functionality into the hypervisor. It implements a
>       subset of the v1 series, incorporating changes from community
>       feedback.
> - the bootstrap map is made accessible early in the v2 series via both
>   multiboot and boot module arguments until later in the series where
>   multiboot use is retired. This allows for incremental conversion across
>   several patches from multiboot to boot modules.
> - the 32-bit x86 boot environment header is removed, and changes are
>   made to allow the new common bootinfo headers to be used instead.
> - Arm and RISC-V architecture bootinfo headers are added to ensure that
>   builds on those architectures can complete correctly.
> - The KConfig patch to set the maximum number of boot modules allowed
>   is not included in this series, replaced with a static maximum define.
> 
> Christopher Clark (10):
>   x86 setup: move x86 boot module counting into a new boot_info struct
>   x86 setup: per-arch bootmodule structure, headroom field
>   x86 setup: change bootstrap map to accept new boot module structures
>   x86 setup: porting dom0 construction logic to boot module structures
>   xsm: switch XSM init to boot info structures
>   x86 setup, microcode: switch to the new bootinfo structures

While up to here things are an integral part of your hyperlaunch work, ...

>   x86 boot: define paddr_t and add macros for typedefing struct pointers
>   x86, arm, riscv: add per-arch bootinfo headers
>   arm setup: use common integer-typed bootmod definition
>   x86 setup: refactor efi, pvh and multiboot entrypoints to new boot
>     info

... I'm getting the impression that the rest is unrelated tidying. I
wonder if we really want to take that churn right now; besides this
needlessly bloating the series and pulling away attention from the
functionally important parts, I could also see there being a need for
changes later in the course of your hyperlaunch work, which might then
have a knock-on effect on what's being carried through here to very
early boot code. Early boot code, tending to be fragile, would perhaps
best not be altered more than necessary. I wonder what the other x86
maintainers think ...

Jan

