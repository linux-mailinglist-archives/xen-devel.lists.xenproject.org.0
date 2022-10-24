Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911A560A327
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:51:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429024.679769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvz5-0004cX-UI; Mon, 24 Oct 2022 11:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429024.679769; Mon, 24 Oct 2022 11:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvz5-0004Zs-RF; Mon, 24 Oct 2022 11:51:11 +0000
Received: by outflank-mailman (input) for mailman id 429024;
 Mon, 24 Oct 2022 11:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ny4u=2Z=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1omvz4-0004Zm-6s
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:51:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2480c4fd-5392-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:51:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9177.eurprd04.prod.outlook.com (2603:10a6:10:2f4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 11:51:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Mon, 24 Oct 2022
 11:51:04 +0000
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
X-Inumbo-ID: 2480c4fd-5392-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI3JQ6fEKNRqtfrbCCDmppLbTBt+3UoK9FGxqC12yjRujP9qajeZzBVGbX6sgCFQ0GtNJ3XBvxfYE/WOqFqdMTE40fagLIjjM7dfyRQMe0Z9EPBOSXzQAMi1Zdaa+exrqngr41bM4YS/TZB4xZrc8QA7rDKpQOdH25Wq+lAKmpoApqnxAgMyw7sA542j9ntUnXGX0MiaMg90WnWOKI4ZWl6e7MZivWtjoA89uOYXu/4y3OIdQEf7n/F0wonb2l3DUMc86PS5ZZMf6SiJtROXPMsrUqNg06lZiAFotkJp1Snu2Dqy3+Vma4d57yALXW3/ZbumTrFpwSKLl+Nz+B6Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsOO5qSa6P4tPxcKsTcuQ9ed9tIOZFLNAcr92Wgi71s=;
 b=HCYgwX8L7RP3OaZQvTl9c/rtkJtm7EoI0JEyFpRqF795B38YK+/IN8Dd3uJFdT8WMwNsD2rn9VfbZhZ/p9lHxCUWvZ9AbzeapXnkljscSjpwLa05At4eTvX5FLl7vsyRVxD9E1AFYkGBu75czGzp0qyB3TF5D25cjGowINe1Drs8wLHf5HCxHg2jR/XlAzDk72hPHV2RjcmNY4RhnILtKB3OP1K4WAVdLPSHE2bUNbcPAdkupxXJsOk37RKmGtmC/JcrNPszeLGy3ToG7Fe80F4Q01DlZcUAht6PXblLas9KJbV4fWVP4HGbBB8nQuM0Cuv3hZDJLNwrWod7HCejcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsOO5qSa6P4tPxcKsTcuQ9ed9tIOZFLNAcr92Wgi71s=;
 b=RVz9YHA4AQ41VYBh/p0lckIfo9egeXl4SqDDNUdOk8HFGBGUK32C6DbiswQLlTxGVjIVNUEucfysMH40LQGlAhLLxy1mCod8Ui0w5ZtKYs35P6MB6n+1Rc0cID6y78U0IpicwXdK7E3k+/FrcFQtyZUv+ale5NA5WcebG2TPreceDMYMfrwciHCnMxF+86R2XLnHK1FCfKvUyT4W/mTOsa73jn3jnl5gkTU4dsVbb5rJDmPrmqXd10ifVL1M96a+k5NLNzhlEpwua4N1CG1GFBCFYh9+wCBsAC1/0TGHBMcfwOEMLJJWan73tjxt/+9O5WILob2113G8Kd5RgZDjkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cc94a021-aa76-87da-0d14-e01f09377b57@suse.com>
Date: Mon, 24 Oct 2022 13:51:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH for-4.17 6/6] vpci: refuse BAR writes only if the BAR is
 mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-7-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221020094649.28667-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 12983fff-d9f6-4557-b569-08dab5b607ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPmqZdCqACgr/PmZtkqbMbrKEGuVURmXBHgEIrUrgxWMOW349jXyHRNlWV9N9MgsQFYN33iVUZ9/AffLLIJj73bMJi+wrTOamtcl+4QY2TqKdBeap9WrF+OWtunZbuk04xIJO4/zGq+ZjNGiD1ah5F7D3Mg+V3s7XdxwRDcPMY+O17Gng0s46xlmGAtgsi4IoDQ5s/h5yWCjjFDx6aMTUvAbQ4OBC0cFpZFA77e3z14oSTFd/5zEMcCFl25ZkpoeY8jvmVg7e4No6FTNKpvYeuYej0uGFWLJJdC6TP8685PTpsT3FSs92Nn3svL7RuMqVDMsv+KQjFfcHTuJq1Y8PWUG2w0PCKMKuURnslTc1yC+LaF9Ewpk28o+YAm6SeUeJs/kaxcLhati2GxBefY78fUV8MhTY9FwZL0uFui7FIqWW3uLwdJnRt81CBi3AJUYTtzBXy4UDM9fTD+hWgHkGm1ImUqe++DJ6rpY7POJ5lTG0m5CnHJ/zm2iD9BpO/xCqhPgbdrJH18C+UHiQj5raDpAXtYJ3rt81AsWUmrgGDMtomnmp6IMq7weT+ziEGyDroC0qi2gHdnJVMf0IDCWXtmQ6JCvwA8A8BS9fRb4Tn6Acg33NU+GfZckR1nVCdFo89jMUJEqWT0xswm47CV7JisOlk9ABa0AGlz/YqY6IUkSGvew2l+qhPkhrsrEZhZs2CNqI/yrQcPqEoOlLHUJgLqdiRga6ajh29N5G0pd6FpsAVVz1ii+ZIBoHRISrMEFoFkCiQ8ibR5YChrECc7ChJV5qFR141E33AOHdtqxR+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(41300700001)(31686004)(4326008)(2616005)(316002)(5660300002)(66476007)(66556008)(186003)(66946007)(2906002)(8676002)(6506007)(478600001)(53546011)(86362001)(8936002)(38100700002)(26005)(31696002)(6512007)(6916009)(36756003)(83380400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZMbDJzdW1ZZ0tzcEFoSjRoaTFFZFlNMG82Ylp5bjliUXlUWkw2SURSbHJI?=
 =?utf-8?B?S1VpV0NFNmF4OGxaSHhOZGNkUm9yMzB5Wnl5bmszMnFFRzhCQXpXZk43K1Jl?=
 =?utf-8?B?a2dEWWxrMTcwSWNxRitZS2NQaGlXSjdKUmV2cnZyT2Q4QmZ6SVNyY1Q3Ujht?=
 =?utf-8?B?ZkprY0FmL1hIV0RQU2c0aXEyNGM3dW9FTytOT1ZBMFZPa1VOM2k5cm5FL1pm?=
 =?utf-8?B?MEV4aXF5aS8wOE5ySjZYUXVtQWtMclVrcFdoaTdFeG9EZWdzdGxkb1VVNWpB?=
 =?utf-8?B?UXhBN1FWMTk3SzR2b3gwc0xkODRPUWVtajBMTnZSZ2F0d0M3MmFWNHpEaExx?=
 =?utf-8?B?bFRUZFZiVUtzQWJTSTIvVmpRTWEwem1MRUJMQkY4NXgrMHhXZTZEQ2s4UjZK?=
 =?utf-8?B?K2xGQlpIS2I1Rk9mRDMyLzRDekoyZ3FRWG5sdHZ0d2pXK0lVQWFwdVBOSEJD?=
 =?utf-8?B?L0s2aEY0dmFqcVovaVFnV1pzOXRyYWhTSHc3NUo2dTNkOTYvKzk2ejcxN014?=
 =?utf-8?B?VDFJRHhxZjlXNFFLVy9VVDFxZDI1dGF4S3k5ZU1sSFYveHFmUllBcUNTQU9r?=
 =?utf-8?B?THZGb3lwRndpUHdMY0pteEVqTEJ6S2NRTWd0QTdJcUI3NWN1U0ovZ3JqVnF3?=
 =?utf-8?B?eWRiNTBUZmFNNzMzTEFYTktBWi9WRVVxdDh5czB3T3VOdkEyUHA1clAxVE5z?=
 =?utf-8?B?MS9JcGNyUnhTQXcydXBXeUQ5SWRoOFc2SmFVbkN0dVZlOW1MV0puT2lyME1m?=
 =?utf-8?B?WEhhb3o1Z2dDQzRMMHFqZEtOMUhVdW5pNGIvZ3VLL2RLZTMvam5HeS90d2Nu?=
 =?utf-8?B?UkExUTlPaFFzUVM4d1Rzai9aS0dJd1plaSt2UGJhWm5IMGtDL01jdTNPSzVH?=
 =?utf-8?B?QmNaWWNqY01KQVdlQWVsMUpsdDRyZkYxWTBmSnB6TXo5UTI2UmxnaVprQjZC?=
 =?utf-8?B?OFBhMjl1WjdSUituTVQvTlZLOHBISkhmSnRzT1VXSW80QmZ3K0I4TzZtWVQ0?=
 =?utf-8?B?T1gzcElDa0w1MlRZTVZKa1g2RUQ1N01DRHhmZTRBc25tV1FuZFhBeUVKSkF0?=
 =?utf-8?B?Sk5WeW1LelNtT01jUmI0SjcxeHhtRm1YdXRPZWV1OG5UeC9ZYWVjRWtuaG9y?=
 =?utf-8?B?RkxsL3VFVkUvS2xaYWZJejVpa1hRWm03T0swTGlYMjZtMVBpMkRQN2RVbXQ5?=
 =?utf-8?B?cHZtcjUzS1hDaStZUXIzd3M1dENCU3hXeFF2TnZpbGZYRjJrYm9wNzlxUkNF?=
 =?utf-8?B?djZnNTNHcUVOejFaTm1ncWFYV0dJMjRlYjVYMm9sdE5nS2VMUTZjZjhUQkx4?=
 =?utf-8?B?U2FXQTN2Nk55VndHanN5VWI3NGw0MGJ5UC9SL1dIbnViUW15Y1Y4YVM3SEdP?=
 =?utf-8?B?NHRkZ3VVVExheEdCOTQ0TlpHWFk3Y1JVWHBybWFMSVRJK3gvVis0VDZ3c1pQ?=
 =?utf-8?B?VHBFZjJ3OVpYeHBJNUdoZEVyVXF0WGlVczZZczVoeHErYXJzQm44b0k1ZmFY?=
 =?utf-8?B?cGxUUm5Mc0xtUGpTQk4yamFlKzBoeUlldW4vYytlQllDaTBjalN5cG9HSXJW?=
 =?utf-8?B?ZWRaYXZwNllpa2MxZ2t1Y2VqTS9zMitCMFMzQlNrVVZ3cEI0UXBBSGdSRWcz?=
 =?utf-8?B?blo3QnVsdnRWeWFaZmNIZWNOSGNTb3d1V0M1WnlLcUxmZjBJdk9KYU9veURw?=
 =?utf-8?B?OHVLZkNtcVQ5SEpFdVNqRTR0Z3g0YnZwNlpScmU0SDBaY3R2bWorYWN2SUVM?=
 =?utf-8?B?TGRFVWZiaFZSK0Y5TG43ZXhIK0FXLzVpb0hnQjh6NzBsLzU1SW8zTVpMdDJM?=
 =?utf-8?B?MGZzNmc3eVRSazh6Yk4vT1RMN1YvNm5kelhHVmh3amxLd1BqUE1RN2NwQWd5?=
 =?utf-8?B?UVk4UTduVC9sc3JjUlZ1K0paMmd0NFgvcFVLeVd1Q2NzWlRDWm5Qalo2R1pR?=
 =?utf-8?B?UloxYjJ5UXk2bC9EVnR5SkpPbEkrL0VLZDg3RCswKzlVdW9Kam1Ra016d2JZ?=
 =?utf-8?B?WGdsZDdVTVU2MDgzaHYwQTNjbnVIUGpnaHRHS1hSaEJWWFp0cW1SOExHZTJD?=
 =?utf-8?B?NmJUdjh5THZsTVJsaGNncU12S2lJMFpKaDQ0Rml2T1JVK2RKUEJIcnVGZHFI?=
 =?utf-8?Q?l/07QUi5YaWwqSVGg0CJAnRp9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12983fff-d9f6-4557-b569-08dab5b607ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 11:51:04.5746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXmVphLcnV+gTM4BQqVwqV1cFCp8GYfS86gj7XXaCtk4+cAFGqCj/wxy0ews5vayKKKUvcPaxz+Q96gg3d5E/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9177

On 20.10.2022 11:46, Roger Pau Monne wrote:
> Writes to the BARs are ignored if memory decoding is enabled for the
> device, and the same happen with ROM BARs if the write is an attempt
> to change the position of the BAR without disabling it first.
> 
> The reason of ignoring such writes is a limitation in Xen, as it would
> need to unmap the BAR, change the address, and remap the BAR at the
> new position, which the current logic doesn't support.
> 
> Some devices however seem to have the memory decoding bit hardcoded to
> enabled, and attempts to disable it don't get reflected on the
> command register.

This isn't compliant with the spec, is it? It looks to contradict both
"When a 0 is written to this register, the device is logically
disconnected from the PCI bus for all accesses except configuration
accesses" and "Devices typically power up with all 0's in this
register, but Section 6.6 explains some exceptions" (quoting from the
old 3.0 spec, which I have readily to hand). The referenced section
then says "Such devices are required to support the Command register
disabling function described in Section 6.2.2".

