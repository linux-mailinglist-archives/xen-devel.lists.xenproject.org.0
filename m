Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753E3F161A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 11:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168468.307591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeII-0008SY-G1; Thu, 19 Aug 2021 09:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168468.307591; Thu, 19 Aug 2021 09:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGeII-0008QV-Cj; Thu, 19 Aug 2021 09:25:02 +0000
Received: by outflank-mailman (input) for mailman id 168468;
 Thu, 19 Aug 2021 09:25:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGeIH-0008QP-PA
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 09:25:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76d33643-1fad-4bdb-b02e-ff23e44975e2;
 Thu, 19 Aug 2021 09:25:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-TbiRQefHP4uUiqlyRuom-w-3; Thu, 19 Aug 2021 11:24:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5598.eurprd04.prod.outlook.com (2603:10a6:803:e9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 09:24:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 09:24:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 09:24:54 +0000
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
X-Inumbo-ID: 76d33643-1fad-4bdb-b02e-ff23e44975e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629365099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7BY5mujK6oakJzuPINu+TouyQhijSBqCM4VO16n3lzw=;
	b=c/A5AvuFGCRo9w8Uu9aYPUW2xIpfbOCH+usYR7bfMa/+nh3NAFOhbOLBJBzxfRoqUvR8c0
	w8eHIVebTsn6EdOy3im4VVz9yzPeD0kNqOkjgY2VpG0KH61b8lFyP0JYHoDpkK6oJrb2Rt
	735AUpz5SXWI7dsXA9tBzeBE90eDDC4=
X-MC-Unique: TbiRQefHP4uUiqlyRuom-w-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekcBmccnX9ebjSbxpZOwhR9XSRi26Z0YZQb88eTIC/LhlRwiOCy+HsjBClQ8RYxWfIl9IPynp90vqfemzznGUYfrRRRzP7llgihvbee1HeEYzLEr8F9jZYcyPeRg+s0rNOWZqzot1YhcaXT8Y4BZq8SWQGFGov9bmMcH9R60WsZs62L8TNUixvp/LHUnpw99cB+j3Oat+ZGcOVBlcO8VmIpPEfc0bieTJFj0eDMxaW2VIa1WL9AsILfI4sJoatMyU0O9GGKWe3TP0cm2X9TAt0VxjByPo5c+86suRqacDgorlXNR6Q3WDHthyXNE6TSZDAcfd82DpF+bUIOUWTb8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BY5mujK6oakJzuPINu+TouyQhijSBqCM4VO16n3lzw=;
 b=ImIRu+3skoAl+N4HZC5fo/5Z2ymcH9bWllY0Z2ob8dcMJT8ZoCMDo6KukJSskR+O+Uuis50aOJqR4r48TmROpw+DRf31zkZ4BIJyzd7RB9nxsWZ3Iqblzl6masAxp6H9lQTR1nMUQpwdoYv4FsVWMQhYaY6+kjJjCwT8PDo2F+Hfnauj9KuDCPVbOcSRsyUBmSE03AMga6qIhPsOM6EuqPWiHrSdCdFGVPJOFPqkTjnV8DgOHkllY6HlxKkEX87vwskzNZ/qasLX+HEuQJfcHxFBjeGuwTWqZgy6nghNOgmNBjwMiaTUujHwplYZ2V2DIpKAxcESmUd2rE+SPK3XWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 02/13] libxc: split xc_logdirty_control() from
 xc_shadow_control()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <4b68233b-259c-3308-3292-82e991e1e108@suse.com>
 <7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eba44638-699e-36e4-afd5-5b78270baafa@suse.com>
