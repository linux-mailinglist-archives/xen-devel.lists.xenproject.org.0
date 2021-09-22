Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C410414EC5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 19:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192948.343690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT5gZ-00083l-J5; Wed, 22 Sep 2021 17:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192948.343690; Wed, 22 Sep 2021 17:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT5gZ-00080v-Fp; Wed, 22 Sep 2021 17:05:31 +0000
Received: by outflank-mailman (input) for mailman id 192948;
 Wed, 22 Sep 2021 17:05:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3we=OM=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mT5gX-00080p-Ia
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 17:05:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4767a595-1bc7-11ec-b9bb-12813bfff9fa;
 Wed, 22 Sep 2021 17:05:28 +0000 (UTC)
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
X-Inumbo-ID: 4767a595-1bc7-11ec-b9bb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632330328;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LhBwEHKOX9qFl+8IkDrfjNwFs4n9Xj9U/uzgMazbTz8=;
  b=CW38rq2Jt0WTZkCYu0BVQjIDtwbeedlR6fnZKfCBqsqnHrbVO3mIoWvs
   dp5rkkgMXVA/1hX8NIK86efdpRM2eb/P9umlmMgp0G79eG/1DFHaS/GyH
   vH63Kni+/iaClj4xo9CDLQQi0OWYYY0uUuc0sUG74mAEi1kJa+iNIbIZa
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KkbuIQ0BEQE7k+sqLut0vQPQwha2RgeexUhK8bHnVwWNvS41EEubAbyvTSvWaCWn46psPIDiSB
 AoOfoIMBZSC5PopY/h5BPYDDsliitSq9m0BI5xQvWQSGGysNZ6JPZyCWTXr60BvMMFQ2v57dNl
 72+rGY/DCT/iv+e12fx3bCWVyzzc0+HehFg/zxbDaX0udWzupRPTldSiKGCcXcK7CwK4EdnC14
 KKAX9kfcLCmZMeqSateTGuaxv4SBgQK/kl+lxVRB3Oj+TOitCYCzdJGgr/hbmV6zftJYKGdy1R
 t0hoq6gYaKvHDm4gfqiaqntv
X-SBRS: 5.1
X-MesageID: 53376522
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HSdbEKuT7KXyfauYnMZZqR7mfOfnVGVZMUV32f8akzHdYApBsoF/q
 tZmKTqFa6mONDfwet9+bI60o0hVu5+An4NhQQM//yhjQSsb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524LhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6bGIWBgxZID3hOU7DgF6PjxDfox70eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DP
 JFGN2c1NnwsZTVQM103Kp5hwdyVn1/NUG1873Osm5sOtj27IAtZj+G2bYu9lsaxbcdfk1ucp
 2nG13/kGRxcP9uaoRKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTiea9ol6zXZRYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7EX0BCS0vD52BqYIDUcbBNcVZ8HieZjEFTGy
 WS1c8PV6S1H6ePOEyvNqOvM9FteKgBOcjRTPnZsoR8tpoC5+dBt1EqnosNLTfbt5uAZDw0c1
 NxjQMIWvLwVkcdD/KGy51mvb9mE98WRE1JdCuk6WAuYAuJFiGyNPNfABbvzt68owGOlor6p5
 iNspiRmxLpSZaxhbQTUKAn3IF1M2xpiGGaG6WOD4rF7r2j9k5JdVdkIvVmS23uFwu5bIGS0M
 Sc/SCt65YNJPWvCUEOES9vqUKwXIVzbPY29DJj8N4MWCrAoLVPv1Hw+NCa4gjG2+GBxwP5XB
 HtuWZv1ZZrsIf88l2TeqiZ0+eJD+x3SMkuJFMinkEz4geTBDJNXIJ9cWGazgikCxPrsiC3e8
 spFNtvMzBNaUebkZTLQ/5JVJlcPRUXXz7iv8p0/mjerLlU0FWc/JeXWxL99KYVpk74MzrXD/
 22nW18ew1363CWVJQKPY3FlSbXuQZcg8i5rYX1yZQ6liyo5fIKizKYDbJ9rL7Mpw/NukKxvR
 P4fdsTeXvkWEmbb+y4QZIXWpZB5cEj5nhqHOieoOWBtf5NpSwHT1MXjew/jqHsHAiat7JNsq
 Ly8zALLB5EEQl06XsrRbfuuyXK3vGQcx70uDxeZfIELdRy1ooZwKiH3gvsmGO02KE3OlmmAy
 gKbIRYEvu2R8YU7x8bE2PKfpICzHuogQkcDRzvH7ay7PDXx93a4xdMSS/6BeD3QWT+m+KimY
 ukJnfjwPOdewQRPuot4Vb1q0bg/953koLoDllZoG3DCblKKDLJ8IybZgZkT5/MVnrIJ6xGrX
 k+v+8VBPeTbMczoJ1cdOQ45Y7nRzvoTgDTTsaw4LUiSCPWbJ1ZbvZG+5yWxtRE=
