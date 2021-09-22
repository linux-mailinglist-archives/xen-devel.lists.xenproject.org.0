Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C24143A7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192258.342646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxWd-0007VH-BN; Wed, 22 Sep 2021 08:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192258.342646; Wed, 22 Sep 2021 08:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxWd-0007SO-7q; Wed, 22 Sep 2021 08:22:43 +0000
Received: by outflank-mailman (input) for mailman id 192258;
 Wed, 22 Sep 2021 08:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxWb-0005Fo-Tu
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:22:41 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35cc969e-1b7e-11ec-b963-12813bfff9fa;
 Wed, 22 Sep 2021 08:22:22 +0000 (UTC)
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
X-Inumbo-ID: 35cc969e-1b7e-11ec-b963-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=p/2j7Qh3HRSjw1xZ6iz4Wwt7riuFKipEEnPAZ4kgGQU=;
  b=eYyMA264UqhRZxFPd+pUO0ecxiTf3lSb+TFvanhckpG9b8xlmMAxMt7H
   W37JfVxXLXsRAdBLIUrtxBoAH8JLNLRqSOjrXFP4SSibQOAciHL6bJ2xa
   MZZXBuHCrIsXKNxYwlc7cLNVveI25QDJ5vcQWXRepFt8tgi/TGB46duD+
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E9Xy6cmS7skkVJ/00AE9peAha+sSimph+icGRWBCy3G1U/wJ8eDyf3rBAytbXX3Bti/8iGc6LP
 LTwYk5FJ4w4+mG8MXycpDJbic+vulB0Du6vTfBw/ROcI6QZoayKA794RkLWEvuhz0Gs5IxrJDa
 l80ou6qxsjVjXMLqJDy1GQnSS1EZir1YOEZJA/fNgYemge8XAhteTu9o4/ku4rWpNPOX4hvnKB
 QXvqS09MTBAF0/d1Zou2OpTIBGNKVtK//g2q+d6Id5WujGVpmfqZcsI03m8zLNVZgs2gskG3p7
 5aWCv9x6HeHwuRJVUMa8aGb5
