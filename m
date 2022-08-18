Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0700598550
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389586.626614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgBA-0002xi-8O; Thu, 18 Aug 2022 14:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389586.626614; Thu, 18 Aug 2022 14:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgBA-0002uz-4k; Thu, 18 Aug 2022 14:07:24 +0000
Received: by outflank-mailman (input) for mailman id 389586;
 Thu, 18 Aug 2022 14:07:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1x1s=YW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOgB8-0002G0-JP
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:07:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13a4dcd6-1eff-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:07:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 14:07:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Thu, 18 Aug 2022
 14:07:18 +0000
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
X-Inumbo-ID: 13a4dcd6-1eff-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0H0K8AJEsaOM9LaBIhohbEImCb/aJMC2QQxLFNUNiFnvcte31VYYr9kYGW6uYSj7jUDpYFxJlLprOCMZ+q/uPoSLV5aKFMksl2izWytHwM0z9jbQarMZhbUCwEbPIZ1vecwk9YSKZS/grRx+QbgyR0IcqsbKQykpBZZdaI1fr1kuML6PQKZFlOWFinxU1O2CGfioF1Rej2YwuK+fozwP2WfG9BGkJivHXWNGxL+PNABbztnvzHvK5+8z6nqYAoLSgbr3m7sm5M5SZqk+MKvxJQz8BvqUX3szEtAwjPoM3oRgG/HhYaRyMC2nT4EAgh7V3nP3HRhmZIT8jOVh7tp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRRfVD7hJnZdH1IsdEus/1cIXqBM1/ZFOBeK1CyDYjc=;
 b=Lxg71w/8OMYtKCd+H7vc2uLIZQubjU8Xka1xmagMy+nHpLUw+h4RaF6eX+XgewbvPcDCKReYA/ZFRe3Qrc/ttRCS2u5wTz9rfQV7pUBGe4/4ApEUQz+lowuNa6LrkAlrp/HjNBSZSG+ICHrIPYaz5WXP5HTp7stGso+zTMlTgVbNMO0GJUlBaYD8wZ6PXF1MqGsbfs5gNsCcwpzHw+kkKEQo7zF8L5mDUdfi+77HUeVmpwnM0gNpxFJ+SqDzCjAAx8TsGLRrfpTGV02DXe6S/2bdB3t4wxspuB5if+Ngv+hWTqtv00njEnB5qmwWOyLrH9JNDTPvHUtNnIJRwgGWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRRfVD7hJnZdH1IsdEus/1cIXqBM1/ZFOBeK1CyDYjc=;
 b=BQWcMGhcrvB7ZbdMM+VmgYhtIY93a1RXbgtZ7etfUGrKB4IVe33Pym8m5rLjdrekA1PPwgNFPdVgB/UfdDUdPtkRMRraGUHtPaBJXiY/pDvqYzKFtrqhDtbqoSivPX58BR4xnCdSgbkQrYLWkcLxmbKMlITx8tykeM11Szud/aAVF1PI9E6PLf447ABCC+Xy/TbN3TVoujNLa5XxsH1XMheAUGWyqgBVTPlJyO2nAirO7X03ARAFrFU9ArZsZI56Wh++Ixeprdhl5tygemetPDmStrDqJoFtqrHW4JbG8gRF4qriALT/4zqT5huHWFxPovWCxZ/V6aHzLcpAp/LWOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ac207d1-8a20-b880-e564-57494bc5b551@suse.com>
Date: Thu, 18 Aug 2022 16:07:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH 3/3] libxl: use time_t for qmp_synchronous_send()'s last
 parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
