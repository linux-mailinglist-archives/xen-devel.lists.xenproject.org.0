Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F27920FF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595440.928999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdROV-00069N-Sl; Tue, 05 Sep 2023 08:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595440.928999; Tue, 05 Sep 2023 08:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdROV-00066T-Pt; Tue, 05 Sep 2023 08:26:43 +0000
Received: by outflank-mailman (input) for mailman id 595440;
 Tue, 05 Sep 2023 08:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdROU-00066N-Aj
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:26:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efe3b5ec-4bc5-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 10:26:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9262.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 08:26:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:26:38 +0000
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
X-Inumbo-ID: efe3b5ec-4bc5-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmiK7gcobTEwJ1ZVrnCLcr2AnHc88NVOzsQ2dbZqutZIoOWGHk5Tn9+dA5lzxa8hfJClNDvAj91P+qi/WWC85jjk4vx0ZzgNvSLp3WOJl0QXf7U0evFC7+nauSBnzZ4ecNVEZ/jtHpOUMg40ZHhH4VLjQG/KWxmqvuxqCpNIl1fSQlJKnS4bz2s2miQK7JM/2IDgfwqdxZio3gebpk/qgKiEd246vvXEdFrVzuxbOHs1XfOzagD2o/vdmKY4dVQVZz/m9js/az5ouy+yPxXmvyvIe1c2VWyqsnRaWTAjWHSvbxS0Lr6H4dBFiEiywJW1Eowpon/vxWlNWkkCyBndmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCjZhitKxoSe0B59YDSAKns2l7OfkDSX/iRNgrXhgrM=;
 b=PpojojDA3+wYqbRd7DmNXJxM2tbB03H7rmVTTKoOooPEGaCUdpeDpMw8HjRSjHsl+c0ygtykdz4XGERgum5TbPI2BNumnXiSF5dPKMTzEGw/crGUt6vT/92gpa9jN1l17dkVk+IxTmQ8w0aKRcHDnKsFMltGUS5DsHM6TaZY4mA1LPAqAaxCbj580gyIl2zLoGxKfGFKG8FlKwD1IF4xTT1NmMckjRc4hJAORq8Tv/Xm7QARccRxhaheyqzNYhS3LG0sGD2L8GI6vI/JWT8fN29hjZkeWCy8KhzpPFcGhl7nbf+gpjRI5VmUo1CDtlN9M7z4TmtTUSDET1LlnBKOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCjZhitKxoSe0B59YDSAKns2l7OfkDSX/iRNgrXhgrM=;
 b=lHYJnao2Ln68YzmR7tLSR9BrWydvHi+93bDrYvspEbdyVbznrA83Zy83V0ZjFcCSvMznTGtiribBewMFPLpA45wkIitj/9W7bkRgKFEEPx8BFIPAuDiGC+F3NIgL1R88/aDihuqCGudGOgTybBSHrZo+MlQ6yHQJhLSCfW1WL/H+8QLzpay1ScBdFrllrNUc6rMxlxGmSLdmOPxWxSUcKqVpmoBN5Ko+QIeBhrN+rVsQLFDTA01QP+v0iXfwkayQNgE9lq2fRgcC30C/vW2RrzqjfGyyzTMN+4mz1o3EY/JL17xgKpPLKmuYXkdrqxb1Rwo/FamPeY/xcYQ4mNI1lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bea2061-e6df-2cea-4bff-858b0f44a0c2@suse.com>
