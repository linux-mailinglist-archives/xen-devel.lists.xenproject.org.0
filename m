Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9084D2E6B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287772.487960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuoK-0005On-EC; Wed, 09 Mar 2022 11:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287772.487960; Wed, 09 Mar 2022 11:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuoK-0005MV-BD; Wed, 09 Mar 2022 11:48:56 +0000
Received: by outflank-mailman (input) for mailman id 287772;
 Wed, 09 Mar 2022 11:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRuoJ-0005MO-6j
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:48:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b66181-9f9e-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 12:48:53 +0100 (CET)
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
X-Inumbo-ID: e3b66181-9f9e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646826533;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qq282kR+O+LyI9SAHGY04k/U0kEqEwhe8YwoC3OZ6Fo=;
  b=VYVnnFOZgCQ5bihKxENaHoQfI58swbxiO9FdxtcnRYkCzsU3QfNPcWcu
   AOGp+P4c5v0R18bCCiYjsWyQ6Ja4JIMSqG72G+RnpkXuriH09U9YypO1F
   kbf9pg/uWOXZT5SW4pSkk3IgN8jMPYerHre5jAlmYXisFlI2GRU6RIFyY
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68156449
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d0e6L6umh8LecSd+W0XzdG0X4+fnVKpeMUV32f8akzHdYApBsoF/q
 tZmKWnSb/uMMGKkeNhyb4uy9U4CsMOBz9FkSgY9qXo9QyIa+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi81D7P3vsBCcyNDSSZPDKpcpJj6E3Kw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AN
 5NEN2YzPXwsZTUXNAhHMq9nvdyinz7VbztFuULKiZootj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/Hhr5s0lQnnVct4Hei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjoT4UDUTwlr3ZHn/6TJIY5T5QLGa41eOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/9X1
 XCzK5rEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbgTQMrppsP/Y/m05F
 uqz0ePQm32zt8WkPkHqHXM7dwhWfRDX+7itwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwUE2WZoWtBNcehxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JaL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:r5qPfqPFWYdByMBcTv+jsMiBIKoaSvp037BN7TESdfU1SL36qy
 nKpp8mPHDP6Qr5NEtOpTniAsW9qBHnmKKdiLN5VYtKNDOW3VdAR7sD0WKN+VPd84uVzJ846Y
 5QN4xFTP3qDUI/qcrm6CSxDt5I+rO6zJw=
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68156449"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPR4vL8NzEnb8IMDBWYI64eeOhnACecjHxnqD1GosAkJd4Fey4DSSFtRLIgF66bsG7A17ZPeiYYKqCbW1JMwqdmBQD8bLBHAG280R8lVdz0XT7yEUbQ00G2UNPk1RXdQoxXlM/0B5BDXzGYUYN/JNb3DKbHeR9P50bSLWbjcRxGa5c4JQbkUYEijUnkUYHjnxagPvRmCw5hTT76g/yi6Sx1xtkv0PX4ZwPLvVc+4YOR+zkInqWq7dptlXb+Jv2JkgRvbenWspD4ebZ3BEJ5Ca1cNKd/8Za/xGB65jxZYMz/UafDvyIVUYEd5oz9cfIw+Zy8uGJUBRyIhA7/yyNPyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwwwUhMaiDNgYuQonNBuzkl8KkvZt82BFOGVZHxMOHE=;
 b=jhH5iqjqonnpbYMGFOHejKlcw1kp7BIgH1uWTYVs2IV6HdBIEO//it95Ac6U1ZtKYGsYKEKVqwX7nkZ9gp7VjchcJ7KiKXyOfsGsaJTigp7TZMsSd3f2DZcnORaZtTceB2koc7I+Uc2G73f4HMijy0wgwwHHUhYPtpBMw99jCKs1Au5JS8SF2PKmx+PrBNsLD87ZRmdskE2sbJBgqSauXw50y4VmvDtN2oe4zeai9hNBlC7wA52EEIb2BV/euUVpgrwejgg4Z7com5Zy68iKyEtLmQVq4UUNOUhfAcww0gdkm2pGTf8XJ/ZvdIhm9CRzA7ulhpv1LbvtM+a7KEMDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwwwUhMaiDNgYuQonNBuzkl8KkvZt82BFOGVZHxMOHE=;
 b=LwLNXeerzkIxQnmxEWh9F5U3MiZZA2e/MWx7GcvpnIFzO4nAxJpxU+uK7D6rZm24H+r5cvTQwSCcRHQhTwNiHkrLSsfKRFEpbungk1rzHCp1FAzj0FFKfYq4pMP7txnJmkhZwcwV3iT8r+geSqdO21vKAYkg8CaR/oCnIaXwnC8=
