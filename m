Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22354461B16
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234652.407251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrihL-0007fv-Df; Mon, 29 Nov 2021 15:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234652.407251; Mon, 29 Nov 2021 15:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrihL-0007cr-8n; Mon, 29 Nov 2021 15:36:07 +0000
Received: by outflank-mailman (input) for mailman id 234652;
 Mon, 29 Nov 2021 15:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrihJ-0004Rj-LE
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:36:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0db9ffe2-512a-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 16:36:01 +0100 (CET)
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
X-Inumbo-ID: 0db9ffe2-512a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638200161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ikz8Od6tujePp3huh+RLSBKJ6YNbo1RzzrtmzTVzTf4=;
  b=BvziWVFXWOIIKqW9qVTzvflMOhQ/DLHccVXcYFCNlNEXG5Fc8j3HqydK
   3WLsl45WjklsLC3JMxYWpUkoud3fGImAxfDJ/RUZlTCDTATU7Lmw4Rdob
   qZrME33pGj09Mwm6NvVY3NE8PsbCUqZNuSb6xnDrsJUmPImmkKTDHeoC+
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0gdoAH2eX1lxhgWtP/Vv8Oih01QsfykTkrmaQRmszixCYPdx8WvdyHizpG8vqHRqHX8vgQfmsJ
 vgW995aeqZX+3yPgDufmKLmh+I10qOjofsogwS+vIxjT1421Blolqogdgc1Sae/v7I7EaX+LkT
 +P6Ua/wKkYLM7QT8tJ1Bs4dBZ/jptqELhCp3vddFBGy2L1hEQEwqnPlosbXUzgAXnWmq6eJy8f
 A5UdoKSNwp1XRKUrdgU+ACOsMWhxPJtiOU0NZulEhLNB9y5GisArYh00JKztKbvNdfUNp2YO+7
 ILNYIJAMMu+lwXzCCTyAv6+7
