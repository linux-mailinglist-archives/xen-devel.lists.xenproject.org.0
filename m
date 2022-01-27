Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4B49E255
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261437.452667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3qP-0007Uy-MR; Thu, 27 Jan 2022 12:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261437.452667; Thu, 27 Jan 2022 12:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD3qP-0007S4-IZ; Thu, 27 Jan 2022 12:25:41 +0000
Received: by outflank-mailman (input) for mailman id 261437;
 Thu, 27 Jan 2022 12:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD3qO-0007Ry-0g
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:25:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c0ea3cc-7f6c-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 13:25:38 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-0yvwEGqyPsuXVCsp6Xj3aw-1; Thu, 27 Jan 2022 13:25:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4369.eurprd04.prod.outlook.com (2603:10a6:208:6f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 12:25:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 12:25:35 +0000
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
X-Inumbo-ID: 3c0ea3cc-7f6c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643286338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DbcpEA0scycMrCPtp2utFKAS4NxXqQt9jVqs8C0Fg4M=;
	b=OFyRWzaxJVSN3rOnb0Zqdh5VbzQQfGB7foCwZPUFmIFxlyRkSs6EBDLWAGAmzsjTdOQPYW
	blslDhq/k2Mc2+D7pDFeXmXIlON+zre9r5tfwRZSju1GxjZoOoetVYUqC96voqxeWj426z
	qnou4kA6UnvwWRQHG6RGGKAnBKyyM6A=
X-MC-Unique: 0yvwEGqyPsuXVCsp6Xj3aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BV6g/jPUY3c+ghbVAiqDMI2DMDPqCzYnU0udH6I4iUDyDtffKeMwQwbhzAEMoLCX9t6SLyDAv59YpH+3OV11JJA4rjpFCip6BTw6axMSHPnmqze0NkmCytw7G7k6IyzfYukBpR+HKUUsf9yjTq5QeKhVPaSTCcTiAU2TcXA2ZkKP6mJZoH6yYLuoS/TF4tjfxUOb3FoRs18Gy1G6VLCh4K/rK7EIKV8bREEfDQ9d8Z/mrwGaBEuoxQonP2tIq9Z/NxX3t4mF91l23aSiyvL/g4iv2s1dJAMjjhVFLCh+E2EWJj5hcjnyEF4Y1FL2Fiowhu6aV9pg9P/41TSY58TEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbcpEA0scycMrCPtp2utFKAS4NxXqQt9jVqs8C0Fg4M=;
 b=ebt/Rzzc7P28lUqfddU/24qWtH3I3ss7aclD6DdyOtEGIQ9RFi6U57IYXajpOYdZS2pjRDVteUnnrgFncb4P4q+G3oRFJH2nSfFBv80KB+Kw73oJ14YRCr4HUbgxBef9rZ0m2R1VdM/V/pQyM8I1igvCvnUtYuZtP1rMQ6VVZPGqZrTexs/5bSD/DC12I4MJww8COhGQuorsm9/wjy+DPgPn8Kszkl9lKbbqtK/4YL/YuRGyFupZxiEn+bcsk/XhFG8b/kajlyF4efewkCtyWrrjlX2IHedGHHRJMlmX8ddAGfGx+UkIoUuDHKP6VdmaVxN96ymT6GEOrKMH8+8yjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2860d074-ecfb-273a-88c7-391e3297ccba@suse.com>
Date: Thu, 27 Jan 2022 13:25:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] EFI: always map EfiRuntimeServices{Code,Data}
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <89d182f6-95e8-674a-2297-6e98435385f8@suse.com>
 <f5e38653-aa2a-c843-39c8-f8c69fc9fbde@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f5e38653-aa2a-c843-39c8-f8c69fc9fbde@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0015.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda0a45a-b903-4c3f-7305-08d9e1901e6f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4369:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4369E0BC80278153D5B9036AB3219@AM0PR04MB4369.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	chYmTwvRQoJ24JI4kF9pw3/6cFJwhjVvvTlOUHivUE0MA0I13UbIFwKiTnvsLigOZYb8W432XIBmuh3vs27TG9OJOutI0tRN71xCYzaije3UulYHgRO4dLy+hiwzLaQAlhhVorYXVqaLeq4RpughfRZyVOY69vjNIoppc1Rja3NUnqsN6dl4UtKKey1UdrWj2kp67kjARYThiNDtC5g7Na39jez57rieNZKpLtgytm64kmBnXSzTPv1iFTQJTeixcizL7iNTZo7spk3+XUWycMBYqpfso+U0Ps6nwCBZRXKOTgzhfUbrm2L3L61xJ2oU+W9AIEBWATLeDw0hldqWuw+pBIuJ3+TMzDRI3/9oOq1GqjYZbmpYdxV5qUQ3mhdwS7SQiYCr51N3P8Oku+sMxmXuW5tEvCNA1A/3yPjJqmFHn9CLiuAatoGmnusd1S7pQ93VgSD+iaEGbPG+8dmLjSlDYOaGTrJFCg/TmRdmGGwDCFvtUMr8zR+naWW2B/lpno7XnuJ+jYQAdPdOJro0I/MCtOCm0roOHG6YkVb69xXlg1dhEFYb+UgdKlpAOV2TspbOD3ZtxOH1aJwrniKeInbsErNZAHb/fHPjVYe1hUwXZs1Y2y/bY9DkNd6dfru7dCgRaQ23JGCzkd7l8EYPRIFGJjZO0Yj9q2WCosQ7xBVYxKDGppp+CSDSDmXAVDB8ypvd43riow5bZvCmw6I8uy885fK5LrHkbb2iv7I7dIBT72Nms161pqaSfOekHgIE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(316002)(6916009)(508600001)(31696002)(54906003)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(86362001)(2616005)(8676002)(8936002)(36756003)(38100700002)(5660300002)(31686004)(2906002)(66476007)(66556008)(66946007)(4326008)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJxcW5mU1lkVXBvTmZQalpTWEg4SEZUUEU4ODZOb25WdERkWUtFTWVFUlBC?=
 =?utf-8?B?cXlqNkVqU3d0dWVKd000Y1JTb3VLc1djNGZTVnZLSkx5MGFVU3R2MHp5TE8r?=
 =?utf-8?B?V1p4SURrV3Q3UW80OXhDNU9KUjIxdVkrVjVodCtRbk5GMThGK2czSHdjMGMx?=
 =?utf-8?B?VEtpNDJmNUp6UzRUK0ZXYWJEK2tzZWJpazVLaGx6cWhhTDRjNC9TYmJsR3dQ?=
 =?utf-8?B?WUI1RHV2WVJKUG5iUXNJeFV5UE1OVE9GeFRZSDk3a2FnQzNxYkpHcWdTcXE4?=
 =?utf-8?B?Q1JjTitDaXNsdm56TEJnQUFzeUZzU2gzZ0t6dUFCeUUzQXVUck0zZnRCYU5N?=
 =?utf-8?B?T0NFWnFOV0ozK1RxZ25ua3ZpV3lPWEVlMlNGS3FwVitnL2NIRW4xVkU4RzVP?=
 =?utf-8?B?Z1RyeG9PVXZ2dEJpakFFQm8wbXpOeTNWS08wWDRNZ0xKYmNlbGZKT0ZiYk5J?=
 =?utf-8?B?UitQb3JUMVFIbTJ3TGYxM09FZEFONFRQUkxpaWZBSnhaWm1CU2tFR0RjQlFB?=
 =?utf-8?B?YnZWSW01SFNVNmlaVjc0ZEtIVThyNHVEY0N4T1RudDNUcG52enkzTHJ2aURS?=
 =?utf-8?B?ZFlpYXpzM2trb2t5V1ppbXJjY3ltbWRoajlpR3lQVWM1REUxWmlyK1E5S3FN?=
 =?utf-8?B?eDA5bHF1VjJhYU9MeWl3cCtkalRmdC93a3FrUFBCQmEvaHlDMHRWbEJBY2tl?=
 =?utf-8?B?dzloaFNuRys4RVRqTHJGTmNpUU5VRzNaVGdCZ0xNQzR2L2xHOG94QWVsQTY3?=
 =?utf-8?B?YWxQZnNCNHJpenhleWVCVmtwNXFvc3RkZXlmaUEwMzhzbTRyTGZuK1JZSU5D?=
 =?utf-8?B?VFJLSTZKTUQxTEwwcTQrUlI4dERvUElnU2pXdjZpUWFCWFZZRVlvODFvVERx?=
 =?utf-8?B?MnVhT29pSmNDYXBXcUV1SGh4Y0lRV21WS29sRXBLSHNMUEl4U0JBNnNxaE9a?=
 =?utf-8?B?cFVsN1FXRnduQUdnaEhWVWxTdkRZbXV4YU9ubVhKMklhaDRuUEVWZlVZZysr?=
 =?utf-8?B?ZnkrZUg0Y0ZZRGJMd2VlZ2l1dEFKYkgrQWIyREZjUXoxUkNNRXdZTWhjRG9p?=
 =?utf-8?B?S2I1V1JrUExEaDd2NnQrMzhLcDY0REZ1OEk1MThETGliNWpiOUhkZW4vU0lI?=
 =?utf-8?B?QzNId3VTamcrc3VIS1FmejE4cHROaGdOaVczb0JvRkZKeDNPTW1LcjFlOXF0?=
 =?utf-8?B?RDE4bjhYYWlBSFhHdEhmN29aQWxqN01uWHJ4RDFTOU5yNlc2YnZyc00zc3Bs?=
 =?utf-8?B?cWthRitiV3k1MDRoaUNWY1J1K2E2K3cxaENPc3VMMUZSZmovUnJTamlDQjA4?=
 =?utf-8?B?ZFBEbGF4SHp5dExVYVZBSWl5Q2hsQ01sM1paQ2hxQTdSNmVuWUM3cy9oQXdS?=
 =?utf-8?B?Y01ReVIyeWpoZDhsazU3NmtaOHlVMTRLRzhzNGdaUFpmc3MyTktNK21YazFu?=
 =?utf-8?B?YjhDUUFOREZIQXZOMjgwSjgxd0EvTytvUWZ6bmtlRG1rNk5CbThuSEZWUXA2?=
 =?utf-8?B?L0NZK25sZDhEV09wWjlFckJaZnJ5eDY5U0MwNW9TUjBLMzhWdEFONGJkVEUr?=
 =?utf-8?B?S214YVpBNW1IeThROE16d0lmV0xmM1FpN1hZNGR5WUg1SnJhVjU4c0FEV3Ns?=
 =?utf-8?B?RWp2Y29lcTM5MUVjcURSQy9QNUF0dkJFMWRMMjk1cExSUUlzRXF5bHZqLzVt?=
 =?utf-8?B?Lys2dEFRVjljRlJzd2c0VzV2TFd1ZWhyR25WU1QrYklibWtCeFZkR21lenV3?=
 =?utf-8?B?VGMzYzhEQWN6dlltYlR2dmFJYVRlN1ZrcmFpeEZqREgwV0hlNnU1bjBjVEZ2?=
 =?utf-8?B?QlBOUWFERDU4cFF1YklQZWZ1NlVMUWZKenFZajNBenRJOG80WjlMeGx5NTBU?=
 =?utf-8?B?eEk3L3U0bjR4SlFyTkl3YlNXNms3RmUwU2NqMmNrdXI0cysvUkwrd0hWYzFy?=
 =?utf-8?B?S0JUR0pKZ2RVTjBlTmNydi9oTnAyZTVhMS9RMm8vaDBicldqMFJsZnV1Sk00?=
 =?utf-8?B?VXUwZHZkUFg3SGdEQXJ3UkRGcEtzWGdkRXhsQ25lM2ExK3ZnNk1BU1BtTkhR?=
 =?utf-8?B?Q0pTUTN4YkpBZStIbmdHQjM3U0dtRm9IRFVOMVJ2dlhKNm4rTmFRcmRpT3B3?=
 =?utf-8?B?MjJwVmJBUkUya3ZPUzJYUXViVGVyT2FUbW1ZV05JSUsvVVZoaVMybFUzczg0?=
 =?utf-8?Q?cE9kaLwHECwEtXQApf3qG3k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda0a45a-b903-4c3f-7305-08d9e1901e6f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 12:25:35.3046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kQQIeE87M0FojPhvq0JVNkIc9VMTPBZYo3Odv004Ejgql5loB4kiTiqvPktXvHhnUBnh7nUs2rSm/nJePDhNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4369