IronPort-HdrOrdr: A9a23:e3Kzoqtv0A8nUbuRPc1iR84n7skDdtV00zEX/kB9WHVpm6uj5q
 KTdZUgpHzJYVkqNU3I9ertBEDiexPhHPxOj7X5VI3KNGKNhILBFvAH0WKI+Vzd8kPFmdK1/J
 0QFpSXV7bLfD9HZGzBkW+FL+o=
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="53376522"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/MjnQ3T0dogiV0shKGY9asCKQ8PGzG5EVVtNia3SPK37D2wDsd51MuFD01iPXYqNv8P7CBwZkpDtEoAoeWCXIcXtIegTBRLET6HZGvagNLFPu5nNwttVutz4G8BXXedAzIPONB67fDY+eFyJbwiym/RB5Qpu0pv64UExcdTuUuofjd+cKKIbyViChBy0oof7IW/ASRiPTppQr6O6BG4ItYaDDB2vzs1kl1G7vb/j7e75QriiNrV42LA2KqFEpU9ASSY7AChOkoXj+bLzJ33MF1yM/hJ2jHwkzf3IoJDh0U2LU86bHQBe6iFy5h2xzvOs4d8Qjhrc+qp51dKgsvnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5felQb1LbNmrt3F2TUVttsNTPHqdtjORDBVW1/xao/U=;
 b=GUzh1i7dPeS8AVhaALhOy7AYi6rx34b/clI7JBo1cZZNBJBlQc48gtwc1AKBd6Pk2sJOZdhQeBQQz/Ki4a/18pGbkPZjvUVz1V2oTBIwXwf9BIhvQ8mVFoJDEPpE9hp6Fnh6sLFcpCSP/XMMvA5qFt3HG48Ej2VzQBdpOoR5D88gnSk99xGpW6WTez2SshVDnWXI/ZkQ/ApBQeNh/Q9pcAV5TXQ8MNXbQHvUhjTNU4WQqybhLYDTCC1JAnOk5JdOt4me2KZ1bQWopTgbAHccIS1uP9qz0V6kf7jZwrYEmCVdZ8okwxZEeHRr9A8rrFhztb0bnwn93Cg5RnWlbthtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5felQb1LbNmrt3F2TUVttsNTPHqdtjORDBVW1/xao/U=;
 b=d4TsH3SXH7Ijg56/fmwJ/71f5V+PZLIdqO181TjwVpYdTOQDqA41mFNSahJ506AC/aOElaAIAD9UtpFX1myfiv5Z5kgjPfME8zodSzULODdvg9tU2GcMZJqbrHwEjUvkfgYobNteLyvo+VvrDCmwFN14k43SbDIaMiT47pzKuu8=
Subject: Re: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
 <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e1def032-d8dd-f5df-c4f7-a9968083f06c@citrix.com>
Date: Wed, 22 Sep 2021 18:03:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0310.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc0ffd2f-de15-4b85-592a-08d97deafa97
X-MS-TrafficTypeDiagnostic: BYAPR03MB3992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB39929201FDD08EFD899FEABBBAA29@BYAPR03MB3992.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AfWF/A07cUBzWorc59B3/kOmhH1/+Dooyhiv1rhYuhPMgQkILwWIUl4Jtw28ygN0w5WQlw5nAM9dO33CdHxJHCYrEp5DLAM5lAmTU5YaRMQh1g0cKE0TYj/WvuUUC7YflpRRwrKeArFP2yk7UEra+CRDHgMWdMj6MBJRtZ1FJW30ZiKTkFJEKZ2wQPrji9MXNw9Fl6NWlsfgWMv/sdckQqIjMNVqrcYw0mEjBbMKvmbsGup6/P7Lp02LSXiyBb9RJhHxgSRcTSfRqN+gBDPyTv0a2x6PCZR89aifU/0DUSmHQ9P04jfDdq9WfjGCakJR21a5Tz6BjqkRgHaeWYjj7jIbEpU+AKJywyUp1aZ8XuFUg+CU9agE5Kb0fU5DMyMbb4EwT59IgcIxCya2bf7QxDw0R6G7B9Cpwu3OibWB4NjHb2k/4W3eqUVHYm20nI68Sv2ff2rh0Eu/VsCdrbRM07KfTbp/xH7d3tyY8aM5BcPjace3/MctaSMIS7rNQRD7Tz8bgflk9741C9eXQByVKBULxo3sKG0E+2+ynvmFcTRuC7PEPTVP6Zt/7J3yzIYAR98y7fBjknKVsi0gYGt3y9tlt9KC/tNTYfQx0P0JPs3nAWrZxSQRjYFrLhbhwlHFOjYzbVYsJGFonFbo8pG+EThfW9184Q6DgthjBoNg55NRXQfc4zGm/x8Znfut43+AaWQcfjVXNjCnCJk4caH+056ljRLzDzNcB0uMlV/Vn7M/1dMrqPn6NSeDdJ7DUrXA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(110136005)(54906003)(508600001)(86362001)(36756003)(16576012)(31696002)(5660300002)(6666004)(316002)(31686004)(4326008)(8936002)(2906002)(26005)(8676002)(956004)(66476007)(66556008)(66946007)(38100700002)(186003)(2616005)(6486002)(55236004)(53546011)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlJtc2p4VjdESmJRTVAxT3ovYjBKUEpJalNlNERBN1hhSmR5Zm9DT2hYcWtw?=
 =?utf-8?B?MXVoOGRWRWhURUlUcTY0OW5MckxaZE1NV3RvT093MnQvOWk1dXBiOVJPemJQ?=
 =?utf-8?B?cFcwditUNDB6dHN1RFdYbEFOSW9VWXB6dFlDeGk1Sk5WK3Y0RHVybDJ6TGpC?=
 =?utf-8?B?Sy9GenI1K3VaY2E1WjViaC81YU9LWDdweTJTczRLVkxaanlLRVNKZnNZRUZD?=
 =?utf-8?B?K2pGeHZjamYxS1dOdlNsT3VtR2FZOUVnNG1FbXo4TFRXTXZwSTRia0RzWVI3?=
 =?utf-8?B?QzZyeS9BK1U2QTJmdmtxcFVpbVdkYVQwQVBQcVRmS1A3bGpPaUs4YjJwWmk4?=
 =?utf-8?B?cERzRXNodFc5c0RpaDZDQzAveDQzY3VtQmpqenVyQUJCaFFKMU1yWXArUGlC?=
 =?utf-8?B?OUM1YWpQRStoOUhTMGJ2aUNLK1cwcmVKZTZoZjlCL1JyQTUvNEpwN1NEamZX?=
 =?utf-8?B?QVJxaCtLY09ZNUZqVjMxUGEvei9LZitMNUNwNWJTVHZMcUs1alk2ZWE1b0Q3?=
 =?utf-8?B?L215WnNhRDhoTHBScENSckFlUGxJaHJiMVBwN2YrZXNzWEdkUGkvMmpONWND?=
 =?utf-8?B?ZU9FZXBzanM4MTZneHNCbGhWNGdPeklPZXJBRU50NDduYWNBQ0llZWpINWkw?=
 =?utf-8?B?dGdSUEpuZGFMNWcvMkMrWFB4bHM3TlA4ZDFjalhGZk12c0tBWXd2UHllQzBN?=
 =?utf-8?B?SnhOYWVZc2xIc29LQXFpRHloWFFqNVZRalhXdG55UGhZV1ZjcmViN3JsOExo?=
 =?utf-8?B?ZlF4ZmdtZHoyWElEQ2xJN1lJTTJUUEw0UGxPejZsUWxHNGFjU2ZsM0Z3WXJi?=
 =?utf-8?B?L2F2RExHRGh6eWhDUzU5Ti9wczFYL1ZCNHlXVmpoRXRNekhnYmkyS2ZaR3do?=
 =?utf-8?B?bUdSeWVLbitLK0k3Z09yS09Wb01vNEZaYitMT1IzSFZHTjFtZHVVOTBCK2Vp?=
 =?utf-8?B?YjcrUDhnakYrT2hxVXhYTVRiMFFQUEVPZXEybmVKK0gvYzZJSmN6eFlhQW9W?=
 =?utf-8?B?Vm1SSWF1Y0pzV011RFVoUHFHVkViVzB0cG8rRTY5bHMxT2NhZWFUb0JRN3hl?=
 =?utf-8?B?NWJQSEJIUjExaVRLMEUvZWx3T0NUWkRRL1NUK2ZlNk55MjJCMXpLYlB5dDh6?=
 =?utf-8?B?Z2RJR1JIdjZwcXhXNEJTbDEzVW1SdjZYRGpOYWVyRkRxK0QvRUVIK281QjZu?=
 =?utf-8?B?WmlLV3pRV1pCTjVuNU1mUjloS3RRTzhTdy9wNkZtbjc2QVlaTUlhZFFMYTE4?=
 =?utf-8?B?dE5EUks0Mzk4WEd1UTZ3RVJ4NStiYVFYcHFxNXE5VWwzWTNaVXNrT3A4Qnh0?=
 =?utf-8?B?ZkIyNnpxZlM2bHFuNnVYUWtOR2RZVngySEttcU41S2M0eWxZWmpicDBPR2R6?=
 =?utf-8?B?and1d1d5KzkweXdaWDNHMWJXS2tBZVBMTk8xK1FFelBteWVCMm5hbCsxYmc5?=
 =?utf-8?B?ZWVNR3djQjJTZ2hrTk5vVHNlY0FudGZ5Zm9XWWxUdDEzMGNZZXR1RnFxTHBQ?=
 =?utf-8?B?akp5cDRXUUhLNEo2eEV6clFFeVg2Z3BMb0c5S29NR2NhMHBvNFVDTHF1NEdl?=
 =?utf-8?B?SEZCM1VHdTNVZ20vblVLbnNZV2RPbWtvSVcwTkJyNHJ4Q09VdUE2bE9iekov?=
 =?utf-8?B?TGh5eDJKVTUrV01pc21ua0ZmTzlLSWFhMGZDM0VwQy9OckRLRlZCTDJ3QzJq?=
 =?utf-8?B?TDVuUDU1SVNXdDRXcVE0TmNPNkxFdE0xM08yblBSWmROM2JEdElNdFNsWmxi?=
 =?utf-8?Q?V96iOeCfHIjKjG1k+NZDkkhn6fm5H1G1dJT4jdV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0ffd2f-de15-4b85-592a-08d97deafa97
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 17:04:03.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35kituR7Vh0o91+wCJbRkoEogba/e348oeUZjfHHkDiZS309IQAQsnX2OQq9akIT76HXSzp9F+EPfT1d0hEW8iQbHKziYzkWut1G2AqTEkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3992
X-OriginatorOrg: citrix.com

