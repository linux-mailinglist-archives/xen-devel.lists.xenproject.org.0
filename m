Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80BC73576
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166711.1493218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RU-00047r-PV; Thu, 20 Nov 2025 09:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166711.1493218; Thu, 20 Nov 2025 09:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM1RU-00045n-Jy; Thu, 20 Nov 2025 09:59:08 +0000
Received: by outflank-mailman (input) for mailman id 1166711;
 Thu, 20 Nov 2025 09:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM1RT-0002R9-9D
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:59:07 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd18d7e-c5f7-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 10:59:06 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by BY5PR03MB5125.namprd03.prod.outlook.com (2603:10b6:a03:1ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:59:03 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::2e3c:781a:5f98:7f19%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:59:03 +0000
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
X-Inumbo-ID: 8cd18d7e-c5f7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b54PghwqrbFFnH3+0Cz5Nev/aq+/5b3vzaM2JX5xYtm2Fv5TeztRpQ3WBnjO5yJtgL4eTGOeKKkGYKxPO37KuNdZVhcLjWG3+OLx0N2oEIWrVmlnyVlbjws2rympb/+Sk1WGE8uRL0TQRKJHjAX5l1ULXaVeTXvMPJa7bxs9fL3LDCQ4t61M0+tdj3NluH6xoqucgsedWO04qmQjxbJuG28lKybgwZUpKFQOJ3X0Xv9sf4jjWFDxJulKqbqvhRhPZHH6C6Wdd8Uw0pq5Z/NF9YziY0RQJfmRhApo3J1Eddk/KaDGrpTTX5q9zoIctx82aIm+y0AZlWEkKBQzqhM5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbCrwlvezFLJjSfH4rjfQHTAYF9jHHhDrcGai00ypnA=;
 b=DNgRG0OYRZ4b+r2ZEw7lSz15sY9ucpMTQc9W6pkz356i97AvW1OevlV2HGH2Dc27wdBFT6F1McKzbOJwROzdJUJdeTxfmhHsOCL5yZL1jixLRJQi/r7HrEocoqltcwCXxfOj0s1GAbqSP+TRXmIQAbWiDJ1CkS3Lk8YxB1NCr76pi+OeuPL+LQ3+Yt+NV6DIxZy6ysBVwJxwP4/9ALK9JOxc2KMyxyIoCc9SoDl/2yKhILgS2eecw3zDi+ljnfdm/EyUDZBLqfDGmS/gr4fOAWWMSKQq4QeQwdkPiLKmd756FVvC2VA5usrllNduzWfVAJohUh6HeZR5GepleaWNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbCrwlvezFLJjSfH4rjfQHTAYF9jHHhDrcGai00ypnA=;
 b=eHKZ/rsLE0PwmRw4uXcjRO0gLjQDw0IdsWLZ9yJC+LatO8vfugHq6DPxA9x1CrRaymtvNINgtFY0TklNpUWq8RpLvzhZclGSzPmXQiK8qf6sMeKg3GJ/FnsWnuUSr0gTH5T7gwmHYAI6r1253N+uk3Mfi4ToBlXYXI9Xi5G7fc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 12/12] x86/irq: convert irq_desc pending_mask field to integer
