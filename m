Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBD5FB7C9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 17:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420380.665199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHZF-0006Wa-Jd; Tue, 11 Oct 2022 15:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420380.665199; Tue, 11 Oct 2022 15:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHZF-0006UZ-GA; Tue, 11 Oct 2022 15:53:17 +0000
Received: by outflank-mailman (input) for mailman id 420380;
 Tue, 11 Oct 2022 15:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kS0C=2M=citrix.com=prvs=276448a35=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1oiHZD-0006UT-Ox
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 15:53:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf41bed3-497c-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 17:53:14 +0200 (CEST)
Received: from mail-dm6nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 11:53:11 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 PH0PR03MB6706.namprd03.prod.outlook.com (2603:10b6:510:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 11 Oct
 2022 15:53:04 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::353b:c664:37bd:4409]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::353b:c664:37bd:4409%9]) with mapi id 15.20.5709.019; Tue, 11 Oct 2022
 15:53:04 +0000
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
X-Inumbo-ID: cf41bed3-497c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665503594;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+xvmkyZ/E8fK8igTCvvgWw/bIjuoZ3pgd41D/5FMsTU=;
  b=NvDbO7KoCurBaMTX2P+qeIBYLr6qesE93ICXm7PIjb//NleIzrzs59BX
   WwwN79TAY8ciW3V1Z3IAM+TvwCsGjUz2S+kGPxLRgvG4mFUREowRREqNJ
   fq6f3eLlOPQeP4/9NiE7+QF/SReVK/2vABN0e10tByBib2M3riAQclTwP
   k=;
