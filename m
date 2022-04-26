Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A450FA6B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313718.531427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIPn-0001it-C9; Tue, 26 Apr 2022 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313718.531427; Tue, 26 Apr 2022 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIPn-0001h2-8s; Tue, 26 Apr 2022 10:27:27 +0000
Received: by outflank-mailman (input) for mailman id 313718;
 Tue, 26 Apr 2022 10:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIPm-00013U-1E
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:27:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77036a99-c54b-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:27:25 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-SQPZjC1tNVe3H6HnzLSA_w-1; Tue, 26 Apr 2022 12:27:16 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6490.eurprd04.prod.outlook.com (2603:10a6:10:10d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:27:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:27:14 +0000
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
X-Inumbo-ID: 77036a99-c54b-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lOjHQbvjAHuNhYfaLpMKdkqXrWxqv6HPbYChJwJDg6s=;
	b=J91soNFfJrWW9E+zp9jZod1w9Rt8yKlgfNMEE7lnBgeKohrP1xDdKr5Xwtu4HGmKRXx0mt
	dkK9ZZxPpX0QCnhyflzej1YGDUM8OH8jX+Ef7WSer+GazybQfZzMP/RjGXjbRdig3bzBpH
	VvI0L5OOjX9kVmtxv6imso7FszeOa3o=
X-MC-Unique: SQPZjC1tNVe3H6HnzLSA_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0HCQxy/rwcoRNVQWgX8z16CNC3WzwCyj2163Gs0HBp0Ce0gxIOLNT8OTXXZyvoEhbtCFVH4jWb0WabqQ83hkfHfNwAoBrKB8VtKAFJ4XHnAmyzeACoYAgv/7esL1O3Pj9464fL05vLuFTPMTA4NBbLCNsR2/ydRnWISluHthAQwwy9feRb16YjtyXvFQC6exCGoqRt2tmoDTq+xOaq4Y0j73cLIx4Cx5KO2ZAVfIJXgW5OE3rR3QRNo2TUPjVKXfDIC8m0TegoJmo3m8cRPUU52un1xud5qnNZhii6shMpPv8CvS6BTOvKU2odqQmsZyooiIr/TboQ3PfnHp9tjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOjHQbvjAHuNhYfaLpMKdkqXrWxqv6HPbYChJwJDg6s=;
 b=Tm0PVVMHKmQFK701yt4mUv5vTgKqGdesq+YvqpPauhwgkK1kpAs7s790mhHh/cWCQOARrViWPGpg+t0Soa9UwJQAkImAaLJwE/UENTTltLhPZg+w5lABA+IWxaHnQH/7HJ+S1YY1A8FxdC8B7K83CjfbO4y0tSXR+tBQ5qKYYLhhmNlWS1PqYMePEYL3/izTu5mllWh3m7mlJV5TpypicM20FnoYc5YtQUXYLfP+JPAVMQnfH5Jcv4NMdSydOXE8yobbQ/JH4v9mm+DOqGFD10AUysdYWhi7hk8NkURuaX5mtMfg83hEnn2Qu+RaqEn+P4/I9G4DkSffNYJRhZqhwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d6144f6-489e-d9b0-b590-f5d65c385116@suse.com>
Date: Tue, 26 Apr 2022 12:27:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 8/8] SUPPORT.md: write down restriction of 32-bit tool
 stacks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0113.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34508f68-a06f-4300-a9a5-08da276f550c
