Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C16342E69E7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 18:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59547.104533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwnH-0001pk-D9; Mon, 28 Dec 2020 17:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59547.104533; Mon, 28 Dec 2020 17:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwnH-0001pL-9i; Mon, 28 Dec 2020 17:58:55 +0000
Received: by outflank-mailman (input) for mailman id 59547;
 Mon, 28 Dec 2020 17:58:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shBg=GA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ktwnF-0001pG-F0
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 17:58:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7569d644-0260-4396-8d4a-f26dbc6fdcfa;
 Mon, 28 Dec 2020 17:58:52 +0000 (UTC)
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
X-Inumbo-ID: 7569d644-0260-4396-8d4a-f26dbc6fdcfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609178331;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Uz+DU672ICkb/KeNCyH3d3zZrPGziElx/QdYC+h7tsc=;
  b=XE6CuIDY+zDZ+iCZA6moFvIWDBX6lUNpH7gPiJcPFZgX8ZIjCHzBXOGP
   PYSNVihJacgEZXCc/WcFFvFNUyxfVVki5Htymga4uzUZ4b0pTnXqsSlJO
   PJ90gePwxkQ7K6jrqDjLlIjgvRw9N2uTtZ7ip9QBOqdCuogjyF+ltsCoS
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: wUNWyeMFFXT4wr//cR26S3uDH9qZ9Qjr0YDX/qJ+OGL7PYSOfXgSEKW5zs71IKTLRvEwmWKWfF
 U8X7Ajb6pbWyao6mkOHhx45JLIK5cEtOcXwMuI9KtkNhPEEaPtJ5Yq4O55ozZQpmrQS0XPbH0E
 svIzmHAdn7QgNrMCCJy8cYCkllNzwsTDo0pn0RJTwj0So4VmavfakkfXAu4eM+6IIfKd1/h+hf
 NX352P3IoJx/MWtcnTaLR8MiQYi34HwMfYqxKb8yr04ebDlgd/e3sDOEjq3y6cplYCnqV+mjYR
 s4Y=
X-SBRS: 5.2
X-MesageID: 34277738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="34277738"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uz/74jtQqUWlOVq3WoobWp3gzmo2bXj3HLPPVBOS3XqWOV3RGrf8ianAUJJ/+xscJ2id6VS4WcxThJmBvs5U0DrRTCh8Tm/x+1cSYhd8llKsdvf/XmCX+OuIeq4+gN6xsV/SH3lpX/9fnmNzLW1n0FCIcYBIVrM48ifUA8Gjhkf8SGRNzsrL6r+/cbzX2ofYXhu+cuTTxJoP3G5fjFgsUPzHYSz2CWcTMMSd/z4u6iZdibGVEHl7qHvNgkBVRPqRpDow058pHwpx+83mKn+v0CfLrbNgbdetVOuzOxcCBZd7rUFctNP4b9dwUERUoa8YYtTNbzvvPsfctBY90RJi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy5bTNHDCVjBbuIW4X/SGecNJtqr+d0lbXOznEpwKM8=;
 b=Gwhf/oedZLScX2BB1nlPobKSsorAbPmuHLtgFhGK5Fll1Aqw5QBq7NN+Ssp9hqJ1gGT3vvny76MxCZqDHESFd8wDbOl9Y3zVAYOvJp0fKRA4riA5e3l8htnzQPTpw07tk1vlBO5TrQcfw0BLE7iaZzEgAZfj//XMqXi/mmVwMv0Zs9ErYjobWBfI0j5vSgTXrww5xzviqCJ8cUy3bi/IU8R4nmYyk9t1hHeMXYHDZ0Z0eQBDBIt8YXnE1d+h7yGOCc0MuSoiDJIkIjXw+ehwQcCBbvTg/ngYwIvZhy4QuzgxYtv4wvxnGv9yPN5YPlVEpEVZoEVTw5DYm3Mp4/u86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy5bTNHDCVjBbuIW4X/SGecNJtqr+d0lbXOznEpwKM8=;
 b=La2JbQM9wXJBBIOzEbbnh6BeSKCZddoJ+5nBAIquAivq5Z66z67Z/EMJTmuhowLuH/NbIYMdNcTBy1Vy9gN8BACwQa1VOBuq2leUkmPtLNc9mZ3oRx9hwwY9ILtj56VoDMA4dIn1v7/E0w/VU8XGyUzWujrfw5dW6gRnB9LI1uA=
