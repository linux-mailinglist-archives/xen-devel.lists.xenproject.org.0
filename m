Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1E47006F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 13:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243798.421844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvefG-0007tP-7b; Fri, 10 Dec 2021 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243798.421844; Fri, 10 Dec 2021 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvefG-0007qu-4G; Fri, 10 Dec 2021 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 243798;
 Fri, 10 Dec 2021 12:06:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvefE-0007qo-4j
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 12:06:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e6bb6ee-59b1-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 13:06:10 +0100 (CET)
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
X-Inumbo-ID: 8e6bb6ee-59b1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639137969;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=243BZKrFaEkrzy+pZXedgzHVacNVCR+hmr8K9gkh4wY=;
  b=JiU2EcYr8deRem+FIRhkACLukoP9XLGdPyu7XOevjZH5qknPLOktRrMS
   ZteYjn3MbT1Vd0UlrJCYOkxamBiKiyQWteUcOc/skrcib5qTGO+RiGXJd
   qbYbp5CwtlifSU8upUQysy++fC2Nt7dOkISHA45uCAs2f9JbzRu5SLb3b
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: uB4u1xZIBR1SuyH0JqzIo/Dwe5/8nQCKlRr94cOVAT4NRJW5zWTqR9lh8AhcTF2N+lzLtOm5SH
 HQdLNEDk1EQtDO0TWx1uWp5wESPRCupEkPG/nG/fmg4kAtoCeBLfrAFwV14vvL8jr/yH/3Ijq9
 T5LDOYbt/P0lSFVy/C6zoySapboh4z4cQi8QJTu0/WOhpObgXolY5Z19XSKwp/O3SjyZ3gjNcS
 OYQTHLcJTXhHAn82sWStzkrYAw7FGTBgNwB0z9xO5yvZxm72d/ZxrAXvIvpF7baXXY5KDf3CLW
 b1NnlukQlYBoLbAHSrwpSkeT
X-SBRS: 5.1
X-MesageID: 61793153
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0QdM5qJJcZzYC0W2FE+RD5IlxSXFcZb7ZxGr2PjKsXjdYENS0WQHn
 2pKXzrSP/yNZ2Xxe4wjO96xp04HvZ6Hy9ZlHlFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH140Eg6w7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Ehetqm
 PAOtKCdVAwYEfPngulATUdhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvIAJh25t3aiiG979R
 sYnORVOai/QSBNkFW0KLcgwt/+n0yyXnzpw9wvO+PtfD3Lo5BR4zbzFINfTPNuQSq19jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfJW6/PN3hFyYxkQIFQYbE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrWS/pU45GNtsPvAx2S7T4bDZvhjHPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr5vmuVh6b/PuREDGQ3C94adO51qXHb4
 xA5dzC2trxmMH10vHXlrB8xNL+o/e2ZFzbXnERiGZIsnxz0pSXyJd8NvG8mdRsxWirhRdMPS
 BWL0e+2zMUMVEZGkIctO97hYyjU5faI+SvZugD8MYMVP8kZmP6v9yByf0+At10BY2B3+ZzTz
 ayzKJ72ZV5DUPwP5GPvG481jO96rghjlDi7bc2qkHyaPU+2OSf9pUEtawDVMIjULcqs/W3oz
 jqoH5fQlkgEDrShOnK/HEx6BQliEEXXzKve8qR/XuWCPhBnCCcmDfrQyqkmYItrg+JekeKgw
 513chQwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:lHgc7KjaJ5XNaRWXbljSupDrr3BQXz513DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ISuvkuFDzsaE52Ihz0JdTpzeXcGIjWua6BJcK
 Z1saF81kadkDksH4+GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 X4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRwXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqUneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpb1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY7hDc5tABOnhk3izypSKITGZAVwIv7GeDlPhiWt6UkWoJgjpHFogfD2nR87heUAotd/lq
 D5259T5cJzp/ktHNZA7dc6MLuK41P2MGDx2UKpUB3a/fI8SjrwQ6Ce2sRB2AjtQu1O8KcP
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="61793153"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD7PkDgLJaMLcHwjRnL/Eaf1fvfMx0BShl1q0FUG1iXjBV9OXyMHIOx1XpI0Inm8kuCw5RBlYmKW0PjDS3vVNpRbxjDSLRcOX0MQosjJkqfKKpXADATijIxi8Zwa9g1CVEq1iNE5ztu+do6C7LWuTZ/Ygvxjktp702amgd+0xpRWQEvl2CamnMsg0pf+xY1Z1fe8/N5vSpNUuXRXtBR4cDsM74ji2YnisnlfS2mkl4xuKA5u/qTsu3gdTvl9FZCvmLAoVsSdp1xoVOh6A0HcnO6/Gj/4LWWAwewy1dZlZOqA5vJAF3UBMxW8lbhUzgu5KghviOUs+ndS6p4AUGt70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=243BZKrFaEkrzy+pZXedgzHVacNVCR+hmr8K9gkh4wY=;
 b=TuDsrDoDbdsPYjUu2U+lFPs2xYxrnydXnCmP+RaZn4dpiYSGknRswFR7qGCd1o6KxA7X8FnVDM3i+uVmbWxyqOZzuyF+s+vC/hTv9Uank8nvMrAeqH9zCPOCTHYpiQklLm0UAvI+zp1XiwEy5kdKjVQoH0Y1OnQVeCV33x/qfEDQO41AinsG1DsSL2X6ul/aojEMzl4q66NQ5dCT008122Qmbk4X8yLPS/4mWErmeuw8K47Hsw3uH3LkoWEZxXmE6kbAtZPwhkCLxdBlqVg65hzI5KC72QmI0y2PqM9juqbm9f0jtTU03yRPDkJMM/qfh3Q3E9ifyuVAvYDY8VUjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=243BZKrFaEkrzy+pZXedgzHVacNVCR+hmr8K9gkh4wY=;
 b=OYsHGiJl0sBy6suzPAw8gjLYh+v8Wy0+bRtwRd+LPb4KTDsBj5jCej2udw6fRZSCebeKTBrUMPYHsO6AxNlQy8rHa9xjiEX44dnOZD30eDa8NnSzCBkokRMQztbjNyIq6U4FcCBTZkmn2vcaMnZQ3YWtZhZbFC7mjNtb55azRDA=
