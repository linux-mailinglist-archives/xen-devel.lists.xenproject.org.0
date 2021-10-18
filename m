Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DBE431A73
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212218.370006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSQC-0007kN-Gt; Mon, 18 Oct 2021 13:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212218.370006; Mon, 18 Oct 2021 13:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSQC-0007ia-De; Mon, 18 Oct 2021 13:11:20 +0000
Received: by outflank-mailman (input) for mailman id 212218;
 Mon, 18 Oct 2021 13:11:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tpC=PG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcSQA-0007iU-SA
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:11:18 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0d62e9c-3014-11ec-82d7-12813bfff9fa;
 Mon, 18 Oct 2021 13:11:17 +0000 (UTC)
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
X-Inumbo-ID: e0d62e9c-3014-11ec-82d7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634562677;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=N1t2mbnDUgndlLgcNzRMCB+Uuhk9F1NYyzB50GGqabc=;
  b=TIVCexHbGkHsxxrsBgrjXBKtXZkIv1Ow9ru4tVHq26R+I02MIYAIPeaQ
   4ZfehONu+OaK2Mf6dCh2Unm5pFcO1ftKgRHaG1Htr1kqM0psI/6crp398
   IcpiXUszPUYvo8vYqN4G+ZmkYknQov5cYlcvnbXfD8yYBnnj83YjONyKv
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CnbwzMbpWD1QZ1WySLERW8/JJRKgpGb8zct8p3oVAdBb3bzdZk0bhVTD7+Nib50hB/oHbPMsCx
 ER8T2L+arY45dQIcfgeT61hYAX0SmDHCT26YRHz0a9mEhMoU4npJki6hIlEAQic19F4vjasZRg
 uvzohGCihYEOmTZ4A44rXy0PL+Ye8Ae6xbJgt1eOAD8CEMY/9BJdPrARzfUfqQ1WFaGLKakszG
 3KwM+lYj6rA+X9DcD+/qJqcvCzVD/N3Op45fYKY1mogpoZ3M+aN1Ew1RMRZL1KajegXxyNwHth
 xIY7rRVluB1jZ7NRZiRfmmxn
X-SBRS: 5.1
X-MesageID: 57324714
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wrRXA6A2rcS81hVW//Lkw5YqxClBgxIJ4kV8jS/XYbTApDtz0jRVy
 TEeX2HSMquMamL9fdBzPtyx9UMAuZGDmoNqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550EI7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/lxiNltUp+
 u128qORQgEXLKTDvPQ3akwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqRv4MHhWtYasZmDav/e
 fMLezlWXDODIANgZGxULs08tbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTcIAYGaC89/VqqEaO3WFVAxoTPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHhchmxpSa2hiVbZPtbFdMo4Q6p2oDttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqe/K9WLa1Tw9aDZYP3ddHFRtD8zL+dlr1nryosBf/LlZZzEfMQr7x
 CyWt2AAjrEXgN9jO06TrA2f3WzESnQkSGcICuTrsoCNs1sRiG2NPdXABb3nARBodtfxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4IdwBvWAkeBszY67onAMFh
 meJ6Gu9A7cIZBOXgVJfOdrtW6zGM4CxfTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRl0wADbGjO3SOmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcHoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:E0VbeKq+V2C2nhaliWo0hPcaV5oveYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc7Qx7ZJhOo7y90cW7Lk80lqQU3WByB9mftWDd0QPDQb2KhrGC/xTQXwH46+5Bxe
 NBXsFFebjN5IFB/KXHCd+DYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.85,382,1624334400"; 
   d="scan'208";a="57324714"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBBoV/doUpRFxJRhvjpK4m7xWB0EcQ6CVEWlZSOKLLP11l9q1IJ5gRjVtiPD/yg+GJN5K9WSkBRlWJJmdI6/9hM/hCvKMCLSwfsC8e6SGoYnAWv1ly++1qKZoQM1nBIbqPI3GIxFxSpizaTf/0M56aEibCDIjl+Cc1w7eUiH9BKc2+pcLXhdnEkyCmN7GS+KqV4ePHh1esFAl6I0GfmGFGOQ6sxankJ/5cY7VmuzTo648CXafmV9DZpamzKsSyKSLWjLS+o+Dvpc++//4bacXQxbKB4pNDjAP9B1TgSrNxo5HaKoeNVgj0IMM+5BGo6kqdqSuIz/EjXahDAbMooVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwTZ7GKdwhK81iZaOunI8wN7Z8h1DV50wyJxzgqVrKE=;
 b=VDKfbByjd+DhsyT3dtGoEwnseGCkyKlXHxEKB6cXSuH6ETgHsFHoL6PQPgcpX5aiJrFZQXLGqT6D46JEicfjhqhU//1xV61FzMTebN4O3kb2qYAJFkyeUzNxckh0VyXl4eVvoXrBaDw4+rA6HPb5smtPfunwQxFxSjyQitvH0Q+UYWtE9KuPuB+YyHT3ExgkNvdUJKVYo3uj3KN+MMkOsiYqIgTXXPqOLnG5FvzDrbPmkzQsOKUpFF65Kt2Z49NSV4jaBZ0XrybEN4Mfgsya/b1n1tXKuyrNd4OiZyt+3obpAR6bqddptAC+cmPrK718127eL3PzLmz5T3DmhGGLeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwTZ7GKdwhK81iZaOunI8wN7Z8h1DV50wyJxzgqVrKE=;
 b=Ql8slKRntNUw9OU/C/XKrA/cgDfGwdCmbmS2EiTTic7AfdJafv139Ag+Ns3X19pAapkaQ5N4/iD+U+Ji9hxWDMI0qvbZJDNdX2SGS0GulY7JZn8pXFspzgn5urPBF/DTu+kojZThSHGF9aiICclWJQ8a2cjkRxQ4iBALHedLvC8=
