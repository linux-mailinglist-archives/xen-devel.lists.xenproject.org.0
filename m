Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFC96DF1BD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 12:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520168.807495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXSk-0008Kk-L5; Wed, 12 Apr 2023 10:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520168.807495; Wed, 12 Apr 2023 10:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmXSk-0008It-Hx; Wed, 12 Apr 2023 10:12:26 +0000
Received: by outflank-mailman (input) for mailman id 520168;
 Wed, 12 Apr 2023 10:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SpRk=AD=citrix.com=prvs=4590bba82=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pmXSj-0008In-MT
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 10:12:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84034ac4-d91a-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 12:12:24 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Apr 2023 06:12:14 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6110.namprd03.prod.outlook.com (2603:10b6:5:395::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 10:12:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 10:12:12 +0000
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
X-Inumbo-ID: 84034ac4-d91a-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681294343;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nkmtczLzb6GNy4XEaW8RkYxPle9XiClkPiW3KoeJLwE=;
  b=hg8JNBsgUfnpc0c0IOs0pAKiu2uZ5OQIjzlLDnTMZBFTum3pgtkajyvI
   xNKKGMhzNgnHBef7vCnZYTlghdCPzkdqrYAa6/Bfe+CvEHIetMHnW7aS2
   F2ztJyvGw0zLTFjtsBdvQiNTaUo2wSWQ9furZcJT4hZnYAnoTpbX0MJ1N
   Q=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 104558752
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M0iZQ6D5b6woVxVW/8viw5YqxClBgxIJ4kV8jS/XYbTApDl01zJWn
 GZOCDyOPK3eY2b2c48gO4vi9ENV6J7Wz95hQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9B5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4MxSWzFl8
 84hOW4HQR/c3eSm8Zy5Y7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqi7x27+QwHmTtIQ6CbOW+v9IsVyogS8XWC0WT2SYkKKchRvrMz5YA
 wlOksY0loAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGMt4cTnoYw1pgLCSJBkCqHdpsbuBTj6z
 jSOrS4/r7Yel8gG0+O851+vqy2ojojESEgy/Aq/Y46+xgZwZYrga4n271HetK9ENNzAEQXHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGpxslePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:xWYB7K15bhx7g/Yd09QZCgqjBQhyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHO1OkPMs1NaZLULbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy7MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njDsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqv9jIDPr3DtiEmEESttu+aXvUjZ1REhkF2nAib0idqrD
 ALmWZkAy080QKUQoj/m2qQ5+Cp6kdQ11bSjXuVhmbip8viLQhKdvapw7gpPycxonBQwu1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRj+UC3fLFuHIO5l7Zvi399AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8vC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eV66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBsPkoLVeL+zNbFwg2PwqT+GLEXQI+llluhEhoE=
X-IronPort-AV: E=Sophos;i="5.98,339,1673931600"; 
   d="scan'208";a="104558752"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjaZUU1gW5/aoVSRY5GSDXFZrVphfdUWzFMmjXqe6lXybFJVyjYRKY0Fzl4gQ2amX58cj0KpGFSy5yllhKy5jYUp6B3UNiWcAcm7GGDGoksDW88pF3BJns32oNxTTXm/xhz+KJmGIBngWvvt8bkw8iZR7dk4SuCUBLyf2OyfodBPRAX3C6aLE/Mfkx9NvFLs/LwQ2IxIgjA28QiQx5ZXTUotlJDtSIacSsLKGCWFwRR4rVB1BNvkSQPRvgmv5Xm6ebuFNljhIMN/k508Mf//0MFFvCDM9na+V36oIrSSKKslDkDFGKYRYJHgPFnvEUl8psuXarY1WczamQfPMP0MwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGLAXe+N1thtgbkL0MNg4MOYeKvGBwUt6nAxSEZ7hAE=;
 b=bU2WHp39JQw32OAfFvhVPcjDP8StWjuHN8uc5H65YhPkPDFeajMnZFQpq7OhSooPbEqcrBT9KrAk048RMn0O5Gj29doBTviIcLTf7nBqXa448nmuM6C79LKHQ/LwM7o5bVNcSHLATOo49xYRDKwLR03Rg8815vFogbjOU7PqYu5OuDfAxrq1VzwduHWqT5wOgSAPrIBvopryCtvaP5h/+EcZzusvvFCQAul25PGpPomiOxzM6JO7EYbX+1llgfPm6brcv6tKdCJZ7+MMFtSp6YGrzpcAFim/ICYnrxSy9uyfQmjFDnqlDcSRxIahtK7ToxKIFssdcXp2JOR+JMaIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGLAXe+N1thtgbkL0MNg4MOYeKvGBwUt6nAxSEZ7hAE=;
 b=aLkYrPn9Cj799pSHFIsrXpaPRbfhh5k/H/7bNvu0VA21Jl6zgcOZ9tyGrILM3M5cN5RIx0UZP+pJ20NXypeqPa77+6z45DXnNH4U/RucIWUj7J4EZdR+/cALduyZ0dPz2h7PaHCLYMzhJ6+od0JtvM6/zotqWyiceTIySnTFSn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Apr 2023 12:12:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZDaD9k2HMUX2LbqU@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBMfpnzW4YdqEiA0@Air-de-Roger>
 <87h6tmxden.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6tmxden.fsf@epam.com>
X-ClientProxiedBy: LO4P123CA0434.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcf486c-475c-4d42-afdd-08db3b3e6202
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tB2YoYaFAyRJCC3Bj2xw5Hda+zLU0xbEzeLg5UmwPHc0vb/iCQMB3ZLrDt6IMFiDAF0xKCHoyOOIps+3S9YLocRVwTR6WMk3iPNcCJhN5Vw3V1zXNmh1xMYCHErZuQWnUEMeGSpUy7wmv50WfWXzXzlkpOjK1UBP0y/L472VwDBry2BAMsDiX8ZkjOeX2MiaCugcbgT0yNEVoeZnzP60TggDKR4OcfyA5plflbS7cpMiEK9ApFzHkrWXp9cbtxzPX/BwUtKc2X4LZHKHbF8V25zq64TpO9o432b0oK7JUKACm107GHJh7ZUieKXa1/k1ysdk2S9cni+YIzxWzS53yDTNl70b/dn+YfgBrcfBAbd3X1yCTqPY5rPSyOMs07aQAMZMoa6weYnlQ5ajH41j0yzrSTh52C864gXSx6HsV47zaRfe6mWcEmxlKaVUzrcuffZI9Q45jX+QSh9Egg6dPyAxPSSo9qSOC8djwru90iMPjPrT6zgSyL80VtNw/mDn+Oost0mXwKCC/2jSM89NwWsrDQ7uP8EE/hcyXfIx25Dvg6XnVTjRrfwxHql8WP7a
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(26005)(66556008)(4326008)(6916009)(66946007)(66476007)(6512007)(6506007)(9686003)(85182001)(2906002)(6666004)(6486002)(83380400001)(186003)(33716001)(54906003)(86362001)(5660300002)(8936002)(8676002)(38100700002)(478600001)(41300700001)(316002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0JFY2kwSDRWU0V0OWJlR3V1eWttWVh6NGdZM2xkblJzbG11YXRWUXJDcDdz?=
 =?utf-8?B?VTdCWEpSbldPcjBVU3B2dGZvWExlZ1E0TDBRb256OWxPYjJWZi9NSS8xVHN5?=
 =?utf-8?B?U2EzNUFVcjJDTHFhQVo1R1ZVcjhheWk1L3FXWlM3VzRRUVFJL3JoY2grUDRR?=
 =?utf-8?B?dVprcGRkdWo2dm5vQjV1YWhoWVIvUVM2a3MwN3RpandUOWtTK21zbkVnakRB?=
 =?utf-8?B?b1RKci9oS2x3WmhMOGRTOG5wbEVKc1BuYklIL050ZkptQlkrakJzVnFpTW9L?=
 =?utf-8?B?KzBLSkVnRE1pT0kzMnFzUEZhSUNaTVpqUXNZbE9qQjFZNVpnN2t0cGJyZ2Uv?=
 =?utf-8?B?VmFyeGh4c0h0b0d4QzJUN3laUzBTcUR0RHhWdjlzWThiNkhCZHhSSDB0akhH?=
 =?utf-8?B?SmRmZ3NCd2p1bjdKNzF4S0JCa2x5czdBZW9hcktwTWgwQ0FyNituZDNlMUI3?=
 =?utf-8?B?QnJ4cXZEVGJ2RlJNRkNQSDNjWHg2aXJ3NkdGbFkzMTdzTzVKSUFvNERQRjEv?=
 =?utf-8?B?MDRhRmNDdERxU0F6U0JIa3FZSU5oT1FONGFjQVp4NmI5bURDVkVSeHlGWlh4?=
 =?utf-8?B?QVo4ZnFlc0lEZ0hNT1ViU05pdWp3cEJhY2tlTlRVbCtJN3B5YWI2RnhUbnB2?=
 =?utf-8?B?RWZYQTJnb1UvalpvSUVGZWNESGFtSHJyRTE1QkkrWXVTTVZZczI2NzJyLzFt?=
 =?utf-8?B?RDZ2dUxOL1FJUjZKRExXbHFMODcvSWZwaFFQNS9BdGZ2UzdhSy9ZUHNaK2Vo?=
 =?utf-8?B?VEQ4TFlaelNxczBoWGs5a3V3UFdRdlp6MUNCTC90Q3FycFhKWWl5cmZ4VkhB?=
 =?utf-8?B?d0RsaFVhc0gxNmZmd2VycEY0M1doTXZ0OU9ROStOMm9rbHJrSGdIR3lhT3Mw?=
 =?utf-8?B?QW56KzYwbGZlSGhOMW1xYmhlTWdDaHBlaUVJK1dZVGtVaGhBNS9PL0RyckpE?=
 =?utf-8?B?bW5OQ1JuSEY5N1pJK09wbUNLeGtCV08xbU9vcEFTUzlJUXJoVXZXWDRkbURt?=
 =?utf-8?B?Ky9EK3RHR3dLRjR0dUkwTWRZSEZwT3Q2em1Ib1VoT1dUOXJKem16VmhwMkhX?=
 =?utf-8?B?cEJERlJ5VThRWFZNbFVSN3ROWTFlakpZRmtreTVoRDVCMG5sVENqeis2NHhj?=
 =?utf-8?B?MVhvTERWUVJlTGwrKzFQOHJzOEFqdStRVktBVHpXVDJoazdTdlNBbE1UcjBz?=
 =?utf-8?B?OFpVUGZ4SGlnYmhFOFBlb3JPeklvZHM5emYzYitVS0pMOVZqT1BqWm1jTlFa?=
 =?utf-8?B?UUF3KzBFTGVHa2YwSzJmRGJ5dklOcEQ0Ri9Gc2tlR2o2U0hwdnNRdjN2dmVX?=
 =?utf-8?B?MmxGc0FOZ2ZvZi9Pa01Xbk45YnZNdzBQQ2NQMGhza0xORlVnOWVmQURxYnNQ?=
 =?utf-8?B?dEY3cnA0LzBOekFQV2xFdHhodkJnQnJyNG1JT3dxVUlWSlFOeDh2cEtsbkl2?=
 =?utf-8?B?Q2hZTFJxV2dNL0NVVTBNY0pjVHpXVUxzZ0RuZFFXZGNIRW1GVFkrbUVJVzVN?=
 =?utf-8?B?cmo3cUQzVWpMMFAzdUtyczBjbzFEbFk3SnRiVEU3Mm9kZ3Nab0t1ZGsyY0tz?=
 =?utf-8?B?aEtwdHQzZEZ6R24wSUVSSTd5WFFWOG9vc3RUY29seDloUWcvZjFnUDVJM1Uw?=
 =?utf-8?B?bUJNWGxGUUtUdS9MaG0rSDdTWGtzRlIrRmJOSmFhUXJsNFc4S2JINEtrUTBX?=
 =?utf-8?B?S2k1eXJYNFBUZkJVVU85bmlURFRrdkRIUk81RVlPTlJQQmp6eHJvNlJxdUdZ?=
 =?utf-8?B?YnNkR01QWTlka0UzMHZ5WjdoMmY5am9KeHhlMFlzaHRqUmY3a25IN3VjWkVP?=
 =?utf-8?B?dld2cURBR0ZzVlFaS2RoWHJndjRqa0hlejJpT25jUU50WFVneGZTcExtR0V2?=
 =?utf-8?B?SUhKN1h1MzVVUHNTTGhOTmo5TFk4YmYwR2dYa2RZdVNzMDczWXdoWXNza0Jl?=
 =?utf-8?B?dC83Vi9wTzZxanBrZ1lTTTlXTmIyU2RFYnBZYVdRVGR2Y3dtNDBuQXV6Q2xO?=
 =?utf-8?B?TFZ4eTFsdzd5WGsrbWM5Q2s2emRZcEI2SzRONTFERTRjYk95NldXWjdwSHJv?=
 =?utf-8?B?Vkk5MDQ4bi94MWU0Q3Z1UWVqb254bTRvcXYzNHVoaUlNV2ZHelNvV1did014?=
 =?utf-8?B?am9KeEdON2FkZE1TOU5DaXkxd09VOGFQYnNORVgvU0wrbkM0bnkyYzFabnFy?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0J2J5JEH7vsSNHxtUXIHnTInFNsZxYGxGnxuAC/SK9RNguE5nEbTJWfWfYo6gkWZZkyjD1P+6nijQM2R/CEtD2cmJuqLtqJs/lkFBLnWolr4PiFcN5DC0kH4aQaN5p08DnZpzaNDN6xXJv5CZY78VhlrfxX3fwvpHKYgG933ra48v2eRCBv3uaF6icz/HFTRHFAZxqRa9mtcpXYZv7Wz8HNbPIqvD18bxnCEJdhmzpSijnPtKNFIjiNQ6EV5vEGnbXe/eIOJirPgTf3upw8n1XxnD0OMJwWIvuc7Y6byQkYyjGF4iSON/7Cu6POM7OsIWVLsFZzGWUGUse4Cv98bHYE1CRT1GK2whpczIPMfyDrL0OBZmtzL5zZuZnfoKqo1+KofW98UB0XD/7nzM5z8m1N4qidUIODEMden2ysaMiom/OGkJDbfUo7ihKGKL8jYh50C6JHuJoI5JXNp4HgT6VHT7avDnQZKJksEt4vOQZM/w3N2Yz2NBSZvT4uRw7+cR0ehnmBUpgQV+KcivTUQKjVFW0qnbOFlMbNa78HpO6rpMGXSDX3V52U1hBGcnWXqOp2CMz/U5oUpLhQzaC2ZstyparOpJyWKzi2c3KjMc6SHZK3lcjM+K83priWrZupm67WdukSK/5IgaFfkLopNEI5wH8Hhb5G3i1DGUJVubqBIRaLx78A7jJ2QR53Jsjs6RqO8qo4eR0R8AerR9uc6DaYePL1pFZHTdp248YdBAPq9nphSTu1eOO3hfpjvPTBw5b1vYpQ28libueB/gNZkzRaBFl305rm7+686fJH1ynTC5GPU32jG0xUQvsioK6mAwoTf2SgHaICqxjTmXWKZ3whtM41RF7uMlOGYera6NuyI/g6Tjhojr0OZWbVkORUJ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcf486c-475c-4d42-afdd-08db3b3e6202
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:12:12.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5PbhQAJy3womqlFmx5yoEo9BfeHnffIylOxCkupRvH8C3TocLVKRLrabUdoIC6ZehFBOoR/LmsRm6iNBy5m3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6110

On Tue, Apr 11, 2023 at 10:27:45PM +0000, Volodymyr Babchuk wrote:
> 
> Hello Roger,
> 
> Sorry for the late answer.
> 
> Roger Pau Monné <roger.pau@citrix.com> writes:
> 
> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> We can use reference counter to ease up object lifetime management.
> >> This patch adds very basic support for reference counters. refcnt
> >> should be used in the following way:
> >> 
> >> 1. Protected structure should have refcnt_t field
> >> 
> >> 2. This field should be initialized with refcnt_init() during object
> >> construction.
> >> 
> >> 3. If code holds a valid pointer to a structure/object it can increase
> >> refcount with refcnt_get(). No additional locking is required.
> >> 
> >> 4. Code should call refcnt_put() before dropping pointer to a
> >> protected structure. `destructor` is a call back function that should
> >> destruct object and free all resources, including structure protected
> >> itself. Destructor will be called if reference counter reaches zero.
> >> 
> >> 5. If code does not hold a valid pointer to a protected structure it
> >> should use other locking mechanism to obtain a pointer. For example,
> >> it should lock a list that hold protected objects.
> >
> > Sorry, I didn't look at the previous versions, but did we consider
> > importing refcount_t and related logic from Linux?
> 
> Well, I considered this. But it is more complex. It has separate
> refcount module, which just counts references + kref code, that is
> capable of calling destructors. I am not sure if Xen need this
> division. In any case, I tried to replicate Linux behavior as close as
> possible. On other hand, Jan suggests to rework API, so it will be
> differ from Linux one...

OK, just asking because it's likely for the interface to grow if there
are more users of refcounting, and at some point we might need a set
of features similar to Linux.

Thanks, Roger.