How does any arbitrary OS go about sizing the BARs of such a device?

> This causes issues for well behaved guests that disable memory
> decoding and then try to size the BARs, as vPCI will think memory
> decoding is still enabled and ignore the write.
> 
> Since vPCI doesn't explicitly care about whether the memory decoding
> bit is disabled as long as the BAR is not mapped in the guest p2m use
> the information in the vpci_bar to check whether the BAR is mapped,
> and refuse writes only based on that information.

From purely a vPCI pov this looks to be a plausible solution (or
should I better say workaround). I guess the two pieces of code that
you alter would benefit from a comment as to it being intentional to
_not_ check the command register (anymore).

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -388,7 +388,7 @@ static void cf_check bar_write(
>      else
>          val &= PCI_BASE_ADDRESS_MEM_MASK;
>  
> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> +    if ( bar->enabled )
>      {
>          /* If the value written is the current one avoid printing a warning. */
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
> @@ -425,7 +425,7 @@ static void cf_check rom_write(
>      uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>      bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
>  
> -    if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
> +    if ( rom->enabled && new_enabled )
>      {
>          gprintk(XENLOG_WARNING,
>                  "%pp: ignored ROM BAR write with memory decoding enabled\n",

The log message wording then wants adjustment, I guess?

What about

    if ( !(cmd & PCI_COMMAND_MEMORY) || header->rom_enabled == new_enabled )

a few lines down from here? Besides still using the command register
value here not looking very consistent, wouldn't header->rom_enabled
here an in the intermediate if() also better be converted to
rom->enabled for consistency?

Then again - is you also dropping the check of header->rom_enabled
actually correct? While both are written to the same value by
modify_decoding(), both rom_write() and init_bars() can bring the
two booleans out of sync afaics.

Jan

