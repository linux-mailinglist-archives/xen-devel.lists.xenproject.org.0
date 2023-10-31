Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E237DC789
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 08:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625480.974790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjPq-0002Sw-GZ; Tue, 31 Oct 2023 07:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625480.974790; Tue, 31 Oct 2023 07:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjPq-0002Pc-Cx; Tue, 31 Oct 2023 07:43:58 +0000
Received: by outflank-mailman (input) for mailman id 625480;
 Tue, 31 Oct 2023 07:43:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxjPo-0002PU-N1
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 07:43:56 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d1994b5-77c1-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 08:43:53 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.18; Tue, 31 Oct
 2023 07:43:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 07:43:51 +0000
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
X-Inumbo-ID: 3d1994b5-77c1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUhDMgd1IPCLjWw/d3t+8FlD9CXvQYZFtDA/ngYzh44GCq63R6zqE9iCaaBInL91l8esnqBa+AcThaYyZVJWmi6ZmaU6TWtnx2tqabKPMDrmf2J+Hg9qdBkV46aySwFljxgezhYt9Jnq8L9NqIlRkMjy1pwvGk9iVefPmV7lkqK+YKjvYlCP6xNOlW4EBt0LcRL9OYyPwCW9mG/hPF/bMiwQyS0eWTddUlLUn+8DlzWVTpJNtc+mUU88fgO34owqybWQtZ9aT+LPyUkx3Xd+BG1SudpcCzaOQLWmmKnEla0zbdXTVJhhnrj/3h/XjvL+0kQ/Eo1/8WO2jZcb+uE7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elwS3m9oWWde0Vtx49vvAl5E1Fi32dRX7lZ44ox6X5Q=;
 b=fHMtAZC2uceFS7MNmgHypYle2u/rp413haF+RXW8TaZFHsiQvsdUYbgVvhxLZsoV6URaps1Ee0JuXisWGGtZj2LBJP/4VhvqMJ934ckFgkOVY++/GXXwyOVsDl5lcIVDGTx3D7LHio3zbQeoA6v6QOY4SJfhVxf15FaA0bXWNCVXaClbQqpgsuZFI590CBtZ72u3Lmk2DlDglDHuvx0vke3FO9oJ+68VvQRhvwE22pQC/KG9ighCHZqHQDIavD4Ue5Xr5d/tzOyELCa/pAGe5yYMWfA7pCmyNpL3fBHA8TWGDaYHqrsk/Sf6EcdLBrQJUWRwhQacikUaBvjWv08/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elwS3m9oWWde0Vtx49vvAl5E1Fi32dRX7lZ44ox6X5Q=;
 b=CqL4NoJ3iaogLwJ1nmSxlDEuAn70lA2TRNpEXa5D3+xqt9Fh2hSp8o7L53J3NeEvGA9iQcw0ay4WLEBrQSk1TPKNJLhlhKAPuCjfb4c2k1vY/WtHO38lXWT5X1uwQsbaWgmjvffkIz2qoH3r2cv6D7+SB2ZpJyIUaOnPqOaKbgQ90hgqSvQOJW+DkZab+yooh9mOEYZNmiNOycJWrdObTADF9olKkv9f7PY3CKvB/Gy+FB1rLhnLVMihbDoBwvsJ2MY+JVi2NrT841aUL46Og19+8RKxvVeY89AYBV9KZ1yL5mDkkSl31RSU1ar/t5ZciCYCvd/5T1i79J3kt9M0Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