X-IronPort-RemoteIP: 104.47.73.40
X-IronPort-MID: 82495932
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ADs7GJq0B5Creg1zWsPbDix16xRVVYHBdZcB5p?=
 =?us-ascii?q?9g8DSJ0pFHjZ4UTrseF4Mq/hLhYC2nMkxUFUfSHAGgGdRZowRtuGckO6qJSc?=
 =?us-ascii?q?LN2E/DahkmKa/tEXtFgN36lTP1e0cUndBy6k6n37BgtPZRFkYw9WPoSQQ9VQ?=
 =?us-ascii?q?e5fmjYEHWRoxm5KJfD/aTc5LDlEVC0tF6HoqRzXM78obcj9qXl75mW4d6kZW?=
 =?us-ascii?q?QBIUL/1u/AV2DnvigBrqcKX+fpzNtDMORXxkcMeSd9OPU+IGdJJ+SwSXJIzn?=
 =?us-ascii?q?+k8ySaA5QQiIUi2Sr+sQ2ypGEtNECiO7slTsg6KtZETuYWRm5+ep80CCI/uX?=
 =?us-ascii?q?R0Dzr/0D9/+eyv26ozhub9Qg8U9l/+83m/ryvnkOFk733o/UElBqbjscDiU/?=
 =?us-ascii?q?1NX5MirJAavxKmLNNopYYAzPLqdofyDHWhAGaB5ro3s8RfsPypN0dcHf/fTY?=
 =?us-ascii?q?IwEv07//IdA5fzI9VgES5Hgf3JtD0fWq/ixeeHeWf6NvZuS+QCbsqwqerP1Q?=
 =?us-ascii?q?JVDl0e911wtm6CT2H+9g/9yBbeabYCsbcD+eR81T6Nwg9e7TUG4Bmh7aitKy?=
 =?us-ascii?q?hZ1qGTIhxVnDg2qaULPXa/E1vDPTKb4E8MvZbSgLXxkiQJqDZXYWP31wyS/K?=
 =?us-ascii?q?hX09CAu6OE4PPkjIkHKDUPtXTFFrSV/64ClqZi7VNCMhXSRy5Q5U6awTxE8d?=
 =?us-ascii?q?hz7qe5ZDR4/LNicic+Yi4g2eRS2NgWos0YSnmBE0XhTs+RS9UgVkhyuBxcw+?=
 =?us-ascii?q?WOKD+ikzP7LGFEQZ9LshKxQao3uDqPoRNoYKELTUuRu/MEgWj+IGRE9+OaDo?=
 =?us-ascii?q?fMkLxbJFuyujkp2M0KhP91IVxfHrjz8ntp/n82yMVMRX8UeZX1Mvou/B/i/0?=
 =?us-ascii?q?HOnpMGavl/YmM8JmqIv536ANr4tSAPobBH44pZb4+pHGTXmhb7/+8g78a9Kw?=
 =?us-ascii?q?FFiiAwo13QWwaY4k8Nt9ViMGmT6Xk/HLfd8SAWnGvb/QKoSTy7EcS28wkqxn?=
 =?us-ascii?q?4TeNo85eL2BcdKeXKaYEXSISsBTiKHVvIARXj1F9Tgsi5Kz8k+Prz/08RCqo?=
 =?us-ascii?q?nPYfnzpyyitBeh75l/qo95VtRIWu2CHateokFf/mYK7EboNb02tv60V8hOtv?=
 =?us-ascii?q?wgMht29kOcG99jj1Lv4PSgaOf+6NQMgVuctIIWPvk6nA908HWnuJOZlhPtQI?=
 =?us-ascii?q?rJJl2RBgyv8pSIAYutmvxbPbBeZjKMcRZfJI9PkwJRMMTi7pzNPxF9sGAR3S?=
 =?us-ascii?q?vopEbxMzpBE7eOVanKs3U4MY2j74VNJCgR9kv10VEaQfjQAmVqDFUVjjPcZ/?=
 =?us-ascii?q?BGqkThOXSeNQ/K/BXAP5NzDHwEIrH0nRVtl9doWSVXRgCWNNMQ64J8nOvqDg?=
 =?us-ascii?q?3QiYApEx8QI2pOjkk2MxsaJ9x0oVIYgJUBbENArAXETolQXyD4Y8ekaVFNjE?=
 =?us-ascii?q?zICzPLGjJ+4bMHJ6v1lRtrnVi7uxb16AX1yu6zCFYs9hJh/72nlEy+To4TsM?=
 =?us-ascii?q?xKabAVaO0PJWFgKIV/+cOC10+smAYRJqm64qn+vM1n6SRCcncrGoHYKERVEg?=
 =?us-ascii?q?/rmFKzGoJuRM0wJYCNCrnS0+ljIGKLq11x3eckh64ylwDGUJDejd8QuDmauw?=
 =?us-ascii?q?GnuHHe0uXFGHNu9d/EFVls4D60rSa4u1E4Jx2zFu+ttwzKZtAnyaNw88lnka?=
 =?us-ascii?q?f0NumufXINvJhvOI5FV8m9edVpC221WCXMH04jU3rbNl6dp1Jy5bGdtrZL95?=
 =?us-ascii?q?9cVEKk+ZSv0VDUe8MQdYUyQcd1c+nwfyP4dI981XOjqpEBpn5Eqd/7I5Fr7n?=
 =?us-ascii?q?j9cYiB5P9EaQUCdWNcq6dokVQWS5OpLOF6qNSjDCEjsqNBb9U5ddRjqTLjOS?=
 =?us-ascii?q?s34OAVt+oq+E9WACvtISJk/MzkDjNhVG2rUGV29u+OCL4ArsmHLrJbaW1MLt?=
 =?us-ascii?q?wJL48vkBynyndJ2KOm6ZAkOBtQHU74wdLDf/IH7QRThcKuJ4i9DjuCTWmU/z?=
 =?us-ascii?q?06EPWJM0nNDSKYjFCpQ9Z1eUP8Zl8iRzyUtCf06Cpq2QdQj0fNh/PizbAh2r?=
 =?us-ascii?q?Qfdr1hjdfiQERGKKpfSDzifzQwJJUp9PEbNCZG5BcbMlUftC5Y7ACbJuAgi3?=
 =?us-ascii?q?u12f1lbbZlauerQlupR/0iPwEzPzyShIHEcv2S33EAPrRSXBx/0JANosM8G3?=
 =?us-ascii?q?oOMJTeUP1eoyWV7pwpojBhKCJo01O/KRt2L13ll0S3MGa68mL0EnK2aNYhEc?=
 =?us-ascii?q?/9NbXTQJUTMeMIwXRynR+tYrBJNHIaWSjSBwYS2itPAkvK6Z5iLjdTER+HMW?=
 =?us-ascii?q?ESQyHfcsae1pumxOEtnYhP3phYkqEbUUpX2cmx7+z9a88sZtLVwccHXO0tzx?=
 =?us-ascii?q?QoNqn6n8idRUPl46Ies0af1OI1JfR/bI9KGdGKkFy3h2jok/kf856i+8TU7o?=
 =?us-ascii?q?BHn9oUTUyfT5H0v0+87O1lUVQXp5YvJuJ864ox25bptGLXWV1dh4KhMuuGwe?=
 =?us-ascii?q?/pCRwlhNapu948KLzm8Ii/UZNyaWTK3dHBV0FyDZihufUsolYBzAF46744A+?=
 =?us-ascii?q?hUpeoqTsL13EPJ0qiqhRTYf0x/vC9CCi0JdiRZgkQ=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82495932"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TanR+fj6Lek1CCXQxQ60L6r7DKss43I5n946SYv5SkRaM3Kl8sHrxdbNf7DVeYzBXHQBJh4aFsHtJapIu8JKZHG9S/C4Msk9wTAmkqEcEFw/rYpa5JXkRWpnH6Vnfd/2UcvHgjaiYQS0xtTzG3vsTFTwbBrlWvfE51nydijGEFlzEx1TfL795qIBGQFan7uubkA/pMUo2EVzgrKNmoEGfYL3EVKJfO30u28EsCW86KnhYp5PPs8UqabpHYUtt4QHNosuM9N7dRoHs7YNbkLKzBF7FtqBx6SywPKfulQZIi+Ra4x23m5te8uDoluVsLRWIV3Wh4v6MzXAbz1+fwqW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZ7ExuzOTp8O8C3NGFcNskr/VK/eO07S0mvlNM3K458=;
 b=ZjhY/xYpRr+APmmet5jUviKIbtXRGWFOGGsnLKNw/AXW3k0KR9ztmXPwkK68gpyMJ1qC5E4FL3qnk3k0pLipcyZ+qk50W5cckR8hNqjcRbR4NCG9KXSrTODfDGS5jMn6t4MeLEKJ5fpFnEW2x2XdnIrDhOCMkzlSHGZali3zWvGS+ctH4Lr1BfvTfu8UfEvj44xKeXLOQk9sqqzIxCDTxIpr8fyqPwzadO/Lrr4VBkMnFsH9ut9xNs0hNG1nr+W6XswfBJLTbbBY1zX3fLDxPp/rVotdKGnYq+OYfGKjuff8vV1M8/1MwSfgzt+g8nbIQItSghQF3RoR0A8GRmpnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZ7ExuzOTp8O8C3NGFcNskr/VK/eO07S0mvlNM3K458=;
 b=b5AHzniwyYXRV0H4IvLs9no1DRMM712+FPdHLsQqtwo65Jsgd0HmQlcJaWWm+71MTG9Fo+q68jPxvSuoxVYuunf0ey/WKSQqC/WwOb6ioEc1L3+0brSIfLRhM7J10rOR4aDjrzf8zg2ke7/JV6t2ZBUp1lyNyrYhZpERg4LHHd8=
