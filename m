Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204EA6C4DD8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 15:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513494.794567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezXC-0002my-4h; Wed, 22 Mar 2023 14:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513494.794567; Wed, 22 Mar 2023 14:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezXC-0002kV-1J; Wed, 22 Mar 2023 14:33:50 +0000
Received: by outflank-mailman (input) for mailman id 513494;
 Wed, 22 Mar 2023 14:33:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5r5y=7O=citrix.com=prvs=438090303=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pezXA-0002kP-1Y
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:33:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c0f5ef3-c8be-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 15:33:45 +0100 (CET)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 10:33:42 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5313.namprd03.prod.outlook.com (2603:10b6:a03:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:33:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:33:39 +0000
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
X-Inumbo-ID: 8c0f5ef3-c8be-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679495625;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=9bOL2r6FwUaohTXL8XzmQA3jMqbGhKAxerCJ1pfdQuQ=;
  b=d4RJ4J8gP0FzPY1Z2vt2sEKxgglK3eJTBdioXt5VeODGzRB4ag5A57Ge
   m9y+YaYE6aQhB8hVtLAfy47va/bIdrT4jxQPTmKiu1XbAiqRfDTAsl7k+
   QvCRtBUK0XM8Dnbd9R6ah+UfdYNBgdTZ2zF8B2tZcTYYnoOkJHwFIKgok
   c=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 102287501
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wGt4aqB3Pr80+xVW/zviw5YqxClBgxIJ4kV8jS/XYbTApDtx1GNWx
 mEZX2mCPPvYYmWkKYhxbo/l9B8B75OAmN4wQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/8p5IVgTq
 PwhNw8TYwut19jq/KmWY7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqij21rCSxXqTtIQ6Pqem8qN2mn+p2XVPDhAVe3zjhfObsxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhRqubyRDH6YqLGdqGrqPTBPdDdTIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCQJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:wxjnVa93GhWNQRs+wDNuk+C7I+orL9Y04lQ7vn2ZKCY0TiX8ra
 uTdZsguCMc5Ax6ZJhCo7G90de7Lk80nKQdibX5Vo3PYOCJggWVEL0=
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="102287501"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CK4VBN7p5IAWhiXMVtRjS+EtG89tCFyjLMrg4LknXTZHBskOVH+0yX3OyuSdwe9KipOYcMwT1Q/sqCMlZfg8eMknCDowy5nT0KwKj3vLyuvXGkO74hJ+zwqKrw3bdvDGQYFybDDYdx4Y/0ELyD5Il9uiQWwavmjOwWbwBTSlDSom0UhiNgoM3HFbFylAiuAVYZtpO6N2O/3n+0W4B5tzOaLJ2/pEq6AdokvwbWp1BI3hdp6ZwMkGGcfV2YJ3nQd+edoOHYPK3j4BAr7mrIQCqC7hsH1z6a/pOzIN867NtP6kPq8dg2xriVoaXM448LseJSwkDz3M5U8VEXbIlTCozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzaFxume0uRYmgH4EexaNIV87A9CEEjv92w7aVc5R0o=;
 b=hGcnsokBfCxqoL/lBCeaszhOP9NesRqvD6G54uDBzB5hIpErvXDVHAKB8+7Cn3oWfqToyRAMZRjB0ISdTTGQH1Dxijroph/D7LDhgQAntfYF1z/bze+4BagLWBcjLDEhZIONzIgpWMX85W+wz+/IMTH3FUSb5O8dmAO9ZX5xNiLMxTzCi92HjANrwp5WAUU7E5BFwpBrOgCFjse2/B3jIJvNfdldlVjYSPeFKT+ictRLGS7D+5vV0c9tgreGRlriIqA9/G127JLaGBn/Ty5bmAjDbYASqobXisCZV2zYENBU84+mXauoMfMIrTb1VRlU7pLMU0sJQkjtLqY8Zu8P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzaFxume0uRYmgH4EexaNIV87A9CEEjv92w7aVc5R0o=;
 b=DJaxHM7GfEZHkcoHEHe384wjnG8Y1TMf7/DH5HlWOB+y/f8i1OKurOIBx5/COdU9NFJwPFqPWsFeEXCoEbiJ8RMNMXPdVRQ64Q5MTzzquyXydBXp8DTEOuYOWxAwmepE2f+BNZ5TpMGep25OypzFyy9fjFu30ylO8htgv902rKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Date: Wed, 22 Mar 2023 15:30:01 +0100
Message-Id: <20230322143001.66335-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8238b389-a79c-49f8-341e-08db2ae26d8a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w4Ua2eg6pP2PAUe4jeJbiizPZ0fx7QU4PKaO9EXxVN6mz7mVM/lE8hGUkki3T5CXRlkmAvP0ksjKPKxFeuS1jIaW9cszAnAxstsskV0SpNIN+ubhrufaGAkGxdEyXXs+/egDbizjRBtYlDyoR6sWQCUef9KepUd1fQ+eLiwnj4rEzwcSrjrFbzSzj4WrDW++iiG1L+j5mv32zuh3iCrYj/RYpo32HMPiiGAzW+YfPDjx8ZMUGN2wRFdcwJzMmd00IlLN95LpiPg8a2fwkgk20o9Pf8rsrvnQzqwYQeiORzC4/CV0kiA2WxAKgaG/3yN33vlNuNLH5zXGAiLf7iZXLJ8aWelZBt3xp81EST6W09AX4I7uRVUnMc3GqOxhrS90lLtpSltO4CP4PLerTxzAQKrrsSYWyrtNYVyHMU2L9e9DSTH/ln5p5JbLWSKrxf4D9FToptiGuUrCr+DIyk98TqXfWEuVChedUOn8+LEEtDoI/co+KJ6tGwI4htmv5L739FahFkxGNn4IBCIYcLZ6OfJqHi5PGIGb2T5BifOTKcPlwx8txQ57fyb4UzRuGdZhUd0agYPY3jKHpbSNvvmAhKjLD/wo2Mcr+iukalZsa2JX3VWEn175IfXwh7rOFn6WozKNeOVTrxcgRTVldpbv2A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199018)(2616005)(107886003)(6666004)(6486002)(26005)(6512007)(6506007)(1076003)(186003)(82960400001)(38100700002)(2906002)(86362001)(83380400001)(478600001)(8936002)(4326008)(8676002)(66476007)(316002)(30864003)(6916009)(41300700001)(5660300002)(66556008)(66946007)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVVYS0NFMkNkZGFNVXJ5UTViOE50LzU0MmJNdGl4Mit3ZTFrbkNZYWxidU1a?=
 =?utf-8?B?L3YyRDNsclhWQkd2TzFGZVVZdnNnMkYrSlduUzRWOWN1M0w2MG80ZXJaRWw3?=
 =?utf-8?B?bUI5TlpiR3lPK3lnVkVFTFNoa1Zqa0RxQzNSa0s0YTVuZXBXczhtcUppV2E5?=
 =?utf-8?B?MkkxYm5tSDRzM1oxREJjZ3F4NjhkNTdOZVBXN3BjWUh3eVM0UG83ZVJxOEdy?=
 =?utf-8?B?eE1POVZURklETWRUeGlDY2FRM0ZGNXRoRFNua1FUVWMzOStDbmczNElRRStq?=
 =?utf-8?B?ajh5a1NrWnBHKzBIYXRJTEUzUE04NkcwVWFLSE9CMXFkVlJacjBVcDFtNzVU?=
 =?utf-8?B?UWs2ejhsZDJISUpTcTNlMU8vZXlXcGNCUlpkaWh3MUZPemJETktDVjE4dXZw?=
 =?utf-8?B?eWN1Zmc0TEhucG43T3hBaGRERzFBczRCUktFdkJ5RzJ3YlYrbnA4c3RmbTYy?=
 =?utf-8?B?MEROVGFUVktOcllvVUQ3QnIyd0RiWWJvSHhQc1dFTENvN2ZrUSsyTkQxc0VD?=
 =?utf-8?B?WnFLelVWRHRrQVBBaVFQcjB5N2hrWTVjSnBHOE1RdTFsN2J2dnBPenlac3g3?=
 =?utf-8?B?TDZSelF6QUtqYUIyMklRNWJxRGJ1elVlL1A4TDlEVUJvcHJpVmVmY1pkUjln?=
 =?utf-8?B?bVhndmQxeklhZlFyc0diR1lIT29FUXlTS2piRFVIV3ZpT3YwUHNmbnM3cmJI?=
 =?utf-8?B?am1idmZnRVZuMmdpR3grcWVkbWtrTnpvVUZ4T0JwTUYzaUIydzArYXc3V3RT?=
 =?utf-8?B?bTFXbnF1dlptSHlESjNCckFaR1kzeEFhOWhXL2Nubmp6WFY1YmtPeC9vRGQw?=
 =?utf-8?B?dytRTlJxdXBKRDIxRysvbVJ6UWRmS05mblU0d0d3cjBrYnljZ2U2K3loVWZV?=
 =?utf-8?B?aXRSaXFFREhVQkx0VWlPUCtUUTF4RHoyVmVVSVhUcGNTM1dXMUFNZ1l3cjUw?=
 =?utf-8?B?ZUNBYjBHc2FKOCtPNDVNeFNLSlRpc28wc1JSR25oZ1JsemFFcG9WYkRSYm0y?=
 =?utf-8?B?c3U5b1hBQzVoOStvQUR3aGE0SHJSa0JQTjFGNjhTeXlPSXU1VTA5VDByNnhL?=
 =?utf-8?B?NVRFbURVY1FsSzBvb0ZGM0VFSVVQNjFTZ1gxTFYxeDN3aGdFVCtjcTBrZWov?=
 =?utf-8?B?QU5UcTlSTlFFSndwa3UxYkhhWHN3T2tvdENSeTczZDdwaEg5MWZYTHFuenlC?=
 =?utf-8?B?MURlTm5ZT3BwUVdVb00rTmtKNHp2aTcxc3ZoQUhCZVEwclhJdU9TUDdOb1hC?=
 =?utf-8?B?YmZMeURsUDdweVBLa29UMi9weWZWSTdyQVNOVjZtWU9yVDlzM1JZejVNMStv?=
 =?utf-8?B?ZGUrdHRwQkZlK1lqdExxVkVydllZU0FzUlZNYnhUdm84MzkxRXFJbnRaR2Nv?=
 =?utf-8?B?Q1VKam1UcEJqVlorVkN4ZS9HeFZ1K2d0R1M1SkNyWXhuNHE5MWZrRndNSkty?=
 =?utf-8?B?aTQzKzZTN3Y5ZmNnS3F5ZmRKSE1YNVFnbWR4N1VjdTlQSjFxS3NXazk3NVl2?=
 =?utf-8?B?SS8wUFA3dS9Ca1dwaFlFM2lxSkxSSStBRUlMeVVySWl2UkdsT3pjTXFHcldZ?=
 =?utf-8?B?bFRCVDZUWHhZbHB3SW1MdDl5aGNsMXR3d1M1NHdITEIyc0JoQmhLNHFLYi9O?=
 =?utf-8?B?MmQreHg2QWRERk11VlcwdXEzVjVsR3A3NnpBdjdqUityd0FkTjNnL0ZOQkh4?=
 =?utf-8?B?bHRWUU02eTFlLzVWQW1GQzEvKzFMVm5CTEJxU3RQVWVYMzlSQVhHSTVPalkz?=
 =?utf-8?B?VW5zQmNMbGF4cmNsSzBkOXF3R3pXeXloVjZGRkwxaHgzWkhmNW9GZ0N0bTJQ?=
 =?utf-8?B?NVkvU3FPbDBTL0hlc1B2YlFGd2dSczg2aXIzV29tOWhhdU5MQ2NaQjZyWExv?=
 =?utf-8?B?ajRvY0lvckZheDBrMzhNWFZ4bmpFcFh5Y3RhZWhYbjhGbTIrbytkODZZODBJ?=
 =?utf-8?B?aUt5ZFR3NHl2Wll3R2pxeXV1Rk90cThZR3dUcml0b1lHcnA0WDBUMmVPMlFv?=
 =?utf-8?B?RUJpVVNqSFpEdG9sY1dxK1ViQ3BMWU5zQWJYb0pzRUdHbHJZWWtMOGltMDBu?=
 =?utf-8?B?QnM0MGh2ZDBwcHVxenpVS0tmYjhOMS9nckZaVUtFUnpQVEExN0dCemR0a0dH?=
 =?utf-8?B?YjlPWHg2aUY2SGEzNXIxK1FxSVpRb1dWZHVWZFBUM0V6bCtyS1lVMUZQU2Jl?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QAE/y/dxmDZvwvyGjeiprgldD4hjoVTjQe7uD+NfMxsNB6iwXNhugTha/Mpe8ws1600OGczQRRtJ19sddPuCzBFYUrYhvkuAKGUwL8OVqu+oKFhIffpTGq8xmHN1SIlKQtxWlrzYMgXFy+bQEg2qGldWykAT6/RYh1gE9otGe0EqUaphvPCtOHh9Q5LfzTk8ZDnOWF71/d4cnvt0gJQmAkt7mdV5ZgJ6jbDpGqckmsSvBZ4pBptrFGSc2RpUwsWCggYBiZBblKOmMNJZo+pPMyZknkyj5/CteOPs6m+Pwj43WGiwT/6ISCaDKDsFr6C6SDW/sny2gyYV3ZVtx20BfyqtIikWpgkhOwYLVfec7omxL30DhC63YOG2O38bwtZFbgOya3Q0X2CEaMgxJEJNw9lnITOvwXAw9X3JkorIy8fGKC8Vn60PyP2u9MiBB3sT2GYsTuxqJ4V21Pb+DsUjL11JcQ5b7ZbyzFDSfxopiyxHmx78lSFfubQwb+DjH8Ne3xZcj5gLW0Otb2f9u4CgmPji3x6QalyLNTeQQZc0X0fnECoA9aEjP3QEe7iNS+/jRRkvmnG4fIZg4oVv9m5Wp3i8CuU/ac6iLWLO9ZIBc4D5rbIzTA1F36lwz7WU9UVK8NP5zuYMO0POZV3algpmnXq5g3hxLI7Ox/nbY/iMJsQJNXLJIXSZph8Ox7jNQO2PrNtzOeM+CPFHOuYFdbEEiOePFGN7ojb7HZdwBq2GbK0P/rD13mf72FxJkSSIniaW+AjYTz3E8wnjML/hMQuotUVBoH6k/DnXlUUaeYrTG34=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8238b389-a79c-49f8-341e-08db2ae26d8a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:33:39.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeTKFciF4AdUszlJ+mKCUJNi3OpTIrF34ofNV0PMRorROIUpf5l2kpPE4f9UHm3z6l5S9s6Ty+YMQTsffyBxBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5313

