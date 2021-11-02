Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF244316F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220352.381597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvYF-0007Ju-QF; Tue, 02 Nov 2021 15:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220352.381597; Tue, 02 Nov 2021 15:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvYF-0007HM-LT; Tue, 02 Nov 2021 15:18:15 +0000
Received: by outflank-mailman (input) for mailman id 220352;
 Tue, 02 Nov 2021 15:18:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhvYD-0007HG-VF
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:18:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17968f44-3bf0-11ec-8558-12813bfff9fa;
 Tue, 02 Nov 2021 15:18:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-7MMqYQNIN0-AwObwqMUDVg-1; Tue, 02 Nov 2021 16:18:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 15:18:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:18:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0027.eurprd06.prod.outlook.com (2603:10a6:203:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 15:18:07 +0000
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
X-Inumbo-ID: 17968f44-3bf0-11ec-8558-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635866291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LJZmEyZGTchnnJQWewf+pr5AzAMgV2/vVn5jvNG3UIg=;
	b=WkL3Ny1GAzgZC6jYreIEWyp6flr+BbCcBu+tNzLD/9SH7XziAMDvm3z9nIfUmbf0ndV1pD
	TIB2929AThoG3hyJpOGzkco+XkAfKDszLJs9cU6Fo2yTcMTebzRXiHUdRNBLMCzPdx6T07
	CrMd51ULCw98wDYS0qAZWQTBpJczF3c=
X-MC-Unique: 7MMqYQNIN0-AwObwqMUDVg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7CVCMbCVmvWcx0dz5e11MFIdplihhTzt1yZxrFgZ+75Dsp8gcLEkK6+CgmTnzJZ3rvK6xIpinf7/xzPP9h9bWl0jsKU1chblaPdHIPCF/rwMbniTV+H2h3Bl9mu4Rh0Dme33sk73637Fuk+qh1BM9WbXuklIpRqZm0Fn+0JlZoGJxIWdKfnw7+wk9t1JDN1RGaDqR3Mz9qMgKWL92+YKsecsAYURx0j5hdSTiUdN2kaN+b9+Uj7aOecu5i8vxhxzYRjecKqNx4SrTyErv06uCHnuoCN9phuid8hjnBiYRwKONaScx9g6IodlooNsFMq537sUccfVTrDRZz9uYboxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJZmEyZGTchnnJQWewf+pr5AzAMgV2/vVn5jvNG3UIg=;
 b=QF0BMmWXLe5xh8Y+gMq4FdR/qL11yIMk6Upevr8F5tobyHxF8zDntlsKjOz/BqmJk4FIlOlaZhAhulFcNcd+DTd0OjoDHFw1UizcMkV2E5mOSr2FoGh4Ym2RxfCx5Bl/XT0pxAY5U39/nevG7luJp2oopUZRWluJVubiksNnRfmq4LUDIUME7xrxuKCNiOF36E2CpQwVQHf16Ub0ffxpi6G5oDuNOJI+SqqoH1VT2r0mLbTobWlfVu7X3V6XGnXGtUryqCAnXPGf9+GP/B2rlC6vMmaPVX0kbzIgJZyYI701SNW0nXNZXTkpPfNLjtbEPov8YoJgE+VGUE53VHh6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8c6b8613-fade-3a94-0585-8eb14d7f33d4@suse.com>
Date: Tue, 2 Nov 2021 16:18:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 5/7] xen/xsm: Switch to byteswap.h
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1634897942.git.lin.liu@citrix.com>
 <400efbc5c394140bb01664e5847046e8c4a38ea2.1634897942.git.lin.liu@citrix.com>
 <037139aa-e274-a0fe-4d2f-10c457650d3e@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <037139aa-e274-a0fe-4d2f-10c457650d3e@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0027.eurprd06.prod.outlook.com
 (2603:10a6:203:68::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe92ebe3-fd0f-4528-3262-08d99e13f98e
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB419101116B82956C3FE023A6B38B9@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aiDGMhSgtuenDzS6Nl1QIkSyeGtIGKbsnaW7CkY/dMJeLZtQT+W37pSdD9qldTIn9ZF9miE9+QWcGQk75rJcaMLDB3j9WQr8KZLagi2Wdc0W23K/+NuKWO0lvmF3GAojzkp5Cn4/ve57//kZTuPmTjLYv8pfULsUYN6zUGmDAJnAMid9X6whNqpzCkwXbq7uktcMzuGP4AUHeb2RQge75+Vq2h0X3xWkcQuo3EQD9ipoaa71SeMJlL4yCP4++NKuLq1FvBLWcbpe2FRrDHt/7elCIuu459rdVainD7BbJR8K9el3vF2yDXYK34PEifvETsi1MJbTuwtRauPvcHWnqeuhsn9ti1EYaJpbax9Z9s6DOdbay8+dTqMZD/yjPM8idmvwIp44ydWIpDr5ICdGukqZnxfGCvVVQZwkAXSalhqY+HJfbBFsmnQi8tUxwxF9zrFZZivWYda8tJY8YY3KednzdFfzAgNoJgDj2B9v8+a5ybzi6pqMS3umX2Cbjd92UYesQW3EMAAo5FJkay066I/91CSDJEStEnN8uuDaVJtwXPuwDKA1sxxATGT8OnizCa9EZPq3NBWdakcP4WDf25h1gEW3JzsnkEPXJycT+yOco7m6qloftz//4fpcqI/BKzqcqzqW5r8DO+IPQT+m9k99Gnj2Mbz4uy6sFSZuq1LKn6P4y7uAi3rQkTuVP3GhuL3BquITMhim5fldtId2MNi5XY+CfP1p0X/6jHXH20y3G2DFfOBjF9Bb/2r20K8B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(508600001)(66946007)(86362001)(316002)(66476007)(66556008)(4744005)(6916009)(5660300002)(53546011)(38100700002)(31686004)(83380400001)(36756003)(16576012)(186003)(26005)(4326008)(31696002)(956004)(2616005)(54906003)(8936002)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmpjaXZVME1XdXdNdjduTWp1Um95YW5sNG5oS1hMVXIwV21ObVdzSUowaWox?=
 =?utf-8?B?UDFBVWo3TG5aNHlPNGlEZFJlZWlPOEZQaHVqVnIzL1JBZTlhbnR4THJmU1R5?=
 =?utf-8?B?Y0lNSXp6WE9FMDZYUGQyWXhxMUo4dHgwWFZuUk1ieXdZK0JJQ2N3bUI5RmF5?=
 =?utf-8?B?Y2Z5M0NEREhhU2wzYWxyWHEvbUtvN1U2RVFCQUpzc3E2R3orZE5sN0J4VTA3?=
 =?utf-8?B?cGl3VzNEMmJGNkpUTzhiNmp4ZTJsVnR2VURTaE5jMjdOaVIvbGRSSnVYOUlM?=
 =?utf-8?B?OUI3UXZpRE9ZMytHeHU0N2xLNjlUQ29BNUVZTW0ya1RhT1NCRUVoUUZMOHl1?=
 =?utf-8?B?MXhsTkx5dU4yYWdURXpiS2IzNlErTE9vemRsZFp2R3YrZVdOU1RsUGxIa1p6?=
 =?utf-8?B?d1Y0Zmt0ZjYrcGc1eWRGc3FnNlNRMGlXZUFkWmRlc2NWbXBac3FETTVvenNF?=
 =?utf-8?B?Q0kwTm01cDVJb0svd1liWm1EeFdOSWZuSjNjbEhZanpvSG1ZL3pmK0xDd0ph?=
 =?utf-8?B?ZHo2UmM4UU80bzFyUDdOZkNWdjhLSVhSSzJBRGg2dlFQVWtWbjA2RDZhZkxH?=
 =?utf-8?B?QWtOTnY3bTN2bXh1Y2E0N2VNenNBOTI2c3Z5QW91cjRnajNaK2t5UFF3cFcr?=
 =?utf-8?B?cVVHaC9VczBuYWYzSkpZR3A1dnFhTnptOEpDb2dQNnNBTVdlc0FVdHZXbElF?=
 =?utf-8?B?amduZFUycDFqdlFJTWIvSTJxb3lLUC9TSWd6eFlqUkM4bnhCTmJUNU8wYkRI?=
 =?utf-8?B?QjBXV1oxTjF1SXI1bFVKVG9Wajc2SkJ2SHdSYmVGWkt0azQ3V21ZN2xESCsx?=
 =?utf-8?B?cU1zeU5XTWV5V1YvVDUwRXhYUGt6S25yZ3AyckpmMVJFTkFuclpsT004NC9h?=
 =?utf-8?B?MWcyY2NacGZDTENBbG1mS2FOMHp2Tk0zZWRsUEEyZ0RxVGlRWk10QjQ1eTh3?=
 =?utf-8?B?ekRQRTBLQ20rOHRuUHkrNEN3Qmo1OHVuanpMWGJhWEp1V01FeEo5aFBXZ1V3?=
 =?utf-8?B?VE1rbEJIenJIWURhU1A3ZFRVNXNkLy9OaE9uSGpEcjZCR3RmYkZxd1phSERB?=
 =?utf-8?B?WXBVRTltd1pxT3hlOElMRDZlWUZBVU53aWduWCtRd2FIay9FVUlwR0FIVlU3?=
 =?utf-8?B?TnJ3SGRVdnZITHBocHh3WGR4aCtiazRiY0VUUnZkNXNtOVhORUN3cXBGVy9O?=
 =?utf-8?B?OVNiTStNRmVNdlRKa1hSUWFiRWl5d2hoWDdXK1VQWkh0UWF5c2U2elZqYk9m?=
 =?utf-8?B?QWRnNUx0dDAxemN5dlIxU3ZYQnRWVGFBMlNBMVdXMDByc3dwRzJPRUplbDhD?=
 =?utf-8?B?NTZMU1Y3enNKTWkwU3lNMkQ5NWtVcE9HOStWNWNhUFJ2bXFWRGVlNVZNS0ZB?=
 =?utf-8?B?RmxuTXJSNGJKQkRHaFB1WkhBTjBVZk5aeHQxMm5zalhXbS81RTNWSEFVZlFJ?=
 =?utf-8?B?R3Rqa1JxdCtzQXZpZGk3YldqLys5ZjZ1NDdpa2p5WGtKTnFydURucTlpSm9k?=
 =?utf-8?B?ckVqVVE5ekg4d3BJVGpMdnJjc3c3ZGpjQU5UQUxLVStEaitMdmVRU1hlTU42?=
 =?utf-8?B?MFBia1hHbm1od2h2ek8wN3ZvaXgvdkJDME1jTmwyNU43ZjJyTUh0TXBpbHFS?=
 =?utf-8?B?azdzTGJ4aFRoeTFHSWdWazFSdVgvT3pxc2VKbkY1SDlxT08zeFJmYWljRjhq?=
 =?utf-8?B?YUxnUkRWZVp2dU9UcnFMMGRhOXZqMDR4M3kyZG1iT3JwOEdJbkwrL244ZWlT?=
 =?utf-8?B?VWZFRDN1NU95T3F4Y0FsMUFGQlBSeitLSEtPWFRPT0Z4YjdEZkdXWlNjWWhN?=
 =?utf-8?B?S3p6M1NGNGUwdy9zN1oweVBQOVFJUHBKdGpnT2dKTGprUWYvYWRHQkRKMkcz?=
 =?utf-8?B?K1BVZWRja3c0NTh6Q3llZUkrMGd3YTVRK3NDZTFtR1FVYUVDSGxYUXJuamV3?=
 =?utf-8?B?c3lUZlBCemJrWjJQbkFjOU1lSkNyZW9pek8vQUJEZmlKaGVZbkVFZEpkbFl6?=
 =?utf-8?B?VUdGcWRYQWU4SCtIOEZFRkJMQ0JkZ2Q1VkZtdm95M2lFT3dyWU5VajhDYXlJ?=
 =?utf-8?B?VXVPbnBXUmpqTXhGd3pxUUFNbmVZQzJUdGlJWFJyd2lUUWpoOUZuWGZUQXQw?=
 =?utf-8?B?Y296ZUpDaXhzN0hTYmgzSTlzdnpJeS9XUUUydFZjQjV0Y3FhWGg2VW1Qaklh?=
 =?utf-8?Q?DzEEEalfUtRbSoU8ptBvp9A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92ebe3-fd0f-4528-3262-08d99e13f98e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:18:08.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uH5QzE5sCYP4kCqZjjt2GqT3KLFXvtwhEpBNQy0VY+14ZFI5cgTPw0zVChZbFdLJDZWgSgli4JMe+OAEuBS1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 22.10.2021 17:46, Daniel P. Smith wrote:
> On 10/22/21 6:47 AM, Lin Liu wrote:
>> Update to use byteswap.h to swap bytes
>>
>> No functional change
>>
>> Signed-off-by: Lin Liu <lin.liu@citrix.com>
> 
> Reviewed by: Daniel P. Smith <dpsmith@apertussolutions.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


