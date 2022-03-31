Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA64ED6E4
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296791.505307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr6y-0005N0-Kb; Thu, 31 Mar 2022 09:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296791.505307; Thu, 31 Mar 2022 09:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZr6y-0005KH-Gc; Thu, 31 Mar 2022 09:29:00 +0000
Received: by outflank-mailman (input) for mailman id 296791;
 Thu, 31 Mar 2022 09:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZr6w-0005JJ-EX
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:28:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbec18e6-b0d4-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:28:56 +0200 (CEST)
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
X-Inumbo-ID: fbec18e6-b0d4-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648718936;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=PSnDu/bubIN91jpQ9kh6eaPJhgOuwH/MbDE3oeNaufE=;
  b=XWD2BCAV01DWQGpJuPzXZYiMEtjbH+iouTjZedNOwkV/4x0WOzYLWszX
   0OEigvqKxVw9G59hWuTFqTLr4FC7U6Uz+b05jaNNPFTVF3vM7OHWxv45V
   dAzzIsaW0QsVNuoPtB0fxqCqZwN+BYBbI3xZhX47PtF2Z8JcnPIFERYEM
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67633831
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EUpPN6nfda7ECmF27l1q92Po5gyWJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCDvVb/qLajejfN8nYdzi9BkO7JfQy9VhG1BtqXg1QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWFrV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSFcMEJeLtc4nVkcBPCE5JPReypzpPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mAP
 JFJMmMHgBLofQFBZlpMK9EEvOqHvWf0LGRfsGq8nP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJRQ8gU0kag4JDRvV+2Bi8dFyZzS/I54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud1IWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iJsdy+2trxmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8idBk3b5laI2K2P
 Sc/XD+9ArcJZhNGioctPuqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlPHGNqNRDfA1SRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:QD5C+aM3QEWho8BcTsWjsMiBIKoaSvp037BN7TEXdfU1SL39qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVBbAnwYz+wyDxXw3Sn9QtsJ
 uIqpIOa+EY22IK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.90,224,1643691600"; 
   d="scan'208";a="67633831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3Qr0r4aPWbzUuyOOLXDelQj5+l/Elky3KnQY6W/mJ0yytTX4ewajFiAn7hyQCPtKTVQSsTBf7U5gxuUj154TpF0Ws7gNKyTTIzx92i/bL/qlweQLeaFZSq2BvEY9Wq7jeMdtuGFygAh9g79mXnK8o4tlefU6HbRSUvCcW5nKRcF8ZMlP0Izfo0XZ+Xcl916Rjgx9W2HqBYx1O9ni5yRBKrGKqWrrtisgYJh4HX01GrMDiHHOTEkfckCvxQVXs2olxcMExVPcZL/CPS6DchskCQvV6MLtuX+hSySla3+XmSrLbfGlT8j7ZUeDLp10FKzorO7XusqjmEePdyTpQFFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mS2ShJkHIoRZHGPPQN0koP60ywG8SarWw/5svPvWms=;
 b=RftWA/xbCifd+DUsWYlituUlJ4qTF6VXSOKVlEZnRLqS7nxmLHt0c0eCGEgGMeQmTude9U+mCgodky97gw+6GAcPfVYu7A6EfeD9GiehJA2jUzLWjODorLrGroVoYHrp604qQhqRJNr+04MoJd9UxMN9a4QN3CYIbrcQouznoExX45APgHcetrIvdtTLl6oCIKnTtUaCg+EoCkpWBVe+Aq6W6vq0tv3KWYXNpDdU9MVEUttn3RtkhQlrRxY8qzbm7FpCgHb/mLSK4noED3VFvfaT6rz1k79mBZ7g8Rr46UGaQhwLKlWrkjkeQPhKZCcY00fjwluLS7grKQ4yU9l9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mS2ShJkHIoRZHGPPQN0koP60ywG8SarWw/5svPvWms=;
 b=qngFVHWLe2Mu/n/rp0RoCMyHLhG7mmUeL6wYQr/3V3P3g8AvWDzCmr47k6NJ4Q3hb/m40QeB5ck61t8ZuieDuHz6NFAlsf9jAIFBB8+X+0ooIwxQBb0vNE/29SnVPEJVF/q+C5h3MgESwpCuVubUzNrOxhLkGasnE62bOQmmL8s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM guests