X-SBRS: 5.1
X-MesageID: 53294561
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tf0Sc6t0Z1W2azd165+IJcju/efnVMZZMUV32f8akzHdYApBsoF/q
 tZmKTqOOP6CM2KjKtFzbIWx8x9XsZTTmtQwGlRt+C0xE39H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524LhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6o6QVw0RN7f3lr4SfkV9FAxABqpb9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sUTKqDO
 ZNxhTxHcBrGTAZ9OlYtEL0Dm973qSnGVDpxpwfAzUYwyzeKl1EguFT3C/LXdcaNXt59hVuDq
 yTN+GGRKgoBKNWVxD6B83StruzChyX2XMQVDrLQ3sBthFqf12kCEio8XFGwoeS6okOmUtcZI
 EsRkgIipLY/3FamRd78W1u/unHslhwBX9tdFcUq5QfLzbDbiy6YGWosXjNHcMYhtsI9WXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLoos+kxbORdZLC7Oug5v+HjSY6
 y+OhDgzgfMUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTNG3R5Ki0VHB1vgaI6vFa16sg
 kMDhsfLuYjiEqqxeDyxrPQlRe/yva/VbmGE2DaDDLF6qG/8oCfLkZR4pWgkfRY3aJ5slSrBP
 ReL0T698qO/K5dDgUVfWIu3F81i5qzpD92Nuhv8P4cWP8QZmONq+khTia+sM4LFyxNEfUIXY
 87znSOQ4ZEyU/8P8dZOb71BuYLHPwhnrY8peXwe8ylLLJLEPCLFIVv6DLd+Rr9gt/7VyOkk2
 /1eK9GL231ibQEKWQGOqdR7BQlTdRATXMmqw+QKJr/rClc3QwkJVq6OqY7NjqQ4xsy5YM+Tp
 SrjMqKZoXKi7UD6xfKiMCE7NOy3AsYh8hrW/0UEZD6V5pTqWq72hI83fJorZ7g3sutlyP9/V
 f4efMucRP9IT1z6F/41MfERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:UlrRyK61ZP/PnGa36gPXwVmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXJVoJkmsiaKdgLNhQItKOTOJhILGFvAF0WKP+UyDJ8S6zJ8n6U
 4CSdkONDSTNykCsS+S2mDReLxBsbr3gJxAx92utUuFJTsaFZ2IhD0JbTpzfHcGITWvUvECZe
 WhD4d81nedUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInxy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXwIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6r9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFP9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcEa+d
 FVfYPhDcttABanhyizhBgq/DXsZAV8Iv6+eDlAhiTPuAIm20yQzCMjtYUidzk7hdQAozQt3Z
 WxDk1SrsA9ciYhV9MKOA4we7rFNoXze2O4DIvrGyWeKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53294561"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM2BnFBSgG6pTY6Bi7x+SyBFQcp+ufv76WDvxpubLUYyJHeQ1oOM57SDAIS6Bl6zqFHu0npOFGEgtH2EkrLgUdkjw4SQKIv7BuTDtrNIAlQS7dTQsJ93t6OqU2cYLib5njubvNUU33OtYd3txLrK75xorT8eAYDvmNi+ZBhNwGl2o0D3LO0c3MhJNBdofc3jhKHGEhuAzt8ylkl0diOQz+mZBaifrfRTDadJvMZxsuJtmwHhwBAW+a/X5uBmBhDVs9wcwd7uYTd+9BtpZVuL3g24yx7jAEKi8Pp5wPMkP8dgCcKBthSSw6NUC30KQ34nmKfcOoyau3UjJ01Y8ReerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=voNJG1FSxj3tOQiI/DkvvHkabCshBBjpOakCSWaIsGg=;
 b=aO4LVvvH6mZBIk4/cC8PEK15NQt5RhbRxJYjZz0j35uuHWofCDoK6d4CxW8FXfYegrfYY7DTeCZF+TBnOoGUsW6jCtmGfI6foQ9IuQxaqaqs8NNOsFaXbOVSv1o5siCzfREiFPXd2k6vkMXEvurG7+3eP8gw3Da0HRGJR9bLyHjUzCOOS/haJYWkE+uRbGePLK11uOaWNKx8MZEeCOhlKCSGPfqY5NnuFZhFVg3whXJB8Co/W0DLFcYq+/54m0NHdrgBe2QNq9u4I2faAsTtPv8iO631s3K3zpaMmIwP222mRryuvdIuyxfp/U9H1gYRzrIlW+SYjFl+OSTW/mb6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voNJG1FSxj3tOQiI/DkvvHkabCshBBjpOakCSWaIsGg=;
 b=FG51XV7BSa4qpXeEfpZkE/mFtMwhNSk/u9QWoW8fdXwtSKZGYytp4mb0/7hZPi15lu1hQWmZSDJrm902vrJ6REueg9IIWoyNfdYE6gIpr5TjTP8CRgBi+rOxn0xDXAYpNEexfniwhGvuLvIWyth3YaGECDThyDSOWYh6i6KbExw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/6] gnttab: allow per-domain control over transitive grants