From: Jennifer Herbert <jennifer.herbert@citrix.com>
To: Jennifer Herbert <jennifer.herbert@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "wl@xen.org"
	<wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] acpi: Add TPM2 interface definition.
Thread-Topic: [PATCH 2/2] acpi: Add TPM2 interface definition.
Thread-Index: AQHYyUN9uwGs56YGXEqEHrC97S9QC64JgBRQ
Date: Tue, 11 Oct 2022 15:53:03 +0000
Message-ID:
 <DS7PR03MB5414DE39CD2F506EDD49D822EF239@DS7PR03MB5414.namprd03.prod.outlook.com>
References: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
 <20220915204029.1227112-1-jennifer.herbert@citrix.com>
 <20220915204029.1227112-2-jennifer.herbert@citrix.com>
In-Reply-To: <20220915204029.1227112-2-jennifer.herbert@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR03MB5414:EE_|PH0PR03MB6706:EE_
x-ms-office365-filtering-correlation-id: 991e4a33-f77f-4961-b8de-08daaba0aea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 P2Nd54sIt09l/s9TQqHcMSZOiDP6JFNcZkXBgtLLa8Do8L6JCrCHFYS5Bmukqkj7MSg6xyxQiPYbwysFRpTPAU+ECwH5FbZJ7kJE2kg1hQ0NsaVDoqO/OiiMKYrQ4YMjKMakQKZKnQwd9hqCMUMuTZMqNW6nFv9rEZEMLh6Ok0qAjiigdJJaLSVGSJo421KpkxFDLV7pEVg1+/dZXXU5P+9WXp2icR+f+AR2Em9dqLsBWeoVM+ZTOApd1t9gsLHKTD/WxLUqu4HKbtBctVsK97Fs9gxmTmWqXYXiX4b9sdSZyGvtuRIK0ERAAjHNALe1khsN3MMqiD2fBfGBX8uL9f0IAqlNU+4WZLcnGhTgU7+gE1nkap2aaO6hscHUYnAVriLLdNVIexKEWTseI9BWiBCF7sd0h4nDHZpS56crraYnlG+td2JyCyYE8ntLEEF3J/Bc3PSqyjyb+avRqLdcaKLlJa+yGtC7YNItVkxNhgEhrzEeyntMM4sbZOwrbgI/a+k3iGNw4ep96GtbiW3+CXzPR7+bVucmtcylDz9FjlquB1+CeClRfvEcKsNHp8mV58FGiu+CwMpu7oigfPel35bVtlbBxgRD6i0ETFH4J5IgZKiCVIZdR8e+eXofVXwYBjzpyGt+godncusGQLuZVMMI+GpHMauNzGBDvwYOjPNEjQrsysMEaLEo3jQzENUi01gnXreJkFhdOgUQpKU4RykHUccXjWO047G5T/YtXd0Q1LvPTai/VmcYdHGShjFKZH4jiF9K9Xs0G8Atc4r0gmH3uWrzn7yk9/AO4uRgRTw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(9686003)(7696005)(33656002)(71200400001)(82960400001)(86362001)(38100700002)(83380400001)(122000001)(38070700005)(26005)(4326008)(55016003)(66446008)(44832011)(8936002)(186003)(2906002)(41300700001)(52536014)(53546011)(76116006)(66476007)(6506007)(64756008)(66946007)(478600001)(110136005)(8676002)(316002)(6636002)(5660300002)(66556008)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PTmDXBQk6CpZ0mfMJVVZkGorhGpGjFkumUs+HIzy2vdKVFMQhKnyEqGBp/Ld?=
 =?us-ascii?Q?+lQhIn8XZK/v6Phmasg2KZ2zN+ojcgkAdJazPGy0bpDgitAn4VCvfJxP4Y0T?=
 =?us-ascii?Q?RaGamQI2LJFxPAx4GwVg34JlBz7cONHqftyALZt1xsM5TtIn9T0rAT0URV+8?=
 =?us-ascii?Q?4h/loEgEf11228UWueOQgEXC3sqyFIf+F++7QXl07vcSQXjujDCzzvj5fuFZ?=
 =?us-ascii?Q?SJ60EhptVZw4Ljo4xq9hgGKOMpYA4C7bQzXWi17mvpIlgRQ+Rs8ajHPonV6C?=
 =?us-ascii?Q?DfvG9cUSoBhNPuhKMPNr8yH3QD+MhkmS86lZ22aQWw/SnWzK4ZeMkPrXFHVK?=
 =?us-ascii?Q?3kO1M/shz05rvPs5DqDcMN68dqJD1fi7ZTZgtsAzJqSBcF4LY3tSiuxgWbHN?=
 =?us-ascii?Q?KnYE5VL+5LvSFLe/lpElmSxQzOMBWPoZrvIOBVojdRLjLSVIQiT556Gahg4q?=
 =?us-ascii?Q?5IIeUuyrbGbUcBz6Mqfn4hKI3TtnmIGL3RAjUuN5RTOfHBvOY6058tysWh+k?=
 =?us-ascii?Q?LsBwh/zThFtiUYQYBM8JIwOV4gtqiFfRJsEh6o/dSTzGXIIxSfVijAF6/mUd?=
 =?us-ascii?Q?LQ2P0pQsoZ/8V5uVACf+vu9oQAusuGgvAesK19/fPnsYon1pEWfBDY4cpF8L?=
 =?us-ascii?Q?dXsZu4Ao1OTdKrXWZmbOt3lk8TH1e6RPz6p1ZWweWlZvuJztQlqheAHuV+G7?=
 =?us-ascii?Q?C8SUl75Pl5KPduvJnFnPNpfL/UtMNFcJxjgXicgQg75lfGRYfYpGvgzQm59x?=
 =?us-ascii?Q?+aPNcwag6eEywXAK0PoejvenA9EVAdqGZruFSA910B3zKBDGkQzgXpgZ9zbi?=
 =?us-ascii?Q?YRIs2XMyrY//Y2+zZFofRK0B6UnvjFp2UphQjbkd77Qk6pYetjLJ05fmJNqv?=
 =?us-ascii?Q?0QyrCl58lF2WmSy64ZIgzRVqrhiS56bzy8SpnzeegijfO0ZqIAHo3N4ZbzR3?=
 =?us-ascii?Q?HWWvQQACldpUziSj1McTZpbO9i2A4Oq9n0hHoephU/Po5iUJ6onhSlozAz2A?=
 =?us-ascii?Q?k719hKC2PG1vzRrXLDKC4gzw2rlqnZleCOt+TRu9JUJR8JVtAQ89738oq++b?=
 =?us-ascii?Q?izAcHc41NSw9zCVOWMIs2Q1MGqWNXTPBkrXMd64wrWbDl4GwyF7aywiU/GBS?=
 =?us-ascii?Q?/jlRcWBJXIWg98VGBaQaHeUj0AvplUSbvlrF2MS4hwOIKH7+Y7CF8PaLvgod?=
 =?us-ascii?Q?oaPHfcRcahX77QU7PAWi5/Ndk5qyS/UVk5ovC0tCW2kwgj+VAP2EYC/zuRu5?=
 =?us-ascii?Q?x0lYHLrIb/MeNWUGXSvUlyr26o2Ghv4/BuguWuw+jBIBEuBO9qAX/jgk0OCb?=
 =?us-ascii?Q?5JlrQeD2pfy4Z/Z/KKd5GNsDsYdlblXh5ZHzI9zxhjl1DVztUwzxnVpiocLP?=
 =?us-ascii?Q?di+an1MLNil9XglOnO1peE71YZ1h/iW15Yg3voQStpq6MqYOp7tK76OeKVV8?=
 =?us-ascii?Q?s8sPdpuOTSstHlMUFqSZzz91conD+SEOvfr6ZBnD6jIyoI3BLtib4btjiLhp?=
 =?us-ascii?Q?qs9fivU/yinBsLvKaYVE7Hj8a1JsnjbfuLH8XzZEkNrc7qfVXOuBUqrS6ZQ9?=
 =?us-ascii?Q?tF3f5N3XNV+76hE/lJVoC3kfO3NxsjvC12B7jUwrPOgFYvCz3w3jIhCpVtmO?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991e4a33-f77f-4961-b8de-08daaba0aea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 15:53:03.9403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gnDj9kSSHDVVPLUCISM2/drFvlKhsMspRLUW31wLDSwtkC674JGpYM7QHRqpN41ffXT8hl56heHOAgxyHx1miBL4ZU8fLexLuRx0JoFtYCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6706

