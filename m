Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23A761E06
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569819.890938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKYM-0000mI-Ur; Tue, 25 Jul 2023 16:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569819.890938; Tue, 25 Jul 2023 16:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKYM-0000kZ-Qn; Tue, 25 Jul 2023 16:06:26 +0000
Received: by outflank-mailman (input) for mailman id 569819;
 Tue, 25 Jul 2023 16:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+x6f=DL=citrix.com=prvs=56398a583=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qOKYL-0000kT-DU
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:06:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3246ab96-2b05-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 18:06:23 +0200 (CEST)
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jul 2023 12:06:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6164.namprd03.prod.outlook.com (2603:10b6:610:d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 16:06:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 16:06:06 +0000
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
X-Inumbo-ID: 3246ab96-2b05-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690301183;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OMQNM4VLCi7n21BjBDs1ywkoV83r40LGs7LFx/Eczuo=;
  b=Tl1bYUrmG/Aj1nHcstksckCQN+XKC5QVrCV1QVefaw2qnSzL5hDBts7a
   WOGrisUhkhOpYJpRGJMnZo+7659gUWufjxNoNTnykKvcvW/Do4J8uAWpo
   z+IgTkr3w13F6ME/KlybukRZjXDykZGy4uNOdznWK2mxiXpzzKZjT8TJs
   I=;
X-IronPort-RemoteIP: 104.47.57.172
X-IronPort-MID: 116679881
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ue5dp6oP1fPj7V7aKjr2OpqhfK5eBmIHZBIvgKrLsJaIsI4StFCzt
 garIBmCO6yJNmf2fIx2PY3k8hgO6pPWyoVkGwU6rCphQSIXo5uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzSRNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADALZTWTjc+Y+beyWM512MINCs3aBZxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWPEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6A03wzDljV75Bs+dgCRrOOFqU6CQ+1FD
 hI5pAAqiLkj3Rn+JjX6d1jiyJKehTYeVMBXCPYS8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHECRA5cut37+ths1FTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRP+ZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:050f6K0hoSmBiRJXf40uFwqjBJkkLtp133Aq2lEZdPU1SL38qy
 nKpp536faaslossR0b9uxoQZPwOE80lqQFg7X5X43DYOCOggLBEGgF1+XfKlbbak7DH4BmtJ
 uIRJIObOEYXWIQsS8j2njCLz/7+qjgzEl0v5a4856wd3ATV0i/1XYCNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AjxqhK2sbjLjk2v+cYHJfNai86IsldHb43H39DXa?=
 =?us-ascii?q?9AHROUeOTZ3mUyZp7xp8=3D?=
X-Talos-MUID: 9a23:yUVY5AZwTreYB+BTlGTGiSteF8dU+5u0LR4gz78CntiVHHkl
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="116679881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+iNdBAp1KWD97WGNYl1i0bkSJm4R5FaBJiG0PPIB2DLSRkNIkVLekJSHMi9v6QH6n3VdnvlPeRCgGfrwNNPQGnln+2H5sW4Xec1BmaWt2yzT2UMroMwo8ENq0wRqtvi028pTjGBcoFo/saKzNlnyjHvIfoVpVUr/H0tPz5ZV/yL4yazL5Eqn8XQbAxsrm8KZ79mCWDcTiOz7MzRfOtlBVeqxX4VKuiKTuR32gtMjHrXZSdAgcrcDWOKZaV+fcgK6UrwgxJ+dOR6tMPfc3VzgCnEQY++aa67RGFnitNjyBHFvRkZ0S8JlYxLnm1uN09XV2AqnJEMKCs5n0iPwmD2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMQNM4VLCi7n21BjBDs1ywkoV83r40LGs7LFx/Eczuo=;
 b=meR9CQHeTPxaXQD3BBV+2RArzDcqmIC/YAHnOb21BvUBx+2PMmt1nJC5306J+xueKhvhGsKKCd2xcOFgolk0tYc/gC5aj2GoZNECf4U6nj9/PEuMZdtvRGKWLdz4ze+vWZsNnwFuVXffRosmrR84A9Xz2PHuR9t1jnRiN+dAZ6F0D9UwGThNl79sV3k2BWIZFbd9R/PXt/3Z5cmkOHSXm8VjYR9b0UEX0BemO7rnXUqJ1Vy60UGbeninQ5spbF8HakkOF9XgBhoRRR0bUsG8DMSBp5iLT648yIFXZ0lajqjARszShVyEQnfpMknf+L/ommDbiAfVdSbUflPT5ieHhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMQNM4VLCi7n21BjBDs1ywkoV83r40LGs7LFx/Eczuo=;
 b=Cgv7x2uSoGDEanFof2AlEwCBGEaQtJ6DapbisFKman1ObLTtUBWJ1poKlWhmnJu3PkfwpWL6f7VKFfkx73IGctJnGDtSyQ/4LF90Y+6tAesG62oqIb/R05A2NX+JO7P3QrDq+l2O3m5Ul8k4E+XTUDjL1IFe4xRfc4y8iFwihmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9db9facc-c5af-d0b1-28d6-cc8d2886dec5@citrix.com>
Date: Tue, 25 Jul 2023 17:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] xen/public: fix flexible array definitions
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230725135557.20518-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230725135557.20518-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d4f899-3207-478d-a163-08db8d290d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UBR7R/4leFh4TPXGuUpf6K+g0VGrxyhqGXr71AZkFEhoMuPTl1lkubde4XU6UUHi6W2zhiapSWctrcQMcWK237DUXhIhaWFGhNXYVf4g0Zoz8YVW1NKhEbFCG6ytsWzVohXzmxE+SsCgMMm9XWUzy/CWZVSmjIp932KGOuqj3zmMy+qYgaiDw/DkrewgOjN3jEx8iRRneypTb0NS963swEr8OCMz6/PAWMJfa3GSIRjMq+EaZdf+8H6j2R67YZaUGVRZUdNnrePSnDJovLskzTzbKUHYvZ9p2Mn5o9kYAPjWm9pHKaoL+fGi5E9d6nVYQVE3CcTrUdH6GahFiZDvHYQoR/ZH0VfCn88HxS8LGsXTwYRTUPsDOqyBdN1OYfHF5C1drPs32SmPGVwIrZUsfwkH4o53LG7uZ407H7EvqCNgxiWJWtMs+UefoPC2LQu9qAszXSTvQgzR8DDSQvPcwsdK+C5L3+AbL1YF/svW4XALmX5ygDO0+XcUpRE1J5huJ+w72+IfER33nuLjIQOH5GjPYVLbxocFgqr8iYGFKcPLKwWa7iSmxh8A7NURu2b0X/54nADrmMgwdYyyrmXC0ZTHdZN3/acAX5nm4KADmd7WkM4QipBUzUngUrIYMKYnFuUH0Y+DYxT3ctOcoObxpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(31686004)(8676002)(8936002)(5660300002)(41300700001)(316002)(2906002)(66946007)(66476007)(66556008)(6486002)(6512007)(26005)(4744005)(53546011)(478600001)(186003)(966005)(6506007)(6666004)(31696002)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2lTaTZEVUpQYkZqNDUxdldwRnNvSjhhM1FjVE5jODJYek5vMTBRK05pZi83?=
 =?utf-8?B?OUQ0R0RiTHFKS3U3dFlpQjJJQk1CeU02YlkyZXFvV0toTnkzRHNpUk15R0F6?=
 =?utf-8?B?MldoUHFjY3JQUE54aUpwVTJKQ05TRXVaMi9iYitFTm1xa0hicW8xcm5OUTI2?=
 =?utf-8?B?K0crZGR2Y1dFS0wwWnBoYTYxZmRwWURyZmIvUmtBc25NWnZNaW9YaGpRbFJl?=
 =?utf-8?B?NU5GdlA2Y3gzeW52QzloVjNUQ1V5bHlGK1Fzc05BYTY1dlRoR3pPSkp2V2Z4?=
 =?utf-8?B?Mm5MWHF6VndEcTFISHhyMENhQlpJdUtlYkg2U3BzbFZSdjRNcnV6QXZQQkpP?=
 =?utf-8?B?S05DT2lINW4rL240Tjg5SFZVbWp6VWdEVnZkdzE5R2g0U0dvV3dJQU1BOEk2?=
 =?utf-8?B?UjNHY011ZmlRZkFuVm85TDJvWmh6NDlvZWhIWWRaZEQ0NTNBNHIrb243eDk0?=
 =?utf-8?B?RWl2SlF2VjE5YWVHSkZjNG83MWM4UEtrdE5ybjczSkpEV1pQdHRRaEJxTHFS?=
 =?utf-8?B?QkMrTUNzMkVwU1p3ZTlXeDBuZnRLTVd1cXpadjQ1VVpTWVFMSEdmVGd1cGd6?=
 =?utf-8?B?dTdseEJYYXlQU1FVUWRLZlRucXFqRmZpRjM1N3BvMXdBZVZSUkh6emEzR3FP?=
 =?utf-8?B?eEpzWTl1MUU5dXZTV1hxZDViMG1uL0tWdUpBcnhFV1Y2KzRjSVphVVpDMzRB?=
 =?utf-8?B?cHNFVHZKT0ltekJseUUwejhndXhYT0dGQWhibmZuRkpFVy9hSWlJNVJuNStY?=
 =?utf-8?B?dWVDWHJuSEJySE9UREgvRlE1YXdQcGxhY3V4L0U2dXhYS2k3bm8yR2ZoR1ZW?=
 =?utf-8?B?ZmFvN3c2VDhodjkrRG5yRm80K1RMczhXa2gyVHo1TXVZdzM5c0tjck1FZkVB?=
 =?utf-8?B?T3RVRG1scENtcDJtcXBvL25kZTQvaTVQd2RvQ2JtZWd1ZkNpWWxyRjM3dDZY?=
 =?utf-8?B?WnRoaFRHM0hmRkt1SEFrVXFEL0c1TWgzaHI2MW9BcFZYcjdyVE5haUhLcVoz?=
 =?utf-8?B?R2FYazJnUURSbHJFb3Ezak4vc00zUjkzeWdYMlZ5anVoZk42UXRNeFp0bDNh?=
 =?utf-8?B?OGZJT25DRmxpaUtzZVRQczBjNkYwN0xJRlRYS2hya24xd2VTNWVzUnJPUHZv?=
 =?utf-8?B?RDN1bTczZlZNZnJmdWNwT1FmWHpnNTRzNEtzL21PWXZ0Zjl6c0J5cWNrS1Vv?=
 =?utf-8?B?Y1JPbTQwYUZLZGJDSG9FMkVBUlV6SUk3MzBGdFA3dndtOXg5Q2cwZmUwZDg1?=
 =?utf-8?B?WmplenlvMXdHSFVZY3J6YlNoNkNhSkN5ZWFNTzlqVkZ1Qk1xVVVWYUw3aDdJ?=
 =?utf-8?B?czFJZzN5RUVDWERuTk0rSFJoT2tCRWdNWkxSTkhKclRzNTRuNFMwVGhPUUVR?=
 =?utf-8?B?UVVhRGNWRVRmaDNuYm9CalFFeGVsQWZIczFUVS9JKzl4RVkxQmdxOWdWc0NV?=
 =?utf-8?B?cXhjT2tEaWsyYy9ma1NIQUZIYzY1K2JtYzg2TEtZRGxLMURkTWNEeVQ4VTZz?=
 =?utf-8?B?UzBWNi9GWlVpanQ4dzR0Y0FQeVBielI5cTZmTmNCTmUyYkFveVBDcWNPSWgr?=
 =?utf-8?B?bTdlNnhkeUY2NVh4QmlhTHpzajFKL2I0RVdQd00zYTBWK01hSzZhT1BVOGU2?=
 =?utf-8?B?c3VoTXBuaVpTY09lTm43NXpDeCs1ZXgvOFpLZUdTRnVwWlFNSkFHeU12YXRj?=
 =?utf-8?B?Mjc5M3lHZmdISHZmaEE5elI5RG5OTjB0TzhsWmx3ZUM2b21QSnRKcG1UL3Zl?=
 =?utf-8?B?M0VlSSs0QTBDNUIyYzY3RWxyNWtOUVZoNmNyWDBGRDNsb1UraVdndCtHVTFG?=
 =?utf-8?B?Rk9UUHVaZ1pyVFBPcm5xK3BINFV6TW55ZmUyaW1SWU9kbjdacmhrQ3h6dmVr?=
 =?utf-8?B?SDNOaFZUVHNpenJDMWlPZEFoZDc2UkpzYm5HdDlLaytnUWxqWkZNME1EMzlG?=
 =?utf-8?B?Wm9WNksrUERDZWNBZ3o2WVVUdjE1WFNpam5wNVZkdGFDRFIwcy81c2xCSXRG?=
 =?utf-8?B?VU9NeTNnWnlWaU9xK3Y5OEp3cGx1UitEQXVEYURxaWlOaE1waWRjSDFrRjRz?=
 =?utf-8?B?eHo1NmNHcjJ2WitiVUFQT1pXTmpBUEJQcHJ4czRlRXRHd1NNbm01cW5ZWEJy?=
 =?utf-8?B?MndEMjdBclF0MldMUWtHOGVkMXVEN3J0dERibWl2bWJRRThzMU5CbGJtaDNq?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IcS/hGBAC8kfH1PwximsFn41z43ic2hshx+bKL8f2Ilp3uvO0JHVM8uP3SvFPBnadZD3lTw+Pxp9L2bFxUqHVEnv5f99NFGW1vgX7OxHhAY+Fyg2RXZ1z7tmGghQguYxK6Zz1bh5UDFsxOjoqUyOBfQdAq3irVxhzwJqMRk+G/ewEWdMlVdQvdlYbVg6VRFvj5Z20ZqFMC06Vq9bFsWKl2qY8qaqyqFgwnQg2Ms8DwlADc/OMNLpt/4QIutphl8rSV9wSjzLJzWczvoisHuf42oFm9GXkpq9tdhu1LTMW4RI2g8tYaYz3vVQmews1ToXAa2dshxpjVld3+QJVNsM29XL4MPadO2IOEH+dHZcc8dGPVwAeTs6E5swg3ILOubxQK75xCHqcR4WPa6+vzlTFJDERU2Ps0WZqqlYWk4p5V5XhsoKeHswR5TJC7dFooEaZXVIDne5zY/lDntYRbB0/x9KMsUhH6DLAPzPjA73gmF3LfyQ4mW+znhW+qVd01NGyPieLvJKgKl09vCkvpHfs4Xn3gTgnbTRPs6xL67jLM12q22X6T975fj3XNHxCnjcS65F78pswdQ91UldxEyDFTrfONplbf9GDM6v+8j65WVWvYMRk5q3CZBMbdzDZjW0D/kU5xsTTfWZwnyGpJN/AcAXXyfxr3mfEhNg/38DXOMzXMbpo4NnGlCpNVgSkBRFRa4w6AWl5kS943XOygb9KUMfyy4eiNxcCRrapx6HXi1I0xYmCh/F6kzGmL/bxl5hFNPO+u9dH0YxniYPQu2F0RtrWhZzrilwbpkCT1uzTP8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d4f899-3207-478d-a163-08db8d290d6c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 16:06:06.7491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxH8znpnO88bbpRaja9S3mdEisODc9aYa1lQtG2OLqqHGSMIIjQUkRQjKVSW1bQizI3CF1aHmdD4VBTqksGKGJQHxsxYZI/JPrjGhXvDnhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6164

On 25/07/2023 2:55 pm, Juergen Gross wrote:
> Flexible arrays in public headers can be problematic with some
> compilers.
>
> Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
> errors.
>
> This includes arrays defined as "arr[1]", as seen with a recent Linux
> kernel [1].
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

