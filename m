Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9971670B
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 17:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541231.843763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41He-0001rh-L3; Tue, 30 May 2023 15:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541231.843763; Tue, 30 May 2023 15:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q41He-0001oM-Hs; Tue, 30 May 2023 15:29:14 +0000
Received: by outflank-mailman (input) for mailman id 541231;
 Tue, 30 May 2023 15:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q41Hd-0001YI-Gu
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 15:29:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba59954d-fefe-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 17:29:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:29:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:29:08 +0000
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
X-Inumbo-ID: ba59954d-fefe-11ed-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gv7WBcWgsVWxa0Gj/kSeuNnqDmUj7J/Qhk14tC02Elq+jqVqgwW5UaNsvo2PfjL877k6elVo/YxoDfWLEW86EU9K86L5IWCysxS6YbvaBObFZrRL5uANqn0MKr5JgPSZusmifZgmpZfW4Qg3tSKfGluWGxP/TyN/ejqjOSATdjBJlSdcmZ0xKF4vTURDK6Eahnqi800ReYJKEZAGqr17H+78tTddAiy94cYG9hxa4dxyIg7+QkuWBqXWK69O/sk+o4oIdBDBkCpKENoavhMmIQgSb1Dn72Kfpimvupnb01f15w6JkZvsM6B1h9zNY+HRlOhdUGISyc3DpUApjat5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Csk19f7zKgjYkgkNipWNOArhMZJoVpmcCMF/R/YGjqw=;
 b=LdTvhKtm8+BsLVxsRI1qttklLYtV59DqsUqMYtlsCSnf5hWYemBMHFYQPGNdfSI2bz0EsOv7LrlCyDlZUnvP8F8NjxgfNsYVcVtXRC1TNPN3tJ+GBLnCS6HfKnX2tR4AGiUNXYyYFjJo+HSbIGUiIl6tS2vQjv7zMuyv/kZd7kkh9iS3ZX6F8vP1jsp6y2nyLlqRupFgLxrkrUgsErc5sRAZoLcVh0fchkeQvYMd/aigqorywKOf6+C/K4ipy45eDtVgldw+WzOqPyOXkgIbBBlYnBpwlcm6sS2pGEb3oAHeif4b2T9BNcjgOq46qSiH94f6jJCFe+Igc4LmhvkKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Csk19f7zKgjYkgkNipWNOArhMZJoVpmcCMF/R/YGjqw=;
 b=jkW+hTt1vVFz9d4smUH0YTiPcSTuo9LSm61NNFUOQEOtKBnkYkx68F9ONpm4gfsAzLVRToRkV9W/bzwg5Tj273IH/9xU9MTJpfrMuSy6S4TQ9pgRfL8Yj9eEVt8slz1TFENw/LT/hEqPVHh0G6QgVF8f9I9UqFaYidB/3O/0BGEMhN4yOa8DagnZ5P29qHe0ePtL8I4HsjKKJ2yMKeCPs3yM6FnFxoyMqu3VI9+wQNzu6lxYieuqOR2qtv+ajm4u2Ji1DlOXNjsD7u2ILJSBFPisP8TcJBit8wm8ZxY2j8Eq2UB9P0QYNLHidyNO0L/EtkIM3lZD4nR/cwamPZewng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd113adc-6d66-5a4f-78ee-766c197ced93@suse.com>
