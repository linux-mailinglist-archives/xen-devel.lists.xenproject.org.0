Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC2540FD86
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 18:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189575.339349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGO1-0006Si-1C; Fri, 17 Sep 2021 16:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189575.339349; Fri, 17 Sep 2021 16:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGO0-0006Ph-Tu; Fri, 17 Sep 2021 16:06:48 +0000
Received: by outflank-mailman (input) for mailman id 189575;
 Fri, 17 Sep 2021 16:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVMF=OH=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1mRGNz-0006PZ-7j
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 16:06:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67bbcb14-6e30-46bb-901e-eaff7323f5de;
 Fri, 17 Sep 2021 16:06:46 +0000 (UTC)
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
X-Inumbo-ID: 67bbcb14-6e30-46bb-901e-eaff7323f5de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631894805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=fWXZivuGbdRiQGIsQOsFfvQX9cFEApvTxe0sr16//bk=;
  b=RvbUWyHmnI3ldN9aMHC/Cic4DA63RytuXuAbB24wUIDgDW1Epn18kWXh
   OkWRjBRt2FlpI1EXG1XIJxvTkuPQvLy9pIDYjIyY5HSgNvmvDRIi1m6Vk
   uP0Mbc6PzxTsNsQB1Lqrs909rJWLJPgzB4iCk11oEwuBqOgh4jtoakC57
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8Aru0YOHM1sgvWspVA6KcXb8k4nxprKy+bLVQqNHZ7OhVXkV4n1akSSGM5IeMAfoquJzJCPdJi
 OeWPJKIO4AJ8xafI6oENVKuFZMTQlpMSOFxCMgPNddrU0ujWenv/N/S57rH+8TCFuT7UrS3Cav
 S8yGXtp0D32CpjtfWGrRWxWuvzAb4tcdYureaEdLirW2vlLtQHNctxSslaoV1cP5cdAb6JZvZV
 kQObcr/cMOqQp5d8Ls32dz3kR7HO/Xqx81lx0xOc4HzgAe7LM2ptEsf3OsFOEqznglwusoJhMW
 L76A/XLWFYr0kkV9Fo+FnT3Y
X-SBRS: 5.1
X-MesageID: 53412760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PihOh6/IKyyJ+fBuEQMvDrUDNXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 2ofXmiDPfyPNjH3Kdojb9u/8kMH6sXQnNUxQVM5rik8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79g3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhVl
 +x1kK2ZTTwFYIHFtu8XeEF5GjlhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwoLNPqJ58es3cmyTDfAfcpaZvCX7/L9ZlT2zJYasVmQK2CP
 pBGN2IHgBLocg9DOHgrI6gHpsSP3VLyQhxEh26unP9ii4TU5FMoi+W8WDbPQfSISt9ShV2wv
 X/d8iLyBRRyHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqGOUwmsfGRgHT2yRqPOyilO9c99HI
 klS8S0rxYA+/VKmZsPwVBq5pDiDpBF0c9hNF+w37imdx6yS5ByWbkAFUTxpeNEgrNUxRzEhy
 hmOhdyBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbjBjCU9JiG66dlcDuFHf7x
 DXihDc6r6Uei4gMzarTwLzcq2vy/N6TFFdzv1iJGDL+hu9kWGK7T6j30GD+3N9EF6rHYlCvt
 3Ivw+mX9P9bWPlhixexrPUx8KCBvqjeaW2H0A83RfHN5Bz2pCXyJtk4DCVWYR4za5daI2eBj
 Fr75FsJjKK/KkdGekOej2iZMM0s0aGoPtDsTPm8gjFmM8UpKVPvEM2DYyetM4HRfKoEyvpX1
 XSzK5/E4ZMm5UNPlmHeegvl+eV3rh3SPEuKLXwB8/hC7VZ5TCXOIYrpzXPUNrxphE96iFyNr
 r6zyPdmOz0ACbajM0E7AKY4LEwQLGhTOHwFg5UMLYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq71vf9DKMNoLed4nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSQkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:m8rsgK39kY/JK9d69SGBwgqjBehxeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hRAV7QZnibhILOFvAj0WKC+UyvJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZq6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngaOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k7Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXUISaCUmRIXee
 v30lEd1vdImirsl6aO0EPQMjzboXETArnZuASlaDXY0JbErXkBerV8bMpiA2XkAgwbzY1BOe
 twrhKknosSAhXakCvn4d/UExlsi0qvuHIn1fUelnpFTOIlGfJsRRx2xjIlLH4sJlOw1GkcKp
 glMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNzd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDnRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dgv22J6IJ84EUYYCbRRFrZGpe4fdIks9vdPEzAc
 zDS66+K8WTWFfTJQ==
