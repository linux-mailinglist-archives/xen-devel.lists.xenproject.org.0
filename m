Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1791716357
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 16:13:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541197.843692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q406J-0007nw-Co; Tue, 30 May 2023 14:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541197.843692; Tue, 30 May 2023 14:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q406J-0007m0-A1; Tue, 30 May 2023 14:13:27 +0000
Received: by outflank-mailman (input) for mailman id 541197;
 Tue, 30 May 2023 14:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q406I-0007lt-5W
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 14:13:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23c8afad-fef4-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 16:13:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7011.eurprd04.prod.outlook.com (2603:10a6:208:193::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 14:13:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 14:13:21 +0000
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
X-Inumbo-ID: 23c8afad-fef4-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV+LmZKC+j3/Z05FY7YDKLCtZMoFEYhjT/Nd6OyNT+cugei4fOisvSNXRCBZTHCKhrNHqPyFZ3QhTwZ6aBFiqAqtjJ/6avcN7MtFZ6MxgnR7aBaBq+fSxd1rNOj4FTeS549RCd8F/UCH/VHUJ9We5hmnqZlKkOxPVrI4TSi4ue7StxewFmLExUdBA4D/510rafo9/d8MHvl7p9/G3j/CA3mOKimK0Sw44+HJ+D8dd2CUcP9yaKEZ+IXSvUElQSnsv6Y8Dvi6A8UJn7MQ4aEfwsoTz6QaFV6Yzf6nfibdljZccEh4Ki7kGS4OePe+hurjy8dTd3pUacYpmFeEVucynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRIiKMvf1Ub2FSk7gjbF9voZkCCyBDej9iR3/ntdWWE=;
 b=ZzboBCVsNZ8WKGKuIh8sj52f88sFjzh3dDtaQNK247FDQGmSCLtvSH9Sb+bpcfZWaIGlLdbDaMsAdPc432y/y9uavV0VuyUDyumRXYY6uKp+he61racXM2wOHt1brsNDzangJoSVsd/XHn9hZhkUzVE7Mw2gpQVAsoOLiPETvrRbndPEGhWTIex4wnKpyaspO73QjGp/wNwa4aE5Ct666oCgsQ4itV7FcOnFrprNqFJUKjdSCbmSawK522aUSBV2+hPGTyD2tfXFE4HL/+1nTjqn/gLZZGc2Iv3DWeTVL58ruvyBg64JdgnYSjLIa5N94f6hmIPK0J/b5zlKnHPwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRIiKMvf1Ub2FSk7gjbF9voZkCCyBDej9iR3/ntdWWE=;
 b=bsvSLTIBXht/UXKmE8RL37xXARR5dzk9sLBfXD8gdISz2TiM6FG8qYOQLRc5mzRGRMTVi4tW/5jqPq/enXUBF/XwxllmhYOce7uPtrC1VzakCXZT9ZWIayK5dr+JsRyWB2dRt+DfpcRrm7qV9z6+eq2qtezYZgmmQ2f/p9FHYAjLC86cFTk6UhaQfBCWbKnzspbKtVLEyfrHZVMgqQCg/RVc6D+MAsdRQknNHWxkA8WXad9ZzF7D+QAdjGdNgWBnhEaPTe/OhEvoUpDOQoMDymVmKmyZo8v4Dj3j9VoY+c/MYQyFvBlhoFjU+7D4RtcQErOTtDjCDxItsOlCxopPDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <527d819a-44f0-72c4-13ae-403df43f0b9f@suse.com>
Date: Tue, 30 May 2023 16:13:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] vPCI: account for hidden devices
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e1c6e297-0046-73f6-981d-af776b271f24@suse.com>
 <ZHX746v6VZAehZsg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZHX746v6VZAehZsg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a1238e-9173-4874-86d1-08db611805e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eNqvME5e6WLV5okY2MuBuEcEoO9qmCqtnVwe726do7N+WNIAdvB6X+/cVyEAX8B5SIudKikgA+ZpT/ZpIa3xUI6iqXejlenk8uxVumJlEDPfRlJE3QjvBzS/FxJPtk/NTtc580jPDQOEC6HDRkqS2U/2jXQIq8rgWRt7Z2vJDCdel+kyj+8HJ9xlUr8KpQahN3ixttcn+RCvMjwm5fMVR8SXk9DWh5lOutPC+F82Dwe4IgrUi74B7rLN2WeAfoRKQOmxkQueAtNKeve/hhHIkxwvh92LIKnLOja2lwrIcpmYxwFvZQpTURts61u1skzmqq708sFuZHHz6imYJsTSqr+KNqSlqVb2wJXnM8rmiePge/0yuwfr4YhpeBmqHPodZquffV6nkyxVLyE4YaGm7zwKkgSOGv5t5OPV9orO9kl/QQiA4Yrps+kZB6EH/GoQAyksI0Zw++hon3BM8drKKmYXWRcJ6YHRe1vA12hJKXVeWQzwGPXloON1taIM5aBOinaXZUtR2Of19WGahpXWaNVo1yYcWJEn7I/tAOYAYwenWgCAJQheFsHSmo/fe2sZMeYLjhV/rkfmQ5Bc0skWL8fFj2IF+GGq6KcHjEOYPz4sklXbC/37wJbT5hs/jUXF6oXy6C+2x0nHqb21xvY5Cw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(478600001)(54906003)(8676002)(8936002)(5660300002)(36756003)(31696002)(2906002)(86362001)(66556008)(66946007)(4326008)(6916009)(66476007)(316002)(41300700001)(38100700002)(26005)(31686004)(6512007)(53546011)(83380400001)(186003)(6506007)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZyK1FCb1hvYmZCYi9GbFB0R1BpMGx0b0MydWVrY0xpcTFHUzUza2MwNnJE?=
 =?utf-8?B?RjZzemtGaXBkZlVpRDZ5Y3lVSy9IaDhML3pzQ3FMYjlUYkZPb1ZTZ2pwWitI?=
 =?utf-8?B?djA1MUF5V2tHb1NQbXdUb0ZtSXIyWnltdzhqemY1QjZ4a1ZZZWttcm5LZ0Zu?=
 =?utf-8?B?Y3lhREdrT29OTm1YaEFhSklkM0gyOVVmQkFVQkttS1NjOUNIRlIrdjFwMkp6?=
 =?utf-8?B?YkZVSDBqSm9SaTRRclIwZ2QzZ0NFUktYVFJwUzg4NDhzTGY4L1oxMkhkajZO?=
 =?utf-8?B?LzNwWEx0Z0tQalFDTFQ1d211cFYyNllMNGN2YmJvVm14aDdDVldxV1h5R1lI?=
 =?utf-8?B?QVhBYnhBV2ZnOHdoK1R3bzlFNzY3WnovdFV1bU9obmJZcjVTeFd6WW1VUmRP?=
 =?utf-8?B?MmxWNVZsb1Vqd0ZwbnVLVFVCY3RkekowSnNqNXpHN243MWpPR3h6TmRpM0NQ?=
 =?utf-8?B?ZTVqeGtOMjk4YmZSQ2JYU3FBNTluTzJjWTY1cndObEY5TGMvUlFqMzlLV3lH?=
 =?utf-8?B?elFPRXNBRGlmTFJTTUhxOC9FNUJZL0gzekQ4VXJnbjEvZmk2bWZWQW9FQkdE?=
 =?utf-8?B?OSs0UnhkUnd6N1ROZmp0S2huL1hkVnY5MTRIMlZxVk53emJiZWVuUC9RQllN?=
 =?utf-8?B?RGNzcnhRRGkwL3MwMFFjMXd1akM3cGszZ1lMWEJsa0JDTnVZNGNKTVVzbFdH?=
 =?utf-8?B?SC9rMk5VZHM1ckt2R0dhV0I1RnZTNjZmTmxGeUExZjlSdm54REEvZU5WMlR0?=
 =?utf-8?B?U1lLRXhMbGR1blhXMzZVdWQ5YmQ5elV6TzhIZEJZZEFlSXEyeEVaWk1lcUlW?=
 =?utf-8?B?Wng3dG1BN3c4bnNraWV2bnJQQW5oMnFkSVQrWmlVQ1BDRXMwSUxKTHhBeXY2?=
 =?utf-8?B?MEt6VVZML3pGUUprR0JRTzlaeDVXbVlsYkNLVGM2RndQWTFWSG1uOWlkd3Nz?=
 =?utf-8?B?V3NHcFZ4UStTSUdRS0hiWTVZdlExUU83dVJwbmNrd256cFBsNjg3TkdBWGpQ?=
 =?utf-8?B?THFiNWxQQkZxMnE4OVdSN2hzbi8yVmVKZHZyZmRmNE45RmZwMjRnWjVoOVJH?=
 =?utf-8?B?Ym0rYUdOOUJ4TnRXUEZqOWxvaXlGS0JhL1FwcTRmbFhBbGVCUDJIUHgzZE44?=
 =?utf-8?B?clFybUd1ZUlZQldTejJ6RDFVQU1Gc0JPcWFJcnZ6UjFVdVByRTE2d01UMVBp?=
 =?utf-8?B?bFZWY0lINTd5OGJpVWxETkZzN21MQ3EzaEF0RUQzRklid2lEY3RnSkZlN2dR?=
 =?utf-8?B?V0d1Z0trckNGUXd5VHE2QUxQWGlnQW9jYXRpQ0RmUGN0WU5rY25GK1JCam5I?=
 =?utf-8?B?OEVGSVdwV3NhTFl6MElHTVRPd2g5ZUpPVjlOOGpxa09Qc1hzbFJRdHk2Syt6?=
 =?utf-8?B?cWxYWEdPdzFxUEVveVNFL3RMYlltRTdIODRJZFVweU01MjZvcWJqQTFuR3dp?=
 =?utf-8?B?L1hxZHVOMy8wRC9oOTR1cFZJWVpBNUJYWUpqS2lqVW5kazRaSHlOZ2FQWk4v?=
 =?utf-8?B?SWQxeWZBcFRiMmUxaVVPaEZYT3VRVzVOaTRMbkV6UkQzTWk3UVRHZjlqNHpM?=
 =?utf-8?B?NVZlbkRxc2crbHV4TURzZUlJdjZVa0RBZDRERGswNVJJWk1LN2Y3QU1nT3Bu?=
 =?utf-8?B?MXNiVUxvWjVLUUJPR1kwdUpkU0NlMnBwTTNBaFkyMzVZRWlYMUs4V1IyNmRQ?=
 =?utf-8?B?UFNuRUZUVzBnQ0k4ZmFORXdjdnVPcnl4YU40WnpSZXV5TnBSTjV5amJWS1F3?=
 =?utf-8?B?elQ4aXA0am4vRWtVdDBpTHBBNFkvWWlwUitCMmtZZmtuNHUzWUo0QTQvNDRX?=
 =?utf-8?B?cVFJNmhoZXBTVThOaVpQQWRMd1A4TFYwR0JxbkV1MlpNZE1QRTVHU21adXNO?=
 =?utf-8?B?R3ptU0lmSFI1MFVKQlF3MHg4NVVtUW1wUjFzdVV2alNHMVlJMjZGR0l1NVhQ?=
 =?utf-8?B?Rys1OGhQM1h0VEkyaTdBWWUxWlZyQUFNVzd1ZkpBMzhXWkJkdzBweWkrUE9F?=
 =?utf-8?B?L3czZzFwZlJmNGNSZTZCd1JrZy8xNHNPWU15dlVmazNVRGhQVzhFSGZxbHla?=
 =?utf-8?B?ckJIOEdwMmF0dVJHb1FNZVpmT2hPQXh0NTFiS0hPYmpWSlhXMG92WEJkdlhW?=
 =?utf-8?Q?h1hb9f39qafMNnpKoJm+S9vWQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a1238e-9173-4874-86d1-08db611805e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 14:13:21.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TLbJq590LUA68dc7sFrxlnsGxtqqyt4xk7Upkoh2frgyboJMjTEKTrXGTPk9B2hc+PXf4oJ18d/kpBKV6oOCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7011

