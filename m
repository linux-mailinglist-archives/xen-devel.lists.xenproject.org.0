Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28457DBA65
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 14:16:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625093.974003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxS81-0001gq-Qd; Mon, 30 Oct 2023 13:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625093.974003; Mon, 30 Oct 2023 13:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxS81-0001f9-Nv; Mon, 30 Oct 2023 13:16:25 +0000
Received: by outflank-mailman (input) for mailman id 625093;
 Mon, 30 Oct 2023 13:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxS80-0001f3-Rf
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 13:16:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20606.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85f88ec7-7726-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 14:16:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 30 Oct
 2023 13:16:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 13:16:20 +0000
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
X-Inumbo-ID: 85f88ec7-7726-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPHgUdCKJia5j7Ou0o7eqh3ddTNPiitlpWOuAFramsy77htM8hdtAfMAVEOnrSpgHVreForcy7ZchGOPJZiqrOxV/qLKXQrhkhokSLWlGDuAsPETQzsV59JE0N3wNfyq5hct9mWn+IYVmWfEoSH0c315TqCEhU/YzOaVlAc116BBSshPFykaV/38dIivv7qM0qZazLZipGyohRcUNZlB9lJc+7fga9ZK4mt79vK+07upi34Wzh0gVvjWCgndIViDWbEwdO/0tjD7sD099oOcHDI7iDdelfdaAW1NiQIOulRbPnbWW9NdEupRJUqHm4K8zfTZWZnop9Jy7r+mPDHjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMyE8FXqxWMnkNmTu0BqW4INn9n57mn2PyP6ZhtdAY4=;
 b=h9MmHhiXeHSTfbBBqJr6mhLI4XhsfMZCEFg9psfPm9z7a40Yxv1l9SiJbieBU2rsqU6DJL2MNi6uTVqbeHmHaXfhlTXNtR6EOJ7NoeLMER7pjfAfJ2vGcbO1jEtBdMfrAG1b6/n4lDzc9ERI/neARRVAum2RQxsFBzsYxEKgqLRlLff+5BcWSJgmLuAlOcOLGwYBntYYfT2z/tL2BSHrdCPFUrDxZ5pE7WLZ8Ln0Dw7SGtz6N+Nssc4tn89R65wXJJ/IHpo9KYiIYRsMGun481rJejmmkX0ylfqFXP2aRzD1dCp8InPh5fsGpcVmOM09rTzBm7fqdEOgkhBi3R+FXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMyE8FXqxWMnkNmTu0BqW4INn9n57mn2PyP6ZhtdAY4=;
 b=rTpsWFlh6IGU9+xhjtZ/LWS3/uqEWkRr5hgJ13HSYxUDnU3fZJOo6t2yVRmN3qDN/AoFNvsXObXZJBCggclGUNzDFFLwpUzIP4oSP1CN3baemzeY1Pbts9eJLe/XL4LHaSdLcbP0S+iTTEqjeg0ConGseR9G0r6wbyMvvvrBHTFgJn4hCO6zkFyfpKAJ8ZXJvMWqjJZ2qicJaVFdpvffUY56sIRalTViMMuRblp5ydDnPLXWCWDKrPk0rT6WZDFM5dmEKhuoSKALu99B44Er62C9cVdwizzPGo+hX9ctEqHNku7+O73BiqkEgrjJJgn1pH2bsERzfkPCLxTQQ03MiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <59c59b19-40e0-aa1e-d775-31963e03144a@suse.com>