X-SBRS: 5.1
X-MesageID: 58817385
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pspsdqlsoMfLjAz0tTL6hS3o5gxiIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWzvTOv/Zajf0ft4kb4q//RwA6sPTzoJgTwU5/C4yEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Q52YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ppy75HhUl8KB6LnwtpMdxoDDnlnGqITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpg1pkRRqaDD
 yYfQTZAdBLBakdGAHk4JI83ocSpuHDAaCIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRok+hWfpPJ
 koM4C0soKMuskuxQbHAswaQ+SDe+ERGApwJTrN8uFrlJrfoDxixKVdeQ29aMP8fu+Rse20O1
 QSUx8rOCmk62FGKck61+rCRpDK0HCEaK24eeCMJJTc4D8nfTJIb1UyWEIs6eEKhppisQGyrn
 WjWxMQrr+xL1ZZj6kmtwbzQb9tATLDtRxV92AjYV3nNAuhRNN/8PNzABbQ2AJ99wGelorup4
 SBsdyu2trlm4XSxeMulGrtlIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyM
 BaJ5VwLv8YDYBNGiJObharrUazGKoC6S7zYug38NIISMvCdiifalM2RWaJg9z+0yxV9+U3OE
 ZyabdytHR4n5VdPl1KLqxMm+eZznEgWnDqLLbiilkjP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhWdyVmXs6v9JQMHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu1NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:tgEQ3KNWxXw6xcBcT1v155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwPU80lKQFnLX5WI3NYOCIghrPEGgP1/qB/9SkIVyEygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrVQsOVvsprY/9s2p00dMz2CAJsQiDuRZDzrd3GfE2J9dOUE/d
 enl4B6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1sjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvC/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdm11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixttqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bWzHAbgcYa
 pT5fznlbRrmQvwVQGdgoAv+q3iYp0LJGbHfqBY0fbllwS/nxhCvj0lLYIk7zA9HakGOut5Dt
 L/Q9NVfYF1P7wrhJ1GdZI8qLOMexTwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="58817385"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J945ZGFpN+SQ+3oyLKzu4tRbkq1sFSrSjmhUxiFrNGhaApOR5vGxV2hT3KRMUVe04jjVTO3rN65heSLKX1xFuJAB/jPtvOjIZd6Z2jH3X4OLLDUsmRkPbiYlMLU0JyU5BQghfyvMh+iNmpv0oHrfO9RKb3qJfQ6/NJ3w431DETD0GffE/TYKMn7XJk+nt7lAJAtBCjoJrGmvsn3FQnNsHJ0LULzl6o7RwhfhGsS2VLsUGfFxLI4u4/8JkeWPNHZ36XvKndSDDnAcMLd3h5DDyhNRy65vSvjL2zYweDxWcgvUqkZzCQj2RqgDL6Cz5H1T/7FdwHNYgV2TVngdrzEWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6273KZmAZtXTzPVDuifwUtanJBWxIn4jC61JEnVY+80=;
 b=AuGgq75Yyr2L7BGZ6kpFC/HVAwdYUlPw4tkJSmDozP0o1w7AqJEO0MBCE3Ygieih3W0ESKuJ3XsKPoLTsTYS7Oym+mPjubKcBummANOiN248Uuz0zLVqdbU4QKQ+fy80cNXdE3emDsru7b8TXjJ4PkPwJET3Vz7seA9m/FA0MlKLn8kCF9gtRfQzGJe2i/Nch2kP+vHwjIpdC6R8HZnxo1WD0uglVRclQwVkF/C5Fb/6xy0ufmZDkbOyJqG6YAawq1u+nuAp3qjZXe9lGOmed7fdlLqpQ1RwSsTEhEZtUgd1A352fURB2fJdGMtGHoAdAEBAYWl744vIxAXlRZZzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6273KZmAZtXTzPVDuifwUtanJBWxIn4jC61JEnVY+80=;
 b=k8uitRCBLoDPHUPtrqsMgbQVh3g/lJfBDo+oxAC/N6k7ROEBPNap+87WCx0amgnbA4IF2y5yumE5bJuczlbTg/KQMRII3Nn/CmAQP7LfHZQRowlfpvNB4T1JeF9zFsFw93ev6WhvW3RGNGlEvhIqTmkl6Mkac6zmsrXnSZAgH/c=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 09/12] libs/guest: apply a featureset into a cpu policy
