Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92478581640
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375422.607793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMIC-0000hV-GZ; Tue, 26 Jul 2022 15:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375422.607793; Tue, 26 Jul 2022 15:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMIC-0000ek-Dd; Tue, 26 Jul 2022 15:16:16 +0000
Received: by outflank-mailman (input) for mailman id 375422;
 Tue, 26 Jul 2022 15:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMIB-0000ee-IB
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:16:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140072.outbound.protection.outlook.com [40.107.14.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e347f74a-0cf5-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:16:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6483.eurprd04.prod.outlook.com (2603:10a6:208:16f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:16:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:16:12 +0000
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
X-Inumbo-ID: e347f74a-0cf5-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLQ4oePvXTcbGQDpJ5FuZMIJPvpNomcgAO6wijIqwmQ07yKconfVHSxdg/X0I6V1Dzj8LUe5kjRjKjKv7XZ/iOOC3Ik9EUk0fgOvfoWplIZJACW7Mplw7fmFStcnKGze/g/AEhPB7/3dbVS165XnPky59XjCaDrSHWWKiVgws2xGXG1dPmk701YjFzlEBGg82kNKyG8k3IxXgTtDlMGWXapYZdmxEuNEiXSdoIMJoRjGWIHeyp90tnbv41xHLs5w5FcQYhTVO0vCFxtNubsmYfQmBcCCHHBWGMYkQW9Z85qM2tKD1UgAxiP43VkK4UcAxlNmj/xpdLnKOFV+F1DBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr6t49yUb79LjGrXkFo3m9F1lS3uPNtudkh55r7pH/o=;
 b=OxZTUu25Jlu3DfC5WlXF5Demo7y+1EyYfmDCTV8PleCT2cUNYWxvJnOizlgb0NUxP+31voBWJoTo0CkyrO5yNZlas3AZY1Puv0oHYj6GIQ+qlDqSCXwNCCiIL6XSVJds1Rwla1b/Www0pzYa2Hq2lvd8rLb0nftzYzkF8yFwesuR61fQpyTJCZu9u2QyfFG8OYTlQ5ZZM6FZibOFHIjw2oFmE+mw6E3x61hDehLKc4naQGUwzVyBFupaiJoXU6Zmu8p0bR65Z8gGy9p90Hfs2NZIdaw5B7kDw8XnrBFeAhKriG77annZLATIrZfH2pes2wpbamqhN3aIRpZqON5hfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr6t49yUb79LjGrXkFo3m9F1lS3uPNtudkh55r7pH/o=;
 b=Zk6dAQdNLUUfoG+gbnhTYPycJcwKpUUDy1xD+18iJfqWVyc3F45y9zxvxC1sg9t8LdmTS4tDZTzbIWGfWpGhJ+6UmtcZ+dUqZ96ho0W8v+f27eGFRXd8AUzgmnH4iOTQaC8sz19yBWcy/EAqUPyPX0lyeT49eHznz0ARdJu9xGf+LkMp3fyEy8Zb9JzNmxrMefy6CyVoqG6egR+HNNVmMdjryEMDmG9/Wp6g/MMlB3gQiFvhSrGt2yIq3hmMv49AIqWT8j6FqCGZ/qz7y35LkteKnn2CwPidpcrsVmox0+zjyjXtKdxRg3XFQ1tfplfmmtQMGNX5FCiQkME3EfH5CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
Date: Tue, 26 Jul 2022 17:16:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-11-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-11-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e3cb54-20fc-473b-e185-08da6f19c66b
X-MS-TrafficTypeDiagnostic: AM0PR04MB6483:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ipIbBXjJDbyE2SD/xKStHNkWHiwye1fsAUDcOoTX+SxzuDRJwg2EOmb1hv7/XuYegne3g6orrXwjeFFNl2IWsOTb6cS1buWyO9tSTlufZMBUU8I5ejD8qAXcBNxxUdaE1aSllydlwQsItBnwAcEH8umKIBzfI1vmx+o3S+teXXX/UqwGumzCi9YW+DU9fYMOKFU/XYBqLIUH9P5n4rZx5LCD4zxi+hHnyEMsAtEpiU2B8SgIiRe/lt8n+V7UENoLBW0Ls9jl+iGM9jrCfSqJQyv6F/aE2xDnFrzVfLfr09iv0T66YTf/RCd7Wl8+tMUgAYsDcpXTQQAqP1KK/zKUcRqlPc4Z+i16zbRqx29PSRUOE1xjqiZjJcUab6wEbv9GhxssBhVnzHGHzfy8pwKyGAGuF07hraPMKPgPk/dK6Q0NPjY+tGWao+6glgpielfZZlAAusxxodLowDzi6Bo6iqz3rbRfrcBpK+Z+7iFWKlUYcBxpYGVL1TgqCbAi3PyYdfZlQKD+WJ5/3qz97zJuoJKABAUZBVvA/3n5ep0oNM7Hsygo6ZwMk2uq8OX7me2lafJICqihjEQQH4lOIJbi0FrUGkG0ObHT0TAbfHXrias1EkSrPCN0igy44EraUfsd5R3icXOpW73cz4iOtZMxI72xmKXsNej2FzNYsOBzvLoHCv3deaMN0affCy19RwPejnJbebVAWImwL6OuruFPR563PrmJrFnWCa3xztJmHvvweEjzkfmdgtmat0i6FFf6KGifOK5BCTEHiLGtljb707rsQFfuZ/sfIlnmUZfcqhoVXBqoR5ShF/1yDLAk4I6x8I2zcGe6oEuNnOqleDcRaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(376002)(39860400002)(366004)(36756003)(316002)(2906002)(38100700002)(6512007)(54906003)(6916009)(2616005)(26005)(53546011)(31696002)(86362001)(31686004)(186003)(6506007)(66476007)(66556008)(41300700001)(66946007)(4326008)(8676002)(478600001)(5660300002)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDNEdkIwczJ5eEljTFgrN1RSUkl1RHBGZm1LR0dweHJBUktud2YzL2lSVGxY?=
 =?utf-8?B?L0JyamdoV3B6YXYwVXBqV0dTc2NqUUdWQTkxQzRNT2VsT1duUEZlY241c3Uw?=
 =?utf-8?B?RU5BN2t4L2pLcHdJQlZ4eXpXZytnUm05MGl0dnRGQzlsTjFWTU03ZmVkMXRr?=
 =?utf-8?B?QjZLSGtIMllxeUsrMHJSc2dNYitoUWR1Mjc5RWk2TEhCcHh0YWo1NEdVd3RQ?=
 =?utf-8?B?anZweDFHakJqUFlCckZTNS80OUNUQjFnNysxdnllZXMyS2doaS9zQ3lQS095?=
 =?utf-8?B?NDczcUY4dkh4dkJGODBneWNnTEpsOHlVVkQvcnVzd1R5S1drNnl1N2IrVlVZ?=
 =?utf-8?B?ZzMvOTZZTUhKK1E1bmlLRFhiMnlib2J5Z3lYaTJ4dzhsMW96REF2YTFkb1Yr?=
 =?utf-8?B?eFQ0ZVd5YmRGdU1NbFh2WUNqWGlIN3BPRWpmOUY0bVlqNHFWcEx3TVRNSWc1?=
 =?utf-8?B?a3A2VXZlMzZJNDdpaXVtWFlJbkhUbEE4L09wTThlUmdUejcwWElIWW9xVUZY?=
 =?utf-8?B?eDB6dEE0Mm1JMHovRCtKMEdobXJoUUMwbTA2NW83MjRmeTIreWV1dnhqazV2?=
 =?utf-8?B?bjk0Zlc0Q0RQK0VIU0FzVmJKQXJxOXhZQmc3alQrSGlVNGl3R3dBL2VjUGZI?=
 =?utf-8?B?U0xFVDAxdjNWaGlMRm9KWG9zRmE1b3F3WnhtL2xmR213SVg0V2lHZlBxeThp?=
 =?utf-8?B?dUFxUjdBM1RBS3grT2tJWlRqMVhIc0pCcEF5Z1hnZnk5T0M3RFZCQ0RQcE1I?=
 =?utf-8?B?L2pKOHU4cDZQQjFyOHhvYktNZXhrT1JWTHJZRXdXMUREQnByS05ueHFTdkQz?=
 =?utf-8?B?R1lLSVJiNzZtT0ZsbHZxTHpRSW00dnRWQ1NEM1RraWU1M3lpN2pJK0hVaThG?=
 =?utf-8?B?NEhBTjRQaGgrNXFISmdLQWJCZVlzVDlsRzMrRU9pdG5aZXpwdHpXT0drUHFm?=
 =?utf-8?B?ZDVyU1ZGaHltdUNKQlJBOXBWSDZFRlJSL01xQzlSM1ZDWWZmbFFaTVl2QXA5?=
 =?utf-8?B?SmFaWkNJaE5IYmkwOUtYTUkybmRNTzJUS1RpOUdMOEk5Z2hPcGdTaFpLNGFS?=
 =?utf-8?B?WUpFZmg0RDlCd1U3UTlOdW16NzNZd0wwaHo4Zk5nQXhhT3dEMllMdW1kTERv?=
 =?utf-8?B?WjB5MS94MWtjelJpS2RQV2loRWNoUTZ3cG1HcjNBZHJYK2QvSEZwWnBHdndq?=
 =?utf-8?B?N25Ea010S2FQRkNwRGxjVHJOdTM3UzQ0cCtUUUFDZGlMa3FWaEQ5SlpGbUZn?=
 =?utf-8?B?TXpIL1NsWHN6ZVk3UjVOQVBkakxPMGs1M3FBS0hOMFVrVlVsVjBITTl1REdF?=
 =?utf-8?B?MnM0VEMyOG92cXZqSDFxbFZCdXZFZ2pqT1FLSGRDNnhVSTZJTkRUUXBsU2xV?=
 =?utf-8?B?OTBtd0UvU2t3R01EZ0h5L2E4SEtoUTl2Ym5pd2xYaVd4cU1PYlNDRUhRaWRW?=
 =?utf-8?B?Ni9PZXJBdzJIb0VVTFc5MnJvV2pmUGJ3cXlacHJSalJqWVJwNWZqNGxWNWRi?=
 =?utf-8?B?RzM0MXBQUWFSZndqZElFMUpxZktCRFR2QnEzL3J1MS83NXRpV2ZOSU91OGho?=
 =?utf-8?B?VkptUzlQdDFNZ2NzNURaakJyVGx6S0swVklUTDRZNUZ0ZUlCTGZ5TzlpMG1z?=
 =?utf-8?B?b2QyS0VTa2d0OVR2M25ybG1DNzh0V1FXUDd0TzdwV3NMQWZDQUZrcVJEcHRG?=
 =?utf-8?B?YjJkODlQd21zUWVwZXdUcExBUC9WYzcxcCtvL3lpQ1Vka0VDODhac2RiZUJq?=
 =?utf-8?B?YSt5bGFYR2ZUT21PSHpycUlhSk5FcUdZcGhBYm1kekFNNXlCSWRBdFpLZ1Fp?=
 =?utf-8?B?RThnaGJPeGtEdzlHNmw5T0xEdXZaMmp1NDBHeHZtV3RmbTJ3dGdzd1h6akor?=
 =?utf-8?B?V2JieG0wakwwUjVuTFFqbTU5elBkWnlLem9PVWQwTkZ0eU1ONTk2SVd2T1Qy?=
 =?utf-8?B?enppNXRBdFNYVDFzNEhjVTY4aGNGNGtNdFNyTVpQcUZDL1FjMGtkTHQ3cnhB?=
 =?utf-8?B?MmVpbW52aW5zZ05Wb29zNXF1NGdyWm5OZk84ZEo4bWF0OWkvWSt5Yy92NnFP?=
 =?utf-8?B?bkVTdjhZOVhQQWt0dmtpZWZoNGNYVWhoTHQxclZ3UG1GUXd6S0tzbDBmY2JR?=
 =?utf-8?Q?y3U/WmVcXXERHM1uLi6Rbxuq+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e3cb54-20fc-473b-e185-08da6f19c66b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:16:12.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Du9tnvIkFGzMDtmrL4cuZX1Z8wUp4nPGY8ssMjvKslK9VGyIMErxGA56Jd7MOvIiDV/zAu/L3/mn4ev+PhTkew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6483

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
>      /* data is needed to prevent a pointer cast on 32bit */
>      unsigned long data;
>  
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +    {
> +        *r = ~0ul;
> +        return 1;
> +    }

I'm probably simply lacking specific Arm-side knowledge, but it strikes
me as odd that the need for translation would be dependent upon "bridge".

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -158,6 +158,32 @@ static void vpci_remove_virtual_device(const struct pci_dev *pdev)
>      }
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;

const wherever possible please (i.e. likely also for the first function
parameter).

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -276,6 +276,7 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
>  /* Notify vPCI that device is assigned/de-assigned to/from guest. */
>  int vpci_assign_device(struct pci_dev *pdev);
>  void vpci_deassign_device(struct pci_dev *pdev);
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
>  #else
>  static inline int vpci_assign_device(struct pci_dev *pdev)
>  {
> @@ -285,6 +286,12 @@ static inline int vpci_assign_device(struct pci_dev *pdev)
>  static inline void vpci_deassign_device(struct pci_dev *pdev)
>  {
>  };
> +
> +static inline bool vpci_translate_virtual_device(struct domain *d,
> +                                                 pci_sbdf_t *sbdf)
> +{
> +    return false;
> +}

Please don't add stubs which aren't really needed (which, afaict, is the
case for this one).

Jan

