Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D41402AC9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:29:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181134.328158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNc6M-0008NA-Mq; Tue, 07 Sep 2021 14:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181134.328158; Tue, 07 Sep 2021 14:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNc6M-0008Ke-Iu; Tue, 07 Sep 2021 14:29:30 +0000
Received: by outflank-mailman (input) for mailman id 181134;
 Tue, 07 Sep 2021 14:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNc6L-0008KY-D3
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:29:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01bc4f6c-0fe8-11ec-b0fb-12813bfff9fa;
 Tue, 07 Sep 2021 14:29:28 +0000 (UTC)
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
X-Inumbo-ID: 01bc4f6c-0fe8-11ec-b0fb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631024968;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lGl+w9RZI0yp86LvWEJpnlZkmHmp3WZZhe19+vSleZA=;
  b=bFsar9cQCXdcdd2pvyq+aRSAZ2IOClsuFqKLVj1Dfkkq2TPYdER44FNz
   sy/TmdCT9c3gAOmpTEaRByO3VeG4yv/t0BQMuzZojWslQEoxb56HU00MN
   ACFtgBpR961QiALUr1wq0Wq991TZ1hf+SrhSU7IN6gGWBs52gLgzXTUrZ
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5G8ZHOZDQ3UqttNSD/nRZIat0DCwuD8jlbOvjimFqOVhYrrHEuzc+DivD1AzVvCyeukkGzEz5P
 DS8sg3h8jVBnB+fWxASj0PB5PLcqpbNSLjlEWt9AKfMAb2E9ydNHGpndmO9VeSYx5lxJIteQbI
 pWhtVqRf1wlursJasycsPg5DNpb20RRDlSsgKa5bO5TGDGqnWvL8REC+cpX0Ob/HDcKrpWLStM
 A4aEY+e5EEv/hH0LpQUv7gZ4uwg1twkQx7XF9ZiVQnsv/UXMZsaUoFhUiugj0yBSHmC2TfOl3c
 9okHltYbV+aigI0QcNG34S6o
X-SBRS: 5.1
X-MesageID: 51764707
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zQzsKqC7ICIJpFTlHeglsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6LS90dq7MA3hHPlOkPYs1NaZLXXbUQ6TTb2KgrGSuAEIdxeOkNK1kJ
 0QDpSWa+eAfmSS7/yKmDVQeuxIqLLsndHK9IWuvUuFDzsaDJ2Ihz0JejpzeXcGPTWua6BJca
 Z0qvA33QZJLh8sH7WG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNxN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wiJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABCnhkjizy1SKeGXLzMO9k/seDlFhiXV6UkXoJlB9Tpc+CRF9U1wra7USPF/lq
 /52+pT5elzpmJ/V9MKOA47e7rCNoX6e2OFDIujGyWTKEg5AQO7l3fW2sR52Aj4Qu1F8HMN8K
 6xGW+w81RCIH7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="51764707"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2FAZXfta6HueaFIwDivZSRLlKn79/z9UJaRxDffmo4v20ClQkQ260H1LcfwUF0DK7ErXvMuF6cULkgZp4lSCYA0GtmjIrCaV98eYK5bFRsQ3eFjwkiv9cnYxY/6ocytfJJrKcEt3CoqJQEOZHBfMqgujmrky0p5IvUd3fFHvqKVbDnP4U+gro/Zi01bXusXcekZG/G4u0DjAi+/Td8Fw8R8sWZQQpfg8KT3yEqDl62zwdOeqNPM1vYUJyuaiuzEjq3wLm6t5PUQ6cQUuNT+PLdwYxjlDQSEcOz+XRt2/glbGa4/27LjSFesyDMRifffdxkwBmLEqDs1NvQnGFA2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=E9qaqhkQxxacAGQ126F758E9SkuBmd5PlZ0+MFHQQXw=;
 b=J1+vnW1lZEcnDh7lOaMgxcjuiZ8/1oZrw4ScVKoSPftnoTxTkrignCQzlXYDNL5UY5Nr0txiQwiXjm+myw1TeEBhxBN+N5p0Icp5jfCTth0YdoEBLKnWBti5z4lmL/jlYEbRanJ5cQe75RausrJp9/h5run9PfSKFtH/jTW0/oTWaIxjW7kHNGqtIcoWAeRAJWW98aiJrRfKkcAWbng5YIM/yxMPDQgfX5tFYoocNw9HRUzpJMhhePuTAk8GU3g8cpuG8k39jkMnLBcEQyfKAk+c6vsHVqAk1yh4C9GFKygpeXQ6nHsa3k8Kf+mtcbADnByICZBM6iCqaC1HaI5TfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9qaqhkQxxacAGQ126F758E9SkuBmd5PlZ0+MFHQQXw=;
 b=CeUbcAcbVb9KVc7GJt9BPKIw8X8tibn9RvFBQpwgVGpUY4Q1Csy6819EMrtrxre7/rSF85Cn1li8BNcvH7+IPNSR8of3F9JGpPxXB7IL+mLzf0xWEKDVczLUZgPYIU+Itc8ZT9RDzj+m5aYrTWukYW8s0ZlgSkxBk7YPxfCylaM=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
 <20210817143006.2821-2-andrew.cooper3@citrix.com>
 <1ba952b1-ad26-79e1-7aa9-af7df28774f6@suse.com>
 <34905dc6-f8e1-afdd-7f05-1c8e93eab3ff@citrix.com>
 <709c7d54-2088-415a-6460-bf44002d1d76@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/spec-ctrl: Split the "Hardware features"
 diagnostic line
