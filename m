Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ED15F6777
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 15:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416908.661596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQfR-0004kK-9r; Thu, 06 Oct 2022 13:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416908.661596; Thu, 06 Oct 2022 13:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogQfR-0004iV-6K; Thu, 06 Oct 2022 13:12:01 +0000
Received: by outflank-mailman (input) for mailman id 416908;
 Thu, 06 Oct 2022 13:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogQfQ-0003yu-59
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 13:12:00 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a987db-4578-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 15:11:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9560.eurprd04.prod.outlook.com (2603:10a6:20b:470::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 13:11:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 13:11:57 +0000
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
X-Inumbo-ID: 75a987db-4578-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNQ41SdZCEqKKSxinuUaOVllmAx7i/VNm42Jxx1O8f6i0nX4hZiQWAF6WiSEMmMMYItctoEWGmFWkAxcuAhpDA3QSJ9uGLjEDFJEePxAprXqQB1lWh4u5AlFO/t1Gmn8/DacU8U9xQpIJru2b6Ia1TKGWIihF/ifo1mtARfwvfS4RKNedyKvhTOEPYmReJOgf/JVEotacOruiPTaaRIlLRSKhcOTChNZEtdAX+BHWgcBAe7D6ZwFu+StFrfr7NLUeof5TkClHXVyEr5tk7A+/7doIAmzyl+xiwylZlCr46TrIckLyY+UaPPc2Nq/oI3k/dvImRcJywv5vxXGkcnTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YV479IgiGvaTL6Y7CPDE6Fb2IX1fXKLM+JWhWgYffg=;
 b=Xl+krlR7HBjNTPlQjXBIU3FopNH72PSGpyq8TOdUBFlkA8sTZuRCERw3TzjIRm05xZOXOnyujxkvneGJHVjcR+5hzUGjXCOcMaYr6/+EWztNnUP1kBb3TipDxuBBoO7RXiM+TgHrtKZLFr9M1Jo8cT4+jmyn8FgTEYgGRthF5JijZnNhemAT28CXAI7ysBsqTYhMbVmrr3wtzqp++71TTmzMqcdXAnujjzU1wKHWA54f7rDmNbdfZUuzt2JSlbhiurQSqqAaDECbC2ni0wcBvas0vmRp2/afYRHPYST3m4tRlD47Y+Sq1NwkF4anrM4DO6ugFlZS5p1Att3kjD7Rsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YV479IgiGvaTL6Y7CPDE6Fb2IX1fXKLM+JWhWgYffg=;
 b=JvsyoJq02kl5pZxHad7b0l/zxOAR11bZQdB9MqOSzJvYv65sr0yBXYR0hoEP6yci2yHtO2zfAAVfqq7hkbil1Lh8d/1rcsfExqKCbx1QhdXHlJHddlNpFyTEJtXFsL2Lt83NFpUX5mZa16sVLU6FDqG4GJVIF0ZgmMIXyNqTdecCqbTJInSLn0V5tGCU0UFlcp8zh4jFdFH+NQCMgbShtvuDwChreWyuQ3Wd7vb1C7W9ZfslpmQK1S6CdC0pmY8dPf7PikKI/RVKjcg3ZnkynDeVU34RDKdkg+bO3UGbEx6sLQeHBeiieD+LRvZJKanP4oQvbTJhj8gOEO/marnqLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4d01771c-fd02-b607-c480-04bcb11fa7b3@suse.com>
Date: Thu, 6 Oct 2022 15:11:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: [PATCH 2/2][4.17] x86emul: pull permission check ahead for REP
 INS/OUTS
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
In-Reply-To: <4ca86bb6-ca6e-0c6f-448a-55fb73a3c02a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2ad2b6-9baa-4ebf-6269-08daa79c58ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sBNnI96a6uK9wRrw21ER8UUtsZ3YHWMS0iKRoo9MYa8bnaQPA423Yo0BrUBM4gwxdFZdBmajyvbmkHKkU0ZlBSXc+BfbCHj1eKZ5urhHxgewdiGEIS4m034vTWJ3bpIqR0bmBxNYAJs4UPoHWszN77arLC2GgbAO9nQiWhS0P3g+t/n+2Lsh8H9kj7Jmjv8fgXT8/8RJLOB7lf9ImxN89DYrLHhCNC1V1F4bJjqV7a5DTH8FOYBPvPfWe0+3gGttcBsEtFqITLURUO47yfHL1wGINrkSbDSHp/85n4YbYK5GbdE81bmZnZtt03qsbsAfGYFV/0rs++uSWbMNveAEMnFcdpZ59k2SMKz6JrDs15kwtrnlEFhywYDbJP7wmVXgxxV3IzZYcWgYTS3SqhCtsyd98C0TucoMhDuFVFU8XXuEBztupHE0QLuamcvRJAQxJp+F+STVRrRwDalCiN4PO8SRUbZ0bP2g2cc4A7zsRAOkmJoy8xbX6l/sXvB42il2EwTexWiXri/Ug471jzAjuH2MB9eYhOXYdfsWkDIETkLtmReLVgt4wcFVL7OiOP9bYpnZkLEoJHIQPUgwdOJrfkoL13fQYV6izI9z2QbLu3uQDNlukUo6XJqio0WULkzGl9uXuiPywW41isxZnWHpHp7QxSfm0hTrlcWVnNA8xVLSimztD7QPo90SmH/UBOroQM1unik0Ah351CuaD9j9HTF1ffMSFn/jar7Ul6eeAn4EPB4eZJQi/s94Gt1iRWlsa1WtHZEn0QiUaF3bzW6I1XS3J5rGfL+kdky6ZTS6o6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199015)(31686004)(36756003)(6506007)(26005)(8676002)(4326008)(83380400001)(31696002)(2616005)(478600001)(2906002)(186003)(41300700001)(316002)(86362001)(6512007)(6486002)(66476007)(66556008)(38100700002)(66946007)(8936002)(6916009)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTIvMkRoNGVxeEFXbmFaZ1BuSkZoZitibXc4ZXEyUkVCMHdXdUdJVnpzYzBO?=
 =?utf-8?B?YjNYLzdjTmk1MUxuNTlrVmc2SW5hVVdWbkJmdmJlMWpoUnBwZjRIdFZFR1Zn?=
 =?utf-8?B?WWxOaFN4VGNjdklKYld5bi9UNzVGNGdNU3gwRzJlSi9GOGR3Zk13VU83dXpm?=
 =?utf-8?B?SkVQUmhJNzg5ZHZEU3dneDlkOVV6dzluK0swZ3ZUbE02ZVJwUnFsREp2TTBE?=
 =?utf-8?B?bXlHaUdoM09UbURESitaMDIvb1RkbTc1dDZEV2lEUjZjZHdZdy8xekViZngv?=
 =?utf-8?B?NytsS0FXZi9OMXI1bElIaUY0YlNqWW54VnZ6QTl4RVF4RWtVWW5aYjJmQm9O?=
 =?utf-8?B?cEgvVS90R2t6VzZlK0pUS2RxSzFhNE1JamNyK1VDTWlVNUJqNTRMcmhjbEVF?=
 =?utf-8?B?ZHQ2bzdvd0xoUHJBQ0VocXFkdFhpMG9zNkFGdG5rWTZlWkx0UHh4S2RjMVdG?=
 =?utf-8?B?aXc0RzVIaEUyWHl5U2Jmdm9EejA2ZkZlOFkxclNrM0c3NW9NOTJOMnBwTXFq?=
 =?utf-8?B?R292bmJlQ25ueWJLQUNERUhHdm9aUWFXakliMGhrWkI5cTViZWdMNlBHakJL?=
 =?utf-8?B?ZElYMXVqY3ptMEZobHlOYkE1QUIyRVJ1dkt3RU4zSDVmMHVHNWFTcndoYW9p?=
 =?utf-8?B?S3dEYnpPbkpJVURTS3lnNm5sWWVTL0FRZkxWbTZUMXlucEhJMitQYmVheW1P?=
 =?utf-8?B?SVdCd2pZYk9NL3BONlJpREQ3Y3dMTkdDdlY0cDVKSGpjV1Q1VWE2dXRjS0VF?=
 =?utf-8?B?dExrRmtSUnFOcGpFUlhXOXU3bHQrRTcxMHpwN2owd3RsL1NMbXZTWEx5c1Zq?=
 =?utf-8?B?d1hyQW1Kc1lFZ0RHQnZmSnRLeHdzV1BaSnR6dlA5VTFUaUpYMzRRYm1EY2tM?=
 =?utf-8?B?OGQxYjV3MEFzVllScTZwVmJmS0M4dGlvcXNzdkF5WDVpSWhPTjFUU253SjQ2?=
 =?utf-8?B?NnNCVVhvaDZQYTlaY2poWmFQTklib3FqSDduZTJMTnhSN1Q0aWxjK3ZueGJp?=
 =?utf-8?B?Ry9vL2tyVFBDL05RUHBIRU9udmMwZ05UYUVhaHNnYUNBTU5SZXRIQTY4SjEv?=
 =?utf-8?B?bk1qaXJyeVdFYy9EQ29DYyt0QklEQm5HRFhJYUZHd2NjbEZWRVJ3TnBIalc5?=
 =?utf-8?B?WjdsYmFPZWlLcVNPck1DRmtBZ2lkZzdia1JYcldxUm1QWm0zUFp2Mk9MTmNp?=
 =?utf-8?B?dmxIeE1RVmg2LzFhejBWYlV0TzhRbkxKakEwNVJ1a2xoa1ZHaHJiRlVJOTBD?=
 =?utf-8?B?S01ZT2RST2NoRHpPSHRSWFB6Vnh4bE9QdTZwVUlZUXdDQ3l4bVpCL0JDRWR3?=
 =?utf-8?B?S013dDk4SGlsWC9rakl5MkVPSGZaaThMSVJFL3k5eEZOS3VDS0lGNGxVQThv?=
 =?utf-8?B?Qmc1Nk5PN0F3RVRaWWNaRStiQmdTRlNRcFdGWmNxYlpVU2RVTEE2anFhMFgw?=
 =?utf-8?B?UDN1MDBKUFZnaFpTbCt6TllzVkdWRG93eXdiNE5OWXpYUWY2WDY2bTN5YmVu?=
 =?utf-8?B?akZwc1kvb09EQjNPWGlMTmZHeEprMkdXd25oYjFwWFh4blJxdUswVVNTWis1?=
 =?utf-8?B?eVBER1JVT2ttZm5JckNyL0JvekFLeldsd1FUcHRSaEgxVUdYNzFCcldiRjlm?=
 =?utf-8?B?eTBVVGZvTXpQcnU4aFNoY2xGSTlXbkVBNXlPN01yc3k5VE9kRjZZRTQyNnlR?=
 =?utf-8?B?Wmd3SW9DWVo0R21BL00xTzFHNlRCZDAweWg3WitrUVdQQjFteEpEZmZiNDRr?=
 =?utf-8?B?Y3hmVFJSNFdMalBNUUxKdDBJTldDT3VVNk52RXZJaW11MUxXZ3Zab3hXZFJT?=
 =?utf-8?B?Rm44RzlnQUZWMnVQekhkeEZjSWpyT2JYdnFBbTl0NGtQNnFMWVJLeTVQY2g4?=
 =?utf-8?B?Zis2SjlvRW02T1haQ0JoWi9PNnlEMVFCYzJtOHBGYTVWNXg1YlVQbFFOdHVs?=
 =?utf-8?B?a09xMGc1bmNsaFM0RkJmZTdQZ3RxaG1SUnRTcjVabnhWQkJSMEpQUzdvbWZY?=
 =?utf-8?B?NGtGdHZDRXNDMVJZVm5RM0daWk9wS2I5MWljWXZPM2FXSnc4bGFVSWd3aFlC?=
 =?utf-8?B?akMvKzlpWmdSbG9QZU5GQU9qY205Z3M5bkNQa0xvSVhlNzZXb1pIVi9pYTRw?=
 =?utf-8?Q?9ZrHXEFlj6NlBi462azTsgKAa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2ad2b6-9baa-4ebf-6269-08daa79c58ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 13:11:57.8402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LO9rUm1gBDl86IWToJEmW8W209U6ElBuvMSZZRwRpSmH1mRP0Ff6HoxMUGjUyHof5Uez9wZDAzKhvDSaa1hOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9560

