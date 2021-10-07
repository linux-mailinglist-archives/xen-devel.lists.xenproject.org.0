Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21C4254D8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203614.358762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTrx-0001SO-2B; Thu, 07 Oct 2021 13:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203614.358762; Thu, 07 Oct 2021 13:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTrw-0001Q3-V0; Thu, 07 Oct 2021 13:55:32 +0000
Received: by outflank-mailman (input) for mailman id 203614;
 Thu, 07 Oct 2021 13:55:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qfpx=O3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYTrv-0001Px-8H
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:55:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b299264-2776-11ec-bfd3-12813bfff9fa;
 Thu, 07 Oct 2021 13:55:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-FpFaHU-mNdS7FEReOOdc7g-1; Thu, 07 Oct 2021 15:55:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 13:55:25 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 13:55:25 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.16 via Frontend Transport; Thu, 7 Oct 2021 13:55:24 +0000
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
X-Inumbo-ID: 3b299264-2776-11ec-bfd3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633614929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxjmdxmbnrQDxbOkItSr5gx3PX5yYxKewKipBY8RKaE=;
	b=Vz8sWQFM9N6GddEFMBj/ElPqjbj5W6fbaJDbLRk/lZQrkvv8LunkE1jK9XVc9BKYWxJ4eo
	1abKWdFyNmj61eoBodVKYe9OdtQ/qv2xOLXfZXLzzV6uTPb2+3NITugh4Mwdb+DDoUrvyz
	19J3afj/0lO1naNRe1S4xx8Sc3wKNkk=
