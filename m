Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6C690193
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 08:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492206.761642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1g2-0000Kv-8O; Thu, 09 Feb 2023 07:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492206.761642; Thu, 09 Feb 2023 07:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ1g2-0000JE-4c; Thu, 09 Feb 2023 07:49:06 +0000
Received: by outflank-mailman (input) for mailman id 492206;
 Thu, 09 Feb 2023 07:49:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ1g0-0000J8-T2
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 07:49:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38aaf1b0-a84e-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 08:49:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8620.eurprd04.prod.outlook.com (2603:10a6:20b:43b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 07:49:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 07:49:01 +0000
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
X-Inumbo-ID: 38aaf1b0-a84e-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5YWvBqzxzVzfnaSSADuJAdjh97Ri5IGyAAKoDcA2FvKoE9dPoYft5eLj9aVTAt2HNn+LuWgUXwhXLlyyn7TcMBSGvXWTjRAWx7eO2nFVSOyIxpb52L5HkC/tVzJoYQmMBrhxZlPJQ7ahMRXE1cGaPu2QmPTb9BnFPOzEZLqHbwp4BTQeowY/v1yqjscqni0OrHF0iY5cz0MBXA037iu3AlXXk+oMIGdKDx/AooOdhqxSoGwLhg5A1EVU4WCdk4sbXd4s6DAZUpbk6y8VlqeMZvvLYjjOepRa97ldNpanDXK7dMj5vRh5SSyZQQyapjOp489qdnnYGmOqMnaIKd1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50Q7QsxYqlbt6OCOWWyZxG+DYtjXGvXKmJwVrKliLw8=;
 b=ec7j//IVTjy/woBwPkBDKSpqTVaD4QCy1FxZ55gxb+ZazfETFZJURjfzyLPz/ZIuY4F1dVlDeYqdSjW6mvByvHMmjmEFFjWkJqW+GyK607f/eERcpPEGNZrffmVtjIZ1Ztqs1HhGWtfE8SPkZy9ZuKG3yI2K++8MIAk+cwpRFmJXid/wY5PI+3dXWH3VOQCrj54K2JNqqSvse/ETTgOckwFh9wP6eE0NgwyK9Vv43CtFPNwFoaq/coXNtV4XlcEZbm4F4OI0n0uLOftnajgIt161etIXM7PL1pNeQGT3RTV9JFwDAU6HQtyQzmLd+XTJAcYHOftoV+v5YATf93d+Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50Q7QsxYqlbt6OCOWWyZxG+DYtjXGvXKmJwVrKliLw8=;
 b=xS4s7yUF5+H9/v/lXu377ueC5r++6xC94RVpbJoBiPcuEji5+zZh5neXaeLZgnEtmCDYYikUaThvZsllByQZC0QOrTmKPomIE30JtoBOWQJc21ki1F67hOvXiPrrU+XJODTYXcRn7Cqt44+CkA6jBrcw7Qb/x31vUu6OZYR03iF/8CjGkedL+4eFkwh7186ebJNVzQ5tzw46SA6NYztZbRsxm1f45+1WI0/JAIZUq82Xzd+LhIekDXxVONel5JB1dUNwoTUhQ3/YiIItoGKIwkeET0/imOhzNrtahFFWejZdmVP5CzP3IJlbLzaVNtDr5thWbYX9kdFrNKPea0ghFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e21b928-7d4b-4a2a-24e2-5fd40647d842@suse.com>
Date: Thu, 9 Feb 2023 08:48:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN v3 3/9] xen/drivers: ns16550: Use paddr_t for
 io_base/io_size
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 rahul.singh@arm.com, xen-devel@lists.xenproject.org
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-4-ayan.kumar.halder@amd.com>
 <216343f3-6045-c6fe-ff4c-3a70d5061b78@suse.com>
 <e3b5c9e5-b03e-eed9-4c28-0dfde9187a02@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e3b5c9e5-b03e-eed9-4c28-0dfde9187a02@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8620:EE_
