Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A07972FF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 16:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597433.931667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFoj-0003q4-6Z; Thu, 07 Sep 2023 14:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597433.931667; Thu, 07 Sep 2023 14:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFoj-0003ni-3n; Thu, 07 Sep 2023 14:17:09 +0000
Received: by outflank-mailman (input) for mailman id 597433;
 Thu, 07 Sep 2023 14:17:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeFoh-0003nc-PZ
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 14:17:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d5b917-4d89-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 16:17:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 14:17:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:17:03 +0000
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
X-Inumbo-ID: 38d5b917-4d89-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6scOsdTB8WSBFSmgAFrE9zOhXv/jnqnGjfgNUcmp/UBK/BBtcRbPi0xU3TddRjGUwTprIQ+9mJ8THLGHWp6ooBXSIzMyCsulsREgaal3QxsR6N/vJ8EEGcf7ZMh0TcwSxJ8AKIF9d2lU1Hu5QRFKCqR6PFcGm3cL/vf/qbgs+QtNr19qtAZtVDtPKEMJ8Tov7M1Z8a/wTWfJoDyi2mdlcf3LFrYwikyCG12vAF3ZT3OItU/gl30s2KhLBbmHE+dIw5UWv2M/omkwp2m5I08ywwqYTEqfMvfsz3oVOHLJbYt2NJf4II350HJQY4bw5SC9H7+FMBB3Sd+1W2v4Q+Bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paYr+JUWr2FCvc53Ti1SIkmtPmBwbppM/wPFyDEYQxo=;
 b=NE0uxGumoAApqMZOul2EVhRWd+dH+9Zh0OLZ5xqqwcLwcgdJ1JvUzLtSMs1iDhQSjGIkJaai6TMbofRRKM/F1q5f48pgg6z1Xd256SUQsJhoq1wRXUMNKjxMEPc8mgqgH6HYCoDjbbw5dVXlFOYaRQ+QrD34DjZucjXxQl05zU4HB3KN7dRpg4l87UNTY7rYvPMePf/ZbSt1/3luvGGNyPxk7jO9lOJ3FotXzLSSjRcRyZ5WjN6Gd2/1Qf8IRZ6p9/rCsjPiGwzfNm22MfApbOcWafHT/H/SzUwEYOreBb1Lmz/TPJLENkYJNA+0d5GP4Jnu+Ojxzsk7fm1MxULLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paYr+JUWr2FCvc53Ti1SIkmtPmBwbppM/wPFyDEYQxo=;
 b=i1QP6tWViNbctsVACZ9fIBLawEw02owWxJKJulajLv8uJrcAf4pimGx0NyH2iDeXJff0iVD5FvQ5uiQflB0Xd12P9+rQPyJq7aepOCfe+XGZHylcFzPZQvdv42HcARQRl6CRMJ6STrqsk0d+LiZ1SlN9bRm9IXAiT1gUYa7nwpwCKlGOMQlaYam3Vu8CWmdxOAaOk0LwzvIfeCtE4eqL3rIXxOC7EcWASgliKwsIcoCW/amLaDTDZ2pQDgsc55CvQSTWg27O/mim+Tst6r8QY3NS+AqD3Xod7xEbjZEyAXWUCXFOAIGpywjUUZ8m9VtgYMZp6tlk+1R1Idb9cfAx8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74aa0f95-e059-f6a4-b085-03c7e4b2fceb@suse.com>