Date: Wed, 22 Sep 2021 10:21:20 +0200
Message-ID: <20210922082123.54374-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0347.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::10) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ca136c5-6a57-4cfc-589c-08d97da20c24
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB401518E3905D15760968E9128FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fb9ovAOT/IvtJ20NdrpGwl+BRjujympR1hO2wXO3CVj2J4aUFqwsRgg6L8St5mivgw64bPjQGLpq4Ijssqs0zwfbmKH75yLoHGphzLBYJXqOiQ3kwl8SjZyfRz93HnlMpv099XxUtFXIH9WqkYSR8TtaD1xnZq5QcKyIxvcaRDR/U8BKn8qizsCKfBrx3SSv7Y8qLHZaq1dhmBvQ0GwKc1nvxJ4KaiHa9e6vTyzdH1TN3Z0InKbOmGVM1CPKuyofquX/DB5Zbt0OuU3fQxM8KxYZRbORVrrTr97eYFVZ0f57YTyAd/rEY/eT4RQHQZjFkk4jcJx5eKJR5n0epYNYRwoBt3UIRxGeb+bXkcqDthOfPBPVW+GgR/mHYjKRYBzdtCvILQe7ULW1VIHGl4wXl92CNNW/QtLSrO78lxcwdrPeof8iq0eYkN0WFuT7eFOP8ID/tK2DH2oVUwou0+sc6FshGLJdJBbOtRblQlKHB9+OVMOxfr1M9tAKBVluD9fShAO8o9EyUbRbmBTApJR2pILdhg76CS/MoKeQrD7HrDDNLQucp2zNM0dPmiPLMFvcz70NcYaJ1uyB26c5Yt0qnmNGLp9snTVw7s2xxsJU8bxg2e/DPSSLOWlFOpPhQ4iq2qCZbjMnwzyEJ6TUnwchSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(30864003)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk1CdWdnbXFLK2RCQ1NUd2VtTnp4Y1pQRldSQkFQOVJkOEgydm0xaGYvV2Jl?=
 =?utf-8?B?c2srSXZFT3ZPSjFvRnlKWUpJcjNYNGx2YmYyWitXd2x0emoyL1JMVVpFOUJG?=
 =?utf-8?B?R3hNK1FUaFNTVWRYcEdxeC9pNlpiZ3dhcFdsQlUzbmxDclR2RjNUTm1hcDND?=
 =?utf-8?B?YW1JUTdWVC83M29xNi9IY0wvZmNKNForOEVteTJpbE1IOWRTeW40M1ErY1cy?=
 =?utf-8?B?b0dHa0tZRDQwTXYydXU3N2Z3Ykp0NjdzKzV1V1A1d3hBTDZYTmFQSkVUSEx2?=
 =?utf-8?B?SjBHZzBuczJFTEQrTE9sV1dBdTg5S1RQL2krd1ZCNFhlN0JQdzJ1dzRrZ1U1?=
 =?utf-8?B?b2tWVnR6ZmhGNDdueE5jUk9UKzVsUVYyaExLNVE2YzBKMjlhL0ZVUVR2QVZj?=
 =?utf-8?B?b3R1Smx2cFpVaE5LcGNORTRMeXRqVzRoYXpCZlJVR0JvRTF0bHg2TTI1R2tj?=
 =?utf-8?B?Qk5HR2NZbDNXK1ROdGprSTFjVTJVL2FvUDlCZEM0ZkJCS2V1V0pZNkNIQ01Q?=
 =?utf-8?B?TUdVb2xlbGZKaHVDNnY1WGViUW0zb3hJZTZTcVNES2phbUgrbkJRZTh5Q2dX?=
 =?utf-8?B?dzVrTFZZa0FFeEN5OEZjQ0EyL3BRUmhweGVxczV5aG0zbjdpeHVLVURCSXZV?=
 =?utf-8?B?UzFoL2R2VEV5Z2hYMmk4NnJnYmR5Z2tKVHZDRG4vdmJVZmlnc1JLZXZMSkZY?=
 =?utf-8?B?em9oQjlXdVQ0cWlzMGVzOWxwRnIvb0FIbnJ5YktJQm94Z2duTW42NzdtNGZr?=
 =?utf-8?B?ejlhTlFQT1h0b1hpbXc5THMvR1BhQkpHeS9qc2NQeGhIaHcxNDdFN1Q0SGhz?=
 =?utf-8?B?RS9TMUtPOUdDa20xYTV5Vy9HcmxtQlY2ckpTNXU4MHluQlY4aDcvV0pSSnN6?=
 =?utf-8?B?MFRTbWUyM2xZa3g4aE1nMzdZUlQwYk5HZ1dZTm1QQ21QQ3plUmpIZVhSOXF0?=
 =?utf-8?B?Y3U2OEFCSk5BdFYwdFoyaEZTaWU3YlcwSkhPQkVoRkZkR0JucmVxbzF3WFNj?=
 =?utf-8?B?QkhobnMrVUFUSitURmVTeWtCNU9Oa1NxRHNmcG9SdmdNc1A2TDZDWnpEVUZH?=
 =?utf-8?B?a05oSEFTc3Jnd2J5eUNxWGpIbXNQNnpzVWNrS2szSHc5cUYxU01oRXBhU2sy?=
 =?utf-8?B?WG1TaFZGc3ZyQlJaenZtdE5tQ2RKUDBVWXRzVVJVcWJDaTBBdmczSEJBL0xm?=
 =?utf-8?B?OS9qZnBKZERRdU5vR0ZVdmVQckNYSWhIOFVZMzFOd3Q2R3hmSHljRm5DOXpC?=
 =?utf-8?B?SlJBd24xYmZMSC9vL3hHY1lMTmJzSmowUGZVbHR2NE50NS9iZUJzcGQ4VTg0?=
 =?utf-8?B?alRVdG0wamVOa2dXWjVCYUFySHlZR3Q5OWtTNkdvOUxFQ1ZwK2JGN3pzRFo0?=
 =?utf-8?B?d29ndkhVdTBIV1NTalJ4eVpDcXA2UGVXQUl2SWlYM2FTNWFiQ1B3T3JpRzc5?=
 =?utf-8?B?TFRSRmJNWVdENkRqaWxRMm1qZzJ2bWtOVkJzVDJOcjhDQU0rOUFvS3hCUlBY?=
 =?utf-8?B?UGEyVFNzM0JiZnRDSEFkajV2blhlcENLeVEzS3Q0UHN4OHVWV1ltN3lvRGN3?=
 =?utf-8?B?RGR3RlR4dkRQVFZCU1VtQTRsb2RVeFptZlkxMEdMTFVLcEVoakNLRlpqMmpu?=
 =?utf-8?B?M2x5b1BFc0V5ekxTdFhQa0liTDZuYmROajZCRDV2OTM5M3AvZlZ0eHR4TkNi?=
 =?utf-8?B?UGdMRXBLVHljeWVNUyt2K1g3QUdFaHYrd2tMQW84N0VEN0YvUHdzcFY0ajZU?=
 =?utf-8?Q?9YA7D96jY/ECtx6kUENn1CFX4UxxmUCWb6qBT8l?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca136c5-6a57-4cfc-589c-08d97da20c24
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:21:59.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKnVEWxnaLZQwW6H8sOjylWgwny0NFsk/6fte9KeEnMR01kJViYm20Lvt4Kr43/xULkKcfZ79TRJegFFM8C1Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

