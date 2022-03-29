Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F614EABA8
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 12:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295779.503459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9S3-0002Xg-5g; Tue, 29 Mar 2022 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295779.503459; Tue, 29 Mar 2022 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9S3-0002VW-2P; Tue, 29 Mar 2022 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 295779;
 Tue, 29 Mar 2022 10:51:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1vv=UI=citrix.com=prvs=0801e2fd5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZ9S2-0002VQ-0h
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 10:51:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a0b6541-af4e-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 12:51:47 +0200 (CEST)
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
X-Inumbo-ID: 3a0b6541-af4e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648551107;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dE1ly2xcaqZbUNHms7lhA1jhAVMQCzdoJ8s75A0kDvQ=;
  b=ZB9zTa89rkdlmIfmOj84OJx9fBLG9npt+eboz4n81LDg2gda6WTIxApG
   NRnRXtTTHeBeicaBTAbvsGc1Q7Bwoj4poSS+7DEvOBA6aXbf/3sOcIyWE
   aT4PZYi3EqPTEAwpZaOX841p9Icj4tWkq6EtpsJ1bxzI5MAqJVkD5AyXE
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67428330
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ghheu6gL46UEsfl0piFL67Y3X1614xAKZh0ujC45NGQN5FlHY01je
 htvXjqFP/eNN2v9fI1/bYi1oEhTvpHUx4c3SAZtqyk0Fn4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFnc4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV8kEIbNm+FBbwJjFBNAOKgYyu6AI2fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiBO
 5BJMmE3BPjGSzwfAFgnDakdp72DilulfRlxpwifvJNitgA/yyQuieOwYbI5YOeiQMxPm0+Cq
 2Hu/mLnAwobPtiS1TqE9H23gubF2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIyoKMy3EuzQ9/3RBH+p2SL1jYQWd94Fuw85BuK1uzT+QnxLmMGQz1McvQqtcI2TCYmk
 FnMhZbmQzdotdW9RX+Y95+Vqy2zIikfKWIeZS4CQhAB6tOlq4Y25jrKR8xgVq24ksH4HzDr6
 yCR8CE6g/MViaY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1RPIOLTI2r7ATn9s1HHricSwez7
 T8GhJ3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkVkJjKK/KkdGekOej2iZL80xhZbtGt3+Phw/RoofO8MhHONrEcwHWKJx44wPuBV3+U3cE
 c3CGSpJMZr8If49pNZRb71BuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLr
 4YDb5TQkUsEDr2WjszrHWg7dwpiwZ8TX82eliCqXrTbfloO9J8JVZc9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuJE0AV7iV5yXU5u2BcwXhStiZUQEZA/0s1B+MdfHxPpOLPMfIOh4nNGPONYpF
 pHpje3bWa8RItkGkhxABaTAQHtKKU3z3FnUbnP/CNX9FrY5LzH0FhbfVlKH3AEFDzattNt4p
 Lul1wjBRoEESRgkB8HTAM9DBXvr1ZTBsIqeh3f1H+Q=
IronPort-HdrOrdr: A9a23:dtU5sKG3migwYTBBpLqFCpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5ts2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wM9HdwGOtx5Dt
 //Q9dVfYF1P78rhJ1GdZU8qOuMexrwqEH3QSuvyWqOLtBzB5uKke+y3IkI