Hi,
Are any further changes needed to upstream this patch series?

Cheers,
-jenny


-----Original Message-----
From: Jennifer Herbert <jennifer.herbert@citrix.com>=20
Sent: 15 September 2022 21:40
To: jbeulich@suse.com; Andrew Cooper <Andrew.Cooper3@citrix.com>; wl@xen.or=
g; Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org; Jennifer Herbert <jennifer.herbert@citr=
ix.com>
Subject: [PATCH 2/2] acpi: Add TPM2 interface definition.

This patch introduces an optional TPM 2 interface definition to the ACPI ta=
ble, which is to be used as part of a vTPM 2 implementation.

Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
---
 tools/firmware/hvmloader/config.h |  1 +
 tools/firmware/hvmloader/util.c   |  7 ++++++
 tools/libacpi/Makefile            |  2 +-
 tools/libacpi/acpi2_0.h           | 26 ++++++++++++++++++++++
 tools/libacpi/build.c             | 35 ++++++++++++++++++++++++++++++
 tools/libacpi/libacpi.h           |  1 +
 tools/libacpi/ssdt_tpm2.asl       | 36 +++++++++++++++++++++++++++++++
 7 files changed, 107 insertions(+), 1 deletion(-)  create mode 100644 tool=
s/libacpi/ssdt_tpm2.asl

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/c=
onfig.h
index c82adf6dc5..4dec7195f0 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -56,6 +56,7 @@ extern uint8_t ioapic_version;
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected =
*/
=20
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
+#define ACPI_CRB_HDR_ADDRESS 0xFED40034UL
=20
 extern uint32_t pci_mem_start;
 extern const uint32_t pci_mem_end;
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/uti=
l.c index 87bc2d677f..6e5d3609b9 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -1009,6 +1009,13 @@ void hvmloader_acpi_build_tables(struct acpi_config =
*config,
         config->table_flags |=3D ACPI_HAS_TPM;
         config->tis_hdr =3D (uint16_t *)ACPI_TIS_HDR_ADDRESS;
         break;
+    case 2:
+        config->table_flags |=3D ACPI_HAS_TPM;
+        config->crb_hdr =3D (uint16_t *)ACPI_CRB_HDR_ADDRESS;
+
+        mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT, TPM_LOG_=
SIZE >> PAGE_SHIFT);
+        memset((void *)(TPM_LOG_AREA_ADDRESS), 0, TPM_LOG_SIZE);
+        break;
     }
