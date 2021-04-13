Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB7C35E0D4
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109821.209689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdb-0006Eo-Mn; Tue, 13 Apr 2021 14:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109821.209689; Tue, 13 Apr 2021 14:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJdb-0006Ds-Fs; Tue, 13 Apr 2021 14:03:31 +0000
Received: by outflank-mailman (input) for mailman id 109821;
 Tue, 13 Apr 2021 14:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJdZ-00061C-RK
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:03:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e785078d-3c3f-4fef-b0cd-cc4fe7c3f96c;
 Tue, 13 Apr 2021 14:03:29 +0000 (UTC)
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
X-Inumbo-ID: e785078d-3c3f-4fef-b0cd-cc4fe7c3f96c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=oXBqzDHS0FunQwg8diVLE6ArqyB8CJV5O3X62tjR+BM=;
  b=iNxJA4V3XzV47Qztg7qCwdzt0ppQXQY8JGq2h9eul3Xr9GKm/MMI1V2N
   gmWiFDSRDYtTqCN7JGceW0Hq1JA3rmEmaiaEleBS2O7GDe055osG0Qdzp
   OokhVV5rN3IW6vtcvY/FQc0sn0OBqN3IuQSMiVlGVPyaMIi6NVpD04M1x
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tfvxbq07lTg5oX2Z8AnOsJ5SekT4D10PZgd6qOPbJpRoOMS7CtAUfxzHKSeIPGRaPeSp/yB/yb
 RCWbSxMP7feK7HZIHOvjFwRGC954dK6KPyGfHhMdXT79WAzgXbQyhjAEu1kOtolVe+c4v9qBIb
 PQxtFOWG59rN+1L4gficCZ2VDpIlTYifIPXPzC1/oHnZLYxAHTmvn79N9BlyVEHkMreeaUz3vp
 cL1PySPC0eQDfRA/wULxMQj2VsWUjQkVBXc/jpFW+YkrDKqZ28bHe7xHTpDNnMlnURMMm3oDZP
 JBk=
X-SBRS: 5.2
X-MesageID: 41483950
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LAhmla9j00Fi2w7nWtVuk+FdcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2KmO2dxQxRLAod8KY
 GV4dBJqyHlVXMcaMm6AXdtZZm+m/TgkpX6bRkaQyM28QXmt0LU1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu3nh/kDJ6ZA+oqqC9vJiA4i2htEROnHQjG+TFf9ccpmjmBxwn+218lYtl7
 D30mcdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLsyuatjfhTU8EYmtt1nuZ
 g7pV6xjJZLEQjG2B30+tmgbWAaqmOPvXEgneQP5kYvNrc2Vbk5l/17wGplVL0EHC789bk9Fv
 hvAMz29J9tAC2nRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYAit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPcHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeI2z9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 eOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHQZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FtN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKstYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvx4aoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRguk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w3KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnE+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0EoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFydeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDV6XzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDrkvUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43oYHMwmkrAv0NU
 L3yVwkw971Gw+C36UdEaQ+PCB/b1U98m1r+Iq5BsftITTvU+FI51yhNHChNJdbVaieAL0V6j
 J3+cuBkePSVy323mnrzHZGC5ML12asWsWpBg2QXcZO7tyhIFyJxpKQ3/Tbtka/dRKLL2IChY
 NEckQMbsNMzhka5bdHrRSae+jQuUIqk1xX/Dd9sEXis7LWuVvmIQ==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41483950"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw0oyHNjje/jnNrlW7IMhNEK4DNIa4Yl9gekwZ9Cku/CH7rGF13Sxiiv+iLnr8yeak/MoMoJdIgtxlnRLz42mAKTheROdtwu4HT/Ts14eOHOVxa2e+FAAFMHUpLGKyGvdMDRX1x0UpZwx0KK5yLwS9UFrgPQQtFyWJwy3hOhs8DQhMO3BBRIdwQdYaIUJWA2GZZB/MhpsuRFuRGpFe9unOo5X/LVgvXYR76NBsxrtP/sMQ14aeU8xJAjdNAVFEnB8dYlAjRgHDKGcDAOq92Di/41MNWl4IiGpyhlV9WTTHDD3D+eSoaeA6o1uz6E+Thlj6JZ7OVGfDaKBN0M0TObuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r1voEZpGxTx5Po9C2mMe1JKE7C2WQQb65ZrKzQeT0o=;
 b=glV+DgQuKchOE+Owvs8ukMAyWyGLm60a8z+fT8BVcBIfKBLDnMIYfPgBga0WGQV9PknHj/g6fQJWhrJVbUmIoXXdvZAQf3Bt+toxW2UKJjv3OKH6XaHTQLc3NP8zWrhvV+dBJs1Cujs+B3wcjf3UWRvRi7CoNmPhc1+w4yxtF6PXlaiy0n7QEdvAWY9yfZ+TboC0aAUI6doz3wAIl9bEdt5tdlpWRpkHSsplbJXmZhJjRMhrNnyjDBAk3ATxEZn0IsfkKDtcI2vVEkJWF6Oxniktuk/Ltdg7W/fJv4j0JuDneu0pP3bwhFvNMCoeJRavmtkvs0M7g3yNwr9B+PXV+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r1voEZpGxTx5Po9C2mMe1JKE7C2WQQb65ZrKzQeT0o=;
 b=Gf83JbncVahbefDOWWuoD/977ZIKlbJJEVs8bgq1pFs7FoJRBbPR4j/7Xrbd25GZ1awus5wNRVWmsJhhydsZFEoxKVSijKXmiqh5rgYavzMn4hGxyLVByBdErgWcLA3kFFt8LO/7kXcI7tmPC7mpl6iye3Mhva3O9xtTW82PIe4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 16/21] libs/guest: make a cpu policy compatible with older Xen versions
