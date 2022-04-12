Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E54FD4B1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303573.517904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDPH-00086c-Jf; Tue, 12 Apr 2022 10:05:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303573.517904; Tue, 12 Apr 2022 10:05:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDPH-000846-Ga; Tue, 12 Apr 2022 10:05:55 +0000
Received: by outflank-mailman (input) for mailman id 303573;
 Tue, 12 Apr 2022 10:05:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neDPF-00083x-W0
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:05:53 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21355f88-ba48-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:05:51 +0200 (CEST)
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
X-Inumbo-ID: 21355f88-ba48-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649757951;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fomlEUlckjX3TNuc9540z65qkWJl+7ZgtSW/3GqjuXM=;
  b=A5ARRNbXI4zdTdEBNVsd5d7PXI5daCEVLALyZH+YXK2tz5sboHqHGXlw
   5IJh0azLyTijIaOwb6XNiH1MjXmb8+zTTefXKanCdpUYSGvvmTfJGYVY2
   sLx/BG8pyBjnbsEFs76bR+TD5ssmsmg6pQ/r1vLAVT2NkyIcM33SSqvjS
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68674986
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uQUeNK2xt4AKiJpSIvbD5cVxkn2cJEfYwER7XKvMYLTBsI5bp2QFz
 TYbDz2PP66KMWb9c94ibo20o0xXvsWDzd43QQc6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIx24Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1qmoO3cBYJB5GTt7sAUjdeFANULZNZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u1p4RQaeOO
 aL1bxJzMzPsZjJuIWwsGb4Fv8v1o0fZdGNH/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0fPVPFNQryDixlYWL/ge3AG8mZC5/d4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp/ZgPf1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGAhfBY5Yp9ZI2KBj
 KrvVeV5vsA70JyCN/EfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLWlMnaKq9ZKRb3IRFBiba3LRwVsXrfrCiJtGX07Cu+XxrUkeod/mL9SmPuO9
 Xa4MnK0AnKl7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:TRnfEavEbU0qhTSDcsbbOs7U7skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmH56VNN1xMvdfNVa9NC4kEFjiaGgPR5t3c04klfbMkcEIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68674986"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ/rP3dlNREj++wfG8XPjjPD9nzUKo698Fa0FDbDSJlcANnyz72HPasos8GcQCyKgHDZIEepmvhP9nXgVlV56QUt6QX4XKqSR10NKCL/njXx+i1rWKheNxz3QKRuTnQmOs1xoY4+Dfw6dw0Zw/9HKOkeGkpJFBIWHPhBlzyMuuiVS6DOqJofnpO4Gx60XyzTOyr0ncIZhY4XVZE+zOSJ6lUq7Ovi/GayhCGMqsg95SgDRuErAUGKcdo5K3wnRNfYWO6Nf0EHe68DIdcGJ9wGIYnU/aEc6ZUyQh4An3sUk9aw9dG8iaCGuw/l+oh5X8cOlZXQxjUlgm49jKmWeGK8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyGdbvd5XN7XcjCzQ2srCi8QDDeO0xX4ZiQGX7jhEE0=;
 b=hq0cMgKupozCF2AhugeCmDQCllXf2ZX84StGeRQUma4bF+92yFH801OBZZVYAC4waJyxT2NttfcsoXh7YwAS30riKskD59ML68eyBeWnieQjddiQwAmt2ggdM6vx02yyZVZuTJiYkKDM4xcisAKQwfsjdcjJHBDFilPAPJOclYIT8HD5/gXBgdTZ9OEiRBiTMSr9tMIYEQGlJtkd5kmzgTY80ZF6QoH5iAfMhDWBQIoDptGX1hDjXppS0PoznPpHudYJ9GsmAUh0kY8I2+sdHbsiPk4hO+O16J85cbOJOUgRbZAKhj42cr5PJ48rf3BtHC/DMmZwZShzzjVZCdROug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyGdbvd5XN7XcjCzQ2srCi8QDDeO0xX4ZiQGX7jhEE0=;
 b=XQHWHjHjmBJ5BzvMZ49rfuLhMm3kln1ToCcTUvXfLx9rRel4HZGFMC++7SVirumi5Uikj8uMhIInvU558vCDhSvUx6AiuMUCMjMeQqk6LbZxf39vYB67r5/9Z+j4kyPse74jcwPipRIBAmJnShOARoCwno8gIALILNoQ80NlSa8=