=20
     config->numa.nr_vmemranges =3D nr_vmemranges; diff --git a/tools/libac=
pi/Makefile b/tools/libacpi/Makefile index 60860eaa00..125f29fb54 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -25,7 +25,7 @@ C_SRC-$(CONFIG_X86) =3D dsdt_anycpu.c dsdt_15cpu.c dsdt_a=
nycpu_qemu_xen.c dsdt_pvh
 C_SRC-$(CONFIG_ARM_64) =3D dsdt_anycpu_arm.c  DSDT_FILES ?=3D $(C_SRC-y)  =
C_SRC =3D $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES)) -H_SRC =3D $(addpr=
efix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_lapt=
op_slate.h)
+H_SRC =3D $(addprefix $(ACPI_BUILD_DIR)/, ssdt_s3.h ssdt_s4.h ssdt_pm.h=20
+ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slate.h)
=20
 MKDSDT_CFLAGS-$(CONFIG_ARM_64) =3D -DCONFIG_ARM_64
 MKDSDT_CFLAGS-$(CONFIG_X86) =3D -DCONFIG_X86 diff --git a/tools/libacpi/ac=
pi2_0.h b/tools/libacpi/acpi2_0.h index 2619ba32db..f4eb4d715b 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -121,6 +121,30 @@ struct acpi_20_tcpa {  };  #define ACPI_2_0_TCPA_LAML_=
SIZE (64*1024)
=20
+/*
+ * TPM2
+ */
+struct acpi_20_tpm2 {
+    struct acpi_header header;
+    uint16_t platform_class;
+    uint16_t reserved;
+    uint64_t control_area_address;
+    uint32_t start_method;
+    uint8_t start_method_params[12];
+    uint32_t log_area_minimum_length;
+    uint64_t log_area_start_address;
+};
+#define TPM2_ACPI_CLASS_CLIENT      0
+#define TPM2_START_METHOD_CRB       7
+
+#define TPM_CRB_ADDR_BASE           0xFED40000
+#define TPM_CRB_ADDR_CTRL           (TPM_CRB_ADDR_BASE + 0x40)
+
+#define TPM_LOG_AREA_ADDRESS        0xFED50000
+
+#define TPM_LOG_AREA_MINIMUM_SIZE   (64 << 10)
+#define TPM_LOG_SIZE                (64 << 10)
+
 /*
  * Fixed ACPI Description Table Structure (FADT) in ACPI 1.0.
  */
