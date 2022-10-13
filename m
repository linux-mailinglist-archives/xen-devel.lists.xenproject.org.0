Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20925FD529
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 08:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421703.667262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ois15-0000DT-9T; Thu, 13 Oct 2022 06:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421703.667262; Thu, 13 Oct 2022 06:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ois15-0000AJ-65; Thu, 13 Oct 2022 06:48:27 +0000
Received: by outflank-mailman (input) for mailman id 421703;
 Thu, 13 Oct 2022 06:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ois14-0000AC-C5
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 06:48:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08bc8902-4ac3-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 08:48:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 06:48:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 06:48:22 +0000
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
X-Inumbo-ID: 08bc8902-4ac3-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0odZEpW7nICs6RHpA5TnVUOW7lsciLXjdoHAe8BveNll9FhU7mfUf9H5qBGqA6P+xS5rRTUK8U6AK5qS1AHw4yH92MLfLqMRsRwJC+6SqCrj9+4ViwN6/RZtYrCgSkxRXy/itAR5Dq5DmYoMnUcaoXjli4Q7W7+vnWWZ3mrCeq8qTfa4wTfq369IW/7r2HhJAtMBaGFNn2YQUDFiEvj4vHfwiO5MZc5aOfVEDwJAUZxOS48zR+eQ8qfu03FYwM5kp7AIWK1aa0aE4X2EVkFExoEPuZrOuJOg7OsKbVB2JxRLk+2F/pii4Qp1/L0BQMtwsLXeIq82XEl8u2qo29K4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezaXX3tuWYuuKtIIcFyc3PbRfsPfDcPpzv/X2sTSW/8=;
 b=hapT/jNhLdaUYxXO8uuUL2mK3QagCzll0yQQtt8TnZmma6AzjrMUUGs/crl3bMYKZI7lmH4mv2JjlkFN7a3PPxP2M2xP3z7/Mh9/DXuNWIg2I1dkT0ljy55PdnpOTU4qiqLwSsLNxf1hEMdq2ZirvioHw+0fR8cJdPTHx9fa/z3Vd/gDEx5GwRRDIYrMIz737N28fVTOCU9B229WDxiQumWjeBNZomu9Nq44fODlD1Uo0C1FtC6lhtSGYf0uj9yWDjSEeNJQ157LO8lFRoYxH9nZeiG+nKWpmw2a+TUG3D44B00hRfc+QY9TYUtJh1UFCCSAos0/mlkqtAeEwdq3Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezaXX3tuWYuuKtIIcFyc3PbRfsPfDcPpzv/X2sTSW/8=;
 b=B3YQz2RT+GgKqR1TF2b8zKEMImE71apxzWjXQdRrbJf14RJfRbf+vDrspFoHTHFfZO36vETy6Jiblzs+7Eo8SANgawjW91NyyY1TiLoRU7dKw0GDmh9EEMslM5A2JSNf1xIgE4SrB4whLVWoprnqPtU22LbdCxvFYtoDdxnCaWk60UOmEJI2mUSf8LkO7IM05izEI+ij3CrwGp7XRGFRJOySPnZAlSZlPEUqYJ/Z7cykH7RqV+IQvIQ0arQpFtLrOBGDS+k3whyGUSi02A7K4EjGVvOQTzMdu8Ggfm5rnpfN3/wXjimD5ug90b15QFG64R2DLE9G95lDJm5+Dtx/7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c80390e6-b9c2-e15a-b513-ec97e8329ad8@suse.com>
