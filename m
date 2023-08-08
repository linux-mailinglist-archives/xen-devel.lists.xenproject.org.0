Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5815773A5E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579843.907998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMUp-0001bR-BN; Tue, 08 Aug 2023 13:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579843.907998; Tue, 08 Aug 2023 13:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMUp-0001YU-7q; Tue, 08 Aug 2023 13:11:35 +0000
Received: by outflank-mailman (input) for mailman id 579843;
 Tue, 08 Aug 2023 13:11:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTMUn-0001YO-Og
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:11:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 176e2bfd-35ed-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:11:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9290.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 13:11:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 13:11:29 +0000
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
X-Inumbo-ID: 176e2bfd-35ed-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHn4GBhcfzXjOj3FvuSCWnJkh2A9IlPEjSv3iTPCs7G/T9MX8Rauy5IegQpmv5E2Vf9DZ/8Ra7tYVakS37ocT6O2E3zz7zYSBG//AmOWipE8jYUmd35bXwiNaT5MTiK4N4P2E2LBFc3S+3sgvh5aLf0/ngpLfbeJ4JCdwE+u4y63I+uOzz8yhh3td/TIaHpwhCaFSIAFuC5J2b3IXpo4AR0eLVX4utAFPQS2pe19hyOkxv/WheSz1+krrjZ8vAL9HJJ+ivo9fllQUZ4JYw3f1qNrukxNcqfYp20C3rdOY0XdAho01Hy4Y3pAP+9hedK4iuyo0W3N1ubavjqeF2BARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw2w4nqLCdZLnnBWhs6E0rXyEuT75m9g3M9OCtBTI3g=;
 b=HaX53deg4BE2cwjBxBDw90J0KqL0zYy7mCWgziuYiaPA6/lQYx/ulW3jMGMvBMPW3EbcqLb3Rey01sCDz2KH7RtCqHwTeifvaA+hafKej6czsU2qzLS7dGKcflPAIENgE+3LEttOBKft4KxGMOGpE4zaYnp+LR1WIz/EZfodVQq0c+PStVnvsNm+hFlR+pbXYIWqlRlquuhaliDlg6KaVRGPPsp3ioGIr/V+p6Lq4cmL8gUIlAqYxi+Jui27iXS0vYd69dz9sa818S+ohFgkpVxePeaQFRKdVAPrOztDvSac5Ic4yxswtMEMpKcYvjKbA992CSLcV5l/9g/v8sGAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw2w4nqLCdZLnnBWhs6E0rXyEuT75m9g3M9OCtBTI3g=;
 b=CS39rNaqoyv7lvHyuFzieFAXvm1yBLzFLHS35QU0mUFUuubH+OITqued5NzzdATp1SdKmbmpj8Pumb8TC6KgAvaL13c2Col01y9lS93miY6enMEcIWsl7DnXF+FQOR3E+qvSAQnYpGbfJWh5SNvpT676rxhMvckgRzQ0opM2/ZcjjisF9zVpLdLSIYMciUgh4PTYFFBs/jTPbNp4bwXYg5m3MzTAt/9MLX+ct/junl996St7A78ZpJJtM7o6GviwMuW5HZxBBo9/Hed2gCC+YU77zDEmncvZXmxupm9wzrPpNMLgL7jfG2XFG54d5+p0QdC3+kMSxwr+XIFqSoV2Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c0dd699-dc20-2cd7-bfda-d41e5d45cfbe@suse.com>
Date: Tue, 8 Aug 2023 15:11:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
 <20230808130331.27995-2-alejandro.vallejo@cloud.com>
 <efee9d93-e1d8-6606-0e97-3f63ecefc8be@suse.com>
