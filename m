Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7701458CC7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:53:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228779.395931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6x7-0007xJ-1o; Mon, 22 Nov 2021 10:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228779.395931; Mon, 22 Nov 2021 10:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6x6-0007tq-U2; Mon, 22 Nov 2021 10:53:36 +0000
Received: by outflank-mailman (input) for mailman id 228779;
 Mon, 22 Nov 2021 10:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=smF8=QJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mp6x4-0007sy-Nc
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:53:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb5f71a-4b82-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:53:33 +0100 (CET)
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
X-Inumbo-ID: 6eb5f71a-4b82-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637578413;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lVINQkzusIymJXSPS4DSgISj+a+dvId4yOUbMm6OilA=;
  b=AiT6Ob5b3VN5oOIFqQ9D63fu9S9NGJgikH90VfAmlnWl+ybSwAvGuqYM
   gRkThhqIDCwlOi1hj7hzxCJwSztZWF+4oqZgMIrJuaqIHhZFY08Pm3z4D
   I8afTGW3mDOoos6aHGAWJQP9I5gpk2SLZhmNE0BumwCVIiYws38QmpUVQ
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mutc6gOzyIWodEP8oGyiz/oKYCtIZ4DZTmX5axbw9f6l9AeRO9xiJvfXD3ZERNU+qQCIDyPrY6
 VPHyFrskEbkaC2DuLH/lyaySGXCrNDxP8e7Rh5bPnSDbuT1MVoMz25j9K3a4QP8cCaXKSx0ETr
 b7tI03dtnmKvXRIoOpP0W5EKmvZQ4onlBS3YZi3sXAwxoRW6mTZYZVw3MArkMpKg0QzWcC6JY1
 E4dV//pkHsAZL6+fpN9HeGTGVH9epgEHo6bNcG0QvB/ObK8lylIFHi5E0lBPFvSo9F5vOYFtvt
 L3Scs30lZiGr8TGS9R4igM+g
X-SBRS: 5.1
X-MesageID: 58367218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qqs78ajJSR1vJJJCni6r/fNAX161gRcKZh0ujC45NGQN5FlHY01je
 htvWWnVOPvZY2T0L94gaYux805SvJDTnd83HAE5/nxgQikb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy24Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0droyJFgR2IpbSxr4CeTVyKBNlL4NJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t1psQQqyHN
 6L1bxJ2Nj/mcixRHm4ICbI5n/+2jWLEKBRh/Qf9Sa0fvDGIkV0ZPKLWGMrYfJmGSNtYmm6cp
 3na5CLpDxcCLtudxDGZtHW2iYfnnyn2RYYTH72Q7eNxjRuYwWl7IDoSWFigqP+1kHmXXd5FN
 lcU8Sojq6s13EGzR9y7VBq9yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBYRc8wf68xpWQc0i
 AWWtf/DPg50opOaHCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjv3jpTj6bySQSo8lp+LfziHeRSqb4wxwf+ZJjKT4uAGAvZ6swGt0J2RtX
 UToeeDDtIji7rnXzURhpdnh+5nzuZ643MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK51gOucULYCH2N/IvC25UNyjN5fK+fekJq9iONoYeCnSPXFHvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQxQcCVgW8mp85c/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQOqHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:c+3YfqEF6YHLCatipLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,254,1631592000"; 
   d="scan'208";a="58367218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNFXfYre0J9W2i2xi7u7x/aV6NNG7KeMUSTy59Z3CBXnbChXP8kHGzrUTBztRrJ7MhqmjinkrXl0sNDRmdgpukph8gt3KnFVntt4iT2SvJLX7Yi7zlIjinFHIMwG+ZN+iHFkJak1bbZSnMqiekSv/pXHlvtPIQrliqOQ84maR8BBSebACi6/w/2r24sOjoRAlVCC+hGFSbcdC2serFCvifa/rZI+AmdiCjb7MKkEEO6Rez8pptB0hjzYdUZhOMRDu+e4wXneAxKhpEYs/nFbpCa0ic5GX/lj90r9Q3UzsKdsoQTKiSZfX04phX8OmA2Nnc4uYOAaU8HsDdMKkiwJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgojSifz+Dxy5dmpQDWrcVCvVJk+JWpdGITHIcC8Vj0=;
 b=aX+9RAD0rxIvXhEXyF8JdYp5P2lfiHqMF0PRKqgD52c26pmaAXAOlRwlrTpWGCGLKqAp+jPRlEOcWhUhuWIeIn0nxOalGqA0biSawplD4LkCqjzCeLpt16Lqbj9tpdc0egu/Ubiv4IYbZqdXW+QEAGbtXE7otR1BdOdA4i2Z0utITXsqJsM70WsxoQnSpXGAaUg+ITn2lU0IMzvJC6vUxZn3LDtYxPMUmwZPBUmO2JjtCTp2n6pmjoYSE1QbHHh7j4V+SUoknUDmTQACKLZk4wFQPvjsQT3ToZJdg1t8xPcrqyzGAv+ztHRhwAwI1lxr9CZ32C4CU3WtGZ0fKkmieA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgojSifz+Dxy5dmpQDWrcVCvVJk+JWpdGITHIcC8Vj0=;
 b=gsCFHXs1voowtcsIeI4S8KxkkNQjM5NpGrbEY2/XCZYxhBKIyxVG4dCiD9Xpj/n4OD4TH8JzS2QGY5ohuaFE8+zI4hwCCw+RIliRfPjSPYk4VNWI6gcU+DNCQg2u0rM6Vi4r2IyYa8fgcxEbm/YsyC7zuH2AIDRbvBQ49erNX/Q=
