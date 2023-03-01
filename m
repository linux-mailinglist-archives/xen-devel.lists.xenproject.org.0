Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E976A75A5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 21:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504239.776820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXTUS-0002Qg-LV; Wed, 01 Mar 2023 20:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504239.776820; Wed, 01 Mar 2023 20:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXTUS-0002Nq-I0; Wed, 01 Mar 2023 20:55:56 +0000
Received: by outflank-mailman (input) for mailman id 504239;
 Wed, 01 Mar 2023 20:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLqk=6Z=citrix.com=prvs=417c45763=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXTUQ-0002Ht-BO
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 20:55:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c80f03-b873-11ed-96a7-2f268f93b82a;
 Wed, 01 Mar 2023 21:55:52 +0100 (CET)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 15:55:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5381.namprd03.prod.outlook.com (2603:10b6:5:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 20:55:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 20:55:47 +0000
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
X-Inumbo-ID: 72c80f03-b873-11ed-96a7-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677704152;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oWPJNd7JYE+qRN1i8d64xlLUfT9xinDAqKeTDpM8/GA=;
  b=HtlBkAKWE4ZO0tmhdb9gwLZ7uR16x1p3HKhVvWtG6SRu4JKBNa+Nvx7x
   qTppuYPdu1YmYzQtmY9ZaudM0Ki80yzEh1kodh1N+X5AncoO/Bz7NEtOY
   9tRtjbpExDIn5QrzaTU81JB1Rzfn+b+9EYZng33d5uOyALiT0eofSqhGT
   8=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 99087010
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0fCBR6kCZuW8yLShfp3Hii/o5gyiJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWmnQP6uJN2P0e4gnPdmypEIAsJaHnd5hTVQ/qyo2RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5AaGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f8hBi0nXAm/u/2ZkOKSE+Yxu5g9NPC+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOGF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNDTO3nrqcy6LGV7mdCSyVHW3zlnfaW1G68cNdED
 mcvyDV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zmv9s1hxeWFNJ7Svbp15vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:QFvm368X9Hsds3crFcRuk+AXI+orL9Y04lQ7vn1ZYxpTb8Ceio
 SKkPMUyB6cskdrZJhAo6H4BEDkexjhHPFOj7X5UY3CYOCighrMEGgA1/qF/9SDIVydygc178
 4JHJSWSueAaWSS6/yb3ODSKadG/DDoytHKuQ6n9QYUcShaL5tHyCdSTiu4MmkzfilpIvMCfq
 a01458oT2hczAyQa2AakXsC4D4yuH2qA==
X-IronPort-AV: E=Sophos;i="5.98,225,1673931600"; 
   d="scan'208";a="99087010"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ8WUlQ1dn6oMSD4WARAXZuE5uMFKSRcnF8typIyniut+uJcHgPUsA3zW7ZkSARUlPpjXQ2kzeRQXrAifjE537jX6eLnMhekygVnXAy1KXZkNK5P6BkeA+QDZ0hUAA3XRZmqo7DFepZV2O9Sx6iXCrXO2i6iwHGwxEm29VQIRZMeQUixyhiIHwIEdEG+kEwBYjpyYFK6fTH/o5Svl4Cxd4FhptkQvmmMwP3l2NPsP8OptppiDnhNaV7LNEVOgkqDU8bsXiO4Y/cb+jhTtiv7RVV/6tb7QxyoEAj1KcBEg93O3lgnoQnB98ThFNqw0GAsZ7dWbDE+ngxi67HoyXa2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wAaOqcWTWaLL9Vj1oovXb76K8P9CVuINZsPMN85Ycs=;
 b=Xj383TjWqqybBqaN/ydjYHBx5tcml9xJcMIXnt7qdC+sqFmU8jOIMC2nFp3rhQTXCRlxY6Lmpn/REQpuUGT0ZMO3HN1ROsuP6TiHCdeg/dn7Mo0cHcLdN2ECn1PTxS9zyu9K/+TiXhKVAppJrZGxpvd7eIyFhIW4WS0Mf7Chk9yRGpZGAVe6V3f3/W6JIE8DUbNkQEiwRvIPNHJlv2edBl0nnuB6HfzMR8JwC5aQaGA28P7bnap4bxCrwNkNMOYxbCTzpDIrdZH7qa2hyoIpNB0Wu3HR1YCfYZNVxqaVT8tEh385CDDAto3gcj8Xw1awYqW5O1IXpMtYwFNSLS+mXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wAaOqcWTWaLL9Vj1oovXb76K8P9CVuINZsPMN85Ycs=;
 b=W4rQtWmYITLnrqdNWCj7bivlDLEzZyJ65jV5LO7R71MubC6rGgLvvlvJ4UtahREyBNfCtJnaGU5gr2HkiR8584RgkbWZXLniPEwZSMKxjzOjNUVm7XoykY8+/5X4eodTTZsOQ7GyZWNzNC9cTONREMq9KsfayaOGSGPGbCiDSuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <28cf4512-c92e-ee84-1c02-6af242b666cc@citrix.com>
Date: Wed, 1 Mar 2023 20:55:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <30a79d1e-c638-9e74-52fa-4cce53cd12dd@suse.com>
In-Reply-To: <30a79d1e-c638-9e74-52fa-4cce53cd12dd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0117.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5381:EE_
X-MS-Office365-Filtering-Correlation-Id: 19eac636-40ad-4893-a6b0-08db1a9754ac
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZBO0oIjORALD4hfW9Om9nSrk6FZw/rLMss1jvwDXp/I/grpEULWF0CRo58Lcvix48aF9pmcHvi5UsFo/WdIO99f+FKpYsQCvb9vtWj8Wjp+5TctLjRoicWrM3yn5Cg3tf0pt7AayYA8M32w8YAaCn3gUeJ+4iVtglimVbWovOdJwLXtE6+Er8SSL6uJJPl68fzoDO/9LAOFgQZA3TtYLEBwqL/MgoFHmVcWZSaffXYxeNPW+1p7z13m6knTtzkA4NeW2TZ47elDFvKUx4XMj7Vvb8uA5Z9IlgG0LYWEbSQTZz58nRtDAz6TrSI8EYgyTR+KLL95NGJVjPwEqUyP/cJdvGjNe2cUgqPJvKcKi9bhX7ahZgwdWQBSsMwMtrkNJVTddXoV5KDT9SsO7jF4thxOLTjEC62HxkTwd/Bv84ijSJFQfp427VZ1BtDNw2g5BFPZS+DnV14YzOQPt+L+gm8CjiWq1qAAoEvnI94K8MO7s6Ax35fhYXucqFouW68Fnkcd9my0JC9Yl119IZLD49IpUhai/Sy+oRNr9HT+vtbHQ50aXm5293zddCWtovh2ipkDFLfwcYuAjceJfATziMk63yP70bC/nylydYiAliq87xDnq4EG7uJIxlYP9n5b0a8NS4XRjZumPqMJJ4USm3p9DXeUAasYCkwywwniF/O5DyspuzLYywMfcPG/0xWWRnbv/EzGI50go+159QQ/X4mH6Zj7fYHpz5v4J3fR4OZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(54906003)(36756003)(110136005)(316002)(478600001)(83380400001)(6666004)(107886003)(6486002)(6506007)(5660300002)(186003)(6512007)(2616005)(26005)(8936002)(2906002)(86362001)(66556008)(53546011)(41300700001)(66946007)(31696002)(38100700002)(8676002)(82960400001)(4326008)(66476007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0g0Tm9xN05Ua0I4MmFVMDUvMzlnOFhCdlN0eFpuTWtBV2NlbVpSbzAvamM1?=
 =?utf-8?B?OEZNTWJYbXJsblJ1cVVISkh3aGVTVkhHNUhOcFl0Y3dESms0SDhicGVKL0h3?=
 =?utf-8?B?ZHNmN1p1NmFtbElGS0RRNDZqcVYvcjJVZGdBb1pBeHNkYVVuelJaTHYwV0V4?=
 =?utf-8?B?MWNvdU5qL1JvMjJScFNTMHYxdFAzbTVCSU13aFJadnYxVFJ5b2Q0Q3VIN0hP?=
 =?utf-8?B?ejViRDIwTTJsYlUxczN4V20vTmxuYXU0MGpoN3VFM1JidzRZUnVvaFRydE1R?=
 =?utf-8?B?V2JSL3RMekE1UVNGbmc4b1FKeE9oS0QzWFFlSGdraVU4U3dyRStDeWVkMW9j?=
 =?utf-8?B?Zm1GMURuc1lML05lSVVSZXJvSFM3dXFyd1NEQzQ5WUFTOEhrTkNmemlmcTlz?=
 =?utf-8?B?ZmtuOXN4T1VtVExaVHRoMmFybmVJRnVuUG9IVEkwNEszb01XRFpXWHRPSzFU?=
 =?utf-8?B?R1d1OVNxTng2VGN3VU5VaW1CMFN3NmVQVG9Lc3UxYWs0MEx4Wi9RUzlNL3dj?=
 =?utf-8?B?U3YvNUd1bEpHNTEzZG4wVGQ0Ynp3TmhFaTVwdGVDY1pubDJralRxTHJZRzBL?=
 =?utf-8?B?SGpQc1YzS3ZJdlVvMVF6K043cWtGNGVqcWlpaG1zbXUrN3QzcUdSTENMczRX?=
 =?utf-8?B?eVY3UU5iQlZnZ3dkVGM5Z1lKekw1VElqTkt6Zlp3RHpFRTJEaTc2bWVhUlIy?=
 =?utf-8?B?Mms4UGhSUk5VME05V1hKc3dJMEtrZDZNZUdLUVU3WHFKYkN2OEp1bWRxZE1V?=
 =?utf-8?B?eVpzSVhJN3dZVnM3akNzdHJ6MzhIdVVVNjk1TkVCdzFoZTFvSEZvenV2cndB?=
 =?utf-8?B?dzJTb3gzcjRMcjQxb2k4TThZMlZqbGljakE5R09zeWc0ekZYTEtEZ1d0ZTBH?=
 =?utf-8?B?R2x3TFZtVFZnamk1ejM0Q1RXOG1PY3FnTWJLK2t3MHprOG1mUjYwbXBWeG9S?=
 =?utf-8?B?c1NDMFVPNGRYMzZrSGlTMVY2YlYwUUtyRUZ6QVduVERmQUVyKzhabVZvM1Rt?=
 =?utf-8?B?STlwL0Eyd3MvU3hObDMrUmwyK0xyQXN6S040aE9zeFJlUjNkbDV5UEszRnBX?=
 =?utf-8?B?c2lXb3Vsd3B0LzR5NGU1TWRIWkRGVnBPYWJrZndPejRyVXJlcWNtWWZvSVRQ?=
 =?utf-8?B?eDhwWGZ0WFVWTUYzVFVlVkVERmVveFVsV2M0cnZ3bzZxbnFYaTdaOVVqcHNT?=
 =?utf-8?B?dGlZRWIwVXR0ZlRwSHJwSm9Pb0tnd2IxMlJWVXdmaHdlcTVXRlc2bmRmYVZo?=
 =?utf-8?B?dk1Ka1FrSFdlNXVNTGwreG5WMi9aaTNzdXhjWUo0TWVrc1V5aU8vVkwwU3lV?=
 =?utf-8?B?bjRkMVFTQ0NmK01Hc2tWZW1yeXVYUUM3UlNtVVlURXVoVDJacU5MV0VydWlC?=
 =?utf-8?B?NXpONWU4Y2hYSVhQY3gyZTVSUlJSaWlmb1NoYVppSkxTMWVETGtaQ3hXTWhl?=
 =?utf-8?B?b01qZXo3TVM1MHlNM2hid0FJQy9GelRWU2hVMHpaRytwQUJmd3hGTmRwMXdq?=
 =?utf-8?B?dUNLU0RsMVhFckQrN2xucTgzdVdMSStqc1lqVmN1WXlRZXFIU3NrRTJGSXdo?=
 =?utf-8?B?SGJiUzBxenh1SHpMQlJkc2RTN0xpSEJrUmFBZFVwUE5leG85Mi9pc1RZQlAv?=
 =?utf-8?B?QWRVWWZ1dWs2N3lraTRZYWJVUlB6YlE4YkNJQ0x4OXpPQXhwaEh4dTZjL1hI?=
 =?utf-8?B?YlZOQ3Z2U2NzbFZGaVE3clY4T013QWQrSytNaWFwRmR5ZTYxcEF0K09qTzdo?=
 =?utf-8?B?RFoxSHBvMGxiUm9UQ2QyUW4wcm9MOHhMSnRVNEttNW15RWcvS0NIUFp1WGt6?=
 =?utf-8?B?TDVsUCt5RWJvMWVXMG96b3BUQkpWalM5ZFlCMmUzODZtS1FqQ3pPS3A3ZFEv?=
 =?utf-8?B?VDdvd0ZFWEx4YWFtRmUzeWpubjROdHlSLzU3YTJUSS9qNGpwdGVDSEFNeWNB?=
 =?utf-8?B?WVdLUzZwMEU1MFZCQldWUWUvMFYreGQ4TGc2Umx5NzJjVWZxN1B1cHA4Nitm?=
 =?utf-8?B?N013UHpzbTc3TEk5T1FGVmNXcEFEQmw2bmFzUjJvTjh3cXgrVmRudThmdXNp?=
 =?utf-8?B?L2Z4aCt5aEFQT2VYTEw1c0E4Q2Y5T3AxRmJLejE0bHNZcEVObXV0QTE4eWUw?=
 =?utf-8?B?em9RTjJrL2NqY0JEN1Y1MkNlRDZVcS9qQlFoSHJvSU02MFY4TXNJZ0JRRU4v?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DCq6AOsHcIPMx0nVE9E6qqGHCSVtSbG70jz+yLCV8QqxmeY6kJP6J+LpglM+eVBZAPVJfK0IbpcFNr5lsEJbXa4JAxXaybcuWmN7m6vRVyt2ikZi0nAu3g26mkCZIfK4hOPziUYVbtt2oXbMJL/VwbZKY5/Nzco3bn5AJyUcsVR+4NXyVsz5DMai2iN/lbCHkwTR3rrQNI+OvsudLGpdt/kEkwjhmKxWE7mVOZnppfV5jwuhVPUiFBVuNC63Hsxaif1aLCUe6FTc+8RVcxEHr2/YORjRkrAKWU4iUW40OoSefw2TlJReE/CnrShxBXfei6Gwlfzl55nakZaUUApLFEbmhWOT48acoaJyofdHn5aUvCYtBGFLDS2R+hghw0Ar5WPle9GedCwWxUvRah+xWqriBXqT8JjxEGOWsmip7otDE0ptMf3Ar4p9jCnpHMVX3brUNwdrPSvWP+A5Wis6F4DB0yNpcGamtP9vVbaVqB+qHnYOKfDepCrDt2kSuan2P9L650pFXoho6Kbflv5USCx3gtv9GjbvWgLA4b+SjgQwtLI8II6QYKxClZMOZNeWlR8ADLj85tChMWeCrKS+ZYGmt7GQmdz7Zo92F0WdXGA/bqfL516ds5JyU0mYc68yX81rXTQnQY7kc0jbKtG2uJvAIMuj48MkZssQo/jRkb5g9pIsft+j9hGZqkknIoY5AQL3me0gQ6k/eQbUyb3xl5+uCaQ6a38T9w29r2JVKEdl90+NgYZLh0Fs4P9Qio2d4jkaFhb0/hK1tkda7ygG+MmygQGLsupLGIiie0i580hZscL+1X03L1h7OrD1xJeG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eac636-40ad-4893-a6b0-08db1a9754ac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 20:55:46.9479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KH+bKg5q88gQUIv01+LAOcq1QfjaYYnn5irACWNVJ11+EgG8+RCH+a6IJ5iTPbCkM7SxgwrmfmSVgUahsdqVrlR83cJP8y082H9t2j0IpM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5381

On 15/12/2022 8:20 am, Jan Beulich wrote:
> core_set_legacy_ssbd() counts the number of times SSBD is being enabled
> via LS_CFG on a core. This assumes that calls there only occur if the
> state actually changes. While svm_ctxt_switch_{to,from}() conform to
> this, guest_wrmsr() doesn't: It also calls the function when the bit
> doesn't actually change. Make core_set_legacy_ssbd() track per-thread
> enabled state by converting the "count" field to a bitmap, thus allowing
> to skip redundant enable/disable requests, constraining
> amd_setup_legacy_ssbd() accordingly.
>
> Fixes: b2030e6730a2 ("amd/virt_ssbd: set SSBD at vCPU context switch")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This wants properly testing on affected hardware. From Andrew's
> description it's also not clear whether this really is addressing that
> problem, or yet another one in this same area.
> ---
> v2: Change core_set_legacy_ssbd() itself rather than the problematic
>     caller.

I think this patch will fix one of the errors.  I've lost count of how
many others issues I've found now that I've looked at the code in detail
for the first time.

However...

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -744,7 +744,7 @@ void amd_init_ssbd(const struct cpuinfo_
>  
>  static struct ssbd_ls_cfg {
>      spinlock_t lock;
> -    unsigned int count;
> +    unsigned long enabled;
>  } __cacheline_aligned *ssbd_ls_cfg;
>  static unsigned int __ro_after_init ssbd_max_cores;
>  #define AMD_FAM17H_MAX_SOCKETS 2
> @@ -757,6 +757,11 @@ bool __init amd_setup_legacy_ssbd(void)
>  	    boot_cpu_data.x86_num_siblings <= 1 || opt_ssbd)
>  		return true;
>  
> +	if (boot_cpu_data.x86_num_siblings > BITS_PER_LONG ||
> +	    (boot_cpu_data.x86_num_siblings &
> +	     (boot_cpu_data.x86_num_siblings - 1)))
> +		return false;

... this is nonsense.  There is no such thing as an Zen1 uarch with more
than 2 threads per core, and attempts cope with it (as opposed to
rejecting it outright) makes ...

> +
>  	/*
>  	 * One could be forgiven for thinking that c->x86_max_cores is the
>  	 * correct value to use here.
> @@ -800,10 +805,12 @@ static void core_set_legacy_ssbd(bool en
>  	                      c->cpu_core_id];
>  
>  	spin_lock_irqsave(&status->lock, flags);
> -	status->count += enable ? 1 : -1;
> -	ASSERT(status->count <= c->x86_num_siblings);
> -	if (enable ? status->count == 1 : !status->count)
> +	if (!enable)
> +		__clear_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);
> +	if (!status->enabled)
>  		BUG_ON(!set_legacy_ssbd(c, enable));
> +	if (enable)
> +		__set_bit(c->apicid & (c->x86_num_siblings - 1), &status->enabled);

... this mess even worse.

I am rewriting the legacy SSBD code so that it is fit for purpose.

~Andrew