Date: Mon, 18 Oct 2021 15:10:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2] x86/AMD: make HT range dynamic for Fam17 and up
Message-ID: <YW1yU/gogTvvRMMF@MacBook-Air-de-Roger.local>
References: <36df1141-5c3b-6f8a-3a83-1f954b1e27a6@suse.com>
 <YW1BPPVNAVm6EPQp@MacBook-Air-de-Roger.local>
 <3f08e2bb-d80a-3336-d379-a9d76a689586@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f08e2bb-d80a-3336-d379-a9d76a689586@suse.com>
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65ecc96e-60ac-4316-4cdd-08d99238b3b7
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5178AE14FC2C3F7E05EC3F428FBC9@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwwbYmBiXufRej0wMH1g5bx3Xl7vy38qAiinrgrp3ylyaevVbWlgj6A+0tiVYwtDS4BastR5/U1Ym7kmikoVhbS37c7yYchElZm+cur0ZaT+NpjU1XE4IWVHI6UW3z84jcnymX208ul7lzgVbwoUdl883O74OYOnQtWHsVFfhDAuS7BDRPHpyfqILC9s4bhihRJiGPSOc/QVxyQcgc6expOMrdGFVKpzulw89kOSHmnpvGJbvtM2Vv+AUtr1q+Qhh6hcUbmOQfZ7K+7Q33I3UzygnrVuZAcS/GgiLIejj9nIrtRc2qIkT7traId5fk6nOnM9KEhNd2U1/BICIcsprtG+w2xJMRsVI3L6xl8PcCeIvqkzYixDuRfbh7UuQxCG0wCbizYKvZ6a2M4KiJjL9FTO8Ncj+X2+18BzRKVxmTtIfeJO2530tSO5kAzdIWn/vwhc4otQXHpw7ZhLfqDQPVDNsE6J0q1rYVJ7PfSU3t5ZLtvT94C31jEPCnv9F4OtrYQj5UdjoVwEmrh6f16gIdOSwf6W4TXvmpfMCTh5j4r0BI/YbIoGAxV/6qtVKB5nk0Lxl20E9wgOvdtIXy18u0Lqg3D7UOnNylu5ubXNal9klkuGYxooXrviFnpjB5oIQWun+GlHcWZQG10uAjfd8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(86362001)(6496006)(5660300002)(6916009)(82960400001)(316002)(6486002)(186003)(9686003)(8936002)(6666004)(53546011)(38100700002)(66946007)(8676002)(83380400001)(54906003)(508600001)(4326008)(956004)(85182001)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xTS0RabGZjZFUwZVhBZnNlaFcxTjIvSUNMYXhtR0tzckpmSmZZMEpkRTN3?=
 =?utf-8?B?K0FLMTBMaGkweWs2eVhHNjFGWW4ydWt0dVJpd1FJdGtjbFI4T3dZN0d5SVl2?=
 =?utf-8?B?TU9FemJxSkUwVHJCNzcwamN0dHN2N1gwL25icFNSMUdmcHNpSHJYSHd6NEN0?=
 =?utf-8?B?clhxK2czeXNRR1ltd1I5b2tIbVVIUWd1VWcwamRGYVdlS0FLcUM3bXNOelpH?=
 =?utf-8?B?Ri95VkRlYkVsZWswWjExRlZOVDNpYUw4SnhibU9sWHlaSG1RTkd1WXhkWUg3?=
 =?utf-8?B?UmIxbWNUVSs2NUVLVzRJK0ZFVldwQW81blRzZmFCR0lhZ2JkZHVoVnJQVFBS?=
 =?utf-8?B?QXlicmY0L055cm4xNXpod0U2SzYxSWxQeTBIMUFROE5SS0RCRUhXcWNDLzlv?=
 =?utf-8?B?ZnJVbWdPWTkvTE9zZ1RUY3ZGbURFMURUcTVGSHdSZkZBbmphQlNBbjA3OGN6?=
 =?utf-8?B?YmVjTlN4ZVNxSUQ0RkVTMVB2Mjd2ek9NTXVGb0JoS0JpWm9nMEI3dFM2K0d1?=
 =?utf-8?B?VTlTQ3IyVWVJdXVXbFpNUEdDRGl5RWhyQjVacjZFRnRoY3VZZ2NSc3Y3RnlJ?=
 =?utf-8?B?VnZSb2ZKbEtrdzcxT202NFJheTdZcm41NVhDcXpZaU9rMnFuWHgxVlkzRFFW?=
 =?utf-8?B?Zi9PblY4T3dqVHZZbGxkZlc3NXl1S1dTcGhieGpuQ0N6RTNJQ2sxYjdRdDdw?=
 =?utf-8?B?RUNTOEJhT1BKbElxUyt1MnlsK2pqT1hRY3RGNGFEdFVIOWdFWkgzM1BsMmVn?=
 =?utf-8?B?aDc5WnVpK3RscmlZOGtDem10eUtHTzhXUEVUczZVY3YwcDJVKzUveDd5VFNr?=
 =?utf-8?B?NlVvSVJvYmx4Y0t5WkRGblhmK3lkNnhxSkMxTUpCbTdvZnFFWURydUhwUGZM?=
 =?utf-8?B?NjZaQWNUSXNuYnNiVWhTWjRUQ0hnWXovTGtINnAzV0ZiNHNUQ1VYcERaMy9X?=
 =?utf-8?B?OEx3U2l6QVYwVjlaVWRFRE9yWTVuYUU5MEQzRUhmd2lRSTJxcHZuOTBoTDQw?=
 =?utf-8?B?eEZGYkIvVnJkdnZqUEVqeFdFaFBBK211aVU4a3BONmRtczR4VjR1OWdzVGRO?=
 =?utf-8?B?VFJPeWxpYTRsZWZaWUZ4MHV6SGR5b1FML1B4Z0ljOXZHTWtiRTdJZDRCaCtK?=
 =?utf-8?B?M2d2ZHNqRU14QkhTRFFLaFN0NTIyck85eHJCNU0xZG4ySGNXb0FTelY4eUQ1?=
 =?utf-8?B?UWh2WnNRZG9YRFl0di9XWGRDZWhCQzJ0UG9NbThOTUxXNmZGZ2pUWHBPTkZW?=
 =?utf-8?B?Z1RZSUgzM29tQkkxQ3N5UU56R2hxR1J0V3hjbVZJNjNGUlVlQk5DUnRjblBB?=
 =?utf-8?B?SjhOYkllYWpkT0FFK1FaRU1XSHk4UEczanFkYjFxUS9BOWNvUFFFL2kwZnNN?=
 =?utf-8?B?WkdpeHNKL1p3bGxxODNhQVV4b0lyZXZlNnJray9FY09rZFB2dCtrZ09YNW80?=
 =?utf-8?B?T3BiWURmMkZ6TXpxKy9hYzJybG5SRVRaeHp5UWhzNzNxQzRXZmE4d2Vvc0dk?=
 =?utf-8?B?ZWdSL3QyU3dXeUI4NUpWN2dKRVQxZVZ4SjlkVkM4N0l2NytJbHAvdTBFMmtS?=
 =?utf-8?B?dXdROGl6cEV0dmFhRmJwcXZTaDR2QUdTZDBPUEJNZ05mVEhwMWwvcG5TOG9n?=
 =?utf-8?B?VUpPeUJlU0RHMno4V1cwSlFIN2VucllOS0FxaGRMMUdLUEpoSHBwUEN3VVRh?=
 =?utf-8?B?L1BTcjVRVHp3b1ZCcTM5Yzg3Z0ZqSVVvTWtlWUZDZExPNkNQVlAxRmROaklr?=
 =?utf-8?Q?4Sx8iA/k3PSgXurLru+0TpnwHmnjzZykQxQUYi5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ecc96e-60ac-4316-4cdd-08d99238b3b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:10:48.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxEJQc6USaoSXEHJa8ku7wgKNZpPe89Is1qhDP7nM0OUX+dbAISpIGENJXCPD4yVyd5Suu9yM38Yo4MkoAi5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Mon, Oct 18, 2021 at 12:18:16PM +0200, Jan Beulich wrote:
