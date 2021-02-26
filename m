Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD6325F90
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:00:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90140.170542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzP-0007Nt-P8; Fri, 26 Feb 2021 09:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90140.170542; Fri, 26 Feb 2021 09:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFYzP-0007NC-JS; Fri, 26 Feb 2021 09:00:47 +0000
Received: by outflank-mailman (input) for mailman id 90140;
 Fri, 26 Feb 2021 09:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zK4+=H4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lFYzO-0007Mw-Ie
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:00:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d1333be-ec27-4dca-9f4c-e6dacbe905d6;
 Fri, 26 Feb 2021 09:00:44 +0000 (UTC)
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
X-Inumbo-ID: 7d1333be-ec27-4dca-9f4c-e6dacbe905d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614330044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=BKIbao0IT5e1SwZzXMHrrFJKqyrW7kXtKWLoGUwv0qw=;
  b=DKtYxOjTPhJNCl/wm35CC9HvzbcKQhj+ha9h2eIuZK+ru9dawEGn1p/u
   GEaYTNp5qrXsE/z85KabSkbiUwpBhVMSrpTpg5JsSyme/8U2cf0jJ8WcM
   NTQFbhFe2ethBc8Eh06LHNgFBbQxn6dvBBkkzRPorpmaghqaP6MDHSwXe
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Rw6EQFzdd2pfg4ASxidV+NAkGTGdf1pNH/RLfORxx0pKkndWJPVFmhZTs1051UPGxj+Ij5eeeg
 Go8MQHviieXUteyUmIEjF1w4cB0fIQjRZjjUJ9jL3mtxEUp5x0614Vb+LFgdmH3i8Wbafm/QdO
 U29Kk0+nUf8pBur7aRSkWc2H63DNXFu2bmEbM++FVQPb0zWzy1XvT9sTIaXYY7C7Cgu8NgVKii
 GbT8AE3NMNkY6QuJtMibGwiShg5918YyCQBawzEm3tL4oYb3jgfB5Jae8io/3g9cvgtAhXZyHe
 0WQ=
X-SBRS: 5.2
X-MesageID: 38105673
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38105673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0SMC773LEOjlKGFk16pT1oQ8c8/jIUTpkghRo3e3JXhorS+wpaMNk5FFAKpSHfw7g5I/k6eq40dSOh4JJ/477gGK5ioZ6XjtauNZxho9PyTBCUgesfYcsQYaYMiY+SVnLHkR6MaghHkVlH5/ARCL9bcvwalIUqqwZ6wTPofpFzvMEmYDdrOIRVIjLteUD+DgBjJerZtRPfxZ6u9b7SMVfFDyPE4NDdksIGcFT2noXE0SDr38V4gx0V2YVyiUWkHCNMEg0POfgj/6Fg58xH7x+jeUe1UZH9FLj91qrFUnyHFMmTXdrJH2zBVBjr47VeId9FX2l/jZJfIXiJD1KPtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hj37e+SNrz2nKwe5qTt02taxIT6WJpsEwV4bs2+RqYE=;
 b=HssAwkpMyNUvvcR/Z44J19Je98VDKm2pRoGvYtjmy5wtAfPDDdyICq2sbXLZtmDy60pnm/i+Fwd0JHY6jh9ThFz6OrLPjgb8oIFy3UcXqcDDCMGhS+Mm8sZ10c8A/pqBl2mEjzdm0N/65GFkIPH7CZ0ve2HfpJJ+bH0kRTgHrwJhu8NF/U5+kMTGR9gO+d+wCzi8jaiS28pHbCmVRidY9xMPaGYYr052/T4pGBUn0fLYg/8Xtu3DgvlZQmn9k2m0+e3CPtVogeeuyiMBVkW/O8I7KLuJpo0KcGhgDqN5WR43TXAZDFiZ9+SO8m46SxvRWI5laNhSCNcODhaNnCUC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hj37e+SNrz2nKwe5qTt02taxIT6WJpsEwV4bs2+RqYE=;
 b=w/IOg6kkTz7PhS8T8onPKq5YsYPz/9FvqXHYMYJUeWJt0m6iSTy7+bwUZS5EumsPt33tfKOdA00uUrgkK/zWwnwXIYTDEST41oDEyg2zyjf2afJwbRvEpyV08S8Oi7oWDC+rwK9gO3SPkl2DDJ0L5W7t6vSfDpxE+KzE7ojxb3Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15 1/3] hvmloader: do not include inttypes.h
