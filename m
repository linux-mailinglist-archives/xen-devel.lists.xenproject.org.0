Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DB4CC332
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:49:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283569.482639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPodU-00047Z-Tp; Thu, 03 Mar 2022 16:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283569.482639; Thu, 03 Mar 2022 16:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPodU-00045j-QV; Thu, 03 Mar 2022 16:49:04 +0000
Received: by outflank-mailman (input) for mailman id 283569;
 Thu, 03 Mar 2022 16:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPodT-00045S-8F
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:49:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d44059bb-9b11-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:49:02 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-LvB8DWDyNe6zW4TV46aA6A-1; Thu, 03 Mar 2022 17:49:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7525.eurprd04.prod.outlook.com (2603:10a6:20b:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:48:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:48:59 +0000
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
X-Inumbo-ID: d44059bb-9b11-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646326141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jNG5t9DemTxExj0TLsZDFiC67KQQMJUNArdRlPUwPcY=;
	b=R4RtZPl6OHyWe6z9d9bWOtZ6l81Eo+8mJoQ/6A15Pg5h8Pufr9djWI88UC/8Jgui/jvBkA
	NtLz3qCcfp66tmfKgsdsQi/Pm5CklZcHt7nyunBq93QM3/En04szTYUF4qnYrhBDsGrCdB
	GdrBhvIAv1sZzzD+YYpXdS16i4QOHzc=
X-MC-Unique: LvB8DWDyNe6zW4TV46aA6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgQUW62nH+04KTFVEwDzjvTwvaHwVcLH2dFzv0GOxGsFGhFu5j8MzgUzsdYwMlC8Uutha6NmS41w9T984kD2r94bqL5bkSbWcsz6LsL1GHLHT6ZhpvEzqqPKfBQKxR4ALPq+F0MdstZUdgyjcqLS0JdbQmTn1PHnz/da+HeegVfy2JafFNKS4KV5UQftVKd25MIvQHHxvuF1oMxYwgzjNaiNeRyjofKBOnvV8SgYJht79T3oj+PZF48eq/9zNtfoA73amfjI68TmedACuDBYM+Qf+Rxb47Ei0KJfwkNjxPsPPZsW7b7nozWGgZgHPko+eM2eN2guYWryV+8eiJnjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNG5t9DemTxExj0TLsZDFiC67KQQMJUNArdRlPUwPcY=;
 b=f2vqq9QL1Gw7fLwvYpC8DUkXjYdVfYAk/HBiZdlaPj69cojM8FNgFoRZjJB9TaQrw/wbNTRMUIhCdQovVn1HHhhiQPLtXfewYfAhTUKyQlNtC5oxeMMvFry4nMhds8M5ZsvkNlXeG49T12AA0rf8rHRhcE30YTCV7lz1zDgxeXG0ySJY145/b504WAP8MuvQjKq79Es1Pvx3U6wXxs3XqIpBpBpjFc03Tadz+5Fnjdfna+5qxU8ZzYvs0MKAIhIX06duiDSjzBLapUR3MwrD/MOr8ZCF7EQXE794cpN7r1pN7MZC7bZnPNl9T+hcLBZ5X6DDP8B0B7UVKpvYzfIUuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <832ca068-5316-b4eb-60ee-aeff009ef1cc@suse.com>
Date: Thu, 3 Mar 2022 17:48:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: correct VRNDSCALES{S,D} entries in predicates
 test
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07b117f-16c8-47d2-e817-08d9fd35b6bf
X-MS-TrafficTypeDiagnostic: AS8PR04MB7525:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7525AA82F1C00B93F45D764BB3049@AS8PR04MB7525.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	piSh/FudPirWGT3VEXbf6zBupJhuJYRGRoaqiK+4/v85DGBqeue/kdqJeXMHkWBYcLKKtolspjXJ5ffrGjROm/0N1r+0yNGjnS00S64TIBt5WpqQLfu4g6457sxveYwJdc/2PR3jmOSA+DWLXnyPXaYRU52kemfKNJ3mJ4DzWkwNE6ibbbb17FRB2bxSu9G87jX3kiWDcfjrgieE5J3dCd6WGBUQQlygoqiP6iCoAGoQ2cDqs67aE3Uufm76AXr2JOwfeMosQEsrh8oftGdVSYlaKvDdlcZSvNPdAiz5NP1AfdTd8RZmFOPFhplVNh/jJcczYbHLCo3WB2nMJ9emghwJr3OvmIJmE8F1WZX9TlKchNjjyLxx0jYkHyCPIP6SITfaF2WBWh38bVyWvSyke7ONSTHw9EFPcxcbS4RX8gA/rbqKNsv7ynaAvrL1hXrAfidXgr7laCyWkkcgAnCRVJiS+0MVNdKxRpaMWEJ5OESlGvo4n4dvCYmpmkk+EfPeHpPS4DYrXehYIqHDX0giIZNmr32wPzfrdAE1xF5LSENPE33tqGvWyjGO3wE+FE4AD8jOrusmtYw8sqoeL+CzMhULpJad3By8O/vsJbxz5Y4PKjKonKtBFQ1+zR+JNeqQD3eiI2gCPdfCw1tzw8DGxGrIkxtOwQA/gGVL2SaPsMAkSGNOrbwfAVidyWe103N5ZwBz5IEGh4Po+gYV6bV0Erm2SGZd7rDR7Z/60QSaC3K5ehyCOKkbtU1cUNyKLQ6/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4744005)(186003)(6916009)(26005)(8936002)(54906003)(2616005)(66556008)(66476007)(66946007)(6512007)(6666004)(6506007)(4326008)(5660300002)(8676002)(508600001)(6486002)(31696002)(86362001)(31686004)(2906002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkx1endlQzFQWUZPSTFuSGFJTWNTdEc3MzNmQy9JYnptQ1h2N3dhZWZlWUo1?=
 =?utf-8?B?dW1NUlhSa3RHbnJiSktKY3VyMzVuODZuc28rOFlpVW9NOGI0WEFuamFPQXFD?=
 =?utf-8?B?Z1Z3aG4ydG1tT21YZURreHdnSWU3bGF6Z2psN2c2YTlHRmRHcjRWSkZZTEIv?=
 =?utf-8?B?THFQN1pzSXF3aXF0VDZ0NXA3UVlaQkt6WlBRc2lBeEtwRmZHdjBjcW16cmpH?=
 =?utf-8?B?alpnUUhTL2xlYkxHMUdQVCtsQmN2SXlmWnUvOEVEQlhicit1dkF2bW52YzBG?=
 =?utf-8?B?Rk10L0k5WTZrM2syRnhXcytpa0UvS3Y3UjdDUnV0bzlsb2ZBUTZFeFozYVlK?=
 =?utf-8?B?NjBnUjJaeTJwZW8veUVucnU2dk40enlQZnVaT3JpQjNNc2ZvazFsZnBGbzBT?=
 =?utf-8?B?ZkUyRjlXblpoNVpjNTcwWkdadFFwL0plMWhaTzh2RFQ5b20weW1PZWFsUnpN?=
 =?utf-8?B?SkpBcU8vY0dPZzdUUlg1VGVadTNRaEFaUTk0YndleHJCRlE3dXoyNjN5NTNX?=
 =?utf-8?B?dXdhNndYVkNISTRwbXJzMzVWcmZpUnJwb3V1M3ZwUnJ3MzNyM1V2Sk1wWjBW?=
 =?utf-8?B?N3BEQVlrSU9PbFZGL3dnbkNydGRYLytUMk5Gb1Q2Q1haNTdlRmNBdFlDdWc3?=
 =?utf-8?B?TVFuUU9CMklLQmRCZjd6bjh3ZytSWHRESEkxOFhsMlNmSWZ3NUFBMzcrb0l4?=
 =?utf-8?B?RzZDc0t6Ym8rWE56NDBvWUd6REg4WnZHQkJTRnJ2VGU1SHdLS1pQd0kvTjAx?=
 =?utf-8?B?RUM4SDhieWZoQ3lrZnNtd0RoTFAzVXhoUWdiNzVnS2h1alFoWlhyODhsWE5T?=
 =?utf-8?B?ajFtRVRzaTF0ZEc5OE4xdVhXRE4zL2hTSVhzUXZaSXpxbDFzaUQxaHlsU3NP?=
 =?utf-8?B?UUhHSC9MNkV6S1JKSVIrSEFtRGxRcXozNnNnakE0YWxkN2lkYk1OZVd2ZVhv?=
 =?utf-8?B?NTZudnczamdGZ0NZcy80OE1EcWhMc0hRc3QvR0M4ZTBJUDF2RnFSMjNXUEJJ?=
 =?utf-8?B?aDJCQ0hCZlRaa2VwV1BHSjhIWHAxSFVkRjg5eC9VeTlhQzFlWForcGhKR1Zh?=
 =?utf-8?B?ckRHMklkRE9lcTA2ZmpCZFFHYWRvaDFFTytXeWFiem5NWUdNeldQcUZDc05Q?=
 =?utf-8?B?RFh2L3I4djFtYUFzRTlENFVlaEkzM3dsWDd3aGVWdHVvdFBXZktRaFY4QVNM?=
 =?utf-8?B?NlJlbGdTYnB6T0pMM0NDakoxTCthSnFZbEJxelAyUXpJN3lZdmloTFJ4VGRE?=
 =?utf-8?B?TDFsYzZQc2QrZFhybndEU0dtRlRiRDFla1FkSGthdStublhXMy9lckdielVI?=
 =?utf-8?B?RXhJdnBLT1prV0gveFdVVTZ1aG5zaVJUbEtJcjdtb2poSmw2OTRaWHFYR0x2?=
 =?utf-8?B?S3QxdUJ2cTR0RXEzUG0vWHliSVdMZkdkTmFYM24xRHhlOVJwUXdhSTlGakFh?=
 =?utf-8?B?K2d6K3hhWVNRc09yNGN2SjhkRUY2SHE0Rlp2ZE95bWUyS3l0Y0FCdE81M1Zp?=
 =?utf-8?B?RzhhSEhtVFd0bk5LWHpjMFMweE4xTVIxK2pEMGdxbTRmRDdITzdyM3BrVVRI?=
 =?utf-8?B?VnY3QWQ5WWZRMHd1TER6QUJWUnBNWERRSFdjNXVrdEo1WnAzL09LTnllYVRY?=
 =?utf-8?B?TFFDdkRMUTU5Z29mRzVrL291MEJDVWYySmpFZjF6dkhYVXgwZTN1M3NFeHIr?=
 =?utf-8?B?cnFUbnBsU2kyZFJVbWlyV0lXVjUwZlExK1hXK0MzazMwRWI1L0wrczV6dlRy?=
 =?utf-8?B?a2lqYW9uNjNMWkd6eWJxazY2VEo0aXFQaXRubVJBNTlTa0MxU2I1bkEzQU1B?=
 =?utf-8?B?V2REYjRjdFBBemxaR1JwTUFHbS91bDJOaG1SbFlYb3pxNDQ2UDM3UnRvTVdO?=
 =?utf-8?B?ZkdKeGRXSnJzNTdoSWhQRmtVdXJ5TURZYi9XYzU4L3ZZNU1ZS0cyS2hkN3lH?=
 =?utf-8?B?N1ordDFOSHMyZDJ3WFJlVjBqR2VGQnNZME13cjA4U0JVQ01lUE0vUTBkTE14?=
 =?utf-8?B?eGdLLzhGRWRaa25xak1zVEZTQ2FWYWJOWHljalYyQzJydHdUZDhFcllSWGk1?=
 =?utf-8?B?UTVmNExzS0tSR2NlT29QV0t1ZStWSXd1cDRyYlpPcnVLRXhZczk0bGNNbTZq?=
 =?utf-8?B?YlVmSVF4S2Jwem1zU0tuLzRMK2JNYzBWbVJFbGtxNU15anJYU3dzUithaEhS?=
 =?utf-8?Q?A7J8Mu0cfEDA1F7SWdp/hlQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07b117f-16c8-47d2-e817-08d9fd35b6bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:48:59.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+nDxWeRw6XKiiSCEbDXFZ/Akh9tOft44PQzTZ+kQoNAx7rczGpmYjoriMXzvM45b0+4BEOQgb+HXRtu/sSl1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7525

While benign (because only the decoder is exercised here, whereas a
wrong EVEX.W would cause an exception only during actual emulation),
let's still have correct information in the table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1974,8 +1974,8 @@ static const struct evex {
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
     { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
-    { { 0x0a }, 3, T, R, pfx_66, WIG, LIG }, /* vrndscaless */
-    { { 0x0b }, 3, T, R, pfx_66, WIG, LIG }, /* vrndscalesd */
+    { { 0x0a }, 3, T, R, pfx_66, W0, LIG }, /* vrndscaless */
+    { { 0x0b }, 3, T, R, pfx_66, W1, LIG }, /* vrndscalesd */
     { { 0x0f }, 3, T, R, pfx_66, WIG, Ln }, /* vpalignr */
     { { 0x14 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrb */
     { { 0x15 }, 3, T, W, pfx_66, WIG, L0 }, /* vpextrw */