X-IronPort-AV: E=Sophos;i="5.90,220,1643691600"; 
   d="scan'208";a="67428330"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNagokudkJ1hHuX7hUaOXnbHeGxBjIn2GGh4EJhlkOZPdoQA+VuJrWCx1wlO6DgLFLcdWgREE+59ePdM1C696gINymbA8zMFhuHQ4HsiPdyME7WSbWwH5p6SARV2msiEdUmSwSmszDaSAXmVbxZFToyM5ScrSJCm+d5Bd3cXaMdBOA/ADbSN/0r5MqX3cQsGL84M5/897uUKEo5eFLQQgCcehEiIHpmdKVBlb5Cf/4Xr+J3T1QyFEOuPI1/yMQmzwLAo1Lo1cqG3te3SsQn0GksHREJSaOS7oqgZvkO0Jc7UYWAQfJU1MeYTpXadNSyqoR6VFQJ/CNGbcftD1NKgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgWNT3f9WMZmxjpQ+LpATbVnyx8TPNst9aseBSWaTr4=;
 b=JTbir9NTg8ipF/UW61MUGUzsEfe3E/+bt9vC+Q22QDF9merrTQPYumYZivexTdYNcRLPuuNjm4NBykm4Ydfrzaj23PMBRmfV86bFSlkqoswrByvePubh9cMu/gn/26EYwT9nJQ5gV9mBe8+iQrLisvWOchm+d64DUuvzkLsv9/6b5mJCdJmD3UadU2145hgx2+/EcPHpatD6TRnFAPR3Egsf0ZuuWc9TTdIzwhz/QAC8Rc6XYcrUbUsRsnKQu0uB9HkcYmRRXya34M62jameis/9J8NbNUItuY0wZMLAkH9isBfLahU4OMExQ+RNjFL4hsEhX2AxN8Qu7gVwaA16uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgWNT3f9WMZmxjpQ+LpATbVnyx8TPNst9aseBSWaTr4=;
 b=CqHUi+sp0nN3BEmv+VTycKEqhP3sTxSzDdLHRQnRGtLQgOnRGskloGM918G02t6mhryKCa5e+xDpybd975cP+Y1R3b2ozXRy9XosA6bhDSQ+ZZrXUnG/IeWSssqHWx/Iz3xUWmuMB4dhgTrCjTAVozCcH6ZS1KGo1IYF/rNEJN8=
Date: Tue, 29 Mar 2022 12:51:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Claudio Jeker <cjeker@diehard.n-r-g.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>, Mark Kettenis
	<mark.kettenis@xs4all.nl>, <djm@mindrot.org>,
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>,
	<tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
