Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CF690509
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492275.761741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Ji-00084J-TS; Thu, 09 Feb 2023 10:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492275.761741; Thu, 09 Feb 2023 10:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Ji-00082R-P8; Thu, 09 Feb 2023 10:38:14 +0000
Received: by outflank-mailman (input) for mailman id 492275;
 Thu, 09 Feb 2023 10:38:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4Jh-00082J-CU
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:38:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d798d6e0-a865-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 11:38:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8630.eurprd04.prod.outlook.com (2603:10a6:10:2dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 10:38:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:38:07 +0000
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
X-Inumbo-ID: d798d6e0-a865-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6S1Djz67JKipNyZQ647Hz0v+jdoj88sPhBvohNy3tf1eCvyDwffycUvxz/B7Xxx+g6jPV7SYLFAVBZTE7WYHVMuCu9oeXS+WBvYXZzV4wJAfmP04EHm5Jby8Zv4VrtQvIMhH0h0k2vRfcUWWGSQuS7CgVBOThe7vgjq8v4sR0NybSbowcnQpUUrajE4GD1NePoDwN0tLArN0oW2KJGQjeRl8w7CXJZY1GqnBTbXLCiqTsUIZV9WrXjCGdVsE5q7V/dHApUabowL9b/aDXiZk7Is7aaxcHSIH4vICNTPUwIkPHyHMZjk0AQQqGgQHFgR1usmMDBgWbql5P5t/ipdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG2Rx4pKN111MpETmzA9hKXV1FMjq3bxnugIAbeKEN4=;
 b=dNOITZcunT9z6jaWwa62dlIpr7owDZDbn0mGMGWbR+Do4NFtXPkOVsR2npkWiathcqi0wOtEwAjUcMuAzGU+VK7L5sXsG1LQUGVE0kiSQQRc75mQaxwUJOKraUKJ00EicfF8bEExl82hppt9HRLxHHFgoA+3sXe3hN2h1EXCnRxuMeK2ORNimndEWWHRQjBNWLVie1VwMNE/rbbfFQ6eslVDVO2U+tPwyXwAKQ5RTpcM87rGpeIH/3+GWXgIFUq5cM/JW3iuC2URTIEpJJH6rKhQbBM+ofVMdNA7vdZihxWYxjgYV/dLQQhy2swYJI2ixOvZlJgY5hPkPbb3ztNrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TG2Rx4pKN111MpETmzA9hKXV1FMjq3bxnugIAbeKEN4=;
 b=YvCVOxoEzpfSivFWVCB9bb3g+kGgoIy4uj3Gpro25Aq3AlY6wUCM9le18oPM+u49meaJJyVPC2ZutaB7hIis3OBdNQiOFjPa/JFmXdt6FJWVCv1cXyT3LUT3If+0p4DmP1GXq+mPwjGlDKbO9RrmPr2SxSwRMOoH720lYnHT4NQMPSbGaGNdHurJ7U3mX8co2Pb8L2WeA/1gwnOYa2B6Ph8g1hkJzZraJeY6fQzDjTKw2UDXLEJfPrPMGcpQsyjW7uA4dHCafIc/BAksTOCL/IGjZNQPE/hH2um89wzLSrhvd1hV9EMZalvIFVpEPxuOA2ctD0z2Hby4gc7zsBEWhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f62c157f-b4ed-6bb5-9862-992d8b881bff@suse.com>
Date: Thu, 9 Feb 2023 11:38:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 1/6] x86/Hyper-V: use standard C types in hyperv-tlfs.h
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6f00dc-9eda-437c-b596-08db0a89bb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b58577ciHBqBlNs0MdWhltJcHodUsSwnvlGvnqUPqbVnYc5BRJtbHQE5rq2VscZ3i3ZNSZBttfWbWWGT6EtzAK9zdE/+y4o0bTc25kfvf0T3Sor03UsbsgMJXCrFs2zslfpNU1/KdsiKD+atI6q/n+0FHYz8DrtMzdkSudr6Y1PEtJq5/fe1D5jffyS/tBiF0a3pSiQMyxxx3mhjE9zXqewK4levC7zUsrRhyYyORCQssDguPGOn03BPm9FVji1cN1WeYKHbkxkNBZaDVc78z6FB/1qmGF3zs4NTGV6IJbThi0034favtqODtCUjw6cVWT1YJNJi5QklfraSogyLBBS/bLCnFPZHYklok1gdYZjn0SUXoi1P0OhF5YdIzUheViBKVIuSHB8dcNxV5HkNLVUmv9QPbwqaxxx3mwf+Ot2mszpfWdbWjHIMeIY0WOmtwaiKqBu6lbwjE3hPIgzFszponoG4A9+I9vnFEIlTOdF59b0NIo38oYheMybh0bD8udR9bV2iqVRo21fXR+PGwyBYhNmE7Qs5SsgQDRH5TGfTBBp+R84GS8trUceFERNwfoaUCKcCMJAiuyGf+zC9GXtod1DBi4d2idcijuZxCR2xuqfd1Q1y/007nS/MIkasnXaLSi+fh3Cz675HRmZkUbkNouNyVAlw8U/LxJtvqvlpkt7lWAVrKRpXqY3Yn7Q8kpXW+mqvRc4/n7R9XT5JU8mt8gBnqu7Sf52ZAVAPM1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199018)(478600001)(6666004)(2616005)(5660300002)(6486002)(30864003)(8936002)(6512007)(186003)(26005)(31686004)(6506007)(54906003)(316002)(4326008)(8676002)(6916009)(66556008)(66946007)(41300700001)(83380400001)(66476007)(38100700002)(36756003)(31696002)(86362001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHBwazR6VVdnaXVEc3ZsSStFMHYzYkhrNUtBOFJiY3AzYmo0YU9uM29yd3pP?=
 =?utf-8?B?Q1lGVmYwZEYxcmRtcGZWRmJ3aTkvZUx0eVJzdFdXTG0rOWcrMmRPRER1VEpR?=
 =?utf-8?B?ZEdOWjdmS202YjV1U0VYbjJOenZhQWFacnk5eUZHbjdnYVhOclpualFROXAv?=
 =?utf-8?B?WmJkbmNuejdCeEtCeEFRVTNZU3ZTZ1JNV2JEamJ4UHlNUWg2V0IxazdGNy9Y?=
 =?utf-8?B?ZzlPbmJpNnlRWVRrOGJPQ3hVd2NnbTh4d1BodDdCZXRuNnh5NXAwaGVnUWhE?=
 =?utf-8?B?S3ZFekhkTnZYNG9ITXpTakY2UGVTQzExbk5KQnhSbVNjUnZPN2szMDdqRGp0?=
 =?utf-8?B?TjlmMEFLUlJ5NUdqdzR6K04wbkpFcHRueTByWURkNGVoSEIybFRLVmk4R3lV?=
 =?utf-8?B?SHhNVmFTeE5Relg3MVJUQ2RMOG5UekVreW9heEpuc0EzWEVsUkg5czk0QWIw?=
 =?utf-8?B?MTFBSHA5dkdsZG5qNnV3REZCUWdEYVlnS3J3S3Z2TnNBOEZoT21hZ0lZd0Zt?=
 =?utf-8?B?NmJhY3ZIaGF3cWxLSkQydkZJN2tLVmRsemdrOEhvZ0NRSURHdnIweGhwMmpq?=
 =?utf-8?B?aFBLbXZQYVFYNFVOR3MxOXBZMi9oRG43MnljWFVuSTA5RDJ0eTcyeWpyRXpG?=
 =?utf-8?B?TTZwZXBvOVcrYm9seGxSaENla0tuQUk1UVlPaGl4M0RhR1haUVBnR2RUb0Zv?=
 =?utf-8?B?YWVndEpVOWdCcGRUSDVpKzdTaWE3cGYvbVFnVGFlNTNyTVJIYjlTQWhORFRt?=
 =?utf-8?B?WVdUMEdXbU01YjRCUmJHTEh1UHEwN1NMcW5TS1pDdEZDeXJmTjFBMkxSdVBu?=
 =?utf-8?B?OThGMldRdEEwa1dFY1RRYWQ4dSt5MExsTW9BZDVFMkpQOEhxdFM1SnVTWTEz?=
 =?utf-8?B?WEd6cHYwdzB2UnZUWDdCZlQ5YVJKYmt0YUIvY0tUL2NTK05oVVRLb2dYaWpo?=
 =?utf-8?B?NkIrVkJidTZXUDBMNXhiWDJ1bVJIaVM3aVhEdTRuZ2VQRWRIUDZ5ZUdZUFR0?=
 =?utf-8?B?YkpONGFGbkwrT3VzUGJ2WjhaangycnM5bnAxV25nOVpIemFJTmtMMzYxcDJV?=
 =?utf-8?B?ZGk0aXFnSDZIWWJHYkllTE1HQ3FSc3NpTnMyL00zODl5Z09qQks4V28vTEJU?=
 =?utf-8?B?VVhaMGZjdWxGRGhoQjhteFVCNE5QMkRlRC9WblpObjUvMGJGenZTckViUG83?=
 =?utf-8?B?MU9QSFVLajFMSGc1TUlQcU81VEtzUFRrdlZjWHJOQmhxMm94WTBxQUdJYnVy?=
 =?utf-8?B?L3o1V0tpdjM1YlIwOFRtYksxT1huc2pFZjdiT0FkZ3B3SVNDeCtqZ1FmSXZ6?=
 =?utf-8?B?OGtkK1dxa1dNK1p3aDhlWkF2Mng4dnRDUTNVTTJwZ01oelhnNmN0Wkc3VTkz?=
 =?utf-8?B?clNVcW1ZbjJWNU95WmdvbXRBdUlaUERvN0J1eUdDeFcvRE1KZzVOYWpvbzFy?=
 =?utf-8?B?NGJDSEM4Mk5nWWdHNmpLaUVWRnJhU1lLV0E0M1NDdWY5TW5LU2JKazloK0ZF?=
 =?utf-8?B?aTVXZlVQU1JSWllTcDNsRVZmM00xZm95WDk0UlJlTFN5bEdTL1J0TVZFTEEy?=
 =?utf-8?B?dlNueHFINENWZFJhcWtTRzBqWFhHL0k5bnVoekVNaWk2dWVtTVMvb05RYVlj?=
 =?utf-8?B?S0M5cWZzUWhuUEplYjhmODgycUlXdXNBMHB3QTMyb0Y2S3puSEpFTThsYjRk?=
 =?utf-8?B?WXhBdkJVVXFNdzBCMkVoNWZpQ2ZFQWxLcXZEZ1RPaUhDWDlKeEIwL1BwUFRT?=
 =?utf-8?B?ZTl0eFlZZ2lzTWVVTk5mS2FEZ05yOVNscEFuN2ZQU1N0cnFLYVlOcWdlY045?=
 =?utf-8?B?OTMzeG9QZmRUTWJnRkVXTzVOUURhbUVkSEVseXExZkl5YlhMbHBNOWpSNXVa?=
 =?utf-8?B?Qy81VEpTYXlnVCtDc0lBdSs0SVVwNVBicmNUdU90d3FOMTQ4NHA1dXptQWhD?=
 =?utf-8?B?YkZIdnlUM2RzTytIdTBkMVZHRkl4V1A1cCsySDhjMUlUVGM5TE1NN3Z5RGNO?=
 =?utf-8?B?WFFFQjliWi9iUlViK1JTMkNMN3ROM1BscE9vRERrZXF4bFZZUmFLT0dYWUdH?=
 =?utf-8?B?UnM5Z3RQWnZYTXRUL1RrMndZRTE2UzN0NFRBTWtPRmJkLzRDK3YrZ2hPMHBx?=
 =?utf-8?Q?FXiAj3W3uGDN7ybubumRAvDme?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6f00dc-9eda-437c-b596-08db0a89bb2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:38:07.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoFb+FYw6TDBL4WQfEqLe76TGwaFMv1NI0ayepXTh3D9duQf7TixbDC/fdX5gMFdn4XJCktM2gXi7wM7Lpryww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8630

This is the only file left with a use of an __s<N> type coming from
Linux. Since the file has been using an apparently random mix of all
three classes of fixed-width types (__{s,u}<N>, {s,u}<N>, and
{,u}int<N>_t), consolidate this to use exclusively standard types.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
+++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
@@ -283,11 +283,11 @@
  * Declare the MSR used to setup pages used to communicate with the hypervisor.
  */
 union hv_x64_msr_hypercall_contents {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 enable:1;
-		u64 reserved:11;
-		u64 guest_physical_address:52;
+		uint64_t enable:1;
+		uint64_t reserved:11;
+		uint64_t guest_physical_address:52;
 	};
 };
 
