Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B5130875D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 10:33:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77831.141240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q9T-00079T-KS; Fri, 29 Jan 2021 09:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77831.141240; Fri, 29 Jan 2021 09:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Q9T-000799-Gm; Fri, 29 Jan 2021 09:33:15 +0000
Received: by outflank-mailman (input) for mailman id 77831;
 Fri, 29 Jan 2021 09:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5Q9R-000794-Mf
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 09:33:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 983e30f9-62a5-4b1f-b200-29043a8eb608;
 Fri, 29 Jan 2021 09:33:10 +0000 (UTC)
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
X-Inumbo-ID: 983e30f9-62a5-4b1f-b200-29043a8eb608
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611912790;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6qAusBqZnO8dUHGrbzMot9raaqYMoq0LgOm+1LG5F5I=;
  b=REttj8IyDfOetfRiCueTiU7Tr7QGVJkn8tPwO4sC93KiS7LzPhZSaXQG
   SZlb4LONzE8VnM6CgX5eWPDZxuvEOKcBdXkpF/cnoORePMKZZu+SOjX3x
   VuWBTvBcw31E7pW7DuVSRQj2GakFnOxRbqhowbknsLZNn1cW36RFcEUOn
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lzQFdzk6i+j5a+oRnKKbHno4GQqhFy9s2NpfxQe/cZblAIoAdCWuGnXl/trDHfb4QcxqZHFZzd
 KZGJVqh9zKZSnONo3D9CHsQyd0f9WRfcccqgXQIC9Mkpqj0Xr8+e3DQDA48XZ3WaLms6LnUshG
 TA4WrbJvPpKo3bRb6KIom5DVcL1JPxMnOfRVWvA+tqjJPRknA+s2iwtYrc1Dj+Y1cML7TYHhUx
 epyiIb3U4mKURw7tmObRw35zG7m5H5hzB6txRmD3P/PuCSEgBZKaLEn6dxL1qVr4X8yz6j941c
 WO4=
X-SBRS: 5.2
X-MesageID: 36338961
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36338961"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+E+Pz1pzUa13DMTg3TyKD6A6IfAASp2u32FHG/9D2TUwLZxcK72KF9V2ROH+svEOqade3mbB5M8l2ykdbTYcAbTPRA0G7bDlE5te1V6AH2c05l64QcbcFbuesfoFabmwbxWYeu/wBuOh2RYfAf3dgS1BvsXeKW8yp4U7wWjX/UimIK1gS3lk0F9O0/kZnkVrtF83a2nQaSLJrI/X4t4qL3ZJyb55Tf606xx7CbzLhvZ+QSzVy/wO64Pjk16BbmjMw/31gBipLVcLKX+Q2RdHc333Op81Z+OICWCWFgWq24ihGyqgTJ2dou0xGyw7VvgNJfZqubtyCzyS3eSpCieqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP0PrijEjZrAJGSu1qsypr6VxfVsHpHFcUZgWvWCsxo=;
 b=BXjS46lRYHHdK9dXwpviwDixeDiNVGnVPAlmlOScNW2pFE9DVy6/3Z90Ivl8pJYqzFobaMSAhIR7t1RWijPcFUSErnD+h2b1tvZ+7BMZLA60n9MA87DIx8A62zqWLPmdkvmX4mAm0YxWbO0J0HnaCPNbT2NDCJZK8nq3BEhv4EaF7J8Pk1M/OhCavPJLXkOuWDnuxoGfV5i72wKUEJSKaIVH+VURMxYmsoEaA2/uxvAxdvNTtR/iCRi/Mcph9O70ZCTtXnAZsfp2Rnpdk8Zc+hY/UWbF8HhVlXJPV4+H2TvKd8ip1wrVqL72VGIhC0qJlcwV7wmPhoDA5WDXInP1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP0PrijEjZrAJGSu1qsypr6VxfVsHpHFcUZgWvWCsxo=;
 b=eOZUwSQyf6VM50xctzZKN0dfLLBdqGj550hLQnLUS9e1FVtKOjJpANXEiA6NbrEEbIR9unauMuQRmNSuaz7HZojIuwh6pOzgji8BoDt9I5FRkLJlrCcx349/kL85GpjvULZVlSYShKEFzthEH1AqVlV9PTMlDoxefri7R6chvnk=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul
 Durrant <paul@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
 <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
