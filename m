Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF3467631
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237393.411740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6eJ-0007UU-3X; Fri, 03 Dec 2021 11:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237393.411740; Fri, 03 Dec 2021 11:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6eJ-0007SM-0I; Fri, 03 Dec 2021 11:22:43 +0000
Received: by outflank-mailman (input) for mailman id 237393;
 Fri, 03 Dec 2021 11:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt6eI-0004uM-2A
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:22:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54123a22-542b-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:22:41 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-ie8y1T6FPRyK7F5eBeHQEA-1; Fri, 03 Dec 2021 12:22:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 11:22:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:22:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0040.eurprd06.prod.outlook.com (2603:10a6:203:68::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 11:22:38 +0000
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
X-Inumbo-ID: 54123a22-542b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638530561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x2S2aIcZK036FRm3DGzFftaBrE1z/LAoM88V/xmz2FM=;
	b=RCKXidmQLxXaJpR8Mlb4/uaa0ofauD81orBlL1XRYkkZLYAlTxTSGMg6NCLw3v4PrvLV/w
	fmLuPbZuUnXQ2fxilY1ocR0o/NPtaEaOLHwIPZ7BRxYzgjlZMcXKRDzhyn/g80mzq4BHR+
	o/n+9PyasjDXWAtjkpFzzV2mIi/7tfU=
X-MC-Unique: ie8y1T6FPRyK7F5eBeHQEA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPAp4KGTOd3ZP8ae8K5FEFuhs4c+qOLiFRnj6UpE0ko2IiXI3fwCOOpWv721KpGw2QN9iaRI5aEYF6nDjLfzEj6ETJq7UqAzF7ymKQmr27aOATz951vVJ0TFGIfWntOrvnry2DNfQjd9LuIrKvsJoVcXlT8ja9YANAdQhN1WD5lOWsQPTHoDjGPfE6tDyx7KN2KTnOWlSa8DrHA3MZZIipd1KQDFcQMF/3xWweIE6H44wWp8Buj0nGkcDFWOuV0bFVOJHNENeLWwrscWeZJtdgmTTdAXsyh/lze6F2AuFVKucvhdZpP45qDYxF1l3PgbKPkQm7q1Q+o5KoXZwKW2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2S2aIcZK036FRm3DGzFftaBrE1z/LAoM88V/xmz2FM=;
 b=XzRPudmb5wm+F4jIINIOPj4ylUibqYHhJsV2iN2o+q6XBumCHOvFF6BxUx7pgyELeGcAVUUEsLtSENGaDLkUcU9OQ/YhGoJhCJijqrzEwMpGaWsaALBZrjmDwQ/xn5bBFmLhTQQ2DLRF5mxF1vYY6I7ff9wOsBAFU31HMy4OAPnApvM/hYwtTzKj7+8mkRElWCnvfcjbrqEArMHWdF5mXqL+0d4EjAYCmG4Zs/8Rj6SDbzGBinbbTR0pR+sBLaKg+cLdkUKMj9T7k4NdLKQakFrC/vYTtVneMBBXXSJMtmrB7h098gd2iv+Ve33aMJj+w6prvnvZev8hw2Grf+UYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <46fdafdd-d6a9-778b-d634-fad8d2f6925a@suse.com>
Date: Fri, 3 Dec 2021 12:22:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 2/3] x86/HVM: fail virt-to-linear conversion for insn fetches
 from non-code segments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