Date: Thu, 13 Oct 2022 08:48:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.17?] x86: also zap secondary time area handles during soft
 reset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 17470313-8151-4fa4-d87c-08daace6ebea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QjzX8NnY0KGVfUGLWL50pX/Ksc+2RZCbMqxyiVHFp2TMlabl27Ki5mfg1OhdG/XV1Tw8ZHgTojDy9Mo5JXKAvghDa8oeXFXMiiRcHr2PPNVOPOkQ1DI7w4UPMt4pAMDvD+US2xgoRpgMXrVqsR9x2wkP7ej/JV88V8oThhP+B3qWe8ZVQuZWCzsomFl5UZeVR6V0LEQrI9i2o66J+SlZQ7tQJWRmdfCGmAQJYJfgxj9DpOn4btzSep6sfChMyVsvrzsit7DIdsJuCuhvX0xPRQf3lOWhges5QtT9cEnDClu357oxO5KXiNpXyTs8bSLdw67n/dvLjn7hlQPvpvh8Y3sTxOVLbrDA+d67gX5em2kqnXBahOPF+PzvDMjHsRcm8bLwnTqzkBAvKewGKxqKAm02lgnmz+uxry2A8n/zigvEMZVVPcEWQ7VT6U140ak2Ds64MH2izSVMPTmyA2QX3OsDYBcM23AAZHkvlF6GN1YlFkCpd2g3F8CPg8RiK6BQITyeM75eQ0C+pvI6yIP4zlZJF7+/8qrT6yT9rZMp9+nr6jjwbkQCMKMKKEPBDSnt8GPc9Vdn/AwQrwMBRK55/J8Eby2oGUCYwVA0tEDSjdhE0aCywE1LlsFhD6o04d/4mLPR36U+oweuMAoaYFvnsFvkRecel3R9fL/UP1r2LpiZpT4IaEKtWYklAmLQRvDO1jKJgyDMvZ+IaHqWU8MiCJ5kkT1A9kGO8lXvHzzzXxRimygHga0tiDPfvC99Lt+/1VkklrQNsdwiFBzX20RC353EnmivThugeFUU5j65SP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(478600001)(6506007)(36756003)(6486002)(31696002)(86362001)(38100700002)(2616005)(6512007)(186003)(4326008)(2906002)(41300700001)(8676002)(316002)(31686004)(54906003)(26005)(66946007)(5660300002)(6916009)(8936002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0E0SnI5NGZtUWUrdjZKZStkRy9lWGR5d3FjamhyYTR6bWZ3TmVPbEhXTlhh?=
 =?utf-8?B?TWEza2J1L1lKVnI5NzVXZTdhYUFqdnU5enh2T01FN1c0K3NiYnR2aUZMNW9n?=
 =?utf-8?B?bGNiSmFVMTNKOGUyRWVnL0w1ekpUUUdYa2xYVk0wdGNrdzQya05yU2ZzWVFZ?=
 =?utf-8?B?UmZIVEQ0ZzI4VGFjc0xUMTJnSyt0bjQzMVN6YjRaNGxzb0ZtaW90dzlGMy84?=
 =?utf-8?B?bDAxV3FmMGtwUSswQnFNYjRhcFV2bHFtUE5wODVqYWlBKzhLRXRXQ1BVS1VJ?=
 =?utf-8?B?RWN3ejdUN21mNjZjTEtRMzlaR1JqTEo1UHc5S2ZlWENxb0tUMWgvNmJZbnEx?=
 =?utf-8?B?S3BNL25QUnhrQ2NzeVpZWFNhUDhFL21CbHJqbUxIbTM1NVJXZU5NWTdKKzBD?=
 =?utf-8?B?bE1xeHRUalMva0Q3WnpYaXpOdnRKTE4wTlcvaEliN0VjOHFOb3pMWG9laEhN?=
 =?utf-8?B?SnJWV01zZUFCUGxoeWdpc1N0ck9LV2hsMEg3T2VHUGVnaVEyaXRneEYvbmQ5?=
 =?utf-8?B?ZEREL2lLY0RSaW4xT1dHVjliYVh1Nm11V1lNQ09qdXE4em9zWjVFTjRjSVRL?=
 =?utf-8?B?VGFObTRFNlQwZndwek52ZTlORDBEdndGQkRJQ1VsdWwvQ2FBaUVrNE1hVTdR?=
 =?utf-8?B?U3EwQTVibWhHbUxEekJpNlhrMzhoT3hXY2hrdTNxeWFpNDhlL216RHRLTkdN?=
 =?utf-8?B?SXc0cHJEeTQ3YzVvNFoyYytZKzU2Z1JHNUpjNEcramI1OGxWbGZTUW5PMTJW?=
 =?utf-8?B?RkxROGFhS2Zoc1p2SCtiaC9rajZrQWJYaW0wNjFPU3ZlWXEySE5OcmdmMFlV?=
 =?utf-8?B?TnVHUXNIVkxMVGpsUnpzbDUyZERWSEpmZVMzdlpxS25PK2ZBMi9rSjFuaGt3?=
 =?utf-8?B?OW1Qb2hhQTc0QTlQTE83ak5QQjI5L0JGOTdQMzE2eW5RVzF6NUoxVmZBMUhJ?=
 =?utf-8?B?QlRUMjlaRVUwdWlvUy94ZXovMTRKemFla0RVS1g5aFY1T09DMTJSdkQzUk9o?=
 =?utf-8?B?WncwVXRqeWVGem54T29sMjlucEQwTkpEL051WGs5cEh3MDh5UEJCTjRGZUZM?=
 =?utf-8?B?ZHBiaTc1N2gydk9vVjRubjBYdVlZM3pnQUNxQTYrcXpNamRpS3dmalhaY0lT?=
 =?utf-8?B?azc2bDI5RkxkeGVlOGwzRnMrQ29IdDVkUG9YOVFpaENCQjZLWW9HVU53U3ky?=
 =?utf-8?B?dGxwakRjN3pwaFBoMDIxK1VvTFhkWVhIbVMxR2M1L2M3djVrUEhwYjh4Skxi?=
 =?utf-8?B?c3ZRWWpZQ1JJT1B4a1RhbjU2elUyODMzYjB4SGh4aWZMVlRkWkxOT0kyc254?=
 =?utf-8?B?OEVkOGQ0QnhaczFEZG5Pdy9EQnFIM3A3M1FiRmNLWmZZVERWUFJFYkFFaGRB?=
 =?utf-8?B?Z2M0OWRiMzNkWk5ZY1o1c0FiT29vanZNdURqYVFuVHBYaG5JQmtDc2ZJMWVC?=
 =?utf-8?B?K2c1bGw0NnI2S2xETDdVbUtVR3ErSUxUNTEram1rM1laaWdCMHFTbzljaUhn?=
 =?utf-8?B?KzZtSC9RaCt2Y2NpaWdVM0RkOVFkL0l1aUFKQldaVlB4Y1V4ZlA3b2Z1U2NK?=
 =?utf-8?B?aGdHZXFabEhBR0hGUkh1ZGJLczBpbXYxVE5qL01qNkRmb2FWUTQ3SGYzSDlh?=
 =?utf-8?B?ajdZNERsdGJhL2xvSmhac3AyeG01NHdoWmFaMlduQUN4ZExaaldMUHJXenZa?=
 =?utf-8?B?UTVyc2ZFWUlzalhpRU5RekhTTkhJZGMvQnl1WTV1Z0dpUEpSMXZ5aXRDSmdt?=
 =?utf-8?B?c1ZvUHVHVG4zb1hkclNrSkxxUFljenEzOFJpUlZuSW5QaHBJVlFXKzM5cCtY?=
 =?utf-8?B?QTlJNEF5Y043cVhVZXBoV3FSVnJHTndrbVBXS1lTNjdGaXhqR3BWQ3FWVSt0?=
 =?utf-8?B?RWFVdkpSRkRFdHhDSEJuaFB3bEZPV3lmL2Z5WS9SRDBqWE1ETXJ0cVFZVUZC?=
 =?utf-8?B?SUtXc0pjeGt0SVdMdFlwS2VQZW16Y0plNzM3cy9sTzJFVUJIbzNucFRzR1Jx?=
 =?utf-8?B?U2pLMW1LQS9GZlcrWFc0M1NMdEZBNGxXVitSRFo0UXcyaFJqbWVQSDQ3TGRM?=
 =?utf-8?B?SXpvM1ZVdWkyUld4NFAySHp5R3djVXVhUHVyK3NIMldRSFR3M2tHMFBUUWkr?=
 =?utf-8?Q?RngVsEdLc8ldXhGcuyLLz7fNJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17470313-8151-4fa4-d87c-08daace6ebea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 06:48:22.8088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrZcOXHF5EWpNkh85KlDr4ynPJkMB/Cz9wIh6G45ACN8XLPg/Af7qWKTCEV4Tn/ZKk+brr8mWsPjxpwpW7zzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

Just like domain_soft_reset() properly zaps runstate area handles, the
secondary time area ones also need discarding to prevent guest memory
corruption once the guest is re-started.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To avoid another for_each_vcpu() here, domain_soft_reset() could also
be made call a new arch_vcpu_soft_reset() out of its already present
loop. Yet that would make the change less isolated.

In domain_soft_reset() I wonder whether, just like done here, the
zapping of runstate area handles and vCPU info mappings wouldn't better
be done after all operations which can fail. But perhaps for this to
matter the domain is left in too inconsistent a state anyway if the
function fails ... However, at the very least I wonder whether x86'es
restriction to HVM shouldn't leave PV guests undisturbed if a soft-reset
was attempted on them. Right now they not only have state partially
clobbered, but (if the arch function is reached) they would be crashed
unconditionally.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -951,6 +951,7 @@ int arch_domain_soft_reset(struct domain
     struct page_info *page = virt_to_page(d->shared_info), *new_page;
     int ret = 0;
     struct domain *owner;
+    struct vcpu *v;
     mfn_t mfn;
     gfn_t gfn;
     p2m_type_t p2mt;
@@ -1030,7 +1031,12 @@ int arch_domain_soft_reset(struct domain
                "Failed to add a page to replace %pd's shared_info frame %"PRI_gfn"\n",
                d, gfn_x(gfn));
         free_domheap_page(new_page);
+        goto exit_put_gfn;
     }
+
+    for_each_vcpu ( d, v )
+        set_xen_guest_handle(v->arch.time_info_guest, NULL);
+
  exit_put_gfn:
     put_gfn(d, gfn_x(gfn));
  exit_put_page:

