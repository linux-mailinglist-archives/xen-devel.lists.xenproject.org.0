Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B6F46CE20
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 08:09:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242043.418688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mur3f-00037S-6g; Wed, 08 Dec 2021 07:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242043.418688; Wed, 08 Dec 2021 07:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mur3f-000356-3X; Wed, 08 Dec 2021 07:08:07 +0000
Received: by outflank-mailman (input) for mailman id 242043;
 Wed, 08 Dec 2021 07:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mur3d-000350-UP
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 07:08:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95fa9018-57f5-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 08:08:04 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-9lSsu06WM9a2rRRjWzTpxw-1; Wed, 08 Dec 2021 08:07:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 07:07:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 07:07:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0292.eurprd06.prod.outlook.com (2603:10a6:20b:45a::23) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 07:07:56 +0000
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
X-Inumbo-ID: 95fa9018-57f5-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638947283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L8xhJDuukGRfkPNu3aS01j7MNMt5iGb8QYj0Giu0wyk=;
	b=KS84v+4I//LCePc5s91UZSYTpyS4aeUE1K8C2tWVq+trqXXh8L+o9kjqy+nInOR4/68w9S
	SNd1fi5QqnLHQ5f2ua7zKrjQutcTdCRN9CKL3mWZ/pCxODs75/Oh9nbPUJr9dEUqJOZzv1
	FSauhdem4Tw+3sHRRlZZ09pnzcYTFtk=
X-MC-Unique: 9lSsu06WM9a2rRRjWzTpxw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFumr+fFG4O48CqUiO0j3/Ux5CbgWy3mnYoh3kIK151DBRMdp7sSVfuwrlNcZ9NTq+qoFFSo0WzcL3qbiaekTNUwJEy+D4Yw94vT96zntjyUHr0Im+B4Av+xmoSMFxoq9jrS4lnxyKVUKbXD61M/+02k2/bfaUeuDZk5Ki+EoDRUBRfk+EYP5f5D9qf8TfXjHaPQW2Bf+QzKoYQtJYVO5XF0p0V+8IU6KYlHyL5feJYkbTMRGExnkMEDkUhIFMkfbZiEcht4z26Vs/e6V1zgVW2d+9PNoFrFz6a4VaOR5e2zpJ8JcLHuVuJOeNeCuion9kAVQB7sQvvku3XFedP79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8xhJDuukGRfkPNu3aS01j7MNMt5iGb8QYj0Giu0wyk=;
 b=WQWjfMvHfsZ7OEUlbpjet1dqEotoER46p0u1N/cLX+3gw9tK0Y3jdIx6B1oggzghKR4igWjvyu4fwXx5Rrikz2a9eMu11Vj1Rd6hqTdNXPBXK/rmvlHx9A4lIWWZxQ6TI/vwVrGzkLQYyLiVRL2ky3jZJekkRYuZs3KLwmxojhyJ3jBZOZuXSZBQnL2vgI430URC3O5g0RcPY0xM+LfZRUKBbY+3zDFVMREeQGyGdyu6HnQM3I5C2gSAvMLbjaJcfn8PRygZ34iqaSqp4T9mMiuwl7/C8PIBHnXBCrgoLxjmnmO6XH+upDsc6Mk31oFv9PbBXfsdnYIxyQ2SJuJfdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e47c7976-dae0-4d45-e0c0-f845e5522f1f@suse.com>
