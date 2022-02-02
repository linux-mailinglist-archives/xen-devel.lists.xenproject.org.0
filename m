Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E194A7381
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 15:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264272.457310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGtF-0007xT-BQ; Wed, 02 Feb 2022 14:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264272.457310; Wed, 02 Feb 2022 14:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFGtF-0007v5-8A; Wed, 02 Feb 2022 14:45:45 +0000
Received: by outflank-mailman (input) for mailman id 264272;
 Wed, 02 Feb 2022 14:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAZh=SR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFGtC-0007uz-V9
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 14:45:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7dec8da-8436-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 15:45:37 +0100 (CET)
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
X-Inumbo-ID: c7dec8da-8436-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643813140;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6kXWJHyQ9JH1ETeavJLNiKUEZ8f6LOBjCmX/ZvyRE18=;
  b=bRMVq1px5weeJe1Y3Iun1GAFYWkxjcxMe7Ik+NejXhB0YarfuLB5xY3w
   LXP+YFoD/1MKzoI/DII+4NI4YYL6qu+nm//KLbhc/1ehW7tkaK5DrmOMj
   D5qcPAQQe/DnqnyZywPyRzdYsQpcejbn099kSJCKhUou2le8MQTHhPf6j
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MkPhPY26NqdhySkiQOxXoGDFIPCHkHrQ14JS6IaGTGP5Li2/FmyKwKKqVACbnrIgQHHg/od6wm
 J2uHnP8GR9RKTTcm6t6Bhuiq+alENWnVA+tFgtBMm4kEbEB4KCwy4zixR+4jbJgTfbqJel9/xt
 O72DEkC/7zGQ2pOrGqG2J1mr9RZKTzbi/eyH4Pm8iLLd6atiG1+Kh6ir/cS69I2lnr6OoNJfIa
 DfcMvggcoBAMvZvr6C7JGokf3AfE6nbzg0LPz+jXkYBXz7OYb+ZfojUPB7529hVowO8PYga6Mp
 aZRvWUqb6FmmfcuUw7X7e8th
X-SBRS: 5.2
X-MesageID: 63329457
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:k+eqLqvbcwwXU6uUKJ9Ndryzu+fnVN5ZMUV32f8akzHdYApBsoF/q
 tZmKWGCaarfZjD8Kd1/aIy/900GvcDWnNIxSlQ9qChjRXgQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YLhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplsaC/VSN5Aq/wqssjFCIJASBxZbZ4weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsVR6eCO
 pVxhTxHVDHxZTBgIEUsFYNkxcuwjz7PV34HtwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ7vd3hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAREWAeQX84Tzc3zOekm9Ahjx2XVehaRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yLyFWyzyGsnTKuMDirjUWSxC
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKFTYoHg/NBPJgTCFfK0QfUYXY
 s/zTCpRJSxCVfQPIMSeG4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjPHW/2dNNfDgicChqbbir+pc/XrPSfWJb9JQJVqW5LUUJIdI1xsy4V47go
 xmAZ6Ov4AGu2CSaeVjWMS0LhXGGdc8XkE/X9BcEZD6A83MifZyu/OEYcZ42dqMg7+tt0bh/S
 PxtRilKKq0npu3v92tPYJ/jgpZlcRj31wuCMzD8OGo0foJ6RhyP8djhJ1O9+C4LByuxlM0/v
 7z/iV+LHctdH1xvXJTMdfai71KtpnxByuh8aFTFf4tIc0L2/Yk0dyGo1q0rI9sBIAnozyeB0
 1rEGg8RoOTA+tdn8NTAia2egZ2uFu9yQhhTE2XBtO7kPijG5Guzh4RHVb/QLzzaUWr1/oSkZ
 PlUkK6gYKFWwg4SvtMlQbhxzK8469/+nJNgz1xpTCfRclCmKrJ8OX3aj8NBgbJAm+1CsgysV
 0PRptQDYeeVONnoGUI6LRY+arjRzukdnzTf4KhnIEj+4yMrrrOLXV8LYkuJgS1ZarB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxKUpX2jgcLy01ZZc2OAyD715iDdtFQPxR4O
 TSTnqfD2+xRy0eqn6DfzpQRMT6xXagzhS0=
