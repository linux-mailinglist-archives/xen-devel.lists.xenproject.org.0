Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21542657A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 09:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204473.359623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkk4-0002dB-DJ; Fri, 08 Oct 2021 07:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204473.359623; Fri, 08 Oct 2021 07:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYkk4-0002an-8w; Fri, 08 Oct 2021 07:56:32 +0000
Received: by outflank-mailman (input) for mailman id 204473;
 Fri, 08 Oct 2021 07:56:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYkk2-0002ah-LN
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 07:56:30 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e2ab582-280d-11ec-8024-12813bfff9fa;
 Fri, 08 Oct 2021 07:56:29 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-8i-8duU-NzWwPn1iZ99gjg-1; Fri, 08 Oct 2021 09:56:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 07:56:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:56:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0202CA0038.eurprd02.prod.outlook.com (2603:10a6:20b:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:56:23 +0000
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
X-Inumbo-ID: 3e2ab582-280d-11ec-8024-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633679788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vAW8SDWXbN3ekL7gqDpKyQSL3EP0k1DGBqTl/ILtoc=;
	b=kKJAtQ27rdno6zcsIA6LKxVsMH4HSPbs7sk5uewcfRx6Lnpth39+rlMHJf33ypw3A8ubyQ
	a+uxgc4X+gscfTw97CVEpmwmhDtBGb8lqzGjas4yvFBwvrqari4BGUtH4+FyFolooz61OE
	Ps8mKx6VOQ4dbOF5/VFY9v4BmKiRON0=
X-MC-Unique: 8i-8duU-NzWwPn1iZ99gjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV7uRgV5hUYAymGwX/GOmcyuCofOB0fclrHpgPE4iUfMxuBDtsw4AN+osXfRV9M8cYLdUQ0aTQEYP1/EOLYeRMoKm+h0XFXNU9rdoHmvmRLZBLoUBJkFkTSRuBjzNuYBol6OZrtRuqD5LMYCA1tenltQUAcUM68GaX8QPr7UEry3oA1qZ+uay2lZn7EODsvNJVly+n7YB/eOMPQBYAK1ld9eSOBYP4hmutmPkqGFp8ehoYUcmTV8hpgQBciSLess0y0Oj7gGGI5qY4DfMFou7npGJIofe1MRlJowwCFfFMkID3+iExBaoIus85epERQi5LETmNxNIkpkEIjgeRIEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vAW8SDWXbN3ekL7gqDpKyQSL3EP0k1DGBqTl/ILtoc=;
 b=SeBbwHLlHpWgxHnM40WeFG2gVwdA9ZwqutzdCRmqKNRSwdwISm9f0ZGnkOZ7R4HOAE0nSdH2Eo3uQeo8PNMR/ISCl4aQW4B2Y0A7lXRwmWxMBhGRpoVJy/nwSqQeLehlDlxlt07ofmfRWLQz104XKzQk1r7jgrwtMhyNQ6+WAe0pfJSItmRQWDPZhXABo6TRsJ0aNN6cfoSNlyBB5j47K15RxTbQO/n+yz0FC0VrApdM3ZJqDhQbPwuH8g3ZnhAOKWnqNy1hciJP/S2epARCUfMphB3AgiS54BLuxX0hK3XhggfrpwXRt2t/do+ofH5S/oMmdz9m5GpfhSK7qLU9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] docs: add references to Argo Linux driver sources and
 information
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Rich Persaud <persaur@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>, Eric Chanudet <chanudeter@gmail.com>,
 openxt@googlegroups.com, xen-devel@lists.xenproject.org
