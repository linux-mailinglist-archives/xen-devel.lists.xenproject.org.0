Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E865B952C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 09:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407247.649679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjD4-00040w-Ca; Thu, 15 Sep 2022 07:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407247.649679; Thu, 15 Sep 2022 07:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjD4-0003y2-9k; Thu, 15 Sep 2022 07:22:54 +0000
Received: by outflank-mailman (input) for mailman id 407247;
 Thu, 15 Sep 2022 07:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYjD2-0003xw-Rx
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 07:22:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60063.outbound.protection.outlook.com [40.107.6.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34fc20c6-34c7-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 09:22:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8230.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Thu, 15 Sep
 2022 07:22:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 07:22:49 +0000
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
X-Inumbo-ID: 34fc20c6-34c7-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbGBjBJHe+6Dle6kJCy4v5Snpbu3FNAnERZ6AFgPDbgbJfyQxY6Mt8FEBIapbSH5iVQYNh0fsRulM9og/DjyCYylwrku2L97l6ZIC+C8RQCowD6G60vpDeHF7F/souVsVU+VfyGL8OXdUQ1ZXTi9UuTz3Y91LViYTeMMlRw4wlqJ1C0SJ5QmbL45vbekuhK5JWSnEKInEX/7zTTXM/Xd5yzQ5cYRuf60iYBj7BZrBYK6jm7mQagqATTnaAJMqHK0CHNIPfFhEOCx1/zU656+rVtV7R6dpv8VHMvBS5ySeEqen1vi4FdR4KozHNGPOOOQf0TVFhAl7fpfdFDQnsIBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NMgwMZFryGjeLshoYixp5UtIBsvl6HipZhufTopacQ=;
 b=XVarDBTiWO7IxYA33Yw0eGk3IddqX7y1txT208l26VH76TLx78btsn6nxZdcz3Wr8+/eqRoeT+5wd5oGI7x4wzgx15OGQhTyKnkGkqhVEspnxl9a58tlwvVRQZFei67+yxyXcznrwiZfb/9PhPYsLlf9OPAW3pNQzWAIjE4UW5+IqsFjyf64RMmQDk6NGbJn4NzxCFOa4iVvD+RdMzCyDwt+5mSPI8jsp+sD5hGzCs+iiZpmxDRH9Q4AKwPQMVD78Ugjq74Uo2SeRM1TNT077m1ShkBNefPv5W1b1EPNGjMY5G/DuEY7OukP3fNV+V+8mYZqrqup8g8r2vlB1OOxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NMgwMZFryGjeLshoYixp5UtIBsvl6HipZhufTopacQ=;
 b=LL6gTk4J25N8zvzvR2d77jMRjdjP68l5arxmr60Fu/tTgXeLCmSfkUGes67IATAdQYIMgHjxCwg+Tt8CizLn00nc5qveARwLwPgWsyHWBoBTSj+wUk8SGkO8TauYfUwzm7u3fYtF1yhlzK1szGsseVk9jRxlKEqlqct14Heh3QlOkDF855UEvCkgP8AAXhGKCoeYaTAhj1Ut43+akmSZpM/g3SlvP4l683hLTKGSznkso2sI4coY6rk81xKjpinbCes4shJjmKX21VD2yWkR6tzglWnM8g3yvftUut0noxmjS2RExpMBKuA8lLaHRkDuoJrGTQabgKdpeTuYCEYzmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0103a30-22b7-c010-3e8b-6eab1c25ee47@suse.com>
Date: Thu, 15 Sep 2022 09:22:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: respect NSCB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cf6b9d-f256-4e7c-924a-08da96eb182c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kGljZIqaL3PlL7yYSiwXucAveOcmUAZe44rltFmlSoCgAHCuU3ksobJ/wPCEy9kPdr8E5BmYNnabKu9ZYV656hsaFo8nxTOMFb+busCwliUBOulKaEhydcpBuhyfuqa2B03yOA9Hgh2JMM0WMUQFWeuukoHVMmnqKHNMQVO46IOp3t+ZD+H3OBRHUzfrdJXr33Su6RW7RARf0y4m+fl0YGKlJwI1ElYUqsWqAFkKWC5qeOl5TaHJRz6mxrIj3ONfhEgDFbymGQj1jSGj/X0Mk9ns9teNbg/pNoxxGmicxAIc6kHE5cvx27kPfv6yMt/KbJT3eyg17lsi+lPrvXlGt2sBdz9G++vNoZMFkaueqlY8iBieCr3P6Fr7ckbDi2Jz2DtBkO5SeCuj1g51nFjXr2NtrVJ38Aw0/3ynbhI7ytdXhYoLy8cKFkCeggd/u1l1ljV5B4ByqoGdulHDmplyfbs8af8CZobnAGGIBbNZ1fdm/q8+EtdqvqEuC/dfkwj9BNVjRi/CqaUX7exw6JEVL8Yx5J2AZrqA0qMn9muvZ9CaBADlF6xzJU32LrbQs9f2fRRHKST5oOYQb+ZJhoomPH5cuZJNMrflgD67gAI4dq1/g8OfpsJu2jX/mrKe0FgIvDUKea0Q44rq91ncLOThaPGE5d10k4it3vWjcj50rbLcXk4Q9ILIobpm1NNTrDMlT7Y3jTfdkRIiAL4mbogDLt3pqntFUS7PT2vAb5MwhDmK1pyUmJ0ewbaQ3SLtkr8wYD9DjJwOYhvGDb2Xqr59RxgRoOBuJNSwwymsSRk6Ed0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(31686004)(4326008)(8676002)(66476007)(66556008)(66946007)(6916009)(4744005)(6506007)(54906003)(8936002)(2616005)(2906002)(5660300002)(186003)(83380400001)(36756003)(6512007)(38100700002)(41300700001)(6486002)(26005)(478600001)(316002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnlIZWZ0TFR3R2FHQjBiZnVVRzRPSEJ3bVFUaENYcmRMNVBjalNMSXlRdjRs?=
 =?utf-8?B?SER2UktibzhGUWdmazBIeFpzRmw5VmZiNmFjai93U0ttTEFYYy9FcUV4RW9T?=
 =?utf-8?B?U3NVYWsxUERTZ0VXZm1nRytLZWV0VUlLK3R4SmY1UWJZVlloUFNxYTY1OVBX?=
 =?utf-8?B?YU1aYlNLMzhMelhMaXJmSFRmM0RINGROaEN6RnVXeWgwT0xYMEZCUVZpZmk4?=
 =?utf-8?B?dW9IdkdHcFVqaDhMUTlIOEhIN3pPM1VtdWwyd3habjRUd3l2ZDN3c2xrMVJM?=
 =?utf-8?B?dWk0VzNvbWdDS255djNMNG9ZeTRCQXZwRzUrcFRla1RxQktPN3ZvcXlpRFdk?=
 =?utf-8?B?N3Mya1BQVTBZV0UwaTVtVjdUb3VuNmhLWHRUNUNHa1orMjlvaVFHd2t0NDJv?=
 =?utf-8?B?UUJPaUxsUTA5OTFvY2dYM3NMZjNQMFZZMkJHSUE4SDhiYUpZNk4xZHEvZFBX?=
 =?utf-8?B?MnorY1FXTmVzS0FDN1AxaDJraXVycnhFVDF0Sm1sRzVjbm94d292YWxEWHNN?=
 =?utf-8?B?Ri9QcCtJQlVnT0JMWkxEczRadnlFVkdpWHFtSTdYanBGdTYrMHFyU0YyMFA1?=
 =?utf-8?B?RTE3emVqYmcvUHFEMmRtZVZ1azZNbTVSNUg5V08rekUrTENCUWY5RHJYR2Rh?=
 =?utf-8?B?RlFZamk4WTdwbjFsSmJNcjdBeGtsOTVBMG9ZWGFOZjJLUHZ5YkxuT0NRU3Rs?=
 =?utf-8?B?Ujk4YURDUjRnaTVMM2pWWmlEdFMrTTFQRE4zOWpLZThyZ0pCYm9HcHZ1KzU1?=
 =?utf-8?B?TE44dUpxakVNMzdUalFoVTJkOFU3UHgvRE9SaWswb2wxWlc3aVc2dEFBYjBZ?=
 =?utf-8?B?K0tVT1FwaExJWW5xS2wxa0Urc1ZINXBLZWpLaVpDYWhhUXcyU3czMHlUZ0Q3?=
 =?utf-8?B?aXozU3gvNjZwLy9oYlVFdlRxR3pHVC85MVoza2tRVVlrNXY0aGsxdENFL1ls?=
 =?utf-8?B?ZTFLamROZnZ5L1RmdWxCbzI3U1FLcUh1RDhReGZJS1F6YUFhRkE0MTJId2hH?=
 =?utf-8?B?RFF4UlZRRkk1UDh5NmdWVlpWZkdleHlqQWpINFZiU3pOeXppSDNRb2RTZERQ?=
 =?utf-8?B?TWNndXFCQ0xYQ3N5TEw2K0V0Z1pLQjhJR0pNSGQyQmZCdGhKd05icWlveUhD?=
 =?utf-8?B?ZlZSYmlOUUwybXRSVjE0TlQwQzFCVlVnc2ZoSHlvYVFJQnBlWXJHcUFnWnBL?=
 =?utf-8?B?SjVBR0I1RFVSNU9vWVAySlp0ZVBLRWJhb1dMc1FFbFBkMXFJZGtHRjQ3bzNj?=
 =?utf-8?B?R3hzNUg4eDZTcVJSN2kwOUtvYUFhbjg0QzJ6QmRZTktDdTRDWHl4aEtqUzZt?=
 =?utf-8?B?SlNVSDV3ZmRvNlhTeHpwQk11SDRhamxaaGNJZFI4NVRBZ0Ftbk5NVzlzOEVQ?=
 =?utf-8?B?aXBUTDRBSXcxdkY0NE5ucTZCQmhHOVNUMml1YlAvWFlkZ0w3RCtJZlhyem9X?=
 =?utf-8?B?a2E5cFpVQUU2dWpWNUNmaGZPUE1mK2pOeEg0a3BDUzNwbW1ueGR2bkZZMFVC?=
 =?utf-8?B?YTFWTzlQeVVtQkIzSVhBSWRPMUpYNWJ6V3ROSm9vdHRsMkhvckFVK1IwdWRG?=
 =?utf-8?B?MkRONzFDZWpSd2xreXpjbEM5djg2N1hDaDFTNjd3UTlqOHorajRJL2UrNW5H?=
 =?utf-8?B?T1U2UnRuRzErbk5qNUVrWXlhOEtRaDFGZ3cxc3Fmdlcwb3VyYWxEZGM2cUNm?=
 =?utf-8?B?TmN1a1NKNHJNL3pvdHBkRUhXVTh3b3MzS0VsVmptbGJGSVcvV2ZUYzNEVTRH?=
 =?utf-8?B?TFZUMGpkMGRtQW1OWmliN0c4TWNBRGFJQ0JGMzVGRms5VHhxeEt6bmVsN0hO?=
 =?utf-8?B?SFNXa1VQT0k4SXVJUWZPUGEydXo0bFVZdmU0TW5lcUhYY2tzUkhxMXBBaW9C?=
 =?utf-8?B?RWE4aDRFaTFxc3BNSFk1UGc1REJjNmhFTU1YWlZDbFd3S3d4bkpvNGxyU0o5?=
 =?utf-8?B?L0x0Z0hpZHlSMTYxelZBWDRQRkdCWkVTSWh5dlM3dlpaeGVlSW8wdzdodi9x?=
 =?utf-8?B?N0dVa3liWkRqUXIrK2Q3N1Q4dnNlNVR0ck1YcDRTMHM5Rmp3ajlDRm5LU3d5?=
 =?utf-8?B?MDFTMTVvalVtMHNGOUtKMzloclFpbXpGK1FPUVFZUm1hT0tNaVN1cDFxdU1s?=
 =?utf-8?Q?tUxY5iI0pFGcU+GAA79OpWPY3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cf6b9d-f256-4e7c-924a-08da96eb182c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 07:22:49.5276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lM1DSEzV+VFDNHtdkgF39hEmE8Db+KzjfYU1bfURlz3SoiHYZBi3RPg2w2ri5qdT398Z5ImrmlGeXZwhjLbfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8230

protmode_load_seg() would better adhere to that "feature" of clearing
base (and limit) during NULL selector loads.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1970,6 +1970,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tbm()         (ctxt->cpuid->extd.tbm)
 #define vcpu_has_clzero()      (ctxt->cpuid->extd.clzero)
 #define vcpu_has_wbnoinvd()    (ctxt->cpuid->extd.wbnoinvd)
+#define vcpu_has_nscb()        (ctxt->cpuid->extd.nscb)
 
 #define vcpu_has_bmi1()        (ctxt->cpuid->feat.bmi1)
 #define vcpu_has_hle()         (ctxt->cpuid->feat.hle)
@@ -2102,7 +2103,7 @@ protmode_load_seg(
         case x86_seg_tr:
             goto raise_exn;
         }
-        if ( !_amd_like(cp) || !ops->read_segment ||
+        if ( !_amd_like(cp) || vcpu_has_nscb() || !ops->read_segment ||
              ops->read_segment(seg, sreg, ctxt) != X86EMUL_OKAY )
             memset(sreg, 0, sizeof(*sreg));
         else