In-Reply-To: <efee9d93-e1d8-6606-0e97-3f63ecefc8be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2c6662-fff7-404b-67a5-08db9810fa73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	axcxJVMOIBx+/aC2Q8VhEqZfF/uHoSiZGfYMVSmh0GZtCRq5LIeukNod2dF01TNrCKaYucGJsfRfn30k5/Dlzffzsqh2ZEDDhPhvBjWcWe2hD0awqlJZrZl5nXbm3mNUauhlFWlZs9BCTIm1ql3P1z5gqyIQz5GaDnT4QEDJlsB50efBMtiVdbrYpQFlRuqANUgCZwwr9gskrIHycOp/JtIrUBeGlLgnbLMBnP6AkWdV1lZxdV9cZQHrtxwr4p0RRacaZav1dGl1WMmkbNu74FkZwEDVgAJaIT1JMqYn+50+sklECcbU3sx8aBBn1g5t3nY3Q7wFUlfs5K8noPH40GwDr/xvhbF8eBrBl2E5UsMd/TUWoTmjjW1nbPlLoHKWZ3FUib/aIJWmGOr5fIPywB3qJZmiMHO+wiPD6K9dZMmU78JIMqHTqVnu4zDB2ZnDIW5UiSF/9qISUFjbKBndmylaamIVyuakYMevtmDXg3ZYfsSXsaxuyZb1qfUJLi1hqW77X3Ftk7g65pJfbeW/jREgkvcofNe2eckcs3eiKIGhTvfPeeQYlgSkPChiaZdVZTiKI1QxkoZR6G+I9SC7tWUTwh+cpLXKNmNHfCc2gKs0Hxcv5QBQxPyyaMVSMuoZUzGFgbo8BGQI52Iv+b44jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(1800799003)(186006)(31696002)(41300700001)(6486002)(38100700002)(6512007)(2616005)(83380400001)(53546011)(6506007)(26005)(316002)(54906003)(86362001)(478600001)(2906002)(4326008)(6916009)(66946007)(36756003)(66476007)(66556008)(31686004)(8936002)(8676002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTZaYThuaFFuMC9POU5hOWpDeGhVRzAzWHM4YmdZQlA3NkF4T3RmTFNyOEE2?=
 =?utf-8?B?QU5WUHhRTlRFWmkrT1hJZGhGVm9MWjJsNEJlOXRFdjlIcWxHZ2pEWUwxa0Nm?=
 =?utf-8?B?cDlvY3NONVZMSitiY2JMSm5SVzhSYlVJZG1DcmpOL1owbGtZU1VrUHJodU9O?=
 =?utf-8?B?R2RRbmdYNHpqSmxNakRYZ3NMLzlVNThVTFViSndscnA2NE91cGtKdElhSXRq?=
 =?utf-8?B?SXVzMXR1T2xlb2ZOUnVqdkpFMHlSRTROMFpOcmpabEkwQmd5bUV2WmkzK05r?=
 =?utf-8?B?dEhvVmhkT2daMFpoOVpSY2REWFp2KzRLSTFzSWhSalZXM1FXempuazFGREVS?=
 =?utf-8?B?L3BMT0RBMU12cGIvSHhWN2F0OFFqM3BGWm1EY3A2ZkNDUUFYeDB6ellFVUk2?=
 =?utf-8?B?UGRLM05zSGh5WXVHUVk5VUNxN3hXQUZ1Q2x2SnFpYnVsYVY5djhQMm1wNjRq?=
 =?utf-8?B?RHFZM2tnNUhzaGdPbGF2OVJ6RDdWYStrUUhudUVCa3dIN1ZPU2V6aEtsZVYv?=
 =?utf-8?B?aVJDQmM4TFFGalBURUxvRTh3cjI5SFBRSkhMT0JML2diUFhZeTRIeEVIWjNS?=
 =?utf-8?B?Q1I1WkQ3TFBOdU5XNzJWOTdDSjVSU3NWYURSOWVlUWk0NTYxUlpRdUYzWmpq?=
 =?utf-8?B?WkVFZHUyelJYZ2t5ei9RUzlrc240Yk5qOTRrTUJYNDI4TDJ6SDZ0VWJEbnpa?=
 =?utf-8?B?bHNCL3hYd0k1bkZSaDBQaGZ2ZGtkZm5ZREdvUm5rQjNIV3NlK3A4NWs5eTB1?=
 =?utf-8?B?Umt0cHhzY2pNb041cWRGaHZqWFY3eUVVaUtlbzBrYjZVQnh5SmlSZVR5RGFw?=
 =?utf-8?B?MzFLc3UxNm5iS0FHL05zMERFcitLdENUTnJNU3ZjNU1HQ3BXZVRncXdDZmh0?=
 =?utf-8?B?UWlUTTJ4VlRleUxQUHNTSVF3TFdGK0Fza0JRTk0rRVNLRmowaUhhTFM0azFG?=
 =?utf-8?B?SmErdlNDRjlGVWd1ZTQ0Njd2aHB1M0l6RlhmdDZuRktUZWdmV0FLZmVrcTlU?=
 =?utf-8?B?ZW5hSk5IS0hVeUJUQmNDZlYvMlZ2Zi8raHBaUkE4S0RKc0pPeTlRZHJKTVRn?=
 =?utf-8?B?eW1sMDNOT01ubVBkT3EzU1V4ckt2NWVUcVBxMDhRYkJJRnJMU0pueWNzbmZF?=
 =?utf-8?B?RElpTjFmclE2OU1PZ0RkYkRUUGU2RlNDMGpuSFcwOEF0MlBlbk1JRm0zU3pB?=
 =?utf-8?B?QlhkYkdYTVJrSDNIb0NoRHBMVFlmNEl2U29iZTF1Y0poaUxVcXpxNHFkTmlu?=
 =?utf-8?B?Q1NISzN6MjVwU2Z4ZGJNNDNyYXJkbUhkZmNRRERPU0JaeXNCdFB2VFJ6S0VB?=
 =?utf-8?B?MUlVeXB1ZU5ieTA0dHA4cTg2RHQzT1hMVWpFcU5HY3VIMmRBQUJYMUg0QTBR?=
 =?utf-8?B?THBWTjFDbHVqZHgvWit5ZXArMmFCRFdpWjF3ZXA4dGJRbDNkWExqRjhuOGlC?=
 =?utf-8?B?K2lIMW1NTUV0Y3phM1RWTUp0US9LK2xhcUVTclpPeS9PTVhNY1VseldiSW1C?=
 =?utf-8?B?NFVNK3ArMmZvY3NpL3JvVGVKZWtsNmdlZU9KTHRUeWVQT3IxN2hOVjZEdGlG?=
 =?utf-8?B?bjFIQVZ5enYwLzRsTWdUOVowdWMzNjRENjJSOStzTkxXWTFHZzlzK1oyRWNP?=
 =?utf-8?B?d1VwL2sxOUVJZm5qQTJuam54YUVUSSsrUUFualliRndJd0JkeWxEbmtWNXd5?=
 =?utf-8?B?WWl4NFFYbTlzY1BNMU1vMStvMUVTM0lpV3d5bndmZ2NVQ1FhdVE2elcwK2pn?=
 =?utf-8?B?L2NVM3QvUlBFU0c4VGppdHpvWDdPQUN3RGhqdzFuL1BPcndoYlhLSnZKY3Fr?=
 =?utf-8?B?RWlwM0JXUFR3M1pCbU9xRDBEUGlNYVhDSThZMHQxVmpQWXNnQ0FPNG9sajl3?=
 =?utf-8?B?NnhuVGptSmVFVTA4cmZLTk1vTHV6bFQxL0JmQlBFUThPMEVKbUw2d204NThw?=
 =?utf-8?B?eTA0aGR2NmNWbU54WEVIa1hKdFlHMDY3UmhHRGJod2E4RVFzQXpubkxsaVRh?=
 =?utf-8?B?a25GcWlOVEkvTFJ1S2Z5dHArY0ZYaDl3a3pXb29lanNPMHJrb1cwVHkrOXBq?=
 =?utf-8?B?Z3BuRGVaVUJ6VVVXQkx2Mzd4aWx1SVVoZWxVSlZLcy9tMVRyMzE5Q2ZGOWpV?=
 =?utf-8?Q?F1O1eNfQ6HiY7lwPoY8B/ilPs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2c6662-fff7-404b-67a5-08db9810fa73
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 13:11:29.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiXJ2KHU0Y3GocbKEz7GFhkHCwI0yi1yzLN/CxxCxJywAtkLkPQcVE2uTshU/pR686JHKwUQWasAq3c89IjgJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9290

On 08.08.2023 15:08, Jan Beulich wrote:
> On 08.08.2023 15:03, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
>>          return -ENODEV;
>>      }
>>  
>> -    microcode_grab_module(module_map, mbi);
>> -
>>      ucode_ops.collect_cpu_info();
>>  
>> +    /*
>> +     * Some hypervisors deliberately report a microcode revision of -1 to
>> +     * mean that they will not accept microcode updates. We take the hint
>> +     * and ignore the microcode interface in that case.
>> +     */
>> +    if ( this_cpu(cpu_sig).rev == ~0 )
>> +    {
>> +        printk(XENLOG_WARNING "Microcode loading disabled due to: %s",
>> +                              "rev = ~0");
> 
> Sadly there now looks to be a newline missing. Easy to add while committing,
> I suppose, and with it added (back)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Actually, the 2nd string also is indented too deeply; unindenting will
in particular help with line length in the 3rd patch (which isn't to say
that the line's getting too long there, but it also doesn't need to grow
as long as it does).

Jan