Date: Thu, 19 Aug 2021 11:24:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7284e7d0-99cc-e35d-2d44-46e7a3132498@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97b26f81-025c-406c-b426-08d962f33478
X-MS-TrafficTypeDiagnostic: VI1PR04MB5598:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55985D3B231DE3D6BA4FDA65B3C09@VI1PR04MB5598.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bcBsEqokhJYEXG88rSOrTLhBEU/2uEMLk+zVq4gc3Xek5qGbInuaSUGtZ4jXJ3N+td2DlAJhnZ1p4ME2bKhmxxE+b5J5wshswkc4k9F9Bye0+lLn7Y45l60wPxY8TaVW3f1LgwXRyZ3ebN/FoLqD32g7b/M/lq7DRsbaJ2gYOZXUFF+lvIZ6JmC6QUAVuGb6U4XdSoF4Smz+9KPp53E8giu0/Guif1L2YmE5uX4taEt2YaI2qI+MtglUsc5kF6L0G8seUE2UWimXK8ljYYeam6M571IMHywPnRHewAEOHZliwUcAIwoQBmsaUEmwwf8TIDr5cL5RbLRw2j55CFPdtFmcF/1FgsF56O4YW59V1B+DsbXzR+EK06/AaIEivFkMTAW2Kbm8Yq7pKhc1WJW6ieUl7/s6UZVxZyhM4L+ElhepmOQn+1Y9LTKAtngMihGr0kLrBDtU/YWpKnw8QZhW2aiREek04U/wVCO1+JSeWiycGyOWEn45ZTj6wX/3nBJLDKx8rDleIT8B6wipdWWb6fnE9v01rDh6aTGg05L9XVJX91DiwG+DRZU55HerLvAdMTImzmd+eSN663/E4nNTfcvzNSR2oS5SSzQ+kUDeB1rnEfHkr07Xf2SD1gvcUS52nJYKzT1+MFCR5/JIG0azY2OW1BD9vRXB32yNGOXmKSAxzZeUIhYBVb92FR7uJzwq0YIRuO62Rw7CFEdu7JKuEcZGH4uplmZyrJMAYdzvMZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(136003)(376002)(346002)(39850400004)(2616005)(8676002)(2906002)(66476007)(31696002)(83380400001)(6636002)(956004)(38100700002)(8936002)(86362001)(478600001)(31686004)(36756003)(6862004)(4326008)(5660300002)(66946007)(6486002)(26005)(186003)(54906003)(16576012)(37006003)(316002)(53546011)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0xQckRVbGtZYUEraCtrWTZNZ1FkQWRwcjZRKy9vK1hvRjBsUmtPNXZ6ZWlx?=
 =?utf-8?B?QzJSeS9uS3U4d1ZrL1A0cWZjbUJ4ZGlJRjMrNEtScm40TTA3K1RXSnhHd25n?=
 =?utf-8?B?bG1hempTSDZpMUI1STUwTmYxSWpWSFc0TFA3WVdqVnpOdHp6N3BUZUZlb2tw?=
 =?utf-8?B?NEdqUWhQWnZZK25qaHcxMzlkR25MTWsydUpQL0RwT05PWjg2VVdWRkVjRHMz?=
 =?utf-8?B?TTNzYm9nWlBRbzdtdHg4NXFjU082VEdGS2VTSHpHSTBqckcrcitzaWd6SkFi?=
 =?utf-8?B?dGFibUZGMmlYMVh0ZDIzb3VDSjhHR2NXcEFWYS9kaEtYNnUrN3B6NFlGTUJY?=
 =?utf-8?B?b3Y2WDdwNGxVWUh0MTBHSEVWYnc1ME1wUE1RVm4vS2lUNGVaUkIrQThtMHYz?=
 =?utf-8?B?MDhZeHZoTnVRclorUTZITUk0a3FHak5uWVJ2RGMrLzlPYlNsNkcwSGRxQS9q?=
 =?utf-8?B?bm1TSmZ3ZWpXYjdOTVB0MkkvdDZ1cHBtdDNXc2dvOEtaUnNQeG1tdW5vSFBJ?=
 =?utf-8?B?L2N6ZytCMjl3aVNKeGdaRDRhQWVPemtoNnc2NkRwcWMxemFmYXIwS251dGdW?=
 =?utf-8?B?TCtPWHhnb2l2YjFwelFrbmkxQ3FnTWJNRUQyaEVHV09jTjRxcnJWY2NwOW5s?=
 =?utf-8?B?aDBuMnl2VUh2L1FEdHJYY1RaeWpzWGhkZThoVHhYZktmWUU1Uk83SFUvZnlv?=
 =?utf-8?B?SnpmZVcxcDIxcWtrdjlzRzBqdTViYkY0K0FwQkdld3NaQW5aNVUxWkd6YnVI?=
 =?utf-8?B?SWN2eXc1clpXMUU2YzU3cEtkUEoxTWExQXk5blJwTU9xUTZLZEZzS3Q5aHhC?=
 =?utf-8?B?Sk8yTHNZN2REeUd4bTV6RzdpNnFqMDBuejYzQjFNem9tTDI4QklMVmJKNGN1?=
 =?utf-8?B?dWtjTngzaEdqN2Yza1J3ZFRtTk9hTDFMRWRqWEw4TGkrdzdIbERiSE9heURD?=
 =?utf-8?B?c2t2M0Q0M1JLS21GUTNySjJKMkp6K0Z0TFJHeDl6cjUwYk1neEk3dEtESHVP?=
 =?utf-8?B?YjBXQ1VCd2ZFR3k5b3pIVkVXMmhGYStLNlcvalYwd1RNTWdYRHI1TkVPVkFG?=
 =?utf-8?B?VDlzU2dua0xPTCsvMVVST2VOaWRmTXdTMmIyYnZEd243Mk4wTHN3bko3ejRI?=
 =?utf-8?B?T2JWa0tJYzZjS3RpSUpidWtVVlJORUZqdWQ1ZytEU1J6ZUI0UzFyNER3OXRJ?=
 =?utf-8?B?aFlrRmZkTTY1VytpeC80N3lhaU0wQ2RJSnFxemphYU8wMlE2ZTA1dzY5SExG?=
 =?utf-8?B?ZzlxaDZDTHdZbUpuMWFvOGxjQmZwSE13TVBzVER2SUUwWkhNWGgvbkxmclRp?=
 =?utf-8?B?VlVwSDUrWS9GMVN5UlZGTkZNN2dnRnBFU2lqeVdnbEpqUlR0SE1BOEpPbmcr?=
 =?utf-8?B?ZHpweGVaWnlzTk5jL0RPY0JsUWRFY3k2OGVxcmJkL3ZMNlhLRnFucDNIRlFS?=
 =?utf-8?B?SEVxR0ZEdmF5Wld3UUhhSXM2SmNIUXFPNk5SM3hWaGVUVmhYZ2YwZFUxSGlI?=
 =?utf-8?B?QnorVXFtV3A3T0RVUUNyeXdEei9Ia3JrRUFsK04vdWxtb2xrRmxNZzM3Nmw3?=
 =?utf-8?B?eGI1VHhYT1hUbWNOVFJLVE1UNjZoZTROb0FTV3gwcHVpc0ZZS3BtdUlPZWJF?=
 =?utf-8?B?ZEZoQzBSbzZQVDV1R2ZjcmR1SElYZ3g2OG1Xb1NhQ0lqTnlCK1ZUbG5keUJN?=
 =?utf-8?B?THA4eDJUemI3S3JJQ1dHczVUdVRUWmpWd0dxYkJib2lheEhDdzFtOVBHUHdS?=
 =?utf-8?Q?5BTpxegBlf4aU1WEwdq5J/ZDchFt3ncnU9HJ6Xd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b26f81-025c-406c-b426-08d962f33478
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 09:24:54.7485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WirzJGM0m9A63uOIaXihCEDxoKfmZI1AuaswRNb/JEGrT/rvK43b96kGPo0gkRI+VbIFlEjdCCr5DTNsQaIqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5598

