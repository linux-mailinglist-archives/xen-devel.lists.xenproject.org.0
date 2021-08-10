Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7383E57F0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 12:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165316.302122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDObn-0001yt-5V; Tue, 10 Aug 2021 10:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165316.302122; Tue, 10 Aug 2021 10:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDObn-0001x2-1f; Tue, 10 Aug 2021 10:03:43 +0000
Received: by outflank-mailman (input) for mailman id 165316;
 Tue, 10 Aug 2021 10:03:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RCh7=NB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDObl-0001ww-Js
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 10:03:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bbf6c09-f9c2-11eb-9f6f-12813bfff9fa;
 Tue, 10 Aug 2021 10:03:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-27xUuYZCMaqt-DiaTg-D8g-1; Tue, 10 Aug 2021 12:03:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Tue, 10 Aug
 2021 10:03:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 10:03:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.4 via Frontend Transport; Tue, 10 Aug 2021 10:03:34 +0000
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
X-Inumbo-ID: 3bbf6c09-f9c2-11eb-9f6f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628589818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WASWLKZN8MtP8doE1BjpB/TSY8bi/cZ8dhbemMvQ6HA=;
	b=hXNiI8zYyBGwaPbFOZZp0jaJFVeIVcTo8q6wsfFMf5p20zu4TIwR9Mw0tXN0dU8E1XnB/2
	a7p7BGw+tVxXnB9Oz2ylD9+/03Dj1QqwsL+YZ7wwNzE4j7NFng1Uw4jX5NiebJHXfFcx97
	DNzofvE3+pCNJFiWJgFNNoDz83ZFT4w=
X-MC-Unique: 27xUuYZCMaqt-DiaTg-D8g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/iLAIwb+GW9D65eBS4xuy0Qp2qO4LlLURqPN7zZ2OPFeg/RjXmbNhE5iF0f0lr8JO5N+JHRwnVm4zq4jaNpnOH6laOa9AXXdp8KH04B+4bh3Yi6rwJM5/gTJ6PqmDDR3vCYR/nKysk0ntt6FKVX+uOO+cb3fVXkumVlsK1Vb2UX49+jiI9BoPE3HjDAYGsluS5o+FD6L3DTR9whmZw+NzyaRHsj4+qJ6NkLyDbaIiQVR0UUngTP8jwJn6T5+Qbztj73R+fnY7rb3+QURVUYQeOM3ns0xhEnM9bZ4+IuTXwzpAyu2Bw7b6ux7RIe4mjqSlDG/foFZpATxvZb1uJfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WASWLKZN8MtP8doE1BjpB/TSY8bi/cZ8dhbemMvQ6HA=;
 b=G5l0PvWmbpsnKKMwxeRlXJ+5IILCKjCw+ada3cdV3qx4+WfFpSnH76k6ikt4DB4J5HLt3VUsCnmQV83+DJ2aTMihyfUC/GX7tMLE1jQJYFof5XEOUL0AtyXVp6lcdd9ZfvBUtm6g3Z11mkIXAXjS5DmF3vWszgsc0KvF9xqn7BPKmgGu9DdIe8Kx7IDEV9hlUCybpDCv3d4MpruRLoYbOoOnHhBxr9jRkhl80Me1MQJKI7+gNU+KJ5XJusSspy50oDsVnzbrXEqZSWnD2kB+OlOGkYmka1kotACWQ9nE2Kx5X4ojq9+7Z3GrKvMT2Jfx9JGeIAiW+DlXA72tLU5mIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] tools: ROUNDUP() related adjustments
