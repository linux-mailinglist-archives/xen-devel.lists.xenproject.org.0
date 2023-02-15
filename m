Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEF6988BF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 00:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496268.766922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSR6y-0000T8-0c; Wed, 15 Feb 2023 23:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496268.766922; Wed, 15 Feb 2023 23:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSR6x-0000Qz-Tk; Wed, 15 Feb 2023 23:22:51 +0000
Received: by outflank-mailman (input) for mailman id 496268;
 Wed, 15 Feb 2023 23:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aW5I=6L=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1pSR6w-0000Qt-JQ
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 23:22:50 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6dfe8ba-ad87-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 00:22:46 +0100 (CET)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31FMxIQs018871; Wed, 15 Feb 2023 23:22:44 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2wa1t70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Feb 2023 23:22:43 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31FLPAZt016765; Wed, 15 Feb 2023 23:22:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f7uwn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Feb 2023 23:22:42 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by PH0PR10MB4789.namprd10.prod.outlook.com (2603:10b6:510:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Wed, 15 Feb
 2023 23:22:40 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::6800:e85a:3f21:6606%2]) with mapi id 15.20.6111.012; Wed, 15 Feb 2023
 23:22:39 +0000
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
X-Inumbo-ID: a6dfe8ba-ad87-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=x5cHxNRsBgzP/65saTGrGlD/j2smdlH/nz5C+5CED94=;
 b=vVO9h75kJdht+OtylOm/NPy6JZPsAiLO9krJg5WDKSAuXIcEqJ44T43TmGNNKGCuPC+y
 DYy2hiY3StO7N5sUzs3VwsldJWsVZsY940kaf+OtpUPpmAjCaA1gRjAoPro3562JUNdW
 U7Fox3iU4fVQsWQfQwVZ1yWW+ePQbVtwNVj9rK929UzczDNdUSdKzLoO8kLtu8dO7Ker
 YUHKMpf0M6K0RKfmAE6jNMjtxrz7RiZAhH753KGgf0goFw5YYxJhwjaOAj5zWdWu709Q
 DY3Ggjw8xe0xqeXk3wVEXXN5VydCQ5V8+4/KqMvK7x+B6I2AfPsi4Z75WQEUT++xpFKx qw== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlFLqBYgn6N7rysXSMfEeW366I8XcpuD2ZlsdfMH7S8vAGEkZ0V//eitTWJ/vjfC1hUm9VKNFWGVzIFbOMIh+/Qp2cHA90t2g/pr0+eVHd+BbbcpIyZpA1+tQRl43ej3nrf3eq7ZQiAU8Pd/JViP3y3GCw9E8G5Qe7yUtma1oauP0QFGKppX88uBKqFVWxzljd0MXTynhDCb/wIaRl8n2fHDmqcMJVwMkpnlDOzd8QaCWBHGBi/a00gdxDiwRKbCu0uqsyr7K0HcID2lVUow8lYXrlGsK4liUYCXzmYeIGYFc/lWclcZzQXX/UHcDYUAykEUhSKQmCXHPYUTtp0mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5cHxNRsBgzP/65saTGrGlD/j2smdlH/nz5C+5CED94=;
 b=PIJhP5s8T4Xx9/F9l+GDt0MRdco9v2QAoJrboceL/PqVuH8wwdGEApB/ygfm10aEIV8fs4VRhEDDa5BEZWoWc4laqbZ7CVqWnvD3EqPnvJFE4pbgdO18b6PBgSBEK6BQHYg7+3OHvTwxP0As7C/Zso89MJD4BE9GGe9fXqPX4wN8fR6TfpmpRj+4IlxmR18FsyYJOA+SURyDOWYuZCplGHj5lZTRfAPGo/zc2t/XS2E+/Z06ah1tbpSPYYRXrKfIcBz6nfU50wJ8ZLMup4OJbTdBJ17lWfCrCqr91vKhIv4vdpvaJ6FO2U5FeIRtB3zmMS1g/nK1tSwqvWlukyub6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5cHxNRsBgzP/65saTGrGlD/j2smdlH/nz5C+5CED94=;
 b=cRXx7AS62x/LzBBh59zX7Tp1V15mPwiJhN+oHBxdYkORoi9oDW6y5Gh+d5Fd8Q8GWqEMZtw/xNBIzDRvyBmRsBXGt5GoNIH48hRa1ShCih0SbBRdqpvagkCEU/LJLSRuUM5Mmm6144ZBKcUetlaZmpRLu+TCIfP7BokYG4439PA=
Message-ID: <64bc94a4-07f8-a065-7346-6d9f514bd690@oracle.com>
Date: Wed, 15 Feb 2023 18:22:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Juergen Gross
 <jgross@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
