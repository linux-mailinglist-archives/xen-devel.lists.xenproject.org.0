Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DB48AC66
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255690.438208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FIW-0008O6-1H; Tue, 11 Jan 2022 11:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255690.438208; Tue, 11 Jan 2022 11:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FIV-0008Lt-U7; Tue, 11 Jan 2022 11:26:39 +0000
Received: by outflank-mailman (input) for mailman id 255690;
 Tue, 11 Jan 2022 11:26:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7FIU-0008LC-1q
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:26:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553e8741-72d1-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 12:26:36 +0100 (CET)
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
X-Inumbo-ID: 553e8741-72d1-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641900396;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wWmMK5pKCuBzrh9EFFG+WEKgvITauNQ+qymED1UrlFo=;
  b=WrKPQ7WTdJgaTHJfRsfdzsrFGMvL8G4aSNGKDIi0zSm2Rxz/WkorKItT
   A3+wRZY+3PXZS2J5jA+8QjZSwytE+Pg2ahKInizaqvAhvTDznSBNXYN5E
   /5Neu+aKSxCORvWewl+XsdRIVAXgsTiFq+vnR0TiQmSKNuPOFSv52jTef
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VlJ/eW+4RAHsByqYae5WlYo7pj4tLT24hatPzg+gyqL0Yh585lW1Nkg82Hpx1/j8tcsuFMpKUN
 Ioh28oUfW/7N9C53k1+IcUXWTzIZW1sED86I5CI22m0ejUZEEmpdlFeJt+g2R+Vpj4knDoR6wu
 QrsbQq6uVA/BCRJnl9eHfOo0kL+jB3kpVbW+e7yJyg3OgfotdB7AgEHXazbX5MPVFyKW8QpXNL
 KNKFF/TxITNtcg8DCJC/kL6LLF2ao37tiZgGwzEVPLl6AuwE4Oo4dtIoEcYA47yQLxTN15D4rL
 6zrvUByMJAC1E0gW2eUktrr/
X-SBRS: 5.2
X-MesageID: 63847831
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:O8PU/KBOmkhHlhVW/7Tkw5YqxClBgxIJ4kV8jS/XYbTApGkr0DIAy
 mceDG3SbPmON2L8fI9+O46yphhTvcXUnddgQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940Es7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pDWjv88t9
 O90u8aeSSs3ArbQpf0yekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf6auYAIh25YasZmWuSBX
 ccTbCFVSU6YQDZoHlMYVqo1g7L97pX4W2IB8w/EzUYt2EDS0w5ZwLXrKMDSeNGBWYNShEnwj
 n3C13T0BFcdLtP34TiP/2+oh+TPtTjmQ49UH7q9ntZjhVbCmEQIEhYYE122vZGRiEGkXMlEA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYV2d3JeL8Q+IACZPA28uexMfUTYczPC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+yskPNbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/03AYH83oJrW3FF5ufkWZ4umoWyKBBaJdsRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QSO8gtLFbWpHozPSZ8OlwBdmB2ysnT3
 r/BIK6R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimNYgEAFe/iFyNq
 b53bpLSoz0GCbGWSnSJreY7cA5bRVBmVcGeg5EGLYarf1s5cFzN/teMm9vNjaQ/wfQM/goJl
 1ngMnJlJK3X3iyYeV7UOyE6ONsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:DUhy7am8VnMWq8Le9Dj88V4Af03pDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="63847831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AemvOUCZnDcGQJiYgdphgxLLUu0JZt+cC47+MIiUoWwWhx19Lw3tvFhJtEl/KODZPRnQ962Nkl+Sy3+U/OSrnDdtriGCaGlXup9IdeIPQf1T2fl0uqJTJsFonCO/twop1GQ3OqCSoE0JJ9AWkmpUGg0EMR6iym89uAGbsqRcgWj2otnHTj1EDrrhXs1/SB3Nb4J/r0CoaqLQEe11yQqDe/Mi1qi2BMWXKGCdIu0sYSv3dyVqZnUviCnZF5Abfmaxx5XvYF14Z+zuDJUjwbBNrgO2sj0WXZ3IWza1vgvVjBzTsTROQDHVLN91I5QcNSNKj56MnDDiCinu/osR3V9WKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULfAFvYIo4kefH6stSr6XVisjycs3F2wp0Q1rb6HjZ8=;
 b=l6KUYXBeH9Ag5saj7gE7lnDsIKzygUWLez3qFiVkryRslkvRnIZEWn216nb+dLSSmF46WgWm8xJzH4pu5s1eUBEAePYGCaa6527WU5ax3WjXewpQaYsZpUBsYNZD9lCJZAMJuOXSj2rvCFAyRWljf6OpbhBLOqXlySsvV9RZrOuDBRad3cTDSnuHiizkiCQml9/CWmqRFl+2QJ47p8RxCBxJafHuy97wc4bs6ddyeqhLl9rHs7vt7sauDsqQkmqEqgRM2tGqmm1bcyN7agKvdSYnDIVOP+3cRDbwSOwYHDiEIMagtbU21gmqTNRHjL0N25eWSP4Xz8VOuYINQFMZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULfAFvYIo4kefH6stSr6XVisjycs3F2wp0Q1rb6HjZ8=;
 b=Fsbwshz8xAf+kBt+oGGhf5v/T+RWjDBWima6tvYKWo09ihjfUGHW8rHW+6xb2DbmUdHTT4/rJf1EFHwUDqQWkuNNln2jK2HefzyLX3xDtj2EnZRLp/hxFepBXKWoU7H6Op5N6E6mxtskumMIuaSSPb/HXOdZlQOfsBZHFkMPMkc=