X-MS-TrafficTypeDiagnostic: DB8PR04MB6490:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6490FA6918410292AA7C4831B3FB9@DB8PR04MB6490.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8xGre95ZSjcj67qXqX0hYLjNpjOMkrPryKyqzMqMLZUb2pvG2SmRpOA9i+HriCPZiKnYQNKRmYQIrjEQJ5Q83h3ug5IhEqLqLQoEFSTYfxom1IA7Hom8dZzj5uckkIJiYOf0e2DCQOt2ieY8olBrYYnzZtPk2ZIJO51C9gBHaF9mhCgF7MLZXWJTO2JDPqK/mQ7hQCXfAk7b2WhYtNzEx1ycq/P2yAl+h7gR5iXHsD8ngQH6JckU/SJFyf8XhhiMxy9CaJqAGumohTK8Cv8dF0jHTNso6nzgr5OkayMkImZB8ijbHTOofwl0/3gLd+Jw7EhWsK7sW/Bq+XGk29Zh3Tq3qhx6LvsRuW00dM4343l2psE+6FpdYUxSIcKX79tX3VhGB0GVeT8vGYhs1FkuGZ7gbAA6OjXeb/Q28apVLi6x67qMPPfp62piWt4fJdiOIOtdAbk0DMCpDhclWmsPDsERTxUZHplVPzH/yDeo8k2iWLqIlXchS4M765okTqzDWe8I3JvexUeyEusb+jsVo1UH9gcHc/pQEHOXwfZXicCyTMueXPaLkxS90WAOuHZ37HV4o35lbJWoxH/TYeLE+p3+YJzHQp/5aU4HYMqwPjwesmwxTitdIZHa2Xl2Rdr+CNRpfOpYBjkCaEJDRv4KRIXSaa5RtoowWTz5coVkPpfIGkrn1pHssr5TJMxfBu95htELP1N5gx/bqEGuXPce2fZ0DlQhfE8iMWIng7TLb4M9aMeJ3SEt6prLR1A5Ia8m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(26005)(38100700002)(6486002)(6512007)(66556008)(508600001)(36756003)(4744005)(5660300002)(2906002)(31686004)(8936002)(2616005)(66476007)(66946007)(8676002)(4326008)(186003)(54906003)(6916009)(31696002)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzlZdmFmeldUdnFnN0w4d1h1SDZCbUkwakJUL2FueFBBNjFxOTQwZ0ljVDNM?=
 =?utf-8?B?YzBiQTE5NFI0cE1hWlljZGpVdGNOMjNqZUI3Rlh4SVVsVVJVY1JBMXRDNmVS?=
 =?utf-8?B?bWhrWmJLSUhIaWtBMVBSQy9VaVJtckl4V2tzQ0tqVTJKRmJjUlZZbjVxQnEx?=
 =?utf-8?B?aElhK0xVbUN1Rk9YMW9UN3RCWTZCZVJyUUhEc25kaWUvbXdNQys0UWlsdUpo?=
 =?utf-8?B?cXB2TUZqdEhPNTBDTU5IemVPeEhmYlgxUHM5bDRUSEdHSyttMmhuVVRkemtK?=
 =?utf-8?B?QUJYOVJweHozekJoM1d0TFF5VVdHUTR1VFd2MkowNU1BS3pDZlFzRzVVTHY0?=
 =?utf-8?B?SmIzUyt0VEFQZVdXQm1XaFBJUFA5ZVlZRGR2NDlCMHRWdytzMUxQc0xobEJj?=
 =?utf-8?B?bXVRTFBXaTdLZkFqTGJvcmZsZFYxYWd0ck1PMDNqOFRjZDZSYnQ5WXlmU1pL?=
 =?utf-8?B?ZWhva2pwb0ZvZmRiYWxUUVVMNzloTG5ZcWxLekdpb24wL0k1dkxnNERkY1d2?=
 =?utf-8?B?dzBHZTBZRnRxK1hZaGkvSUEyS1Qzd2FLMDlrZkgrMldXTWlIRWRULzlqMUhL?=
 =?utf-8?B?VmZ4UlJaUytHaUJ2ejNrQlQ3Tk5zTzFyMXA3aEd0UXFCVGFTQk9ONHExN1Fh?=
 =?utf-8?B?ZVV5ZkVkQ0JXeTd5OCtvOVF6LzlBaFZna3E1ZVM5bFpVN2FrSGNXdUlZUGpT?=
 =?utf-8?B?Und3SVFwU0szcGlocXo4V0VhY2luMHZEZ1pjUm1MY09EdTFHQktZbDdLWjhU?=
 =?utf-8?B?Ni8xR3A5RlcwNnI2RGE0NEwvZzRtdFVvVGFSeFNxYXM5ZGE3eElmSTkrVjlZ?=
 =?utf-8?B?S1hTTjNralNkU3BrZkQ5V21yT2Z4TnlXaUdXVHBLOHVaK3hOL213d1IxbmFV?=
 =?utf-8?B?c01wWU5kOFMydjZJWTJweFlBTVAxWHVYSnUvTzVQOGFaRXBEZUFsbmZGb3FO?=
 =?utf-8?B?UlhGdVlXckxmVTNWNGpoQTRSZkl6OHVuMTRNYWVqamhJY3QyZ3F6bWQxenQ2?=
 =?utf-8?B?RUg0SU5xYnFrWmcvNkhRaS8zVnp1SkZWaVFocVRXNUs4citQZVhqdll6US94?=
 =?utf-8?B?NStqakpaUWorNTViREFFazZnRG1ZQ2lPOURsZmdMTTlseW1rQWMydDdaTGlQ?=
 =?utf-8?B?eXh3Y1lGdzJCbDlLNHJLZjV0QjcvT1RKejJ2bzVtVmMrcnlOT0Fza0ZwQ1dZ?=
 =?utf-8?B?c1hkb2U0cXZ0OE04KzZxb2FzQklqQk9LM29tcVcxZWVLeW9USk1OR0w1T1Jy?=
 =?utf-8?B?bWhjRFFLVUhjRE94SXA2YnZsU3B2aHU2ZWt6Y0JzeUJVbUFyTmRmVFM5MGpv?=
 =?utf-8?B?Nll3ZFNMVXB2azErSmhIa0RzNVhyOTROaVNFZTFMTVVDaGY0VjdYWlR6MEVo?=
 =?utf-8?B?MElvc1hkK21UTjg1SVkrSlNweG9yQ2pZb2RlM1U5Ti81MGpYZzQ5cHlWOGky?=
 =?utf-8?B?UzR2NHVYbmM3U2VzYVB5VW1nYlNvRG5DbjlLVXp1TEVrc05YY0Y4K0IyK2JT?=
 =?utf-8?B?OGJjcjRPNFZlNFNlcGl4K3FhMllrYnpTRVlaYWc2SmtrK0RpWms3WVZaSWx2?=
 =?utf-8?B?bzZicUl6WFZ1cGVoZlN4Q0RRLzVud0xrWHhoeFRaQzRrcHM0ZmtKOGxVd29s?=
 =?utf-8?B?RktVRTVkekFndTc3dGc3L0ZBekhUb25DemtNT1JMWDI5MUQwcnJpcXF4MkZC?=
 =?utf-8?B?RzZyQ3R6RHg0Tjh4aHhUS0FTYThaaGtCVHh2SW5adFRJejR3NWRaVnIvaTc2?=
 =?utf-8?B?czhkZndLakhLUDd2eTFLOXhmOFdUa04wU1V4OEhYVFpjRWlWZFZxT1laSzVB?=
 =?utf-8?B?OHFrVnpSeklSb2p4a0U5bCtCSkNQY050NXhqalNuR1V6Nm1HbnFzVThvWHFv?=
 =?utf-8?B?ZDc4TFZqSVNwOWV1a1pFYm5hc1lFeFlDQTJZZllzR2kySW95OGR6UW9lVHYr?=
 =?utf-8?B?b21INXQrRkl6SVhFbEluMWZWVm9RNGt0eGh1dFBmQkxOVXZXQXZEbnkrZ0FO?=
 =?utf-8?B?dVlMTHRwci8yKzU4TWxUNFB3OEJLU2lCL0c1Lzh1eHNWTlk0a2VGc29xdER0?=
 =?utf-8?B?YlJBTkRHN203NEsxbU0rNDFlVStiOFVPQ1A1b0VZT2N5alJyTjhzd3NPT216?=
 =?utf-8?B?VXovOVN5Ylhtdzk0ZHl1VW51V2lrRk8yTHlVeHAycllGNTlrVmxGL0lXRmJI?=
 =?utf-8?B?bFN2RWVoaUlPbjRjVDZWU0pkM1dIeXBPa3E2OUhaS3p4V0kyZlRRYkVkMU1B?=
 =?utf-8?B?VUY3NkdtNHU1R0xkb0NlaGJZKzRBZGlSWVkzOU9Sd2daU3c5RC9HYzlGR29r?=
 =?utf-8?B?Q1dDQjdZU3NSaE5wSWkyOWZvVVVTdjFVdFR3dWMxb0FJS2Vuc3cwUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34508f68-a06f-4300-a9a5-08da276f550c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:27:14.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gccFYk4qLYQUz+duNfWhpYOzOGh6cOrusuHzq7P+M/JLlSFjle2cfNCSL+WEYcBHRkMz0bZN//3mWOwjV+Mq2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6490

Let's try to avoid giving the impression that 32-bit tool stacks are as
capable as 64-bit ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Wording adjustments as per review discussion.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -137,6 +137,12 @@ ARM only has one guest type at the momen
 
 ## Toolstack
 
+While 32-bit builds of the tool stack are generally supported, restrictions
+apply in particular when running on top of a 64-bit hypervisor.  For example,
+very large guests aren't expected to be manageable in this case.  This includes
+guests giving the appearance of being large, by altering their own memory
+layouts.
+
 ### xl
 
     Status: Supported