Date: Mon, 29 Nov 2021 16:33:52 +0100
Message-ID: <20211129153355.60338-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211129153355.60338-1-roger.pau@citrix.com>
References: <20211129153355.60338-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d7a2944-fd1f-49e4-be8e-08d9b34dec97
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-Microsoft-Antispam-PRVS: <DM6PR03MB534091DB3489924CADAF9A7A8F669@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MSUS32KMWT5FO0qj1mdOqzDBaYutPhcYgm2Y0nhuT6CezqLxZ9+RrC/bH4et6sOpkGYKpgApH4t1/lDw2AzI55P+Yo7pltsv6ahBlMeVKtB27bITCTcKa8loQj+XbFyu9qRp/JGhMk72waocqpepLvFsrldmFnQDBOgipoEBCeP7HcxhCTFdc9cJyImLM2p8WpJKuFfQPUx3gElQn9LWzBqXBbXUIiLKh41z3sGpCX5kKcchFbhpMZFyKrR3vk2mg745SacwVl+ZUwbtQ326BYmxdkWDx6MI6h+9tQ9MojuLf48iRjO+uKOZlzxQneIOrj6bvxrh58U5hJ2MRekQMR+z6wFUkDNcFZ1wM0iG1ah6kyDsBfEJkumK6Jd1JNLrk8284jrWuLn5mRsuvN/h8wR+EbPD5zXlg4v/G3VmpE1fFJ0Wb45vxLyXIJvbohFGJwjWoiftjPi+BlMrjXMkIUOdSoMxyNfmRLELoDUHnHgpvFoDlTTTtJQ+KuYigiIJ0ZF3XFfQ9kzs1TeTj3UrC6zUIgIlD36tItdu2PY395N1sgJeK5NamgNERFFGj5QtzRnyejaf2leJzu3AQYt5T2E9nYDp6nEIhoxyZ9rroBgWe4ax3lFBlD3eI8H89XvxGMd5yZJwRX0CW0xcvYUhcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(82960400001)(66946007)(86362001)(1076003)(508600001)(5660300002)(8676002)(6486002)(316002)(38100700002)(6496006)(26005)(83380400001)(6916009)(66476007)(2906002)(66556008)(2616005)(956004)(8936002)(54906003)(186003)(36756003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y282bGVmd0hDZmZvZ1docnFHQnRST2czL3pBamtReGxqcEJHSzBHK0k1amtk?=
 =?utf-8?B?M1BoeVpmVWwxT2ZZVmRxOTJxV203dTNPYnJTMlk5WnZWWXcvVFJlWmRwNmFM?=
 =?utf-8?B?WHNJVTdZZzdZYXVIQ1pValJJVTVFUFZlNk90NStxTW9rMW9CSTFlVXV0MXRn?=
 =?utf-8?B?Um41ZTJiRklkK0NKYWtYd1A5RGl1TGE2MitORnk0M010Mk1tTHNQN3IwV3dB?=
 =?utf-8?B?ZFFmWlV6UU4veU8xeXZYcnBROGcrWnRKbEJ1alp2bHBlOUZiT083ek1zdUx3?=
 =?utf-8?B?VzZ1MHhoaUdBM3p0Z2wxNVlkNlhBM292b3BsVFpydFpNUS9UL0s5bUZZOEJQ?=
 =?utf-8?B?bno4blZiM1JtOVhLd2xESHJ3QXZWMjZLRWZ5a3lPZVBOYzAzR3hSakpDVEJV?=
 =?utf-8?B?TWNhZEswYWdXeU5jLzhMRHNGM2Iza011amhRTk9vMnJJbmhsS3ZSbHN6OHVK?=
 =?utf-8?B?M2tLMFhqeEk1WkJlSnIzWEVVTExSTUJJUHFJTTJabmNrUS9zOE45ZGVDMnkr?=
 =?utf-8?B?TThvZUthUlNQV3d3TkN3L2U0QlZMZzFzREF1UkNqT1h5NTNhYXh1d3dEV0gy?=
 =?utf-8?B?ZjdkaVUrSkVpNE5HREM1akZvblJ1ZkhOOXRUTnRqbTlTdTFWbThlMFpmdnNI?=
 =?utf-8?B?amhBc1diSEJNcjNsZXZuRHJpSEJQb0xMUmQ2bTY3SFF6amh2ZFg0MXhQVVBi?=
 =?utf-8?B?MmxSSkRaRjJwS1RxVTZpcm5kbVhnZDRrWDl1MFAwNE5OOGNDZXlXbjJ6YURk?=
 =?utf-8?B?ZlpPTnErd3I1OGxuaGlrS2ZydTZ1MUhFcVNuOFZiMERSclhhODBXWDZtYTNp?=
 =?utf-8?B?cS9hZ3NZSEZ3NkYwMWRQVVVwZXdLRHJoSWZiZ1J6UmZWMWE4aXYwUFNPa0lp?=
 =?utf-8?B?Sm5wS3BHQUEzcGE1aG9SQUEvbHlyc2JBWFk0b0p6cGZORU81V3lQdWdaVHp4?=
 =?utf-8?B?akJBemt6bUtmU3gzbGJtWERDdWNCVEJDNDkxeEk3MllDS2paMzJkSVRaZkRD?=
 =?utf-8?B?LzR1L2syWlI2TTRmYW15Q1dFWkVIeGFqZWl5Njd2RWx0dWRYYmNsdlZKU3VT?=
 =?utf-8?B?ZzlQS3lTNU5zczZUQlVhYW0zeUoxeTVRYm9TVloyQ3pmaTh3MmdXeE9EeTlZ?=
 =?utf-8?B?Rzc0TWtDNC9lbjN5VTRlanVNQ25BZGpoL3JCQTlsV0xERE45TU9WUkRHWUZn?=
 =?utf-8?B?bHAraTF4UU40YWVvQ3ZVRXplWXNQWkF3NlBoZERGQTRSQjEzYyt6Y2V3SjFl?=
 =?utf-8?B?T1cvMzRHemxOeHZ5NWtnRzhZbENOSzNPNHVxOWxuS3QxRjBoazQvV0RFNHMx?=
 =?utf-8?B?cE45c3JBOWR2WW4wU3ppMkh4QmpUb24wWXVwTlhKNlZMSXgxeitSem1RQXlk?=
 =?utf-8?B?RTE3UDI4ME4xLzBsSC9GRWIzUHhzaUx4VE4xNmlHQlI0NTdlOXdNekFCd3NH?=
 =?utf-8?B?aG5ueGl5UWk0azZDVGJXZlhrOTJTRTRCWWtIdXZXSk1TcWRZV3JoRkduM09h?=
 =?utf-8?B?Z0FzZ296SURjaGtvWDBJNG1Ed2pTVUFBem9ES3djelVOcTAyOVF0UURYWTYx?=
 =?utf-8?B?TXduRnV3M0NCVEJKQjBjUEl4MUFCMEhCQ0FjeTBvOWc3N1g3RXRMS2NvaGw1?=
 =?utf-8?B?dXBuY3dHYWRJendoTjJWbHFleGxydUg0QzBMdGc3NERWK1NrSkQ2TDd6Sm1I?=
 =?utf-8?B?QmZlQkpzQjN3M2ZYZ1J1R2xGNjJtMVo5Sm1oNXpvS1NkNU0wRnlNaW9QRWgy?=
 =?utf-8?B?MkZkYkVJOGxBaFNtWi9PQzVSS3g1dVdmZFY5T0NpNEtadERSMGh1SkR4eUZW?=
 =?utf-8?B?UEkvdFdidzFvWjRpY1R4UVJKOStuM2FFRmJuWkFJd0hRTk1lRmpNZ1FnbU9P?=
 =?utf-8?B?Mit1N1EwRjVKV083MXdnWXg1QlhSOW1hZ1Juazc4Y2NYVWJ5MzE3dEdPMm9w?=
 =?utf-8?B?MWROSExxNzdYWUpPeldoLzVaMTB1cXNmZmozTnRmOE43amZUbWhpNkpHcjZF?=
 =?utf-8?B?ME9Xc3dFbjhZNHNTSmpZNGxwZmhTVkUvcE15eHJ3YW0vN3NYS0wwc0tGbWs2?=
 =?utf-8?B?VDFiSi9tcXEyLzZ2dHNCeDdqcm54OGx1Z2RmRVNNelZrSHYvb1ZGYndUYjR2?=
 =?utf-8?B?Vk96VnJYR1dYNFlrYWx5dWdVTGNxa04yTzNzOHcveFduZ0ZYalJBRFZaWlM1?=
 =?utf-8?Q?bVTEj7D+29chR+SRtV3k9is=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7a2944-fd1f-49e4-be8e-08d9b34dec97
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 15:35:51.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/rggqMG58C6Tu8iDci/sCHZQ3gws0hH50VyBwTUlm+F7Kk3PDKJlRphjxWBUdniSG3bBR1Cg1lkf9PiIMbNYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenguest.h        |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 9912116a51..8f05d8aa66 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -829,6 +829,11 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 121bce1a92..41c6e66b6f 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -443,46 +443,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -918,3 +887,53 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.33.0


