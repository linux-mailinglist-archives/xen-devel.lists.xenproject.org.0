Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE9583919
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376623.609511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxWV-0004DI-L4; Thu, 28 Jul 2022 07:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376623.609511; Thu, 28 Jul 2022 07:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxWV-0004AR-Ht; Thu, 28 Jul 2022 07:01:31 +0000
Received: by outflank-mailman (input) for mailman id 376623;
 Thu, 28 Jul 2022 07:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGxWT-0004AL-JT
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:01:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19d2be9c-0e43-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 09:01:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 28 Jul
 2022 07:01:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 07:01:25 +0000
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
X-Inumbo-ID: 19d2be9c-0e43-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn3P0HPPn0r/iXIA6a80UvZn0Rj/VZTxnGNIvenEeEj/DnPpOVbGSgc1D9CJ9sihHab7zaIxQx+B2eycjFhx4523C3gdZsXpPXOQlr0KJDWzeg45KTXmAwCu1ZZUlH573MQk16KlLqAw7N22ilX32sxkdu86FfV7j5u2HmEP04DbIaXuMa1nowIuMsCDwyg726+9e5olxbkD2qEFYG3DDDIKK2VrVdzEQGceB7Ik6PD1ZOIiU4SvFdR20uL2EB3NmBdken7w1UJdfIKOzN6FpK6fXn7aFKMI3RXk8J9X2ndspaJBsGf2rqw5WS6LsKpNaKCFIXbCg+P/YA7gu7p80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8w0QFlNxtccf0wz4v93VCyvBgfGFiQ40dpDtjNXi2E=;
 b=kVExEsGt93fBiF8mCUdZQa6Iv0F8yPrFiCF/Yy6/0KIWa+GmEeTGm15tZFCcQLAj2/7514/vyLQZ38NJxpmDR2za/J2rCd2WD6P6qfLiitWDPh0WB2l6aRd8LoSrCGqp7Hzx2pwOFmn56DrPRV92XC2jWiLjUHeoJwdJvMlfhGqVRwwINhdjJ6TGBucCwlvFQ/6syeT1zUJIfP8IOeHxVSfHbkGc05NCtlNS0/zdpMslYqE6pufwqBu8N2yNsIY/JhN89CGSfEFGjijgPCxnVbigf06rU5lUJ3I+p68+JWflvFapvTchWr7y9vMiiid49pAXinKchKRjBaxgodnkGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8w0QFlNxtccf0wz4v93VCyvBgfGFiQ40dpDtjNXi2E=;
 b=agxu3ras2oC0sapauNrYl0y0wCFlHNhPDvzYoYHJcy9e3iSLm0A2xwfBvsfc1bZ8aMQVO4Msr2JpvcnvNEuxmBwl2OY2dk9ZotPJKSC+OQPz5UotKBlzj7BiVljL7rVuZAWaRHcNJXNzKtH90Z5hkWG/GmJ13U0gqb0mWQUWRlpbjk9eSWRGrXry6xPoQvxZ70IybwudX3ublXpsX1ATJdSERG8QpgTlq+fgybZFpr6kLert7jSZXuRTTJ9gpt+naM+8gV2RiCmqPsKIm0SF5t2bBvPtYjety7VNXMwxiGi7OE8rJ1iFn3zYjrfNkqDhUW+pCiPHbWwfmcfuTx2TAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a43ac496-3296-93d4-f1ed-5fd4acfe9ac6@suse.com>
Date: Thu, 28 Jul 2022 09:01:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/11] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-4-olekstysh@gmail.com>
 <dfc1adb6-82ac-5afc-0d4d-4514548314e1@suse.com>
 <25d96933-5582-ff1e-f685-d48b5380d531@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25d96933-5582-ff1e-f685-d48b5380d531@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 035c8ee2-d643-4ea3-a17d-08da7066fc61
