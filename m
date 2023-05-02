Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B06F447C
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 15:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528585.821937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpeq-0007D1-2c; Tue, 02 May 2023 13:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528585.821937; Tue, 02 May 2023 13:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptpep-0007AV-Ve; Tue, 02 May 2023 13:03:03 +0000
Received: by outflank-mailman (input) for mailman id 528585;
 Tue, 02 May 2023 13:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptpeo-00078T-UW
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 13:03:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a96bedf1-e8e9-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 15:03:00 +0200 (CEST)
Received: from mail-bn8nam04lp2048.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 09:02:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 13:02:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 13:02:55 +0000
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
X-Inumbo-ID: a96bedf1-e8e9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683032580;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=93UXsglR4TVhZ4ze/hMN0CfXqU1kmOtQG/yfKJ3p2q4=;
  b=OuzXlj2A7M/hJ7GG6Irp1DtyKOJmNOiLOqOof94LYak4l/2FwyYjrVDf
   DM9ZnrgdtP08i7OU0KksZ/1r10RzyLQjy+tu4yuNRVsuXVgFUfgKeEpU/
   57WXj/T50j9+WyD1i26b/gPT5ZnMZfm5CvuCPJtWfHWU1ZZvXBpcRHB5b
   Y=;
X-IronPort-RemoteIP: 104.47.74.48
X-IronPort-MID: 107590529
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ibHLBaBbp/QqzxVW/w7iw5YqxClBgxIJ4kV8jS/XYbTApGsg3zJRz
 2IXXD3TPvzfamf2co0iaNnjpE9Tu5OHzNFnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo9pLI0Fn8
 uwieBMqYhPYtsnn7amdc7w57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrswA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPdrS/93rKVzEsXXqoyKq3gz8BR2mer/TQKIUQyS36xjKmQ3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQJ2lSYyYBFVcB+4O7/NF1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:hjQZhaBsMXwhdGblHela55DYdb4zR+YMi2TDt3oddfWaSKylfq
 GV7ZImPHrP4gr5N0tOpTntAse9qDbnhPxICOoqTNCftWvdyQiVxehZhOOP/9SjIVyaygc078
 xdmsNFebnN5DZB7PoT4GODYqkdKNvsytHXuQ8JpU0dPD2DaMtbnndE4h7wKDwOeOHfb6BJaa
 Z14KB81kKdUEVSVOuXLF8fUdPOotXa/aiWHSLvV3YcmXKzZSrD0s+BLySl
X-Talos-CUID: =?us-ascii?q?9a23=3Ak5uMwGpku/chGS9jrSdVGXbmUZkZTl/95XDAGR+?=
 =?us-ascii?q?bLmpqE4y+GHKL3poxxg=3D=3D?=
X-Talos-MUID: 9a23:TuiK5wrYYxEIVFYsK58ezxFcJJ9R3Z/0Mng2yYwv4u2aECZdax7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="107590529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdJA6QaxrgoHJnqycfxY331CoBQSLDPAmChLgX05HhhBiKZ05E0U6CUwAcA9fHO9kMKUtBkPrNE7J9InYr5ojKiI8xp77OL1pDmaCe3LbSqDRPQ0SE/EnojlH23Nplhpr5EOaXW2A/0Jdfzz1ckfqBy8PvIQ2iNgAXOE8RRFvxdGuGoh6ulELC4MZIkYgF4T9w/SaAo6OZC39li4eKBkjseEOzvGPfUCWfQq4nP2UP/UZVB58DQcMpVVReWWU/1akvzgJwmIVrgaOM+tU/478tnRWyUnC01uteEtqkRhOGWfQP0PD7VUtb0eERTdb72dykf0Imtx2sHQT6vkrbZh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHooOrtZ455hB4epaiuSklactcjPB2cz/QE9dt8MMoM=;
 b=bqx9oLbUw770c78j8DOGlmy16Dd/pAICUV9YKU06py1+loQLua4rrmTtfqi8GbRxUxwpuJCZ9kc38emPlzsBXyCMx9hpQVO4rQfRUQEEpWaYIr/lztSiGjB075ZYoC7zFMTzjnU/zJ8CoPRagzJHxqPK1cCTpJyPgaPONtZ/L/NtAZo90zChzjTKq33NtuiI0FquL958wRHbg7K90GMefCsB2+U8TIzMSk46L5HhrzP3+P8pI5/n+l67CB9vMWyI3+1eBkvgB64l2ly254DSatg7o0VibYvjOOCtJ97Pq1fnX5dVYGK5bXccSlah/uKb1KgGpfBOob0tzwpxTdsdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHooOrtZ455hB4epaiuSklactcjPB2cz/QE9dt8MMoM=;
 b=IQ34MWdPjYtBK7A6kMxrrpqKnYYkn3sdC55zxdyAr5/j39wcWQ2hEL2vzz/trjOOB9X0WWDkuKLs4Yd0Pa2oSQomEx02P9TsMJMQluvSeqrQHPidCvY3KMM5sOCummqZTH16oLh3kDc2TBPbZxnHBKq8uRDkv9BEcta2UH0KWFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 15:02:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/head: check base address alignment