@@ -431,6 +455,7 @@ struct acpi_20_slit {  #define ACPI_2_0_RSDT_SIGNATURE =
ASCII32('R','S','D','T')  #define ACPI_2_0_XSDT_SIGNATURE ASCII32('X','S','=
D','T')  #define ACPI_2_0_TCPA_SIGNATURE ASCII32('T','C','P','A')
+#define ACPI_2_0_TPM2_SIGNATURE ASCII32('T','P','M','2')
 #define ACPI_2_0_HPET_SIGNATURE ASCII32('H','P','E','T')  #define ACPI_2_0=
_WAET_SIGNATURE ASCII32('W','A','E','T')  #define ACPI_2_0_SRAT_SIGNATURE A=
SCII32('S','R','A','T') @@ -444,6 +469,7 @@ struct acpi_20_slit {  #define =
ACPI_2_0_RSDT_REVISION 0x01  #define ACPI_2_0_XSDT_REVISION 0x01  #define A=
CPI_2_0_TCPA_REVISION 0x02
+#define ACPI_2_0_TPM2_REVISION 0x04
 #define ACPI_2_0_HPET_REVISION 0x01
 #define ACPI_2_0_WAET_REVISION 0x01
 #define ACPI_1_0_FADT_REVISION 0x01
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c index d313ccd8cf=
..d4f25a68d2 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -19,6 +19,7 @@
 #include "ssdt_s3.h"
 #include "ssdt_s4.h"
 #include "ssdt_tpm.h"
+#include "ssdt_tpm2.h"
 #include "ssdt_pm.h"
 #include "ssdt_laptop_slate.h"
 #include <xen/hvm/hvm_info_table.h>
@@ -352,6 +353,7 @@ static int construct_secondary_tables(struct acpi_ctxt =
*ctxt,
     struct acpi_20_tcpa *tcpa;
     unsigned char *ssdt;
     void *lasa;
+    struct acpi_20_tpm2 *tpm2;
=20
     /* MADT. */
     if ( (config->hvminfo->nr_vcpus > 1) || config->hvminfo->apic_mode ) @=
@ -449,6 +451,39 @@ static int construct_secondary_tables(struct acpi_ctxt =
*ctxt,
                              tcpa->header.length);
             }
             break;
+
+        case 2:
+            if (!config->crb_hdr ||
+                config->crb_hdr[0] =3D=3D 0 || config->crb_hdr[0] =3D=3D 0=
xffff)
+                break;
+
+            ssdt =3D ctxt->mem_ops.alloc(ctxt, sizeof(ssdt_tpm2), 16);
+            if (!ssdt) return -1;
+            memcpy(ssdt, ssdt_tpm2, sizeof(ssdt_tpm2));
+            table_ptrs[nr_tables++] =3D ctxt->mem_ops.v2p(ctxt, ssdt);
+
+            tpm2 =3D ctxt->mem_ops.alloc(ctxt, sizeof(struct acpi_20_tpm2)=
, 16);
+            if (!tpm2) return -1;
+            memset(tpm2, 0, sizeof(*tpm2));
+            table_ptrs[nr_tables++] =3D ctxt->mem_ops.v2p(ctxt, tpm2);
+
+            tpm2->header.signature =3D ACPI_2_0_TPM2_SIGNATURE;
+            tpm2->header.length    =3D sizeof(*tpm2);
+            tpm2->header.revision  =3D ACPI_2_0_TPM2_REVISION;
+            fixed_strcpy(tpm2->header.oem_id, ACPI_OEM_ID);
+            fixed_strcpy(tpm2->header.oem_table_id, ACPI_OEM_TABLE_ID);
+            tpm2->header.oem_revision =3D ACPI_OEM_REVISION;
+            tpm2->header.creator_id   =3D ACPI_CREATOR_ID;
+            tpm2->header.creator_revision =3D ACPI_CREATOR_REVISION;
+            tpm2->platform_class =3D TPM2_ACPI_CLASS_CLIENT;
+            tpm2->control_area_address =3D TPM_CRB_ADDR_CTRL;
+            tpm2->start_method =3D TPM2_START_METHOD_CRB;
+            tpm2->log_area_minimum_length =3D TPM_LOG_AREA_MINIMUM_SIZE;
+            tpm2->log_area_start_address =3D TPM_LOG_AREA_ADDRESS;
+
+            set_checksum(tpm2,
+                         offsetof(struct acpi_header, checksum),
+                         tpm2->header.length);
         }
     }
