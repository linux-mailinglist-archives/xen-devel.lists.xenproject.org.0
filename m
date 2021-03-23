Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27082345BA6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100594.191824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx2-0000sO-LN; Tue, 23 Mar 2021 10:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100594.191824; Tue, 23 Mar 2021 10:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdx2-0000qf-EI; Tue, 23 Mar 2021 10:07:52 +0000
Received: by outflank-mailman (input) for mailman id 100594;
 Tue, 23 Mar 2021 10:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqu-0006c2-0R
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f16194ae-ec35-4ed3-b1a4-6f099349c7ba;
 Tue, 23 Mar 2021 10:01:15 +0000 (UTC)
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
X-Inumbo-ID: f16194ae-ec35-4ed3-b1a4-6f099349c7ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1EygkQFfjIgzk70hWDFj486ZCtXSbCWYNcvm9mmxDMs=;
  b=Ozf1uIghngk8r8/WQZzbn5RV8psjuMy/Pl1KGGqBZ3yWSIxtd45EDBPo
   2wZPcOpozEnsXs/+QR/df0Py6tj/Ln/eLgTwmbwTSrtYsq2J65XSPysIP
   wJ7rnLgkvrRzG1bt/XrH/8GM2neRigGXjOTuRaAW7ZQlKFLh18EIVKZFe
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NQY0My0O2GTCI50doOMF5gq8KBDD3yXc98SAgRgzFcAACwc6URUBy/b9tDkemfQ5W2d+Ca+UIo
 4g08jRE+YorRqj3rsgkYbw7anf9T2qXm2LqQhgRaEhK14eF5s+wWvtLDC1c0XhENjYwdzCW+eY
 0hsVRlT07bLd09UmCyuBi73CIKDudwdmN6OlbnSYj3Hlflj1cwChhvrRky8Z4c6WyYP9UVmdRA
 YYQ8Z0ePN72+k4NByzRgCQ8Q3qf66p4Dpw1iSARIfwBJedFty5yMDRt79FcZ82vGU0cxa4KE00
 PRU=
