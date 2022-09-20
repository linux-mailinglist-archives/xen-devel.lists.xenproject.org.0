Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D65BDCC7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 07:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409170.652108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaWGz-0003lg-Sl; Tue, 20 Sep 2022 05:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409170.652108; Tue, 20 Sep 2022 05:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaWGz-0003js-Q0; Tue, 20 Sep 2022 05:58:21 +0000
Received: by outflank-mailman (input) for mailman id 409170;
 Tue, 20 Sep 2022 05:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfQM=ZX=amd.com=JYOTIRMOY.SHARMA@srs-se1.protection.inumbo.net>)
 id 1oaWGx-0003jm-TF
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 05:58:20 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38dcd22c-38a9-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 07:58:18 +0200 (CEST)
Received: from DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 05:58:13 +0000
Received: from DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4]) by DM6PR12MB4297.namprd12.prod.outlook.com
 ([fe80::badf:4ed4:db1d:e5d4%3]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 05:58:12 +0000
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
X-Inumbo-ID: 38dcd22c-38a9-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocurGGHv5J16ULNy9CqmfUHDY81MuffM+Bf+BNtAJNezOWfjgNrnMpJahTX7oAaY53NxSPkLzwqLRLAizzEocAtr4QiPFuclZZz7mQHOTa1D+IukuLZUdM0uIIdW4G1AaF9jI+yN35xOkp8ePmaYLu7MmLePJnInbOqVc+rXTEcFzrP6iqccL0rPG4CYc+kA88S+BGHP4n/UAKGBYYyycpN9TlqAvfmuyifvx32dpYUV8jlmOj57dYRAks8Rp3LAnElV+WzkYXeFbMnQqL7Q+eNUlOmOY1+Xbw6d7g0242Qya00GUsj+BfG7gbQnlJbwqazOhhaeA0H5yUFgV8I9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf+JvIjyGEPaxAP0I8b6I/S8oRQUndgmiZAxEYLbEvA=;
 b=fLa5uMqPd62F9wGk+5GqcrtJpPExPpTZzuUjCCYjjf2eZM8st3SF0LkafnjQLkqgdlax5dIU3QLZEjn5uY10LpvZIdV7/+KugFiPkZ7V9FPEehvyq+8U94Bv5cNn06QMfRPfrpgyHwV8OXYmcsorLjijWUyJBOyYaGOaXDyn90GNpzXRd/44UOX+azyAzuC2FXM0htmjvjlw1hajEDTl/J/kHY6nByuHmP2U3/KVgW7MsP5LsIvGywR9uAepVKe/lE+oYs7aXHfl8gP9ypk7cGrfhenMdqa1MxkkE0ChwloRRaVuZ2dlCggWe2tB2qTL4ERdISuN2GfDrvb41vGQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf+JvIjyGEPaxAP0I8b6I/S8oRQUndgmiZAxEYLbEvA=;
 b=ML3oqZ5YbB2Ho7yBRQkZTPNYEh+3iotuZmlPgX9JQ3c0pyDzImtKk2NCUFP0T+Frku6PP8vKl4vFMLCaHdpVAtYqqfYkRyArlhfZJVLQ9K7Eb1yvjBHJbL2cve9frA9Edn3HiZ/HbK2cp2Ax+tnZllUxbMPmuDpccZoRAHCIPwU=
From: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Mallela, RaghavendraPrasad (Raghavendra Prasad)"
	<RaghavendraPrasad.Mallela@amd.com>
Subject: RE: where are xs APIs defined
Thread-Topic: where are xs APIs defined
Thread-Index: AdjMU0z+DCbAdhQcS5m0EtpwYKQWwAAYXIcAAAA5VtA=
Date: Tue, 20 Sep 2022 05:58:12 +0000
Message-ID:
 <DM6PR12MB4297D2293DC8C954552E6E7A9F4C9@DM6PR12MB4297.namprd12.prod.outlook.com>
References:
 <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>
 <301dedd2-9407-2386-2c20-f0ad6ee42f42@suse.com>
In-Reply-To: <301dedd2-9407-2386-2c20-f0ad6ee42f42@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-09-20T05:58:10Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6773cdd2-ac38-4114-87a3-40ef6af50bbe;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4297:EE_|PH7PR12MB5927:EE_
x-ms-office365-filtering-correlation-id: fc5c2bd6-e488-4977-9174-08da9acd1a6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u/CNTupZVRMdhMe318HvaCLyPpbi3br12KWLniZtAZ+M5CGrJO8nqaDICr1lAvfEYLgOa82u9pQRWTzuijDXo7CEiQCeKxQs8Q6uY7sfa4aCOAlzrM56ZHGn3TkvmlcuS9c3SEbmsRj4YAkrPr3XUKuJBcED8C+RovQ4K7fyihtUP3m0x50zvEx44wYWRvmdV9dnizS57AbP1k/FeslYz0IALCTlVE5hMYYgVtjFH7AZwnq6+Erjg4SbTtbSIycW/QxyqUcvgHX/wpT08cTTql9Fe4tEWQCyZ7yRY5RKx7pG38GC4LP8+971Q2yRL9WsPIwyWLRlAtvplAdblZcJpiqCm4uPPivwnx+BQd3IUxF9rImm+g/VmKyjbvpdHGojWJD+6XPIMPXvXr/TsTQM0E9Nr5aDm0PyT/c75Bqm4Llnr9VCljIRvJlsibA89x4QvqCEziMH6OuZhxr8HhJf3aXcdIDQoBes5otruu6hnj+fyZnEVxOZx2wI15uQLYqKK5pQOVoK3rLeVFStEn+Z9aXv2gIfadLe0ukFzjbzhgSWaaknnWDZcH8RlVI95nYBo3ByTU2HWsXZUxhFxo4Ca6oy+HZF/4G1LycVRoe0/a362WOOpQhluiB5dOb003ZJ3rAnPk8AyA2Tkvuo0n86RXlxgsQDKglKkcKCZNwSxHjLNLroXCrDOpTzqEjlbAlFSQQzzKWqUp7dGJJEC7O4nkJKAxgFD3d4Ly1GyDrZcwf6xZPj4Kv9Ee8Sy3s6424eAMj51yPbaykCJob5YoEzBA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4297.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199015)(5660300002)(186003)(316002)(4744005)(52536014)(53546011)(55016003)(8936002)(38100700002)(86362001)(26005)(9686003)(76116006)(7696005)(6506007)(38070700005)(4326008)(71200400001)(2906002)(66556008)(478600001)(110136005)(83380400001)(33656002)(66446008)(8676002)(66476007)(66946007)(122000001)(64756008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mnESAu8fq63ADrmxNA6EPzNUUohFxF3LvvS/2o07P7FatNNelfn55ggkbG0A?=
 =?us-ascii?Q?DcMpxlUY/i4/eRw9TZrMM4VeLklCfyq8MDC+lkgJO9MyDV40MBq75iIsV5lj?=
 =?us-ascii?Q?jEMNLNR8Y1UdQ8RW1m+2tXjUU/3UHBbDuYJbS9nGG6uwqDq1PAdY0wtbpf/S?=
 =?us-ascii?Q?QACDEvnFq/iImJauSJgcSHhbb/OFm0KK46J5G9zxmpTETgVjtblY9eEJLjqh?=
 =?us-ascii?Q?3yoXcZ0yzo5JNMb6c89bPPCXemUTGzre7NdKiqkgWCEMW+qKBWvSYcOekhYH?=
 =?us-ascii?Q?oYI52Q++/d24V56j+h5erjJpxHYUp9nzLGOyfabABuUOXVpFBXf31pauCvGR?=
 =?us-ascii?Q?oyuxyeECow465GmVo0OZG4UTSGLwW0vyHIT/dUnAhOxmfMv50dk5qx/Vwnoy?=
 =?us-ascii?Q?b7KzXFbSvlMRlLE/hPAuTcXFrElHP7iT/zKPBIKgdbh/aafL1VY/+Kn88may?=
 =?us-ascii?Q?zWBL2f8ufxlU8+q1z7uekXBSmHgRJq32n33o8A4j/Exq47dT/FvBzvzLtIXW?=
 =?us-ascii?Q?5HTuPG2gzWHn7cn5vSriFTurejikP7KIsaRIu0RWolGEdscRIw7skkcs3gMu?=
 =?us-ascii?Q?k1/K7NaDXdFIgszmFkkNidBRc2foiewMrRJ8cUD/KHPppSSO/wYGZPazNAv4?=
 =?us-ascii?Q?am6ksYQ3sWg7W1Bal9ngnCkqSAhUfgl0h/IJq3RMF5SQMjTEqpOAbIEQWiDT?=
 =?us-ascii?Q?6VAkJKsTE+vDYVbdDrQ/ySWijPbkvoNme7H79SAcQn3eCH2K0TpdVB42JKjt?=
 =?us-ascii?Q?B/EfO7hhKNTmtndvvwonepui8Pv/MfNZdXE4mx2QB0ysbifk+F/dIebo5BLo?=
 =?us-ascii?Q?e1ew/X/8dpNs43Xb5Kn13l3i0u01hJHgfP3qwVZORsbcC/3oyG79OSSqgnTH?=
 =?us-ascii?Q?qcSJJFCyXRZ0eLi+8myR+I5bb6sDU46/0SGfV/O+QMEeGjYmUxRBkGAVJLvE?=
 =?us-ascii?Q?pKohJGdIlrNTUXf2N6DJdC0aOiNYNQt9gEZMDTXp9bPMvxZY7KVi8EA92P5r?=
 =?us-ascii?Q?LuFq1N38PhznieagAlcvcwT6iaStHvVpM/0lu0gVKv90p0dVVMHEWnEqQZXk?=
 =?us-ascii?Q?M3Ux39dFtCPvREsLHyoD+XSrUB/tn6+F0QR40LsK5fAj+Ju6I2SuPhMk0iCS?=
 =?us-ascii?Q?YMXdzTUTvwMPA+++TvKtPpTc3tlcUrb6pCks7NtzvwHNZd6efx2VhXYsJHZf?=
 =?us-ascii?Q?GNFIQw/WflXKRAoUy75vUec6G1PqJPrMbgNv0MeYo4RB028nsiyLAGH5hY3S?=
 =?us-ascii?Q?925R5AfPQ6OReBWfmPxGELNT1ZA2GAq0P32X3+uD60M9WKIioWgca42Vf8BZ?=
 =?us-ascii?Q?99oivX8eugUsnRocEJ3o3iPC2MPcRYCIVviv4a4gGdB3Gs9FwGfBoMTezZZ1?=
 =?us-ascii?Q?KrYy5HBRisKQfRFw7E02vuFWGo1Cw8nsUDytabqWf5eaSBlxlWRRuqrEpAFV?=
 =?us-ascii?Q?bqsZh8ELYmKFFXsmxCuDRB6mJoeKPzQs7rAK3caPlk9SamZ6gVJMwZ74zu9r?=
 =?us-ascii?Q?WsA3Lqtd40VqGf68vSh8HnXiW8LEGsuA/oOSBwrAqBjP30Dg64ru/B2WHa33?=
 =?us-ascii?Q?mxNUMKKeFcqo9EvO1oG2nZ/1TCWRTiZkAoO7DzRh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4297.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5c2bd6-e488-4977-9174-08da9acd1a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 05:58:12.8239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O01HLAd2ZiFx07Z9KgL4Vizx4vREy/wST8jeXgyRpVTGQ2EKGSpmBSi6zmPQrXf9vE67yCk3iq1N1kDV/DSHJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

[AMD Official Use Only - General]

Hello,

Thanks for the help. I use Visual Studio Code and somehow it is not able to=
 find.

Regards,
Jyotirmoy

-----Original Message-----
From: Juergen Gross <jgross@suse.com>=20
Sent: Tuesday, September 20, 2022 11:19 AM
To: SHARMA, JYOTIRMOY <JYOTIRMOY.SHARMA@amd.com>; xen-devel@lists.xenprojec=
t.org
Cc: Mallela, RaghavendraPrasad (Raghavendra Prasad) <RaghavendraPrasad.Mall=
ela@amd.com>
Subject: Re: where are xs APIs defined

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.

