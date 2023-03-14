Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9C6B9251
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509558.785519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3Gk-0002Ji-O5; Tue, 14 Mar 2023 11:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509558.785519; Tue, 14 Mar 2023 11:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc3Gk-0002He-Km; Tue, 14 Mar 2023 11:56:42 +0000
Received: by outflank-mailman (input) for mailman id 509558;
 Tue, 14 Mar 2023 11:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc3Gi-0002HR-N7
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 11:56:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46d2271e-c25f-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 12:56:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:56:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 11:56:36 +0000
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
X-Inumbo-ID: 46d2271e-c25f-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmYy4nmZp0JBcl/uTtbQzy04GRPucTEOfkuDBtVYGXGSOy6vGqTb+gnMUkuAMEoA6XMRnUGAjDNdEUxxjcdkZLO1DCUEZf9ESZcllr3Q1OE65SeC95aNnEbDzQmiK9hgrGb/TVipFhR9DNblK+/w5vlgBeJzBCyc0CainmDr6TV+rscseTR5Qrcb2ADv4dh4a3od2FBv2qqoWQOB3hLzE2eRSbXJjgIiwmx5EgnD4KzBmFhQy/edF6AdjL1gd45QwPJXs9gJX5narh9ZJUGw88EsugU2WAKjsGefDtzLjaUeGBw5oWxA0jsbqfzCXcnunoWEUK3ev4P4Ekd2Pt5P4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CycMpsj2bFwh2XWHtApbCxJag+E25ba/wqRdhNUKzPs=;
 b=eyT6c8+x9PRQMwa2kCyDaaYBEdjIRVJljyu4w59fBx38yWAFu80tLG5qOfZ068DzUM7im0u7QbO34LcWapRkqyaNzSsZkvu+yIOoxHCK1DlJyOg5DkaNaPyFGC5JFl5OJJiUNwVkSaowjhGbEaumpiXhn+FT244GOO3vH1WI0dQ69bHAbMKDPTWQKLAh2dXeq+wNXcQtS/RXlD2i7kreozL1XjyHRVC2nCTtmiVDIlIfVg/B/RIxOAnGrPUqZLRJSF0FWhZLWJ/57lyNzs5WjwtUtcIocgYQ+XQvVuaC3DYbeoR1QdsigVdwfJCWAC9QcvfvgaTkoLYQpEUqKWeLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CycMpsj2bFwh2XWHtApbCxJag+E25ba/wqRdhNUKzPs=;
 b=pAXP/HhnI6j6eZIgrmujS9GldnEVRrJ+1bEAabQQ7aW+F5Vlnj0CxI/0ijp3QIdmRB2I6KMRfQwu3j/aB2/VikE6+Xqsl7q8tQp+gLb4JrCBa8lecvjbtCc7xxAFh/rwqFPJs3mHbMJXzin+17SHD9d05+NbmsYTr2hOhYPeXoOhmppTpzTZDLwMcCDwQM190zInWpr7alRK21+PAPKYoHTlLaYz5IPusDxlBTIFX2LeVO9E3iOJcHBanN+8OFb2mHcuY1KJzSIjRrYanlU9EdH5fpMGDBBdi0qoqh6mAqJIQoqDCLH8wUhptQItEGLFVssZFrnjs47xkmMxR3m+YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
