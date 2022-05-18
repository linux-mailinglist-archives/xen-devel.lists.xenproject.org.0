Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A3C52BB7C
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 15:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332178.555826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJlI-0008AI-JL; Wed, 18 May 2022 13:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332178.555826; Wed, 18 May 2022 13:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrJlI-00088J-GM; Wed, 18 May 2022 13:30:48 +0000
Received: by outflank-mailman (input) for mailman id 332178;
 Wed, 18 May 2022 13:30:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrJlH-00088B-45
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 13:30:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e5a865-d6ae-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 15:30:46 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-52CYZIcoOWeLK56KO69bFQ-1; Wed, 18 May 2022 15:30:41 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8139.eurprd04.prod.outlook.com (2603:10a6:10:248::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 13:30:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 13:30:39 +0000
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
X-Inumbo-ID: b8e5a865-d6ae-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652880645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zfuZRJGHaXbHE1iSGSCOagDuMGcgcIz5rmybmP35Y8=;
	b=KL+jmHAabUQXLWATfGmHxjQu1dGzav/MT0nyDSKgjeg/QHcQibfZGqk8HqgnJ/i7kMVRDi
	q7bv3cTbvGlfDTSc2ZP4nj7LQH1z6NTd89QKdSyU/NVTsGhxbfOheeaBdO3n38p1J04EDF
	UcaflDR3m16ataiyxYMBUyXlZUilM64=
X-MC-Unique: 52CYZIcoOWeLK56KO69bFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YId4uIYxx2j2dIf1xAtJVlpawz8ou4yvFfG5GAR+g1t+fbb5ftqHZ3guq73PUanI0r32qBl+udXk7KjVteCl0NbHZw6BTH8VEnMbPtwhEJwX0UOr1DwW+g6eUPBIiBtc2h0i9AqDOhWUT61gGNFg5yhmkj7wtKVtmFfc9PQTRt/VhHfR/F3bgLhW29DMnijVjBKUWIN2cIPbPxgVoctk8DsJO/lhMUSXV6x2kJ547jE6mJDhjo82MZCZzPcvU3HnB11NIKyZFspc7thowiDhVgZENxmGKA/Tb5zoXR2q7zTjiPyfFCf0zYHQI24j/ZsuDZmEkpHTf+UYVJXIMkoBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZwWP9WKr1TiKnBhwsqjwfLpGJEuh48drxaM7ZB8l/Y=;
 b=CUTZc+rOwsuhVLQcTaSI94Gss/FVqq+KdidzejrU58u7PTy/vgsvbicsJP/RFNTAfJUNtPLyYYyNMUG2JouFjyn4bKsnTI2jxU19oHWyusIOewjicB9nuXj0JHoKTe8hGZQwWn0PAu3Mbyt56egJ/GSXN6T1bN2fP1/x2Zo/Oi6FbWbTEawrT1s/WMo3ZTqA/lO1a4lP6ibTv1WrXhDxoJM/BuCVnxM40lmDZp7VHyLdE6YlzNEkc9MOIOXPn03k5zsJTcYyvJudqkSaRqyrb1PLLA/NsUOzyMJxmCO7nXWOvtlJqb/C6GHg9+ekPjyKho7zYsfc9oI7LG9BBHzVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f81355e7-cbe2-4772-3799-9e53d15c458f@suse.com>
Date: Wed, 18 May 2022 15:30:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 8/9] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
CC: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-9-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220511014639.197825-9-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0028.eurprd06.prod.outlook.com
 (2603:10a6:203:68::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bda8cdf-c9a4-4875-8b55-08da38d29986
X-MS-TrafficTypeDiagnostic: DB9PR04MB8139:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB81390092CE2CF57B5C46E6F4B3D19@DB9PR04MB8139.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cpzdjy8uE+Wk741noQXdT45aAStbHCKEZVMeI7Cp2SPOdr3AWoiRhWHeL2+/cPjlJ9VYqcxY5SqeL23hXMmWq/s5QS1kfSQ5N9N3Yf4VkYGqgrtaVcfo9sHsUCGuqXoNhJ969w3KCE9aPe6lHYeAsezRMYVDY0zP/FoN7gYNmmriM1QTLCT3H6JPHlzBHm1b6qFY1mFIbWhclNKdezFNf2V6Enc/Cb8Z5zAKdLTG3Db0UaqIdNlJMrf3Z1xdg1BH3HyTTfhPH6uppdstwiX1z+ptq1C8qC6BrKObuAPsCVSjK3EhyaYfoYOh6bvKomHKzPmxN9hIeKfhhmkk0oYsucAUDfiTkvgIe/2/gx2RcS1X5wrPJkSkwejfuKAawajo8BnvCokkiz6iDc+7AhoDEswNmDdRFAGRd5PN0Aq6/lLudm6BZ+3/M9IKq1hyXs4OKXCEDwOXX6VLPsJd0HToXwwedn2RUFhC/b19voDP5TQG2qeSbcAoU6KhhcF/vrYN1oLiHDKLNDkm3rkLIlRVAODurMWhoM1m0RL7LgtvB1i1ciMd1xhwOPJuzbUkgjDk8O36siP+D641ab6xIYEFgU2PC688uR3M4pFWBko1P+Zw4uSgDeU5BDpYiWKX2s7f2YFrjMJ+mQg0seDZXTqF3wmJTNggCRR13hHoiaT63F6g/ftz0G671jR9462yrYatGlEEadrck4/R3A/79m4ZJNLovUGZkypDRHxEBIunW9fewEDDEgbZ0Db4m0YqfdUr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(83380400001)(6486002)(186003)(316002)(6506007)(31686004)(5660300002)(2906002)(36756003)(31696002)(54906003)(38100700002)(86362001)(4326008)(8676002)(2616005)(66556008)(66946007)(6512007)(53546011)(26005)(508600001)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3/faVhn5f7/Zz5fxMIAhZSGJDWk0QZug38RG4JBBBrknCOV8IOL3+4YWo854?=
 =?us-ascii?Q?c+I4GlWzxcz2/oi8s9WsY3zuX2ffCCW/mADdpUW40ygcMLJa7DL5sKtwfTMx?=
 =?us-ascii?Q?FyEgCy+TUF89jSOVhBzKjbJNGM6tPLPQlHHL513CyAzmRTsNg2CKYaxSORY6?=
 =?us-ascii?Q?93nf0udB9unGyfxSnjbtRMrHoDpKrjLJDKvxWcynp/oMG6A8EBxjo5v1mM3N?=
 =?us-ascii?Q?iojB8Yh6uwwh09q8jvjguhAD3jVeCLw8N/XY+ta7m9iihiP10OX2Y2a3mJR+?=
 =?us-ascii?Q?5xJkCtfz8WU0ZOQKjB1LdKT2Kq97HhfLLEUdafBJtxlXoJlEfWJQo0a2pwzS?=
 =?us-ascii?Q?Jh4uCAdmZGp5GfTk3rCFQ1zcUy6Qo4jQq9zcrk3gj95LWpyzJWZLnU23JLLf?=
 =?us-ascii?Q?tSB9/cLdmxFockhI2XkBC8vcwlxtwFHduKeKwciFg67ZdqdDnfCknYiM47wP?=
 =?us-ascii?Q?o94XY66jyeHUTYc0XAN85if0/5/hPesmAxbN92jwbE9McZY9PWoLfVemWbVF?=
 =?us-ascii?Q?UqBbyep0gNzbsv7MOqlYtQRFaErCdcee4b1kgSLnHqH6+PX4w3g+CL2NgKPj?=
 =?us-ascii?Q?gE8J10/P+YQ4snpxRI0FGa+vKlWfXI66SGRvUWeF2z6swossK7iRWOD72MGd?=
 =?us-ascii?Q?icNlMT30vOCV5jEIsADVH7/Opj/yvKUiGvJvtkFMBM++IBe8zV8o51zUNq21?=
 =?us-ascii?Q?GFfi8Qu+TVdAsYz/Ffvzq+GGVJGkv3nftKGntllD4UL1D5Kd/7IAheIWtK79?=
 =?us-ascii?Q?Q/S4zJyb5o6SYjIvBV1QMaG16gVeInBH2sbfAZSFYmVvA/YV4N/E4NYfK4mj?=
 =?us-ascii?Q?ex11SaP1dl5FvzMPTsht6YfoYbNQiQoptJBi0HC0SvYV/Q41TntzIXmhsK6P?=
 =?us-ascii?Q?58NpnvuHFAUsp4kqcV48Vko9BOsdtcrKTj5a+GWNJe50Ts2sq+Nse88ZB50M?=
 =?us-ascii?Q?wsuVJbKDCUjueW8lk982UkjHAynvMAkQE65QUYoz+CLDJeVDEKWO0ahovhje?=
 =?us-ascii?Q?fL1roIg3nhV1Wfx2CaQYvVZm1CnYtjznTTUKZtuKRB61rx0dBsRSilfui/67?=
 =?us-ascii?Q?r1jdLdftXHFVzHdvlRg1K2xvRgNOeqUVGQzr3LTxq6PAVkQZ3zLJeVB9jXzk?=
 =?us-ascii?Q?9gJCFjmHmvajq/D7isPqVNnwI053MLCFWI0GYsSDmDTq8J4WTh88skBobTyg?=
 =?us-ascii?Q?U0nUn9U0FZcPD2I/CwfRHfoM1R7NhLdHTyhA02Ml80HsXfzLqt5Gd4DoPhLg?=
 =?us-ascii?Q?G6xMX+fJvDvq1V0ppxWFRn13L1SfRFarOxeW9EJey7DFpgdhr5jS9LTcmDa1?=
 =?us-ascii?Q?+YHWb1KaPRAUMLM0e3sS+6ooCni1nuPKx34cakQB7xT1utwfV4PEEXLqrycL?=
 =?us-ascii?Q?LeBgM0ETF4b1LcdxziP79t4D/bfgGJWkv4ydreXTS+WVYlVFFb7TO/W2bq3N?=
 =?us-ascii?Q?Ay/yof/0lehM2lfsTdCcpdUrJztnz3hX0MFZseQ9wrJ7AR8mNEgh/wCHUf6Q?=
 =?us-ascii?Q?81lGa8Yi/IfeEOay4q4A5V40lNo03mFeeDp8zLNnqa2ydNjZ3FoeGgxGdsbp?=
 =?us-ascii?Q?nwChbcJxaP50EJiO6s4g055jtBkw++3fUIphJswict5NLp9yugyDwSWWm9pB?=
 =?us-ascii?Q?kuOFp610gz2yg2PfVsef6XzOjaqC9j/8N9pvN9llJ+rwBdMXJmOznmeHh9mG?=
 =?us-ascii?Q?XrtdP9NIF65rc/OL5PrBy9LTiHwn5E2WyfqTvfm+jfW7gqvLphav2X6hBCs1?=
 =?us-ascii?Q?yGO38JHC3A=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bda8cdf-c9a4-4875-8b55-08da38d29986
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 13:30:39.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVsZ5X+TupkdyscZvcHXRQko0LO6h9EHFqimF7dGnyoizKXUIr/ZwImyfJ/dvqHyDv0yfRowMMaaV09A4XHP8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8139

On 11.05.2022 03:46, Wei Chen wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -42,6 +42,12 @@ static struct node node_memblk_range[NR_NODE_MEMBLKS];
>  static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
>  static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
> =20
> +enum conflicts {
> +	NO_CONFLICT =3D 0,

No need for the "=3D 0".

> +	ERR_OVERLAP,

While this at least can be an error (the self-overlap case is merely
warned about), ...

> +	ERR_INTERLEAVE,

... I don't think this is, and hence I'd recommend to drop "ERR_".

> @@ -119,20 +125,43 @@ int valid_numa_range(paddr_t start, paddr_t end, no=
deid_t node)
>  	return 0;
>  }
> =20
> -static __init int conflicting_memblks(paddr_t start, paddr_t end)
> +static enum conflicts __init
> +conflicting_memblks(nodeid_t nid, paddr_t start, paddr_t end,
> +		    paddr_t nd_start, paddr_t nd_end, int *mblkid)

Why "int"? Can the value passed back be negative?

>  {
>  	int i;
> =20
> +	/*
> +	 * Scan all recorded nodes' memory blocks to check conflicts:
> +	 * Overlap or interleave.
> +	 */
>  	for (i =3D 0; i < num_node_memblks; i++) {
>  		struct node *nd =3D &node_memblk_range[i];
> +		*mblkid =3D i;

Style: Please maintain a blank line between declaration(s) and
statement(s).

> @@ -310,42 +342,67 @@ acpi_numa_memory_affinity_init(const struct acpi_sr=
at_mem_affinity *ma)
>  		bad_srat();
>  		return;
>  	}
> +
> +	/*
> +	 * For the node that already has some memory blocks, we will
> +	 * expand the node memory range temporarily to check memory
> +	 * interleaves with other nodes. We will not use this node
> +	 * temp memory range to check overlaps, because it will mask
> +	 * the overlaps in same node.
> +	 *
> +	 * Node with 0 bytes memory doesn't need this expandsion.
> +	 */
> +	nd_start =3D start;
> +	nd_end =3D end;
> +	nd =3D &nodes[node];
> +	if (nd->start !=3D nd->end) {
> +		if (nd_start > nd->start)
> +			nd_start =3D nd->start;
> +
> +		if (nd_end < end)

Did you mean nd->end here on the right side of < ? By intentionally
not adding "default:" in the body, you then also allow the compiler
to point out that addition of a new enumerator also needs handling
here.

> +			nd_end =3D nd->end;
> +	}
> +
>  	/* It is fine to add this area to the nodes data it will be used later*=
/
> -	i =3D conflicting_memblks(start, end);
> -	if (i < 0)
> -		/* everything fine */;
> -	else if (memblk_nodeid[i] =3D=3D node) {
> -		bool mismatch =3D !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=3D
> -		                !test_bit(i, memblk_hotplug);
> -
> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself =
(%"PRIpaddr"-%"PRIpaddr")\n",
> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> -		       node_memblk_range[i].start, node_memblk_range[i].end);
> -		if (mismatch) {
> +	status =3D conflicting_memblks(node, start, end, nd_start, nd_end, &i);
> +	if (status =3D=3D ERR_OVERLAP) {

Please use switch(status) when checking enumerated values.

> +		if (memblk_nodeid[i] =3D=3D node) {
> +			bool mismatch =3D !(ma->flags &
> +					ACPI_SRAT_MEM_HOT_PLUGGABLE) !=3D
> +			                !test_bit(i, memblk_hotplug);

Style: The middle line wants indenting by two more characters.

> +
> +			printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself=
 (%"PRIpaddr"-%"PRIpaddr")\n",
> +			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
> +			       end, node_memblk_range[i].start,
> +			       node_memblk_range[i].end);
> +			if (mismatch) {
> +				bad_srat();
> +				return;
> +			}
> +		} else {
> +			printk(KERN_ERR
> +			       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (=
%"PRIpaddr"-%"PRIpaddr")\n",
> +			       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +			       node_memblk_range[i].start,
> +			       node_memblk_range[i].end);
>  			bad_srat();
>  			return;
>  		}
> -	} else {
> +	} else if (status =3D=3D ERR_INTERLEAVE) {
>  		printk(KERN_ERR
> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%=
"PRIpaddr"-%"PRIpaddr")\n",
> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +		       "SRAT=EF=BC=9A Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves w=
ith node %u memblk (%"PRIpaddr"-%"PRIpaddr")\n",
> +		       node, nd_start, nd_end, memblk_nodeid[i],

Please log pxm (not node) here just like is done in the overlap case.
The remote node ID will then require converting to PXM, of course.

Jan


