Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659032B0274
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25626.53514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9Q6-0001Ir-11; Thu, 12 Nov 2020 10:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25626.53514; Thu, 12 Nov 2020 10:01:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9Q5-0001IS-U2; Thu, 12 Nov 2020 10:01:33 +0000
Received: by outflank-mailman (input) for mailman id 25626;
 Thu, 12 Nov 2020 10:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kd9Q3-0001IN-W4
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:01:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 683a9b9c-9f18-4925-984d-6e08dcca4426;
 Thu, 12 Nov 2020 10:01:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=muz0=ES=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kd9Q3-0001IN-W4
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:01:32 +0000
X-Inumbo-ID: 683a9b9c-9f18-4925-984d-6e08dcca4426
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 683a9b9c-9f18-4925-984d-6e08dcca4426;
	Thu, 12 Nov 2020 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605175290;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LPB+MOynVXrGbQ2NEPx3hpAKCWshOZZfLevv6KQbSKE=;
  b=DSBYm2nfNFzmVh23LSmLR4xwjOgDpOSZQcMqNF8m8vbF2wp9sIdcTzpV
   NwcoZXsl18ZkCLPESQ+o0jC1LxAsxZnorFApZv9cCBRgPC5UN1FOLA4D/
   30JBVfSUWq0/znUlgUZqRSGoHSp3/XTIZC4j58yrKzzFlZ2WrocuKf8XA
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F46ydT1aS325onma9RyqqrdjkSNl9POVjRCUspYpv81Gzq8tq78866xIDOYJgPiKXJvhTMdUND
 XA2TlcdYNv6qPXvR0ncYFu5L8Cv17IuckHdITdC1KQkKLfXDa9mXHGgja92PuICXeu3+vEQdiz
 w8PyJzcEy2FVg6vrkl81dyIXu/1RfXJheN8l4CQ9sVkUQqkvaCY82Nicii1YlIoHhjANUyb2/g
 bizfPy6xwCXa2PSJ3l4OW9ruEvuoXUWST4Q3Si5pFelhL1RbmSIKG6YlLRapqoiC/jMwu4kF/W
 k5s=
X-SBRS: None
X-MesageID: 32136777
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,471,1596513600"; 
   d="scan'208";a="32136777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN58BN1eT89nD6Ff0OLtio/yrxMJqpSkXd5myzXzWnIg2StEdbuxt2http+wQ21hshRwRzsdCfon2K0Rk/CWsEkKyTbrSRDtcfhRtZYEdc3EclkE5rKdqED6FOQRGxppG7EDGHjt/e0qIbUQv8v52MwZFMSNNh/thk2BC3wuW/6IJmY0ZHoUhMEwn4n8kKZkGOW4V3IGUPOVGa1MthSFhcLWTnf5ElKx0NDC7dmfNffct7ivyHLC9D7CtKXY27uh5ySqNaAuhhZLzaoJdhefDSWfBEmNYtpAjTGXaPQt1vzRDxD2LQfJ85zR1YxAlls8gyJ8KffGcYrUaNL7UftMsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lLsArM5AFO5Eqjh3IDL4P3VCMj/DqDKaksWPmoGUxY=;
 b=O8oszOGvb6w4XjM0PnISwJzk+MEnCkpZRaVPByfW2KO8loKtWIl1AobwPgvDPN1Z86mcM2hzC6A3Gz2dEgNYgvlAp5G/H/lubhQUmY1QSICT1Ph9kaxy0t7fLdX/KFzwIT4ftLrnhaGTuDLYtPnwmJRsdhsR3bzysxUnjgmgqBYc8ZsmHPSgOexpa2QwEfl2/UsTsP1cGLAI+E/9WrQhCw/CM8ZT5o5VwijDZcLSe59Hb8F4Bn0B9DlYcZtyVhbLT+VLQJVnbb3NtH+XHdCAsKz9pCyqfI12zxcnecEubYiXn2VeDUr+vsY4XHbeVVqZGLARItpjnRiZruAvuxanCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lLsArM5AFO5Eqjh3IDL4P3VCMj/DqDKaksWPmoGUxY=;
 b=AP/ihwLHNMTMw82VJrPnkKmKebm5NVp+8dn1PIvERHNc7WKdA079f2V9bdULjUl09jtRQxqEaEvQO71GBj3QmfboZndW1vyPHUUgmMl9vC/LNF1fzeJB7y8hxXcCpcW3s3pQ8HqgIWy5AxaLRMwWQQ3B8axSKK/Nze0KwcwJ8rw=