Message-ID: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
Date: Tue, 10 Aug 2021 12:03:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a889617d-7dbe-4971-387f-08d95be61d78
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46056E944EE2354A8767CF46B3F79@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNMBVgJXZRCjn9RUvsholDSrslMyslbihfUmfDqQ3X4Ul9CnBlPxXJxDiFOhicWPZf6r11tqBYCPAdC+kpa7KqmTr1NcxY7VKRfqKgOcAzfOdSR3IZnm8gI7s5KzplgqCy9oeS4zNdaV9t+qwC1COCTGHCIU37whi7cI63SVBlo63hx3m4svvHVfEV5VsKWx8slngAiPCB2HzhpbBglEK+vIx/Pyz6cWjeaPkCL9cSMKHzYCiSBgcQinsJPpCZw9eDddsJo/1GTuWOkNk1aSMfJAMimQQvaTtPCUHvySAQXTkIbZbPsq1IPF4LFBdruESG8Pl8LoZyCUmzbwFDZ9mxQtcuKYwMw4qWBdwX8EpBGlq70YOF107wwOqQStcc9zXAqdUGdIpnAApG/oBiRSKWzNEZRWKRpGc7CtTFrl7LcUXpoOG3fdYag1uHcxTabNOYwjhogwgAKmAc6NnptJ/bms/bq8v1QZz+WUDQMybG/eMgJs3Ii23Brc6blqbg+yY6MRQOj/l/PfB9CqHMc1cPhOIiKeAG61VMyV2yXXsNPKutYP0fnxRQ1UNLkq5IdjZbCIBL7FUZZIuwvSyOLGDdAalH6MHv1isBskRWyCoHaaf1/TLCAE3s6/+IMiRFq/8xYkEnj/ZNKOOmx/hx87YDbZjttiVwSOvuePzYlq9eNb3hZpsKJg0c7wxpY+FPpx3qYShBW71AmyGl2Rz6docg3peslhnv2HllZWaG23kyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(376002)(396003)(346002)(366004)(31696002)(36756003)(2616005)(478600001)(316002)(16576012)(86362001)(54906003)(4326008)(956004)(26005)(186003)(2906002)(6916009)(8936002)(107886003)(8676002)(83380400001)(6486002)(66946007)(31686004)(5660300002)(38100700002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejFTZ3NRWjg5eXJsYTJxNTB5RFg5UVdWb1p0V1I4Qm5BUEl3WGxQdGt3ZURx?=
 =?utf-8?B?U2w1eFVPbVhpK3FGWWlUOUxGakFJYlJWb1dmQy9BVVNGRmVwU3hIdUZvR2lI?=
 =?utf-8?B?alpKZndHYzhQVGZRRTRWd3ZINTBJRXlQeVM4cWJWYmhEYmlZQzRYY0NtTjB6?=
 =?utf-8?B?enhQbkdZb3Q3RlJXdU9NVFJPZkVIL3l1QlRHVVN6VGZoZ1MyNUh2S2tVR2dS?=
 =?utf-8?B?N1RpazFCLzZjcGJWQzZINHd0NDB6SW1TMUIwMjFFdG5TdC9QSGhTeHhiOWgz?=
 =?utf-8?B?dzZaMWdNYm9nWDFmQnJweW1XcFEyWGdWTWVpOXBPcmpmcFNwY1V2S2duTERQ?=
 =?utf-8?B?UFRSQUVEeENPRU5QRXNRdUFTYnd2QjgzL3kydy9adjc2QjFBcG1OZm9ka1Iw?=
 =?utf-8?B?OWtBeEtBbXJKQUVpT2FuTytjR2FSU1VxOHprZ2RhV09sQTRyWktYQ2pyTGFo?=
 =?utf-8?B?YWNSd0dRZEVMTlpEMnk1cEF1MVZ2cnRZVFF6bkJoTmNySUxjRUZEampLR05X?=
 =?utf-8?B?bUxHS0Fzd1c4blEzd213di82a0JMRFcrRXlSQ3oxNXFDcUhOVnZkSlV6cmo2?=
 =?utf-8?B?ekpvVHQ1b0xQOVRacHRrVWt6dm03WWRleFRFeTVPN0NEeE9xeUUvZXRod29F?=
 =?utf-8?B?WWxQY3JiV0lrMTA5ajFmbE9hYzVObUF3ODM0d29GeGdUZDVJK01hbTFqREtK?=
 =?utf-8?B?N1JQUGp2anJXaXNVTDBOM1ZkRlYwTUFGb2xEMjE2ZzQ4dHg3Q2Ntczg5ZlNq?=
 =?utf-8?B?WlZ6cWJ6ZmJkZGZLWFpiVDBkeTdyTnVTN0NGR2NwNjZBK2lVQ2pZeXEzRnFT?=
 =?utf-8?B?TDFNMnZNbmhFWmE2bldMNXgveUI0M2liLytoYlZSaFQvWWZNVFpISGJMWVNp?=
 =?utf-8?B?ZkZQYUxDUHVJckhpazVJdjljWjNQeHFkRGtmQUtPYW0xOFlHS2xsOHNFQlpm?=
 =?utf-8?B?bERBK1d2dk0xTkNOS0htTk1zSEZDL3Jyc2VWR2UzU0hEYVorTjlnbEhUK1RI?=
 =?utf-8?B?TVNTMVcyVk9Qb01FOE0vaWRrWDZFTVJKbzlYaHpwTmVpN05lUmRETzFqc3U1?=
 =?utf-8?B?VzZIWUtxdG5ueDBWSzlWY0dlWFRaYXlqZ1hCL0QrZlhnai8yODdRbk9hMjN0?=
 =?utf-8?B?KzM5Yi9lODJlOXZwTVZLTk94QnY4aTJTNDdtdlRGbGFhMWhuUGp6SGZteFR3?=
 =?utf-8?B?TmR4ekwrbkxLTURFeG44UllsYVZwNVhoNTBnRkMrNjllZXJscjNjYWJFc0FR?=
 =?utf-8?B?N0RtSG5Odld4YWo4WVJnMW4zcUQ2ZVR1M0xuSk1pNkovbGJ5VU4xdUpBM1FQ?=
 =?utf-8?B?OTdWQ2hOT0k5WVdNb085NWlIMzQzQnpvdXpVYW12U2ZlU252MjZab0xyNUNI?=
 =?utf-8?B?dzV2WHJJYVU4UWNPb1hhSDAzbVVlUjhiN1oyTTcvTVZ6L0FLL2ZGMVovcFR1?=
 =?utf-8?B?L2VYK0lYU3NsMEpFV0VFZVFSbUFoTnBjL3diQmtOenhnWDJQWGViRWM3UnZH?=
 =?utf-8?B?aUNOK1dFYXpoOUZscHhwbVpvaGp0MzlvbjNqdk5mbXFlWU9XdFZXakYvK0th?=
 =?utf-8?B?OFRWdU5GbHRqSUJ6a3UwL2hEd1ZXYkFkUzJsK3N0M1llSzBZeWVKL1VjMGVE?=
 =?utf-8?B?NkwrWUlBWDlJRU52dHdDR1dXZy9yWjU5d21ocFNCYTR5a1psQWl4YTVZeVJF?=
 =?utf-8?B?alJZWXFFeEZCUXdjNWdkNzBQWGYwWCtQODUwQ01idWFBbFlBKytBK2RCaUdh?=
 =?utf-8?Q?xzaBjE3HqbsU2hzSoy/TVYHTgWtS11IJf4USRS2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a889617d-7dbe-4971-387f-08d95be61d78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 10:03:34.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GEyiiMm8a0HeA0SA4L1ibm0T3+sk17Tq/+FYlF7UkTsqEll8wa8rSx9DhB6ncJ8gVXo/gxD/BZkIf8HsSI3/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

For one xc_private.h needlessly repeats xen-tools/libs.h's definition.

And then there are two suspicious uses (resulting from the inconsistency
with the respective 2nd parameter of DIV_ROUNDUP()): While the one in
tools/console/daemon/io.c - as per the code comment - intentionally uses
8 as the second argument (meaning to align to a multiple of 256), the
one in alloc_magic_pages_hvm() pretty certainly does not: There the goal
is to align to a uint64_t boundary, for the following module struct to
end up aligned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
xg_dom_x86.c's HVM guest command line handling has further oddities: The
command line gets copied twice, yet in only one case enforcing the
MAX_GUEST_CMDLINE upper bound on the length. The length calculation also
doesn't take this bound into account, despite the assumption that all of
start info fits into a single page. A terminating nul character gets
forced in place in only one of the two cases, too.

--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -63,8 +63,6 @@ struct iovec {
 #include <sys/uio.h>
 #endif
 
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-
 #define DECLARE_DOMCTL struct xen_domctl domctl
 #define DECLARE_SYSCTL struct xen_sysctl sysctl
 #define DECLARE_PHYSDEV_OP struct physdev_op physdev_op
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -678,7 +678,7 @@ static int alloc_magic_pages_hvm(struct
     {
         if ( dom->cmdline )
         {
-            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 8);
+            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 3);
             start_info_size += dom->cmdline_size;
         }
     }