=20
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h index 914361=
6130..b5d08ff09b 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -80,6 +80,7 @@ struct acpi_config {
=20
     uint8_t tpm_version;
     const uint16_t *tis_hdr;
+    const uint16_t *crb_hdr;
     /*
      * Address where acpi_info should be placed.
      * This must match the OperationRegion(BIOS, SystemMemory, ....) diff =
--git a/tools/libacpi/ssdt_tpm2.asl b/tools/libacpi/ssdt_tpm2.asl new file =
mode 100644 index 0000000000..1801c338df
--- /dev/null
+++ b/tools/libacpi/ssdt_tpm2.asl
@@ -0,0 +1,36 @@
+/*
+ * ssdt_tpm2.asl
+ *
+ * Copyright (c) 2018-2022, Citrix Systems, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as=20
+published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+/* SSDT for TPM CRB Interface for Xen with Qemu device model. */
+
+DefinitionBlock ("SSDT_TPM2.aml", "SSDT", 2, "Xen", "HVM", 0) {
+    Device (TPM)
+    {
+        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Ha=
rdware ID
+        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Setting=
s
+        {
+            Memory32Fixed (ReadWrite,
+                0xFED40000,         // Address Base
+                0x00001000,         // Address Length
+                )
+        })
+        Method (_STA, 0, NotSerialized)  // _STA: Status
+        {
+            Return (0x0F)
+        }
+    }
+}
--
2.31.1


