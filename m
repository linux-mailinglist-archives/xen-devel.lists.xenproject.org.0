Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED2758138
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565391.883517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmsY-0003uX-HS; Tue, 18 Jul 2023 15:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565391.883517; Tue, 18 Jul 2023 15:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmsY-0003ru-Ei; Tue, 18 Jul 2023 15:44:46 +0000
Received: by outflank-mailman (input) for mailman id 565391;
 Tue, 18 Jul 2023 15:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLmsX-0003ro-NU
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:44:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 044cd50b-2582-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 17:44:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6926.eurprd04.prod.outlook.com (2603:10a6:803:133::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:44:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:44:38 +0000
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
X-Inumbo-ID: 044cd50b-2582-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdClAfQpOjMEsnKOx3exPirF2iToKsXhyktDB0JKTmn1zq7dB3Y9VFo4dtAzav9JQXJdoUQx6M9GwZ8aAjVXyaEhzwBXrAmt45w08xt99AJ0I9wcamfPKHAHhSJUmzLg0gXzmREsLaPhtTJiJp5fCjGYttH5ciVm2JSQGLrkWDxTT9vXFx3RqnSCzwqrq7r7bBi1Oip/b7RQ2g/Gfi6RavaSl7CRrY9vX63GUwN0PrlAEc6nN8WHqxTcmRBOP6r0g2qHUYQo9b6Dtpf3LxfTCYUWCbFicqIVsC+hBbIpOP7Fh0314WsWzri95Kdtf0arwEOfFltYfbmZEUTRWTPYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg+U82te4owhA37143CmEc1VKbXPdPq1F16CZLcnFRU=;
 b=Tjgzj1zRPruq8BJlVafKxMpB3J0Ps5NwHWKcD6zor7LYQGqim5ix7LsGa5Q7V75WsNSznSD2mYfPmfzB2CMJTGXA42tgFavwgw920KJ5MVmITIRYFrbm/vg5m4wzyNa5oGq1xbiDas97VqT1vuJIORQ75Kaus2KCMU634F1ZDEzxGoSrVB53c3NOP6rBH2c5tcxaOJhirzAVXd9RY779QNegGYvtNB1z54Rk43/DZ9PjrKxuO88d92LA8sK8Cf6sRlDV9dGF+VWvYX4fGw5TrZl4bkLZ46GQYcciEM5RkNydCBlN2DkCXZZB55jvTIwEBltq5Kk1b4HRS0HceRIHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg+U82te4owhA37143CmEc1VKbXPdPq1F16CZLcnFRU=;
 b=CLYEko9CVX3K1p1IZebKJgJTGkDq7zurUgzrQV0SRODkQoRkGKMRHJqZwHOJKDxQmOSgSgYgFY6Bm45TlO9YMY+gWsz0LMQmOZTmd63ZUF2f1snU38ghRAIDf90y3DqKa7diOX6000zRKOaJPrVLDM45H0u3n0fnHVqtjgc2s3U0uz43yiK1IgUzx3p0EprqBp8WhtqnzXGvUjv7wTMVL3FcHw2YByYxUA3Rcr+QrGfsTLGkG7yX9VcknUT8XM2YzBPo4GEuWdJocSfvk2APbvEHGUqZhPzshzDQpO9P/XSCZXlGEDVrZ3aduh5bMTZPeP4trAWE4XOwGCm+pNwWSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a451799f-79a3-b754-b48c-54aec49ef406@suse.com>
Date: Tue, 18 Jul 2023 17:44:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] x86/ioapic: add a raw field to RTE struct
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230718124334.36548-1-roger.pau@citrix.com>
 <20230718124334.36548-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230718124334.36548-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e46828-57fc-4fc1-e0ac-08db87a5e530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KyrEDcZ0OzdnkRR4Og0+0RXAHgTM/PeGDLUf4bW3E+TsK8YENRzgUeH8QqUjtrZ/TqtymjI82YbQOxMjDEaQTjvH9VEYoHLhAmtKIxMmZMroX7AhiTuc3g7Pz9Cy2XOjxs/RpvvQhj4r8La6NbfRe3VxNO9kOlvLtBerrNtxdD+iPHclFo63qHeFoWpTrDcYqeld/zZSaEAbBZf8SXPWhhQ/OeyQgUgKeEl6/gV0o4NtcoDIYIM/2lv8+Urptw69Ba6Ia8QrGcqujQYD4h44gwOMXONCl/v/RqakOdyk8o+DEIriL3ebTE5B4BzmWLOOF0Rdie5Cs8d1KOAVC+z9u7670CzMpv+rDZVEFWpkf+TA7oFh4fsT9ZYlXdIbtnUZ31mjb3hkuPXj8N2KuEjVlVYk9xkHJP0XZl3uaptw+Z6ZiJulL4ic+nhlunJfQqY/tAY1WxNoVyoPuPAPk2np6ZkF1oOsvnH3d8Vf1Yxe/YwwGyCYguOGD6DFN7hzSnE908dT0N3M1xuOE+oWTP/uppI9TnZLqPSApZRjwgN9elJXuZ5gd2AO/u2b3RFFezeQnd3Pou0FfJFG8M5TjrLni5lCgnG1c5rBr+UNi+tiBVa3++R8lHP1fpMy3AK2dKx+INu5UDl84y3dYwqMZzkisQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199021)(31686004)(6486002)(54906003)(478600001)(2616005)(83380400001)(31696002)(86362001)(4744005)(2906002)(186003)(6506007)(53546011)(6512007)(26005)(38100700002)(66476007)(66556008)(41300700001)(4326008)(316002)(6916009)(66946007)(8676002)(36756003)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnU5OFMwcVBZRklORW52cExYQTIrY3hkNHNLTlUxS085QzZhemxsM1A5V09Y?=
 =?utf-8?B?eUlONjNiNTVaazFSeDg5RlZ3RDFHY1NiUUkrMzFkRWRJSjlJbS9LV3NrZXJ5?=
 =?utf-8?B?Zmp0UGpqbzlPdkxHZTVqek9pU1ZlS3dtMnBhUlQ3N0h6QkNaZWFDOFdPV2FJ?=
 =?utf-8?B?UWVURGNVZzcwTEU1bW92TDNsTkwyVzEzemd4cnFUdUIvb2N0SWk5VFk0MzdF?=
 =?utf-8?B?RnZjVjAwRDdBT08wa1JWbTJPOGxlWTIwYlphaC9taVd3S29MTmE4MXkwVXlq?=
 =?utf-8?B?dHpORGR3WTBmeE5YTU4zaW15K2szOU9vbWJIVnBVbElTYWpveS9xQ2FtZ1FS?=
 =?utf-8?B?QW1sZE9ZckY5Qkpud3BsZlhMb2tMVkRZbFZCMHVHdmI2azR1akZZWG9RZXI5?=
 =?utf-8?B?a0JydEwxZG80Y3Irb29QajNHdGVSczg2UVZVUHFBWll4NjM0M1c4M2dsS3Fy?=
 =?utf-8?B?V3FONWVaLzFHbnVXZmduWVRxWVE3T3VjVDJ1TkNRMXBJUENhZ3dDWHVGV0hP?=
 =?utf-8?B?cnFlenFTOUI1UDN4c1ZWUTZGOXdlWmg0eDZOT0NzQ1g1a3k1WVgzYW4vbW1l?=
 =?utf-8?B?NFFGTFFuV3R2WDhNMjA1bnF5d3JlaklnT050Y3VlT1JzaDNybDlYS01WcVBl?=
 =?utf-8?B?THNDSkZMUDlHQVdyVUV0VDZJT1p6OSsySGE1cW9BSkcwZ2Vva2hEcFducUMy?=
 =?utf-8?B?b3FoYlZ0d2VoeUZqbHR6em9aZktpN0xVdzBhbDRtNk9kTDdUOVVkYVgwdmxC?=
 =?utf-8?B?dHJWUXZ3bENlT3B3NU5nYkc4OGpnMGdMcUhIZHJVYUVSb2x5SktFMW9KWkNy?=
 =?utf-8?B?U1Nwclc5bkIzV1NiTk9CVFFBMkp6Z1d0T3RHQ0pJb3F6SEw0c3JhT1RzOFFy?=
 =?utf-8?B?SERLWGZKeVZBbWtBV1lHbSs1QzU3RnRGWlJIYzZ4YmtyVlhKK1lYbzZrTzJh?=
 =?utf-8?B?eG5GOXV1cno3dngrbEhnM0R3Qk9YSFplNlBKZ3c0UDlGVXRRWFJxNmVlZmdy?=
 =?utf-8?B?aVpWRTFQRTRvYmlqczR6aGd6VDl5SFRTbytEMXRuNkJiYUdJd2NLQ0F2ZEhV?=
 =?utf-8?B?NlloYXpiclFJY3ZLTWRJOE5FUVE3MGRpdStqeUNkalVOSExSMHUxcEkvaVZY?=
 =?utf-8?B?ZW96SUkzVFpLSTMvbzl1NFhXSkJLU1FqM2RMeUhBeXRQV2hmUzU1dFhWU3l2?=
 =?utf-8?B?MVR6TEl1Y1hpSUlYYXM5VUt0Um8xRysvVHc0TDBmU0lXWHF1dU16eDNRakIz?=
 =?utf-8?B?M29WdzRpNEkrTEJqakw5WU9YeXh2M0MraHRLcW1UKzZrdVVETTlZRzhUemhY?=
 =?utf-8?B?cjg1STl3V0J5RFZwbkF0TngwTzlpUjVUeUJ6ck5MU093ZkdGNzBScThBaFho?=
 =?utf-8?B?YVhBUmhsUnJoWmUvZHgrVlJUMVB3aThNRi9PeXVLT2U5TEJISVRmOWphSlVx?=
 =?utf-8?B?M1dDakZFeXZkRm93a2NzdzRMMXBJdTZDVzY5cUdzdzkyMWpyR1ZxT3ZMdDJ5?=
 =?utf-8?B?MUJ6Mzl5cmk4YkhjNXNsRVVGVG82dkl6Ungzc3dKSE1kbVVNb1B2ZmVCU1Nl?=
 =?utf-8?B?N0hSWkt0cG9ucldScDdKN3VWWElnZjJZNFpsSDloZUlyVWttMytTOHJKQko0?=
 =?utf-8?B?b0FERFBFRGVxWlhad09xWlptRm90WTFzUDBxUnlDUmtYa3BWTTQwd08zMDJF?=
 =?utf-8?B?ZjJYcEVEMzMrMnhrZEM0ZHR6OEJjQTJCKzFmU1VpL1BoWjV5U2pBNzR6YlFV?=
 =?utf-8?B?aGVCTm9icWdMbGUyazFsSEpTeUlpVDFGam1PV2oxa08vcU51dEt4c3pGUkhv?=
 =?utf-8?B?STF3TlNjaWNCejJRcXkrNzJFZnFxanA2S0pZemlvbXZZUXJWYmF0OWNqam4w?=
 =?utf-8?B?Y1V2MjNFTnBJTGtld3VFWEtpNDNwdFI5WS9UdzFGcVdmMWRQOUZtb1RWZUhk?=
 =?utf-8?B?QmJDbzUwcWEvYlBKZ25OMVhwbUhYYWZnNjg0Mk83ekl2VEZzV2UyWXdNZHZB?=
 =?utf-8?B?T2I2enRQVjZRb3ZwUWp2Q294SjFXZjFXY0JXU0J6SGRiMWZmQ29oam1aU2Z1?=
 =?utf-8?B?RHRrNXR5RjBBR3Y4eThQOE14eVQ5anVaVkpHSzBxZTRtUG82d2JESzZTaWRq?=
 =?utf-8?Q?PFpjiewn3yN1hS0M3/jAyrxcB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e46828-57fc-4fc1-e0ac-08db87a5e530
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:44:38.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW5qyq7hmuCjqaa+Qlqf3DZvt4sfJv9WpNohzWbCiWo1juyLrXNb8EhtIr6DV0RHishCEGejEk4zqoTeQQCBDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6926

On 18.07.2023 14:43, Roger Pau Monne wrote:
> Further changes will require access to the full RTE as a single value
> in order to pass it to IOMMU interrupt remapping handlers.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

As indicated for v1, I'm fine in principle, so
Acked-by: Jan Beulich <jbeulich@suse.com>
but I don't see this (or really any of the prereq changes) go in ahead
of the actual meat of this series (patch 4 and 5, aiui).

Jan

