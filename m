Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0F365ADD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113760.216820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4N-0001AP-1U; Tue, 20 Apr 2021 14:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113760.216820; Tue, 20 Apr 2021 14:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr4M-00019Z-UP; Tue, 20 Apr 2021 14:09:38 +0000
Received: by outflank-mailman (input) for mailman id 113760;
 Tue, 20 Apr 2021 14:09:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr4L-00018c-CV
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa8880a2-c10a-48e9-9912-2d4ce3aef538;
 Tue, 20 Apr 2021 14:09:36 +0000 (UTC)
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
X-Inumbo-ID: fa8880a2-c10a-48e9-9912-2d4ce3aef538
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=d9eNGlxbpZj4dvsAgZL3dz33aHlsUcCZjL2r8PLyJfA=;
  b=AJ9eXkfTA3lgXWB+UvZPYfSSwayMN8lPIwW0Yl1ofwiu8wN8opfV9t1Q
   ptr6iimcwtdSgPQJ7kTbFhXwF2RZXF5E1LaViLvq5qVU5+sgmoZMf9eos
   O00zfOwuBxbApB9HtBxT/Ydgz5dYo+GCpzsst9gOIdwBtQs1JfVgGkodG
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YcNpxn66rI5n6ipxBlSKJWsGAeHcoyOZ2njU+wNodx3vMrVqQinO/t+lAfHuZC7/GVr4JAaPgQ
 cNgtjEGvM/Ut8t5dtN3gndsKBGIEuy4NrOMgbr/qFus42P47UjrkBbcdGSm1depn8CkUVmI7e0
 sVxShpQibMSymDA5/nVORwkjCH8j6UoPLcm8mXiIFxKadeUtQpLqKPSwd1vm7RPk1uzSUjgxmO
 gW2sjNvKDwuy72ZMDRj8tyxt24Gz5Cxs11vfbOHXhFWabWrOXXg6Qhd4rkhyUDBnOw0n9FA7Ft
 +DQ=
