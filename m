Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C374F3F6
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 17:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561787.878316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFWY-0001Fq-6k; Tue, 11 Jul 2023 15:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561787.878316; Tue, 11 Jul 2023 15:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJFWY-0001CY-3B; Tue, 11 Jul 2023 15:43:34 +0000
Received: by outflank-mailman (input) for mailman id 561787;
 Tue, 11 Jul 2023 15:43:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wqX=C5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qJFWV-0001CS-UT
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 15:43:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eab::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae1d1a19-2001-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 17:43:30 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Tue, 11 Jul
 2023 15:43:25 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6588.017; Tue, 11 Jul 2023
 15:43:24 +0000
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
X-Inumbo-ID: ae1d1a19-2001-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqLqpXGfZV1XnOOZb4Vhc5TuFvnaXGMzBv46IsDQdp6FX9o9TwbW6WOEK/Kc5Ae1cX54vKMo+9LTl35oyEr3CZi3TakBz+lIC4YCC1UbmeRmWrhAwL589uC1QVRwTf1EA3mXOEFj62DvFc1pl14P4Ub94yw/GvHgxaaS8lTqTLHV8aQZVi89HOsL5BKpcENHkpL8dsKRhO7Ot3YsXogbh4xlEUJXX4B5aLsb1OoBpzY43IzLXpOLhmZeQjqabMjYO74dDYkN7uAIfinB6kfgIiK2El+LGAoBaWHuk4ZeYME0lCeBQuctssDxpeCGmqtEGGQE3tqoTyXqpSGrCR8wvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toprCbtRqWWEFm51huvlokYccBkGzouj7gEFp/QXEYA=;
 b=XcGzXMRH8Lq06OObPfI/f0DKr2TY29H0PlQNYOfENx0CBSw3eqFyLO/fuZrgvGf4+DIM9rpTcDlzSs+L/f2gan+bxboa8/KSj/+uQT2HjwAQ1rqwjGVXKaPZWWk1L4wzl6mdc53ffc9PbEg4SiUiL/moWoYqGE6qZLOQTwjw72ZzdSQIS06d5hT/V17ZX/Tk9eU4upMDL0Ty5Cq1SJi6yXX+XsrqTILUfn0eGvtHSXPmt28vAxY1P9LFdrnCD5EI8uiYX6QkGMcgAjFhXcTEJc/H+NldyGE6dFVEybHTyz/EOIziMoDN5qZkZt9Z4IACkOwm1dp2eyL8VeDWs9oC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toprCbtRqWWEFm51huvlokYccBkGzouj7gEFp/QXEYA=;
 b=t2gvKkpaYp0mccuOj0PGAWm7/K88lIFP5PpbHHQJ19IBhhHKwE/vZCVZY/nrV6mtIT7Z/mAku7lEskrYDFwg9Tg0QrCLtzJUlnPGBM7ynfGnustl4PUhNEfGt0+h9hB74GoLVJeYDRLEpSSqa3DkQEynMJzjafmd6jTj+xFlBQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b6ec25a2-e1fd-bbff-6f66-55172a5f5ed8@amd.com>