IronPort-HdrOrdr: A9a23:+VPMEaCr9U3JOYblHehAsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90c67MAnhHP9OkPIs1NKZMjUO11HYSr2KgbGSoQEIeBeOidK1t5
 0QCpSWYeeYZTMR7beY3ODRKadd/DDtytHOuQ6x9QYJcek8AJsQkjuRRzzrW3FedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0gU/LYr9PGuZr6aVpebiRXozWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yv47ohQmvHm1txfbfb8wvQ9G3HJsEKFdY5hU7qNsHQcp/yu0k8jlJ
 32rxIpL61ImgfsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpp3YIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuJYO5lbZvsn+9La1wXR4TsOscYa
 lT5YDnlbxrmGqhHj/kVjIF+q3uYpwxdi32N3Tq9PblkQS+p0oJvnfw8vZv7EvoxKhNNaWs2N
 60QpiA7Is+NvP+TZgNc9vpEvHHfFAkf3r3QRGvyBLcZeQ6B04=
X-IronPort-AV: E=Sophos;i="5.88,337,1635220800"; 
   d="scan'208";a="63329457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3hX2pVMidF2987nRF7KtkXtyoijNnd3Vq1Q7S9ZM+UbSE91CL/bxomMQ4wYrQ4+BSQsMKICApu+CdZbzO7aOH62o7qO7jBYYkWqZuN07V6uaKobqe1/hhdXSFJxvUmlBfA2sKeO2kjCd28vq17oC3aDDblk4VJV7luCBtURgwy2I9sfOZ94SJyfTv/RJnQJdB+RrVCcaE9Q5B5kZ/Hb3nfUlv67RrLUlB9wTv43YBzWu0c0xRsb5fL7hC6RkGb9rncn10c7Rn0nWeuC37cVNiYu7T0sbM+oya0r+y95sPoJbDPV3WMbi0B/CN1tjbQHdpobJ9VnHwnLrKTTFXYXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sZyzVC3JRNwT9aRZuSsyTGUzKM7BvPWaKzuv2Xg9fc=;
 b=XqrPzk208Cg8zSmU20t4tpDDbG5H1czHkKEPBHi+OH9Ph8NhOKGLMK25XOIITaDQr9IgeulC/r2RcJwa99+jpFRl4I9Wzh1W/H3GA6kwSeb3MjwkKVvtpXFW2PuLp9COJ4Ip8pBl8H/xN7JUwubiQG27ed9fkASV5y9v4o1TaP4n/NqEKguH3CpHo7edoN6oWYaOOCC02KDtwJ/gbQE5DLBqHZEW/NkrDPQJCfBxuXNw/KmA1j70QSMwPUem1xrUFUJC/dTFc5GtfUxSrJ7B5+DYAD0P1ivXNMA3LmMMxGco+y5rXEvEC+dt30r+nxhjPsuWOhZRj8+GG7ZIQivoSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sZyzVC3JRNwT9aRZuSsyTGUzKM7BvPWaKzuv2Xg9fc=;
 b=Pn6lL25e33yI+hxG5yP06TSnr1V6Lw7ebhdA6DopVLURQDJ8M+ivUwYLbQF9rjcqcJjDr3rEbHRD6OefYAMLP7gAwfyweV73c7VnAxT6BbBS6/f2Fx1L0wZdWQQ0BUN3PdA/u4n/TC1cYAreWu4KJTmtg2GawArl0WTAGDDxSCA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH v4] xen/pci: detect when BARs are not suitably positioned