Message-ID: <YkLkuV5XQVJI3UDk@Air-de-Roger>
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
 <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
 <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
 <YkLAT3AJk9usjIkD@diehard.n-r-g.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkLAT3AJk9usjIkD@diehard.n-r-g.com>
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe50dfc-c4de-421c-026c-08da11721c03
X-MS-TrafficTypeDiagnostic: MWHPR03MB2992:EE_
X-Microsoft-Antispam-PRVS: <MWHPR03MB299278D5062C47F4893963598F1E9@MWHPR03MB2992.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OyTt7RbA6z61hLZxqpnMYhbQY/FFxYTs2EqDMRs7H2iNoajdOsKoWAVpl7CX8lE8d9ofHG5XzObehTwjei6/TQr2ab0QxF5HcfUSOy4ijFgN9UVTB/vocvcqlT4/1Jzt5x7d/qRx6qsiUNlkEJSwfl5w/GWvVoCnIB+ncSCQznZCVlGWARS45St8iSlfViZSRsm0++ppX0fAXTRsqVFtkOSLQMSnGr4Ie5zaw1lOdNe2AlCps6xyAZSjZvnqXsJzQbTg6CNgLYlIcRCf82IQaQotguVt0O3HF1TCW/YRiH+i/z/y228N1GaMFug3P2hjahS5q6wmOAURrNZeCHflMEXm53qAcG1h8WdRknoq5MT9kvNsof/ynW9WViwCL+LsloPG9ZFcb7XzYKVqSUcHkOfq9PBdPgKyberPMdAqnSD8l/Nxqh9Om2g+PiyaEGInCQEeIazVF5mBZbHWB8MQcBi/nWXco8NcHixMCGHsAWwn8swVFmODaS0ew8GOONhVvSJIUzNz3PQtvy3tu5x3xAHlfAzY/0BQY+rml98BpOv7tV5ocqQDwh5M5t55u3YxuoYzugrOeK29ubmFEjCE4mi+a26nCohQD7qE8e+8unTkHUDbvyKpSVVnFGL0vehZnQMpt0IRi2ezCBuTaIQvxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6486002)(66476007)(6666004)(53546011)(26005)(6916009)(33716001)(82960400001)(54906003)(6506007)(186003)(508600001)(86362001)(83380400001)(85182001)(6512007)(9686003)(5660300002)(2906002)(8936002)(38100700002)(66946007)(66556008)(4326008)(8676002)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lHeUNRQTlHSG9lZFF6aGxLS3U3eXBGei9HbUdsWUhMNzloVnR5ZDdKSGRm?=
 =?utf-8?B?Tk1TOWpZMFZnU28za0lUM3h2QisyUDBzOHNHai9ETkk0TG9nT1pBVHJwbDA2?=
 =?utf-8?B?MTExMzBFM1dwZGlEd3paRkNTdjRmeU5SWHhsT0pnbEx5U3NCUWEweDRRRkNS?=
 =?utf-8?B?NGdOZmpBV1RxZExPNmdKV0hxaXpCMkQwN0NLQ0phOENJOWRKbGhoSVppU0tP?=
 =?utf-8?B?YWMxbmQzSTdMWjI5U0YyNlRjaFIrMU0rL1dTSlF3NVRyYWgrMkY0UlVKdVZn?=
 =?utf-8?B?UnowSHpTUXRpNWdhenEyb29SUk1WYmUraFdwNWlGTWM5a0wwYkpsTHhNUCto?=
 =?utf-8?B?NnV1RkJ3Y05DUUx6UllMc21LaStTQjdjUWxwZXJqanAvTytWQU05Q05sbk1K?=
 =?utf-8?B?c1hxbVNoeXFOQUl4Szd2SEVseHUydTVGR0hhN3huYlFuQ0RaMkhnT0xMK1Zl?=
 =?utf-8?B?ZkdkcGlHTVU3dzNMdDd4aGpMd0xrRTNvUDNXY2RyRjdpZzdWYTA5NHFBdkN5?=
 =?utf-8?B?TlJ1LzZUandZNGUwbjNEUkorTk0xSEQvNDYxQzVwL2ErcmNhcktES0xWckcy?=
 =?utf-8?B?UFpmckowL01qS1o3MzdVeGtLYmhaMTRrRXRCamFDLzkzeTlMdU9hOGN0cUJu?=
 =?utf-8?B?SkhkcEpUTFcvNTVJVk0wVlYrbzZhTHhLKzYyTklxOW52bk1ILzBpRVp1WW91?=
 =?utf-8?B?VklrOVJCam1zT3V0WUZOSll5bk4raEEycUk0NmtBdnlCZTRWSjM0NDlFa1Fp?=
 =?utf-8?B?Y3JnZStZRXF5dzRIVUVwRjVlUzlGUmo0bGtudm9mdVBJblZqSll6R0NmT3Nr?=
 =?utf-8?B?RmsvTWhNYlovdzdiZTdqcnlvMzJteDh2QWZ1SkVydVVvU3BvQkU0VU1SNExG?=
 =?utf-8?B?ei9teGFoTG1ORUxkS1FZNXZLZXZYUWdpTkFYTEI0VmVuTE1MQU9GdTZPSjdW?=
 =?utf-8?B?amtHcEduMisyMmdDNTFUWjFPWENycGZWVWxOcEc0Y0hxUytYZTdkUjZDSnE1?=
 =?utf-8?B?VjRaMHF6dUlnSkhqUWd2dm9UdC9tT3Y1NC96MDI4THFnUjQydkdUaVR3em55?=
 =?utf-8?B?YzUwMmJiTElTb25YQndsQmc0SHZvVXoySm84bjd0V00zSllvdEoyVkJ6MXBk?=
 =?utf-8?B?dE9Tb0U1SlNMdWdkZFZHNmFmU3Z3dWhrdTBzTHZzc0N3b0RyWFRVd2h6aVFY?=
 =?utf-8?B?RFJqajgzMEJ2NUVSMDRKYmdKTzkxL0pPSXFRUGpYRWZ2dnBJdTNPWDlkbFNT?=
 =?utf-8?B?N3hmNkZaTER1eEUrMFNzRHBGcnBzRHRvRUFPeFJBbzQ1NGEya09jcGZCVWs1?=
 =?utf-8?B?YlduSEtEdHgxa0EybDZEQmJnZTkzdEd1cE1tbm5IaWcwS1VacVBtUDlmbG9E?=
 =?utf-8?B?dyt5N0wzd2srZmtCTkxVS1gyV3g4dTFRdkRUdVpJSkRxbHhNQ3NlaktVdFh0?=
 =?utf-8?B?WkFFM1R3WmhHd21iVmZFUER4LzJBaGhwclpFYW5meDJOeFFWeGs0OUZkYU1X?=
 =?utf-8?B?M2lJSEhGMGVPOHlqeUJOdFkyR2lnWnNOSTRrckJKdC84ZHlYcUhObnRmK0Iv?=
 =?utf-8?B?bFFvUnFiUE5WUzdsUTlMUXMxY3k5L1ljSkdvalZrWHJ5a2k0YldTK1BzSGgy?=
 =?utf-8?B?N29NT3FENzZiN1lxYWxyUjRYNnFkcTRjbWNyTGE2Mk4vN2RJZUdEbGgvQVIr?=
 =?utf-8?B?MWdVRGgrN2VoeDlUOVRkYUxkNTk2M0VvR2RkdlZScXRQMVBmcTduV3l1TjBT?=
 =?utf-8?B?ZE9QUUl0dHVkNWFTdXRrVDVIc3FtbXcrYzN2cTNJY09xRHg3SmhuYVNBb041?=
 =?utf-8?B?KzBId0xrMTNJcjhjYW5pVXVTcTA5UW9UaElkcVZwd3FEaEJJMGVnRkYzN0Rx?=
 =?utf-8?B?cTRYOVN2cjY5VmxqbDJpcTdlblNjLzVLaGVpVEhlT1pJblVpejV2ZWw0ajVw?=
 =?utf-8?B?YnRwQ3Fkc2F3ZWdST21ZODI0ZTZlanlMSXJZTi9nNzFNa2hVWTI4eStXTXVi?=
 =?utf-8?B?YmNLK216a3AvWldRbHVsaDhOcW05SEx2YU1RaUJCVGZqTHZLTkU3Y3pBYWMz?=
 =?utf-8?B?STZ2SVBHRjJQYnRJZ280bkJCRFNGUXlwYnlNQUZCK1lnMEkyL3VTMlBsekRY?=
 =?utf-8?B?OG9OZkwvMGdoSXlrY0Q1SGJvaTREYmY4UDQvanF2T0JPZnFiQzU2S1hieW5D?=
 =?utf-8?B?TitLL3QvcDRpRGh6TTA4RzhjYXBadXZNdHA4Q3I3OXpiTkJOaVRoZTZmbUVO?=
 =?utf-8?B?dXNhK2FRdThLNkVTRnJLSmM4YXVqTzBuZzdETGhuOTdRUHl2Y3drMUZnM1NG?=
 =?utf-8?B?Syt5UlgrZHpiVnJjK0JBcmMyWVdrbEM0TXRvRFZJenZjTG1sWVpUdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe50dfc-c4de-421c-026c-08da11721c03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 10:51:42.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fiiy7XdaR9L3rd+1wOQVJPTVrQHsTeIqy/A8OUPfMGaCSgsTHlhKWN6CcZOafcUX3W+ahbupTDEtogoNM6yf0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2992
