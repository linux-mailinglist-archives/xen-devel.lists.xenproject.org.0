Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C597F4D1248
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286614.486195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVFt-0003ZP-Ew; Tue, 08 Mar 2022 08:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286614.486195; Tue, 08 Mar 2022 08:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRVFt-0003XV-Be; Tue, 08 Mar 2022 08:31:41 +0000
Received: by outflank-mailman (input) for mailman id 286614;
 Tue, 08 Mar 2022 08:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRVFs-0003XP-L1
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:31:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c712c63-9eba-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 09:31:39 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-gshySC04OSSdj0sPomeLJw-1; Tue, 08 Mar 2022 09:31:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4651.eurprd04.prod.outlook.com (2603:10a6:5:36::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 08:31:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:31:36 +0000
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
X-Inumbo-ID: 2c712c63-9eba-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646728298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=18Z3EfosTrvapQcWeNFkivfBE7wHn5/v6o88RnPMkuk=;
	b=N18tfN5aybgCXc4VQKGa7NVYSKZ5SV3KatumQXEkDeG1SbwlkUkSlZiLgaEEU9CFuescwE
	CQ1g9Ol41d4kgCzaXnxqmsr04XdAHylMUXJTJddhP8vsZTbvlhD7bafVNmoE2+rnWpjpHH
	qHXPfsGrC9XMcLsUjuaKxtY/Gxi7TpE=
X-MC-Unique: gshySC04OSSdj0sPomeLJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSK9nD6jqL95zM7KS5UmqlZiUMlGnhNe84roSTA5Q0/F7Kw5fbwzPwEPNZ7/QubAEvk61U8FIzlHBdG1JlzpHWlOPUlsHRo/8n1rwo1qlGV4nd/0D4KtGfQXjb5xpbqClml/DD2wedPLBjd58yRJq0oHPvWuyUjAdg36yCp+J6efB3suDpPt+FPoIYwuxpVb6/EgjKoVCLsmqJJ0+J0uGIvH/Q3qm817EIIUFakkV/IBjnYjYZQsu5jW5diIeNyh2RX+Vqezt4/My8ZhsODyqgDh9eSkgeLLPj9yen0Vbav+d7iCnWnzaWtnTf6z2dPQnL5l9NiXKS/0GtzjAemfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO6qL/gJgZYfOTZOELUFOkFkuLMC5VouXnJW0Cjp0To=;
 b=c+sVn34hNbHiqcVQSQxjIFjG1QIkgAJYgzTZf6A+1uBRlvkCmbOsVqL0fK6votlX7H8K//GLrd6qeb7+WsqihWjusgqEb6KxKrJPCPGISt69xR1wLKa4f+4gyXQZW08wEKJ/z9hugmwq5MF09nqIugyBl46JWc41gukPQ99mRUwIslz9wWtKb29jQLdEytZRA7CT0ZlDV31uTyjhcUpIz624Alikn7CSl2q2/eh7Fj6CCKGFc3odI/ctUDpn2Hzn6hvWZRkbLc2KJwF2eC+ATF1drt3zS+1QRRGsogXe3mgcO9byE9fUSbUfjyAAG4C9MGnzAqrRC5GswOyL4LnG3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
Date: Tue, 8 Mar 2022 09:31:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] vpci/msix: fix PBA accesses
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220307163744.74030-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307163744.74030-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::39) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2884ad5a-ba8a-438c-a4f7-08da00de0f49
X-MS-TrafficTypeDiagnostic: DB7PR04MB4651:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB465128CC639E9E3798058441B3099@DB7PR04MB4651.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sic5XUJRBX52DVdtXr/qdPdbdpzjzFiiLUDfyssYuajIG1mbRZ5wmJjEo42C9euryl4FWDlXXe7oXRDUwfp1EQlh1xrsnrzYSQRN3tJMI7uWeiZevDlzzwd+Dj5ORbY4capyYdIeOYpaMBTWf2ss7QJHgjzkvwFTTwZ6If7uRXBeCyYV4Mz/T0q3j3B9S/WPcNgv9A96vM/II6SINsTJqV3Z34/v3WqNXR2gSbYRRK/VNyquKiOgEasb/ElnIR+7Xx82TvbTjP6j6qaW3okYIC8LWcqsht3nWZkBmHYu/3sWTJzG8Np1ztHo87NIW1D8T3x+AWpnnWhv8r4Dl/Cc+HXfQ2iqzhyJRG4vHiEBo6LJi95cVFOdemNo4LYi7PMi4VVJBqivgV0mFg1gqBPFmSJx/nk7QEH58FN7ksZh7jivM0hT45kgjwRzKYK0oNFm0pn+ULO4AoZ4YyEZAcbyyJIXJzm3qrKaZUsF57UlrhaW9HWXJl7wZK8TEumTklRd8gi8rXeHfQaiQC7qihrlX8hjuv+r4AdIpwd6TgPMTAI4tJvSwkOPIvexUs2pXKL8dR1rBa5lj/l5aGM56zpLAIuIWB8kG8tzfW4N5IPjMX9gKKfcstfF5Ifluil+PETPPTOW6eBVGI0FSXl7xB1K75coBXTb/tXzIW8KmcgkaXyY5KkLZe3B2MymwaGa0o/PDZUsAprPr5zB7lBC4ACXCO5lw/0tkWzM3BRkmTqve3agKAqa/OvG5+drcVCQIFS1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(316002)(6916009)(36756003)(66946007)(66556008)(31696002)(66476007)(83380400001)(6512007)(31686004)(2906002)(4326008)(5660300002)(8676002)(508600001)(38100700002)(53546011)(6486002)(8936002)(2616005)(6506007)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vRMpPQ484J2ATrOAaJL3vTwtCuYIfeT17Llq5qJFllUnrHEATJnbCXZJckcs?=
 =?us-ascii?Q?E6xHJ00sGMxy14/qPbdqdVkkc0qpOUhr18E28YHyE2sbltTvEPJZcs64waxV?=
 =?us-ascii?Q?NbByd9FTb/uAhfDEaQQCIa8gNHb1+90zU1KA19jVApczne/2UIYobZviqjx3?=
 =?us-ascii?Q?ggiSlrHV4uny+Fv5LYt4Q9mZ1wG25hrXNMau97kieYFJ/QkodmiHzCaGy02l?=
 =?us-ascii?Q?N7ptcN8slkMltbQEe4Pp8TPgeuJlLOhu3Qa6ChJ6IAiJ8OOJFULlk0/PAntv?=
 =?us-ascii?Q?7lPCHg5r1kguboDGVfA5u/TGrQvIlLrk5PvcAsQPXTbveJvHjLZCGjG16csW?=
 =?us-ascii?Q?WxxIOQBfc/uCAR5vu2SI3iDXUe7D5EE89Ba4KPFRFK5yJ8wVYKoFglFUAc9N?=
 =?us-ascii?Q?sz/N2zwzQKFkH1iSoBHR44Cq3Kyyf7Xb9EcEf7dKEtHo4QA5kSX0n3RnKcPU?=
 =?us-ascii?Q?ULA3LNbJWSjcN4+TQG/hxDTzj24MmBXZrd5gFPKD5W86ddsJFaMGk1FUlKVs?=
 =?us-ascii?Q?HFGKxHmIn26MG5GU4J3KlhVxdnE/wSNWgzTw7l4fNWBt+Zuw/tzgOYAySmKz?=
 =?us-ascii?Q?PrXXxb1fcIumaTpfgPRYlx5drus27K3smQCpZerRsc8GYsVMfBJ+i/2y6x/L?=
 =?us-ascii?Q?2b25pvIwJv9dDryosAUtLPVJBmpBMV1PfsWLo2x09MUcHVau3cwcegHOvusB?=
 =?us-ascii?Q?m3CTtqqo3XEq0xJDJan1uC5oph/m9zqi9IJn3dk5eDpJHsaJTmvpLqp8z+T4?=
 =?us-ascii?Q?hvefGvVj3eZ+XdUz/y7soqoGIv9xhTNicJSlR2EmmDVp8AC3eN935LGVC4Df?=
 =?us-ascii?Q?hl+9ZdKEIN95sccC49SBrx/g0B8JVsNZXIXHJE4VR8sBeBP1wmA8ijFgWd2p?=
 =?us-ascii?Q?UV4JvmBcjRyVCnYctsvtkoSTlubDvGbtbTpY2lPOvMieuN8LPfiQhdzSjcbU?=
 =?us-ascii?Q?XjNvmw1VlfRTXk4J0DQuIs7zTnXdgUtLbg7/e673w00OfxpFumIzwOmaEDPi?=
 =?us-ascii?Q?3cdfCDKPVRZdepp28kqhf0q5OwD2yuvQ+LBFJu30xa2ORTHdkjYXd8ZlzE/x?=
 =?us-ascii?Q?fR148y/19ZFYHDIBALReB574XSVDIWxuFeDo0yGxYIpNSE46giDr8/NwFLTJ?=
 =?us-ascii?Q?fYyV148pysJxZyOGJuxoP1Sm1tZgmDe4/NWmKR5w87qpPU15G88yXhexwZyD?=
 =?us-ascii?Q?9B4Fwy53tDTqRcds3P7n3R8aW0/wUzboF5YOaRdtEN6xRBH+zEC+HeT/oQvI?=
 =?us-ascii?Q?r66CfPlPkXZYnmLxFDBey1cJjyRNK8CN6WWkKZTPYPonrDxr2AhHf3A4E3w7?=
 =?us-ascii?Q?IkVQu4/t5n2qsps0jpTlILx0/SllZRF1VgCRQQCso7SVjesWKb2oKBbV/Fb7?=
 =?us-ascii?Q?Fa/z+vZvDIzlCbqAu/98Fr86pmN2aCKrPOqrn+r//JuiZkJUigo3y0fVjS2W?=
 =?us-ascii?Q?dUrfZYH5Crl7i6/JIAv92oSQddApUDofWFeyfOnM64rgA8FexRxX56r8dka6?=
 =?us-ascii?Q?NOUooSw1N1ZkcDmZPyvHG8YH6CkalAQESR6tpigPjqhbMyl2D+yHsb6at99A?=
 =?us-ascii?Q?1Ek+lE8xezb8pmupdvuxrDd0mu/bypMb0DPIF83XPGPyhpXGgKjbzc/u1hMp?=
 =?us-ascii?Q?jT7/67bJ2gqt2DCTqazfE3g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2884ad5a-ba8a-438c-a4f7-08da00de0f49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:31:36.7289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzhR/MlqRpGoQw3ny0WOTCiHDW7+RtDdyEcqSZPBrCSfnPI5AcrKgZ9tJh5wTSP41K6n82dHnArtfE7lPEb3vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4651

