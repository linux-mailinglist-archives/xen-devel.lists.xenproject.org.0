Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363534D198E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286888.486579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaBx-0006CE-63; Tue, 08 Mar 2022 13:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286888.486579; Tue, 08 Mar 2022 13:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaBx-0006AK-1U; Tue, 08 Mar 2022 13:47:57 +0000
Received: by outflank-mailman (input) for mailman id 286888;
 Tue, 08 Mar 2022 13:47:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKud=TT=citrix.com=prvs=05922dae9=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRaBv-0006AE-NH
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:47:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59a49614-9ee6-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:47:54 +0100 (CET)
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
X-Inumbo-ID: 59a49614-9ee6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747273;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wOdU7xka3uo93me38wtoC/vI4M3a7CuuzVpweUn2UnU=;
  b=LyDIxW5XblLQQAvSrZFg76qEv2TyKxbBW9Br5A7v4AXuUqQ6Isr+/eFj
   L6dAGIaQ2DBw3ZsQZgq3TvZm2XlifJ3A3g9O/oii1s7jpg2Ff0s97p2TY
   D/6V5yjSW+sazQDcmjFImOk9GJduo1DA/q+WBbWWoZO2dNJQVM7bqMrs2
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65712098
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EgDdEKles/zmtjrKTwWKuHfo5gxOJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCmGPOa2KNGLyct51PIWz9BtSu5DRxoAwTFdl+XphQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1PV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYUScCIJGSsvomagQGEgZmbIJcpuPcGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZ71nfdBPkrW4/KR6Hi7t5ExjYgwMtJGJ4yY
 uJHNGU2NkyRM3WjPH8lB7gj2/70hUPvTGBkqnWK9Zslv2TqmVkZPL/Fb4OOJ43iqd9utkSFo
 mPL+UzpDxdcM8aQoRKf9X2hnKnXlD7TU4MODqe55rhhh1j77mAUBRcbUXOypPCrjUj4V983A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlya3S+Q+VQHcFSj1pb8Yvv8s7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqfQ8vUzdbycfYmZxtjzXXH/l5TvKut4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNvBFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gNuFmSx28za67onAMFh
 meJ4Wu9A7cJYBOXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTyzzhd8zPpma
 crAGSpJMZr8If48pNZRb71BuYLHOwhknT+DLXwF507PPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pwGHsbec1EOMDxwVJfsLUYJJtUNc1J9zbyTo
 BlQmyZwlTLCuJEwAVnSOiA5NuK1BsoXQLBSFXVEAGtEEkMLOO6HxKwea4E2bf8g8ulixuRzV
 P4LZ4OLBfEnd9gN0211gUXVxGC6SCmWuA==