X-IronPort-AV: E=Sophos;i="5.85,301,1624334400"; 
   d="scan'208";a="53412760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W54Oar4enRhG4uHsMecR6bTiz8BZFTfMt1BXeecozNQHQZrBFPZ/9mcmLpr0vAb+6vdDj2Y3pYSnoXZTjG+hvmhHW+E4FB42yogE+4X0jeSBoDBk11KhaEXPGvOK/7zASUk1+8Cm0jHW4L0Qk0bXYWTL8MdJ8dqUfSnnNk9ERp7q7jMdH3WfvYjGgBsP4NgBxr75r3jZPHOfP3p83CU70usOl4LSaVSSviTxLmtu59smaWH4eJctz8yk8FL38yWyNgx9c48oXQ1bapsC52R3u6g3n19ykn+7viOC06Bx8TsKZVjKjb8ruPwdHfe8B5pSk5VT1JUAREgu0xQl43lrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v3F8QEn72i58rKNTvmlNs6XOnoIn95bdmjUqwCN7gms=;
 b=a4jo42jBxy9YTwEYtPowyv2zUmNDW0/zOIBVV50a+Bi0uvyqqlmNuSswkozkfAkb2KnbIKulr1YzA4wHuTZb+4H0JJPdPRatn0OO4vQN+48w5hEoQZz+P8f5iGSslxAOU3S46vdsdJGK+veqwQBB3qmUBHmL/VMO9zB5HSTE6P8AlH1FtLTJCN4n3oE16+U28smxo9l3Qrz4VOpVqGAWUd6r0edjJHoIcYchPI3B5hSvIBQ764N/29rkmwFOSY4aSHVCj22TeUNRbR5DFEKoBY/jCpj3oNQpi/Ki2Ju5pDlrAwRiOJwcxcGEpi2hZH5K65xXqQA/QAL/ZQX7ADQQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3F8QEn72i58rKNTvmlNs6XOnoIn95bdmjUqwCN7gms=;
 b=ZbeLEwUsS6fWuD3mcqYnKBkyYQJuwIDEyw8c+DspizKVZUBvWqc5rxLuO8WA9/ngT2/0h5Awd6xnKQJtDuIZ8qQBwJfzoU5sz8tLTQaJsxgsJyUb7kFtgaf+UvDbH/0+ACH10/XeyfnClGpiN2VVn+wXm/TqL3WQJjw2FZOmrYM=
