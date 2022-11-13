Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72621626F39
	for <lists+xen-devel@lfdr.de>; Sun, 13 Nov 2022 12:13:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442979.697378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouAuh-0000Ce-OK; Sun, 13 Nov 2022 11:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442979.697378; Sun, 13 Nov 2022 11:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouAuh-00008i-Kj; Sun, 13 Nov 2022 11:12:35 +0000
Received: by outflank-mailman (input) for mailman id 442979;
 Sun, 13 Nov 2022 11:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Ui/=3N=citrix.com=prvs=309141bbb=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1ouAug-00008c-15
 for xen-devel@lists.xenproject.org; Sun, 13 Nov 2022 11:12:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f682180-6344-11ed-8fd2-01056ac49cbb;
 Sun, 13 Nov 2022 12:12:30 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Nov 2022 06:12:26 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SJ0PR03MB6221.namprd03.prod.outlook.com (2603:10b6:a03:3ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 11:12:25 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%4]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 11:12:24 +0000
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
X-Inumbo-ID: 0f682180-6344-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668337950;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0Hi6ePSm2uVE6xnHiWvSI3W7dG5dku8deEBf88wrVkQ=;
  b=X1zr3Ay9kXi492OQjzwaevFEgZZ4MUglfzSAVKp4QpGE6xipEEZAlIb0
   RtilsJAWl5zxY7crrsSN1T46RgHgrNym/+l3Bp+xBi4D8ezYQWMFRPfxQ
   p5O2k5AFIjLCwU23Z68D9t7drrfIEtM3sVcCIm6XViPVd6KPADlowMEia
   4=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 84308149
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zfrzgaJ7+pzjVaaEFE+R4pQlxSXFcZb7ZxGr2PjKsXjdYENS0WBVz
 jMYDD+FPqqPZ2Ojeowkad/n8kxU7ZaGyoRnTANlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vIGF0q
 fUdDgpOdwvY3tCNmJSeGsxV05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlGSd05C0WDbRUtGGW8RT2Fqfv
 GXF12/4HgsbJJqUzj/tHneE1rOUxXOiBNN6+LuQzeU3vQah60kvKQA8SmC5p8iwsXCSRIcKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZh5MbsY38vA/QzMC3
 0WM2djuAFRHvLSLRFqH+7yTrDf0PjIaRUcdYQcUQA1D5MPsyLzflTrKR9dnVaKw0Nv8HGiqx
 yjQ9XdmwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:d9GbTa3Kdz6/wCYKrUy9YAqjBZpxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5AEtQ4uxpOMG7MBDhHQYc2/hdAV7QZnidhILOFvAv0WKC+UyrJ8SazIJgPM
 hbAs9D4bHLbGSSyPyKmDVQcOxQj+VvkprY49s2pk0FJW4FV0gj1XYBNu/xKDwVeOAyP+tcKH
 Pq3Lsjm9PPQxQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwrCG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7nF6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklUqvoXRiKrbzPIt
 MeS/0018wmN29yqEqp51WH9ebcGkjb2C32GnTq9PbliAS+10oJsnfwjPZv4kvosqhNC6Wsrt
 60TJhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3ck4kO/bMkcoIDcyRCes1JaEJ6e
 L8eUIdsXR3d1PlCMWI0pEO+hfRQH+lVTCozs1F/ZB2trD1WbKuaES4ORsTutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQsNcmXFCFpN7NN+TRx6TmWeeWIKCoHScvW2v5DH
 dGVD/vJN9Y5kTuQXP8iAi5YQKYRqU+x+MELEH3xZlh9GFWDPw8juE8syXI2uibbTtfr6cxYE
 xyZLv6j6LTnxjFwVr1
