Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5A37C33F
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 17:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126304.237768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqdS-0000zJ-Nu; Wed, 12 May 2021 15:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126304.237768; Wed, 12 May 2021 15:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqdS-0000wk-K7; Wed, 12 May 2021 15:18:54 +0000
Received: by outflank-mailman (input) for mailman id 126304;
 Wed, 12 May 2021 15:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kryu=KH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lgqdQ-0000wd-Ml
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 15:18:52 +0000
Received: from mx0a-00069f02.pphosted.com (unknown [205.220.165.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a13559d2-1dcc-4c39-9e02-8759909ada77;
 Wed, 12 May 2021 15:18:50 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CF7Pol031093; Wed, 12 May 2021 15:18:48 GMT
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38f5a60rat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 15:18:48 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14CFIlGB021347;
 Wed, 12 May 2021 15:18:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by userp3020.oracle.com with ESMTP id 38fh3ybtfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 15:18:46 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BL0PR10MB3443.namprd10.prod.outlook.com (2603:10b6:208:74::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 15:18:45 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.025; Wed, 12 May 2021
 15:18:45 +0000
Received: from [10.197.176.85] (138.3.201.21) by
 SN4PR0501CA0072.namprd05.prod.outlook.com (2603:10b6:803:41::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Wed, 12 May 2021 15:18:43 +0000
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
X-Inumbo-ID: a13559d2-1dcc-4c39-9e02-8759909ada77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=A5QowtbcR1EFbr4jpvs/s8X6mu2U4K9MMKXEXbSnIfY=;
 b=CV5HzRJtadXrBrhIh2neR4k0LbEbza6IDJ3q3zAZA+h5wrwY/6IgUPMPB6Np2xNk6/NX
 bMIZZa/UOoap6Jk6S4s/NJ5fOc5g5CaF1lwlaVFzbDHq7SymbGurWxg/AI699C2DXjpj
 0PdD/ZI8Yz6r3uCr5q3t+/HFgCYsWoR/4y5I/lxORITiR0enDxxjC9yTZDRBInZP3hhr
 3J3tUj8pLIZJCrxpena80mHCGFi4+fJd2U0dBbomDwlU8HMQoL0xbOtTStB4oTcijJbQ
 0kg8PYXuF78+XnUtZurt5aHDLimvSot5qgyfIo6KpgXTdNnHrNhard+mEVep9Z5VqFLS nA== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaiSQmqY1GmkLz0tRlKXhx4kXJ5+pkXvwzRAnQnYuoRihVIJeCQW+qduh7u2Z3WaoZGEQZ/qOEPhxQK4COS5ykmANT24fOQohAmyKnDTif9oQ3Iy9XpDL8nXem6CWuULVNP7RH0VM/J4hWkqD989+XTgsC1yOF6pLl46TwWsUAHT0bdJDALf9N+RYH3+lUGx3Jz/2SRnOmyIW+vob2Zpvls14CE+C7cAvSj2ZXyXTy9Muu7/qxsebmUU2wBMEXvYDIswmypm8xdBq7x0hO2FZD7lhzfOwxGnddmIRmxYSSl7EGNKASU6X07q0LupzRc+1izyHnIi3UmEunMAgXnDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5QowtbcR1EFbr4jpvs/s8X6mu2U4K9MMKXEXbSnIfY=;
 b=EaH/wr08aKwsC7AKEaIbUSUF5ehfiq7qfTYT9A/MpUI231OS/SsHGhUArbgROMg5FXSR+rAa/T8HVttDQNewGiFHypJkV9nBopq1fqJ5IQJQ33uV/d41guX/IxKj57FEOI3sD4tkOf9oI2YLTV+UI2a7L6faQC672fCGcIQUusN0PsgB45AJw0XEnurXt6CeV4/SejZM0MNlcZqWeZQcI26UdJLS5w3mozy7PyV9RpSCwKGhRKXDlzKIQqX1soNuofIAQLzDeZturOQbOqE0Cj4kHxvYK+oOEl+I2GjPBRG1aixpPa2nqZco4gDFTPZjoQpdo+GfQspVGAE4oA/3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5QowtbcR1EFbr4jpvs/s8X6mu2U4K9MMKXEXbSnIfY=;
 b=gzCx3bgUPUnIwe5uspjctbwN2upCnhAL8NpP501GhqfirTuPVGOMqXMrNHXKizysX7NkBeBundtZseOvk0ue+Uk1CuMElLIIsgz/JQRVtFHlcowZ3c0lmiLryv+Y56YLXuSLlmUbBpEE1NGc/pH0cYwO6Le7CsPBcaTbiHEZbK8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/3] xen: Export dbgp functions when CONFIG_XEN_DOM0 is
 enabled
To: Connor Davis <connojdavis@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <cover.1620776161.git.connojdavis@gmail.com>
 <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
 <0c1d6722-138f-62e7-03b3-a644e36d20a5@oracle.com>
 <20210512145831.gxmmlimkmnnb6zyc@ceres>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <6800c23b-7576-70c4-4862-6f84f23eaed5@oracle.com>
Date: Wed, 12 May 2021 11:18:41 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <20210512145831.gxmmlimkmnnb6zyc@ceres>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.21]
X-ClientProxiedBy: SN4PR0501CA0072.namprd05.prod.outlook.com
 (2603:10b6:803:41::49) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7926897e-03b0-466d-e901-08d915593bc5
X-MS-TrafficTypeDiagnostic: BL0PR10MB3443:
X-Microsoft-Antispam-PRVS: 
	<BL0PR10MB344341BDC6389721CF69D7F48A529@BL0PR10MB3443.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ogw4GsuzAtJ523VvnpdFfm0FpZIOA85cCTdlzG5gokUeirv1jKVi4DUGlKnkH9h7oYCwPq9rK15hLWTlW0qrWrGmSXyPv2FfqgE/3VbINZv7ZMberW/ENy9AciDBRsRGb7AkVgjyzM4Tlf04rj0Z/FmV9HFFTBC7nBetTevSvRXJViO09MGRLPP0IX1a12LgQxBt8DrQ1qsOQSi7ucFQoxijeOlVtTNHLbwac0sY/R5xCQjIOMuKLdOEt82iYd6SAmXgNzWAu/z6UiOcVxWSKphoHt5M+t9DoEBxdnKE6tihWF+hM6A86KrG8DdP7zGZ7dTZGAMPNScxtsoZWXqvFYHIYc3hG6fkOiLrdCpu067B/vXdjTukTsYoC5VaKzIQgCvRx5rrEBHe9xMNXXGMnyu8AcmOt3R4T//2H4yDwDDGCg/QTVFvphTy1UTKxjU2gSdpPfP0JVTajzckgiKAOt+KX0dtAlaLBuZuCMjRcFyUvhR/997n8O/zVw+OxmbMgWQQYbHbOWN8njWJTzTiMBvdnSirs+9m1vVB22PqU8cLV+dH2U90MfqOBD+XW9U/O6603YxK5BHtQqz5zn7CiM8oTByHkagVAhWNlpqvPupBwb0caMzJqYXxTfL/e0/kkuSHEyiqyRE5vxbQq8dagMRFDMDgTDTjRcRsbw9d7wvVterk+DuI8axCt+xUXBFX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(376002)(136003)(366004)(4744005)(53546011)(8676002)(4326008)(8936002)(6486002)(16526019)(44832011)(478600001)(186003)(31686004)(66946007)(31696002)(2616005)(54906003)(5660300002)(6916009)(956004)(316002)(38100700002)(16576012)(86362001)(66476007)(66556008)(26005)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bXlMVEpqcVlmZTFwODJDaWU1ZUVvTENNWjVhRmlJRHFIVnUyZUdxMG14dHNj?=
 =?utf-8?B?dHRmSW1SQ1htL0FZdkpaa2wzUTZzZFJOcUZzcXpNeHNxRm1pUXJEM0NQUDBB?=
 =?utf-8?B?RThuUk1RdlpvN1NWcGFvRTdyTkY4T2JGdU4rWFlLZzZKUERFTElBaXJQNkw2?=
 =?utf-8?B?d3F6N0NMQ3Zlai8wbDVQQlRqTS94QXVKUkZrWXl0VUpoek5HbkFuSGlsQVVM?=
 =?utf-8?B?NExLbGVIVzdmakpmZlkrNDlPdDBlUk1XWTVJNkZsMm0rdEY0eXJqV1JSNktj?=
 =?utf-8?B?d2praTZJMStDa2FFa0dIcTNraG1HRzUwM3U2NUJOQlBSN2h1R3NuTWYrenZq?=
 =?utf-8?B?VWhXbng4cE1xckFmcFgwVkphc3BQb2JLNHhtbFF3MnFHNDZnMmk0T2kzN1pS?=
 =?utf-8?B?dEhlbW5ia1dBNHZsTXdBbXdGWkZOY0UzY2Yza2ptcjFqOS9rUXZaT28xOERl?=
 =?utf-8?B?N1ZUdEFKNjFTMEFpOWlsaTBOdVIreWQrak9OOEtyVnUweks0aW5FOWJLdW0x?=
 =?utf-8?B?OFJ1U0R2OVg3QVB2cVlWN1J4a05kWjBLUDIxbXFRKzFJdEhTc2NISEpDdHUx?=
 =?utf-8?B?c3ljbkt2cHIveFVrVmhvd3JUVkZQQytnNnpQbTBBa1hpQkZ6cmthS2kzbnpp?=
 =?utf-8?B?SFFHcWlQQ3lzVmtHYnNWTVBPRnQvdlYxQ0xQS09jL3p1VkRJWDdkNU1JRG4z?=
 =?utf-8?B?NmFnSWpZR25VS1ZJeFI0UEs5R0hUN1dteUpiR29yWTJhYWxjTlZvRXNuQ1VD?=
 =?utf-8?B?cmZBc25uY0xBTlUxa0lPVkl1bXdMZ3JnYkQ1Uk8rZGtXZXUrdEw3c01PVzlJ?=
 =?utf-8?B?SGIwVDQ3YlNEbGZoZzE3a1pJVzVDVG5malJENHRTSnZqTmExUVdDOGF0S3pp?=
 =?utf-8?B?NnBvOElieFl6SEZuSXozWFRqemxmVEdrMXNsOHd6VktGZmRjeDFncmtManNS?=
 =?utf-8?B?VVRjeEZnWjVqMmlBSFFjREJxcW9LenF5bWlVYlp3MXhFeU9oc0VmbGExVWRB?=
 =?utf-8?B?NTJVWTdyTmtkN1AwSGpGSWVvVk1PUjZqTy9IV2Qzb29FTU9WSG1aK2xQeTlX?=
 =?utf-8?B?ZjYwUHB0aE1UZVFiaEEzaWdMbkVWbFJEUmJuY3NFSUlJZ2UxSDIwYm14T09S?=
 =?utf-8?B?dDZTTDFJR2R4WGJUamFhUFFGc2g1ODdrNGVwRGtRbDVpTWYzaXFncWh6L20z?=
 =?utf-8?B?amFrakM0STBGYkRIT3JoTmJBK3JGNlF3WWJHYkhJQjJPRWdHQ2RsY0dicEt4?=
 =?utf-8?B?QkFNdUlBNHQvKzJ1dXJucXhlb1JNeHBmK2JFUlJWWEpQem5vek9qVDBXbDg3?=
 =?utf-8?B?OU90Tjk1UGZCMmVRY01JMmo4dzBkWDNlQ1lFaDloMDIwQmVDMnJZb1F6cURE?=
 =?utf-8?B?SjdBVzhkRFlId3JsYmh3TVoyWUMrcldzb0VEOGJ3Z2E2R044L0RUTnplUFcx?=
 =?utf-8?B?eDIzV0o4UGIzUkdybnpld0hkUWJKTDRJenNsMTFHOUdIYzdwU1MzY3ZEb1V2?=
 =?utf-8?B?eUhPRmNKVTFIdU5pMlpXTEdhQmxJKzhFRG1jQzloVXFLNi9FZHFkVHhHRHdJ?=
 =?utf-8?B?dUZZMzAxcjdObnIyR0I4dFM3eFNxRGFpdlN0dEdyT3VBcDBBK2FvREhZY2M0?=
 =?utf-8?B?ajZXMjhrb1BBUG5nN3JHL0lUZzRRWVdUaVllK3p2ZjRtM1FURWdwa1BhWGVR?=
 =?utf-8?B?eWpWNkF6b1JNczN6WDYvdE5XR0pmVHNuazRaVXpXV3kzSDlNMUJKelNJWEtl?=
 =?utf-8?Q?uAuAxZqdFw/qWPiwWEzhEDvdLjqvROyXThBM8Qa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7926897e-03b0-466d-e901-08d915593bc5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 15:18:44.9779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqM1/F3eS98XM6GstrYsAtEJDpF8+xMFZo7bLnPq35pPQEaY5GV1gnixcJ+btr7+fxpjErkvmB8bACmLP4xno0wKqoer0njcWtXvp9hZjlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3443
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9982 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120098
X-Proofpoint-ORIG-GUID: QpEeMP2p3zBWbcC64QGY_KcmXi-z-wwp
X-Proofpoint-GUID: QpEeMP2p3zBWbcC64QGY_KcmXi-z-wwp


On 5/12/21 10:58 AM, Connor Davis wrote:
> On May 12, 21, Boris Ostrovsky wrote:
>> Unrelated to your patch but since you are fixing things around that file --- should we return -EPERM in xen_dbgp_op() when !xen_initial_domain()?
> Yeah looks like it. That would make patch 3 simpler too.
> Do you want me to add a patch that fixes that up?


Yes, please.


-boris