Date: Tue, 14 Mar 2023 12:56:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230314101331.4194-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314101331.4194-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 98dd9eb7-71ed-4b35-57a8-08db2483296e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mHvrlVclM6ZiEc3dya3L2kboH9EWIkowCdin3HVfmfLVTm9TxZDnRE/EFHKYYNGVuFIu+LBExT+LAqWxWDdtUi/KOPbgNUuKsLO18PhxrdmL9JqeiG/qu2a95FF6qZNV0q5eZtZzGBNo18iA5zUb5R3biLZbNpg2G7iRpRNpi87ZGw6jV0iJmPCh5SgfLgzN9OOe2J4dzVA7H7DkeLlkef0LZm9L/OHZ6EM1rpNB9f7pQvPyed687h2ZEtSWSrbvvv/fylxCqoJOv3wbtx11jUCDyxgeDJHo22gWkn2ThjlYrlaiinVEDVmNh5sHzY3aw9VBda6CygL6rD238JWEbI7u3TuvCXaREkseO9rRhC2qyGeyS+QmkW2mIVo1NsIeF1LTe/Q+4rVIMKkFaAExHcDidMwEQH+NRydKjqQPeHyCZQMNZJ57TS5Kv83Rqeh1PPEkYY0/BjmJVfl9lMB0RUwJvsbrBaTgpWDGtcEG9G2dZh2qFDFglsLrJdHimRoO9EKDb39mUn7cNY5h4ANeCT17tlUNmcLwEqx7iRe7yfwvf6uKrcN9c40MiFmZ+YGCzEMqivvfUQRa8ruOKM920MSMBc+xKvF7u9Wa4g2papzICuquTTWWSeKgQUL66reb7OPifBTAIaU4yijiWK6E4B1JIoakRb2hNxc+0CwbMw5PHISEflQiqhTKOfC9ulwsuRzTuhQEaXqTJ5ixuhuIZOt617LHQ2U56OH3VIil/20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199018)(86362001)(31696002)(478600001)(5660300002)(2616005)(6486002)(6666004)(36756003)(2906002)(186003)(26005)(53546011)(6512007)(6506007)(41300700001)(4326008)(6916009)(31686004)(66946007)(66556008)(38100700002)(66476007)(8676002)(66899018)(83380400001)(8936002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmd1aWtEa3gwMGpHYUdjZlFmUHFwVnBCbE4zaFJVQnBTZ2lLZzg3TktHKzBj?=
 =?utf-8?B?cFVVNm1jUktDTXpTaDFIVnpCVFE1UVhHRUFJQS9uZnJhbkFGcHNjd1ZBZDdO?=
 =?utf-8?B?NitXZXRWM2tRWUFpSTBsODc1TkUrSUcyb1dORk9BR1k1R3pQMHE1cDl6dzhj?=
 =?utf-8?B?UlVmTC83RWV6YXdQWkRkQVR5bmY4MWllbVhsbGNvYnAyYnByMnYwOHk0TWo0?=
 =?utf-8?B?VnNBN1FIWVpiOXgvTmZXbENZckthRVNOZU5qR0lxS1daRVZvaWo1YmFMSWM4?=
 =?utf-8?B?aFZsUVZCUjJnU0ZUMzdvZ01hZiswYTJva28rL3k0enBqM05EU1dTTUdMODls?=
 =?utf-8?B?WTcyYktSbDRrcDQ1N0dSM1dNTkRJZzl3c0tqM2NUMG91K284aHdlK2I4ellM?=
 =?utf-8?B?Kzc0aGdWZFY1ZHpnMG1weUNrYkRzemJrUC92c1lQbDNEZTNFeTBmREdhd1VR?=
 =?utf-8?B?eGxnR0g4azhIZFZPMTlnM20wVVArRm1ZN1hCL0tTT1hqM21RNUFSS3AzaWN4?=
 =?utf-8?B?ODcxOGRFRVk0Szg1SmkrYmJqdTdLRFp0aTlwakdNN3prdHIwdTV2WUxQVi9r?=
 =?utf-8?B?SGFQNFRGZFRCV3dFU1Y1SDVVYWxiRC9JdzVGSWRZWVF2T242NmZvS3N4UDBU?=
 =?utf-8?B?aklzOU5uS0FVWDdobytJcWkzQlJFY2FGMWE4TlNTNDhZNGIwemNuSGVkc2pj?=
 =?utf-8?B?N01uQm5GZEh3RDNDcFlUQ1lTc21tMVRUN2Z6TEd3RXRPTHJGNzdCcVE0SGFi?=
 =?utf-8?B?TmxUY1J2NDBjK0JiaU5md3kvaXAzR0g1RkhJL1VZYVk0a3lnNkVTN2U0QnAw?=
 =?utf-8?B?b3Y4TnVUV2tqZFExUW5HSmpFcEkvQlhIcmowQmt6VTA1VnpBSURWelc1emZo?=
 =?utf-8?B?RTFXbHRsK3ZqazBidWd3Ti9ET0l4U2hmVmtwOERzWnE1c0VYZWtTUXpGK0Zm?=
 =?utf-8?B?R01TSTJEd2I1S0VYUm1SZUJ3Qzg3Y2pFZ2dhOUo1QnhPVGdHcVVKTlFCT3J6?=
 =?utf-8?B?UVQ2VE50YnpBWkx6VkZVTFNLY1N2ZUkzMmRrM3F4eFcwNlptSGQrbTFkS0gz?=
 =?utf-8?B?ZHR0VXBnMitJUHBDYklBWDBHb0VaQWtWZVdJMnJFSTgwbkhoUkdDS3hpVmFx?=
 =?utf-8?B?cU93ODZYeFN6bFFqckh4eXY1cGpYb2xZYWN2S1NMcmNxeEtJZHltRzVidUlM?=
 =?utf-8?B?STRtWDZMdFpwbXJKNkZYWmlmVFlWencvRUNnb2VsNkE1bUV5WjREUVJHeTBo?=
 =?utf-8?B?aWdONGhNdkhvdmt4STRKbE5wb0lxOWtJb2VpeGZQODVZVTE3YTloTFlDQjAx?=
 =?utf-8?B?bDM1cHVGVFdobU1LVkt3QVRLSEdKcHhsOTRaZHRyK2xXRzh2cFhIMW9MVlFD?=
 =?utf-8?B?Mmw1dHRqYkpWcGFjRWMyVjVYem5FOTVSNHRCWHhZK2xZcDJRMXRyWkJWeXlK?=
 =?utf-8?B?d1RZVlhTbDRIV3hPUGZNclZtNHpway82cVJqNzQ1MXBDOTFSUVVmcXU1NXc4?=
 =?utf-8?B?cjBiNjRUYWs4bWFrbERxUlZkcXRiQVR3V01qcUdPQWo1cndZRDBqYTBlL0JL?=
 =?utf-8?B?SHo0UzFDUWJjck5KcDR4dVpJbDh0RGlIOGY3dWRaYUdZUUZRWU1vaXhxLytp?=
 =?utf-8?B?Yk0zM3ZKZ0NXYmZlU3luSmNGYkkrR29SOW1sWFBlV0pKb3dmZ2hEWGxCVXhL?=
 =?utf-8?B?QUpLbE10UzNhYkpWVUFwN2Z4bmJlSHdBSTJScDZaRUl3ellDVEJtSkk5WkVz?=
 =?utf-8?B?QVZPekY0R2t0OVptcStlTlFPUVBRRWdiUndiaHVlU1hqK0xKQWZ3ZWM4Mnp5?=
 =?utf-8?B?aW9iL0hpUU5NakV4ZjUrbk5FOHQwemJXczBFdk8zZ0s1eWl5dmx1R0lBNnAw?=
 =?utf-8?B?VDRwUTRGaVUycWRRS29RcUlpanVvTHRKd0hUQmdVQTh3TW0wMUdoNUlxZUVM?=
 =?utf-8?B?Vm55NU42aStYcVJxajVOcEg5aG9XREZXUmZSNzNrejlVYis5V1ZhaDlWNzB5?=
 =?utf-8?B?cDZFeGFLSVJwV2drTE5RNXB5NW5LT05tcHhFQTE0TXpVd0FhUXZjSGJUdm5t?=
 =?utf-8?B?STZTMG0zVVlXUndzYmhEdG1mODJNVFp1MS9Gb1dHYWNRN0lKUmgyN2lvLzVE?=
 =?utf-8?Q?gPNBC0klvY017MDxIU8GjNFL+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98dd9eb7-71ed-4b35-57a8-08db2483296e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:56:35.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+1vUcN4HT3Y+JY6+zfK6SZF+4REVwq8P2ETpCYz9OSnnnC0vsgh8mYRQnr6cRgVAgTVIMMGz0yJ1319goBZMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

On 14.03.2023 11:13, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -27,6 +27,13 @@
>      ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
>       (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
>  
> +#define VMSIX_ADDR_ADJACENT(addr, vpci, nr)                               \
> +    ((PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr)) &&           \
> +      (addr) < vmsix_table_addr(vpci, nr)) ||                             \
> +     (PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr) +             \
> +                                 vmsix_table_size(vpci, nr) - 1) &&       \
> +      (addr) >= vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr)))

