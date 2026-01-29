Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO6IL9qbe2m5HAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:41:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC48B31D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216957.1526850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlW1L-0002ou-DG; Thu, 29 Jan 2026 17:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216957.1526850; Thu, 29 Jan 2026 17:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlW1L-0002mY-AI; Thu, 29 Jan 2026 17:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1216957;
 Thu, 29 Jan 2026 17:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlW1J-0002mS-Ri
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 17:41:29 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba873408-fd39-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 18:41:24 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH4PR03MB7603.namprd03.prod.outlook.com (2603:10b6:610:23c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 17:41:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 17:41:21 +0000
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
X-Inumbo-ID: ba873408-fd39-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp8tWPYOE3lWc4aBjg2VNx/f9KtQPdKh/LiSI33HtRoQ1fQWYMUgVyrAhvI02vNcmLNC4JK09DwMZuNvfuSjblGW8XWwKL2LgF3qYeF/MJzW07gOQZpg8o30/0TOCEsnPEQqSdAgwJt+3uYXauCoS41DG0qQfXB/Mm2m249PZ0XkL5D7Q3yIfQBmoTdU4xpO5Bjhr3ZVIjqMo4OkZEkOs1baZkUvwXgP3qYHcWN8N4K7fEZhbhw8Iu22fvvJxuQH5/tQjsG8Wqyhg2/+7DZ4iclQeo6h+/TyMt2lZA3d+3vWmP6v3mmSoJzSJ8q/DMFzousfRwvzYqPEK2TbRZGCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiqXL9W6hAWngzdxVBW/2/UPd4WslBMeLjVSaL0Wvz4=;
 b=GY67TgaizhMqQM2dAU8qaQhtfdSD00ilcNh4dMZEx+Afz9ayDp7amxb5E8wGnowqVuT9ZY5wG9HxLGDMA62Z3cPMzV6war9i8jI4aH2c7+Na/b0H/PdcQffLSBU8NSOtNuqENNVJ7SdmLkzDCeXHCjwVgqC8qFNTNKo76oOtJhSqk0LZzn+9nhPM/BPsFowQ7AhKcatm6R6ws9rh527uEx/6W7ssV79CEFcfvib8+aMWdjFw3VYDCj08FCP6vsNkSDPP8/DmSuAO/ELapuLcf77wfZuleMm9WTPaD+W8doqGVc4ENItswSIkim0zbUzwzsB3dtA6pzyk9BDZnZPSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiqXL9W6hAWngzdxVBW/2/UPd4WslBMeLjVSaL0Wvz4=;
 b=JKFtUHYx1Hzr5yUa6W5KER9kQvzxNfyZq85FbNoLjRRb/Gbs3dI6DA2iGs98no0n1KXH8OdOCGKILh1toEm6t/W9hpCRYXxr4K7Zr8qOqKdD7W3R4JxidypYCAw3iBBgj8Om4uGjPuKUfXN3hqqhP6sRU1NSGtd/gD9ocw5tH9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 18:41:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 6/6] vPCI: re-init extended-capability lists when
 MMCFG availability changed
Message-ID: <aXubviEH78wFkOT5@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <d6f1c261-5af7-4fcd-b95f-af8baa67ba64@suse.com>
 <aXt_Z4INxG6fgsjx@Mac.lan>
 <45ea72d4-bbc6-49b9-8d29-d18876dd187d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45ea72d4-bbc6-49b9-8d29-d18876dd187d@suse.com>