X-IronPort-AV: E=Sophos;i="5.96,161,1665460800"; 
   d="scan'208";a="84308149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vdq787LwmqBRogh5Ou1WcUW/Uztfhwu6LwXjHBGVT0y+0px9fZj+lQ52FbAp7m7Ms0W5c5nchuPno0pzf/bl8pCuCuucp8muzllRYkhggw69yOdOKhYYdQAd11hcFhgIk/MbBL1Wb0siZU9BBeX8+Su1uFaGsjHXzrBQR8htWT7/xHiL5HTr/otdKt/YByve6mkwpBskpYpOTI/iU8/OjpSMR+OiPUM90MAzLPfFRzamcKfWov5ih+WaQZaaS2tkUmgc+X4CXRAyWjVJJQGo3CPNrHNpsL1gOreMvOBfTg3Y6cpmwhxrR5lmA7mI1XJhDyVLWC5OViS1EkI9cCvUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6bmGn9NFYDHljzIZ3nIV4aKlkw1EmJnaglQNUbX9L4=;
 b=TYzsy10JPhCG6NQxLUuO1hp79PUrho1bGC29OamQJxYwTtYw6qZYzTqDWVZM4+tkPrR32ErnfSRurnCy3Pc/bsxGCKURpqHknhc2+Fj9upNjgV1hJQ4A7Yok/L9mz5apQc3Nql18E6gqVJ0Qs8zaNett7xS9gGbDUnV0CDhJBiKgxGGPxTxGfwTMBG+flSTKl1n6Szh9J7Bfo/Z7J+nIlCnYLgN1kvK/B54QIkEk4zD63Ssrl1778WvVww/+GlnNbghWNOA5hZ5bvju5qt3eJDRzDUpZ2uiAsslnlT5jyRDaBhIHHvOq0+Fijo98AWUwWqrJM8bXjGSkyb3995FiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6bmGn9NFYDHljzIZ3nIV4aKlkw1EmJnaglQNUbX9L4=;
 b=Qawg+mUbaCWgSuNTH9r+QOVHoaB9b6bEVNVx6IUgar0FJHwnz8LrByopruLVw3vRpmWowVYJSVMjSyLFKDbd6ZtLo49eK9K10Z+Dd8UkqweMWF8tWkIV81Qwou7Q0iGgw1OQQrlnfQVTzuFbMLdkfXYRKSk2NgI6DeEoqaVPcqA=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry
 Wang <Henry.Wang@arm.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: Summary: Re: [PATCH for-4.17 v3 00/15] OCaml fixes for Xen 4.17
Thread-Topic: Summary: Re: [PATCH for-4.17 v3 00/15] OCaml fixes for Xen 4.17
Thread-Index: AQHY84ehGvE29j6O1UW/SkvcImf7eq46Nk6AgAECtwA=
Date: Sun, 13 Nov 2022 11:12:24 +0000
Message-ID: <083B5B38-7005-46DD-B28C-4832B9EBAB9B@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
 <75fef917-499d-ab02-9429-39ed59d87c97@citrix.com>
