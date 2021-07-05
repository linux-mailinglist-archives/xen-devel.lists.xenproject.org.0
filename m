Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C503BC15A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150441.278162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R7O-00035p-Ce; Mon, 05 Jul 2021 16:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150441.278162; Mon, 05 Jul 2021 16:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R7O-00033s-7z; Mon, 05 Jul 2021 16:06:46 +0000
Received: by outflank-mailman (input) for mailman id 150441;
 Mon, 05 Jul 2021 16:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R7M-00033T-Ok
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:06:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd8520a0-ddaa-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:06:44 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-iB_4SG_qOdCtPzQL3FXtXg-1;
 Mon, 05 Jul 2021 18:06:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 16:06:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:06:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0092.eurprd05.prod.outlook.com (2603:10a6:207:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 16:06:40 +0000
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
X-Inumbo-ID: fd8520a0-ddaa-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4cC6Un4LMCn/lFnPBKF4eFaPubNu7dvYnjhXyk0P90U=;
	b=WtxWEaXzk9O4Q5kvci5yM+yWWDc/GaTWfc+VDWBH1Y8RXT0e8z3wjZdxA17w6SmtyPanuP
	2RmneaDZK0930Q3ceQoeDztq/AiDuD2X9ZiPMRlN7otztAFVPKBrzmJVq3y9/FBM+bNUBi
	pRRlTSxG/Fp6qEMug2jfPFde9YuhiD0=
X-MC-Unique: iB_4SG_qOdCtPzQL3FXtXg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzloCQjGohMTksuqpX0ip/cYd/ThOCej61ZD7mj4aiGW56jodX+YKIAgJ2lrWg9x4zgbRgxnkWQTAfuMAkqVoUvfXBKd8Aq0h0jJglvWJAdj0NZSGZOIf9rSK0eDV0GnNkPFyfNCLZHJpp+Lli6dQQVbIprpaiW1zo2OVcvhUpTbm4mjZj1rjMLaJCtmMhicPpPXrqMz/YEETe0VoqZeg1pqZLEsFWVzQuPgKrNsE0dQzif4ecrre6rPAvFtapLCQ1NU+U73Txvw/C65Q0BctlEdiNLpYMgUymXKql8jidvIgDI9/oOjLUDc8IkDUE3jYKb7Wrd0x5DCaxblEps4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cC6Un4LMCn/lFnPBKF4eFaPubNu7dvYnjhXyk0P90U=;
 b=KoulVsXM5gjgidL5FZDJ7ydnAs6+gsi58Rs9VeKBxtkjW9E1Xv232QBrbOcg3+w24LQNKW98oiCM2fFLXaWcUiOf4Rexg8IVaTpNu5LpWGAOSQvHr9ca5gfYw3CJdDOWsGvZf3QA+0JzAOQf85dLr/76cOcwrhyPZr3OYgLwYKWASQBnePAD3dwvXFhaCKDrjTmpJzlS1DPZbte2HIZyOpPW5K3fkHx8IUwAFnZrMcmT/fSgC4E3kx4e9lr8BvIsQ0R1h4ftRSFwwg28a7MqPYW7XoEpJdJDkEWP2nIzAaKrR7wZBD96t3Lx9cp0BsOGlTt7rwh70zSwdlBaYeUwxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 03/16] x86/P2M: drop a few CONFIG_HVM
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <55643e68-432a-116a-b68e-2200e364e5da@suse.com>
Date: Mon, 5 Jul 2021 18:06:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR05CA0092.eurprd05.prod.outlook.com
 (2603:10a6:207:1::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b636fda-523e-4ec5-4557-08d93fcee02e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861B42A1161EBE253428E5CB31C9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y9O7zrOOE6xlNPYCKJ3g8bSqYeuc68bLkIcEjlmhh/9t/kyzRQUeHU35UqT8yiPMkcrhfSHhGjU6g9kTNBvKB3HMY6EKDCKJxwKnYQ/1n0EE5QsWumK//5tAwQV95LoK5UufHtF1S68H8+b5jjryDvVxlr3haCMJZnhKhY+ylJthDbkJAhifhL+TetC7qsceUc7OuooQilxl/7PyYOKKrDtpJN2E+pS6rr+b0xOdU7wLuZfV9yex86k+goAnkfyePXRXhzDeho3TnNXj9xREQRUFiohjOTQo6QKufCuBy4PGjmea9Lepg0acEZBJXMPEwfZg/MWbq7BwuwkMmesz4+ErqES3559yFvTt2deh2LsjcaOflyYsmoffU0GdJ49Y+GYhkyCFXOxa/+h6yYYKRLzRYB8Y1fo50AFBuT1KhKHVrH7Tk68dLBDpggpV9YZ9YsfMcavz66mPZiwubh+rSBhC7q1etCcLJamPJIknRMRwIRcWTrYvQ3dMWaeS6a1zc9Qp9ZilKZJlIWEXo4v4pPLGbt8qVKj+TNF5p/zYEUS2wxLNptU5Q6QMeNjn4WQS/GTxnXvq1xAoNu666eeKMtkm1IgsrKNcGtGj1U9H5/aY4KIZpWC8IgV9BXAvmLePp4u5rBy59SchkmtaG0dGE2Gm0Y6Y78bWt9B7G/dFLX/jUHMzTCvBYHh5Suv593koZ6XUuzbHeW8ekUkfl4NDJ1INBI/gV4SqH3C6X8H62Hw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(26005)(36756003)(186003)(2616005)(83380400001)(54906003)(478600001)(6486002)(316002)(16576012)(956004)(4326008)(6916009)(2906002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElWVUttRWhHRzI1ZDBnODZkeDhzQlNKVktNWWN5QUFzakoyZEJPSy8vT0Rv?=
 =?utf-8?B?T0lWcEFMWTNFVWU2U2dqKzgxQlhqemx5anZmanBYQWNJTTQ2bDE1N2VubjBW?=
 =?utf-8?B?bFo3UE5BUDY0UTlTOTV3eCtIcFhlR2QyNHZLMXZIVkdEYnVuRHRpTDVlcFNu?=
 =?utf-8?B?STgvNnE2TFQwQXdheEFXK01pWk5uc1J1bHZ4S2xES1Fid3V2NWk5cm1OcVVi?=
 =?utf-8?B?RUdNL3ZTWUF4U0pqSXlOK2NlckdLb1ZGMUsyUGpzZFBOL2ZPbTY3L2ljSGdG?=
 =?utf-8?B?TFN1NHNTeHBwR2NPTTBnVVp2NE1FYktaaUUreUhVUlZuR2xkSFRtVEU5MC9Y?=
 =?utf-8?B?aGxwU1FlSFo2L1k5a0cwZ1h3bmI4aXlVL3B1MWFTcXpsbTQ1NGMrQWxxNk1W?=
 =?utf-8?B?UmNwaEFGN3IwbTlxSitFTFRyR3BiZmFoMkNBc0tpMUhWaDNySzRDWURadVdM?=
 =?utf-8?B?QXBhaEhoV3Q1U2RvK20wdlJoYUZuN2hNZCthOWMyY1cxbjF1T1k1bmJTOVRE?=
 =?utf-8?B?VmtHbkpJcE5pS2wwdUR1dXg4RmQrN0FSenpKcVNvc3ZEbmRLRXJKVmJMRmFS?=
 =?utf-8?B?OUFlWEk1K0RQUnN3dUdsSlVYVzRXZDZHUG5FWlhyeFlGeGlZQ1RPQ1UvT2Jt?=
 =?utf-8?B?bXdieGdua0tWWENhRmpLeUhGakJVemlKaXMxeEF5REtQeTRmSXBzbnpuclg2?=
 =?utf-8?B?dXFGNnZhVXBLakZlUHNuaVd5NEdVYUF6TTRTcEdXaXFZTXlSYUhnZkk1MUhR?=
 =?utf-8?B?amc5K2hocGtXOCtyL1ZuV09SMldXYU9WWEt3TzdXZ3ExSlptVmwyRmtVUFlw?=
 =?utf-8?B?WERLSm1IRVdJaXczM052amV5UDVvVjlLQ29XRW5xeUJCNytEOWhJdHQ2ak80?=
 =?utf-8?B?a1hwTnFPbVVGUElQaWdlZXJ4WjdNNHowTHhYOGF0M0RTelpWeDJkMndvUkxQ?=
 =?utf-8?B?MzBFSXJiNEVTUTArZDZmSG1uRDNGNkdNanR3K3BXeFp0TVRXWHBsbzdDNGtp?=
 =?utf-8?B?WmpEVklZUXZCblhBS2xVRlZURkducGhrZklFSldzYnRHQTdFUmE1RjcrUDZs?=
 =?utf-8?B?MCsrcXNjSy9GWTdOZXJnL2J3OThNRG5oMUJKS2Y5YVl5bFpDZTVWRmthZGg3?=
 =?utf-8?B?VVhmcGpzY202d25jdnVFamp5VnJYOXRjS1dKMWRVOGxXRUVic08rTGJwV3lQ?=
 =?utf-8?B?RGowRDhDb1NoQzczZGdoeGkzYy8zNlNSVkYrdFlxK08wbGxGdUpuZGFMdzlR?=
 =?utf-8?B?amFHWmhtd0RmMTBPWUI4b0haY1NkUk5BRlB2dEdJWmJ3UzJjRVlWN0krNXg0?=
 =?utf-8?B?YmVlM3hSNFZpdXVIeVN3d3dhSndSaWdwZXR2OXJkSFgvb2RVTGt2V1JFTmp1?=
 =?utf-8?B?OE9JZlVCZUVvNW1zVWRzb1lKbU0xbUJKc3VUb3FvVlNVZWFrSWFYU0dUY2hn?=
 =?utf-8?B?T2N1bjNTWWNhZ1FHdWYwS3lYMTdrcE5sNVRORUZVUmN1a2U1N2xMSndPYVB3?=
 =?utf-8?B?dlJjV0txVDE2eXI4L2xZeVJYWlVMeEpoa2N2NGk5c0czRVoxTEhMS0JPUnRY?=
 =?utf-8?B?TzI0UUpvTi8rbTc1aW5kRndIRy91b1hTVnhaQzZDUUovanprdVdwQzgySzN0?=
 =?utf-8?B?T2R4aUdhOUNQU1hNem9Hd1lJWFU5bS9hK2ZFclE5QlBLM2wwaHBzODdleWlB?=
 =?utf-8?B?b3ZRWnFzY1hRMnVkZU04T3N3a1d2MW9IK3FvYTF6V2UxandYM05OWGx2V0Fh?=
 =?utf-8?Q?PGDJy3ZrzkEqv2R3T/B0tsOchsoMWpi4B1bZ8Rv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b636fda-523e-4ec5-4557-08d93fcee02e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:06:40.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEJEDaLtAUNSlJANgNimyMBSi/k3gHYaJMf+MjpWB3GtkljiBkg5rLHLmuBoyMU8iflyBY/MyLr2Myyy7Y0JZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

This is to make it easier to see which parts of p2m.c still aren't HVM-
specific: In one case the conditionals sat in an already guarded region,
while in the other case P2M_AUDIT implies HVM.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1584,11 +1584,10 @@ p2m_flush_table_locked(struct p2m_domain
      * when discarding them.
      */
     ASSERT(!p2m_is_hostp2m(p2m));
-#ifdef CONFIG_HVM
-    /* Nested p2m's do not do pod, hence the asserts (and no pod lock)*/
+
+    /* Nested p2m's do not do pod, hence the asserts (and no pod lock) */
     ASSERT(page_list_empty(&p2m->pod.super));
     ASSERT(page_list_empty(&p2m->pod.single));
-#endif
 
     /* No need to flush if it's already empty */
     if ( p2m_is_nestedp2m(p2m) && p2m->np2m_base == P2M_BASE_EADDR )
@@ -2497,7 +2496,6 @@ int p2m_altp2m_propagate_change(struct d
 
     return ret;
 }
-#endif /* CONFIG_HVM */
 
 /*** Audit ***/
 
@@ -2603,8 +2601,6 @@ out_p2m_audit:
 }
 #endif /* P2M_AUDIT */
 
-#ifdef CONFIG_HVM
-
 /*
  * Add frame from foreign domain to target domain's physmap. Similar to
  * XENMAPSPACE_gmfn but the frame is foreign being mapped into current,