Date: Wed,  2 Feb 2022 15:45:23 +0100
Message-ID: <20220202144523.10709-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0389.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50011865-f1c2-4854-7d1f-08d9e65aab4c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4506:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB450650827E6F4ADA3EB3E1C28F279@DM6PR03MB4506.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cY9TLLqpUAncW3G/7ItAtTJjasMo/Pvvv1KMkZuv4kXf1hAc2goBgQzQ+sulDPDdoon7Yqgya2hUEcljdSXclQyNfeTzpA0+ML21qeErQtsXWtKFWKgruTsVDyvKZIz+fCFEEXFlTvfs7SO9zdv0JDcmbmiFwuq/sXVg4TdoD6XeaoQ+9L9wTX4yxEvayPiyzgC3edKNShp+/HPlbBD24iIrFgJF/mHnDXEwrSPnA+eA6veoElMtYbyrN8ddetfwHyzAZf7Yw/XjdkkfLf8u/UqYHaYtgT/dZJeuSgSojUxPNcQZg5P4HHMQmqhoI6Olsg7j/nTI3q7s30D2lbzpOl0hUVp4DiP+1+JX6mvFZS9wTBmRYp2J7tfTcrN3jnbfex8pYnSSHU3BzVIrB1eSaX9EbLN7zzlJCJUVezHQ3TsSxvSX4e1+LbfjzMLPva9wR3MHqaysPJRb7eBc7esys7vFnLJ4EUEoEi+Woq5Boq149jUNaTMqqxFLu+IV9AWTaMeyl1cxM2Eae8a905Wfr8qzkMEb0uyriZzpap7uN3kmc94UYS+X4IyMDv5aGlehKRqLpvxayhiafwuauU7YA3hud0tSFvH7qo4uTfEpGprMm/GVjpiKUpgBkJVJ4IMHf3jKqx0PzphX2iAKxwZF1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(26005)(86362001)(2616005)(186003)(5660300002)(1076003)(6486002)(6506007)(83380400001)(508600001)(8676002)(66476007)(6666004)(66556008)(36756003)(8936002)(6512007)(4326008)(316002)(82960400001)(6916009)(38100700002)(66946007)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1pBSlJGMjlQVU5MWUdTZThBRDFQbjRYMEJmcFJjRGFKZDJTZjU5WjdEbE1D?=
 =?utf-8?B?WlJ5UGZsOWoya3FrY0NaMjRPN0tnQk5yaGdaR0ZYQzZsenhJQW53WFhOTTN4?=
 =?utf-8?B?K2FBZDVVSFhSa0NQek5sS0hWTU9yRFRVVFZBWEF0RkxPUTRGOGY5UzVWOU03?=
 =?utf-8?B?Vi9OSFpBZ0RwVTAzcGpxcjN0ZUJ1VWw5ckZQcWk4elBuV3dsZ2lZWW12aVdU?=
 =?utf-8?B?TzlwQnl5K09TUVRrVjNNc1diNjVPajlKN3lWSVgyVlQreEx3ay8rNlJud3pq?=
 =?utf-8?B?SzRpSnQ4NEtKdEJMOEdXTW1ud1UxRVNIa3Fnck5vS29sYWVmSkxtYUtwaVph?=
 =?utf-8?B?cnYyVlNNb21TTDZhWWU4MCsxZ254TFhSWXBuQm5tNTEvaGRRSEhsT1JPeW8w?=
 =?utf-8?B?VE0yRGlKOEZKL2JVQkFoYnJkQzA3ZzRxelBOZlpNT0o4RGRIanFGdC9yZkdt?=
 =?utf-8?B?RlFPSU5NSjluenBRRDdYV3dXd2VJZ3hBR2c1b0YvN21wMnhZSWx6eGRiRmJn?=
 =?utf-8?B?RlZQR3QrZ0g2ZjVhV01zRnhKcjg3dVBKdVhXZkVicVMvWHRHNVExYXlIdnBR?=
 =?utf-8?B?V1ZOL0JkMjJVWHZCM0Y2dmNldkNBZFd2QkRFRndJajQvWEVTaGthdGhtN0Vw?=
 =?utf-8?B?ZU5SRGExY3FjM3poWVE1UkFKd0Npamo5azlzSVZrS3ZYemhLRGxIVzJWbzZ4?=
 =?utf-8?B?OTEyc3BUOGNjY3d5VTYzNzk0TWJjTjZyU052YzVYUXNHWi9xNGErTkpQM3A4?=
 =?utf-8?B?KzJ0ZUk5cm9hL0hhemM2dWRGWjNNcGtKN2NnaUhnSzE0SnF0b0Z3L1J1SEZh?=
 =?utf-8?B?cEZwRk1JY2ZQdm9hSHE3cXNWZ2UzSE11MnNFcjdUY20rV3BIQzZEM1pFa1Rz?=
 =?utf-8?B?MWhna2pkUVpINEhzL1RISS9wMmNJUHJtamdoQTJnRjBhSnB6T0ErT3ZmN05h?=
 =?utf-8?B?NEh6V29mbWlibXlyVjFOMGc5WlllUFlZTFVmWWJTencyYU1LcjNZOWV6bG9j?=
 =?utf-8?B?RmlyWE4zbHNNdGV6ZjNQZWtRN1RZU2ZaWGdPT0F6TEhRYzZ3LzBucFptM1BY?=
 =?utf-8?B?dDBKdk1FZHpaQTdhUXlUVjNRMzBhTUlQM21KUVdxQ1U5YlVBWUxpbkU5NURt?=
 =?utf-8?B?cU14V2R5UEhNaEZIempuWWppV3liN3hJWFp6MmpseGFKUkRMWjFwSWlYUEd4?=
 =?utf-8?B?Smg3VDFCR1NvNTlBekdBNHdxN1Zsb1lBTXhSYVlVZlNmQ3BnaDlxZEJiTVU4?=
 =?utf-8?B?Q1ZBSlV4WitzR2dtLyt4MndYUTc3LzFlZFhyTGh3QTNyOFhEdUVSMWdidXQw?=
 =?utf-8?B?NUN2b3V0VCsxaVdvTVRQdGsyb1dMTXEwZjVMWFg1RW1XaW9qd2hWNDRMSHpX?=
 =?utf-8?B?ZEdIZ0crMko2THNwZXEvMFhPRENsaWIyWG40aVZVRVVXU29Oaml6TE13b3dV?=
 =?utf-8?B?VDFMUmdmYVYzMTRaUDZiRWdQbGVGa0Y5RXpJU2h1MGZtOUpEenp6RytZWVNF?=
 =?utf-8?B?TEx1b1dHb01OVzZvYXlGZGtVKzJmM0pkWjBya3pvU2hNLzQrQ1FnTms3M2J4?=
 =?utf-8?B?aE1KYlBhZ2JqaHB0UG92aFE1SDJJdHJabE9xM3U4YXJyNzV6U21qT1JrMFlC?=
 =?utf-8?B?Qmo4S0FJTUl6VnE4eGFLanY0L01xVUFlTkZvT00ya2ZzZEo1Y0xuaitlWVpu?=
 =?utf-8?B?MmVuT2ZYQ2laWGtyUWlydFNacUpLOUprNEZ5ZzJHMVJYaElBY0RGYmRVaEFU?=
 =?utf-8?B?Zkd4b0txVGxmOWJMdUQ2UExSVlZOSG1Tck9yd2RKLzFNclpuZHR0UFNiL200?=
 =?utf-8?B?UHBOSStGT0YzZWt6YkNnYUtWdmtoeVBOdEtydUE0RHRiRkNDQmk5SW5LTHc4?=
 =?utf-8?B?c290N3JuTHcxU2lXYnZUdm5QVnhTNzR3Ym1INmQwOW1sMGlBM0Q5bVZ1bUQ5?=
 =?utf-8?B?OEU0anBlVC93UXdPbXI2aWtRWjhkYnFyek55aVlQaW5od3VIelZ1U1Qwd1d0?=
 =?utf-8?B?bVowR0tPQ29UOGhoQUlyTC9yK21rSU9mNHowTHRscU81bXdaMXdOMU56elNx?=
 =?utf-8?B?RW1ZRTJ5dzh5YkgxSzcwQnRvVXZkUzM3TCt3b0s3am5wQmUxRTdBMi9mZi9n?=
 =?utf-8?B?Y056d1JpMG9oM3ZGd1RjMzJSeGtFWjEvSUhVTzV4UnVJM09iZDUxbGc4eTU1?=
 =?utf-8?Q?4cIR76ZeOgtrZnspkVcUGqg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50011865-f1c2-4854-7d1f-08d9e65aab4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 14:45:34.6872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kirfvs8Nc8e2tJHnyBZyCovx/yFGl9Lx4S5e67OnSMD+kNSCCAT49uPTNX4l4pyrPd6Iu6E8bW5PzYoHHK0tiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4506