Message-ID: <ZFEJ+LqEM2rwOxPG@Air-de-Roger>
References: <20230502092224.52265-1-roger.pau@citrix.com>
 <20230502092224.52265-2-roger.pau@citrix.com>
 <89389465-f32c-7dfe-f62b-b957e2543cb8@citrix.com>
 <068ad06b-d766-4fc7-6bbc-289911441ee7@suse.com>
 <ZFDrT87RixpOmMfq@Air-de-Roger>
 <6aa9f2a5-bb57-4c56-84b8-5bc63b47cfa4@suse.com>
 <269b0894-5fe6-fd71-9f6d-24e3b08973cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <269b0894-5fe6-fd71-9f6d-24e3b08973cf@suse.com>
X-ClientProxiedBy: LO6P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a69cfa-8c4f-47c0-5056-08db4b0d8b6f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xYYOogY0VgZP+q5llqclBcANKXt2f8tCWiFWEMrrMGU51px7CC1oGSMFpfnp+xeOy5R53rGyxs6DaG4TvtSF6dUhNytlzMvvh3Nes3zeh6f6ho3pDPjzBVfPMC70LvSienhj9dsV+k6xghj+1inCzV9aVTeoD12+puXTMHPtveQz1fUdusYsbKfVRv41xlbNhHVrRSw3fZZBDiJcTuwgJP+c6ss2QLZkzB5noQ9hJ6H8BczoDqN4UkuYb2GKFj4tl3ARX61mFZ50nEuxLqOmQvv8bVYKSr+EIf43HmqtCe5eu84TiXJnfr+Y0o+vz6o8CNjCR7g8UZtMzWCQT2Se1KzY82nLiTLgLwLiItjxFYMaPPuRCAc4XvYuvi3U3Yp8iwyp8clwDvQBWMJ+ND6MiFd16vVsM/ktHMRNIibcz0DPJ5JLEVQBYZaokLySgwuIkyfZ81TlLo1E4FNdnwe83vh0Kf+fkVF6ersQ3mpD4CfNsYNbYU9y0xZwu7v3AHlIX1oODOXcONGvjC+n0e0ga6DueXOyJZI6cDVNLjk2QBIdVmtdDbPTRh2rDcJ2SBPapsbBA5F+4Bl9je6iMzwO/UEU3DXbEiGDTQd5h32DINI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(26005)(6506007)(6512007)(9686003)(82960400001)(38100700002)(2906002)(66476007)(66556008)(66946007)(4326008)(6916009)(8936002)(8676002)(316002)(6666004)(54906003)(86362001)(41300700001)(5660300002)(478600001)(83380400001)(186003)(53546011)(6486002)(85182001)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNZTWNYSEkyaUhzZEdZSnN3OEd0YmJmTjQzOHFrWTFRNWdNWVFYcDY1TlJQ?=
 =?utf-8?B?SDUwd0p3clBRdEhyeE9VeURuUkNhRkNVNXlkNGp1RWFhc2hTYjkycEdQQ0tH?=
 =?utf-8?B?MGFLMkVWa2wzeXdPNmFtOXdva09rRG96M2o5cmYxRWcxdGtzQ0FSMXVxUklU?=
 =?utf-8?B?V0hYSGM4K080YjdnMVZNUXplajFoQnh5NWFyWmxnVHZuOTRJM290Mk1vYmhx?=
 =?utf-8?B?WE1xZzM4YzJialJocUVJMS9nSy9LTXNEL0gwMmtEOURPYUVFeGIrb0NqZUZQ?=
 =?utf-8?B?aDZwN0ZPaHIrOVZEYmJseU9aa0xGSHE2MnBqaU1qZ1Bvb3pPaldIa3BmS1Zp?=
 =?utf-8?B?ZkdvYyszOE9mNmNFc2ZhODRrTVdlcWdyQjdSV09BKzZBK2RCdk1yZ1lkWHgz?=
 =?utf-8?B?d3lBWE1pZkltVzZkUFcranAyaVUvNzYyaWxWVnI0ZTd1cm9zaGVwUllnUlNz?=
 =?utf-8?B?Q0d0OEhnNGJUOXgxYytRTzBPKzZ1QXRhRzF3KzRKYlU2NDZnck9HWGpDemIz?=
 =?utf-8?B?YVJMdk5Oakt0Wkl3bzBPdXJjTktOempjaW1wR21ZaFVzalNrcVpPSTkrZGEw?=
 =?utf-8?B?eXZXRDJkNmRnYXpKZThieUhsNTdiY0ZEWGJoa0JVWVBvelhwcXpTOFVGZnpL?=
 =?utf-8?B?T0VnVzg4OW81bUJWY01SNUU3YXlvQnVtMDcxU2RPTlRwcUJKWmlRWmpzN2ZQ?=
 =?utf-8?B?WDBHRys2MGd6V1VocUNXMG91NzJDZ2d0SlFzbmRsQ2VlNXlKcnA5Z3o1bzBO?=
 =?utf-8?B?eXRJbEhmK0owOVRFU0dDQVdSaWpSb0ZwMll3MkkrZ0tPQUxtTVFmNzhWSHdo?=
 =?utf-8?B?QkdvUlFGbUU0QU1idlNhdEM0UDJvQzMzRnYrRnBVV0t0Qk5IMy9PK3Y0Tktx?=
 =?utf-8?B?M3RmT2dtSUxJMFZwVUM5dkpNMnFpY0ZzaXkrbDNhUDJRUTY2eEtkMmRwQWF1?=
 =?utf-8?B?b1BkSy9KUXVTdlNBQjVTelU0MG82dUNTNEFnT2dkOHU5WHZ2SE83TUF6elJa?=
 =?utf-8?B?cTIrZ0tkRHJtcUNnZ1NzaWJzeldxMWtDYWNpUnNwRGlGd1VraXBxdHdwYUsw?=
 =?utf-8?B?TzVOR2UwT09XWjRBckNSK3cxT0g1TFZoN2pCSXhlcmxOSHdHWWhLVjkvbUxq?=
 =?utf-8?B?UjZoeCtPUklTOU41b2NoZ3JRamI4K0g2Z3k4SHh5S1dXZjNJSTd6OEw5ZUVN?=
 =?utf-8?B?aC8wSlgxTUhHQVZHdEJiUFcyYS8vY2JVb0daa3lreUh4eE54MjR0U2JJdSt3?=
 =?utf-8?B?UFZxWGZRM3I0TUduT0M0bFJOeDdsb0VKRDBUZndpZnV3dWZGVFdVaGJiUm10?=
 =?utf-8?B?eEtUOVIyc08vM0E1dHh2WmRLWHg0c2FMbFlWZTFEMTQrR2g1RjM4ZTVDVFpJ?=
 =?utf-8?B?c3dadGJsZ2FPSDlSSHp3d2ZHWUxhMmtsVHVkTFhWTjFoU3NBM21pcldwRzlU?=
 =?utf-8?B?ZE1LMmZwdGxqcU50QWxoNnVOSUFiYlNjamNTS21uRXBHWnRTUFR2ckF3aUNm?=
 =?utf-8?B?dTd6QkVJOHdjL0l0dGtYNGsrdXZOZE5Wd3RaMnN4ckZhcU1uODdsMXkxYk9O?=
 =?utf-8?B?MlAxMFY0WWEvSFZMOHZ5MlpVb0pZbGdTcjdOVUszM2MrTnNlZHovcVlqb0Jv?=
 =?utf-8?B?UDQxNVFsL3ZZZ29BQzB4SW1aTE0rd2RWbWZ2MTNnS0d0UkJRTC94V3UrN24z?=
 =?utf-8?B?elRYYVdWN3ozWXZBay9qQWo0NVpqanhBZGRvVm5FTFV0TkRXTlFIWE01NjlP?=
 =?utf-8?B?V1ZNOWk5akR0STFrMUFLRGI3dWhuWEVTM3FBaExJMUVEelE1bTlwdHROeUJX?=
 =?utf-8?B?RWkydnZicmtsZ1ZCSEhlSkJxR3R2YWw4UElEUkVaTnR3aVRMcnVNNnVXQ3Q2?=
 =?utf-8?B?NEZ5M3ZtcnErODdCTitUL0M4ZlRVcUxqMitVbTE0aEhsczdpS25reGN1NTE5?=
 =?utf-8?B?bk1pRkk5enFjVVZPNHJWZzh3c0ZkT0xsYmNIVitlaHpRQnZoQXd5cEVtWVlV?=
 =?utf-8?B?eWVzZWJlY3dzaFlPcE5wQXlHOUorQWZDOWdrbk1aeXFBL0wrNjh5M2NvN1Nq?=
 =?utf-8?B?cVBmYU5qTm5BdTB5T2JrSHNIUXV6d3RrUlR3bnhTSlZFbDV0YkxVYWp1MVMw?=
 =?utf-8?B?YWVlSTdDZVNDTEl6TmFIdGk1Zi9WRkl5UTBDa0VWLzF1S082WkxkaUs5VGor?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Luv07VhtD5O0ZmmoCQrPjMyOsRF1TzmBAli6FEO89m0J88q/dV93H3odXlP9pO6HYel0pYm3euZwMW5BeEnfOuBGqRDdd7DL7taAivMwysEX7mTBn+qSoNCv98lLbRlnIv/Lq9a2j7K8pxJ5KzwDvjxVOUL/uqVMRrWmSdj6TbTskZeTfIQ3qceLTp+xRVHPqY3/Njrq6+ZSVvMsLrDMZ7700o0rbkKspuWn1vXrs/b6BeNu4DKJsoL0ETowr3jx/Eo3VD31hIY1roJ/SV4y4KF9a60UvfS2uiMrPjK8cQxVQD7M8s8PKjU2BSw0rZlEHMpINHXQkRx9/xFMkQwIinkPrZAr9xOaEnp2po8F1vAxD7+a2Es1FAGhHpPhgHRAIEXlaLnDCnHBgROchLeuHDyNtkft0hp+LGCEWxRG386+HM/UwQJoRjyfgVjhxRq2XJ6SGImtkYVQpGeWd0p4ia7bdNphTDttcNP+c1cbE97Ci9EHMbWFaQMrolnAl2rXKpvdiCyDQm99JqQTbJJ/wTk2uF/o8VHIfdBxNPMxRAdfi0wQllJCYDiR+A21RE7mApLtqm71EGACfQ4/nKdY6z0cwtDqujSzKDv+O4a7aEwkQvtvutcq/daE6mBihJIOPYanzR0ZFxRNRXzuYE+TJExCAmkHvG8mvOtSxDQE93O97K/9t2xJsPgPiqtiHu8u6F3XvdskLkIgynsomF7DsQVfrmcLnR7dRL7IMUF8u96pas2VYLnZrv2pIr0KqPwiNHTyQ8cpuAIalQaZv2FfuknfH6C5rD1QLdP8M7pBEHUEKzpXwr6JhilmuH8N3k4+
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a69cfa-8c4f-47c0-5056-08db4b0d8b6f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 13:02:55.1973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilgZf40NPjG5ky+RyuXRS3IwaRRKPBI+toaCpDGos2q5vjJAdSMen7xLsbfOYWNOPaQFQMTiLI+i73yQ4AER3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5669

