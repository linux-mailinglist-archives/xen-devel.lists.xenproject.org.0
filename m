Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83464CBAFB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282911.481777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLi-00031I-PV; Thu, 03 Mar 2022 10:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282911.481777; Thu, 03 Mar 2022 10:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiLi-0002wZ-L8; Thu, 03 Mar 2022 10:06:18 +0000
Received: by outflank-mailman (input) for mailman id 282911;
 Thu, 03 Mar 2022 10:06:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiLg-0001Ia-Md
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:06:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ff7ac00-9ad9-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:06:15 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-Y0uCy6dQPaWPXR-MYMKb2Q-1; Thu, 03 Mar 2022 11:06:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 10:06:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:06:12 +0000
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
X-Inumbo-ID: 8ff7ac00-9ad9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWQiEscHMitckPtyowVTpPJHsuAivRldTvGBRFOefis=;
	b=EWvubYFjPAFE3G12+Ya8iogmoE4A8iMhERuFpHP55DJ+Ad9CIhnL1uET6ixxclFnHG72Tu
	nyxa21ioGaFQhKOqUohwKtnCQDwzeUbMWLER7HvxZv2SVne6aOsq2oIN/er0wPHmyWXkts
	AI0UtCmukBZ+Y7ytRRwKfrJ/LQav4g0=
X-MC-Unique: Y0uCy6dQPaWPXR-MYMKb2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZSHlQYFNNgv9wilX+mNqihXLn1O31wR1A0IuQjoNCjHM41bRt+md6SuVAggjT3Mhp5DC/sTQoU8NgqEkrbb59nH8mBBx6d2YO19lbT18vOTqmTtkgGI/o6ttMNk/s2T+Ix5Tek0rAxrjE5nGg76GcNEJOHMU/AHdkqEZJpO083BI5N2TUNtbN4LhsfQrsdIPJljiO65qthntZdD9UUBwwxipuVNc09+Nhzvmoc5+OY2CoSoLbAWC54nP98mruniZwaTXlpEPJvr43H2X+LAEPXW7PWAxHaVfOeJVc2+F/bAVFzFe3lQeAnp6/RtciYH2Ej0fi7AN9ST3596QzHPnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWQiEscHMitckPtyowVTpPJHsuAivRldTvGBRFOefis=;
 b=TDUFvB2C+Os5lzooH53pJ66m4lpwWupxyLZtyb74dvcSAwtP6So5w9kESvI5G7lKnZQurhzR9wqlu7MEb6UssDHUod2aHllHny5u4xveFwyByBfL7cXmtDqhgCbp1g1tibZb4PnpuYd8Vb1qEWh2LVhFKH/coV5uy2xweFwJmBVKpkJPGvP8JmleAcdCz22ybtqb9nxJFe+AG5CxrdOImWZ9bcTuq29ab/GGdVdaDGtp4A2RTciS11U7rVEfpTBBFZVSQtShr60D9S8I2tRcVZXQrk50lacOcivybVyym+COjOJS6r7uCawJ8AJYDswOb38FE+aozhYcq9bZQSm/Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb2566b4-4515-8a17-dfc2-62e099de613d@suse.com>
