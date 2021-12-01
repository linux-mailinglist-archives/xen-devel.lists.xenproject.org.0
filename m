Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB5464BB3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235811.409022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMv3-0003qp-E8; Wed, 01 Dec 2021 10:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235811.409022; Wed, 01 Dec 2021 10:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMv3-0003nm-9u; Wed, 01 Dec 2021 10:32:57 +0000
Received: by outflank-mailman (input) for mailman id 235811;
 Wed, 01 Dec 2021 10:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVdy=QS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1msMv1-0003m9-LV
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:32:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08b72f5c-5292-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:32:52 +0100 (CET)
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
X-Inumbo-ID: 08b72f5c-5292-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638354772;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4/KJDmkV7/fknd8EAfcOPQEXTcR+f4cCCYsBq8ueu/s=;
  b=YmoSyFEUc5+tTsDAbX7JE/Yuxj9nbhh+bhmL8aLRu9EL2ZgX5aOGOz/W
   sgP+b77nLdC9pR8zqE71amaTMD02oNtaRBQHtjlb77mMmxnHXt324swSv
   hxorRtKA0PidgSN32rLpbR3YjO6XBCYA/1NFXzDh5D3XY7+uMlOBu087F
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qVi957F5v/caiGRWMtUnGv1OZt6z9xVthj/Xt0108R/D8+UyGxfKOvfvh52nd56bx+H4d2Lt+x
 TsgYYNZznR6xNGQfJoCAJHYI2YgjLwhSPvg3NqSAhpvakGJbYfzyD4d9BbjSlI5C3IcHko83ZJ
 ozLcJIRw7cmJPgj9BWXQeSDzODlc6nx/d5CtwHxk9px8h1QQW1/y5OUhzCaj042zqI48O0+pel
 pMkxq3CR2ARN8fmq26NIrJ2tJ4hQNECHOu2dfnnwS3qq+wqOZsE18L1/oL47x6tXBiBtXtnCMz
 WyuYNCreV1bWjiSZIxJ7YQ+C
X-SBRS: 5.1
X-MesageID: 58951113
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/BnclKDAEY5QVxVW//Hkw5YqxClBgxIJ4kV8jS/XYbTApGh30DQCy
 WsfXmmAM/iMY2v8L95wb9mwpx8Dv8fdzIIxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Us7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pS6mhul00
 Np37qeUEgcmL7XIoNZCekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvWbuIYBhWxYasZmJ/TMV
 so1OBVVRxGdYQ0MOX4wOIg1g7L97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6Fre16/pri1273XEIBVsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdzOjj2e9uwYTYYFrN7Y65xCVzpLmvC/MUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalq1kqXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj71hu+aTNT8D2BN1bQ9xa0bRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoC75LN8IsGwieRoB3iM4ldnBO
 xS7VeR5vsI7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5HXlk4BCbKmOUE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVBhQwJIPXiSKVJAOURGpkbb+zD59zoWhiZX4nPEqy2mhlaoGqtf9Ne5wydLgh1epi0f8rE
 KVVJ5TeWqxCGmbd5jAQTZjht4g+Jh6lsh2DYni+az8lcp8+GwGQoo34fhHi/TUlBzassZdsu
 KWp0w7WGMJRRwlrAMvMRuioyle94SoUlO5oBhOaKdhPYkT8toNtLnWp3PMwJsgNLzTFxyebi
 FnKUUtJ+7GVrtZsotfThK2Co4O4KMdEHxJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbiquMIzglgG3mXPV2nBqk5fyuD1MhL8KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSCv+4oJEja5TNs+OvVWEpfCBCAlShBIeYnK4gi2
 +og5JYb5gHXZsDG6TpaYvS4L1ixE0E=
