Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB514291B0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206147.361655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwDJ-0007Pu-T3; Mon, 11 Oct 2021 14:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206147.361655; Mon, 11 Oct 2021 14:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwDJ-0007Mm-P8; Mon, 11 Oct 2021 14:23:37 +0000
Received: by outflank-mailman (input) for mailman id 206147;
 Mon, 11 Oct 2021 14:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZwDI-0007Ma-Hu
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:23:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d14ce0ae-2a9e-11ec-80e0-12813bfff9fa;
 Mon, 11 Oct 2021 14:23:35 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-E7ynR6-LPtaI1emo_W0W9g-1; Mon, 11 Oct 2021 16:23:33 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 14:23:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:23:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0164.eurprd04.prod.outlook.com (2603:10a6:20b:331::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 14:23:30 +0000
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
X-Inumbo-ID: d14ce0ae-2a9e-11ec-80e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633962214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSNbTDKMv47lVA9krP5gkH1LOV83sXdTcVj+/XfwVao=;
	b=CHIE+UkzZ/6hRYi+iHNfUqgrXRmDWn40jhLOijqDg3GZtT8k57bHjrbmFzfvI1xi5AyYrp
	5WIlx+U0Rlszs9JYTmMX3Cng/GuNUYsNwYhr7Q2UyCwnZuaixzVpJE8tZJ/Xacw14gGMlW
	OFeCtnDZ5v7M6AIdQHr06bTJ+GdGqsM=
X-MC-Unique: E7ynR6-LPtaI1emo_W0W9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l36Zn+VebHkmS1gg4QQVSJpWnuIrlmA0xEMm9hS8KkTKX4mOm2qPfcroLPdS32/PFaJ2kc0+8XR4d2xTN5YfZ6FcvXuqBSNPe/ON/qP5PX539SNRkibkM1ezzgFBAw7JpYYfSbIoLva1oYH5PZdIblBL5s4fcdgPxdhWI8ByLBBP26yb/OA52QZD5q3yUgEwjLtv1MSpiToB37FeewDEcoKETc5G16uR2dXTNu9SUUONTtlG07J5mVWNzmiHvnNyA2nRjOQi+8XHRP4ZFuW3i9HPPU+p/3mZ+7GRkw6HxG6QytRb9vO18yt9bc7jhkUeAybxlF9XglmvwmnjyNUUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSNbTDKMv47lVA9krP5gkH1LOV83sXdTcVj+/XfwVao=;
 b=ZZR7Ng8YDw0zHlhVW5lkna/kCd9Ka0X66TfLzQXqsTbpt0cs/Zox9BqMXzED96GQqt7akJG+8UtZG1meI1RAvWNx7u23TC6Qy15a8HODffrAvct6vvpSeE6zys0MoHG5h62szhtqrXdM08Rjfp4wv9OuIb2HGF78oEInGA5zToQ+1lUvdtD2ZKqYDZvRXQKydkjYtnJX8bncYl1qQDE7ZGXAl0u+Pp9uHf58bad+LBUoFdhC7qW6NP9E3dRS7RE38Li/Xjmv3NIRKN2InCjlBUxT/B4PsmZw8aA2q+PyqQED8WAhhOADS19LBL5WD6mjKYxIMKmnuAwBl0ddy45riQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 28/51] build: rename __LINKER__ to LINKER_SCRIPT
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-29-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4753df37-c187-5e78-c95d-38425161a528@suse.com>
Date: Mon, 11 Oct 2021 16:23:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-29-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0164.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b9ef293-42c8-493c-4a42-08d98cc2b378
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312015E9B797B455DD501B3CB3B59@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v/fhNVCrXR1SlVIDd+hLR/slY5HMHbwYph5a0DycOL4QWNaG9eHOz8KEvlx4JYT4BDAzF4dh3Q+n+gO8RA5A+E5QIwzr97RJNfhb5uHaKa2rJgV25LVsHlS8vc6ifvMTjgv3AKIZH5JVbfqo/MuDZOPIWhLidvzZ5LF2hsVEtdBqETl0r51qAayTfL3IUb19uKQTiBs285l9mr91oCAScPEdbJq6AhaWrn91Gp6Oga7kDNIrpEW4ZOS1BCI9GIz4dQ/NNncmgcHuwntwDoZO7uVCkCZ/Ki3IzBkUurtliphAhtvdo65v3XyZnoGX92VOdrNNiAWQ6uhbGW0IR2VkwMtKtJlUEAirlPRmWa8fTSJLUhgXUxAFR2bv/N0DkbHNQLnaL4c3pE3cNHn3VN9MiH/aMdAyZ3n2gAxPbiAOcIPx4gHBUNbGyayn/KHpDXBK0jBkqm4RIrTdb8nZNPlhaCs+W2WYiHnunUx4zZu2zbrbrynJiN2WSPIIHIVvAoTBuuxszcfI/oiwox5C0p+rBFXsftZbaUv5zbs1wftRF0WdjeMGmMdHqNzgLn2boGbuyUq7tzeJjWSkD5zCOH5tkcl8Jmk+8Ruzui+p2lCg5ht+3tbsJ4ysIytVeG/XPoF/5lO95ujShGJ0N9pKasA5o6RBoGQ0SmDyRS5Ltba/dy8q6XPL86aQXaT04s46NvAuUBFKQItgwtEqf1TIx8q1nAzOF0MKe6fGLGrIEtvLiu/XsPfHEgjYnAbw3BuBM36z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(4326008)(8936002)(31696002)(2906002)(38100700002)(53546011)(31686004)(86362001)(6916009)(316002)(36756003)(54906003)(26005)(16576012)(508600001)(6486002)(956004)(66556008)(5660300002)(8676002)(2616005)(66946007)(66476007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzVSQ1VCWkZYb2ZaUjhGMTBJMDdmaHZQSyt0MitFR3BFZGFacVhwOURDS3Fl?=
 =?utf-8?B?S3ZlYSthTWQ1bXlERVZ3aDFWdVFvVFZ1NElEZXBOVUxKYndxUUlsUzZpaDg5?=
 =?utf-8?B?Ym1RcDNlTjN5ZzRTbjVhU0EvV3hZdUtTTWpvNVVxaGxNL3F1U01kRlpjNTRO?=
 =?utf-8?B?UFN2TTdxd0tGcnBHa2ovd0FNd1R3NUhGZ2NOZ2pKVjlXdEFjNHJQajZGUEtt?=
 =?utf-8?B?OG0yMml4ZVlza1lMNWJPeDloU1V3NGt3T2xMUXZmelpkK0ttMVgrdkN0Nk93?=
 =?utf-8?B?UWVyTDJNRjlOcFJ5ZFVvVmJ5VUMvcG9OMDc5R2VzS0tXN3hMMWc4dVlTWms5?=
 =?utf-8?B?QWNkNkw5d0xXa2NTUm8xQldwdldwZEN6R0ljR1hxdlBmOHJYQ2twRUtkNVJw?=
 =?utf-8?B?YVBwQVhTN0dITGFQVzNlaWhBcDhSdHcvWEJ5UEUyZ0hyT0NTVXZJd3ozRllH?=
 =?utf-8?B?UjRTY1N3NzJVUkFWd3duNGc3REd5bHJqcXRlVDRmNUczSDUyckowSlJ4MHRR?=
 =?utf-8?B?L253bGlFV3oyQWxnMm1wN21rQkhBV1pqL3J0NE5Leks1b0UxTE82UWlkbzB1?=
 =?utf-8?B?dTgzaThnc2l1NE1zbVpQTkZuNDlUUkdMR2sxeXY5cGZWaElMdndiTmNId3Zw?=
 =?utf-8?B?RkJzdTI5MG5xRk1vZy91WmhEZncxWUcxajR3TzhHRjgvcDVwWnd4andYayth?=
 =?utf-8?B?NGRHZ0NVczFrNDJWWktkV3FiVFpwSU5vWFowektJTy9wK2ZvTEVCL0lFZDZQ?=
 =?utf-8?B?MDVzQmRjUlhpNzNLeVJDZDRmTkhzVmxlcU1Mb2cvNWNlUFoyNnVNRlBaR1RL?=
 =?utf-8?B?WlhkSC9QdWJ5ZlZVMnBMR0tkakxEbXIyTE01NjBtZTdDelN0Z29HTVZDcmdM?=
 =?utf-8?B?NWVJK2dmdlpxL1A3S0s1TytLMEhMV2NLaG5qSW0yK0xSeXZGT010MmZyU1ZX?=
 =?utf-8?B?d1FMd2lBbXhJUndZa2NBODgzMEFpQWZRSzVCeVBDYkx5YU94dDBsTUdpQ3Br?=
 =?utf-8?B?TmNCNFNVMkFZNE5FVEV1YTNIWnhybjRMTjl0SUdXOE9INGdzbU40N3Z2cEh6?=
 =?utf-8?B?U1ZyRHFadzFaRUY5UVpITVduOUpkQkJoUUpQcXAyUWN4cmp2MFRUR0UvUE55?=
 =?utf-8?B?aWo2cnJCQ0k3OEZJSXIvRi9HeHFmRzk1RkJnVmx5WlIvcFpwbmZjSXVmWTFK?=
 =?utf-8?B?OEp1bXMwbUN1ZS9tNkFsRnAzV0RiaVZlYmZLZ05VYTFZeUNJT2tHbFNSemVU?=
 =?utf-8?B?aGM5WE0yUGhUVlZNY3hqZFNocjNaMGlpbVphTE1UY3pvdWF5QmtEWklYYlB6?=
 =?utf-8?B?NUhUZ0NKaGtqVjlpVytnRnM3RWtmTFN5bjBnSUxsZzZqVEFJRVFzWDZhLzBL?=
 =?utf-8?B?Y0F4Vlc2U2RGRitsMG11cXZUZWZQWnpxNlhBOXRObFVBY3pNNVUzSmVwL0N0?=
 =?utf-8?B?N05sV2NkRWJRbTJnd3FtMHNicSsxTEI2OUlDb05wdHE2QlpuZ044QnFOK2Ir?=
 =?utf-8?B?MXB1R1cyUzExRFZ5UGFNN3oreXV4bnQyMUxPemNUaHNKc3djdVJYTHVMS0hy?=
 =?utf-8?B?UTg2T0JOS2QvK1QvMGxtTGhvM1ZISWhjeVREbWhYREQrR3IvdFV0Z0lpL3c3?=
 =?utf-8?B?anA0cHg4RllSOXBtV2lXUmh5bVhQYUtIbEl0a1h3ZFRzSVRmN1lwT3k2YXd2?=
 =?utf-8?B?UzZ6ZmhIb2lGMWwyZ3I5Y2VUZU9meE1JY3pEWVQ5MXVSN3RyQkVOTnZueUky?=
 =?utf-8?Q?H7+6NyqeEca9DNxjcENIJElQ0RbkVKnuUASq+wj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9ef293-42c8-493c-4a42-08d98cc2b378
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:23:31.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BJ9H6UcB8kYCOmZ38+9F+Wye38aLHiVcFxtS03Fpk702V8LtPkgd2Q9niSceZMVvMSD2zH2soA93jYCDoCEyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 24.08.2021 12:50, Anthony PERARD wrote:
> For two reasons: this macro is used to generate a "linker script" and
> is not by the linker, and name starting with an underscore '_' are
> supposed to be reserved, so better avoid them when not needed.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