Date: Thu, 3 Mar 2022 11:06:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 4/7] xz: avoid overlapping memcpy() with invalid input with
 in-place decompression
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
In-Reply-To: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::37) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96213b40-a0e5-4bb5-9307-08d9fcfd7205
X-MS-TrafficTypeDiagnostic: DBAPR04MB7256:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB725692EDFF23470895884366B3049@DBAPR04MB7256.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0SOUlTGlz3Fs5jlVf2tHPG0E7/j20G37gvGrKhnTzubEr/AB2KkBhqnN6DyCY3mLD6P6U4Fq/fjk9yMHWsfLe4NmoxvJ7oytgdTFM8oscFYzKUzDxEpyxpWXUM7jjp9LNsn/LovL6y8JK24ZkQsaZHDhKfrJLbkNFQsPx78xtTLBo0C+Ndbq9au+v0FTxhIFaB16JPF8m8tDSQjQuSCjfsz2FVHLIJMNDbj34bxu1E06/v5mL3i/j38lXmvwqh9HQtu21848MKd9D7tP8aNvrDfd4zC0M3nIA9Bkyt6RJGpt/8z63h2x/bEsgiqU5iK12e52ABr5lINdDW/7BXcSdFRug/4sAMssqUoO72RR6lAZCpn4VPpVd83QbsA5vC5ZYxIMD7KApvJnWcBY9W19y5D3LTlNuwi5uQ2uiHgBJmnfhbpA1m9QqgYS/K2iWUK9movRlHZ7Q9L2mcB7W6s5sV/32GFvSzutb9PdNP7NBN3HeBoIDp1ckBk6i+fWP9NxpH5Vcqfh9Eo0N9cEpNy8j4DIsP7UHMbKwpHf94w5yUxpad2v2cEOT0p4KUkyE87anuRu6EXUI7ykoNEAA1tPcPqiFW4w3E44YJQ7gY4+XuBbXkup9Ya71tk3YNozo6qcimZctxqS0tGcU4nXh1d+3M9y5zOqJ6DSV0n6iHEIUYwFU9Ajh99sB7mOGDhR89Lb6I/E08wsQ6NyapNmhs/AOkUUrGAyl6kZM0nctxC4vL5I4H1+g4+rvIz2ujZXsb5/D7DSzUaRQvEzazGPVmPd5Q209WSyrYQwmOcB3jkRkJegSx9L9CXvZ/ygu3HJezqtFlpgoDlUzmyAa2Ygnr7YMw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(5660300002)(26005)(8936002)(508600001)(54906003)(6512007)(6916009)(38100700002)(6506007)(6666004)(966005)(6486002)(86362001)(2616005)(66556008)(31696002)(4326008)(66476007)(8676002)(316002)(31686004)(2906002)(36756003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlVoNmhGa2F3a3lzcWhXTjN6MU9HWlNMNU1WK0gyV0JXQ2k1L3ZHbWl5cW41?=
 =?utf-8?B?QkdyRjY5ZTBQT3RwR01Ta2JsYWxWTlZuYUh4VmJ6R0RkUnMrMWVVbmhFSURK?=
 =?utf-8?B?TUJoYjdXTk1IUXRtMXR6c0VMakkzNXFkMjNKWnlQU0JIS3lqMGRCNHdWN3lr?=
 =?utf-8?B?NVE2dUtGck85NWptNnFSNE1Ta2NqNmlJWGJjclVlMTlLY1hxZzk2blpWb0pT?=
 =?utf-8?B?dGxyQU52ZWhKdVpiKzdHWk1LS09ySndicVBXNWtrb3BJQnlObGhlayt5eERL?=
 =?utf-8?B?bkhQUU96WVpLU2FtdW1JUHRxVG5ybVg1YTZwcXhjTWwyR0Q4b3ZnSkNpSFFC?=
 =?utf-8?B?SzJDRTdEM082UC9yMmhnQ3VKTTdLZE1RUkkydXBSYWo0YVlyV1JKNUU3Y3Iy?=
 =?utf-8?B?TS82UkE5OG9aNDhYRVhickNhSldHUEl0OExicHdFWjV3dHM3NXdMSFlGazFt?=
 =?utf-8?B?TWVwQjl0eW4xZ2RMWHpjK3VzY25wZmN3NXNmZ3orUVowSmF5c0JzTGhraWJq?=
 =?utf-8?B?SFJDM08rUVEzRldVU2R3OVJTdU53S0lTb1lXd1loV1hxTi9TdVVtZENrb3Vv?=
 =?utf-8?B?bnlwclZUeW04ZUxUZ0V5THVSZnFkdlpZTVk1azhGclZncE9iOWRreVdoRDBh?=
 =?utf-8?B?S2t0OHcyUDRRaERweDM3L3JSWTZKVDZJaWp6RGNNUlhwMi8xcXl1ZUVNWXB4?=
 =?utf-8?B?UWRiWTQrYVdDTEJpb1FROE5GVVlYZS9TT2RQaStMaGlUTUtLRVlDSE80czBB?=
 =?utf-8?B?MlFDU045djYwd0xPcENXOUVWbDZCVGpnUDJUcFF4NUxMcHo4Z016Z1l2bkI1?=
 =?utf-8?B?emFabEllWHRXTEVqc0VPdmlRQlh0eDZsRmQ4SGFIT1ppNmlrRDFYMG9LVXJP?=
 =?utf-8?B?L3VsSWF2Uk9CVWxNRy9jbW5zZXcvckZpZklmZnhCNVJQeXBqQ0k4SHk4bXpZ?=
 =?utf-8?B?QUg5SEp1b3JybVJTSlJhT3JDbVdIcjZONmZlNC9PWlROYnNZclZrT0ZHZzVE?=
 =?utf-8?B?VE1vemcrS0IyazhqazhmZGl1V0hWL2E2OTNJOThuanFPRDUyYi9YUW5zc3BW?=
 =?utf-8?B?Z3ZyWG5jTnEzNVpvL3lMeGRPMm9qYStFRGx1aU0wOXBxSVhzeGJQdy9jRGZQ?=
 =?utf-8?B?TnNrVUxxb1RDZ2NTVTdrdjlHWHNMWXR6M2tFTkorUk5ZUi9XRlRjb1RLY3Az?=
 =?utf-8?B?RGF4NXVWSWF5YW15WkphYnpDc1BPUFoxOVMrMFhOSUtEK0FtRFcwaWVuQ3JZ?=
 =?utf-8?B?SlpWbjVwN1ZVUzI0YVlxUE9aQm1YaGNvSU8xZ0hwek50Y2RQZVhvWG1YWjdY?=
 =?utf-8?B?SUp4dXRNcGRqV09EczRXeFFVS2NRRWtaNmRSWUZmMjZDdEFCRlZ6dVZHY2kv?=
 =?utf-8?B?VER5LzR1dHlqWXZFYzBQNDdiWWJtd2ZNeXBEWkhHVEx2d0E4QXJJdFROMmRx?=
 =?utf-8?B?dkFHUlVIU3BzZFZiQnNwbmRrbmF6ZURULy9oY2FYYzVVR2VLWjJRamkyTlRG?=
 =?utf-8?B?VE1JdG51UDF2ZUVxdkdlQjNPRnV1RmpETzBBOUl4QzZRUEpBYWlmK1NqRlVw?=
 =?utf-8?B?dTQzSTZPS01iRHNVUDRxTnQwSHVyck9hMzBPMGxHbGdid2JOdm5ENktubXlK?=
 =?utf-8?B?NkUwcnpic3ozWGswaDFZRi9rdmI3NXZ4VkdyRW4wSDFCWVBuZ2JHWDdMb3lU?=
 =?utf-8?B?MmdmVTNDbm9sQ2xVS3NoRkFnUFluaTJiWUhTYUpGVDJHZjk0NXcxbHpnWmNX?=
 =?utf-8?B?TnNaM1ROamJHZFFKME1jekhtdERGZ0RFOGx3N3RnMG14eTdlczVta1dBdE4w?=
 =?utf-8?B?ZGY2ODY2Qmx2Uk13Q3lEYnVUSzlYYzN5QVArOFJIZkRTTXUyN0s2S1lSZlZH?=
 =?utf-8?B?bHJQUTFZN0dDYlVRZ2Z5Zk5rMGxsMmlMQTI4dE1aL2hGSDFyamFnMUcrMUxF?=
 =?utf-8?B?eHcxREpOa1lHbWdsS3o1TS9XVU1JamlrZ0hwOFJiejU0STBsRzVidW5QazYy?=
 =?utf-8?B?M2VsNG16eGNMYzJIQTFodC9EVjRIOW1MTllhMk52eHdiYTZWY2d6L0xnYnly?=
 =?utf-8?B?eE9EL2E5WWN1b0pxZDJyc0YrZVpxZU5HbXIzUnJYSDYzeEV4Z1BpVGxVWnZL?=
 =?utf-8?B?ZlUxbDZvQzdsVi90REJkVGVKNU4yVkNvZ0tLQkk4WkJpN2NRRFg0WFZkNDJo?=
 =?utf-8?Q?IoPPvXvQsl+kWXSb58tBRb4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96213b40-a0e5-4bb5-9307-08d9fcfd7205
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:06:12.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUETtAAQP1SRkl8Y3f23rZCG+2FUSK+c1L1V3bMixyF+8fl64AvV2KXX3u34MkW8u5S6RH6j3GmMhWsi0FBkww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256

From: Lasse Collin <lasse.collin@tukaani.org>

With valid files, the safety margin described in lib/decompress_unxz.c
ensures that these buffers cannot overlap. But if the uncompressed size
of the input is larger than the caller thought, which is possible when
the input file is invalid/corrupt, the buffers can overlap. Obviously
the result will then be garbage (and usually the decoder will return
an error too) but no other harm will happen when such an over-run occurs.

This change only affects uncompressed LZMA2 chunks and so this
should have no effect on performance.

Link: https://lore.kernel.org/r/20211010213145.17462-2-xiang@kernel.org
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
[Linux commit: 83d3c4f22a36d005b55f44628f46cc0d319a75e8]
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2: Retain one more S-o-b.

--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -127,7 +127,7 @@
  * memeq and memzero are not used much and any remotely sane implementation
  * is fast enough. memcpy/memmove speed matters in multi-call mode, but
  * the kernel image is decompressed in single-call mode, in which only
- * memcpy speed can matter and only if there is a lot of uncompressible data
+ * memmove speed can matter and only if there is a lot of uncompressible data
  * (LZMA2 stores uncompressible chunks in uncompressed form). Thus, the
  * functions below should just be kept small; it's probably not worth
  * optimizing for speed.
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -387,7 +387,14 @@ static void __init dict_uncompressed(str
 
 		*left -= copy_size;
 
-		memcpy(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
+		/*
+		 * If doing in-place decompression in single-call mode and the
+		 * uncompressed size of the file is larger than the caller
+		 * thought (i.e. it is invalid input!), the buffers below may
+		 * overlap and cause undefined behavior with memcpy().
+		 * With valid inputs memcpy() would be fine here.
+		 */
+		memmove(dict->buf + dict->pos, b->in + b->in_pos, copy_size);
 		dict->pos += copy_size;
 
 		if (dict->full < dict->pos)
@@ -397,7 +404,11 @@ static void __init dict_uncompressed(str
 			if (dict->pos == dict->end)
 				dict->pos = 0;
 
-			memcpy(b->out + b->out_pos, b->in + b->in_pos,
+			/*
+			 * Like above but for multi-call mode: use memmove()
+			 * to avoid undefined behavior with invalid input.
+			 */
+			memmove(b->out + b->out_pos, b->in + b->in_pos,
 					copy_size);
 		}
 
@@ -421,6 +432,12 @@ static uint32_t __init dict_flush(struct
 		if (dict->pos == dict->end)
 			dict->pos = 0;
 
+		/*
+		 * These buffers cannot overlap even if doing in-place
+		 * decompression because in multi-call mode dict->buf
+		 * has been allocated by us in this file; it's not
+		 * provided by the caller like in single-call mode.
+		 */
 		memcpy(b->out + b->out_pos, dict->buf + dict->start,
 				copy_size);
 	}


