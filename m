Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E6669193
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:48:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476870.739280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFja-0005mT-4v; Fri, 13 Jan 2023 08:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476870.739280; Fri, 13 Jan 2023 08:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFja-0005jr-1S; Fri, 13 Jan 2023 08:48:22 +0000
Received: by outflank-mailman (input) for mailman id 476870;
 Fri, 13 Jan 2023 08:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFjY-00056k-KH
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:48:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2072.outbound.protection.outlook.com [40.107.6.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07466450-931f-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 09:48:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:48:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:48:18 +0000
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
X-Inumbo-ID: 07466450-931f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mar/jKBke6h4QjhUVgZt3oODFDBI5NYhVJ3TDpb5JhxVcLCKC3rkAxBnephlL8G2RJqqtreyJDgWvWPJkF8JW6foWKwS7PvV+EPgNCt+1eBmQTXhVviwO5RrYVDDAjNK5JXGm/KfYmp4nxAz069sWbeMtY0dYS/Z/4UrC/KJgOMZuLiS5Qo6GjxaQUTn29vIgc9H2sZ8jDDR+Wv6fLrPvqi0RflyYDZlwajIcFkd2iTpTNmt5cozMc15MixvZsWCUO7wE/4/2oZFULtj+SMV8HIdcMcfClRxnpohM3bEbniavHIoNAjkWhU6394O6UJ7fFzrxUaacJEwfCGWJRL67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1oV9eOFNOGvXVgiJ+rg0AtuPcAmRh13n0oNq2fBO88=;
 b=gzlbZV3WLme3h01AW50G8U8F+xefSLtdQ0MLEzqpSS6rFMPnzUpnNkpaJqP+YTTt8AOYfe5pEHWRRdMCQoe4xhphKSq769vaxAjYpxAOMhWz+xN0YMyY5e6yxPA18qbsBiiv6X+s+dqKbBtzAkHtvw48M6cWzTZhBgb1z76hXxwvAsWfo12ab4+lU22/kqr+cGCBczBY48zJeaMjroAAvYsP2dQ0zB7rSrhlwfksyLdxYRprW9DlLuBCWlnVEYyaDuJm7Qs0yWRGE8wR0MGLFgKIGOCvPNmDDUmixQlNz37dw9GDa/jrJsx25AENhYFractcly3jOK7ixZDCQwvzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1oV9eOFNOGvXVgiJ+rg0AtuPcAmRh13n0oNq2fBO88=;
 b=3W2Z/aB4738ZIiFLrC+Lkq8UnoXohflxiXnf/9Kzs+xl2kgcHicAbpA7Z08Ogi97CrmvnyZnUeG0VYBZYghmC3s/a0cZbMKOaYiUzfQgi40QuQ7/pKXVXO93DE+f4g1I6InKLYxU2Ra73ZOr3GWFA2r1vFN/C59WzSmSkjbZfEE/aMhO2aSXKPNe/BbZ5Zgb91e4JOi34CfzAuYjaBCg/V2lxAd2CEFz0zIYyPXOinU92q7bUARkqdjZYjfEhfCVIibUGqfw1eUlvxzeF81904YW5h7a5asZesB1PyKaWu3RPwZJ7E/XY4JJNkY9j2gLDdSVddGKcIDzBdJ+bTd2hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b05d3911-a6c7-68f1-0e48-255630ab6516@suse.com>
Date: Fri, 13 Jan 2023 09:48:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 2/2] x86/shadow: further correct MMIO handling in
 _sh_propagate()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