Introduce a new grant options flags field in domain create and use it
to signal whether transitive grants are allowed on the domain. This is
settable from xl using the transitive_grants option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in            | 6 ++++++
 docs/man/xl.conf.5.pod.in           | 7 +++++++
 tools/include/libxl.h               | 7 +++++++
 tools/libs/light/libxl_create.c     | 3 +++
 tools/libs/light/libxl_dm.c         | 1 +
 tools/libs/light/libxl_types.idl    | 1 +
 tools/ocaml/libs/xc/xenctrl.ml      | 1 +
 tools/ocaml/libs/xc/xenctrl.mli     | 1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c | 7 ++++++-
 tools/xl/xl.c                       | 7 +++++++
 tools/xl/xl.h                       | 1 +
 tools/xl/xl_parse.c                 | 4 ++++
 xen/arch/arm/domain_build.c         | 6 ++++--
 xen/arch/x86/setup.c                | 3 ++-
 xen/common/grant_table.c            | 8 +++++++-
 xen/include/public/domctl.h         | 5 ++++-
 16 files changed, 62 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index a4bf2caafa..c5a447dfcd 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -586,6 +586,12 @@ Specify the maximum grant table version the domain is allowed to use. Current
 supported versions are 1 and 2. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<transitive_grants=BOOLEAN>
+
+Specify whether transitive grants should be available to the domain. Note such
+functionality only applies to grant table version 2. The default value is
+settable via L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index 0a70698a7c..88efbee5fe 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -108,6 +108,13 @@ Sets the default value for the C<max_grant_version> domain config value.
 Default: value of Xen command line B<gnttab> parameter (or its default value if
 unspecified).
 
+=item B<transitive_grants=BOOLEAN>
+
+Sets the default value for the C<transitive_grants> domain config value.
+
+Default: value of Xen command line B<gnttab> parameter (or its default value if
+unspecified).
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 7a35833312..d23586f2cc 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -509,6 +509,13 @@
  */
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
+/*
+ * LIBXL_HAVE_TRANSITIVE_GRANTS indicates libxl_domain_build_info has a
+ * transitive_grants field for setting whether such functionality should be
+ * available to the domain.
+ */
+#define LIBXL_HAVE_TRANSITIVE_GRANTS 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 1ee86602ae..fa527923e4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -635,6 +635,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
             create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
 
+        if (libxl_defbool_val(b_info->transitive_grants))
+            create.grant_opts |= XEN_DOMCTL_GRANT_transitive;
+
         /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
         libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9a8ddbe188..4ade437257 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2321,6 +2321,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
     dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
