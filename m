Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EC04F8F4F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 09:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301160.513925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nciqn-0004CB-H0; Fri, 08 Apr 2022 07:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301160.513925; Fri, 08 Apr 2022 07:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nciqn-00049a-Dp; Fri, 08 Apr 2022 07:16:09 +0000
Received: by outflank-mailman (input) for mailman id 301160;
 Fri, 08 Apr 2022 07:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nciqm-00049U-JS
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 07:16:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c24f8a69-b70b-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 09:16:07 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-I7YZqA81P6e09bUd0eAoeA-1; Fri, 08 Apr 2022 09:16:05 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB9PR04MB8187.eurprd04.prod.outlook.com (2603:10a6:10:24a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 07:16:04 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 07:16:04 +0000
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
X-Inumbo-ID: c24f8a69-b70b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649402167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+pDejtzsEifzIy04C1ku0J2v8gAR4+ceFtzM7W/JNZU=;
	b=EpbOHXSl51OheHSV9uXUdWQH6hT0V2WoqDFUWPkU6D0K5JEfc2CCTONzUAOXZMmyLBKfo4
	V8IEuTzQojMcsgsrhX6B6rDJccah13bfOgakGhPmqpb3oM/fogzob16RtTcv28fUOwMgAh
	LfJ+Lnw81mvU/WkHdwopqtB6V9gjLgA=
X-MC-Unique: I7YZqA81P6e09bUd0eAoeA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TT/bTL6Vx0RmcSyIdDdW0lSFT67aPCF/va7VY4xFHPT+2fI30MdBIzW+T54G7QaEFhVzpvZmRgmQLNSH+CnQuh1FxxLoLoAuVwYT5DDEED9ngjj642OPs/005zeF8h+/fFBL0AeZuUOFnszK5F/7QZbK42M+pG8iQpnCEu6H3cMdpwFPNDG45hlJaViBXk4qlYoKQfOvoRagxrqRYJH5Jl6rzYji5YhVis1J9CrESmP1juf98T5AIufMXYGnWvzNt+qcEAmqK8ox+ax0FpZGsfAWf+/c7MKnZhS5hDUQQ6nyoi0AOv1D3HnQEpm3jOBgkb45mF3VF/E2JlMUbOSjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pDejtzsEifzIy04C1ku0J2v8gAR4+ceFtzM7W/JNZU=;
 b=Vs3FwxauyNgRpBCHbmLWuQ93ue+QSV/j0inIbv9DjGphilUivhkmiXXt9+skdQgy+ctL+GSTkD7Udn+339ylbP+xMn1kMH/TJHdIj8Pjg25twyZjTjAY/ODEBO7nYOT+p9Lr7g5U94HvDlsjrZtjBqjty5owRwPXw1P6WZ/Bb01vdBEriBK4GrAj8/mH/ZMm6t2VABml980sW49fzUNVcU2hkCgO/4Xihi3uk4LsqsVgveVfX3NWYTuc05oDUhL+SRm9dIGEDCWGJI4UztMuarN/28MqkiXWXyobpCgmFwCCblZDLmGaUqS0/bx1VOK2A9LUfC1vNkaCE2fRTRAtqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
Date: Fri, 8 Apr 2022 09:16:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0332.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::11) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60aeb074-888a-46c6-3fe5-08da192fa457
X-MS-TrafficTypeDiagnostic: DB9PR04MB8187:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8187676A98825D373B6B66F9B3E99@DB9PR04MB8187.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jshlfy7pFnv4uh+P84j1H0/jDx5rojKB7P38YPTv34WtwaCzgQrPkK2LSdCMo1urQ9kUnvCRgr/Gxm3PA4+36FhYPIsB7UNWdw/ZQH1tg+s0/BycOkUmKu8mp/Dg2VTcCFb1RxC0F2qkbu23HgvqOqaP++UqNm2E+8fIDTYRlnEEu2GP4H8PHg9y0WiF5oAuRWaN1MvyOC3JPrbIarqzfhslv0qMNQ1LZXn4TA4vkD8aivVj4KZx2OdvRKmo/OmJdaKLUSykNVJlldtXx10kwhSD6bVIjIDbNXtXqb19cEYtV+xVz20ftTE4XT50VtlongWespp8JnI5aQkJDpQieZJgRU77oeXkTmq8fnTWVxMkhyw53P5jH6igUUnzSJRs38xF0JxkDrBRyvIKF02Li+dqyIuSCBXMzLXzyGzNiBlrBLwDv3JAnNKl5lAhEmsgtX7AeYZiSZojm5NEBMLzyivaFj3POhWzEnvlnNZipq210nhimHoJm0rbtzuu3zGCGD9hFQIJGTIkHwhOITi/iVIUyXbT+ghI75D85DOVctx6dH2FnQtsvV4OAmL8P3koLKBNlaaS5JZ8F1x66lreH/srnQor0apMIvyh4crCUmZ/KTX5JOyWqA2YECMyR+U+qDHOULv4gHhFCYM76BR/bXEi1v9EISKFgksIZ8ZODS7Y295iDrhlx7/sguyhPnCIU5ZydHrr5Sn9tnyEp1tyEI3rQa64nHIaL0JEsmIy6HyhcxX/Pi0gCPfFEjtoMRsw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(54906003)(83380400001)(107886003)(6506007)(6512007)(26005)(86362001)(31686004)(316002)(31696002)(2616005)(6916009)(8676002)(4326008)(8936002)(36756003)(6486002)(508600001)(66556008)(66946007)(38100700002)(5660300002)(2906002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFM1WDU4VXJLZmJwei9GWHBFeW1paVFTaFczZmE1UlN1bVlxN2NtTVdWUnRZ?=
 =?utf-8?B?cVJRV3dLbGV2VzlOVGlQUUxoQXF3Q1RLcVFQdmlYdW9IVUlKc3R4R1dCek1m?=
 =?utf-8?B?V01VQWg2NXpBZXpFWkVRVmVJeU5vTGJOeWZodnRKeE4vS1BaVVhUbnY3b0d4?=
 =?utf-8?B?U2Y4UlpYT0RBbERJbnJPYWx5OUZ3Z3JCMUhaNlFOYTEvWjlmWHdQU1RpeE9l?=
 =?utf-8?B?Wnl3VS96N084MFU4SFlxZXMvbEdCOEZRc0dFTHJEZms2V0g2NUhCOElQZ1RK?=
 =?utf-8?B?SldtcFJIZHpTR204Y2JnWFpUaHlpVEErSHNqWmRldUNvTDY1NFRlb2J3L3ht?=
 =?utf-8?B?M1VDU1I1b1VJQ3NNRkRPYWovcHRmQXFzRTU0L2QxK1hzZi9wYTliVEJjYnps?=
 =?utf-8?B?R0xpSDc5cVJKTUJwTVovOS9LSGdWb25jZ1BlS0ZXUm10eitNVFpUcDBkc0lz?=
 =?utf-8?B?bm5TczA5T0dlWkpsd0ppUXIrd1diL2hpRy9obC9COStsNko3Z2Z4TXFRbm1S?=
 =?utf-8?B?cXJlU1JHekh4cjFuVnNvS0ZwU0FjMlF5bDI2dllPNDRtd2FoTkNraitsRFpz?=
 =?utf-8?B?WGF2ZXYvWHovSElPeGtFcitFZUJtQXFDN3NyMUdIUmVjNGFSOTE0VGhXRi83?=
 =?utf-8?B?QklZTW12b3VpbGVzMHhTdEtvaUhySDZMUFhiU1lmVndyMUdPYjJodjJOTVJm?=
 =?utf-8?B?N2VhRkU4aXgvWXNjSEZJMUxRZlk0dUpVeUROZlJ2RE5RdzYwck1tK05LR2RS?=
 =?utf-8?B?NFhhUHJHdVhnS1hTZExsMldWV1FDYlZwdTNQZGFORjlyeGVBTURPVllnZm1C?=
 =?utf-8?B?azNBNnJKODVpeWZyTjlKbE4yb25zZmlmd2JtcmVtcWlid0oxdEhBdVdqU1h2?=
 =?utf-8?B?QVIxR2ZJUG9IRU55SHlTUE9xZlhTenBacVY0MGI0ZmszRHROVGF3ODh3SExC?=
 =?utf-8?B?cnRWbGxIVTg4TkhjdERNR29qSHNac1dEaC80RXVkdEJUY3dmQ1IxUk80MzFD?=
 =?utf-8?B?ZHFacnhQZngzc0dTbGpxUGVSK0V0VXA4K1laaStFKzVvcDB3RkhRSktGRlFM?=
 =?utf-8?B?VXhab0pvQ1E5dnRjOGI0bVpvaDV6NFNCeXJZcnROSlFHRytlSDJTK1I4MitK?=
 =?utf-8?B?cXdSTkw3TllaOTJRNEJJZk1RQ04vOVhHSEJvTjFlUWh0V3R2d2o3aDRVNGkw?=
 =?utf-8?B?MEJkM1JucU0wRy9IZTB6Njg4cHpYRkE4empLakM0TzdzeXVHM1pvSWxTeDJB?=
 =?utf-8?B?d2JrMDNKa0lHZUFSd3QzNW9QZTNIUWNLZ0VCYk5LTVBDNDRlSUR4OCs5QUFu?=
 =?utf-8?B?WFgrYXQraFlMb1NMdFhuRVB3ajIzVDlUendFaDA3TC9TTmJVSE12K0pDaTlo?=
 =?utf-8?B?Rlloc1V2K014ZVRoOVNMcHo3NnRqUDZmcDFTWW9IVkNiQ1lXRWt4MW9hSkxs?=
 =?utf-8?B?Vk04ckZrR2t4WldnSkFMVW1ZZVNYRjZ0ZEMwdVBZYzUyQVo0N3RzQys5M0ty?=
 =?utf-8?B?QlJrNks0R0ZDdjVqYjNuamlwOGVNZWlJV1l5ejJSWnVHTDJyelIyVGNGNEtV?=
 =?utf-8?B?WG9xdkNsUk16MVRuUzQxODJDZi9TSGpDbDFjSlZFNXRSdnEyZ1VJWWJuNjBl?=
 =?utf-8?B?cVU5K2FuR2dCU1FtOEMzRVhVUENmNmJsaWVraDdraVNpWCsvNzdjdHNlMzNw?=
 =?utf-8?B?cE9kM0w2bFdpUExvSkRIODI2SVdmemFBQzNxMEN3ZXRwZ3IwMkVDdmg0M3Br?=
 =?utf-8?B?OGFUVitsOXBuZGpzNVJIVUJCTXNSU2J3Nld3VDNOTndnL0svelJCVlYzRVlQ?=
 =?utf-8?B?alhmNFBjVGFnb2tzZkJSUERxZmxXMTYydVNXU3R1Y3crb3F5TEI0TjRkQ1FJ?=
 =?utf-8?B?K3BCL2JnOVBIQXByREo1MzFVbVUyWGhnZGRJcmNpTUxMa1RERmFlM2NHcS9N?=
 =?utf-8?B?cnEyRTRBWmY3Q2h0Vml1c01oY3RoQXhFYW0zSDBVSW9kYVgxUFpweFk1dHdm?=
 =?utf-8?B?QTVLVHRqVTNRbVd6MEZ3ZDhsVFNVeDdzV3J1ZXRaWHlLbU11ald3Ulk2Y0NK?=
 =?utf-8?B?dkg0YUVnLzNrVld0SzlBNk5TbWxuMngrTGFFMFJpTmphaEk0U3dzeC81Ykpq?=
 =?utf-8?B?TGI3SmdsUkdwb0tzeHN5SDNTVmhRUk9YeGViZVpJL0QrQ09MS1B1V3pHQXIy?=
 =?utf-8?B?ekVKdXU0UzhYNHNkOGNUazdaN1licy9TeTN5UDNIOEhNUEE4RHRlbW1sVmNM?=
 =?utf-8?B?cDI5a3R4L3FjVy9nYythblpOZGtxZWozR0FqY0luKy9tWXEwYktsRGdTVTNH?=
 =?utf-8?B?TmtIbEZ6dzZNYUFRVS80NHdkOFZkc0lra2dFcEI0OGJGSzJER3BxZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60aeb074-888a-46c6-3fe5-08da192fa457
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 07:16:03.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAEZ4lo3siy2TgrfbgK3mDz2rMBOZ2ZRt5qMWUqmHeSsUYQQwoYGO+INixZ1kRFbZVjT9Y9jGurQxUDNUIK4Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8187

See the code comment. The higher the rate of vCPU-s migrating across
pCPU-s, the less useful this attempted optimization actually is. With
credit2 the migration rate looks to be unduly high even on mostly idle
systems, and hence on large systems lock contention here isn't very
difficult to observe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
     unsigned int port;
     struct evtchn *chn;
 
+    /*
+     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
+     * vCPU-s they're to be delivered to run on. In order to limit lock
+     * contention, check for an empty list prior to acquiring the lock. In the
+     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
+     * until the vCPU is migrated (again) to another pCPU.
+     */
+    if ( !v->pirq_evtchn_head )
+        return;
+
     spin_lock(&d->event_lock);
     for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
     {