X-SBRS: 5.2
X-MesageID: 42368680
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:6LMseKy1ofbJmcVjq4O5KrPxqe4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf+LmRdQg5aCZ0lUK
 eG7s1cqDa6PVgRZMK3Bn4KNtKz2+HjvpTgfBIAGlob+BCD5AnYlYLSPjq5+lMlUz1Jyao/6m
 StqWLEz4iqrv3T8G6760b99JJT8eGRqOdrJMvJscQNLyWptwDAXvUbZ5SnnBQY5N6i80wrlt
 6kmWZRA+1W52nKdm+45TvBsjOQqQoG0HPpxV+GjXaLm6WQL1hbeqkx975xSRfX51Etu9txys
 twrhiknqFaEA/am2DF78XIPisa53acm2YokuIYkhVkIOwjQYJWxLZvmX99IdMrGSL3750fC+
 9+DM3Qz+Y+SyLlU1np+kZo29CiRXI1A1OvRVUDoNWc13xskGl+1FZw/r1Sol4wsLYGD7VU7e
 XNNapl0JlIU88tdKp4QMMMW9G+BGDhSQ/FWVjibmjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyU1iGM7zP4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqbpekFCMGzYY
 fzBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH32UpMbmLZDrq/z7fP7fKKGFK0dnZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjubJ8eZKqutQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffCmqO/rm+mwHbQ4wxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCARNjUcXMEk
 p6q05s8ay6a7ycrBpSRe6PAya/tT8+tXiKR5ATlumo/sH+YK41CZ4gRehWDgXEFxt8nC5ws2
 ddYAo4RkvSfwmeypmNvdgxPqXyZtN8iACkLYp/snTEr3iRoskpWz8mRTK0aNWWhgwvXjJQoV
 V0/8Yk8f29sAfqDVF6rPUzMVVKZmjSJL5dFgyKaL9Zna3RdBhqQX2HgiGbjB8PanPnnn9i9V
 DJHGmxQ7XmE1BdsndX3uLR/FR4en60UmhwZnp52LcNXljuizJW66umd6Cz22yeZh8+2ekbKi
 jCeiZXCBhp3cqL2BmcnyuiGX0qyo41BPHUCK0uftjoqzWQAbzNsZtDM+5f/Z5jOtyrj/QCVv
 iHfRSJaBz/EOEk1mWu1wAYERgxjENht/zm2BfotjflmFE+BOffO1RgSfUwJcqG423tWvaP19
 FYgLsOzJ+NG1S0TuTD76fdKwNnAFf0h0WdSukzs5Bava4ortJIbtHmeAqN8EsC5Qk0Kcf/qV
 gXT6t66o3QI4MHRb1mRwtpun4S0OmVJEQlsgbKEvYzUFEkgXjcJc6I6dPz2M0SK3zEgAPxPF
 WFmhcth8vtbm+m1bQADbg3LnkTQE8g6G569OfqTfybNCyaM8VC9kG9KHmzbft0T7WEA6wZql
 Jf78uTl+GaMwr+1wa4h0o3Hot+t0KmS9i1GgSCBKph9MG7I02Fhu+S2/GI5Q2HAAeTWgA/no
 1KdUsZc8RFhH0DteQMo1ePY52yhFkknVtY6SxgjXj31OGdkT7mIX0=
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="42368680"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf8QqkI3NF3x9Si+1E9bN2tKcTOwYP5SrbBTvOBSAXjOGMxd6mKsd7/4+IT3OnCvf9ybF1n/19c/bs8ZV5lsg+GdTa4lSiKPwLPQXUdn3LR1DlAcokRNIm8BlpE+g5bOqkNT0oS1eRuKB9aT2aXuHpC9Tl35CEFPmuzox0O2cOpEvKfH5y5MCEvaO8lilNvnJoWKZ/rCJZx8HxPCGP6TZkYSoP3IsPjkzNFqDjSm74l+/6k0j8gn91fYrhMlF2NlNc7WehVM5W7lUZtDq1b+6ArxARI2KoCOr2EoYE2XQZ+T29QBi727smeg3744XXpstKjiIAj/4vXakq4V5iU2zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LDC2BNSgnovQYjkqYHd80+wCvWWCbTTsmR77iMhVkU=;
 b=m3OaoOD40xsbQJsfzwIi+COsnP4PCBBlTz+vfq7Q33yd4C9DPJ882ZrCuGj72bsw1uoJv+l9QtGmq9yTC3jjAStBiYqsNpLDXXoZG3Sof2a/ulXYpK7jm0bMmQ0ytU1nDU97Kks1DZhdhYd5hAjp0SxHBojFFuN8ysuyLfgaIqbGZ/zRP42Slfjing6ZWB/8yPYrl2b9T7muZy1TWLjzzFYfgUv8ec3hEqIfR4YY/HHNKSo5TYoj0bpoOY6vR9l3biPJSarNUU5jTa+SwYUoZgm/ywxiyGWG8sLHDkZfQUumOciVWYNnYXrBMy41iMVmZVT5L8MEt4IkySfFGJB96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LDC2BNSgnovQYjkqYHd80+wCvWWCbTTsmR77iMhVkU=;
 b=su2x3RlkaoacSzdXOx9xEFKk+lH6aSYaJfJExaJ/DETbHIcpJ9ziRt0GWJPdgXottj9+T5bjDQ8iy//AHuD1Mabr3B9TvS5uESeVCySPeOHZ1qIGgSp4dpyH/6gCuCfqquedScxmabZyN8/A/0P00KUWV6SEttQqaOTkxgmW/74=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v4 07/12] x86/dpci: switch to use a GSI EOI callback
