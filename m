Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CA72C35A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547061.854253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g0D-0008Hl-RH; Mon, 12 Jun 2023 11:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547061.854253; Mon, 12 Jun 2023 11:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g0D-0008FG-OX; Mon, 12 Jun 2023 11:46:29 +0000
Received: by outflank-mailman (input) for mailman id 547061;
 Mon, 12 Jun 2023 11:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8g0C-0008F8-0v
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:46:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3719919-0916-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:46:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 11:46:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 11:46:21 +0000
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
X-Inumbo-ID: c3719919-0916-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuBb1RoVDyFLwaSn2pW2mdhS103q6yLgOy/dymeMaq/6vbJATYYM8L/WP1xmRtbK5+O4uNT8dFOak4OMWC7mH3HU/I67paXlVEntc3iz8ku9CsjcF3GV+PqvOdoGLRAhk8IB1Fda79fdV7kV8jG5cKwfdYiOTqcHypxpzstve8cHDTIx1JMIpHALk8LlywZYDpm7FbE+Gt4cDhdM9WGFflJnlsG85eeh+oPEsOGntZ2aMshsCdhSCqbNMkkV9+Tdr4/JsxVu6A7/1sxHVQiYm2IyfkbKOanDbVFw622P0ARBLU0XszHjAUeJ2Io17aGfE4p2/CLs/teIWH6vwWrrTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dDuzZO3NY+2JEelv9HlCc27GL3IfXBwOaXL4IVoUlc=;
 b=Tgx4oLAGyXtu9R+WofTZ1vIT2GoJVcxQAN8E2tc1TU8i0I6pQoFYBiRTTsk+B47GocdxiBRKMmBW2x+xxBS298QJCU/7muajlfIkvHyA6IVQ6eQQULAMlpRSMXZ+0IT+Jxs/C2jX8MIOZQO0R/NL9gv9OevhfrOm6l6hbammN+50ig1lamLCIsIsd+9Z4bvVSfieES3jo/GmXAUhtbGGiPHqzbhmro2fBxFFyuUVGmpAL6wvknGhSZ3yaxLXcEdGvcdwnkKyxJbrCnIiEC4bQ54BcGf2mXTSLcHJh1qsKQg9voLLZo2vkTr4hT0TkPQgiHgnsO2Tb3zryWrxhPQ+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dDuzZO3NY+2JEelv9HlCc27GL3IfXBwOaXL4IVoUlc=;
 b=0PxbqoHncnfKxb0EkDIuBDlElfqDg/52LjB3Hum7awJH2xkBWZ45yuG50rRMMNLTQf5AKQbatkRITggZhFuyWe+cX1i2+HGPW8BrS3v9TpP8pC+D9fi0wSpBuEINZmRU/n0HH0bOY1mD1wY3dItfoiIkwC+MMDITp9LfI8javGKjTZoB8PMmVr/owKnexTobhwnjGPrqrsZwqVO3hmWHeUZhfCi2nN4QqBfR+oWkzR8XW77Ys1//ePru+sAjQJ8z8c8cRa+5fj+cSid79ljEkz5KIGHZIseYqheLUqwr5wvbQsyH2FrCoT/GqYR0Ztx+kI9qtOIPtGy5zgVJUTBCBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5eda17da-7185-9cf6-7e87-70da57aa0ebc@suse.com>
Date: Mon, 12 Jun 2023 13:46:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: [PATCH 2/5] libxl: drop dead assignments to "ret" from
 libxl__domain_config_setdefault()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Daniel Smith <dpsmith@apertussolutions.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