Date: Fri, 26 Feb 2021 09:59:06 +0100
Message-ID: <20210226085908.21254-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210226085908.21254-1-roger.pau@citrix.com>
References: <20210226085908.21254-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dd8cf7-8b11-4705-2e47-08d8da34fe72
X-MS-TrafficTypeDiagnostic: DM6PR03MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4394CA38234D463768B965DD8F9D9@DM6PR03MB4394.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sb9kNTeIPFSUNuY4xcmv69YXRRrtBMoL60fYDPFi85HjGsAx6dP556hBH9uWEnufx3LM+wbAJiP56HJ44okc81z9EZQNlW5f55DS3S5reUdGVTIQzZQ1joawS6yJc7nbOV8NBTmLSC4k86HoYBSOr6IzUd+ErTT0hjkygVCLhUwXFU6wCs1y2FDJ/XnPU8rbr0g8j1ImHY9rFRRo26/Fybp/nbHV8M8qWIRKszI2wczy8YRiskjedwSjpEWIQAn2g9ISDHXkM/TiauxiuszjPtNAi1Q1V7bdyp6uaPKLs/hhJF7zDjeXp6PwLZW+NYW8XyuZmPrQ62goZ4M96fWRDF3EE+HdPFb+HbJYmv1gcXQayZB7a/d8xbe/78kU7RbFQBBvp6igcxoboukBOu8XXLQZjmru20QeftR2Y9NCpTIaRxotmF3ymO6615cDmijqhelsjmpwfxPa3e0hib+RDj7N50TrlCu0ftbNqfwhxqa1oDMHzbY3h0K9R1N/O3Z2FkRGuFZzzB/xTOkuNWs2TS+8Zg0101Z7nfXb1vrlbk+PJSWtthF2c498Pt/LPjCsCxeca2P5mJwvthzI7cjbDrRXmWVCXPZzm3XccrfXn1Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39840400004)(6916009)(66556008)(66946007)(36756003)(316002)(478600001)(6496006)(6666004)(66476007)(86362001)(2616005)(26005)(4326008)(54906003)(186003)(1076003)(5660300002)(16526019)(2906002)(4744005)(8936002)(956004)(83380400001)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHlqclMyY20xemVqclJyR2EwdDErRTRBNFhtQ0o3ZmgwWFVtT1BHNERDTWl6?=
 =?utf-8?B?MlpUdWV5TXdVZ29uWHJ0aUoydGU1anhlbG40c0FiS2c1SkdtTGc2dXlRR2pm?=
 =?utf-8?B?d3A3WnJzdTJVQlFocFNlOEQ1ZXZyQnZEckZQNElJcVRkR0RJZUxqRWZpbHJI?=
 =?utf-8?B?YTNXcklVZHh4VzNweXpHWm1VN2licUpXakdraEZnemFqeGFkQVhkaDhXN1ZD?=
 =?utf-8?B?TWExTFpxNDBUMHNlY1M3R09qMUN3eGkvZUo2a3I4RHp6TUxZV0FwOW5McHBt?=
 =?utf-8?B?VnU2MjV2VFRVczYrRzJWSFV2MGtudDV3TC9RRW8vU0ZxZkhySENKYk9HNVNH?=
 =?utf-8?B?S0VvVHB2MG0yNnd0dWxhNUE5dldOYUJNVU5ydkZTaTZneXVuVTZMNEM0WDF2?=
 =?utf-8?B?RDl6YU9vL2d3cmVOTDB3M3lpdWp6QjJKS0J1SzdyRG14bEFlWU9ITFFZUktr?=
 =?utf-8?B?WEROMVkrWUNMdmZiWGVOUnRRM0JsRWR5eGEvSVg4T2RhN0tKQ1Q4cENLRk5W?=
 =?utf-8?B?OENZRGZ4aXVadldnVEZjTnpmSmVFYm1WQmVocnozZWxLY213aUJOeklwbk42?=
 =?utf-8?B?TmFDT3JaaXg4aVZtKzR5amljY0tMak9PQ1NKV2w4c3Y0czEwVXFqbzZSQmRl?=
 =?utf-8?B?QWQ5cnorOEtHZ2Z3RFB3VFdSeDVocnR4ZEtnSzNjeWRPejQ0c3FlY0tLVTNO?=
 =?utf-8?B?ZXRlTWZwQjI4eHIxRnRMUGtpamVuMTJtSnh0ODdoai9BMElUS2hRSTA4bE9o?=
 =?utf-8?B?eTFMbmF5Q3dGeEkzbzVCVStWLzNzY1BiN2tQSlpucFhiRDFDK1VXYTI2M3BT?=
 =?utf-8?B?YnEzR1hUYndOVmtTK0RnTkk5cUZtZWdDYVBENUl6cU5zM0hqRnBIVkM0NGc3?=
 =?utf-8?B?bG4zQUtDeUpCUGNoQ2kyY1Fwd1V6L1pKeVNiM0F1U0hYamN4ZysrSlVjczc2?=
 =?utf-8?B?QmFpRFN6QXVuL2VkVzVvaERkcmE1b3A4S2xnMVhYMjd3R1M0VG94MzUzWk11?=
 =?utf-8?B?aXNyRk5vWVQrUURjK1p3QWlMQmR3b1MyZWE4WG93VktLVVByeTdjN0tyQm91?=
 =?utf-8?B?bVFyckZXS0lmZmp2S0xDKzl2QVc5WG9adE1DMXcrZUhjbzV2UXlLMm5LaVVz?=
 =?utf-8?B?ZFNlbWhsNGJBcUJhdzV6VDFsU3BCM05LYmhFYndxRjg5aXRpU3pTeUFyQTdt?=
 =?utf-8?B?SFJTRE5XZnRMRHhmMFdJbTJHNkRKQ2pGTEhMaEhJTVRBcURFa1NvRVNZM2lG?=
 =?utf-8?B?aVpUU3c2aHVnVllqVVFRRG41cWwyL3hIbnZCRzFiSGw4L2F1QXhjNDFWUjJ1?=
 =?utf-8?B?WUk3UTE4QjNRdUFMS3k3WkQzemNkZ3h6bW1oNm05bHdSeDB5QVRxQnZmakZk?=
 =?utf-8?B?dGZmVXlGZW9IbHUyeVpOTnRUOWFqV2NLTFluL0pNSm5CcGJqVXpYR0VRWm8y?=
 =?utf-8?B?QU1Nc25wRnFhNnBONmx3eVMrN3NwclNYRHVPaFdabjAvWHplYVJkSnd4Vkcz?=
 =?utf-8?B?bDhCdlc2TS9xZFdFV3FmeXJoei82TXJIUFRITWdGVzROanRaWkpVekdBUG1M?=
 =?utf-8?B?bmUrM296cm5Rd1FXTTlSS0phb0oxbVRIUzM1SHNqamNRaG95ZnAwUmdnbCtQ?=
 =?utf-8?B?ZGdPd3JzeVl0TWdHVHBpV1dGMUcwQzlzTUJqa3pTOUkxNUp5R3BhWURLbEVH?=
 =?utf-8?B?a2NkSm1XcTZhTkJ1OUhJblNURDdUdDUwaW9STjdoQ0R4OTVzQkhQUm54WlAy?=
 =?utf-8?Q?aNMeWxjvPICYzblaz6bk0JIBdIjhBHlD4xqpG4u?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dd8cf7-8b11-4705-2e47-08d8da34fe72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 09:00:41.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvM0SuD9dzndUB8FQFIIUNhY901n/k/cQcpIGMzguoyCk7SDBQCbHqxGaVTdWf/Hk75e5yCgmAQPKHglQW8xAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4394
X-OriginatorOrg: citrix.com

elfstructs.h doesn't require anything from inttypes.h: it's more
appropriate to include stdint.h instead which contains the type
declarations required for the ELF types.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/hvmloader/32bitbios_support.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index e726946a7b..d1ead1ec11 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -20,7 +20,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <xen/libelf/elfstructs.h>
 #ifdef __sun__
 #include <sys/machelf.h>
-- 
2.30.1


