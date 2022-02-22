Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1164BFE7D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 17:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277117.473549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXyN-0007dh-ST; Tue, 22 Feb 2022 16:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277117.473549; Tue, 22 Feb 2022 16:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXyN-0007bu-OP; Tue, 22 Feb 2022 16:25:07 +0000
Received: by outflank-mailman (input) for mailman id 277117;
 Tue, 22 Feb 2022 16:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMXyL-0007bo-SU
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 16:25:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf9a394-93fb-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 17:25:03 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-K4EhoJ7LPSucR139jvCoSg-2; Tue, 22 Feb 2022 17:25:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 16:24:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 16:24:59 +0000
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
X-Inumbo-ID: fcf9a394-93fb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645547103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x1Lcjih1S+OG9gAoBIRvmSRkRdhhFQtriojez0BN0kA=;
	b=hNsHz548bFHAGIGleX1g2pTlLrAOGbPvtCrjkK0me7213vkH12rloqnNQG1e+wWEGmkNxl
	z9C0n3NBM8vP2AVbLWeuJvT/DQ1MRNc5p8ZC6UqXKZlxbTrEedcte9nfm9Hw+8R0ptnoEL
	WhftWYUvwwc+sdWFjmhsxekTMiNzNvc=
X-MC-Unique: K4EhoJ7LPSucR139jvCoSg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt+PcRA+OSC/nLIsO/GRBFjrvV/R0tGL9Jqa5OGsjJBGjzJNJQCb95U0xye9VY2lImkeFFPs9IHcjaGtMcRwMmitAVhkggwhHwfL2nAj4ktNZavdXIaWlwo3SmqmoCdW2QtZccXmrdHoCY+ivqDyVWbi9mbeW2TgrBOfbGoV8HT1NGkE15elP7OmzSpPfxBillmKUNMQ3eKxXUrCjhfqtsSQuEJsP+hMuo7iPHQUeOerUnSuD21/AvxEz279GjeVqDnwX2HUACYwRQ3T75Lr1G7m5KVC0IX0iWRZ5MoFqWMQpdGWWsFoadEapdf3FE3qBZwggQOMoQhMN8TcZ5kTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NdjwQVYqTQok97A0/KcCSmBYeB9IWDJXx/VY5gpWZs=;
 b=N6ejXkQryEAEY5gYbfehho6PyE25HRcFd1LlhVCTNX7WjCsuTFBw3A99IXn5DCgYU678EYff6Ya7udtPe491cOoTGT7i8ytVoKJqsKRqUcJUhZLyleB+8fqsY169OmibvvHXthQ2jqVYb196dTS/kIJqpWRmcztLbFD6E3qpz14Muckqz60wPJHe0n9bkiJWh4TrfmgFKpaaDLF/BOS/otfXbrEDWEIxKnjUTFW99tL9S3QGO1t+rd5ZGKueYpb66bs2rahmEgx/TPExCimn9tnilFno5cFYRmcjEMlYMgua5KS7aLBv8R7QbYoFY6cPhcULyStVyDskQJh63T42RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8c6be89-d880-f5d4-b382-0d8e06a7de0e@suse.com>
