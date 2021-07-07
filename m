Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10783BE8B2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152231.281262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Uz-0008FA-R3; Wed, 07 Jul 2021 13:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152231.281262; Wed, 07 Jul 2021 13:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Uz-0008Cp-NG; Wed, 07 Jul 2021 13:21:57 +0000
Received: by outflank-mailman (input) for mailman id 152231;
 Wed, 07 Jul 2021 13:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m17Uy-0008At-Of
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:21:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1de5a09-3c00-47a0-bedc-69c5bee40225;
 Wed, 07 Jul 2021 13:21:56 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2053.outbound.protection.outlook.com [104.47.1.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-s4DZJzIMOkKEgz6T1YWEnw-1; Wed, 07 Jul 2021 15:21:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 13:21:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 13:21:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0140.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 13:21:52 +0000
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
X-Inumbo-ID: c1de5a09-3c00-47a0-bedc-69c5bee40225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625664115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fncpQ+McTCrlAfJoD70a97RLi0M1zPqC/GNQoM1kqag=;
	b=HhGg4bySulKqshNwg326YyoHHJ3249WUMUBLtvMrpqGYogHKh2Oo4/GVp3bJz5gPhg2I7h
	Xj/R+Mpk/KYkllyPu+UAJ+IwVvPJIaf/m/Bt5sm/zJMbiufAEx9Of2vPOie/GPqoeR8mw9
	KNA8vkF6RZIJJ101RLP4EIWCRDYGfiM=
X-MC-Unique: s4DZJzIMOkKEgz6T1YWEnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0N86sDZCIe98xMT1VbEClNpaGvTgaj7ZCZBOc0TAMZhX41GzpWkCLb0IPD4X1+GMbIrCx76keLDtw+bfY2OyE5et1XfLY5PFVUvnw1pAh5XC9rd9lH6hy1ibRzjsJgeZFbsylsP0NHqjpLo1orhJw/T2EAFavOyMDy2p7hlNKrjlZv2MwxDBpGNzbAm4LlbBLvdIZqbLTVV6WofQSp67KGT7IwGqUsDu2YvAM8LvkYE2279yF4C7h7Vq9SQE1HPvUMkRnaywPDyPijdi+uZuhEHu3jMeelBoNNNKoQ9iX+wL3kgY5GXCQSVkCkSvBsDC4MeyViHbumY1QPGdfFPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fncpQ+McTCrlAfJoD70a97RLi0M1zPqC/GNQoM1kqag=;
 b=GrB2pUfZdnXi05f8vSmSaaV3MNfbpNYWwpPN2RUsw4zFkoXfDq/zosXWn5CqqiKqB8yyd5zw0iPgSj0sCn1mUFN9lVzeBmd/d+/hIm1S/OP/mTU3onbpiH9J2Ek0huCJ1cnZ6tA87OyEchAmLV8DrH4sEZOoqVzTDegg3nvDCkZOYStcK6kSZDJUwXMNNUoDf2zYdVUNHxy2eE8A8LwDf63dpDKcDwg1e32/K9jt4pqcgfgMkwYPSuZxX9J9SSk3WcTP9WDZnPxWZ+zk3a3rZZbmWW8NGitPKYzMjAUkBLLmln6CBbbBlp5g/TGZpM2N5QLl5TqtOqJne3cFRaWxog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/2] IOMMU: correct parsing of "quarantine=scratch-page"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
