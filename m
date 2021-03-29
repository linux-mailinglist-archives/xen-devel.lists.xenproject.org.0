Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94C34CBE7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 10:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102875.196397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQnjQ-00005N-F8; Mon, 29 Mar 2021 08:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102875.196397; Mon, 29 Mar 2021 08:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQnjQ-00004s-Aw; Mon, 29 Mar 2021 08:58:44 +0000
Received: by outflank-mailman (input) for mailman id 102875;
 Mon, 29 Mar 2021 08:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQnjO-0008WS-6U
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 08:58:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27cd28c9-f4e0-4054-89b8-522608847dba;
 Mon, 29 Mar 2021 08:58:39 +0000 (UTC)
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
X-Inumbo-ID: 27cd28c9-f4e0-4054-89b8-522608847dba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617008319;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wsXgnSI58+Jr8+zatGJvthlCgFZTqM69N434gsIH27A=;
  b=Gwfk/IJvNtQx17K/VrOD7RS9Dg3TxWyKISr6IW6tfdbk9uHAOmNw1CxL
   bkCMHM5/5iRPqxERhKtrFaOVQJ8oHWX8mzpSTTRqgWdefnhTfKwCWdV5z
   3StNYMAAF2ELr3s/YOYpS9JRklWKsvgVFHHfrBf4XvWn/8W7iq9UHeItd
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: d1FBGBhSmVtBDE8S69N0PyiTd9+lj7bv2JG9Vb00l5wclpbXLvnY3z3CmDZ1CuQ8qqRp6J3Rdu
 TmMw0bpcL5tzfbG0WvdO44wkNWc691Bvma6kXI/bZ9a8rkvAQqteSNN4KCBbzBukGsPDb4S5Vz
 tv0sYS6UtJVLpz2F/OXuDGBbvO+3/og088Ixqf3/QLOZJVh9iodlBWeqnjtGRKbN8J+MMGvQdF
 ZAV004Q2Y4TQQTayCvcEZyb0PCPJRlukIQmYUNt5Zgqt+X/Uy4q5erU/XA0DvJintvtxAnstyN
 dsg=
X-SBRS: 5.2
X-MesageID: 40333732
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AyvhsapDvTKWMwz2C8wlNhAaV5u4KtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYytLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh5Y8HoodrXmJX6JSMXHhJP0nj1sRqEyp7fVyKZ0BAXTi9Vzd4ZkF
 TtvgTl6syYwpSG4zDG0Wu71eUzpPLAzZ95CNWImowpLFzX+3qVTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qU5yDa3Dwj62DvxDaj6BOJy6GJJ0NZerh8rLlUfRfD500rsMsU6t
 Mx40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ0nbaIibtZq3Osi1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheugNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 tHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58Az/WKfXKWgqWr58avjDD4DRuDAn5o+r
 FtRAg3dcRMij4rkYst9DO9I5aH+34Yrw==
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="40333732"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr1IiaYB/0C5mPcXKxS0c0PxeuZW5K12xvrtNnIJvUqSyyGu8Dmn3U7yA3K5S5gK7fMwvWm4FHXkRQLpA1AgTWDzvuFCicXD6I/3d6kSSe0hABRRncMEDHqN8gG8rFUiwR3aNqDn/rwQ2LnGPcOy7aKN+r8bqoQ+831IRLSPohgSCP9eC6dArUpS5eG/yKYeqQk+Zdw2trxHtreLWizhdDmvVKWXGjtVNXbXyzo6FFNcJ5DLtgstgQ6hNzt+dufpzh3EVrmEnpWHuhkNn7SZlOTTN4S16bSl+HJw3ZhC48e/zRPflghdj952Qg2uPh+L3XiW16/VDL6bnSRvktn6cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoP1zbXW3g1yFyqXA/ypxVDGHqulLi4fVxs0+Y1QHXE=;
 b=T6emeoIB7y6TWAt+H7WjDy6xMeKOzxy2xOLMrz/1JaH9q0Ayg3XyeASFCpKH+oJGS+MyHdIvejY6IWW9x7FQjpuGeG0zhpqoYD5YNiEZo9tIwa6QbMi6H0ffSMg6OAxLYx80dU8izPyPcndHSAAnDtYpZ4vRtbtBHI1eE29T5D28E7RKVjkYsw2as6q00q2bcEVtitgVaZhaWOyKR5aViQMuzXkQR2ybSO7HLeKSwSRWBnrR/p8BhFZwBqBbD7IfYhRUc+Dhz+LjAvqDsxT5w8DIPJqBFRcEthmBO8UzFKShNOYm6tsJmAskFOnYsxihN9xuK/P0iA2apYbwzYbRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoP1zbXW3g1yFyqXA/ypxVDGHqulLi4fVxs0+Y1QHXE=;
 b=J0pwovIubAUvE1OQeIwaR4Yi6tSrKNVgWYSRoZlYGmKSjMAeYSYot5KsYM9cSM4f839W99yQI9sq3Z0e5mtn51KlIBlf38YxHMuFKyi9YBMxrPgz5M4Bs1t8xiF14JPf5R6sbispSrzW6xJF/vfxp1exxzZHaURPGUO8ZaX6mpo=
