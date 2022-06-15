Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C792D54C53A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349806.575969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pmk-0000kq-H2; Wed, 15 Jun 2022 09:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349806.575969; Wed, 15 Jun 2022 09:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pmk-0000i5-DM; Wed, 15 Jun 2022 09:58:02 +0000
Received: by outflank-mailman (input) for mailman id 349806;
 Wed, 15 Jun 2022 09:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Pmi-0000hx-0j
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:58:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a298662a-ec91-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 11:57:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4298.eurprd04.prod.outlook.com (2603:10a6:5:17::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 09:57:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:57:56 +0000
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
X-Inumbo-ID: a298662a-ec91-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeIJ4QVahk2gkDg5j+Ey1ARVroEiwqOEOWY2qAJwkV0KwxxHT9maQ88n3bjBXSYBh1ly2D1B8oVshiXEaVExY4OetIIsrUkog790uwXRSMmD0NrXfXP74GhF4RGOow9voFV2/NyGsVrgRLhih7uotEijFcBclZOQLIRWOvgiUXP7SCyjzKznglYRGzzmT7dBC7oI0YtNuOE7eK3A0V4bDO26oGAPKsWKWhjsnm06vohWFuQgYTUp56l63NIudOjZg+glIU++fZAVGmRlhkceiseM8xE2g5cs3c1YSqpMPsV7O/SdJ+OsFdusKSUvbfH0sSksxkCf5DT+acMup7AQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l8SD8LBc//xxDpnquJAlQYw+Npg13rWMvOrTj4wXJU=;
 b=fxHi+NtHNi4xDukfG9rtq/shiBtDJR8yxhAjYvC5Z/Dn/8prWicgB6j4/iSKRII6D/4fDxqvCzM6KlFJcxFksFGMcaP4EduLz69hYXtn4ncnehV+DnUK8tpCpXHcGGb1TpCQDuzdy54MsSkuyF+efArKtvGoRJG2Jz7zQawbqJjSeD/d4PV6mMO+8qeLJIUVfive8xF+ecNv+RfKFwVIOr2p7zu+PtMO55OCFMZhF/Ul2RHs8MUiF/f1+uOcvLCGwXXgrJwxuEUjIPe1lkWHNWpfuEfdej99o0VGjsUo4jHF499whpzQ7YRYDVQVz/yHnCrqJCoGNu1QuH7nu6CadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l8SD8LBc//xxDpnquJAlQYw+Npg13rWMvOrTj4wXJU=;
 b=1mjL9OkKrlZezqgMX2U1zq6tfU/3U/tKyqY2jYVflMKBh9oq4hdAsXp2o5e4xx1z2y52tnnuuvbOeek3JRR2FO/vm9zpjD7RuGPexarPRTzpmkWBh7hdd7i0966Ff/tY5myzVScVKJA8ukqeDsqiVQFjrPyJ4lpvVkiOdUVoKE8bgKkeCg+PebAqQDA65YYtW7tABhZOwsLWz6EA89BQmBt8APzM/jTN9tMn2cCjpnp6VmFvEQjcX868LmE8c6X9dS1DpZYOqFQoGxH2x/Hkn+bcNYXX5AGAkXD+aEaGIBhISiHm60NyLExPVHaNtSZkEcO7tiEeedayqlIlKHxT8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Date: Wed, 15 Jun 2022 11:57:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0185.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73180e82-78e2-4425-fbe9-08da4eb58542
X-MS-TrafficTypeDiagnostic: DB7PR04MB4298:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB4298B1420C4237BF4BA8C296B3AD9@DB7PR04MB4298.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JKowGiQBGFCmaFydive/k3cYJjz/eio12LrKXnCs8qMNWkSnX5kbmgAiKVjiRSrn0L7eXwF83IpOzDGwEDMJZQWuPaueKCNLVv0rqBfZTZubn3HCudkQMj87kopH/E4A7khSWgOv4C3to0hzTajSkB8z8iZTuh+lelsU2JhMeGXKJqV9gCYSGJs9/UZmg6YUkL7JvnojfTK77kwP6CeTXqAuuY4rldtVf55Juj1J3D0cqmCVLd8hJTF0UGXIrVyj+7eqy4GNep99IaC6/c4ei3+f5JpngbcdXHqN//cCMP7nAdj4NxGrHh3QhZoaCAJ00uTCxZS8wzda57YuyY9vY98w0VKw8qLPu606VBWMcCEtJL4jjK1rjAd37hg9PZQ4DL6D46CxTC/05+mWprTsF32d+q8FOMbJBaRaTGHUU/oPhO2HZlQqrPYl8BOuWPPfC8+gxCQ2SBFBr+0hyNBAYnEYXlYfdTzOwJkglrcXy/XVmp4+pJDg5WzHLQoxb2Bz+DEdFWsg5XPN3CltYwV+RTvssmVvilp5LrL6n2EwW96qiPS3F+k3LHEVdLcnw204pBjtGeqHKe1FZCMEp95N8UvPRid8lEMO4fJlls15anN5AorHucixQjWCfTK/Ffm1nAdlrPV5FZYxUJxnW17WlaCrwmSVm2S0uKL87GD5Al6ZPpebMgE7P/meIv6Qj0/mYe3ENOaNH9TbQHVjb8Y3mHWygnBwEfUkXSQRiJD+jFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(36756003)(54906003)(31686004)(186003)(6916009)(4744005)(5660300002)(2906002)(316002)(6512007)(2616005)(66946007)(66476007)(66556008)(4326008)(8936002)(508600001)(8676002)(86362001)(31696002)(26005)(6486002)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V21oV1ZXNTRIV28wbGdGdCtoMHRzRlpDaFJRYXA1NGE4UHB2YmhHdHYxMU1i?=
 =?utf-8?B?NlRaVFl0cWcvQVFKamF0Y2ZFemI2bVdSYS90dE8vd0Y4L29HcUZOZzVnUTB2?=
 =?utf-8?B?NDFwcXBOeHRERDBEQ3RPVFdBS1NmVkhURU56aHpEdkVPcmZCQUZSVEtPdFNK?=
 =?utf-8?B?bm1NS1R2d1Y4bURMZlQxejJ3eElJS3pvam9BVWIwSzhRcWhIcHhlaEtBby9O?=
 =?utf-8?B?TVhXays1K3JoTWZwZnNKVUdmWVdpdkkzOC9mRlNvUE1IdU5kT2p4djJEQTNQ?=
 =?utf-8?B?YjJiUjV4K1pScjNKN3RxRzExQUxQUm04eWY0bVFzWUErcGtPcG5SUEFDZ0hz?=
 =?utf-8?B?Mmc2WExHUDVPWHkyQTBGdlNLWkM4QnZ1bVIreUZNTUtCMnB0aVlGSnRUcUhR?=
 =?utf-8?B?RGdyRWZqOXY5ZGJpdnd2THZQcXpqNEVxMGorR3Q5Qy9NS2JHUjE0MlpSS2VK?=
 =?utf-8?B?NS9jYnpzRERxK0NiZExKWndZMXNkandPcm52Y2ZuQ0hiU1BDNWNBazMvbXow?=
 =?utf-8?B?YnFNcTJycm5tSllwWW1vRkVpMDMyWFltZE1qZDR2Z2U0OU5rUk5mRk1kdWgv?=
 =?utf-8?B?R1IrOEt3WDZ3dUx6Mk1kejg5TkVNWjFTbFNBakpyY3NhcFgweVdPNTM5dTB2?=
 =?utf-8?B?U2c1NnQ3SnhVZW5Od0NaQmVMOVJ3c245WEZxaDRHa29uZkQreDBlZm1ESyts?=
 =?utf-8?B?Q3BFZnVWSjZnczlDMTRuS2QrcTJwOVdQdTIzV25GTWoyek1kR2hWVytnYVZl?=
 =?utf-8?B?NGx2bGlqV1AzOWliRkRucVI0cmNDdTc1K3dWOFE0VEhzTXZweWxQeDQ4cmJW?=
 =?utf-8?B?dEx3RFpoM01KVG9meGdMNXV0MEtxMTRxUnJ4YlVNUGNPL2c5cVFJVkpkL2Fj?=
 =?utf-8?B?MjZ1cU5vSXdwaXJaQ2Y5N09OaFFiejFUY283S09aZENlWlRzRXUvTlJYWTR0?=
 =?utf-8?B?aHAzbGc3MmxMSWtvQ3o4UHgzSWFORGxYM0ZWVytiUUNqejdJcFAvaStjTSsv?=
 =?utf-8?B?SGhXdzZlR1c2SUlBeFc3dFZWT0E4by9oVnIxK1F4eTYrQzM5NExqVTl0RHZ2?=
 =?utf-8?B?UC9ySUo0eU9IZ3R3enRtdmZoOENjSGxrY1BxNE1ZR0lsVXEwQnk5SHN4MEJw?=
 =?utf-8?B?R2xUV3NUUk9md254a3kxcnN4cDlpNEU0LzdnT29DUFRHUWx6RWRudzlSNUFi?=
 =?utf-8?B?OGR4QlVaWFBmcUNWTUtKalQwaThTTnJtM1RONWpHWVROcmxpaTVyT1ZmS1pt?=
 =?utf-8?B?Tk1YV3EyWml4cXowSGR4WnpBM2piUHdYNDlzR2ZIYzVUZG5mM2czNzNVQ3dC?=
 =?utf-8?B?dHR2UHlQUWMzY1Myb1BSOHFtWUI0UFNEK2pjSnVGNHUxTUtiUmxTUTIvamJR?=
 =?utf-8?B?aGJKaUsxRFFtV29RNjg1ZUdUa2R1Tnk4bFN2R3A5OXBlNUlGTlhYbnZCS1Br?=
 =?utf-8?B?VWI2ZHhJWmRCMVE5VUZ2TnhvOTJqUFZvVE1DWmZxRzFsOW5KTWo0N0RXWFFv?=
 =?utf-8?B?eWpPTE83YnBBUUR1bXJWdXZiU2lyT3FJYktuMVFFUzRWdnhFcXkxemdWN2ti?=
 =?utf-8?B?QW5ORzRMaktBazlSaE94cmZTVFpXTml0QTk1L0FNMTBsMTltVUxHNHE4MENB?=
 =?utf-8?B?M2FGUGpqeFYvUXJLNlVMQnozaDJRNjJTY1d4eUZPcThqb2VTeHU3eFZDUWdv?=
 =?utf-8?B?VjBuRXlDUmpBZUwwYjQzSi9lcTNVVDA1TndKczVmMjFxd0RTZWdIa0pkbVdY?=
 =?utf-8?B?MTkzbDAwbUd4dHZnT0l3WXBxUEk5cm5wUEZ0UGIyMHRMRmF5NEY0MjRXTncy?=
 =?utf-8?B?OU53MnA0czBETzZEZTgzR2NybytmMFZDWkF2SzhtWmJvUGdYUkpCTzVnR24x?=
 =?utf-8?B?UzlsYzhEVnJkanJneGtUSkhWaXBEMGxld2R3NkwxcTVGMFhsUS9tTk1mbnNQ?=
 =?utf-8?B?cjZncG5BeEVScmRpNVBYWVdqcGw1eGp5MVdRVFlMVGUxQUJqM3pZYzJLY0Nj?=
 =?utf-8?B?T3Y3MkxPNWU4NlFPRE5GelRRZjFScjFpclVNL2pQNVd2anpUYXpYeEU2cUNa?=
 =?utf-8?B?N3I2Z1g1eWxicHU3VUQrQXJSck5rVWkwZE1KdHZlRE5QcCtVRDZaWGM4WkJy?=
 =?utf-8?B?OERDRVJzRmptSUJxb1QveVVGaXFHeXZmK1VUMmFrYWkrRDEwOGNHeDlpNVdX?=
 =?utf-8?B?eWg1OGE2K1NzWjZveTBwdU55bzVtYWZDd0hMUFhPenpYT0ZKRVUwY3d3aXVw?=
 =?utf-8?B?MWgzTGxJSHp3NjByNmFhNWF0QVEzc2xnZkFoWHRuL0hNbnRZb1JrZm5WSmJu?=
 =?utf-8?B?L2xFRTN0NGtYOVEzZTFSVU4wRHBxbU8rZmxIaVlwdm9zUlZ2d2xGQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73180e82-78e2-4425-fbe9-08da4eb58542
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:57:55.9559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BP8ultQ9s0TwEkGWtJ2xE6WjCQeVaK33/QHpeKFc63bq8EO9xjciumjPQlaK8QFPMCOPIh2hFALxNfYhVI/rMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4298

... of the huge monolithic source file. The series is largely code
movement and hence has the intention of not incurring any functional
change.

It has now been almost a year since the v1 submission, without having
had any feedback. Some re-basing was necessary in the meantime, and a
new patch (the last one) has been added - even if seemingly unrelated,
it was in this context where I did think of that possible adjustment
(which may want to be viewed somewhat RFC, as I know there are
reservations against the use of -Os).

1: split off opcode 0f01 handling
2: split off opcode 0fae handling
3: split off opcode 0fc7 handling
4: split off FPU opcode handling
5: split off insn decoding
6: move x86_emul_blk() to separate source file
7: move various utility functions to separate source files
8: build with -Os

Jan