X-MC-Unique: FpFaHU-mNdS7FEReOOdc7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrf/Z66JGgGZPCLa3pJ+6lbTYBocG41QxgfBR9mYnFFn6/dgGlkcaWEkINyTEUk8I5wWFoSbztuG5NZf95luBBi8Kfq85CbNCF/uLQD6rV4wNLQYUPK5d9+QvQiY7B1qBLUQogIzqw89wYOL+RKxcG6Qc+5QF8cIZzb4DK82F+nWRYOdl4NvzEFN/7G72DwKPuk2wy/4/lo8l358towaOKVZ9l/MAImkoufpQQGWGq9/+ssAvOQB9FjOQfZEWApJmS+//gaSYTkAKxpocW9INzibP1qFaUiQcFJGAJbanDgIHBAE23DDP0bv9rXNaN3hXCv+i2L5TkxOm9xITmkb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxjmdxmbnrQDxbOkItSr5gx3PX5yYxKewKipBY8RKaE=;
 b=IwNHhpFpxY7/l7eNh/zQQLAPMq7gKXHiHR9Mj9zd3nSByLMCu7eC3wwJXWOJnbB3YdmZ7uWg8rfMjNwsHdEE31JhuxnRbK1vFnqkNvcxc+n4t9cetPVRA7praPMcmJZKgtwqBKR9kRO4NfFTHEUGDWKMqQlphriIi9AcDfFkPwBHFeMaTKHJ1KR9fxT0O1cXl4cmlVeiHaEVd7GOAw/Jsc3RU2WieP9bdbQ5BEv+HDnyqXWdx/4k3DPwmdSeU5sFBeWDIff+PTWMR+oZENDD+D1k6pCE2lUA3vLPoVyz4LsdaoMyu4zWhAD/zz5TJQRC2cYbh82Kjw+CqM/xmmtunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 13/51] build: convert binfile use to if_changed
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-14-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24583a2a-7fe8-14cd-7705-89e031433932@suse.com>
Date: Thu, 7 Oct 2021 15:55:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-14-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7e11f0-f7d4-477e-30c0-08d9899a1d0f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335462E2E57970234430EABB3B19@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0qTpnqtAIRzFbqgfrurcpRJRKHe2Crl9ilIoWqkJhx58Z1B8TOE+nj2qqoocld13UvB59MA/sOncOgO8G+dQOeGP7Rj6KqFBqrv7QNfDEcIRDvkYGlrek+5iXRmIQv9Uczy/zUZOhqvyNfRbG9jp3XPhqFwoP/Cv89lwwNGP7KgQIij/jamSoEsgb8TLbU3RhtSdLFW9G8W0xQ/fJfUHl37j7jpT+cjRQtvHJEjG1qy+fClhyR6cS9wSFbdJtoHppCKGCqESJQWyppNBySq+qQANQQqC++F9i+ceRwJuFktSA9ONpPhJRwx/31F8KrZs8tv4NJG2lRZ8oV6uh3Snj/uiw3mf7tlUCOxclGr1MikBp1qaxBHWdzUuBX5hMePhj+0ibP0uf8ASYU1Abjb81Uen9xM3zLVYMdrmMBeEajujB+BmEVIS1ccNrtUe/DqMe8u/1UkFibt5B9Py1aNtaKdpdOYXd5M+q8Y/C/BlVFCKtCKpha5OpjqaGUpjZqscEuhQY0286GcbaoxXeuZ8FocLKz01Cv7QHlVy5f4JRYtdtGRiNBBjOLxSKbxTBh3TuocyY7bMJoA3YgEMZRIERhwOZD16EZbQpikWQHoRnYYiNluuFCJkPsIQzf1jx5/RCWeXuJgThg01fBKuixz65YyRVxxdzrEFgvV+voK4MbcH5koCYgJR4f5Vesuu/cqxQsq9TlFTkj3czZVDy+8Q8/DbPM4lxsnvbYhfEwFX2bQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(508600001)(5660300002)(6486002)(36756003)(6916009)(53546011)(16576012)(54906003)(316002)(8936002)(8676002)(2906002)(558084003)(31696002)(83380400001)(4326008)(186003)(66476007)(86362001)(7416002)(26005)(66556008)(66946007)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdmZVNUd2VGM0FMSjNFOG9BZVUrRHg4SjMwNENrSkhpU1UwREh6MXlHanVO?=
 =?utf-8?B?aHVYS0U4OWlxWHJSajlEY0p0aHh5aFA5T05VeG9aNVUxaENNVTlNZ2FuYVl6?=
 =?utf-8?B?Q042UjVpTmJiMlk3cUVkNFptYW1xaExBdGNuUVg3NDFIT2tXWVJtWG5sVnNG?=
 =?utf-8?B?Y0JYSGdWZ1BvTzQ1aTR3SWROWUI3M1FtaFZuQWgwcHpGaS9oNFZaMVlERlVJ?=
 =?utf-8?B?a2JmdlBmeGNiV0tKUjdnZStCWi9zK0N2cDkwem5yNUl4UDRmbHM1d2phVzA0?=
 =?utf-8?B?ODM2UUZOaUNxc1N6VGVRbGJ1QW1JbXF3b0ZRWUNjamFPWFRXSy9nL1ZqNUtU?=
 =?utf-8?B?SlB5TmtBMllLQVJzSE1jN2VZclNUTitLTzJaRVk2MFFYZnZRUjhTTXdrK0w4?=
 =?utf-8?B?ZExoc3BhNU9hTzdkdXhuMFl3dllFRmZFTnBmc3I2VFIvc3ZqWDdHWVpBMFR0?=
 =?utf-8?B?UXZMbEYxcEswb0FpT1N0aitzY1V0TEtDUEVDQ3VsL3dOYnBvV21QOU9jN3pU?=
 =?utf-8?B?SWZMM2NRcGRHV3FqNGNMZ1dtT2hWdzI0V2ZNSmlVUjNycjUrZVZ1V3FjWXZp?=
 =?utf-8?B?Y3ErRzRzeVM5MHlUMzZGdW45QUMxTVdxcmN5Rlg3NzdiTkswY29SaFYvUnht?=
 =?utf-8?B?Z21INmVCQ3EvZlA1bVBxSHYwSDcxckQ2SXJZZExYdzR3cEZQNldab29pZlN4?=
 =?utf-8?B?WTRPNitPQ2tJaE9RTVJWWmYxRmJ5d2dNbk13aGRpK3dSZ2pMQzMzcDJwalBy?=
 =?utf-8?B?V2lYcEh1ZmxMdEZ6SWhGcVFYK2lpMmN2TGJsVzdRamtGQVloQ0dTRFRMTU5C?=
 =?utf-8?B?d25JeXFKV0t0Z1ZkdGJEMmlvQTBZMitudnAvSXhTVmVRdWZaQThGaHJpVDVJ?=
 =?utf-8?B?V2tkRlU1RDBkam9OU2pWZHIxdjZFbVk1ZStpQlcvTEFId0lhNGhTblIrK0FI?=
 =?utf-8?B?bHJyVUk3cysySS91TmhNR3B0UEpBMEpmYkZ4aDZ0b2xYN3FjN3BGTXJWTVZn?=
 =?utf-8?B?Ymp6SjQ5RnhXaGtCWEN3cDYrNnlUYzRQOWU4bGduUHBpNGVRRXRCZys3VHVk?=
 =?utf-8?B?VDV5WWJOeGpVN3dDZnFRK1ZiLzYzNXpxWlMrKzFGRUFwbmQ4c0dWVW9RdVc4?=
 =?utf-8?B?WCtEZFZRNEpqVEZHalJMTVNiVDZ2N0J6cjYvMU9ROWo4YkpRWkF6WGU1MHAw?=
 =?utf-8?B?SkZ1U2pEL21ncHBSWWhVZnYxNnh5djhQS3pyRTk3UWQ4aU9QZ0s3RWFXdXZV?=
 =?utf-8?B?NmI5ekVERHJVa3VqNzZMM2xjalBPTVVsYzFyVXZOTmQ2aUVmZkxpd0N1RTdF?=
 =?utf-8?B?NWRqWE84RFNlcWhOLzVYUU41QUZadDBPdUtyb25nVS9Cbys1Zy83UTJZTS9v?=
 =?utf-8?B?RlJKSUhZL0RjY0xRZUFsclA3Z1dyUitWeGNBOTNUZEJLU3lrejdmVXp6RjNz?=
 =?utf-8?B?QjloU1VXNVRlM3hPQUc1VVZWTUN3b2o2dTlEcG1kMnhlcHV5cHZPVVdhU0F4?=
 =?utf-8?B?d1Vva1ZmSmx6K0Qrc29hQ2RVaitmdHRuSjVGdWxPMzJsVXlpSVcvODF6WGVF?=
 =?utf-8?B?YVJzYWpwTjZYdWJsQjJTblhhWTdmekxLdkxkTnIyWXIvMFhhM0ltSDhKZHZs?=
 =?utf-8?B?N2VXSHpncW5mTzdWNjNVZ0k4Y2dmcWlPckN5ekpzcGJoU24wdWJkMEd3VzBZ?=
 =?utf-8?B?WlFnOC9kMFl1dzdhSFpoNW5UbTNqSGRPOExHYVh0UzJFT04zRzEzb0lWUE93?=
 =?utf-8?Q?Iti6jB+qQkrBNQxNa7rhvYKWHPhYa/EtTHpS0Jg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7e11f0-f7d4-477e-30c0-08d9899a1d0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:55:25.6198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pG2UK/TX2t5Zs9p1+SDaYd7AGODPUY5TYaqdR9v+ZSDjYuJemcpUDuRFRiGIZIvEoXMVFr8htytpag/fCDlJxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

On 24.08.2021 12:50, Anthony PERARD wrote:
> This will allow to detect command line changes and allow to regenerate
> the file in that case.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


