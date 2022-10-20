Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DB605B6E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426328.674685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS90-0001Bh-Up; Thu, 20 Oct 2022 09:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426328.674685; Thu, 20 Oct 2022 09:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS90-000197-Ro; Thu, 20 Oct 2022 09:47:18 +0000
Received: by outflank-mailman (input) for mailman id 426328;
 Thu, 20 Oct 2022 09:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS8z-000191-Ph
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:17 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d053341-505c-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 11:47:15 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:12 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Thu, 20 Oct
 2022 09:47:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:07 +0000
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
X-Inumbo-ID: 2d053341-505c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259235;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=sLE1jYGtVDN2iM2r1wkx0OY+wHqUvwNkuW/lzH9f3tA=;
  b=Ig3EFqPxTbJG2WJbHD6E1iK/s2UJyrgEyytLjzn86p3m2lxdJB9cki0W
   XYyfBWf1N0JfvqV1Nm38NeF2CBiiyZZRW23ALXnS9Mly9rnrR9MLz1hyO
   dlbekaSaY3gTq5QcUJrmoceWJzwLO9LUhtU+VJYEwN7GpRzH7utpF7oNm
   4=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 83161003
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AkV091aphk5asO6WNG+ftUaqpC7BeBgzWbkUOw?=
 =?us-ascii?q?fr8NTMMsldhBb0lAxOYCXWvSSMQ+8hVknGiFiWPDGKUnjHI174Syg+iHdmqm?=
 =?us-ascii?q?L1vGXYAEGT2FEbRijYA2jPw7qWV3YewoB1DdvFke2EZG6yNDDUiHLt9GQW2m?=
 =?us-ascii?q?Q/wci91Nupa1K2w/JwewC3X/LokLxurhaapOHarRRzE2PowLvkwe4JFwWwW7?=
 =?us-ascii?q?BBB+d2qGFYu5XwdbiOYVVgWs9CV0Woy+ZSsIWIWQG+mI4fAPH3+jTPk+LAOT?=
 =?us-ascii?q?j0c4gx8DcNtg+4P0A4X1jGEplxrMM4IeDdwgz1/gGdsoz3iS9TatrIeu1uG0?=
 =?us-ascii?q?enE9BeygA5CGAzO5Y0TKcSfLa+dERtLM3z7WuctlEaiiBGjfL/8RBHLCf0aY?=
 =?us-ascii?q?gXmuT/cf9y8wVfoBFNNzzGDQxV2Vt7I8jRfjRh7WEfhcTxaP/h12CanECTqD?=
 =?us-ascii?q?kdfkcjBkIe0hd9Ubjn2WK6PSIPwEtLklZSM3Cks+SZ8B4TBLsG1gFq3aBTDJ?=
 =?us-ascii?q?DgEenTOmc5L3NEF3uEtkoWlmNSFyZQ+6t/ioxbkwMy3vy/voq2djkKjzTkQc?=
 =?us-ascii?q?n6u05wxQtbWATZh8KoY50f5y7NQOn1GHo3Ojnxw5qsp/RDc2CrwH2lbtqOyp?=
 =?us-ascii?q?jmKBGrMFCoqYM5yGU8b16PP80pghgmWpn0MiPhYhrRDWD7Y7rzByyNhQQzhc?=
 =?us-ascii?q?UzQaNcdTxZlYwYZrOtRX7C6Fq7Pjwl8e1WzOV2Du3DmakEWPNDKOgq8DNXO4?=
 =?us-ascii?q?AMow3/rDQJ23gZZEGrI8eX689k/gT1+PrXBgOL5eHqekM+RENykRyvqmM1dq?=
 =?us-ascii?q?cTrXmscljn5gp0iRf1spFbMhrqQR+EIxa5Q574F9SNRFYGUeFwAsn9uglCWC?=
 =?us-ascii?q?QbZnAWpxA/SqwGmTT9HCtGbRMzZ6pcqZFYd/KHTQMwGvZT1NwgFUsAHiP0j7?=
 =?us-ascii?q?+H6t1qpcqncSOe5o4GxrGSL5KUsNhNJ5FwqTUu++GBkKcqTNOEOYIA1umoZi?=
 =?us-ascii?q?9qhnYVj8pUiV/INwU07oZchUMhMxhXwVazzn/0OUXmCDjGamuqwOt+KwwTS9?=
 =?us-ascii?q?xfq9tzYzB++EepFwaMLP6MGRNjBngLtBrbtOiMZEFHe+fe1QMyAGqQDNrHWC?=
 =?us-ascii?q?4c40u9CTW73g1crgwok2A9IEmFmVgAkOmJUpc5Aq80OJo//zOK1KUG/i4M4e?=
 =?us-ascii?q?kHz63Y0Js3pNXiABP6mGnel1jRQn8nmZLRHIH2IvrwNXL6XoSfQ7RlvmcngA?=
 =?us-ascii?q?TCUtzNMTWzR7zFkIljQytIH0qhl730Gu0OA8nUd7aw6GCF32nds09mG74Rli?=
 =?us-ascii?q?KhMpNTFqqm+52oIyaefFR5XXtg+AgH+EoIQLYHdu5CYLA+F5EbZXz3Z2FHMQ?=
 =?us-ascii?q?abzmVlQTS5dJNUeauQ5p2wHyQFNMvnRwCJfkuQhc3/CFQuts7MRhOO1yQJEW?=
 =?us-ascii?q?bMqmqaP9naeocQQbWpAaP7kUD6UYdU8mAJ1ySj/C3nn9P+WP1MmQHryAaDwQ?=
 =?us-ascii?q?RB+p3omeE1dVJlsoNwAHIFX0qPtrgdIYaG+W7nTTvOb12oJk9QFwSD5hNzBh?=
 =?us-ascii?q?wbuXDzQ0pR9+dA6yhuyhEyN5ux0SdQIT5+PQuSopWji5KgYeLCtFJnxaLAWW?=
 =?us-ascii?q?d+3ioCZyCA4Qh+RucEZ/dJ6Gfc3dzmAA8AiJOFFoxgBZbvjFXK9QcLi5cL5P?=
 =?us-ascii?q?29nu6tKziHM7JPjqu/FPGvBDLhRIL7g84gVBB6iE5CswXC0Q9DM5n/L9jrSs?=
 =?us-ascii?q?MYYWaKcg0bddGcw1cMNjSg9GytznNfSeGpZeODt3Kl1O2RSLIF3ZgeXL+VJ5?=
 =?us-ascii?q?gGwjzO/dKGV/A2nzUZN2W6vitKEDLF7/JVGwPdVYFfAG2iuSpbJOUo0UmA9f?=
 =?us-ascii?q?iKeS+xTbnVsHbrvrgsTaHXhuWPtvSzApFOlSBPVwAkeGYwHKzvkZN/Wl5V9v?=
 =?us-ascii?q?ZZMFuZS9o/1rwdP2pT5yIrYudntAW3fk0dNwBeFZJLWGn8SnnmCJlGiY1EhD?=
 =?us-ascii?q?kxsRTqckW+BXNh4JIbEaEHnl/750D6d9nMNDJoKpNdR2okfb/KyXKrXlntu2?=
 =?us-ascii?q?kJJ322ApN7uu/nvS3Gk8jregq/KOlbl2l6mdURkoKI+R6xwimTMg1MkP3O1P?=
 =?us-ascii?q?fc4At01Nd9BmWtOl+tX+RBoW1rDCdVg8oZ6yWhsA3Yd57PWWciG0o39posGT?=
 =?us-ascii?q?BCp3XSly6vgDOydo79xpbPsTU/UwV0fcU4BA7b4ZNUknJRPNEZ6FtfH+piUk?=
 =?us-ascii?q?DYDACDp4nR8Qnu4cu1E3sgj0CzLWHiFncLjM5fwY1jtyctkC6QL/MALtUG/Q?=
 =?us-ascii?q?fsawWHGXui3iHbv+HRXZg6JQQawz9y6s11elXG6UXVHoKFwrGnRbd+tpH233?=
 =?us-ascii?q?I8DLOvwp3lZ+3ApcwZhGz/PCVCJxTWS18LTxUBncMvpYTKu6aEaZ95BTR0qv?=
 =?us-ascii?q?oDN9PuBew10yjYMHSp1?=
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83161003"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeZO53io7Jnlay2MtWHmqzty8qQKBceh00qM5cAycGLPjTFwQf+e7xQx02kAWYc+lFpNz1UMUCLn1+AG9Lw+poJAvVTXeXdzDizW1x+8MhBxQmRVF8TNuJ1wVoPHUOgwUttM94+wdfSB3g8O2YpPe9G0Tabi+xsC4lP9KnYWyt0/AaeyL9ThBRvP7UPiCodit43xgkOF+BeB5m1lR4PkRxMbCsuGDVu92y0YLtXYM07IE2+15iIT8zARyqDaHIj4BTaDs3LCo/kgC70d6yUCmd7QANZJVHOX8lFn+xmGspotVbCD2DTxa0NLm5F89BC6q3qLSdILbOuBHiYGDL3fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vutzteqHd/d6SfnamA+IPie5GbMRgN6EDUq+i7stlk8=;
 b=RjakwPuZW4E5plKZvpdeSUDVZPXogZBhdI1oWgNS8vINbnodrBcDxxWUyl0Qa/i5y2QWCFnD8mAA79zB43yfrmhETlFT2wisf2dWHtyJ3m1z+fj+tkyesFs+UzxM/NKPWIVnGIP0uV9sQ26K7rXhcABZdPPiX0HsZzrj031QGxb6hjX4mKGTwQzQOBcKb+/1ZXUnl08ZhVd1pJ2OZt3QgtHqFa/4j6oijnSxC0aAJGY94dmFRcXwcLqh6TXvXdG2vy6O7mCc2UBCPPHNR/BQ1QxxrLxAS9jLSIZQ37zqG/+DebqK0sEEwcUKoNP7dflXulKXs72ARgQj2BWV9L5w7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vutzteqHd/d6SfnamA+IPie5GbMRgN6EDUq+i7stlk8=;
 b=s4gYQlEMj4X6EfV/Gs9Ec7wlYZVHbl1lUQ4gO/wEBPLGayMxPFAefPI6qum9p1TMroYBlpYe/cxE57FBX1rPmvYDmyY22/K7Fu1MjXAebitbtfdDGxogqQZWIg3dsKLEIEExV6TqmBSFJXkZLWM4FbqADvnHUFlWfdDn0gF3dD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 0/6] (v)pci: fixes related to memory decoding handling