Date: Tue, 11 Jul 2023 16:43:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v1] xen/drivers: ns16550: Fix the return logic for
 pci_uart_config()
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 wl@xen.org, xen-devel@lists.xenproject.org
References: <20230707113518.141489-1-ayan.kumar.halder@amd.com>
 <6717701f-76c3-94f6-241b-743b4828ad6e@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6717701f-76c3-94f6-241b-743b4828ad6e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0014.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: c92e288c-b7ce-4359-2b00-08db8225900d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2wBeZzBH08oDFR/Wd8fu5UlCvAraQjuwBPo1aYmaIHCeLGOUeUaJI1WAs+TnMJG4soGr/HQmSYjrnlIYamXvdhn3ERsKUkxdws7HE/AOBUQn8PiRcIH8JFUPxvC35RlPY9yVdDUkW+iqCHSM5K8s8rXETEHSx2liXPldtJQDEFuGJStjdNUWjvZUUQAKexo0j9+EqrwOKZGJmZE3JRZspB7+GAyMvlZjaRuZMlkRxQo/5O9Ed9EUncK9InJ56e9GiWSys2zOC+EVlvGubn5tylhW4MM+g7V4XDaLJ/gCAjGjRM7wRq0GmGcZC1QcIgdO1y6o3syf4cx7d1TmSpb0OB45RZJEdEP4CuB3bMApRdI6myI+HEpoAu105fFz4GxJqJ6NePa2/r5PPHpdF9Psg66XC84qZycxKYSjC5lesmcopo3I1QkZwl+sG/Se3wZGkwQz9k3SgjGeEHp2XSGDStRqrzK/G6nXr918rIuktyMtY3II8hihaH8vvSmQ8SERjk5+mZGN98740A0rZl4SjuERYBKdNLF+QmJs9D1RvKTX5sKQGaSkL4rfRxCs0g1A66J71TISKgeT4zaFtKnh+U4SkXst4pb1cVPxZ+xdSYJiGgKun+7LPHbc+P5sl+ugOwVvN8PzxqSUV18tnTdWwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(31696002)(38100700002)(6666004)(6512007)(6486002)(966005)(110136005)(31686004)(2906002)(2616005)(36756003)(6636002)(4326008)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(6506007)(53546011)(478600001)(26005)(186003)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VDQ1R6bFR1UDgzemF4TXA3YzJTSURKU0xNN0F0Q0ZlYm9acGhmWXpIUkh0?=
 =?utf-8?B?bUZ5YndqTU0wcGtBbDhqV3RETStqU1dUS1NMUzVzSW0rRURuVkVocXUwQ0Nx?=
 =?utf-8?B?TEE1L3Z4WFJQQmdZRU50Tk9LSm53MVVwQkdVQkx5OVQ3aU1KUVBYYVFQQ21r?=
 =?utf-8?B?TEVrOGowWXpnbjRsMUJVUjVpRHlCVVZNNVlqdHF5djBvbzVmOEh5SVIvQ3gx?=
 =?utf-8?B?cGU0RlRrZWVETXVWSmNGaVJSMkFCbTdXQmtzSm9LNFRCa25GY1RDMzZiR0Q0?=
 =?utf-8?B?Y2NWN0NrV1ZpOXR6N1hsNS9lS1d5REJ1MUNnOXBJd0pVaTYvdnMrT2NVNjEz?=
 =?utf-8?B?MUhYSWtQTmJwa1l2TU0zR2JOSmdWL1g1SHdpclM5TEo4NnpLQXlJVXFVM0Vr?=
 =?utf-8?B?b0ZDVi9jRFA4MERJUHlPRjVvaXBpUEN6L1A0enRNeWNJbGx3RWoxNnFMU0Vu?=
 =?utf-8?B?K3ordllWcmNFenRpVDNOa3F0Nk40WDY0OUVRY1c1b1U4dkhBQkxkNGRYbGJQ?=
 =?utf-8?B?N1NBYzg1cTIzTC9uVnVtRjNWZjdmd3BZQzZaWkdTRHlRakwydGtML1QzYmlw?=
 =?utf-8?B?N3cwUUZibm94QWdpZTJiZ01hc3ozSTVSb1lvV3NQdTU4dldPYStrSkFHS2xo?=
 =?utf-8?B?UXJRZEUyRWh3Rk9MS3ZTdHpuV0dDQ2dmd0t6ZmppdGE0Ui9BNGRZYnVvZzBN?=
 =?utf-8?B?eHBBQUlQTGNJUjRVV2p2dndEcXR6R0hScHhmMWwrcWZ2eGpJOGtNM0MvVi9n?=
 =?utf-8?B?bE9RZlJSY3BjVkxoUXhIQVpFOEptTHlNOWpCcUJDMlllZnBLVXlmNVBNczBz?=
 =?utf-8?B?NTVMUlRhczI1emJzcTVHeUhBdTRPc0VrbS85TWV1eS9PZFlrZVB2cmI0cUNz?=
 =?utf-8?B?YXdZQjJJemVpOUx3N0ZIWjgyOXJ3czNpd0RIb29ST2ExSTRyc3FlRmZYbjZQ?=
 =?utf-8?B?YXZTditCeHF0eC80cUwvK1MrTmh2YlhYa21pUCtxeDU3d3VTU05BNGhUTy85?=
 =?utf-8?B?cDE2UXhRWk54ZDArYWVqcnZyN2FIa0hEQ1Nib2pRVGpLbktIZTBqaGw1dHc2?=
 =?utf-8?B?Q2Fsc1FSRUt6QTJ4NGpmeS9OZ2JKYzhESnJMb0ZheTRidlNYemlRd3VsR3Mw?=
 =?utf-8?B?MThDTnBwY2NVSFp2bjMxL0JVeWttK2psaEZkOEZPczdPZkptWWRuSWFzY2Vm?=
 =?utf-8?B?Ly8vTTMrcWlydFBsZU9lenlmWU9qYlExdWhpNnFwUmxKaWtmemVpTXFhbVBG?=
 =?utf-8?B?NVNuZWV5QmgwMFpseTBCN29jWEx4TUVqck42TWtFbkkrVlhzdnZ6Z2RUOXdi?=
 =?utf-8?B?TFR0dDlwNElPVENDTWZsdEp5bEN0STl2S1FmMkxrbzlPaVVVcHczUDk0cTNF?=
 =?utf-8?B?MUl0cWV5eDNpNEpQOCtqN1hjakIvbFBwV3grNkY5YkIrQmtWeWNtWmxRakd0?=
 =?utf-8?B?cmp0K0xDbG1MQi83YUVpRlVEUkdvSjVEUk5OWTlzY2RySGlLbXp6NTJQenVi?=
 =?utf-8?B?OXQrWVk2M2FVRHgzd0Rqa1pKTVdtWCtWNnNDUC9NTnZBNGYzQVJOZWtjV2dW?=
 =?utf-8?B?OEZNQ3VOVEduVVZWSjlWeTBqMnVOeEJIN3NucG5UY2N4TTBscGdPYnpwZFFN?=
 =?utf-8?B?Y0o2YkM0QWFwbXgrQk1udlhmNW9aUEZZT0Z3T0hRZTRGUHptZzlRaXFiczla?=
 =?utf-8?B?UmJsRUl0b2F4RFNKS1FvaFEwMzluNlIzRDY0VmlqK3kvUmw1ZzFoeXFtZno0?=
 =?utf-8?B?Nk11RUczV2pMZ1dwQzliWEdKUXJ0bmswVUpmQTZsSDczcUptVjhjSXVTZi9r?=
 =?utf-8?B?azBWTHhhSUZjY2FUNlE0Yi9ZVzNIR1ZNWi9VRTVjV2p6Sjl4Q2tnU2dHa3dD?=
 =?utf-8?B?dDArNEVMUWxNcUxtTjZJeEJ6N0Y3dVpROXRIUEdIeXRqdld4a3pWQ0ozVi9r?=
 =?utf-8?B?UEw0WGNBL0hmYzhTRVNrTWxlY0pId0E0Y2M1NTU3cWtvem5Gajd0WVQrMDdF?=
 =?utf-8?B?MGszOWVxQWYxRUY5RXYzTEQ5TDQxcUdRM2ZpR21KK3ZuVEl4U0dINHpibWxv?=
 =?utf-8?B?ZzJIeEc2TXFWaGxGYTlob1M4ejkvOUI0UEZPYnB5NWRyR0wvMGF6dUgwd2pL?=
 =?utf-8?Q?PFvn1q8E9Mi2eeWL8Zd+Y7hv4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92e288c-b7ce-4359-2b00-08db8225900d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 15:43:24.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEYKkSm3oi/3rX4mwmMaMLqaEyOVKkhrnD8mCiAjmWXocqXlTYeCqMNkBWksWTySHPdeT/HzQZuVjlTRdeqGBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476

