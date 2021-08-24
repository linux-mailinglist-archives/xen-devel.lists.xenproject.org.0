Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683703F5E78
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171342.312669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVzn-0004kd-Nt; Tue, 24 Aug 2021 12:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171342.312669; Tue, 24 Aug 2021 12:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVzn-0004iR-KM; Tue, 24 Aug 2021 12:57:39 +0000
Received: by outflank-mailman (input) for mailman id 171342;
 Tue, 24 Aug 2021 12:57:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIVzm-0004iL-9d
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:57:38 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db06577c-04da-11ec-a8d0-12813bfff9fa;
 Tue, 24 Aug 2021 12:57:37 +0000 (UTC)
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
X-Inumbo-ID: db06577c-04da-11ec-a8d0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629809857;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RsrB//zndr5d1cwG0wvJrKN1CO5GAP/lv/tj68m1BUc=;
  b=KuvwNx+gUd/uSDjd1lY1/+ixwCUG19FY4ZH4Uy2I6yWQfxQ1zxD5is5w
   8YhbTrop8aqLbITZzhxTa+URepWfPpZfpOCtAJvuD/KA5Qn6NircC54CX
   bG4Z9n/d7HO1Tu10KdTb20coPtbVWQvuzbGPM90fSbxrHCF4gArs1NtCd
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zCZD3ON66v5+P8vQBBjw7K1awh0fyBSEdYfPPZ7wxqLw31IipNsKaIUHi+ICR17go0AaciuZRQ
 g0qsMnswTF69NuVuouflm0jEIo7hDluUhA6HZLl99mz91TqhUf+V1qImZ/LbXBTXYHDCEGruLw
 Grdw2/q8Wbt3AC/Yi6NnGK3bPL0nOpUls5QCAeyK0Q1w71yaZkncsvTbdZAsf+K+4wuj77+41B
 oicenGx8hqqoSCFizT7R1r9qR05+4Vzym8dzRe2GhcZ3GlXGvgNtyTTQE5T9n49X9eHvlmAs35
 TizK+JODTP1GFWQ933OIT63J
X-SBRS: 5.1
X-MesageID: 51549888
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:foWmLa6AHOzlHtfIHwPXwDDXdLJyesId70hD6qkoc20wTiXqrb
 HIoB17726PtN9/YhEdcLy7VZVoBEmskKKdgrNhQItKPjOW21dARbsKhbcKgQeQeREWndQz6U
 4USclD4arLY2SS4/yX3OC/KbwdKZK8gcaVbK/lvg5QZDAvUYFPqyp0FwqQDyRNLzWuK6BJbK
 a0945fvDyrdW4MYsn+DWlAU/nIptXNmp6OW298OyIa
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51549888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcbrRDQgunZNjtne8HNIMURVxZD94hdEgIv3xSInek+ha3WioXmjOXgo9UHbYHYqHZ4tLEv6Pg5yDhOIaVWEJ3mwLYv5ELkCSHwNGfJssfRXp5WwNRBre9y6E7RaCv6iAjntDpfttWNpPJtQOmy5NVO90CtRNjFc5YFS/2CbYJaCsuYEQiwaDhcD0h/VH0JXKPo9//aDs3cO43HanFucYjCyzYto6+ED3qQac32rd0VP+2LOGwWdJlWktWhS48grcmZ++0e9iBr2Xp4ZvxY9TX1uNTf94tNf8EljUu0jAgzW/soFKjj939y3WbCKUty6JV7D4jbZHaJ+aE43sl+JDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfIztsSA0965LugMWS5sOkjcsyFGNv+KH37SLUbfpHs=;
 b=PjTAoHPqgufajcZoOk+AjAqksH2EQZsVEA6GBlFr964y3icSGsExAbFn9L4w5y2/vPT9NANEVES4Kww4ljGUK0jNoOc+fMHRI7TkfxIu4lJyxi+L+x8epcdN4+Z9u4CFuASuokjuY8uSRdbwesUeI08I/2ezoHKnTNkx9InHVuRh95d8i437XKKv2mabTgaZNFO1NDlb5q1p/791x+g7307Pq3ggjrmw5eCSxJ1I3AmgrkjOLdNdF/422NQEOUMLIC4FkxY4V3flsGaksX659eDZXOQUH62XPqQhVmwI98D+YrlFuLwvvIAOO5tajEKRWef1G9eluBBwS/OYBLaRhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfIztsSA0965LugMWS5sOkjcsyFGNv+KH37SLUbfpHs=;
 b=ph/KwIQD/vCmP5hSgSeBre6lbgkugew6MwhjpXxvC0Ry11UC5pIk7zCKLGvwVqcBwk0MKtEymaTn+7xmqEAvcLnVT+dzaDMQdyxskzNxKKdW/B9WYmsBS7oQ0+z6NU/i7AlzwNJvQZcPIFa15kvbBiZj4wx1Cq9HgYsU4OlR/Zc=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-2-andrew.cooper3@citrix.com>
 <1ba952b1-ad26-79e1-7aa9-af7df28774f6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Split the "Hardware features"
 diagnostic line
