Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F25AF6F0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400061.641628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFr-0000Wz-2u; Tue, 06 Sep 2022 21:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400061.641628; Tue, 06 Sep 2022 21:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFq-0000Ve-Ue; Tue, 06 Sep 2022 21:37:10 +0000
Received: by outflank-mailman (input) for mailman id 400061;
 Tue, 06 Sep 2022 21:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVgFp-0000Cp-1H
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35332725-2dda-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 13:51:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8891.eurprd04.prod.outlook.com (2603:10a6:20b:40a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 11:51:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 11:51:12 +0000
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
X-Inumbo-ID: 35332725-2dda-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCIQAkJ1XB3iG7Pf9U8yolHSHiKhDevwi4qmyZVk07KmJIMoyTtIthp3TUzlrsYJfqRpd8VeX8rC3fV1z1E+CFthFRGSkM18V8lPLoIWVfz5jL2tmMD6F0478sY0hLFC23nQmwiAAVFmYWbOaFSljebDCXz0eczAgrLhhOZ7HoQOu/WzNA3Qo+CCICUJ1UVh5JoBqRE5vko30KZUqAIHTvYFPw79lopVl7Nl9V9P52MLnY2XbzErPtJQjNN8PIywNx50ysdwM7JbtuZFWOSoQmtDiBegcEWS84Qmv4ORkWKVgP2xrmCydOOQul0gQhqwqihMYz6bCWb3gV7XQ9TFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuqUDT6vQvR3rdyDHnxL7NjaJgm9JF/D6ix3Nnbj8to=;
 b=OYFT5i8UX2113QK9/yL3FMA5eEToVgBbzUZOLTkXkfIHNanTflMyqO7vGbY6H21C1AToTrJ5KTN/Q4+n+Mtv0OgtgPXCW2Z9pyTZ4lFN+3F0owgG26p8GRm6GD+c7QbGpCT6huJt2+MwjgMMaRhZklsH+/SBQ7lVC24uABaIWkkoq09Mb0yT9vdlrKddBwA+EkcqbbIJeLWyar8BiFf6JBv8Zn8XyhMdqmWbSBZC8bDlUGn9HL1iiGC+RTJ3y7oh6E2cYwf/cxWx2v8GhlTXhpJhLvkxj8ZGdlUwFffuBB8gcJR7NBaOUI2afvrikJL2K9QKGe5J8mvcqYxHGH/IMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuqUDT6vQvR3rdyDHnxL7NjaJgm9JF/D6ix3Nnbj8to=;
 b=fR0++6Pp/CXqXNYoI/9wfd8XNb5/GdQPkm1HAEW0SlBUWcmAVZ8V9G80waCNm8xZF/NlTSjTJi6PuSXBviVJWeuf1IuA0/szLxZsu1Tj1MfBhqeSzhFtlW+y5u3GTLEpvOXdhWTvojyxaBmWOazg7DAvafWZ6vUl7ktzkbhIlccw5dnGVYKKGapyiHeNn3x186eZui5i4erRxjvissWiLwYh8ED7kqFWMDvg+BcYFI1ewg+hBV8lEeofIuEcXesN5+WWQV/eFNoNp12hoM8m6oQcsa1joPsYuZMHJBjN5EjbXXaawg4vTRYojWTXnlk17ESsuqCCrL59Em03gMPqpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaa43a55-c291-d3bf-20d7-7e58ad784f72@suse.com>
Date: Tue, 6 Sep 2022 13:51:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
 <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
 <3b2ad2ca-3c6c-4dcb-c603-bd5440350f20@suse.com>
 <2dHPPtixTlkUXYEzNPFRI4ezKHSe1A2VaThMjBpd1aM3NFkZQuyRdfmNWCigm1oXfdKhOwDJGoPBBIMLYtYhQlENV2eFVZ0G9EMOMj5e6UE=@protonmail.com>
 <941ccb01-adf6-d2ef-9a8a-ea8fdfe69ceb@suse.com>
 <6JMvOsjmpWkAsnm6AXzNsjtj5_jy5vG_vG_PwTyDzX0z1buoX89r5UEpSGKf-H7CTBtg9gNlq4Icy7Q9OIDjfrxp2AqNMXbyKTCD0y_d0Hc=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6JMvOsjmpWkAsnm6AXzNsjtj5_jy5vG_vG_PwTyDzX0z1buoX89r5UEpSGKf-H7CTBtg9gNlq4Icy7Q9OIDjfrxp2AqNMXbyKTCD0y_d0Hc=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:203:91::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed66096-529f-4b98-5298-08da8ffe1836
X-MS-TrafficTypeDiagnostic: AM9PR04MB8891:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xs2CltwMxslrr20kG+6biNx12N07wDk7KiS4d9UvHcW2WPM3lUyja543ArZDje00RERV9o2whVWOgAayamWUGDxDGWtUnWVezqYS9g7GlQYSVk4LQRwhCMgs8BZq44dLjtckvNy4b8tzauXHXDtDhJZ0maeVKF/uvls1pFNL3sYacp3tC7Cka7CSsF5o6opNghAJU+ThWcIU+98J054NlRZHbwR8qQXArYvKCJLaUeZsAsUX5YkPpkY9tWapIgilygVL8aQH3yX+wS52CYAxppk9n+0ikS6QoLsAvOVQB3dpweqssce8bmu1X5knTJTMH2cCSUFp7yEB5juKiSMGhG939fDuvXe0A+GcIAnltUx+OU5khnuTAuGQWZW1tMqCqumh8AccQFqw/2qBkHY/hfGrQO56VJk8NMnDnoDjCbmJLLEIU4MP5g5IgSBx/D5VuQmpC2CkIOSHKU22W9Ml6YG5Ay0Sf9SDNpQkPAeEITzYxDW8Sna8rCGI0SBj4wBc6bxYWCp9FQva81xI+VTJOFmkm9UolvMcmUMcm8R7piVlK/yIa1A1HgFSA/18zBMM5jwzSbbecUm9r853vUQAx0rRhIwmkH52PuupJGtGCRlqsIUaQOmt88SvPOFQjpOwUHoBMxzQV1haJuiFpJAbv31jmc6fkj+RZltOlt2dLM3NtQHkUXmQH4zSWn80wXYDcwTjiU18szBHGjEaBkYbz1oS83kFPiK2CVi5/id2H+5h7Bqfr/v3P86Vw3yrNvRPguc+5P55nuStpgMTUJZhybYMlGMzwzIzn1lXAUvmP9+3N1Y/X4+1rDFZrKvuF7WGiKjcp/iQLjYMTY5jT0TcgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(39860400002)(366004)(396003)(186003)(2616005)(38100700002)(8936002)(83380400001)(5660300002)(66476007)(4744005)(66556008)(66946007)(2906002)(8676002)(478600001)(6512007)(6506007)(26005)(6916009)(31686004)(41300700001)(6486002)(53546011)(316002)(4326008)(36756003)(84970400001)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC85MG9mNTBxVVBGV0dtQmJpaGJhR2V2ekFDcldEYWV6akFQeWI4Y2F4ODAw?=
 =?utf-8?B?cS9uM0Y2YVpqa2pVN1REd0MwdlJFY2x3MlpOR1R6MG9vSlBoYW1maGhKVVFL?=
 =?utf-8?B?cDhQREpNWEZpRkFKNXhvN3RFdTdDbVdYMURuTE5Dc1FOeTUveEdpNHEwLzVq?=
 =?utf-8?B?OVhXb2ZFREs4Zi9tUklvSVdBZTRxSkR5a1Z5bHJSekFlZ3JQNkhnSWFsUTFU?=
 =?utf-8?B?Um1hWkVpWEJ0VXVKZXJQLzc2bU1yNEQyL0YzWjRmUTNUSWc0Y2JDZDRRNXZV?=
 =?utf-8?B?V0RuTzhmY0k4YkxKUGtyTE1TYVoxN2t2b1RrRFErWE5KdTQ1NURBWnJjZzkr?=
 =?utf-8?B?L2dIVXZOdVBBamFjejJZSjY4V1EvcDlkVW5vSDl2MkEyMVo1aWh0eUlUcFJB?=
 =?utf-8?B?ZFoweWhTMkZ6Z3hWbDZtMm9hbVhmN2RCV0hSL3ZvRjNybnNzeTdZWUtEdGlv?=
 =?utf-8?B?dEtVeWtmeTF1ZFZYSVVOdk1xZE9pUFg4N3ExTUE4Y1BGbno2YkRDNy9WTmtP?=
 =?utf-8?B?SVBNVlIyekdwOTlPVnlOS0MvaDhTWTZoRmFoN1BYTW1NOW9POWptYUNUNnZX?=
 =?utf-8?B?YjVFbHpYSUZnNnJiR2FGK2dxNitacUlGaVl5ODVBaS8vSzNVenVBdzY3WWVw?=
 =?utf-8?B?UGQyMW1HaVl5NnREM1lQSnNkVkZETnRWQjJjTUR3WDA1ZXlTRzZ6OTJUdEo1?=
 =?utf-8?B?N3IzOWQzWkVEeEZSOENpVFAza1kvNzJnODJTazFtUVNzbGNHSzJXWlJ4WWZ2?=
 =?utf-8?B?NHJSbUc0UVErSlhZSHRHVVNVb0pHM2psRDVaMFhMK0dxQXRVaVJDRU1Pb1pi?=
 =?utf-8?B?U0dlT0hvOUV2a0tKRVJNNFBvTzN0R2ZkTlhiZWZseGhwdUdwVG5KckVQeFRh?=
 =?utf-8?B?YjJvMFd4OGVOTUtXa3hYVi92Y3dURkZhSkYwTjFJWFNla3hDWC85UnNlbmV1?=
 =?utf-8?B?TWwyWW44anJGa2RyaDhDYkRhWHB2MHUrZTJjSjJjRytPNllUN0MvZEdFNWNB?=
 =?utf-8?B?NFpEWklJM2NRY0RNTyttRVBOUFpoOGVsWXRaMkN2Snd2NDlpY1BYWlgzQ1Ry?=
 =?utf-8?B?Vmp0RDNsMlhydXZjNFIxZDRwd1cxZVh4VHZGQ3BBcHhzelQydzh0eTAzc0pO?=
 =?utf-8?B?K09TYitZZW00eGRMM1RBUVk4T0hkaW9RK2lXa0dFYmxkcWp1Yjg1cE1GSjRq?=
 =?utf-8?B?MlNuMVhIZ09uN3ZtZ3gyOHhpL0VKMmFIMlo3Wll1T3htQVJTckszMSs1dVFP?=
 =?utf-8?B?Y0pPQVpmMjR3Wk9LQ0N6T1dZdFVGMk5YRXdsQWtqazg0dGF5MHdkanNNQ2ta?=
 =?utf-8?B?bm41aVdMcjkvT1pvZ1VmcHVlUExTVjlNajh0Q2dxK05URXFkTy85OHJCOVkw?=
 =?utf-8?B?RFZXcnhadG9Na1BSdlRvOGt3dXRJMGhXZjRoZ2NPa29ncGtNN2h0dy9DcHlK?=
 =?utf-8?B?ZlVWT0lLbHdyWktvaW0vNFB0Q1FJT3dWVkFESTFmbFdYYnNOZ2dNYVBSZlln?=
 =?utf-8?B?UHplejJobndKbXdvN0FKb01maGVRWmdXM0NZQlZXSDliWXpxa3N6L3ZHc1c2?=
 =?utf-8?B?OVdUc2xreHJWYTR3eXh5MVliWk5UY0NlWWZlZS9DZDRiNnZMek9TQ2svTWp1?=
 =?utf-8?B?N3VaSVc2UzJodGhGZVNnT0dxaHdXL1YvUDlZWm9TVW1wa2JSaXF6NzlXdU9Z?=
 =?utf-8?B?d1FzWDhLMEMyRkdubGhrS3haYndDNHFQYTZiYTlGYUZvemVxd0Y4VEpxN01k?=
 =?utf-8?B?d1RmdXRvYTJnUGdBK0JQcmRPSHFSU0xaWHBpVzFnVmtvVDhCczN4NDJmbGZl?=
 =?utf-8?B?RjRoOTBBelJpMTdsUkJTZGp2dXUvQXBqcEFCVHR3MFlqaTQ4QWczZVFsRlhv?=
 =?utf-8?B?UndlYmdZR0kvWnJlSDlWSWUyNVFQZjd3VkszMExWODJOQTRVZ200WStSY21n?=
 =?utf-8?B?czRKdGNDREtidklYalJ0aTZUcllyMC9qbUJyU1F0ZnhRcEIxOURxb3FwSUw0?=
 =?utf-8?B?ZkhRc1lVbXhidEdTRTAxeGkrVXRHTi9iSVErMEh3TDhTQmYyWGx4SVRWeWJP?=
 =?utf-8?B?WGZmTkszZ0Z3cWNxUVpEaHpRU0hOVC85NjlPSVZoWmIrKzJXeXBmOE5jN1J6?=
 =?utf-8?Q?cYstmGHm3C9Q72yrlgdajbdCU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed66096-529f-4b98-5298-08da8ffe1836
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 11:51:11.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ3HdWizFPyLzz8kOx8R57v0wreLXFNf82b+DIPSM1O0y8zCzpRjSoonc2YzIkjy6wsabaz/6+1s6l1SoQQp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8891

On 27.08.2022 19:52, Dylanger Daly wrote:
> Thank you for your reply, Xen appears to crash immediately on startup and appears to hit the patch

Oh, yes, silly me - map_domain_page() can't be used that way. You
may want to give the replacement patch (below) a try, albeit later
replies of yours have hinted in a different direction now anyway.

Jan

--- sle15sp3.orig/xen/arch/x86/e820.c
+++ sle15sp3/xen/arch/x86/e820.c
@@ -700,3 +700,16 @@ unsigned long __init init_e820(const cha
 
     return find_max_pfn();
 }
+
+#include <xen/domain_page.h>//temp
+static int __init ryzen6000_init(void) {//temp
+ if(e820_all_mapped(0x7AF67000, 0x7AF68000, E820_NVS)) {
+  mfn_t mfn = _mfn(0x7AF67);
+  const uint32_t*p = vmap(&mfn, 1);
+  printk("0x7AF67000: %08x %08x %08x %08x\n", p[0], p[1], p[2], p[3]);
+  printk("0x7AF67010: %08x %08x %08x %08x\n", p[4], p[5], p[6], p[7]);
+  vunmap(p);
+ }
+ return 0;
+}
+__initcall(ryzen6000_init);



