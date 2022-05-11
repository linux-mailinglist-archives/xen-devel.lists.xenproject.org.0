Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46565522D0E
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 09:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326529.549069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nogeb-0008QN-Tz; Wed, 11 May 2022 07:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326529.549069; Wed, 11 May 2022 07:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nogeb-0008Nc-QM; Wed, 11 May 2022 07:21:01 +0000
Received: by outflank-mailman (input) for mailman id 326529;
 Wed, 11 May 2022 07:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nogeZ-0008NG-Qi
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 07:20:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6357489-d0fa-11ec-a406-831a346695d4;
 Wed, 11 May 2022 09:20:58 +0200 (CEST)
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 03:20:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB3697.namprd03.prod.outlook.com (2603:10b6:406:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 07:20:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 07:20:53 +0000
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
X-Inumbo-ID: e6357489-d0fa-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652253657;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8d/2R/9suQnaDRrYEr/mkCYZ4GL6InhWzbNI4K2wvx0=;
  b=F49oJAVMwI/v31oPRaRwnPmfF5ifNWYblc0KmZoSPinQdVrtctoZAgNY
   ln0T8wCfOpVe1pIkzkgwDBlFvgBEDOoRcPwNNgovD1E/tEBnL0o0quIUW
   bKhathO+awQsQbtNHn4qTvr1ZyXuUFSXnwZ7UnbfrRXOVU9g6qqS4NaZi
   s=;
X-IronPort-RemoteIP: 104.47.58.172
X-IronPort-MID: 70433362
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RKXmsa4hqGl/siJWpAmyvwxRtAfGchMFZxGqfqrLsTDasY5as4F+v
 mRKUTyFb/nbZjPzKNsjPI3j/B5TusTVnd5lSlZqrS9gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXgWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSQZBsHJJ+Xxt8lQhxUMjpxOoFe3o/+dC3XXcy7lyUqclPK6tA3VQQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YHhl/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA9AnO/vRti4TV5B5R4pbtbYfvQYCTa/RltXzIm
 nyXzV2sV3n2M/Tak1Jp6EmEg+bVmCrhVYE6Fbum9+Vrilme2mwSDhINUVKx5/K+jyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOttIyRDEs/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty8bniJE+iFTIVNkLLUKuptj8GDW1y
 TbaqiE73uwXlZRSiP/9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcjlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:UiUNsql0S1VbWGaE3AhUJ7HW/0HpDfIH3DAbv31ZSRFFG/Fw9v
 re+cjzsCWf5Qr5N0tNpTntAsa9qArnhOdICOoqTNWftWvd2FdARbsKhbcKpQePJ8SUzJ8/6U
 4PSclD4erLfDxHZJbBizVQy+xQu+VvKprY49s2Ek0dKj2Ct5sQlzuR1DzraHFLeA==
X-IronPort-AV: E=Sophos;i="5.91,216,1647316800"; 
   d="scan'208";a="70433362"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbNE7DVXtAgvepCAuI8mtldRqA97OJmm9j1Mj0vDI52AMUVoDEVQ5jZJAfUPqFDDGZq+qyXsCc3X1/cC4Bo2JU5VVMyz5B/4uQ9CeBY7BKLbH3BAsOmvQkxaXMZXkNqRgr877mLeazWf01+n+DRLHyCNyOOBiAyl7qIGYlCozktfJvXqRUs1ILt/FjevCTbPjtokmQwbM42/8HBlgIgvAR4yoNrbQn9iKJNTsYcXXcOz3jvJNIDD7i4PSdpL8/UqIWYK8Ss7Lh4+u5M1Mfyi6Ogi9ColP2P6OyhxF5qgUy3Sbf9ujbuq0r/HLWU2llBqoczPCGKfHZL8Z91yGaEXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLbuhTosCtGsPQ/F/FC3SZ51VKfKGgXi0M+Ud5rpGiE=;
 b=g+vu5iRU2ZODrpYuJLF9SiAOwY/rj5NumiXmsPlrGeNZCn+XqPVb8q698bzI/NnWmQUIoGWYdLOr5T3fqwtiOt5+L3QgiU/EEEJwiuUxi/yi5DjBGM3Hv67jvzTSh4Nda27E7+g/4WEaQhJiuh1ahN/IdRahrdtkicQzFkTwicPtpNqSkNwEpy81vem5RR1oSUJdLSVk/wJOvbAwmHo9t+EG59NYL+sPPZh/N4SLcuqIT+0GTVVLkXyQLV+zXuXsf7Nz0dK928ksJXPOQY1ssFyr8XjpdnwLy1a70VyWj/cBRJM3HzQCM3bDjVtXfSG++5du2arX4+uWQ3TzTdS/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLbuhTosCtGsPQ/F/FC3SZ51VKfKGgXi0M+Ud5rpGiE=;
 b=dfvcGd+v/9QXk2+WQbeVjUPvDODvmCA0FXs+D9/PTmEbsGj41KQ+zUgSzXuMiMzHaCk/T0ejShotlLtuCcqL4rJfA9J+DbQcL5p4aP+ke5GHhQII8IaVERdrLvQkgz4wN0g6bsgSd3yo8ocws/GxZfdq6EqCl2HyhzYTqGm376Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 09:20:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/2] ns16550: reject IRQ above nr_irqs_gsi