X-MS-TrafficTypeDiagnostic: PAXPR04MB9108:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tObGffKBib1aODyLCORmer8OeeLgaUFVkwu51DosK4E4U3XBiZwuJrLO1QIVU46Cj+XhzVqw6/ZvkpLfkqjnrvRY5eFQk/aM0IVrHuLyhrXtTkBs6otRsQqkmhpmA1A8VkCg8UEcWUpDsUsPJo9t0ozHW4o8lKIDxbjoqAIK/mzDUUwzwdJIZ8RPAo+gzi2XZ38FIdxPpIVtlo+mB3ok0uvTuJXqXgz7ojbB1Z9VgS77jx7IqTUQYZ2LhFj0fS60MpE4m8zgYvED/OPsTIgE9jIN8mBGD2BTlljGkSOXvfxhNqAmn6nxmOYPmrOIVSj6BlIS8aHNy9ri4nr2yBEnH78BuQC6iT4QiNbseDFUvMnUmmHW1RKShawbBL92LwshYGcpJdRf9tQoCEAwgrDPmhbHKKgeVlVxxRwV/Ud3xSHopYaNESGO+TLxRDaEpKIudwQBz9JOTRNBGcUtDhzXDxDR/nUDbXhX8XYR6JKJRmqcfSs/lraYiYnZY8Gca5egavtb+rslj2noyu40mamPA4rQmDpDnVpdBuUw+FH1pYD5YYPZ/0HaMKf9WzxFd2fosCj8rljhifDWN9nfkzKNQRlP6jdb24dp82Flum+a8iiJYTNFRAu5MOaC0EJnWONQQlOiF9v8q6dtdXFL1rxBNSpXUiS6NM8xsLDDTcDBdpwQAMn2dOpu+FreBcVlFTzRjB5w38lw0fNDoJwBD+XQpWy77pvJDmkOcd/xJDuB3Uv0QFIZC2tP32NrvnLW1JXOEIW7rBOMMdmgpmxUEVUD+CrXs6CiKaaH5Jar8pFgT/D9E+VzBKvdFbUvr4CsxeBApaOPCXc/GqEv3l/9/k5VDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(136003)(396003)(36756003)(38100700002)(186003)(6486002)(2906002)(8936002)(478600001)(86362001)(66946007)(5660300002)(4326008)(316002)(66476007)(41300700001)(26005)(6506007)(31696002)(6666004)(31686004)(2616005)(6916009)(53546011)(66556008)(6512007)(54906003)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JwdFdYeWkvZHU0MDBib0RuRjRJSnVFbVNBTkZoNzlQREMxNVh3bU96VVVG?=
 =?utf-8?B?SUdJeitlcE5IYnFJMHRYVWMrbGhUUTNXVlAvZDc2SjE0aXJ1N1JvVlU4aldJ?=
 =?utf-8?B?ZDlhbHlFdGE5NFN1NWI2RzRtWEk2WHZCbTZwU0hFaGVLN3pibGlDRW9kU0U0?=
 =?utf-8?B?bXJQc1RKa0laMDdjQU5wMWJmYXExdTNaVnJBaGdwdjZFL1h5OElPb0w1Njdz?=
 =?utf-8?B?SUZNdEluNVg5anYzUkREY0h4bTNvVEJ4b0d4V2VmWlJYYnZCWXZWbUFTMDRC?=
 =?utf-8?B?VVZMczhJUFJNQVk0WlFLdENueERvS2tlRHh1cnN0UjJpMW9ScElpWnZHZzdW?=
 =?utf-8?B?d2t1eXVESS93N1BGbTZaaWJiQXR5TmhMQmFZcExqVm9vYllSblpTMXNJaFhz?=
 =?utf-8?B?RVJVZ1Z6RWltd01LR3BaNWU3WDlQSWc1TXZnTWF3Y3lOd01yL1RrN21DcHRI?=
 =?utf-8?B?L2Vlc2lpbW40K2dEdXlKT0hXUmVtYWlWRG8wQlkwWTkyTkludTQ1YmZwakd6?=
 =?utf-8?B?SnNPdUQ2QUR3Ky9aT092dzdLd2YwV2hkYXlUSW03elNOb0VmL1hOSklOaG42?=
 =?utf-8?B?QlA3RmYwSFhQYVRBUk1yN2hSVVgrMjdQbU9iMDY4TUpKTldGVlhRNlM0WnlY?=
 =?utf-8?B?dHA3QW1NbkNERFcvVU9PS2oxNWVRVGFGb09jQ2IvNS9xdDFHVmFQZy9sN2lC?=
 =?utf-8?B?T2hFT3VZNnVWVEtUYXd0UzlnUEIvOEd2YnNPeEZVZE9NamQxL0tJT0tvdXpu?=
 =?utf-8?B?VFFkU3Q4UU5sU09JczJhdnM0WXp0RHJwNzlGUE53MVZsZnFqUGE4S3VCbHFR?=
 =?utf-8?B?NzZ2Rk5mY0lBUkxLeGpiTEplTWJHOWliRldkaVFSek9Scy93Y202K0xOMVdK?=
 =?utf-8?B?ZXRMdUZsL1hwWmhoRUJaR2YrK21xdHhNZVdycUVXNFNCZzdYcjA4RVRpaGdz?=
 =?utf-8?B?SGdvRFZDMEd3eFNSRVdvcDdwVk5JMjIyVUdwUjVpNnl4VWFNQWFvTFBuZnJQ?=
 =?utf-8?B?aHQ1UmNLeTFBK2pnbDhxYUwzbmtLNUphYmMreFNKUVE3a29USVppUjIvUUVj?=
 =?utf-8?B?ZTdGWk1pMkU3M0FzbzlDUVhyR0wvTmtxQVl6M3NyNHg5UTIxTCs1Y1B6NFZJ?=
 =?utf-8?B?NHZPTXlXK2ozcDNaT0RoVkltNHRJNkN0Q2FUdWZucTN0OVZFWmtuU3YvSytt?=
 =?utf-8?B?WjNTdW0ydDJLVU1ybjVTQUdUYU1ZMmNBWDdaeTN0Y1VFSzB5YytoeFJiY0lX?=
 =?utf-8?B?ZEJvTmdpL0dSTGF0bUhuZnladHJ0Y2phd3Y4ajdmd28vS2RHeWR6N2NLUGYw?=
 =?utf-8?B?QmtsT0NMVWsvbEorL2FETHJnay9tTDZNcmNGbWxjQ3pONUttTEVsZmNnQk53?=
 =?utf-8?B?ZW1HL240dHorUzJBTHRXZ2xnQjhIUUlzVlhrbDZndDllYmtXaXl4TlovNzFP?=
 =?utf-8?B?aldXQUJ6dmtoaTN4bXJIVmthSVpmNjdvU00weDRHaGxaejdYdGZMdjJld1Nx?=
 =?utf-8?B?VVVCRTlSWHJwa1pkWTZ0a2JxZ2lXdnk3TXZ2YWZhVW8rdUZDMTFGd1puTnla?=
 =?utf-8?B?Wm5IVzFGNW5aZXVvU09qaDhDakVyc3Z2YkZISkRNT2xUVFVwb0h3ZnZQYUEy?=
 =?utf-8?B?Vi9TVFlKVnFBUUliK20wR1dKbm1iT1A5NlhKTHZXaHRoUlJWYUhubmhoYVlZ?=
 =?utf-8?B?QlMxQXBBcGxSS0lISHpCZkloTVFOeVo3a0szR0RqVzZ4Vk9EeWRPdWlMV0lp?=
 =?utf-8?B?eUg2eE1wck5RSDVPNnd0UGZydlFlWkdYZHJXWWtOVmxERlpEdFFjT1hCU2NE?=
 =?utf-8?B?SUFac2hPRUZWNG1jaGVKQzRrZm9xdno4d05qcnhDYmkrTFJrZElRbUV6RHFF?=
 =?utf-8?B?RW5sOXBSOG5wY2MzSU9TS28zNURCTVluVTBEcjFPaGNieW5oalNJNitrOWpk?=
 =?utf-8?B?UG1hdjVrenBDKzdLTVRzb1NmdWFJaWZBK0VpNjRrUWJySHBzNVNDRDZRdVMr?=
 =?utf-8?B?MnFjMWhHMEhReS8vcVUyN1JWRjZiY1hBMFhQVml5bTdxRUkyNXhFa0RuTVNY?=
 =?utf-8?B?YnhBOWtNdVVmZWdhYTFzVkFjZnFyc3doQUo3cmU5L0xwckh4eXU5TE1uSi9m?=
 =?utf-8?Q?0Isx5FLmsRMP2TIJy8vTCzK4S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035c8ee2-d643-4ea3-a17d-08da7066fc61
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:01:25.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XuYjM6mxqA7tWG98z9SM1rXd7DikgDED5BJPSOZB385R37jdVloccDvvsbsJmAzU9jz1n6cyUlUtBu7KOc6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108