Message-ID: <074cf055-6e8f-4ec8-692b-2cd0e3f11b7f@citrix.com>
Date: Tue, 7 Sep 2021 15:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <709c7d54-2088-415a-6460-bf44002d1d76@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba221d1e-303e-46d7-46b7-08d9720be056
X-MS-TrafficTypeDiagnostic: BYAPR03MB4247:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB42476B2A2781514419977F48BAD39@BYAPR03MB4247.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNMGI+dEwEkTNjGF3iyVqsxgiqC8PMdJcvip1GuYXvgeXDBGml0b4SsUxOUpk9reqH4CYhUaodMy5EWo1PwGVEUYl9zckICXwRkVIivE5VA4G7IgFUv79qoUYn4oDzqjKQO/86i9D09wWO4lh/3cfrjff4ptCaNS9LGgilx+4v/2QPXswq1LdrsV98uyGAo1FdPA3zJLqwEiWJ025zCQFg+YRwtITpQNmU/tiFyHYmgya1e9g1n5GG1iGpOpFFraFflsr3g8DHkDNG8I8jhUIY2vB7ZTq9pYEB78H8uwL4LuHwF4Qd2JPggpjP7I5dDui2KYR6cF/ZnOwxIyKSAdi5Q0KMz5p3IWrbF5wCwKK7vF31SAISTtkZQba68OFsHDLlMse4V9AqQ+PSFWO62q7zHMAM8Cu/28rjyEyWjmX4336xU5KnYf+1cHcX89AvsWrsjdIqrZhFcpVClR28sU9+Yzyqw1H8D9MLZxkU77veU/h0BJOx9NUv0Qvi7KcCeyxVgW6AehK6PoC2UyEh/JS6Ini40+bbYWl7GDM23EsAXCAkypdmVGoJ56Oosgd4j4+0h8m+MEsynYhREC+RF6V7UsrXH04ot8OC4g/+0OZYY+DPbjgT7kl9wG4QhRqVjqmLXVgZ4O5ECRTdZoKTNm4jra0w4TXWuYBCYddsvZCW9YiyeTwr4e1d/4l2tSWFkez7kazia/zm0HCkh0U1/I0r5liXw87aWFXS8OgjztYDk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(8936002)(83380400001)(38100700002)(6916009)(186003)(36756003)(4326008)(86362001)(2906002)(956004)(54906003)(26005)(6666004)(53546011)(2616005)(8676002)(31696002)(66556008)(66476007)(55236004)(6486002)(16576012)(31686004)(478600001)(316002)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lFY0NmeUMxOGZzYXp4OXZwRnIyQ3h4VFJFWjE0MTUzVDJvbWxMMVJtdC9h?=
 =?utf-8?B?VVFnRDJhQmZMRU5PTmtpSVZBQVQzUi9BTkNMNWZPNWRlWWxpQWxTc040LzVk?=
 =?utf-8?B?VFZDU3hhS1IwNDNZRnZ1RmY3YnhVS0c3ZVVqOXhUSldZYTA1SHk5UjVDWk93?=
 =?utf-8?B?TmN1R1RySEg1Z29ZdEhtalRRSDZIUThIOGJocDVCOWZFakVTWmFySDFiVzg2?=
 =?utf-8?B?a1c2eW1UbnZuMDhOTW5rbXh0bVUvcnMwdVd5Zy9WTURzd05kbTNYbG01UGdl?=
 =?utf-8?B?WE5MaUJXMEF4ak9wOExQdHZtdThMOWdVVVRVN21abCtrZkcycnVsaWFTak5x?=
 =?utf-8?B?TC9BK3BUdjlFQVdZRDFSL28wWUxwV3FRQXZhc2N1L2ljMUJTSGdLOXlmeFMx?=
 =?utf-8?B?djRkUGxyTmlVZngxOC9sbU00RkdkRVIwb0swRWJSQ0FWd3R3VzhsU0M2ODVP?=
 =?utf-8?B?dFlsVXN0VEEwanNoWGVCUngvMWZxZm5BUy9oaHFGcHJlcUxTeTg1d3FlVDNr?=
 =?utf-8?B?bW1jamVDV09FTUpLV2JLaDhDMzBETnN4ZVlzS2JEVkVuNGZHSUdxNk1BbFJn?=
 =?utf-8?B?Sm1aVGpleVpoRHhLYmhyWUh5STF2blVISi9yMHZkL1BCb3BmcEpSVTBxaDlR?=
 =?utf-8?B?dU90Tkk2R1YxSkFOMndQK21ZZ0JtNmZ0VUdybHF3SnJUOGtETG4xTGI4dEla?=
 =?utf-8?B?dHUxRnIwTyt2MEVHWGVNeTdIVGhwSDNIMTFOVXZxdjRSQk95aThFRWtoODVt?=
 =?utf-8?B?ODNvbmd4NytrWlpXUnlYMTZMQXlKVllGNCtYakZqSHhwWEFGSC91NVFicVRZ?=
 =?utf-8?B?MS9NV3p1S1E1eXRuOWNLOGFWb2NKZWRtSHdIdHFzcC9LYXhZayt3NzRzMzBH?=
 =?utf-8?B?MVN3a3FtMG1LelFMdEsyeTdCYkJMOGFRNzdTVDJzSVozd0pVQkNMazJPQkhy?=
 =?utf-8?B?bWw3Tm0ybEhvMFdzcHhHdFhjQ2l3MGFianNJODZ0UHhia1JNMi9wM2YxR3Vs?=
 =?utf-8?B?R1RZTFIrVjRaOG5UVHhNLzVRemlxN0NKeGEyZDg2dmpNYXJrQkRseEY5aFZI?=
 =?utf-8?B?Q3VxVHFVWUF5QnhET0ZtMnNVNmUzakg1a3lSc2NDaEUwWTFuaXcwNmZZeVFq?=
 =?utf-8?B?VlBlQmorTEFYVCtranRMa0JRcHZRNVNQQXlsWVUrUXZmSmJTR2cyclFNRTlW?=
 =?utf-8?B?M2IrbUZtNzFiZWhMOHBNczJvUHF4aTA5dXhubEhhTmQwaEw3NS9Ja29zN1FE?=
 =?utf-8?B?TFZPbHlJV0U0bFJqWjdmakFRQkVTWkpaZjQvK3RBaEcrZzZRRSt6MkRnNG91?=
 =?utf-8?B?VGxLN21KSVZtRXc0dXF0bStrcWdHUlloK2p5VWdZWEU5NitJZkU1WmlvUWJM?=
 =?utf-8?B?YU1DNU16R1RvWkFaaGVIMDg2Zk5NMnY4cTBVZG1FUDhzYTRidXFsbDViQ1hB?=
 =?utf-8?B?bDZ1dHlVVHFOTGhOM1M0SG1BeklEWGhOMjhZbGl2NnAwS2Zid2lzUEV6U1pU?=
 =?utf-8?B?YjJJSEFrUDk5cUI4OHRURVpuRXBTdE1mMm9MRzNTaFZPYTJMTHZURDVVdExz?=
 =?utf-8?B?em4yR1luT2IvZXprMzhUMkthaGFaK0hsNmgzeTJoRThtWm00VE5GQ05ycTNC?=
 =?utf-8?B?YTJjMDM0ZGt3cDFtZTJDajVHTlhNWTFkU0hLdE92NkxjK2ptYkFHVmQ3dndh?=
 =?utf-8?B?NkVHYkZFYUxLaEJqM1lmRFRWR0xhcGlEV28rc0JpOUp6RWhyaUJQMGtvYmpj?=
 =?utf-8?Q?hge0gBZx6oYQhBaIUXxfnKoXyHaTvZQV1HET81r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba221d1e-303e-46d7-46b7-08d9720be056
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 14:29:18.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21uEQhV3ijmmgJ78MfIb81i+8Od03MNexR5P9dbq1eLRsidAZNJ/aANG52JupMfKkXt/D+H5k/7YbI5liqFCvKZ8R9O7emp50tLEdBsadnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4247
X-OriginatorOrg: citrix.com

