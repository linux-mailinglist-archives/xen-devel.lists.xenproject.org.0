Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B3849056D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:49:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258054.443978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ody-0005mn-TG; Mon, 17 Jan 2022 09:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258054.443978; Mon, 17 Jan 2022 09:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ody-0005ii-Ob; Mon, 17 Jan 2022 09:49:42 +0000
Received: by outflank-mailman (input) for mailman id 258054;
 Mon, 17 Jan 2022 09:49:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Odx-0003a5-2D
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8eab3d8-777a-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 10:49:39 +0100 (CET)
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
X-Inumbo-ID: c8eab3d8-777a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QLpgwnHtHqhSieNVxCla2oAfDWQ+1Xdr+4mwhUPQ5WY=;
  b=ciGKO6ThWEChDHi3tJfYjGnHkuop75CJzPDW0OfclZ6kynEfdmlJ2a78
   nKn9sLAitPrR7mmMZ0+YmE0pJH47+C4G6zzQ9fa9mDvgvn+i2yxQARU+T
   R3m+0CrA2fvANUp72j7ZR+4vU2KioKChNz8MHTogF7z7a71bv8r0ReLLO
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xiHqYWZFEvbjXhbma/2zhsPh8+lngKUIkt5ea/YRt9ro8cnu0eHDXpIguNrPZvkCDVSGb1Dk1J
 3T80P1g46gTd9TK+hstUIcJ5EaxUeZl4XI+kht7Yjlos3Wc3DyZutykdpaLjnnw5ZHvMqDEVzO
 8ruzfGjklFniDRsmQURnuQAPYGYLq1LpveO9zNFxIsWVXVJuh0qdkAtLY4JSABwu1+/ELIuYSF
 MqF30XupnXZJj6lTWxstYoBinCjM4+34zpqaJ64PEi82WHaqEp6X7I6iHykh2dA375l/vjCUNr
 225Si05BkwW0G40VlCF/beE5
X-SBRS: 5.2
X-MesageID: 61616920
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OIPvsqIPgE1MddaAFE+RNpIlxSXFcZb7ZxGr2PjKsXjdYENS0DAGx
 2YYUTiEM/3YZ2X1e4x/PYy28xlU6sWEzdA1SFBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us6xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ZtdJL6
 NJtl6CvbidxBPHKneEZckdXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2UvIEBgmZq3qiiG97OJ
 M0oNxR2TSjabiZAEQtJJaw+sN6n0yyXnzpw9wvO+PtfD3Lo5A5+yr/2K/LOZ8eHA85Smy6wu
 Wbu72n/RBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHtdR+CgHmknCIDfPoIKbE87QSJ6/TbtlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2KBApJDSsjPeZJgrBED3CBt56sy67DHzG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj3oCPzJtAMvG8uTKuMDiriUWW0C
 KM0kVkAjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrlBuZd2mHFW7T6DFPjTkkX8uZLDNSH9dFvwGAbUBgzPxPna8Fy9H
 hc2H5bi9iizp8WlM3aHqtBCfAlaRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:xz/lNq441NZ2M/vZlQPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbq6GeKT9J3jJh9WPH9XgspbnmBE42igYyhLrF4sP+tHKH
 PQ3LsNmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZSbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczJgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenUPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesYMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO01GkeKp
 gvMCjg3ocUTbvDBEqp/FWHgebcEkjbJy32A3Tr4aeuon1rdHMQ9Tpu+CVQpAZFyHsHceg22w
 3zCNUdqFh/dL5nUUtDPpZyfSLOMB20ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="61616920"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0sZ0V98kprUswP+XkqBqKgwV7PUsfY8cas4LENLnfqVrmnMreMQru4T1sAvlgGwHks1EFvsoSoXdaOareEkCuZKwFrCx64iehfdbhZ/gcAb9F4KSLF8CaJqgaXZrh+npEc+wdD/kSLHuWIaDytbodxDJbqRcyffoYRzjfe/Nz3abFy/Pr1J+4UTqsKUEJ3tkimV2lHpXH3hlTZdTB8n9Jo6mYSzlXSKO0FK2WODy8/ZqLYwKpNjO4xAJQjiI1IVBO8z0sxTkeEPYczWGPuAspZqIPNzY2JK3CwzVMe5tV7iQodXs8IIsZg7MPRq+I4wMzK/UlWak3jYEEHM4KJWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXlOuhvnx6XapUkjewvNTicZOL1G6NXO7zwA2fIJdPM=;
 b=DO4qwJjjDAwt/cdIzuRvjrNvxGtrRBtWYiLJXTlRZzc+8j+oYeGjVJDeVcyZvlejew+F4xow8mjnNo4Pt30I+JailBrHl3GF32OYB5VO9Ge5/ZanHVRUAAjGG4rmX5P9g3oKPsSSWFo/FsQByf1eL1cVwUaZTygubL0JDFFSpn2PzjVMUDaAnuXOdeBQgNM9pbHiydh0LcKT72RaAiezgjQxnjdQxD2lKkTXxcyxCpFr5cHjE1ppTehHc/L/hDQqtGgMKMEukknjOos0c30ULAliOxXisZ099uaGjVISIEvBNvb7egUo+cyQBNVx8BSVSMoyFNTA560oEEl4ffC9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXlOuhvnx6XapUkjewvNTicZOL1G6NXO7zwA2fIJdPM=;
 b=ZDqWLfRatoSLpwDnIqhzXLb69csK2KgidI+vG03VvEH2umCtlVGVZeRDUHQ69HNUv88ypx+0SFnT+Do8Y1RFXk34yqfZqiXJY+u2oIMjvoiM2D5gd3v12WDKGudFcungPpQm29mkXIK+I/qft63128rBd/J3l7b5z3RZ+baB6xg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 07/12] libs/guest: introduce helper set cpu topology in cpu policy
