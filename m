Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DC6A4606
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502726.774645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfNj-00076O-Pj; Mon, 27 Feb 2023 15:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502726.774645; Mon, 27 Feb 2023 15:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfNj-00074J-MV; Mon, 27 Feb 2023 15:25:39 +0000
Received: by outflank-mailman (input) for mailman id 502726;
 Mon, 27 Feb 2023 15:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfNi-00074D-JU
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:25:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc569073-b6b2-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:25:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9589.eurprd04.prod.outlook.com (2603:10a6:102:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:25:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:25:36 +0000
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
X-Inumbo-ID: fc569073-b6b2-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9ScSJwsNlZRLG5jbjlPR3I0KF4o73pclXpyVwBekoSqNgC+8CmN9CYYRWqyAGIdTd6EpH6Ntld9+SeleMeCuW3T3SILWx8bBytrCNnjygSylkQcv1Yh+eHevQEY/uqXujIPzX2P/m7MAyHp3p9pZ7KGrqgd1NjqZIBrxVoBrF8ObmwGbqwjhkDyx0NXRQfWY2dwWIjfDn41lBZz9Pt5DucLHBPijeRQNDE43DwThNmsKJmX2uSsRKStDUL6L5dCQ6V093bM+KvLOyAbQlv6HeghuJI0N5vwPdEGcFQWJsgBIFD6h3uTKkgsd3AzhuPhCV+hPhwT6+cFG1e7caDRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5vXTwSreSMlnb91MRRfmR+e3Nq9kvvrXKqilsHyd0M=;
 b=SGmpm+6VyWddq5ANo/ZrZh0UxUYuPVqECn6l9stmWFGlMFmNPWX/QLLv2OpLO5l3OBuStbG4cwK3x0H64Pze6BEFi5JWfZzWHcmGG7PdUfatPVHj/cM/fLnzOuEjL4wuiimxvaHuvJZYjcyDhp6SuEKafxmiXP8Cs0pTuBNwNJf6N6eHoF6VOnBLq70XhMZbc/dyj/PnLdzPJBLJ2cumV/1af2HbxDI1e8lzZU/KLGZR6ECPyNH9OxIJ6wAMeOVb6IwvXfFZ3Fa4+Ci0mJZ3u6w5reRjC747OFRjrr3lZfv2+LkBMOQPUv+POR8wXcsKNjGG0gEa/tpjJjWJra2Ltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5vXTwSreSMlnb91MRRfmR+e3Nq9kvvrXKqilsHyd0M=;
 b=NDqWxa2Dw6u9ugvDYNYqfp0hP5qHpQkfQbpcAubGCnLC7q8JCOR+V507xZ1vGGIjuMueUDJ9J7zmfsbavXsBucSJ0VLIkxuK941HOOc6jJC2ynvFShdjeex7BiACYaE7wQWeWWEn85PtDm6UsuM+2MHN9pXdf3uqBhSazqOJzFC6AGZEclFeV0hKkFkswfe4MSLWCXD8Bu7IeRUws2DwzrvwM9wwfPpHK7sdpbplpNVPt9yS5kOpWUN+p1/yfpQ5HmOU0M/NXXdkvSw4XfRG+otsR7BbknXzPEM+AdOofQpO8w0qpHBVSoYiWkkjnLFsT8kV4LFfBH2EXJ3j8kx9Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c864c3a9-be96-a304-12e9-2015c2f2360b@suse.com>
Date: Mon, 27 Feb 2023 16:25:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230224185010.3692754-11-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 97669d35-d398-4b1e-1a0a-08db18d6dfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8vZondBI12CmNSNN32Xz6TzWM95oA7zebg4QC/03jiZAmzWL7Zvx95n9VK7BVEQ6mQvwvQvsu1m3lG3oiF5Hrp3fI8EJSV1CxwiLoNKNTAAPEMSQVuG1/JNdT9Cda2aLNCpQCUVWlUaqZvxifvWfL8DELdI9uDUiXSQbcA4Vhj/KmtA9iLzhjJqP3kVgbWvMEoG/cT/Y9ZlK6V0qQJYu5ZswXAoWFWG+5iyyfltXMDCF9MfPbipj64Yu0sxXFFp1dOUZtv7z1u+Ei9wZaqrACHWAAQr9f4FQ4IV0hHpnkw814fAmSm1X1uIPa63Krk0Fff0b9SCueeafvKwXLAHwFe/f8cxy9QbsbnrHlr9vksw6uzUS/PeOQyB4kuDTxdG0ofDl/HaFADGMQnYsGeaH7brwuN6YjCmGk9yByhG0DmPvXEMOQfgyrUFpbbVbFdmDf/rld0HKxxOXAkT1XKzMH3AlCr/0/8qY1xvv7G8ChfGJTHPDuhL2NAZDoq8fYz/e0nHbUEcqwUMKqWmAsVBeAacYBuLitTk4R1xUKe1SwwxZzFz3seWBR5ANRKmzt6VOGUe+WsiFV6104jcKzcSEOZJOTsU2XIBwa/RNWWZHsi4X5AXwVkIMx5UCx/Q9qhQsXCtlIxEAxLgVvdJ2FqTOD6tG5F3bQNWOimbEdMW2xXb4FvzQaw55j3FXlrygYazGjmqS+Oxy3b5wAce8Khqq/hij8RJUMO17o32UWboJ0wE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(39860400002)(346002)(136003)(451199018)(36756003)(8936002)(5660300002)(4744005)(41300700001)(53546011)(6506007)(6512007)(38100700002)(186003)(26005)(2616005)(31696002)(86362001)(4326008)(54906003)(66946007)(66476007)(316002)(8676002)(66556008)(6916009)(478600001)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXgrSWRkdmNSRVFBUlF6RFg2YzZScW9YODlDem9qb2xtQkZVOFNpek42Rm1z?=
 =?utf-8?B?cGtlblI0ME5paGdBWXVWdittUHkwOW81bXpjdDFENUIrb3RGb2FHTU1MdHdR?=
 =?utf-8?B?Q0VyYms1U3o2ZkJDWlExbHBZM3dRcHBHMkhTb1Zib3Ezb3V3TlVmRzA5WEpw?=
 =?utf-8?B?WnhDc2VMdVFIOVdsZXRYbldySXNOTlZ3R0lwbS84T0RKbXFmdk1oQlZHNGlX?=
 =?utf-8?B?aXduUU9SQ0RIcjFKdC8rVDRHZkFVZ3RwamxXMDVjVVBtYTVKa2cvZTBzMzBy?=
 =?utf-8?B?YXhMTG01cTNCUWZJYkdEdlpHK240WU9wcVNJa1pVdzlWc2UyQzlsdmQzTHVo?=
 =?utf-8?B?ZVBWc3hnR29hR2RMaGEyUGJhK3paanQwc0V0M0dVZGtzZWNES25FU2Z1NXVW?=
 =?utf-8?B?OTlHVmpYMzE5bGhIVnVPbERaTjVZRHlWQW1PU04rcFVRaUt1NGgyM1JOc2RJ?=
 =?utf-8?B?Z1VsNUp2dTlXNEtZeE5LVkhielZpMUN3ZlBMUy9XajhUcnhDdVUzUTlkZDda?=
 =?utf-8?B?LzRLK2xYOENnK3hMQVBkUThkeVdYcWFPWlJjczJySjNJSGw2QzYrMUxrellB?=
 =?utf-8?B?LzhLNENZVG1XYjlhclZZN2ltVDFqeWNHZkhNQ1M0SkZxZDRiYThtY1AzWDZV?=
 =?utf-8?B?TjVaYmdmUnU2TVF0NHhZVUdkbldQb3RTT3I5c2hOQVgxWm9nSXRNcUtlSWlD?=
 =?utf-8?B?OTNicDArRDVZdG5vMVp1b0ZERUJOQVdPQWR1a0s3ME4yNFRBdUxDUXFBTDBl?=
 =?utf-8?B?cUxnU25SMi9ZVmtyRUROTzdlaGMyTVJxMVJYc2ErMk16T0hHQ1M1ZDRXb0xv?=
 =?utf-8?B?eEJJT3IwZk8yVzY3WHF1MG8yaC84TjdKZmNBSVU0TWtzNlVIak1zdXpVM1pp?=
 =?utf-8?B?R09qTFpOWEY1TXVHd1FJU3pPUEF1RWJnN0luYTVYSnpNUnkwS3Rocy9OSG4v?=
 =?utf-8?B?WkllaXBqdDZmS29zb01OMjhyNlRrNEFQdm1DaGVHODcrcEI2T0dJZTNJRXd5?=
 =?utf-8?B?K1dRemFpTlo2eUVEWjVjWlFmcUZqVktlVmlEenNXT2pzMDVQYjhzUkNuTU1p?=
 =?utf-8?B?bG1QSGs3c2hHQlgwbjNmcnVNZnM5ZXJrRG4xcGtBM3ltNmcyc2ZDNmxWVmhz?=
 =?utf-8?B?ajNtNmwvRnNRMEc3K3NDRHFWanRTUGNsNWQ2TERjdmRqbHU5TXZwK0I1QlN0?=
 =?utf-8?B?SmNqUEhTVXdxbkJDb0lsNmNhM25GMkt2NXFBRGM1VGR3THdrZEYvKzdiKzZV?=
 =?utf-8?B?TVdtc1BKd1Nla2g2eFRnSGg5UUNHa0VEdVJFcDJKQlFYcFFWYVBpV0ZrLzJZ?=
 =?utf-8?B?UjRYLzRybEY2bW5JOWF5K3hsZEw1VysxV3lLZ08rVnU4alBEejBrVEFJbk5O?=
 =?utf-8?B?aTh5T1JKY3B4bDJPSEVkTm5yQ1p5aFpkV29SczdzNEFKUEtxdUtTU2F1NWJn?=
 =?utf-8?B?YWxqSFo4VDJ5VlREdkE5L2d3QytQVFhpbW1vNFAwNUE5cEhmUTdXbXNNaDg2?=
 =?utf-8?B?aHVFSnBzNjBlYnRNTUp6dU1DYzBRVjlBUHZIOEhTMzA2TFZDdEdDQmEvK0Y1?=
 =?utf-8?B?UStsU0xFYzhoenJYWlpGVm80blNUSldJc0k5aExCcXFVcHpVRndwUGJnVjgr?=
 =?utf-8?B?S1ZKQ0Q0N2JaTUVLdFFKTkxtVWM3QkRIbVoxNm5JbmcwdkRSZXQvd3VPZTJq?=
 =?utf-8?B?SEkrcHA1RDlMSW5OOEpXdlVMMW1sSmVUMzRlcUdjb2FTT2JNTWVnajZpNHIw?=
 =?utf-8?B?YzI1LzRIbkNyZGVKQVdQRlkyajV2STNZQlJmWEh0emdVNjgwR1dYaUxtRXFT?=
 =?utf-8?B?K1hib0VIckFOMHhWc2N0dGoxRnlrZXd6MUxaTjRZYytKdEYyaUVGL1c3eXQy?=
 =?utf-8?B?NjJHd2VtLzlPUFJyenl4MnZlSnh3L2ErWE1iL1ZwYzNrRytSM1V4SitOSU9H?=
 =?utf-8?B?TEo1bUtrSkdtK1RFWGJYSFBUYXp0NzNnbmlLbC83TnQ3TTl4M1R1NkducGxB?=
 =?utf-8?B?Z2t2d0hLK3ZHSkRrUUJvdWFIVkJ0QURMRlBSU2RTQXNWdmV3SVpJZDkrY1M0?=
 =?utf-8?B?bC8xeVhST0l3UmNCenNTbWVRaHd5Undjdm05cTNXU2h6SkZwaWtoSEh5UDdm?=
 =?utf-8?Q?feNOWxj51MLgEmN7AfHz89aWk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97669d35-d398-4b1e-1a0a-08db18d6dfb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:25:35.9900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JplXotGjIbJGTTrQgYEAN4/SGYXhCf3qa3kDKLzsTM2/Va5jUWQyTdNpn3yc6X9JlDtO6PiJxq2dyubF+xyQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9589

On 24.02.2023 19:50, Xenia Ragiadakou wrote:
> --- /dev/null
> +++ b/xen/arch/x86/hvm/vmx/pi.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * pi.h: VMX Posted Interrupts
> + *
> + * Copyright (c) 2004, Intel Corporation.
> + */
> +
> +#ifndef __X86_HVM_VMX_PI_PRIV_H__
> +#define __X86_HVM_VMX_PI_PRIV_H__

I can see that you need something to disambiguate the two vmx.h. But
here you don't need the PRIV infix, do you? Even in the private vmx.h
I'd like to ask to consider e.g. __VMX_H__ as the guard (and then
__PI_H__ here), rather than one which doesn't really match the
filename.

Jan

