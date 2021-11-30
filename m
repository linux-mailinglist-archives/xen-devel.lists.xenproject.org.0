Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05517463700
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235184.408046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4OT-0002eT-WD; Tue, 30 Nov 2021 14:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235184.408046; Tue, 30 Nov 2021 14:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4OT-0002bx-Sa; Tue, 30 Nov 2021 14:46:05 +0000
Received: by outflank-mailman (input) for mailman id 235184;
 Tue, 30 Nov 2021 14:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms4OS-0002br-P1
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:46:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e00f61d-51ec-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:46:03 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-LycV6UuNMnW4QPrRqOet4g-1; Tue, 30 Nov 2021 15:46:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 14:46:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 14:46:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0040.eurprd05.prod.outlook.com (2603:10a6:20b:56::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Tue, 30 Nov 2021 14:46:00 +0000
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
X-Inumbo-ID: 3e00f61d-51ec-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638283563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1S1nSRvEMB/nwuc4kZ7Pn3DED+TbZ8XV4b//gIdEt6Y=;
	b=PRrCaCaCFyou6xmQMoSjUlGLlRqx1FbHPzhxHt6kA8V/bduEGljht7VJiHoPadXCA1yCe9
	PEo3bVbPcDLYuDGRTzwADyoJt4Gez/goxShp1/hYcaGhpJ3Bsw+V1YIJDN2pITVXTktuxJ
	Fqg6QMQJwAzIw/Vf9OTGkYGKUyQHjB0=
X-MC-Unique: LycV6UuNMnW4QPrRqOet4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rhc7CfnfSaRv+cKKyYnwe2iSfBziXT2GkdVOoioh64W2BXJeZ1GqKSw8KIz+IWsDieNk/+iXlzEF+cPChzfSRqN+J5Rp/FVhAQ5Z2QvtYbSl74XZUlbZk53q51rHptvBjojpRdNPsAW3FR0KY3nAeQNlpN+vnuPR8Yt3fkBmsR2g878jQ+NIiPsNsM4Wrb4nWzSx4Y6sgQ18Rtka9ShBWffWBHr2mVs0BsiX4sDl5WjPmweARi1pLLfv0m+a/qdaDWnCVXXsdDzjPHSEfL8OMf2M2e5VbvZ4FNo8dYBslXIZw+9eh8ikPOKN9Jsx/uaSXcPnklTB13fjz6vWwAj06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49nr4D5Hpcc/0TUTSQTh2TMpELDhNnxW7fBkW8w4MFE=;
 b=UBOTs49Uf3jBVrNZbHyAMfLFeCJUnKuAbWitjuIdGHF0LAdEOGDX7ku3+lzSjd+rrGTXHqV7F9jtrL2Dvfz768iSGhNV4X+PiO9YuXhUT1Tra2M3H7Bg7/HhNn6Xw5xjkCjPks/pVcWecy6Dp9XiTEBukh3LYkhQWy90AWZ3olm5Z8/trxCI16ZfV6CMx//6+XifmHugzy4x3KHt2ZL9whM9Jv3p5b3aYgtWkzwUFnaRU4S5G/lj3H9J+v/cJdFUT+Ij44CwURHfDDb6ADWsFWpRzsjrQS++pmpBSp/HG7plMlxZiaycdRaciYGhyM2kTDEv75PuSDMVQsuzQhgy8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfedd776-3427-0682-0b9c-5e338b4876f5@suse.com>
Date: Tue, 30 Nov 2021 15:45:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 04/18] IOMMU: add order parameter to ->{,un}map_page()
 hooks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
 <YaYr8bY+yUDATyR0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YaYr8bY+yUDATyR0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0040.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4557b9d5-d932-472a-90a5-08d9b41020a9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167619131271FAF2ACA6C57B3679@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bMbgpuPGJDI3m0H6B9non4tLvmB8GQePICn2XFY09pQnN8Ax+ayyXRxEcpe0e6RwW3x5SO9FYM02ZGhRHjzGydkAt8fvkLhb6+WpdxaBa2NbGO/hKZSjQoL1qLM+nfBvNiUN6UVs8lKzzdGL+Ro3V1PSOkSSmkrOKC7kRlBeV89sOFWNbayJJpJusPdKkse1H2vYhU5089yZJrckVQ8hPK3n6Pw9PhTyqCR6M6wlGJhYmtJCbjxn+JR0zHQkxggivtP04eRd02O7cjfYz9h+5Erl256ATF60nM84YU0hkgo9fNeGGEt84JKYaXIWWT0i2LOczlj5TBmcjd7f0NnVF6RRMZkHH8o8MgIHJl4Kh8jM1/enkk/LKfXovJ/c18kAwg6eK7fkGAKOp525XTg/2gfyaDgwcNf+wIfW72xhUmmM2ZiPwn4IZSkNiSRkgiD47WhVmCpcxbtc9J+G2fApLYd6gGKOzrQW9x/UjtkBX6qewbTXxVP3BN/BNKjttInbcXLRfD5wXggykNs1SyC/I5IIhjO0UVAiRNaJGIIgwSQ3f3UkZ8yQR6RYpd+NU3WBj3eCFPeSbFQoWCuzBljjt3GgZA1DyDT45qHgFZMfspbCLHpzPyBJ+W94VNaB9kz5ut5iPAsK4hM0AQUJrnwqDlVIQK7P5DfFt7RWbZAddcee9v/5/apPVW3sC0H6xJS1BAW84sa291Oi3hSEKwRMd9lRju1NQzT5Gn0s6tu/K48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(31696002)(38100700002)(54906003)(4744005)(83380400001)(316002)(16576012)(31686004)(6916009)(2616005)(36756003)(6486002)(53546011)(186003)(2906002)(8676002)(26005)(5660300002)(66946007)(4326008)(8936002)(508600001)(86362001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FeVMfRDaBR5e3GM3ljuc/lvV6AelI3RHzP2HhctT1zCyQn5vLenYVCqZ1A+W?=
 =?us-ascii?Q?8Z0ezfQXYjwVq8cM8uJk/P8HLhMi/qFfxAlZ9gXMqZWS9xw/qvkdE/TKL5Ji?=
 =?us-ascii?Q?2wPWih9SeM0SP5GVQsZBJqe6xhOY63oSwInrNB0sdB2irAHLSX08qApKaVXm?=
 =?us-ascii?Q?w8dB7tc//a8/+wBy5K4K3TBEq0hyrDNCveytS2sCs2x8sSrDEOn42jxITQnb?=
 =?us-ascii?Q?6ARhoodDmJWmNV3MDQ6xpbM2Rb14fQFvkF+JnzYHdD6A6dQ090Y8k28SA4d6?=
 =?us-ascii?Q?zv9QsXJZc9/ILfj0+Od/TQJF0TuCYE/S9AoSiAXoijxPLjIGdneZnELrIzBC?=
 =?us-ascii?Q?f+CBNW1QzNubziRZ55Mkd6BN+TU/teKH0JDuVzGKLhujpNZ6XRH+/+YgLVLT?=
 =?us-ascii?Q?9UCNzRZJkD83Itu4V8zLQ0sgxB4sw/+yGKc3K0Hk5BUl0epP67+w5VakX7GP?=
 =?us-ascii?Q?8KTeFSogdJobdHvMiDTnAd0Xoo82dawEI1d8NqlCnHnnU4n9ZrhdbCI6if4c?=
 =?us-ascii?Q?EUON8U7IL8YelAFfmjGVTALbjFoHLq4UQrbgrPQJBw0v4Ovd2VVXQpq47jpy?=
 =?us-ascii?Q?sEsor6nEzbrDXgZerdmAyZVFXrp8u2Rb6VHRgjaSZDrf9A5nU76P2ltIFIDp?=
 =?us-ascii?Q?+o7qtuXwLDXpLn/CTgJkNo6HnsvXNsDWxdR/SrIbR4aV+Av3Ae+U7cfOUOhy?=
 =?us-ascii?Q?iMm/XllqhYtyB06nj/si2i/FXs/VZTZ6Ov4nXFxFti7jz5wr59hfQMelvs5V?=
 =?us-ascii?Q?DMd2YsVudf94DyQ3ctyeNktpKUEBaS+kGzCeKhoVD2qiLHv/LbzT3jwOCCw4?=
 =?us-ascii?Q?f+D2KkE52qOVMWQ3+P3mHA3C8U9Mw0rNgsJtgZvukQRiFuyLTStLbdzNApOQ?=
 =?us-ascii?Q?Z2kYseRevOXwX8/lTnbufYiaON9TjZcAj1fD3yYU+HT5XriuIBgOw2NnmC12?=
 =?us-ascii?Q?e0YV3bcnkDnRkcYqsVyC5Tmw49xK0cP13MycVQc28dLgCsLcXEKrK1Xq5kpC?=
 =?us-ascii?Q?A52WsE7YXfR8bPZyAOg1S8XX462XWjP/nLQHWTbnzA5LuiXmRJ3Gca28VXPh?=
 =?us-ascii?Q?Yt8r0U/f2T6UvSpR+g6JtuPQiGh8EN9RVKltuO7cjJOFpife6n2MODsWT3K7?=
 =?us-ascii?Q?faHz78TM2HFXHQSD6UWMlBcutgh4BACEYnbnrCkETeTXdKz+6/36dHFf/ALN?=
 =?us-ascii?Q?eu5LxrMZCOPuXgzOHOi89y8VdnKz5Pe7ecjYqGznjHphJcJzG+L5Hle5PzRE?=
 =?us-ascii?Q?l20sZQBbyepiKt78RBb1wgLnH0ppReucUPYOemflwE1Sdu+rcobBHs3zgMRY?=
 =?us-ascii?Q?bh+8mWub5xTxQxbmvo+ewEpEXa1nfxaH10PB9L5sA9eBEBL09GdB0zAEUYVp?=
 =?us-ascii?Q?BBDSl7q6V3H5cVwpvZ8vsPj9BrPhg53MRoPRKETUmwjGqsLg/kQypzP/Ne14?=
 =?us-ascii?Q?cFntOyJnK3oT1v3KjAh/NQ+8BhhpsVKko5+4uWroHo2gDwcXT+/wsmDBitb7?=
 =?us-ascii?Q?5dj/iZ3AGo/VZkbQbiCgMTq/9j9+rSaS1d6N4hahzbSaFK4unOnO1BT9/K/0?=
 =?us-ascii?Q?WjsKLahJLW6zEtGWLSF7/eX52783yDi1hHrMzy39HEwWzZ+uhp25ricjC2LA?=
 =?us-ascii?Q?W9aRNzOCciO0QV0lpED4Up8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4557b9d5-d932-472a-90a5-08d9b41020a9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 14:46:01.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkKt8OKgw+Uhbdpu9ccfl2/XlRXhOLVeIMXEQRLq8+WZeTI4lDepQbY8kU8+oGNNfmJnTRn7n4C2EKqcNrN11A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 30.11.2021 14:49, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 24, 2021 at 11:44:50AM +0200, Jan Beulich wrote:
>> Or really, in the case of ->map_page(), accommodate it in the existing
>> "flags" parameter. All call sites will pass 0 for now.
>=20
> It feels slightly weird from an interface PoV that the map handler
> takes the order from the flags parameter, while the unmap one has a
> function parameter for it.

Well, I wouldn't want to call the unmap parameter "flags" just for
consistency. If there ever is a flag to be passed, I guess that's
going to be the natural course of action.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


