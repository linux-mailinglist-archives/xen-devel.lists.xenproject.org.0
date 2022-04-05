Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639904F2A6F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 12:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298708.508955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgqh-0001qs-Pp; Tue, 05 Apr 2022 10:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298708.508955; Tue, 05 Apr 2022 10:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgqh-0001oB-Mg; Tue, 05 Apr 2022 10:55:47 +0000
Received: by outflank-mailman (input) for mailman id 298708;
 Tue, 05 Apr 2022 10:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbgqg-0001o5-7e
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 10:55:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff13833-b4ce-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 12:55:44 +0200 (CEST)
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
X-Inumbo-ID: eff13833-b4ce-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649156145;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=osuE/2UWk7uy4b4MZFYdCdsPhluXC8Hl2yKsgwWPmu4=;
  b=XvLpLiBDs96KixxOYqE8MBkrUwjEU/0wuma48pUk9TVkMs4SV80YgIZe
   Nug1m9p8enTu3yHsKqC7FxkX0cXcxiQQpcvxpQrk5a8RCkZg6EvALKuSj
   JhhH7e8mXEJ33MY3I6ux1ImWTST0AhW+4c/6f3Y4gcW0oIR86BJNU5LhA
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67927762
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QkVS+qLmyY2o5KrIFE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENS0TYHn
 TRODGvTOvnfYGujfI1/bIzj8BsFu5SGzNBmQVBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PJ8iKebTzkYB4fzt+cfcSJmMxxaM6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv15oRQqiED
 yYfQR03NgTYJERdBnwWDJxngOb2oEjWaBQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsmS8hYPFWLdwDwj6iyaj22Di5O0wKQWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4iDGJGT9bxgbQ+0RqmBNzEJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdEIumkieRsybppsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEwFCrChO3WJqub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:GK/+8KtzxV/KfBlFDrmd8TU+7skClIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzE4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl5Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbprmGuhHjHkV1RUsZyRtixZJGbEfqFCgL3Z79FupgE286NCr/Zv3Evp9/oGOu15Dq
 r/Q+FVfYp1P7wrhJJGdZc8qPSMex7wqDL3QRSvyAfcZeg600ykke+D3Fxy3pDvRKA1
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="67927762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC+mANj41rSIRUBbstUWvk00pS5Af0194yCJ5JFOlAByuPErmiEo73lIiKJp6RjVmz5Ho5ug+lvg2EjPMQ4p6szdC+/cH6UJmNIV01Bji0A1eHoupC5xF1hnSLohPbiE/dzD4y1fF69MDtQzfYeH9whNZul1iDrMc6cs6ivm6NrEMrEZboxokKoQZJ58eoj/SWlg8Q+iOJzQP8UY0Q0V+7GtQsoPOMoQn/AMBl+D6ak+m1L/bCC9zKah9BBCI83J2ObLthtq86ZYFGt/xS2dwjnG7U8Uz1in3Jowau4J4sipxBeC2Bc3F5qGj4DLbiCBOWprrhtbrXGLn0zop9szEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpcMlgXt9uETUbTXiiy8yCcUIx2/8PJOAvU3PGaRG0w=;
 b=ApbqOqxFG0nlDFlu3CLQSiJIH6Ndi9ihzn3aIQ6OF9ZUq6LbYx0y6eYORqtCCynht50kQtVUy1Sey6mDNxX9HybfuV7JaWJwO+7AVLOdFHnRJYjqN21PG/dDp4OW7Z+04qFSdrTzUosrvn7C09PNpB1PkDE7IfhwudOZgdnhxE9bA0NomXPTCw2p8GjOnSvI/xkUO3WwGm2zekcsCPdLUgs8RGmVYaArtmexiqHtJR6829wUtmrjEZ6k39qX+42i5sCcr7uVJS9WK65m6fVnd3oT3CxAAvBIUtyph+cMRxzVxkF44JUeYzj56FHovLaLDkN1EECdT1POwUh3GJKt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpcMlgXt9uETUbTXiiy8yCcUIx2/8PJOAvU3PGaRG0w=;
 b=FkcH9dJ1o0uxAK9UOwDStHcuy0nWmhpjc5B09JnlxftfnlQ6Jw0A4B427GUoFKAKJUNF+Azx1oF7HOdnjoQiJIQkGI8REnBf4ONuJgU8NB5dP+UAwGNtQ9Q137d+ANU7i0DYCNJFqAbHu+yOY01plcXQ8uUsA4kjdf5nfsJUvUw=
