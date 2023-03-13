Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0296B6FCA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 08:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509125.784347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcBE-00026z-5U; Mon, 13 Mar 2023 07:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509125.784347; Mon, 13 Mar 2023 07:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbcBE-00024W-2g; Mon, 13 Mar 2023 07:01:12 +0000
Received: by outflank-mailman (input) for mailman id 509125;
 Mon, 13 Mar 2023 07:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbcBC-00024O-Ia
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 07:01:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d26df573-c16c-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 08:01:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8424.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:01:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:01:03 +0000
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
X-Inumbo-ID: d26df573-c16c-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHCLjwjMFMVUpTXduJ2aQloIJgPeBsp3nEK/0HC3K74QZJ3XVgEzH+e+xxlll74Ehp3mIziPJOeOaBOIN/vMqN1prD6ampKRQHLOp/lxZgBlIHTZE7ZL6H1pUhfRihzoZ6LJVFDVi9IGKlT30Z330KFmbxDIEcbYESoqOvzhn5UiC4hWv5xrsAwSM0Epgt3dB1B2dhZpyGGVjVuTPagThmU6pfxG6TpEWDJTyAtT9WN4FxJLYoweyykA7/TjjSPQeYqUMFZtNcDPaAADF51nGfcNLmu7YuxmEnQiokMRQmbF7btaQAE2gkgof/Ectc7Weghw5xHmFxlTQgELuvyPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHTcw7j1Ey5u16lsm0xWZVZJWhEJmigEd50icuoptP4=;
 b=cmw7CgYsXlRkMNGIC8Dn2VFXt1qEIPSs73o3wqDVjKlZ731pGokJpSyU6joCZ1NMp+x1x3MWFWAUky/rjb0jpU4LblJbgxI2vKSI4R+HgV3y0itTO/uYSxJszYWGnc+L0xaHC0/tnDg+REV1ooydl2riThb+J0ilIMuaNS3sOdXBJD+MDIo9yb0IPnHrkngeIHTstMpP5pDpI/vOpVRpigT03xPkosYSc+6oLa8c1fiS8vOLV0om2ViFy1zM3JmyEvPX8QwWtu0n7RMOodq5Ol6zEG+uhxLmKWlBlg1TnTQOx4C64ffTNXUWC5SWChh520yXATRcIqlcmCkDoD1ukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHTcw7j1Ey5u16lsm0xWZVZJWhEJmigEd50icuoptP4=;
 b=Fq6ysixMMZwUN4odB1NP2DZIgYR/NmY6CrrWlf9T1rDV+Sj/WRzOwq0bdIMEZBUjoDdlevn539J4Xz4kKcN9zeShZI80jYoaKhL/TXnbGr7+N0tEvN3Chdua1j8Khl1hxNyRBfFEhzQtlb2O6MPQGS/DMFpFx/ZmDEqqtAMbgFL/+JBhyEuKQ0xLwmt4xyokQ7UYZJMDGdqLOjwRIEyi9vBVea/iCQQe1+9PLKc/QSQXp6h1rqNrACRTrTBI8sPPf7RQmD0rTTHBcYyK9MBtEtFOQ14U7+4RIJcPl/hgH6Lr2MCl6gNJf3INs5ttISXwRVbBrMGzmdblm8Cpgfj56g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
