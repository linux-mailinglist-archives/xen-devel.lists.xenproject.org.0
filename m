Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41964A41B6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:05:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262960.455456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUUh-0004oi-9T; Mon, 31 Jan 2022 11:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262960.455456; Mon, 31 Jan 2022 11:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUUh-0004lQ-59; Mon, 31 Jan 2022 11:05:11 +0000
Received: by outflank-mailman (input) for mailman id 262960;
 Mon, 31 Jan 2022 11:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytUN=SP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEUUe-0004i6-Tm
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:05:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4c8f6d4-8285-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 12:05:06 +0100 (CET)
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
X-Inumbo-ID: a4c8f6d4-8285-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643627106;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sC3eur4QdEIlF5bQPWtrghRvJJKkv5Mhx5Yoh5vnhF0=;
  b=RtKV0xkx5GQQ860TWLgY2YWsHmVUVF666bY4C4LTB1Z648cv2KHGEytK
   Bc8hiz0q6haioCV1aDkkruuiBLnjplrVswvRko7xILSjoc8orc5ehe1Yt
   jNJG6L1H4vUOAlzXvljHeaRCFBATUm+O2K3kzLkDAKBNWDNtwqEa53RP7
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: rXpixTtgEncs4ydYkArc+FOiblkCRt/W1jqAxWggulHc7O9o3JXifNr/Ti3q9GrqbTAJD0LZZe
 espahSvDEKeANZk5L6lfCVZbmeQNzqKG+JMydT77Q1Cpb7IBP8DyWU9AOtmMZIBw9FiIQBH4VL
 o7/lxftvaH5ah5PgxzU4zQhw2KlOkATRm9IMoOMixNIdiN+BBI43MnZV81bq/zkyiphvdHTCYp
 DABbn67Y1ZYYAbsleA6WSQJ8VZ7ZJ3/L9Gm2y85ksZhC+ceHLsTL1oMKctOLkqYlqJIyNubDfo
 CIHEaDmJxT+lbkDWEHdAw1z3
X-SBRS: 5.2
X-MesageID: 65295880
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yQBwO6AyPmnUKhVW/x3lw5YqxClBgxIJ4kV8jS/XYbTApGkn0zMBz
 jFKUGDQO67eM2bwKY9xOoizoBlTupXSz9E3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940ks7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rTS7jstB9
 tR0jreKWScZOPfox94yakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHfiQtIIIjG9YasZmBOuFW
 5UjTytVXgXwRjtSPm4aGoxmk7L97pX4W2IB8w/EzUYt2EDRxgFs1LnmMPLOZ8eHA85Smy6wj
 3ja8mHOJwAVPd2S1xKI6nupwOTImEvTQIsPEJWo+/gsh0ecrkQJAR0LUR2goP+2ima3QdcZI
 EsRkgIkoLIu7kWtQp/4VgehvX+flhcGXpxbFOhSwD+Kzq3Y8gOIHF8uRzRKaMElnMIuTDls3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiKY3gxHUR9BvCpmciNHvBCrwy
 DCHqis5r7gLhMtN3KK+lXjFnjatq57hXgMzoALNUQqNyQd0Z5WsYYCy3mTK9vZLLIufTV6ps
 WANno6V6+VmJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkSVQ1o5IDEWrVJRcWZKRO8Jw6ffaOu2wA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuOHciT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7cApiwZsTX8meRylrmgireFAO9IYJUKe5/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj9i9rYnR8Ywf0ihDPhLpDCo9FLfPbmpF8rIReIQNcF
 aFZK61s/NwSItg4x9jtRcak99EzHPharQmPIzCkcFACk21IHGT0FivfVlK3rkEmV3Pv3eNn+
 uHI/l6FHfIrGlozZO6LOKPH5w7g5hA1xbMtN3Yk1/EOIi0ABqAwdXyo5hL2SulRQSj+Ksyyj
 ljOWUlA+biS8ufYMrDh3Mi5kmtgKMMndmJyFGjH97emcy7c+2uo24hbV+iUOzvaUQvJFG+KP
 o25Ftnwb68KmkhkqY15H+o5xK4y/YK39bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Op44JwW5gWzhwAEKNGDiiwIpW2AImZZC/cst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP3u0OyFDDfnw/EWn28dBc3Zle6gpXyFIiJkiSnoaXjPEAwxAMoy88SR5Yz0sb3rsra
 HRrLUB8OY6H4yxs2JpYR2mpFgxMWE+Z90j2xwdbnWHVVRD1BGnELWl7MueR5kEJtWlbe2EDr
 r2fzW/kVxfsfd3wgXRuCRI09aS7QIwj7BDGleCmA9+BTsszbjfSi6OzYXYF9kn8CsQriUyb/
 eRn8Y6cs0Eg2fL8d0HjN7Sn6A==
