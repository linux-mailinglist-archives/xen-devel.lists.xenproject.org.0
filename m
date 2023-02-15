Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00946697F25
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496040.766559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJOp-0003AY-Fz; Wed, 15 Feb 2023 15:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496040.766559; Wed, 15 Feb 2023 15:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJOp-00037d-CK; Wed, 15 Feb 2023 15:08:47 +0000
Received: by outflank-mailman (input) for mailman id 496040;
 Wed, 15 Feb 2023 15:08:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSJOo-00037T-58
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:08:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a34ca140-ad42-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:08:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 15:08:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 15:08:41 +0000
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
X-Inumbo-ID: a34ca140-ad42-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJMEqDCtqsW88J+7nFgVp4KSkaSxp+opvhoOviUvwV1IpHY2uP8gwCOJYb6/ruQgFGhMMmfnRjm1Ha6JfVB8nZ3IxdYrvbPMo0GsiY+Bw4gr/syS5cU3ywr+omuDTZ5YtQ1p+mVHnWaicCQe6u7u7eOH1I4fB4PKf07vKom16pbGaK37boLWqgXk3PVEBTPLoCHxJYDvGvbQ2jC6fP06Hx8N8qqCX1i8SF83ukoClfM70A3bbgjmmGzbGTqfhww9hHsQm+aIrfQHA0xSqfwwlTQDKEDYOgscZP3Oyw73a61i4g0At5CunGRXb4bNow3pC19jAGKsjCh1wLrTS0Ho5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyt9Zb2uyb7Ppza5owbKi9EJTd2x28VYqhSfL00cOqI=;
 b=NUxtHyuAi12RV/hRAA3vUFqsgjtcK6D0apSkq+eEZ5ptrpmTkbaIB5s63R6H3iJ+pSBU8wRQf3yRoHJa3r5lWLCru22cKONzyMhrIXHdSbQyVZ7COLf8nXaE2aZaD+3wdlb311Zpwp8gvnjtlUX3xDan19pjaI0TvlzaEE9y8UWK3iLaQ38Ir1V3khGcNAZ13PEPj/PmlMPA/xCE6Wp/YrYoUbD8VUwhBXahb8uYVRVFmErKURzfk8qpKchzlOHqSyXq6n8TYyjhLbzdYBt186ggOBEYjGU0uGMdoe7cg0+h0Ybk1QoaHH+TJKzNDmOdwhjlvojkBlGRB/VwBm3n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyt9Zb2uyb7Ppza5owbKi9EJTd2x28VYqhSfL00cOqI=;
 b=r9i1Mur7lgtTDcdFfn2/yU8aulFg26WbqIUTOyzKdEuN8VWo/G6yVXS+ySsdP06tPCFqEqefTk7BCmZFkzkUFD3i9KfOq53wjQEq+s1tQpqYEahV/NKY5bMHNnBSdV++IlXkWXc5HZTKn2ZAlgEQFyOVYE1iMmVBHRzCqH5Kv1CiMDEz4F3z+n8E/g7ndKBVOx7KJzRSRJ5pW+YjXp8y/FwrBRu0ge9zYjQL6Dnhf5hZHlHFV/9jPyHPVYWKL5SonmSoVIP3uvVP238aMQspiOZps8A4k+MhK58/PZVM0klcMcSHK+iTZpKDoOWiIrY9wKPdOi1FSQXHUgQSdscg4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e58ac418-b044-eb26-308c-5ddaa021daa4@suse.com>
