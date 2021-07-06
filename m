Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31073BDA15
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151470.279935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0muN-0006aN-4j; Tue, 06 Jul 2021 15:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151470.279935; Tue, 06 Jul 2021 15:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0muN-0006Y9-0M; Tue, 06 Jul 2021 15:22:47 +0000
Received: by outflank-mailman (input) for mailman id 151470;
 Tue, 06 Jul 2021 15:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0muL-0006Y2-G1
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:22:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 027bcdfc-de6e-11eb-84a5-12813bfff9fa;
 Tue, 06 Jul 2021 15:22:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-A2mZC4tmMUmnQ6rr7isAcg-2; Tue, 06 Jul 2021 17:22:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 15:22:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 15:22:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Tue, 6 Jul 2021 15:22:39 +0000
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
X-Inumbo-ID: 027bcdfc-de6e-11eb-84a5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625584963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cy/JGQXsILLmQRO0360/zAHS9br+wbwC5WUI/DjT2WQ=;
	b=ZETQ7uMeoRj5sT8s975jFoBLl2YuyIEaxfCwoyUqCuIcfov7fKEFyhAttsfv+ac/0iOxBI
	n3gVrqZ7LlHJ3SBJG32A+M7VPFTlFEOHGPm2W548X+vyzNPDdxTO2RPLUsGg6e5cSd7PRh
	v2KptnSdtJ9EF3u8CxDO2Jlt2V0xth8=
X-MC-Unique: A2mZC4tmMUmnQ6rr7isAcg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAXIEw2GtALG3ohDZMaLXh7zToGFf6DuGmcDsX2V/fhPcXsjzAVUwYCRc9U+su4KL6OZ2Q1/tpgwnEYNxRWeQrRvO7FA3H1/eQFJOs7SR3L/1fjNrwrezmXsZZe9tmU6n+tbcxKp+qlayY++3ZEaq0cgU/iF70EtPs1n4KXs1vYymC5H+T4j4pdXIBt6tPcZoTk6JpkiOjco0e0Gsuw4h9tNF71AUi0yaIPDi4HmliFt8xpg9G8OV56YBtH9FwgEDKMT4fZhtE/PIhWkUiy6AA0qag47Ccct/b0NalvuzwAZCOp9Wx4BoBQcZa+bUmmpSh8xsrR9brRjR8KgnFWxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy/JGQXsILLmQRO0360/zAHS9br+wbwC5WUI/DjT2WQ=;
 b=k9/3MoLdeufUqTybcwbKghkgnnhEv4TfFD2V6PSEhsqBQusBGhiO3aeCT1s9vgG592ARG5vclx8A958yuepQNATg34hl1wR5gnH/UoheYe0FQxQdiIvP9UQSO4W+OT8grBEHC4PExeebn/9eIFfnRcrGGwDSFR2fw/gUCDLHGTKNsbCFxnf9ymI2QgwioKBmMqojd0Te3dPQSHjKZFD8KRTu8XPdyjGkyH9p4iin2TJqO0wLszywHu/LslKCopCfIcoy8+LvHUQgr14L1QwDWucGAEKgyy2LojAJqvPQcM3RO2LllP0fr00AkX9rZkE6bNjtgwIMQRzgnrwo/a+l0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
From: Jan Beulich <jbeulich@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <20210706161120.2b6394a9.olaf@aepfle.de>
 <20d002fa-d050-0ea9-4c2f-1b98d618d9f8@suse.com>
