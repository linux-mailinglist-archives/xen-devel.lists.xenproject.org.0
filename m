Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3D45044A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225856.390134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmawg-0005Xc-KA; Mon, 15 Nov 2021 12:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225856.390134; Mon, 15 Nov 2021 12:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmawg-0005Vk-Fy; Mon, 15 Nov 2021 12:18:46 +0000
Received: by outflank-mailman (input) for mailman id 225856;
 Mon, 15 Nov 2021 12:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmawe-00053F-U7
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:18:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b75dc76-460e-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 13:18:43 +0100 (CET)
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
X-Inumbo-ID: 2b75dc76-460e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636978723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6UWIkEpB/eZGmwzOcsWWGdRLAqnZMQ/AfOheDTgEEyw=;
  b=Rv9TByu7s6/U50x5sjRMWKYS9dwEqITuB5nPWWthq1gA+HIaqq4jahqL
   lYWVY4+Ra08ZbyCr3MvBH7IenuN0pNuWfdbHbQiXEwZKUk8nRrYzMhhUV
   sZ5p7DwlM/K1sD0akl789lm7uVV26wZAchnTJJY6E7/VrQfbk5q/Rmlsh
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gY2jcILEfhyJ4L3xtYtkSc35EKoevNExjHqFOcl+VpFVroiFKNEPnGjs+bm/4nBQWsUasURAF3
 9iF8fv6bz5oFFQ0LKh4/7kxEAKK8fgWDohisrUReZ5N0vZJFe5+F8dq+vxou0ufWEnOg5ZpVDO
 vxX3iRrUT3+c23pXWRHMfEF/6V9HKnpHutRbxcmkh1A3efLb7iL9madGNzY6ZfbVfoY2JlOvyU
 xQt0HsPTL3PWNMbAUT5Dh7VW26oW6S1q0spuLdFoNg7yI07YXDuBinELc887uL3tdOQ/t+0tCT
 yF/6HyETXTah1PObPqyYfl7g
X-SBRS: 5.1
X-MesageID: 57851616
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tgNOpKuZeeX9+qEc/sWr5+FcZ+fnVKVZMUV32f8akzHdYApBsoF/q
 tZmKWGBOveJYTPyKItyaYm/80pV6pLUx9NgQQNq/H1mQnwR+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2IXhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplhKyrFSoELPPwqOUTDBR2IS9BGZN89+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258eQK+AP
 pRxhTxHak/bcjBWYBQtAZsvo8GOul7HTwUApwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krH4GbREhwcLMaYyzeO7jSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3L
 kUO/yM0oKsa9Uq1T8L8VRm1vH6FuBEHX9NaVeY97WmwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhruPyWRFCouOpeXOTqbq6nz2NHRYvIjpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZldtvl2/Y46z0u9uiGdJjaSM4EOT0/tPJZ3xorKp7
 CldwJj2AAzj4PiweM2xrAclQenBCxWtamS0bbtT834JrWvFxpJbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzqVZVzkfa9SYq5Cpg4i+aihLArLmdrGwk0OiatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l9UaKMmu14JNQ+90mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq67whEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:RNkvxqx0PjTjlNYcC59EKrPxsOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjmfZq6z+8L3WBxB8bfYOCCggqVxe5ZnPLfKlHbakjDH6tmpN
 1dmstFea3N5DpB/L7HCWCDer5KqrT3k9HL9JTjJjVWPHxXgslbnnZE422gYytLrWd9dP4E/M
 323Ls4m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 3+CNUcqFh5dL5hUUtMPpZyfSKJMB24ffu1ChPoHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57851616"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNr14cNc7l8q/41wtRBEodLxq7lKcztucCRNXtBT9IZus0ivuS7RPnd4tY2Y9Y3qOfMdVnpT4Qng3w12R0NkB8Yz7elMCXaQds3gsIZ+nAOlemyMyUh6F89W2dGpfMsg/V8GXAPSQBgMBkAfXkR1uhq15LuLzFYl7Yt8hczSPWEjv/dh4A8ccqSLq0S3qS+gWLhBojSBtRHmrtJBIEhU5JmaPEJU0RKc6U1zdh0h9WOh8yTPzl8y4gPGGZ316UgoJKcZft4pRRwDyl0M+pe56PrlI2SR8nfGu5LJguZrfXlpea/avpRZ97nkcMTdm6m8UNcWTBPCcCr/wyBo1ZDhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30IYql6s76qwSQS6YX21BegD/gb/wXVIVUlLhStCcWE=;
 b=Ek220kWO8lJN2txWil+hFVkVBVL2tNdDQXYZmoWVNBiKah3FlONOLB3CLBAvJZIJACHWdNKyhRnIXDa6XXhKf8BjTY2Hqa6wcuqWdnxrkmx8n22YY7yJH5yLELbs0THZyqne2JgjKmZNRzZwZMflENNUMqtchS/7bo1/aACO/cw/Ua0wLrcyC0YEl69X57UG3d5sI8t3lP8opxq0bTiB+RGrXUbUZCq9fL3qrVgPkoQXfoRP/xuvezFhJLzOTJ8k9g17haqQwt6GdWHFT6/OBx0lTV44ENPGnPNFXk6vKOURSzWLEJTJKGwEjUOV971tcJLBja5yUGAxouxRdRLIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30IYql6s76qwSQS6YX21BegD/gb/wXVIVUlLhStCcWE=;
 b=m+ClrxgvehUUM2/v6zjiY3TBq/yVUr2iWmgSo68hJ8HBwowL7pYZpVZgnpm93Lwu42iwmrQvQ8FV59mCoM6Ty6QX95z/8Ndhi8TKnZMPXaCsogpucC07pXkIyM0h4GPIVlc7JVRIMP1a58CDpPw7h7+lq/MoVNKey+2eQvKyKHE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to pass a max grant version
