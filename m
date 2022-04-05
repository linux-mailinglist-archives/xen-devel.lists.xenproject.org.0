Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD444F2B9A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298738.509022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbh9y-0007Hi-W6; Tue, 05 Apr 2022 11:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298738.509022; Tue, 05 Apr 2022 11:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbh9y-0007FV-S9; Tue, 05 Apr 2022 11:15:42 +0000
Received: by outflank-mailman (input) for mailman id 298738;
 Tue, 05 Apr 2022 11:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbh9x-0007FI-Nm
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:15:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8e12469-b4d1-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 13:15:40 +0200 (CEST)
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
X-Inumbo-ID: b8e12469-b4d1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649157340;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HXpyLr73oolKs049QQ+QdEIBjDkYuRvvACRlzUVrxfA=;
  b=EaMJR7KZ78xFIk5yeIeyKo2+SbZGbW8QUVqI4hDf6FjOW4lDrsrnOx0a
   MYTchRIQHz+bjBgIQWlQurCp43k6oNrL7TYgsRnL2MESblA6bCvPPiEHC
   gXdkH+3CBUNFHmDqWONMRffzEYEB1kRs4gMy4ok00ynZeIyOkU3XqjMAR
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68439635
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8di9cK+RQxIGDwevr4sCDrUDkX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 TNMUGGGO/uLZDagLY93bd6zpB8OscXRxtRhTAFu/3g8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDkW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyraz0YZ/HupO4ydCteKB5QYIF896CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eQa2PO
 ZFEAdZpRDHtPDxtCHNJNJkVu+up2VD7XjJcmE3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0W8FyKdxjtCOxwIXz0QCiOUZZYgROd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP+D2BLwQKChRqlEGp/ZgPc1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAmfh81b5pfJWOBj
 KrvVeV5vsI70JyCN/EfXm5MI55ykfiI+SrNCJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7SkOHSIqNJNdjjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX2CWfQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:0gpGqagPb1a61aI7PxZHfsGgn3BQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGJXguNbnn9E426gYzNLrWJ9dPwE/f
 Snl656T23KQwVpUi33PAhMY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX2y2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJMw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAkqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocbTbqjVQGZgoBT+q3tYpxqdS32AXTq+/blngS+pUoJgXfxn6ck7zU9HJFUcegx2w
 2LCNUsqFh0dL5kUUtMPpZwfSKJMB2+ffvtChPlHb21LtBPB5ryw6SHlYndotvaPKA18A==
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68439635"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpb4nAxeDq4x7jlq8eiStzxkBiEiV+5c2mcKIv9GdwSpNxbfvFplYd0VUgCwQaTqzxlbY5lK6xlmkFdua1Dh7Ywq/DPEryLoFJZvqvrbK2/d/sGuVYzZ3P1xQv0c9TfKyPWT1VHMhoXCVl4SAZVdxDgI66xG+NzPmiNohVmZ5Q5+pXlgyD8EMJakjYOhof26rCbqxRndinP1xfBE2Mj0aV22MNTnsOQyn9ltO6Ai0TqMbRGsVlxPPYZvvlF9B787iVNm2fCwAgqMCQ11+ZvQOcMhHfKyxNbQ8wK76qvHhLIj/wGSApsfgouv+Q/8CoIH2lOuOJZIip4vXMY3SrvJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6EJDPZugiWLi+Ep8msk1uJIUBhvfLF3g7PGp7yy3ps=;
 b=XcCumUpPXgng2p4HUTgoAF4oEwMqGC6/siJwX9HPN1ofjAxzANv2Sg+bH+JuXRJs4EJt/qoFZmy8DBLaaikvAPbvQjQDQiDnfIaNQJ7K+rHP1xk1KUy5iO2PJvGw1wgUfhmcfbisDs5jhQ7SpHVAJvmLpgTHAdBJul+apJiOYCBFKPQNi1e8+Qz1iep2RvnHSDXUAD2/lnOvRmtYRJQNObruBov525zhPxuXpwzLN9c1Sb11K2ZplLK9lwMkWZq5BQ8kpzIWHG4R/tcv6Yu5tf+CuhzFTAizN2uErqtszjKfPqxf+CLrDHoQguJ8Zhdj0zRQYF8mVkCS4DyjOjlytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6EJDPZugiWLi+Ep8msk1uJIUBhvfLF3g7PGp7yy3ps=;
 b=LAUvsiGPKnfNomVmBsgFkSzD3mhtT/23PJfBfs+W66PDPwQiV1eXwdIXjMyb7XmGduws4eT8tVlTAhS7WjTDYDN/irNEzaI1oSrCwxKKwx2x3BUAHuGrDftVEQ9KkGus1uSZQ8VFGvzyXYI1gFgwdBAI+7VoezZoBSByxZqRpNw=
Date: Tue, 5 Apr 2022 13:13:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 6/8] x86/boot: fold/replace moves in video handling
 code