Date: Wed, 8 Dec 2021 08:07:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: widen Anthony's area
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0292.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fc58719-b4ae-4273-3f0f-08d9ba19761d
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6173BC03AA4B614735E3AA09B36F9@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FTCYm4xtUmgepaMljwLcfumXSp/NV1rcAxaZLXFU5RezepHjnhziwanmkmqtLiRrqaY0Flyft7Dj5YMfN2/HfJnDVhu9M557yX7f9XZ0lRSVLVt0pUwkERMe3nRjYnJUX2fw2VVolmm0af1CQiQPeAN55jVkz4B21iJS3qbUT+YcopeZEBG6xccrG/5vOuPXgE5OnXXgBAdqUfl3a5rmHA+/azDv/vXPEac5pPnME/SDxpY7RHG1qSjixF4Z8DAqRGd9ZHyQmu22EmoUq33AilMiQg7MY/JwCjJVApMGmotBAxArBjX5xy+DMLVdFS5EVF9raav1Qa4wS97PdN2Ma0D77jafPelzA5LTwsPuGA0v8/sDUEPwHHUUd4cTvyh73lUpnuiYHp8L/U4+qaIP1CxSJVeIrOBU8mc9lUXQetquSQ/hWk8DN6MWunpdAGjDHTI2puhDdnKpyWqXgBRyE4fWd0N3Fl+0Qy9Cg4V3OZaq5oiRuDddbbS03GYm61YYzH91NC+98UM7nCRgyY/nxLr2hY5hEUVnRZRjuPs+CRjQ25USG5fJK1s1eWUO58G7Htr2pbmTjv0f0JmxmL4+qE+5KDVac+Dj9LoIFHxxSYVSQfQSuJt1WCzLg9nv7oKbJYriUpOMFF2Y6yjaECsjHLVB///EibIEX3fKDP7q3w3spY9cwvEM7WX7Y3TWhpXKbTMD7L8yNrCtY9uJ9I2KBleqxPLA5zliuq/HiqTLEJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(66946007)(83380400001)(66476007)(36756003)(31696002)(66556008)(5660300002)(26005)(86362001)(6916009)(956004)(186003)(31686004)(2616005)(16576012)(2906002)(6486002)(8676002)(8936002)(316002)(4326008)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRUeUMwL1VWc2xKa25wTVk4TjZaR0NwVm41UmUxZmo1aVhJV3dnZ01Md1dV?=
 =?utf-8?B?cDhFUGVKaHZXcHE0Y3NVNys5OXRZOWZ1bkdkMm95WXlVMitpSjVIMVFpQy90?=
 =?utf-8?B?dHhaRmVSRXlvVFVnS0R6Q1BpVnJvVEVVcE1oYTBCeDg4WVNNYlRpOHpKc1pu?=
 =?utf-8?B?LzVCVzdMbXE4cUFuWjU3Mk1UVmJJaUdCR1pGN2UvNlBUcWtjVHV3Z1VyYlBz?=
 =?utf-8?B?RzhmU1BKK05tSk1HdFp0YzF4MURFdUhDYlBnOEpsOGtXUEJLdk1nd1dDS3Qx?=
 =?utf-8?B?TlZyOUMveHh4TXVNSTNDaTNmQnc1U1lZUUhaS1VkMjVRR3EvTkR2VS8wL1hz?=
 =?utf-8?B?eUk4NXgvRFFJd200b3lXS0Z2b0FBcWNTQUhJNEwvdEpEcUJ0QzQ5Z2xDQWRS?=
 =?utf-8?B?aFVuNXg4VmlDN0JtVWF2OEdRSWtnNTNTSW1hNCthRVFvWjMzbXZRUk4zSXU1?=
 =?utf-8?B?Y0I1ZFhOZGRlYjhkTldVUnVQV216YXZyay9wRWlzUWpqV05tWXRpWlRyQURW?=
 =?utf-8?B?aERpNmZ1aUZKR2tib0ZHcjRVK1VCTzNHVkw0UW5OQnQzUW9MWnhOUVJFNFFy?=
 =?utf-8?B?YjNCdVowaVh5ejFNZTQ5NjZrTHdsdDM4U3JQRTNDMUlsNnNsREdLV0tPYkNX?=
 =?utf-8?B?bFdFRWpCaUNNYlVFMm01eUZZNENWNUlaOEdZSnp0L0tkZStUZEM1SXg3Wlo1?=
 =?utf-8?B?bU5VVDVJMVZsWFF5ZVV6a2RmQWhIOTVqWVBhUWtsdGlYTFBYZDBJc0d1NW5k?=
 =?utf-8?B?RVlzdDQ3QVZMUzNBTDF6TnRrNU91VzRjWTB4Vm9zNGdCbkZaN1V0NEFESXkv?=
 =?utf-8?B?QWV4c1dXY3VKRllHNGRxRGptVnhxMjBXN3R4dzYwZnlQUytWL3RvMEVIbkpu?=
 =?utf-8?B?VkVKeXk4WDhjRG1kYWhlV0JPRkROWTE0a29JS3lKOXc0TDdsakJ3dW11T2Fm?=
 =?utf-8?B?RXJIUUY0ZXdPVHZGMTJJSHdpYzlrWFhTSmszZk1XQ3kwZzFCRHpoeWRFdWxz?=
 =?utf-8?B?aTczSXZ0NDVhSHdFV2ZkVmhlSlBEcFZhQ29Eeld3SmRqdkJSR0dWSkV6RTJp?=
 =?utf-8?B?MVdtdHMxVkN1QXorLzdpYTArS1d4bjRFVkJKUmxHMzFWZ0RsSDB6Y0lDR05H?=
 =?utf-8?B?Vk1RMVpZMk9LMmYyenZ1RmF2clJlYjFhY2lSQVB0eXRiZHFFZkcxd281SkF3?=
 =?utf-8?B?akptWU5iTzZvOFBjUUVzd1I5Vm5Kc3hub09QQzJmbUh5S2UrUGJxbnNYMFla?=
 =?utf-8?B?eEFhd01qVzNIeXBoNVVRaXN2NXZxYkJmeVMyUzRxU1RuMmp4KytETVMvWmxv?=
 =?utf-8?B?aDk0T0I5Ry9hU2RHeU0wem5kVmpWM3BNbjhocVRCa1N4ZjZOeUJlc1Z5cW5B?=
 =?utf-8?B?VmlCZUkrYjhOeDFOK3ZtUmJYYisySWJNeU5kZWtSd3gwSldiZmNIUGJnTk10?=
 =?utf-8?B?cUdXSm5OcWUzQlJUZ25LaVpjMXF3Q3IzV3BVKzhpblo0TjhyRmtXbWxnay8v?=
 =?utf-8?B?dEE3WkZtR25LMUhiMzdvN3VFdEhOZ2gyK2xOTDZkbEc3ckVLbk1rb2F2aFhx?=
 =?utf-8?B?YWFiUW1BYXZSTXB2NmF6SzlxTFVzL3dpN3duWGRReGI5Vlo5YkNJeGtFV3Bp?=
 =?utf-8?B?QWJvSmFUdkVVdHhWR2o5U0t4UXlDZklxZy9zOUN4SFNCMXpFc3FTMWR1a2RC?=
 =?utf-8?B?WHZBblBHZjRQVnl2WE1rWFhGM2JsMXJRZUw4dlBrNUNHL0FpdlN4RFRXRW0y?=
 =?utf-8?B?VHhzZHBpUXZQRlBlNkJOVU52WW5QZU94RDlET0tmSTh3T0Evd0JWT3J1VmtO?=
 =?utf-8?B?YWFSNlpMN3lHa2ZEa2wzQnpvTTFpbEdERHNIRjFMb3hJODErdjJlWk9OdTJJ?=
 =?utf-8?B?eU1Nak5MSUFhNjczSDQ0YlFZQ2VQNVVyd0tQVy93ZmVKQ0gwR0ZIV2J5VE9z?=
 =?utf-8?B?N21qOG1WbVh1WVQ1aWJQMHBwU3FIa2JkZXlUdTJZaVZqSmtZOHhuNzdQWG1O?=
 =?utf-8?B?UGZNTGhxTDFSUzY4dkl4ODVMb25aZG5saE1Wb3A5MVBTTFl2Z3dOdDEyR29w?=
 =?utf-8?B?MlU5QldKRm84dHRkazVkbTJ4dEhkQVZLTWEyZGlNc2lKSmhhUU5RNkZCZFpi?=
 =?utf-8?B?a3JFZWE4cVBJbVA3SUNPT2RHeDJ2aURzMkk3YXNReHljSDcxalI4MG9IazBm?=
 =?utf-8?Q?/uSmyCoTe5E5cGjztyVrnO0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc58719-b4ae-4273-3f0f-08d9ba19761d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 07:07:56.9851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t7DJKyyzoOGIoAUh1QsuiElaT9dQCBqcSXt+EWkhYDwRD9vlSqyQU0Gmy92nweTL32X7ITLg2IU0z6P+NqKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