Date: Mon, 15 Nov 2021 13:17:41 +0100
Message-ID: <20211115121741.3719-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115121741.3719-1-roger.pau@citrix.com>
References: <20211115121741.3719-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cffef526-c72e-462e-3648-08d9a831ffb6
X-MS-TrafficTypeDiagnostic: DM6PR03MB3483:
X-Microsoft-Antispam-PRVS: <DM6PR03MB348313562F8260A47A70910D8F989@DM6PR03MB3483.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLwJgveKsCFShvNZ+qwVmOmLTiRcNDkkPTFGTd1oaSgDI/7hAO4UsMBv2bNVBwKlXIehCBhVvS6HAee/hKuG1BRfHPv4HD94zVFADHa8SjDB9hq3HJ84mFGZj42NBUWtVocajaSAKtqr0IrYwXGDm0VEZSu/KbAB7/cQKleDdQqJJcDyA8x3qF9Cw5x4pAYmfQuiHPpH6xP9lP2PrdxpbyFVso5/Y4Hk4ZJb+ANbjlv9fl1R8MabyScKU+yRrzE1qjfayaZGk+1Q2B+v/PajKU5aeUMG30QZfrHdX0UBTfBz1g4/qW+WdSCeX+xAEmZtqEOoQaa21DpN4wbtN7fpZxHftzxI78IC3qyUPW/nqaBd/nxOHb+VN7OAkFN4kGpbJS7fAZWrHZpv7emDuA2quh0kyA5vYuAUhlh0OuCFEOiGSUT+OCehT0BKsmI6PDCF6VNHtsdSvz5ksk23Vja6WrQEZlb7SZbADAawux9ZlfrC990AcBdmMa4cq1lQIUaczA3FIIAXXtW9TA5CjlaOrn+pqAjRGfuNtL1a8QrDqDpeB5WXvIIGrHou2QWHIZMJ9PbudBSgzk6UyOJt1cczrRe3vLxshaD0ZQGxdE5ix5iZb9yBtswzeGHsZ9f82KB2t6HF8023QzVynt7ugPpHaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(82960400001)(86362001)(38100700002)(66946007)(66556008)(66476007)(186003)(2906002)(508600001)(5660300002)(6666004)(4326008)(6486002)(8936002)(36756003)(83380400001)(2616005)(956004)(54906003)(6916009)(6496006)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXB3VXVHT1VWdVU3SlZpV0JDN1Nwa1JJSnVXeXN6Vm5WZ1lkRmhGQ3dYWk1I?=
 =?utf-8?B?MERzakRBL1Q1YXRSbGFSdHIraWxBYWU2NWVmY2lQV1B2NmRNcHdOL2JHS0Ny?=
 =?utf-8?B?VkliMzZ1RkhKU09sT3RYbXZtbDJRSkhNbVZqY3VTUWFaWGs0Qkt0S0VPK1du?=
 =?utf-8?B?NmtBcGVSV0hTWmlJTlNIRysvVG5jeHZFbWRtQ0RuZFRMSmdiM1JPSEx4YVF0?=
 =?utf-8?B?YlovMk8vbXpGSGRScEY4cEJxcFgrS25jd0N3dURyZWcxc0JRNHdDenY1d0M2?=
 =?utf-8?B?d1doVzdISm1KQkpRTmxlL2tzLzBmdnZtMUh1c1ZqbWRlWjVQempWTEl6SjFJ?=
 =?utf-8?B?K05wMnNzdENBRjJnS0FPdU9pVlMycFlhYWp0Z1g2eUZRNXlUcWpGVjJ5NEtl?=
 =?utf-8?B?STAwY2tLbFB0b1c5V1JmNlhLRmdwbVYrZG03d1Z5UGp1Nm5ZeUs5bDN2eHFv?=
 =?utf-8?B?NnAzc3NsUTZxYURjenpMUTl0Qzk1MUsrZFBCOGhoMjh1Ulo2R1gvUE96dnlH?=
 =?utf-8?B?TlBOK0tJWTdqUWVsRS9OUkd2NDRUNGY0eWNnWmhtRkpmckJ0OEV2d1VkZW9O?=
 =?utf-8?B?dVM1dFRuekI3VDE1a0J0b0NZbWczT1R1TTdZK2tuWXhGR1BWRGcyRDk2YnBj?=
 =?utf-8?B?RXlEOEdMZG40cEpwVDhObzh4d1dzNmdyOEk5cTcrWmwrNTZIWkcySmYwZkla?=
 =?utf-8?B?Q3NuZG5IMWU3KyswY0ZpeUlORFhEb0RjcjdwS25QZUtTOVM5R1VGVVJuMDNT?=
 =?utf-8?B?U1U1R2taM1VlUE91a3FNUGg2bHluaXdaUElkOUlkcnVpS0t2VWVzSkFURUtT?=
 =?utf-8?B?ZGkzaDVtekozQUJrc3lXRnB2TERpblo0Wm1jVElzSG9OK0Iwb0ZBK3R5dmlu?=
 =?utf-8?B?MmJwZTY4L0llQlY3TjB0TEhVYzJJRkd6VlhqOWd0bGZ6aE5HTlRJUTlNeDgx?=
 =?utf-8?B?SnAwOTR4OVdUSDRobnN3M0xSc0xkTFhkZU5HdHdpUHJMMjNoV1VIMFg5Zys2?=
 =?utf-8?B?SktNSXRxSE8xZGtkR0dNMDhtZUNvMDBQL0ZqRTEyMHNYV1NyWjFpWFVLMi9a?=
 =?utf-8?B?MXQ2cEpadmc1QjNDWHBpd2tvWkRpcVNydmFCRGZFNE04bWFaK2hKejFCUTho?=
 =?utf-8?B?bWxrVTFCRnVoMnNhTGpUM2dLejZlNnllU2N0YWFTRWpPMUhrUHFwUVZleGtu?=
 =?utf-8?B?U2Y1bVZmQ09SZjZUNmZPY3dzYXBBZzhsallndFZaMVBYOS9yNXpXekttbWpF?=
 =?utf-8?B?NDMvbFFhbUx5Vm91VjAzREJDTE5ZaUlkN2pDbFY2M1FDV2ovQ1hySEdjeEIz?=
 =?utf-8?B?ckNhLzhsaUJERXAxSnNHbmdNbFpjT1h6WHpKVHJnM0l2TUJGaUNKd1A0YlZk?=
 =?utf-8?B?SFZqVUgrQ0hRaERCZHRSbHlueERFWitNMGZBVGlnS2FaYWpOSkl3TzBmQjBw?=
 =?utf-8?B?NTU4cW5VVTFycFAxMlIvT3hEQ2tpL1hyb1lxSnpFV3NvN2FrSEVISkZFWWdi?=
 =?utf-8?B?UytaK3MvWkNRQmNRUkxIVFZ3VzByNmFCUElYWk9wOWhCNlIwTG9YL3JXcjMw?=
 =?utf-8?B?Z3h2Y3VtOG5tTzFUR3Q0c284WmhSRUp6S1hUY1RFOUR4NUM4UUI1L3B4RGQx?=
 =?utf-8?B?bDhoRWtFUzg0NTF1aXJEY0hyTktmdGd4dGVqTjI2QUJFWFhMMlBDNnFySGQw?=
 =?utf-8?B?K3RXQmQ1UmhCTUxqZFJGMDNuUEdmamQ1S3AwaFoxV3JSbUpGTDBXUkhuL3NX?=
 =?utf-8?B?ejI0YlBNaUtORFc0dThwR1g0eE5iZWZ1NVJaMkNWUFRqS1JoWUJidU1nbGJE?=
 =?utf-8?B?aWRTc1VPV1pqazF1WUU0bFJEQjhkR1dBMGhpaVAwUjUxSTU5MnlyYTQyY3dZ?=
 =?utf-8?B?RUh2SS85RkI4ZmF1TzVKOW8xb1BxamJTUitmZmI4YTBob3lXTElDT2hBNXAw?=
 =?utf-8?B?OHJJTHpHamNXY0x3KzN0RG5paGpCVk5vSktvYktJeGVKbkRTZWxkajdBaVFX?=
 =?utf-8?B?TWVtRnBwcGl2QXdETmtQTUxiVUM4cFpVcWNsb0hlT0VxNTFwUDBrcnNmN0cv?=
 =?utf-8?B?RTdXS0VEV3JnVi9HaWxhQy9FTThzd1FTRm5tK0dUUE5STGYrdFJlOC9sWDNT?=
 =?utf-8?B?SFdSVkFaSkhLMjh0eW1aR2hEemdtTGg4b3N2aDJiZCtKS3Fad09hTDZKU2pt?=
 =?utf-8?Q?KxxHaclpx12DR76/OSNqseo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cffef526-c72e-462e-3648-08d9a831ffb6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:18:14.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zH5YOAWrqjyo3YUUYUXlM0eEGu5YQaDxVZoyIkAgMrXReWDbaz3p2s37SnqxHC9OwCI20Bl4EYJyEq+Q+fdNjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3483
