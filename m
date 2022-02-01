Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7654A5996
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 11:03:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263464.456158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEpza-00008c-G3; Tue, 01 Feb 2022 10:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263464.456158; Tue, 01 Feb 2022 10:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEpza-00006E-D4; Tue, 01 Feb 2022 10:02:30 +0000
Received: by outflank-mailman (input) for mailman id 263464;
 Tue, 01 Feb 2022 10:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEpzY-000068-AY
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 10:02:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ce21321-8346-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 11:02:24 +0100 (CET)
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
X-Inumbo-ID: 0ce21321-8346-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643709744;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=djRUHFWjamzIyLlwoUItDL9+3Fxg9KgSJvzqlncOssQ=;
  b=RwanlIuEu+ppYz39Wb9H127NrEd215D4QQuPvov1YnS2lFEUIeVU2WMG
   jZ8wiLcQJ5U0uiFkmlDeEWRKC7vSXGFHDGHmQ6sDvT7h4Vbg9fBsEdxj2
   p1MGgBzwdqe/U+a6fBmTyhedQ7LlyAlKEEAOZQS3yT2dwpep0SACxQSp+
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 83hICaJL37zx4bNXxlqvD5MqOUCuRDQBBCV2wBQ6mdtksAQopDS2pRXiO53GpPJ+xK12tbgRpM
 KfKHMMbd3uOLh1fR4ndqyejAyBlqI3FC+OjwM+UI+oBRp+OxsL6QKCYnt07k1c/EHi7HKMJdgz
 yY7ci7Hg/CImHaPIx8PiXhTKx4jVime6OTXuJEs4qa7ouhgFOWwnAQIcvjeQLSALMVKrbXOjFh
 nWQbpZH3B6so8i5n3UPOA+hZs5ZOHtpOnmaPL2Xrh8+fKWhbLnO4QwScEMmcjUSekq3wVUJnNA
 DM86lsu4ROGt069F6IMwIoli
X-SBRS: 5.2
X-MesageID: 62667785
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+jdoJKBvAEPakxVW/2Xlw5YqxClBgxIJ4kV8jS/XYbTApDJwhDwDz
 WseXzqAPa6NNGXwc9h2ao6+/UJXsJLTyNJnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970Us7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ujbOtNBU1
 YV2pcKiRiMpAqTnsccbekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf+Uu4AHjGpYasZmJ87mR
 JMDMTxWQh2QcR99P0gvVJlgk7L97pX4W2IB8w/EzUYt2EDI1xB42rXpNNvTe/SJSN9Tk0Leo
 XjJl0z7HxUbOdq32TeDtHW2iYfnoyT/X44DEayiwdRjilaT2287BQUfUB2wpvzRokK3Rd93M
 UEf/Ssq668o+ySDUd3VTxC+5nmesXY0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaOycPKnQZTTQZVgZD6N7myLzflTqWEIwlSvTsyISoR3egm
 FhmsRTSmZ0ijokg14CmrWvX3SCjgpj1RyUcxQP+CzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHQsF5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fW6fTgGfqqNBjarXnSXXFXdlM2JTRXIt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGcumn0v/geTPOC/9pVI53L2mNLpRAESs+129z
 jqiH5HSl0U3vBPWP0E7DrL/3XhVdCNmVPgaWuRcd/KZIxoOJY3SI6S5/F/VQKQ8x/49vr6Rp
 hmVAxYEoHKi2yGvAVjUOxhLNeO+Nb4i/ClTFXF9Yj6VN40LPNzHAFE3LcVnJNHKNYVLkJZJc
 hXyU5zeWqwREmiWpGV1gFuUhNUKSSlHTDmmZkKNSDM+Y4RhV0rO/NrldRHo7y4AEmy8ss5Wn
 lFq/lqzrUMrS1swAcDIRuioyl/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxaaVVnFtDv4dmPaxsyKYyu4nmq7NAl1w2F3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZq8QlALJQcjYuCS7t0um2HfvaYvPUH3xC5r577bA09cCAaB1X5GJ7xvPYJ7n
 ep44JwK6xaygwYBO8qdinwG7HyFK3ENXvl1tpweB4O32AMnxksbPM7ZAy7yppqOd89NIg8hJ
 TrN3PjOgLFVx0zjdXsvFCeSgboB1MpW4B0ankUfI1mpm8begq5l1RJcxj07UwBJw0gVyOl0I
 GVqaxV4KKjmE+2EXySfs7RAwz18OSA=