Date: Tue, 20 Apr 2021 16:07:18 +0200
Message-ID: <20210420140723.65321-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e8c01a7-2d04-4cb1-bcd4-08d90405ec2c
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000D53CE4B813236526AE5F8F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTHa6dtomBoqdQQgHKgYQ1XPOPRbjDiC15HFubPFpGP7xie/FOEZQ3jXeMgWD0JHDOUG8f1NSJEi+q8S7Qam7ojZNSJCskxPFQYMofyY4nd6TCbVW2g2LpT1Mg0LFZ40zqLOmkZHSdDmsL0LiEjRwS/dRkmuQQdy85fJAC2mpQbRiVc5qaT3MPe6B23y9qZDVWpoe/L8cd1+ECbXuKTnAotXPKaRsEhXqbxuxUaYTkPjmyuWpD/k95NrgPRymQUiiXbM0s4c3nNNZZzM8ru0J1omoRfaMqgihJucNpYQADhZV9Rgj0kYGipE4X0rT7TCt0/dt7fRWhNg/HuEHhJkTO92eQ3/y09FJXzBDKMtgWFstTbKedGootJus8UfcAaOZY0nTXs3R6jFnzV4jA6OLLCi+di9NYj/zH9vdXChoptV+/H9dg1PeA4Nk5ukLMzgTspmtZt68v/ccVRj6u2+wjQ4EPpZOVlqwgGBQY+4HKRDpRq0VzrRk6nYLklTKVxRo6VnLRrU6dYa8llM9Th6tLHPJSbs8Wgs/CVEXY37PFv915I5amvplkCEXCXEsjdyCh4wlXTiLGQYoaYt41BQCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T05peXVKRXk3STIyQ3VBUGNwN1ZmUUJLSnhvRmNMaWNOaDc1TEs2b2tOWVhp?=
 =?utf-8?B?WDd3cmtNQzRBUWRvVmFrcGZwMHd0djhtbmJNdmJJNFNDc2pneDMwTFMyd2VC?=
 =?utf-8?B?aTRXTGVPaW1HM2FKVEZyaEpraFVDaDBZaWg2VlRVUnd6WjBtUkRmM0E2cW9K?=
 =?utf-8?B?WWoxVFlzSjhQMW9xbVBSeGFxT21qRFF0eE94aWRzN09BZGc4T3dESFRlcC9m?=
 =?utf-8?B?Y1FhYU8zTjFEZHRnaVB0Uk92NmtqNXkwNjduWnlpNWI5NUNtUitUT1NOc3Jx?=
 =?utf-8?B?RDNQUktDNzM1dU5iRmVvQzMzdHA4dFZIVU80bURsTjJMTE9NZXlDMlV2WTJw?=
 =?utf-8?B?K0dGYjY1SjdTTDFIU1dKNTRISjJGWkVMOUE3RmhLK3ZGTXd6TUx0VmloUEp4?=
 =?utf-8?B?NXY5WEpqcTJ0WEE1ek5nVVpzRncyM05UeXBWMWNUMTBIY3JkRmRmVStHcEFF?=
 =?utf-8?B?SHUxTWltU0ZMck9ESWc4QkJxTDBHS3hpNkhzOExzdFUyNU95Q056bVBtRzhZ?=
 =?utf-8?B?ODRicFlRekxtUVlJRjk3QWFXc3l6bmVLVnprbmFKRHNKdFZWUkExaFVMYnVh?=
 =?utf-8?B?RURPTXNCSldHcHZzZHdCaGdmd1o3dnFzQUx1emlXMTlJRTJaZjA4c29WYVVI?=
 =?utf-8?B?eUVjZHBtdkk5MXB1czNBYkppdU9DMkNnbU9zWkVqOEM2Mzhzc0ZobFpFS3BU?=
 =?utf-8?B?b0dSUktUTTRkenFsQTdNZ3FmajJiR1B3ZDJGeENLL0VPczg4emdzQzhtN3RP?=
 =?utf-8?B?UkJGOXdDYURBdGNJS0hnd2xDdXNaN1JhQlQrb3JHbDZ0ZmJzT2ZTNThkald3?=
 =?utf-8?B?aW5sWWllbUpLSUlyZm9zNDJSK0xtNFlsWlE1cjZUY25wYlFSZGRydlhBaWhZ?=
 =?utf-8?B?NnM3SVBHMWQ2QnFNREUvVTVkWi9kL1B5a1pMNVoyVW9ZTC9jMmo3Yi9yMFQ0?=
 =?utf-8?B?QXI5TEpNblMyU3JQS0J0Y1YrWExteEhJbkFaVGlqdVpuQjNHOWVJS0IyaVFx?=
 =?utf-8?B?TVhzejZ2VnJmT3Z5allvRDJ2SEsrSjBKMG1zWk9jSHRCbllPbUtxTzB1ZTNl?=
 =?utf-8?B?QXpOS0VSQUF6SGJXWTZsRVRNb0syWnpJQ2FEdTVIcml1YWd5cXVleisvM1BM?=
 =?utf-8?B?WjN5aEVSQW9VRjF2Ti8vaWFCUjRUQXIxNXpka01YZjRUcmVVRG1yc1hMUWl5?=
 =?utf-8?B?bHlHcTVpZUVaaCtaZDBFekZ0SmFFR2pVZnFsZXZ0eWViaUxrSTdnQ3ZZZlFz?=
 =?utf-8?B?cDBLTG5kY2VEZmhER0pjNVI3dG14MUs1U0duQlhyeXhpa1lKTFcrU1RUcTBK?=
 =?utf-8?B?Ni9rK0dzRkZLVVRkeE1XS2gzMURIaDZISjJnemw0VG15dHFqMUNxcWVSQ21E?=
 =?utf-8?B?QlR5WWprellvSTFzSXpoc0lFek5zdWdyd3VlK2lGeTRjcG9ROFUrWlczRmtJ?=
 =?utf-8?B?blpwc3BaTkdnc1JBRXRXNGN2RnRsZ1V6cjhqMVVvWXhTSDVZckthSmZ6b0Yr?=
 =?utf-8?B?M1FIOS9VYkl0N2hvcDhrTC9QVzRnMDBWdDZLdEhrbis0TzhOUGc0aUIzUzdj?=
 =?utf-8?B?Q0ErMVEwbGVSUGlDLzZGLzZtc0EwV21PMkVzZlpWc0xHM0J6SXZ2dDZ2a1BN?=
 =?utf-8?B?SnVaZEFObFZMQVZtbzBhVGlkc29JK2I5UGMxUW9DcWx5b3BvQzZGZHIreHZO?=
 =?utf-8?B?T3YycHhtV1ovaGlqakt2U0hhTkxJNEpIcThKL2VBZi90K1k2eGUxV1ZRdWNv?=
 =?utf-8?Q?bQfvgEZhpPUbwuF01HtG3Lj4S1SvbFmY4Ms+4+C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8c01a7-2d04-4cb1-bcd4-08d90405ec2c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:33.4513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLaRwYHRF6Rve7G854DwtKixVif0F5nsK5ReHM39XHhVepgRqDqPP3/Yui7ppyeu4Yai1i7qa1DdnNM0dP+KNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Switch the dpci GSI EOI callback hooks to use the newly introduced
