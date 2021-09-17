Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C556540F29D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 08:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188975.338410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7ih-0000u6-Ok; Fri, 17 Sep 2021 06:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188975.338410; Fri, 17 Sep 2021 06:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR7ih-0000qo-LE; Fri, 17 Sep 2021 06:51:35 +0000
Received: by outflank-mailman (input) for mailman id 188975;
 Fri, 17 Sep 2021 06:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mR7ig-0000qg-A2
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 06:51:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e872609-466c-4c5f-ad97-ef5ad58d35aa;
 Fri, 17 Sep 2021 06:51:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-tIcJ4vFCPY6MsjZQW7XD-Q-1; Fri, 17 Sep 2021 08:51:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 17 Sep
 2021 06:51:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 06:51:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.7 via Frontend Transport; Fri, 17 Sep 2021 06:51:29 +0000
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
X-Inumbo-ID: 3e872609-466c-4c5f-ad97-ef5ad58d35aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631861492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9l25Mm1Xmd8Y5fKa3uYtWfNkiU7OCS2lWznkeIB720=;
	b=WHGLtgy7prTa3gabvUS5/Oyt62D8CYKTZKUFnxb9PhXsn2n72gmaNMnuEs9ALbadKWoBN6
	sV+heCov18kNce9t6wP4+9zlRQtYqiHXi+6FtzFX0jT4+DpDJaENgx12vZZ4ms12RIeCAt
	Es+gp0wcoHLFUE1enAD0Yls4y9qdNBY=
