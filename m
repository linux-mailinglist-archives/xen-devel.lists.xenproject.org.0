Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8DE6CBF3A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:35:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515750.798894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8X0-0004sm-JM; Tue, 28 Mar 2023 12:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515750.798894; Tue, 28 Mar 2023 12:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8X0-0004qs-GO; Tue, 28 Mar 2023 12:34:30 +0000
Received: by outflank-mailman (input) for mailman id 515750;
 Tue, 28 Mar 2023 12:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph8Wy-0004qm-UA
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:34:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0833ca3-cd64-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 14:34:27 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 12:34:25 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 12:34:25 +0000
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
X-Inumbo-ID: e0833ca3-cd64-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRT7IU1ZFyt70tMRmOqM1f///gH1SJf3I9X0+H0I8s513qqcOV6nPjCKY3RY0BvxjW8lv5e7DvZudU66CRV3nTGp+SzgTiGCQ4x55ouHuLY1KejLYzvBesNmeiGtg5JCvj8xFZycqP8x2gjOAdc3oSA3E6H863dZ8E+5+i9E7BmBGCjxZGzUHy+sJpP6ePUUOaFDA6dGGzPy2marQzt1jpZbTNkk5NvEUV9vki7yKme7TlvJ7pLefYTNIK0ualzF0I9+VCclYnOmnJDOX7UrdtC4EhjRBSziMFXd/AePaP1VjUq5q4AzwOJ2OIO5Wp4ZiBfwJjtTbkmveKTCChYSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR2v+k5b+UTUIkeAzScGiORhaXWTD8V42v2z/uGuu1o=;
 b=SPb1B2UqlviKnemPgtFR/UFWRqENOgZzVc9ohWRy2OLcwx9vUnXrWFzf46BJ+4u05GTdTA0Yd+NQMK1mtDU76r8b44a+81s/ERybzZ7r7y7XeS/XDA+/zm/S1Br9d25+2hKaS9dg2gLtSZ2AxTj2/sHz3jZQWfgIHdw3gmVcfJp+EVUX2NNuoJx6J+W5fL46Ef8Q4QfyYkfEkBX2WH2qbSbTamCnhFY9Lk3Co129mjQOZKa3yJuwv0Ii1AgbVyf0RlkLXxXXcB7e4FEsVlz7Z3QDX4EDYfoICXTCrA+r3UG5qsaSSJIsPMc+fYl6qGJRWHIqhEEWsFuIiImeujECqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR2v+k5b+UTUIkeAzScGiORhaXWTD8V42v2z/uGuu1o=;
 b=hcRgw/psnnLFIbcshDTNE8KQiHcOCXOuqSt6MmakG6ns95lBtDOvm7hDCEiaMX9A9K/eYsPLV5YTCNK6mepZo71k3LEKagpEcQ0ufnmIXlGsIiNYxyoeV9F2ZCl/QI/oW9ylylGd5Zt3qYaPo/LvltqvDPRmawwpL0KtNeeybQfAoKZOwH+L1/pN2dbWaCdG0seD1+jR24quWn+HhxjmbBRaaJ682DdcxwDMk+kMnB/AxYY8dCjcmCk5IvD2r1e4RyHFimVD/WG7wGFogFbNufPIzz9Ogqan3kNFvo3ZjOjTZliqYNpNKKxdscS/4wtxMQAzCTgBzL9bEbP3cQA2+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <540906f7-4543-9d01-2b2b-a3bd70eda74b@suse.com>