Date: Thu, 31 Mar 2022 11:27:14 +0200
Message-ID: <20220331092717.9023-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0099.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 485e5fc1-6a0c-4235-1cda-08da12f8ddbe
X-MS-TrafficTypeDiagnostic: CY4PR03MB3112:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3112548AA766E4458AA6676B8FE19@CY4PR03MB3112.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvTZgEPKl+0Gha3cI+NGYkNF1BYG4KbjANSv9DANVVEO2yISC/IIjqCW2zDgSeaELAfF7QSUHISd+USOCox/pDup1pT27NAULXtwhgPeL3kuDi3qfExA82J5J9bwIodozoCXPEPMLJy3Tvgni1P6wTxFHOkeKwJwl9nONMDbsM0wGCwXVwpH8cBQpyPr8vv6oE8W3mpYww+Hk98wiig2tVVU8Bl5auPieW0hLXL9L7I540eyPYv2qyiU47SiEVpiGvIHHV97AZWUmtSA7TFFYRD/Q75tgzUZbqlUrhsu/QPOzA3XJFfcCOw8dJcpfmtEywx6tcI8JR77dOnj7BChfYWlh+GP8dFzTTtxbq+QTuBNtzrgCYIuIKFyf9j7MMgXFsi00Kk7+/dUIgpa4Bg7N+NnA1hyysAUwVqhElPZZrsPCGBvkCdOUHjmGuXpaXfszTAbG3ykeiWGSTciy/xlxtUVbNA4aVv2c9PkqKWRm6bYx7e2X9OHkVZ+2cl5aQYvNibwhIpRX82UStXuLRAgKhUyqsfJeuxedCouTl3sD9+3HdtPBq5uZ9P2ALLm0GRlSX7DlTi9m71cU1LXOlijBwBV6vNuUo7p/olClkNfuR6v6wMFYWrxKlVbOSYyPndm3QLwivT2EKUley1FJrP06w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(186003)(1076003)(26005)(83380400001)(2906002)(6506007)(2616005)(6666004)(66556008)(5660300002)(54906003)(6512007)(82960400001)(8936002)(6486002)(66476007)(38100700002)(8676002)(6916009)(4326008)(86362001)(316002)(66946007)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxUOGVTV1JwQlpiWlhJTVRSVkFId1FLRElxckNhcTRLdC9TL3hoR1M5OFcz?=
 =?utf-8?B?UTYyVjdVOGdIZXRyNENHZkRDbGw1WEpqSExHY3Rud2tpNXdwTEtpRFM1d2Rr?=
 =?utf-8?B?QTFmN0RLY3dyYUpmTXNvZGZHdEs4ZzJvWmswZXFodnlVdkNrRy9zQ09NTTBa?=
 =?utf-8?B?UTZMNUZheDhGSEx3MWlhWmRIRVRrell4NWZUT2YzYTVrYmx2ZmFCVVJUZDNQ?=
 =?utf-8?B?ZVF6aEg2VE14bDkyWnZGMUhIMk5RK2NkUXFkQUxJamk0eE10NGxzOURocWMz?=
 =?utf-8?B?T3NXcVhEbmFRQm1BYmNlTUUrK2JVZVVGb3VmTGludStnV3RWNUhUWEgwOHhC?=
 =?utf-8?B?eXRjZlZoMXpKcTlTeXYvZnZwd0dQWjcxZ3lGa0h1YVQyakNYZld6SDEwMUUx?=
 =?utf-8?B?OElnaHJCZkZaeXNhdW9YSjhmR2hRbW8rVi9mOVNoSUU1RE4wRFRoSms2NHE3?=
 =?utf-8?B?cXdPSXVSSWZQVmxWWnJzT1EvSFU0TjYwaWE2WVZucmNIOUJ1TzZWbFZSbitW?=
 =?utf-8?B?MHFuREIxcnlBeGR2YThtT1dhZHlyZG9JNE01TjVJZDVjZ1p5NHZ3N1oxMWtt?=
 =?utf-8?B?Q0Y4WUQ2cXc5NjAzYUxaRnlwNm1zOU0zdmgvK1lRZkI0UGtjZGt0Q0YwTDhU?=
 =?utf-8?B?dUw5RUpBREVueFhDUDBENmlrWS91UVpLZVAwRWZtb1hCMXFiYWkzSW5BT1Js?=
 =?utf-8?B?c0h1N0ZNTFBOelY4cHJPckFZcDhsUWoxK0dKdkR5dXNCMjBWbzVscjR1QW9C?=
 =?utf-8?B?QXh4MTlGYTZoSWRaUWk0NENrVXBkckdTbHpsL2Z2aHVDaGdvRXA3cGhEZm9q?=
 =?utf-8?B?ZlVCRjdWRWtvMVZwaXJkNWE4clBwTHVKYy9NQlM0UUd2U1RGc3hQdjlkbzZ2?=
 =?utf-8?B?SU9iUkNVWWtGTGs0anFZZnlUVnFrRjd0dC82TDZCVjNYTXNTSnp6SUUweWI4?=
 =?utf-8?B?bE9IUlpZODdzNjJUT1Z5SXJYZzdIV1ppTytkd3hkNG9sUGIwM2RmT3ZBNCtB?=
 =?utf-8?B?ck1sZkhXQU1nWit5NWdqVXFibTBNKzE2dzlFUDM0TkhMT0pWRysycmV3dzJy?=
 =?utf-8?B?dGh2S25sQlQ3RlZOVmp5b3o5MitUMVQyeFcxUzJHMHNQM1Q3Y3pkNUg0YVBP?=
 =?utf-8?B?U3IyTjRORkFwSk1zRUgycUxZa3loMVd4R1hpdkZBR0EyQU1YMjE5YitRU2Fj?=
 =?utf-8?B?UVBGZ1dINTZ5TS9meUgvV2E0UHc1M2FnQWcvSG04OUE4dm9VS1VtWStmM0Fx?=
 =?utf-8?B?RGd2bktUTjY4T1FvUk9FcGVPTGczVnFPL3hFaTZscHJLclRuQzJ5VmZhUUhX?=
 =?utf-8?B?VmRqZTBOTTZRWGkvdmxYWHFyRnNOOGpDN0k5OUt6QTU5VWVwN0ZTRGtPcnR2?=
 =?utf-8?B?UU1KWmkvOXRQWUVWSUdjV2RQWU9QOUVvamJKamk5eDZ4WFRyUHdCMjMyY0RW?=
 =?utf-8?B?NWY3ank2ZEdPTmpnc2hWVHVqRHpOSVpqYnZFemlkdUZxdnFnWWxMM2xjeXZE?=
 =?utf-8?B?ZDl2cDd2dW9TejA2Vk53Zm9nWjR6QUFmeDZSM0t3aHdDL3NCdFcwQnV4Y2Qy?=
 =?utf-8?B?Tjl3cjVrNGYyRHRiYUQyNGl1dWFCODhmaWZUcjE4cHE1QnhsQ3d1VWlWS2hv?=
 =?utf-8?B?NnRZRzZtTFUvaTJzaXp1MWg1RWxGbithOG02L0ViUGI3aVNUQ0FHSkRNOWMy?=
 =?utf-8?B?RTEwTk0rdVBEcHVVTlFuTVdscmRMbUlaZGdjVDg1S3hYd0FGM1lBNUVIWWlX?=
 =?utf-8?B?ZnBlcHdzdkZoMnE4cHBGdnRrRWhrS09wQ2lBMjRleHNWa1M3b1lVakNuWDg0?=
 =?utf-8?B?Vy93WjBRNFJJR3hFc01KT3ZENTZlaXAvaHBzb3BlamdkQkhWWTdodTdqMVV5?=
 =?utf-8?B?bnBVc3NQanBnVFdBNjRqSTVWTjdZcFV0a1VSb01FOGo1WHF1cWloRlBIakJo?=
 =?utf-8?B?VVpURzV3ZlRxSUl6WjBJWFRlSlFvUTBzcU1nUjcvcGhKTXRkMmQ4SEFpR0p4?=
 =?utf-8?B?cTlwUlZhK2xlT0l4YVphaWQydGxrRnVYNTUvUjFaa0o4aUFYbmVaSXdNTXRi?=
 =?utf-8?B?MDJYNzhJRDNCK1k1bjlXRm1QdEFzeEM3dUs2c0t5eGdqTjVhZ0pzTGlqc2xj?=
 =?utf-8?B?R0h2UW9EK0JQWHc5cm92S0twRUJFN3ZBRmRGVzRYMk4yODlHaCsxZ05ZVHNj?=
 =?utf-8?B?Z25pR1ZQY3ljWUhDSytiZ1ZUcWd3cThDdSttSldOc3lRY3VMdkVscUd6WG5N?=
 =?utf-8?B?QjBKVDhWeUR0NHhGU2l2Y3VrdFBHWTltK2RteVVpOGQxVHkyclEzOURydUcx?=
 =?utf-8?B?amdVeDVZd0dwWDFkaE8xL0drbHVuMm9vcUdZMVBNakxMUWFKSTgvOC83dDR3?=
 =?utf-8?Q?zGSubxICJqxI0tk0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 485e5fc1-6a0c-4235-1cda-08da12f8ddbe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:28:50.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNzYp3IA6JDAQfNNgcW70x780FttpndhEVmM9qeZKKgI+pjqDQXocKhvVSeGoYsrm56G98j0I0tYafyuclhcRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3112