Date: Tue, 22 Feb 2022 17:24:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 03/70] x86/pv-shim: Don't modify the hypercall table
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
 <20220222152645.8844-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220222152645.8844-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0082.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7006844f-1704-45af-152b-08d9f61fdece
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4926A1E3B4B0CA53AB373627B33B9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Igg+sT4pkL754o21TJ4o1gChRHQn7p+RWlGQ7MyRX9yu/jgMdxcDjdFBEJLEZLUOCIWdrsZHWajoCVw2+Q/S19s6GrZzoQkc3ncYGZ+W/MrEdP4MgOTq3rgD5jReHb2vEA0a+RmT83h3KAtBLxHkxzPG81QRM8jWlIKiJnN45A8RZxLSjwjqAKQUQrZBg/nKnnCZ0vvY+lF93ybepv7o3hcTuAHgPFt/Bk7z67dQ76LkJtx11EHzPr2oWWOyRqYWzOyEEp5OebXW7/FOP6UBXoqBtRwk787niXuvb4xRHAomj1N/30/tWBJ5l0tw4briP6rQB5boUQhKr6drkrJUxGg6+OCcCaCozUg8g1Jqtgd9FliKeBmnpqvZsLRQEMkkz7dW2bOxUTjK/k47Vzrpzzzhq2qSKIzsHkNLPnAm1bGC8nxLKAOh7FOAF+Vco9eJQ+nbhY1aMuXUpd5BP16O8/bAC0glEEGpJ3ZTykXZGvTYnOySEcyM/gJJpMGFucDqSamB+8d2o76SWeOIBJiOgdlvHOFvrOmt2Ve+ZKLekewr7XWIMdAXiMDaMxcBIANmGcknL5usH7Ce+lypsNdJNEr4W6Ige241Z2dysFohqduat2dRT4GU/STm3jWn7F8SzCpE2YdMzmg8l/ipBXhkqBcegmsTTlciA0C5KQtWs4HSlM70+uCAJVd6AqvWTaOFjITatzFw3WaotbLbtAvOBIjvSrrv4OOuIJWRHsMwauhjS1emD1Qv40CZKD8hJtuj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(508600001)(36756003)(5660300002)(31686004)(6486002)(26005)(186003)(6512007)(4326008)(8676002)(6916009)(54906003)(38100700002)(86362001)(6506007)(53546011)(66574015)(2906002)(66556008)(66946007)(66476007)(2616005)(316002)(31696002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G39FspoNqFJ9cvueYI/pFUPP0j6hW5t4RzI4RWG0oUwhSVWA/wuRq5Gi+A7o?=
 =?us-ascii?Q?p7UNIicVTCeCG8QHbHaXN3VK+T4KdkLjxPJX62XRfpJDaKUqkpJmMOQnHs2Y?=
 =?us-ascii?Q?/K3HhOkshwts6JOTCli/GQd/cbsOrbqJXDVpFMhcg2Kvzg2D46Kxb+gF3sQA?=
 =?us-ascii?Q?gEhkd/4KSosYkuCNHd98u62d7BbEGq6PzZptUmaJVNICQwaQmD2ebPsq4xMX?=
 =?us-ascii?Q?ub/6wniJHl0NT/z5HL28bInsCsD4h57FwOxz11d/ZIB156y7SUuTHCLvHUq3?=
 =?us-ascii?Q?+mfDTWctyVwpbPaIzOkgKPSL1s9pcDDrwnTrJ+6wtTgZWkr7lzBR6rIyTKE/?=
 =?us-ascii?Q?65wnLmkeJi/Bgj2JAXZjTp9jq8utf+8IwyE7DST2k01IVruwUVB21ktudXiH?=
 =?us-ascii?Q?qxpZUzOJwtxrtT3L78NN4pa5fPrTBLN84jIKwbhCm40YIZ1YZ9MM/mDOTwmx?=
 =?us-ascii?Q?LN7wt1qZCBQLmUkwN+8H/zqPn7KyLPEgmz9POXYMR3EVcCp7TSm4jqJtrCoY?=
 =?us-ascii?Q?IotU58goqMTW1xsqsZGDlJhbMgbZ9T4Y9uZAA3AVO2jszSpphd0ij8of0PgM?=
 =?us-ascii?Q?vJ0/vHDx8ytKZXvjJ141RkxmY2znUlRNt0rpOdG5pRNGPBYaD8ofbqhCFZQy?=
 =?us-ascii?Q?0QHkTVqQki1XYJn1H74hDqCLRG4U8foRQD9lDywHIOYUpexZYKfL9n/H0RWI?=
 =?us-ascii?Q?WGysq1a/jhEVpdUV9zQ9bNTNEKk0wfqMNf2nccWiRemMzBDK6ByUXFAg+3I1?=
 =?us-ascii?Q?tvZh5ajXYCOCcsI5TvTGEQAM/oG0soGkOnPt1gMuDEkZo+AqJTkkGqVQsB9k?=
 =?us-ascii?Q?rxdgsJrF2xSDP1+YG8RW6Uuw2I4dYLx0sqviyj0xMus2ejpjkSvtxj9A6cWL?=
 =?us-ascii?Q?Y1o7SIr8Df/tivZFKmUEEMqRp3rg+Gfed1kcBkGmzEPeXi7tFi5i23J2Sokq?=
 =?us-ascii?Q?PF67uucOgwwUKep1uXul7cisAmHEuFc3dCuAQAP42w7MqIcwuTqLnbUT6W24?=
 =?us-ascii?Q?D4MG1NDEdhhmdOLrcq+aQLOobNF26/iHIQn6EhWx0TaFvmk2DXnu1y27dXXq?=
 =?us-ascii?Q?q2ffwtHG3PwiGyFbxDfr3iUsTZiccmtEpk1mBvOL1gLlmBHp/8XZwUgNPHyq?=
 =?us-ascii?Q?1Co/y2CCwE2jhHMXllzJDXJAhUAStNbxpVMkHnYcyw9gpkQ0QJzRGRrzA8bI?=
 =?us-ascii?Q?Nl699mPYd+YO9xXXtEgGnEtTvRFEVzSGiRCORWsPn5Y4R0U0ly+YEYxaPh/Y?=
 =?us-ascii?Q?KViUZywaA7vSl6LaSo3e3u//+cVUpENFm/gM/1GmBs81IWE+mhZtV++Oa7sj?=
 =?us-ascii?Q?G8FhnuxiQfGHud52HF5nUEjJZZZpTBq2PALtFhBmN1RugxNWufpSCMa1XGIu?=
 =?us-ascii?Q?2ISR9sANhnVkc7kwmx9IH6i34j0/fS702ELc2bHpO6pWT2GkydcYiatSQrqP?=
 =?us-ascii?Q?sPhNNYKZe0p973pbhEF4h48YEQItaIpvWQBQKYxBYfK2SNNeVd1LqOMps140?=
 =?us-ascii?Q?x2TBPt2I5YUTSr4784ybxy1QmcK3132DxjgP8ep63myxIiWMhOr2BU3OjAxv?=
 =?us-ascii?Q?CEaUVl2cOw+onFeIH/pq9/DePpNl4FG0vO288R+NP00mxlzEWYwVaMVM1Hnq?=
 =?us-ascii?Q?UjPxPVwYndKFfOdp73zbz+A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7006844f-1704-45af-152b-08d9f61fdece
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 16:24:59.4133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC99x3qPZlZcqGa/lj5t/eZaI2ToGi2gbGho7uAMTje39WLym4Nc5vyK7TERnpqeARYdlNV8SZWQJaaNR57ufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926

On 22.02.2022 16:26, Andrew Cooper wrote:
> From: Juergen Gross <jgross@suse.com>
>=20
> When running as pv-shim the hypercall is modified today in order to
> replace the functions for __HYPERVISOR_event_channel_op and
> __HYPERVISOR_grant_table_op hypercalls.
>=20
> Change this to call the related functions from the normal handlers
> instead when running as shim. The performance implications are not
> really relevant, as a normal production hypervisor will not be
> configured to support shim mode, so the related calls will be dropped
> due to optimisation of the compiler.
>=20
> Note that for the CONFIG_PV_SHIM_EXCLUSIVE case there is a dummy
> wrapper do_grant_table_op() needed, as in this case grant_table.c
> isn't being built.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> [Split out of series.  Make compile in isolation]
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

As said, somewhat hesitantly
Reviewed-by: Jan Beulich <jbeulich@suse.com>

"Make compile in isolation", while describing the changes which weren't
in J=C3=BCrgen's original patch, is quite terse. But anyway.

Jan


