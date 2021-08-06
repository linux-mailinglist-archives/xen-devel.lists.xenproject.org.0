Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12663E2E21
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 18:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164759.301113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC2Mu-00012G-Nz; Fri, 06 Aug 2021 16:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164759.301113; Fri, 06 Aug 2021 16:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC2Mu-0000zJ-K5; Fri, 06 Aug 2021 16:06:44 +0000
Received: by outflank-mailman (input) for mailman id 164759;
 Fri, 06 Aug 2021 16:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i2ZJ=M5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mC2Mt-0000zD-Oj
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 16:06:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49d124fc-f6d0-11eb-9d13-12813bfff9fa;
 Fri, 06 Aug 2021 16:06:42 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-twu5_mlhM8yd8thwtSvsCA-1; Fri, 06 Aug 2021 18:06:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Fri, 6 Aug
 2021 16:06:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 16:06:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0103.eurprd06.prod.outlook.com (2603:10a6:208:fa::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 16:06:38 +0000
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
X-Inumbo-ID: 49d124fc-f6d0-11eb-9d13-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628266001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cYDCbMR++wtd//yhkKdkkFpEBbqgQFcxk9SRvWjLtfI=;
	b=RQoA7R3m+bVDGzGrLc9hM6x2pkTN/mf1Bfs6xgYP1J7O16xMZWS7Mdc5peqp1cVJOz7EGO
	ovEkiflf01GxMTbBPzKwz+e9Ru0rlir19TVun9J7g8KW8g7Pl4yUqKUNfxCPt30B/AjYvG
	KhLakDsBYWwJA1MXOHkbH40A8fzhisw=
X-MC-Unique: twu5_mlhM8yd8thwtSvsCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWhk7wWlDMg6Whmoyi2EOjXtMn2SVFV6ZyMv+MnRabQhVTMi9IYZdu3oJhmueaAB+h9ZB20Q2NzGx2IXbt6rZ+CaK8WY2QG3CeQ9jI7jneglX0jlFUvqzEu2aTrUHidzbQkUU8K2bw3RLrW3aAk8Xw1EAcdLccQQ2pKmHbXizNy6B38DAwZ0tijKgW+0oabUvE7FegDYM/Z2KqDYG/rWTGUZ9tYa52jBiJL0YAfAMRt7Lp3XKJgIXh0QAKz5ywkufFT1wv3T/jc11v5IKxH69QK5I8XTn80JLN/IC6aFHFV2JEdIPb9oqmRUbsNoMHWnsp2J9/y+GwvNY8RmBiHL7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYDCbMR++wtd//yhkKdkkFpEBbqgQFcxk9SRvWjLtfI=;
 b=QQYmSJjIvMiu3hAg3Igmr243lXb1NlR36IJ4oYkdcYCt6FCxYaWOypSxSGtXDblsxEd3RVlhew7orkM0LaJbUhESuGrMHUjP0on/pGMH47h2sVyWnh9RA+oq/T6q7gDD72IJ+s+XhbulnOOcdhiFWwM9aB3+oV139j6cxj7J9HL9Ee37n8rCNV2A+AnG3+zjZPq4ouvkEnst3PyKhG76LQzm/Rj/+bU7sVoAjELx+X3Iwqzqmq14HwPRS8h2HwODs5n6hq6ZA2qFvX2EZbDamDEySpmK50GCBfJJ9NogKOw4BwiFoViIzgeOKWJaUfehahLJgvqKAshzjBr1VQaoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 25/31] build: remove unneeded deps of x86_emulate.o
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-26-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e337c91-4380-7a9b-8969-f326a9680e08@suse.com>
Date: Fri, 6 Aug 2021 18:06:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210701141011.785641-26-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0103.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17fa5bbb-0cdb-4714-c36b-08d958f42c07
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33896E813C8476D8DBCF4883B3F39@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sGeQPAqr1WRq9S8FcUCqxM6vIlCP5NxwWH9PAXi/RCeNQ/BP71oJqspGEcPUWcXKvZ3J6/ApP4usOsBmsVOzqV6brmb4+RmjQdtXOQ+bhJ0d2tBiQKrjnG0tSpybkR+96jPuoMImeJj58u2/rCsdiIVNZIFIvHNeM7dWsWsfPyHYX2AMOFsv5v57tiEf8kjEWL5oD9q2E+x4YT02o3va5pjt+OxsPqP86Q5+TwmgqSWlvyxwy5hkfZ0Bwkboqn7YWqLYI6jkwfRdktc95vDLhAQyeA9n29UsiRFsSDwJOWSu92zDkqTxipdAxsevQ1sbePCaYachaawzDoO99j48iXTqoFW+Q/qfNvyFCMYNSbu8A9ERZ8GBZQAINksUySpyZL6V86SFGvo+/I3wmjd1iB00CZoIxFJNivMcQKHv5KT375zjq7en1Ct/9ZRXkioGaEdbMGhsMLknv0QFcz8KaqkA4WTcXJGIX16IzO+/qAnSkTn+zI6K5VKVzAeeK+Dp8y531R90T5z/58PbI+WBnbAhTNX5WcsMNvXdQ1hFmkjqtGwUuf5J2ZxyZYEfZHoN7xKedim10t1pKzK6PSPx1nyCkgm5h1aVQsqd+uxnu5tQtKK6v80yza5kUWTlZMDWS5Rl1WPU1ZnpvwTpxILSXJtwcMVMYTAqWAyOpwd/HlYCCpJ1ekQAzdATGz8uxdl7pgO1uZihBwMEwL5Hy42k3HLTksk+0XNaMbS77D+wUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(5660300002)(54906003)(2616005)(31686004)(66556008)(16576012)(956004)(26005)(186003)(38100700002)(508600001)(4326008)(66946007)(6916009)(8936002)(66476007)(31696002)(86362001)(4744005)(2906002)(8676002)(53546011)(36756003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXZzSnJ4WE1iN3ppdFRTTkRBdll0Sy9HQjFpWFlXK1JNdmdCMzZaZm5XcEJI?=
 =?utf-8?B?cHJ4eU5LS1BLRktxYmdaMmV5eEMreWdFaWQ2MVNHNjI5cGg0ZktvYUN0OGVq?=
 =?utf-8?B?d2hzelJLL3hiVUdWVHFDdDFqVkFTbzBjYVZJdVRBR2lPZEVjeFViN2p6aEtr?=
 =?utf-8?B?QUwyeUlibDBKZis2MG9nZktCUDh5eEFrdythRTFjOWVQQVV4SmlSSVc1Uysz?=
 =?utf-8?B?ejAvSXJvckYrVEZwbDROMmtadG5ZZHVLYzI1clRoUGxzWHpZdXJzUnh5SDVQ?=
 =?utf-8?B?S2FZSjdpTWtGbXBFZjJKUkNDN1BsMEhQNW1JVW13Uys1emZvZ3ZobkttNDZp?=
 =?utf-8?B?cmlXazNhSFRkbjM4L3NSWk9VOVlDcmFlTllNRzFTd2FtRHVoQlRXRUIxYlRS?=
 =?utf-8?B?V2V0RkFmRTFHQ3Axc3Z3cWo5eWlaVzRaRTRCL25vbjkxOFlLUXZhQUJVWlNT?=
 =?utf-8?B?UktIVGNqeTluY2NtZHBLaDZ5T2lDbFpTOUpjczh1Z1U1RkhQZGRuZ296QSs4?=
 =?utf-8?B?cGVyL3p2NzdFUXMvOUZiOW12a0xXREM1UUNRc3NoY200TlptRUFaVG5sdEtU?=
 =?utf-8?B?OXQrODFxbU9Vd1pueFdIOFBrQzNRVzV6WldzdE55MC81VHFVT0pSWm1vTStK?=
 =?utf-8?B?azAwZUZxZmFQaUVhSHFpMENrNDlhTzRLNkJZZzNXdXd3TkU0eno4ZTB0ayt5?=
 =?utf-8?B?a0xWL0NiY1A2VmxlM3dsQTRiRE5Fc3J4UDRhWDB0cmVRTkhyNkE5VlVKbVBi?=
 =?utf-8?B?ajRUSnZWMTMzVFc4UlRHd1JhNXpCczErL0ovWHRseHNjbVc3NjJlMElyTFlQ?=
 =?utf-8?B?bnhDMjErb2orS3dTVUJ3Nmg5RXlDM0FqN0d5WXlhc1ZGVUt1akMrMUZiUUs3?=
 =?utf-8?B?eDU4cGR4VUp6cGREN1Ard1J5UGZvWWNsQ3NLRU1Cb2NaTDJEUXE4WnlQaWtF?=
 =?utf-8?B?QklmQ0FYTFc2T2M3cUVCWlFjTllFeGFtNEhqVzV1bkltQTBOTVREM1RkOHZY?=
 =?utf-8?B?YTZuZCtHVXpmK1hoVUx5REYzMHBTaEpmZC9VUCtoMVYyN1pMVHd4WlJsbW15?=
 =?utf-8?B?d2ZLYTFPUERkeVpMZVFlRzF6NGtUUklMbC9wanNPOVdkTkJIdEl4UEhoK0hn?=
 =?utf-8?B?dVFCZVpPTHZZbmxvZmFId2RtNVpVa21vR3dtRHh0V25NaVNXNmRkbzd5d3BW?=
 =?utf-8?B?M3p1VkpTeGk0b1VvRzQzU2g4aFVLdWdoT0pLSk9pVy9tL1F6MU9HZHhDYXpw?=
 =?utf-8?B?OStLcEhrcTMwYkp4dDVQTjhQSEw2YjB3QmlpS1pXQmJuc2NlVHZTZlhLZ3h6?=
 =?utf-8?B?dWpqVXVWM2FZVUxrRlZyTjRYVG5TalJ2T04wcVdJcGtoSTJNTlFZcnB5VmNm?=
 =?utf-8?B?Y0lCS2Y4MUNzdzROL3RnYmlpRGg5V3NqdnY2REovdFE4aXRPSHFZL29NRklD?=
 =?utf-8?B?WmpWVUhrVTU1bXlVZDZiQVNNajFMaDZmL2RuOEJscFNuRUdWWTdWbTE1R3NX?=
 =?utf-8?B?dEpGSG9qL1lIVE02TU4vcmcxZkFIV0ZjNWxBbEljVlNmZVRLVXM0ZUNYVFRw?=
 =?utf-8?B?ZmZQYnMrdytQTEt1SUZlQkF0a2d1WUNrZ1RBMUFxOFRIb3NuN3ZxY3QrKzQ5?=
 =?utf-8?B?UHlhM1djbGdkYkxlQ1A0Y2MreERaN0dWV28rYUJuaS9hUm9yOStXdGorVE8y?=
 =?utf-8?B?QXRpQWlQZE5leGNjZ085amk1NUk1TmllNVordUN6Vi9jQ255ZG1LR1ZHdTgv?=
 =?utf-8?Q?Dd33VPAlvUcqeJgB1ZbfjIw2q4FPWU1C7dRJHZl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fa5bbb-0cdb-4714-c36b-08d958f42c07
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 16:06:38.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANtsI2qjAm/jDoaAlqQw2B9SOxR5Pm6dpedQj1eZS0FQPCdNVpQMZPmViKswHDKaClNFvpbS2gddZlScNK6KJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 01.07.2021 16:10, Anthony PERARD wrote:
> Those two dependencies already exist so make doesn't need to know
> about them. The dependency will be generated by $(CC).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Unless I'm mistaken this was actually an omission by 68b1230ae393
("Auto-build dependency files in hypervisor build tree"), which
would again suggest this can go in independently of all of the
earlier patches? In any event

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -84,7 +84,6 @@ extra-y += xen.lds
>  ifneq ($(CONFIG_HVM),y)
>  x86_emulate.o: CFLAGS-y += -Wno-unused-label
>  endif
> -x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
>  
>  efi-y := $(shell if [ ! -r $(BASEDIR)/include/xen/compile.h -o \
>                        -O $(BASEDIR)/include/xen/compile.h ]; then \
> 