IronPort-HdrOrdr: A9a23:wPVCE6saMnthwlu5ZQQkf9bZ7skC7IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLnAbV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.87,278,1631592000"; 
   d="scan'208";a="58951113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb1//H2aUxvZ/DZcy4m+XChgUZqyZoTUw+NUPOo9dcO2nZ9kE9C+hBRUJDgCvih/lLOPdaunFWCevXRiTSoGDOkAuS0h4nzce6d/BBzxZEzA+EZVjiYQ8MX1oyHFaWW/oh70XtMQNNuCpzTFD4IfXsW1gkKS9N5Vk4RYeohmYND2PzYZEqDoF/sd3ul+ucbU9ZTAlEi38wiL5B1ajS5XjSeqklnL1ftTDNXxeI8kTwQn1OQToq6c5JhCQqEpjbXPBE0PGsoXJkhSSnb7Na5gPHjVMqyEnsewNbYAXztVVLR9Tzvb1R72/oY49auvP/D5c9IyMTX6b1mf/ggWSQ1BlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37PyeKgYhvIFssSMT8nrzg8OD9x4odjXUVAFtI4FtTE=;
 b=OKJgCI0xae7NOBLgnMKHmwMNsgWuuOHGI/McJNtmir0Wnq46z747K1l5pDYli06r43zsa4Lb+o/Rq4qG3init+9BZ9NIVVHA/d2w178Vt7Mn6ILWXHIC6+/h3HuPSfGH3N0goFlTE62mzlW4NQfQaijpmXIIt+wCHvn2HHP0ENI/6n+KbRzkEx6M7XGmNtGCONxLI3q5GHkhvLAaTOyaFifg1CKMejhQaWUXVFH5JS5EQj9VvQWGBhEa+M8aWRVQ1BvBRQtlZnagK/BPplT8TOpsHbUpWaCyYAWCzb6j8EkxQcp3O95+06nIPM9uy2ZvIA5i/1XLTgvETQk/OQUS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37PyeKgYhvIFssSMT8nrzg8OD9x4odjXUVAFtI4FtTE=;
 b=mnSSeQIusOo3OyCjP7HksyDJgUJsVmzAvC7aJTcezxtb6rSBzQWaTCbXNBtHhvWPIpJSKOS5fSP0uXX3/Kz8kvTynAWHKnTheRPcpLE+5XEwTPK6xKlUwnTWrw1cRD9dyblKm2ogta7ijX59/L6lpDWwENbqtUDGzESzZ3nhtco=
