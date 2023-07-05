Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2428E7486AB
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559265.874107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3jC-0001bc-TE; Wed, 05 Jul 2023 14:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559265.874107; Wed, 05 Jul 2023 14:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH3jC-0001ZP-QY; Wed, 05 Jul 2023 14:43:34 +0000
Received: by outflank-mailman (input) for mailman id 559265;
 Wed, 05 Jul 2023 14:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qH3jB-0001ZJ-C9
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:43:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe16::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee4f756-1b42-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 16:43:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 14:43:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:43:27 +0000
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
X-Inumbo-ID: 4ee4f756-1b42-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr+iubOFZXPHM4eMB0oJQfMX6qA/q+a7+RzyrIz/ZFJpBnvIir2BvUwTpcjq1MLZRfzcMVpfgdQjBMxLtqTtKR7IeD1Ajzz94FA44OC9AvcOmj0Nks+s7nLMpzpyIPrwUv3Rj+ick5fVk/zT7QMDC6Zx8qiBe3c1eUyo4IQtg6JtkryemMGViFs23eK4aaOUeiQbw9tl0Wa4+NtCNA0yPVPm0pcQYh41Fgmv+0S/Zk2NDDiigQXKiYEjYVTDIg41Subs7JBGU1ehxZic2qQusu084FA1oU5Kn/2ARxLCBYbBz0kg7oN/wug2aIS6ccFDlCO08JHLlU3wTZosXvfG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llJw1VTo2PuTW6gZLgumHh6+pa58Vf1JrRg2NdUcPQU=;
 b=MYZOwvxVseDBehtNl6F4mQeOFmInpyfyhILpYLhTi/gOpl9GJHaQa24LBDKBOQ37gJlktr5KpPJ+OBNQgZvGF3Jjv9v2EYZGp3cnFqWog6qy2X9HEAuExN+LoWFqtYhSqaMbjKpRJvCipnm7WkpvUNBtd/HwHL9dWGYA/bl7XoMZLwqKxo7Kln4GRnZ59q35qHZQijWMa1IGiEdZc/TchqJKOWP2Ea9g8zyiaf0ZBru9GW+nfDLEMy3stZk//GVxk9aAJyvvePB+fAidCiD0XYx4zX3egSBiNFr3LGjame/iw8reSy8aol8tJMYiCE3pjMsqxi0D/+5o1lEe7uTTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llJw1VTo2PuTW6gZLgumHh6+pa58Vf1JrRg2NdUcPQU=;
 b=lFXC7TT8iRwgcUft7J5kvO4X9y+bkXdYYZ9OwJJuTe0JetRLLJQbBwPuzcpNdVYLGuxpQiatORVXrXFIdLrg8VgZlQHOAljp+MONQQftzJJvYfBvGOWpmLmmE4kNgf/PTRVeSl64um9lgYp5g6WdbrnFv1MPDZfNVoGRaEFKR2ETbTViVyrPw9cYgFlj5pJt/pEwn6seZALAifqz4+M9PXfkJMKNQITpwYLiMq7vD26IYV8kVeRZx6ijPXjL1QuRQxjnMoqHN0yQpHxDXBQdevaUcpKF9rrhgj8yTrEhvE3aUsX+wNvqNxW8L5kOjRIasLNtnrog8YA/TDhXsc0ZnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59e4faa6-7b1c-7d48-64d5-925a618c43da@suse.com>