IronPort-HdrOrdr: A9a23:qigcZKlrYma4ZJ88HFxQaHc8Hi/pDfO0imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftW7dyRaVxeBZnPDfKljbdREWmdQtt5
 uIH5IObeEYSGIK8foSgzPIYurIouP3iZxA7N22pxwGLXAIV0gj1XYANu/yKDwJeOAsP+teKH
 Pz3Lsim9L2Ek5nEfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJq5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O86SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNUQHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa2HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmPm9yV0qp/lWH/ebcHUjaRny9Mwo/U42uonRrdUlCvgolLJd1pAZEyHo/I6M0kN
 gsfJ4Y0I2mdfVmHp6VMt1xNfdfOla9MS4kD1jiU2gPNJt3ck4l+KSHqInc2omRCek1Jd0J6d
 P8bG8=
X-IronPort-AV: E=Sophos;i="5.88,330,1635220800"; 
   d="scan'208";a="65295880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZWA/tzh0dDlf2BFKLkRE4vbl5Y9lDfP70OnhScLr5K/ZzcvWiqpPRi5sJHT0IrEYhUlQpeHKXrjGGEY6muA5Ijuk7Gbt0clf1o29RjT7ZKcxjtV90+FjKwMIxvVKlOLhthPS6kRgJ5CG+j2BBlSXfumgVXrk6s2x9Ur2EcIwXEvIRSNFIGXdtnN1rggWegdXRO8FieoFwHFtY6iWdHHsLvmV4ZYxF3GdoSFAYuyIJhklBu+TSoEWQcS+suza/C8FMneiI6YYSTD880EEVM4fm49/m0pohRnnd9w47TzWH0Ul0JsxYZeoGuZB0iOLOvP4e5iz212MGBAarcnGU9qkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LIUrGA9GucF+pfPVHKnw1QV57lT0Fi/ugoVAfWYBUU=;
 b=VFFfpUFE/x43MxkizQT6UEFQGRvhPRtoIDKnAjLJA2JgQqvLhC7PQrHzoOthomZy+9MLyzaA/yr5XT2Y1skpAH/a6yTMX548NOLTTzF7eUFFVT+D91e5J9/l8giDw2dCw0RZJwqgyANG/mqtQzPI0OP3vM6poHjkOwiAqgQ9AyhccXF78I/3hYZQXOBXR2HvI4dTYsLBbn2i0dFmhxw8zdMMwjF0MkU0ofo2fVIheD9Zxev4tlaYfEErzO8wvZumtF/2tAqsBOcqcK/VwtmHY11ewxmkfhJUEY3X692kwvWXZhYT2tdXb7q7rurbpA0GcjxC9Eth+O2COgFeQaDCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LIUrGA9GucF+pfPVHKnw1QV57lT0Fi/ugoVAfWYBUU=;
 b=ICVOSgppqE+s00+0pzftY/deYJpjBl/rAKKcHfWvybPxRk2DstO9dHQzaDH0TCahvt2Q+kRwEObpiOvJnqxF4jvaldAS81sy+n9ORC1IX2DdpgRDtcyEtbu/Q9p60ZtyCDxqn+a8c7Gu69X0KL4cqqR3uzCRy1YiKurbqKxKwY0=