X-SBRS: 5.2
X-MesageID: 41330479
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:4LTdkah422CH3SSo7lssrytgqnBQXzxw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIzVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5e/bSDQBAAMq7xTLsCOw5NfBYmKl9zo9cxcK+7ct9m
 DZjxf0j5/Dj9iXwgLRvlWjlqh+t8DmzrJ4damxo+w0DhmptQqyfoRmXNS5zUEIicWi8kwjnt
 WJgzpIBbUK11rrcmu4oQTg1mDbuV5EgRKSqi778AjeiPf0WS4gDI55jZ9ZGyGplXYIhs1206
 5AwguixvxqJC7H9R6Ng+TgZlVBk0q5pmcaiugDj3BTept2Us4vkaUvuGxSC5sOByT89cQOF/
 RvFtjV4LJsfUqddG2xhBgj/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgOgShG0J+p4RQ4RNjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHE2ilke+33JwFoMWRPLAYxpo7n5
 rMFHlCs3QpRk7oAcqSmLVW7xH2RnmnVziF8LAR27FJ/pnHAJb7OyyKT14j1+G6pe8EP8HdU/
 GvfL1MBfvOKnbvBJZp0wXyV4I6EwhcbOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkPza0
 FzHgTbFYFl1ASGS3X4iB/eVzfGYUrk5699F6Dc4qw2wIgJPYtcjxgNhT2Cl4S2AAwHlpZzUF
 p1IbvhnK/+j3Kx53z042JgPQcYKUpJ/rP6UTdvqRURO035NZYP0u/vNlx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaAKWKVj3waoVqQVJcCkqi/5cPoE6lITqoOaehUL0HmBhZ1kQFlpC
 NocwkfXHLSETvolOGYlpAOPfrecNN9mQ+vBsZRpRvkxAGhjPBqYkFecy+lUMaRjwprYzZPnF
 V+/5USh6e6lS+1JXEyh/k5N1NweH2aaYg2fDitVcFxoPTGaQtwRWCFiXihhxY/dnHD2m8Sim
 biRBfkMc3jMx54gDR1w6zq+FR7eiGhZEp2cGl9qpA4P3/BoGxP3eiCYbeT32OdZkAZ+PwUNC
 jIbFIpU0RT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlyqM4+FmMg9bohp1acgEOqrlOAFUe
 iSIVDIaBz5Dv4kwAyTqDIOPjJupHwtjPPv31nE4QGDrQsCKMuXBG4jYbcRZ+y4xSzDYd2j1Z
 1il9I7veeqKAzKG5e74JCSSwQGEw/ZpG69cvohpp9Vt58jrbcbJeiobRL4kFV8mCgkJMj6lE
 kiUL12zbDINIhoZdETcUtijy4UveXKCEMqtwDsa9VOBm0Fvjv+P9mT5aDPpqdqKkqdpBHoMV
 33yVwXw971Gw+C36UdEaQ+PCB/b1U98m1r+Kene5fLAAunM8FF81zSCA72TJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ETohgRAS5g+hVqPcIeVGwKDGelB7ty8NxCtu8KRkbKOpQaybyC6ZUQejZ
 BCbmoKYK14+38fsLE=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="41330479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCuQPHeg6JqoE6NklkPVLu3VK6h41XTdKg4McfqMVdrErhRctf/D0kc1b+GewHJC21Dk6hOYiYQOL+79DGncRQ3HJ8RqZSrpSrQgFONVB8rs0T00QbE534Y0ioUDGyNtrb6LRGp1gc16Z+ypxFoUaWwaDlIZYyH4frd+UWYBt9ieuVabIwCe290qLwX6JxfwxAfjnKWoN51lfcGpO+XAoNV4hxBofioHG030kXQngI9jBkShmMhNvPVIkShAr7lpAbEAuCr6lwBwe/H/TKifI+ioatiQ1Ib/Uuh/hm2ZCHgGXVmvmvS7DFa8jgg8cPZxfPBsyLaWFuPfqhuQx+MT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MzCUu7d0phi773fHzIkL/rm9IU1nSr6FRF/o5rScJg=;
 b=TVKbzCYhenaWvFpc6PdNjtAnucSibiYuNFjy7C0cwUyXeBotZFY46LguerAXPD0NUMBVgOKl88EHaJ8qtTfJQ0dWEW9mlU41wW0QuMgm4Kr+eE38zQKdRUGwR9dG+fEwn1b9ncHohKkvSLbuSEFVBl1Ksmy/e+KmuaiGXJMkfwyWg1n2ho/7pHeHQxIDhBeIySMgD5aWohywOuluRc/gCq6cODICaweG5Q6YHpGq6m4iZaUPZZ18UMtnYmQVHsvDrhFE4QOR9dPz9x58724LD/k8RPpNJ1+i24iguuySzYVhzCYLCbdl1C2RmGcae7QVa/QDRqdLFAlfSr5wFs2m6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MzCUu7d0phi773fHzIkL/rm9IU1nSr6FRF/o5rScJg=;
 b=Xa9npiAV6uK6jTWtRpIqa1aONDIoaGhr4Tmap86YOfTz2m9g+SCbMzuhsQJh+idR4xkcZfZmzP/9Bm9T5snqqciDtdcLn6GWHlxlOI6KZFd7sZ5QD7S5e7ZUsuFgySHTQ77/Ahrt+SDBSM62a2smG3/Je2MBwA854zCdp3f7O7I=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 17/21] libs/guest: introduce helper set cpu topology in cpu policy