The handling of the MSI-X table accesses by Xen requires that any
pages part of the MSI-X related tables are not mapped into the domain
physmap.  As a result, any device registers in the same pages as the
start or the end of the MSIX or PBA tables is not currently
accessible, as the accesses are just dropped.

Note the spec forbids such placing of registers, as the MSIX and PBA
tables must be 4K isolated from any other registers:

"If a Base Address register that maps address space for the MSI-X
Table or MSI-X PBA also maps other usable address space that is not
associated with MSI-X structures, locations (e.g., for CSRs) used in
the other address space must not share any naturally aligned 4-KB
address range with one where either MSI-X structure resides."

Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
in the same page as the MSIX tables, and thus won't work on a PVH dom0
without this fix.

In order to cope with the behavior passthrough any accesses that fall
on the same page as the MSIX tables (but don't fall in between) to the
underlying hardware.  Such forwarding also takes care of the PBA
accesses, so it allows to remove the code doing this handling in
msix_{read,write}.  Note that as a result accesses to the PBA array
are no longer limited to 4 and 8 byte sizes, there's no access size
restriction for PBA accesses documented in the specification.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Slightly adjust VMSIX_ADDR_SAME_PAGE().
 - Use IS_ALIGNED and unlikely for the non-aligned access checking.
 - Move the check for the page mapped before the aligned one.
 - Remove cast of data to uint8_t and instead use a mask in order to
   avoid undefined behaviour when shifting.
 - Remove Xen maps of the MSIX related regions when memory decoding
   for the device is enabled by dom0, in order to purge stale maps.

Changes since v1:
 - Properly handle the PBA also.
 - Merge the handlers for adjacent writes into the existing MSIX table
   ones.
---
 xen/drivers/vpci/msix.c | 347 ++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c |   7 +-
 xen/include/xen/vpci.h  |   8 +-
 3 files changed, 274 insertions(+), 88 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index bea0cc7aed..bcd61fcd8b 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -27,6 +27,11 @@
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
      (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
 
+#define VMSIX_ADDR_SAME_PAGE(addr, vpci, nr)                              \
+    (PFN_DOWN(addr) >= PFN_DOWN(vmsix_table_addr(vpci, nr)) &&            \
+     PFN_DOWN(addr) <= PFN_DOWN(vmsix_table_addr(vpci, nr) +              \
+                                vmsix_table_size(vpci, nr) - 1))
+
 static uint32_t cf_check control_read(
     const struct pci_dev *pdev, unsigned int reg, void *data)
 {
@@ -149,7 +154,7 @@ static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
 
         for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
             if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
-                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
+                 VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
                 return msix;
     }
 
@@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
-static void __iomem *get_pba(struct vpci *vpci)
+static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
 {
     struct vpci_msix *msix = vpci->msix;
     /*
-     * PBA will only be unmapped when the device is deassigned, so access it
-     * without holding the vpci lock.
+     * Regions will only be unmapped when the device is deassigned, so access
+     * them without holding the vpci lock.
      */
-    void __iomem *pba = read_atomic(&msix->pba);
+    void __iomem *table = read_atomic(&msix->table[slot]);
+    paddr_t addr = 0;
+
+    if ( likely(table) )
+        return table;
+
+    switch ( slot )
+    {
+    case VPCI_MSIX_TBL_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_TABLE);
+        fallthrough;
+    case VPCI_MSIX_TBL_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_TABLE);
+        break;
 
-    if ( likely(pba) )
-        return pba;
+    case VPCI_MSIX_PBA_TAIL:
+        addr = vmsix_table_size(vpci, VPCI_MSIX_PBA);
+        fallthrough;
+    case VPCI_MSIX_PBA_HEAD:
+        addr += vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        break;
+    }
 
-    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
-                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
-    if ( !pba )
-        return read_atomic(&msix->pba);
+    table = ioremap(round_pgdown(addr), PAGE_SIZE);
+    if ( !table )
+        return read_atomic(&msix->table[slot]);
 
     spin_lock(&vpci->lock);
-    if ( !msix->pba )
+    if ( !msix->table[slot] )
     {
-        write_atomic(&msix->pba, pba);
+        write_atomic(&msix->table[slot], table);
         spin_unlock(&vpci->lock);
     }
     else
     {
         spin_unlock(&vpci->lock);
-        iounmap(pba);
+        iounmap(table);
     }
 
-    return read_atomic(&msix->pba);
+    return read_atomic(&msix->table[slot]);
 }
 