Date: Wed, 15 Feb 2023 16:08:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libelf: relax ELF_PADDR_OFFSET && !VIRT_BASE check for PVH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd94585-647a-445b-c469-08db0f66863e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d6zHFQTyspvI8qYT5WCpqTm56vLh0ePO9PKEFC1AKhH/9EK0nkM3qZJxkKEWD0C3JwTEVDQdzI4ZjI/mmmm25RM1leG9j6t4l2RCVy/bXb8MemJKu66GdjGjKuphc+/ZRi5Q7k9YVgylEXGWcxUzojNamUurDqGrxmQs5HYo/TAxJG7c6S2a61E7cwZN8OFlwK9t5eicKap1MX0uErjCVqc5VJqcxBQv/A1aYaP0jwWXQNJ0bh5NHgbr04eYiuj9L7mVg5TxELc9Ad1mfm+vEdzSLJ9ft6xRQ9wZoGqyjDBa1bdvExTi7ocWPWHblFK7hlx1EvM7PG8vYtWlxcrCY5+kZWv0b60wks3GZgdFDNC78zZyXgGGZnJpqV167S8qgsk4XU5BDVmo4Dg/7/IRECxefDjFUr5VHZe1spntzkkzghUmex3lb/H8RHWdN9gaRYik9RLPMB6sD3fT8yMibQdwhCXAi4rTVvJQpWgHilMAdgCLTuZ7yxU4a4JHAORockHE8O53O6qUtKk0hp9xe1SeO2h1DecVBQ0kxPbc/hbPo2TbuM/E4uOAQRoN2E1Lf2O5VAQJO30W7kSdVd5D5R/zu1yl8PRRioKShZ7zeSt3JM3NaaH5HUlYt955vql16dFK6r7MQia0Rz0OP89mDrSbDt2zBCYZpLf18NUrZqv2A0+eWNhqh61R1+Ex3CEayHh22s5XWdHCVS2U5opfTNlUmIhJfCYdI2w90eatOn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199018)(31696002)(6486002)(36756003)(316002)(54906003)(6916009)(66556008)(8676002)(66476007)(66946007)(4326008)(2906002)(8936002)(41300700001)(4744005)(5660300002)(38100700002)(26005)(6512007)(186003)(6506007)(2616005)(478600001)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1dyNWliUTlvWCtkTW93UDdpaWU4bTg2U2U1N2ZFTGZlWE91TWQ0aUpwOG51?=
 =?utf-8?B?VCtnLzNUK0FKVVdCK0x5VktBdVhxckNiQUVJM01pdGFNdTF0cTJ3MGxkdXRJ?=
 =?utf-8?B?UW1sZklHcndxYnhFUjhCam9FN041anRaZi9MdWdSTis2N2hLZWZjTXVyTjNN?=
 =?utf-8?B?bVJ0c0lXdjRFT1kvRnlPV1BYMnJaTml1YXpxSElMWnZRZ0xxQlVKdGR4ZEVn?=
 =?utf-8?B?Y01VVkhub2hPZ0d5dEFSV054WlZtbVN5Y0NncGQ3R3d5aVlaRFdHUmYxYWdN?=
 =?utf-8?B?Z2hFaGswcHBUVXViWjBBV3d2OEwway9nS0ZEMVlaUUJNYWoyc3F3QkVTWHB1?=
 =?utf-8?B?VmU0NEJXZjh5d0FiOHRBKzRNSTljS0RQU3FxNjBVYWo5TVpXOTlNSzBtZC80?=
 =?utf-8?B?bEc2c2lxc0U3OW90U2t0aFN1bC8ySnNWMDZMRzlmNmNXKzh0Z0RPV2JvZ2s1?=
 =?utf-8?B?dFNLTkR0M09Db3ZSZXZUaVdkVFV5MGo2Qm9lNVZCVW8xYTEwWUkrempWN3E3?=
 =?utf-8?B?Y3I0c3N4VUpWUDIvRnFQc1I1dExDYkhGUmZJdmE2dXg3RWtxRm1XV3QzWWFq?=
 =?utf-8?B?Mmg2eHhTWVFSYnoxOVN2dkFjcW5CVWlJT0dTVFhHZFFWTy91dkpBVUhHTXRI?=
 =?utf-8?B?akRpMzNDVnhRaGVlNnRlT3YyRm80NUg3eGt0cVkyZEJMZVoyalFwSjZvV1BZ?=
 =?utf-8?B?andZSm9HNnhvVnUxaktTa0Y5cVhSN1BLcU9HMm81dnBxL3UzVlhucWp3ZDNC?=
 =?utf-8?B?ZDJRVGd3WTdOU1o5RlErSEo5M1hvN3cyaHV4YjB1ZDk4ZG9xQ3ZRcFBpb3lu?=
 =?utf-8?B?dyt6MjZLdGtUVW1oWS90bzc1a2N4cTdQdHN4Zk4wWUx5RHkrUTJDVS9KT09G?=
 =?utf-8?B?OTl4SUhEMWdhQlRpM25KbGlNck8rV0ZuVU9waEZZUEhKa0FkNk9Ud2krRU9X?=
 =?utf-8?B?dU1zZ2xBSEdIeHRBd0orMGVUbFRzYnBnTjFmRzZuT2RCc3NjbmNzMFVKMjJY?=
 =?utf-8?B?SWk1K0tuR3l3b0Iyc0UzWkFNOENDVHpvb3FZY0hDRlhkKzRwbWJnd05yazVj?=
 =?utf-8?B?ZWppclVhS0tDMUFQamJaQUt0TTVVUUs3ME02TW9uSmQwcFhMMzFQRmtKeHVr?=
 =?utf-8?B?bjM1S0VJRUNiOERlWkdnVnAwQzRlUUpaelA4L1RxbHo3VGJEbnkzNG5BRHQz?=
 =?utf-8?B?dmdSOGNBU1lQM0F0Y3ZGdURHeFlubkVObmlzUFpZM1RoSTVjb01IWlB5eTlV?=
 =?utf-8?B?RS9od0VoZ1RxRkR5UlVrVVJMc09CNWY0TC9La1UyZ2dJcW1zUWxmYS9EaXpF?=
 =?utf-8?B?NXN0c1dQS0YraGtnVUN1Z0wyb2Y2c0k1REhPSGdialBwR09penJpa3hRblBX?=
 =?utf-8?B?L3RFb3h4UDk4d0lqSzlYMDZ3V3doS1Z1YmsvMnJyNHZWTHFJTlBtbXVkaC9D?=
 =?utf-8?B?eEhJWWtMaEQ5MUFCbHNsQWhPMExqbFp4czhqTjRiODQxY3p2WUt2enRLa1ZV?=
 =?utf-8?B?elUyVE9hblBLVEZJc1FHUmp4eFQ4YzRHZnJ3NjExWjBMekh3eiszOTBQK004?=
 =?utf-8?B?c0NEalJuR1JMaStCU1ZzQXJ3WVk2SVdpZnA0VGJSMTM4bzE4dVRoMjQ2MjMw?=
 =?utf-8?B?L1VPMFp6c05NQzMyYVlQM0V0ZUVXZUFPRHNhclRxMUNOeFl0TkRuTVRxaGow?=
 =?utf-8?B?T2tvUmJqRjlYei92bUhaN2dBS2dTeThBaGQ3L0VyMWpZQlhSRDNuNDB0bENE?=
 =?utf-8?B?QWozamV2WGxFZGJIMVBhWUZmeDFLRXlpbjJUQS9zcHBGM1hmd2tKTkt4Ui84?=
 =?utf-8?B?aXpSUWtPejYrY0RaZ0M1RkRRbTVQdzdTSTVWckVFT3J5R3JZVDI3dVprczRE?=
 =?utf-8?B?RzJjSlk3NklzbEhHWHVRTGJNcEdEdUFJSytFT1doeDBZaHFrUTZWUFpKaFZN?=
 =?utf-8?B?TWhRWTdRaDhNbDdOazNaTzg2YVhGc3d5SDFPa2w2ZnhvM2E3RXRkTlZqYnVk?=
 =?utf-8?B?a1NSSzhFK01pL2EzV0E1ZENWeDUvOG1FdlBSRlJ3RHJyd2VHVUdWNzNtUGpM?=
 =?utf-8?B?Sm53aTJRUlhlNVhmdmVlM2NlN0lZUVIvVkE2WW0xUWl2VE5uOERTaUEwakJL?=
 =?utf-8?Q?z1DqqPUdCElEdlsvxtbhLSx8v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd94585-647a-445b-c469-08db0f66863e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 15:08:41.7960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Y4M/6o7aKlNzM3G/pFpOgTsGYBA9hk9PxPafP1kh9J6Ik6LykToBPMlPWyhhyukO2qVwBCak7xTXA9a8FvOzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

Both values are unconditionally overridden (to 0) in the "hvm" (i.e.
PVH) case. There's therefore no reason to punish a PVH kernel for
setting the former but not the latter.

Fixes: 632cbaf1243e ("libelf: improve PVH elfnote parsing")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -419,7 +419,8 @@ static elf_errorstatus elf_xen_addr_calc
     uint64_t virt_offset;
 
     if ( (parms->elf_paddr_offset != UNSET_ADDR) &&
-         (parms->virt_base == UNSET_ADDR) )
+         (parms->virt_base == UNSET_ADDR) &&
+         !hvm )
     {
         elf_err(elf, "ERROR: ELF_PADDR_OFFSET set, VIRT_BASE unset\n");
         return -1;