Date: Thu, 7 Sep 2023 16:17:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] cmdline: move irq-max-guests doc entry
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0261.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 328da598-fd20-408b-6541-08dbafad1bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYi3UsyfrGp/n5eZtw1V4DU2kWBLqfyq9pImQUzwqFg+WW1kdupigE2pl+wksXxbrM3qMOImYhndvagi5ngk73+vluwp0c4jd4Klicpq2xW7ruL2Mvu4AzOVjhrC4WvkoDsIvwH8ka7SnFYbSlUpmLCyKT2bVmVx4nqgd6rPUgiU3c0wYcIof3jAiNkMs43GxPAsmZJ0JgQZZ1DyEeYzzzYtXk0X43dVjZjo1maY2V2Ku8Vbsnw42eoietU6TfSC7C3V8HCVSvvwEAifnMory3Z/XQnUfUzi6WVCosKmkKA0UuPKqkPWdL2qzBQLTF7XmKYY6jcEPvF5m3/EHW949PGcAdFDlEjNL+vKp8lsU1R6ezBxR60KmqXR5ENfg4BNHByP74ZK8lh9uMsK/g7YhCJ51c/COLVcyHC/gRbA6n+Ihpec3XpESKewIRvig1ZnhI3cf+lGLu903Cgd1YD6PJfliCGq0r87ry10xiqYqugKG5PzX+v8/uyi66D3Cbxz0Qbz8mGy36d97hefrSvrWBbdpffmUbgShMtn9eiQmjM/qZ7twHo6UeAdGnCv48wlw8gqjIz1u48xxxMXQpdGVvpRnKodYqv7HSLdqQXRDvBajJQS+y+5JQ1rYapfsAceKb9bl69vCoc7G2sUkZSzYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(186009)(451199024)(1800799009)(31686004)(6506007)(6486002)(31696002)(38100700002)(86362001)(36756003)(26005)(2906002)(83380400001)(6512007)(2616005)(478600001)(66946007)(316002)(8936002)(8676002)(4326008)(5660300002)(66556008)(54906003)(41300700001)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm1vZ3BrM2hObUJDS2hoL21WUk9zL0VNVXVvdjlGakVyK2hqVk5YcjNTV2w4?=
 =?utf-8?B?TjRHV3VJbE5Pd3YxcUxHMXZTOFRBS3RHbmpJTGpXaGkvbU9ZMUE4N0oyczZH?=
 =?utf-8?B?RElaQXMzejFzYjdJZWhZVExJaGpLZnVXOXhsaExKVllidmJpR2hwUFpocTBz?=
 =?utf-8?B?SFFnQldVWDBuemd6TUtIdUVPV1BLL1N4czJDVGdjVEloaWNKS2UvRVJYQXpQ?=
 =?utf-8?B?TTVkYmtXL0dScVF1VmxPTHpRUmh3b3h0T2g1bmpWQ3FOZkNNUjl4TC83K0pR?=
 =?utf-8?B?cGRrTmNqNXJxeUx4Vkl6QkNCWG5oaUVVT005OGZvSXVnelg5eG5LbkowTEdX?=
 =?utf-8?B?QTQzS25NWEdkUW5qemd0dTFCZTBTNXd3RHVickZrbTZoSE9hS3pGbjNWT2gy?=
 =?utf-8?B?VzB4Y1BvaTFSNEJhc3gwemptRGtwU21Kdnc1a3crMjJFTWxPcERUZzIxMUhJ?=
 =?utf-8?B?WDcwalJjanE3U1JRNnhva3A1bXF0TlN0d0UySUpsUUZWbjlRWDc4ZVRuemEv?=
 =?utf-8?B?cGZkZ3Nnem9vZDYzeVg2bWJCVU1XZ0ZjTHdoN0FqVTg0TDlJMk5PVlVVNkp2?=
 =?utf-8?B?ZkxkSVdPaTJEbVVrNThMMFQrV1pCaGFna0ltdDc3dkNNNUF1YldzbW9WYk1P?=
 =?utf-8?B?WENkTkJUSGp6SGVrMXZHRmkvbFE5d1NGa1F2K1pWSTdoWDhiY0o0YVVmU0Fq?=
 =?utf-8?B?bDRQdThKVEZURmx3SmV4RUpQaGV5VDR5VVlkR0JXN2MzZFBITGwyVEFYMkZm?=
 =?utf-8?B?eFhTaHlPS3pkN0UyekRXSG9SSGQrQndIdGt0a1l1Q0kyWE1pdGx2cnZqdThH?=
 =?utf-8?B?TmpUYWZjbkMyVThYU09sbkg3b0JPbDdOb3kvN091VDR0TDVoZnFMS3JMc3lC?=
 =?utf-8?B?TExqbTRpZ1VvTTFMRWtacHN5dUNMWUpPUXRqNG9MNHBEUUZYSFRGdVptdmZE?=
 =?utf-8?B?SWFEekdUT2phVGdiSWJZRHJ2bWlPb1FlTWZJTTBpL3FaVkxjclluNGRWMDBO?=
 =?utf-8?B?T1FSN2I5YzhZcTQzYUdWeDEwSkswN2dCTjNxaXQyY0RDNEorSEhaSnpJVWRY?=
 =?utf-8?B?L2ZnTWcwbmE1b2VtaGhoMTJxOVRzNkhNRjdIdWxkYUlWeVU4eVJiRmUrOTN4?=
 =?utf-8?B?Z21KSTlMZ0d3WUs4eXhxNHNQQWkwbGpERDFERWhXQkg3NDcxN3RnRnZWZEtP?=
 =?utf-8?B?YVg0V2QwWVQwQ0JteEJIZ0Y4TTJYa2RBS2p6NWdhYkx4VHdiTjZLSXMvQnc3?=
 =?utf-8?B?dlZjdVM5WW1Kb2NaREpDRFliQ3l0OGxWS3htUXRpNDhjZE96MHhqREZpb2l1?=
 =?utf-8?B?SG5janBzSXh3YVhic2dRU2ViUWZka28rZ1JYWEVpV2hGdkNyMnVIc1hjK0lB?=
 =?utf-8?B?UVFQdjcwc3NHa2VXUkcxL0RWR3c2YXp3c09HaEU2SWVjTG5JSXBBNng1Tm1F?=
 =?utf-8?B?MVJ4bFNmSUc3SVA5dWVYU1NXZzl0c2lLRVcvN0kxTmJIamtsNmFhby9CUTBL?=
 =?utf-8?B?dmt2OGNheWhEMGFqSEVqNlhqR3JSZkxFTm1wVDJjZS9jdDhra2VQRjZHaVNC?=
 =?utf-8?B?MzZXaDI2cEkxSElPUFBkOHhuZzlyZ0JCYVAwdENnS2xMSUFJNDhub0p1Ylcv?=
 =?utf-8?B?RXRMdm1Vc3p6NjhGVmxjY3pNaWU2QVdwQ24rcVJpaFFBYitOU1JXdExxN0Fo?=
 =?utf-8?B?YkUvRjB4ak1FcE5Zd0hSdnhQZmdTTXliamN6OHExckRSVHBBcEhETmhSTjdS?=
 =?utf-8?B?RWZiWjlVTCtoQTdLWWRpQ0hsVUJBT3Y4UndReGk0UjBsRUc0d1o3dVdvVUpQ?=
 =?utf-8?B?Nm9OQXhreVJIUU0wZGlqaitPWkJSMmtVNHhOVEVXc0Fjbm56L1JDV2oxU0p4?=
 =?utf-8?B?SmZHTy9hRWwvN1YzKyszRGR2aTNnbzBNK3NpcVJ2clJZMVRIL3EraGNQRUpF?=
 =?utf-8?B?dDZWUXRKdzUxWU9lUkZSVE5DTUdGb2R2dzhralVJcTZvQ0VDekI4Nkc0emw0?=
 =?utf-8?B?WVh4WDNaU0NBZ1NvaTJQMUdXTGRUTW5mcVBTODhPR0EzUEFhS3NUcWs4aTFC?=
 =?utf-8?B?YTRuUUZmSmIwbGQrOC8vMmg1Zmx3bFA4ZHhEbXZiUFNNVnpyYm5qeFNKRVM5?=
 =?utf-8?Q?ftdZslsR3Ry9BCCBvAfzxCS/2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328da598-fd20-408b-6541-08dbafad1bd9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:17:03.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi2/xfFoPz4VZnIty0oREKkN7Z14g1oD0zql5C1sDdLc9GcktZZROT6J2weN3bEYedgyhIG7A/qLa1UhLSIsuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

... to adhere to intended sorting.

Fixes: e373bc1bdc59 ("x86/IRQ: make max number of guests for a shared IRQ configurable")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1630,6 +1630,16 @@ wait descriptor timed out', try increasi
 **WARNING: This command line option is deprecated, and superseded by
 _dom0-iommu=map-inclusive_ - using both options in combination is undefined.**
 
+### irq-max-guests (x86)
+> `= <integer>`
+
+> Default: `32`
+
+Maximum number of guests any individual IRQ could be shared between,
+i.e. a limit on the number of guests it is possible to start each having
+assigned a device sharing a common interrupt line.  Accepts values between
+1 and 255.
+
 ### irq_ratelimit (x86)
 > `= <integer>`
 
@@ -1914,16 +1924,6 @@ This option is ignored in **pv-shim** mo
 ### nr_irqs (x86)
 > `= <integer>`
 
-### irq-max-guests (x86)
-> `= <integer>`
-
-> Default: `32`
-
-Maximum number of guests any individual IRQ could be shared between,
-i.e. a limit on the number of guests it is possible to start each having
-assigned a device sharing a common interrupt line.  Accepts values between
-1 and 255.
-
 ### numa (x86)
 > `= on | off | fake=<integer> | noacpi`
 