In-Reply-To: <75fef917-499d-ab02-9429-39ed59d87c97@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SJ0PR03MB6221:EE_
x-ms-office365-filtering-correlation-id: f24d4d27-19d0-4071-b392-08dac567f143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w4XFo1Po6nrEKiK2GP3cas8tjjGcQGzBRXMQzAon+qO9jlErD0TDPPBlwe6FV5zT6b2Pz4TxKZDWqzyh9gczU9EuCRaDoYIM5MqSJTxk/7fXCGc0mJL0dDBbGF0WRgblaKiNXlM1luZkwYQm0s6slMX5Pydtrpo965CmlHWhksEFaXBmPJF8LdZVpzO9t7IhLjAdWqV3LdAhpHJm1EORTvgrEVvC37Q/XDrUAPFGO4nJ7VpgHB5O1pGD2d4d6IMgc+gGMJtxWGxrCwJGteNoFCS3x3FsVWh3nUClB9T6Oj0/mEV+DZIU+pKzMXp5gUiKUzLL1G7vA6wCC/FtOA/jm0CDqxzaD8SMu+ghKC9QZ+76UeAxFHZ20HwdTF0KkquFsCWM+KbWPqWFtINcOVNB/DQG5OeagxbB/qRrszClN+rky6Qgofbx0FLdq9x3SfbSdwONT2rfSxSkoX4Uj/f8PUz0kJqTZLtXRiU+RCYY2f+rxgnrnYomma5a5xL++czDWN0Ojp/QtZoUYuNW10Cf2ofIX+Bd8DbhbFvqRb8QishqGY2wuLYHqgyYU3bZWI980Cg/I8zXIPwZ7+w++kVxtKxIogal/UidBI3LdE428nOIrzm9HfOyDnD9KsrNTURW7KmRMwvU4kNP0+GrjkMox/3PXzTCUA35/HkBTvgnkYQOHdpdQrzpmZ06Q3DvTQDBLynMyjG0YXL4osNMrq3iiN0NalC2d1Sxh3kiTyxFfTErfA2Hy02htnknnzBNu2xkMZ6LG9ZeiYKyeVF+dn5pr8Bs1mZfr0v99PTyLYS8qWP5IJDS72ifKiGY3k81E0ttYzenaNcKpP79rWyrRI8T0qyLsb/IOWP4NMDzWn07rzICSZemzA4RSCIxYzzrDt4g
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(71200400001)(36756003)(54906003)(37006003)(6636002)(53546011)(33656002)(316002)(107886003)(122000001)(2906002)(38100700002)(6506007)(82960400001)(83380400001)(41300700001)(6512007)(8676002)(4326008)(64756008)(91956017)(26005)(66946007)(66556008)(66476007)(186003)(86362001)(66446008)(5660300002)(76116006)(38070700005)(2616005)(8936002)(6862004)(966005)(6486002)(66899015)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UeA+0kvif7CBKxZUV0uyMMb5AajELF24wT9iS4Ki8cbj5uXlYTZ95auhwvdN?=
 =?us-ascii?Q?yy7GDVVoBoSskbZ/V/brNt44mQ37pUnAKCnz/oSayJ+vWc09MKrfUHTGmvTH?=
 =?us-ascii?Q?0K5cZyLX83KAbuDuEynvV6Y0UMNCdlhUsZou90fqobZKDKOER9+KbItg/r+W?=
 =?us-ascii?Q?4V/6HbV1+vJmVOKwaBJhT7XydSwj3ScamZuztRvh2Bdp1hTgqsbifKp4CR4e?=
 =?us-ascii?Q?AvdUobkOG+aCyVwJwEGSItDCt8LD6GnQV3QgVrI7Ndwaqt+o1SWs4LWjDDvr?=
 =?us-ascii?Q?jogrgI41WDSI+6krGPX4UJVWtGsZ8FtFIN8Yw/T0QauE6+eahj3C8imOluFz?=
 =?us-ascii?Q?STBn0LQ+tlIYmicIfnaQoUUXpCQoT5uOmFx/BuoAft7zjdqAotmEBQ8DBnk8?=
 =?us-ascii?Q?rU8UJRE+CDZ4U+bDAdNEchcf3drJ91FyfzT0PqFw4BRxwbij/WiSZz+Kn65L?=
 =?us-ascii?Q?6nSv95fY/ru0yLDWIIjhblXD/od7ZZfzNJvjADtPaclht3EhjX+8QHrr2wlq?=
 =?us-ascii?Q?yDHbF6ugnwJsjpKCt2sMrDn/wd8jeWgfY7cXrPdlpBSLbR2PMbWLs5e1VrVS?=
 =?us-ascii?Q?KSBy0CmbIOE8/zDID5tcvBI6VuHN+SGgdPwGToSLf4yLOki/bfxGnGB4Pcgo?=
 =?us-ascii?Q?nyWwiyoNMO2f1TfRXZoiUIKFiA7lI0W7ty71VJFBOoJTQALfEHEtEk1fdAvB?=
 =?us-ascii?Q?nLBL7KdIOlvRl0s6llrZNEtfOFoE67sLkFgH3Aqs6bTop6qPAKhgjU/micLV?=
 =?us-ascii?Q?1aKlPsKyofY4MnJPPsvQ8nOUiAPNjWpKQpk0asduF8s/F7DuNiP3uWhiYUP9?=
 =?us-ascii?Q?Kp1EcT9VPyBKV7p8KRb2RhndC9EPgMIKygQThqmFf4DIirUOUuV7HP5hvAMl?=
 =?us-ascii?Q?77v9f+uXniCEn4tdv5wGcTit+za/s/ZsOyTBGylvqyvm4xiupwSI+rvE8vCw?=
 =?us-ascii?Q?/sMsh6t7JbAB1Rpb/n996ntQk+rL5tE6cy+vghEyuZH1Kz6Hlv63TDLtnj9Q?=
 =?us-ascii?Q?h50XJ2BK6NyrM5ePlb5RQukDtvgCEWcpy9lzdntBVWVyo1QokkzDpMQpTSBr?=
 =?us-ascii?Q?LDI7N5qrgU7O8ENt21VoHmBbRpLZupj/PyBq6cdv+X0grpBRzRYqukvLxjzE?=
 =?us-ascii?Q?1bAHH9RksFO5B8T42UrlvUHlGyNeXl6fkKIkkf0W8hYEuQk36TTONK7ddvAE?=
 =?us-ascii?Q?6sVsQsNgXKSMbE7lRB41rqqsmaQ4EcR0sW6/PIwV4zTP+sJncP1qdr58S9us?=
 =?us-ascii?Q?mLgCVpUodTvuttOZ245B5Eu+o0OvL2ofPOCTt4w+xq2G3AUbM490DWkMIGJu?=
 =?us-ascii?Q?f2Nc6jPD9CH2i14aEwjR8tUsZM9enyu8+dmA5IW7ZGZWzDBQJS18xl9hLe9V?=
 =?us-ascii?Q?VEOJhjyMDAgzYcak8KcnBnBlwppMmFyZ9TgXwbJW2ohLYOCuae40yMP8pqzF?=
 =?us-ascii?Q?fYXdIPCS1Dus2T6iD8s1FMLPKkCaj2jTH7vfLy/QQLL3nmx0o3UlhO0zDbbE?=
 =?us-ascii?Q?ksc7Vza1XNV+Q9Hwvk66+t3vzZ4z8NG3dtCtg2VT1OT6Gl1529tgAcOmmXJ2?=
 =?us-ascii?Q?7JLjIjNDUWeMVwox+mhbjRr1eWnZ7UBkxGB9tLpiMV0BWrwjCgXgP1pBc4f0?=
 =?us-ascii?Q?Wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EF829A8FC9645E47822E365ADAEE20AD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	utswfbLePw+CXd0nzo8ZP3SGgVoPySnBDIaN8Y1XEfTYDTp9GcmIhg22y5+rlS/7PQphWkBloPrHFOyzA7Y5RraEAl4P17x9+n2tCtXI738FerDcooOpzJTFwBiAo0Nq0a4QZB8ACou43wIzm8Ed7Buo+VLdz9T9MZAbx3Mx+zk42QTEwukgMAdTRv8lb16Wfaj2psWx69/2pD1/WEbVt+26ht37rdPRaaiPjGDXC9/7xcPqS70e060H4n0RBqGLXVFAp5yxSDTOCgXFDotcbXEjrI2Ky6vFYfkgDa5kgqcWdKkC/uMaZzuC7cVaKAsnn4JBiiT65QcmYsekMtEHMoL2/Fw+lbrjLxcm57KLNNLBXbHGtkY6o16VF/Ag0WQCtXUrFv7+xpchSC/IQ53GQmRz1c1HMCMr6DNfGGYwG/9g8IBFbDtVjk+Ogg05ua3JKQXo0QIxFqKHkajA/J5dpeXfY4oB2fC8xNcUMs47RbLrFdt/cxVRmfFe8zD3azULJeoe4UDYcMM8KMKP2+wkqfMLahc7ycNF/5/pimjb7Udy/15zFgvFKMZbWalKXind4DFfYfdokjzm7k+ZuD7z8jSJ4VO54LSqeM1IYiC/TCyUz+qo2pEaNkeTLkbczfB2agZa8bqHart07dctouyL90kP8LCk4l+CoCfzyuOCRC2/FB24TCVI9HiHpb48pISR7ShlK4u1Vi/f64UQ8BSsdGOODLMkyzYUMRSATbuxIRlXFo381UPRv7t5e4f5PBfjRlMD4olEKGUhNEQSse7VP6jwYmKfQXfDh8LjP6T+Qwqib1cEc/6ADxwMin4k8Tx/Ome5W2oLAdfMZT+ojs81BimbhRVeyPOdPcqpJx0MoPg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24d4d27-19d0-4071-b392-08dac567f143
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 11:12:24.6083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOxfaEDa6LSOYdqk00htAz9LYKmOcPmwLONfUs6xIeGRhYRkuZPKo3YQDr1OcMAzTgBw1fEzRErdRrL2xWTLRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6221