Based on observations on a fair range of hardware from both primary
vendors even zero-iteration-count instances of these insns perform the
port related permission checking first.

Fixes: fe300600464c ("x86: Fix emulation of REP prefix")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Partly RFC for this not being documented anywhere; inquiry pending.

The referenced commit is still not really the one, but before it REP
handling was so broken that I didn't want to go hunt further.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4248,14 +4248,15 @@ x86_emulate(
         goto imul;
 
     case 0x6c ... 0x6d: /* ins %dx,%es:%edi */ {
-        unsigned long nr_reps = get_rep_prefix(false, false);
+        unsigned long nr_reps;
         unsigned int port = _regs.dx;
 
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
-        dst.mem.seg = x86_seg_es;
-        dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
+        nr_reps = get_rep_prefix(false, false);
+        dst.mem.off = truncate_ea_and_reps(_regs.r(di), nr_reps, dst.bytes);
+        dst.mem.seg = x86_seg_es;
         /* Try the presumably most efficient approach first. */
         if ( !ops->rep_ins )
             nr_reps = 1;
@@ -4289,13 +4290,14 @@ x86_emulate(
     }
 
     case 0x6e ... 0x6f: /* outs %esi,%dx */ {
-        unsigned long nr_reps = get_rep_prefix(false, false);
+        unsigned long nr_reps;
         unsigned int port = _regs.dx;
 
         dst.bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
-        ea.mem.off = truncate_ea_and_reps(_regs.r(si), nr_reps, dst.bytes);
         if ( (rc = ioport_access_check(port, dst.bytes, ctxt, ops)) != 0 )
             goto done;
+        nr_reps = get_rep_prefix(false, false);
+        ea.mem.off = truncate_ea_and_reps(_regs.r(si), nr_reps, dst.bytes);
         /* Try the presumably most efficient approach first. */
         if ( !ops->rep_outs )
             nr_reps = 1;


