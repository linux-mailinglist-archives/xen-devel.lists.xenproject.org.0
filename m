Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4CD6CA100
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 12:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515132.797706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjqI-0007im-4W; Mon, 27 Mar 2023 10:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515132.797706; Mon, 27 Mar 2023 10:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgjqI-0007gD-1j; Mon, 27 Mar 2023 10:12:46 +0000
Received: by outflank-mailman (input) for mailman id 515132;
 Mon, 27 Mar 2023 10:12:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d31z=7T=citrix.com=prvs=4435eb1af=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pgjqG-0007g0-W3
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:12:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7604559-cc87-11ed-b464-930f4c7d94ae;
 Mon, 27 Mar 2023 12:12:41 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Mar 2023 06:12:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MN2PR03MB5214.namprd03.prod.outlook.com (2603:10b6:208:1ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 10:12:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 10:12:35 +0000
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
X-Inumbo-ID: e7604559-cc87-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679911961;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uHFscnL0ZNL/uVUdYNF6Ze8Wzf1U5/EnxyRslIfM+3o=;
  b=OmF05ytCcyBqelSlf/bw1BrclXcFNgYitKp28FfW37J3O241FzVo3Y7E
   iJ2lWHv+ob4pTTiN9lmCtBiJvhKUtbGqdA7HgP8zelcUXCWde7TIRQlSd
   l5nR6pelAAEKYavHnr2HSAkGVxwKHV1lM2OUuSZ+RqpfpvS5Lpt1z8uqe
   I=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 103349369
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8FH506i5GEfryhI9HrL4wpt7X161vREKZh0ujC45NGQN5FlHY01je
 htvXmCFMv2NMGajeY9wbtywpxsAusDUx9IwQAU/rio9RSkb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQiMTAMcw/EutuNxavmZ7JRpZ4CEJXCadZ3VnFIlVk1DN4AaLWaG+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluG1abI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjA9lORebmp5aGhnW47DYuSy8IW2C2sOKr03K4ePF9E
 WYbr39GQa8asRbDosPGdxixunuNpBMfc9tWDewh6QuJx7bU4gCWHWwNRHhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyYCQREU/trLr4Q6jxaJRdFmeIa3hNDoHTD7w
 xiRsTMzwb4UiKYjyKGT7V3BxTW2qfD0ohUd4wzWWieg8Vl/bYv8P4iwswGDtLBHMZqTSUSHs
 D4cgc+C4esSDJaL0iuQXOEKG7Lv7PGAWNHBvWNS81Aa32zF0xaekUp4uVmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:JbacT6O7i48/6MBcTj+jsMiBIKoaSvp037Dk7TEKdfUzSL3rqy
 nOpoVp6faaskdvZJhNo6H8BEDEewKtyXcX2/hhAV7BZnibhILAFugLnOiSoUyEakmOkZ866U
 4jSdkENDSaNykCsS+V2njBLz9t+qj4zEgn7d20859/JjsBV0ljhD0VNu/NKCFLrFEtP/UE/J
 323KR6TzzKQxUqhsDRPBk4dtmGmfXWmZL6QTNuPW9T1DWz
X-IronPort-AV: E=Sophos;i="5.98,294,1673931600"; 
   d="scan'208";a="103349369"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCzqVzXFCapvSgsqnMLhIdPyKXt+OHh7A2rFzwEzxGLLCe7nQ2XMsrg/gO0N2W2HIR33qcX4aQug5eZENUNK6PorQ1qb0E9XNIe/p4nTuTxeckUj0QDo6JfIpZrHy9VjXKDpei3kPbb5lvd/gTSqKKWQYZSY67oowqm7yGbVK6KxqwP9SnljB0EVKshmbMbhP1JC0npqv01W4ISEo9pLarhbD1auV89/rYd19RooYfsFnfO2LInpfAVrxlWje3l9F2zb8MPgIlZM1hrMg3kkVyIIo6a3p1qJ5YPNPgr1fK5NrJmrrI4FJDH3dmZJ3NtwKYx6+J0oA8G0p/F+sjbsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo5dWKE2xHXN07tXbu3fqBhFzZpbMO/vJwx1vsjB3ks=;
 b=cFdUMzmmzxmciJd40iFzvw1/IwkN6s1hj1tBXdxENcSSW4+1dtoFjl+gWLRKFxDZfLvBSD7dLT68Kx3BcM5pygWV/VJynmAjHe6EnS2+hPzGRMYTX/dii6O8ST1EQ35xDf7xPtDn9KRzqw2Ju8BK9aRMbcqD6QXFuvtHljcfevwbqwrFpeU4fdJA7tPKtvZmJ58wkOL3PO33ZgNnIKWdZWVLhAb1Fu7FvZ2Y1aIJxbZFup2ju4a1JZVv0gdFQBjcayg2buBmakK9SUpZwnkpMRIdQ0TNcn1y+/IZ20VMi8d0Am6j0UdQVPdFth0VQJ05y7EBuKecFrrA2nX/DXAVMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo5dWKE2xHXN07tXbu3fqBhFzZpbMO/vJwx1vsjB3ks=;
 b=FBxtkHGwEHXc3vrvaIVU/bTLlP+xqk1gvVir1po/Rt5P3tm7IzxCTdMaAvWgIf5/GEUkuJ0zuX07o7R6GPlqCdDaShAEX2Qaq8CORzfc2lMydiJYJogkQwjRFB7006K7Hdh5LUJFVo2Pk/Nmutm+PoYUtHsg6a+qdE8JZRTat/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Mar 2023 12:12:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/3] x86/msi: passthrough all MSI-X vector ctrl writes
 to device model
