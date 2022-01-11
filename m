Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F9948AF4C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 15:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255741.438329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Hwn-0004xF-TK; Tue, 11 Jan 2022 14:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255741.438329; Tue, 11 Jan 2022 14:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Hwn-0004uX-Q6; Tue, 11 Jan 2022 14:16:25 +0000
Received: by outflank-mailman (input) for mailman id 255741;
 Tue, 11 Jan 2022 14:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7Hwl-0004uR-K9
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 14:16:23 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d47931e-72e9-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 15:16:22 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-zFBI66hDPKy6ztLnqnbFSA-1; Tue, 11 Jan 2022 15:16:20 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Tue, 11 Jan
 2022 14:16:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 14:16:19 +0000
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
X-Inumbo-ID: 0d47931e-72e9-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641910581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SXIayTdzU3xVDaLPRjSHx+LSZzd1LV8a706FusiPwlw=;
	b=cVrPKyhmOpNjMuVdMLalh+ppKDWaiovJ7eQZ/7eo9JMUp1En+AZ+EqNokKyq0+/MfsWqQ3
	KVE1MygACl/q2bZt3Hkab1YV/y87DEBtJ7mLUOwQBzONqEJlSTq7RmbBoccbm7w7rpoMbk
	k3yMK3n329BG0yH/1Nk0yYudyb7jJ9k=
X-MC-Unique: zFBI66hDPKy6ztLnqnbFSA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxUHu/RnpUEMMGqSOERUBeneXLd8yS9Y51piRJA7ZLhqc+KkHBfSlyMMnFmqeD+WNh1oFrzgs2fMiJEfjDZyiu9MKrkr6t8bNKTgNwMP8FiuKCt70jdJLXSez2jOF266U2FX+08leg/z2bOw7WV/ziQAgYroL/qHuSicpsrzcuA9cuTF7104wS75UGVvFfdXflu2j9v9FY1gsGE+6LeVx3IQSmL8i/UkZKAwl43IbxeRmwgfyWGlM9LjbahDb5DrVOHgwsWfqfbXrD4K/8SJB88IWaHO6QKcqSlVZYRxEW0R3mJ/ZqGT+czNXE8/pAt5ywDiWFgvH6HyN3rhNsapZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXIayTdzU3xVDaLPRjSHx+LSZzd1LV8a706FusiPwlw=;
 b=Avni3E9DT5Gjbxv6O81BYRKJFdf3pL48Inon4KH8PGaVbrJhPsbmAFPWTXEDGLPjGV9PIIzdzabteZTK+FKJZVRk7ehMxBBI02HKslzJO403tcbDhwk77X5CwVY9oH7EOGN0ECix94E9Pff4LK/IstxCD9nHx5MrgQWls5B1gX8BRIas9H5gIkGIJOgsSiOSqe2wJbhMYlLXu2Y5YIrVFgQ4xXLYKe4wJx3iI3TO3V2eMElR2FsxwTcrnJRvK5klOrobZT3rdk+jCH28H/5unNtIvD+QUBRIll48tMlABVHrQvZAEwAL8Fo3Miyf7rF+XbTtV1fhMClWFzbsQDZO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f0766b2-cabd-cf5e-ed84-cc2b773bf5f8@suse.com>
