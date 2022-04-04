Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799D54F1530
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 14:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298324.508165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbM50-0000ZB-OA; Mon, 04 Apr 2022 12:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298324.508165; Mon, 04 Apr 2022 12:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbM50-0000W9-L8; Mon, 04 Apr 2022 12:45:10 +0000
Received: by outflank-mailman (input) for mailman id 298324;
 Mon, 04 Apr 2022 12:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbM4z-0000Vv-MD
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 12:45:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0effcccc-b415-11ec-a405-831a346695d4;
 Mon, 04 Apr 2022 14:45:08 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-6eENlGm7Pd6CY7zryhzWDQ-1; Mon, 04 Apr 2022 14:45:06 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8910.eurprd04.prod.outlook.com (2603:10a6:102:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 12:45:05 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 12:45:05 +0000
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
X-Inumbo-ID: 0effcccc-b415-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649076308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5IOVzd+AUZ3xE5KkLU2uRKIhBi+56SI5faygOZqUSw=;
	b=OfbUQRDuFi2Tv3WXVyK92EsR/wDgEb+8dUdsDV9cncWXB/oJB9uhj1yMJsW8X2Tsr4zFOg
	rdsINgWUo7mw1pljWowAvDwtuTv95UAJFDh06M9Yx/8BZAlv6YuR0ziMdEzA5GQ2uskyqt
	r+O8cL7lxcS4OMnyot4iNwMxNE9ljrc=
X-MC-Unique: 6eENlGm7Pd6CY7zryhzWDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGuqr/WNEaV0PqHQ52N31gAY1zQwmxanRXphhtCchVxb+KBZAjIuKtkP1bvuqV2ICwQejJHsve9uf4rf8kZiVntpaiuU53aGNDxmNJW53+Y0wDFEIHeYX4XrlgPA8KfAOHLPxndjQ6aaBXKNJg0hA/F4SjRKp0bdmv0PzzgRhSroRi/EKUpp0i4Rji8c8A1OiqESOvItY+RNAix30qYwGGjlHB+R0OHrmNmCK8C8F3eOzGHLSvoqbx5K7kxH3RcAQTbxz8U6sXt5S9ekVa6FJ4mUNYpMcgM39o0yrNStp45gokXUSCHW/sIqntBhoC7FEdf4uDGFz8StehZltxpTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5IOVzd+AUZ3xE5KkLU2uRKIhBi+56SI5faygOZqUSw=;
 b=MC9yFRl2lHRnXYwbQlkytkGb0KbuFgm5OBuy/XqMISDsRlplxhWuZnLDhnmbaFbTmcXFsF8NtL0NdS3Eafv5ibPb3pKU5KC9kFcvEHPgUlx0jsgnD8WY+oNTDIvzo6Ruqm8rsfTmjO/vOfd3lIktKoNw5I2k0STzm7EL5Xyop5uqY7gO1R5mCVxPYDlZNByNVKWefyBTJjiro33RIhsq/MAq4HDy0U64+BPj9oC7GHBJjErv3rvDIlJkqEN9tPUy3xaN7zztCR6jxrunLXuQMTExBRk4FdfkDvnPX1uHR+wlTg6Dh4B+UlI69mtxJ8TZWnWdjbMASEo7ptOv4Ou44Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aba2f53d-0790-d337-ce9f-76546201bcdf@suse.com>
Date: Mon, 4 Apr 2022 14:45:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] tools/firmware: do not add a .note.gnu.property
 section
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220404104044.37652-1-roger.pau@citrix.com>
 <20220404104044.37652-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220404104044.37652-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0005.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 719af704-9fa2-4bea-e678-08da1638f155