Date: Thu, 20 Nov 2025 10:58:26 +0100
Message-ID: <20251120095826.25782-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0022.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::17) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|BY5PR03MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff04dbc-0d7f-42ca-c925-08de281b6f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3RJejFLa1ZMTlRvWm5SMnlzZ29ESUswcTBha3V5djh0bGhHT3VEd0h2dGNC?=
 =?utf-8?B?YmUvOUdqbXVxRTF4dnZKS0dZSXcvekJLeVp6K1A1Q0pzdTE2eDU2RzVHa3Jq?=
 =?utf-8?B?YXAvNVpaTDVkWHFLWS9Xanltb2dXUWt2TUtpdTkxSnJsWDF6V0hGdGRmZkdV?=
 =?utf-8?B?QkVqVG5iZWwwSEpXanV0M3Uzdk5nN3hYNjJ4NFBseWhjaU1nYlBTWGRYRjYz?=
 =?utf-8?B?Q0thNXlLU3I5RUVQWWFMZUtZQmNVU3MrV0Rvem53QkZSQmtmL2VaQnA1WjB1?=
 =?utf-8?B?bEpNdUhBeXQ5M0N3aTVrWm1uQzkzT3plMC9DZGdUWDM4R2NkT1A0QVpXQUVv?=
 =?utf-8?B?Syt4UWpZbnFYd2g3SjVkT2NmMTBmNjVYdHU4MFRQVkFrcnlmRHZvKzliVCtW?=
 =?utf-8?B?cEF3QnBtMGFpa0NEQUlmT200SEdaTXNPZXRrSUkwTWtVUjVmeW5rUy9leXk5?=
 =?utf-8?B?TVF6WjYyTEhWWWFOeGRIVXExc29tZ2VsRXFRakJST3hMQWZvUlhCcGVqd0Rp?=
 =?utf-8?B?Y3N1NVdqcm9yQStidStPaDI0M2ZndmMwRENwRHlYRkp3YVNxQzJSMTZQdWcw?=
 =?utf-8?B?VTBNMXEwZ1FaVzRZMXBxM0NQUzJ5Vmc4L2JWU3I5UlluQ3kvMDNyQW1Mbzdr?=
 =?utf-8?B?cXlucFJXT3NENzIyTFo3MXJGOVRROWpXSkFUOUFNSGM0eE0zSWFIR3FPOGtP?=
 =?utf-8?B?Q0tLakE4NTNseHZGejRmczdwNmNwblZEaUFkY0RpeVBlYy9DemlXbVhlWmJv?=
 =?utf-8?B?WkpnbWhRMnYzazJocGFBWE16U2lKYjRmWDliMHFuMmRGQU96UGkvTFp3K01r?=
 =?utf-8?B?WnRjVC9wUWtIcm44a3lDL1ZrWVFhdVVKWnFHQ3hpaXhidkRJU3FSZy9nUC82?=
 =?utf-8?B?MUROYjM0V2h1YTJjNFJuekdHN05KSy93QUpxRkJnQWhhd2FjTmZPVlZVUXV1?=
 =?utf-8?B?M2VaMHpmRTB0R0NaOXVsN2dRTldGN0hLR2Nsb2xWMW9SWFZKNHEyYXFoYjRs?=
 =?utf-8?B?SnVHenhVVmFrUXRMeS9PTVVvdEprTEp3UTFLdGxuZDZaeUpRaS95M0c0KzZs?=
 =?utf-8?B?dkdvUWdiVk9ZVUVBbUt5cm0ybUNSTGpxTW9EY1pUcVc1RkJFNUZRRWp5MlRp?=
 =?utf-8?B?T0ZUcWtrcGIyVjM0bktKa3liT3AyL0VERW1GdkZPckhqYUFiSm02L0hJUStC?=
 =?utf-8?B?WDVBbmlKTE1QbTh6ZHFxdXJIdFFoK1dkdDJTc3J0Zld0SG9nSFVIWGJseWpr?=
 =?utf-8?B?Skp3NDBBNmE0Mml6Nk9wUjVqall5bndmaWZ5Q3FVclJyWGphalltRFUwMmdE?=
 =?utf-8?B?QXVocHJjOFRXUlFTeDJJNU5wS1ZhRzRKNWM2TFZHNnhrU2VILzF2R1Y0VGhN?=
 =?utf-8?B?d3NTZ1RFRkswK2pQNFhUQ3Q1bHltNUY3eFp5UThwS2VRaU9FVE41aHpldkdS?=
 =?utf-8?B?UFJISFJCbUpFNmxveVRCelB5M0M0ZGkxRFdDZlV4dno1TC9RV1d4a2FIMzZC?=
 =?utf-8?B?VTZUTnZKUUFhK05wWEZjbGhDb3VydzVPcWRPRVQ0bVloODJFYTM2OXJBcmw4?=
 =?utf-8?B?Ky9EVDd5VFRodDNiZGdIaGt3L2orZEREck5HRkhXeDVQdUM2S001WFpMY2R1?=
 =?utf-8?B?K1VEZnYzdnZQSjQ2YWJTZzJjRnZ4cy9vcUFOSDJQNFgrdUJORmhmRCtsZDZu?=
 =?utf-8?B?a01NSFR6bW0rcXNyTmtVNENLbGQ1NFJ0OUVibEFXTGo0SVM5cnRiRXMwTUsz?=
 =?utf-8?B?OFJZSVJ0SUZGYXdCQlJtS1Fqd29jKzljOTkvUC9pZ3ZsdTNocFRjTUNyOXZz?=
 =?utf-8?B?bDlUM2thN1g5aGtHeG9CWmxybEE5UVJhZEkwckdPeUFFdCtjZCszRUs5UkVz?=
 =?utf-8?B?ZWlIeU9ZdDdkcHptYU1Na0ladFYyYld4eUFkZGlBMFNmTnRsRGlYTjVpNHcz?=
 =?utf-8?Q?nxcpuhLE1YlQDCyutiDGMsxa1OAncJ8x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnRHeTdIWTY3eENEOE5aVjZZWHI4RS8xVVhrSEtINFY4ZFIrekJMZ09HZG1U?=
 =?utf-8?B?Si9RZUFQUmJOejF2ODlmUmUzSC9TZW44RHhsMEFYVlhYNWF2RmNnK0ExVERI?=
 =?utf-8?B?MzV0ZElEZWJNd0o2cEpyZnRYWS93WFhLTlpGUE5mNjlpai9FT2V3MHFkWEFI?=
 =?utf-8?B?NjN3WlMxMTB4MFUzTTdDTzRtZlNNcDB0WWRlcTVRYWRFeTFQN2JzaFBkQ1gw?=
 =?utf-8?B?MWo5VWpyZGIxS1VIcW9CWWF5cU1iV1FHWHl0cmVWRW1WSWJ2OU5YQVdNOFd3?=
 =?utf-8?B?WDNIa1NFbndQTmNTT0kyamJrT0I4S2VUbmswekExdmdFTDhVUDFzbUtZazVV?=
 =?utf-8?B?SVV5YVJ6L0dKbFdKUitOMVROVk1LKzNoQ0dYYmZpaXJ6Y1ZjQ2JFWWNqNGlh?=
 =?utf-8?B?aHN3d016RFhEOHhwYmRuOEgrQ0dONzdxeEJwU0YyZWlvSlVTS2ZCb2Ftem1B?=
 =?utf-8?B?a1o4OTJ3TWpUSFZZVEV4YkNzUUxhM0pTL3RBdkh2MjJLWTRMRGgvNTBvVnVi?=
 =?utf-8?B?L2ZJZ2k1WDZQYWV2QUpUU3VzY2NtcUI2cDVDV0ZQR1p6a1RYTG12MXNnNStV?=
 =?utf-8?B?T0s1TkZjZmxmUHVvT1Njd05zY1FyM3hJYUJFUGZ5a2NQZlRRaWsrcVBtWE9S?=
 =?utf-8?B?YzNsekZRZUZnK0llTDFHSG5QMm1NSDcweHZ6UjVEZU5mZmZjTG80YWd3Y1dM?=
 =?utf-8?B?UnRzUW00RzhUSy9WYUhQVVpWZzlzRkRsR01IYUpjdk9xakUzZzJ1RUlUMi9K?=
 =?utf-8?B?ai85OHR4M0NUaGY0Z2xpQVc3SEFzWWovTnhpemVtbHV3WFNma040dC9XT2o5?=
 =?utf-8?B?K1R4Zm1GNFNLdFVuMjZBc0owYVdPRFNlaVJFTHlYSlpwd1VPYnM1MUh0RU05?=
 =?utf-8?B?YlY2RDlKL05qNW1JTm9ZcHNEK2VCYmNoQy94RkRQYkpud01QTlB2bFR0R1RB?=
 =?utf-8?B?QmUyTyt5TCsyK0djMTFXbyt6a0RJV3ZUdGZQWGd4QkFuQ2J2QnY3NUdZNG44?=
 =?utf-8?B?b0xDb2s3WkFkczhqTzZnMjBjU1ZqbG5ERmQ0OU9QUC9JWWFkVzh1d3Q2KzhV?=
 =?utf-8?B?all1bDJraFh2T0ZMUWlhTmxlSzkxb3JyWEdmTExZVDY1TWdsaXBPZkFNVkF5?=
 =?utf-8?B?d1RQOHpFNTFhUmRDWGd5RWFNNlNEeVdGeld0UGFsM3hqMGEzb0VWeXRkRGFO?=
 =?utf-8?B?dHF4ZnJGUUxFdzFGM0JHbWVKczUya0EveEZYTzV4UEJnTHJ0TEpoWEhHNExo?=
 =?utf-8?B?TXc4YytlVHpESVhLUFFiOGZjcXA2ekVzbHE5Wi9rTlgxWVhpenVab2poOWpi?=
 =?utf-8?B?a1NmcUh3UDZMS1luRCtvVnlxbXdQeHpzbE5hazUvZ2NRTzVoMEtsT28wbzRH?=
 =?utf-8?B?T3M1UlR0TktCVi9SSmF4MVlmU0ZhZ25LUGVyV1djTURrSWhmeDJzMTJKQVpi?=
 =?utf-8?B?cG45SFNhZ3Y4NS83NDhyaVUzcE82WVBXTS9OeVRtMTZCNDYwTW1RVWZVcmNT?=
 =?utf-8?B?NjNiTWE3LzBTbzE0Q1BEbi9WS3FITVdYMmhMdzNiTndHM3pkandDVFpicHZR?=
 =?utf-8?B?OGp3cEI0TVhzdXBZSGx0dEFaWG1zMnpTWGN0VXNBYnc3aUJpbm9LNTJ0WTBI?=
 =?utf-8?B?aFBPNW9xYmJJOXJCblpCTU9ncWxmcjU0T3JkODc0UEJvOW4vNitlNkhpdWh6?=
 =?utf-8?B?Tld3QWtzVlh1cVVmbWNwRm1oakdWTVhIbGZCcWhBby9NZGVGUm5rMzZwR3l0?=
 =?utf-8?B?enl0Zi9pR051UmdHR0VRTitXbDdKVE9RNFp3K3Y5dlFwWmptKzNJNjhRWWpw?=
 =?utf-8?B?Q1EyK1U2RU1wL2tDSjhDcituMXlXbjRyaFBydXkzRUtYcU5HVHZIK3N4bmNx?=
 =?utf-8?B?ZFNKU0ZHQ0RUc2NlVjJOSEhka2t1ZUhzNERUZWJST3lKbDRuRVlsRjJWYklx?=
 =?utf-8?B?dDFsWnVsZ0NrbUJmMm1HWFFoUFlVNWdSL01jVHVwNHg3YlIvb1FlQXNwN0Zz?=
 =?utf-8?B?TUhuUmRiVzBVeEdtTXBkVzdScHFlNlEwSEZGU21JMGRTenNXWkdEcUZYRzQ0?=
 =?utf-8?B?SGpaUnBncXcrVWxqSnVqUlNkcHdScnBrVzdaOXErWHg5UWZyZFBuSHoyVU1D?=
 =?utf-8?Q?O9RgaiykJAcbiDT3qnC7as4ZS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff04dbc-0d7f-42ca-c925-08de281b6f83
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:59:03.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ziK2Ay+IYLinaQDpi69HISzoiIbcS8aiVmC0i8YrYMKUN/g/VkZUVj8kIX4WzWSi2e7qsAwppggRTj9YFAZtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5125