IronPort-HdrOrdr: A9a23:2DbMfa2FhvaLW1+2E4eTugqjBedxeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHO1OkPUs1NCZLUbbUQqTXc1fBO7ZrQEIdBeOj9K1uZ
 0QEJSWTeeAd2SS7vyKrjVQcexQuOVvmZrA7Yy1rhdQpENRGtpdBm9Ce16m+yZNNW177O8CZf
 yhD7181l2dkBosH6aGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3vARDAhKdfapw7gpKScxonBQzO1Uyr
 5E0W6CqpZbOxvcgSz25tzFUAxdjEavu3olltgSghVkIPojQa4UoooF8ExPFpAcWCr89YA8Ce
 FrSNrR/fBMbDqhHjvkV0RUsZWRt04Ib1+7q4k5y7io+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4XY46MIaKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw4O2xYpQHwJY7hZ
 yEWlJFsmw5fV7oFKS1rdd22wGIRH/4USXmy8lY6ZQ8srrgRKDzOSnGU1wqm9vImYRoPiQaYY
 fFBHt7OY6QEYK1I/c74+TXYegmFUUj
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65712098"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOHatACOFT6QFR4p2De50k8/5EwG1B/0Ph4D8cH9WX1uEvL8u6LNO1GDwo924GRb2r0tQqejGBfTL3aculUCQvyPP0l01c1ydWMjMH3xXSQWj3/lccRvPtxjbHM7GuVxdqT2kB9KAvT4MvPZ5v8t7T/p8SlRh89eym9dMqw5szcl73hqRDblFwwMCElvnwM/RzV/LLNxqOIQeZpOhKej00UqKZw3nY0nBakTLlu/rytWyg8DMPV5Jd70h91nPrN4B0y8CrZ1we8ko4mrJeMShZqDH2H1kvqGfpWuw00D9FVfdym5wopBSkvj+J+cBV/RsnCUFvAEFGqbL+oOvopjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzPb4aoy6dJCLBE13mc8KuqSvXNUEnu31vB5bt4QO6U=;
 b=BXy+YmjkpPyIh6dUAJHpAjDXcwkE6t6sU+GUyW0rx4nXL3yHzdBBJpUGBDTNTncBt6PDCiwsK3KYlbWLmYWHjE9/36WNa43RhgNy2Gq1K2LWx58uNKH8vzwAykKVQ0WVaw7zTbzNYOVxYSA76/q0PLaaxgg22Ijr7tNRtW1Y3cApVTfDEi1S/1QlzipXzxm4PudFXG6CSM/H4y3V308kIWMuXzfdCsP9mEG9O2vbsTm920HrcLSJvfOXnaJOK8Pvz2YAbHZGDOP7NKiHECLaOsR0NbG7zu63Z2jWqgSkVSCxNvrad7f4+0jB/kQ9pkf23svkd5GSVV7ZMh+6wy9CFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzPb4aoy6dJCLBE13mc8KuqSvXNUEnu31vB5bt4QO6U=;
 b=eTIovXAkgDrHNd6JdMxoC6RdMX84K6/lK1+XyMLqto4GFJVfsrZCslItV4I+o9z1gmHW+6dGKc6D0Zt4heqdc8dzJr0benc+zM96zwOnzQGQdXR3IQneB/EINNl92HdgPaubcFfkwxUINI0K09H07s1oiYjV66o9CuoNph1AUcg=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "doebel@amazon.de"
	<doebel@amazon.de>, "julien@xen.org" <julien@xen.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrrix.com>
