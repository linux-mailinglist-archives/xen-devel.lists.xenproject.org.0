Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237656C2FE8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 12:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512336.792290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZua-00030a-Ak; Tue, 21 Mar 2023 11:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512336.792290; Tue, 21 Mar 2023 11:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peZua-0002yo-7Y; Tue, 21 Mar 2023 11:12:16 +0000
Received: by outflank-mailman (input) for mailman id 512336;
 Tue, 21 Mar 2023 11:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peZuX-0002yP-Vz
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 11:12:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b82a17-c7d9-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 12:12:10 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 07:12:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6532.namprd03.prod.outlook.com (2603:10b6:806:1c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Tue, 21 Mar
 2023 11:11:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 11:11:59 +0000
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
X-Inumbo-ID: 38b82a17-c7d9-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679397130;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SHB0j67T5gZ9IfsONSlpYUlbDjY6WaZ6W/tCQBIoD5k=;
  b=Un/r3C2l5WvYB5HaAw38QdyqZ4tkXvf3mITuNQf2v7k818zh5AwQLs2k
   S3vOSo5zSL4NG4QhHGcTIgIhhsOCtJeR6FJz/IeMc5YLgwlEWwMP6RRvM
   TybQTbhZ7+04PvZ021QqmPbDRa+LDqctLnbi4YLaK6IBkxvdh8kcSoTHF
   s=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 101052691
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zBbUfKNIdIxkEFXvrR2tl8FynXyQoLVcMsEvi/4bfWQNrUp23zdUx
 mYbD2iAa6rZZWf0eIskb47l9UIHsZaBztNjGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uBTK1hk1
 eAgE2sQPjKih/+33+yxDeY506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujeIpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxXqjBdhMReTQGvhChwSN9DUtAhgqR17rs9efqGKYVNhcN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wmly7Hd4gWYAC0ISz9dcs0OpcYwSTE6k
 EWU9/v2ARR/vbvTTmiSnp+Woim1IjM9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqwr53AVSYp5QHaWG204wc/b4mgD6Sh6EPS7PJJBIyYUlWMs
 nUCl8WEqusJCPmljDSMWu4EGLij+t6PMSHQjFBiGZUs7XKm/HvLVYJN5nd4LURgMMcBcBfoZ
 lPevUVa45o7FHinc65xJZ6wAsICzK78GNCjXffRBvJHaJV1cxKc+z9GfVKL0mvwikkwgOc0P
 pLzWdahCzMWBLpqyBKyRvwByvk7yyYm32TRSJvniRO93tKjiGW9TL4ENB6Fabk/5abd+QHNq
 Y8AbI2N1glVV/D4bm/P64kPIFsWLH89Q5frt8hQce3FKQ1jcI08N8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:JCGDiKh+wPiM1C4M8kKyyd6opnBQXgUji2hC6mlwRA09TyX4rb
 HToB1/73TJYVkqOU3I5urwXpVoLUmxyXc32/hpAV7aZnidhILwFvAe0WKA+UyeJ8SdzI5gPP
 xbAtBD4bTLZDARsS+d2maF+r0breVvnprHuQ+ip00dNj2Cv5sQjTuQdm6gYypLrXF9dPkE/W
 2nl656TpObCBEqUvg=
X-IronPort-AV: E=Sophos;i="5.98,278,1673931600"; 
   d="scan'208";a="101052691"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm4UxFqv/QOaJ04mKVOU94/U0z17TRiF4Rug8cIROAnuvtcDQPjd+PNWi7xqPbkyBy4fQq4AsGxdPRATS21SIJAcIAAvofq2wKAP7cG3qpSLTfoc9yuVzUbtPjXlrNyyrQfxKZAWRd2g7Z27l6erXnW5e2YNo/ELlEPPktKi4kISgEEJrJXu4ADXzLgRBQe95JKTw61ICkpJ6fn5wD1mZQMOj/6cfrJs09FxScleKap2USdAFyHB0a1LOlGrgZ6wSIvVBU2G1v1wDRhMQdkpcVCl+OlsIt0dZM7bbPR8xavGTZk00fHSKW6NBe34xGqLk49ugpI1lIxhaU+4DDzHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbVTdAGfEFnddb7vG3JmWr0SevDNGKZ1xcz8GRHgQUw=;
 b=SGJ/MUuqQ4YFsntwkD3eDRdlPOTVw1DTv1Z8EgCrYOkP834nHL2zeYTX04TmlZWIpZj1/yP8h3zsDqprGyGgn3LRMAWTUp7wDjcpbcW9sfJK5ep1VRHvLlXtDS0otgTyZHOtT8hkIvwYbYbQ6huwmZAMTp77ghnYbgfCn0vOUF06jNjefVdIjpRjqH52ZCVXqvkQKXrIoa3C2zw3satTX8kn/iL/zvJpQITplW5+MkUNkDB2KUqWY2eZTrJiQf3uM8mCHoz3ygg+yTZRWcHo9Jx4GE/zoaZvUpkWH9Q2JP8dRnwQrcjpWKulitGpwDsduknWl8yiYbfKSnPWXHC6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbVTdAGfEFnddb7vG3JmWr0SevDNGKZ1xcz8GRHgQUw=;
 b=k3QeH20+wXQWBUMC3+W3mNS8j2dNSVHiHbQNCG/wjHuSmbRaa2dE1QibchVZ1i1wVdGo8+VgW1GpmoDkJsBVN6QwHmmiAvZ8EJW52uSNHgQ+L4HUw4Y2dflvJoO4JWG6uWfN/DZ5iTMv6YEEP8CIfY3dYUhNsegs3nGq3L9VJfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b2d1fbd8-1135-7d90-4402-ddd17a55f0d2@citrix.com>
Date: Tue, 21 Mar 2023 11:11:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v4] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>, xen-devel@lists.xenproject.org
References: <1d3e2081fba9a1ce07c3e2a28eddcd6f51d52854.1679348946.git.isaikin-dmitry@yandex.ru>
 <61f94060-010d-2b28-d947-e5790d6d57e6@citrix.com>
 <2072a771-5aab-22b0-7421-bf061d9bd582@suse.com>
