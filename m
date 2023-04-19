Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC06E8267
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 22:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523797.814198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE8Q-00006j-JF; Wed, 19 Apr 2023 20:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523797.814198; Wed, 19 Apr 2023 20:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppE8Q-0008W0-Fp; Wed, 19 Apr 2023 20:10:34 +0000
Received: by outflank-mailman (input) for mailman id 523797;
 Wed, 19 Apr 2023 20:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ppE8P-0008Vu-Bp
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 20:10:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae5d928-deee-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 22:10:30 +0200 (CEST)
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 16:10:27 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5797.namprd03.prod.outlook.com (2603:10b6:510:30::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 20:10:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 20:10:26 +0000
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
X-Inumbo-ID: 3ae5d928-deee-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681935030;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Pk64iZcYGJmdTnk/DsC7aNC27xnIgMKl1KzYdE7kF5Y=;
  b=AUXzTA/dAbJWkMjiZgHEmewUAhHCcVCVIqNV/XtBG65tJJjaWiHMIiRK
   IkpcC3DoiD43cWZZbwuZtFT07h8hAnZUxjEAMCmiOO87obTjG9Klz9MMJ
   aaHcZh/YJ9B5wNViyir8y9iWlcKcmJM98blwYImrvQP61y5sBRMp9X89N
   E=;
X-IronPort-RemoteIP: 104.47.66.43
X-IronPort-MID: 106565352
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ncEH96hcbgQ+JDWDPzA7dN6yX161QhEKZh0ujC45NGQN5FlHY01je
 htvUD+BaK6NZWqned1xOYrloUhX6JOHz9JqGgtlqyswQSIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AaPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfcGkLNUu7i9uog6OjGu9nqst6HfDkadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOPlqKMx3Qf7Kmo7CRo7cUCmpfWCpmmXRdlcD
 kgt3ix3hP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5YQs1BTGS485FLbv1oGuXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:1htQbaAHy3GjG4XlHemo55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrNEKhSqafk3j38C2nf24dmpM
 BdmnFFeb/N5I5B/KPH3DU=
X-Talos-CUID: 9a23:477fDmAISQxNaQH6Ey4/rUhPQfgpS2Oe3W+AJUSUBj9YcbLAHA==
X-Talos-MUID: 9a23:j6MhowTjn7hCwmMnRXTtgxxGL9ps75+CL2kTmpYjv/CgM3VZbmI=
X-IronPort-AV: E=Sophos;i="5.99,210,1677560400"; 
   d="scan'208";a="106565352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR6qkiG8M7tFq6ZhZSuu//czQvXqlm/BffIaYiGw+2ciAHucj8lMaR7kVF4kXxXqB3vdIKxBSPyQP4r4/3ktS5dFr3fQ5k54cTJzGyiAs8+zdJuaZUuBEaxFt+BtC6fVsNLVnLj7SYG83U6gpVCsGe415mvUns9s37KWR714badd38cvfxALaFdC66o/XOe4Pwo9R8mPwDtZ2F5cCdf1cd7fHU/XVVnRx5hhIIGMoTDOec6kTzjOug3CfJWjE5pKJ/2ee4MWw8pLFLyz+mwEVU7P1Bo0uhBeESdV0LOBD0SUxQ83WAgaIhZMZXzFUbIuEvKGH+PvHxbdCZjAA/Lkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvW8nhshFmywhubnDrkF86hWHYWnj8nZfNpbs2AdZ9Q=;
 b=jaU/5ylxPYt7SbMxetsIIKmdkubTKAbPwbE1NtYuUVGy4rj6pICXkMiAMgRqpUHY/rBEL1RaPo1b8+LmPbcqDkdi/v8lwI4EbFZ1fh0vYBt2kp/jiBzMEqEZxI9sN4zmQovjxzMpxSrB+0lnvm+jY5x4kozsUKim8/jmmYr0pDrXCao5GaMXjiVo+0SDOZVj47zL/ZvTlPtuhIZOm6hp/rWrA6eqLUa1O+KxFGupC2RY0exrpicVFEKSmIhmURBjb77ohixx94IgyQ1gD3EoETtEtYhQkMLccXpRgCStJZnegzsbgH1DijaF8SRBKFyvkt4s1qgrbYRLmBprWU64mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvW8nhshFmywhubnDrkF86hWHYWnj8nZfNpbs2AdZ9Q=;
 b=QUdg3Z0WDiT2aLiDVaBuhKG5285fb8cxblmQBcE6Th6IdTUQ4PxPzkk/MKOLbYurESBk/j3YYEejOXAhX18q+zVtpXuCJ/Y0ywXGv3WA3TyMA9I7LTzdcqLzCqI4omzrCCoonD8xowizF3u9D4zEgnnYaFzZ1kYyMN4EQzHgNd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6315912-7d1f-bad4-71d0-355d361ccbc1@citrix.com>
Date: Wed, 19 Apr 2023 21:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/PV: restrict guest-induced WBINVD (or alike) to
 cache writeback
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <0e60520c-d660-1a83-3f57-3466a0ad617b@suse.com>
In-Reply-To: <0e60520c-d660-1a83-3f57-3466a0ad617b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0287.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 58afb9ff-4c79-49bb-8560-08db41121d4a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMiI5IU93pmmdQ/9f2faTO+tvFd+nP41cz3pTJWSd0zKQpdEtMQZY26NZ6iYZIUZkXeSXoGBJEAfpi8ztfDw+3fX1AbchkW+8UskdHPm6qXA4lda/kHWtJN/WVkyrdtRvQEtO+43s/hM12YVOPtYQnzezGTfvj5dTPRXyuxW+IzkZm0pu7ltoNt+xY7LZk4iR0VzEcTJrkcSn+dJLB+c6e1LcDlZZzh7m4i5TCX5weJogK0ICgc5+M6FC3fCLG4naC6NtZs9m0XrSAOfG4WQzf5nchSO54YuiYD3Gu7Lb6zAAGUnz4I/B2ZnUQesjrMt7Uaiqe0ji50pnK2UYuHt5pe2ztTDXpp8SIWmhO2vLasjnMwyCSZF4xKhU26/mkFmhKsi8RlgGr2xSs8Q4eF3fUfKiIAiENuMiKhVgDqU8MI+raTTqZnzQ3d+ugweXqFD0kzQA1apII458SiwtCznx/gi7wpRSreMJl0IrbVeiqGrFDZQQAwFRrKQxLkvNl3wwIw2FtqJipBKdJi27FDIS2xmXUPmj0moy3NYhl2rEoG2Kk1vkAuPNLK9SXoflI5jshx8DfsRWrnmTWfaSfFGkLDVIA/cRbaBDaMVtJ60MvTVCV1Tva4nDq4sbKPw4uh/pWxnxMYuI4LuJp23wOqedQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199021)(186003)(6506007)(53546011)(6512007)(26005)(6486002)(6666004)(2616005)(107886003)(5660300002)(41300700001)(4326008)(2906002)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(110136005)(54906003)(82960400001)(478600001)(38100700002)(86362001)(31696002)(36756003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjI1Y1NJVXNMa1NSY2txdzU1aTNpOVdxLzgzTE1WdG1Ha2s5NWFkMHAySDJS?=
 =?utf-8?B?cCtDVEQ4WnBIQkpRM0NCbWFWaGZXN21hOTBvaTRUcGJJRWVKOWlYc2p6bXQx?=
 =?utf-8?B?RkdVV0w4c0kxRkFmZnppMlUwaWNGM1duNTlUTWxnQzZmWk9tdEE0ZFcvTlBC?=
 =?utf-8?B?OFE0RDFIZE85MlJwWkY5Y2tMQmdySU15M3h3SEVIYmxEV3dhN2dvRnhkem5h?=
 =?utf-8?B?TkNDMGZ3Rjk3MzlNNmtyNDhGV2tKUkRpQlVGa2M5dXIxUjNSN0Qyc1RKSktJ?=
 =?utf-8?B?NHA2UDF2WXFJempubk42OEdWV25CaC93VDlXYVF2WThlZXZyRG1VekJueWhM?=
 =?utf-8?B?UFNVYzFta0dTajFheUxaTVUvOTNKMTVYZDJnVmU4ZnZzencxZzl1ZnRIUGts?=
 =?utf-8?B?ZVIwMXZPYS90aDJnU3BmV2RWRjFzM21JMTJaZGN1NUtmaUUxUkpzTEE3cmR2?=
 =?utf-8?B?ZWY3dlZhOUFVMFpWYS9nWGt4WEpIWkhWSEJxSHR4blY2MCtBRzVIR3BEQ1Bu?=
 =?utf-8?B?TTU0S1lQTDZnb3A5Qk9KUlhaRzd4cmQvYnZLOEtCaUFjUktWR0NPM05lUm54?=
 =?utf-8?B?T1htQnU0MFc2dlZTNXplVFFPWW1Oc0lMWkl0OHROSnR0SUlmNUREQzZBcHBa?=
 =?utf-8?B?ZUFCbjBrVGEvQjQ3UUxWTHlieE9tQStxNFNtYVJMeEtZR2tEajNEM0tsNno4?=
 =?utf-8?B?NlY2cTJmNFlLbmRkQlhCT0g0ci9jWlpEc2daa2lxcm5Zdk1IZnhKRjVicFc5?=
 =?utf-8?B?dStlMXdPMExTMG5pMXNBQmRBRGZpeWs1WDhNbWQ5WFFYMzRDdERwNzNibzln?=
 =?utf-8?B?K2NGS0tVeUNTMUNIOXNpZ25hUElVc0hlWkZWZHVQSjRwNEt4YXN4c2dnL2h1?=
 =?utf-8?B?bEpmbmFKd2NVc1EyMmxidG1zd2ErWWpVZTQwMnpSZFY4VUtEanNrOVNUdGQ2?=
 =?utf-8?B?N202QVM1T3U5RHIrQWowbm4yd1NyK1ozSEdFMzBDQkk1OEF6cmlYUkFuNk9V?=
 =?utf-8?B?cEpwNWZEeVhETElESWRBMjZMZDF6clVNdmsvYitMOEdVNk92U0xpSDBXYmRX?=
 =?utf-8?B?OFF3WlNNcXloSnNQOFJabjZVZlBDbHNDWlVFQ0lUK21kZ1ZBSHloV3Rialpj?=
 =?utf-8?B?WGl0NVZiZEdkR1d1UTVDL3NHRm5hTDMwc09mOUhYWjJ4SWpkbjl2b1J4aXRT?=
 =?utf-8?B?U1o1SkRXcm1MVGJGRU96N29GbnMyR0VCdUhZRXByajkrNG1OcElrZzR3ZlY2?=
 =?utf-8?B?bnpqc0c5NEtick1wWk90SFRhQjRUWXd1OWsvempHWEZoOFZ2VDZkT0pROC9v?=
 =?utf-8?B?OGx0OG83Si9oK0VBQ3NQQmU0VXRlN3Y1NkpaY1hyY3E0L0NndzB5L21tOWxC?=
 =?utf-8?B?YXBhVFpxNkowaXBETmRFSng5SWJnR2JZaWgxdFp4K1lYcHlJM2xuNUR6c2JG?=
 =?utf-8?B?a0d5akxxTE1SL3pDTHJ2OWZHbEVhOHdXOTFhQXJFSExvbTNoN3h5VTV2VzRP?=
 =?utf-8?B?ckZaMWFSUndyNGp0N05xSytueVVnaVU5RmdFVk9yZGswV0p1ZzZvODNsck5Q?=
 =?utf-8?B?NTgwek5VaEg0cWlkSEpZWWVJSTUyVExNbHdIYUpEUGF1TzNBNzUvWXJDeWow?=
 =?utf-8?B?UVpIa0w1VTZGUkpwWEhsNjRiYmV2SXhUWjZQY0daOW1KWDk0WnJMNHEzbUVi?=
 =?utf-8?B?ckVORVloaTkrc2VQdm45eXh4VHJiSzB4aEIzQWtIbVFWeG12WDNBbjV0bVUy?=
 =?utf-8?B?RC85eVhFYS9aZEd3SmVqWFptNGNoOUFwTW1pTDl2UzA3RDVCOThLVElKNktH?=
 =?utf-8?B?dVRKSzVqOWY2SU5JS0M4M1dxYm9ZdmxjR3VqWS9aQnQ1TkE1SVlyOWdnaHVy?=
 =?utf-8?B?WjZhWHJIcm9keUJ1VUdTOHl0bnBFNlBPV2ZNU1JsNXZtRkUvdEpzclc5OUh4?=
 =?utf-8?B?LzlWQ0hlK0pma2FwOFVIak54bmpwanQrWVFsSEhiZmF2bGljTFR1RTc5Vzho?=
 =?utf-8?B?ei96YkpjV0NzR1VQSTVaVVU0dm9Za1A4eGZERWdZelg5cEMwcFprQldHbTlY?=
 =?utf-8?B?MDA1QktzN1lHYW04NEdFKzFIcWJEOVVjcUgzVG83UkJKdEd4cHQ5ajB1TElU?=
 =?utf-8?B?WnRWMEpBeE1lc053VGJJL0JrM2h5ZFdHUExSeEw1Ym5SVDRCWHN4SEN3eXQ0?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qviV5KK7qa0WAi81QE9Ul1mOynFGWcq7bsKPR8lrjQ17OuRYklSkk1RKzP0FoyzhvwJGbyv439m7sWXWROkDv10R1B47eyWHHns+O9XZiL3HF8PBV0ApsRe6wjDg4BRUaaXKM2iajIfRe1Adr5drUS7+UBx9165Q7JqVUPwr2620QMhwG0E38PRjsRe7q8u73dJGVqYcMxPe+PyyeoZtk/9X+N47EuB4mbeG7V2xkbGlEWZgyN4FlqQt/xlOfwFqKM/3UdgkDtM1oGj9zleHbArEqkcdUqn8O/hkltr68q9JlHYk0LVmbDUFlil+kj23L1GA0Y/PSPCS0qssv4RYsIfX6gs7QB7zkfDN8MWMO+hG3Qyrrvc+nKmKhu7KNR3VhA2W/8ekyb+6q44zbTKYWU5PlJXVmtHw+Dx/BVi7QX8QpmlZRjV/Q2cf5s+YeWP0k7OH0PZVlkjX2xBmJsI2BDM1yA/jWhTZhGVktx55DTD1jOHE/akt7VVskJbXoNj3j91Kx4ilFUJNVAuDs5dT/zIOBWgtWW8YNfOWXedKLeIJVpYvHDwcESgkpH2YBnaT7hHerEsblyXdUhcNTWfkF4rVNLFPDgsTJgQIqh8hnFOGkw9CtchPAG4HRZraO6yJOyEX42KvM8fszSPndVuTawOp9om6TSuuVOByu1Q9fSit8A8n5scM7js0bit1ZWZmJDhp27Oty0MQrJ8AjO8cef2FUA01Y2S/kwLZ9fNo3v53R71HfxfC/NdCIkar/0k/LSdpNrVsAbsgOjNw2x0AMCkRIs14zWQQB0Fmbg7Qgi05LGV9L9x3G5rvpkvHTTFX
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58afb9ff-4c79-49bb-8560-08db41121d4a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:10:26.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MO03/mjy6stGcJZklwYL/Z15+3p2l1TuojQtJ2v9l6DSwriKNZGMmR1rb1sWSUy3lXtL90bAOzibXIb8wrGe2M7D0LyBKDdb43A7/LdsScI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5797

On 19/04/2023 11:45 am, Jan Beulich wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3772,7 +3772,7 @@ long do_mmuext_op(
>              else if ( unlikely(!cache_flush_permitted(currd)) )
>                  rc = -EACCES;
>              else
> -                wbinvd();
> +                wbnoinvd();
>              break;

It occurs to me that this is fundamentally broken.

The guest is not in any position to know (or control) whether it gets
rescheduled elsewhere between now and it logically continuing execution.

So if there is actually any cache maintenance to do, it can't be a
WB{...} of any form on just this CPU alone.

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
>  /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>  XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
>  XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
> -XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
> +XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*A  WBNOINVD instruction */

Given that PV guests do have several real hypercalls for doing this, I'm
not particularly inclined to let them do it via an emulated path,
however easy it might be at a technical level.

I doubt anything good can come from it.

~Andrew