Date: Tue, 5 Apr 2022 12:55:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 5/8] x86/boot: fold branches in video handling code
Message-ID: <YkwgJ4lsXPhfWZG5@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <5e4ee27b-4904-b2bc-1650-df148b47387f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e4ee27b-4904-b2bc-1650-df148b47387f@suse.com>
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f4d82a4-6e6f-417d-9e43-08da16f2d286
X-MS-TrafficTypeDiagnostic: MN2PR03MB5149:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5149234671D06869643FFA258FE49@MN2PR03MB5149.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nkjx8cpRg7L+qKnaQloE/uMOv28ovre5KLOjk5P4kdyV+Iv/KU0aBPMUXuOWyJcNCYUYoadotLIrbpU0uTrlzk5tsUs30CYvfXl7T1NIDhOYOnjsB0fGnwhvA14zK6jbwhK3QSe15aYtCwEoJaf29vIGoJvaHnVvQ1l04usldizQVpwJziCR3EaBLXJ0lMae9VExeJS+hzioj1IwGZmRqoWgV0KXxx2ZCs22isu/myoAHlky1jif6UhHubZqPCR5GHYp4q0RH9ki5elvTM3q+Orml2UApga92VU2aj14+WDJEJWhRl11YpC3A9Xgkn5QAVMmnZVu24IQ1G507eIzfv4gKZvZcm9HtMbMdjzfzoSY9W7F0V5May+z1072eRgZyHlxWPS4JOHSwFVp2Eg9ZrKx7Vk1HANaYnXzovS46TJ62x2B5zVIyGqP28cv4BUoB3xw1X8UYFXnQkBGRRBL9XYiFvH1RwaYyYxEK8WR1PvwMwHBpsI8X6YNl9zBDddj755R51yrTfaUbhdM+Om5UufILF1K2igBcaiLJHgxpUEwloCQAx0zbjumbYwYUWmpY+w6FbT/68ixv3tu1DDgLAHuKnGPqDK21AIwE7Axkn6bk12X/0i6JTY8g0HWkSnSs0qbv8+HxrC6hgzkf8NwOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(83380400001)(8936002)(85182001)(316002)(54906003)(86362001)(33716001)(6506007)(82960400001)(8676002)(4744005)(66556008)(66946007)(66476007)(6916009)(4326008)(38100700002)(2906002)(6486002)(508600001)(186003)(9686003)(6512007)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW8yejRlaGx5VThlemJuaGQ1WllVM3kzZ2U1V0tiWDFmL3ZMSzc4bHVEeXph?=
 =?utf-8?B?ak9ITzR5K2lSSTNHd0k3QXFOR3hjdlFwcW5XMTJHMXNJRXBwOWxQZVJIQkZx?=
 =?utf-8?B?L0lzblJGZmZwUG91L1QrUERXekI4djl5S1RqT25ZdmY2a0crcEt0NzNQTlBH?=
 =?utf-8?B?aDhGOGtEWTZrdlpiZGQrM1pBeTVxRC9idjV5b3hVL1FjWC9LZVhqVlJHalU0?=
 =?utf-8?B?eUErRlNlNFk5c0FGRFJmRUhxQ2s4R3pNRHBCdkFVUlpCNGhEQW15cmxDemFB?=
 =?utf-8?B?Wm5sVE5OYmdWT2dPUmlMOE9qMUZwemVGRHYyZkNjTzEvdTM2SjNtVE1ocWQ1?=
 =?utf-8?B?aHVHaTUrYnhWQmRRZS8wTTJMa3M0VW1LeXVybTZLdlR0OGVyZzR6RFFyV29W?=
 =?utf-8?B?SG83YjVzSzFKNHdBMkVGSC9Jd0NLZ0dESGlIWFZNeWJPbEVNME1qUEtsSDlJ?=
 =?utf-8?B?Y1RjQUlYYUMvNW9VU2lNN0tTTW5mWGsycnpBL3BrQXdHWEFGUzE5Q1ZhUnQx?=
 =?utf-8?B?a0hZcDVvUDVPeG5MUzFMbUxZWDRvSmZQWXA5djJwQmRLV0J5eWU2YTJ5TmlR?=
 =?utf-8?B?c3YyMzZ0ZHF2Ymg5eEsyY1Y2dXFoSFZRWUI1NHk2d2VoYm9pSVBlaWlxamJU?=
 =?utf-8?B?VFlUSDVSZ2pBUThXN1NocnVYeVVldlkvK3Z5NDRyRElVcXFaTnNFb0V5QnJE?=
 =?utf-8?B?aHo5cllRVnNJTmYvdkw3cWR6NHdGTWhXWElqazdVOVpWOEphSDhvUUlpWHRW?=
 =?utf-8?B?RnpFR201N1hCQ0gwNXJRdVMwZU1YMVdyNE5uMWVqUnJGbmdMd2RaR1hSRHlJ?=
 =?utf-8?B?ZUVJZUlvT0dPdTkxWVI5RDhOdjl1KzNxb085Y2FIUWtyUm5hVEFaNGxsb0N0?=
 =?utf-8?B?OEd5TGp6WGozeVk4Sy9SZDcvNzEvZG1yeXFEc3MrZ2gyOVRuVFpXVmR3QkNi?=
 =?utf-8?B?TXlacXFzeGhKeFRUQVdyS0hCTnBZQVh5aFVWNDFxeThIZnUyYnJYT0EyQjIv?=
 =?utf-8?B?UEc2azcvQ1hRUU90L0d0K25KMzNjQlpsdTlWY2Q3WVgyTDY4OENpYnhPWktp?=
 =?utf-8?B?VFNPYjBKS0tIeVpVK1FxVEMwRGloQXFVZ2tOZVJ0UDN6MkVCdzA3RWxKNE0y?=
 =?utf-8?B?d1ZRVUkwSThVWFI3YTdQcWVRc0l5bGlCeHlKNTdpVEFVdU4yYkdScXBwOTBB?=
 =?utf-8?B?QXhUZXBpakpTbVllODZKSFhwdTBLUnphVnhIRXVmbS8yei9EYTFYa2FDVGEy?=
 =?utf-8?B?Qk5aUEh4WWdtMmRYL1l6NTVHdUU5QXZ2VFp1YWpRcWRXSzVLUTVLdDhjOHlw?=
 =?utf-8?B?YmdjSElHbktRdERCL0lBcGFQMk5ESmpSbCtLeDdwRituUUVvd0pkWU1ZWVBP?=
 =?utf-8?B?RnliUElYWDg5NjY2cjM5OXA0b0ZNZjRhZHRpTGVySDhuWnAyaEdKTjhvRnRB?=
 =?utf-8?B?RXQwemNlNlpjVU0rOHlaNVp4bUFFS21Wb0R1dGdZS1VtTUtNLzVkUGYvUzc1?=
 =?utf-8?B?UjNjM2xqaXZmVWQrNDc5V0ZDRVg2U05kTVNPWjlJMFFDU2J2U1NEcGErd1Vn?=
 =?utf-8?B?R1JoSEZkUGlmcW4yT1BpV1JYMmxDN1Y4NzVFZDdGSnJyM1oyMElaeGZITFVY?=
 =?utf-8?B?RldFRGExT3NINTluYzlkb1hIV21MR243TVZSNktmanptdkNMOVBCMyt0dDVG?=
 =?utf-8?B?UWpwMEV1bzdSYldUN213WHNVU1pnR3FIZXhnR3l0M0g4LzRWZDR1M1hJZ0hG?=
 =?utf-8?B?UEVPMElzSmtFN0Fsb0ZaMmVkK1N2V0ovWXVDcXU5cFMybU9JaHRZdFRIK1dZ?=
 =?utf-8?B?VThDMUNYMjZmSWsxL1gzaGgwSjY3N3UrL0JoUDExa0xhVkhsbUt6Q2JacGZa?=
 =?utf-8?B?NTZlK0I0aDgyU0dmQ3dpdzZkM2dvU3h6SXlNSzVVUkJhS1Jodnl2MWJxVjY0?=
 =?utf-8?B?bHd5K1ZTZkJBaSthajFXZE1FSFFZWWhYa1I3Z1pMRUtjWjFIdVNIbmZWNVI0?=
 =?utf-8?B?Zi93L0pYMktUbTU3bzBDOVFWbXRZYk12ZjdTWCtvV3RlZnFTOUYybFlnZGlD?=
 =?utf-8?B?c2NEdDNQcFpndHNPNkQrenNvQ3lQRVVVWnl4WE1neU5zL1NhZ1NERHNSRS9j?=
 =?utf-8?B?dWVGL25hM0FPcFZZSHE0eHd5OWtNMnUwQ2l4c2MweVBJVVlYaFVUYURBZVdW?=
 =?utf-8?B?b1RSKzA0THNTVUd5QlFVWUU0ZDhXK1hnZGdFdjZHVXJkdVlzbWY0eUNYKzN1?=
 =?utf-8?B?L01NbVd1UkF3a0FhM29LblNac2ZsWld0dlExbUxkdjZwUmZUUStlT0ZZaXAw?=
 =?utf-8?B?dC9WOHV4Q29ITFRaTGVZV09ad3FKUUVTamVZc2pIMHlLbXNtMjc1cWhOdjhp?=
 =?utf-8?Q?fA9bWuy7K5iYHSLc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4d82a4-6e6f-417d-9e43-08da16f2d286
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 10:55:39.7062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qq0bjamSJPzxp+kOBgZVsa6q8AzaYF413y84PHVnniH50nomBn1XLhkFPWjYW6j0bOp1ZwEI3Y8GR4EHAA6aHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5149
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:49:24AM +0200, Jan Beulich wrote:
> Using Jcc to branch around a JMP is necessary only in pre-386 code,
> where Jcc is limited to disp8. Use the opposite Jcc directly in two
> places. Since it's adjacent, also convert an ORB to TESTB.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