In-Reply-To: <2072a771-5aab-22b0-7421-bf061d9bd582@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: aee7ec09-01f9-49fa-bf81-08db29fd16a8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sPiVjsNSHJOkzdNslqKc/CENHuq2Wh367TidFwGzXSHhzuYr9cUWXiTdQplMFi5ehD8NOUsghtAGtKWIpvfUTsL0KryuJjOcOAnp0wcIOeoMfCtZlxlznr/6ih+iP1q41rHxBXuB+CdlmID2D97sSy2pwx+8d4sby+UqImQLVjw/9iGQYWA1ZyLP2iBptFovhR9n8O6KiWWr3ouvLmv72SU3NkoqlIvsYrPlq6TTJ5iZUDwkjJHk3kghQK7wSmf5ugTiSCxZhpgRbDpRqQaI2Y3v9mXPJ5/rlnIiY2XsZx3Z/YR0XbVm5Uot19qehLiXX/1L5Ne1ot3lVM49/+gohhvNKwHG70Z3yJCUhFQsBwHHyxhz66oJ8zpedb5LVzqgdsKZNnNyIzdYSqC7EyBfHqslfukemxr2+czsQUxQZLnwyFNYinfQI22iVBsuSSc6nC15IW+PqnafeYxHkFXVr9eSG0DBuelGj0ndDk0+mECZjeYjTxgHDmkNZGcsjAG5xpymo2OpSEuN2zp6TGrMxzpBsO/qLuG/j7BCpd/0RhiGDElO5KMDPQoIebkFnorn9wQJOv6mjzt9al2CaVNr/i4XJ7xAhakesuV8BJPRVtp6wY89jwEb0GYWRRAEKm8g8lBdFwMk+UsC5pmIpiTc3i/36eJesw50YXM3G+Rl6D/QnxVzxyAjvToI00fQTM2cZ5RZkFIo8vC8BM+8/fjWRt0jLqKBy4TBtUG9RFkoKI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(8936002)(5660300002)(7416002)(66556008)(4326008)(966005)(36756003)(478600001)(6666004)(83380400001)(66946007)(41300700001)(54906003)(8676002)(6486002)(66476007)(86362001)(316002)(110136005)(6506007)(186003)(2906002)(31696002)(31686004)(82960400001)(2616005)(26005)(53546011)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTI3Q3lCSlRraDFWQ0hqakZNKzY5RWdHSklzNE1aYVRSMytyUFU3a3pBSElD?=
 =?utf-8?B?a2cyam0rcjh3MTZSNGpsTi9uMFJoRklxMUdhYktKMjNqY2FRWmg3T05PRzB6?=
 =?utf-8?B?ckR2K0pUWnl0T0UyMlZGaWNsWUdBQlNDUE1ubmk2YjBwTGlOMGxwMjNzVlFX?=
 =?utf-8?B?OUkxWElZSzNBb2VPakZRdHRoT1dWbStOQUlYYXI5aWdrQ3MySDRuN3Zudzd1?=
 =?utf-8?B?MWw5Y2lZbVVmdFI3bHpBRXdKb1MyUzZHNVNKcldnVm1lVE9zQzBvay9kMkh6?=
 =?utf-8?B?Mjg3VnhQVWFmUktTUXdiYm5yQXlTRlZCQlFpNkYrVGYvVXBwcGJ5dlcwM0g4?=
 =?utf-8?B?QTlnUGpROElpQnlHT0Z1NGZXdlNVMCtBaWo1aEFqR1BISkdlUXZxZVlCS1B4?=
 =?utf-8?B?NGJyalI1RGRSdUJDWmNLZEVHd0dIRWFFWmFuUlRxbDdxOHg1SThXbFQ2V2dV?=
 =?utf-8?B?MDRpYVJjNTBTUzJZb2lhUER2SjdFUjJVU3pJNXVpaEN3cjVUU1piQmpCNEIz?=
 =?utf-8?B?Vm95blVCMXFlTnlENmwrQzNvaFI3TWdKd0FLU0NUeXB6eDdyUWVFNUxjZ0NJ?=
 =?utf-8?B?eGxYT3pkTEh4ZWhSZHdxM0l5NFk0QmlKTDI3ejNQaTdYcGFJQ042aSsyLzNn?=
 =?utf-8?B?MVZsekE5Vzl5QzUxVXhxTDhZNGo4a0FRSldtRVg0L0E3OXhzbWNVek1wbGxq?=
 =?utf-8?B?Z3RYakdJVUFIc3FVK3YxYTVkTVcvWmk2SzR1clYzOVN6aXMxSThhSmFDOTRl?=
 =?utf-8?B?ZXRtb0IyTWx5RndLMUJ0eGEvelJPVHVuaXBPUWVrdlFDbWhZOHJCZGQyR2lQ?=
 =?utf-8?B?NnM4VXlaN3RNcFFVRXpERksvYmI4dVRodnUrWWJBaUNKOGVva3VFZDU3RVhB?=
 =?utf-8?B?cTVGckNQK2NCUldoUTI2ZW5Vc29UaFJ0WnVmTGh0VWpXdWlpWXgxd05KUWUv?=
 =?utf-8?B?bGc0cm9ZQlU4UWQ3akIvTHA1bldRYWhUV0RtdDM4Sk16TDJsRHhiWjU0WkFY?=
 =?utf-8?B?QnBnb0hObWxSQ01QdjR0cEpueDQxWjMxUDUxVjJYM0ZKbWpNdXVFcmVRbHNX?=
 =?utf-8?B?dWdkOWN0OGpQQlJtMllxa0ZybGtTUjd5UFFrQXFYWDJaUTh6RWNmY3crSnNp?=
 =?utf-8?B?YlFXeHdFRmw0NVRUWHMzQ3lUY0tFaVFJVjhjQnYrcTZ6SUdNeEN2RjA5MjJB?=
 =?utf-8?B?TXhuVEY1S2s1SmNMT1FsUnI5WHF4ekJONnZRQ21KT0lTZkFETWhSWWttcVdR?=
 =?utf-8?B?cXB1K0JTVTFQVk4zRTNmVUhvR0xqYWMwcWxUUHFjWjhIYS9rN1hocXVudUhR?=
 =?utf-8?B?RThuKzVMNGQwS1FGMFFzVzZDWkJkYVFmcytuNDdjNXpQUFFWbDBMbU1kKy9u?=
 =?utf-8?B?WGRNVWxibHJnY3hZWGFIZU0yL2gyOGtKbGVJY1lsNzl1ZEQ0cUt1OWhONTh5?=
 =?utf-8?B?QVIxY21uQVN0NGl0bHZpeEJNYTFWbnNDdlA3L2Q1MGhUMExVVlY2Wk1tRENm?=
 =?utf-8?B?SUp1c2NwZm10d3hBODJaQlJFdklQUzBvcE14QmVFNzJoNWl6aXhoK2k2ZjQ3?=
 =?utf-8?B?UWJKS2FKZmowaTEwNjdiOEVOS1FzQkdNNHFXWTJTMDRubld4VUJHSzB0cFN5?=
 =?utf-8?B?R1g1dVQ5QXAySjd2ZW5ObDlFYVc0eTR3c0ZjSDM4ZjVWbmxheHdwcEtnY2Qy?=
 =?utf-8?B?N3o0M3p6dVhZOEFWSWFONVlHQkxldy9rWlVQNnhXMk55ZWFYcUNOcmRHVEJh?=
 =?utf-8?B?ZkpFeGJxSExjN09WTzN1UmsxSHVONFZPTVVSRFQrRjJSWGJTcTlTODhibk5H?=
 =?utf-8?B?dU5XYklkbUl2amJiV1FBaVdEWXJUZ01FYW8ydnNSSnVhbXFsQ0JqNVNVemhv?=
 =?utf-8?B?cHhTMFpndTVZUG40QjBDRlluVkpKM2t0WmlXNGpGb0xZOSs1L012RStjU3Zs?=
 =?utf-8?B?N1h1Nkx6UEpzekpoanp3U1ZZRW8vT2hhaDAwMUVxZzdqQVUwTlltNDVmS2Vx?=
 =?utf-8?B?c3BMZVg2dnRqMUN3dFN2cWcxTW9WR3NZQkN5dEsreFYyS2ZBSG1MK054QjNB?=
 =?utf-8?B?SnAyU0FtM0RmTUpibzhMV2dmMk9ReTFCV0tleHM0Q3V1SzdoYXlyamsvTk94?=
 =?utf-8?B?WEwwYUxVemhXNmlzVlpxc01kTXBUREVzcGVNQnIxVi9WeXA5QW5LeHlicjYv?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?N0FkbUkvY3A2MHRQRnlpOGlJZnAxYjRPNUcrNXYzQy9pV3huSUhRYmE4SXVX?=
 =?utf-8?B?VmlCY2FObW16ci9hc0R3a1FxdUlPWjh2bWxUOEFSVm14QmpoU1ZkVmxqMEp5?=
 =?utf-8?B?QkF4Um1XMTJqMUpBR0svbTF6OXVIME9qY09oSTYzY0p5WERTNklKNGI4SFBr?=
 =?utf-8?B?UC9yWExzUk03cnYrWTdWRFRSMkl5WVhnWko2d252RnZZNW5EWWhzMFZiUlNP?=
 =?utf-8?B?UUpNZTZORzdnaktLZW0zQXVFSHdOZENLZ1lMUW5zbk9NNlFFTmNLN2x4Q3Ix?=
 =?utf-8?B?Q1VieE94VXRqNmlocVJIa1c3alloZmZ4MVZ4VXBGcU0ySFV1ck1QSjhHa1cv?=
 =?utf-8?B?VXM5SmdjVWloakxPM1MzWW9OWHd3UEtpSEZGN3hQYmhXR1lzZ3Y2WFBCVVcv?=
 =?utf-8?B?S083bXhHdC9FeWkvS0VvWWJPbG9Ma0RDdnVnb05HcjZSVXhTT0NEalJ0bTl4?=
 =?utf-8?B?c1NSc3V4S2RvYmNkcFpBdnhiSHVlMTV1Q3l1QVB6OGIySW9STHYvallNTzBY?=
 =?utf-8?B?aGNQL2lHLy9lYTZiMTFjejY4cXJRYk9DeWJJNGgwWDF5bW1UeUtUKzBJaWRJ?=
 =?utf-8?B?aEFCNGRrVFhPZ20zVmJrRlQrVmN4QjFrc0VqcDlZWUo2cWhPQ2tNUCtVVGlm?=
 =?utf-8?B?dkhqSHZpcTZKMlFLaEt5eTVUUGtZK3VJQ24yQ2ZCU1hSb1ltVC9XMlFrY1BX?=
 =?utf-8?B?aUR3QWgzMXVwS09iMGZtaXI1cnhkSEpCSERXNmR4cWRCR3RmcDVpRnh1bU1G?=
 =?utf-8?B?RlZkN2Uxd000QjhXSEpoVU9LcGpOMkxialgxMWtoeXEyeXpmMjQ2TU9FWFk0?=
 =?utf-8?B?VTBQR09uRHZ5TWtoT0s2MTFySnVES3c3Ujl2N3Era0wvcnVJa3djd2NyVkNS?=
 =?utf-8?B?Y0QxRk9TTUxWTG5RSmZ6anpqQXdjQWkvSnlibHpMWU85WFJoMGFtdk11Vkpj?=
 =?utf-8?B?N1VlQU5SUzUwRFFOY1ZNR0xYU0gzaXpmOUlQR01nOWNCN0ZzSTFFUlFlbkk0?=
 =?utf-8?B?VHpERmU5Qllqc0hGRFZvd3l0a2FTK1FpVnlRMmVzTVczamtWaXRLOEVxeGRI?=
 =?utf-8?B?TVJDdnkxWFlDRGJObzJXdTRjZU9LNGFhMlFsd3R3bkwzd3d2SGZOYU9nVlg0?=
 =?utf-8?B?RUI4ZG9mYkhHVXNvVUR4YTBJenJHYU5CVW83cERZcnhFbUloQ21ycit0b0FC?=
 =?utf-8?B?Vm02UWRtdFphRGJObDBQS056NEs0bW5hcllzV2lLWkswc3dzRGNYM0NWMmJN?=
 =?utf-8?B?RlhLNmMzdHd5cW1IZS9VdzBlVGhCK1ROaGJMSU55RFQvQ0pkUWRqOE13Q3Q3?=
 =?utf-8?B?cFJJY1ptV280STQraEJQczVBUERSbSs1MS9zcFNZbUdWbDVSVEUwQkh3UmQ0?=
 =?utf-8?B?MGxUamFEZVBPVUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee7ec09-01f9-49fa-bf81-08db29fd16a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 11:11:58.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaJaTCb6rdo8/iTwkUTFNWwtvcglSdISnQhkZGx676OGuXcegclX2p+tNlE7Ftbm2hsl5RUH1tTkVyngYz3aslP4zatQw9aeTLukvwQY/OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6532