Date: Tue, 11 Jan 2022 15:16:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] build: adjust include/xen/compile.h generation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0321.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de8858ee-02db-459c-4fc3-08d9d50ceff6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57417926FAD3D7BDE2DF540FB3519@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NMP8b7X4Ko495O33/Yomb2hBkxRHPwwddGW++UbAJa/SpI64NlxYOddO2AdRekLLqwycBVUQ+riZedYw5+mV4yxDafErl7NYcsR15fVtFeFJteNmvCXxS7Qlh//YukvmY7K1ma2Xcki2QKSKEKgdFIhvTk87Ev3cuMMtQpDMct+IjsoRmPnl3fX2goDuJBqLOFxJKB2W9VITU3Lp7S9zkDH28ohgBbWg9lEIz+p44+5lIy2uWUJT0JYwxUSVUbIqWS1eK6D0KORjtiqXOjrQsXONNy8u2N4VSPvZQz1aybgBTnyObz5qeP0CwkW5ip1H6YBDyzZE0Lw0cZSX3UzvMg6RhlqjNlwe9d3izfODfv8dZNyKFnNf2PUAf3dCJKYtFcRP8rXT3xyHpf4sZZ3OPrGZlVFM0TpH83lBKE5+QyMk1KZ/oXxrjq+JJC6vFGSTcm2A9eTrjFviyh6Oj2qOjm0tQ+Fw2EjhYiIhK7J3lKnyt+8NqXmUyJTGw1wbffPZsmHPH7b6SoLugFFBczM1D6ukxZymdw6LQcT63JTo0DyZ/JFbfD4An0Gg0A6GBl0ABSWrDGTcIMm8/SOkkRBP5PICIGDpDHaE3vVR8Pm6O6P2IQDe4RU1rcJP7LwMFlBvonyzN/g1jX3fCO4FTliYfrwl3lYbmckR76aMk7VmhGRlNd8lw4S6S9+quBJ9f+c9AjEp0jwnuaR8OTMILpgAIrpZkgN2LVWQdXzea1XKZjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(6486002)(26005)(38100700002)(31686004)(31696002)(2616005)(66946007)(6916009)(186003)(54906003)(66556008)(66476007)(8936002)(6512007)(36756003)(316002)(4326008)(86362001)(6506007)(2906002)(8676002)(508600001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjdaMEl3RWZTR21iamdFR3FIc0RkK1NuTmtQS3U4azRhQWlWdG1yOEpnaDlR?=
 =?utf-8?B?SjJyZ0ZOc2NrTnZsb2xrdzdFNkE3RW4vUktiRktRNldZT0dvcWx1ajUya1dl?=
 =?utf-8?B?ZWFBVDVYWk9xV21sWlJKZ3VrS1hlU1ArY29SSklZTE9FRWFuOFNEUU1wRWVz?=
 =?utf-8?B?MlpVMGxZZU9lVUlxZXJZVytCNE8zZHVVamR6ZEx4VUZ6NUxHcGRJeXhQdGlQ?=
 =?utf-8?B?S0tBQzI5OWFMRnU1SHg4MXhkK3BidkRVcTVQV0w4Sll0ZDlkenZHaiswVUdl?=
 =?utf-8?B?RkRDUERibkFhL0g5MU1jT09zMExXZkhqVENmSFZTTzNmNGVLam9EcTR5Sy84?=
 =?utf-8?B?WE92T1RoSDl5WGtvVE9ORERBVlBkUVAxRnBGdzg3QUtRS3ZpektaRUE5R0NT?=
 =?utf-8?B?L01ndWt0Z3NVdHlONisyVWloNjBFN2k2MEE0TzJTa2l2dDB5VDZkWnZXWjVT?=
 =?utf-8?B?NUxhaE9WRU5DSFYxc0JXdUpjZEJzOW15YVF4QWx2M1o1aU5PL3dwclNPTVV1?=
 =?utf-8?B?bHZZd3hYYjhVZEtKTytuaG94cGdNY0NFZHErUjFDL0ZaL2RYY296ZldsaVox?=
 =?utf-8?B?MGtESFVpTmZZK0xNZ09qQ3VieERBNG5kblBIbHJxV2tZOXNLbFdJa3hjbndk?=
 =?utf-8?B?cTFwNmMva2MvZjlrTTJkZGVzQ0p6UWdmOFp1TXV5MkxiOHI1RUZsM3hFTlZV?=
 =?utf-8?B?OThqUUJFTkZqT3BLck5oMmZvVVR3WUNTaUhJbUw2NEN6NzVXSWFiV0pDL2ZL?=
 =?utf-8?B?cG5OSDJxckJMOUgxQ3gxeGtvRmZnT2J0QkFSR0NIOE1teDFtcU9ORkxzc2ln?=
 =?utf-8?B?ZjBuZWN5amhPb0F1aitOQUNPY1gwOGJUQ3Zjc2hNTkNrbDMyenRhVENleFhx?=
 =?utf-8?B?N0dEMVFWRmJIcnJVdVJOcUFJTG8zSGExbUVaQWltcXBNT29tMGZZZ3JWOFdS?=
 =?utf-8?B?aE1TVTk5ei91SldXU2lNdVhVWWxuaWdtSUV3WDZKckZPbHJ4cWpFT3kxb1VF?=
 =?utf-8?B?KzBTdHpVMmZhT2hQRVM1dlQrbEUvT1Zvdnc3M1RQMmVRM3hQT1BGUnpzenpN?=
 =?utf-8?B?bXpoNGswbDZQbzQxcGlVT2pIZ1RTLzRpNXlQOGZOU1VSMHcycXNoeEsxV0pX?=
 =?utf-8?B?enU3dFNVVmRUNkN5aFIxdU03T2J3SHFpVWZibmdoVUFFTUZ4VE80TmNpcGxj?=
 =?utf-8?B?ZWNwMzRkcGUvLzlWQ2t1aWZsVjdXbWwvbDNkZ2p5aVdBMklEWXJLdEF0bGFt?=
 =?utf-8?B?bTZDd3FtcVhaZ0x3SjBBODVwOC9UNmoyc1NlU0ZBT2E4T25zN1llS25VeW05?=
 =?utf-8?B?VE1FTjZPTFVxbWlMdUVyRU1WdkZKQmZDV2s3UUFPbWo0ZDZzazRaMWtrclFT?=
 =?utf-8?B?L3hNRjhHWGYvUG9yc1FmMFcwQU1yc1lyTzZNZExLNzRQcFNBNHVJWE9kbE9s?=
 =?utf-8?B?YTRCUmxYSHRXMFJMQzBTQWNmWnI1L3N1dDlsSEtXeTlMVm1oeFZsdElsQk9u?=
 =?utf-8?B?Y0hyUFlnMXlLUnFRMUk4L0RuUlVtQnNPVVluZS8vckRjRnF5UHIyY1F3c1Za?=
 =?utf-8?B?b0o1cHFZT2lQdHZPU0ZRMG92bUU4UVVOR3ZYRWtnbGVwUGNSRnY0cVFQR1dq?=
 =?utf-8?B?QlRSbk5lcTVVazRCeFpDeTE4d2tSTzNIRFZmT1VsZk5RcDYrVm8vcXBZa1BW?=
 =?utf-8?B?UzR6WUc0WDRaSzhBMzNOdWY1S1NWd1NIU3JmWEYwVUhsME5FL1FPZFdwWGZI?=
 =?utf-8?B?VGRlYitQMWlSRmVVWCtlV2hQMEhZOXphb0JURWZXVWF0eWoxVnc1WDdjcEhU?=
 =?utf-8?B?ZU5mV3A5YndKREJkNDZ3RUZweUhxVXB6SmsvWUEya0ZSS1dUc3oxaUM2MnF6?=
 =?utf-8?B?ekJQM0k4SFJGOEU0N3JvdXVEZTFhcUE2ZzQ4eE04LyswZlBkTUN0aEY1NE5N?=
 =?utf-8?B?U0RpbVFRYnh3cEI2TXl2Um1XMldBVE1saXRwRmhMTk8vbk5ET0VFSzFUbXRR?=
 =?utf-8?B?VnFzbDVmV0lBbWJsQzltUzVZL2JGOCtXS0UrQ2wrQUdKK0xvY25iQ3FJWmZh?=
 =?utf-8?B?TUdsaFJWMEFBbUJFTytlWjlqUXpGK0srTDhzdVZMRU9LVjA0ZEFKcStjWHNw?=
 =?utf-8?B?NlExT2FiV0NTTnBWV3MreFNlWDN0bEl0RHFCTjRVbGlVZWVHd3dFUjU4Z1pN?=
 =?utf-8?Q?qksStsER8xnqTKq9EzYk9cY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8858ee-02db-459c-4fc3-08d9d50ceff6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 14:16:19.3185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pgg/atmRgp5LmTXdtpP+pJJQfnxeQ8f4BfPr08+jPqJhnUT260GPKRk0UL0EQfs9q2YgE5m2QL5OEsdDfZkDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

