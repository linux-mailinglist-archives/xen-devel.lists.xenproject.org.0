Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A21469743
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238949.414161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEAu-0007ss-Bw; Mon, 06 Dec 2021 13:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238949.414161; Mon, 06 Dec 2021 13:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEAu-0007qc-86; Mon, 06 Dec 2021 13:37:00 +0000
Received: by outflank-mailman (input) for mailman id 238949;
 Mon, 06 Dec 2021 13:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muE6T-0001ky-UY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:32:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2d0088e-5698-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 14:32:25 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-IiH8PSerNzGGjue-maWf6A-1; Mon, 06 Dec 2021 14:32:24 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 13:32:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 13:32:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0100.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 13:32:22 +0000
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
X-Inumbo-ID: f2d0088e-5698-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638797544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rp6zR0202WWrjoyuiwHgeOxRqJmRNX0SFCkPJp8UDMs=;
	b=dmYFzTBvg4ds7ZOFlatT3jDKJbz4O+EzSgGauo3q+KTQK7KgYX4tdtNMEL4vsEhHeo78Do
	ce00qfnveTJNBX4g6x9hQ+Zx0ppASMULAxX4HOFlMpyzTJUfyFiOD5sFHpk+KISe1z3EZf
	CZOPj76iaILD66OzIbx1ftIcbjqhitE=
X-MC-Unique: IiH8PSerNzGGjue-maWf6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WM6/Gv1euXEQC3S54uNn4M0kDCP+s0AqBUCGE6Ko5N7MGraL90j1ue5dVESzCCe8ZoDK9wQakA0bNSWF0xrHdIiDskXWxbXIwa6EY0ndEHVCOvG+KcaSam6lUSWisgGLP77vMEUNqKQhByl3US+rh/XnDp6DOM1OCRmySkZd5Gc1FYSXltHGo5We3eoaLFCqUBAEB5SgyRTTN7dz+2OobYM0x8MePygaEZSPRyTee/adk0PrhYM9RnyMKYwxoPMRIisNrJJUOtqNogKleeAAlIRWRoDvKsXksawOzEuvb/O85lIE1CzGha65Jp8WeyKRJmXM8+MHzosFFsOdCIhc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp6zR0202WWrjoyuiwHgeOxRqJmRNX0SFCkPJp8UDMs=;
 b=cnGyLezyYcbt4BtrTRTBRbqLC305q3EP0ZTRN486klPyofKBrE9o0cvMXym8XJqG3AR3te3e+MMTIWLLqtZSsD6jhfWUDRqgnBMlBjQDzIokHJU7QpU88xauZjGod2YdZRnxmVAdHaV0Rr/IIyav6z+rrtIGiRDoPDUp+0whPK0kZKNALpPu22vA2Kn6ZVmZLaVKppNMMbJazsSdxtoIvOfwNh2QwZ+PHPylmFOh6GnTzaD7YwGpX8abe3+uW1lKNsvSghht/d/iBDYBjnoNecpz4pIdSBKDCfqACKmfJFUw9K7TVd7EYlRrUC0SnMLEp5U+/TqXC7zfagZFsGbQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c2e3dca-2fe3-704e-4bc2-c3da16d33aec@suse.com>
