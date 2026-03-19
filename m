Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOjAOlffu2lXpQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:34:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8C2CA609
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:34:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256983.1551436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Bdr-0007y3-Ux; Thu, 19 Mar 2026 11:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256983.1551436; Thu, 19 Mar 2026 11:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Bdr-0007vq-RR; Thu, 19 Mar 2026 11:34:19 +0000
Received: by outflank-mailman (input) for mailman id 1256983;
 Thu, 19 Mar 2026 11:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PKQd=BT=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w3Bdp-0007vi-RU
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 11:34:17 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e67a54e-2387-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 12:34:15 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB5687.namprd03.prod.outlook.com (2603:10b6:510:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 11:34:10 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 11:34:08 +0000
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
X-Inumbo-ID: 8e67a54e-2387-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSjOs5OpRNbUIzinDsJeGHS+7j7B+qKqXnJD/mme9LKGksuHYQ8ReRD64YZN2JCxRWhQs2P3RDaKC168LOznISImCC/iZHXa32QozFKreS7DgSXW1OQyVJZJ+BqrHhXYvEEAzwoFKoiogYYMBCe95p02Ek9M2ZgHEOhwEA2WowSIo1PPrwBzzAdG3tz8PgUgfdyfxxYp4Gej/PcQsqxFg7K7CXoqPm73TG97E+IlPo8FsEup1MGile3OAN1ohQVEHfxZ7kBs4qTb818MgOMD7d8FNXhZG0wT0wwcinT4nxT8Uxb71gbBfyzEPzYALDi7VDBtjh60MZtGjZE5t2UvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET/koLEDsPyyNhHOJelRlIFI8eLlFU1aLVYQI3zloos=;
 b=rQGf2gry9fzXPsDDcNj+Jt3bdqvkhNfHaXoed/R0ER27KaulmpAC2PbXSYs+EN6aSfLIajcCM0pCHPRNaslvYHStPlFp/wN89t+ogFdgUql+1brNlxOr+pFqj2yYBUol0XqXK0mbmoSve/03SuGnSuNq7nYWTD1dJ6eNvhr0leaBiHv6AlyHdtrSRGzSQuJj9z0aG8svRUmUvjO8ZgqrhXGfEBcgwpDELH9knZYSalfEWmZb4EsGtYQPzxAPxpOLfFtrn3HD8uSseH2HugrAWSx1qIJiM1Iu1/KsFkcVxYhTSnm5IlaQ7oEa6gI/To8eH+igRn8acPfvXgPZqKdZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET/koLEDsPyyNhHOJelRlIFI8eLlFU1aLVYQI3zloos=;
 b=HK/5IIJJ1NWESyN3P4WKf/cKfcxxAT4/FjqiTjMAkMFb9YK2SgDby7Os5U+AljpRDvDpJsPHrheLd1Q4itC0VKWebDybXJJrtYpSFsmtCk9B/51moWLCkcQQr/zpxxSgJYXdEHQFviaz04q0rA1EXbYo7h1R+Sp/8tMWfQqc1mU=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v v3 6/7] x86: Remove x86 prefixed names from x86/cpu/
 files
Thread-Topic: [PATCH v v3 6/7] x86: Remove x86 prefixed names from x86/cpu/
 files
Thread-Index: AQHcswecdmV4lKk9K02HzyxI1bzrs7W1njQAgAAj5i4=
Date: Thu, 19 Mar 2026 11:34:08 +0000
Message-ID:
 <BY1PR03MB7996677156E710EAD8E3E8E0F34FA@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-7-kevin.lampis@citrix.com>
 <24885daa-5801-4e5b-9d16-bac70bab4f0a@suse.com>
