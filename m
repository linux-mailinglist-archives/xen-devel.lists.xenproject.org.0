Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4692A4B2403
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270368.464634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITps-0000DF-UA; Fri, 11 Feb 2022 11:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270368.464634; Fri, 11 Feb 2022 11:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITps-0000B7-QM; Fri, 11 Feb 2022 11:11:32 +0000
Received: by outflank-mailman (input) for mailman id 270368;
 Fri, 11 Feb 2022 11:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITpr-0000B1-9i
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:11:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf1f810-8b2b-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:11:30 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-RuU47eVtMNW5BE_A1Olc2A-1; Fri, 11 Feb 2022 12:11:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Fri, 11 Feb
 2022 11:11:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:11:28 +0000
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
X-Inumbo-ID: 5cf1f810-8b2b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644577890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mntgJm/vlrefY5oDYBfkQrVxSgDdqW81Pnz5MPk/d8A=;
	b=X6+SoLjzFeE1lmIcVh0NDmpX12x7K4bb6epQAOejlX4thiMuvCplx1VHFmPpXDbO1fSE+P
	XFYt040Kz5n0P0egYB9qcfZMUev76zXSwJkVnB4bnOUrVu9uGnZebblnIjplby4J8isZdT
	OEsGK1c7+Dn9NPO4+rja2UnDpUQrfHI=
X-MC-Unique: RuU47eVtMNW5BE_A1Olc2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGfAJIr4jeMi0+fXtHKgfI+krca68BVh7V1U6FFnn82cnGihLTgFHLTDOCB+CvB/QNWNbMQOUvBuI2cwQP1mzLPsD3b5ZAb3J+Xt+e3bJ1opyK1i1mwHJzOE+IyMyfof5U5VX37n5mwoURhymaJn4BM/NeQvQMBUdCqDYm6/xc91uUjwDq8CqgHGhp+Il8quExhBVa5duzsI2sGrU3DcSizpzi1sAdtviqPosqYvkk6fPP/FETNz3kDnGVmpomk5T4eHX1pWNFMWpo6/54HJTdrhNZpg04alR70mMASL1xCtTjxoi9t4uUMYywfLOdkY4oVUE7eMqQy6qWp3HdYymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mntgJm/vlrefY5oDYBfkQrVxSgDdqW81Pnz5MPk/d8A=;
 b=m6yXb9ymppQMLiYrVKOYvq/47a2nfB6MKUoQuS1rCf9YHpeb/ZF1rojHERqVYy9L5YGgOfio/cvAnWvSGRRA6mJnSAR8uarEZSZeE+6UbpsbFC9fgZcig+KapR3gsTdQsyL4JOEwZ0lAd1MhzZUOXFqL9RCh1Q/TIsPFglSrvf7XMtuev4HQszSwhDEEsPKCjPvUqVHRuSSm29PRdPrv5SPilxc2UmfUsxh9hz/J2jusq5yl3OD+cT2CFuPSY7tNorAQTKfnhSmmlwHDxJfH8Vs6jnUzD9YNu4MGWTKZTN27aFj7JIfgrHo62qcO/K9VQYdeq8PjsRri9Ocamt3w8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0519c820-f1ee-1b37-f1be-90bd1daf37ed@suse.com>
