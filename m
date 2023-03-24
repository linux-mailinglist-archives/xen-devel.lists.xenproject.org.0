Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F5B6C7988
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 09:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514202.796239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfccs-00049b-2M; Fri, 24 Mar 2023 08:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514202.796239; Fri, 24 Mar 2023 08:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfccr-00046x-Ud; Fri, 24 Mar 2023 08:18:17 +0000
Received: by outflank-mailman (input) for mailman id 514202;
 Fri, 24 Mar 2023 08:18:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfccq-00046r-Le
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 08:18:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cf2293a-ca1c-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 09:18:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8300.eurprd04.prod.outlook.com (2603:10a6:10:243::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 08:18:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 08:18:13 +0000
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
X-Inumbo-ID: 6cf2293a-ca1c-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOaWiPHE4WWXQI8t0mdPNIUFE+ntXFTHwZzMlT5kSTwNAU9+711tYD1K4gciImiMxhyOdOXXfv+AxpYomHqC4UXb12FmtfdgYIL+sbVaz+vz2DTC6J7fAl8L5yUAs6eN/OVxQgFEM26mMLhJotaEEoQ7ptgFzpz26Xe0Wg6VtzXMykcE7ZyS41qpTXeNEFIqs3l4XRuWbJUtuuDreTymfb/+qgMcAHK0qCYjSKb9t6D6NTlU8zA1P2YLTOWBsYt8iGtluXPHAFI0qCh5vKakIBm3hQgOl3342dveS6n9nG8QTnCXY953bGUkStQiu+kEuv3UA8iLO2DqL7EnuPgRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTVNNMycHqTIn2v/5I7BzpKHYH+ogCbNoOIpQtsiZpI=;
 b=ejZzn9vVtWjoQJSCXYTEaBnlLTpA3mSIUdIKaUn7r1ROWvUwmIKq1SfdVZUZHkz7LMXFTH0TpgMjUTZ1Ytm2fbgWwLMMjkyMMQIFG7L7e44CouQ+1p8dq7nL0U8VYe9AtxSxpUaDMaRtddZvfK6oPsnOrDhW/YEY0ffAIEHKHBDNA2Idl58IEPVrltXGf1ekceZyqHDHqjL4lI/Dx/5qcmhcpFoVORKLmWLscK4otUmlmYjI4HMeYrllHQzvwW58iAKDzRCjiqNgn5KWvlJMFsPMboDPJyDRnFLY4tQ0XVhn5OtJjEW3ZiWtpiHhNBXXwgryd17FG/UGC5XTq4LHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTVNNMycHqTIn2v/5I7BzpKHYH+ogCbNoOIpQtsiZpI=;
 b=y23yh0NwZ9ujswpw9Iyxv/Jmn7Mk7MaYg5oqx+1VhFxde9tdyMZJ6vGC+1Pz7cGnG6bYEV+tKKmr0jlV1cZFPI9oE7d+3JObk6/AXTNCIa/vaP2wBxdLlW9xG+Z+h+KqYsGpcVk5WnPMay7hpDCTLhlSM2EAU9vblO0VfJYUb7tnBf/m3pvWx3YoPx8VFGw08a2BCdZgcRrwmW/+0htcDaXawHilI/0f/mloatXeKALt5Okqct8/P5IPd1HTNn8r6+2Fe9iP5aSyuEoTB7/z45fWuwUJB8+RLet2UJAciigdEOpYaolUpSEwicvEiATvyhzt5j6ElvKNB++9j2zfkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1129c32f-e77f-1a6f-03b9-b68faf39ce2a@suse.com>
Date: Fri, 24 Mar 2023 09:18:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] x86/shadow: Fix build with no PG_log_dirty
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230323234621.2591154-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230323234621.2591154-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6df78cac-8263-4300-d006-08db2c405013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/lNbBsNPSh2v6kX676Ocq4oWIab7TUJKk9ZBa/khYQ690JVfgFKXjkSt9KZE3Bz0HQlg8Dh9nfqHxxIGN/5/zyoA7NzMD1STSIlcyiz5tpGd8bdqdrGURnHCxZzspacFCwVkPpaWk0IZzsDIe+7IA8WRLLL5RE+HZ/5yU66wqTfJpXQ60BRDQXK6g4QPUvR26yQEDB1qs8eArRU9yt18+L+WAmfLRSRnvh7Eun8W4Cppf9P9MvSODVYeB686dtvdN6YtzVU/BGtxk0MoGypDX2H9bgozGq4qIN5PLu84oQZS5Cw+MQv4LgLMP5w3oKROGAChESMs8hIR0KVGoUFXyQbBsGAR6/q6yEjD0V174TOi7mbXse7iB/L4oMoXX7bgteVpj6HZTPa60e1xunB9SjQnbfSf9BB5u3oznPC3M+xb4bValsVsT1Y5mx05mF7xr/ipE4xKM2awLxJeqXcNeApBwCQo6JS4qkWVPzM313veuVIjUKLZq+xdnaIFRS3zjZ/8mX5IdLJ2XhX6Ea94ZObcNEOWyeVyVBtIi6dACUrJYy8GVeoobeUVqKisPp3u/9M1TN27Mm7NQ3F/nWGh6dgfoPwmKuFZz3AVgH7K66rxAm1JpwOT9KcfDhCuCtWh7G8w08LqqqA3EysX7Eq2sdT+Rm/RznkwA+j3JRWd+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199018)(31686004)(38100700002)(2906002)(83380400001)(6486002)(478600001)(186003)(86362001)(31696002)(36756003)(2616005)(54906003)(66556008)(8676002)(4326008)(66476007)(6916009)(66946007)(5660300002)(53546011)(8936002)(6506007)(26005)(6512007)(316002)(41300700001)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXd2NzV4U05rSTJYQVFqa2FjQmV0N3dkdlorR1FsN1lOOFprQ0hrOEM2M245?=
 =?utf-8?B?eXlWK0I4MjdFaDgxZ0xSeFRLUmI2SS85ODR4T0lzLysrV0FaZjJHUzhhNE9t?=
 =?utf-8?B?Z0N0eTdMMFY3K0pyZGIyYVdhNDBDYlJXZStCZmxOR0FjYmRFTnVVR3dsUGYr?=
 =?utf-8?B?S01iU2VvamtScm81OEY1aWNMMXArY1l4OVRuZzhQcFZwTU1LNnJPbkxjVTkw?=
 =?utf-8?B?MkFPUVU5MjNWWVVGWTVKcWVDdEhESjZMek85WUNEam5DOE0zbmVhdFAyQnRV?=
 =?utf-8?B?NHkzbDNSL3pqYWlNdVhPamNFVGhyMVAyQWFKcFJQbTl2UXF0VWFRdWErZHQ3?=
 =?utf-8?B?UnZMUzRzYWpZcTQ2TjZORnZsZmZsalFhUUFOd243NWFRYjdEWUtpZEEvVnJ0?=
 =?utf-8?B?Z3VRS2ZZUUh0ODBjaC82SzB2RmFMSDNvY0kwRFE5cnZ4TWJpRjVvcXBIMzA4?=
 =?utf-8?B?STVGbmkrV3B3VXBmSkppS1dhMjdodjJsdit2SnZJUDR4VHF6L3d3dmc2b0dQ?=
 =?utf-8?B?MzU1Sm1EcG5nNm9JZFNoQTlsUkc2cTlGd3NUVGdGT0ZFZFAwQXd5K0dFaHlV?=
 =?utf-8?B?a3YzbXlJMXdSWjRUK2ovVnB0RE1hclFLSW1iaXVheVlwVERIbGdBc1V4bGp4?=
 =?utf-8?B?dDdlcUQwbHhjc0JLeTdzRmpSaVIrM05kSDRhOVNXbFp3a3ppQW1kcUlQdTlk?=
 =?utf-8?B?VHZPREkydGlJL1R5TUVQMGJYZVp3QUFpMnRrUXZUbXlqQlFuUGFicHdMaVN0?=
 =?utf-8?B?ZlJlSGhHQkFpaU82SzZESHFQYzgrUERFZzFza0xmNEdwZ2hEWHkxcFUrNGZm?=
 =?utf-8?B?alk3YzAxNEdzdVMzcjJEcGw1ZkRjaFdBbTJDYWF4QmJ3OFd2MG54OEF1R0lz?=
 =?utf-8?B?eXpWZEFDNFBTSmVuOGk5YUZjMmlkcG5JOTVqbzVQUTREVXNtWjkzelhBVzVO?=
 =?utf-8?B?a2FCbG00UVJKSTRYVW5rOGhVeDU0RzhkVUtmUGd1aWtZeGE2WklrdFQ5SzJF?=
 =?utf-8?B?aEFBbXI0bEpBVWNGNVlrTG1PUWphbG5zRk5ORkNuaStQTUN4amM1bXpDeTFO?=
 =?utf-8?B?M1JJbHpTQUcxOEQ5VzZRWHo4OTFyTEt4RzYwQmVrVk11L29yWCtkUVBUa3N0?=
 =?utf-8?B?UGh6dVltMng0RllSeHpQMG95b285ZSs1RnNEZmxJbFhtWlY3WjczRkt2QmI0?=
 =?utf-8?B?Y04wcEZxQU9SQ1JZVGdGbFRMSDlocVRYS2JNYW0zczZIYWhhOVpjWHZoTWJC?=
 =?utf-8?B?TDh5RmZWU1lOZGNlZEdPYksvbWlIN3hpL3FGL29FY09yR3NJZWQwOGd2MW9Q?=
 =?utf-8?B?R0N5MmZTandWbkp6NkFGbDBzdmx5cjZ1UE5qeFMrV2ZsSFA2ZVAvR1pNa1Jz?=
 =?utf-8?B?WmpyY0o4dXA3Tk16bWxVdFJON0Zyc0IwWGhLcEtjalZoY1dYN1I0WFp2OE1D?=
 =?utf-8?B?dW9najdkdnVjVHIvVHNlbHg5YzZOQ1paNkIwVUZySklpTXc4NTJ6NVdMdDJw?=
 =?utf-8?B?TjRvV2k4VlA5eFNwS3ZYOWVhc0lrWWVQcEpDMTIvU2wwdENMa0lQbUNZeW10?=
 =?utf-8?B?SFBWSkZzWG9YaUFyKzdSc0RZL2pZYjRlMGtLenJEUnFYUmxOVEVGZ0hRdWFW?=
 =?utf-8?B?dmpsc0dnTmtZTXJZYXhoanA5TmpWbWloRlF5SFJEeTNjSi9NMVJ1Slg3b2Vq?=
 =?utf-8?B?MnF0KzVRTXRSUFEvbjBQOGNUbDN0V0x2aG9IZUpOSHczWTc3bzlDU3hXcjN1?=
 =?utf-8?B?TlhHTGJMMG9LbE5aWTU1ekRIU1hqK0NqV0I0VC9lZVcwRkJoQnBoeU9JUUVn?=
 =?utf-8?B?VzhCbmJnUFFqQkF5VG9KMTJyVkc0aXIxOGViY1VqUzlzVFcxRDR0UG54R2RH?=
 =?utf-8?B?bXZmOERNSGZ2UERCS3VHTk91bzdCZkJxSS9uWEYyZUtPQ1lhanpUYjFWbzdH?=
 =?utf-8?B?TENQRGEzTmQwT1hmMXpkZ2RUSWVrL1RuZ1N1ZWg1c2V4NGJCN0x0TTh6OTFZ?=
 =?utf-8?B?MDVjdzl2QzZZWjc2bk1xTk5DTXA3YXovSmZ2eDJaTGxpVm5FYlhXbUthMzV2?=
 =?utf-8?B?ZEYraFdvbTZ5WDhURFZuTUJoWDRBRHlKZWxQcnhpWFZ3Mm9qOUcydmtSUmhw?=
 =?utf-8?Q?nTGk0BxUyE4HNVtHlCJZmFp0P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6df78cac-8263-4300-d006-08db2c405013
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 08:18:13.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CLgNHg1JmyLz14k7RPNKY2K+o4VO19S+kYETsWmBVnoZUJxgN2x/8k1DX0aefCU7ycAoN7NVEzRGU51ZJrLlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8300

On 24.03.2023 00:46, Andrew Cooper wrote:
> Gitlab Randconfig found:
> 
>   arch/x86/mm/shadow/common.c: In function 'shadow_prealloc':
>   arch/x86/mm/shadow/common.c:1023:18: error: implicit declaration of function
>       'paging_logdirty_levels'; did you mean 'paging_log_dirty_init'? [-Werror=implicit-function-declaration]
>    1023 |         count += paging_logdirty_levels();
>         |                  ^~~~~~~~~~~~~~~~~~~~~~
>         |                  paging_log_dirty_init
>   arch/x86/mm/shadow/common.c:1023:18: error: nested extern declaration of 'paging_logdirty_levels' [-Werror=nested-externs]

Okay, that's SHADOW_PAGING && !HVM && PV_SHIM_EXCLUSIVE - I can see
how I missed to test that case.

> Move the declaration outside of #if PG_log_dirty.
> 
> Fixes: 33fb3a661223 ("x86/shadow: account for log-dirty mode when pre-allocating")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> An alternative would be to double paging_logdirty_levels() up in the else
> case, returning 0.  The underlying logc in shadow_prealloc() succumbs to DCE
> either way.

I think I prefer the way you have it.

Jan