Date: Mon, 13 Mar 2023 08:01:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZAvGvokloPf+ltr9@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 09718859-32b7-41e5-9513-08db2390b598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	muZb1/oRuWMVOHTsCLgVeUgcyGbwFcYYA/Hc/7Osp8ZfOji6vhLOUdIm/7H6ffZ6zdEUPdMdRYobcgG/92mblNyvuTYwJN+ZkFsUnBGbMjwTr6aQaQm2waAaCs92vsbkNHMaUG65c413fqdutHbZ9MTNCnkvWoMBWmZoqmg02H0/tYFIMuJugNUljL8X03r1px3n91JXNF8+RZGvoZNxfPWgMpta4YYwH8R64xSIPwgGFW3wE9Bsy9Xyx7FkoXN7Anc8qVUNziyI8hJICsk/0u8QXFeIk5UmrOUfDs3IzIgsPda1mHF6cdxSPxocVUHHcQSMfmeY9ApTyxTJ2qZ+Nvj34DW6SOzCKFetgCwobaCacSqwa6QA5KGh2C/lsFedUd085e8iVrzwpAu5sxqD3M+1LvWYQvzcHx7FHirtOkBuEPel6XvSTk10Zekvak5yXsF+U8I7w79AbPucrn2S2rUJACv4uRYNVFFBrrqTo6D0ge+mCE3mhhn5tYnZJBOQSOrhCKKDZjiPkBv4kVjxo3j//i/Qb6CB+ltrHHkGkb8kcYdPDrqumpRyt32Gye2ZYiogSrAWaHtkXy7shRRrtEKCUuJ66zil++3zrsAEVxZtUU31Of69K9Th6HM9MKOva6zwVdS2rmFsynC7AKOxnHR0dH7pgGQFpz0az4CXAjuXtE6EBCDGHVyd+i/ldm7EsLRC2w73EkXZHyLeUpennAfNcWZxkCuZwrfcGbYiuhA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199018)(31686004)(5660300002)(2906002)(31696002)(36756003)(86362001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(41300700001)(478600001)(316002)(6486002)(8936002)(66556008)(8676002)(4326008)(83380400001)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkY4MWRCOFUyUmdPeEZsYTNwN2lmRHV5RWhZNnZUTExkRTUwSkIvSEE2SlZX?=
 =?utf-8?B?NHl1d2R2NUovNDFMZzdtTjZ5K000THJzS3NwZUtMbnA0MGRIdFFjbEwxb2hu?=
 =?utf-8?B?Q1NFZ3dkTEVHY0pQQ0NxTUZzSjQ1djNPMlJXelF0d2dsUFdKNHlRSG5MOGRL?=
 =?utf-8?B?c2VCdHNOOG95RVdqb3NiYVY5MVVvOW5xZnBqWlA1UzA3ZnRkU3o2UVFXeElm?=
 =?utf-8?B?S3FHRDFuNFRwNkQrb1IzT0ZVMWphclRDV1pVWk9zeGw4Y1RVYVR3d0Rsc3dm?=
 =?utf-8?B?a0d0VWRhbEdrazZUb3JqZHc0R0xHanZpY0dTMSt3OENaTjhsN2JnWDNRYzU5?=
 =?utf-8?B?WnlBVUlacnNWbXhsY1lsL3NmalBzcXg2ajBtVE9ETVBFTUhBOVErWlJxc050?=
 =?utf-8?B?cWxEcURKUjIzY0FhcmdUMjgzYUxFYm55bGFCRkltK2Z2WmVDem5zRForUC9S?=
 =?utf-8?B?QndLbHh3WDF4NGpUQW1QWHIxenNXWlpYUUlJM2hWWEZBTExMNnBjbDF2ZDBp?=
 =?utf-8?B?aHQvSVNhWXRRRWZSN3NMVThtMTdVUFFzbnhKTWZLVVdkV2gzKzNqYUwvZzVS?=
 =?utf-8?B?Q1ZjVHJNa2hJY0ZBRk1LSGtORkJQNXZCR21kR2traWx2WUFTL0d5UmtzYlMr?=
 =?utf-8?B?dlZuWENvQklYaUpRaG1oQURKT0pOeDBReGpyMEZWN2dsL0ZscnFvaGN6TUEr?=
 =?utf-8?B?b3pVN3ZleVZocDVYL3ZGM21XVklYNDRxRkRoTnRZK0dENE0zQ2V4ajdxZzJX?=
 =?utf-8?B?dzZEdVQ5MVJ4OFBVdHZaalk5WEJ3bmYrWm1tdmhhYm94S1ZtWklzaTlpMXhW?=
 =?utf-8?B?S0EyaW5KRnJIaXIwTU1zUVQrd2R1WHA5REppb2QrSTFsUjJmVU5CQ3J3S21B?=
 =?utf-8?B?WWxwaUxQNFhncXNJemcwYkw3ZlZVWmx5Z3ZwVW1NL2pVcGg3SlRhc3JzYkJn?=
 =?utf-8?B?dnBDd3UxbncwK0t2RmxxWkVXc3ZBaVZOMmFSZGl2SnBFeXo5cXdZblREMzVr?=
 =?utf-8?B?TkZQbG9yRWJTUG1URXcwa3lEcCtmSVVRWGdySXpMVStBY1hHRlhyQmFiSmJ3?=
 =?utf-8?B?ZlVUQVdVQm9QVmIwRzRJVmljc1lOMTc3ZERPUGNoMjVHR1BSSnBRcWRhQko1?=
 =?utf-8?B?cTluQkhqM2s2N3h0NStudnh3ajdlWFFBanVSMFZEdmEwbE5KYk0yTGJJNXRR?=
 =?utf-8?B?WU5VU2YvYldDcHNpd1NlMFVrMXEzRDhuMUNWNnFmbG1EaGVFTVR0RUcvd0ZE?=
 =?utf-8?B?eG1OTnpuR2F3S1JnS3hXU1VZNEhrd3R6OGNSdktZbHRDWVdkdytFMUZXbkg0?=
 =?utf-8?B?UVVNa1pHU2tBR29VNndYSWRBMEpqYitmcHNrSkNvNCtTaFN1L2YwRjVNSTRz?=
 =?utf-8?B?OFBqUk5Pa0FmWDhnWmxoSjQrUnMwSXVKbHV1cVVBUE9adXdZdEVSWUo5VE12?=
 =?utf-8?B?Y21YSFZpSGxhSDlkdUdxc2hUbkRHYTM1QlphdzRHcnF2ZVhtTFE1RjRML1Ur?=
 =?utf-8?B?TVh4SGp1K0VXamQxM29sV2JtWTFiSFl4bkVHMkRJVldpdmkrYVgraU1FaUto?=
 =?utf-8?B?bEtickRJcGlqWjdBQjRlZFJuUFhJVGY4dGNnUjd4Y2ZiMi9IYUhjNEFITTQv?=
 =?utf-8?B?OHk0SnhoT2dzSU1QOEwwelh5M2VtYWs4empBRlhpN0ZhTE9YK214c2JOdjZM?=
 =?utf-8?B?Yk95ajNyY3RvL0ZhTkt6cWZ3QWZpVTNDdmFYTG1FK2hGbHBCUTh0L2RqSlJx?=
 =?utf-8?B?YWVIKyt3MGFZUW9INXlUdDRmWk1MNmNaL2E5KzRrYWdmY3lsMzgrMWEwT0oz?=
 =?utf-8?B?QWJQbFAxazhnU3V3MWhEVEg1VHUwNFQ0T0FPUThXUFRRT1RyRDZwMHpPd0RS?=
 =?utf-8?B?MnZnLzF6OWtaT1pwcnExRlM5R04rTEN4OEJkVjNhUWJoTjMxOXg5RXZOL3Vs?=
 =?utf-8?B?eDhRSXVzVFFaTEhtOVlSMUJXUHZyMkRubmxrbXRFc1RhVzg5ME1rdlNsTWVN?=
 =?utf-8?B?NzNsQk1OT2JWR2FwQnc0MElMZFpoamlTdGNRZDNWN05tMThIZG1ia3k2Skt2?=
 =?utf-8?B?VXR4dzl2aHlHUTd2Q3FWbTEvdHlVdHBqeXF3Q1RNUFYwUjFicVJjNVlYVC9P?=
 =?utf-8?Q?r+VHmyvfJY7Tw6X+BJGcTZWiP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09718859-32b7-41e5-9513-08db2390b598
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:01:03.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guM29f8tveXvhg5Kot6nn8thzbKAB+bpi9xwnzD8gkAILIvfY6lgHvBlyJNQbFLnXPRtsTYN6W3E512K+fu8GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8424

