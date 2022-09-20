Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1605BEC9E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 20:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409548.652523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oahjG-0004zs-8q; Tue, 20 Sep 2022 18:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409548.652523; Tue, 20 Sep 2022 18:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oahjG-0004wt-5i; Tue, 20 Sep 2022 18:12:18 +0000
Received: by outflank-mailman (input) for mailman id 409548;
 Tue, 20 Sep 2022 18:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R99E=ZX=oracle.com=boris.ostrovsky@srs-se1.protection.inumbo.net>)
 id 1oahjE-0004wn-NN
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 18:12:17 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe2d366-390f-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 20:12:13 +0200 (CEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJPVp004629;
 Tue, 20 Sep 2022 18:12:09 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688fkxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 18:12:09 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KHvveL035677; Tue, 20 Sep 2022 18:12:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3d2kv49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 18:12:08 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by DS0PR10MB6053.namprd10.prod.outlook.com (2603:10b6:8:ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 20 Sep
 2022 18:12:07 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::dcc6:79b8:7480:2ecf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::dcc6:79b8:7480:2ecf%3]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 18:12:07 +0000
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
X-Inumbo-ID: bfe2d366-390f-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 to : cc : references : from : subject : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=AJVWN+mBKnd/AQd+ChLS2BbZczDfBTifMW2OcL4paNw=;
 b=LmjHJFkjNEL0Lr2zuOR8mA72Cle5HsA/EUtiXo7/hvg60/tMj3VC489FgEDt0QKimlGR
 vDMVSpB5y3UjRERM6omvlJRmX4G43oghNrehbmNXxap0OL67eATZTuMFJuFLkYefHO6s
 3zPRhGASPGzQR6FSW0Z9FzpfFLvSPZ5j/dqoNwduSebGJUUlM2vQktrSeEGnjPBegWAw
 0J7AqRdAMxEwbuyXwopUnSrXId0niUktYXYyTXPGbBlFWMCPYbrOLz/i0XOqshpAFqJD
 rlNlI+T5d4U9KRsEvkWP+YH6MOQI63QxODlvgv1+xeJpBS8xBpzCGaGgVH680IVkeGaB hg== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGL4wGVGssrMvaNfKGodvF1cHLoN+DbMAogwIU+FIMAWit2TH7WuqLGVwppWhim3MfnZgiaAac1Zgq3iv0m1dOkUNqbSRmiLFos68Fp1hQ0gdWLlzYsO9hJ+Gw7UMJJnBZsxzRMqtqCxd6oC0V2epLuv1PQqa8LFQOZ6WCA1Ymx3+aapUv8ctQTUX1K/f6DtPFjH5nyitvFDVMmththyApXzxE7EE4OMURLJWdVNRDTwa2SWpDfOXs6EuQ54J0J9p8f7W8ZGV/ttPnuGguUZpVmPk1mFA2b9BFmI0mS52gr3dAO1Tas5wWe7rTJOps4HBUJb8pnwPMUtb3Pp7pGlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJVWN+mBKnd/AQd+ChLS2BbZczDfBTifMW2OcL4paNw=;
 b=mP2+LEp/dejAuUgJlks/bdCI6bz2WcZxa0CsBXb8w+UBZf9O7NtSGk9/PunRuuulKdqXgKYRgObx/osfQFOcMz4pRs/8PRaKBHbUEJTg5Dd1y3tk+41ncGJz2GhfqsIxDeQcoH6wAi6ExKyaG2FQLN8Yi8GyuFmufZLdjBNf91dHqoRWcPOzhtfEvSTm1OL9xziLShBXae0GYLga9Q6FTZ3/fcFKlyH5pFeXxkn7gtphybhb8WOXz4DWRGJ4QSseTEtpOp+lQU8AjPXbHANEO0ohaGihNvnYD5bFKrRZYJ+4rj/j2wjkYKzzxQxABjJeNPVFQ75jU/i4/VTBlsY92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJVWN+mBKnd/AQd+ChLS2BbZczDfBTifMW2OcL4paNw=;
 b=LH+rXIWLj/R6iH5fMz3AB028GU0chUibyw12oqrdeUBSLwgvO5KxaLWHndNouV2vDsoyDoeevLiSIWQ2i3uDSdn/60abwYVj9y9iMCTPRph12Xp3OztWRWIABSzbbXOa5iOPpqxlRmfX14FDQSdeGxBHZjIAy3QrX+COy9XJVZk=
Message-ID: <2c0e506a-e494-68d5-f4d0-1b54cca2b970@oracle.com>
Date: Tue, 20 Sep 2022 14:12:02 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
        Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
        Tamas K Lengyel <tamas.lengyel@intel.com>,
        Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com>
 <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
 <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
 <29d29f64-b799-d56c-1292-661fb5127728@suse.com>
 <CABfawhnRUhQAc0cRybz8sLLkxjuZCO6JVA5QYHBERG7gf0zpZQ@mail.gmail.com>
 <406b7f6e-d092-fb6a-d0dd-60a9743027f6@suse.com>
 <CABfawhmrnL1HGOWS1fkEv5X4CwfkrBj-+APJ=hM1GCzzgjW4zA@mail.gmail.com>
 <5d1b06f0-fc20-585e-9da0-fb24c5931ad3@suse.com>
 <ffc59d24-7862-b7fb-e11e-b5f773129b0c@oracle.com>
 <8c0c9e20-f3d5-86fc-647f-ee89d63f2118@suse.com>
 <4d317c1e-3481-6d9e-c5ab-dfd9c559d89d@oracle.com>
 <a895f8ef-1135-7a44-07db-3c2f3d685a1a@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
In-Reply-To: <a895f8ef-1135-7a44-07db-3c2f3d685a1a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|DS0PR10MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 50522512-3af0-4909-867e-08da9b33a0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iC6orTO+mSoen+ib52smhehCYIQMAief0e2XbgfhXS4BBYnO4o9SSDjiM4dNRPJDuUGZ66cZdccF7nPuK31Z1VLS8MxyMbyTA8AN3T5Am7tc93zYsN3blgWiszPZy5iqE8KJ8zn28bYY+yY35QQ5R2xwS0Gc/8Vdnoc/T1++gitjahDU4IqWSsx3r24YhjzMbAD6MU4ob6mZnLov1HAPCgfmqO8n5+OC3J1x2zu7BnzHPpkyL0FGoQWSn7jpG9EUyVusmAFLGjyYKiowQnxMBRZeTBqMa49xN6BiF9e08R0gZz+o2qnoH6XjmEuVqIXJg91SUqCKuj5TSjO6j88dirCAJo3woB0/x4IZsHOauEsetgrpj60K/OuoGQI29cj/1uIug66gOkyoHORs2z/BuvZpRzq0XJB60GLKeWEvwpp9bwZpC8qGL53a8HYSjuu3XN+2D08v0+ue59Ks+R2J15kRmLx87pTKE6DPjSHenqdzRKo2fbCVP6mQuJS1HAQYlKFZN1exJXsUdpX00JVFbBT97i2Gd/zbcGDvvtgH1SzHz+5Pdjja0hAP0UZiv0MQJEZ2BeJjpdtuVbD2whyaVdgILI5E5eAebTzTBtyrF49O0C/+ZtJMIQcSsRjc0UoFWZ1CiDbadEOKYDeeYKbwBCZ/OwR3lIWIa+uLFL3JLs0mKGhTYsGJORaik8Lxy6EQkzjhBZx87c6Ydn3+MhspPlOU82tixe+8Brt5w0E4ziMpKMHQLGLcekBEAjKSDCFHNDzvAcv2iPWTpzb9OWzXB250MemiWrZMrfEGZiOgXvc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(36756003)(6506007)(2616005)(86362001)(31696002)(66476007)(8676002)(4326008)(66556008)(66946007)(26005)(31686004)(6512007)(41300700001)(2906002)(6486002)(478600001)(6666004)(53546011)(44832011)(5660300002)(186003)(316002)(38100700002)(8936002)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QzIrSUpyOU5Ma0gvSGxucy9MOGdNa1ZxWGp1ejZqcXJ3ZnRyZXRCSVd6TitD?=
 =?utf-8?B?RUMrdmdsb3ZGblhqYkhsNUxIUlNzUDk3SnpTN21QMGYyUzZHWEk1dXdaVmNQ?=
 =?utf-8?B?Zld5aDNKRzNZT2xRU2RtTFo0a3BXUkU5dE9oTWFydDJNcEwyZjE5YmpWc0hZ?=
 =?utf-8?B?SmpSRCtnZXJsNjduVWFyYUNIeUMxcm5mOWpLcUVyZk8xS1B0VXdOSmFNM0VT?=
 =?utf-8?B?KzhOYWhpbVk3cHgxOFg0OHl4eG9mNmN6Lys0Z3JDNk1wTHNEQjdwL3VYZFdB?=
 =?utf-8?B?cHgzemFkYmI4MkJ2L2ZZMEx4ZkR1SjJqMGVrdjdxSDZ6ckFnRUJwczZ2Q1Fr?=
 =?utf-8?B?c0hvclRGWVJYU1pBSWpBUUxKQytZaG9nQ3FKL1ZUVDVRT1pUc29VcmpUNlpI?=
 =?utf-8?B?Z2YyR3RCYmxYOWhoazlVdVZtdEpCMm5aL0dzNUg0cGFsM3FmcnJMM29oemQz?=
 =?utf-8?B?SGp2TXpPU21Sd0Y1Um1Xdkh6aTVIZ1p4czBLMkt4dURMU0kzTTVaWUFPQnpo?=
 =?utf-8?B?dXloWDlpMFlaTVpJSTRMdk1DTjlkZmxDeVluUVJDZkU2aU1WYnM2aVcvQjN4?=
 =?utf-8?B?bUJKK09FN1RiM08vNFI5SEZaRkVDWElabncvbEN4QnNROGpOVVoxbXJRR2lk?=
 =?utf-8?B?OEpPSExnNzd5cDNuU2djQTM1bXE4Qlhad25pdjJNU1BhRGx5ZVBieTdwbmFw?=
 =?utf-8?B?TCtkZUxneWZram5uc0tuYjNPL2NyUHhOcHpjV2NMY3VkaFVUczFVUnd6LzFR?=
 =?utf-8?B?SlRKZnM3NmxMMHJKNnpjbkdTVzlvZDRSZnZiamc5RXIxc1ZxR1RZUTVCcnBF?=
 =?utf-8?B?eWpCNTR5dWtXZWZrOVZuNCtSV29oOTREMTRQQ3hvc3h2d1gvKzRvK3RKdGxC?=
 =?utf-8?B?NTZSUTh4OUlvNldJdUprbUNMZUpsZzNKSllEeWNIZ2wrU0NPRG1RYXVzRk1N?=
 =?utf-8?B?KzRJK2lDMUtnWW43OTNCRHViSE92akk3NmticDJ2MjRzTnZPNHNEdWdFdk12?=
 =?utf-8?B?ZWp5Zm83MjhubDJ0dDk5UUlDZGdjZUVyVHR1VUxNUDFCZlFiUUg4ZnJSNnVP?=
 =?utf-8?B?RWpwOXAvV3pSSjdYaHFwU1g1dTMrRURicGxWRVZNTnZDK1dGRVlmMEkvL0JP?=
 =?utf-8?B?Um9QcUloOTZMS1djSVU5K010ZjQ5Q3QxMTRJVXBqc0ZsOENiY0p1UnZCS0l2?=
 =?utf-8?B?NzVubW9SRWZpUWNCRmpMakVPdGZUUjJFNlJ2NkVEYXRTQVFrU1BOK3dpdEJo?=
 =?utf-8?B?QVRWOUFLVVloR0FCMkxsRWE2SXkwM0dydmoxeERHbnR5d3Nwb2ZkZEdIVHFj?=
 =?utf-8?B?ZTdSVGtIQ0xYN1pEdDgwNjNYaENXV3BnYnZ4L1ArL0ZybkZiUUo0M1JsRlU2?=
 =?utf-8?B?QVV1UmRpTno4M2Z1MjROZjYrSkNEcWIxQXdNMlpZd2wwd28zY1cvTDZxcXQ5?=
 =?utf-8?B?b2RBeDBYblBsdGljOEpaMVhFellydVViL3A1ci8yQllUN1E4VFRoVU8xWXhM?=
 =?utf-8?B?cGxURnFza2NBS25LTFRjYS8yZ25HbUZ1bmJTUDlMNmNlVFliUFFVSE4xTjVU?=
 =?utf-8?B?QW1YS1BQMGdQWkZ2cDNtdWJkQVgvUUZmbis1dklOUGowQmEzNkdKSVNqblB6?=
 =?utf-8?B?empSTk41R1ZXMzBYcmk2ZXJHNjhJSFpKNFJRV1dNTG1DSFBYUTd6TjJBNVVQ?=
 =?utf-8?B?aUx0ZUVpZERHMWdkbUMxMENZSkZ6MmZOOXlNbkFNM3hQaFVmY2dzV0dyY3Vv?=
 =?utf-8?B?d0J0eUNIN0NiSEtpR3BDSzBxcGh6TzAvQzVNejlyaEwxWW1zdGppN2w0RC9U?=
 =?utf-8?B?RVlZd1ZRbGMrRmhJNW05WE5NRFh0b212R1lTMjkzVldTNFBGbzlKNExzdWs2?=
 =?utf-8?B?TkpzZFdxR1ZVRTZleUxZcitaUWJrZnBzSkljZVMvMU56VEtlYXc1Snlqa3FG?=
 =?utf-8?B?RGlCcjYwN2JUK2hZcENZM0x3ZmNET0J1bC8xVWxWSEtZenVpRzhHVy9oRERo?=
 =?utf-8?B?SzJRcFRVdHNRN2s1WFkzeDJJMTRlODhlZE0vd1pMcjRUalVwTkp5RmVMVXdu?=
 =?utf-8?B?bnFiZ3FLbGxUVlB6WnQ3RHNGTFNsMzBPMzBFRGhtWW5iNFVrSlRaL3RsNjVV?=
 =?utf-8?B?U2hkcTF6bkRLSDM1ak1WQk9LQ2d5bUYzVlEzTFhXcGJiU2VjMVlpR0dYUExN?=
 =?utf-8?B?blE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50522512-3af0-4909-867e-08da9b33a0ad
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 18:12:06.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YfHPmg2tx3i0FaPpgdLDOKoqbNFD8F3hYN5fWSfbT1tWSLIMVvY5IvtJrLxRednbCuBZZwm5sqrAS6CGeAopcnEW/oGhG7S442G2wwCa+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6053
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_08,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200109
X-Proofpoint-GUID: IIEeBTVdkdiphZbKjlxrL8JBgAt1cz6e
X-Proofpoint-ORIG-GUID: IIEeBTVdkdiphZbKjlxrL8JBgAt1cz6e


On 9/20/22 10:54 AM, Jan Beulich wrote:
> On 20.09.2022 16:26, Boris Ostrovsky wrote:
>> On 9/20/22 4:01 AM, Jan Beulich wrote:
>>> On 20.09.2022 00:42, Boris Ostrovsky wrote:
>>>> It is saving vpmu data from current pcpu's MSRs for a remote vcpu so @v
>>>> in vmx_find_msr() is not @current:
>>>>
>>>>         vpmu_load()
>>>>             ...
>>>>             prev = per_cpu(last_vcpu, pcpu);
>>>>             vpmu_save_force(prev)
>>>>                 core2_vpmu_save()
>>>>                     __core2_vpmu_save()
>>>>                         vmx_read_guest_msr()
>>>>                             vmx_find_msr()
>>>>
>>>>
>>>> The call to vmx_find_msr() was introduced by 755087eb9b10c. I wonder though whether
>>>> this call is needed when code path above is executed (i.e. when we are saving
>>>> remove vcpu)
>>> How could it not be needed? We need to obtain the guest value. The
>>> thing I don't understand is why this forced saving is necessary,
>>> when context_switch() unconditionally calls vpmu_switch_from().
>>
>> IIRC the logic is:
>>
>> 1. vcpuA runs on pcpu0
>> 2. vcpuA is de-scheduled and is selected to run on pcpu1. It has not yet called vpmu_load() from pcpu1
> The calling of vpmu_load() shouldn't matter here. What does matter is
> that vpmu_save() was necessarily called already.


I thought we don't always save MSRs on context switch because we optimize for case when the same vcpu gets scheduled again. But I am not sure I see this now that I am looking at the code.


-boris



>   Therefore I'm having
> trouble seeing why ...
>
>> 3. vcpuB is ready to run on pcpu0, calls vpmu_load()
>> 4. vcpuB discovers that pcpu0's MSRs are still holding values from vcpuA
>> 5. vcpuB calls vpmu_force_save(vcpuA) which stashes pcpu0's MSRs into vcpuA's vpmu context.
> ... forced saving would be necessary here. What's necessary at this
> point is only the loading of vcpuB's MSR values.

