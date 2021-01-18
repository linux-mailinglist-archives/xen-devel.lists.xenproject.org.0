Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17092F9C28
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69530.124502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ROB-0001iL-QU; Mon, 18 Jan 2021 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69530.124502; Mon, 18 Jan 2021 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ROB-0001hw-N3; Mon, 18 Jan 2021 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 69530;
 Mon, 18 Jan 2021 10:03:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1RO9-0001hp-KY
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:03:57 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 462a7070-249e-42f3-87ac-773f9e6cf8bc;
 Mon, 18 Jan 2021 10:03:55 +0000 (UTC)
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
X-Inumbo-ID: 462a7070-249e-42f3-87ac-773f9e6cf8bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610964235;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8LDcW0fjdkfT6lxni02fc0PRTyqnNy3EWj0GBssEyus=;
  b=fqJYJrKuplzB+609df4Hd0GODmepOwmjFCSZWykvddOh4J1zCIvdZqBW
   q1oc9DBHpmuLX85+Ge4teh5+ZNcBXgise8d9aOP/r7wv1I2usEEavOstJ
   okMtvLpLnGiK9IUPYdB4PavO1cvHP7O8yLFrY4AsoptLF5XPjQbeWmpo3
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: aMsntsslgttitjw72dumelPBqrBsIkaijgZunTSauXyhFFjSZcfDnZ4F0pKrc72zK4hofU+MA4
 /uyq8t1GvSZC1gSVMRyVQEN84f+vPU/lJLrpAO75nNR76fRgs3CxU8g7Cekn4XETeZJNaDJTlt
 6QoGusXAKhI7IGRLq57FXa2N4JzDhwcm4hNFWVhZc9roTXK0zs9nI9e5GWUdZ5Ps5ucDe2jb02
 3h+EviL3chjU3s179I248P8mtZ0iocrVwWP4LncJNMo3ITpEh81Z/3hde17btG9XqX54UKoAIq
 Mu8=
X-SBRS: 5.2
X-MesageID: 35507233
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35507233"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwJDJxRur0VUb4rqNQEO7elgsTwaFoiE2AkJHvk5pClb6SMPEFRjC+XjB0N5DpGVj049tuxbQtHEquPOh+Gs2tJFADKgxli2hqNBaSHtlqXtDtVmPWKcQMIiL/XBZ3cbqTrsmOhDm3+4NN9xIt/ybMRZtloazEgLmIBSythOQfQ8hc/ULeBT70/FSbCWo7cNkps11cjFiSQYxk9WPTqhTnjDq7DniLohCdT6snErK1TT9eswWXhAE7rx/X3e0n80s4xZoZerTDevHG9WSX6lNYOZTZXS6n2M/DC3tn+P/JXMF/IwkQiQ3wtLglGmCbFbigCExoV4BlTy3UmPh7Gk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXQVh/+P7achXbUrYztTV+Fz6RuD2/1ZnsJT3QbJkfo=;
 b=PD0paIQy1bv0qP5anc/Ix7+UA1tfgbxWlV87vD8AHxB9Gyh0/GVxT8qUMSpSUmsJ3wofpS8Zk0CX44sHiLQm+87cr1TtZlGNBACLSgi5wZz4kNFZOosFZVB96m2FmjWoUuASpFUn5POjqhAnDpUba1EYDH40Q4Ov6+l0bTsl7OEJNMIzTa02c0S1nHQwNDhGXB67C8HoZDLEBqtuaYMomJhkX67sVU3WbFyVTSH7G6l7LgVeuOQsK15sI2BY5IHQxnZg1ouzw2bMIKc9ge+YFBeVS3suuhswUBYV+42sLdoSmaTpYsh+6xVfvcJXnLmZ97imNQsQnCgKfjhdXp2sZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXQVh/+P7achXbUrYztTV+Fz6RuD2/1ZnsJT3QbJkfo=;
 b=lXHoRs/Yl+LwQh6M4QVhD2i4jrS8/tdRHjrrYVKu6Bs2WdPImwQ63OQ6ySOaQAA8pP88iPK+dk7nLvy2XBUXoCLx+JdDPPJm9vH4kwPEbFeaX9lw/KmIyHXJkBPdqjCsS/s7j5n4Wp7b6l14UsJYDvxL+bMmF/KptQ0IdVJs6z0=
