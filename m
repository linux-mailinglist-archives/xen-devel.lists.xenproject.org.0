Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0DC4C2916
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:15:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278064.475163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNB8v-0007iD-RO; Thu, 24 Feb 2022 10:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278064.475163; Thu, 24 Feb 2022 10:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNB8v-0007f2-No; Thu, 24 Feb 2022 10:14:37 +0000
Received: by outflank-mailman (input) for mailman id 278064;
 Thu, 24 Feb 2022 10:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNB8u-0007ew-GZ
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:14:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90173fa3-955a-11ec-8539-5f4723681683;
 Thu, 24 Feb 2022 11:14:34 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-qneMBb3ROPuLRAaKgdR9LQ-1; Thu, 24 Feb 2022 11:14:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR0402MB3333.eurprd04.prod.outlook.com (2603:10a6:209:5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 24 Feb
 2022 10:14:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 10:14:31 +0000
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
X-Inumbo-ID: 90173fa3-955a-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645697673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zhkz7XUOfkbAUL6lSDSMSMGj4W9BquadB21UquNDilc=;
	b=i+5BeWil7q53c6DoocXePIWaAkTQk4CQdXMBrdBOl7Eeru6w1MTNKEZ3kc0GchqS8PTKAd
	MKwEQ5vyY9QdMwVxTn1aGnQbTKGGcawAKXpDO4RE3GCoO85KU4M7GM3XcEGRTSmhvREdoC
	cfj3JHJNQIaWG8Tr4Fn3kEj6bPrxy30=
X-MC-Unique: qneMBb3ROPuLRAaKgdR9LQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a78V4y121wmd+tF3k8ppQNxQn/Vh6NTmEKb7uWB+le14cSgoljhI/GF4Pf3OcpNhkkY7bLrxw2p1WpaklySNmeGg0WHXSDfAIcIRg0Zm2i/4uYEyT1H4MzQEVOFsfOX1rxlbwloa310c37NdsXhTr4VR9Cn6TJ2qsKwxxH+540yQ+PRNURIxZDWunRkfR/o42XXbS0VJZNWNG5OQvPN8YfquFpq6w8d0Wm+ej7I/SGXBdjGCvqycfCk2K7YHUc7OcfIr6fd2JP+k/5+CniNogoheaoKGD7HoNG54LkvMZcu4xV066nLgIrf86qrZchFAj9u6GNG+g+tEA9Ain7RFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhkz7XUOfkbAUL6lSDSMSMGj4W9BquadB21UquNDilc=;
 b=Tf8k2IZfk1B+UshpGS9g+W8J9EcS9onXa0Tn1J6IHEfKWWfuf4bhWxCZN7NwbjCvIXx7gg1ip0LDLPIc0WBjdhrIcVT86fggi8Meb2LzpoMv1xg4tcs38nEsxXIc6dph65G4flxwKJg0u81xvdInD7fM1VYXN+nFucyds++LDDgZWWyjHA6vZd85I7AMmoCgtbzBcthehxvx4X3JnfipNLDJGfpy+Y8CCMkbvXGGDA1bjHUq603Emj033xQyN5D1UzBinXNdV7fbwibluOw6BfG49lQiHxBSV2SpOm3OlSMKld4nTiL9jhL/l7QDgbnrKQwJTAzQq/Q6Yhjwygv44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ceaae3c8-0c35-efc1-c7bc-f44364ce29e4@suse.com>
Date: Thu, 24 Feb 2022 11:14:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: make embedded endbr64 check compatible with older GNU
 grep
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0023.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c28d98-85a2-4853-c663-08d9f77e728d
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3333:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3333F2BBDFE752823231EAF3B33D9@AM6PR0402MB3333.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BNME5yBQb56fm5pKl0OqFZsmARUVQLmrDI/XbnHzWS9aHzEFsXyXUXWzcxEMFtz7ABoPBhPE2ZgDcrX0jYeIb9eWekXBOF/JMioETt/MR9aieK4oLGD+BFg+P+RwrB8WT0g8OBtgi5Hu4qcWhLil6UZ3DiMLQ8BpAeWMGpi1CingWlJdByaidbcpqzJ3+TW1N47uQ/yVJijqYenrYWRb5ixRl08Cgu/vlUDF+o+y9Urzhyj0nhyFoVYOejS93jKJxbZaG0JWuBFiLa73GX/E67KeythbhWmTgk+yiCZs7lD2FV5Adu261QfXYnyhMACcl1O2xHTRr6+tA0r7JB3M3T78DsLX6A21HMZflfe48zngrA5Ry26DllAJnkrhKXo1PVmm3N1MLc/KAWqCocnaiu9NNlI4fFPxJ3EkABoxMwnMH5v+cSjX7YvpAGb5ij851CovDLS6ZjSg7jo0o2a7y9/nP71REFZ25kn37K1YNFlBwH9A2FMpx32uGr/Lo+pg4tnEiBWI234ZSCVFjzc3j9XhKSrTZdenMWw2jwtMS9pv/5b+nDRmHqY093BrpQRlerrd1n/Dbe0Y6IUVy5kCW0+RHmhHgM5/hFDSwhVogHeICWyK/hAOUmoNPmc/s0jYt3fOQSr2yjxaACakUw01uSn7Alo2Ovz7Fkq2X66iACPmzfyHc2Mx9BLIXR8earMwUaPwzHop6Yca1/+hF6dMA1n6UjoPpur6t36We8ZxRF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(66476007)(36756003)(186003)(508600001)(31686004)(8936002)(83380400001)(6666004)(2906002)(6486002)(31696002)(6512007)(5660300002)(6916009)(66556008)(38100700002)(54906003)(316002)(4326008)(66946007)(8676002)(86362001)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ZSOW1wQkQvN3k1NXZvQ3lQdEtvL2ZxT0MxRExWT1A0Z2lhRXZkREZSdEh6?=
 =?utf-8?B?ZFBCWno1OFR4aU1remVSaEpvcyt4U0VPQWFFQ1ptU0VpRXlFbkIwRTg1TGNC?=
 =?utf-8?B?eERQZjhQRTd1OUVCbDc1ZVByZ3RtM3FaVGZ6Z0xSMmtyZ2c4T2hxVnZmblJQ?=
 =?utf-8?B?NEZ6aUJudGdYQ3Q4dzEwWGRJQVBKdnpXQVA5S0dJOW02SWJxMnZZYUdEcWlU?=
 =?utf-8?B?VEFlTE8vaEx0ZGpJM0didjhvR3ZhOUROMWVJQlBmL2g0NXB0dlFtN0V5NFN5?=
 =?utf-8?B?YzBoSzlEb3FkNzFQc3ZUN3VjWHArTmwrWlRMdXpFMFI2eHlGenl1QXpoSW15?=
 =?utf-8?B?VlJzUGkrb1FBenNlTFV1UTJxL3F1U2wwZkpDVndUWEM5OVFkVjBxWlozSjdG?=
 =?utf-8?B?QjU5QTJTbktzUDFsQWZ4QXZLbG9EN1dIZFM2ZnJEdGxGNFNIU2NBKzBpVkRQ?=
 =?utf-8?B?WUZVTFdQd3lXV2E3N1psR2JoN2gxaERML1JiVkFYOUxnWUJtMkFhUWlLWmtq?=
 =?utf-8?B?ZHFtM2cxWUhJQnoxdXNwWFNQbU1mL3preU5YZnQ4eGRkWmJGbksrN05FdGl1?=
 =?utf-8?B?SWRMdkMrWkxBaTk2UXdmZjBkc08xV3lRbklISGU4U1RVUWF5dEpmZE42eHJk?=
 =?utf-8?B?cnNKZWxOd2tpdHVhOEJlYkQ4Z1lZYytLM1hZZHZKNWFPejQ3Ym5wWG9uQUd5?=
 =?utf-8?B?WjVoYzFTeXNxYkR5SlVLenBSNXc0dnE5UlY0Wlc1MTVxU2JLa2ZwelJzNWpw?=
 =?utf-8?B?b1h0YkJkaXhrcGU3Z0ZWeHRnR1Q0dUxuY3B6ck9XUEdFYlBIVnNrOGIzOTNh?=
 =?utf-8?B?MHpBL0RCSjE2Zi9JTklKREs3QURaNkEvNmVtcDdXYUxOZWNxT0xSQ1N1V0du?=
 =?utf-8?B?RERBVHF0R1dKV1NMZFJpc1JYL1dhMnZPWFJIcDFhajFId21MTCs0U1M0ZFJU?=
 =?utf-8?B?QmN2R1hzWnNkSXNkZTBRaEVDckhrSzFQQzdTeDdlOEFkK0wzck14dTBYd2F4?=
 =?utf-8?B?aXhteUxYVGdLcWh4akkza3ZlVmozNy9lQlowNVpvYkN5TVIxUjc4SmloNFE2?=
 =?utf-8?B?SnB5dFFaKzJiQllIbkpRY2pDb1RNMmdBcllkb0s0cmlPdkdPcDVrYXFQR0Mz?=
 =?utf-8?B?U0ZmRW5sbWRMU0VtUE91dVdFQlFybEZpRFlFUjZmVUV5ZnBXK0Z1RkFUYmRs?=
 =?utf-8?B?YTFMQnRDZ2JEM01PKzFvamhOZGw4ejVjRGV0SjZ6dngrdmpTS0g4K2hJUnZV?=
 =?utf-8?B?Nng1ZUx3aFVQbWZaajg4Rnp3RVFDY211T05BSHFiZTFYUUVkZVIwajNnM3dH?=
 =?utf-8?B?OG1qYi9zTmdVT2NzK2syd2thWXRBcHhzdWI1ZzdaZzFGN29iSFN1N3FNd0s3?=
 =?utf-8?B?RlFFZGpmOVZhQjBvdU9YR2VqTFd4Z1NOVzkwK3lhRVBxMXY5ZFB3R1liZE5J?=
 =?utf-8?B?Y05lOVpNY2YxZklYMzN0QVVuQ2RuVGVUMHpBSVhKRGRFMU9rd0tTWWNUR0FK?=
 =?utf-8?B?enlPU2NtcUdUSGd0Y1E1MEltL0JkY1pQSy82Q00zU3FuVzJBemY2dGJkOVdQ?=
 =?utf-8?B?Q0NZRGFCSld2SDZ0T2x6d0RZeHpJTjkyUVNVZlZmdmVlRnRsZ2t1Snowbm9v?=
 =?utf-8?B?RXBNZ3lQV1ExaWo4cUpXRXlOOG1ock5TRE11MVZienFIWGNvd2tPY3dNeFV3?=
 =?utf-8?B?d2tzVGxjT1hUeUFJSC9RYWdCVzZrMzVRc3lmNGhmeXBQcGM4OXZJKzVubjIy?=
 =?utf-8?B?d3lKS3FDSmNqU2VqRTBBN1JJR1BKenl2Ym5nZXM1OEZlYUJ3UllJR05MakR5?=
 =?utf-8?B?U0EwMTBuSjB4R2xMejFoK2Z6YTk5QS9Zb1dPWHRSQWpEYmpGSE9oTmpVR2xF?=
 =?utf-8?B?cnI1NE5iYlVMTFBKTmk3ajBzNkdySVAzVlppL1VIRWJIQkZVZmoxaGx2Ui9q?=
 =?utf-8?B?aVByaHhDWEt5NkwzdnhjcWc3aENhdi85Yk0vY1dSR3NCZ0tvMVdwaFJud0M4?=
 =?utf-8?B?OTd0R1d6LzNMNGwrV0VHZzFwbldieXJ6TlFpYVRUdkh2eXprb3Z4NFF6ckty?=
 =?utf-8?B?d1BSdk5UMUQ2MnBYWnV6Y3hUT2Q5T25USzZOaEFUSHVNSTJ3WFlaekVPK1Mw?=
 =?utf-8?B?V281eXVFb1JJelBDd1RjZlR5V0lnNTBZOWp2SCtTVTFzM21Jc2tYVHp6Ny93?=
 =?utf-8?Q?Njy5IKioMHi0bWwkPfjTu4o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c28d98-85a2-4853-c663-08d9f77e728d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 10:14:31.0719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCMby4O4FQSbL1+dmus2rPXuQ8CCPmoAH7Doh3yIpTWCj7QQAxkaJA7NJjbEfp61z+sdBdATfB1QKAR3fRhj5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3333

With version 2.7 I'm observing support for binary searches, but
unreliable results: Only a subset of the supposed matches is actually
reported; for our pattern I've never observed any match. This same
version works fine when handing it a Perl regexp using hex or octal
escapes. Probe for support of -P and prefer that over the original
approach.

Fixes: 4d037425dccf ("x86: Build check for embedded endbr64 instructions")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If we were to fear -P having a different meaning elsewhere, we may need
to switch to the respective long option (--perl-regexp).

--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -24,6 +24,11 @@ BAD=$D/bad-addrs
 echo "X" | grep -aob "X" -q 2>/dev/null ||
     { echo "$MSG_PFX Warning: grep can't do binary searches" >&2; exit 0; }
 
+# Check whether grep supports Perl regexps. Older GNU grep doesn't reliably
+# find binary patterns otherwise.
+perl_re=true
+echo "X" | grep -aobP "\130" -q 2>/dev/null || perl_re=false
+
 #
 # First, look for all the valid endbr64 instructions.
 # A worst-case disassembly, viewed through cat -A, may look like:
@@ -60,8 +65,12 @@ eval $(${OBJDUMP} -j .text $1 -h |
     awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
 
 ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
-grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
-    awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
+if $perl_re
+then
+    LC_ALL=C grep -aobP '\363\17\36\372' $TEXT_BIN
+else
+    grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN
+fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
 
 # Wait for $VALID to become complete
 wait


