Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A669E149
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 14:29:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498905.769860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSi0-0004uU-Fx; Tue, 21 Feb 2023 13:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498905.769860; Tue, 21 Feb 2023 13:29:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUSi0-0004sl-Cs; Tue, 21 Feb 2023 13:29:28 +0000
Received: by outflank-mailman (input) for mailman id 498905;
 Tue, 21 Feb 2023 13:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUShz-0004sb-2e
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 13:29:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0fae803-b1eb-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 14:29:24 +0100 (CET)
Received: from mail-mw2nam04lp2175.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 08:29:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6927.namprd03.prod.outlook.com (2603:10b6:a03:43d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 13:29:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 13:29:21 +0000
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
X-Inumbo-ID: c0fae803-b1eb-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676986164;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/F/EWAi3TMe3vy/gcyGhAWm9fzohUi3ZNbymQYgh+pM=;
  b=I3i2WjjjYqT+sP8QdKiaUtbnAFtefqKytG9c7w05Vo1Olk7dQbRRg8Yf
   2JJp7bL0yzvKlzTqKIiGHXEMg9pU+bhdAX63YJ/sYaFtkzG9hVJl60KF+
   fxky2veTLsR66v+HSytvSM6dtS55YBo+y4V4Vixkqg81CBZ09YZsqBSwo
   Q=;
X-IronPort-RemoteIP: 104.47.73.175
X-IronPort-MID: 98302475
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VlNKr6h25Esvz8GDe0YRIRLdX161QhEKZh0ujC45NGQN5FlHY01je
 htvXz+AM/6Oamv9ed9ybou0pxkP75SDx9BkQFNs+HxgRikb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5gWHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQdcwtQRS3ctd697/H4FOI0g+4hD5HCadZ3VnFIlVk1DN4AaLWbH+Dv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMqluGybbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Re3jrqQ23wD7Kmo7FUcaR3bmi+aAgVeCXM1NI
 kc21AF0ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5YQs1BTGS44/FLbv14KoXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:hNgVsa9dFXzFjNWnx31uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="98302475"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfoqobQTbJjG3HaBjK2aDkPrCDJ44LFz3hzMe5VEOdYuJOR+T0fHHAFPu2o6Ap4D9GOwbLrDHZ5UWC+YJPpEt6a9KVyHSroTl9Ns91+27t6CbzzBkZDLDO5nQhQ3VqJMKT5pPi5AC/CdLpRKCxnU4cSAxO3LiKDYjI/klA+i+Zkm5pKL3NE540/sCDUQMyOBlRcTkZhnwLj5iWvWazIHgi/8aYgpYegJVylV1CUiVENiOB5tl4j/YPdikXI69Q8NgW9EPdDq2edefceuJLJGZyCZrinfHRI5p0ocia1YY3NokOlPRJpokrWeTsWT5VksWtcOeiyqAkD3MqUZQh7jpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F/EWAi3TMe3vy/gcyGhAWm9fzohUi3ZNbymQYgh+pM=;
 b=XGm5BLPC470aS21nH3ELSQjDAGGHLWHCZjK1v1tza40v/GvjpD3zP2ZN3xPruzd4eNMgAJiz5E5UgO3CD221oTim4wR8bUJZZNdqnPvHcnSuPCq+ROO9wnQjkGdrxFlquRPA6U04o8l1HIcGOfNTSA/15StuRv7vTVuAvAqmo0E3Ucis7I41uCxFXqzQzQodPYY4p+c1BCauC8gTmAPxuKHYWk4fqc2t9aumMp2aF2WsKg0Kfuu5IXdyLwXqLhbG9yuzkhmFUm3MlpgDMRoi4O78sdbV0jlMUIM78c9bwk9lWr5UVigfyMJkrGt9EPsBANnu8V3Alxvi026kakRquA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F/EWAi3TMe3vy/gcyGhAWm9fzohUi3ZNbymQYgh+pM=;
 b=AbpLJo95QVpiBwojKofPY/mcXbgmVhx2DkWafWlvMbUqjSWGmlLQ2yuHxd5H7FLK0SRRyJeVHoFFtswJj2NZdkoyMVblYcbGqidwv3Xr7m63XhOZ9N7VSARINwcadlu5DrpycHtmg83AQHblyTUWTwwxgoxdG3bIsbYS4Igpd30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <447d9cfd-dd07-e7e9-56c7-d2129ec3f924@citrix.com>
Date: Tue, 21 Feb 2023 13:29:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/MSI: use standard C types in structures/unions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <3b9de55d-010c-2498-2956-98753a6cb34f@suse.com>
In-Reply-To: <3b9de55d-010c-2498-2956-98753a6cb34f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b7e19f-3d5b-4e7d-9398-08db140fa3a6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0i/Qc/8oy1TRGJ06Np9yJ1hvzDX+BbQ8tyvbYhoLw90OudGZZiD2xPUfSs1mqgleKL6JociuJ7TCpXPwUEVIx3mPj5iY/n5dnhTANvZ1iVNZF9rti4Inw/E/nlUSH9skWACl8NN7cMQ55gv9xrxd1Rge4NoDHWdW/Xg1iG2JiKeD5oBlE35+SvN2Y6uzKHGpGqWwJ/dKhuYUM25/KsPUgsKhYTnlVy9GhFzGjhfLGa2GbjkQmk1oJzHFl8LuM73o9vC6sAsxgIZi3+C+Ub8qth4JvlTctIS9Qu5TWN3+nlOxF3eFvIlqCpqZMKCgeAhwCEay1J/EMDE/IdXMbU2F81KjsooOJ/d5znnnDFIdDIWuY+0ZNcnbMPttlcvsYa49J4i0Mp02ibe09WhGZCwLChp1GO8StkdBueXtdHzh4++3G6htI6cdo7Uy9Hk3CorWL0Dd+6z6Q9E+uXuOWGDIVVBN5Dt3e4aWkyglM4FuF8Tp149CC4meA7Bk0gXOSSuUVNyKRFtUcD2RRw/SOGam8aIA6iDf7vASs4YMNzbP+xCyd75FRw7je96DI3ATd6DWp+wZ4MS9Oxv6T57FHXcPQI/VLfmeb+MFry8nDTmsqOM4/UzHxjZTjmEqrxz6UdmApbv1NcDJ8sUNXUQfCu+UZQ4Yv+863nKN1AElsmD95NEwGFz3ju4ozGSNdQdnp9nrCYCFDW+/XNe+MMMKcmUBnCry+SKr4q0UUVHcl3gRvOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(451199018)(36756003)(2616005)(82960400001)(38100700002)(5660300002)(4744005)(41300700001)(8936002)(31696002)(2906002)(53546011)(6666004)(6506007)(6512007)(186003)(26005)(107886003)(6486002)(86362001)(478600001)(316002)(54906003)(110136005)(31686004)(8676002)(4326008)(66946007)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2RoeEVrSDIvNUdZOENPRE1Lb05aMFJ2YVRTWm1RdmdUd3JibXZURlJBR1lj?=
 =?utf-8?B?Z25xbTh5T3gyRGlFb0pLWlZxdGoxRzhNQklDaDY0Y0dNN3BQSjFCZXBWV2tF?=
 =?utf-8?B?WitMMWxvd1hiUkJmbG0xQXN4bUVZQlZMYnJMYWhCenQyRU1BTWRDaGQxNjN2?=
 =?utf-8?B?WmEwaWpHQURTV1JxYTRqRXUySnBOV0dDa3Z0M3hHUzVGRHFrSm9DeVdSbVd6?=
 =?utf-8?B?cm8vOEFSczd2dWp1WmRTYkZINk1vS25IQjNMRXdnbzcxTTc4V2hmdmZ0RkE5?=
 =?utf-8?B?TlUvcnJXdTdYWTFyaGJKKzFTbnRNOWN5MjcyOG9oYnI3OW5qSTdWOHBnQnlW?=
 =?utf-8?B?NHVxK2kzcnh1aExzTkMyNWhJeXdHL21ta3ZBMHp1VThkcWlpSHR4SHh6blhj?=
 =?utf-8?B?a0tZNFBnbGtYTTZ2eWkwMFFKSUgzTDltWGVmT2JGYjFKSGN6TThybkpCZ1Rn?=
 =?utf-8?B?SnZHaWp2QlNlNXU0dFErTDErNEh4T2YzR05SVXJxL2c1U1lkSU9WeEErVG95?=
 =?utf-8?B?QWc1dm55U2lwYnFkSUFlejdEMThpeWxOanMzY0szelpwRHVBai9PSDBIVU5X?=
 =?utf-8?B?eFBsZVRnQWd6ZHdESWlQUkNLUkJla05NLzBob1RZRWkrSGdFTHZWTDgyUDZr?=
 =?utf-8?B?QVBXQUJmZXQ5ZzRid0NDRVlEMUhzOEoxTHkzeUtsUVJFdGZSQ2ExbGN4elVD?=
 =?utf-8?B?blMwN2pNRVUxWnM4eGNGd2pIQ0MxR0k2eko1S0pZdlZ0Mm1mVEFPUlJNOURv?=
 =?utf-8?B?bDExVlZmNTFQYzlNbEpJSUp6OTNqR1BIdUxydlpCVk1tMWpqNU5SY2dnYXdk?=
 =?utf-8?B?MEdPVFJKR0FaU0FhTGV2eHUxU2l2OVNhb0J1T1hrK2x2ZFFGUExMZWQrN1JG?=
 =?utf-8?B?dVg0T0huVG1jRnFFWTduYURnQ2wyK1pCVWsyb0J5bGY0elU3SDNndENoRGxx?=
 =?utf-8?B?cWx4WFY2N0g4MHJuVnp4Tjl5ZHZDNmVXRG9yNkowMTJDV05OL1JyL3BZWm9K?=
 =?utf-8?B?QnkzTGg1N0JNUXVHaTRVNWRSOVpqQTdJajdvQzNlNmVHNW8za3JYaUhBeERv?=
 =?utf-8?B?M1JacUZEUkdLSmFKMzlSSkxwOURLNmZyVFFRbE9yWUs2L1FCMlRlRFBTZUF0?=
 =?utf-8?B?SWNuLzdEaXgwbFZMTEExcWRyc1g1NTdka0h2UHdoQ2h6VHYzdjlxMVkrUC9x?=
 =?utf-8?B?SDE4dFJtU2t3NjBSMDRpOEErdUQ4S0FjbHlFaTAvTWJ5MEdPT1RrUXhaM040?=
 =?utf-8?B?OGhjWjJjQk5ZandjL3U4aEV3RFIrYk9ZMXNaUGMyMEkrRDFOWnN6eW1zRndH?=
 =?utf-8?B?V0pGMEh1UHA3TTlvOXpZQXNpL09vam8xMXh3T21EaXB2c0NrcjVMSG1hbXgw?=
 =?utf-8?B?NjRJRlcrRHdSRDF3eXRiWFUySTZiMTR2YzcxZW0zQ2t3YmFNRm1nZ3loZVp2?=
 =?utf-8?B?c0VnTXRUTnovKzlIY0NhRUROOXZyR1ZvR3R0NzAwYVpQZkhMS2gyZVpqdnVW?=
 =?utf-8?B?b3RJWEdBMXZZdGZGSG91R01FWXRJQXBncGVTUVgwUE5Rc0N3TmdrQi9DN2VT?=
 =?utf-8?B?Yjh5RHFEbTBzRzU3L2REcjE3SjN5aDhTeG04bUNhaWJwclhOR0xEa1I0c250?=
 =?utf-8?B?aXlrMWNySG13Q2E5cm9WR1pWclo1NGZCaXE5ZDNMc3l3MmYrWjZWa2h3Qk5O?=
 =?utf-8?B?a3BkTWVqTzVyMi9MYkgxUkVFYUNJMkhVVnVCVlJIL2pVUzVNRWMrK0tHdmxp?=
 =?utf-8?B?bW1vaXRDMnZvcFFaS25tcEtWU3o2MHNqMGtwWkxSS1VsZElPMDNBVkcrT1NF?=
 =?utf-8?B?bkJMRzlvS08yQ1FHQmFSZU1LTG05cWxidHRGakZML2hFVU5EcVZoU2RuTGti?=
 =?utf-8?B?VzJsclJlYzJZemRpOUxJQUdUSzVZMkIrOE9kOXVBaDA2dnZqUm1EQXdJUkZO?=
 =?utf-8?B?WUdWN2d4MHVoOVJEdzIzdUxoR0UzSzh0eU9OOFdXUTNWZVYvYmhkcGttWDhj?=
 =?utf-8?B?bHFhVkRvY1JjV2paZndKcFVsdWNVMUViTWRZQy9PVUFBWUhLTU9samtVZzBN?=
 =?utf-8?B?T0xFcE9NQ1R0b3ZMaDZjWmJvSk1sVThPUlJGL3BhendnVklxZlYrcE9EQlVm?=
 =?utf-8?B?ZklTYWFPYW5XamtZQUxuaHlkMjh1R3JsR1M2SjcyYmI5ZHE0YTFmNXVXMm5V?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FNqC+V5ou82tklKYjLjqogDre4877wrXvWIaHARc/O3NLNIj3LQj3ZrGV8MpqNAem0Lg1VcKiAKQ7eVgh0gWksEwxGEkg0f7qG7OGHBSFEoIrpPdcXSZ1dYJbD8O3h6cetfPEDGXkdi9jH/QPmJ5bnYFzw6rqr/cHiG90DYEhdn3e+3E6oRK+61luTnZ1M89CQQwt5pxJa+rzmPb/C/SBnzCF91+fyoG4jg+DnMGReQFiPU8gf546WjcbI+2X8TINHWpMoUFlDWBb+JY8K1jnXs8fpmJYvjll5Nnl/E6LAQTs1hqIFYvuCaU7Xg2pzHnxuMm6f++bGe9GlEi5FWSsJzbav5Y/0dDacA1j7DJkPR82T2MaZ9Q20JE6uAp8e6ot65hoDUjrTVancRpDEvCxuVsrSL9A0DsNN5L18kpZrfySrCDr+4MlRzu3Mh+LQ0o1CDotdSfZBd1qJgiVtH88HT8LEyjLbNdwxkjFSaUc8TXH7ahp3/HObW+dFV/+uUjSVB6LqrA5OeREBy2w3mseTXMXSNyaxyLWkLEdKududd7MTHX9A2ZtngRlxUDj3fqwDNKCBDa/BQbXtdLRCrbP4GbgNZkALkEvO1IKYGr7wMVgMHUsBPKKG8v1R7y+krCSa8VzrctJV+OAJuwLPfZzfdEtOqUiywY3EUdzQXwsegj4hHLTDX/OffoCYEeWJrY0Sz81+BW6tiWnF9EXmXv5LNpflfAxlKlFyJXpFJEyqKm2vTM49tOCrXnlR8dsBYxmbO4zvqP7IqnpH2pHeCL9W7t2bKOfrJjhWNYvGJZOej3ELnCEuNs9mPxHpdVlz/E
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b7e19f-3d5b-4e7d-9398-08db140fa3a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 13:29:20.8537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWnEUNFZcMAIJbcjb0zR/KldAS/RKH1B/hR75RsX4nTZT6kjf9d55ojiCNHWx1HnGGliHIqvbnvZ6A2S1MnUAj5azVHnRmswI8Uwf2GbAxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6927

On 21/02/2023 1:27 pm, Jan Beulich wrote:
> Consolidate this to use exclusively standard types, and change
> indentation style to Xen's there at the same time (the file already had
> a mix of styles).
>
> While there
> - switch boolean fields to use bool,
> - drop the notion of big-endian bitfields being a thing on x86,
> - drop the names for reserved fields,
> - adjust the comment on "dest32".
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