X-OriginatorOrg: citrix.com

Hello,

The following series implements support for MSR_VIRT_SPEC_CTRL
(VIRT_SSBD) on different AMD CPU families.

Note that the support is added backwards, starting with the newer CPUs
that support MSR_SPEC_CTRL and moving to the older ones either using
MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.

Xen is still free to use it's own SSBD setting, as the selection is
context switched on vm{entry,exit}.

On Zen2 and later, SPEC_CTRL.SSBD exists and should be used in
preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
compatibility, Xen offers VIRT_SSBD to guests (in the max CPUID policy,
not default) implemented in terms of SPEC_CTRL.SSBD.

On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
abstract away the model and/or hypervisor specific differences in
MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.

Note that if the hardware itself does offer VIRT_SSBD (ie: very likely
when running virtualized on < Zen2 hardware) and not AMD_SSBD Xen will
allow untrapped access to MSR_VIRT_SPEC_CTRL for HVM guests.

So the implementation of VIRT_SSBD exposed to HVM guests will use one of
the following underlying mechanisms, in the preference order listed
below:

 * SPEC_CTRL.SSBD. (patch 1)
 * VIRT_SPEC_CTRL.SSBD (untrapped). (patch 2).
 * Non-architectural way using LS_CFG. (patch 3)

This has survived a XenRT basic set of tests on AMD machines.

Roger Pau Monne (3):
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
  amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
  amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

 xen/arch/x86/cpu/amd.c                      | 116 +++++++++++++++++---
 xen/arch/x86/cpuid.c                        |  28 +++++
 xen/arch/x86/hvm/hvm.c                      |   1 +
 xen/arch/x86/hvm/svm/entry.S                |   6 +
 xen/arch/x86/hvm/svm/svm.c                  |  50 +++++++++
 xen/arch/x86/include/asm/amd.h              |   4 +
 xen/arch/x86/include/asm/cpufeatures.h      |   1 +
 xen/arch/x86/include/asm/msr.h              |  14 +++
 xen/arch/x86/msr.c                          |  26 +++++
 xen/arch/x86/spec_ctrl.c                    |  12 +-
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 11 files changed, 241 insertions(+), 19 deletions(-)

-- 
2.35.1


