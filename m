Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03648C315
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256548.440369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bo2-0000x6-AN; Wed, 12 Jan 2022 11:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256548.440369; Wed, 12 Jan 2022 11:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bo2-0000uQ-6R; Wed, 12 Jan 2022 11:28:42 +0000
Received: by outflank-mailman (input) for mailman id 256548;
 Wed, 12 Jan 2022 11:28:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7bo0-0000cQ-SB
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:28:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca50175b-739a-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 12:28:40 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2055.outbound.protection.outlook.com [104.47.6.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-JqXVQp32MZ-0TxNFsjdU4Q-1; Wed, 12 Jan 2022 12:28:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 11:28:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 11:28:36 +0000
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
X-Inumbo-ID: ca50175b-739a-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641986919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+kSn5agg05bTqYmtz/grnEHvxM7HKRHO0hkeaCRsUrw=;
	b=Ci4fA46E/CteI5VPq9DGmJg3w9emAt4oI5v+Ja8wVdIhHL9WKm46P53j1afCWueAZc0Z6v
	xArDiEFJoMMa09UHzKs+l3HRBh6LptZODLzGwo2xWGyvhptULhI4e0nyuCLYdiefP6lMJ3
	1thGlbl73/5aAIaSAt0X7DQhrZj+0+M=
X-MC-Unique: JqXVQp32MZ-0TxNFsjdU4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF7LnbhI3kVaO0cm9lwGiTh+TTdDiy+qRBQ95bxRdtRkgszml8uyT45T4NuN1k8Xe/QHA5hdadUi+q5D+XHZ0exvlCslj9C3ySXF7T4yFQ1SGHdxhP8QeeMh113LKJSuHSz1NMMOy3BfYuIdn4CWkejJ1hrrf6ZJkBPEtJaVaJqmJo2YEdSjMgFZZb+dEpDsBm3csFOTZyYo7wVPi7MsXDhWYlAUk/vrmUdrOzpZOwGU0mZreFKojgJggq/uUbNzJFvZ196ExyXlfUFMehZrzI3KVqFehpm7YEDhlLFScoDjJeAVNS6Wg76eojDay0YRec7Ls9fS8lf06vwT0hrXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kSn5agg05bTqYmtz/grnEHvxM7HKRHO0hkeaCRsUrw=;
 b=GCR7fem5iE6Azt+7sQcQACu/CIP+DjUeqlvhRWE4ufxwfDQx2q+zYS3Y1215scoAIMrVjo0KZrnzUcnuSjKyEEj4U8UtONRDPzRyIX0UY0BY+k0cwcvM+ocWcA4DX+o7QfAxNqUve2D3Ylv1ioeU3Of5tf+DCENY55GZG/nGh+otgUAZ6pxW7ZqNrSEwAIvvmhj8t49uC5HIfYOYSATFObQFgzlKkDvqJ7P/Eegsf42+vbk8g60TIUHvnngq8H0vYvIDQZ9Z3pTbKxAS1Jd0BJuqDaIH6roJBh+WJahcomG90qzemzXkznDrXIRjNxB3Y4iHkGdjO1XBJsivNx+9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <602c9632-9981-1b66-172b-4aed396e8508@suse.com>
Date: Wed, 12 Jan 2022 12:28:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: correct usage comments in Kbuild.include
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ade5d2cb-652a-4309-149d-08d9d5beac5d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49435B6CC363FD4FDA16A251B3529@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zrMN/cNiROaSxsrj2got0liKOA9pxJn1u+g3hU29J6oy94av5Lmm12rRlTMM3+79CIId3Xol/E+ZOWZqWD8Pg7Zw/MSp+nsYLnwpge57NjPHKTSwA/Jk0s6iDgEi8TcH9ZAkQYtyHCRz2zeqUwBPuunYJPK9n/UqAsmjN4fMNtTd9IxQ9s3lo8tazzfmfOrpFYULaIecWKFNnQhFTdFiOZ0rQvAK1FqVyRRirO7ONkgxG0G+RrL9DTuch5vqkCwK8RWaem0os0pZtZeTOSuJPYx7vvnoCjGCNNngeZiLu/H+Eqd680vqn5UpEGubrDkxq0Oy/oeiWYfx3VS4Qm3PgJbe2xx1bK59LSFoyoFP+ShUQJd8ghVfp7MziYFMX0+9+zpM/koeNPMv435H2eXx6qKMOmmffwSP8DnuoAcQp6r41j3tXSVJnMlxaQhLA3j8oVbESWykvUyp50gvVubpF+sM/luxaYFSoKKoDjVSwwhAA3IuuzA/EhXatSnKsQ0pmzC1fLnK5B1WcelWilPrvd///zAHCg1ZsN8EWOjEF0Xz8zkwJCm11TSeW/DoSNPsF5aUfrQVFI7q1xbsTTSFMAxkL3ht8i/JnGT4GP1xhXwYB9jxPaVIjBYk1WdHRHA7Xpztd5ODMz1P+oEkSVsiXTlzDGbYF2G2GXHYDgh6D8PoZs6+hCTJv5ipKT9HVgwDPctmyBHe5kxis55+6SwwLrpLiM5XX28kl5fDJf60ZPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66556008)(66946007)(4744005)(8936002)(6486002)(6916009)(8676002)(5660300002)(2616005)(2906002)(6506007)(6512007)(36756003)(508600001)(31696002)(38100700002)(86362001)(31686004)(26005)(316002)(186003)(4326008)(54906003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1xazhZMWpCV0ZLQ0ZrUEIvS1NIZHpvNEd1WE9lY1NWbjhKQ2dna21uVEl1?=
 =?utf-8?B?THdSNk0zZHo0ZFM5QUJDVXdpckZVdXBod05zSEJINjIyTDI1UkpKYnhCSS9n?=
 =?utf-8?B?VkxRYXpQS0hoVCt3SjJ4YWJld0tlZmVoVFZTZHlqN05kdHNPQjRHak5wSHpK?=
 =?utf-8?B?UlJXRWpzbTY3UWNFWXVwYUlwcTdBZ3UwejU1dkYzMmpnY1NPaW5QS2ZuWkFz?=
 =?utf-8?B?RnROUWdqMk84a3FOQUNGYVIzNkQvSGJwUThlYUpabEtrUjZWMEJhY0d4SlNC?=
 =?utf-8?B?anhlRTJHTm1sYjR5VzhYcHBjWWo2aUIwaWJpOHlISlQzNW1DSkUxdzFXbXZM?=
 =?utf-8?B?Mng4YVhUYjRwYmpVZENRalRMdXdFRkUxWlhwdWU5OWRGd2JLMHNkVWtIQlY3?=
 =?utf-8?B?TDFjc3lhckhPV1JBbkQ2bFF3dzQ5MGdWVDBhajdmWGgrdUVtTklrQ0pkQVJD?=
 =?utf-8?B?eTlWUlFDSjlEUlk2S0pCeXE2ZDdabFNxS25Cd25WNmI1Z09mazY4b1BwR1RY?=
 =?utf-8?B?aEIzUEhWR2lBTlpQaXVlVGhxRjd0ekppQW0wM2lHeFRXZkZ1cE1BblNPRXRx?=
 =?utf-8?B?S1VtSUQrRXNQRC94UVE3ZFBWYXRSYTQ2Uk1jQUw4UDBobWJicTRMUFlTQWMv?=
 =?utf-8?B?Y1hXRjRoRmo1MThYcU83WkhmWjlDeE9RZ3V4R3VqMEk3Y0FuRit4MWhVb3VI?=
 =?utf-8?B?dXZxZlMxdjFmc2V1SUV6eGw5ekNkL09SdkwvdUJYNi81dHp3cmJlQzJoUHBl?=
 =?utf-8?B?cGdoc0tOSDI2bExnSHZoMFB6K056VzkwNXZjcTlTUERUSU1jOTYrYmxyL3Aw?=
 =?utf-8?B?QUhUUnpZM2pNM1J2VXBQUWxDWjVmQzVPc2VSQ0V2OWtNVWtGMFZFL3N3MFd5?=
 =?utf-8?B?U0pzWE5EUDdSNEFVcnpBbkFxVEpaWWdUWlZERnRoZGljTk1SekwvTENtU0Za?=
 =?utf-8?B?THkyUnR1bEhHU3EwdU1jNTFMemF6cXA4cnBPbDUzdEI3aGQ2RWMyVEJqNDlw?=
 =?utf-8?B?eStSU3Naamx6MGlrMit4TEg1K2Nkc25UWmJtZElnWUszY0daKzJPdmVmTUw1?=
 =?utf-8?B?dHU4K3BTY2lVWnFPRDNHdThOZ3hhMEk0UEVJalpLdmx5TndhWGthcVp6aFJV?=
 =?utf-8?B?c00wRjFuYXdESDJZRVljMXp0eS8ydVo4SzVuUzhzN3hFR0tseTFWZWxYZVdN?=
 =?utf-8?B?L2h1U1Y5TitScmUwc2ZaeUlWeEc4VW5ESHJFSytZSnZkVjk0Q25aOGRWUmRt?=
 =?utf-8?B?YWwyeEIrK0xEcmNMNDFuRlE5dlpDS2hSTFcyYklVY0w2Qys0VUlwV2JVQ1Ir?=
 =?utf-8?B?Szk2amtIclRIajNNanBaMmZqWlRMaEhxMnNsQlA3QlN1bndDMDZhZG1yaEtH?=
 =?utf-8?B?c3c5MjdJRHNuYVMwb2lkUHV5ZU9JWHVyWGFRVDlTc3B4NUVCZXBZcWk3eFBE?=
 =?utf-8?B?QkoveHRTemtTOVh0dHpNTDlaMS9Od0RZQ2s0c29EUU83Ym93ZVRwb0o3TGV3?=
 =?utf-8?B?a1NwOVhVVXlIR05pOVV2SEw1YXhQbUVGKzEwVUo5ZzBadjliTnpURlZEamll?=
 =?utf-8?B?VElYY1lxMndWaklkSDVCbGZqVlVUWHc5WlFwM0JrV0IxRUhaMlVKcTErbWlX?=
 =?utf-8?B?YVQ4QlJ4Z2hONUJTenZMWTQ4M1kwSlZUUGt2MVV3SUlyVjhwMzlldUR3aWc2?=
 =?utf-8?B?cVc1em9BcDNwbGxqdUc5UTQwRWNjekZRWTFxMzJDell3OEtUTncyb3ZzaDRS?=
 =?utf-8?B?ZTNLelNwSDNEZWZNS3ZFZkhubGtiRVJ6UXdNWi9kMHRLOVBZTHEzNHdCVFRu?=
 =?utf-8?B?Mm8wekpEaFYzeTBzOEpMQjVPZ3FXL00vdHFHQ2ZmOHRudjN3WHhCSmd5VFhZ?=
 =?utf-8?B?SWFmQWs0SW8vWlhnRjI1TldWTkJoQ0V2dXN2WlRIM0NLbHBITkM5MlU5T3g5?=
 =?utf-8?B?VXU1cVZKWmJ6ems2d3ZCaWxQcVZPaXcwL0ZYcitseFYyNDdLQ0Q0YTY3clho?=
 =?utf-8?B?R3dENWJJcFRiQTBmWHp3U1YwTnZCVEdQYXYrNVlLNUNTeVZwOVpGM01PQ1Ba?=
 =?utf-8?B?eVM2UlcySUZOVDdCUWRCdEdraHk1QkpJdzNpYUxwek02elFHZnBxZVV1NU0w?=
 =?utf-8?B?emxITDFnT0pIdTZyQlV4alBqY0gyODlyR29DSTZtaU1aL2pHLzBKWGVGNzBi?=
 =?utf-8?Q?ImaahYxNgSLhFZrMZUCmn1Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade5d2cb-652a-4309-149d-08d9d5beac5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 11:28:36.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMt9DzLhb7FU7LCrMaFi634cMwL/u3VzPnMiBG1/0qjrNGzUTmbj8S2spfpsWAITtlkI+oy0htINhFW+un5Wkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

Macros with arguments need to be invoked via $(call ...); don't misguide
people looking up usage of such macros.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -43,15 +43,15 @@ define as-option-add-closure
     endif
 endef
 
-# $(if-success,<command>,<then>,<else>)
+# $(call if-success,<command>,<then>,<else>)
 # Return <then> if <command> exits with 0, <else> otherwise.
 if-success = $(shell { $(1); } >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
 
-# $(success,<command>)
+# $(call success,<command>)
 # Return y if <command> exits with 0, n otherwise
 success = $(call if-success,$(1),y,n)
 
-# $(ld-option,<flag>)
+# $(call ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(call success,$(LD) -v $(1))
 