From: Christian Lindig <christian.lindig@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/6] gnttab: add per-domain controls
Thread-Topic: [PATCH 0/6] gnttab: add per-domain controls
Thread-Index: AQHXq9s0IM3OAQqHo06+ALWIm01YaauoZEqA
Date: Fri, 17 Sep 2021 16:06:42 +0000
Message-ID: <0D7E40CC-EA8F-4CE6-B4C7-A69C403BD4DF@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
In-Reply-To: <20210917154625.89315-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32b609c0-0da3-4ca7-7eab-08d979f523f1
x-ms-traffictypediagnostic: MWHPR03MB2574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR03MB257438D663C07ED293091F23F6DD9@MWHPR03MB2574.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NziO5PCjM3LXBCqzUVUZsVYShEy7xek4VL1YviRFIUfr4vxVOoeWyYd8lvxUnEsNTP/+YO9T9NPBD21tHBL3sDmNGKTrHBHcLSiKXDhh+vCHoG9BRWRmYvs1Aj4mbUcoGzO5/J6Q2zY2dGsdOO9a1GU9YGkOSbRim12vt0nnrrxxhwJOoQaXqZR7i48sy0ErYk9GZuwBIEcpjbjX0Gz+8WvY1rI7P58uHW10H6HeVldPM/LERSquIrfoB5Qqnn4gTHvqMAOpOzffxwNlc+0J6/znlwam8m60yKFbYzpzONkrYias02+U/9icUe6RSNIqzGRLuc0J9EjNGlsic5pGXfkynmuU8BZdbJxp9FuBesBHIGU5754+w1i1qGRX13dbTCpPctVLs3XJSC1oq2z+LM2aNjQq1UE4mYSEzG//doTg2hwxFotKhR6wnut/V/K55QEe8x/Iamdf9Z8Q6h0YJawGbfB+QJ0MHIlq+q4Pw/C5m4sHGX6no8HjQ+xWr30FzYDhLzdFrxck0c3M6ilYZwKYugUbQwTxSlELY96NL9NRctcUn5m4SWPvZisTreJTzzJzw3EMfUFWg/SR6h4CV5fLXfSdKGu31gTMCFgKncgPRpKfYqiui7eksBmHIHfuT8D3xpdfssMN0FoxQrO/CyiNeb4hYnPMdhTx/5XVg5QQRry4InaQiCSFTT9bQie4olQnUJrcnb9Z8DJhkQR11dPEcSVgqMJAPlwfbRhyPDw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6380.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(91956017)(8936002)(8676002)(4326008)(26005)(316002)(64756008)(2616005)(66446008)(66946007)(66476007)(110136005)(66556008)(6636002)(6512007)(186003)(86362001)(6486002)(83380400001)(55236004)(53546011)(36756003)(44832011)(6506007)(38070700005)(38100700002)(122000001)(71200400001)(478600001)(33656002)(5660300002)(2906002)(76116006)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qnFeU4jdgMHIkBz9J7Kd7NFhKv4sFn3wCfudPPq8ayzV6gqJzh5k6P/+ZsqF?=
 =?us-ascii?Q?Uohdo9fquUzcUVEAJ75BHwXeGd4YkpDkzUA26dHYl0sOMW6HxqM3eH8Vqfls?=
 =?us-ascii?Q?llxLT3JPjzmAK8XQYJYSeoz9NIPoqZnnHxl9OZruji8W7W6cRfpOTN5fawwh?=
 =?us-ascii?Q?giM7hEIzOibr/wzYTVsk21JouTzp0d8g4Qs4M0XF6io9S8SGqHOdUolICHP/?=
 =?us-ascii?Q?3YQ2yISBurkU2k7enoWasj2KU7o64rI04flqnHGg2DXsiOQH57vXl6VuVBGu?=
 =?us-ascii?Q?MevCo3hQxYieaRyzi6Gpu7ZYrq7BGiJ7MmjsNgFBX1z9vsbehwjvwKNYowgu?=
 =?us-ascii?Q?Vd40vEMlCCxMnFcuaEg1KI7EZjJEIkwX//rv5Uy1SF7oJ7bvZUruw2UQ9M9q?=
 =?us-ascii?Q?nqhVgo/97E09e2UDu/5ecRX+s9DeCvgBMZ8MGogY0cQwCFq9LduBfUKCVcyD?=
 =?us-ascii?Q?XFUy+HLsYlubFX+u6yyWATIg2ZpWeLNs+FCe6OHVTj+Qayv+0X1kqricYe9A?=
 =?us-ascii?Q?cUCKqAUEZzb4FZ370ZfJLV+B1jDs+3UfNjzG9rOgpmOebL+X8lYKRH3E4g8P?=
 =?us-ascii?Q?dC64/kEI8YygeChjySrC4PLkfPyO1w7zaVLxjDqZj8rIlkj7C/Qu3TVEtc8j?=
 =?us-ascii?Q?bG9THeEgAEjYl7IJGUqGwfjwRdoi481yZTQKM+MGu/Asep+SVkOJ8+da58oi?=
 =?us-ascii?Q?fpmNEoL1km815ECMJ4rDchjd12loyir4svECdaXdxb2HF9tO6Sz1VDG/Goou?=
 =?us-ascii?Q?RfOMc17edmDyLySNlls87NyKI5J0bmmwMUvPnof3N4ZwUfQWwHjNlD4HeacA?=
 =?us-ascii?Q?0xXnAxqqDJM5V+VH9bhmsRCnBxI95o7K5dgfemP+jhWqq+6hWYoLcqJPh7nV?=
 =?us-ascii?Q?5+Gr1iS0OopvqeVnYVbqkVerH8ULji3m5UQ+GRiC67QfNnsKrfrFQdNz3Kku?=
 =?us-ascii?Q?egfzJWe8uP+Gmg1zSApX0QqkKnt9ls9wDDkIOA8d9HTV1HIanaL4Gj3+i8C4?=
 =?us-ascii?Q?MJmTJCnBdEL8C99a9bxgTkFzoB58m0scLU9ePcYXc3a5VhvM8UvolI5KvSft?=
 =?us-ascii?Q?K/jpKYkDikLZ/n/wzgGYUomRFHQojXqW/7S+Jg8+sh3HQ4XWB+P2YTdGQ3OW?=
 =?us-ascii?Q?HJhMucfpBbpNWtF2W4rJvE1EQnTc15I4OLZkFdNiZcuNQ7TsQS5RcV4bOVj1?=
 =?us-ascii?Q?g1hnlMGMNWT1McmR58zVNtH+uhjglLUVmEmpsy52eNhqJdmOtevtxSJ4l+B7?=
 =?us-ascii?Q?gMivo0V+4Zte0DtoBtidbZzo/J5Ig/nGlHox3ZpNZedbqyEYtGcF2PlZKtci?=
 =?us-ascii?Q?hhF/iZtiwvWJPJK/ygQm91V1?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C38193C9C5E72A4FBB45470C58E9C072@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6380.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b609c0-0da3-4ca7-7eab-08d979f523f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 16:06:42.4612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UjoXQZiF+KJBSGRptqeZGMlhqdvH810oAPMbtV5dnpgUrxkihpuhLBT0Nnlp4W7g4FhyKqjVdVIWhdy8KqddsjfhaaV+YQH8isg0lmOK+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2574