X-OriginatorOrg: citrix.com

One of the boxes where I was attempting to boot Xen in PVH dom0 mode
has quirky firmware, as it will handover with a PCI device with memory
decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
with a RAM range on the e820.

This interacts badly with the dom0 PVH build, as BARs will be setup on
the p2m before RAM, so if there's a BAR positioned over a RAM region
it will trigger a domain crash when the dom0 builder attempts to
populate that region with a regular RAM page.

It's in general a very bad idea to have a BAR overlapping with any
memory region defined in the memory map, so add some sanity checks for
devices that are added with memory decoding enabled in order to assure
that BARs are not placed on top of memory regions defined in the
memory map. If overlaps are detected just disable the memory decoding
bit for the device and expect the hardware domain to properly position
the BAR.

Note apply_quirks must be called before check_pdev so that ignore_bars
is set when calling the later. PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS
needs to be moved into pci_regs.h so it's defined even in the absence
of vPCI.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use mfn_t parameters.
 - Fix boundary checks.
 - Ignore memory ranges with 0 size.

Changes since v2:
 - Unify warning message and store in a static const var.
 - Rename checker function to is_memory_hole.
 - Pass an inclusive MFN range to the checker function.
 - Remove Arm implementation of is_memory_hole due to lack of
   feedback.

Changes since v1:
 - Add comment regarding pci_size_mem_bar failure.
 - Make e820entry const.
 - Move is_iomem_range after is_iomem_page.
 - Reword error message.
 - Make is_iomem_range paddr_t
 - Expand commit message.
 - Move PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS.
 - Only attempt to read ROM BAR if rom_pos != 0.