Date: Mon, 29 Mar 2021 10:58:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: Re: [PATCH for-4.15 0/3] x86/msr: Fixes for XSA-351 [and 1 more
 messages]
Message-ID: <YGGWthm/W4QG4Dvo@Air-de-Roger>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
 <4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
 <24658.5692.932979.892439@mariner.uk.xensource.com>
 <YFIbEqh9IhrY0Lwr@Air-de-Roger>
 <24658.7471.309734.168120@mariner.uk.xensource.com>
 <24669.61118.533307.438087@mariner.uk.xensource.com>
 <24669.61445.44470.436950@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24669.61445.44470.436950@mariner.uk.xensource.com>
X-ClientProxiedBy: PR3P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 653d4cc3-4b19-4377-566b-08d8f290d64d
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59689DD501AC787F5DA100D68F7E9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pANGZOTSBhWno6d6no+Aq2Ei3NlCP+UuvedLfY+FMPAbfjh+QpN4D7zTKpukIdT8971pTrtcIzwB91jzYPRCEeBwQfocNRg+CE+JHlBgp1GmaX98Soppe37q1gLLKg2Dm3AbCMriBou6HNRubBtHJAy7/xEaj/lblOFKOK/hEzTFyDRg+7gJhzGhBERx8FCDPxiNRNYSMTfUwIRSx1HIi5FoeGtQVNNOf8HrdwrWkjMqu4SDrbcWvw8U3I0sqLOfuU9YkAM7b2H/XjcW4K2c9zqxvsAv+gM4jwH25P4z/c+4Nlp5BdYvyqnLnNIesHYWI0W2PtdVw4giAKALgSM+tVs9BVr8zpD0SpuMLpVrUDuvVJCZpkEWUHgHB0bcy8smpbcnKrs39ZGVIa6a6jvCcmQQ9FI/KgC7Sd45fNS4iudoj14PUv1ifsFUkUufW8sQl86AIEZx57IazIS/9SkQ5eR+nS6KY3s05LBiB2JraeysRbisZiHoKBMYey1D4axE92J4e3uz6o6pA+COx+ZY5CHSUexuC7oyw9AJ8RuKWRmaKCOzmAsFAKZmQ0EALNQrOoPTUvRjmoG8/oouyGhgEmTP1sIPLtZhf680Vf5IucqKCt7su37MSKxxcnauU1ms3kciG2X9swpMz2mfSNLoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(39850400004)(366004)(346002)(396003)(136003)(956004)(110136005)(33716001)(9686003)(26005)(6496006)(5660300002)(16526019)(316002)(8936002)(186003)(66476007)(86362001)(8676002)(4744005)(6666004)(85182001)(54906003)(478600001)(2906002)(66556008)(66946007)(6486002)(4326008)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0h4RnVkVDVZY1BDdkFJeGVJS3IwZW54eVVLekxneHFnTm05NkJoZ0RQRzRJ?=
 =?utf-8?B?ZFZZL0VMblBqdFpCQmJlM3BvdDJDMzV2NWY1dzU1MXpsZ2wzV2JnZmxMK3Np?=
 =?utf-8?B?bzlUbVV6bHIrcEVDeFk0MlR1MHNDVk16bU1MbExqaXRZdXZFQTh4R2Vad0RI?=
 =?utf-8?B?RjkrTUF4TWZWUVVmOVQ2elJDdkRUemkyeHdpdzB1WktidTJRYXBGaHFKcm1G?=
 =?utf-8?B?dEw1Znh6bk1uQnVIc3lLbThTd0ZOQlpiWkZsM2NXbXZWVDRKQ1ZzWlNjZUJz?=
 =?utf-8?B?YmlqOGtOdXJFWnRWSmV1dllBMDZER2ZTMnN4TGpxOGsvY2wzeUFQZVAwc01D?=
 =?utf-8?B?WFk4YkJ3UVJ4UmJLNWp4YWpXblJlMktvYkZWTDl2N1d4cGlvSmV6bTltZUhV?=
 =?utf-8?B?cFpRek4vbGNpcStEdGw4VTNzTk0yMWhvWkZielR5VWlFVTY5MzVKcDJ4MFM5?=
 =?utf-8?B?SUw3WkNlUWR6aEkrVG8wcURoTkd6K1U0SU1ENWRpWEZSL29xRWZURjY3ZlBY?=
 =?utf-8?B?dzA1S2t4dnppR1lJNkMyN3FtL0cvYXpqY0RYSnd0TXMxSXJ2cFFXcGQ0UkdX?=
 =?utf-8?B?eGdZMlB5ZFF3MmNLNDF0Uno0NWUzMEZOT24yUml3YmlZWG9HRUhJT0V6SlNE?=
 =?utf-8?B?Myt4dkhNZnNKSlpwYTVUb1JwSUVDQnJwbmp6QW42NlJ3enNZejNFWi9xb0Rv?=
 =?utf-8?B?dkZKQTBKb3Q5UG5XWno0Ym10eDhMY3U2TDBKSWNSRS9OWENOZndaVzE5WnFL?=
 =?utf-8?B?dlFtV3lUTExNWHFPTGdxTTFQWm5jS0owOSs5cS9wWUZuV3YvYzQzQnJhNmoz?=
 =?utf-8?B?bys2Y3ZqSElWNTY0aldCZkxxYXVRRGc0UEU3a2ZYbnNyc2JXVHpwTnJyMDg2?=
 =?utf-8?B?ejF2VGxVZkZMa2ZTUkNKQ2hPZFN5SHNjbUJpbkpwSEhINkZwMUY1ODI2djRC?=
 =?utf-8?B?LzAwYkdWVVAzZlM1RElFVDdUQllzOFN0NG1oYUZ4QW11bW9RM1YxbFZ3cVZV?=
 =?utf-8?B?S29yUGVOejVDVnRQVDY4REFvWHhhVndidHlCbXl6Zk1WSHUzVmEvU0c2cm1l?=
 =?utf-8?B?TTI1UW0xTXdjUzZCZEgydDNTWjVqQTQ3MGE4T2VQa2p5eUFTcDVHQXNnb0RQ?=
 =?utf-8?B?RGV6cWpVUnNnazZycHRrZ2VXUjZZakhYMFMyVlM3T3hVRVQvVmNIYk9rVDJy?=
 =?utf-8?B?U0NsOWd0SWZlK01oZ3pOVTYvaTgxSVZ2ZEd4OHVScGpIeDZtVjhKL1VsMkxN?=
 =?utf-8?B?ZURmVjlDbUtUUUdGY3RNaHJ1ejVuSkZDK3ZjdDB3U0VxMWZEaXczcXFPV1Ar?=
 =?utf-8?B?czBmaCs3N2pjZlVPN2JOczZZVDlsU0xUYzJYUndsK3hwVHFpRzhZU0t6bHFn?=
 =?utf-8?B?Z0hPUktPNmpKVGI5RXcyeXhhTzI1eUt5aWkxdXdGLy93NXBpa2NvazNLVXpa?=
 =?utf-8?B?aUhiNWRuR1o2UEdyQWN5ZERqdnR6VVc1SmZDZGxSdmlKNWdhU2xydXkxQ3c4?=
 =?utf-8?B?cDRibjJvUCtVV25IWDlKZkdmOEszMlBNMW12WVBKeWhERkUvZUxweGM0QXZj?=
 =?utf-8?B?VEhMMnJkNWx6ZXliSGpTRE04WkhnNUtLQ29sUTZZZXVhWWsvZS94aHJ3QXlN?=
 =?utf-8?B?OWxIdm96TzRFbUtJLzJQaDl5R2NPVVluY2RaaERWVkt5QVNocWFqblhFVUM1?=
 =?utf-8?B?bk52N3BsYXpWUk1tU2J4RXFBM29wS1RyeWNtT1QyMlFnUUVxSURsOGdTNjky?=
 =?utf-8?Q?RL8gZ2SkacSR3wXoU7Odk5ryqZZriDsb36ySEZv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653d4cc3-4b19-4377-566b-08d8f290d64d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 08:58:35.9969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/JKblGBTdqDgCoF4SyR0yqkCgZ5i9jGuPUmKLcnBZUauOXu3qcHJWh9SRuclmI6zTG2QD/KPe45vxhzXU3N/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 02:30:29PM +0000, Ian Jackson wrote:
> These two
> 
>   [PATCH 2/3] x86/msr: Forward port XSA-351 changes from 4.14
>   [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
> 
> have reviews from Roger.

From what I read on IRC patch 3 could cause issues with some Linux
versions?

I'm afraid it's not clear to me from the IRC conversation what's the
issue exactly, so for the sake of not going over this again in the
future, can we please have the issue with patch 3 mentioned in a reply
to the patch itself?

Or else it seems weird that a patch with a RB and a RAB didn't go in
for no apparent reason.

Thanks, Roger.

