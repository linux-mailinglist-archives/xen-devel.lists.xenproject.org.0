Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D06345BA9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100602.191849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdxB-00018u-4l; Tue, 23 Mar 2021 10:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100602.191849; Tue, 23 Mar 2021 10:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdxA-00017E-Nf; Tue, 23 Mar 2021 10:08:00 +0000
Received: by outflank-mailman (input) for mailman id 100602;
 Tue, 23 Mar 2021 10:07:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdrE-0006c2-1O
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:52 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac161ce9-013a-41c1-aa72-bd6248067ef8;
 Tue, 23 Mar 2021 10:01:39 +0000 (UTC)
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
X-Inumbo-ID: ac161ce9-013a-41c1-aa72-bd6248067ef8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wR4wJPP74Nzgw96212p/UH6sUU/kQSlKJKqNRW2EsfA=;
  b=U1+QFrKBLEbOVXKND0i75v+Vw9dFdrUh1skhEfRscpLUKlqZedC7g+/8
   891jFCZwsm1o/i1Cyunb6UkevkIoREiE0MNh1/ZauVZnY8myll4IWAcAn
   QUIWMUQSik8fyG5hWxPaHh1IxYQ6lyXEuntQSSF2q8zOs5SnUebjct2/J
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: flG4LL9BeCjzwH/PAnsOdAiH+zsEwC/NcqNe+MxUUtS7PT+MS76klZjdd3RabZSn+9XQvRFL/t
 beatTChezfKdh6lFBRKf+y9yxggifzNM7V6DOFAbRgTnyj1xTttspxrVKb54XkeYq2j/3vcW93
 hCExNio+GaOI63+BDkIA2LaC4U8cy9uVkYa0gam3B0r97on3WFK7u9PNk+jxFGe0COGoEcoNMs
 PSwLh5z+Ud0+fbwj2w1lf0Izex3ORnCXZjQFUeQeD13zUoeo50a0bgC8mU189clk697YcRgLjA
 8Pc=
X-SBRS: 5.2
X-MesageID: 39900462
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Dvnxf6M223Wq0cBcT0bw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiDtRIACdD0FwWU16HpI/Dp
 WR/Y5qoDCndHQRYK2AdwY4dsLEoMDGk4+jXA4eC3ccmXWzpB6LyJq/KRiX2R8CTyhCqI1CzU
 HpmxH0j5/Tys2T5QTb0wbonvFrsfvnjuBOHcmdzvUSQw+c8DqAQKREd/m8sCsuoOepgWxa4+
 Xkhxs7Jcx85zfwUwiO0GPQ8jLt2jov9HPuoGXw6RCIzL2bNVBKfvZpvo5XfgDU7EAtprhHod
 929lmUqoZNClf4lDn9juK4Jy1CrFa+onYpjIco/hpieLYZAYUhybA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocmTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpW+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8fl66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOsNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLyaZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsupLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVJTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniJUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbghBwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVA/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgukiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahXk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+7FVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAuju80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqkWoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KUIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfBONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4aQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyksz1gItqJkWAoQfqUG
 PviBF1zrPgXyGZ06QdBL91CWNKaFIk4HAKxpLOS6TgTCGrffpE5ly0LzuUd6JcUrGMHfE1og
 xh69+F28+ReCyQ4nGdgRJLZoZP+X2gW8W8HUalHvNJ6cWzPRC0uZSRifTDxAvfeH+ccEQXhY
 pMaEwWYIBis1AZ/fMK+xn3bLf2rEIjm0ZZ+hd9mDfWq9Cb3Fs=
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39900462"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7p1ZmqHS78xIz6czIRY9SBPPGFS9Yx3AscabrmCKpeMk9dTVHxFDhLnYsCbLo8iBbE+XBIWpBb7zyTmHMcLXJ7cY++EwPdr9nnTkkixRzMV6jOvKaAoNu82IA9gZMV7QPdjmaimChxAfhtt5GkHxlFQ20Rv7lPJ86sp4ASqlQpugkPKt90ajWymtQnO0K2oC9RYbcMJDtqN4hhjqh1xGoGi/kU+7xNHUHL6jDdi8niNze6VdB/YusEDf3Plkmd0mboX2Odud/1xNO3wvQoAMi3wOXgZcgGIPRBVzX22w1sAHfT9kbpjl7eggSJi9JyGCMfBLW1MpmD+kHrHp5iiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xte694DoXFSNebcQH5zfL8xkf7VzNnQAtPG37OEuSHQ=;
 b=CikGVkaqhUhgWc1kJVkeDpZG9wH33JihnVz7nLNDCzNWLmcZ22ViA/SvEpZcjm3elEIA/6HPOAHMjBg8KV982VNiw1mOGraXHYk83D3GOwExWy1XbjrP3NNhXoypqUROw9HeDEtZ9s9rIQsSzlYFe8davp+LCAX3Rybx5pVDBNUa6IZ1aQ7M2Nh2+5UAx0zymWfvW36gIxKlAw4JAo7QyvH2NMa0hqqxjv8PP3VWejrYBT6jCOqSEnY9actZMfHwnT4ISF3TGPhz1yM2oUYKaCvMiVlI9R5Lp4CtxTSg52Ryaj0BXeOb8UklHoAjm2qhL5VSwk1Qu1GNgl60UIvZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xte694DoXFSNebcQH5zfL8xkf7VzNnQAtPG37OEuSHQ=;
 b=aCWKWomeUv14BmOPRXoOP7KAzSH88QnDbkeU//BSlteFMo1BUo77I9uD56NHRwO9grwAwEjZS8H6rFtFT3WYC2UQ6I5Asj8+6aQvyVqH7caAQKhNgK35pEmQH/aJ7RTXM9Va84+aBo3SG6NVJ6FKqf4oBXUNgE2r5L/WF/Ez/cI=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 21/21] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Tue, 23 Mar 2021 10:58:49 +0100