Date: Tue, 30 May 2023 17:29:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/vPIT: account for "counter stopped" time
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d4e9db-af78-4222-db70-08db61229c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vfj9hF+oFKtcQUjIzR6f3/keBqxinbs3JmYjJbA/8VuvxJBqK77XYRICwjoF+ZbF4sXjSfXc4APVNyzn6w/SEXGGp6d4ueggbVe3O/e6LopjP6SkoG1rVlWABXYK7sYm7BMmkqhD3JP0jPiypOVhw1JJZGh+SGhIiGvx+JY7cDFTXgmBnoLEZVD2By36G3HAsXRqdp5UxLgHhz3X8bTk4hlpu5z4hEUyJ6Q2imtllDqgRARaJxYjZGF0nI2qIBTM0pSGuAbRnsd7X/Bu7Z88vmOTNGPmPOz00nP5ZOjfb3V6fVEk1l17F6OZdwQolqA9X1qgDXYSJduy7YjfvM3dvM/G3oZJXr6vfgTa06U2wzQ64lX6KVTWQrGfx+K3Uocg/XaFQ+ugB2GhAvWmBevIo16DptYA49GzUILkRCCn3KkAPvPUx1jkiLizOlzKl6DenQTDMLnHZraCKFT6YweRt1lxsdgmOyaNRlqpbYw+ibq6/F/stC9HxzRgt5YQrJIgT9s5WWJa5yhaMtMTDQX4pkMoQ7yli39D2XoNKQTH/ypSCQMZV4ib2+EG4JQ0jTmzlbGgP268J4Bhak7UkQcaKBfaA5iNxksjp+q7truG0IBiAmGp6B3G8A77svAM9ZzRwSsxtLKor1yJAR1Ff0DARg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(478600001)(6486002)(54906003)(6512007)(6506007)(186003)(26005)(2906002)(15650500001)(6916009)(8676002)(316002)(66556008)(66476007)(8936002)(41300700001)(5660300002)(66946007)(4326008)(38100700002)(31696002)(86362001)(36756003)(558084003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0VwNlgyTWY4NlYyVnBNdXdNNE5Fd1U5Z2dBd3VJaHMreEtmMjA1d09TWlhD?=
 =?utf-8?B?ZGozbGwzUWF2SFBrOGFPc011elhrZU9tSDMxS2pPbkdqbnJscGxvaU5tOHVz?=
 =?utf-8?B?Lzhyekh3RUM2cGNNQ2RTRnQyWmV6S3RiZkxSNUY1MmRiekc3OEZMVWNveUY2?=
 =?utf-8?B?eTJxS3hXZEFLNmxHY29mRndHMGR4b0ZKMUFSaXVRMUpuYTFLQlBraitySkhS?=
 =?utf-8?B?Nk5EVXZVRUZKSlFhT1Y2NlBkSkREa1pIZ0hWblpsc01iOEJNMGx3MmgwYmJW?=
 =?utf-8?B?ek1xYmc3UHlGN1lYeFA4TDJVeEJISWhTTWNJZzBQejlGM0tNTjlqSXVOZklH?=
 =?utf-8?B?QmVMZVRxbVNjeU1NMVVMRjZDK2VvTU8weVVwTXE3OEtUWFJDakhuS1Fka29C?=
 =?utf-8?B?YzFGb01sa29qRFhqZVZrNy9VVzRiRzBVU3FYWkFrenBDYjdOK1R3RndyR2pq?=
 =?utf-8?B?OGlzN0c5NVZVaWRDcXJQUkxONTd3bFpwNHJkcW5mSzdwRDQzamlPZkY4RU41?=
 =?utf-8?B?c2E0bDdnZjI5TWJPWUo4MllNUUNXZHorNGFZbng0QTQvVEtZSzREQzRvSmZa?=
 =?utf-8?B?dUl5YjN3NmxjSURMYk1vU1Rtb29xajFwRnJ4c2xSL3R2TGYvalF0M21nREVR?=
 =?utf-8?B?c0tOMUtUZGVRZkFMdFdxdEtrZDRjWkZlWXFqOTZBK1BhYmZsT3BWeG1LV2Qr?=
 =?utf-8?B?WHdxVlBFcFJqVjBiVGZBWFlacTdvWE5aOFJ0cFE5YmVTTVd1c05xVmJTNWUr?=
 =?utf-8?B?SzhaNjRNbkJDd1ZlUGVaNnByNE9HYXZzOTIxZktzNGowOERvTTBjTXd5VWk4?=
 =?utf-8?B?VVlJeFBPZUlhaFRGUEVzN2F0elByc2lMSkFMWTl4WmEvR0k3ZnJ3dWVLUzNT?=
 =?utf-8?B?NHNBQ2hla1FVdjVibWp2OVBTVUdXaW5JNlBiQTJPbzBxMk45NE5QdzVkTEto?=
 =?utf-8?B?YjlPaXdpQlBVbElFZmxQa2RkZklnbTFNd2dVWHNGcnFiUGJKcDRnVGdBWlJj?=
 =?utf-8?B?dU5jTnRDRHNaTzhOSDZSN2c5aHlBYjFwK2RmUll6OHkwUmFuSFp5ZUpTR2JI?=
 =?utf-8?B?R2svWW5ENkpvRDdjNDl6WStPMlNsMG1pSnFIcFltN2hjVVh6TWZLSG5pZ21X?=
 =?utf-8?B?bEVwQ3l2UjlRLzQ2VjlISE5FNkIxekJJMTRCdmYyZkl3T1FjMWlzc2Y1a25p?=
 =?utf-8?B?ZlhQcStDVjZBei9adVpQcDVGQUpHak8wVTVEOEJmNjdJL2RBcEJqdWh0QjJu?=
 =?utf-8?B?NldVclVLaHVneHhXT0x0bU9jck9QSXpCbUhva2ZFRzBHcTNRWVh0R3I1WDZs?=
 =?utf-8?B?bUd5TGpIQU0rUUNIYnN2NzlTbE9oQUJZRVprT1EwS1F6djl3SllHQUJ1dFht?=
 =?utf-8?B?bUQ3TTM4V0FJc2JLVHpWbng0eUhoWXpnR2ZDQlRwNytMck81cFJWUi9HQXk3?=
 =?utf-8?B?UzZ5SE5sMGN5aDlMSVloQXBJRTN3amJ3Zm54dWwrdlVyVEkvczBoZTZpWERK?=
 =?utf-8?B?RGltYkV0cVRNL2U4NllSbWZRdEVvWEdjYlBqMnpxQ3JrdnY2RGhJNzAwOUVP?=
 =?utf-8?B?TkRVWWJCSGMyVzh1ZHA3bHBnQkVNb3k1cVhaaG1NeWpNVzlmTERvajhsb0xx?=
 =?utf-8?B?eTkxbEtmOGlVWitBdFY0Sk9DZmkrN2l1UU5YOXI3SzZTZjc5dGttcWc2K3d6?=
 =?utf-8?B?cVZrUEtnNENDSi81ZjR6b0d3aWYxcFJRQzZXYlUzei8yUG1kc2VnY0ZUNWtO?=
 =?utf-8?B?SzFKaUhlOXJnYkxaSjRxYUhsZ0Q3ZldhM1BpV1RLZ1djRFNqUEZ4Zjl3Nk9D?=
 =?utf-8?B?MjVJTkRXWHllTmdjbTZQR1BWcTgzc2ZzcmRnTUdrUmcvVmNObVpKSlVNTDJw?=
 =?utf-8?B?KzViaWpGT3J6UUQ0YmRERUU3UDRsUFBNMGlWN2xvQVRndFNXd2lyTFdaMHZH?=
 =?utf-8?B?ZmduczVjT0hSMjlEd3RGUXc4OUpKTm44STZhS1NzUTZ4dDNTekxGZjBMNy9X?=
 =?utf-8?B?VlRhZENVUVIzcENlOWxSZndzQTI5dkkwdkN0dXJtUGxqQmhQVjRIQThVcGlX?=
 =?utf-8?B?Nm1qTUVKZm91NUxSS1Vjcml1OGhuZmhOSmJ3dmo1cFVjNlpKRWRpaFFFOGhP?=
 =?utf-8?Q?KvHhwh0vv4zxES7+1nanTLkxi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d4e9db-af78-4222-db70-08db61229c51
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 15:29:08.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xm5xXZBBWNfIFHexlwj/Y1hzfIrZe1EhDDoPHVgIJQ54tEvE4HYAMiMrjJ7ucQmG2njqF8TBdOI+o1IJgW0Xcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

This addresses an observation made while putting together "x86: detect
PIT aliasing on ports other than 0x4[0-3]".

1: re-order functions
2: account for "counter stopped" time

Jan

