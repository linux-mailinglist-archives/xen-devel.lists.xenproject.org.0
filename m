Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FA7A2288B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 06:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879378.1289589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdN5Y-0000ea-9k; Thu, 30 Jan 2025 05:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879378.1289589; Thu, 30 Jan 2025 05:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdN5Y-0000d3-6s; Thu, 30 Jan 2025 05:27:40 +0000
Received: by outflank-mailman (input) for mailman id 879378;
 Thu, 30 Jan 2025 05:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J50r=UW=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1tdN5W-0000cx-I0
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 05:27:38 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8596f09-deca-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 06:27:35 +0100 (CET)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U27Gfk017331;
 Thu, 30 Jan 2025 05:27:30 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g0bw0kfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 05:27:29 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50U52fLb036973; Thu, 30 Jan 2025 05:27:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpdamsew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2025 05:27:29 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com (2603:10b6:510:200::11)
 by CH0PR10MB4875.namprd10.prod.outlook.com (2603:10b6:610:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 05:27:26 +0000
Received: from PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54]) by PH7PR10MB6505.namprd10.prod.outlook.com
 ([fe80::83d9:1bf1:52cf:df54%6]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:27:26 +0000
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
X-Inumbo-ID: e8596f09-deca-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=B48FXnNjVoTmGaIivTnb6qANYjJR4exf89gkaEt+BJ4=; b=
	dvAiJuebzKIqjn36D0bnrPOZsIYr4Rhbf5HUOi44OfGsqzJKizjWNloPufsZmCPS
	9PHSb3zU8+7+JkBnfjlMn3BpPXsevzL1OBH9qLgTK+ns0W8YyxczbaxS+/ZwbWWV
	XVBcRac7p1znqtVDG+F6ONRYSoJqTgfjEKnsqj+4vlP4uUSGXRR3t93ZUqBi8BMI
	cm86VsDX8f55SfJd2VTERbQ9qhs6diouTFHUMXnmgkMvlkahhTyf3E28XmFnYDOW
	UExUFImwGbJstdBe2wPFElGugZVRpmuY7QwYVix8FN39FhKqHSYTDZb1dHJGRxsJ
	a+e1P+Dw92ZS++GUQgkgJQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0KWyX1B6JXWLh87aNHd7aIlITdAITFndN6hqZUNZqyYEBH0AetIVEYz1bB7BYcQ9uipHtehldANIyRaQpl55Lkf2MkYh1pcCgIcwQgJSpEcCH5ey6q2y1AuwwaPPG3xbpDldGMiruss72VLM6v3XEtywpqmt5dLr76xfpvKIoyrQp/pS3pwA1OuTT7oh4l37TVhr1IJX7mKpSmBWnr1g/Uz1DmWTPV9ifcrHJdosuWcv7NXeGnX/abFPOjm+nQyO6fBOnqEXKFO+Sf4emopNvaYFWABKD4n3lzqO9xWm9Gw2njweIKQpNiXqfUuBjHI1PLPy6WBYK9kvaEerEHXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B48FXnNjVoTmGaIivTnb6qANYjJR4exf89gkaEt+BJ4=;
 b=AugLG9B4ZU6jn+xwJi7OuoM6l7F0vtKSTIJJxtrpOAEeJZy0v1WlOFQk2YaYz516pVLDsEajc+8ZZBLor+YxaQfheDEmAYpCUYpeppLg5yhUMzHYjVf7q3jA9PdCLqnt/v37ekR9SUCTSO4blmmsE12H3RVqVo9pE16eChzK0NIqnr7uZ9VCTMHg97NWbttlFvd87ftJjAspEMrCQVi8143moSZuJeqi6ymyfHw/zK3lwJjBt/up6jiBJoqk5oKOkbV+SNSgE/emDgTBUlhJWPuDFSmbnzcDWu1ECwop5mXwcPQzIPr0VPICr9LuQEDsXnpWspa7DulWRDGM0q9bLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B48FXnNjVoTmGaIivTnb6qANYjJR4exf89gkaEt+BJ4=;
 b=OZA+VIxi6IG5HtjnUdfDDM5N57yvDgD07P+pNe144ruZbH1XPPwDJAhgro52eUI1n3fBO2mvajEM/bw/abFAxdQIgOCnHBWajmjUxz5/HrDzQlNRBKgaqlu8zhAeRN5cB0J/jpGRkSsc9AY5GQGfxAO6rcn+RFjRQTAXajr+7RE=
Message-ID: <827aceff-28ed-4922-b841-b7dd06c082b1@oracle.com>
Date: Thu, 30 Jan 2025 10:57:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Stefano Stabellini <sstabellini@kernel.org>,
        =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Konrad Wilk
 <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
 <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
 <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com>
 <alpine.DEB.2.22.394.2501291401290.11632@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2501291401290.11632@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PH7PR10MB6505.namprd10.prod.outlook.com
 (2603:10b6:510:200::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6505:EE_|CH0PR10MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 73553d1a-e7b6-4162-d9bc-08dd40eec7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmhrRUNjMklBbU53TnVtVU1ZY2JhY2hjVFNLYytHWjZJQVFCaVh0aks4UmZJ?=
 =?utf-8?B?cGcyY3NVYWZJVXBvZldFQkdpUVJGOVdYWmh6UmRnM1FOTUFrNUt4d3JvS3NI?=
 =?utf-8?B?Mm9Xa2VES25IQkVkK0NOUHBteDVNa1ZpWEgwSjBJTW9KQzd5RDRpcnphVlQ2?=
 =?utf-8?B?Nkl2czlqbVpFKzA5c09mMndFaHRjNERLUVhuL0lWdDFzaXVkQ1VIK0RaLzJC?=
 =?utf-8?B?MloyakNVeWNnb1ZYRjdkOEkxUkRFYUx0L0MvWk9sZmVjZVhMbzJ5a09ITmRO?=
 =?utf-8?B?SU01TXBEZUVXbXVNVENlRjdIQVVjaXRmR0VudWdGZ0JpVkRkbzcvNlIyS0Yx?=
 =?utf-8?B?dWx6UVIxNnlxellkVUc5RjI0TUhTM24wbnFXbTZsa000amUweXRVbjZaUm41?=
 =?utf-8?B?UGZaN3oxTDdJcU1raW05RVBCR2Fock1NNG1xS20zS1RLQlQ1ZGFUQjc1K1ZO?=
 =?utf-8?B?a3h6QVAyKzRid3B5UDdxaW1CaHcxaUZHL014am9ucmMxUU9lRzJRcUhEMDd0?=
 =?utf-8?B?V1lIVFFoVWRYRFltM0ZYUTJFMU1lR1pJZHdiMTY4M2Y0R3g5dTY2NXdzQTZ4?=
 =?utf-8?B?VTF2VG5zcHAvTFk0TlN6UndKbTJSdjllalUvZlpzUzRtWk5mQkpXQndHeUEx?=
 =?utf-8?B?K0ZkSENhMXp1YmRNV2FXRGpGTGgyZVFZWWNmRDVsUkhxVFE5ZW51Y040U2xZ?=
 =?utf-8?B?TnVKemVXdUQ3eDI3RWZOY0c5VlhwaDl2c1NnK2lQZ2dxN2RTbEJqcEZMYm5Z?=
 =?utf-8?B?dDJQdVhpQ25KVnFsaHdXVzNkVUpDQ2pHYW9PYWF1MVpQL3NHM0dPWFJXTGVz?=
 =?utf-8?B?T3lrYkoxN3VORmF2VHJ3SVMyTHY0MjlEb0ZJdnpCVWV3czI0MEtpRDR4dlpJ?=
 =?utf-8?B?aXIvaXJ3RGlkMnVDdVI5bE15RUZJWnRBZE9hMWszRkwrcy9OVENvZ0JoMHhV?=
 =?utf-8?B?SkROKzZETFNWTkZZTFgwcUdXbXNKTEJkTWgvMjl4WTNObXBsbnRuMXNqaWZk?=
 =?utf-8?B?RjMyNGVYQ1ZuaHJxMnRTbUZmSUU1NC9tMTg4b0NUOG4yejBDQUpmSTYyQzY0?=
 =?utf-8?B?OGkwZUlHcE5qT1F4bzlvWm1mdVlKajR6OVJ1WFNKbWxJdk9tdkczb0E4Z3lq?=
 =?utf-8?B?dEkrRS9ubW1ObjNPejA3NFRJd0Y4NFRNbXR3ellJNm1NazFORGtFUVUzdnhM?=
 =?utf-8?B?WEpLOUJSKytTZmI2UitZcVZCd3ZxMmVxUzFEQ3FUNDBkUUYxb1FXa3p4WmNP?=
 =?utf-8?B?a1JMNEw5aUk1RGFtWThZUUR2cXVNV3MzU3g3UkNDOG9OTDdyd0xqR3V5MXlB?=
 =?utf-8?B?VFJRZlgxNVBpZWxZQThOZyt0V0tTUWJ5TU9acEFRL2Q4SWx5a01JbXpBaWhI?=
 =?utf-8?B?bWpvb2IrY2NCVGpXTGVJa1cxbmU0T3VuTGJ6MFZuN1I3ZmQ1U1ZFa3hUTG1N?=
 =?utf-8?B?NHNQSDZURnpLdkhNY2l1Q3ZzTGdHWktuOExxMVhUdEU2T1MreS9tbWdPWjN2?=
 =?utf-8?B?WnRNVCtqaHpMZlNRNXRqbDJDRE5uR2hHTWtiREw2T2praDRoU3JBNVlWY2VV?=
 =?utf-8?B?ZEdubW9IMTV0TVRYTHVURGVQTzBTZXVqVzBWa0NXVjFBV0o0dk5VNDg2Wmt0?=
 =?utf-8?B?U3hvL0dwcmlMVXJKdnhrZVRwSlpWMm1ubERBT3hSODk0NFRQVXpOK05BZGpP?=
 =?utf-8?B?Zkxlc1VqakIyL3NWVXV6Q204NTgyYXJVVHd1MnRQYUkzci9xN2FEdHRJb242?=
 =?utf-8?B?bWJqLytyZkpuTVJiUGNFOXNSVHVwakxQaE42WUcyVWprYjdUVGE2SWp0WUVz?=
 =?utf-8?B?VXI1MzlyMGhqS212R3grQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6505.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUxza0Z4eDlFaUtpck90aUxmbEN1VGtia1owSkNEWDdRbW9lTytjcmJaQk1J?=
 =?utf-8?B?YTBpcVVKK2pTRGhzREZjcUNDMGFET1lFTnV0dXUreVFaUW1oczVTRFZidmxo?=
 =?utf-8?B?cXp0SkhyM3l6S3ZsLzRJTDhOMDM3cEtBaktyRGdxQTZhRnZnSlExcWFud0JR?=
 =?utf-8?B?Y2hqM3YxMjM5WlEzMmM3Wm9kcGlsSTBjU2FXNTdIWlFDdmlVekdoY1RGVzBq?=
 =?utf-8?B?bFIrNzFjYzlqdGk5L0tzc29UaStQeE9EM1dYU0tYcUFnaG5vaFJzSFVZa0Rm?=
 =?utf-8?B?a0JvQ1YvVGNTR2RsN1dzMGVPQWNMNUtvcXdjMGhnTjBXL1oySEJoQmNzVURE?=
 =?utf-8?B?bm56Qy9yQTl4empIQ0dqSHB0ajQvRnpSNFR1cWkwZHc2djF5YUsyWVo0NmR2?=
 =?utf-8?B?QmFTZEdwdzJ6YWxpdGtoWXA5S3VGNk5BRG1FL01nNzdTZ3ZHL2JHNnNnQWhl?=
 =?utf-8?B?dUdtTVhmQXE1TFJKNU9GYmtibEVaQmhOQUVDZ3lmcEZHKzZWTUxMRUFuSVZB?=
 =?utf-8?B?RjM5NUkwQVVmY1gvYTY5M0ExbUpmUk1yUXdyc0t4dkI3bVhnQktYS0xXbGJN?=
 =?utf-8?B?T3BGZVE0TVhobXFJWjVqNXZOMkFwMkNsK0dvbndWTmpVYjJ3Z1NpMUNjOWZU?=
 =?utf-8?B?NGRsdTBWckNHUXRodzZGL2RRQU80SnBmemRqYXNqTENpTVZUbWJldVFUZ1BW?=
 =?utf-8?B?WXkvK3U2eW01cXFtTDR1b0NpL0JQUkVMdEczV2RzV2p5anNjQ250bXZ2QzNz?=
 =?utf-8?B?dHZCNXRkWldjcjZ1RzNRRFVMNWJnczY4dXZMVkRYcU9RMlZQbytpNEZCazg3?=
 =?utf-8?B?UC9IeThQeFJuRHNlUEZXc1cvaXhpV2ZTQVgxMlRWTWZmWmRLSFhGM0xWeVJO?=
 =?utf-8?B?OTdySWZSRktLVXBCaDY0WFdqL2FLUDJwaWhNUVl6b0d3aXFwb2pTLzJuRVI5?=
 =?utf-8?B?Q0JlcjZQbDdrRXNrSGJkSm52Q0RXY2VEQ3MzaGtRRDVsSUN3aW1kOCt2ZElG?=
 =?utf-8?B?MnNiK1RkUUJmWURQTnVRY3R0MjBocExEcnFJa0YzN3RFMWRlWkRhcWVTK2U5?=
 =?utf-8?B?akVqTlpCVzNrY2RwZGNVWXZSQk44ZjJwMklsZ05YNnFwcTc0cUx3UEVwbzFE?=
 =?utf-8?B?NndUaEVxbnlBNmVFOWZKQmxzZWI4ckdiVUF0cy81VktLUE5KRG9uSFBaWkNa?=
 =?utf-8?B?Uk5xc0FndG1qWWtPNW9EaEFWOXJNeEd2UktaV2FvQUhXY1hOWGhIbjVXTFZm?=
 =?utf-8?B?ajdkQjlIS2F0RHFyRWxDWS9aK01HTHRsUlVud2NuS0Z0aUNnY2x3aDA2L3Zx?=
 =?utf-8?B?OXc3Z1d3Z2o5VDVYbVVUZnEzMHpvRElZa2svZWdadS9qUzkxbzd2Wm1JTzJ1?=
 =?utf-8?B?bnVTRWV2aWZDVklTK3Z5Vjk3dVJMdUZ4QWtYNkRCMnBGTmUxMURRTXRTdW12?=
 =?utf-8?B?dUpobWlzVmdNT0RjNll3SGlzR3pTdGVSVVZQWmVYeUJQMEw1YWxkdWN2NHd3?=
 =?utf-8?B?VnA0QmRSSVhjTEd3clNITVN6ak9UVUR1L3E5YXROV1VUZ2t5aTdwY3U1Rjkr?=
 =?utf-8?B?U1JsUGxkbWJha1lkeUJ0U0NHbVhRR0RDV1F5N0ZRc0FsUDd4a1IwRkwwTmdF?=
 =?utf-8?B?QmFSOFhyS2ZUZk4ycnM5d2J3UUYrdnBUWlhRejdaaGc2SElKZmFCaTN5WitZ?=
 =?utf-8?B?T01TMTNiZmczQ2pUdThrUUpiUHNPbktiKzd3U2hjaytJZ3BISE1CVUZSQU52?=
 =?utf-8?B?WDhzcmFGS2lSM1ZsMGQvSm1lUmNoYlY2b1VMeStZZnhIVkhnOTVwVUI1Wk9P?=
 =?utf-8?B?MnNBcGRHU0hYTWlaYXJldTk5d0NocmNXVEZFeTlKY0tJMGxqWUtSTlVQa0k3?=
 =?utf-8?B?SGQzVWhwa1IrMTJXcHNiVE1nQUNUMTRFa2FuUU9GZS9TSjU1Q3h3TlNuc3FF?=
 =?utf-8?B?REc2clVNQWpXTFlUUVMzZy9QcStEdFNZZjNqNmVQREYxWENzeTc3S1NTLzlN?=
 =?utf-8?B?R0c5UllvTW5FZ3lacHFwQjI1WnRsNzhYWjJmZWRMeVlqb3cySDB1R0hJZFJI?=
 =?utf-8?B?S0grZTVKeG5sZlNaL3lKRXJTTXVoQWYvMVVnL3lRSnp3ZjQvWFJ6ak9OR3F4?=
 =?utf-8?B?RHdCckpHRFYyLzFRUlpmNUN5VEVleDEyUmxOeFJmM2FnT1RqUGl0NVRxaHho?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6XMqzzSXbTigILxQi8dUJTs+2wd3BQMx51RlkYaPPoazKYGT6sosXdw/J1ZFnuA3+9kmDLYsWi0+ni8rc9RMu/va+JbwBtG2EFSKVZpp6zvgdm1kVZLluXNLQr9xX/8UecBzop64c15gofn2KK0n8/8ojKpuMBOUP9ttgOGtXfbEsa1YVinUAYGZoCdDkITNKTQC3kwRBW+Nn9FHF9UM0duBIlfqWqamVYw1GOHJRJC/MkSOgSbdsj23ig/v5vknYtef7Po0LFDJb/hGsWjvl/NGTaPJkO5nLkKjFigx4oMdkoSzQiLWuDqFyh1iZC0U7AlawlGbfdOU12u4kJKHQI0Onm7x5l8lj8ZeA3OJhUEWJNP+9TewvtjE4oqQ+7Kqw0vtRZUvJNV/GXRMwdsayqNxvhn3kovbq9t32qpaCVT32ffOoYvZMS0Jjb0G5n7/FPOY9Sh/0cLWCyTH7b3lU4m/MLsPdLx302ZMuig1VWPgdyxoVhO0CJB0+QyL9cRQKFxZMwDWOhXx2M4kubo2Eo8GVKKkaOufWgfxr3P+LX5ftnzVIbDpcsDruQ7wDPAA+bHqtWaP2zH/UhTU3eIqPvdLuus0B3Kpjj2Dxqvtabs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73553d1a-e7b6-4162-d9bc-08dd40eec7cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6505.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:27:25.9373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzzVrIGtUX+v2X9zaHKjxowIjfmImpf+fEyMM8QEZsuYmj2vFsUHtQdCScqCdjmVwLgz0YB4CSGntHd3NpLh0QDVJ5bDZEfm8KixZ8R9zmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300039
X-Proofpoint-ORIG-GUID: DvTJ6oBnUbmGh8n7aYSsPJoQ7smWrmzh
X-Proofpoint-GUID: DvTJ6oBnUbmGh8n7aYSsPJoQ7smWrmzh


On 30/01/25 3:31 AM, Stefano Stabellini wrote:
> On Wed, 29 Jan 2025, Jürgen Groß wrote:
>> On 29.01.25 19:35, Harshvardhan Jha wrote:
>>> On 29/01/25 4:52 PM, Juergen Gross wrote:
>>>> On 29.01.25 10:15, Harshvardhan Jha wrote:
>>>>> On 29/01/25 2:34 PM, Greg KH wrote:
>>>>>> On Wed, Jan 29, 2025 at 02:29:48PM +0530, Harshvardhan Jha wrote:
>>>>>>> Hi Greg,
>>>>>>>
>>>>>>> On 29/01/25 2:18 PM, Greg KH wrote:
>>>>>>>> On Wed, Jan 29, 2025 at 02:13:34PM +0530, Harshvardhan Jha wrote:
>>>>>>>>> Hi there,
>>>>>>>>>
>>>>>>>>> On 29/01/25 2:05 PM, Greg KH wrote:
>>>>>>>>>> On Wed, Jan 29, 2025 at 02:03:51PM +0530, Harshvardhan Jha
>>>>>>>>>> wrote:
>>>>>>>>>>> Hi All,
>>>>>>>>>>>
>>>>>>>>>>> +stable
>>>>>>>>>>>
>>>>>>>>>>> There seems to be some formatting issues in my log output. I
>>>>>>>>>>> have
>>>>>>>>>>> attached it as a file.
>>>>>>>>>> Confused, what are you wanting us to do here in the stable
>>>>>>>>>> tree?
>>>>>>>>>>
>>>>>>>>>> thanks,
>>>>>>>>>>
>>>>>>>>>> greg k-h
>>>>>>>>> Since, this is reproducible on 5.4.y I have added stable. The
>>>>>>>>> culprit
>>>>>>>>> commit which upon getting reverted fixes this issue is also
>>>>>>>>> present in
>>>>>>>>> 5.4.y stable.
>>>>>>>> What culprit commit?  I see no information here :(
>>>>>>>>
>>>>>>>> Remember, top-posting is evil...
>>>>>>> My apologies,
>>>>>>>
>>>>>>> The stable tag v5.4.289 seems to fail to boot with the following
>>>>>>> prompt in an infinite loop:
>>>>>>> [   24.427217] megaraid_sas 0000:65:00.0: megasas_build_io_fusion
>>>>>>> 3273 sge_count (-12) is out of range. Range is:  0-256
>>>>>>>
>>>>>>> Reverting the following patch seems to fix the issue:
>>>>>>>
>>>>>>> stable-5.4      : v5.4.285             - 5df29a445f3a xen/swiotlb:
>>>>>>> add
>>>>>>> alignment check for dma buffers
>>>>>>>
>>>>>>> I tried changing swiotlb grub command line arguments but that didn't
>>>>>>> seem to help much unfortunately and the error was seen again.
>>>>>>>
>>>>>> Ok, can you submit this revert with the information about why it
>>>>>> should
>>>>>> not be included in the 5.4.y tree and cc: everyone involved and then
>>>>>> we
>>>>>> will be glad to queue it up.
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> greg k-h
>>>>> This might be reproducible on other stable trees and mainline as well so
>>>>> we will get it fixed there and I will submit the necessary fix to stable
>>>>> when everything is sorted out on mainline.
>>>> Right. Just reverting my patch will trade one error with another one (the
>>>> one which triggered me to write the patch).
>>>>
>>>> There are two possible ways to fix the issue:
>>>>
>>>> - allow larger DMA buffers in xen/swiotlb (today 2MB are the max.
>>>> supported
>>>>    size, the megaraid_sas driver seems to effectively request 4MB)
>>> This seems relatively simpler to implement but I'm not sure whether it's
>>> the most optimal approach
>> Just making the static array larger used to hold the frame numbers for the
>> buffer seems to be a waste of memory for most configurations.
>>
>> I'm thinking of an allocated array using the max needed size (replace a
>> former buffer with a larger one if needed).
> You are referring to discontig_frames and MAX_CONTIG_ORDER in
> arch/x86/xen/mmu_pv.c, right? I am not super familiar with that code but
> it looks like a good way to go.

This rejected patch works on MAX_CONTIG_ORDER and doubles the buffer
size but that is undesirable in most situations:

https://lore.kernel.org/lkml/28947d4f-ab32-4a57-8dbb-e37fa4183a69@suse.com/t/

What needs to be done is the buffer size will only be doubled when needed.


Harshvardhan


