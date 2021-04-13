Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B3235E0E1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109846.209747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJe6-0006rd-MO; Tue, 13 Apr 2021 14:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109846.209747; Tue, 13 Apr 2021 14:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJe6-0006qs-H4; Tue, 13 Apr 2021 14:04:02 +0000
Received: by outflank-mailman (input) for mailman id 109846;
 Tue, 13 Apr 2021 14:04:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJe4-0006oj-KM
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:04:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1dd7163-05d5-4bdb-a40b-534c9a1db758;
 Tue, 13 Apr 2021 14:03:59 +0000 (UTC)
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
X-Inumbo-ID: a1dd7163-05d5-4bdb-a40b-534c9a1db758
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QzwwOkwqoS7FecsC8ab+hi6QGGGojhwL/w3/xIfFNS0=;
  b=d4ngdGa3rC9mqAEwYFODP5VHYeWvi6oNDwuzdKdXDK7xpOl0DgYxl0yv
   vknCFL5mf5Q40GDBjds9DMIN2MYr95cT+fv/TK2J+2omyO8NAWOcmkS95
   clLfyYGqt9uKOqlfu5TOQFtSCHI94GNw4SOSYnh9MqyG734N9AbFoRLIh
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 801o5y8ArO4H+IwmsY+XelcXNY+C/snEXWlqK4dzbAL5TtOhFEToh7BTJWgcYlzYB5Blf+PVdl
 zTR4KnyAPF06hlJxfdB6XMQrDTr/dKZ3loG/Xtr1Bb0mdAlbYc7hntdUeX4PyE/ODRSq7LZu24
 IO1NTq17J3res4E6F6jI2KQLvMT+pwCMMDltUAQRaGHhS3OuFJ/1zZcA1Jh4ACMok0HGwgiVR/
 g+aKfggyIcfHarlLqNyWihJAov6dVmIxz/TOclOqBrWA/Ycze8VjZyfkEkdgM7na3AaLQqShV+
 jNY=
