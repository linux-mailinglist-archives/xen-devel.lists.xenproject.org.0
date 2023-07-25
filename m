Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A58F761949
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569675.890613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkd-0005hf-UB; Tue, 25 Jul 2023 13:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569675.890613; Tue, 25 Jul 2023 13:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHkd-0005ez-Qv; Tue, 25 Jul 2023 13:06:55 +0000
Received: by outflank-mailman (input) for mailman id 569675;
 Tue, 25 Jul 2023 13:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3G+=DL=citrix.com=prvs=56320e048=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOHkc-0003uq-9c
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:06:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f372882-2aec-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:06:53 +0200 (CEST)
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 09:06:51 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:06:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 13:06:49 +0000
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
X-Inumbo-ID: 1f372882-2aec-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690290413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8h94lYnckg0tD+pN5EVmt3fI//N3Vydy/cqPpyKBrQo=;
  b=hLZFRLreukjkjmYEWIMxHGqfiAgCPjLQ7+9NvCyrMQHU5Zs91OQhq8yG
   S/ytbkDO6LohsErBh1E3F/RHnPli+kmHL6RuGH2jbZmLE3JDAuLA00uzN
   FzoOB/1o71ZJnMb6sb/mL5BzEbfdQSHHWSdtXJ8kgZuHVUvEVH6Ttjn9O
   s=;
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 117381056
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cGTcoK3T0sBB2+9Io/bD5fdwkn2cJEfYwER7XKvMYLTBsI5bpzUBz
 WJKCz/XO/iONGKmeIx2Otvj8EpTuJbRmoVlGgA/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOj9Nq
 tpHJw00bwm8wMWv/em7S7FPmZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1EZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r137CUzXqjBdx6+LuQ/aJPglye520pVyYdFlqlp6iBh2WGYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZiFFQMwrsokxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaPCEUKSoJYnYCRA5cut37+ths01TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRP+ZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:JI4szKwbv3O7ecj5K3+3KrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-Talos-CUID: 9a23:fiZWLGNCS0LeUO5DY3dkq2hLFf0cc2Tii1DJHhS4CD5KV+jA
X-Talos-MUID: 9a23:go6S4AQaWtZ4cXdfRXTn2BRgNcpJ4p7xM0tOkIsA6vGJHhRJbmI=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117381056"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdFIcAWrIrreNII2IBy/vsOV4e6ygiJo3meTf5PdODv2bAD9bvZaoBlGhCbThEx/f9T1AxTqv8M7lU4pCLza/3+WDlNCpHzvbUsqmDD+eckqjFT801+2D4/tyRh2NKRVPOhcZqpH8OZbnAsntdtlCoq5S9X+tzOFMBMhG6Ijcn9jQcjPMsfPEWtcXHVMeE8SFrMGCALHVr+EspJsf0/ku6wr/GaL3lkvyOo2q5HK2YnsuIGcTrp/gqI5GPt5Ps/CfZNf5Eq98HP1SZzQEGcpbvr7Ejo6jBcpoFOeq5gEnrYVckiBbB00AhWw3XhFsRsqMTqzN1IlE7Hhotz/arAnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkXSjb3Rn7PBge9Ur09P08ZeEBi8VRA2CbzLrLn2KAg=;
 b=fTlP60mScZM/FOJl/eSxo1k09CrSYsRjth07E5GXFpsGa2p2TX7vQoD623rBU87uOzgDxo2QssSY/CwXyF0vqVeHUH1NnLycwLtiIWUuMIcJBoHnyuDMCjFXivIUcFACS2+1Gi4nO90JMR/AqeHrDczE0NsGilIX4c+V8WfXHVFTpbuJyZZTZ9fuLjR6ebldNSMyQEbayWyNUVmOOI4AZk8nJv/cyhhLNOeB1/sNyuAGAV3umGi6OhscpB/PsL/YmmjJsABx19V8dluqGc9xmPjrMUzXWQkdcQPhJQgwM7WwWOej89ggEs3nKSBeFPlOmh3Oh2u1lg1ZIsynRKkR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkXSjb3Rn7PBge9Ur09P08ZeEBi8VRA2CbzLrLn2KAg=;
 b=XZ/7p1Pi6PXpxBFCIZKyNukTXmN6X4gKWIgmNWEF8c308GpdmWfZYAmmxamLyATl3DkNxqj4eGURk0XCIPARPZave06Kei2SJ5eeZVuG1JbPps2Nhw/OOrQ8TtlDZm2FlmpLU360lWfIqZqxhv+S070UEmsz47MDm1MOvdsD7/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 6/6] libxl: add support for parsing MSR features