IronPort-HdrOrdr: A9a23:SqiMJ6O92VFZQMBcT07155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar5K0tQ4uxoWZPwCk80kKQY3WB/B8bHYOCLggqVxcRZnPLfKl7bamfDH4xmpM
 BdmsFFYbWeY2SSz/yKhjVQeOxQo+VvhZrY4Ns2uE0dLz2CBZsB0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pH2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr6GI17npiHuBqZt6ZvcI+h4dY+xYw8uW3fRYzOTFcVcsnu5zXUISa+UmRIXeZ
 L30m0d1oxImg7slyeO0FbQMkDboUoTwm6nxlmCjXT5p8vlADo8FspanIpcNgDU8kw6obhHod
 R2Nk+ixu5q5Cn77VPADhnzJmFXv1vxpWBnnf8YjnRZX4dbYLhNrZYH9EcQFJsbBir15I0uDe
 ErVajnlb5rWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRalHYd85A2TYVC+o
 3/Q+1VvaALStVTYbN2Be8HT8fyAmvRQQjUOGbXOljjHLFvAQO5l3c22sRG2AiHQu138HICou
 WzbLoDjx9MR6vHM7z+4KF2
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="62667785"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwB/rre9aJDmf0I7YzgyDQkeSQ9RekIClmf3hVY01XijuUKf5yU0my00nulg3Wxg6fczkKRc3DGodiz2RowESvMvRloqDa2TO0P3yfsw/CE9NXOFu5FM4B/b5SQIZ8HiX+RzrxIRmnl1e8TdMQsL0N5rhop/WxQTpL57AaqCcYbgugN/IyB0qXQhMsxhY8wQbzM4vREtuMdI8q2f5GHgP/FWvY5w/eYV81zwcx+lS/GWFWrXqxW6Mjg50XyX7/pvWXrZoAmLOoIEK8VOEsKMTazhDPYZJ/AATpZD3vL6nUlMO3FOsg1Je0IlTKS1rZwwcRuwG8M9K0HxddI6bsVkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JW+YNALTjq8moTTfGgA6NTQWmqlSAMdPhXqxjbZ8u8=;
 b=OHPUnxZHKywdg6I/vH1ld65T8fPgJHcjoKgCOiKr5jcDoL8FMEvvU7EcbYhKSOE+7giMO/ayTOzuZTpcnobwGCv7NdJqU838h2Ka7Qy5LkaVcesxrNDio6DocMDPo3Kwo/9WAU9LoEgRymTHVQpDW3GfuexsDhBmOionJZV+qUVf4LV2bb2kr8JVJTIMmwDIUuYnFjHieEdFoOzUROCHvPrAoQPkzL09dnQxR5PKtR7RT+CKU7a/PeS0L/D1UobrVeDmMJ6WyyeqmcK8v/OV7ArMcjPc43WF334OMhxiu/ZOdOjtmGxUqIS2DBjoVGj7WvAFZSfbj7r1p2nTDint8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JW+YNALTjq8moTTfGgA6NTQWmqlSAMdPhXqxjbZ8u8=;
 b=fQxzDKnNOmNv23I+Zi2FR11zs9zaKX4r/nYdc4+ZB/o6ry4HNwbRRZx4lf1JQsVBnA2RZ8RGK/PP9Tfa3frwL+ziEJnybKshXnGDJEyrNbCwz4u4HEYMBzGdN0S77T4q7qA9a86s8vG7GtTzwJs59LuG85d7krSOWhozatjI09o=
