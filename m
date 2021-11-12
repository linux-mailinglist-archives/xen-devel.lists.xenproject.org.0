Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB744E499
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 11:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225105.388778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTqG-000708-AZ; Fri, 12 Nov 2021 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225105.388778; Fri, 12 Nov 2021 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTqG-0006xz-6g; Fri, 12 Nov 2021 10:31:32 +0000
Received: by outflank-mailman (input) for mailman id 225105;
 Fri, 12 Nov 2021 10:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTqD-0006x2-Un
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 10:31:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1eba5cc-43a3-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 11:31:28 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-ZB7Ns1ixN2CPrQBVCjTzrQ-1; Fri, 12 Nov 2021 11:31:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 10:31:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 10:31:23 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.8 via Frontend Transport; Fri, 12 Nov 2021 10:31:23 +0000
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
X-Inumbo-ID: b1eba5cc-43a3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636713088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HnuP7QcwIlJAt4A1Wfn2ZyD3e0l7FRzYFgO5D4oczZg=;
	b=lNk/g+NqXIBd7DDVUOxbu28CLQSIima27JvvLekZUu1wKZneSWqiy7mWMYZXaw0JAr8tD5
	+xcmRGu6ooLPoEfiBHUaUougL80HUlx1aJ4R+Cb1/kFK7JqdZo5/nlo24ajFN1AAjYlNiN
	25drOj5qZnJXB2qIeoKe9hkofC7fadc=
X-MC-Unique: ZB7Ns1ixN2CPrQBVCjTzrQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtWx1GpO6woXWc3EcVcqHyUMXrxRpnzMOTo8VqwR5Wj/982iEmEBH6G5RHdOn1Xk1WscgkNO9sizV7LNB+p6mK8ct+QzGHPrCJHFu1B+KH15q3WcYpTN2e+vz6/T9cLMygXR6sFSKv5COBeIX8vm6I1tXifSmXAyTPT/eFYj0iVe4z/8Oqi22NB53GRpmxSkRcwcA+B+IdwWfnfMMoFK2VchgPOi5WVaiIHVZAqWWSWhnJekf6OoE1fVgITHFeQb1hp9BeFFKun6YgXrP52CDFlP2B+cX3usSGIAGhpWfrR8iNAYF47Ifta09LqMllwdGJ/dxebwN7ca1EyoXyT0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnuP7QcwIlJAt4A1Wfn2ZyD3e0l7FRzYFgO5D4oczZg=;
 b=ArWrr1B/kejWUbWfJomU3xdP9GUSGJVFpkx2l+0iRCEbyz+7CllponfpqoAwx4DNMilW0ywjHETc4NM11DEGBjnNxblS3qUTo94bMp2VWVYjVYX76klsvgBtXB49QEz3p69UNjkiH6wmhCkp4+pW9pjCtAIEcjAgYSHyHK/UJ+vdHtElpUY+xq0n06Cv2ZN8n1hzqOJwD7PHDIK3q80i3STXZrrZdme3AR4N4kA0KKmNeaXJ6cItCV7ahr+Ilxvm7GT5hqYpLqGs0NrWYsNyRr9b0dWasme3Xbz/bCPLMuLIF6LnfF0zEKJmucu6f06PyNQujX31pELEWG0wS4HfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c809727f-f21a-d6f2-1fb7-4c3dfc150747@suse.com>