On 27.07.2022 18:17, Oleksandr wrote:
> On 27.07.22 13:15, Jan Beulich wrote:
>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>> @@ -527,6 +592,17 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>>           if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>>>           {
>>>               bars[i].type = VPCI_BAR_IO;
>>> +
>>> +#ifndef CONFIG_X86
>>> +            if ( !is_hwdom )
>>> +            {
>>> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
>>> +                                       reg, 4, &bars[i]);
>>> +                if ( rc )
>>> +                    goto fail;
>>> +            }
>>> +#endif
>> Since long term this can't be correct, it wants a TODO comment put next
>> to it.
> 
> 
> Looking into the previous versions of this patch (up to V3) I failed to 
> find any changes in current version which hadn't been discussed (and 
> agreed in some form).
> 
> Could you please clarify what exactly can't be correct the long term, 
> for me to put the proper TODO here. Do you perhaps mean that TODO needs 
> to explain why we have to diverge?

If a device has I/O port ranges, then that's typically for a reason.
Drivers (in the guest) may therefore want to use those ranges to
communicate with the device. Imagine in particular a device without
any MMIO BARs, and with only I/O port one(s).

>>> @@ -553,34 +635,47 @@ static int cf_check init_bars(struct pci_dev *pdev)
>>>           bars[i].size = size;
>>>           bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>>>   
>>> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
>>> -                               &bars[i]);
>>> +        rc = vpci_add_register(pdev->vpci,
>>> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
>>> +                               is_hwdom ? bar_write : guest_bar_write,
>>> +                               reg, 4, &bars[i]);
>>>           if ( rc )
>>> -        {
>>> -            pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>>> -            return rc;
>>> -        }
>>> +            goto fail;
>>>       }
>>>   
>>> -    /* Check expansion ROM. */
>>> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
>>> -    if ( rc > 0 && size )
>>> +    /* Check expansion ROM: we do not handle ROM for guests. */
>>> +    if ( is_hwdom )
>> This again can't be right long-term. Personally I'd prefer if the code
>> was (largely) left as is, with adjustments (with suitable TODO comments)
>> made on a much smaller scope only.
> 
> 
> I can revive a comment that Oleksandr Andrushchenko provided for earlier 
> version by transforming into TODO:
> 
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM handling is supported
> for x86 only and it might not be used by other architectures without
> emulating x86. Other use-cases may include using that expansion ROM before
> Xen boots, hence no emulation is needed in Xen itself. Or when a guest
> wants to use the ROM code which seems to be rare.

ROMs can contain other than x86 code. While reportedly mostly dead, EFI
bytecode was an example of an abstraction layer supporting arbitrary
architectures. Therefore a comment along these lines would be okay, but
personally I'd prefer it to be less verbose - along the lines of the
one to be supplied for the I/O port restriction.

Jan

