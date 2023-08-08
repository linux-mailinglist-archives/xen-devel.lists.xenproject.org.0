Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C67739B1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579600.907648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK8L-0000Id-VZ; Tue, 08 Aug 2023 10:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579600.907648; Tue, 08 Aug 2023 10:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTK8L-0000FT-Sc; Tue, 08 Aug 2023 10:40:13 +0000
Received: by outflank-mailman (input) for mailman id 579600;
 Tue, 08 Aug 2023 10:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTK8L-0000FN-0K
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:40:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e5b033-35d7-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 12:40:11 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 06:40:09 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 10:40:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:40:07 +0000
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
X-Inumbo-ID: f2e5b033-35d7-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691491211;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=adSk8xWebp+2j4PwG4Sb6nV0/iaLUvFNtEzrRMpbQS8=;
  b=VZ1rUPG+BNV5zFo9ymeg/UXQxZjiGmvdaZe2pqNzX5I+HTQXZ7RSp5Uo
   e/KF+fx7zIE7BO/1wcbu0sI3qjosIEpxplBsnpIF0FUOvbKehthoNOrGb
   9yTRSQJEGPkIzxhK9ER6HishDIEgcLMAEoreE/pJ4fyhZKi9cDc7fzuFN
   k=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 117516469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0S7z5qsVM2cLCjBC90x/+Rv1L+fnVHVfMUV32f8akzHdYApBsoF/q
 tZmKTvVMvyDNGL8eY13YYWx9xsF7ZfQzt82SgNo/iphQitA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+GyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOmgGYDC6ttON/K+1Ue9gqIczNPOwBdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4O9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThqaMz3gHNlwT/DjUfR2aLv8idqnK1BfZ/D
 mtMuXF0hKI9oRnDot7VGkfQTGS/lhwTQd1LCMUh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5Ys13hTGS485FLbv14KsXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94aRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:n2/HSqHusLkamEUNpLqE5ceALOsnbusQ8zAXPiFKOH9om6Oj/f
 xG8M536faWslYssRMb9+xoUZPoKRjhHPhOjbX5Vo3CYOCJggSVBbAnw6On/ibpHDf3/PNc06
 BpdsFFeb/NMWQ=
X-Talos-CUID: 9a23:KUsOLGBUI00cc1/6Ezs//0A0I/EUSUHAwmzWL2H7GX5TE4TAHA==
X-Talos-MUID: 9a23:R2cAxwYzt4cT+eBTvi3RtC9TEOdU6PqKKGUqydZd4eCOOnkl
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="117516469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtoyHqltReVXrilX14dnd3xGncsBhCDmem5pJtKYeWnhyCklpBlbpYRfMwJq4GMLMYbo+uUWi3KiAnAAX98oMaQUqUoqVhcIsZaNlNADiVNBZZBnpyyncH4I38ZXXGRwi8k4AjsRJG8uX/4YucGF92VTZbjpG/K6rJv2J0Kw1+Y/ry+7OZmeAED6yk7eCdZNDfCclCKiEnR/M1eQQpYDj3YKBTy+N+/U0lU5Bjvz5ZaXt8MlkT8JFXf8/+ef/KcG1FnsSZSQEN89GM3mLve672huxde+6U+/kEqkMVvTTFM9bUIixU51FGrXOJuu2BztAfTsR+BUIvCdWmjoOGVb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl16JPyCczFISBufob8qw6MsNZc5UvLU2ffFVK4T680=;
 b=WtHVnZ73ZTY87/nqvS/vD/x5zbe583u3NZ90q2Xs5oKapvGuuvjm5HlncQ5T+N3Y/W55YP5d7QM/V00U3OmSqgPhpbs0huzMaARqXPvClZDPW3zhO6eYlENo60VfWoOkpS95Afn1u5ha4MuTunxml6CtilrbnWIRFZr51PzrRrKcAnKwkPvIbfZL3GJ0UNhdqmTwwvawL2lzLRf+BdCxmIh3fRExaXt4SnclhBwWoEdvfesKsYqXKPWLKitMIo8cmBXGgfdNXYK0Csh93T01+8V2kvm4j6KDh8bsNGuLgSGDtg0Mdq9RtpEBxTKERDLmm7PLlYyQg9YaJBSIMPKxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl16JPyCczFISBufob8qw6MsNZc5UvLU2ffFVK4T680=;
 b=iXS61/XH7XubMQZN1q+xnpDPawa1j1RMHfXzrG0/IzCY1Cw/r05KINHvZVZ+lnUUzd8qNZ7HCo4TZR2ZAzKBjoL2UtiRq8ekkYto5tyILTTu1eLWxL7eS+E/OCFjiXZ2JP+jyfwcQdz6b9uoeOOmEmf4SgqhGBTvDgM9m7+UGVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a14dfa26-c8cd-debd-e069-74d4c11d228d@citrix.com>