X-OriginatorOrg: citrix.com

On Tue, Mar 29, 2022 at 10:16:15AM +0200, Claudio Jeker wrote:
> On Mon, Mar 28, 2022 at 04:38:33PM -0400, Demi Marie Obenour wrote:
> > On 3/28/22 10:39, Mark Kettenis wrote:
> > >> Date: Mon, 28 Mar 2022 09:51:22 -0400
> > >> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> > >>
> > >> On 3/27/22 21:45, Damien Miller wrote:
> > >>> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
> > >>>
> > >>>> Linux’s netfront and blkfront drivers recently had a security
> > >>>> vulnerability (XSA-396) that allowed a malicious backend to potentially
> > >>>> compromise them.  In follow-up audits, I found that OpenBSD’s xnf(4)
> > >>>> currently trusts the backend domain.  I reported this privately to Theo
> > >>>> de Raadt, who indicated that OpenBSD does not consider this to be a
> > >>>> security concern.
> > >>>>
> > >>>> This is obviously a valid position for the OpenBSD project to take, but
> > >>>> it is surprising to some (such as myself) from the broader Xen
> > >>>> ecosystem.  Standard practice in the Xen world is that bugs in frontends
> > >>>> that allow a malicious backend to cause mischief *are* considered
> > >>>> security bugs unless there is explicit documentation to the contrary.
> > >>>> As such, I believe this deserves to be noted in xnf(4) and xbf(4)’s man
> > >>>> pages.  If the OpenBSD project agrees, I am willing to write a patch,
> > >>>> but I have no experience with mandoc so it might take a few tries.
> > >>>
> > >>> Hang on, what is a "malicious backend" in this context? Is it something
> > >>> other than the Xen Hypervisor? If not, then it seems not to be a useful
> > >>> attack model, as the hypervisor typically has near-complete access to
> > >>> guests' memory and CPU state.
> > >>
> > >> The backend can run in any Xen VM.  It often runs in dom0, but it
> > >> is not required to, and in Qubes OS the network backend never runs
> > >> in dom0.  Unless it runs in dom0, it has no access to frontend memory,
> > >> except for memory the frontend has explicitly given it access to via
> > >> grant tables.
> > > 
> > > So this is somewhat similar to the situation on sun4v (Sun's
> > > virtualization of the SPARC architecture).  When writing the vnet(4)
> > > and vdsk(4) drivers for OpenBSD, I did consider the implications of
> > > those drivers talking to a "malicious" domain.  the SPARC hypervisor
> > > implements a concept similar to grant tables.  It is fairly obvious
> > > that any memory you grant access to should be considered insecure.
> > > This means that you either have to make a copy of the data or revoke
> > > access to the shared memory through some sort of Hypervisor call that
> > > implements a synchronization point of some sorts.  Otherwise you and
> > > up TOCTOU issues all over the place.  But this obviously has
> > > significant performance consequences.  For vnet(4) I decided that an
> > > extra copy was worth doing and the only reasonable way of doing things
> > > given how OpenBSD's mbuf layer works.  But for vdsk(4) I decided to
> > > trust the other domain as there is no way to prevent it from feeding
> > > you compromised data.  Full disk encryption doesn't really solve the
> > > problem unless you have a way to securely verify the bootloader.
> > 
> > In Qubes OS, xbf(4) devices are configurable.  While all of them are
> > provided by dom0 (which is trusted) by default, it is possible to
> > attach devices that are *not* provided by dom0, and these devices
> > should not be trusted.
> > 
> > > Personally I think it might be beneficial for us to turn xnf(4) into
> > > what we colloquially call a "bcopy" network driver.  But folks who
> > > actually use xen may find the performance impact of doing this
> > > unacceptable and decide to trust the backend instead.
> > 
> > You actually don’t have to do that.  The Xen network protocol
> > requires the backend to drop access to the buffer before giving it
> > to the frontend, so the frontend only needs to ensure that it cannot
> > regain access.  This will fail if the backend still has access, but
> > that is a bug in the backend, in which case you should shut down the
> > interface.  So there should not be any significant performance impact.
> > 
> > If you are curious about how Linux does this, you can look at
> > drivers/xen/grant-table.c, drivers/net/xen-netfront.c, and
> > drivers/block/xen-blkfront.c from the Linux source.  They are
> > dual licensed GPL/MIT so there should not be licensing issues there.
> > Be sure to use a version at or after “xen/netfront: react properly to
> > failing gnttab_end_foreign_access_ref()” and the other XSA-396 patches.
> 
> So how does xen manage to limit access to less than a page size?
> The hardware on x86 does not give you byte precise mappings for granting
> memory.
> An mbuf is 256 bytes and of those 256 bytes less then that is used for
> data. Still for dma the full 4k page needs to be granted to the host.
> The only way this can be done is by memcpy all data into individual pages.
> The same is true for the most common mbuf cluster size of 2k.
> So yes, this will be a bcopy ethernet driver and by that will be on the
> same level of crappyness as bce(4) and old old old realtek.

I've got no idea about the Xen network protocol, but the Xen block
protocol already has a feature called persistent grants that will
force the frontend to copy all data into a set of pre-granted pages
(ie: akin to a bounce buffer).

That's mostly done as a performance optimization so that the backend
doesn't have to map and unmap each page on the request, as
establishing and tearing down such mappings tends to be more expensive
than doing a memcpy on the frontend.

A security sensitive block frontend could refuse to connect unless
persistent grants are available, or as you say force all pages to be
bounced.

So forcing a copy in the frontend might not be that bad from a
performance PoV if that avoids the transient grant mapping operations
on the backend side, but that needs to be negotiated.

Roger.