In-Reply-To: <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0446.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::31) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|PH0PR10MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: d98c0f4e-7e37-4b2c-3171-08db0fab87ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vRIPTDtwjAbDAlYPWNU/7FCNUmvMMu0aQsoIRkyjI94N6bUG4Y8pwYDg7hKisX3zg/YO8JFiJXNKlcEYqtgK4H+AVZ4LZzaXHk8fUelMrEhHLH+yIg9/fHlQ+9i98AU1gTYJhPrfXx9Czjx6NBEaujGnv5uBk/KW8M/4boIw00vK0fnCdSvjwVAZMeraEJJO25Rap89BYxXq26PQV5QNwGSowiPUy41UApmETzTMjBNNtcSpqd7RNkmjgH3cpTXBjWQiPw98cSmUPR1I5i0EwFmKhJFPQ4ILXbS7n0mlYzVTfYsVJiuZIfmvuDJ+QR1wBHPaDdumIf/QAtkeZ6frmf1zLfPp8Yq1uK7JHB2OeBrmvVPAGmU2ZvBYb+rgBwSGTm99U94m3/NLYzwIDz9NNzz+S9mzmfVHhZdT1iXV49Ad2XWediVX0ry2HiyhCILo2/FA1PYqEZ2guIcEdy3l+7fZ6lmr/fOomgtCIiDmkmYSaGU7nR+7MunOSrh3UMywF8zvQ2HsgX6FX53rqGKBOI7BLk8DteYO+jUIvFva7MBv9HbXneJyOe9UIpfxGcRao5aYovloDjcVrQs1wRl93P5K6UNTuW0RScUDPqxP2Ry6f9x0lBDGns+2Jl60n5/Cvc8zrIA21E7olhyk5mr9j4ZE5tMraom40SNEBgU6NVHdjPJ/b3eLfANvN3tbKCHDAdvAfVn9/NHH5xkHv9B088aZsfgwt1FD6r8LEsr8EA4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199018)(36756003)(6486002)(478600001)(66476007)(38100700002)(2906002)(6506007)(8936002)(41300700001)(5660300002)(316002)(8676002)(6916009)(4326008)(66556008)(66946007)(54906003)(53546011)(31696002)(86362001)(2616005)(26005)(6512007)(186003)(83380400001)(44832011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3ZQdGdiVGRUWmJiWTRuOE1UR0lvM04wMkdmbnBkN0JzeE9iWFRFOVVEYkJo?=
 =?utf-8?B?bWFFZ1I1UFIyenVCSXFnQjd1dWlPcWJsaWpaL3lMWVBXbG1BM3dBL2VoTjg2?=
 =?utf-8?B?NDc3bWxpUHoyV003V1I2ZU13dnhNVUR2QjBZSGczeXhFZXJDbTNVZjRCOWVL?=
 =?utf-8?B?Y2dXb2dzTzgycGRhV0gyenFPRklQVW9WbEkwcWl3dHBvaE9qNDdCRXoralRC?=
 =?utf-8?B?UXF5LzJIWVBSNW8waHNnWFpKTStwNTZIQkdvdDRrWVpxcjZvN3Y4eHprRi9a?=
 =?utf-8?B?bks4MHpUY0hVUFo3NUxLVnRlSXYreldmOXF2RGFjTVVPTSs0NTh3RWJKdXVv?=
 =?utf-8?B?T1lLSTNhQjVnbFpJSlB6cnJUcnoycCtkdWhOVEF0aXpDS2d2UmJ2MFJxOENC?=
 =?utf-8?B?bUU3aHllbzBQY1B0cFNETERBdHJVdGFrSkdUeHhab2hmTHBRNEs4WGx0ZU1Z?=
 =?utf-8?B?emJKajdDaUp3MndtellId2MzQU5sWkNuVG1MSnRkUWtMeWNaZ2pEWWlOb0lN?=
 =?utf-8?B?QWRpTVZFeGtsK01CTnBlNGdmN1lOdkN1WXB0OVpnTTcwSkRRSkh4YTRKRFBp?=
 =?utf-8?B?c1J2dXNQVE1UUFFTWXAvbFpOWUUzNzZDdDdDQ1JLV3M2STBNUkVVbWdrZGZ5?=
 =?utf-8?B?ZmxwNVRramJPbXhQNkEwSU1HTE1wNzhTWGVyQ2ZZQXdaMnlDdHpBSDNHcEdq?=
 =?utf-8?B?MDZmTFJWcFFYakZCQWduZnFRV0F2b0FQNmZXU1pUcHI5eWtjRVFia3pBclhC?=
 =?utf-8?B?Y00yQ1dpTFp6Mm9ZalQrSkZZc1Y5WFJTRVo1VkRmaExicERyUHNsNjU4OFJq?=
 =?utf-8?B?V1hXRG51Mnh2K0cvOUtGMzhObDA0SktQeWFOTTlOZzY5em5HUldtdkdEdW0r?=
 =?utf-8?B?SWd3a3hoaE1zVTVQL2xYTlpoRGw5dml3RExoeVpDdUtyMmo1aEVXRHR6c2Ji?=
 =?utf-8?B?aVU5aVBjUXBldEFKZEhXc01IblU4UFh2VGZuaVVsd3FxYTA3bTBCL1NQeitj?=
 =?utf-8?B?cWh2S0R0T2ZaUTQzbjFoSDYzSy82MCs4MVY4ZDhXRWxyekMvU3VwVC90b2JY?=
 =?utf-8?B?dW5SVXV2a0xXQlNVb2pkelQxaTlaRkswNzhSeE83K1VsWkJFQ2lmMkU3dmNw?=
 =?utf-8?B?TGJxUzVoakIrbmQ0YjA3Y01ETzNVUWg1N1B4L3dwaTl0NnFGNW1sVU9sYUJT?=
 =?utf-8?B?aElxYU5yaVN3Z2ppRUZ6cS9WZ0NDdXRIS0hvOVhCdDdJOHl0Nm92byt3ekt5?=
 =?utf-8?B?SkVDeXZ6L3pMU3QyQlA5dEwyM1hQWlBzL2ZkWkNvN2VoRmx4MmI2emN4WWFh?=
 =?utf-8?B?VGY2cnE5UlJnTmZ2QStUazh4bHpURDFnbktRSUtnSXhnL09VbXNxVSttYTAy?=
 =?utf-8?B?akJpQmsyYWowQ3J4Lzl5Y1c0QXc2NU5SUEplVnRUNEpiczhvVUlFN3Z3Szlv?=
 =?utf-8?B?U3cxaThMNGlnd1VlZkhjSmp4S1JXS21jYXkxeG15ODFVblpvcno3N011Zk5G?=
 =?utf-8?B?MmtkejNvNGNKSzk0a2RBYityU0pIVExmSk8wRHducFlHMisxRDE3MWZnMG9O?=
 =?utf-8?B?R0N2NDd2MXlNNkhzTE1IRlNDUzNmY0gydDRpeno1SjRIeEVHdlZwblVzdW0x?=
 =?utf-8?B?QS9QUGQ0Z2xFeXZuL1hOS2dMaTc5M0VZdmlxaE5vUzFzZDArbmRrV3liZHB0?=
 =?utf-8?B?TGxzcXlIZ081RldoNW5wSGdkUFk5UUhNam12aThnK3dKTlhEeDNKWU1tOTlU?=
 =?utf-8?B?Q3VYU2MrMkRacVgyQnRzdEJXRy9PQ2hRb1dFblFVM2g3VmJ2dnBkcndMUGV5?=
 =?utf-8?B?MkR3RWZtTnRxdHE5NnY1b2dkNUtOUmVUNDAzUDZja1VrOEpmUW1JYmFOcTFT?=
 =?utf-8?B?ckNVc2NEOWFHRExKblc3TGhoS1RQKzl4S280dXNUMUJJMm5oTGRJNVZRNUZP?=
 =?utf-8?B?Q0l1YTJhWHBheC9wU2YzU3BidDg0SHFYTHIxYmxSWGZZSG9BeVBWcXpZbVFC?=
 =?utf-8?B?a2J2WDFuVy9FV1g4T01Xb1VHaFVHR1QvcExpRDRGSWNwUnRMMFlMaDQzRWJh?=
 =?utf-8?B?ZHg2OTU2Q0ZrT3YvOFBkNjVVdUpCKzZJeHdia1F5SHZ0WHp2T25LdTRialI5?=
 =?utf-8?B?U3JnSThicDkxbzlmMU8wUklxWUZOMUtFcXVnTmlHZFFRRWd6c1N5blNkdlRt?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tBvi8cXrVnn5JRWO/T42S1YanTP9v1T9KECtw2W7K9wzF14yoHwVeyJV2P5lIfG8kbYHzyRlpL3n0UUoHcfshQcAwC0xJYmZcnI6JP9Et35I5rvZQxJ8t3Ao5JTPx0kve+r8yXWgik6iqE1s1Fx1BA5whZc/k/80hKXeJdIOAeeL7UBfgCfQ4XDIItTUyycNymDQJjiP6SQfLkU4i7yvXV789GWLPBvUDkfWzZyaYbGZx4litTZ54G+mhlrY4iF0Q7i/w96wHFfgQzBFuA3Ns4LAht/6GSMiMHwD3k5wo3E91sK05Hpo30KcfmY4ec7tr0lPHN3HIMpWfKnSScMnrjhI3+/b47CNIbfR5VdgRBfIVyqz5y5gQAfXpGxrcTqvFnhJJc69/a4lWC4iGvjFvnipsLnLNfo/GcHFvUuZbGsjt2ipJZnjKQ/Nc2EKfrNhW1j9wbhjx4Ti1PT+DGftSY0+5aAEIQVWr4dYqkzNs93+ndlaZ4h2hrU3P4pseIakiTUR96Tjpy0gLQGa8O0A8ZCI28cxBhcI8G6BIhXj51ugTlTGzRLWQTlkCAdvB+5CBUAOvMdwZy07SPTDi0+HgIKLb7ybvpWl7wasWaNR6D9vUPcYC8AVWtkv3DmNSLDymiGyw7X2UgWEb2DndSFuOlWLdLl8GZCUJsMfR9EVfkS0bw0AtYpeOgdINOpjPMP0N+ljIVn0HA4ruzWiRvC0ZXfizNWqsjV+DDZHAYNwJUx46VxOTPhHpQW8N+QmYLaz9WDq1rBHZJiMSMBqGN7i42OpIOWjYuW/2fzRWq9lZhisMXHZ8E9U6doxVNyQzNWJmy/yk8KnASL89Z/isdr7Zw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98c0f4e-7e37-4b2c-3171-08db0fab87ec
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 23:22:39.9002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suHyOoBFfgD5cJ6raUozHvGl/50y30ek2O9lbpM7Suq3P2hK9UGNpqYydxc6AzDZrtwLoMrNwoa6327IVvziQfZg1qrrdRqusXA2J7qt+OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4789
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_14,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=735 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150199
X-Proofpoint-GUID: Bu4dp5df7fYeA1FoJ-Qs3vltSHyeLKIA
X-Proofpoint-ORIG-GUID: Bu4dp5df7fYeA1FoJ-Qs3vltSHyeLKIA


On 2/15/23 3:31 AM, Jan Beulich wrote:
> On 15.02.2023 01:07, Boris Ostrovsky wrote:
>> On 2/14/23 6:53 PM, Boris Ostrovsky wrote:
>>> On 2/14/23 11:13 AM, Jan Beulich wrote:
>>>
>>>> --- a/arch/x86/kernel/cpu/bugs.c
>>>> +++ b/arch/x86/kernel/cpu/bugs.c
>>>> @@ -18,6 +18,8 @@
>>>>    #include <linux/pgtable.h>
>>>>    #include <linux/bpf.h>
>>>>    +#include <xen/xen.h>
>>>> +
>>>>    #include <asm/spec-ctrl.h>
>>>>    #include <asm/cmdline.h>
>>>>    #include <asm/bugs.h>
>>>> @@ -32,6 +34,7 @@
>>>>    #include <asm/intel-family.h>
>>>>    #include <asm/e820/api.h>
>>>>    #include <asm/hypervisor.h>
>>>> +#include <asm/xen/hypervisor.h>
>>>>    #include <asm/tlbflush.h>
>>>>      #include "cpu.h"
>>>> @@ -934,7 +937,8 @@ do_cmd_auto:
>>>>            break;
>>>>          case RETBLEED_MITIGATION_IBPB:
>>>> -        setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>>>> +        if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
>>>
>>> Is this going to compile without CONFIG_XEN?
> Yes. The declaration of xen_vm_assist_ibpb() is visible (satisfying
> the compiler) and DCE will eliminate the call to the function due to
> xen_pv_domain() being constant "false" in that case, avoiding any
> linking issues. The interesting case here really is building with
> XEN but without XEN_PV: That's why I needed to put the function in
> enlighten.c. This wouldn't be needed if xen_pv_domain() was also
> constant "false" in that case (just like xen_pvh_domain() is when
> !XEN_PVH).
>
>>> I also think these two conditions should be wrapped into something to limit exposure of non-Xen code to Xen-specific primitives.
> I would have done so, if I had any halfway sensible idea on how to
> go about doing so in this particular case. In the absence of that it
> looked okay-ish to me to reference Xen functions directly here.
>
>> Oh, and this needs x86 maintainers.
> Eventually yes. But I would prefer to sort the above question first
> (which I'm sure would have been raised by them, in perhaps more
> harsh a way), hence the initially limited exposure.
>

I also think there is a bit of a disconnect between how the mitigation is reported in the log/sysfs (retbleed_mitigation is RETBLEED_MITIGATION_IBPB, so "Mitigation: IBPB") and, for example, lscpu (since X86_FEATURE_ENTRY_IBPB is not set anymore).


-boris


