Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750154DC78D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291570.494938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUq9Z-0003PI-PZ; Thu, 17 Mar 2022 13:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291570.494938; Thu, 17 Mar 2022 13:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUq9Z-0003Mj-MP; Thu, 17 Mar 2022 13:26:57 +0000
Received: by outflank-mailman (input) for mailman id 291570;
 Thu, 17 Mar 2022 13:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nUq9Y-0003MY-Py
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:26:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea2c8beb-a5f5-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 14:26:55 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-x2Ix7zC8MpWLmNhU1ZN0LQ-1; Thu, 17 Mar 2022 14:26:54 +0100
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 13:26:52 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::2d79:4387:3887:ef9d%9]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:26:52 +0000
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
X-Inumbo-ID: ea2c8beb-a5f5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647523615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qb7B1TJsD7lJlI06Rum0lxy5jSwcCjmBKT+UxCk0Uww=;
	b=csJNbuGrOMGFWpP6phFmNq5AvMps0weXTXrFE4K51foDcbNJGbS30fh2zIjCBllVsIBCrX
	xZ+Pb0QhKhc4RP3dRerxJvnf9+GNDLMG0q89umPCoEIkxfn/92bUjHdPBQV9QSP3celkuY
	eiP4UAgmnPjqF64UrNKWf9BL523VBLs=
X-MC-Unique: x2Ix7zC8MpWLmNhU1ZN0LQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA/th0n1gJpjmATH4rtx4J47ELw/AA6demUaWotwDGNg8VvwDgLekKfsurVMFB2pArXGoA0JuqPjHbSsJthxYn9q7nyLnmBxAggTQM2MSed+7j5EXsd6vR6j+kmYA7+Mau0KaNn0h3Fql6j0U53/gdO0at1JMtiT/Wexhk5nX2JKGZUKad5hZ9t3SDRPEhdLj3VkgtHa59/ZdB82kY7BMkZuSLjIaHg0Eoq1jwd4mbqa1S2sbOp5egxSAuY2MXtiAilcOg7Kg91EW8a34sHNpUeXcINafLAUc8RrfXDWC4luILY9TVNzSpqV8MLyUoOBBj8pWoCevnZA0OykseF+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VHIqP1OG/hn4RTwEROFHx0/Ay2wrsKO4nilEryTyvk=;
 b=NJl0DvgV5dg1wqo8gmv5dek6DNUSXYLGbvonSKCErc2UVoQKex4x4YtbBg+8SDAdI+d6SmBx2jdHY2W112fpb9DSGNW8D3hwBF3BlO+iBsp2C/5TiObVHKNPQ/5QVRNKasYxaYUbR96Ez5qCgea+m3niTvnteCEZ997tsvPZWcvCln7i59fpUNGqykCLq4ARGrTJYt9fk6DXavEhtJd5gUvLc/qxEw3hsU6HsoAGR92QlpR41D06acRPo3SvTxIdocozjAFwD5+Dt8433fw6UiRUxS143a2EM5Zcsc5/M4dz7baIBFv2LkYaUCmmMwHQd2ncrAn2sqUwrcL7QnyW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6a90957-2b74-58c5-28b0-f926d95a8329@suse.com>
