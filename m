Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514255328D0
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 13:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336523.560859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntScn-0003fw-LC; Tue, 24 May 2022 11:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336523.560859; Tue, 24 May 2022 11:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntScn-0003dJ-I9; Tue, 24 May 2022 11:22:53 +0000
Received: by outflank-mailman (input) for mailman id 336523;
 Tue, 24 May 2022 11:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jpOU=WA=citrix.com=prvs=1362cb858=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ntScl-0003dD-VD
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 11:22:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7122abd-db53-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 13:22:49 +0200 (CEST)
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 07:22:43 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6221.namprd03.prod.outlook.com (2603:10b6:a03:3ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 11:22:39 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 11:22:38 +0000
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
X-Inumbo-ID: d7122abd-db53-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653391369;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=M2JuA1N9OR8zm6eU6YwbpiA9m4oveJM1/JQpVnCw8WY=;
  b=KxvpTJYQXUml3HEPJALCG35hatjuE7RmS1kgyht7OxBeLDGWqoVFW2zh
   jSf+eHXvvrPRp6LRPywLiF4ESSMKWZ5YQ4/FHLVQHClevtcLtDybEAmQO
   jig8CFRCtDTwiwyEHmH64Uc0t9Qsf36hH7E7t4JcOKmUJweGRPoDSyMhz
   8=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 71406459
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JOWFo6jsJc1nN6kjHKTMVxw/X161FREKZh0ujC45NGQN5FlHY01je
 htvX2uFPqqOZDb1fNAjOYy28EIPuZWEz9RmHFZlqn0xFiob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnR4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUQWO4LOp8MfaT5zUChbepdW877KJlHq5KR/z2WeG5ft69NHKRlqeKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuoQegG1YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8Q7N+/ZqsgA/yiRS77W3H8T3ZOabZusKngGJt
 2vc+zTmV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdwK8iG6JuFgbQdU4LgEhwASEy66R7wPHAGEBFm5FcIZ+6JVwQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPfdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:CYi1QqqUYXh3pMkCg2D/m9UaV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,248,1647316800"; 
   d="scan'208";a="71406459"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjJGWhzhkoYMAdjMJj3N12dd1PiRA0Dsgx8Ag7B7S3LGK7SuVQUyH5RmS2cWnH2nw0PZZkRMC/Qaj+SBzh/6dSS2bVXsJmXzbExm59gzOew5NMVR7EeJuFCBBckgaO/42th0Ac+VkS7gycfvp+Te7gI9m8nkuLJrY+kf49+qsI8bO+RH1qMCLvP8nK90q64nYc6G10cAX5mDG4Czv94YxRxKpF8akLtIanxsLNLXWhPBiS8tUEybj193zKPe40dhbaHYvPhUt/gwdy6ry3Dzob52xnzS6QuiJtqQnuGvsL4x3GZIWj3AAtuyX7FxlgNmTCrlHI3P8fIsyK0gKe5oQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=190ePyfk/4uCuF7tGnBdsg0JDGZmwp0H30+6B2ZVhvs=;
 b=cp/+cI6HarU0hypS2vUAeYSP4cRR56+kSdtOzGVwGkWE4j6FrHh2Yns+W0/YJ0NvOMjnGntia+TBw8EswftkqWcCo5OXALWkPunPC5GqhsVT5gJ76Ri+tbl+m7mBgu2QdUmq7VH0YuErz76AmqK08x9OKo2Qya834PL9bFQa5VNyKIqgwG8412pGtVFLiDLdpXF/ivLwX0qWJBJ84bu9eBL2qUBEyWOaVmDdphNRM9aBoONUahP/WjfC8/XO4tTYuZ9W1cRROqarIA861aMk48lq0Mr/0Ny9c8qeyXdPf0R5uXEjUSCfw0t+FBpk08wrVSRlblHy0ss+CXSzwKDrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=190ePyfk/4uCuF7tGnBdsg0JDGZmwp0H30+6B2ZVhvs=;
 b=qs8Q9FpMpUxTFHnw/GkEgvVowG9DcPFO9etfgQ4rR0HIXe5R+ruqs9IzGoQBQ6qH/hOBFadK745mpgLUxJp1V5PspdmbufwBfi8Khw2W6eN6r/20ZMRNK3hVAV1qEQoyCzp+g5buLd2LK1L8bwsVE5j8qrY2An3w7elIxqzahxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 May 2022 13:22:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86/hvm: Widen condition for
 is_hvm_pv_evtchn_domain() and report fix in CPUID
Message-ID: <Yoy/+t6M4JCxzUAk@Air-de-Roger>
References: <20220518132714.5557-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220518132714.5557-1-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P265CA0458.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53bf2849-8536-43be-ae7d-08da3d77b5c5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6221:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB6221F25C59EFB6130F20EA558FD79@SJ0PR03MB6221.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dLbEsCADaq75WZENDKvdDZoh1CPQGyHIN+HF/E2jrEayDJg4gVTOG4GpH80B+KqecfT2/NU1Nstpf7LWNHCcMZWb80ZBBRoJRxezRiqhoGNm1cip4TvrhCQz7wKsaQaw2gXiMMsImxOPjTUnJFYTr/FRLfEIGpoKXkDyOEuwGiOP2vNp54UUR2j90vQYr9mddTuQA66+WbyKDoewNb3UrQ8yV37kTd33/30+gVQd5IoFprzrW0ReyUA6lRirwOo1nAgoGHJ5XYfKnFqwUix472FSpxc6zMRmKupZWqW3NGtUAmRJovIDRDSh8zGng3ORWoOXcVWeju2YHayq5RJ6EQR+mYEVuyD5welD5jKvw/BN3p+g4fB/gvNG4LdSdfHNI97KoetUvHbcaBsElKsfkHL/mUj+Zq2Eqs66h2q+mEXWnX4XPX/8aslv6rRo5XKYGTouTaSj0/bTD0IbgBcBL7F/l6+Lr6cpQa7biRdv50mq7KOGtUzgfRaoTJWLDGkJXsKC1zdK8hLshNVEPTv4eTlx/TbAokZt51jHAix/i7Q/3oiAWV0vgouHDrVe5F/ojcgpxp980IkLE3O74IM0HLPKR2MfSTKzSFYTpl2tucS0Xl+S6Bd5EVfCE7/MB1QcZLNgU+eWPQh6n2GIUnbWpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6486002)(8676002)(186003)(5660300002)(66476007)(83380400001)(6512007)(8936002)(82960400001)(86362001)(54906003)(9686003)(6506007)(26005)(6636002)(316002)(33716001)(38100700002)(66556008)(2906002)(508600001)(85182001)(66946007)(4326008)(6862004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWMrV09WTXd1cWJ3TkJuWjh4ekxiZ3NCbi9kc2dYa1d2c3ZQTXpNSFJEWjdN?=
 =?utf-8?B?MXVEanVaRUd4clJ5VFQxRURmS0lmMzFPd09CczBvbWpWK2x5eldiOVMzdEJ1?=
 =?utf-8?B?UFQ4TzRzNSt2L0dDTkxJdW82WlRQS1l6UDFiOXBrZk05T1czM0JjTVVBbnc5?=
 =?utf-8?B?K3NzcDI2L3RIOGFSZk1JVGR2NUtQbUpmNXB0NytPSGdtbHM5NmNleUJ2YVdN?=
 =?utf-8?B?eUVWUXZURVFoazVVU25JMFRoc3QrcUh1RjlmdDFVLy9tWE1tb2NVc0xkSTJB?=
 =?utf-8?B?OFRVYkdQdkh5S2hIZmIvZHEyM09lZk1zSlZLOEhlR2tqVVd5Yi9GVnZnSGVE?=
 =?utf-8?B?T2hEUDdMdEVrMitueDZVcnE0ZzQ1ZlIvYi9xU0JpWDJHdHJUMXpPejNwVzZh?=
 =?utf-8?B?V1ZkcmhpMlhtei9EZzJBckVEa3p0aTErZ0phOG14TWt0MngrL3pMSnlOS3Fz?=
 =?utf-8?B?dXcyNnRSaHNacjhEOGVRNFprZnMwdjZvUlIwUEtOOEMwbTQ0T2FVd3RKdzFV?=
 =?utf-8?B?ZDJOekNKWk9uWTZ0YkV5dmxESkFLWUpOQ1RPOVNVcit1UTRtTVd3bU1BWTkx?=
 =?utf-8?B?SzNiL002V1RlRUdZRFVWREZ4T2k2M0FLQVpKdHd4VCszWGw1YlNlcnJYT0Z6?=
 =?utf-8?B?WE9CcGZOVlVLc1labXNnS2tTT2JQdXcxeC8yZm1wVG5idmNnMmhsNCt5amVJ?=
 =?utf-8?B?UWt0ZE9ySkVXYnBJU09XT2ZMcnM4R3lEdGRSWEZCTXhOalJFRU9mWExQNVJj?=
 =?utf-8?B?MGZhS1FWazBvUlVBUkYvWTJvQVY1WDFucDBzV2dQd2swbk9zdjdnY3Q0L2JO?=
 =?utf-8?B?VHFnY3EwQlhmemhaMEpsTkZpdFhJTXYwZy9IL2FneElDQS9kOStsTys3cHlR?=
 =?utf-8?B?REdCc3ZqSjlFc2FOVkJBcWxJTWhrTzh0eWo1U0tJTm5qT0FIeU5pdGczNDgw?=
 =?utf-8?B?RTFFdzFvKzV5dEt6UmRheS9aYm16QURXTTZoL3kzZVByRkdLRERiQ1g2NHNF?=
 =?utf-8?B?cGZvdm1ta05GUlhkWnBYVzV2VkNlMkU0WWZFdGpJNlRiMzZGL1ZBV0ZaaXdU?=
 =?utf-8?B?SnNieDlzRVNnd1haNGZPR0J1ZFZ5MVovUWtPbWlRQlp6NDR2QXVndkkxVDdN?=
 =?utf-8?B?QXNqNGt1Z1gxNGRxcTNnWG9oRzcwdVMzNmp0RGdtQkg1cDRycFVNdDFZb3k3?=
 =?utf-8?B?V2E2SDR1c1lpN0RXVDJPVjNDcHcvcTdNbjV2S1F1YnAyTWJ1djhZK3lwQUd3?=
 =?utf-8?B?ZlAyQm5hQUd4dVJGRDc3Z1lyQ2dWdkdZZnc1a01wbUZwbmRPQWxRVHI2VUJX?=
 =?utf-8?B?SDBOdk9qSTZwMkNzNDJNbjEvMUR2OHdSZXMvdkQ3Z3ozTUttaEhjT0VNWUdU?=
 =?utf-8?B?U1FBWkRGeGgxZVJHaGhCbVU2TEpmVEN2cm9xa01WNWhaekViYnhXa2I0NUpH?=
 =?utf-8?B?bWgwaFp2TVFXNHFJejdXVlVUcXVzU2ZNUkcrUDIzdUtxZ1Y1SDExRlpoWjg3?=
 =?utf-8?B?WEh0NUVuTnJ3eFFHWG85YjRXNVdQbUxXYWxEcWJNNWMyR0NJOUdLaSt4c3kx?=
 =?utf-8?B?ZzlJSHhzZ3pMWDFaZTA3Z3Z1dnRDcUJjWDMxV1RBVjd2NjM0YWs0QWdCMXZ5?=
 =?utf-8?B?V3JNQ04rWko3eW1SVFJwclRvdXp5MENnQU9sRUVOOHNFSGV2QmJSV0VlSzNZ?=
 =?utf-8?B?RVRpOVJGSHpBYVpyT244L1hQSGE0U2hNYXc4QVJiaGFZOEMzejJqeW9KU2l0?=
 =?utf-8?B?U1JyRkNiOThpRWV3TTBLNFVKTWNFbDNmdENuYTBUY0F3V3BZVzBWTTRKeTNx?=
 =?utf-8?B?RklzQXVZMWdIZllzUlRoejF1WkJQZmZPbld3SzRQZy9ESGxQQ3NDQ3JyQ0gw?=
 =?utf-8?B?RTRZT2xoakpRK0ZTYmtWSGZIUEJPZWhzcEZ2d2tXTXBzdlJUSTQ2Wnl3TnBr?=
 =?utf-8?B?L1BWb3VrK2xYSmVtcGp5MHFjbGU2SDFMczdJRmNuTXFpYVlYbENjcVhGdVQx?=
 =?utf-8?B?dHVpdThyaW15MWcyQzhLTzk3em1mb2VHYXhVZzBRWE5MaEIwV0k2S3Q1NEJq?=
 =?utf-8?B?aTRITHNOcHFJV09zWW5DbUhFMWRxUHRrRUJWdno0WW5WaU52WVdkRWVxNDJS?=
 =?utf-8?B?a2cwR1B0b2ljTnVoYklhTXljM3cvZ3NoMncvQnJESmxnZXZCU2QyRjVjdlUw?=
 =?utf-8?B?cEd5TSs0U2hPSUdGaTYzSmhvckVRak1NOFRVeGlRL1VLUURaT2ZvM0l4S0xi?=
 =?utf-8?B?YWxFRWdDMWZzcDNxd2prL0VudnZSTmVoOXJoeTNuYXdOM0NGbUN1TUYvZFJv?=
 =?utf-8?B?eEN1Tzk3V0V4NWFWK3FTREU4azhnYTNlOURoWU1uN0IwOUV6Ty9JbVdnbDhB?=
 =?utf-8?Q?3WeEXkgO/mpU0pYs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bf2849-8536-43be-ae7d-08da3d77b5c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 11:22:38.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sj7DFEayAMKBB0ku3wuCiVPx5EoAoe7R33UrY/jBlsiR6JI3y6vDbjkwILQHnloyebX/cuNyx3JmTh48kOwxzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6221

Subject could a little shorter I think:

x86/hvm: fix upcall vector usage with PIRQs on event channels

On Wed, May 18, 2022 at 02:27:14PM +0100, Jane Malalane wrote:
> Have is_hvm_pv_evtchn_domain() return true for vector callbacks for
> evtchn delivery set up on a per-vCPU basis via
> HVMOP_set_evtchn_upcall_vector.
> 
> is_hvm_pv_evtchn_domain() returning true is a condition for setting up
> physical IRQ to event channel mappings.
> 
> Therefore, a CPUID bit is added so that guests know whether the check
> in is_hvm_pv_evtchn_domain() will fail when using
> HVMOP_set_evtchn_upcall_vector. This matters for guests that route
> PIRQs over event channels since is_hvm_pv_evtchn_domain() is a
> condition in physdev_map_pirq().
> 
> The naming of the CPUID bit is quite generic about upcall support
> being available. That's done so that the define name doesn't become
> overly long like XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some
> such.

I think you can drop the "... like
XEN_HVM_CPUID_UPCALL_VECTOR_SUPPORTS_PIRQ or some such."  That's maybe
too informal for a commit message log.

> 
> A guest that doesn't care about physical interrupts routed over event
> channels can just test for the availability of the hypercall directly
> (HVMOP_set_evtchn_upcall_vector) without checking the CPUID bit.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

(I think the above can be fixed on commit if the committer agrees)

One thing that worries me is how to differentiate between callbacks
setup with HVM_PARAM_CALLBACK_TYPE_VECTOR vs using
HVMOP_set_evtchn_upcall_vector in writing.  We usually use 'callback
vector' to refer to the former and 'upcall vector' to refer to the
later.  Hope that's clearer enough.

Thanks, Roger.