Date: Mon, 17 Jan 2022 10:48:22 +0100
Message-ID: <20220117094827.16756-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a91cf014-e294-4d78-371e-08d9d99eaad3
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059178D7EB34DDB4F74F7B98F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vcBzUtWwU8oHGbf9mLaZZvpqUGpyfUuV9fAYg/FVp3rOlFHKeE+2AxLsf9QKR74aTx14wxYR+5yNXpW4DwO42T+SpgIgpz24qKMyHa+IcIfxSRlwAQwitet/raK/Tzb9dBx0guUa81dYy30HZOxziaIyWTUJ7g4RCfsaVCcvINmnwrwEQbzHeqINsncX4MvLJAHTqgMoDafIawm1JsgQadJdk/PNoLXVhJ1SSlEumtbaIrk+PghM9dMKV8q0JQsdyEPMH+1wum9ueOy8rkFp1GSrThfj85CjmzRHr0SOx1cwkFXVgxGVnQRv/OvDc3Y7993pKIUmHldl5Lv/wrNugrrv7s5B4o3xJFB8A+kv/t+3syAkpgH32uBQhkCbS+lXHQlHU3YH1vYtflQSl10cSGEV4zEigfy+lV6nBngIi2UoyE4Mu6nANyfSXDuNGuE4FyLDFNHM80gh0MNw/PPhsqQ+XRD7d8ZbHptFkMW66/MRAaGPg+Asu2YGHBgLDAx3a4xAK8tp4FN9SzApVir5zdPaJDCBN6WXGUoT3w8ZSEmn5ReyVNlcVnBxkfatsEz9qVKTa6mdQS9p4cAu8wLQw2X8stF5iyieyijC7fB+Ijg2ck9zaQJDMH854pfDGEgw+td7UFT/K9vmBfwYrnwL6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lKeDhiUURRdmlPSFdjZTJmR2p0aHFXeWlyT1orK1pZTkNob2pvdCtrNXRQ?=
 =?utf-8?B?bWRPbHdzbDhxZGtxNnIxRGsxdHo3MGdWdFV5M0l1cHZ6b0ExK1R6RHFMbDZr?=
 =?utf-8?B?dDFGTGNnaDdRa0lEUUZNWFlFZFVNdW91SlE1a0Q0MllNWmNBcnk1Y0NTS2hn?=
 =?utf-8?B?cHVIaHlXdGprcWZYcmhUTW9PWTZ3eWNIK1FTTTFjWDNPVjVEVnVtbS9tUXd0?=
 =?utf-8?B?azN1eWQ2ZXYwTnFwcVJGTngzckQwczNrWVhhaVRJOG5JT2pUVzZVMzFuNEc3?=
 =?utf-8?B?ZDRML3lnNGdSaTB2ZkFzeTh1a3hmZUNpRExtY2FERjF6MzhNS3N4SUtXMjdp?=
 =?utf-8?B?Y0d0UnhBeHk3UElsQmJPd0ZtZkRieTI5TU5EanozR1ZaQU9IMm4rSFFmczc3?=
 =?utf-8?B?RGdKQ3pjd2JLaWNKWHRLNTNDQU0yZ2RoNEF3d3J2YVJuc3ErelhLbzc0OUlL?=
 =?utf-8?B?Y09yb2wwUTFMV0h6RmpIY0NYK0l6bjNsK0ZYdWFaK1ArRXdxL2VmUUhjcDQv?=
 =?utf-8?B?ZlNacG9MdWtnYWhTSjFleWhWc256UVlXQm5NNWp5OHRCN0doNThqUm5kbHpr?=
 =?utf-8?B?QWlTRlB2SlZJdGZvc1BhMlprem8rWStEaWprNW5Da0l5bXQ5c05ycEIyalo4?=
 =?utf-8?B?bkVwL3hjSis5N2NuUnp3ajZkY0hKZEJvV2czNzluZ25DbWZjcHpBMnNGWnBC?=
 =?utf-8?B?NkQvYWdVb2hZWDV3c00vYWJlNTNwendxakVRU1hXSXl0Wmp0TFRPU0dRdlNo?=
 =?utf-8?B?YncxYjhIbHJHN1doeHVOLzBlSWNlY2ErVmlzVW9RSVdEQWVlaW5GdmVWbVBZ?=
 =?utf-8?B?azlYOCs1SzhYbWRWb3ZxZUxZT3UvWWlHZE1QSlFtTXErTHFmYVl3Q3UvUlFX?=
 =?utf-8?B?THpzcFpONHllcHZwdkE1eFlSQVFsYjlqOW52bXprMEFXUGF0NVZ6eDFqMTAz?=
 =?utf-8?B?cXdKWEo0SC91WkgxMUhZRUhFaVlBT2JDclZ3a1JKcmFLUHZ1K3J2ODlvN0Z6?=
 =?utf-8?B?cDcyNmJQZ3ordVUvMDJET05INDVZUWJJMk1GellqdUpJMTFZTkhXVXN6SW1O?=
 =?utf-8?B?MnhHWEdYQm8zbVVHeVBsTllCVzJJbCtSTmYzVUp1NWtXT1lCbHVqQ3VBMS9i?=
 =?utf-8?B?cFVVSGdsYXBCRkQvYnMwdVkzSHB6WGRtbWFidExjWHNVVDhzVFd6OW84Vk1L?=
 =?utf-8?B?TnlYcjdURjU5NXRrbThrcW1IVFE0Z0xqS1VMR3h1Rzg3aDFPVmtYWUg2a0dR?=
 =?utf-8?B?SUhMNEtocy8zOHlXU1JVNXZTZzVEbnExOHlLNUd3eFliMmhkeGErVjVQM21G?=
 =?utf-8?B?d0RkZ1p1ckFOZ01PaHJUd2FmcllQTWRqd0c5TGtLb005c0VFMnlUWkM1WEdR?=
 =?utf-8?B?cERiMHVFQTFRc0Rta3hvUnlCSzZaQlcwdDMzTllTaEtoQjdqQTVSYzU4Z1By?=
 =?utf-8?B?UWg4dkYxRkdkTk4zdzhSV1NiNE5kcHFrdUFjeE9wZVpFWDUxMG9qNGlXZHgv?=
 =?utf-8?B?alV0ZEZ2N1FrU1J1MUE2RjQ3V2IyY00veHA1dnQ2T1hkL0d4NG5jZjRCbXk2?=
 =?utf-8?B?ZVFxVmp4TTJVbVFhRE9ONlVBa29wR0U1RmtDbmgwNXFNR2UvaTU5LzZPN3Fw?=
 =?utf-8?B?MW1NcE92VnhOVWlhM2ZpMURZR0dpWmZpWEcycXh6NUEvanNwaE1OMWtkeHU0?=
 =?utf-8?B?ZTRYWEVFSGlTNDBwa1QrN1ZXTHpaU1B5bkFYcHJSQ2UrMzk4Ni95ZUNSV0dm?=
 =?utf-8?B?NElRdEVjRFY5U0taQkhudTFkb0lSZUtNcXdxUWltRWh2S1hYQ0I5TVZTSE16?=
 =?utf-8?B?MkNaMklJMlBvZEgrV2xXdGl3b2NXZksrVDVMSmNZWFc0U2JiZmJWVFNBb1BO?=
 =?utf-8?B?MW5DYnROTE1jVEVIWU14bVF0ckI1Slp6T25IcU1lVkRzemJKejBWWnVYOUdX?=
 =?utf-8?B?dm15SHc1L1o3UWh4Y0FUSU93WHh6VThuMUxSczVXTTZJS3pkNmJHd1VhNHAr?=
 =?utf-8?B?RXlEeVBHaTgwd3VWNVhYdGF4N0FDbkdDZ1lHODRhVU9neWFpVUUzZUlRQTNq?=
 =?utf-8?B?K3NFTGRhUVpMWCt3MFhYZUxpTS94VFMwK1ZwQVp6elVqdTV3QzJYMStFQ0Z2?=
 =?utf-8?B?QUdBbk52bDM1U1R4ZTNCZnVQVnp2N3FKcjFSZ0VhQUhaS1RERHFWUnlGa1Nv?=
 =?utf-8?Q?nhLRNXfew2Ju3HasG+YDV/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91cf014-e294-4d78-371e-08d9d99eaad3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:34.4446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSSP3fXsamVAqMAdq0Wa7uBfHgSXbGfpgr1BEdw0nfN13hZYc6/CgQR8Bguf4vj2GN04bBuL4kQ1Dnh5JZDeUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