X-SBRS: 5.2
X-MesageID: 41322512
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2x3PWa4k8s2QDmvRuQPXwTqFI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoewK+ybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIU3D38Zn/+
 Nbf6B6YeeQMXFTh8z3+RT9Nt4mzsWO/qzAv5au815GZ2hRGthdxi1+DRuWFVAzYQFAC4YwGp
 b03Ls2mxOLf3MLYsOnQkQURuSrnayKqLvKQz4jQyQm5g6HkC+y5NfBYnql9zoXTj8n+8ZezU
 HriAr8j5/T1M2T6hiZ7GPL6oQTpd2J8Ko8OOWpquw4bgrhkRypYoMJYczAgBkQrPu04Fgn1P
 ngyi1QQ/hb0H/acmGrrRaF4WCJu1pAhQ6GuDulqEDursDjSDUxB9Apv/MnTjLi90EisNtguZ
 g7p16xiptNARvM2AT76tTYPisa7HacnHs4neYfy0FYSIsVAYUh1rA3wUU9KuZnIAvKrKwXOs
 xHLOXx37JzXBexSVf3nkcH+q3xYl0DWjO9BmQSsM2c1DZb2FpjyVED+cAZlnAcsLogVpht/Y
 3/Q+ZVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOkjKt4X87NwOlaSXUa1N6KF3tI
 XKUVteu2J3UVnpE9ey0JpC9Q2IZ2mhQzL3yIV764JisrPxAJrnWBfzDGwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknwQJ9XJX4CUNAEu9oyVl6Uy/i7bLHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSqVxbD8UHsckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn84smKLDZFo7EnZU
 cWGsK+roqL4U2NuUrY5WRgPRRQSmxP5q/7bn9MrQgWd0XucbgCvN2bcXtI3GSOIwJ+S8++Kn
 8Zm31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3rGY6dz9YZM+BJY+UKl3HQHGfiYFwjpCmS
 NmUkspV0XfHjThheGZl5QSHvjYbMQ5qhysO9RopXXWsli8qckjSmAAZSOnVdeajG8VNmBpr2
 w015VaobKb3R6zNGM0gY0DQS5xQVXSJIgDMSOoS8F/nKvxdAR5UGGQ7Abq+S0bSy7N7EUdhm
 voMCuOX+rEa2At50xw4+LW1BddTCGwRHgYUAEkjaRNUVnj/lt+1O+VarH26WuebVMe3voQWQ
 u1Mwc6E0dS45SS/D6x3A2vP1kH+bkCetH8KJhLSdvu80LoFanNsYknOrtpwLZJXeqCjsY7Fd
 +6UzW4aBfxFukp1wGvhltNAlgllFAU1c7N8CfIqFO1xmI7HJPpUQVbboBeHvW11UShePqSyp
 V+irsOzLWNG1S0V/qv842SXhBuDTn3h1KaJttY+qx8tb4utbd1ApnQWSbJ0nYCxxklMMLoji
 olMdFGyaGENYl1c8MIfSVFulIvidSUNUMu9hf7G+kkYDgW/jDmFsLM57rDsrw0BEKd4AP2JF
 mE6iVYls21EherxPofC6gqJ35RZ1V54HN+/Pmaf4mVDAmxbelM8B67NXC6GYUtBJStCPEVrh
 xg5cuPkPLSfy3k2BrItT8+O7lQ6Q+cMIuPKRPJHfQN/82xOFyKjKfv6MmvjC3vQT/+b0gDn4
 VKeUEZc8wrsEhtsKQnliypDqDnqEMslFVTpStqkVPgwYCq6mbWF0MuC3ySvrxGGT1IdnSYh8
 XM9uaVkGnn6D9ewJ/ZCQNeeMpNF9V4dPm3Ew5+bcwL+Lim8Kokjn4dPFMgD2sghCv82O0j17
 Gjw/nWU/DjD3CtOV9pw08yOqdk2igw7WdHeIyi6Jj4ZAMdHOsBGeE+6YBbiygBkCm503QMKx
 F28hU13YTMJEH9N3tyFaLyjZL76SJo05Sq+hlrvjFMgVuph1GXpkjtk8u0s3QyqXfBrgUPk9
 TVeBIhxCBDtgBmxqR9Mn2CFW70KEn1RG/K8A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41322512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWdJ2DwP8uIgdlJmVhozPuTRRWQ8SLY3fdwVH14LYUa3vN2apBJKg9mFOpF3gBZhnIfa5dMXsnT+iMyRKtV4wbZMyrZdNlXxs67dqAOS3ToK4RBzC1ohQfYWAdE6gLNpLxG3Rtq7sLYRH02XUDagwubqfmL40cOTUoLFo+GEIzGfdXcS627/y+HBSEhcW8/EYiynhIHE+pc7C6966cV8phEyqnkjpHdjNxlXf9WFixJJph12Ad94TwUI1laOlTJuwaDsoKNdl/BVEJ1QgXxHrA/+PIPGEMblE+9uJuPUTNxx7jAe+yF0KTF7XJLSxcolOLTa/IPlVpW7CEPZK2ZgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Zx32cQTy4/2mKyZxLklN9EMm3hZTZZ5DreDlJpjcSA=;
 b=OK99UAP8k8ah3pMc43IR3IzuExZwFtzCS/pWH4MKblK0Tos+WiYzXn7PbXfXwcSa6lyxiDuyP2hNIrTHaoh25Wo8yj3DTAFZKU0WBvoRqXg+C3bXnrKbFMrxlLgL8AqnhTSvkq310BvDBVA7ReV62hgcANuXfVzLmqHNROzCUP9BX5UqblYOAMOfa7kUmQmX0Au2YlN4dBwHjmk2txZH3DBOPyYO/et0tDAzea2pND5qFbtDhpiXp27isSLlj4djRkapEeVIexaBKaZgJ5wGXWe7xmFM7YOJdzdei2kVVC+MmftUv3YvfHjOJAV2XI4fTwdKvXoBSDgmvSFM8cZHsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Zx32cQTy4/2mKyZxLklN9EMm3hZTZZ5DreDlJpjcSA=;
 b=LcfVD4gILPZz5yOqcvX5q3DuG5XTuoG9alF6oGgxlfZjyLYuFPgv5fRlc3TE7PfPSouwqRVDzG3AKUheE5kV2LILKDJekXRp9EyqXOpeP/6t56KxTLOSP5PZZX/7j9nEbWfG2xS+Y0l+SGbU4hcK8HnYHXw10WijR3L4NaKtFT4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 21/21] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Tue, 13 Apr 2021 16:01:39 +0200