On Tue, May 02, 2023 at 01:11:12PM +0200, Jan Beulich wrote:
> On 02.05.2023 13:05, Jan Beulich wrote:
> > On 02.05.2023 12:51, Roger Pau Monné wrote:
> >> On Tue, May 02, 2023 at 12:28:55PM +0200, Jan Beulich wrote:
> >>> On 02.05.2023 11:54, Andrew Cooper wrote:
> >>>> On 02/05/2023 10:22 am, Roger Pau Monne wrote:
> >>>>> @@ -670,6 +674,11 @@ trampoline_setup:
> >>>>>          cmp     %edi, %eax
> >>>>>          jb      1b
> >>>>>  
> >>>>> +        /* Check that the image base is aligned. */
> >>>>> +        lea     sym_esi(_start), %eax
> >>>>> +        and     $(1 << L2_PAGETABLE_SHIFT) - 1, %eax
> >>>>> +        jnz     not_aligned
> >>>>
> >>>> You just want to check the value in %esi, which is the base of the Xen
> >>>> image.  Something like:
> >>>>
> >>>> mov %esi, %eax
> >>>> and ...
> >>>> jnz
> >>>
> >>> Or yet more simply "test $..., %esi" and then "jnz ..."?
> >>
> >> As replied to Andrew, I would rather keep this inline with the address
> >> used to build the PDE, which is sym_esi(_start).
> > 
> > Well, I won't insist, and you've got Andrew's R-b already.
> 
> Actually, one more remark here: While using sym_esi() is more in line
> with the actual consumer of the data, the check triggering because of
> the transformation yielding a misaligned value (in turn because of a
> bug elsewhere) would yield a misleading error message: We might well
> have been loaded at a 2Mb-aligned boundary, and instead its internal
> logic which would then have been wrong. (I'm sorry, now you'll get to
> judge whether keeping the check in line with other code or with the
> diagnostic is going to be better. Or split things into a build-time
> and a runtime check, as previously suggested.)

What about adding a build time check that XEN_VIRT_START is 2MB
aligned, and then just switching to test instead of and, would that be
acceptable?

I know that using sym_esi(_start) instead of just esi won't change the
result of the check if XEN_VIRT_START is aligned, but I would prefer
to keep the usage of sym_esi(_start) for consistency with the value
used to build the page tables, as I think it's clearer.

Thanks, Roger.