> On 11 Nov 2022, at 20:46, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> Nothing here is critical enough to go into 4.17 at this juncture.

Agreed

>=20
> Various notes/observations from having spent a day trying to untangle
> things.

Thanks.


>=20
> 1) Patches 5/6 are a single bugfix and need merging.  Except there was
> also an error when taking feedback from the list, and the net result
> regresses the original optimisation.  I have a fix sorted in my local que=
ue.
>=20
> 2) The indentation fix (not attached to this series) should scope the
> logic, not delete a debug line which was presumably added for a good
> reason.  I've got a fix to this effect in my local queue, and we can
> discuss the pros/cons of the approach in due course.


I deleted the debug line to avoid reindenting code, which was frowned upon.
Either way it is fine for me.


>=20
> 3) Patch 1, evtchn Ocaml 5.0 compat, is still missing some corrections
> which I gave on earlier postings.  I've fixed it up locally in my queue.
>=20
> I also notice, while reviewing the whole, that stub_eventchn_init()
> passes NULL as a logger, which has the side effect of libxenevtchn
> instantiating a default logger which takes control of stdout/stderr.=20
> Without starting the fight over toxic library behaviour yet again, it
> occurs to me in the context of Patch 13, uncaught exception handler,
> that in oxenstored, any logging from the C level needs to end up elsewher=
e.
>=20
> While we do have ocaml bindings for xentoollog, nothing uses it, and
> none of the other libraries (save xl, which isn't used) have a way of
> passing the Ocaml Xentoollog down.  This probably wants rethinking, one
> way or another.

We should probably start by reviewing the xentoollog bindings, if they neve=
r got used they're probably buggy.
I think Pau might have some xentoollog bindings though.

>=20
> 4) Patches 2/3.  All these libraries have far worse problems than
> evtchn, because they can easily use-after-free.  They all need to be
> Custom with a finaliser.

