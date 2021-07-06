Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C193BD467
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151178.279419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jrG-0005k2-AS; Tue, 06 Jul 2021 12:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151178.279419; Tue, 06 Jul 2021 12:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jrG-0005hC-7A; Tue, 06 Jul 2021 12:07:22 +0000
Received: by outflank-mailman (input) for mailman id 151178;
 Tue, 06 Jul 2021 12:07:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0jrE-0005h6-54
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:07:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5d74faa-de52-11eb-8491-12813bfff9fa;
 Tue, 06 Jul 2021 12:07:19 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-oPl56ePiNCKWtwmP2uZtuA-2; Tue, 06 Jul 2021 14:07:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 12:07:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 12:07:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0229.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 12:07:12 +0000
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
X-Inumbo-ID: b5d74faa-de52-11eb-8491-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625573238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D8yLcLqwryIspS91KZTehJYWVyozXTYsuV26DYaOzZM=;
	b=WRDTmeLeqytOSzogd+edBhzx9MGKwtRFwasWGlkka+kPQPIiAkWrEEHsZvqxvLB/Ku74Zl
	aKgc/AICMCeuMvzb+eiDqUGlAfYLybbVys+d5ZsjwQd2G/kyPwR4pdD3wGWS0Eceunrn4y
	bYW7WWMNSS+XAavPJreR5WeOgoCB4Pc=
X-MC-Unique: oPl56ePiNCKWtwmP2uZtuA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YU3csL2mgCBsYjub6cagRx6W81BkM+1bFWElp5iaPYHn8DSvNCK8HY0NWKMYh1K9d2VrYdAwhF0iiJvdUWL7SIryALvaktEF2ypk1PsW0jjdC1P/YObF3J7DWE+ULh/D8hXfvApJvnoVixKMMFb3TJ9w6EDcquhRRT2la98KhDxM6CrAor+Zfi7Grqcc74Hst6I2mk2Qsoe+UBRhzrcCjuZL7bUNGtdBU2CKPSwZRzTKIyIW/ph8SCkYktFNUQRG2PXglmPNLygnq0jdEGzGxba2v24T7NJyQbIgIAm9dIcCvYXbCY2KBQ5BwSxcqroxj8f8x9wiV5E3fialSfGzXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8yLcLqwryIspS91KZTehJYWVyozXTYsuV26DYaOzZM=;
 b=k9v1dsGYQMi8BCoRkGjnnYOm50yfUTkCVj1bMcaY7uoVQ1D3QhQIyn65rlbh5fftUWbbI8S7PWxUIde+BNE2IKkKvm9ypVwSGNqXqybXWydvtOst7FZw+5FYfjqotgRDrqZz9PSjVURMMQkFdvScUtr3RF/AfGH1GhaT7im6mMRFcqnT1lCcyLMvHLZrFyjIGJTDrjbDd4yMjRgRvPZ7aOm2a27eCZRxiAGaTl57Cj74qSd/GjRjaqzN9ORzCV7G3XTPHthEHpChscHyVcdDzI3zvgHKcUO1umT+yOpagbzaCH+MFBGz3MCOjM6rdI7EaVd59h3NUgzGu7Y1ecy9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 0/2] tools/migration: Fixes in
 send_checkpoint_dirty_pfn_list()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Olaf Hering <olaf@aepfle.de>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb6a207b-fb10-60f0-60b4-8f678608a68a@suse.com>