Message-ID: <YntjzqQl0CIeGzR4@Air-de-Roger>
References: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510155824.1779789-1-marmarek@invisiblethingslab.com>
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4f98ab6-3f1d-4be1-5e2f-08da331ec771
X-MS-TrafficTypeDiagnostic: BN7PR03MB3697:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB3697193AA0714EA766EC5D088FC89@BN7PR03MB3697.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5gCP4X/UNdQsqlHTxoOMCqOLruASUL74rHGWyIoal314h7QqlS1B8eLCIPmh2WwHBn0bsDWEg/2Ed8Atg2FD2PBZTHFNPuUr22WsDvE76NcPusoHFKWHllP8TywPs465lVZT6gXMiD9c/+cgnk8uHqpQjnmQpJ5m1IDWXQ1QIt+Fca3I6zHQurXBtKUjmt0Pzc9gxfyYUBc7uNCw7w93oEiQjamUcRCE7CXogCT6jNsG9GDHMWa9EJDrCIRwlf9j/P9y5EyRdmn8/qc1d96pagr7fm39eIODeRYoemCp2nCbH4EvRu5giOtwmN7jt9sx2R+VCMuKI+8DAC/MPbKF0k6jvEKBqNuTlPwn7qS3cxAGJpls9jwhhv4YJi+axhCFlYOhmkJ+XzivYWc+0829oN+tMRYHGXgukK6uQvWWJNwRITNb+vd7C/UAM2Ec7jO+mHW8jSrjcLVm7Yydl7HdeJrZOLvTpouOt/NXnyogjwKcHvV06hnYpzKRQo/5pkPkIsR+dp/mZGlP3L1C/epgdBC4vWnph6KeQoviyS4+lZL17GOiASSM0QUmWgY6jjuoUzsMAk539dvbdyWn3qNV60tfFjicISNKoOH+RXKqPJh2Og61Yk4IX1PsVp90Ec+cLP4b1f18XLLtL9MRzCAd7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6666004)(8936002)(82960400001)(83380400001)(85182001)(86362001)(9686003)(6512007)(26005)(316002)(508600001)(5660300002)(4326008)(38100700002)(66946007)(66556008)(66476007)(6916009)(2906002)(54906003)(8676002)(186003)(6506007)(33716001)(66574015)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJpYk1peVMyK0tlY2dqTXY4TCtLY0gvdjhuRFJKanpOTlZ2T3EyS1MzNFRl?=
 =?utf-8?B?R1pMaHlNSlJlNjZSc2pxVm9SajdRUTUvRVRsQUd4NHBCcXdPK2g3bUtON0ZQ?=
 =?utf-8?B?VTZVYnhJWktscEtFbVU3S1VHVWZHL3dZTmpZWGo4K1Bhc0tUOFN5U0R6ci9Y?=
 =?utf-8?B?S1BXY0ZwTlR3MGkxWkFhRmdpYjlyQ3RTNjFRcE5ucnRqVWViaVk4RzV3VUo5?=
 =?utf-8?B?WDl6L0lKODNPRnpOdnp2enZINWRYaWFOaUZSU0NxOHNFZXJGdjBqbGp5MkI3?=
 =?utf-8?B?T01Pb3E5dUJRcWtUdTNEQ3JPNSt6YThsNWpSbHl4ak1PaTlyY00yVmNNYWtz?=
 =?utf-8?B?RmFSVGFtRkQ5VDRwOTJYMnVWMU5Wak5TYmxGTDY5VXZkL3VFOU9Sa1FMZER6?=
 =?utf-8?B?YU44bElJOUZOdkdRclE3ZHpDQ3Ivd1F0QWtwRlpyM1lvUmcrQlMzVW5Wd1dO?=
 =?utf-8?B?d0NyUmo3Zm5GcGNiZ0R5eTBKZUR1cW01R1hGYTBTMElHZmIyK0hGb2NyL21Q?=
 =?utf-8?B?eU01MDFkWFBPeHVDWnhCY3JXOUtKazc4YXMzVnZ0bWhaaWRYckZuQUgwbGZw?=
 =?utf-8?B?blFjYjVEdEw3MC95RklmSmhWNVNUYU1lVU5kR2tuYy9od1I2Ty8waE9yZHFh?=
 =?utf-8?B?OEd5Vkl3cmdCTTN2OFcyRDNaa1ZFU1JkK1hMYkFpRzBKeDMzWlRrcXlrVkUy?=
 =?utf-8?B?dEh6R2hDMUVPSzN2Z09KdFpwc01SeGtHTEk2Uk4wYTZiU3J4cEVhdHpKTlpo?=
 =?utf-8?B?ZTd3V0RzMHp6Vkk1a1hBQS9veUk5WktaUnI3WUdYSER2dU9LZkF1Sm1ROUd0?=
 =?utf-8?B?cHovR1VXOUg4SWRKRlBMNWNtQkcyYy9Cd0N0Q01kUTNsL2dmbXBWOWtNMTYv?=
 =?utf-8?B?aHErZlRKRWN4dDFKMVluNjRHNGVYTHJNZE9jdVVzZVhqWG1uM0lzZ1h0aFA2?=
 =?utf-8?B?TWlIWmk4L1g4SEVCWXByTUNoeURabUIydFVsK0VsWnplWk5xNkhMNCtPaTBC?=
 =?utf-8?B?QVAvY1NzQzhoUXVKa0FPU1VzdURmdDlqMzV3ejJ2UjJIcitQMllzQno1dDZN?=
 =?utf-8?B?dGlCc2d0ZFpGSXhnR21yWUtGYmZwVVhGcFBCMzlpblFWc1Q4SEdrZG5GL0gz?=
 =?utf-8?B?NWdvelhMSUpUa3VHSWhNRThtK1l2M2VMRTYwb0lZYjVnMGczZzdUMDJtTGxi?=
 =?utf-8?B?amtKNm5taEVDQ1ltdTBNMGtVSGsrUjFvQWlid1RZbmpJcS9YM1FNYVF2TWsv?=
 =?utf-8?B?UDh5T3RuWXNSZEVHZDNXQ2h5WElmbUQzUllDOERsSU5PL3RKOFlyVzBKUElC?=
 =?utf-8?B?R1pwVTRzbE1ySml3RmtwMkw2blBJRkU1UTF6VnNJRXVxNFd1T0RpT3hxMEtZ?=
 =?utf-8?B?S3ZNNEVHS3pOQjd2anBrcnltQUFPMVpjb0ZGSjVaRnhBckNjZlFkNTFtWjdv?=
 =?utf-8?B?amRnS0d4dnVYRGJGSDZHTzBQMjd5TVB0c3UwMHBINkx1RzBvTFJyVkRRNzVE?=
 =?utf-8?B?eWpFV2lwanZ3REhwZjFPcW0vaHp2VFBVUk56VmdDOGNXVytCMm9PYU9RanA5?=
 =?utf-8?B?ZVZta0dnaHNYVFpVYXVSMEJFcUxXS2hlNnFJd2sxOHY4aHQ5TkxYeDh4aVRE?=
 =?utf-8?B?enBxZFkvMlN3VmpVeStPVDZqaGJVb1ZmL21iMzEyS3hJc0swazRzQkR0VWxh?=
 =?utf-8?B?Y3NOb2paNTUydHAzazF3eEh5TktTYjVMRDQ0dHkvUlJMemhPMkcyMVN1VWpj?=
 =?utf-8?B?ZTlzWWo3c1VKOFVYYW5jWmRNT2hTV2s4dHptdDlKWW12Y2ErQnpxQkIvdjcr?=
 =?utf-8?B?TkJ1TGxJWnhOWFhCamI4V0FpempaMEoxRlVlOUhGWXlhVUVnTkxzOGV3ZTZu?=
 =?utf-8?B?SUo0Sm5RK3ZXZmdCK21GeVNvOTdldTNEZFFsc2lMOHRmdURkMTArcHhKdyto?=
 =?utf-8?B?Nk83anVLRThoSlZEWHlUWExLVWxTcFZTL2xmblJIUVMxWnB1VjBWVTJVV0k1?=
 =?utf-8?B?WE00MU1vUGVML29XTk1pVCtFNWh6SndoTHlUM1ZBZEhIb01MZCtIVE1YY2lx?=
 =?utf-8?B?eHRnajFkRGFKTFNiTUo1Mi8rYkVrS3U5TnhmcnFBb21qcnFaMTNhczU4dnN5?=
 =?utf-8?B?dTNwdjJPQWczYXoreDYvdTgzVnVRWmdBdFN2dG1EeWNhRWpGNXNTVmdCM2JW?=
 =?utf-8?B?U1JjaXVSUFYvUGhEcWw2MlNVcFpPaFRoejJMZGRBbjg2ajNUZVBFYzFOSHFu?=
 =?utf-8?B?c0xlWWNWUzNSUWlCQ2g1dzNqclYvWU1RNkFPc2NUZktCODJtbkt0cnJhNTRs?=
 =?utf-8?B?dTBIZ3hOL29kY1NJeTRSZlVnOWtJSmlmUDRHbDBqV2FhRmlxT3dHQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f98ab6-3f1d-4be1-5e2f-08da331ec771
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 07:20:52.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHMioWKK01TGQ0pgYIcIWMKOPrpP9mLg5Z6los0HFCKu4W+9tcrERsPunWMSbqYXXEHXaR2uqBdUBrR2CECwZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3697