Message-ID: <20210413140140.73690-22-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27ab9fdf-274d-4f2e-da52-08d8fe84f961
X-MS-TrafficTypeDiagnostic: DS7PR03MB5605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56056E6278E4ED77DF4B69328F4F9@DS7PR03MB5605.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LlUfZdAJqmO4QlEL5nF4y6iBRXrNLZMAxE5c9mSijVrh1fiRnD04KQabjZY6RAAKyS4wdZ32gifPJZ7+9zG2fzxx4LhPjAyWd+3DwI/CRLOowPCB5EOOLCKzuikWAXgYK8BhyD6jWlbq1yT24qYbHFcSjjFETX+rm2RCRaA/Poe7XTMHDFjIxuG4WSUMD2QlugJfaXiTEqdLxppf8R7j5UcKB/cLFNM++sO8EO70QgAy0VUPh+4GNZCaGRaQ/ulV6wdsBRbKGq8+A3jUU6yqw8in4PjMmjFVqreUlWdqxyn/spSskD3NPv1qWadWQJZ7s5SPEH7VC1sEdIcR/oNo3iFfFnClLV8QUGQDZGOj50HOySXaqKNv6kPKArfj5zmOrKKyi+0pMzgroNadPGguZ0w1T2E+QpDNLL5Hqh80Ci/mlQ2CYnv3Tnda7hXvUYIMmsjwW9xqUio6s7seJm+v/lpaN3bpmEc2LQEWPml8iDGb58/0Q9axdD7xSIEx1d614RIWUgBZAoaToXleoacqz/oTUxnqCeDcVLdMtKChfH51rJW85SEcxgtVioXDUTgVAQYCxMNn+16v+Z6KxNbt5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(1076003)(6916009)(38100700002)(86362001)(478600001)(6496006)(6666004)(107886003)(2906002)(30864003)(83380400001)(956004)(26005)(66946007)(66556008)(66476007)(2616005)(16526019)(54906003)(36756003)(4326008)(8676002)(6486002)(8936002)(5660300002)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TG5Ed1BtK0J3bzZHcEtSRzhneHNibGJnSHVWbWM5a3JqQ0c4dElOZDUyaS91?=
 =?utf-8?B?RDhQQ3cxZGx4SUd5YjhzKytQblU1ckY4dkNERXFmLzg2R2duS0E1WmlEcVdX?=
 =?utf-8?B?bGhCS0pxWk9Bb1E5eUJjOWFwdFNadHQvY2l5dk1OcC9TUGdVbDcrVWdmczNl?=
 =?utf-8?B?ZDU5ZUdUVVlSZGd0eXFxcHU4TlI0VnZuUzlBTjJ6V1VMT0JVL3lOWjRxRU92?=
 =?utf-8?B?eEZ6VHJZazJqbG85TEZVSUhkY0ZMbTdPbmdjaVVPalJPQWtkOXVRSFZ6d09S?=
 =?utf-8?B?MFFWQjJVWnhuYW5SQ1AvVUUyWG95b0x0QkRtemRrSHptOTZGeHQ4L0ZOUDBm?=
 =?utf-8?B?UzkyeUlnMEI5LzFJR2h5Z0thRUxnL1dMa0d3RnY1cG9SMlQ5UGNnLzRnMTdQ?=
 =?utf-8?B?YXFMYzVFMU1NdURRYXgzbFdKU1ZaWEV4MDArT1lzVDA5UjhWaGNJOEdIaFdh?=
 =?utf-8?B?UDVtcjlCazNXTDZyQktBNkxYUWFVdXhJUXloQU5vZjV0L2ZCWitPQ2QrTFFn?=
 =?utf-8?B?ZUIxWVRDZ2hFallBa091VlRFb3BxcjUrejNNU25rd2tXMFpPOFJicjU5eUx4?=
 =?utf-8?B?cGhCOXhhdEhzTjFuN2pBWE1Pd0JtL3NKZHhFZmMrckEzMVNwTTJLTjloWmtx?=
 =?utf-8?B?K2RvdUM3bW1VV1F6emVGTGVhTVNaR1pWSXNGZUFEcnNjeEpWNEgzTHZUQkdn?=
 =?utf-8?B?RTRWaC9xenRhbTF1VWRxci9UWnB4bW5UZWsvRWMrQjNpSnNJVjdrRWNuNkNU?=
 =?utf-8?B?QW5tb2ROUmVXL0syQlc0TFdxWHNpZGduZE9rcWh1NlR5eXRQU1ZXOGpyVUdH?=
 =?utf-8?B?Z0lnb3c0MFhpTXNjZzdBVGdVN3JiSEluMGhUVTVBQWtFWWFEcUJTS1pzSlRa?=
 =?utf-8?B?OG16c2c1SEptKzJlc2k2RHhjaWszMVJmRHhZWkNUV1RjMHdZa25ZeHNSTjE3?=
 =?utf-8?B?OU9uZGxLRlJ0Wm4zR3pSb29EVTZoMC9NQ3pISi80bTVOcURMNWNZL1dsT0tD?=
 =?utf-8?B?MUZRUzN1TmVJM0hwL3lqYzRyRTJSeDlycGVIbjczd2VlSjcyVFFwR2hyZ2R1?=
 =?utf-8?B?ZFMySFRYVzFtYVh2Y2hIekNmU04wL1pDdlJsOXd5cFIxbVcyWnpnb2gzS01n?=
 =?utf-8?B?SFJuWWlRYzVBMUNMbTNXYnZpSUFxSnFGY1dvOVhzdlFKaWlSemluRWdoWW1X?=
 =?utf-8?B?RXIzMnhVTnJTUGw4UjZUOWxDMDVGaStvL0k4REJGcUZ4VjJBQVpQZlFFRHdH?=
 =?utf-8?B?TFpBK3hpYnVsVHpLNmpyMTd2cWY5TGxOZURWM3lNTEtHai8wL1ZvWkViZXlX?=
 =?utf-8?B?ck4xZGFaOHVRR0UzR2o1ME1xR3F0MnJUcXV0R2hkRVhISUl2Y1pPMWkwZkpj?=
 =?utf-8?B?M3U2UmFiVzVBcVhsc0VpcHgrMDNqSEhKd3VkUmx6QnBPNmYvZU9TNGc1K0lB?=
 =?utf-8?B?TktXQ0VZSzc5VzR2dUZhb1VNRzJZUk9zaFplMkFhamlHcjJYNWZXWUpjNjdG?=
 =?utf-8?B?RFN6WnMwQi9BK0FiaEtDdWRiR3U2bUxGWTVxVFBsUWhzTjNZM2JrTTFuZmd0?=
 =?utf-8?B?NVJZa0s1MkliZlNOR1BpZ0pnVXRzQXFSbENBL0swbkc5UjV0ZStnVHlsWVhQ?=
 =?utf-8?B?R0JEQWR3N1NXYklLcFVsVjBSWXFiSThJenhLRVgxckJ5VHdQL0JXRWVZaXgw?=
 =?utf-8?B?aDdVT2o2TWJUVm51UmdvTE1SL1VKMlVNUlpjVmc2YXhKQWtjYS9kS1pZRmpr?=
 =?utf-8?Q?9lj6bpj/xlsbYpjXvDrR/d+wy40Y5PBDFWmnKpe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ab9fdf-274d-4f2e-da52-08d8fe84f961
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:03:54.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0HOU1kVmtq6C/VQbTVYNrLsmqp9zGHyBmtdOfyme1Z2C8YFCZpWvdjAk8OdV/3+cOrkfeHcTs3eVRxg33V0Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5605
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  30 -------
 tools/libs/guest/xg_cpuid_x86.c   | 125 ---------------------------
 tools/libs/light/libxl_cpuid.c    | 136 +++++++++++++++++++++++++++++-
 tools/libs/light/libxl_internal.h |  26 ++++++
 5 files changed, 162 insertions(+), 161 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f2..150b7ba85ac 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1375,10 +1375,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index c6ee1142e8e..044d05321a3 100644
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
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t policy,
                                   bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 70ca4939392..5144b186028 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -288,131 +288,6 @@ static xen_cpuid_leaf_t *find_leaf(
     return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t host = NULL, def = NULL;
-
-    host = xc_cpu_policy_init();
-    def = xc_cpu_policy_init();
-    if ( !host || !def )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
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
-        xen_cpuid_leaf_t def_leaf;
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
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
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
-            const uint32_t *def_reg = &def_leaf.a + i;
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
-                    val = test_bit(31 - j, def_reg);
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
-    xc_cpu_policy_destroy(def);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index cadc8b2a05e..6be2d773d1d 100644
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
@@ -419,6 +419,136 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl_ctx *ctx, xc_cpu_policy_t policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm)
+{
+    GC_INIT(ctx);
+    int rc;
+    xc_cpu_policy_t host = NULL, def = NULL;
+
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if (!host || !def) {
+        LOG(ERROR, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    rc = xc_cpu_policy_get_system(ctx->xch,
+                                  hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                      : XEN_SYSCTL_cpu_policy_pv_default,
+                                  def);
+    if (rc) {
+        LOGE(ERROR, "Failed to obtain %s def policy", hvm ? "hvm" : "pv");
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
+        xen_cpuid_leaf_t def_leaf;
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
+        rc = xc_cpu_policy_get_cpuid(ctx->xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if (rc) {
+            LOGE(ERROR, "Failed to get def policy leaf %#x subleaf %#x",
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
+            const uint32_t *def_reg = &def_leaf.a + i;
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
+                    val = test_bit(31 - j, def_reg);
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
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    GC_FREE;
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -535,7 +665,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    rc = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
+    rc = apply_cpuid(ctx, policy, info->cpuid, hvm);
     if (rc) {
         LOGE(ERROR, "Failed to apply CPUID changes");
         rc = ERROR_FAIL;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 5709bcb93fa..d130c073ac4 100644
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