Date: Fri, 12 Nov 2021 11:31:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RESEND 0/3][4.16?] VT-d: misc (regression) fixes
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b90bdb3d-8da6-4815-7d86-08d9a5c79318
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39334B5412890338A4F6BD36B3959@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sHr/JA/DSNt6i+AG/J7bX3NNN07cWvrcNbEOilCRSb2TeKQvREceLHnVteFgQHukexzSdVEOXqHsAYa0HFEcJlgJILatPHZJR8h0MjiRJT+o3K4k4zmD5n64B4WXnLPFBrkzkl9X4sI/QPbK82cyuOG2L/TAk19mSiHrO/6L/USjxXzvlw+m1Hhh3iP1yPLQy5jhhDk9EFaIEg1zctuu5IElG7A2gahXdJjsP91h9TJgi8tB3LpJbYTVAGgJDgMW6s1HOAPrg60V26eeAH6aesBmVFYhySBjRPsQAngvv7T/QmtpQk1gR+OirfBeKM227r75iXl97HY5DBRzvbgGGeI+ihBlt0DTp98NlI8XKLUKJyDqhXjEHBVmpimosxeYqLu+h3fX6wRauKyVdto3u/oCNdBEXXRGHgWEUXvL9FC1ET6B62nRW9MMxwhR96zkwehVHJSy6X7fi6H55zpiwtoxQ1QtH5no1Fb+2EGC2fjcKgxRkrlhlyz5lak6kpl2kcOw0GFI4/1bT3FQxYqUWZZWk4rJeLv4ztWNbB/yfDAmZya/t4+rU2MqUta40x3d4vU8vfJezUlO+37/S5sRM3Mxf0jYbM2HsrEObDwu0p5QMqcYxei3oIWlMt9vkUVSRUN2BtOMczDLQ8g6wmPUeo4YiWDFqmeKNR7JQziI55zq13DtAn+iHzPSzFp7L2mRuFVYgmg7XxOyZdFJU6tqY1uNc1b63/BG5rP1hyEQ5sw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8676002)(186003)(66476007)(26005)(4744005)(6486002)(4326008)(83380400001)(8936002)(508600001)(5660300002)(956004)(2616005)(66556008)(66946007)(2906002)(86362001)(6916009)(16576012)(316002)(31696002)(36756003)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUpqWDluOUQzaStwdVNxTklWNDk2QWVJTFc3VmdEZ1RsdG5iTTNtbzlUNTl5?=
 =?utf-8?B?d3BydTc1K012YWxqUksrdnNubk9mMGZVbUgwQzRuYlJUUUswbloxaHdXZXVO?=
 =?utf-8?B?cVFPbE9RVmszZVR3OXdPaDFwQ3RXQ3RCaTRlVFpzbWhRRFJOWStXdHFpV1lU?=
 =?utf-8?B?UklTTUd3SWxkWS85QnhoMXNyVUdvekl1RndqMVRkTlFjTlFEdFZTOXV4T0Ur?=
 =?utf-8?B?azRsbUozelFSMUMyajRCNHNISXk0RkxrMWhjRUQvZ25HcmEzWVBoNmlSekdU?=
 =?utf-8?B?RHFFQ2VLU2xEdnh5NWJXbUtQeUVsbUlOUVZML2tZMEEyTjE4a0JyMXNjVFFl?=
 =?utf-8?B?OFl4WWp0QktiZVlhV2VqYnhtVEFrWjNOWDRibVBlLy8zNjAyT1I4dmFoaFRh?=
 =?utf-8?B?UE9RUzFrN0M1MWJBQWRqenZDVWFPWU1YNTkrenVIaGF4Y0pwQUJTdGg4ZVly?=
 =?utf-8?B?WTh5YzBmODRYRGVOcGxaL1BlaVkrODJtUE05blFrSm1UK1pwM00vNzVveWRG?=
 =?utf-8?B?NE5vZWNiNkZ1NTRqOFg0Y2Z2OGd3YU1ENkhPUGQ1M0ZiQXplMSs2Y0xIQTVO?=
 =?utf-8?B?dEVwUzY2bm1kU0lLUTcveVFZdlZnRTU3dXM3dTQ3cHljdnRSa1JxazhUdmsx?=
 =?utf-8?B?WWFYa1VlQjg1NzZkcDR5TzlzOWRtQmhicU1QdVdtR29FUW9xYVdpQ3hQa0N2?=
 =?utf-8?B?SC9wL2gwNVVmNjNsOHpZa1ZjSWdQRUd0MHJ2dWxwVUhncVBTL3pXdVQvc2lH?=
 =?utf-8?B?TjFYSkpxTWluTGg4V3d5UzNaVjZjcmR0SFYvTGdRYzZlT0MzQzJ5QWh0T0ha?=
 =?utf-8?B?YTZZZ2F3c3ZMSTRBRE1OdWR0dDQwT1ZpS3psL3JYOFduRUVpdVo3bHczSThZ?=
 =?utf-8?B?eUZ6eXFNczRuaHpXSkNkQ3F3MnNUWkJyY2pXcHRxTDk2ZnBQNDFFT2orMWN2?=
 =?utf-8?B?ZzRUQS9IK2U1MXVPeE50UHJEUmt0WnJLVUgxSHpTa3JOKzNLSTJuMGwrZHYz?=
 =?utf-8?B?dkRkUFU4Y1dXS1FCOFNvSWEzdkpHY0FKWW0yajcwSTNCSVI0MmNGYXV0VFF2?=
 =?utf-8?B?Q2UzWmJ0N2xDUERKZTI1bmZGTnBoR3hpOXIzUUFwYytqZVR3OW0weUJUMUlC?=
 =?utf-8?B?NURXS1RCcXJmekE4c1J1OXo0bVF6VkZhKzd1WkdJYWR1aHJTQm1Pb1gwTEVK?=
 =?utf-8?B?UUZtbnJtVWxVYldidnNIWHhZSUpqSzBwOUdvcXdYQTA1RWRqNTdiVTB5b3Nj?=
 =?utf-8?B?WGdyZ0tXT0x3UXRRNGpXclFBc01rUVVSRzVERkU2NEtsVHQ5U1p2TUcxeU9p?=
 =?utf-8?B?ZnlXM3lqWnoxL29ZaE9NaTJxOG40VXMxUHRobHpmSnBGL2pWbFBwVzZvMHkz?=
 =?utf-8?B?NGpZZjJhU0dVSlg2eGZxYmdUTVI4UE1NRytjb1BjVlBoL1BZVjRSeTRZdU1P?=
 =?utf-8?B?WkUxVzFGcTZRZUQwSDYvQ3dXNXQ5SkorSjVPalRHWUptbERORDRUeVp4eTRQ?=
 =?utf-8?B?ekFROXp4eUoxTy8yNGJVZUxoZXF6cGNXZXR4L3dCdEdTNEVMNmJ1V3liWTZN?=
 =?utf-8?B?aVpJYzZYdlhQNVpTOUpOemdXdk9VVVRkOUsvclJLK21NdVYvWlcyTUFod1Fy?=
 =?utf-8?B?ZW5LdDRsbittUERaUXc4MDZWdkFzNjFUUnhNV1dRQy9ibWRwLzhmbWVoTmxV?=
 =?utf-8?B?OWtNMUFoZy9qVzhneGZzU1FhaEVBZFdjZWVNeGovQ0gyTUcxczQwaUFNdDVI?=
 =?utf-8?B?Z0dCVUxaZXFjZ2g0dnVoOEgyUmRYQzVpQnNROFVZSmQ4Y285WXJveHN2aTBM?=
 =?utf-8?B?b0ljTk5JNWYwclBlYVFNTjA4SzZPeVFxUjNIT3l5SWlTT0xkVVIweXQ5d3Y0?=
 =?utf-8?B?WXZON1M3bm5lWnFEVkMyQmFiU3dxS1E1bTJFREV3M0E4b2NWZDBwWStmQlBV?=
 =?utf-8?B?TlhLQmdCeUxacjREcjlRbmpudkxudEdlVC8raVpCOHpiRzlIUmdyMS9pZFAv?=
 =?utf-8?B?bmYwZXhNNC9jNmFDK004UGg2Q3hMaVdRV1kwVmFmbnU0Q0NpM092cHVUZnFS?=
 =?utf-8?B?VmZjRGJIM3pZQktmN1BSdWs4NHRxVlFSdEx3ZnFlN3AvVGFFNUZRbnN0T1dL?=
 =?utf-8?B?TEJqVU1pR0huREw0QjdhdHgzcForbkhoWjkvN0VtWUw3STFyK1I4NWUxdVpi?=
 =?utf-8?Q?fkdEiNCFqb8cPtBKVe9+C7g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90bdb3d-8da6-4815-7d86-08d9a5c79318
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 10:31:23.5935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy/vaBfuafvN5CeeS+rZpmxERbVzc9tT30OeIct1wKDJRgxUdd6RcTjTCZBIoiWCD/qlerQxuBe892OOhqfKPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

(re-sending upon Ian's request with his address adjusted, including
Kevin's R-b at this occasion)

1: per-domain IOMMU bitmap needs to have dynamic size
2: fix reduced page table levels support when sharing tables
3: don't needlessly engage the untrusted-MSI workaround

As to 4.16 considerations: Only patch 1 addresses a regression
introduced after 4.15, the others are older. Patch 3 additionally
only addresses an inefficiency; the code we have is correct from
a functional pov.

As to patch 1: Without the earlier change, systems with more than 32
IOMMUs simply would fail to enable use of the IOMMUs altogether. Now
systems with more than 64 IOMMUs would observe memory corruption
(with unclear knock-on effects). Whether systems with this many IOMMUs
actually exist I can't tell; I know of ones with 40, which isn't all
that far away from 64.

Jan