Indeed, the bindings aren't very safe, and that should be fixed separately.
I've got some patches somewhere to stop the mmap bindings from segfaulting =
on invalid data,
but I lost track whether that got commited or still in one of my local bran=
ches.

>=20
> 5) Patch 4.  The commit message says "A better solution is being worked
> on for master", but this is master.  Also, it's not a prerequisite for a
> security fix; merely something to make a developers life easier.

It is to avoid having to add Makefile changes in each security patch commit=
 (potentially).
Perhaps the commit message can be changed to say this is the minimal change=
 to unbreak the build system,
and a more comprehensive solution is being worked on (using Dune, or dune g=
enerated makefiles).

>=20
> 6) The re-indent patch.  Policies of when to do it aside, having tried
> using it, the format adjustment is incomplete (running ocp-indent gets
> me deltas in files I haven't touched),

Perhaps we need to use the strict_comments setting, I think it tries to lea=
ve comments untouched,
but that also means the outcome depends on the starting state.
And I hope it doesn't depend on ocp-indent version.

> and there needs to be some
> .gitignore changes.
>=20
> That said, it is usually frowned upon to have logic depending on being
> in a git tree.  This was perhaps a bigger deal back when we used hg by
> default and mirrored into multiple SCMs, but it's still expected not to
> rely on this.

We could use 'find' instead.

>=20
> 7) Patch 8, evtchn fdopen, is two separate patches.  One adding fdopen,
> and one adding a NOCLOEXEC argument to the existing init.
>=20
> They want splitting in two.  fdopen() ought to pass flags so we don't
> have to break the ABI again