Date: Fri, 11 Feb 2022 12:11:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: fix SIMD test overriding of VBROADCASTS{S,D}
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 181fddd6-0125-4861-5e5b-08d9ed4f3fdd
X-MS-TrafficTypeDiagnostic: DU2PR04MB8902:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB890269A196A097BE5072E85BB3309@DU2PR04MB8902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fdzQYntupZ9p5rQVdNj+kxCIa9Ec38pZzcNRkzfZz+ABsWQiZhttOPPHZn/oBfQrdpTdyf9OnvwGqeedJd6RA7m6shaWiAm52MHC8UucafWrvvByMp5BIFZ7JwXsLEFLwhzsk8tn8PnIOzsSrPtetftFJ4divrOfNmlMOlh/bBzsEFawCKdfvzrb4DNEMrKY1PW8fPw0BobBqKmK2BFov/2yw0uul2ickZol7ohoY74BLsMkwgUfIjR50/xYQAgb01u1bauH1X+MG/rleHNaE6vLeAaB3b7pq++OR0HODUwrackOXrdLSAunqsdxWu4eKrffjNQs33wWyCQJfYQPdGEe6kP1iGvU0nonVrL3Jmf8tjJQyBbi5+flYQcgWFn5kKLRq86MF8jV9lQcmOoDMe1dznCOFbEXibWUz1yBMr/mU377F757SiQY2yQHElkKR1Xmb6qxwtnzbekwpY9G3+ylUb9MyDznrOxQJB04Gffhx5Zm+qk9qYN+FqWwuQ1eCP2Juh0HGJDihNNbmOsXwFZVREx/HUgvus2pW8DKP3Loh7ynH2Ln8iYY712JuYOYUDMkRlwb+UmLOGHiLoU8XnCsdlFPnAV0Gu+JXsLKF6SRCq8kaH8JHU6ZLl7othV/dfk2HjFZbCk8vCcBKeO0TgtQafeakHvGVnRmwqRa1/U62g8cuID3h20Xhi6neU0pR+5bkANodjrYcmlf+Exyvwi2AuNYj356DqQjjrzefePG81h/oOyQxJRWja7zPLid
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(4744005)(2616005)(6486002)(31686004)(5660300002)(31696002)(26005)(6512007)(38100700002)(186003)(66556008)(66476007)(6506007)(316002)(54906003)(8676002)(8936002)(4326008)(6916009)(36756003)(2906002)(66946007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGRBWXYwQnp5WTI3Qk9peDJaMVlucVdEeEtTMllOU2xWUkVPc2p3dUN4dmpr?=
 =?utf-8?B?V1Bmd0NQUXFpSWRmVFZNVU93UlNLT0tuMHpwWnRjeno2TUh0dTdpQWJJTERa?=
 =?utf-8?B?c3UzczVnTjJXU2dTN09qVVBFUXpWZXJEaHdKRDRGRHZHcXIrS1F1N0ZlSERM?=
 =?utf-8?B?UnJPa0Y1M1A4NENhdjRZRUVveFlqSjB0SmtUaUlweHlsbEFxUHk1LzI1NG5G?=
 =?utf-8?B?OVRmYm83U1Q1cnZyS2V2U3V2ZnRweUw2aklqS1d2TW8xLzBPVjh6SWJ0ZXNS?=
 =?utf-8?B?Q21PZFJKV2g2SW5aQnpkMkk1Uk55WnBZTmtGWWVud1FQR2h5eVpWYkV5TVZh?=
 =?utf-8?B?WHk1MXVWNlo1T3JjSXJXREZvQnAzclJCbkUrdStudHVaUlhJMVNWdXFpRDQ4?=
 =?utf-8?B?bFFpNGFvek5HYkVWMTluZ0VCSjlNekJsVGVNMll3L1c1SDhqOVh4cEFqK001?=
 =?utf-8?B?cjIvVVFKWnRKOS9FbmpDNmlPZXVLQ0FRUXVnQ09xYXZuT1N4QnF3OTErVFha?=
 =?utf-8?B?UW0rWjB3Ylp3T1prR2Q2VVI2alY1TU9ENWFhbGxZOTlHY3FpbUhkbUZxMUtu?=
 =?utf-8?B?a0FndGxsUzB1V1JkeXBGZkdYcUdOem9DNTZDT1lhZDMwU05kL0l4TjB1SW9p?=
 =?utf-8?B?cEhZaElPZlBYc1NpMmlBM3NhYmNSWnRtQ1RhN1NhaG5zdmYycmp6dVJ5bzlj?=
 =?utf-8?B?NkhvYnBxSlR4clNIb3dGd2ZHQVNyL2YzMVBGWTFQTzVQVzNiMDh4M3hsckRT?=
 =?utf-8?B?eE5nNGcyZi9JWHVxUHRiczNxT1M2R2Q1cTZjeUpialJQa1d3V056d1ByaHhC?=
 =?utf-8?B?SEtMdHBoQ015aVh0a0RqSElvbzRBeXMzUzFITW5lK1M4ZndDdmZ0eXN0eDdu?=
 =?utf-8?B?Z2QvZUFyOWU3WitJNHJIbHZSelY0T0Z0Ymw5VXFKL0ZIWjZ4RVEySUorRVMz?=
 =?utf-8?B?bkcycUp0OEVocXdTaUZtUk56V3BBRHRyekRVTGE0T3ZBUUVhUnJPL0NLd0w4?=
 =?utf-8?B?SEN1VWNHb0IzaGVLSWkyZERNOG5zMjZJeFh5aGVwSTBmNHlOb2ZBK0pKYkNr?=
 =?utf-8?B?aS9qVnZMMkp1M3M2ckZhdVdYVkVoVzZGVGgxcWdNdVhlMjlRVUJJWkVoejVW?=
 =?utf-8?B?SVdudE1Uc0tGM20vN3V4dG1NcFI3Q3RLc2RPMjQ2ZzRlQzBiT1p4dnpZSXRv?=
 =?utf-8?B?WmwvVW5ZbW9Pa3p5Zlo2MWgrckJqL3dDS045NkY0TTBhL09PVnVOTlBlLzQ4?=
 =?utf-8?B?RDlWOU9zK2RCOGVzTmJnZmVmMWRxaTdtMURqMkNqNHVTUERJMU1NTE9XWDhE?=
 =?utf-8?B?WEUvcTgxVC80NHN1RVNkQlcxRzJMS1IydFREdTBycWRrVWw1YmNKbFRhSTBh?=
 =?utf-8?B?L1BLNTVrNFg5RkZmY1ErUXdoeGZwaGVnd3pidEUwMlVScmVoR0YrcE1IaEMr?=
 =?utf-8?B?cGNmUFpiLzl0TmF2RFozNzJPc1AxaEF5MWFndHkxelFjQ2l5TFFkM2sreUtU?=
 =?utf-8?B?bksvSll0K1lRbFpTd1RpdlZwQTIza1dOQ01VRmVsMVNUNWJIY0NMNnlRQVZm?=
 =?utf-8?B?SzJpcEQ1cXkwaUZWNnRRWVNzZGdKck8yeENKd3BEbHpwRXZSTmpqR3JrTXE4?=
 =?utf-8?B?OHEvQUFqQ1JpNG4yOVRxdTlHNDZZRG9GT2tjRmNoT2NGZklHaXBhZUIxZ2Z5?=
 =?utf-8?B?UjdTVFAxbnl3cVIzZmtWcWJrUHgvWVAyOC9ZUG5tMVZ6WjB2Q1d3TjFDaTRX?=
 =?utf-8?B?bUlXaGhudkFqNHpLWmZubjZKZ0ZYUmZDMG1pQ0d1Sm5nYU9XWjJQYitiY21P?=
 =?utf-8?B?ckZ6Sld2cGVVUEdMRVF0UzVYMWpieVdTNFNtSm1WVlJ2R0s3TVBjaXB0cGdY?=
 =?utf-8?B?TGljMUloRjNGVG01cm9mK3RjNzRFT0RtZXFmR3F2YjlJU0lnaDVsYnpZVVZM?=
 =?utf-8?B?NnZ4M2pDM2FVUTBkVFlWOG5haklOQ0U1cjJhWEdiLytqM1Z2RlRzRCtrVHcz?=
 =?utf-8?B?T1VNV1VGK0ZsbHJLU1dLeUFsMnJvZjNTaFR2d3JUUnROVDNCYUNYQXorWWVT?=
 =?utf-8?B?RGl0c2QxT2pkNCtmY28rZUdOOHRzYVZXTDlxNlgrZCt2U0NrOXF5bTZ6WVZu?=
 =?utf-8?B?c2hsY0xsOEUvWjRTSEsrazFMck0zOWsxb0R3WW9PZWU1WnlrbFpPY1dOb2s3?=
 =?utf-8?Q?979nOQc+8WGubRFXF3gDpcY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181fddd6-0125-4861-5e5b-08d9ed4f3fdd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:11:28.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhL0FFBy34xbsjMso+oC+YeaigXxGbTPM1lVnDlNbIZghHqwAXY75cfrTLHdXMMzpNMCRYRIcDeyglWwIe8dhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

Despite their suffixes these aren't scalar instructions, and hence the
128- and 256-bit EVEX forms may not be used without AVX512VL. Gcc11 ends
up generating such instances for simd-sg.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.h
+++ b/tools/tests/x86_emulator/simd.h
@@ -250,7 +250,9 @@ asm ( ".macro override insn    \n\t"
 # define OVR_INT(n) OVR_BW(n); OVR_DQ(n)
 
 OVR_INT(broadcast);
+# ifdef __AVX512VL__
 OVR_SFP(broadcast);
+# endif
 OVR_SFP(comi);
 OVR_VFP(cvtdq2);
 OVR_INT(abs);