In-Reply-To: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3e9317-3c9a-4a0d-ce56-08daf542eace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	saK4/T8AEIKCh/un8TMOqDgGA3IE30R6OLJ2/fyewo4eYzAKZsCKg/X3O3ehKyrsSGjSpg3zc6pZVPw57HQ/+jRtkKOM3uujBERXrG2Nu7knC+BZyqLXUdyEtm9KeKvopT8G0ebtcezKrYZNg9WwS/M6c27BvEc/+3S9251d8diBAIaKI4EQK534DDbiauhYNiaayw8mVCSGcA8V3gRzOPvqP3ebW4X57edHFMsThNLymmKjqr0vIQDMC15uq6Tn4NdF250gDRCUeAoxyd5nmTpOwN51qNksm0H34wsgTGoWIVuz7oyyuW4yukrii7vrwa0C09/rHVC1ZhKjl1XknrNYDzn8cpTk0IEQ5GE5n+gvOr4Hvv5WBK6lKy+8XA/sH7W02ZNy6AWBUzqudqC5lk7ibY7WN+4MN/Ap5AfuFrhVn/NLQ3CNH+0rThqoNWfYEYRBa/6zBgeu6fF18WnxoXc0awV2Qj473wfIy3qPsaFzv/ysWlBvnzvwh06wSo3Tsn977/xCQPCQR12BrqFV5K4V54J0ESpda8mCJjkerCftH9HBPTfIxNxlBlX94MmuqkK1wFuBz6mUZILb8IzzrPYE6ceDC98DKjuhRYgsJIAJLvBMVHVhPSpmWR8guE6BpZGZM8UUhYHgf3dQcnEV2eyBmyJwwS0jasJZRyRSJC0g97cmGiikTmk1gsqjoQJFFKPREtqrmc/uOHlzIZwjqbHt9yPQUL+zqiF3ZB/253g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(6486002)(478600001)(6506007)(31686004)(186003)(26005)(66946007)(66476007)(316002)(66556008)(54906003)(2616005)(6916009)(4326008)(8676002)(86362001)(38100700002)(8936002)(5660300002)(41300700001)(31696002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk91dENoZWZLQUdMdjQvUE0yVGhRN3JXUkNlbTMvL05HMml4VDN3bkkwRC9D?=
 =?utf-8?B?MTZ6UGxHa29ENXpqODV0b0pNK2QxcU9BZHVHS1B3aDVuRTU2S1VzeDAxRVVl?=
 =?utf-8?B?QnZDMWhpVlVQWVpuY2pQR2Rqc1J3akVnUjAvM0h0WC9USHZvK041REU2WWE3?=
 =?utf-8?B?QVUvb3VxQ25uUXJOU1BRNno0RjRkSlFlV2VjSDdpb09zNDJ1WEdBMFl1LzFt?=
 =?utf-8?B?TlUralFqWXpvOFUwNmxlenF3M2ViWDNuc3Blek9STExWeXR0Ym1vdGFMeDRK?=
 =?utf-8?B?OFhGbXpUTVNvWXRvNE40Sk1Wb1FENDRJUDZvTWE3S0IxblV0MDNOREExWW5H?=
 =?utf-8?B?VTF6T2t3YzdrVmVocGtWQjVqbmliakZnaUlhU0QvZExPSUx0K29MM0haaVNx?=
 =?utf-8?B?NzlDUHRJd2RQUkdSWTR5WmptSWM1d1RYSGFwM253UDFJL2poSW83Ui81L1BP?=
 =?utf-8?B?TnVBOThwcUpHbHRXb1FrcEJUa2xaMnZTVmdmMHIrT2lhV0hkNXYzYTRrcHhk?=
 =?utf-8?B?MWhqYVhwU2xOanpGMk5tU1FzRHZQOUhDM1ZyT2U2UG0xRWNtNVd0T2NEQkd6?=
 =?utf-8?B?TWtJMlo2TU1WZkJEandlSitaS3FQZlVDZU5uZEJMWjA5ZGFZUlNtMWc4WW1x?=
 =?utf-8?B?VXF4VEN6K2o5VDBZT1lGM0p1MDRvQTh4SFkrMmNyenBhdXZoaktremY0bU1H?=
 =?utf-8?B?Tld2MWVxK3daN2V1UEo1ZWlxS2o3N05wcjdSYkJPVko4K3hlU2RZWVdkTjlk?=
 =?utf-8?B?RGVWbnlUdjdxUGsrMXNGdmJtQnk4TnNmQTdIS0ttTnFlVVcxNEJSNzRzZTdx?=
 =?utf-8?B?Y0dTeENnRW85VkZYaWw0Sk85VUFlUGZoR0lISnkrakhMeXczTE1SSFJXcytk?=
 =?utf-8?B?NEdiMUNEY0czeE5YRzdJTmgwNlpaWFppdTRDU2psK0hpdlp4aTAxV09nWk9x?=
 =?utf-8?B?dXhBYkpwUDhQM2laVEJhOW1ITjE0SENaTHZranljZUN5SU9Jbnl6SlNlUExv?=
 =?utf-8?B?Vy9RdjdRNnozRTJGcjlON2dVdGRSMWd0Y0JkQ3IrUC9IMlEzWmxaM3NoUWxq?=
 =?utf-8?B?WVBkTXgyMng2dDRDcU5pNWdDbzJVczRrNWJZNHNjRlpSbFFJU3duUjBXN3k1?=
 =?utf-8?B?V1BIOHkzZGRQdEk2YXB0MWlNaHBpUFdhM2JVNjByVmdVZU9LMmNGUWRXSmFt?=
 =?utf-8?B?cmJ1WEdXcW50a1V0Y0tOZXBwZGdXS3p2UlM1WEZjUG1EVTlsK3ZiZyt4b1o1?=
 =?utf-8?B?ZktxdkdXS0pTckJXRjFNNUZ0OVdrbUhtZ0VoNytKcExFdml2ZmdSUmVMdlMz?=
 =?utf-8?B?VUJIRTJrYStDVlNSbGVaYzQvSDc1U2h4c3NNRDQwREFFbnQyQTkwdFZMZVM2?=
 =?utf-8?B?c2J4U1JmblZPamxHU0p3VUtRRkhtTE9vMjJXaHZzKzg0VFhDRndzczAySDl1?=
 =?utf-8?B?aDcya21XeGx2Nk9XeHlZZitrdU5yN2xJM3FKRkViQVVRamJsQ0dPVGtJZkRa?=
 =?utf-8?B?NFNyZ0txOCtYRFgvL2taaXRYQmZab2U5UGkyaTd2dmF6RVh3VjBEOURHdEFE?=
 =?utf-8?B?cGRMWW1mTjBTNE40MUFzTXNKRXN4YWxwRE9DenhjSlhJUEdaRFVGYVlqeDhK?=
 =?utf-8?B?eDRmK1VybHlLMkJIV1ZQVnBBZlBySHhCVjFWbjg3Y2hRZXZ5cjZML21FQTI4?=
 =?utf-8?B?d2p5WTNaL0cvTmVLMlNpemdIektkT1IvWlNLN1BpYnEvUWZUYkM3MnBYTWJo?=
 =?utf-8?B?NjRmdkVZc1FBOWVmMzJoODZjRE51RGRCTXlsQ2dyLzBocHp1SytVR29sS1lh?=
 =?utf-8?B?cm1ENjhCVGFOQnZ6aVMxUXRqZFBHcElJTnRLeVB1VnVXSmE3VjBEWUlvbDUv?=
 =?utf-8?B?b0owcWFQVEdqdU9ERXdJcFVuODFWQ0FRVmkvdkVQbjg3aDRIL0pSMGJidGxz?=
 =?utf-8?B?TEFVQktTWTYvTEJlWk1hUVg1UWJUTEYrcWpzNWJUL0NaeTZZc2FGejZ4ZDhC?=
 =?utf-8?B?NVJJbjRHcXg4V1lPTVUwbnJjL2FkM2VBWlJ0MS9jL0QvWXJFMUd3aDRjNHQ2?=
 =?utf-8?B?ZFJ4bVY0UjZTVFRXdzFSWUgzNW5Mai9LaXhZZFlqL0xzUmk0LzcyeVA5RFZT?=
 =?utf-8?Q?jJF0ACAW+4B46P4ooWwUllsUl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3e9317-3c9a-4a0d-ce56-08daf542eace
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:48:18.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkqqHkz2MxGF8jzFGQoHNK5PjZErFw/5B8+9hOXU9ts6/D0A/rweT187O1WYlsc7U4S7K76VY1dSF39JA+VkWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433

While c61a6f74f80e ("x86: enforce consistent cachability of MMIO
mappings") correctly converted one !mfn_valid() check there, two others
were wrongly left untouched: Both cachability control and log-dirty
tracking ought to be uniformly handled/excluded for all (non-)MMIO
ranges, not just ones qualifiable by mfn_valid().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that this is orthogonal to there looking to be plans to undo other
aspects of said commit (XSA-154).

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -543,8 +543,7 @@ _sh_propagate(struct vcpu *v,
      * caching attributes in the shadows to match what was asked for.
      */
     if ( (level == 1) && is_hvm_domain(d) &&
-         (!mfn_valid(target_mfn) ||
-          !is_special_page(mfn_to_page(target_mfn))) )
+         (mmio_mfn || !is_special_page(mfn_to_page(target_mfn))) )
     {
         int type;
 
@@ -655,8 +654,7 @@ _sh_propagate(struct vcpu *v,
      * (We handle log-dirty entirely inside the shadow code, without using the
      * p2m_ram_logdirty p2m type: only HAP uses that.)
      */
-    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) &&
-         mfn_valid(target_mfn) )
+    if ( level == 1 && unlikely(shadow_mode_log_dirty(d)) && !mmio_mfn )
     {
         if ( ft & FETCH_TYPE_WRITE )
             paging_mark_dirty(d, target_mfn);