generic callback functionality, and remove the custom dpci calls found
on the vPIC and vIO-APIC implementations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Print a warning message if the EOI callback cannot be unregistered.

Changes since v2:
 - Avoid leaking the allocated callback on error paths of
   pt_irq_create_bind.

Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        |  8 -----
 xen/arch/x86/hvm/vpic.c           |  4 ---
 xen/drivers/passthrough/x86/hvm.c | 57 ++++++++++++++++++++++++++++---
 xen/include/asm-x86/hvm/io.h      |  1 -
 xen/include/asm-x86/hvm/irq.h     |  1 +
 5 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 0824ede91ab..4f844965423 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -284,7 +284,6 @@ static void vioapic_write_redirent(
              */
             ASSERT(prev_level);
             ASSERT(!top_word);
-            hvm_dpci_eoi(d, gsi);
             hvm_gsi_execute_callbacks(d, gsi);
     }
 
@@ -418,13 +417,6 @@ static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
 
             ent->fields.remote_irr = 0;
 
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(d, gsi);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
             /*
              * Callbacks don't expect to be executed with any lock held, so
              * drop the lock that protects the vIO-APIC fields from changing.
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index ef668f3668a..60d6740f69a 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -237,8 +237,6 @@ static void vpic_ioport_write(
                 ASSERT(pin < 8);
                 hvm_gsi_execute_callbacks(current->domain,
                         hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 __clear_bit(pin, &pending);
             }
             return;
@@ -289,8 +287,6 @@ static void vpic_ioport_write(
                 vpic_unlock(vpic);
                 hvm_gsi_execute_callbacks(current->domain,
                         hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
-                hvm_dpci_eoi(current->domain,
-                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
                 return; /* bail immediately */
             case 6: /* Set Priority                */
                 vpic->priority_add = (val + 1) & 7;
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 0db26e5dbb2..02e027cff8c 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -252,7 +252,7 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
     hvm_pirq_eoi(pirq);
 }
 
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi)
+static void dpci_eoi(struct domain *d, unsigned int guest_gsi, void *data)
 {
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
@@ -476,6 +476,7 @@ int pt_irq_create_bind(
     {
         struct dev_intx_gsi_link *digl = NULL;
         struct hvm_girq_dpci_mapping *girq = NULL;
+        struct hvm_gsi_eoi_callback *cb = NULL;
         unsigned int guest_gsi;
 
         /*
@@ -489,7 +490,7 @@ int pt_irq_create_bind(
             unsigned int link;
 
             digl = xmalloc(struct dev_intx_gsi_link);
-            girq = xmalloc(struct hvm_girq_dpci_mapping);
+            girq = xzalloc(struct hvm_girq_dpci_mapping);
 
             if ( !digl || !girq )
             {
@@ -502,11 +503,22 @@ int pt_irq_create_bind(
             girq->bus = digl->bus = pt_irq_bind->u.pci.bus;
             girq->device = digl->device = pt_irq_bind->u.pci.device;
             girq->intx = digl->intx = pt_irq_bind->u.pci.intx;
-            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+            girq->cb.callback = dpci_eoi;
 
             guest_gsi = hvm_pci_intx_gsi(digl->device, digl->intx);
             link = hvm_pci_intx_link(digl->device, digl->intx);
 
+            rc = hvm_gsi_register_callback(d, guest_gsi, &girq->cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(girq);
+                xfree(digl);
+                return rc;
+            }
+
+            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+
             hvm_irq_dpci->link_cnt[link]++;
 
             girq->machine_gsi = pirq;
@@ -514,17 +526,43 @@ int pt_irq_create_bind(
         }
         else
         {
+            /*
+             * NB: the callback structure allocated below will never be freed
+             * once setup because it's used by the hardware domain and will
+             * never be unregistered.
+             */
+            cb = xzalloc(struct hvm_gsi_eoi_callback);
+
             ASSERT(is_hardware_domain(d));
 
+            if ( !cb )
+            {
+                spin_unlock(&d->event_lock);
+                return -ENOMEM;
+            }
+
             /* MSI_TRANSLATE is not supported for the hardware domain. */
             if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
                  pirq >= hvm_domain_irq(d)->nr_gsis )
             {
                 spin_unlock(&d->event_lock);
-
+                xfree(cb);
                 return -EINVAL;
             }
             guest_gsi = pirq;
+
+            cb->callback = dpci_eoi;
+            /*
+             * IRQ binds created for the hardware domain are never destroyed,
+             * so it's fine to not keep a reference to cb here.
+             */
+            rc = hvm_gsi_register_callback(d, guest_gsi, cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(cb);
+                return rc;
+            }
         }
 
         /* Bind the same mirq once in the same domain */
@@ -596,12 +634,17 @@ int pt_irq_create_bind(
                     list_del(&digl->list);
                     link = hvm_pci_intx_link(digl->device, digl->intx);
                     hvm_irq_dpci->link_cnt[link]--;
+                    hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
                 }
+                else
+                    hvm_gsi_unregister_callback(d, guest_gsi, cb);
+
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
                 spin_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
+                xfree(cb);
                 return rc;
             }
         }