Date: Tue, 1 Feb 2022 11:02:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YfkFJTYXa/7DSTaI@Air-de-Roger>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-3-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220127160133.11608-3-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfb0ed65-c189-4bd2-0fc6-08d9e569ee69
X-MS-TrafficTypeDiagnostic: SA2PR03MB5770:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB57705C06A8A3ABA55FAFAC088F269@SA2PR03MB5770.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: am58JiogCVHb7hG90ZybG3WEvHgLZjQRPBXGMSyezcIIQFzuZJgMePuFZhyo9ryusgLaxDjwHBHa941YuStimBili/NMQmzhm4Gg45RmfSZvmva8qIXTpil1D9pEAQjNJ5mVPQnHdqOtKb/jAk8vMmUFc9Ea48jKNnWhNHJEiDZ48mBEyhuvDl/v2+EEPUbKluXlvRU46DejaP+T3Gcg160itdCIrCXo74V+Pzu69HmcSfpu73V6pK6cUy0qM6t0pbQTDs5Ite/ICMabo5RzwbnYs3osNc9fFlVNIXjXlcEAfnDBok7fXxTRrtWOnuPRnpOVKva8B/aLY2e7m7wJIrAG1460UUqD3Q4g6R3kBRTVvZo4Lom6LfyB8TETEs+IGKg0HvTo24NPVfzlQmJSy/LB8D1GfGSsmvsEbWeGt8YQn0Yy1v6WlvD07gkVLXhwYWQktJictsOb8RHpZPnnZp7VhnrlHR0Knw8+ITM8NI3SAKdadQyxFRUL4QWopV52Hh0mhq1mMkk4bBjwACgti4pdAlfIMuwhuR05GQSoIyrpr5Lbe6WuPLiUD0Ol97QCEdZ+nadecN/iXWj1sY6Wqe20hDlWHwaNHeYQhIIYw7RKk4ls6V0mesDnhyGq3w8gMmBPefiqJTvVAIoXKTry0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(6862004)(66476007)(8676002)(86362001)(30864003)(4326008)(33716001)(83380400001)(66946007)(5660300002)(9686003)(316002)(8936002)(6512007)(85182001)(6636002)(2906002)(66556008)(6506007)(6486002)(6666004)(38100700002)(26005)(186003)(82960400001)(508600001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTNpMGFheDFMN1FCblhMWjNQQThtYjFLdEJyVmRpVysvM3NMOVVPQ0k4ZE5T?=
 =?utf-8?B?bGdoVlJRRStSMXBVejZqRjU5RXhzdVVFL201a0ZxZUg4WGljZFR1OTMwUU9n?=
 =?utf-8?B?VGFpdlEwNlJZTENGZlVRd2tiZFd6SUUwRU1xcExlc3E2YmVpbktkMDFOY3dD?=
 =?utf-8?B?ZGg0eHRwMml3OWJ4OGVDb1RvWmx3NVhkeE9WbEErYjR2V1pCOHhhdzRObWI4?=
 =?utf-8?B?cGdKeGhIVG1BZnRCajh2TzJUTllKZzB4c2FvdDVkNUxSOWEwaGswRXpOc1ls?=
 =?utf-8?B?SS9zSGU2S01YSUtqZTFmSEFUZ0R3U1BHNGZsSDR0T1NVUEl1bjlycjVEVzNp?=
 =?utf-8?B?OEZ3VUdOSVowcDNaNENKNzZmT3lJMWp0b1R2ckh3enVjazJUTXFmRWFhQnFY?=
 =?utf-8?B?QUU1ZlhmV2hjdjJWMFVmUmVWa1AwNk1EQ2lodUJvNURUT3AzUyttRjFCV0pj?=
 =?utf-8?B?eUpSRFE5SmliQmdyN2RvWUVIckJ1cHhMMzlCYnBsL04wMmIyd0IwUGJZR3hh?=
 =?utf-8?B?aE1DWHJhYkkzK3VlM2NnNlIvcndsY3hHbm1kRTlCMmxmVHhJTFB3Z2Rqb2J6?=
 =?utf-8?B?RDFqd2dVVE5zdXozUEpISHY1ZHdCNng0WHcreTNjMmVHK01TYURMbC9JbWtW?=
 =?utf-8?B?NmkrZkEzcTZFVDdrRnVrTEovY3Vva1VwMFU5akpoRkRHNm94UVJGV1lWY2N6?=
 =?utf-8?B?ajZzVjVjV2Y4Z243S1pDR2ErTTFMNnZFUndlUmczUCtEMHM2QnRZc2FSOWd6?=
 =?utf-8?B?MWFiRFZyZC9GVm5uL2RaL0svNkVHUG9lR2NtRmorQ2lRSFNyZ3lVWElYZFA0?=
 =?utf-8?B?ZjNFK0xhdXlBNVcvMGYzQnFNTGdyQlFCZTRFcXZMSW5NWTJTK2ZRSDE0bG8y?=
 =?utf-8?B?WTN5N0poaXRRNnpNQ3dwQW5HS0MxZ1RVbmwyb3lEOGtKc1U5RmQ1NXpjQ0lz?=
 =?utf-8?B?YlozZmdYdTlCQTRtc0JnT3Jxd0E2N25IcGxVNXRlckpYWFFQZUdQU3dnS1hq?=
 =?utf-8?B?d3o1VjZmOGVIS2hhQ3NoUEM2OXc0V3VkeXhjU3duZG10SnhSUm5pNU1MenUy?=
 =?utf-8?B?MFZwSEkwTUtyV3orSWhOa3JCZHU3Y3NPdW4zU3FKRjRyR2R3VEVaUWdWZTc1?=
 =?utf-8?B?M1dEZjg1UDByTUNqTzJkdWlvT0JNeXRMLy9RaUc0OEM4OXpLZWl3UmREZFh0?=
 =?utf-8?B?WTVMK25Za1JmTjdTWit2czF6eWVOWEZyVXZSN285MzJ0elJ5ajlZVlFjRmg4?=
 =?utf-8?B?VnVJanhNSjZIalRNR25MUmVjRmZ0SDQ0TjFCaTJQVDhvazlhR1BIT2hETGdJ?=
 =?utf-8?B?SWdEcW1YdkVsUjNEYUY5Mi9Bbm10SklIM1IrcG5LU0F5N1BVYzVsaVFIQTlu?=
 =?utf-8?B?TUNYamJlNkJXdHVLSmJ0cW1oWU5zT3doRGlweWN2OGZ5SFQwYWJEWi9IU2dx?=
 =?utf-8?B?a0JGQTJ1dXlpbHRzbk01QTNDY3JNekpFWlVrcnlmT2FMRmJGRUdKcVZIMS9i?=
 =?utf-8?B?aFlIZlJvU25pLzdMQ1B6RlNpdTY2R214VUVtMEFXVzdZdDRoMXlTbmczM1oz?=
 =?utf-8?B?MWllcm5kNldmcmRzRkxLQWxpaVUyL3NkRlBtNEg3SEh1NXZSdjgwamdSb1dV?=
 =?utf-8?B?amI5ZDRTejgrR0hnMk9NZ1dxU3htY0JIRUlhWExHT0l2SVh0anpBOU03cld3?=
 =?utf-8?B?b0Q4a1NaMzc2bTBqK2xVTjNta2ZwK2hZSTZZVHRuemF3enBWdXFJSGg4bGI4?=
 =?utf-8?B?M29FMXZyeVoxMWxFYUxEVnZlSUc5bDVTWW5wVHlrWktrQ1IreHYyYkhYOVEv?=
 =?utf-8?B?VHFsV3JyYW9MeW5idVBMS29rMEYwN0J2NWJTZDRzaEJNV2tRSU51RnIwOGlN?=
 =?utf-8?B?UHdPVGl0ZDJCL1orc1VJamVBRXYwdXBOYnpmNGhMaFh3STJIMnhWYkplWWdx?=
 =?utf-8?B?MlZzL3RFQVVPU1lQREdNYlhjOXhpZVBzY01WSk1NQ3dUWG5YcFRRRVQ0aTVE?=
 =?utf-8?B?aEFqNDZPOTF5Z0hyYkpURjg1TFE3ZjB6ZWJ2QkhXc0dCaG1IZVcySWtYeE0v?=
 =?utf-8?B?Q2pQQVVCSEM4d3Q3dmxpMVVJcmtmQ2ZidG9xK3RHVFBUU3Vhb0UreHlrRXpV?=
 =?utf-8?B?M1JnMXI3ZlpGVmNHMUozTUhiUVRuNkkvOUt2Q01QTHlOakxNVzFGMXhWYWxr?=
 =?utf-8?Q?AybUPMvKDWf5j6+Hfbu4pIg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb0ed65-c189-4bd2-0fc6-08d9e569ee69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 10:02:18.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjc2SgUMr8trTHJt91Rangmakw9m/JqzPxCLJy5XUprBu9q2R9U7dgM0A8hOlDB9rzt/62QMnU1FI/A7oqHnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5770
X-OriginatorOrg: citrix.com

On Thu, Jan 27, 2022 at 04:01:33PM +0000, Jane Malalane wrote:
> Introduce a new per-domain creation x86 specific flag to
> select whether hardware assisted virtualization should be used for
> x{2}APIC.
> 
> A per-domain option is added to xl in order to select the usage of
> x{2}APIC hardware assisted vitualization, as well as a global
> configuration option.
> 
> Having all APIC interaction exit to Xen for emulation is slow and can
> induce much overhead. Hardware can speed up x{2}APIC by running APIC
> read/write accesses without taking a VM exit.
> 
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
>  docs/man/xl.cfg.5.pod.in              | 10 ++++++++
>  docs/man/xl.conf.5.pod.in             | 12 ++++++++++
>  tools/golang/xenlight/helpers.gen.go  | 12 ++++++++++
>  tools/libs/light/libxl_arch.h         |  5 ++--
>  tools/libs/light/libxl_arm.c          |  5 ++--
>  tools/libs/light/libxl_create.c       | 21 ++++++++++-------
>  tools/libs/light/libxl_types.idl      |  2 ++
>  tools/libs/light/libxl_x86.c          | 43 +++++++++++++++++++++++++++++++++--
>  tools/ocaml/libs/xc/xenctrl.ml        |  2 ++
>  tools/ocaml/libs/xc/xenctrl.mli       |  2 ++
>  tools/xl/xl.c                         |  8 +++++++
>  tools/xl/xl.h                         |  2 ++
>  tools/xl/xl_parse.c                   | 14 ++++++++++++
>  xen/arch/x86/domain.c                 | 27 +++++++++++++++++++++-
>  xen/arch/x86/hvm/vmx/vmcs.c           |  4 ++++
>  xen/arch/x86/hvm/vmx/vmx.c            | 13 +++++++----
>  xen/arch/x86/include/asm/hvm/domain.h |  6 +++++
>  xen/arch/x86/traps.c                  |  6 +++--
>  xen/include/public/arch-x86/xen.h     |  2 ++
>  19 files changed, 174 insertions(+), 22 deletions(-)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index b98d161398..974fe7d2d8 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1862,6 +1862,16 @@ firmware tables when using certain older guest Operating
>  Systems. These tables have been superseded by newer constructs within
>  the ACPI tables.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +B<(x86 only)> Enables or disables hardware assisted virtualization for xapic.
> +This allows accessing APIC registers without a VM-exit.
> +The default is settable via L<xl.conf(5)>.
> +
> +=item B<assisted_x2apic=BOOLEAN>
> +B<(x86 only)> Enables or disables hardware assisted virtualization for x2apic.
> +This allows accessing APIC registers without a VM-exit.
> +The default is settable via L<xl.conf(5)>.

Like you do below I would capitalize xAPIC and x2APIC in the option
text.

> +
>  =item B<nx=BOOLEAN>
>  
>  B<(x86 only)> Hides or exposes the No-eXecute capability. This allows a guest
> diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
> index df20c08137..2d0a59d019 100644
> --- a/docs/man/xl.conf.5.pod.in
> +++ b/docs/man/xl.conf.5.pod.in
> @@ -107,6 +107,18 @@ Sets the default value for the C<max_grant_version> domain config value.
>  
>  Default: maximum grant version supported by the hypervisor.
>  
> +=item B<assisted_xapic=BOOLEAN>
> +
> +If enabled, domains will use xAPIC hardware assisted emulation by default.
> +
> +Default: enabled.
> +
> +=item B<assisted_x2apic=BOOLEAN>
> +
> +If enabled, domains will use x2APIC hardware assisted emulation by default.
> +
> +Default: enabled.

I think for both options this should be:

Default: enabled if supported.

> +
>  =item B<vif.default.script="PATH">
>  
>  Configures the default hotplug script used by virtual network devices.
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index dd4e6c9f14..90e7b9b205 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -636,6 +636,12 @@ x.Passthrough = Passthrough(xc.passthrough)
>  if err := x.XendSuspendEvtchnCompat.fromC(&xc.xend_suspend_evtchn_compat);err != nil {
>  return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.fromC(&xc.arch_x86.assisted_xapic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.fromC(&xc.arch_x86.assisted_x2apic);err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  
>   return nil}
>  
> @@ -679,6 +685,12 @@ xc.passthrough = C.libxl_passthrough(x.Passthrough)
>  if err := x.XendSuspendEvtchnCompat.toC(&xc.xend_suspend_evtchn_compat); err != nil {
>  return fmt.Errorf("converting field XendSuspendEvtchnCompat: %v", err)
>  }
> +if err := x.ArchX86.AssistedXapic.toC(&xc.arch_x86.assisted_xapic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedXapic: %v", err)
> +}
> +if err := x.ArchX86.AssistedX2Apic.toC(&xc.arch_x86.assisted_x2apic); err != nil {
> +return fmt.Errorf("converting field ArchX86.AssistedX2Apic: %v", err)
> +}
>  
>   return nil
>   }
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 00cc50394d..2eaff45526 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -71,8 +71,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>                                                 libxl_domain_create_info *c_info);
>  
>  _hidden
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info);
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo);
>  
>  _hidden
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 52f2545498..4d422bef96 100644
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
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index d7a40d7550..2bae6fef62 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -264,7 +264,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>      if (!b_info->event_channels)
>          b_info->event_channels = 1023;
>  
> -    libxl__arch_domain_build_info_setdefault(gc, b_info);
>      libxl_defbool_setdefault(&b_info->dm_restrict, false);
>  
>      if (b_info->iommu_memkb == LIBXL_MEMKB_DEFAULT)
> @@ -456,15 +455,21 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->nested_hvm,               false);
>      }
>  
> -    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
> -        libxl_physinfo info;
> +    libxl_physinfo info;
>  
> -        rc = libxl_get_physinfo(CTX, &info);
> -        if (rc) {
> -            LOG(ERROR, "failed to get hypervisor info");
> -            return rc;
> -        }
> +    rc = libxl_get_physinfo(CTX, &info);
> +    if (rc) {
> +        LOG(ERROR, "failed to get hypervisor info");
> +        return rc;
> +    }
>  
> +    rc = libxl__arch_domain_build_info_setdefault(gc, b_info, &info);
> +    if (rc) {
> +        LOG(ERROR, "unable to set domain arch build info defaults");
> +        return rc;
> +    }
> +
> +    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
>          if (info.cap_gnttab_v2)
>              b_info->max_grant_version = 2;
>          else if (info.cap_gnttab_v1)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 42ac6c357b..db5eb0a0b3 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -648,6 +648,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
>                                 ("vuart", libxl_vuart_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("assisted_xapic", libxl_defbool),
> +                               ("assisted_x2apic", libxl_defbool),
>                                ])),
>      # Alternate p2m is not bound to any architecture or guest type, as it is
>      # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 33da51fe89..b257fca756 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -23,6 +23,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
>          config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
>  
> +    if(libxl_defbool_val(d_config->b_info.arch_x86.assisted_xapic))
> +        config->arch.misc_flags |= XEN_X86_ASSISTED_XAPIC;
> +
> +    if(libxl_defbool_val(d_config->b_info.arch_x86.assisted_x2apic))
> +        config->arch.misc_flags |= XEN_X86_ASSISTED_X2APIC;
> +
>      return 0;
>  }
>  
> @@ -819,11 +825,44 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
>  {
>  }
>  
> -void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> -                                              libxl_domain_build_info *b_info)
> +int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
> +                                             libxl_domain_build_info *b_info,
> +                                             const libxl_physinfo *physinfo)
>  {
> +    int rc;
> +    bool assisted_xapic;
> +    bool assisted_x2apic;
> +
>      libxl_defbool_setdefault(&b_info->acpi, true);
>      libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +
> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic, false);
> +    libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic, false);
> +
> +    assisted_xapic = libxl_defbool_val(b_info->arch_x86.assisted_xapic);
> +    assisted_x2apic = libxl_defbool_val(b_info->arch_x86.assisted_x2apic);
> +
> +    if ((assisted_xapic || assisted_x2apic) &&
> +        b_info->type == LIBXL_DOMAIN_TYPE_PV)
> +    {
> +        LOG(ERROR, "Interrupt Controller Virtualization not supported for PV");
> +        rc = ERROR_INVAL;
> +        goto out;
> +    }
> +
> +    if ((assisted_xapic && !physinfo->cap_assisted_xapic) ||
> +         (assisted_x2apic && !physinfo->cap_assisted_x2apic))
> +    {
> +        LOG(ERROR, "x%sAPIC hardware supported emulation not available",
> +            assisted_xapic && !physinfo->cap_assisted_xapic ? "" : "2");
> +        rc =  ERROR_INVAL;
> +        goto out;
> +    }

