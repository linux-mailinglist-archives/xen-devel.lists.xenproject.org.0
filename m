Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7094F600B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 15:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299877.511155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5lw-0002MV-Pa; Wed, 06 Apr 2022 13:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299877.511155; Wed, 06 Apr 2022 13:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc5lw-0002JP-Ly; Wed, 06 Apr 2022 13:32:32 +0000
Received: by outflank-mailman (input) for mailman id 299877;
 Wed, 06 Apr 2022 13:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc5lu-0002JJ-H3
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 13:32:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01559f15-b5ae-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 15:32:29 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-gDdYAiVlMBmwWf78i4kMVw-1; Wed, 06 Apr 2022 15:32:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0402MB2882.eurprd04.prod.outlook.com (2603:10a6:203:97::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.19; Wed, 6 Apr
 2022 13:32:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 13:32:24 +0000
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
X-Inumbo-ID: 01559f15-b5ae-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649251949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u+YHHQY0kbqHp0xNgZMAPFfK+BDg9leuVX8sHIIPGqo=;
	b=XoErujylyNdQuqNNvT8PtThYkNDFjpv2LeCmrB4fYgSzRvAS6DzODC0qX8bqYYzqMMMlDF
	pVLE7ajYHSzdTq/3ywgEk46X0S00ZsE5+Vh6/hn1qo32O+cW0NI1m67VoHztvQ5NwxSq3X
	U1NO3MvAdOLSXZXQyxqNXmZbXrjgYsE=
X-MC-Unique: gDdYAiVlMBmwWf78i4kMVw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBHS76gRkR57DBuORuzx4f1yehY+VdEpkb71WzcHFksJ8DLQm5jHabd0NFqshjPSE6SnWzGRRREAf7Rrb7TMTRfq1Cp0XzynK5VLImY6GueWTuMcKwIo55/mXieAPTQR/kC5D2hRYkrH9varHcjpD91zKEFjHqNkuPMrkA8ZeMJrNlR6WNbnHtpuuP/BLnIg+9Wc/WsR0JZN+TzotghiYF7NGcd2uwj4VD49D7MvJbMRxqyjwR9HOeKXYsKgpNZ9zds96U7VlMocuJwizeR1TqEgBihZiF3kZO/lqX8c9BbTbgy3hdNH+lmyY5Jqnv45tU5cBBHnBesa/JsAF4CY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+YHHQY0kbqHp0xNgZMAPFfK+BDg9leuVX8sHIIPGqo=;
 b=Uy+pFrsAEJBW2XnYr+bAL5yF4Lm85OxS3yMz2YfsWH7Rzo+nQ3Ady1ImSSc1508tY36scuO9+PT86NsYZIiH4+YW9nM2MiPOqWlemGHy85IwBfwxshhqsBGUmfU8EVJ9H1drD1++rqLQ2sAGKB3ROJuHKeJEQ1xQdjJJYW6Ge2ouyYOJ2Q7qlOZpUxaFmzYuyzlKfmlIYeMgf7jZA/5KSguVmgmWDbT7qqIqw+6QZy2Ni6QWsl+6AQU8wyIYZvx5TIOeonVvda+bmGRZ4ELhoDbQWd/wEzZqF0mebLBfklo8iox/Ps8Aip52lj9oFlF8nGQ8hdMHSmVq3pooj0uF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab79f62f-45e8-7cb5-bf3b-a8c003db63b9@suse.com>
Date: Wed, 6 Apr 2022 15:32:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: correct indentation in efi_tables()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0054.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e9b4b51-fb68-4114-bd22-08da17d1e2b4
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2882:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB28826972C683F381DD77BD04B3E79@AM5PR0402MB2882.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VzZnsmPkMkn2y4D0F7PNYp5XRsvtExrqhF/+bJgNC3lU5ZQ9y5fP1xWLcEhzTKQTbyPKh2b9J3tHkdwgrN94OPinJ7WCaHMGDFmnL57nwDscequCIHl5+aGcckv8jJiQ70y2WmwfS/CZ6xF7o0rznc23lYAJPVzWV8lGm0eV95ADj1Nt9o/uEer/lQaeyYz3nTGXsnO16RPmelVvrgAS9J3nmkWwjvsOizqjlQxhhku1aEmEf5mFbGGSkwwkmxFdREjR5KABnf08MgHuW7I4Xw8+vc+PIUwSXcGgkxUWTwfW3s5ib1UnyP5zOFVxkebpSSwkct1px5++4VLesnn8FFKXvGFQ8mi+f+BebGaiWwuex4gDQl2ZvkDRniIXVkpTbpiVEhdvGEp6370ssR8zLiEn3hevpM/PTFdwbq3KKOKoUTds6vN3CciOyPdXztSwkcnSeFLnCvRwNeOzz4pmaCkrVJjyPFTY6N88iQAhcYAesZloqscHSXOWMnGHXB9GZw8HmaLZeQGMqYR5PfRwsBwj48+VZdc+5lnGS8Ot+4ogNz/DtdPwfoP8iEjVMykUib4nCjW7QPpcFxGe5IjdaRnGPDCz/bpcSS8v/NO2MxT/MC+VxoRuYQfYQyiWS+Hs0SCxbUGinLrOfoK1/WnAFjbogwjSnByEg3NyhVw9MP7LVvTvN6qeDuuWS4st174Lg+tw/09sHPBCs9n/Xvo1mOZi8c9J9w0d20awLcYOXiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(8936002)(5660300002)(2906002)(6916009)(66476007)(6486002)(2616005)(6506007)(54906003)(508600001)(316002)(66556008)(6512007)(8676002)(4326008)(26005)(66946007)(31696002)(31686004)(38100700002)(186003)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnhSTEJtcTNUYnpnM3J2K0t2Z0l1dS9XZDRwcDVTVldhbXVMUC9vY3FlMUJ3?=
 =?utf-8?B?MjNzaWVzZzZDQ3dxYjRjU0lXQlhvbzRRSE0rbjkzWk05Z1gvak43TmU5SGRy?=
 =?utf-8?B?M1k3QmRKRjVQb3RoRGMvN1hhNzNKVEpRbVU0UDUzK0p3Wk5QMU1nYkdlbnUv?=
 =?utf-8?B?ZlZ2djdXMDg5citZbXhlYnAzbnJETTZLamRuMjJBdFVid2Z1TkNuWTdoZ3Vi?=
 =?utf-8?B?RTBZYTBtREpTM1lOSlk3ODk0ZzFBZGF6dDhINlo5b3Zma0ZzNmcyYTF1TjFl?=
 =?utf-8?B?N0pkenBTNExIUHJNejVxOGZKMGpicHArMEdTNzdkSWltS3NRdTQ3SUlRa0Ez?=
 =?utf-8?B?OTRxd3FxazJQRWY2cWRjQXRqd1ZsZUlTS1A0K0hrYjRuRk5EeVAyU2l3b1NU?=
 =?utf-8?B?UlZjenNtUHdCUDhtUHBCWjBOTkJEVVJpUS8rbUtlU1gvcUt5cmk1QXNrZllP?=
 =?utf-8?B?emQ2TGd6Vk1CeUxFT005dUZ4QzJEZDJUaVlqOFREbHFhaXhPWGFrN1lzeDQr?=
 =?utf-8?B?dU9jcE5WekN3Rm1oTUVHcDVIa013NzZiWnVtc2FFaHR6RStqdWRsVHBvWlh6?=
 =?utf-8?B?RmErQlVYY0xGYXNnT1F1aUtxRGgxWmlFQmoxa013VzVCd2pwbDNYZzcrWmJY?=
 =?utf-8?B?bnJUM0FPaDI0NjUxV1EvOG5FTy9BcnBCdCtHOVNVMXlCVWl3VjYyOE1PdEJs?=
 =?utf-8?B?cmx2dGxXSG5uZnJIMWkyTDFRTG1lSS9RQitqblFrNHNueFNhUDJMMkRES1Vw?=
 =?utf-8?B?bm9RL1NoWHkrdm1nODNLTkpxRm1oQWR1Z1dPTTNmZnF6amJueGJpZWRCUFpz?=
 =?utf-8?B?aHYyUkd0dXBXbVFiS3hOWkhFZGhWUTBJVnBoRU9wRHBudXk1QUYzSURrMjR4?=
 =?utf-8?B?cWdDQ0RhRjA4dUE5V1hiNmI3TkFiQWkrZzJNZkNCMERPU1doTWZ0RDZYTnk5?=
 =?utf-8?B?S3pnU0xIRWk1SEx3QmFXTENWOFZCdDFvRDlEVGlvUnF1SlVaelRidnNicWF1?=
 =?utf-8?B?TkJnOGlnTUsrU0YzaXBPWnFud3J1NHFiVzFiZmJqU2lvdmVkenIwdjIvcDRH?=
 =?utf-8?B?ZGtVMXlyNW5nVVJ1cHlMUXBXd056UE1VRFRFTG16UlAvUU5QbXhlcnErVWkw?=
 =?utf-8?B?bm9BVnY5R3FqSEUxV3dXZ01tWWtDOG0yNHdNdU1VU1ZmcHlsTEhiWFVlazh1?=
 =?utf-8?B?bVBxU21iN2s2b1lnZlhJckd2czZpQndKc2tEcWdLekcwOGJJSk9jY0pYU25J?=
 =?utf-8?B?dWpnbjJhQjdCenZTMU0zSmoxV2RheUhPUU1QSGdUTUNIcEhWdStLTk5ZNWFq?=
 =?utf-8?B?NFFUMGZoTVFHMGZpdU13QWVlQVVHcDBySXJVcVRJT1hiMG13aHhVejI2bXJn?=
 =?utf-8?B?Qjh6aFI2cDZkZktLb01TVExFNXp6cEJpdGttYmpBaERrL2dwZjNFc2xqejln?=
 =?utf-8?B?N0VwdFpXQUV0NFd6em5VU0xlZm1iNDJid1Q1Y04xbnhRSzFOdU81cGVZeGtW?=
 =?utf-8?B?N05kQjVNOEY3S09NMTBTTjJwYnVzNCtsclJ6SWhxT2NXbTI4OWVUU2dMVCtk?=
 =?utf-8?B?Z0RMZERFcEIxSWJVZFR4WnlMRGpqb2lMaVBhYjRKcWhNYlZmemFiV1lEaUtK?=
 =?utf-8?B?SFQ1ZVNubjJ5WGI1UUtXUGRXWHZEczdNUmMyc2VjS3EvdCtyN3BQd0l3M0xQ?=
 =?utf-8?B?S2h3QVBxMHRCVnZBcTVxbUR5L21uTTJJd2NDTUhUczRkcjBYd3NpUDdLM1V3?=
 =?utf-8?B?THdJTkdWMHdKc1FYNWJLanB5ZXNMejZWV1poQlRNUXh5N3dMazE1bWJreFM4?=
 =?utf-8?B?d2VzTnlSTmtteFpBMkRpRnRydU1kK3VNR1V6a0hPT3pqSVBsMGszZGx2UW9O?=
 =?utf-8?B?eVE4R0RIMDA1WGh0SS82ejlIc3VPSFVyRVhGaWY3U24rUkVCUkdmQzM0M1VQ?=
 =?utf-8?B?L2h1aXE0c3VUV1hwN2ZqYWs1aUZ2Z21ZZDRlaEVENmsvR1I3Tlo2NU1SL2JH?=
 =?utf-8?B?bFFYRHh2a0FOUUR4eWVmckZ5OHlVUnVlVFBUVXF4TW5PM1FEZVdocmhNcm0y?=
 =?utf-8?B?aTlUVGcrVnRBRWZPUEtEeXVEdkNYbUsya0gwYmRaZ0Rod3p4MzJGaHR1VEpT?=
 =?utf-8?B?TnVkSG9KcEtVZFE2SThSazhVMmtOcEFoMStZemtWMlRmc0ZEeVZtNzU3K28r?=
 =?utf-8?B?TXFWUnZaRHA1cDcxd0F3ekdrNURoOHlhb2Q4VFd4MWFDN1Y1QTNETWdqL0ZL?=
 =?utf-8?B?a1ZZTlU4SUs0eVFXQTJWWVczNnRKV0RSZzRqV1FxL2ZFZ1k5R0FMRWJDelBW?=
 =?utf-8?B?SEJRUlRmWnVVZ0hSanZlejlySXEya3l1RGFpV3dxUzZSUFBVOE9ZQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9b4b51-fb68-4114-bd22-08da17d1e2b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 13:32:24.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImTc5/e6NHBmwuQZn65N8AJYYz4KlYbKjE3trzRHWofSNCiJhpynfpXWUQHNKEvLvzK/ixQDU63AQc2AE7Mxjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2882

Eliminate hard tabs. While there also cast to the intended type.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -856,15 +856,15 @@ static void __init efi_tables(void)
         static EFI_GUID __initdata smbios3_guid = SMBIOS3_TABLE_GUID;
 
         if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
-	       efi.acpi20 = (long)efi_ct[i].VendorTable;
+            efi.acpi20 = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&acpi_guid, &efi_ct[i].VendorGuid) )
-	       efi.acpi = (long)efi_ct[i].VendorTable;
+            efi.acpi = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&mps_guid, &efi_ct[i].VendorGuid) )
-	       efi.mps = (long)efi_ct[i].VendorTable;
+            efi.mps = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios_guid, &efi_ct[i].VendorGuid) )
-	       efi.smbios = (long)efi_ct[i].VendorTable;
+            efi.smbios = (unsigned long)efi_ct[i].VendorTable;
         if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
-	       efi.smbios3 = (long)efi_ct[i].VendorTable;
+            efi.smbios3 = (unsigned long)efi_ct[i].VendorTable;
     }
 
 #ifndef CONFIG_ARM /* TODO - disabled until implemented on ARM */


