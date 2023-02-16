Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E4F699A7C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 17:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496668.767531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShSn-0005gh-K0; Thu, 16 Feb 2023 16:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496668.767531; Thu, 16 Feb 2023 16:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pShSn-0005eT-H0; Thu, 16 Feb 2023 16:50:29 +0000
Received: by outflank-mailman (input) for mailman id 496668;
 Thu, 16 Feb 2023 16:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pShSl-0005eN-L0
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 16:50:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e72962-ae1a-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 17:50:25 +0100 (CET)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 11:50:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS0PR03MB7180.namprd03.prod.outlook.com (2603:10b6:8:123::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 16:50:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 16:50:16 +0000
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
X-Inumbo-ID: 01e72962-ae1a-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676566225;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e2ObegPTjHSCG5jLL4a43ZZAs1J2Xuh1rhwpTevabnY=;
  b=cgcXVsIF+sii/TCq9BZe4QE3FQp78vrF2c1hHeVOo72gp0aqcSWMmFV4
   543rWXLkV2iTUjDGMRtsDk/bireRRN7mwXL24Ic94U+rrpsuunHDVtnLB
   mTX6ZnK2UxG1KtBxlpwMz660Xa6phaQtU+ragMgCEejLEZ2jB6E4wbQm7
   k=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 96181204
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8yaseqPWQnHRPvHvrR2YlsFynXyQoLVcMsEvi/4bfWQNrUon0DEFy
 DEZWjzXPPeCN2LzeN8ka9zj9E1Q6pHczdMwHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u1eAmVF6
 LsGFBciXgu7gcGnmJW/TdA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eew3qrAdhKSNVU8NZPrAe5wGlPVic3UGmwnenjjE2QZMxmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaESoaN2gZfgcfUBAIpdLkpekOYgnnS99iFOu5i4PzEDSpm
 jSS9nFh3vMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswqByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:xMTP+q5dFMbBoSXXJwPXwVWBI+orL9Y04lQ7vn2ZFiYlF/Bwxv
 re/sjziyWE6wr5AEtQ6Oxo/ZPwNE80hqQFkbX5XI3CYOCCggCVxe5ZnPbfKlHbakvDH6tmpN
 ldmstFeZDN5DpB/LrHCWCDer5LrbfmgcTY4tsy100DcegpUdAe0+4QMHfbLqQcfng/OXNNLu
 vn2iMxnUvaRZ14VLXDOlA1G8LEqtH3ipSjRRIdHRYo5Cmi5AnYp4LSIlyz2BoTbi1I+Kwl+2
 TeiQD1j5/T/c1T/iWsl1M7oq4m3ucIBbN4dYaxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbU715uEFFvYnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzY5B+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3NAiFXtuYck99R/Bmdoa+a
 hVfZrhDc9tAAunhqXizzRSKN/FZAVEIv7JeDlPy52oO/4/pgE786JS/r1top46zuNLd3Gfj9
 60d5iApIs+DPP+JZgNdtvpYfHHTlAlEii8d1571zzcZeo604Wkke++3Fxy3pDyRHUh9upHpK
 j8
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="96181204"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQet9aJlIWz93tWfFNS4We/GuizQdK6yZRLeC3QoYTs6fLOdgSNZjcmRVKzNfIvkLlw5Md+xZmdcZp1tkA2VUt8LkcDU7w2Fo3k44cEutiHFyLpLAR8YPapsNP014n2CcfgYDkv7L0WnV8hf4ox0oCvndKWa8/Kqdg7tjX3xe7BAkVKVqUQUTVLlJc55D3nZHEg85iv0hE1vGYuVzRPHVfkF1fCd4TRGrdKVImMqS/8//UGVR7T7p5dsoe61FxpeCKa6YFNs3ZIlB+LiAYfDKbW6vOZNwSihLjf6r7jam3OTOCSveC0F0PngiIru8xp4sJYAzRZVVGahOqAVFQhyuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6Rgp5WB5Ov+0lj1fuYZcthuAm5izW7/bTYaO1OAFVg=;
 b=kFxvCxekYYzNrWRW+qKjcQ2oqaBQS3TvLHntly71q0mykqeuN6i+msyvLxZvI4+Z5soK7huKzJIcxLnvA7/nv6tAgyUsENIO7kTizGqlp5LzqwFlJq2DEteOqgta4ORC6lss/h7DODc1xlx1xDx72xXbQlSDqMXrHMt/XeISO6rmve2A9m4LwHqPbNDsG/VTOQMCq5J7xbd+d6EfmjcCkqD1Mn4s1pT4TKqDh1ZkQ8d73jCE26Oxe9IEJGjVduqDGfgxjWcAuD+dT7VorGC/JdrQD/QEXQp8gIalKUweoxZb1KkjqwJEcE4Z5b7DrU6C9TDuuZZYwK57ucGDUUVeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6Rgp5WB5Ov+0lj1fuYZcthuAm5izW7/bTYaO1OAFVg=;
 b=gixr8up93EArZz2TFUDK516qMDHtpw3oB6dNPDTqMFqRg90Yh9CQ8wz0ybpWQ+e7iA23Dy8HiMh7v3OK9qwHDYIFNqCdFVjwfgmTvvQK24JJ919/7dJki6TodTqtNZsM4EaNZeI8gpgvd+ebW8oL77tAULF07Z5ZDHGm1z0+Bds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa7e1420-b7a3-23f5-e0a4-99bc8905cd91@citrix.com>
Date: Thu, 16 Feb 2023 16:50:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] libs: Fix unstable libs build on FreeBSD,
 auto-generate version-script
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20230216141007.21827-1-anthony.perard@citrix.com>
In-Reply-To: <20230216141007.21827-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS0PR03MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: d738c525-5158-4c54-385b-08db103de126
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UVUqdN5l7kPVjgGBcMplg8q+eeQoK6HqXD/ptzoWc1YZ0A43IhvNACSrnKGQuOVKUS9591Tfeyllll0rClZ9sytSigVFH+G12C8HtiZPLcDYR4jiWtb96hde0jJgifJ93HQ/VRj0++u2dwF9ERi0Tm7OauyY1nEeTPlWqn30E4TcZ50Yc9lfHS+0lOFSbiJfCKDJ30iXSEidUarcuxd42Z03FSs8ZFS7me8B+4T8oI6q8XElHERPuBSYjKyowXI6k91oSsWK5asskMSL3hXBvQfs74XRgb5rFpqrUmGnKWWWhJpzhnot7UI/G/SpEfVfYDcKx/1u2Hf4qR2F/afA2WpTb6yp7iik+d4aanZibipBqIIRZd67kPJHrZN7YnDifmUHqTZwBFwtjAfE4wfPlNtzZ4Ju1bLqQshUcucyGoRv/XyPAw0aW+nrzq2L1Q3qOEbMBxPx3fmLfbeFM2/N2EtLOz3UD9ol2d/BlMXhRcQ3gMZwEt3wZV3tgw6CJ9BVQGtEICaE9D0b2azd9pQSu8XcfYGmvgWMywjtI2upFVrGvzaJAGd12RkhXtyYAhFp37DFocJC+Sx8XpkNsVITfGwY59egYswJwZconzhblYaPsnrrwwWJvpnAJVO9yBkjMteJqegSOSqJhMLOcAYOsX4b4gBCRwhdvaWMhEMvIR73pEuB3L8LTa1aTHlDypTbQbrIy6NGdVfjEYAlVE+CQjv/IbtrjR9sy8q9J4Pb9Zk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199018)(31686004)(2616005)(38100700002)(82960400001)(36756003)(4744005)(2906002)(6666004)(186003)(6512007)(31696002)(86362001)(26005)(53546011)(6506007)(478600001)(6486002)(8936002)(5660300002)(41300700001)(4326008)(66476007)(66556008)(54906003)(316002)(8676002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHAwdTQ2YWxvMzhZTnlKN043UHFjMmZaMTIwWnJ2OTl4SS9jMXprV2EvU3RJ?=
 =?utf-8?B?MFcvOU5QaXhCWE4xU2JKQ2VzRE11V1cxYndUb21qTDUvV2NvZ2NlUDFDWVFF?=
 =?utf-8?B?U3lIQUJxUWdMcmZsa25NaUovVGVzVHRUWnlqbkJPakExc3daN1pMYkd1Nmla?=
 =?utf-8?B?ZHdpemFML2dhaCsrQ3IvR1BOMHZ3WCthVWZaTE5KSnoyUmw4N0lqU1hoUEw2?=
 =?utf-8?B?OUFzK0RrK1Y5NTZ3RUUvSGNpVktTRjdndC9TY0RxK2ZHaGlqdENsQkVEMDhC?=
 =?utf-8?B?Sm4vejJmdHRMYm9zdnFaVVRqMDN3Uld1RlFJUmV3RW05L2lLREI1R0duTU03?=
 =?utf-8?B?eWsycU9oVDNWaC9nWkdSOUJKQzU4NGVweThPdHdyYjdvaDh4TCtEUWM5V01h?=
 =?utf-8?B?ZFhiaE9EejNjMS9zTnJ2K25JaGJQNWd1bmRDY1pFdjJ1RVhDeEZNQytKYlBz?=
 =?utf-8?B?b3NqWWRpYzdsYnFPMDgzbkh2RmFLU2RpODVmTGdLODI4b05QS0VWaVc0SnBT?=
 =?utf-8?B?Z0ZGbTRsRTF1eU4rSmdRVVNoM2dWdkdDRWdpRjlyYmJEWm56c2h6NmdsQi9I?=
 =?utf-8?B?ZUVJTUdaL2kyeXJOVDBxNWxhNVhhOWp5ZmNtZ1JFT1RtRDhXcGJNYmlkUGxn?=
 =?utf-8?B?M0puYnJwZVNYQkpPMVVOWUNZbE9EKzUwQkxwZkY4Sk83KzVIOU9nenBoSHBO?=
 =?utf-8?B?ZjRtbURwU01mcEM4eStZaEszQkxzVlN4V0NyNjhCdUVNUnJjSGxXVkJ2QU5u?=
 =?utf-8?B?QyttTlpueWMvWDB0NjU5TmpXR3dQZGdob1UxNUxYOW1tRTEwUldtdEtibk5n?=
 =?utf-8?B?RXdKRVBvMFFtSjhZSHRLaFdmcjdSZ1FhOTlZWTBGaXMwOHNXSmxDMG1RS2cw?=
 =?utf-8?B?TmtienFOS2tMZVlCc0hmOWJDNDlkR2wxSFpyYmpSdm5PdmZJUEhHR090RmJF?=
 =?utf-8?B?aVUzdWpYbGpTZlJsMjBMOG5LTEMxaGN6elpjNk1xOVJEak4vOGdtekdiQVpU?=
 =?utf-8?B?QVkvTG9KMmF1VE9rNWtacFJtalQ2RFlheDRGUDRLaG1rK2swdjE4Sm9BN0Fm?=
 =?utf-8?B?K05nZHZGU1hxYVV0cnhSUHNRQTdYZXJ3cSt0dTV1T3J5dDlYV1ZNZXNHZXFW?=
 =?utf-8?B?OGtHM0ZmNFZBMXhVUm5MNldmN2RYR2Q4NTFIUVU5R0owNGRjbloxejNqakxj?=
 =?utf-8?B?QWZMeXNiS2lxUVF1Zi9qcDBHcm1YUE51V2hPTWQ1S0hCVm5RaDd3aERaV0xn?=
 =?utf-8?B?c0k2NXhZRmU4SWtQSFdjcGtBK0N4YXBKWStnaEFRMkRVSHM1NzROY3VsQnI0?=
 =?utf-8?B?OTJnSmV3N0FuN3dFMW1SZHVKY2QvTHQxZHhOdzlBOUt5WTlwVTZlajkxQ2NV?=
 =?utf-8?B?dVZ0V29IZ09mQ2JUQTZ2S2pCT1BOL2FTaVJPU2p1dHhxMDNHRGc5VXZDa1du?=
 =?utf-8?B?cGtsYk5QQzFLMXNic2lTREt2MUpFeVJReEFmb0ZXak9FYnpWL3JwR29BQ2ho?=
 =?utf-8?B?S1hhZlNOc0lPOGFjL0RvcE02cFZrc2w3ZmVuY25qRzhlUm1ENnkwR3k0VWJn?=
 =?utf-8?B?MjFDK0h5cFZaQlRZVmJBWFdTRUFrdms3aFJwaGtuTzhlc0J5NE5HeDZUVVBU?=
 =?utf-8?B?UzY5WEcwenFuSk0zWGd5cndic00wTHNvNFkyckFaUXVOTUJWTHBXVGRWV3kv?=
 =?utf-8?B?Q0xkMXhWOWE2NWM0dGNDTndsakhSaVVhaWljc3UwWXpQS0ZGZDhBQ1JMb1Fu?=
 =?utf-8?B?cENueS92U201MTZoUVNudmhydkJiRFp2cjNRdG4zUjk0Z2pCanVMUFlHMUVy?=
 =?utf-8?B?ejA4MlEvcW4raEY3TTNVTXlLRFBPKzR1cHRNemtDa2hDUVoxUG92dDFjSkNG?=
 =?utf-8?B?ck1NUm9qN216UnhZTC9xZXY4cHU5MkNiblR2TWpKLzRUay9CTVFuT25sV2F6?=
 =?utf-8?B?clVCUVVkWVlteTdoNy9Zc0NFaVp4aER2NlVmRTRvL2syTFB0Sk5Wa2dZSmRN?=
 =?utf-8?B?QlIvMXdxNnhNTnQ2UUF5WloxNGUwSXM5YXJEbnpNL2VLTjNHRnFWekJURVU5?=
 =?utf-8?B?aUdkN3RUWklwZWF3ZmZQN2tGK0tsdkZ0QUFTb0FMdTlYbU51dVVPSGVWaXVP?=
 =?utf-8?B?VS9NWk1nc1EyUFJodHlXZXdOV3V4bE9QbWRsYmhxcGh3UHF0NmZhYkdaUXEr?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QXdIGRFwtHOJQizlhmgUJt+lINOk+U0oIC+LSRfYDffI7yJNTbu5AorUYxiYe7nhK78SSgCk4VXJgLD0LfNDY/Wt7OXymVwHnrxDElVc7lwgQqJBxNzcYCpxHR+1WpAiZ3Z/mT/Uw0duWkdfqezmeT9LyHEknoXYkWjdk7r650DrrfFMsd2BWMfbVNZYogb9xtJHc7SrIyvCEjgJBiVS7kUj2bw4421tKbQmD7Ig4fVEOFiF/RNSI4qhX34/piTB0lJf54+3JLhMcWzL4DiNLltY+7E8QY2YAF8+z5aGCTusnyhNSYajXEtPIoQBiJXmJMmpsNUEfHw5GhZNoRrzQ462OQNtnIXa1wCm64vklwsuHYnqJ07KEbttd2DbQPlcST2Stt/B+8y7e7LFkwLvM+mB7YfUqMD3g468Cfs9eaoFxh2GevNZQL04lE0lGJuA1zF53m/1lnulqv9zkRLLfxJU+37RjM8jZaZWyEWTZqdukRRkMhs/9X0IdWH5oAmxItyH7yp2AkQa2ZgShgfK8ZMqS/yq4Dsj2jQY8XMMUPGslMsk53WuKO/gHnR/mfae93x3Q/J11wP8hpiQcZ9YKbq03/vinI0HnUkmVxTR7+XpCipgmAv0rY99Ri9QTXAelcN5dIDMf9bHfrU+Zv8G+hDEyPf99jUQzVS1RufQ0hzCv8k5J6Z3H8HVhvD46Z4yh7p/0RjCJGUvI0KxnC0ngl5elQwGda9zuQVC6+IWZY7Z12x4QwwZAWej4+J9w9qoPD22sHup1eWJ3Tv1PLphTbcNpXY90DWMlZaVJOVBPaqLNsHT7+4FUTFf8HDihHhY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d738c525-5158-4c54-385b-08db103de126
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 16:50:16.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNfMvML3tgsvSVyZBj/Ag2ZDs2Q5EV4pP7JXeD8xG++nPoVgbzsh7n6ipdRNcQUTLJ2d35JNR7DaG2tT8XpQG1QKv1Y45bm3HxzolXbOb9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7180

On 16/02/2023 2:10 pm, Anthony PERARD wrote:
> diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
> index 0e4b5e0bd0..ffb6c9f064 100644
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -120,7 +127,7 @@ TAGS:
>  clean::
>  	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
>  	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
> -	rm -f headers.chk headers.lst
> +	rm -f headers.chk headers.lst lib*.map.tmp .*.tmp

Doesn't *.tmp cover lib*.map.tmp ?

Also the subject still needs a FreeBSD->LLVM fix.

Both can be fixed on commit.

~Andrew

