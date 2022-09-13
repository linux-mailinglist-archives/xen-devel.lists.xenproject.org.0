Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DBD5B6E32
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 15:16:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406391.648778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY5lT-00041e-K7; Tue, 13 Sep 2022 13:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406391.648778; Tue, 13 Sep 2022 13:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY5lT-0003z6-GX; Tue, 13 Sep 2022 13:15:47 +0000
Received: by outflank-mailman (input) for mailman id 406391;
 Tue, 13 Sep 2022 13:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY5lR-0003z0-PK
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 13:15:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad5f0d0-3366-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 15:15:43 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 09:15:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6272.namprd03.prod.outlook.com (2603:10b6:a03:3aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Tue, 13 Sep
 2022 13:15:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 13:15:08 +0000
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
X-Inumbo-ID: 2ad5f0d0-3366-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663074943;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6apVp30A8UXW/FTsQydNAJQiPAcvMjf6hCSgcJ3OH6k=;
  b=EKYaqSiaIe42GnMK7Dxl/Ph5nyYSKktMSngzI68mDA/B9zKIIwWyNtXd
   bNeNNgTC5LMqkdDbVoEQ3ztqxTVKyzhqSiTzvBxJkNWIejHSfKZGeTnHO
   0pawderi0kzL/fUGcPUTJ3iqGAPJcrQDbMVdPYwIn/2RfpCiDqBLmSgmi
   w=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 82911856
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EqG7yKMlE+Z8QIzvrR2KlsFynXyQoLVcMsEvi/4bfWQNrUolgmQEn
 zQZCG2CM6yIZGGnKopxOo6/9xsCv5fRzdBrGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMuvvY8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPs2vFyEk06GrQG//9LCGBN0
 KMSKBA0O0Xra+KemNpXS8FKr+F6dYzAG9pavXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr2wCCgLVW0q3rMzUYzy3LUwwFrlqDkLfLee8CQRNUTlUGdz
 o7D1zSjU0hDZIHBodaD2licguWVjC3iY6QDEYWc3dpA3VPNxHNGXXX6UnP++5FVkHWWWtBWI
 E8P/SwGpqgz/VaoCNbnUhC+rXiI+BkGVJxNEIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRtrbmURHS15rqS6zSoNkAowXQqYCYFSU4O5IDlqYRq1xbXFI88Tuiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAtAGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:++b7EqONIg86PsBcTyT155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2cqYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+c/DqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0GnQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloAS+0koJjHfw//Zv70voxKhNNKWs2N
 60TJiAtIs+O/P+PpgNcNspcI+QNlHnZy7qHSa7HWnHfZt3S04l7aSHqIkI2A==
X-IronPort-AV: E=Sophos;i="5.93,312,1654574400"; 
   d="scan'208";a="82911856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBcKJelxpiUuP5FevrMff+ArH2fOSXRNeJYyIPidXszwNEeonKI6bGmHrIcybWrwPVUrjxOAc9goUrrPpjWwwJXuF7qiM/xKpG7xsYu1QTjZC5RyPS+KquL54q5HO/kU0TkQ5qJ4qoUCqVhA4/uUPun14Kdi1dpbiGImjPyKbJKfQX/+iFqOBs+SPe8ojeSqODDoAmWKxjoetWJqGj2Tn8I5pJCyICzUD5PMzcmJydnh0dySBHR5BPmDlG3pY7SK3LkRsuUkY3mZ6K35B+CuVKa2XuYzozQdmSGsP3p1mic7EQTew/Hahfnz+K/siwGbmbgtjDNew4gCnGi20YmB0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wxWZwwEf++RQVQliz6rN3H76q7ry3k9nfOI8TQn3zU=;
 b=k2q4TuymRkHlAS3nLc3HR1jpBKrprqWGu5/dOJwzqkLzga3a8LpdZ53LIBIk37qPf0rtjHQrmbCTfB5frWJHriVDoRPX9crVdchmXKgJ5yFgSsf4KBMLYuf2Tg1TUZgCTRxM6murqBUU/ZlHkZMBc8NtFsVUsL+OtvUgzfXvhSN6Pa6k4NiF6PvZZGBVRSu0zI9srPTxEvhUyyvsZOlrptzo41xD4vPrmBsoRXL84Ftcp4U6EVzsds8VX0SBTqMBIVrn75NyOiDEeXBqO1ktWC4Unu9Nm/cjNKfK8pO/eOEK9JKReTtgjWj5kXC+DXt+eVqs0dTWz+Ozx5Kyehqt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wxWZwwEf++RQVQliz6rN3H76q7ry3k9nfOI8TQn3zU=;
 b=L8kemj/I+CdxOMtzPpmocW6QeMQuB99hGOlYiLAb0EBv4TqA8ZNNqK8CCIDHHDUPt2a3x/IyYLb6hzXtUDuc7oG4Lg/Ch6AZb0+YhDhjTetC5hwGNmYSDkus4Z/CpNAEfUu/F5AKOMB1YvS6mH6L7CrjrETKwbsXNrascTv6x1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 15:15:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
Message-ID: <YyCCVhG81XXLouKC@MacBook-Air-de-Roger.local>
References: <20220913100328.27771-1-roger.pau@citrix.com>
 <25376.32116.525864.165666@chiark.greenend.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25376.32116.525864.165666@chiark.greenend.org.uk>
X-ClientProxiedBy: MR2P264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SJ0PR03MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a55fc3a-88d0-4280-4246-08da9589fae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BzUN4tI6dmtN4Ct4ZT3XnHdb3jLaSUN/9PAas9VbxHRtwm/vlcL4oOATsfenBMxXEx7SByiW7ZML/gLkZUtr1LC/hHEKbeVPSMvbpViujB2GeYD/LGgXKFD3v2nVLmddQoLaErY311D6ZTY+J6CrVbwGI0APXWH0f3+ZlVCigBQ7H1IG29JkvaFEWcyGglpgAAcM4VoLFXVbBnofMogjdO3glrAM9zOloVOmxvpUfqcd7iyeTaUVc2xAtEZMBno4ltEephJTohiaac27RVwMzkEjT6VujuuCWnUrBFxCW6ylrFgaoSyysnS3TNzcANB9lbc1KN9cCEzUAAsWbUSZd2J2mlFg1tnqk4lxqtlP5uHqKZBG2ZjoN3F9k+g7CCUwmsOpdGG5JfStnpIF3u5T+TtMWPAUL8Xu4jytpmx8l5w3QWrbRswZ38gsTDTcmzQAbjZBfnCr0vm9sGqvjafcTMK2jVIhy6Wtybtfw3Ne3yVkO06Myr5Ra1uHasFcRGmMNkYycI8WWsmCizTyPahgb6Cpmlr4Wp4RUj2WmsBAOg08Te0WHEnDVdlzgtOyU2ver1TQg/7N2xuFA2eapijOBkQJUI96pKq6WVJ453zQ0S0RjD41UnsElSxhac/S0GegOAiSyuBc6LaFU9usjS4RELju3F66P46oUmwCnnHCx8lrspyMAQCchdd+LrC4FFN0oGeFy5KcXluRgG8WxiAUhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(66556008)(4326008)(6486002)(66946007)(2906002)(8936002)(186003)(478600001)(6666004)(9686003)(6512007)(26005)(38100700002)(8676002)(83380400001)(82960400001)(85182001)(5660300002)(86362001)(6916009)(54906003)(316002)(41300700001)(6506007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkRIZmYrNlpod0sybFc2bG9NUFRqaklXSUQzam1SVWtXMDZyWjhrcGFSN3VT?=
 =?utf-8?B?c3ZodnZKL1lxeHJPSnZqTXEwU3d5Q1QyREhUMllzdHBkOStlelJ1anR6R2do?=
 =?utf-8?B?OTh1ejhJWmN3Z0k4US9GRlF0QXpOWk1LT0lva3ZUaSsxT3FzaEM3TkorU25p?=
 =?utf-8?B?U0RlNXBzaTNTS1NueTlxVTVpSUVPVXpVazNoWE5mYmxQV0VyZlQ4b1BsZTRC?=
 =?utf-8?B?UU9ZT09HbU1VWkt1NzREZzBhSXpwcXZFYk5FczhOMkNQY04vcFVid1M0alV1?=
 =?utf-8?B?WGNwNUp2RnZqTnZOaW4xanFjTEZPS01mSlYrZ3Y2aGN1NnJHakEzTENGdTZj?=
 =?utf-8?B?TFVzb2FnUklySENqTlZhNWtUTzcyQm5EWUYwMDBIWmc1YmwyQ1hzNUxKRG0r?=
 =?utf-8?B?NEc2ZWRYRCtVSUlJVmJaRmRDVU1xeTZzaFY1bWhvQUpRcGdIZ2w0WkY3RlR0?=
 =?utf-8?B?RXFVYzhyWFZ4VllKNHBBOXBiZkVmT3VRWDZqaGJqem9ZUVI5UnNpYmcxNUsy?=
 =?utf-8?B?UnBCQUZBSHFPcWl3OHMyZTRkWHpZTnVkTHVGRVB3M3NDdWJtRDkySnBoOUJy?=
 =?utf-8?B?Q1gzSzc5d1N1Ri9lNlEyU0hUb3E2YVJsbzNOM25DNUpqQWt4Wmg5aUJkbE9N?=
 =?utf-8?B?L2hBTzJrTTgyMGxVaTNlRHV6dnBQODNxUVdKUkJNUHhFZHZSUkZBUDVNWjl5?=
 =?utf-8?B?TnY2aXNjUDlOODMxaVV0Zlk1YXFLZlNpZFVLVnVyLzVCdTg0eGpHSlJmbEpm?=
 =?utf-8?B?SWJnRlZnYk9VNTl2MXIrYzIwV1IzQUIxRDlXSFQ1bzMwbDNUMnVaRzZyT3Ez?=
 =?utf-8?B?TERSaDBYWEpOTWk4QUIxbGsyTmRTSnBkamhURTlvN3B5cSt0azJ5UTA2bVJt?=
 =?utf-8?B?V0k5ZmMwZXJQdHI5QzgzZHg0UDE2czdEaDA0WDMyb0N1d1VqeGd2WHpJRnlO?=
 =?utf-8?B?ZUxhNHBMVDdCZ0wyV2pwdVEraGpMY3had1FnNG8xSUF0ZHhTZ2N3WFZTaUpK?=
 =?utf-8?B?M09xUUx4SVMwUzZNL2pJVTdwdDM1V0c0T3FEOTZMRVJzMXE0UlFOclRkb2Ny?=
 =?utf-8?B?cm1NN0puakg0UnNWam8wNXdsNzJDTWRldm9OalhWOHhUV2l4VWNieHM5SGR3?=
 =?utf-8?B?Q1JDMzRqdDhPUjF0clFYRElCRzVyMmxacG5JcjY4Y3FONTY3RkJmRGlObHIx?=
 =?utf-8?B?VFRLMHlUcGMzYklIdXJacFdablJvTlVnMW5TTnRSSTNWb0VzaER1V0xJRWxN?=
 =?utf-8?B?c1FnVU9iYm5PZGRiSTFCR0E0ZG9TREw3WUVwRWJjcXNoekpGU1Jka3FlMGNt?=
 =?utf-8?B?dWc5NXFWcTRBNm5lY1REdVlBMC9DZVpSUVY3RndlUFlGTFViRHkwTFhDY3FF?=
 =?utf-8?B?UTZVUWJveUUza0FjMEdLNXlRTm44L09PR0hIQXZRM0NLbnEzTUtpaVpQZC9l?=
 =?utf-8?B?M3NVVTRTbHZYV3RnVXk1aWtEbm5KNXcyRnpyaUZHc3VIc21MNUhmUnlzUDdC?=
 =?utf-8?B?OVRwTDBjaXc0TE9sOG9pU3VyUVpZZnJEUkxrSFVMMmcyaXQvQWhadjZRL1M5?=
 =?utf-8?B?aDk1MFpmbkcvanpSR1ArMjFUOUhjcG1KR3VNRFBrTTI2RCtiUHZJcVFZbCsr?=
 =?utf-8?B?UVRKcjB3L1pQcnJmVmFqQlNrWU9DWjhmL0IvQkZHOUZBcy92ZXpxczhYMDdr?=
 =?utf-8?B?TW1RZGR1cUFocUJWUTBuS05Vdmd4V2RLTDJHQm50RzlCU21NeFc1YnhVODRY?=
 =?utf-8?B?OW1DS1RzQ1NvU3dMdnBLdC9iSjJsKzVqLy9lLzNBR0sxdStXMzFpeWRlTytO?=
 =?utf-8?B?MGJiRGJZaVBJUXpyYUVYdlQyaWEyUU0wMzEyd3A2MHZkNHFYS05rQlhRWWt6?=
 =?utf-8?B?RGJZMzBuUlJ3aTBWeGtZeUFIY29YcmtTaVN0TjJoNGJuNWdHVEtpREtRRmFV?=
 =?utf-8?B?MGtIZ2tJUis0RUtLdTRPUlBQTTZXTVpVQkhQMmZkSG1NRVRvYWwwK1c0a1pr?=
 =?utf-8?B?ZnBwcythZnF2dWpXa3ZjVzRRT2RDeUx1aDhyVEZ5ZnBlZldKbGZIUG1kUWo1?=
 =?utf-8?B?emE5SEk0VCtYclJXMitVVm84eUtHdzRNcDVRZ1J1cFUvUk1qRUhWWXdkUWdI?=
 =?utf-8?B?RUpDa3g2RSt2OFExVzd0ZFdyWW1vSW1EemJyWFAvdmZSNmdvSHhrNkhOZ3Fn?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a55fc3a-88d0-4280-4246-08da9589fae5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 13:15:08.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uTrn4Whu5ce0FvtwcasHPzZYBE1Rkwn3OOLorHJv/laJ3aYETCMFi50U9IGLOT91JvLKSM/1kKJN0lSrY52fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272

On Tue, Sep 13, 2022 at 01:54:12PM +0100, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH] libvirt: disable Werror for non-libvirt flights"):
> > Current usage of Werror=switch-enum by default for libvirt builds out
> > of the git tree causes issues when new items are added to libxl public
> > API enums if those are used in a switch statement in libvirt code.
> > This leads to libvirt build failures for seemingly unrelated libxl
> > changes.
> > 
> > In order to prevent those errors from blocking the push gate, disable
> > Werror for libvirt builds when not in a libvirt specific flight.
> > 
> > The errors will be reported on the libvirt flight, and block the
> > pushes there.  So the author of the changes in libxl is still expected
> > to send a fix to libvirt code.  This is no ideal, but the other option
> > is to just disable Werror for all libvirt builds and let libvirt
> > developers fix the breakage when they notice it.
> ..
> > +build-i386-libvirt                                    autogen_options                 --disable-werror
> 
> We have no way to specify -Wno-error-switch-enum specifically ?
> (I'm not sure if that would be desirable.)

Hm, maybe playing with CFLAGS, but not from the autogen/meson options
AFAIK.  Using the autogen/meson flags seems cleaner and less error
prone (albeit the disabling of Werror is more wide than what we
strictly require).

> > I'm unsure whether we want o disable Werror even for libvirt flights,
> > but this seems more conservative.
> 
> Probably disabling it only for Xen is right.

Thanks, let's try this first then.

Roger.