Date: Mon, 18 Jan 2021 11:03:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Samuel Verschelde <samuel.verschelde@vates.fr>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: XSA-332 kernel patch - huge network performance on pfSense VMs
Message-ID: <20210118100340.6vryyk52f5pyxgwv@Air-de-Roger>
References: <dc5d60d7-1ada-5eb1-ff91-495d663ca89e@vates.fr>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc5d60d7-1ada-5eb1-ff91-495d663ca89e@vates.fr>
X-ClientProxiedBy: PR0P264CA0181.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 653d4625-23d6-42de-d422-08d8bb9857cb
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4474834231F4C120E01BF21B8FA40@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XR4qjQvbPu+Kc7Pl1Jkn0p46MDvV+WUcUed+HSx5S9vFVm+M1fcCi6bHcQT81nYuZaAoA+tg28heRFpQWlaXSc4fL9cA/H1OPRs9y5aS5JRwco4IUreZ4+OQ104O5kFg50fTwt1uQtakOA/FyB1paRL7Yt+6pjjYAzNwlELxhRIg6Hwa4yyQ6+1KSVhQ7eK4Im0TYDJuNd+TjVlGO8OtL7wqOqVV7V0wUqzxaChk+W7nQoTisBmMGUNSOn0+NR2e0zVTtTXu/lAR6sQuweVmyb3ctQP4REWgsrE9bKFbE59Oz8KwTtnNlmSO+cvhRD3LK6tAEQpfqNuTlpG/JfwyrvMiImgA7qlKGvIot95giVF7e81Aapk7ocS+oDrVrDTRyZQqaHjgAf1wZ+7ZJ3zRp7awPKDLobpOmXnR2vpxnTc/7v6P7yjWGF4MfIM8f9yHInbXZRTMsJLWteuH4UY6nJIhyP3H1ATcOiPtN7/suGfAB2H7UAPnhu6RBnHUY3rOID1Q90dnSS04MN67EyZZ6oRTlU/YacjpH3GPM8a5a1Lge2baMGJoJRUTguoOlP28
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(316002)(478600001)(1076003)(8936002)(33716001)(6916009)(8676002)(6496006)(6486002)(66946007)(4326008)(66556008)(66476007)(26005)(6666004)(16526019)(85182001)(186003)(5660300002)(9686003)(83380400001)(956004)(86362001)(2906002)(14583001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zk83VU94V0FTMzNWWDNiOWVOclRObFVoZ2lVYndDUEJPdHVtNEdVcmVqQ0xY?=
 =?utf-8?B?ZjByd3NKaWtTaUsrZzRaelFnVjk3a2dUYy9BQ1hvN1hDSlM0Q3A1dER4QjRx?=
 =?utf-8?B?em1CZ1lKUDk1K1J3Sm8xSURLbUZEVE9iNnFYUDFvOEF3ekh0dXdQVkwvZUFU?=
 =?utf-8?B?akFpL3FxQ1hpenNabUNvd0pPZkRkSExKNzk4MVRRZU56UDhBRHpTNVN6Sm1x?=
 =?utf-8?B?ZzY5U040OHQ1bkh5bThvcjdRSDZYUm9LZ2NqZ2pGVERGWnlwSVN4WEtjK1FU?=
 =?utf-8?B?MWtXeVRraEJJK2RNQUp1WUIwZ3NlajVYdHVoZVl5NWFIVldGdVVuMmtqeGph?=
 =?utf-8?B?N2MzbmZYL1pVWkJQeG5kZlp2M2lkRlhmN2FVUjd4eEFKVzRIbHFJMkVWaUFI?=
 =?utf-8?B?eGQzQ2Z5SWlpb01SQldnbTBZZGhQT3NmS2ZTcVUxdEN1ZlFFMlltZTJPcnFU?=
 =?utf-8?B?c2ZBUUJDRklZRVBkbDlReXdLYkR3UUZLd2RCaEdlUjBYWU9OUzk3ekNEVkZT?=
 =?utf-8?B?RW1FTzB0ZGVzaUJLZHZEdjBiSzgwYWZreVVraEpDcDJYUG9TaWdva2RmajRQ?=
 =?utf-8?B?blNsdnV1bnNLMzFybHpLbVpZVWxNeFhEc2tuamRKV1VhZUtuQ1NxYTdEd0Qx?=
 =?utf-8?B?TmpzWU8zVVhYSnRkOS9mSjNFaWxNQVhXcHFmZ0hmVzJLTU5rQ2czOWlpMGhx?=
 =?utf-8?B?WG80V3BQd1VJZTRRVjdENXJvWDhpa0JtNVhoaVFKcEIwRjg4RVorVDBlajM4?=
 =?utf-8?B?OHBBSHo1Sm10cno3UkVsd2sxemE1TkdLUXJwQ09ZWkxKNS9IMG5McDdycldw?=
 =?utf-8?B?dnlDQjczM0hkeXd0MEw1WW5Ed3kxWElFeGMraFZJdjRSV2R6d0ROVS9OMHBX?=
 =?utf-8?B?ZnB2bU15MkM3dXgzd2hTUWNSSjE2Y3RLTVdwd0dic2RBajlJZG8rZHZFOG01?=
 =?utf-8?B?bGpMZ3V4RnorRHBhSXM5ZjBQbnFvbUhoTXQzbWRYZm1lV2QwWUxGOFJhUVd6?=
 =?utf-8?B?ZEt6OHVGU0JSUVNuMkJsT3RZekhmYm1jbzM1b3h4K2oySEp2TG5wZ2hIVTZS?=
 =?utf-8?B?TWtDZU5mN2gxbVMveEdhYUtyMU1tczBTQlRUbkJTQnZaTVpFVFVJajMxOXY3?=
 =?utf-8?B?V0dET01Udkd1SkNOYXlseTNVZmEwMTNMNkg4UmNxNlhkTGs5WStVVnVTNDJV?=
 =?utf-8?B?d0E2SGR3UHVzUU9uWm0ycWtGWXpEL2RPa2k5djZWalY5Mld1NThnRHFvcEFk?=
 =?utf-8?B?VDVZRmU4YXV4Q1ZJeUxNTlVrMllCaG5VU1JEVUI4OXJYSnZLOGprdDlPZGJp?=
 =?utf-8?Q?IJdmPF6cva8CfdGHKiT3y9yP/wtHavZwRf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653d4625-23d6-42de-d422-08d8bb9857cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 10:03:45.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofFFb55G+8ImiG8EnSJnNgv756+ThjG9QXlLb0qwKlUP/5k3ehMdXZVyQN9T4yYSG/K8wSJi65ckYtv/7o/wWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Fri, Jan 15, 2021 at 03:03:26PM +0000, Samuel Verschelde wrote:
> Hi list,
> 
> Another "popular" thread on XCP-ng forum [1], started in october 2020,
> allowed us to detect that patch 12 from the XSA-332 advisory [2] had a very
> significant impact on network performance in the case of pfSense VMs.
> 
> We reproduced the issue internally (well, we reproduced "something". The
> user setups in this thread are diverse) and our findings seem to confirm
> what the users reported. Running iperf3 from the pfSense VM to a debian VM
> gives results around 5 times slower than before. Reverting this single patch
> brings the performance back. On the debian to pfSense direction, the drop is
> about 25%.

pfSense is based on FreeBSD, so I would bet that whatever performance
degradation you are seeing would also happen with plain FreeBSD. I
would assume netfront in FreeBSD is triggering the ratelimit on Linux,
and hence it gets throttled.

Do you think you have the bandwidth to look into the FreeBSD side and
try to provide a fix? I'm happy to review and commit in upstream
FreeBSD, but would be nice to have someone else also in the loop as
ATM I'm the only one doing FreeBSD/Xen development AFAIK.

Thanks, Roger.

