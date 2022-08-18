Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018F59852B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389569.626581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg9X-0001Bw-Am; Thu, 18 Aug 2022 14:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389569.626581; Thu, 18 Aug 2022 14:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOg9X-000192-7W; Thu, 18 Aug 2022 14:05:43 +0000
Received: by outflank-mailman (input) for mailman id 389569;
 Thu, 18 Aug 2022 14:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOg9W-000100-EC
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:05:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d80d2d95-1efe-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:05:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5604.eurprd04.prod.outlook.com (2603:10a6:208:134::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Thu, 18 Aug
 2022 14:05:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:05:39 +0000
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
X-Inumbo-ID: d80d2d95-1efe-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja7fNlj6APz6aoc3bsYXpBkJccaGpTRFgpUx7arLTOFFHrTSi2pnmy2/9Fvmzaak7qA1wai7gE5/69SxsfzCVrI0rxKm3PBAo+SRIIK97Mx6wJxM5tghgh4v9VSPtPSy2LXbDxA/EmAMeLDYxari4TDDC7a3/4HUvkbo1j0io2Y9ZJ+/NGIxvok3KoknGWtNJ74gGfaDZoYao5kKtYJOuDZU05x/k4tTurW/jZfzi5V4rYu9cnctO+j617kvpEunnIIvRXxO3CbGp59hwX4IW44Il7dOtyYqwyc20wxfkXXp7ScBMFzxMeXYpn28/apUF989YCXd4aqvnDmI8dNhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikzkcZ37zHqRA4Dqg0pshN1gxxIDaS6qACe6NnbT6Qk=;
 b=AIN7gmgZOpPgJUq94pOgGKuqkUmbKz0clooKrCLSNQuRhxZLKTTJv8IQENxuC6vSIDfrnzbCMIwBInLmSJi4gux1XeQe9I5kD8FObyW8f70OkJD9+P85Ye2/QHGRINKELk2jJpxySTZqBiz19U7Q/rOQnicLPWaYqLdR+wE/cUC+63Mik530t7sUga/kzKPQQE6BDfyUZE+ILMVPN+XYBBTSM2XuLQbiaqI482Vdl8fO6zeJM2bUiqeCbvlb+FuRxc4Dq9XHFnZD8seAL1U0Ua/8E7uOBtulBtiz9/JoMwsO98CDRHN6MLb1J6ur+9vU2DSJfk8TUUIrGltxGc422g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikzkcZ37zHqRA4Dqg0pshN1gxxIDaS6qACe6NnbT6Qk=;
 b=0t3wKKetX/kuq9fcERq5F8KTAVPsHbn1SWFX1442HVQCaSGTbKa3cFFRcY9bgdh7PVSXpC8horB0Rg5KRsAcTMy2LrHDp9Bi9SmTyAunEp4CUn9k6EGgyZ5wCpWSTEAi9EmPWLcIPsBojgdYDgN/ywrAl/P9ZkGv4WzT0pMIJt+Mh+Cg0qlEIorwZL86K+4CL0cscP07/8BK4HsDvv9IJNClGVDBDfXNQTH0eYlp/NAHbMRqLLGEkoNkIr0QS/X1sRajfKgxIWwPnOWqwyMRTYybZNPAqbVhM+jOmf1dodJEJnbO/JlhVVRmjvWSuM3Vv4sYfScj+5m65R9j9URRXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c87ae25d-5aa8-bb70-7d2b-ea6485a01f59@suse.com>
Date: Thu, 18 Aug 2022 16:05:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH 1/3] xenbaked: properly use time_t in dump_stats()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
In-Reply-To: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aedc4d8-1299-4787-a838-08da8122bb11
X-MS-TrafficTypeDiagnostic: AM0PR04MB5604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mzAYTQScDSjo5k/IOVn3WJgRyAe0W8q7jw6b7ouD3ALBcegZRiwNOraNghH6lPUwNJLVvGESVQHnDD5E18ky9f+/+ECaiCdrkDNIozlS+jl7XWNKOH6kmqTJvfN3qTPPIdnkYbvwVOl/754O8px876KNLkT6vrth6HeqwVqfk5dCvmIVbTwVtESimTKz8SIHkqIszJY84tTjXc+99gyBC0Fz//wKqzx4E0QJ/xvdxkNXb9+kSoXBh9AlMni5BE7BvG5v2+SbOtcsYRJDFHh6p9ECWnHBsa9y9eobtkLYfHqdyhsrMIys9/7ByuXlpSccBnDz1acTJNA7JU3AqrwFW/dW/w7JYPQWLAc1dHBXAJ9fGPZrjDDL24oUcTy+5QmfY5PdGp7euFDSjtRpZWirfIPUYruMfoHxnLs8C1RXWDcwjbVF5tlyZ4FHD0D7bJOn7vSteCbTPA3nA9/fKO0HOiSqVimnL4r3sIoAJWR5uIpvvMoRwgZRPZfdRMj/I7+hQSFV0CMH2AxskBVvn1qVOKR60clPfendF1I0X9AyZ9fx/yZsMEYkeOXqYD2tiP/Q+LvoLJv3JyrlDVQCMnm/B1WrQihiwY6uCbLUYYD3wGpPJFbWtTpV32EuRdRKN8kHudb3C1uFk4101ogFo61nwBtiGf6jT4aAEY/hJGyJkfLoQa1fXM+gQnRkt+3Tut/xDV31T+VBgFWd2ScU9btzGW8+SWz4BlCjdQgM750BomifYjjn5qD1CsgsLOvKUYMD1oqTwQcdwFQRggpho6Jb+rbYCpsy2vgHItXoxZlFYK16mmlUbS6RG6zDfFTKFMjuFj5TGaxmZ5ffrEPYBCIUWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(39860400002)(396003)(376002)(6512007)(186003)(6506007)(2616005)(26005)(31686004)(84970400001)(2906002)(5660300002)(8936002)(36756003)(38100700002)(478600001)(66556008)(316002)(4326008)(8676002)(41300700001)(31696002)(86362001)(6916009)(54906003)(66946007)(6486002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3FJeTExNS9vbHJVQnRobzQyUjRoME03QWFaYWFiMVhMUXlXNXczcXNOenlG?=
 =?utf-8?B?b3dVSm91U0Fvc25nNlhjUGxrbWdXWkppbHg2VGlBRitLRUNYbzIzeDl4YUhi?=
 =?utf-8?B?eFcvTzZyYnpGZTh5TGtlWHd4LzkwOE5BVzcwRUVHblc5bjB2ZGN3SjBRU0hO?=
 =?utf-8?B?WmYwM1hsU21iekkvNy81akVUcnFiMlhyaXZNUmZzSzl5Umg0UmxZTllScGdi?=
 =?utf-8?B?WkdvM1VHRGhlRmxKZFlBNDdub2puVHFUMVZZQjVXN2RNZHRlUTM1eGd2WXU0?=
 =?utf-8?B?TUJhTTVOTTBZUEEyREE3aFpTQklrUnhCdTdDa1ViMDIvWEZ1MGNwRHYxZXA1?=
 =?utf-8?B?b1dsRUJJU01EUFFCdklnLzVZZGNYeTQyZzZqQ1prU2Y0NnJNWHIrYUI3YTRS?=
 =?utf-8?B?eFBJUDNraS9uSEJpM3JvT2R1NzRBNmJ0K1V4dmVKVWpzZ0lKRzlVYmtIb1FL?=
 =?utf-8?B?MkErZldFYXV6NGJjUWI3WVFHelpscDdZUndFZ2RwVmwwOHQ4dW50NmFrcHZZ?=
 =?utf-8?B?bUttbWVmNWlLdGlsbGh4M1V5Vm11eFR4SDlKWXhaWER3eXQvTlhGQ0dOUFdQ?=
 =?utf-8?B?RUFIMS9IL2g0WDdxU0Z2Ym9mNEFxZExZUUJzNEwxOCtMVmxYR3Z6UWFDL2NU?=
 =?utf-8?B?T2FsbjljNjZwa1ErSDhrSWJVZkFBN3hzYnRSUW4vYTloWU84a2RPTU0wcWxH?=
 =?utf-8?B?NjhDVTAzV1dDdXpJUzYwS3FVcmRBUjNsWG9rWE0wek9kTXlSbmM5Wk5HbjZh?=
 =?utf-8?B?ZWt3YnpGQTFUSjZ3TlZGaXFObXZFdjRxQktkNEJvaHZhVzI1dzNUTWtWU0JI?=
 =?utf-8?B?UXFYSHRaeUxTeDFyVmNmRDZPdWpLZ0ppdHNKQ2tqYTlvWTBlcmNSUEtIQ3Fm?=
 =?utf-8?B?QXQ2VkRRSGM0NVA2UnZSUWRqQldIdktBckVuakJrZ2RaMDVIdFFxajBJb29n?=
 =?utf-8?B?dlhuSjdnWURpTEUxQ3B3SXZyMlp3K0tERHVYajhBb0FMblpnVURQSDhwYlZN?=
 =?utf-8?B?NVBlMG5FZGp1ZG9pTnZjbS9Ockc4R09kR3NRMmJDd21oTmIyRm5xRndLNTR4?=
 =?utf-8?B?SXpEWWd5RU5XUm1BSGtSM3ZwYmdBWmp2OWhOcVd0SGFpZmM2UnZYRmFsb2sz?=
 =?utf-8?B?WUVOcTFpZ1I0VEpQcUZBS0tnREEwaVgwa2VyenZwSGRnTWtEM3dZZko1VmlP?=
 =?utf-8?B?UndGSkphdmUyT0lwWURoeVRRWUZaeFVLTTF5bG1mcm8xeVNsT0J6ZnA1VDhF?=
 =?utf-8?B?TVEyOHhPN0tFZUprZW1mSmk5bUVGNnc3MmhoaWpIbkVQWVZmZVFUODFKTXpt?=
 =?utf-8?B?K2Mxa2lWc3plRTRFWUMzVGFnemVCdDJnY0VIRGFkSWlTRThDc3dlMEJqUzBz?=
 =?utf-8?B?Zzh5L1pTYWl4OHZLTmZ6UWpaWSswWUtQSk1RS0RlT2p3OEFHYmJ3dkdRcW9J?=
 =?utf-8?B?T2toUmVrSXE1bk4wWWswT0tkbHNMSFB1TENKVFo1NlVBRnhGMGd4VXVCUDZw?=
 =?utf-8?B?M2xXNUZ2NlFDbUhDbThqOGtPSWJhQ1E3VW5nWWdBSlhvOFlwZjlSWnIrV1B4?=
 =?utf-8?B?dGEyQXRBUUdaQk5HdWhPYXExSFNVaWRRb1lOTGsycUQwYVBDSnllemRDZjA0?=
 =?utf-8?B?a2xEQUhsalEvdTdUdEtKUi9HaHdVK2pJVFZjb2NUeU1zYzZNaXRLdnRDMFlO?=
 =?utf-8?B?NHNUczFxRWZ4L1lwVlJDTFByRzR2a0dmZFlPTStTdFplR0Jvd3ZKQ2doNU5Q?=
 =?utf-8?B?YUxsN0RwMFE2eUx5MGp5Sk5qcnlKQ0Zzd2FjeVFPSmhQUE10QjkyQUtpWjlM?=
 =?utf-8?B?cFVveERZRTVXSEJFTUhYck1tR0ltVTVmMkNHUGJnNnFDdnVKWjYrTXErMjhV?=
 =?utf-8?B?NVo3MWt3bi9MVC9uQnFpakZOZVpyeXNqV3BBdkp3ZWN3NDZsd0FDV05jSVdt?=
 =?utf-8?B?NkQ4ZHdmbjF4T09GdmR4L3JOcXBSSlpOVkxMWWJFV25ES0EvZHFDR00zVzRX?=
 =?utf-8?B?ejhGZUxXYzJrY2hUWGx4QjNFdnZZYy9XMTYzNk00WTlENnh4cWxuQnQ1dWN6?=
 =?utf-8?B?bVRSemc2RkpMbzBiM1F3QTVNN1FjSlBGMnJBdXNmZ2pkeFQrb0pIOWRpSnpO?=
 =?utf-8?Q?vGztwLKcGgzwo1j8E0ADR+K51?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aedc4d8-1299-4787-a838-08da8122bb11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:05:39.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDS0cu7CoVchXfr5Fa7Ecmk3DQAos0qguWUb14ZhUuxGqF2RBcyDt7PwFYuQFlcCg02TikIRY+7o8ELAXChjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5604