Date: Tue, 28 Mar 2023 14:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] x86/hvm: Allow writes to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-2-marmarek@invisiblethingslab.com>
 <ZCLNQGXvUBxZbIGS@Air-de-Roger> <ZCLX1qD/FmbF5ulu@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCLX1qD/FmbF5ulu@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DB9PR04MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fd51b0-064f-4dea-3687-08db2f88c3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c7mvjAPNKWF4Ru1taQPUpTKPGuf3x10+ba+quWh0enLFQ1nQSX4swSl31K/IZtGA+D1x6b0atzo0amtn5OIrhYlyjAxy8wqFYCsMqrPH1Lijsekoeoa9Fwz8M031elmI9zR7H2LIeDfoNpk482haSR9cruyCr9SRVRGYHt4RR0LZ/FY/6ddr2RmBPbfeyQmfqqmLJHqra//s6L6kB+604uJUOUASBNqI5OiJHRSK5vyxcYu0y3F+C6h/H901foe/kIRczujKYrzShnIsbalJBHHI6EM8gZLaEM6eiJZJ9Nv1Axawi7I0Ez8wiPUlRLcresAz4+Y5+rLkky/332N2ZvSrKacaVJ/gsMgqoE1fo2bfkytps3cFTc5C+a3Ni7ArsvPjFhXrkWoE/ZY1KPu+0hZRuBUV96EDcn8YF/m10zU8xxNZko8EDTyXzb+i4mzIGMa2/HtNfMgvdf6G58qZTzZjIZKD4F/tdNUzDujmpku6x0wmkKnLdmm3ja+sG/0+Mzp/LSs4pkfsOXzlEcYiB5zvmQ6Y3RKTR+nJVVNJN5lWvdl2mYWhf62h9jKYjZJTPh3LEV1/toNiHFpguHZX6U3VZtRYicn9qaX5+vcGcsC10RRNlQKwxSZNTNgVbWGkByv3vh76NDEa7lsM/uTPMihqWPgWgdP10ncMBI/CJSg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(2906002)(38100700002)(478600001)(86362001)(31696002)(6486002)(54906003)(316002)(5660300002)(66556008)(8676002)(4326008)(66476007)(6916009)(66946007)(8936002)(186003)(36756003)(6506007)(41300700001)(53546011)(6512007)(66574015)(26005)(31686004)(83380400001)(2616005)(66899021)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clJDK3lrQzhncE11VHNqSmlpU1RRQ21wakZNMXp1TTJaMmxnK0g3V0RXVm1u?=
 =?utf-8?B?czNyQ0lRVDBmek0yQ3ZMQjRGMXN4Z0lmbHRoN28xWmxhbmxOOUJsQUgwSlI2?=
 =?utf-8?B?THhOclNUWVFmaE1JUHg4YmMwWWJyM2VsM0dkSnRQME1EK2IxYnNxOWZXT0JW?=
 =?utf-8?B?QnRGK0NmUGZsNTlCL2dFbGRBVjFEaGJhclRGSjRxZVVUWUN0QmMweUlBa2wz?=
 =?utf-8?B?aEFXdldMMWhVNWIwSy9jN05LdFF4RWtkajdFbnV4ckcxL1BvdVRHUHFMcWhn?=
 =?utf-8?B?amIyREl3QjNDZTFjbDdnMDNWdGJIZEJiQUNaaUFVelo0c24weGs4cEtnNXJO?=
 =?utf-8?B?eTkxS2ZJM0Q2LzR3dUFRZmhDMWlNNGFxRk1pd3hmVmhLalJrdVNSckNLcVdl?=
 =?utf-8?B?enVPTEo1MGVNeU53cGVRRFI1V2ZJSTh0bTVPSmV1aWpmNHQxMEo4L3FWV2Na?=
 =?utf-8?B?eUlNZkphZGtaSFk0U1JQMHpVNXJjazJ2MmttNTh0anp6d2hMWTRhVENreHF4?=
 =?utf-8?B?cnFNeEo3cGpBSUNkTzV3VGNicmgxYnhzQXVhYzNjRFlYakd5eUZicGNhU3dw?=
 =?utf-8?B?T1FwQXdyTzdjRU1qOGFveS9NVE40bzZVRlpGVGhmSm5rK2ljbHlLOFdqNUV4?=
 =?utf-8?B?aXBla3BYdlhuY3lEbG14ck1iSkdYSlpPNDJ1S1IyQ0dJTDVWdDlLQjltcEE0?=
 =?utf-8?B?NytHUnBTVlZwR210YWN0cWIrbjBWaVF5c3N4NFNDZHo3RE92OFBzZkZ6Qk00?=
 =?utf-8?B?RFJQQTl3eHRIeU1heVlabE5nT2VYbUJBZDZEYWFYYXQrRjB3aEYzZytpV0NE?=
 =?utf-8?B?YXhZRSt2dnFiMDNQZmRDNDdsWU55c1NZdkE5US9JcUdUWFZPcnlnekp4VU56?=
 =?utf-8?B?TW1QdDVYZ2JEcForTVpRK21oT3pTRmh5dGk0R3dpUDN5V1FhVm8zeEpncWdY?=
 =?utf-8?B?MkJqejJqQzR3aUI4UkVybFU0bGU2QU1pNTJMcDhzcmZ2SEhyeEFBVC9VMVB0?=
 =?utf-8?B?eTZZa0pScVhNNEZwQ010QlI4UndScDMxUjQ0ZTF1STRDaTdpaEFpWHM2bWli?=
 =?utf-8?B?anYrVXdjeFdXVXNwVmYwVTBVei8xTjBaVyt6UEZjaGhJNmNKc2daUG1ibnpt?=
 =?utf-8?B?RklnYW5KV3Z2Z0UzYmQwS0ZRYnUvMGxOeXRhalQ4a0EzQmJ3ZCtFUE50dTlO?=
 =?utf-8?B?QTFIeGdBM01Wc0lxS28vc24rVmFkS1J3ZWpCbnNPampaL0tqNGZ1NnI3Snc5?=
 =?utf-8?B?WUtlV1QvaElVdHlOOEVLNU9vN0FPYllZSXBEUHprSTE4NmZqV3JhOTlJcVBk?=
 =?utf-8?B?TGJMZFRBaGVaaTBZcmUzT3V2VnVyWnNYN01zUHJsSmI4NW0yZWQySWNuOUZX?=
 =?utf-8?B?V0o1ajB0S3gwQ0NPb0ZCbFdzemNWSE9VV0hWNHNLWjBoVmFvelhxWXVVVEJG?=
 =?utf-8?B?T0dreEVNS2pJQ3o5dVFpYzJNR25nNTJyV20yZGQzellUUHZyOVNNeHUyd3ov?=
 =?utf-8?B?elBpVjBtM1dVbGdyMWVleEFtM2VITkpVa2FHYURWWUk3NVNvVUg5L0hvNzVj?=
 =?utf-8?B?SXdLaTMvY2JtY3EvdDJVRWgzZ2hzL1JNNTZZVXhVSmtaY1laM213VmlxbEMx?=
 =?utf-8?B?eDJOUjVKVkVDUXhZSjF5R3E2RGU4ZmFySXdwbVprMlQ2MWZFZEorVnV2TGZC?=
 =?utf-8?B?SVZ6ZW4wajVrZHdFdGFzQi9ncmpNL3FLOFlSRVZpSkpTSDIzeUhaMlZHbDhp?=
 =?utf-8?B?U2JOTjg4YzBRbnZGcWczYXdTLzZYYVc1VHVwdUJlZlVGTi9WUFlHNmZKZVBL?=
 =?utf-8?B?K0gyeXBuRkdyRGVxYjF4Zyt5YnlTQUNLei96NmV4a21JKzhicUdMYzNZMC9G?=
 =?utf-8?B?N1ZUMElER21URktuSUVReklPb3NtM1BFdklSbjZsakdzdWRqUmlaWXFUeXgr?=
 =?utf-8?B?c3BiRThNQTZRSjJyektjTTVYU09nd1llU1MyeE55d1JhUzZBRjJOR3BBYThr?=
 =?utf-8?B?dnVkbnptUlpUQm5Rak1oSXVZSGtuQjliaEVURWZuTHp6TEtXUkZacHhaVWc3?=
 =?utf-8?B?bnZtM3dDaTRxdElsK3hqQk1YM1VoazlzTXh5dnJqQmEzeWovOStLaXBLbG85?=
 =?utf-8?Q?jhIKNXS+6ZLYMDN8QTGwM+E8F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fd51b0-064f-4dea-3687-08db2f88c3db
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:34:25.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJajquHiRjsZbeMj3cvBHfg9tT0mq87OY8DqbCu2PaJn53hPCVaLAAEBWirqv0aM3iVKJ8LCPp5DEUSIoT76Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

