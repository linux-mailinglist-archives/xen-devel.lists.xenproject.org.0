Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD85278F464
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 23:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594125.927338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qboxz-0004Yo-Kl; Thu, 31 Aug 2023 21:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594125.927338; Thu, 31 Aug 2023 21:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qboxz-0004VR-HR; Thu, 31 Aug 2023 21:12:39 +0000
Received: by outflank-mailman (input) for mailman id 594125;
 Thu, 31 Aug 2023 21:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B/FZ=EQ=epam.com=prvs=3607c767dd=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qboxx-0004VH-6w
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 21:12:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a353fd3-4843-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 23:12:34 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37VIWRE3014146; Thu, 31 Aug 2023 21:12:22 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3su07x0awv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Aug 2023 21:12:22 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7764.eurprd03.prod.outlook.com (2603:10a6:102:20a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 21:12:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 21:12:15 +0000
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
X-Inumbo-ID: 1a353fd3-4843-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3kIpFL4CR+yuEfHDHsetTrRVgIPd3/nS8olpvimRlYQVZXPKOmEoaOGmy/YpFT/DyFJg8eACv+O6vkCMuICkd1skYXXycP0mwBJl9WYHJVAxhKnknfdqU1bz1lsx6Y8GioILUgNIGpWpQXQFFlzXpExUVeo0EBZMtdDmDSAm5bNlIRbqv2K4gtkM+jKWcAQ7EWd7nB2/7tv4zOV3/ftHRX8xvU13zcl4MHJZ16qOTZnp5iR/XB4ENVpGR3yldohVmt8HkUv9NDdT5kiqDGAaFVEpAwExWHNGWBb3tloyIHshcEZtZBYhd7gF4fEdACgF6a2YSDu7trLwFuLsSpqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R1rslfS5/1lQT+mBdLOwI1/cIqMh5UogVigXzhJ4cQ=;
 b=O9pyvBZ7jJqBIQtjjAxfztHlREhb+i7p62MAf01jDbh/2wsuMaCIsKDfg+XsttYBKmCttLVSMWcEzgYchWiFoMzrA54LQ8juJaS1xLUiZAgETmxb5Cp9+5p3AXw4ak/0JVoIU3kN3ZPxDUCH5fjS0s7FpYF6xG2uE5T+QV3+PYMx697T2EqnHCLm3ug2164TruljZRVovcubkSYUUrfnGGO3Din62Wl47yC3cGmCb8+NoKGWL1trad9SNbpeZrsql1Yp9Z2+2ObA6VemHQ7g+49WamHwKokGgNWMTsALvWp0EtOcq/wX0q7zNID5YS7DH339Vvk51zwM+1dtmeGNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R1rslfS5/1lQT+mBdLOwI1/cIqMh5UogVigXzhJ4cQ=;
 b=lTBu8fJgrXHdpP1E5C1PZohsqZLTLlZ2S19mp2PCMQ+FkW3f+vLoqokAiWRT9x8CwuHvzrRYgfo2jPLxNrItuCQZDP7mCWI7Dv2Oh/QZLiZVq9v/XFJTPbAOLCMIlY8zqMmA4An0aLeocGz9mzkKSN/huboJjqR3NjigMtHBiHM75GVoTmzGl1mKrvL8sz2vM5h75HmBtfM47L2sbSKPnvcKJYwy7J3/iYcSh6Zr1RSAXnM9ZmanF4s88IvboZw33BJ4llcIwtjWSSjxg4eH2bx4WGWgUayq7ydUqiJpQAPvCvTUEX3EjMqbGeWoeVDgtMmEIs7ToFVK8vLkCxw2aQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v9 12/16] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZ2s9MKcW5IJI1REe00zENuWVyE7ACc/uAgAJ1YAA=
Date: Thu, 31 Aug 2023 21:12:15 +0000
Message-ID: <87cyz2apcp.fsf@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-13-volodymyr_babchuk@epam.com>
 <19e8ce58-67dd-ec2c-1877-fc5b524983b4@suse.com>
