Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74358166D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375453.607849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMWJ-0005bu-2o; Tue, 26 Jul 2022 15:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375453.607849; Tue, 26 Jul 2022 15:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMWI-0005ZC-V8; Tue, 26 Jul 2022 15:30:50 +0000
Received: by outflank-mailman (input) for mailman id 375453;
 Tue, 26 Jul 2022 15:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMWH-0005ND-MW
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:30:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecb40b7b-0cf7-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:30:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3706.eurprd04.prod.outlook.com (2603:10a6:8:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 15:30:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:30:46 +0000
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
X-Inumbo-ID: ecb40b7b-0cf7-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZipmgCRp2BX3J3iZuFTG8m4MboiHhUUMCwBdvAoH+POjktK7uCKofB+777AWgwTP838BYfny4Ule6DDCzB1qoV4KMHoSLDK5H/BvKQ5AI4qvXu64p9ymYL56xAB3udOzfMmp93UjILEzjkLUsREaUHNkRD85y8s7CPEPL4tU5otBakxe0VRHC40BMtIdCOa7W0SUpYPE0amH5jkRglGDqqO0X21+eygCVgQgJJKlhl3a0LdVoyWWi/ceupF+7hqR0iccvuSuK3FQqKIH33ZK1n32arAQ/ZGiIsSI2xCbsV0wRybVuweMKjzd8GgaA2DPghqDLhr2fvFdAaIpIRSRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JocGxLVhaQThOw6xbD3S6s9QzLjFqr/F2wA3rOCr5Yc=;
 b=IFDZVs2Y1qtqe88nYWeGwxhQmFqBxVYpYiJl/p85DpcW7tj/RRAT5PpzTg1tNjvDDtWzHadYRMLNBoZo9bXuq0QwZjTuHVj2rsxKd+fRmYjzeSrfZeQ356u+pO5dwxkQIstfCJMpNYx3IeAYr1ywJ1GKeloZR/ETvu65IuZSgk3kz6egXP3r5eclwaQzcTe0U1HUUBI2Z2T+MY6e3iEitZtuJ6VrgUGmAB3hWvyPOG2CFUZu9ypc4VNJjtoVQoyF9p1JrBQB3Bp1Vx8gCaUxsphjP13S0tjWaCuqlysTD+Ecl+YSUVuXAFy+wDA9HcZmZpcq2JDCGzrC1FMI8mwhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JocGxLVhaQThOw6xbD3S6s9QzLjFqr/F2wA3rOCr5Yc=;
 b=JQ9+ifu3QwM4d9blWLzdiqQUbeM9Yo/IbzuP7aYx4zoe3fPdYKjec5izG6nHNqOdvE/uEdSNt6AnEEdKattd+fTo1C2JaGvBFYhkJ6bwvglG3n4TNMW6x7IsBmp8ct94Nh3EcPBBLfdB3FbHNancrLs1KQaduD3fWpCQWlfiIHeTUK4cBDbVQmMktYRDA1ZY5cNo1NOvPymiCZB8rwLhdc+WbhjRfNcXK72tOgODMSOS0vakeFvtzbLrHo2x9qKpA/NZCH/9xwcAKC7lgDWINo39jdHhUEqyJuhkXQp1qqAeFXt6xiw6Hc8xV0uS8GQobbZ77Q7kd0l++IvitrbfDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f2bd47d-cd48-f544-4e8d-a8a698470889@suse.com>
Date: Tue, 26 Jul 2022 17:30:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 07/11] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-8-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220719174253.541965-8-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f2ebb8f-dfd2-45bb-c0dd-08da6f1bcf71
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BTg6mIulQ9rEEwp15WXd2y/BH26/+DZ8iQ19ETdF5NiTKViCeCOzvGmhTKFPzLIh4xuu3Nl7wotoQ+DUQ10BEgtdkRaujPWFqfeOQ3KjHCS5d8e9lRHgfz2luTAzsuTWPx9TYw/1ZTYRxr8lOT3TrIj0p6lA86umxEEQ8cwCfeC1P5CrQ2FibyydjwcIhhiOodXs8baKeted8nMWv/MDqW302nsboe/vQF0ZeeJplXCwiUfzj2tMvqwL6I1gf57RdvMJ1KhXABkfoLsSBHssxi94OSGaxgFCXr2Bc1dzKwl+x5Z4XnKrLMak4QAUKtGIiBHsQNSjqStES9yCDMGlcAUgQEIEfk38BUAc/jYCYY3U6HjzIRHbNZ3cj+JG/kTaMgfPeFFBVAu5oL6fJBqywFb+UHF3zYpd9vp9YhA2buk3pXZLQGVxYEH0RipQvEnTlzYNSaKK+6WziMTIiCE4bzASie5YRY2SXJbE4+nAhgdUCs7QDAUAjwBHFWQdNOpmIs+ukj+uhtMmUtliknJdkZjScxEgxksfX/ooD70x6/nTLdMSZ/LXeY0WfT900OcogPIXgrn6wQeYHOGGi1+gURZZBAGtnLfpCW4Da0GB0AG9MRAFD9RVHXWAGvdsH9yzv4ALMoJW8PgmC/xFC9t4WK0HTayRvOuqaP1PoFgPFBNZ+aHWV4yQ35pqcXDgFAncF7E4Nk0rb2HAwa4JJkTEMFYj5k0l6Ym2vzh2kJTsAomOl8qNTfO2G0nDaI/aAyHyUUt6+jUVOtVWVLFeXWZ33cRA9UTIqev0nHuDWb/XpjFPgdUHtiZyiwjsqo9dHPsV1p/BUPt8xHqXC1s+3/sjsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(366004)(39860400002)(346002)(376002)(2906002)(41300700001)(478600001)(36756003)(66476007)(66946007)(86362001)(8936002)(6486002)(66556008)(6916009)(31696002)(54906003)(6512007)(186003)(2616005)(316002)(38100700002)(26005)(4326008)(5660300002)(53546011)(31686004)(6506007)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUNjSkdPVy9tckJybTd3bU5lTFF5TXBPdWdWL0JpRG5wMVlmSHFHVmxOZitx?=
 =?utf-8?B?OVBobjF2ZEo1ZXNjQnVReTYwUU5mRnhKSGx4VW1ERFJNQmZjdjFyQ2wxQTlz?=
 =?utf-8?B?c2RkV1pybUhUaGVqQXFOclB3TlVCQWY1ek1jaHIwemNMTXZxMm54NXZPL0Vi?=
 =?utf-8?B?R3FaTEpCWU5vRDF2RHkwUHJ1Tkk1SFYreVhKcHdRZGlvWkIwMHVtbWJ2SUo3?=
 =?utf-8?B?bC9xalRGRzRyemRreVlZUmZOQklyWmNYcmhNRGRJQnExNlBJeU1hZUJlQlBC?=
 =?utf-8?B?ZFhJQ3RhSUdGWFkvYkJ4SXpQcUdyZjExb1M2c1dERC9ZZnhENVZXM0UxVC9B?=
 =?utf-8?B?bUd2Z2JTTTlMRVEyODJSNXNlUVhSU0w3WGw0VW5GWitvSzBWdFMzNmltcU9F?=
 =?utf-8?B?YTczN1o3cFBENHo4SGFydWcxSjdaOGMxQWFZb2ZRV1JSNkR2UFZiRHZjTHdZ?=
 =?utf-8?B?cTVKTWpoYjVxUWZBQUlPeXNvRlhyeGFTZVQ0emNTdHphUnZ2Yi9jcW9MUm5L?=
 =?utf-8?B?eHF3T1J4bzI1T1IyOUQrUWRxU090NkVlNk9xTmlVUTJ1cmpHcVlXSjEyYXRr?=
 =?utf-8?B?cnVqOGRLazl6SXlHVndWMEJocHgraGdZYXZ0SHcraUV6aHZUTklTU1hqdUxk?=
 =?utf-8?B?bmlGaTVOd3NpVXRDSXI5eEM1SDJyOFdORDJlSDh0K0hKbUNtNlVVRzVsc2cz?=
 =?utf-8?B?azdJbFdNOWxVWXNwZWVLcmZXRTQrZS9TTXVrUWFaWGY5eEdyUFRYODYzQ3Vi?=
 =?utf-8?B?TkNwVGNrcXlLU04wS0pRSGQvVlZsc015QTlZcnc2QXNpWXFaMkFIZjRIVEpD?=
 =?utf-8?B?L3dINmZSeDIxWkF0TG41b09wTld5SmlvQ3RKaXNTSkFweTE3L0Q0cDV5bU96?=
 =?utf-8?B?SS9ya1lOZmdKRkw4NEJZaUtyVW5uUFNCTGhlS1loOENuams5UzZtZTRTUG5o?=
 =?utf-8?B?aHBQS1oxZHljZDE4OUJOcWVMR2N1SjF3VkJEL2tkU3MwK0tPNGFqV09XbEt1?=
 =?utf-8?B?K3AyUVpOU2t0dm5kMXhTV1J6NTZLSFloVEFFWWZZSFptbVVZazFYL284NXIz?=
 =?utf-8?B?dEM1Y2FXRzFITkw2TVJ3K2w4cDZsR3hBMDAzWFBpUUdRaWY3eldoQU5sR1Uw?=
 =?utf-8?B?b3VHVU9abHJYQ2JiOWh0Yk9ENjdSZWs4Y3MweE1haXpWQ0hMSWp6K1I0MHBx?=
 =?utf-8?B?Wm5sSW9VZlozVXl6MW5wczZJZWkxNy9SYkNxUXZHcmpTU09DVEZUZFB5YXJ4?=
 =?utf-8?B?RzNpUHh5SkkvTGNFYnNDQmFydGlac0pGVEV1NldKMmp0aDh1YWVZMUZnMCs3?=
 =?utf-8?B?MW9yZWVRaFFEN09mVjlZUmpHNXlEcW00NWFRNytUWG42RHFjM2lFbFZTZ3U2?=
 =?utf-8?B?UmY0anZWSjFxbE5uck9wSVpjQ0RKSURiNXVzenNNcWFQZzQ0dm50MDQ0bC91?=
 =?utf-8?B?RkM3WXdNNlI3QW1CZlk4azI3djAraFdSNHVSNDdDMFBhdUoyY2FTS1NLbUFQ?=
 =?utf-8?B?dUcxQlVDalA5MzBwd2hVWU1OSjhqUXp1SEYxY2xNeWowbFFFM0NTQnlkMDda?=
 =?utf-8?B?QURVZEQxanJ6aDg3eE1aZ3JyMDNTeEk3MnF1WUZ2bkluUUcvNkZYOXI1ZlQ0?=
 =?utf-8?B?MnJ0VnFyK202cWpyL1FlUGdUMlBuUnRLbGhBUjI0UXJ5WDYxMlQ2VHlxVDNr?=
 =?utf-8?B?Q0xEQk8vTnBwUUEyVUN2c2hQN3JucUF0ZFlGMWZheGNZM2pOdVVQWTlxaUlO?=
 =?utf-8?B?blJpQWJqUmtTL3BqVEltVVRoM211Rmd0eTE5Z0xUb1ZiYTBvbzhYY3JxZEI5?=
 =?utf-8?B?VHVtbUVzMjQ1WUdoTFZhak1lYUNKaUJxQVFJUVFocjlPcG44bkdrQ2VGUnBi?=
 =?utf-8?B?MUlRenBUb29PQmZ1Z1dpNWdtdkFiaE11eHA3MEszemVNSTJwcS96T2s5bmtM?=
 =?utf-8?B?MFp3bUR4OThMQmdyU21ydzVOcDVCbGNhcmZoVFNFVVgvY3RUM3JNRDA0RmZ4?=
 =?utf-8?B?dndYcjIvQko5R3RaWHVXVStkN09keGNKVE9UL21nZS9XV2ZiUFRjSlFFSWxK?=
 =?utf-8?B?V0o0U2Z0TllmRWs2bFhMenpUUUVyUGtJbWdUa1FtL29kUnQ2MXIzRUxITlpD?=
 =?utf-8?Q?YdJfLsyhA8IVTmKXuiAwz0EvQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2ebb8f-dfd2-45bb-c0dd-08da6f1bcf71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:30:46.2735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSFU1tWg0IaN1Xo1dnJLlWhUIpUA5odnMMhbpkQf1CJYCD5kOTCiDwZ1pAuyxss1P/ynCIvkUCLO7bsXS8njiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3706