While I realize this may impact performance a little, did you consider
using !VMSIX_ADDR_IN_RANGE() instead of open-coding it kind of? Then
again there's only a single use of the macro, and that's in code where
VMSIX_ADDR_IN_RANGE() was already checked (by the earlier invocation
of msix_find()), so the re-checking of the MSI-X table bounds isn't
strictly necessary anyway.

> @@ -438,6 +369,145 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
>      .write = msix_write,
>  };
>  
> +const static struct vpci_msix *adjacent_find(const struct domain *d,
> +                                             unsigned long addr)
> +{
> +    const struct vpci_msix *msix;
> +
> +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
> +        /*
> +         * So far vPCI only traps accesses to the MSIX table, but not the PBA
> +         * explicitly, and hence we only need to check for the hole created by
> +         * the MSIX table.
> +         *
> +         * If the PBA table is also trapped, the check here should be expanded
> +         * to take it into account.
> +         */
> +        if ( VMSIX_ADDR_ADJACENT(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
> +            return msix;

Is the comment really correct when considering that you don't change
vpci_make_msix_hole()? (I was actually puzzled by struct vpci_msix'es
table[] field remaining a 2-element array, despite the PBA now being
dealt with differently. But I realize you need to keep that for the
VMSIX_ADDR_IN_RANGE() in adjacent_write().)

> +static int cf_check adjacent_read(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +{
> +    const struct domain *d = v->domain;
> +    const struct vpci_msix *msix = adjacent_find(d, addr);
> +    const void __iomem *mem;
> +    paddr_t msix_tbl;
> +    struct vpci *vpci;
> +
> +    *data = ~0ul;
> +
> +    if ( !msix )
> +        return X86EMUL_RETRY;
> +
> +    vpci = msix->pdev->vpci;
> +    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> +
> +    if ( addr + len > round_pgup(msix_tbl +
> +                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
> +        return X86EMUL_OKAY;
> +
> +    mem = get_table(vpci,
> +                    PFN_DOWN(addr) == PFN_DOWN(msix_tbl) ? VPCI_MSIX_TBL_HEAD
> +                                                         : VPCI_MSIX_TBL_TAIL);
> +    if ( !mem )
> +        return X86EMUL_OKAY;

The respective PBA logic had a gprintk() on this path.

> +    switch ( len )
> +    {
> +    case 1:
> +        *data = readb(mem + PAGE_OFFSET(addr));
> +        break;
> +
> +    case 2:
> +        *data = readw(mem + PAGE_OFFSET(addr));
> +        break;
> +
> +    case 4:
> +        *data = readl(mem + PAGE_OFFSET(addr));
> +        break;
> +
> +    case 8:
> +        *data = readq(mem + PAGE_OFFSET(addr));
> +        break;

So far we have allowed only aligned 4- and 8-byte accesses to the PBA.
Shouldn't we continue to do so?

I'm also concerned of misaligned accesses: While we can't keep the
guest from doing such on pages we don't intercept, depending on the kind
of anomalies such may cause the effects there may be contained to that
guest. When doing the accesses from the hypervisor, bad effects could
affect the entire system. (FTAOD I don't mean to constrain guests, but I
do think we need to consider splitting misaligned accesses.)

> +    default:
> +        ASSERT_UNREACHABLE();

Is this correct? In msix_{read,write}() these assertions are valid
because of the earlier access_allowed() checks, but here you have
nothing like that. Yes, the emulator currently would only pass sizes
that fit what is being handled, but relying on no "unusual" insns
appearing down the road feels risky. Then again
hvmemul_phys_mmio_access() splits accesses accordingly, so perhaps
all is fine here.

> +static int cf_check adjacent_write(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
> +{
> +    const struct domain *d = v->domain;
> +    const struct vpci_msix *msix = adjacent_find(d, addr);
> +    void __iomem *mem;
> +    paddr_t msix_tbl;
> +    struct vpci *vpci;
> +
> +    if ( !msix )
> +        return X86EMUL_RETRY;
> +
> +    vpci = msix->pdev->vpci;
> +    msix_tbl = vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
> +
> +    if ( addr + len > round_pgup(msix_tbl +
> +                                 vmsix_table_size(vpci, VPCI_MSIX_TABLE)) )
> +        return X86EMUL_OKAY;
> +
> +    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
> +          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
> +         !is_hardware_domain(d) )
> +        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
> +        return X86EMUL_OKAY;

Just as a remark: Checking only start and end is sufficient merely because
the PBA is a multiple of 8 bytes in size, and "len" currently cannot be
larger than 8. This feels somewhat fragile, but is - like above - presumably
okay.

> @@ -530,7 +600,10 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      }
>  
>      if ( list_empty(&d->arch.hvm.msix_tables) )
> +    {
>          register_mmio_handler(d, &vpci_msix_table_ops);
> +        register_mmio_handler(d, &vpci_msix_adj_ops);
> +    }

Did you consider re-using the same ops by widening what their accept()
covers, and by having read/write recognize inside vs outside accesses,
dealing with them differently (much like the PBA was dealt with before)?
Besides my gut feeling of this ending up being less code, there's also
the aspect of NR_IO_HANDLERS being the upper bound to how many handlers
may be registered.

Or else did you consider registering this further handler only when
there actually is a device where the MSI-X table has "slack" at the
front and/or end?

Jan