In-Reply-To: <24885daa-5801-4e5b-9d16-bac70bab4f0a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|PH0PR03MB5687:EE_
x-ms-office365-filtering-correlation-id: afafcf98-26aa-4bcc-ae90-08de85ab6f4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 352GUQYA7MKSpj7ePHTUlRO7+UsPxwdDkLkvBnlMUHgYL7iFf3znfP744RUqsZ2gKz3dKoLA/925rErzQBNnvbZDhbDxxwx3pm5trtqK75Rjb3p9sag9QjrVAJhvx5S2jJwv2k7fvL0Ygxu72Ot38YMvycFWJoKX46xynKPIamMPuvLCutUSJ3vSDo73BEOMavx2tTogrbXoWeQkWjsI+PIHlBNsbaKce15bDcbwuGpkqB+U2Tx33Y2R9YmWDepbOLYqQDIffQ5VD1DYVkNz027IUBwx0Z4yKWijPk+NLEyn1fJlUaibdLVjXgU7bh7gcMQCFvVNCjfR1cyHKuGiBSiPLQKRFjUgZyaXjR4+/hN0zcM4I3ebjjI+G9qBCR0OTQAG4VuWQxMb6wl/Y2kzI0Fvcma4u1EiPzVgB0Ua1Lp9bLalnbv6sjUz44qkXkrnw2NlpTFSqYrxbVF+Hv6KT9PkIoh2cvsH0JLd+anpZiI2cog0VA6UzB5HmEu12fzqtFDW/L/wjeqW0MmrR24aM56Fgce5r6x8vGMoLLKqHTbPmvmjCyscjc3mFy5vqkxbwpxFJo3aSNDUwAs2V6fYyOJuTxwAN+dm8c9iWcvEPNSicPmj0gMQyVwITD/j5tsMlEtn6wlP4dNLgq6eET56yP0cI6UxVTjSmzwL8znNFHrQBhWBPiPs0KWy8njxBpLPs1evgiItBMfv5DSeitFc3sDQ3S+4mkOBmpTN8vzryRq4WrZU2qv49HUrxcakksGtRJzDZJhOrz+S2kcyXMsnBrEwr4BZ1m+V9+uSfUFNy6E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UORyDGSzzPdKaU28UkiCqe74PTOJdkZLFKcS8ZwyAXB2h3Ax22QbSsCO71?=
 =?iso-8859-1?Q?YnW7p4d0qtWCsSb5T3Ei195aC1FKUbvnZnMsMWkDF8c6EZG+kvnDEfENEM?=
 =?iso-8859-1?Q?iCGjcWYRclpdoayhMbNAWgSvjP3V9gnqkgCv9EM2CIZTTz8xB9PkH5uAhq?=
 =?iso-8859-1?Q?1RG6sJRfzVrVU07KXXKn3SP63F7mNB/WzxOQG+1RQmOeRkWnkKC40MTh1I?=
 =?iso-8859-1?Q?RBoXXLrqHugEBRFO/Rj4V7xR0SScNtZYsDgkRagoAxWvP1QafxqyMcqgAM?=
 =?iso-8859-1?Q?/IiCLLD3HlBr5HLw1CAcJlhd1vXWo+ezKC9aWbDW4JLb3m7ijP0ScaDjSq?=
 =?iso-8859-1?Q?FDRcqU8bnAna54yZue9ZPA4X2mpwSaxrkNE5VHaVSxpYiDf5YVbEjl33hA?=
 =?iso-8859-1?Q?rDp1kPCiO+KT3P+P36g406/JWZ/zrcQLiVfh4VbeJloHx2KHOfuyxRgowg?=
 =?iso-8859-1?Q?9Q3XOSBKPf80WITZSB7IMtG34JDQLahnvw75dJk2t3jJdq4RR2BlUib08y?=
 =?iso-8859-1?Q?tzecunSl1HpEQrERWrzQRUX32t2E9fw9lvDKlqiVCrvdzn+sluGFhUCxyz?=
 =?iso-8859-1?Q?NeTYv5hQFgiQryzX4JoLPHx0OOfScgIHK4THRxOSQLTf0j/XQvD/zW9zUW?=
 =?iso-8859-1?Q?6C6rsq393KFqytHFT8w/i1aBtvR2zo1ySalbXxMvCh8usG+6t2UbyoePfc?=
 =?iso-8859-1?Q?f2eiJzJqJjsZkRophBq3yYFEiHzoOW2pz4EP+/ecS/Vw4TLs6LMom7smvZ?=
 =?iso-8859-1?Q?WKNaFoNzvI7CwPxJZI+0fJ0DCokUY0c3QYTH66Gi+QmTNRNUWZQZoRRmTY?=
 =?iso-8859-1?Q?GGfYlJFPpQOczhdR4DpPtxr4YnJCDWUjBUo7ajLsDCzeC3micjLvEfvfQf?=
 =?iso-8859-1?Q?4vOQNRbdb0HAHli0HlvWxvfGdhPL3JqlaCAin39H6iR+41U+3qhAxb8h29?=
 =?iso-8859-1?Q?OeOwuU2qi7e2xWoJyIvW0JS1UmeOqom8qWxQG4EVYz1LuX1GHuzhJJ47f3?=
 =?iso-8859-1?Q?+dS626t52+31sa0henLZlR6TpInHINzUhVxnLZLePduRUDgb8qZ9PRGsIb?=
 =?iso-8859-1?Q?dwdCDj73lBgtSCGriMeB4IncQIxVX6AnX8q9Q+3fYQsKFUQlvG5v5Z4xad?=
 =?iso-8859-1?Q?3+r5b6Pt4kcyerUT9jQs9FG21NpndujtM/XiQKZOzqwSKXP9iDj+Ey7M52?=
 =?iso-8859-1?Q?AzQi4lrNNi4jAsAuhILtP+6sqfIq2DRSJTZPpAJzlSDiw4lZx2dOpTI8vC?=
 =?iso-8859-1?Q?Lihs8aHpwQCpTVTOwyhHReza2cOeWq3iSpL1YWroiz1IS/FxD6loCibYFZ?=
 =?iso-8859-1?Q?4x7WeuxqbMoXUy5DPwnJ+wjq2j+MJukI6ZB7EvvviozzqggRfR+Ga2/AIw?=
 =?iso-8859-1?Q?QUCYEKYxBPUDwNn2cZdYQyh+FnIpOBz/C0LPFMTPzAp3Y6GeX5XEsAftSq?=
 =?iso-8859-1?Q?oMKhR+JVXVNFVZmNfutPNEn6pBb0dUvzBh1bBsi7ZslpCuy1zop2gZMjaa?=
 =?iso-8859-1?Q?yYoFKk2Q3wQbVPdgb3u2cClnIB9V46i/atbNzAn+d5fthuxvd1+D0A7cuF?=
 =?iso-8859-1?Q?x3Sjal/pw/SUNAGgu4a6Xsg0MrjAd9eA7fstBswwwCZIthwFeEzhrSAGzU?=
 =?iso-8859-1?Q?O/bl01foMqPNFpzbtgTHLZfULDPDZ5H9PA1wifl1IG0VtC5V1+5zJjjsmj?=
 =?iso-8859-1?Q?pM9aUll/DnmFjp1NrEv33Irp7lksGDTR3EsCjq96LbvzVTjoD0DIjLMfcn?=
 =?iso-8859-1?Q?LslqzKbHPKlTWBtrwKRz1McMSy6dUQe8WuFLv0xjZMzHlI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afafcf98-26aa-4bcc-ae90-08de85ab6f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 11:34:08.6124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z0uPen1SdW7arg1zXuuH4+N1mVn/k37V8+8h5yg0WnHURecNwnbTD2swVSBL4Zfy4ePycNw3scX68oO7xAiYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5687
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,BY1PR03MB7996.namprd03.prod.outlook.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 61C8C2CA609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>With that - where did the ack go?=0A=
=0A=
When I post a new revision should I add the `Acked-by: ` line under my `Sig=
ned-off-by:` line in the commit message? Is that the right procedure?=