The ABI changes everytime a new variant is added (the interface hash will c=
hange, and you need to rebuild/relink),
so using a single flag variant doesn't avoid ABI changes like it would in C=
.

> when there is a flag needing passing, and
> cloexec probably shouldn't be a boolean.

The preferred way to bind CLOEXEC in OCaml is to use a boolean, see
Unix.html <https://v2.ocaml.org/api/Unix.html>, in particular
`val socket : ?cloexec:bool ->
socket_domain -> socket_type -> int -> file_descr`
Perhaps I should've spelled this out in the commit message.

>   We should either pass a raw
> int32, or a list-of-enums like we do in the xenctrl stubs.  Also, this
> patch has inherited errors from patch 1.
>=20
> 9) Patches 8 thru 15 need to be the other side of the intent patch,
> because they need backporting to branches which will never get it.

This was done on purpose like this to ensure that indentation is backported=
 in some way,
because the lack of indentation has previously broken backports/rebases (se=
e the debug line introduced in the wrong place in the live update patch).
Without a comprehensive testsuite (which is being worked on, but not ready =
yet) it is then impossible to tell whether a backport is correct or not,
even if it compiles, it may have some things in the wrong place, and wrong =
indentation just makes reviewing those more difficult.

Otherwise I have to keep making changes with the wrong indentation or avoid=
 indentation changes in patches, which has previously introduced bugs.
It is extra work, and all it does is decrease the quality of the end result=
 and confuse both patch authors and reviewers.
Furthermore the indentation commit on its own is separate and can be proven=
 to have no functional changes if you view the diff ignoring whitespace.

We first need to make oxenstored suitable to be developed on, which means s=
tarting at the basics, fixing up indentation, build systems
(all the bugs in the bindings you pointed out), etc.
I tried my best to avoid making changes like this within the XSA fix (which=
 only contributed to lengthening the time to develop it),
but now that we're no longer constrained by XSA rules we should fix things =
the right way.

Keeping the status quo just for the sake of it only discourages contributio=
n to oxenstored.

If it helps we can consider all past versions of oxenstored unsupported (by=
 me) and support only master going forward, and once we have master in a re=
asonable shape
we can decide what and how to backport, and which versions to reinstate sup=
port on. That would avoid placing artificial constraints on master developm=
ent.
I intend to change master substantially enough that most backports will be =
impossible unless you take an almost entirely new version of oxenstored.

In fact releases of oxenstored shouldn't be tied to a particular hypervisor=
 version: there should be a single long term supported stable branch of oxe=
nstored and a master branch.
(I understand that is not possible yet due to the use of the 2 unstable xen=
ctrl APIs, one of which has an outstanding patch series to remove the depen=
dency)
The current situation only creates the illusion of support for the backport=
ed versions, because there is no (comprehensive) testsuite to check that th=
ose backports work,
and XenServer only tests internally 4.13 and latest master, anything inbetw=
een is technically untested, and may be more buggy than just running one ve=
rsion.

>   This
> is why bugfixes always go at the head of a patch series, and
> improvements at the tail.

I agree that is how it should generally be, but that means improvements can=
 never be done because we always keep finding more and more bugs as we do i=
mprovements,
and then do a lot of risky rebases to get patches moved ahead, and without =
minimal things like automated tools to keep at least indentation consistent
the end result is a mess that cannot be trusted.


>=20
> 10) Patch 12 talks about default log levels, but that's bogus
> reasoning.  The messages should be warnings because they non-fatal
> exceptional cases.
>=20
> 11) Patch 14 talks about using caml_stat_strdup(), but doesn't.

The commit message for this is fixed on my github branch: https://github.co=
m/edwintorok/xen/commit/dc893a079fd7cf2a9bb8ed03cca3d249a53e3c44
It initially had that function, but it is not available in 4.02.3=20

Thanks for helping sort out the patch series.

Best regards,
--Edwin=