On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -443,11 +443,27 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      return 0;
>  }
>  
> +/* TODO: Add proper emulation for all bits of the command register. */
>  static void cf_check cmd_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data)
>  {
>      uint16_t current_cmd = pci_conf_read16(pdev->sbdf, reg);
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        struct vpci_header *header = data;
> +
> +        header->guest_cmd = cmd;
> +#ifdef CONFIG_HAS_PCI_MSI
> +        if ( pdev->vpci->msi->enabled || pdev->vpci->msix->enabled )
> +            /*
> +             * Guest wants to enable INTx, but it can't be enabled
> +             * if MSI/MSI-X enabled.
> +             */
> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> +#endif
> +    }
> +
>      /*
>       * Let Dom0 play with all the bits directly except for the memory
>       * decoding one.
> @@ -464,6 +480,19 @@ static void cf_check cmd_write(
>          pci_conf_write16(pdev->sbdf, reg, cmd);
>  }
>  
> +static uint32_t cf_check cmd_read(
> +    const struct pci_dev *pdev, unsigned int reg, void *data)
> +{
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        struct vpci_header *header = data;
> +
> +        return header->guest_cmd;
> +    }
> +
> +    return pci_conf_read16(pdev->sbdf, reg);
> +}

This function wants the same leading comment as cmd_write(). I also
think you better wouldn't give the guest the impression that r/o bits
can actually be written to (but getting this right may well fall
under the TODO).

Jan

