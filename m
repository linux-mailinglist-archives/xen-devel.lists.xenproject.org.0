Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06B459057
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 15:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228933.396193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpATR-0007vW-LR; Mon, 22 Nov 2021 14:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228933.396193; Mon, 22 Nov 2021 14:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpATR-0007tD-Hu; Mon, 22 Nov 2021 14:39:13 +0000
Received: by outflank-mailman (input) for mailman id 228933;
 Mon, 22 Nov 2021 14:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpATP-0007Xk-IS
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 14:39:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f48a46df-4ba1-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 15:39:10 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-19tuF2gUMSWbH6YEjNxL0w-1; Mon, 22 Nov 2021 15:39:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 14:39:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 14:39:08 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AM9P193CA0018.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 14:39:07 +0000
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
X-Inumbo-ID: f48a46df-4ba1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637591950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+u3x/rpZAiizQnWagk6O63Y0oLGsfQ2Mro2KJRdj79E=;
	b=YwExNGMpo6C8Hsfhneo6AI7CDRXzb/iRALgrXwEA4FyOrTJdeZ07Sg7XGcNVjYn54VYGTu
	J+gp6Rlz4sq+WauZgIbCE1vyxjs4P+47nkulMSfziLw3e+YqAQI9vZoyyHLbSyiRMkXfjh
	XKbjllyqx4A7g6aCq3KSBgsqsiSP4aQ=
X-MC-Unique: 19tuF2gUMSWbH6YEjNxL0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ/j6RgkXzuOcWQzW+qKX/132SRwTc+usGoLjw9PBn/QwIdIeiH/3wPUN/Sedw7+KsITNZfxatn5qBFqYOKe16GZG9WAuc7CmhwmUQh4DhvVfTht5EBYy4tEV+2OSCrC8JgeXD3zzG6uwBUTccrm9UorO+xSAOtIVFS/n9ko+6Otl+/IaAxe82V1K6gLfKL1MXehqrvjEtaRyOOtkiosgiIxXrczWwvAcOcBevpvMBYxd4APR9Ul8qJ6JHwg898Lbf3dsJCqHYgK++VQ2mBOAujwlOecbVbKsNaV2gmb/Dd1wo9jnjcd3bKZMd6uIfttY0myCa+FoDq1QSAIofOi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+u3x/rpZAiizQnWagk6O63Y0oLGsfQ2Mro2KJRdj79E=;
 b=Xc3ME74PrXxaNMjU+n2kz1nnbtwOrd9Ph5El3WdLjCcdT+qCLxQNyn2of8omYqpKqC+euSrWyBXUwiixhZzvFt/Bq5tZJl9V6JTNd5kcPimQq6/JWaJLaFoXZuUKRXn4VVjMpVH29Yq1gsyO55Rd7XBUsUsDrVvjEKDjVgXZ7pCoPLKyfNWehCj/yRkMEklaAnGutInVgEuNQqlqTlJEKWIg4Dw3257dCDiGBjr3EZrynXR1AXjwLtnTmrHYkW7VoudFISqXwuz+Vx7cwLBrzAiLCrVVNU6wX/Niwj/rcEvg63WjNL1Wa/UCS7nbfSHO3zOe4ffo5+m4eeZo0vnQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0228394-2dfe-717d-e35e-7120621df27f@suse.com>
