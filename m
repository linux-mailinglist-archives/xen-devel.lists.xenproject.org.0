Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA324ED6F2
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296814.505373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr9e-0001DX-Nd; Thu, 31 Mar 2022 09:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296814.505373; Thu, 31 Mar 2022 09:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr9e-0001Az-Hh; Thu, 31 Mar 2022 09:31:46 +0000
Received: by outflank-mailman (input) for mailman id 296814;
 Thu, 31 Mar 2022 09:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZr9c-00013U-SO
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:31:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60d82a1f-b0d5-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:31:44 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-44fwi6iCPzqeDl45Hw4PAQ-1; Thu, 31 Mar 2022 11:31:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4785.eurprd04.prod.outlook.com (2603:10a6:208:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 09:31:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:31:40 +0000
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
X-Inumbo-ID: 60d82a1f-b0d5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jBAjZm98iC0F+YOWTsR9A+UOqJAYXH4F89jCY3IBJtM=;
	b=kE3FC8q3m5VsNYu9ZPsK45C1XyC0i42v8vSGSyvz10mg0h0eS2PmhahRBt3baQqH5nfQzg
	gdN0wzpsGh1NOJOr/vVyE0EkuhL/KB/8A4NcDL///zwZTOv/GEC2nmumovwccEv9C4W4x0
	NIUtuF8RSOAg+1Rf7MaZjHhhe6JWSY0=
X-MC-Unique: 44fwi6iCPzqeDl45Hw4PAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWSzYQcP5ZqG3Qi3jahptgK2O58ET3PmQl1yPJyoFoe+vleYXO34scJlHOaTGLnWXl6zAhLIbAVBMVvwB4ToGGYC8ImvLNxGcfqBFxe6RKjaPpKjtrmnibAK5V5AMW/bGVat3mASL8BLKaTqdUAR6r7uQi8oMwkJmUdIJVGxIypWsGwHbzkeYi+aopnQ3VmzxD+GhcDvh5WvXMWDLh1/NXxQ6tyy3UPZ2t6nDfzhfVnuTkXdHOOrrN7CPRvsEwOSWr7QdJOmK8EhWg4CEnwHrwaQ0fTFl0hs8ZosvqEoGUivEPiqCeQcwHeeXkRVpdfImV2EXwKFQUDnvnX57Sgw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBAjZm98iC0F+YOWTsR9A+UOqJAYXH4F89jCY3IBJtM=;
 b=bHjVanWlzBfP53Td+x0yDE0dnh1+aPixi3xC0EZxcWIFgzD7K6ZzgAWkZFECB8fsctseuzVavRXqil7gGvHhpvm0V4XXXPR6FnAhvjfzgIt9d9FT4Qh2Irgd0Vc6BcxozA9F3uEB71WAqLw55KM1ocV3GicQTCHbtvWXLxiGQjIsThwwrX21rrCCG0S9S0hwpjtXAlQ/Q8oxGsYklaBzxKiWGbZlTrr6bxHhooacrp9f3nwuTDnuf2qo0FxKppXPca6YwRl2/LFCsqpKxmJ/hbHZ3w0obtjbfcOQzTiB9syjsHn1pW1y7i4zaf6/LwPqHoppKBL++EMu/H6pPWbX4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bddbec0e-acc2-03f9-fe4c-167fa5ac0ea1@suse.com>
Date: Thu, 31 Mar 2022 11:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 4/4] x86/time: use fake read_tsc()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
In-Reply-To: <6e540bc9-c536-84ac-fb1c-8271e7731b3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0103.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::44) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0446f779-4413-4d46-3a53-08da12f942b0
X-MS-TrafficTypeDiagnostic: AM0PR04MB4785:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4785B6F642300EC5E06E4808B3E19@AM0PR04MB4785.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7s5WXmuCuH1k52f7osJEVgijIzkREF+2IO6Y0ycz6azJ5UnACsmWqPvaRI7eUZE4Y+KPHOQl1whNVZd0YFGSUeSuqAZb2ufHE4AIjSStfAsXrwGwqNDI+wuM4S9xIP29CSsRNen3maPaVemZ7d7biAfSEG9QuyQGNZwobb0BzEL2MWsluuZEjLo1akOI0XxAAASR0QmNiW6ka/o5C9p/Z/H//jFrlS6O3MDG8cwkheHOFFExPkyZnLmstvNTy3gE4lCuhUcT4q+9K3DOFSGAOn5BNzmiB0dH848W9GWZCBMwjxg7QCoopIZZUiY+ec0/1iAtmJAh1DPfppX5v6RSR1wIoQU7bdKgFIzkhQWOJp9J6M2BScXvbENHx/7qYYAkzTGLKtLxjh8gq5ZSG20m6OMPQnUkCvjvL90V9JZNPmW3h2Ip4tEKrMfhSUG1Dtpx12ZhfhlC3mTiEGNOjzTu792PVrQoJ70Mm0kCx9Kyu49Y85JD8ZH8WeZjqU2Z/O2WHD36+aWtkZclsno+3CapwFkFBNTcAh51CjOmOGspxwlJxDQ7BMgtVWKSomXvKH2zhjPVGR96Tdl8hKo/vhkTYPaWCdAfaTaeAslZgAZM58pIT5j0ctIjJudmZKbO9JfRyxEhnZBpdVeyfNA0nXAyM4DrIfV0fbn2Yt6xtOL3mFWMD7JbSoKjI9iD7VQx2JFUze+nE4myxU0ZyBl3qGgJizNy5gK06JDulgh+K6Ps+tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(186003)(6512007)(6506007)(2616005)(31696002)(26005)(38100700002)(83380400001)(2906002)(4326008)(36756003)(8936002)(31686004)(66556008)(66946007)(66476007)(5660300002)(8676002)(6486002)(6916009)(54906003)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0l4bEZHSUlMQUUxbW83TlVxa0lXTFBkdjM3QThnOGJ4azBqUTQ0REdURG5W?=
 =?utf-8?B?dHIvZUVlV3JkSkxSSGZXTFF0R1FNMjRGOGNiSzNmTmNObVRnakNUZmlnMG9n?=
 =?utf-8?B?Ti8rU0JUdy94UnkycXBSTnVRN0IrSXM0R3NrRXA2ZlNnb1JrMTI4d1RxajlD?=
 =?utf-8?B?LzdqK04wQ3poemdKWElydTRBemRMclBjQ2V4OGhBVEhPNTVpZ1JKNXA3Qzht?=
 =?utf-8?B?cktpN0k0Sm1BZ0RoZWxwVUZRTGFBZ2VmcmlOYVovNG15OG50Q01KaFlLMU1H?=
 =?utf-8?B?Q052YkdPQkRWQmR2ekRvRnZPMFcwQ2FsRzhoWE5CMktLQk10Qkpxci9hdkkx?=
 =?utf-8?B?MkowQkNkaFV3cTlUSndFN05SUmdnNkZnQWNXNnpsSXQ1d1BvWEFSQlYwa0px?=
 =?utf-8?B?cU1lSU1hNFdZMXB2SFdxZTFTU3pNNTB5dVRITmcvYm00ei8zdDNMeFY4eVM2?=
 =?utf-8?B?Um14UkJOZzRnRHlya2lURVJtZmUyUGdzMU53UmViRG1KV3Y0aHlGaTZMdENN?=
 =?utf-8?B?NFgyeFRZSzl3eExxdHdyT1ZzRWw0OHhPdEw3aHY0Rkx1TGJ5U1FFcGdPbVYr?=
 =?utf-8?B?cTFhWllxc1BYYjVKdlpCM2d4cTZWcDNUZ2JwRTZOQUNZTVNSMXAvVGh2U0pV?=
 =?utf-8?B?bUFRcFg5NEF6Ly80OXJONmhqU1BTWHUrVXJIZmM1YkprRlBqV3Fpd01GaXZj?=
 =?utf-8?B?c21sOTRjSllQQlUxZ3JRLy81ZDN2ZGRWWUluQmdKUzA4SEJKMzRpemFqZ0x4?=
 =?utf-8?B?RmJ4MlFNS21LY3c5Q1N3aWlGU005REYyd2VHNUVvMVJtVkZ5TWxLbytyOHVV?=
 =?utf-8?B?aU4wZWoyS1ZHbjVpUWo3Z0pOVnBtY0dBWjhXM1V2a2dwa28zdnRpSm1IN21B?=
 =?utf-8?B?OXRYaGVFblF5Yk50S2VLaGlZS3NUS0FpdWZnU2NQV2I3SkpMdG96bU1vU2VJ?=
 =?utf-8?B?MHBkQzVCdmxsaG1GZ1NJa2RHdGhLc0M3dGdEUzk5R1BiN3V3ZGR3MEtuRVZq?=
 =?utf-8?B?RUdkSG5RTitCQm1tTk8vaFUwU294dUFVczVmU2FueG5VRXUwVFV4ZXhRTG50?=
 =?utf-8?B?MWZsenFwN3d1VjAvWkRlUTFtWEtSNFhaK3FFTjh2K2lTTjE4NUxYRmw5TE5l?=
 =?utf-8?B?SFBWUGZVTTNjelFZK0dnZ29LckoxdWprdmJEWURuU3JtY28vSmdqRzcvd1Bt?=
 =?utf-8?B?N3hrY1hqSThlNGRFdnFZVTVPQUdwSzYvTWRIZDdUbzgwTU5qWlB3R1JiUC9t?=
 =?utf-8?B?L3B5R0JPM1lSSURvK1J2S1R0Z04yWXk2eUg3NUJFTWZvRDVaVitXV3EvRkRE?=
 =?utf-8?B?RzJCQ0NTRTVpYU12V2JWSjVjNFFRQU5FeUtveS9weTVYZzBTQWlDdU8rQ1RJ?=
 =?utf-8?B?bWUvQVBnN2diMG9HSjdCZzFEd3o5NE9yZC9EMnJoMW5BWkNGNEQ4YlpidkRT?=
 =?utf-8?B?K1B1aEY3YmpUUnBTM1N5TDBOcFl2OHVKWTlOT1p6eWxpd0pSTnFFUTlLbjQx?=
 =?utf-8?B?VXYvWWdJSlNpZDFvVCt6U3NPNUNWUHFLN0tzMWd3NWZXUGRhbGtCZjY3YnBo?=
 =?utf-8?B?SlQ3bnpXNzdtcjVIVkZLVHppOC9zSWRxZVREUmY5UFVkeFNHd1dpd2QzaFJK?=
 =?utf-8?B?VVo4WkFSLzM5bHV6WU9lS1dJMFdiVlNCTjZYRGVtSWRMaEhiVEpHKzhjSUpw?=
 =?utf-8?B?RkVwcGxpMUpXVFlqNWR5OHJTYUJmcWVFYUFyRVdVcGlzcnFEeTA3ck5Wakdo?=
 =?utf-8?B?N0N2RFBEWk84MGlkRE9EQXBiRG5jaFVPZGxUYU93SU5TeHVIeEc2UW5vZUhG?=
 =?utf-8?B?UC94dXZuWFl3NVlZZUpWYUk1NU14Tlk0Rk1MemUyb0YzaTA2TEFNVHFQRzkr?=
 =?utf-8?B?SUZrc1FyRjFHRjNpM0ZsUnYyUmlUOHlEeFQyS2lKVHJId0l3cGd1L2hiaDl1?=
 =?utf-8?B?Y2Z2TFc5RU5XYmpOYzNVUjlXZFljSU9DZUxzaWZ5MU5wa25BRlpSaDdkWDho?=
 =?utf-8?B?NE9mS3dib2ZQMzdKV25wNkFZcm4rY24xWlFrNGdwYyt4MkU1c092MHFaZGQ0?=
 =?utf-8?B?R2d2VzhzYXY2QWx2MG5RR0RDOW9sYmhZQUZVTHVUZFVPMXNNbHZXYWJSeUZy?=
 =?utf-8?B?Tk1PbjZIenNLMDZLUmg0eHdvSnNiR25jOVd0WWU2RURzOFNJMXZpVTYvQWtQ?=
 =?utf-8?B?OEtDWldXRUtSNjRzN3dPSlRpVVJTc3puZDlmUlo4dmNFTEtURkJMTXJQZTJi?=
 =?utf-8?B?M1d3VmlaZlVYVlFNZWZXZk1lejB1aUhIQk9iNDRSaGQzV2EvcWQ0SGVvanUr?=
 =?utf-8?B?RklDa0tWTXNmSjA0ZUNUMnJHaXJQQVFjMi8rRkZaVDlqU3E4K3FIZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0446f779-4413-4d46-3a53-08da12f942b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:31:40.6047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pJUU8K1n3ZWoN9DYd9ZTpFlnnkdLXvGJ3md7w+6azy/wFkwuU5JwdxE71jXbr7KxcK51QDiT+a3EDJW5SSRhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4785

Go a step further than bed9ae54df44 ("x86/time: switch platform timer
hooks to altcall") did and eliminate the "real" read_tsc() altogether:
It's not used except in pointer comparisons, and hence it looks overall
more safe to simply poison plt_tsc's read_counter hook.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure whether it would be better to use simply void * for
the type of the expression, resulting in an undesirable data -> function
pointer conversion, but making it impossible to mistakenly try and call
the (fake) function directly.
---
v2: Comment wording.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -607,10 +607,12 @@ static s64 __init cf_check init_tsc(stru
     return ret;
 }
 
-static uint64_t __init cf_check read_tsc(void)
-{
-    return rdtsc_ordered();
-}
+/*
+ * plt_tsc's read_counter hook is not (and should not be) invoked via the
+ * struct field. To avoid carrying an unused, indirectly reachable function,
+ * poison the field with an easily identifiable non-canonical pointer.
+ */
+#define read_tsc ((uint64_t(*)(void))0x75C75C75C75C75C0ul)
 
 static struct platform_timesource __initdata_cf_clobber plt_tsc =
 {


