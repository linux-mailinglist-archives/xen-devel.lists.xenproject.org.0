Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8E412F49
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191453.341496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa5e-0000Rl-66; Tue, 21 Sep 2021 07:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191453.341496; Tue, 21 Sep 2021 07:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSa5e-0000Ps-2y; Tue, 21 Sep 2021 07:21:18 +0000
Received: by outflank-mailman (input) for mailman id 191453;
 Tue, 21 Sep 2021 07:21:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSa5c-0000Pc-LR
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:21:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 818cb834-1aac-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:21:15 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-NZpMd9o3NHGFH53cbEF2jQ-1; Tue, 21 Sep 2021 09:21:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 07:21:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 07:21:12 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 07:21:12 +0000
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
X-Inumbo-ID: 818cb834-1aac-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632208875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=289UvYu1z6hhybJctb/uHf8lFebZQ7uBwKVUfRIW7tA=;
	b=afw0ncX6rYa7tvfD5HOD2sPq3eF6QDjKjAvIGuFNjgIDwarx+2I952rScdokzWMfVzD8ml
	UNqpJ5Ar89JQa1q6A2AsOjdPk9pZwnadCJTugo25XP/8Ux1jVidjTO9XQoI6oOFoSR73zL
	c0ouiekY0rFJSavIDHU0aCo0UIpsOvw=