> On 18.10.2021 11:41, Roger Pau Monné wrote:
> > On Mon, Jun 28, 2021 at 01:48:53PM +0200, Jan Beulich wrote:
> >> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
> >> address range") documentation correctly stated that the range was
> >> completely fixed. For Fam17 and newer, it lives at the top of physical
> >> address space, though.
> >>
> >> To correctly determine the top of physical address space, we need to
> >> account for their physical address reduction, hence the calculation of
> >> paddr_bits also gets adjusted.
> >>
> >> While for paddr_bits < 40 the HT range is completely hidden, there's no
> >> need to suppress the range insertion in that case: It'll just have no
> >> real meaning.
> >>
> >> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks, but before applying this I'd prefer to resolve your concern
> voiced below.
> 
> >> --- a/xen/arch/x86/cpu/common.c
> >> +++ b/xen/arch/x86/cpu/common.c
> >> @@ -349,16 +349,23 @@ void __init early_cpu_init(void)
> >>  
> >>  	eax = cpuid_eax(0x80000000);
> >>  	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
> >> +		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
> >>  		eax = cpuid_eax(0x80000008);
> >> +
> >>  		paddr_bits = eax & 0xff;
> >>  		if (paddr_bits > PADDR_BITS)
> >>  			paddr_bits = PADDR_BITS;
> >> +
> >>  		vaddr_bits = (eax >> 8) & 0xff;
> >>  		if (vaddr_bits > VADDR_BITS)
> >>  			vaddr_bits = VADDR_BITS;
> >> +
> >>  		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
> >>  		if (hap_paddr_bits > PADDR_BITS)
> >>  			hap_paddr_bits = PADDR_BITS;
> >> +
> >> +		/* Account for SME's physical address space reduction. */
> >> +		paddr_bits -= (ebx >> 6) & 0x3f;
> > 
> > Does it make sense to check for 0x8000001f[eax] bit 0 in order to
> > assert that there's support for SME, or assuming that the reduction is
> > != 0 in the other cpuid leaf is enough.
> 
> Documentation doesn't really tie them together afaics, so I thought
> I wouldn't either. I was reading into this lack of an explicit
> connection the possibility of address space reduction to also,
> hypothetically at this point, apply to other features.
> 
> > It's possible for firmware vendors to disable advertising the SME
> > support bit and leave the physical address space reduction one in
> > place?
> 
> I don't know if it's possible (I'm unaware of e.g. MSR-level control
> allowing to modify these independently), but if it is I'd consider
> it inconsistent if one but not the other was zapped. I'm unconvinced
> that we really would need to deal with such inconsistencies, the
> more that it's not really clear what the inconsistent setting would
> really mean for the placement of the HT range.

Thanks, I think your proposed solution is fine.

> While writing this, there was one more thing I came to think of:
> Should we perhaps suppress the iomem_deny_access() altogether when
> running virtualized ourselves?

Hm, hard to tell TBH. HT being part of the platform specification
for AMD it would feel wrong for hypervisors to attempt to populate
this range.

Regards, Roger.

