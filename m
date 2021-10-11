Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B444291CE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206158.361664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwJG-0008B9-IJ; Mon, 11 Oct 2021 14:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206158.361664; Mon, 11 Oct 2021 14:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwJG-00088W-EY; Mon, 11 Oct 2021 14:29:46 +0000
Received: by outflank-mailman (input) for mailman id 206158;
 Mon, 11 Oct 2021 14:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZwJE-00088Q-T6
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:29:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad0a7251-2a9f-11ec-80e0-12813bfff9fa;
 Mon, 11 Oct 2021 14:29:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-a7zHLdrhO9qRKTFECurEhw-1; Mon, 11 Oct 2021 16:29:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3775.eurprd04.prod.outlook.com (2603:10a6:803:1a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 14:29:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:29:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:20b:310::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 14:29:36 +0000
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
X-Inumbo-ID: ad0a7251-2a9f-11ec-80e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633962583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aow3dn6mw8Vmj0BQNW9QVxQHgMnGOTqgYe2KIeT4Q+0=;
	b=NYHO+awqF3O2iIVC5NQWtgk9P4yEF+uHsPqjNEjr++AP0xSKfWbQKZ9ibOX2vO/RuqrJi6
	959KYDZQNPxP4W5uMl8SKyyaju37EUrHY3CSf4UUxMbKIpgBkE6camCJdAgDbET7FUFrzP
	PzZkCHgfBLRSuB2W2V0GC8FESFJhSpY=
X-MC-Unique: a7zHLdrhO9qRKTFECurEhw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yk7uGvpunrNADq/6482YCaigOabozE2l4nZ9SgAGx26eL5FirgTzWokT1/07Ioo07QqF2vqYVGrBFf0aVO93NJ3T/QNyX7CKSyf3flz/Zvf/HsAiFoVvXiCC3DrR/vFULzwZAW3VOMMGRQ0TI40jbanHrg6GQOqFmCut7AOStN7fcz4cP+nhJ2x4f016HVFxUQRycbLN4KQKWh5rfN0cdCe75YqgZbWKsc75LkXDn+s70C6OMQNsn/aphSZ87r9DofOF77+cFRTfvrhbMnWzqhx91G5AgAuvThPUYe7s2LNq/8VSRh4RhK0TPFa8U/1VF5yqfSCajQjrGApiSboqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aow3dn6mw8Vmj0BQNW9QVxQHgMnGOTqgYe2KIeT4Q+0=;
 b=I6tevelpOmKxT8vshpIoL/fWqZMj8qGFPRQL6Vn4omzrM8DIDXgVufFoTHw6kWShW+TVQgb6d73kA8IKNOBYszmDd2yEKJZgVw7BlxeJ8A4OagUoCynFSxMs/VOCHn0PtOMhNJ5pdjI5PR5BDpjv1CCLUgcNUYsckLVgZX1KqNaFrDt7RhB5Oz74OzrdtX4PwO2TLD8IwebT6X064G/gbxZSnJgMs1sgkcvrbDltDHcDPPVSzQCsTpMP/l7XOlkXA6+5+SGiX6r726QlYYdjtAa9rCU0sOkxOIB71kBevH+6e9ZHwVTbCWXzy2JhEOz/QSXOarpie45kJTqFLXioPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 29/51] build: add an other explicite rules to not
 build $(XEN_ROOT)/.config
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-30-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9e7f5cb-3a0a-f28b-bfbd-f610043b3cf5@suse.com>
Date: Mon, 11 Oct 2021 16:29:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-30-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 416a3ddd-7fb7-496f-25df-08d98cc38d49
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3775:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3775C0D84AD7FD5AAC96A025B3B59@VI1PR0402MB3775.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5RN8du3C5h+nQtzCSUdmKFmThH67ai2t9IVwbAlZwibfVdJCTD/8QJ2UCkIvyn2IXN4SzrmBNhb2NlUWSslbI2xeb/5AC0dK+fXgVpkdZbPSOPciSs2BVP9i3vHuKq7vkO8VsPCk4frfpdLfUGZU3pga8FZLFvs7DwhSihhBxlxMAHp3lcivepSf4iTzWoMnQaTinrZJwWCqMVazpP6okCugoDiGKlAprxOSP/tx5HIwwNSRPGFyj1ZHi5ADX0lZGqPbY/hpvGzEczLV7xX8sGufz/Ldm+xPjfGQFtFojvXprEzGHu4NU3BLCegnNdQQVFFK4w3PChH4/UAhDuoU4IpNoGGrRC9XXQgRMtIK80X4HiO1zx+gx6xOB8VJfv1NuBYykYyLTkA9gkQ5mwOV+g2MN54N/Db4ucMJPDg2MGOx2lH49Ehisw6qC0tY9UOiaNcGzzk+RKP7ztVP/o4atJ97C3deMdNUdasWaMknPho07/rXouOvC927YF17ZeTPWGg9+ICSpnBeS5B+aRwOj38jN+7gHVgi3HeaKMZsznzqUpB1QoQEO6+1g2kRDPbAlHT4n/1pPRygmnAxDIeEyS77xFrk/EadR2L2NKn/sAhZv4ZHiqJaqEslvBRCm9gP1kJU0uwWhFjA7KLfp3opYk9aV6sbWWuBsdMQNyMN5xj5dYePVWuce51ffzVTP4JIc4CRfG3OSGfb97+9z3PgxRjNa0XnY6raMyenLlYyU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(5660300002)(66476007)(54906003)(4326008)(8676002)(186003)(86362001)(66556008)(316002)(31696002)(8936002)(53546011)(36756003)(31686004)(16576012)(38100700002)(956004)(2616005)(4744005)(6486002)(2906002)(508600001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnlkQXpPZXYvbnhNOWhuemZ3VCtkOStkeWhxUmlxT1FTKzdkcG9YeldKaCtU?=
 =?utf-8?B?ekZvRVd5WktqTjlzTFZXbzlNeDEyUDFkUHU0NjJVZERNSnpUMDgxN2lXT3JL?=
 =?utf-8?B?L2lxbnpzYkZXTTFZT1pNeXhOS25GTzFNdk92Q0kremwxOXBvNXIxRG4rais2?=
 =?utf-8?B?a0Rma0NFcVV3b1JqWVhvL0dHUzQ2cy8vdHZOOE05L0RFTjFadXVzOWpuS1FY?=
 =?utf-8?B?OHdPbkpnVGJNK25vNVlybjVpWjJ5d0tXdWZBbjlwTk1IWXg5NW5oTjJMMnk1?=
 =?utf-8?B?bnZqQXFxWHJrRjFrekZNQnZGZ3MwT0pOZHplRURvRk41V0ZFNmNYL3RCNFNW?=
 =?utf-8?B?SkZJSHZmdDlvcHdBRi9VbDBkeVhsVnI0dFRQSS93a3NocFpjTWduN3IrRk9r?=
 =?utf-8?B?akpTOG5wdmRKTGJzUnF2a3VLT25HR01ldDBvbjZnUTVySGNNaXpuenlBbmVu?=
 =?utf-8?B?bGFUaktzV25VK3pYRU5COW9SZGRHcWxWanhRNmtMcUJjVmdBZGgvb0tCOTNB?=
 =?utf-8?B?SjlXalRoZzhFRWxKbmtCZitpYmxlYkc1RUEvMFFyQjBEczZuSmJWM0ZWUmMr?=
 =?utf-8?B?bjh0OTJCRDd6NVVrOHBzMUV6a203Q1FOb1dmSHRIc203N1VKTnpLTC9wbDVM?=
 =?utf-8?B?U0FmK2VHSzlYdnhHdWNCT1JCZWlUQXpSTVlDUjFqTjFPek9aOUVoak9DU3VP?=
 =?utf-8?B?dEc2NE1MbE1COFFXcTNsSXlOdW5aUUNFeWdrdWRCakZuT1Z3YzQ0NnU0em0r?=
 =?utf-8?B?Y1QwdmtnRWZ3d2lqN2wwVHdSbFlaZnBzWFg2dWl3L0ROYThTSURNNVIrRFJw?=
 =?utf-8?B?d3dKL2lQTS9oejgzOERaYjRFb0hqZE52V0ExRXRpSXM3MmxOc25ObG51QXJX?=
 =?utf-8?B?WkR0dDl2aWpEL1F6RjZyeS94WmNuWVFXZ013VUpocWpBLysvR3F2dEV1YTg5?=
 =?utf-8?B?aDJ6R3ZrQlhIWW41QXgwdlVaN1BxMlFLdXdHdzkzT2FYZEhTaTEwTnFjU1VB?=
 =?utf-8?B?R3lDbWsvSDhtOHlHOFo4T2NDUE9ESy92LzV6RDhBYVJCQmFtSjBTRWtHendG?=
 =?utf-8?B?aE5pNU1FUm1KWXVub3BOcDZWeGRidzYyWS93M09YUE9lYVNjbk1Lbm5vaVhp?=
 =?utf-8?B?emRsTzNwY25rYm5uY2V3VUVYMkFpZ01YdGJ0RVlMTnFtYnlKeEhBY1NEalAr?=
 =?utf-8?B?enlMZ1p1dXYvdGRrTU0rc1lMa3phSW92a2dZcEZ4bzA0YWZ2SHNwdHI2eGxq?=
 =?utf-8?B?Y2dxMDVCd0dFdzNwdG9kL3R3eVRqUm5VZnRCeEdpM2pWYUlOV0xmWHE0UGF5?=
 =?utf-8?B?dnIwT29Jb0U2VlV4bmRvR0hGeVpRU0c5VWtaZlQ2Y00rUDZOS29JV0xFQlZD?=
 =?utf-8?B?c01IcjR6ODJMZU1xTFVzRWJseFBzVFlidFhpMUVlR04wV0MxTjRtNFcvQUdq?=
 =?utf-8?B?MmpkT29uVTI4WXJSc1E4MWUyeEgxYndESTFoLzZKVTF0OEhFSmlCL0ZTMTE4?=
 =?utf-8?B?SUttN1UvQWxiTzFJekJaam1kd05mRGhsdlRJRXVOOVhLbklXZVNWL1h4cExH?=
 =?utf-8?B?Z0owZnE1QWpjQlRnOHVRR3Z1VEcyWmMyV2xNUXlLeXd5Smd2WEI4eHlRaGVh?=
 =?utf-8?B?aUNNSDZNb2ZKcWpyd2l1UjQvU1lsdmtFTkMxNWVVZkJtNDVMRWZXUkR5Yi9h?=
 =?utf-8?B?cDZJdk1OeWUxWUNMbnpydC9MQ3NXMi9XK0VjTWtrMWxHMHFxSlM1akFQTmhP?=
 =?utf-8?Q?4nmr+EQ/5E2z1UW2YhMimJnePfdKgB33QStQUTh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416a3ddd-7fb7-496f-25df-08d98cc38d49
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:29:36.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NJEV2wcI3Uwp9uOyxXw7q1vEhqDzpJMAunrOLnLGLOPebsEgTlaoZBWcY3ogMY3MElMdlNZDhLuEOpZB/EXow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3775

On 24.08.2021 12:50, Anthony PERARD wrote:
> GNU Make will try to rebuild every Makefile included with the
> "include" directive, so everytime Config.mk is used, make will try to
> build ".config". This would normally not be an issue, unless we happen
> to have a rules which match. This is the case with Kconfig in xen/.
> 
> While we had a workaround in "xen/Makefile", this ".config" files
> becomes an issue again in "xen/tools/kconfig/Makefile". It has a
> target "%.config".

"we had" sounds like we don't have such anymore, but I don't think I've
seen it go away. I'm also not convinced working around an isolated issue
in xen/tools/kconfig/Makefile is appropriate to be done by adding stuff
to Rules.mk.

Jan


