Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FB6B9A32
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 16:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509724.786051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6r7-0006Zv-0L; Tue, 14 Mar 2023 15:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509724.786051; Tue, 14 Mar 2023 15:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc6r6-0006YD-T3; Tue, 14 Mar 2023 15:46:28 +0000
Received: by outflank-mailman (input) for mailman id 509724;
 Tue, 14 Mar 2023 15:46:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc6r4-0006Xl-VJ
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 15:46:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fe03d07-c27f-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 16:46:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 15:46:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:46:21 +0000
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
X-Inumbo-ID: 5fe03d07-c27f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRHKitJkPw+7F289JgZBi6rVrFFiU+kmhxpCs6olycUX/5LzbJ9u7cA0XtxVIxRNshu0rCnzipaPP+GKMpGxjvvTsQ5vIac4otGkee4Qq/j506BDoOGdM7U4jaUjcjTmtyOLDrVBEc1ESzGSBJZowP8wpsOvGlfEplpMCAp6S67l6DZphZfe2q7zgz8UqJEEzM9D+jA3jf7j8NGlJRgW/xvd0iVZPF4SShhBAnIEc9qvaUzf15t3KNzsZ3zEhCGye4+prqtErmez6azJYDImAfP74eAyQovw/AZHffrdgSQ1BRBdG87ud3EIAI/RFmzb14j58SWlXV/v9VGuo4W42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkuSXyoXGFw70SkYdgGLmUg2d2g9F5+I1TxBETzaQHw=;
 b=brf22r3SZr+Njqa9alXPPj9KfjSB6n5YWreDhCe+jsBDCLBKWF4MNoKgxS4dr9dJbaM8niEGOKL1jpx87PlA7UFy0J3SBQWmFx9i5Bfil7Zu2pbUZhZZxaDnPZcRH99fUjjosysdZX8a5Eo98qw1JRvgAjQ84TpnfjcG2pdURyxirfWn3SqLWvJ6i19Lh1gsaNVVCqBSpUxBWRmiUw13w5XWb4f+OFjdLPjn1pmlj2rLLUxV6yKITV7nJbIXFpBZXKOnh9haWL5VHvnPaXViybKotSQPd+ExcmTBKszkfewhevLqNBegOuweZs0BUz8tipq2+HHVrh2OBEBBfz3Bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkuSXyoXGFw70SkYdgGLmUg2d2g9F5+I1TxBETzaQHw=;
 b=Zjp2D5blLL2qixxAse6zN2VlIvuiaM0kg60P+CY6CY6rc2Beiqn7HZFtFMHCAy1O00mgF0VFyiopgxc88WxiMNFILkNmW5AIZqMm8KFO4hEhbN1zkJx6WQPdL/G03wN24fTPaGYRUFSfzyCRSqvW68JpDtgZm/EhATl5j1a3enxHFHTCKH9SS0TKB48/c8tpwy9fM2W4CTyuofIOx71vBYQV1yGt4i9zY5ks5qeUmbYb2/LGUvzdQRwlz23r2sovjH8/wPD1PC/vhN1yaGae39VKKZixIWDqMq18VB/k0TLFeOmvMivrRYBPE5ZvjueezwqHrabwa5W0eFkMfgVwlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69fdfa84-cec8-6e76-8b1a-ff4de835a908@suse.com>
