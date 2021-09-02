Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F593FEAB5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177170.322432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiCw-00028h-BP; Thu, 02 Sep 2021 08:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177170.322432; Thu, 02 Sep 2021 08:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiCw-00026B-7Y; Thu, 02 Sep 2021 08:36:26 +0000
Received: by outflank-mailman (input) for mailman id 177170;
 Thu, 02 Sep 2021 08:36:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLiCu-000261-El
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:36:24 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da8f42fa-0bc8-11ec-ae48-12813bfff9fa;
 Thu, 02 Sep 2021 08:36:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-h7Kl6CexN6K9du2Ae_-NoA-2; Thu, 02 Sep 2021 10:36:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 08:36:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:36:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0142.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 08:36:20 +0000
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
X-Inumbo-ID: da8f42fa-0bc8-11ec-ae48-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HFchKadupoYKtpNV3JYrysgf0xXI5YrxKsF7FnzFzY=;
	b=cER4fy4euTrxYJt6cNuZ4nrq7Fj7i0suLo17RUdAUdCV9ImGEH2zJUBcEM90+FiEBwC7fT
	8BnIl1mrtb9eVDdXE/hs9PUyf8aMUO6BLPsYBjO1HKVUwIf/HI2xIOyCMYrNufz6q82thK
	FDoWmWFfgNrcjHka2EySYVtsrTOo5T8=
X-MC-Unique: h7Kl6CexN6K9du2Ae_-NoA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENAuNW26oOVoUlaUGTBVtchjUH19yEzgBRSRLdxfPOPmQvDWcd0xq3ixkf3UHAZ3aDGnJmJ/stubckZ0KW7kes2Kbr1t2/A1mrLu2WBmAJIBEiFrvh5q5TQdnI8rzBn31UHP3tlbA412BHUc9c3euIFIoYU2A4ebtkh31J01+mYw1Alb9VwXGpa/QvRsjp0WBtgs6V8/3eKzRXTUDuhUtwseJSCUQ15ndw2OqEBtpa1m1qS+iaXaANK/4H70ZBOeK2+ysQs/DM+s+q+EeSDQjgnbEDPQvnzpdA9LaohrwHUp3pQHm7bSarx3ZIVzm/7uWjEtWUlMIO2rz/DNx3moFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HFchKadupoYKtpNV3JYrysgf0xXI5YrxKsF7FnzFzY=;
 b=HnwuMz2pbxBhJcat1k1iXydYwGElHcWwFXQ14FJnWWm601UzLOYzOEWI0Rx6fFj83kKn4wyfkdLYjE/R+Nie3d4wufAIyV2+wnoaY4WhrT0CHBbs0cyxVQm7SqTa//e1VHygXC7Fv66mTz0rWFctK578yXqPXcaQ/p0ZFxTLdoisjDGcw74KlYDiuTxQqub1St2fz3aJDV8Oc9ESN7abL2TRzu6bDReeWtDYxQH/EbWHrkhPgqHVf5pmLxOKDFJSdVo9ahubKYTGKkoHbOJ9f9QEHKM6eABCn8FHlRm8i48YIuLjZUhQ8KNdpTghrmQ4hSgBtDYetEFbCV0BzzsbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 6/6] x86/HVM: skip offline vCPU-s when dumping VMCBs/VMCSes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <332739d2-be0d-fe8f-9ae7-a34916f4eab6@suse.com>