X-MS-Office365-Filtering-Correlation-Id: b4144bae-c21d-481d-1fa9-08db0a721b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3rcZG5GVsoG8McTLmlzeSfAKdeKsZgKpOWoITbLzrwkSJlwaGbTRE+IjA+PacDif2gA3LBNPh/xXvxGqrSYdd1H+BpvKUtkGVEDZsyag3FeswFkdAWuK4aH3CvxT7HyrcyoKsMJCU6TuhdGvrDmDEnUO/5WDvuYqxxJhQr4TcxMEYijvHUqaab5I/mQkkdKJJbtKr5/EWlaHfXJCQf9XgW2Td0+VCFpkdXUeGgcuf0As4ck3O7FC2StnR7fzbU1inMx1oefPtkG++79e/TAnXdlP6m7Yciub2ycC8ySZYbSjFuaCIbaTDGF6t+SyAYcDEdf68dNMbpdEQUSZBZchP0/F7yF/CtFaIoDnR+CIBfajK+CZSj3vlDxyfyxzja3QPe89XJv7Z7rf2EIJ/rMJWMMEGbxlAtezO32NqfUD4Yn0Y0oCEorUvudrPKEyXGKU2hqtF8rmocEuoKr2X5ZN7vLDo1aaXlUst1ZJ+tEjCAsPgY3Ud6T5Uga30azjxbT9huGrxNXOu8M/PDUaqS0dDtOQxMVf5c0WtnND7imIZmq8X4j7rURdWaXHlrVlSXki/7u5wLjUpAR7yUL03HFfEZCMxU7uOLYSkT4AkFLRGxhDYyI7UWaQcyYHBQ2kuWsMryzMBggHDmoJv7AuypB2hhbOwP5WMyw2NpDx+WS4QxFGHH67CwoICSNgh/eyzlshfMc8cFAzeZdN84wuVaMCX42mEivCOZp5DW/UqtwGZR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199018)(7416002)(5660300002)(53546011)(6506007)(26005)(8936002)(186003)(6512007)(2616005)(38100700002)(83380400001)(66946007)(66476007)(4326008)(8676002)(316002)(31696002)(66556008)(36756003)(86362001)(41300700001)(478600001)(6486002)(110136005)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3VyWVF0M044TkEwZk03NVcrREl2MDVMN1VIT2NGUmVUaHJpVmgyQzJ0bGtr?=
 =?utf-8?B?cjUxdkNJMUpTMXZ4SkRJSXNqMWx2TnpzaDM4aUgrWDlNUW1QUzhOcnkyM2RN?=
 =?utf-8?B?Ryt2TnZtbjg5TDFlbXFQdmFVUHV6cTVKemNrZ3hteUhUOUt3anRZazI3OXA1?=
 =?utf-8?B?WDNzOU5ldzlZNkkvOXVTR0RrblA4djVWMUFMdUIvMi8xM2s0QUlhVndSWHBm?=
 =?utf-8?B?T0k2R29qMDM2alhXVFBKWTZXWGhoL2FtWFRWUmg4UVR3bHJGUWFCRzZvZ1c5?=
 =?utf-8?B?U2V4NUl0dVA2bVRFRVVsMXJtQU5XMVVXa1FzYWJVczFBR3lZa2JjeGt2RVlJ?=
 =?utf-8?B?N3QvR09QTlhSNnIxQkFOTnQ5K1ZQRFdRK3Z0KzF1MkNqSzJBTGFtSnI2Tllr?=
 =?utf-8?B?TmNEYmtTWlhhRXZucFBlcEF4SUJXRGpPdk40V2dLRUNNcW1XaXExLzNhSjZP?=
 =?utf-8?B?OXpqaTNtYm96OHNENGZLc0VQeFhiVjlUcVJpL082Nk03aWduNWlFN0lQMU5r?=
 =?utf-8?B?MFVOcThONFp1cERobW5zNS9XZmhYaDJOdnpwN2FPQTdMQ3NDVjRoTGZFeVNP?=
 =?utf-8?B?UU53MWJXbzdpS0pUZ1h6aHNHa0pKVGVwRzU1TldGY2xJaDFiVC9WUm5ZdFUr?=
 =?utf-8?B?ME4yMksxV1NIRlB2TVFxL0p6UHNRVWl6WERtTFBTUFVEK2hGVmpOTk9FbUM1?=
 =?utf-8?B?eGxwMUk2VFRnM1o1NnlLOHZBSzlQakVNd01FS1VsbWlnd3Zhck04UHUzUEF4?=
 =?utf-8?B?Rm9vOU85dFVpQUlNaWUzS3N1TjNQU0QrQU5LMlEyeUl2cjdTOUM3MTJadVVt?=
 =?utf-8?B?QlJDMXlLZ21LaGY3NG1ieHFPeCtab2YxU2cyUG1hbU82a2s4TnNkL09xRmdk?=
 =?utf-8?B?eXN0Tkx0RkV4YS82U3FKekxiSDc4U0NEQzBkKzB5UE1OaVNweDNPZjBsZFcw?=
 =?utf-8?B?SVRXRk10VTdReVdCSkxzMG9lZ09lRTIxeXNOd3piQ25Hb1RsY1B3WU16dDlI?=
 =?utf-8?B?VGc3Y251VExDRVZrRlFNRWtWZzVhYVhqOWVTNlZaNVo0WUNxV3BEUVFhN05K?=
 =?utf-8?B?UXlNM3BlZE1lWVZFd096c2lpT1dtdTRVd0lKcGdyOUJJVFQ0ZHVkeERIb3Ar?=
 =?utf-8?B?cUZBNTg0RG03N3NoTFVSd0tOTjd1RHRlRjlWT0wzYmlNWjUzdFhRR3g0dnZD?=
 =?utf-8?B?SDBhNzljVUs5MDRUL3ZMVm5Gb25kRU9Vbjc0SUxqaGxwUmQrcnRDajc2b2lS?=
 =?utf-8?B?SHJndkJhdVhqZ0RJekRlenN5U3lPMG56Vk9RRkNCUUE0UkxCK2x2U001eCtV?=
 =?utf-8?B?OHNsaU8yZHdtbkt0dW54aDhzNzZ4NXl4eGhkQ2xTTFNzNVdrVUJsM255cXZy?=
 =?utf-8?B?VnJmY3BEbnNJN1EraE9qNlFHWlJBOXdhbFBWZ25SUE9kaVdiNHNXd3ZoZ3cr?=
 =?utf-8?B?ZGJJZHNnbTVRWm02VDVQRkRESXhuaEx1Um5PNElVSURlSG9OSEJzWjVhQk9n?=
 =?utf-8?B?cTBYMGttbDFKbDd4QW12N0ZGTEpQcStyYXNSYmxCZEdpVnFMcWluSSsxeDdB?=
 =?utf-8?B?TjdoWFQxVzBEQXpVTVJMQnZ6WEFhMGVGUlVWeGNUVDZKZUlwTFZnZjB1SXdh?=
 =?utf-8?B?V3k1K2NIR3F5OVR3cFZVVlo3R1VyWVV2UGxsZ20yM1RmeGFsdmdSRlpudDlu?=
 =?utf-8?B?TVlIY0RJZmRHM1ZmbjFKT29MTG0zWGJFQWt0NE9uT3M5NndMU0g1d1FhdDZY?=
 =?utf-8?B?NWV6SWhJbnJjelREU0V4cCtTZlFud0I5YzE5S0EzSUdyYlZuMUpQajQzNktD?=
 =?utf-8?B?UWYzM0ZocjlZdGczSlVZWDdMN0lETFA4bFFIemh6SUF0MTFITHlVRDBHWkRC?=
 =?utf-8?B?bDFZSGF0cG80enRBNndMbG9WNWlva3VmYUwrVERoTExJV2Z5cWo0Y3NiNEd3?=
 =?utf-8?B?QitnT1h1dFFPbWhEZUw0UjVWMWl1bjJNblduY3ZwMXZ6bmhIcVhHbTlzc2Mv?=
 =?utf-8?B?NXRlVlVXOUdTbnc3d3VmQ1lpdzVVcUxUVUJwVkp0RFJtcGhxWEcvcWRDTkNV?=
 =?utf-8?B?c3RqTXN4a2VkZUU5TWFuMDNwcjF6ZGtiTWpnN0xhMmc5MlhJSndHY1RqQXpU?=
 =?utf-8?Q?wlryIE5ox/5nkHzq3osBVMSXt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4144bae-c21d-481d-1fa9-08db0a721b9b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 07:49:01.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJZvAebz+DP7D+5nNYMMzyIFLtfbwMy0pqDOnQKcSgFJWmcupxTPrjNp4DxjsB+He+Zkd4GzEB5d0wBUpebr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8620

