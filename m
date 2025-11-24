Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB7C80F6F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 15:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171163.1496187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXQA-0002Jz-6p; Mon, 24 Nov 2025 14:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171163.1496187; Mon, 24 Nov 2025 14:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNXQA-0002Gv-3c; Mon, 24 Nov 2025 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1171163;
 Mon, 24 Nov 2025 14:20:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9jE=6A=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vNXQ9-00027s-0P
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 14:20:01 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a414bfc1-c940-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 15:19:53 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6125.namprd03.prod.outlook.com (2603:10b6:5:394::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:19:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 14:19:49 +0000
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
X-Inumbo-ID: a414bfc1-c940-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOT8lQK5znWymOGy1kbZiTqVqsxBWG0t1P83dNTEhK45rhkZpJCa0GzUGVfVcMlGk6jnXVt6UN7h4GU4yJOMZ0S2R15OcjRta8vT4Toq8M/GH0iNXC7xHR/M/F7XZbequfwndX7saSOyvMxiDoDdvAJ55NNa7brCvSrO4a7ThilVi3b8dXPyIaqLHFi6tSVtA5HEdLgc/K0lVPUIElBCqC4/vGk3DOyFKrMmi3rylEDpuWVWMYLhbrSkDfaaYF3up9L2WFKREwz1hDBo3k3/JO/zfvE1Y+OLz60pJejg03LnnK1xvgkSR6ERQGOJcico5jcD8T1iKzTJuLdNwx9n5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnpZ3hxL8RiHUbCNBMSio7JIKqnPzE8WMF0NOXWLH5k=;
 b=PRwwRkSi0vnjhgxTwHZ1H0+R3lT2n5DrwposR7P0O5lr0pIRA1Ua7ZCeAYoIU+QdbWoA2Yelc42/VnaJEQGFn6284+dt/zvfJ9JnewruL6T9iT6DkeO9ygJ2EFJsDh+Ku3WovfdqA0aljVf0FYOiErVwZVSUgF/sSv65e5um7mi2wWdaYwPmk6Fkuz3WJoULnFwf01gCa63e0VmUM57K8J7x+BH77Kcs42Dcz6/FTY4sDyUqAWbJb1Z7PKRhVTdrYWWifSjuCM2G/TwImKOVXTPkj1czLyJ2RikEHj6E1g1vi9Jn/yj+O3D7znamJW+6CQfQo06jMZ+QGd1Zc44bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnpZ3hxL8RiHUbCNBMSio7JIKqnPzE8WMF0NOXWLH5k=;
 b=BLZ92C1nV7UGw/Db2Sgc7nt9y7uZn1WolWzxK7Mnr3Bis9bPXuhPTRCuHc32ryFQ5DqKbod1l/3HaDO81hn1V9D0EekqZV5qArdMSV8jolpJA+4ARSgpTcM8Erbam2EkEkWmpy2odINV7OABIFD8KVyXXSoTGVr5y0hr0/nTAX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fe9df7df-3e4e-4fe0-965c-d9d317d629cb@citrix.com>
Date: Mon, 24 Nov 2025 14:19:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] XEN: enable MC/DC coverage for Clang
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <52b0762ac4b5535a842a530365a75bdc81a5fe61.1763981619.git.samaan.dehghan@gmail.com>
 <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: f68e2820-7a0c-43b9-5ad3-08de2b6486ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVJ4dm9OMGtVWjNpUWxPcU9uYUs2aHZsTFNwdGcrTndUcFd2T3IrZjg4OUdi?=
 =?utf-8?B?enB1TDJHQU5jblY2Yjd4QXVTYU4ycnVTWU92WXNWR3B6ZWFPVTl4c0tKaGox?=
 =?utf-8?B?OEpRSUFQQ2Rwc0RMRDhFS3RLZkh4bEFZamhOazFxNzA2THNyUCt4Z096V2Y4?=
 =?utf-8?B?bHp2V0ZtSElhdGdxS1JBb1FuNTM1M09KOWVSZVJCeTJzKzBpcEQvRjhUQzQz?=
 =?utf-8?B?cUk4ZTFWOXFnTkNHNm0wdnRDRmhEbW84WjlsODlNb0NYWnlVVUxZU2ZtanR1?=
 =?utf-8?B?eksvOGtadDNpd3VlZS9sTGZKeE8zSjJGaFVBZkx4YlBjTG1ueUhUa2Y0ZVZP?=
 =?utf-8?B?TXZzY1RMUXFXMm04SnE0cVpTNG5tOTZkUjRCNmo5Z2FrSmZ6L0ZRbzdabURw?=
 =?utf-8?B?NU1OaTU2TWwyTllYWGZWYXRNMXVGY250QlprZEszbmc5WWdZeW9JTWc4UTJ1?=
 =?utf-8?B?VDk4TUkzcFBDME9TUy9jQml1V0RUaFVOeGhaNU9oR3llK3ZXVEZ5REJ0dVgr?=
 =?utf-8?B?U21nZnE1TmhzdVlEUGE2OGxwaHNGVlRCMWVCbUpFdjdyeHQxcVROUVdxSzJt?=
 =?utf-8?B?THBseFJPWE9GbGNia1ZhNFd2SEdXODhocjRTY1VRbm5ia0hQVkJUSVZldEh3?=
 =?utf-8?B?OVd0T2FSUXZzZnJyc0pheDhnMm9WZmFCYm1hdE5Bb3VGTWlCamdWOTI1MHpW?=
 =?utf-8?B?Z1Q1b1dvZkliZVg2WEZGTVRzdWVTYk5qM2Jxa3VkVWU0UEV2OVU5L3hRTm9h?=
 =?utf-8?B?NWpjaTFaTmZBaFd1YWd3M1hKTUZJWC9LU21NekptcG0rMjE1MkhEOHZnQkEx?=
 =?utf-8?B?eW54RnR2UWNtclZpdWo1SnNhVGZrYzNRNFpHdGdrSDcvYStEekRKYlFKbzN4?=
 =?utf-8?B?OFdwczlCQUZpWSsyMlBaU0xUcXJzZVdHOTIvWXJ6V1lJQ0pqTzZzOGgvR3pH?=
 =?utf-8?B?WHFsNkRZbU5IZ0VuTXJCTWR5d2VRUU1ReTgxSzErSWZZU1o3NWRma2xwVmRh?=
 =?utf-8?B?ZFdMZDh6bkFpOXY3ekFBa0d6NjNZeWVvYXdmT2VsOHJpMXhFLzVxTTVwa1BF?=
 =?utf-8?B?MWd6RWdNVGtpWjdtWmpkQkx0ZkxlM3hkRCswWjVSUGM3c0FpS0JKRmwxYVd0?=
 =?utf-8?B?TUVKWlhBd0RqWmdKZ2ZLeFNPN01SWmtsTmlTcDVkUXNUQTFJazQwSE1aTzlG?=
 =?utf-8?B?SGxCV0FQMzhrV0hRTmJiS3RqTG5oUUlhcEd6NjNjZUZGOUJucnNSMkhhSHpR?=
 =?utf-8?B?dExNeStkelVaaTNuY2V5U2JFWE9aQXAwYkgyMGI0eHYxWEJ0VVN4bU03YVF4?=
 =?utf-8?B?QlpWNXZyZlN5bUtEODZqZnQ1VkR1TDhOTXdQR3VNekg5RUM4QUpVdnkyY0VJ?=
 =?utf-8?B?QWVzbU95QXp3VFl6aEFrK09MQlpVWWNKcm1wS3lJSG5OcXYzai9xQzlSdmUz?=
 =?utf-8?B?aEN2aWlLNjRWdEk5RERyckw2d0N5LzNiaTQvOVpMQ0ZQT0VzVTBYRUxqZFht?=
 =?utf-8?B?VDVXNFdYSkt0WitZNGU1TG13c0ZyOHF1M0pDc0tNeXc3U2huaDQ4dlVHb05n?=
 =?utf-8?B?Ymx0Mk5jNlFZREpuREFRb01lbzkxaWU5WFJiWXNOZE5wYkkxalJKR1o2OTNS?=
 =?utf-8?B?ZWEzV0EydWVsNHpzSUszdDQ4ZURHbU43ay9qYmRLak5rRkdaU211d3ZUdEF4?=
 =?utf-8?B?VUFTQnUwVFJRaTZpM1Z5WXNtUW1oRTRXRTI3dDRjNG94bGp3MHNnWkMzV3dZ?=
 =?utf-8?B?bThJMytMZUIwQjlMc0JrOVhQWVN2SWIzZjBGak5ONUd3WFI1cUYzaW1uaGNG?=
 =?utf-8?B?QjRHQ0VNL3FtNWhlSlRyTVhSUUdhUWlZRmR4UzlFZWhWNzc5MVd5VjhSOUFF?=
 =?utf-8?B?eGx0ZHlpc1haMk1OTkpvL0t2bHQ5S3ZmRTVpZUdYWWVsSkUzNERBdkhkZjAz?=
 =?utf-8?Q?g7oJww6bUslA39v34gKcUaCVDBo11y3E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlUvQWpHcHp0MHZQdzdKSkpLbkptMkRoejh6ZmIvRXZzbjNUeVY2aU9TcDkw?=
 =?utf-8?B?NExVNzZaQXNBVE1TWGdTL0VwdGNGUnlsa0FLblFlalhLYkJaMFprUkdoRlF6?=
 =?utf-8?B?bzVZbWZ0STJsVXUzbUsxN2YyM3o0a0wzbzhrRitiN1RLKzBybDJNcmJmanZl?=
 =?utf-8?B?c3Ivd2tSZmFWeUpMZXRYTXNPRUZIRjVjTTgwWll4ZElNZFFEcTNvRVNZY0No?=
 =?utf-8?B?SHRVcE83QlJuSGpHMWFtb3ZDUlB5T2Uva2NZS29oWmljVXNWRWxMamJzVkkx?=
 =?utf-8?B?N3VoejdHVFlIVHIvZ3Bic2cxa0Zad2twYkZFL0M4N3J2MmZGeWZvSUVzUHpY?=
 =?utf-8?B?R1VXelN2cG1FaS9PdVN2RFU1TytlSVB6elVjMEVvRXd6bnNac3RnUFBiVlZq?=
 =?utf-8?B?aG1YSUp5Z0dmMWM4SzYrZURxdE5pR0pOaHBJRXF1NEZOaGRQVHZHTjFsVWNU?=
 =?utf-8?B?VFRMSE1CSnlKRGxmTTRaaDMybXV2N0FteEEvYTRXVUVKTDdORjFiL2ZmTnU0?=
 =?utf-8?B?d3FCUGdqUnlOVGZ2enlZYmZ5blkvZHVCMzkxUTlRbjVqb044UXE0NGpvMGxS?=
 =?utf-8?B?ZjE2N2h0N0QzOUtSV1dzdGxLNTNnajI5V1QrYURUdXNEeUlVaVYrMGZOVTl3?=
 =?utf-8?B?WGY2SkZiUFZsUzUzbzIrQUU2dkVIM3lMVFpWKzdSQ1cyZjFaTm5yTzhsWVM4?=
 =?utf-8?B?emhxcVBnSlMvTjZRanZFWWZLdlNTQUpoVE9kRkR5VytPaE5JbHV6Y2tNajg1?=
 =?utf-8?B?Z0FmbXR4aG8vb3l5Y2VRbytDbHhMWFFCUVVIUFZuUVFFd2trV2tJWlNYVXVD?=
 =?utf-8?B?dnU0cHBhTlFNdUpDYTUvMnFlbWN4Z3ArRU10VHhWc1BNUW1WVnQ4REZmTi9R?=
 =?utf-8?B?MCtCc1hwR0VzdEJTMVJKZExWaVdFMG5aZmpXak43c0RsS3NDeUszRzc4VDZ4?=
 =?utf-8?B?dFNEcExaWFEzTVVidnpuc2g3UXhPZ2xXdUIzamg5bE5TNWhpKzMzT25CYXVK?=
 =?utf-8?B?TGF0Mkxia1VRVy92bmUzUlFuZEY0eUVzVW5QL2U2YVAwVXJkV2RFdWRzS09j?=
 =?utf-8?B?WTRGREU1RHc1V1FlMzdWV2xLVC9sRy9LK1dZUUwzNnlDb3hpcnRQSXNNakdN?=
 =?utf-8?B?aXJVYWQweTNvdEFsTzVTcXdlQ1RQMlpZOVp3VGF0VXE0cHd2TzZzZmF4ZjlY?=
 =?utf-8?B?SGRJTG44YjQ1YzJ3alVUMWtJNlV1TlpGS3NHcldaMGlQbCtSYmRoR1FFbFho?=
 =?utf-8?B?eW1kWlkzcVF5akhjT2EyczZpRWdlYVVYV1NYbVJGQ2s1THgrMC9BenBkY3pL?=
 =?utf-8?B?QUFDeFo2V1g1NXJzNHhkNkRvNk5hZjNYakwxbGVlbHdxRW5TWWFlN3ZnZW1a?=
 =?utf-8?B?OFNIdWNOU0lYOEJvWnE3VDNMaHVpTm9DU2x3QlZaWHIyYmRJNm94N2FPMHBw?=
 =?utf-8?B?NythVHZVV0Q3WTdidE9ZWGdDbEpuWDVtQ1gydXVFWFplcVExZHEzRG0vRldn?=
 =?utf-8?B?OEh5T1hoY2xURFpkTWQ5RnBNUmJ3MC9QWFJ4YVdCelBZTUxBUUNKci9wOUNS?=
 =?utf-8?B?RWt0TDlyU3g3TGFVVDU0Y0l1MWxvNHlJd2M2aHlXekZTTG5NcWpYUXo0MzV6?=
 =?utf-8?B?bWZibEkwVFJJbE5WVUlHK0RBaHFJQXRRRzdObTFPMCtrbEFSMjNFSTlLVGt5?=
 =?utf-8?B?bnVUY0VoNEhoR3BMcWNzWEpxTXRqUDd3cEI1ZnV0VkNGNnBaczRJNHhoZDJO?=
 =?utf-8?B?WURKK212YU1DUm85VWt0ZkRubks2dThXcmdPTlJWcXVuSU5sQi9QTGo3dU9z?=
 =?utf-8?B?SG5pNjcxN3R2dTNlSnFKQ2g5c2ZnSXErNFhsUjExM2UwajRlME1ad2hVTjZL?=
 =?utf-8?B?RWdiUmFwenNaZ3BtQ1IrL1c5MGVpUi9Gc3BOVTAyNkVCVFJXbVUyZGxjd1Vi?=
 =?utf-8?B?T0NOZ0tXUHpvanlIUlA3SmJjUHR2SkZsWXd6RTgzRUEzTmlTL0RSUWhMRGtZ?=
 =?utf-8?B?SFVtbHpNKzdlbkVaT0Z0d2M5cmJ2N3pVWUlMN0lOR1VVblAwY0VJL054Zllr?=
 =?utf-8?B?VWVxVVdmbjQ0VUl5bzBwSnJINFExNThjZFZ3MkVMUHE5c21CS2VuNGZqMDhz?=
 =?utf-8?B?L0loaWt0T1RQWHZLRFZBRFpnUVRxYTRrQWFOWXE2MjF4QUsyQlIrVUZSQkla?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68e2820-7a0c-43b9-5ad3-08de2b6486ae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:19:49.1146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfLlrqUYLNPhArFqVk5SSbPbJU6TMlmWhb0oIbcjVBZsCIPUVB8Jrw893N8BPhQZw4hi/CU0wz0eW4rB7RfPMVIb+J6tkdoNzd3d0U/s2Y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6125

On 24/11/2025 1:17 pm, Saman Dehghan wrote:
> diff --git a/xen/Kconfig b/xen/Kconfig
> index a5e5af3b76..8f2cc111cd 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -51,9 +51,14 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>  
> -# Compiler supports -fcondition-coverage aka MC/DC
> +# Compiler supports Modified Condition/Decision Coverage (MC/DC).

Ah sorry, I only meant for this line.  Enough for someone to usefully
google.

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can trim this down on commit if you're happy.

~Andrew

> +# MC/DC is a rigorous code coverage metric that requires every condition
> +# within a decision (boolean expression) to be shown to independently
> +# influence the decision's final outcome.
> +#
> +# Minimum toolchain baseline: GCC >= 14, or Clang >= 18.
>  config CC_HAS_MCDC
> -	def_bool $(cc-option,-fcondition-coverage)
> +	def_bool $(cc-option,-fcondition-coverage) || $(cc-option,-fprofile-instr-generate -fcoverage-mapping -fcoverage-mcdc)
>  
>  # Set code alignment.
>  #
>

