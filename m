Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A4784287
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588486.919994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRqe-0005ls-Gq; Tue, 22 Aug 2023 13:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588486.919994; Tue, 22 Aug 2023 13:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRqe-0005jH-D2; Tue, 22 Aug 2023 13:55:08 +0000
Received: by outflank-mailman (input) for mailman id 588486;
 Tue, 22 Aug 2023 13:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYRqc-0005jB-7D
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:55:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7db30816-40f3-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 15:55:02 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Tue, 22 Aug
 2023 13:55:00 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 13:55:00 +0000
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
X-Inumbo-ID: 7db30816-40f3-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU5WKzGC/GgC+Lam+S/vMDhYBwqBTsm8HR/BS7Z+cEYurQlRDDLYD7wB4hIcUHClSVHZekhXUPzKw7J3A4bUIkZiFx4/NAw3hrGc8fJnWQuJB1I94RJhIrgi+YsjlEGIMYxpYpBQxRoOIFlqR4EDpKEo4l63I8kmMt991nVamfN5luFlxCcX7tuPO8Y6FhzurGxHnQpZloK0scOjPJiqotCsb3/++PysRM92/qd9gtZYZeqtYiKC/GNwPS0Jq/JyqX1qkxZ8/bo9reOmWdiD8sI77w35/ahFry07p3GCYFwztPNPCm6dNDHSNIRVouM95cfH6xA9eMbUZZfUiU8iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pqM5/Nkh7/MlsZwIxGpRCzb6J9NexECHN3wo8sweNg=;
 b=neUmVJAD2pCAdzgu0T14QBUIZnQeO6/8BbZxqejAJJUHhk98c684+qu8e0amIdbKZAEUI+Q4MBR91LeE3Thq1dTWRrMAJn3OF2XFPB3VRzxbFVINUp/9sNX0nZ0crTPx1kOIVJ759fFNWqdWMVsrUn6QvzRmq9goDo22nprzI9GWpTHtzwK4wvHJGL6AOb+PbSp6OOROKaQDgL3U/Vlp6670dPAGATXh0Tb80gYpezPdXWYWHoG4/CGu+841Kdgk2K6T1jOeHBn11BNsYv6QiGO7ph5msR0pEL/ByiSPzvCO0I5EN37Y+ai/mOAXlj3E9uv6vNrGW8yb3yxIyJYE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pqM5/Nkh7/MlsZwIxGpRCzb6J9NexECHN3wo8sweNg=;
 b=4cRIIfQEQd0+uK+42lhcOXaahkPAmNWbmeSxSpl4vnNSmCnCxqY4QG2JCmPKXqbURMyzB3ztX1WFntXLr57vBw5J/1gRZ3Jn/Lx/S2surJkn6y0Zbh2dTXmKC8Ki+BIQmmjniqNkn5q4u3XJph/40qm+38RyZFlnck8cengEVDdmSj4tjp22p2vgS0aVsjT00/qm2CV4pxefxeXorBkh9+FbA3npvhfyBHvQ2IfAr5DieonV9NwY82KUocQ4djvoxrPwreN06kdYXBIPp7NOGywW9xVnFR4aiob1NnxcIF+NuV3Gag7PQX5saTmsBbz/KT/ti3QB7RWLpSIfCb7SQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f61146cf-096d-606c-591d-516d659528c5@suse.com>