On 08.02.2023 18:07, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 08/02/2023 13:52, Jan Beulich wrote:
>> On 08.02.2023 13:05, Ayan Kumar Halder wrote:
>>> @@ -1166,8 +1166,9 @@ static const struct ns16550_config __initconst uart_config[] =
>>>   static int __init
>>>   pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>   {
>>> -    u64 orig_base = uart->io_base;
>>> +    paddr_t orig_base = uart->io_base;
>>>       unsigned int b, d, f, nextf, i;
>>> +    u64 pci_uart_io_base;
>> uint64_t please (also elsewhere as needed), assuming the variable
>> actually needs to survive. And if it needs to, please move it into
>> a more narrow scope (and perhaps shorten its name).
> Ack.
>>
>>> @@ -1259,8 +1260,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>                       else
>>>                           size = len & PCI_BASE_ADDRESS_MEM_MASK;
>>>   
>>> -                    uart->io_base = ((u64)bar_64 << 32) |
>>> -                                    (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>> +                    pci_uart_io_base = ((u64)bar_64 << 32) |
>>> +                                        (bar & PCI_BASE_ADDRESS_MEM_MASK);
>>> +
>>> +                    /* Truncation detected while converting to paddr_t */
>>> +                    BUG_ON((pci_uart_io_base >> (PADDR_SHIFT - 1)) > 1);
>> Why would we want to crash during early boot at all? And then even at a
>> point where it'll be hard to figure out what's going on, as we're only
>> in the process of configuring the serial console?
> 
> I do not understand the best way to return an error from pci_uart_config().
> 
> Out of the 4 invocations of pci_uart_config(), the return value is 
> checked in two invocations only like this.
> 
> if ( pci_uart_config(uart, 0, uart - ns16550_com) )
>                  return true;
> 
> pci_uart_config() returns 0 in case of success and -1 in case of error. 
> But the caller seems to be checking the opposite.

The callers look a little odd, I agree, but iirc that's intentional. Since
this is all PCI _and_ x86-only code, which you don't care all that much
about, one option is to leave that code alone for the time being. The other
is to properly propagate such an error through all involved code paths, e.g.
by way of invoking PARSE_ERR_RET() in parse_namevalue_pairs() in the failure
case.

>>> @@ -1532,7 +1539,12 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>>>           else
>>>   #endif
>>>           {
>>> -            uart->io_base = simple_strtoull(conf, &conf, 0);
>>> +            uart_io_base = simple_strtoull(conf, &conf, 0);
>>> +
>>> +            /* Truncation detected while converting to paddr_t */
>>> +            BUG_ON((uart_io_base >> (PADDR_SHIFT - 1)) > 1);
>> All the same here.
> 
> I can return false from here and let ns16550_parse_port_config() return.
> 
> I think that might be the correct thing to do here.

Perhaps, and likely again by way of using PARSE_ERR_RET().

Jan

