Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87577D2C77
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621061.967091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quq7t-0004Ru-L5; Mon, 23 Oct 2023 08:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621061.967091; Mon, 23 Oct 2023 08:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quq7t-0004On-H4; Mon, 23 Oct 2023 08:17:29 +0000
Received: by outflank-mailman (input) for mailman id 621061;
 Mon, 23 Oct 2023 08:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rddO=GF=citrix.com=prvs=653ff57d6=roger.pau@srs-se1.protection.inumbo.net>)
 id 1quq7r-0004O1-VN
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:17:27 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9858a9b4-717c-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:17:25 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Oct 2023 04:17:24 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6771.namprd03.prod.outlook.com (2603:10b6:510:122::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.7; Mon, 23 Oct
 2023 08:17:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:17:18 +0000
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
X-Inumbo-ID: 9858a9b4-717c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698049046;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CUKC0vJc5Kd/C2PyfwY1cQGdZsCpP25irFZiWcM9ekY=;
  b=J1Z9y1VJNO7iyaZ4lVCptpQ8JZ0aKzowZPojklys6tEZDNZK732GiGGZ
   lI6HMBor2MBucaKCK9+NcrWi1GRXRkEespDT9qOL4qASBNyjX+IShaV4U
   kPrLFcmtkQYbCk+ffjgZ2OoxolcjAvXOpgHHC0P5mIDdy9uY4XVfQ+0bx
   A=;
X-CSE-ConnectionGUID: 9qzhRbcaQDeLKDkuqYSd0Q==
X-CSE-MsgGUID: r4HK1Zk2SkWBG/+jGsZm1w==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 126787197
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:gi3e4KnoZ4gJVE5SYnhVcvXo5gyTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXmyOafncZmP8KNkiO9/no0IC7ZKHxoRmSgI4+ClgQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gSGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 a0BOjA3ZBuKvs675JGXSfR1t/8vdPC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmlB9JNTeznnhJsqEfP5k9KOh5MbliEi9b+yUyRQOBac
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa3JnITJGpbPSscF1Jdu5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:a1rOCK2a1dEuilU/WPjg5QqjBVZxeYIsimQD101hICG9Kvbo8P
 xHnJwgtCMc+wxhPk3I+OrwaJVoLkmskKKdjbN/AV7AZni0hILLFvAH0WKK+VSJcEeSmtK1vp
 0BT0EKMqyTMbEMt7eY3ODXKbgdKZK8gdmVbK/lvg9Qpf0BUdAs0++HYDzrWHGfumN9dNEE/d
 Onl7d6T0HJQwVaUu2rQnMFU+LAvNHAlIvnbRkaDR8q4guDgFqTmcTHOgnd0REEXzxVx7A+tW
 DDjgzi/62m9+q20xnGygbonuJrcXTau6h+7eG3+7woww/X+3GVTZUkX6fHsCE+oemp5lpvmN
 7Qow04N8A273/KZGm6rRbkxgGliV8Vmjff4E7dhWGmrd3yRTo8BcYEjYVFcgHB405luN1nyq
 pE02+QqpISBxLdmyb24cTOSnhR5wOJiGtnlfRWg21UUIMYZrMUpYsD/FlNGJNFBy7+4JBPKp
 gaMOjMoPJNNV+KZXHQuWdihNa2WG4oAxuASk8e/sSIzjlfhhlCvgQl7d1amm1F+IM2SpFC6e
 iBOL9vjqtSQsgfar84DPsdQNGwFnfGTXv3QSyvyR2OLtBFB5q6w6SHooncyoqRCdk1JNpbou
 WBbLsu3VRCO34HKaa1rdl2GjukehTAYd0s8LAt27Fp/rnnALb7OyyKT14j19Ggq+4SD8nSW/
 O5PoMTGPn+MGvoF45G0wriH4BIL3MTStcYt78AKiKzSrGiEPysigX2SoejGFO2K0daZorWOA
 p8YNDwTP8wqHyDSzvihgTNVzfjYUr6uZJqFq/C+fMPobJ9Z7Gl6GUu+A2EDuLnE0wbjkR3EX
 EOeo8O3M6A1DSLFSij1RQ2BvLuY3wlu4nIQjdWoQcRPwfufawevsj3QxEP4FKXYgJ6R9nbVB
 FSvE52/6XfFe3O+QkyT8+8dn+Ah3EQpHWFC5cQ85fznvvYRg==
X-Talos-CUID: 9a23:P91IR2N5GlSVu+5DCTB19HQeEckcXnD571vTPlaJMmoxcejA
X-Talos-MUID: =?us-ascii?q?9a23=3Akbi1DQ3ikgTY4EutljM4AqQwhDUj+fiOKxk/ks8?=
 =?us-ascii?q?9uPauGmszORiGvjHuXdpy?=
X-IronPort-AV: E=Sophos;i="6.03,244,1694750400"; 
   d="scan'208";a="126787197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aT9E2AynP/LMqaKltVy2lVEF168VCB0IaGtNxs1rzqDuz8buyk2Njzg6W8QvE+sh7n9elsmvPbtP6SZhM0Mp30x1NHksfYsN/TwNtWZf4tNfrsDvvGeYdO3aLDo+ZFroLi/uNFrFmmPGeRlvk7MhA4cUjkN1o7x8Yy97JA8GdxgBTJZaNdJ5lavc1ArJDygNj4l29/1uBw0mjMhhyEwyqkssI9Rls7V0wTAH0pOv76e3hRQMmazEb76bjcDDAYZtSzvbQxoIZyluWROFXAwL1+ZFzspeiFuBKz5SEmCqXnGlRdYdloZA7d5xkjUnpjKo/lRE5LQVPtF3v37wCQ/RxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fi9fYgWJaF3EWz08I2e1MYC4A0F8/UflcFe5VG6tA0=;
 b=KTmO9QxAk8j3RtOEIFEAKr0wnt8S03d40a5tlspNeb7zsz+Tvwws3zGhctmvbA6cz5GJG8jaDAj6w/9hDKlFDoIt4H0LkqtFWFkZYbIwOoVFtDFYsk1CITN1U/RAgDB9Otz6DRE+MzFZuM1X2rQnW8aogzq7KokToslgcTviE1hgmRhgAbD8u3cit54IzG1uWz1shBvS+XzKAwJzkR4K5ak4zPgAMJ8z/4PQZAmbMQ2H+4o7qgLbV0msP44LcO8ofHDsX5Mn5hdhfA2hFkR0Z9VbY0RcxlWDx7bEzkZiMqBsqYvmFPiLy8fxyK5HA2nQMpp4IiqAROH/Ime5BRBJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fi9fYgWJaF3EWz08I2e1MYC4A0F8/UflcFe5VG6tA0=;
 b=vwBy0zWydj4XbEYnsOtbyGIJYD6o28VFbA1QQ6cqGG21DVc7AdVUffosP/w5xMJJ1cd7X+LgmK+OdSlH9/HKO7WHXJ+mJawPi/Px4G5Niox+7TEauCpet+iUwLa+ToofQIgV4l41kdzaIYofR0rbOEURcr4sCNyneuy2gVboq0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 Oct 2023 10:17:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
Message-ID: <ZTYsC8dVcuADOSH1@macbook>
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
 <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com>
 <ZTKAqBILUBNelYCS@macbook>
 <7e1fb34868adfa51f1a48eb8d77f4b92643db85e.camel@infradead.org>
 <0c2f1fd0-22d2-419b-8fc3-4788563fe9f2@gmail.com>
 <ff1a67f7-8b33-4e7e-8e31-d5201f7212c1@citrix.com>
 <ZTYmOTBdAgTBliHI@macbook>
 <d45ae14b-b6e4-478b-a94d-954b80375d9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d45ae14b-b6e4-478b-a94d-954b80375d9a@suse.com>
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: e51f5253-4caf-4ea6-3d4f-08dbd3a0794c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GVSy+7zBED6YIHm4RKEvBnP28/LmSa3RdsvAb/1WDHNPG6OMBquirUptkBCrH+l73vU7V70WmorbxebVZNpCtgC5RVV3Or1sIlBKUmWUYMjzUWMGZUYs3onF615pjVs583FGOFhv7HhXcdwC3OerWrzK4q3TN+Sn/J8JiIAq2gN8OYuoeSRvSSwGXPw9zlDCmAWF4sjVLlMPXVbstludU/9RNQT6pgy2EgOVYqbiAKQQQSR9K3rp4Q9cwh5vljuru55Pn6w74DXBBEVnRZkY+MkQU1FF27lIirmj0XjqiHaCTDLm0cyS96gPlEzO3kjq/0Z926F33Uc6N6+NWuQCb8ovuVuSW2WbW9dv/2WsAtqfecI4sX9uDSFv1tlpAB+TOpH8LY1jdoItMcDe3GJ23a+uivb+OG8zksUJneULj4D1N03Tt7YH5tAXlN50DwJvMqoR5npbs5RFCRfIDBuscXN53EkdE/qv3AdpmDiY9FBWV03YmgoMMDEPBmxJzc9lI3xmrWNy1GmjEv1YS1DJW2oU+W5WjM0amlg+7HhEYVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(366004)(396003)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(4326008)(38100700002)(107886003)(6512007)(33716001)(9686003)(85182001)(2906002)(86362001)(66476007)(6916009)(66946007)(8676002)(66556008)(316002)(6666004)(5660300002)(8936002)(6506007)(53546011)(966005)(478600001)(41300700001)(6486002)(82960400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0lTLzhET0xkeUxwdDAwNitmUzZIM3AzUEozeTVqZGZDamNpcmpidUlwa0NV?=
 =?utf-8?B?MC9nL0hySWVpa2k4b3JsUCs2TTdYaFpxRzVQdFVsQVE1UExnby9uMVY2L09j?=
 =?utf-8?B?WFJ2U1hscUZqTkFMcDFUMXBJN01GZndaRWtSeHozVllseTVRajdubFJmbjZw?=
 =?utf-8?B?UTdPSWVrOVYrS2FuK1E2ODlrblMzd05leSt2aGt2QWpBMUhROWxkK29McDdU?=
 =?utf-8?B?bzRLYXNQeExmR2xCWTM0alFXcGhkc0RFT3BWTC81ZlNOYVAvdVJZQld6amRF?=
 =?utf-8?B?bzBReU1OM2tNV1lOSkI2VXBMNUs4ZWQvNk9hQ0xsV3B6Z3VQODExZUxsMjNE?=
 =?utf-8?B?SHg2UFYvV01ZTWg1eHFWUFcwTmlsS1YydkhaQTJzWTBNaVMzZ0E5b0ZUUllR?=
 =?utf-8?B?NnFGcEZJUGx6WUoycWtJbVFzb1FkbVZ2UGxkWXhMelBVa1ZXU1lhdHl3OFpp?=
 =?utf-8?B?OExQTEhvQmNmV3NiZ1gzcE1JSU9IS2MzQ3hTejMxbWJjS0FKQWRtbnRocGNr?=
 =?utf-8?B?S1p1aWRnUGZ1Q0tEbEpzZitJZkp3RzNLWGNudVNEYUZ1d3RWNWpJZ01hci80?=
 =?utf-8?B?SDE0MzYxZ1dBUkhqdm1NclplU0V1VGE4Mm1QRk1jV25vbDAwQ0E1OEUyM3NS?=
 =?utf-8?B?blJoMUJSVnBWd1Jyemw1OU1BbG9aN0NkaytsL2dnZHZGYmlraUI3dDdHVVdr?=
 =?utf-8?B?TlIweVdSc2hHMmN1dDViNUJZNzJ5REVDakFVc0haQ2g2UDJSSzVwSW02NVAy?=
 =?utf-8?B?RVVNNXUrbGFUUkRWM3BTaGxhSm1rc0lieHZ1S1RXdmphSlZQaEtjdGdoRjVV?=
 =?utf-8?B?NzROQ0FsT2p3UkZrY1JOMWNjOXFrZHJKaHZLU3lYVVFkbE9nVXM2blIwbGU5?=
 =?utf-8?B?OXc3b1RIQklDc2ZQb2dqNm5lRkdXb0ZBdjZzWWdySTh5d0pMdXQ5ZjRCZzl4?=
 =?utf-8?B?U1ROejNhSjBoZGY3b0JVbHVvQk5tcDBocS9zbnJQMzd6S09hNWg2K3lWajlB?=
 =?utf-8?B?L0YvVnFwV1NhcDAxWUpyNExOUmRDNDAvb1huK3Y3S1pVd3B0d0oyOFQyb21G?=
 =?utf-8?B?aGJRbktqWFEwRGlyd202NHV3bkJwZXgxajNyT29yNmdTSTlyb1dLemw0ZTlm?=
 =?utf-8?B?bzBrbGl2QkdOWUdQc0ovUkwxWk1ka3dpNDNMbVk2WnhkcTJkVDVpOG5IV0xP?=
 =?utf-8?B?U2FDQ1d5SDFyWUhaVW1sT2lRbmtLaWI0UGRQUkwvU21IYm5Qc3F4NmpxWThS?=
 =?utf-8?B?ZEZ3MHBQUFpnRlJiTEdKaTFQTTJqMExhSmZBRktBOTRBcVRGeGFwZS9xUmFK?=
 =?utf-8?B?OU1nSGhwMGhiSVVuYTV3azl3RnBiYjhDUlhSZElWcTdHbmJ5UVVvalQwRWRL?=
 =?utf-8?B?NnJKbkJwS3VTU0pSMEFUbHJtTWwvV0xrZE90ejhVekJINnRkR0RBVUJ3ZGNz?=
 =?utf-8?B?NHQ4RDBVUlYvRjVhejBHa013Q1Q5ZHVFZ2ZwaUZFRHNvWEo0VmhlM0pLc3Js?=
 =?utf-8?B?WTM5TFF6SlRJeko1L0VNN2N1SE5SZXpMZnhnejdSVGFlckxDdkhyeXJkRmFI?=
 =?utf-8?B?QnBWMFNVQzF1NHRWcG02czg0SFJhMUdwMzVSTDVLdldQL1ArbHFyOEZ2aWlF?=
 =?utf-8?B?M20vSEdvSjcxMnI4cjZJMUFNZTFnekNsUkhTU1JWTld5VUx3bjdyYXBtT0Uz?=
 =?utf-8?B?djgrZkdVVkt0RGVKYmc0L2Z1dllqY3F6djV3L245N2ZZNXg0RUVhSmxWM2Vv?=
 =?utf-8?B?V1RnYUp2NmhiZkR5SEk2OWE5cGJLcUNuWXhLVy9EK0FWOCtkZWkzUW9rbXRP?=
 =?utf-8?B?b3V6aTAwaTgvdmo1WmVYT3Rrem41dFp6TlRydDVSL0hsWkdBaktBc2UybDZH?=
 =?utf-8?B?Z0FQcGtiTm1Ga1haa21aYXVKOWtwTkhvZk9TWjNDamlnWU1KNWVTbDFQejB5?=
 =?utf-8?B?YTh2c1IzTHN1eFFFMHhveTAybHg0VGwreUF0bnI1OE9qMENkQThKV1JaZ0ZL?=
 =?utf-8?B?MmFBVDV3MWMycmJYYm1sRldCMTFlWDZKWnJuVGZMcHl0L05CRlhiMzB6SFNH?=
 =?utf-8?B?ZWhEYmk1V2xzVU92ZWdIYllEakVuSVZzMURGOGlHQ1B5azFESDU1ZThLMXVm?=
 =?utf-8?Q?fLoOHgk8XNng3F8uDYem+B/W+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LPWu6fPvtQ1zZHNkrdbczxdQkDjc5oLRqCoUGlLNMTePAx7T+5GDUNJZALMPyOUANKOQWFORO+8ah67mso2ukUbO4zaS4P5RkSzMEwA12z5RlmXz1e1Ari9xXJ7jtjw2FHbazOCFfXWtNI6oRqZ1uZvEvSIvttFZZjX2bIRLOBYwGaZHJlqG/dmDsfoCnriI454bBgBQtuE5MpVvLtAqC7Iiw0E33CmQcjiZtI8+UF5TCuP1okIjVHlCwmgIaG7ec3mYTxjmy3hlr0Ln+BZOfOApOcgRwz449T43EvJnRIXK5VfCxojJec3tWOztMsSdDWHcwin80buRzxi+GS5yd3XN+YJBd/ohZn4RRNgWVW+tj0eJhn8HJxiBek1rj09VOKY47+yq7ubJUFwoimOPD0mQBmf+ZZTm0uXT3vCzWcjVgT7vdh9X1TMhOC45Kl+kv/ej8cB33i1m76eGUAv9HL3zUrJfctiHAaOUh9ypzjvr9BnW0sSL5dRtXyxIDSEn7V4TzfV2gIpv1wsiO0ZJZL2y36Wbi89rdTl4bb9dXfzP6/3rVaYS6/Cgk3A3NG7FaHMCrpg/kg+/wuz24C9RZUsemlA+ibMEhDieVcG64DT6eFw1UuwexRbiDMdmgnhOFr0C26oDnpKfg+tgest1hJosqXKuaohh+ZBbDoVMowQIJvhq7NsMSIMoyPTuARQp81+wqqmvSnfX8h57Lsjmxif41IiCmyZvfghzUfuZOFqfGG7dxi+TDAcwN3eSyWve/z+yK2r9B5NRWxuxsJUJ0FMhHw5GFtRpcolfHQveicX/Ex5K9dACNPaJlB8mI8u/
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51f5253-4caf-4ea6-3d4f-08dbd3a0794c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:17:18.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSyjCIPLpfWTfwjCDsmkA5pFFske19Y/+jIWjIliZudo/Qg2Ds3fivOrtJYoe9GpjM8EmQOD2lIUcOlvPYQ/SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6771

On Mon, Oct 23, 2023 at 10:05:48AM +0200, Jan Beulich wrote:
> On 23.10.2023 09:52, Roger Pau Monné wrote:
> > On Fri, Oct 20, 2023 at 04:16:16PM +0100, Andrew Cooper wrote:
> >> On 20/10/2023 3:50 pm, Durrant, Paul wrote:
> >>> On 20/10/2023 14:37, David Woodhouse wrote:
> >>> [snip]
> >>>>>
> >>>>> [0]
> >>>>> https://elixir.bootlin.com/linux/latest/source/drivers/tty/hvc/hvc_xen.c#L258
> >>>>
> >>>> I'm not convinced I believe what the comment says there about evtchn 0
> >>>> being theoretically valid. I don't believe zero is a valid evtchn#, is
> >>>> it?
> >>>
> >>> gfn 0 might be valid, but I'm also pretty sure evtchn 0 is not valid.
> >>
> >> GFN 0 very much is valid.
> >>
> >> evtchn 0 OTOH is explicitly not valid.  From evtchn_init():
> >>
> >>     evtchn_from_port(d, 0)->state = ECS_RESERVED;
> >>
> >>
> >> However, the fields being 0 doesn't mean not available.  That's the
> >> signal to saying "not connected yet", because that's what dom0 gets
> >> before xenconsoled starts up.
> > 
> > Someone asked me the same a while back, and IIRC we don't state
> > anywhere in the public headers that event channel 0 is reserved,
> > however that has always? been part of the implementation.
> > 
> > If we intend this to be reliable, we should add a define to the public
> > headers in order to signal that 0 will always be reserved.
> 
> I agree a comment should have been there; it's not clear to me what
> useful #define we could add.

`EVTCHN_PORT_INVALID 0` or some such, but a comment would also be
fine, the point is to be part of the public interface.

Thanks, Roger.

