Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE252621D
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 14:37:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328464.551480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npUYC-0001dU-8i; Fri, 13 May 2022 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328464.551480; Fri, 13 May 2022 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npUYC-0001ay-5A; Fri, 13 May 2022 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 328464;
 Fri, 13 May 2022 12:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npUYB-0001as-BP
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 12:37:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a0a60ad-d2b9-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 14:37:41 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 08:37:38 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6707.namprd03.prod.outlook.com (2603:10b6:510:112::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 13 May
 2022 12:37:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 12:37:35 +0000
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
X-Inumbo-ID: 7a0a60ad-d2b9-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652445461;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/vr0CM3E/sL7whYDZuhpjQAluNGSZR01lKLZcB64nqM=;
  b=aFtkW9MIIlE/EjACu8GSrykl/8DQcSLgC2ASSBYWqC/mk9KmKYRuowHl
   zSoGdCe6YbCzSPoo64ZGEA4jTD79OBcTdltEwH1mvnJgj11v1I1Z78RUd
   8MwX85UJjtKW5620h0waA55EOnPXDFtj79L3Pcu5KrqhI96zP/xeQHdFG
   k=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 71260576
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cwrTIa6O2uefei954Hk+tAxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 moXX2jQOK3ea2ujLtxwbIux9ksC78eHytFqHFZurH02Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSfciIvLqHL39hCEAVWCCpmJIQBoZ7udC3XXcy7lyUqclPK6tA3VAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YAgF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IB8gzN+PVpi4TV5AhV6fv0GujyQcCTdc4ItGiWp
 FDLxmusV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJt//YS7QiMzu/Y5lifD21dFjpZMoV+6IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:DAfpiqhLxLn/jbc2jrlvzC2WH3BQX5R23DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICPoqTMiftWjdySSVxeRZjLcKrAeQYxEWmtQtt5
 uINpIOdeEYbmIKw/oSgjPIaOrIqePvmMvD6IeurEuFDzsaEZ2IhD0JbTpzZ3cGPTWucqBJcq
 Z0iPA3wgaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6d9bbRuwqTnSW+fkNjNyKE7rgpKCcwLCEbzYpBOe
 twrhKknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfRsRKEkjQpo+a07bWrHAUEcYZ
 1TJdCZ4OwTfUKRbnjfsGUqyNuwXm4rFhPDRkQZoMSa3zVfgXg8liIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4AOsaW8O4BmHEXBqJaAupUBjaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXL1pxW9RLGRnm7QF3Wu4tjzok8vqe5SKvgMCWFRlxrm8y8o+8HCsmeQP
 q3MII+OY6UEYIvI/c/4+TTYeghFZBFarxnhj8SYSP6nv72
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71260576"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekAvpseGNtStvbcOa9xT+aUrziPCUc4XQ38BL2CoxA3ivalXSygCGr85gBpoV93waLLnFxhSaADjTLtl4ouPgF9w+SX9L9s30N7a5VTJeusjnho6AXFd2Pmi7hDo8wLDjzGLV97X7piOxaekbd+u1DKESRiLJfWkRrzguacvpjWf7PqN0DIDy8XXMr/BIK3n4gx0qbndQyYKzYvsxImFYQBEg2bNE9+uSxXVKc5tV0yKCmT9wXh3hFd8Z6y1tuEvLxP1Pp75viqQD55HuxOYvvp/Wz44EByQmayZnCl7pm5huxEh7Rfa0/zvbhgL5aJAereSGJYgpiLG6BMIQ/MNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCfx29mOBuSVuS8/K9JiopkQUCRSD+KNA3QEAlApLYY=;
 b=EPe0pTLSFMlUbFltH1tTuPhZg24jnA/e9EaUG6EHyDmeJERO+uMHsOliHLwD2TWSy/DkN3r1FcyQuMvWF9hhIH1jOc/4SuUfdYGGn3LfMPZtPU8dU24wGkeh3+TeiIsU1PjF/5p5d+y5cb5Vj9POSuNQkYgf6hkizMjGb1pKZozQR/jWVgkW5iFvJyfo6wFcAXXkZTDztKhEb7b3XzSEvBNaKjpwG/9O0ZNtz7YGUOg2Ni3P93+XE5g8Cy6MZ0WXL6xbCGI4l+1SOpfhYT2VdZNCGPmvodRqsOcqXo/Ony5uIM4tUXfhTKZ+zbHbmKI3UkBv1ARRrUr8CXjcbrwq+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCfx29mOBuSVuS8/K9JiopkQUCRSD+KNA3QEAlApLYY=;
 b=HLTTYD9I/7xV7hDi4Y4CCGc9x9vKzDfJjjcUIP2Zjkh0dlPlRj9kCxdAXNIlosMX2249HRnYpURymS0ToJjCgJvDFVuYUlY/w1cqbB0Rlfx8/3Jw8sw0q/FAJEkYk4ONmA20GrBQRDqDGz9BeOKnb1Mhvom+zr/k4SYarvaGGfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 14:37:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/cpuid: set MCDT_NO for non-affected models
Message-ID: <Yn5RC+Rti6bApnw3@Air-de-Roger>
References: <20220513103500.3671-1-roger.pau@citrix.com>
 <20220513103500.3671-3-roger.pau@citrix.com>
 <ee3aa9f9-1c14-5984-263e-6b606e255bf2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee3aa9f9-1c14-5984-263e-6b606e255bf2@citrix.com>
X-ClientProxiedBy: PR3P195CA0011.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb57bbeb-090e-4a87-4222-08da34dd5b7e
X-MS-TrafficTypeDiagnostic: PH0PR03MB6707:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB6707D42BF7B9B029B8D1BFA88FCA9@PH0PR03MB6707.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fydebJKZDejiFSW2NxAokIo1MslMKmmCGpI4p9QDNg7Y6Kse0Xg+2MY2xOjsRwo39ykCQeCTGzdz9dv5I7kGSeCNVlDB7SKPXFO/XtMZL99P8BrTyRIrG4KHGQpBgooh9uR5saPOPPLRtSYT/QEvxeT4GMaIaupFYT6KJSBIzQMXHQaJuSWcmrs+jcmsNQHxuXvWbGZYFDUNOAsUgNcIrj4W8eiy2FmKsiDeCBadIsZtNMiKH33z1wREabMG5g1wcRuw7SDUWzQX+x1AO1KppcmZQa3an9sdmNrQh8/o7W7NU625ILzY8ElRH5q13R1u3BKwETLQufDyIoQvZ43YqWpfEjpTS6ip8UpHG4cktOQa2IO7Di5fdFZQ2r/Eqglqs49+c5MfAC8DR017FZxzUjn06bsL93hnTBlvGi/HdJu+sELJdnZMfSU8wgFuoHBr3VSHwE3VS0Nv44HnCMKimI573TKCLJsiBkorwHujfHrrMwE16ojcb18U3EmFcHxqQgBmEYTylVz22uUDrOiX/Lw497EzLsfEDaa6aqpBqbJ3HQFWKb7bQ7+azPZjdDtbcQxilT51JfeqUg49X+yZ6E9Fe/jnhthFBL3IpWGk0hXZBgxbCPy58kZYqNnT4i5AiZLYhXjkXJm4Nx9OvymgkU3xIQ8DqtH5qdyFjqrTXf0rZBBgZQe2Xw82KpmZpQmT5bcoqxJNI3y2/f63fRBNxZVt0oxRrWZK9QQJgjrb86c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66556008)(54906003)(2906002)(85182001)(82960400001)(6636002)(86362001)(9686003)(6512007)(316002)(33716001)(186003)(26005)(508600001)(66946007)(66476007)(4326008)(38100700002)(53546011)(8676002)(6862004)(6506007)(6666004)(6486002)(8936002)(5660300002)(83380400001)(170073001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGN2Z2Z3YmNOWWp5VGNsQWt4NDR0NGN5Q0FEcU5vRWVwdnFuS3JnYXllUHNR?=
 =?utf-8?B?TzRxWnBjYkdtVFFJVll3Z1owOFN6a3EzcExEZmNtNVIyanRnZUhsSHQ5RlBt?=
 =?utf-8?B?enFiTDllbk1zMTFORGZvTGxVdm00b1BHL2JRVUFrbEhaLzVxc1hCOXdCUUlC?=
 =?utf-8?B?RVEwRk55bjF3bWNqUUN6TDNoTjJzT1o3U0EzUjFmRTBPcWRzcjhIVnhwZGUr?=
 =?utf-8?B?eFhzQVg4N3puZCtRZ3NLdWVaNTdqb09uM3p1VmQxVlRPa0FzbDg5QlJEaEFO?=
 =?utf-8?B?NDRETjBrNXVZY3hHcktGb1Vwd041TGF4WTJUMHBZbmFLa3ZxVCtxdmVqTHYy?=
 =?utf-8?B?UkMvT083NDMvM0dVL0dldlJXZ0s1RkFzSWZkMkZJQlFJVjNmYUJ1ZXJRSXZH?=
 =?utf-8?B?VVhMOS9yVmxGZ2VrdVBwOVBkSmFtb3IwdVVpYzI1azYvQlo4WDZKNE5vQi9i?=
 =?utf-8?B?RHBTK29sbS9SUG5hUWphNlQyYU9HNE1lZWd6OVRkRVpJMHJhejVub0lEMTdy?=
 =?utf-8?B?aGR3SlB5dGNLc1p0ZTErQTUvcGdkTEhPak1RaU8ra0dCWlBxdVB3b0xtQWY0?=
 =?utf-8?B?M0kyOHoyUVVITFdXN1hiNUo2biswb0NmQ1NsU0NXRUZiekc1ZWFDV2VHN1JP?=
 =?utf-8?B?VWxwVW5nUlRTTVM3RHA0akJrQ0U0ZitMbVUxdGFQWEJEaXBvaXBWT0dnd21s?=
 =?utf-8?B?OC9MbVZua0RvNlRWVy9LZ2ZRZVdXeVNvUUZ0azRPSXlsSm9Ed05YY1ZWWUJ4?=
 =?utf-8?B?Q0R3cHBlejA4Vkh5a3JMUWUxblkvU2kxWUhJVnNSVTZWNGNTTXNuVUhxUEMx?=
 =?utf-8?B?VjIwalJaYmdFQ1VCcE9uTW1ia1hYUGxHSTVpUVFKKzdOWlNiNzB4eC8wR3hp?=
 =?utf-8?B?WWRDUVJSeG4vbE5VQlBrcnF0MmJuU01CRFB1Q0YrRS80UXhyM0doUkFuSERL?=
 =?utf-8?B?eWw5UVV4QzBWRG5jcmZUUVlvcGJJQWRBSTRGRlBwQkl0a1c1eW8raHV0R20r?=
 =?utf-8?B?RWt3M1BJSGVpSU1kbitiN0dKOC92dzV0Q3FzclhkeEJGREhOVzVPK3hsaHlE?=
 =?utf-8?B?T2Y0TWJTd0tscWFhK25WTXVvd240MlR2c0s3WDhsNStEYlpxdmZoYkJQZFpT?=
 =?utf-8?B?TG5qNWZDTW5IQ0RYUGYydjE0d3Ivd3p2UFdaelR0RXdpdVZHOWcxR0E3WHhN?=
 =?utf-8?B?b212Wk5XOWdtOUg1WXQ1THpaYm5mbDhKWTRPNXdLclYzMU14enBwTS9hMkkr?=
 =?utf-8?B?Y2d6THFHN3dkS0tZNEdnTCs4WnBhZEZvZ1FIdXFpWlNwaEN3YzZabUNOdXow?=
 =?utf-8?B?YVRtZVFNdWtwbU9SdkZRZGMxdXlOVVVwZ0oyV2kxZDh0TzQ3eFdxWnFlVS9w?=
 =?utf-8?B?R0VYR2hxek5CaUczb1FYZVhhOVN0TU02TFp2azNSSVE0c3lkZEZndk5XWjJY?=
 =?utf-8?B?bFhzV0g1YU1NZUwwOU4xWDJ5STJsYVNrZjRHRVlSdXRSUlZVeWF6SVJ5Q2Ew?=
 =?utf-8?B?b1JWZzlCQVUrZ1ZsL3dzVXJ5aW1wTUtSV2hXQW50cWRFUGVmVGV5SU1MdUxw?=
 =?utf-8?B?Snc1Y0JZLzVjZlVUMnlNTjgveW5TT1RaditzRkN5eGZ0ZnlNdnJUY0hsVW0y?=
 =?utf-8?B?dVNKcUl1V2dCd1V3L0NlcGVocmkxUThsbm1IZFNwZHY0WU5wWXlHd3FObmpW?=
 =?utf-8?B?VzBCK0pyRlE4OTE4d0VwQWFEa1JWVTNjUUIvcHdDUWtGdEFlb0tyQVpNNmRr?=
 =?utf-8?B?QXJ4ZDFOYUs1cVZtRGxFLzhtWE5LeUpvY3N0SWo0eEUwM3FPaUhhWk9RS0Rs?=
 =?utf-8?B?NGNxSWxIRWtqdFJ6N0V2czFLUTlsejFDR0tnd3F5THgvb2Z6U3QwRW5nRzE1?=
 =?utf-8?B?VWNBeUV6bFR5MTdyMyttZzJERXMwS1B0MVdhaWlzclZQRE83bVlNT0VOOG40?=
 =?utf-8?B?S3dlWFBwR1IxZDU2RGxJQm1hVXd1d0xFblBqLzJXUGxnVWZ0ZWRsT3pRRVE0?=
 =?utf-8?B?SHFYTUFNZEpWODYxYms4b3dnTncxM0pwMlN1Tms0NW16SmwzeitKaEtCWmV6?=
 =?utf-8?B?cFZ0V3pSOGpmUEVCYnhBc3V2MWJmemtaNXQ5WkJ2SEFjRHZ1T29NblhmR1RQ?=
 =?utf-8?B?K0NqdjAzUis2cGlMRFpsSVpudXpSc2tSeEloQ2hZZDZhMXhXQThmZDZMNmRD?=
 =?utf-8?B?RjNRNFRhdEJtditvN0FwYmVpTk15SUloTy8wT3M0TTNrM2UwOGY3aFJmbzhl?=
 =?utf-8?B?YVVobklmUU84L043QTNIL04xZFA0YWJWZ2h3Yjd1WG1WVVV4aGk3dm1JekJ5?=
 =?utf-8?B?Y0V0U2Y0Wmp4TVoxZjA4ejZha2JEYi9WVVh1YWhHL1BXQm1pM1RqVEJQaFV2?=
 =?utf-8?Q?dfYBEl2R9hJwZHcM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb57bbeb-090e-4a87-4222-08da34dd5b7e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 12:37:35.4857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS1zQt0/v+20IDN5oaJkxfFoAqWha9xJB0rqcbrhN2gsrcNRNVmSUOZq7OHMFipHQs8upJJx/prtxXKprLzSxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6707

On Fri, May 13, 2022 at 11:18:47AM +0000, Andrew Cooper wrote:
> On 13/05/2022 11:35, Roger Pau Monne wrote:
> > Some CPU models don't exhibit MCDT behavior, but also don't expose
> > MCDT_NO.  Set the MCDT_NO bit for CPUs known to not exhibit the
> > behavior, so guests can get this information, as using
> > family/model/stepping detection when running virtualized is not to be
> > relied.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/cpu/intel.c | 70 ++++++++++++++++++++++++++++++++++++++++
> >  xen/arch/x86/cpuid.c     | 10 ++++++
> >  2 files changed, 80 insertions(+)
> >
> > diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
> > index dc6a0c7807..d821f460ae 100644
> > --- a/xen/arch/x86/cpu/intel.c
> > +++ b/xen/arch/x86/cpu/intel.c
> > @@ -518,6 +518,73 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
> >      printk("%u MHz\n", (factor * max_ratio + 50) / 100);
> >  }
> >  
> > +void update_mcdt_no(struct cpuinfo_x86 *c)
> > +{
> > +#define FAM6_MODEL(m, s, c) { 6, m, s, c }
> > +    /*
> > +     * List of models that do not exhibit MCDT behavior, but might not
> > +     * advertise MCDT_NO on CPUID.
> > +     */
> > +    static const struct {
> > +        uint8_t family;
> > +        uint8_t model;
> > +        uint8_t stepping;
> > +        bool check_stepping;
> > +    } mcdt_no[] = {
> > +        /* Haswell Server EP, EP4S. */
> > +        FAM6_MODEL(0x3f, 2, true),
> > +        /* Elkhart Lake. */
> > +        FAM6_MODEL(0x3f, 4, true),
> > +        /* Cherryview. */
> > +        FAM6_MODEL(0x4c, 0, false),
> > +        /* Broadwell Server E, EP, EP4S, EX. */
> > +        FAM6_MODEL(0x4f, 0, false),
> > +        /* Broadwell DE V2, V3. */
> > +        FAM6_MODEL(0x56, 3, true),
> > +        /* Broadwell DE Y0. */
> > +        FAM6_MODEL(0x56, 4, true),
> > +        /* Broadwell DE A1, Hewitt Lake. */
> > +        FAM6_MODEL(0x56, 5, true),
> > +        /* Anniedale. */
> > +        FAM6_MODEL(0x5a, 0, false),
> > +        /* Apollo Lake. */
> > +        FAM6_MODEL(0x5c, 9, true),
> > +        FAM6_MODEL(0x5c, 0xa, true),
> > +        /* Denverton. */
> > +        FAM6_MODEL(0x5f, 1, true),
> > +        /* XMM7272. */
> > +        FAM6_MODEL(0x65, 0, false),
> > +        /* Cougar Mountain. */
> > +        FAM6_MODEL(0x6e, 0, false),
> > +        /* Butter. */
> > +        FAM6_MODEL(0x75, 0, false),
> > +        /* Gemini Lake. */
> > +        FAM6_MODEL(0x7a, 1, true),
> > +        FAM6_MODEL(0x7a, 8, true),
> > +        /* Snowridge. */
> > +        FAM6_MODEL(0x86, 4, true),
> > +        FAM6_MODEL(0x86, 5, true),
> > +        FAM6_MODEL(0x86, 7, true),
> > +        /* Lakefield B-step. */
> > +        FAM6_MODEL(0x8a, 1, true),
> > +        /* Elkhart Lake. */
> > +        FAM6_MODEL(0x96, 1, true),
> > +        /* Jasper Lake. */
> > +        FAM6_MODEL(0x9c, 0, true),
> > +        { }
> > +    };
> > +#undef FAM6_MODEL
> > +    const typeof(mcdt_no[0]) *m;
> > +
> > +    for (m = mcdt_no; m->family | m->model | m->stepping; m++)
> > +        if ( c->x86 == m->family && c->x86_model == m->model &&
> > +             (!m->check_stepping || c->x86_mask == m->stepping) )
> > +        {
> > +            __set_bit(X86_FEATURE_MCDT_NO, c->x86_capability);
> > +            break;
> > +        }
> > +}
> 
> Please could we see about using x86_match_cpu() rather than basically
> opencoding it?  Linux's bug.c has some fairly comprehensive examples of
> how to do tables like this with it.

Yes, I know about x86_match_cpu().  I've used this open-coded form
because of the conditional extra checking of the stepping which is not
handled by x86_match_cpu().  I didn't feel like extending struct
x86_cpu_id and x86_match_cpu() just for this use-case, but I could do
it.

> Also, can we use our shiny new intel-family.h names?
> 
> The stepping checks guidance seems suspect.  Lemme ping some people
> about that.  I suspect that means "we checked the production CPUs but
> didn't look at the pre-prod hardware" which in practice means we don't
> care about steppings listed.

OK, that would help quite a lot, as then I could just use plain
x86_match_cpu().

Thanks, Roger.