On 07.03.2022 17:37, Roger Pau Monne wrote:
> Map the PBA in order to access it from the MSI-X read and write
> handlers. Note that previously the handlers would pass the physical
> host address into the {read,write}{l,q} handlers, which is wrong as
> those expect a linear address.
>=20
> Map the PBA using ioremap when the first access is performed. Note
> that 32bit arches might want to abstract the call to ioremap into a
> vPCI arch handler, so they can use a fixmap range to map the PBA.
>=20
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Cc: Alex Olson <this.is.a0lson@gmail.com>

I'll wait a little with committing, in the hope for Alex to re-provide
a Tested-by.

> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct vpci=
_msix *msix,
>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>  }
> =20
> +static void __iomem *get_pba(struct vpci *vpci)
> +{
> +    struct vpci_msix *msix =3D vpci->msix;
> +    /*
> +     * PBA will only be unmapped when the device is deassigned, so acces=
s it
> +     * without holding the vpci lock.
> +     */
> +    void __iomem *pba =3D read_atomic(&msix->pba);
> +
> +    if ( likely(pba) )
> +        return pba;
> +
> +    pba =3D ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> +    if ( !pba )
> +        return read_atomic(&msix->pba);
> +
> +    spin_lock(&vpci->lock);
> +    if ( !msix->pba )
> +    {
> +        write_atomic(&msix->pba, pba);
> +        spin_unlock(&vpci->lock);
> +    }
> +    else
> +    {
> +        spin_unlock(&vpci->lock);
> +        iounmap(pba);
> +    }

TBH I had been hoping for just a single spin_unlock(), but you're
the maintainer of this code ...

Jan