Date: Tue, 13 Apr 2021 16:01:34 +0200
Message-ID: <20210413140140.73690-17-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ef1e11a-8ce4-4995-71ab-08d8fe84e7d5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB296938D2447A770A6BAFAC9A8F4F9@DM5PR03MB2969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXVVVVErsVWXsrbZaV65auWhAu/+4nK+lxu9j00UhkQKRj6xxT5fZvpkmgbLZoSd/KBG16FXC2iFfpZtPJtHpCjNRRRcBklbClHVOu7PBMPPRE9FhX8TkhsYuRruYp+39PbadphbL+8Qp+9cD80iTPheI4evKdpZa3UkPlnXiU9Mp1z2llYDfh78w4ZEF50Q1Zj+l5Utb2IQ/W/S7IKqsg4VHoQW2a7CaJ5jhANQJRm0z/Fl0eUl8HfBlUzv2I76weq/no6MynAeD2lFyT5EW0N6iqbJSCN7XbaD4dYC0rT2+BeaZE2dw51FOERs7qEwPHD8RtDm3GjIGoU+6/xHFBmDEl8jPt16FqV/sMMa6cRnpvGvUW0SU+Ha14R7hG+bKxLMum3eLCN0G9TrOg/c+iCwyJuq6roYOc3B1ooMsf4hI7pVJfNZm58bPajFTGoRmNaVpjDk1dkO25eSh5+H8Ad0MDa4BMCaXUV2bL4AOQQNP28wsLxRP80GSg0hieEjORF9kjtRToAGb/a8bCNqpCrsFhydrhbLAkavvIVX0QkFUYMczZjZP2RqdrHzFWD/0QZkdKcvGInGSNQZi461RZbX+GclnJBD9zSkqsWmFrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(83380400001)(186003)(6496006)(316002)(2906002)(4326008)(36756003)(54906003)(6916009)(2616005)(6666004)(16526019)(26005)(478600001)(6486002)(1076003)(8676002)(8936002)(5660300002)(66556008)(66946007)(86362001)(66476007)(38100700002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXVjazUxVnN1QWg1dWVkU3dRM1JHeWtLQzZuSXEwdjlnbzZZTXppMnBIeXk4?=
 =?utf-8?B?VlM4QldRNWJOVGMvUm9aZEtRTGRhYWtrRlErY2VMMm5xTkRYQ0pOQXUvMzlq?=
 =?utf-8?B?S3NtWmt5d1U0ckZtelpLQm1kOHpmVFFrdys5UTBkbTI3OHRNdHdZaFdBL2xz?=
 =?utf-8?B?VU9uQzBkNmlCRThwZEx0RmFSZEVBSWRrRjlQaXBHZXRySFhTVkcxY2xLTlRm?=
 =?utf-8?B?OTNjd2hFdDVOT1A2YncyN216RW00eDRsWEl3ZUlMdFFmQ0FoTXhtWGlkTWRG?=
 =?utf-8?B?WkdqZEpnY284MnVHZFJYVFUyK0FZbTJiSUlsNkJEcm1hZzFkR1dieU5TRmdn?=
 =?utf-8?B?NDVPSGFORGszL2lWYVlibm1hUFpISGcxTE5ta3hVYTRBRlhtbWdveU1OM1Bw?=
 =?utf-8?B?K0F6Zk9vUTJIaCtjRjUrWi9xcURiTWV3M1huWlhsY1dUZlN3OENwcU5hMEow?=
 =?utf-8?B?U2dhYW1UcTk5UDJydllreHBSTW9jTUVNaFZ1RUF0YXB4dlkwWWszTnh3T1NX?=
 =?utf-8?B?RS9yMTlnSkNrUllkcTQwbFBNSjhSdXk0dmJRekVVV3BZUFdHOFZPbXlFb2NQ?=
 =?utf-8?B?NHViRXAvY2xvUzF1TUdVV3I3ME5EOWc2cVRVUUtYUUNHblh0akhpSmp4RzNM?=
 =?utf-8?B?OHFHNGV5S0dxendoMFZUQjdpVWZMR3krNDljdFpDd2hoTXFMMFhQdXFjTFdG?=
 =?utf-8?B?Q3JHOUM2aUprWDVsdWVrdEFQSW9BUE95TnZaaVdvTEEvU0N0UE1sVmVMMFNp?=
 =?utf-8?B?YVZxM0c5N25UQW9lT3dWSlY1Wm1NdDZQenI1MWFNbng3YkUvdWxISWNGa3A4?=
 =?utf-8?B?NGpsMUdpdk8wKytod2FKRmxVVSt3bjEvRzdSWExPb3Jwc1owaUdlOVltaGMv?=
 =?utf-8?B?cXBjQnh6Z21QeG95UEN6R2I5ZGhzaEozeTRsdGp6dFRIT3pLSzRDemQ0cGQr?=
 =?utf-8?B?ZDBPZmlvWFRiMGJXWmR4ME9rRTVhNENQemQvVm1WQVF6c2QrWDc1eHpudVVO?=
 =?utf-8?B?eWlDRGlMVERuNDlmVVdxMlFudnh1cm5tbHBCczBxUkdzcFFFT2NBT0Y5ampu?=
 =?utf-8?B?T2xOOVlpUjZxNGxTaUtLM1FsTzJjMEdETFZxNmlkTTV1SmNTdDhSdllrNjdh?=
 =?utf-8?B?YmFPZ2xnNzNyWEQvNGo3empkeWJnSHlqbW1TZEs4QTE4dVNxWEZ2ZDlSbWtX?=
 =?utf-8?B?QlhKOWNMSWJXb1RaaG1idk5XTmo4ZldzVGtxUEhmQ1BUclBOZk9Vb1k0bWdo?=
 =?utf-8?B?SHdjck9rZE9YK3ZqTEpmNkRnRlA4UTV3MGxUdFdYMmlrelk2ZDM2U0ZYU0dL?=
 =?utf-8?B?OVRKb3gzdGliY1FrQmt4bzVWOEdkUnVNUlZUcU9Qc3NkbmVXaXFvbEE0dk1N?=
 =?utf-8?B?bUl3OHhsUXYzNnFuOEdMOEFHM05wdXh6bXNRNytVQnU3QWt5Q1d0ZVBHTVJH?=
 =?utf-8?B?cHVBSjROUU5TR2RkZDFtaldXT0VkeGJHZS85VE5DZmpseVhTMjN5ZWJDMXFD?=
 =?utf-8?B?VG1IWWJCV2tuc09XQUtqcTNwNnhwQWtPMEFpNndrb01LTTk3b1AyeEszelo0?=
 =?utf-8?B?MWZVbjlkbU9SZEMrY3JMT3JZeWt2RXhwZGphYnB0TjRSYjRoTHpVM291ZWc2?=
 =?utf-8?B?WjR0UTF2bWRDOFFzR3ZKYU8zM1VBaEF0NGJwYk9Ld0RCODZ1UU5jMDNGZXYy?=
 =?utf-8?B?SWR0TGdoUUdaMGVickxqcURtTXlLeGtRL1RaUTAzdXczMEJTdWFjci9MWnZY?=
 =?utf-8?Q?Hvpk8DYwEpgQmA3YMoJQg68TunYnBdWgvnO2kB3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef1e11a-8ce4-4995-71ab-08d8fe84e7d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:25.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhYTjPzilf0yuDTc/veKg6EmyHVexle5bJPzaBYVzAYPqTQ/ZdHKZ8uy5iy13NiEghJVY2od/Jod51IkZXPsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2969
X-OriginatorOrg: citrix.com

Older Xen versions used to expose some CPUID bits which are no longer
exposed by default. In order to keep a compatible behavior with
guests migrated from versions of Xen that don't encode the CPUID data
on the migration stream introduce a function that sets the same bits
as older Xen versions.

This is pulled out from xc_cpuid_apply_policy which already has this
logic present.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Move comments and explicitly mention pre-4.14 Xen.
---
 tools/include/xenctrl.h         |  4 +++
 tools/libs/guest/xg_cpuid_x86.c | 46 ++++++++++++++++++++++++++++-----
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index c41d794683c..89a73fd6823 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2627,6 +2627,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
                                   const xc_cpu_policy_t p2,
                                   xc_cpu_policy_t out);
 