Message-ID: <20210323095849.37858-22-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0057.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f13b24-f9fb-4d80-5a90-08d8ede2a44d
X-MS-TrafficTypeDiagnostic: DM4PR03MB5997:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59974D6FC87B6810FCE399348F649@DM4PR03MB5997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:312;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx4Bfir4r/CCh3boBxIoDIBfw/9ro/qVNfbTfqEuGbaxxtOtI+WZu7uKQxHCzBAD7FOouWgCXIEOxFy2Ie1wX0ZE0j5qCqxgBLO2h58YVIsoVl+e2I/n3NwpuobPVjQamKAMrJFXY8cbRGydz/2rQEpzNpBwz8gLHA1AYrSvfzxaUWZ+OUj4J4mB5jszmpTwNYfKaQSxFtdAUxzfTj19c1OLqeHVg48U6E7n2CNtZAqk8I4jlHV+JtyEt6L+fvLfEq+kztTgIQ+f/fd5KSjbqLCYG+5IdUT8ry0oqPjD2nUyK8/iXZ+F+1wT39XP2nkdWKPx574qrZbZiJkEWWj9KIXhumTSyuPX94divZ7pk7/U8hmqpW9kAsipLoaq/vbOF0adyuOh0tmevPimkcaKqiuLAlPRPK/pIlLqOFRU8cs3lZRNeLae3kJ6STbwyDZq4npzFQo+E7BSDDe9H4x6an+7QWvP2S/VDpAVB6zgYpQsoEmVMc4yjrczl8R5+6L3PMy6KNQTVnIyU2KqYBPxPLyY6VtIFsZPrcJk9KeC5PBPdyRopc0cDftW8b+dLwuCkpAs/vBcWMfozNv7AQB+MfQS8b/1QNr7dFNGPBifJKcmteoBYWhsVED9nZBn09T3+wn8m1d+Q0dV9PZ+lf5McA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(8676002)(6916009)(83380400001)(86362001)(36756003)(6496006)(5660300002)(6486002)(2906002)(66476007)(66556008)(30864003)(8936002)(66946007)(316002)(2616005)(107886003)(54906003)(186003)(4326008)(6666004)(478600001)(16526019)(1076003)(38100700001)(26005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V0lUODlydFUyMXJsRnkrN0pUL1REYVROZGFOcUVzbG5LRmxubTc1Y3ArMVcw?=
 =?utf-8?B?VHpDN1NDVWR1cGRUUHZldTJrcGFqVkZkRW1CdzR4S2JaeEw1bi9qVVVWZlRt?=
 =?utf-8?B?KzhoMStXUWVrZnhHb2JJKzVkb1VwMS9QclhOSkJwSldvNElhWUVaem1KTWlQ?=
 =?utf-8?B?VnlwSlIwNHl2aWhoSExTNWNqRHNnWjczeno4VXlFdkZRUTFvWllrT2dPWGwz?=
 =?utf-8?B?d0dvajBOaDVIcUpKUWZwOTdaS1d4Y3hEZkxWaEJJYlB2bVZUYUFDSEpJQWtN?=
 =?utf-8?B?M0hEY1FQdUNwazZFcklsbklwWDNEVkRGRlJ6MFJQcWExRjJmTTF5MXl6aUZC?=
 =?utf-8?B?NjBYMWYxK29rdTM4ZUdwN2ZPR09UTXorSHpQRlFwdzJrSmFDK25ZTEhGV0U0?=
 =?utf-8?B?Nmg5TkM5SlFkMHRDSzExeFRTNXZRQXhQdDZpNEpkelhCS2NickpHZ3NXQVJn?=
 =?utf-8?B?cnpraWF2N2tuNnV3R3NlSVdTSHZZYzVLODd5Q2l6UVF0VXhKNnZodk5HM2Zt?=
 =?utf-8?B?RDQrTWJhdlhNTDdDbFE5UnNkZDdudHVJWVg3MWFpVnV6WVFUODZFU1dtRWRj?=
 =?utf-8?B?WDYzNzdsT3dFbFdKL1JOeXVvZXlNankvMEczN0JNUzh2cUFwN2NPYUQ3QjlU?=
 =?utf-8?B?OUFnVTk3Z2NYajlzS0R3eE5mNWwyYWRXZmZDeTVaUlIvWllyTHpKRldhSUds?=
 =?utf-8?B?MzhIMmhXUnNJUjdrc05tUk1zaDFyMldjM3J6YjgvdWVGbDA2VVRrU1E3dEhz?=
 =?utf-8?B?cFFoVFlMSVEySlFUbUxJYVlPYzFRWkZDclp3bEoyU0k2UG0xSlU2UnhDZFZh?=
 =?utf-8?B?WGd1azVXbkx5d0FtbnhYblBnaDhIOU5udit4eS9kUjNmSDhxdVlSMnlBM05j?=
 =?utf-8?B?Z3c5Mk55Y09tdmtRZnlabTNqNGpkNm5RY2lCS0luNU1GaVB3SVpwakdlelZ6?=
 =?utf-8?B?Z0JrblA3ZVRpZGdNUGZZaEx2NDJoU2psdFQrUlViZ1hhS29xVVg2aVByRkZn?=
 =?utf-8?B?dlY2MGVYc1N5S0UvY0YrQ2wwcVR2WCtkaENnTnhPOGVXYVJSbnI2WW5XT1Fh?=
 =?utf-8?B?TllwUm5nQkNLYkNqVWtvVXAzaHBXZnUzNnBudGJpTUdWcWFMc0dBUE93bWxX?=
 =?utf-8?B?OWswYlBjMVdsZVN4NmJnN0VLcHliM0ZvUGh4RGs5M0Uwd2d6SkY0Qll2NTd2?=
 =?utf-8?B?eWR0ayszZ3F4MVUzMGJDenlmTjN2SlNkWFp0ckc4cnFuNW9HRFNzeWVrWHZC?=
 =?utf-8?B?NW44SDQ3YWJCTmlqUnF0MHF0TmEzZVdWTCtOK2h6b2Q0T1F2K29KeFZOOTdC?=
 =?utf-8?B?Rjlja0ZXSmdWN3RkSHBlVEh0TG5GL1VuQmNvbStFZFlNOFpLL1l3RWN6d2NL?=
 =?utf-8?B?YUFDeWVXcWtJVzRSdFBBTGpidWRaSHpmL1loNTEyQkVxZVc1S1JnSFNKNGM0?=
 =?utf-8?B?b2FsR2Q2KzBVYTFmRVVpY0FjdW9WWkFvdWhSdkY3MGZJY2RUQ0RSRUNyV2FB?=
 =?utf-8?B?Uy9qcFV0UHYzN210TW56UTN0T25DZVI1SHI1RHRjdXlBdEtuR25nelZMSHJF?=
 =?utf-8?B?Q3NCLzhJOUJhR0xJdWtyZGlRdGwrQlpjdnBHdkxHMS9VRnhXOS9IVUR1QmM5?=
 =?utf-8?B?MDVKTXBzUUo4dlhxQUFrVE1wNHlrVndacFdLQU56VnYxbXFEbnQvN29oS0xK?=
 =?utf-8?B?Mzd5NWp5bHgvaUhkVkkrU0tKeGtxU3FYeVlaZXZHcW9QK2sxRmpLSFd1TXJl?=
 =?utf-8?Q?/oauW8polBHHy5YWsz/FBG0AdXiTvjPv9KlhTAR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f13b24-f9fb-4d80-5a90-08d8ede2a44d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:01:35.0936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwiYEJgQ0NIVWSFlNJEaaIUkZDctOeywqAu+Lls5gJub/YxzbD/WiuBRci3M5ww+aMOov30w9tS0f/+yD5IdcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. Having xenguest
parsing CPUID data in xend format was a layering violation, and by
moving such parsing into libxl directly we can get rid of
xc_xend_cpuid, as libxl will now implement it's own private type for
storing CPUID information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/libxl.h             |   4 +-
 tools/include/xenctrl.h           |  30 -------
 tools/libs/guest/xg_cpuid_x86.c   | 125 ---------------------------
 tools/libs/light/libxl_cpuid.c    | 135 +++++++++++++++++++++++++++++-
 tools/libs/light/libxl_internal.h |  26 ++++++
 5 files changed, 160 insertions(+), 160 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f2..923a931fa67 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1376,9 +1376,9 @@ void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
  * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxc may not make assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 5a576f72b4d..a57e32513d4 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1864,32 +1864,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
@@ -2617,10 +2591,6 @@ int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                            bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index dffb9923b33..51b0ab66a80 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -258,131 +258,6 @@ static int set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t host = NULL, max = NULL;
-
-    host = xc_cpu_policy_init();
-    max = xc_cpu_policy_init();
-    if ( !host || !max )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain's max policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_max
-                                           : XEN_SYSCTL_cpu_policy_pv_max,
-                                  max);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s max policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    /* Get the host policy. */
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t max_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, max, cpuid->leaf, cpuid->subleaf,
-                                     &max_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get max policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *max_reg = &max_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, max_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(max);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     xc_cpu_policy_t policy = calloc(1, sizeof(*policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index f1418382b62..ffa256b62e2 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -291,7 +291,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -369,7 +369,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -419,6 +419,135 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl_ctx *ctx, xc_cpu_policy_t policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm)
+{
+    GC_INIT(ctx);
+    int rc;
+    xc_cpu_policy_t host = NULL, max = NULL;
+
+    host = xc_cpu_policy_init();
+    max = xc_cpu_policy_init();
+    if (!host || !max) {
+        LOG(ERROR, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain's max policy. */
+    rc = xc_cpu_policy_get_system(ctx->xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_max
+                                                : XEN_SYSCTL_cpu_policy_pv_max,
+                                  max);
+    if (rc) {
+        LOGE(ERROR, "Failed to obtain %s max policy", hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    rc = xc_cpu_policy_get_system(ctx->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (rc) {
+        LOGE(ERROR, "Failed to obtain host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t max_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        rc = xc_cpu_policy_get_cpuid(ctx->xch, policy, cpuid->leaf,
+                                     cpuid->subleaf, &cur_leaf);
+        if (rc) {
+            LOGE(ERROR, "Failed to get current policy leaf %#x subleaf %#x",
+                 cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(ctx->xch, max, cpuid->leaf, cpuid->subleaf,
+                                     &max_leaf);
+        if (rc) {
+            LOGE(ERROR, "Failed to get max policy leaf %#x subleaf %#x",
+                 cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(ctx->xch, host, cpuid->leaf,
+                                     cpuid->subleaf, &host_leaf);
+        if (rc) {
+            LOGE(ERROR,"Failed to get host policy leaf %#x subleaf %#x",
+                 cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++)
+        {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *max_reg = &max_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, max_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOG(ERROR,"Bad character '%c' in policy[%d] string '%s'",
+                        cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        rc = xc_cpu_policy_update_cpuid(ctx->xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            LOGE(ERROR,"Failed to set policy leaf %#x subleaf %#x",
+                 cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(max);
+    xc_cpu_policy_destroy(host);
+    GC_FREE;
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -535,7 +664,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    rc = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    rc = apply_cpuid(ctx, policy, info->cpuid, hvm);
     if (rc) {
         LOGE(ERROR, "Failed to apply CPUID changes");
         rc = ERROR_FAIL;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 53b8939fb5a..5b9a220004a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2050,6 +2050,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.30.1