Date: Mon, 31 Jan 2022 12:04:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Message-ID: <YffCWGuP9ny8zG2p@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
X-ClientProxiedBy: LO4P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aab3fdde-9a92-4ab0-e1a6-08d9e4a986c5
X-MS-TrafficTypeDiagnostic: BN7PR03MB3427:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB342787A2E284B1DAD113B2BB8F259@BN7PR03MB3427.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+iBPXylHMjYXFbZirwxNApQmcjnIiatqjntcw9iYosn9ctOmVrQ/sv8W+HtwsxRuTFkqVE4pnj7ZqzLOnuuGZpr1W7t904hH/KnxsAXOwWAyUCKoor64Z3/MEtmqNM63bh3t/++f/ZVPIOKEyit+R24w1fJz7AN+e+HzUV5yTbkgP8qB7dV7iv66exI91a7F2zaXUGSIcKKR+vbUSBQ3NijJnwAepyyzi2QmAODsaQlk3wVXHoCnX+0qyg35k5U59lSYwau1y/6jC46FBNhnHRwr8lhIb0+pesV67jODUWStuQ0dZB8mV17MBE2KZaV9fFa37ssEoEWRqBlJ9AQCvCmm8MAjWGjvPKzOjkYQiOeCpCzpWU3nkTZ1z36wwd0OuQ/+//Ph7fPT8V9QsqOc/Qc/N9NLvoiARenmA5CIbEE1MXvg7szyxGNFIP32pBcG417yOFZ08wSWTTFr4Droy6j5wBu5Lv2/6GDb7qXiVv21C8dIBg6xO1dBlsVHUM/WrcmCYL7HZhmyS4/IQ0msQok1S3ku5toR+4QnvEqF2m/lFwxBkeoUQXFWWjNcOiG09iVNeI5UyYay4yePfaCwxv0BlMpmAVgEevy7MEZGhSW7GuMlgc1NG+cUWorKj5g58Ya7poY+L7N4hgQ01PS+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(8936002)(86362001)(33716001)(82960400001)(8676002)(66556008)(66476007)(66946007)(6666004)(9686003)(6512007)(4326008)(53546011)(5660300002)(6506007)(508600001)(6486002)(54906003)(6916009)(316002)(83380400001)(7416002)(2906002)(186003)(26005)(85182001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1dmMXZwWjE2eklTWWZnVko0cWg0YTAySWZzcXFKV3owbnJtdGRqV01HVHd4?=
 =?utf-8?B?dG9EZDhINTQrSDhxYVR0ckFGalNwYmVadWxaQkpVcFNQQXhDcHhFWjhmMjFU?=
 =?utf-8?B?K0pUSTdOYTdLV25WeUJham1iVUZTZ0M2UEp5ZkdqdzRsOEFUUlR5OWl6aEJt?=
 =?utf-8?B?TTJBb1pLdGdMRXM0RDRLL2JFVnE4N2dxeGUzNWE5SHpBa2IraytTbWJvb21r?=
 =?utf-8?B?RE1PMmN4eGtyb1F2ZDNFSGV0YVh5aDJnT0pTY3o1bmZLbGJ4N01EamhrWFpW?=
 =?utf-8?B?V1pIc095S3l3QjZQWWI4L0Jvd2swMTdCRSsvakVUb05mZUYyYk9xRzRMcFR5?=
 =?utf-8?B?dElWUnJQQmxoNHN6YVgrREJZNEVpRngzUHc4WW8yenpvU0R5bXBMQjFNcEpL?=
 =?utf-8?B?OVlGQUVRL3R6Q1IwMkVJOXFoMmIvZDYzZTFSNXl2YnJ5NUtaK0ppS2srMHIx?=
 =?utf-8?B?YWJQaFd3RkRaNFY1emdlU2Y3cGswSHNFd0dKNGUvVG1KMWRaaHRKT1JWWnNp?=
 =?utf-8?B?UTFmemhrbmJQcW9IT0ZVdnBzUzA4QkFSSkdvVnhVRVVVMnFMcTVSRWwwU2FP?=
 =?utf-8?B?MldOR0lOT3VHWmZFUXBNSnA2c1NyMnBQWi9xSmwwWkVaeVJEQThtNXVVcnNO?=
 =?utf-8?B?aWd3NytsLzc4KzVmUXQ5SWpHU2pNZHBqVVFqeTg4R21oN1B0Tm5LRjhiS2tW?=
 =?utf-8?B?L0ZUS3VCdjl3SjBpVmFLKzVvYlBJQ3F2Y0tJTVpaUHAvUnR5aG8wdlNCaUNm?=
 =?utf-8?B?RUxCVURsZ1IzN1VDRWc3dVBzNnhPOWUvVUVDbFVwdGJ0Z2VvT0lPUHZHSnV3?=
 =?utf-8?B?blExOGRXeTgvcEVBS1BUcUhXT0NSSmZTb1ViMzl5SDY3RFVmM2tlSGVQek1X?=
 =?utf-8?B?bkM2Z1pYYnlYZlRCWm1FcUxFd2RTajBqaHVMZEQ1b1ljdDFNUDByZU02ckhV?=
 =?utf-8?B?MnM5N1hIdU11QTVPdk1CWG5RRlRpMXBTQkJobXorUmJINDJ4ZUJmT3cxZU1w?=
 =?utf-8?B?R05uZHFKZGgwYmNDZnZyeW9ZdEtQeTVtK3Z3aDNBSXNUY0RIdkVvK1N4clJa?=
 =?utf-8?B?TndGZUJQWnlwbkgydzlUUnRqMzhBWEM3Q3JYVXZOYW5jVTJuUzB3Z0V0cnIr?=
 =?utf-8?B?TytkdWVXdDErblV2Nkg3YTBCaWRoMndSOFhzdlY0OVhjZWp2amhyaHdpMmVz?=
 =?utf-8?B?SVo3Mlp1b2thRHhzN3gwUTgxaHFaQjc0QmNzVlo2TGxLRDdIK1JzeXdVWWF3?=
 =?utf-8?B?VXRZTzRlR3BUOFBuUVJtSG4zWGoxMjJFczRqSkMwUldmNGgzQWREN0hGdUIv?=
 =?utf-8?B?REl4UWZ3UDdXWE45N3hzOVMydjcwdUNOdjFiNHRza1R0VkdCeTdrUEk1NDM4?=
 =?utf-8?B?cmhYTmZ0cG1YK2Z6aHdqR05wRmk1Ukt3VUUxRVQ0Q1ZuUlQ2bTF0M2ZWSDA3?=
 =?utf-8?B?WVVxSDBnQ1I0Y0xsRUhLMW1Xb09pc2JzV1paRzBxSXRYempvWnRxdzI0RUpF?=
 =?utf-8?B?eklya1lsZVh4U1crS3R6K0VNeXdBTWpNWm5VdGFUSXlhM1JDbXlzUVNpMERN?=
 =?utf-8?B?ZVNtRFp4MmZmMWpSUHhJOUlHTy82RitlOTlXbVRNWnhlOS9haTFpQUY3Z0FO?=
 =?utf-8?B?L2R3SGx1Z281ZjVZSWlOYTQ0eXBNSTJ3R2ZUQnNuNUVya2hHN0hWUFdhOXNH?=
 =?utf-8?B?NUZPSDVBMW5uOHNIalF4YXpVbU5MdGJSWEdyOGxtL0JWazF6bEVTN08zUWdm?=
 =?utf-8?B?MWZjZzROV3NoVUZnd0sycTk5TzhId3hWczFOM3F3emhNNENsS0lNUXVxSGRy?=
 =?utf-8?B?QnFVSWd2TCszOG04bUlMUkZHQnJRMTJYWXVSWXYwQ1JSM0R0OGJ0a1hkYTlT?=
 =?utf-8?B?N1REU1hnK0lyS0Y1TG1mUW5jYVQ3WDFYb0I3aXV6em1rTUR3ODcwaW9EbnBS?=
 =?utf-8?B?MS9rU1RYQUZJVlBGanVxRXV5bWV5RU9wazZsWGdQeEsrQ2lRdkxnOUorYUxt?=
 =?utf-8?B?SWcyYnZncUxtb0NFK3o5aVp1SHVXUUMrZTlZNC8rWVlzeGY0aTBMQ01yMmZ5?=
 =?utf-8?B?Ny9PakxUdDBDQkJETk02ODZUeVQyUXg5OVB6TFJ6RXp0WVVnYjVLVWFyL1Iw?=
 =?utf-8?B?QkxUdTlTaG5VU0Z4TW9EVGl2bFNJVFFqQkwxdW1CUXA3cFZkbStCaWp1bUFX?=
 =?utf-8?Q?qja4zbV99E/rNQaQXi1amGY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aab3fdde-9a92-4ab0-e1a6-08d9e4a986c5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 11:05:01.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRsdkHEsmn9GH3fngtn0h4fUYTqjFoFpv1Du8lnV+dgzkAr3rvEFsxNczOFXyZyDjBb1Bzoj8OgsrGVJtTVCKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3427