Prior to 19427e439e01 ("build: generate "include/xen/compile.h" with
if_changed") running "make install-xen" as root would not have printed
the banner under normal circumstances. Its printing would instead have
indicated that something was wrong (or during a normal build the lack
of printing would do so).

Further aforementioned change had another undesirable effect, which I
didn't notice during review: Originally compile.h would have been
re-generated (and final binaries re-linked) when its dependencies were
updated after an earlier build. This is no longer the case now, which
means that if some other file also was updated, then the re-build done
during "make install-xen" would happen with a stale compile.h (as its
updating is suppressed in this case).

Restore the earlier behavior for both aspects.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative to removing the target would be to replace "! -r $@" by
"-n '$?'" in the shell "if", but that would cause unhelpful alteration
of what gets recorded in include/xen/.compile.h.cmd. (The command
normally changes every time anyway, due to the inclusion of
$(XEN_BUILD_TIME), but I consider that different from varying the
conditions of the "if".)

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -424,6 +424,7 @@ targets += .banner
 quiet_cmd_compile.h = UPD     $@
 define cmd_compile.h
     if [ ! -r $@ -o -O $@ ]; then \
+	cat .banner; \
 	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
 	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
 	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
@@ -441,7 +442,7 @@ define cmd_compile.h
 endef
 
 include/xen/compile.h: include/xen/compile.h.in .banner FORCE
-	@cat .banner
+	$(if $(filter-out FORCE,$?),rm -fv $@)
 	$(call if_changed,compile.h)
 
 targets += include/xen/compile.h