Date: Tue, 23 Mar 2021 10:58:45 +0100
Message-ID: <20210323095849.37858-18-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcdc9994-d0a8-4d2e-bed0-08d8ede296d1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4969BF1B8D0CED19D36AEA858F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OjpgtelieldLbBdROZTbEjfus8q7GciP81K5nh+0tGIUI2iyvhtqM67RkthUbUgxX0PG8+wiBwE4+mig5iGhdlCc3KQvH6f4X901XQhtdsPgciCOuHm6jMl059Ee5325cd6707Ci9OsAL+myvIefOQjgzrZqfeV6FCfbv4SLjOMD1rWxOYuwFXBoRExJOf1Csp02xSiUyiI7LjzSuDed4V74WUB0DVhU+5AUAi5YEefpjLz9l18RDEv+EE7lKpxeKc5mUZxOHHcYBcptr7nAoRnyDxMYsQ9dLIel/9p06qJ4JrIt+K/iup6TBmFIKmfS+C73Kn1mkYtDo7q1E4FY0jq1kS5/PUcFzlxTMJbIP6HgCkYHA3uzg9eme8ouqS8IES9ERekwkYvqqiDeG1CmRh++o681a8foKeXrljyIbS19gaMyDOTfBEEGD7siHESGT3QEdLncjgW17UNRgFjiNMPsz7wZYA4/bVSV/BmCjOcZCBdKIDkPmFsrz38P/flCGmyfP68+sN774xBtPtG+TPByTRILOLpm7cEC39KeuNqev031acuKTFFN/oF4CK57jtIoSZ3MpwTBcfV88DEDSsK++DZuw+X9oilM4v0MfAYGmd866WUCObvNZVfy9yoNZsWeufT3lEYKf75KgX9qZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHdYUFZWNmx3bERNVUVoSVl6YUU4QjFmVU1ZdXFWamR4WXdhdXM3L1BLM3F4?=
 =?utf-8?B?dW9FWXZhUGY4NXpKQ1BOdG1sdThCQXZUbkJKR0pHcDYxeXoySnUyNm1mbCtI?=
 =?utf-8?B?RXlkMllncEQ1T2ZCU3JyaER2TS9YSEVwSDF2YTlvSFN2bnRKZVJ2d2VHNkwx?=
 =?utf-8?B?Y1ZjbkFPTDFyNHozYzB1d1AvdS9kWWY0ZG11Zmh1T3I3Z1ZZblRHc0VXcHkz?=
 =?utf-8?B?WTZ5ZE0vUzVyVGhhOUN6TkhKV3NmbmRDSTlVOFNaK3ErckpTUkhhWU5ZR211?=
 =?utf-8?B?c3R5MFpLMEdNYTlWTlNtMENURkVmV2xsbk9IZlF1VzFuR0hCbDdreVJLQUE0?=
 =?utf-8?B?Z0xEVGFVcUhYSVQ2WWZxNW5FOW41WTdkeVRKMEt3cjVlM3U0WUYwOVQ0Tlo4?=
 =?utf-8?B?YWNLL0dCWEVHdm1QNXNtSW9qZ1lOM29jZkdxUmwyQzhhK2RMSjk0bjQvc2x2?=
 =?utf-8?B?UFhwcDVOQ0MwcGczUEF0c0ZLVGJYTCsrQVJuRXlnQ0JMYlVUbFFvYldkVnlN?=
 =?utf-8?B?NzU3bmdHSXlJYWdvNlhuR1J1QlhSdGpHY2NFcURabzhrZVFIMzZsNCttbXFm?=
 =?utf-8?B?SjBSM2RDMDBNdUV4QXJUSEpYa3Z1eWtYS1Mxd2JaYk5aRlZwaUZpekIwbzRR?=
 =?utf-8?B?bXBHb0R3UG01dGJ4TGJCOTBxVi96d1ZsS1E2TTFhUGdWVVcvUm5VVi9tK21X?=
 =?utf-8?B?L3dwMnBUUmpOK0FkNC9UUzY4dENETWtld2NQV3Ura3ZLSktKaVVSSytYUnpH?=
 =?utf-8?B?TFU5c3hJcDg1ZUdFSlJYMVhwL1AvM2V2MlU3enRDRzltS1k4Skh5dkV4K1BZ?=
 =?utf-8?B?bWhhbUdRZzV3QlNUeE5IZXFmeGVnb2xUQnVtVHE2Wjg3ejRFR0s0MXhPT25E?=
 =?utf-8?B?ZEp5cytWMTdpRGVPQzdCYk5NQUxhbVBrTUNSV21qWXo3VFd6QURXeEpCNytD?=
 =?utf-8?B?d3JFcGxSOWJZWnV0ajVwUktwdU4wbUdRRkNDNEFJMU8yUVJxSnVOa3IyUFNw?=
 =?utf-8?B?b05XdHBQaG5JOWRXbkIvU0lFOHBCTzdtQmZRSmp3b3U4bFNGVC9YZjlCRkRE?=
 =?utf-8?B?KzBUSzJuaTBaeXN4cFFtZTJjUFFxMGo1ZGNMVm1hZ2ZRYVQvSDhQUDI3MWVZ?=
 =?utf-8?B?QWhDeDJET2U0RFM3M0F6NGdxWmh1UFYveGhxYUFQN2hZT2ZEdVlpK1R6dnNI?=
 =?utf-8?B?NDM2L1FKM05sTVFiWHRjZjVrVGZrOUhzRDc4VjlNVnFuS1Urd2xmM2tUaUJS?=
 =?utf-8?B?RkNnSlRyOVB2b01wdy9FK2RzcXA1OURpaVVJbTVQZS9MTWhrdllIYmRsZk1Z?=
 =?utf-8?B?Q21rNVZUbmpYYjJZai9kUHlRNnlSeXB4cU9JeGFmUDM2d2hRc2ZCcFV3bkJs?=
 =?utf-8?B?WUYvWVpVcDhCZkxVWXN3Wkp3YytxbEVUV0hGVXFadHVISDc3aGlsN2F5aGs1?=
 =?utf-8?B?WVdPclhETVVtR3RReG96RDkvbUdPRmY2cU9EaXUwbWIwUXlwWjVRSG5XYlpn?=
 =?utf-8?B?UHo0aTRvTWpYTlFsS3pMcnc5WU0vVm5CVldMWnhGR0JiTmVad1ZGdzZ0SWpm?=
 =?utf-8?B?M1NBeVpXQjhaNGoxZm5OcnpVQlNST2lDU21ISFN6a2N6aEJPTGlYVFMwOUNF?=
 =?utf-8?B?d2xqaE1pdmZ5MlJWektvazlQL1paeDZ0RHV4cVk3ckdla1ZWY2dWS2VmMnZa?=
 =?utf-8?B?dDJ6MklLVmJYUWNoVGpWWFI2Wm9OUmFLQ0tmNlIrZURleEVpbFNubmlCcE9o?=
 =?utf-8?Q?Ek3SvCfBTvj2SyVnnlORYc+uVJUg7E3eaMFqOTV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdc9994-d0a8-4d2e-bed0-08d8ede296d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:12.2650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qr+n25OsKlMfAzUVif74wCKJoREMdwoeesqWrY+glNBwqpb+t02D+zE6kdo6mrL197HOyxSCmUj01XgzZ1DWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 181 +++++++++++++++++---------------
 2 files changed, 102 insertions(+), 83 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 6f7158156fa..9f94e61523e 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2631,6 +2631,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