On 19.08.2021 11:11, Juergen Gross wrote:
> On 05.07.21 17:12, Jan Beulich wrote:
>> For log-dirty operations a 64-bit field is being truncated to become an
>> "int" return value. Seeing the large number of arguments the present
>> function takes, reduce its set of parameters to that needed for all
>> operations not involving the log-dirty bitmap, while introducing a new
>> wrapper for the log-dirty bitmap operations. This new function in turn
>> doesn't need an "mb" parameter, but has a 64-bit return type. (Using the
>> return value in favor of a pointer-type parameter is left as is, to
>> disturb callers as little as possible.)
>>
>> While altering xc_shadow_control() anyway, also adjust the types of the
>> last two of the remaining parameters.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>> ---
>> v2: Avoid new use of DECLARE_DOMCTL. Re-base over error handling fix to
>>      libxl__arch_domain_create().
>> ---
>> I wonder whether we shouldn't take the opportunity and also rename
>> xc_shadow_control() to, say, xc_paging_control(), matching the layer
>> above the HAP/shadow distinction in the hypervisor.
>>
>> --- a/tools/include/xenctrl.h
>> +++ b/tools/include/xenctrl.h
>> @@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
>>   int xc_shadow_control(xc_interface *xch,
>>                         uint32_t domid,
>>                         unsigned int sop,
>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>> -                      unsigned long pages,
>> -                      unsigned long *mb,
>> -                      uint32_t mode,
>> -                      xc_shadow_op_stats_t *stats);
>> +                      unsigned int *mb,
>> +                      unsigned int mode);
>> +long long xc_logdirty_control(xc_interface *xch,
>> +                              uint32_t domid,
>> +                              unsigned int sop,
>> +                              xc_hypercall_buffer_t *dirty_bitmap,
>> +                              unsigned long pages,
>> +                              unsigned int mode,
>> +                              xc_shadow_op_stats_t *stats);
>>   
>>   int xc_sched_credit_domain_set(xc_interface *xch,
>>                                  uint32_t domid,
>> --- a/tools/libs/ctrl/xc_domain.c
>> +++ b/tools/libs/ctrl/xc_domain.c
>> @@ -650,25 +650,49 @@ int xc_watchdog(xc_interface *xch,
>>   int xc_shadow_control(xc_interface *xch,
>>                         uint32_t domid,
>>                         unsigned int sop,
>> -                      xc_hypercall_buffer_t *dirty_bitmap,
>> -                      unsigned long pages,
>> -                      unsigned long *mb,
>> -                      uint32_t mode,
>> -                      xc_shadow_op_stats_t *stats)
>> +                      unsigned int *mb,
>> +                      unsigned int mode)
>>   {
>>       int rc;
>>       DECLARE_DOMCTL;
>> -    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
>>   
>>       memset(&domctl, 0, sizeof(domctl));
>>   
>>       domctl.cmd = XEN_DOMCTL_shadow_op;
>>       domctl.domain = domid;
>>       domctl.u.shadow_op.op     = sop;
> 
> Shouldn't you verify that sop is not one of the operations now
> handled by xc_logdirty_control()?

While I was considering to do this, I couldn't think of a forward
compatible way, and what I'd like to avoid is having the need to
update these functions when new ops get added, just to suitably
also exclude them then. Plus I thought that if someone elected
the (apparently) wrong function as suiting their need in a
particular case, why would we put policy in place making this
impossible?

>> -    domctl.u.shadow_op.pages  = pages;
>>       domctl.u.shadow_op.mb     = mb ? *mb : 0;
>>       domctl.u.shadow_op.mode   = mode;
>> -    if (dirty_bitmap != NULL)
>> +
>> +    rc = do_domctl(xch, &domctl);
>> +
>> +    if ( mb )
>> +        *mb = domctl.u.shadow_op.mb;
>> +
>> +    return rc;
>> +}
>> +
>> +long long xc_logdirty_control(xc_interface *xch,
>> +                              uint32_t domid,
>> +                              unsigned int sop,
>> +                              xc_hypercall_buffer_t *dirty_bitmap,
>> +                              unsigned long pages,
>> +                              unsigned int mode,
>> +                              xc_shadow_op_stats_t *stats)
>> +{
>> +    int rc;
>> +    struct xen_domctl domctl = {
>> +        .cmd         = XEN_DOMCTL_shadow_op,
>> +        .domain      = domid,
>> +        .u.shadow_op = {
>> +            .op    = sop,
> 
> And same here the other way round: sop should really only be one of
> XEN_DOMCTL_SHADOW_OP_CLEAN or XEN_DOMCTL_SHADOW_OP_PEEK.
> 
> With that fixed you can add my:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks, but I won't take this just yet, awaiting your (and maybe
others') view(s) on my reply above.

Jan


