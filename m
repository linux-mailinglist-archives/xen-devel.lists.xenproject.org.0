Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A087465FD0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 09:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236382.410041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshkh-0000CE-4J; Thu, 02 Dec 2021 08:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236382.410041; Thu, 02 Dec 2021 08:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshkh-00008G-0c; Thu, 02 Dec 2021 08:47:39 +0000
Received: by outflank-mailman (input) for mailman id 236382;
 Thu, 02 Dec 2021 08:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mshkg-00008A-2h
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 08:47:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fd1ecc1-534c-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 09:47:37 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-FEQti1_fMK651T0CZmQpUQ-1; Thu, 02 Dec 2021 09:47:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 08:47:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:47:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Thu, 2 Dec 2021 08:47:34 +0000
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
X-Inumbo-ID: 7fd1ecc1-534c-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638434856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IX8V4+u3EsAJbStITWzswPVE23pfTomwmiRAJcDmu/g=;
	b=TUKsRLENwtT4ry95nh0gh4ZOL2k1rfL3xMGRr6OIWkm4RwWPQQC/NanZjgGyUqPxROUV8d
	sauDMaRl152TqoGxCAoRsq5SJfWXh6CNxLpGkLj3vyrIbuyJ6K/cgPY4p0Wm8nKJ/2tOYT
	a1UTh34np2if6D/UUdS26IuU5ApnLDw=
X-MC-Unique: FEQti1_fMK651T0CZmQpUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKe6F1fjLbJNFrLny9J5xQHZPyAXy6qLfxPKP1BNHQNFnYlvK4Ic8VfOu9BBXkjeFgz4RqvRxHwGVB9gWWm2j9TpxrfwQEXRIyfFWB5/4/MTvmBXug0A9Sye8AGxMd/xQ5OmEntIufOYezyYd6jUCKsF1o3uYoyUDcWPEDli3Zh46B4GGGDKYYlRuiMyFM1+p4PDaBBRhyCJw6CTa8Sq5n085tq/5V9Ubn/QnLSm0BgXnOcWhC3XMQ+weG5Y/1U68wXHR1KdQpHpQ9XpzqwVONh+6X+cE+3VCo2g39C5rAv3jI1fKnyIMHxY1fcXRLiXRsWfCY5lR7iavA589yarYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX8V4+u3EsAJbStITWzswPVE23pfTomwmiRAJcDmu/g=;
 b=R5u7Ew9f8scikvOU2Ns59desO9rPiX2B8Y0iyu2muxw54WE/2aSZ2XZrOzG99Yt1lZbbHFviXg6Bw5BZHNnCSPRsO0i/VwYtE/itikFsF6hOnidw0WajMXdhv3oePhK4Luwo/V19/TN3JJ+i1NgdOLNjQ1n1dGE2edpEq7gowYovH+3c3q/SC0HfQUl7Q6N1Dd9qftP50+xLJETptaSQIsuTpu3MPMS2aJzm2tXWnpm6rxgw5SGpm3nVLuec+3s/hlxeLC5Dl7LOkBOSOWBJWIXouIVpBXBN+78xKvnhwFsbYepGP1xIJCjopUwfdWY2p4aXkb2N4TgFBZHzHU72dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a9bf3aa-5f91-a81a-813d-f50ad01ef3de@suse.com>