Message-ID: <YkwkdZ8wRrmRfQvH@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <8b66f631-18be-7819-7982-c56c03220595@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b66f631-18be-7819-7982-c56c03220595@suse.com>
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e8f466a-f772-45e0-4a57-08da16f563c9
X-MS-TrafficTypeDiagnostic: MWHPR03MB3087:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB3087999F0A5A48E3843C12F98FE49@MWHPR03MB3087.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BjigY48Q6W0OIhDduuVV5YZEtnCuurhqHCPq0YqvVLCPundnzbfkUbRoax46F45QjWwtiWTgH7mmN51Kv9n/6VJIMlt+E62Gcpvg3q2lueI1z2Vcptmk/eypFwXEycD2rjio0zNWhMAk5FkfsNZXKnb8ZrG340e6kfoquZwM1TpRAX88Z99sW5uUrs3mndEN+ltCVdTR9E6FmyXSbD5f8xTkt8ilfaIzY9MrSH3+nh6I+VyA0A2/fBRpxT23zPsEEqskLtwqi6oYqSzVPWciXAIBP7DfIjFCS1VJD3MTO46AKuKy1T5jHfwx7sfFSRrxQ6mazqnTvhOcmsXR5yphYCA21RB5w+JerVnLaxLRMSyiwN/5xwRV+I0SxPcZrk/J+l0X2n+5V2w5EVJTmfzTggzIpcS5/Jq9n5Hd2WLvDfHvRhPlLybLkFuL7G4fYNY9gHyD1/LHhAkvW4aic4DoCbGZypDZZjBl9cDNHr73Ezrc5nfqk3LxKU5+VQCkcugqUR+HnB9aCX5s4smG+KJCq6PQzmlI4CsSI/JpEq4e1+T5BKBHhdOMqo4LeaBj8kRmj3c3bUylgAM/oCqM6MUqYHgkFZtEAomoFFkZnjAV6yuAKDQGMhrWbj9q7yCY4/BbOv4KC+IxMgrCVO0tE/MrQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(66556008)(82960400001)(316002)(54906003)(66476007)(8936002)(6916009)(66946007)(8676002)(9686003)(86362001)(6506007)(4326008)(38100700002)(6666004)(6512007)(6486002)(508600001)(33716001)(85182001)(186003)(558084003)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTArWVRlL3ZVWVVneEd0U2NjM2JIdVBOVG81RTcxQlhIQnNoeGdWdEs5UnR0?=
 =?utf-8?B?S2s0WGpFYUFVOUhrNFExRDVTQVhZSCt4UjNGaHRqcWdybEJkb1l1Z3Z1aUMw?=
 =?utf-8?B?OFYrLzdmWTFYT1ppNHdaK1JCL1RaVzJmd2YyU09CVEtCVmxUb3hab2xIeWNx?=
 =?utf-8?B?TTVuc0h3V1JPM0ppWU95NGQzRm1sVGNLSW12TU00WVE5YjNKNDFPTjBwOWx1?=
 =?utf-8?B?NmNwbEE3MzRUcjl5bGgzUnhyUGd4WHpFZktYTDRTeE1QSUpiWTNpTFpIdWk1?=
 =?utf-8?B?RkRITFBYN0ZrcDRtTEpabjFuSjBqNWI5MnBJNDkrdWZnbUFLYjFOWW9uVzho?=
 =?utf-8?B?L3J5cURlV1kxV2lHVUtUWTFWd3JUMzVBa3N6T1hrbVJYYURSd3RRUTd4bm9L?=
 =?utf-8?B?SU1MS3hYanlQSDhMSThOb3E0bFkyckNIOUFndXB5dDBLZmYxL253S0Q2UTRp?=
 =?utf-8?B?OVJLQjJXMVliK2o1WlFhdEoweWxaeDlqL1hGU0V4azZwbW8zMERrdFBJRlc5?=
 =?utf-8?B?SkFlUEE0Z2hjaGQxZWdKSjNneXdDYW50c2VwZU5wM3lsVFI1MGdLQitzQ1BS?=
 =?utf-8?B?OGdaUHVrVFBwMTlVdHkxSGxPRDErdUNJVGxURk41Q05IN1BXdnFYNUlEQyt2?=
 =?utf-8?B?RndVUGZmRlJ2cVJVWlhvSmw4ZTVrbTRSSkVZeEQvRktTTzk5a1pMN0hyWHNn?=
 =?utf-8?B?anFVWDF0d2orWVVKRlVXNzNtb2JxY2NpbDlQNy8zL29qWld6blo3Sk10dkpq?=
 =?utf-8?B?ZS9MUW9rNHBtaWtnSWptc0JIUlBYd0d2QlFSTE5RTVpOVHduMjRWNWU0QWdZ?=
 =?utf-8?B?OHZodUxKZEJOcU05bndzMThzY1Y3Q0h3ME9LMkRNZ1U5TStqVzZ4YmdKdVp6?=
 =?utf-8?B?SHBVZHZUc1VkaUlZT1J5c1lWQ3VBNDlrUktVRGIza3l0dkZnVFo4bTFmeEdq?=
 =?utf-8?B?ZTJGcmkyalgwallqcnJOSXNudzlFT3F0TDBHV3draXVBMHFGRThtQWFDTjB6?=
 =?utf-8?B?c0VEUm9NeUZMdlBsb2ZPVUFId1FGNGkrallncFQ4T0ZKalRZYnBMM3VjQU1D?=
 =?utf-8?B?UXVKSzJiT042SGx4RW5qenpoNjRzY2Uzd09vZ3pwNC9iY2ZNelhUK0JLcTRm?=
 =?utf-8?B?WlEvU2M4MHhsUVJ1bXlXRDZTSWsyWGlONHVLVzVtdE1JSHY2cTMxZ1dIZ3dF?=
 =?utf-8?B?aGFNTjRxTzlxeVdLUm5DdUQxalFiYjY5eHU1eGY3d0l6emNtTVF5ZGxKK0ly?=
 =?utf-8?B?RG5Yd0FpT0V6dTlCcVRaQ3JNL0lNQ0tMMk1CWGJlNTR5Wk9qMnQyYVh0VFFJ?=
 =?utf-8?B?QU5IaC8xWmR0RHdtaXBGRUFKWlBNd2dFc1VrQ1J6dCtWRUtiaUY3TW9rYjFU?=
 =?utf-8?B?V3hIQ09hNGR2OXFPRE9rNXVDcXF2U2xMa0dPR1J0ZlRGUW1uT0VhK05LVFly?=
 =?utf-8?B?aVBNTGZKSkE2dkdjcnJ4TkdjVm5BUzVUb1BaYVlxOWxOV2U1cm1JR25STk9G?=
 =?utf-8?B?WDhLNnorcjAvckgyeWV5OTJQZDVXdERuaXlKa3V3RDVXQjRWVnBhdnhWeVRr?=
 =?utf-8?B?T0NnRmZsR3g5YlhBYVNFd2lrWVQxSzk1R2NKNFRGMnRlK2VNRXU2NU1OeTQz?=
 =?utf-8?B?QzRvT2FiVklLMUpnQVU3MFRtaVA2Z3hZOUVnQjlvZndxUk5jdzBIUk1IUnRF?=
 =?utf-8?B?YWlUenBZbUVOM2FWbGVuMEdVcWRVZExJOEZCNVRmYXJ0OS9ta2VkK21qK0o3?=
 =?utf-8?B?YmNnTG9rdEhXQ05tdTdMb2g2WUlDTm9zcUpjYTYwbHF0bDJyQWRWRnJCbEFO?=
 =?utf-8?B?d0dYS0FjNU0vbEN0M0MyQVJjcnFSUlNtUkZvUDB4emlPNCtzT240VVVKQkpF?=
 =?utf-8?B?RmsyTEVNNVF5eGNqNTlYNWYxYnlJRHB5ZnZvTzRRZXlRR3VhMzhVRXdUZnJo?=
 =?utf-8?B?Q0d1b0lid0d4cm5Bc21jdTY5QUxWY1c2czBnbkNMZkJCTFVCcmlzY1Fpc3FP?=
 =?utf-8?B?b0xUZUJ6N09wL0ZIOU9SQUUzQlpwM29ST2lLbnVFU2J3ZmQ2MzZtQ0wwSmxE?=
 =?utf-8?B?R3FjMXB0NjhXT1dWQzhLNTM0NC9HcCs3bkRVMWN4MkJ2YW5XUGhVK3VUbHUr?=
 =?utf-8?B?OXZNYU5sZDk4dUdNSXRWREdlUGxTR29zbFppVStxcUNFcTc1VDhsZnlJcjZN?=
 =?utf-8?B?QTVaSTZ4NTJna09EbzQzS3ZIZlk4NFA3a1IrdjRqck95Rnk0TnZxaXdxZzlN?=
 =?utf-8?B?N3diRi9WNzdUYlZGMmxwNkdMT3ozbmlZNTJlbFZZRXJFVThJNmZqNFpqMzZi?=
 =?utf-8?B?eVJFeCtDUk5jeHRhNlk4S09nQko4TnpwK1ZLVFp0Y3ZLcnFDMU1xUG8zcThB?=
 =?utf-8?Q?gJ8F3xZ6klThli5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f466a-f772-45e0-4a57-08da16f563c9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 11:14:02.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/r1oW/2/N0pp3ZQTgIxPauDwyfjziuXAA5SSW73Se8M1mM/OMBKOTfkHe6nmdpubRuPiJV+GNwp7hgixCZRzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB3087
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:50:00AM +0200, Jan Beulich wrote:
> Replace (mainly) MOV forms with shorter insns (or sequences thereof).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