On 24/08/2021 14:15, Jan Beulich wrote:
> On 24.08.2021 14:57, Andrew Cooper wrote:
>> On 19/08/2021 15:38, Jan Beulich wrote:
>>> On 17.08.2021 16:30, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/spec_ctrl.c
>>>> +++ b/xen/arch/x86/spec_ctrl.c
>>>> @@ -317,23 +317,30 @@ static void __init print_details(enum ind_thunk =
thunk, uint64_t caps)
>>>> =20
>>>>      printk("Speculative mitigation facilities:\n");
>>>> =20
>>>> -    /* Hardware features which pertain to speculative mitigations. */
>>>> -    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB)) ? " IBRS/IBPB" : =
"",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP)) ? " STIBP"     : =
"",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH)) ? " L1D_FLUSH=
" : "",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))  ? " SSBD"      : =
"",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR)) ? " MD_CLEAR" =
: "",
>>>> -           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL)) ? " SRBDS_CT=
RL" : "",
>>>> -           (e8b  & cpufeat_mask(X86_FEATURE_IBPB))  ? " IBPB"      : =
"",
>>>> -           (caps & ARCH_CAPS_IBRS_ALL)              ? " IBRS_ALL"  : =
"",
>>>> -           (caps & ARCH_CAPS_RDCL_NO)               ? " RDCL_NO"   : =
"",
>>>> -           (caps & ARCH_CAPS_RSBA)                  ? " RSBA"      : =
"",
>>>> -           (caps & ARCH_CAPS_SKIP_L1DFL)            ? " SKIP_L1DFL": =
"",
>>>> -           (caps & ARCH_CAPS_SSB_NO)                ? " SSB_NO"    : =
"",
>>>> -           (caps & ARCH_CAPS_MDS_NO)                ? " MDS_NO"    : =
"",
>>>> -           (caps & ARCH_CAPS_TSX_CTRL)              ? " TSX_CTRL"  : =
"",
>>>> -           (caps & ARCH_CAPS_TAA_NO)                ? " TAA_NO"    : =
"");
>>>> +    /*
>>>> +     * Hardware read-only information, stating immunity to certain is=
sues, or
>>>> +     * suggestions of which mitigation to use.
>>>> +     */
>>>> +    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
>>>> +           (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL=
_NO"        : "",
>>>> +           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS=
_ALL"       : "",
>>> I take it you flipped the order of these two to match the ordering
>>> of their bit numbers?
>> Yes.=C2=A0 IIRC, the first draft spec had the bits in the opposite order=
, and
>> I presumably forgot to flip the printk() when correcting msr-index.h
>>
>>>  I'm slightly inclined to ask whether we
>>> wouldn't better stay with what we had, as I could imagine users
>>> having not sufficiently flexible text matching in place somewhere.
>>> But I'm not going to insist. It only occurred to me and is, unlike
>>> for the IBRS/IBPB re-arrangement of the other part, easily possible
>>> here.
>> dmesg is not and never can will be an ABI.
> Well, sure, I understand this. I said "slightly" not because I would
> use the log this way, but because I know of at least similar (ab)uses
> of logs.

Lots of details which are currently only available in `xl dmesg` should
be available via a real hypercall.

The domain creation improvement work is making headway with retrofitting
proper details to virt_caps/etc, but there is loads more data needing
exposing.

>
>> Amongst other things, `xl dmesg | grep` fails at boot on large systems
>> (because you keep on refusing to let in patches which bump the size of
>> the pre-dynamic console),
> And instead I've taken the time to reduce boot time verbosity. Plus -
> the last attempt must have been years ago. Given good enough arguments
> and little enough undesirable (side) effects, I'm sure I could be
> convinced. (But yes, especially the "good enough" aspect is definitely
> pretty subjective. Yet then I could be easily outvoted if others agree
> with the provided reasoning.)
>
>> or after sufficient uptime when the contents has wrapped.
> The boot log can easily be made persistent on disk before it can wrap.

All failures we've had with customers are the fixed initdata buffer
wrapping before it gets dynamically allocated.=C2=A0 As a consequence, we
unilaterally up _CONRING_SIZE to 64k.

And yes - reducing the verbosity of the ACPI tables is a good thing, but
there's plenty more in need of shrinking.

~Andrew


