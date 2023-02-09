Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B3690D06
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:33:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492618.762250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8un-0000ct-Fq; Thu, 09 Feb 2023 15:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492618.762250; Thu, 09 Feb 2023 15:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ8un-0000ap-Cp; Thu, 09 Feb 2023 15:32:49 +0000
Received: by outflank-mailman (input) for mailman id 492618;
 Thu, 09 Feb 2023 15:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ8ul-0000af-KD
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:32:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 002a6dfb-a88f-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:32:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8274.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 15:32:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 15:32:44 +0000
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
X-Inumbo-ID: 002a6dfb-a88f-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAnyfNRi+ll36KzYeGyd6Dw++S0NlrJ9sMxHsWBpeFUYfkU9qFSXEa9a3M4NrVBCmK+vQJANqXyng/yfGi6gso7L3OwPiH2z1ilbYqYXLAR056xEVxg5qm4HOhtVYWWlkRKnebvMpiQ5cjA9lwFAOWdKjhN7x3TxvNRsLZCI6pZpmWHRw6kec+R97jC2soRVvcTWaLebgDntpvP27blC+TqGH4tjS8DEYULqGkDcUdhHmFRvVxPRscHilWYvMZDuwm6+XMQX+abR7Bd+ruSMluoEd6R9W9nDynU5FdtYHG999GajoZqp+LMaUq1y46NmI6A2DL0wJV8Ba3jFjiOODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ+uHizeSoKLL3Pg9FTYVUHeQBMPxJ4WX+hi/cZJMcM=;
 b=iirNk3mT69twO5KdZXOBOmtPUiHCosjWxBvjvUGPKmui4TM38uy0n9mhyUuIcHyfMxwZ/GKU0KMIT3iHvuHyw1uevc+SNI8n4MwoScGvwcythapeyrbF7jF4O1EeRI6xeHuxCuLzTZpjgR0IgWZWBnvd7L3mE97PwqLTxXSWXcBwYh7nJdm9be74VFeaGqWs3Z9+4/jFv+Z133cBS2nbZ0skv5O8bknE/V293W5/hD0og+Qba6o/jqOKPlvdzoClbFxDOSx8fShHheGv7f6585Ua/9WVYL5piHQbnuwNDMwQgPP9DY6RBUVnkHtkgz0mINHipF/WVNlQ5LwTR/Ye2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ+uHizeSoKLL3Pg9FTYVUHeQBMPxJ4WX+hi/cZJMcM=;
 b=sFbTkTQsOQBAxbrVJiK7ffOVqzLBQxZbWkXcOHkj0zcZ4rcpYJt6IJi1mxvaTZ+YFNAATEUh68zFEB3wQ5mNkZempPbR7NpBqCDWyAjr61a3AjU9MCywJ2dKU81tUWI6vsnXwpuOl5FpqUIbFpRrwbKSPGVsG4PFFERPoPFnx73tsn52QEy8ePEzA2of3QX0ZvUzT7GDsgdQ8Lmuwc2s8uW/T/DqUS5/zuFdRjoPRUt5/Fcn3r5P6mI83qTGCVqUTroy64dfjDtElteCBK2ziVr9O/qD/4/toivaKNJlWlp0ZjSK7ZCVdOY+1Z0bnlvSr4TURIWTDjd3OkZmnpw72g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f60e273-e8e3-848d-f3fd-68d7318e2e62@suse.com>