"int" is not a suitable type to convert time()'s return value to. Avoid
casts and other extra fiddling by using difftime(), on the assumption
that the overhead of using "double" doesn't matter here.

Coverity ID: 1509374
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/tools/xenmon/xenbaked.c	2022-01-06 16:12:39.000000000 +0100
+++ unstable/tools/xenmon/xenbaked.c	2022-08-18 15:36:39.918706853 +0200
@@ -230,11 +230,7 @@ static void check_gotten_sum(void)
 static void dump_stats(void) 
 {
     stat_map_t *smt = stat_map;
-    time_t end_time, run_time;
-
-    time(&end_time);
-
-    run_time = end_time - start_time;
+    double run_time = difftime(time(NULL), start_time);
 
     printf("Event counts:\n");
     while (smt->text != NULL) {
@@ -242,13 +238,11 @@ static void dump_stats(void)
         smt++;
     }
 
-    printf("processed %d total records in %d seconds (%ld per second)\n",
-           rec_count, (int)run_time,
-           run_time ? (long)(rec_count/run_time) : 0L);
+    printf("processed %d total records in %0f seconds (%0f per second)\n",
+           rec_count, run_time, run_time ? rec_count / run_time : 0);
 
-    printf("woke up %d times in %d seconds (%ld per second)\n",
-           wakeups, (int) run_time,
-           run_time ? (long)(wakeups/run_time) : 0L);
+    printf("woke up %d times in %0f seconds (%0f per second)\n",
+           wakeups, run_time, run_time ? wakeups / run_time : 0);
 
     check_gotten_sum();
 }