Date: Wed, 1 Dec 2021 11:32:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YadPLZqfN2pu5SeG@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
X-ClientProxiedBy: PR3P191CA0034.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b1a08e7-604c-42f8-dfb2-08d9b4b5d9bc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4681:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4681EDCBA80E76F663051CAE8F689@DM6PR03MB4681.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5spc7a47FFsSGLKJgjEqBCBxYQ1MgIFKQ2GqHpDbfJu8cojaO5Zk5tSZDRsd8HJHbkenB1m3t0qph+WKYvyq2tTeAq7R447yoS1E+zC5XJQqXsvsuf0fjL3ViXQRZBPGoxm3603YZT5O/C7S+H3neqrc8S39O/qmCfMjZbSdyZE/CfceF+Fua0ca7U81asigZx1DKrKB0QO9sGsCQusKHiQNqhkLpjNIPhkcvFXXeSq8P1bbpRHfvudsC/xRaMueclVl0w8FsN638dh/lp1pgch7Lt4LROuThyfJd+5+G7/xL15UaxQtHXRCAOqpJDES8IAwKTaehMu1Nm94bhM/BZaUsLwjlzOmxFi9drunuxqE0odFMc4emtdvIzeBNlFtkm7HpeeJoSKLvD4uAtF+HLsY1rlricfy6vvcauK7Bqhf/2a3a7ToakVxXS7dGJkAAqPEyi82i1R4KP3cFU7qEZlTWbA/gt9PXoVbf7GdK4RLUAI3vlGb1S0sH8SH5hZbbn5L5pJamjzWpGC1OCt8qumjI959zpTohlORjLhbEIezu4UKCuNPyT6+QUE41hQnjcPcoFiLLAkl4Qe6UNQFaeZIevbhsWE68HT0MR2QHAKUYPHcB6DwKzp6sVxFfcP7/oJ0GN8BE7UzJQX9s09Y3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6666004)(6916009)(26005)(9686003)(508600001)(38100700002)(8936002)(66946007)(2906002)(4326008)(66556008)(66476007)(82960400001)(33716001)(53546011)(186003)(8676002)(6496006)(6486002)(86362001)(5660300002)(316002)(85182001)(54906003)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGFwaDc1WW9Rb2J5cGhuT1h1aXUrM0k2L3d2S2ppRGtsVTRDSzBVN3hiVkNH?=
 =?utf-8?B?SlFKZUoyQjBNMlNOUXlKTVFSRmp0Z1BLcEttanJvalFBeGxKbldBMlo1ODIy?=
 =?utf-8?B?WDVCTDc4ZEwrV0dDTUdIS29QZEZtcEVnaWtHMEkwRmZxVGE1bmdGQXo1QXpD?=
 =?utf-8?B?US91VGo5amJTUHZCVzlENEttWnBXblQrMnI5VnhvQ2U1YVZaSHYySEhRTzh4?=
 =?utf-8?B?NnN6cEVGNERpaERKZGtTTW5IcFBXT3drV25hZ3NpM0xPY0k2aCs3ZTZ3NWZt?=
 =?utf-8?B?RFM3ZGlNU2RCYUF6VTZrc2k5b2pMUy9VcTZnRURDN2tNcm5xUWVXL2Q0b3dI?=
 =?utf-8?B?dDhqNzRzS3I2LzVmSy9QR2VMRXJqRjR0ZVEyTUpIY3EvYmE3UkRhT1ZRaWxL?=
 =?utf-8?B?eVNnUWltRkp1MzVHWGxLSmc3amwveXArczhwTFQrYmc1WmVzc1p5Mi9BZXVm?=
 =?utf-8?B?RDN3M1RMWG80cG10VWhsZ0pIRmM5V2N0NTJUSGpkTkRuYnVnbUxHZ2dJK2cw?=
 =?utf-8?B?UkhxQy8wNzZJMU9COTBXU216K2lhWllkeWRGTXhqUm4yb2FlSWpaaGhTUDFa?=
 =?utf-8?B?TTFHVWdhd2diZC95TDZHN1psRVRLczJSLzJYV0c2M2lBd0hsQlBpWFVYN0tp?=
 =?utf-8?B?ZWZ6K0NGZ0dUMC9wbmtCMVEvRSttZEFlQjVJNnJKRWxERVd0N2g1UGxvZkZq?=
 =?utf-8?B?UEIyc1VMbGZzMkVrQWFjVlMwM1J5d2diNDFFeHpTTzBPRGY4K0JhdEZXaHU2?=
 =?utf-8?B?QWR0NFZhajJRVmwxTzBYS2x0b2RTSHN6b3RFNXRidzNML1FXZ1A5bmRqcG1W?=
 =?utf-8?B?bnBTYXdGNDZ4Qi9KQVJmeU0vM2QxbTdZVkVjOUI3YW5yUUJ4MTVDekFidGw4?=
 =?utf-8?B?WjhiY2svVmJZcll6b016TkloMkZCaWJIakJlcFRzTjlSUU5WV1BIUXFlN0Ey?=
 =?utf-8?B?M0JxZEpURHY5eGJ2NmR1YW5yQWJPZmxRK0xpVUR3U3lSdGUwZWpXMTJJUVZN?=
 =?utf-8?B?S1V3R1hVQXRsbVhOL09uY0pWMnlNeGpDMXFkUXd3eEFyOVRZVGN6bTB3VE9P?=
 =?utf-8?B?YkR3am5LWG1KSTQ5cy9EWDVFaE9MT0M5VjZQTEJQQ1JjcCtwTGZuRFk1ZWww?=
 =?utf-8?B?eDhkK3dOc2I3aDVtZ0FrOFVvSW5LWnM4OHFLd3l4VHFOVENPbVVSR2ZQeDZU?=
 =?utf-8?B?bGVNb0luVk5ETzZWNmdubk9SUEFYTU1WUFBIU3owSTRvMlV6TDQ0aVE1YzQv?=
 =?utf-8?B?eTZwQzR0Q3Q3MTlxdGo0MlBsRjNzcjZMSWJZam9NWjJoQTUrK0ZqR1hheUh6?=
 =?utf-8?B?dE5NV08ydG5Ha1NYZDJ5aXRYMXMvTHIyUml2MUZXc2NQVFlTTlYveDl2VHQ3?=
 =?utf-8?B?ZldoK0x1d1N6bWpsSFdTMzByN1pSTkRDSjNLazVSK1V0cDJDd1RrbWgzc29F?=
 =?utf-8?B?K1YyaUJiVTJudFdVQ2cxYlpVVzZ3Z2Z5Z1VxY2FqV09MTGRldENPdFlvbWYv?=
 =?utf-8?B?RVRZbVVJMnN6YzUrRDA1SWFkc3FpMGZyOU1jTUZ4aS9YRXE4WU8wNWYzaVlp?=
 =?utf-8?B?ZWZNQ1BYN0hEZ3p0SENGcDdna29jZFRiS3k3LzJtZEFnZThacVNYL2hXOTky?=
 =?utf-8?B?YzJ2bnQzQUxwRWZiYW52TzkwK2dVTHRsbjZrMlpqZmVKeTlRL25jVFBORkFr?=
 =?utf-8?B?YThERVlwU1pKRU5Zcyt2Y3hpb0s4T0dNUkNVdjl2QXhMYW1BVDcrY0RBbEFN?=
 =?utf-8?B?dHBub0EwVnRDVTVTZDFTb1RtQXJ0TVZ2ZU90c1l1b1FpTE52a29vWkZWdHN5?=
 =?utf-8?B?UTN0QXVOcDVjR0prOXFhK21MVHRyWE03U3BzQmYvZkJ5ZFlOZlpyRGFUZkZU?=
 =?utf-8?B?UG9hc0FjS1ZWTHcwSm1KRElGUThHUGJQTGZaYm93TEdZV3JDSEpLSHhULzV6?=
 =?utf-8?B?M3BGOHl0YjBRMFQvMXllWEMzOTJPTUYzekdocVBUZkpYbDdJTVZndVk2Skh3?=
 =?utf-8?B?dDZRODRBMXkwUXIwaDh4Y01LWHRsNnl5NEo4Z0MxUTlBNEVmOEdFa041MkhO?=
 =?utf-8?B?RFYyLzNNR2RGYzVnT1RaM0V0Rys2RGg2K01sV2VRVElGRWk4WjY4K1dZZkpL?=
 =?utf-8?B?ZGJwcU1NZlFmVEtFcXU5OWttYXpjUWdnWkp6aFk0elZwS0R3czY5elhmZzhi?=
 =?utf-8?Q?U8pFoSZ6Dd3rNLs3SB0+bWc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1a08e7-604c-42f8-dfb2-08d9b4b5d9bc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:32:18.6273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkXHPrtADqNwRXLxE/KdkhyeBO6xeBvflA9gmXBGjj84i1kDv+tMv8qOHJcevHNRHxnvUfrgl4zxE3nRNnuU/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4681