Message-ID: <34905dc6-f8e1-afdd-7f05-1c8e93eab3ff@citrix.com>
Date: Tue, 24 Aug 2021 13:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1ba952b1-ad26-79e1-7aa9-af7df28774f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5d9bc1-d8b5-49b8-3b04-08d966febd9c
X-MS-TrafficTypeDiagnostic: BYAPR03MB3688:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36881A5C74A36985842E4DA3BAC59@BYAPR03MB3688.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /75sn0miVegHHEOHd3My+p5mBWfpigOosFO7UnKDUyc9gF3/NStBB8gpyRdUIpp7egpY/MK1YmpFPc/0aj4matQ0HCBkHLJiCpQIzhNbhjtKKaZtwyAxTau5xhL75g3FRDeap082Qh8Yl0HsrnggHJhXFrxa/0BWdvZLS/dbx3TYZA2nLwT8W3ji17uxR7fTkSfmVlH6etspcWFIliOXoCR87udH4moEoqCpWiJ+2hUrKEvHiBEnjt/j59860GLhDxiCHBKBwe/CZ6OH0Dm/q6O0HaQ1G5S6/OM89sqHZx+FR1igqhMZx4nWfuP1lb/BrkZ2/yRG/IEyn9fWPHTZEFmWRucOT7iKvFR6T2Pmk3YBr/8QTgy5M06SFftEFIh4BMrvxuObU04VZOmzfGEVwIIAnqlu37aOf7il0xexU/uzeHjMfXg1sQaMMhlHAogVbsy3KlMhzlcq/UEpoIXF40hOtt+X/pQrz6IaS1mOPqPbG1LKna2W2o0dgM8qLNgLnpte1wcFs4HUR1G2Fm4FkVgG4el8gyVCPPPFo0GU3u0ZVCHjDj5R+sTXnTYXGBvp+6UB0vBySFSutVGGz0uy1UGQG5UvmulX/+y5wpCMi6T4wzNl7ATcZA2weWqenKmClSPayn+VECtzi0KLRVbC5csAddbsCitSB9DA26J3d4UnE4r4X0Dr8G64sHdhbjKJN/FUSbEuZRfH/gBrzqw8BZEjPyMA0mWSsjtbffViHOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(6486002)(2616005)(956004)(316002)(66556008)(66946007)(66476007)(2906002)(55236004)(186003)(26005)(8936002)(8676002)(54906003)(6666004)(16576012)(4326008)(36756003)(38100700002)(83380400001)(31696002)(478600001)(6916009)(53546011)(31686004)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0pXVUswSm8yT2ZNRE5pK0M1cmgrR0tPVFdid0c0MlVDZkRtSTZIR3Fuc2dC?=
 =?utf-8?B?S2RmVzE4MmdnMEVKUTFXZkZiSmJWVUVQcy93dlNXdHhMajROck9PQ3M0UGk2?=
 =?utf-8?B?MGpNRk5IamdieFVGSWY0dkxmQTJaY09vOXpGNEJzZzQwZElMTTRVb0RqYk1L?=
 =?utf-8?B?TUFtTGdmSVovUlNjVUdGQW1wbFl6YVhlSERSL0toS3JjYjZ1ZXVYVHpJMU5o?=
 =?utf-8?B?ek53K1NoVHhjRFZZbm0xMGd4ZC9VeC9iQjROMm5PNVRWRTNsaWRvd0tRZ2dl?=
 =?utf-8?B?MjFtY0todHlUSHByaFliRmtxZSszbjhrdXpxQU5saVBIaVR6UGtXT05DcExS?=
 =?utf-8?B?bkdFRmZ1K1NOU25CTjJNVTFSMGNtZk1FbHg0bjZEMkNVWTRkYUxta2lrb2c2?=
 =?utf-8?B?eWVxeXVXQU5mNnBUWXU5VDhaUWl6dmNES1BCTEg3aHVscHk1TlVKTVhzTXJt?=
 =?utf-8?B?RktOMlMvRUtQNm5rOVNmRGREVm93b1d1UEZFcDB6VGdsUXU4aWR2d1JiaFA0?=
 =?utf-8?B?NFJFL3plUWRieUpzU2NkZnU0RmVDM0paU0M2R1crRTJUY0wrQlo4S21yK3pL?=
 =?utf-8?B?b1E1d1l4dWZyWXltaFcrK3BGQ3hlTGdFQWUyUTA3WlgveVdISElYU25GQVBO?=
 =?utf-8?B?VWxuSTNndVFOVkdaN2M1RXJzeTEwQ2k1R0FqUVVRTTUxNUtMR1JYbkdjZFpJ?=
 =?utf-8?B?cVE0K3Q3d3JiaVRYOXVzSmwxTmw2VHlCdDlSRlhDVmg0Y01CYmVaa000LzEv?=
 =?utf-8?B?QWVLS29IQjdZNE9IUS9qa2RMd2pLeXlmcFgxaENkbE96QnlmN1llM1BXY1FF?=
 =?utf-8?B?Tjd3Y0dUWE04cWMwMHNYRVZXMVllclNKdTlJZHJsdDlsU3F0dzQrZGdwcFla?=
 =?utf-8?B?cmNIbUNnb0h0RVU5YTlyTjdEaVdtZTFTSVlPWjlmQ003ZXhjNG45clQrb3Ji?=
 =?utf-8?B?S3NxbEl5WWwySE9pQ250RmQwWkJpQmo3NTFDYlE4MG0vQnpDMkh0VHIvN21P?=
 =?utf-8?B?QjMxTkNVQTU5SUYvcFNVeXlHNnV0dmczUUEzakJNR1Y5VXpmM3E0c0xNSklr?=
 =?utf-8?B?TjRlUzhoc0daclhid1d6NmM1RmRJZnJYWEdUeUJBei9Ia3pxT0Ftdjhubm9U?=
 =?utf-8?B?U0JuUGNmVlVnaVBrbWZkbHRXRHhlR0EvS0kwOXg1NFlmdFdXalpmUTc4SThq?=
 =?utf-8?B?VHN5ZHBjL3ZJWGJ0TXhWbkVYS0xhRzV4Y2J1elVzcGhIUDVIVEJLdEVVMWJi?=
 =?utf-8?B?M3ZIZjdWRTFJVERyMjlheVN5ZVZsdVpiMjJneHM5YkNNUlF6MDNFcHZxdEo0?=
 =?utf-8?B?OThMZnJBVWZrUGJHMGpwQ2wyWnlMN2ZYQmM2S1Z3QkdtOFFBczZ0dVFJd1R4?=
 =?utf-8?B?bkdIVTlKOHhTc09NSnJFTDgxbEZKSzBmclNyeFl3VFltUFI1SHcxa0kyalA4?=
 =?utf-8?B?YWltVDZzamtDTk5VZ3M2b0pJMkd6T0hRbm1NOEFNbG1jOEtUWnc5T1Baemls?=
 =?utf-8?B?UUUweTRtQzltSTEwVllnVzFzZnRjbVpXZjUwRkFyVDR6WnAwa2pkdmlqSVQv?=
 =?utf-8?B?TUptSUFxbFl5cXpMY3loWVFqeVUwSUgwajhYNStaMGpTek94QUFtTkoyUmhm?=
 =?utf-8?B?cXZmcm5iUzV3MDRuVkxEemV3QmxyK2lWUWZFMDQ4QmN0b1FyWm8wT3pEaHU0?=
 =?utf-8?B?Z05hanhud3p4TGQ5VmxwVWNDclNUb1R4eUcvN3EyekpYVTh3YWFZb1BWTzF1?=
 =?utf-8?Q?IF1/XbZlxMmB0gGWGL0stH2pCNRjuQAyEAlWUFJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5d9bc1-d8b5-49b8-3b04-08d966febd9c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:57:33.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvTUuoBYnarlo2PUH5Y3qUzrw16+mIAmCwb4ndb/huDjuFDTpaf54ZqWKR7imMeK+3u2PaPWkkeWojR+PrOy7AaV7vU12lr4/rj2ZUoSRGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3688