---
 xen/arch/x86/mm.c             | 23 ++++++++++++
 xen/drivers/passthrough/pci.c | 71 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h          |  2 +
 xen/include/xen/pci_regs.h    |  2 +
 xen/include/xen/vpci.h        |  2 -
 5 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1397f83e41..98edf5b89c 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -783,6 +783,29 @@ bool is_iomem_page(mfn_t mfn)
     return (page_get_owner(page) == dom_io);
 }
 
+/* Input ranges are inclusive. */
+bool is_memory_hole(mfn_t start, mfn_t end)
+{
+    unsigned long s = mfn_x(start);
+    unsigned long e = mfn_x(end);
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        const struct e820entry *entry = &e820.map[i];
+
+        if ( !entry->size )
+            continue;
+
+        /* Do not allow overlaps with any memory range. */
+        if ( s <= PFN_DOWN(entry->addr + entry->size - 1) &&
+             PFN_DOWN(entry->addr) <= e )
+            return false;
+    }
+
+    return true;
+}
+
 static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 {
     int err = 0;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 1fad80362f..e8b09d77d8 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,6 +233,9 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
+    unsigned int nbars = 0, rom_pos = 0, i;
+    static const char warn[] = XENLOG_WARNING
+        "%pp disabled: %sBAR [%#lx, %#lx] overlaps with memory map\n";
 
     if ( command_mask )
     {
@@ -251,6 +254,8 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
+        nbars = PCI_HEADER_BRIDGE_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -267,11 +272,75 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
+    case PCI_HEADER_TYPE_NORMAL:
+        nbars = PCI_HEADER_NORMAL_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS;
+        break;
+
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
+
+    /* Check if BARs overlap with other memory regions. */
+    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
+        return;
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
+    for ( i = 0; i < nbars; )
+    {
+        uint64_t addr, size;
+        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
+        int rc = 1;
+
+        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
+             PCI_BASE_ADDRESS_SPACE_MEMORY )
+            goto next;
+
+        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
+        if ( rc < 0 )
+            /* Unable to size, better leave memory decoding disabled. */
+            return;
+        if ( size && !is_memory_hole(maddr_to_mfn(addr),
+                                     maddr_to_mfn(addr + size - 1)) )
+        {
+            /*
+             * Return without enabling memory decoding if BAR position is not
+             * in IO suitable memory. Let the hardware domain re-position the
+             * BAR.
+             */
+            printk(warn,
+                   &pdev->sbdf, "", PFN_DOWN(addr), PFN_DOWN(addr + size - 1));
+            return;
+        }
+
+ next:
+        ASSERT(rc > 0);
+        i += rc;
+    }
+
+    if ( rom_pos &&
+         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
+    {
+        uint64_t addr, size;
+        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
+                                  PCI_BAR_ROM);
+
+        if ( rc < 0 )
+            return;
+        if ( size && !is_memory_hole(maddr_to_mfn(addr),
+                                     maddr_to_mfn(addr + size - 1)) )
+        {
+            printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
+                   PFN_DOWN(addr + size - 1));
+            return;
+        }
+    }
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
@@ -399,8 +468,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
     }
 
-    check_pdev(pdev);
     apply_quirks(pdev);
+    check_pdev(pdev);
 
     return pdev;
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5db26ed477..3be754da92 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
 int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
 /* Returns the page type(s). */
 unsigned int page_get_ram_type(mfn_t mfn);
+/* Check if a range falls into a hole in the memory map. */
+bool is_memory_hole(mfn_t start, mfn_t end);
 
 /* Prepare/destroy a ring for a dom0 helper. Helper with talk
  * with Xen on behalf of this domain. */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index cc4ee3b83e..ee8e82be36 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -88,6 +88,8 @@
  * 0xffffffff to the register, and reading it back.  Only
  * 1 bits are decoded.
  */
+#define PCI_HEADER_NORMAL_NR_BARS	6
+#define PCI_HEADER_BRIDGE_NR_BARS	2
 #define PCI_BASE_ADDRESS_0	0x10	/* 32 bits */
 #define PCI_BASE_ADDRESS_1	0x14	/* 32 bits [htype 0,1 only] */
 #define PCI_BASE_ADDRESS_2	0x18	/* 32 bits [htype 0 only] */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3f32de9d7e..e8ac1eb395 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,8 +80,6 @@ struct vpci {
             bool prefetchable : 1;
             /* Store whether the BAR is mapped into guest p2m. */
             bool enabled      : 1;
-#define PCI_HEADER_NORMAL_NR_BARS        6
-#define PCI_HEADER_BRIDGE_NR_BARS        2
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
-- 
2.34.1