Date: Tue, 25 Jul 2023 15:05:58 +0200
Message-ID: <20230725130558.58094-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725130558.58094-1-roger.pau@citrix.com>
References: <20230725130558.58094-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0468.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::24) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b71db7-93f5-46de-11ec-08db8d10014d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pdC8HJ24MckIsjVkpCU3dR8pauJH4DDum1JnCrj24clURoVopgExhMe65UNFFnQGVlk6sbCcXUnlUN9gvnq+UWn3t/MYCpp3d6qPoINcMpfiU9stj8cfEWelckzDZD/nigZTAsDAMoFRj1LJ5FyS9c8g5+JjfJDpCzbx9Z+dy1GTIoiFRGKhKLp65XTdy1fBOx1E4VQ6c1x4f+Qmel8325VHzpHzKRbtkC0RqAEFLttf9Hwu6VkAXHtZTHpIX0rSetwkZmUJ1gr3YcmiXN9YPOOgE/1xqa6f2nI0cFfKxqTMVAtZk7qUjrBgOH5Y4919zQpNRZv0FkXMNa7d3/U5XJzsQ0q+QqenV1AzUsZ0lsoZXQOf1O4Npd/LXkbTG+VcAkPAL9xFC3TFZWY/Cg95woy9frBfEF1ADU7qQgK+js0/OEY20maThBHMsW1q3cs0noQARZl1n2aGwXlbThnJWmjYQ1Oswgrsn5cnKr1Mll3RjfoluLo99vcQUs8JVg03rqCsiZ35ujzqU2OgLtqEddg9UhZ02OArFfybOHw/CMcibCMzvyy1DQyMFR7UWnIQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(6486002)(6666004)(82960400001)(478600001)(83380400001)(8936002)(1076003)(26005)(6512007)(6506007)(66946007)(38100700002)(66556008)(54906003)(6916009)(4326008)(66476007)(186003)(2616005)(5660300002)(8676002)(2906002)(316002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NytuRnB6cUhEZCtBODZBa0VSR2VOU3dRcG9KSFJBQUZXUndnVmh1elBHU3lE?=
 =?utf-8?B?YVA5SGZYTE5tTFRCdnJtWlBKMWhTdnlXZEpwVllLU3dUNHR5a3hIRDFqVmxG?=
 =?utf-8?B?ZVJvb2M5SENQelZneWI5elAxK2svZXd4K3o3RFNLVlpSeWsrUnpySWIrRWVi?=
 =?utf-8?B?QW9BcldQV0xHYUhKbytlS3NPaTB0dnpVU3NLYUtMdnVqc3MvaDRuSmNhbEt2?=
 =?utf-8?B?eVlwSGQ1YlBMbW10SWxyVjkrT0ZKeEIxM3pXbUo1VEttN3p2TDlEYW5HbTZP?=
 =?utf-8?B?ci9jbmw5Q1U1Z2tGSS9GSS9iQjBldzBZRmgydUFqdllSRzdGOXZLNm9CMnF2?=
 =?utf-8?B?VWhFQUswbUl1VDVXc2ZWbjVobjE4bmRVMEgyRWI2ckZENHRtc3dSQktzKzU1?=
 =?utf-8?B?SUFDZGtQUm5JbDE1d2dvZWZTSXZKV2tEQStMUzJNaDNlbFlvcjk3WlFpMmM1?=
 =?utf-8?B?Q2FMR05leGlvMmZkLzZHQlYyZWZyTmhFN2dESDhDRGdRVjQvNUZNbUhRODg4?=
 =?utf-8?B?NDkyV3VtT2dzdmR1YzFMaE5CTHYvZm0yUkt0TFFRTHhiQXlvVitmSkc4S2Y5?=
 =?utf-8?B?SXV0RHgrQVMzRjVRUUVudUxvZi8va0UxWVI4aUZYampJTlpBZ1hmbFN2d3VT?=
 =?utf-8?B?N01ZbDByVTUyNk9URVBLOE85RzZFQjBFQnFnSXNnYW9MRkJqTUw2WTBHcXU4?=
 =?utf-8?B?QlZnaThFZ2tta2lHSFN3RXV1WTNvQzZqU08xeHFYNTZuRkg1MmNvbCtwalFM?=
 =?utf-8?B?MmdHS25NVHZNTEhUNURzS1RueFJLTXB3OUNoTDdndmEzOEZQV1NUeFNxUXh4?=
 =?utf-8?B?Ty9GRkpMZ09FTHNNWW5KdGx0RnM1N0tjbzMzeWNLUllKZkVTUEthYXBXUG0y?=
 =?utf-8?B?Q3RGT2ZCOTBDSWlMYTFKemFBTS9mUFA3endMT1d2azQ1ZG0rVGRveWgvZXpo?=
 =?utf-8?B?Nk9MSTdyVFpncU52enpqa2FpTTBxTDBsWHdjemdOWDhDTGZjMzBOVVlyWkE0?=
 =?utf-8?B?RFpZdlN2dndDOFU0dlNXQjN5eGpWOUpuTXY1VXNkcEtyNXhhMGNjdS93T1JQ?=
 =?utf-8?B?TnZoN0dqR1ZIWks0WXJNNk1JdnZ4aE45d3Y1aFBVU2c0dThBd0RGc3VPZzBq?=
 =?utf-8?B?SWVCQ3BCTHdMaUZueUVvbEl4by9TTE1rM1lmU2crWDUveHI2VENkbjhQUUo4?=
 =?utf-8?B?OWM3YWFpenNJK2FVZDBacTBJb0k1WFh2Z2kzTHh6TDZrOGJvRWhTcnFxNWNV?=
 =?utf-8?B?aDVlWVRQQThYeHhnVGZqdlJpYlFGeU9nd0gvSWFaVHVodTJRV1F5NkdBU1BP?=
 =?utf-8?B?MXhEWmYweDZkcS9paG1ma0RuNjNlL3hvckNvVnN1cEVBUnI3bnpQQmszVFE3?=
 =?utf-8?B?a3pDU05UeC9zZGVkTnhTeWg3K1F6L0NMcWZlUTJ1L1cyMFovM25uNzNubW1T?=
 =?utf-8?B?dGxLb3RlaXZxQS9JOE03NThFMVUyTG5GQ284ZDV2bUpsd3FiNzBkdjhFTFBU?=
 =?utf-8?B?V3BoU3o3anRhZVJFMGx2MjRSSk1HYkhVQzFua0NOcnZBcnR3UnJjaFdlbm0v?=
 =?utf-8?B?YzZteUI2Kzk1OW9Rb2w0M3F5RG10WHBvZ1lsbGUrT3luTU1TVVpNV01UeFFM?=
 =?utf-8?B?aWphV1I3cU4wdCs0alBNQ2laeld5MERLTjZpSkVDdE5IQnZUdTU4c2NmQkE1?=
 =?utf-8?B?RHJaVi9XMmkzQUVZVDNKUm9LNEk2ZzZzSW1SM0xRQlBtcE5EYXN4VGcwMm16?=
 =?utf-8?B?L2grRlVQREl1NFA4eEkxM2lnbHArQnRGRmp0U3RzeStLWGhhOVhJVVUzSk9R?=
 =?utf-8?B?ZU5yMFhnVWxOeTM0MHBlc3ZmalNiZ0E3akp2MTNVRVk5MWFsUXVXZGJMdHB3?=
 =?utf-8?B?QmxWaG1OTXI0TkpudndScjhvVWpMdi83cGhFWHQyN1M1VHpwcU9xY21NSVA3?=
 =?utf-8?B?empmTFBlbndXYTVOeHJ2OWhsekU4U2pLamlTUlUyVU8raUg2Umd4MmlBWHZL?=
 =?utf-8?B?MWtLc2NMT2xGZ2NWcStNSzEwbzVhYnNTNjZhR2Vub0dlUHhka1BJdGhtUzE1?=
 =?utf-8?B?U2Z5R25la3VlT1V5TC84S3BwTlZtUFdDUmpkZENjQ010bDBDelh6eTgveUJw?=
 =?utf-8?B?ckRMS3VqeGlMZGJqdWl0bDVXc3Z6dEVaeWtBTDJGU3VwQUk5dHhTbHFJcGhh?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gNUl+olermFwWatXLxRTLCtbQC9SFNi043oOCQKtnuw5QtlLYq7WTNleBPMKRRoUXJzdi1ZuHaH0bd8/oS4FK2BuuAOwDJkDlXDohIsOu4wZGCK+sE8LUDCf8sTezQcSqwYF8yFBpdHO0vQZ7n7xDqI0u/3upmk9EDsb5TgSETctuOkGjILRLN7SteYoxX0KkMpZydUMNJF1GhzAfzpCHsIrx3H4anHCKw8KVPZNyzkTdGpcjvAsxNuz4qGj2KPCoQAD75yYVJ0GFavfs2gGmq9ZLMoSEtHMyGPvLxE59QcGi3JlqgzXGNM/3uGKMgHYuS8lvX7FN6QqufjN/ru9GVTnpBKxz3OH4TzKe6Adz20t2PILWeYZEt9gEHXJSJXSldG2Kcij4Ad1ImIEg7IjjqP+makoN3ii9YY+nCjQYMxZUhBKP8ISz66k1XoYcOzJB6ZISd/5lMsOMuXXWttjflIhPOxrsFcGSTGxl3szx7CIhoO4OKoQXcHxibEaKwPWn67GPRNdvSAnBliejRxIl8HT/fFr8cTpF2cal1krgxiCMz8fusr8je5ZXwd6gMC8J+U0Tipqs/8WpzSWCw3yq3KUXxUOlPUQZWtJmIbkQPwmlvgQdq2+CQVFye7zMoinMuugq+l9zRBZmkwijpjmRr3mXyfVTnlkCNRWJVT5xIfkvC2eViwxeMdRU1CgzH9xwOLpIIhOC/wAq0phnzfzEfFTXioxt9t/iOgUq5Chjyd5kEExvYYdtPcwgoObDN5WbzkV/80886tE+27Yb5gng0i0qoQgOvZcAPssZK3pmAKu2rySttK2kWQ+Rhvkwrvv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b71db7-93f5-46de-11ec-08db8d10014d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:06:48.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xamPO9QI13iSAP66uF7DBsx8p2If9I1fdT1qK/gTq60bJF9d89n5J5P/CclpymQBpYDtl9gJez0AOxzbLGZTrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

Introduce support for handling MSR features in
libxl_cpuid_parse_config().  The MSR policies are added to the
libxl_cpuid_policy like the CPUID one, which gets passed to
xc_cpuid_apply_policy().

This allows existing users of libxl to provide MSR related features as
key=value pairs to libxl_cpuid_parse_config() without requiring the
usage of a different API.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Add some braces.
---
 tools/libs/light/libxl_cpuid.c | 64 +++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 0daa564abb81..46dd2ce5f9e3 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -157,6 +157,60 @@ static int cpuid_add(libxl_cpuid_policy_list *policy,
     return 0;
 }
 
+static struct xc_msr *msr_find_match(libxl_cpuid_policy_list *pl, uint32_t index)
+{
+    unsigned int i = 0;
+    libxl_cpuid_policy_list policy = *pl;
+
+    if (policy == NULL)
+        policy = *pl = calloc(1, sizeof(*policy));
+
+    if (policy->msr != NULL) {
+        for (i = 0; policy->msr[i].index != XC_MSR_INPUT_UNUSED; i++) {
+            if (policy->msr[i].index == index) {
+                return &policy->msr[i];
+            }
+        }
+    }
+
+    policy->msr = realloc(policy->msr, sizeof(struct xc_msr) * (i + 2));
+    policy->msr[i].index = index;
+    memset(policy->msr[i].policy, 'x', ARRAY_SIZE(policy->msr[0].policy) - 1);
+    policy->msr[i].policy[ARRAY_SIZE(policy->msr[0].policy) - 1] = '\0';
+    policy->msr[i + 1].index = XC_MSR_INPUT_UNUSED;
+
+    return &policy->msr[i];
+}
+
+static int msr_add(libxl_cpuid_policy_list *policy, uint32_t index, unsigned int bit,
+                   const char *val)
+{
+    struct xc_msr *entry = msr_find_match(policy, index);
+
+    /* Only allow options taking a character for MSRs, no values allowed. */
+    if (strlen(val) != 1)
+        return 3;
+
+    switch (val[0]) {
+    case '0':
+    case '1':
+    case 'x':
+    case 'k':
+        entry->policy[63 - bit] = val[0];
+        break;
+
+    case 's':
+        /* Translate s -> k as xc_msr doesn't support the deprecated 's'. */
+        entry->policy[63 - bit] = 'k';
+        break;
+
+    default:
+        return 3;
+    }
+
+    return 0;
+}
+
 struct feature_name {
     const char *name;
     unsigned int bit;
@@ -336,7 +390,15 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
     }
 
     case FEAT_MSR:
-        return 2;
+    {
+        unsigned int bit = feat->bit % 32;
+
+        if (feature_to_policy[feat->bit / 32].msr.reg == CPUID_REG_EDX)
+            bit += 32;
+
+        return msr_add(policy, feature_to_policy[feat->bit / 32].msr.index,
+                       bit, val);
+    }
     }
 
     return 2;
-- 
2.41.0