Date: Fri, 29 Jan 2021 09:32:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6525d2a8-6861-440c-01d1-08d8c438e0d6
X-MS-TrafficTypeDiagnostic: BYAPR03MB4837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4837EC69D569A754BD71228FBAB99@BYAPR03MB4837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IE7Lg1vMNmpv6DZcAgZnjRYxWFa3zwjicQDkxmL3wRe6Q0mrY34UgoEvoGkaTEr2hSQSuR7Dl3QxHDGqoxDycYAVhDbGzFTiNa2ySCx/q9cGuWjnRgtyKPGWiurDuVHMrYS7K6zDP3+hhwrkFIyOLdYKQmZ1qn8DGa2pjfArGlesaTJxvbBgc6OzhDG7hlkSoF3Yp3IJ+vnZzuVbdQo6bphbSzMnd2yS4+z2GlZR2Z+KkOuntk5I8Hcq4CMSgl0WQKxPXfFdpkNOu+PbNMWttzC++i8f/VSM3BtXRZ71exbyhAVX9HKYGbZVAHRjHByJ8evgJf3iq3g5AOqusTMSXu3mmXDV6o7bxYpqUnfyD7omMUmqcwDxMrQ2e0hIkNBT/xyZ4G533rcE7Qkozxx2dw2cssN0ECu6xMtB0oLZGL6hBcfXirePaae/0x5KAkWXbSN1rVOaF5Z55/IeiR7EXnZSbwrMKkHpvtfpwe+qPYNH+s9+b1BHhJA3apCTAZTLdXzXk7kON0tpFBPd44Bt0toFUS5TF0CcJLUcuJzyqaDdxStdvO/E9k9C4z8grhHioX9fOZRKF8B3Ltmb0ugWNsPCIno8vcAXtxK72f3z2TU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(66476007)(5660300002)(83380400001)(66556008)(54906003)(4326008)(478600001)(6486002)(66946007)(6666004)(31686004)(53546011)(2616005)(8936002)(16526019)(26005)(956004)(186003)(86362001)(31696002)(6916009)(316002)(16576012)(8676002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bE1JUVBzZy95MEkxaG5qU0JJWTduL09Rak9VRjhwNTJONVo5aEF3TzJvN3Vm?=
 =?utf-8?B?UTRKK0hyR0czOHlpUTAvT0ltdUxEMncreU5LcHk5R0JuZFBVL1NvL0pDVDV1?=
 =?utf-8?B?SXRVZTBKUHpqZkcrVWZ5Q242dVdGVlowSjNnNFh1TkpvRjBOZzIwMWQ2ZnJG?=
 =?utf-8?B?d2w4eE5xam1vd2NoSXkxdWo2clBoRVR1anJkelpHQzBKUU1ocDl5cDZCVjQ5?=
 =?utf-8?B?SlVaQ2pJSmZobzluUEtiTVlxckhxVUVuZHFJdFdGMnI1NmJESU9mWjM2N0Yw?=
 =?utf-8?B?dzJPZEs3RStxc2RGWXRIWjdheUtVckNyUGx5V29pN2cxM0V0MUlCUGtqUGJS?=
 =?utf-8?B?WVBvSjBDN2JiMjNzRk9XQUhnNzJwZmg2eHRlbFVrTjNGczIwcWFMWEJpajEv?=
 =?utf-8?B?a1BKR3VzMk56OUFRaWVJZldIVk8rMUQ3TTVJbm9xSmYxY1FYMkxxbTY4ZmdP?=
 =?utf-8?B?eG82SGtBQ2RIOVFpeERKYytkdjRoRUg5Z1M5M0FiTVdUWDVXUmtreTY5VXlH?=
 =?utf-8?B?YVZGb1dLbUYzcFNYTERqUWtaOUZoTk5oUkVweVJRS05Rd0hRNUpvdHpvUndM?=
 =?utf-8?B?SlQwTm4zNUYyRTRacVlPcXRscjRUaTlTMkh2WWh2cGNLbVFFSlNkZDB2TEFI?=
 =?utf-8?B?RFh0c3RWcDlQRTJaSHFxZ1dKL25MU1BFR2xEZ0NFV0hxdmVzRUt1TEJWVnpy?=
 =?utf-8?B?UU53S1NHakdmS21YclBoOG1xS2xqWmcxSk9ya3c4bWtSRHhNUUt6UGtCRzJ5?=
 =?utf-8?B?N1R4ZnhyZ2FMZS9PVkNwM21jVWN4VFFMTlBXR0RrcFMvWVlzWFc4aDcvcnJH?=
 =?utf-8?B?VkxGRjV1cnpQUTZ6djlXK0Y5NktwYmhNNHAyalB5VC9KS1F6S1d2L3p5bXNN?=
 =?utf-8?B?U1poRGpEQlhBTDkrU3ROdXN0ZEtxMW5LV284WDZ1MWlnbzZiMHY2VFpsV1li?=
 =?utf-8?B?UkFBSitqZEt1R0VyUXZYMmt4RGg3TWNrb3ZPL2ZJM05KTTA3L09UVll5Ykp5?=
 =?utf-8?B?TVVzbFU2NXFRcHd6Zk9lekNZN0R1cDNZZWk4eHVkaGZpTjVVWmhmL2h1NXkw?=
 =?utf-8?B?NDJHeHAvV3gxdXMzc3haWnBVOTFleFlQbXFRWUZ2RThROVg1dTI3b0FTREFX?=
 =?utf-8?B?aHdodW9UN3VtUUVhWVQrOGNJTjdPQWpnd2IvVEZWWHQvVWVoWjZtMFkrZ2pE?=
 =?utf-8?B?dThSV2kwa2dZZGtobjY3RnNhelp4c3k0YTN5RTFldXRNMlBCeUhaNU9hNnRP?=
 =?utf-8?B?SE1ON1ZFMXl3L2tKL0FIb1NUNnhLa21Oanl4ODFyRU1hVzBxVmg1WGNuNDZN?=
 =?utf-8?B?My9BeTVRTzFmMkcxSk9FbFprVUR4SkZrYzByS2JxZ2VpTVAzQkNQZHl0VW5P?=
 =?utf-8?B?TGFySmd6T25GU2lxbmdnWlNkYUliRzZaU2tKL1Q3c0NpVVdxemd3MG05R1ZC?=
 =?utf-8?B?TGdyazZ4bkdrcCs2Rm9NVkNtcnFNY254NGNpbGdnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6525d2a8-6861-440c-01d1-08d8c438e0d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 09:33:04.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMfed/sa2h9hcylYKI499cnRP+lrwPbv7euS0ThvsYVL3h9drQ6cyGulkSAVOddxAZddl38wdgVigL8jQYeMtr0UFo/lo5x3nODkrvDujFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4837
X-OriginatorOrg: citrix.com

On 29/01/2021 09:15, Jan Beulich wrote:
> On 28.01.2021 17:06, Andrew Cooper wrote:
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -1054,7 +1054,7 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>>  }
>>  
>>  static int acquire_grant_table(struct domain *d, unsigned int id,
>> -                               unsigned long frame,
>> +                               unsigned int frame,
>>                                 unsigned int nr_frames,
>>                                 xen_pfn_t mfn_list[])
>>  {
> Doesn't this want carrying forward into
> gnttab_get_{shared,status}_frame() as well? Of course further
> cleanup here can also be done at a later point, but it leaves
> things in a somewhat inconsistent state. I'd like to leave it
> up to you to commit with Paul's R-b as is, or extend the
> adjustments and then also add mine.

In the series, those functions are deleted by the next patch.

What's the likelihood that you'll choose to backport this?  I can extend
it if needs be.

>
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>>  }
>>  
>>  int arch_acquire_resource(struct domain *d, unsigned int type,
>> -                          unsigned int id, unsigned long frame,
>> +                          unsigned int id, unsigned int frame,
>>                            unsigned int nr_frames, xen_pfn_t mfn_list[]);
> Same here wrt hvm_get_ioreq_server_frame().

This one isn't.  I'll adjust.

~Andrew