Message-ID: <ZCFsDbKfGvn7giN+@Air-de-Roger>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO2P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MN2PR03MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 607e278c-a68d-4b7a-4acb-08db2eabc945
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZbkJ7CNdW6GOsZ7LcCtgetlDEugYBcQ8xc5Zp5NZvZOyWJpbqVVno4RG2F/10P4XK+CuAySPHfra7LeRO4lbPT/03zrBlegMgY7c28QU3JDURyleIbKZ96Bql3pUpPUzAY0OduwglVL69KxDsB9nGPLM+mvME854TPidDo28/JBYgd4vjPop8SSPeTjqvTPNNU4TBu3Ky1KgsW0ZJYJ08G6LgaQkEim0LE7dQiZ4u6UEoPmwqKnoUmtApT9vOztpuVq3lVwNUTTW12t7Yfz3h4iVg5BXsdrTRULztHsCsfGsHFJtFsa6FUrWYOE2zyAaeKSPd2tGeIEJSLcHPdeI893z5qVs6nnwL8c8DlQasXoRAqnCnk+/LYs4ySsOkTfKFbbh4VAdOlT8lZqK758dgZJoy2sfA/SiescP43aTf7QIjB1A5DCRFSZtFsk5wD0KB1z6IjUbEjlQ26Tr1HULEmiIOQzrtN3kJl1WU8QwCF85sUhVKc3/nrDGU61YAfc8kJko+atVF0HHkBgahcaOgWNMNzVDpSoQyXUZYsMjaUhWk+9RZ5gY2i8MSqrM/Vw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(9686003)(6512007)(6506007)(26005)(41300700001)(6666004)(186003)(6486002)(83380400001)(66574015)(478600001)(54906003)(316002)(4326008)(38100700002)(2906002)(6916009)(8676002)(66476007)(66556008)(66946007)(85182001)(82960400001)(33716001)(86362001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0VRS2hERG82dVB3R2wvZXA3MGNhaTlLT3Faa0tVQkhTai9TbnpkVzZUWW50?=
 =?utf-8?B?a2JCNEd6TnVuVlZhVWpuVGFIQWUybGVFMEJ6QmFCN1VvV1RyTnpiblZLQzlp?=
 =?utf-8?B?cjk4aDdsUFUwZmZLeG9nVGVIU3NVMnNMd0lEMTFEWnZxZERISzV6WlQ2OUpk?=
 =?utf-8?B?bWszR1RkWm56a3ZtTllWcEVrYXpuWEVHUlVwYlZkbW0zcWx5OGQySmt1S1By?=
 =?utf-8?B?WGNYZHk4eCtuUDYwQm14NXVzMnJYNFBITXRCamRzZ1o5c3BNK3VrU21kejJx?=
 =?utf-8?B?WkhDRGNvR1J2TUt0ckYwdlU5d1IrSmZCMHBXUkNNSFRBMVR5UkhWeGxvSnNh?=
 =?utf-8?B?ankzNTI2OS9mdUZneTVjYlhILzRYeTIwUVNneDVpcS9OY0FyVEVpT0QyOTdO?=
 =?utf-8?B?aUFsK0QvNGVrK0h4RFBNY1o5ZGlEUGRhc1RjRTFNY1hUR21xTnNnUm1FdWZR?=
 =?utf-8?B?U0NkOEpDTENhTlM4UjZxdmpLTjhHeWZRQVJSVXJvLzhJYzlidCsvVkxEVjg3?=
 =?utf-8?B?R0txYmtHOVVUem1NUjRoMllWbVRYREZUVmYwRXhlWFFuSHBSYmJ0M3VEVlRT?=
 =?utf-8?B?ajdOb0RWMkZPUEdLMHR2NFJXWTNOaEpWSVo2eUErVnJidUswYUtzc3lYTC9Q?=
 =?utf-8?B?QWtaa1V3OTE2cHZubVpRZzgxQUZLaENkN2pvYWU4amo4Wm5uUWFOOS9DU1B3?=
 =?utf-8?B?ekUwSTZtdS9GUU5Ob1c2S3VqUjJYYUpJei9YeWhlZ21POEhxdnVSd1doTDho?=
 =?utf-8?B?T1BLdzFmdVBVS3BnWERmalpUZ3EwQ1hxQnE0WE9DWDNFWlJTYU9wb0ZsYVpv?=
 =?utf-8?B?U1ArZC9wWWJmbGFpaGxuZHZaanVIelZlUzJYYjRFUm5Kd2dGRVBlRjJwbFRW?=
 =?utf-8?B?M1k5Ky96TnUzOWcwUTRPUGpHSjFjOTZ1OFV3dzh5Mi9xL0xPUUx2UDFQL1Mx?=
 =?utf-8?B?QTQyN0p1VHc4VnJhQjBCVjZkcnRKMGtHdEJFYzdaQWpRdmFSSWVKaUQ5R3JT?=
 =?utf-8?B?aCtTYUloa050NWFrUHQyNFVHUk1xOGhvWEZLNGNuVmx6dlQrTndRalpYZWE4?=
 =?utf-8?B?dHRGM0hUd3FDSXBrc213amFaNDBLRzlocDkwWmo2THVWR2FOdlNCSThRVHBo?=
 =?utf-8?B?YlkyanhYcDVnZDlFUjNxd2hzTlQycEtFZmVqaFBKbS9pUC81d0FzK2RqTnlm?=
 =?utf-8?B?NXRLL2pjNFFIME1Td3JzWTZoM3V4Z1NpbjJ0ODBFUWxZcllQanBnQkY0aGd3?=
 =?utf-8?B?Q3FtVHNnWXVZUHJKY3dYUjVkQVlPWUZnajFDaFpjbGVwT2RNdjc2STgwaHlV?=
 =?utf-8?B?VU80cHAzenkvOEpacHZNWWptWXJFaHliYVRGSGVYV2w0ZTdGSzFuRzk4bUxL?=
 =?utf-8?B?WXVFVGUxS21xYlU4UGs3dzFXWWNQampRdlNBNFJwNVV3VzhPQUFqQ3NOT3Vl?=
 =?utf-8?B?Sm1IeVdCZCtxZlphRlJxdEt6NUYvT0dEODk0UDlVc2RoVzZyUFBxY1VaWlhD?=
 =?utf-8?B?T0t2Tm5STHFVRHBIbVFUOE9CL2NKaTZwcUJ1dlpyUFRhVkZYNmVQUmkxNzkr?=
 =?utf-8?B?VjRQUk9pSHllQ0VOT0I1a3NsYitLM1IrSVk4NC9GZTF0Umd3UTFBeXFsQlVy?=
 =?utf-8?B?a3FCOGE1Ump1OFJiNmltQ2wvdGEzZkcrOExwcmFxcGF3NXVjSXIwNU01VVVu?=
 =?utf-8?B?MkJBZHVrT0FBY0xUZ0JmRnpDcW5qN0pHVlBwcGJzZFNEOUd4YUFZdnJxczJt?=
 =?utf-8?B?SzZFMitsd3diYm1WNWNxeUN6cXh0Vm1zS3FIUUluaDErSUhPZm84ZzUvdkFq?=
 =?utf-8?B?VTFUQjhFMUNjMVJvbVl2Qko0M1Y2azMvd3VwZU9hV3pZWlM4SFJUejUrTWor?=
 =?utf-8?B?bmRsT3JNc3hqOGQ4RVFMVGQySmk3SmQ4MVM0OGZmZmE1WnZHL28zZy9xMlMr?=
 =?utf-8?B?dTJ1OUVZRy9RYkdqMlFjMmpJb2dqWnI4eE9QaGx3M3BmYlNHOGY4cURiQXR1?=
 =?utf-8?B?RFRuRFlZU0xmb1dSSm9ockJEemJvdE5JWEhuQWVyY3J5OVNYd2c3OGNKeGJS?=
 =?utf-8?B?TUd4MHNMTnFYcTJ3M01BN1NjYmd1WnhiVTVkcGtkWGtFSXRlUEpNemlHR0Vo?=
 =?utf-8?Q?CzWo8aQOOvYje7u75UyZabBsc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OBzIT+tPTOmkxFiVQNc9pfJyW5QDR5N8QNqeXAFB4pg9XKP3SxdQIKQG/h+jY/S2zD7NvXoD2inZmI0ZzR9N9+5xnoieorvo1bYqTrpcyWzUY9r709t3BoLEy6/RX4tR/eyRbyHKSWYXfJmbUjNmPYWJb4RvrrTNGnSmI6JYFfW56/KWUT/Adz2mhY7a3Qxcpp4w57K20QHTNTPdK9FQ5Lob2/ObuRKH0s5W1QkAM8gvNqAMA1Ime8tjnQWW/lKY5yiutWp46PLIgkoCGinw30Mre4TdyVNNmNUj8BL5e3WcUXJ8dwyv7MKiVcc1x113xH+5OQ4ahlbXuHBv7FjaCME8k5INQ9GQ25kzNj3mGuybFhf5I+xiyjxOYXc/2v+2okZiyLYpuCXTavipr+Fns3jzdznPDqrvIti+gW59rmcWD4FZj4/18C2NcBdZZ5c5vicIvJMCwZaj0DSsyg2XUVVgSfY91oP13YhZTkQdNj6HGc6eXdaIyjQJyBRrLA+EzQvmz4vTPnW112SB2BvSCp6qKjeWecoBgmqBp0vq6cpPQJDZgUTRZRFumRu9MdGogMpVLQYHWT0rLvGTRlh0L6CcVLkvU5kqWJmQzhFL2hMn1h0JGzazC1x3Pxei1a9kqcqJKg45ogi0d76jjZA/Yr2J1osgUC3OlwYdvSaM0V//Gtih/EAySvRjRNLNnqQadhVBIiAAeyHNqRmt1/5ijwZYz4KfNRhBIerzTxKcVLnmTMKxyx/6DkiWegNSd5tcRX5wBdHtMcHisOSyFk/5YI8HVRp+FEX+opQsTY6zg87MBvUeKpOHfIou/47124/17dwqZhLrNUlirmjvdQwWyt/vpaBGBvYoPOQd0BMX4yWYURELrB179wumN1mFS805wW+xkigvsr9MagaR36OfaWXiXAxwtWRb4nGjEQ2rxLM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 607e278c-a68d-4b7a-4acb-08db2eabc945
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 10:12:35.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CukfxfZQ2I7hsF7UV4gMlZ35D0v2bfOwnM4xbartFa7qj6TI8OHd24cYo1bkdxKpJ58urhb9qLhCYXI0i1vDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5214

On Sat, Mar 25, 2023 at 03:49:22AM +0100, Marek Marczykowski-Górecki wrote:
> QEMU needs to know whether clearing maskbit of a vector is really
> clearing, or was already cleared before. Currently Xen sends only
> clearing that bit to the device model, but not setting it, so QEMU
> cannot detect it. Because of that, QEMU is working this around by
> checking via /dev/mem, but that isn't the proper approach.
> 
> Give all necessary information to QEMU by passing all ctrl writes,
> including masking a vector. This does include forwarding also writes
> that did not change the value, but as tested on both Linux (6.1.12) and
> Windows (10 pro), they don't do excessive writes of unchanged values
> (Windows seems to clear maskbit in some cases twice, but not more).

Since we passthrough all the accesses to the device model, is the
handling in Xen still required?  It might be worth to also expose any
interfaces needed to the device model so all the functionality done by
the msixtbl_mmio_ops hooks could be done by QEMU, since we end up
passing the accesses anyway.

> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> v2:
>  - passthrough quad writes to emulator too (Jan)
>  - (ab)use len==0 for write len=4 completion (Jan), but add descriptive
>    #define for this magic value
> 
> This behavior change needs to be surfaced to the device model somehow,
> so it knows whether it can rely on it. I'm open for suggestions.

Maybe exposed in XEN_DMOP_get_ioreq_server_info?

But I wonder whether it shouldn't be the other way arround, the device
model tells Xen it doesn't need to handle any MSI-X accesses because
QEMU will take care of it, likely using a new flag in
XEN_DMOP_create_ioreq_server or maybe in XEN_DOMCTL_bind_pt_irq as
part of the gflags, but then we would need to assert that the flag is
passed for all MSI-X interrupts bound from that device to the same
domain.

Thanks, Roger.

