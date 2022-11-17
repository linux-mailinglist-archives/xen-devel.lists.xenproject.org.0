Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396062E207
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 17:35:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445304.700446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhqd-0006Ej-Ct; Thu, 17 Nov 2022 16:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445304.700446; Thu, 17 Nov 2022 16:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhqd-0006Ck-9x; Thu, 17 Nov 2022 16:34:43 +0000
Received: by outflank-mailman (input) for mailman id 445304;
 Thu, 17 Nov 2022 16:34:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovhqc-0006Ce-3e
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 16:34:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb719363-6695-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 17:34:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 16:34:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 16:34:37 +0000
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
X-Inumbo-ID: bb719363-6695-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6kLP7lS2IuAHEP7WHtXt1G+awjYY/ct1xcCQIiIVAtvgmeVKkyjBm3D6toZKq8HHjaLgDPZziiOT9xZxFchjtjtra+ZpKhWWg1TFLVDoFkIyK2hIG+SZtY8nk2ZyC5NdHqxcGlA1xhr1vpK/+ZLmYZGlidKiqz+BjOfGxLwNNvZTA/ZA5ZI5/J0H5xQFdGmTygBQswEKyMr5DcWUhPuiDmx4hClbohmUSOp7tBGYAT5UdHEU7TIRHL5SuH4DZSiX+mDIyxXWQd/kagI8OmZKb9P50UMSvoYMafW1YxQS21C+1JvTI5PMG5ECK195aYTxk0UF+G9ZjNNrdLMryrOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKBTGsj+MVzS9O6jND3KpysaYaMH3oCjLdcjdJhFBy8=;
 b=eebEEIIBKvjsOlDJCqi2kBsIjNcNtQWhZPooGnYbTnu8sCGUv9ydd9SgGMNilmKLwIdkpRzzfC25IvKUACO85QSs9uL6RCrb2CfGO9NLR0Cle4/KF+iuBezCkWzfJEIR+Dnrcf1cIPhpvxFKDOmTQ07yM69879mYxmLhSNGqWbA0UYS7safvE/Dz4wNolj7TdNWdrzTOtsT2MOthCg8t0U+ynX//O2WFsoelI/eDp/7hTbdJpoA61EjBSh0txd3RcUaKQ4o5tThY438wL3+RwRIJJLySJzcR1tKSg3JsnQe48QGXvV8dohVEr7kAne/aYOLHHYY/al9gYawpkqTX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKBTGsj+MVzS9O6jND3KpysaYaMH3oCjLdcjdJhFBy8=;
 b=hBuijunpyvusXKO7q+c4ED6EJI8cdpNkvSBqg72CqFduIO1CfwKM4qI37RA8qS8RYgLuKD5bld3Ipi+EepOwU5zTCb0l9P3UCPOsECeMCsTDe5mHyuaNb3oXGF4KsxxcrPo8lV4Bp0MuRUU9DcTkJmUNm5SYtIxvN7vBEmMpHdpcw4xI1wzvL3r5bzXY/xZ8kxFNGtJ7Q05fD44BOh4N2rDCoRdoTBHa3j625MsFkUPiNcqthJsvc8q/a0NF8MJgzSvnZhGMWzZi4J5dbbm7N5HGfSs5RVAyX/tuT9iwQs237MJm7LOQrbajOyBkZgPrnc1NcKbUyZUv0RP6g+x3BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15138618-5cb0-8304-a56b-cb787e187772@suse.com>
