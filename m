Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B06C3300
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 14:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512640.792681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec9A-0006Pc-32; Tue, 21 Mar 2023 13:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512640.792681; Tue, 21 Mar 2023 13:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pec99-0006NE-Vh; Tue, 21 Mar 2023 13:35:27 +0000
Received: by outflank-mailman (input) for mailman id 512640;
 Tue, 21 Mar 2023 13:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNSa=7N=citrix.com=prvs=4373eb648=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pec98-0005wU-4g
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 13:35:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b268b55-c7ed-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 14:35:24 +0100 (CET)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Mar 2023 09:35:21 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6341.namprd03.prod.outlook.com (2603:10b6:a03:38c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:35:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:35:14 +0000
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
X-Inumbo-ID: 3b268b55-c7ed-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679405724;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9oq4q91OofRR1GTz3tDhX40FzsgdoxmMttSCyvp+seA=;
  b=X8yDAo3m5VfTzGU//W+57DLGQGkW5v44Rw/O8luBpbqZupCZXH4Z0Df9
   cp6kesRMx6RZk1/m1pHIPE+ZXLwwEX5XTHgPEtZtMmOo3zI5fHAoflwfC
   XFAi/A/zZY3rxM2lTHymatNbkwuIC0L4cqdvlq8rPNev4aquajbxTy5O0
   4=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 101708836
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RopNgqqev9hJidH/7Coac3/7I6FeBmL8ZBIvgKrLsJaIsI4StFCzt
 garIBmGbP6OZ2D2eNojOozk8UsB7MfdyodkHldrq3pjH3wT85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAtXbjC5uOGR/K2iW8p+lPktN4rMIKpK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYWIEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqc12A3DnTJ75Bs+FkOWreC6l1+CXflce
 0skpSowrvI86xn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l2Dks7tBDdvmKaIUn/b/bCRxRutPQAFIGlEYjULJSMH7MPku5oblQ/UQ5BoF6vdpt/oHTD9x
 RiaoS54gK8c5eYQzLmy913DhzOqp7DKQxQz6wGRWXiqhj6Vf6agbo2srFLdvfBJKd/DSkHb5
 SdZ3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:MJfNdqmdyn3kShpBXZkhfQq7r/3pDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,279,1673931600"; 
   d="scan'208";a="101708836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IN0A5mfcjCVF65y8YYxBOUXUulpWLe3aOxeBxmVXAkxaLOm0UhfxxSPiZbVkZTjJ2a1JiyTkhYCqgLsKsdA/dKRz9u6FuJcE72VGW74chphHuzUT+LaMogOndwS+TI+PL1alBFAyttW5sTtCh2ENLIJbeFgZK6yFg0O71ujmoIwJR+tiMPcljcL7rbyvb7KE60cmrpefKo7tDh5Ry3tMVySwf2fynRc7GNY71Ih+GW7KdqYlnHKAHxaeQ+eUDe7nWAMUcn/XTQZxttyTQtf8IquSB1mGyLZZHxyz76slD9V6iwoZkH12DcNimktEPSXHramV6rDtQ8UNsU/f67dHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uqi9T+zBKoiUa3LvTRNINQZp3sp/ice/UZEQL1pAw+c=;
 b=kSHUpdUn3fZplyadMLaFF8RQY6aSKCznzxWXCpiM22YZ/lirO3TDsfRy7C62eFrEj1PtzKbMPqRpeyhFGdQ14bieqCePb6u0jhO3WS+TPUgz1ClJORP9SdmIpIP6IvHvadWjkeA4BPADQsg/i5BZkEcBaK8ot/OZ1lnyhYxlOHnexYbQ+LUlQdAsCNGL5tfaMVT+XaUXfWy3hfCO1nD6M+G7kdN0b2L8Sg8o9QbqLEOEKNzQBQTECeK+4PR7D9dACkf2sv4DMSe7tfcYG/OWwVL4GoJcqmxhD0Qjpn6v5kDgiJaWAMXiuZMWlr2qQH/mQVV5uuIMDBUTpYrDgMX43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uqi9T+zBKoiUa3LvTRNINQZp3sp/ice/UZEQL1pAw+c=;
 b=nu6OH2ql3/EofKX5dsCWEHkdLkgOnJOkz6SKxR7ftZcaKNbuTJjJ1pnzXe1bA1k0ZrJDC41zwpjMzSABqZFAbfmlkce7nUfN0Uwhhf9xyWkefi4GMn8F5/C0F3eKFMO3FFLXqeTbaFUmx/YngUDvMyMg6kKrBe2lVQA9rktxM5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c3eb2a84-ff3e-7d95-ec22-2d7c94367809@citrix.com>
Date: Tue, 21 Mar 2023 13:35:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] tools/xen-ucode: print information about currently
 loaded ucode