Date: Tue, 22 Aug 2023 15:54:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 4/4] xen/vpci: header: status register handler
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822012955.312930-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b7d843-3d75-4e86-34e4-08dba31760bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5+jxJrmOsfq3n6pvqNQGUc2Xeok4wjAB0iCGNO3YggBtqbidbWhQ/gSVS1rwu03vAtSagEiKXNQte0x5f/hNH55kc+WJHjFx8v9ixTWZEAtYpJIeYTHm+Z0VsiTytxkA1NIYby6T//A7ULL0oK5ihBpP9jLPHbdhXW1u4g0fLIfAcScTyC/6gW27jHxA6/Bw+stFIoDZ83BwmjH/XTVNgP21EqzfOXY6VhrktVwkO0mKzklT3zyn0xFIBGmUqTj5oLsyffq8Qn1dda7swUxbMPeEslN9/2GlvkpH049/19q/5o57zQxhi6cSR92Lc/eJSTcm8WmEWNx5e6dTLPWczlF4fpdwi3Fywhs5DtfhawSiIjiOx0noW23OA6+bHbx0wwrleezJvRy7PXhV3fyI/MMlejWcHMM20xRXzJSLGFFXnP79L4hAwvgqlOIgnAfutHdtc4gV2Ov/hpSS+NF0SFEGHAvTBhj+T8nxKFeskyZ083f0vClzeEsrBLoqJQPk9YCOizXkRIkciNghdZlROrESUApr2uuJs3M/ZBDB9mj5FNNiiUwhcGe/8CNMPZKI0NNaY4vEwPJl2qnvN+XsMr1MsA58RaAJEnZe5ElKiWkLPcKwtpVWWa1/361AqHaX1LgtjSelpKDQPt8j/xye36hcvNCZHGv66yBw3nY0KbD3UFYPN6knJWyrAGETdtEs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(1800799009)(451199024)(186009)(31686004)(86362001)(36756003)(31696002)(38100700002)(8676002)(5660300002)(26005)(2616005)(66476007)(6506007)(66946007)(53546011)(66556008)(6486002)(6916009)(6512007)(478600001)(41300700001)(8936002)(4326008)(316002)(83380400001)(2906002)(43740500002)(45980500001)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNOSVJMVitXeFNHVUhrMFZMV3VoQXI1cnRtZWpFVkc1VXYraldNTXMyVC95?=
 =?utf-8?B?cTRVQWNyZzkrVnNxYk1FMThubnIvMjNlUDM0TVlJUWU2RHozT3pHcnpORHJ6?=
 =?utf-8?B?VWQ5Ny9HOVB5RWRIY1ZlTHJ0QUtKQkJNbHZhWVQyamFoRUUxVWdrMVFZUzhJ?=
 =?utf-8?B?Y3lXV0U3YlVPQ2ovZmQraGNnRzU3N3NnRnJaTVlDNG5zSjc2N3pkdGtSSVV3?=
 =?utf-8?B?QVhVemNGazVBa0RvVC9xY2RPOHJ1ZC83MjBvUEh0amRQSUs0OE1wZHRxNDBV?=
 =?utf-8?B?N2hTbmRSNnB3YU9ZQldKUVZQUnI4UmxoR2s4QnRnRnBxN1I2SWFjd3NqUk1R?=
 =?utf-8?B?S1Y2OFdxMmhNRnlCYTc5MmFsZGFtbi9KeHlpeS9KUDVWM1JGNkJzV0tBOHJm?=
 =?utf-8?B?eUlsV0RKbXRmbFNMWkdzSlU0ajBoUzd5aThsc1NlMjhKRkEvdGtERlpqNUNK?=
 =?utf-8?B?RTZWZG00aUpWeTc2czFCbHdjZms0MnNXelJsdGRwek9WQ0YrbkZEQ1BVZkh2?=
 =?utf-8?B?NTVhK1VwZzBBTno0YUdBZm9zcVFGTzdZeWF2bGEzZW94QXBtNW53bUtQU24z?=
 =?utf-8?B?Qy9VVXd1cXZEQ3R6N3dnNnpFWVlkamY4Q0FQU0VEcUszcm1ubEVnTmxQRk9N?=
 =?utf-8?B?YXZSL3c5R08yanZyL1dFMTZ1bUFHNkRtUGM0LzFmYTY3L29XcXBLYUhoYVB2?=
 =?utf-8?B?WFRPbGZCVGg5MWExaGgycktqU0VpNmtKRWFqdXdSK1NiOVQ3VzhLKzRFUWl3?=
 =?utf-8?B?T0o4eUdyaXRvK20wd21pKzBzbTMxYkZhK2ZGbFBvS2RDN3Z2RnJ3aGNHSkJm?=
 =?utf-8?B?K1J5MC9mTlFUNld6SVRHbzBXQ0VoVE5pendsV3R2ZHMwZ3FYc1BEdkppb3d1?=
 =?utf-8?B?bGxncllHUEIyUVVzZkVLdkVRbDVVQmpXS3kvMUlTTE5odlg5aTlIckU4NUIw?=
 =?utf-8?B?SnZZaWdlRFh2NEtteGRUV3lhQW5ubUlBNGxTZDY0ZHR1NkFpNkgvbmdxQ2J5?=
 =?utf-8?B?K3ZISnhwaU5UeGM2RmVHRDRaNzF0M0VWcTBJdUI5ZHNQNUtIYmNXWFJMdzRE?=
 =?utf-8?B?S1k1czE1bVljTmpCNUh0QW9JZ2E0QU1BQW5jVloyY09RQndPcWNGUTBiS0dH?=
 =?utf-8?B?MWtCcG0xaVdnaitHNlNjV0kzTGZoTTFHZlcrTm9BY0tIT0V3MWsrSUVueVlh?=
 =?utf-8?B?dmc2TXRMcXBac2Uva2YxZ1lna09Tb1ppQ3cxRXlWcFBqcEpoVExBL05rUGNm?=
 =?utf-8?B?R3cwZFlyb1dralBKTW1MNU1uRHFWTVg5VitGSWhZWVVqMVVXU2g1cEV2Y2hJ?=
 =?utf-8?B?S21TTmhxKy9LR2ExOWVGQy9GZncwSzNYK2IwQzNrRkgyMXN3c2dBQVdGKzh0?=
 =?utf-8?B?U01MZTdMUU1UN0FUL2thdyt5eDRhMDQ3YjB6S2REMyt3bnR6LytVMzh1aWt4?=
 =?utf-8?B?STd5eVRJRDFhNWJRWUZmZUFKVk5KSE9TbWtZelFBN0FMWWZQSFhpaG5rSFh6?=
 =?utf-8?B?R0dPMG9yUUhGNHRxYU90S0lCeGllN1NwZjlqZ1JWZDZUN2xEUktGWlhNVjlX?=
 =?utf-8?B?N1VNVXA4NDJuL2dUTldIVGM5cWdDT0g3YVlMVnBiQXgwemlWY0hsOXpubUVO?=
 =?utf-8?B?cWJMa0Y5aUJQMXUzYmVDOGd1a0VWeXc2ZVhBdzlWMVhJejVEZVc2c24xVG4v?=
 =?utf-8?B?OU0wMXRGeFVvVGZMNUZTdTFTempwcXJvYXhaUWJnUHd3MXowNVVvS2RpVm9F?=
 =?utf-8?B?cWVGVm4wZlFLZytTeFpBdjgwMlZnQWN1WDFwUFNCNWk4WmhkNEIxQlkxSW9a?=
 =?utf-8?B?WWhDWVdDdDMxMzlkeGc5OHVpR1JrTG9QdUVWaHBGWWRrUk1nTTlSbm9vaFNm?=
 =?utf-8?B?ajE5dWkxREJGVU9ZWGRmUWQvdnVvZFJCWXNMaHVnZGhGR0xuT0ZJNjlINTV2?=
 =?utf-8?B?cDRqVWxScUVOMDZXRUxROTV2OXZ0OG5BTnF3VFVOcGhpVlF3RVJJU2ZqYTVB?=
 =?utf-8?B?UWh6L0IrUGpBUTgzRzhUdEJTS3RtQWwxREVoUVhSM1RLQ2hWUXRyY2dTcFFY?=
 =?utf-8?B?MjlnNzdlMVk1OW85b0swYVhZa09WUGN4WC9rQmdZM2I1MXQ5cFBhVjBFT0Yy?=
 =?utf-8?Q?qzj4O7ypFa7IwwoJaLOEALYtL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b7d843-3d75-4e86-34e4-08dba31760bb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 13:55:00.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2QQgD7vGENy49dBwfTCZrU5i9W4MrVhdG9CJ3feeCrBS//NTO3YCB+4dy7nk772JzVdzgfxJwrY9E4lLIechg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

