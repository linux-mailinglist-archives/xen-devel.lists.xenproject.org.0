Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A0327B56
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91402.172804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfJl-0002Zm-RW; Mon, 01 Mar 2021 09:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91402.172804; Mon, 01 Mar 2021 09:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfJl-0002ZL-N1; Mon, 01 Mar 2021 09:58:21 +0000
Received: by outflank-mailman (input) for mailman id 91402;
 Mon, 01 Mar 2021 09:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGfJk-0002ZA-7y
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:58:20 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e9b40c0-f306-4f10-9b35-dfeff908cb57;
 Mon, 01 Mar 2021 09:58:19 +0000 (UTC)
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
X-Inumbo-ID: 3e9b40c0-f306-4f10-9b35-dfeff908cb57
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614592699;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qQR7ddJN5R+Q3RbE226cAd1XlC28dCz0NxE2649b70A=;
  b=QJfsICAQUDgq+cjRNt+ORfYxL+LzllfLf0h5sVbdY9u+sUDzBpBR5Qfh
   reU3oBwqM5IvnHMOB+YEOg4QTHJmH1FFEK5INsLBMqC8J4S5iT3MMfv2J
   4OSuKuNAKEzAx1nPRiwQawCTuVmXpF/hq4t+MxsedIKne361d0mFZI2Au
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 436USzCtW2QipQtEDdyTz4HfFrTV62tvnanfAhUkTHBHF6cWTQjuuHlw2e918TYJVSuY3D+Cqe
 AM+u3FSV+n2o5o+x13aUxyf8jIRyLLdFDIikXPOzFZDh/8lLIExA2xDQFnbqY+1hQ/ZJ+MZDtH
 +c1aUJ6XweZ9gcoeEegdCqZDlslaKWK04JkIZeyqcMo5sFbVf7enGt75vv/R9tirz6kQQ+Oitq
 MgVwUELjFJMDDnd2eUpwkmPgXyTiLxXARBnZwjo2I4xk+aHzDUFB/6+5KpeJ1XAKQJk+0eubum
 SaQ=
X-SBRS: 5.2
X-MesageID: 38217503
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38217503"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvh7pKhwkq1oNbXVuQTyirYHOkdnKPpW3XDlMBvz/BqtOhbYoalZ26YzxTybU75/lFZWc2GwmQWgS4tSi4Mz30/f4r+VI/wOCRW8/0su70RnsygFodI+8Gq30MtXzuA09kj3IQYluOsQNOkr+jZq+r4GRNrGbYWkpLQwKWslQIL7xUZEyCGvFVIu4lIwWU/6CcO2W5BoTaJtXLpY+QIsH2Hu7aCCkQQej1fjem71T0kbzKDtJejMUx20yTzZ/8NAuuSnu1fte1Uvz8rzkrDgTiRcrrbcpA5hv2XB84R8J9fMTR3GtcXr3GjiAAg90X5mOOW81T4gMzUCJtYaMcoL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxnUDfnA1JCw3Vo8l99dfHW8RyAEk5OJssZEnQ2vSko=;
 b=Lzp9Cj8NGqe3YxXRafZ/LaNEF+eCaHPC0gc+Y8Cbj6zbXtCD9kE3rtmIYtVbDuS4PwXRDpbgYNnlsmpLkPtXbQIERULrlUJbLVIF8vcAjbiBlF1VCxBn02D7eECA5SkHRC+v/zTsaAECDv41l3lJkylLxq/DzVpbIFNwLcppEw860EQXei7/aWW2lF9jIBsx0z24Epl9FVfZG87vVi2hEokGACRQp/6iCGz1CAESgR4lFEN1BLetFgpkO2GMiRzhnKdW20vFBX87RPSqA/lnBlA9Q74oBtQK1lLtD3zWVEfHj2Sql5g/rcmEfplvaT0AdUyPfKv+6g+4pREpyihwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxnUDfnA1JCw3Vo8l99dfHW8RyAEk5OJssZEnQ2vSko=;
 b=U0pTMd8zPDV0N1JgpQjly/gQ492x2vwhk/y1n2T63UvDhTX+uMhEy5+t94opHYcI67L7hOrDvxIxWxi4ApUwmcxe5m2D1SHEoy+j26D0GhVDv+b6eUMhCuLrbL/4P01MWNQW2L9wLMMJctIVn9eSwsx2GNt4Jur11W84qJwJaOs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] automation/alpine: add g++ to the list of build depends