Content-Language: en-GB
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230321114745.11044-1-sergey.dyasli@citrix.com>
 <20230321114745.11044-4-sergey.dyasli@citrix.com>
In-Reply-To: <20230321114745.11044-4-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e89fbb-e663-4e87-1786-08db2a1119c1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7c8ZiD21/oPpK84bg7iMs/TkhtK5ImqaGxMiwlmYZVExFv89yvUfbYuRgAftd0stWLCd8k7XdkN7IFIQjmy57J/+ot5Q2bE0KG5c+HZTw56xr/J0b4EDC9PopLAWgvrvmCACtQakaKuptb1a9etZZtILYdOI9f5dtDtlO+mrj8Q2tPNqyrg+wK24ylbnYJlmjqM+SzEic0OSSg4OUafyc73l9lREI1DaydO6jSoXJQE7p6rXFrIMfkQC3i9W2Lv7nv+w/tMgCTY65qFE9AEoCPp4+FhX5+NUeiD+HtWdv2/m4jotCh92HWhDb/qA1VYEhrWfh715fBkmX1rsAYN5ZnX3Af4i/rF4Vezl889IWNFS0QEDpRF4DYPHAI/JI8ceM6ISIdNiSKfYk/rco6H851fY4W1GBL5fsrR0FGa0AWm6ThTA+t9i0NkxirATSlQgKOK67yaAkRFRFIc4jU2AKaDreGvZb9o0sD3JeOAUzLAgeTKtRrXfwLOQnk5dESwQhV85cAGAxZzxgeW/ZCM6eeHWnDNFqA/wJCMeBYiai1A3jOk8AR7kfrFNx1pfS6yaZ3ldZ20dtlGgq9Vy2z73XPknTck03EF6j+9Zsy2klcaro76qIey5qPFsHXxXRvqh2ZjLfTfD109Y3NOv+q8yYyLE4jL7JlKsk9q5k4xJ7+/+RkZypeJyVPntJw2kfF7na5qppeZgYxsV3O/QaWgHaXAW7gGN6WwDBi3aM0ztAOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199018)(6666004)(186003)(478600001)(26005)(8676002)(6486002)(83380400001)(6506007)(54906003)(6512007)(53546011)(31686004)(2616005)(316002)(66556008)(66476007)(66946007)(8936002)(5660300002)(7416002)(41300700001)(38100700002)(4326008)(82960400001)(2906002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1g5bTFzc28yR0xSY0ptT3lUbzBXZTByUndUaGFTTkZIU0JQSEVDU3dZZUtM?=
 =?utf-8?B?eitJbWdJaDl5b3RhN1gvK0ZsdThFLytRdFgzbEpocnppUTFEcnJEdTlQQWow?=
 =?utf-8?B?NzZvSlZnUnYycVNrdjhDcTV1eUJNdVRDNlBIK0J4WjRHQzExWXZzbFoxRnlz?=
 =?utf-8?B?SHFTVmJHdXVySENudThqV2dYZnFxYTFZQWxkdGs0L2hMaHlMN0dUVFdXVWIw?=
 =?utf-8?B?YUtONlRzWlduMmp0M0pPQ2w0U2hlVTlXdUUyc3Y3MjdNRU1qQWlyUTRUY3VK?=
 =?utf-8?B?bXJ4RThsenJDWFhyMnBHOTUzaHFqU0JXQzFLVlUwN1N5bUdxUVZFaHJua0FS?=
 =?utf-8?B?TWY0YVI4cjMrOGpxRHJNM2NLbk41QjB0WEljUUFHWVd1NDkycVczREtPbUcz?=
 =?utf-8?B?dTdrUlJXbmRYTHBmcjBIUGtNUGlxY29yM05xemNKNzgzSWZLRnEvM2hrYjcw?=
 =?utf-8?B?bkdaTWtXcDkzVGQ2RFcxWmRyZmRyNk80WHlXZ3VxV3kwNFlZTmVENGh4VzB1?=
 =?utf-8?B?ZE1KaDdkNDFnbXNjejN2WklNT08zRlJjQUlvV2VqUDNueDNIRWJLLyswdE1C?=
 =?utf-8?B?M1EvRFZVR25tNDJIUzJBN2xMbCt6RlgyZDZrZGcyQStEZ1dOTXpQMmE1eDRY?=
 =?utf-8?B?VC9sUzUvNWlQcm91NHRRYlJXdTlveTBaYWNOTVA1UGtvYlFtanBhcDFCa2lk?=
 =?utf-8?B?dU9KNkpWcU5IUEFkbmIxM1VrZlRwemxRUzFmMnRxays5RlRXM2ZNWUsrbCtN?=
 =?utf-8?B?QWR6aTFIOFZ1NENpdDV5Ym1iclhTNFQvM3dxTWIzWS9jR3VnM2NTY25nbXJ2?=
 =?utf-8?B?U21heDA5bWFoaFNEZWo4TGZXcEEyMkphbW9PeFhGMkNzYi9ERE5yQWZtWE9z?=
 =?utf-8?B?M1dzdXYxdEhpcDFZTDZZb1lLeGc2ZmxnTThCVnpwYXV5RzhiM0k3VWFIZmV5?=
 =?utf-8?B?TDFqYkVEUXQveEoxQU9UN1dWTldUdHhmUS96STJHS2N6MXc5QTVTL2FMM255?=
 =?utf-8?B?RXIvbHo0cjE5WktTWHdhVUhicjZzd09uUHdQaDcxdGRENFB2SVZXRjV3b3M0?=
 =?utf-8?B?TmVTZjhJUVJTSjNQSVJhS3lGaUx4aUt2M2hIaFh6TU5aVnlieHJzVDlmVW5l?=
 =?utf-8?B?YUtxcjk4OWdzanZJRjh4Y2lDdXViV01WZ1NsV1B5d2piNllyell2K0x0K3ph?=
 =?utf-8?B?QW9EZHJNMlNmSTY1SUtONWcrRHdxOHRVd2o3Nk9XNGhVSWVKQUYrK2RBaXA4?=
 =?utf-8?B?Wm1DMnNZZW4wNXY5SkZ1TFkzK2FSZ1dmdk1INjg3QXJYQTJUaGxCTnJyRkZW?=
 =?utf-8?B?bmVXcnd4KzBvdVpNY1RGSHA0RzQ4Q1owK3puOVpuczUzNVp6QndqeUx3ZEZ5?=
 =?utf-8?B?YlRWbEJ4NlR6N1o0VlRTYm5WcSt0U2Qwb2Z1SFlhYVpTb1duYVBQc0srZHpt?=
 =?utf-8?B?ejZVaHJmWUIyaXMvbGVNNE9NRUFPNFpHbGVHbUpzN2xGYlpaaU9QUlpLZnI5?=
 =?utf-8?B?VTQvRGFOSlZVMmxTU1J1U3RSMTVBUXMrNmdRdkRQM1NNV29oMXpxQ091OWZI?=
 =?utf-8?B?eEZnSld1Y25yWlhyRzhDSm1kOGJhV3d4elVidEJmQ3dhL3dadkhDS0licmpN?=
 =?utf-8?B?bGNjKytrazlSZ3NFYTJKRGN2aWdsZkNwejArY2UzeW0yUyt2MTI3Q01ZQnVX?=
 =?utf-8?B?NUhXZnNtRVVsODJwM2tlWDBvMklCeXFZeGtUYmJLM3JvQXlkY0JnMWV5ZXJX?=
 =?utf-8?B?NEFZcHVoWDNFMTJCb1Z3MFVTVDRZZ1VpTHNXRWpiVmlORmNDb2JCYlp2L0Rx?=
 =?utf-8?B?VkxmZ2RaZUhTMi9oOGJFTElpYkpvT2s2RDZKRVdsTjRJcEdPQ2JtQjR3aVFx?=
 =?utf-8?B?eEZwTnBreVdNdjI0bmoraG9sN1RoeHdoN2t2ZjlJaFFpNDBzb3BDOU5ldjFv?=
 =?utf-8?B?Y29EYWcvcTRhN0xFRldSUmFpSGRGM29hTVkwQzJuUmFtVTBOU3FrbEdjRHdw?=
 =?utf-8?B?MUNIUWVJNittR1Mvb3Z6REVpSXh1VS93MGtETzNKbUhmUlRCZERoT2ZFdWox?=
 =?utf-8?B?VVp4UjJTNGhLVFBEbCtIMWQyVmpVbnFtOFFyUzd3c0lLMUtIYmxhb3NVdVhQ?=
 =?utf-8?B?cUdpdm1QWG1lQ3FaazBLRzYrM0lKM3gweVpjYXBvVDN4NWdjQU9wWkpCWmdC?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UiP3Cf0aXLJSBRXytkNPdEA05uvlEVoi/bqcz5k6L8x+Z5kWDuG8/iORTg0MGK92uCAOGuNDCY8b4Ky/IiN5OtyUalPqv9NWMzqxBA7NPSNDyGeO8RmEyH9ceRvLUd5S0HMSJ15LmjFwRYOhSD6xngyNfRuaHjs/LUjdiG+1T9S2xYtib4oLqrP3MNAZICBVNLKs2J/eaiJ8XMzArmXTmcRDVPnx685W8dehchfSUp4Rs0Od2kbzwRQCVYEJUzh1y7dsE8ci4RqaWXa8tyHxhuwvde4AhayH5WG2BMjB0aOuGcOBPjgW9CUy8x2jL8Zl+VEziDwqciZpTnVcnyM+qSjgLgv+x2UaUq1W20hCiZqHQsW+vvpNBUNVUt2bpn2bZpJvGqQmin1xBJ6KN1WX4O+Tb5MFZ5b0boonI6FWP7o2nfB+rH39REI+ikFOEw7hirdEFOqwI7jkbAE8UAW9IzRTA4faQHcUxzoe3T//bziGSsdRj9R/I03JZ1jJDhm+F/4v+mEh2Cm9s/KWwJ27C0bV2MgakqlQlr9agUTlBAmIi91IQju7yDcYWMbRfMYYiD6T5q8DWpLt1KyqBc08OOGclxIyRDvnWyd+NkOk/j8XbzICf6mMrIgWUShPEelBT695IzI6060FBEEiZAf+7C1DtRvr9XHcpYktiCS1xnAh3WYhPeMlU1gT7uGBm24R+z1kTYSmiKxVKq8Pky64hA6G+JAUHkngIb6qn3l8gFz1ddlkWaWjiiBCd+pDyQCXnGwhnBnCUZusjFaz6h2v9tcuxg1U7jP/ZZQC+GCEotmdXxO6dwEXaah7FuJoOWw4YRbhQTUDtlJsplWNOpeYSF+cEBlWadO/9YRY+zwyH74=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e89fbb-e663-4e87-1786-08db2a1119c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:35:13.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+C8rGCh0+Bcq0UCVLACXGnSKhL/hkbZPZ0bcKKPjtlO8BKrJYRFZJxc/m+Ld8kKl6RJ2PzDEeYuSApFxOsmYMNFgS0oPc3bzjaz6aCsyOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6341

On 21/03/2023 11:47 am, Sergey Dyasli wrote:
> Add an option to xen-ucode tool to print the currently loaded ucode
> version and also print it during usage info.  Print CPU signature and
> processor flags as well.  The raw data comes from XENPF_get_cpu_version
> and XENPF_get_ucode_version platform ops.
>
> Example output:
>     Intel:
>     Current CPU signature is: 06-55-04 (raw 0x50654)
>     Current CPU microcode revision is: 0x2006e05
>     Current CPU processor flags are: 0x1

It's platform flags, not processor flags.  (And sadly, doesn't actually
capture all the platform specific data these days either...)