Date: Thu, 20 Oct 2022 11:46:43 +0200
Message-Id: <20221020094649.28667-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0385.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::13) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7472bcc9-e1a5-4401-a228-08dab2800d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KgJz2OfqgqJI5GQWhL9G012j4hQR+jlEVYuy72Z0RMssxVOm8wfIwSj8gLx+lDP6agn3jqNR5W9yuZ6VVFPUGYNakdN95MZH67mGZOXCAqk5DnfVOTBPdsXHMxic63BVaEdvCSsx8mOVJEPN5+xT3mSlxxVjjpPzCmReZe+8oHchrZ27uom3IfrPPRQq1xQ/sDxrysJRPUMlp4/tsN8KWsDPjTMk9yPdLATXAxL/PAMK9ty7WvcdsvL4lLlGkK6ZRxWQiv7fX+C5IvEtQxeVXWdT8w7Oe7Y2SJb7tK0p6ZVkxJozJ989+34ZK1wCkpkF+kqJLq0iKfdboijqqgjEEh6vkfcSW8DX45czFooxC7uTYoQV9px8PZWPbzLOh2Mv44G7cjG7gc9le6+4mpi5/HK8J64SWerX5h+a2tr2Hc7Owo/oS3V2x/FtS6A8kQpSQV0jCXl6glLwPYV8l2+jIazMmoE66U0byulah+58rW9nWmZnLKdXHNX+FdcEGrJ0vOy7HQ7xZ6QMJnSlD8TsLqsxMPuiXZX+H2edY51DuWQgcyy7aKbxtv2P9zFuvTY5TZpt31abOPequNyxpi9scdcBXWKgmZQpqDhxdFxe+Ol+xvHjzTKFfnV5FxxVTw4gP/HumMrw875/c9UhpyO3btFAMDxES4cBYUGixRpfinnCnB/W2sVmG52eJTPDZJDKIZ7GwqQXpcKmGDWh+9/PsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(316002)(54906003)(6916009)(6506007)(186003)(36756003)(2906002)(41300700001)(1076003)(2616005)(6512007)(5660300002)(83380400001)(8936002)(26005)(6666004)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(38100700002)(82960400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0NSUVZZYlhEVG9TQlkrU20xK0YxSW9icko2aC9wcVhZam14VFpFQXlYaGg0?=
 =?utf-8?B?dFJ5dFpjOXZXVjBGNmloZ0ZKd0ZGQThXQmI3R2xGNS9xMHFPR3FpVmF0Q3ls?=
 =?utf-8?B?UmV5MmhlRkxGd0tvM3RYNDNUWFI4TkdkVVpBenZ2MmNLSUd6bWtMRkxuYnNC?=
 =?utf-8?B?dlhQSkRCVmxhVXVOUmxwbzVlTGdmOER6YmQ1YXE2QW1EVlFRSHV3UUJQaDhG?=
 =?utf-8?B?MHdVTVRsWlJBelJjVGRIRm1PUnBvR09vbUJZZ0VLTHd1UXlHZmpTMkhVcE41?=
 =?utf-8?B?NlpEc1UvWWlEODlGWHVuVCtEL1htTEVDWU9iMTNrSTdLaWxCV3NHeWFPSCtp?=
 =?utf-8?B?eGFQekwzY2JiaVFuWERiWXJCQzBsR1Vnc2dmbHdzMGhVWjdhSHFSQWxiL1hG?=
 =?utf-8?B?K0x3WEJPQjdFbXZWemx5NWlmSGlORitOa2VyUkdnVWtyTXVtcFAwcGtBd1Z4?=
 =?utf-8?B?ajZ6M0Fyc3dKM1k0NkNWMHVYNW4yUTRjWmRGYzZIVUxlSFlJQkJpVEh5NHZi?=
 =?utf-8?B?b1RLYlErdGp0SHBHYTRoUFhibTBZSVVLLzc4bVFPOG5SUm1tTFdkaWxWbmRy?=
 =?utf-8?B?OHlmNFA2M05lVW5qM25WT1djbktHbWZTZWN4TytnRng3dnNNc0lUWUtETFha?=
 =?utf-8?B?UERtdk9KcDJLbnFTY3UxR1hiMXVrczZ5SHk0VkI1RTgydlBmTUJxTzQra3px?=
 =?utf-8?B?ajVFNFp6RUFyb3FJdjZYMjNKbFMyNjhKTmNPZ3prTHJCSytqY0NwdDBYZjlK?=
 =?utf-8?B?djQxTnBraFg1Qk0wMHQyakRUSTRKcjlrMERZSG1sR0NEK0RVRUpydTdGaXZz?=
 =?utf-8?B?QVdPaDkzQTlva0l5d2NzQlF2bG5rT0hWaE1kRndVR3hHWURsR2EyQkt4WWla?=
 =?utf-8?B?K0ZwMHhtcnVUTjdhVTVFZlhZdHlYcGpLcHNYRFNmWEZJdDNGQ3h5MTRMMVY0?=
 =?utf-8?B?SFV2MTZicEZHSHhDOVdnWmxtR0kzUktzY1JTSEVtenVWMEkyb2JHdTJWcS85?=
 =?utf-8?B?TkdMSWE1cVQ2VGpyYkVTcEtQVUVIZG1ZS1hJOXpkMjF0OVhMT3QzWlRESFhE?=
 =?utf-8?B?SjM4UC8rUWJuSit6WFd3WW5zNHZrT1p6SldpNFpiR0tWR1M0SnVWWHRYNFdI?=
 =?utf-8?B?UmtJNWdFRHpCQkMzTFg2MzlMRlMwT3hBb2hGOERpNm9jV0MxeitUbm55MUZu?=
 =?utf-8?B?b1UxTUxJSTc5UmhsTGtrWUs3VmhndThwYmVza2pUSkM2Qm5wTGpvT3lLWVZm?=
 =?utf-8?B?akNNQ083dDg5RHk0STd1SGRwZUw0WFVXMEVUbTFIbHAwVUU3YVBTVGV5MWhh?=
 =?utf-8?B?cnhkQnhOb3hOVG02U0ZZWWpRa2F6azdrcWZkcUMxVUtxUFMxZURYZ0dMaXpj?=
 =?utf-8?B?WHVIblBMMkN4ZmF3cWtSOXFvRkhwc3FTZnJORlFZaWcxRjEwRlV5ODdRS0Vl?=
 =?utf-8?B?SmVGbEhIamtkR01HTGdDcGVpNzMxL2ZWQVRlMW1RWncyb0xyRDB3dXJJNUVi?=
 =?utf-8?B?QTF5bFJ6Vmp2N2JMcmJzSVJVZ0pMZ1pGR2lGWTM2NmhLVUVuQWgvNDdUMFVa?=
 =?utf-8?B?a3B6Z0xHYXo0VmdsL0Era0VsWU9UcWdiNWhqckU0ayt3eVhua2psY2thSzlZ?=
 =?utf-8?B?MlBBNWNmUGt2anBScDNwaUgwVmJMeFcvN0V6aG4xMEx0RlZGbnBhRkVZME1i?=
 =?utf-8?B?S2RzYWplUmhDWEkreWVoKzJCeDV1Tkh1SlVwNmk2K3RGcHJ4aTNmNEczbFNa?=
 =?utf-8?B?bGlKUDd4UnBtekRub2MrelVqNjAxTGpVdUJoZEVoMXFzQjROWW9oaEIxMnph?=
 =?utf-8?B?dlI5OW9kYmwyRldMb05vNFJiK2c2UVpJQVF6QmlaUGNnbGhaNGJCcng3Qk1x?=
 =?utf-8?B?SytUM29JYjgraERlRnNSUGloUk9nT2lNaldnNVdlZ2N5bUhRUUU3ajJrcTl1?=
 =?utf-8?B?bllhQms4Ym9ESTV0ZGcvVjl0dERKNHZJWjlrNmlVL2lHM1I1aUFxTEhtaFRI?=
 =?utf-8?B?ZUJORkg4WFRqcW9QdmVISzh3WGcyK2ZWN1BMYWM0MEd5aS85U1owUk1ZVjgx?=
 =?utf-8?B?MUcrZDZjSzEwUWVQSE8zd2JSRURaL1lMUkFFdE41ek9Rd21CdHY1b1czZ0F3?=
 =?utf-8?Q?YUaHNa5xHurFkf7d4mCG/yjc/?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7472bcc9-e1a5-4401-a228-08dab2800d54
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:07.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAvgeyOwJDC7x7TB7iqJHvvU0pOK9XnNC1DXeTfEz3fQtuYuewaLUXyjWqrCE18yIT/fE1Aozbx1DYckpqELsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Hello,

First two patches fix some build isses that showed up on the vpci test
harness, following patches attempt to fix the regressions caused by
75cc460a1b ('xen/pci: detect when BARs are not suitably positioned') and
the last patch relaxes the check done when attempting to write to BARs
with memory decoding enabled.

I consider all of them bug fixes, albeit the last patch is not fixing a
regression (since vPCI code has always behaved this way).

Thanks, Roger.

Roger Pau Monne (6):
  test/vpci: add dummy cfcheck define
  test/vpci: fix vPCI test harness to provide pci_get_pdev()
  vpci: don't assume that vpci per-device data exists unconditionally
  vpci: introduce a local vpci_bar variable to modify_decoding()
  pci: do not disable memory decoding for devices
  vpci: refuse BAR writes only if the BAR is mapped

 tools/tests/vpci/emul.h       |  3 +-
 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 38 ++++++++++++++-----
 xen/drivers/vpci/vpci.c       |  6 +--
 4 files changed, 34 insertions(+), 82 deletions(-)

-- 
2.37.3