On 11.03.2023 01:09, Elliott Mitchell wrote:
> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>
>> In any event you will want to collect a serial log at maximum verbosity.
>> It would also be of interest to know whether turning off the IOMMU avoids
>> the issue as well (on the assumption that your system has less than 255
>> CPUs).
> 
> I think I might have figured out the situation in a different fashion.
> 
> I was taking a look at the BIOS manual for this motherboard and noticed
> a mention of a "Local APIC Mode" setting.  Four values are listed
> "Compatibility", "xAPIC", "x2APIC", and "Auto".
> 
> That is the sort of setting I likely left at "Auto" and that may well
> result in x2 functionality being disabled.  Perhaps the x2APIC
> functionality on AMD is detecting whether the hardware is present, and
> failing to test whether it has been enabled?  (could be useful to output
> a message suggesting enabling the hardware feature)

Can we please move to a little more technical terms here? What is "present"
and "enabled" in your view? I don't suppose you mean the CPUID bit (which
we check) and the x2APIC-mode-enable one (which we drive as needed). It's
also left unclear what the four modes of BIOS operation evaluate to. Even
if we knew that, overriding e.g. "Compatibility" (which likely means some
form of "disabled" / "hidden") isn't normally an appropriate thing to do.
In "Auto" mode Xen likely should work - the only way I could interpret the
the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
speculation on my part ...

Jan

