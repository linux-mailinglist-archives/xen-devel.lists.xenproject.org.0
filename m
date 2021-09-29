Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5952F41C1D7
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198969.352741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW7n-0004cU-Op; Wed, 29 Sep 2021 09:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198969.352741; Wed, 29 Sep 2021 09:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVW7n-0004a0-Lh; Wed, 29 Sep 2021 09:43:39 +0000
Received: by outflank-mailman (input) for mailman id 198969;
 Wed, 29 Sep 2021 09:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVW7m-0004Zq-LY
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:43:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a51f58e9-2f41-45b2-9694-77ebc0d8c3ab;
 Wed, 29 Sep 2021 09:43:37 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2055.outbound.protection.outlook.com [104.47.2.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-drNc4Ob3PL-ghuOg8DSjYw-1; Wed, 29 Sep 2021 11:43:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 09:43:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 09:43:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0145.eurprd06.prod.outlook.com (2603:10a6:20b:467::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 09:43:34 +0000
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
X-Inumbo-ID: a51f58e9-2f41-45b2-9694-77ebc0d8c3ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632908616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AublGjh33/bNoaWEfJ8R3GvMAzXTnFnEdFM3kcKmyl8=;
	b=gDPKnL3JmeqZtyivP+NLwt1kaMqGrT24uM+SwJinRiGX85DIH/NSTnNt/PEL3EfRUC59um
	DQDGUiGQnN8VwDbzlh4W7Dqx/WdWuxrob+K50KXGH3XXqKQy+bvPOWKBgaosqIyagfad3f
	+lJ+/KONVCOxqRO+CCguE2x0HDvhv6c=
X-MC-Unique: drNc4Ob3PL-ghuOg8DSjYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1F6iLcDOY3Qb5MxIPl5VfyaDbRi4fBvyHlSxfBrrgNilvwnPih2vHny/LQRiG/QSUBhGvcuX4BJt+iz0pncJLqjFMyt6lNVi1RJRgXXVxr5pe23V7DCdiVgSgs9Z2cCqde5Yyd3Cmjh/c1R92pbOp8+uqucfV1qPnh9rPyj95jDHS5pIVVDxHi1PYfff/TH9RiY3YHESB/Vlf/Tt/QEdsDV7+hQpk4pg2YlU8kpkpb9KWvVQwKyZKJSgPWJx66gtycvTkIEe/8LL7UQ1wL0qY7laAGbw4VMySNiR1VcnNadqlWw0HkT8zV68Nn4xOApK/xiib2urOSHmC+Z8KV0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AublGjh33/bNoaWEfJ8R3GvMAzXTnFnEdFM3kcKmyl8=;
 b=dztgOZDVSYUmEY3ERFwq1/HnaeOV2ps+k6rSSkCA61sKbMdPP1DKmuNiKPgJzzm/VArRAWGQaBX8ssv7D8J3MM/dm9sqUKXtxV6tugJq1uTSh8BW1Czag9sOtJsoGZHsGizt9xrq8ngBfp49qcKjKkjmZvCIeRGg4W7Ii7/TId81vL1Bd0PuMNAD6H0xqwR4oqNBJ8QuBgr64CBPqp55M0y4waexwsR+mYT6lpmqPiED62x7vTmFI7mkQbk2SbogiOVv0C7TJTSxHr991HjDDlksutvzRmb6EaNYMd2HlFemavZDzdf3hqLpYQUdNLUnDh0lDL7VedoKlu+UWEZupg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/3] x86/PV: drop "vcpu" local variable from
 show_guest_stack()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Message-ID: <6dad4cfb-708d-027b-0fa1-77bb39319fe6@suse.com>
Date: Wed, 29 Sep 2021 11:43:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0145.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89cc0893-c283-434c-344b-08d9832d9ad6
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB312026FE274A4CB371DCD9C9B3A99@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67nxH89wlRlubXJu4n2Gn5yP094aZQONQxTCAcWDAbipwxncqljfTkTq4gRzjWgcD6D94QAexl6ZVCoove8CzevfZJIyZaNia2vruKlgSyO6FIvAMi32dXhGyYlgH1A10WehUW/QsqQv3LFwQhAZoZnee9NM8zWgTGlut13g2EG0fa29l+WFerP9xWeF/75A5Ud0jHLZuloJOueONdS/CSSGEIPxRgAOeFNtwB7sOzmOErYPLL2swRZl4FgvHhByM5sMaUBwQKB6C0VIYF1SNDk7qq9WTzUsBKA+981vDANMhaN6Akbid+FronD2x/ikan6IMF5v0fKXDPMkrCCBbhsnWuPWNl7tNURHoRC9M+m1za36WTtQ9+anIaT9ioeokzgq5aDojQes04gOjM4S7vLNX4sMs12ZVUWZX1frIcdC1buZa/ku5GubqRshmkdkWHaG77JTNbKzPa2TQtIoRJxF8U22c1weQq1iLjXE3jL4giUqOcjze7OzQy9pXrymbKW4FJn+c63qxWUiL75aW2CkuaCemQh65/66TqdgFbMiSpLCrPyTgWhSebTkcfaw/YE/RsAFGX4QLTa/7l+DufMtQbE9zyqEkR47ayG+Aa5hWxQbezRqjHZZyookTXCQR+RTT7vDkwAeDYEObK0JokEwDED53eAST7Lb3imd5YO7ue7ml2qen1WCA/ik0oSQi9u/Uo09hUDqgNwwGXOuNNCcxsLiD1iyUPBFnMVACi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66946007)(16576012)(4744005)(6916009)(54906003)(86362001)(2906002)(4326008)(31696002)(956004)(2616005)(36756003)(66476007)(316002)(26005)(8676002)(8936002)(6486002)(5660300002)(38100700002)(186003)(508600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXlDR3c5OHN1YnRlRnpjNDA4OFBkTjVVekd4bjlzQ3hqMFNDRjE3S3JDS2JW?=
 =?utf-8?B?dG1QMVBZekNMMS94WDAxTHpBNjhiTlU0WEx4K3E1L2pHdHhad3RxQ1pIS3Ew?=
 =?utf-8?B?aUNOdENLTWk0Z29Hb3R0MTdKVHdSQ3prYVQ4MUJ3clFmelltbXF0c25xWXB4?=
 =?utf-8?B?SjNpcGthNlErMXcxc2p4ZGVFNHlRUTlZWGhlY1hDeGp5cll4RGFmVXRZUC94?=
 =?utf-8?B?cUJnLzJCQWh6R01yS1E2N0NlMDdSc1F4dXdGaXg0RHdwQnc3aEc4ejcxV0c2?=
 =?utf-8?B?N0ZJNWdVY1N0RHZiUm9Dd0REWjNPOFBjSUJpL012MjBCM2lubjF3cE5hQUhu?=
 =?utf-8?B?SXdEK3lhVFJjT3JmVE0rNDg4ZStwZGkwL29CQnpDWkxuVWs2cG1tczFIYkFo?=
 =?utf-8?B?RzloUW5sSlZqc0RXdXlXMFdtRXJ2UFBKZW4vUDRLVlhEZXRKdi9sdXNXaWRt?=
 =?utf-8?B?b3dUQXFFSzlIU29EMnRWaDRORkVuT2VDM0EwMG5oSVNUaWc4R0R2YmExTEsz?=
 =?utf-8?B?NFRJVTRVSGlDTGFiUkVOeTFSV1FIbmhqaWNHeGxPSWVtWTFUeVo1UFMvZnJX?=
 =?utf-8?B?NjR3Wm5RVUZJRk1QR2lIcDJkZ0ZnU2pHdHd3cmUxSzdOcWlsVzRZenA3Qzc4?=
 =?utf-8?B?OWw0RlFVTHRIUmZRZU0yUm1aNWx6RVB2YnpqZVNQZmIyVENKNVdpMFVkZlo1?=
 =?utf-8?B?ZDJaVkF1K1ZyYmNkaDM2NUZacHowUDNXbmJReHA4RkJoZTA5dHFFTk9MMVYz?=
 =?utf-8?B?cEJEcHFISTF5cmJ4UVA5Nlh5SGtmRDdtNDViNG9aRzVKQldkb1BYV1FHeVMw?=
 =?utf-8?B?NFZ6amNvcEN3VmU5MHNtSHpCT2hHNkp6M0JOU1luSzlKZzVuQ05SY2c5MFE4?=
 =?utf-8?B?ZEhPd29JdG96Q1c2RWJYSWY0eHZINXNvOFc3OXVaSnhrcFVxL1RYR0FHUVVG?=
 =?utf-8?B?bG9pSlJyYWZCbjdpbmZkMG4xcC8vaHBoMUs0bFA3a1E2QUdESlNoRVN3ZkNv?=
 =?utf-8?B?MS9xU0dxOXZVRUdBR3QwcFNJLzhZNmp1T0I0UHIvdS9Hd2pjUG5rcU1SRTQ4?=
 =?utf-8?B?TnJsK24xN0FWaytQUCtVVkQ3ZXRGbUVWaExOMU5qNjg5STBEbXl6c1U2S3hX?=
 =?utf-8?B?Yk9jclZDMmMrUSs2eWxkU0d5VW4xemNmRWRFWnZySklQUmh0d1UrOVdHYU5N?=
 =?utf-8?B?Z2FhR1RhV0VjeTgvVlpDMHEzYU1PYlFKWU1xMU9oNDBSNHl4Y2hjeTYzQmRw?=
 =?utf-8?B?VVBTQ1RpZmRkWThDQkJKZmtudVpQNGlzamVkek5jLzY3b296LzZXdzBKWHBF?=
 =?utf-8?B?MXI2U1p4R2E3cVk4bjJIaE5SSmt0WXVvL0VBbVR1Z0VzQVFJbmxTdnI4Y2hl?=
 =?utf-8?B?VmhVT0l1MVVNQTNQc2Q0c1RkVExWV0F1MVFJYWdDNkNmTTRpYytEYnlobDJL?=
 =?utf-8?B?cXBQeUo2S3k5cWVYUGlmM0ZmWjM5MmJLRnU2aW5udHdGcjhLSEdGM3pHWnFl?=
 =?utf-8?B?V2h6eWQ1YzI1UEN5RllVZGQ4RG0xWGc5dGNadXEyTTFSaTJMMUZMWXpJZVFT?=
 =?utf-8?B?SzlGMmp4UUxRL0dBRkx6cXRyV0tnd1NzaW9vMUo3ZVh3OUY0cFhMb2hhc1hv?=
 =?utf-8?B?QnNnSC95a0tsd0V6WFUrRmRMd3Yrb3J1R0RoQ2dPSThMVmpjbW0yeHpUSnlR?=
 =?utf-8?B?cHBzZzZ0aTdjQlJ2anB6WVlZNkJ2LzRmb2IwLzRMSUZqRitMWEdWbnFFQlk0?=
 =?utf-8?Q?hfNTyXWHCFk+wpBv1DDD3nTGIHlEhy3Fog0Tv4q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cc0893-c283-434c-344b-08d9832d9ad6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:43:34.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phtsauR9LWLyIiwRZwJodX85sgDCFWqCROI1f4Clu1GF+nO0FyMIpS/CzRB7CraeDbKw4sqC7eve2CUwMN1sVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

It's not really needed and has been misleading me more than once to try
and spot its "actual" use(s). It should really have been dropped when
the 32-bit specific logic was purged from here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -327,16 +327,13 @@ static void show_guest_stack(struct vcpu
 
     if ( v != current )
     {
-        struct vcpu *vcpu;
-
         if ( !guest_kernel_mode(v, regs) )
         {
             printk("User mode stack\n");
             return;
         }
 
-        vcpu = maddr_get_owner(read_cr3()) == v->domain ? v : NULL;
-        if ( !vcpu )
+        if ( maddr_get_owner(read_cr3()) != v->domain )
         {
             stack_page = stack = do_page_walk(v, (unsigned long)stack);
             if ( (unsigned long)stack < PAGE_SIZE )


