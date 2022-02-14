Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6F4B4904
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 11:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271361.465766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYRY-0004eT-Cp; Mon, 14 Feb 2022 10:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271361.465766; Mon, 14 Feb 2022 10:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJYRY-0004cU-9e; Mon, 14 Feb 2022 10:18:52 +0000
Received: by outflank-mailman (input) for mailman id 271361;
 Mon, 14 Feb 2022 10:18:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJYRW-0004cO-T2
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 10:18:50 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7da2131a-8d7f-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 11:18:45 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-SyXc_BCANty9kbVPh2YMkQ-1; Mon, 14 Feb 2022 11:18:47 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4415.eurprd04.prod.outlook.com (2603:10a6:803:74::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 10:18:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 10:18:46 +0000
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
X-Inumbo-ID: 7da2131a-8d7f-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644833929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FbQnGuAQmyX9dDjrZ7j+sMeyeoSJ3f+/EGE3I1YR6/Q=;
	b=E9gQC1qu6oFIVV6s12wK8Rp52ao+lDj75klQoqQs/FnB7NB9q2ZzKbpegswtgiOrCZ/WDp
	0wRJ09qsu8gcF09X6rSpXMchip29TjzHkmZMbXCCDF8PKsYuP96PCOsDUADNX56O2DdDF1
	9XAlwsyTiXspMDRwQIMBnEvYak4TcEg=
X-MC-Unique: SyXc_BCANty9kbVPh2YMkQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+FnR1OgbMmF5M0MKML9smeMiXlT9mGRgIBsYxpDtJucwQBkLQ31nVvzKUW8rAEppUlot4SwIFfKJuwum2cnIju2IJb3ofrIlffZeOhxLS+vuaYl1GdLdFH2exGo3k3IljGSYi6v09DEzlzoKzluq+JdQ7ZCoq1zrvkEyQsDKMrYo9p7jqrWZUt1pzbQ7i2XWfBdny4jn75tq0BcyMG3E7aL+opiedU3aw+IHltfSRHebIh8SuygsJ6ODXBKdu1fXiPsLCkT8Qzbmb1R5ZueMu5jKNUb3I9Y8hyqgr7Wo8Pmt5qICFSCn+hql7an4j8ZR/lpfrQbXVzT3T6r8FbmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbQnGuAQmyX9dDjrZ7j+sMeyeoSJ3f+/EGE3I1YR6/Q=;
 b=bDXgbf973lBz9QXB7qN7klJb606fzE6gqaZ70f8y9Sr19IUnIF8WHwkgsxWUKLbJtsHIz3hzsvbi2yzlRrD+uXUvKEjO4wGiuxTQh2VQxdv/GDvqsQXR0dzQfD9wggvpPYUrb98+ZhKMHyAOofmwYmkaDXN+Ya/oJS1FiYfPxWrLKIY8z8GzDceYcgCDKcjommgnG/CUrZV/A+3nA8LnJEpnPLiD+TFUaeZLDGU8ICMUb+/qpXNOB7M97zJtBemGBmSFRu4NEBYtep3s18N2vT3/c/cwtIIKB2wttgWBBH+gClDSrE+UrSjDo9a5iIkiO8h/5GgEoPpa+ihUawvLbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <710fd687-16d5-c088-d3be-749851e6eab3@suse.com>
Date: Mon, 14 Feb 2022 11:18:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: tools backports
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5271fb0-eb94-45f2-466a-08d9efa3625f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4415:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB44157098A0FBEF50B066B612B3339@VI1PR04MB4415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nNHXJAU8nXBhBPVuOzmk3nxbrWUaxcq6Oc75AT+PgQxr4hFZ4Xp1yzBsGi+9vSsXEYXv7Jh7XZLbYg2KzzwXtlDsOS8h5ZsUEiXzTbBlH0/Os9kp/r/TXQMfRRLhkWzDvA23Ckh7n/2am3aCAtLd/J/rWoUxLfZCwWWLU8JOdnsEoACc1V/Tk49P4+JeIBUFg910/G8MaeHxGniRGkgK+LXFgZirLtjBpI/aeabmJUUT6jJuZ0RrGu3IPMk6TkZUS8XzK8od15gSxBZ/lxDez32rOpWqma+ksgTXy8P7PRLA/6WhbHa8nZBz04FW61HBtQS2D7OLYd53HIwQ3xgxnZalYJFDhV3vTCk8QgZSn6PKl6sS+yOuF/2CakW9rycBsoobghHfthSIEEIyQaYlYu8SflLzLKphso5H+9lw1tsbhawwKmND5ynxgmHiADv563RdV7Lg0lRdrjAMfiQ/lc8CvAqHCOLfmbke8v2EbMI4kfm2rGqpl4E+tdr4jsRhIli8zxIva+MzeKe/7muMoLOGKoqI7GG8tdXQGrnxia3RuxFT8FE8eIe1xFxuOSGd9rfVsZkQAWk+IxUL6An6MjAlpBWv7re3+wCmzATnvlRim5eID7lvCcjDZa1ufw2OzazwWs5WsaqGyuTvSro8MJZ8mdSmwFDfVcsdYZ69VVrz49CC0fTjl7pEP8NQIVTa4F4R+mXu0nl4B/+4piRUZXrzezQVvzEqAiCBoxqQiCE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(36756003)(31686004)(6486002)(3480700007)(6916009)(316002)(2616005)(186003)(86362001)(26005)(4326008)(31696002)(4744005)(5660300002)(6512007)(38100700002)(66476007)(8676002)(8936002)(2906002)(66946007)(6506007)(66556008)(7116003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1lQWHpjbXlFa2ZLNUE1bFNQcW9uQzhmZW42a2tqNTJ0MXNuaFo4ZUhYY1Qr?=
 =?utf-8?B?OWJnKzFGcnF3bkg2WHVmWEVPQ3UwV0s2aVFNZWMwb2JyanQvbmE3bHp2VkV3?=
 =?utf-8?B?WERMdlZBdHdtVmdmOTVDOGRuVzhkMzlJbzJ0b21pWW1iZ0lTZ0dVcmFuODUv?=
 =?utf-8?B?cDdZSU96SmlsV056eTNWVVh6Yzd6WUtORi9nM3pDb0xrZzVSZjhPUFQxQkdG?=
 =?utf-8?B?NEJQWi8xZEtSWDhkWnhDMmJCU1FwK3hBNkZkcDRHUERLRmpoYUlva3YvMlpn?=
 =?utf-8?B?ZStVRmpLYVpCZkNBeHJVUVhyVWNpKytKRk9HbkthMXg5ZDRpdmo0UXlEbndh?=
 =?utf-8?B?NDdVYW00b2xFdDFBUzBTVmRHZElPVHNpY2psNjdNZ2F4bzFNUkZuSGd1eWJl?=
 =?utf-8?B?a09DbW55ZGhqYldIZGpLY3FhN24ySmd6cExmZ1NqZ0kwd0tXNDFhOXFGUTg2?=
 =?utf-8?B?NlFJU2VkZTlpM2NyOHFjNTFIbXJjRkdYc2t4T3lWUk9iRlZ3OFBjZi8rT1Iz?=
 =?utf-8?B?aFZPWWtoTGxVT3ZHcXNKRXZLTkxCL0ZQejZOZUFLVW5rUkZ5eVdiQ2poUzJW?=
 =?utf-8?B?TGRHQ0hGWm9hczllZ2xJUk12NnVubEJaUWV5UHNKdUN6WWNuUGNrQXNSRzVX?=
 =?utf-8?B?MTBBQllSUk1Mcmx0ZnFsS1hMTDJFck12MXB3Yk9JVEYwN3ZOM1Z4Uk5Da2RW?=
 =?utf-8?B?T2FGck1LMHh6b1NvR2k1aElOcWVSSkVsT1pVb3h6Y3RRejcvL01oTXM1MllL?=
 =?utf-8?B?ME5kcGZPMEJkcE1ENTU0SWVGK1RDMG5IRlN1dkhVOWJ2UzJWbUd3RTlZNTRk?=
 =?utf-8?B?U2xrOFJDczVqUHlZUElpRnZ0a3UxWWtDbUxQUTkvMFM0YjFSb3YrK2ZoRzlW?=
 =?utf-8?B?cHZ5aDhlVGRmL01WWDV4bXdtbmhDeTNBMjcxT2tFbHZYTFBmcDBrZElxL0tM?=
 =?utf-8?B?WXRkRm9iNUJqL2c0MnFDb0hEa1dUc2Y4ZDAvL1hjR3pkL3JxZXRIVEtmVHgv?=
 =?utf-8?B?Q1N0bTYxN3VRWDU4NVNhOXdnZktYZEVza3dmdGdUaWllRmxVNDNZZ0tna3V4?=
 =?utf-8?B?QWJPNUpvVVo5N0tWQ3k1ZEx3aHM3RVZPUndQeTNxTTY5clBidEpoNklPUGZs?=
 =?utf-8?B?Vy8zazFBRU1DZGx1UmhTaHRVK2tCUkVZYm9vMDhsaGdoM3ZTMG5SaWpLRmR5?=
 =?utf-8?B?cXQrMmxQVElLK3VkZ3kva1Zya1RaWkZFS1k2NGdQWUVPS1k1WGJRYVdDdW03?=
 =?utf-8?B?SW1KM3NUcXdZeVgvOUFhWEMvM242a0w1THNUR3pwc1pMN0hFaWRGdktyYUpq?=
 =?utf-8?B?YkdPc2tYTnRlTDBvckVyUVViWUhEMkVqSHl2QzRaeE1qR21lbVJmclkxQTRn?=
 =?utf-8?B?QTM2b2w2dEVyMThRem1EWkoyYmxLMFNaaEhrdGpWQXFrek84cG4yMFI2M1c2?=
 =?utf-8?B?YlVJZnE4YW52Zy9XWmlpNU8yUERhRzMvaUlWeGk1ay80TmNncG1NYjNVTGxU?=
 =?utf-8?B?WWx2YjdqNlZaSnN2OGJvMDlBUmRQM3ZYWnFNYzNZSFNSZ2JBSHdGUGZQSUx5?=
 =?utf-8?B?QmlwY05GR1cwdm9XZHhCUmZYYzF4SXNQVzZ1TmVvTlU3aVE4L0FuZFdwUldL?=
 =?utf-8?B?eGUyUjMxTTBoR1JEVU1YSmRHNTJ4enI3Z0JRY0JVQmxHRWp3K3djTUpQU1ND?=
 =?utf-8?B?U09yOUpYZzg2U3dKRTdORGoydXpzYW1HVmNQSlpxMXNSVEdtVUZuZXBCU0Qz?=
 =?utf-8?B?YVNKMllsUHp3RzFPZytpTXJuYXlmVkRjU2ZxTHpCeXdPOG5EZGo2bEk5em1X?=
 =?utf-8?B?OHI4d1AzeFYvNlJnaTNUbDBmaTEwcVIwc3Z0UStIdHg5UFBMZkkwbi9qMFJP?=
 =?utf-8?B?WUhtbWM1UHZta1JJNmFwUGpCWkVjYXh1SjBYRWRrNEpITnhQbGNRdUF0L1Mv?=
 =?utf-8?B?N01LWGd3MmNGOTEvNkdtMmR0UktVNHcwZXY4OVNiRVNlTUczSWt5SXNzczlw?=
 =?utf-8?B?TEJWTDBpQUZxT3QraWRjYWw1aDdmK2toSlVsNHJuU1VKZjJXZ0FOejFORzdj?=
 =?utf-8?B?dmxyUEtPMDVGNlRIeGJxZ3k1VXZWZ2g5T2xXMFQzTTJsUzU1NFZRYXN4WnF5?=
 =?utf-8?B?V1NscVB0V09JSzliS256aGJCbnRqMmlTYzRVbWNuVk5GeTlQQ2wxTnZPWDNP?=
 =?utf-8?Q?0XVcUEs72xsZULisHK8gc0I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5271fb0-eb94-45f2-466a-08d9efa3625f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 10:18:46.1254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4grKFMAjA9uWvDmpC7J+W2bc5LEvjxUf6CQ4+Rrx/PHTm+oJVnYsuzzzCa4KAbN/QaEUHdH/3qqZxcGo5+dtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4415

Anthony,

I have a couple of simple tool stack backports queued, which - with your
agreement - I would want to put onto the stable tree whenever I get
around to applying the next batch of backports:

d9d3496e817a tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL
e62cc29f9b6c tools/libs: Fix build dependencies

For 4.15 additionally

dd6c062a7a4a tools/libxl: Correctly align the ACPI tables

Please let me know if that's okay with you.

Jan


