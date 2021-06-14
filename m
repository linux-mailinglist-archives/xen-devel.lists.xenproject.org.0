Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4443A6118
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 12:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141322.261082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsk1b-00054z-QG; Mon, 14 Jun 2021 10:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141322.261082; Mon, 14 Jun 2021 10:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsk1b-00051S-Mv; Mon, 14 Jun 2021 10:40:59 +0000
Received: by outflank-mailman (input) for mailman id 141322;
 Mon, 14 Jun 2021 10:40:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsk1Z-00051M-Pf
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 10:40:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17215cf-8770-4f08-a7fa-2f3818f21f58;
 Mon, 14 Jun 2021 10:40:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-pdwX8b5YMY-rk8FfUAoNdA-1; Mon, 14 Jun 2021 12:40:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 10:40:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 10:40:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 10:40:48 +0000
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
X-Inumbo-ID: e17215cf-8770-4f08-a7fa-2f3818f21f58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623667251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U6Y9TEnLy4A3egQcw338VygtEogIv1SMQnGzmu3Kcoo=;
	b=Bkrc5WupiN8v2sNPEO5EVNqpBmdfUKU8n9+jq9/rwPuXn8sXp19/XCDVulLcU+AznTnE7O
	2JJ1hmdeHrCbRpUNldBXuahbQV8cFajTKeIWJqv9pTjJAyfIm5ElthHKrOjP2oR3uvqnNZ
	nus4S06vZ6P0cbwq+FkSJ0O65J0f1vk=
X-MC-Unique: pdwX8b5YMY-rk8FfUAoNdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDjvJDL0W+6IeDDNFUj+nRhV680eGJCGMURSZvAdrmLMpZXnBl4Jyr4/Ia3n0UcJePK2ikkYKt/0fO9jhj9bLpPXMLbe2M/bBQ23xK30IKLnI/lGqAAfzSLwSbL0VDAeNF4eYzTsZlruRIvrZ7ne8p2fi5uolGr0xX7gTnow+34BXiCAZv7erol7A+kik9qzJvUhSmsSa+ogKhiflzv1x9G+QFXAC8hNjuUFQgfb3cm98rsLHV6jGT9M2H6cTd3JFEFMl494Fcd9N5MgnGqEbdfej4h4eo9I95DuGBfv8zvF6c2FbT04THavzeqYoJzM7hpxy4rNnrbqOoEuKCGoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6Y9TEnLy4A3egQcw338VygtEogIv1SMQnGzmu3Kcoo=;
 b=fcAPlxra443yKwaG1R+Ya6r5MEdXQE0K8SnB7sBMfNJm0NvSNZv1zBs1QA+z3FI8SHVJNBYs6HnIuisDkRfOB1+VMiX/qT/yfHfKwhcZOzkeRPkkBZbth0x7MJQlg/cw9Mhxzg9T66MV/5/vO88FoFX6lo7CyhxNZtbEQmPougJ2CQwarIoMwg/S99/vI0LHXw6y5apBhlSBh9IOA8P0WHBL6LEeeNS7Yv8cm/48RDhu+mMY9EwIoeNv9B9XBOSJgPzqADwBChFLZH89MYiwtnO++wwbVUQ3PNlwhaApdN0TMDx7UdUAlIpUD2VniqRWqj7zIdpvxEFOZ5loax8hyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Arm32: avoid .rodata to be marked as executable
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
 <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4143bdfd-ca78-d7ce-4ed0-2b6271c48ecf@suse.com>
