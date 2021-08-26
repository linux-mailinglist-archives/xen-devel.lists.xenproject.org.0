Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E493F851F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172856.315410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCMb-0006kZ-LD; Thu, 26 Aug 2021 10:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172856.315410; Thu, 26 Aug 2021 10:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCMb-0006hx-Hr; Thu, 26 Aug 2021 10:12:01 +0000
Received: by outflank-mailman (input) for mailman id 172856;
 Thu, 26 Aug 2021 10:12:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCMa-0006hr-4f
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:12:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af25be9e-c6e2-4b4a-8c66-2b3bf8733ba4;
 Thu, 26 Aug 2021 10:11:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-BvEzxeBwN-qJjxlsivF_2g-1; Thu, 26 Aug 2021 12:11:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2960.eurprd04.prod.outlook.com (2603:10a6:802:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 10:11:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:11:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.21 via Frontend Transport; Thu, 26 Aug 2021 10:11:54 +0000
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
X-Inumbo-ID: af25be9e-c6e2-4b4a-8c66-2b3bf8733ba4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pIz493n8vP2lByOzJVJJbPpIRS7dNzvxod2n9ZIyps=;
	b=FH+UJ1lY80NDYyyCDeGYwkTtbNz+exaMBRwq4UB34xan/aM63eKXVtPigl7iNu8rz7mT2N
	6H9AHfZkrOTEqlLd2HXiHwBv2eUvMTlOF1wDcZTbnsq5kUTX4mxsu90xfgwuVl9+qZN8ke
	hkZMiyxTRVsTvHXWxghdtGVJGfLNLA4=
X-MC-Unique: BvEzxeBwN-qJjxlsivF_2g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbY4FW7gDW2bvo4M9kY60wbM9Kr6Gst4sq+Nb8yMgNdw1Zysf64C49mPSYe2B9XtIWaqVYs8661HPhWOnanDczZw2qve7L8TVGpyDtGaosBFGX9/4PiWuNIdaO0RC1gN9B8iKERrQJxhasOky0Ed3eVpHFzkvJtemDoP0hhlS7t7Qe0ugTdFED6hpJ5vve8yUkOZnrEZBe/O23ee4MhKoVrkgxDGj/zo2bqJUfbGSDp+MehQPISRHuDyW64dkoQrFhESLdMh+O7brQKioX0Tvwz4Jn6IPfJitpqPybS7bkVWd4hGBBZBUzSJ5Gj7+GbS3AVHFjr9D/pzhSxJYzu3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pIz493n8vP2lByOzJVJJbPpIRS7dNzvxod2n9ZIyps=;
 b=lYGQaCvgtPpTCZnky5Lrzg1a/HQfCZNrbmA33m/BaTsjz3WojLs/q9HbYp1lDljmsLaRnsLEzshub3eJ/V9bTCdubpsIshU+JPCYiKHuI5GhMMORTYoK7/HZsgzZCD28mZ8Qq4/uGyaCkTWJnh3yABHRhcS9tX0kmZtRj6zwKH/En3ZQ9CT3N/Z7c5RFAn/fr5P41A+UOLyPGoF0VAijBAGjZLCJh98z7HgtU8eZVEsO93suZXbBdO5vkm48fOh5Dy4NQ+A7i61RryVJ1iSq7HNewF2B41+DYBbN5hDGc6WtlAuDmY7GYpxwR1gCfLY5k/OoTNCUiUm5qslrRscutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/9] gnttab: drop a redundant expression from
 gnttab_release_mappings()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <80426a2b-81ac-acc1-db93-077934468b1b@suse.com>