>
>     AMD:
>     Current CPU signature is: fam19h (raw 0xa00f11)
>     Current CPU microcode revision is: 0xa0011a8

This is unnecessarily verbose, and can fit into a single line.

CPU signature {XX-YY-ZZ / FamXXh} (raw X) {pf Y} revision Z.

> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> ---
>  tools/misc/xen-ucode.c | 66 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index ad32face2b..b9037ce6a1 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -12,6 +12,65 @@
>  #include <fcntl.h>
>  #include <xenctrl.h>
>  
> +static const char intel_id[] = "GenuineIntel";
> +static const char   amd_id[] = "AuthenticAMD";
> +
> +static void show_curr_cpu(FILE *f)
> +{
> +    int ret;
> +    xc_interface *xch;
> +    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
> +    struct xenpf_ucode_version ucode_ver = { .xen_cpuid = 0 };
> +    bool intel = false, amd = false;
> +
> +    xch = xc_interface_open(0, 0, 0);

NULL, NULL, 0

but xch wants to be a global and opened once, rather than in each piece
of sub-functionality.

> +    if ( xch == NULL )
> +        return;
> +
> +    ret = xc_get_cpu_version(xch, &cpu_ver);
> +    if ( ret )
> +        return;
> +
> +    ret = xc_get_ucode_version(xch, &ucode_ver);
> +    if ( ret )
> +        return;

All 3 of these want to complain, rather than exiting silently.

See test-tsx/test-resource as examples.  It's fine to use err(1,
"message") to terminate fairly cleanly, and it renders errno to the user
which is far more useful than printing nothing and exiting success.

