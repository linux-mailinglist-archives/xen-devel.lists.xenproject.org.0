Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71A47BC89
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 10:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250236.431009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzb6Z-0003yj-V3; Tue, 21 Dec 2021 09:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250236.431009; Tue, 21 Dec 2021 09:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzb6Z-0003vd-Qu; Tue, 21 Dec 2021 09:06:43 +0000
Received: by outflank-mailman (input) for mailman id 250236;
 Tue, 21 Dec 2021 09:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzb6X-0003vX-LQ
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 09:06:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f2c6f95-623d-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 10:06:40 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-5yioj75yMf6mNxQwcKVfpg-1; Tue, 21 Dec 2021 10:06:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 09:06:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 09:06:37 +0000
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
X-Inumbo-ID: 4f2c6f95-623d-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640077600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gH5MbTcJvT77Z9zn+XoYH/FASY78MuQLZhpJ0wDWtJ4=;
	b=aUlR/gh+ComP8BKbcFCi8NQzCC1LdCexst0JKiCfX7Inl0awDV1C6AfC4GKiFFpY/U/Y+N
	sqEAyWX8+bxy2rhV/j4yyX+SgGSJSghPRLNP8Il2gJMerfreKRfEqAdxRbW3mf2CRVBEMO
	dQAMKPgnSCpbjI7VqzKraJu8y3I/Kkw=
X-MC-Unique: 5yioj75yMf6mNxQwcKVfpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaazHE1ZD/pvbxk8TYF1PYkMDk6PmCj9zBeKOIuc1c6j2oLjp+IUomdIZK3mZeDyKluTgmAA26+65EBL7lFEneqsaDY/JocMxv/YkslUPo558br/HXsr++SPnIJ3Cr2OLcTNQnNS+mLtC6f0opCWFEBu0iyLh0HkH3N1u5OEubYQ4K0OHDQ5UKLCxzRhD2EypaOaEJZ7qz+lNjWFuw9vMXNLcmMYiXTslsJoTAN38o3jts1dh+xGEzHmQogj1O8kmH/OghX8mSJBCPb80S5LdpsAoLBy0hQ5Y3cGxx4WgZZ9UsAAN7BGl7AFiO0cP+GLjDFDNx0+NS3xiduRMV9fhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNuiDYRPGBvoIkiCKAuooGfZ66pPh+w/mWfHJKiN/A8=;
 b=PyuLzWc3cOMgXfORehZRiKb0fhSbqvyfMQbPXZQLm7pr9TvAuVpAwzg+u9nLo/QrwFEz07kqzjzlDdILSN1z3ZJAt/mnYgNIEMV5Brn3Hj1K5/P5hCUk/If1LZPJrvX0wERKQO+HgU8SoRZR0GGXJjZEGSFYR+SSVD+qkXASQAaWKxM8wovCWA9ulMo4V9e+hS5yRYME2upb4DlY9MkV/kLREQIaIe1fLRN2Tkx3TIruiNvgXsC4CpRdlLToQu/uHKyUH2uNquWMbNR7LALsPr5fOKXRpf3WBiwmso5fAXbI0Cshz5b/D4MoKrtuSEQA1zz+j09uxwmhiM/TvKwoqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8334f9e5-bee3-8090-595d-1d45c9af0eb0@suse.com>