X-OriginatorOrg: citrix.com

On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
> On 01.12.2021 10:09, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
> >> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
> >>       * that fall in unusable ranges for PV Dom0.
> >>       */
> >>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >> -        return false;
> >> +        return 0;
> >>  
> >>      switch ( type = page_get_ram_type(mfn) )
> >>      {
> >>      case RAM_TYPE_UNUSABLE:
> >> -        return false;
> >> +        return 0;
> >>  
> >>      case RAM_TYPE_CONVENTIONAL:
> >>          if ( iommu_hwdom_strict )
> >> -            return false;
> >> +            return 0;
> >>          break;
> >>  
> >>      default:
> >>          if ( type & RAM_TYPE_RESERVED )
> >>          {
> >>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >> -                return false;
> >> +                perms = 0;
> >>          }
> >> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >> -            return false;
> >> +        else if ( is_hvm_domain(d) )
> >> +            return 0;
> >> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >> +            perms = 0;
> > 
> > I'm confused about the reason to set perms = 0 instead of just
> > returning here. AFAICT perms won't be set to any other value below,
> > so you might as well just return 0.
> 
> This is so that ...
> 
> >>      }
> >>  
> >>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >> -        return false;
> >> +        return 0;
> >>      /* ... or the IO-APIC */
> >> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >> -            return false;
> >> +    if ( has_vioapic(d) )
> >> +    {
> >> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >> +                return 0;
> >> +    }
> >> +    else if ( is_pv_domain(d) )
> >> +    {
> >> +        /*
> >> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >> +         * ones there, so it should also have such established for IOMMUs.
> >> +         */
> >> +        for ( i = 0; i < nr_ioapics; i++ )
> >> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
> >> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
> >> +                       ? IOMMUF_readable : 0;
> >> +    }
> 
> ... this return, as per the comment, takes precedence over returning
> zero.

I see. This is because you want to map those in the IOMMU page tables
even if the IO-APIC ranges are outside of a reserved region.

I have to admit this is kind of weird, because the purpose of this
function is to add mappings for all memory below 4G, and/or for all
reserved regions.

I also wonder whether we should kind of generalize the handling of RO
regions in the IOMMU for PV dom0 by using mmio_ro_ranges instead? Ie:
we could loop around the RO ranges in PV dom0 build and map them.

FWIW MSI-X tables are also RO, but adding and removing those to the
IOMMU might be quite complex as we have to track the memory decoding
and MSI-X enable bits.

And we are likely missing a check for iomem_access_permitted in
hwdom_iommu_map?

> >> @@ -346,15 +362,19 @@ void __hwdom_init arch_iommu_hwdom_init(
> >>      for ( ; i < top; i++ )
> >>      {
> >>          unsigned long pfn = pdx_to_pfn(i);
> >> +        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> >>          int rc;
> >>  
> >> -        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
> >> +        if ( !perms )
> >>              rc = 0;
> >>          else if ( paging_mode_translate(d) )
> >> -            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
> >> +            rc = set_identity_p2m_entry(d, pfn,
> >> +                                        perms & IOMMUF_writable ? p2m_access_rw
> >> +                                                                : p2m_access_r,
> >> +                                        0);
> >>          else
> >>              rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
> >> -                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
> >> +                           perms, &flush_flags);
> > 
> > You could just call set_identity_p2m_entry uniformly here. It will
> > DTRT for non-translated guests also, and then hwdom_iommu_map could
> > perhaps return a p2m_access_t?
> 
> That's an orthogonal change imo, i.e. could be done as a prereq change,
> but I'd prefer to leave it as is for now. Furthermore see "x86/mm: split
> set_identity_p2m_entry() into PV and HVM parts": In v2 I'm now also
> adjusting the code here 

I would rather adjust the code here to just call
set_identity_p2m_entry instead of differentiating between PV and
HVM.

> (and vpci_make_msix_hole()) to call the
> translated-only function.

This one does make sense, as vpci is strictly HVM only.

Thanks, Roger.