In-Reply-To: <19e8ce58-67dd-ec2c-1877-fc5b524983b4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7764:EE_
x-ms-office365-filtering-correlation-id: acc6f54b-3186-4d42-fc91-08dbaa66f3c0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2+af5UKOSS/jwFL3y3k4/YWr4iCXXe13tmUBqJwdpQ20/r7M1kT1PcG/XJX0Xh4717zs2e7g3fVYizTPYT0C9n8yk6jy6Qz3FuKSZmF/axOd7VWPQhpS1l9X+kvlafBS9toIchYw3/upuF5LhluixLBFHRKsfkWpG/uxp5OvA9ZcWt6GoZlUxd4IF5fBBRTs6LCnsSH4zuXdWhpgwNAOZ0pZgolpn7YrMqDtwReHSQGdOGCXD2MamfZD68QR9Clmu0fIWY+VxaVfHFiqLokyrftgtph56i/lCof1+zoLNpC521P0UTLmOCp9gaP6C5T8Y1iKgmNFHklnNIsa7r8ZJfwp1U9XqBp176+nWb2253UdH0hg0uSvrBK6M2fmEmUWxOLue8KQcxIcXkMF6Sb+2CTJJLA0/afUJ7W9m9Xk1yfMBGT27I7nKM8slPkAsP/GjlMXJ7yyQGkesadJo0FnM3wsxM+93gg/TK0xKi6UwgH6IyuPY35M2js/DcILvi78DdY8ICTdSJerTPtLNrEcp9tFFcdUjLteNgLnzyP+FnJ2IKa7GrcXc2OrnG/YYE5eW7vzdNX9tYGexSOa9YJwobQT8T/pWF8IyxkApxPrLy7XAPzbtlHDGWj7nDnVJvfq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(1800799009)(451199024)(186009)(36756003)(26005)(86362001)(41300700001)(71200400001)(53546011)(55236004)(6512007)(83380400001)(6506007)(2616005)(6486002)(38070700005)(38100700002)(8676002)(4326008)(5660300002)(8936002)(76116006)(91956017)(316002)(66476007)(54906003)(6916009)(66946007)(66556008)(64756008)(66446008)(2906002)(4744005)(122000001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Nv/jIVy/Jk3IisfqXOg7tVbKxzXflqMeE3zWfDty+9CqABBbmHj5ph/+9I?=
 =?iso-8859-1?Q?+2yt4gpGd1cVmLwFl+5D2zHoUPXv4naVUGbA4b7yLUxgCRjHJ6W8VPFky/?=
 =?iso-8859-1?Q?nSusvObPNDxSkrrlZPIVhy67e0kP7UqZ3VLmlZUP9ZRbzkIGkCZTt+GpG8?=
 =?iso-8859-1?Q?dxDJNl0YYDn7kR+IRLg1jRH0PpgxCNGs7tGS8iocBEK/dQSBBmXmM83e6L?=
 =?iso-8859-1?Q?djdZsBLgyXCJkg74hh86z12gQOxT7xUlcozFcPm5v9/y8nKdQqCopqq1qE?=
 =?iso-8859-1?Q?7bwr2qY6jGWhF51TjKfRsE7QuCoSbIji18AZGWogTc8YroAGCCFrVNb2FS?=
 =?iso-8859-1?Q?nRaHmmlIKUFycsSuEuq/IzK+dxg1+g2wfK/rmD5iIG/qeHbSAFVqk0giRA?=
 =?iso-8859-1?Q?Ig8g2+ZLiVYo81qkqDnl0viLo2d9uJsOIsqV+ecD4LPEBY1A68W9m8L8mU?=
 =?iso-8859-1?Q?xW+RbFhy+tXP9v6NcRA6/G+nEYOSGfplh3NUD543RDMiHR/JwwEy6cg+2L?=
 =?iso-8859-1?Q?d+Nusyg5Fqt+RmmlyK34vyVj4ZOmqBDWOVFBp5FKvXaFpBV6unI6po8+xP?=
 =?iso-8859-1?Q?K8KONZS9aihAxEmYiXvLVwgem3jgz/ODK7e8fAncVctzl9Td6nVYsARcax?=
 =?iso-8859-1?Q?DktM8uezutwgP7n6hFcv+pxQgnMkoduW47/E7ZmLQcbZfRhRK75xb41SeA?=
 =?iso-8859-1?Q?WqsmNMS5H1L3l+JpOHuX10aNAFlzEHidP0CTRt+x86osHDIJLXCA3W/a+n?=
 =?iso-8859-1?Q?Z/9eaywnzRCgV9f3gJ7l6JgUOA20YkHMpbDX5VGXDF7C5gvlC9glVFj8PL?=
 =?iso-8859-1?Q?qHEt3H0WBO7henls/Y303fPjNOXbXY+6xuOX+F6U7GdcyUYLOV9LafZWfV?=
 =?iso-8859-1?Q?ndBNe+1LTyhEzZ2Ycv0h1b0Wzr1AiSuWNOIiCPJalWYXTT1RconYUoAqDj?=
 =?iso-8859-1?Q?ikWCaD4znx/HBtlaxjL274Dkv0v/akldL2WNhb/Vx1e9VLoqZeR1YsjpJ9?=
 =?iso-8859-1?Q?M7MAZAHlvhhw0v6eJLaY1yghyJ71DdLCehyOHHIyJwwyYoyuT5SQNZuC8H?=
 =?iso-8859-1?Q?wwZh2Cr1QiaZyH0teIX7IRJSliRFcYc1Jznoc/1Q7v9GnF6yQa5oyMdcLS?=
 =?iso-8859-1?Q?aKlrrE3aW2Ak22UIo/3g/MppwFiES369zppxixI7G5J2dhy1B8f7982YEw?=
 =?iso-8859-1?Q?QfPrtjZHmpk8HylNNknZGMNVlPlN3QNto3O8UG6Kx6XXhdE7WJbe9z+gE/?=
 =?iso-8859-1?Q?zJk7qdHxjEeWImeWLVg5xo/CLzPMfx4kyYiXvn/o+y+TwX2cwg2rZw+QYs?=
 =?iso-8859-1?Q?DQWSITlxpQ/rUJIqjuUwkuUmFdBUf2uVGeis9QzELJ86dbhZCIMXxUQLYx?=
 =?iso-8859-1?Q?x6MLoqol3MyBU3VllZE3bUsIlUq9dV/WLycZrSer3+cOfgA/LckMlVLhtz?=
 =?iso-8859-1?Q?oC/S2Rc9Wa5m0T+pUENaPoyiJBayQxnjroxHd5Pnp75XMcJIS/3f1u6zzr?=
 =?iso-8859-1?Q?k4uZMqld+iiOOGBL3bu50n3EXGOQmgMH7gz1PzgCz66DU/D8zJaXkA9QtE?=
 =?iso-8859-1?Q?vbcXNj+z3xvmeyhqPFMxAhTaHHf7u7ys3ow2gQtQtg/qSspC+iohsrja2u?=
 =?iso-8859-1?Q?f/EPKwzSyUzW09Oxvl/RY80vPBdx/E/MGevfaFQ8aT5VmjJU7BSrAqMg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc6f54b-3186-4d42-fc91-08dbaa66f3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 21:12:15.4927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cqWVX3DmsSuzV2l2o83V8m09gRbTJ9SBhHGuZXEgM/9YZpmox3830O2ZzAkFiJFczZmdchh2s0uC5KCE3u5dQOisMra9U/YPaJzzlzySFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7764
X-Proofpoint-GUID: ZBPhICh9l4EMMLtZyH30r3fMpSxpecHu
X-Proofpoint-ORIG-GUID: ZBPhICh9l4EMMLtZyH30r3fMpSxpecHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_18,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxlogscore=972
 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310189


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 30.08.2023 01:19, Volodymyr Babchuk wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>=20
>> Assign SBDF to the PCI devices being passed through with bus 0.
>> The resulting topology is where PCIe devices reside on the bus 0 of the
>> root complex itself (embedded endpoints).
>> This implementation is limited to 32 devices which are allowed on
>> a single PCI bus.
>>=20
>> Please note, that at the moment only function 0 of a multifunction
>> device can be passed through.
>>=20
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>
>> ---
>> Since v9:
>> - Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
>
> Also peeking at a few other patches where similar change remarks exist,
> I'm slightly confused by them: Is this submission v9 or v10?

Sorry, looks like I was using wrong wording. This is submission
v9. Under "Since v9" I meant "in v9 and further".

--=20
WBR, Volodymyr=