> +
> +    if ( memcmp(cpu_ver.vendor_id, intel_id,
> +                sizeof(cpu_ver.vendor_id)) == 0 )
> +        intel = true;
> +    else if ( memcmp(cpu_ver.vendor_id, amd_id,
> +                     sizeof(cpu_ver.vendor_id)) == 0 )
> +        amd = true;

else some kind of error, again so we don't exit silently.

> +
> +    /*
> +     * Print signature in a form that allows to quickly identify which ucode
> +     * blob to load, e.g.:
> +     *
> +     *      Intel:   /lib/firmware/intel-ucode/06-55-04
> +     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin

I'm not sure if this is relevant any more, but for Fam < 0x15,
everything is combined in microcode_amd.bin

In some copious free time (but not this patch), it might be nice to
support `xen-ucode --auto` to try and pick the right firmware file out
of the filesystem.  One less thing for end users to get wrong.

> +     */
> +    if ( intel )
> +    {
> +        fprintf(f, "Current CPU signature is: %02x-%02x-%02x (raw %#x)\n",
> +                   cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
> +                   ucode_ver.cpu_signature);
> +    }
> +    else if ( amd )
> +    {
> +        fprintf(f, "Current CPU signature is: fam%xh (raw %#x)\n",
> +                   cpu_ver.family, ucode_ver.cpu_signature);
> +    }
> +
> +    if ( intel || amd )
> +        fprintf(f, "Current CPU microcode revision is: %#x\n",
> +                   ucode_ver.ucode_revision);

For the two raw fields, and the revision field, it's important to use 0x08x.

They're all exactly 32bit quantities, and both vendors encode data in
the higher bits, so visually it's very useful to know if you're looking
at the top of penultimate nibble.

~Andrew