Date: Tue, 6 Jul 2021 14:07:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210706112332.31753-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0229.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 873fcd2c-3fe1-4d6b-04d6-08d940769703
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64796AB367F317D01E5F24B3B31B9@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0zw9YKBWEGa1jcCnEoW/kfiDRGRn8ay+1cCPNueSqdYAuU+r55uQhURjDsMM5W4mo0JyyCmD3xdhWDx83jXkBzUrRUlsFGEOtYMboXpL8Qsx9SI8L0WN01xEdsH6iJcHtG0jxznwISQ+FXBvfC2958W8+0llShr8h5KRsvZCa1oqvnC7dIeJiyXh88+yQZznhoqY2HmcDVyRpazU+otVqQp9FlvP0kkrJJIsFXpUflO7r5yPkWNwRzGoemPOs8HEyqIPgqLD6kLGpsBxb+MOmrEtA+pSJjZUhy/lquFbDKsl4OaZttGQIGN4RRNXvCJPo/PR+hYb6mGi9pRiVIJFSeuw8Kf49DToTXKosZZQHesLjq0wBqYlG5lqPQPeh3VTU3JFjxj1yAUZRjUTwmTUmicuNsEOPE4YMAxzwl/mbuEakBRQcx7DPXVg+d9N2VYFSGUrKcU58CssYG7NeNE+G0UPSe8pmMU01NdxKiEnuIUVpiJFic0gQTsEEYMovxuxxPR7ssOGmcZtVUPK4WHmK2D2lPFhX5oopbkhpcJRI5YES1KEy7a7V0lJ593lWzBod4dtDZCl4OR2rqJNgJVP6cM15ikCz5p1d9U1BoSeZrQEHQPN1N2ew5dHzRe+vjw2V2c8kr80VQZ3Y/WNOisMD2xkamNgH7tsjpjYPCZke9fE7ktjDxnlSdLCsCHTXtCYYF4YVT2iJMM52UabZLBzJhjHKhPzJGhcHa7H7W+2+qDAgNVxWNmzo5442zFj+LYDm6a/apwCpNK2edWzcwWMGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(376002)(366004)(346002)(36756003)(8676002)(316002)(31696002)(66946007)(4326008)(2906002)(4744005)(86362001)(38100700002)(31686004)(26005)(6486002)(66476007)(16576012)(6916009)(2616005)(186003)(478600001)(54906003)(5660300002)(956004)(66556008)(8936002)(53546011)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzJqdzlPdDZqMCs1eWhEU3JwMlZhRCtHSFN4a2hDekFEZHk0V1d5UTl0Yk1O?=
 =?utf-8?B?R1lYRi9QTXJHRVo5MVR2TnBDcXVLVFJzZTRHbFdCMlV3cktMSUFmOElISFZh?=
 =?utf-8?B?RnlhR0JhVnVFbC9kcU9OZWE3VmE0bVhkN0N5SVR2QlJmSmEzVWw2Z2xjSkJx?=
 =?utf-8?B?WlR3S0RRWjZ6ZzJxc1BCUFZPd2RkK21kRy9EMzhpbWI4VkxXRzhvZmc5TURP?=
 =?utf-8?B?OVZEZWtmQkFSTzN6NFkvY1hiL0svZWlqMnIzM2pPd3hzUEVPNlQ1WFRWOXQ0?=
 =?utf-8?B?WjR0QVJYNjR1dmU2Zy9jYjhlMzNkdGk4Rk5CMnlnQmUvdW1VSlNVSUtXSzZP?=
 =?utf-8?B?bmJpbG9JbzY0b0ttQmpHNDFZUktlZzN2MDk0blRZcCt1cllvNnpFYXQvQ3ZY?=
 =?utf-8?B?NVBCTzh0NWgxTTYrTnM3Q2ZIZEwwYjRDWXV6KzQrVEY1L1hEZ0k1SjMxS0Vk?=
 =?utf-8?B?ZGQwbVNvZi9FenREem5aam1KaWZtRnhoTHNhOThkOEdxYWFrVFlTY1dkRzA2?=
 =?utf-8?B?OFByVmMvYzQvTmJjZkc4SkZoNkJlc0oxSzhiK0Iwc0h0dVljTStGa1J2UXVp?=
 =?utf-8?B?aHpoWmQ3QWF5dzJuWXN5TG5lamI2WEJMaFZXell1bXU1aWZMQ25BZ1FUQlhS?=
 =?utf-8?B?K25Lem1PR2xlK1pnZS91ZktOcVdnNjZ2QXRjdS9sNklQdkVXTEJlV3VpaHh3?=
 =?utf-8?B?ZGVMenpGcXpPSWd6U3VQTVZRRldhcUtTNG13T2cwaENYOHdEZlRabytiRmcv?=
 =?utf-8?B?UGE5R0RFcFY2a1FjdnI3N2pNWFpTcnRRaTZ3OUdJUnhBRWF6MzBkeDZaNXhD?=
 =?utf-8?B?RHVsZjFGdk5IWU8zUWhMQzNSL21yeGVEUjdpai9TL0ZMTVMzRE42UkRKNXZ4?=
 =?utf-8?B?T21KdUd5SENIejVKM3RYVWpqMTRUM29LemsyY0FtK0lQRGpYWjdSTGppNWNv?=
 =?utf-8?B?dGJqdWlDeVF1V0owVThnV1FUN2k4N3A1Yk1sbG4vd1VJTXZiajhGVzVrUVlw?=
 =?utf-8?B?RXMxeFcvOWhEKy9nODFQand4T1J5bkt0bUJNazhtVWNxRVZKenZoZFc4eUNZ?=
 =?utf-8?B?eGVYQjhkaS9OMFNLamFrUFFxUmpGNjhTYlVSb2wySU4wMzFQK0d3bG1JU0M4?=
 =?utf-8?B?VnphSkN5QnlySStBVnkzdk5XUkkvUnVPaEJiYTZqRnRUTVZKZjVzYjVhcVFs?=
 =?utf-8?B?a015OVIxbkJDWjRZZUd0S0VYdnB5b21YM1JPZ1haczhHdjErdmoweVk5ekFV?=
 =?utf-8?B?bHlwbGg0WnFLaTNVZjU2VlVKRFpOMDIxUXlNS0k0SWEwQ2xYWEJPZVc4ZkNm?=
 =?utf-8?B?NS9KeWRkVDhOditEVm5DcEZWYWRJVnhPM0RhRWtZVzNONjVNdXg4Ky9QYTFj?=
 =?utf-8?B?R3lzSjZnQVJTN1A1NXRVTE90VDFXTzVzZzM5QVZseHJZd25PZ2p6ZFBDT3hh?=
 =?utf-8?B?Z3dpcFJsa2x3QXFkL0M4ZmxUaUVxQjJ0VGh5MGZzM3RkdW95bloyV3NleEVU?=
 =?utf-8?B?bjRHM3JhZTN5NXViZjAxN2N2QlFYWVFrMHZzY0k5Z0tNOXh0NFdyQnNBWXVZ?=
 =?utf-8?B?QTdzQW5NeDFaWlhraXRuZ0k3cGtEc3RRdU1PY3FFWmd3MXQxall6MFNwQWRP?=
 =?utf-8?B?dDRKbHZISlo4V0JISW13UWdLRkpGZktJaXMyQU5yQ0QyMVMrdXN5MENkSFox?=
 =?utf-8?B?ck5nUUV0cUwvbzNNKzBVb1RaWStSV01MeXNqdFI0YVJ0MG5MWTZMelJwZC9h?=
 =?utf-8?Q?GF2hq0MGy4yXCNPVy0N9DO7S3k3V1XSHa7jvJYb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873fcd2c-3fe1-4d6b-04d6-08d940769703
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 12:07:13.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb+s9J0Gd40P0K+anH4cixuApOIesJOcNGgCRGFiEJ+gRS3HjRbbMUdTP6CrLROIN+LJORREewIZsulvoscidg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 06.07.2021 13:23, Andrew Cooper wrote:
> These are a prerequisite to all currently on-list patches touching the
> function.

Just as an observation, while I can see how from your pov (judging from
your not-exactly-review-comments) patch 2 may be a prereq to one of my
changes, I don't think I'd call patch 1 a prereq to anything - this is
cleanup which can be done at any point. Of course it'll allow me to
shrink that one of my patches, which is certainly nice.

Jan


