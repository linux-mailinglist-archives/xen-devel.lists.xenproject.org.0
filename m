Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA07A65BB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604773.942279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qib8t-0000Xo-Va; Tue, 19 Sep 2023 13:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604773.942279; Tue, 19 Sep 2023 13:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qib8t-0000Ul-RI; Tue, 19 Sep 2023 13:51:55 +0000
Received: by outflank-mailman (input) for mailman id 604773;
 Tue, 19 Sep 2023 13:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qib8s-0000TN-I7
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:51:54 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02ac858-56f3-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 15:51:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 13:51:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:51:50 +0000
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
X-Inumbo-ID: b02ac858-56f3-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hebtk4cyoeAUAxhjmx6Sl2ee2H2DGIJuF8Xmf8LqoHylzdeaAD0D3ehILgcuJUsD03iIKGTvfSFCkeIsk8oPYsBPUaWfyYAV6gdiCpYBWgCfo6MknuTbueRZ34ypbc5JVzOms7U7drDKykSJMjPs1bpBlbsWkTqYWoEZ4GTRdONe9CeYK5tM0JqmNhCCnnbGeb9/y7j01Bta0Whz3S8pb71OTOhzgcEa8xqDSem4Dk2imQ1EUYrB+Lcq0+r4/M9f5iEyVSEHPi+TDuQ+QQ6w6BJcoyxstSGIoGnSBorzpO5jIc8r4rz+Ud0pp20L+6KtaQcN7xRPcY1Q3BgpC9Hv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTtWIWgqYS5XpeR+XCcErzNBzEjcrGPaQrGDrSJ9sDg=;
 b=dTTMbpqjdO62u3W9pFRo7vKvhQiDNuCKYhBkGiCfJsZ8mHiv7WRxJciPDBgvBQeZp8/yNdA7E5/DrJH8DjMFlUxegAn8utgOYlJ4B8FoTzLTSmr3GFAzEGLJoj1x5toGW2APbWR0qAn/FuuSMCmgMFkmbJ+0RYLCvyHgJAHhhCT/qlb7zvSalXSwqcK3M8itn5K2Fd1/mBC1E72iVOCTtSCYa9nm7qqiYtxns1Qoo+2mL4X6fKfHQoCs6J8vIRPtbFHWYvtPcdk9MAerHwd6wQfWpKRbVIPdYCSgQxC5Rin3ek9ki+Aq/h9W+HxLSqeMqob+7AxYMY7mDWZuAf2+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTtWIWgqYS5XpeR+XCcErzNBzEjcrGPaQrGDrSJ9sDg=;
 b=WREoc44HYI4PGbpmNCUxpwAvIvbOy9aLSdz5nx+agSKT3k8Hes1BnMZeke7ZeEkzAjrg5EURfLJTLknt7rABGNxji100s6oi92/lSaSckP0MatekOgi1obFwYv6F4gDwBZKc5vhuLsT+6ZqnCH8Ox0JAvt3xj5cWO/Gpv+1VgcPYv54GuzIsMG/vUfFOvGUsZuiGyWLqrRXKMAE+7wy5pBJvSUHHznAbpo1lCMBGTb2apqi4YeVBtO3hM2Jlc3TY9PYVNeNBYKP9a2H0egwuYRlgblfVACZervsvhVvhKlU7maOhJktweyFF2ieIQgJWGLVxpbaBz+F6fMTMo1MZPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f343f3be-c42d-7007-2d65-3465dad03969@suse.com>
