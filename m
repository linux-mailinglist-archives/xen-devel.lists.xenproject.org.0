Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B1C6C7021
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 19:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514040.795950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPW6-0001q1-S1; Thu, 23 Mar 2023 18:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514040.795950; Thu, 23 Mar 2023 18:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfPW6-0001nN-PK; Thu, 23 Mar 2023 18:18:26 +0000
Received: by outflank-mailman (input) for mailman id 514040;
 Thu, 23 Mar 2023 18:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfPW5-0001nH-1V
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 18:18:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 163f4b7d-c9a7-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 19:18:21 +0100 (CET)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 14:18:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6197.namprd03.prod.outlook.com (2603:10b6:208:30b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 18:18:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 18:18:14 +0000
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
X-Inumbo-ID: 163f4b7d-c9a7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679595501;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ysjcs+aajFsTJB0dgwv+l2GdamCAHnoAtrmrwzue3q8=;
  b=gveGwloJeccvXS+N95ykZ+n6incTdUxxWemJHBe+I5BkwL77HCy3f+aQ
   UbA5lsPdKlO6YKp3BE6dBx9t/ADIVzJf13FchKg6qO+nvDuf2qLLS0TT/
   5EJRDnOMbiYBlDgKRl56FRpQGuMBoyxQharKxCl/YXhaevAYzFosNYZoJ
   s=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 101982431
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:r1Vuga3YbfG30vFM0/bD5eNwkn2cJEfYwER7XKvMYLTBsI5bp2ACy
 zNMW2/UMvuNN2akL41watni8xgBuJfSydBiSVFlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBlFfp
 KURLw02MzOFhOKqyamhFLlUv5F2RCXrFNt3VnBI6xj8VK5jZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6KlFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjAdNCTuHjr5aGhnWz/XY9CEEsWWKHrPTg1HWkQupBd
 mE9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BXMDYAcUQA1D5MPsyLzflTrKR9dnVauq1Nv8HGiox
 yjQ9XBnwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:NRB1navgsG/bWFg8nLqbq8KA7skDR9V00zEX/kB9WHVpm5qj5q
 WTdZUgpGTJYVMqMhwdcL+7Sc69qB/nhOdICOoqXItKPjOW3FdARbsKheDfKlvbak7DH8FmpM
 VdmsNFebvN5DZB/L7HCcqDfOrIAuPqzEllv4njJr5WLT1XVw==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="101982431"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQ5uxY38e7uHyUZie1n3Ca0s9XRjYM+IdPWrGzB32TaQkYHKz9ubm3rUCSMeaLxiqXVoA71AxFxEisF8LNdP0weYZu7Ms4RptFxeUF6gDmL3OVrGUcNbieqcpvs3GfblUV0Dig4lmd7mszzYG1pbb4M3nbKbWHtwC58qavWCsc8FCdcXoGcfKraaUqdItS/+/ELSeCxU55TCbIDnbxYXHx8+6+o6CQkECVWoLyV6Ux26ncLYvSacVALeGqIh61PGNJqwF91ue9gqj9R2cE58msyjoVxRucuOiK+2nhSi5pQHNBxANaZfp4q8f555KmFmfXhTtAD0bpKH36bOiGKLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sR1Kug5lHjFi9rtZ5Os0lRIE8TCgVsa0STkg9RB8TeQ=;
 b=PlrLG4lTrrMDpRZ1ucaiLTFGj7nCjHCABsFYF/jcdgsSqY9XeQvBxUVrLt2fORzWRBRWE/EA18HC2uXz0NnneOXc77bsJn1GMADhZx0loz//cJ0r0u9r41N2JFNeuWpizEvkzrIi1i7bfBOBL0bBUkH8QAh1n2ZcLAxfw8o6lxSPJ1WVAUv21gLqMT4R/hkrhjiAR+TYaUMeSgc3EtYF1LK+arvoUKrxEtTbpbHi0Vp9NMzik+daEl9H/WLxDr3nQyguFPdtTJAPPhBp/O04SPCatAvyFp9Zh+6KNlT7q/7mBnGRthVMSuehA028y+4vwvYVLXNVqgkmvS5pbkNczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR1Kug5lHjFi9rtZ5Os0lRIE8TCgVsa0STkg9RB8TeQ=;
 b=QdrLx4z0qchl/n5gz8dofCj7DzGXYvj57KSp3z1qUQWiGInbgmPx3jsBOQz1JyMoLFDuy0yPOdX8RMdqrw93szEuj5JmDMIGpRv4CSdAsVyaAiWDI5ZOHmJctmYyO0LxJ8GQiRKbmYlaAJHWnaQPiIzMefZZdSprg7Zbcqur8rs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <97c3fe74-89f3-fd26-f8bf-69113df1dc12@citrix.com>
Date: Thu, 23 Mar 2023 18:18:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 11/16] x86/shadow: drop is_hvm_...() where easily possible
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
In-Reply-To: <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: be663c7e-ce5a-4db5-19e1-08db2bcaf7c2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x50W43JN8WkuOlyFTXoRu1r0q1uaoyGuRPw9Alv9Mxm0ECgMkkYTqGfi7l/VvwSoVUKzvMZoSMm3cPVewigBrSCKhfc07Q2c2xFxavHZPtzs1bH8leNosF/m58wDi67D5/kbGYJFdWNIJrVyCFPd7I5mE7oi5Vcu6VC8UiQ0pI6EpFjr09H+K2hvfagPnd0Jho9hIKWtm6dFmy/b21gHWSgi4z986/jNdAb8CAdOhGdMA1TY4uzqp0+VoK15FhMGvxCoQDLGabLRSHBMVljdnXU8mC4ODneFqceVerK5uvV5acRF8LpGrktRIoQeblH3X4BGL2lsOzga9yv5GKbevzuZtBsy8JNd0jkSlIA7vMZG9svA6csc9qf3UC/9gTDVmDXHBUL56Uc80MMYeLuwKM5oBpo2kW59P0ZSrjh63CSCEZ7dCYiOkZA1SrIkBRqz0N6gAfSDgO04pRM/xUK1eBANQWTb6tHcnB3IDGnoGtsGugA31bhYBMCWeczdTV3QW5T64OjgaKaY51LBJdTMec11kLmd02NjD9mTXLpDCuxDJkW8adBQJYE6+8lFFlpQ0+ydlPJ/h7PdBottMutcNRaDbRS0borgEgjPbe+S7IKOTEICGrrucA1qc9pF7w4ykIwl2gEb9lnm2x2t6FuSKfkjeYIFWd78097QRYmUKIhFIIL1pz5hd0tmfGxAd4Yrpu3HU5eNND2Q17sR3UsGxT8wMsdGf3R1E1ls6pgUIaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199018)(2906002)(5660300002)(8936002)(82960400001)(41300700001)(36756003)(86362001)(31696002)(38100700002)(6486002)(6666004)(478600001)(110136005)(83380400001)(2616005)(186003)(26005)(53546011)(6512007)(6506007)(31686004)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czBkMHI3TnYwdXV4Umhxa3lkN2Q0aEdhSzBDNmRvZTl4WWo0OHIwMzZ6S0Ju?=
 =?utf-8?B?bjdtbE4xTC9sanRRalFneENKUG5BUUp4VE81QkZkWTlZNFJZbC9HSkw2azVF?=
 =?utf-8?B?eU1rOTlmOHNIMWFTcTNJc0o5clBnbjhsVjNtbm9sOEZwdXppQm1SSUFIMjNQ?=
 =?utf-8?B?SVJST2dmYldpZUZDWlBRbEtBZkFRUXE4S20vWElYZE9rOHIzT2J6S1NwMDNH?=
 =?utf-8?B?S2pjN0poRlUzeGsxc3psUGFXTEpOTjNjUy9sWlRnZ3cvdm1sTXNveUZLaktT?=
 =?utf-8?B?dUVBSGNsZmJnWjM2aDVCYUF2bG5ITFBUZTcyWWFGZ2Y1bElSc3ZEQ3NaeGxu?=
 =?utf-8?B?blVBRDJzSmI5ejUzcVFNSlpkWjJQVjBVOVdwcEFqSHlRQnUvVnl1d2dIdnov?=
 =?utf-8?B?ZjlFU2p0ZU5nYllad1lSMGticVNOWGtGT25hQjNJRm5EWUY0c2FIci9CdzV6?=
 =?utf-8?B?RG1CR29WSXA5ZE42YmFkUkI3a3FJN2Q1U0dONVBnRW1zcGUzQTEraHB2di9P?=
 =?utf-8?B?U2dpYXE3dWZIWHA5Z09henpKdXR5K2UzdFVpSTF4MFkrLzZSVUtkSG1Nemg3?=
 =?utf-8?B?SjBwME5HaUE3eSt3clRmbGd5MFJkVXA0NU4rNU1VVTdUdXdCbGw0SHM4WmpN?=
 =?utf-8?B?RDdkSGgybE8wdlNkLzM2aEx3bmpzMjI0YXFUWHI3Ui9uYU14RTBwMGR6eWht?=
 =?utf-8?B?TzN0UUN5RUxjYXpkZ29tb2FIUXEvZlBIZjErOEZaSmlPaVJSbUMxY3Vaemsz?=
 =?utf-8?B?ZHZETStMR1VlR0xiNUpUTzN6aVlFZDM0aUNySVMrVG1LVUlqYkkxM1hxOUlI?=
 =?utf-8?B?bm1IK09rSkwrNHFIZWJhajBOSlVtcXBxeU5rMlUxRldxbXVwdTlvZzExWjhm?=
 =?utf-8?B?b0FPUEFLNURWM3lBV1JOVHZVY0drMGg0MTlYOGQwMktQYjVXeTMxK2FHeVM1?=
 =?utf-8?B?OVJJWU50VDB1YVowLzBjcDh5QmZ0Y2J4U1BPVUxZSUVsS05pUGZQR3V2ZGFD?=
 =?utf-8?B?L1NKSTA1aUtxV0oyamxzTlh1UEtUYng1VDZNOWtPRmNnV2RzMm9zNXdKNjFG?=
 =?utf-8?B?bDZoLzV6ZVBIU2FEVUpEbnFGNmxLbmxnMHFEYzBKcTcyOU9CQk45MUFrTWxU?=
 =?utf-8?B?a2I1VWsxR2JCNnRCWXFPUzNaM05qNW03YlZOUGYrTit0eUtTamJua2NOMDFC?=
 =?utf-8?B?MnNEdTJUdDUreldPRlVqMXdwRmRXeVlqaTJ5blYvNEJKdUdWQVZTNHJYVDli?=
 =?utf-8?B?UHN6UWh0RDFsOVpGQk1VR3ZudHVBTUlFdzVmYThWYnBSUkYvT3RLM0xxdHhj?=
 =?utf-8?B?QnBKdGh1OGRBMUNCdmRzNEVXTDJvcUxCajgyOXpGYUFLZGd2SVVBb1dzZnVz?=
 =?utf-8?B?N3VRM1dSQjA3ekNmcGRzcXBIZ2ZtUUw4SXd3VVR2VE1GVFVNYzJrVDVzOXBy?=
 =?utf-8?B?SGRuQXgyYjU5VWs1bTQ2eVV5QUV5dnFkQTQyUSs2SDVXbEpCK3ZHME1vYUZM?=
 =?utf-8?B?TVAxQjB5YmkvK3dLcHRMT0dlM1JINHNtYmdweDZObit6b05jT3pLOGpJQWds?=
 =?utf-8?B?NkdhelBVQkRLekxnMzlZRlNMbjFYMFk4ZDZYTEtoQTZuR3RzMmpJUXd0U1BN?=
 =?utf-8?B?M0tCMkd2ZDdFelovd3RZZXFOOHlVekJSNm5VY2N3OWwwejlaaWFWWlFncmVm?=
 =?utf-8?B?aTVYWEVSYllTSm5tNmRNNmNPd2QrNG1MOXBqKzc2Rk52ZUFJejVYT2hZVzhx?=
 =?utf-8?B?Ny95UWNVbkNpNVhXSDNUOWtESUtUcVJWeHBFeG1UMkpXc0xkdFNnd3hHWGh4?=
 =?utf-8?B?eGk2ODh5cHdad0NIeFBPZkMzTER2VFRZTEUyazRwcFFETGZZcFpZREZYK1RH?=
 =?utf-8?B?cmxXU2dqS1ZpNkw3ZDFSM1JJZzdFS0hObjcwdEY4YjZUcDk2aGh0OVR4c0gx?=
 =?utf-8?B?UlRPSEtzaFR0S2pyR0N0cnFrU21MUlV2Mis2Zlh5Z0R1RWd6NVlVK2pXRWZN?=
 =?utf-8?B?dUQ1TGFUZWpTY29kekpES3B5L003dXZjbXpLaFptRFJ2ZEpMa3VlVFpYSStl?=
 =?utf-8?B?Z3NLS29WOVB5eUplM0ZLR04zeWUyTzFldFNvT2FLR3pnWDR1amRJemFkWlFW?=
 =?utf-8?B?S0ZRSCtmYzB6bjJ2UHkyQ3E2dlJrdGdFWnBuOGMwaWp0M29UbXZlQUsvbEpt?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BATsXDtQ1LblsCyzBd720OUs+lO7B0vONM+3qo7u46V5m8mnGaSpSgxm3qpJFiPLR6UYDKWexv/eZOJueQZTKQiBEzKrmSpYG+HujgBthbHxJ8XXJv2388kHef6dGV/THWVe52rs86Lk5xYs0NOEqIwDHq7X0lzDPddvFfwHO2De+MecfJICcWoC5vHguxfqC2xIEUPwSNTZ1XjQDcVmiSw+VaywfUQ0Ag1jW6MPpwoWz0roKdWtE2EkF1q4oZN4RqwUlaDxW8PHrVN7AIgmN5R3giFDBw7fguIkoRcz2eX/X8gfMxq3T4N7eaerAW5BpCAzehAZQfETVQw+4Q+xqyyqBgMhyLBhkO2wfJTfHdSNIOtCl3uhtqOshw/rq8O6PpByMXtd0r0RvfSBPIlnwHPgxsxpXTYrrZ9rKJL6hPGBjh/IWaCJdDBG5ftKKL2CCZYofm6R2CHcLYPY/8S5lNkfxgYWyUN7kR4sbmdA8zNuJEw4hLI8Ul0qouf44A8OliP6paYKd27vhDYNW7BH6JrOYeR+iE88Md983Dk5kCM5ExKVMAI28gl19reHeZIgNrJ2ERyPH8bgsR1dlze1hL8UJhCVJeho5dvSNxq2/uDISiK0maVJygBXPvnX18X8VP0WAlTBYLr1lfibbekfRZZ6ACOrCmpoU3v65g9Z3P50kNqdxbEKX/x2h52PVc5pIUc86/ohH4JbI9pxxxl2c5YijmljTlbGIZ88sXIsNypFvM+HVYx+sd8w1t0RLS+XoW+whEJFEniJGlEZlngGfZ2jfHsrLlalKAkeePPeQROWr8wkrlPMRNWa2t0uLcqy
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be663c7e-ce5a-4db5-19e1-08db2bcaf7c2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 18:18:14.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cExmyRc+ooAo3FpOkwHukeRD5R8saoJwEolTAtviCPi0c/G7PjVx9/YGWGLgDXmrtHFfQFnW6ixGn/kklhRxUxzPwmy5F+8UCtQpHgi3/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6197