Date: Tue, 31 Oct 2023 08:43:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d943bcb-1ffa-4d22-e915-08dbd9e51fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ARworeO/jy2KSkBBj2oAF9cV5p5H0NLKesiZ16P7K3fYfuDdp09AEtSit4tEMTdFdn3me3K//OkQUgZWd5wMtKO7JIozAMZnl9XH30P2Jq5fUKJzy54mD9c6Gbtthq1qFw7EYhCragyfRUK+Guk1c8OIARuHBu4P1wijYs19ACn5+1rHAIbGzwJhZDlnoi6A5A6CVzGsudE9tCQijKmUnyxlgeL+6UETQ8HTAE39W3V8jXmeZK/LTEh4O3pPEqM01Aytn4O5XS2+DxmqYQdnnU/6Mxxwn8PmGM2r8EpUHnppZrlfr5oG32N6cdQ2yfUaCHT3bg6E2uLrcVbPPWvlXIBdpNePUG3qt6EgRNZwkHk23nsk1gV3oJkXtacWcTxWF/TOwjCU9HK+qoBp9CDG4XSlDiw+rYcyPfQEzDgNXWTwBrQKyYFMG+0bNXLR21NvbpaI4WkJ0xT1HJhZChCPlkWUEaqDPE9PIB9nhM0PkiY/LCksSoU2DG521xydea1uC5V/MsuiZiNawmO9ZKMID82/5pF2tSaSBg3j6+TVXlVm7VHlWxOVkppL8i/CE6btfm9dYhxfhRDLEpQa4hrEk++SRCi/vV4fQ8g9bTTczSj4Dc2NAS55M2ag8yO/u0eKpkoCJXuqOnaw+3zljS+Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(478600001)(6486002)(6916009)(316002)(66476007)(54906003)(66556008)(66946007)(36756003)(31686004)(86362001)(31696002)(38100700002)(26005)(2616005)(6666004)(6512007)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGQ4WjRyVDRCZHdGT29TdERwUlNMeExSRHk0dTduWHNDYURZREhHT1JVcE9i?=
 =?utf-8?B?dkt3UVBoeUFNaFplL09VWGlBWDlGdktwSjkxdlNXMFVpbDJML1ovK0x3Y2x4?=
 =?utf-8?B?R3VTMUNGUWZqdHJneHhwN00wNDl4Qm9iWWZvU1pFMVZKdXAvQVZ0MnR2N3du?=
 =?utf-8?B?Y05sQTZRZTA1akc4b0dUbnhkaUtBVWlpZmUwc0VXaEtBRnFmbXVDUEdPRHl3?=
 =?utf-8?B?SFdPelFtNE9BTzN5YWNMNE5wQ2J0RUlRcWVuMWVURmM3UGNwaW5BLzVBSTE2?=
 =?utf-8?B?TmFsUWdFS01Wb3VMWnozVE42UDNOMk5vQzJXVVhtVWtFUmtRUHYvU29FY0xT?=
 =?utf-8?B?aUN5UFpWYTZMWkE0b08vR1NhZEU5VUxYT3RzTWxUbUszS0ZRazMwSDJUd3Bh?=
 =?utf-8?B?bkZCVFF3K3FDZmdnWkpScWk5cjlXNk9rc1M4aVpqZXd6ajJJdnNFSlFJbGxL?=
 =?utf-8?B?R2xQR05kUnZwZmIwZVkrd3BROEowYmtMRlhqaTVsVmlPWC9PNjVUTUM4M3Ax?=
 =?utf-8?B?bUdRaXAzSmlxUFFXRnAvUzVhNWlnWmlzNlNPNzhIMmNpQWMvM0RiKzRSY0hY?=
 =?utf-8?B?NXZFYXYrQUg2RUp1eFpzZ0lINWM1WjRZbi9XeEsvSFJjVC9ZNXc4bjNvUlhp?=
 =?utf-8?B?SlNVd2VCdm5TSnNrVncydjNhRy9ma0xnWTRucnowZUVocVVlb2k5OFRzaHZv?=
 =?utf-8?B?OWMwNk96NFNNcGtOWExnTGU3VWJTMSt4M1dmMFFQbzl1MmVxeFNCWXdhSldr?=
 =?utf-8?B?UzFVOXNOMGxnUHdoY0NGQzl4NkRLUkJZUWdtUEkwVzdkV1NNMnRHYTRuc1or?=
 =?utf-8?B?M0lMaVBHYjZPWnFtVkNiUm01M2hRVGxzN3QxN1lmb25MYnc5RkxvTkJCY0Nl?=
 =?utf-8?B?WW9jWG5Dczkwejc5Smx3V2FEdTc3UktOajhhVzNQVFdwdnhBS1YyY2lHSWRx?=
 =?utf-8?B?SVAzTUhQUnlrRTBtVWV0eGFqY1VSbTBKY1FkdFpqR0dkOER4c01icXRGZmdW?=
 =?utf-8?B?ZzlSMEtWY0JtWHAxTUFTdDlFUDhZcG8rQTE2MWoyL2xCM3VySmR2QWxublZr?=
 =?utf-8?B?TFhDRTY1N3BISjZqSkNBMW5ZM3p4Tm9HaU53WkdJM0FzbGtZUktDL2QvdXBu?=
 =?utf-8?B?ZVM1UlVTRzM4TzZNVmFJR05IRHNQQldCUkpoM1VwcHdoUWhNdVlSemRxNGdV?=
 =?utf-8?B?NTRqa01yeWxOdVU5WjNwSjM1TVhrYUZodURPMXF6TGgwZ3R3ME9qR0M2ajlN?=
 =?utf-8?B?eHhOSVBLd2JMMkFEWktXUFdMWWRTUE94M2JjZ1hRaU01Q1lPTVBqaUlZd3lt?=
 =?utf-8?B?Q0xNbms2WWF2Tm05OGhzRHZMMnl3aFBJODcrQjBqbkEyVmZzanhFRDJUS3d4?=
 =?utf-8?B?cFB0bmdHYWo2K0pveURSalpKQitPUGxlL29MUUFvZGZoTFRGUmtBekE0SkhV?=
 =?utf-8?B?OHpkQlphQjRTZDFHQVBVRjJJR3pia0tPYzl6VmgrMTZpMkRpU2psY0pPWS95?=
 =?utf-8?B?TWxPejNxZ0lucldRWXFZY0VzS0M0TEZwTGVYci9hdnQ2eG90cUdPOW4zNUFh?=
 =?utf-8?B?Zm84aExhYlowZklJK3k1MW1sZ2J4RFAvWGdtT2hFSFlmdDkyeW4zY0dOck5L?=
 =?utf-8?B?NXpmSzFVblZMOHdLdmEwQ3JlUWVLRTFyV2duUk1GdDNpT1dsRUZUNS8zMmFh?=
 =?utf-8?B?S0lyS3ZmTC8yNE9GT3VPNkNnWUZhbTNkN1d1cGZzSEE4NFFXZCtCQTUxTW05?=
 =?utf-8?B?UDV4OENlY1JpVHE5eXAxN2ZvN3RFSGQ2VnlSa2EyQzJlSHFQM3p4N2dPK3Ba?=
 =?utf-8?B?aUx5UVdYMGVKd0ZxZEV6UHkzemMwellzTnJDNmNuVDJBUnlHVTc0NVpoUHJi?=
 =?utf-8?B?VlVnd0V0aGNkSEVZclJ4MFdLNlFFRkJ2Ui9PRGkrOWUxeUZSRStVdmUwU3RT?=
 =?utf-8?B?bDdNUTVRaEZDbXBqQzNmaTQ1TngrRHVZaVBNZEFBQms5RjdiZ0N6d0hMWEox?=
 =?utf-8?B?WFBKblJqN2dBR1lXZzg0VzJ3VnhZS2NtUXNyUzJaMGkyVXFyUHRmbHVaL1NR?=
 =?utf-8?B?STMzU0ptMjBlMnRGOWp1OEJaeTdoTHFvcTJNUTRjTnJ0ZUlBOHU5bTZTVGlk?=
 =?utf-8?Q?NESNGWvhnDZB18os9Xdjf+Pxb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d943bcb-1ffa-4d22-e915-08dbd9e51fe0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 07:43:50.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sM3yrPz+LtQayJ5I5pv7Z3c14qMbu+O1KruU66J8UlNUj+aGOvF0RjLE9oKz5SFriRCsDbzahlLePpunyXtoeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9081