As was briefly discussed on the December Community Call, I'd like to
propose to widen Anthony's maintainership to all of tools/. This then
means that the special LIBXENLIGHT entry can go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that we're still looking for a 2nd maintainer there, considering
that Wei's time is rather limited.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -375,9 +375,11 @@
 
 LIBS
 M:	Wei Liu <wl@xen.org>
+M:	Anthony PERARD <anthony.perard@citrix.com>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	tools/include/libxenvchan.h
+F:	tools/include/libxl*.h
 F:	tools/include/xencall.h
 F:	tools/include/xenctrl*.h
 F:	tools/include/xendevicemodel.h
@@ -393,15 +395,6 @@
 F:	tools/include/xentoollog.h
 F:	tools/libs/
 
-LIBXENLIGHT
-M:	Wei Liu <wl@xen.org>
-M:	Anthony PERARD <anthony.perard@citrix.com>
-S:	Supported
-F:	tools/include/libxl*.h
-F:	tools/libs/light/
-F:	tools/libs/util/
-F:	tools/xl/
-
 LIVEPATCH
 M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
 M:	Ross Lagerwall <ross.lagerwall@citrix.com>
@@ -514,6 +507,7 @@
 
 TOOLSTACK
 M:	Wei Liu <wl@xen.org>
+M:	Anthony PERARD <anthony.perard@citrix.com>
 S:	Supported
 F:	autogen.sh
 F:	config/*.in