@@ -295,11 +295,11 @@ union hv_x64_msr_hypercall_contents {
  * TSC page layout.
  */
 struct ms_hyperv_tsc_page {
-	volatile u32 tsc_sequence;
-	u32 reserved1;
-	volatile u64 tsc_scale;
-	volatile s64 tsc_offset;
-	u64 reserved2[509];
+	volatile uint32_t tsc_sequence;
+	uint32_t reserved1;
+	volatile uint64_t tsc_scale;
+	volatile int64_t tsc_offset;
+	uint64_t reserved2[509];
 };
 
 /*
@@ -343,21 +343,21 @@ union hv_guest_os_id
 };
 
 struct hv_reenlightenment_control {
-	__u64 vector:8;
-	__u64 reserved1:8;
-	__u64 enabled:1;
-	__u64 reserved2:15;
-	__u64 target_vp:32;
+	uint64_t vector:8;
+	uint64_t reserved1:8;
+	uint64_t enabled:1;
+	uint64_t reserved2:15;
+	uint64_t target_vp:32;
 };
 
 struct hv_tsc_emulation_control {
-	__u64 enabled:1;
-	__u64 reserved:63;
+	uint64_t enabled:1;
+	uint64_t reserved:63;
 };
 
 struct hv_tsc_emulation_status {
-	__u64 inprogress:1;
-	__u64 reserved:63;
+	uint64_t inprogress:1;
+	uint64_t reserved:63;
 };
 
 #define HV_X64_MSR_HYPERCALL_ENABLE		0x00000001
@@ -442,10 +442,10 @@ enum HV_GENERIC_SET_FORMAT {
 #define HV_CLOCK_HZ (NSEC_PER_SEC/100)
 
 typedef struct _HV_REFERENCE_TSC_PAGE {
-	__u32 tsc_sequence;
-	__u32 res1;
-	__u64 tsc_scale;
-	__s64 tsc_offset;
+	uint32_t tsc_sequence;
+	uint32_t res1;
+	uint64_t tsc_scale;
+	int64_t tsc_offset;
 } HV_REFERENCE_TSC_PAGE, *PHV_REFERENCE_TSC_PAGE;
 
 /* Define the number of synthetic interrupt sources. */
@@ -499,30 +499,30 @@ enum hv_message_type {
 
 /* Define synthetic interrupt controller message flags. */
 union hv_message_flags {
-	__u8 asu8;
+	uint8_t asu8;
 	struct {
-		__u8 msg_pending:1;
-		__u8 reserved:7;
+		uint8_t msg_pending:1;
+		uint8_t reserved:7;
 	};
 };
 
 /* Define port identifier type. */
 union hv_port_id {
-	__u32 asu32;
+	uint32_t asu32;
 	struct {
-		__u32 id:24;
-		__u32 reserved:8;
+		uint32_t id:24;
+		uint32_t reserved:8;
 	} u;
 };
 
 /* Define synthetic interrupt controller message header. */
 struct hv_message_header {
-	__u32 message_type;
-	__u8 payload_size;
+	uint32_t message_type;
+	uint8_t payload_size;
 	union hv_message_flags message_flags;
-	__u8 reserved[2];
+	uint8_t reserved[2];
 	union {
-		__u64 sender;
+		uint64_t sender;
 		union hv_port_id port;
 	};
 };
@@ -531,7 +531,7 @@ struct hv_message_header {
 struct hv_message {
 	struct hv_message_header header;
 	union {
-		__u64 payload[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
+		uint64_t payload[HV_MESSAGE_PAYLOAD_QWORD_COUNT];
 	} u;
 };
 
@@ -542,19 +542,19 @@ struct hv_message_page {
 
 /* Define timer message payload structure. */
 struct hv_timer_message_payload {
-	__u32 timer_index;
-	__u32 reserved;
-	__u64 expiration_time;	/* When the timer expired */
-	__u64 delivery_time;	/* When the message was delivered */
+	uint32_t timer_index;
+	uint32_t reserved;
+	uint64_t expiration_time; /* When the timer expired */
+	uint64_t delivery_time;   /* When the message was delivered */
 };
 
 struct hv_nested_enlightenments_control {
 	struct {
-		__u32 directhypercall:1;
-		__u32 reserved:31;
+		uint32_t directhypercall:1;
+		uint32_t reserved:31;
 	} features;
 	struct {
-		__u32 reserved;
+		uint32_t reserved;
 	} hypercallControls;
 };
 
@@ -571,199 +571,199 @@ union hv_vp_assist_page_msr
 
 /* Define virtual processor assist page structure. */
 struct hv_vp_assist_page {
-	__u32 apic_assist;
-	__u32 reserved1;
-	__u64 vtl_control[3];
+	uint32_t apic_assist;
+	uint32_t reserved1;
+	uint64_t vtl_control[3];
 	struct hv_nested_enlightenments_control nested_control;
-	__u8 enlighten_vmentry;
-	__u8 reserved2[7];
-	__u64 current_nested_vmcs;
+	uint8_t enlighten_vmentry;
+	uint8_t reserved2[7];
+	uint64_t current_nested_vmcs;
 };
 
 struct hv_enlightened_vmcs {
-	u32 revision_id;
-	u32 abort;
+	uint32_t revision_id;
+	uint32_t abort;
 
-	u16 host_es_selector;
-	u16 host_cs_selector;
-	u16 host_ss_selector;
-	u16 host_ds_selector;
-	u16 host_fs_selector;
-	u16 host_gs_selector;
-	u16 host_tr_selector;
-
-	u16 padding16_1;
-
-	u64 host_ia32_pat;
-	u64 host_ia32_efer;
-
-	u64 host_cr0;
-	u64 host_cr3;
-	u64 host_cr4;
-
-	u64 host_ia32_sysenter_esp;
-	u64 host_ia32_sysenter_eip;
-	u64 host_rip;
-	u32 host_ia32_sysenter_cs;
-
-	u32 pin_based_vm_exec_control;
-	u32 vm_exit_controls;
-	u32 secondary_vm_exec_control;
-
-	u64 io_bitmap_a;
-	u64 io_bitmap_b;
-	u64 msr_bitmap;
-
-	u16 guest_es_selector;
-	u16 guest_cs_selector;
-	u16 guest_ss_selector;
-	u16 guest_ds_selector;
-	u16 guest_fs_selector;
-	u16 guest_gs_selector;
-	u16 guest_ldtr_selector;
-	u16 guest_tr_selector;
-
-	u32 guest_es_limit;
-	u32 guest_cs_limit;
-	u32 guest_ss_limit;
-	u32 guest_ds_limit;
-	u32 guest_fs_limit;
-	u32 guest_gs_limit;
-	u32 guest_ldtr_limit;
-	u32 guest_tr_limit;
-	u32 guest_gdtr_limit;
-	u32 guest_idtr_limit;
-
-	u32 guest_es_ar_bytes;
-	u32 guest_cs_ar_bytes;
-	u32 guest_ss_ar_bytes;
-	u32 guest_ds_ar_bytes;
-	u32 guest_fs_ar_bytes;
-	u32 guest_gs_ar_bytes;
-	u32 guest_ldtr_ar_bytes;
-	u32 guest_tr_ar_bytes;
-
-	u64 guest_es_base;
-	u64 guest_cs_base;
-	u64 guest_ss_base;
-	u64 guest_ds_base;
-	u64 guest_fs_base;
-	u64 guest_gs_base;
-	u64 guest_ldtr_base;
-	u64 guest_tr_base;
-	u64 guest_gdtr_base;
-	u64 guest_idtr_base;
-
-	u64 padding64_1[3];
-
-	u64 vm_exit_msr_store_addr;
-	u64 vm_exit_msr_load_addr;
-	u64 vm_entry_msr_load_addr;
-
-	u64 cr3_target_value0;
-	u64 cr3_target_value1;
-	u64 cr3_target_value2;
-	u64 cr3_target_value3;
-
-	u32 page_fault_error_code_mask;
-	u32 page_fault_error_code_match;
-
-	u32 cr3_target_count;
-	u32 vm_exit_msr_store_count;
-	u32 vm_exit_msr_load_count;
-	u32 vm_entry_msr_load_count;
-
-	u64 tsc_offset;
-	u64 virtual_apic_page_addr;
-	u64 vmcs_link_pointer;
-
-	u64 guest_ia32_debugctl;
-	u64 guest_ia32_pat;
-	u64 guest_ia32_efer;
-
-	u64 guest_pdptr0;
-	u64 guest_pdptr1;
-	u64 guest_pdptr2;
-	u64 guest_pdptr3;
-
-	u64 guest_pending_dbg_exceptions;
-	u64 guest_sysenter_esp;
-	u64 guest_sysenter_eip;
-
-	u32 guest_activity_state;
-	u32 guest_sysenter_cs;
-
-	u64 cr0_guest_host_mask;
-	u64 cr4_guest_host_mask;
-	u64 cr0_read_shadow;
-	u64 cr4_read_shadow;
-	u64 guest_cr0;
-	u64 guest_cr3;
-	u64 guest_cr4;
-	u64 guest_dr7;
-
-	u64 host_fs_base;
-	u64 host_gs_base;
-	u64 host_tr_base;
-	u64 host_gdtr_base;
-	u64 host_idtr_base;
-	u64 host_rsp;
-
-	u64 ept_pointer;
-
-	u16 virtual_processor_id;
-	u16 padding16_2[3];
-
-	u64 padding64_2[5];
-	u64 guest_physical_address;
-
-	u32 vm_instruction_error;
-	u32 vm_exit_reason;
-	u32 vm_exit_intr_info;
-	u32 vm_exit_intr_error_code;
-	u32 idt_vectoring_info_field;
-	u32 idt_vectoring_error_code;
-	u32 vm_exit_instruction_len;
-	u32 vmx_instruction_info;
-
-	u64 exit_qualification;
-	u64 exit_io_instruction_ecx;
-	u64 exit_io_instruction_esi;
-	u64 exit_io_instruction_edi;
-	u64 exit_io_instruction_eip;
-
-	u64 guest_linear_address;
-	u64 guest_rsp;
-	u64 guest_rflags;
-
-	u32 guest_interruptibility_info;
-	u32 cpu_based_vm_exec_control;
-	u32 exception_bitmap;
-	u32 vm_entry_controls;
-	u32 vm_entry_intr_info_field;
-	u32 vm_entry_exception_error_code;
-	u32 vm_entry_instruction_len;
-	u32 tpr_threshold;
-
-	u64 guest_rip;
-
-	u32 hv_clean_fields;
-	u32 hv_padding_32;
-	u32 hv_synthetic_controls;
-	struct {
-		u32 nested_flush_hypercall:1;
-		u32 msr_bitmap:1;
-		u32 reserved:30;
+	uint16_t host_es_selector;
+	uint16_t host_cs_selector;
+	uint16_t host_ss_selector;
+	uint16_t host_ds_selector;
+	uint16_t host_fs_selector;
+	uint16_t host_gs_selector;
+	uint16_t host_tr_selector;
+
+	uint16_t padding16_1;
+
+	uint64_t host_ia32_pat;
+	uint64_t host_ia32_efer;
+
+	uint64_t host_cr0;
+	uint64_t host_cr3;
+	uint64_t host_cr4;
+
+	uint64_t host_ia32_sysenter_esp;
+	uint64_t host_ia32_sysenter_eip;
+	uint64_t host_rip;
+	uint32_t host_ia32_sysenter_cs;
+
+	uint32_t pin_based_vm_exec_control;
+	uint32_t vm_exit_controls;
+	uint32_t secondary_vm_exec_control;
+
+	uint64_t io_bitmap_a;
+	uint64_t io_bitmap_b;
+	uint64_t msr_bitmap;
+
+	uint16_t guest_es_selector;
+	uint16_t guest_cs_selector;
+	uint16_t guest_ss_selector;
+	uint16_t guest_ds_selector;
+	uint16_t guest_fs_selector;
+	uint16_t guest_gs_selector;
+	uint16_t guest_ldtr_selector;
+	uint16_t guest_tr_selector;
+
+	uint32_t guest_es_limit;
+	uint32_t guest_cs_limit;
+	uint32_t guest_ss_limit;
+	uint32_t guest_ds_limit;
+	uint32_t guest_fs_limit;
+	uint32_t guest_gs_limit;
+	uint32_t guest_ldtr_limit;
+	uint32_t guest_tr_limit;
+	uint32_t guest_gdtr_limit;
+	uint32_t guest_idtr_limit;
+
+	uint32_t guest_es_ar_bytes;
+	uint32_t guest_cs_ar_bytes;
+	uint32_t guest_ss_ar_bytes;
+	uint32_t guest_ds_ar_bytes;
+	uint32_t guest_fs_ar_bytes;
+	uint32_t guest_gs_ar_bytes;
+	uint32_t guest_ldtr_ar_bytes;
+	uint32_t guest_tr_ar_bytes;
+
+	uint64_t guest_es_base;
+	uint64_t guest_cs_base;
+	uint64_t guest_ss_base;
+	uint64_t guest_ds_base;
+	uint64_t guest_fs_base;
+	uint64_t guest_gs_base;
+	uint64_t guest_ldtr_base;
+	uint64_t guest_tr_base;
+	uint64_t guest_gdtr_base;
+	uint64_t guest_idtr_base;
+
+	uint64_t padding64_1[3];
+
+	uint64_t vm_exit_msr_store_addr;
+	uint64_t vm_exit_msr_load_addr;
+	uint64_t vm_entry_msr_load_addr;
+
+	uint64_t cr3_target_value0;
+	uint64_t cr3_target_value1;
+	uint64_t cr3_target_value2;
+	uint64_t cr3_target_value3;
+
+	uint32_t page_fault_error_code_mask;
+	uint32_t page_fault_error_code_match;
+
+	uint32_t cr3_target_count;
+	uint32_t vm_exit_msr_store_count;
+	uint32_t vm_exit_msr_load_count;
+	uint32_t vm_entry_msr_load_count;
+
+	uint64_t tsc_offset;
+	uint64_t virtual_apic_page_addr;
+	uint64_t vmcs_link_pointer;
+
+	uint64_t guest_ia32_debugctl;
+	uint64_t guest_ia32_pat;
+	uint64_t guest_ia32_efer;
+
+	uint64_t guest_pdptr0;
+	uint64_t guest_pdptr1;
+	uint64_t guest_pdptr2;
+	uint64_t guest_pdptr3;
+
+	uint64_t guest_pending_dbg_exceptions;
+	uint64_t guest_sysenter_esp;
+	uint64_t guest_sysenter_eip;
+
+	uint32_t guest_activity_state;
+	uint32_t guest_sysenter_cs;
+
+	uint64_t cr0_guest_host_mask;
+	uint64_t cr4_guest_host_mask;
+	uint64_t cr0_read_shadow;
+	uint64_t cr4_read_shadow;
+	uint64_t guest_cr0;
+	uint64_t guest_cr3;
+	uint64_t guest_cr4;
+	uint64_t guest_dr7;
+
+	uint64_t host_fs_base;
+	uint64_t host_gs_base;
+	uint64_t host_tr_base;
+	uint64_t host_gdtr_base;
+	uint64_t host_idtr_base;
+	uint64_t host_rsp;
+
+	uint64_t ept_pointer;
+
+	uint16_t virtual_processor_id;
+	uint16_t padding16_2[3];
+
+	uint64_t padding64_2[5];
+	uint64_t guest_physical_address;
+
+	uint32_t vm_instruction_error;
+	uint32_t vm_exit_reason;
+	uint32_t vm_exit_intr_info;
+	uint32_t vm_exit_intr_error_code;
+	uint32_t idt_vectoring_info_field;
+	uint32_t idt_vectoring_error_code;
+	uint32_t vm_exit_instruction_len;
+	uint32_t vmx_instruction_info;
+
+	uint64_t exit_qualification;
+	uint64_t exit_io_instruction_ecx;
+	uint64_t exit_io_instruction_esi;
+	uint64_t exit_io_instruction_edi;
+	uint64_t exit_io_instruction_eip;
+
+	uint64_t guest_linear_address;
+	uint64_t guest_rsp;
+	uint64_t guest_rflags;
+
+	uint32_t guest_interruptibility_info;
+	uint32_t cpu_based_vm_exec_control;
+	uint32_t exception_bitmap;
+	uint32_t vm_entry_controls;
+	uint32_t vm_entry_intr_info_field;
+	uint32_t vm_entry_exception_error_code;
+	uint32_t vm_entry_instruction_len;
+	uint32_t tpr_threshold;
+
+	uint64_t guest_rip;
+
+	uint32_t hv_clean_fields;
+	uint32_t hv_padding_32;
+	uint32_t hv_synthetic_controls;
+	struct {
+		uint32_t nested_flush_hypercall:1;
+		uint32_t msr_bitmap:1;
+		uint32_t reserved:30;
 	}  hv_enlightenments_control;
-	u32 hv_vp_id;
+	uint32_t hv_vp_id;
 
-	u64 hv_vm_id;
-	u64 partition_assist_page;
-	u64 padding64_4[4];
-	u64 guest_bndcfgs;
-	u64 padding64_5[7];
-	u64 xss_exit_bitmap;
-	u64 padding64_6[7];
+	uint64_t hv_vm_id;
+	uint64_t partition_assist_page;
+	uint64_t padding64_4[4];
+	uint64_t guest_bndcfgs;
+	uint64_t padding64_5[7];
+	uint64_t xss_exit_bitmap;
+	uint64_t padding64_6[7];
 };
 
 #define HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE			0
@@ -794,17 +794,17 @@ struct hv_enlightened_vmcs {
  * Synthetic timer configuration.
  */
 union hv_stimer_config {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 enable:1;
-		u64 periodic:1;
-		u64 lazy:1;
-		u64 auto_enable:1;
-		u64 apic_vector:8;
-		u64 direct_mode:1;
-		u64 reserved_z0:3;
-		u64 sintx:4;
-		u64 reserved_z1:44;
+		uint64_t enable:1;
+		uint64_t periodic:1;
+		uint64_t lazy:1;
+		uint64_t auto_enable:1;
+		uint64_t apic_vector:8;
+		uint64_t direct_mode:1;
+		uint64_t reserved_z0:3;
+		uint64_t sintx:4;
+		uint64_t reserved_z1:44;
 	};
 };
 
@@ -816,70 +816,70 @@ union hv_synic_event_flags {
 
 /* Define SynIC control register. */
 union hv_synic_scontrol {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 enable:1;
-		u64 reserved:63;
+		uint64_t enable:1;
+		uint64_t reserved:63;
 	};
 };
 
 /* Define synthetic interrupt source. */
 union hv_synic_sint {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 vector:8;
-		u64 reserved1:8;
-		u64 masked:1;
-		u64 auto_eoi:1;
-		u64 polling:1;
-		u64 reserved2:45;
+		uint64_t vector:8;
+		uint64_t reserved1:8;
+		uint64_t masked:1;
+		uint64_t auto_eoi:1;
+		uint64_t polling:1;
+		uint64_t reserved2:45;
 	};
 };
 
 /* Define the format of the SIMP register */
 union hv_synic_simp {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 simp_enabled:1;
-		u64 preserved:11;
-		u64 base_simp_gpa:52;
+		uint64_t simp_enabled:1;
+		uint64_t preserved:11;
+		uint64_t base_simp_gpa:52;
 	};
 };
 
 /* Define the format of the SIEFP register */
 union hv_synic_siefp {
-	u64 as_uint64;
+	uint64_t as_uint64;
 	struct {
-		u64 siefp_enabled:1;
-		u64 preserved:11;
-		u64 base_siefp_gpa:52;
+		uint64_t siefp_enabled:1;
+		uint64_t preserved:11;
+		uint64_t base_siefp_gpa:52;
 	};
 };
 
 struct hv_vpset {
-	u64 format;
-	u64 valid_bank_mask;
-	u64 bank_contents[];
+	uint64_t format;
+	uint64_t valid_bank_mask;
+	uint64_t bank_contents[];
 };
 
 /* HvCallSendSyntheticClusterIpi hypercall */
 struct hv_send_ipi {
-	u32 vector;
-	u32 reserved;
-	u64 cpu_mask;
+	uint32_t vector;
+	uint32_t reserved;
+	uint64_t cpu_mask;
 };
 
 /* HvCallSendSyntheticClusterIpiEx hypercall */
 struct hv_send_ipi_ex {
-	u32 vector;
-	u32 reserved;
+	uint32_t vector;
+	uint32_t reserved;
 	struct hv_vpset vp_set;
 };
 
 /* HvFlushGuestPhysicalAddressSpace hypercalls */
 struct hv_guest_mapping_flush {
-	u64 address_space;
-	u64 flags;
+	uint64_t address_space;
+	uint64_t flags;
 };
 
 /*
@@ -890,11 +890,11 @@ struct hv_guest_mapping_flush {
 
 /* HvFlushGuestPhysicalAddressList hypercall */
 union hv_gpa_page_range {
-	u64 address_space;
+	uint64_t address_space;
 	struct {
-		u64 additional_pages:11;
-		u64 largepage:1;
-		u64 basepfn:52;
+		uint64_t additional_pages:11;
+		uint64_t largepage:1;
+		uint64_t basepfn:52;
 	} page;
 };
 
@@ -903,32 +903,32 @@ union hv_gpa_page_range {
  * count is equal with how many entries of union hv_gpa_page_range can
  * be populated into the input parameter page.
  */
-#define HV_MAX_FLUSH_REP_COUNT ((HV_HYP_PAGE_SIZE - 2 * sizeof(u64)) /	\
+#define HV_MAX_FLUSH_REP_COUNT ((HV_HYP_PAGE_SIZE - 2 * sizeof(uint64_t)) / \
 				sizeof(union hv_gpa_page_range))
 
 struct hv_guest_mapping_flush_list {
-	u64 address_space;
-	u64 flags;
+	uint64_t address_space;
+	uint64_t flags;
 	union hv_gpa_page_range gpa_list[HV_MAX_FLUSH_REP_COUNT];
 };
 
 /* HvFlushVirtualAddressSpace, HvFlushVirtualAddressList hypercalls */
 struct hv_tlb_flush {
-	u64 address_space;
-	u64 flags;
-	u64 processor_mask;
-	u64 gva_list[];
+	uint64_t address_space;
+	uint64_t flags;
+	uint64_t processor_mask;
+	uint64_t gva_list[];
 };
 
 /* HvFlushVirtualAddressSpaceEx hypercall */
 struct hv_tlb_flush_ex {
-	u64 address_space;
-	u64 flags;
+	uint64_t address_space;
+	uint64_t flags;
 	struct hv_vpset hv_vp_set;
-	/* u64 gva_list[]; */
+	/* uint64_t gva_list[]; */
 };
 
 struct hv_partition_assist_pg {
-	u32 tlb_lock_count;
+	uint32_t tlb_lock_count;
 };
 #endif