Date: Thu, 2 Sep 2021 10:36:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0142.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::47) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0668c48c-5c43-402a-9a7e-08d96decbda0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774BA4DC6393856380E7D89B3CE9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rBBEvOhR7faCZjTzNU50BXFN68nDasGZ3jlg0KO6SjhlL5TykJJbwZB/CyohboKMnUO/nslnlgub068PBCWIWWfI40fKCO+T+Hr52k6a+wjRni+zPWhUhLIN3zP83pOCGUYLBpYM6OCKTXYfSxLPSVaMgcZlX47JKARUJ6hpgEnXq5soW+PcBKtKEA9I6J9QbgW/ZJd8RIoYUOEIdPWu1yG/qF7hpRCPK8mXJFi3FXBUTZ2rAn0ZP8ju0bJfWS/4+4bbhhzEtk2/QzbjrpRBIfPeHBb0OXTZ1yCJxPTUKfQwIkAav2ZoglzjfSgDoji4pvxcT9vc4sBl/3u8Rizq8go2OSyHS8tIs4TklTnZwkkFFoplyM8336FYhoTDsaZSpyYYssi/Bl7fMBNzxKM6GYGxVNufb8qFPD1HWd+m/IzOCkFtsezeKE54oIHod2A0kna6EpLJAv2VZEEtz8TCKmdcvPxauwc5RSHXwAU1jiFB9LISvyeUN4aYBS/GI4aCbmRXpsfu6zVZGZPnRGuVsXe+rPX/fkZhxs+Ywx/u8zHcsWzxSRd2CvdqyYToZswGxZqUWlAO6t0wS4w5+3RMGF1wPC863rcd/3RzDEfqzNEcXM4t5RL+kE8Z20IA0EYYsCIY1M7kBbelcH/jGRhDfEdpgtgpO1MUCxX000bUFWilely20YKIIo5t7buSxaixk5n/VDHUFsSUYEEH4NdLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(36756003)(956004)(54906003)(6486002)(6916009)(478600001)(16576012)(38100700002)(66946007)(4326008)(316002)(66556008)(2906002)(26005)(66476007)(86362001)(31696002)(186003)(8676002)(8936002)(31686004)(2616005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djZHK21UVmVpaEFnQUFyeWxLMDVaVG84RDRkOThWUFhpdGdaZGhWaWFFWjFj?=
 =?utf-8?B?Qi9NaWpOdysvTkVuVE1VTnBJWDNxdEErNnowSnlycnZWZTBUSEdwUWxjcFg4?=
 =?utf-8?B?NWJJTTBiRnFzdmh3OU82VzZHeXpoQ3BKK3ZWMk80cTJWcGdaeEdyUWZXTnhp?=
 =?utf-8?B?bTAxNGtsa3dVbUg4a3dTWExzUVJuT29xVk5lK0wyUnQ3TThJWEhWUFhnTldp?=
 =?utf-8?B?emtOWnRBaDRDOHpvK0VSN1I2VjhYVC9HN1lzUE1FMU1XU3lQdDNwNzBDcldr?=
 =?utf-8?B?WDRKZDFqSG1TZk9rdmxqSmY3UXo2VHhKRG9VY0MwMXJraWhqbGdMOGhJNnFn?=
 =?utf-8?B?SCtJYVVmYm1tYStUSzJMQWp4NFNDc2dtUkRjTEVYb01YOVJ5dmdwYXFoVGVD?=
 =?utf-8?B?YnkybnZaZnUweUdTaWxHMSt2MEo0OHhsSmF6dkpONlpzTWlFTmoxd09IeVRt?=
 =?utf-8?B?R21aV29jT3VuMUYyOHhPMVdqL3RqTWF0MlVLcjd4WDE3LzR3Wm5kK1RVd1RP?=
 =?utf-8?B?aFJkUkorU1kxWEpFTkxUOXVaZ2ZGekd3amZhWlpZZGRpVk5ObGdBSUZFbEdK?=
 =?utf-8?B?NG52SW5CeEZ4MFAyRjBNVlhFWXUrcTN6OGlNYzZyVnZCcjVnWENDUk95VjlX?=
 =?utf-8?B?MTJwejQwN0gyY0dEMUF2S3o0dmtGZDZkQVJKRmF2MEU5WkErZUpwd0JiUmRX?=
 =?utf-8?B?b2JEVUNKSW1tMy91NE16VTVvQ1RYdXhWRFVrZ05CVE5NT0RYOXpaSGV0YWVs?=
 =?utf-8?B?eGJnMjkvcmRWTEpkaHdNM2tUVkdIcE54RHlMV2hwV3pjU2x6NXFsSDhnMnZ6?=
 =?utf-8?B?S0pZc3BMNm85L2xPdWgwMi9ERlVjbjFteUtHaVFERkNiSDJXUXVXbzBla1BR?=
 =?utf-8?B?V2xzQmJyRVlhbEkvdEtuVXpaQlo3YmZCV2RmWEpERllzKzFNTDZNT0lNSFJL?=
 =?utf-8?B?Y1VDcmYvdml6cmpmenVxbk9CdytCcVo4QmRxNDZ5aEhDWVRsTS9Ed0M4TENH?=
 =?utf-8?B?MXBvSXU5R2VURkliaEVXYmFoaStrbnRzY2VqcWNiV1FRS2lwM3VUTlFlT0dn?=
 =?utf-8?B?T3cxSjN1YUY3RFRrZGJqcGVEeVozdGpObUFybVFpWDBqcWFjeThrT1Nqb3U0?=
 =?utf-8?B?YmxZTWZWV2JWWmVLUTB6c1VQQWIrdkpMOHVjajdPUHcxa3RaRFVTdFkxcnpF?=
 =?utf-8?B?Qk9tSEdhNWtuNXFiQWJlWmF1c0ZVWXlIZmVLa2E5bkFMajRNNHVGSys1Tzd1?=
 =?utf-8?B?M2xzdUFsWnV4Wk5MbGx3SktBbEFtK3lDZGUzcldmSXlic3JKeEl2NUZqMWgy?=
 =?utf-8?B?TkJvaEswZ285bUgzSUdNZTlkVHVVbGpSazZTampXbU1VeHF4N0ZFaTFnek1h?=
 =?utf-8?B?MzY4WWNiQm80LzlqUlh0OFk5LzVUN0E3bWF3WTFyTGFWeGszcE9TWVlkL2Za?=
 =?utf-8?B?akR2d1B2VXkxL2dld3EvUUJTbnBOL25VN2JRUW0rd3FtcXRWZW1BMnN2dzJU?=
 =?utf-8?B?c054YnBZRHdpN2g4dVZ5SFN1dDM2YjdMUFFWQ05mNXVqMU9YYVVaMFhhVi9o?=
 =?utf-8?B?QzFTSm9OODBsYUdnUnUwNXdvZW5ZTVlLTC9RWlBtdDkxNjJmTVQwcjRrOVhi?=
 =?utf-8?B?N1A4YkVNQ01aMGhvNE9tYjZxWk5tWjA4dXdmRUlETmowM3ArVWx3NTBRL0Er?=
 =?utf-8?B?UTQwQ29nZS9sVEYrd0JWa0NoWmZZTlg3S3BFYVpSTEFQRk80Rm9ybVdoMEJw?=
 =?utf-8?Q?ZtMhKvRL5RZit2oyUbt/l6ZZuqpE+JCOUVyH10q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0668c48c-5c43-402a-9a7e-08d96decbda0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:36:21.1863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3HeDrcO2NcmV0MsIdjnSmiC5l8AtPoOEBrEOyMQ3ojFJN/4VbgudW6OEh1AzWG99uZsTyJYiJ/ri9Ylqqyy/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

There's not really any register state associated with offline vCPU-s, so
avoid spamming the log with largely useless information while still
leaving an indication of the fact.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -241,6 +241,11 @@ static void vmcb_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( test_bit(_VPF_down, &v->pause_flags) )
+            {
+                printk("\tVCPU %u: offline\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
         }
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2133,6 +2133,11 @@ static void vmcs_dump(unsigned char ch)
         printk("\n>>> Domain %d <<<\n", d->domain_id);
         for_each_vcpu ( d, v )
         {
+            if ( test_bit(_VPF_down, &v->pause_flags) )
+            {
+                printk("\tVCPU %u: offline\n", v->vcpu_id);
+                continue;
+            }
             printk("\tVCPU %d\n", v->vcpu_id);
             vmcs_dump_vcpu(v);
         }