Hi Jan,

On 10/07/2023 11:08, Jan Beulich wrote:
> On 07.07.2023 13:35, Ayan Kumar Halder wrote:
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -1342,13 +1342,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>           }
>>       }
>>   
>> -    if ( !skip_amt )
>> -        return -1;
> This special case probably needs retaining in the new model (with an
> altered return value), such that ...

Does this look correct ?

      if ( !skip_amt )
-        return -1;
+        return -EINVAL;

>
>> -    /* No AMT found, fallback to the defaults. */
>>       uart->io_base = orig_base;
>>   
>> -    return 0;
>> +    return -ENODEV;
>>   }
>>   
>>   static void enable_exar_enhanced_bits(const struct ns16550 *uart)
>> @@ -1527,13 +1523,13 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>>   #ifdef CONFIG_HAS_PCI
>>           if ( strncmp(conf, "pci", 3) == 0 )
>>           {
>> -            if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>> +            if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>>                   return true;
>>               conf += 3;
>>           }
>>           else if ( strncmp(conf, "amt", 3) == 0 )
>>           {
>> -            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
>> +            if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
>>                   return true;
>>               conf += 3;
>>           }
> ... e.g. here you don't suddenly change behavior in unintended ways.
> Prior to your change the earlier of the return paths was impossible
> to be taken. That's likely wrong, but you now returning in the success
> case can't be correct either:
I am afraid I don't follow your comments very well.

pci_uart_config() returns 0 for success. So we need to check "!(pci_uart_config(...)" to return true.

> Further items may need parsing, first
> and foremost the IRQ to use.

I see the irq is parsed here 
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/drivers/char/ns16550.c;h=212a9c49ae8e5c40dc6cd05da07a6652c8405935;hb=refs/heads/master#l1558 
.

Do we need to do something more ?

- Ayan

>
> Jan
>
>> @@ -1642,13 +1638,17 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
>>           case device:
>>               if ( strncmp(param_value, "pci", 3) == 0 )
>>               {
>> -                pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
>> -                dev_set = true;
>> +                if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>> +                    dev_set = true;
>> +                else
>> +                    return false;
>>               }
>>               else if ( strncmp(param_value, "amt", 3) == 0 )
>>               {
>> -                pci_uart_config(uart, 0, uart - ns16550_com);
>> -                dev_set = true;
>> +                if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
>> +                    dev_set = true;
>> +                else
>> +                    return false;
>>               }
>>               break;
>>   

