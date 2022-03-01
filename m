Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544A4C8761
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 10:07:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281017.479161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyTI-0003Lr-9r; Tue, 01 Mar 2022 09:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281017.479161; Tue, 01 Mar 2022 09:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOyTI-0003K6-4L; Tue, 01 Mar 2022 09:07:04 +0000
Received: by outflank-mailman (input) for mailman id 281017;
 Tue, 01 Mar 2022 09:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOyTG-0003Jk-2Z
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 09:07:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f452db46-993e-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 10:07:00 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-LAZ0_ON-OZCYelWsRSRWWg-1; Tue, 01 Mar 2022 10:06:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5815.eurprd04.prod.outlook.com (2603:10a6:20b:b0::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 09:06:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:06:58 +0000
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
X-Inumbo-ID: f452db46-993e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646125620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hiU/P7w+AsXchWwmyxNqYBVb2zOqDmIi1c2BNpDN8n8=;
	b=Jb/Mi0yJBHdE/4/Tan0VgdAGmxdxKAZ4MDrIICoBoKG/Za7TcBmcc7l+UFfwCMS7zytQko
	CaUNb4tqQAgzfCwmtpf5OIw80XJn72ik23FBsG80h2CQxJoBuKmKTFrJZjcb85k9ymeunF
	kpgjjkqgPODOlfnVDoz5lKhaJONVD8E=
X-MC-Unique: LAZ0_ON-OZCYelWsRSRWWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzVY3g7SNEC2FzJuBBHsADuFntmAl+NG2lZuOSXXJFW0T9pGOkwqJiy7twaeo6CXlg+cFYww6Sn2cUiAWBpo11S8IG+/O4SGevLyZ1c9CJVgTpQBBoAOQrkRN+EB5qSRr+PhPFh5okWHoPvBSrToDgPCyN25TaHRnFhQ4boDzZz82NUVMpYs2HNAL+nH8VOcVk4NalYnn3W+aPVlwHk4clLK7xvAvRSathU889/Ji3NXwbLrZDxZ87iCin3SXvzlDENK3B+8AcxHs+FTpD2Fpcv/xeYTUGmZSbdPmdKlG0yMzUfPVJvVHXh7VoK7H/Ec72rZTopsB1f0hD9mkAd0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiU/P7w+AsXchWwmyxNqYBVb2zOqDmIi1c2BNpDN8n8=;
 b=QaFnHckwi66g3bf7r3E/gEebp4DXxL+8OKsUG9kfN/+78iicLoa0PfP0kt8CQTz67GzeZ0p71805W7O4zUXy4gA+RaOxc6kyREvNECKqkqpapg0gh2m+AS59eSR0XqsZZ+fM5Ndvy3uuabKGx/68Eaxw1yTmGyybuNZrWzZ4/JEkhKhQINxTG07Kc5Ka8bLzmcWH8CmKOZ1zrY3QLjGzjnJxS+tJNy5r+tpDjLuwlafg4Qn111TrZVU4ysIF4iZR9p32TauJI6nNuCgbzOnbzvG1F65ptqsWm9n1vS7+RWtzh6ZIA/jXxY7U0oeWxfP53lp1zu6l/er98Et7u0HgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2fffce8d-f462-a832-f323-87c93bcecf2a@suse.com>
Date: Tue, 1 Mar 2022 10:06:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] docs: correct "gnttab=" documented default
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17585542-1bfe-4bf7-741a-08d9fb62d715
X-MS-TrafficTypeDiagnostic: AM6PR04MB5815:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5815E419B25AC032120AC7A4B3029@AM6PR04MB5815.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a0yXezymj15GpZVejotvReF9N44c0vlS0V0XltJixww2raMDdWWs3vtdY+GqZlnEQkO6Kwn3w4POve0eUztA+MBRUtryETwJ/nzT3SysjkDyo0FGVZMOozOqX1cplLi3mu4w+Q1Qypx67NFPs829gJVuZFwXNa9qms9FoQw4zqQ+koIwe25Ck50KWGs3uyngtHjEx9BbambRDPpvvVrB9bdWwp3O8QWDPnY8EmxqwiDtjVVC0yHDoZH3XwHTtYkLk73V4Q0/MyPczUR4GqooySQodY0APTjgBdZcU5G/9pEcwvLdxNKu7LEn/8klkY/Mg1co+J9NxDcArvcxcDyV9apBF702Tw+Nvu01yRSPU0TqQBmrvuLOIYNlB53Pp8C4zsNpMraJ83SKlRZf48XwWV3cZoGtt8c8RSrbhoLfgpbqYX2jgmMBopicW4JsGJlBY6oqBYxw56K4P4f9Xod5C696iO1LCx/sDG8bhOw7usA/lR1EFwHYiFoZuSl5kMnOf89az9fAbMvn7U3Va/hOiB+z8ECajSPz5PhX715GUhFLsua1AddEUEV7eZ9g4wrJ7oUs/A4w8LmqMR7D7gDnYS+88ZDH0/e7lGmCthLDaOqf35z98yH7GHz5BaYtltbDa7Dbs1DxQ7QKmtvqQ2um3TFg5i1xKahDb9byU6U/5aQxjhsZ3LMVQJlMHux15XICOpFNKfD4EzqCDxGBx9J7xDZEzNQqyWo/IUMyY7mtoSy5GTH07X7nXnNJlLuLEo5L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(5660300002)(83380400001)(36756003)(86362001)(6512007)(6506007)(8936002)(31686004)(4326008)(2616005)(8676002)(6486002)(38100700002)(26005)(186003)(508600001)(31696002)(54906003)(66476007)(66556008)(66946007)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXZEUVRlMnFuYTR2blpuZWRUQ0Q5QTFGb2NjMG1lcTRuWUY4WXpqc2N0aFh6?=
 =?utf-8?B?c2JBQVhheS9CMnVQZFZndmUvaTZpZG5aMmNDeGNPekJTTmg3UzhiYUpSdWVF?=
 =?utf-8?B?OHo3SE56akRMd0gzYjF2MlMzTnhBNEdSVmNyTDJ0Z3Q5TGZBc3lXaWgrNXY0?=
 =?utf-8?B?enJ6VGJxaDFTaWRlMGRtd1ZlN0NLZkhjSCthMWJOdmVEY2VWRUhYZHRPMS9k?=
 =?utf-8?B?eDRDMFdiQXU2emlyWmErdmdaT25lVlVhRWMwb1NtWWQzRnRiNkE5N21kcWV3?=
 =?utf-8?B?MFA4aUJPVDdrdzBrdGpKVXpsdmZHRnl6UFdsSURtNEoxZWtETEp4Z2NRcUNX?=
 =?utf-8?B?aSt2eTJBcEFkdU5tRk5ISGxuK0pRUFVvTXF1WFRObnVsNlBlN3pobmZTbE5G?=
 =?utf-8?B?R3ZLSEUzNHZqY1NGSDF1TEpBejRXN1NNc1NZcTE1MTdIUG5xdWNxNk1reXVq?=
 =?utf-8?B?T0o1SGZmTStpanlZbzhRSmpxQmR6QW52OUY1T1ZNYmk2aTRLMjVBWWxGWTlz?=
 =?utf-8?B?cWRCa1c0YkhmTC9MaXZrNkpvSzVZL0VoMzZIandEcHJIQ1NISUdPMWRUMXk5?=
 =?utf-8?B?RmV6NGpaVXNtc09HSVIzQVFGZHdmeXNkbm5nS05ybWtEckhrYmxzQlIxWldn?=
 =?utf-8?B?VlJScmJxNHEwMEwrZWpsZ2gxVlZNN2o3eDBNK0YwbjBLRGtTdDlhOTZuajJZ?=
 =?utf-8?B?dWw2NVE3b05kZVdvaEJiNjBTdTZxYTd5alN2Tm1mRyt5cGRHME9MU1Q1Tm1m?=
 =?utf-8?B?K3BnUzZOUlduek9scHUvVFlFVG1XOFBBL1JmbDl1R1V4THFpNXNyNm5ocnZ5?=
 =?utf-8?B?UWpvUGJ5cnVNKzhZVUFCR2V1dlZ0Uy9xTy8yK1k3V0JOMmQxZHpnek5zODRx?=
 =?utf-8?B?MHpFUmZBd0dYYmw3bG15SEV1RmE5a1AwNG9obFBqUkwvdFNDT2NVS0FobVR6?=
 =?utf-8?B?RDhQUTFUSG1aY21EYUFtQW1sTUZnNnRvS1BVVzdWRU1hRzd2WUhTbTNnbE90?=
 =?utf-8?B?MXpsMFdtUUpTcDI1TDZEZE5uVXpPQUlMNlBMV2Q2UXpNTUJqbXhsdEZMNDJK?=
 =?utf-8?B?Sm0wZytEeWx2UzcwTlA2US9DNGNtcHFsYUx0ZmdmSWpTTzJYakhjNmdWSFg2?=
 =?utf-8?B?NkM5NXBiY0JTczN6eDRXVmtmZ0dpMmtEemFmVkNmaThDVkdmZlJlNW9QS3lI?=
 =?utf-8?B?SUVVaDh1ekYwcXh5aStnOWRrYXBITlF5NEpCT25qNk83YVFEYmdyYUlTQmEy?=
 =?utf-8?B?aHZpUEdoa1ppMkhaYkUxWC9XK0RZamhSUERwSEt1NEs2UXZxZkh4Um9kN1RE?=
 =?utf-8?B?ekFqbWpMZUZKOEJZRU9zOVFtWUpTSzh1M2ZOSzVZUnlJVno3d2tlaWcrTVl2?=
 =?utf-8?B?M1YrTTJHSllzTlZZUlUwdk5BMWtkWGVGeFNIdFdCUkNkRTE2L25mZEtZdHRJ?=
 =?utf-8?B?Ykx4U2s1Rm45Q2lWN2R2VkNDcHlOZ3FMWk10Q0RlUzgrSGxHNVozaHlWeHVh?=
 =?utf-8?B?d255c3RvbEpRYXkxZ0hQZmVHM1FyMHFnQ3lXa1kvZ09TSng1T1d5bGQwZlV5?=
 =?utf-8?B?d0hibzNHcS92bnloNFhRVHc2QjJ1ZWRNcFJDV2NCL3NHSkFSaUVFOS9nVnZF?=
 =?utf-8?B?TmFaQ1NZZTBiN1YzWGo2UXZCamNESGNicTJubVpocUNUQ2psaDZDZlZEaFJX?=
 =?utf-8?B?K1g0bHQ5VHViWGVUT1JGSnVMZGdtTU5aZkowSGFFMWJtN2EzOFEwSUZndHRo?=
 =?utf-8?B?VjU1eEh5TCs0K0Z2b0FLb2h2ejBxZ05mVmdIZlo2T1hXOHJqV20raStpVG1j?=
 =?utf-8?B?SERvOUh2LzljWUNyK0s2NzByYzJkV1BtNWxHOXc2OUtVbHRMTGNkY001NkxX?=
 =?utf-8?B?SHhLbjIwRVd2ZnVkcUh2NmcrWjBQVU55d3Bsb25NK2ZxNkpvMzEwUFQrMzdn?=
 =?utf-8?B?M0d5cFhtMHJ4bTV4Mzh5REc4c3MvVW1jNm14OFdFVUdlaWRnY2ZhUDQ0aDNn?=
 =?utf-8?B?YmZNSkQ5ZHVhM1AwTnhKVSs2Mno5Q3M3NnlCM0h1MFVSVE16SEtRWGxlS3o2?=
 =?utf-8?B?L2NOdzhqK3BkaXFkZVhSNWcreUJFTHRPa3puaVlIY1g0MW91MWM5ME53Ymts?=
 =?utf-8?B?RmY2N1dxTnRGVld1UlFwczJEeDJraC8rT1ovcHc3V1FnSk5KcmwvQ0xIYVJN?=
 =?utf-8?Q?8zjcIzLvZ+SBu2iZdQzJHAE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17585542-1bfe-4bf7-741a-08d9fb62d715
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 09:06:58.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5UYzC5QHZtDyA+vvpWiVBN2/68kAmgZk2jmG770cj9+7hSfMmxOASTVZnoOtw3Uwj1HTjIBDxblFQyAMM8JsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5815

Defaults differ for Arm and x86, not the least because of v2 not even
being security supported on Arm.

Also drop a bogus sentence from gnttab_max_maptrack_frames, which was
presumably mistakenly cloned from gnttab_max_frames (albeit even there
what is being said is neither very precise nor very useful imo).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v2: Split x86 PV and HVM.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1177,7 +1177,9 @@ Specify which console gdbstub should use
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
-> Default: `gnttab=max-ver:2,transitive,transfer`
+> Default (Arm): `gnttab=max-ver:1`
+> Default (x86,PV): `gnttab=max-ver:2,transitive,transfer`
+> Default (x86,HVM): `gnttab=max-ver:2,transitive`
 
 Control various aspects of the grant table behaviour available to guests.
 
@@ -1217,8 +1219,6 @@ Specify the maximum number of frames to
 maptrack array. This value is an upper boundary of the per-domain
 value settable via Xen tools.
 
-Dom0 is using this value for sizing its maptrack table.
-
 ### global-pages
     = <boolean>
 