Date: Thu, 9 Feb 2023 16:32:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/p2m: tighten old-MFN check in p2m_add_page()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: e3521cb0-c010-4e9a-a511-08db0ab2e393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgQFFqcl9A9AnP66xobqHJ3Bh0ZUS+3Le/6Kp5KRxkD9dWU8RmvIQojt39BS7U/uTs008060WP+JgyV8Z/7U7v4uWkurPBQyaY65+3Xx581kehmppYRP7lAM13UZtCg+NpfPaNj7w2ZTFAOeXrgULH6N7U5w1TjDyjphWVBuFidwKuwINI2Hz+iESCWYyTpmkdXIFZAZO+BRCnlz/WCaIZMCBpKG4Ryq+OILx3AYYWu6eM3dPz2jmRj13FxqrrTMPGNGtAwo4mDIqZ5ckDyrDBjygT2nqd6Gne1q10Azc3Gu/wGGb8M+dPPc5j8Ge0bF1ob42/cF8upyn+lUoHC9FkdUiF0/ND+BumB7SHhBsrQE+2ogc4TyyeBwNLC0Rced3m+pAq+JDqdO1DWf26+EsFijjzravth0dggfVmkVSmhIsda6nNEpF1Lzf5PKPn6A3DDjDrumeyhiz6jc8qAyf4Aja9cBdw+S7bYjXE6OyWLueil2wVZeQt2zm7EJQKg+RuFT86lDxUp0YSIw1uNBM5zd2LHn3BNaeF2Bedq2NQagnnsUlDblAOZAwuYs+TonP4m4S1nTI2ZvsT0je4ecVt7KmleA/FkCoYbCYwXCdcqLqNZCzGLQM5lxC/5jcTT4Ihz9BPcZJaONLqiKU/aSNkEPHFvIIEbMdLxqjAQV4bX/nNjCKV1zhv7lsf8uPjf/1RlmLQ+6mTtgH7Jx0I+abJsXWeFtFROLO+zU5WLTj7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(5660300002)(26005)(31696002)(86362001)(186003)(8936002)(2616005)(38100700002)(6512007)(83380400001)(54906003)(41300700001)(4326008)(66946007)(316002)(6916009)(66556008)(8676002)(66476007)(6506007)(478600001)(6486002)(36756003)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlI3TVA5SW0xZGgweTR4Rzg0dVdxdi8wYVBCMUVXK2t2MWFWcVoyNDF3SEZw?=
 =?utf-8?B?K3pKZFVaYVhXNWw3NXdvMmI2TkNwakVtZFZFczdCRzdCaHdnTk5lK29zaUpD?=
 =?utf-8?B?K3BQdG5wSlZwZ0RpeVVPNzY2K25uMjU5ZE1wOE8yU05vVGIveXRXYVN4d2Fv?=
 =?utf-8?B?Mkh5dXRGR1kwR0FZekR0YlhMMmNpS1d1SmFBcVVEVHAya0hpeXNqWENIREJ1?=
 =?utf-8?B?R3IvSVZ4U2JiUUFYL2FDdlcxOHg0SUMyWHFiKzZIVUhQWHA0MFU1SEtSSkVO?=
 =?utf-8?B?ZXQ0K29BSTIzZlB2T21ITmRqWWxQZzRuRnVOazJMd2JuQWxncnV5YUFFUjFn?=
 =?utf-8?B?Z25nS2F2MXhRTGFSekVqTU16VW05Ry9xMnFHbDQrcm00ZHZVZTVQUXA5dTVi?=
 =?utf-8?B?UEhhNVp0WldabEw4aXJpSFA1YW9pSk14MGtsMHJFclRtWXl0cE5ZcFllR0Zx?=
 =?utf-8?B?cmVFVjE3eC9mUjR2UnJxam1FQ0JVcmV4TnRzV3NBbExMeDY4dEU1d2JaNVRR?=
 =?utf-8?B?Z2krTzdrUnRxWU1neVV6UnFwMmdMNlpTeEoxYzBpWXZEVW9CcFdFVzZIWHlh?=
 =?utf-8?B?dGp5aFVldEV6UER4Vk9MYWVDMzE5QktmZ2crRnNCb3BvdzhYV0kwVHdwMlNJ?=
 =?utf-8?B?YW9wbDJjYmU0Mmk1bEdjK3lDNkZpbWR1VlFDTHVuWFYrRGwrdUV4Y3JYckxL?=
 =?utf-8?B?REVTVHExalRNOWtFZU5rTUF6eWhlQjhKRkttb1pxQVJOdTlCZ2d2R3pZendx?=
 =?utf-8?B?UEExQUtIWWZMNEtHVVJSWDd4djZwQy9zb21YcXk0R254bTcrZUxYbjhWdWdJ?=
 =?utf-8?B?eGN0S0x4cVJhbGZqYTNWd0ZhUDhGQVprc1BlUWlUa3hIRkpGUkUwclVvRmtN?=
 =?utf-8?B?WG8xRHo2V1RLK3VkOXR5UXNwT0ZhTWcybU9YZCtvdjFsTWtrQjhzY1pVSHRX?=
 =?utf-8?B?ZVBwNkUvaHdicSsrMWhldFcwT0xhWUh1SmhUK29xRWllZGhnVmlVcWEzd1FL?=
 =?utf-8?B?bHhWOWhsSFhGWnpESitPZXNjZW1qTmc3RzFNZ2pBS3Nhb3pPRFRsek1qZHBl?=
 =?utf-8?B?SENZTEt5RG5xdlZkcFp0dy9IaXVQVzlLTlorUXNoUEtMTUpGQklFYnA2WUZ2?=
 =?utf-8?B?TUJoSzVTU3o4Qk9MZ0I1T3VOeWhxS2FFdXkvRjRKQWhEYkdtbjQ4NHFZSWY2?=
 =?utf-8?B?YVh2M3dVbFQySDdUU2xIaWViN2hHMWphRkRVRUxGSk8xVWtoVjM3QnhMc3Nn?=
 =?utf-8?B?NWFRTnl3NnBoVlJ6WWk2b1hzWFhIazI5TGpraXB0Y1IwZHlSUUJQdGNrS2xG?=
 =?utf-8?B?RU9XSjdZWVI0b3lhQVVCTUQ5S29wN2U0WnRURTkveVB5cXU1aE00OTRzTldx?=
 =?utf-8?B?MTVtRlJGampSSnVGbkNITEdvMng3bmY0WjNaR1J3VnRJSExTSG0yM2ZaWnhZ?=
 =?utf-8?B?QWkvaEZtZERZaXZpUWdVcU9ZUUxwVTZrZDQ5cG1kUjNLa1dnM0k4cVFUempB?=
 =?utf-8?B?QTlWdjhwS3ZwRjFrWk1IQzFyRXNPa0JneFRFME1jd0liemh5eGgxY3RsUmpk?=
 =?utf-8?B?c0gra2VIaEI5VHhleXM2Q2Y5MU5uRnlwNUZTWnRMT2pMOVVQZHN1S0JoUkdj?=
 =?utf-8?B?VWZQV0dVREZhQTZEN1drcE9Da3JxODBHZlA4SG1zUDdTazNta2Z2eERNclFL?=
 =?utf-8?B?K0NFZXY4WmNSV1pvTmh3VjZsbXArZzRYbFVnYmFRWGI2MDhVbFV0clpxWmsr?=
 =?utf-8?B?OXZPWkZzV0Y1blU0eUl6OFV3bXlqWk9lME5lL3M2ZHl1K21ZMjhNaG1LbTVv?=
 =?utf-8?B?Vm1lRDZOT1RhTzRCczJDL2pUT0o5NGVnbG1oZ0ZGZHdTQjBHaHIrMm80aDVY?=
 =?utf-8?B?NEJoR3lXckpqeXVXdW5TT3ZzRTM3Ri9UcGZVODZvVHVzaTZNS0I5UXV2UDd1?=
 =?utf-8?B?NVNQa0xTOEZoS0d1dmkvQmE2YTBXT2htRjFxbEwyNk92a0NiRDRLbE4xVlZQ?=
 =?utf-8?B?dnhGWDVpeCttR0cwTHlQMDc2K04wQW9OT3RMOEZZTkZOdUEvSUpURUhnT0Vs?=
 =?utf-8?B?SHpPT0laU0pkOG9kTi9QN1FNaytPUnllQjliVGQ4alhvQnlWZWZRT3NMdGNY?=
 =?utf-8?Q?4uGSI9BOiYJKoJCUGAzuz9A+j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3521cb0-c010-4e9a-a511-08db0ab2e393
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 15:32:44.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3wabkzpCjij8RmqUOz43w8QwHPkbEzkEs3B/zydR5U1cS/5ljI7BRYAGgN3qsFgs1ekyz7FM80xoXHFUqF0rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8274

Just ahead of the logic in question we've translated the subject MFN to
a valid original GFN, in order to then translate that GFN back to an
MFN. Restricting the call to p2m_remove_page() to the case where these
two MFNs match is too weak. Instead refuse the operation altogether when
there's a mismatch (which likely indicates a bug elsewhere in Xen), by
leveraging the checking in p2m_remove_entry() via passing in the
expected MFN.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If we were certain that a mismatch indicates a bug elsewhere, we might
want to consider crashing the domain instead, to limit damage as well as
to make sure the issue is actually noticed.
---
v2: Drop the check rather than separating it out.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -719,8 +719,7 @@ p2m_add_page(struct domain *d, gfn_t gfn
                 ASSERT(mfn_valid(omfn));
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
-                if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
-                     (rc = p2m_remove_entry(p2m, ogfn, omfn, 0)) )
+                if ( (rc = p2m_remove_entry(p2m, ogfn, mfn_add(mfn, i), 0)) )
                     goto out;
             }
         }