In-Reply-To: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: b886b6c6-6e15-4515-cdf0-08db6b3aa47c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1a9JzZS1gVN6MoesZUCHQqmbztcsCmxJ176c184Z57bQ51Nr4d8AvzKypk5GWhcfTx5Yw7pDLc0rTixQNQXz7H+qXY0FaLUEYGiFBy71ee7AmA4sZno4xY2oPdfPOTrL8cUqMcpYV5x5dEr5s1s+2G1Pv6it7JaVdTO6tx0LVyYnlkrUOue+/zRP7JE6wvu/rDMxpDK1WKdAtqXhvIguMk0/wL+waenZan8IY38IEfIYrk/6vBIpk0Kdb410LlqdztHEKYUMDDj0NQ5/4+Dv6oOazpeLhxGZF+gXDWVPr1mCtuy0BxzpYUOW9vr4dFqQBhdlPsWXCnSvRnxQh418DHNVC/W890qa31nydzTo+wOn0yJa9YUpBuxPpJgQdocWoQTtYkUBGOyrvB+b5Ae4fNeGngIFmrjwu9rI0TnOskRggseQikBWHBVmRHoClzRluXx4OfiqWQOXgC2jE1J3P0tqcSiJHuZFDbF83iCgJ43x7vOkzIdy3WQCg9gPqYLCr9HifINLUVqJ216/IxEUkdi2w6u4nszFJXpQLWnM+xBS/bK3b78sVTbTtVuwkxfKLF60mCAJp/4FGqsfGx1h3DNOPNW07fSY80+RNOScaWT/z6uT1SMYZXwPl4jhYILcSI+4HRvuLIszhmqPEHlYDE8Lm5qm3/iWD294CpyPv9WX2lc06TbuRZmH22K9laIx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(478600001)(8936002)(8676002)(54906003)(6506007)(5660300002)(41300700001)(316002)(6486002)(66556008)(6916009)(26005)(186003)(31686004)(4326008)(6512007)(66476007)(66946007)(2616005)(83380400001)(2906002)(38100700002)(86362001)(36756003)(31696002)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXRYdWhtMVYyc2xCLysyZ2RFU2g3MU1TamphWWliNGcycjhPRE9wbjJWQ2xi?=
 =?utf-8?B?ZVc4OHVwSkRhYWVCMW4wby85MFdvU295NGhVdTV2Q3RqaHpybUpSQ2lDWnFL?=
 =?utf-8?B?U3N4SENsQjdEdVJEVkM2ZG9qMHliMFpWeVFTNm9BRkxWdUpMby9uNTROZ25n?=
 =?utf-8?B?MHQyb2F6eHZkL2VZZGt0anl3WFRqQ3ZiWjdnL0ppZ1AzbkMrdzJyQ2oxblZq?=
 =?utf-8?B?MHI3dXJPYkx5ay9kTFBuWFNZQ1poWmowSFI2YmhaS0pkeEw5b0xpVDZ3M3BY?=
 =?utf-8?B?dlIrdWFFMXBuT2Jkczd6c21rNWZBQUNDMkJaZWljeFBRSlU2cmFWTlp1WitY?=
 =?utf-8?B?eVhxVlVxeG1iejlKYXRkdXBhWFl3cGtQTUxKS3hRUFJ0dCtCL1RLdmZ3MXNB?=
 =?utf-8?B?OWwySk40K0tmeE0yaUlISmhKQ3NVbTM4SVRTUlVjcEx0dEdFengybndURWJW?=
 =?utf-8?B?Qm9NY2NpeW02OXplVTZkZVlYWEYvdWhUazdOajNReE8vZFFHTkZHL0hJU3JI?=
 =?utf-8?B?Y0oveGdoc1ZlaDdFeWF6OXRqSXN1RzY0azF1cWFuTWNXSWw3eCtWWXpCdElI?=
 =?utf-8?B?T1lwWmhSRXdwVkZKZGpFemdtSjE0dDhJaE5GQWpuamhqRll5dWszNVZhWTVV?=
 =?utf-8?B?NXB5a0hYa1J6SUNYUGdBSHpJY3UwbXRGTmU2RHVTeUFvckEzcjYwTk0rcTFk?=
 =?utf-8?B?SnZTREUzSmY3NnNDTDg1YjFpcDFJM1loaThueW0rOVppTS8wakRMamJDOEha?=
 =?utf-8?B?R0FZS3dMQlJWWndMSmNtbzRuWGlNQnE5R1VqMjdaOHpDcDZOWVVTQ1pzQWcv?=
 =?utf-8?B?STU5bWw0RlI0NVlmTzhxdjR2WGtzdUtDaGJFUEdzamtVMTlEUllDdEtXbmhT?=
 =?utf-8?B?SlVTRVpVcVdpUGg4Qk5MeDU1a3Y5czNIdGVYa1JTZmQrcHZiSkJoYWU2TE4v?=
 =?utf-8?B?dW1nZENSNmVUeXZYTGdUSGg1djM1YWlsbEtyY3AwK0dRT21pSGRtT1hMa09F?=
 =?utf-8?B?VytzS2VaenR4ME9BTDFER1FFR0FtVDgvY2tuc01BajRDYkY4aUU1aWZsSUtu?=
 =?utf-8?B?QStjcnJIak03V2Z3dlIwUnF6M21IMm1pQTcrLzVaQzdoSUZmVGpoY2UveDhq?=
 =?utf-8?B?SjIrb3ZWeXd0V0hLYklTWVRGSFdyWlBMbGY5MHZ1dS9ZcFJYTWNSZ0RsYjBk?=
 =?utf-8?B?L2g5U1B1dVhDQW1lejZTamFMbTNwV2hySTZncXVYQW5xWjcwZytIcS9QdDlw?=
 =?utf-8?B?YkllelRmekdPQmZDUDBidnV2VnpEWWJXeXM3eE1KQmM3RW9BOUFqc1lUMEdS?=
 =?utf-8?B?SFFzMW9HWFV6anh6MDYzOTFka0FaRVNOdnorb3lhaHd2ODVLalpmN1lYNGtC?=
 =?utf-8?B?NzRpcVdRZHl4UDl0V1ZQdFUwM28vVDBudThnbWpQUDhJYlpIdHNkaElKTDIz?=
 =?utf-8?B?ZU5zYjNTUGpVVkt5by8wbU1adFdPZFI5SS9OcU5iZ0R5TVJEc1ZRUVkwa3Z4?=
 =?utf-8?B?djUwZXN0WmxoRkZNTG9UQU1hTkRNakNYaGFsQms1QlVuaFVEanFkbllnMzd3?=
 =?utf-8?B?cEpZNlVSQTJ2NmlRMmppaGcvcFhkZ2Z6TCtyVlF6TmViLy9hcFY3c3FhbjVE?=
 =?utf-8?B?U1FQQ0E2aU9TMnIrQjZJVG9vNVZ5Wnh4c1B1ZEZ3L0MyeGVpS0wyQXk4aWg0?=
 =?utf-8?B?TzF2aEloNjhxbzBpRXIzd21QQTdDazB2d1VFeEVMN1JhdEM3aWdtSWdVUzRE?=
 =?utf-8?B?bVpyd1M0dXpHSnVONS9Udmtna0tUbjJUdHNYdWFXSzFDVjFYMXd3WXZhQ0xO?=
 =?utf-8?B?WWJjMEUwS3hrbW5PWTZNd0RVVDRCY2lkMXoyV040UktnVGpyYThJRXZzbSs3?=
 =?utf-8?B?SEovVTFkMjBNSERSMUg1KzhPT2h1dXlvZDk2Q3NldFBjKzB2cmJsanBsajdM?=
 =?utf-8?B?aFVtaDlwOUR3L0lMT3ltMGFyMVk5K2FHKytPeGZlY2RncDVnYlplOGwwUVpH?=
 =?utf-8?B?WjRhU1NJQXdUb2g5MzlRTXUyeEZseElvSnNOL1h3WHY1NENMREtzOW1PdE9z?=
 =?utf-8?B?N0s3Y2t3aTJYcjlZdW9HeGprMkF1WkpEZXZrb3R5MlVtUHg3NnZsRzY4N1la?=
 =?utf-8?Q?QBP5t8u7qgd8rwnhNW4aU2U1H?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b886b6c6-6e15-4515-cdf0-08db6b3aa47c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:46:21.6682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftxTKhRU7ShBGZ0fgaiRi1IUAKzVMDjTlt6cjH/4Wqm1TsSOmzeZ8BopzhCb3u4hSDYISFseHi/e2l6L5P+QaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

