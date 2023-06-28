Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19EC740D6C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 11:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556390.868879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qERlc-0003MH-5n; Wed, 28 Jun 2023 09:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556390.868879; Wed, 28 Jun 2023 09:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qERlc-0003Ja-38; Wed, 28 Jun 2023 09:47:16 +0000
Received: by outflank-mailman (input) for mailman id 556390;
 Wed, 28 Jun 2023 09:47:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtaj=CQ=citrix.com=prvs=5364a0850=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qERla-0003JT-C5
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 09:47:14 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be1e2ab7-1598-11ee-8611-37d641c3527e;
 Wed, 28 Jun 2023 11:47:08 +0200 (CEST)
Received: from mail-dm6nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2023 05:47:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5623.namprd03.prod.outlook.com (2603:10b6:5:2cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 09:47:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6521.024; Wed, 28 Jun 2023
 09:47:03 +0000
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
X-Inumbo-ID: be1e2ab7-1598-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687945628;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=d1Vnu9lVqRHk4Rkwu4APMdLAew86W/6C1dQPby1f81s=;
  b=GWdbZVJu/lrU+NNK0Y+YVOU9pHWjM8DkabtRwOMKuohCkwn7T4jNefPX
   LOd6FvCVlqZ/+9kmYvuAeuT170eVpv6Obtb24wNUlZOrdfMzJhOZflWqW
   mn7kmDzC2F/C1q+6sWpVXR/a4KIOpPOMtvIOj1FV9njD21dbQ8kU3eF7Y
   M=;
X-IronPort-RemoteIP: 104.47.73.43
X-IronPort-MID: 114463633
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LXA+RK0LlZARoeURtfbD5eVwkn2cJEfYwER7XKvMYLTBsI5bpzEPm
 GZNXGmDM/uDa2LwfYp0Oom29UIEv5WEytdiG1dlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gJkNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIj1//
 sERJws3bx2aoviQg5uycNFev5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Pl2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12rORxn2gA+r+EpWEq+ZWnGyiyVcsCRA1RXGjq/Wd0XeHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSNrmK2YTzSa7Lj8hTG9Iy8ONkcZeDQJCwAC5rHeTJobixvOSpNvFfCzh9itRTXom
 WjW9245mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 hDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:jjHrG6lQYk6DykMZQasl5/Bz8VrpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-Talos-CUID: 9a23:AE95TG6LAkv+TFJ3Dtss1xIlEf0sfUbnzXrJBlWeSk9gcoWncArF
X-Talos-MUID: 9a23:i9CHLgvAZBu3ebZtac2nuGx6CNtZ0quVN0EAsoUso8OIEXdJAmLI
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="114463633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwlPEjIRooAUPO3uhm6Wzn2CEws1yU4MhBt5OF9ZMutXucPlQLZeufj2LHu1Hvg4sxou/s5Ayco1D1idM69WGvUE/tMG9GgYv+PQTYzkTS3ImGr1F518zr4tooeOAzfY5XB+AR5HLGOM0EG2LMyuq1W3yLE3+0YWULzSvAm9A580SAw8mIgnOB/YhKFVoVAJLl/OcIvl2oL2tHTtaMRbwxZOrbU+LDPBZsQdmArCswskGiebm3nQhHZXYwByNLol2FX2yboQDj32n4RJvvgwwvqcDRg8FgxujiJeP/O3RxAu0uweM9kpzuhkck82ZClLhoRqUvyAt34aPmgJfEj6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tqn1k01s1zHltLb+dpIvJoj9VAdEq/o9GGWidjbOZM=;
 b=Fkc+HStL522sMtw8ywOSRgE2lSHHhajpWCpTVNWqPuC+jwKBW4VH+HCiJHvLUlSBrKND7bqV5JszdZbJSiYBZBtEDpVBWTBl9JA6aX/49plc7i9b01PpsltYAibLunzd+rIjwbBqoJlx6epgiz6oNcWf5JRQzyc8oavuUO2EzZw4SrZFqWBmRTYIZ4vNHLqbsGEDOwvLCHmQV3ZFt8I0zKY7NAhIe7JVSHmGcbgY3yct2Vpfi2xA0lOcaPpE1fYIy8X7skrEs4FpuvtBpGA15Vg8SNAXcpre6p7PqIFt2o1BP4wM6Zj2x5bQ3kI04hnMl8MYVDf1R4wiS1g+KLU+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tqn1k01s1zHltLb+dpIvJoj9VAdEq/o9GGWidjbOZM=;
 b=AgSpKyrNpENsMTFpJZeJq5u7xx5fZYvys9dm4/eDFdCgkQtF5FceTu7LtVI9BxLmK6m90w6Bb3pR3HgCgYYgHzFABxP8b7np2RDYSFZq9c+0Na657BA0F4Ki5BUAmm0vXbcm8bvYDdPxhVq+Zm4amGZ/SX8QoSD+krVds1gQxEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jun 2023 11:46:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Backport request (was: [PATCH v2] tools: convert bitfields to
 unsigned type)
Message-ID: <ZJwBkHLwKJNuhekG@MacBook-Air-de-Roger.local>
References: <20230508164618.21496-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508164618.21496-1-olaf@aepfle.de>
X-ClientProxiedBy: MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::30) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: 3675e9b4-4aa9-4cfe-ea1f-08db77bca02c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tsto6ILTO6IPx9jMDI1o6Z4VldkFGg4YN497GQbsrBXoGmWaqEWX04/7Ia+SXqKMYTY26gF2aR8UT62GI78c17Kqj1N4tXy2bB3e9XqKoHhvG18IKdWSTFLGa9UUmrd2uHu79dmF91Rs02IGbEWOvGV+09aCaaTmPppYSaFx7Mr/scEQ5z0siE5oZUlr9Und5i2xCxsdkia0QavyMeN5lCIschk2Luol2QHK0aS7rto0zI1f2fullNfJSz3S/eaK9eyZnx4qb/BHyd6fTGaawflhz3FNf6pq1Zw+FpKF3YP+u2vT5QHL/EzJNwXg1FEh6ksgfvtZabp0pm1fCmd8rwyaGEtyU/GcSp3lth0IyukozTWTQuiEMJgpqGp/7WWS0XHbNmGm+XlL+CKrdkbRRHij3vBZO2kCGJayXXm8lGZc+7Jumcxpxll1bIJyJYNG7gNUhEMytrHkgCg/+H7FCXB9MTaqwpNyrW4el3Z/FejeWMHFKfDxSow1ARpZ6G26EAp5HaQLxKZdxMCXVMZwJlCG0LxGSmie5Pyg5uLX9XDlJ9cfP9r+rvQSC1HmJ7Bk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(6506007)(5660300002)(66556008)(316002)(66946007)(85182001)(478600001)(4326008)(66476007)(8676002)(8936002)(86362001)(4744005)(2906002)(6512007)(26005)(9686003)(110136005)(54906003)(41300700001)(6666004)(6486002)(186003)(107886003)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlowVnhrektINWZGUW5VQzFDbFlQUU4ybHg2OTRzSTFwaXpYcytVWkhHbHVR?=
 =?utf-8?B?L3laZTAxUXV0YWNSUHBDc1ZjMU1DQUdzV1hXWVJBWmEvbWwyYTdUa1dwaThm?=
 =?utf-8?B?TUxXT1hVZmZiMkdrK0ptdE9mOTF6RzBzWEhzYStLbjdLQXp1MmZQa1gvenZV?=
 =?utf-8?B?Y2J6U1ZKbTBCREliN0JNcENGMWwwekdNYzMrU1RkLzhQZkh6TElBN0IzWXZq?=
 =?utf-8?B?TkJnRlpieUJZcHFaRm04andzenZtV2sxMVRIajhZZ21iUFNWRy9NcTZxTitx?=
 =?utf-8?B?UFZPUTgvVllJbk5tYnF1MDZoY1ZqMXExQ0dVSWxmZ1R0aERXWnRha1FTNTFP?=
 =?utf-8?B?RUZ1bnZuTGZta2xFdVd1U0RSTkF5VWR3NEF5azhMRFpBbThNMFcvaFQxdHMx?=
 =?utf-8?B?cjhYaUVHMHljMm1ab3NGNFQwWnFNd0ZqT1lrRUs5TDVnRWVRT0paUE0wOGox?=
 =?utf-8?B?QXRLVDhaSXZmNzlXQzhGNS9jb3creW14dEZDb050RnlWMVc1VmVRSGtuNm5q?=
 =?utf-8?B?eWI2Q0xCVFFpOHdZYW83Y1ZUb1cxazkrTEx1bEFGNTFLNU9BRlFZK0YzZTBh?=
 =?utf-8?B?cU1uT2dWdmFGQ3owbUpCUXFvOER2amFUQWl5TlVFOXgrZUhQMThjb0JnR0dH?=
 =?utf-8?B?STZNSzJIUXllVjlWZWFRaEdaT01NZWszMlNXNjE4U1pYTEpNYXkvN3hGb01t?=
 =?utf-8?B?V2owYzZJWW0xY2JuOFROaUs3d0x6MmVmTHFMWWh4b3R5ZSswanZ4NHlDN1ll?=
 =?utf-8?B?VWFXYXh3ZWVXaDJIV2dDY0RxdGNWaURIWWZSSnRUcjN0OGcyUFNVRVl0c1Ex?=
 =?utf-8?B?MTJLUmNhTFQyUVNtcGhId2dRdi9KNWE0ZTRiWXRVWVcxeE9zWm9JNTlwbWJx?=
 =?utf-8?B?UnVkdU12UkdCK1d4cGltZ0tQK3h0NmNJUVdmRDR0RytlM3pvSXNPUncwbWh4?=
 =?utf-8?B?S1QwOERFcE9GRyt0aVBob0hvM2JCaWliZkQ0SGhodWt6ZTNGODI2cDFzUGJv?=
 =?utf-8?B?YWlsYUxPTXoyOGRmSGdXdzRxaWgxWmdTMm1xaW56NnpnMnpXK1pjWUI0dU9T?=
 =?utf-8?B?VkMvdUZjZWV0T1lGUGxPeWNjVlRsK1RoQW8yS1RuTk01UkVhODJCVmRMQ09L?=
 =?utf-8?B?VGJza0s0QVNKRDZBL0ZCS0NQYUNyK1hmbWpOYUMwdjhZWWZIZy80bGE2Zzh0?=
 =?utf-8?B?MHdmL2dHMGkrcVFFVXh0Z1p6NnRJMmwrQU5iRUJtMDBuRmZEZVFLK0tUeTJi?=
 =?utf-8?B?eC9GcUlRMEdZaElsejFQaUljdWVHVktWS3ZmZUtidE9RU2hMTWYzbUJudEpm?=
 =?utf-8?B?ZHd1K0Z1UG5QMXErenlycG9UMDhyanVXUkl6Ymgvdk8vT2JBYTYvTENrWU1T?=
 =?utf-8?B?WXhHdlZzVC9FR0x1eHgzZnlWN2JkZllFSDNpVWVEUFhDSFF6NUhXUmZTaDJy?=
 =?utf-8?B?OG1rVHRFMUJyR3NFb0JtWHlYc1NpL21PR1VadmZkMmpxQjFzSHlPUkZLNnNW?=
 =?utf-8?B?MG5PNjVYTzFXNVZXV0VoQzN4bXRlZmlUMGRCYVNiRmdGbzM0SjkvMlZXZWRr?=
 =?utf-8?B?Mm1JYmllYWp4bmlBRTF4TUszZ2tFcmxHRTBTaTVFL1RyUTFRb3hpZjBJdThS?=
 =?utf-8?B?QmdMY2FUY1dlclIvbDdqRGNJbjZ2VkdsKzNLelJ2d0pIMER4VjRwS0hkTTRU?=
 =?utf-8?B?QkYxbWtzZ05KN1RhbTZvZEoxY0J4SnJyUHFvRkx4c0NVMHZOQU96U3FsM20x?=
 =?utf-8?B?WU1CcDBqMzdSbDRLNWdpNFZXaHFjSHNJQXBZcU1uZ3lTY2Izc0U2VVFiMjMw?=
 =?utf-8?B?M2ovY0NtNXNzNlI5TDRPRVo4T3h6RG52QThyT3VJZ1RTQVJCbXVwWUljSVZC?=
 =?utf-8?B?RzNPSHBUVXpyQUVIN2k3akcxOGhrMXV2bVo4UDJaMVRSY0Zka2lWTDB3NEZt?=
 =?utf-8?B?bmdsdFZjTC9udGwxRFluR01wTkhEVzRoWGtJNU9VYTQzQXBtU1Zqa2drSml0?=
 =?utf-8?B?MVY3Z0Q3WG03WHowKzAra1ZKSUc5VzR4bVh0UFlRODdmLzdpRit1ZUljSzla?=
 =?utf-8?B?UHN4T2lETWUwd1MxblFZWVUyYms4MzI5b3h6akhpc2djQ0tqUFY4WEdIRTBk?=
 =?utf-8?Q?6ueMlqWHfDgkLAqw48X1psk/F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KPMBC303KIVsOnoKHBAsMrIx4Fy40c2fmtZRd4Gt0xOG93E/Y3+Qy67j1/vLbGh5DEicdIcq7pp9QeJqt5auvs7j3RHl8t6Nc+Kl5HNOt5roF6KZr4lct8D0YjSQjZvipQr4fEwPcGL157lhdQDac9sKOOz3TXQNS5Lfp2CplPHYTkcxbTFc+o3fESi7uiRubfPnb9dTRqxdtQa4gncJhmZz/loWlU0sZclOi8m5E425OtBSh99xJyoYG7P2sf9aVvkpSh+k0VVrxvNdHxArNlxIrwmkaQKF+y9x3/7V0iQ01F9Ik6tSoE55Ahry1Fipgl1r6j2co/pXZ1TspgP5b5mhWIupT+TWb4Aol2xWQB+w0jPGYs+VgJXGezAFcoQS6LI9EnhDostCr2eVSKqDTo8J5/QHSxglKjtzoB5sK9LsX57jOqDJtUTcJRq5ECPmw4Tul6iBdDM133whskKPLU2HmqXzkg0l0afNOUTwRdlh4D5M08E/ul7ybtkae/4so8EwEGrX6b3GRmAmqtYRT2dLhLl4zHqE9mrEhpPV/GhGvuoRaQD0mPxlZuZvsJXK8bddhaS6DPbjiNZXoVuACh3+Bkt9iFSGy8qNMn4EIbWbGSl7fRPaNKUkhcrmQKWiA3KQaFj2EOeOZ5yulNjfWQXuSvsgpE3bX4KQSHzy7bO3HV2O8THS+IPsTd4gAQS/oVn1PwWPtwFCE4XGGLzVW0R5pIJReL7qbmHwRhTRrR6I6Blr1entMrCYyDw7oxRVkLpqf3wu5b6ZBkhJ5drfexeqdGSxY7udeWZIFlSBXMdJcOScsrjTNGus94mygTsn
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3675e9b4-4aa9-4cfe-ea1f-08db77bca02c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 09:47:02.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esDNrX12GddsfKq9njdsGKJhIde8+/A+VpX9sY9aIBUAjVEZVE4TCPkum8yW1hubNVOKkTzEyOuje5ozzwaKNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5623

On Mon, May 08, 2023 at 04:46:18PM +0000, Olaf Hering wrote:
> clang complains about the signed type:
> 
> implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
> 
> The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Can we have this one backported to 4.17 at least?

Thanks, Roger.