Date: Tue, 12 Apr 2022 12:05:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/8] IOMMU: log appropriate SBDF
Message-ID: <YlVO86RI3J9+qI+k@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <e8780667-2307-fa7f-0768-753a83e00082@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8780667-2307-fa7f-0768-753a83e00082@suse.com>
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ecc4c44-b241-4d2e-4e35-08da1c6c0207
X-MS-TrafficTypeDiagnostic: SN6PR03MB3536:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3536B36FB9C672325E57AD7F8FED9@SN6PR03MB3536.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJghTE9FV6rIfJXHq6GO6Zvv0Cd+YFP9cazdr47xLfy+QG1AOopfwQRE16u3RM0mkM9W3OXP5L3R2ZA5FwgsODSC48LiRu+wVKOrTflHu8zuYs4kDLJPRo41wOoqXLTUjY0KTW7fvO0SEGjiHUgWhC1YsHAB4K57SSJQoOCSROZuAV9RNG2LaknupaxC/IBnpBXQnliiHCCGNJk7SdgrwFtVIGvPOLHuR7i7akYOOTg1lgGKKCRkRr/nulGDiSwAw6dVbB1avGvl9kCUiF0vqO0vHZEQYQ8gzOIZR6Q0xeSuXzSjndVvhWMFBgOXKEFiQlds/gR832Vf+UvZ4M/8e7RaMWjykJVJEeM9AlI0WRLtXi7vJ5vVr1w0XwyhUD5Hgaodh0vHSF59jTq3x4LgVxUJp4h8tBP3oORsqiiDpPRjB2G1wEcVSNPasNg4PQptkERKAV+FFNMJFIh6dl/07jIEyvS1PvaDhT74FN+OJo3yl2cm/r7bJzOLcaO2zr2r1d16E2d4GjMcCibt8cLLk3JA6vwcryDKPGqHPwanjHLgrJhYjXfneXaB5jYjv6Hr4/V8zANk+ow3RahoflZixvLWngx8NWfoxjCIlZxlQpYLn7WL1jjjuXNYJmn6ZpPw26q3UK4cU6+j/QqTlMdu5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66556008)(66476007)(33716001)(66946007)(86362001)(8936002)(82960400001)(4326008)(8676002)(107886003)(508600001)(6486002)(5660300002)(2906002)(54906003)(85182001)(316002)(6916009)(6506007)(6512007)(38100700002)(6666004)(9686003)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bENNeEUyV0V0TFdtbWVsSngrb2FOd1pOVHZ2T1k1VFF5akpTVEgxZWZxRlBp?=
 =?utf-8?B?aXgxUlhCMlRhRStmSWlRb0V1ZU9tSktoWU1RdG1VY3IyVzZyZUwxcFpMWmZw?=
 =?utf-8?B?L0xZL3hIMVcvSHNpcHp2K2tmck5keG5vbjU2Z2hwQVF0dU9jT2puM1VRSGlt?=
 =?utf-8?B?VUltdkpReWQ2WmJkMHFXZWlzYWdSWE1uYkxoWjNoTW5jdm9zbkwvRW9UQTN6?=
 =?utf-8?B?WWFZeGlPVnJuTnhtSWVPbEpCSy9lOCt2R0VIQlhZYkJTMis0eTl1L1R1Z0hE?=
 =?utf-8?B?ekdaWEFkR2FCR3RsS0hXNiswNDhZM0pIN0pkbk10SElhK2dYTEJhek1WclVv?=
 =?utf-8?B?U2RGT2lxTnEzTXduZDRkTnY0bDg2KzY4M3N3MDBuNUpDOS9NUVZReXVMakI0?=
 =?utf-8?B?S09FbjVZYTJ2S2JBU1AvbmlMWkFlM3VENkZlUUQyS0ludmIrbFk3MjNMaTVy?=
 =?utf-8?B?SDl4anZOT1FCdVozOFZTL0NLVitOcU5QRUo2d3pJVUxRSnNuNUNFUWphUE5E?=
 =?utf-8?B?blBoc2RyT3ZyenlIUTUrTVhnbkU3R3VHVHFDODR2VWgzdDI0Z3N5TkFGYjNF?=
 =?utf-8?B?OGxZZlVJRGNsYzhybm4vOEo3OGZuN2sxT1ZVT0VTd24xcGUvZnhjMjl4SjY5?=
 =?utf-8?B?WkxWYjQ0dm50cFA4Vjk3cUlpQmhieVFUMkdNUHM5NjY5ZXBjMXd3Sk5hUEhO?=
 =?utf-8?B?eE5lTk9ITmdGWklKbHhaeWN1am04YUJNMVk1dFJGUjM1M3phcUN2OTFEUVBr?=
 =?utf-8?B?enI1Z0FsSTZHdS80eVY3R0dBZVNlQmFSbHBsc1NSUzVvQ1NGaGIveXBhTEh3?=
 =?utf-8?B?bmFwby9GVE0zbFlGRFFQdWtjbFpMZEJvbmtnVjFjTWE3cXpkbHc4djRXSTly?=
 =?utf-8?B?SzRxWC95WHkxVDhRNm5pQTlPbEFwNFpNRnRSbmdQTnFCRG03VDdQMHNsanp2?=
 =?utf-8?B?SXBESDBpSVhkRU8wT1k1SkttVGFkL0xZbTdZOHJUVFprMG00UVBqTnR5ZEx4?=
 =?utf-8?B?MjIvQzY1NXd5SVFXMTRyQ2xodHg0S1p3Mko5OEM3cHRlQmFtT3BzQnh1am1V?=
 =?utf-8?B?TUtZMkd5ekk4ZmxJTEhDdTByek1oR0sySE01d3FLV2RmNm5uZFZDMDM3VlBp?=
 =?utf-8?B?dlZKZ0JyRytCclRkbnduN0YrS2JKMTZDMTdCMDkzMUpnVXF5Nkt4cFV4UkJB?=
 =?utf-8?B?WmJYRmVPTHdLOVRvMzdGdGhES2hMRmxmQk54ZVZXa1RlSzN3clNsV0hqdTNH?=
 =?utf-8?B?ZGNlS3FaNExUQ3FpMVdVbFRteXJDWHRXbTVGdEpNd2RkR0dwb3YvQmV5Vi82?=
 =?utf-8?B?dVh1UEM0OFJyU2w3U0VFQU5aazExbStnR21NWEhmbTdUalJWWjFObUVjWEI3?=
 =?utf-8?B?SjYzNTFaVzlqUkZtMWNjT215NW5YOSt2aTUwaGxrWHZYNFpETkNOVHJFZ3NK?=
 =?utf-8?B?OUxyd3FzV1ZzSTlHbnBjcHMzMDhYWDlaWDNGNlZFM0t4d2J3VklBSU5IVnFs?=
 =?utf-8?B?UEUycWg0ZE5GWGFaeXhvT0tSdVRjRUd2UXlzSUlRVEszc1hHeTJKYXd5aWRZ?=
 =?utf-8?B?aDdpbFpWNXlFdHJFS00yTFoxVDVQK0JhM09sOTdDVFM2TmNmcDJ3RlVvS2FU?=
 =?utf-8?B?RnlWTmRsT2xQMkJBcHVMeGJFOUUyWmt2N01UM1NYNjgzOVZZWEZYUmdJUlNC?=
 =?utf-8?B?SS9wRXVQQ3hodHlnaDhtaFg1TGM3WmtnYlJzdTVZTG1Cd2FwYnNvSkNRcklp?=
 =?utf-8?B?Z0JQcnhOVkdUNjdRemV4Y0N5a2tWVzNScUxaUFJsMXhRbCtEYUJEeThmajFW?=
 =?utf-8?B?bm5IUzFDUGMwSUk4MlhnRitqcW9HS3NmZmdGSS9GWlcyUlVnOVROTm9sVDZq?=
 =?utf-8?B?cjJ6L1locUNCTzQ1VXZXaGViZ3dSTEljYTRBWTNtdThLdTlBQVhnM0tkYkov?=
 =?utf-8?B?Y3A4VWE5RUVMMU5HeUF1RVVXcnhkQSs1V3FYdjFMdlQyTi9OcUFFNkRsTk9M?=
 =?utf-8?B?VVY4dWFKWVhLdDdmckJuOEtROTEwWFFlZ0hQcXkvYW5VMzNmeWRhVWE1VXVJ?=
 =?utf-8?B?OXZ5OURGTi9lcHdSY0hteWNqNjZpWTE4QmoyenpMRDlNVlV5TlMycUU4N1g5?=
 =?utf-8?B?YmZjU3N6cWcwWXlzd2MzQXdSNlVxWnV3MEVaVFpJdE00cDlWdmRRNEdBaFJJ?=
 =?utf-8?B?MkpCaElxS1ZjaTdSMUZLQ2x1SWFIMFBFRXc4d1BvaVdmS3hIdmZHZmJsNGlE?=
 =?utf-8?B?REo3V1U3RkZGYjJPeE1ZT0ZPUnFTNk1ETGt1VFVmbFZ6ZmFMdDdBc3pUQ2lO?=
 =?utf-8?B?ODFtM1VIQXBBUkpCUWczUUNlaE01VnRnRDdIRSt4NUFtZFlFS1VMRmNnSzN6?=
 =?utf-8?Q?YyLhYqiDUTRMnY70=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ecc4c44-b241-4d2e-4e35-08da1c6c0207
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:05:44.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqo4Ge2q985Js+Xjk2olx94DUeaqKBMALn5YaJjIo620SHayg4JYC+SirFMJoSEv6Ayadk79vAo9pVE/UlZNrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3536
X-OriginatorOrg: citrix.com