References: <20211008041241.227823-1-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <000f9cc2-898c-5d6e-b6fe-d5dc776710ae@suse.com>
Date: Fri, 8 Oct 2021 09:56:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211008041241.227823-1-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0038.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dbf4eb5-6b9e-4cd6-0207-08d98a312038
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2960BA4B6763E0C98FAC5B74B3B29@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7o41/KS/PezFgcPVkAxUu4JVUj87Umebpxk00zZR7tqxkNlTrjBZ3pHUeQWQvjesbVNExRCs2Km1vLZMedifKKCsKMM+yjLydGetjcVxygVW6nfMconROkHHNU5PHkzSukb0ANUUxuInGLopwcaMS992DqQag+Wq8ixj5a3kBe47hl2eJ6f5I/mb59467erFyncKqNujvI2FqOnXAoWYGr3n4LvE/RUPSwlYCZJD+UvAGNVv4TnTfbFcnxjZ++AV8IFcOuRn1OSRqPsWAz0j5vBJNhpbsRXV2P8DgQUOi0EErqp4KCw662oVBmC5Q9VPbqP5/w0PLu0+yth0GXaF16jBUVDiXceizXwXNSVus14tNd+/cT8xXg8mcMna8AtEBUGqNuWElPgnVwLBybWunb+9Jz2RnHQO15LcCa/g0UxxsboQZf905loh3X+8EmXPXsYPWM2UjA4xYnY6VNK9/fUmDB5I5pYPfmvzoXejKq55v1qB2SOnkFoZ9kErg4vtjvfmie861MPrkTvo6KVVjLd3Me87J1lfzekFKYQ4+UcRKbXu8liw3MXyHYNDlDDmPe6PmezxhgJjNZGTMCQs0WrAeRslqHcDSpZ/+ZDNRmuJahKst7MY0OJcj1RCHreL4XDE9YNkOr0dQVxEvbh8vdMwmTRgqET4Eyk3zaBtMNIetfuxOhjGd9IbI/VFuEl4585YqbFWO6cEpoCE0+Zkp4C0PaoeDdNRMO4FIA4N1oLZr9EQwhTsXAmXL8pbjtkzIATM1ODdXizDy56iL9ZbF/TgmqcuiYY8C+2J+wxZ4q0qH8rT1TiOrcNlAY0ghS/W7q26VCmqaRKG6peRM+9zje52zLnU3OU7O6i3pQ4ftyQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(2616005)(6486002)(186003)(38100700002)(956004)(83380400001)(36756003)(2906002)(4326008)(66556008)(66476007)(31686004)(26005)(66946007)(54906003)(86362001)(8936002)(508600001)(53546011)(5660300002)(8676002)(7416002)(316002)(31696002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzR6b3NHOFovTnB2S0lUTHdtMGU0TmFtd2t0eU9wUUVGdGVieHkzbFpuNHor?=
 =?utf-8?B?YlBzWGRFb2J4cGh5S3B0eW55NTJZT2JiNWdWQUFWSUZGUElwVEYrMWZPdzlX?=
 =?utf-8?B?bk1PTnNLVmdleFcrM2U3SHVTUlVzTlFXRTJDeTlQYU9KaXpreHBMK2I2V3dG?=
 =?utf-8?B?QVFTdkxraUIrM0FCRHRTMkpJWVZqQUpRTllxa1JCYTdSQ2w1emk1OXp5L3d5?=
 =?utf-8?B?N0JRYXhuaENzZElWZGI2WW5Wc293SGl3cGxzRk5jT0hsSHE3cXoxMWpmcFlO?=
 =?utf-8?B?UHV1WFpGT29aTElBQWtCSk9ZbEUrRUNVZEZBakdaTUs5TGlGK2ZVRFdBazRE?=
 =?utf-8?B?eDV5MVIyVTN5YVVZcmp2YURvb2NqUERJUG9WSHkzWUhtMGRodHhOczhaVVFu?=
 =?utf-8?B?aFRodUZraWV0b0J2elJCSlRhU0ZzdVIvOERTcUZQN2NrNU9mZDRZK0ZBMGJt?=
 =?utf-8?B?L0FOTXh3NkdBdGsrT0xKYWZvT25UcnZ1RzU2S2wvSTd0SkhxdVljZStqZEcw?=
 =?utf-8?B?S3Z6eXV0RU14cEJTQUppcDR5b2FaYnRISjRzNjc5bjBXeXppWlRSb1NtWTht?=
 =?utf-8?B?Qnd4NWVjSzRKbkRPNm9ZSnBETldvVGJlZ3czY2F6UGNYOWZZZ1B2WnU4NFpZ?=
 =?utf-8?B?YmlLa09sNCs5SG9YdUpKWC90djYvRkpHdTZ3aWgvZUVCRnFwU1dNcHE1M0ht?=
 =?utf-8?B?LzBlaDhwMVEwYjVldk1UcSt5MVg3TFFhTDVsaHFSNm5SSFE3MDYxU0JXU05u?=
 =?utf-8?B?N1M2cnl1M0cwKzBRcWd5Z2ttemxlZjk0TytueVMvU0pKL3lXY0x2R2pkc0k0?=
 =?utf-8?B?QkZ6a1FoWTUxV3dUV25YQkV5cHZEVFZ4OW5zNEFJZ3hyWnZmM2VuY0RTRWZE?=
 =?utf-8?B?b1pEU25XQXplTGp1QWFRdENoTlZFY090bUsrRmFweDBKV2RQRHFKTEE1ZW05?=
 =?utf-8?B?T1dzSEF3YnFWdHIrczR0WmE0djRpY1BnYWpaVGxjeXhpN3dFcVBESVZXSWZW?=
 =?utf-8?B?UFZ0WmFja2IvREM4ZHJ2UkFzQllyRFdQWHExcDdTaTRWM0VQa2RucUkvU21J?=
 =?utf-8?B?MzM0WHlQRXR2NTlHWWJOeFNqc0Y2OTMyVWxZLzlBUlJvTlpIQW1NbHJHcUN2?=
 =?utf-8?B?dU9ZNDYyTGNLWUdZc0ZTWXE1Q2llR0pHT1ZvNkdDekFTNDBWK2gvSmNPZVRK?=
 =?utf-8?B?RDRkaGhEZDFMbHBaeElCUys1V09BcTJtWkdwandHeHdsSlQ5UjJiV1Q2VFNM?=
 =?utf-8?B?dEgvZkU2NG00bnhkNFJ3UU10b0VrZ0tOaG5GTkJyOWgyeXhTNkNndUJ4ak5w?=
 =?utf-8?B?bnpVNTNQMnB6bDhYVEFxZ0hwbnVMc2RWTndkNitIMVFGekxEcHAvWGFQS1ZF?=
 =?utf-8?B?SXh6TjlRaUJwd0dOZ1h4SW9qYUZQTEtGYlQ5Y3dkTUlUYkE0NHlRemRtRnQ0?=
 =?utf-8?B?eFBOMkpiRWc0Nnp1cTJVaC83TEZINGpRa0FHeXQzR2tVKzIzYU9FdkJKUkVi?=
 =?utf-8?B?VW9nV2Rnc0dDaDNiVkUvMnVJZmd5LzZJTzJBTVFLRTRHcGR4ZGFvVGQrb0FJ?=
 =?utf-8?B?eThZSzZGejlZMWVzN1hQUGtJUGphejJ4cXQrMTh6TTJGUW9nYUU4Wk8rcllI?=
 =?utf-8?B?Tm5KRUZqbTdUT0lIQkxUT2duOXhqZ2FLbFYrWXowMHRCNUVWN0RSZ0crMlJJ?=
 =?utf-8?B?czdqWkRxSnFCQnZMVTVGZWtQdGZ2eFNEZXFuRFJqMlpXaGtPSFIxVWVlWCsw?=
 =?utf-8?Q?uEV9i9RxPzKG41j4O6dpbEIE7oknGCy1oKeJPub?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbf4eb5-6b9e-4cd6-0207-08d98a312038
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:56:25.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyFyiQN/FHbZ9XHkhEvZ0WhratsbVleW5yV6Ar69TpHusm4ylRxsKdSi3AUDy//I/O+lQalqGdxfQz6U1MsyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

On 08.10.2021 06:12, Christopher Clark wrote:
> Add a section to the Argo design document to supply guidance on how to
> enable Argo in Xen and where to obtain source code and documentation
> for Argo device drivers for guest OSes, primarily from OpenXT.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>

Just a nit:

> --- a/docs/designs/argo.pandoc
> +++ b/docs/designs/argo.pandoc
> @@ -439,6 +439,51 @@ that teardown of any domain will not interfere with any Argo hypercall
>  operation. It enables introducing granular locking without complex or
>  error-prone lock acquisition logic.
>  
> +# Related Material
> +
> +## Enabling Argo in Xen
> +
> +To enable Argo in a build of the Xen hypervisor, please ensure that
> +CONFIG_ARGO is enabled in the Xen hypervisor build configuration file.
> +
> +To make Argo available for use at runtime on a Xen system, please see the
> +Argo settings in the Xen command line document.
> +
> +## Linux Argo drivers
> +
> +A Linux kernel device driver for Argo and corresponding Linux userspace
> +software, libargo, that utilizes it for interdomain communication between
> +application level software is available and maintained by the OpenXT Project,
> +at:
> +
> +https://github.com/OpenXT/linux-xen-argo
> +
> +The repository contains the primary Linux kernel Argo driver, which is derived
> +from the original XenClient v4v driver. The document at the following link
> +describes planning and design notes from OpenXT community discussion for
> +improvements to the driver:
> +
> +https://openxt.atlassian.net/wiki/spaces/DC/pages/775389197/New+Linux+Driver+for+Argo
> +
> +An alternative Linux Argo driver is in also available in the same repository,

One "in" too many? Probably fine to adjust whole committing, if no other
comments arise.

Jan

> +implemented to explore a different approach for Linux to use the Argo
> +primitives under the Vsock address family to allow socket communication between
> +Xen domains.
> +
> +## v4v drivers
> +
> +A Windows driver for v4v has previously been used in XenClient and OpenXT
> +which could be ported to Argo. It may require update for compatibility with
> +recent versions of Windows software.
> +
> +https://github.com/OpenXT/xc-windows/tree/master/xenv4v
> +
> +The Linux, Windows and OSX guest tools for the Open Source HP uxen hypervisor
> +contain drivers for v4v which are relevant as code bases of interest for
> +porting or developing new guest OS drivers for Argo.
> +
> +https://github.com/uxen-virt/uxen/tree/ascara/vm-support
> +
>  # Future Work
>  
>  - Performance measurement and optimization
> 


