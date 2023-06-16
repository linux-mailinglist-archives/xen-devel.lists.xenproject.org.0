Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59232733149
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 14:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550142.859046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8dz-0004Ek-5V; Fri, 16 Jun 2023 12:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550142.859046; Fri, 16 Jun 2023 12:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8dz-0004Bc-2Z; Fri, 16 Jun 2023 12:33:35 +0000
Received: by outflank-mailman (input) for mailman id 550142;
 Fri, 16 Jun 2023 12:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA8dx-0004BW-RW
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 12:33:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0062b1d9-0c42-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 14:33:31 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 12:33:29 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3%2]) with mapi id 15.20.6477.028; Fri, 16 Jun 2023
 12:33:29 +0000
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
X-Inumbo-ID: 0062b1d9-0c42-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJky29xXbm48AD34wVFIGa1G8twKvpWcUC9W7lmDDt5dNrqJE0SqsPOHTxBBeIxJsaiDXf4+PSDavy56zE3qFTdofmFvhxfYRPOqwB0lvXgXaFebL1JHQeFGa9t2jvnt1Ajli6kdBYJq2OVEObM93YZHzfb7nfVyLuyQ1llOhBqXXenfYEiqh0AQYCmFj5/SXmMucmjlrDF0kNzb1ONDC42cMWASynGH5Jpvb6oUiZFhLETnqH22s9vUZlMvXWNHs6hS9UswV1//iztkdBz4RfgpSZJ4yfCYs4vvBuIewF8v4mUP6m7gxqGdw7uOVP8DItZE0VGY4yrti5anIoI48w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klBzpCbgSPj0ni89aaVPSPANxPpV6E2Ix9Zp/2rfEHc=;
 b=WxqlEgbMnBFtpamqh5UY9IrrHKVwVHuCI+LNIBMHFYKDHfXAFTo3Hm4DvjtPaVoPgkWF+b3q2xFV+5HRTqA6XIvVEKtX/nNfUyO+zwgF7jneoeF21pVRMabEvzHNi51Ki3R6FAp7jkZa0g5ywB8uDABMDUAbSn8vwr0Bcqmlg4vNb80WJZuvkhTaEBMnmAAV/26e8zypUwOPDU2FoMDNPZ10tYcbO4PllHWMefp6L3eYdQf2DpQJ/SxVbarYqur6KeIqV99QCI5OrTV534GqeQFcq+DqYx7fh739VO8044JxgB9grVfoFaU5okfFCBIwFYcdCCfX8ytZTMvvo5WEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klBzpCbgSPj0ni89aaVPSPANxPpV6E2Ix9Zp/2rfEHc=;
 b=YdrN1j15L8yRomn8Nyfodmr4SYL+mRjRZm2Lz5gW1uUGcFL70S5RxhHxaqS+ilUEPgI4N18riVYSEz2+0Qd6j/ICEf2B4GfK4P9YZzFEpLAvtLe8lzaNDPLyKdA9t0cXU/ZLq2aGPpJX1ZElzBTwOFLX/k5cwhDNzFqlq39jOQgy5xq4K1R2lbuh7vPIZP1yGsSadFLlnbcuY3aoNZ2YXPMibxRg19gQMS/pooq8MHoVrguINJnBFLfEj5c/oSSoNcrB3iUEH0vSGJYNPyV6gKc0gL1ON/tM6/rfIH9/3ySXSx7jUPAQWmv8yOoCZOPquOFd5tt3juDgsqN7L/QitQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51f4fa1f-065b-2e3f-97cd-fb91737150e8@suse.com>
