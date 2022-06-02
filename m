Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5340F53B54E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 10:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340922.566058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgQa-0003Bl-CL; Thu, 02 Jun 2022 08:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340922.566058; Thu, 02 Jun 2022 08:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgQa-00039C-9I; Thu, 02 Jun 2022 08:43:36 +0000
Received: by outflank-mailman (input) for mailman id 340922;
 Thu, 02 Jun 2022 08:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgQY-000396-Fr
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 08:43:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 159f8207-e250-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 10:43:33 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-44-yfgAqjP3NEKo5uFjW6Sv_w-1; Thu, 02 Jun 2022 10:43:31 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5008.eurprd04.prod.outlook.com (2603:10a6:803:62::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 08:43:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 08:43:29 +0000
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
X-Inumbo-ID: 159f8207-e250-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654159412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qMzAE4sPMKZChY6NYGrtUtUufgeougc+sPwTUOuU+f0=;
	b=GMJaHWQZ/248ROZMLohZLxP2Qoxn1rG4F8JZUJYoTgJSUlMeb0ueN4MBxikcKiLEXnDwO8
	8zhn6nHyd+cfsKRyk7KPC91NUVLK0eOaSrbWkM1VRJDxtabRoNPpKhtnDiNhEqOEyPwX4d
	KCc0blVSYcJbtrAea6Xc2VllKhcAmX4=
X-MC-Unique: yfgAqjP3NEKo5uFjW6Sv_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhO1LBTPjXpEFTtcTzJPx5G8j8o4P9gCby/ZRMKtrhqwxtZIN7nOjADN89/lJ6eWDtghRs30h9lQ9X36t1yG6X014ZQwEPETrf2/JtJ/JOplb6XD7mU8Lwj8ZNOAMHIWUhYXWUFLf9+SSg34vCbiId9MNFzx4bOZHpnX+1eHnfAVOHvfJaJekT2PGw31bJqi86amMMr86AIoqEVpR4hqMnJ/eQf5FLAeh7+E4ph6tSi6cIyRZDZ5Mg5/L63evBMU2oRHGSr2fWGqLJZvXQkk8/BEokYzwEnUCu+qU64Yoq7hTPsLxMaFUk8mBPyGVZUjX/bJOathOQYwoja0FVVRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMzAE4sPMKZChY6NYGrtUtUufgeougc+sPwTUOuU+f0=;
 b=Py9+jc/kxlCPHXKBL7AzkTmHWBakkCyfuSPNyT2o82B2n5dIJlr3e/dMCwhua4cf+nto30riqQ0B1vYiczDpMHO2G+5H3tRgNXcFgVgR8qThxreOCXqEMzni80zylB1b722uG3vuSAX9gRFod+MUWyFCbimYdnLxFxWyEB3f3MD6lL6dkHsRzN5ZmYrqipYnHhlK5ui2fPqjld1Fqa/i3KjYXBKTAFhZP7eUjesLQ35fW5Ts5D3Sw09QxjpHWQT31Wz5cdtaCPPHCofkS71mHDXSJ5e9E9dNPvVUL8BVlosnO8cONbjnixchAXBbJmMmVeitzd+M3eNrPjcWVGfhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <873890bc-e5fd-a9ed-77ff-7bd06d390ae9@suse.com>
Date: Thu, 2 Jun 2022 10:43:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] SUPPORT.md: extend security support for x86 hosts to 12
 TiB of memory
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b9c4ddd-2347-49ca-fc02-08da4473f7a9
X-MS-TrafficTypeDiagnostic: VI1PR04MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5008E9B4F7CA86B0EEDB904AB3DE9@VI1PR04MB5008.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lSe0+KDjC1kILJZlXaCfpOR9/Tz7sozMXt6Kuu28OPx2G1kEsO1VXZdmYbmAcq9fHrwJ9opUWi5mIS1J0wqThxSNN24UH9P/FVLmUUTUBi/ekUH6ZWXdTV6assQadw1YqS6RNrop5lUc5l1OjIAPxmdY3/NfNFwubMQ6cUz55po5cqNZaz1mcYQEB2a2nT5S9JTd/ayIFpXqPA4/cOquArdQTsvARQuvlayytOK80UG1dwOQciydFsvapJux4TqFMJm4LTwjmZR+8WRmyQHIbC1087YJjUym6OARQNwUFvjmdZjO5GfRNV9Nm150UA8rh1YCGbLq3D3aOs3BHE0VJGk+Si4mB5bwzMzBx0FtmTL7nzit4TDDncQmRdawB6n4/RlKBrvuPLMo8JbmPnjgVoh582WAR1oNVpty9NAEhCUXd5uzMXdWs3ZcYILB9oOcApJDE4SBWtzto8ak9ahqwmkBVjlFO2we9lyOq0cEOaK4/4+h2Llp3jrELowMW6sY8dNipQIUYTf4oKlzaTYNydV6ZPOU/u7wGhTxTTfKfcAbOn4XYA0yyrb9H9pT06+ZQav5n2rqa+bosigEpysUcElMsWCg4Qsb2VkarN3W12zOcxbwsqGJ5Cg2fNoJvB0cKnDXfqV2VrHLAbMFm2013fYLU27EFoHbPaDMJskqFBv+sQS+JO1vx1K9pH1e0v/ddSJh3iMefqcxCzllrWgOOLsSBQDfDe6X2W0iaEITlmNrSWdDBkE71LzKysS5wCRGAiY3xS2d2Tg+JPTtHmfPklLlqJGaTWepbNP3lImiDvJtfpmMxo6ZLuGKeG4GvMnQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(966005)(31686004)(6512007)(86362001)(2906002)(508600001)(5660300002)(15650500001)(8936002)(6486002)(26005)(36756003)(6916009)(38100700002)(66556008)(186003)(66946007)(66476007)(54906003)(83380400001)(2616005)(8676002)(4326008)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW1iSWVmV2VjZUVpdm1nYTE2TTRDT1U1VXMwV0ZTeXlIaEh2N3R2RXp6b1d4?=
 =?utf-8?B?Q1dRTWpvZklSb2Y2S0pRL0RKc0trTzFpNVdyY1JqV0g0eC9XTDA5L1I3K0NT?=
 =?utf-8?B?UHRNcWNMK20xL2NpWEVsTFd5WUliblkwbG9nV1l3eVZGT0RxUWQ4Z3pDMHBh?=
 =?utf-8?B?RFZ2NXdBRUZDWXJkV1dubG1tblo2Ykp1Vmxqc05CTURieGF3ekswME02aWxP?=
 =?utf-8?B?QWs5b3RtZGpxMEx6Q1dhZ2dhK2RROEhKc1drMitQT3BQMDFkK21IOTNoQys5?=
 =?utf-8?B?NEM0NXgybDl4UWtkRTNTakpnWGtwbmVxcDFneXVjemlVeGI4T0NIS1hsVVpw?=
 =?utf-8?B?dEh2d3RVSEIraUlVY096OUJYUnZEaldYcWI5Uk5PZ2t6MncrVFhiWFUwQXp5?=
 =?utf-8?B?U2YvT0praXZMMnJraFZnNWVEQTR3U3BYZC8rckVCUWp0N01QMmh2bi9Sa3ZP?=
 =?utf-8?B?K0hWNm1qdnVpZFdydzJ5Sm9VdEtZeXlFZzllVjVEb2oyVXBWTnRhWEprUmNT?=
 =?utf-8?B?eTg4RGlWYUxJR1dQRHpkUUFRc2QyRDNTaEU3amFTU3BvMDdLaklXUVRXbzVL?=
 =?utf-8?B?L3g0OUNzRjNxSVpvcDRqNnlKNzcwTEc0c2wvYjRnNEJEVDVHZ2szcGhHekNX?=
 =?utf-8?B?dC93WTBUbFMzQ2NONSt0RjRSRGdRTjJDcnNiOWtmeG8vUE1WeTBkT0U4cDU1?=
 =?utf-8?B?UEdZMS93U3V3NnJBdGRmWTFEaGtjK2JkZ0UxZDNaNkFWU1RkdzY4RmN4L2VR?=
 =?utf-8?B?Y1FMakQ1VjRlMVRLUTlBL0hmM0VYM05mTW5mbFI0NnZQSWVxZ1FBN3FHajRv?=
 =?utf-8?B?NTc3dGR4U3Z3S1IzVDhKWDVnVEJSNzJlSnhVaWZOc2lVUHYwVTNkYk1vME1U?=
 =?utf-8?B?enBNdEJyN3FwY2xNa2FUR2owUXUrNFFzckdzUWJGQXFPTXA5Y1R0TnVtOVZm?=
 =?utf-8?B?UWZ4WnFoV3J0SWVicDBSdjIrUmNrZnppVENMdEt1S2x5Y25DSDZoS1Vhb1pR?=
 =?utf-8?B?VzVYcEVFTEJhSEpuVlZqVDlCTE41bFFsY1ZlSU4zaURESmFCS3RwbmxXYTh5?=
 =?utf-8?B?RGRPQmV5UTlqREYrNjY2eWZYbHU0NW03MWNEaHNNYmlrL0xUZGxsWEQxZm5V?=
 =?utf-8?B?NUl3NVk5bG1BVnJ4N3JzVEx4SXdYZ25YUjF2UEF3R0tsRys0dGVubHRhM293?=
 =?utf-8?B?dG0ycnJTVTlWVzhodFEyRCtscjdCNlRSY0hZZHArZGUxa3lYdisybFl5VkZN?=
 =?utf-8?B?RFd2MHRmSHFCd3RNS0NPbGkxN09GVW9KQWxQVzZKdDQvNmlpR1RFbERiMXl5?=
 =?utf-8?B?T0NOalc5Rm5HTUZCQ1RaZVo4N2RnZmZqVEMrNGNDRzFkR1FONWFNYnQrQS9V?=
 =?utf-8?B?NzRoR09ZQy9MSWtTYmZKRi8vb2FsNVdPbjlRNWptejhDNDR4RUVQVkh1T1Na?=
 =?utf-8?B?R1V0YXgrVDFueHAvZmZqZldYQUN0b0NXVHAwNnBUSUhSV2RDaDFSd1UzN2Fh?=
 =?utf-8?B?UUlBZlF3NWlRbVp2NEFJM1JhQk5BSHpJMzZhdlhldkN1TmhlVG5OT3kwSmZa?=
 =?utf-8?B?TmZIRU9aUklpQys4ek8xMEorMU9lcXJjNXRoNThFd3o4dVkzSUVXTEhCTllu?=
 =?utf-8?B?cUI4d0lYZ2FTenFFdmxGZWNjMDU0U081MDVGK2RPQ3F0d3poUTZsemFuNndh?=
 =?utf-8?B?bEViTUdBUW9QcmFmUFd2T0prYXFaV0pqZHZYVU0xZC8zMmxQL0pYaGI2eDYr?=
 =?utf-8?B?cXphMExPTjMyWTJ0ZzRUWFBsMzBZcTJtbW1OdUJkN2E3ckNCYVFUUEw2eVAx?=
 =?utf-8?B?cjQxbkZ6V21oUGtKcHZ0UTllOEVScFYwUDFFamd3UHRabXpISUxPOXFuZGkz?=
 =?utf-8?B?Rk1KYlJOclJYZlVjWDFVVDVTVnhZVGx5bHhmaE41alFPWisrRURXWnpwZmNh?=
 =?utf-8?B?UWZKdVM3YWpvRE9BUi8vanp5bVllZis3cFRmMXdhYkVzMW02MkJ1dmZHazJ3?=
 =?utf-8?B?d0ZIcWcvakJpRGtxcVU1QVdGNTZQZEhBNGQ5d2RyR3k1Ui9ucUZWdlJ6TFY5?=
 =?utf-8?B?YjAzejRQVnJWODF5SVQ0QXhWWFcvNklnNzlrSmY4UUltSmJ3bFU3V0F5amMx?=
 =?utf-8?B?bGttd05TdkxnZ0FvdXhiL0tHenFhU05jcFBxR0ovMDdkMnpEOStyRXdkV3I5?=
 =?utf-8?B?a2RtM0x3MnBBeERKd01TNWJtbjRoekR5L0ExbGdXZFdibXpaWmRBUHZDRWRy?=
 =?utf-8?B?UmdxeENjaGlPbnF5RWNDVVVYU1F2dUhqbEFXbEhrcjBsR0JBVG5JcFVWMGY0?=
 =?utf-8?B?YS96UCtsY2gzc3IvZ2J3MlY0NEZKSCs4c1h0VUtLOFU3eGpQdFp5QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9c4ddd-2347-49ca-fc02-08da4473f7a9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 08:43:29.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVyahrL47lyXXuVluMJV4sUZ+nQY8P4E7rbo3jqaQYfzxjks0HLtrYkNsj2GKNSdaBNhtVWwYS0iybuaAfle/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5008

