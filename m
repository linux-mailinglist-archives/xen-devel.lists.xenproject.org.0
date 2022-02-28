Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75D4C6708
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280352.478269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd8T-0000KT-1S; Mon, 28 Feb 2022 10:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280352.478269; Mon, 28 Feb 2022 10:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOd8S-0000Gj-Uf; Mon, 28 Feb 2022 10:20:08 +0000
Received: by outflank-mailman (input) for mailman id 280352;
 Mon, 28 Feb 2022 10:20:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOd8R-0007KG-9m
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:20:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fff025cb-987f-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 11:20:06 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-s7psJOiJMEKXIMD4acaF3Q-1; Mon, 28 Feb 2022 11:20:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB5801.eurprd04.prod.outlook.com (2603:10a6:10:a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 10:20:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 10:20:02 +0000
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
X-Inumbo-ID: fff025cb-987f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646043606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Aadmc9oy/kekIDpUESR5X2aTVRaZ+suywBUfbquNEK0=;
	b=chY1QGNK8TU7G3vF11V0oLTdSCiEhsOt0zXnm/lMzQFOJGqzjkIk5j/orwzFvnHO81GU4z
	RHaYpP1v5dT9xp0EaOyjLAgwFe5YFgsIlXn+aaCqT6qOcgIcZjUPv7sig+4hoYRgpysmg7
	RyMYKwJWAsl6Wx7G26Cn9P/+BurCHSI=
X-MC-Unique: s7psJOiJMEKXIMD4acaF3Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f574Tgu6fkzaOnusL3WeddVgRACcEKiVWw3Q16DfYOqAI11U95uRnpM7vlDwcY2Oxuldn1F+1XtJh1Gn+dxbYSnLCl+Imp/cDKf1jywX1ybMK5Prj+zhG5HA2keQcBYUIobpNwdncJnP8zkF00prUYQnS/wmN+BDMd1CZ2Mpf0n6HJh0o8Wzr44SGMzlU3FuOVY5hDQAEcbNqf5Sk2AT3AEBuTAmKwCS03zPOsFVzxpwPDo7vxgz/E/vw4QiwNKRk1cU3nqaRslad9rORmA2HWXB46W9eJeNSknRbw4PPu+4fqNJl+CJoBnPeXNCmt6fWOrYJCzotCd8b2kn7nkegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aadmc9oy/kekIDpUESR5X2aTVRaZ+suywBUfbquNEK0=;
 b=ArqhjwoxnuGYDcTG72d05PFQmF2LlwTGG+X2PrpFfiqlYXi/YGi0qEkuXTdA9g/wHk1hHGGFiy14v0qMv3I/mMaYP0FRgBxav82Mjf3Uij38SZbxmC2rtWySEXWI6/sEEXo3fe9FqKe+e4xxwvZH4QwXdn3OhpaNEqGO8wYJQV02lK6HmRU9M61hIB5FkIfO1ySbVshsz5pkgTXdMNqKIONgE7BlHZB95VZ/RfkrHsbFOMsVKOM7nSz2DD7ZK35LIQdF+4eI+A+KCD7T2vnOjGGbzDSQ0a2EJ0P+bNqFrBRrnihuupIB2O520W0mgXt54G+wSzUc64OrGwjDHFeuSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <329ac1cc-85d4-7ec0-a23d-a3f68c2864f4@suse.com>
Date: Mon, 28 Feb 2022 11:20:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] docs: correct x86 MCE command line option info
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0024.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa47e653-20a3-4416-6a7a-08d9faa3e1a0
X-MS-TrafficTypeDiagnostic: DB8PR04MB5801:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB580187405BB26AA000183DF4B3019@DB8PR04MB5801.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BIcuyNaiF2zLeIRFJ6yzpkluTU6BPQgQlMOrjTQE+eHC0QYjRft0iVmy+1HhO7u2swItFZC7kPH94YlKACG9YwSwaXxpDY+YIXP30bO+xVqItyq9dLf1i+hu7vDlVDV+c3hNTcQxjEzHHjL1LyhNiB859rdh+3flGT81RpRRyH22aHUGpLIhv3URduH8lmXs7ET7vW0lKzk/OeTBbveyj4rDtEWYZlC/y6dTTR9egeJVtEFuhJWFNhIzjvbrttqx6VJvwOgBpJUjeNZrYW79fXNlpC6ldLE8Hw0ySd1gbRpjlXCWzYlrGtPoOaz6AATlCOj0p6cGT3d4nT9GX8Nxl9psq1NJQ94+Xy1FD2WfEBSPlBVTDlzKAstoLY94Y7ju3O9wkEM1r85sNxm0+IJUkKjeJ3VcqbRvk6vIR355Lgo+SucPasVRa3RV0ubt7fMyjdiZKhKjVaanK5vL4adk0QGYrcXAAgF0Xq6MVCog2Jc8H9nwj9rB1lsHqmOcJiRgBISIQZ5uHhi2q4WSooJ5MoHMXCpPPK4vfkwExnzs10MsatEn2lZ1AZYQIokir8oxHwIgrKgUOP+sSGIGXX3lDxsk63FloMHeTyfkQyGOJqGj3JnUEoj1D6AVnvqCUNQHFoQYCnUInyZY2gnenqOGiDDzjOsXfW3IWKJBNdW5HA5oDNRZzP60P2Lrnv5JpuWBY+eUHdpiPP/uXYldRzpGD1wlYK9cwOqKlWL0xCG3Oq+WrqyQ32DpMcA4ZyMijCPP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(2616005)(4326008)(6506007)(6512007)(36756003)(26005)(86362001)(31686004)(8676002)(66946007)(66556008)(66476007)(186003)(316002)(54906003)(4744005)(5660300002)(8936002)(6916009)(508600001)(6486002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Unl5bW4weTV3U3BUdUNiTGEwNFM1ZkhFSDZuMmZMcVRPYmpyMlY0ZVdDT3Nh?=
 =?utf-8?B?N1NibkFLQzdrZXdPOUJsTnpWZTU1VTVsaWlPc25wWUJTQ1FYSW1oQjEzczVs?=
 =?utf-8?B?OFZ3V2kzMnh0dEN6TE5kOU5IenZ3UEE2TGpSaldHUndJa1c4K3duK29pLzd4?=
 =?utf-8?B?d05JVlAvbTJiQ1FvWUplZU94VmMzR2tNdElpcVB6Y01aWEZ1YzhWeXhZd1My?=
 =?utf-8?B?L08zenIvUVZSM3FSWG5IcmhSRlg2NXpoTFdzMUUzelRFUyt6ZzE4QlFUSDh0?=
 =?utf-8?B?MksxYi9nVklXQXA3VE9sdDlvU1VoSC9PTmNJWEl3NEhRblRraW94RVM1L1BR?=
 =?utf-8?B?UUtlNVE5eXNvVFQvWmtDMnV1cnVycDBraFZ1WWpOOUFsMS9CN0tRQ0hFRG14?=
 =?utf-8?B?K3NkbFR3MUM0RzdWem8zL2RZOEY5TXBCQmU4OGZDcjdUMC9rbVhaM3JJUzRC?=
 =?utf-8?B?OGllWVZFRG1yWGJYemlOQ25uM0R3R0Fpc2Q3OGFVbEhzbVpSUDkvNVllL2pi?=
 =?utf-8?B?OFVaVTd4M0FlTXJkRlhXN0MvSzVMSHdjQUZQbytDcEtiMFZEdE9BNWxJR3Ew?=
 =?utf-8?B?MGVHME1ORnhKS0ZPOXVIUmpwTDd4Vms3TnM4SG5uWWJTbGpoL1VyL1lGNXJP?=
 =?utf-8?B?Ynh1eVpxSXM3ck1pYS8vdjhvdzR4cjRLeVVxb21kTVB2R1AvT2pveGZlb3pX?=
 =?utf-8?B?VTJLOEhESmk0NEo5QzY1UzMzeWRQMklTQXdsY2taMXZUeXFYZm5ZMGhYclFq?=
 =?utf-8?B?ZXc2OVBudXVmQktwbEovM1V0SFgxT0VBcXlIWDU1VThVTnBhTVU4NzlXSDUz?=
 =?utf-8?B?SEJoSnd3WW9tQWJ5bGx6dVJRVGthS3NNd3J1ZytJc3N2SDdPS3hhZWFYckJj?=
 =?utf-8?B?Zjk0YWxxME5OOFRUZHh2Q0ZueVVrazJEYkY3NGZPcjZyQS9qMnRoZWlYK0dB?=
 =?utf-8?B?ZkpPdHlFN3g5UTZGMzNidERhT00wdFIvTlNiclJ5Q05uaW1GUFNvMTZ1bEtK?=
 =?utf-8?B?aUg2VEhlNktxbWUwMFFYdnIvNW01SDQyZVVxQ0dhSUhKU2xTanA3VnZDUG8x?=
 =?utf-8?B?cHVaUFVCaEpiNUNsbXpnbkdMcEs0dXpXbVJya3l3NSsvTy9BbXRLNTYxRStZ?=
 =?utf-8?B?a1Mxb2UvcUkvVGgzZHJtMlMrM3ZsK0xyekhkWXp2WExZZEtaV2FYbStBbFVQ?=
 =?utf-8?B?VzFhc0ZnRlZ0a2VyWUNaVVN4UmNocWxSb0p6UjF3dmxQRHplRmtaQXd2WXZH?=
 =?utf-8?B?WkhvajhhTFNZUmVnTVRxNG9GZHVjL1ZaUHM2djhKK2RlVU9JOG5lVFBVY2U4?=
 =?utf-8?B?YXd1UW1OZGU5M2N1M0JOS2NGOFNodlYvUzAvL1dmbWxmT3k0eU56cWJSZG9m?=
 =?utf-8?B?SEN0WUlac1FLS2JKMG0rbkdtcGEyRVdQTktJN1VVUGhWSnZZQVZYK1Z5aGNN?=
 =?utf-8?B?dHVyVTJoRGVNeW1JTDgrWUZUTHRkOGRUQWMwOXZ2aE1sQ0g2UUlEeUNMdnRj?=
 =?utf-8?B?UnFDU3g0VnhEbFV0eW9Zc0tiNitzRldaK1RaU0t5ZHpxcDFVMUdNb3o1WVFw?=
 =?utf-8?B?UDBzSkh1Q0dSMG44RlJxNVk2MDlETEduTmFZQ21vMUlFbmFQNVI5WTBEdU9o?=
 =?utf-8?B?VHZvYlpDZzlsKzhhY1ZhUjlYUzJXdmgxMzJ4VkJFalpNN2tIMkN4Q2hKVEha?=
 =?utf-8?B?LzVFTzc2dTZkYm8rSXR0ZnRzSHQrci9MaHhuc2EvSGxyRVdMRDZqVlNXMkhN?=
 =?utf-8?B?R2g0dkVHWlJVLzNZU0JrOWRIcGdNcVEraE1UZG1uZEl2YkMxcGY0UmlHK1Rn?=
 =?utf-8?B?RGc5YXR0WDZ6bWlDRVpzQkpEZGRYSzZybVpXdzdSQ3IycnpVQ3ZTRW1NNFJn?=
 =?utf-8?B?RkhuNVJVTmRrNlhLKytCaXUzVTdkOGhzaHMvNXNFd29EbWVvNjlRQlVpMHZV?=
 =?utf-8?B?dkR4SktkblY2V29uME9hd0F2Nk9BQzh2VE0rQk9uZUZGKzlIOWo2cXVrTE1a?=
 =?utf-8?B?dzdzb3FLYSt2QlJ3cXBIdVBhWGZnQXBpd2txZi9MemkyUWE3cXNtenZYV1E2?=
 =?utf-8?B?bmFIelFvR0JvNWRyb2JhNHp5RmJUSTI1elZhd2JqcURobFNnaFVLaVhheU55?=
 =?utf-8?B?L0NIRUM3VzNYaEovSElBNmE4ejZic3NKbDVuWS9GNE5IbTlrTXF6bUo3cldM?=
 =?utf-8?Q?8IQklEhFHlA9/hEYdrX3B5Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa47e653-20a3-4416-6a7a-08d9faa3e1a0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:20:02.2416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06e3eFGpTQ85xowhZN8mNmAAnV6JkZiVPFcK8VCpZ1Johux781fYpGTxxZPcmI2s/fmgkuFj64QYbrGWjcd1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5801

Not even the types were correct, let alone defaults being spelled out or
the purpose of the options actually mentioned in any way.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1681,10 +1681,21 @@ one pending bit to be allocated.
 Defaults to 20 bits (to cover at most 1048576 interrupts).
 
 ### mce (x86)
-> `= <integer>`
+> `= <boolean>`
+
+> Default: `true`
+
+Allows to disable the use of Machine Check Exceptions.  Note that this
+may result in silent shutdown of the system in case an event occurs
+which would have resulted in raising a Machine Check Exception.
 
 ### mce_fb (Intel)
-> `= <integer>`
+> `= <boolean>`
+
+> Default: `false`
+
+Force broadcasting of Machine Check Exceptions, suppressing the use of
+Local MCE functionality available in newer Intel hardware.
 
 ### mce_verbosity (x86)
 > `= verbose`