This logic is pulled out from xc_cpuid_apply_policy and placed into a
separate helper. Note the legacy part of the introduced function, as
long term Xen will require a proper topology setter function capable
of expressing a more diverse set of topologies.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - Keep using the host featureset.
 - Fix copied comment typo.

Changes since v4:
 - s/xc_cpu_policy_topology/xc_cpu_policy_legacy_topology/
---
 tools/include/xenguest.h        |   4 +
 tools/libs/guest/xg_cpuid_x86.c | 182 +++++++++++++++++---------------
 2 files changed, 101 insertions(+), 85 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 281454dc60..bea02cb542 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -821,6 +821,10 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
 int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
                                    bool hvm);
 
+/* Setup the legacy policy topology. */
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index f1115ad480..e7ae133d8d 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -429,13 +429,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 {
     int rc;
     xc_dominfo_t di;
-    unsigned int i, nr_leaves, nr_msrs;
+    unsigned int nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpuid_policy *p = NULL;
     struct xc_cpu_policy policy = { };
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
-    uint32_t len = ARRAY_SIZE(host_featureset);
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -458,22 +456,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
          (p = calloc(1, sizeof(*p))) == NULL )
         goto out;
 
-    /* Get the host policy. */
-    rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
-                               &len, host_featureset);
-    if ( rc )
-    {
-        /* Tolerate "buffer too small", as we've got the bits we need. */
-        if ( errno == ENOBUFS )
-            rc = 0;
-        else
-        {
-            PERROR("Failed to obtain host featureset");
-            rc = -errno;
-            goto out;
-        }
-    }
-
     /* Get the domain's default policy. */
     nr_msrs = 0;
     rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