Date: Wed, 9 Mar 2022 12:48:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YiiUFSefL0bw9XSx@Air-de-Roger>
References: <20220307150609.10662-3-jane.malalane@citrix.com>
 <20220308173643.2929-1-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308173643.2929-1-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94bc8295-dc34-4f16-7272-08da01c2c211
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6676:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB667632A310B7C4BBC02ABC1B8F0A9@SJ0PR03MB6676.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRpUqzcsrUhmsFbzta6+6CcKArjqujOQQhiFkR8OwgoMDgiGgFIlvUQtiV3+paJMvgD9hCz8KLSnnpFwLJcYrBy+014FlwA7fux0ik3D50nh5zmaZfuDemDvgncnQfPgpIdEJgTy5e/9gsHGGBtCb/DjFLz06YHl9yzJvEKuDjLhnNsKvosDoArbJID6cM4BHEhX8Ls4Cz9D1XIZ+4tbfgqu/wr3bIpTaGsIldETf/EMAix/CAu0z6PTbt7buAhRe8U1293qSW9I2bJ2wEiCjFqC+2StMKXYhkyEdLTJ0QrSEIBEDbneis8OTNT0RMJxZ2hrYQj5aSEB58X6JwZf+bBpHTG9YfFH76clE1FuQX4ZG81KJEaKs5ZeiGop+TakOsm3ekMhEEfxtMonoBHNVOqt8m4B9gE3ZQQMiE8IvPFu2q92LdgUtctJJ88NHsFo5czhAqRSDqMqw8X0YmQ3nCNu29w504e+bkSCO4W3y7pXACMxdDKPdA6aEYMekdXKKbsf3qMzzipJHIOhvcoCHMDPbaiVn/WECP1RNQ2fiBwrbQERtG375w3j41K74IPOvjaqRdCzQ7SL0N0AyFfdrgW5pztbz8t6vGSON3y8KWSwji0UNagCPHBlg/c4yGS//PCNVsn74bhJFoTpymlAXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(66946007)(8936002)(6506007)(82960400001)(66476007)(66556008)(6862004)(6666004)(4326008)(8676002)(26005)(83380400001)(9686003)(6512007)(86362001)(5660300002)(2906002)(6636002)(33716001)(54906003)(508600001)(38100700002)(316002)(85182001)(6486002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0prT0JJdVZybDFsTkNSbTVNOEgvSUdwOTVzK0xvamxwaDNuUWNiTkxYcGZR?=
 =?utf-8?B?Nk1kNmVvTG5sUnlwaTRJZzhSc3M3eEg5TGZYL0VHeUJRNXRYS3V2OWFMN1Jv?=
 =?utf-8?B?TFJ3U0hrMjU3bndXcEFDMUVwUVJQN2VxUmNERUhoNzltaTFmaWR1SFk1N3p1?=
 =?utf-8?B?bkJPRnVsWnVQcWQxSWU2MkVieDdCT0tFbDZVN0tiQUg0YVFrL29sREVTemw4?=
 =?utf-8?B?aDlhbnY5c2oveDRtU0RhR29CZEZsaEhnaFNNRDZLOFhRZnpXZjgxMHEyaW9G?=
 =?utf-8?B?ckpoWlFmTUl5NC9wQ3NmSmh2WGo3cWNBNDRzR2dQTENqTGI3MnhlUkEyQVRS?=
 =?utf-8?B?QUVVeFo5ZlQvc29OVFNCaXhJcTBWMndiZWdqZHRrMnJnRXc5YUUvUmpnelVh?=
 =?utf-8?B?UVRXMVJwWk4vK3lreDJqem5qQUNlVVJiS2I3NG9aZm03T3pRMEY0UGZ0WUp5?=
 =?utf-8?B?anQ2L2Q0N0NpN2pzSmxIK1pKdDNFU1FubTZaMWVlNHFCMXlCSldSaDZNa2J3?=
 =?utf-8?B?UlM0bjNEMUc3cmE0RC9oRlNVeGIwaFduWnBpYlpxcDlwL255WkxzdkRNWm03?=
 =?utf-8?B?MElaOHpQQi9pWjdTUkFzMlgybDI5MWhuelNGcnlmbnA0YkRvdTI3VFdISXZr?=
 =?utf-8?B?eEdNaWZmOXN2R3VZd2pvYkZpcjI3d2grSkZWTGY2TmVqVUxvRVlmUFdaYVo5?=
 =?utf-8?B?WHBMYmlEdnUwZTdhaTFHRjU5Ymk1T3ZDUS9NZ2wxSWszZk1jYnRsVXFYSERa?=
 =?utf-8?B?Q3JRb1NsNElrbVJzZ0hTK1FxVTFCK3NiT2Y1ZmZYMnlEOUVmU3FFTU9JU21E?=
 =?utf-8?B?T3VaOUoyL1dqSXQveVFkdyt3Yk12MHEyRkFHSStYVSthcFZVZXE3U09PTWsx?=
 =?utf-8?B?NEhEWmN0aFhLOXZkaUpHcnJyYmsrbnhheHppdFc0M0FkY0RMbVlMNnJ6MU03?=
 =?utf-8?B?YXZrSzgvVWgyWmhRT0NPRTVMWVRvM0hMcWtEbDlZNXd4ZGdzOUtKSlNTRldi?=
 =?utf-8?B?Z0FtLzV3SE0rRTA3MWN3bC9GVVBESlFkYm10UklBRFV0MXNYc09oeElTOHI2?=
 =?utf-8?B?a3pPVURNc2I5YXdiWXZpbEMzcHpoREhuQ3BmOW16cTI5Z2RacDYva2U0bEt0?=
 =?utf-8?B?dmN3MlFNQ3JWbmR5YVB4TlFMdkQxQnNXRmlmM3orZjhmaXB6S2hyaGgya0dY?=
 =?utf-8?B?VFZYQW5qNlNQWGt4TnVjNGcrc0RXNDVhS2VyZWRMVCtVYnYvSzhrU1llaUFG?=
 =?utf-8?B?MklnOE1sNDVZMWl4OWVMN2NmcVArVGhoelg0Qk5DcVgxZERiQmg1SHVRK2VL?=
 =?utf-8?B?VDhRVUF6Vlg4ZzZkTFRiQTE0bXJFbGIybDNoaytwMDNKb3MwMjV2TkF4MUhv?=
 =?utf-8?B?eFNhaWVvQjRrN2sySEU4UG1ZVWVheGpBTDJLc3NqNnNmcHJ5ZDRQTFBha3g3?=
 =?utf-8?B?WVIwbElKQmk4VFAxNGdKZGJrb3ArZXB6ckR3OG5zTnF5R3NsU1YzV3hWb2cy?=
 =?utf-8?B?Q0FHMWFkNlNDM2x0Sk9RbnNPL1RrOWtMSHZOWDkvZTBqb1Byek5HT1ByWUcy?=
 =?utf-8?B?c2MwVGFPUXNudklJd0FjY2hqK0FUY0w3NkphcWdpZHdGYzVMWk5jWUV3RmN1?=
 =?utf-8?B?VmJ3OGJpMHVnN0s5Yi9YZ2xHbWQ1R2dRRC91cnAyVWZOYXp6Unh6N2p2d25R?=
 =?utf-8?B?ZEt4KzJaYXNnWkdGY29vWUtvQWJsWm02Uy9CMitGQ2dvcU5Mdm5NVVJGK3Q3?=
 =?utf-8?B?cUpRcGk1MndrRmRoYWxtVzB5RVgzRWJBMVE2NDlSSU9LbUNSMDFLcStSN1J6?=
 =?utf-8?B?dlU5Q2ZQaStGeWo1M3hOeDMyeThNZFVmUzB2SWUxUTAxY1p3Ykk4TXY2VUhx?=
 =?utf-8?B?dVhIa2V5Y0ZBY2dvakIxZG9ELzFJMG9hSytMcERkdjBjMXIrZVIzR1VxY0R1?=
 =?utf-8?B?TlpDRGY3Mi9vOFI2cmxlNmxtbzVxUyt3RkNJR3plWGd0VTI3Z3gzTnJpbXFM?=
 =?utf-8?B?WlM3NjZQYkFNY013R1NnOTJ4dnM1b09yWm9oT3ZaeXY4dFQvcUtYNTY0a29L?=
 =?utf-8?B?amFYek5UOVJvM212TmJoMHVhdWV2R0hnS2Z5TEdnM3lsaHRWTzVzUzVXTVBF?=
 =?utf-8?B?Ri9qREd0VURnOVdmeVZtMXY1UStoa0RoRGZMOXNVTXRyRDVpdTV5MFhSLzFy?=
 =?utf-8?Q?G32F0kvuWyTc0QtwAytADWg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bc8295-dc34-4f16-7272-08da01c2c211
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 11:48:41.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efp+H+LUvZO28ZcNW9NY7KAu4uv7Azl3xnt6ph+pp+x1ATtDz5E6JOjp1NdoKOHgP4/zYWYZ4ACgjJozL9ht9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6676
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 05:36:43PM +0000, Jane Malalane wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 39fdca1b49..ba5b8f433f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1384,8 +1384,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>      }
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
>      /* ACPI is disabled by default */
>      libxl_defbool_setdefault(&b_info->acpi, false);
> @@ -1399,6 +1400,8 @@ void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
>      memset(&b_info->u, '\0', sizeof(b_info->u));
>      b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
>      libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
> +
> +    return 0;

There's a void return above the memset (out of context in the diff)
that you also need to patch to 'return 0;'.


> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 77ce0b2121..7adb043ab7 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -1157,6 +1157,10 @@ static int construct_vmcs(struct vcpu *v)
>          __vmwrite(PLE_WINDOW, ple_window);
>      }
>  
> +    if ( !has_assisted_xapic(v->domain) )

Nit: you already have a local 'd' variable here that's v->domain, so
please use that.

> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 5b7ec0cf69..65a978f670 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -373,6 +373,12 @@ int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
>  #define hvm_tsc_scaling_ratio(d) \
>      ((d)->arch.hvm.tsc_scaling_ratio)
>  
> +#define has_assisted_xapic(d) \
> +    ((d)->arch.hvm.assisted_xapic)
> +
> +#define has_assisted_x2apic(d) \
> +    ((d)->arch.hvm.assisted_x2apic)

Nit: I think there's no need to split those into two lines, ie:

#define has_assisted_xapic(d) ((d)->arch.hvm.assisted_xapic)

Is well below the 80 column limit.

Thanks, Roger.