X-OriginatorOrg: citrix.com



> On 17 Sep 2021, at 16:46, Roger Pau Monne <roger.pau@citrix.com> wrote:
>=20
> Hello,
>=20
> The first two patches of this series allows setting the preisoutly host
> wide command line `gnttab` option on a per domain basis. That means
> selecting the max allowed grant table version and whether transitive
> grants are allowed.
>=20
> The last 4 patches attempt to implement support for creating guests
> without grant table support at all. This requires some changes to
> xenstore in order to map shared ring using foreign memory instead of
> grant table.
>=20
> Note that patch 5 will break the save format for xenstore records, and
> should not be applied.

Has this relevance for the format used by oxenstored?

>=20
> Thanks, Roger.
>=20
> Roger Pau Monne (6):
>  gnttab: allow setting max version per-domain
>  grant: allow per-domain control over transitive grants
>  tools/console: use xenforeigmemory to map console ring
>  tools/xenstored: use atexit to close interfaces
>  tools/xenstored: restore support for mapping ring as foreign memory
>  gnttab: allow disabling grant table per-domain
>=20
> docs/man/xl.cfg.5.pod.in                |  12 +++
> docs/man/xl.conf.5.pod.in               |  14 +++
> tools/console/Makefile                  |   4 +-
> tools/console/daemon/io.c               |  25 ++++-
> tools/helpers/init-xenstore-domain.c    |   1 +
> tools/include/libxl.h                   |  14 +++
> tools/libs/light/libxl_create.c         |   4 +
> tools/libs/light/libxl_dm.c             |   2 +
> tools/libs/light/libxl_dom.c            |   2 +-
> tools/libs/light/libxl_types.idl        |   2 +
> tools/ocaml/libs/xc/xenctrl.ml          |   5 +
> tools/ocaml/libs/xc/xenctrl.mli         |   5 +
> tools/ocaml/libs/xc/xenctrl_stubs.c     |  12 ++-
> tools/xenstore/Makefile                 |   4 +-
> tools/xenstore/include/xenstore_state.h |   1 +
> tools/xenstore/xenstored_core.h         |   2 +-
> tools/xenstore/xenstored_domain.c       | 120 +++++++++++++++---------
> tools/xl/xl.c                           |  15 +++
> tools/xl/xl.h                           |   2 +
> tools/xl/xl_parse.c                     |  13 +++
> xen/arch/arm/domain_build.c             |   4 +
> xen/arch/x86/setup.c                    |   2 +
> xen/common/domain.c                     |   4 +-
> xen/common/grant_table.c                | 119 ++++++++++++++++++++++-
> xen/include/public/domctl.h             |  13 ++-
> xen/include/xen/grant_table.h           |   7 +-
> 26 files changed, 341 insertions(+), 67 deletions(-)
>=20
> --=20
> 2.33.0
>=20


