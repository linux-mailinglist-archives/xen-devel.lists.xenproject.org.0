Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61F74F4B9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 18:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561822.878386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJG2h-0000HG-50; Tue, 11 Jul 2023 16:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561822.878386; Tue, 11 Jul 2023 16:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJG2h-0000EY-21; Tue, 11 Jul 2023 16:16:47 +0000
Received: by outflank-mailman (input) for mailman id 561822;
 Tue, 11 Jul 2023 16:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJG2f-0000ES-MY
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 16:16:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5381aba0-2006-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 18:16:44 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB8PR04MB6809.eurprd04.prod.outlook.com (2603:10a6:10:11b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 16:16:39 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 16:16:39 +0000
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
X-Inumbo-ID: 5381aba0-2006-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wsd0hh14K4JpzKQy3zu1MDxZvaKb6iGmemXPfnY1hBShli2u8DdKEr2NTuJRFrDcCRyue9j9foG5jngzV0l7VA+rcGVIkIyw7d3vfqBzvuTLFTkP0DJVLXtHIS3lOxMfiKDTw4OCrMAN09F6z5cUwXCH8Me7z496oCX3TcKZen8p3ACFTL7Fl2J7iEwK34TWUjmIA1ad7A3SOkE1dItgLjKjlzJaccBdMIz4i7ONfhJ9d4/bfSjP7DAuJCdtv05TsvfVlwxEshv0pvIu5wx9m7wmTN/dwT9GD8OwP9nE5F+opy3WyEOuOB6tfAo0cmqApCZVP9FrfAzxSiakfJg2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4dg9Szd5vVdHhz2bL9kxNl27QPYC3Gkivg4U6lpTrg=;
 b=FmSDk3Sz/jeEzRSuj4+UU7h+ciGAGuIip70Ehxu5t+awkZDmhrs6R8Jgis7Jh0NPXdM9b2i3SAqS5E+v09uZQrD84PXJFf0OK/lqjmfrgooPHcCseivu+h8D7+1dJevbHRXuKqLNufzEf/BSx/Q0Rlj0pV972/P+ENrPDH/sX1Pw+iFzK0eHkK7iWOtxqeJ6mGiEwoNmXV5UIsfYVFfRhvleowoaV+WMHMJqzRoo884ljEkGt4gF8Qvz0v8EgcsfGFhcItDg9NfEV00A5PyLfSeKZS66C1jVG7eq90cXFi0KXqnqL3LhlNazDs62Lu+udFoljYj9F4uqbwTssAs53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4dg9Szd5vVdHhz2bL9kxNl27QPYC3Gkivg4U6lpTrg=;
 b=aPUSLSCeg7AuLyQjh9Zio9l+UwQT0PArRHUUdKH0UfLOvP39Sw5THDF1/nU72VzDe0TyjRGpytIP0OJaZ3T21o+leGslJblKC1YvIkplsB0fzwRscmvSeD83vGEVM3OZBM+MAwsJpMRWvCwdX1lHHjA4jla4zxr3E2bOMOnsdAgGH5PBahebZjMfC2Zui7CP7ElA7IIbRQFtN69OsP07l9cJQ5FqJdNNghIg192Si+josF4SOg7UnxmkkB2AEPFB4ajhD5OS8V7cDJlLXahK9KeVq8FjybQkpz578D4si3Y6kBp1s3GXPHIXVJh+b2wY6x90Izek+8iZOsjzzWvxVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d89193fc-f295-d7cd-686a-33363088cb68@suse.com>
Date: Tue, 11 Jul 2023 18:16:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] xen/drivers: ns16550: Fix the return logic for
 pci_uart_config()
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 wl@xen.org, xen-devel@lists.xenproject.org
References: <20230707113518.141489-1-ayan.kumar.halder@amd.com>
 <6717701f-76c3-94f6-241b-743b4828ad6e@suse.com>
 <b6ec25a2-e1fd-bbff-6f66-55172a5f5ed8@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b6ec25a2-e1fd-bbff-6f66-55172a5f5ed8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0130.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB8PR04MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: ab6eacd4-4b27-4bee-c459-08db822a350e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/eeNXu87RcKuB5iB/jnO9HpLwQXKfe+b9q2Q4p2WGLPtcfLbq8nSFzTU+n8krohMT/ZPD3BTAQ2DhtQZeKPjflD7HZBi9qxibqBVRbLS66eQ3eLF/IxMNYF5mO4iZQCl0Z241W67bsFb7+z/LKxM184rQoM6b6wRICS04AfWUSCDJ/rrfCBuj/F4pD8gPIfZtVD2wS+8HPUXZR8ThOgeD5MeSi5sQ225GkV/GI77leBfiwKrAxkZzy8ZHo4ANPaxU5hygI3zxnJBRCpR8a2XTR+DC92NVfmhumBRWfkzQ0A7sDhUcebQlJKoYF4PkwA3dWgx4yyHh2QSNSKC7KITsl+S/kG2V+eRBWit0A+83y1ZMoG5xDMW4UQSvEOvbkTBUrD/J/bNx+fdBqmkMJGbvgmUnkpHczpQMdR9zoZqu3aLbsks6FhbY7MUmlOxiYVwQb9TgxgsuDthr0gOQ9ifS0n5eQHF49mGxYn2EzcU3xTYqj0lOpXKCvDn456yPBHnDqtKULjVDOWy1EGQ0+ZJLooBS0bHzAHu7qoRtUtc+NTFPvGy8I34U0MeGrbNd3WAGrVsldxMBQoa+j0TgBXbGn398qQaD9bPo3c6bOHGbFKKq820dI/8Xu4eGEGoHLaZ+UjHgrx9KFyFRsIrmkO3Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199021)(53546011)(186003)(26005)(6506007)(6512007)(2616005)(41300700001)(316002)(2906002)(66476007)(66556008)(5660300002)(83380400001)(8936002)(8676002)(4326008)(478600001)(6486002)(66946007)(110136005)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xHZG51MGExNG42NXhic01sN3NvTnFoc3BRcFJPaWdTaXYvM0xSdEp3bVNx?=
 =?utf-8?B?MzNCWFlBTWZFZE5QVzVQT1ZXZGg4WE13cVNQS2JLdnNBbzJQY09QOWZaWTA4?=
 =?utf-8?B?c0hSSEI1K0l6eSttZGNLbE14dmZBbDZEdFVHaUlUaGN4WEoxWGcxamlhWVBj?=
 =?utf-8?B?K3dzZFZ4OUtkQVVCeTB1ZXVrY3FjNkZEeVl4VytOUW1HSklxVlhqMjk4eUcr?=
 =?utf-8?B?VmtLUGtyY2UzSDMrZFRUd01VeVRRT1VYbjRqNlpNT2lTR012bDAzUHlCLytI?=
 =?utf-8?B?TXBZbTNBQlFiZUtmUnk3VlBMT09uZVFMWHZSSnlzQzIxTDRTSUI2dmFwT0xT?=
 =?utf-8?B?Z2JxSmxiSFVhZjJaOGYvZ3gwenNtVnBXRjFHTHZHK1ozODdyUG9seHAvMENZ?=
 =?utf-8?B?M20xVmp5YTNtTHA3VHp4VnN4K2JNTXVSQW5BbTNvZlZJVUVGV3BLTEx1a0sy?=
 =?utf-8?B?U1JtaUtPUlZJNHFYUDJaMjNxWWY4anlFbUtYWHVibEZ3UVZpZEJiTEVUcDVN?=
 =?utf-8?B?eDVtOSs4dVBzcy83RzZPcDJycHpvL1RuVFk5UFJrNGdoR1I0Uy9mT2psL2JW?=
 =?utf-8?B?V0lqellxcmRKMnBSQVlUU2EyM1BHYUprejBDSHAyY1FBa0xxU3M2R0F3d21I?=
 =?utf-8?B?OGswdXQyRUZGVFZYa3E0cW9seVlzbFlKbTVFT3pKM1RzNVBQQmZ3UzhPTGxV?=
 =?utf-8?B?OTFWK1ZzUDlIcGU0SmxRZnRldnVlMldKcjRxYjRPOVVPdm5XbXFhT21HZ1Jp?=
 =?utf-8?B?bmVxaWt0M2x6WGEyaXd6MmxxekovQ1hKbktJZXIvV0dGNnA2aGlHVlVlNkVV?=
 =?utf-8?B?eGtSVFo1WjRiT293dzYvUW1VcHVvYWxvZ2syTCt6enBQSEtYcW5VV2hQZTZz?=
 =?utf-8?B?YkNWbGRRUjZXM0c4ZXRSNDBFR3NYZ3BhK3FOa3VydlpIdUNZbW9SeFVhN2pI?=
 =?utf-8?B?STZqMzhGcVA5a3Q4RmxYRC9hYWo1dUdjM29ieFlDQnoyTTEwbjl5OXJGdTB0?=
 =?utf-8?B?UklhNDQ4ajgzNkgvY1ltVmNuK3hKaWtGbzlCYVROczdqK3dtZCswUElVMFJQ?=
 =?utf-8?B?Yzg2UE9QOG1nTTRkM2NQYUVWLzhSNlpTL0EwNExXanJBekRmTk1uVzlWR1VD?=
 =?utf-8?B?dE50eG9YMnNUS3kzRlBDazU0bzJyck5qVTlLY0hWais2dk82eVIvRnl4MUtw?=
 =?utf-8?B?cW9vVFdScFRuUk1CczV4TmpnSGFOVjVzUkY4d0dtWU9TNXc4WHVKaEQ0c25i?=
 =?utf-8?B?UUpjSXQ1R3JJeERpWWVwelVPdlU5bGkzY1p0cFJOdEpFRFoxUmwyOU5UTGRQ?=
 =?utf-8?B?MisyMVdWSmRCeklUdkswanBJUWZtVENmVzdyamlzZ1RncXVRZUpKaVNmZ1BU?=
 =?utf-8?B?S21yeE5aTjQ2NU9lUFJxejY0N2RwclI3L3kvMDY0UkcramcxZWhlQU93TU4r?=
 =?utf-8?B?ZlZIK0VmMTNnREpUWTNObGVCbE5iV3ZHdUFPMUxXZ3Jqb3diN3pyN0I3SURU?=
 =?utf-8?B?Q3dEOHZYS1NpajFuTHNJajRVa3N6bHVQRjd4U0lYMkhFVE1KdVNPUFo1VVVK?=
 =?utf-8?B?TVNIZmNmUmo1bjhudllKOFNWaFRaM1VpSnBKRTVwd2R1WEVxdDJkekFnUGNh?=
 =?utf-8?B?V3NVL256aDJYK2h5bGpzbEF4WEtUVmc1aUpacWRDYXdMd1BxWS9nVENjcGN6?=
 =?utf-8?B?QnZsUTlKblpJb0l2QU9MOC9McTFQYmR2SC9XaXlnREVOUGFhc2ZQRTNQVFlY?=
 =?utf-8?B?UWZqNnFidEF1d1VOTjBaTWd0c21KZ2RNZklHc09iVFVvL3dhWEJDNWovNzBK?=
 =?utf-8?B?ODVvWXQrc3U3bVhIZkZZdnVXa1ZzOEwwRVNoZUJXQ1lKSXZPQkNhMUVWK2th?=
 =?utf-8?B?UUZxR2JQZ0pQNVJFKzNxNHY4ZFdDRVFwQTdvQXRacThydUtMaTZoTS9pQnJV?=
 =?utf-8?B?b1JIcnd5QnlLaE9nTVZ0V3hyNzJadENmaUQxTmVQWThwc0VlUzNXTWFJbUNp?=
 =?utf-8?B?Q3pSVXpOL1YrZGU2VzlvZGx2MFJUMFJDWVR3dUlEcy9sVVFkalZ4SWJENDN1?=
 =?utf-8?B?bDFSaG5lTEZXdmVseEtvK0NHWE0zWEpqSEFFWjArTnpQU2labUFOZXRBMkVz?=
 =?utf-8?Q?YmkKL8rDksGyRTONOje6JbaSk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6eacd4-4b27-4bee-c459-08db822a350e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 16:16:39.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIU4TIlI0gmbpYmH75sNr1jgAfy2q2L17gkNK/BA+sRL/D2lD1RWCXQlnhc39GthtviFa5NvN+60oIpecRObfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6809