On 21/03/2023 11:06 am, Jan Beulich wrote:
> On 21.03.2023 11:51, Andrew Cooper wrote:
>> On 20/03/2023 9:56 pm, Dmitry Isaykin wrote:
>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>> index 00b531f76c..0b7a302928 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4560,8 +4560,24 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>          break;
>>>  
>>>      case EXIT_REASON_IO_INSTRUCTION:
>>> +    {
>>> +        unsigned int port, bytes;
>>> +        bool in, str;
>>> +        int rc;
>>> +
>>>          __vmread(EXIT_QUALIFICATION, &exit_qualification);
>>> -        if ( exit_qualification & 0x10 )
>>> +
>>> +        port = (exit_qualification >> 16) & 0xFFFF;
>>> +        bytes = (exit_qualification & 0x07) + 1;
>>> +        in = (exit_qualification & 0x08);
>>> +        str = (exit_qualification & 0x10);
>>> +        rc = hvm_monitor_io(port, bytes, in, str);
>>> +        if ( rc < 0 )
>>> +            goto exit_and_crash;
>>> +        if ( rc )
>>> +            break;
>>> +
>>> +        if ( str )
>>>          {
>>>              /* INS, OUTS */
>>>              if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
>>> @@ -4570,13 +4586,11 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>          else
>>>          {
>>>              /* IN, OUT */
>>> -            uint16_t port = (exit_qualification >> 16) & 0xFFFF;
>>> -            int bytes = (exit_qualification & 0x07) + 1;
>>> -            int dir = (exit_qualification & 0x08) ? IOREQ_READ : IOREQ_WRITE;
>>> -            if ( handle_pio(port, bytes, dir) )
>>> +            if ( handle_pio(port, bytes, in ? IOREQ_READ : IOREQ_WRITE) )
>>>                  update_guest_eip(); /* Safe: IN, OUT */
>>>          }
>>>          break;
>>> +    }
>> Sorry for the delay.  I've got the Intel side sorted now too with
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=f71f8e95c34fedb0d9ae21a100bfa9f012543abf
>>
>> The rebase is:
>>
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 78ac9ece6ff2..7233e805a905 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4578,6 +4578,14 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>          __vmread(EXIT_QUALIFICATION, &io_qual.raw);
>>          bytes = io_qual.size + 1;
>>  
>> +        rc = hvm_monitor_io(io_qual.port, bytes,
>> +                            io_qual.in ? IOREQ_READ : IOREQ_WRITE,
> Here the conditional operator needs dropping; it just "io_qual.in" which
> wants passing.

Oh, of course.  In which case the delta is even smaller:

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 78ac9ece6ff2..076752d9e84b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -4578,6 +4578,12 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         __vmread(EXIT_QUALIFICATION, &io_qual.raw);
         bytes = io_qual.size + 1;
 
+        rc = hvm_monitor_io(io_qual.port, bytes, io_qual.in, io_qual.str);
+        if ( rc < 0 )
+            goto exit_and_crash;
+        if ( rc )
+            break;
+
         if ( io_qual.str )
         {
             if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )


~Andrew