Date: Mon, 22 Nov 2021 15:39:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] MAINTAINERS: remove Josh from ARINC 653 maintainers
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211122141742.3075-1-stewart.hildebrand@dornerworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2eef1cc8-cb89-4d8b-cdd1-08d9adc5d750
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325CE54E3642555FD4951A1B39F9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+FkOaZ3ACqe9o3aQ0mRici74Q/9VCYasV960zN/4Z5LmojIqu2hW+RynFVGm7ihXcg8MKRt3LZ9GOeqHP6L07tfLzr8GFA/uCFbigi+9nO+jG6fVoEKz2f4MFmcTsPw61vpcO6oMTT/oLOYbCa9ZlNLFqT/Byp84NLFngKv6vvbGWyJurwSZLa8BYkf2KrmhKj8VgcnaR5D2e/Lr0zDQC2h000OJZv9KG7WpqgQm2w3p7og/KShj6ZQqqvDX3+VnVNf1VWncbso3yJIQXOoas/oIvhb8JjUOgRcMC4X40rwmYvBmfFcxqp2A3cCfytLj4y5Tir0TRJjEq6pI1FdlPzAJEM/1iMJLn8qiEC22xlAPPNsnfDwkNGHE1yR/RNeWSwS5mX73Y9ccdggZ3V4tDqhVKVWdhxahFXF1GmsWAGvuRNL/PoTAfVHrO/irPEmqg/0gwo7h5O92v082HyK3Tu8zKQolH/1vl7TAQFCq/PX9ewbY38TIqog20qV0kZ62JFwjYKmzrbbw+vg8er4UTtc7dFbruGbQsYb6GNZk2Q6hkyZ5VlxIu/vfWB/u83H0or2eoedU5Qh6yzsJ3ETf128S/TBxyYQp6QdwOKBVJv5X90Bv2aMEU83FH1RFEWfLIPbuVBOHqSA/mdYKm2hoamX0geZEBByN0jHS6SaRMYpVqHSXsVpdfz54DnaSu4vmmTfakt7/WuhP9O49pFyhOZBpCcmlLhGmPM/+357iFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(5660300002)(8936002)(508600001)(66556008)(31696002)(38100700002)(8676002)(66946007)(53546011)(54906003)(6916009)(4744005)(86362001)(36756003)(2906002)(2616005)(186003)(316002)(83380400001)(66476007)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjdNamlHbEhPR3k2bTE1Mnd0U1ZvZzJDNGovVDM1ODdRUTJlb0ZzV1ZiZGE1?=
 =?utf-8?B?VmhVd0xYdjQyS0F1ZXM0TGF1Q1hraHNrOUpydkpUQnovb2VWcWZXNlgyUzl4?=
 =?utf-8?B?VUg0U3RteHhiU1NnZVhvQ0Q5RFVocU83aHRldlc0cnVoNWZzVzhqdVArVElI?=
 =?utf-8?B?ZUJMeGN2emxYUXFPR2FlUTlCQkZWeVBsTEJyM0NCNlpmYk1RSm1UU3ZDZDZU?=
 =?utf-8?B?bUJGaXRhOHBSZkVoWnExaWp0UDlSMTBsblFaVVFOUUtDL1pxRjZza05QN29i?=
 =?utf-8?B?VHhVTUsrZVlWNGZoWG5hQzNiVC9JQmFPUUw3czFWQkxIdEhpNmtoaGlyL213?=
 =?utf-8?B?akZRK2h3V2ZwYjE5Ly9YVUdGM3l4Mzh4YUQ3N20rOHkyaEVwTjZBb1ZUTVJX?=
 =?utf-8?B?ZEx1MXdBbDFKMnBkZXhmYW1qdTZqTEIvL3dyUWd1QXNWRy8zSmRVVFJUVDg4?=
 =?utf-8?B?R3orQzUwaEtDZkF0U1JydjcrYlJtR0hPT2dJWVFFeXNlRTVyaHdIclBoNURo?=
 =?utf-8?B?TjVQa3lRczFrNUdSNUMxbXppL0NrTyt2NTY2WTdXL1FSeHJXZk1Qa2ZTQTdU?=
 =?utf-8?B?V3N5aFZmWnJBRmYvVndSV3JFR2ZlajlzaklNM0dSdEdWRk84clVSWTY2Nmlh?=
 =?utf-8?B?Qkw3aVQvMS9sakdVNTYvbGdmSG4wTEtxYmZLdFkxSnFyUUJOU0xOZkd5UmFq?=
 =?utf-8?B?QVUwVjl0Nk0xSlFmT1U0WHZlaGZGbGxmM3UxS3MraEJxaU83N1YzRFNKamhX?=
 =?utf-8?B?NWh6QVc5QWVyNTJtT2dEN1BNRkZQSFU1ZnVEVUp3WHJmYmpKQndxVzdHUXpL?=
 =?utf-8?B?ZVZaUC9iZlJNNHZ4cHRwWWxUVVFHTzFxdjI0QzNqd3REZ0VYbUdvY2xSd0NC?=
 =?utf-8?B?bjJkanVqUFA1ZFdDUHF4R2EySXBkc3ZRSjFQM0c3eU9MNy85UjJyVzhCZ3c0?=
 =?utf-8?B?YkN1VDFDcGlWaUJKbEsrWWR1cGFvWElhQzdKMTFHOWxjWHJTL3UybFlkQnhR?=
 =?utf-8?B?Q3huNWlZMnplTWYzbkJaanVxb2o5OS9UVjlLNzQ0eW42QWVwTDhoUmttWDlQ?=
 =?utf-8?B?akVraW1NZWdTSGNORmFZa05xSXR2SEZhVzc3cWROQVpoazB2N1hhcjNpVm84?=
 =?utf-8?B?aytyN0ovRWs1WHNEcW11eC9DZ3hlbmt0aXVKcEZZUlNQMGdtNjZiK05PQi9C?=
 =?utf-8?B?dXIzNldmSnVVbDQzVUs0TnpnRmJrNG9Ba1JzRDNWWENBNzZvSGNONnZ1ZjVW?=
 =?utf-8?B?WTNmQmxPdW5oV3JvYXlwT1VHeWk3Wkc1VFY1MlN1ZmFha3ZUR05KVlE3Skhr?=
 =?utf-8?B?TzlNY3V4dFZEb3hqeVlMa25MSlF6Nis2SjRQNGMxQm5CSUMrYWxKU2dOVWxW?=
 =?utf-8?B?VDRrU2J3VzdkREp1QzlTeHRsUFBVcnk0R1RZOFRvVGNFTTRrUFdFemt3alhQ?=
 =?utf-8?B?SXM3L3dJLzZBV25jSnhZcml5WDlRdEM1d3ZrcVdodW1kWXNHTjhpbGtyenJx?=
 =?utf-8?B?Q01zUkdJampsSHg4bVRJUHRDdHdCN2o4VjA1dmZ2N1lTWkh6MDl5MlVXMU0z?=
 =?utf-8?B?d2JvQ2NXSlVPYmtzSEJuZmFST0ZLd1I2WU9EdUFkUTBXK3dzbFZYOU5mSUkv?=
 =?utf-8?B?S3dLbzJVVWw1UjkrMFA4Q2FFUjNYMnU4b0x1dGw1YThlV1RhbHdQRWZuU0Fo?=
 =?utf-8?B?UXpFNk81UzVHOVRMUE5ibGxPRThzdlNsSzNIRjE0R2c0M1BtM2VkZ0Z0WUhq?=
 =?utf-8?B?NXlDT2o1RDRCWkRhVSsrN204MUlXNDB2QWhtU2U5V3VmTGJaa0NUWC90MEk4?=
 =?utf-8?B?OE9TVG5LT2hweU9UbGxybnBxb2YvOWl3d3BoSkJlcUsxdEsrM0taS20vVWlC?=
 =?utf-8?B?N0N5NmlZVEIvY3hEcHhzanpkQ0RRUzVjN1N4TktFY0dvUmRJNjg4elBhYVZh?=
 =?utf-8?B?bkF5Wlk4cWUwcHJydk9iN1dJQUtRYnFpbm9KWTNJajY5RkI2QnRtbEFYeVBL?=
 =?utf-8?B?T1VUejJBS29xaytkNXBtQ25mSTF3TGxLdVRDalR6RlU5aWlMNWVYZTY5ZFBy?=
 =?utf-8?B?KzJUNGlrUnpIQmVYNHJGK3VZWnYxRjR6NFJrcHJOZGlVb0RHSUZnZEJ0M0Fm?=
 =?utf-8?B?S3pnYkZnWHFHRUcxdlBxdVZFT0tkUWNtcDNrRjRDNUhjVXI5UGYyYkVQL3NN?=
 =?utf-8?B?RDErVjRCRUo1VkZhTDVxNDMxWEQ1a3A4NCtjYWhtcmpRZXd3OEhuWUNNVFY1?=
 =?utf-8?Q?cXG2B1Y0GF0a43XJXJ98x5CgEAtSxhm/ygqiZANml8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eef1cc8-cb89-4d8b-cdd1-08d9adc5d750
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 14:39:08.3374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6pYVffuZlVDOXnfW0deExvvdCxnpxygX66QZ3pYbhvBe+lYIcIOcCmUV3IktTSwN6Ew/x5mGNioKHfn3+ulww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 22.11.2021 15:17, Stewart Hildebrand wrote:
> Josh works at another company now

You don't happen to know his email there, do you? Else if would have been
good to Cc him so he could confirm.

Jan

> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4956db1011..fc8b2c1169 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -221,7 +221,6 @@ F:	xen/include/xen/argo.h
>  F:	xen/common/argo.c
>  
>  ARINC653 SCHEDULER
> -M:	Josh Whitehead <josh.whitehead@dornerworks.com>
>  M:	Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
>  S:	Supported
>  L:	xen-devel@dornerworks.com
> 