X-ClientProxiedBy: MN2PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:208:160::29) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH4PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcfdfef-b566-4593-5cb1-08de5f5d9d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHU1cXJnQUtLOElEVU01NXpuaXhLQ2YwTGNScUs3QThBL0JTR2hIblQvYUtI?=
 =?utf-8?B?bHVLMis5clhFSnRPdG5IUmlwdHdzbFlySnF6ZjFtanhvRGdJYjdWbXhyRGpQ?=
 =?utf-8?B?M1JBQUFaTEZTMERUZWdqem5PbVRmb0FuZUZMTEJFRThWZDMzK3hUU1d0Q3E2?=
 =?utf-8?B?QTVYbnNqdmc2VlR0NGlzYUs4aGxTa1h5d3FVSmp3anFIYVZUYW1xV2JGbVpS?=
 =?utf-8?B?eUFRWXRSK2pGSndiN0Z4Rm1OekxPR1BrNmE1L2tpclovY0Q3amZQV0FKcDlX?=
 =?utf-8?B?OUtnelU2SDgvc3FOTlF6emRPMjh3akdoQi95ZXR0ZWd4Z0FBRmxKVm9mckp1?=
 =?utf-8?B?dWtwYS95NkttUk05Vlp5c1NZQzB1bnl4UUZxT2RMaHMreVkzK2JLYnJwd3NK?=
 =?utf-8?B?MDRuOU9BN1NweEdHQ3llZDBSNzZPT2t2WGFiZWVicXl6ZmhIM0pPRHZWYlRJ?=
 =?utf-8?B?dy9KQ0FyOGpnUlRPLzBsZVRiV0JNMkthenNFdDBQS2tuR0c3MlByTm9aYW84?=
 =?utf-8?B?Z0xhNWVTUVY3K1FGU0VtZ1djUE1LWk4wZTlKQ1poTXg5ZzVaSUpsVjkwaXZ6?=
 =?utf-8?B?bWJSLzF0OGFCOVdKU2VhUjUzdnJieVhEUFQwT285SXErOWtoNEx3NkoyTFNy?=
 =?utf-8?B?bEN4V09IcW0wSXJNR3ArbWZTWVhwRHVDNnd1L25EenYvTmpoT2RHeXo5QWYz?=
 =?utf-8?B?aENGUEgxc0JsUERlR2lrcjFlRUdUWitMQnlkSEViRUl6QlJVbys0T2hjeTIv?=
 =?utf-8?B?ZGgyd3JpbzduSVFQaXAvdXVtaGIraXMwQ1BWMXFWZkkzd3VkWm1GODlqWEd4?=
 =?utf-8?B?RnBLSGNTVjZsWVYzY1pObWxJQkphQUQxK0FuMTB5UG5Qd2dJN1hDMUdxMzJh?=
 =?utf-8?B?ZXZRWW9YTkFsVGE5ZzJaM2xiZUUvY1kwZnRnM2hKQ0FxdmYrUGNERDVqLzcw?=
 =?utf-8?B?VG45bCszekdsZjNwdk0rU0lVb200MkprK2h5c2wzQXdrQzdNYnlHa3RaTStO?=
 =?utf-8?B?MUdhREt5Z0liZzNYWmJHRGpLVm1CQ3FJYjNQVW9CTUM5Y1hYKzBiQjRNYVhy?=
 =?utf-8?B?dGtaZFlhOVBJM3hna090TFF0QXFCM1FKQ2gydzdQOUpJM1M3WWg1VE80WnJ1?=
 =?utf-8?B?UnNFSENZRmtCRUJrYys3MVFFRlNyN24ya21GSDlCY0h5UTJKUXpNQkkxR3Vl?=
 =?utf-8?B?SWt1aDNWOWR0L0w4MzBZS1R6dnNNSWdGVjZ1K3NUZDFzRmcxQlhOU24yKzJv?=
 =?utf-8?B?alhod3BZM0ZZVno5R3ZCTWFoK3hUVG5VaVBoL01LVFRMRUVMVmpYU0U0MDRy?=
 =?utf-8?B?ajNGbUxocjJsMGJrZ1E2YWNnT09kSjZzd1FwRTdRSng4V1ZiYVNPQnBWNkpD?=
 =?utf-8?B?cVdPS0RYUTE1WWtnM3lVcElodksxZXFITk9MdHhWMHFPRnluQXBiWVhTNkpY?=
 =?utf-8?B?ZHlPVGJUQmNwZzhLMHY4bGtqb09rR2Z0R1RIR1FkY28yaE92SEtFb1dQYnps?=
 =?utf-8?B?SVJjWHhtWmF1a1dYR1kzUi9tdnJVZ3ZNWGFPMEVCQ0F1cThFVUF2Y3kwVlBI?=
 =?utf-8?B?cGJvY1RJc2ROQnhOeHYvVnU5SStzRlFxaHluK0xKWGpFbGs2Z2ZqUlF2NitY?=
 =?utf-8?B?eGVqaGFMek9aQlFGTzVGVXBZdW84bWc5aXJHRUZ1NGdDYWxlSndLb3cxTUFL?=
 =?utf-8?B?dis4aTFEL0h4SDRuRkloVWdwdUhubmEyQ3ZkeHMwOUV5MWFubHErZGlXYWIz?=
 =?utf-8?B?L0FmRXdwdXB1SkVpVDVvVzVhRG9hOEp5eVhUVUQvLzZBcnh2eWJkZ0FiS3lk?=
 =?utf-8?B?aWl3dHNIMkthWERibTd6Y0Q3MmdUZEhlQVkyMFd6UlRhelcza1hkcEM4Smg4?=
 =?utf-8?B?cGV4NEhHb2N3RVovdXFpcm9CN0hwcEZRTStnRGFlQUpWVUU2OW9oMmhPTVJQ?=
 =?utf-8?B?QjdTSm1BYjBRYXowa0d2UlpzZW1aakx4V3NzY0dYTlJnSGtobnFaQk9BSUwx?=
 =?utf-8?B?ak4ydHg3SmJPT0o5WHJrVkxhMDNQc1FyR0xPN3pvYW5WcyszSkl2dEhDOWlF?=
 =?utf-8?B?ZHhsQjNObGJYaGh3b2p3OFV5UVJ1WkN6TFVxVklxTHp3aTRhNTdybUVNYjFx?=
 =?utf-8?Q?52KI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akhneGZPNmdKdHgvTmdtNnhOeTZFb0ZuRFFvaEVOOU54TVdkVnpOWEhlY2FE?=
 =?utf-8?B?OWlPMmZCRmJCb2VUZkd3eEQvdXZwS2VYOG1RODVDb2pURENEQzRzUFQ3UUND?=
 =?utf-8?B?MjdwKzlSTHdSdHFNTk1JSlU1MldhQVlvWVowSXdxMG9MQjhXZ1R4YmFiQkNZ?=
 =?utf-8?B?UnRaVzZLR1ZIMUFLWjhNaE5jdHh0eklNaUgraU5vZFFzSEMrUzFNYlB6TzN5?=
 =?utf-8?B?K1VxUXBlS01xOFZNU1h0aVdwYlRaNzg1bWE1eGtmWEZlaXR2L08xV1RyWlND?=
 =?utf-8?B?bEFERHFNaCs0VkViT2hPUmFhaVRRZmdXTFQvOFZ2amhMbEFkWEcwcE1LbEhQ?=
 =?utf-8?B?SDhGcnNhRXRFdEtoOE5mSXEvQ0M4MzJ1R0Jqc3NTSjRQUFJIalloTTJVVDNR?=
 =?utf-8?B?VUc4dk14N0JGYXUrRjFzWXZaZzlubDZhcUE0QTBHcTZVb3M2bGxnYW5GZVNw?=
 =?utf-8?B?L3BtYUxDUzVtZUZSWmkrY2FPOVlTT2o2b3F2OXlRNzZveDlKNDhjaWlqcXRN?=
 =?utf-8?B?K2JpRzFnY2x6U2E4TTdWaHZSR0JST01MYitmMmpzKzVWWjRoaW9JOXBZRk5G?=
 =?utf-8?B?bmFTK1h2dmZ5b0hFaEhhdVRmR251czFIUzIvZDFYUjZxVG9LRlV1T0dYMVhh?=
 =?utf-8?B?TDF3WXp1T09RWndvRkd6TzlpRTB0d2drNitwbkRpQWR4Y2FNKzFqTm1adUlB?=
 =?utf-8?B?cTlGdDJDRDlmMHBGSTBnK2NTVDJEUWJhU0pQbzErREFBelQyTjh6L0N5WGM0?=
 =?utf-8?B?TTdKVk9lMzFmcDRKaFpqQjJ2djhoblNObVhtTm5SVTdEK29jVlFHSU9EZVJS?=
 =?utf-8?B?WU9pNTFXZHMyYlZxcjduckJiN2NtZmFUYjBuVUZNa3VxOXZiQ1l3YVhrQ0Fp?=
 =?utf-8?B?T2JBcVNoNHE3Zk8vd0RvbHlBdENHWHNNTHlERUNPQlJxWDMvQVZJd1NFTllP?=
 =?utf-8?B?Rk1ianVlNGNFYlVGY1hscWFCNzh0dTRRWThWZ0EzWjA2UkorWk85S09iZEQ4?=
 =?utf-8?B?Qlg3RnI5ZUFHcEg3cW5nbVJ1dUpKSHRma3VyMm11NDdBT052WjJPUlE0bGdD?=
 =?utf-8?B?OTdIZkNFS29VMGVjRmQ0NklZamxVU1YyYnpnR05icmRnT1hoK2k0S2o3MnQz?=
 =?utf-8?B?T2YwSGhJMEJONERyNTFUL29Ka3M5c1VJODNkWVppVGFhN0dROEowbTdCVXp1?=
 =?utf-8?B?aVJhTExOSTZBTTY2MEZUOHRHSXRPaUg1NkNXanhyOUJaSUFCSnN1cVZ1a2JO?=
 =?utf-8?B?OHY1UnowNzllMTZmVFk0cFpWZkRYUUVWWEptdkRuaTZoOXZsdVpZY3h5Mkh3?=
 =?utf-8?B?eDdxVVlSNVFaYU9OQzd2MVdLejNrckxjM2E1ZVRXUW1QaUxBUER4TzB1L3FU?=
 =?utf-8?B?bFpQS0FiaHViWlFzM1c2My9RL1lHcjB0a0V2UHZZcnlVVzltVUxuNER2enZM?=
 =?utf-8?B?OUd1VnpkVHJxN2RpbHQ5VHltTVlFOXpJTlBRVGpLeWhVdEdHc3N2YmJtSlVs?=
 =?utf-8?B?STczblRQMGxlRTNqdGp4b3l1VHVRSTlXWEhmVU5sckZZK0MyY3ZlQVlRck0v?=
 =?utf-8?B?bjBGOGI0S1pGT011emhZaGJCcXJjemlXeEgzTk81V3d6S1hja25HV013WExR?=
 =?utf-8?B?RnVma09lRDM2b29mYTNOWUdjaTNHRGh2MkQzUE5yc3Ryc3FqbVBMejJINVRD?=
 =?utf-8?B?RzhRWWtKNmtTVngreEtCbGNCQmFMWFlValA1cVRvYTJzbjZwekxEYitsWnB6?=
 =?utf-8?B?U0V6dkpWRm5BV3E2VFJxb3h6cUMzRlplc1R3ekdybDI4MDQ5ZnFUMmxzVldE?=
 =?utf-8?B?azB4ZEpyYWRHcnZIM2h1WjNrdklWU01TUlhPaDVnSy9KNldzUllrTFFiWURk?=
 =?utf-8?B?dUN0S1gxckszc0tOT0FFUzZHSE1OcnhYbGlHdHZ6YnBkRjJtbitWOEdtUzlF?=
 =?utf-8?B?OHdjTnpheFBWSjlBcklldGZ3bndNcVNUL3M4bTFJd0tPdW1oM05vME83Mm4r?=
 =?utf-8?B?Q2F5bUs5NmNhOVgzYjE0Zjk1QXRUTkhkR2YrU3VEUlpqQ1FhZG9vdXgveXcr?=
 =?utf-8?B?V2JEZnFUdFNqMWpUMjRFcEdWZEw3UlA0WGlIbUk5MU5aTDlaWW01Q2tRNFlX?=
 =?utf-8?B?ZnB3Y0p3T1I4Y1M2WFRrNlk2UkRlVXZIZ2VqTzk3TldpNFdOeVNNQkRQN05i?=
 =?utf-8?B?TE9xdHZtaFJPNUdCQi9XNzNNMzFtcHlSRHcxVWRuNkdCSHRNU1ZaUEN5VUcy?=
 =?utf-8?B?cVZwSmozaFBWNlJydDYreVkzdzBsNVpwWnhZMnNUR3BXK0FLbExweVRReDlP?=
 =?utf-8?B?RkdNcTQyckYzV25hMldnWWtoME9YcFJzVjZUbmw4Y3NFdUtLY1VGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcfdfef-b566-4593-5cb1-08de5f5d9d37
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:41:20.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VVZXFAokJYgqnq3HXLI0kfAiKIo3CsfWyHGWJwe/N9WBfGh/yuc6k4ouYjqkVEQKpVYpwtxcJ3Q6rNGWEdsFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2CC48B31D2
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 04:54:59PM +0100, Jan Beulich wrote:
> On 29.01.2026 16:40, Roger Pau Monné wrote:
> > On Thu, Jan 29, 2026 at 02:10:34PM +0100, Jan Beulich wrote:
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -869,6 +869,18 @@ static int vpci_init_ext_capability_list
> >>      return 0;
> >>  }
> >>  
> >> +int vpci_reinit_ext_capability_list(const struct pci_dev *pdev)
> >> +{
> >> +    if ( !pdev->vpci )
> >> +        return 0;
> >> +
> >> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> >> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> >> +        ASSERT_UNREACHABLE();
> >> +
> >> +    return vpci_init_ext_capability_list(pdev);
> > 
> > Isn't this missing the possible addition or removal of managed
> > extended capabilities?  IOW: on removal of access to the extended
> > space the vPCI managed capabilties that have is_ext == true should
> > call their ->cleanup() hooks, and on discovery of MMCFG access we
> > should call the ->init() hooks?
> 
> Now I know why this felt too easy. Yet I wonder: Why is this done in two
> parts in the first place?

I think this boils down to us (me I would think) not planning ahead
that capabilities might appear _after_ the initial device assignation.
This is true for example when Xen doesn't have access to the MMCFG at
boot, and it's only made aware of such after starting the hardware
domain.

Right now vpci_init_{,ext_}capability_list() is called from
vpci_init_header(), but for the case where MMCFG is registered late we
don't really want to re-init the header, so calling that helper is not
an option.

We might want to create two new wrappers that encapsulate
vpci_init_{,ext_}capability_list() + the calling of the
vpci_init_capabilities(), provided that vpci_init_capabilities() is
also split between legacy and extended capabilities.  We want to call
those new helpers from vpci_assign_device() instead of
vpci_init_header().

Thanks, Roger.