+/* Make a policy compatible with pre-4.14 Xen versions. */
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 6cfa4cb39d1..6486ac4c673 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -446,6 +446,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
+    struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
@@ -509,17 +510,14 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     }
 
     /*
-     * Account for feature which have been disabled by default since Xen 4.13,
+     * Account for features which have been disabled by default since Xen 4.13,
      * so migrated-in VM's don't risk seeing features disappearing.
      */
     if ( restore )
     {
-        p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);
-
-        if ( di.hvm )
-        {
-            p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
-        }
+        policy.cpuid = *p;
+        xc_cpu_policy_make_compatible(xch, &policy, di.hvm);
+        *p = policy.cpuid;
     }
 
     if ( featureset )
@@ -1072,3 +1070,37 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
 
     return rc;
 }
+
+int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
+                                  bool hvm)
+{
+    xc_cpu_policy_t host;
+    int rc;
+
+    host = xc_cpu_policy_init();
+    if ( !host )
+    {
+        errno = ENOMEM;
+        return -1;
+    }
+
+    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
+    if ( rc )
+    {
+        ERROR("Failed to get host policy");
+        goto out;
+    }
+
+    /*
+     * Account for features which have been disabled by default since Xen 4.13,
+     * so migrated-in VM's don't risk seeing features disappearing.
+     */
+    policy->cpuid.basic.rdrand = host->cpuid.basic.rdrand;
+
+    if ( hvm )
+        policy->cpuid.feat.mpx = host->cpuid.feat.mpx;
+
+ out:
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
-- 
2.30.1


