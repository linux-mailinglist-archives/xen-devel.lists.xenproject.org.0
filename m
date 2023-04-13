Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384F86E0D39
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 14:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520667.808500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvkw-0005IE-Ue; Thu, 13 Apr 2023 12:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520667.808500; Thu, 13 Apr 2023 12:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmvkw-0005F6-Rf; Thu, 13 Apr 2023 12:08:50 +0000
Received: by outflank-mailman (input) for mailman id 520667;
 Thu, 13 Apr 2023 12:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pmvku-0005F0-VZ
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 12:08:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efb02f32-d9f3-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 14:08:46 +0200 (CEST)
Received: from mail-mw2nam04lp2172.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Apr 2023 08:08:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6256.namprd03.prod.outlook.com (2603:10b6:a03:303::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:08:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6277.043; Thu, 13 Apr 2023
 12:08:41 +0000
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
X-Inumbo-ID: efb02f32-d9f3-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681387726;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NyKC7ful0tmjXCvD/cE0aEjeiVra+yd+nIM9MxeMqkU=;
  b=VvNWghZIFUFSCtiBjYSuzW/iijYXUXaT7QKG9ij5p9tlrq+UeiQYd7/w
   5MmQeONamTB4GONJE84Lo/7h9MPdsGVd6mBwaYq/9XLVZBSjqukwMNMly
   SgZF/tphqiiShybjDKdCEem1Uf//OGNibImOo6yP0z6kptmh/OmNNTFOg
   4=;
X-IronPort-RemoteIP: 104.47.73.172
X-IronPort-MID: 105401415
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dr/FlKoMvLn0YMDuFv1DM76j8EZeBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnXOP3YZmOkKYtybd+z8UgA7J7RzIQyTARk+ChmF3gWpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCziJNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACAvdzGAgOWa/Or4evN8lJw9NOXxP6pK7xmMzRmBZRonabbqZv2WoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OraYWPEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqM22ATPnzF75Bs+e2DgvOurhk2CSctaE
 0Uz8TYfooII3Rn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 n2jks7tBDdvmKaIUn/b/bCRxRutPQAFIGlEYjULJTbp+PHmqYA3yxfQFNBqFfbpisWvQG6qh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:BMPltqFwDClf4LpQpLqEMceALOsnbusQ8zAXPiFKOGFom6mj/P
 xG88576faKskd2ZJhNo7y90eq7MArhHOdOkPIs1O6ZLXPbUQiTXf1fBOnZowEIcheWnoRgPM
 FbHJSWY+ecMbEVt6jHCHTRKadZ/DBSytHLuQ+jp00dKj2CE5sQjDuR/TzrdnGe7TM2YKYEKA
 ==
X-Talos-CUID: 9a23:DprlHGFsl3B0pquCqmJ31lc1GcciXkGFj0fKM13gF35FUr68HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A3k36jAzomZ2ZQt9MNKnSGsHURcCaqIqVU10fg5k?=
 =?us-ascii?q?Fh9udMBR5HDyBvTudeKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,341,1677560400"; 
   d="scan'208";a="105401415"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0Jjc31Gti3egFW9Qhs5dLK/uYaUJ+c0KGrWoyq7mssKd28gkDNpe0j+8y2Ph6MOSgvVErAyrpEBZ61fY1UjhhKiqs/0WgYeVBn2G+7dIU9+8qT5F+ka19qvWbYo+J7dATxz6zUscGpXE7Ox40CuGOaYISfWV0fjJ0N7K0kE+Fk4SAqIDc7n7abj3Zvk8BwpQ3db7LgB95jA0n8G4vT2q6LkZG0RyVeqPGHIp+yV1C5PGLljpCFqeCWJfPwUZJWJejuScXZOHXY4edXrOgjN7eM3aYFPg95o0sud76W6XUDBROuhEpUQcxsbqpkiY+ZaSprnxU3y0ZoOGHF9y2BbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KazW/e7IpADiN0sjCBUE50+wnvHb9vU6fgRXtc6R2I=;
 b=g6b+TQ/AGvG5TOKj0WwfPpcv+ibqPDmqpduMmUiIj4t6KOBcx905VIsMIG8+gr0RQLq1guUclNUN6hoqXMMeboHeJDClIiO8Ch0KFJ0yMnP0NcWSMEG7j09oWKeaKkYybmqn4hp7vHmEvsy13JJ2dwBhXo8QKgzTo6zYzLqtg7tCpL7m2Wb0fMo0g6skMkcV6Om8n5yk7HKaz1+9Dn/frEJdCRV+udA6q9CQ6fHQhhP0U/CyJzAEbgN6eQMinf1G20q/Bdhn/Cp9BdjMHT+dKhg+Ge0KBIlVoe1G3ZQLCPCA91hwBqP8xCU+zArBhLrecVxZLD0fOYOpRC6GpybJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KazW/e7IpADiN0sjCBUE50+wnvHb9vU6fgRXtc6R2I=;
 b=qc9Ogh0x9VlpZXe+Olxeah7lU1GeTlpn2Z8EouGyRuh1GUF3kVRI/js9IOIGormbqyp8Rn61Nf0nAKXboThEEibrDrpedN8o2nyHrO2fU79YrbG9luzJs+iIecA9i40CI3UxSlo186EueT/LP6ptRRttoKrMpfrdEkUSkAIPcBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <71d52d94-806a-7919-72f9-b8e42e34d146@citrix.com>
Date: Thu, 13 Apr 2023 13:08:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 73330da1-9246-4348-e6dd-08db3c17d180
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1flO0QNeJ22avbbqDKcRGqPk/wB8CD1JqXRs44EUSz50hJcec2pPBnqTAAH9Zd0GWsT2z3WVLqfr9h2ZND9PN0CWdmm3s3OcgD+t3f2sD63UK/XvGa5FKIkZjHf85q5Bx3jSif33XRdXYyGLOOXiuS8Re255R07Dn2P/MxHloBjjACytvzaRZstGgVcRMu/K2cTIFnQdI9npCObqXn/eIP1zj/Xt+6Bgm2FuDFTruDLK9BllEIHgiduyjmQOCHQ0MXFtjEVkFnnatboY1WDih58UtpZ1u8NPmPdKla2oWWEgKdYuji3v/L5kgbrtNtDMQmYZQtIZABFnaLuj/bEKrcFbWT3GtH4V5XKjlwf2L+DUTG/Rti5aHeL/l5C2lI5flmG8bHWyx84QwMLiXHbXG3fmwUNMSXWaxbNj0pkz0m4WKu9rey9w/8d7FXHKNrEcpNFGcix20kmzrAITyM74O/6A+DJzx0wR6+rzUMo7cDMYY3n0mE8TL1hxL/MDrd2JRY2+Iajb0R62rHnGy7HLJ5l1z1Iermq2MH2y2MzDSWu/U6h7jV9vS/Irtn6TiQJZ5VwpK+u6KdUXAHDcA12jXtRLUv0w3tO04TojCS/uAXz/lX9PSt5iixrQVcEcvz64+lXy9mIhPQXeGaQc1ayYEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(31686004)(38100700002)(5660300002)(36756003)(2906002)(31696002)(316002)(8676002)(8936002)(86362001)(66556008)(41300700001)(66946007)(6916009)(66476007)(82960400001)(4326008)(2616005)(83380400001)(54906003)(6506007)(186003)(478600001)(26005)(6512007)(53546011)(6486002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2F3UjlmamRuOEJuNUxCMjN3ZU84eFcxbDJBUG5BdUxnMm5hTWJ6TWFPY1FW?=
 =?utf-8?B?Ym8wZVZ4QWlRTFF0YzN1SnYyaFlCTUF4dnM3Tm8raENkV3ZYZ2RGR0xHU0VR?=
 =?utf-8?B?aWU4MWRndlFWSzZmUjU0MU1qV2ZrRU5RNUtIU0JyTXhDOFdNM3NOSXhEWnBC?=
 =?utf-8?B?S1JNZ3EyQ25MSUltS205dndYcURwN3RFc2dFQ0hxUzZKbjBUaVp5UHBDMmh1?=
 =?utf-8?B?WjdScFVob255Um05UW5VQXdaSzc0VDZXbHFrUFdKcjAxRTVyajZmdTV3UXhr?=
 =?utf-8?B?eXhxYlN6SnFOTCtJVHNmRjhWR1BFQ2dDS0xrVDRwcGhmZ3JUQS9nT3c5TURk?=
 =?utf-8?B?cVl5MVA4WGpuWWhyUFUxaStDTHFkVVM0dzJXMVQvWmV1UENsTUp0RXRPNjkr?=
 =?utf-8?B?WGpONlJYV2FMYWYwYTNiNnprWkN5MkF2WHBjdlZ5MGFkVjVjSjN0WkhVUXJ2?=
 =?utf-8?B?OUJ4TkZ6L240bDcva0ZwQnF1dk5VOWgrRTNBTWJ6d2FsdlNzR3V1TzM2K3VE?=
 =?utf-8?B?SDg1VGFMYXM0b1pIM0x2RmdzbGR5YzNQYUVRYllFcCtoV2xzazhiTERXNUJM?=
 =?utf-8?B?OEQvZVhORGIyQ1NaTkR6NU1WTVZrcEEwUFFOV2N0NlZNQVNrd3Y2clBxM2J5?=
 =?utf-8?B?cTBXdXFXUnM3Ukw2cWIzM0E3WnpWNHRrRU5IV3QwNFhUak80WWZ4UEZXQTEy?=
 =?utf-8?B?aFZPQWxiZFc1V3AySjJjM0hYUkpYS0hiUGFXZzFFVlM0NXdreVlJMFdWTUFY?=
 =?utf-8?B?bFdqVEJsV2FkQ0hLMkM1dEFBbGVyK0h6TUR5dWtKdlpoa09DdzlEVXluenQ5?=
 =?utf-8?B?dkpCWlFOeWo0bFlDa2Q5NHFOcFl6V01laWZKZXpBVHBLRnBVTDQ4Nk92ejRl?=
 =?utf-8?B?bTcvT0E1czZPbWNBZk9CcDJ2M2grZnkvRUZFTW1BOCsyUHl6anFlSVc3OU9D?=
 =?utf-8?B?TThXQnRPZGp1R281ZmJVYU1lTnhUUE9WZUY1OG1rU2NsN29ERHNvZFpvNGNa?=
 =?utf-8?B?MmFzdzBUdXRCZnFZZUNaUjNyK2pQc2JNdXhoYkZGY1J3TWNJUU1oZXF3VEVS?=
 =?utf-8?B?QzdwSkFwbEVDOTVPK3FmYWFlaHRBaXlyZjV3VGNzNHdHbjlnRFlWN2d1a2ZP?=
 =?utf-8?B?WWtDT0xiODRVakd3M1hDeUVtWEcrOE82NVo3bDRrVVhXbGpYYmU4ODBhMmJE?=
 =?utf-8?B?UkRrSzhBSytuS0Rna0UyRmUwNlAyTWJIaEVSS1crNWJhcDIyRm42OTNpVk9p?=
 =?utf-8?B?aGM3amdCallKajBYOGxWdkJxV0RxUnhWUUpiOWxnNnZFcm8yRk95M0c3TURD?=
 =?utf-8?B?K2ZKMDRIbDlKVE9ZeWR1am5WS0E1OWxtbjBqTHRhUzRJd2hsdUp2V2RxWFpB?=
 =?utf-8?B?OVdtUXVyV2ZUTkVkdTNpbDgvZnRQdVN2UHNHUzRFanZyMU9DLzY0RlFnb1FR?=
 =?utf-8?B?Z00wa2JaQ2VvREZ2Uy95dHF3MDlDVXd2ZW95bG82ZnlsT003UkU5MTZpM0Ri?=
 =?utf-8?B?K0JpeUp5eEI2U3E0STR5R0U0WjhKb3hYRHA0YS9GUFRDVlhNNkRlTTZLUzhZ?=
 =?utf-8?B?K2NVOGFYYThHOWlTL2xVcVRmWURVQ2tqdEtmUUFYL3RGczMyYU1UekJ3MXRQ?=
 =?utf-8?B?TVNWWmdBTFduRitCRzc3V2hBaS9IZFZ2enBPWkZEMG1wNGo3TW1DaVNSNjhB?=
 =?utf-8?B?SG04d0g1VTNTVVpnYk4yY2RIMzdKOG5vNmc1VnVmVm1CTDNPcHpUQ0xUREJi?=
 =?utf-8?B?cEVFNU4vZU01MzJYSHVwdVBiWDNXa09aa2s2NFZwNzZXVlFtV0FnL0FLdXF3?=
 =?utf-8?B?SWVaYU04WTBRYUgwNkpGbzdCNFJuaXNpZVV4QkREa1dhWitUMW4yZHdDM0Uy?=
 =?utf-8?B?S2FVTFhyODFmeXBieUtqQVN4WWdhdHRFSzJ1K3U0V2NOa3N5UGtmUStBdnpX?=
 =?utf-8?B?Y3JjNlpUTWJHUTRzVkREdFdpcXJhdFdvWE5zNXhhckNmSnU5ZnFKR1dCakFy?=
 =?utf-8?B?WTdvdzg3MkdOMHpXUEpZTldEdGZCNE9qeGdBSHl0V2J5Mi9uNkpPbVo4V0JZ?=
 =?utf-8?B?aXp0eEdCM0w2YWw5eGdKTUdEME5RUnpjYzRwakJmT3hycXR4QitHTjFlT2pT?=
 =?utf-8?B?b1gyb0k4WWFGckpqaVd3eDJQUEhQYS9GaTRuK2pjb25hOFpGaEN0UzV2NndS?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Zrz4U+umDLZX/Xma6Ts27+20V087EZFF2lkkhdwiUiIjPAmOdgVE8YoOtKCC9ekdTr0YCGDwP2DEKclAwqwqjrg1TxAUeAMet83mv0Wpc6zDAVoiCqQNKCdZXspCA2cTIcf70UDksgi8RBoWXw4YLBiYjmYOtuaan0r75ho+fLn4XJHewRVLjAbW0Xh+hZRq8Gb6EENEJ2BwmHN/vDT3WbNvWXagJG5tQI+G+Iytg8H27K/vcRK/MuRVDUY2xnnUqb/2cf4rU8j+jQtRKamf6nrzv/SEkz7+iTFn1/TJ8qPH0QEC55q5ZjWjocCDVjNbet5wJx2q1S0mqHn0gg2/jFPkM8UksicM0KhljFw/jj2S98kM0Rw1xpeFCoxZzftJy2CcoOE7XhegBjwHCi1ikRiY/jVEiTzM1fj/ZxLuwHuTb0sZTsRDWWB6R1gAL5/4icFsHNgl8l/P9/woDwxjvEhwpf1rGiQt/8QvKoPGvBB/FDU+8Fgriu+8BdGWT5jeJ9unZl2BEULovDOVM0ZgKDB3iqa7qI07b/uLmyYj504ZLa1VRHYATg5SzqZ2LZMYfykhPZH/n3ElfWvQ7PGAS68kBr/abUPR5GdshJKZtOUBpFNVipjN0Uk7FcTCAV2k4Lt9KYFeh6ImyGsoYC5X2BquDeNloCkyv/8Y84Spn+TJihJrqexY6O3x5z98kC2gtZ6+usTgPi66doPnyMxWRorpq53lRRnImUzTKcMveHfK34qATSRXOVisqB1nNuq7Y6vY5xfXODLgVQ0MY0RMnmCrQq6N2++DX7bhTT+0hkw5Ybuk9qbsbMTKRJW+UWacejI28bNQ+V8AVfT0nsmxRQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73330da1-9246-4348-e6dd-08db3c17d180
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 12:08:40.6961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMCjrPNhhmdBpGEQRDvqBf7im0950dV6c83rJWncdESmvrOYpnJJuwapz1pIq7nZlkVVnUBxEJs/ovUjZ14ta53ef8hFtnO0IAbHQZM+qtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6256

On 12/04/2023 7:35 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 1454c1732d95..3c8d28a2d8be 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2340,6 +2340,21 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>      }
>      else if ( !(value & X86_CR0_PG) && (old_value & X86_CR0_PG) )
>      {
> +        struct segment_register cs;
> +
> +        hvm_get_segment_register(v, x86_seg_cs, &cs);
> +
> +        /*
> +         * Intel documents a #GP fault in this case, and VMEntry checks reject
> +         * it as a valid state.  AMD permits the state transition, and hits
> +         * SHUTDOWN immediately thereafter.  Follow the Intel behaviour.
> +         */
> +        if ( cs.l )

It occurs to me that this needs to be qualified with LME first, because
cs.l is software-available outside of long mode.

~Andrew

> +        {
> +            HVM_DBG_LOG(DBG_LEVEL_1, "Guest attempts to clear CR0.PG while CS.L=1");
> +            return X86EMUL_EXCEPTION;
> +        }
> +
>          if ( hvm_pcid_enabled(v) )
>          {
>              HVM_DBG_LOG(DBG_LEVEL_1, "Guest attempts to clear CR0.PG "