Date: Tue, 8 Aug 2023 11:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] tools: add configure option for libfsimage
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-3-jgross@suse.com>
 <4679e0f5-f5ea-4182-887c-0fe65539f9c2@perard>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <4679e0f5-f5ea-4182-887c-0fe65539f9c2@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d30d788-831c-40bf-7cf6-08db97fbd515
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hf7jcj2M+UhIEuhFF6j1KEwqHCWle0CZ2mYPrK5qvljWINQCjSUd7m7tnPo6nOsY6wubAmh/2v7Mk7Vb8Ej2isEJYRT7HIgHwtgcPTBTJxh+AcRRWx47tzRJ5l9SyCynIaJaQXQbkw2dGsJvx8u2TILCTdpuayaslvLmgEIaqPL/VqkfkDUQozXsEo1KrsGdymNzUOY+dCRsb8CNLs3SYATdY/RjMBg8r7U2icLLeEqp+f/Kf7DK58pb4uUEHV9zM+qyJ/7UUYbb0QuFO7rzoUEWMmfMt2ubvcX6j+AZ/UMaIq/H70K/uLhgsQNnwh9p+pxFb1JUSpFQacpjRQ0SsxLLInAeAktHNpjW41nmMp0vpCHu77MxK46LP75a2xL8+t7GU/b/UBeimfuPef3dc6gLSgbZ4j5Rv1zNhoaKKlagjmu2wpvRRDSHry4iAUEb4qJ74SXpwYXP4i7v9/sERpo2lohsESWRQC3VY3ujW+LRQ/rCjk31tQs9SLoLK9r8mlzp3JwufkF0xvt3RiCMWhGi1H4f0Zdpaph2yCuGSeFBs+B1TYV8y7eK7cfHwBE1OEWrSyXmjwDs0SxR3dIiYejoZx7ju4pwT/6/7hiXEe5TchV7EwmCnlSBzl5AroRBp5mj4OhThLsmsvBv9TrUlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(1800799003)(186006)(2616005)(6512007)(36756003)(4326008)(316002)(38100700002)(6506007)(6666004)(86362001)(82960400001)(66946007)(6486002)(110136005)(66556008)(66476007)(31696002)(478600001)(53546011)(41300700001)(26005)(8936002)(8676002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhvSXJkNkFYem96ako1bFBqQ1dHY2RpNG82SHlmcDZxNEpZK0J4NWZPcVVD?=
 =?utf-8?B?RURHdTI2Wk16dnloY1JIQnJnS1RENlpkM2tQdzhaWGdkcENwNENUamtJRWxz?=
 =?utf-8?B?RlZBRnNZclFWWEtra0RoOUV6czA4L1g1U1RZY3R4dHBFQkxFS0M4NTN0Qmgx?=
 =?utf-8?B?SzdJTzUwWFo1V1psMkdOSjUzM1lreEdiSDg5ZnNaYWFlbVU2TG9UK2NCaWlU?=
 =?utf-8?B?V0t2K1dCZ3ZmSzR5SnFFSy9sL1lLUGdhRnhGWTN5dEVWQlpwQU45cTlmdWZY?=
 =?utf-8?B?WHNJaEI3bEpZY0VCUXRBUFNiakdJb2xHV3IvVHJHVDZGZXVaVll3cE5JSEV6?=
 =?utf-8?B?d2tBbktCWHBZbnQ3VnhzcDhWRWp4alY0S0RTY1pReWpXK0o5RTQ0bzBRTWR4?=
 =?utf-8?B?YWMrb0p0ZCtHeitKS2kvRTVuZWRSeWNjVTc0VThKZFE3QkJvQmtVeVhaenVr?=
 =?utf-8?B?U1JCa0FCQmpvY3lGeGE0bnl6dHBZS0lWZE5wYWc1dzFZUVcySHRpZ3RNRE55?=
 =?utf-8?B?NkpxeEVPWXQ2ekVKeXlkejlodnFxU2hlQ0FCQXVjYW1tdy9NTStEY1NkT2xC?=
 =?utf-8?B?emVvOWJURXhBb1hVbXpRT1Y5K1FZV1hoQ2JvNlBSTTkyTTFvSzVJNVhNVXg5?=
 =?utf-8?B?ekk4bnlNdmkyUEorc2FoOUNsY05JbTRKcmdKQ2lNa1J4R2dqOXNHaHJacUkw?=
 =?utf-8?B?STFmNE5LdHpwSDNSV1ZCeXNhKzIyMDRkYTBnQkFDRVF4dTBOUnNOdktGdnRm?=
 =?utf-8?B?dkYzYm4zb3RncWhUWThsbXZhTlJ6dWVqY0hyeUVOeC9PZERBOGpCMHdRSjUy?=
 =?utf-8?B?SHA5azNJR2R6aS9iZWtSd1VUaTc1WGJWck11YUVINEp4MHRUQVkya2RYUGZ5?=
 =?utf-8?B?ZGZFSXUwN1ZjWXRWSWhFODhIdnV6Ty8yOWJTUWdPRFlub1lCMXc3OUQ2ckN6?=
 =?utf-8?B?Vm9Gbnh3WWhZTmpSNWt2em1zdUZyUUhzZWFDRXc3Q1JPYnJBWGNkNFlvRGVY?=
 =?utf-8?B?MEhFQWVNaHBJWERtNTRDSGQrbE9laTZSc1J0UGRTY1ZBbEE4WHVVdWphMUla?=
 =?utf-8?B?ZFZlN1VXSWxkYk9jNXh4bElITENzMmJuTjg2a0wwbEVhcXR4OGRRYnQyZ3Fr?=
 =?utf-8?B?cXNCL2tLR2xZWUh6VUg4SnRjOWpkeGNJU0lzY3VtVGZKbWtjeTl0SjdOSDF6?=
 =?utf-8?B?WlJ5T09Jd2UzQzNXOXFiRlorRlEwNXdWclp1WWN4bERVWVhOaWxVemNuSTV6?=
 =?utf-8?B?eVZ1S0lFUWpvK2J1Q3g3YWFPaUhudGIzYktBdmtwbW50Q1UxSGxrNnU1Mzll?=
 =?utf-8?B?NGZqdklHclFJRmViQ1pnMlZmN2xNQzF5SjR4TndDRElkZjBZWDZmNS9manpK?=
 =?utf-8?B?a2hPSEdhYzhZNFFZc1RZY2M0UFZybHlIK01zK1UrbWZEdkk1a2RKSHhOZkZw?=
 =?utf-8?B?aHEvVHhvUG9nWWN6bHphZkE3UzUrSjlmVlo0TmVuY0ZmSzhmQ3VkUHkrTXRQ?=
 =?utf-8?B?YlM1bDFIVGptRjRJQ0ZUQWttcERjcWhNZkpWTHI5c3RrZmxZMkxKNjQyRXpq?=
 =?utf-8?B?US9YYW5OWFNlTTJOc2hRT2FlY3ZSMExkWnRtWjN6SXplMnFvRFI3cEtFNVpt?=
 =?utf-8?B?SlRSUTlyQWpncWNWNU5SZXVpc1gyTnVEQmRuYmNrSXJYK3p1VHZKeHczNm9O?=
 =?utf-8?B?WDBXbm9BUHRVTGRsRjI0REpBQStzbVFpZ2IwY2R3K245RHkzbFRFalVvTytq?=
 =?utf-8?B?QkxZNXAwNU5QVGNxaU9Jd25nYWVTaFpVSzNGc0ZVK3paZTdMcUVNUzdKbkFu?=
 =?utf-8?B?VCs2RjlNWk9GMW1NNkhmeVBrK0xFRy8wWGl0bmk2d2VZaysyUm1oeWl4WDNW?=
 =?utf-8?B?M1U4ZVZqSXl5ZC9BMDVCWU8ybUoyb1pqRkJIV3Q2dGtRRTZWcm9oU2gvNGgw?=
 =?utf-8?B?d1RBSU82c3BzcE1MNlcwYmlXb1l3TUtsY3lOaWlHSW1NRUtWY0JFUXNIalNF?=
 =?utf-8?B?UWRpa3dPMUtuR1VyWVk1WFVscDJ0VG5Xc1h3aTkvUTVkc1JKbEJrT0xHd0lB?=
 =?utf-8?B?V3F5cFExVlVaTFNLUGRvemlnZTNaRmV6WjRLZWlNblhqNHZHSUpZYUVZSUVk?=
 =?utf-8?B?MVh2ZzE2ZU9WZTNaeUpnRVNiWURwNE1kdzJ3YUEzOHI2UG1pODM3bEt1c3F5?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IDUtnp6JXmXsHaKDsxny8XV5tZVzFcw5WAPa+ohF+F9fU+aETGceSwbuVIgPordfoS2T4oCJn/tfOkp+Clu9pfQnPIemXAaR5Kec2LuZZLadMXmSFzXOhLk0JnSaEqlnskXcnBrq6QyNYSJ+yT1v7AHLJY6PF1p0sGYsaWbCcBs823jE6pTCKa2ba5fz8DJzJty3S3aGQP6tlW1e5KsvwSTe9+Hl++JGHv7DMEnxI2JJSF5FV2D9imoC6mhiQYeO3D4BpRQEu+RX97WUfBESIICf4cjn2LWryBi0EAutkpcTPk+yYLfN2g+t2I/3sPikX95ATpQ7YLzE+Su9SVFUk8FUJ9bbCqpVGg6wr+LWTQ8nr1aAaZTBP/hyfETxWUntm6VfU1G41qozY9zPyGkLvsxG73RSKikU1st6ou4vcapSYG9udE+DBB8JW7LpN5ojfsNoC7HAJLa69bRphF5K2ParNzeY8tjcflda8CeNoYr59j0s9Jt7ng2fA3DIcEIrjIuPN0EuW4zg0jayg1DDQeqhKr/PigOkf02+RtbhXQU3bRnIB4kApHlneiEmKM4NmypAVTVTwDqZEq1mmcwcmhAxgJnafdDYB/oi7SVvZH/9Gzio58JbsFBAPITiP50jQ2gOPTh9dObxeWj9RkB5D1gW1NodQ9aVqkesbxxnbvd3mjczGugAhNleP04hmI3J7GigpZto7k40LP9oIiV+ZE0m/JxUu+dcQOjZF7d4YIbuPMoXf3p7aQNZNbO+Tbbdc/mxLkjRe253dojbR8/yG7xpohVV5V6RLzBn+QlI9vg4ripPz4AnfGJiD4bXJUQ3
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d30d788-831c-40bf-7cf6-08db97fbd515
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:40:07.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OndqdJdCZayICaA7K0E63JWiOhx3+PTQdfllkz12Y69iHdR9mAay7Y8glsw3QIzDlLjzflIojt47mlkA+Xo8h7id9bFXwUWfEA38CcGM2mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048

On 08/08/2023 11:35 am, Anthony PERARD wrote:
> On Fri, Aug 04, 2023 at 08:00:00AM +0200, Juergen Gross wrote:
>> The only in-tree user of libfsimage is pygrub. Now that it is possible
>> to disable the build of pygrub, the same should be possible for
>> libfsimage.
>>
>> Add an option for controlling the build of libfsimage. The default is
>> on if pygrub is being built, and off if it isn't. Without pygrub the
>> build of libfsimage can be enabled via --enable-libfsimage.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> diff --git a/tools/configure.ac b/tools/configure.ac
>> index 9947bcefc6..aea24eb982 100644
>> --- a/tools/configure.ac
>> +++ b/tools/configure.ac
>> @@ -185,6 +185,19 @@ AS_IF([test "x$enable_rombios" = "xyes"], [
>>  ])
>>  AC_SUBST(rombios)
>>  
>> +AC_ARG_ENABLE([libfsimage],
>> +    AS_HELP_STRING([--enable-libfsimage],
>> +                   [Enable libfsimage, (DEFAULT is on if pygrub is enabled,
>> +                    otherwise off)]),,[
>> +    AS_IF([test "x$enable_pygrub" = "xno"], [
>> +        enable_libfsimage="no"
>> +    ], [
>> +        enable_libfsimage="yes"
>> +    ])
>> +])
>> +AS_IF([test "x$enable_libfsimage" = "xyes"], [libfsimage=y], [libfsimage=n])
>> +AC_SUBST(libfsimage)
>> +
> Should we issue an error if one does "--disable-libfsimage
> --enable-pygrub" ? Or just let the build of pygrub fails?

In such a case, it wouldn't be a build failure.  It would fail at
runtime with an ImportError.

~Andrew

