Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2B697224
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 00:54:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495647.766028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS57C-0002jT-Ll; Tue, 14 Feb 2023 23:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495647.766028; Tue, 14 Feb 2023 23:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS57C-0002gK-IZ; Tue, 14 Feb 2023 23:53:38 +0000
Received: by outflank-mailman (input) for mailman id 495647;
 Tue, 14 Feb 2023 23:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Wp=6K=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pS57A-0002gA-76
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 23:53:36 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c99080b9-acc2-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 00:53:34 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EL4f7u011874; Tue, 14 Feb 2023 23:53:31 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2w9xwr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 23:53:31 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31ELnVAU016845; Tue, 14 Feb 2023 23:53:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f6bh94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 23:53:29 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by MW4PR10MB5883.namprd10.prod.outlook.com (2603:10b6:303:18f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Tue, 14 Feb
 2023 23:53:28 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6111.010; Tue, 14 Feb 2023
 23:53:27 +0000
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
X-Inumbo-ID: c99080b9-acc2-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=k/C632FvearAKr5zLZcpmc22IeiMcKenmPUIyo4mnxo=;
 b=DTSdlYUYMRjh37soRC3VqKW6o6tP4OCQ8/qiiTgDgyDPy5YnqQ3l1z4zpUlcsyZY3sgn
 JEmmcg/B+wAZ+ZHUhQv3tnGzacfZknJE+gsnn6wXzaMGb1Ch9bJKRFS1w6+ZoOksl6Hx
 W4mVnrn2hkd0Agd/SAmlw/MYvJrVDrBBUNEVKrkz1/LlNi8QcUhSY/bAiZc+JPplG9ai
 UWI5o4iLnBildzg9ht7rPv3TzSewhOejdSHhHXLyce5/EXq8oC8/+hj+FER8eFY+G0CT
 wWrrRRUNHxr7kZ24/EJm029FnvmRWNZgok624PveUnwKYyHoltxoJ2Lki36TfAk5xmgZ tA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jj6SQlFb0sQsAjQMUR5A/5mTtaLqQcpNymPASci34N7tUpUuu7CbrW29ba9y+6bMp+/ONt+iZhb4/vDO/TvNc20XlpOzlo/jT/JsCZfse0Md5IvgFztRgrMn/rbJY5peNVa/lP2ekhs3Ths6dOLoZX4t7a7VECTkreLHUa30ch/GHVQSC4TuCM/pQo5DB1lPGsVoaUk5NYhf9077+F2pAdPNcL5ojx7Cwhh06YhgXwl5tiF+eauDTBRIADCRHybhs+RnnTQE0tgCm1QcDa7QBBLJDUo/MamIH+FhpOLXpy0dFzE3wUdtolLy2C6+vrw+oyHU7BeAwkgZNq+2uHDHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/C632FvearAKr5zLZcpmc22IeiMcKenmPUIyo4mnxo=;
 b=X13HGCPg9nk5DIuXhgwbxmk0bJhsWB0dyOifxaJntNIEIfnv2fMQ4/E17r0i0DrAlnhMVid3+IfQxalDhdThZq//QADlgvaQVZ6uVeXPQhAyxus50Bj46KAi6Aiw6rzgg69/BUOI/9Mana8ydWKZQdYQR06lnHdkTpk3tB5rOQgXAVge1dJoP2PmpQRBepYMiP5yXdbHxFsCHMKrzx7MehbaoOxB6OZdQTB8W9m/DsQFyZWG7A9o01oW6/z+lELdRtwFiTA3p9JhDcWteVSzjPOnXB3XVy9oWyxiZmv2Yq9PjOivq3qUaiIHZgCZJt9VnjMShm+jaI3t6cKqZNbgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/C632FvearAKr5zLZcpmc22IeiMcKenmPUIyo4mnxo=;
 b=f+MNmFBaW1b83Lr5bHMv2lB1w1nTmdS4336Kkdw97oy5Yfs2LB95wQEvWLQxpYzru8POxcPaJ3k6n6iaegKQRM3fYWqPASHvnk+vY03dPMf2plwnbNzxgWXfZoxnKL8DrDp4S+oRwsviuKiYrBpF2oQ5UaHZtSCdCCqFAnMo31k=
Message-ID: <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
Date: Tue, 14 Feb 2023 18:53:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
In-Reply-To: <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::31) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|MW4PR10MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5fa955-ab8c-4272-845a-08db0ee6aa77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBRZG+brj7Dvu1BFFx5Pv+BQoXTh2ulUhbNNPLsDSPULuD/07XJwaUgUCfffc4xicuTe8NOVOLlXntczxdKdc7mdN7N6oJCOC8M+nBuOjotEcHl+yFObCnDlycgMWJypIOM5Y7OuYtb5TsC4bL3GnMM6kXyfW81XTPiRoXjLoQb5zV+RkQvUSqOutI1iynSq7crv0IFKYX4oaApm2z8M5qZeloolMjd2cgA3vrWY2xpIoUX/7H0+7MiR/JfHBq+2pVPm7VDCxhHRuR9hNlok66mCSkBkzqqASuhXJJflihiHb8FjjUXIeyHUqWKEA5WVIMPxzWRa/CqI5l+wvg3EJ9KvYTo2J0/hIbAZgseSng0Y1Zd/EzG7eIlbsNzQcB2ewl7noAkjSpTOrCrwK8QdBXZcVf+ERu1yplpW9mKSEdJ7SZ8F2U6Z4trrEIIyLs9Gcyo6LqVj8knZSOqf8IlAa05q31FXL9Bck4uH859nzmMzSYcZjSUAA88UDwJDOENdn7pxECUO03dF8edTpjRDsJOuHdWGeO3mJZOTjAGBK+RFaUaBDLzdyTsjE63bcCHGX7kfj7MfZ2uY/mTrPhoY+fELU9XM0HC/o5aYaQqYY6c1TS6USldbvByI0An3CX7pVyZKSIu/Vxuem0zo0rC3GxHOJ9Xp7KUhqA3lFi56TE/30jVvTCjy1fU2RcC1mDnNDILiZ/Q3rDqkTIQTBFoEDDQg7u7HDdSHqgNO2Nboc8U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199018)(8936002)(31686004)(6506007)(36756003)(41300700001)(2906002)(38100700002)(31696002)(66946007)(86362001)(66476007)(8676002)(66556008)(5660300002)(6486002)(478600001)(2616005)(186003)(316002)(54906003)(4326008)(4744005)(6512007)(6666004)(110136005)(53546011)(44832011)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZVpZcGtIdXAxY3NickkwSDk5dzBCV3dOek1TZEIrb1diZ2xWQmRtanBHOHJY?=
 =?utf-8?B?dHo4ckIvd0VVUUV3bjRKZ2cyaVV1dVQyM2N0OXR3Z1hZdjNGTUNXOG1pZk5y?=
 =?utf-8?B?bTNBZHlaLzJMUUFtMWg0TFMvR3ZVck9GYnVLRUdoVEJXTldlVmFSbGk2U2lq?=
 =?utf-8?B?RmEvRXF4M3Z5SVlsU2FwOVp4MlNsMEt0L1BjNEkvUnkvbjlvS1B2MXJrdi9R?=
 =?utf-8?B?ZTZWbm0zbW1vakZzMStVZTZtN1VoNVliZ3RTWlhodkZGU0c2QTdDNlVRam42?=
 =?utf-8?B?VkM5Q0t2RGUvNUxaQ3lJR2QvSDBiandpaFhiTVM2SFlHQitYU3dXczJHaWF1?=
 =?utf-8?B?ZUFJSWRZSjNYeHp6eEZBOTN5cE8zbnRrK2MvdU01K1NMWERjNWJ0dzh2ZmRN?=
 =?utf-8?B?UlBOWnZvS3Nnc3F6bG05WWFuUTB0MVZBK3pwNU93aFJTa1phcHpPNm5HSytt?=
 =?utf-8?B?NWpidzZGd0VweFFFdmMyb09RbTFycDlrWEd0N0s1TlZPTEJId2lhRlBTeU5J?=
 =?utf-8?B?dGtFZ3BvUXhrNEVSTVFjdUR6a2xtZjN6OEhtTnZ3cENqMHhVakdjc2laczRt?=
 =?utf-8?B?aFl1dmQyaFhQZW1taW85ckEvVUhUVDdVdDF6V052ZGhrUmlISXRoY1MxT00r?=
 =?utf-8?B?ejNzaVZHM3Bzd2YxMnVNSFlCc2g4T3FyeHd3RTQwYzlkYkNUbTl5U2VtK2ZM?=
 =?utf-8?B?eHZBSXV3TTJ2bTJOTm45Y3I3ay9VbldhV2VKS2NralRLcGRoVzQ3dDdyTnZN?=
 =?utf-8?B?c3lNZ2RJRS9iVGNzYkNrenoyWEhjR3MyclBhTENPV1JkNDh2TnFzLzlxMWVZ?=
 =?utf-8?B?dlpqYWpzdDJ4OGYyVE9QRjluVWE0dmNWa2NVRXExZ0NFT2JNRXYyTldUMFNG?=
 =?utf-8?B?MzF1TWtDRk1hN2pIWCt2a3FUQnhiUEZyMEV3YytlcFhDMXYyRDJPMDlSR2xR?=
 =?utf-8?B?R211Qmk3S0p1b0EzeHMzaVNvWThTVTRobENxQlBUQ2JRMTk0bW02aElVWDlT?=
 =?utf-8?B?Z0tNdWx5OC8xbG1Bc1hxcFhKMERQTFU0SDRsaFhCRG5VOUEycHVIUUJmamFU?=
 =?utf-8?B?KzZkakc4WFEyTHczWERhQjBnTDAzK1NoSlk4b1pkQ3JFWitCQUszUmZBTnJx?=
 =?utf-8?B?NkNNY0VGZVVHczFCMndaSzkyN2gvTktQcElNQVN2TWdndXFXY3ExYXNYa244?=
 =?utf-8?B?NjcvSTJGUW5ZekpiVndFQUVacXpUamVXV1Nmc1RDelpTVy9Qb2dVMkxBL0dy?=
 =?utf-8?B?djd1SU51dkEwMFByMHdHUjVEYVk3MEp4OHZtL1JIdWdQeTR3QlR3bDVuYXZt?=
 =?utf-8?B?a1YyZ2lrdXNUN0pIUVFNYWYwV3pEMGhJNy9mazZwNDJkK05ndzk1MzFNZWhS?=
 =?utf-8?B?N0xNVXNEamxVbWFkU1hHN0tsblYwTEtzc3Z3SVlSVVFnNmlKWXJiZTAyK3hV?=
 =?utf-8?B?OFJyQVNmSUhjeU5VaEVYdHlaYVIvVG8xWDBzRUxDenNpaHJFMVBNaGNoanU2?=
 =?utf-8?B?WSt4azQ4dGZZWGhHdjRzV3RBMUpldThnMHRyN3pMTUFWNEpwZnNtZjl5MXhW?=
 =?utf-8?B?ZUhzc0tQWU91QWlWTEhJQktjZzA2V0s5QXQvTEFmNDZyZFU0WTY2SGZRMjkv?=
 =?utf-8?B?M1FCY2hOT1dTdGt0c2xJbE1ZSGNxVU1vbjdlVGJJZHFsTVQwUjBSeGN1dCtL?=
 =?utf-8?B?UUQrYzZ2d0dJczY2bmNQWlc4VXp1MlI3RkpMUlY1N3lXWnVJcHFkK3BCNlEw?=
 =?utf-8?B?Zk1RNjVEcFM0SW5OZ2lpNnFiMVBKOWNpNlJHeENxOWY2NzFqU0d6ZXc0STVp?=
 =?utf-8?B?NzhQTkFLVnliQmNabk84VHRsWXNYcnBBV3pUeHpaaWZaZlZZU2NNN0lCQXpC?=
 =?utf-8?B?Y2R5eWU3Yll3SWxHOHFhNFgyOFE1TTVuUjBWS2tHUkNnTlZ3TkdWSFQ3RFNM?=
 =?utf-8?B?dEhPcXRkd2l4MEVUTmZyQkM0bE1GSUhNR1puYVR2RTBaWDQ1TGNIaXYzZW5U?=
 =?utf-8?B?SmVuR1JLT0EyZFovZ2VEUkw0ZDV5UlArT3MwM2l5RlFaQ0x2VFh6UUl2Smpm?=
 =?utf-8?B?bTlnUllObkFmb1laRDQyUktqbWkyTFRwUmNTUlRBQWFpSm1ZdW9XUnBMUndV?=
 =?utf-8?B?NUtVZXFHR0U1VkVxNkVCSWZqQlhodU1MRVp3UmJwUmtCTFhRLzd2bGxkR0I0?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xpxe/vQ7jaCDZZQdGJcoJhs8iL1qUTL2QQuNy/e2C/L0Sz0lhav29W49XoIr9oDS6OrBSIn7rEf+8WE6MsBaj6V686IultG3mTTEGK4FlUlWFHe3EVoAq9eiBr3ciFb208jYEsedk1KSskMH5khh6zOe/l79Naxj2xHroULD4AQK6jushSowqgJTxuLPb0FOQ/2HFdyqi78Umst3+G140t+lcQT0KXKdfxvdon7KdrafGSRlaurnAuWxxlw3bRQbU9Klrc6lDPOxOiUnqO9tUdob/Hi4gE0lRata4X7Z0QMGoAJwSlkodMf4LEyFrN+N5CGUqf4IYa+OOwWTvV/7kiQNSyPm2iOq3rGwBEZqUlvLdr2Wq0Buo66ueZ1Tq4IdwbbY8tMo90iTzITZa8fCjZSPsfrr7vCgqLBBVsQXwUusZkmDgayjMuN+3T8Tdojw1BI0w4kzsdgwkfMo78ofM8Zm4IA5B9W9Y2RdAGOh3Z2ffWswLtE7XjCr4NIIPvRYdvmJe8+x9THuEeYAy0Ttyhz+QetPpM2eblpXE+7NOTQcvuginIATnt6SALID+UQ/AB+ph/JGDaCmLIDPvZhnGj3K4rTeqpQ7wpNjMUi+rwo5aGNb4m/liSf39pcvOe15Q5gLTZUA6nKNFbtFBiNhrIaB/G6vDz0ZQddCG0RoiFAKsyxGfwv2xs1sF4J8y2vf5fLfAIoT5UKfiDAcWqaHcfWDYcjsLvOYq2yTPtDCM4Jv7lgB5eQWZ4LfYzMOq8ztau5zjZvH4g2iMIWc+KGyOHEY4J69xSoWanXESfEY3TRCythlrhL8WhXkrcSLmbkAbLztLQmNlpKw5FjSPc3ldw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5fa955-ab8c-4272-845a-08db0ee6aa77
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 23:53:26.9689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQQUt99afjB5PmuVlhTB6UXAfVREVrG3y+wKUaKmQ8M0xtWB4bQbP/v7+lW8g9B02UBJHTmQEtzFPc3RKLzzdGkssJpt8+GeK0QLWmFloeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5883
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_15,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=817 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140205
X-Proofpoint-GUID: -86vT3qp9Q-yQ9U1zB3SpVMieSDACmsk
X-Proofpoint-ORIG-GUID: -86vT3qp9Q-yQ9U1zB3SpVMieSDACmsk


On 2/14/23 11:13 AM, Jan Beulich wrote:

> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -18,6 +18,8 @@
>   #include <linux/pgtable.h>
>   #include <linux/bpf.h>
>   
> +#include <xen/xen.h>
> +
>   #include <asm/spec-ctrl.h>
>   #include <asm/cmdline.h>
>   #include <asm/bugs.h>
> @@ -32,6 +34,7 @@
>   #include <asm/intel-family.h>
>   #include <asm/e820/api.h>
>   #include <asm/hypervisor.h>
> +#include <asm/xen/hypervisor.h>
>   #include <asm/tlbflush.h>
>   
>   #include "cpu.h"
> @@ -934,7 +937,8 @@ do_cmd_auto:
>   		break;
>   
>   	case RETBLEED_MITIGATION_IBPB:
> -		setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
> +		if (!xen_pv_domain() || xen_vm_assist_ibpb(true))


Is this going to compile without CONFIG_XEN?


I also think these two conditions should be wrapped into something to limit exposure of non-Xen code to Xen-specific primitives.


-boris


> +			setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>   		mitigate_smt = true;
>   		break;

