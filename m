Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105CB539F29
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 10:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340316.565324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJYF-00022Q-4x; Wed, 01 Jun 2022 08:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340316.565324; Wed, 01 Jun 2022 08:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwJYF-0001zn-1P; Wed, 01 Jun 2022 08:17:59 +0000
Received: by outflank-mailman (input) for mailman id 340316;
 Wed, 01 Jun 2022 08:17:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwJYC-0001ze-F9
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 08:17:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b96cf0-e183-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 10:17:53 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 04:17:45 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4428.namprd03.prod.outlook.com (2603:10b6:5:101::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 08:17:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:17:43 +0000
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
X-Inumbo-ID: 54b96cf0-e183-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654071473;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1QhUNLOsmuk8+a3r4l41JsA+JNR82+WRjZjAvauoONQ=;
  b=dKgdoVs9qfjMTo59I+FjyzeaVBK1MPwGtflCovTlmrLGWSC/oOcTSoFY
   1nThZg1uUmYd7rqr3UH9w250szVx6Knuk4POsf/hTQKOS8BKocQcV4SO8
   shJuPcl3WsaVl3sjjjrrL9XxDO6/bK88eXJwlfKWL23WPWxQQexzpvEhC
   s=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 75133149
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:y1IClKxIrzSxIoEmzj56t+dBxyrEfRIJ4+MujC+fZmUNrF6WrkUOy
 2EbCG2Ha6mCYWr1KtElaY3j/UIAsJ/XnN9mTFZo/yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY22YHhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npllb2QUyMsEKT1iP0maz9eVChAB7Re5+qSSZS/mZT7I0zuVVLJmq0rJmdpeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtacG+OTvYQwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgLmQD8wvJ9MLb5UDi8iFhjID0KOHWJNWJTtVkrxyKt
 DvZqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJt//YS7QiMzu/e5VmfD21dFjpZMoV+74kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLScZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:ALyT2a2Z7xVBoThbje/p2AqjBSByeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/iosKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6N2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCulqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv60vouqhNDqWs3N
 60Q5iApIs+MPP+UpgNdNvpYfHHfVAlEii8Rl57HzzcZdI6EkOIjaLLy5MIw8zvUKA07fIJ6e
 b8uRVjxCQPR34=
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="75133149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACiDRTg/jTFbuEcWY4xg/8PNEKEVsLl46uj0UQSJ6paiuygxQF/pGD0hV7JQbtINjv9Yfcjb05RSi4IJl3r6L1Snt9ehPYvj7od+Q+JGKAEsB9x/NnY03fOylOga/hTHBQuhF9HWnYbWoSP7C0SV/OpZupLTUP8ROo1uKAfi9Ipqtg/zeKLYIhSRtfNnYJwsWpO+U8NuWon/7fTPqK5pEZy/IdoXMxqKraFxpog5p1HXtieJSLa5ENzPdDWC3YeHzyOna8SXFvQk4DrQiwprKPXBj4HlADLBdhT3U+zdjZOKgnFyQ+UtfDqMsok9nc+OIhAM3CwHUgwtueHMcfSTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmOwzsdsnI55k4oa+wPCZ/S7Lttrw7ckiBEpig/WKbg=;
 b=Zwy0kuDBBnP5e6f5gt2IZztIqE75rOoxhfynVKaYDwEgPhCiXacOCwtYK1Dy9bAOzp171Sm74VT37XfI3e3wvBnxlwJt1pnWqOzYj3onTva7yxysXiNFP+u1MXtpjq93SldNSIn8ct8UCTupkNTvt2776BKxoSXgjytoanexUscE1UzaXk1el0X6IgvO1xX0E1TlUd3647V3Ecks9OVpd/nZEdGwo8tW1RR9Bwh11xWJFTZmflwnF4d9dY94KZPw3GzYTfm3gkkinUgLGD7jCl1HlKInOAk2ofssapNf3j1CAZYorl8aOQ84po7afgNkz/mDzO4sXnmfhLpxRPWVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmOwzsdsnI55k4oa+wPCZ/S7Lttrw7ckiBEpig/WKbg=;
 b=DZ7D6bkyRmO+PgW+LaruJOEuay6vP081sFKDwaBvQjzctFIpYvtzYzNXyiJfgctqSWcbOdPsBlV+Pr6m5V9ZuuuaISf8MhV7o+n8QvES0r0uhdRzHxSvvTBXl675ycncfvPxCsIzVd1FbDp4gm0FKDIJXgwp7t+2q8kigTlYCr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 10:17:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 01/15] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YpcgoYkJMzQnXUkb@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1de2cc0a-e89c-6be9-9d6e-a10219f6f9aa@suse.com>
 <YpYozCRkfs1KdBus@Air-de-Roger>
 <22d2f071-4046-52c6-6f11-23fb23fb61c1@suse.com>
 <YpY/Pm43mMJFGYql@Air-de-Roger>
 <e5bc83c8-3962-4d43-4ef1-f338ca2fb782@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5bc83c8-3962-4d43-4ef1-f338ca2fb782@suse.com>
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6dcb0e7-f318-406d-58c1-08da43a73381
X-MS-TrafficTypeDiagnostic: DM6PR03MB4428:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB4428665D2DF03D1071CB045F8FDF9@DM6PR03MB4428.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	edXGAh3EjU8I5uDYKJ7GMEBKpkIDXSIHgKsBSskPs1qYrKIP1b8a21OjDxVgwt3S29+8t7sTyGuwA+BPQEB+o6RmyIW3jPOjatQHMQNyBZuCzTckzBzCWTWfTQYhdI2IE9GR4KFa/lUS0oc/cZXWjN/Q4njrBZbcpbPbIiqj9fRmzxSGmpt+GQeU4DEqS3WfY94EFVxhlvW7G4UdcL3dM8NB3mkep90h0AxKPbn5lZUWUHjqZfpOV/RobS1gaSgl65+hFqiaDKQcrYS22ey3d9RKOrwfFs6Gd+0g08RtnB4u4fqof+TzozGp0NjikVjOZxUTbpsszVYC5t0tNOsE1fIaChx638m5NEDTm5wt36Z6HwjmsBPs7MXk58mm23Ic1QkFTvSptiwn1Sa2rvQ0Q2GThWyy7NHzK+2Eut7eoaxPqVW7J3ECcZkJQwBpGvtSqnfwE/g8zp56lQBvOZRC4eA2+ZtKLgtXqew8us9Jb2EO78i16DjGlwQfM+qTLfBYMUp1sB5EdpLG6zS7dVU+yqQ/aCOC+HZkVWQP68WzpISaqRYJctrYk2UlFtajDVo6cXDoXDzTx2ELBYcZWzzpwhn4uzX/Ghk7qI2RrGZp/+dgm9h8sp1woHzVG9Um3ZNllHMVj4wsH5wQv0+9rWJ4JQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(8676002)(66556008)(66476007)(66946007)(316002)(85182001)(26005)(6512007)(33716001)(54906003)(83380400001)(6916009)(186003)(82960400001)(38100700002)(2906002)(8936002)(6666004)(86362001)(6486002)(53546011)(6506007)(9686003)(5660300002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wnh2b3FoREZnUmxzL0RtSEVBQlBnWWRzVTVJbi9CVGdqNUNTZUNUN3V4V3hK?=
 =?utf-8?B?aHJ0WEtRQWdDcHRKRE5ZSnhXbXZOQW4xK0FmQkhCMWNqaGlpcTMrMmlRK3NP?=
 =?utf-8?B?UnJLdnZPWHh6MlQxN2Z0MWlhUVpUeG5qbTl6V3hZdlM2MGlDV2ZOdW5zVnJU?=
 =?utf-8?B?N3NZeXBqSUdmSEVaTGFxakdZdFYzSWRIODVNczZwOVdPY0R1b3VDWHJlYm1Q?=
 =?utf-8?B?YlhwVmZHNnkvbWgyL1dQOHVNWmdiSGVZU1grazVFanBXUVJydzZtQ09oM3dq?=
 =?utf-8?B?Z1FsRmt0anBwYTZoMEs1UU1tNFI3MGY5M21IVnpuWTZFeHdoRVg0czFsY0w2?=
 =?utf-8?B?dFJXUnlGcXd3Y2VFY1IvaXhHM3FBTEd6emxlOHp2bXYvVFN0VysrcCtRYW9J?=
 =?utf-8?B?YjlTU0RrL3Zzc0QxZjdySXZaaG12eW0zOGVoTllvZytpeHVHUmprNlVHWVVQ?=
 =?utf-8?B?L1FtVWFYSGxDVEFBUG41b25tZDFMcnVVV0loVHFoV1FBbXN6blpjT3krN0J0?=
 =?utf-8?B?RFZLZnBGajVYemZJOFNxMjNJOERIRk9Fai9tL2NicFNzOFN3MnhLb0xCUzNS?=
 =?utf-8?B?WS8vWnQ0Wnp6Z2pQYW90eDlhbHZQbXBnQVBSS3poTythcWl1Y1o4RDFLcXZ6?=
 =?utf-8?B?NERJM3owMkN5MExocXNHQWk5cVYwOGVCcTA5cXZlaTRHaEJETzN3NnQwYmFE?=
 =?utf-8?B?VXgwL3ZHOUg4bk51ZU9RNUxkUk1uRkdaM1E5WUM4bTRwSVBrV0hHWHR0NENJ?=
 =?utf-8?B?NHlaSDdrd2hHKzlJV0RjckVOQjNML3FsclFvSzV1MHRRUWVKUFdMV2QyVXFj?=
 =?utf-8?B?Q0ZnamlqbHZVNndxR0Z2OHREaEgzTWwyTzAveTB6bUQ5QnBxeGlWVzFDS2ZY?=
 =?utf-8?B?amZCZTBPS0VEMVZUb252VUdnUDFaTlZVdmxqL0J6YVBpRis0cFcwNVVzSW5U?=
 =?utf-8?B?dFJnMitXWTZhTExuLzNkWjNNQmh4M2FjSWRncjRlRDAwakZMSGx5UjRYVk9Q?=
 =?utf-8?B?NVEvUlZxakRTQkFEVUhwa2cvWmFJcnVxVTkwdmpIQ09leXg3Y2VyYkp4NFhv?=
 =?utf-8?B?bHRvZTIvMTJnNGw3N2VQaFMzN0dtNEdZQXVNdVByN0Z5Tll3Yis2OUNkdFVY?=
 =?utf-8?B?czc4bFplZjJvUlpvN25LZ1dQRWlBdjRka250Z1Uwem1yY3J0dVpUUElHbmFr?=
 =?utf-8?B?RC9Qb2xTaWZPcjVKR1hZWS9ySmVnbk9uS1hxbmlxYWwxVHlvZGJOcTdJQkJB?=
 =?utf-8?B?b3N6RHIrN2ZwOVpmVU9FUUc4NmErYW5xWWxNMTNVZzhLU0Mza3hBNk93TW92?=
 =?utf-8?B?WlVGZHYzZnRvVjlrc0ZRbEI0NTZjVVJRQzNQNjRKVmdyUkF2TDVjbDMrUy9t?=
 =?utf-8?B?czhqWDhiNkxFRHdqSEdIQVlqSk9RNUx4b1ZFRHdTc2FONzdQb2luUWVSbElE?=
 =?utf-8?B?RmRyR1p0S2NLNFVzQmEyZ3hsNExLZGlQUFl3aUhoZTM4WDB0ZTQ4dmo2bEFy?=
 =?utf-8?B?RUgzVlRQc3BSNE13Qk9MQ1d4MVZCaXdyNU1MWC9sRWdQVVJpTkcyMkhmbU5V?=
 =?utf-8?B?aW8rUnNmRkdJN0RrT0lsYXZZRTR6VG1leHpPenVYelpmTk40Q0l0YmdjR0l4?=
 =?utf-8?B?aUVPT2VOL3AyUnpCV0oydUtxUitGa1NBOW5QL0pGTWNEdHMzaGNHbmk5N1Nr?=
 =?utf-8?B?OHE0L3hXeUJicWxCNmFoKzhFdUh1QklHN3VwT1ZtRzlYT3IzRCtZWXoxZUlR?=
 =?utf-8?B?TlkvYU1LYjgwK3UwcncyQzRtOWdZbVZ0NUs2UVFjVW92KzNPWlV5QWZmOHIx?=
 =?utf-8?B?cEk4RENYOW1QRDE1bEl0blFNalZiUmpHejF1TjIxQzhBRzA5ejBvOFpOaExn?=
 =?utf-8?B?d2gyZzVrMUhYSjFxVGE2RHJVemE1bCtVQ2gyR2pFS1d3NjYyNlNTd01yZURq?=
 =?utf-8?B?dWk5T1kwQXZIRlZ3Yk5KbXpWbDdRYWRNQVc0MkdmY0FxbFMrODY3YjVvcmVq?=
 =?utf-8?B?S2llM2c2RmZxa0Z2OGNUcU1LMUIvc2VWWGt2L0R4aHdsb3E3VE5vdXJvdWZV?=
 =?utf-8?B?b29BS1c5TXZSbUVUWFNWdDRGRWJoT0NZQzhJT1lwRjY0cEplZkFFUXRFTjJO?=
 =?utf-8?B?T3daL2oyb3N6ZGJyMFR6Zy9pdDBIckNlMEU0dUxNRUtKeVpoWkhNcHVEdzhj?=
 =?utf-8?B?ck1KN0o3dlk1NFU3TmZmQmt1SmV2Qm94a2J6M1FUZzhjYkJBSFd3clVNTDhP?=
 =?utf-8?B?Qm5IamRkWURKNWJsL3NEM1hGc05NdUZKQXprbkV5THljeTFnSUk0elFLSGtk?=
 =?utf-8?B?aE5lZzNWdjdVejh0QVNkOE4wMThDU21abGpkYzRjVU5TN2ltb1RxQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dcb0e7-f318-406d-58c1-08da43a73381
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:17:43.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhfCE+cYemrEsem2bvNTRS4WVWE7C5tK5y5g6vyRpJtUtaQkRLgJOM19BfHYIacAXUClxcm5RB23V1LSz4GF/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4428

On Wed, Jun 01, 2022 at 09:10:09AM +0200, Jan Beulich wrote:
> On 31.05.2022 18:15, Roger Pau Monné wrote:
> > On Tue, May 31, 2022 at 05:40:03PM +0200, Jan Beulich wrote:
> >> On 31.05.2022 16:40, Roger Pau Monné wrote:
> >>> On Fri, May 27, 2022 at 01:12:06PM +0200, Jan Beulich wrote:
> >>>> @@ -289,44 +290,75 @@ static bool __hwdom_init hwdom_iommu_map
> >>>>       * that fall in unusable ranges for PV Dom0.
> >>>>       */
> >>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
> >>>> -        return false;
> >>>> +        return 0;
> >>>>  
> >>>>      switch ( type = page_get_ram_type(mfn) )
> >>>>      {
> >>>>      case RAM_TYPE_UNUSABLE:
> >>>> -        return false;
> >>>> +        return 0;
> >>>>  
> >>>>      case RAM_TYPE_CONVENTIONAL:
> >>>>          if ( iommu_hwdom_strict )
> >>>> -            return false;
> >>>> +            return 0;
> >>>>          break;
> >>>>  
> >>>>      default:
> >>>>          if ( type & RAM_TYPE_RESERVED )
> >>>>          {
> >>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
> >>>> -                return false;
> >>>> +                perms = 0;
> >>>>          }
> >>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>> -            return false;
> >>>> +        else if ( is_hvm_domain(d) )
> >>>> +            return 0;
> >>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
> >>>> +            perms = 0;
> >>>>      }
> >>>>  
> >>>>      /* Check that it doesn't overlap with the Interrupt Address Range. */
> >>>>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
> >>>> -        return false;
> >>>> +        return 0;
> >>>>      /* ... or the IO-APIC */
> >>>> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
> >>>> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>> -            return false;
> >>>> +    if ( has_vioapic(d) )
> >>>> +    {
> >>>> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> >>>> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
> >>>> +                return 0;
> >>>> +    }
> >>>> +    else if ( is_pv_domain(d) )
> >>>> +    {
> >>>> +        /*
> >>>> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> >>>> +         * ones there (also for e.g. HPET in certain cases), so it should also
> >>>> +         * have such established for IOMMUs.
> >>>> +         */
> >>>> +        if ( iomem_access_permitted(d, pfn, pfn) &&
> >>>> +             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>> +            perms = IOMMUF_readable;
> >>>> +    }
> >>>>      /*
> >>>>       * ... or the PCIe MCFG regions.
> >>
> >> With this comment (which I leave alone) ...
> >>
> >>>>       * TODO: runtime added MMCFG regions are not checked to make sure they
> >>>>       * don't overlap with already mapped regions, thus preventing trapping.
> >>>>       */
> >>>>      if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
> >>>> -        return false;
> >>>> +        return 0;
> >>>> +    else if ( is_pv_domain(d) )
> >>>> +    {
> >>>> +        /*
> >>>> +         * Don't extend consistency with CPU mappings to PCI MMCFG regions.
> >>>> +         * These shouldn't be accessed via DMA by devices.
> >>>
> >>> Could you expand the comment a bit to explicitly mention the reason
> >>> why MMCFG regions shouldn't be accessible from device DMA operations?
> >>
> >> ... it's hard to tell what I should write here. I'd expect extended
> >> reasoning to go there (if anywhere). I'd be okay adjusting the earlier
> >> comment, if only I knew what to write. "We don't want them to be
> >> accessed that way" seems a little blunt. I could say "Devices have
> >> other means to access PCI config space", but this not being said there
> >> I took as being implied.
> > 
> > But we could likely say the same about IO-APIC or HPET MMIO regions.
> > I don't think we expect them to be accessed by devices, yet we provide
> > them for coherency with CPU side mappings in the PV case.
> 
> As to "say the same" - yes for the first part of my earlier reply, but
> no for the latter part.

Yes, obviously devices cannot access the HPET or the IO-APIC MMIO from
the PCI config space :).

> >> Or else what was the reason to exclude these
> >> for PVH Dom0?
> > 
> > The reason for PVH is because the config space is (partially) emulated
> > for the hardware domain, so we don't allow untrapped access by the CPU
> > either.
> 
> Hmm, right - there's read emulation there as well, while for PV we
> only intercept writes.
> 
> So overall should we perhaps permit r/o access to MMCFG for PV? Of
> course that would only end up consistent once we adjust mappings
> dynamically when MMCFG ranges are put in use (IOW if we can't verify
> an MMCFG range is suitably reserved, we'd not find in
> mmio_ro_ranges just yet, and hence we still wouldn't have an IOMMU
> side mapping even if CPU side mappings are permitted). But for the
> patch here it would simply mean dropping some of the code I did add
> for v5.

I would be OK with that, as I think we would then be consistent with
how IO-APIC and HPET MMIO regions are handled.  We would have to add
some small helper/handling in PHYSDEVOP_pci_mmcfg_reserved for PV.

> Otherwise, i.e. if the code is to remain as is, I'm afraid I still
> wouldn't see what to put usefully in the comment.

IMO the important part is to note whether there's a reason or not why
the handling of IO-APIC, HPET vs MMCFG RO regions differ in PV mode.
Ie: if we don't want to handle MMCFG in RO mode for device mappings
because of the complication with handling dynamic changes as a result
of PHYSDEVOP_pci_mmcfg_reserved we should just note it.

Thanks, Roger.

