Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4392154B540
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 18:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349200.575391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o190r-0007Zf-Ox; Tue, 14 Jun 2022 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349200.575391; Tue, 14 Jun 2022 16:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o190r-0007X8-Kj; Tue, 14 Jun 2022 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 349200;
 Tue, 14 Jun 2022 16:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o190p-0007Wj-VD
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:03:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866b0389-ebfb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 18:03:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8719.eurprd04.prod.outlook.com (2603:10a6:102:21e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Tue, 14 Jun
 2022 16:03:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 16:03:24 +0000
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
X-Inumbo-ID: 866b0389-ebfb-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghBbnOwMRoqmZ2/u3lCezeFZXbFiQ9iuUJZWfnOe/7VEOD3VAOA62xjY9HboHmgUpdXqRIIrNPvOPCv7zXNKrlefM8Wp3O+X7KINrqpO7IWvtoxZ37PWpWaGhkHWXjUkmXLo7cSNtWEnBo+1s1wbggAC9xmjZ45D804n3v/9Cs+B3bsMSlorM+PENbxrKQClccjPly/qMZfLGP0H4942OgQ1LDmo+QFm6g2WJAvNryF9ktXn+nQsMsovkfnZmIQLZrGwUGErEoiSt+6C7gIafy3COQvmXchjvoggNn7NsdnEee8k4Z+K05Kly0mFbONzj9k0WQRm+kiNZFu6XATnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNT607gGynGLKSl3fNju64xy8DuM0t2mTHdyyuRaUGk=;
 b=n1lR0BG03u6Lzm6BeVJlvhsiJmVfyQ+2viPqldo1xiPpnfIivuV/cFpCJaMlCCQBALkIHUMAMFhQBH9EzJTZdTqGqGsbC7ECFIkbyVaQ8K2w8n2UzIPXmewCN/XHezSf+sQWzX73k3Yolr+pKX3ylefmGXUDNnKuD+s3KulpgzP1P7TSfXmYz8Xhner7TBtYHP9zmWJRsGMgLR32Zmih6NoNHjDTk2Etxgxmtx/Rin7TBL9zAlMX/Bx20d8/Ww+xTH5UTsPikvJG+XFzuTVAgNWdmlgXzmRnJtnmH4FiU8XSLEnnTeC+4VQNAgq0SeqtMlBQKYU1KzuITeHoUj1fFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNT607gGynGLKSl3fNju64xy8DuM0t2mTHdyyuRaUGk=;
 b=JhQTMw9YM2HJbJkZ/8W7W1pPq70wVfXwhZFsllV2an2JnYNZLILDh/b11bxIx5C5n4MZYbRpJwRzExmWbNQbLTJQ9QXSs7lRzvYkPoEclrHnTk6QDF4YHG56+qbJuJ0nOg9uQCAeTWIA3Fx3IFJAwIqZJC/jBZXe6B0Mj+t1+dwXVFavmuQ6Vv+wnFrHytF75ujIMLD/BVX/psROydHf34X0wM++aATzi75KuMK/PDxTgKlPovupYMm+3pnxC78ysDgwISnxxZuXESiawNKnRlcBZ+LsG369/nGTSINmAbuac+KxYQBRolx5j/VkIr22HD+7XxQQooMOwD5ao8mXMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce7d7acf-9ed2-9dcc-34ad-f9b1e3f77d4f@suse.com>
Date: Tue, 14 Jun 2022 18:03:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: improve failure location identification for FMA
 sub-test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0008.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c616f06d-2b40-4073-6076-08da4e1f6955
X-MS-TrafficTypeDiagnostic: PAXPR04MB8719:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB871942F71A02276732E3E13CB3AA9@PAXPR04MB8719.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+/W7rpxYNqr4Py5AR5/rgNBR2FQiVrMOeKUP1YDFG2ttSsAjtuBISn6ZFmRon2fopKd1huB99gmujferyWZjGrUpNH05EEe23ccEM6trMMjGxJ49PxZgCvgJQls+eo3cLQMI0ABMm+ypOQs9QSwntBo5tdy6FBLzGufb3JsHyItAP4A0yaDuFkUokGTdxrcamv/aJjt6qb2IFuII36qSk3V4nLog7kOvpWxkjYCEehTMhPXSRsKnIXtQnYu8J3q6I0NjbFekmVBzQ+fP5N4/wSEtXXlRIM8FaCAzu5sXLYGI/mt7BWQnTtaepVqNbFk6gGm7fLgeJ9U1UQiCyfI2NsqBoWW7Q++DgqUHMkFjemq8KBMEGghc/IJT2SY7YkUWuc5h4dox8V802GNhnvHQz1+4bI5a1rYamnHmUQE4fQn/rdMaepSiAgcqRRyeij1Ka2rqcWQcrbndADb8sfW7zRI/qu88jdQ7qXMYc1PoUKcbAgFPqioF/Er2S8VlIv2FytRweIraWZS3pVWLsKEpnhZNtE1IqQdpI5NwYJ3QD13JJnhD+swhpdY2s1leQ8323NIxAbPnQkfmsWcHt+xfFq8vl2yxfEDs7g+BuWWXUhMSUiCevnAQsBmZbNiBbLz2NT2wla+fqDIsFE5ZFmUSu5nc1U+BNRVThit+YGsyWenWh9eZjtr2ep3Bl95hDqiTR8KWrv7U4mUOBlxuoO+VytS0K9I1S8H+FYaLoEv1K0ZWbyXu618wjChoMkHpGm9t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6506007)(31696002)(86362001)(508600001)(38100700002)(83380400001)(6512007)(2906002)(6486002)(26005)(8936002)(5660300002)(4744005)(186003)(8676002)(6916009)(31686004)(36756003)(2616005)(54906003)(316002)(66476007)(4326008)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnlnQkFhRy95cERSc3QzM1lVajk5Y3dJZTY2MW9relVWL3RZWWVCdjU4cG9L?=
 =?utf-8?B?aEdvcUNzZE1aRkptSnd0VlJIU3VLWFE1UXh2S3YvT0t5R0VtSVpCK0xwcTQr?=
 =?utf-8?B?a2RQcFp5ZHhvYjdHU2s4SkQwK3ZVTHlQUHpJNm9qNHprNUszdUhDZnk3M1Rw?=
 =?utf-8?B?Rnh6RTQ2WHQ2N0ZGR2JqWEdWbjY4ZVViZ2hPWjBNTzlVdTIxRDMyZDVjMHhU?=
 =?utf-8?B?U2g4cHd1alBmbzBrRVNNUGYvZ1I4RGliWEhTVUt5bXhWMFBlbGZ0R2oxbkFz?=
 =?utf-8?B?clErYXZHbnpsYVc5V3d4MERYSHZZS1ZsaFRRejNCYWRheXlhS2xYYlB0WExq?=
 =?utf-8?B?RUVTR3BoY3pNNDVBNHJZRzBCMEFpUUQ4K3JmdkRuamJhRHJzYUNBL0NHeko0?=
 =?utf-8?B?UytWZmZXUGdleEF2RnlBamNiMFh1WEJnaVROMEtCZEVaQ3lQSmhtRTB5bWZG?=
 =?utf-8?B?UFptNUJCT3UxOWZLaWx0SG1QMFhrb1paWktVVUdVM2VuZ1ZmMHF3L1U1Wlcw?=
 =?utf-8?B?ZDV4R3U0aUR5Nk5Sdk1vQVRMNjJmMHAxV1dxdFQ3WDhNLzhuZWJKVFRCS1o2?=
 =?utf-8?B?WG9mdzdSOG9GaFJwKzNYUzYydGlxbG5oZWEwcXlyS1FrNkx2Tkt5ODdvUXR2?=
 =?utf-8?B?VEE4cDdrQWU3SDlXSkRyY2ZEVHZrWVRMVmtlZDBhclhqZTNza0Rha29ZQStP?=
 =?utf-8?B?bW5Ubms2N0EzaWRoT0JSakJ2c1dMQVNab0VyRTBib0IybUNpenVlNlVyczBu?=
 =?utf-8?B?YWYwRGs5WnkvcTlyTjV6TDh3d1dVZXRLUkdpaDJxRFdpSG5HWitoSFpFNUFT?=
 =?utf-8?B?dmtZeW5XN050LzUvWUNYOTQzN3lVeEhnTHJzTVc1VlcvY0JzZ1dFRWtPc1Fr?=
 =?utf-8?B?c3BmN04zeHlEZnJzMjMvck9vTW1zNkN3RHNES0NQeWFPZVVVMjhUN3Q5cTB5?=
 =?utf-8?B?VFovdjJHTnlRTytCbFU3c2xzRENjSUJrb0hKMlNOOFl4bUNTZlJJQVZFMFBo?=
 =?utf-8?B?b05VdDc4bVFURGp3ZmNQNFBuMGJQd2RnN0lkdFNOanZSTHFoSzR6aHMra0ZZ?=
 =?utf-8?B?MllobGw4eVVpNXVteWVwYzJNZHptNk42WlhVWG4yTnFzdVJqTSs0ZmxYejJ2?=
 =?utf-8?B?RDJrT3pnN2JnUUxVQzhpNDMxc0NzWm9ETFV2M3ZBYitNUlJBcFBrMGZPNmgx?=
 =?utf-8?B?OHFsczUya3RueTdMWDYzMlNmYWxxL0xZdUd2Q0pVR0hwNW15N0NKNG5rMWRk?=
 =?utf-8?B?aTB3ZDFXemI4cW8zUWFSN0Z6eVJ5SFZ2QXJvaTkvK0tLZlRnWUMvc05JS1M0?=
 =?utf-8?B?K2ZPQjBBbUVIbmlNdEdtY3RENTZQWlA3K3NQM0tZY0JhcmYrcGpnaXNTN1ZQ?=
 =?utf-8?B?YnRpaWVWcGR5d3drTm1GSDZabXEvVFZDaW1xSDE2RFZ3Q1M4RUtnNDB2YXFE?=
 =?utf-8?B?aHcwSWEydnliWldrQnlhRllEc3ZRd2dKWDJ6b3oyWFVtVGVERS9wdW5MMmdl?=
 =?utf-8?B?d1F5ZzNSSVFYTUJuVTRxaGo4NG5ScVREeGlzeUpsVGE3QzdkTE5IZEhoTllC?=
 =?utf-8?B?UXkxOHNmSkZaVXh3ZC9nbERMZmFjZVFjNlBHc1RKTXRnVE5CMTZmeWxoNStE?=
 =?utf-8?B?WG0rSzN3NlM3ZDlpUXVBakVBTS9DTjJESHVnWElDOFFrNFplbEREL0xvTTFU?=
 =?utf-8?B?TDZhSE5yZU1YRHhvSVdBYXF2RkVzbzRYSnNGdmNSRTcrSXh1UHVnR01VTmJo?=
 =?utf-8?B?bW9RaFRwMmF2Rk9ZYmhIOFo3WmJHQzJjUzBnc2lSTEt2a0V1ZGlYYWd3OEV6?=
 =?utf-8?B?MUwwaisxS0J6aHlnWkRqWkhIM0NQN1EzU1RlZFBkTURQZldnYjE4SDVzZzQx?=
 =?utf-8?B?R2ozOGdubnZmbXlZZWZUYWYrOVF1eENJTHFGSSs2eTZDRnE5UUNVUlU4SUJO?=
 =?utf-8?B?M01XVlpiTDRmWUhqTFZKYVNON1BqaVN6bWpQQW1iZFQzTGJlQk9rL0U0M25N?=
 =?utf-8?B?bTNEblB3SlluMGlZL3JHNXVUbndGeXE0TnBMOWNRRmtkSkZCV1l3REdUWkM1?=
 =?utf-8?B?WjAyRjNmekc5ZC9XcWRPNlpqcTBpR2lGOHVOV3I2MStFTXhFTlZJZE5wQk1a?=
 =?utf-8?B?RmNEdjdRZVk5MnRvdXJ4dUl6WXRxZUxRU1JMeWRXRlgrZG12S0RZSkNBc1lt?=
 =?utf-8?B?d0pZYUJQdUEwTG5FR0pBVUJ4aHlEc2I2UlpGTkczWDlHS0tPQUpsTlBEanQx?=
 =?utf-8?B?TERPRmptUmxvNmFJd2xnc1JXYVpOMkJTYVhNc0JGaDBMVDF4cHYyYTdIVnNt?=
 =?utf-8?B?UUxUMWVEVWpGWHNRaHl0cnlEMmFaR0JvOERTUzBlRGtRb3ZjbWwyUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c616f06d-2b40-4073-6076-08da4e1f6955
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 16:03:24.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmGM7UZfmHtfPJCs1P+XczIPjHnPa/s/EyYH0pjluFdzoT+AtZz1WJ5Ln3QLqy8zA7zVqry721E7o0L8+wR/rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8719

When some FMA set of insns is included in the base instruction set (XOP,
AVX512F, and AVX512-FP16 at present), simd_test() simply invokes
fma_test(), negating its return value. In case of a failure this would
yield a value close to 4G, which doesn't lend itself to easy
identification of the failing test case. Recognize the case in
simd_check_regs() and emit alternative output identifying FMA.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -259,7 +259,10 @@ static bool simd_check_regs(const struct
 {
     if ( !regs->eax )
         return true;
-    printf("[line %u] ", (unsigned int)regs->eax);
+    if ( (int)regs->eax > 0 )
+        printf("[line %u] ", (unsigned int)regs->eax);
+    else
+        printf("[FMA line %u] ", (unsigned int)-regs->eax);
     return false;
 }
 