In-Reply-To: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6deceb2d-493f-456c-4d98-08da8122f5d7
X-MS-TrafficTypeDiagnostic: DBAPR04MB7397:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z/1i19NyxH0QUSyKzjxumTO4SGYWkAH2sEOq96Pi922zNnMZU6lH3n0D7dEBlCRyefhyQIxx7Gr49NJR6ohJw8rbhEIYNqlVPt6vTBwHon3+WLrEgg7RgX5q4KuXQWoWgW6PS+4rjyVT0slpmDevF59tB4ZFIQcpMdaxdAFrSwRyzLja3YcLneyCTraxJZpfa2QCGLR7/rKBRhwyw2hry2MmHGad/NW/8zQqmNVvIp8+6FNN/wBifd+UgpRlFBKOArcfOs5q2u389QP8BR9cU+2CYZvl3vyyB5AGcsjhqwM/jifD+56CdZ89vc+F6Xyuof8NBJtBiZVHsn5USYIL6xWpVDz5LRaGuHF2xq+l0ZwoEkn5YAwDlPj3lxK5GAHH2gwBvxqc/vMU08CmeOgHVEhBxtBLPTy8mVwt9Fw17GUFxiMIuAOXaq30c3ZBpajrNmjvUd84saPRKgmtUYjo5dPRoYewaLyBto7rqVfKBiq8dF/DtUCGX5M/C1HrsOM8yo/XgmChCXSfavfhn8mSOTxCZ5OmdTtDGiNoLZmdCKrHY0rr2iVdfQADIMNLGWLbxXYHhhQDZQOgPyMF/OhFznkfKZVIfprts4/RuUtHu4bthcv7ZajUJ2dPwYfzgr4T/RrxrQF8okDxg9qZJKWX2Z9PHhp1U0sIh2kcyxvj7hLXzwhcqioXX+h5zEXLAfiRTDVotdQj38nXDZJ8rw8/bnhN255wKyLTBbhm+0ot//9vzcRnAAffy4xIZAeGlNgxpmQafeifOk+W7xYc8ws4r9czfcgn4Fq1hLp52Er12fE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(366004)(346002)(39860400002)(136003)(8936002)(36756003)(6916009)(31686004)(38100700002)(316002)(54906003)(86362001)(6486002)(4326008)(66946007)(66556008)(478600001)(186003)(41300700001)(6506007)(2616005)(107886003)(26005)(5660300002)(8676002)(6512007)(4744005)(2906002)(66476007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVJrbXkxckRoNDhLQkhmSFcvWGNmdHZCWnRCQ0FFQk5yNVVvWUJLU1hvMTJ3?=
 =?utf-8?B?ZUs2T2RlbDE3RzdSeVJCNkF2TnpqVHVCNnZjbW9KSXZMSHliSDVvbWMwVHB6?=
 =?utf-8?B?OVEwVkxTZ2pqUGdocEE2bGtaQUVTeDFXelF3L0NsZE1IZnlpOU9HTVFvSW82?=
 =?utf-8?B?RFMrOGZxQW12VTJHL2RFc2k5VHlwNVMwVG5oa2FnVUM1RzRXNVhtazlReVZV?=
 =?utf-8?B?U3VLeXNjRXF6NXEzSTYyQ2Jkck5TdDB1WVZDN0hETklqSzVVSndqQU9UeDF0?=
 =?utf-8?B?Zjl5aU1wRnlLUzlHOU9QUDBXQjlWNzdHenlLWXdrTXRpZVdtSXlrbWVxdWhk?=
 =?utf-8?B?SEZxR082VGlnMEh3RzhIVG9tSWx4N2VQQkFhZElxMGhpZmtJdXRNY0VpS1JH?=
 =?utf-8?B?QWIxbjVMRktrTHlDTmhuU0JOQXlKMDNjMlFhT21SWU5rQUVHbXhzRklYR1lK?=
 =?utf-8?B?NWpINVY5RlBxVmpONHc0OFZ3L241dmpUbFpwVnpGRm1YY3NTNU45YVFmQnps?=
 =?utf-8?B?ZFMrZFkzOXlYR1hOMFRNaytQUDhmOXRKaS8yVFJ1T0RhSko4QXorSjRrK0Ja?=
 =?utf-8?B?OFFYQzYxTGxQc2UzWnV0Wm1oTDhwTC8wMGZDb2FqaHRhc2xxNldVcmdtSk5t?=
 =?utf-8?B?QWRjNG9jSktQTkp0RTdiTGo3TytWNkxlU1djalFHRnVmRjIvVTlTNVp2SHhm?=
 =?utf-8?B?dC9YVDAxTC8yZS9HSUVGQlBjSjZ6a2FMaEVvejJwU0swcEFMOFBvbTZBcDdm?=
 =?utf-8?B?dXZzMGdhNlptZHFTbmFBM01RM2Q2ek1NWEJmZ3lkc3BubjhLd25sZVZteVJr?=
 =?utf-8?B?NGl4RkF0QlVuK1h6SUN4T2JudFJlRDh5Z28wcFc4dTNDNDdHR3VvZlFPWEY4?=
 =?utf-8?B?OU41aHdsbUp2ZGZNYWpqUEtqdjRPRFBFSjZIUCtMTW9rejZ3WG1Qd2ZwYm12?=
 =?utf-8?B?NTBkMUZHeTFyOWZLMVVCU3NRQVAvaWZyRklTQXFQbFJMY2h3SXExVzNkdWs2?=
 =?utf-8?B?WkpIL281a2QzM2MyOVlkWDJNd0c5TU9jb3piY2s3Rk5TZU9sM0VkOGpSNTE0?=
 =?utf-8?B?YlZma28vU09Pa2I4YlVDcXBjbWVwbUlaazNIRW9CR3lyN3NpT0hUWWlTbHg4?=
 =?utf-8?B?d2NxdkQ3WFNDdHZEVFhRaVNnc282VEc2MmdXMDhKdHczZlVYWVZDNllOWmpD?=
 =?utf-8?B?eFRBM1V4T2VqZkx0Y1BPazVUTEczZDduejc3TVdvcHRFbUR2blovSVA2VXdE?=
 =?utf-8?B?K1hVRlRpYmlickZzeUM4REpRZzBOTDkwazg4cVJvbTFBV2haaUxaZmlESkdK?=
 =?utf-8?B?eUxLNThZdCtVRjc4NENsVkgrd1VOdEpCcW8yL2ZINm9FSy9WZWpQK1ZMQW1C?=
 =?utf-8?B?ZS8rSlp0aVB1QkFWQStrd3RDT0MzelhOeExuWmFNTXh6Z3VydVRuV2FZRkhX?=
 =?utf-8?B?SXEvYlBDbFZQMVZxTEVtMHJ0K0FOdU8zWXlXbVI1VHIyRWJwb3VmdmM5UldZ?=
 =?utf-8?B?YWk1SDJoZThyZ0FYbDNwM25iTFhoblh5eHZrQ3kySndGSk5HU0ljVlNFUFRm?=
 =?utf-8?B?VGVWTE5vcmxGYkdPSXljZHNjS1o1TEticXZNVHp3RDZ6VUh2VW1IK1ErYUhS?=
 =?utf-8?B?cWxIYWZoNGJzV1NkREx2cU43UTh5TlRPZDk5djBEUnZQc2pFVllmbVN0Tmxm?=
 =?utf-8?B?TTI1Qlprc21LTHlZblVGaTA4cjVtYUs0NmE2MDRuS3B3OXkwbHdaV1Flb0cw?=
 =?utf-8?B?eTQyK1JJN1o1cW1MbjdrdzRMM2loU3ZCa1hXZTFJZXpzSUJCNkd5b2RQWlBr?=
 =?utf-8?B?eFMwMlJ4Qjd4aU1xVGtCQmIxMEhGZm8xRWxSWWI2TXNVWi9meUlTeDFqdWJu?=
 =?utf-8?B?NVRlUVQrNU80L0YzNDVhRXVMa1VaNWRlc2xobDRRUTNkczRaVHYyRVBpNHlw?=
 =?utf-8?B?M042N2RSZWQyTFYxR1RqSFZtei84WXlLS0FOcEN0dkZ2eVZvMkp2eWxwWkZI?=
 =?utf-8?B?bktCT21vZWxJTlFCK1pBVVE1QWVTb1B1WnhUZG15YklEN083OE9KcGRFMEJC?=
 =?utf-8?B?L0tTdE5jb2E2MkVpby9TQkh2Y0JvcTRBaVY3ZlB6YXIvcHRsMWZubm5iRndM?=
 =?utf-8?Q?zUIHeoAyWCNhZxYIaVrYrjgxM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deceb2d-493f-456c-4d98-08da8122f5d7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:07:18.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCmozC9cDK5H8PzmJGK9Ac5Pg/arxCiGhMrjripoCkBB5NKTWIrzGApAdJfobZUH1Xzohw8tsPIxH2/KumR9aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397

"int" is not a suitable type to hold / receive "time_t" values.

The parameter is presently unused, so no functional change.

Coverity ID: 1509377
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An obvious alternative would be to drop the parameter for being unused,
but I assume there were plans to use it in some way.

--- a/tools/libs/light/libxl_qmp.c
+++ b/tools/libs/light/libxl_qmp.c
@@ -582,7 +582,7 @@ out:
 static int qmp_synchronous_send(libxl__qmp_handler *qmp, const char *cmd,
                                 libxl__json_object *args,
                                 qmp_callback_t callback, void *opaque,
-                                int ask_timeout)
+                                time_t ask_timeout)
 {
     int id = 0;
     int ret = 0;