+/* Setup the policy topology. */
+int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                           bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 2abaf400a2b..d50822c0abb 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -433,13 +433,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -462,22 +460,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -564,70 +546,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = p;
+    rc = xc_cpu_policy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -1257,3 +1179,96 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
+                           bool hvm)
+{
+    if ( !hvm )
+    {
+        xc_cpu_policy_t host;
+        int rc;
+
+        host = xc_cpu_policy_init();
+        if ( !host )
+        {
+            errno = ENOMEM;
+            return -1;
+        }
+
+        rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy");
+            xc_cpu_policy_destroy(host);
+            return rc;
+        }
+
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid->basic.htt = host->cpuid->basic.htt;
+        policy->cpuid->extd.cmp_legacy = host->cpuid->extd.cmp_legacy;
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid->basic.htt = true;
+        policy->cpuid->extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !(policy->cpuid->basic.lppp & 0x80) )
+            policy->cpuid->basic.lppp *= 2;
+
+        switch ( policy->cpuid->x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid->cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid->cache.raw)); ++i )
+            {
+                policy->cpuid->cache.subleaf[i].cores_per_package =
+                  (policy->cpuid->cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid->cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: I addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid->extd.nc < 0x7f )
+            {
+                if ( policy->cpuid->extd.apic_id_size != 0 &&
+                     policy->cpuid->extd.apic_id_size < 0x7 )
+                    policy->cpuid->extd.apic_id_size++;
+
+                policy->cpuid->extd.nc = (policy->cpuid->extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.30.1