On 27.01.2022 11:45, Julien Grall wrote:
> On 12/01/2022 08:45, Jan Beulich wrote:
>> From: Sergey Temerkhanov <s.temerkhanov@gmail.com>
>>
>> This helps overcome problems observed with some UEFI implementations
> 
> Would it be possible to provide some details about the platform? This is 
> helpful to track why a workaround is present.

I cannot provide any details. I took over the patch after pinging
Sergey more than once, without any reaction. It was him to actually
run into the problem in the wild.

>> which don't set the Attributes field in memery descriptors properly.
> 
> typo: s/memery/memory/
> 
>>
>> Signed-off-by: Sergey Temerkhanov <s.temerkhanov@gmail.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v4: Drop EFI_MEMORY_CACHEABILITY_MASK. Fold with pre-existing if() (into
>>      switch()). Style.
>> ---
>> I guess "map_bs" would also want honoring in efi_exit_boot(), but that's
>> yet another patch then I suppose.
> 
> IIUC, we would need to invalidate the mapping when map_bs was used. Is 
> it correct? If so, then I agree this sounds separate to the issue you 
> are describing here.

No, the other way around: We'd also need to put in a valid virtual
address there for EfiBootServices{Code,Data}. I expect this wasn't
done when map_bs was introduced because iirc at that time the code
fragment in efi_exit_boot() was entirely dead, present merely for
documentation purposes.

>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1094,7 +1094,13 @@ static void __init efi_exit_boot(EFI_HAN
>>       {
>>           EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>>   
>> -        if ( desc->Attribute & EFI_MEMORY_RUNTIME )
>> +        /*
>> +         * Runtime services regions are always mapped here.
>> +         * Attributes may be adjusted in efi_init_memory().
>> +         */
>> +        if ( (desc->Attribute & EFI_MEMORY_RUNTIME) ||
>> +             desc->Type == EfiRuntimeServicesCode ||
>> +             desc->Type == EfiRuntimeServicesData )
> 
> My knowledge with the stub is limited. Would you be able to explain why 
> we need to map the runtime services even with !efi_enabled(EFI_RS)?

In principle we wouldn't need to, but the final setting of this bit
isn't known yet at this point - it'll be known only after parsing
the command line (see parse_efi_param()).

Jan