Date: Thu, 12 Nov 2020 11:00:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <Rahul.Singh@arm.com>, <Bertrand.Marquis@arm.com>, <julien.grall@arm.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH 09/10] vpci/rcar: Implement vPCI.update_bar_header
 callback
Message-ID: <20201112100054.z46hjf2qzcag6sv7@Air-de-Roger>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-10-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201109125031.26409-10-andr2000@gmail.com>
X-ClientProxiedBy: PR3P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::6) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a29bac05-8b9e-400b-e6e3-08d886f1db4d
X-MS-TrafficTypeDiagnostic: SN6PR03MB4254:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4254E1D7775D59D40E3FEDD98FE70@SN6PR03MB4254.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sNink+9XQ9URyhbkvsIIm07G4Ck0DlUkOsvca1EhCsLTwJZvxDqdd5+fVe48fDfoW9NAEkB7jJ9U9fQwcWYw/1PLCNgEFFduTlfN5AiwkPEmujWq/KaTb0097GQSzrN+8wnzP9vHCIxH2SzXhZtStT7qTK2AX90C4n0UIth8hxRJfGkRYsb9thvbnsD3LnLlcmXxc+HCGC7S5CjooERgKckmo+DfvsozFf2xssZulPJA+hoiKcWVZL/pTqG2nvXTs8FohtBd84G34PDm2J9rxMZYTzU0nPAWSHevQuWx9az0TNnIu9RkfoQhLXPrNyWtS6Zp6WqaJavci3mvbJbApg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(33716001)(6496006)(2906002)(478600001)(6666004)(186003)(8936002)(26005)(83380400001)(956004)(16526019)(8676002)(1076003)(6916009)(6486002)(85182001)(66946007)(5660300002)(7416002)(4326008)(66476007)(66556008)(316002)(15650500001)(86362001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: KA2rTucjSDN4DGX3MUeZ4rHrrIZEs8SBkuZNOPC2opSf9xEIrBtzK4jAOxlXKdA+cZMi2pTAjfuLsDemVfiRqTy5AMhDb/pk8LGTLis9fxrbMu6MASOIxEhDTfsDgNYWsxDMnFwa+G0G7XxZsCLLAgiMqsEB0w7aecWr4WJDiQ53/f3DHMG0bCzVrzVmPEYETezx6kyP7nByaLWO/NuJuNWsaEwqPYh7zXKvImBQOLtbTeZy0oaCH1YbPOLcbavwc1BebAyegh+EU0Ilv9ikgJsJhcFNYtH5vJRsmArMYWfNhgPi/bvfhZR2/fr0nx3MfBiD3wPh0bNRTkcvPPmVA5rkp1hdq7ro2l2oOBhwx4+zTCv2YCj4zZjjvOfp4+dFbB1I2JtQpfsFEj5r97TpkXozU+s4y2GGbVqS8PHE/8psjt6o2dS76uJuUAsWPUnQ3bLHUAw/oR14UQKhzLObldxQ7Pog9/puTCzLKYZZy0qljorddC82GladRVJCqVxqga8zfnTZkZ8hg69TAyl3asGdHZLEZKkkmT6sHtLXcuLq5+x+wF3RyGnZTnkmL9Dv9J6tOvKHDiGNOzICY7okwSP1OrwppkDYuwHVaPlQgIsoz6KEwUVZvH3TaVzHGQKoT2esvaYIjYi7ljg+y/a55g==
X-MS-Exchange-CrossTenant-Network-Message-Id: a29bac05-8b9e-400b-e6e3-08d886f1db4d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 10:00:59.9173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVkcEeOvXcFth48HmM4UiAuGNfzSzUTbVYq9u1fQ/fIP3VFK2dwbJLzzKKzEGG+IAXnwHB6ymGl3lB7/ynTXpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4254
X-OriginatorOrg: citrix.com

On Mon, Nov 09, 2020 at 02:50:30PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Update hardware domain's BAR header as R-Car Gen3 is a non-ECAM host
> controller, so vPCI MMIO handlers do not work for it in hwdom.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/arch/arm/pci/pci-host-rcar-gen3.c | 69 +++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-host-rcar-gen3.c b/xen/arch/arm/pci/pci-host-rcar-gen3.c
> index ec14bb29a38b..353ac2bfd6e6 100644
> --- a/xen/arch/arm/pci/pci-host-rcar-gen3.c
> +++ b/xen/arch/arm/pci/pci-host-rcar-gen3.c
> @@ -23,6 +23,7 @@
>  #include <xen/pci.h>
>  #include <asm/pci.h>
>  #include <xen/vmap.h>
> +#include <xen/vpci.h>
>  
>  /* Error values that may be returned by PCI functions */
>  #define PCIBIOS_SUCCESSFUL		0x00
> @@ -307,12 +308,80 @@ int pci_rcar_gen3_config_write(struct pci_host_bridge *bridge, uint32_t _sbdf,
>      return ret;
>  }
>  
> +static void pci_rcar_gen3_hwbar_init(const struct pci_dev *pdev,
> +                                     struct vpci_header *header)
> +
> +{
> +    static bool once = true;
> +    struct vpci_bar *bars = header->bars;
> +    unsigned int num_bars;
> +    int i;

unsigned.

> +
> +    /* Run only once. */
> +    if (!once)

Missing spaces.

> +        return;
> +    once = false;
> +
> +    printk("\n\n ------------------------ %s -------------------\n", __func__);
> +    switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
> +    {
> +    case PCI_HEADER_TYPE_NORMAL:
> +        num_bars = PCI_HEADER_NORMAL_NR_BARS;
> +        break;
> +
> +    case PCI_HEADER_TYPE_BRIDGE:
> +        num_bars = PCI_HEADER_BRIDGE_NR_BARS;
> +        break;
> +
> +    default:
> +        return;
> +    }
> +
> +    for ( i = 0; i < num_bars; i++ )
> +    {
> +        uint8_t reg = PCI_BASE_ADDRESS_0 + i * 4;
> +
> +        if ( bars[i].type == VPCI_BAR_MEM64_HI )
> +        {
> +            /*
> +             * Skip hi part of the 64-bit register: it is read
> +             * together with the lower part.
> +             */
> +            continue;
> +        }
> +
> +        if ( bars[i].type == VPCI_BAR_IO )
> +        {
> +            /* Skip IO. */
> +            continue;
> +        }
> +
> +        if ( bars[i].type == VPCI_BAR_MEM64_LO )
> +        {
> +            /* Read both hi and lo parts of the 64-bit BAR. */
> +            bars[i].addr =
> +                (uint64_t)pci_conf_read32(pdev->sbdf, reg + 4) << 32 |
> +                pci_conf_read32(pdev->sbdf, reg);
> +        }
> +        else if ( bars[i].type == VPCI_BAR_MEM32 )
> +        {
> +            bars[i].addr = pci_conf_read32(pdev->sbdf, reg);
> +        }
> +        else
> +        {
> +            /* Expansion ROM? */
> +            continue;
> +        }

Wouldn't this be much simpler as:

bars[i].addr = 0;
switch ( bars[i].type )
{
case VPCI_BAR_MEM64_HI:
    bars[i].addr = (uint64_t)pci_conf_read32(pdev->sbdf, reg + 4) << 32;
    /+ fallthrough. */
case VPCI_BAR_MEM64_LO:
     bars[i].addr |= pci_conf_read32(pdev->sbdf, reg);
     break;

default:
    break;
}

I also wonder why you only care about the address but not the size of
the BAR.

Thanks, Roger.