c49ee0329ff3 ("SUPPORT.md: limit security support for hosts with very
much memory"), as a result of XSA-385, restricted security support to
8 TiB of host memory. While subsequently further restricted for Arm,
extend this to 12 TiB on x86, putting in place a guest restriction to
8 TiB (or yet less for Arm) in exchange.

A 12 TiB x86 host was certified successfully for use with Xen 4.14 as
per https://www.suse.com/nbswebapp/yesBulletin.jsp?bulletinNumber=150753.
This in particular included running as many guests (2 TiB each) as
possible in parallel, to actually prove that all the memory can be used
like this. It may be relevant to note that the Optane memory there was
used in memory-only mode, with DRAM acting as cache.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: George Dunlap <george.dunlap@citrix.com>
---
v3: Correct Arm32 guest value. Restrict guest "leeway" to x86.
v2: Rebase over new host limits for Arm. Refine new guest values for
    Arm.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -50,7 +50,7 @@ For the Cortex A57 r0p0 - r1p1, see Erra
 
 ### Physical Memory
 
-    Status, x86: Supported up to 8 TiB. Hosts with more memory are supported, but not security supported.
+    Status, x86: Supported up to 12 TiB. Hosts with more memory are supported, but not security supported.
     Status, Arm32: Supported up to 12 GiB
     Status, Arm64: Supported up to 2 TiB
 
@@ -121,6 +121,14 @@ ARM only has one guest type at the momen
 
     Status: Supported
 
+## Guest Limits
+
+### Memory
+
+    Status, x86: Supported up to 8 TiB. Guests with more memory, but less than 16 TiB, are supported, but not security supported.
+    Status, Arm32: Supported up to 12 GiB
+    Status, Arm64: Supported up to 1 TiB
+
 ## Hypervisor file system
 
 ### Build info