+    dm_config->b_info.transitive_grants = guest_config->b_info.transitive_grants;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 37789a568c..d05b5d2abc 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_grant_version",   integer, {'init_val': '-1'}),
+    ("transitive_grants",   libxl_defbool),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 6a8658bfec..da12b67baf 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -84,6 +84,7 @@ type domctl_create_config =
 	max_grant_frames: int;
 	max_maptrack_frames: int;
 	max_grant_version: int;
+	transitive_grants: bool;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 5933d32c70..83ca554eb7 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -76,6 +76,7 @@ type domctl_create_config = {
   max_grant_frames: int;
   max_maptrack_frames: int;
   max_grant_version: int;
+  transitive_grants: bool;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 1e60925069..5697a8bd8b 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -189,7 +189,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
 #define VAL_MAX_GRANT_VERSION   Field(config, 8)
-#define VAL_ARCH                Field(config, 9)
+#define VAL_TRANSITIVE_GRANTS   Field(config, 9)
+#define VAL_ARCH                Field(config, 10)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -216,6 +217,9 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		/* ! XEN_DOMCTL_IOMMU_ XEN_DOMCTL_IOMMU_MAX max */
 		(VAL_IOMMU_OPTS);
 
+	cfg.grant_opts |= Bool_val(VAL_TRANSITIVE_GRANTS)
+			  ? XEN_DOMCTL_GRANT_transitive : 0;
+
 	arch_domconfig = Field(VAL_ARCH, 0);
 	switch ( Tag_val(VAL_ARCH) )
 	{
@@ -255,6 +259,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_TRANSITIVE_GRANTS
 #undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 0fde879cf4..9bd398f8c9 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -56,6 +56,7 @@ bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
 int max_grant_version = -1;
+bool transitive_grants = true;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -221,6 +222,12 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_long (config, "transitive_grants", &l, 0);
+    if (!e)
+        transitive_grants = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index cf12c79a9b..d7f83c9abd 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -283,6 +283,7 @@ extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
 extern int max_grant_version;
+extern bool transitive_grants;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1206d7ea51..8e4e561df8 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1440,6 +1440,10 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    xlu_cfg_get_defbool(config, "transitive_grants", &b_info->transitive_grants,
+                        0);
+    libxl_defbool_setdefault(&b_info->transitive_grants, transitive_grants);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3beb1cbb41..b9048aa9cc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2649,7 +2649,8 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version_default,
+            .grant_opts = XEN_DOMCTL_GRANT_version_default |
+                          XEN_DOMCTL_GRANT_transitive,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -2757,7 +2758,8 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version_default,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default |
+                      XEN_DOMCTL_GRANT_transitive,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b5b6c75447..7ce54a5a57 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,7 +750,8 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version_default,
+        .grant_opts = XEN_DOMCTL_GRANT_version_default |
+                      XEN_DOMCTL_GRANT_transitive,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index c43e9d5ee4..f50e9f6a06 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -74,6 +74,10 @@ struct grant_table {
      * progress.
      */
     unsigned int          maptrack_limit;
+
+    /* Allow transitive grants. Only applies to grant v2. */
+    bool                  allow_transitive:1;
+
     /* Shared grant table (see include/public/grant_table.h). */
     union {
         void **shared_raw;
@@ -1965,6 +1969,8 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
     gt->max_grant_version = max_grant_version;
+    gt->allow_transitive = !!(options & XEN_DOMCTL_GRANT_transitive) &&
+                           opt_transitive_grants;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -2887,7 +2893,7 @@ static int gnttab_copy_claim_buf(const struct gnttab_copy *op,
                                     buf->read_only,
                                     &buf->mfn, &buf->page,
                                     &buf->ptr.offset, &buf->len,
-                                    opt_transitive_grants);
+                                    buf->domain->grant_table->allow_transitive);
         if ( rc != GNTST_okay )
             goto out;
         buf->ptr.u.ref = ptr->u.ref;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e2b47184a0..2f90e4c3f8 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -98,8 +98,11 @@ struct xen_domctl_createdomain {
 /* Grant version, use low 4 bits. */
 #define XEN_DOMCTL_GRANT_version_mask    0xf
 #define XEN_DOMCTL_GRANT_version_default 0xf
+/* Allow transitive grants. */
+#define _XEN_DOMCTL_GRANT_transitive     4
+#define XEN_DOMCTL_GRANT_transitive      (1U << _XEN_DOMCTL_GRANT_transitive)
 
-#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_version_mask
+#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_transitive
 
     uint32_t grant_opts;
 
-- 
2.33.0