-static int cf_check msix_read(
-    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+unsigned int get_slot(const struct vpci *vpci, unsigned long addr)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
-    const struct vpci_msix_entry *entry;
-    unsigned int offset;
+    unsigned long pfn = PFN_DOWN(addr);
+
+    /*
+     * The logic below relies on having the tables identity mapped to the guest
+     * address space, or for the `addr` parameter to be translated into its
+     * host physical memory address equivalent.
+     */
+
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE)) )
+        return VPCI_MSIX_TBL_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_TABLE) +
+                         vmsix_table_size(vpci, VPCI_MSIX_TABLE) - 1) )
+        return VPCI_MSIX_TBL_TAIL;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA)) )
+        return VPCI_MSIX_PBA_HEAD;
+    if ( pfn == PFN_DOWN(vmsix_table_addr(vpci, VPCI_MSIX_PBA) +
+                         vmsix_table_size(vpci, VPCI_MSIX_PBA) - 1) )
+        return VPCI_MSIX_PBA_TAIL;
+
+    ASSERT_UNREACHABLE();
+    return -1;
+}
+
+static bool adjacent_handle(const struct vpci_msix *msix, unsigned long addr)
+{
+    unsigned int i;
+
+    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+        return true;
+
+    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_TABLE) )
+        return false;
+
+    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
+        if ( VMSIX_ADDR_SAME_PAGE(addr, msix->pdev->vpci, i) )
+            return true;
+
+    return false;
+}
+
+static int adjacent_read(const struct domain *d, const struct vpci_msix *msix,
+                         unsigned long addr, unsigned int len,
+                         unsigned long *data)
+{
+    const void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
 
     *data = ~0ul;
 
-    if ( !msix )
-        return X86EMUL_RETRY;
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+    mem = get_table(vpci, slot);
+    if ( !mem )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, returning all bits set\n",
+                &msix->pdev->sbdf);
+        return X86EMUL_OKAY;
+    }
+
+    if ( unlikely(!IS_ALIGNED(addr, len)) )
     {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
+        unsigned int i;
+
+        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
+                &msix->pdev->sbdf);
 
         /*
-         * Access to PBA.
+         * Split unaligned accesses into byte sized ones. Shouldn't happen in
+         * the first place, but devices shouldn't have registers in the same 4K
+         * page as the MSIX tables either.
          *
-         * TODO: note that this relies on having the PBA identity mapped to the
-         * guest address space. If this changes the address will need to be
-         * translated.
+         * It's unclear whether this could cause issues if a guest expects a
+         * registers to be accessed atomically, it better use an aligned access
+         * if it has such expectations.
          */