@@ -699,6 +742,7 @@ int pt_irq_destroy_bind(
         unsigned int link = hvm_pci_intx_link(device, intx);
         struct hvm_girq_dpci_mapping *girq;
         struct dev_intx_gsi_link *digl, *tmp;
+        int rc;
 
         list_for_each_entry ( girq, &hvm_irq_dpci->girq[guest_gsi], list )
         {
@@ -708,6 +752,11 @@ int pt_irq_destroy_bind(
                  girq->machine_gsi == machine_gsi )
             {
                 list_del(&girq->list);
+                rc = hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
+                if ( rc )
+                    printk(XENLOG_G_WARNING
+                           "%pd: unable to remove callback for GSI %u: %d\n",
+                           d, guest_gsi, rc);
                 xfree(girq);
                 girq = NULL;
                 break;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 7f30dfa7fea..977a857f729 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -101,7 +101,6 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(struct domain *d, unsigned int guest_irq);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index 37b8d2ba8fb..57d51c15863 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -156,6 +156,7 @@ struct hvm_girq_dpci_mapping {
     uint8_t device;
     uint8_t intx;
     uint8_t machine_gsi;
+    struct hvm_gsi_eoi_callback cb;
 };
 
 #define NR_ISAIRQS  16
-- 
2.30.1