Message-ID: <dd85d77a-34c4-dbdf-1822-28612fe9f7ac@suse.com>
Date: Wed, 7 Jul 2021 15:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <95ceeea0-5623-952e-00c9-2c7f1a3459dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c58528c-8120-47f6-d3fe-08d9414a2f2e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744943F8F0377A954D641A5B31A9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qg/vUmxLKMM9vHcAhBYFhQg26ApQbEcRkl+kOwszdQl/lzmXa06+AmCeGwvYRVSK5gJcDEUBgbjN/bh3sZaiaTls6twrhCph9Ep97miI3kOGKN7XlPLXEoyPNHJZpPR8JdDmHAJd7VLxQ3Cx5ELwk4MsazWaxi86yEc04uxxMnHX+7p+SsrhOGJI/RriJkDnvfuEjWjevrIH4mbtd0yYtnWcvZmqqJbUYi6y0qUsdF81BdRUZIhJUCj7zUgMEm264DX8aKxzn+IVbfaKI8+BL7d38ABiOWnAG8eLmAlYza+MHP0N5uzOs7/Qj2/0C55Pi0qT/c25Z98ZC/YSHfoZryN+fOHcFwL8GiRIF/P5ymOMisdmWkQnaRWjH54dfSzR0H8i5Vq7Q7Cs0N9PF0Zf4jZCXIwFcIBzzwfkhIHxjsqj/V1/0XRwYz3R3Ozi9ynb5SkovrQhqaPCcqrYYxPwiT5ANg9mZuEKvrB6IbV3ZcCv11/Hz4GX/pf/4tO976Ds9RIvd+hJbSFIh0GlqT/KYiVJ/jzdc4OkL1kTctVbAfVrEpoqIBqiwq8kZzCFCuSngYiv0isYNHgruC42CIGroffwy7U3sxIKdBK0m4f9OxbVlvql/i36JYUc8QmMjGaaStrEpoRyRZ3sDOltxnSwnAT/PLHDaH78RzHVvrWIur+We4NXvyLlcvdoUHcKIC3v4XujjAOJ9yU1j86TVn+TPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(39850400004)(366004)(316002)(2906002)(86362001)(6916009)(36756003)(66946007)(66476007)(6486002)(31686004)(66556008)(8676002)(4326008)(54906003)(186003)(83380400001)(956004)(478600001)(26005)(2616005)(31696002)(8936002)(38100700002)(5660300002)(16576012)(4744005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBsL3U3dm5KampFYThIdVJYcW04c2MzT05ZaFlMeUxCUmZyYTZna2F4RVRB?=
 =?utf-8?B?ckFwdjg4emlYMExCUWw4WWQ0MXM1NmxuSEhQeHJ4SUQxRTZWRWludlBCUWdP?=
 =?utf-8?B?OE05SUZGNEIzTkh0cXdCcWNTY1kyV0FlOFNGWGs3NWhPckt5VXkwRGpoZGhz?=
 =?utf-8?B?SGpHd0QrWGI4Szc0SzB2QkRGeVNadUtxcENMZlJsM3B2VTF3cUhabndxQzlT?=
 =?utf-8?B?TlNUNkpqaFRyN3V5bmdmVlJGM3hueHAzVzBsTjQxdlF2aTF1Q2tYSDNxMG0w?=
 =?utf-8?B?Q3RielJ1cFlQVUhPRnFEY3lLejl2M1MycWIxUXRKdjFrTWZzczQwV2s4Q3pv?=
 =?utf-8?B?OVJHam5ScjV1Y3RtcDVDOWU4WHlFT0J4Snh2ajh2UUpUSURLQjNva0xEODRO?=
 =?utf-8?B?ZFYyOTFhRE5qRExKejVIczJ0QlBwa1hVM05YN3VseTRJQ2RWOFFpNitiM2Q1?=
 =?utf-8?B?NlM4NVNLMGlFZjI5YXBaL3FzVWV6VGh1QjRFRVZoVEVUY0F6YlM1R1gwYkxV?=
 =?utf-8?B?V0hYeURERHB0d3B0L1p6Wmlxc1FKd3YvMlY3NXlHN2EzUllBSE9zOVV6bGFS?=
 =?utf-8?B?TXJLWE5wNExJUUxLVmwrZm1XeHVnci9hc21hVXdaUkNXUlVwOXlmL2pJM0l6?=
 =?utf-8?B?Z21rNzRKR2pBM0J5YW10SDM4YmdPUGUrYTRqd3VuSVJSTmZQazFTLzN5UG1B?=
 =?utf-8?B?ZlRTRUFublpIeW9zc2VYZUlKT2xUSlE4LzQrdmZJWlhaaENsR0RNYi9vNFlw?=
 =?utf-8?B?VDJSVEI1cEVhMHlaQ2RFQ1pDVmZCaGRvRUtWZG5hUXpYYlZNeVlNVXJRNWtL?=
 =?utf-8?B?S0N5dENTd25TaHhrc3ZiaGhzVUJzY01ZRFczM2x6bWpDcE9HUGs3TGMzOGwy?=
 =?utf-8?B?SUVBUWVncmJLKzNLMkpFRytzODZQQ2lCN1VmZEdkQ2xONC8yWkhydFRXcXpa?=
 =?utf-8?B?YUx1Y1BRclZja2hCYTM1WWxUb1BOb0lYM2FLQkV3MkVvT1pUVzNoZUVESlVk?=
 =?utf-8?B?NjVDKytxcFV1ckVFcWhqL1RNa2VjYnhOc2ZhRGxNaTdYUmVHTmM1aEdrTXd2?=
 =?utf-8?B?R2tjY3M2dWJmUFRwSHdVZEh3SzIvSlQvaHdxYTloQk1PWWhxYUhMdStMbXRx?=
 =?utf-8?B?OUN6Y1ZOSDRFaHgxd0x5QWVmS1hzNDJud2JNcmVjd0NxaTN3UnpvSSt2QWFN?=
 =?utf-8?B?N2lmR2lHS1MxNmkvT0lOVTUyWEVYbUFIcU50K3FwVW1jV053QVRhRmk4a0Vy?=
 =?utf-8?B?NFM3K3hCWFZGTXBDbk5wbURIaTlJdlN3dkd5Q0NiU3Z1TWlVQitYZm1kZ0Zx?=
 =?utf-8?B?Sm83WHhaSnBJYnhUK0JmTDdwSkRxOXVNREpyQUhYbS9OamQzV0R2TmV3V1ZH?=
 =?utf-8?B?UC9vNzc4UndPZFRmdW9vR1lkemo4ZVpqV2xUK2xmc1NISTc5Ymd3YXl3Y0Zq?=
 =?utf-8?B?eGNlN25QS2wramtFMjFjYTVCWEtEcGVDQWlxQU52UkJCVVNTM2wwWng1bTJr?=
 =?utf-8?B?eEtiR3VuUVYwYzVnSnd6YU9lRzVmZjBpQ2xjVVNvQUsyczVCTmkvK25hYVpQ?=
 =?utf-8?B?ZjBuaXpBalhrc0FEWXNySXowd2tqeHhtYWUzTyt6cnNLbjN1OG93dGoyMkFF?=
 =?utf-8?B?Y2tZZ09uU3luK1ZzUUlQT3BlaGdzbHRxVUdUWGVUYTgzRGw5RnBIcWZvdnQr?=
 =?utf-8?B?bWVQUU55MVA2M2ZndHZ0Z3piZUNUNkFibENCWENhUXdnSlE5cVJFOHNiT2F2?=
 =?utf-8?Q?MUxYBi5kDK+bU0W2nDVRb9TObnqhPZMjMh035g6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c58528c-8120-47f6-d3fe-08d9414a2f2e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 13:21:52.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApOQcDRSAs1oXp96OUXmq8PDBHZnhrt+bVRplm2dv6NvJK9bDujBJg99/BmZEYvYrAg8HWKvv4rZNQFw1crWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

During the multiple renames of the sub-option I apparently forgot to
update the left side of the &&, and this pretty consistently.

Fixes: 980d6acf1517 ("IOMMU: make DMA containment of quarantined devices optional")

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -82,7 +82,7 @@ static int __init parse_iommu_param(cons
 #ifdef CONFIG_HAS_PCI
         else if ( (val = parse_boolean("quarantine", s, ss)) >= 0 )
             iommu_quarantine = val;
-        else if ( ss == s + 15 && !strncmp(s, "quarantine=scratch-page", 23) )
+        else if ( ss == s + 23 && !strncmp(s, "quarantine=scratch-page", 23) )
             iommu_quarantine = IOMMU_quarantine_scratch_page;
 #endif
 #ifdef CONFIG_X86