Subject: Re: [PATCH 2/4] livepatch: improve rune for fetching of Build ID
Thread-Topic: [PATCH 2/4] livepatch: improve rune for fetching of Build ID
Thread-Index: AQHYLkHYPgIQbApwyE6feVSNYv9EXay1hwwH
Date: Tue, 8 Mar 2022 13:47:48 +0000
Message-ID: <PH0PR03MB6382F60EB5D712C1343799AFF0099@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-3-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: 86fcc2cc-4d19-e260-876d-68c73321cc21
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 027fac0e-b1a1-4796-a5c4-08da010a3b9f
x-ms-traffictypediagnostic: SN4PR03MB6687:EE_
x-microsoft-antispam-prvs: <SN4PR03MB66871EADE1BCFC24218D101BF0099@SN4PR03MB6687.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n8v93tl6hzU1fiOXJr+S3vZonMuyB96Vo1UPA5RDOuxYJ7WhAuD4LNJ9njujy0NMfFKx4bDxXGd41LRgudiGtcH+08RPiJ37ZghfnADF+vuTLbaNSnW0fWusoQqa3YJ5imwLjCdlSPvatdO/l7zid2NIN7+RSCVR+Zzs4a47TH1oh3OZpDZgYZd76S7f+Dx0xYv+Mrn3tT+uF7sQYoPTzEDbaRKuFumMrj6iefbdc15PHgtpgCGhqWLCmBbBGfELAEnrryg2p4RYyZWEPkt0QlUKJdl0VRfUJhhylPyychlLxq3SGXRL5gGzRMi4dyn542orOUEG+t+FRqX0WmajpvDSO/zU2RmCrcY0tovogjfAk/IyD0uccRkKJBN3kTBYI5Ip5hOvoOTWl86iuCaYYZDrt2ytP7A5G/jfOZZDveh2I2T5AdUtKtobnaw53pqx7qAstCC5LtLuRUqeTixJZJps8FdlDGuapF0LMFOf4aUY5BsttdhE0aWl+e9zZadai+iK2FZWQFex58vVzdiSjGJxQzQfV8NkJZobNS2X4cceUh4MyUS0XgnINlRMbNDV+qnlqo8sK0E5bEy/yZQ7ZcBdbLEXNOPQJ2MyCHU53KZICfFZunXSFybdQgHFNJ8K1ovSFPkQXKfsv0IStIo9SgK1fx8p5hlQca1rjrWn2hllpuF9sw/sqXiM3v6AzLPw25hbjMnkgA9EY/yRqD8dRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(186003)(86362001)(38100700002)(38070700005)(26005)(83380400001)(82960400001)(122000001)(66446008)(64756008)(76116006)(8676002)(54906003)(66946007)(8936002)(2906002)(33656002)(52536014)(316002)(110136005)(4326008)(5660300002)(44832011)(91956017)(55016003)(53546011)(508600001)(6506007)(7696005)(9686003)(71200400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OQpcfuQDd7G/Sqb8leBbccTxP+cjHV77kPo63tHa1Zby99d5GKFVe7bH9I?=
 =?iso-8859-1?Q?wzl3ePaANr9olACJpuZ0U5jMDqMYRdp7bTq8TDhU6tz6QeNxB78mqcLqZa?=
 =?iso-8859-1?Q?2N+3RiZ4oiRTGkMrl/Xi2rPJf7XFd2VtMpf0jzZYziObAjgLq8IGmoY38W?=
 =?iso-8859-1?Q?RE/GCNHeCMnoJiYVoXstqy1hpvH3umdJPwJ1VyHGitBhU40/OVs+VF4dqF?=
 =?iso-8859-1?Q?6ybkopEvMft8CIu4AHI2w+HKi7upOdG356wLJCVScerS+mEEUm7d22GMJ5?=
 =?iso-8859-1?Q?6ofQHIRQYwKl4H2VN0F5lkRibOLkpJpRyf4tTSQ9RlZGUd3xGOrBQKlNgT?=
 =?iso-8859-1?Q?G/3NF4/FKYZHh8BHjVRo7cIu17R4LV1jDsf4U8Y3n/iVauH4qVj0ByWbke?=
 =?iso-8859-1?Q?OSsQO4jigL7IKMLVRY/n/Ll3CrSHn6rESUi2Wo4290sJem+pLNc/8p7DL9?=
 =?iso-8859-1?Q?23bDSJ9HkGDPIEcv/ksAvMPNF6ehLo8xAK/WrKPGoBQsTvvqvhMuJOq/FO?=
 =?iso-8859-1?Q?4F+WOP1ej+sc3DSmZx9PmRydE+rOvg11Q5H59/4pEyqjs0aUvsaVg8U+iE?=
 =?iso-8859-1?Q?vcwzUiuyWAXcj5zj80kCSSBJQaLG2bzYdm2R7EY8j03ZsrwyfcU0nuKcgG?=
 =?iso-8859-1?Q?3lD8y5eKiG7z8W3lVXf17dB8J/VGGy+fvUwtqxXfcoUyNUT3/NwIbzzlS1?=
 =?iso-8859-1?Q?Woa8mj9iQXGUeylTsUn8o7qaojBZwFV/CJGO9fA0kOkLoYL0SBvSOmYjwR?=
 =?iso-8859-1?Q?XlBUztpTlnk20YJ14J/9XG0UQrCypSx/gv1/6qljQAr9ItQXspIVWztM08?=
 =?iso-8859-1?Q?BKcFsGBz6EiWw02kjFvmSyUwZ+8XbC6wIxHW7xkLIno2he62ZLuXwHTgDr?=
 =?iso-8859-1?Q?25g9LeV57n+WqVU/XH/tsLqDMAjhYZCIQKF32ktFQcXM7z3cCx6R3nSu1h?=
 =?iso-8859-1?Q?0+k+OJi1I88eKlcAW/JPM3G5PejuDaJ9NWpvMJP8LoAv0e3cdB5T1YX/6o?=
 =?iso-8859-1?Q?AXbihYX+jzQqTQIYXQwik8y6bJFEqrV5M0h842JUObGNG4edVbJN5/jm0w?=
 =?iso-8859-1?Q?Xye8hm4B6oeIh8tKpivbWPAzUnShtmoQHNQ88k6Zl1QsM9SwO5HntKOlpE?=
 =?iso-8859-1?Q?OO+Er4xj4FZpGZi2cyM4NwguPw95YDggzCMYjDD2t4P0KpRTQNKGlI1/mL?=
 =?iso-8859-1?Q?2fKIPrAzrYXHgUXT3qzMLQuVuIad7KEo8XS2U4aS3C1NLF40fNit8vo17G?=
 =?iso-8859-1?Q?4uECj3UZvzevtHo7SXxMjPd6tWNvsQn2qBC7IVXGzC/Ostrbnzv1VeBIFd?=
 =?iso-8859-1?Q?XnNoDVoEKbE5KP/EDGatO9i+vM17rs0QzhC/c4WtLV67cN9KRi5j7Sd7Q4?=
 =?iso-8859-1?Q?ZJi8PGvJXmYbR4s3Nxt448W1pcoZyndtfCTdfhyGpdokdJwUc02uJpGUUk?=
 =?iso-8859-1?Q?k+gN0VrTNLN7QxxAL5O5Pk0O965Tj0rV+aBbAJOryH1rO8aV4EQPeRNiAM?=
 =?iso-8859-1?Q?RASBW9T3DhbPnMGqZHu4tEKEBRROEWwMPthcGYO1xSDKBx4Zcrd0t/GZ4Q?=
 =?iso-8859-1?Q?eDrIy3oIbl6ZN3Ic4Guh7YBTEVk5J9CM1zp5W4AWLg4UALUoA+SrqpLN+6?=
 =?iso-8859-1?Q?7G/JrEKDPqkHP7eyibFOzuF2Uj0OGmWZ3Xwj7sIL6G5PyMNlGWQLWrkhuI?=
 =?iso-8859-1?Q?cCfziq5VpZWjbdNS36jNzQ31LTc/WAkIcsYiQQtUa6ug5eRQdUEl266tjk?=
 =?iso-8859-1?Q?Yg/Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 027fac0e-b1a1-4796-a5c4-08da010a3b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 13:47:48.7184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErRVxX2f+QrWuVuffRFEz0pM47xBn9dug9ltjsWNxSX4NIed4rmJIcuH2gwBbfY1cZMU1g8cE+1MKOlU/t3n9tnqflG52UlslTTsA7ssmzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6687
X-OriginatorOrg: citrix.com

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Wednesday, March 2, 2022 2:27 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>; konrad.wilk@oracle.com <k=
onrad.wilk@oracle.com>; doebel@amazon.de <doebel@amazon.de>; julien@xen.org=
 <julien@xen.org>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Roger Pau Mon=
ne <roger.pau@citrix.com>; Roger Pau Monn=E9 <roger.pau@citrrix.com>=0A=
> Subject: [PATCH 2/4] livepatch: improve rune for fetching of Build ID =0A=
>  =0A=
> The current one is broken with my version of readelf and returns=0A=
> 'NT_GNU_BUILD_ID'.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrrix.com>=0A=
> ---=0A=
>  README.md | 2 +-=0A=
>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> =0A=
> diff --git a/README.md b/README.md=0A=
> index b48a3df..948a7de 100644=0A=
> --- a/README.md=0A=
> +++ b/README.md=0A=
> @@ -16,7 +16,7 @@ $ cp -r ~/src/xen ~/src/xenbuild=0A=
>  $ cd ~/src/xen/xen=0A=
>  $ make nconfig # Make sure to set CONFIG_LIVEPATCH=3Dy=0A=
>  $ make=0A=
> -$ BUILDID=3D$(readelf -Wn xen-syms | awk '/Build ID:/ {print $3}')=0A=
> +$ BUILDID=3D$(readelf -Wn xen-syms | sed -n -e 's/^.*Build ID: //p')=0A=
>  ```=0A=
>  =0A=
>  Next, build a live patch, using a patch and the source, build ID, and=0A=
> -- =0A=
> 2.34.1=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

