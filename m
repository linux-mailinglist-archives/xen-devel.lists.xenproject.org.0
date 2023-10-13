Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F97C8CCD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616845.959130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMab-00048R-GT; Fri, 13 Oct 2023 18:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616845.959130; Fri, 13 Oct 2023 18:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMab-00046Z-DT; Fri, 13 Oct 2023 18:08:45 +0000
Received: by outflank-mailman (input) for mailman id 616845;
 Fri, 13 Oct 2023 18:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3A4Z=F3=epam.com=prvs=465081a231=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qrMaZ-00045B-AN
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:08:43 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e752ba-69f3-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 20:08:41 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39DHnQnQ015687; Fri, 13 Oct 2023 18:08:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpt0cu5hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Oct 2023 18:08:36 +0000
Received: from m0174676.ppops.net (m0174676.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39DI8aD5021929;
 Fri, 13 Oct 2023 18:08:36 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpt0cu5hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Oct 2023 18:08:35 +0000
Received: from AM6PR03MB3701.eurprd03.prod.outlook.com (2603:10a6:209:39::27)
 by PAXPR03MB7633.eurprd03.prod.outlook.com (2603:10a6:102:1db::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 18:08:31 +0000
Received: from AM6PR03MB3701.eurprd03.prod.outlook.com
 ([fe80::25c9:6ae2:4a01:7a7b]) by AM6PR03MB3701.eurprd03.prod.outlook.com
 ([fe80::25c9:6ae2:4a01:7a7b%3]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 18:08:31 +0000
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
X-Inumbo-ID: 89e752ba-69f3-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwdlv5QMMfPzHZQk1okVCSZRwkr5hQfyC6vFKonXwKRe1Ku1yqI9Yv89oLBPg1n6QIEoEhzgjDnTyr91yC0iN/CaWFf3cHtG8pY2QNLNBa1vKK8b1eUBfUugMF3dEHsqIFG8UDges6gTDOA6PP9UrPTOPurkk4iDJl5PshBfZf3tcBmqNsPsaNL1mAfZUs3/dUewg/qjCYjTpDJeiR3K3F9epSG++OHf070WYVDSUghdIv2F0cmjVuDFvjjlf4uYAFhp6JNtVOAUavLA7/vkBlQyJuJt+46lygzwJENV36pJ6ob67Wmm8gKo5E4Y8hR+QJjjGvkVTADnpuKI3eEZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5lYfFSmNz0h5khXHvirrnIHh4xemtmov6rWyh5Uqtk=;
 b=kwDQYK7uxkK8/YP+mu5Q2j9u3WQ4v3Pa5IHYsM5j8xpiC9HUas7cfhTKqjlxJ1nDLabeZ6oNtrP6scEQIzGdhQezAObLl9QdL677j9CmKj+piw1Gx9sBd7l1FR0KIKobE43+P+uajzGPrIIZZbd2dJnvBc6L2LChaF5nWHHNPNXicNrI/t96K4Xv02gSN7UDrFLl+Eieiv4oZYE1XM/wklVjfL2dU562VkOYYXediQMRl30s6paOvasSqx91SayuhW87z7NTOt+fGwEzw8Z9QnBHg0uA/jGN4wfMnwM9Mh1FVM8U9OHCigWg2ZRf1UR0YJDcihqe0uOoRoN9eKHBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5lYfFSmNz0h5khXHvirrnIHh4xemtmov6rWyh5Uqtk=;
 b=QveBy2iFz8eoXfunel4g/8NdyohgCX12hV2syFrhCFfRtwN+/tXlEW1ej+e7vPPtZJlHnyju3owgXsw5CLje5YIW+NS0QBMPFT+bwib4NL7OCPW0A7p2a/utSfNX7nyiSlVW2EGOB50n34DLic1uEDUGXoMJsN5cTcIHziJCwl1kOeG6gjV1rtoS5wC1T4DjcrsIXPZmvloqXrdCQIcGxF5MmH1LhZw4LlXvI0YpyLTClEZEmIL/JhcmSzrCh/FN+1P+KhFZ6tn4IN1JOnddb56LbAQzU2B04hfC8Gu1AJU50Yo9t5/m5GaXugLLbGUgLVIOXNlaoyviIfZZkpfsnQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v10 09/17] rangeset: add rangeset_empty() function
Thread-Topic: [PATCH v10 09/17] rangeset: add rangeset_empty() function
Thread-Index: AQHZ/Vi+5V9BMbiD1kqnOLtHs/D1y7BIAg4AgAAC2gA=
Date: Fri, 13 Oct 2023 18:08:31 +0000
Message-ID: <875y3a8kf5.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-10-volodymyr_babchuk@epam.com>
 <73c3c6ff-20e8-4ec4-a159-b60e6b906dfb@amd.com>
In-Reply-To: <73c3c6ff-20e8-4ec4-a159-b60e6b906dfb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3701:EE_|PAXPR03MB7633:EE_
x-ms-office365-filtering-correlation-id: ac52f716-0113-4e7c-02fb-08dbcc1768bb
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +zniGvV9AfE5NQ+9Y2IH5LRRhvW4EGjci1aaVZAMeo0M3wIx3KRTm098I7IWtXc4ZBAK0jNyhl2T3HPczQW24pmvBEWDKQPJXzKK5Mjim9QYCd3Q8vDy6J4FZvPwhqExjxt/Lx66ibzpCBHPwIlH+EoDpLJ3R1OVNL2E4IAMw5v93Q9XzzhKUFvlGAbmes65ESqO0MZ8Swflv1BH/sVfG8dAWC3BITXhg5TKHeFawTTWKZ1OnyCc9/X6yUakZyXTf5xeuJWen/YlYAX98PXca4civ1fnE/eLoHT25xvBj88n/BrWEpWZ6HaBHxCv91TGL+wckq+liAqSOwNpmT8ztkjradxGxD8DR2NXlj8usprGJcNdboDXQftP+zNE7OFVwSygqBuCDtEGdH2vyqwR45dtt2kb7Kx2182FFhObVdDt2t12PanaOABnNTmshO53Udb/IWs16If3cZKdPbSlbxaCS7FlRHET11kauAZ4bLC38yEowIVtEg2kTiEd/NIIQm0rMoK802LoNkMHdDOaWG/f4ON3mfYXn+ze5SJDKhVUOwDKuzRS9tUm2g4I8keBB1oXwidzixi6DH0XREHgCGGX+WxOmIh2nD+zp4dL3wPsgoPxS6mpBvl1XfSpsi8t
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB3701.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(38070700005)(5660300002)(4326008)(41300700001)(122000001)(8936002)(8676002)(86362001)(2906002)(36756003)(53546011)(478600001)(55236004)(71200400001)(6506007)(6512007)(83380400001)(2616005)(26005)(6916009)(316002)(66556008)(64756008)(66446008)(66476007)(54906003)(91956017)(66946007)(76116006)(38100700002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?XQnqr9+FFjV+nAHPiSqBeQIleExGpAZ4z/NxSrqdyYr67iQoIHdr7l55Ei?=
 =?iso-8859-1?Q?dki9W3fkbjm2lFnBY53J8uDFwcdg+DD/cpr0Ugh5V5hF7PDwce9eEARb8o?=
 =?iso-8859-1?Q?q6cGwVTQTI+Mw28haj3Kkcaw6jT1l+WdASY0BXKvTUdk/5ebqgppMU9mF1?=
 =?iso-8859-1?Q?RJWDbxyRgDId5jzNDPdDJKJszmV1j6Kk0Y8byB6JBqplqMaRexs9RQ86dW?=
 =?iso-8859-1?Q?RTCHT3x7ipO9Ub9AI7nxwhjgUuN+28gvKn80IVEPiATGSqm7CbkJgmCSh8?=
 =?iso-8859-1?Q?RRd3CzLBBgVFFEBNkYkHPEqHCILvJTsZSUF0C5ejDyy5ttsbqxOE4AcRMa?=
 =?iso-8859-1?Q?ngTTyXYDGpSMuZD4clhl7bXPLWpIO14uE6TdEK4h59YmOEwrQaqFEAefQ9?=
 =?iso-8859-1?Q?gyTPINb/xbEECHpBYYG06RQ+SkVf2WbGrolAT6nZhY062fUA+IZEnU06ZB?=
 =?iso-8859-1?Q?VxBTytP5E9UB472nU4BZd+7+ov0mRyxr7j9rOAXC9Aax2F5z55DfHdC2He?=
 =?iso-8859-1?Q?ohVCzteV2whZoi80xXl+OXNsRIt0Ld83EsJ25Y2mNxmcIwrpoyoXBPqLw+?=
 =?iso-8859-1?Q?h/xvmwLYgUztpFWoo42ru2vhEL0PZqQELS3wWztu0r4JoUWCWhD4jKiRpu?=
 =?iso-8859-1?Q?UCGPkrOjNJmC1dbp7/4JBkgLWSwpTfy2Y/Pirs9vKgBgD5mtye3oqBtvtB?=
 =?iso-8859-1?Q?TN5EieuXFfOHh3jgBHXWnDBHsuuDwHe3sL7H0tt+KjF3xECBnf3s4rAewm?=
 =?iso-8859-1?Q?5Vs3ZqTLltQ1oeWP3JTgJOoo27pdczMbWgtuwBj1e8E7gn2L2se/MW2d/D?=
 =?iso-8859-1?Q?4DaqDGgULiwh+8DyOfOzZlCC/IT2JgQ7fQvLecCyqt9zjSmInUbaJm9/QZ?=
 =?iso-8859-1?Q?8C+BfhK+4Vy9L3TfS3Hb4w1jqyf9+gFCml7NuOLtn4H+FlwRjlcfL/mjQs?=
 =?iso-8859-1?Q?smgKPxVzuaE+W72Ax17GrsykzJKq0USUhszRZmSYbOysMm7iyfEdDS1x1c?=
 =?iso-8859-1?Q?/oB0jwTc0s1wEMmhnN5EW+14p6cL13p2/7UQ6g74lxmeXWSMZ6p25wFEla?=
 =?iso-8859-1?Q?XltHP2MAoU8gLJ7xl12EK0PPqATkyzjoCgmT5Y9o5woWMYd54AgbaBSbD0?=
 =?iso-8859-1?Q?Ks2BPOs2x1gW0Q2V3zSqFNjimXkYb+wI9/z6Mc9Jx4+POf3+UHZ5mTvbAl?=
 =?iso-8859-1?Q?nBh8QNSgotwKZ9M6BWgLsY6B0+PxLgTvbKy1XgMSiPRFEntBLy/ZOegOaW?=
 =?iso-8859-1?Q?1Ht6Im4g7qvVQfFZCX6nGfb7MxNqwg5degJYMFbEub7jihDtESn68i+CJ5?=
 =?iso-8859-1?Q?DdfT2PfJvacJimHzy0SuYdtGmqtOoKkBL/GZF/N2hYMOL5aEEJw2uedAaA?=
 =?iso-8859-1?Q?oEIHdxskMv8ziqjyBbVukStTLZaXMBiKlfuLA99AoRSwBoGegw7upvzzJE?=
 =?iso-8859-1?Q?sOyuzl6o0mKBePVnSdOQmdq2wLmJ/3g6q6MCOVIwmbufbKvXQmOrzXsdcj?=
 =?iso-8859-1?Q?O4lpxd/x1dExJmzzm2fZX++X51DW6xxJYEMotk9wCWXW9WK92HwBwKyGxA?=
 =?iso-8859-1?Q?Bis6SqGBlr2Hbzg8rOwpMKVGd/XBy1NxM443jFjha27YAq2v6LapRUtJsE?=
 =?iso-8859-1?Q?43vsjO6gceebv1/2nO8tq5R/Q1WIDxLJ4ac4kmFboIyCJexVMbzliGUA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3701.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac52f716-0113-4e7c-02fb-08dbcc1768bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 18:08:31.6291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MDC9uP7CvHwp/5S09kIBbAOu+ukxHvcbCI/x5xpI7ygJdIBeLXY/yvn1dFA+6IPbEp7x15LtYji+rgJHQ+g3ZpGju3lpcJ/LMXbpDCvvP2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7633
X-Proofpoint-GUID: w7YzfRVzNSeS-Dl2LwxEWOKyGAUKh5uc
X-Proofpoint-ORIG-GUID: w7YzfRVzNSeS-Dl2LwxEWOKyGAUKh5uc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=756
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=2 engine=8.12.0-2309180000 definitions=main-2310130156


Hi Stewart,

Stewart Hildebrand <stewart.hildebrand@amd.com> writes:

> On 10/12/23 18:09, Volodymyr Babchuk wrote:
>> This function can be used when user wants to remove all rangeset
>> entries but do not want to destroy rangeset itself.
>>=20
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>=20
>> ---
>>=20
>> Changes in v10:
>>=20
>>  - New in v10. The function is used in "vpci/header: handle p2m range se=
ts per BAR"
>> ---
>>  xen/common/rangeset.c      | 9 +++++++--
>>  xen/include/xen/rangeset.h | 3 ++-
>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
>> index 35c3420885..420275669e 100644
>> --- a/xen/common/rangeset.c
>> +++ b/xen/common/rangeset.c
>> @@ -448,8 +448,7 @@ struct rangeset *rangeset_new(
>>      return r;
>>  }
>>=20
>> -void rangeset_destroy(
>> -    struct rangeset *r)
>> +void rangeset_empty(struct rangeset *r)
>>  {
>>      struct range *x;
>>=20
>> @@ -465,6 +464,12 @@ void rangeset_destroy(
>>=20
>>      while ( (x =3D first_range(r)) !=3D NULL )
>>          destroy_range(r, x);
>> +}
>> +
>> +void rangeset_destroy(
>> +    struct rangeset *r)
>> +{
>> +    rangeset_empty(r);
>>=20
>>      xfree(r);
>>  }
>
> I think the list_del(&r->rangeset_list) operation (and associated
> locking and NULL check) shouldn't be moved to the new rangeset_empty()
> function, it should stay in rangeset_destroy().

Ahh, yes. It was a really stupid idea to move list_del(&r->rangeset_list); =
to
rangeset_empty().

--=20
WBR, Volodymyr=

