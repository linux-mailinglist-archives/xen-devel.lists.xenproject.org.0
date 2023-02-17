Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959D069A35B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 02:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496833.767752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpQn-0007IE-Sw; Fri, 17 Feb 2023 01:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496833.767752; Fri, 17 Feb 2023 01:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSpQn-0007G7-Pp; Fri, 17 Feb 2023 01:20:57 +0000
Received: by outflank-mailman (input) for mailman id 496833;
 Fri, 17 Feb 2023 01:20:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTmJ=6N=epam.com=prvs=6412cfc5d5=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pSpQl-0007G1-TS
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 01:20:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50605a11-ae61-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 02:20:51 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31GHnX1g007014; Fri, 17 Feb 2023 01:20:35 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2042.outbound.protection.outlook.com [104.47.11.42])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3nss7rhwq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Feb 2023 01:20:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DB4PR03MB9385.eurprd03.prod.outlook.com (2603:10a6:10:3fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 01:20:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 01:20:31 +0000
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
X-Inumbo-ID: 50605a11-ae61-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROjgkqMMmuin4U/ptMVaxKP2RzZ/RAjPrFYHnc2pacIgf2CgDmyg7AkYKbxS3YBjBLxuDxO6O0COSS8km4xkmKPpGBCSFobcGBQK9e8lesU53ORfLJ+/zHZTH+jWU20DeR+gEXPAyndl9CVEiaGr513DRroOCF2q34LqVotTTsqenZl95pKlLu8wHPhhUJ6xvA4GStqKHWFauvGPOJxwI9c6uda4SwAVkR8nxaLknPS2k6kQaarR7X92Lw7JwEH4Ii/Zb4CjFXNUxyOFUjEat0CowubZLo4ETEfAzD7p7QlRnWEONJlo/z6PeGImBhMgnYWge2wnEn4xb2dNuz+fbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fNDbS5wRCEYx1LoxfhMr/zCSSmLAzvIcCA6XdVAClM=;
 b=Bmo9T5NuvtQ5x1xcuYWHugkoxaFNhl1BSq+hM2ziJdZ8nP/kgzPouEkW9DuPQl3aV0DnljjFdNc0NF1reSf9/TWSsin4mlxF1qy9W/TkCsFPt0ZVBhSwFhGjnAyyHLBlDfgiWR1QpEyST1oweZqFWPTtpEXx4Y0ho9KextV3XowRVx2heq68Yo9kDM7jHvX6P1ktf27hQm9zkvSPgnuRYgttjYFcyuYcKkupCZHOmJ86v+5m8FHu2zn7s2CcGpK1z8bbfw+wnAaBa+hRQpdBkJeqAOyWi7vi41ZC6omSJfSMz7yo5tkne7oiI2oeGL+YxhG25xoa4CIRv126Jnzj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fNDbS5wRCEYx1LoxfhMr/zCSSmLAzvIcCA6XdVAClM=;
 b=L7aOeKm1VewhVjGp38OQovltpUqvxDlYPBT+SzQ/JJxZJXGe+xsEaf9a/LIKJuXq8CEJlYlm9OWYnqYyX3PO1UxtpBc/Pwu1+K5Qgp//FbDforMFE2S4gdgyo2REL6uIa1Nfhju/YeuE4YDvL6yBzTNko8j72P8x3FUGHKDxZdtMGKnvQ+TqkmlPPZhFZZqABJuoPHdZHasDRve9U6rDFghVfqIyavYUqk2lm+KpowyD6a9rQzx8yswKSOCqZ/vYE/yRtAdroHH3Ahv1/F+671w9DKcScXKePP1przUhBZeLN1k7x4OEZScX3R64nn7uI4Dmhj5DtXTP+kJ36l1JzA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Thread-Topic: [RFC PATCH 03/10] xen: pci: introduce ats_list_lock
Thread-Index: AQHYvUN+A/bxwqt+90CvUR3e9vnmcK6ySQOAgACK4gCAIIy7AA==
Date: Fri, 17 Feb 2023 01:20:30 +0000
Message-ID: <875yc12ile.fsf@epam.com>
References: <20220831141040.13231-1-volodymyr_babchuk@epam.com>
 <20220831141040.13231-4-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2301261541420.1978264@ubuntu-linux-20-04-desktop>
 <97112cd2-d16e-6c9d-7c3d-a3fe5ab76125@suse.com>
In-Reply-To: <97112cd2-d16e-6c9d-7c3d-a3fe5ab76125@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DB4PR03MB9385:EE_
x-ms-office365-filtering-correlation-id: 94b137c0-9ab7-43a9-ec90-08db1085290f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 79nyELwLJ2uKX5NHHzI4X6R28cYLoGAOtdEM4lDDgscdpz0UtGq6in/Q6UHYpB8mWRK253lU++dopbn/BvYljRon6S2MhmxcEXJS4RyfGgQccOIb+NmwcOnNgZWpXRXB55ANU0uP/UYcT69gJsYa/SoMpmLPlALK4GxjTQDZoPN2vXeSZ99R215ciAc3nGnXGCjAK4XPoOwBGT5lm4CxkbSiJrDpmn8nm/1tBHQ5CD3Y5+kD1XQsYPfKwxKY4uj0ISKrS2BLWvp3ljG8fGpScQgQ76XXqFSqI2sTu9S+aDfSZlCFQaxPXX/ACMVZ7teYt2sgx77rRMo+QcYmKAl8VDCOPGOrgsdxZck85URpSzFD1er0jJzGwlfevAmQ/I3NTLXUN0Ox1jCfM9I3ItqKoPJg3SOhSXGEojJHl/5vuQ6eymDCcyQc6oHruavRlZ8jH+ykB69+uF4PAGdQUVNxeS8E+zOH7WGmg6wN/szRQlGDNEDKIuIZ73Qz3OFnscHE3XXCnJ76EYC/SI+BiLBD9j4baidwJPj3IswZrkK/oAVjARgA5P3C0He83myfN8mq2K56/bO+Tbf0jGAc0LO3vMVwbDc+AMrrG/1Y7ZB78YMHMdFwRYnJNv9iVxiaiBBVKozXVjRPAAuRvdab8tglnFc7fcTzzo4PuM4uLaFrjo1BTnlCztL+yzFG78ProksFHoH5iz3BSZIUP7lfcm1Aqg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199018)(71200400001)(36756003)(41300700001)(6512007)(6486002)(64756008)(66446008)(6916009)(8676002)(4326008)(66476007)(38100700002)(66556008)(76116006)(5660300002)(2906002)(66946007)(122000001)(186003)(2616005)(6506007)(55236004)(26005)(53546011)(478600001)(8936002)(91956017)(83380400001)(38070700005)(316002)(86362001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dUw2Cv04+uaRdaVP7NLn6ymi4j07Kjgj3Vd00RFtk0x9s2Sf0lCWmIcq4t?=
 =?iso-8859-1?Q?y8bDIhK17bSnBTA/9FxC47YwlPt3SJGgm6ZkBZMy0yQoCoKIDVjj1TNvw8?=
 =?iso-8859-1?Q?MM+SihPx/6jruYbX7+R+8Z6od3z8dIlVgXmXI9EzE0/dHUwtyvu/jvRR9g?=
 =?iso-8859-1?Q?//rn0+yuE0QjSzsjE5MW2GGx9ESBWonkjFZfEtwqM4r1HgoUErd76JYnyw?=
 =?iso-8859-1?Q?IL/A1Fuw6qiLZx545HxGIUjhPyaeUbcmvRJaFs/EEGvqD2y8tEZ+twi9fb?=
 =?iso-8859-1?Q?ojvUdNUfL6lvMcn5MrQecKCEiMnfGUeGhtwK/7YCjpWOaXvsvLC8kXrlqe?=
 =?iso-8859-1?Q?Ob4nn9R+M8DJJ5zfNzABZCeb6iJcrO6wejV/Ks+MVlA/Ms6u/2q2Zvrhmc?=
 =?iso-8859-1?Q?tm5IpXjeYGR6zM9YzllXJh6zh87yt68dZkMLGPMA3S8CHGFa2gmsNpSY6Z?=
 =?iso-8859-1?Q?/VGihS8SWoDj6WQ3UyIwRtjC4sQU/szB6MBjyDckeRlYkJ8sgjdzIzL/O0?=
 =?iso-8859-1?Q?cC6e++foDOpy5XmrVRq4ArP8jDs2GYi9cYGpyum/8tdqtbFAypXKgEV5aQ?=
 =?iso-8859-1?Q?FSvH2lFfVS//Ht6ewsbCdhYvs2+qZrneLbI5d6y1xKf9XdOnwFZuFGIQfA?=
 =?iso-8859-1?Q?u3r9zvZXkXyEIx/N2xCfq7MutqqZsvp0sAYKZfeneUxst1Ooqk3FM7ttTK?=
 =?iso-8859-1?Q?hF8BporQo9QdfWePuf1fDt6V9XgqbcdbXP0xYPYIOK3v4Prce4ef6P5+8q?=
 =?iso-8859-1?Q?c7+6iLpx/4yBZrFMm4Wuq+NvywhPzhX/kHjwnJIIID8iefp9+6qmJQiWx+?=
 =?iso-8859-1?Q?nryW9O3oH4L3ullr0lYlArd0AfD881D5aG7+bfgsdHG3lDAb+/k3Q6qS/O?=
 =?iso-8859-1?Q?9FbcktxfPR/x52g66E7rQ1YGd4D5Y9U+qmriPSZ+3wNNNpbcGbhCH7BEZV?=
 =?iso-8859-1?Q?4NsGJ2UgwIhACvi9igd3gkCBhmNdRufxNwjh0RDFeZ+Z5+pAt/dWo7dTIO?=
 =?iso-8859-1?Q?bQNX6NWhYSbiAXkTkHF3sJNUprsaNAkokqdnVLp8DiYBngi7u+/620tTug?=
 =?iso-8859-1?Q?s+khAH+Hed7AJ9XQDxxzdF5Bht+R9JZPqZEbEPt5O0gcTmrwyrELlAgoqi?=
 =?iso-8859-1?Q?Txqsb/RA9T/DaBzwrt8zuBsIJGvT1iXcod9n6paoBlQRgcz3tPlfqgncOs?=
 =?iso-8859-1?Q?klxTtTP+LZsP4+JNGSIuCWflZ1Ujfzd+yvLOCnC5G9QOc8wAFVanVBUkCB?=
 =?iso-8859-1?Q?jaoqakyUELAY3oUKIFqNxyoDEJYp6QqgsOAcS6Lq0qA1pisAAdQG5q8Aeb?=
 =?iso-8859-1?Q?1asyzp/HyjMebh45lfHsxeZLuCFQ+ZvMk9RxCSlqBouiFovkiJ4JazjzoT?=
 =?iso-8859-1?Q?lH1qT5JOH3rnLHqPWeMOIthIu7tW3PQpdlO7eojfQ6ME/3kYjdMdVrxGqP?=
 =?iso-8859-1?Q?M/WZosLKOfpFQCxBje2UGwLv8CapmCJW+0pR9o+Wa1gJRB0nrOuLuLqpFE?=
 =?iso-8859-1?Q?arYXKMOSBqMmsBQ9kdQpd2Yd/jlvjpS2Mre7WudvNh5hJA4mUJNvbwIBII?=
 =?iso-8859-1?Q?nPPTkavNh+WnjD7Eed6KrLryHfIgAxBoH/eQelL02NFBYHSleN7ihkfr0r?=
 =?iso-8859-1?Q?PVl3GE+w1X52/M3XMVxl6DMH0G3LxcwcWOa8eaAGnmc9zpS9cUbE2QjA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b137c0-9ab7-43a9-ec90-08db1085290f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 01:20:30.8505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7yPZ2S9nhn5klxY7oEpGwe178OlKdAv9ONLtZndMByR7K83igqqn8a+2UubbFiD2bHglgpNid49Xv5Vk1rMPmcLeUswVnC1ZSOx5dAEm/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9385
X-Proofpoint-GUID: 92E7aAKq8DAW04lZ_IjYa5hWLerFnOnY
X-Proofpoint-ORIG-GUID: 92E7aAKq8DAW04lZ_IjYa5hWLerFnOnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_18,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=740
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170009


Hello Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 27.01.2023 00:56, Stefano Stabellini wrote:
>> On Wed, 31 Aug 2022, Volodymyr Babchuk wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1641,6 +1641,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain =
*d, struct pci_dev *pdev)
>>>  {
>>>      pcidevs_lock();
>>> =20
>>> +    /* iommu->ats_list_lock is taken by the caller of this function */
>>=20
>> This is a locking inversion. In all other places we take pcidevs_lock
>> first, then ats_list_lock lock. For instance look at
>> xen/drivers/passthrough/pci.c:deassign_device that is called with
>> pcidevs_locked and then calls iommu_call(... reassign_device ...) which
>> ends up taking ats_list_lock.
>>=20
>> This is the only exception. I think we need to move the
>> spin_lock(ats_list_lock) from qinval.c to here.
>
> First question here is what the lock is meant to protect: Just the list,
> or also the ATS state change (i.e. serializing enable and disable against
> one another). In the latter case the lock also wants naming differently.

My intention was to protect list only. But I believe you are right and
we should protect the whole state. I'll rename the lock to ats_lock.

> Second question is who is to acquire the lock. Why isn't this done _in_
> {en,dis}able_ats_device() themselves? That would then allow to further
> reduce the locked range, because at least the pci_find_ext_capability()
> call and the final logging can occur without the lock held.

You are right, I'll extended {en,dis}able_ats_device() API to pass
pointer to the lock.