X-MS-TrafficTypeDiagnostic: PAXPR04MB8910:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8910C9A88BD8CCA342ADF81DB3E59@PAXPR04MB8910.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9UHBmJlnPmdT6Zd4Yi+CotS+ciyAaoJqizDWhF4VV2JtHxSVo682LJJpTTr+IoiBeYxeVL2LUH5djuu2fiiENXux6RXMLlCNClPWeFCn4BvUW0VbLKhJZPQorfBC8DKhdFpuxJTPmsDS/HB8PM7e4y/+5/8A39vPYVpjlxJmFEKtqzyE5aiuROQeFj1Rk3bVY9tV/TakgtzJp0KSG19ZJJEJgHAzCn9cys1HIJey0OBILjBZRZTinb7VSJosmlug/WH4OYM0YAYIgYnPrH9LjDy5PDoGUhJtnUZkO0rUIFSKnMPZfXPl2Huyy/uRX4SBbQKfUD0juslroLVEpStqV+WcUpPgJQ+d1H4yanKcFhrYuTKJoAvVqRpT1ngvyriCsSmf2so4VGyEBlizPs5bTYt7dYyC3uh7dSDLib1i/O2ZqonlxDHmYzGVyz/JysDaFePKiugH9dybh1BjeK+HcZD/vxHjBVxQv1LfEo6zEME95t8sXOT7HU9L2PxFihgmr/P3f8b3sK5Gm80AwqRITnN9lvQe9a+iflkwpgTL6j+PxCI0Zybscn+WARyZDWI7Wne04e0Lgtor2toqHGrB6dtr/h3ryqleVqi4X3Gyach59eR6yM4WAvbzycMjsayh0hgcSvE88Zenh+xoH3Pz0MmW68ZB4YlWW3deCIB6zXEcGLCPNyELqiHx8WdY9GGkRbZBZxsshfgJ9/G94IGJxIuiGgcI7nAWwSwWGqSosp241YKXoPa3RKWqLEOttYLjnxvGSv4zZF+nSmbglJ1f+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(4326008)(8676002)(54906003)(83380400001)(66556008)(66476007)(86362001)(316002)(66946007)(6916009)(31686004)(508600001)(6486002)(31696002)(6512007)(5660300002)(8936002)(2616005)(53546011)(38100700002)(4744005)(6506007)(186003)(26005)(2906002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdqN2oxQnNhOXdCWTlUeU9EUUxFYUV3SXlDR2Zibk5kMUNNT1RwZjFTYWw0?=
 =?utf-8?B?bFEzQnhkTXNYK0l6UXVmU2ZLWHBFc2RVM3VWTENzQzRhTGpuQi9kRWlmRUk5?=
 =?utf-8?B?TGdLSkQvdVA1QWdEcW1ORHNlbGVsbUxLend6RFdNWjJCRmh0aEg5akk0Z2Nk?=
 =?utf-8?B?YnRoRGNKR0V1RkRSdlBKR2M1djYvdVp3VGdxa0poYkV4L3psek93blhaZmQ2?=
 =?utf-8?B?QlNobTlYUURkc2RjTXhhZVFDOE1SZjkyTzZIWWNPTGo1Zld6eE03N2g3QVpI?=
 =?utf-8?B?bDB4dDM0T3NONHBmcURZT0U1RG9DOWhNSUlMcmtzaDZwdERUVUlXdnN0WG9Q?=
 =?utf-8?B?WUwwYnRHcWFVNENsSDg4d2dtZ3hrTDlEZ0xZMzNxWjdiQ0VZbENLQmFPMU1m?=
 =?utf-8?B?MTBXNHNsNEc4dUllbGZjV1hoM0FuWjJTTHdnUnVlZ3MvU0pHVk5MNDVEY2JB?=
 =?utf-8?B?ZlZybGpRTlUxcHRIeUZKVzNIOVhLZWhBSmJJd0xYTG5DSzV3Umo1YnZpejhN?=
 =?utf-8?B?UmQzZFZQUDN3M1BabVNDWkRrejFXZFNhclRzeWoxS2xPUGtnUThGZmFRSjlF?=
 =?utf-8?B?eXROSzJWRVlQbUsxTHFDb0pLS1FoRjZIZFZQV2o1Um9BcEpaUE84MWFKYVBZ?=
 =?utf-8?B?d1ZwRjdaODFBM3VnSUF5MVFSV2xiU2d0K1Q1WjFYcU56b2lvWTJCSnhFZUps?=
 =?utf-8?B?WG11WWNldzNzL2FrbGxiOTl2S2xQa0JMTkFvRGRGdWJ6UWo3Wkd3QmRLK3hW?=
 =?utf-8?B?YWJPeEt0c2t2TUtnNWcwc0FIbjh5K0V2bEV1ek55ekM4QXJrNzRkam1JSG42?=
 =?utf-8?B?aEdIMlpJWnB5d2NxSFg0V1NhaURCQjZ2SGpBUTJqMlV0SUc5N000bXg4Vk1B?=
 =?utf-8?B?T3FENUN3UTBjRHJ6SWdSLzRvdXB1MlBwaC8wZkh4a2ptVXErR0c1TXNOY3J0?=
 =?utf-8?B?dUF5Mko4Q25sRzY1cVloOE1yRDlNUEk5cnpOK0c0bWQ0Nk5XK1dCcXBmSmY4?=
 =?utf-8?B?bUdtbEEzNEl0YkRUNk5kK24vdjdwRENmME1hWmQ1WE40anhINGtqQjNPTW5U?=
 =?utf-8?B?OVBmdkhuT1UrMmU5STdQUTJIRnZjaDNFdUhwbWlKYmV2OTBzNFlKS05PdFlo?=
 =?utf-8?B?WGs4YSt3NjdPNWNUZ3pJcWYyYjNJS1dZUjF2ZXBMYUZZM2JnNU1qUjNVSlZn?=
 =?utf-8?B?NnpNcm9xREp0dWxNc1dPRjRyOGt2aHFEalE5OUIvcjJGV3hwRWhVOWNQVUts?=
 =?utf-8?B?UEhaeHlpYlQ0YWRlaDJGMzhUemxYVlRsSmtCY1l2SVowVDVieHVOZG1MaGdy?=
 =?utf-8?B?bWNwMXpncWlsS005SjZYOUswY0IxcmRaSjJhZkYrVGVWdG01YXBNb0hMMU02?=
 =?utf-8?B?WURrUmczcEd6MzFDRDZQWVQ0NFc1VTRyMW1ySTBBR2R2dUc4Q2Z0ancrTE1r?=
 =?utf-8?B?ME9YWklnRm8wV0ZoZVpyKytuVGpXWTBSYmtZeHIzNXpjZzB2SVNqRGJMNTdY?=
 =?utf-8?B?SmdiYlFqMkZ3Zm9heUVURVNWZjJDY0dDQVlJZGkrODE5R0lPaU5FL2ZZb0pP?=
 =?utf-8?B?ajRnanY1bFZ3UTc3YlAyejl3ZHRzTTFZZ1k3cElKNmhZTkE3cVo2Y21RMi9F?=
 =?utf-8?B?OXdKN0NUaUZyd2FOTlV6QW1UOStRcEI2ejVJaWc5dFF0TGZWUld0Q1F3UXND?=
 =?utf-8?B?eVB5a0pnY2JEQmhYWmFwTEttTk02ZUZocGIyNkJ4MXVQaVZBbWQxSUE0QW9U?=
 =?utf-8?B?UU05N3pkRkFOWjJrRlpLY3JBZTZKOHpXbFZWbEpRQkhsM1RMdjJONmFUai96?=
 =?utf-8?B?ODNIRHEwdVBudDNKcnFVV2h6Znh1VTR6NzFHdkJQTzQwb0g1SlFwN3g1YWJ3?=
 =?utf-8?B?WU5VOHRuZWN4cHJqQkJxSG04NkZUSDhKazRKYUo1RVBUcTM2UmJXaHJwY1Jj?=
 =?utf-8?B?UXluL0lyYTJyT0hEYnpOMitUb1pNbGZOem00bDJYa0ZZUVNNVkxvNGtUMlFK?=
 =?utf-8?B?VHNFVUorS3A3aDlBREFsbGRTRnVlcnVFYjZqZjBLVGdEcDQ2VHpTRkk5RDF5?=
 =?utf-8?B?Mkd0WmNIQ3FkdTZYR09lcGhzbFpZd1FMRnJ4ZE1oN0NKeWRHcVVTd3hwdG4x?=
 =?utf-8?B?R3lrQk1LY3EvbGkrd2JjWFpsVnRZbWQyU3BkcUlGbyt6ck1jdVlQMEhoR2Zr?=
 =?utf-8?B?MmFpZGxodC85cXFxdDNIV3lIbDQvaGhYbE1PNmdkRUh4dlNXOEJpdUljemYr?=
 =?utf-8?B?Y1A1bHVpc2dwTGpRYlRWZGdwUnJCQU13cG9TUWVNQndHVXhGSW9EWlpvbUVm?=
 =?utf-8?B?eEJuOE9nQ0VyMmJyaWZXQ3hDUlVhSE8zOVBkamJtY2YrRTBuM0lsZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719af704-9fa2-4bea-e678-08da1638f155
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 12:45:05.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb2XVWgwst4zKYsYx72cOUw+W9Wutpt32IYiAJmfrRiaWYegeYD9EsatCb9sSpvdXBfKeU0DoznC77m1L1/RtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8910

On 04.04.2022 12:40, Roger Pau Monne wrote:
> Prevent the assembler from creating a .note.gnu.property section on
> the output objects, as it's not useful for firmware related binaries,
> and breaks the resulting rombios image.
> 
> This requires modifying the cc-option Makefile macro so it can test
> assembler options (by replacing the usage of the -S flag with -c) and
> also stripping the -Wa, prefix if present when checking for the test
> output.

I notice you've ack-ed and committed this patch, which I'm happy to
see. However, I don't understand why you gave your ack here, when you
did refused to ack (and to explain yourself!) for "x86emul: fix test
harness build for gas 2.36". Why is this note section useful there
but not similarly useful here (or, the other way around, useless)?

(This, as an aside, also makes pretty clear that - unlike the title
of the series suggests - this has nothing to do with gcc 11.)

Jan