-        if ( !pba )
-        {
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, report all pending\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
 
-        switch ( len )
+        for ( i = 0; i < len; i++ )
         {
-        case 4:
-            *data = readl(pba + idx);
-            break;
+            unsigned long partial = ~0ul;
+            int rc = adjacent_read(d, msix, addr + i, 1, &partial);
 
-        case 8:
-            *data = readq(pba + idx);
-            break;
+            if ( rc != X86EMUL_OKAY )
+                return rc;
 
-        default:
-            ASSERT_UNREACHABLE();
-            break;
+            *data &= ~(0xfful << (i * 8));
+            *data |= (partial & 0xff) << (i * 8);
         }
 
         return X86EMUL_OKAY;
     }
 
+    switch ( len )
+    {
+    case 1:
+        *data = readb(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        *data = readw(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        *data = readl(mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        *data = readq(mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msix_read(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+    const struct vpci_msix_entry *entry;
+    struct vpci *vpci;
+    unsigned int offset;
+
+    *data = ~0ul;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_read(d, msix, addr, len, data);
+
+    vpci = msix->pdev->vpci;
+    if ( !access_allowed(msix->pdev, addr, len) )
+        return X86EMUL_OKAY;
+
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
@@ -303,57 +416,103 @@ static int cf_check msix_read(
     return X86EMUL_OKAY;
 }
 
-static int cf_check msix_write(
-    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
+                          unsigned long addr, unsigned int len,
+                          unsigned long data)
 {
-    const struct domain *d = v->domain;
-    struct vpci_msix *msix = msix_find(d, addr);
-    struct vpci_msix_entry *entry;
-    unsigned int offset;
+    void __iomem *mem;
+    struct vpci *vpci = msix->pdev->vpci;
+    unsigned int slot;
 
-    if ( !msix )
-        return X86EMUL_RETRY;
+    if ( !adjacent_handle(msix, addr + len - 1) )
+        return X86EMUL_OKAY;
 
-    if ( !access_allowed(msix->pdev, addr, len) )
+    /*
+     * Only check start and end of the access because the size of the PBA is
+     * assumed to be equal or bigger (8 bytes) than the length of any access
+     * handled here.
+     */
+    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
+          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
+         !is_hardware_domain(d) )
+        /* Ignore writes to PBA for DomUs, it's undefined behavior. */
         return X86EMUL_OKAY;
 
-    if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
+    slot = get_slot(vpci, addr);
+    if ( slot >= ARRAY_SIZE(msix->table) )
+        return X86EMUL_OKAY;
+
+    mem = get_table(vpci, slot);
+    if ( !mem )
     {
-        struct vpci *vpci = msix->pdev->vpci;
-        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
-        const void __iomem *pba = get_pba(vpci);
+        gprintk(XENLOG_WARNING,
+                "%pp: unable to map MSI-X page, dropping write\n",
+                &msix->pdev->sbdf);
+        return X86EMUL_OKAY;
+    }
 
-        if ( !is_hardware_domain(d) )
-            /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
-            return X86EMUL_OKAY;
+    if ( unlikely(!IS_ALIGNED(addr, len)) )
+    {
+        unsigned int i;
 
-        if ( !pba )
-        {
-            /* Unable to map the PBA, ignore write. */
-            gprintk(XENLOG_WARNING,
-                    "%pp: unable to map MSI-X PBA, write ignored\n",
-                    &msix->pdev->sbdf);
-            return X86EMUL_OKAY;
-        }
+        gprintk(XENLOG_DEBUG, "%pp: unaligned write to MSI-X related page\n",
+                &msix->pdev->sbdf);
 
-        switch ( len )
+        for ( i = 0; i < len; i++ )
         {
-        case 4:
-            writel(data, pba + idx);
-            break;
+            int rc = adjacent_write(d, msix, addr + i, 1, data >> (i * 8));
 
-        case 8:
-            writeq(data, pba + idx);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            break;
+            if ( rc != X86EMUL_OKAY )
+                return rc;
         }
 
         return X86EMUL_OKAY;
     }
 
+    switch ( len )
+    {
+    case 1:
+        writeb(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 2:
+        writew(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 4:
+        writel(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    case 8:
+        writeq(data, mem + PAGE_OFFSET(addr));
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return X86EMUL_OKAY;
+}
+
+static int cf_check msix_write(
+    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long data)
+{
+    const struct domain *d = v->domain;
+    struct vpci_msix *msix = msix_find(d, addr);
+    struct vpci_msix_entry *entry;
+    struct vpci *vpci;
+    unsigned int offset;
+
+    if ( !msix )
+        return X86EMUL_RETRY;
+
+    if ( adjacent_handle(msix, addr) )
+        return adjacent_write(d, msix, addr, len, data);
+
+    vpci = msix->pdev->vpci;
+    if ( !access_allowed(msix->pdev, addr, len) )
+        return X86EMUL_OKAY;
+
     spin_lock(&msix->pdev->vpci->lock);
     entry = get_entry(msix, addr);
     offset = addr & (PCI_MSIX_ENTRY_SIZE - 1);
@@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
         }
     }
 
+    if ( is_hardware_domain(d) )
+    {
+        unsigned int i;
+
+        /*
+         * For the hardware domain only remove any hypervisor mappings of the
+         * MSIX or PBA related areas, as dom0 is capable of moving the position
+         * of the BARs in the host address space.
+         *
+         * We rely on being called with the vPCI lock held in order to not race
+         * with get_table().
+         */
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+            {
+                iounmap(pdev->vpci->msix->table[i]);
+                pdev->vpci->msix->table[i] = NULL;
+            }
+    }
+
     return 0;
 }
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6d48d496bb..652807a4a4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -54,9 +54,12 @@ void vpci_remove_device(struct pci_dev *pdev)
     spin_unlock(&pdev->vpci->lock);
     if ( pdev->vpci->msix )
     {
+        unsigned int i;
+
         list_del(&pdev->vpci->msix->next);
-        if ( pdev->vpci->msix->pba )
-            iounmap(pdev->vpci->msix->pba);
+        for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->table); i++ )
+            if ( pdev->vpci->msix->table[i] )
+                iounmap(pdev->vpci->msix->table[i]);
     }
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d8acfeba8a..0b8a2a3c74 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -133,8 +133,12 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
-        /* PBA map */
-        void __iomem *pba;
+        /* Partial table map. */
+#define VPCI_MSIX_TBL_HEAD 0
+#define VPCI_MSIX_TBL_TAIL 1
+#define VPCI_MSIX_PBA_HEAD 2
+#define VPCI_MSIX_PBA_TAIL 3
+        void __iomem *table[4];
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.40.0