X-OriginatorOrg: citrix.com

On 19/08/2021 15:38, Jan Beulich wrote:
> On 17.08.2021 16:30, Andrew Cooper wrote:
>> Separate the read-only hints from the features requiring active actions =
on
>> Xen's behalf.
>>
>> Also take the opportunity split the IBRS/IBPB and IBPB mess.  More featu=
res
>> with overlapping enumeration are on the way, and and it is not useful to=
 split
>> them like this.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Thanks.

> with a remark and a question:
>
>> --- a/xen/arch/x86/spec_ctrl.c
>> +++ b/xen/arch/x86/spec_ctrl.c
>> @@ -317,23 +317,30 @@ static void __init print_details(enum ind_thunk th=
unk, uint64_t caps)
>> =20
>>      printk("Speculative mitigation facilities:\n");
>> =20
>> -    /* Hardware features which pertain to speculative mitigations. */
>> -    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB)) ? " IBRS/IBPB" : ""=
,
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP)) ? " STIBP"     : ""=
,
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH)) ? " L1D_FLUSH" =
: "",
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))  ? " SSBD"      : ""=
,
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR)) ? " MD_CLEAR" : =
"",
>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL)) ? " SRBDS_CTRL=
" : "",
>> -           (e8b  & cpufeat_mask(X86_FEATURE_IBPB))  ? " IBPB"      : ""=
,
>> -           (caps & ARCH_CAPS_IBRS_ALL)              ? " IBRS_ALL"  : ""=
,
>> -           (caps & ARCH_CAPS_RDCL_NO)               ? " RDCL_NO"   : ""=
,
>> -           (caps & ARCH_CAPS_RSBA)                  ? " RSBA"      : ""=
,
>> -           (caps & ARCH_CAPS_SKIP_L1DFL)            ? " SKIP_L1DFL": ""=
,
>> -           (caps & ARCH_CAPS_SSB_NO)                ? " SSB_NO"    : ""=
,
>> -           (caps & ARCH_CAPS_MDS_NO)                ? " MDS_NO"    : ""=
,
>> -           (caps & ARCH_CAPS_TSX_CTRL)              ? " TSX_CTRL"  : ""=
,
>> -           (caps & ARCH_CAPS_TAA_NO)                ? " TAA_NO"    : ""=
);
>> +    /*
>> +     * Hardware read-only information, stating immunity to certain issu=
es, or
>> +     * suggestions of which mitigation to use.
>> +     */
>> +    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
>> +           (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_N=
O"        : "",
>> +           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_A=
LL"       : "",
> I take it you flipped the order of these two to match the ordering
> of their bit numbers?

Yes.=C2=A0 IIRC, the first draft spec had the bits in the opposite order, a=
nd
I presumably forgot to flip the printk() when correcting msr-index.h

>  I'm slightly inclined to ask whether we
> wouldn't better stay with what we had, as I could imagine users
> having not sufficiently flexible text matching in place somewhere.
> But I'm not going to insist. It only occurred to me and is, unlike
> for the IBRS/IBPB re-arrangement of the other part, easily possible
> here.

dmesg is not and never can will be an ABI.

Amongst other things, `xl dmesg | grep` fails at boot on large systems
(because you keep on refusing to let in patches which bump the size of
the pre-dynamic console), or after sufficient uptime when the contents
has wrapped.

If you want an ABI, then it ought to be in xenhypfs or some other
hypercall, where the information is guaranteed to be available at any
point in time.

>> +           (caps & ARCH_CAPS_RSBA)                           ? " RSBA" =
          : "",
>> +           (caps & ARCH_CAPS_SKIP_L1DFL)                     ? " SKIP_L=
1DFL"     : "",
>> +           (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO=
"         : "",
>> +           (caps & ARCH_CAPS_MDS_NO)                         ? " MDS_NO=
"         : "",
>> +           (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO=
"         : "");
> I'm curious why we do not report IF_PSCHANGE_MC_NO here.

It isn't a speculative sidechannel vulnerability.

It is "error in the instruction fetch leads to a completely dead CPU",
and is reported in the EPT setup logic.

MSR_ARCH_CAPS really is just "misc CPUID bits" which were done in an MSR
because of microcode patch space.

~Andrew