@@ -557,72 +539,11 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
-    {
-        /*
-         * On hardware without CPUID Faulting, PV guests see real topology.
-         * As a consequence, they also need to see the host htt/cmp fields.
-         */
-        p->basic.htt       = test_bit(X86_FEATURE_HTT, host_featureset);
-        p->extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY, host_featureset);
-    }
-    else
-    {
-        /*
-         * Topology for HVM guests is entirely controlled by Xen.  For now, we
-         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
-         */
-        p->basic.htt = true;
-        p->extd.cmp_legacy = false;
-
-        /*
-         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
-         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
-         * overflow.
-         */
-        if ( !p->basic.lppp )
-            p->basic.lppp = 2;
-        else if ( !(p->basic.lppp & 0x80) )
-            p->basic.lppp *= 2;
-
-        switch ( p->x86_vendor )
-        {
-        case X86_VENDOR_INTEL:
-            for ( i = 0; (p->cache.subleaf[i].type &&
-                          i < ARRAY_SIZE(p->cache.raw)); ++i )
-            {
-                p->cache.subleaf[i].cores_per_package =
-                    (p->cache.subleaf[i].cores_per_package << 1) | 1;
-                p->cache.subleaf[i].threads_per_cache = 0;
-            }
-            break;
-
-        case X86_VENDOR_AMD:
-        case X86_VENDOR_HYGON:
-            /*
-             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
-             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
-             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
-             * - overflow,
-             * - going out of sync with leaf 1 EBX[23:16],
-             * - incrementing ApicIdCoreSize when it's zero (which changes the
-             *   meaning of bits 7:0).
-             *
-             * UPDATE: I addition to avoiding overflow, some
-             * proprietary operating systems have trouble with
-             * apic_id_size values greater than 7.  Limit the value to
-             * 7 for now.
-             */
-            if ( p->extd.nc < 0x7f )
-            {
-                if ( p->extd.apic_id_size != 0 && p->extd.apic_id_size < 0x7 )
-                    p->extd.apic_id_size++;
-
-                p->extd.nc = (p->extd.nc << 1) | 1;
-            }
-            break;
-        }
-    }
+    policy.cpuid = *p;
+    rc = xc_cpu_policy_legacy_topology(xch, &policy, di.hvm);
+    if ( rc )
+        goto out;
+    *p = policy.cpuid;
 
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
@@ -946,3 +867,94 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
     xc_cpu_policy_destroy(host);
     return rc;
 }