Date: Tue, 14 Mar 2023 16:46:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230314101331.4194-1-roger.pau@citrix.com>
 <d22fabea-5821-075d-07be-7e9378be1b5c@suse.com>
 <ZBB8ejEi4mBktBpb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBB8ejEi4mBktBpb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8ce584-df8e-45fc-6e6d-08db24a341de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	39uSRMIEwFvCcJdqDKD2m4BTns1QTWuaX5L2SsrHGMtJHTPw3dwmPOC8ciO2oo/2xKjivi1HN9mrOWzbwBVyJDbZfGxqK7IVXuHLqb+fMnGjytCPEhOSfoZnm703MEnSXWVD99BkNYHu2p1YDH03vbsFwkOzvbFYelwkdK7YcWOvTknjCi0tGRl/+qwwDDz2qL5b++Nfz0nfttHHGh1m7WZMTCrFB7vuoASEmhImXi5BiAT5J9bOWCDW2+7U8Dvra4Rue8qlHLnJBPhiUyA80dkd1+/RI8MDV0V9erDcwp0qCr0kb3bmskeRTXsZBvshcdPZaXidB6Fwm0tujglvh69Quk5gXPaaTFc7EfdKhbmTuu0x3FeMcn+q+4QLncACpgwfYYoY5786jVM0i8IFHmJHId4NBxt0tQCs8yuxNi/5mmCOe6PGpEpvdzi3tRwTh1qeVSgG6+hSqtmKa7fjSQDm3P1Qv4F4QZhyGSBGBVJ5lH7Y1LgDD4LaGRbjx1TThuQJ8hZoy5z8OUzZUaLmA5r+fWCF5TDLAeg1Y20l+XRgXkbvjnYIW8fNB+S2+F/HkaUYqNBouta7fm9CDlSJFpIn9gs5xxwSM1l5G04G1v8HdIUka68F3iqiL7SWzyczgoXnisvXS2D/H32mvWqHcMpu8nOt6/sPWQRJi6ef+bnDAXwP/6smZmWOKBrXTqsbzLN9qVtVgnphuL7mMnrxD/KNFe6uK+kxXgX8CpquIt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(396003)(39860400002)(376002)(366004)(346002)(451199018)(2906002)(83380400001)(31686004)(6486002)(6512007)(26005)(6506007)(36756003)(5660300002)(53546011)(2616005)(316002)(186003)(31696002)(8936002)(86362001)(41300700001)(66556008)(4326008)(66946007)(6916009)(38100700002)(66476007)(8676002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWtjM2VmS1pDU0VobVpUZlQvQUhRdVB5MW5LR3FLTFB1d2dCUkJUYkx2T0pz?=
 =?utf-8?B?Wk9Ra0tZN1JUa01vV2ZuL1Zjd2lKYnNrQ2xIWDI1L2lzUzJPVkJTandqdkNv?=
 =?utf-8?B?ZWNrQzhxS2pZWDZLWTVMM2V4NlVUZHdLMEVyQjkvak9YMS8rVVVaRFhEQ0di?=
 =?utf-8?B?WHlrdzVxaysrSEpiSG5XWVdCek1LY1V0cFc3RGlJay9wTnRoUXhpbVlWTVJm?=
 =?utf-8?B?NUhyblQzVkRNTlV4K0dOWmRSanBGMExlVVpKUS9QaFNsc1BLODZjeUdqcnlP?=
 =?utf-8?B?aFU2SDFXdnJld3k5YlRjYVFXZFBscjFGU0wzVGxnR2NBU0d6aEtwaUxMR2hi?=
 =?utf-8?B?RlozQit0eWFPUnppMGhVMlJ0S0NUbGhobnVhcHhuMjVlaldqUGkxbkNSc1JH?=
 =?utf-8?B?MnRhakNIZ2lyR3hndkQyZE9YK0dvVlc0NFN2ay93b1A3RnhWdTFhWjAwTUxi?=
 =?utf-8?B?ZDJMU3UzWTVGWnI0ay9VWGNJWlhzUlR6QnNFYi9lL3JMWXFuNys2Ulp6L21S?=
 =?utf-8?B?ZDkzUW1Pc2tmY3VvbXd6TWVNUDhBYVZUdmwxT0k3Y2VGWElRdHNQVGVoWXBt?=
 =?utf-8?B?bzQrZldmclYrbVZidWlTZUpKaE8rU0QrZTRzdnZ5R3p2dWgyVnpQQ0d3VTh0?=
 =?utf-8?B?Q3ZBOWRzNWlHMFVlaCtmUW9EUkhvcCt5d3FPTkJEVnNkNElqNmxrVXhWMmJv?=
 =?utf-8?B?RG8rUDNmQjZObFd0RjhaSXlLM0UvdCtMdTVkVFJoV3BDSkpIcktpREJoU3Z6?=
 =?utf-8?B?aFlxL2l0VHFWK2tHeW5yQzBGeWVXRmZWemcvbmRUZENCR1IzdHl4OTloOXJE?=
 =?utf-8?B?VnV4bUkwMWxlcFZtR0JMa1JkOXU5TVZ2a01GbHE4V2FqOE5pVHhOZUkzVzRo?=
 =?utf-8?B?S2VIRWpoRDdrcFF6MlJIakFwbXlTcVFvSndEb2h0bmR5WTREWUM1Sk5waEVj?=
 =?utf-8?B?cW5RM2VBWVNna25BNGY3Yk50enRBZ2hLWHdVS2lGK3o4LzhsdFBDQUl1ZXBz?=
 =?utf-8?B?TWlCcU1UUlQ0Y2F6U0J3VzNVR1BQSVBrendoODk3R25WbFJjaFFDcGR6ZjQx?=
 =?utf-8?B?VEdXV0dQbm51d3RWL25iY2luUE1wMGtlRElsQTNOcXhsMURSUFovVmtkUkd6?=
 =?utf-8?B?Y1diNUxhQWtUd3dCVVNwWVlyRGdVbU9KeDJudExJeTU3OVBiUXBTbWErVVRu?=
 =?utf-8?B?dTIwMG15YUVreDNMek9DaTI2KzRRaUwwWlM2aGdLdEtwRVd4UmJhVG9zTWh3?=
 =?utf-8?B?c3QzdlRPYlNJakpsTWRxN1VlNE9pT3ZOVzNOdkU0ejNINHovSkhBZVlGdlFv?=
 =?utf-8?B?Y1pTKzJ2MU5TRllRek5KdXBwVnpPcTQwN0o4WVNxc2dQRk5LR0QwcXE2UDV1?=
 =?utf-8?B?QktVZ2VwVUk3SHVTemx1WGpzTU9IR1hYUC8xMTY5RlJZdXhQbGlpclhIOHc1?=
 =?utf-8?B?S0tBbnB2NWNaa1RlVjdCRElZeW5aa0FPU0Z5anArV2xjdGlNVi8yNlNwOEwr?=
 =?utf-8?B?TnM3YzFkb3FJZWNrQjdMNzFQMVEwbWVPeWhPMm9iZnZWZG11NmVhcG1RRkxX?=
 =?utf-8?B?QmR1STI5SnVlTW1FZDJWa282M29kZWVoR21aM0hmbjQrQ055eE9NcnhOTERx?=
 =?utf-8?B?WHdEazk4c21QUS9jc3c0M2gyQStadmRjbVA0UnFQcWdOUm5KMG1KTGF3QWE5?=
 =?utf-8?B?bVRMU3NHa0RHMzFLMTQyb2RtSTEyRkRtQXdNaFZZZ2hEV29Kc1ZWSmN3S0tj?=
 =?utf-8?B?R1ZCc1g0WEhNaHA3bTFaMEpMR1VFbkdieVRzUkZiWHBDb3djWEJLSXNDSGd5?=
 =?utf-8?B?TWMvVmJMb2dYd2tXRzBuODluM2NpTUhzSXBOMSt4T0Zwc00rRE1xRFFTMWtD?=
 =?utf-8?B?RWdmdWRJT25sKzRpRWRwVFlqbDJLTExGR3M5LzJSalR5QVhvUDl3aTcxT3ZD?=
 =?utf-8?B?MnRuMVNwQVlMRDZuR1N5eStBRHVQd09DUXFmODlBSk9Ud0htNzljRUMrNEtM?=
 =?utf-8?B?QXIzbVgxb1JZWjhyL3IvVmFUd1lNNDdXWlJWUk40NGdPWFlFVGJWTkc0U2VF?=
 =?utf-8?B?b2p6UGh3d1V5TUcvbEZ1TUxUKzdKcjlhUkwvbE1JdDdVV01yRE5SOEo3STl1?=
 =?utf-8?Q?nDSA3s1ybSlJ7o0txzoZSVqba?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8ce584-df8e-45fc-6e6d-08db24a341de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 15:46:21.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5giNIoC28Wwjbm8+sMbE/zwIEqX7In3AQMFiSMWF78GANOv+N+0MUCnxVX5bkwHZ0iWATSbvUx1No94XVhaxkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131

On 14.03.2023 14:54, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 12:56:33PM +0100, Jan Beulich wrote:
>> On 14.03.2023 11:13, Roger Pau Monne wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -27,6 +27,13 @@
>>>      ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
>>>       (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
>>>  
>>> +#define VMSIX_ADDR_ADJACENT(addr, vpci, nr)                               \
>>> +    ((PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr)) &&           \
>>> +      (addr) < vmsix_table_addr(vpci, nr)) ||                             \
>>> +     (PFN_DOWN(addr) == PFN_DOWN(vmsix_table_addr(vpci, nr) +             \
>>> +                                 vmsix_table_size(vpci, nr) - 1) &&       \
>>> +      (addr) >= vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr)))
>>
>> While I realize this may impact performance a little, did you consider
>> using !VMSIX_ADDR_IN_RANGE() instead of open-coding it kind of? Then
>> again there's only a single use of the macro, and that's in code where
>> VMSIX_ADDR_IN_RANGE() was already checked (by the earlier invocation
>> of msix_find()), so the re-checking of the MSI-X table bounds isn't
>> strictly necessary anyway.
> 
> I didn't want to rely on the order of execution of the MMIO handlers,
> so I would rather make sure that the newly added one would work
> correctly if it turns to be checked for before the MSIX table handling
> one.
> 
> I could indeed use !VMSIX_ADDR_IN_RANGE() if that is clearer.