Date: Thu, 17 Mar 2022 14:26:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] livepatch: avoid relocations referencing ignored
 section symbols
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220317110854.39050-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5619734d-677d-43b5-2b34-08da0819cc5d
X-MS-TrafficTypeDiagnostic: AM7PR04MB6840:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB684045EB985999D8AE999874B3129@AM7PR04MB6840.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4LDlx+bFB2Cz3eIkvjC+OhygdRH93nAAWWs4pw05yBsE8EIolyiFzVpNgH13kKjajkqjNLjOhGnRzPPwf/j02O7nA0BNzOKJEN//B90UuLen1FccjfQ8p49msTgYj0VldRYlPv8nTA6W4BOoDu19N3dOwS4kz+TSw8FiX0gGd+153L6COodvFIM/SreBFjUMyYdOlswRA0Ersxgz4BNrVDqUnRoN3F45wsPXyA+h84T7kyuBPBc8Qp0dtL5sVHmsVORtFUW5e2zaTvEkyY64NyPPBF2JZL3dT+lurg1gq5HFWNfqtNY4Yd11u3VeegAEHalqy4dgGKKEeuFYWJP+N9ShPwTM8wDoDNUcmBdukW8gY12iZQHRyF7XHDnM22KvGqC4gtZC9WxaXxGKxrKE0qcqeLS83mx3zRLohUdF1DpN8SkcEqdyoISH+6eg7ZlAMcQ7MmZGTRmrCg/15J7WX1un8IZk53WyMUwlX9ltcg+xESXIisp4R4srqCzKCfVzsVL/V//USrZRaaxL2hryxFr4sVe02mDR2tgzGNioFQiN8MxD/w1HxqQmqn91jSaFntPucdUZjs6YYFe+ZWMH3Y7eFUuzGKDXwpRJDd6o5YZ0BVPemap9YSwzf3f8pimiyzgkb9pJdBzW4jkvqvK7/xj7KF4qC0+nZbg8tQR30Pt8jp/FAxsvtuW8MiYtQ1FJA3aHhBESH6U8cgodbB5CvjBydn9CpNJEwMyUCY955JzYXWg1SpAAUWik+wrKEDZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66556008)(66476007)(8676002)(508600001)(6506007)(53546011)(26005)(36756003)(2616005)(54906003)(316002)(186003)(6916009)(31686004)(7416002)(83380400001)(5660300002)(8936002)(2906002)(6486002)(86362001)(31696002)(4326008)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?piGjVdteGctb2gIhN6wDziTu+MGFFQQBRTHM1utCdPQRhnItj6IuqiWELQUx?=
 =?us-ascii?Q?thfmEDFdYmC3zf+0STfE9nbuyWiTUEZmBTT9dFxy37OeHKYUT7p31dTgWESu?=
 =?us-ascii?Q?zBXIJT4bHfYIvaHn6ACgI4H9XuIQ7rdxX79hixxTOCjLCu73LLu/SaBUegMH?=
 =?us-ascii?Q?7OuPbWMU5qH2U3sh0Lw4ytSQMG4TVJ6TT2OGnTTqpcQazgkHzJMRLzhWHnZ8?=
 =?us-ascii?Q?yvt7wwjTH3SOVX9u32yZpTpwWqPoJ1YwCdvhYktDAWFaOzus4nYu4pLxgPAu?=
 =?us-ascii?Q?oFhyc7TlPgexa9p8poFsLJh2ZOnWBngCeROjUNj9tycXl+ean2DGxXwC47Up?=
 =?us-ascii?Q?xRRNK6NNdYAp0X4qG5zofz/YwdR3aoHbpy5uhuHTc3MF/ibHN7xU6wsEsrhx?=
 =?us-ascii?Q?QwLPVVN/y4mZoHgO69OEh79O8o0rvX9HQMBDDA7HY9qjqPbNiZGe46cvvc0O?=
 =?us-ascii?Q?E+1Zj1pMMBY7gEewj5xYSerBRf3uya3R7KXlWq8HccqbNOPZFl3R+BN7J+0Z?=
 =?us-ascii?Q?nAqhtV+z9nWavl4ouWdZsG1IpYdoLWcfBzX3M1oBY4vqHRSEak84xYY8ugF5?=
 =?us-ascii?Q?KuO8GNcI/x76w+Xv+6cHDWlO2Pnft4/+ANe1ucHlEiMgx8pMI/1MzvXzz7el?=
 =?us-ascii?Q?wxQFCgYNZ76wrx1j8eZXiYytElX+GT4DUjyqnrPEbPzxUOIA7+8XWV7iTERv?=
 =?us-ascii?Q?eGY7yoUcCuhbIOUzTlGNf6jH/Qqr17/8JopPc3NbhE0V+D0jIbpptCEWfUa4?=
 =?us-ascii?Q?h7iZiMnpy8i+PUyMadsMCUZ3bv3EG7Tfcjq/g1T4gOkxiyeyzvpsMh33el/n?=
 =?us-ascii?Q?JweggxyZgzDQB0kon5mAdZyWiotNBfX8/oMZU8qw7AvymT8FpGwN5SdBmzwE?=
 =?us-ascii?Q?JeJmahT13AkYKJB+2GPMBHCRJPlvlMkqCsHWAGe4RkFNBGkEhEQdgkkvPUx6?=
 =?us-ascii?Q?qBqmHVzxLk++Owrq0/ikCV8Tqhci/H2315tbOR9ejcH4nB+z+ovG1visuNVr?=
 =?us-ascii?Q?5HdFVjhsEFdvIqqU4wlmmeqdB6iFBc1YEQ2iXxjYXWiooMqbMTdt5vFag0hP?=
 =?us-ascii?Q?Q2LDW001RZLpKlFEKJ9CnwqWWqZCY/zt2/ShH9ClXp/azZEeE5CUh5Fa63X1?=
 =?us-ascii?Q?VuBj0AGh4aLWTWeK2qhhQ7jB+ln2W2jaIUpkHGfTmGmU4hDtITlnTTRcbilh?=
 =?us-ascii?Q?y7wDfj2yoK44nLl+qXpvl05cwTtzXCkxNsLJRtGt5X4RIHx0d/+o2AfNSwC5?=
 =?us-ascii?Q?LY9jGW7tjD88hEef0b/dLv19PaC1SAFKULLfOiIuF4o38QE9IK3bkcZdbKi8?=
 =?us-ascii?Q?trmbBoOS7nr6VUSyK0DCo+wOGt7i9p5oKfe19xrPFEe1LtKZQ/fjdt6zJOhY?=
 =?us-ascii?Q?VcCRDzZrNFONycNFglEgH6zagkYoSj7RJ4ktx8ijYlMKV8ibVugDzcquwYWm?=
 =?us-ascii?Q?TTSip6AQ136ZoS3oZqoNygnkdvNFCKfP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5619734d-677d-43b5-2b34-08da0819cc5d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:26:52.3301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnk3Y6gK72xW2Xg2ThRi76eRT93lD6T1/zkOHe2PglqBgfY5MoFTfEPz376+gw2I1l21r++0CdDJLDQGM2mzaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840

On 17.03.2022 12:08, Roger Pau Monne wrote:
> Track whether symbols belong to ignored sections in order to avoid
> applying relocations referencing those symbols. The address of such
> symbols won't be resolved and thus the relocation will likely fail or
> write garbage to the destination.
>=20
> Return an error in that case, as leaving unresolved relocations would
> lead to malfunctioning payload code.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (which can likely be addressed while committing):

> --- a/xen/arch/arm/arm32/livepatch.c
> +++ b/xen/arch/arm/arm32/livepatch.c
> @@ -272,6 +272,13 @@ int arch_livepatch_perform(struct livepatch_elf *elf=
,
>                     elf->name, symndx);
>              return -EINVAL;
>          }
> +        else if ( elf->sym[symndx].ignored )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH
> +                    "%s: Relocation against ignored symbol %s cannot be =
resolved\n",
> +                    elf->name, elf->sym[symndx].name);

Indentation here (and in the other two instances mirroring this)
is off by one.

Jan


