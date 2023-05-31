Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA135718145
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541788.844893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Ljn-0006L5-Ot; Wed, 31 May 2023 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541788.844893; Wed, 31 May 2023 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Ljn-0006Iu-M6; Wed, 31 May 2023 13:19:39 +0000
Received: by outflank-mailman (input) for mailman id 541788;
 Wed, 31 May 2023 13:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q4Ljm-0006Ii-AX
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:19:38 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e97818-ffb5-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:19:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8971.eurprd04.prod.outlook.com (2603:10a6:20b:40a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 13:19:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:19:33 +0000
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
X-Inumbo-ID: c9e97818-ffb5-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Douo68h64jgb8n+BkE9pcV8D+uS9X4Scg/4d3LjOeljv1jcKOvcowATvxJtlq8AOqYqJ78KJ4A3UNrBqd/kC4WaVMroRwGg6O9h3VCSN37VHdmJXxXGcclwOemfeU65G1fmdW8NBliCtO0FG80gCxP1M1dyp+oEx5f9hDI7N+6y6aWPxC8SvweTT10Jz6oVbqnHEVeywFB5kI6ubNaNuY2yG2u2+ZRJ5wnMQMZ40J6ldzWN0E2Z4azsNCotiH787elbfRzkDS0tyT9bbCfQwkQ09SFcwfB9PWhgEkM15iZagPu7/NctpwdQ38S/8d74+MxruKO3bEReCAf1KFJeFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP8kQ7odwWV8WY5Lpq9Bg80UQanGlkB+D89ROMQnm3s=;
 b=gD/CL3jsUhFFI6/78TJnbWf7eQQq74lI/gfYnrbpFhZIrW5mG+kzEDL1Ahnn7I5GvlvcrBe42iIqtZzPNSfsl8nbuXGJZxYEwtkIIWbkVsyjW/fIBCcJGk5lisTZlYxKBLbnHP4F4pgGgWADVgpMbwudkLxTlugLkiVdRijvyNH/l6dmD5Rt7xaS5ZeXFUDq8C3teL+T07ZlWJX/RWXqjw5pMqiJlG4jJEAoOwrIM3qZMUxu+fUCUTyZSpBRmSPHJC/Gw9aq9gwpDEofkofs5oUhcJiXI10jGfWdD854swXMRZV5YnqNENUoNwYJebd7iNoA8NyLNI8HeCIp0xob8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP8kQ7odwWV8WY5Lpq9Bg80UQanGlkB+D89ROMQnm3s=;
 b=NIKoKO40KMTksEEnZODKiMmqitCUgN+aWSvqN9I0SMLZ9as2ULQ1fJ8OG79dIGBQQu6D20quTnRwXvglLylGy629BcoO4hOLW5CexcvCA5wbqdkQmlokcIkC2NDnnLdt4J1HsTHcPnIuBf/qyBXQqmwSqkho9bUPHW1T1y38C/HjjDIg8Xv+8Vr2AyA4Nr7faQWNSRLDpRHRKIr5l10zE6xAK7VMx9xHzDJ+ZXD5BzN+lYEAlA3v/KVSBeH0bt9Mqb3idUO0E9tA84EYBl1u/jqIlKmGBirBjw1RVxDntgL4N95sLzMRV0+0qmI76tfAEaskcSw7kRrGVEU0NJAV3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87171ea8-16b0-6284-c4c0-bf0d74fcfc9b@suse.com>
Date: Wed, 31 May 2023 15:19:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: [PATCH 1/2] vPCI: add test harness entry to ./MAINTAINERS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
In-Reply-To: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e12ade7-cbf3-4b0d-be76-08db61d9ac54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M3Jk5R+xEYVyheKIxZHV6SJd5bC2kY3GDT/AD+Lw6bLIF6chntGxHatGgesBORdWG3WIyo2SHCRkljWyl9hRvGDXPXUEqCVDqXmf4Pju2XuVJht//k6IjSgW8ldqyyS7ZmKlPBZDd+4yBUpI3+LEC+vxLi0MXTZ3Z3C475I5n9xxuS2MNPb2JGU2Vn7cgfvN1JUY9J/jcwDvTsAhZRNmqf9bSv27q3bvqmlKzneBNem5nFa5O5vL31zKkmzskoAeasPRGRsmLH0QNgjGPww4XI37lDoYuHqGbpl2rQN6GHmLxdn1E+Gt5P6UQ00UVvMwYH+GY2KxNwfwO8UEu+joyt4A7pAQQZ1GCFcL5a97G/pjJ5xlVOJSfmFgTOmrx3UJcvnhEym1WCdfR8X+DHtS+6k07i6KrsYP8gTj0THGLhjpEPJk9h6gumdB2yZqw3/fYiIGwGekceDrzvH9wSTwGBId4wc60IjGfNJlpsRFXpTTOTupYw72LTRRR1FhIdjDdL80ejdI5lmv8sOs7UxUda/4LtWjSu72pPJZ3O5wYHJ9u6C5QqEBilbdVK7VTjBCorz3ZfbDWlz39S8u51bv4LxDVmMCQGFq60w2l0JACSod3oGzl4RWUJ2+vk8G5QEiacbgLwR3z5euSBPQ0HY37g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(8936002)(8676002)(2906002)(2616005)(558084003)(5660300002)(41300700001)(38100700002)(6506007)(26005)(66476007)(6512007)(36756003)(316002)(186003)(66946007)(6916009)(66556008)(4326008)(31696002)(31686004)(86362001)(54906003)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkUyNWI3WlJ5ZzlGWk9lT1oxZXpoN1NjOWFRN2NkNUtnT0lUNHZXdVRydnR1?=
 =?utf-8?B?cGNNOG1ERnRaQXdzaTMrT1RuRWZTVGtLL2YxbUhaclZGc0o3UjhHc1V1MlVK?=
 =?utf-8?B?cklkQ2JQeFh0WTN1bDdQbzFwelcvZktHazNSS20rd0IxL2ZGUmlIQjUzYkJN?=
 =?utf-8?B?b2pwZTVJZlBJM3oxbkZKQStmYjlRVllrSjRUSTUwZUpTS0FENEpnNVJ6dTFY?=
 =?utf-8?B?N0lQdW1PaCtDUlJJc0tYaWdEbSsrcXByN1ZEMjBUMjUzb3ZjWnd4dlV2Nlpw?=
 =?utf-8?B?MklCNDh0b0xFcElUd0RWYU1kREg2OGtHaS9MTGNxdGhSS2hMc2V2OXUwNWU4?=
 =?utf-8?B?MnZOeWQxM2lpbUM4QnQwMXdEa0EvZVFBOGhhZFNHK21RNVYvRnVMeVNxNG5h?=
 =?utf-8?B?LzdJNElXVVV4MlhrY3BvWnFQVFFYaHZRdTA3M2JPd2YrdlBySlNJYXg5TXB1?=
 =?utf-8?B?bDNqUVppdHBnNms4RlgyUjZWTEtuMFZaRXVxUkp6K0toa1FUOXFCRGNEU0Vy?=
 =?utf-8?B?NHVONnF4UHVwWjVSM3Z1VnlZSnJ2SmlENlVXaEtFS2hFSkx6T283VE1ZNlN6?=
 =?utf-8?B?ZkdZMG9ocFdhTmhEVHhTZTNsUHMxTnNobFROYXo1VWdWTlozL09tYjF1dFUx?=
 =?utf-8?B?RVVWaExVd0VDMHg1STFEcjFvbHJaamZNMjA0YXVlSjE5TmNQRFVUZDVYaDVl?=
 =?utf-8?B?VW1OWGhuRzZsdUQvaHcwY2hVWUlMdGM1ZkxxWGJCWE10VGVNbnlhRVJwMDdC?=
 =?utf-8?B?ckUxbHEwZ0cwdGIweFhKWlBGd1pkYlVWUlZTa0N5WDNmRDdabHVnV2pQSDFa?=
 =?utf-8?B?bDY5MlhiV1lOTUM0bURFaVAzN1ZKVEJsV2dLcjhUeVpmYlJ4ODcrVktkTmdP?=
 =?utf-8?B?N1M3SThVQ243Wk9qMFFYOWErTFd6U1RzdzZjUG96NUxIN3kyWmhUUlJ3V3Y3?=
 =?utf-8?B?MFBhVlBBUS9nVGRJVkRBQnFmR2ZIWkxUK3llUDJyeXdnZUtzZS9aeG83c0dr?=
 =?utf-8?B?ZE11eDBwdFRxY1hKQzkrdUtUZGFpQkVMbGN2cVBvclpOQ3ppWGNQVzljZjJo?=
 =?utf-8?B?N1Q5OVF6YW95TmhzS1c1QllHOG5IdkxSNnY3Qi8yWmZmT0Y2cEVzZE43TFg3?=
 =?utf-8?B?OFZ5dm91ZlJWWWtiZFF1c0g5QVJCWDQwVm9Ed3RkSnpKb3QzUWFxaSt4RExF?=
 =?utf-8?B?bTBwSFVQREhBTVpWczgycnA3RHVUbGsrOURFNUs4MXVJU3dJUHFiYWQ1Ym90?=
 =?utf-8?B?MkJQU1E3d1BTU0YvME1Sa0hibW4zRmdYM0RLbzR0OHczNVkyYVk0bzNranZm?=
 =?utf-8?B?andhN0twSEY2L3BXMXNaK2FmQ1BaZWVmOElSZHJrbDdxWUdTamxRTW0rYzBY?=
 =?utf-8?B?MVl2eXBBOWsrZjdIUzZNNHNlSm9aSmJGMm84eXRidHZKZlk3NDhGMVVFT1oy?=
 =?utf-8?B?ZnRUdXZudGNTZFlUSk9remhkZkYzWUdmWGN1eWkvMi9CWkNSVUp3NHNCWXhx?=
 =?utf-8?B?cUp0S3g3Ym1GbEFYQjFrYzRZaDE0UG9Dam1md2g2VXlUNVVnVlEzaVBsZ2xT?=
 =?utf-8?B?d3dHUmc4MzUvTTlBak9CdDFYOWs3dmVmbzA1NkNCd3dMT3RGMitjNmR3ejJO?=
 =?utf-8?B?bDFyY3FEZnNoQ0VzNCs4VnduNGdhMHF1T3d6amtLQm9ad0YrK05HTlh4ZDd5?=
 =?utf-8?B?SmVXeklGeWd6dmUzRUN5bGgxRWlFQnU1bis3aUIydlJYUWNVQ0NyMWgzaUJM?=
 =?utf-8?B?TEF3QUxaaWp3SDlwemZuVTNBRGNIVmcrTDl6UXhvUWVxU0VKSi9rRWJweGIx?=
 =?utf-8?B?Y0FFNnBVblBiK3RVVFA1YnBCZkNFR1IyWHF6anlicitYWldMN2lCOXhuRm00?=
 =?utf-8?B?RnROdFJ0K01nakRiRk5jUlN2VUg3M3d4bUNDVEZFSDk0T2gzNVprQTZqTlZp?=
 =?utf-8?B?alNpVUt3MFo0T09pQjdPN3I4SkF6a1JzODVQWE5SR2ZyMWtDZlI2YnU0ZjVa?=
 =?utf-8?B?L3RNdDJJcEEyVkNiZ2crZHcvYnVRUk1aUEdEUG1IT0NxZlo5SDhOdFdQamxj?=
 =?utf-8?B?bjd4bURmRFNlZmJ3eGZnYTVPSVFWeWZMQTFoM1hBM2tSNzlESzk4SzdzdEc2?=
 =?utf-8?Q?kbjhZSdXoNFbL/1WP53WoMkdw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e12ade7-cbf3-4b0d-be76-08db61d9ac54
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:19:33.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xyWDxDDzckHU2K7JxKnqCsX+926SGlWFx4mV8JetraIe9kZ36ONnXvZWl6ruqOMzRpFr4XBazC3danLG1gmSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8971

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -568,6 +568,7 @@
 VPCI
 M:	Roger Pau Monné <roger.pau@citrix.com>
 S:	Supported
+F:	tools/tests/vpci/
 F:	xen/drivers/vpci/
 F:	xen/include/xen/vpci.h
 