The variable needs to be properly set only on the error paths.

Coverity ID: 1532311
Fixes: ab4440112bec ("xl / libxl: push parsing of SSID and CPU pool ID down to libxl")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If XSM is disabled, is it really useful to issue the 2nd and 3rd calls
if the 1st yielded ENOSYS?

--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1081,13 +1079,12 @@ int libxl__domain_config_setdefault(libx
         ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
                                          &d_config->c_info.ssidref);
         if (ret) {
-            if (errno == ENOSYS) {
-                LOGD(WARN, domid, "XSM Disabled: init_seclabel not supported");
-                ret = 0;
-            } else {
+            if (errno != ENOSYS) {
                 LOGD(ERROR, domid, "Invalid init_seclabel: %s", s);
                 goto error_out;
             }
+
+            LOGD(WARN, domid, "XSM Disabled: init_seclabel not supported");
         }
     }
 
@@ -1096,13 +1093,12 @@ int libxl__domain_config_setdefault(libx
         ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
                                          &d_config->b_info.exec_ssidref);
         if (ret) {
-            if (errno == ENOSYS) {
-                LOGD(WARN, domid, "XSM Disabled: seclabel not supported");
-                ret = 0;
-            } else {
+            if (errno != ENOSYS) {
                 LOGD(ERROR, domid, "Invalid seclabel: %s", s);
                 goto error_out;
             }
+
+            LOGD(WARN, domid, "XSM Disabled: seclabel not supported");
         }
     }
 
@@ -1111,14 +1107,13 @@ int libxl__domain_config_setdefault(libx
         ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
                                          &d_config->b_info.device_model_ssidref);
         if (ret) {
-            if (errno == ENOSYS) {
-                LOGD(WARN, domid,
-                     "XSM Disabled: device_model_stubdomain_seclabel not supported");
-                ret = 0;
-            } else {
+            if (errno != ENOSYS) {
                 LOGD(ERROR, domid, "Invalid device_model_stubdomain_seclabel: %s", s);
                 goto error_out;
             }
+
+            LOGD(WARN, domid,
+                 "XSM Disabled: device_model_stubdomain_seclabel not supported");
         }
     }
 