On Mon, Apr 11, 2022 at 11:38:28AM +0200, Jan Beulich wrote:
> To handle phantom devices, several functions are passed separate "devfn"
> arguments besides a PCI device. In such cases we want to log the phantom
> device's coordinates instead of the main one's. (Note that not all of
> the instances being changed are fallout from the referenced commit.)
> 
> Fixes: 1ee1441835f4 ("print: introduce a format specifier for pci_sbdf_t")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I'm unsure it matters much to have the logs from failures to find an
IOMMU using pdev->sbdf or devfn, as the parent device should have been
added before attempting to add any phantom functions, and hence would
have already failed to find an IOMMU.

> 
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -291,7 +291,8 @@ void amd_iommu_flush_iotlb(u8 devfn, con
>  
>      if ( !iommu )
>      {
> -        AMD_IOMMU_WARN("can't find IOMMU for %pp\n", &pdev->sbdf);
> +        AMD_IOMMU_WARN("can't find IOMMU for %pp\n",
> +                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn));

Hm, the call to find_iommu_for_device() is explicitly using
pdev->devfn, so while the iommu of the phantom function is tied to
it's parent, it's unclear to me that logging the SBDF of the phantom
function will make this clearer for a user reading the logs.

>          return;
>      }
>  
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -461,7 +461,7 @@ static int cf_check reassign_device(
>      if ( !iommu )
>      {
>          AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
> -                       &pdev->sbdf, target);
> +                       &PCI_SBDF3(pdev->seg, pdev->bus, devfn), target);

IIRC we would first reassign the parent, and then the phantom
functions, so we would always hit this error first with devfn ==
pdev->sbdf.bdf.

Thanks, Roger.