Date: Mon, 22 Nov 2021 11:53:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Message-ID: <YZt2ov1o3gcn8/cs@Air-de-Roger>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
 <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a6adebc-45b3-4e63-f336-08d9ada65059
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:
X-Microsoft-Antispam-PRVS: <DM5PR03MB33717E37432ACCC56755A1128F9F9@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QoS1XZiWBb09kMs7VnZ7JGDD1xSx9qQaRqbvCbqpWA7Y9HMyniETAxcptdmV3ennxnyofWiznVKTVTtW0W0SZq+jbldH0XQ2wSIIdcz5veNJPAs67683AZY1t4rSMiVwyTPTYjtWIMDF/pTd7OExZ9kFiEqS0ijpPmsWcHYz4GdiEoPwiKXV75VVT0nuK6xXY4u5ippk6yFfcmJ0P+sYxXYlESJm75qTczOQSCdOr4BN4PVvz3leYxprziZQOJeaecZLEj6ljLI/TyVf7hTyC0SDL3F5p5/bFnSW7aRF/ToK4lrx7Bm7XyYAICm0SfAqSoqiF0CeVkNi++z/rC+Axs6ymgPHQ4iwi9HXXjPYcCFEGt9N7aqeXYVTfGXJjfJffjAbhHspeYaPrYb2z3GWJmsLiCqQUxGGIDBCuwyWzall2RP+ouESKluFZH991+YcszPBhrhDXAwMFxtnrhQGPEYvZXuoaXmtARE7L47MV2tRRIPW1kSz1YsNLc5HmX6HpJ40nSCUuRDFtR1kDqNPSx701OOZMLnAK9CMoaocnJf6hHaOo8/FkBt7pJ97d476MoFJ4BjMl8weRK1/taSm2vlyXbM9l09vaXI996Xm30hO6iojaTM7hbpaP2Y38q/YOGyE/yf2CrSzXctJoSokcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(9686003)(5660300002)(956004)(2906002)(8936002)(316002)(8676002)(54906003)(6496006)(38100700002)(66476007)(66556008)(86362001)(6486002)(6916009)(83380400001)(66946007)(4326008)(6666004)(82960400001)(53546011)(33716001)(26005)(508600001)(85182001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxreCtJN1BBWWZnbms5Nk9CSlkwak5VdEIzQldoeWM3NVVJeXVjZGZsTkdQ?=
 =?utf-8?B?MVYveXNTaTBiZ2FYL3JkeVQ3K0VKbTVkbER6T1JDWUQydjdxb1YrNitLMjRG?=
 =?utf-8?B?SnA2ZG8xcXRqL1JUQjBWRTVBL3BESmJiSldIdk5FNlVJcStQME5pUjlzMXR5?=
 =?utf-8?B?OW1WN29iSmxPeC94U3BHakNLQ3dGMHVtSEQxMVB1Y1pkUFpzUnBCMUh6VjRu?=
 =?utf-8?B?bXVpTnV4Unk5Nm5ZZ1E4UDB0UHJ2c3BXd3pOcDNtRGVyVXNRVnAyV2VrSVpw?=
 =?utf-8?B?MlVQbGtmOVZ5RS9EOUhwQW9Xenp4TW1PUmlDUkc0bUd6dThzUGllRzIwOVRE?=
 =?utf-8?B?ai9yREZ5SGxZSG1UZ3VJVUpQdWIzVkRzc1ZoRk5LRXFHUFVoQ1ZMKzdVeDR6?=
 =?utf-8?B?TE9DcVd2dE10N3ZuRGNLVlVhREZrYS9YbUx6NUNvanNyc0xXdzZtQm9qUVdz?=
 =?utf-8?B?RDB1VlhBVWs0RGpMbXF5SjBoeXpmUDJpd3ByYzdnTXhMSEFoa3FXQ2xMZ2ho?=
 =?utf-8?B?dTdocWZDdWtVYlBjbW01L2RkWkRLT282MUxpNU9qM2JTcWZKa0FFTGt1dm1w?=
 =?utf-8?B?dCtSOGtwMlhvYnRDRFlXZXFvTmVGTm9XdU94N0tuNHk1K0pmei9tdVVrQzVD?=
 =?utf-8?B?U0lZaGpzYWFMdnMrS1hZUnY2YkZCYU0veUdoV1NQcmtnZmVlY21TSVdMeDBv?=
 =?utf-8?B?SHVlOHhoMlNlcjYrMHFTaHVIVElONXNmclgyMGkwRFFnRFkwU3N5UTZzeVlB?=
 =?utf-8?B?NnR2dzI0MkI5WUdIZzc5UWtzMkd6RmEyZXB2UDNaN2Y3blJleHdIVXRycFFL?=
 =?utf-8?B?MEZYRUV4bkZEQ3R3bGRHajRVNjBKcVl0VEtEQmpIZzJmZjdRV3N5eU91clFW?=
 =?utf-8?B?SHlRRGJTeDlvV2lkd1BlN3BZTVQvNUV3cElxMWtDdjdDVm13YSsybmQwbTZl?=
 =?utf-8?B?d3lSakhhdDk2dHZhaGpYanhobXNHWEJKK2ZhbGJwbjFjU05aZkpLRTNjQTkr?=
 =?utf-8?B?djBjcEt6SktlZStiL081bVc1djRmWWpxTEJmWWdWazlzRGtyZ0oxM1I5VzlU?=
 =?utf-8?B?RGs5L2F5SXUyRVFyYUdNUk10N3RBMXhISWNzeHRNSzZpYXVZRzBxTG00QmRw?=
 =?utf-8?B?MFI0Qmk2T3IvcVBsQjBNQmtsZkFhTkR0dVUveUJmRkxwL0JRMVNkU3hrQjZS?=
 =?utf-8?B?LzNNeGRlTlAySnpnakpmV0dablgvT3NJbks4TlVVdmx5cGg5dFBBOExQZ0FL?=
 =?utf-8?B?Y1pobldyV1haemVhZ24waDhZNjBybXMvSm5wOVV2cHcvOVVpT2M5TUwxY3Nk?=
 =?utf-8?B?Rmo2TktPTEFRVHJWbFQvcENVeXdiUFppNUVUcUUzU1BNRDB1dExtZG1IWmFI?=
 =?utf-8?B?TjVVOHlaa1M2N05JNE1IdGhGci9sNGdBbTVuM1podEhEb2RCazhZVVh6MTEx?=
 =?utf-8?B?cE1HSG1tZUJvb3lwLzVVaEFvS25iUUY5alFlK203QktNa1ZTTkZmSjg3NEpR?=
 =?utf-8?B?aXJEVlkzejAyRXBUbnd0U3A4TGdkd3pHSGtBZUpKU3VHUmw2YVZ4bGsyRFBl?=
 =?utf-8?B?d2xObDMrNkhPU3hNbXI2c2V0WlRWaGtUOEg5b1lWSUcxSXhzN0dNeGdYaDVK?=
 =?utf-8?B?NGVnZi9IRjhMS2VIQm12VGdNVngza3BtUWZXZUF6cG5tOCt4dGNDYkVQRGNX?=
 =?utf-8?B?WHpPZHJxRGlvaVpGZklGRXFlMHRxVjhkVGJNaUNRSjVCcFN2dktmb1pTT1pU?=
 =?utf-8?B?Z3JxNGVCZWNha01jZDBGR2VFVE1XcmJqNFVjYmJvaW9lOThFZWNhTEJ2RmRT?=
 =?utf-8?B?bmFqajlVRGVvVGhjNlNub0xOLzFtRFJVaHp1dlA3QkFTbHp6ejVSdWFhd2Ru?=
 =?utf-8?B?QzlDNmlXREM3VWtkak91Nml5MC90WDNMYW5tbmlNbU9va1JGY0h1WDlVVEpl?=
 =?utf-8?B?SGQzckQvNnpoM2lKN3ZaUDBaZzQ4NVBHbTE5MldIR0dvTGhQSnBFK3BaTFRV?=
 =?utf-8?B?dEpZNkszTGdyZTJFSjQrNzBNSnY1WGpLTXNjMERpNEw1ZmRjSzVGZCtIMUdO?=
 =?utf-8?B?SSs1bWNKMlg1NURFU1NaSUxQeGhrY1RkK2JzdDFSREl3eG9NSzBrNFlMaERz?=
 =?utf-8?B?K1hGWDBtYmQyaGp5MUNwd0JMdkV0SHVuTTB2anlSVE93L2psZFNSUVVZYXlu?=
 =?utf-8?Q?0EUlsa8NBtpLzPpkpIdzs2g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6adebc-45b3-4e63-f336-08d9ada65059
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:53:27.6054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODxgeb9Eov3dt1CILmhuQ/czE1TkKZIDJKiQ2msxYo1yAioybDGNyFIlituZwlGH1MVbA8Jiy1qdjvpKbmDcpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Mon, Nov 22, 2021 at 10:50:18AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 22.11.21 12:43, Jan Beulich wrote:
> > On 22.11.2021 11:27, Roger Pau Monné wrote:
> >> On Mon, Nov 22, 2021 at 11:28:25AM +0200, Oleksandr Andrushchenko wrote:
> >>> --- a/xen/drivers/vpci/header.c
> >>> +++ b/xen/drivers/vpci/header.c
> >>> @@ -206,12 +206,16 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
> >>>   static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>   {
> >>>       struct vpci_header *header = &pdev->vpci->header;
> >>> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
> >>> +    struct rangeset *mem;
> >>> +    char str[32];
> >>>       struct pci_dev *tmp, *dev = NULL;
> >>>       const struct vpci_msix *msix = pdev->vpci->msix;
> >>>       unsigned int i;
> >>>       int rc;
> >>>   
> >>> +    snprintf(str, sizeof(str), "%pp", &pdev->sbdf);
> >>> +    mem = rangeset_new(NULL, str, RANGESETF_no_print);
> >> You are still not adding the rangeset to the domain list, as the first
> >> parameter passed here in NULL instead of a domain struct.
> >>
> >> Given the current short living of the rangesets I'm not sure it makes
> >> much sense to link them to the domain ATM, but I guess this is kind of
> >> a preparatory change as other patches you have will have the
> >> rangesets permanent as long as the device is assigned to a domain.
> >>
> >> Likely the above reasoning (or the appropriate one) should be added to
> >> the commit message.
> If I fold then there is no reason to add the comment, right?

I find detailed log messages never hurt, so in the patch where you
squash the chunk below I would add that as part of making the
rangesets permanent they are also linked to the domain struct in order
to properly track them.

Thanks, Roger.