Date: Thu, 2 Dec 2021 09:47:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/4] VT-d: replace flush_all_cache()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Kevin Tian <kevin.tian@intel.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <8a8dd03a-5447-bc45-1554-50fb5b6c075c@suse.com>
 <a6489b9f-6f93-94d9-549f-07fc761a4830@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a6489b9f-6f93-94d9-549f-07fc761a4830@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc3c0d4c-7304-4295-ad99-08d9b57062b4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70876A1603690B4B6FB15FD3B3699@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hwsn9FeOqvIrpaN4mOR2S7TsOzgywi2WH8rp/tyZLfbHHu0mao2eN2sO7SudkW1KJDo2RbqS0ygY71csbEZUd3WBGxiV3+++U1jgKyyWSyT9jF3u/dJ7gwWXWEtYGYBWtT9ac9NzUeYX9lK4/FmfPEx+nGtmOniggTWxMrNBVRbsmKr1Q5hVjOJ3CumaP9njDlJqJCHTKgSwp4oIYCS7DN2Yag5nibdRYAxPpRuBMWXdCnSBdjPM0A5n9qxcvreiTgv+QC+RVJsoZup5oUb3qQi8s2OZ3TqEpUKwjZ1PeoRHe36ZoBbW6+sN8B4cLaP51M1NQxnzT+iD8tiiXEx0ySyPW5JL29qCekHjJw7ptrHhwZOun1KPRynd2dB/Bav+V32e4dUMFHmcItDV/6hDfBhOHFjkSdRxAktTc0Uk2e2KhmXMbUlg5V+6HTgxgyATrrrbf6Dgsmq1aet5pEeNK/CRNcAiiMeu6F/jjbyOTrXSS54M1c9egOPXQMS90lbcUGsJMMiwF4vN2yIWr2YhqfAjPD2Ilcqo+CMQpwIn3ilKFf8pIs6GwZHFNaHoPHjMnLJ43FvoqPIw8+Mcq4KfufXfeWdBm4JKkl2AQkua8QsTLeEnaDVd3mq1TBeJ+sVYt4ev1YbcpMscDslD9ar2kHAcQ3YO4+FuXCwM04xCpcu8ix/VthXTR13J8I6iDq1f926L5Hz3UHXh5kL68ASJWic8qU1n765g2C4axF3u5L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(16576012)(316002)(5660300002)(4326008)(53546011)(2906002)(36756003)(86362001)(38100700002)(4744005)(66946007)(66556008)(54906003)(31696002)(110136005)(31686004)(66476007)(26005)(956004)(2616005)(186003)(508600001)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtjTDNrYXdVVGFuYTVqbjJWdWxEUEdRVFNDa1E4OWRzVnM2NmxCSE50OUI5?=
 =?utf-8?B?ZWRGN1Z0YlZEdWJaRUxvTC9CcmoyWTE3MmZJV3JRY2Vob2Y2dnQzWW1WV29G?=
 =?utf-8?B?QkVUNHFmS09EYzMvV3dQZWRxdk5FWHBObUVaT1U5TTJwamtHNUVrd3pXWWYz?=
 =?utf-8?B?UDRyNjl0Snhud1B3eFNuYVJxcUFVdi9SZTQwSlpBTEVWbTBaVDJva1o3R1A5?=
 =?utf-8?B?RWQwZWFhV0pic1JVbDJqNHd3K3RnTUVtaDIwZ3pBZGFPTjBJeTdZMHhNb1ZG?=
 =?utf-8?B?U1J3MlFjVXp5dVBKbHAzRGhzcUVXZE5nVXRpV1dmRVlnTHZPaUxoS0xNR1pR?=
 =?utf-8?B?MXl1cjhnZktvSER2TVRlN0wvY3BPOTNLR0JtSzVoZkg3VXFoSlc5b0cwQUh5?=
 =?utf-8?B?MjlUTVgzZ2lqdGhlTFUvcnhuSmZDbVdDeGVTTU9LZG1Td0xPTUlMcjlveGQv?=
 =?utf-8?B?MlhlUWxweGJCb2tlcGxpNmpIUit1cFk5bEdjcXdvcFBuYUFnVE05b2w0aGJP?=
 =?utf-8?B?UkhlNDZNSzZrajdDNDBMMG5hWmlYYVlIaTdWa3NVNzN0ejlQVWJ1dzZDVDhR?=
 =?utf-8?B?bk9ud21mSnl1VXZHNnl1SWFDUmFOZnpPS1VtVzlFTW1qNnpiSUlrSStKclg4?=
 =?utf-8?B?UjJtd2kzekV0akdPTStEZkY4SXVEYU9WY2lZMEQyRkJKM1VsK0o1cittTnNF?=
 =?utf-8?B?dEhhMFdveUJPazFLK3A0TTA5Ymdad2k0S0VJc1JybVJwVW5kdlFPTXpnSzVI?=
 =?utf-8?B?RFVDYTdvQU53cHRUQi9HUWVFOWUzZ2xwdjl4ZWNzKzlGTUsvRmJTZ2p5SkFX?=
 =?utf-8?B?THZCSUE2RUp2QUNtUkd0SG50Q0V4UXpOQXhmSURFRy9aVW9tL1diS3kzSDI2?=
 =?utf-8?B?NkZoVTZ5T2NNRkIwMVAybVdYeVNibG03cjV6R3B2Y3U2NDNKUFN2RzE2SWhU?=
 =?utf-8?B?ZkJoeEw1RlgzMDlPNnp5RGU3a3BxQ1pBckZCS0ZJcXRFVlZNMEtWUmVETzhi?=
 =?utf-8?B?M0lGZ0E3K1JBL1IydHNuVkNKWi8xenFlRVFWajY3NUk5YkU5VVFxSmhkRmIy?=
 =?utf-8?B?aHNzSENxaW9QV3R4NGFYT29kRk1JSGlXbmRBOHhFQkZZWTV6NHBnYTB4U3Nk?=
 =?utf-8?B?dmZ1NkxzNEpET2JBOGliS0ZkNlphQ2xzWjVmcCtCQUp2MTRDcUdWZXZESllq?=
 =?utf-8?B?MGNLdnVSNHlJYmZiUGxyMG5uazU0bmVHWERTNUxPRjNId1RwbUZNNVRvZEdp?=
 =?utf-8?B?QUZleU5wOTgxRGpDTmZZV3lkMWtEdWVvQURBb25vamdoM2JhWHpXVWFNb0hB?=
 =?utf-8?B?WTNYd0NrQ2VVY3IxRUMxYjBTTWJqendSSGk5OVBraXduR1lDNzAxU0dyQmtU?=
 =?utf-8?B?ejMwSU1UNTFwZzdBVGs0UTYzMGhjcUs4ZG1tVDl2bUQ0allkTjk5N2tobFd0?=
 =?utf-8?B?UUNyUFZIa3ZGYXFwKzVtcTRiYitmN0VqUTFjN29Fb3k1RXpSM2xLbkh2cmRC?=
 =?utf-8?B?QnFDQTJuYlRpOWxWVWFPZjFWc3pzZU5zUWN0M0RzQk9QekQ1N3ppWEpTbWFY?=
 =?utf-8?B?dFp1WU90T0hqaTVOL09PQ3hBdTBMa2JDVFBqQWZJeVhTWVIvbWR4OXZpQUc3?=
 =?utf-8?B?QjYyVVpZMUs0ZUMyUGF3U0FOSEhucWtJT2diMDZ1elIxY1NKVlNpelN5cjdi?=
 =?utf-8?B?aEJIemNlblpxMW1MNXlTT1lKOXJkL0RhNVhVSmIrM2VGWmhBSFZBTXBsV3Vs?=
 =?utf-8?B?bnFibjFSemY1bWw3THZsVUVOQTg2cWlwTVJYLzVncXoxb01yOU1TQm84WEQ3?=
 =?utf-8?B?eUNmSGhsUkpTOTBSSHBkOVJCVEVZNnhlMGcxZVlhRXdEa2hqdmo4N21QRVgz?=
 =?utf-8?B?QXlaRW92UEk3NE8vellnWVQ2Q2MwQmcwa2VtdHVyV21OR1lQTHQ1YnA5TW80?=
 =?utf-8?B?YlNoZnlFWEtmSDlXQ3lucDdJSFNaSnpBbG4xdVVoZWg1VnZvZzMrRmVHcXFG?=
 =?utf-8?B?eldTYXhTVm9Vb0FQL2xWbDBTdUU5NXIydzhucXRGcGlxTmV1OTE3bjZUUi8r?=
 =?utf-8?B?SzBHWTZ4NWxYRWdkYmF5ODBXczcwRlRoNi94YjM3R1NrR3VFN2dFd3h1dkV4?=
 =?utf-8?B?aDd6ZUFxUjNXaU4ydmJkZXBBSW0vaUwvVGZZU1kwMjh3WFY1SitGNEVRckND?=
 =?utf-8?Q?Ana548OdrsZIVxzQLyXrvF4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3c0d4c-7304-4295-ad99-08d9b57062b4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 08:47:34.7677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BX/CTkbpNeien6eABGGLxst/zhWs1vs8sU0MxTV9+PyZF460hJjIi4amdRAyEHygMdRPUe2bem//mzhdbUjEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 01.12.2021 14:02, Andrew Cooper wrote:
> On 01/12/2021 09:41, Jan Beulich wrote:
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -591,7 +591,8 @@ static int __must_check iommu_flush_all(
>>      bool_t flush_dev_iotlb;
>>      int rc = 0;
>>  
>> -    flush_all_cache();
>> +    flush_local(FLUSH_CACHE);
> 
> While I agree that the conversion is an improvement, the logic still
> looks totally bogus.
> 
> I can believe that it might have been a stopgap to fix problems before
> we identified the need for sync_cache() for non-coherent IOMMUs, but
> there's no need I can spot for any WBINVDs on any of these paths.
> 
> I'm fairly sure this should just be dropped, and Xen will get faster as
> a result.

Kevin, thoughts? I have to admit I'm hesitant to remove such code, when
there's no clear indication why it's there. I'm also not sure how much
of a win the dropping would be, considering the places where this
function gets called from.

Jan


