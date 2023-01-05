Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3365F0CE
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:06:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472043.732143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSlN-0005wB-O9; Thu, 05 Jan 2023 16:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472043.732143; Thu, 05 Jan 2023 16:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSlN-0005u2-K5; Thu, 05 Jan 2023 16:06:41 +0000
Received: by outflank-mailman (input) for mailman id 472043;
 Thu, 05 Jan 2023 16:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDSlM-0005kL-2C
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:06:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efab7802-8d12-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:06:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9432.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:06:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:06:37 +0000
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
X-Inumbo-ID: efab7802-8d12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4YhXWejcZbws13WDR0aSs6oVQoxmssMvS6YypsZTBokNSZJ9iiDVsXHqYHgXkdAsoHjvCFIlfg7kr7p/fCVUxfHLrUSQkICw6Ia+Fc7LirDbF/np3/oebizf+9HFM8Aa6CLSUE2kytICE0Ung6Z3fnGylwiwiOlaPkZAs6dpMWGkeM9ODMRASQh+paGb5CFWgR0Kv/5kz5+GtxeTPabRc4SfKhoUJx3LHmXbZ7EPwE+QcwXyAueXy/Dxbhi4asxcjtP3L3SptiRsNmTCoWBHaRV2vHFuELT4Wwx27l4KucBIlNNOY7RTEIPiR8o8uvBGZ7AMXTqNPYfJS1VKqqzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBgM5VtWVqIkPoDCOPK8xEPFq96mp+OUcLEBtT+07eA=;
 b=ZlHpO0xn9nPfqrWGjoomxwjgSXtoEQvCZAtYBuqneles+J7jyoz3PlESkWmfdEhpcr78533t5xqRSPwQIL5VA3MOGUVoexYKzIw5wvhP8hwX+oSUv5U+0jCcXnpViZVaQeTaSIf3tonW5XLKp6SgjpoWnnMBFDplXIkUKybfRJEEG1XwpBME47OLP8NyYexaNHdbVojtKNljyp7RVnuELpO6I7wP2lW29QB05peTl/Qwve25GNtEZ/uDPw+2PIwJdQFmFOyDbe4g+eHfCyRJ6m2VulvlssUI+OMeEEwl2nlhbH/qxnjVRhuqgp5N5LmaGg5NsIS6FIANbjwC12M0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBgM5VtWVqIkPoDCOPK8xEPFq96mp+OUcLEBtT+07eA=;
 b=l7VkZDgN1vWhY7eQ1WCKwhL2ReJP9SDbXcsvQtxT5n+FxK28rOKERP3bt16/JyPsrrEWCkQAvumNn6xhlvx+xLZ4+npqJ9LAZMjpp3CVJoCxkahqcASK1myTLVKI5durFKN+jaFOIBpVzia5qThqnKtg1LNVAY7dfRSfqy0k5KBc3IYtkkPFZXDYu4U6a4hFWZb9NRtdVDX9pPnyhzsjiXZKka6+mZFaPkXl2c9D7b00gpIflcJqRh9wgwhaVisykP2hc4xLOWL9qoraNHYeVjFSUMy/JKWLEU8KpU6lyhjAJmpkTSfYGRzhzAjdYKh+IUnhEIlPJGmvtNcRL19+/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0998689a-91b1-e381-ac63-a485ab2cb65d@suse.com>