Date: Mon,  1 Mar 2021 10:58:06 +0100
Message-ID: <20210301095806.68518-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::13) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c36009-3e83-418f-12f1-08d8dc9887f8
X-MS-TrafficTypeDiagnostic: SN2PR03MB2416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB241602B8448C6F65EF7978FC8F9A9@SN2PR03MB2416.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6M6XvIw74Rn4THGKr2SOc0w4Ght3WGYqgrHsFjI2pHCgSRKz1qfYQ0B6lDGTm1fFkP7zCuuE6SIQOdnxOAc+TpX2sJwBpgCTB9VzCFqH1iQ0CSGt/AS2agggcJ/a/8oPRO8y5MusWtb9Jqu2d4JNA3Swy/hef7cNxVfsU5puF6bDVYnn0qGgDGA2jbvZCI3yKTHj4QSi7gDUNhBSWzRPSSD37Ra/9LbATh2760mPKK9Mrcs9Mz6TjWbqpMhNRbhT2cuCZw5Wiz2ViaE6crsIkPbpf6Unym7dkgavUb0BcXSQyRBSMtTZka6gj5wqelsI/7MQBE0Y1qbUIFPsDWY8E7IHRbCUW+r0kRIB2vBL0Pyqj77wvp4i1Sg7BK6cUNewVVPqYL5uipAtDLMgTarpqIN6DzwM8+G6MNxyFYLVM4qfacjTxoIUMSwPxWOQ7UPzTQIk5ciZDVYZAEOdNzdNdBWl8Q8P528aScCMegaJUHW3OHVXWQqMNBbHE6vEp0ZUtHctmlXvTVt+TMLcNfnZ2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(6496006)(83380400001)(6486002)(2616005)(4326008)(6916009)(316002)(478600001)(54906003)(8936002)(66476007)(8676002)(36756003)(86362001)(66556008)(1076003)(956004)(6666004)(5660300002)(186003)(16526019)(66946007)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzdtbTN4by9BT0hMTnVPcE5IY0JOTnNXRjFzb3dkRWlvaWZ1SUFSbWxDNjE1?=
 =?utf-8?B?ZHNSby8zWEc0L0JzVHJtQmgzK3NSWlpIRjBQNW9FZlFwTHBEQnNVUm5SNHgv?=
 =?utf-8?B?d0dLdzQvTzFidEdxNWgwaW5mYW1JVmcvWllueXZpU1BudDlSS3lhMWdnV0xu?=
 =?utf-8?B?SkhZY2xGaDJ5NUhpWmhNNWN5TkJQaytselhmTTU4TTVpSGYrSFprSlFIMlV0?=
 =?utf-8?B?WUNBOTlGVU9QakNrTHFzc0tQMFFsTFliV014bU9xZ21NMGRINGlhd3d1ZDZk?=
 =?utf-8?B?NG5RMlFmQmZRS2h1U3RDMUJVMXI0dEp0eFRWak9iSUtLcnMxd1NoSW9sV1hv?=
 =?utf-8?B?bXFTK2J5K1BhNG1MK2RIeUlrMU55eXJYcUE4b0ZUNHFSL0tiN0Fldm42VFZX?=
 =?utf-8?B?TUNQQ1l6YWdIa3ZQTWh6WE5TK3ZBemNEZVZHTmU3bUxtT2E4Zm5JWTE0SzRM?=
 =?utf-8?B?K00ySml6WUF2TFYxem0xMWlWZWhFemJFKythVUt2MWI3RzZQMTJsYWZoQ1pl?=
 =?utf-8?B?emk4OGhXN3F3eXoyZHVYSnd0a1lYNTA0c28zYXJUV09hY2tRQlVDSTV5WTJQ?=
 =?utf-8?B?a2lldGlaQVFJRlVWUkdDcFNFS2tKbHMzN1plQ3hEZXhnZE04QVVKRm5sd09F?=
 =?utf-8?B?aUZJd3p6QW5kNTJOK1Fodk5kblRxK29hTlZaczl6bHQ3SEdPeGxNTlFpYm5y?=
 =?utf-8?B?ejBEMjcvRlpwSFNPVllOWXNqOVE4L25LZnBSdUNoTDdYMzlsMFBoVVNIUnJz?=
 =?utf-8?B?VzZXRnc1M09jcGV3NDk3b293TjhCTFpCc1oyRW81S3daUGJIT1d0M25qTVc5?=
 =?utf-8?B?M2hXZjNiZDFOdDFMSUtsNjFBWFBxeFA1QXQ4VitONHE4RVVnNEdmVEYrZXZq?=
 =?utf-8?B?b2pEdEVNMXQ0ZC9hQzV2Y0FwZWpyZ1Z6Q1BQUzN1NTV2d3BiZWt1bE1pZDdD?=
 =?utf-8?B?azlidE9ZVTJBdGEyL2trcEJ3KzBpVmRheENVc1FvWXVSelhVYm9vMWRTMVBG?=
 =?utf-8?B?UDMzdlFTK05QTlBvRGZuUERGT0dNL2VCeDRIOGZTUndWd21LWGFKMkYrSmtj?=
 =?utf-8?B?OHZaWmxReGlQalEydWpDQW91aUNSV3YyT3kzWTRrRGJ1dkpENmpkN2drNUJX?=
 =?utf-8?B?dTlwelNsUzNWRTlqb2JsaUZ4V2MreW0yWXRrdVJ6VE9SL0dYQmJrOGZ6SEwy?=
 =?utf-8?B?MmtTaHNuZmI0L1JFcWhhNnpYM0JvOEJ5MGVPMDZGY1ZDVi9pUUNuWkJLOFN1?=
 =?utf-8?B?d2VxenRPQ00vaW9rcmc5SHg4Sk5GY0lXRGpPMFRLTWdlMXpEZWhxd1oya1hU?=
 =?utf-8?B?V3g5RHNRa3kyWjlMTy9iQzNaVHBkZnRVZHpDV0YwVlUrcUprQi9LT0JQM0Jl?=
 =?utf-8?B?TEdieEgwRUtLTEVCbENyclRnclBEcUx2d1ZHcnhwNkRKbFdvK0s2b20vWEZq?=
 =?utf-8?B?bXRzTGZwTGNOdXRMNE1uTXozNW8rOVZ6Sml5azJLdnJQeEg3ak1yMkh0eGFI?=
 =?utf-8?B?NHM3ZWdyekxqTmgvcVNhUk55V1hYUWNldXJqY3lKTU1IYktkMExJMis0TC9z?=
 =?utf-8?B?K29xenN4R2tHRjFiNXFiWlpQNS9KaEZTWENOSTNnL1piaW5CNUFmODI1anBh?=
 =?utf-8?B?eVc4MHl6YjRpU2dCMFByK3lXRGpQWUQ2MWZidDFEOGxOTk1tWHRNT2Z0ZUJW?=
 =?utf-8?B?YWNLZE9pQmMrSEkwQS9hREJhWmdVb2dZZjcxa3gvUVZkQm1rVTJ1UStYTVho?=
 =?utf-8?Q?VwluAZoTxeUmAiliO0WrLQieeHQh0xlR5BYXdjH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c36009-3e83-418f-12f1-08d8dc9887f8
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:58:14.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3vK0sLC2Gk/sL/knAlzChDm4KK5fMo1AZOyLjLiRpXfgbmhYSYB11nRjBpJf390q8UplO1PwuHcrYTC3VNS+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2416
X-OriginatorOrg: citrix.com

clang++ relies on the C++ headers installed by g++, or else a clang
build will hit the following error:

<built-in>:3:10: fatal error: 'cstring' file not found
#include "cstring"
         ^~~~~~~~~
1 error generated.
make[10]: *** [Makefile:120: headers++.chk] Error 1

Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
No real risk here from a release PoV, it's just pulling a package
required for the Alpine clang build. Worse that cold happen is that
the Alpine clang build broke, but it's already broken.
---
 automation/build/alpine/3.12.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 2c02417ee6..94557e239b 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -21,6 +21,7 @@ RUN \
   apk add curl-dev && \
   apk add dev86 && \
   apk add gcc  && \
+  apk add g++ && \
   apk add clang  && \
   apk add gettext && \
   apk add git && \
-- 
2.30.1