I think it would make the source easier to follow, even if the generated
code is slightly worse.

>>> @@ -438,6 +369,145 @@ static const struct hvm_mmio_ops vpci_msix_table_ops = {
>>>      .write = msix_write,
>>>  };
>>>  
>>> +const static struct vpci_msix *adjacent_find(const struct domain *d,
>>> +                                             unsigned long addr)
>>> +{
>>> +    const struct vpci_msix *msix;
>>> +
>>> +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>>> +        /*
>>> +         * So far vPCI only traps accesses to the MSIX table, but not the PBA
>>> +         * explicitly, and hence we only need to check for the hole created by
>>> +         * the MSIX table.
>>> +         *
>>> +         * If the PBA table is also trapped, the check here should be expanded
>>> +         * to take it into account.
>>> +         */
>>> +        if ( VMSIX_ADDR_ADJACENT(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
>>> +            return msix;
>>
>> Is the comment really correct when considering that you don't change
>> vpci_make_msix_hole()?
> 
> Urg, I was really confused then, as I didn't remember (and didn't
> check) that we also punch a hole for the PBA.  That's not really
> needed for dom0, as we allow both reads and writes on that case anyway.

Well, until now we restricted the kinds of writes. But ...

>>> +    switch ( len )
>>> +    {
>>> +    case 1:
>>> +        *data = readb(mem + PAGE_OFFSET(addr));
>>> +        break;
>>> +
>>> +    case 2:
>>> +        *data = readw(mem + PAGE_OFFSET(addr));
>>> +        break;
>>> +
>>> +    case 4:
>>> +        *data = readl(mem + PAGE_OFFSET(addr));
>>> +        break;
>>> +
>>> +    case 8:
>>> +        *data = readq(mem + PAGE_OFFSET(addr));
>>> +        break;
>>
>> So far we have allowed only aligned 4- and 8-byte accesses to the PBA.
>> Shouldn't we continue to do so?
> 
> I've read the spec about this and wasn't able to find a reference
> about having to access the PBA using 4 and 8 byte accesses.  There's
> one for the MSI-X table, but it's my understanding it only applies to
> the table.

... you make a good point here: Perhaps we were too restrictive. Such
a change in behavior wants calling out in the description, though.

>> I'm also concerned of misaligned accesses: While we can't keep the
>> guest from doing such on pages we don't intercept, depending on the kind
>> of anomalies such may cause the effects there may be contained to that
>> guest. When doing the accesses from the hypervisor, bad effects could
>> affect the entire system. (FTAOD I don't mean to constrain guests, but I
>> do think we need to consider splitting misaligned accesses.)
> 
> I was also wondering about misaligned accesses.  Should be allow dom0
> any kind of access, while limiting domUs to aligned only?

I guess the code would be simpler we we treated both equally. As said,
my goal is not to refuse misaligned accesses, but to break them up. To
keep things simple we might even use purely byte accesses (and then
perhaps simply REP MOVSB). Special casing Dom0 would only add code for
no real gain.

Jan