On 28.03.2023 14:05, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 01:28:44PM +0200, Roger Pau Monné wrote:
>> On Sat, Mar 25, 2023 at 03:49:23AM +0100, Marek Marczykowski-Górecki wrote:
>>> +static bool cf_check msixtbl_page_accept(
>>> +        const struct hvm_io_handler *handler, const ioreq_t *r)
>>> +{
>>> +    ASSERT(r->type == IOREQ_TYPE_COPY);
>>> +
>>> +    return msixtbl_page_handler_get_hwaddr(
>>> +            current->domain, r->addr, r->dir == IOREQ_WRITE);
>>
>> I think you want to accept it also if it's a write to the PBA, and
>> just drop it.  You should always pass write=false and then drop it in
>> msixtbl_page_write() if it falls in the PBA region (but still return
>> X86EMUL_OKAY).
> 
> I don't want to interfere with msixtbl_mmio_page_ops, this handler is
> only about accesses not hitting actual MSI-X structures.

In his functionally similar vPCI change I did ask Roger to handle the
"extra" space right from the same handlers. Maybe that's going to be
best here, too.
>>> +    hwaddr = msixtbl_page_handler_get_hwaddr(
>>> +            current->domain, address, false);
>>> +
>>> +    if ( !hwaddr )
>>> +        return X86EMUL_UNHANDLEABLE;
>>
>> Maybe X86EMUL_RETRY, since the page was there in the accept handler.
> 
> How does X86EMUL_RETRY work? Is it trying to find the handler again?

It exits back to guest context, to restart the insn in question. Then
the full emulation path may be re-triggered. If the region was removed
from the guest, a handler then won't be found, and the access handed
to the device model.

>>> --- a/xen/arch/x86/msi.c
>>> +++ b/xen/arch/x86/msi.c
>>> @@ -961,6 +961,34 @@ static int msix_capability_init(struct pci_dev *dev,
>>>                  domain_crash(d);
>>>              /* XXX How to deal with existing mappings? */
>>>          }
>>> +
>>> +        /*
>>> +         * If the MSI-X table doesn't start at the page boundary, map the first page for
>>> +         * passthrough accesses.
>>> +         */
>>
>> I think you should initialize
>> msix->adj_access_table_idx[ADJ_IDX_{FIRST,LAST}] to -1?

Or better not use a signed type there and set to UINT_MAX here.

Jan