Date: Tue, 11 Jan 2022 12:26:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] tools/libs/light: set video_mem for PVH guests
Message-ID: <Yd1pYC5kQA1t/j74@Air-de-Roger>
References: <20211203073058.10980-1-jgross@suse.com>
 <4176f64e-fdb1-8d23-d226-bde5e473883b@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4176f64e-fdb1-8d23-d226-bde5e473883b@srcf.net>
X-ClientProxiedBy: MR2P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0298e616-28e5-4c04-06db-08d9d4f53728
X-MS-TrafficTypeDiagnostic: DM6PR03MB4393:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB43937D0DBE510FCA8FFC8BC98F519@DM6PR03MB4393.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SU8Ih7DKeKBE7XwF1G3BxYpgaNLdSDIAVN6ESOfjVdPPa4kUQG+VjhblaLPbYbTCpBfRUbYl6QMVgvPdme0OJVPR6G7lVlWWTC3K7WqoVL3qUvcUcAYjwcnLg1zVpNlg4QzwzFWJ+lEdLKRqRqidoPLvBjfRDtlyzGqSgTVzakFUJ5JwzcMTR7IaL5W++9vQCKRUp37A8oRG3jTOB22Z4PE0jAfVM76kivBJhJ2EroZN0uKXby33psUVwvqXdvBScMZXG2YxKW95GfUXKlANJJTOFVNC4BsWqIFOT514oTqDUy64kK9GMIHvjkit8E+CPbLQ4UJlHgOIX1T4vDn+tao7U9nzD5R9kFpYeW8iosklBOwUgXijBk3FWghzyK4JeAtWL9ef/FLPOOyb0ZIjAGWq1Ekm+Vj7lXyuGSAtf/YaRWq2VPugcUWXjtx0Y7Y+RMngtrWjVkcNPc1cWy/VC9SxXO6BRW7o6ZyVeJgjHeGFnyb0Iw58sGNAfXl2gh/gLl9ocCM8VCyF0LaXOHmzoNUHGSJevxEHnynWncTCzufOc5nNWEn3dFjVD66RQhg/DptnVZ4FaiTWItHltS3YGjs5Joxqg7wGaYCfUWQKfN16RBjHFY/HSWJQorDNuhb7ZcSfrQX0/NJHUL+rTkLfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6486002)(66476007)(186003)(66556008)(86362001)(2906002)(66946007)(9686003)(26005)(82960400001)(85182001)(6512007)(5660300002)(6506007)(53546011)(54906003)(316002)(8676002)(6916009)(83380400001)(33716001)(8936002)(6666004)(508600001)(38100700002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZ1YWY0UHBSckllNjNYdEw1clBUUnUveFphOEZhUFhmNWtZc3h6cm42MGNW?=
 =?utf-8?B?Vkg1NU9wazVVeXdPN1MwdnYyZVFVR1FpaUhlVHJpSkUraG9TeEVldU9jZExx?=
 =?utf-8?B?NEQvM2hNeCtkMS9QUzFzdVNJaWUyMUpFR0dkT1R0TGgxbjJ4cVVWWkNQa2JJ?=
 =?utf-8?B?a2E2UGZMNmZ0SGZHM3pYdmpIWDk5cWttV3dGRVZCOVQwTmFLd2VzODZPN21F?=
 =?utf-8?B?eS9KZS90c3ZxK3VEZ3BTcHZFaGx3QWczMklZTFdkbTYrbVFrYlV1WklSVHo3?=
 =?utf-8?B?T2ZXYzg2Y1hldUNTNGlMZGUrcVV4SnUyWFE2RmFNN3gvcU80Zlo1V0hJQjdj?=
 =?utf-8?B?aFV4RDRZeU00ZFRadEVlcGxZNWZwQXlvQ3pqVUxOYUQ0clpURXdVb3FMY3h3?=
 =?utf-8?B?MDRvNFpDbjJERlk0cVJ2ZkZ6Wmxtbmw4YUR6ZWozTWZBZFkyR1RIbEwzbHcr?=
 =?utf-8?B?eUwrMHpzL2xPSGQrSExuSU1tK3poRGRjajdZcTFwV3ZpbHlXY0M4MzM5SE4z?=
 =?utf-8?B?VnZhNGVkNHo3akYxZXJ4cTgxVUNFcHkyR0lXRDhHL1NGYW4vN2tmTExJR0xX?=
 =?utf-8?B?UkVtL01JMkdhWFVxYUl1b3RDU21OTS93VjZqU3RLNkdTTVFiRnVtRldYelB0?=
 =?utf-8?B?YllwbldFWE1XS1laY1lWUDc3MDRVbUE3aG9lUUxJVGJyem14aHI4aVBoY1F1?=
 =?utf-8?B?VDVnSXdpek1VcHF5WEZvSFhPNzlDZ1ZxY1ppaDFCTXNUaVU2MVo3eVpqa3hz?=
 =?utf-8?B?c1kxRmhsbUQ3T21XUm9JZVRCeWYvMjlwbFpjRG5PNXhWdHdiOE5hZE5CbGhw?=
 =?utf-8?B?alZzcmU3cElzNmVRazVWNzlQVTU5d0dGRUZFcVkrenBqTFFoNkIvRzNIMDNN?=
 =?utf-8?B?YjJkSDdkRFcwU3RLSUt5MWNUc2tNK2VMSkxUQ0Z1Vy9BNFpMTVkvaGJGL0VU?=
 =?utf-8?B?MnVpTk9EdUNxbW1hSWZ3SnBpaXFha280aFdsYjRBZ2l4MEg0WlBOWDF5RFZm?=
 =?utf-8?B?eUc5TXZSZkYxU1I5di9Ec0RtSUZRcnJYMkQwV3ZhT1dwaHNNbldVQU1JVDVS?=
 =?utf-8?B?eHJXRGJFcEs2VVo2TUNwTTB6STZuYS9WOTF2R0ZlVElXNUxqOE9XVEhDdjQ1?=
 =?utf-8?B?UDNZR3Z5YW5jYzdlM1BkdUZBSEVXWkc2MG4zQXV1a0ZXSVBXeFIveDd2eTRh?=
 =?utf-8?B?enlnZ0dzdnNKVG9SZ0lQdFlUOFFIb0cxWno3WWpvQzlpV1IvM21sMWNLbGFy?=
 =?utf-8?B?TEJxSXlaL2xTU2piSVJ6STV4anZuTGlRQWtWOHdlU0J4OTJoc1BnUFRJS3F2?=
 =?utf-8?B?S3F1c0Z1RXhZUE1CaEJrMzlNZk5xUXprZUoyR0VDTkJYNEJHUU1LdTA4ZEVN?=
 =?utf-8?B?SnlGZ1FhcDRpSnlkZWNySEJIYzBJWlVlZGovVUlEWEF2dnkyL0l4ODJDcjI1?=
 =?utf-8?B?dTN5NWRiaHFQd2phMmFqWGJwMngwZDhwdlZpS1Z6aFlPZ1YrL29XYXUxcUFz?=
 =?utf-8?B?UW9ROUJtVi96SUthdU1jSllLNzdEenhCQjhyK2Q1U0dZNGNsWlk2T2d3SlNY?=
 =?utf-8?B?ZHFWbVVCclpmMHVKajl1MHdJQ0xWYUdaR1NxN0puTUI5SXBKVFFjL2JPS0kv?=
 =?utf-8?B?YTZleHlUQjNiVXBjMkhnUXhKZ0x0dWNLemFKbC9zUVpHNHFjY3VPcVlvOGxT?=
 =?utf-8?B?ZVJxS0NZZ0J3eDZ5eFNLQ09abkdISW9wd3FBczhQZVRqdTNGOHBuWlhycDZO?=
 =?utf-8?B?SXBhRndiejJtakhtT0dUVE9iOFRoYnlteHBoUjMySmZseDJwTjJSUmVYV0pk?=
 =?utf-8?B?bzFZWWtreWN0dXRVM2V1QjFOemNrbG5ycEt2NEs3Wmd5K3JkRFRjeTZxRHZX?=
 =?utf-8?B?NXIzQlNMYUxaSE9WRmwyWEZpNlpKM0N6MTMwVmJ3OW0zK0Z2NzgwOVFxa2Ex?=
 =?utf-8?B?V2lTMERtaXE4a3hqcE9kZnVUbUlDMjFXWUhaUGdqeWdZWkJ0UXQzK0lZL1Bq?=
 =?utf-8?B?aXV4ODd4UDFPb3hMWkdHeFFyVWlZVUx3Y3AzZFVBMndqaGpmdGR0blBLN01a?=
 =?utf-8?B?WXJhRCt5b1I2Vnp0VEhQUlFXNUFkTWRDWFlncWtQQmN2YlpEUDRaS2lTWkRq?=
 =?utf-8?B?Q29NREp6UHZHZkdzUmpFMmY0K29SaXdzTEVVT05NZGk3NnNCMEpHMDl1UEF2?=
 =?utf-8?Q?it7WkyYKiRj9EyaPX7J2w8Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0298e616-28e5-4c04-06db-08d9d4f53728
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:26:30.9269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbrhlCty/KLAqhLcjbEgzZa9MO6SZ/3H6Rc9KsrzvAi8EqVMLO7JBRWqNdbAKh3/6OnBRy+WwXcPc+USIDRPIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4393
X-OriginatorOrg: citrix.com

On Wed, Dec 08, 2021 at 02:00:48PM +0000, Andrew Cooper wrote:
> On 03/12/2021 07:30, Juergen Gross wrote:
> > The size of the video memory of PVH guests should be set to 0 in case
> > no value has been specified.
> >
> > Doing not so will leave it to be -1, resulting in an additional 1 kB
> > of RAM being advertised in the memory map (here the output of a PVH
> > Mini-OS boot with 16 MB of RAM assigned):
> >
> > Memory map:
> > 000000000000-0000010003ff: RAM
> > 0000feff8000-0000feffffff: Reserved
> > 0000fc008000-0000fc00803f: ACPI
> > 0000fc000000-0000fc000fff: ACPI
> > 0000fc001000-0000fc007fff: ACPI
> 
> The patch itself is fine, but some further observations based on the
> memory map alone.
> 
> It is rude to provide an unsorted memory map.
> 
> The LAPIC range is required to be reserved by the ACPI spec, missing
> here.  Conversely, it's unclear what the reserved region is trying to
> describe.

IIRC those are the special pages used by Xen console, store, identity
page tables, ioreq...

> Of the 3 ACPI ranges, one is RSDP (the first 64 bytes), one is the info
> block (4k), and one is the ACPI tables themselves.
> 
> RSDP really ought to be merged into the same block as the rest of the
> ACPI tables.
> 
> The info block must not be marked ACPI reclaimable RAM, because it is
> referenced by AML inside the DSDT/etc.  This is a very serious issue if
> the OS actually exercises its right to reclaim those regions and use
> them as RAM.

There's no DSDT on PVH, but I'm unsure whether it's also marked as
reclaimable RAM on HVM which does have a DSDT. Last two blocks should
likely be ACPI NVS I assume.

Thanks, Roger.