+
+int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
+                                  bool hvm)
+{
+    if ( !hvm )
+    {
+        uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
+        uint32_t len = ARRAY_SIZE(host_featureset);
+        int rc;
+
+        /* Get the host policy. */
+        rc = xc_get_cpu_featureset(xch, XEN_SYSCTL_cpu_featureset_host,
+                                   &len, host_featureset);
+        if ( rc && errno != ENOBUFS )
+        {
+            /* Tolerate "buffer too small", as we've got the bits we need. */
+            ERROR("Failed to obtain host featureset");
+            return rc;
+        }
+
+        /*
+         * On hardware without CPUID Faulting, PV guests see real topology.
+         * As a consequence, they also need to see the host htt/cmp fields.
+         */
+        policy->cpuid.basic.htt = test_bit(X86_FEATURE_HTT, host_featureset);
+        policy->cpuid.extd.cmp_legacy = test_bit(X86_FEATURE_CMP_LEGACY,
+                                                 host_featureset);
+    }
+    else
+    {
+        unsigned int i;
+
+        /*
+         * Topology for HVM guests is entirely controlled by Xen.  For now, we
+         * hardcode APIC_ID = vcpu_id * 2 to give the illusion of no SMT.
+         */
+        policy->cpuid.basic.htt = true;
+        policy->cpuid.extd.cmp_legacy = false;
+
+        /*
+         * Leaf 1 EBX[23:16] is Maximum Logical Processors Per Package.
+         * Update to reflect vLAPIC_ID = vCPU_ID * 2, but make sure to avoid
+         * overflow.
+         */
+        if ( !policy->cpuid.basic.lppp )
+            policy->cpuid.basic.lppp = 2;
+        else if ( !(policy->cpuid.basic.lppp & 0x80) )
+            policy->cpuid.basic.lppp *= 2;
+
+        switch ( policy->cpuid.x86_vendor )
+        {
+        case X86_VENDOR_INTEL:
+            for ( i = 0; (policy->cpuid.cache.subleaf[i].type &&
+                          i < ARRAY_SIZE(policy->cpuid.cache.raw)); ++i )
+            {
+                policy->cpuid.cache.subleaf[i].cores_per_package =
+                  (policy->cpuid.cache.subleaf[i].cores_per_package << 1) | 1;
+                policy->cpuid.cache.subleaf[i].threads_per_cache = 0;
+            }
+            break;
+
+        case X86_VENDOR_AMD:
+        case X86_VENDOR_HYGON:
+            /*
+             * Leaf 0x80000008 ECX[15:12] is ApicIdCoreSize.
+             * Leaf 0x80000008 ECX[7:0] is NumberOfCores (minus one).
+             * Update to reflect vLAPIC_ID = vCPU_ID * 2.  But avoid
+             * - overflow,
+             * - going out of sync with leaf 1 EBX[23:16],
+             * - incrementing ApicIdCoreSize when it's zero (which changes the
+             *   meaning of bits 7:0).
+             *
+             * UPDATE: In addition to avoiding overflow, some
+             * proprietary operating systems have trouble with
+             * apic_id_size values greater than 7.  Limit the value to
+             * 7 for now.
+             */
+            if ( policy->cpuid.extd.nc < 0x7f )
+            {
+                if ( policy->cpuid.extd.apic_id_size != 0 &&
+                     policy->cpuid.extd.apic_id_size < 0x7 )
+                    policy->cpuid.extd.apic_id_size++;
+
+                policy->cpuid.extd.nc = (policy->cpuid.extd.nc << 1) | 1;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
-- 
2.34.1