Date: Mon, 14 Jun 2021 12:40:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5b819c5e-587b-4eec-b873-73892503c3e2@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0261.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::33)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41e7f88b-baa6-4549-5e53-08d92f20df9e
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087BB9E7DA8759332F6E17DB3319@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mIFC9SE4/2VRcvPn537FxPcEmgi604pc8GufEH6pCATxV5BwDydxMXoheZQgKdm4xLZeRsESOWkc5Ny22kF7jL1sIeA1kdEyoiR7gq3NLDEPjELlTjGX5o3/0W6/p+1HiC6IuktuarjSbD4YJw7ifBOwsNdhTmZA3i2AfNg3sN3Kg9Tj7lwQy363vMMKUlsY7a2PVPyaUAYgmiKepSDAU+QcvMDHt4qHDfot1Hll4q+KrGAcVY9rGISN+AyVplghvXgQ1ZxstPf0mkss7jgWhTF/QEcCNV3f2SdnqluYtWa4xlHeRAFEzj5hzn40ogF+UsvBVRNih2QkrN/YvI//OOa92g1awx8IwZbA+/8L0mRTJCYj71HFe8/9ja0ERehhwiCpx3oS46u0NkTFm7dxEx0RojGmcXyT6k+WR655p8SclrVzOPjfJzK3CObG1LCBt2jM7UrsWot15CGyEaxC2EvGrhy+23y9v5TqntG+DCE8hRV1c5Fz6TC0QdrqHM02n9+uFNLV4xDFcT5NX7EgB+sGxBZ11A+e66p6gcGdbvT5NqLGyfkI/VatvuLZ8Ong2zwcCr1YOyNAq4AUcqfLSyyhMhHruEL5yDbAZzpXkkecVq4mwvjJtO1a92+Ens/l7foPl2eEDSm0FzJCcDYukjhIfRiYAMBxNHhR01vRtloN4oaxqFPyr0zj2p9J2M85JQSXIgoX9tSUpy5raHKFvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(136003)(366004)(39860400002)(376002)(2616005)(86362001)(956004)(478600001)(8676002)(6916009)(6486002)(8936002)(5660300002)(66556008)(54906003)(16576012)(316002)(31696002)(53546011)(38100700002)(83380400001)(4326008)(66476007)(31686004)(186003)(36756003)(16526019)(2906002)(26005)(66946007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ymh2ZU4weE5idnoyY3UzWnJBQkJYSTlWWFVHemN6TTgxQ2lRTitranNIdmlC?=
 =?utf-8?B?K1QwclRLQzBFaC9yYjc3dE9QV05vckZ4ODg0OVg4OU93V2ErRzJTWW01VVBD?=
 =?utf-8?B?QWxsVFR6Rm9BZkJFVEs0MHdXMXJoRVpIeGpyMkZuWDBieUU1YnhHR252T2xP?=
 =?utf-8?B?QkFDQmpSZVlGSk9BWUpZcGpaS3EvaDBTT0Z6dXpka1lXRE00MStiQklRMk5Q?=
 =?utf-8?B?RVhGbEFYMWJjb1doN0k3Zmw2cDJtVGJ4d050ZC9NSE5OQ0lBenZOR0FZcTNw?=
 =?utf-8?B?WjVxODhnWUY1ZVI2dCtqNUdGTG8vRDMrVWJweHhjdk5WRkdwMWZ4ZVl2eHg4?=
 =?utf-8?B?NStvbVhLMWdtNGJ5NFpxWE10ekVaU3grZ1dWOEJvQTk1QWl4T2hmbUoweHRY?=
 =?utf-8?B?RitFRFI0dUU0ci92WlRJeWVYZXdBQUlLYjhocEFzeVZremJSTXRBNUxIQm1X?=
 =?utf-8?B?cFFGTFRtNUlJWVJ6c2ZkSVYzM0NtSXdUQ3B0MHZlUjlzbUJzNjBacjIvMHFB?=
 =?utf-8?B?ekozS0hQbm1kWU8raFZ6WHZrc2dsWDV2QUd3a1ZkRGU3OHZISHhxZU8wSUFW?=
 =?utf-8?B?R1F6Sm02dzRsSFRzS29wSHV4WGdFNlBoVVVobVg1eEhjMUF6T3l0Ull2VlJw?=
 =?utf-8?B?eDVrbHZVSkk4NWNCQ3RMaEhwa284MUEzdnVJYWs1SGZJZlI0aXh3eWlab2Vw?=
 =?utf-8?B?V1ZwV2h4ZnVkWm5WVXJZZnlqNHVDZVAyTVp6eWJFOXVFTEc5Tldlc0NrVUhv?=
 =?utf-8?B?VTE0aHd0VWU5K09IVDZTd0EraitZUXpRQVVyMjhrVEtWVE9YNk1lZ2x6RHo0?=
 =?utf-8?B?cHVpenY4azNsMXRzL0lCUEwwOFZmZEZtQmZRV0JNRkkzcWVVT3ZvdVdjZDNC?=
 =?utf-8?B?RTJySSt5K1RoUkFBZWhwOUFpVldMMEtuUHpuVEFsczM4TEpoVEtDMWRhcTQz?=
 =?utf-8?B?OE1tM2orcXFqSktxa3N3cG1Vc3o2QUdsdm1meVY0THlrNVBEV1F0ek9oVlN4?=
 =?utf-8?B?SEZUcGdQaTJjTHVSdDJlSlJ5eWNjcXJ2RjI2SFNDUkdMZGhteXAvUm5NSzhO?=
 =?utf-8?B?cWZ3eStuMTA4L0NZT3orQ3FXeEhmaEV5SWl2NDZRWldQRm1lbzNXdEg1MDVk?=
 =?utf-8?B?VjFmWVBxS29HTFRnRXVDM3JObHhZOE9XaytSZDZua0I3NlN1RkRNQTRxWmdt?=
 =?utf-8?B?ang4cFhqb0xuSEtxRHYvNmZtZVh4WWQ1cGQ2ZGxjZTBieVFCTEkyRGQydHNQ?=
 =?utf-8?B?Qm5DOHRNdk9pR0tscHFhU21CVDNUL3hqQ2RIZ2ltZGN1WFpDY3QxNllxMnI3?=
 =?utf-8?B?MVRCQzJ1SVBSTGpEU0JRVFljNHlyaFJzbG5xQkJ0eFg5N09nZnJ1aE9TNW1w?=
 =?utf-8?B?WkF2a3cyYi81OE9SNUxXaVRIVmh3UGRGK0lRTmxZK1MxbGlPTDdGeGdpMFpp?=
 =?utf-8?B?ait1YlNPTFZ4a2pISVlEb0JIQ2NZUE5HdWs2TDhRWGRDSTVKNGNoUlMzWFJG?=
 =?utf-8?B?Qyt5ZUxWa0pucHdyaTdRck14THFxYmZMeDdyYXRXUVR1dDlxNkt5VjRiem90?=
 =?utf-8?B?ZXJudURCZUtUOTJsOEljZUpJbzJlQ1VVaTdDWkYyS0NMeFdxT0xJdmRnMHJP?=
 =?utf-8?B?YkhSQXZjK3Z1MWR0c1JtOVRFbDRCK2YveGI5USt5SHFLR2o3aXVudDJkN2N3?=
 =?utf-8?B?U0kyOHhLZGNhcXIycVlZaWpJa3JkbTNCekhmMmtlL1ZIL1RWcVFxcGFXOGoz?=
 =?utf-8?Q?xyH0f9H0MuwxTe7ZiKfL6dd04eop2pwzlANyosg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e7f88b-baa6-4549-5e53-08d92f20df9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 10:40:49.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFosQpvHLi2xewfuyZGNXfExod0YVvf1FaXENanonzucR8+dREia+h37nH4Z2XWH7VbmHDXKuYWa7dWCu8DCNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 14.06.2021 11:57, Julien Grall wrote:
> On 11/06/2021 11:19, Jan Beulich wrote:
>> This confuses disassemblers, at the very least. When this data still
>> lived in .init.*, this probably didn't matter much, albeit the
>> "#execinstr" would have been suspicious to me already then. But the
>> latest with their movement to .rodata these attributes should have been
>> dropped.
> 
> I don't quite understand why this wasn't really a problem for .init.data 
> but it is a problem for .rodata. Can you expand your thought?

I've said "probably" for a reason, and my thinking here goes along
the lines of what I've said on the other patch regarding .init.*:
There's perhaps not overly much reason to be picky about the
attributes of .init.*, and at least on x86 there is also a case
(the EFI binary) where we fold all .init.* into just .init anyway.

The alternative to the present description that I see would be to
go with just the 1st sentence. But I would be afraid in such a
case that you would come back and tell me this is too little of a
description.

>> Fixes: 9cbe093b7b84 ("xen/arm: link: Link proc_info_list in .rodata instead of .init.data")
> I don't view this commit as the buggy one. I would prefer if there is no 
> Fixes tag. But if you want one, then it should be the patch that 
> introduced #execinstr.

I've dropped the tag.

Jan