Date: Fri, 16 Jun 2023 14:33:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: fix expansion of %XV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::19) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f22c31-bea7-4ee1-63df-08db6e65e3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	48XYupuz20affJ2iFud2ByNvpDNFkfmSf1v5r3SGsSghB2cn9KOMuE3IwXc0anFf4latctDUEKBGP7UyiaMu4mRcMrW39Li67UTA9J7Mrixz6Xwl0DWnUTCQV5H3EF65qibFVYGr2osY7kr3o/TXQTNyTpjtw8vW4+uLYNPwrf23Mbfdqu0mzuHZdAxjwm+prmHr4ABueJsL+YGYYeHdVBzkm3Ob8akDGxkXwaKAb3Npow4vqoMNi3xm4uiiYvDFzfDJ2efJKqTHgzVM++V10TwhmjR+3n2fClt4fuWwU8tIPFIahNgqgqnPUZyujAw6seBFpfHfSRVPlkr3jrk3PsBN6mJyIvDQQu3A0ZCfq4zdyjiSwqdsDhvJpXbATtnEG1Et2CFHIPpMhs6VUD1RPeElYGYnbPqUXRXDkunfC9JyuK6Up8OKcoMb1+YI4MnQrJicIpaSXguHU+x8SIokpkBU7Ci/qXHMkADlADK3oMdWMRG8hnkuhqxHontGStibVa9ZkfZMAzRmP7NagkwrD/VBqXY8rBkuStQqCwDoF41yiSfEaqCnIS8Re7Pn4oxfMj1WDDe2o8HpUdIMlDZaz14VijRa/aCMB4BxPTZGCj3g4ar2LhpIHtxzqNsE3J7POQxPGaPPcPn0iQRrCtJISg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(31686004)(41300700001)(86362001)(31696002)(6916009)(66946007)(66556008)(66476007)(8676002)(6486002)(8936002)(316002)(36756003)(4326008)(478600001)(6512007)(26005)(5660300002)(6506007)(2906002)(4744005)(186003)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdvR0NERDU1dEo3YktRUG5jeVd2Z0dOMHc5Q282MngrYU1zelFQL0kzV013?=
 =?utf-8?B?d1VXSmxkYTVxemdwcjJ1VXU0c084MHg4ZDBxaUFlQ0wwLzJLdElaZExTZXZp?=
 =?utf-8?B?dUN0dURlWitIYkNWbWxDZE5qbWZHRXh1NSt3azRvaU1ZZVVxUFpkZTBEV3BL?=
 =?utf-8?B?UEpERGhoVlNYY1ZMZHQwR1dISWdxcTU0dzRYMGtNT2FxWm8xejVYR3Fqa1Zu?=
 =?utf-8?B?TUFMZjhsS1ViQW01d3c5U1VBVzNoVWxYRUN5Q2JCa3hSSDhPcHVIK3VjMXZa?=
 =?utf-8?B?enRmeXZmK1FqY1FmUXFzQzB3MlNkdElVMzE1czJZbis4czAwQ0tkNGZNbXJO?=
 =?utf-8?B?NGw5OC9iNGIrVzY0SkYzQk1rOVlvdnJadWlJdTNsa2h5aWNycTNxbWxSRTNJ?=
 =?utf-8?B?TGM4Q3JES2hVU3k5Q2JlRkRPSzN4SlpuYVpyNHhPc2lUazdXZnFQV3cyend4?=
 =?utf-8?B?dFVnNzBSNnRwaFgzcFkzV2pFcGx1a1lOcDdOQitkNWI2KzN6bFZCQlZpVEJB?=
 =?utf-8?B?WkZKMGdRUDRIRFE4VzR6V3pYNVE2VVBqSEFUTXhmUFl3QnQzNG1iU3F4WUU0?=
 =?utf-8?B?bnJyYjlzdE51QjBwWlZjRCtRazIwNHNuSmI1blZyK1Frc2lnRDJpZjY5UFk0?=
 =?utf-8?B?L09LQlEzZEV3WFJiTlVFWEpQbHVKNnBmUHQ3NXROSSsyUVpPTlJLUGt3a3hW?=
 =?utf-8?B?c1U2WW5CTm1hRDJsK1NYbTR4Rm1GemRlQXVpVE5ScU1CSXVPc2wvWDhoQk5x?=
 =?utf-8?B?WENGcFlHdGhkZlZGL3p2S2lwMlBMTUNiSHNuZ1V2dUtDSVBjQS9TTDR6STB1?=
 =?utf-8?B?dDZxWGQ0REhCUjh0Wmt5RjFYbzh2bWI3YkVJMVZHRSt2OFo5MDE2bk9uUDJu?=
 =?utf-8?B?c2R4K1paRUdxZVRxQVE5WnBTbWN2QlhUZ3JNSjlaaFp6cjZOeUk4WFpHRGY4?=
 =?utf-8?B?dlRta0xTdE1HK1lpZTdieDQrK2F2UXJ4dU1PMEk2dTM4QnhmRGFKMDNLN3ZH?=
 =?utf-8?B?WGx1aVJHS1BQRFRDbG9yNlYxQldVVS9lUXc4T2dVRVoxYUJSVXBWV0hSaGlJ?=
 =?utf-8?B?VElLQnB6Vk01Ymw2WGx4UjBoS250M3BDbGZIeitXN2swSTJqcEQwNUQxR05X?=
 =?utf-8?B?dG5Ra1hwYTVOQXpoSGIyMXFnaFRXSWhsSFVWdFpkUXJTUHJxcWp6bVpQeDEz?=
 =?utf-8?B?SncvR1dpV3lhWGxSeGwxb1hxTXl4bUNNM3BMeVRtS3pWWDMyL01yMCsycDZu?=
 =?utf-8?B?UlRGc3I3UVVJNS9QSExZYTVlbVBkRHZOTTlxVEZwRENiNnlkZkpFUWY3YnpU?=
 =?utf-8?B?WXNZek1KbFJHTEhha2lmV3pydEFTbW55bXVST1M0M3p0Q1ArUVk4TDMzYkEr?=
 =?utf-8?B?L05vSG96RTNTZDRHRVdWaXRmRHZlam5DMWlQQ055bWJ2YW9qSlh3SmxORkRu?=
 =?utf-8?B?RjM3V0ZjL0ZTVEpNWGQ4VzV5Y3BmMkZGQjA1d2JIMGR6Q2NLVEtJTkxtckMr?=
 =?utf-8?B?TTdCZnBsemd5RzVUK1Bic2dYNHRDTlBMSHBRUlFuMHhsckg2c0x1VzcvNkVk?=
 =?utf-8?B?T2lKT3psd2pBZWExWEVITHAzejNPQmVsZkd6L0dKTnB4RG5DdThDdWdWWEdY?=
 =?utf-8?B?YzF3N214OVdjdHhJdUwvWnFEL1pGY0pJMGx5dXVXU3hyZ2R2ZzJBMTZxeTJy?=
 =?utf-8?B?ekdndDY2V3hJbDhNWEdaYm5nL1hIa2d1K2l3UHp2ZXlrU1Z4SzJFalNFODBI?=
 =?utf-8?B?cUptcFhZeUl3QUp1dll5M28xSjBxODY2dFQ0dVFhVWlPb2I4RG9kcSt6bmVE?=
 =?utf-8?B?Vm95OUZyM0dkbS9waEx0dVF1c05OR2F1WXVMSEdMSXFGNlF2YkE0WUNrY1Ir?=
 =?utf-8?B?eHYwK1JxM1Z0YWpudTNIckhvdHczcUtyQVlrZm9XUk5yYVNCd1pPNDlKSUN1?=
 =?utf-8?B?eUs5cnpOb2RueGJsbDc3c3l1a240MnNYZjhWQTQxUWVYUStleGlsUjZGbjRB?=
 =?utf-8?B?RW5JNEFJU1RMdnY2enNXRysyV0NsYThBQnRxOFh1cjc5Q0dFKy9oQVEvM1JP?=
 =?utf-8?B?NHdBZjhyK3FTbU9yeXU3VmVFQjFqTWdTRll1R2ZiUHZkZVdZckZheGJUbzRw?=
 =?utf-8?Q?xT7/Bo7CyVGKeMt97IMRAJZJO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f22c31-bea7-4ee1-63df-08db6e65e3ca
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 12:33:29.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8fokaxyDP7IDqRwXLzy7XCyghjOX0XlVDrDXKAvxqH1e6A/AV1GCDWAErL4iLa9vdsWLXe1Y6p3XPjoG6yOcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220

Only %LV should continue on to S handling; avoid emitting a stray 'l'
(typically) in suffix-always mode.

--- a/opcodes/i386-dis.c
+++ b/opcodes/i386-dis.c
@@ -11067,19 +11067,20 @@ putop (instr_info *ins, const char *in_t
 		  *ins->obufp++ = ' ';
 		  break;
 		case 'L':
-		  if (!(ins->rex & REX_W))
-		    break;
-		  *ins->obufp++ = 'a';
-		  *ins->obufp++ = 'b';
-		  *ins->obufp++ = 's';
-		  break;
+		  if (ins->rex & REX_W)
+		    {
+		      *ins->obufp++ = 'a';
+		      *ins->obufp++ = 'b';
+		      *ins->obufp++ = 's';
+		    }
+		  goto case_S;
 		default:
 		  abort ();
 		}
 	    }
 	  else
 	    abort ();
-	  goto case_S;
+	  break;
 	case 'W':
 	  if (l == 0)
 	    {