X-MC-Unique: NZpMd9o3NHGFH53cbEF2jQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7aoENOHdv05H6wD0zheCMqSW1MX2nF+sHjcYjtaB3EO4dC2O/19CrQ4Et6uI19rpH7WXN3O6kmEZZIRRDbPfYTKEk9r+RV7PCxCw/MWIHX9fiF7FZbV6CVCnUCSEMf+bx1duV5xGu2hfPdPIDf6F6cwhjdZ8WoXJB1+XxJaJdjMwNMTnyahWN/eyi+uKBY6UAt7x0f5unB3ien31m7xdWaM9oCZBU8rpMCaDuwmdExK3dwJOiK8/dMkR2xCIfJd0vi7vVpvBG32Z06QJAPw5qRmCqZGGFWEKEbL9YJwttlhuz+m0DOXurVdbCTFUF3Py+L3cNJ3uDJKgq669MJ3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=289UvYu1z6hhybJctb/uHf8lFebZQ7uBwKVUfRIW7tA=;
 b=AOF75uADfuJNL8vrXQcOnddp+d/kjjIjs5X6zBymE1miaFCm91NlLXeGcqm+Ols9oV7K2FioYGZPgkHp+2uumS0cFm2sPt5gVfSClWMFvALYDtPR6vFxjw4fqXNA8ip3jTC/OAdxrCuepjICpTPYPjYaepfxpW6xC8pnRdBFlh1aIVkVHWStDidfAWwTxEjr5zCtaGK8IGrgfAY1uFoUluxerUtTvjXapxh2eHOyVxAx9g6xlyEbp17zMGVE+j50gHlsG6ih7LsAam+9PJIVoz1JMyL3zyghKRK3Uoq7KLl+jTdHOOkdZ027uRU09Q2uZFnyGAcnzGtDo0jj3xznlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v3 9/9] x86/P2M: relax permissions of PVH Dom0's MMIO entries
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Message-ID: <a141e1a5-0185-4923-a91e-68c06a4f78cf@suse.com>
Date: Tue, 21 Sep 2021 09:21:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7988f48-3e17-4028-d6bf-08d97cd06436
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26065121EC53CCFFD9993FD7B3A19@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GEQpZvVC4gjo4LApWhDyUqClHh7Tc+bAnChVMDRBSrkRpWXHc7wfDKhk9y/owPSexYzIPvKD6GURW9j7/4m3w0b4OuvTVAdq0boRma29bJmBCV2bsA8AWt1QkJhB5PgAXsMJC0rzMJ8B5oM4xXR3U4iTydY/4mfySF2EpGjObGSUiCoOwF272fFQaLhoO67bukLlchc6Q2mjpK2FetRXTPUt7MRS3TmlpAVz3cJZTbEZdrVAOXuWLJxI0SJWIZ+ARdkotTYXdpNjPW+LxCgxrl96IJIiGNpirxCe+GE3xRaLEaSN97CdEyEDFiiUHSaq8eRK8rjJbTMKrjTrdtZBTgcBytZvvs6q8W0Iq8C2o4nc0znfY5WySyRq+gcyIZ4lSkqaon2f2OViLnKoVqRgj36sblhUKDxAO7vztU9iB7IA4mgSUSjN+KejSowVseaBn6WYzpoEoeu93up4Rof+i3FX4fhFL42DqzEEet6oT57jekftueJ76+vBTo16jmpImzHmCiGdmD645giercuGpANwKDMPVMdxs01l1WHP0eOz1e2FOWZCWnq9fecaTV+rrSLL1sVDx/nVsYcld4JDckN57yoewJnXkGF1pU/zaFPH6XYupnRzApz/0Qi1OCmh1BIkZHh+u/OZaD+bVkQR1ss8QgxPFKizTsJtmDYIzQbsaWsQDh4FUDmnHaGK/tW7jlBlP8bElI8ACm5rwd+yUfGKoNF3Pk5+7SInFrXlius=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(31696002)(508600001)(6916009)(38100700002)(2616005)(4326008)(83380400001)(66556008)(66476007)(316002)(5660300002)(16576012)(26005)(54906003)(86362001)(8676002)(31686004)(956004)(8936002)(186003)(2906002)(66946007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmtDWnBFZnQxR2NtMURHSEQ5YzJQSktNc09MKzhra2F6dmsyYVRKSHRtQjQ4?=
 =?utf-8?B?UG85Tk9vaWFaTm1ORWNXd0FTbGFCMWQzRm16MXJmTHdVbjk2RW9RNElkOVZV?=
 =?utf-8?B?V0lzbFl2TWpraS9xdHlUR1dlNG9DYmFVaXpGYVpXY0JPaE5XSks1ZlZHZ1ZU?=
 =?utf-8?B?WGdUMlorbzJ1bDN5ZmFpeUdudmZQWjRpRTB6c1pFN00wbWRLRXRZYUdZOXpC?=
 =?utf-8?B?M25HUERnY09EclZkMy9iT284ZzZXRzhNQVhMZ0ZpbHJOVkg5aGRVL3R6Z092?=
 =?utf-8?B?WDV6Ym4rN3FibUJWVlB5djlzbmUvOTVxbmdDTE1nYXBnWm1JUmtkNEtPVHdI?=
 =?utf-8?B?MnlnTWUzUnFiZC9yZHM3RndNMTlqdTNlNEJwTGdXU1RDOWE1bTJtRFN4VjJF?=
 =?utf-8?B?K3hHYndpYTV5S0VUcFY3NXR0MWNQQ1N5T1VROTVHcW9iYVNHU3FLYmhqTlNI?=
 =?utf-8?B?M05JcjA4b0FVTDNKSkVLU2xVRDlxSktSOTZLWkFWNE9xMDlCM1RXZDBaZlAw?=
 =?utf-8?B?Z1BpektwODNqalo5SlV4aHlrZytxOFlzREF2eHBiS2pONGJtbGRZdGZLdXBH?=
 =?utf-8?B?NEZwOTNvdUhiSVNiY0w0ZlljYzY0aXJqM0paZWFnYThNRGJxcVRZNERZM1lj?=
 =?utf-8?B?T09tMG9Kbkh2bGF0NUdrR2UwZGxRNzFReFRwTjJYN2hCY0pyRVVDUUhhVXhG?=
 =?utf-8?B?Q0xKZ3RMcXBLenBXSFRhZjR3MU9RSFpZd01tWG9rMlRjcVdDQ0ZpdGk3dDQx?=
 =?utf-8?B?ZDVVZG1mVjdKVlhUcm9qbnNLTFhERjB5YS9JeEZueWxKSGFMOEMwY2hHL3hQ?=
 =?utf-8?B?bWV2SUR3MmtiMGttOFV4UEhoUnpvVy9kelZDYmU3MXAralJnODdCN05WZ0hT?=
 =?utf-8?B?VW9pdnpxb1R0cGt4SDMvRXlaajhKMUY1Z1FXa2hnbWNESGJzcXQ0dFFwQ3NU?=
 =?utf-8?B?V2RNR3U5eUYrc25ETTkrcUtTSmZJY3lqNjhoOUUzYmJySzVqQlNjSnozb2Q0?=
 =?utf-8?B?UnVxRW5HT0xBeUI1eENTUmJlM0RjNnBhbmRZaWlKRWIzU1F1dlNFQXJEbFlu?=
 =?utf-8?B?N1dLdWk2MUZDWko0dUttQkxSY2tyS21JVGpuOW9EaFB1SS9uVXlJdDcxRkJO?=
 =?utf-8?B?ZkNqWTg3ekZFTDRaZUVpZWsvREVPTi9ad0JSb0NIQUwvcGVkNjlCd1B4R1JX?=
 =?utf-8?B?Z1pwMlhOeWI2WHVwZnJmNGprTXFESDhtcjQxV2tuYU96cUFuZXFhQVRBczFY?=
 =?utf-8?B?ZVgvSWsvODh1aXFhb253NWE3bUtaelpaZ2MxRVU4UDFFbFp6bzFsZ1BKSDFl?=
 =?utf-8?B?LytES0hjanRESWdUREJjUU1tQzFOZHNlOWQyc2NNY1gvby9RcU00L2tHZ0VM?=
 =?utf-8?B?Z1JPVi85WTE5cjFsd1NZK1lmbklSWXVFbWRTQ0tRbG1PQmNUc29PMWdXWllq?=
 =?utf-8?B?WnUwbmdINkRCVUR3VlJ3alFKUVpsWkJFU2RYYXhKQkh6MkNEWlNKWkc3U3ZT?=
 =?utf-8?B?bCtubUNtKzk4cjRoSDMyZk9oaGRWZGM2SXJLL3g4L2VSam9Jd2pFWXVJTlRm?=
 =?utf-8?B?eERoUUV3Z3dXazN0T0oxNlNqUkVleDhFYWxPMThSRkRHaGdoT216NTNvTklU?=
 =?utf-8?B?bkdMcnM4T1NVQmN3YVlPc0hLaHZ3SjhKcTRuY01LUkR3QUI5MXcybklsTEJl?=
 =?utf-8?B?UXB4TzhmY0R5a0M2RGErL0l6d01NaXRWVk41RW5Fb0J3cEkrOHpDT2k5NktY?=
 =?utf-8?Q?+ciszDXkPJIu9GQe/D5OfDN1GSZZWD0eafRKzoW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7988f48-3e17-4028-d6bf-08d97cd06436
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:21:12.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kS0cPmW0ktOELRYfFrSvLx3W8jO+myJKsOsj5Jca8mudtFhbJXABARVd5v4FUyQJOKhi1MKgUDXZYrYFEhTKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

To become independent of the sequence of mapping operations, permit
"access" to accumulate for Dom0, noting that there's not going to be an
introspection agent for it which this might interfere with. While e.g.
ideally only ROM regions would get mapped with X set, getting there is
quite a bit of work. Plus the use of p2m_access_* here is abusive in the
first place.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Move last in series, for being controversial.
v2: Split off from original patch. Accumulate all of R, W, and X.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1319,6 +1319,18 @@ static int set_typed_p2m_entry(struct do
             return -EPERM;
         }
 
+        /*
+         * Gross bodge, to go away again rather sooner than later:
+         *
+         * For MMIO allow access permissions to accumulate, but only for Dom0.
+         * Since set_identity_p2m_entry() and set_mmio_p2m_entry() differ in
+         * the way they specify "access", this will allow the ultimate result
+         * to be independent of the sequence of operations.
+         */
+        if ( is_hardware_domain(d) && gfn_p2mt == p2m_mmio_direct &&
+             access <= p2m_access_rwx && a <= p2m_access_rwx )
+            access |= a;
+
         if ( access == a )
         {
             gfn_unlock(p2m, gfn, order);