Message-ID: <343794c4-63de-4aa2-30b8-ae3bc5e3fae2@suse.com>
Date: Tue, 6 Jul 2021 17:22:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20d002fa-d050-0ea9-4c2f-1b98d618d9f8@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621f3aeb-3a05-4ec1-04c9-08d94091e43b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351C538F1717DB27BE48203B31B9@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XyJjnlUNG/G0cw5JONR4jX0uaOZjhiTJMnsFj1ATMp2Yr1GBiu9AOdDd2Jw++fKsY3UbsWUpabZTncALFf5+fOka5xv+EAY1c3iI0ByhqzuWJAMs+VUmu/gHwnCh2ZfzHNIJaYDykPwzzKQLzBcOrrNEYyCp+/0U5PXnVRnyHNDO8wGH1LB/biR/GDTQE67W9CYBjVHw2zgGOSk8FEpJu8zVNCU2K+UM5aYa6wNed8K039IeyYOfWtfZb9vZtL5QtOo2MLJPm7/Hvh68IYXa5Dz0BBgI2uM6eZc80L7ihoX69DX9gNaGS6kWFSyBQESDevskh3570kq5w7IIc52GKK91Zmqgb254A3rOEjHfEa6AnXCdZz3guvXtP5GGIQSrS8CP5G98sT6d9vgJZ/IgjZPgJn5gPDzBesPOreWOZF/+mF9t8Cn4BgFxTg2BWB5ILGu6lyqVt7l2tqNL3x78+HqRESu4XSN0YPl6Mur6DuQa3TSkxpRh5xw3YrxkNPEBAZZg88QOnlF1B6hqf8DNVjZRwoKLgOUGfpNiSrmfH5FXNlSJYoI/wtMjdpAkgCoW9NjmOcTGedM3OE1gyTcpk7bwLU3xYq48Ax6nCjHD4sFFqdMyYIt2jXTaANza6GoRvBgPB1fMIuatfKwnEUieoWkE3LCyVvcR9XVCnYROnLyi7S3WZ3jfZzf+3F860c/mZFW2RP/vV0fX3ribLEiRlS7FkpNUY05vzu2efMigMR0wKfAdXQI2RHwQiCh8mi+qtNvpcnOgZhs0OS5F/Ntuig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(8936002)(8676002)(186003)(6486002)(26005)(54906003)(36756003)(16576012)(53546011)(498600001)(2616005)(66556008)(66476007)(86362001)(83380400001)(2906002)(66946007)(31686004)(4744005)(6916009)(4326008)(5660300002)(38100700002)(31696002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?rkszVK6hyl6TQBER/wSBybYH1niK88970MttlW/ijJlYrUi+2UM2uWZk?=
 =?Windows-1252?Q?y55mrd2B6VGrgl1Z3lFh++puCsc9q033SdEf7zTVcTBIY4WZr07d1vO8?=
 =?Windows-1252?Q?VGUjNHy1GMXsfgjF7KCNp6ZHuII6Q5xL4L8RReKwvSW2dTXDbPtkmz1V?=
 =?Windows-1252?Q?qBI9r1jnDBPyf4e780ENXXEBVMhJDQDkfYbUzBWjTw99tU3VLohSsloL?=
 =?Windows-1252?Q?ub4Fa/GBz+6t3I+0xEqb6HwcAXW1RU9sa103sPbwTglIkWkYZEfCN28E?=
 =?Windows-1252?Q?MJInJ7Cz+Fc0u5rbdDuSaLW2BoaoedCD91UyH2wpKM6xEw25bvx5WDMG?=
 =?Windows-1252?Q?1yWtmgUxekfE5tJ5PmjQpysfqMlB/3QdJ6L4/0TNOf6hDPEv9dEilZE+?=
 =?Windows-1252?Q?pkeMHZMnsV7tinzmDSthlb3r3P83ijiLQ7PLOCHAFpjVo6/i5Nf0Ih/r?=
 =?Windows-1252?Q?QTSH47cNWxWiAsV4/MX2Csj/nCxv4m+RvgOJCYlkDA+EOVx0rePecaBV?=
 =?Windows-1252?Q?BKVoZ5H8Cujs7wzKxboGyZY5xkzIKB8yCRkAEAtJWmahpmpw1M4rX771?=
 =?Windows-1252?Q?CRtVmuQ1ET05wGHA11C3/nsxI7y+ErSvtUU3fwwrGs9Oak6hJ/Vfayub?=
 =?Windows-1252?Q?j/60kmHmL54PYWmrW/KbDPtbnxbh22xcjoKQoY+znsFCG3dAUX/J9+cn?=
 =?Windows-1252?Q?KncKGhab7Oprs1CoJTHkM9oTaeyijCmj1NkU4y49M7pwW6+RawINDGnr?=
 =?Windows-1252?Q?GGH5DcplUA1c4rst/mOM/fwblw/p7ZK48OuM1Y7hk6RTmDR9KlATLa1E?=
 =?Windows-1252?Q?IoGNaa9RqIU3Hi52io5JtjCH2hXxfqB+8EwjdIwQVs3EY4SpheSvxNyP?=
 =?Windows-1252?Q?XCDXxj2zlsHScwHOZ4bo4W/ITZU5UwOSc+w0XkzaCLGFLPxT2M8GpwXN?=
 =?Windows-1252?Q?lj+FRQ4uLWdaBUUyDSQR25+RHACNh3ZvReSNmHlPCaPHxolWSfqI3Z8D?=
 =?Windows-1252?Q?ez7q7KpBOb2VGwW4wvcmyvV7liVsB/M2CoNV2l/q/qsR943PtEH1F0Db?=
 =?Windows-1252?Q?fwxdl+4FlqjiHVKupg1adjm/CmgKU4GUlxYImd0yBszG7ZaRDTbkJ36g?=
 =?Windows-1252?Q?n04LspGOJPcMw56m/sP3RZ8wj0ASbDlfS2g5/NUOJ5OKJfDtYj8CcneG?=
 =?Windows-1252?Q?ph8T2K9PY+g0MpqeXZXEC27ESo9TmfBcjyxeXAx6DVqVoGKPAkukdyx5?=
 =?Windows-1252?Q?YTXkwC1ZUJiMoXjnY8PKiJSdzDEYe9WjMdhE4XdoEO6UB2ZnzktsgLeP?=
 =?Windows-1252?Q?iKwNZzNjbSFebiSMUQom/KMnF+hXIAAGLd5Rl3jzykxhXp4Rpq6xXi7m?=
 =?Windows-1252?Q?GeKmZCL5c2R+V2LgcrZhnkg3jHO4aw2FMB7HTICz5lDFAHjBjrC02OHX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621f3aeb-3a05-4ec1-04c9-08d94091e43b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 15:22:39.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldX+Ee9pJPYirNvWpwnwYCCiLcfq69qplz5bPFkOFL1BaGvkAjOOuaNQOqPNuSA+GRgniLVvuPJGnoYbF646Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

On 06.07.2021 17:13, Jan Beulich wrote:
> On 06.07.2021 16:11, Olaf Hering wrote:
>> Am Tue, 6 Jul 2021 14:58:04 +0200
>> schrieb Olaf Hering <olaf@aepfle.de>:
>>
>>> the reporting is broken since a while
>>
>> A quick check on a Dell T320 with E5-2430L, which does not have "Page Modification Logging", indicates that staging-4.5 appears to work, but reporting in staging-4.6 is broken.
> 
> Not surprising at all, considering PML support was added in 4.6.

Or perhaps still surprising, as the functions involved there don't
appear to be bypassing any core logic, so after some looking around
I can't say I see anything that's obviously wrong.

Oh, and I notice only now the "not" in your original reply, which
renders my earlier statement completely pointless anyway. I'm sorry.

Jan