Date: Tue, 21 Dec 2021 10:06:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 =?UTF-8?Q?Pawe=c5=82_Randzio?= <pawel.randzio@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] MAINTAINERS: update TXT section
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a4a6ce0-2148-4c76-798b-08d9c46131c0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192F26922A13C8E25A34CA0B37C9@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pQ46DtiwaR+Uas4i3EoSFUPXPWRvA/t2IntLdBSxZCbkzFuoRw9e1/jJSrJRTe4mriLoJbUiV85mNLhy61hIFQ5uQnGMCYPEb/o8Yod/JmhpesVnc0RQ2Y/CsDh6IuEkf+sMZf4dei7/v2tFyTM8xJt5DQr6XKEQNzrCoPS4LtIPscVTijb8QKcJwWCPajTMsytVnL880BdgmKEqcyGfhL0HCOkn1txhhZkGrONQi4a6Tc5OHfLH0cmJ0RHYKUl7Egp5K2vWRSiKZthPNHmJCLtcl2esBSZSn30VBwgAheOAVF+1SxRBag0LvvEWj38NdwZ8ANOO3pcIQo6hBmkmSHQU2vXIwRdTZenBM09HJ8GUBA0uwNmBUCphTuluuSy82pLNMM9Dj5s5tIZC+D6NCrJ+wALAHLh7wxIO7alLVVfxXgZ1Sg2m9uogSnd6kDXwPL5aoR8+NbVYWuNMdmU1hMaSBxpRfxx36KRVs1itUdzxetjYQaRkwHwyUP4fu32OXmmVfcSOxa8Hr9KV3ZNlm8GdIuTZlban4grfparIw3N4GZMpVvr1U3GTfmNWofxVKJRoAFcJRJwjLnRRMG+R8/ofAdxjGMTteUawHJQ46gGT3jOFmYL29qSiDhxjLWvsTKyw1kGZIjzKoLW4XdSnRZenZSJAkPTLdQdo2gQchvHC0KE2fk1w6tUw4q0huRnC/OH9BFS2EZyTYtttqGBxJ5wJDIuX7tyXukbVZtTE9hI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(5660300002)(6486002)(4326008)(36756003)(66946007)(54906003)(66556008)(6512007)(316002)(6916009)(2906002)(2616005)(8936002)(508600001)(8676002)(38100700002)(26005)(4744005)(31696002)(6506007)(31686004)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2cxd+QYP1J26TgZ0dKvIIn2r9n+RXxb54Gs7jod8UZJlMYnBc8WO655ETx8D?=
 =?us-ascii?Q?e8YRKRW8T+F2MNz63by+6sINgo5d3uo2XHzqhHXly+5MUGBSvlWo5nvwNhBg?=
 =?us-ascii?Q?9keiQubppBoYCyzfhf/nhrqHQk4sKh1ICLtDnvXNJ6gGJb3+STuuDEYlSvrY?=
 =?us-ascii?Q?Y7S+Wrcp9rpl9C7aRcdzXuv9ZlC4osUdKJJBvjtN3Jrn5icFcOWH4dAN9sqq?=
 =?us-ascii?Q?m6h7vGXDyE8xdOoB89QRk1n+50qaPS8QFOahhU1URPSYrO/Dyh4JTWy45cip?=
 =?us-ascii?Q?ALPDF49QYiidhA6ur6S2c1p/YOlVsQnrY8KtEBF8gvllir0pYw6T5ZCdU73C?=
 =?us-ascii?Q?iB/iX6f/hzzm+s0JDDgsEMnAHNNzbi7gG7/wUHdXVWHWphcooa00VGhIR9Gl?=
 =?us-ascii?Q?UA17Map/1GkX3x64btjfj9ZsnaWVITnY9cmidcTAIJFFy90c/dqVwiBd+WZN?=
 =?us-ascii?Q?g5TBRhxSI0q2t+LtUIt6IpDnZiuDivKjgO+8aIgFnmBYMd8esSAZW6GXPTOr?=
 =?us-ascii?Q?SyKJl64pPxWLHK9zCeHiLbniUsc8fqUbOiAp0CKsrU/vwM4kOS0phmIQzk74?=
 =?us-ascii?Q?cNFMsCv3KWm9C2gUp3+HlvbXyns8wxOMOyQVZCCRwJjuZsTIb41GvqEmKP8s?=
 =?us-ascii?Q?UIEJ2r8zHkuNRDPDU71+8nFl1PnxlsHnfQaKWn3XA1hLCzNjmkfZMXbGQpyd?=
 =?us-ascii?Q?WfPB2IFoCAAQd0FrBFkwPNEuyl5ossaxwCn6itSaSRml7VyI3y+YESTQs+ea?=
 =?us-ascii?Q?PvyC73lK/xWkTxE5MSMqpNGqM/BT40XVw7iW4TEpDxguPwhzPIv5x9YV5CeE?=
 =?us-ascii?Q?XrufPc5EbzK8DKEuyoxBN4Y57ZWGCgTHpNNsemdG1ScXyZHdF8e3n5oGSKsE?=
 =?us-ascii?Q?R9ax7xcaMYvDJ8+J/As39KAYQ5g6vaZo5d5Eq1uhVFoCCo/UFTkTNcJWnwg8?=
 =?us-ascii?Q?8gLGMTooEkbrjAyhfyHVVFfuUG/UgLux1/1NuPYWGzMCxVI8/xMSEmCQ5hXK?=
 =?us-ascii?Q?8k7YwplLypq+tk6bFUuac9mX+EToiEjTsLAW2hOgmETLtqATVobawqWRe0zz?=
 =?us-ascii?Q?AqyISKxlVqOMRo8w5xBL7hk3StfzzBzxon02g6tSMbFDHg/wJ9dmna1SZrDt?=
 =?us-ascii?Q?nR4ORICBj0zCbCsX5ieMUaPApFxaY8PDrlcAVEP1Xl7FTRVZMZ7lcWYvTZy+?=
 =?us-ascii?Q?ZUzSG6nT1Azvilspi/dSy1YS5CfBGWZu7GnDGfH1lafegQWYk5z+cIwroR7r?=
 =?us-ascii?Q?a24kOOGYNW6255sOc9d7iY+LJ/5HLSCCpypE3xBLm+St1vYB46SpDlxP0UPE?=
 =?us-ascii?Q?RTonUXPZ1DE6J1+U4LalCJE/n5PAi/mosFxd2nNUb2Vnij4KRyA+5mbBHiCD?=
 =?us-ascii?Q?9Bhh6VuzkDtVwHlnakfzELcKC3BCLg/c1ZoB5u+kKafKbm24eKi9nay114ZT?=
 =?us-ascii?Q?olzPsLI4IGZnu31etrDFK+hsHhe7e8G97QY2UExCyDOLEUhkmAixA9p5RG9n?=
 =?us-ascii?Q?mVC8kO2KXzc+F9RenJUdCLu3+iTJvwa7HXhtRbRNkK9dRVmB6F6KWbv8pufK?=
 =?us-ascii?Q?Q8JjlAFzRYc6TGDUE3jETtYBBF7q/W9k4qyj2mkB3NYd0Dq1IhRL0gtKZVJf?=
 =?us-ascii?Q?V3H5AqQoSwHfhW7fst60+os=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4a6ce0-2148-4c76-798b-08d9c46131c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:06:37.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GWsuD6F1US4JB/Q6L5KQw057MaTmh8Ixyer0wO1Z+FFdXvx/+TFe/TucYnlRXaqLq/6n4cikEwpKrzahImx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

Since mail to Lukasz'es address has been bouncing, Intel have suggested
replacement contacts.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To be frank, I'm not fully convinced of the M: - I'd instead see us use
R: for both just like we had it for Lukasz.

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -316,7 +316,8 @@ F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
=20
 INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT)
-R:	Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
+M:	Mateusz M=C3=B3wka <mateusz.mowka@intel.com>
+R:	Pawe=C5=82 Randzio <pawel.randzio@intel.com>
 S:	Odd Fixes
 F:	xen/arch/x86/include/asm/tboot.h
 F:	xen/arch/x86/tboot.c