Date: Thu, 17 Nov 2022 17:34:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] x86/msi: Allow writes to registers on the same page
 as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221114192100.1539267-1-marmarek@invisiblethingslab.com>
 <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114192100.1539267-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a96d224-5455-4704-1b30-08dac8b99e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lDpajbHNo+yDi3dbtEedhTN9azhHIznvEoPZTEgVqUICQ1SMb8QXNVmUZ3uXQqFMzRifNjwNF1NGZTSfKtfzowbAkkglvkJInNZMvQKiVM+MNYzPZ7jln4Rl6z1DE91o2ahMkYDo2HuKFIqmNpGk1Sm4wXwypjY9J0Ia9V2z21lMSLBfWacQLs+tpD8yYI15qGlMor1+bz/wIylKPmFk47+z/mq1SiOMtc73M4gKHXSLQBujIDwNduFHGnpuZdEiLWK+TEGzzTYIPWJ2w4F6xWVHUttdjqVQh8hLIoAvNxCYfnusGgoaaOS7kzqj83AZdLDkDoHxWPjl3DcNzsQYftor51Ark5okFMmGD2rQ2feOSOEcq6jdJBzhc4mIETe1Czn+SW7d7LMFRolZMKIpVKeaznfbzSv++uYeEm3muSpqVAlprYeRvH/NoLevFJjjhPjhZhy/w1q6r8eZmQ0gzdBb+CTGrk1QmlOn/QJ1272tfV3JhLwoYDHMRdVJetg39Fq3A/al7Bc4z+irJx/HYkdZ0mhwTz09C5QYrfa1wa3ZZlkROXEkf6RsOz85h+CO7jhm845AdYlYHC/odcR3qVuNOTLdihIZefTxhdtl1l+yNn0PBTFG0g03tVNkNRu2R47jqBgNrV/+7OplVCf1lwkvF/kJjuIOkzZyVVL4/gHA7uM8nr1AfeVjKLgC5vpSABOKm7s6VYL6P3pkIaLtuGzqUfLxhfBca6Xar53XfeGfpZFNEPd26NsdRRICL4Ye
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(478600001)(66899015)(6506007)(31686004)(54906003)(6916009)(6486002)(36756003)(186003)(2616005)(41300700001)(8676002)(316002)(6512007)(53546011)(4326008)(66556008)(66476007)(66946007)(5660300002)(26005)(8936002)(86362001)(83380400001)(2906002)(66574015)(38100700002)(31696002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzhpaVJjYmFnMkpia2RIZmFZMGdaZWRHTjdQVGlKV3lGWks0V0hVc0ZTam04?=
 =?utf-8?B?ajNTVlJRRC9YbkVTTXJVNVhMRStOeUtBdVZ1MTVOdU82NXNFZmR3NTE0SVRE?=
 =?utf-8?B?cnFEdDJpK2xzMnR0QVhxV1NTazNsTTJuV3FyYlJIZjNEdENhT052QUo0aUh5?=
 =?utf-8?B?TTg2UUZub3VhUHJzZTUwSmQ1cUpXZnJrc0pnMytTbzhybWJ5WW9heXhONjJW?=
 =?utf-8?B?UmZnM0M2TnQ0eGE0WDd6WUpGWUFINGlYcW9xTTVveUhielhPcnpqYitQQXhi?=
 =?utf-8?B?S1JFdE9rekFnbXZ6cXI1MWw2UGQvT0pFbzMrYWwvcWpWb1F3WXZkQ2l1amYr?=
 =?utf-8?B?QUVrVk0xZGdIalY5bTBDNGd6MlBkVVBYQmdLTlJ6WG1VNnVzTzhZaTNzK0Fq?=
 =?utf-8?B?QzRpTXQySEhUMXNyc3VuanFiRU40TFhlRWI2T1lEZU4wMEJtWGV5ZS96V2xO?=
 =?utf-8?B?YU8yVGFCc3FKbTRmZHlmODBLZkhUK0M0cGVMWmptbDFiclI1R09OSUtPaFUx?=
 =?utf-8?B?V3lVTndHeVQrU2pRSmdic0VzNWVQVTRHZ25Ia2tXZXhvT29IdFh1dnNPOXFM?=
 =?utf-8?B?OEVWZms3Z2lUSGo2Kzd5QUtLODVCNlI0ajhYb0Z1RHNSQnZSVzNmc3MvU0lV?=
 =?utf-8?B?KzFHdEtTcDd4M0dMMzIweVFjb25yNzhoNUx5bS93dXI4UHN1TjF0eG10UUNH?=
 =?utf-8?B?OW03UE5vYjVsNXRXNE14MDZOZFJuMVlFUWlMQnBXSVVRZzlkaG5yNUVwK3Q5?=
 =?utf-8?B?OXVKakNmVFVGZ1J0VmtIY3NkVk4zbllMamFMdzYra05rZ2QwL3JSU0pmQzdE?=
 =?utf-8?B?TnhpZmJZa1NwUitya1VjNkg1NytBWkRrZjZhZUR6Q1JOcEZOUEQxbzRrSFhl?=
 =?utf-8?B?RWt3djZQbllXNnRnY2UxYlZBZlB3MFEwdWllamFGbDV4R01jdFRKRWN1TWdJ?=
 =?utf-8?B?YkNlRHh6VW5jZW96cjlFRGs2MU1CaFJ4aFY0V3NJbDdhNzN4bnJwT1BHbDF4?=
 =?utf-8?B?L3hOZDgzcHgxQWMzT1NmTzRNTk5kbk9OY0x6VFhZRVRRTXZHdUpqVGtWQXhs?=
 =?utf-8?B?WmVVQVZySGJEY0pIQWw3L1ZzTzl5UlZxd1Y5Y3VIR1lrTnRxVlBLMHBaR0Zk?=
 =?utf-8?B?TXprNExxaVY1MkxKa0ZxRFhRenJpUUtVUFZmZFBQdVU4WUNvZHFrV1gzV08v?=
 =?utf-8?B?czJrZUZGdE1hT05vazRCcHhjZVNXTU5UYXJmNGVVaUM1QnlYS0g0RG9IRFd3?=
 =?utf-8?B?eW40YnV4QVBvdXdaQjlDQVNhZ1NNYkx2T1ZmbkN1cEd3SUhqRHpqbmFvaDNF?=
 =?utf-8?B?dVJwSXpMaVZFZW1aNC9RaW1tYVlxWENOaHVHVCt1eVFPemtVTEFpTG1tamg2?=
 =?utf-8?B?aEZGSzFSb1JvV0J6QzdyVFlrYTRvNE1pVHF6TG1pMVdZVWFJMG1Xa3V3TWV4?=
 =?utf-8?B?YkhhcFVJdlozV2RnQm1lQXpYcUJEUUx1bERPbUtEcFJ4RmgxVzVqZjRVbUR1?=
 =?utf-8?B?ZkhMcjkwUHdIeStCMU03REFCMUlkT1lGYTBDQndTdXlKcWN1THluWUxERSsw?=
 =?utf-8?B?TDdRcXo5WEpaT3JlU2FHUU8xNXJTTG5SZ3Z2azg4YmZCV01CMGdsaHl1SWlt?=
 =?utf-8?B?T3ZmVUZReUh5UlJibjJwL2Y0ckdHaEkyYVkwcUIxT1pXeTVicnN0b3B0TCtF?=
 =?utf-8?B?NFhzWG81YnZiMExXRisxVENPNG80NTIxVDNyV3Y4ZkszMndQRFhOU0wvRSt0?=
 =?utf-8?B?eVc0bURRd0N4RUJEZGtINEhiYnNhSDZJMlZIWk1Hd0xUOGZ2dzVDZzdEdkRC?=
 =?utf-8?B?R3pRaE9BME41L3ZWUTVCZVJSS2hLRzFxS0dWMWZIYmJ4ZnNPSjJMekErbTdp?=
 =?utf-8?B?bmNLd0VYNGRIUE5yQjhhU1hmN295Ym5XazA5cmJldEN6QnJ5NW1UQU45Z0Zp?=
 =?utf-8?B?MzBCeWM4TDJMMEQzbUhMMEVBTnRsa3JITWRKbnk3VCt2clRjcTNaREIyNnE4?=
 =?utf-8?B?NWhOM2FGS3ZSajlQcCtrYzB0ZEx1V2N1V3hjaG5IakJwbUJJeG4yNGYyOHMy?=
 =?utf-8?B?YURJNk9MWUNLSURLT2tJV3YwSC9NejFSRVRnMEtMSVA3MTZGU25EbFpTMnJo?=
 =?utf-8?Q?AWGwHFbkQes9Pfl9/gM51vL1L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a96d224-5455-4704-1b30-08dac8b99e51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 16:34:37.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyl8k47wyQcx2eYCRYyS5qGDvRhmAa+Pvk/ZKJlnSfQW7XbFB91G0O1JH3lgn8+RY+yiCrjgyw3EBUd1XohCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574

On 14.11.2022 20:21, Marek Marczykowski-Górecki wrote:
> Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> on the same page as MSI-X table. Device model (especially one in
> stubdomain) cannot really handle those, as direct writes to that page is
> refused (page is on mmio_ro_ranges list). Instead, add internal ioreq
> server that handle those writes.
> 
> This may be also used to read Pending Bit Array, if it lives on the same

"may" sounds as if this would be future work, yet ...

> page, making QEMU not needing /dev/mem access at all (especially helpful
> with lockdown enabled in dom0). If PBA lives on another page, it can be
> (and will be) mapped to the guest directly.
> If PBA lives on the same page, forbid writes.

... here you say you actually handle the case (because otherwise you
wouldn't need to distinguish writes from reads). It is only ...

> Technically, writes outside
> of PBA could be allowed, but at this moment the precise location of PBA
> isn't saved.

... this part which right now you don't handle. I have to admit that I'm
not convinced we should take such a partial implementation, especially
if there's nothing recorded in the log (making it harder to tell whether
something not working is because of this implementation restriction or
some other issue).

> --- a/xen/arch/x86/hvm/vmsi.c
> +++ b/xen/arch/x86/hvm/vmsi.c
> @@ -428,6 +428,133 @@ static const struct hvm_io_ops msixtbl_mmio_ops = {
>      .write = _msixtbl_write,
>  };
>  
> +static void __iomem *msixtbl_page_handler_get_hwaddr(
> +        const struct vcpu *v,
> +        uint64_t address,
> +        bool write)

These want to be indented just like ...

> +{
> +    struct domain *d = v->domain;
> +    struct pci_dev *pdev = NULL;
> +    struct msixtbl_entry *entry;
> +    void __iomem *ret = NULL;
> +    uint64_t table_end_addr;

... function scope local variables.

Also: Pointer-to-const for the first three local variables? And maybe
omit "ret", which is effectively used just once (as you could use
"return" at the point where you assign to it). Also you don't further
use v afaics, so maybe have the callers pass in const struct domain *
right away?

> +    rcu_read_lock(&msixtbl_rcu_lock);
> +    /*
> +     * Check if it's on the same page as the end of the MSI-X table, but
> +     * outside of the table itself.
> +     */
> +    list_for_each_entry( entry, &d->arch.hvm.msixtbl_list, list )
> +        if ( PFN_DOWN(address) == PFN_DOWN(entry->gtable + entry->table_len) &&
> +             address >= entry->gtable + entry->table_len )
> +        {
> +            pdev = entry->pdev;
> +            break;
> +        }
> +    rcu_read_unlock(&msixtbl_rcu_lock);
> +
> +    if ( !pdev )
> +        return NULL;
> +
> +    ASSERT( pdev->msix );

Style: ASSERT is not a (pseudo-)keyword and hence should not have
blanks immediately inside the parentheses. (More instances further
down.)

> +    table_end_addr = (pdev->msix->table.first << PAGE_SHIFT) +
> +        pdev->msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
> +    ASSERT( PFN_DOWN(table_end_addr) == pdev->msix->table.last );

What are you trying to catch here? I ask because the local variable
exists just for this checking afaics.

> +    /* If PBA lives on the same page too, forbid writes. */
> +    if ( write && pdev->msix->table.last == pdev->msix->pba.first )
> +        return NULL;
> +
> +    if ( pdev->msix->last_table_page )
> +        ret = pdev->msix->last_table_page + (address & (PAGE_SIZE - 1));
> +    else
> +        gdprintk(XENLOG_WARNING,
> +                 "MSI-X last_table_page not initialized for %04x:%02x:%02x.%u\n",
> +                 pdev->seg,
> +                 pdev->bus,
> +                 PCI_SLOT(pdev->devfn),
> +                 PCI_FUNC(pdev->devfn));
> +

Please use %pp.

> +static bool cf_check msixtbl_page_accept(
> +        const struct hvm_io_handler *handler, const ioreq_t *r)
> +{
> +    unsigned long addr = r->addr;

Any particular reason for having this local variable, which is used ...

> +    ASSERT( r->type == IOREQ_TYPE_COPY );
> +
> +    return msixtbl_page_handler_get_hwaddr(
> +            current, addr, r->dir == IOREQ_WRITE);
> +}

... exactly once?

> +static int cf_check msixtbl_page_read(
> +        const struct hvm_io_handler *handler,
> +        uint64_t address, uint32_t len, uint64_t *pval)
> +{
> +    void __iomem *hwaddr = msixtbl_page_handler_get_hwaddr(
> +            current, address, false);
> +
> +    if ( !hwaddr )
> +        return X86EMUL_UNHANDLEABLE;
> +
> +    switch ( len ) {

Style: Brace on its own line please and ...

> +        case 1:
> +            *pval = readb(hwaddr);
> +            break;
> +        case 2:
> +            *pval = readw(hwaddr);
> +            break;
> +        case 4:
> +            *pval = readl(hwaddr);
> +            break;
> +        case 8:
> +            *pval = readq(hwaddr);
> +            break;
> +        default:
> +            return X86EMUL_UNHANDLEABLE;

... the body un-indented by a level.

As to operation I'm unconvinced that carrying out misaligned accesses
here is generally safe. If we find devices really needing such, we
may need to think about ways to deal with them without putting at
risk everyone else. At the very least you need to make sure you don't
access beyond the end of the page.

> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -961,6 +961,21 @@ static int msix_capability_init(struct pci_dev *dev,
>                  domain_crash(d);
>              /* XXX How to deal with existing mappings? */
>          }
> +
> +        /*
> +         * If the MSI-X table doesn't span full page(s), map the last page for
> +         * passthrough accesses.
> +         */
> +        if ( (msix->nr_entries * PCI_MSIX_ENTRY_SIZE) & (PAGE_SIZE - 1) )
> +        {
> +            uint64_t entry_paddr = table_paddr + msix->nr_entries * PCI_MSIX_ENTRY_SIZE;
> +            int idx = msix_get_fixmap(msix, table_paddr, entry_paddr);
> +
> +            if ( idx >= 0 )
> +                msix->last_table_page = fix_to_virt(idx);
> +            else
> +                gprintk(XENLOG_ERR, "Failed to map last MSI-X table page: %d\n", idx);
> +        }

Could we avoid the extra work if there's only less than one page's
worth of entries for a device? But then again maybe not worth any
extra code, as the same mapping will be re-used anyway due to the
refcounting that's being used.

Makes me think of another aspect though: Don't we also need to
handle stuff living on the same page as the start of the table, if
that doesn't start at a page boundary?

> @@ -1090,6 +1105,12 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
>              WARN();
>          msix->table.first = 0;
>          msix->table.last = 0;
> +        if ( msix->last_table_page )
> +        {
> +            msix_put_fixmap(msix,
> +                            virt_to_fix((unsigned long)msix->last_table_page));
> +            msix->last_table_page = 0;

To set a pointer please use NULL.

Overall it looks like you're dealing with the issue for HVM only.
You will want to express this in the title, perhaps by using x86/hvm:
as the prefix. But then the question of course is whether this couldn't
be dealt with in/from mmio_ro_emulated_write(), which handles both HVM
and PV. Which in turn raises the question: Do you need to handle reads
in the new code in the first place?

Jan