On 22.08.2023 03:29, Stewart Hildebrand wrote:
> Introduce a handler for the PCI status register, with ability to mask the
> capabilities bit. The status register is write-1-to-clear, so introduce handling
> for this type of register in vPCI.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v2->v3:
> * new patch

This being a prereq to the cap list filtering, I think the order of the
patches wants to be inverted.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -413,6 +413,17 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check status_read(const struct pci_dev *pdev,
> +                                     unsigned int reg, void *data)
> +{
> +    struct vpci_header *header = data;
> +
> +    if ( header->mask_cap_list )
> +        return pci_conf_read16(pdev->sbdf, reg) & ~(PCI_STATUS_CAP_LIST);

No need for parentheses around a constant.

> +    return pci_conf_read16(pdev->sbdf, reg);

I think this function would better issue the read just in a single place,
and then do any fiddling that may be needed.

> @@ -556,6 +567,11 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      if ( rc )
>          return rc;
>  
> +    rc = vpci_add_rw1c_register(pdev->vpci, status_read, vpci_hw_write16,
> +                                PCI_STATUS, 2, header);

Is it really correct to treat the entire register as rw1c, and with write-
through to hardware for all bits? There are reserved bit there, and -
however likely that may seem - it's guesswork whether they would also end
up r/o or rw1c once getting assigned some meaning.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -29,6 +29,7 @@ struct vpci_register {
>      unsigned int offset;
>      void *private;
>      struct list_head node;
> +    bool rw1c : 1;
>  };

I'm not the maintainer of this code, so what I say here may be void, but
generally we have blanks to the left and/or right of colons in bitfield
declarations only when we mean to pad for alignment with other nearby
bitfields.

> @@ -205,6 +213,22 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      return 0;
>  }
>  
> +int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
> +                      vpci_write_t *write_handler, unsigned int offset,
> +                      unsigned int size, void *data)
> +{
> +    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
> +                              data, false);
> +}
> +
> +int vpci_add_rw1c_register(struct vpci *vpci, vpci_read_t *read_handler,
> +                           vpci_write_t *write_handler, unsigned int offset,
> +                           unsigned int size, void *data)
> +{
> +    return _vpci_add_register(vpci, read_handler, write_handler, offset, size,
> +                              data, true);
> +}

I'm always a little irritated by local functions still retaining the
subsystem prefix. Just add_register() for the now static helper would
imo be enough here and overall shorter to read/type.

> @@ -433,9 +452,11 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>  
>      if ( size != r->size )
>      {
> -        uint32_t val;
> +        uint32_t val = 0;
> +
> +        if ( !r->rw1c )
> +            val = r->read(pdev, r->offset, r->private);

Along with the earlier question: Doesn't rw1c need to be a bit mask,
not a single boolean covering the entire register?

> @@ -99,6 +106,8 @@ struct vpci {
>           * upon to know whether BARs are mapped into the guest p2m.
>           */
>          bool bars_mapped      : 1;
> +        /* Store whether to hide all capabilities from the guest. */
> +        bool mask_cap_list : 1;

I think the intention here is for the colons to align.

Jan

