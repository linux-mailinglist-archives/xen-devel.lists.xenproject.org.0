Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B23E0E70
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 08:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164131.300355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWxr-0006dZ-2B; Thu, 05 Aug 2021 06:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164131.300355; Thu, 05 Aug 2021 06:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBWxq-0006bh-V9; Thu, 05 Aug 2021 06:34:46 +0000
Received: by outflank-mailman (input) for mailman id 164131;
 Thu, 05 Aug 2021 06:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FJ0=M4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mBWxp-0006bb-5v
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 06:34:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 383f751e-f5b7-11eb-9bc0-12813bfff9fa;
 Thu, 05 Aug 2021 06:34:44 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-_iJNyv-COOewHQQ6_lnuiQ-1;
 Thu, 05 Aug 2021 08:34:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 06:34:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 06:34:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Thu, 5 Aug 2021 06:34:40 +0000
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
X-Inumbo-ID: 383f751e-f5b7-11eb-9bc0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628145283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWp4TOWuChhi3rqDzRsggi/z2q8u6ldXTLLYCrL488M=;
	b=An3ZRKRlVi9DgseqTOQjZ1sJlcAU/uN27KaZnVW06g4AqcrfRI68Exjb76yFRCMebTEx+e
	1rDF6rQXbZtb2JI53tnO59zev9AxIKGuuhHQ0lOiD74Ou9ogD5CvgzTgSaatc4jb6OZAAc
	0tFLLDhpy//Duixwh7ami8IiFylEp6A=