On 22/09/2021 16:01, Roger Pau Monné wrote:
> On Tue, Sep 21, 2021 at 09:18:05AM +0200, Jan Beulich wrote:
>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>> @@ -33,7 +33,7 @@
>>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
>>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
>>   *  4 +----------------+
>> - *    | version        | Version of this structure. Current version is 1. New
>> + *    | version        | Version of this structure. Current version is 2. New
>>   *    |                | versions are guaranteed to be backwards-compatible.
>>   *  8 +----------------+
>>   *    | flags          | SIF_xxx flags.
>> @@ -55,7 +55,15 @@
>>   *    |                | if there is no memory map being provided. Only
>>   *    |                | present in version 1 and newer of the structure.
>>   * 52 +----------------+
>> - *    | reserved       | Version 1 and newer only.
>> + *    | vga_info.offset| Offset of struct dom0_vga_console_info from base of
> I'm not sure we are supposed to reference external structures like
> that. We took a lot of care to not depend on other headers, and to
> make this as agnostic as possible (IIRC KVM is also capable of using
> the PVH entry point natively, and hence depends on this header).

Absolutely correct.  C is not an acceptable ABI description.

Furthermore, dom0_vga_console_info is a bad ABI to start with, as
demonstrated by the multiple problems we've had extending it in the past.

The MB1/2 framebuffer information would be a rather better example to
follow, but we'll surely need to pass the EDID string too (at least in
the case that there aren't EFI runtime services to use).

~Andrew