On 22/03/2023 9:35 am, Jan Beulich wrote:
> Emulation related functions are involved in HVM handling only, and in
> some cases they even invoke such checks after having already done things
> which are valid for HVM domains only. OOS active also implies HVM. In
> sh_remove_all_mappings() one of the two checks is redundant with an
> earlier paging_mode_external() one (the other, however, needs to stay).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm/shadow/common.c
> +++ b/xen/arch/x86/mm/shadow/common.c
> @@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
>                 && (page->count_info & PGC_count_mask) <= 3
>                 && ((page->u.inuse.type_info & PGT_count_mask)
>                     == (is_special_page(page) ||
> -                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
> +                       is_ioreq_server_page(d, page)))) )
>              printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
>                     " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
>                     mfn_x(gmfn), gfn_x(gfn),

Out of context here needs an equivalent adjustment.

But in this case, I'm not sure the commit message covers the relevant
details.  ioreq servers have been made fully common since this code was
written, and *that* is a better reason for dropping the predicates IMO
than the redundancy with paging_mode_external().

That said...  I'm not sure the logic here is correct any more.  It used
to be the case that ioreq pages were in the p2m, but they're outside of
the p2m these days, so don't see how there can be any interaction with
unexpected refcounts any more.

I suspect that one way or another, this change wants to be in a separate
patch.

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -3441,7 +3441,7 @@ int sh_rm_write_access_from_sl1p(struct
>  
>  #ifdef CONFIG_HVM
>      /* Remember if we've been told that this process is being torn down */
> -    if ( curr->domain == d && is_hvm_domain(d) )
> +    if ( curr->domain == d )
>          curr->arch.paging.shadow.pagetable_dying
>              = mfn_to_page(gmfn)->pagetable_dying;
>  #endif

This one is dangerous.

After tracing, I can see that sh_rm_write_access_from_sl1p() is only
called from OOS functions, but this function itself does its very best
to look like it has mixed PV + HVM usage, and dropping this conditional
means that pagetable_dying can, in principle at least, become non-NULL
for a PV guest.

I think this function needs to be made far more obviously HVM-only first.

> --- a/xen/arch/x86/mm/shadow/oos.c
> +++ b/xen/arch/x86/mm/shadow/oos.c
> @@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
>      if ( pg->shadow_flags &
>           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
>           || sh_page_has_multiple_shadows(pg)
> -         || !is_hvm_vcpu(v)
>           || !v->domain->arch.paging.shadow.oos_active )

This is reachable for PV guests as far as I can see.  What am I missing ?

The changes in hvm.c are all fine, and for those alone, consider it R-by
if you end up splitting the patch.

~Andrew