Date: Wed, 5 Jul 2023 16:43:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xenstore: talloc.h needs to include stdarg.h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a28559-6b68-4a46-115b-08db7d663162
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wSbYCCO+3ufmRMzzJYQmIL5TdV0X0gMYjS61auaR2pymrbcIvdE0zrtlfb1j68+Pb1iLQop3BeGb0khcjlyywt4NU3NQk2stKdELgILtEGJ3n5peS+VjXaNeF8iLmkkBsuEtUtoYocoQwhJKl0fVNKDNqpsaelqGgGA9QuuU46RAVw+10NMLp6d3xj8RiltmBvUiZJgndrPMSzdCsRZMQA4Y6Vapkqm7XNlEXjNsOWcbFZEgLT0Bs3QuBcmA2Udh8aSpdMD4bXezwcx9Ci1i6gajTvOKXmtWQPO7O8P+hjPT590TR4TX39rIAwqzMD4yZqC8aREprJpRbepj77mlvUA+E+I59JUz4FEzFpA4ZRnm6D74RAXlW87U4CsRLEvX1agta2ljMPCsBbwguPnKping6oQVSEMe7q9iY6I3/C5vWnPyw0wKPPGHBZOX3WraH03tMqrRrKuz8vIfc++2b8GJrxrRee3n3Cb8N9m2NW4u11bm2xTkq/KXvU4S3lmOtvSsRpVk/xE3j56OP4cdCmy0oKI2xQ6tAgxHYhX+ck5hQ0HZ5N+v7f829eizVdJaS8Fb+EDWADsHwYsihbtWq51HT8vgqtSLpWQevd+9HT0sgU4s5fGIw88lmoKDWAVctKnqoDu25poPA00IaAGt7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(36756003)(31686004)(86362001)(4744005)(31696002)(2906002)(5660300002)(6512007)(186003)(83380400001)(6506007)(26005)(6486002)(54906003)(6916009)(66946007)(66556008)(66476007)(38100700002)(4326008)(2616005)(316002)(8676002)(478600001)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVJiYWQ2d3IvV3lYcVpQNnQ4TjhoOEhuYlJNVWRSMmZibjhXeWtQakUzNWVl?=
 =?utf-8?B?WlNuL3dWYzZzdDdrQ25QR1YveVFQeVpYK1owZ2FaWWV1cnVPdFU1THhOSzlz?=
 =?utf-8?B?WnZqNGI4cjRCeEtSL0QyYUJmWnVVekFLa0h2K3IwT2F0UzBYYnZHaWVVUk1U?=
 =?utf-8?B?TENVaEFQY3hBSDQvbHJmRTY3VldYN3I4RkRFMHo2Y2xzcVd5Vzgxbmo0Zkha?=
 =?utf-8?B?eGJGSVBiaGI1U3kyV25KYkVaMUhGM1JEM0dqV3lRV2dlUy93NlFDcGNZZCtm?=
 =?utf-8?B?bG5YS3NFanV6SEcwbmJERzhDQ1pYWEhIWVY2dzNwN00vbm1kcVIwVnNqNjdx?=
 =?utf-8?B?Q2xiSU8xVGpOeGgzbmJ2Z1ZjZ0xpb0pESEVIMisrOU52OXdoeElHZE01c3lK?=
 =?utf-8?B?RlJlRXdUcWhkWmZNeEh5TzNEMjdiQ3k1L3VXN2gvSURBQkQ5L3FLODd2QTJk?=
 =?utf-8?B?cUNlWk9GYVUybmxlcE9qc0dvY3QwUjVsaldBUjY2azlUZXRPdVJ6MTFkcU50?=
 =?utf-8?B?bmc0NWw4SUNmUDA2UHZJYmhaMVJyUjZpVGw3cFhldVFjTlhXNFRqd0ZqRVE3?=
 =?utf-8?B?SVl0VFJVSUFIVlNlQ3c2aGpOVUdBMm8wSEhRL3M2OUlEdUhsWkV6a1BkV0Y4?=
 =?utf-8?B?MzhFbmpLQVBDZmdZRGhWbHlmMW5pdGhtK2RLTkFnbUpRNFpCZHBNUjFoaWV0?=
 =?utf-8?B?RjZNUU1CL2t3elJBTkUzQ2Mxb2ozNGhOK3ZxT25CN3pXQXQweVRJOUcrZkhV?=
 =?utf-8?B?cmJjT0U0b3VNZkNhUGlySzRVU1dkeFhsMjlRbzhxcWxIMGhxbDd1MjdrdVpQ?=
 =?utf-8?B?c1dGWUNyb0tkWUJHbzA5UE9PbSs4UU8xM3BYYXV4M3RxbVd1cUMzWHB1dHJr?=
 =?utf-8?B?ZnJUT3lwRnhPRkJvUUlhOU8xVFh3SWlnZDdMWmtmTlZKSDZXemtTZkUwTW4z?=
 =?utf-8?B?ZG1ibklvUDQ1THdheUhXVDU0WnM4MnVYWmhnOVdBcCtuMDNCdzc1UlF2T3l2?=
 =?utf-8?B?Tmo2SHNjUWNvNnNocGUyVVdweWJOWEhTem9lQU9DeDY5L0hHNkl5dzFtVUpK?=
 =?utf-8?B?dkJ0N3lPZTdhZS9CZkgreFY0SitQSnFEb0p1dGxZbkN0ZEJiZ0dHazQ2UzBt?=
 =?utf-8?B?cGJUOWRieUI1SllPbUJ2NWdseUxHQjJnSEE1bWl6RFRhR1NxZFdReCtOTkIw?=
 =?utf-8?B?NVNUaVhCeGRYNm1IVlZ1b2ZFU3Nrc25VZmgxbW81RFJlVVYyUWd5MndzVXFS?=
 =?utf-8?B?L2MyOEdoT2dObzVJNGVGbjVnWkhnc2pkc2ZsalVybjQ1QkRQaGJlSzRhUWxC?=
 =?utf-8?B?V08zOFByNkVNTDhIM25weHlMZEQrK3pTQkh1ZmVIeHl1aDhJM3NvbWxIckhV?=
 =?utf-8?B?aElSbmh0UkE2bm1uRDIrcFBGWkJnNzF5S2NTdVplTkVpbjZoMkhTY1d0ZWJt?=
 =?utf-8?B?R3VocVlGL0hFQUxpR215MDU4T3hkL3pmK2hXTUpEbjZuYXhlamZyVUgvZkxF?=
 =?utf-8?B?eW9Zd1JwdGpOMG9TSGdrRlFCR2w1ZExiR3MwL1Exa1NkemE3YnFCZXgwWG9U?=
 =?utf-8?B?ODVnUkpYL1BLWGYzUmRxeXF6em5lRzZ2OU9ZTGpQUzBieUlKemtFTmtTWko1?=
 =?utf-8?B?cysxaDdmU2xnV3BqQXJEY2NkL0NjU1I4UmtDcWkvOHo3SWNtVmJtMWt6Njlx?=
 =?utf-8?B?bUUwWW9JbWRxOS91dWJoUW5yREVyeURWbEhaSzY1U3RqK0VyN2tERk40MHcr?=
 =?utf-8?B?UHA0RXNxYXF0OHlUaEtvcW1XWDlSeThGQURPbW9pQzZKdGNoZmkyTGk0VDBE?=
 =?utf-8?B?czZUbGNnNlg3Q1JyOFRrUFNVM0YwTXNTUjVMMXJkWkpzdE12dnovcUp6MVVW?=
 =?utf-8?B?OWRDUHhNdG5wSnhQRUtYVkVWenZRT2FvT1FTdXRoT09xMEtocVo5R085M0l2?=
 =?utf-8?B?MjJGNlh0cGN4WTBrcjZQOVNRZnUxaCtGMnM4SkVIcTBRL04ydTdOcmNiWEtt?=
 =?utf-8?B?alRMbkV3aXU2T0JTVzQ2T09iUmlDa3V1YUNHeG0wQXJjdFdTcHZnYUJPQjdI?=
 =?utf-8?B?TzJvZ1NaQUpFczNhOWF4Tkduempyb1B1ckZNNU1MZG0vSzM1K0U1UGhma2to?=
 =?utf-8?Q?GbLYcuL9tBwA9n8xG6SyvQF66?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a28559-6b68-4a46-115b-08db7d663162
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:43:27.3324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vX1+nrN382/BlIFvoynARsZCljfcPsZl993xLS3OFt6IZwCeusRgwV7njngI8/m6hWDhr8BSpc/ZkpK7VVXoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967

talloc_vasprintf() has a va_list type parameter, so this type needs to
be defined (independent of the particular libc implementation).

Fixes: 63b6419d2a2d ("tools/xenstore: split out rest of live update control code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag is largely a guess; I did not verify whether any other of
the recent changes would also play into this.

--- a/tools/xenstore/talloc.h
+++ b/tools/xenstore/talloc.h
@@ -24,6 +24,7 @@
    License along with this library; If not, see <http://www.gnu.org/licenses/>.
 */
 
+#include <stdarg.h>
 #include <sys/types.h>
 
 #include "utils.h"