Date: Mon, 30 Oct 2023 14:16:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] console: conditionalize console_input_domain()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 945d959a-c9d3-4fe5-3479-08dbd94a6884
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+SvnE2qo2FDbztDhSweV4Jh1fbmmSDgXyfZRWfNC8VOewDGpD7P7eS5wP/vcqEkvDPukivdjqaI/h/Zjh69V/MqMyuIdNM868AvzW+TxeWUASIP2jj4ILaMrlsq2135q3x5uAQaZhn3i//RAOY2kD9bE15FHA4/2VA0wKCTRbyinGuxIg2aV8FCW++yispPFZZ0PpWRc4yfbGLUKw6IGro11Z+vKrcnxIlECfoXwJisAtHAMnPFcl2klizDBy2Saf6SHaw2+z31EaQrs6o/nTCucOzC/cCmAzK5mtU1rr8PzrlG+du+mo8poEk4NBUbMPS86NvpXGbOHcn78tKe2C3IqdZEsP2iv21yiEpTD6/C/gknG6W+IdUFXEKOGh5wL96ZwjvpGlpPgTQd6iLYyhhsWlEIcXdWxQNdRTjjVoRAwN/EsjRBbzQqfZ9ALQ1haon9cbmLIhn2bFcFpzb41zqWVB/3mVMD6VcJu8IBT5GySNwCJ6n01ZVOLNyg9w66YtcWTrzdPohs91JzC96bJuwxs1DKOnunFeGZBheepNtOguE3CcZP0y4XB4RYzVtYGWmUqid7f/aAFGS2ADkAjgFJEWbS01DBvSfEB+CcgIvB4RE3W6xxl+F5gyvahdInBriaY+iNui+lCeTevz2zrIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(4744005)(2906002)(38100700002)(6506007)(2616005)(66556008)(6916009)(66476007)(66946007)(316002)(478600001)(54906003)(41300700001)(6486002)(83380400001)(6512007)(36756003)(86362001)(31696002)(8676002)(5660300002)(4326008)(8936002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WSt0a0ljK2JlcWszREFNV1FrTDhJN2dhUmlxTWFIbnpzV2h2YzBYTzJrSlV0?=
 =?utf-8?B?eWJWQ0RtR29SWDZpYlRaMk5ZYUNOR1dnKzhRdzFoK2ZvTXFZSDZibDRGL0ll?=
 =?utf-8?B?T3BNQ2lNdFNDdEpZM2hqenZHaVhmZHMvUTAwVlQ5TlRUSGZjQjRNME8xNDJ2?=
 =?utf-8?B?RUJqOHhHckoxYzZENXlPMldzdU90eC94YVNKWW52NFBuU2pKeVVMZDN6NXRv?=
 =?utf-8?B?S2x1L1lpbXU2WlZXSjVxZGpjT1FzYXZrRWxmQkxyN0JEcFVycjYyN2ZNRFVX?=
 =?utf-8?B?RnV4ZXRxRk1tdnkrRFpnZG5HNGxSVTlvZVRCSldNN3VUQ1IxZUo0WDdQanZ3?=
 =?utf-8?B?Zk82Z2pqSjBwSHhOZ1RGdDRycE1nT3U0NVpQTHc1NHFLNmROM29sZU00S3ha?=
 =?utf-8?B?VUpSQVdudnBHR25aUlowWnh1bEJxS1dNUlJVQkpkWVJJUjhEYkI1bGpyY3F6?=
 =?utf-8?B?U2NzZ2NobUJNQWJFVTRoWE5VWWtUWEE3TzNtbGx1UGlsRXBHMnlSMGwwQXVL?=
 =?utf-8?B?OHA0RDlrU1d1QTRvQ2d3ai9EZlRPSXhOSnJ6Z3BYWkpzaUhoUWVpQ3dOVE9P?=
 =?utf-8?B?bVhrT1ZtcFZBa0Q3aFRUL1lsY3hZcU03ZWlabjZqRklCQVl3cmYreW9oMy9h?=
 =?utf-8?B?SlVXekQyRVF4dkl0ejAzZlRtODJaVzJOc2J5bElTMzhVRkJiQWlZYVc0NmVK?=
 =?utf-8?B?TFZ1YWp1OEJoeThsWStmUWNQZG9kaUVURUphOTlaU21HN2lUTTI3TVhjZ011?=
 =?utf-8?B?OUtXckI3Y202cFhudXIyeDhmNlo3Y1hac0hST0VnUGFSZlpDZmlwVVJ4aTk2?=
 =?utf-8?B?dlgvVnZIQWdKbkl4UWcrL211WldTd1lId2wzbkY0emNwQVhIZm9vcko5UmZY?=
 =?utf-8?B?QWw4UDVRZDBCMWdZbjk1UUJZVHcrZGJCc1FwTGlpR2dVUnFScERKOHV2bzhD?=
 =?utf-8?B?QkkvOWg4RU1vVk1kazY0dTE5MEFJd0hpUmw1alp3S0tJai94cVlLQ0J1TzBo?=
 =?utf-8?B?L3laZnRZK21iaUNES2ZpRm8yanlhQlk5NnpDcUJZYzQvTmI2eWVzVXN5RDgz?=
 =?utf-8?B?YW40TG1zYTR4bHJ5MEo2b09USGpRcVBtbnhuTEpqRVVKTCtjRVBPMXBkZGhQ?=
 =?utf-8?B?aFBzNnozeW1RN2pYZ3F1bTVYcFJPL0tPMmE4MzBYS2lybWhlb1Y2Uyt0L1kw?=
 =?utf-8?B?OGFwSVlidnNEVWsya0NIZEVDNHFOUlBiVW5xMlhjVHlENUNqckdBM2tIa2tW?=
 =?utf-8?B?ZHlVcTduUzdpWndlUVhvVHdlc0lpeVIxVTNKZVpaeUFlb0RDZm9wQytVZFQ0?=
 =?utf-8?B?Q25qcEJNenEybU5xR0gvQThoanVhZ1lOdFBQZUtsSEFZbzJ5TDJMSlN1Nmxv?=
 =?utf-8?B?aUl6T0tiZWhZZDU3eVQ2Q1d5N2loWk5zWG00ZVZ2ZEw1cXpoVVhlSDI4RUwv?=
 =?utf-8?B?bDdVVmJJV1QxUXRnaWIrV1Bmd3NrdjB1YWM2MFNFYy9YVjhjazEwWjFQWUNy?=
 =?utf-8?B?ZnZVL0VqRmRhZEJEcnR3UDdQeEROZVQ3U1NZMUJ5ejAxZFdiUVBZUnhuT2V6?=
 =?utf-8?B?dmR2eXg4YWFZejN0OFFoT0N5elRQb1czRE9WVkc0cWtiSDI1dFFZTlAzWjda?=
 =?utf-8?B?MGFRdzk0V00rL2JqYnBNT2hZdUxGT0hodS9WbnkwMld0bm1oQXIwREk0YzQy?=
 =?utf-8?B?dmZ4NEdRcnBsM21kZVhaTHVlODZIb0VoTU9neFRxTVJOMVpjQVl4NVRJWVRU?=
 =?utf-8?B?TStpbGJocG5pbG9hOWEwVHNHTC9KeXpsSnpUakR5K29QdmdVYWt3M3hodm1m?=
 =?utf-8?B?NGF3elBHQS9zdGpORkwzNGRZbTNPekhWWGlSRWQ3SlFWSGRVZ1NYbXpJS0E0?=
 =?utf-8?B?ZUpqOHhVQTZrdEUrdDlNb3IxVi95SEU4d2EzM05zTUhheW95ZU5wWHBBMXhN?=
 =?utf-8?B?NUZBaXJMenpQZzZxQ1lEeTFoRlRYMEpWSFRrOCsveklNSGw0cUdmMENJbzBn?=
 =?utf-8?B?dGJxc3FlWWYxUjJtUjNZZFBOM2drRUFtU01ERlFoU2xESGY0dFB4NHlwaUJG?=
 =?utf-8?B?U1M1bWNBVFFJZ2Rrb3JBZlF5cXQ4QUdsWGhWbzJNZWxEMWFocHV2L0xrZEw3?=
 =?utf-8?Q?FGIBbEBlOhdegJinCPAMotbTr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 945d959a-c9d3-4fe5-3479-08dbd94a6884
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:16:20.8418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDV+GXY9pWt/3J+rmIVDK4M/q+hqar3xfNnvL4JzUcS62/ylr7WsHiFFUT8OdGUP3NPxDZ1UXVtisPux7mQGZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580

The function was introduced for just one piece of code to use; it is
dead code in cases where the respective Kconfig option is disabled, thus
violating Misra C:2012 rule 2.1 there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -475,6 +475,7 @@ static unsigned int __read_mostly consol
 
 #define max_console_rx (max_init_domid + 1)
 
+#ifdef CONFIG_SBSA_VUART_CONSOLE
 /* Make sure to rcu_unlock_domain after use */
 struct domain *console_input_domain(void)
 {
@@ -482,6 +483,7 @@ struct domain *console_input_domain(void
             return NULL;
     return rcu_lock_domain_by_id(console_rx - 1);
 }
+#endif
 
 static void switch_serial_input(void)
 {