X-MC-Unique: tIcJ4vFCPY6MsjZQW7XD-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRMVErH8R/MHI9FykEhHGlAOwfJbpT8u/+qepnZ3q8hjgasuuK7pfxsz46DlVG/ezLBIz5KQZWhdOH3PAvmBh0SbJbNsyYOregH5MVrMeYepyySB9jjd2w83lkgFsvb4A56Zc9rZwANnI8tBH/9XZqFtWOSl1whAUCwnBhKwjQVLBM6HVnHP5t6XpcqyWNQmyigcKk9iGqZENkM+2ofysOQhmujz+sgJPs8Cj5r1wJrXeKFkuc0Y2Wg2+AhS5ziUXg/FSeb10JSGrqL4O0SjKCPwcnJAQZ4p3dvOSKfoPcL78KaYdItqPzzZ6IbCHc1bEAUgZHLvr1bz4GWNGI+X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=K9l25Mm1Xmd8Y5fKa3uYtWfNkiU7OCS2lWznkeIB720=;
 b=JElDhx5mDBM7tHytj4PJnqkHyMHkgVow3fPboaE0XQnGa9k/Na+ohxtFqw2OiHTBhcvhZZii4f/U5imsZMQ0QEQwG2IkYpiz9nkhboTYFnhsOdi2UVeKQwMB6xotObGOhapkR+DHKKHJqs7sRDJa7LPBfoN/etsse47jB+QilmtYyi6Lo6FSIM7sboU/1nGWZqNO5H+VIPNxcU2PCvs3iSuRAx9YSjTdX9Nl2EbCULoWp5RTBFmTiKH8h/H7R82WFRUUfvSxg+OP5LWhccbebfBbFThUtq7JhwMzUr5K40ZdPWcxKeIrE855V+L3heXKGB3zbPC/qvpRp3gqr5DwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] modify acquire_domstatic_pages to take an unsigned int
 size parameter
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: penny.zheng@arm.com, Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, julien@xen.org
References: <alpine.DEB.2.21.2109161341270.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b17a3349-fda6-8f1b-e6d3-3db2658f531d@suse.com>
Date: Fri, 17 Sep 2021 08:51:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109161341270.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b4da87b-73d8-4fc1-7e7f-08d979a793fd
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260699F54D3CB662353657AAB3DD9@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CbVmbrtbxGEFZMKOFLggRaPiUmat8vRL9eGOxYpQ5c9LRlBeQlL8EiKi6hmrtshENFROTLwaIPrb+J1wnqsR/IFOXUZiuYZ5HvQW3Zt+wSttU8bFBIq5ku0OT5yDGwCbC4LDl7XS8cm4bsvoN9PpSVsYBXbxeroEL1fSBc5TAir/Zz6XcaZInZrosuSJXdwmF95CWKoTfy09lis6qnFZ9mCJYYSAn8nz/+6sehjz85XbUzkf9buMSGzFUcL63pOmNyADR4uNIGOBI3Jaq5f3g9vh3YESvZ7lPWEgjQSUONbU+qxxfwfqk5HnlGW+9sgKqGQJrXIQtx2fuP37Rzb0fR6Ox0z5+uiiHkC1tbtf5RcTM5ticfwpmMOlxkbmyhDgXQEalQhdPL1OHRQLYcCNiINtJzhxsBJHpbRd+YXCPh2jSu1Ir+Dp8eE4bnv0UYqebOZOs03VdbPVFYf43SKM3YwpAnc/JXx7PkdRqYVZF9rxPrDemXWHdeHWszgID8iZuHkhirkjK/KuvOH2BnB/PjmTs/dY01raSat4qiXfRQmUN0JjP1/bdp/5vBmGuq1RtxbsBjEmd3iaUgQEn+sAbViCsY2o0dXBpa7HUHif/2Fnsp3j21k0Lzfo37Moam4qmDVmma+wOKwcKq7T9wTx6B+ChK6MG85LjUiGeE2sqawLZokrlpGn9w2eHSHzHqZyMbPk04sBcyaDF5se/Ark5wRtWdVZGu9lhbudaGHvJng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(38100700002)(508600001)(2906002)(5660300002)(956004)(83380400001)(53546011)(2616005)(66556008)(66946007)(66476007)(31696002)(31686004)(86362001)(186003)(26005)(8936002)(36756003)(6916009)(8676002)(16576012)(316002)(4744005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01WS0FZYUVwWDRld3NhWkNUQ0Q3S1JvaEdTYXlWNHJ4b0F6NVgrcFFzU2xy?=
 =?utf-8?B?QkxuUjAzVW05WjhJeThFdW1LMjNvYTBweWdoQVFQYjdsSGtVclFaOHZ0eGZF?=
 =?utf-8?B?TGJBZGdjbWg3TS9SRnZVd0pqZk5LTmtvYnJvZTA5Lzk5c3FkS0FlQ0FnSjZ5?=
 =?utf-8?B?czRTUXlBYm5EWWMrNXBUdGFRc21CVWNuUVB0TmxSTUlVbFEvWHQvb3FZVmFi?=
 =?utf-8?B?cjZIMUNhOGMwNlBTRzh4YU15Q0E0VWg1VytOWjdTUzN3bVl0SUQxSzR6STBP?=
 =?utf-8?B?VnQwNHNQbjVpU2djOGt4Y3hReUM2cVA4ZWRzcGNWOUxDN1F2VGUyNjRGWWMr?=
 =?utf-8?B?VEU3dFVIQjZ0QXlWSHE0enNyVEFWaXhZV2tsbU1uZWRIc3hhdkJqU3NRZHhB?=
 =?utf-8?B?c3ZSUlgvdzQ4RXpGUWNiQlE1Y04vMDFISms2aHcwWG80SXVOSDQwdWd0S1Uz?=
 =?utf-8?B?QXU4RTRpQzdOVTlKRmRGZ1Z6eXdOUDh4MERrNDhTU0RzOXlYVzB0ckJQNGhm?=
 =?utf-8?B?Q2t3OXVpMFNQaW1LbHM1Y0FucWl6cCsxeThxekNCZHlFTkQ0T0dXelJPOVZ2?=
 =?utf-8?B?S0RpeVI2dTQ4cWhrNE9nQUV5WVBGREtKcTFtYXNwTUQ3WnlScWo0czNyR2RU?=
 =?utf-8?B?VWZsQVZ1cEFSY1UvVDN0dkpXbHRRbVEyN3IvQXcxL2JkRGhoMzhndG9hdklC?=
 =?utf-8?B?M0t4Zjc4QUxnTVdKMG9rd3ZNYXk3cnkzczBaMjdaMDdLWEZqcmY5cGhPT29S?=
 =?utf-8?B?TXhRbzlNNkh1ZEl1RDI5RExndXM0SndBbjVBQ29yb3EyMmR0M3F4N2d0RzlO?=
 =?utf-8?B?S052K3ZtdWJwQWJQcDZQV2VQa1dIMmtVdnBVckw0N2Qvci9oVHV4T2VqZmdM?=
 =?utf-8?B?L0NiL0xET2oyNXgrQmxLdHJWVDRVSm9QMXF4Ri9zRjBrM3hjS2Z3OVFiSGJ4?=
 =?utf-8?B?SEc0RTAwQUJvdjdBNlNhUnVRK2J0ZmlyOGQwR0psK0FTQmpSZVprMHdQZGZ2?=
 =?utf-8?B?Y05NRlRXL3FBcnRGODVFQlBTZDM2OUJuamNSbVZoL256VHh2QXA4M2JyWG45?=
 =?utf-8?B?WWtrblB5U2RBSU1ibkhtaUZ6NzBRQy9vM0JaQkpHOVdFY2RIZmwzV2QyaWxP?=
 =?utf-8?B?YlpsM01kT1pVM0pRQndOVER3cGQwKzd5a1VBdDJnV1daRGI3Mm1BakNmN0x2?=
 =?utf-8?B?ZTRueENiMUxPUTY3ZHN1eE9VejVHM1JGWWhPTWlQQW9yYzhwbldJOEg2SDFt?=
 =?utf-8?B?d0lTNGZJeG9oZVdIVHRsSVp5dVZMRlI2b3Nyb3hkbXNLbk1nS0dMcmRCTmY0?=
 =?utf-8?B?Y3NxaUZZUlk1ZXpJYlI5dzUyRFRaTmVJY3hFbzFpczVDRk80QUgzazJqaTBP?=
 =?utf-8?B?L0g5NTF2QTFxVTN2cGoyb1hCNnpnRXlmQXB3UjJzRGxwK0o4S0ErR2o0MGRt?=
 =?utf-8?B?Z0QxVU9mSTc0eUxGdkNPeDVpcmFRR0IxaVNKL2pZOWtDWlZLUnd5Q2hPQlN2?=
 =?utf-8?B?Q1RyNDJUNlIrV0VhbTBUdC80dEtMb0pHMHBCY3docmRKYnZqK1lqWE1lcXJO?=
 =?utf-8?B?VGwycENJMW01OGRqb1JCMDlxenZxVXE1MWR0akNUUS9LMjE3UFlXb1laUkJW?=
 =?utf-8?B?SXdTeXBMaFBOL0pnMEFmeVFNUGhyZllsUnhISGVneTFFTzM5Z1cwYmN4NXRO?=
 =?utf-8?B?eFFPRFBTcElVQlBvSmkycW1neWNOeVRmUUw2dFZNM1F5bG8zbUttOTF5eENT?=
 =?utf-8?Q?zCbNF1nanpd1i723NOPa3GbHSFSsI2YRrG9QI9d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4da87b-73d8-4fc1-7e7f-08d979a793fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:51:30.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voit5ewuEgKlLxQu4Vp+BMkHwYBeUraUkMY/OsVGtwU15xYCbkEFB+GPWGPcEO+bNN/t4lgXfEDwiQ8hnQ4lIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 16.09.2021 22:47, Stefano Stabellini wrote:
> acquire_domstatic_pages currently takes an unsigned long nr_mfns
> parameter, but actually it cannot handle anything larger than an
> unsigned int nr_mfns. That's because acquire_domstatic_pages is based on
> assign_pages which also takes an unsigned int nr parameter.
> 
> So modify the nr_mfns parameter of acquire_domstatic_pages to be
> unsigned int.
> 
> There is only one caller in
> xen/arch/arm/domain_build.c:allocate_static_memory. Check that the value
> to be passed to acquire_domstatic_pages is no larger than UINT_MAX. If
> it is, print an error and goto fail.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> 
> Jan, I took your suggestion of moving the check closer to where the
> value is read from DT. At that point I also took the opportunity to
> change acquire_domstatic_pages to take an unsigned int parameter
> instead of unsigned long.

Fine by me; fwiw
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