On 30.05.2023 15:36, Roger Pau Monné wrote:
> On Tue, May 30, 2023 at 02:38:56PM +0200, Jan Beulich wrote:
>> Hidden devices (e.g. an add-in PCI serial card used for Xen's serial
>> console) are associated with DomXEN, not Dom0. This means that while
>> looking for overlapping BARs such devices cannot be found on Dom0's list
>> of devices; DomXEN's list also needs to be scanned.
>>
>> Suppress vPCI init altogether for r/o devices (which constitute a subset
>> of hidden ones).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -285,58 +286,69 @@ static int modify_bars(const struct pci_
>>  
>>      /*
>>       * Check for overlaps with other BARs. Note that only BARs that are
>> -     * currently mapped (enabled) are checked for overlaps.
>> +     * currently mapped (enabled) are checked for overlaps. Note also that
>> +     * for hwdom we also need to include hidden, i.e. DomXEN's, devices.
>>       */
>> -    for_each_pdev ( pdev->domain, tmp )
>> +    for ( d = pdev->domain != dom_xen ? pdev->domain : hardware_domain; ; )
>>      {
>> -        if ( !tmp->vpci )
>> -            /*
>> -             * For the hardware domain it's possible to have devices assigned
>> -             * to it that are not handled by vPCI, either because those are
>> -             * read-only devices, or because vPCI setup has failed.
>> -             */
>> -            continue;
>> -
>> -        if ( tmp == pdev )
>> +        for_each_pdev ( d, tmp )
>>          {
>> -            /*
>> -             * Need to store the device so it's not constified and defer_map
>> -             * can modify it in case of error.
>> -             */
>> -            dev = tmp;
>> -            if ( !rom_only )
>> +            if ( !tmp->vpci )
>>                  /*
>> -                 * If memory decoding is toggled avoid checking against the
>> -                 * same device, or else all regions will be removed from the
>> -                 * memory map in the unmap case.
>> +                 * For the hardware domain it's possible to have devices
>> +                 * assigned to it that are not handled by vPCI, either because
>> +                 * those are read-only devices, or because vPCI setup has
>> +                 * failed.
>>                   */
>>                  continue;
>> -        }
>>  
>> -        for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>> -        {
>> -            const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
>> -            unsigned long start = PFN_DOWN(bar->addr);
>> -            unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>> -
>> -            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end) ||
>> -                 /*
>> -                  * If only the ROM enable bit is toggled check against other
>> -                  * BARs in the same device for overlaps, but not against the
>> -                  * same ROM BAR.
>> -                  */
>> -                 (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
>> -                continue;
>> +            if ( tmp == pdev )
>> +            {
>> +                /*
>> +                 * Need to store the device so it's not constified and defer_map
>> +                 * can modify it in case of error.
>> +                 */
>> +                dev = tmp;
>> +                if ( !rom_only )
>> +                    /*
>> +                     * If memory decoding is toggled avoid checking against the
>> +                     * same device, or else all regions will be removed from the
>> +                     * memory map in the unmap case.
>> +                     */
>> +                    continue;
>> +            }
>>  
>> -            rc = rangeset_remove_range(mem, start, end);
>> -            if ( rc )
>> +            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>>              {
>> -                printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>> -                       start, end, rc);
>> -                rangeset_destroy(mem);
>> -                return rc;
>> +                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
>> +                unsigned long start = PFN_DOWN(bar->addr);
>> +                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>> +
>> +                if ( !bar->enabled ||
>> +                     !rangeset_overlaps_range(mem, start, end) ||
>> +                     /*
>> +                      * If only the ROM enable bit is toggled check against
>> +                      * other BARs in the same device for overlaps, but not
>> +                      * against the same ROM BAR.
>> +                      */
>> +                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
>> +                    continue;
>> +
>> +                rc = rangeset_remove_range(mem, start, end);
>> +                if ( rc )
>> +                {
>> +                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
>> +                           start, end, rc);
>> +                    rangeset_destroy(mem);
>> +                    return rc;
>> +                }
>>              }
>>          }
>> +
>> +        if ( !is_hardware_domain(d) )
>> +            break;
>> +
>> +        d = dom_xen;
> 
> Nit: don't you want to do this in the advancement to the next
> iteration?

Well, I had it that way first, but I didn't like the need to wrap the
line there. Hence I moved it here, which is functionally identical as
long as no "continue" appears in this (now) outer loop.

Jan