Date: Thu, 26 Aug 2021 12:11:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cdab8b2-48db-4732-2dce-08d96879ee36
X-MS-TrafficTypeDiagnostic: VI1PR04MB2960:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB296020A309DEFB1A9A491F08B3C79@VI1PR04MB2960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vbt2CKLi+9AQphc14DciUisJagnY5ZhckSqnlUy6eDimwvs3gHAMzF7/TjoBC4gIARVAGC5fF87xKUzRIy8wEItfeHCPuyr3nezuBkN/EN9HOCeXU91rswhi39guV0kfLgWevB4G+3I64oEZ+D9QCD0oDOuoW1rc/URAcN9Ybp2siP0RwRKaKcZiQRuLMU9s9OZkhL1j+/lhAZHAkhOhIhwCNAClLU8O84N8rCFZTxsHC3KMpVSDWkfSRMiAAp1tMNwUBXAMS+CTxX18As9MEOjh8tCSixO9WuIXLDgjsxE3CW7gKKyYviemXDVpN81Wh3QfcBw6JH//WvTFcXA8p/ke5Gak3KuKGTul7+ojC7YLWigkHNxjgN3JcpIYNUklQOSQtP2Z9U3IbGarxgUTsuzG41449SYAm75K6p2La0bpBfXfEUv3zyA4IJpmSLiylYUqiyYF43w/1oAbhQ8IzlETolLQXhJBy4fYum8PcJQLJ7x74TRSU45SHF/nIzXhGxtUd7ma/bLkUEmPWCeYkoB/myEqshLTSa2gFWUiNb79Nci4Z4hpr+fEbHeznf2Z23SuD90M8MkuWXTuuNHUiiPUE4+Ot5Na1YLoDUyrm/7nj3471R3d67R7tAASKPSKADfy4RleRx7Mv00qnYWVdw1k0EHxBZnpMUUy23fqcvXvoh9Rqna5eNRgjOk9TWpzjaydazFUYoQgiCcCBIeODf2khhxgd9sk/NgLMPBKva4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(396003)(346002)(366004)(136003)(5660300002)(478600001)(4744005)(31686004)(956004)(2616005)(6666004)(8676002)(6916009)(2906002)(4326008)(36756003)(8936002)(6486002)(31696002)(186003)(26005)(38100700002)(66476007)(54906003)(66556008)(16576012)(316002)(66946007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGJxUW5VcnBFaFRFNzFDZFRlWFo1SjZDdnYvaVF2bHBwcUlxUzB0eTdZK0pV?=
 =?utf-8?B?ZHJLdFhYQ2VXL04wQ3NLTHEzTU5VaGJaemljTmc3NWxXVHYyWWxnSm1PTFQz?=
 =?utf-8?B?VmhTZ1FoYWdSVDBCdlNsY0JOcklYYm83ZlNmR2I1WXBEQlY2TWh2UHg1N2t2?=
 =?utf-8?B?eWxlRmoxQ0ttYTVJRnNMYytuNFJMMHVhVVVQbnQvejVkQVdaTVFBRXZYcnpF?=
 =?utf-8?B?L3BrZzJzL1R3T3dYV3ZicHREc1VvT2hLbVNsZTBKczk2Rm1OMG80L0pBSWU2?=
 =?utf-8?B?aXF3NFN5Y1lXZlNmY3h0QWlkcnIxanBEWW1SZVozNXNlWmUzZ2ZFVTBURkNR?=
 =?utf-8?B?MXBFNy9wVWRHNHNOQ2doNnFCSmxISnZrZFJxZDFuNlhnYnlXWWF1Q2hiRVNW?=
 =?utf-8?B?NVBCTGtkOW80MERKMk9LZVB5RTB4dCtCc1FWMDU3Y05lUlF1OXBmREFkM3Mz?=
 =?utf-8?B?WVZoUUpVTVo1WDRLdkd4UnB1Wnd5UGd3VnBMOHNxSE1BMjIydzhHN2NWZlo0?=
 =?utf-8?B?OWVpUmxYUG5EdGFsRk5pRDdFNXhGY0hoZ2ZTWFNzbFM0TUJLaTFUbURwaVVu?=
 =?utf-8?B?eVlibzRQOThLa1k4YmU0ZWFlVkhMREErc2tCckFMaDJZd0ExSm9NWXd3TnYv?=
 =?utf-8?B?VkVSOEx1eWo0OVpnNUR0TzV4ak85aDhiN3NWTVA3ZmdXdW1YUFZDdzR0bitr?=
 =?utf-8?B?VFhnNE5icHYyRkFjWTRrelNGdmR4cGRlUGE1YzM3Q0xMdjd2RlVObU80S2h4?=
 =?utf-8?B?NUcrOVZZZzZVU0hLaCtHNVBqSXB2bzZpODkwT0hqZys4NkUxSXJ4NUdqQzNB?=
 =?utf-8?B?OERZREJOQjFNbWplTVUxb201MW8vSjVURitKbmZzWGFmSFhZc3dLVUFFSnYr?=
 =?utf-8?B?dkh1QkJHQUdSdzlNOVowZVFMekRWMERPYjJDclpMOXQ0cnBWbVJrUTc3L05X?=
 =?utf-8?B?c2pzOVR3TXlhb0lodlFQdTF4VzJQQ0JmV3pZcEtWUFBqOFJVK0VKRXZQSVRS?=
 =?utf-8?B?WFpTVXhBU2tDSlN1SlUrcmVXZUZ1elN4Um1wTU9tbEhsNDJEcERGVnlSV296?=
 =?utf-8?B?MjlrVTBSNi9oRVNPbEJyNWRyZjN3RTNDbDFuc3ZvS0NoQUxPb3U3YlJycUVm?=
 =?utf-8?B?MjNNbWIzcTBQWk1KbENzK2k5MFErQWh2TFhZSGc5SGtOQUdwYVRxWDdsVDZT?=
 =?utf-8?B?STAvWTJCM01ONjhXQW1zS2RjUXFxRU1UdzZQWHBOMVQ1aVM5ZEJuRWJKazRO?=
 =?utf-8?B?QWNIMWpNN2pPcmx2Yit1WFZ0U3JUcUtETWNNZFZBMzBWMCt1T05JR09JcHlJ?=
 =?utf-8?B?VE12Yyt5YTB6MDhtTHdZNzl5WW9xeGd6T1VEVjhVQlFCQ04vbzE3TUw1alBa?=
 =?utf-8?B?M0JOYWNqTk4yYlFEc1RKTjBoekxWK2dIQ1BvN3N4WnpRc00vNmwrVnFwZEIy?=
 =?utf-8?B?alk2dGNxcy9OR0tpeGRhNCtpTTQ4SExXV24vM25RMXFSTk5iTGlNNDFUUDBy?=
 =?utf-8?B?M2VuV3RoS203dDdHWHRsY1JFZ253UUNZZmFnbnVmRDdJL1Vib1crdldUMlZq?=
 =?utf-8?B?cUZ4UC9FbVVJSjB0QXpMMWd1Wk4vK2llaW5iL2F3dFVoZVNQZVNTbUxKUFMv?=
 =?utf-8?B?WmgrdTI1TXdhSG42azRMajRlQkdRVWNpMHVhVEFJaU9yZVBTa0RCcTJINEh6?=
 =?utf-8?B?cWdzQUlUSFV4bXExbGRsK0lDRGw2TUZIWFY0ZjM2RVFXQktSV1RyMW5nbE40?=
 =?utf-8?Q?OtmktDfFkuuj8xH5qDbFvT4SexPwX/zz/5kSJIg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdab8b2-48db-4732-2dce-08d96879ee36
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:11:54.7464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHYtr3JZarBpiJX4ZxUMkGaMXshwgDSOZ3RJRoAFjCjeYc3jGEXXYHmhfSkaPY9XdfqRlzjRxi3cDM1n5wFIlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2960

This gnttab_host_mapping_get_page_type() invocation sits in the "else"
path of a conditional controlled by "map->flags & GNTMAP_readonly".

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3816,9 +3816,7 @@ int gnttab_release_mappings(struct domai
                 if ( gnttab_release_host_mappings(d) &&
                      !is_iomem_page(act->mfn) )
                 {
-                    if ( gnttab_host_mapping_get_page_type((map->flags &
-                                                            GNTMAP_readonly),
-                                                           d, rd) )
+                    if ( gnttab_host_mapping_get_page_type(false, d, rd) )
                         put_page_type(pg);
                     put_page(pg);
                 }


