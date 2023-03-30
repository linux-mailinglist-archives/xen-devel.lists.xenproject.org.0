Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A486D0316
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516629.801055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqQS-0007DA-6f; Thu, 30 Mar 2023 11:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516629.801055; Thu, 30 Mar 2023 11:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqQS-0007A8-3X; Thu, 30 Mar 2023 11:26:40 +0000
Received: by outflank-mailman (input) for mailman id 516629;
 Thu, 30 Mar 2023 11:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqQR-0006gd-1j
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:26:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc64e8e2-ceed-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:26:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8468.eurprd04.prod.outlook.com (2603:10a6:20b:34b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 11:26:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:26:37 +0000
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
X-Inumbo-ID: bc64e8e2-ceed-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kawQ88ejvpYSr+SK5zXClVyuo1dvd+jkmp5bnmO2qncx0zmsqa20lcDsPg0BKQQvLdcoyRpEsDdjZBoX9LYqWIMTrykiN0CHgegnba4Z95YMkDsjB9sV4WFOEryekhZ7mKMnPYiD+2iLOpIjtr7M9EWHnO673rvjvmqLnmcKYyR3Nb4DxjzIMm6Z+tvw+byyT9JD6vNafnE1qXunr9Pss64ETSEEF2tzGfgtpJYFeyDDcCksNpfPczjBpjY87YijHBaQ5zAQJgCjVmaoACS9AdD9v3s9MTdlINu2vBPpDm78yrh/UTFU/xZAxOlbi5pi+fNZm5QuTYUzchiDgAn0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o37qmZQGz0dUPVarEE5M4F8gAAfRaPl7Obs64dcS6gQ=;
 b=Dlqt8EZ92XFYkUkX6dsOgfeIPc0lRWiBpHdysauln6eQoLm+6lLMrVxjL6eiC1YyW68PtYB2wrEnA6l9GxxT5JJMDQOhrkXTOXN/lYXQq2NiRMPXS5yQ7yzKA3OrgDQWbgmnDYANSJ6D5YnE9QmCRZ3lUfve7BXM4F8lGxH1vfT6K3S8j4ignFth842VT5mkPjWcYp5EoBMMF9rSNAP8l3I6j18Q/W0pSOcgTM5V9vsmYaN79KwmrIHn4ynM5GcnvgARzXSADk764pziCbNB2jxCNzgqB2YDVlDCxQuba7Q4iOrRlmIBsPuDc9ZQOH8DMb9kZmb8ftRx2kaT70TukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o37qmZQGz0dUPVarEE5M4F8gAAfRaPl7Obs64dcS6gQ=;
 b=jqgZCThEfB4GsA6wvAxQFST6HoPuurWldv1Uuszho1cmWP7KBHvJ2csVBIbqo4HEmz0yO9Sab14BYCUB4tk8IvBhv214+umdEyBiLtAl2vKLuBUs2B2dfqzRTdgE37pNtCyXlfkqF8dq0/CHRnhL8nSt+33YEIaViw6t7UNOQrGFKEVFnJJSuj7OGwwtKgCy0vTap7/oEdlkMPy2VG+OMJ3/hpWny8R/gD2G+e6Z44ktbG1fb5l8RtH8WbI4wxLt3VPjhsD9KxYW8H6YZE8EIHTpejopAmmmJXEhIiH1V6VhVWiPDI6cy5rsNMYsWPzChjhpQc33S4D2/GAz1Xx15g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <feffc9e1-a44b-ec3e-fb61-b2f2098529e9@suse.com>
Date: Thu, 30 Mar 2023 13:26:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 03/13] x86/shadow: reduce explicit log-dirty recording for
 HVM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 248b542d-67f2-422e-c1d6-08db31119fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	is+k0jfzLnA1SefsrgzOh8bkUUhqQFeYigt5qJ7tXEg7F6uSeHvXonN46vPqIsp4ZHdnScYJtCe1xOimsBQm4TnTDKfRyLljsnaOcNHm8aPe2RxEtrJxD4qjyji4M06D91SIdA/mRiqiyTTacpqoACYgs256He2Fr51nGupcFyVEeCCGWt8jWldC30QkhkmIz+qRnoFszYIrQRUwvrGJq7QZw7AQziTGgYrFsT7KEXsSrk/b8R6zyP9lJ7hBj7guTqTnXNPecICAKR+Vt3jyqeIOUdEvzcnTr3AiWDC+co/KarldMlUBoAG427vgRRfHBZofeNd/cOiu5g6cABpuDl6KVN6I3AHUw+T3r6RJf8bVnuuiW1mHrKZTqJDcocp7CRelPwlz3cG3lKWWZJug4yZCFQZeZs8bkepHhKKrJlp1/yPmjUoI6mEXsJs/5HAVxxMbw9y3jf4Op7M5gTwLhATDv1hf7ok3dNdNgvyF5Xj8to36rk5fFwh5w+9qaSOtcyGmJdpjJTBV5jvTMNMJZZb1I/WG6OGRcEop50E9kh12J2F72wZdlq5VOEwgeAG/1nWiVZYnTpxESy/SU3pM7Ik/+iNvXGHcd7dVsCZvunByD+yaXmcCcgwrC2yhO+wn5VgzAgSwnJeIx06vtLhuBVZ2VrpjEg3zCHMf/XkDMfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199021)(2616005)(83380400001)(6486002)(478600001)(316002)(186003)(26005)(6506007)(6512007)(54906003)(2906002)(36756003)(5660300002)(86362001)(4326008)(6916009)(8936002)(38100700002)(41300700001)(31696002)(8676002)(66556008)(66476007)(66946007)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1lV2ZGbVhWeHZpQkNpdTduNE9neXYvc1hzdG9VNjFDcTRRaC9jZ1dNa1pm?=
 =?utf-8?B?WTlKclhjQkxRdTFFV29lZGNidVp0MmVwMnZjTjFqejJPNlN0eXpQcitzQXNa?=
 =?utf-8?B?azJpWWc4dW10U25MT0wrKzNBWmh0eFpqQ01RRWRRYTlteUlBOEo0eFYvSHZi?=
 =?utf-8?B?RTJmWnN4NnVnVElEbjBDUjh0SnlqcFdQR05jL2xLbStPeTUvRW5wdGRmUjYr?=
 =?utf-8?B?SWlDSUVtWWM1NU5heDZyYTlBTG9pN1BIZ0gzWVc1VmhVcXZkRGo3RzlmaFdr?=
 =?utf-8?B?WEI1b1k4UUxiNE9aSUtHTGN6MTJhcFFlREdGMlFlaWx6Z2wwblhzMFhoUE1T?=
 =?utf-8?B?MzJvMWNIRktpbXRYOGlOdCtLMk5VNk5CL3FmaittVzUyK2VJY0h1c0NoV1JQ?=
 =?utf-8?B?U3BWQXhyNE5YQkNGNzZYL0VPcFNESllhaWpERDcza2I0UHUyM29vcUp5eWRY?=
 =?utf-8?B?NkdPTDZYcUdDVmNNcjQzYmxnL3ZsUFg5SmhPNDdGTHlxNkM1QXhqNnhHa3kx?=
 =?utf-8?B?dUg2VGx3ZlFrcUJESUNSNG9BK05hcDB2M0lpR2ZxZUZjZ0RiaERYNnJ2d3pr?=
 =?utf-8?B?YnFVakJUVFBZZFpYemNVaGNJaGUzY1dja1F3dDlzRjd2VXVjQTA2dHZTUW1J?=
 =?utf-8?B?NTR6ZkxXdFNRVGtVbEw4bDJDVGZUbGFsSUZxUjdxT0tiUW9rUGhvKzN3N1l6?=
 =?utf-8?B?Z3FHRHk2VlJPQ3Q4THdFNDFrRlZaRDQ5dmpHaStocTUxQW0vYW5VNU1xaGht?=
 =?utf-8?B?aEJhRmNrQ1JYcHpiVE1XUm5tTGhkdTJTZnd0aENQb2pTeE5lRmpweC80VC9W?=
 =?utf-8?B?bGRTcGlKRVRIcElNNDN0S3JnUDhZSjk5ZW5kU3ZlZVJtQlVEdUsrZmZ2Rlpz?=
 =?utf-8?B?RFhFSWpNdzMvUTJHY0NtdXlUR3YzaVN2U0FFM0FKRHUxdTZvVC9yN0xvbjU5?=
 =?utf-8?B?RVpacVNndGNEWDM3SXRBOUJwZlZ5K2Y2R1BnUFZ5VFpreTJHdnJ5dU9VUkJJ?=
 =?utf-8?B?WWV5YmdPQ2ZTZ1JGT1FRTzFHTFF4Q3VyWUl0Szl2aTQwaWJTVmRHbjNGeHkw?=
 =?utf-8?B?cy9wMUpXSCtta0J3ZTJtOWhDZHc2cE1TVkNNVitFUXZYSUoxZnUxZURWdXJI?=
 =?utf-8?B?VERVMkN2UEowWUl6TjA1d3RPbEdwaVZCZ0tDU25zcVM1QWo0bTNRTTFvdTRr?=
 =?utf-8?B?dzdQTDlkMnFtWDNJSVhWaUl6UHVUc1pFVGNSaFBIcC9RQnVLMzlFSVNHRWNo?=
 =?utf-8?B?UkVKM2xVY05pOUlYZmpoSkU5ajRRS1lSamx2eTdXWEhNWWVXeGdaenlNQ3VT?=
 =?utf-8?B?SDF3MkhRcmJ2NGhPUHljRHVUL2tnWVNna3VKRzhRR1BRM1RVeEE3RC8vRVMy?=
 =?utf-8?B?OXFxNkVLaTVuaWhyZTlsR2IrUkFTOHJsd0Y5dWFKSCtWUG9aT0ROUnU2Q2E2?=
 =?utf-8?B?dDQ0S01MLzVQYmJlbUpaeGRTOEpTK0hMVXk1ZlhTRVA3TE9EdmhXN1VRSy9B?=
 =?utf-8?B?ZkRkYm9lckQ1S0hJY2xEd205U3B6bGxBdUNzU3FuRmlObUt2VW9CZTVpaEky?=
 =?utf-8?B?aVF4Q2NkOUFGMTFDNTlJS2dKUXRhWEE3UTBkRlZxZng0ME5MM3NuRzFZcmJj?=
 =?utf-8?B?d1pVdk4zMHp2WGtqMmxHVTJkNXA3N3Y2R0xFNCtGZ3lXUzhYQ2V4ejNRNG44?=
 =?utf-8?B?cExvRWVlcWdYa05Fb0ZzbG5INWYxQVZvZXdWbE9TNzRlWUNiUGU2eFBVU25a?=
 =?utf-8?B?RW9lZUhZbGtWN2x2RU9JQzJtRkVhOUVqNmFWd1JJbnlLaEFqeE8rRk5NTjhB?=
 =?utf-8?B?cDgyUC9SbEtCajdZd3JUNjNDV0Rocjk2b2tDQXZ5Ym80M0JrMTdzM0MzL29j?=
 =?utf-8?B?cUV2bzhINmlpekZNbW5YaWllUzZwc1Nidkt5VEdpcS8zb3ZrWWZYTlF5MmFw?=
 =?utf-8?B?V1AzKy82a0kxSXpjdUMrZHRQNHlKY0ZwYjk1WDlCMW9rOHJNc0lVMEhRenJw?=
 =?utf-8?B?b2M0NVlIcGIwQ0VNdDZIT09rMitBeWZiSS85azZsVERvUklyZDNHV0ZCNUM4?=
 =?utf-8?B?elRZRWp4NGNWWDBUcW12RUFvMHcwM0xJc3Bqd0lqY3o1dlhKZzlCSVYvUzJz?=
 =?utf-8?Q?Uu6SA68VK5YjFszww/ZqlVswd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248b542d-67f2-422e-c1d6-08db31119fc6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:26:36.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EEcg+3fq/oYA1PnQCOjBiEXykK6PXKWbSSI/XQ1Igkl7n28ctN3CPhzdNBIIraaDE9+nR5aKjpKIrorKgIE+fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8468

validate_guest_pt_write(), by calling sh_validate_guest_entry(), already
guarantees the needed update of log-dirty information. Move the
operation into the sole code path needing it (when SHOPT_SKIP_VERIFY is
enabled), making clear that only one such call is needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -656,6 +656,7 @@ static void sh_emulate_unmap_dest(struct
     {
         /* Writes with this alignment constraint can't possibly cross pages. */
         ASSERT(!mfn_valid(sh_ctxt->mfn[1]));
+        paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     }
     else
 #endif /* SHADOW_OPTIMIZATIONS & SHOPT_SKIP_VERIFY */
@@ -673,12 +674,10 @@ static void sh_emulate_unmap_dest(struct
             validate_guest_pt_write(v, sh_ctxt->mfn[1], addr + b1, b2);
     }
 
-    paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     put_page(mfn_to_page(sh_ctxt->mfn[0]));
 
     if ( unlikely(mfn_valid(sh_ctxt->mfn[1])) )
     {
-        paging_mark_dirty(v->domain, sh_ctxt->mfn[1]);
         put_page(mfn_to_page(sh_ctxt->mfn[1]));
         vunmap((void *)((unsigned long)addr & PAGE_MASK));
     }