I think the logic here is slightly wrong, as you are setting the
default value of assisted_x{2}apic to false, and we would instead like
to set it to the current value supported by the hardware in order to
keep current behavior.

Also the options are HVM/PVH only, so having them set for PV should
result in an error regardless of the set value, ie:

if (b_info->type == LIBXL_DOMAIN_TYPE_PV &&
    (!libxl_defbool_is_default(&b_info->arch_x86.assisted_xapic) ||
     !libxl_defbool_is_default(&b_info->arch_x86.assisted_x2apic)))
     ERROR

libxl_defbool_setdefault(&b_info->arch_x86.assisted_xapic,
                         physinfo->cap_assisted_xapic);
libxl_defbool_setdefault(&b_info->arch_x86.assisted_x2apic,
                         physinfo->cap_assisted_x2apic);

I don't think you need the local assisted_x{2}apic variables.

> +
> +    rc = 0;
> +out:
> +    return rc;

The out label is not really needed here and makes the code longer.
Just 'return ERROR_INVAL' in the error paths or 0 at the end of the
function. You can then also drop the local rc variable.

> +
>  }
>  
>  int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7ce832d605..cce30d8731 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -50,6 +50,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>  	| X86_MSR_RELAXED
> +	| X86_ASSISTED_XAPIC
> +	| X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig =
>  {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index a2b15130ee..67a22ec15c 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -44,6 +44,8 @@ type x86_arch_emulation_flags =
>  
>  type x86_arch_misc_flags =
>    | X86_MSR_RELAXED
> +  | X86_ASSISTED_XAPIC
> +  | X86_ASSISTED_X2APIC
>  
>  type xen_x86_arch_domainconfig = {
>    emulation_flags: x86_arch_emulation_flags list;
> diff --git a/tools/xl/xl.c b/tools/xl/xl.c
> index 2d1ec18ea3..b97e491c9c 100644
> --- a/tools/xl/xl.c
> +++ b/tools/xl/xl.c
> @@ -57,6 +57,8 @@ int max_grant_frames = -1;
>  int max_maptrack_frames = -1;
>  int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
>  libxl_domid domid_policy = INVALID_DOMID;
> +int assisted_xapic = 0;
> +int assisted_x2apic = 0;

This should be initialized to -1, in order to denote the values are
unset...

>  
>  xentoollog_level minmsglevel = minmsglevel_default;
>  
> @@ -201,6 +203,12 @@ static void parse_global_config(const char *configfile,
>      if (!xlu_cfg_get_long (config, "claim_mode", &l, 0))
>          claim_mode = l;
>  
> +    if (!xlu_cfg_get_long (config, "assisted_xapic", &l, 0))
> +        assisted_xapic = l;
> +
> +    if (!xlu_cfg_get_long (config, "assisted_x2apic", &l, 0))
> +        assisted_x2apic = l;
> +
>      xlu_cfg_replace_string (config, "remus.default.netbufscript",
>          &default_remus_netbufscript, 0);
>      xlu_cfg_replace_string (config, "colo.default.proxyscript",
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..528deb3feb 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -286,6 +286,8 @@ extern libxl_bitmap global_vm_affinity_mask;
>  extern libxl_bitmap global_hvm_affinity_mask;
>  extern libxl_bitmap global_pv_affinity_mask;
>  extern libxl_domid domid_policy;
> +extern int assisted_xapic;
> +extern int assisted_x2apic;
>  
>  enum output_format {
>      OUTPUT_FORMAT_JSON,
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 117fcdcb2b..16ff9e76bc 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1681,6 +1681,20 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
>          xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
>  
> +        e = xlu_cfg_get_defbool(config, "assisted_xapic",
> +                                &b_info->arch_x86.assisted_xapic, 0);
> +        if (e == ESRCH) /* not specified */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);

...because here you only want to use the global values if they have
actually been set by the user (assisted_x{2}apic != -1):

e = xlu_cfg_get_defbool(config, "assisted_xapic",
                        &b_info->arch_x86.assisted_xapic, 0);
if (e == ESRCH && assisted_xapic != -1) /* use global default if present */
    libxl_defbool_set(&b_info->arch_x86.assisted_xapic, assisted_xapic);
else if (e)
    exit(1);

> +        else if (e)
> +            exit(1);
> +
> +        e = xlu_cfg_get_defbool(config, "assisted_x2apic",
> +                                &b_info->arch_x86.assisted_x2apic, 0);
> +        if (e == ESRCH) /* not specified */
> +            libxl_defbool_set(&b_info->arch_x86.assisted_x2apic, assisted_x2apic);
> +        else if (e)
> +            exit(1);
> +
>          switch (xlu_cfg_get_list(config, "viridian",
>                                   &viridian, &num_viridian, 1))
>          {
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index ef1812dc14..d08f51e28b 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -619,6 +619,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>      bool hap = config->flags & XEN_DOMCTL_CDF_hap;
>      bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
> +    bool assisted_xapic = config->arch.misc_flags & XEN_X86_ASSISTED_XAPIC;
> +    bool assisted_x2apic = config->arch.misc_flags & XEN_X86_ASSISTED_X2APIC;
>      unsigned int max_vcpus;
>  
>      if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
> @@ -685,13 +687,30 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
> +                                     XEN_X86_ASSISTED_XAPIC |
> +                                     XEN_X86_ASSISTED_X2APIC) )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
>          return -EINVAL;
>      }
>  
> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Interrupt Controller Virtualization not supported for PV\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( (assisted_xapic && !assisted_xapic_available) ||
> +         (assisted_x2apic && !assisted_x2apic_available) )
> +    {
> +        dprintk(XENLOG_INFO, "x%sAPIC requested but not available\n",

This should be a little bit more concise, as Xen does always offer
a fully software virtualized x{2}APIC.

"hardware assisted x%sAPIC requested but not available\n"

Thanks, Roger.