Date: Mon, 6 Dec 2021 14:32:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 5/7] xz: validate the value before assigning it to an enum
 variable
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
In-Reply-To: <adba1753-4d6b-0ee4-a7c0-42c5ef520b67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0100.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb53db07-1a1a-4e13-e593-08d9b8bcd585
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957A7F9DC5F9E33E9BD7A10B36D9@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jn8M1/oXROoBjORD06mcs5F1su68MGL91wNnu33WtmBcG8CYBoB08pjmgdWaOLmqrXR60J0bDS+T6Kamj6Yqp/rvL50fYRmzl7MOc2vCRIX5U2/to69WxkgZ5HeAMw/az9tkZWShX+ftJ9yvKh2nM9KdM3KwXY33A2GlvT3pDJYy/sUA5Out3zZ5Vm0WVdqdwgd3AduK8mfoUEHP3Mp2a38R63aMOliMsw4PhwkDe81ekblvLO+iXyva5h+vcWiEwoN7UZHlAWTQMJDBKkKlnS5jtcxpM0i8KnFdki9vkUpp6qlAKtCLKTpFyWZFidy11fI96pcg4b9pNdL/qEh7i6ncQzRn3b5xVWiM33kkbV5MD5KPlJLf/9GgfRqa2oRevTlWpkcUTWnvT8q8APBdGXFE2EIr9RFSYn6bm5EASOADeDeunmj2dLG4JCE5xUTcc+XUwCX99eB6IiPMaUpo96rTPmoK+fwVsHXyN1XTI+8FaB7Du4IVQ/Ps9nmhFJ9dQOPfoqw+M8c+07vasCJCOEBmfhBKueyZ4QOpn+aG+1AViJfvJCFmp5EgMzS4/P8TGbX36Wlb+X8dA3sJodPNZlAXXEUaDLY8UUgYXGdBP71pIgiMn/ZnhiOSCX2C7v85VS1wdQtnJhdwN40McQURumwAOEjoFE0nFFu+bxr/Wk+yC1xtQS5SZ+UvxUpFwvqk6i5erUaq1WqySBXKtRRW0RCtkScTf5zeUbVa+oQcKUgvsnKlMVEXC6gtAqs0RHfBOQ48qxrhygWTPz8SXPxVkeUnpoay8xYAbdla2ruPZr3sh4KpFVB9srNYsaquLmFM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8676002)(36756003)(83380400001)(31696002)(16576012)(6916009)(54906003)(5660300002)(15650500001)(956004)(966005)(2616005)(2906002)(508600001)(4326008)(31686004)(86362001)(6486002)(26005)(8936002)(186003)(66946007)(38100700002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clM2Y1RtYUZ2djZvL1pDdk40c0Z5ci9DdWpSa2FSZk4vK1JPQzIyS3hqM1J4?=
 =?utf-8?B?TnJJOVFsVjNiVmQyTFZ6NXppVSs0L1ZUeTMyYTVOVUZvSjJzeDBKY3kyaEJ0?=
 =?utf-8?B?YWxCWXRMSngvdDlkK1JRUlBMNlJZRG84MVNqcUN4Q2tCdE53SEdxLzJBY3Nz?=
 =?utf-8?B?dEFNOWY0cXBLSisrTm5BQUdrNWFkZlltMzhOOEhOeUpGVm5OMnpDbElQMjNq?=
 =?utf-8?B?Z25UNU9UcFE1cjJOQUNIWHpKNEtsa21UaGJHc1dPMU1nbndkczVwNktESCtY?=
 =?utf-8?B?UUl6M1lzR0Ricys2SERGQWpNZUxkRUFtYjNqdU1GZUh5NGtITENqL0NzeG12?=
 =?utf-8?B?ejRvYytZd0dMWkNkU2M4WHVrQjYrOGsyTkovT1VydWtYdXErRmlhQ0x3ZFVI?=
 =?utf-8?B?NzFGT2ZtWk9IdklFdVlFcmpIOWNDWWFGUytNRXNEeCt0R2R6d0w2UnRpVGo4?=
 =?utf-8?B?WHdiaktzY0lTRU5mL0lGVXhOcDhnbmlaTVNGZmxTbzZLcjN4RXpVZnBXcTY5?=
 =?utf-8?B?a203eUh4RjExRzhiT2svbWZiM0RHMWdoK2FoaVNIMlpsVXpMdW1pUUs2cm5P?=
 =?utf-8?B?WENSOUpEVzVDeDR6NEd3N1BSUGlHMHp0eVVsTE9Hay9rdFJZaEpvQTIyM0pX?=
 =?utf-8?B?Vjh2aDRSa1YzRmpoR0JNV1pwb2RZdzlJTWduSDJjeU1wSmxoZEFBOVJGV1lp?=
 =?utf-8?B?QlluNWlwWXg1YUxSY29DRnIyWmIreDc5K0JkaURyWVZkN0ppeWowdXZIL05z?=
 =?utf-8?B?WXJxQTZxUGUxem9DYnRZSUdsOWNZQUxoVHRhYThEQ3pscXNJZE5MWFVJZ2JT?=
 =?utf-8?B?dkhYZTl6WWFDOG0zQ21SNG1CNHJzRXRZbU5FZGRQR0VtWVYzcTBkdEhPLzkx?=
 =?utf-8?B?S2VoV29YaWpUMGdDRXVrbUgwaVZPWmRqRElEaGpRZ21hR083Mll3TWVERTFI?=
 =?utf-8?B?TXVFS3F0U1dTS29TYVUrTzFJZlluMkNLQjFrOUVSOFlkZ1lIS3NtRHZ6alln?=
 =?utf-8?B?a082VUVUZUZrSDVrKzFNS0IvMDYrVXhuSzl6VzYzN2xvT2ZrZ2g4dzRKcTZp?=
 =?utf-8?B?TWZNUlZza3lVTEhhUnZ0MDNucVpTWEFoQTFwNllpOEF3TEJyVHVocVk5MzFB?=
 =?utf-8?B?Qy9yUGl6WllEYS9NTnRkYlE4Sm1YVFMyZDhkTUJNT3ZMamRhKyszUHdjNkd5?=
 =?utf-8?B?QmJPL25XNWlHOEVxc2xPY3g1QjlybkZoZGZLZE9mUFFNT3JkL050VEtaZGVn?=
 =?utf-8?B?SmtYV04zVytTa2lTVEs0Q2hjZ0xpYzhkSmFycXhZZjhGVUdaRGFnT09SRHc4?=
 =?utf-8?B?U1pjUjFwVk9NM0JYTjZhQXI4aGxaanRmNHRJaEF4b0p6Zm5halF0TUZFQ3E4?=
 =?utf-8?B?NEs3eTlZZ01ZeEpSOGNIcnZJRWJBcElBejFibURtSVR2UmdoRTZ6QkJ5cTdN?=
 =?utf-8?B?QjNmZFV6Mi9XajNrQWI5cVVhckpRWWVsVU5BM0htSFFoeHFub2wzME5kNnRE?=
 =?utf-8?B?WStnOTVUOTcvM2R4Mm1Tc055bXZMYWdSbHJVTGhoVUdud0d4Ukd3d0xHbC93?=
 =?utf-8?B?Ym82ME9rRkt5cEViN1JDaWVwOUE5Z3RMMzQ5eTBobXpEVkRVVGpGdTJ5bThq?=
 =?utf-8?B?RTRWRVQvVjZHWXhDSzZwTklmQVpqOCtxUGFkOHN2T0xGalRNWDl4TXRJUm1J?=
 =?utf-8?B?TWYySnVPZXQyTUNmcHhxbThZMWFPVTk0bS9sN3kxZmtYNDhTaGJwam1lTG9w?=
 =?utf-8?B?SzBCZ2lKYWliUVpidFh3K1Q0TVpFQkgrZEVyaHh2RUpXNEtUMXgwa1RuM3lN?=
 =?utf-8?B?WnNsaURyYnRna2I2Y0lFVXFiTmlYbjUrWExCc2pucGNGS29PUytSUm5EN21M?=
 =?utf-8?B?Ry80dUVzQVRsYXkwRnBTSWErUnBLREJqbTFZVzF3cGVQMmNjTGFIY2pmNU90?=
 =?utf-8?B?N0tZYUlRMXN4TEhBK21jU25zbUVJTGhLQ0p5MXR3WThQc20zNFFKZ0tINXlY?=
 =?utf-8?B?NnBLQmVzQmFaSktxMjdvYytTNlFPWW1hRWpZbXBvWXVRYnE1RzQwNzZBai8y?=
 =?utf-8?B?TzV2a1FXRkxFVVh5L0tWL0VmMzB4KzlqczVKbDU0VmZGWE9YQ2RhUGI3Z3Z0?=
 =?utf-8?B?bVJFNnNGVnAzVW5mMlJiWTJERC9lOHEvVHB1RlVhaEdJY0hlN2dmdkdaeXJR?=
 =?utf-8?Q?fDdit8cov0RyYKZgg+JPt0Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb53db07-1a1a-4e13-e593-08d9b8bcd585
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 13:32:22.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHdtlcUZi4SUblvqOdliMZdFEI4DvBVzzPUb8Vbj9EPsImgOUBIhfoAdWntGcQO9Int+eqdDdCpecz/6xC/51Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

From: Lasse Collin <lasse.collin@tukaani.org>

This might matter, for example, if the underlying type of enum xz_check
was a signed char. In such a case the validation wouldn't have caught an
unsupported header. I don't know if this problem can occur in the kernel
on any arch but it's still good to fix it because some people might copy
the XZ code to their own projects from Linux instead of the upstream
XZ Embedded repository.

This change may increase the code size by a few bytes. An alternative
would have been to use an unsigned int instead of enum xz_check but
using an enumeration looks cleaner.

Link: https://lore.kernel.org/r/20211010213145.17462-3-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 4f8d7abaa413c34da9d751289849dbfb7c977d05]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -402,12 +402,12 @@ static enum xz_ret __init dec_stream_hea
 	 * we will accept other check types too, but then the check won't
 	 * be verified and a warning (XZ_UNSUPPORTED_CHECK) will be given.
 	 */
+	if (s->temp.buf[HEADER_MAGIC_SIZE + 1] > XZ_CHECK_MAX)
+		return XZ_OPTIONS_ERROR;
+
 	s->check_type = s->temp.buf[HEADER_MAGIC_SIZE + 1];
 
 #ifdef XZ_DEC_ANY_CHECK
-	if (s->check_type > XZ_CHECK_MAX)
-		return XZ_OPTIONS_ERROR;
-
 	if (s->check_type > XZ_CHECK_CRC32)
 		return XZ_UNSUPPORTED_CHECK;
 #else