Subject line needs to be updated :).

On Tue, May 10, 2022 at 05:58:23PM +0200, Marek Marczykowski-Górecki wrote:
> Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> "unknown"/"no connection". Fallback to poll mode in this case.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> Changes in v3:
>  - change back to checking 0xff explicitly
>  - adjust commit message, include spec reference
>  - change warning to match the above
> Changes in v2:
>  - add log message
>  - extend commit message
>  - code style fix
> ---
>  xen/drivers/char/ns16550.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index fb75cee4a13a..b4434ad815e1 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1238,6 +1238,15 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>                                             PCI_INTERRUPT_LINE) : 0;
>  
> +                if ( uart->irq == 0xff )
> +                {
> +                    printk(XENLOG_WARNING

XENLOG_INFO would be better, IMO this configuration is no reason to
warn the user.

> +                           "ns16550: %02x:%02x.%u has no legacy IRQ %d, "
> +                           "falling back to a poll mode\n",

Could you use %pp and then pass the parameter using &PCI_SBDF(0, b, d,
f)?

Also we try to avoid splitting printk format strings, what about
using:

"ns16550: %02x:%02x.%u no legacy IRQ, using poll mode\n"

TBH, we don't print a similar message if INTERRUPT_{PIN,LINE} is 0
(which also results in the console running in poll mode), so I wonder
if we should extend the printing of the message also to ->irq == 0 for
consistency.

Thanks, Roger.