Date: Tue, 19 Sep 2023 15:51:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-4-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c94f78-e1da-46a1-23bf-08dbb91792c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mq8+AANnwy7nC/MnJBAhAUsWltZY1JW9K5ay9wF6r1lycNiBEneXQM7WA1oYiX3sd6ZqKp/GE1f0UU2AVBFpPGoAhbUG9xe+DqEHD9K0mOGSEfHvHTFy4bmI3dQsbAk6/7sHyZkC1ctAuyzWlw4764L6B5LaKCL0d7845tVSQaan7gMuKHPLBrh9Ca/vhdXCXe1Z6GMLXFkoBqU3i3lUIbYlQMA5Ou2bgmWD4c0KDe1ZOBxe9S01vpSM8VpIuSWohWIahNKoNKWMoFreHV2LQBG8MV8E7zIsG7oHheu1IDrssktHV+zKEiHNkOREyyRgnkd99wj4rOPC1wMP0tPkhwhPmfdBwI+0rNMXaNxVcU0FI1+10CzPKq0WzKOh8UO85l6UNW8JazxA8cfLSbD5HBbshcO2mY971uwBWl/gQ2PQEg8+0Ae5VU3v3yB/v457Pa/REUqGgJKdhYv2TWgA6Qhki5wFT79T8KYt1dwGJLpZRITS5QcWPA180htXglRuVsnedxKjEYYNWf4EEjf8FRt19IWPntEuJZBR0hOrhkHolqgnHFiNZcctsTS/R5GSHgk0Qfqg3xxNwgS3zRcyUE9HEmv7jSqW+eEzYunVvwaUT2s3NDrnNVMt7D34Ur9CQ9Xy1t40qoJ4xlUAoXNwhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199024)(1800799009)(186009)(4744005)(2906002)(7416002)(31686004)(5660300002)(8936002)(8676002)(66899024)(41300700001)(54906003)(6916009)(316002)(66476007)(66946007)(66556008)(478600001)(53546011)(6666004)(6486002)(36756003)(6506007)(2616005)(26005)(6512007)(38100700002)(4326008)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWdKRS8rT1dEVWhkMFg0TVdHY01zU1ZGUVNSWnpqWWxYQm9JM2plQkkwTXha?=
 =?utf-8?B?dCtqRndjTlNFelFwME9tTGhFTTh5SldHNE5DSFUwdklYUE5mcnBGdjI5L0I5?=
 =?utf-8?B?U2dSWGhYdDhIWGl5amUySHBvUkwrNk9ncEpVWUd3WlZsaUNLbUM2MFR0T00w?=
 =?utf-8?B?WThwa1YxeTYrc3Y5MlFOdmlRMzBwMzczRnNQVDVySGJrSm84VEZzQlRhQ1Bl?=
 =?utf-8?B?Z1hqc1NVWnI4VEh4eFNkS29oU1BIRXYwU0VmNEpYNmZRZWNLc3ZHc3ZhYVRn?=
 =?utf-8?B?bld1Q2Z0UERTbDI3S2plREVDWlI3bTRtRTdORmNHSC9XZm9SQUhRUVh1R2FX?=
 =?utf-8?B?Sy9BNVdzVENlZVF0Mk5Mb2t1ZW5HK2R2dHRBRFlVNzJMM3JuY3BUOFdJSjUv?=
 =?utf-8?B?V3l6ZGQzeENFWmF5ZzBwZFREMEdTaUt0akl1d2t2cHpNNnVtWE9CZmlSS2U2?=
 =?utf-8?B?MDAvWWExUFIySTNmYkx1NFdBWlVTdytNdU5EcU1GVEVoWHV1Vllob1hjVUVa?=
 =?utf-8?B?SFRNWXhiRkRHcG50ZzAxKzlGMmdMWGJHc01BT2lnS2UzN1o1UHVmNHpPTHd2?=
 =?utf-8?B?blNMRE5rRVZaaTQvdVNBandVTjNBM05vTU5nVUIrdDY5TFE5aG9LcmZwSWNW?=
 =?utf-8?B?L0tLbmgyUDVQV1ovQ3Vyd3RvQnNLZkdhZTd4empBeDVkTllOblFLbGdVUmN4?=
 =?utf-8?B?bjNMdmFOQThqbDJVM05YdmQ5TDRNNmtPUUs0WS94b3hPVTBuMjJ3cnFxTmNT?=
 =?utf-8?B?SURra2Rad2FkMzF1VC9DTVZ4MFoxSXpXWHBXR0Nvc2hqM1hQZmp2em8wZWdI?=
 =?utf-8?B?dEIrZnUvMmNqb0pSRGl1L3ZDK0pzM0NNL3RkaVk0bnozbzdheXEweFduVEtp?=
 =?utf-8?B?elRqTUtRc0FZUFNFL1FtRFIyQ2FWT1BJR1FXVlhlZ0pIVmxFRXNtemtCcU9k?=
 =?utf-8?B?ZWdJempwMlhNRE9WaUpXN2FZWXI2ekNmZDlhNHVXN0xhQ3h1aElKbklXSWxL?=
 =?utf-8?B?RmpZZDl6cEhUaXA5eFhNVENJRlhBOTNmWFhYR28zeDdGYmRmSUZYYjFLSWhp?=
 =?utf-8?B?RFhRRzNSdDNuUWwwdzYxWk9kWDk0SWpub1lBRFBNc04wKzBmLzJqY0xVRWEw?=
 =?utf-8?B?M0FCR1phOHRZa1RkWjVxS1JOZ21jd09SbC9GMGs2VWxUTzdJM1hLVTEvemhn?=
 =?utf-8?B?UGNUNGJxblIzK3dEL0EyUlFTM0dUZEc1UjRJb2VQSVNWYkY3eS80SEREZFVh?=
 =?utf-8?B?VXBENHJzNEdtdjNZZ2k5bVdHZ1NxVDdZMkhiK0JIVWV4MEVBNTk1QzQwVitL?=
 =?utf-8?B?Y2JYZStOeXlaeGk5U3o1QzgzOWtDWktTVXNOR3k4ekhsZmRmd0E2cmVPSTYy?=
 =?utf-8?B?cnZ1SWswbS9QVS9JNE1Tc0srUi9RUlJLWVFiZm90TCtQVy81UWpCdy9SYWRw?=
 =?utf-8?B?cEdvdGl0UGJrRXlPK0NhZzFRb1lQVnZVNjQ5S0N0SmlnbXN2NW5tajNZOVhB?=
 =?utf-8?B?NmZkRTJqcG5DbC8xcVlvOE41MEFTRFRqb0JmT0Z2MmxxYndaUDB2VTF1ZHor?=
 =?utf-8?B?SVlod3V3b0ltaTJLdHArdHN4UkFsdzZFVjVsbjJwUzRUZlFTdjJreVp2a2Qw?=
 =?utf-8?B?UnpMbFRkbG9yT3ZtQTQxNGRWNU1Mc2J2OTlQQWhoOHVJUHY5MDJ1MS9vek1Q?=
 =?utf-8?B?dDN0bkhrZVlyTVNyL0N0YmpSUEcwTzcrMDNOTTduSzdxM3dRWWZXcXZXQ0JK?=
 =?utf-8?B?Slcwd3l5VEoyUE9XSWZaT3RCRGNqMWxwdHNzNHF2UjJyVDZQK1BXYlg4VEs5?=
 =?utf-8?B?d2tMTktmQVI3SGp2QklTb2NuVDl0ZmVEdG95ZHZxc3Q2SUR0bUE3dGJPQ1pz?=
 =?utf-8?B?eE8ySDMxeFJyRUtneTZLZVZ6djVhMnJFYnRTbnVDYXZkeWRUVjBTejRVT0do?=
 =?utf-8?B?dUpydFJxTHluQzJKZWZ5SmU2azBPWEt4SWxEbjdOZ2FDdzE0VitWZFB5N2t0?=
 =?utf-8?B?MGNXTnQraWNzd1ZDQjFyUzBNT3ltNk8vUlM2MmJ4dWxJQVpqclIwa1M5NG1m?=
 =?utf-8?B?TjhDYVcwTXdsYWpmTERGL2Q4TFhrYmU0UytWbCtOS0ZUcWRBWjY4WGpvSnlt?=
 =?utf-8?Q?UuhQ8zguNEUWS5gqczxWJpRej?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c94f78-e1da-46a1-23bf-08dbb91792c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:51:50.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ibd+UpYX36qyz9CS9+Znv8VJkx96i7wi2j3Q/ByryvU/lUWCo+j0N0Cb24DYQ9OGdxFx4tmPmqSmKZBcont7Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173

On 01.07.2023 09:18, Christopher Clark wrote:
> To convert the x86 boot logic from multiboot to boot module structures,
> change the bootstrap map function to accept a boot module parameter.
> 
> To allow incremental change from multiboot to boot modules across all
> x86 setup logic, provide a temporary inline wrapper that still accepts a
> multiboot module parameter and use it where necessary.

And all uses of the original function are converted to the new wrapper,
except when passing NULL - am I getting this right? Plus down the road
you'll change all of them back? Too much code churn for my taste, to be
honest, not the least because this undermines easy use of "git blame".

If the above observation is right, and since passing NULL to the wrapper
is fine too, why don't you deal with this by using a macro wrapper
instead, without needing to touch all the call sites:

#define bootstrap_map(m) bootstrap_map_multiboot(m)

Misra won't like that, but as you say it's temporary.

Jan