Date: Thu, 5 Jan 2023 17:06:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 09/11] x86/shadow: simplify conditionals in sh_{get,put}_ref()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
In-Reply-To: <074dc3bb-6057-4f61-d516-d0fe3551165c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af18b23-60d9-47d6-01bb-08daef36d320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vJ6piFQCYG2spTAB6SysG6x25rneJH89bOIqSUkifTZp+K99hrxhrqqMMJKy2KNR/rxGmpiCT4keIHBmCT3Pqe5be1Hy8aTH9IqiNvknbiAA7SyAdozGkaTHQj/muOIf9PIP+gSoqTQH1TyMOOklJ0Gy+iODzINriRUgt50lN+MCSMGS3Q1YjCCd+bShJ/AY8fJ5ayVW5o5yKWaYftAwRcOiaTGOsjvLs1Abx14HJxZlh9rkxsEms1wyjjbOwDBIf7wDXy+hepIdiRfSGkvg07f+OMBmhLCJjYig45Tseq2No2d36zylFjOJcNpQvESBAOOYJ3XBJ0tZVj8fMq3n41TIBdTWP+DA++mUFl1Tf7mUe6adGxWZYvrBwX5mNzagu7HtyOParcy40mZOsUG2xZVMYfbN5mK4/aSL9m2cw1Kga/SK54insiK4jLMy9bItbiGQqGvQ87dw1VeXQJTD5+MZhjAzJFpnM8MKTxRNYUWvZOGTiKDpW2LnoizoHRbl/hrvIZvjYrNnsNUdJ2tYfRA/45xqoBR95x4ADAAhMDh8UVetEgElTz/FFXXZLlx+vVO/aaQsXmOEYhxoFhUjIGLWfE18gjRyOj0hEzjtw1QGjb2NeY6gAXg8NERqbEAKusPkWz7msIuWxd2YxVlZAntaBZlMkKEStNTzY4OAwPHp6teQ7Vm4hSRz7Uhh7F6GYJiwuMPYfmnrvOybkbP8ij3lIMycyPXz8NuEsIROTcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199015)(54906003)(6916009)(31686004)(26005)(186003)(66946007)(8676002)(6486002)(66476007)(2616005)(478600001)(6512007)(66556008)(41300700001)(8936002)(5660300002)(83380400001)(4326008)(2906002)(316002)(6506007)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2kwek5ieHczN2tGMXVBd2NlcE9lSitTS2poMEhVa05TZGZraFNNekVEditV?=
 =?utf-8?B?MnBoNm9FUVQvNlQ5empVdEszN09SdzAvSGhKSWNNeWNsVHVka1YvTDJvSnNJ?=
 =?utf-8?B?V2tTakZVL25Lb3dEbGJ4R2tiR2JGejIwMnVwSjZ3VGRsdGplRmNyYjF3aDBa?=
 =?utf-8?B?Z1Zsc1ljUUYrRmpDR2VUcUdzYXFpYTNzbjBGTGI3RXJlNGlWb0gvZmxBVk9M?=
 =?utf-8?B?WDA1OVo5Y2padWozclJxUHkxV0hueWpsdTBFcVg3TktDMmxQWFJoVUZ3WjZr?=
 =?utf-8?B?cUhyZzQxZ0F6SGptdjV5bi9rOXVpSUpaMllHVmNkYVJiSVpHVHZIa0ZFZkk1?=
 =?utf-8?B?QmxueExLVGlhZ1AxaXYvdTIvRFFiYmlCUjF0N3ZMRFJrODFJMXIxK2FRQXNY?=
 =?utf-8?B?ZngvV2NCYWZtQWl0UWNTVUUwL1doRjB0STM1MTZ0TlRHeDBjWGoxRGpvd2tX?=
 =?utf-8?B?L3o5Zm0xZ2hzYXg3dTJaQndvOEFwWWpzU1NJeXcxWHBXaG1hQ0dnbzJMMGlv?=
 =?utf-8?B?bEJIc2hVTm91a0FQSUs1KzV5Yi8wWDgrczdnUFhkZkJDQUpVV1JtVWRVbmln?=
 =?utf-8?B?UlJlQytzNEdJQUsyaHN0NXg2dG41cXY4M3czYnAzVzZ0OFpuUnNNb2VKdVc4?=
 =?utf-8?B?US9sSWZvdXJueURwdi95dDM5OGRDWkRzWHFlVHlEK3I4eFdDZTB2OWJPdlFL?=
 =?utf-8?B?b2xrSXcwY0lSZWYyeDZLbXh6dGJweTg3U3BIZXoyQUEyRlZzeVdrQUJRelBi?=
 =?utf-8?B?WGd2K3U1MFh6T0grb0VFRjh6R09md1dFb3d2YWhSU0NHV3QzQjJWbVBKNTVH?=
 =?utf-8?B?SUphdHZsNnluQjltODBaUmtHWi9SOG1nZDd0elNhenFlaWZtZHpyZitrMnVP?=
 =?utf-8?B?ZGxrRU9KL2ZJd0MyY0NjWnFuazhncU9CeEdBdWpTQmUrcTMxUEtyMTNOalJF?=
 =?utf-8?B?M0NhclpBM1QxbE9zZmFTS0FIejV5QkdQTGV1cEZWamZLOWNpQUtCUjgwTGdp?=
 =?utf-8?B?ZVF4L29QdHhDZVdRb2JTNHFVejAreXV0d1dLZXhtV25BT3NKV2s0NnhsUlUw?=
 =?utf-8?B?eGMxTG90RFBkd25NNGI2SzdnK00vL3hYMGE5U0h0STFub2lUV0lDeHZaT2hv?=
 =?utf-8?B?WE5mZ2ZFOXU2eUdOc2l0SVZCZWNZcjYyeGg5N3RzL0M2U3M0NlBneklBVEhs?=
 =?utf-8?B?Unc1cnVJVFAyQ2ErUnkrbXRTVzNsSEttVUNEWW8zbnMvczdDSEdCbEpRWklj?=
 =?utf-8?B?dDNzcEpnS2VVVjdGWlFXUFEwWDlXcTgyUXQvU2dhQkJoY28zcXVPVDZLRzdj?=
 =?utf-8?B?N0RZcnVDbWh0ZEc2UFh0cXZMR2k1ZEErMXZ0L2RoREQrSnZzS29VTVFVS1hu?=
 =?utf-8?B?eTJXck9DYTBXT2J3WkdoTjBMTkd4d1FqcUdXNnB5LzIzUmRxMGZYTm5UcTR3?=
 =?utf-8?B?dHA5cTRjRW1jRXNacVVoSHB4TE15YVROeGd3dVJYbk5OaFp1MWNJWkhqVlBu?=
 =?utf-8?B?Zlg1NEZacE9IVHllVElLa1duRlUzaEhQaU5pWno1ODhGOGEzVjNTZm5aeFlz?=
 =?utf-8?B?RkwwdGFERlN0RktnUUtQb2FKYUxqVTllMUtOcEo3VjZLMXRBZnBsTHA1dUpX?=
 =?utf-8?B?MTBwa0orWkZUVkJpWjM0THV4UkhnSjZ3NUxHSWIwSW9hNDIvRXFDRVVkeTlU?=
 =?utf-8?B?Vzg1UzVsb2xNVEFLMzByU2MzM2JqK3NkY0Y4bVJ0am1QUVFuSTBJWXNEZ2V0?=
 =?utf-8?B?dE1oUnNveWJ4V3F5RVYzVzlnVzVhZVh3ZmRUZVpyanQ3THVwRk9IZG00b1Uw?=
 =?utf-8?B?eTVMVE9CVUFrYm1vRFh2dEJUL3BSdFR2L09QWGVkZnArK0dEYUpraWpPRVUx?=
 =?utf-8?B?ejRJNHM4SEIyVmtub2s0YkxJenpuQkhFWTd3c2U0ZFhhb0lzV1lmdkxsbWdm?=
 =?utf-8?B?QjFvZTdsc1lBQThnNzJnalZiQ1JsbDg0M3ZsN096WWdoampneGtsdGFTeGl5?=
 =?utf-8?B?Q25pdmxLbEs0N3d1QWg0eVVLNHFxWkxEaGIvY0RSRm9qelE2MmlNdldObVVV?=
 =?utf-8?B?MUk2a29FOStpRkw0QnlXZVhBR3BuMFQ1bHZucy9rWGw4N0svNzEzMWRQSkor?=
 =?utf-8?Q?ijeNtPiyTDbDaQ7TftyWUyokf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af18b23-60d9-47d6-01bb-08daef36d320
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:06:37.6802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d54P2iPN7JaHNZZWMtCb08lWhqROSGJ6/zUqKXb7t54PlXli06etdxO9gupjKq5uyxcP6sjcp+wb4ne8smx/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9432