X-OriginatorOrg: citrix.com

On Mon, Jan 31, 2022 at 09:47:07AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 12.01.22 14:35, Roger Pau Monné wrote:
> > On Thu, Nov 25, 2021 at 01:02:43PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> >> +                            uint32_t val, void *data)
> >> +{
> >> +}
> >> +
> >> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> >> +                               void *data)
> >> +{
> >> +    return 0xffffffff;
> >> +}
> > There should be no need for those handlers. As said elsewhere: for
> > guests registers not explicitly handled should return ~0 for reads and
> > drop writes, which is what you are proposing here.
> Yes, you are right: I can see in vpci_read that we end up reading ~0 if no
> handler exists (which is what I do here with guest_rom_read). But I am not that
> sure about the dropped writes:
> 
> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>                  uint32_t data)
> {
>      unsigned int data_offset = 0;
> 
> [snip]
> 
>      if ( data_offset < size )
>          /* Tailing gap, write the remaining. */
>          vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
>                        data >> (data_offset * 8));
> 
> so it looks like for the un-handled writes we still reach the HW register.
> Could you please tell if the code above needs improvement (like checking
> if the write was handled) or I still need to provide a write handler, e.g.
> guest_rom_write here?

Right now (given the current code) unhandled reads and writes will all
end up being forwarded to the hardware. This is intended for dom0, but
this is not how it's going to work for domUs, where accesses will be
discarded based on an accept list. IOW the handlers that you are
adding here should be the default behavior for registers not
explicitly handled in the domU case, and shouldn't require explicit
handling.