In-Reply-To: <10c7b3c0-c64f-3d12-06d3-8c408f7c9f4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0040.eurprd06.prod.outlook.com
 (2603:10a6:203:68::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eeba3b1-3dd4-4290-dfc6-08d9b64f36ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445AAA539922031B56B95C4B36A9@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nc8rk46xWop+QM98H9mxOX+W3dnrS78Hn4IFA6yqE0oRUNSU92PJFgUHoymGbAcZDwJDjFBnEquAiskjI5R/kYa0h/Wv4ZIsN0pLo1+gVTaB0Huc1JAcjGHCKK0yodG/SdLpe+dPjn4iGbvQViYHn0sv5yMEaRFfYQ0hxGXWb/csaCpo4VmZ4SZl4QeZryrvDlxsxYFiAEw7UBz68Vve3OiZVeWnysHdLsfHFQAYo3BaBUpYYP7mEPz7jNO0ORUx9cUfqRWkcpx7IYocHwSUhOBELeRLQf3m/SXIBCQBlS0iBntZ7ad1yuTdUa9YCUm7IFNK9ZjMjxDQKtMdaBvugLul6yCbw6IO+ZibIxvYXGXHDqPoVNQxmg+gMI0dMOT63+iJwLLb+F9rIpYgnxfDIRFolVL+aZ1oN5d7WIP/BSvT4x+4tVpFLZcjYr5VYtXn7e8i5/aNPGRZHrB33JYUaGCXFSTeiLPYK3yyc9PPQqyPJ6dtv1YB4BW0soeRs0UP03QdfBMc+uKxFql9vM6NH7jFDOi5DInvQRBMR7WZ2UQJiMpADv0OAsGquIcbnGHKcgxxWzXk9Y2j1ebIHwLGgHM96YIe0G3tUHVV1LHpoCJOwBMeW9T98qn0RaaWlCio2szqW6fgXPQrINO0eUcw+4R67aPgTCQuhV6dzzQsbnqIG101C4v1Xd1UOyK2M4UCZ4XBtMiYUPiVdezXiwCJGF1j0pX3ObhIaDSV/0Ai3c4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(36756003)(2616005)(31696002)(31686004)(86362001)(316002)(2906002)(66946007)(26005)(8676002)(6916009)(66476007)(66556008)(83380400001)(956004)(5660300002)(6486002)(16576012)(186003)(8936002)(54906003)(4744005)(4326008)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXF2VENsaWpHK21pZTNINlhRbC9KcmFKNks4bHNJTGlFWGNBWUp1YWMrZnRu?=
 =?utf-8?B?Mjc5R1BXMGNlVHNXNnF0YjNUOTkrVTBWanpxaXUwUXV1cHZ4MS9pQWdNV1lX?=
 =?utf-8?B?Smx0QzhROGxuVEhXeE5tcmRGeDYrOE14Smx0Y2hEVEtwTDd1bVowbDNqV1kr?=
 =?utf-8?B?dDJ6Ym1FRlc3bWc2TWhscVlPdzRsYVlySXBWM3RWdG9meXVmQVU4eXkwRW5E?=
 =?utf-8?B?OGlaWnlxbXdhLzR4bUdaRU1nZGxsK3VTekprOFkzVlRocFRYSVJ4dm01Nk4x?=
 =?utf-8?B?RjBZN21WRzIwdUZXWklmRFkzcFlvYXRrT3V6dmIvRFM4RVZWOEd1VVlkSXdU?=
 =?utf-8?B?ekc3OXh6Q3lxY1BiSjV0K1NRQzZxUkI5OGxXOGV3SmhhNlcyOGc4SkVyV0o2?=
 =?utf-8?B?b2Z3MXpKMW1KdWpMdDlud2pWRktGREdLVFE2K2J1cUdkNElsVktCR3pMSzJ4?=
 =?utf-8?B?NDdQWVJGdk1xMmFKNFgvTmNHTGJhZVVtQzdWZUJVTnM2TnJRQkpldXVPd0NX?=
 =?utf-8?B?d29TbU00OEdYZE5WMEtISkJEOFJjTG9IdEUwTWxhRnNVcDRYbHd6bVYzSnJm?=
 =?utf-8?B?Q3dBTFZBdHQ0QVBLNHFLL0lJZ215V2tLcUkzclp5M202bXpzRmR1RmZSTlp5?=
 =?utf-8?B?VERBdXhUc1owL3JBM2FKdFd5a3JTdTNQM2dldlBsT3FkTGFvckFtUkV6Zzc3?=
 =?utf-8?B?SHB0Qmh3SU4rdW1WQ2gzT1pCQ25DVlZlWkV5Rks1QnBWQTFSR2NmektSOHZa?=
 =?utf-8?B?NTBZcjNRaWZIRlVjc20rVGM1QW0wNHhjTEtNV053VEMzYzIrdUIzYzhiUXQ5?=
 =?utf-8?B?MlFHZXozS01pTHQwWHZ1NWh5aXFOVkFUcUNHbnZGaUpHSDNTSFo2SkFxd1hl?=
 =?utf-8?B?RUlaZGJqUitvc0tpNHZBNW5nbFFacUVSWk0rOVcrR0o5S0lDeWxNcEJXNTVl?=
 =?utf-8?B?bnorQWpzYitzd0FDVFg5M0pybHRmbVRCcUhXVU5TUjcybnN0VXhIVDZFMGVr?=
 =?utf-8?B?Ry90RjJvNllvVGFvSDFSMHNxWEFNK0p1ZDdoc3lRMS8zRnFWdTB2WWx0a2pH?=
 =?utf-8?B?M0ZXZXRma1FhR2w0bFZlbnJCU1U1WWZ0VFNiV3RQTVp6NzJOOTdOU2cvci9u?=
 =?utf-8?B?WERvUjJiMjVDOG11OFAyeit4N0c0d2NWMERyZkJSb3FoSEE3M01oaktzZ21u?=
 =?utf-8?B?b0grMnNtbm8yVE1ERmhOMFd5bHhWb3hLSytFVVRwc0kzSkd0enhsL2tqSE5q?=
 =?utf-8?B?OEFNSDNlUHlMUkdEVDdadFFrQzFJVEtOdk9IbjVSY3UvcjlwT0lPYUhKRmVx?=
 =?utf-8?B?TjM2TEhmSUJzMm1FMTdwb1VuRkY0c2RzZHhLZ2VIaWlEdEsxU3Y1VFhQUU83?=
 =?utf-8?B?MjNlS3RoSXdCNmFZNXRrN0U1cUVCYU9udVd6U1JNNDBqOWRrSUd5aGhYRjV2?=
 =?utf-8?B?dElraThiQVMwL2xvSU1NQlFPZDhVKzI4L2Zoek8wN2tPWlVMU2RvdlpaTDYw?=
 =?utf-8?B?M0dOZG44Qjl4R2NQaXd3RnVRY25NUGMrM2NoZXQrelZGODhhRnI0L1NJTWd3?=
 =?utf-8?B?eW52R2lIeVVrSU12c0c5V09YU01haTVNdWFGVzNEMzRwVlB1S1B6RlhKZlk5?=
 =?utf-8?B?SlRvVUlNbmlrVjRPdXBZMHFqd0NtZ0ZZczE1NVQvVi84MkdMWUVObXV1aUln?=
 =?utf-8?B?ZFFHR0RlVzZUY2VWS2JiWmprcWpQcGxZWlRqbm91ZmowSHFMamlPTk56N3Aw?=
 =?utf-8?B?ZkR0ajlkeDN5TW15U2lHQnZxYVpQekdNc1p6c2cyb0RPUjdmckJvUmJLSXRR?=
 =?utf-8?B?R3dtbzZnU2dKUDRCYTJ0VFRzWVVadHg0SE5oeStTY1c4c0xaMkxLWnkyYXhB?=
 =?utf-8?B?a1NYUU4wcyttMnV5eWlIbFUrUmtMU3oxdWVTTEtiaWxId0pQMXluQVR5WTZD?=
 =?utf-8?B?YmpKd3N1aVlIUStmcjczeG96TWdXOGliS1I4Ym5vTkFPRjR6ODZ4OVFqd0M0?=
 =?utf-8?B?dDdmN0VKVnFzMENpbDBRRVplN1l6OWt0eGthcXk3dEk2dFBkUlUrb3lySU1Z?=
 =?utf-8?B?UWFNWVJPVkRna0FCTXh1bDFueVNsSGR5VVB5aDI1TlZETVlQcmRtYzJaak84?=
 =?utf-8?B?Wk8yYjJUR3RQN1JOam4vQnV6a1I0cU9SVGJKZTZQdm9lc2QwY1Qyc3FWSjFC?=
 =?utf-8?Q?Bxekx4pq7D+SqkbnkLQSS7E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eeba3b1-3dd4-4290-dfc6-08d9b64f36ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:22:38.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnKVYnFu0bwLOCRe7POMucUX42qQhe67DGRgqEP5COKhInqGihRpo/x61f2jqSdtR/MDN9KY77l77wf75OIhpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

Just like (in protected mode) reads may not go to exec-only segments and
writes may not go to non-writable ones, insn fetches may not access data
segments.

Fixes: 623e83716791 ("hvm: Support hardware task switching")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -2551,6 +2551,9 @@ bool hvm_vcpu_virtual_to_linear(
      */
     ASSERT(seg < x86_seg_none);
 
+    /* However, check that insn fetches only ever specify CS. */
+    ASSERT(access_type != hvm_access_insn_fetch || seg == x86_seg_cs);
+
     if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_PE) )
     {
         /*
@@ -2615,10 +2618,17 @@ bool hvm_vcpu_virtual_to_linear(
                 if ( (reg->type & 0xa) == 0x8 )
                     goto out; /* execute-only code segment */
                 break;
+
             case hvm_access_write:
                 if ( (reg->type & 0xa) != 0x2 )
                     goto out; /* not a writable data segment */
                 break;
+
+            case hvm_access_insn_fetch:
+                if ( !(reg->type & 0x8) )
+                    goto out; /* not a code segment */
+                break;
+
             default:
                 break;
             }