On 30.10.2023 23:44, Stefano Stabellini wrote:
> On Mon, 30 Oct 2023, Jan Beulich wrote:
>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>> --- a/xen/include/xen/macros.h
>>> +++ b/xen/include/xen/macros.h
>>> @@ -8,8 +8,14 @@
>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>  
>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>> +/*
>>> + * Given an unsigned integer argument, expands to a mask where just the least
>>> + * significant nonzero bit of the argument is set, or 0 if no bits are set.
>>> + */
>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>
>> Not even considering future Misra changes (which aiui may require that
>> anyway), this generalization of the macro imo demands that its argument
>> now be evaluated only once.
> 
> Fur sure that would be an improvement, but I don't see a trivial way to
> do it and this issue is also present today before the patch.

This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but the new
macro has wider use, and there was no issue elsewhere so far.

> I think it
> would be better to avoid scope-creeping this patch as we are already at
> v4 for something that was expected to be a trivial mechanical change. I
> would rather review the fix as a separate patch, maybe sent by you as
> you probably have a specific implementation in mind?

#define ISOLATE_LOW_BIT(x) ({ \
    typeof(x) x_ = (x); \
    x_ & -x_; \
})

Hard to see the scope creep here. What I would consider scope creep I
specifically didn't even ask for: I'd like this macro to be overridable
by an arch. Specifically (see my earlier naming hint) I'd like to use
x86's BMI insn BLSI in the context of "x86: allow Kconfig control over
psABI level", when ABI v2 or higher is in use.

Jan