In both cases the "entry_pa != 0" check is redundant; storing 0 when the
field already is 0 is quite fine. Move the cheaper remaining part first
in sh_get_ref(). In sh_put_ref() convert the has-up-pointer check into
an assertion (requiring the zero check to be retained there).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Strictly speaking accessing ->up ahead of checking that the type
     actually has an "up" pointer is UB, as only the last written field
     of a union may be read. But we have violations of this rule in many
     other places, so I guess we can assume to be okay-ish here as well.

--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -586,9 +586,7 @@ static inline int sh_get_ref(struct doma
     sp->u.sh.count = nx;
 
     /* We remember the first shadow entry that points to each shadow. */
-    if ( entry_pa != 0
-         && sh_type_has_up_pointer(d, sp->u.sh.type)
-         && sp->up == 0 )
+    if ( !sp->up && sh_type_has_up_pointer(d, sp->u.sh.type) )
         sp->up = entry_pa;
 
     return 1;
@@ -607,10 +605,11 @@ static inline void sh_put_ref(struct dom
     ASSERT(!(sp->count_info & PGC_count_mask));
 
     /* If this is the entry in the up-pointer, remove it */
-    if ( entry_pa != 0
-         && sh_type_has_up_pointer(d, sp->u.sh.type)
-         && sp->up == entry_pa )
+    if ( sp->up == entry_pa )
+    {
+        ASSERT(!entry_pa || sh_type_has_up_pointer(d, sp->u.sh.type));
         sp->up = 0;
+    }
 
     x = sp->u.sh.count;
     nx = x - 1;