Date: Mon, 28 Dec 2020 18:58:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/5] vPCI/MSI-X: tidy init_msix()
Message-ID: <20201228175842.hyecvulrklnxsdcm@Air-de-Roger>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <e21e4936-f356-8c8e-845d-d60880a58ed4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e21e4936-f356-8c8e-845d-d60880a58ed4@suse.com>
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d583ee5-0c13-4383-bac4-08d8ab5a39ca
X-MS-TrafficTypeDiagnostic: DS7PR03MB5542:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB554277A5CB57AB90A24E3C198FD90@DS7PR03MB5542.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWy/QdFkQ2XGPxwLAEztbcSkaEynYh66d5QHin+FNRYKVFFXO/srqvj5Mwh2UVEOXBOHHsjU/nMAA34XDBYO/j9qg5B+3kCatq6MKUF9XGq8SqI39rD2W6nDjLLVe1o+XB/qsknG8Icnz0tl47gjV4ASJh1oy09M7x/TqyNMD/C+JQYvaKtIqTvtq1+KDzJrGOAimBISQb3Yo//FpyYkT829cLs7EjaQErgk+HRVuwQVeVuvSdhPHPbjDbEq4y6QPOthv78f3sy56dXsw7jExHOBVShBKgLIaGq85Tlyd0S+o2EWtVaONpApXrho1HDxdI8647VLusEaa50zbwnAz8/cWiQlS/SUh7pKBR1xvIxxqQxOZZPvFsp6RlD37Z/AU+wxjdapkPHOpzev0WZwMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(2906002)(83380400001)(8676002)(478600001)(6486002)(16526019)(316002)(33716001)(5660300002)(6666004)(1076003)(6496006)(54906003)(6916009)(4326008)(66556008)(956004)(8936002)(26005)(86362001)(186003)(3716004)(9686003)(66946007)(66476007)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VW9LcnIzVjVPcDBSOUkxSGdEc2lCMHlMeU5KMCtyMGxHWEh5ZjVVcEhrOStT?=
 =?utf-8?B?UHhNcmlNTmpzeXhaTnNPT0lnMndoNGtUNmlLeHVBakY0WE5EMkFRUDlGTmdI?=
 =?utf-8?B?b1NmTlRJOWZ5Y0VkUytMMitjMG1ZRnhCOGp3aGI2dUl1V2tWQUlBdkRzOHVD?=
 =?utf-8?B?QjRHUDFma29QL3dPeU9GSzE2UVQxR2hjMWErMjZUY0lPVVAxd3R0dFdTekwv?=
 =?utf-8?B?SllyNWNCRWdWaEswYXJTWnA0SkJXeXBmVHppYzNISklPWGpDbEtReXExQjl0?=
 =?utf-8?B?cG1wTFJoWXFQeVVja0Jiako1RW5zd2IrYUdJRlVtbStPT3Exdm1zZzcrSWRS?=
 =?utf-8?B?ajJiTysxQnZyVHpxcFhId214VDRqeE45QkVwNFdFTUMzdjVGUWR3L29IQlEw?=
 =?utf-8?B?cE5iTkJLK21zT25PNFBraTdMUlF1RjZhTUFqQ0Vob2ZEdFJKZStNZUhpQmJ5?=
 =?utf-8?B?M3VtYjJ1M09kamZISkJUU2QyVTVHL0N1dHVrdkpiS3NBc3Q0TzdWWG1nT0Z2?=
 =?utf-8?B?NVhLc29pWktqcWwvcjBZNnNld3ROaWNTclYvYWFjaDM4SXRxRGtaUjA5cUla?=
 =?utf-8?B?MGVDSER2K1FyRGt4REJ3eEIzMlRLSXFMQWRBQjVvUStMaHh5SW85TjRCY2Yw?=
 =?utf-8?B?VWNHUEtZYk5UcjhCYzJ0ZCt1UjUvT2VpWHg4TkRVVmVzV2c3Q0NmMEovYkxL?=
 =?utf-8?B?Umc2Z3JMbEJSc0pxc0tLNFMwVUhLNVRLNjE0YjVwMEs1bGJ2UnVGLzluWkpp?=
 =?utf-8?B?V05ZQWdPWHp6emMzN0tSV3lLbzJrVHd5TjhncFExcllyYWszdTJzVFJrV1BC?=
 =?utf-8?B?VXpFUmZKOXNpNlc5Y0Uzd20rdGFwRWgvQ1pwT3hQNUFEUjRjQ21xSTN2Y1V4?=
 =?utf-8?B?RVhRYWNFSC83RzcxVFR2ZkdzS2VxY3FraThzVzJsOHRvbDJmQlpDOTRYWmpw?=
 =?utf-8?B?eWFlLzJPNHVwVDVGc2tPUDJ4Ti9nTFB2U0JsUVBvSEFiWmw0aTJWbndkVE93?=
 =?utf-8?B?MUdhMld3b2FsWnkzbnFWL0NhNVBhdFpBUW5jZXlzT1ZRL2t0UjlSM3g5dk5u?=
 =?utf-8?B?clloZE9NZkljY3FiUVJOOGdMckk5TE5jWTNmUFR4VUFydUxPang1UldyTys0?=
 =?utf-8?B?RFh2RGpJNW1CeEQ4MkZVRS9aa2NlRHZTbUEyMGVGYzE1d0hpbWpLZzhtUzNC?=
 =?utf-8?B?QUhsbUVDaEI4MFRRYitqQWFFSGJpS1VhV0VsdCtSTndIMnVKaEJLZ0dtRHpw?=
 =?utf-8?B?Ty9KSVlYUFJTd3FpaUxwdXREWTZrdEZPYU94R0crSVNzMDFINGdpOUFzNFVL?=
 =?utf-8?Q?GkziqjdXDLll1XND2anlcXMX6CfF0kIVkV?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 17:58:47.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d583ee5-0c13-4383-bac4-08d8ab5a39ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugp5yuHwXrnIvOPcrF+2A6ImT/Umq5iAoxeOtstJJHw3nIHOKJ384x0M2Y1YW29eLQ3kyqe7IhReY8snR+wsXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5542