Much like the rest of the fields that relate to the current or old CPU
target, the pending_mask can be converted into an integer field.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/irq.h |  2 +-
 xen/arch/x86/irq.c             | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index bc59ce7c3ffb..55047772eb46 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -73,7 +73,7 @@ struct arch_irq_desc {
 #define CPU_INVALID  ~0U
         unsigned int cpu;                /* Target CPU of the interrupt. */
         unsigned int old_cpu;
-        cpumask_var_t pending_mask;
+        unsigned int pending_cpu;
         vmask_t *used_vectors;
         bool move_cleanup : 1;
         bool move_in_progress : 1;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 680f190da065..8d7947116e33 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -387,11 +387,9 @@ int irq_to_vector(int irq)
 
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
-    if ( !alloc_cpumask_var(&desc->arch.pending_mask) )
-        return -ENOMEM;
-
     desc->arch.cpu = CPU_INVALID;
     desc->arch.old_cpu = CPU_INVALID;
+    desc->arch.pending_cpu = CPU_INVALID;
     desc->arch.vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
     desc->arch.creator_domid = DOMID_INVALID;
@@ -760,8 +758,6 @@ void setup_vector_irq(unsigned int cpu)
 
 void move_masked_irq(struct irq_desc *desc)
 {
-    cpumask_t *pending_mask = desc->arch.pending_mask;
-
     if (likely(!(desc->status & IRQ_MOVE_PENDING)))
         return;
     
@@ -779,10 +775,10 @@ void move_masked_irq(struct irq_desc *desc)
      *
      * For correct operation this depends on the caller masking the irqs.
      */
-    if ( likely(cpumask_intersects(pending_mask, &cpu_online_map)) )
-        desc->handler->set_affinity(desc, pending_mask);
+    if ( likely(cpu_online(desc->arch.pending_cpu)) )
+        desc->handler->set_affinity(desc, cpumask_of(desc->arch.pending_cpu));
 
-    cpumask_clear(pending_mask);
+    desc->arch.pending_cpu = CPU_INVALID;
 }
 
 void move_native_irq(struct irq_desc *desc)
@@ -926,7 +922,7 @@ void irq_set_affinity(struct irq_desc *desc, unsigned int cpu)
     ASSERT(spin_is_locked(&desc->lock));
     desc->status &= ~IRQ_MOVE_PENDING;
     smp_wmb();
-    cpumask_copy(desc->arch.pending_mask, cpumask_of(cpu));
+    desc->arch.pending_cpu = cpu;
     smp_wmb();
     desc->status |= IRQ_MOVE_PENDING;
 }
-- 
2.51.0


