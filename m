Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4806F3E52
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528362.821397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkHI-0000O3-Al; Tue, 02 May 2023 07:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528362.821397; Tue, 02 May 2023 07:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkHI-0000LD-7h; Tue, 02 May 2023 07:18:24 +0000
Received: by outflank-mailman (input) for mailman id 528362;
 Tue, 02 May 2023 07:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptkHG-0000L7-Kt
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:18:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83772843-e8b9-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 09:18:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10072.eurprd04.prod.outlook.com (2603:10a6:150:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:17:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:17:50 +0000
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
X-Inumbo-ID: 83772843-e8b9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoFzm8fmaDDVP9+IUvOGemPkdB0WBIVdceOi1jg63jmurBJRS04BupVc9AnPlF0k7IOrdk9j3JdpkBJbWj5C1uHAll/U9oM1XeQZRffloDcTgi4G5xjwMS52rVTsh4sXjUuRG0QwPY8RyryfzEh3SpEE04661mrXliVtiJeVjLmQtlDb+DuHPDQ54L5D0EumU7hR8/y9Nzcse/7BoOudtCIofcZFkQ3MCWHMKAuy4fdGqA0TwymtsLSZGXm5ZvhlaoeQrLlfIcvshhMXNkFQCoheZCJfkZVTrHTM46TNhAPTh0aCC6VSExLEpeIrjqfSzvyWWhx9PrsgLdXRVtVhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJOXKJhqj0dCvMwJodrI7VMwHJWDODfDJZHptDaJKnA=;
 b=cQwgf+HFCB71gNmwOwTc32kr0vD6apx8wsnQTFmfgPtLakoBpY2J0FP4Ip/tYNUogGDADU13g+Z444CsvAKMzvkpewNFKcFicZmZL0ls0SzptRX5ZGWq+SPOUW5IfQ0GkhjG4TXsWRKcB4d2bgp7XU6QqeYvRlfWPITreZUa7jRpY5CnCN0DR7vUvhlFK7upre5Kt+GHD0uicR1/RjcOlbYpC9CHDCPzpJHaOlz6Jm66aiF9VGr8e/yNwboHwVXMI8MbVjZ9fEzWaK6IrjyO6hgD6QEmYp62v/LXfePtd5MHQHoMX+j/fY4JDCm589ADJWKe8OHEr3jRRh5dpRoL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJOXKJhqj0dCvMwJodrI7VMwHJWDODfDJZHptDaJKnA=;
 b=TW+ANcAzg1QYKZs6gvuJXde2Srh2KXjRR9MPzOGydwGa7xnTfwBkFh1ADlUqI5rX7Cwv0cwvxpGmLodyLCiOHjtZkX0Rsasop8LBoVS9dmE6yzyYx0zuNs3vk1/NLz5rbtEplqbN9Iap2TEUY+5pgQaORnsWDDnwMemibyD+57Y/En/m4v7U3W8S0ikKe7IXGmf2GlnES3nSJVmCO4fDU/5n/0rvlCrGn8ZBXDDvQyvsxbFRVerteekE68uwmgCMZN1j2xhXgbnTI62wtY8tlaf5IZCv/CVz2OodLHGEBR8/1RXXvHieVojeA207U3MDTWm38Qay6g55Wu/WW85FvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
Date: Tue, 2 May 2023 09:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d484f16-dd8e-4ca2-bcba-08db4add5695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gs8EetnGNi98b48zVs7nSu+d8jNxf6h2QCcIQP9R1XuLAEXeOdiKW2OlfU6wEooRH4BtM9nFAPd1+Cao56kilEg3dAz4r1llEvmGPks1To55o2672TUVjvrFoCZbIuujkunYdENBxNC4XSB+WFdnERbWW0UPKe5xfFWUpP6wsUFy4efM+NU3pTw+dSRk9z3tkkX3G998+8EIM9JdByc42jarY9OTTFVbkDxgONSyAkZglnRte1BduYF67y1JCrcZDzrVaMOyzxenSOareoz4z1cgzXMn0xf98rUv1yogGEN0F6KZGaAJf7GEevnAFcP4IP19EzNcYGINhrULsk4xG5CY1C8m8Ccgyv6lgfdSpP8AABEorOAAqtxIWij9VS39Pjw/7gy9zidzevFEdGZCHw+2KT9Dop6hrh2+qkSiphQhzXRWVB4/o4xSyx0Cwqm6iz+oiGEaGtXufuhukh1vEZL92Lh4aCsPDfRtHob+DZ2WUxPtJ4StbnkPtuO/Fjg3SR1GSfYQZwtEwJwfq/GUGUCD31rTSgoM+5tTVAJPsT64u3r/ni8oU1ldh1Lw6uPd3lhQi2EnbjgQWQm4g/Ny2W/mY5SPg3GAEa9YdXL9HiUPXL7bMB2CLwZtsS2TKheQ90IzzkCRwSD8dZXZ9O4IHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(31686004)(86362001)(4326008)(6916009)(66476007)(66556008)(66946007)(6506007)(6512007)(41300700001)(36756003)(8676002)(8936002)(5660300002)(6486002)(316002)(2906002)(31696002)(54906003)(478600001)(38100700002)(26005)(186003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtvcmF2ZHozUjRtK3BWRkJVY1FoSXpBNzZCSWJRc3NMZzk2dlhQa3QvNHRF?=
 =?utf-8?B?Y2hMdHl6L1YwVWdvWWR0SzJkc0NxMnk3c3oydmZxK1pFNVZwTG1Vb1B3Zk9j?=
 =?utf-8?B?R3RSWHdDQ2sxNzY1dUkwT0NmZlExdW96ZlVyRSs4aUdRWUxzNlZ4VC8xYm01?=
 =?utf-8?B?MU56Z0EvZkFDSVUrTTdIcndVM0RFRjgzWG9QQVBRUWNNT3ltWHpkQWhMQW1N?=
 =?utf-8?B?eVZBUldpZFErd2xjQnpwUXFzR2pucEhOU1hvKzNORVFLREZPR2h4MGYyZlR0?=
 =?utf-8?B?NERZSWU2MmFoWjRjdVQ0dkVPVytiazRRT203YUJaR1NIK21DcHRUZFoxL0pM?=
 =?utf-8?B?cHdDS00zUkUwdlhKakZDdUlGNVhMWHBMTzRORk1rSUhvS1h0S3FBeWxqdXdM?=
 =?utf-8?B?VlpNVndUNW1lcFA5ZTVZQUI1ZkZ4aEFvbytOMy9DZXBoSFZ1dmxQdnhrVjdU?=
 =?utf-8?B?VG9tUVNSVDQvYVJvQk90MkpUOU9DblpwNTF0YnprVU5vdFJPdG9EcWhHVWRD?=
 =?utf-8?B?OUE3WGc1VndGMHp4a3d1VE5ldWZGV1RCTStrbGtrai9YYlZKRUlzTWEweGxX?=
 =?utf-8?B?TmpDcmZDempqSFNWem5uN080eWlNRDVHRnNCVlFvaWpzVXVhckNlVGsyaE4r?=
 =?utf-8?B?QVl6VXQ5S0VDeVlsWi9rT1NhY2Q0NVorVUtXdnZFajBRL2ZacXQ2UHZjbXdS?=
 =?utf-8?B?N2s0Wm5ubjlJM0NkV2xYU2xiNWJpeDZBMTdxTTg2WWxya2dJRGQzMmVhc296?=
 =?utf-8?B?aGp3NG1wMktjTERGR2VPOGUrNzRESlRTaFpIbkZUOHZsaXBHOTlLaEgrMzRF?=
 =?utf-8?B?RFpIY1lwRDhVNU4zUFMxWXcwZ084OElRYXFoam1Tb1FZdk9JRThoZlUxNEZ2?=
 =?utf-8?B?V0xnTVBDdTQzWEczbDBwcFpXMHVuUk1HYk1XRDJCenhmUjYyS0pEaTEwNEgr?=
 =?utf-8?B?eTBZTWFjRmVpS2hxNTh1RVM5QWh3QmczSE9KS1l1emViTTluVTVINXlsKzU1?=
 =?utf-8?B?YWlFcXhTTkllQXpNT3BDd2p5VjV0Umk2a0NtRW5oellnV3k1NXJwT3JKM2I3?=
 =?utf-8?B?QXhKZkVpYU1XOHRjSG9oRWFEZnNnb0M4ZE41dzZEN1RhRGZjalUxZVhHYmJ1?=
 =?utf-8?B?UDVrYlVSRUhPMWNjTXhVcTl4ZE16dEdMZGNTRzdjUVpnemQ4TDRwMnhsNXh2?=
 =?utf-8?B?OHVzeEJYR0htWEQzK01JWkw3d2dMZ0VoSXV2cFJDdUZ3ZDdCMGVkemxEaWlN?=
 =?utf-8?B?dzQ1eUJRallKdXZETFFralJIYjF1SlpGcjRaaVpqVVNBNzFGcWlBbklpaGQ5?=
 =?utf-8?B?WFZTQlRSSC92ekxHZXJWcWw4bDlHbkdiVTJzSFJLQXBVSGlBc0VkYkhmZXFy?=
 =?utf-8?B?Y2FBSFRqeXlMWnVMMVNqYXkrNXRkQUltY1NxN0xmRWNhYktWMUNKc2JYMkw5?=
 =?utf-8?B?ejdjN21idWpCNGM1ZnpRbVQ4eWE4KzE5bUVBZGFCd001WkZPR2RNaTFyN2sy?=
 =?utf-8?B?bkUvQk1YUmZVWVExMzZQN2tJc29aSFgwVmcwNWNCaVhwL1AxaGQwaHhPOHZ3?=
 =?utf-8?B?S2VJTk4zeUVzbDBRYjdZYi9ZdEpWWndnQnJRSktwN3NWMWkwV3kwcFVlOUpR?=
 =?utf-8?B?NUpjbEJDaHIwSTN2MzdaK0FCbHhSRnhRVG14elhGVnMrNDBvOFpDVXhoaWRQ?=
 =?utf-8?B?eUlCbDBnREdVa0F4NjR3NGhVQUdaaEkyK0N5djgwUGNWVzFpc1pISkRObVE5?=
 =?utf-8?B?c3lsVEQ4TFlVWEdNeTlnbUs2V2cvWEx2ZklBODMrVkdYVUwwUTYrOEQyeGEy?=
 =?utf-8?B?aVVoMTc4dzdhVDhrWk1PcmxoNW11dHllTEVNTDhoaXpOM04vTUN5WGh5d3gx?=
 =?utf-8?B?RmVCM3ZFUWtqcTVIWEZ2Y3RYaUFjZTNnVklPdzB1K3RlMUYybWQzd1dqbldi?=
 =?utf-8?B?TmN0bGg0WEx6aXhVQkYzOVNKM05OaXdGam9IVXhrcHZtM3FsUmVhRG91U3cr?=
 =?utf-8?B?UTZCYU5RVHU2Umx4Q0dSR1FoMU9EcC9IZ3BuVlJDTktWWmZkYTlSOFZXcU93?=
 =?utf-8?B?a25HbGFnSjlGeG1RTzc5VzhoUnJLUWRSOWF6VitOT0hBL1Y4NTJtMnhZcFBo?=
 =?utf-8?Q?9GgplJLyUkuB5NtN4Ozeny0zz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d484f16-dd8e-4ca2-bcba-08db4add5695
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:17:50.5780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xawX4/7HxFajo9aw1K0PWV8Bey8UTunv4MBbFItVn+IBfu3Dr6PMuJz9uXjRh0DB+HboQ/qxXDU6zZi8nYG3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10072

Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
cause the operation to fail, in the loop here it ought to merely
determine whether information for the domain at hand may be reported
back. Therefore if on the last iteration the hook results in denial,
this should not affect the sub-op's return value.

Fixes: d046f361dc93 ("Xen Security Modules: XSM")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The hook being able to deny access to data for certain domains means
that no caller can assume to have a system-wide picture when holding the
results.

Wouldn't it make sense to permit the function to merely "count" domains?
While racy in general (including in its present, "normal" mode of
operation), within a tool stack this could be used as long as creation
of new domains is suppressed between obtaining the count and then using
it.

In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.

--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -89,8 +89,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xe
             if ( num_domains == op->u.getdomaininfolist.max_domains )
                 break;
 
-            ret = xsm_getdomaininfo(XSM_HOOK, d);
-            if ( ret )
+            if ( xsm_getdomaininfo(XSM_HOOK, d) )
                 continue;
 
             getdomaininfo(d, &info);