On 11.07.2023 17:43, Ayan Kumar Halder wrote:
> On 10/07/2023 11:08, Jan Beulich wrote:
>> On 07.07.2023 13:35, Ayan Kumar Halder wrote:
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -1342,13 +1342,9 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>>>           }
>>>       }
>>>   
>>> -    if ( !skip_amt )
>>> -        return -1;
>> This special case probably needs retaining in the new model (with an
>> altered return value), such that ...
> 
> Does this look correct ?
> 
>       if ( !skip_amt )
> -        return -1;
> +        return -EINVAL;

It's hard to say without seeing what else changes are done to the patch,
but at the first glance this looks wrong. If you change the function
along the lines of the initial patch, then likely this wants to be a
positive return value (to tell "failure" from "success" as well as from
this special case).

>>> @@ -1527,13 +1523,13 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>>>   #ifdef CONFIG_HAS_PCI
>>>           if ( strncmp(conf, "pci", 3) == 0 )
>>>           {
>>> -            if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>>> +            if ( !pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
>>>                   return true;
>>>               conf += 3;
>>>           }
>>>           else if ( strncmp(conf, "amt", 3) == 0 )
>>>           {
>>> -            if ( pci_uart_config(uart, 0, uart - ns16550_com) )
>>> +            if ( !pci_uart_config(uart, 0, uart - ns16550_com) )
>>>                   return true;
>>>               conf += 3;
>>>           }
>> ... e.g. here you don't suddenly change behavior in unintended ways.
>> Prior to your change the earlier of the return paths was impossible
>> to be taken. That's likely wrong, but you now returning in the success
>> case can't be correct either:
> I am afraid I don't follow your comments very well.
> 
> pci_uart_config() returns 0 for success. So we need to check "!(pci_uart_config(...)" to return true.

But you cannot return here in the success case. You need to acknowledge
that in the original code a kind-of-error indication from the function
is converted to a success return here (which was impossible to happen
in one of the two cases, in turn causing extra confusion). So changing
this is a two-step process: First it needs to be understood what the
behavior ought to be at each of the four call sites. That behavior
likely isn't going to be the same in all four cases. And then this
needs transforming into the intended code change.

Jan