> >> +
> >>   static int init_bars(struct pci_dev *pdev)
> >>   {
> >>       uint16_t cmd;
> >> @@ -489,6 +542,7 @@ static int init_bars(struct pci_dev *pdev)
> >>       struct vpci_header *header = &pdev->vpci->header;
> >>       struct vpci_bar *bars = header->bars;
> >>       int rc;
> >> +    bool is_hwdom = is_hardware_domain(pdev->domain);
> >>   
> >>       switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
> >>       {
> >> @@ -528,8 +582,10 @@ static int init_bars(struct pci_dev *pdev)
> >>           if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
> >>           {
> >>               bars[i].type = VPCI_BAR_MEM64_HI;
> >> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> >> -                                   4, &bars[i]);
> >> +            rc = vpci_add_register(pdev->vpci,
> >> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> >> +                                   is_hwdom ? bar_write : guest_bar_write,
> >> +                                   reg, 4, &bars[i]);
> >>               if ( rc )
> >>               {
> >>                   pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> >> @@ -569,8 +625,10 @@ static int init_bars(struct pci_dev *pdev)
> >>           bars[i].size = size;
> >>           bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
> >>   
> >> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> >> -                               &bars[i]);
> >> +        rc = vpci_add_register(pdev->vpci,
> >> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> >> +                               is_hwdom ? bar_write : guest_bar_write,
> >> +                               reg, 4, &bars[i]);
> >>           if ( rc )
> >>           {
> >>               pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> >> @@ -590,8 +648,10 @@ static int init_bars(struct pci_dev *pdev)
> >>           header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
> >>                                 PCI_ROM_ADDRESS_ENABLE;
> >>   
> >> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> >> -                               4, rom);
> >> +        rc = vpci_add_register(pdev->vpci,
> >> +                               is_hwdom ? vpci_hw_read32 : guest_rom_read,
> >> +                               is_hwdom ? rom_write : guest_rom_write,
> >> +                               rom_reg, 4, rom);
> > This whole call should be made conditional to is_hwdom, as said above
> > there's no need for the guest_rom handlers.
> Yes, if writes are indeed dropped, please see question above
> >
> > Likewise I assume you expect IO BARs to simply return ~0 and drop
> > writes, as there's no explicit handler added for those?
> Yes, but that was not my intention: I simply didn't handle IO BARs
> and now we do need that handling: either with the default behavior
> for the unhandled read/write (drop writes, read ~0) or by introducing
> the handlers. I hope we can rely on the "unhandled read/write" and
> get what we want

Indeed, the default behavior should be changed for domUs to drop
writes, return ~0 for unhandled reads, then you won't need to add
dummy handlers for the registers you don't want to expose.

> >
> >>           if ( rc )
> >>               rom->type = VPCI_BAR_EMPTY;
> >>       }
> >> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> >> index ed127a08a953..0a73b14a92dc 100644
> >> --- a/xen/include/xen/vpci.h
> >> +++ b/xen/include/xen/vpci.h
> >> @@ -68,7 +68,10 @@ struct vpci {
> >>       struct vpci_header {
> >>           /* Information about the PCI BARs of this device. */
> >>           struct vpci_bar {
> >> +            /* Physical view of the BAR. */
> > No, that's not the physical view, it's the physical (host) address.
> Ok
> >
> >>               uint64_t addr;
> >> +            /* Guest view of the BAR: address and lower bits. */
> >> +            uint64_t guest_reg;
> > I continue to think it would be clearer if you store the guest address
> > here (gaddr, without the low bits) and add those in guest_bar_read
> > based on bar->{type,prefetchable}. Then it would be equivalent to the
> > existing 'addr' field.
> Ok, I'll re-work the code with this approach in mind: s/guest_reg/gaddr +
> required code to handle that
> >
> > I wonder whether we need to protect the added code with
> > CONFIG_HAS_VPCI_GUEST_SUPPORT, this would effectively be dead code
> > otherwise. Long term I don't think we wish to differentiate between
> > dom0 and domU vPCI support at build time, so I'm unsure whether it's
> > helpful to pollute the code with CONFIG_HAS_VPCI_GUEST_SUPPORT when
> > the plan is to remove those long term.
> I would have it without CONFIG_HAS_VPCI_GUEST_SUPPORT if you
> don't mind

Well, I guess if it's not too intrusive it's fine to add the defines,
removing them afterwards should be easy.

Thanks, Roger.