Date: Tue, 5 Sep 2023 10:26:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] Arm: constrain {,u}int64_aligned_t in public header
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: 996495c6-d118-4cd3-37e2-08dbade9d303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RV5adJSCGbsQp/z1zAKYX4WJm7LSHVA3aXe2134H4j805HLXhB6344nhdz4OKQ3v3rctEB/MXjpcFplDrUCXxMwgZkt3ipFmFZ8WtWJsvHw1clEx18O4dq+TBr6U6ntjjt7JtFZQ0AYrwq6dCWPBYlAw+q5Mq0XqFIyx+VzQQVOYUSGXtsK029JAQxLfJmo+81r2iiSzfHdqNZw9bYRmxQ19W7gPbOkFmyU0uYivXg87khPzHziWWQClUhMrDDTvQbdBBClgSl3MwCrY+fxqBbObCoy6Fg/8VSliJoZ/cUGy+VyvEf7h5/k6vU73XhGdF6IqshOTfrIWkLYZmYL2vHuD/fyrr2dTiuEJS7G2TU2S5AHR0jjiAhHR9omdgtkkXtrbt0ReNhwhlOfxF+z0zYi7kahXZfgXxIfBzCxNyadkGLQbNDONuee922LAIVlki8M0WORPLM/R4nmn6iGiMe/e6iTcNEuwiRgV2oKhsxyrrx1EC9A0MIKDJqHf5/+/bxEfwGzifka4ProttSxHcfGG22LEbkXUKxnzIoODDRpwFAcfNlGe8VTNr4yjRL0AoNG8A/Q1wBVs4EnGAL5aZMG+WU5GU00GIEH0pIvqNHt3bILsEnf/q9mAZifj0qtXuLAd9FOpRvaEj7AgUsC/bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(451199024)(186009)(8936002)(31686004)(5660300002)(2906002)(6916009)(36756003)(316002)(54906003)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(6506007)(6486002)(6512007)(26005)(478600001)(38100700002)(2616005)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkZqdFFmWnYxdytISDMzd2lMMnI1OVpkVTZUbVNacTk2S0J4akNldHRVeHBi?=
 =?utf-8?B?SXEwVVU4aFhkWVByYXlUM3VVcHJSWWwvMGpzZVhHNG14VlpROVB5TUJkTm5l?=
 =?utf-8?B?TUNQUitwbWZaMVh6ZmJFTE1iQW1NUENROFA4Tkc1U25Wb3pjOXBxTlVyK24x?=
 =?utf-8?B?Q3J4L1dtRFh5SWJGYVVSVVJpMUNmVExpQ2FDN2pyS0t1ajBxZVVXcitrdzBS?=
 =?utf-8?B?RTJwU24veUhleDV2Si9VTEloNnNmczRSckxHd3Fvcm5VakcvYTdOcEtJY1Bn?=
 =?utf-8?B?NXQ4NWhwTzJPc3NvTW9FY1lhRFQzaVczN2pVL2hIVFBkSmI2dGtCM0xxTlpj?=
 =?utf-8?B?SmFhTEh1ejBOSVllNmpJTnRCWjRsOVN4WUtDcEJETEVhQkdlMjBsMk5OSzV6?=
 =?utf-8?B?YnJCaUwrL05Way9LMnh0aTNDdHMvOTBJV0ZPeXpoalZrNHd4dVRZdVZkWHdh?=
 =?utf-8?B?U1o1cUtWQTFwbENVUVB4MUROYmFTMXJMRE5XUGZKUy9ZVWhtdm1QL1BPTVpB?=
 =?utf-8?B?cFptdEdtZlEyUDBsR1JtWjlSM3BzS0JnWjJiODhLS1ZPeHNMbzZYcFFUdFB0?=
 =?utf-8?B?RURhZGIvMmthc0NGamdYYTNXRG1CbUF3aFJIbU9hYVE5NVpqR3Q4aW9LSEFH?=
 =?utf-8?B?RzdOcWg3MnlHSGttVnJIYVgzU2lhNHB5a09tb2UzZS9BSHROTExWcGE5emZi?=
 =?utf-8?B?em95RVNud2Q1MWhTSkFzdE1qaGZnQUIwUjBpK01LTmVROTMwV2tIMjZSbDkw?=
 =?utf-8?B?UDZ5aFRkcGp1cDhaVjNaSXl2RCsrdXJnYkJWTGpxVDRKS0tIR2JLSnU3NVM4?=
 =?utf-8?B?ODRoUERTcDM3K29seTJQUkFCemtIRlRFbFZocGg3czVBOWtZaVJOL0puWUpX?=
 =?utf-8?B?NXh5cHZtQmF1YzAxQTBzd2xzNFVPdXFCMW9WaGgwak93dmhSNktYeVZ5c3lx?=
 =?utf-8?B?L2FlMW5Sd1FCZ1M0M1pVZ2txa05PNDIyRHc0cTBvWEpLclJ1aWNoRFJyWUg3?=
 =?utf-8?B?SGhnZkdMVUo1U2d3cnNzQTNTTWNSNFJUb0NkaThtN0RCZm5rVXlpeUIxUjdz?=
 =?utf-8?B?bnVIcWI5bDZtQWlzNDhiMEVnK3puSDZoRHJ4NHdRYktXcXh2cDNjdXR1czBV?=
 =?utf-8?B?SjF0NHFxaVpoZ05GYkVkUlVzK1I5WTZoTWkyNjFGY0tmWkdVaUxkMjJPNUlC?=
 =?utf-8?B?NVp2TkM0TCtUWWp1U0J1Q2QxU2FBU1hWeWpTaHorKzBtZktlaXVBdzVpK2FZ?=
 =?utf-8?B?R0hzM0hXNHZFUGRFNDdvdG1JK1dRb0xCYWR0amNQMTFTT2lLSDZtY2N2R09x?=
 =?utf-8?B?eUxTQjFjbExNdVJSTk02YVR4MTR2R1NrQitFM0krdDNsYWl4WHFJYzROZWcr?=
 =?utf-8?B?MStSK3dkdVczRS9kREJ4TTdyNit0dkFmTGlHaGh0eCtYYUU4TkVWZHVuRUpG?=
 =?utf-8?B?NUhVUFR1M2VTVzl4bXpHVmVNMld1VWRmZjUzK1BqbWVON1hYeFp5a2pmQjN5?=
 =?utf-8?B?MGJEeUJyaldaejNDL0lIMFNxOWNidmNaL1Y5RVBnSis4RDR2VUxzNkNJOTNr?=
 =?utf-8?B?enBRREtDelRBUkdHbHM1eHRBZ3FHQ1B3VUJJaHZodjVjVnlZWWlZSERYWnQ2?=
 =?utf-8?B?TUxMOGlIS1F3RHRCTVBuV25SSnowS0NMT0FtOTJheTFXcXpicVg0aTVvbHpO?=
 =?utf-8?B?YVVKNzhsMHUvYlExa2ZQR2NiTGlZaGUyYkZoMFAwQ2VMcFVYWXc2clcyWlEw?=
 =?utf-8?B?cVhLWitvWnl6TGhxcFlrVTAvME5BT2djNUdVUEhFZG5LR003RE4zUlpnU0FH?=
 =?utf-8?B?RE1jZTBGNTYyMVVSZVIybnFQRDQ1WWRTSDhZTkdkQ3dadVpJdGYzR0hZSU9o?=
 =?utf-8?B?OUxaRGpMQ3R0OFN6bnlpamR1Q0VxTnRuS0l6a0NnQkl5allDZFljcWNHcVFz?=
 =?utf-8?B?Z0d5ZG5kcmcwdTVPSFJNVEhRU21BRUVRVjlxYVVaeUd0ZTVRN01KN05RdzFH?=
 =?utf-8?B?VURVZlJ0RTdlcUlMN1IrUlRBTWJUcnBERWFiMXBsaVk4Tk85MFU4WWxwc2g5?=
 =?utf-8?B?SkZoMUpydGVXTGpZZXJZY0duSUpZVVRLcXo0WkFDRS8rdnBpRm0xaDhLTUE1?=
 =?utf-8?Q?kD0IexQ9EKnt3cmtVqxzBtguI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996495c6-d118-4cd3-37e2-08dbade9d303
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:26:38.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiQaGBeBo1NCQphipK5n4K5S4Mg4RZkWLBq9WTiYRkGNWPCfFHEc5TJ+WIdXWl0ljfafnOHOoEYVsThUni59pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9262

For using a GNU extension, it may not be exposed in general, just like
is done on x86 (except that here we need to also work around not all of
the tool stack actually defining __XEN_TOOLS__). External consumers (not
using gcc or a compatible compiler) need to make this type available up
front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
the type is actually needed outside of tools-only interfaces, because
guest handle definitions use it.

While there also add underscores around "aligned".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also check for __GNUC__.

--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -152,8 +152,10 @@
 
 #define XEN_HYPERCALL_TAG   0XEA1
 
-#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
-#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
+#if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
+#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
+#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
+#endif
 
 #ifndef __ASSEMBLY__
 #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \

