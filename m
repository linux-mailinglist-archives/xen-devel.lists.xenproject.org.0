Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CBB75A939
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566462.885283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOzt-0001QL-Gb; Thu, 20 Jul 2023 08:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566462.885283; Thu, 20 Jul 2023 08:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOzt-0001OR-DP; Thu, 20 Jul 2023 08:26:53 +0000
Received: by outflank-mailman (input) for mailman id 566462;
 Thu, 20 Jul 2023 08:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMOzr-0001O5-Gb
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 08:26:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b136641-26d7-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 10:26:49 +0200 (CEST)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 04:26:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5760.namprd03.prod.outlook.com (2603:10b6:a03:2d3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:26:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 08:26:43 +0000
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
X-Inumbo-ID: 2b136641-26d7-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689841609;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9odFqki64rKyeoVPmm6bAKQwz7RRtbjMZwx9nGDnCx4=;
  b=FzK3sh66I4IPWin5Dr0wwV1cuoUFqqaUKVi6Zy5zhN0jyaC4Q9Mp6QYH
   Od9FHd0+Wd726sRkSuVUibyArgalf4oclU5x4+YooXhMLv/mqTrZL3VYH
   JelepN07D73gJ9nrkeJEslHMOi8ubceWpMmpzLPb34cCRhCybxHpkOibb
   k=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 115538979
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9/PeAKweDuCGcmpEawV6t+cTxyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 mMdCDiHPP2NamCjKN5wb4nk8xsO6JfTzIdmGgM9qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP6gT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTFV2
 e4cAw0AVwi8oNjs5uPmE9tUpu12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aSwHirCd1DfFG+3tdOnFKymzItMkFVVl2SqMGgrGu7BPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8kN+pES0cLGtHbihdSwIAuoDnuNtq0U6JSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNTNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:9s1HVawzQFNjMCBELLnuKrPwL71zdoMgy1knxilNoNJuA6ulfq
 GV7ZImPHrP4gr5N0tQ+uxoVJPhfZq+z/9ICOsqTNWftWDd0QPCEGgI1/qG/9SPIVybygef78
 tdmmpFZeEYwWIUsS8y2meFL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3A4Se9Wmip0mjARy6douW/zbNVXDJuImbx3nP7HkK?=
 =?us-ascii?q?BEVlOcuezGALJyptEup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AEuPETQxSFvgaetpqU+pzR3hRYNiaqI2KFE8szMs?=
 =?us-ascii?q?4gZXHNipZMg+EqhGyHaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="115538979"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1LVg1QaZRBSVyEnnrIYkbylwATumVSL0KuzLEbsN7E8AvjLN6RKTnfJkoXrSIkYpX61k7/bLtfDqybxkEQ/c68fez7LyQ1JNNMG506FUumyx1qgQ4Q/b1hSgZpFdcoia4JiDFMQTzuk6apOYg66kY8f3uYYKb5+kkHhiE+CXhimzk6BzkRGOI1E370V4zyL7zts0JI10WA6qUB224vkrFbQVC/SVFEKtiON9EQAidZTchiT2l4eUSbDoQ5Er9EIC+oeE+mF66tZ4uVF9ghBQHv7WqGnVgnVc2fOnSyh1uZTa/s0sQ0iKpotd8aTlKHFTR9quoBLiWm3JXcfOq91uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX4VOM1tHRqTye6d547CIc/vhKURIdso6ZiSTA9xbXo=;
 b=Sh2QV5dwk9I7Yqx9Q9EnEmcWTfItm1KDW72QWbBYagUGZ4Vmi+RwjbgQhPMghH5P/CKqQ8r/WQxGg53z+RUwSxFmwhI0N9iITvr6T0jWHMPNibyQuU9GuHaKPDBqxPh6XdO0HNniYKxCHMfls+FACPT35p2mJmLbWtuinLJKVAWCYkBbQxVl/W7miJUq8O98sQY4iYS0VxFbeX7LBiRx8pysvoqnGRk6A7+L8HEgCj5aoF0F4qbDzSIEcXs05a5IBs4KRTISKgtV0Z5PYYpVy6r/uCv8dq9T3VwbtUqBSebPNbWouDKRvbZlrcjQgOS6+H2DbactTMjmaBTrgXIrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX4VOM1tHRqTye6d547CIc/vhKURIdso6ZiSTA9xbXo=;
 b=lb46wsrk1U3GkhCToJIUiZrJpM/xgqgdTvtLQId69+3RLVvjb9B7TEvw30Ggh22T4jaSacsL71m6cNOCZUO1Q70aSB5Al2gJ+nxSSfAEE3QU5up73KRJXVy2csC0M6umbYMoPk8IjPRm7IBkBnKi6iS/m+9/Coo5+81OTQ2r5mE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/6] lib{xc,xl}: support for guest MSR features
Date: Thu, 20 Jul 2023 10:25:34 +0200
Message-ID: <20230720082540.69444-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::32) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8259ae09-a71b-4ed5-ca4e-08db88fb0c88
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9GWxyq9BOOIOskf1CzC947ndc3ZD85pAPN+/XPwrQjs4dLXVJx8mh9QR444HN1XF7mf2iGscL/RmGcxjte+Jl8A6kehho2szqoy6dCP0xdcK/46ZOLDyKz5oOhRpUYDnvQlmi3e2BX+eXWF7LZgrK1pmYq5ZoIGQYYnLK2C8oa2oJpeiJ7OWMOnP/HmGm0GNwD0nNGX+F8LaZDkW8pXrGA2haxbuLLXRdre5X984TY2MyJ3h62O4A9wgCzOwmnHDhNENGZnPfVoF9883rp1Mjaawj1wi+XU6jT7sF1rBFDATy7o6ap/s+iU0PVuSLZxHAKygOOdbFyFeRvpE1djt08mL87DyzhWG+pxOTBbrY5kM+xqBRzJOVxm69Y0mrUYNWp5uHyY8nAxIpoShK2q2YaGr0CUJSUGIQxUqN186h+JT3mYFGirB/cEPQ3/0gejI2JBjprJ90cLHWVTpznM8m4hZNWZB1wlt+dbIQbGYr8VnVdryIAauvA6l3SI/xuNkYgEqVrwpJ6xiRBjVIYOdj6u1i+PWZwcgRLbsfrOo7cTFq+Rp/cDZrcFjENyobpy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(86362001)(478600001)(83380400001)(1076003)(186003)(38100700002)(41300700001)(26005)(54906003)(6916009)(8676002)(8936002)(316002)(2906002)(4326008)(6512007)(66556008)(66946007)(6666004)(66476007)(6486002)(6506007)(82960400001)(2616005)(36756003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXhOdHQ3aGV3Y1Nmd3c2akhLOXdEcFRaWkpoL1R2NVdOTTB3M3NXeU4rTC8x?=
 =?utf-8?B?b0kybGJ1aW9XZzZrTFQ2UVo1OURWTzg0MXZ0RnhmNDF3emw5K3BHQllWZVBZ?=
 =?utf-8?B?NnZveGQzYnRYelRnNGZIOTBNOEFWRmhnQ1UyRFJpVXFKRUxRaUNvTmF0ZVk5?=
 =?utf-8?B?b0FrYXB3ZE9LOWVsd240aUM5MXJCc05YYmdWSjAzcXhNWWVzclJaTEx0VlBv?=
 =?utf-8?B?ZnhFcnZWcjNWMlIzRmtrWXEzd3ljK05na1loMmkyNTNTMjVDc2tmY0w2VzBw?=
 =?utf-8?B?VjR0NkJabkkzMkJMWS9sdDVqemtzc2lRM1ZrVXJ3RW14emNGVWt6Z1E4L1kz?=
 =?utf-8?B?eEdEQXpjRHVRT1ZpNTlwWEZNaVVPVlMwQ3N1K21mRWNUVm95Z0FvQ0FoWWpU?=
 =?utf-8?B?K3psUjFXY1preFdEN0IrbWpQSExDZzMzcllLVklwcjJxRFVmS3hXamx5QkI1?=
 =?utf-8?B?bzgwQm1sQXh1eUNJay93dVJESDNNWk9lSkg5UUZGWlFOdnRaZE1XMzhYWGdY?=
 =?utf-8?B?TkFraWVJTGcrRWNrS3FOMHNVN2J3VThSNFJPVVVLNExKd3hZWmllZWZTdlZE?=
 =?utf-8?B?S3FUcWdLdCsvZld3SHp1eGZSbTYrTDczTGJLcVFuTkgySi9tcnc5ZUVaQ0oz?=
 =?utf-8?B?SnA3UGUzblE3eGxEZDQ1bVJqTCtoeTM0RWNyb0JiYUJhRkFJME12M2l6VWR0?=
 =?utf-8?B?Y2NPd1I3eHh3VmpMdWV6Uk1XRFVNeCtGNHdWYmYrWDVvMFozOHc4UzBxTldV?=
 =?utf-8?B?OXVnK0tkdFRJRWRxaEhVZU9udXhJbmV4WkJId0RuTjN1R1c0U3lVRVdZdE05?=
 =?utf-8?B?b1BLWkNXV055eE9vMmdYQ0JMSk5mYXF4bmtpSWloM3poTFhIVTJ2cm9YV3lh?=
 =?utf-8?B?bTNqcVdaUkh3Vm5salpmQ3VKeUVsczZlSjUvUzlwZ1E1aW41b0tlTWlFYk82?=
 =?utf-8?B?V05ZVVUyTGZwWjdpaFJhQWRCakNOc2FEYmYzUWVHaktkYTVZTUZua0JPUWcv?=
 =?utf-8?B?RkNMQ3hJQjVkN2tna0d4a1V4cmR4dDFOWjB1MWRnaUxLTVNCeVB3Yit1RGYv?=
 =?utf-8?B?cGwyZkVDd2ZhUDNscHdIbmxvWFNCWCtXUzRQditnQ21uQmdpSi9oKzBPSnlz?=
 =?utf-8?B?WFRVZ29pcHlPeUFMSUlmR3c3bDNnR1plb3J5WUVOT2ZrVG5YL1hCVkY3bThk?=
 =?utf-8?B?QXY1SkZ5U1lFNG16TGpHMERNZTZMTXJkdDRJMzN1RFFUSkpNRS9sWTRRbTJL?=
 =?utf-8?B?Rzd1OEJLaE8wbXlsWVQyT0Vua2t6S2NsTzRtTnJWWlhjUDRRTDUzMU1vNXBT?=
 =?utf-8?B?bDFGaitKNVB4dlBHOWl2T0Q1Z1ZzV056bjJWWDBmVFFnTjlGZlhVMEd3R0Zy?=
 =?utf-8?B?d00zVTVDV241RmZER3VOYXRyRnJFQXMvdXBVU1Vyd1o1VTF5NFR6QWNvYmdn?=
 =?utf-8?B?emhYU0tsN0JzNzMySTJKU0dLKy91dEk0d0RQNzRuYXJjd0FDUDF5RWxhQzYv?=
 =?utf-8?B?aFZyOFIxYnI1dHJKTFRPK1RneGhQaTJpTU1OVzEydS9CUDQzNGpKbXRTOUlh?=
 =?utf-8?B?clN3Y2poayt5eFJIWnRJcFhtYnVkTEY3c0xhNlJpSHNXcDc5SnVqcm8rMUlF?=
 =?utf-8?B?VFRxNlBOemh4bXNrVk9GL1Vmbm9KRFRWMXBDM3VpTG1zNXBkWXpZV2JhcDlB?=
 =?utf-8?B?TWw2R0ZyK1cwSi8vdTdJaVY1RGlJem1oWW9XZ1FvcGlhY2x4UWVHaVEzSUV1?=
 =?utf-8?B?QXVvOXEvanBhVExHQnVsaER3MHpqQXB2b0U4MEhQU1pSV3VvdUJhTDgxRW1N?=
 =?utf-8?B?TDBKSjFEcCs3OC84OTFSNThweGV4K3prdWpueFI1Z3pPZkN2VEtRNkQxOUlF?=
 =?utf-8?B?c1oyeEp3bGpLMEcrWFd0VG1tZ2p6NU5YL1ZTVjRiRjhucDg4eFczY2RMSTRG?=
 =?utf-8?B?TzdyS0o2RHhKdit5cHRFTVl1amk1TjR2dVFLbkZPT0RwNFoya1M2TEJQemFt?=
 =?utf-8?B?WitGc210N3l3aDhhZ3h3NWJLdk12ZWpGdzZvL01qSWhiV2V0R2RqSks4cmc1?=
 =?utf-8?B?bjZpNnAycVl4VGtDNE1jVk5jU2R5WVNZNDRmejBRT3R5T3RvNTZncDk5ZUpm?=
 =?utf-8?Q?cREJdMd4Ij+Rc5vxVyrATyVzu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nedikQGVWAAfGaRMnftuJblZrcdGxIpubAZMXHNYaciKa6zNMPp24RIEmY54t4hSOFjrIXSuWSho2zfLcDuqsCrIWYHN6v1jDWJFSW/mU4tNDiT3ZOJ82BzM12/VgZP52J5lsvu3vyQVA1AN2zAXHM9YHh7hDVvqwaUs5r7qgT0jsBR2EAz+shx1tfirBy8tMPRA8E9Op/48cWqwyD7wJThkWTDLwG5julgOXKKKdEVLONfb3BiMMZ3oQyE4mj3QH00OMwRUcR9nMQEi69illL/CR3pptV+Auq5tO4Vx2WjsDR+vsi98EeGppb8AnjTZADtQLZUmVPUOP4Y2psE1Ny/z8JNo3HR5FIsQ1fGDr9fAibuVdXrK+zaysk+4v1VjTy3o19Ez/tWxgzKBQQHb20X3ccdDWgrDsvqrKroAtZw0O7z+rLVhz9xNaV4Rn2YkOWaldsOyuHCz99D+4ICtggcXfqd+FpQdai4o69mamJ9DMDc812y/1/eBRAH84w5aHDIhrfIc3MM638A1hql0zyg2wLJrQfOoe6NeRH0bepp6DvBjqCgvFfnhW1vmzKR6CaJ4P03M8MyMmJ8pZZnHiVv0462Q8YgJOt94QkgMYhTM4AIO/ksZ59xcu0Ct/ItIQBJu2AZ2wIg3yrSbtXQO+HlPN0PrFpW31kXTrPB4lxoZUnhbbLMHDqYlCAiQFZCwguUq+RR7UmN/SlvhhpUwffjNIryXzRBkvJ6PzemhtkpG+pbS37WkdX5JCNEjsuWg9aKE209Vj+IefNYDZ9wehDCskIRPIcqUA83q3N8EVCafoDyBYXoPecdyu/556HN+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8259ae09-a71b-4ed5-ca4e-08db88fb0c88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:26:43.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QoYTENKm/GOWxZfnp90VsQhSdupgDQSnqqp2QupJAkGyRMb41LznElfeBx3YKkBCyDJgHUM2sMKyG+OQKpbCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5760

Hello,

The following series adds support for handling guest MSR features as
defined in arch-x86/cpufeatureset.h.

The end result is the user being able to use such features with the
xl.cfg(5) cpuid option.  This also involves adding support to all the
underlying layers, so both libxl and libxc also get new functionality in
order to properly parse those.

Thanks, Roger.

Roger Pau Monne (6):
  libs/guest: introduce support for setting guest MSRs
  libxl: change the type of libxl_cpuid_policy_list
  libxl: introduce MSR data in libxl_cpuid_policy
  libxl: split logic to parse user provided CPUID features
  libxl: use the cpuid feature names from cpufeatureset.h
  libxl: add support for parsing MSR features

 docs/man/xl.cfg.5.pod.in          |  24 +-
 tools/include/libxl.h             |   8 +-
 tools/include/xenctrl.h           |  21 +-
 tools/libs/guest/xg_cpuid_x86.c   | 169 +++++++-
 tools/libs/light/libxl_cpuid.c    | 662 ++++++++++++++++++------------
 tools/libs/light/libxl_internal.h |   5 +
 tools/libs/light/libxl_types.idl  |   2 +-
 tools/xl/xl_parse.c               |   3 +
 8 files changed, 602 insertions(+), 292 deletions(-)

-- 
2.41.0