X-OriginatorOrg: citrix.com

On Mon, Dec 07, 2020 at 11:38:42AM +0100, Jan Beulich wrote:
> First of all introduce a local variable for the to be allocated struct.
> The compiler can't CSE all the occurrences (I'm observing 80 bytes of
> code saved with gcc 10). Additionally, while the caller can cope and
> there was no memory leak, globally "announce" the struct only once done
> initializing it. This also removes the dependency of the function on
> the caller cleaning up after it in case of an error.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Just a couple of comments.

> ---
> I was heavily tempted to also move up the call to vpci_add_register(),
> such that there would be no pointless init done in case of an error
> coming back from there.

Feel free to do so.

> 
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -436,6 +436,7 @@ static int init_msix(struct pci_dev *pde
>      uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
>      unsigned int msix_offset, i, max_entries;
>      uint16_t control;
> +    struct vpci_msix *msix;
>      int rc;
>  
>      msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
> @@ -447,34 +448,37 @@ static int init_msix(struct pci_dev *pde
>  
>      max_entries = msix_table_size(control);
>  
> -    pdev->vpci->msix = xzalloc_flex_struct(struct vpci_msix, entries,
> -                                           max_entries);
> -    if ( !pdev->vpci->msix )
> +    msix = xzalloc_flex_struct(struct vpci_msix, entries, max_entries);
> +    if ( !msix )
>          return -ENOMEM;
>  
> -    pdev->vpci->msix->max_entries = max_entries;
> -    pdev->vpci->msix->pdev = pdev;
> +    msix->max_entries = max_entries;
> +    msix->pdev = pdev;
>  
> -    pdev->vpci->msix->tables[VPCI_MSIX_TABLE] =
> +    msix->tables[VPCI_MSIX_TABLE] =
>          pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
> -    pdev->vpci->msix->tables[VPCI_MSIX_PBA] =
> +    msix->tables[VPCI_MSIX_PBA] =
>          pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>  
> -    for ( i = 0; i < pdev->vpci->msix->max_entries; i++)
> +    for ( i = 0; i < msix->max_entries; i++)

Feel free to just use max_entries directly here.

>      {
> -        pdev->vpci->msix->entries[i].masked = true;
> -        vpci_msix_arch_init_entry(&pdev->vpci->msix->entries[i]);
> +        msix->entries[i].masked = true;

I think we should also set msix->entries[i].updated = true; for
correctness? Albeit this will never lead to a working configuration,
as the address field will be 0 and thus cause and error to trigger if
enabled without prior setup.

Maybe on a different patch anyway.

Thanks, Roger.