X-MC-Unique: _iJNyv-COOewHQQ6_lnuiQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU7VePp31ozwZfwvBDRKr9qae96yHxTck9g1Mm1psvXIH5n90UFBHS7VdSnme0Zcs0l3N5HZNB0YTyxbgH23RVDNbI/P08JVwrEftjaLbQYi4nledMP6puPX2Dla5ScAulMlh5O89kfgkW4KOTr2oAZG7QdBUBmQ4lAxbSpOJERLoYwqGfun3wejIYbAMGVmyxuRvMoT50hWbGItDRZwePBezsjPcQXK1WDDGW/Rk9K80tj/xSQWLABapcyA31aH/9qqmgUAid1sdTLVCYHmmVmitEJbKo3ey9lEp2ART0Hu0szMADkIl6KpbHoTUFAzJxW/p0IfEYUqkF+7fqqOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWp4TOWuChhi3rqDzRsggi/z2q8u6ldXTLLYCrL488M=;
 b=B9Sp5iHK8TTq8FF6oAcr1zysAaHgPbJ11Qfla5czAn04GunBD14XiQm7vvDvfoPfC6bO+PcXSw9n9w3fcz0WuMTqXrkO3yl3WuBVkiLFCGrg5KajwzdifTMW5aArAOdObrUNRuPKMmgKpl6zjCyahCQRPl3Hr7El3lNVYlNY0bh0jmOmYXq4YOqcSZT2kZmOYPl74e5e7tDqirFuh1kg+RVr163cFhEjl2JXwDMXw4isMS4ga1v8vQamNNApYs7/sB1ccv9pEJ+vkZTwc8BvybkuuRPbZvo9hQb79z8VAfEOTGDVTC1vvfyahDnmPLijUpvm1jABJ1yO2DsaM0HLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH V4 07/10] xen: re-define assign_pages and introduce
 assign_page
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-8-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <907be77b-2902-aabd-d0c2-38867be61f83@suse.com>
Date: Thu, 5 Aug 2021 08:34:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210728102758.3269446-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fec9f242-6bca-48c5-7ce3-08d957db1af1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606DBA881F5D73BA030FE4EB3F29@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qr/ScPg8kcYLT0kNbfreY4FQQMjLMT/3DNa1dPlhGx3shPHQLE4FAVO4qy4LVo9HNgxxz0Ot1z+JtE3Czu9dQFUlOTi9XSUVhGpsCB2bSX98vtCUQhztlVkqCEmFF5GEVjFEtg11pErYju/oeJmNu7ljll9Qk5XuM47IFOo5wqPrNu/2dyoEg7flgXGY7NNXH44iYZYcXkwBBvxpIJTtDVNMKlo2ck3yX8NE5BBK5pQCVgNHqIMZNaPpJwjr/qAgfY3QdAJxBKg5W1nDWRJoog/PeY1DCL4Rt+MUO5+6pLGxZ+UgXtE7NkDumjV20WOvZIcydTAt5Bojza1VPPUjfU6zbcNWqMbPHgUlPBXGBbQypm+aRjDAxkHmfvTCVjNmScgRWX+ZfbnmDhlR2ziH48kzTolw8qyYtEoq5CuFp8vid4Hl5XONVDZGCV5xhR32Fx8Bmi/dRPiEknA5XTXj6gjonF06SPL8tm8v+4nWkUV6eZ+6kT3KdFtlTpnP4rcoCpSwakCiHIYOFIqKmVoGnmdOLVBbqwAmPq9ZLcHKKYZsnnijhhBibh3ly3nAlqXnKa0seTCIiXiGTpoYB7Vne/LOimCYChSuFlzMbu7cyt2PX/LMHvaPgASE9zFNEe1nWP/e2pA+yw4a4qaVPR5o9xR2YTGHU1rGLL8FEy8w5V61LIFAgzxP0RjxLyRN0ksf5g97Y3Ygc5MKtjMNPPZ1BsZ356NOJS65J1F6n8lJ8yg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39850400004)(136003)(366004)(346002)(316002)(8936002)(16576012)(4326008)(186003)(478600001)(8676002)(6916009)(4744005)(26005)(53546011)(2616005)(5660300002)(38100700002)(956004)(36756003)(6486002)(66946007)(66476007)(2906002)(66556008)(31686004)(86362001)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnNJTGVSblZjUHBSL0xhWEhTdzMxZmN2V3hHTUE1VGF4cU8wUWFsYWtGTU5T?=
 =?utf-8?B?dXVoYmU3Z3duZmtHOGl4VmhUVThvVzVHc2U2Q2lTcVpCSC9mOVU1eFBRMTRj?=
 =?utf-8?B?VHhqYjJ0eXIxSEtsa0xWcVd4TVVDanhXOWk3RGdndkpjakZaT08xbFh0WGZ2?=
 =?utf-8?B?NjVuNlF1b1RITWRZbzRIUUlaWXF2dmtjdzhDQ3JZaWJXV0JCcit4ZFNSTjBQ?=
 =?utf-8?B?YkZjdlQ5bG15THhwdGwyOTJxUGN0VnlWeElBSWx4dUdzNU1pVkRiV1JJOURy?=
 =?utf-8?B?RnA3cW1qWHQvNGRuZzBRSCs1K25UMEZCTkNUVW5OQzJwR2l4dUdqUjJiOXMz?=
 =?utf-8?B?djYxdG9pVUpjbmkzMHo1R2FoTHRxdDdhdjBwRUp2dk5CMlBQVHY1dXFTQXVO?=
 =?utf-8?B?VGQzdFpMaU5KeFBYdWZUTVJrUk1xWWtsRGUvOG01dFo4ejV0bURRejd5dVgw?=
 =?utf-8?B?REI0Qm1tNWViMFJDN3pGY1JZQkRNK2VoRVJyd0FwZk1OWXQ0a0xEOWxpSjhW?=
 =?utf-8?B?dTFTS2cyRGtEZUs3dXRDOElOa3hBakRVdlJtUVRSUUhtRmRZd2pUamZHUmVr?=
 =?utf-8?B?M3VUekg5NWtVbWFocWNHZDdPMXpRNXkzNENKYkp1TEZrb25jVE42c0o0SmV6?=
 =?utf-8?B?ZXhMWnlhZG0xYjF5eDFOekpqQ1lxaU1kY2Nmc3ErdU5KYi9FYWdmbTZKL2VB?=
 =?utf-8?B?aTFDaUE4ZU9xQVowV3p6MHNudW1aN0M5bGpZd2svWWtoQVNLM2lOOFJ1cGYr?=
 =?utf-8?B?aEY5UFFpY0l3MEllSm9nZHUzMlVBRm81YzhqNEMzYnJJRU5PQUt0NFozalFM?=
 =?utf-8?B?KzlWbTdLZW1ZWnFoZmxQTlVKNnBTQTVsNFBxaHlHZW1UVUFnbHIramx3dTBp?=
 =?utf-8?B?LzZqRENML1gxRFlRVmJpS3FkNFQwMlQxYUNrSCs3K3hFaGs5c0VLY2ZxM3R1?=
 =?utf-8?B?RGxIVlRwamdaa3kwaFliWEtyakxobnIreU5IaWl0bURsd1QvVkJneVdhN2Zq?=
 =?utf-8?B?QmJYeldUdXJLM2pHdmtTajlmSklFOHc3UW1LbVQ5R3QvWHE1N0NvSzBEK2oz?=
 =?utf-8?B?MkZIL3FXMXBTQlUwSndub1FMMmJhbE1WVlJPS3hNK1VmbXh1OXJKZHRrNXVz?=
 =?utf-8?B?WmxkcEJZTU1uZ3NLZXZiVnN3aXVrYjdUeVJreEtmVjlKK1RmL3hLZnJuNjl1?=
 =?utf-8?B?UDRrTmhEYkE5RkYyZ1dyWkQxNkVJQWVaczdIT0tYckRpcWdlNjgvcVFCdnlP?=
 =?utf-8?B?YjJSTnRmSTV3UVQ3N0x1UEhySG43NlUzNVJJenNTRGFBaURzdWliV1BVclRL?=
 =?utf-8?B?eDJLRmplb0czNW83UGM2SWV4MkQ4YzI2RzNwaGY4NmF0enRGakhUdGdudUxU?=
 =?utf-8?B?SlhsNHFITnpVbFYwdkZ2eE9PaldScVVXS1hsbXY2SU1iUTNBYlhKdDhmTmVo?=
 =?utf-8?B?cnhDVDFUY3h5WHBPR1Z1Q3VsQlZ2eXEvdGpuWUVobk0ydWhxVUhDdzVtbUpm?=
 =?utf-8?B?S3MyRU03d1VxN0MxWTZ2NnhrT0E5UHVJQkJWR2RqYk0rNFEvRjRIcFhSY2xW?=
 =?utf-8?B?dFlJWm5LcmhxamJncW1RYjcrU1dxWjVzZ01lbElKaXpoSkpQdi9oZktDaEU2?=
 =?utf-8?B?OE5sL0g1dEplNmJHSm11b1FhSVdMWU5PWW1XYmpFdlJKb3dnMGRuRjgzQUtv?=
 =?utf-8?B?eWRaQ3ZyL1dwdEw0UXFxVnNSaUFGSWRyZ3BpTnRjbFl5WDRyMWVmKzZxQW5p?=
 =?utf-8?Q?6gxE/8kMubrs5yuVVM17+yTMFPAo/NgH2uPsIfp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec9f242-6bca-48c5-7ce3-08d957db1af1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 06:34:41.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9APfcf5XaCLtIrwX73M6ZupsbxD5ntAmuKSkWNAvN9IWhK/KXIApxDwUHv1fEgLMhFcdOeg+OIxOn/9PbB93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 28.07.2021 12:27, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> assign_page for original page with a single order.
> 
> Backporting confusion could be helped by altering the order of assign_page
> parameters, such that the compiler would point out that adjustments at call
> sites are needed.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Largely to indicate my main concerns were addressed, yet not so much to
indicate I'm actually happy with the introduction of the 2nd function:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