Date: Fri, 10 Dec 2021 13:05:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 11/18] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
Message-ID: <YbNCpA1PDtINnn7j@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <33819694-2787-4bd6-1830-6b4eb81cb4a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33819694-2787-4bd6-1830-6b4eb81cb4a1@suse.com>
X-ClientProxiedBy: MR2P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dab30f1-4fc9-476d-5f73-08d9bbd570be
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB277780728259E4525731B9268F719@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruKoJ75JpVTqVc3YrvFlHndas52iB0DeCY1qNHh31vyalBR2UB0aXhmW9sMBsfjXetwLJe5c9jHmSHbutSrYK+TzLVbN/qGIYuHcI3IeNtbbH60KJP4ZnReQDc/NV+Rf0GChdhsB1vBO538hf1Q6TbhKtkmVTN8OzKX3ZEi/puS/7Xh+7y8FG0qPKZ8OcsMERKLSIIxkuE3EFT6cwoCZwzEo7lXpj4mDgcDOaBtv5KRQFqNQmoOJiCjLTMfJ8GwCspY25Ltwp2dy0VEkRI18Mue0MQNQFQaZCZAx1NUOd12VW+FJKewcIuiRiM2nHGjSoQMObDyIsUt0Svj7z0Zkjk9rMLvg+v/K1NsVK12T4Tpy8Um1EfH1AyyBLeFL81P78HiLaOcPMLws+1xFA6nH7YhYwbaVk7pbp+oZKb6K9eSC3XTSraHI3ZbV+55Z7IVPEz2rZ3EXrTJCjuOHI2z8Do+dlyaOwXAO33zRUypYLUkWQ6ScMsWtDtQMf2wJhx4JsO4ZvDgqZ8MNjxxIpMP271GEQs7BSsAWODOkEI7vFPo6+9HgaH/kPamP5Pey75ZpRKFRen58m+b0SXHvxIzfIMYnN7cTI8xjC5cUbu3r1YLRkoHUeyo60HvVhvVj5V9heMvJJ1nKESCM2z67xAnH4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(316002)(85182001)(4744005)(5660300002)(508600001)(8676002)(8936002)(66556008)(2906002)(6666004)(66476007)(66946007)(9686003)(54906003)(26005)(6496006)(33716001)(6916009)(186003)(4326008)(82960400001)(83380400001)(6486002)(86362001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ZXenBJdlNUVXNOblVTU0tIU2NOR3hzTnlMc2ovYisrcWpUdVpUSjA3akNR?=
 =?utf-8?B?eE1IU25pNytIS0NYUGxZYkc1Ky9Vd2NmeGdsaHhzM2p4VFo5Y0duUDVDWVFx?=
 =?utf-8?B?RjRTT3Z6K3c2Ync2MVMxejBWbTRhd0JJVjB5OXZTUDBqdDBLSEg5VUZrbXhs?=
 =?utf-8?B?aGpwa1RRMUE5OE5yMDJ3dmZNY2JvWStoU1JVRy9JQlBnc2Z1Vm5DVlh1QUQv?=
 =?utf-8?B?d3g1MGFLV3JDNVhRbUZVNjArZ05VdFI3RndMb2FhWXZoSXY2emVGeitVWG5v?=
 =?utf-8?B?TXdwUkFoY2M4MHA0UVRyeEJtWEFXM2FDN1lWK3JNdWZwKy9EeFlPdkNDNm9C?=
 =?utf-8?B?N1RBRWxpMy9VVlhUa2xwNVRieGFvTVlCK2YrbzE4ZE1hcW8vRkJnZVFXbW03?=
 =?utf-8?B?MlMrRTdJdWJzcWdGOGVJVWJGRk5rU0s1ekR1NHZWdS9ncExuYll6dnRjM0Uz?=
 =?utf-8?B?STNjQTRwNHlxblpNRmlmRnFWUWg0L3lQS1NOSzNRNnM5UlI4MHhFNmJSOXRo?=
 =?utf-8?B?Z3JiaXo4WWsxbmVZM0RrQi9zUVlrUlU2aWo1VmtVTmdjSHk2NExCSUVqR0Iz?=
 =?utf-8?B?OVpGSnBpKzVFK0lUYVdqV1hTMjU4VThzeGJua3VLV0RXNndWU3FmVWhBNFE1?=
 =?utf-8?B?NEh5YmFlVjRHVmg2MGlDalY1MFZhbkFjU25SK1FWdmZ1SjRUTlVKbjJmR2xa?=
 =?utf-8?B?bVIyUDJMWThDem9FdE9mU3NvckM2SVE5cEtoTmMxT212S1ZVWHV0Q1dzNmYy?=
 =?utf-8?B?NHpaRmF6K2x5dXVBdHdXbDFUbG5DQUpqSWpRRk9XbStPUUYrWUtNV1BwMExy?=
 =?utf-8?B?NTVoRXpDUjhTdXFLNmpVaUF0dVBmSzJpRUt6UExXMGNRV2pqMENleDhULzFw?=
 =?utf-8?B?YkgwaHJNWjJ6RWVnV0t6Q0lPaEFYeWc5ZmtYT00xWHc4UzUrb1pCM1A4MFRp?=
 =?utf-8?B?S1BISzlhL2NTd3FUMTNrc1lPVXcwTm5ZNTBuelE1N3N5SXdLK2VEZEtWSjky?=
 =?utf-8?B?TlRIWjJGVDhNeXdqbDR4T0VXRXFKTWJZamV5SU9UVlZNZlBTRkVZRFlqOWFX?=
 =?utf-8?B?TXBURUV2QmN6ZkJmdTltN25GRy82Y1h6bHkwckZoU2x6cU41QUNUWU5Ob3pP?=
 =?utf-8?B?T3dSWG5EcmRLQ254aFMxYy9NanVwalhSa1Q3NXBxOFVjWTFTRmZMTC9xU055?=
 =?utf-8?B?MFRKeHp5UU1OYVdkK2l1d2hwSjFPWmgxMU9GaXBjeXNvR3BsK1A2UUplSkZj?=
 =?utf-8?B?MnQwa2ZSTW05M2Nrd0FZRVZzblUxL1hzZFRTNWd0dTczL0xIbGh4SGJyeXJJ?=
 =?utf-8?B?YVBiUVVxalpLcDFVVjFaanczTE1OekI3YURlajZSajlHc0VXakgvemZpNzNQ?=
 =?utf-8?B?NmJEUVFtUTk5anRJTVAzWEVYSGFhc1gyZHg4VGgrakxaWktRTWp4cHArMVlN?=
 =?utf-8?B?RkZtZzJjY05XMitYRGh3WVhVTVJLSytqSDMramwydHlhekRZN2taZ0Q5bnd0?=
 =?utf-8?B?VTNaYjNFaG5ZMnFVR2d2emxVcTdoT3RqUHVmVXRQT1k5b1g1c0pRWU8zdXR4?=
 =?utf-8?B?SEpOYnMyditZd1U2RHFXcmR2dEZnWFU3cVhLUmR0bW1HVXZLdkpZdmtLQk1v?=
 =?utf-8?B?MUtzWHJRSDdSTmx4L1BMSUdKR2RJRFM4N2gvRkNCaEltbThzbTJKUldXc1pw?=
 =?utf-8?B?L1YrVjlxUXZVdXAxUmhrRDBqVW9iRVVtdWkzRHZlQ3RDMVZId3pvWTNNNVN3?=
 =?utf-8?B?UmJtcGRJYzJlWVBzVUt0K0JxRnN2NEVwT1B0aXFDTzA5WEhnWTg3eTBacmx0?=
 =?utf-8?B?NVVUTzF1MUxZUW9iNWovbExHSy9LU1F1ZVFhVjFTQWh4bTdYSkh6SU1hcGhh?=
 =?utf-8?B?ckNZcE1xMHU5RGUwR0JvQmowZmZNdklEUXJZdmdsM0hwKzNWeFBxOVlrWVVh?=
 =?utf-8?B?a1F1QkZHWCs0ZGpObjNrV1lLbDlWeTIvajdnYUx4TS9KZEt5UmpaeHljVWJH?=
 =?utf-8?B?VkVEcFMwWFdPY3lXbWQ4NTd1a3BoRVR6SnhPZkdwTWlVdlk5b0w5RG11WTAv?=
 =?utf-8?B?THhJeXMzRGMvRTg3dWlQMUx1cEtUQlAyUzBQZmR3Vkk5Tk5BZjhGQ25OYjR3?=
 =?utf-8?B?M1lScVVoOTluR3hpOXBuckwwUzZEaDQrcUdTdUM0MkZwN25IaEFlTkd3V3lG?=
 =?utf-8?Q?S6kHBMhy+xN4HH4m3crORxY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dab30f1-4fc9-476d-5f73-08d9bbd570be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 12:06:04.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tN1uIUSslARobcHdDAiNKA03oAVFov1XLHmZ9p2shNrzgeLmO8yMvKnBoaD0JHX0KntL07IezCm9LvQBIqFfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:51:40AM +0200, Jan Beulich wrote:
> In order to free intermediate page tables when replacing smaller
> mappings by a single larger one callers will need to know the full PTE.
> Flush indicators can be derived from this in the callers (and outside
> the locked regions). First split set_iommu_pte_present() from
> set_iommu_ptes_present(): Only the former needs to return the old PTE,
> while the latter (like also set_iommu_pde_present()) doesn't even need
> to return flush indicators. Then change return types/values and callers
> accordingly.

Without looking at further patches I would say you only care to know
whether the old PTE was present (ie: pr bit set), at which point those
functions could also return a boolean instead of a full PTE?

Thanks, Roger.