X-OriginatorOrg: citrix.com

Such max version should be provided by the caller, otherwise the
bindings will default to specifying a max version of 2, which is
inline with the current defaults in the hypervisor.

Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>

Without this fix the python bindings won't be usable, as they will
attempt to pass a max version of 0 which will be refused by the
hypervisor. The main risk would be breaking the bindings, but given
the current state it's unlikely to result in a worse outcome.
---
 tools/python/xen/lowlevel/xc/xc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 6293d205a3..fd00861032 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -116,7 +116,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
                                     PyObject *args,
                                     PyObject *kwds)
 {
-    uint32_t dom = 0, target = 0;
+    uint32_t dom = 0, target = 0, max_grant_version = 2;
     int      ret;
     size_t   i;
     PyObject *pyhandle = NULL;
@@ -132,12 +132,13 @@ static PyObject *pyxc_domain_create(XcObject *self,
     };
 
     static char *kwd_list[] = { "domid", "ssidref", "handle", "flags",
-                                "target", "max_vcpus", NULL };
+                                "target", "max_vcpus", "max_grant_version",
+                                NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "|iiOiii", kwd_list,
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "|iiOiiii", kwd_list,
                                       &dom, &config.ssidref, &pyhandle,
                                       &config.flags, &target,
-                                      &config.max_vcpus) )
+                                      &config.max_vcpus, &max_grant_version) )
         return NULL;
     if ( pyhandle != NULL )
     {
@@ -162,6 +163,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
 #else
 #error Architecture not supported
 #endif
+    config.grant_opts = XEN_DOMCTL_GRANT_version(max_grant_version);
 
     if ( (ret = xc_domain_create(self->xc_handle, &dom, &config)) < 0 )
         return pyxc_error_to_exception(self->xc_handle);
-- 
2.33.0


